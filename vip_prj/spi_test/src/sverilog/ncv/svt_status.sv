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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
aI/aEh8pjqm4+JS8xrXQDBcan89QCXV0mnXR+TY6m6/UxLQIUV/JE0Re+zrHwjJI
PznrExJV6yYpCbL4Z/71yRohaoYydp1K3u58mysr0g/stVsy/l5Chs785aVVzJG+
el3x4lqgBgEvkqQQbc8i8HCVlW9n8L8aCzpYF98nmeAHPNQCVbH2CQ==
//pragma protect end_key_block
//pragma protect digest_block
iVYTXA46RjZZU11XobQKF0ICHMY=
//pragma protect end_digest_block
//pragma protect data_block
XBEZY0jtDPFklutb1/oaOvgnkOiOh3VANvX9lFI+6I5ot7n2cPxK5CgDdeOm0Ew1
xpbqfOjQYhx4g7gbnlJ91yr4O9wz+xbOZBMpjK33z1JUysyML2TDZ3V/T7C01moG
k9v1UCr1MOS2OZW6qz3zG+mJY8nU/nl4bsQPF3VfMYo+GoKdDuPBukAy/AglA6GD
cz7ADDDjXHeOSAwZoK/ViYaYsqxCoWNJJvoLjT8rjefNdrOsZ2aGUnjz8Hdlk0rg
NaouE4XzVbh4F2/3MrrJZTzjwp9XWfVSLkog8cEvMpfJB81L8RFy1Nk4+0jQZdrR
IugFR/CLb9tzEMPDOAYLwkazfjxgbOfr/fEdIRl+Ye0Z03SJ+N69NBfAcfqSu4LO
58LtXInRuUduFYF1AJyz7BUrEJe9ocOvsiopF2atcARxawJ/r9CBL2272I6wOW8E
Hq4TdXGLBwwbCXP3LfPiyf6bL2KteLn8bavx7BU1LSKVCFM4519kqPSvHm7sNT3W
z+j8Q4k7UNhGWEJ0u0BbLfn8SJIDBbjw3X1b54uES25ZaN50uuH8aauWTf22cBpz
5yJSmMD2hkgG+cHz4/L/zDYuNw/3qO8r6MD9LPvGhIDlSWqBlWzAH3CU1gTHQ69c
o9hdpSAhwsvTnFmSGj8oN8iiPdjJ+sgolA1V5QQvQGX06y3KvvDM2sGGToPvV4RH
voWTSMeLuGRuLO8g6LS86Ta6WyIUTFKbyUAelIjKxek8jTx2yXUU6dB1CR6RlqoQ
4H6cehEL40chJAxSPcjh3x2TP1l5+5RoDRcOhxHKeD2R9WLAbx8WRxluBuFAckKy
srH/vyfU8t2vE9ynix+NEzuDIaJlZQj03aFD62SvHpCs+zRFS27+HWAMpUVmnyPw
OQ6/554gPQhY+hIAaQW40efZpIqxO2zLHhJPjVk8KK4bYU0arHBDozjdAtPkcRvf
wh7JnZQdOpa/Zjw/4PmedcnUVK0pnZGZKHhMvwuBsnWYAhXL+HcSAx2jqQLjBXnU
UzfL5pw0paSNcFiYiEVFcqB57bUcKZqspqcZUJbFyoofZV4ok6bvHnXccWPC7NIl
NxsYWlVqCn2Z9zpAo/AWLXNKMjONOAayo2K2pL2ZVItBH8tUW2zDoYdB5kz98bJa
mhc7c3Hq7qdsfoCbxUfoT3BK5kUMvj+xKt/FS3Ivq2HSYEb4qU03RJcDwN6ONtiy
Q/l39Fm4QR6w7xq+hhcIlWK+pXFtU4KMFEoOhlCeyJtZ+CTgp/uWb+HOw+a7NX58
XTgFGtcNC03DDbqFz2Mn4g==
//pragma protect end_data_block
//pragma protect digest_block
mO64IOLY3Yb+rp+lqzkI7+yJBA4=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
cbD2IfX2gRBqN3pDsY8bqvkYozUtZQa5KRTWavzd8ESqFuCRjFApMgvIRxAf+Ui/
KbAotldai/JAM1p878SxSw7JR6yx+QsZKEFp+bsZqExHd+NwNTP6vVFSJwJeRKkx
xFhD/EBS5Lk0SJuqRbuCVWdPAbt5QvHvbBDEWeNmdDqJV7GUJmoa2Q==
//pragma protect end_key_block
//pragma protect digest_block
PX9Y74NVPxt+rVZ3oHIYnWTEdHY=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
c0pgMr+cEr2RyJ4Qeaa6s/ALPR0=
//pragma protect end_digest_block
//pragma protect end_protected

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
JhRMp8YGk9XgszXHnMB/4MXStrVSuvwQNzyaRHTkRlO5EuOdczmHe8kyhazq8dZ+
qWAt/z4Sk5EGa8U+RBxjbvFeBBZnHnv5WjsXFIA9ypLvWajJcEAfWhIW3RaZ15p2
d4F3kN/piJWl+weGAe5S4Wc7pwHRHXRSE+Kx8QT8hCqnsk+n/1VZqQ==
//pragma protect end_key_block
//pragma protect digest_block
V2A9AiGWcQ6pmwlnwXlRE0ocQRw=
//pragma protect end_digest_block
//pragma protect data_block
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
FquUeOhRomTUaeUKQKttyA==
//pragma protect end_data_block
//pragma protect digest_block
ooK48Rt+gVm2sM9DNPPdZaRyZ9g=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_STATUS_SV
