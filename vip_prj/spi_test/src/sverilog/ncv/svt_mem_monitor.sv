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

`ifndef GUARD_SVT_MEM_MONITOR_SV
`define GUARD_SVT_MEM_MONITOR_SV

//typedef class svt_mem_monitor_callback;

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT MEM UVM/OVM monitors.
 */
virtual class svt_mem_monitor#(type REQ=svt_mem_transaction) extends svt_monitor#(REQ);

  //`svt_xvm_register_cb(svt_mem_monitor#(REQ), svt_mem_monitor_callback)

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
/** @cond PRIVATE */
  /** Monitor Configuration */
  local svt_mem_configuration cfg = null;

 /** Monitor Configuration snapshot */
  protected svt_mem_configuration cfg_snapshot = null;

/** @endcond */

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new monitor instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the monitor object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name="svt_mem_monitor");

  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM build phase */
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void build();
`endif

`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  //----------------------------------------------------------------------------
  /**
   * Updates the monitor's configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the monitor
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the monitor's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the monitor. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the monitor. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the monitor into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction : get_static_cfg

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the monitor into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction : get_dynamic_cfg

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
y9FbKzCbXPOhoRwzkOceTHQVDMplEB846/LAAAKBB+4WDeAP9hsTq5COJAhoeJjJ
6NIOKkd1xG8SebnEDnnaDXqUUpubZChk3G4+wc2QYtIkMZ+dWyB0Sa5nEiuHJvRg
KrX0EXVungx2hvHm4+SVGnNbF/7DpWzyUw6qu45HWAq73ja12Vd5Rw==
//pragma protect end_key_block
//pragma protect digest_block
F1KZXcQUDLBh+LR11kO5+ZQmIIU=
//pragma protect end_digest_block
//pragma protect data_block
yJ7p0dWlE/n8SFK/XZtDsEWE3pqSXVQT5uiUVfTMELxz59mlWSMbNK8FPXpWEISg
Ow1TMw67r0Dryv8M0WPRwx1dSmVi2mh0YftgyqIS2ZxcNkN2ubi5owJWfttNA2OD
xTm4Z5aY71ybhishqKx2F3RJGplnCt5OtlfWuXnmBJHSxQtWgLlU5eaiEAKOgqWe
EWKZxy8JmNvZLqOwEOHW7ZZwpPDjiuwp/vhRcllLFu1gxJitTZTV20kLQ+wWOYpp
uFLSVJXuTHpeX9TCRScf1N6aZYjnD5FpTIEmDsl6uI4Npmqn3kgTcxCso7riRfBv
NFv3mKeMR6zpquroVPNTaMI0C7bdnUx9Ov7D54qFCkArgH2e3orWXqzIaES9CetB
3BK8/SYDkZ9+HQQ/87VkZg==
//pragma protect end_data_block
//pragma protect digest_block
0RKToa6FoYZTDhTSP6g5QvRsWLE=
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
ixk2j+RMhrqk81ZbxmgLmRz+q0rJ8evTEuRlWSZIOYYqe+WyLh3p1br8apCMjN7w
Vyx/DU1QmpPT2w8SHrNAM0nOmWFxGO3GdyWxqhtouOT7uQ1aKdaNMxTiUT5TIL6Z
kOVerbZMD/vJMe60yt6kKONARo+/huCUOq/P+s5Bg2i5LRycxREAPQ==
//pragma protect end_key_block
//pragma protect digest_block
ObqoE9Dj+rpyeS60+whd1ieI67k=
//pragma protect end_digest_block
//pragma protect data_block
RZGP4ST4HBgUvgES4TxjvmZg/AtCCvUeGn2eb3pG84RnRz2U6l/agWD38THOj91X
LGV9Acz31qkVwdU2mRksNd9cAHqwDNlObnGeHzaFq69vnqNlmXItCAUcCIZIKKFo
Wb6+lGETIZ0AUqHZsrjGmA/GcLddm11jTmllWoiIPczYb9ywuLugzFh/85vRGZDS
J3OC9zloMPwrHVltXxTfUIoGcOQcCgPUdHRZAE9zmJ/fuXH4sC4s7YtePl0xPuoq
B9dtIx+y5iZCgWWVZ948xXGEUW011Zv5O5UTJvZuyhMmzsxKvoKUlKaBVbvOfoLs
UGTbANLaahFRyWXDcfq4a9K668WQfKZabHby+j5p0iua/BCMeoP6izc31PdI1BOn
891j+JsfPmTgDQB182IDrUf26qGViH++jluV+fM1RxG3jSn73UoPv/91adO6Bc8m
WX78bwUOxT84b0W1LCFVgT2Jz2lXSPKKU99sHSsDTvxXScQ3mWUyFtrU2uV67vF1
GzYfDHMWRtWuVBm9K9ZTidYcHWv1A8t20+Cq/DQxtFC3clRGwhvH6hU8nCo0YCAh
2YreGV84iTv41/SIJKJIwo0oL5xYKcJqJQlfh/v5ZzANxtFLqwceSlRK6RDnYBYc

//pragma protect end_data_block
//pragma protect digest_block
H4CM9COYgvJFdUwAvPxpsucmmjU=
//pragma protect end_digest_block
//pragma protect end_protected
// -----------------------------------------------------------------------------

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Q76SieGEBJQfzL7uDPZ9nCnqe2Yn7pdmUYM4eqUkdjr2ETuBaBfvjf1rHHC17zR3
fztStPeRrV1uJHJUhsCpVx8wh3TYhvcujECuHDnpn6G63fESMedDa/WY0gfj8Emi
2HsOvdLe/W9O4P/tMnITdgzIF6ugaaNFmez9CyBZf4MCihHP8DV79w==
//pragma protect end_key_block
//pragma protect digest_block
M3kG6GzfyQgJJeyN+ZeMdTXZSJw=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
BaGc6K6D/feViGv85vdWVEY4thU=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_MONITOR_SV
