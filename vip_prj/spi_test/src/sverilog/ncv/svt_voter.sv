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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
PVodKBbesogSvH+KAcx62QvsBIUsz+sdHDSZ+EahBSj82MSthEWN/WipcnDBzmdo
t4b2flMAcHOoAcS+9V0UrpQfyiVG3MxNNsVQitWvAmsEWzLZGwfGT+ddkHYQxv+I
eEYVamEyd+E3FKGb3boVa8/K3Nv42Qhipt/PPcUQTOjLnWXNotvM2w==
//pragma protect end_key_block
//pragma protect digest_block
S4kYEmbJWRxfVbBa48KkBpz24Ds=
//pragma protect end_digest_block
//pragma protect data_block
Op8RxZlfiC6SoSFLvnXlqIzyouLUgEedbzcXFZaT2TCGE1mDJEnUxTxv4KdoPHSj
S1BJxmJW+IpSdNIxd53FjYPp/d0HWUNT5zAEsUFMIfhbDlVI7LOef7wF8bMA8tw9
33HPtjt+QthJn9yPhQdRt5A71Qejxfg+Bb2+ERlnjbCrjmuPVuoeEzToK9E5y6oG
X8LBQ8MEuLfYTnZ1pbwsUPWo4b6W8yu3WwBmmQ59Apk+WOkpFiUxbjYEhR5z/nS6
iFPxFkPiypHygMs4hlBN8O40zbK2dO/eTrKIzcaXqzIZYlyOlqtFUo8HTd7lRlru
GjsoeJtYYmpXDiY4BcBkMoGNrQoaS20piXfkRLt7vK/GeH2nanWtLbl9bdAZFhQn
pawXUuN+Td0mpOZrlPavSJjf1UtqZECKFkGJZ1kcukdtAqYI3FHqcj7jGsPp2AoE
z2bNYGXqVTEUYwNEcXEI3MAaefll5vOJ++fpNj5z3As=
//pragma protect end_data_block
//pragma protect digest_block
Dl7f+QfMc5XfoaZgT+8nQ0g5ig8=
//pragma protect end_digest_block
//pragma protect end_protected

//---------------------------------------------------------------------
// svt_voter
//

class svt_voter;

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
o9mbeykvEAmKjFW+csVt2hJqS+KRVyokMrliNBIPQQjSFpa/5G8W/ioYbou304s9
3K6LKXGp65v1oG1K0K/17iL0UFmJnsZ9ci7LGjlhvYzTDrVyEXFZSY6Ym8dR5qVu
dIutfuVBCLnqY3y8Dl6Pj6nEn9ly9axBZCMOFPWBGAmW4uLEnhR79w==
//pragma protect end_key_block
//pragma protect digest_block
lINmNHfOXIs3i0e44Euyxg7lh38=
//pragma protect end_digest_block
//pragma protect data_block
IhXBCIsYF6HqeJFaMK6cWeVM2sDseTtkVigsZd+D9um7LeQ0dda45U2NF/YD3aCC
P/BxlH5MA4JWpHlIJdZFnqn0d/BcXHaf/7qKuRdoDzYfXaatx/Uifh7y3Y+ssWB+
u6sw0x+rQUu33GBnDHLvYsn4X9i9brJXe9XCCr3orm3ACOtdiTtOJeo68Dnnvk9v
07C2Skg0co2jI4Yo4fHoLt6RhU4c2KRD3MWmoC94vxAhs8TXfxeG0TEgriqPFSma
qDFPZES6wnbUKe82JXi8XntZ3bgLBMQ1FdZbnrMu2GbJtp4GQ6Ej7M+5n1KlaN4l
qfg+YXAKmN11LtMUzWIqsX8dbqZAJzvZmMQV3WHVBSYs89Ij0hx5TQ6zEiF5ylO7
yBolCtrcRn0yPFa4+QO7TwU5omTp/gSmKijGmoZ9d8rUBlFTw0w9+Ln+LqZgDGqX
HoUq3LpBr7sA/pOCLO8beh1g949TayQWwdOlm95XVWcOwp5L5f+SMGvUZ5EukkQz
mO9X3qMIzsL7xzLCnsvu4jEg01lcwBOI8bBr7/iRZ/pY2yt2a0HCItC2EYbNPWf0
c6Cjo7nF2i9t/PaX9oOXsk7wwvWvw2jb0QK0aUvG31MLbNWDmhxZH9EvS/+zZt7O
7HNCs/gpvraiERFTIUW2/cjG0tQImeHO8UEJBHe6VxeIgFS+w9X5d3yYnZhtOPKr
AfYX5G+odfsRVpRqYpNa+D3tNDR9NDlXVz8Hru7szBBd27idLGd0aNI3tZ6IUwl1
WDtWJwTSFSN/s5KpmUaH8t5OIdpUPTWUqoSXZ5TKRXz0h79o1b5BVpuqZCwFZu0f
RwL3IVp35lyTCvDX/wdthnkI65cevsmYu5H9BOi0ZD/mZZzWpdo6jRtPVpj51/mr
H3WGNTh4iWwOsEl1W/fdHkOEeert6vKVGhqvf7Vuafcjn069ASOsmWEf+dTDolAQ
pPgRNhZoWHdH1Uewj4h3Neb+1WfIGz4GVC77XR0ZtgpSFnXkmxxFoUeLFVLo5Uzu
pUQ4Ewfiq1CgO74Rcn1QVer/CgYCBtAsH1PfaewhBTijmeRVkOKthopEhSC8I6iq
VVh1K3qldRmyr5eqcZSIB+dYM4JVAE29AjcmWTEdsv2MxVOp7qxSJzRG/uustVx9
JW8A8I1e7wwxmAITCykF3YQBfvGpdYIFI5FZ5yjfO/jCun/wNyVtYv4chx9q68bn
BVwts9+LSJV5A0q2T69Uw+S7T4UIfqQUDeY0BcUmTmEkAWlLLUfeF1i5fXeYTqi5
KlwY+yEx/wzrKfg1xjcDzpp0ZLYcajIWFR2yoAyYBFMndsxDuMknePQF0LbuyLcO
T0R4BIqsRHfq7AvHjs/SEED8qy4eHzICN5yeERp0zGf8hkHzoqET4ovbHAY3JwY3
iqFvYrD9oi83vGsAQk3yvg==
//pragma protect end_data_block
//pragma protect digest_block
TK2R5ZJowqD2E7X7axPC9+WO5Lo=
//pragma protect end_digest_block
//pragma protect end_protected

endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
oVe39dFz6ZaDJ/hqhHY/wc7FSFodmiySB52ABv+wWfJEVfgAdHt+cpW6exsaTrPg
YPYJj//4zHkZxlu2A+vi7VJPtbBEARKV6LhoN7D9Onf5hNZjf8x7mRVDfI5ovEi+
M62dTGR/Wgx2C/9HpElbzwQw912e56yvN4wSkSqL5xQI7N5FwcZwTA==
//pragma protect end_key_block
//pragma protect digest_block
K7zZEvz2yDpe+tusyojLj0HOq90=
//pragma protect end_digest_block
//pragma protect data_block
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
V4m7v0scR1GnhQXaXJq3jw==
//pragma protect end_data_block
//pragma protect digest_block
oMr0p8Ix5kjEpg6CBP2SY5Yu1cQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // SVT_O/UVM_TECHNOLOGY

`endif // GUARD_SVT_VOTER_SV
