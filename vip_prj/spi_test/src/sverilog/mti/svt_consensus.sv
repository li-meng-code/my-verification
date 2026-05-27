//=======================================================================
// COPYRIGHT (C) 2011-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_CONSENSUS_SV
`define GUARD_SVT_CONSENSUS_SV

`ifdef SVT_VMM_TECHNOLOGY

// Use vmm_consensus for the basic consensus definition
`define SVT_CONSENSUS_BASE_TYPE vmm_consensus

`else // SVT_O/UVM_TECHNOLOGY

// If not using VMM technology then create equivalent consensus functionality, relying on uvm_objection
`define SVT_CONSENSUS_BASE_TYPE svt_consensus

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pFw/F9Xd+bmF2GZFOG17OybYC3j/psyEkN/56LirXmcCfII77Hpa5to4n65M5GWO
KJ352mdoxRlIIDrZGoSSjcB4cqEQZF1oEEtb7iLagerSzvOEXaTcTHHG/aNO8g+z
BHVrQGq2qu6f6dxhsvu7PvW0svohp1vRNoxeay3Fv2E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 186       )
xvF/ms/cRTKz1eKBNJr5QqZoZRrY03bJtiEjwHuXFdmYNO+fzZ6J6zfB/vv7qHCd
MzlRyAGOjgSa09XoHIau04tA0S1qjYzswUK1XJZG/d41l0zrQF4WhUz4TYYakeXB
94jKhOjhyLxTWgyZIbnnsAPrLxT4y8uHSsD1Nyo4Mj5y69yAzRhcNtXaGKHF5hK+
W/QRW594BfU6ItjrOZfaPSoa9zZyY84QLNDA33yJxxX8XgQMe2Jx3Vkegje7fxd3
`pragma protect end_protected

/**
 * Consensus implementation used to provide a basic consensus capability in UVM.
 */
class svt_consensus extends `SVT_XVM(report_object);

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mauGGUYHfl8F8gAKPITGTx62a5XiUXFNvMYGZkb5gk6RDRe85FKFuRcGIKjO1hfP
SIf+xLVvpOyGavn1kjDA4v7vy2gAQ4OZ3OZM5GxT2jucFpw1f7zVzYSC6it11RwC
6yakAoiTRmIcllvH1051Tz1WhuFiv1j9DKae+byxlgQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1244      )
xo/mS+Hvh61CtgrmYkLAlhXnOfe1qmtqM5d4A5Tz5PxQEj9YebaRwt97eTJ2C17w
VwkigzVZJinpfIF3Yt6t0DOIkJpZb0c1n2mtwk+40Q726oO16oVczwylhgsNxkCU
XS2/Vn99/pG+JHbFdec74iLzeGiG5Ekj3qnSSQktGsTEMhzRuVzQ0A8Kv2GHUER+
RkkjKwuchm2llXwW3WGvr3qbn67lqlm1GfJCQ7BIPUcUXVfsGd9ehCUFf+OiVLNc
AYh2SzSWVzhgxqQp+X7OMRm2Q/FFuZGefnB+YYm329+7DC3Q4heGuDDqZ9lOHRhp
1+UZ9fqiIzJxOJDuU32/sIWOSic6vWMFzQF/22B8i9yREKaJlA6AkO0MQZjAIL8b
efTwOwkEEpvFNgXbLfQuxc4YmtgYTF7s4mKqedLBMutTlHTQCcI55pawETNnDT8r
p2a/hr+wJfe2VEdkdyVNQqTeCA5jslY+hzuJ/hypEXpBNYHHrJ2+rA5joawsY0cb
WD3dztSJ5JvGeqX4K49+M5sM5xPacTt+PxlVe9mtHIapK5M0WSn0maVCiKiJCRfg
CCyejX3K0Xg/nU2lPrGfhZ32AU/lCHZzS5umt5YHhTkA3ew/LFPl3E9jzA93uxpR
Z7DU+P8iLXAnA37qSycEPtXF0/gLPpduM+GW3JbxPgZrVPkMMpO1YbkbYPtEj7XI
Mc4+qVqOcDBHe/JlqKEStg7/duKaPD1MQxxwJC8uPmJ2MA0N7p8YaR9X6qP26/kN
WORn+FBcdhpn+mPTT5B/ImWKGD4w2NayFqxjmchELEmyJSRim5bNNO+m7UsWbMI+
F1Eq8ngzEFIBAThNtImzHe/53d1tSJkvNzt/p0VkUXuZA2Hl4xlE0UQOnOYt3z1D
RsVjAgCmvoLg4/PKYyCV8PBMn2+jo9QQKd/Swc5VVlOgn7UAYGUHrYhiDecEzJVT
j9o5OdmSKytN7ETVNBc9hCcLccKgGhmyyTmZr6zjuwKrkoGGOwpiHRzPxV6y8Vtr
qz7fFkdYl74Af6L2btpz3BDhioukzBbXvpT4biFjbC2qvwfqLfpWO0NwmULZyC5j
e+fxBkmMtkr8IyewgOmkbHDRHkYesqPBIJP2ETL3/hEeQtgJ0l0qDNR2ErY6Y7/p
6S5gzmi1kEaLUo+B9ICRlP4uRw9zmEZnGlDcs3ituRzSENKzJ01grcxnQvBa8P3T
OlAu/QjbhgL2sm6TNOvCcrH6eaKNrXJuZPBUGtfqfa9CtiG7p+c+UtHpzzi7CMWx
EIK/52QyFmSByGwjMLpGd5d9CA2EQiHKRK4ypFzdBhijYZxHIYY++QPz5PlVQAXU
Rri63ohgP5jPgNPJ+TL2ulNtMsqeqJwhny024klW0AMM0d0SkpGnKTf1OabCymxD
pUqbY6Kw5hs1mz+GMRjKXw==
`pragma protect end_protected

endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
G32ozCHjGnWkH+9MxulJy7BcDBI6FKscQfOPBBZeRs4yZrseHxRKR0RxF4iWs+fg
RSj9Kvcuf9fs5Q8Pp/9PUruRfeT8Vc5rlWxD3n0npqLhdfwLqazEGbrKndI64OEA
yeFPz/9yB2MoiT7skJH/C0yy6o9b/vcyyhAHmSFtNF4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4210      )
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
`pragma protect end_protected

`endif // SVT_UVM_TECHNOLOGY

`endif // GUARD_SVT_CONSENSUS_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
M8RLQcSbTmkI9h5Q347QUQDlqX/3XJeDVjzKcAH+ioHAKpKfxN94NAdtJXMVU/EA
4XVyGGtthDZTPxuXqWiV6hvtfIUd8epgn32AC/ka1kawyGG8DbbgQfgdb6wjcrRi
0/rLykTpyMkbWaKmXYBuRCMk7Q/kuZ7LO23CEKDniuQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4293      )
OF+59QEG3kUsyb+abs0Lxz5Qc24JQl4lBiM3ZUYLqECtbw/W+ohWXnl92ayQlciE
BAgeVrHkGf7YvgvU8i+k4us0LgLqZbfoU9egfiPqE0O3gIhTKjHrcc0TPdedLuRN
`pragma protect end_protected
