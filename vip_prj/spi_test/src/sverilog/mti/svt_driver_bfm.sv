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

`ifndef GUARD_SVT_DRIVER_BFM_SV
`define GUARD_SVT_DRIVER_BFM_SV

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
DvmJUdFM9X03rIYN0cuqJs0KL6R5oHWA1SBkYRqWOrSKnuoDLBsxpNcTU9/l8V2X
fPjEwE+esCRhO3zKro+/BR/SeB3+Ulopi6ZgHZaRTYsynPHMpPwX6rkFYCZUIg61
r3tDy+oPNtHY6fbZf6CQwVUoIIVpwEN8A1Nq1MKlJh8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 213       )
l46CCi7jFx5bhisr/qB7UDcKoaKii53S8mGx4fCRTSAJ8TlzOd5Pv6WxQfNlfFBz
5KYXjycnYSAFuSKOxjyhnefEDV7KPE+RMTOx7Q+uHLYIxQD8IQrqG3tkPoOkGplA
eA9zkU8wS+NXKB0DB72qokBezVqY7bJCkLauIPjelo7UIzvkxwWUsEW+Wc4ZKe6W
esqd++AeBY9+acI1+gZGseOZq9YYINyZG3Jr/HQ63HgsX/ZxERAqKE/QtSEc5HTT
BJIwMq9CMOvR+VKULTlp0WgKF4scuZlnOGmabs6dPqA=
`pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT agents.
 */
class svt_driver_bfm#(type REQ=`SVT_XVM(sequence_item),
                      type RSP=REQ) extends `SVT_XVM(driver)#(REQ,RSP);

  // Declare all of the properties and methods for this driver
  `SVT_BFM_UTIL_DECL(svt_driver_bfm)

  // Declare all of the virtual methods which allow access to the base VMT commands
  `SVT_XACTOR_BFM_VMT_CMD_METHODS_DECL

endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XYwRJMYlL/rlyM+beoj+xvYQ2qddllpr+cDKHhtleW47BNVa+UOzxwmD29VEc+SR
WskCX9cAB/tbr4a46MbyzwGJbb/VZBgjRkwzdaZOPhv5psfXmP8L/fM+mcV57DHR
GFy5lAIUZj7CB3edGIBtyOBVEbfYEn8N6/mXnAJglxo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 525       )
xmVDTeGUQQIIueQZQCbi7zZbyTAwtb6dg5rnebZdeuKCeA5A7K47PsQW8LqIH7fi
5rL9inOzqzB1Ig30Q7r4cVE+2jxZbBARB50zjVOSx6zRh67jJNQhPmOxyrJV/wDA
2iD1Gw2lBmDA29Xb1DzO3UH6A6DPDy+Mm0kN84wlgHIeUWgLgzqN2XqojaUzmU5i
5uk8EJyk8kIg8b3+AEAJwZ8JNjfiaCEsXWvUegezPH96n47hRxIijPpIVRp+NmeT
fA/swin5x5JZyWdT96ZmfNfj3m2WhvrFh8+bBaio097Q96vZhUVfPi52nqBNsCZk
rY97OxYoYaKJHLItF9OHlAY4xP9oMhsYJvi47yODxnHqaGd+D9uJoohjuZEfq/Rx
L9k939p/hiTWnlfSg2eLWjgCukcQqPeDvE18PN7i+0c=
`pragma protect end_protected

`SVT_BFM_UTIL_REPORT_CATCHER_PARAM_DECL(svt_driver_bfm)

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nioCaGwPxOtqH/XB+7hGB7u9yOzq0Q8B/NqrhzK8eauFILv2loLF+WhoqSyWf9Dx
owu8YsYxN3v9uzhEDsdTqG7H1BEB96V+PiSbtaj3jyxKkmiRFEiG1qh8ae7ALS5a
8tCky2cWw86w6bhQcSE/lJjAZ8p/OkY5eirFnkmZlIA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 663       )
msiBCXsNGv0CDORjWlSxI32R2q8mGx3VyySxom2bZzvBaOH8iplLOHNsiPyEVhwQ
AKVI64xDHIq/SvCyOgte8H1tZa+qclMEjG8i+xb1WkSINuH3tjxvWvAM4S6zayvy
49UFpGlJtZfUhO8rVwcMPlELPNHLJMlii4fbQL5vNYPRO+RK8lrqJZvh18z6GYLZ
`pragma protect end_protected

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_driver_bfm#(type REQ=uvm_sequence_item,
                          type RSP=REQ) extends svt_driver_bfm#(REQ,RSP);
  `uvm_component_utils(svt_uvm_driver_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
     super.new(name, parent, suite_name);
  endfunction
endclass
`endif

`endif // GUARD_SVT_DRIVER_BFM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
du2y2Ju9ixZ00b2R52ptbBn6fF1bhHobUpt17ycaPyySEX78b7tsgToSVFca40c2
DsDscP53vnexlbERLfmc474sXYj2T/P3VHuCfkoaU9s2E9+cSX5t0r2gltvh41Tf
Fjl7btZzeNRSEUTW4lCuAKhG6PEaYIGYsrH2yn6i4pI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 746       )
D1yNI+lcoiAxFcytf8bUNpUIG+ZWxS5ciR9/W7Cn+y32Xlip3mwYzbdRtEz1lxUF
owlMqpXz6Zuzc0PiNKQf6td1RKf8YjFzdj3NSo2q0vqumycn01EmRda3lbd1cjtI
`pragma protect end_protected
