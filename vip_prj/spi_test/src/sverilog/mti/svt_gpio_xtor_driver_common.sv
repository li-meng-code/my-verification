//=======================================================================
// COPYRIGHT (C) 2016-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_GPIO_XTOR_DRIVER_COMMON_SV
`define GUARD_SVT_GPIO_XTOR_DRIVER_COMMON_SV

import "DPI-C" context function chandle svt_reset_gpio__get(string path);

import "DPI-C" context task svt_reset_gpio__configure(input chandle           api,
                                                      input byte    unsigned  min_iclk_dut_reset,
                                                      input byte    unsigned  min_iclk_reset_to_reset,
                                                      input longint unsigned  enable_GPi_interrupt_on_fall,
                                                      input longint unsigned  enable_GPi_interrupt_on_rise);
  
import "DPI-C" context task svt_reset_gpio__drive_xact(input chandle          api,
                                                       input byte    unsigned cmd,
                                                       inout longint unsigned data,
                                                       input longint unsigned enabled,
                                                       input int     unsigned delay);
  
class svt_gpio_xtor_driver_common extends svt_gpio_driver_common;

  // ***************************************************************************
  // TYPE DEFINITIONS FOR THIS CLASS
  // ***************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  /** Reference to the C API if using the synthesizable VIP */
  protected chandle m_C_api;

  /** 
   * Static associative array of references to instances of this driver 
   * class, where each reference is a back-reference from the associated C++ API 
   * instance for the corresponding synthesizable BFM module instance.
   */
  static svt_gpio_xtor_driver_common back_reference [chandle];

  // ****************************************************************************
  // TIMERS
  // ****************************************************************************

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  /**
   * CONSTRUCTOR: Create a new transactor instance
   * 
   * @param cfg Required argument used to set (copy data into) cfg.
   *
   * @param reporter UVM report object used for messaging
   */
  extern function new (svt_gpio_configuration cfg, svt_gpio_driver driver);

  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

  /** Main thread */
  extern virtual task run_phase();

  /** Initialize output signals */
  extern virtual task initialize();

  /** Drive the specified transaction on the interface */
  extern virtual task drive_xact(svt_gpio_transaction tr);

  /** Eventually called by the C API::interrupt() callback */
  extern static function void route_interrupt(chandle          Capi,
                                              longint unsigned data,
                                              longint unsigned enabled,
                                              int     unsigned delay);

  extern virtual function void interrupt(longint unsigned data,
                                         longint unsigned enabled,
                                         int     unsigned delay);


endclass
/** @endcond */

// -----------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Y7QxMVgvkEPx/LcusFaMeOBYmvTDL5ANKZ/SE30PuqyC42Q0EfsJVlnp26XWsIlT
ATkZlLKA2Va13Q7JmzpwLLLv1Thi1L+WWSwbRxWs2lkW+JkKvuATKasCKpsG8NZl
+dweMVcjz1LQZknGnQdMNt2hQjiRIKpiJLQZ79Hihow=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4496      )
9mqb+qpC0jrHs6GWoOOdDkaeV7pWXnHJkhc8E3jeMkmS0LYnZ71yCfyLQvHSrTwd
xteeeLwS9Mu6B00e3Fg4YVW4IQtidB4Rb9t1GcdhCloybXZTWils0vDMuXImlGhg
xdn1oUKhDs2w/UYJkXMFdRD5R6G06MCDHNBDXptm728vXIION7YHbLZ6D6LMJHUu
PhuNIKov4466XKbj1NImMGvMWQWverEwVHpRo0AjO8KdsYUOWVHjOJjGGA3BnK9Z
aE8/MC0AaDtXV1oLxKXXOuMJ4U2QxpZQe2ESqFOim7paFM3lrSBqkHvHF1T097Ed
ibtDc4U6wuibbPxDjOwvmSrzbp4wymhjNEWB1lil6FzOV9+0yapn2cQcxfI1Epy7
TwoAAJwuZb5QQR9fyJJFL82iaNvoANRlwUdtM9sZ2EDXAu5c9Rgj/EDdeIm0VLat
5iRYJtU24+4/dsSZLUdBbPXI8qsXiUcGxTTNbrIzf0ja2Ecb8k5O4l/1mTK6ksQq
PLhEivDrcwK7kCdLZwMXiLS7GI9+khib2oZNfrAlaiOsBWvwUaJKjDR0c8WWXm+d
YR4FtvzJlawriqbLDiqAO2jmodQT9vrKzkqwSwXKpocGfMyk6tqTKluSkbcz+dWs
QDBsD8+c9GlJ7zIPYoiibqI9kkT9CJQ+nqKRmzaUGRpe7rEnADDn+v7qR9Kubthb
x8Zk56qUiVsjZkPYhizX7Nzh0kaf0cZprppyZaL821ReV8JrlUxwf4XRZ9+JeyO7
uuBMzYdoEdojxOU1WidXCe+xGR4AUdDwLdKzWDpTFtR/cJxgpAJFZKJTozfA4v/Y
D2qlscHVbvTg/4m1+12p0dNibBPGWqQamCfStXuh26FCQCEAB3SFVxwgrwwssc05
3Oq0YmswvSWt2khP5YRL/34Z2oJXCNpdP+/oD6UU5bU1Ec14JxaIWnbCkUmA5TfS
Yb97HvtkzrvZ7w8Jgsaf5tKM0YbpbfBcZ6sh3JmCDziKmePOzRaBfBOt4LovChh0
T1T2g00c0cmz3WJeWo/zfq6k6GahoNeKzCoaTCRJyO0p5QFTHafoKjmD0FcaFTd1
c8zMacTQAb6lDRS8QZ4z+EYkEJwQg4AZRLsmzc5KmfvvEUhwoOgucsYp17JWgqVy
Q/4Pkmou0BxDZvZY/DGVtyfYnqRy9i38rr6xU1yUzaFyTGjF9OgXZoC4OKtrwuRY
VHFvvGAVe+qJF9ltdH72cvULr0T06W3d+oFXnG6F3PTlLFaAaTbnrkGILj/JFhI6
4M+v4LVZfyr27PrJUv6JE9/LsVIpC9Ez3uzQef4+USlXms5i5MMqtG2ATjURjuv9
5anLK5YayPbiaqs0nT+qoN3hRInBJUssA5tf5pFbu/Esb8Cw+2rT+8QdtkpWz4JX
v1evZ+p4cJ2FQVF1IHiur1nLjtFk2JURQ1k9pVbo8Uz9J8bzYzYkRHOIB9gcyqSu
eLGjA0bkgDzGHvc5SpuYUvCgPraJvk9HhEmqAfuFDYMS9KITHNMPPaYJKh+YDj2a
fv2AhXCO9673A2BSJnS5RoaU9ftgDFLGJyJpcZPVu/C22wXSyulIyMPn+ivbAlet
TpMJS6KyRkVcVGFPTVZ7zqh00K4uGeT+6Y44Ag43OAm7MwxEbBQmZoAKIpnAhNXr
XpG5Z+vKCAOA8Fq5wvupFhntouBDLS2vzgdJsgHl4+kxv3O0iK4SLvWKXdXmDrjj
uvMPbltOb4nohoaQViByXy7X54zu8hk0vRCKAk0wSmf6JSh1xSejvJXI5Ko95Swm
vXPWGXKMrGnqcEgT6pu9IEwX6tQHNiaNWw4sGWyqQxpVJiv8Q/2FyT7W/laXlaAp
aRVxSt21fcE5sAU30dVuRbQsy22kSf8AiQ8O9sD2Av7O3pzjNt5FsMT7q/z33iCn
w2mFXh11yCtFx56SWdIJfAzFcFP89mbmtbfwvOjLFIE+Ya/vXOHAN1zGiu9y3by8
XGCdVYT4L29hy7T62ElQRcgpcWFL3TKtv96ZCAEvVZb3PcCJeCm3BKZcJYKnEcGK
ZJVmWisGl7mk32zthRdrNzcXIGPMqA/HjicMlRFvDi81CCywzLjBZ61ox3nBtZwo
pkXoV8oqnPyn3WD2CglrkZI8UqL4gjygWBEzg9mvT0GVLG190SBQDQPKlSIc9NLl
sXr4mtNRJJA24gn9E9aVqnM172HG2IN4M2KI3DBuQgTFgojdMzwlhpVtkSjWX/YJ
TxUUsnHpwwyDOVH7aO7+iHbM0h9vsP+TzX9WTMSt1VY9ME0KIpEMKXVl0ZYX0Tfi
6nbGkTDrhM96b90Kg6Pg1wbpQ4s+SfgMNIdxoDXmbfL9r/H7FS/zhJazeQ/6wCQ3
DolFgOZE9rtyrKn07hFZbLmktRk1O9IDQrsWYBC6pSX3DgSZld00EWDAfeUzOQ7s
VBlZX47JeicGepOi0Z6vxiVCteUoP/kjdvx5ZofbZqEqVz9pWA9iAxlUk6W+VLG3
tpEnw61SDokoCmbtlR89RHUDMnTJVbfIieGVBaV/F9Xz4rjhhMKjUwHtvPsa3218
SdadgB8xw+3f5vjMSLvn6T6fdzQtptTuIY8AnSDF+Kus6rtX9xv+fxrg9ouLtFjZ
EAejcU6mL0ETqe/hWt7xYPIZk00uVvjSy5vnSd0qTkWiyyC/pzF9EaSRw4l/UBhQ
XN1NOvoALiAtelng8v1bxd7BMfhZHW63CNrVbj/jA8VfgWwjPBfVRi8p8WcAWxuX
bFRjJK6WtSAeYg8o8iF/Wr5oLC6pdZIOE6bamMBKeET9E1tHyaXvjlSxRBhQC/Jm
TV/QiCl/TWJwjfbEYux1+fzJzjDC1AAFmBCfJaS9yl1ORV9sCC4iZBzviu2AhJCA
hwYhwNztvDP23R36dVPuluSc+aYiuJzN1a6Ovw0vl7SiXyeYSQrs62GfIXn1FMgd
I69eKdEjiPfe5Z4g9ZQJJUGNY01m33OS0ymQYIo8C+liiGk9e7RVtRLQCbwSR65A
nE9L5/6E0FTjVZer8sPChRzBhQlQBTZHvz5+Or0BuS4qbZetLJSmUQioYoWPiezI
d/zIFCS893mG05bwm7X5TAEMRour42R703G/7Hg2alZLQXKlGv2cf7eIvU5H0E2F
oUzQfqQ0HDGtXMvPRkIYjAyNF5FBpTGuqcpxI5tHufY/nf1H4fGZ44QU1v4ucFyh
sLYl7sNMyzVdBKL4ZBlX+MqGTxGyBtqlva0iMFRnw7NsaAKIy/oObFDdAh2aSn7k
TIv4SIkx0OqgkhyA15p7Eza/AVdxHF0OJsIjh4ooedNi1IzPL2toxTehY37+X/ZG
Yk6fzEWnCzbYqeuE1o5Oe+NWJkIgsi4CJR+VtC4HRoYw4ClMsGk9/1u4H2gKZJJh
uPyF5W5rzGHylM1hRrnoiNVdchIf4oFDJPswISqMCA2Gq3EIY3J/VerwmEYE9XpG
/S8xKqXoycy78TkoT8V+2AlwJd4vRr3B0pLLWwsPw6jrKLlpDyfydmqMapTrz2V3
+3GePFnOhf7hNTNY/SDcuaE3bSHGZFfJJ3KmRHQt1c8T4sOLV/bxfs0DknARzo/g
Fn63UPD4jri7RVIuFbXS3WJPzTGOXA+ld2ExNNrUog7UtFsRqiDj/8HVoLQ8EVpP
2qm9QGmCBIHsTt8YgukHDf+gGy9e6M3l3M7PWiQauJ1Igd5BZX4AtAT4RuDUQGnQ
ccN0aAT1iKxBnPehNPzMZ7OxBKA8mfm7631NMejZ8GyMtfUUb4y+4vRXnsZMnRty
wrljowp5IfxDKZcHwrEmkqSP4+WbB9VvSokbI+xJdJx0ZXrSh76kTbWZCQdUrlqB
aim7JzhKjv6Qdl/xrZ/JHwhq6Klq54/XtEXKV270sh2t6h4LQ9Q985C3jx/sIDXP
KH+f7EmR2gmGDLwl/0tu8XVSSlet/3KzKEElXpsrf6Apetva55MLooUOvKG3Uk1g
I8Wrj8suvA+maAxcDkQqJxBkSHprJ+1LosOYv3uUILGR+q7O9kJB3gW2jq7XOkW4
VpAqdjDYgwv1r6B/s9bIm2KFBZ0M0WTEhgbW+cLNgbdbgAKszSGbBbw2pNQPoZUp
+78nieub1XGajzJHZZsaQMmIuUg+++jdf6El1WxrqcA/xoYLe4NvI2ORcqvwtZcJ
WCBIt576VNbgjT+4fgjcdVk/3499RKs43O7MkDAHoTftSUmeToDDYDOEg/McB7aM
OH4HHTii2b4x5BEsr9kdNvm12jqg1Ca7aepo15Ye1H7AGy8jv3eSsK9ERIrW/58M
EwbQ8nExkn5afm5sgkXVgT5203DaxrKYLRNFLUFLTvqQn+B9LLqUyGmH82tFFGR3
8SoEU95DCQkdmlFg1b2TFusAEz7jgF7h8VrsnTxBwtj+Q0n0wjqY69QRK2B+NUda
eeQU0wHkyKfcYLXbRaFjXcOir8HpMjy9LQTN40TiW54NYpeZ3w4E0TMWpJ8smKTf
TOUU9MOcy36t78Mq9Zi7po4PE+MchTtUqA2c/xFbpVFluZYb5NDzJkywmXzQefG8
t0f3nOYFNdWyzjSgQ3Aai9TzDdQPu+cKlPLXlsYiT4pHyM+bvES4PwGww6tX/SuS
+FkpYZ8a5SD/hh+htgH/1/NrSGDLR2NrcoJNGswHP6ZwUylOkXOlSD0dq5PFdoNT
GGxFltI4PLEkTudoE0dj5vCwEwMPVKrjCOEwIVkT0/bPB/8RBVW7HKRZQtkXXGkj
ZCUjZsa+f7JUbLLQU/dxwDtgfmqVbzfCHsvdv8eUUInA36ocsJdHjfVOmIVNBG7B
R+HbGapmNPGoLH9LpCVe3pjGGTj0TIbisSErJScpBa9qhdZp4ejY1wB+Y6YTdYkl
n4nuTUxdgTQB1DOhnchPSajyMpRYs4auBrlGviZrJvaXSKN2z3EGSoxYlkuQAciR
nLBFj8ywuz4KVJ8/8amUPyHE9zxVHkZCkqXAiHGxy7GAY0XjhVuZ4Yjr4Nc1JZ1L
OFVqok+5mKxatViqArNUJ19K46V8emD1NYZow4P3SC05YelkFhPwXW02atUGX5HH
UNmYWeG+7DJ2OzxLouPN6l6cHjzV4OWBLRl/4TziK+u57aDG7/fgxOBvtcSXH8PP
RbNvnHe5ODy0DcEUONf6soylKdRfVXSkCAhgKfL0vcFJms1Zs4J8dHOPGvrWGMiK
3yBGIoeJhvR/xVhUktVSsJY6q9fLS+3d7IHnFRtMFxVsAsW6cBK1egQOk0JqvD5i
0zXEJtC97FrV/Ezb0Jp/INRu8vy/Yg9kUUbbtvNTA0nlGjHqkBOUf/RlOT9CeR5h
9iqn3HVgi9uQ6Gi9ticIXa/5y9D9lAp3LlVbMaY/sDwHpoPgFvg5ehXMVQ/7pL6N
ZPsnRYU8mv4/L+BMf071wRv+BG5Duw2Af7sYs0VZ7IpmaXYBpBaWct6zS1usO0qr
jAXDZONJclYjrZ3rYOBBQ0agEeLHVZqaJLXYoIsF76KZXZInFZ83OqMGNSlCuHuf
2S3dZUD2CLBDArl5y0E1OzuPkXCiYZ2Ou0141UC2oAVpMHmdNItrGQWJNzKgp+hu
DzKHp0zQbdcUmXF8Qge63Y1ZJPNOcjh7wBmPItBmZhg0PKgApNEQleZOD18rkNtl
5S/VCTmcPWk92gR9WRrZTm/0qo6D+1lZU+UaE1plx/Swbj8J0e6GLBpP3gCvJNxB
K4oo/wCPGc5Ki6tpWtqj1pGZhBnTBQl7UQy/Hd2FRbwPyNEGtz/+u3q+zokZ+3zJ
5a4tRPZpX6N4k3PvtniD1B/3GRL6aGD4pey+rBmFE+E5ouBQkx5FvMNTs8cM93db
lA5sBIO9myMPO6CC+ZtUvqAz0XeP95weVhnPO+3SrTOL+Xe6WYul1xRTC2waBFbd
+5jx5okQv3JLPmhxC0PfC2E9vY9DvpRbgPoqo2qADaMMF63jHOHIOy05bnSQ0aK+
l+f+/lygZdqD6NMllscBiMh0htbJ3P7oTq6ohNQfeFS35sjYR/SfLmOmEmRa5UtP
`pragma protect end_protected

`endif
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZngrpH9MPYgnLKFDsH/QSRU+LKzNzirmm4WA+AcxEflYsFzCJO8wJdsOmYUgkRY+
QRxKDNLIKG8w4yEJtmu/Tzt+pfMiRs451TyQZb6ZRIHBWfNIULBZBK9S3hDA8UI6
f5G7qsoZ3SGsLRbIYMUQKK6itgtbYYWeZhVjPFhPAYM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4579      )
FiGodZgGMN0FCN8NmRRibdsnSRAX8Vw5tn5nkz1wMl/FSB5+xdnJ78yuKIPeiviN
g3+hV0pUm3eGx8ST8kdDW8C/m8pPmuT5A3md+9rClOhJmqarr64FaglwFOri4oQS
`pragma protect end_protected
