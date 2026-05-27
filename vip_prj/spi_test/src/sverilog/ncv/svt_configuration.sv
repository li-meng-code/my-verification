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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
hWLcEw+fVpQr5vD1mNtC73eWqBv7t2LmEL0Psk9P3JRrVwt05xsxhX3eJ6SdUs/F
PljaTqwUT9B9qlWssCZKHlggGD069S4AlYaC1Myz+oh5QSS82qr/5hfF1xo16QmO
yZJAd4qF3D++lbRr3avcvo+mx8KMmf02M8PrDxHbdqgEUP4NviqPXA==
//pragma protect end_key_block
//pragma protect digest_block
/qvm+wgmHSDIf+FIQqOWBXujD2w=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
eXwTZYM/Jchf05wYwGqFfTMC+jo=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ouy3HuL7v3zJkYhTvn0LRE30pemHNp/zuAXjN1EIH2OL5neq2R5m5refhlQTupUS
e9JmeYuuwx+OfvRGF5wVuHO01KcHQJh70IqLxHk3f7yObUABF3zfWcc7g9yRzgRl
WedeEu5ck8oTolKL87WRnZoyXZiAYsd1eNV1Ngl1c6Ort0+rx3aBzg==
//pragma protect end_key_block
//pragma protect digest_block
BSf4rSIDoOUo+/JMVY3ncoR3oyo=
//pragma protect end_digest_block
//pragma protect data_block
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
+Ty77udiilH26tkVuRynXZcSjdkk7t5g/7r3NHBn6/4uVY5oxKMW6lVUw5t23Cd2
y9Tt0iB2/NWkyTQNI/p17ghS3FbScw1kmhyap+qNXDIRIHYM9WCJ1xFr+QVPdeUp
QST3bXIY5Zo6gpNnaBjPAVcjF1YqJTZYJaGfwA7d/JwFX9A0XY0AJOSALRPAVSKM
RR+bZHvXIF7Vt4lc3cqCUfAMoJ23VkS2jOkzHhC4hcHU1CBnlrf2mRoV9Rr8CYmE
1z/uyNDHGKlGXpolhXNOnSUg6TtEki335kqjnuVc8ZfOaN2lWXNK1cNpGpLTNLi/
o9Jkfn2kdaxJS6tgn1b+raYgoz1uGdQdVOs8jXL+JG9+CiMTDFs7TlCUzUb3i6AP
Djlw/29E0dMuFCle7HFRzbu3oomHfMt0d6T3TB2Xon/3cs1H77NgQnAB4kzt7FVD
njOblqeOxbKIF0Rzhq6vAZi5nTIc7Gjyee5h9/JAxNrFM5rV0tOwkzIqXN/zLtZZ
xvbMfpNTdo3wcsgjvNDZ+K9Y6RSwkMWL07iClFSKtNvEU/gvzNH4DNvrumcjR5vD
2/4G20TZxs3GW+Vt0z7IaSmbI4RaUamx9k16aiHvE42YXUFwtUiKYg4r3NbY5YOy
vPcJnHlFhJrpoSG/WAn+QcDDxJDaTXB7w6PheEAeadbH7xj1k5TN6B/ERpz9yq/9
/JswB0OyKCleZbAqqVs7pKiuezrS+kDDP67HgboEMXGqc5kP8T00CT8DVvrbGfD4
P0G+PurjDMBG8gl21ZM6w2MqeZGBXaUwvuB/hWUXugAPOMWKw6CqOCAuSdOKBoxU
Nb+jta9Oj9NqWjNhCtNFCXc5+yaiKDQF3HyVqsMJwhY1nSXn2NSWaEbxqH0Gqn/a
Akc+ioPbkoff/9UJeDQBGEXrt2zKsErdyp98m8zrHGLeDIDb6PfVIIdxicUKcANL
sIYtY6SDsoccflgvZH6KpZMq4zmQLsW5CLuzAlXozVhbECtpysDMhF96JbPdcKy0
j/m9A/x7YEwDGpv5qrlUMPyWGnOS746TrR5Nbp2ZDYtXJkXmsO20NMBpRghrd+P1
0fKZ8mGPJEEyt6v+/fzBmyXfwaAzFoJFjix7zxbbafec4s27jFcxVkCwBmdgKkEY
2UvAY5pL6jSjc4gg4NvdCN0DtbDo6OKMDmZ8bjix4NBa0Ml8BlZOzXrIUfH4zHlw
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
//pragma protect end_data_block
//pragma protect digest_block
AkQM7BjNAmOdHSwIyD1KFm1hgSg=
//pragma protect end_digest_block
//pragma protect end_protected

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
