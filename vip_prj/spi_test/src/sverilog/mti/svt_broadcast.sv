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

`ifndef GUARD_SVT_BROADCAST_SV
`define GUARD_SVT_BROADCAST_SV

`ifdef SVT_VMM_TECHNOLOGY

// Use vmm_broadcast for the basic broadcast definition
`define SVT_BROADCAST_BASE_TYPE vmm_broadcast

`else

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
jliNTqJjLkdaJ6we86VAfod7Xyz2ouORBQoD8ArBhiUrWfly2XI5k3ogYFsR+fR9
iUwF9LmAPCjzfXXwLtecp1agzxikMM0QUfwazy3mubLCBtpOI4HRtnK+dcahMLmA
2ECQRUqlas3IkZUUA4BkxNYVhVKD+kIfXXCSaO2fmFk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 239       )
XNpRA+iQWXr80QKAFNH6MdgozwxUFu5Www2OOkzvRbdgKD8y0JC7errLkUVv26JB
eUbWH13vz6Jl+3qdhBw446pJGK0XfOj46eQJKSZIX7ERQ3DAU8YRFTQJ9hsXABmJ
Edkxkjetgwlo1G9xR8zB6Uz+7iTN7kr+II1Z0oDbBMcwlj902z5t2PLL+ZmOtngm
zP9UHmrUb3KZCRBaMrMNzGE9i6MbKIw9NKaOKdyiFHh+isMI8Y5TINWbWbiDoDHp
1T81kNCgAj7yRfC3rEM3ftkZ1rM61vt0EMGO8HIsIcKhswrt3dtXRABEMBRy6ogb
`pragma protect end_protected

/** @cond PRIVATE */

/**
 * This code is based on the vmm_broadcast implementations provided with VCS 2010.06-SP1
 */

/** If using UVM technology then create equivalent broadcast functionality, but assuming sequence_items */
`define SVT_BROADCAST_BASE_TYPE svt_broadcast

/**
 * Broadcast implementation used to provide a basic broadcast capability in UVM.
 */
class svt_broadcast extends svt_xactor;
  
   typedef enum {AFAP = 1,
                 ALAP = 2
                 } bcast_mode_e;

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AR/VuGCMAqQVHpPfQIcwdgUm0xLqC2Xh8RjxsqYt7YVHj+Pg8EqLHIozeDYOCJCd
qL5XWP8C6ibEa1+YiX2d/nK6qdqnXyft1KbEK1naVW7jTkh7/MBOUAjG+XXRa7uT
NoJ9a5P9kuBqQr647jizs9eUb5rK0zQcY5U7qB77dWA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 598       )
nvhzH8L/5d4I694mXwqlaU98WCqq0Z6O96MsHnINphbVMlxptyUaTcr6Zp21UmZ8
QECsXIT1evHA+r256F/7fjNSU8RO70l++6uy7NxECAo93jphE+Th68NPpw64lle3
m22Lf73EVucXYmD4UmryNdpIrBwvYa8mnBdjRbwC0UHsuoKdUWTPhDTzw2+o9jpp
a0/bEZY/SJlfJh0X2+FvEuiw7lat59CS0q7xyHXyG6FVibJIzVm0ORfQmY8uStLF
SfXM2AuKo5lyDXvTNplvbJuHfnZXBFX40Tix73JB/4RTE6gw9oKGDNs8bjEhkKI6
M96lipDUkD/nvJzVCddf7xbAiYFWymNymxPf6MuxMkpxk4CgLU6oEqYOLiECb6Wt
VwLU41AwYae4EHoHqEUQv0Rx8iTArxnynyEj9aiJqvRNRPa0mBKFTBvNiDC5swDH
76pMVtLCjOdbvjplNzndCWEXPPUfoxE8TFRSR4TQ/es=
`pragma protect end_protected

   extern function new(string      suite_name,
                       string      name,
                       `SVT_XVM(component) parent = null,
                       svt_channel source,
                       bit         use_references = 1,
                       int         mode           = AFAP
                       );

   extern virtual function int get_n_out_chans();

   extern virtual task broadcast_mode(bcast_mode_e mode);
   extern virtual function int new_output(svt_channel channel,
                                          logic use_references = 1'bx);
   extern function void delete_out_chans();
   extern virtual function void bcast_on(int unsigned output_id);
   extern virtual function void bcast_off(int unsigned output_id);
   extern virtual protected function bit add_to_output(int unsigned decision_id,
                                                       int unsigned output_id,
                                                       svt_channel       channel,
                                                       `SVT_TRANSACTION_TYPE    obj);
   extern virtual function void reset_xactor(svt_xactor::reset_e rst_typ = SOFT_RST);
   extern protected virtual task main();

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IAwOW2opcUqnqUq6quFIIE0OeToo4xSioHVPQC2TiJbd49eW4n+a4rK40J8ssdDE
tLeP3yWbg/LlZSTRwhNMmHVsK3WkY1GkcTOTFFQHJlFoddXdbY5SYAb2amG4QhWs
Ro2p8A/CJLtWjEKAAbV900DvhWGSzgdN+lpIsxh/b/U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 837       )
0t1n0Xk2FiudhVz4IODzyBMpZansoZLbuZxNG+G4XYmSf5k7pdpI6MalLz5gSe3Q
fHxrRcytDfawOauAELtubIFkx6KxHLwCQlVUcJhY1O0x5xmFfn6151ZSAo0Usur5
KO8y8J00A6cURsFHCM7yEzpvTiZnmJwPw/8OQBsZFdR3HUaD3BJq3pX2ITUjT23A
FrXfVTCzTgMR+pRCkrgEfMKI8XzaEitFBGz9SNBNQv7yDsF6JJdZAlvPT/SwTQ2r
KY/GY7t4TSDQwEBoIVeWmPjOdEaf5e222vUAjoRhAdit5H2TvpjSEhCO4c3sbq3i
`pragma protect end_protected

   extern virtual task bcast_to_output(int channel_id,
                                       int on_off);
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
axy0Zuicmb3tcykhTlI6Hfl/vyXDM5l+SOoMZdBLAe1GsU7qJmPAIyrLrZsAyXb7
HmyjKF0TcnlOCLoKVrpd8eGI/vwZRWtrvR3DcLzxP/LwBlsRnV8Goh4O0pmgrxOj
gf264O2gtP7F3kn7Z4iGvlSv5tX/ZDmEQm8YBjLNZuw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1084      )
/t2okl+bzUoPW7CBl11+uPBL2H0ZIu3Pr0sVjaTBMTDfaYJXfCK9l5ESrrD9NrBN
6RbtWUd5pvJj7BOh4qY9xlOaqzr4cMpcb79EVZeBZxKBADd95+asWZpRoDR30ybY
CHD9I5vYbKqAEPNvdFvwAZsC6mbBs+ikcXhH2FyB/BCpP/RJaMspHmACh3g31siZ
bzzZVkm9Zy2BtI/D3baoGMNH7P91Y0gapAW3Rv6in1041w+a6YzaKT9UbwwG/I9q
kzXdsSDyQbqzVMH0qJPmB2KcH63mhrTdlk6GYgROxXO5PHrk9aEu6vAbjaI6QQnf
F2A9+n5M3g0CKAHU7uTX+g==
`pragma protect end_protected
endclass : svt_broadcast

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KVkQBBjkJIP2hgArBgFG22GT72ijAB5ra+/7dz3XoUXFgJvRqu+5DF/kf267AM12
pmFspwuyImdDfyDtHfHL9tA/R7tGQXde4AGTfJbNLnDRUZDGnqcbUCnSfqGroIwo
m+7nFeRHPHGVmmaWAg55A/OjMgwa/WVeG1vw5xn+8Ug=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3658      )
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
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oADA6rN1yq6DRDvtB42vFNVh5N/yYnIqsooISoudFJJNdZaj3whmnApiB2+exu7S
bzBJGq41bsBe/QYPRi8PoHap+XvgIxsoixPn5hMYzqDm/CkLSTR6WSmqkVJAJtj7
Vj5ynXGDmtXlaBONC3datooeFc5sb6ePQE4lL/n4mHY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4624      )
oHOXGnEfGJhCOuOC98F9D3F0aGr7rkVt5j3l2STxoM0CCjO56l1EHCYxxI0T2tS2
cP3J0PzOTw42uaON9bde7Ms/H4Zs0O/Ll6v3rIXnnz/KxcyGJ2XOVtQuOEt21A+E
x6kXcRKImP0vT/8Qdf3u+wJmTHHUTI5SSgIS/UNiAgBmMyqLE1MagF10ADuIW4eL
nJio97A3fMzf1PxngTk1s7pLhwQsAeAviISdE8QQ3mkc9q1VmGbLulrYy7pFZfeT
ZCIcdnY26kQm096S04q7QSidxXQz35aoQkwX9+jI+z6JHZzl47tt/c0s/bAdKGxS
gdCJ3K8kL97gp0yUFr6Xd2jmTKON0TB3e8PM2rXGJ4B8xaAr+9NsrB6MmBisSwzU
0rtNpuTNC4iFPdDtT2JaPvgjRTX0mZpGwNy7I3g7jXfdtpIYnLhmNWTmu5l405j0
+eO43mA+cBapK/B2VWLn1sJfvXGSMQystc3fFWk6rOM5cDVRgXM0Y3ZIkV+4OY2x
/+v3cT+xk46txGN9SNYDZaCOpSuDnDEurPoHpzGJrl1uUtfXGroHcbO1KuGbrTSG
BYC9yboCV1QbymGnIyYznJIS3iTm5IlUwS9lxpFtlSSuv2sLISdcZcxlYP0hQXvh
IJrh+a46eG5qNa6+Gs1/+AJVD5RV3xpQ3vn6rDrB1cCClrErUUke0eQ1PaEoMG0f
YMj7dG7HVOBx0eAwVSaiBEUUiu3Hzfpeup64hgpnX2qxL5fCr67AuuChRE0v0ZJs
kJv6mzgbytfZypBTkzE52BdUY6UeBB1SIeASPnF7kKHS7X6sDEcqPOX0mJVtmgfl
gsiUPvkW7fjVo9qaTQ3vcTIavANxAgxqsS/5E8TRhJtt6185jBLDaFOlZg1omdgq
NE2DOajPWkvL0NwgGQoOEVG5xHMr0EZf6V/JA30IGRRG9D98rJEgpJoIyLsxWfZ0
DgRYEXCqZSjc8GQNLJY4CReqgRMJdFTuSYObJ6T3zDCKGrW6kPmK66l0nHJrRvZQ
CdnnAIeGQ7NkQCtPMc1/52Zcbua/nFAzZv8OnsihvAyjis3pSJozbSSBQ/Ya5kSu
hy1ut1AWJCv7U1x5vkAuKntUIryH0nt8RCwARWN9V4pebuiqKL+F2KiYHJ4wTmpW
/W8HowXsW9/4lRLOFObaN7Ki9V+sFXpE2YjekTKqfbW+hmHPlsfRLzyfssCHs5DC
3bhUWiC3UOR0URJtbBDlSiBDaOnyQeK+LOyhGtdQJAvdqCOJqokO6OCB8dTSLR3z
MSJz46tjaQdDydqBMx0gKg==
`pragma protect end_protected

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TER9z57k+tpN5lR/YYOhnxxkl8MQpMHb3dZiaipSM/TM8BmRHAqlLDx8JaxCtuUE
IbwfHnkoetgu022szKBnWlX/fDI851vD/avEQdyW6qfXCEViPUvKkTfeQTpcajE8
ik8G/GzL786IJmEut0NZRF1W9oyLcgCmPoBttiUiAVI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5626      )
WDq1Np7cUYCcDLC3pfnOiiDDmIdX/el/jbxrve2AfNw2Vyvg38egC/wwbG9Aoinp
uqrICkHzLirlh3Wo4998bSOF73CU0ike/zC552eKpskd5lD1/YcfuXJsEOpN8AFZ
08z7PUhvcn07ZtidGgaNcuH+lgCKCgqjTo1Wzfh9oJVjvMKtXW7SBqOKqexsvzF5
mhn7sutjRZ1A7JiI/VXIF4Pn6IT9LFsydCjgGlbnaOVc65+kxK9vbA6Jp7dMNmfj
IrywN1w8hM465lY+W+QMz7k/6VsrOn6lYeeSz+sLsH4A32MgRfFWpnN6OObtlsPM
mP6sMzYnse5VU0PEpRKpZx2G31LrvXFrvpFuPh8clzB5+wKfBjrBaFKcAGdaf8ag
WhRU0crN2wpf3yJArVwslxx8nT1syzoezRwaU81JShfQ0WxwqILAOvuJ6xXhEQHH
86CO+bmw6kLqi2wn4TVSQ/0hyxCrSX2kWcUSCrQIfzGDj7OP6BQi2i2U7+ULrPWx
6m6bYCSKXdChi3spX+jdY/hv3U7A9A/1YSAAYjg5qihAzNmSAvHkWgU9Drga2Lie
sWpHgEssqoQcP3I/MZxAn1syfaqAuTxHBqypiDqjavdLkalEev3g+8i3LH8nzBOm
4vHSXrb8yg8yu7rYs3zNDMjcWVGqO9hVR8SC2vFz0QeLWBLefeq8XsrQx9i4bwZK
5NAZ4A9y+YkAbW/7ZOz8++MdxORS/uE8MmDQhhFXgDuAIxyyt5ADuCvmOddQBhm+
uUvIsLiQ1FxWDFcT43j2g5isd4pOAXHZZk/9GPDR0+PSZmYZsJ7wl2qeVe9c+oAa
Aue0G37Ynp1uoJoFXDfwRcOD/IbcVajLgfHvkjm737CxlVjKjxuAou0vmr0naLCP
hJ6tfUYVDP79XI9iB3B4+iqEDdC1vHc8RIrvfJPJIFA6xWzbZSoH7znsMqXwIc3Q
nx6mxn99a4fO63DMu3uH4q/js85Ep7pWLLx7JUq/0cbH9PzjZ5BrQgiZdLjPQ4BO
Dbh3SO0IRYdKECKWwWTppt3fiUoiBfNllD0sOMiEg4JBfXha/zxB+RWTslSakAyy
ashAQpcSVsFWCY9TtQND2usu39EifegY6t190nVwQkkxSqLKKTKNKIS40p86/kuY
gythFDt8dAfxu3I+AkF8xrdmmlj5czoXSq2LVb/Db/aX6m52+s/0u2Sr+gVk2Pfq
4mW0aywTOwT37KAmsTd1/CJihu9Nj43sopjbiXUklVYiwJ7ykeW17yMGFa2GO4Db
EXVcv7oaMwu+uLbxhQfijobJrWxycuxNSp1jw8lIGwydpEJRyTIBovUQkpguAkHg
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hwuXg3SkOAoLCfq4XZ1r6QlR8cKwMfckTADoa5u4cU1Xo3pJAdLea3QHmGmtAG22
O0I1I/1/0B789CyPDbig9FhLCMXKhQWGv0SmertFbSlDU4h5egMQnlahYpGz3USD
/qmsOLEh/Ze1qXDRh8eEjN9yL/Uhvpm7u47h25wHXmc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10204     )
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
`pragma protect end_protected
/** @endcond */

`endif // SVT_UVM_TECHNOLOGY

`endif // GUARD_SVT_BROADCAST_SV


`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pYFncBb8Q3vWA4gyAJUNwW3oflK8OZyU/oN2pOm1O2kieqfYBAHt67wsyM9Drm8b
Cf6oEnExGkTYaPUEhhP0PKKGhGKb3jMleY5sZxuLMCe1T2fsNc27uxMCIQp6Owyd
mcIlgOvFcg6HVP9391H+y4hGp72DakvkkXx8UuQVPjc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10287     )
8askLI2btVIC3RHHbVKegVhDI3F0Vp9lb1eHSTE2yhNew0bYhU7NmRnBx5icviZw
H396+6Y6C2EEf1xXpxGGByS25kwaU6N0Qvm0zekopDMt9VT0YnVZL4lni80s2txJ
`pragma protect end_protected
