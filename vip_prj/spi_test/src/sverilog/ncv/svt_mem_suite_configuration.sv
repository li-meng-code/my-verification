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

`ifndef GUARD_SVT_MEM_SUITE_CONFIGURATION_SV
`define GUARD_SVT_MEM_SUITE_CONFIGURATION_SV

// =============================================================================
/**
 * This memory configuration class encapsulates the configuration information for
 * a single memory core instance.
 */
class svt_mem_suite_configuration#(type TC=svt_configuration,
                                   type MRC=svt_configuration) extends svt_base_mem_suite_configuration;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** Randomizable variables - Static. */
  // ---------------------------------------------------------------------------

  /** Timing configuration class */
  rand TC timing_cfg;

  /** Mode Register configuration class */
  rand MRC mode_register_cfg;

  /** Width of the bank select portion of the logical address */
  rand int unsigned bank_addr_width;

  /** Width of the row select portion of the logical address */
  rand int unsigned row_addr_width;

  /** Width of the column select portion of the logical address */
  rand int unsigned column_addr_width;

  /** Width of the chip select portion of the logical address */
  rand int unsigned chip_select_addr_width;

  /** Width of the data mask */
  rand int unsigned data_mask_width;

  /** Width of the data strobe */
  rand int unsigned data_strobe_width;

  /** Width of the command address */
  rand int unsigned cmd_addr_width;

  /** Prefetch length */
  rand int unsigned prefetch_length;

  /** Number of data bursts supported */
  rand int unsigned num_data_bursts;

  // ****************************************************************************
  // Constraints
  // ****************************************************************************

  /** Valid ranges constraints keep the values with usable values. */
  constraint mem_suite_configuration_valid_ranges {
    bank_addr_width        <= `SVT_MEM_MAX_ADDR_WIDTH;
    row_addr_width         <= `SVT_MEM_MAX_ADDR_WIDTH;
    column_addr_width      <= `SVT_MEM_MAX_ADDR_WIDTH;
    chip_select_addr_width <= `SVT_MEM_MAX_ADDR_WIDTH;

    bank_addr_width + row_addr_width + column_addr_width + chip_select_addr_width <= addr_width;

    data_mask_width <= `SVT_MEM_MAX_DATA_WIDTH;
    data_strobe_width <= `SVT_MEM_MAX_DATA_WIDTH;
  }

  /** Makes sure that the data_mask_width is greater than 0. */
  constraint reasonable_data_mask_width {
    data_mask_width > 0;
  }

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_mem_suite_configuration#(TC, MRC))
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(vmm_log log = null, string suite_name="");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(string name = "svt_mem_suite_configuration", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef __SVDOC__
  `svt_data_param_member_begin(svt_mem_suite_configuration#(TC, MRC))
    `svt_field_object(timing_cfg,          `SVT_ALL_ON|`SVT_DEEP|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_UVM_NOPACK, `SVT_HOW_DEEP)
    `svt_field_object(mode_register_cfg,   `SVT_ALL_ON|`SVT_DEEP|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_UVM_NOPACK, `SVT_HOW_DEEP)

  `svt_data_member_end(svt_mem_suite_configuration#(TC, MRC))
`endif

  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   */
  extern virtual function int static_rand_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Utility method used to populate sub cfgs and status.
   * 
   * @param to Destination class to be populated based on this operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_sub_obj_copy_create(`SVT_DATA_BASE_TYPE to = null);
`else
  // ---------------------------------------------------------------------------
  /**
   * Utility method used to populate sub cfgs and status.
   *
   * @param rhs Source object to use as the basis for populating the master and slave cfgs.
   */
  extern virtual function void do_sub_obj_copy_create(`SVT_XVM(object) rhs);
`endif

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  //----------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. Both values result
   * in a COMPLETE compare.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`else // !`ifdef SVT_VMM_TECHNOLOGY
   // ---------------------------------------------------------------------------
   /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);

`endif //  `ifdef SVT_VMM_TECHNOLOGY

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. Only supports
   * COMPLETE pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

`endif //  `ifdef SVT_VMM_TECHNOLOGY
   
  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: This method allocates a pattern containing svt_pattern_data
   * instances for all of the primitive data fields in the object. The
   * svt_pattern_data::name is set to the corresponding field name, the
   * svt_pattern_data::value is set to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  /** Constructs the timing_cfg and mode_register_cfg sub-configuration classes. */
  extern virtual function void create_sub_configurations();

  // ---------------------------------------------------------------------------
  /** Constructs the timing and mode register sub-configuration classes */
  extern function void pre_randomize();

  // ---------------------------------------------------------------------------
endclass:svt_mem_suite_configuration


//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
xSbQTJhFkjGEWCrk3Uq9LUxjjuGFO2numqN/XaxrNmwFfJvzBFiYmmIpin6nx7GN
V+GNiLaVlTNYuh/cqOTLpwY6hmmIW3pzjq40cqLKr8NRbjhGdTS6KsUrvy+X4xA1
pX0uOhz19kzMxZTMXmV+Q/MlV+m+E8PcfQ0tRslsYhffMaW5HpSTfg==
//pragma protect end_key_block
//pragma protect digest_block
LBuk31RoKTg9vdeZDAkZkQMO9mU=
//pragma protect end_digest_block
//pragma protect data_block
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
VrFq6Q2ydyzZUTFd4u33Jw==
//pragma protect end_data_block
//pragma protect digest_block
eiYcHTcuQJF7NbcHARThdzN6VkQ=
//pragma protect end_digest_block
//pragma protect end_protected
   

`endif //  `ifndef GUARD_SVT_MEM_SUITE_CONFIGURATION_SV
