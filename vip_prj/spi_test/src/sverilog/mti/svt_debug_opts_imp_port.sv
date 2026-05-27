//=======================================================================
// COPYRIGHT (C) 2015-2016 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DEBUG_OPTS_IMP_PORT_SV
`define GUARD_SVT_DEBUG_OPTS_IMP_PORT_SV

// =============================================================================
// This file defines ports which are used to help intercept and record sequence
// items as they are going through a publicly accessible component port.
// =============================================================================

/**
 * Macro used to create simple imp ports. Used when there is just one imp port of
 * the given type on a component and suffixes are not necessary.
 */
`define SVT_DEBUG_OPTS_IMP_PORT(PTYPE,T,IMP) \
  svt_debug_opts_``PTYPE``_imp_port#(T, IMP, `SVT_XVM(PTYPE``_imp)#(T, IMP))

/**
 * Macro used to create imp ports for exports with suffixes. Used when there are multiple
 * imp ports of the same type on a component and the suffix is used to differentiate them.
 */
`define SVT_DEBUG_OPTS_IMP_PORT_SFX(PTYPE,SFX,T,IMP) \
  svt_debug_opts_``PTYPE``_imp_port#(T, IMP, `SVT_XVM(PTYPE``_imp``SFX)#(T, IMP))

/**
 * Macro used to define the common fields in the imp port intercept objects.
 */
`define SVT_DEBUG_OPTS_IMP_PORT_INTERCEPT_DECL(PTYPE,IMP,ETYPE) \
  /** Object used to intercept and log sequence items going through the report when enabled. */ \
  local svt_debug_opts_intercept_``PTYPE#(T,IMP,ETYPE) m_intercept;

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gQgmGYJd3HKXvh8XQiZMx+pv9icC6Os0iDL7O4vaPNGIWtfOsQyvh6SafpJC8y/C
slWNkKgWDNB4h6kQngJpnLyWt/iWvZz+ziySMcz6+UvfbxprLuUuqP41D+4mt16U
3+B8h0SMCS0LiyztqHJ6nHZ5ORhxv8q8Y8UQkU3C3+w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 435       )
i73G5EnlRe/ULrQqdB67xmR392m8Y0aRpdkznqRzbpuq1x/hZ3E4Yd+aFEw+HsHi
8l16dNmMIkk4jjG1XVTeKnifKvbljbf8r8wliPYPNdqcS/pcSqAjgk5LBJ8YWNmQ
h7MYrFvjUtbIulFU3iigQNhfriIUZrax45p4d2DSdfdT/stFeNorRnBPPC4BOBDm
jBWbnzjs/4dAO6UiUZRvETB8jzbR7+NsFWhLTgo2XX3XCGZ8S68Szh1/EIgmGYq6
roku8X8KrnXMFdIdiK744oo9wDFIO+iLLTYXbIAWjlAsCXgcrZcRz8DNSgJaSnWZ
IX7FKH9X3PmPUZBxGgB9tDlgycNtyg4rU7XV95AKUd4xTHJN8tO8tcaRItxb06UP
kf67AemOq/O9ADWPH5lM1wx7V8Nm8EanKRLl3xyR8AzDITUqX2wcVprXqXHY8R/c
ual2ZhNJ75xoAC+pWRHhXIagsx1eM2dekOgrIsZM7tZ3olm0doX4Pt8Wfrek6TBd
4tT4Cva77QNaHZFwRTkCGXBfWFpZeJiA/08TT6q5vfbvhyfzl980j5ug3Qbs/VZH
Pa+TrNn2qGExN3xamNiflg==
`pragma protect end_protected

class svt_debug_opts_blocking_put_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_put_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UJJxix549xIKOQ1WMY279jPEwbN2LR9SWCgVWSr46MBoo81gIlltWPL2TsdNpphW
Y4U4NJWytt3EBNJLO7H4HZ8+FXOvrNMQDveweM03ZjGmBfPOXSwYL0hPj0+uNm2h
B+yR7cr7/IFkkBlAKt6wLFzozVAoeWS7zuK1LqjJPeA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 657       )
zF1g0TKCMUUBvoHyBp/5ohgDwnUO5OprBB4E0Zmcl7Wuefz8h+WHuxCHaWvVYZh3
ELWdO80kHO6YAMKlLBuOexcrmRmSLmyrDo1Uj9e7Hep1kXqtJhUQwvJvV9wAVFXb
NPr7hKq/K+oPDvT9ix2qOpqD8erdDKSfQ6WUAKUXFB7/kifUO/3MSN1ma3xL1gHE
jPAZnKtbvVgRSiCvagLGUy6mEH6IeKlgyl0P5/cXXJqiP4Xr8E+TiEe8coPHucFE
vpRU68KyjcHiw3QqSmwzpYR/H/cwgxr8KfFMVyF7eqo=
`pragma protect end_protected
endclass

/** This class extends the nonblocking_put port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_put_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_put_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ajgsms52EBPyHKSRiA9es/kOw5w/uFMAX+GX4Ewqv1THIb6Mln9fYN3/kfN/Hcmf
0OswurQZq6HjfYVhAXzkurCgsdPYeChq4zlHfLe+TSkhq7+Yx6xpe1nWHeCScE82
Bl0erplG/N5YutR4zvSs9qWOG+3PO9gSKEEaKM6H1Hc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 882       )
FqPwwjPpBqaV77uET/OO8lskIB+VQz+arKSuEaW4/6Zn/2RGEluEhCrBb+FglBSz
mq4jOi8gUCY4NoY2whOZ3Q3UNbhC6qFcE225NOiVrvKjxdVNhzt51AmpcPVud63d
UmTT4t+O/Hf5aNrznKjnzQSUu01UC4XJnMhsNSo7zb3KQtbtjshyhgyENvJxadul
vTg4pZZN3vTrkaa/T0STDYDNzSXQWLGGt7MFMKhyuxkcl3koij4zLfGtoGNAZjul
NPdjw0jl04JJt8cSK5c+Ybb7f2Gu91uEi3RGks+MEaMSKPhi0CUeTJuRYQKAWwWa
`pragma protect end_protected
endclass

/** This class extends the put port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_put_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(put_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
czhm+n3UsAYYLRzv3FAjpoTVJqbIqvZgufGpSOrV+6clg/mzfFraGmOCnBg7ByH/
YugSCFLra0PevlZ5t9gIXuIfwtEgmNf2RFby6AdGq/KadA63sedEgZk+f2OeSl+f
rjoDb+8qlb5f+qNTuVgHVI6N/Fn8uVldA3Idc1JEtRM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1095      )
bTYf/PxqbcmgYrLAz6797mrcadvP737IlI4VnZZvkPkNSVSo6iaaGFoPm5mDcd+0
OkKEJb2ei+ZFhKOgZUOCDhBPBxncXFI/wfYlBB8DDDwqCC+uB7ylkwTX2N/R9/38
Vy1pn0iUfByaNqgkIHFl0MOke8DKVAl1GEp7VaOaFJYCG48w6ygKOZ7xsJNHNzIh
+u0SqcDqUvCcaAsyb5NSbeFWU6ZlXuMtqfGivL/M3qWmCEFguhKrUnIfI6vG6dpf
jsqK/RrLbFY1U9ByUdmmR7awkNokh17/9RaPwy2V+/4=
`pragma protect end_protected
endclass

/** This class extends the blocking_get port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_blocking_get_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_get_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LwIZl7y/qFKl5ciDu/a5dJSx4kYGkPdzyQmr7evDN15fKK1p0y2oqU2W8vLTfUUR
NJkG/LT04zPChpDSKtGKA4LaoNnhMJ8K5Zm1FGM/nFuHnSTcRBg1RnPvHgvu7h5M
yYNn+XzVspbO0pNki5Q09+fD+GiYejvHOswEOLleWCc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1317      )
tUc+WKLCmgf7ZWU6PRVHwWVM+REfbuW9foCowigVyxMcCF4EuldAYI0MWCHamhrb
XoOw48URlmjUHojGho2+lVKGx8N2HPzk3AWs3ZFuuw8rPx8A4Dr0U9F/+issO3z2
ZkENcDDEVSTiYysZGnSUfiBef3QJEGRFo7nxmcxxpu+KbxK5n0AlKDeE0ePIfgix
KB0ERgO38+fTT5Y499qu0AuiJIKfJHNSnK/FqhgISy0YE5lguMlr6+pKkxr8Tpve
IoZnUzDQywrmgbQeMPxQ3M9JRTuuvpLuW/CQfbRiFX0=
`pragma protect end_protected
endclass

/** This class extends the nonblocking_get port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_get_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_get_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FqdGE6NnPX2UwkwQVg+oxNeWj5h/QtepC/5kGl7AddISQdsrheiT1fYEATg+/9w/
pUKIWN7TaAq/wp+XSzGwkb36O3msPuVGz4tVgQlJBtcx71JOUYnpk0kucKUJFY8z
hCjy+c1Fp3YEV7UkbfKXHW5gIuuvU3LkyI4/0syLfSs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1542      )
zfGcSiXQ5E+7bdjLJG9Qki/gynmL2endNuDArXtKSstJjqEB5uKFSw9J7BReDeK1
xOxPv0uId0qU4tipWxzvwbO43+Egs50kRfxXVxpfdGi1wyY/SjGTYE9liIX6Atsx
2A/xBv1LHtJBVMM5S3tYF0KwYuzN0PCVqkrTNRjNu1Ol4h0QBLQvuRIkSeZjc1px
emsS71Z2OffmE8UeFiAipPzzqTasje4ySBgx8sdT6cKNp+xXFOe4MExeIvJXID2A
RaFxL4gNtEXukJIua+kKHg5S4IwOCwTItN40irqWDlrjTPcRRLTlz4pKkq9hG/T4
`pragma protect end_protected
endclass

/** This class extends the get port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_get_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(get_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ip7Tu1S2vm0FVZTxj+8Y1Mitu/0TiXM3EI8hkLrHMnLqYpolsG3Dj7y7bdavLscC
hBg5OnE2mw7NPC0mPHwkY/XFGzM42WuxA+PqjVJR2RPZpT1ux9bhTc5zyB+q8vpl
vbe3Rhxn/8udIjwsO9UaQDmjrjnN9QFq5nFhzF+zOQA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1755      )
gHYquR8ImwqUwKulwQa6AtTEaGEwHdXvA65KjszRAWukYMBae+/OZH7JHkXv9EMw
SaHvacnovw/5znqzToZKEYhpuZzpTf57xVTcUoHoS9tVvFuCF+gX6/iw1CgCNapM
eSQu3AilDckeauX8lPQrxNX5h+GVQK5yhbTcnxHiD0Zz4k0AhS8DLeOsyKHidsCj
dynhiMJiV+UT4wq5p3OUTwV0J+nnveC00O7kx7uI5VU7hgSsxv0itZRQmE5wh6Zt
ocMLHmylbb+IfLrVHrDkSFwuBuHSixzZnP1wKolTg68=
`pragma protect end_protected
endclass

/** This class extends the blocking_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_blocking_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_peek_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XPcBx5Mvfpkzg0joueg72JT1Wj0RaHCifYYgcycKgiM/owKj1PGwtTA3LYwPHxF/
q3/MN96eyf1DK5+fsmbA7GHUdGL7QUgtSusNqc5stHaLuQffDQ8lGttPEvOoGfnF
oSKw8bEdzdd9VwxLgoLOkSKaPHXMg0GgfQmegeVn5ZQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1978      )
mEaSr0+WjltsjG+ITM2Crx4WOY55LTDm/0ICGSZpUj7bCTO6KOTdgTgbNm/vE393
L0jb5wXx8dYf0a19ytA9aVYIKuPHN5LRyTG61clZvnFmNeDErdoG43O8RFJqBqcA
sH+NNE8woZRbYYPe7bAWn2nuRrTp0d8C/M66cudGbogghkVoszvkyZXgD1uL2hs8
N39YFkRV7H6PfeDM/fk20E5b/X2JA4IuCtIEPH7AjFrl1gEuU5Yx30fB2KSGwSUL
MtRdBb5lQyxgfuEHodfZ/qb2IA9TS39+fHcCISL7h0c=
`pragma protect end_protected
endclass

/** This class extends the nonblocking_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_peek_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mSwjsjc2GmzxIzV/ilrbq5j6HE+ZmueGGIycTLDPpT4aKAzuBt71DjqZkJYq+7XH
lfX8l4BcCFd20z5fDV4hmlcFBtEnRjuh5wbEnnY4QUBqt1qy+wyuxUHCaChu490G
lGZc33VCxuYCGsqcIKa1BHl3yz8BLFOQtKgQlgp5W+w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2204      )
x0o/9qPqEWJCI9hF8So9WmRf4dLBK0fu87nGgMXAr7ZINC/vjImvSfPRhRHlhqPF
Ps+k0J5U41ttqwthuwpxvCuHf4RbxKUZKjsqZ+UnE6ex+hyfnT1VtEZD5Bb243Ve
V/Tl27BhlBcS1lyrhhIitm7Z3ra/NGWzwNpTHWzrMWV5vFnWnONl3GbBtXh8em3k
KDhaJ7/jPVq+9EQOwsknk/uwloRdIitt1gBFoMcqCsqwGBrlWMSj8dpYZnpuzkjI
1EFF223VwplOrFwl4fM3c99yaavY/O7lW8xcpZmhsUkRyuNQFEsRzHSdrsq1ELBN
`pragma protect end_protected
endclass

/** This class extends the peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(peek_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KODg3L5HzvJyiF/WzuK7ZDjk8vfdy4F/OWfwW87fCyvCkH1ZLdTojNfgl9vgTvDt
Tuh3aC5LBYeBKKH3kw4Xlp2wUAwYeCLsS04268+nIy1Flea1397uJVBZl54mf0ae
NHL4/BXrrKx2a6JvOWfo3THOB0gVY6nMBVbbIztG4Qk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2418      )
xMpAHuBdUOjUOmgA/Zh7+Oy3khLnIfRKRNGhJ6qODpqiDA8xBC8dnTjWzv88S7Dr
rHX9v+w3ARNz4pdsyFJOMAG1JjiRYB+JLvYdhcYOIrjm3Xw/4uFDqun5IATZkPa4
t65CfvHbK8ne2pchLVw8YQzQgr4GMB2w4r3dWK+wi5CFCFEYD4eOTkMPnQFPwL75
H95FZXfrFJbJExqvfjqBMIyUAf8j5+rLxY2p66cNKrnXUaAhHa9R58X6Hg1pgvql
A2FQbF83TfLy0Z7yEsFdMXnVbEF8kKRXutcSKSR8q/M=
`pragma protect end_protected
endclass

/** This class extends the blocking_get_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_blocking_get_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_get_peek_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JWK4pG45jIB/GYCtE3RDYQmdm2WVmNDKgqB+nqgkYEqUxp6WXbQpyjTcdMG4rc09
p11Yl+JWC+yXFvN6RqZqLqzs9fWaEaRy7vAufXT/aHZmQQlcXYGIsmxnFBAuPWdX
jLqBclNUjXvnsOvC2sHuxAgqYBjuXn93agxm89FJeTA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2645      )
me7vy7kefaAVGEOl03tZME0HIFp5+WeK6P84eb7UIv4+qBKPzOE/3Q4Dhj8FvfH2
HSyCHI5AOOap59VMBCwUN6EHJYxIceW4U6urb+WX+JyzI36en/QH/FSg39XKqDiW
CRwJDJdLtWP8QFdKrzDsRBJGY6mftU1zXkkfJzKJGJpyg6b+vZJIYbOJGrQajzJE
Jpp0Rl011On6dJ2n55YNrKiMDvyvpoFbdCwxNX6YrO3Y4MjQBvMl17aK8bZ/7Muf
9ltvFnH/LWZcvf1uWVvPxgaOL5l6HySqdcLvQH/GLmBKGmf6okhwMzY9KVXXuNrk
`pragma protect end_protected
endclass

/** This class extends the nonblocking_get_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_get_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_get_peek_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MwK18AhdgJb5P7pZQpP/sU6YnGPo6t2WTda8WPear1ovYL8ZU+aDFwHa7MqplN1N
r90lotNgjDrNdjqtfZi3fVuTok4nC7tPZbJoJvFW84M0A7k5huevDIDP0TAgZMgQ
Q82VKzDi8lC6V/IGecCkcxwg626CgrViNiR0j8Mz0Xk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2875      )
LgkYjCIJhhZwg1hfYJK1EZdCUWJkPvpMr0+6u5W66MwuiSBT4MXPSm/X9VFEhM+Z
4p3OAvis7rjg6jbn8FCGZgkyut/ABQJgBi6BRD9/3gQ1pQs1YHWx3iq8dYz1m1/K
rwhZXgASJPkcqHsJ+3J6nb9iLdZ6o6hZP5YXXjCZEe4yf6B8Ibp/3xLdxUkXYExM
uPj+OChq0RTxmaFa1NsFp0JFJGS3PB8zn3CLBbFFBHw7wIlXsL/wNPvtFBnIE9rE
bKuo4QYUJpjvQpbx+BTy7iBxNiO61I8aYeqg23gNeHx8n96uOzN/PIG8CUxm1xXS
`pragma protect end_protected
endclass

/** This class extends the get_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_get_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(get_peek_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gY0/a7Q7za+nmkx8sBjl1/rc2yL3Ezvr0l48UWPNAHp3cccqz/4q3mWmBlCKxjLr
9+03talyKjGC09tLHvYfWRKcf/R07gKRvNnGbm5PdMf1U0LDfLERghFU0f47DM0F
cJr1wgQeXc9vP8y53GdDCWCosAXlKTMKuv/ZlvpJdLg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3093      )
7cPGyG7Od5IvF1TgSlYXQg9wa/Neymb6Z8vmVdcl3vmqpmB9hmzfE17cTgLG99d1
AK7ZiQz66jR/DM1vNDklJt3yd99J2ff+zR2vauwjG/t6gkMfABCZ4f4wVfsczX/D
0dgcUTmsIryrABpB/G2B7NMakFjqg0+3L6SSytA1k1x+4nqgnh4F5AWySWFipuQT
XX9uDd9b24FZuDyJwLqca+hR6/op/G2n55jdkairx9OeQsVpGHvIRkUeweu/Tgwp
QxXpprKEeCInloBux2iQddey9ayOSkF/R79hGFzhZ4I=
`pragma protect end_protected
endclass

/** This class extends the analysis port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_analysis_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(analysis_port)#(T);
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ff21PDhosX/Cr+kiD/xD7L7Wy6HUKc7EQfrPE1+FVAyoAenPXu3fKTSrcWgRX/Jo
RqEXCwuCvg8JdWKsdcMOUyz7QevG7QEsDW8TQzY7gPATX6LeT9eOns7h5anGBMJc
UYH0KKlMq6MRNcHFrOzL4wnQbKI1dINnSt6sgMA9Cvk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3539      )
zEfnURQSLSYpyIpo/hKmyejQ1b6PNJ4wbwfgTsNZmQoOWOhoP7OatvcWBG1ZIrdX
7cP/2YJDMBsBeWVGNWM6QOW/qou0ABUSTNzbI+IcDdGlcsV1rS9Hrw+rOMeRHav/
XSvj+nnZaGadQrh6CFc7nJlf5tLOoTEcq3aO/dqg+JWKCOWINWb5DTkbyLU/sgxw
PNH5As8WU4ThakYwU/cH1G+4ZHzJ9M9crZkLIvKZcnrppQyNV9akw/y2FrbDuXPe
I+z5fP+48P5kiLDwL62owTSjlVhoL1yf28NzQk/iAibpNbYqC1JraGeZsubVBOAb
H5c2Nt79bQTwTPFBz6ld82z36fxtf/SR9VvqXW52osm1tpQr7EnWlz80JW/0Pg9f
QtsQ86It0AbqlJoD1qXQjudvKJlCMnCJ461i/h8QxwT5IzR6hNWYoZjORyBSSt2Y
zW66WYRx2FsauzmjtUkqi+jZJbEEdwJHP3YGmKXLxssoCftUmmYDx05GcMqjwW4i
SHqQEfuqvA7aIy7lJdWoyeHStqNyQt5qJiIa8Oxp0uKK+VLQEiKV336zsVPufHDE
kTD/GHOSHZhyeiZ8U9dyZw==
`pragma protect end_protected
endclass

`endif // GUARD_SVT_DEBUG_OPTS_IMP_PORT_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LP+RuK+1YYoOqOLpeoM5MtvjqFVZIngOi01oxQSuI4OMX4UPoLtJ9FtM8vD0roJ9
sJ7lFZuYp8xUBIJthc/S1cWrQOBOw75/q4U23wwS9SkBy2A5IjaJDR7oGirRPKAK
Y8k2GvUVwPkdbuBTkrCH7FTjBrEdfRwcAfZ2KY2Ol4Q=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3622      )
j/dbP2T69zslV3pPIcl1ptnRUoYJHQgNUM6A6+oF4o7cU5kaaq/yfSuMdLcXud3J
gWk4i6EZwftgE+P8UudS1Ct1TXNNYmY9vsIRwUbv0ClTF7d3664A94T+PIggW8ez
`pragma protect end_protected
