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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
izmE+vm4a1fFqPNqIxHiiCUTWUSabrHOGg8jWqalSg/+45h9QVNDjr8sTJ/+E1+a
EhrtgMaHiUFvztMoKwzdwlV8V41M1L9eJuZoxGKwsd5+VcANdRaEG4sIh90qzQBT
/gTtBISW/6F0CfoN5RN2XjHsUwv2TCjxaRVg1oXxHFg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 19140     )
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
`pragma protect end_protected
   

`endif //  `ifndef GUARD_SVT_MEM_SUITE_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Cnq/Aja42zvYWREeHjRzabmQsIzf1qrp8pivYY53Xbnu1bcesVMslve0mH0bV648
sg3agn2shGY6/zU3bIU2H9qJ6THhyu3OdkAQFxxLLOIIhnrxJxKKax/jQyaCzwgJ
Ek/3J0mITikWiDn7Qbu90S66S2/+DdioSDAti6E0zsg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 19223     )
8/ELAZ7HRFWhxUhkVhPY1813qgCa8+I32rV4Adk4KuyGWcb4CsD6DKbVbn/EUpXZ
2FSevLeCgqaW9EcYhEsZwhaUmAae4Z2dJF7S0BSbrBVuWho26Hfb5V6NtS6rq04h
`pragma protect end_protected
