//=======================================================================
// COPYRIGHT (C) 2010-2016 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_MONITOR_BFM_SV
`define GUARD_SVT_MONITOR_BFM_SV

`include "VmtDefines.inc"

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_xactor_bfm_if_util)
`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_bfm_util)

// Kind used for byte_size, byte_pack, byte_unpack, and compare
`define DW_VIP_VMT_LOGICAL  9        

// is_valid return value which indicates "ok" or "valid"
`define DW_VIP_XACT_OK 0

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
jEoj0ALFAIbc9uqW93f6nHZBdN5EU8GjNzYqlFFrAnvFNGuTW3pnys6tyyATbiYU
DxHrorSpQbnC30NsiSEmiNKvvk3Rl7Lw/GEJAVvPS+kjvdRuMuFG+ISaRXlz+aGx
3Pzb+0KAVU0hlNa7GzdeAlvoUMSPUVtqGk26BfuuHC0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 214       )
OyR2SlM3go++TOglF4OhjuQI2eXwqlmJUmmXYsEFmGW8juKHVUY9PshqSiP2kUpT
Aeeh7O5D97FJ975WhOmQcZreuiWz5ljkIVAs3wkuGl//bWqY6aG974uFwROfpDa1
gASZtVxG4jnPbKDNDHimPVAZcPDqZUmMkR+knEfWkEHM7suWNlUnWh9q0v+aYiMi
lWUwqEdMIdTFz8/CsZf8GTwm+QYmX65qG8wWLWFqVfWkm2txutJQkAGCO5PdaKPi
RE9m7Cm3BwM69VJ5bwTMUwg7+2wmdgbDJ0qsCP2pkEg=
`pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT agents.
 */
class svt_monitor_bfm extends `SVT_XVM(monitor);

  // Declare all of the properties and methods for this monitor
  `SVT_BFM_UTIL_DECL(svt_monitor_bfm)

  // Declare all of the virtual methods which allow access to the base VMT commands
  `SVT_XACTOR_BFM_VMT_CMD_METHODS_DECL

endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
puM1PBB2cmA4Y+GNBcvk8FMg6pVC5hGLbjfsp1PNOxut4y00fTtNCHGZtbL+EbQ3
U+JIYDAj5MqEA45xih8Ifj6/Ej4eHffgrFdqTcLfrLgSnqFPgh0C2yeD+em8TDt1
4uWGPA64YID8cihsH4eZTitZyCS9EWn6rhG5T2rCZLM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 529       )
KH7lSUaXEIfZ4M8H0f7NpWe1EsDnkvxSEJgnCbSGOEUPXvQh1Escj4wPq/g1Dwlx
1HMsGdCi0qE9/G8R0f43VGCqCHcj3uFUPH/DROMUlvfJyKO+ffZMA+PfOa6/+3MN
XPxaGFMOXByPNBFl020Sb9bPZSFpu1dM3bUJnQG8DAC844wHVZ7N/iRi4HmRPoz9
B6pJt9PjzjAm318XNfqyrCJJhgRnfyuliZaNIa9SgixobOLKiADjpmFLjWz1VpM8
WQkLJ0uKNsSjtIRuMU+8iPVCzI9H9TQmqGYWqkBnMYM1faf3HDgJeOsTUDqWGcW7
151haL058wlFktCMkFRDF6yJ6O/JnrwFALEj6qwwQ4+mDZGCexhDcR0gWKNLsUr+
5NEI8lGM2U/qJYSYpGgvKB60h9fToItEYL6HBrEZbQE=
`pragma protect end_protected

`SVT_BFM_UTIL_REPORT_CATCHER_NO_PARAM_DECL(svt_monitor_bfm)

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PDNGOMdrX6T4UzEjwbRwVIBs5lqDvIZQOae2AcrqBIDgcw1qDGEopTrDsRgXJdfD
1E1gO1j/Wx/g7gSee//ZXFcgfp3C+HNeaN8WzayMUoBKTuliIoOFsTsMnMWroxHY
4THJvQRPQoub46I6xyM0SuSfXcnR32P5fMrZKRYIIEU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 671       )
Ehl/JvHid+xbLtLJdZxj3DNA1dOy4onU9JS5zG1/C3VZf1mKrtVobxuRypTgzxfM
tTxwlqfo+EzyLGhifXF6+lyx1MjLttvvRaon1IWTGtGoZAPTwOiw+aP1BdDGY9Or
jrUBwY3GiNa8Ux8Qj1cHd3/36KrdM5d0wLUwdvRlFRlbx0O/2vM9tE5DdnI4Hc+1
`pragma protect end_protected

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_monitor_bfm extends svt_monitor_bfm;
  `uvm_component_utils(svt_uvm_monitor_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
     super.new(name, parent, suite_name);
  endfunction
endclass
`endif

`endif // GUARD_SVT_MONITOR_BFM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HBgFJqaIaacrEtpfj1BLlnpbc9Dbj8jsQxWjqb+sVYgDkFB+k1R4LAtlMhstH5MR
CBj3xSQYvu2nlgr9GPpryqGd/1n8mmnV+/V95u9XL4Z/23MWC+1tNzqZwpBYBUPK
HUWGDKX3wO7CTT9CfVStCleQiGqPXgMWos9UpFszz5U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 754       )
vVs8wWME72nCWwBMUn56BrKAkxwOkMPMgdiLacyH4nDZyzQEJMBJ2mIfEsdd6c/l
ycVYGTC+qGFIt+PPAvbB7UZnXqNA7ddYvEuXi5oshjr5VjaZzH1tEIdhnxyNSnnb
`pragma protect end_protected
