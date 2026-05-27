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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QM6p1TSyLyE7c0Y8khL3eh38nkqcaj8crVHYk89wmiWGIjLurp9NoIdJZaITPImL
KbgeHmtzlDa/s++CnODulRB+MDLZDQVOy3MTkCfkIVMPuI1/SzMVQC20CzoKnsM4
LvTJ0wrajSn+Azt8XHWCB8nQ3dj4Rwj/WdJX162Cpl/DLiHC6Xx2Jw==
//pragma protect end_key_block
//pragma protect digest_block
gkrKHMtvgKttVYsjg8ZpdpAt6MM=
//pragma protect end_digest_block
//pragma protect data_block
nJCm5ACa8Kc8MSv0x9DTXq0Q11lR8slTrQRRnq40rVI5QzYQuWyOIV5QyAW3Kqjy
PI4tdmO1k+Bg0S7vg6Cc9vrDkdcLG/hsP+hMiv2E+Cp49g7OnaVL1AaSbGaCYZkK
h2LVf6cuMiVBXOy4XNDhimxzwvTPFTOgMDrk8533FMpPlwIoVhIDY7vgXUwKHoFx
64eAqK9mVPtT7Smx3XnQjB6WxApkWtCESvVgLhTgXxvjYnzwKRumbZHEiEOsFfM9
DU6vUerUv26UWfUpRinu0M7LPoUSBc3UsUuo2L0qezAZrldP3Ec2jl7vfxDC/t1w
4mCbxOK63wc8uZMuGbrlbTFhEPlQPZcbPHWAsWIfQ1cZvgE9X+eBzZkhdlecp9Vu
sDzlVMVkZfTGwTzmNBs4FjKMbWJD02APGPB9U/vOhB/87EgRquvDpx0avx74t41H
8te8k0NaAYaoz0gNFL6NxEKy13qEBynL2miFffW42eC0UAblYs3RvoqyUydb5SeD
KeWQjG5N5U75BAPohYQToCDbcE+vNrQ7ml9XS8ZTp5A=
//pragma protect end_data_block
//pragma protect digest_block
KestQ5qI06WnBKiFJNdY90SpPOo=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HHimuOw9y3GqYSkzJTEkbvQXRzsM8OiQ0nlBOlpstw7uyv7l9TxgtrlBTznfCQtb
+bQ5HLJ+T0qEPUb7uz3/3biXWKJMDWQAY4PDD3rM9oS0YQ/a2OPVKazGBPiexu5h
W1qAaEkDpKqI8yEBrRjXO4NE12C8+vNOk7Ev+nBDmkER/ylyBYxDFQ==
//pragma protect end_key_block
//pragma protect digest_block
vzQpYsa6WrFthaoRLV1mqpxcufs=
//pragma protect end_digest_block
//pragma protect data_block
zAJsjvjkN9eG1A1EGnU0zWpoWBZMEjN37ifQuONBOntC+Xd2jNGvcNbe90GeLoI0
89ga1IoavJFgxHujYowq+NMPMIH3xi2dKGS7agavqlCdDRTj32+4SwNmvt/8f5//
DLmLobmJO3okdjbcbgg8rldRmd/mQ4y1g7w134do9KU3gHSKE413aEPWklwDp+D5
Q0zzj52AbHrs73UePsn3zmuF0sHyLe3m4cAadYnwO5LhSYnMSbsP4LZdgTHxzNpa
708700wQWNx2imD8t1NI87UToqPajndl2a/B8dhaezKi6TiEyvATW77ApFBGPv5L
qFnA2lwuc3Hx9O2pXypTvf3LeB7ypQgSljYVTkYu/K2PCbMHQTvibI7sSTCq1cNW
/+X0yRKUF0PoDVy29f4xi/zR47E1Ts33cnbd5y6kFVQ2/gBNklBHMKQcBKlWEIsR
KrFxRQu63+KwYPK1wrBEjq52AzXjnLfZKEgvbVPRAhAk+H7gE70Bec0aDxTYqh28
MKIzcROH7sh0a7AIKDQpM9/bVDpQHHv+mFUu0TwJqW7rCYbmuFUiyAHbfJVe6Wq2
Cx2CiagM7283Sj/73eOYlZrGyuKLzMrYYyJoOmGfWigt46RQp6GrRqXviDrOC0lq
6Fy0WMcsA+LwSzGGgdQ+HJtmcT3Mxq0voCYgnkSMupP6q6K8dWi5FVrTzWiphx5I

//pragma protect end_data_block
//pragma protect digest_block
xB0+/2PjMj3AGZ669GvZZIEpN2U=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HWB8roakbB6LnrTqBHf8kVAdvUDOvEmifIN9kybizmukBaapdd4aKCQrqtjpaEE5
9MkMGNtoqiP6+z8vrB9WmR6lrSGU1gPOKcj3+D/iKuY6UR4JbiTs/YamG6Ldr5zq
rrsS3fc/j+jCiDNAW8Eye/FPkADrs7WV/CFoJRvZYW6RILtqH2azxA==
//pragma protect end_key_block
//pragma protect digest_block
Tg6QqI64jdnwGEsPXQuSfsumWPg=
//pragma protect end_digest_block
//pragma protect data_block
JowM/T9Ot5i1KHkwZRXhweV9+1uuO5vtRYm5rr7H+sTp9Oyt1b4y0aHqzr7dqVk0
6N/grTdOww2tZEnapEjZnd53W6QwxDXeidxUVbO3+dLxohgjDZZCTorGEQZJDMI6
z62+4J1mixpvG2GdaJy7V08OEIYAdHacqLSWL057LUtiW5BcnnbNYZ2UM+dHaIl+
zHENZUJYCoAxna/5m3cdlKxAhks/bBNuEBcfS9b6cQdM+6nf3etkfukFrKxVqZUt
h5z68SR2ooP8yT4+FNZKNJF1WtdO2DDWhw59jJz2GkFv66yjom+FEvCNPb8jUn4X
etLOM7/k3xPM43JosKW9CLU70EnQfVVxXF8EnXEF2IUA3c+8sRT7u7P1X4h2dxOP
CJZU/NBsE0Buk+W7AnkAsgfLOTonjDd3nPMWgrFiV0yXYHY8Wz5+YnlfWwjeUMt2
fHPT+KTKP/JcfmPPnAURz5kj65cZkJ8tHaHhkYR/SLz3byUYUNOOk5qx9lpua9iR
0VEQ4H7OxxA5ODT74oDlAlEDlArAdwgCADew3lOIa8g=
//pragma protect end_data_block
//pragma protect digest_block
BEJa3NW920NXlF4mumEf2G43opE=
//pragma protect end_digest_block
//pragma protect end_protected

   extern virtual task bcast_to_output(int channel_id,
                                       int on_off);
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
yGJLI5x0dUiqhH4uT8u8U8lODv9T8cNLrdSdMRDdjOuas+HGn9ZZECJffIJrbPIm
uxF1StvpAaXSfh4I23sBz+FljG9vACpBWXNLcQ1GlZFymws0eDdmuAAJJKGhUKQV
A31ht2uO4fTs+JQYdpL2ZMpCG/Jev2bFvU9w6EEGawAA7Wn9FASOtA==
//pragma protect end_key_block
//pragma protect digest_block
1wWUOTGcbackegfd0iPvCeH2KAE=
//pragma protect end_digest_block
//pragma protect data_block
FkFgQfkI75iXDyGckTdV89sLigsXtzYIhc888LEmhlDPqwTawzUEjyCUV6kU+9eT
Ke+2s/nCGvV8/CH2hnCAalTmRHW7yOzrx4HJR3HAURake+zyl3PP6DJMK43Q6JPz
64DnQu4S01MYhkoFmr/0V+cf5pk1u+EhLBLsQcNVKrQ6OBcd7m1W90/SvnDhmob7
WzbJTVHv3gQkscADFG0t8Jr4Z8CzJ1mXzB+8aUL0tKAmxgjDx1NF39qVigrfK9sC
qwWGu/AUZDc4jl49b9euqNhrT+VvUBqYHTvjs6Y58z6NyTp/dQZRFdTQCxt41OB+
30rAOMwQPefxeHWGsf5xQ4IINThondnSAVQV5jdEpkXaeAaZ9M3ib9HPRz8GTK8H
syxJx+tdN8v1LVDocjXyvzQxWDzZlqjB8m6VRr0FEHQV9LvpaiMPWZWKCrmH5g+C
MFguDQvm3imnCNR9YM8/VHnrSqDfXHCXM6txCBVrqggHxIEewlM5GXQ0txA+sE61
9muIxPPgs9LN6jf0/DKPKMTfFSFSVXuZOBrpvTaEnLc=
//pragma protect end_data_block
//pragma protect digest_block
3Ma+2uD4CzszdSrSjaBDCnzFLvw=
//pragma protect end_digest_block
//pragma protect end_protected
endclass : svt_broadcast

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
92UTW07oiAahhr7t+IGcG8FnB6uDVr66LGlSaSI7qTxkcAiEuKWDcxNvdvfCBjoD
hCN8O1yVC3Et2Jnj+Y2ErldVWAQ7GgR0cj3cfyPHPCGqxK/ZLDSaC+mHks999+HJ
BbCsf06SMT0wtrH+Gjs9LNZCsMkOvGILifnxSNggh114qsvZsStxwA==
//pragma protect end_key_block
//pragma protect digest_block
MW8A/AKjMJ3qn2i8LjbFbOgl5lQ=
//pragma protect end_digest_block
//pragma protect data_block
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
CgGDDM7tPdOPeMgf/6lW5w==
//pragma protect end_data_block
//pragma protect digest_block
NqCKzElEnwZQ5+JWxd9P5bfwUEY=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
0sLGIZo02oQsVM4gHphaDsx9Wpuo+36WTzNkpN1gBxoPsscwivzC0jVanvP33wtS
qaeaMc4LWtB/xPOtbFYC1iEyVcBreVPDYOaBQcphdM1+G4yvNSXLjzxRV/RyJleI
IERFNmWRRey5fQLsO5y3IVYWBerWnvHUBjIzD2krBaR+Oi7f4OcStA==
//pragma protect end_key_block
//pragma protect digest_block
oVFsPWuwDTKyPGgmWlXzAo2uJ90=
//pragma protect end_digest_block
//pragma protect data_block
f+xHfjqXIxIcZ+ucUO3Nmq0+QVvoRdDlg591vhheY7pZ0wc+kREc9scpOtpP1ghq
U0zcCx7O7HAPIBaoUqxNFYR7i/8GE0I6Gu96rhA7nptVY5lTpc0ozbrxncr7QUl1
qczluLSGsXuZWsEDnYU9l4ZM//woKevGVmllFZhZhO1Ov+DXassnAov+qPURsRx0
DR6H0j/CsJLipumv8V71ww0eCULm4uE5DxeFfityBVvql7Etmi8ThV8Ml0vnw+aL
cNsi0y2EESA0M017uqoiHvyf1xFJTLaX9VqkjiLGV88m7bQMP/bxCD7scpbwVOd6
7rAsO9PshjiqCnh7jxP2SxL5Ag7AC3PBcacTpip9NMo7Bh8Df888YUQPUMEYZfr5
sCjQVDlI3P/bR0bg5RzfN7YfSVWgFOZ3sMBB9WekrNYpHueQm1Q3GFBtajhpc6WP
is8Z7x/cmZ8EwV5BqOR80sKGtUoz5vZDzXc5PfHjoR+cwMmmoWtm9ThzWjHYY/Ia
rCJYoxHy+BuXd4PGAmjXHPRUPFS/L/gFixlh1DN2w5iKFL+m8zx6rIFZ09xlULOO
1/yGmm8j4W2M5tnGkn90Ay0TpvoTQzgz55/ogj60hjyN7wRk/h9ujCmdgkxTMJIY
YW10r9XjeyhRi869opKVVQH3TCybabDxriLWr36dtgncwM0A7M3WAmtscKkEIW2+
E0Yldf4mDF4PzbIb05x1uAHPaTloE5XQhcMVP2Ix1NohIZMgUcO059Zy5J3XPiBj
nGjSx6VDMZMb3hful0UDnA7nO7UlngEgYBLDBVwRqxblq9lF1mfNkzPaFaRT3sch
jfITFOdQAjgg+AbgZv7/Rsd1e7Q/P5XsfA4iFpkz5YxBEioB5+7AhTzDU3QvTynS
AgX1Kxth4vPOYEpGvB2OSigem3mZx5X7drUMfJfsgkwUhrKks90FHh1P4t1p85Yt
PMSNGXsh9ViIFtFmamwI8xZ6V/YE5DUGVSiQ5JHODCFBX09hc5FIaObmoU549kDL
Zy6NAbl9G4bnQ581G/z1D7V4iz/dNSn/dml3I+E7r30w710z/mxHB9UNrVMXYvT1
/roxKL5dCSWSZkwI+Zhg1c27NhfKE1QaK+NGSx+wM9s43CIAQr3JvOUSx4coJlcI
4pGmE2Kf56nEmc8Q8wAbcr/r7Pla21voLHpZZOa0Bm2Ph0kAhzVtX88j6o0uHJyK
cSk+zOe9diUNsoNqRJz1v3PG0M6loF9xi/F0jw0/yHX1JWJsIZAuZyowRCBV3nyy
ju9ll35ChLplaWmFvOTnZUZvAo9P4rAsR4FHssQotwXV/JLQuLrlmd5npiTwzMZ/
QqqNntCG6Iog3Z+dKVYMtrGJyO8g9hnHKCxLNJ0qzEQIHqcxjRx1vbT5gRS672ZR
8wimsS4cXLTEJCShm5U1f8mDmDJnEc7qu/noCUnQXzeyQgm4d1nb4741YYb3Ls2H
gIuVGtckdA3DvBKyPjsP5IdD3kQ+EhvrzQONJrJbL5k=
//pragma protect end_data_block
//pragma protect digest_block
BVe3oDCqvMdhNz6A/KBBUSlm8tI=
//pragma protect end_digest_block
//pragma protect end_protected

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
eyRcZkujOKgrDmyno6Uv7K928Mtl517bB/aUxnKPIGZD8LPVIl8j8pTjUXnN1d2B
DtMtpS7cqM4SCYGVBTVuRfJ/O9dpxYCa0f7cWLvF3ryXNO08DqplfjgEOa1kWIgu
n3L2EnpGLcTUWB4FQgiMkFzaz53tQupfyUKbLgvNrMNH5+sI4pq9JQ==
//pragma protect end_key_block
//pragma protect digest_block
1qP7xM5wsLQeNBHUArBhIsXCgxs=
//pragma protect end_digest_block
//pragma protect data_block
y2w8EUEhCVIuNmVd7QeKJCALuK2t9llNPwdPrt8r1mcCnLwaC8uRYt72tQ3xSlUH
B5vMVLGpcHJxQANyn7lHCtEKsa2rRZFLy9Ot+bDjVQDWeZ+40+j5XRMnPAXZ8naJ
+2hm7OtTVrIys5kW4sbYLzdn0mkR3YTiqP+61GDP5b0LopKpbY8ZF4z0ODr3RR4+
OmRtVN5g3FV7jfsdWH+D42ENS/+n31hfAc/CgZeeHYxmcTTmcXub1yxYW+lmNIdS
qNkuH5mW52TKlApRL7vJCZ0ioxoFlrzGMq2mzXieThmbMPD+77/r6vJOu3q6oo9J
FrZ8T42hpO1YFxjta5+w2p2aNrJmryAGW05/hYg2QPGVfmO0ArHa3vmVUemIFVwN
2RcsDZMRAPMPuQmGYBX6zG6oFDx3gSE51a3KgEDwBEGYNoizBdEaT+Nom8Q3PO6R
keH0oYWQjdx6qzTEvVZlCAX9o5z9C36y6modo9zNOeVtELv3qTapvErw9xKXytvm
i+Pl4jpNAZwQC0LlzLg4EK7Yp13MaGPBI1f2uLUQUYMTsX8TGS9nHx7L3nOP1kZO
Zlc0H3hREKFl6rHWqa7Ce4J77wIcNlzClI3o5AH7qGyG+YwSrRmfu8MS07KInS7N
K/0zOnrWTxlV+jIMlJSkjrqdN4Jz5zTmN8Xul1JrL8gqVNQ5r1E4+miaHYU/UdQL
lpZjYVndehsp1UBPz+dh07d0DNbLf//dTaA0CuNpK3uWnMTAJ/p2nU8tKobRbzhs
UnocRkh5BACrNEWERq0suvsz2ZeRFduwsf8lFni7fG7uTAeRYEzgxt5iPvllYmyA
prHS4edcNfMrfwIQRqlA58RR4qkQehh/CAwKyVYNSxMJdOKc7ciaQtc/4lBakGCp
hw0J6lEXqltQJQ3YXplHo9elhqR0/q+29yr9tKkwNuaLtHYoxR71+aeVTMd1es4B
WEIZ7WNWjI5gzSxMQrl3mm2NHFWR8MZyCmPU8hx3WXmY7MaZ2paHXkQmPSbEzcJL
WxCy6MLQX4uEOEBPENosTIHCB/TTAdDlR3l+m1KM8pgQUONNtYQ28rxaLMrcTPZ+
ZZf5hXpymV4H6qMBKno1npYIMaC2HHOr1DAliHSq0lvxMLn/XAvQ7uEJ7t6+1+QG
6lHn+kRbXdn7/mi4ss8t78l/lqM3wMtGqRbKw1XyGS5oNnJnbDAsrBEGvU6W6a4i
qHO0lqCAp1/STmhMPq6DfdlmmBV8uwzJLxkOwHqlzvVXzcH+Nzxx7vKC8d85n8eS
3TRxFA5/EfJWQe56a6x34Jt0KPlmPVuqg1ZBEEjOlnBrwMJ60DBEMLm/ht/5Ww9q
XSFLYtNa4xhqWMTRWJXrrCUeyiFZlpupgp9w+AU0w9uRkEuano2kzfz4tFU7r6cB
aJI2CZG47cfO1iv+gle2mVDNTTPWnIWFdNSbEmQGknv9iANRAhb1aAM4PFrq3zXt
CC/gw3uYTfUWoQU+dgV4ciJoSVJO7LV91QXtDZ9+pUqDdpb5q5vClfR3REdMaaPs
FtsZfmY+F0oVjPU0ZPQZyg==
//pragma protect end_data_block
//pragma protect digest_block
fF+WZS7zmhM0HyF6l75lB4qiUqY=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
WKAsKXYqzgFqFnAUkCKoDy7ZPPWuqdrD1W7CNoR62/vwEHPnYEE8vIOKIC7KF7Co
sOBCUohTvcEloOHOmBU6ObfkVP/7LKVguLRMAAFfFfIdA+d46xAA17cAcqHpj4x2
rDdTTV/XJNrae0DxqkT+ut6CvfcSYicHM3SETuwL2sNHguGgkEPj/g==
//pragma protect end_key_block
//pragma protect digest_block
567eszXO+JXWCBA3hyZuM+gmYms=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
vz5GdZ3RhKC33DBMfOWDu/KExiQ=
//pragma protect end_digest_block
//pragma protect end_protected
/** @endcond */

`endif // SVT_UVM_TECHNOLOGY

`endif // GUARD_SVT_BROADCAST_SV


