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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pa2EBuITiOFaGqQY+9ZRSjmDhavzWdGDf3BNQrLRKYP2E+Nx4KgbpnTUpe9BURhD
4bX7Zgf/KBTWA3XzeaIwMENZ7/kk5xoAFp0DZfL9nIi9hbBHvwiwZsfRlfnm2GB9
jJlAAQTRz8tUkGYi6GI5H9UR49TN2/Bhn0yCPCYd7NM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 208       )
DMOuEU/D1ABe3/+iivmv5KtDLyAK/EnpMKsvIiVQwOJ4ix3LGJx2qCPlkvaOfj/A
+utaEkC5PhvbsoTJF2CYDzuyP1J5w+/dz4RNtrTZR+z8rz0h7ajYC78bRNbN63td
6XnBI8EgTlR/0kwaCIdapwbv6QknnmeQSOQ/0Xr3lwiKuGhZjMMjHvooceJtdQeY
Jp+iB0TmbB9XonmgeyT7oJxe+98D4mcZ1ykAqsnK59n6F6g8S3d0uMMXLT82YBn0
qgm2+lL6YyVfgrDNU1qElbj5uOE0K/R6bdMDV+SjJA0=
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
jJcksJFVvzC43b4q4IcqEVodHwgnUQozykgZHboXvqffWX8HIBYhMs/eKQgCfZby
z3Ox/wEEBrHzVD9TWjVhlLPZnt7y44rTgwMedFaywy0OLFFxZ/V2taSWayaxCeOT
3FVJDfNzHCCK8HD6jY3XzuNSIrZZB5aeN2sfTfDy3HQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4473      )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_SEQUENCER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZdMWVEptBqyBaFxiDdYkuWy3bGPsrastSl6KoGy7r2aCI/QpyxVYoQj1sAXOQfcz
EVVYT6lcnadPrkuCBvtrPJnJJWf/Gwa6LCWDEdLLzGTKEd2YxbLTLZtFlccV9K0Y
2/huF2i2PhPQjK4uVk54RKJA2xWngr0mjD0cWSOMG7U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4556      )
oL5Nmt7OPwqU1Yw9EG24CaLgJ/W+WcAwlGvRWqQAXJ30vY0aU6zzBhHcjB6Qzkev
GLCglQV/iCsYzb0RTUSPSaJuzFWtUL+7ukGd/vVfQ87JIwrb5ieA20wHYAQKVHuY
`pragma protect end_protected
