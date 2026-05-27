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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nXxCCNvGVyfsCBz9q+1aTeDSbLJH53vhfff94FzhoBPDZLnX9V9Ondca5xeMPDiY
Uxg5wPBnBYlt1D6gO+zLuS1cxNIfa8GNuw3YZTNhKqQESYs8jQc4w6VIOyxtFFOP
mE5xETy3YHXhK7GcVkf3kCJ+K2MEHWqRQmwHIuYtf1OToWG7m4dliQ==
//pragma protect end_key_block
//pragma protect digest_block
ikBJzINYh22XCspGOoyCG6WWm1U=
//pragma protect end_digest_block
//pragma protect data_block
2ss+CwvtVPE0ghSvrJXYj++TgTWZyMLGAIkzFN3R5YUpDooIArsByc6wn/XekNT4
beH+g0CkGSkgftseePKGsVY2sZNgFvDZgIjJKdbUMygk4rdu6IXmWtG0GkA6GHcE
NurP5cy7e/0VxXfBHpIXLrFZgGnHZwQRh70bGqtYqw0hfucF1iI+kvIlY94rukqH
TmLW5NwcX3BhWiDhlBoTKd2p4TvlLu2avyVMHjEmfpX1xJ2+hS+c3JiQ0vYO/ArC
1lBVyeD1gum/8jb+pMg0VN3OXl95B3qwxej/P3MYx8Wxhne/YDQekqHUwdXbN7pL
D6wKKMlBewSxjMIcc4/G7xQiXL9znN2HQu5cbjB56pdJj1Hq0KcMjLmqRc1tK7IU
+iE9R3hQKbsCbF2rWnNSHuhDCyxpdm/42WQek61xzx32puctG7YTGb1gKZaJqCSu
3yoc5qWUUgmlbBo3HOvoxMBQwZML8gARrJ+Lqak+G2HrhMSr5147TnEtTkc+iwc7
3DPLFGhpeFDFQTUckgKq6hiUdGZOdCvm2aS/XqqaGNG2RUFHA+XyitOehAakm4J3
ZKBKOWLxwMXo2xMxW5p3vyS4DXm+vOL/R+fVgfTA38DmU0SqvVMvx+p+bI66zLAG
3TQ+GUNDC1N+hDSyDK1EZGFSLTGi9stCpUxNb2eWEPmj0sREPOTMrfojbw8hdyy3
aekk7BkoYL5w/LZl4rdRAfRXLXPuDpej4BxTqBxvp+FHzcR5JcCxeiCx8WQkJXCJ
a9AV5nd7+kgPdYhi8Y8dyPf/uMtCS+BhOkEG692oOzw=
//pragma protect end_data_block
//pragma protect digest_block
hjjF56IAtRw87+VBxk3KSg3w0Bg=
//pragma protect end_digest_block
//pragma protect end_protected

class svt_debug_opts_blocking_put_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_put_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
6k5miR8pHsNO2tPmR/ct/eQPpM/Ady7n/pr9/5vplEXNyOk2TgccM0YwUVDl94Bq
XlEnpULLqM6UjktA5nd80K2kunsOtffAXl/CLjSyfCd2hnuq6e8/AO7sou8mU2xA
Q+941X5bjsUdrHMSB1Mh99av6GUo/F015f7kRNeuf3Z5Q0xL4gYa7w==
//pragma protect end_key_block
//pragma protect digest_block
UdyZBct2JtgLKeyBRsadR2QTB2A=
//pragma protect end_digest_block
//pragma protect data_block
OceqhC7jBCYqDgOw1OCDheN4BbS8/TE2gVp+mPXVW6jQtoBtm2wFrK8DT0MKjMxO
0L+stx65d/nqGZzWUlxjpOKjxVzzXG8I+UU81xUfaVaLZNLSZmSWB5se9SNNuG9M
/nQmlSQF/UtGrnSLJZ7vrBhE2642GWAcLxDY4M6G56oKjO5c0X30rCbMdmXmJ/b4
n51J0WNqt0c7rNW0PKev5Boe9YB/qoE1TUuPjQApUNgNAsxcTPnWz9fhl+ZBGkDY
jRW7kzrVf+P3EuDKI5cO8LQPAumO53nfVgL6Df8svvBntT296tl/YGDms7SlEoSF
uQZDZLWfqRQTGtboQ0eGbGewLt4PxDbGXpt9Qmx9Kjcc315DXo++LmMRNqWg9f85
ISJWwNbIHhTOAzLndrH9RF8WID3O6iOFajLlacLCrnqkr/gOTgkaocauq6AMgMhY
jfGkUes7MiGHIvDz/pw3LYJIFTyKCwvhlR3PGJ4MDo/ljhhTxQ+BPST8gHdvYB3/
mHonW8yrNXFQ7T8kYLoCBg==
//pragma protect end_data_block
//pragma protect digest_block
j0JTN33UrFsMBNpD9YXFcCH1N3c=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the nonblocking_put port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_put_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_put_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
JGLE8LamdtgYrta3g1tSGiUxqvrFlj2/VCd9+vTsrDy4aI1hYvw47/3C/meEoSXD
u2/JYIZnsVnoGKzEDS2T+OlY7uIunsubKFqlxljsC+9d4ZamqYFy1g8Vpq76Reah
Dg8LxqCajxPnA2V1EuOYhlbn0btZSS0Wh36rU++fLVkUpduuit4kbQ==
//pragma protect end_key_block
//pragma protect digest_block
RvKiloDr1PPCAsKVvlI0O9JBXkE=
//pragma protect end_digest_block
//pragma protect data_block
dVm0g1y5W8PsisuQatH+ws9VJGmK9RlVI4bbRmOvonEfnJ5Nazxsd2R4SuW+5c2h
82vQ5vrVq+9JoDqJiQ6phv4RIDHzReqYEuI8RM+SOsl05QVaQ+J1x6X+e/3P4Wqu
bOLvCHlZAu3PlbtMDuV0FaMNVyJm/fg9OYsi6Q/9mn0nMi+gGGQ5cob3IrljpyZn
6uyU5WaXlleY/33UwRVzZfcRTNoObIDbGqjZgJ6RPpOpTTVGEg7lAToFaBDbuAQ9
uK103GfGryaeWISk8zKDNXceAM/V/hOtx1sg425Lqjdf4l/LVfhe4fwif/b9PXOg
Bh5mGkDl/6VPtfAfrJ8Dlp8bBFB2yf4fDG1Zoc85vqQcEZtw51NrLAIUt9hh/5tw
ljRP4fGgu8PbogLsKA6MDroxQ+jjXjXRCDHOeBdvZyG7Sta2oTgDY9UVARFjP4TC
GsJqe7v6t2moCwgXrBz1Gp9hH3kqljmZb9m6YybnK75y7bSABK8bqPbkHL4nakr5
0b0eMdIyxwa6WNOdk0nDew==
//pragma protect end_data_block
//pragma protect digest_block
b/S5Ftp8nANvgUKMPEVuEQRS0Pc=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the put port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_put_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(put_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
TMLRLALrwjxa2otMcyrQjnafZZgeu+gq7C1dgCywIxehptbNh6uCgl0pYGke0O+e
SeVhUM+JO806f7qRwnOTEuG3XIibqLnuEFAzKs35PQ1wcm7izzhKTpisP75KyLBW
LuP+Cxx+OKxFCySAw6/zpKzJgB/EevWXaj/70PCvwzqZ6bFbzPUbyA==
//pragma protect end_key_block
//pragma protect digest_block
mzpuv4zrLVrvHYBAv4tAy7KDRGo=
//pragma protect end_digest_block
//pragma protect data_block
kBj9ZrSbaSMXDWYI+NVpkkXdAcTMVKaqR4bFwoELqIYiTdb4UCvOGcZjAAJkh4XB
EFVO3DboENkVTtEaCyOr7g+Itjs1ndBvAxAauPKDaE/MGGEQpICThFjLQztzJUb/
akk88Hvv4GhQSbinDHeiMdjuxG9Phgpp6Z7TnHKgAXS+jP5PYLkgnuvCBsjbxLuD
zIjdwBa6qG6jRJ3K9F8tR+LfDgX1GiVfPGFUfs7AOQhu2yBqjYfxek5bTFPjl42u
1+VH+OX/AD4hGP9JZld74uiibaMWI5nE9CuAKUfcoy1sdPeTvOjNI5Pu+iBNakiP
VJht7MkHDXxJmy3v+coWOwcTKmr0spP/3LEFBa4Iio4+10U9JBjLwUtxsjCuuCSL
FG5kizhX8H67vqUjfzKS6GkdNF94FuzZ9Ug4s6M0dB0ypK/MgaWzrbjrPoSQ5qfv
YM5LiezPAprPhqjjcoNVuHYQUVbchNVE0/VVoA7LbRbvi4aKESpBppK3RJlW1s3J

//pragma protect end_data_block
//pragma protect digest_block
fRXzOTDW0W8oOWn1FLIkh8Amy+g=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the blocking_get port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_blocking_get_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_get_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Ox1mSKpei8kp//NDH0Y6pFREs1xAoH5gs/WcvdlKxZB51rFShGhtB8f5pLw8X8RE
MPa+QRsdRyW1J1Z2MQ5NZCqQkcXuGymtVCgn6QDjcqmz4/5rw/AxXl85pKQPjS7U
9G9Waa02kjXxk6SKRPaqtgL6/dPs+N4tscOeJq9LePZL7W95/xEn6A==
//pragma protect end_key_block
//pragma protect digest_block
WDGwC3HummR4TGA6NQqD0KgIzco=
//pragma protect end_digest_block
//pragma protect data_block
NieIheGkkpBpg19nWSJfTfsjyXxmD7DcG/V2DFtnTxdxjb1BGqkcKPBshFHPT0pl
4/u4XSi8A4mZv5l65mwG8CKhK/DuSMTGM9fReH1L1K8UbshRQmDqB18HWz9uO+4Z
7FHFwtIiuQGo8DW6+id5M0UXAF11RiEgPJ+N16lmY/AlS1peee46zSa+GtetMLph
TwoeBkbOLqMS9we7BUzwZwOjR/sfnENZslm1svX6/rAEnWBB54e+IN9UpRQzfpBs
GTwlVl1/ftpwg9dgEjUu/B3eTokFRhKWs8SCGUQbcm012PaeC2mVd0riE8zlAu/z
tmE1o7nRUEmcrROW8BkXuAzGxPIr5g75ON1NjLfMHpg9JCHCXH4UeFtQTWXI1IVh
nG6j5+RZbX87Ure0LEQWFXYX6uYehMR1wgNF5er7R2Tebgow3UtcOccEc7YhXiUM
2BtCadR7XVMnLLkLdEKACNqhntboarslPtydNd9q0Q/eGbaC34csGUBoEI5tOOFq
XPot9mwipeMykWKkiuTYiw==
//pragma protect end_data_block
//pragma protect digest_block
wxmzsGST3r0kktdJawYHMZLd5cM=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the nonblocking_get port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_get_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_get_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
lVzlPhklireRVx9/RUM0CcPu0nATDtGqyKk4sO9PucFwBv4YDkANnpYDY2rtP66y
B7a4kW+CZgSDm/1lUYtAuABiAUrxdKz3DIILhq+jEdpwbgHPz7vBovGaIoev8xXM
6Wk0ftjC+p8+WCYuYaufYBtAhh69SJPHP6pKlravq8wt4ktYYLNakg==
//pragma protect end_key_block
//pragma protect digest_block
2+fJozpzLd/iwzhhUdrfLy6UI0k=
//pragma protect end_digest_block
//pragma protect data_block
jqbFdS+PMJVz6M9hlpvEWRmDjH2fv3DUosghjca2HATwRH08Tv8KjSwiCmtUl3tC
qebwNUq5vkm//wawjxATxut/JiONWvVjYVJRj9u5aoKpzhGLXHGdTBgX0AmiY4J9
YmG9yoGO42R2JU6yqZ/jYIVMNilf0NEW6DILXIxX379/cZUijH+aKRLE20kFXR00
W7zvkZ+3Vc6tq/2TL7JsP4FFExqLBXDVJXZJDwcy54CKlDFF3ab2IWYPpPUq5MjN
U9JZ+K2omCUXkfGMH+LUyciyTjOHbBvptdN/WTwTx4crwxWij69YYdOIgFY5BWNY
NINogRYaaTwPrwxquOHNzCzvZF5RlswajuFRqJO/ynDvRd8Y12Pg9a2r0iWC2zhn
so5uou9VFz3IkYsN5BDs+H3XyuLaH0Iqgu6JM3eYO2O7p3+nSvEDSvF8YuiR1O/v
RkhFxmNp+5UcMBlu+vyoh8kE5cuh6vgxAIiDOCJyUN9uB/f5yIPNPzaD/rpKLOOy
lXXc+Xqp/etMvKFT3CEsqA==
//pragma protect end_data_block
//pragma protect digest_block
ykKRJ5gAHpIQyFCwYlogmjohTSQ=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the get port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_get_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(get_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
EQfuAJi8EyXrEmfW5ij7njLEKVmxaaN3Wbd8CmgSnQZfoxf4PXYvWgd7EL8SP+Da
ljpfSIjkl95Am36fqI7ujOmtXS+xYEjY12dY1kzsHsBQQMsYgQ6KQsrDTQRgWDRf
JSNJ41Djh7tsWtgFE78M6daMdUnNN+E6svRqA4y7sxX52z2gcRhwng==
//pragma protect end_key_block
//pragma protect digest_block
Ez4+gz+xEZllVmQsEDgFG0ztjnE=
//pragma protect end_digest_block
//pragma protect data_block
24eEPcfnhKmoXh0QSa7euBoc9HNnS9dlQhYXmHphU4OwCV7mIa6BNva0dBo5bBjQ
FToF2YCELriDN6KepdlrKnkCG+Ot6gi3GNhIR7m419GD7vGmtvLMegbejpYXkPz3
HyqVWMAbcmEVZZ+YHNo92YeDvJHrpmdMiMcHZF0izO+M16LJOlfNxuEllebdX7MR
HjSdqL0QWQMhy/6smtkWkgQOg8Ak3jtLI/3lr1Nx1tyg7tn4rX96kW1QLDyV/oOq
gc1ySjmYQBXddxI41u8FI/dh42OLdst++MEWY/POZ+gwKlXRXOyDv2xcJprB5Mig
KUCflQH8orVshpRITIlaJXP0ngXW5kSrWNhVC1x62amRkHPnyfF+ii0dzIuGV6y+
H4n8WUWsQMw8MFiVQBqtJNeldrwgdf+6gYXazKcYRy6f0as+bzPcpTs9SfvmouH+
WCPHAzpOxD8ltUVlXkuovTADKyUwVpsvTBxzORcTgUSQ4J9oZC5ncyIQhLgRrFtd

//pragma protect end_data_block
//pragma protect digest_block
Rjg0JP98JnY7XCPBqHRs8p19pk8=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the blocking_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_blocking_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_peek_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
BriW8YcHfAnTrZs77sw60soW589w+8Qpo7sgltq1KWMuey8MrtRzv9rcRFYmvHJw
buDZ6CO37iFnI3mAFb/ZlhVcIzdGTyrDc0IbEuMOmvi01GBo6YjXmz5ToqM9DJ8V
TuBlYUy2ZzaPsX6MmTuNHGWydm46MLg2/nD3pkX092mNA9+zoI2HIA==
//pragma protect end_key_block
//pragma protect digest_block
DnCELbq1Eh92qOkbPLlcuYl/shA=
//pragma protect end_digest_block
//pragma protect data_block
dVFsixZujmRiBfs8fQm/ESiKLIDShs/07bsFklN2Psl3AFkQk3LRs/weHArsg9cb
V5OCeljA5fc0Pbf9xStPhsYmLliNssjAfFt3BJHygkNLhO6x7M7e0rjyPah7TUX4
drVg53p5wHhqHOVHkHG3nMzz2YZ7nFy13ZENiAyPSgZ5nWgU/0jzeZBtCvPO/KV0
7eqrifA9EjhP4VD4/j+OUzrgY3lAXJJHS88Kb+iQDSzY2x6NsjXtA2FE07DvmqSK
Zb4DMQ/RgCLChEzFK6to3cUuJcadScHU+tLeA5pdb+6/4WEU+5xCjvk7cpVqeucV
LesegG1BQXgOz/aGhV0SXWK21wNYAEbsbFZQngwhYd7pG6g55GOBovXeJqftF9Tn
yKtFgR5DhFS8Ql30Gw8JM8zd90TnRSIflPDGV022svq8W9VYO3qZB+KuwhIbkygx
470eHAC33witFIWMQ/PTowCCgbZtRSgpjDJ4l2GnnbFZ/yreFcGn3VmsMo9ICBLU
sgHW64SHmrEcRiWprMlsXg==
//pragma protect end_data_block
//pragma protect digest_block
CryiIm25XEwA0qZwB+HAwnKariY=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the nonblocking_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_peek_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
1IauBDquxOk47K6q9kL1f5mFwTmYK51wgDV4muoWC/HWjRpP0OXNWOIT+/3M6Sdp
YCKu8nhnz7AK9nz+Yjj7DzW5sbHRFpdodV3Kn41J1p3pF5ueSecbR35mVjSD4REY
XZYqfH6d+mNIcDRTxtRFF/8t5K62Ej9gUV3cTtJqrapt4AuiP4F5QQ==
//pragma protect end_key_block
//pragma protect digest_block
EhXRLtIJmRIf/DixaatE5PaZ31Q=
//pragma protect end_digest_block
//pragma protect data_block
Pu/HIct22S7/ifPjwbzyXAKZXYISsk6+F0NykSNcklrgxw2hl5JHrDFTVl0lddxk
S60aw4Mj/whAp3alDSSYtTjq2cEaK1xOfYumzqBVjTrjK/G0QeLoPuX+WM+b3mCs
aSVRlgHXZB/NqjBHmujUU6AJgTEX3W9aOSeqlC1QaUujd9vRoE48vi8Cdi6yCF0R
12fGaQ739i3vv/f9Zd08rvk8jw44yKKIEXUSHFTYZowp4mzwIoJAl6wmbxNVXmtz
Fz8Kbh3jKeO4ylA67v3aB3qL7ZVCcQFJCryED663R80t0AhiTlwZCadXX9v1wAnH
YhLgGQTNHp/ru37Al4LAfEqPZn9e4xUBcqtuOlg6gA6SszsBoYIZmxuxvFkAXeYr
aiDcJuRCQ59kcb2KJQP5Rj8jsVyl82/cRiHP8592YNVZK0UfHMagsePRKBBlRwzB
A3+ffhOId7bjpijm9P0uP+5RHly46BNyugvmty+paiod9ItlVMKKWR7B3RIhNXUM
zeSBodbJky1gQkKzRtumlA==
//pragma protect end_data_block
//pragma protect digest_block
cVNzVl1cDQo2Z+ewefnpCo/pV3Q=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(peek_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
jsHS1tjTgj1Bf4v0kKES7kYYPM7n+OJB1Czw4GBnSLYNsnMs3scDm8i3vnuu7gGw
KGLXXvPzbeETZkaBC6y9JGFn2fEp6sU5ACUK4cgCozZSfWhZguuj1wmqnWLvlIjK
QrDtiYatXXLRbAmgfqWpScDz2vvWMVuC+RM3r/r28VJajNagacR8LQ==
//pragma protect end_key_block
//pragma protect digest_block
HFGR8OxfnmyIAx03ztM+vjZfYWw=
//pragma protect end_digest_block
//pragma protect data_block
A9JSHXdf4CLbEPF19wgz3uGOfOp7RRlprR/Np0y+2naihXIXXtYpWhztjR9sakEK
ZEe+9yg27F03dxzeWxftcEhMs1nRO0abKvxUbiTbVrTO0s5P7c0DcnnEOUc7xkwG
c74d5sqnjnW4jkIjkTR3DnFsga/Aj2B5gDX6QCsPEwxtcyKG84tOhrAaGqAPXepr
DdKCPsBZnNMz0A3qZBjSNmePdW/1+16jocuEzEVTSisn14pokqwbtE7qM14nlY9D
TpiEScQzOdALX2wKYd6uNseaHkIWTY8wZj2SRVgnfPykHI3Qsxrt0vyVcjpWjg2k
aTfRb3wLp1eE1zlAhck07gn+ciTwhySvna20oiQFC/9NdBE9Pt5oKGFU/UdJCq6D
rjqCGqeUKuAvLKGVQaGCPiyXrUC7KK7aEqFNJTSoRuT22a8zPExk4FumJQ33FVT8
AkATiQ04kD0GDWXtYPqUhKlqMXIgihUIlcbfv4AUBgOEJCJ89LCuFAXTN8iCsYGM

//pragma protect end_data_block
//pragma protect digest_block
DomlQcpZ5engpS9WMxzv6A1tfIo=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the blocking_get_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_blocking_get_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(blocking_get_peek_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RvASuvEIDlC/yVDkxKeZI6S4cPY2MTA+Gl316VqW2/5I/+0PRoH4A5PLtQ2uYkhy
Cww1u75IeL/lH59++4A/uNWg5YKROCWuI1CiQuqn54qC+VvWz7NX5GG9XRMV2tzc
+D4C9Ipi+rLPMsK5njUZOt2MaMzWIAV+efFL9qT/yCdKL8kzjUyUgA==
//pragma protect end_key_block
//pragma protect digest_block
2VFBFjeUh6J9ZM3eSuXqSzOfqI8=
//pragma protect end_digest_block
//pragma protect data_block
g5lSqNpest1oalSitIOSWnPuiVVe7AjoMjDCanB4sPpjNeio4sCnAkDNTIbm8/CP
xBdtf/LWfP9cZaAA/WtoWxylVa4f5X9O8tgd0cJ94+P2+5rlInUhNiQ5NmJCOiLs
IXye3cJiOrFTiq/3faadcViae0/puyIxwgt3LtA1ZKD0TmexUrO51b22inUsZKFs
ANk84Roa9wqVXMX5afGTMb92rbHw7seF7avreW4JocFkWAdFlbkoqBgUkjvltieW
Z7V19day7PDtdNR2DcenCOvIyaT7ucDdFoiLMJTAYvXjw8xAgDw1j8FaCmk69Rh8
TFd0F8KMuWw9WxiVLM2+4ZWqAsse0UxkZKtvao+Q0EEpj/pwHSN/jpIgDsYVHo6Z
4i8MQRAGkNb1YWGPbKVKUJ9L42tRDR8vBW1DSTzVmm19S3FSPf6QVO+SxeIOT45O
L/QdgRuWbcFAbR1lX77tJ5LiN5OKqtjX2zc5J+CpMKdEf4xPC1tuAIy1pWBb7ZJA
kHfNjhC3sBMWj9Tpk/OlMQ==
//pragma protect end_data_block
//pragma protect digest_block
LjCv4M4NgtFA/8fjI+6yIXc8j8M=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the nonblocking_get_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_nonblocking_get_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(nonblocking_get_peek_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
NUvCAbizjx0+v0n6AH9H1muslYQWifvlTdAY9xMwvc6SpEIsckY+zZdyBCaCz81F
ipOnxE5ORyZAlcYCsBa2yjvDT4Vd6by1mKuM/2/jbmKWS4W2XRZtUFupNw44Aiis
CusIikzZ9K/GP30wQK/4k5HWCs6fnPfP67xLYUFLPAo2I5Ub48n0Ag==
//pragma protect end_key_block
//pragma protect digest_block
gsr+n9JYlTty+J956VXdzbTuRac=
//pragma protect end_digest_block
//pragma protect data_block
UrgDDuvc26X7zGW0lc3BUZ4FekRisghXyjvHzRCw9Mh4cOr66rwvEXfwM8AQYPEN
WPwFQFY5LcNi4BlQtQOS4c53zTZWuAiN67a7SXXkGMWJX2UyASdd8pYbYqYPgxg8
CTOphT79/hPLdmGhWu4MbY3D7u5BPZ14TsEBBb1FW4MnObOg3SxnbPlUjVrCkGBf
4cLg8nHMQz7HnXaLkV33+uiKADKFYHPDi7ngwJS6CGJHteapIW3RZy6DAGimMYAl
WcMmviLAfn2vVTcSoVvziBdk8jcbT8qBNKoN5u82fE6LjmQSlPZzw/1hBbpkfLcS
BrpG8XELElkkfqm9K7sNNc1BbMvEzFPzi4UO+sIpKxig0B0zDO8yAh+tsPxfzg7H
fbPWz0q4aVWHGxXYTydiWR4Q+35JyLZXR0bqIcWu9IyTbHKM/WNqDJ9ndvGG+6Cv
+V9nyyIRQjKVXdYFBieAFDx33tn4uvDY9tRIFmMUn2xUqgUN8Se+J+llvTyHjYsN
5zz+hJoZun/EIpmu4wz7iw==
//pragma protect end_data_block
//pragma protect digest_block
C0VffltFlG3vB0rSlFhg4DNU+VU=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the get_peek port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_get_peek_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(get_peek_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
W4ErSImdu+IWvqcZYVHwrPmGH2VEokUoawx6vMiapCUltkTLU/iPF/vEGaTRFNew
5OZdN5BOTaqbuhot1tEevSEhsNvZSsxfTyTSG2ehpz3SjT9oGZkhQNkagNukS0in
MO6rjQC4PvQ29W/VXT99YjFEIwicekq6GZrb8m3WN+U2r+jqrgAASg==
//pragma protect end_key_block
//pragma protect digest_block
cMOeUm+/yRNuaOFxSmZaggZMHZM=
//pragma protect end_digest_block
//pragma protect data_block
1Vs8x8VkF3R4CrCgllQQPArRjfG4/Wu+1hW5h5UP3Pd5sZ2CmxV68m+H4MCTS2wF
5KMRn3HUV1BgHz1+QqEbWI1LT0N/zQ1wAsp00TdOqYaTuIuuGz9SAGtei32Oj9yh
AqQuIYO3rrJ2vf4egrEU7+Dvf3USU12fnXvq0OmgJEjrjLTqZfBfnA/IWSYaXqNH
wGJtuTgq2BtQBF2WflnNWNDVlDKtkZ5cenILmYGgDI8iS6CJXYN8zwsAmLo+ICSu
ckDo4dj4yddIzJhNXK8Ar44hjRK5H1CG0EQtph0JHB5x17hpTCBg2TunnNqqH3uE
G5fkJbOFB2uMv1eiiO9fMhZJ0MJCyKumhuG0ypJb9vD9GVbOXD6JmUja11wgCbqa
8QWQEizEDnBgYbLFbqxr6NDofYkRjySnRskUWbZZ77DzQdac+QKDYKQ5uHweFwNH
+V06XTSbzohEdF7xLtPtWkzBtccnXN7PSE2A1nRm7zfvUBIiZm50wlMc9lmeXOTV

//pragma protect end_data_block
//pragma protect digest_block
jSw3dabuB+LT5N6Uhu4e8Fl7B98=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

/** This class extends the analysis port, providing support for intercepting and logging sequence items. */
class svt_debug_opts_analysis_imp_port#(type T=int, type IMP=int, type ETYPE=int) extends `SVT_XVM(analysis_port)#(T);
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
t5RjpYYMDw51XTuwYQ1v9jUTK6xUkqkWuwZHS1jDKFDJMsqbYPcxVsqfrX8d/GXm
ygMbvoo0nswfMxwqGmXMOpYrAlOjgqDwUpwsK4vvEFVecc4bXQ2qDYVZsB4qKU9Q
sGlomBhj9Vip3GPnu/TRxQrSGRcb8z016PCItW8NAtV7IbTjm+2mjQ==
//pragma protect end_key_block
//pragma protect digest_block
JDA/Tbx62I2u83KZxiDD5z0K0fQ=
//pragma protect end_digest_block
//pragma protect data_block
oGKzQPwzmC14onZKfmvjwmf+3WHQW+sG950E8n388OHDgdnN+sQNIqlSQw13E09r
RkPjkBAbhYUkWGWP8g9Ndpyf6LAC0daRC1gW4Q2c5Bta3UgBOHDF89kKzV9wvGZx
E2+SCSolafhB+WaU3hYMz2cv2duaEnELSJMdu1aPsmunUJsrYaObRzYKMr+w6meZ
rpr4Re9TyNcVi/OytM3YGA4byzouChN6NsCd7DSjdcSyD2h4rvoVzW/q/r2t/N5m
05m95SZgdpyYS7ZVTyVGkgscrKzCRxraZhfqjX13sFhsLwXA7mccD+NSOSv+3G9x
3hg8xC27gsV2Q6/GNfZLye4L/icdGsLRKaFrr3egzM/BrgzJ0yZQa+bQipjZttca
GkQaU7blGSJlaxnle5PInkyxAhYxTW2yNsnqpUZibjE9aO77zXbWR85dAcr3pgDn
eLqL1v1Jemr2TfXQEloHhGKZJ+Z9BOJl0W/K67g8QYnWB2FyS93p8+Cd+pF/z+5a
cKqeD24p7w4nFnRFHQkVzAkmOVBtPL5MQmQMEzjSjH/9WXAcOz7rhdbMYbhzMbSN
qAgsJnlAwTswW172TdRvS9gPx6LoWD4pBGvp/jPytoSfduoHPO6OM458XX69WaSu
Jxb642o6IEqrfMV+BWM+phmMFpgnxp+vqjAkBUgiai+1RFl8zmqRuS7zQFQskQZK
PofFZFZv1Q+QIPSkOLIgV5vjZVrhfyJJi2WRmh46zGSQOU4sbyue/sm0nkLU5Ov4
EILGli7fq9BePDGzHHVY/Al0JNFXVmVQuojTskvWzwC3EryE81k7EhpaPUc5mguh

//pragma protect end_data_block
//pragma protect digest_block
W/k4pTpuzJeJ9IipvsfZQLckVfM=
//pragma protect end_digest_block
//pragma protect end_protected
endclass

`endif // GUARD_SVT_DEBUG_OPTS_IMP_PORT_SV
