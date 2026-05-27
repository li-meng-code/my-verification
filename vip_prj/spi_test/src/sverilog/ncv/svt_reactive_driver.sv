//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_REACTIVE_DRIVER_SV
`define GUARD_SVT_REACTIVE_DRIVER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_cmd_defines)

// =============================================================================
/**
 * Base class for all SVT reactive drivers. Because of the reactive nature of the
 * protocol, the direction of requests (REQ) and responses (RSP) is reversed from the
 * usual sequencer/driver flow.
 */
`ifdef SVT_VMM_TECHNOLOGY
virtual class svt_reactive_driver#(type REQ=svt_data,
                                   type RSP=REQ,
                                   type RSLT=RSP) extends svt_xactor;
`else
virtual class svt_reactive_driver#(type REQ=`SVT_XVM(sequence_item),
                                   type RSP=REQ,
                                   type RSLT=RSP) extends svt_driver#(RSP,RSLT);
`endif
   
  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Request channel, transporting REQ-type instances. */
  vmm_channel_typed #(REQ) req_chan;
   
  /** Response channel, transporting RSP-type instances. */
  vmm_channel_typed #(RSP) rsp_chan;
`else
  typedef svt_reactive_driver #(REQ, RSP, RSLT) this_type_reactive_driver;

  /**
   * Blocking get port implementation, transporting REQ-type instances. It is named with
   * the _port suffix to match the seq_item_port inherited from the base class.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_get,REQ,this_type_reactive_driver) req_item_port;
`endif   

/** @cond PRIVATE */
  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
   
  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************
  /**
   * Mailbox used to hand request objects received from the item_req method to
   * the get method implementation.
   */
  local mailbox#(REQ) req_mbox;
/** @endcond */

  // ****************************************************************************
  // MCD logging properties
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new driver instance, passing the appropriate argument
   * values to the uvm_driver parent class.
   *
   * @param name Class name
   * 
   * @param inst Instance name
   *
   * @param cfg Configuration descriptor
   * 
   * @param suite_name Identifies the product suite to which the driver object belongs.
   */
  extern function new(string name, string inst, svt_configuration cfg, string suite_name);

`else

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

`endif

  /** Send a request to the reactive sequencer */
  extern protected function void item_req(REQ req);

`ifndef SVT_VMM_TECHNOLOGY

  /** Impementation of get port of req_item_port. */
  extern task get(output REQ req);

`endif

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
rc0DdYQTycywvGaHi0BRS1VPL0HwZ/eOCL/Mvd/+m6DSC+0W6pHjaQrWPDYsCNf6
kQ+yzsia6sDXwJ4ftwnKj2LZQ6JIHJLIv2sfFMrSCY8QhoRd1jafhDWa/szvOa1W
2TyA2EgJikrOBmJCOPM5iEXXG7GBoR3bfDsW7Jy121d6J9A60Wt3jA==
//pragma protect end_key_block
//pragma protect digest_block
Q6DABlG8UJoUluiNb/gdowV1Gao=
//pragma protect end_digest_block
//pragma protect data_block
Iz7GSp4HeYt41Yw3WeVokhjPkPQqCanQgRWUcQ9C9PVgNxU7jB1cMHnffMhETuVh
cwQYJ8NaZMkqAoIGV8eZkKKqSDRacbinnlXJyDS3Kl7CvUDiMm/obngfHw3PYgSc
jniTiVS9CsTByAAYBXgq1OvqnU9EEneBO8xaf5qChSRMQ8wHlJc32bbwAz4l+Nvh
LTqXEcXWjXNr+G172tXCleksV3Sn0cl0W6UI6RNh2vVjOoyGpbaA5K8cqftbhKT9
miQ+csuu3QwDLW1qlOigS7qf9pzzOrZEcuCqO8MHIsO9wypgWfZziBr9vFrYNlqX
ZO33mxiCyJAsTKCHZjXY0deR63KpafBI809l+HfFL5xZdHJ8dki5FGWGkyVTVr66
0BSHkPXF/Ovig0XYAEV63xLtvIQHw9TjS/sY9seWA33l/kTV/hIobf5rfQ21cw+3
OuKaOoBaTxR47aIwDH4PwxYtk53NvHQZZOE1mHyfCQCXBv+La51ICWEzj6rCAoJ1
UiOZCefWU0JtxGu+4j4jvYqqMPn6wtJ7iyQAogYC1bpB9LY9tO8PCiJGqnz9rmKo
bq6tYkekj67Z1N/pvpvxCSr5S85fegZlW/EKYpUidq14gvt1nUAh8ZBBQlnsJT94
YOWfOVTTduCwBfhP+GMhWh2/EBglo/vjhvInMTJdyQ+kgZYeciKnd5OtyIj/wEMW
wuFYota7vKM4y+a38vpRRq6KlD9Hwz6qhf32MBau/i3NNk4C6bE1p3Vk9okPFXZO
rRclDb9Vhk+liVOcHkqmfffqGA+VH17NOGpA96zjLG+GtpFBK8xw2IrgJvP47yuN
2xNZwPrmKEqsAtADPZMNMbAkaaC6y+Qy2+O9ezaysajKg5Dksr2npOYJW/SBK0o2
/uepUh6bCqw6f4DucxDD2Ioqj3LAT2rCNNBTorGGE7LKnK90MwS3NWlGNRh/nfw5
O+/OkCpIOW2ZuxQDRAisUfVCWSCzLmSNGvENqlqdCj8sYVh8y6ylDXdzHNMmJ7L5
REiVf8Qh3sAMXamLztzxhfsO6j5HWdIVgKxXoDvIuT0PuzfV6VX8Nw70SDCLN1Jv
K6DswzWQYXwPlnc6CDGPkA==
//pragma protect end_data_block
//pragma protect digest_block
TEwXbroFIUDthVAKruyjITxEuAQ=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
9KD1OTcUr/wRXhLVpEFwV3E9Oril2szPG1atrwvUdZ5qE/Uy3oO7XGAqpbgOXhG7
2GpYk9burmtqAen6KEIjdhm6SQftGpsg+HtxwVmhXSWmJBHW8wj+pxxun54qqU+k
S7zCK9EIqkKcHZf3QJ/j2AaRR7t3nWhzTMr01L1MILUBShPZZaSCEg==
//pragma protect end_key_block
//pragma protect digest_block
LKSCwXcyjeC3PEFR0JOJOovmttk=
//pragma protect end_digest_block
//pragma protect data_block
7pp6HWFyz2UEJRllwVp710/YVoke2cpyDX4S2OGaLpic1FxPy/1l4OabhIjlKi6Z
tCBIkWpbrcWfV0V5M2zBXMwX6bGGype9l/csDc2VURe55bbAQEfYTrO0oOkZIYpR
tY/tbiIPsz7ObC73VL0z9YmlPGozOiwfPOVTbmYOx4EY9YJv5YximBZdSBEwZFL7
Ag5hASK55vItprMiPAgakogcVrBPCwdyan0N7grC0tKaeaejsCFRUSaKvaRlPE2X
P1ukYYyBXm6KMBazoB21p0OjugBJ887Iw/zQGx2suhKEPbtthv/Ld2tQoehOZ7eA
r1Ve5mR6ZOCNsSn54wUVcSKvSSzxof8OGABffMIhAgXy2sB26Kx/3QrOp7feGPAQ
YUU5RTAD3vwvREQopsxxBIToRk1IAvv+Ao9+7RqSiYBCPwksNK0Y2d1OxqO/vLIW
DwdVSXEQA1hszScELYYmOMoFvYIQVx5my7ztlNnd0UkclUIxbKb8wNAVicaSzdDj
MXSj9278zsrfEvmpo4zHa95VbT+iA0qSKhQC68cVc/zd4LJnBO/ZQAElxlWto6db
3Ub7OUIt8aFtpxVjln5UvwocGZOHD3QUaP/oPc/ExC6RKpstOreO8dwaYG8MOk9a
eHeEWTQzPPyVfLCnxyDJsUHja2qPsQTa9+tBIsENjozZ84V/SbOYE8FHpzZlGecU
YAdRHDO9wZKVFUTWMfOLF45A6Iz2xKZBo16NKHmR3GD8fc0bTlbaphuVMWud9sA+
1tLgcmMwFAZQ6Ve8zAvyPboGP8F5Aqb7wuCyQyjmu7z/hIdjXnWWA+pvCszgTbou
X8tD9mwfn1JVNLaQnEbno7eiatlB8cusRf6y+TyEpHiaFsIFPDiv9tQ1U1WSafQq
8YLjhrLCQvII1WNCJZfuZ1aF1BAJIKHif7NJRFF1TUYCCFNWBN5S8nagapgAbyQS
63R6RTfVaTuetJxxDnKrH0XNYABpzJkLSHpnyEKDmDZCD+ye8XFfLUJ3NSAEXdvs
YLPxYROSsaK9Rhxysv6tavewZWiQ7hAgJq91geEMGvvlybuRLr3vAxTGua0hkssB
TEAD7fZ2yP6Fyec7XQL6fnpJUn7hYfy5XC3Ej0nWbSOg6p0Ycdjdfg0YTlfIgu4t
y1zfYYDZkfcGGovPJLZVDV3VxAR/7VAl8BVC487mMVSjsppskQKybv5Sr8UK2A0M

//pragma protect end_data_block
//pragma protect digest_block
Jg6YSephI3ytbsxejb2GdrV7S0s=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_REACTIVE_DRIVER_SV
