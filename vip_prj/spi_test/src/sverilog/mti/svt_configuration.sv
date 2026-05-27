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

`ifndef GUARD_SVT_CONFIGURATION_SV
`define GUARD_SVT_CONFIGURATION_SV

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_data_util)

// =============================================================================
/**
 * Base class for all SVT model configuration data descriptor objects. As functionality
 * commonly needed for configuration of SVT models is defined, it will be implemented
 * (or at least prototyped) in this class.
 */
class svt_configuration extends `SVT_DATA_TYPE;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************
`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Used to define the Instance Name of a component to whose constructor this
   * configuration object is passed. Since all SVT VIP components require that a
   * valid configuration object (derived from this class) be passed to their
   * constructor, this value is passed to the call to that constructor's call to
   * <i>super.new()</i> (i.e. as the <b>inst</b> argument to vmm_xactor::new()).<br>
   * Similarly, the <b>stream_id</b> property (which is inherited from vmm_data)
   * of a derived config object is used as the <b>stream_id</b> argument of
   * vmm_xactor::new(), to define the Stream ID of the component being created.
   *
   * <b>Note:</b> After a configuration object (derived from this class) is used to
   * constuct a new SVT component, the values of the <b>inst</b> and <b>stream_id</b>
   * properties must not be changed in the configuration object in use by that component.
   * 
   * @verification_attr
   */
  string inst = `SVT_UNSET_INST_NAME;
`else
  /**
   * Used to in some situations to define the Instance Name of a component
   * prior to its construction. Mainly used in situations where the creating
   * component is creating multiple sub-components where those sub-components
   * do not have obvious names. E.g., an env creating multiple masters could 
   * name them master[0], master[1], etc. But the user may want to name them
   * CPU, CTRLR, etc. Some components therefore use this to support a
   * mechanism for overriding the default names (e.g., master[0], etc.) with
   * more useful testbench provided names (e.g., CPU, etc.).
   * 
   * @verification_attr
   */
  string inst = `SVT_UNSET_INST_NAME;
`endif
  
/** @cond PRIVATE */
  /**
   * Used by all svt_configuration derived 'copy' and 'compare' methods to determine
   * whether contained configuration objects are not copied or compared (NULL), the
   * reference is copied and compared (SHALLOW), or whether the object is copied and
   * compared (DEEP).
   * Since not owned by an individual instance, not copied, compared, etc.,
   * like other svt_transaction properties.
   * 
   * @verification_attr
   */
  static recursive_op_enum contained_cfg_opts = DEEP;
/** @endcond */

/** @cond PRIVATE */
  /**
   * The VIP components provide support for the development of testbenches
   * independent of the availability of the DUT. This is enabled via the
   * 'No DUT' options available on the component. When used, these options
   * result in the random recognition of non-existent input bus traffic. This
   * in turn results in the random completion of transactions initiated by the
   * component, as well as the arrival of random transactions initiated via the
   * bus.
   *
   * The input bus traffic includes randomized values as well as randomized
   * drive and hold delays to demonstrate random legal bus traffic.
   *
   * (Default = 0) When 1, enables the 'No DUT' option to have the component
   * randomly recognize non-existent input bus traffic.
   *
   * This feature can be set directly or via the command line, using the
   * 'no_dut' plusarg (e.g., '+no_dut=1').
   * 
   * @verification_attr
   */
  bit no_dut = 0;

  /**
   * (Default = 100) When the 'No DUT' option is enabled (no_dut == 1), and the
   * component supports transactions arriving via the bus (i.e., as opposed to
   * via an input channel) this number is used to insure that the component
   * limits the number of transactions it auto-generates. If the component
   * can auto-generates multiple types of transactions (e.g., for different data
   * flows), this limit applies to each type of auto-generated transaction.
   *
   * This feature can be set directly or via the command line, using the
   * 'no_dut_xact_limit' plusarg (e.g., '+no_dut_xact_limit=200').
   * 
   * @verification_attr
   */
  int no_dut_xact_limit = 100;
/** @endcond */

  /**
   * (Default = 0) When 1 the model will enable callbacks associated with signal
   * changes (pre_*_drive_cb_exec and post_*_sample_cb_exec).
   *
   * This feature can be set directly or via the command line, using the
   * '+define' plusarg (e.g., '+define+SVT_<model>_ENABLE_SIGNAL_CB').
   * 
   * @verification_attr
   */
  bit enable_signal_callbacks = 0;

  /** 
   * Determines if MERCURY(SLED) dumping is to enabled or not.  <br/>
   * <b>type:</b> Static
   */
  bit enable_sled = 0;

  /** 
   * Determines if runtime trace recording is to be enabled or not. By default the data is dumped at end of simulation into trace file <br/>
   * <b>type:</b> Static
   */
  bit enable_runtime_trace_recording = 0;

/** @cond PRIVATE */
`ifndef SVT_VMM_TECHNOLOGY
  /**
   * Used by all svt_sequencer instances to decide if they should report 'Dropping
   * response...sequence not found' messages for exited sequences. Disabled by default.
   * 
   * @verification_attr
   */
  static bit enable_dropping_response_message = 0;
`endif
/** @endcond */

/** @cond PRIVATE */
  /**
   * Field which reflects whether PA features are to be auto-enabled. This field, along
   * with the #pa_format_type field, is set based on processing the 'svt_enable_pa' plusarg.
   *
   * The initial value is '-1', indicating that the VIP has not checked for the plusarg.
   * Once the check has occurred, the value is set to either 0 (plusarg not found) or
   * 1 (plusarg found).
   *
   * @verification_attr
   */
  static int enable_pa = -1;

  /**
   * Field which reflects the output type to be used when the PA output is auto-enabled.
   *
   * This field, along with the #enable_pa field, is set based on processing the
   * 'svt_enable_pa' plusarg.
   *
   * This field is not initialized resulting in the default being the
   * svt_xml_writer::format_type_enum element which has a value of '0' will be. If the
   * svt_enable_pa plusarg is provided with no argument, this default will be used.
   *
   * The svt_enable_pa plusarg should only be provided with valid svt_xml_writer::format_type_enum
   * values (e.g., '+svt_enable_pa=FSDB'). If an invalid value is provided then the
   * default value is retained.
   * 
   * @verification_attr
   */
  static svt_xml_writer::format_type_enum enable_pa_format_type;

  /**
   * Field which reflects whether coverage features are to be auto-enabled. This field
   * is set based on processing the 'svt_enable_cov' plusarg.
   *
   * The initial value is '-1', indicating that the VIP has not checked for the plusarg.
   * Once the check has occurred, the value is set to either 0 (plusarg not found) or
   * 1 (plusarg found).
   *
   * @verification_attr
   */
  static int enable_cov = -1;
/** @endcond */

  /**
   * Field to store psdisplay_short display/trace-file fields to be removed.
  * User need to input Field Header name in this field.
   * 
   */
  string filter_psdisplay_short[$];

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_configuration)
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_configuration class.
   *
   * @param log An vmm_log object reference used to replace the default internal
   * logger. The class extension that calls super.new() should pass a reference
   * to its own <i>static</i> log instance.
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(vmm_log log=null, string suite_name="");
`else
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_configuration class.
   *
   * @param name Instance name of this object.
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(string name="svt_configuration_inst", string suite_name="");
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_configuration)
  `svt_data_member_end(svt_configuration)

  //----------------------------------------------------------------------------
  /* Method to turn static config param randomization on/off as a block.
   * This method is <b>not implemented</b> in this virtual class.
   */
  extern virtual function int static_rand_mode ( bit on_off );

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the static data members of the object.
   */
  extern virtual function void copy_static_data (`SVT_DATA_BASE_TYPE to );

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_dynamic_data ( `SVT_DATA_BASE_TYPE to );

  // ****************************************************************************
  // UVM/OVM/VMM Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Copies the object into to, allocating if necessay.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);
`else
  // ---------------------------------------------------------------------------
  /** Extend the UVM copy routine to copy via copy_static_data/copy_dynamic_data */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation based on the
   * requested byte_size kind.
   *
   * @param kind This int indicates the type of byte_size being requested.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  // ---------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested.
   */
  extern virtual function int unsigned do_byte_pack(ref logic[7:0] bytes[], input int unsigned offset = 0, input int kind   = -1);
  
  // ---------------------------------------------------------------------------
  /**
   * Unpacks len bytes of the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind   = -1);
`else
  //----------------------------------------------------------------------------
  /**
   * Pack the fields in the configuration base class.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  //----------------------------------------------------------------------------
  /**
   * Unpack the fields in the configuration base class.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

  // ****************************************************************************
  // Command Support Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   * In that case, the <b>prop_val</b> argument is meaningless. The component will then
   * store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val A <i>ref</i> argument used to return the current value of the property,
   * expressed as a 1024 bit quantity. When returning a string value each character
   * requires 8 bits so returned strings must be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The component will then store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * consruction is taken care of automatically by the command interface. If the <b>prop_name</b>
   * argument does not match a property of the class, or it matches a sub-object of the class,
   * or if the <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val The value to assign to the property, expressed as a 1024 bit quantity.
   * When assigning a string value each character requires 8 bits so assigned strings must
   * be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * Provide string values for contained_cfg_opts.
   * 
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort. 
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  // ---------------------------------------------------------------------------
  /**
   * This method allocates the same pattern as allocate_pattern(), minus the
   * elements which include the `SVT_DATA_UTIL_DYNAMIC_KEYWORD keyword.
   *
   * @return An svt_pattern instance containing entries for the data fields which
   * do not include the `SVT_DATA_UTIL_DYNAMIC_KEYWORD keyword.
   */
  extern virtual function svt_pattern allocate_static_pattern();

  // ---------------------------------------------------------------------------
  /**
   * This method allocates the same pattern as allocate_pattern(), minus the
   * elements which do not include the `SVT_DATA_UTIL_DYNAMIC_KEYWORD keyword.
   *
   * @return An svt_pattern instance containing entries for the data fields which
   * include the `SVT_DATA_UTIL_DYNAMIC_KEYWORD keyword.
   */
  extern virtual function svt_pattern allocate_dynamic_pattern();

  // ---------------------------------------------------------------------------
  /**
   * This method scans the sub-object hierarchy looking for sub-configurations.
   * It returns an associative array of the objects, indexed by the paths to the
   * sub-objects.
   * 
   * @param sub_cfgs An svt_configuration associative array with entries for all
   * of the svt_configration sub-objects, indexed by the sub-object field names.
   */
  extern virtual function void find_sub_configurations(ref svt_configuration sub_cfgs[string]);

  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the data fields in the object that are related to debug.
   * 
   * Regular expressions are used to identify debug features that will be enabled.
   * If these expressions identify properties that should not be enabled for debug,
   * or if there are properties that are missed by these expressions then this method
   * can be extended and the pattern can be altered.
   * 
   * @return An svt_pattern instance containing entries for all of the fields
   * related to debug
   */
  extern virtual function svt_pattern allocate_debug_feature_pattern();

  // ---------------------------------------------------------------------------
  /**
   * Parses the configuration object using patterns and enables debug options.
   * 
   * This method should be called by the top level component in extended suites,
   * immediately after the configuration is received for the first time.  It is also
   * called automatically when the reconfigure method is called.
   * 
   * @param inst Instance name of the component that is enabled for debug
   * @param path Optional argument to provide the hierarchical path to this object
   */
  extern function void enable_debug_options(string inst, string path = "");

  // ---------------------------------------------------------------------------
  /**
   * This method sets up the fields indicating whether PA support should be enabled automatically.
   */
  extern virtual function void setup_pa_plusarg();

  // ---------------------------------------------------------------------------
  /**
   * This method sets up the field indicating whether coverage support should be enabled automatically.
   */
  extern virtual function void setup_cov_plusarg();

  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the data fields in the object that are related to PA.
   * 
   * Regular expressions are used to identify PA features that will be enabled.
   * If these expressions identify properties that should not be enabled for PA,
   * or if there are properties that are missed by these expressions then this method
   * can be extended and the pattern can be altered.
   * 
   * @return An svt_pattern instance containing entries for all of the fields
   * related to PA.
   */
  extern virtual function svt_pattern allocate_pa_feature_pattern();

  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the data fields in the object that are related to enabling coverage.
   * 
   * Regular expressions are used to identify coverage which will be enabled.
   * If these expressions identify properties that should not be enabled for coverage,
   * or if there are properties that are missed by these expressions then this method
   * can be extended and the pattern can be altered.
   * 
   * @return An svt_pattern instance containing entries for all of the fields
   * related to enabling coverage.
   */
  extern virtual function svt_pattern allocate_cov_enable_pattern();


  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the data fields in the object that are related to enabling coverage.
   * 
   * Regular expressions are used to identify checks which will be enabled.
   * If these expressions identify properties that should not be enabled for checks,
   * or if there are properties that are missed by these expressions then this method
   * can be extended and the pattern can be altered.
   * 
   * @return An svt_pattern instance containing entries for all of the fields
   * related to enabling coverage.
   */
  extern virtual function svt_pattern allocate_check_enable_pattern();
  
  // ---------------------------------------------------------------------------
  /**
   * Parses the configuration object using patterns and automatically enables PA options
   * if #enable_pa set to '1' based on the svt_enable_pa plusarg.
   * 
   * This method is called automatically when the reconfigure or enable_debug_opts method
   * is called on any of the top level components.
   
   */
  extern function void enable_pa_options(bit enable_debug_opts = 0);

  // ---------------------------------------------------------------------------
  /**
   * Parses the configuration object using patterns and automatically enables coverage
   * if #enable_cov set to '1' based on the svt_enable_cov plusarg.
   * 
   * This method is called automatically when the reconfigure method is called on any of
   * the top level components.
   */
  extern function void enable_cov_options();

  // ---------------------------------------------------------------------------
  /**
   * Parses the configuration object using patterns to see if coverage has been enabled
   * on any of the layers or protocol as a whole.
   * 
   */
  extern function bit get_cov_prop_val();

  // ---------------------------------------------------------------------------
  /**
   * Parses the configuration object using patterns to see if checks has been enabled on
   * any of the layers or protocol as a whole.
   * 
   */
  extern function bit get_check_prop_val();

  // ---------------------------------------------------------------------------
  /**
   * Checks the PA related flags 'enable_xml_gen' and returns '1'
   * if any of the 'enable_.*xml_gen' is set.
   * 
   * Clients can override this function if requeried to be.
   */
  extern virtual function bit is_pa_enabled();

  // -----------------------------------------------------------------------------
  /**
   * Record the configuration information inside FSDB if writer is available, if the writer
   * is not available at this time then register the data, when the writer is created the
   * data can be written out into FSDB.
   *
   * @param inst_name Instance name of the component that is enabled for debug
   */
  extern function void record_cfg_info(string inst_name);

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * This method returns the maximum packer bytes value required by the suite. This is
   * checked against `SVT_XVM_UC(MAX_PACKER_BYTES) when the configuration class is
   * constructed to make sure the provied value is sufficient for the extended suite.
   *
   * The default implementation just returns `SVT_XVM_UC(MAX_PACKER_BYTES) value.
   * Individual suites extend this method to indicate any specific requirements they
   * may have.
   * 
   * Note:
   * This method should only be implemented by suites that require packing/unpacking
   * operations for normal operation, and if the default size defined in the UVM/OVM
   * base class library is not sufficient.  In this situation the VIP developer knows
   * that the user must provide a larger value on the command line through the use of of
   * the `SVT_XVM_UC(MAX_PACKER_BYTES) macro, and so this check should be performed in
   * the constructor of the configuration object.
   * 
   * Not all suites require packing/unpacking operations for normal operation.  If a VIP
   * developer determines that packing/unpacking is not required for normal operation of
   * the VIP then this method should not be implemented (and the check should not be
   * performed).  However, if a larger value for `SVT_XVM_UC(MAX_PACKER_BYTES) is
   * required to complete pack/unpack operations for specific transactions then these
   * operations will fail if the user attempts this.  In this situation the VIP developer
   * should determine what minimum `SVT_XVM_UC(MAX_PACKER_BYTES) is required and should
   * implement the get_packer_max_bytes_required() method in the extended transaction
   * class instead.  This will cause the check to only be performed if the user attempts
   * to pack or unpack the transaction class, and so the user will only need to provide
   * `SVT_XVM_UC(MAX_PACKER_BYTES) value on the command line if they need to perform the
   * pack/unpack operations.
   */
  extern virtual function int get_packer_max_bytes_required();

  // -----------------------------------------------------------------------------
  /**
   * This method checks the packer max bytes value required by the suite. This
   * involves checking the value provided by get_packer_max_bytes_required() against
   * `SVT_XVM_UC(MAX_PACKER_BYTES). It also includes checking `SVT_XVM_UC(MAX_PACKER_BYTES)
   * against the `SVT_XVM(pack_bitstream_t) size to make sure that the define
   * is consistent with the buffer storage which has been allocated.
   * 
   * If the user is using multi-step compilation and has failed to specify
   * `SVT_XVM_UC(PACKER_MAX_BYTES) on the command line then it can lead to a
   * compile time failure about an unrecognized macro. This method isprovided
   * in unencrypted form to simplify the recognition of this situation. This
   * situation can be resolved by adding an appropriate `SVT_XVM_UC(MAX_PACKER_BYTES)
   * value on the appropriate command line.
   */
  extern function void check_packer_max_bytes();
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
d+0rG4Yj72+V23lPE/ShsA9rAAD4jZ/8K/otYSSPG11DOonYM00/V99tAsYBuank
mOtFt6nyz6CfD/y4t4jeBtEDTs3CojIssadJQuMEVCtM+V3AWMugKgO/LMpzEd0g
vuCTG89CV9kZtOToBhEZW4Xn0PYW0xxvYe3QuxzNbzc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1741      )
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
AgYI9M5oCSY7C1MEDlzsPA==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
crUz1PMFdvsR54/JpaIiQHJ2yW1ae2lsPUQanAjX9VOy47JrTGeJj4x4+cLofEFl
TzW9EnVbGHCOXj+ScXl3Nk2taR4/UmkvWFDA8ofh9Mc/tLfP5xP8d+BKnxbtkSRB
O/z1iCoF/TvLIcMNtuqEaXsSAE99RMj6AUzcvBLNbf8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 32088     )
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
aZr9YicD9ESOhBGQH3XTAg==
`pragma protect end_protected

`ifndef SVT_VMM_TECHNOLOGY
//------------------------------------------------------------------------------
/**
 * NOTE: This method is left unprotected in order to expose the PACKER_MAX_BYTES macro.
 *       This ensures that the proper macro name is identified when the macro has
 *       not been specified in a multi-step compile situation.
 */
function void svt_configuration::check_packer_max_bytes();
  if (`SVT_PACKER_MAX_BYTES < get_packer_max_bytes_required())
    `svt_fatal("check_packer_max_bytes", $sformatf("%0s_PACKER_MAX_BYTES set to %0d, but %0d bytes required by the %0s suite. Unable to continue.",
                                `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_DATA_METHODOLOGY_KEYWORD_UC), `SVT_PACKER_MAX_BYTES, get_packer_max_bytes_required(), get_suite_name()));
  else begin
    `SVT_XVM(pack_bitstream_t) bitstream;
    int bitstream_bytes = $bits(bitstream)/`SVT_DATA_UTIL_BITS_PER_BYTE;
    if (bitstream_bytes != `SVT_PACKER_MAX_BYTES)
      `svt_fatal("check_packer_max_bytes", $sformatf("%0s_PACKER_MAX_BYTES set to %0d but %0s_pack_bitstream_t only contains %0d bytes. This indicates the %0s package was not compiled with the same %0s_PACKER_MAX_BYTES setting as the %0s suite. Unable to continue.",
                                  `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_DATA_METHODOLOGY_KEYWORD_UC), `SVT_PACKER_MAX_BYTES,
                                  `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_DATA_METHODOLOGY_KEYWORD), bitstream_bytes,
                                  `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_DATA_METHODOLOGY_KEYWORD_UC),
                                  `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_DATA_METHODOLOGY_KEYWORD_UC), get_suite_name()));
  end
endfunction
`endif

// =============================================================================

`endif // GUARD_SVT_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AHhXsunu6KKUpMK64GjsBUp57NNs8OcVjXQ8Kf5raF/AjGsUpho/urNgcwR9dgL2
re+lT4wBAc2Wvo0YiREiOAwqUbjneiOI3EmALBMFyWX9iEqK4qAxt9O/odChxc77
5RcrjIP+FmzsKqtInKm+83k2BkMNmwAKRhnoSCy1C44=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 32171     )
PkaXKI+hsd8aGvc1UuyntoxHKMYnGJg4rT20M0M3M3fhk5c4STUsbxYbUjLBVJ9M
olW0oj0vNs3FWVQumoOBqUt+9PjZ4Q34WAwVmMuPrkNEHleadgkAHDaWCl/umjj2
`pragma protect end_protected
