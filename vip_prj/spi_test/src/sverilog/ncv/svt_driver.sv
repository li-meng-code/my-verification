//=======================================================================
// COPYRIGHT (C) 2007-2022 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DRIVER_SV
`define GUARD_SVT_DRIVER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_cmd_defines)

typedef class svt_callback;

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT drivers.
 */
virtual class svt_driver #(type REQ=`SVT_XVM(sequence_item),
                           type RSP=REQ) extends `SVT_XVM(driver)#(REQ,RSP);

`ifdef SVT_UVM_TECHNOLOGY
  `uvm_register_cb(svt_driver#(REQ,RSP), svt_callback)
`endif

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter = this;

  /**
   * Common svt_err_check instance <b>shared</b> by all SVT-based drivers.
   * Individual drivers may alternatively choose to store svt_err_check_stats in a
   * local svt_err_check instance, #check_mgr, that may be specific to the driver,
   * or otherwise shared across a subeystem (e.g., subenv).
   */
  static svt_err_check shared_err_check = null;

  /**
   * Local svt_err_check instance that may be specific to the driver, or
   * otherwise shared across a subeystem (e.g., subenv).
   */
  svt_err_check err_check = null;

  /**
   * Event pool associated with this driver
   */
  svt_event_pool event_pool;

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
X+4WxLB66S2WM28jO5Ughk5Be/UpfSvwbucvfOEqJDcz4Md4ucSjVMqkdwPe314G
dM3UtZEVtmG8jB4ZWIV31vfPd8LQ/5/Cw7T5IkkAlqXIb3Ro2l9nLhqBgtuaLOYw
iHIZPYAc4YS5yWEEMPy5NOsjmvL+3mvPb3Tt7jO44dAnx/nAYGtiaA==
//pragma protect end_key_block
//pragma protect digest_block
dmNjFGgQMzk1pe6FdWx8n/77mwk=
//pragma protect end_digest_block
//pragma protect data_block
vNNKcg3aJ/K4WdayrN00XyEFeinYbgtcIrXFdvk5zbyUoBjASNDXshDbrnDEMn08
1Y/bWFmmHMJ3W3D1SSed/DfugnsXiZRl7GDpw/thxoKhMwQBhk2yBDUcFiItHRZx
HeaGdacgGfqcltmFgmjUhdCTw4Gp+iRv7BMplbsGizeIIB79j/QLCvxuu4IgGtbT
PinCeDUT+uDC/nj98a3JdDdAJmkxYEkoEcsGfJnV8lLUWZZYf6TO5VaE0k74581o
rHM/okghEDkzhDxJhmoB/2Cln1lZUCTuV5A+ZzJXS0snXNP+jSReZHQdQUmrRx0E
ckyGAHBntuucua/EokbQfMsh5SmPcVqlpHI9CDvqE1oi6p2yO6K7mEfuWShiDM8W
YxjUTff/+XDg+S3VJ4BsJUHqWyHDFm3UIeYlFmMEwrnK6PurMCc34mPaN/39ZCXg
MmW4umGXVbwH9mPvyHoy8Y013f7MPaPF5lgPiFnY4cKStLEGDYqdb8saDviXV5zG
icEHcvAATc7lHNEA1MGkB2ZOdqHXEEi2YnYqDH9qdzTD51uGDcQGmn/tar1nMgbp
I5tixaZy3IfAyVor4YzNRcNYt14L4XUt68WAE1ll3TVaW6DvDnbnLvoVRkLXlUFD

//pragma protect end_data_block
//pragma protect digest_block
wFsLXk7F3nnK8E2IL6p+OVkAtKU=
//pragma protect end_digest_block
//pragma protect end_protected

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** 
   * Flag that indicates the driver has entered the run() phase.
   */
  protected bit is_running;

  /**
   * Phase handle used to drop the objection raised during the run phase for
   * HDL CMD models.
   */
`ifdef SVT_UVM_TECHNOLOGY
  protected uvm_phase hdl_cmd_phase;
`endif

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
LtOXtn3REkHj5svTj+pleoFSmpJ0afS1PD30YiGsqUmG7t3LTJUZeezT6xxUsM8/
Vitgi3JuTw0H8YUow3FHTMsv8idJ1huUsI90qWnsAOCkshWdhf9ZC5jkimLTKlwK
v5cv0zvrKffU7Psc8qdJOLieo6VV1rTyqZJrb8DE4jl9v54CCyQoSQ==
//pragma protect end_key_block
//pragma protect digest_block
+M30FES0e6HTmxyuXHRZHCa1X10=
//pragma protect end_digest_block
//pragma protect data_block
blNwBc1YneR/4rR0d7VCBi0AHuWhCQiomIQF+z1pOBNGVKexyoDMuG3QFNlhQ0V3
8RpK8cwwYuKlBk9LJk/VbagKNHsv929KeAk986XPwkhkbcq8f3w/foF7dYjL3h2j
g3bkvdyYPYBUMST0GA6axKa/QEWYK9G6Es8ixjk4eBVv+qVLjbyuBL+OCJc5Ags+
72HZq121+U6QxK3nSnAnEnGj4iCWQ9p48S2GU5MdpczyzjJk7sHgZfY0+omXa+xS
73K0R4S/sJkw8LPWPUq2CEYTTOoHsPcSGDoNj3SttNhbRyH4iunSdBeIsMY4zKvC
MpiLhriKlORX1lXQq+ZPhgDvwh7ss81Z0Vj8L2ddNDk3wz1I7LHwRoXIRb35TjUU
6ZQNdkWYsWwjeGr9rL19MY/6MAreNhANfOAG/MuLWq0KCqFDuUHX6VLhjmmfjtxP
Ts1M4AQxbamj2zy8ezH2tzYdZqGpOTqfOsvpZcoH7dkfBKxZeNgQuXMhrKJar2pQ
z0ALpToQ0Z3Uo/v3cGhHm47OFfB827dyO0ZcJEq7JG735LOc68bwZl/diex3uCTK
gITMmpgcxuvi/ivjDujB97nllsy1o3TO8tE88K9opTADy/W4eRwLpAiOrRvdBC4g
oZHe3fDbKXlfUgcBpxDn3LKPlAfOQuqhsg2l2XVdPqMivNLY9ialOyZjb1t8jFNt
8rRlczidKJonKSzbpPaOmlv3nZdV//SawcDT1uKW9U/UhG/ZHItL63dKb15sE/7k
HMVWpK9I73VHJahsrbf7WthpxECtzyZAg/9WUAPGuAVxHVcT5WFQa/+8YJuD1sLu
0RofpdIE5U96V/DJK353D8HiQBrBCl04lsAHlXMjrHkKAL3JLd1rpxYs7QFnVLhD
JaWE1/WEglrK9Vby8URogTuYuewKQ6mdonPrbtdJzb1xTRpG8tFbLp7FtaEvKhwi
QvIMAWkO53RNJkFCFZpQqUnL+sJMKzE/i1b9BKsHrTQuDcTvNs65aUFCIdqx3rpQ
o315BB4oMeIP/J5RUxMT2NkkybXilFpr7mXHFL+3UbQHl/j8f28pVwRaKoYwIXq5
yojev4CHMEE6FgXszvhSudXn+VLnMOV/6Aw3FG8NHI0bJ3pFuo5WyIxGpj9urKTQ
k88Pcrktb+h8wZUhC+RMSakUYTJNaayAAF2lRCdye9ViFHJ598prAx4BOTYJRheH
tS4g/Jgtz8s7s1WV5iWjTglxpQ0e7WXBwPj2T8Bv50m/vfvUB5OQK9ijGU0gHjc2
Flyi8tRydE+Exvy1oQRAstkdYE931ZJBdSPZNRNlYAymeIQbZeA3A61uAbVUe3N+
LJvIkhrhDwu6KIrRW6vXigsc9fNLPcY9sZYEdm43JtlnszbN224V5Mxb48thNwI3
eEYF0ala+Wz0Pih166fdw1DYGsZ0l/yzaOovV5hoCrNN1szOMne+A+LzOF+SP/8r
cBl9U3O2PakM7ES6u1MxhjQJFXK5t0HJfaXQNNEi7mEPJc2+E1ILGWQUeB8ovfeR
gWGyuKkLGdC9cNBzCPVAoXDbDJma0bk5UaCmOZ3WOxG+E9/CJvYYRptkJoZMPvLf
Qrhrmxh93P1c5OE8He/9kP0d/+T2HWZn1/ypAfhr7viJUWKg2y0JQXekhs6vyHgl
deOo7QGcP4OEIzkf1XDm+JSlVkytrUga2II484erjDLWT7YmqAS307DHyIbva0wy
T1NsyElzQNJStyU1VGLn7xc0tgHKZm/4hL8HnO6LGoqML9t2N/o/XE6n2bR1vkTY
H+ijDMjwhpvkr0y8E1YqKu5C2kszU9BaUR404kXzvlnFEbzsSAaTIrKQVetWRNXE
c4nHsv6Nzsx+Mcl6amIt99ZNwk8+O/KQpRFQkO7erfH9DV4VXLgqKYlkqFt/c1f0
pvKBot9Tmufduhr9c2KsSSEc6Z8HzcZQJCxJQFeK4ZPrN7d0+YzHdf+RynskMkXY
O5TiSDfdaqcxc7Wt0S3mNsHwIgQNgWIRa52+IuRPMjJnhpFS8Kp3K2/j4RA62rW8
qj0CuvtRLjhDeLhAscYMpZ0v2xTw2x/rl/CCIi+9ypKAbN4aR19t68d8iZuxqsHd
/df2fQMQNbCiQ9MfC8vIWefURpn45uLBGYArSOJrKCQzKXbJpaV5gW34azooJXMC
ubRIogPBopRPi5v/YE2DWGingrlq/6MBT1fvyNAyUa+MiTpt9tVZQ4yXCP7dUOLC
6ftZyrpW54Nnr+RDt/1dNYjKIWRFFmws+R8IlNzMQMNUhXZbRATJKPmxTTnD6p4l
SFyTuZ1cuY+7KlZ3E7JE2bqt3I/bzTxtotBzmCLOVx4L1lLCXDbZQghfIGVtcRDN
hMhWGFQlVqmFVg1WZF68FxE6x5qdUXm/V0EQhVsspFgxqHmL73lKnuqC2kKNLIL3
q837S8t8vbFCtHiPmXxwfromExqMZFIdapd2LiiCy1r3bI4J5WwXGhQJgTFn5VrS
M5ARxoCkmDrp6qzV1sOg5dwYp68nVyT7s+y762AQK7l3+hYrLJfpiFh4PsMYsJFf
i+KHBpgqkCHTwV7KjJfY6Oy1jYqKuFIczrge7EMf3FoXQ6IIMhsK7Kht1E/56L2x
XYxSb5ajS15erD6Arm9zYdxSSgEybvxQQIo1vSdio0SyxSPoppwTvknjkf+xcnIx
i0GsaypMQTC/jaippDSz3tQQwmcKKOVLj2XHJJNQ+paRY1la8K6+tyPDX/VhRlGN
64JwrLzs23ZZLeDa35EEeS8KxD5TQ9ivyWliHgBS4t9StxP2722elQZ20WsWQmRA
rm3wEwMc//MagCweSUedjqP4x5qt1BhPz4aOWwOrMo3XtiLTQeoewHV5+WMUlVPr
BKr1KupltP7ZhTZmDs1a3Mvv8KGqJ8JG/EmvfMaUQCXbZr0YrVL8U5qxOVUd1YBV
u/3dNnBzhc2pk55KujN0AGnfiRozcQL2EyLOESb0YhDOMbSZxKRtaeyNwxGXHS6h
rHtXq4o02VmHzTxfGujw/heRpG45I+x/eOaeDxtOyt3FKcYDqzAkQRasERxbtXkh
KEPcjZKBRlw4mSzVKzqEp0h4vDvC1GwHCSFecY76fR0k04+BQFBH6TjkUI0e/xnd
yRMQyj78tyIIJ4HhlmwcWdqbbf7RM1mh3NppbE8zye+hrjaDGo7oTk2uq2oDX+tE
YedfUtPNj7eZb5Ds+Xrc/hgLgwq7hU/Joe9uZo1FA6CKRrmfpGdSD1VwYBXIrjTx
eLiKatwjNeFsjINRmf/FQKaHJxOteVSSHjw8AJf1LXo=
//pragma protect end_data_block
//pragma protect digest_block
tPAmkBRXsiScdwDF9//vkLK4WOE=
//pragma protect end_digest_block
//pragma protect end_protected

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
iBHhsr/KTBlez9asTB1x+iyNyNo/pJIoePZsyQ6RVelfgB9y+cs9CbSggi9QDUNL
47Oa/FVB0sSL5LOU3O6QL7nD0hRI2+DTcABhI8Ieq4mSIAvKAi4ltdCdBiWhxH76
kKd6Vi6yWj+BtsYwJZniRIuohRfdXgkpmqnjujdV8xBUTbjBk45nxA==
//pragma protect end_key_block
//pragma protect digest_block
ROds8ECoLAPJs34/r1xZwcu3sIw=
//pragma protect end_digest_block
//pragma protect data_block
2Xq7iEnoUqtxqdEVNP5pYfVrcYImoMl/wCfYGIP0vjPwhffvDun6H+LBr6nMl4It
S5+h588Q9sp4N3g13TGlxOFDO3x3d/FVIGFK82o3//V2YspCBjpcQB1jY8gd0Jxv
4U++I8W9r6ldC/mXg+Oo8DnOQ3WTDc3D4oUY69/CBkGgk1HMWxTocv1W65Pikk2/
9f32U3OxGkA7Ohj/e+34ih0dDFphT8KAhlZkExQzZsQKsSc0SZI/dTLYI8fhakbx
vRknu+UaEpdnFV0tM06NpBzO2KiLsNZdjGkb3qMJ8E/vH43NFBo/IMwY5NnRDzRI
eIyUcrhIH3FwpyMlsFxBPtirhvhOiYnHo4aXtW660lZ67Ajvr+LkIoubfeIgAc7r
OoZfKZmmXh7VRZh8iRFeAJCB0lxPDwtDMiazeQ4UNhtY5RCTqoWaBbHojsRS+EsX
iWOhiwryjzM/dKkl5EvoKg==
//pragma protect end_data_block
//pragma protect digest_block
FmenojGrD1/Zp6ycDuvk/M3Oa2M=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
2T8ssoTJn8d5Wwml6iVRvqzjL7IBFhLqrjS8mZvm0oksSr+n5aQfz2TywOk1gbjz
WwitAicIlHJCo7W4/NYScZy+GOkzpbONJ0dFiHXLBxF4+01avgGBaoyTdhY+ZdGb
vTGNsDNjH0KVs4oaTMVbjfJHMPVkTT+qyAI8rcIdwb1oCtxM/eDhTA==
//pragma protect end_key_block
//pragma protect digest_block
VFkWdeCC8FTX3RdHCGRLAhMbflQ=
//pragma protect end_digest_block
//pragma protect data_block
sh3UnNh43ZtS5i8BiyfCWYVu5tmxuTpX3wIXUZ1/qWUGig0eHV2+YtzWXVNcuKn/
0uvE38bmSVAPJnmugYfz/zaYMbMt9cU2vZIzBrlYFx5a2l4RcOK01n5kq48DzhQl
2q+onleV5+Kw7iIQ6P9dSDYu9ji7KkkgHFY9fv9MhE8mHHsrp50dbmphEnQ7MuCC
eEO1vO2zfUSyFFd1sKImSnlQBo/9i504bE0RYwoRH7MOFkxrSDNneMjqpOb3Ms7Z
gbMvrS+VtbO8As42ySTI9G9PKYtLPhJ6bxQzKKESP5ZitY3msnsbZ3JxxqOkp3Ci
1vUydvdJchMFMH/mk6tEBdJXAYkbBO7XDbmuluYP6C5JGarbgkU/IGbDvkDB4/SQ
4F6sQIHlMbVri7VGrXLzgeUhOfUeTTP1LkFHSwM3fPGg+YQVqgWOr4KBpqmYnfNo
7RhktJ4dXYLmWjY/V4hMBoWrzpB0tZfh879mnPtjK4gRnc/Af3/xl7AoJc2hClBA
NIjqBkvApTsrvrSwxJ4x6weE6Z4n5o0DXbf4qA0NBG01Jbrxn+GQ0cJV9ipecPcp
nULpa29e50s5bwWCfO6BsqEIQ5nqOVvlTrLkpjebQnr7Fiwuptr3R1xRLkQVq/1b
3GmbZGv+HsKLfNhdvSTSijF0q+YD0FYMyONLYkZZD63nnjE5DP7kG2jaOOOHgB23
4QppnAlLcrtkHYd7Bk00GhFM8WkElTHw02+VAEee1XvTzkYeJNwkjblScmKoDpRE
E4LTm5iWEA1/QquWyq3WqGteC4qmP2e2Z4fwR0vXcT0ABpJ3c6Rp0P3ZrU25BhoQ
e+4HesEq3o6AdpoZjQxHNSwejOSSuls+nGxDsCKl4tZ1F2tXypHoXOxyFegrDbHA
2nICxiogxw7YFKYCvJLjLdCM2y5sdp0+W7eKT4WrzHDBGoOlb5J3h7+F2j8cZJVj
w9kILkgtNQJbQUGLk+TlqCvkqgaJYQRcYL72DtEwMMw=
//pragma protect end_data_block
//pragma protect digest_block
0iyVrkpiH2C6n0YF/NO4Bu2M0lQ=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new driver instance, passing the appropriate argument
   * values to the uvm_driver parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the driver object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name);

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM build phase */
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM build phase */
  extern virtual function void build();
`endif

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_1800_2_2017_OR_HIGHER
  /** UVM end_of_elaboration phase */
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
`endif

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM extract phase */
  extern virtual function void extract_phase(uvm_phase phase);

  /** UVM pre_abort callback */
  extern virtual function void pre_abort();
`elsif SVT_OVM_TECHNOLOGY
  /** OVM extract phase */
  extern virtual function void extract();
`endif

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
KKOK7c5IazOLEi4wp5EBLQduX78lSUvSueeFZNWnjcVIJO+RAgJ8SFatLT4zbULZ
IReu6ZuGOTm6IHEjwgUJbcgnvDmwEtxvjnmTYIiydKM81W0YmWhysnIzqUqvod6N
vfWRNdNSmBame8mJf2hY80mbEGiDpFVGHcQeWWjFaSRab+6R5ZIPmw==
//pragma protect end_key_block
//pragma protect digest_block
WFN+VaCRQHu0rXlWQt7ZueqizSc=
//pragma protect end_digest_block
//pragma protect data_block
gqW/3rtwdPUDRx6LhioFvBpLpnWO5hXNiaIfv79WUOGUmMXWXvddVhAO+XU/9Haj
zZBK78zbad/Wmqo8Y19ffZPQ2ncnLKSFtNysAyBHgQdcGPuLBE6Mk1jb+/q9n0Fj
wF+v0pMGeevclEn8izpfMkLdCS0XNRye7h1j0FHm7pEvBb6SS348NwDW2vYbRZmo
JeyFVLx4p8ptfsIMRUoEy9+t8Fecfd34FCGKVDBkgGhvLWSP52nIn3G/naSk36+c
VkCq1pNLbOnKDxUtMB0CxSJ9DC3ZYFvzGoJ6WC9STndkGDjUiUbrmX2WmI4TJAa7
jgGQAa9N20FtNIrN27uEzoGONXz8TkAVLZ0yVYHsc+l4BBDkzTXCwRr8+5G6twD6
xgF+4rh1yQ159no+9OTmJfh3b6BPGFFfr/AbSqqAU5FtuIay9JBdpmUBjaO3xxhk
Bkb+42y9Tz3v8kFRn6/aQBuL6VzvPX6MGbMCANJVqEh0gg4KMjjCMntmoIPZWKbk
H1aqyPZm1nwbbVRSdFPc+9KPM4SngAi26Jt98HiMWZljlIBQN8cXm2zKg3Re2mtC
JWBIP5UbVi/++cxusT3P9GCNlse7DKSVCLET0ODLugZieFfgFFv5ijkQ7EHOfqGM
nDehsLg5kjmKb9qzZc8shUelQFJyspfUP4Ol3MtYziDsd6NsdaIxXFVuCOE30Pf1
EnK85jKbheJVDnwMzsA8kAllZ/5Trgrl84EWd6lQXihxkXv4vjQy+YlC/TBgAbM+

//pragma protect end_data_block
//pragma protect digest_block
qpBz/EtvaUC7SuO+x9QI8dvVQGc=
//pragma protect end_digest_block
//pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
qpB5C2Fmfh/7iiezfK8ZQUgS8m2QbfokBw1hGhvT42uIY+qOlMnMM+6rp0E62cxh
Jn9dkVKn3+WA9wcuwJXwfjX4RuU30ub8nQs7YGCdKlo+vRYqwY5MJrxQfi3sd5e/
cDs4V2DuC+y1s8JYwwBnnWJOY8eJh19Wz2yP9G1ByOSiO/R52hnLjQ==
//pragma protect end_key_block
//pragma protect digest_block
prwnbS0icLA/VNNN3WeU87JMbJY=
//pragma protect end_digest_block
//pragma protect data_block
Usf1eCZaIk78+iklGjxM0t2Zyv1NXh79hDeMIakLeWuDzCCm3+7IivMGSDpESFFK
AXgknuQhokMJfv+RU5g6rtblkrckrkil5PiGyIgU2DWr/JYQ0WkSAorgAbyloZ2m
OJkVX5wynQJENASCpSDjJmx161irl15at6QdPtTMXOLr65KiidvAKx1+gxNE/FPs
C6mJ/BsonCq5C7ObUALtyNNGDUlPjYgf2CKUNoWVfTJOKFkLryQD/z2s3pQ/3ab9
Ch0T9+3RTdh9lVkkZ8VZlg92oHMd2ZQUc3qi7oDgxyVB5htNk8USSqqWyHLOVXqh
XwIt7rtwn2MiLc/menlYmROwROm/9YDmkorXyYRcXRdS6x53y6E7h4W6v1ddHCrF
t6Fp7TTx+oLu53X4YwRJxQxxOAm89DmcjBd3xk/0uv2QPIm6cf9q+WJTzd9ls7p7
m+CVYBNEdTnoGVpQ1V8iRPeO4HTLTR45SzIa2WWOeT6l34W89PjGgYqIbF5AgHkW
oXq3wnC5q9U71nNzJf6IVEX55cGOeWgT8bUNCnoHcBBwMdShqoVh42/hrFyn2nOm
ng3J7Qd2Qy7f5XirgLAfwOjSS2E34jJn7dr71sDWSog3oXOpwll9EjLM4CKYgvp1
1QA+xTrG3dfKVV5w8eGyqg==
//pragma protect end_data_block
//pragma protect digest_block
LA17gQvkCpON9xxIXZ1eJqmICtY=
//pragma protect end_digest_block
//pragma protect end_protected
  
  //----------------------------------------------------------------------------
  /**
   * Updates the driver's configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the driver
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the driver's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the driver. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the driver. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the driver into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the driver into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the driver. Extended classes implementing specific drivers
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the current setting of #is_running, indicating whether the driver has
   * been entered the run() phase.
   *
   * @return 1 indicates that the driver has been started, 0 indicates it has not.
   */
  extern virtual function bit get_is_running();

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
23xnsTzKVabPhXHr71pFJsfI3PB+PWymECnslJhQzWsjYttI4tLTSNN++D8nMCw9
NPoA1voqQdunL5SVldORJlviTHompyhs6NclP2XIz0JLtn7vAbUxA/t0P9yXMMC8
dvifZXlAE8fo5oo0yhYVgSEvWF9seCcmGpvPmbFtaseb6tSTZAh54w==
//pragma protect end_key_block
//pragma protect digest_block
0JTr0rip5d65PzXb1hluex5F7Pw=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
tDogE7pczBXJXScQap6LA1IJwM0=
//pragma protect end_digest_block
//pragma protect end_protected

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
+iROXZK3C2rfUUXwDsLWUfkZKraZTgoEAdG+FhDNRmfpyxSuhcwZFJFES98ibPUz
pY5Nqj4q3D6UrIc7QO1iJNRLHmQC9fy69znz74zATu+gx4CXgzlCxfTZwkpX+Y91
+vFnsMMxBDODnc7M1scyb1JCijfnlzQfTUuf0XE7y0Yn22HSupxEkA==
//pragma protect end_key_block
//pragma protect digest_block
iAlCSqmzodsv95DxYTvYeCado60=
//pragma protect end_digest_block
//pragma protect data_block
IpBzsQH+6md/J2LeBabQMwsVytSr8cM4Pvs8V0KQRkSd8jeUM/3hPoIs5YFpoSOo
Pu8TTVmvT90HejWvb39FIwo3ekVHRt+YczLVg+C7qBkqGblygZ8MQBJgz/3nuOeV
My+ht5O+0H0Kvv4fKOs7RVYlZyrAo+63BC8JAf3D0hVhsIpKOz7r1jzyF+IaJtga
4a9WbHGrfcLjHrs/0/3A5fYnv1WeH+Z1lPyfmG14iJrva5I0c//gDLPMXJ9aa7rJ
6AEqu+9t6xlofk8dV8EzQi1tHlqiaxO8ThJWyvA58zhvetrWJ6jYju0iGak9LkFE
4x4yjrInA87lZb/XN0CyxFhRx37KQhhT7OgpOal0BrpVZ0wpiVYkZj1Ey4JFaL2z
3DFlQKIeW9tuapv6/NHuX8HIjozYXQj+JCFtpgBIR2rm5CTDWO0je3iAB0FbpAfg
BOBLbOMF8x/NlrAZdoYTP2cyr9Xl2srpdw+qBy1sPDPykMV3qZLcyzKbkFSPgWM0
8O9eYJq77FKFfhn2rYC8Mk5P70FLsPfxeIYvFco6Me58wgQcGIwz8Ca9EKZzrXC7
HAeetWoixTiKhrllPba3tkXEbCmLfEZYs4PQsCk2b4Cc3UjwUba9ala0vaIze+Es
BQ+PX5Fa69+X8ZRwoqH956LyUtUnm2paykuLtLieezdhIKJQfEpLPDJMcgAUqiio
r+2odu5csC8a+3jKI+3M2vi0YVCUUf4+FCWY84k5uXtoqA4VBB02KOxr2B9sdmxJ
hMrEGgDZRxLBlkTRu1/5lFsI477sIKeu9pPcstS4zYKOvbFYoY7E/RtGDAfSgXdr
/RMZXIgmOzhxphyKvy5uYuG3uB0RZ3UiJJ7pKtm+fIOAegrvDV1CMcn9PumrAnHC
RdKeA1S2xHS6QSBSZ1yawXGtKnAkXlFTrqIKGmKTfmBYjauzlu4hOrgwDObjjFyt
8I/0wTxCQkJpQ9mON5dNf1OrboOcsdc2TYMYhf15oIvpducGJqs+uo4nXzxLVOS/
HWJGyNVCY6LsqAUJW23yqL2QqaTuIOKfNLeLdRUlGEiXX29A/+EjsmqOUiIKZk6u
7ClYJ/ckNDVrmi6f/z/qwq65Ec41g/KOp10H/EEjeEhIPmS3jwKQpyoZMpzOUh69
9gVCeiNm8MGHf76LytvR0JOJL1FgzSA4r5Ok5IwLtPEb6/Iq902Y8Cz4k7rja6v0
bMsnUN+6juwhLtYpDDIE9EgrxfJKzykS4IP6UohGrxaOQtko6jQWkYsiNwkVj3Qz
oW3grUkpzvbFkpy5cCHLIOCf4NoOKHLIQca8ISF3CNsM8o/TVrMX1ThpDRs1YPW6
xewj+9vP58tIYSVFioBOreiF50dFJvcfWh4XlunofZvG+GDkVDSMjmPBBLz++2Vu
KpdhSU7/Owh/R7lYDbxHylP+LoshdPbrzVau4cBwifayzGSit4bGdrmokPnAT7Ii
c5w6ZvZ5GGgNoGsIh3F7eS+kBQhFpm4y1FpYETA+W4SCOc+VlvrXi3T8FgPVpo0S
Sz0UFHnlaM7OphFfTwZ3Fvh0e3BIZvZ/xG2yWIMYIEFJElmYnMAsl+59ewShz5Dn
2jvg1WqH7ehMwUznBWI4+a9OF0Yyz2FVUVbKLGbYjqSVpYBM4kZD2h7eWsNvayBm
hz7MkE9SG48/ZzumO9ApI36OM/NcNaQ9TJNdMyfS07qzqlugOgc+YJUvDFYOvevL
bGDDnGpO/SkEuRYpJs7vIYbMiakAH2+RpT8Q2zOEpO0=
//pragma protect end_data_block
//pragma protect digest_block
PrwvZKRf6EJrCTHu2kT47n9o70U=
//pragma protect end_digest_block
//pragma protect end_protected

// -----------------------------------------------------------------------------

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
bngBbkm5n/wuBhD2JRlSgyX5JOmWBPB4UULcaE20YYCAJ9J6J1jwDKJSFtUHEqz7
fTXXXgzd3YJMzq0IajoFVp1+LXjDt3guDl/aRrx9Vzi7AbIiq9ep2D2J7Az2zHe6
5Brl68z15hvV5TlETJU1P980N3FVfXS9dlFlRtfsiDtIzuLz+Pv8aA==
//pragma protect end_key_block
//pragma protect digest_block
Biljcgn/DMUv7Lu3NrW4ZybRRMM=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
VMTAH1Gho5zvVnZ2TgGdGnmcLm8=
//pragma protect end_digest_block
//pragma protect end_protected

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
aS7IYr8BN2mrlVkT9CmK4AxUF48vC5krSZqumrePLIbjl1s6ndGY5ewY9BbDB0o5
d12Jc6qCcy+dpxU0zzsCSwg/k3l8Ui16kGfo9yjAkBJxOWloq6Za18w5yx8rJ6cu
gYb/QRvPo5nh4enN3LZS+z5XT+jXHc79jsyOhf/GwIyYRYJ9TodPQg==
//pragma protect end_key_block
//pragma protect digest_block
VM1VCoexVkpNEya5SKxCTlk33/k=
//pragma protect end_digest_block
//pragma protect data_block
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
vd3LPsZ8l3CeUtIoX2gjGQ==
//pragma protect end_data_block
//pragma protect digest_block
tPW6cTnlbEJsUhLgmRdv4lsnQ4I=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nNFhHOEt7VVgpZ9B3oDtKmrt6cRGckPNdvRKzpeQBXaHexgVY4B3ZotW5iHucQ+Y
spz8tUBd11biEiMF87lf3J5OWHuig29h1ax1FmXkdHFZMJzB8g8ecerANlZj5k6h
T0mcqjPP+pcgxpyGebqfKS+5VK6YMh4M4SwAGUZbRGCPDSE2AxzFCQ==
//pragma protect end_key_block
//pragma protect digest_block
Z7vAgP4eynupU8Zv7HHYdMKpp28=
//pragma protect end_digest_block
//pragma protect data_block
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
uFXTM7GQeIlG2SRyZuy3uA==
//pragma protect end_data_block
//pragma protect digest_block
GuvhO2VkmgScsUbedSV6te2DsTo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DRIVER_SV
