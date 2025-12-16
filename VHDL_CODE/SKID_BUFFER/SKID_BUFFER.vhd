--SKID BUFFER
--Skid buffer is like a fifo with 2 entries.
--Remember that DATA is accepted if and only if Ready and Valid are asserted.
--So even data is at the output register, but no hand shake signal agree, nothing happends.
--Data is always on at main register if available, we want push more, data will be stock at skidbuffer 
--and wait till main regis is fresh(free).
--    InputA                       OutputB
--    -----                       ------
--              -------------
--    ready <--|             |<-- ready
--    valid -->| Skid Buffer |--> valid
--    data  -->|             |--> data
--              -------------
--    data  ----------------> main register(priority when data is available)
--               |               ^
--               |               |
--                ----------> skid buffer()
--references : https://github.com/laforest/FPGADesignElements/blob/master/Pipeline_Skid_Buffer.v
--           : https://github.com/bensampson5/libsv/blob/main/libsv/fifos/skid_buffer.sv


library ieee;
use ieee.std_logic_1164.all;

entity SKID_BUFFER is
    generic(
            DATA_WIDTH : integer := 8;
            OPT_LOWPOWER : std_logic := '0';
            OPT_OUTREG     : std_logic := '1'
    );
    port(
        i_CLK     : in std_logic;
        i_RST_n : in std_logic;
       
        --from Side A
        i_VALID    : in std_logic;
        i_DATA    : in std_logic_vector(DATA_WIDTH-1 downto 0);
        --to Side A
        o_READY : out std_logic;
           
        --to Side B
        o_VALID    : out std_logic;
        o_DATA  : out std_logic_vector(DATA_WIDTH-1 downto 0);   
        --from Side B
        i_READY : in std_logic   
                );
end entity;

architecture RTL of SKID_BUFFER is
    
    type t_STATE is (EMPTY,BUSY,FULL);
    signal PRE_ST,NX_ST: t_STATE;
    
    --internal buffer to temporarily held "last data" and "last valid"
    signal SKD_BUFFER  : std_logic_vector(DATA_WIDTH-1 downto 0);
       
    --transfer wires   
    --signal i_VALID_SIGN    :  std_logic;
    --signal i_DATA_SIGN    :  std_logic_vector(DATA_WIDTH-1 downto 0);
    --signal i_READY_SIGN :  std_logic;
    signal o_READY_SIGN,o_READY_SIGN_NX :  std_logic;
    signal o_VALID_SIGN,o_VALID_SIGN_NX    :  std_logic;
    signal o_DATA_SIGN  :  std_logic_vector(DATA_WIDTH-1 downto 0);
    
    signal INSERT_DATA : std_logic;
    signal REMOVE_DATA  : std_logic;
    
    signal DATA_OUT_WREN : std_logic;
    signal DATA_BUFFER_WREN : std_logic;
    signal USE_BUFFERED_DATA : std_logic;

begin
    
    --Connects output with wire
    o_READY <= o_READY_SIGN;
    o_VALID    <= o_VALID_SIGN;
    o_DATA  <= o_DATA_SIGN;
    
        INSERT_DATA <= '1' when ((i_VALID = '1') and (o_READY_SIGN = '1')) else '0';
        
        REMOVE_DATA <= '1' when ((i_READY = '1') and (o_VALID_SIGN = '1')) else '0';
        
        --Control output data BYPASS or KEEP in BUFFER.
        --Case 1:  Empty data, if insert command(only because no data in regis to remove), we put input data directly to output register.
        --Case 2: Busy(already have data at output regis). If insert and remove concurrently, so input data will move directly to output regis.
        --			because no old data is remove from output regis and we have fresh data.
        --Case 3: Busy. If we want only remove data. So data can be out, no more writing into output regis or buffer.
        --Case 4: Busy. It we want insert more data. So data must write into buffer.
        --Case 5: Full. no more insert data. only remove data => data is removed from output regis. Then we need write data in buffer to output register
        --			in order to keep data in order.
        --This signal uses to control the data which will be written into output register.
        DATA_OUT_WREN <= '1' when ( (PRE_ST = EMPTY and INSERT_DATA = '1' and REMOVE_DATA = '0')
                                        or (PRE_ST = BUSY and INSERT_DATA = '1' and REMOVE_DATA = '1')
                                            or (PRE_ST = FULL and INSERT_DATA = '0' and REMOVE_DATA = '1') ) else '0';
        DATA_BUFFER_WREN <= '1' when ((PRE_ST = BUSY and INSERT_DATA = '1' and REMOVE_DATA = '0')) else '0';

    
    --This process uses to choose the data path to keep data.
    CHOOSE_REGIS : process(i_CLK,i_RST_n)
    begin
        if (i_RST_n = '0') then
            o_DATA_SIGN <= (others => '0');
            SKD_BUFFER <= (others => '0');
        elsif rising_edge(i_CLK) then
            if DATA_BUFFER_WREN = '1' then
                SKD_BUFFER <= i_DATA;
            end if;
            
            if DATA_OUT_WREN = '1' then --correct response 3 states aboves.
                if PRE_ST = FULL then --If full and remove data, it means data is read by side B(output), so we move data from buffer to main register.
                    o_DATA_SIGN <= SKD_BUFFER;
                else
                --If empty and insert data, it means main regis is empty, get data to main regis directly from output
                --It busy but insert data and remove data is on, it means data is read by side B(output), so main regis is dirty, we refresh data by new data from input.
                    o_DATA_SIGN <= i_DATA;
                end if;
            end if;
         end if;       
    end process;

    
    STATE_REG : process(i_CLK,i_RST_n)
    begin
        if (i_RST_n = '0') then
            PRE_ST <= EMPTY;
            o_READY_SIGN <= '0';--not ready to accept data
            o_VALID_SIGN <= '0';--not ready to send data
        elsif rising_edge(i_CLK) then
            PRE_ST <= NX_ST;
            o_READY_SIGN <= o_READY_SIGN_NX;
            o_VALID_SIGN <= o_VALID_SIGN_NX;
        end if;
    end process;
    
    NEXT_STATE : process(PRE_ST,o_READY_SIGN,o_VALID_SIGN)
    begin
        NX_ST <= PRE_ST;
        o_READY_SIGN_NX <= o_READY_SIGN;
        o_VALID_SIGN_NX <=o_VALID_SIGN;
        case (PRE_ST) is
            when EMPTY =>
                if INSERT_DATA = '1' then
                    NX_ST <= BUSY;
                    o_READY_SIGN_NX <= '1';
                    o_VALID_SIGN_NX <= '1';
                end if;
            when BUSY =>
                if (INSERT_DATA = '1') and (REMOVE_DATA = '1') then
                    NX_ST <= BUSY;
                    o_READY_SIGN_NX <= '1';
                    o_VALID_SIGN_NX <= '1';                   
                elsif (INSERT_DATA = '1') and (REMOVE_DATA = '0') then
                    NX_ST <= FULL;
                    o_READY_SIGN_NX <= '0';
                    o_VALID_SIGN_NX <= '1';                   
                elsif (INSERT_DATA = '0') and (REMOVE_DATA = '1') then
                    NX_ST <= EMPTY;
                    o_READY_SIGN_NX <= '1';
                    o_VALID_SIGN_NX <= '0';                   
                end if;
            when FULL =>
                if REMOVE_DATA = '1' then
                    NX_ST <= BUSY;
                    o_READY_SIGN_NX <= '1';
                    o_VALID_SIGN_NX <= '1';   
                end if;
        end case;
    end process;
    

end architecture;


