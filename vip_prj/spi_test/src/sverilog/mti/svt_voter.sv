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

`ifndef GUARD_SVT_VOTER_SV
`define GUARD_SVT_VOTER_SV

`ifdef SVT_VMM_TECHNOLOGY

// Use vmm_voter for the basic voter definition
`define SVT_VOTER_BASE_TYPE vmm_voter

`else // SVT_O/UVM_TECHNOLOGY

// If not using VMM technology then create equivalent voter functionality, relying on uvm_objection
`define SVT_VOTER_BASE_TYPE svt_voter

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
o2nCw3TR/9IzkMCnb5v/9eFmfDXe/l/nTaUhsEIFGDaIhZZRkqmLGNr78ldmrodN
T+KFkXAHkKfDakijOT/h22V9oZvfxyD492EaD4QwScvC4izfmH9vMoGNIMHu0oTi
mDJuoqjFf/oPFoO6y/YrVOKtP+YTYL7b2lljcSqKu3M=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 190       )
Mi3GO3s0Rl5LbEwuUSzCF9+7aCXNuGIKnTxCxiTUxWnp/2s5oI9YLEEgQNCvEbuo
+eAuAkt59XzviNWVukWk+yPFV2adXL3vOefsJGYxOWDMUg3TiEof7lGb4bydb1HF
KnNoHMunqrqT+QRIPS4zEkRRi2xXmBUni99dZhho0yYndcJMM/YVTdst37xHqFn5
KRvUCSoEEw8+I68b8kFwzynUCnLuLwZGRFQY9uZO6vgIdy5bKzu5Jl003hT481wL
`pragma protect end_protected

//---------------------------------------------------------------------
// svt_voter
//

class svt_voter;

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dwczmMZnZUH2nutkPHGPT9gFWECbsad1PY1H7PQiH/jkKVAAdPa5HwPNBFgIsRpr
lzIobRg/+UHCjckuC+FeMld+EVZej0aROvu0pZlMCKytDmEqwRizE30ZXPpkVznA
treF/kXN8PyNJImihsqN9yXldWVZyGNXh+N/xYHQhiY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1083      )
CaSLLmaJ1GWSBMPSqn7nnW3GswHl2oacMhjniwdSgDcwNnqXhtRY3mP02U+6gXdW
cOMMfuwPUVqBCe2pMxcWKw+FebTIJsiu6RYMW49mczRor3NpDnjsMGz7MyaehBRH
cPmf+hUzHw8GeQUuKH7fAelVR89MhqJ5RziF/b2ouwsBT4WlJzQdVlc7C48GdHZZ
7Q6jQdjDdv4ZPk5jvxsUtkn0V3EX+YIfSDY2kWlYBkptc582wnDkTPg5qApxAFPq
p8+htRK8NsHIju2iqzPlKtgti0tZ31hiuTSloBWxacngRHV8aiCclmC7j37z4w3f
B938zhXmngbfJFe1fLyRRd1OFlgm/WIyHq6uX8Uz+NSWF9lPxdjxRTiBuXkhCd4r
MEDFQZKiu5n3ycTkvp1l7aM12FlMxGGk5ca59ii0E9KGvZqYNcuwYLk64h60tm6y
0I58eNzy2z+jMLsWwi0PO86LCg6tQpEyHi66+kEPP+fBKcs9k3X6uG47Oi34NQjF
jzieBkYNF3n8CuVURJLQXKmG1R4g4Zlek3kB165zU5ve5jp19O8tFhHILqjCYgLV
+O2rzR//bPhlC5mHvjYTtSrYBHo/hkirYcqGCJvii4mfPzdQiMKJ6YB++wgk8syg
ComRy41iSyKI3bGm6m/KEawjAWo4C8fAURiWfZQl4X6DDj/1QtczrKOF+gMacfk3
3dpcECDoW6ChC8TItkfYVM0IAH8ZLkGlfAGGkuL+Ja2LvHJCeLSr0oqKP0JYhYmR
8EEjIDBVSKZrKXmv/vNIop5FB86vQ/NeJpvIzQCKkzAw7PnwVpJFNsqdInk8+anh
a0yiD6t4CuOTw0cmBhqopvntQlrBIWndKyItlkGrUjPnPDnJfLKWW1D9idCw1eNH
2e+b/JOD+PpB2lAsTQxenqmKIqJKoGkakhJxxpIvX6haIZi8p81CThm/nDdkd2dU
1G9nj8EXppHAxO7Bq4sJ8d2mqrtlS8pF7E7ed8laFupVILhRw4rgR0gDqlpM37J8
vzJRoQB+zQJwPOMY3u8CI9EA+1u5/th+D5Tkt2kWBJw3T1TC8i6BxiFnk8mYe7Rc
vn6gGdMdq2QqzNJpEiwxlqxb6UKQKZXcoojCHd4dQrIx/NS5kKG5jbrZsrGSqhHK
Qq2woyyMMZIOyM4413u3xj4w6SkFkFAhxVYhx8UhPNs=
`pragma protect end_protected

endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
H2lNXBrV9NWISxqgwVwKO4NmIsCLk7N+PO1LIFO+zzFGpUJxYU5TfXxvlYxQyVZ/
LuxwS6Z4dDuE/AEHJZaoNWJZUHJw//X6d7t8r1iK/nVI315+CPyQ6X5DpcM39yQb
iLdtJN4f+5vHGia2NPUOqXyPkcTiQVYkoM/ckzG9G1Q=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3381      )
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
`pragma protect end_protected

`endif // SVT_O/UVM_TECHNOLOGY

`endif // GUARD_SVT_VOTER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
F3s1/YfJFw+b5/hcFyojuBPnQ8OfWEhCprdskid5NzWf2qSej6u5mChPB002ucXD
uQzKKiMM1N+4x8HpBe2TVmcb54mF62UmyI66zbw5slNuTeYHO1rMVz1BdBzGD9Z6
UrC2nh7Y7ftbkX+AtIaydgX1pC0lDmutNdBqJaXj7RU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3464      )
9+aztuuliCStcgzqRjUbj25nhG+hOq5lu8OSBXo6tBnBIdjqMch/U8MTLrvP0Psf
W9RPvUBjFtJy7w37WzxlaVbKSC5naN56KCTrYJTOVeBDgiiTgPR9+EBiAeeTljS4
`pragma protect end_protected
