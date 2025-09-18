-- ----------------------------------------------------------------------------------
-- -- Company: 
-- -- Engineer: 
-- -- 
-- -- Create Date: 09/10/2025 05:26:59 PM
-- -- Design Name: 
-- -- Module Name: MAX_MIN_DIFF - RTL
-- -- Project Name: 
-- -- Target Devices: 
-- -- Tool Versions: 
-- -- Description: 
-- -- 
-- -- Dependencies: 
-- -- 
-- -- Revision:
-- -- Revision 0.01 - File Created
-- -- Additional Comments:
-- -- 
-- ----------------------------------------------------------------------------------


-- library IEEE;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.numeric_std.all;
-- -- Uncomment the following library declaration if using
-- -- arithmetic functions with Signed or Unsigned values
-- --use IEEE.NUMERIC_STD.ALL;

-- -- Uncomment the following library declaration if instantiating
-- -- any Xilinx leaf cells in this code.
-- --library UNISIM;
-- --use UNISIM.VComponents.all;

-- entity MAX_MIN_DIFF is
--     Port ( 
--         i_CLK       : in std_logic;
--         i_RSTn      : in std_logic;
--         i_DATA_RGB  : in std_logic_vector(23 downto 0);
--         i_DATA_VALID: in std_logic;
--         o_HUE       : out std_logic_vector(7 downto 0);
--         o_MAX       : out std_logic_vector(7 downto 0);
--         o_MIN       : out std_logic_vector(7 downto 0);
--         o_DIFF      : out std_logic_vector(7 downto 0)
--     );
-- end MAX_MIN_DIFF;

-- architecture RTL of MAX_MIN_DIFF is

--     --Component declaration
--     component LUT_DIV_8BITS is
--         port(
--             i_CLK      : in std_logic;
--             i_RSTn     : in std_logic;
--             i_START    : in std_logic;
--             i_DIVIDEND : in std_logic_vector(7 downto 0);
--             i_DIVISOR  : in std_logic_vector(7 downto 0);
--             o_DATA_READY : out std_logic;
--             o_QUOTIENT : out std_logic_vector(13 downto 0)
--         );
--     end component;    
    
    
--     signal TEMP_R,TEMP_G,TEMP_B         : unsigned(7 downto 0);
--     signal s_MIN,s_MAX,s_DIFF           : unsigned(7 downto 0);
    
    
--     --signal for instantiation
--     signal START_LUT    : std_logic;
--     signal DIVIDEND_LUT : std_logic_vector(7 downto 0);
--     signal DIVISOR_LUT  : std_logic_vector(7 downto 0);
--     signal QUOTIENT_LUT : std_logic_vector(13 downto 0);
--     signal DIVISION_DONE : std_logic;
    
--     signal WHOISMAX     : std_logic_vector(2 downto 0);
    
--     --PIPELINE chain signals
--     signal MAX_MIN_VALID    : std_logic;
--     signal QUOTIENT_VALID   : std_logic;
--     signal HUE_VALID        : std_logic;
    
--     --Hue calculation signals
--     --signal PRE_HUE_CALCUL   : integer range -60 to 360;
    
    
--     --This signal uses to keep the sign of division.
--     signal DIVIDEND_SIGN: std_logic;
    
    
--     --HUE result signal
--     signal s_HUE : unsigned(7 downto 0);

--     --Register to store last RGB for pipeline purpose
--     -- signal LAST_B,LAST_G,LAST_R : unsigned(7 downto 0);

--     --Base on which max is(R G or B), we have a temporary value to store the difference
--     signal s_TEMP : integer range -255 to 255;

--     --Register to store signals due to delay of division
--     signal s_MAX_PIPE1,s_MIN_PIPE1 : unsigned(7 downto 0);
--     signal DIVIDEND_SIGN_PIPE1 : std_logic;
--     signal WHOISMAX_PIPE1 : std_logic_vector(2 downto 0);
    
-- begin

--     --Component instantiation
--     LUT_COM: LUT_DIV_8BITS port map(
--             i_CLK      => i_CLK,
--             i_RSTn     => i_RSTn,
--             i_START    => START_LUT,
--             i_DIVIDEND => DIVIDEND_LUT,
--             i_DIVISOR  => DIVISOR_LUT,
--             o_DATA_READY => DIVISION_DONE,
--             o_QUOTIENT => QUOTIENT_LUT  
--     );


--     TEMP_B <= unsigned(i_DATA_RGB(23 downto 16));
--     TEMP_G <= unsigned(i_DATA_RGB(15 downto 8));
--     TEMP_R <= unsigned(i_DATA_RGB(7 downto 0));
     

--     -- REGISTER_SHIFT_RGB : process(i_CLK)
--     -- begin
--     --     if rising_edge(i_CLK) then
--     --         if i_RSTn <= '0' then
--     --             LAST_B <= (others => '0');
--     --             LAST_G <= (others => '0');
--     --             LAST_R <= (others => '0');
--     --         else
--     --             LAST_B <= TEMP_B;
--     --             LAST_G <= TEMP_G;
--     --             LAST_R <= TEMP_R;
--     --         end if;
--     --     end if;
--     -- end process;

    
--     o_MAX <= std_logic_vector(s_MAX);
--     o_MIN <= std_logic_vector(s_MIN);
--     o_DIFF <= std_logic_vector(s_DIFF);


--     MAX_MIN_FINDING : process(i_CLK)
--         variable v_MAX,v_MIN : unsigned(7 downto 0) ;
--     begin
--         if rising_edge(i_CLK) then
--             if i_RSTn = '0' then
--                 s_MIN <= (others => '0');
--                 s_MAX <= (others => '0');
--                 s_DIFF <= (others => '0');
--                 MAX_MIN_VALID <= '0';
--                 WHOISMAX <= "000";
--                 s_TEMP <= 0;
--             else
--                 MAX_MIN_VALID <= i_DATA_VALID;
--                 if i_DATA_VALID = '1' then
--                     v_MIN := TEMP_B;
--                     v_MAX := TEMP_B;
                    
--                     if v_MAX <= TEMP_G then
--                         v_MAX := TEMP_G;
--                     end if;
--                     if v_MAX <= TEMP_R then
--                         v_MAX := TEMP_R;
--                     end if;

--                     if v_MIN >= TEMP_G then
--                         v_MIN := TEMP_G;
--                     end if;
--                     if v_MIN >= TEMP_R then
--                         v_MIN := TEMP_R;
--                     end if;
                    

--                     --Find who is max
--                     if v_MAX = TEMP_R then
--                         WHOISMAX <= "100";
--                         s_TEMP <= to_integer(TEMP_G) - to_integer(TEMP_B);
--                     elsif v_MAX = TEMP_G then
--                         WHOISMAX <= "010";
--                         s_TEMP <= to_integer(TEMP_B) - to_integer(TEMP_R);
--                     elsif v_MAX <= TEMP_B then
--                         WHOISMAX <= "001";
--                         s_TEMP <= to_integer(TEMP_R) - to_integer(TEMP_G);
--                     end if;

--                     s_MIN <= v_MIN;
--                     s_MAX <= v_MAX;
--                     --Delay one cycle clock
--                     s_DIFF <= v_MAX - v_MIN;
--                 end if;
--             end if;
--         end if;
--     end process;


--     FIRST_STAGE_HUE_CALCULATION : process(MAX_MIN_VALID,s_MAX,s_MIN,s_TEMP,s_DIFF)
--         variable v_TEMP : integer range -255 to 255;
--     begin
--         START_LUT <= MAX_MIN_VALID;
--         DIVIDEND_LUT <= (others => '0');
--         DIVISOR_LUT <= (others => '0');
--         DIVIDEND_SIGN <= '0';
--         v_TEMP := 0;
--         if MAX_MIN_VALID = '1' then
--             v_TEMP := s_TEMP;
--             if s_MAX = s_MIN then
--                 v_TEMP := 0;
--             else
--                 DIVISOR_LUT <= std_logic_vector(s_DIFF);
--                 if (s_TEMP < 0) then
--                     v_TEMP := -s_TEMP;
--                     DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--                     DIVIDEND_SIGN <= '1';                                
--                 else
--                     DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--                     DIVIDEND_SIGN <= '0';
--                 end if;                                                      
--             end if;
--         end if;    
--     end process;    



--     -- Because of the delay of division, we need to create a storage for the signals who has the same delay as division
--     -- If the delay is big, normally we need to have FIFO to store these data, but in my design, the division delay only one cycle,
--     -- so we just need a flipflop to store the last signals.

--     MAX_MIN_DELAY1 : process(i_CLK)
--     begin
--         if rising_edge(i_CLK) then
--             if i_RSTn = '0' then
--                 s_MAX_PIPE1 <= (others => '0');
--                 s_MIN_PIPE1 <= (others => '0');
--             else
--                 s_MAX_PIPE1 <= s_MAX;
--                 s_MIN_PIPE1 <= s_MIN;
--             end if;
--         end if;
--     end process;

--     WHOISMAX_DELAY1 : process(i_CLK)
--     begin
--         if rising_edge(i_CLK) then
--             if i_RSTn = '0' then
--                 WHOISMAX_PIPE1 <= (others => '0');
--             else
--                 WHOISMAX_PIPE1 <= WHOISMAX;
--             end if;
--         end if;
--     end process;    

--     DIVIDEN_SIGN_DELAY1: process(i_CLK)
--     begin
--         if rising_edge(i_CLK) then
--             if i_RSTn = '0' then
--                 DIVIDEND_SIGN_PIPE1 <= '0';
--             else
--                 DIVIDEND_SIGN_PIPE1 <= DIVIDEND_SIGN;
--             end if;
--         end if;
--     end process;    


    
--     -- FIRST_STAGE_HUE_CALCULATION : process(i_CLK)
--     --     variable v_TEMP : integer range -255 to 255;
--     -- begin
--     --     if rising_edge(i_CLK) then
--     --         if i_RSTn = '0' then
--     --             DIVIDEND_SIGN <= '0';
--     --             START_LUT <= '0';
--     --             DIVISOR_LUT <= (others => '0');
--     --             DIVIDEND_LUT <= (others => '0');
--     --         else 
--     --            -- 2 nature 8-bits number(0-255) have maximum differece is [-255,255] so 9 bit signed is enough
--     --            -- Base on the equation, if R max, we need a quotion of (G_B)/(Rmax-min), so the quotient
--     --            -- would always be inside [-1,1]
--     --             if MAX_MIN_VALID = '1' then
--     --                 START_LUT <= MAX_MIN_VALID;
--     --                 if s_MAX = s_MIN then
--     --                     v_TEMP := 0;
--     --                 else
--     --                     case WHOISMAX is
--     --                         when "100" =>
--     --                             v_TEMP := (to_integer(LAST_G) - to_integer(LAST_B));
--     --                             if (v_TEMP < 0) then
--     --                                 v_TEMP := -v_TEMP;
--     --                                 DIVISOR_LUT <= std_logic_vector(s_DIFF);
--     --                                 DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--     --                                 DIVIDEND_SIGN <= '1';                                
--     --                             else
--     --                                 DIVISOR_LUT <= std_logic_vector(s_DIFF);
--     --                                 DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--     --                                 DIVIDEND_SIGN <= '0';
--     --                             end if;                              
--     --                         when "010" =>
--     --                             v_TEMP := to_integer(LAST_B) - to_integer(LAST_R);
--     --                             if (v_TEMP < 0) then
--     --                                 v_TEMP := -v_TEMP;
--     --                                 DIVISOR_LUT <= std_logic_vector(s_DIFF);
--     --                                 DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--     --                                 DIVIDEND_SIGN <= '1';                                
--     --                             else
--     --                                 DIVISOR_LUT <= std_logic_vector(s_DIFF);
--     --                                 DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--     --                                 DIVIDEND_SIGN <= '0';
--     --                             end if;                              
--     --                         when "001" =>
--     --                             v_TEMP := to_integer(LAST_R) - to_integer(LAST_G);
--     --                             if (v_TEMP < 0) then
--     --                                 v_TEMP := -v_TEMP;
--     --                                 DIVISOR_LUT <= std_logic_vector(s_DIFF);
--     --                                 DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--     --                                 DIVIDEND_SIGN <= '1';                                
--     --                             else
--     --                                 DIVISOR_LUT <= std_logic_vector(s_DIFF);
--     --                                 DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
--     --                                 DIVIDEND_SIGN <= '0';
--     --                             end if;                              
--     --                         when others =>
--     --                             v_TEMP := 0;
--     --                     end case;    
--     --                 end if;            
--     --             end if;  
--     --         end if;  
--     --     end if;    
--     -- end process;


--     -- Finish the visision
--     QUOTIENT_VALID <= DIVISION_DONE;


    


--     -- SECOND_STAGE_HUE_CALCUL : process(i_CLK)
--     --     variable v_HUE : unsigned(13 downto 0) := (others => '0'); 
--     -- begin
--     --     if rising_edge(i_CLK) then
--     --         if i_RSTn = '0' then
--     --             s_HUE <= (others => '0');
--     --             HUE_VALID <= '0';
--     --         else
--     --             if QUOTIENT_VALID = '1' then
--     --                 HUE_VALID <= QUOTIENT_VALID;
--     --                 if s_MIN_PIPE1 = s_MAX_PIPE1 then -- diff = 0
--     --                     s_HUE <= (others => '0');
--     --                 else
--     --                     case WHOISMAX_PIPE1 is
--     --                         -- only first case when HUE could be negative, due to quotien [-60:60]
--     --                         -- With two left case, when HUE adds to 120 and 240, HUE becomes positvely.
--     --                         when "100" =>
--     --                             if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
--     --                                 --Shift right one bit as divide by 2
--     --                                 v_HUE := unsigned ('0' & QUOTIENT_LUT(13 downto 1));
                                    
--     --                                 --As go back to range 0 to 255, so only take 8 bits to result
--     --                                 s_HUE <= v_HUE(7 downto 0);
--     --                             else -- negative QUOTIENT
--     --                                 -- But we keep positive quotient from last operation.
--     --                                 v_HUE :=(to_unsigned(360,14) - unsigned(QUOTIENT_LUT));
                                    
--     --                                 --Shift right one bit as divide by 2
--     --                                 v_HUE := '0' & v_HUE(13 downto 1);
                                    
--     --                                 --As go back to range 0 to 255, so only take 8 bits to result
--     --                                 s_HUE <= v_HUE(7 downto 0);
--     --                             end if;
--     --                         when "010" => -- As G max
--     --                             if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
--     --                                 --Adding 120 to quotient
--     --                                 v_HUE := to_unsigned(120,14) + unsigned(QUOTIENT_LUT);
                                    
--     --                                 --Shift right one bit as divide by 2
--     --                                 v_HUE := '0' & v_HUE(13 downto 1);
                                    
--     --                                 --As go back to range 0 to 255, so only take 8 bits to result
--     --                                 s_HUE <= v_HUE(7 downto 0);
--     --                             else -- negative QUOTIENT
--     --                                 --Adding 120 to quotient
--     --                                 v_HUE := to_unsigned(120,14) - unsigned(QUOTIENT_LUT);
                                    
--     --                                 --Shift right one bit as divide by 2
--     --                                 v_HUE := '0' & v_HUE(13 downto 1);
                                    
--     --                                 --As go back to range 0 to 255, so only take 8 bits to result
--     --                                 s_HUE <= v_HUE(7 downto 0);                                    
--     --                             end if;                              
--     --                         when "001" =>
--     --                             if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
--     --                                 --Adding 240 to quotient
--     --                                 v_HUE := to_unsigned(240,14) + unsigned(QUOTIENT_LUT);
                                    
--     --                                 --Shift right one bit as divide by 2
--     --                                 v_HUE := '0' & v_HUE(13 downto 1);
                                    
--     --                                 --As go back to range 0 to 255, so only take 8 bits to result
--     --                                 s_HUE <= v_HUE(7 downto 0);
--     --                             else -- negative QUOTIENT
--     --                                 --Adding 240 to quotient
--     --                                 v_HUE := to_unsigned(240,14) - unsigned(QUOTIENT_LUT);
                                    
--     --                                 --Shift right one bit as divide by 2
--     --                                 v_HUE := '0' & v_HUE(13 downto 1);
                                    
--     --                                 --As go back to range 0 to 255, so only take 8 bits to result
--     --                                 s_HUE <= v_HUE(7 downto 0);  
--     --                             end if;
--     --                         when others =>
--     --                             s_HUE <= (others => '0');                           
--     --                     end case;
--     --                 end if;
--     --             end if;
--     --         end if;                     
--     --     end if;    
--     -- end process;

    
--     SECOND_STAGE_HUE_CALCUL : process(i_CLK)
--         variable v_HUE,v_HUE1 : unsigned(13 downto 0) := (others => '0'); 
--     begin
--         if rising_edge(i_CLK) then
--             if i_RSTn = '0' then
--                 s_HUE <= (others => '0');
--                 HUE_VALID <= '0';
--             else
--                 HUE_VALID <= QUOTIENT_VALID;
--                 if QUOTIENT_VALID = '1' then
--                     if s_MIN_PIPE1 = s_MAX_PIPE1 then -- diff = 0
--                         s_HUE <= (others => '0');
--                     else
--                         case WHOISMAX_PIPE1 is
--                             -- only first case when HUE could be negative, due to quotien [-60:60]
--                             -- With two left case, when HUE adds to 120 and 240, HUE becomes positvely.
--                             when "100" =>
--                                 if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
--                                     --Shift right one bit as divide by 2
--                                     v_HUE := unsigned ('0' & QUOTIENT_LUT(13 downto 1));
                                    
--                                     --As go back to range 0 to 255, so only take 8 bits to result
--                                     s_HUE <= v_HUE(7 downto 0);
--                                 else -- negative QUOTIENT
--                                     -- But we keep positive quotient from last operation.
--                                     v_HUE :=(to_unsigned(360,14) - unsigned(QUOTIENT_LUT));
                                    
--                                     --Shift right one bit as divide by 2
--                                     v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
--                                     --As go back to range 0 to 255, so only take 8 bits to result
--                                     s_HUE <= v_HUE1(7 downto 0);
--                                 end if;
--                             when "010" => -- As G max
--                                 if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
--                                     --Adding 120 to quotient
--                                     v_HUE := to_unsigned(120,14) + unsigned(QUOTIENT_LUT);
                                    
--                                     --Shift right one bit as divide by 2
--                                     v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
--                                     --As go back to range 0 to 255, so only take 8 bits to result
--                                     s_HUE <= v_HUE1(7 downto 0);
--                                 else -- negative QUOTIENT
--                                     --Adding 120 to quotient
--                                     v_HUE := to_unsigned(120,14) - unsigned(QUOTIENT_LUT);
                                    
--                                     --Shift right one bit as divide by 2
--                                     v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
--                                     --As go back to range 0 to 255, so only take 8 bits to result
--                                     s_HUE <= v_HUE1(7 downto 0);                                    
--                                 end if;                              
--                             when "001" =>
--                                 if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
--                                     --Adding 240 to quotient
--                                     v_HUE := to_unsigned(240,14) + unsigned(QUOTIENT_LUT);
                                    
--                                     --Shift right one bit as divide by 2
--                                     v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
--                                     --As go back to range 0 to 255, so only take 8 bits to result
--                                     s_HUE <= v_HUE1(7 downto 0);
--                                 else -- negative QUOTIENT
--                                     --Adding 240 to quotient
--                                     v_HUE := to_unsigned(240,14) - unsigned(QUOTIENT_LUT);
                                    
--                                     --Shift right one bit as divide by 2
--                                     v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
--                                     --As go back to range 0 to 255, so only take 8 bits to result
--                                     s_HUE <= v_HUE1(7 downto 0);  
--                                 end if;
--                             when others =>
--                                 s_HUE <= (others => '0');                           
--                         end case;
--                     end if;
--                 end if;
--             end if;                     
--         end if;    
--     end process;


    
--     --HUE out
--     o_HUE <= std_logic_vector(s_HUE);
    
-- end RTL;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/10/2025 05:26:59 PM
-- Design Name: 
-- Module Name: MAX_MIN_DIFF - RTL
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAX_MIN_DIFF is
    Port ( 
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        i_DATA_RGB  : in std_logic_vector(23 downto 0);
        i_DATA_VALID: in std_logic;
        
        --Hue's threshold value, from 0 to 255 
        i_H_THRESHOLD : in std_logic_vector(7 downto 0);
        
        -- MASK tell us the state of this pixel, pass or fail
        o_MASK_VALID  : out std_logic;
        o_MASK        : out std_logic
    );
end MAX_MIN_DIFF;

architecture RTL of MAX_MIN_DIFF is

    --Component declaration
    component LUT_DIV_8BITS is
        port(
            i_CLK      : in std_logic;
            i_RSTn     : in std_logic;
            i_START    : in std_logic;
            i_DIVIDEND : in std_logic_vector(7 downto 0);
            i_DIVISOR  : in std_logic_vector(7 downto 0);
            o_DATA_READY : out std_logic;
            o_QUOTIENT : out std_logic_vector(13 downto 0)
        );
    end component;    
    
    
    signal TEMP_R,TEMP_G,TEMP_B         : unsigned(7 downto 0);
    signal s_MIN,s_MAX,s_DIFF           : unsigned(7 downto 0);
    
    
    --signal for instantiation
    signal START_LUT    : std_logic;
    signal DIVIDEND_LUT : std_logic_vector(7 downto 0);
    signal DIVISOR_LUT  : std_logic_vector(7 downto 0);
    signal QUOTIENT_LUT : std_logic_vector(13 downto 0);
    signal DIVISION_DONE : std_logic;
    
    signal WHOISMAX     : std_logic_vector(2 downto 0);
    
    --PIPELINE chain signals
    signal MAX_MIN_VALID    : std_logic;
    signal QUOTIENT_VALID   : std_logic;
    signal HUE_VALID        : std_logic;
    
    --Hue calculation signals
    --signal PRE_HUE_CALCUL   : integer range -60 to 360;
    
    
    --This signal uses to keep the sign of division.
    signal DIVIDEND_SIGN: std_logic;
    
    
    --HUE result signal
    signal s_HUE : unsigned(7 downto 0);

    --Register to store last RGB for pipeline purpose
    -- signal LAST_B,LAST_G,LAST_R : unsigned(7 downto 0);

    --Base on which max is(R G or B), we have a temporary value to store the difference
    signal s_TEMP : integer range -255 to 255;

    --Register to store signals due to delay of division
    signal s_MAX_PIPE1,s_MIN_PIPE1 : unsigned(7 downto 0);
    signal DIVIDEND_SIGN_PIPE1 : std_logic;
    signal WHOISMAX_PIPE1 : std_logic_vector(2 downto 0);
    
begin

    --Component instantiation
    LUT_COM: LUT_DIV_8BITS port map(
            i_CLK      => i_CLK,
            i_RSTn     => i_RSTn,
            i_START    => START_LUT,
            i_DIVIDEND => DIVIDEND_LUT,
            i_DIVISOR  => DIVISOR_LUT,
            o_DATA_READY => DIVISION_DONE,
            o_QUOTIENT => QUOTIENT_LUT  
    );


    TEMP_B <= unsigned(i_DATA_RGB(23 downto 16));
    TEMP_G <= unsigned(i_DATA_RGB(15 downto 8));
    TEMP_R <= unsigned(i_DATA_RGB(7 downto 0));
     


    MAX_MIN_FINDING : process(i_CLK)
        variable v_MAX,v_MIN : unsigned(7 downto 0) ;
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_MIN <= (others => '0');
                s_MAX <= (others => '0');
                s_DIFF <= (others => '0');
                MAX_MIN_VALID <= '0';
                WHOISMAX <= "000";
                s_TEMP <= 0;
            else
                MAX_MIN_VALID <= i_DATA_VALID;
                if i_DATA_VALID = '1' then
                    v_MIN := TEMP_B;
                    v_MAX := TEMP_B;
                    
                    if v_MAX <= TEMP_G then
                        v_MAX := TEMP_G;
                    end if;
                    if v_MAX <= TEMP_R then
                        v_MAX := TEMP_R;
                    end if;

                    if v_MIN >= TEMP_G then
                        v_MIN := TEMP_G;
                    end if;
                    if v_MIN >= TEMP_R then
                        v_MIN := TEMP_R;
                    end if;
                    

                    --Find who is max
                    if v_MAX = TEMP_R then
                        WHOISMAX <= "100";
                        s_TEMP <= to_integer(TEMP_G) - to_integer(TEMP_B);
                    elsif v_MAX = TEMP_G then
                        WHOISMAX <= "010";
                        s_TEMP <= to_integer(TEMP_B) - to_integer(TEMP_R);
                    elsif v_MAX <= TEMP_B then
                        WHOISMAX <= "001";
                        s_TEMP <= to_integer(TEMP_R) - to_integer(TEMP_G);
                    end if;

                    s_MIN <= v_MIN;
                    s_MAX <= v_MAX;
                    --Delay one cycle clock
                    s_DIFF <= v_MAX - v_MIN;
                end if;
            end if;
        end if;
    end process;


    FIRST_STAGE_HUE_CALCULATION : process(MAX_MIN_VALID,s_MAX,s_MIN,s_TEMP,s_DIFF)
        variable v_TEMP : integer range -255 to 255;
    begin
        START_LUT <= MAX_MIN_VALID;
        DIVIDEND_LUT <= (others => '0');
        DIVISOR_LUT <= (others => '0');
        DIVIDEND_SIGN <= '0';
        v_TEMP := 0;
        if MAX_MIN_VALID = '1' then
            v_TEMP := s_TEMP;
            if s_MAX = s_MIN then
                v_TEMP := 0;
            else
                DIVISOR_LUT <= std_logic_vector(s_DIFF);
                if (s_TEMP < 0) then
                    v_TEMP := -s_TEMP;
                    DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
                    DIVIDEND_SIGN <= '1';                                
                else
                    DIVIDEND_LUT <= std_logic_vector(to_unsigned(v_TEMP,8));
                    DIVIDEND_SIGN <= '0';
                end if;                                                      
            end if;
        end if;    
    end process;    



    -- Because of the delay of division, we need to create a storage for the signals who has the same delay as division
    -- If the delay is big, normally we need to have FIFO to store these data, but in my design, the division delay only one cycle,
    -- so we just need a flipflop to store the last signals.

    MAX_MIN_DELAY1 : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_MAX_PIPE1 <= (others => '0');
                s_MIN_PIPE1 <= (others => '0');
            else
                s_MAX_PIPE1 <= s_MAX;
                s_MIN_PIPE1 <= s_MIN;
            end if;
        end if;
    end process;

    WHOISMAX_DELAY1 : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                WHOISMAX_PIPE1 <= (others => '0');
            else
                WHOISMAX_PIPE1 <= WHOISMAX;
            end if;
        end if;
    end process;    

    DIVIDEN_SIGN_DELAY1: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                DIVIDEND_SIGN_PIPE1 <= '0';
            else
                DIVIDEND_SIGN_PIPE1 <= DIVIDEND_SIGN;
            end if;
        end if;
    end process;    



    -- Finish the visision
    QUOTIENT_VALID <= DIVISION_DONE;


   
    
    SECOND_STAGE_HUE_CALCUL : process(i_CLK)
        variable v_HUE,v_HUE1 : unsigned(13 downto 0) := (others => '0'); 
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_HUE <= (others => '0');
                HUE_VALID <= '0';
            else
                HUE_VALID <= QUOTIENT_VALID;
                if QUOTIENT_VALID = '1' then
                    if s_MIN_PIPE1 = s_MAX_PIPE1 then -- diff = 0
                        s_HUE <= (others => '0');
                    else
                        case WHOISMAX_PIPE1 is
                            -- only first case when HUE could be negative, due to quotien [-60:60]
                            -- With two left case, when HUE adds to 120 and 240, HUE becomes positvely.
                            when "100" =>
                                if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
                                    --Shift right one bit as divide by 2
                                    v_HUE := unsigned ('0' & QUOTIENT_LUT(13 downto 1));
                                    
                                    --As go back to range 0 to 255, so only take 8 bits to result
                                    s_HUE <= v_HUE(7 downto 0);
                                else -- negative QUOTIENT
                                    -- But we keep positive quotient from last operation.
                                    v_HUE :=(to_unsigned(360,14) - unsigned(QUOTIENT_LUT));
                                    
                                    --Shift right one bit as divide by 2
                                    v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
                                    --As go back to range 0 to 255, so only take 8 bits to result
                                    s_HUE <= v_HUE1(7 downto 0);
                                end if;
                            when "010" => -- As G max
                                if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
                                    --Adding 120 to quotient
                                    v_HUE := to_unsigned(120,14) + unsigned(QUOTIENT_LUT);
                                    
                                    --Shift right one bit as divide by 2
                                    v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
                                    --As go back to range 0 to 255, so only take 8 bits to result
                                    s_HUE <= v_HUE1(7 downto 0);
                                else -- negative QUOTIENT
                                    --Adding 120 to quotient
                                    v_HUE := to_unsigned(120,14) - unsigned(QUOTIENT_LUT);
                                    
                                    --Shift right one bit as divide by 2
                                    v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
                                    --As go back to range 0 to 255, so only take 8 bits to result
                                    s_HUE <= v_HUE1(7 downto 0);                                    
                                end if;                              
                            when "001" =>
                                if DIVIDEND_SIGN_PIPE1 = '0' then -- positive QUOTIENT
                                    --Adding 240 to quotient
                                    v_HUE := to_unsigned(240,14) + unsigned(QUOTIENT_LUT);
                                    
                                    --Shift right one bit as divide by 2
                                    v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
                                    --As go back to range 0 to 255, so only take 8 bits to result
                                    s_HUE <= v_HUE1(7 downto 0);
                                else -- negative QUOTIENT
                                    --Adding 240 to quotient
                                    v_HUE := to_unsigned(240,14) - unsigned(QUOTIENT_LUT);
                                    
                                    --Shift right one bit as divide by 2
                                    v_HUE1 := '0' & v_HUE(13 downto 1);
                                    
                                    --As go back to range 0 to 255, so only take 8 bits to result
                                    s_HUE <= v_HUE1(7 downto 0);  
                                end if;
                            when others =>
                                s_HUE <= (others => '0');                           
                        end case;
                    end if;
                end if;
            end if;                     
        end if;    
    end process;

    
    MASK_VALID_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_MASK_VALID <= '0';
            else
                o_MASK_VALID <= HUE_VALID;
            end if;
        end if;
    end process;
    
    

    
    HUE_CHECK_THRESHOLD: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_MASK <= '0';
            elsif HUE_VALID = '1' then
                if s_HUE >= unsigned(i_H_THRESHOLD) then
                    o_MASK <= '1';
                else 
                    o_MASK <= '0';
                end if;
            end if;
        end if;
    end process;
    
end RTL;
