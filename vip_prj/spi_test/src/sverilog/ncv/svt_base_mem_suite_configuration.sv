//=======================================================================
// COPYRIGHT (C) 2015-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_BASE_MEM_SUITE_CONFIGURATION_SV
`define GUARD_SVT_BASE_MEM_SUITE_CONFIGURATION_SV

// =============================================================================
/**
 * This memory configuration class encapsulates the base configuration 
 * information required by memory VIPs. This class includes the common 
 * attributes required by top level configuration class of all memory VIPs 
 * (both DRAM & FLASH). </br>
 * 
 * For DRAM based memory VIPs class #svt_mem_suite_configuration is available 
 * which is extended from this class and can be used as base class by VIP suite
 * configuration class. </br>
 * 
 * For FLASH based memory VIPs this class can be used as base class by VIP suite 
 * configuration class. </br>
 * 
 * The current version of this class includes : </br>
 * - configurations required to add catalog support
 * - configurations required for xml generation 
 * .
 */
class svt_base_mem_suite_configuration extends svt_mem_configuration;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * This property reflects the memory class which is a property of the catalog
   * infrastructure.
   */
  string catalog_class = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * This property reflects the memory package which is a property of the catalog
   * infrastructure.
   */
  string catalog_package = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * This property reflects the memory vendor which is a property of the catalog
   * infrastructure.
   */
  string catalog_vendor = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * This property reflects the memory part number which is a property of the catalog
   * infrastructure.
   */
  string catalog_part_number = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * Indicates whether XML generation is included for memory transactions. The resulting
   * file can be loaded in Protocol Analyzer to obtain a graphical presenation of the
   * transactions on the bus. Set the value to 1 to enable the transaction XML generation.
   * Set the value to 0 to disable the transaction XML generation.
   * 
   * @verification_attr
   */
  bit enable_xact_xml_gen = 0;

  /**
   * Indicates whether XML generation is included for state transitions. The resulting
   * file can be loaded in Protocol Analyzer to obtain a graphical presenation of the
   * component FSM activity. Set the value to 1 to enable the FSM XML generation.
   * Set the value to 0 to disable the FSM XML generation.
   * 
   * @verification_attr
   */
  bit enable_fsm_xml_gen = 0;

  /**
   * Indicates whether the configuration information is included in the generated XML.
   * The resulting file can be loaded in Protocol Analyzer to view the configuration
   * contents along with any other recorded information. Set the value to 1 to enable
   * the configuration XML generation. Set the value to 0 to disable the configuration
   * XML generation.
   * 
   * @verification_attr
   */
  bit enable_cfg_xml_gen = 0;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_base_mem_suite_configuration)
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
  extern function new(string name = "svt_base_mem_suite_configuration", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef __SVDOC__
  `svt_data_member_begin(svt_base_mem_suite_configuration)
  `svt_data_member_end(svt_base_mem_suite_configuration)
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

  /** Constructs the sub-configuration classes. */
  extern virtual function void create_sub_configurations();

  // ---------------------------------------------------------------------------
endclass:svt_base_mem_suite_configuration


//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ecJSowA0iDwWN5bcoz870jElmBnhUIiUF19QSJtHY6glnSgQn4rbqbKvDh1bQLvo
jIcOYxwnJmMgyZaS+6yUFchAIHWgVQgfEW9HEAABJq4soK4cL7Y2wiTFFZGPxFRq
z86sAh2s96NuhYUHQd5KFgOZjKXWnVnn+QELQyvNqr6mMtl5nAjHBg==
//pragma protect end_key_block
//pragma protect digest_block
V05GT6cfosPaWAt68yKMzUSu6V8=
//pragma protect end_digest_block
//pragma protect data_block
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
SETpejhi1gWtOlKWXp/KCw==
//pragma protect end_data_block
//pragma protect digest_block
BUizfY4bl4yB9FXbf6du9n5DK9Q=
//pragma protect end_digest_block
//pragma protect end_protected
   

`endif //  `ifndef GUARD_SVT_BASE_MEM_SUITE_CONFIGURATION_SV
