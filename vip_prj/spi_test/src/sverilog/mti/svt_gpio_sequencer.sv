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

`ifndef GUARD_SVT_GPIO_SEQUENCER_SV
`define GUARD_SVT_GPIO_SEQUENCER_SV

// =============================================================================
class svt_gpio_sequencer extends svt_sequencer#(svt_gpio_transaction);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

/** @cond PRIVATE */

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
  `svt_xvm_component_utils(svt_gpio_sequencer)

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SrFyov4wt6OxH1QXvRbxLW4gkxWMEqLpWKBMbbjJTeseHo1qbC0k9USAPSG5t8Dj
OekQHNZGm3M7rXOs0iDDwdVWxvEbECf4bfkvgol/WZa/qKaev1rSfwyFT+6XAXnk
8nI1GpGwCKZxUDIF/zGabZN9HqoopD2HGm37Vb5bDlk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 600       )
KMnY330ZZZYB0lqTgKYQ4IDVlIfU8gkQpnW7/JeV9kiURBHAvj3/s0rdOa6Et2Q9
8eEJCdzcDM5z8hlVG0VuLSIT0ZfzYObZzSzZYd46ejRug+Q5FlU/K3xYPyjJcrf6
zctZh8KGr0ElNwvUCTuglzfX2nd0BWCh5+75QRh6ZbO0iCW47wkRxRZZjKSAKVtS
QWdyz4nLxLcT0aplYRMX2+oyubc59NskARm9k8tPw+pmqb9cHFmxWzClD4iVs+q6
THhYxvuBqH2R+CzJ/x4mGlBkkrnkR+riNimhJb+MnKDHO4aq2Zd8/EFc0ksAnnht
b5Um7MvMjiyzXbL2R+I+zZhr3s3BloTJULu/cbaizhgChoDcSP+uB0vuC1XvNj4+
qGIZkX/eQuhuLOHOw9yY2FPpEPOYODydX4e4K7TExvx7S7esSmV0tkxDPK317DHB
mI0mghMfU7scSJrB24EMw3nofMsafdxaHyWo5im5xEAxdPg5F9DqAj4SabAwFOhb
5j1HNb35uaeyqJG2X4nYxtlF2k0spX9gK9KcUryXXZ/7Ukzb2pPl/XPl3cz7gt6P
XzEkMq1tBdiA/TyiEReD/OqvhhJ/pAtLgtGHvTczi9Ms9kiFKfJ8ZDrG23NtF2ZC
sWMO5peHh0w4L9KedA2ZTxD4+TKppW++5NFuNEMg9O+7jbdqmlpUtYpUvDKyyCm8
z+yamM5Zr7kfH8NMLD5kvMNajUS1+tilxPvQTnVmfNKFeN4NNUWSGvdNxpq2jRg6
64+5FJp2lpIFRWpu45G+XT9NiL4K5Vj55XNjcfPe9V8=
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this instance.  Used to construct
   * the hierarchy.
   */
  extern function new(string name = "svt_gpio_sequencer", `SVT_XVM(component) parent = null);

endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
iT7wTmsdSH1SWmRtfHU3/kbfAaG0HxMMDpySCIHi0KS6L3YttIqlOZRPT+/Nc3vF
IxXsKR7ClaFlSsJsLU5EncTtYSdczQotVoOOmjSk0ZVcHOUvyHeoyJsZR6CGwYew
JAkWGxxEwpagggP1aWf5Pkg1qaMZHX5AqZPluvxwK1U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1362      )
aR10870k1KfaqKDpJflgtrM9sAXaTVxnjnMrJq86GfJHObMEXcDc6RQDHec+V+nl
TIlmbyuWXQz0agZCT1TgXK+fohGbSdJyBsw7UZsNENarEFPIYGg86hdLreywrDFF
8yCCvz5MA8ZJXP8cYVBHcpeqYofAlqWskpGxiS8Jez7GfKAh0dvroyrOW7f7wJy0
OX9tatJC1UpZpLKHwRwJco4j2+7IPkmtL/uzbLLVrDEfuEq/IdmfcVTGjiWLpwY4
YAJ6DpaLVtesq/e5H44N2GdYVDt94O71ZioJIb8jCSz4xCZgdxkQTrGQ4y+zUlxY
KKnSEM0MBBPSIAwgokTWu2YWASWoPu9Mm92O4KhzwxbIgn4Zc2GZBajM84ELRm0f
nU7zUZOW4mGmcXZe2YndUXVhtQ2wcOR2Xk2ZX1z6ubBDamK/SJ4M2MnmgIKTM2d8
tqpKLKIz2Af45sbUMbO52ogQxR/EqOaXs4MBLoyBnDAmCY3UNrMh7+Y7l+Sld4eo
QIb6DYE8s9kSVaKBSX1dQk/Tq5wCudWqi2D/bYen6iDjf+GrorwldQP52do0wFeN
CLpQIAnyuJgOF1guJGzWhBXem3XYEJbyLS0C0fEAFPPYSIMpk8qUxOwCldZimaK0
Uz9raxGiREp8CtxIPfVcE7bEez44TPw+TU6M6RRsrZVMWP0tOyjXEA3EMffSHJtd
OfsBztQdmCZnOT0P6xgvJNkusw+x+oV5SzAjiRRG7DjQHrIKe2tLaPaoo27whckq
OkLMXH+LyHBRiAgiF5rb5V6o7NUVMDuO+d3jm7OwJjJ2Vy1KsSiGIz18No7u1ANV
dPk0cuzvmkOiTxwBUYipU5WgPoupM1mEJylkPb9Ae+gofiiHN83p10st7frhu2Jw
XMVttrchWxZeqqTR0lRJQ3kVHuV3p8yfLGpDPo/GoZ9TTR12f1kMYjjR4Ca7Ezbn
5polkKQdwnrl42TtIitoIUcHcz01IbNVpe0ixvWDNWcFv9mHB6yCLYDaOt/WDpC7
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_SEQUENCER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Uw6pFCPZ7XirO9T9euG5Mlx+OPpdYEASERU3oihPvhS2mLGYCOt7EvcIyzVDAJn/
0VUeaEbzuJzqZf8I6Ohz34sFruTMtyS+zL+UTCRAjITSSD85ox3bc1zSOimaM81O
F4sB+MFpVWOwhfgSAhaNrX90d/X0CfHx2u+7Vdvk3l8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1445      )
x+1plUw5N+vXOMxidfjuzhlqwGyMagKqqc6EOuMEBhnbvZMFAqjLN0jcvvBQT4FC
pQyzg1m1oQq/z4BnoovWaKjle/OcT0Ot2ntGNADuEy3qNFBbZfRUn27vlCg16RAv
`pragma protect end_protected
