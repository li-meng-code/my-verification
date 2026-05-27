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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
TaavoAzsGtyMohBRECqfOuWqAkLY3w+v3qDbDrN/B+GXAsTPe8WFlqlNcA1FFghn
eRrODQBOOsWpFhK9qqxKiRguk8w6oVL/G+yOlGuyjWDJPhH+W/WRrryadSmhhWq/
QJsNjYcXgH6AxaQpghika6x7HxjM85dxNiAoahQnFDcXTNSBSV5CpA==
//pragma protect end_key_block
//pragma protect digest_block
150RUTpjR1KXiNYvgkaktnhvASk=
//pragma protect end_digest_block
//pragma protect data_block
EnaVWVlwkZ0SRJiItTLdd02QzGoKodOzcPv8KsNZLurqqfAnn3x/vz8zxtTJ8OKo
H84k+vjaOaVw89ehjfFXYvQovEKTI9XIcQ/DWlmq/pnyOUdJVwwfXWe2KBPjy20Y
2QzMt32CBiwG+jeqNFr67VCRZJk1E01zGueYniSM6h46h4api/L2PBa+rtAquF4z
K9765qL6n9JImXbQykc8Ifxql14iITlCj1j9QWzGmoQlyR45lRSdhlwh/qHBxDBQ
qj+X+dRtJ8U0VkYG5AWKJJT2Yezd/68zGYHxPHwH0jjgCdlzwHl4xgW/g01v+Os+
f8aXBC29Gf2u2cE3Tt87zLkcO1/YEolNZRKEP3doIkVJAzy+v3ph0wGapw9cmh7J
vFE52baZw8D2GrXQqdyuu5X/7VPH6Qt/zo4Z74pDqrPuSBZtF51BndKOqkIqfVOf
wfiom3+WppjG4aGE1Y+OJtJ/KC4byRRECTUs9kBaxozGV/IBOgBOEGFwDcT5OtgN

//pragma protect end_data_block
//pragma protect digest_block
onIXyZwQGubmG87dbN+sh9CNAPI=
//pragma protect end_digest_block
//pragma protect end_protected

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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
VyGVosXIYoCNILK+MPaqzkIh8OZArNhTGI6ADKtdEw9TqMJJtJqE1xF+vs2DuX9i
ELqpzaMJK2gAAmYhmaj7YDmOxwIiT133g3yJ9F8dRxkEs2hNowbegDcqKodNdlvc
xmEkLiDVA75ysXmmASN2CBgF+uVOIh916bWE7k7UTTCph3N9X6OJ7A==
//pragma protect end_key_block
//pragma protect digest_block
0I2hPg+UZpQfhQ0fzh3qEeDN9oc=
//pragma protect end_digest_block
//pragma protect data_block
VD3mjau8qM09OAMkqfdykr4IRocZ/vTT5U649cgcPOmu8p5RNOv27HHx24YXrSnl
Ck0/1LFtp3AEwp95W6GziBA/Q/qSO6g2OmXiT1U2rdD7y8fLJQIm0ilJqXnpuzrn
VUGoppfwC/tCeGFyUvlVToWOt+LyuHd3vHiBxZG0zBFHDyMeZ3ZbYxMBaH36+jMv
D3AmvBz+VLgy09Dg21oyR9GuMT4PIKrbDsd9IVKBXUoiGQYSQ1B3SCCjFELLX/lz
i0vepcI5fdj/eaqzhkYYxdrrHO4SOPGF62X6+ihXw+CFjA/bK5Fp1reVHqt8xSNh
2WUvdavEHk+BzYnczKpISMfqkMYU6d25P+qfws3jrF9HC2gvpZaBMOaJT8pppYLP
noDOK6lys5hjhjy+3juazNdUUedvH0tzXpyqFTjy0nvEQsg8Plum2Hc4w++YdgcJ
MiRkYaEM4MMA3uuaxc2wNqKNA+B09Zo8zoliqSTDnRNxd45J5eL71Jf2pTQjpInj
5Y3ThAPVEo8UCWZqft+YMO72D4SlUytPkM1PeDtL3QoxQUiWYaAA7O3wA4rnri6/
x4sErYqmRfQamZ3Td1HA4uFEj1yZ4/0mmB6+uRk0iHt/K09YWDDNvDD0nvvEv5tH
qb1isLd/fvF+a7+dwMmQyw==
//pragma protect end_data_block
//pragma protect digest_block
AfhK3DiznUB1FdNsGGaxiQsijb4=
//pragma protect end_digest_block
//pragma protect end_protected

`SVT_BFM_UTIL_REPORT_CATCHER_NO_PARAM_DECL(svt_component_bfm)

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
GDk5ZDX98EJHd4AwgMvtihxx7UbbKnX7wtbjzQu/CPLyWGOpGmYUhLswuRh035P3
JyXtzXNo4Xh7+H1KMELte7SYFWa/Mnojf7ejmcHkgmVRUYsz51LvwVMIFXJ0LKQm
kxsVhcJF/t7AkxJzVpgk3uIpBXe+9FyUI4NGu4bG/t/ptgWGhGx+8Q==
//pragma protect end_key_block
//pragma protect digest_block
04pcnTbvl7cK/Z/E5R6tDu7IFeA=
//pragma protect end_digest_block
//pragma protect data_block
Eiees2i+Q5HsloNvoKneUn6rZEvWmtocyEQ8kQuiN6cwxdYPCEjtSonxgBHe4tT8
TnC2yUREdI4WHcH1Tk8k0rAMjzpnAj0K+WrCB+ehdjfvIPkS3EbLY7yqeFvNbxLW
f2syn4BvVkFIB9lmhoBSyMoezI+ZybYWhGvxf+lhiv7+GJbDcX3rVOxBr8u6ShQR
A4OYnCqBl71DhhYozXixzfQOBo5sR4dJgREKDxAGLc+gMirGaXHn8X/bCgW57Fry
cNGfgJ2l+rPxtm3CQYZyn/8+H1V4wVlCWED3wfYhSDPU8oioflIKGbuw8FBtOcIS
liSVxMWD8bH4W7L/NK8NYXvXOmHlF4ONdFvzchqSnViDh7G9oIyQ9V5BrITHr1sX
w3bD80olg/kxrNBLdEKzySp7ActaBYswGs4hnlqx83k=
//pragma protect end_data_block
//pragma protect digest_block
dknIMHLbpz3fG7sd8T9dSP0JsH4=
//pragma protect end_digest_block
//pragma protect end_protected

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
