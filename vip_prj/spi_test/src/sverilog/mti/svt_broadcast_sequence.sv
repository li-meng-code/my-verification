//=======================================================================
// COPYRIGHT (C) 2023 SYNOPSYS INC.
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

`ifndef GUARD_SVT_BROADCAST_SEQUENCE_SV
`define GUARD_SVT_BROADCAST_SEQUENCE_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SK9j1VVKMWj+31MgKp5U8gv0L9/F5Z5ifgbmhgeMtJxH5s5Jil4EeiFR8JH73sGp
bRqyRPF/Dn3jHlwzU8DWuBCPmO3cGy+gy6RFUZ9XmhDfSQBNSrnMuhZ9t4nCl41k
G73WiYtpaKXlFwSdPKCCqP4Q3fejTJy3E6f4hSB7OBw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 863       )
kKQ1ZSige3F+ISyj4Kowass7vW776+kAgkmwkk3jRJuMpv988RW88k2eh6yqoDm6
Rt2JjqTgbea4TqW35njQ+ZwPixAyYLqOCqcx5KUzgmXALC6ceTaXqJiswmA3L0mn
xF1Uu5oi3wOFNUbOP/XZAVFvOJQI2oDkRkd4b+IDu18YU2l2p5jdnEELjWiS74FF
fIP11fyE7QkfQ6Xf1Ow1GLRRHn63eaLtllo4iFSAWWj7SjR7J+qJjHEsuYl0hXzh
6MELgquBD8+GpZT8CfvkJnZzsoBcag7sofELaVTGC3vydJGL0+xDD16LF7vVFhOS
w+HPro3bWJd7gaftw64hblOh61DfS9pZH4WYtzUXQIXxg6Fx1OLKqcot+hFiZkKO
5YzTiMqcwHt85XgOVfsSA1gXszLT/T9ijnFkoNECKdRskCXFcPKhLtShs1rCGG/Z
z8wPCnQ++JfaCf4iD+KbMuYfax27iEjWLPDLBcQ82pcJzGEgQrLKSt6tqNp6u5DA
5n0sUe40M0CGP/2ya3qBzS+gBa/735HbYO7pvuKDQmXrquP1gYJxYfgn9yyEBqBH
CQng/WN1nnNAOsjlIKLK8UjVkputJCKsfmzihpOu5N3EYfvdYkh5iu0ovRdi4buu
wge+h64tfI8Bq7RwIx3mbm3qb8rV9otZlvJbJAMlMFSObPdLpysPDVIrFye8JT6v
6G8zckyu5tclqII5d1/HvsCYkXLd8vbrBLkTUPF2gNrDbeq0VGkbLs9FNHckInu1
n8EFezPL4xaMIzVR+kNiTmnV4vszuxVnY1Tu3mC6p5sxRwLVxwWt15vyAyQICv/R
LX1Z6tZgxrfASpwrClgIw9N67G3MG4ZAVf2aCF5pE4V00jQ9HBGr1NhybKOmVgie
j0aIX2kzP7GOCw9G6FvxH7PU4ncgmNsFp/BMqSGTEpvRwDiBpkKFyUZGOuzVisk4
dxG4Xj7xiItD4ghOcxp4FlvckPHzttN+SuJv3ll/+2l4+6KM+vX1VOiwgo9UJyl3
pew+r3dCyuPyG9NsbNRILX63Se9EJ8Vra5Uid33DxPBx8OT7cU1fcZhZK0kNLsBA
yU9ypeoqeVNBAFOfg+Sl7AwUubabwmmW5TmQr/iIs0bfpXDT6EEqCA7sqanhoAwd
`pragma protect end_protected

virtual class svt_broadcast_sequence #(type REQ=`SVT_XVM(sequence_item),
                                        type RSP=REQ) extends svt_sequence#(REQ,RSP);

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new SVT broadcast sequence object */
  extern function new (string name = "svt_broadcast_sequence", string suite_name="");

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CIpnt6Akd+5DJRj2XLVd99HZnFgOzimcj2RFEy6zag5/HayNKSjG8dlkH3S3oIV5
PO7HkPMZwv4eY6qjW5fa+AZL/jzdXgMViYq/PkfQvzSqaX8mHfB3hpUskznTolHy
v3v0rnuOReUMarCoaA7rgLWCTYf/IwCBv+mDPmxnGeo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1494      )
8Bq6fwaV5/WOEnshY/wBqvU/qcA92jbFXSXnGeMZlJ8pWsyRpF7cnwUzIcrVZbB/
ZOY2I2mAxdfNoogQm7tMAOSchuFP/WE9fjZ77Uhigj9wOKR/3PgSaW26U05jRHHC
uQnzlXpo/7dG7QVuH8AO0zp3Dw1aD5W6V4+JMfw6S4giMiwsq4fBRC94bRJor4wS
C/vk3VTvhZBhYUlPSdGTMVGqoNs847Am1MY/qOhIBJ5smxFbA33YQxg5a4XV0hX1
p2e17diUJntQZqHqwXGMlav6RZ/1W5u43oITE7CbJwKBxRBsQLV3VmdIdoY13gnw
JQw9ejZyNgHqiv8JZ4hf+tMpCz32O2+xavclSQFpvznJalqKZVvd9fXw7ttBIaOY
/dX+jnLcbiuYUKMcufk9ar3JDujAIP90yvrQNzVdOzO/umKj+Nyj8E0Ih6xbkHvP
h34KPNzhJ4naJzRpi18mjE89mhtLX4nz2jl8e6YDRI6EAp51EHati/y6dc+73Kt6
ojs0aYk0CBz9mspMW6bl643r90cfWluGlcenmI+kno6CXI3KQxRkK2OcyYPhhSgu
N0xBEMMMYOWEgK4muynVgcwCo9Yp8Rpo/mxr07qTYkM6MtZaWWH8THTWZpBgXvJ3
/gde1vTB4zk1zdtezw+box+B4mWwjUCuyg2hgFkirmJRM7tBvtkPNvP/HS5Y0ole
FDYZ4JwOVBg6QOG060zGMZFyM40qonhN9aJPeXRAv5B53EvlpcnS5bO34Ys6YlFk
k7S1xZ+S2Bt1/XIbbHsvOb+NPrYgGoXtkjr8EkK/YT5IYWbFmyddKj8Yw5NgPPf1
fV6usXTMrAcYWRE470k/iQ==
`pragma protect end_protected

endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gJ0ChaZca1HISYrl7t+ebJhlWOwLksTqQeJfFB3axAn3/Oc2HckCbrVseEiY8a5C
KK6D3zOHbGfw1Jj9dds0KtlQkLZafM/jK1zs3bq8EQEQRoC8ZMOR8V/MqH99fjTt
9ftOUcsxX2p0bwZMoM+/Ce5HpYNJSH2r7q6WOQckHOI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2785      )
GDFeOdn64XcrX3f9Wx8kfjCUKrt/CASZEZDFk0gQxRbS2o8N5IebMcb32DgsjCE5
iETpOC4YuzJT6Iea3xRZo0C5CPGVslz+9Lz+yV0tVmi/TmNlpQVKo2wEgoykGkge
dL62gV1qOyBdPyw8tCVuAm8z7GsLYnHS86I7qQPYDr/1l+3MjQ4BcR/JdSG1NugD
hD9M7V7EvSrZSmD1uHEbUH1QoLOlGuKcNElywZaerQWhk4NcPAGADmJLrP5p/qkV
N9tk1CfDNtq8q2ugyCp+dJT1xqq4sL+mtyERDEHBiFWL+8OIMnpYTERYb91KS0xp
FxJjDAdypTTIJfEYT1akX/XdkKg0GGOZ+BYpHa5UWSwRaBG6hhaazUENFJEgZVAe
mb4s0Fiseagfygpe7CH++OuLW7beNTidhCb+5a52WeCl1vIaBQDd1j4ppRWhP3pg
2DpNCK+F65lOKvuNHYmnSRg0/vQPIcyYZhs0WkeaW9cNnKNvkQSGh/C2t+hatw0z
tAHwfHPx1jSb+t2HQrxPyR7XLHbasXNcjREw7//G0XAYNPTnZgzYJA+7tH29U3qW
md9jC56FV82Cr7mxTVitp94IMunjXM66aApIwbzR8+xplv9P6TCXdCCWR/6V1q4/
CujqltD1Nf405XyPUB7fkfXIO/PDFZEZup3V3apNSLDabsuqdIsEOBC4D/dCahe5
JEZ9aEZr3d3eyHy2nOMZthCHIzrFOorEO+opIw00FDfbqiAa3he4krlqC2jc57oa
4BPupXlRCHTSuUnCYwbcXYCxnoOh+cb+jc1srxhLgIIHvmobeA6c76IpiHInz4ai
Z3yKqfw2PVFcabD+uCJ5KZn+SudQXikWkRiFlL+owmhs3vWZIPnsFG3oNshlSdcI
T3app6rq8kzQW6GhXKYX+S9y4PDknx27q2Gh+pOZqU2ehHrTfw93SzQucwcSf//R
FEaXT6dBzwJBmPmx3WgsSKTO2h52i95t/Zy83MuQmHXH9ebivKfxvtUSZCS8j61y
XUlHsqx+x+OeUz+RfUDl9DFMRMeln/8bXTzFKh73dE2vUJTtRjSe0gkLoZ4ZpLig
DrvwjgsSZDibwOtwu6TiDq/oRkaZfBzFtZowl/4nlFO+E7D/oD6VviIsw1jmmw0T
+7/KUzzBaS3Uo6x3q4HV6boO8ubG2vshxxCzGJNOPX+CTse8cwQZcT67ImTA2siA
jWB0NH4tG6AB+1Ibq8LQPowkPiNorfmuMn9ZFfAP4KW8scZJbGJ4DWgG5yDvUbs8
aMiY9N6FwmhihQkHlx3aD3bL+ryAw6mXqjtiHxuYXajo1klUtSIJgyQw3JZzwGt+
hVL+omTNFXstDPsXfPy5D3oXUZIfRFtqj8wOBuvZ6BidVvfXBW/1LQ9AtI01+EKG
A7Wc0AbF8OHqYTPDbgim3cSpYmrEJVW4QM2nt2Uv+Ko0tBPYVLo6FTIpK4C2yuhw
YSlBlzxVZulXwWODPcgP9EMVOHLKuw04wDRLZw0MCv8qWlt+YqQUzsjYSC3EPDu0
lajWBD7jo+9rLY5wGRGYuJSmVafi1yPJ9HXb7feFYsk6pASbR3kuZzbFM8+GJ6M5
nDzK2cL44CoBJBECbc0tE/Fdk8KeJJVkX/KUDhG7Cu5+uULxbXNl8sKo/0yp3iXX
NyFflRKKjXSPCWPAMbscelmmdGZN6JRTbsNy1pQwlTQbdTb1y9s0K1i8dX6SN0Jn
`pragma protect end_protected

`endif // GUARD_SVT_BROADCAST_SEQUENCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QGZYesIMnZLMeqWWHKueqlGyefUsAlHuo+vCL1CB8Fyb2GLzjKjCKcdHtTRsACTT
Wl8HVLZwtRLXF60J7cCaZ3zR8F8SdLgapZWeByMfVDu+vVStoCdCHl7urKYpthNs
5AmjiE3Y6L/Nc4DRcsxSrpEqYSRhlrKWqDI2OLM5omk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2868      )
irRcWgAc0NR4jvxqIeO2X+fLMa4DZQqoMcaVcLbx0gZovkuX3DP0yVkQ1uyvhMbi
aW50gOgg8OXq9TV5qA3F2Hj4+imVz9G3CySWFcjz0D2sdCW4Tp1Qt5aWMyDluiy/
`pragma protect end_protected
