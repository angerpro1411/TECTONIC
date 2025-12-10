-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: Duy-Manh:user:AXIS_CONV8to24:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_AXIS_CONV8to24_0_0 IS
  PORT (
    i_CLK : IN STD_LOGIC;
    i_RSTn : IN STD_LOGIC;
    M_AXIS_VALID : OUT STD_LOGIC;
    M_AXIS_READY : IN STD_LOGIC;
    M_AXIS_DATA : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
    S_AXIS_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    S_AXIS_VALID : IN STD_LOGIC;
    S_AXIS_READY : OUT STD_LOGIC
  );
END design_1_AXIS_CONV8to24_0_0;

ARCHITECTURE design_1_AXIS_CONV8to24_0_0_arch OF design_1_AXIS_CONV8to24_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_AXIS_CONV8to24_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT AXIS_CONV8to24 IS
    GENERIC (
      COLOR_DATA_WIDTH : INTEGER;
      DATA_WIDTH : INTEGER
    );
    PORT (
      i_CLK : IN STD_LOGIC;
      i_RSTn : IN STD_LOGIC;
      M_AXIS_VALID : OUT STD_LOGIC;
      M_AXIS_READY : IN STD_LOGIC;
      M_AXIS_DATA : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      S_AXIS_DATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      S_AXIS_VALID : IN STD_LOGIC;
      S_AXIS_READY : OUT STD_LOGIC
    );
  END COMPONENT AXIS_CONV8to24;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_AXIS_CONV8to24_0_0_arch: ARCHITECTURE IS "AXIS_CONV8to24,Vivado 2023.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_AXIS_CONV8to24_0_0_arch : ARCHITECTURE IS "design_1_AXIS_CONV8to24_0_0,AXIS_CONV8to24,{}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_AXIS_CONV8to24_0_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_DATA: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_READY: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M_AXIS_VALID: SIGNAL IS "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_VALID: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S_AXIS_DATA: SIGNAL IS "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S_AXIS_DATA: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S_AXIS_READY: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S_AXIS_VALID: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF i_CLK: SIGNAL IS "XIL_INTERFACENAME i_CLK, ASSOCIATED_RESET i_RSTn, FREQ_HZ 100000000, ASSOCIATED_BUSIF M_AXIS:S_AXIS, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF i_CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 i_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF i_RSTn: SIGNAL IS "XIL_INTERFACENAME i_RSTn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF i_RSTn: SIGNAL IS "xilinx.com:signal:reset:1.0 i_RSTn RST";
BEGIN
  U0 : AXIS_CONV8to24
    GENERIC MAP (
      COLOR_DATA_WIDTH => 24,
      DATA_WIDTH => 8
    )
    PORT MAP (
      i_CLK => i_CLK,
      i_RSTn => i_RSTn,
      M_AXIS_VALID => M_AXIS_VALID,
      M_AXIS_READY => M_AXIS_READY,
      M_AXIS_DATA => M_AXIS_DATA,
      S_AXIS_DATA => S_AXIS_DATA,
      S_AXIS_VALID => S_AXIS_VALID,
      S_AXIS_READY => S_AXIS_READY
    );
END design_1_AXIS_CONV8to24_0_0_arch;
