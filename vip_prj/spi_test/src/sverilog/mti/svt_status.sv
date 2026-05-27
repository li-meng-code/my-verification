//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_STATUS_SV
`define GUARD_SVT_STATUS_SV

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_data_util)

/**
 * This base macro can be used to configure a basic notify, as supported by
 * the underlying technology, avoiding redundant configuration of the notify. This macro
 * must be supplied with all pertinent info, including an indication of the
 * notify type.
 */
`define SVT_STATUS_NOTIFY_CONFIGURE_BASE(methodname,stateclass,notifyname,notifykind) \
`ifdef SVT_VMM_TECHNOLOGY \
  if (stateclass.notifyname == 0) begin \
    stateclass.notifyname = stateclass.notify.configure(, notifykind); \
`else \
  if (stateclass.notifyname == null) begin \
    `SVT_XVM(event_pool) event_pool = stateclass.get_event_pool(); \
    stateclass.notifyname = event_pool.get(`SVT_DATA_UTIL_ARG_TO_STRING(notifyname)); \
`endif \
  end else begin \
    `svt_fatal(`SVT_DATA_UTIL_ARG_TO_STRING(methodname), $sformatf("Attempted to configure notify '%0s' twice. Unable to continue.", `SVT_DATA_UTIL_ARG_TO_STRING(notifyname))); \
  end

/**
 * This macro can be used to configure a basic notify, as supported by
 * vmm_notify, avoiding redundant configuration of the notify. This
 * macro assumes the client desires an ON/OFF notify.
 */
`define SVT_STATUS_NOTIFY_CONFIGURE(methodname,stateclass,notifyname) \
  `SVT_STATUS_NOTIFY_CONFIGURE_BASE(methodname,stateclass,notifyname,svt_notify::ON_OFF)

`ifdef SVT_VMM_TECHNOLOGY
/**
 * This macro can be used to configure a named notify, as supported by
 * svt_notify, avoiding redundant configuration of the notify.
 */
`else
/**
 * This macro can be used to configure a named notify, as supported by
 * `SVT_XVM(event_pool), avoiding redundant configuration of the notify.
 */
`endif
`define SVT_STATUS_NOTIFY_CONFIGURE_NAMED_NOTIFY_BASE(methodname,stateclass,notifyname,notifykind) \
`ifdef SVT_VMM_TECHNOLOGY \
  if (stateclass.notifyname == 0) begin \
`ifdef SVT_MULTI_SIM_LOCAL_STATIC_VARIABLE_WITH_INITIALIZER_REQUIRES_STATIC_KEYWORD \
    svt_notify typed_notify ; \
    typed_notify = stateclass.get_notify(); \
`else  \
    svt_notify typed_notify = stateclass.get_notify(); \
`endif \
    stateclass.notifyname = typed_notify.configure_named_notify(`SVT_DATA_UTIL_ARG_TO_STRING(notifyname), , notifykind); \
`else \
  if (stateclass.notifyname == null) begin \
    `SVT_XVM(event_pool) event_pool = stateclass.get_event_pool(); \
    stateclass.notifyname = event_pool.get(`SVT_DATA_UTIL_ARG_TO_STRING(notifyname)); \
`endif \
  end else begin \
    `svt_fatal(`SVT_DATA_UTIL_ARG_TO_STRING(methodname), $sformatf("Attempted to configure notify '%0s' twice. Unable to continue.", `SVT_DATA_UTIL_ARG_TO_STRING(notifyname))); \
  end

`ifdef SVT_VMM_TECHNOLOGY
/**
 * This macro can be used to configure a named notify, as supported by
 * svt_notify, avoiding redundant configuration of the notify. This
 * macro assumes the client desires an ON/OFF notify.
 */
`else
/**
 * This macro can be used to configure a named notify, as supported by
 * `SVT_XVM(event_pool), avoiding redundant configuration of the notify. This
 * macro assumes the client desires an ON/OFF notify.
 */
`endif
`define SVT_STATUS_NOTIFY_CONFIGURE_NAMED_NOTIFY(methodname,stateclass,notifyname) \
  `SVT_STATUS_NOTIFY_CONFIGURE_NAMED_NOTIFY_BASE(methodname,stateclass,notifyname,svt_notify::ON_OFF)


/**
 * This macro can be used to check whether a notification event has been configured.
 */
`define SVT_STATUS_EVENT_CHECK(funcname,evowner,evname) \
  if (`SVT_STATUS_EVENT_IS_EMPTY(evowner,evname)) begin \
    `svt_error(`SVT_DATA_UTIL_ARG_TO_STRING(funcname), $sformatf("Notify '%0s' has not been configured. Unable to continue.", `SVT_DATA_UTIL_ARG_TO_STRING(evname))); \
    funcname = 0; \
  end

/**
 * This macro can be used to check whether a notification event has been configured.
 * NOTE: This is kept around for backwards compatibility -- classes should be moving to SVT_STATUS_EVENT_CHECK.
 */
`define SVT_STATUS_NOTIFY_CHECK(funcname,evname) \
  `SVT_STATUS_EVENT_CHECK(funcname,this,evname)

/** Macro used to signal a notification event for the current methodology */
`define SVT_STATUS_TRIGGER_EVENT(evowner,evname) \
  `svt_trigger_event(evowner,evname)

/** Macro used to signal a notification event and corresponding data for the current methodology */
`define SVT_STATUS_TRIGGER_DATA_EVENT(evowner,evname,evdata) \
  `svt_trigger_data_event(evowner,evname,evdata)

/** Macro used to signal a notification event and corresponding data for the current methodology, but with a 'copy' of the original data */
`define SVT_STATUS_TRIGGER_COPY_DATA_EVENT(evowner,evname,evdata) \
  `svt_trigger_copy_data_event(evowner,evname,evdata)

/**
 * Macro used to check the is_on state for a notification event in the current methodology.
 */
`define SVT_STATUS_EVENT_IS_ON(evowner,evname) \
  `svt_event_is_on(evowner,evname)

/** Macro used to wait for a notification event in the current methodology */
`define SVT_STATUS_WAIT_FOR_TRIGGER(evowner,evname) \
  `svt_wait_event_trigger(evowner,evname)

/** Macro used to wait for an 'on' notification event in the current methodology */
`define SVT_STATUS_WAIT_FOR_ON(evowner,evname) \
  `svt_wait_event_on(evowner,evname)

/** Macro used to wait for an 'off' a notification event in the current methodology */
`define SVT_STATUS_WAIT_FOR_OFF(evowner,evname) \
  `svt_wait_event_off(evowner,evname)

/** Macro used to use the event status accessor function for the current methodology to retrieve the status for a notification event */
`define SVT_STATUS_EVENT_STATUS(evowner,evname) \
  `svt_event_status(evowner,evname)

/** Macro used to get the notification event status */
`define SVT_STATUS_GET_EVENT_STATUS(evowner,evname,evstatus) \
  `svt_get_event_status(evowner,evname,evstatus)

/** Macro used to reset a notification event in the current methodology */
`define SVT_STATUS_RESET_EVENT(evowner,evname) \
  `svt_reset_event(evowner,evname)

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gL/yEWKvwzE0Ub/AAwgkFuZ1Un+KI6HSMeJha1S4TgQFLOrD7f9AfIaeL67Uayv1
gmj+4SQW0mils1NE/rcgHBW6NZXdW6KEb264DtzI66UnUa1wJI8he4AyOmrqrIHY
rn3YAaCQ8LAtNWdoh2uSQtbIkSW3vLjPwjHwHKujlPo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 799       )
m4HFAUm10+4+LkKFjXjaC1Z+KlqTvH+aBYAcEe9p9Pg9t42X98wi909ElsZDletb
wzouHBonOUX3ovOjysjwLU+YLKALhg0CXYW1IKOxgwpNemXuEKR68S6n193Z8Itw
tcpt5W/J3gvdf0/TfMnAnucCmxYDx172l2Baw2Z6hCTrx2/ciTWcqKhHQBW0ycZ7
A9LwE6veGiHWnFXgWDfO3hXs0iLn1EakzJ1PoF/sszz68Uvt9Awd3N8GPxPD1yK7
SrgbqyF1j1ntcqgX+frQoiLqhm8hZy7ZO6hwTQfWhBnppNonpblfdS8QRdTBrvdl
p7RgRED+4xYOv/Bdb01JFQmAXKlFJLmMRbGfbCnA/zmM47JxfDJB5uXf0h1d5Wgb
ycrfD5w/ZIDY93tZJftKo5ei0mu9iEtpxKej3XZ0rUdUqVt//ybE1VkI+7gFN8S1
T/CSaOXNd6WMunchQEmYD5nyESI25QDSJRSoHMoCLD6VqvrKc2akR0FKX6W0lDbf
YcUu2/+LoxD1Irx2xKvNZzJpNY5s71IFQm1zJhuWWmaCxp8GeAynbfuV0K1nSODr
latGl4K67/G7K5x0H3o9SsyGUAXpStAll2EW4mO2DHGNF+Bgo+kbhBUtbJxQet8y
jpnIjsM878dLpMtg+l2PjPATYqgvg35rAPJfIhawrGGb5/Yk7q3k+5e4IuHd5gSV
lMZ5qKxETO9tQRvnVN7xYd0q+VlQDzrt5YzAxD+Y/XfxSiPfOP+TK02dVLdZQ1JB
B3cYJNdiOC7YG2kBSil05AWhYxz6BIfrsF3erZEppxjUREa3F6d82UlIVzxtrTjc
rJxN0engC6KHHpNvQpAZcvW/fn8KpSzklWKS/ILm5SPff0GJX6LolQJGDSwukurw
OrXWmLkkN5s+pVUevB9/6PlGsuqRrVvGc5WJJlW2KhNiraGXtynld5zR/oRWVKVQ
qhdG+BTDelzNedRw1avp+7TW9SdBSE19sc5bGZe4ugdsChW+lpAgBKAk1/PyidSd
5zuxOJp2y7/nvyxaVMpAAFzBRYrV6WrN4xzqMOvve7c=
`pragma protect end_protected

// =============================================================================
/**
 * Base class for all SVT model status data descriptor objects. As functionality
 * commonly needed for status of SVT models is defined, it will be implemented
 * (or at least prototyped) in this class.
 */
class svt_status extends `SVT_DATA_TYPE;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Used to report the Instance Name of a transactor to this
   * status object is for. The value is set by the transactor to match the 
   * Instance Name given the transactor by the transactor configuration object.
   * 
   */
  string inst = `SVT_UNSET_INST_NAME;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_status)
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_status class, in addition
   * to replacing the built-in vmm_notify with an extended svt_notify which
   * includes the same base features.
   *
   * @param log An vmm_log object reference used to replace the default internal
   * logger. The class extension that calls super.new() should pass a reference
   * to its own <i>static</i> log instance.
   * @param suite_name A String that identifies the product suite to which the
   * status object belongs.
   */
  extern function new(vmm_log log = null, string suite_name = "");
`else
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_status class, passing the
   * appropriate argument values to the <b>svt_sequence_item_base</b> parent class.
   *
   * @param name Intance name for this object
   * 
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
   */
  extern function new(string name = "svt_status_inst", string suite_name = "");
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_status)
  `svt_data_member_end(svt_status)

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Helper method to get a handle to the notify data member, cast to an object
   * of type svt_notify.
   */
  extern virtual function svt_notify get_notify();
`endif

  // ****************************************************************************
  // UVM/OVM/VMM Methods
  // ****************************************************************************

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BWlfwZLm2aceYL5sUiDRd/JrAE5Qd3NF8oG1s/xv/jkMChA1GeLEDxdcv3aJn4R/
DJ9WSgEZF7A1389qKNI81JCYlvJg9DvtqE2aYyiul8zfJtGJUGVgoq0hVrLsr/tg
GYxnvuK7/63+cvpW92jkJBQSVA+q/kg1GKdf6D8mV2g=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6319      )
K6PDS/9RNIU5VfYiDVSd5iV9Cbw3wz33sBtY2/qPOxXIq2YMtTmZnKhrZAhAj2Hp
neX3IjQDn6+GdddALNFLQfWew9OA6wgat2Fcz8817h4ooic0rBn/dT6gxTkIyeAx
C2PEWv1DDHcSWL4l1A4JqkK4x/ZmYqi3e+dR9ME3GEaIkLm1GTTaIZcagv3LaWye
oTH6VA3HJs0XcAwutMCwGPhlqQQlU8ZqJV5JH3zn8WHXuTWOOYyPaNLsswnsP/Bq
ndpWehYj66ntXLX/7M4KMmQ1IjmyxOvcAz0BZ7KgSuePSXTusBmyFs91/l0k4KjO
rODc+W6jPcdgqzjG44nz5CA7KSl9cyZU2qzqQ9DqMoPRC9UFacVbVyRBv80HBwWS
khPreYqHY8nnfT/AuJJlUA6xLl+hlHtlC0ZTOi15QAnLCgnljrPIKRCsgp/VD0Q+
AuEBoQK64Q6nhN/uvcBUAaWsoXZtL5zsjtf92q9HD+FagHXerGw2Y1iXoPqhcoCC
f7zpogrjB4beUxnvLUp9iRTvS7ppjbBlZxM+nadEchAtDNg8LkgpH7Dv9w+zwcgY
8rxJ5ZF2KoHksTpsiczP3Gz/cKXvXD7MVcPeI1Ashmi3BRPv5Nme3l8NbNE/cbMC
Z0+9RJIX5pgleKHxAaI0imNTPOT8jPA3VXMqkMspoiccZNV4jQ1m+MJuX4iISVWa
Qd4IjhgYaCqiFOcR2Tq2/va+lIXebd6i2anXjCVMnl+SAas4SzWDOQ4h9NOvKqo3
WGkdadlxO473fQ0sB65RY/jrZXCH47eSSYKejf5df0K9iX2uGjpS8IrIR3XqHYo4
OLMdapMfRXe4r3shlDYRwDT9N5rCEBZtbbcstR9W713Ww39GUbQjR88U/kPts59+
Kzleq3ma8DZPy52ZtoRlOWe5xo5zKyOQ7iwtTaZmaSsl0eJmArWm/7AxQX3gLHp7
Hg+2fk/OyDcc0hjN1M8OcIIedrS9GhBZd3XBUMxmyZwbFrUf4oc+ygNYYGxG9Tsg
uHNURA86jzwhKu71Ons0ut77vgfttx6MuNwgN570ZxEyF+EWW8RKvHikRbiiKC8k
cVAJzpqaKxjufk8BKSIyUboHEkrX4UB42NOAo0NjZ7O3G7GLYm+FNJSX0vdpq8rT
Ur8XJMkBZ59/IuMzZ2K0OvRku39GR6X+dJ1DH6oYOzhH8JLFqcwI2dYsuW/6RNH/
SopsiE8jfsmgkuthlmRA7C2wSBqjSzbztyq7zp1gaw5g6Wm4hvEWMoWxQXGikcT/
ua6hNFYoYHjh1tKOLtnpjwaNNF6LNNgrS3m7owL1FdYOxaoYAtXQIHzEYQOAJpkJ
bYiqnAY6U3XpjOiCWUln2nTq3la30x+ay7JnwYhKlnRz5uGtGbV2ZW6m5zrHpCpY
v6oeCn2JCDZcfkpLvDHwcGQpNOo2F/wChs+MO/Jho5qospCW1fS+kCEmVsSaGpC3
jrxjj9IS4uS6Ouh05t90A1c+iooOn3FSMRbtLDBAhkxx7AsrHvK2X2/NjvEvPLJ+
Hr0YVV30CdWuzcmAjktCY+CG8pkNjOs/zdBynlb4oEYOOl+srZP415GJPO9T6oy9
be11GApSDJAa+Q6fnRY3bvxN0R77fyW3GEvjC4AaF8/7fliWs0qnHOJJB2yGR3P3
DhUHV4b4WFRrjio5FaVRlHMSvixG1t6ErAyYuQ1TiyVzY6Dm4UrL5H/BZ6HbrzQb
1CMy9xy6uzLbpGFyzBz4TQq6KM59OwMIotNNVhTHAUdUeeJEPsKEP/WcpZslEM4o
ksycP4f/DFSag5diLc9Ymyba7gf3DjtaEyKPn/YDPxxSi8bh1E6oYtbl0lUlbi3j
jAoCSjqySwnmlKkeJqwfD7bhulFDlvP7nNm9oJSpuGGDy1BphTu5AEnvtx6f8K/+
AEWrk6cb12ctjvUeItsfQjAvPQKH18j6EbFhPrMlNGz5I2uSUGEspRURYj5bAzwE
lKXBtydBUjNrRAQT/b9Sm9o7it/bZno0BSsS+g66D+RUp9BHgkPDR/fcQveG8bGT
N5W+Rw4bq2eyZdMqoWQozTQ3raWFJfmpShiirEhHUoe83FrTZNzQpj2fP2PLPxAi
0wct6rY9Ff8pA3ggQULnwiGcCvSj5LhyssrAYRcgpUtrv4Iqjb0t8gTpnf3rJmOe
ui/clGjQBhOBphIj7+h3ExpGEtSeidlae33ikObfhbC8S8l84tEyIU04PZPwJpmv
j5lbCVN9/Ks8VyeyqBHOCySy7V/5Q3DQiAnmZYvJF9J5uN4LLI08EoEnZT29l6i7
QrqAtjE0bHuQd5LaelLzm6Wbe81R+BX5ubqrzYeNbiqScB4KeecyGV/D1QwBNrjz
q3PRXwAHjo947PfBiVvVUht+MKuwmQWW33jeCKPNWvOF58xgyCO1aTO6X1rzK+8c
IRVrV+vznb4A6BbCF3T2AbkgfVRDkEQGZ4X/OOAvrOPJP0RXIK+FfMV3eQL4H1yP
UfgoMDLebJhTxse4ujGMr+iiWPD0ANbUm7ggCE7HgqFF5aNl1yWhEV3TLwcDL0+l
8Ww5W5okK3N5opS71AqJMOlMJQDvF4X8sYTX+T8vQjM3I9cZjiC1MRNvTDyCcERE
jrkJXqoJRrdo4XvtETbKiAkDzuL7f5Tjqpzpc1Yzm8yXuazSRc08iyFoX9ern1ol
JqVXwDNK7w4SDdfFI5d8M6W/6IW5B90JYoSjPuk5qsMOXk75TgNexep8gTJWK2AQ
coTsxSSgh/FKFxlTCFDt6JFJArTHFGKOKulX7OEFUFuonGVyqaWLylaiipNGohBJ
t5GZlEwTnwiM5nQMK2SmuQiTLv4bhJVUogo63mvDSDiEeOxYGXddSnId/Hu6dlW5
RO8Q2dF/r88B3vvoY5M2ckOxtAbIE6RL+9qQ48mQvcrZIxomP3Q27apy38HeLyEN
DI0F+1hPLsCPXlak0+9NCbCHEg5ymKeMUouguu6uhOAEa+jaNhPNJ/c5zQOXvGbP
1Kqtv4HPJsoAwE4aj6NoEnPztFcDxo5HWw5TvD3tfSzWNLJtfYu4UBvNtrB6bj3Z
vGEuE/7pwTzaQ4pJtjBBDfnTREx/4C7uRkj8wgiEDHObe3IfgCaHZiR8Tg8EDbzD
IwGf6QUMxgQaFsbSN9gtemRWUgPmC3N3I2Qp5i0kDrxr84sLbihy4HsMOd9u+Wmy
EdKTsKaDKgE8lENkqJfLoLZQ0AVPc8qNLfpxeAbIN9z3+WStECsFf/lFIyYVOcJg
LLg/GtWZw0h5T0raVl0R4UYVWJb09dW00ec21R9Q6IJjO9Yi+3H+KRIK4xMV1msG
LncUTYH8PqJAEegsNgNJOvzYYJ7GJun4WIuTl14WvNfrZb7IlcosMdAgOccF5N3v
OuIM8I4IecprhA1j7ZfcDsREiP5zAxq0DD7yVPV9u37aN9WJ7/owXafKz4WHOz7O
gSx/omkwSQu1/oNfjWQKb7u9s61+xw0oykixi/hgWsW6GKAQTh2Ie78MJCzJHYRy
q9QNfANnkmbIA9DN/U5Dwzi/nyMb4BK4Ktz53ILr+kqEwSdeaGa+ktbFtbImqMAw
MJuXRy/obxWD+5OYdT0JiciI0lBkFqGCCG068WaTnElRNLUsrcg2yju/hiGvRKlY
M7eByoKPpD2JVs2FL+TmRzgnmZ9/ZJNIUFCQVovFgN2mu8TfUHZPQSeoW5xGSPoV
pLD1b11IWxH1u+0wNMqhY0d0fbELisXBkHg5l7WfzsNB69JAsxMGArgYVScDDx3U
7Vt9atGE+cL3uG0N1M551Lk4LqGJXOdVW1Bxtq00/EbQq6vsP1/3FPkujYn0vieJ
6J6iTitHvZgQQ5bIuz+zRiEsgeDtyraQqz+x3Q0JTGDu7wYYuLkhgwm25ArFuSZy
dpoDiOR0yX1CmiyL6tyvS1eWjpYswn2WUmcEdAg/6Ea9O5PFQlUTGUq/YYqSAZSW
u92/jky9YCAnnUXiHtEte4/GwjEiL6pMv8K1ISpFq/QwrRXIcpQkEHA9YKrHcDDL
IihCHw9td23aS9TYdLxb1HFUzWTkBqHPxIRH8CzrxaeNTLsyUVHnuMtmS4qvCNOx
SPkUBd03UvNSUKeuCmcXgVzMydNlXv7woVaeRmuugWCJI9G7T4ThZk2NFB92sfIe
2MOpl4nt8wnAYGpefgm70HsE82+v05D2nZw3sKFSQUdSAgrb5ztRLxZpE1vfJCDK
x2r+z+JJI3eYLR1aCbEvZ9eP6IhtiphLHQwKKD/NWNu7X+XgRaHWaj3pzfHZ5ZVQ
AtW06880n/T40ElzPZ2zzFu3PgS/iA0Gkj6z8Nb89QZAOknHr9TRfexGMyZNr+ac
KEBoktUesEytT1PCRY3eS2oVzk9hZLfbKjBlcNtf2RxqCFjp0SsUNCMeKJpwBiiQ
vCuxW17qvlxWNjMA+5GgR0ZE78rc75Qzbfl0ird8u4qcXlJG6uenYX/OUWIlA9/Q
bzv0A/Qv629eJ2Bot/kWe8WuAhog6wAoVyQDjE+WrdEvutSP/9Bv2TP4DsEFXS7T
9VDUsBzqz3PlAGJh7EMHGLlMynhLXsU7fOVhAppn7RTFmZMBRLxEe8uHOGoVJHCp
yGS0U3+QMCPWZo7vNPu+wNber6pmx+Z/3Zj/IkXHCd5FUPMl0MVWpLRpESWOgj0j
Ae8h9u04hT7iFu5aYkSvdyi0quhedDm4Xf/TZ45DP7sYJNpQMNhe934izbQ3XQhX
wcrwUPEZ8qnQcAvgBq+mGY9kFb7t+VxJwhi3fCjeGkFo9NAbPNKfk48TYVSx/Nvk
4JnckFCeaLbLHUKwfW4isb2MWpYKmkGSSBsh82jdky8PGne7PB14/YU0V5Xm8RRh
smgOkF1z6bfPLBGuZjX4hzPeBcAu1K5MzKaYrhyXvG+R+BZTVleu8dw8wyi1eVOz
j4JVZ+66PUm9EKtB3TfAHgt82foTBeVdV36WaGAE8omo0MaTwNWvpmId3mqm5rOg
N8yq86iLEs6n7M4W+DPsdWqohMHIySa8mb909DDUXg+H3YngZSDa+zw504/Q4GOB
oZzrco7pMNJl/3ys596SNRlvzm5UWh00lpuYD0DJZ96C4Iz9+GFA4dtuiHNUcavs
EQ6ufh/0hKOcLA8GoBxC1QgpBVFKBTjw/WfpVIPSPQq0wtb7jCHIkirBovxpfFlA
dyxegJX4BvdCDPmfFmfHUWRARSIxfSH4Z0EkABo2qfukgqgNzZfH2IXHZDBqE2Tg
90bZXXioTBNB6m4fKZWKPqvUhL5qLu16aEAd4PtIgXuLOCWvyisL3zLH/1HlpWsQ
MpF4XJaR3GvXT5yEaoNjdjfeyz5bt/8c48hwW9wwNcuI5R78mjWnY7kOsXiF5Tar
8PeeYriBnPodYE55C5t1/J6wEyL7HqXI6GmQpemieCPPXuCQS+70k7Gq0xXKlPKh
p7C8/35wVjZDuQsXnsWrBRvvxR23Mz42C86W/CYrXMY7KEGPvPweM74yXX3T4pjA
8NhnC8chmYUVgI9Ph/1bBk1APOWr5qJzm1qUA7HV3voQYrogupx7LwY1fu8MFCsF
fgkTlt2NHWlKaRRF+timzOv/ZrHRmjiXb2fsZv+233e28670EzTfUAgQYTOJx6pl
0fgxOLYCvTGIBp7mGoNNkbzdpUUIyNXJy4ZXXPNZcgyI4AIPa8spk7UXNplpaZ1u
Z3ob54NNO2D73Vy8ox5FZNqqsGjRM0uMwaDoA6OSc8MRfmAIFTF+qMLmfTSFXy6O
yXbJsqlIg8d9Mh2RgszeL0EMjzAsdj04KJbhRzTxw/Hh6lBTrHYQjxEuuZ5JrB/6
3Uh3gVgcNILwqCuinH3YsrMnpe/ZSML7cqtAjFAD8kqiYMqQbeqcHDgocZEyVZ0z
lTkUVu03xZFdvKV33EOlBUQreQDqH+r6HzksKS7rCP3+alCoVnMMTiET2Q+SnCtQ
Aq9i/8jmpNyXJm8eNQ9uZBfQwzi5lGgAm6PuVbgGXyFJkVRbqMgvmfOLlcYDjw+f
g8eumXrMGSFpcQgZo5nXkTtG5HrgIG9jMDchzJaXtFrhBrWS/Zdm9or8phQfkGZg
70Yh7wO7Aj6SqWWtMyFCcLY7gzhMQ2KGDWWYlQBWCpAeNGWz1F9Vh7HmP1+rLX48
UKHAdjFofhUjlQ1/Zv99OGX0IGkxELHlgjC5CydHg3AwU/MyDb9/KXUwb0/3LeoY
hojLoNRXf5m+D1H5UPUziIeSEiUNASK/jLysb5WlwpJ6vYOo4Y6NiDckzIFHhz4J
LwjB3ADfl52ls9vbFQ6Wy8gs2bgFg9QeV7laoTK6hSJbO2DsuYR3dIkmfz5Cy240
3oAKnOUCPizpgLyKWmhQqzev4WM5tUJ8n8Nr+DOfyENs4V2TuJTrkox8AJtUYZyi
bdDDYDIylHe8/hQvnmhgbkNLb/pNos29HLWM4PHIQUC6RyzYMFOTYo4go9pTHQvN
+Au3sD/Qs/rj7DUpyrZ8LH7eJp6CRpJPTUcYGCmkHPxyBuW9l8yauyCx5r8oFc6F
ZCnOJGCp6aim2NuubaCok/FpGLrxZhUQd5LC9uRDizvRHvtsRvN4xXUcicoyJVXy
TgHfXwZ4XG86fbsIAaHQo3gPvQu0tthrm1eDBv9kP823rYGWku1neCB0acH4ACrj
V2tIVZW4l4/N8xnsF9ZkSltLhZqr31H39d6ak2IRtfq2ED2QKPEJL4Q2CBjnDU0u
zllzD9Cv9oY0xIAJmITAQwj93S1TMojI1uQFAykGXk5y/ZLB4Q7JQGE8XHLKH3D+
YbdpIjxoG7gmCmdDaj5eukZq3HO2+INtpHwZJeMVlrjFJdzMaBFhy0OsqUXJg5Ql
cti+cYaYf7dX9/YCzTZa/wAga8tQGZFIlMjhmBuc0UFEN+TBbnQoO0S+Qvr99z4w
Kwfyv8hcPbaCaMh4XpXFlx61tQDgJh4+vK1lW9PMoTXLREOihVvdWCUkEB0C5sc/
naCKFsX5UCzkW07EvyMDnGy+ezPK72Z+jHMDUTK2xbKzz5QiM4CbV3bJ7z/Y1SPG
V0VU7EvNBaCKCyEalKjxjqoj4b8FPoCaN5FNvvfZCsLWonl99pPb5Lwxej1Pv800
mmYwIrHeT3XLZ6xJNns6z1s/zQbyW9uBm4ZriAnKZsvF90TG48ATrm1XDGm3z7TQ
xhtE3YJivtzm6jd0jBH3SHZqa2b/7hCIO+djrmK77MTf+FLwYO+iDQodvbng+n67
VPFmrFxAJYm8Zepg9ZRUZns9d4p4JD7kCCBhrGHOEPYoVAyEfWj0Xn4GVYkXcTgx
vkn2TS5Q17MHIp8HZLp86HgU2Vf5GJYUkh5b/ywPAtN2DM07G5m+E8m1lvtMq8bC
ArJEuAfYsprayWUllgXLkQ==
`pragma protect end_protected

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ULZDZUoLVN4ghrJKPHT6prh2hGPJZbIp+2qCrKT9gED2BTxkSU6sCTf/oD7y4GU7
WlByngMsx3kfsxTaeSZRudbT2ISCycFII4H2Nf9VQycXunhVkXim4Y6zjiA/kVI5
Sj86wF6cAJggXQAsH7f9UhzwUyvjVEhM+LJfc6JDEqM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14276     )
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
`pragma protect end_protected

`endif // GUARD_SVT_STATUS_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NuK5fHcpECFca/agipKAYdSd7t93e4xgNo3rj8xlC03CaIbv9Sm/1EEx7vvgd/34
qhzi7gEnGF5WqebOEf/ChlQWFwV3I6rXMH+RMbsndrLE+yxzt3UPmnNbgNxxGGEF
RhR8C6YD4D71TdaE0BH1yAaVEmSfVPgxPtaFcjyde2I=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14359     )
cRcDd1PeSWcj3DOkLWudyOJgJ0DBTuBhz3ufIU+D8oWgumWElQ3r4pZ0zQlAT1mj
N9PDjzjn1AvSUCe5lshKSvT38ADfWpHLZUW3A3LQWIEyusD5YT3/3lxOZHn9d3g8
`pragma protect end_protected
