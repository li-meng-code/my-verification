//=======================================================================
// COPYRIGHT (C) 2007-2016 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DYNAMIC_REPORT_OBJECT_SV
`define GUARD_SVT_DYNAMIC_REPORT_OBJECT_SV

/** @cond PRIVATE */

`ifndef SVT_VMM_TECHNOLOGY

// =============================================================================
/**
 * Utility `SVT_XVM(report_object) class, not extended from `SVT_XVM(component), that
 * provides some of the features normally only available to `SVT_XVM(report_object)
 * instances which are extended from SVT_XVM(component). These features include:
 *  - Access to a full path for the instance
 *  - Updates to verbosity/severity/actions within the hierarchy
 *  .
 *
 * The main benefit of these instances as opposed to component instances is that these
 * instances can be created dynamically over the course of the simulation, outside
 * of the build phase.
 *
 * The svt_dynamic_report_object instance relies on a `SVT_XVM(report_object) extended
 * parent instance, which is used to access the parent's hierarchy and `SVT_XVM(report_handler).
 * Parents extended from `SVT_XVM(component) or svt_dynamic_report_object have the potential
 * to provide access to a fully rooted hierarchy. A parent simply based on `SVT_XVM(report_object),
 * however, will only provide a connection to a local hierarchy.
 */
class svt_dynamic_report_object extends `SVT_XVM(report_object);

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mbYD/mmqQbLYZfMeSSU8xU2bdPsAS6xT9t+z086CdmZgvh+kU+/qchTHNUPPQkAn
ksmfil4KKNTnz9HPrObDfO9qcVlh/5SOmh+woeMHcfKZnrg1oOBPGanZJUzk773m
XzjBrB0LUsOT6Uia+f62YOaRWLJhqTOZzBLdueedJdY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1376      )
vn77sasaNVevuKrsgtjgSCkXcmky+rrcKWw3hNse1FxkVMkmBKMHZo6S/0ivfoy/
76l+B7JUR6+w01PiI6Z31EAfkikr/aNwcsbmg0a6yowvlTliGt5Gviut8wQ6ah6k
ulh+M4I9V6vyPKzMBrLPW3Ytf84rwRsl3YKW/FU6HAEtkA+y0PENCj2IkP6kPtBu
A8WbcoMunqn95vXfo8dwU/lpfJOYXUc8dGOI7NdffzFXNFv0Gb42DsQMb9rLyYj4
U2f+jsfuXbG+Fi0aNdbTj2DHRyVhJ1vvD48XOLTBnXFpZO5D2rOyuSwXXSUO/rbO
y/DnDdqoQoox6Xs7xIJMryg7eqG4/c8YZWBMwVNo+uZXHAUSk938yX0T/oKUJpuO
WH2JmTHKHGwxEAgrhRuOdZ0OJD3o8TtdNuzVactwICbcU/woNupkCOIdEAFKapbM
vBD80VwR0FE0zUJ/iRu8aCWQCOtWqv0/f+suelmLuOFd9+0X7UXj/+drEENuxerh
cC9Q8FKFvRfobadCe+LXw+k8cl4KZ96jKuOye1sd57keRqk//v0qhvMhOfzjIs8U
X99wup2/Uv9FASteXKM6uEHIwpih1rN1ow8LhMwRPksFbX+qfd+Tn7lyet2Fhk72
zyspnPC9+iMZvE9noalQzRxGfBAfmKjthbBEALw+acpy+KJN/M1sEHoNXVVcBcMX
oecSZ/PIq4912khG9tCxo4Jg1yru3sqSgnOzVwka/ysbIX+OAEb94cz7xWmGMhWc
0yYONZzIUqzLfwt9xOCsavHm324+wkdQBYKNB1BXgzeuceE1lcAYRacuKPOpxrtF
FPU/NFDIa0IBMZ2X8yy2KvjCTKbIBQEtOMSHSIGHoeK5nSGaCVsKxBula9lW+gnM
QXf9p9JFdFK6hda5+AFzvmcLsd2IT1vKOI9HDpYMkPRZwgyDqgC1fCGp/88aEHUp
cEBsm/1OQWiDk/SviGWD8liLJdTrUlGV7YUinQzInN2SRLhW7pn+1oSCm97TwZxS
XdafSIpm/vYJQd/sPlxULJx+rTb0OYSoUjMbs8FROfCVc/e7lvVNIgn9zNUXrTrn
TZ0XgjGatUEXPejlURcygx4x2De/wYxRsFIgTqagmv5y66SnTzUAJqf3f2P32ZbK
aRfHmIDcCEyzrV0oFuK1qSfOONY8FEFPn6Czu0wX92SrL4DXmziYXAu/YMEhocbm
XjwtWc39+EGYWgwAqpck85Fd3J/vsnat6C3oLCVw4NW/O8ZNeYqWegIgtoEj4d8k
AWxVsDalyORJ5zJeiE4y2aTgCKBJdbDojNpwSswxROSbcjVvwoo9hJ4WCCMyuGXJ
LT8zBEk7f+Fx+QQw5hjo60vhmq2SiCaulCguB6f2NtdyLhnfxxwWa/BsFxXg1xr2
m/T155dkWGuIK0z9SqvtKgnns4U49t2N8aGP2erZJqvX9fsNrF9B+vLm+b3Nw3RL
7DLDIhC80yNN0FIaA8vJRhR0ex8U1bufSsqSqQyk66nDPBZGocHSYFm6RK7eUSZM
alh/0k66kImQ6Op8xQQ33XDAZAP+5TAAZrzT8hATnaxHdTUD2XEE8ZeNq0Np4gxK
A8aQ2ErOshSOtZWa2nfe+Kzd5PGN32kYbalQrOUyBwgGivXa5HSmqsCPrYJg5/JQ
UT3PrPhwQUo5r8QVioTHGOkB0sFlhAfL6/7F2LLyunzfgK80Qha6M9roXs7aiSCM
k70s/JrRXzc/l0n9uEJ0K5iTgRv5PnJIeQ0s2v2RKZ1gtbZ2Yyg0F+4SUYNn65kJ
Q85uo+U2jDcZsBi9Ah6cXpVHPdps2gDBr9F1xLMaqJiJPX7AAYGw//KyLS1GJD2R
`pragma protect end_protected
endclass
`pragma protect begin_protected 
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SmdxnfpqXFi1p/+aW0udQwZuY99L8YE7Z8ZL6bYk2IF3uzMVIeJgyekF04j3L6si
V5W+kWYZ+9zEzeuIHuKmh5/zT3bRzT1BE6w9dRYN2aOeviIz90NPmpmaCxCan0D+
/j1pJ/+RsWl8upCgSyUxio1/LuH1XHiuIxKj4qvSLvI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3523      )
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
`pragma protect end_protected
// =============================================================================

`endif
/** @endcond */

`endif // GUARD_SVT_DYNAMIC_REPORT_OBJECT_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VQ5ydW9kWF5zf879z8MbdwKK/wwuajiDu+4f3yx4lxMfUrS9TgBSp3z3lokMDJP/
5vg30KczgUwpnQeB03TMk8ePDrp87tAVlqZa8J5tPQrreIFKHsIvRtMipyX6+Xty
nUWAfImXelDQ/1vpXgZdzH24j6jq8OTJfvEKQThnSC0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3606      )
H2rio5hTHmC213J6ZEfi+NtxDG1IdpO8IL+d2wA2zznfUUUo1kHWuj2vsRrWRbFC
ee+R69+WL6o4eUI9RqiYSfAasrmJOnoAMymarIUd4QQBbRATW/dDmUPKir0R/9MJ
`pragma protect end_protected
