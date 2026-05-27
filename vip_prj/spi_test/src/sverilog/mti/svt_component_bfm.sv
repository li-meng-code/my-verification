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

`ifndef GUARD_SVT_COMPONENT_BFM_SV
`define GUARD_SVT_COMPONENT_BFM_SV

`include "VmtDefines.inc"

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_xactor_bfm_if_util)
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
YbJstFaF4T1CvygNBgeFTXBF60shDPrBzwY+GRpH9HKCBvhSuAAqL+mwugPqK8QL
aegvDotBuH1oxNy726Wxu5RYyBSZpZBoSHvI88mJuxlGJ2wUI2+xcVChRrURBgSl
K+adVVyoYW79NTP8mMMsPfPJh/sboblQkMoa7wpKDCo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 216       )
GiTtEGQ0QW+WsGTFGX8O0AXNghRtKOtyX0f5LJEX5PdGYt7oVM+QdRSvG4Ll8um1
78HuQcWJchX/XxUgev5vbZFz6uwvZ85ZAz99YcqtUaYcEMcu9Q78Xjgtz3f3xeVt
HvDp9POAX4OtKoHUNNPgaIGMTkxfNbkgw3I26AlsdAmUu0XWpC/x9pPqXYb7dDKw
cKkFgiKFknMboSxO8y6CXJcOPIohp1CKZcqghz2Ier/pHEZG/NwJL5aH+7ph7wBh
jRT55KXBuzQRKizag8dWmaAxfkjf1J/oaYVdBqxUL2g=
`pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT agents.
 */
class svt_component_bfm extends `SVT_XVM(component);

  // Declare all of the properties and methods for this component
  `SVT_BFM_UTIL_DECL(svt_component_bfm)

  // Declare all of the virtual methods which allow access to the base VMT commands
  `SVT_XACTOR_BFM_VMT_CMD_METHODS_DECL

endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oPXe8BtbhFmCuJy4IvAatnT/fE8LvoEGeC1FrI+q5RXZS4FHPpdAkR5jrlOsEiNl
pi4bIqTnZShvqZxyJwZeTPUUw6lDoVAfBx1wgBCntd8pL0ZkviqX0L6kFvd4ZnkM
JRmQqv2EDfwBZn4hgIBv1e5zRvElGy5CdETc8toSUsY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 537       )
bCDDJoRmSVczwzOJJe6FKjXZ3GVFsTl0GdWU+D8YKlRgQzR0gTYg9RKJka9Wkaaz
6u5i2abbNh3cujl3E0v+gh2nYrlWBKpzjjB/PnJ5BKzOVmWp/HuVYXAmWfyvl5BD
VRkJ1VA1JandELMeJ1xsPd0V0JZXz3IU2A2x3deQ2JKKtgnPDsl2ZE+wvK0wKMF2
7SnKtvHY0/dvgUcg0nPOPffAPD4WTQrdoCu+UyUSQjAYX5z5T2AfR7qPMrx/WoXd
7nLRXaj/9gGcE3nhfCtE919cqzaSVrfhBebvC6EbXbeH/KJvYR/+ZCrpYDLGUc8w
/WH5BdQwfUOCwA4rJSo+cDt+pms3OveXnC/GkZ0UkuDoUf6PUO/Nws06FGYYeP6x
/LPZ7bkdB+5ZeUE4f2/tsWE2HY4Oz6JGO30L5fwX/aC66N6chdJpjwznaDjLa0kZ
`pragma protect end_protected

`SVT_BFM_UTIL_REPORT_CATCHER_NO_PARAM_DECL(svt_component_bfm)

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YO2nTtuh89OpymIxQmPGE3RLWi+CD5h4KKV2fWbspuoABnBlVbAdhOKo/9OUaBtG
bC24du01USqw038nTeYBy9IquwujsERwRD/ILOpoQjuC6wt5IYPeG3DdfKILHcMG
Xq6ORMzEH+iFYseDi0Uqu3sMSYkXwuqj9Xar7UkTv/g=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 681       )
jFnQ86FT1CKlcbJn9zEkiU09vcCfDkZK2HfYwsUtSg270o7c0deKFl0hzQ4jtNIT
DEAJ2QqVFtnSt/I9L0qJoRngd+xfGHW+U55VhZ1bGVx+cVENoDDhbvVPIEkjKf8F
S86vr7HEvcRoXFzcy7x5MGn4AYcmTcqKHixkT0LW06dcKAUV3dhM/IR6VxecoKnC
U7ak5Kj6HmJOdRsnZ3dg0g==
`pragma protect end_protected

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_component_bfm extends svt_component_bfm;
  `uvm_component_utils(svt_uvm_component_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
    super.new(name, parent, suite_name);
  endfunction
endclass
`endif

`endif // GUARD_SVT_COMPONENT_BFM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ersx7AIxnbuG2SSFqcl64820QpuVaPTBZSTIHKYTxPcWosSztR2aXQbDvhfpP+uH
RsyKycWLJIVy8MTujTJnEg6uV+Zjm2yvwuoCYQy0sunuZczEQ69l+NFoQbAj4mUy
WUg2QxuHoboAodxmxsBrod31+CQ9HSfZSHrA4/a8WQw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 764       )
0ipUxP9+7FL9dGClA1GSWE9cRR+1WFFndn4q1mc2unwVEhCT0xJXxmH0bRd88Ys0
nR8PFwfQxLohhhH4tTg/QKR4/F5+ABZLf9+7efQNVJdJXyDAkCR8SuvD5OwQ0caC
`pragma protect end_protected
