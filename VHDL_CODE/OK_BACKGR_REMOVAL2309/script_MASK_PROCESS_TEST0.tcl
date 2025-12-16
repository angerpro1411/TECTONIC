# Loading project LUT_DIV_8BITS
vsim work.top_tb
# vsim work.top_tb 
# Start time: 11:01:30 on Sep 22,2025
# Loading sv_std.std
# Loading work.top_tb
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.linebuffer(rtl)
# Loading work.input4mask_calcul(rtl)
# Loading work.multiplexer(rtl)
# Loading work.mask_calcul(structure)
# Loading work.max_min_diff(rtl)
# Loading work.reciprocal_pkg
# Loading work.lut_div_8bits(rtl)
add wave -position insertpoint  \
sim:/top_tb/b \
sim:/top_tb/clk \
sim:/top_tb/g \
sim:/top_tb/i_data_rgb \
sim:/top_tb/i_data_valid \
sim:/top_tb/i_MASK0 \
sim:/top_tb/i_MASK1 \
sim:/top_tb/i_MASK2 \
sim:/top_tb/i_MASK3 \
sim:/top_tb/i_VALID0 \
sim:/top_tb/i_VALID1 \
sim:/top_tb/i_VALID2 \
sim:/top_tb/i_VALID3 \
sim:/top_tb/o_DATA \
sim:/top_tb/o_DATA0 \
sim:/top_tb/o_DATA1 \
sim:/top_tb/o_DATA2 \
sim:/top_tb/o_DATA3 \
sim:/top_tb/o_VALID \
sim:/top_tb/o_VALID0 \
sim:/top_tb/o_VALID1 \
sim:/top_tb/o_VALID2 \
sim:/top_tb/o_VALID3 \
sim:/top_tb/r \
sim:/top_tb/rstn


add wave -position insertpoint  \
sim:/top_tb/MASK_BUFF/i_DATA \
sim:/top_tb/MASK_BUFF/i_WRITE \
sim:/top_tb/MASK_BUFF/WR_PTR
add wave -position insertpoint  \
sim:/top_tb/MASK_CALCUL0/MASK_CALCUL_COMPONENT/HUE_VALID \
sim:/top_tb/MASK_CALCUL0/MASK_CALCUL_COMPONENT/s_HUE
add wave -position insertpoint  \
sim:/top_tb/MASK_CALCUL1/MASK_CALCUL_COMPONENT/HUE_VALID \
sim:/top_tb/MASK_CALCUL1/MASK_CALCUL_COMPONENT/s_HUE
add wave -position insertpoint  \
sim:/top_tb/MASK_CALCUL2/MASK_CALCUL_COMPONENT/HUE_VALID \
sim:/top_tb/MASK_CALCUL2/MASK_CALCUL_COMPONENT/s_HUE
add wave -position insertpoint  \
sim:/top_tb/MASK_CALCUL3/MASK_CALCUL_COMPONENT/HUE_VALID \
sim:/top_tb/MASK_CALCUL3/MASK_CALCUL_COMPONENT/s_HUE


add wave -position insertpoint  \
sim:/top_tb/MASK_BUFF/LINE_INST
add wave -position insertpoint  \
sim:/top_tb/RGB_BUFF/LINE_INST

run
