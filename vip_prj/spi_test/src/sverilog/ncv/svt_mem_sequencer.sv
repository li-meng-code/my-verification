//--------------------------------------------------------------------------
// COPYRIGHT (C) 2012-2021 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//--------------------------------------------------------------------------

`ifndef GUARD_SVT_MEM_SEQUENCER_SV
`define GUARD_SVT_MEM_SEQUENCER_SV

typedef class svt_mem_sequence;
typedef class svt_mem_ram_sequence;

typedef class svt_mem_backdoor;

// ============================================================================================
/**
 * This base class will drive the memory sequences in to driver.
 *
 * This object contains handles to memory backdoor and memory configuration, sequences can access
 * backdoor handle to do read/write operations and can access memory configuration from 'cfg' handle.
 */
class svt_mem_sequencer extends svt_reactive_sequencer#(svt_mem_transaction);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * Memory backdoor 
  */
  svt_mem_backdoor backdoor;

  /**
   * Memory configuration
  */  
  svt_mem_configuration cfg = null;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
CgwJSn4j/ZygPdIuvL5mNG01KzqlsAwa28ArIIbNDkJ8oksBfkPoLNUtEae3s5xU
q/7yIEEpstJ9TBqokXF670nmzFsRU1yEpgPeGYVoFJZZJkOB2ZELzeAJEyLVjRph
9On40wXRV1JiGBWsm4SUkAyjV9xUqqBHsujRcICBH+76oqoLAzJ1vQ==
//pragma protect end_key_block
//pragma protect digest_block
l0t7ikgY7VqqMPx/lGnBfdKfzI0=
//pragma protect end_digest_block
//pragma protect data_block
hjw49nxzP5Vw04Gfrn9Yy5Tn6KAw1PuRw31QflRh0ffr7vl6feyzuXm+7AfFBsoN
3wLVHxKJc3bTndywUN882Yj0Z6NofWmmQfLXhf9wsOFwKipebjFj9Tyan3yP8DK3
Kpr1Udnp8Fy+titzJ+NG09nvij5sEaeN9SlU19hKETPA5E0Fn0nrbrLC4YiSwDl6
n66MDx+puQJAWsXEcBkZzX1DAKazGS3O9hFsd8ZioLQYDKZ+N5dKxoTNH0PRExnT
aLZa+8S62Rf5aqoZaPb4xL09WalyYyX1LydWYUjnNethRFA4wLa1Zjpj0QEoALae
4v64L17rDCK1uXP5/vI5OUdhvDHKLzWa7GuXjUIfjnkXOvzeBha4z+Z0b/Igc64J
k/dcxRRzCfei5kjzXIttH9qstC0Vd509v+9ipZ1kY+k3Ga89TMiBsugGbq5+eAqO
ioqgfan4SEkmU11zqysx+pttVYU0ks65joh3M2R91lNdWcCZZDfQCAVhcxmsv8oL

//pragma protect end_data_block
//pragma protect digest_block
8fYT6RytFa23v0G1ujDfBvlf4Xs=
//pragma protect end_digest_block
//pragma protect end_protected

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
  `svt_xvm_component_utils_begin(svt_mem_sequencer)
    `svt_xvm_field_object(cfg, `SVT_XVM_ALL_ON|`SVT_XVM_REFERENCE)
  `svt_xvm_component_utils_end

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this instance.  Used to construct
   * the hierarchy.
   */
  extern function new(string name = "svt_mem_sequencer",
                      `SVT_XVM(component) parent = null,
                      string suite_name = "");

  //----------------------------------------------------------------------------
  /** Build Phase to build and configure sub-components */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void build();
`endif

  //----------------------------------------------------------------------------
  /** Extract Phase to close out the XML file if it is open */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual function void extract_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void extract();
`endif

  // ---------------------------------------------------------------------------
  /** INHERITED METHODS Implemented in this class. */
  // ---------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * Return a reference to a backdoor API for the memory core in this sequencer.
   */
  extern virtual function svt_mem_backdoor get_backdoor();

/** @cond PRIVATE */
  //----------------------------------------------------------------------------
  /**
   * Return a reference to svt_mem_core.
   * 
   * IMPORTANT: This class is intended for internal use and should not be used
   *            by VIP users.
   */
  extern virtual function svt_mem_core m_get_core();
/** @endcond */

/** @cond PRIVATE */
  //----------------------------------------------------------------------------
  /**
   * Sets the svt_mem_core instance.
   *
   * IMPORTANT: This class is intended for internal use and should not be used
   *            by VIP users.
   *
   * @param mem_core Instance of svt_mem_core class
   *
   */
  extern virtual function void m_set_core(svt_mem_core mem_core);
/** @endcond */

  //----------------------------------------------------------------------------
  /**
   * Returns a reference of the sequencer's configuration object.
   * NOTE:
   * This operation is different than the get_cfg() methods for svt_driver and
   * svt_uvm_monitor classes.  This method returns a reference to the configuration
   * rather than a copy.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Reconfigure sequencer's memory instance with the new memory configuration object.
   * @param cfg - configuration object
   */
  extern virtual function void reconfigure(svt_configuration cfg);

endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
I9fknWQKxRZug3S9WHocMSqankUS0OG5XeL85P408kSgsWEQAl+yWhTwj0KO5ksg
2452dQrii+ip4x44lH7FTqWVlImc2SDznZvQslhJJN/99OPqp5lQR6e8H3XNIdJJ
fGv6QihsshkkHohngs2j7N80Pt0wfBH9kAsd9r6NL5YDvr6C4yFhVQ==
//pragma protect end_key_block
//pragma protect digest_block
J6KzCHTnRgX216gKp4pZUjVCLUQ=
//pragma protect end_digest_block
//pragma protect data_block
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
ZzdQlJAMdPxVzR1jn/100A==
//pragma protect end_data_block
//pragma protect digest_block
8O5TqA1XvEvYQpMewBGRtCdvl2Q=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_SEQUENCER_SV

