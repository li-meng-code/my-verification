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

`ifndef GUARD_SVT_XML_WRITER_SV
`define GUARD_SVT_XML_WRITER_SV

`ifndef SVT_VMM_TECHNOLOGY
typedef class svt_non_abstract_report_object;
`endif

/** @cond SV_ONLY */
// =============================================================================
/**
 * Class which can be used to open and manage the interaction with an XML file
 * for use with the Protocol Analyzer.
 */
class svt_xml_writer;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************
  
  typedef enum {
    FSDB = `SVT_WRITER_FORMAT_FSDB,
    FSDB_PERF_ANALYSIS = `SVT_WRITER_FORMAT_FSDB_PERF_ANALYSIS,
    XML  = `SVT_WRITER_FORMAT_XML,
    BOTH = `SVT_WRITER_FORMAT_XML_N_FSDB
  } format_type_enum;

`ifdef SVT_VMM_TECHNOLOGY
  /** Built-in shared log instance that will be used by the XML writer instance. */
  vmm_log log;
`else
  /** Built-in shared reporter instance that will be used by the XML writer instance. */
  `SVT_XVM(report_object) reporter;
`endif

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  /** VIP Writer instance to create FSDB or XML */
  protected svt_vip_writer vip_writer;   

  /** Handle to the file that is being written to. */
  protected int file;

  /** Flag to indicate whether we have executed the 'begin' for the xml. */
  protected bit begin_pa_xml_done = 0;

  /** Flag to indicate whether we have executed the 'begin' for the xml. */
  protected bit end_pa_xml_done = 0;

  /** Additional controls that clients can register and access during generation. */
  protected int client_control[string];

  /** Holds the uid for the current object.
   * Added to support backward compatibility.
   */
  string object_uid;

  /**
   * Register active writer when created, the string value is the 
   * component the writer is associated.
   */
  static svt_xml_writer active_writers[string];

  /**
   * Register active configuration, provides a way to cache cfg handles when the request 
   * to save a cfg occurs before the creation of the writer. The writer creation then accesses 
   * this cache to obtain a handle to the cfg and insure it is written into XML/FSDB.
   */
  static `SVT_DATA_TYPE active_cfgs[string];

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_xml_writer class.
   *
   * @param prot_name The protocol associated with the object.  
   * @param inst_name The instance identifier for the object initiating the write.
   * @param version The version for the object, typically the suite version.
   * @param file_ext Optional file extension.  Only required for suites that support
   * PA with multiple sub-protocols.
   * @param suite_name Optional string associated with suite name of the protocol. For
   * suites with multiple sub protocol this value indentifies the suite_name for the
   * protocol. For single suite protocol this field should be empty.
   * For example in case of ddr family of protocol where the protocol name is ddr3_svt
   * the suite_name field value should carry "ddr_svt" and the prot_name filed value
   * should be ddr3_svt.
   * @param format_type Optional file dump format. 'FSDB' (the default) writes out data
   * in FSDB format, 'FSDB_PERF_ANALYSIS' writes out data in FSDB format optimized for
   * Performance Analyzer, 'XML' writes out data in XML format, 'BOTH' writes out data
   * in both XML and FSDB format.
   */
  extern function new(string prot_name, string inst_name, string version = "", string file_ext = "", string suite_name = "", format_type_enum format_type = FSDB);

  // ****************************************************************************
  // Access Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /** Get a handle to the file that is being written to. */
  extern function int get_file();

  // ---------------------------------------------------------------------------
  /**
   * Registers a client control with the XML writer.
   *
   * @param name The control being registered.
   * @param value The value being registered with the control. Must be >= 0.
   */
  extern function void register_client_control(string name, int value);

  // ---------------------------------------------------------------------------
  /**
   * Retrieves a client control value from the XML writer.
   *
   * @param name The control being retrieved.
   * @return The value associated with the control. If control not found, returns -1.
   */
  extern function int get_client_control(string name);

  // ****************************************************************************
  // Protocol Analyzer Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * This method opens the file and writes out the XML header.
   *
   * @param prot_name The protocol associated with the object.
   * @param inst_name The instance identifier for the object initiating the write.
   * @param version The version for the object, typically the suite version.
   *
   * @return Indicates success (1) or failure (0) of the request.
   */
  extern virtual function bit begin_pa_xml(string prot_name, string inst_name, string version = "");

  // ---------------------------------------------------------------------------
  /**
   * This method writes out the XML trailer and closes the file.
   *
   * @return Indicates success (1) or failure (0) of the request.
   */
  extern virtual function bit end_pa_xml();
 
  // ---------------------------------------------------------------------------
  /**
   * This method writes the XML header to the file.
   *
   * @param block_name The name of the block being opened.
   * @param block_text Text to be inserted as part of the block 'open' statement.
   * @param prefix String to be placed at the beginning of the output.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_block_open(string block_name, string block_text = "", string prefix = "");

  // ---------------------------------------------------------------------------
  /**
   * This method writes the XML trailer to the indicated XML file.
   *
   * @param block_name The name of the block being closed.
   * @param prefix String to be placed at the beginning of the output.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_block_close(string block_name, string prefix = "");

  // ---------------------------------------------------------------------------
  /**
   * This method writes the object begin information to the file.
   *
   * @param object_type The object type.
   * @param object_uid The unique indentification value required for relationship handling.
   * @param parent_object_uid The parent unique indentification value required for parent child relation.
   * @param channel The channel of object. 
   * @param start_time The start time of the object.
   * @param end_time The end time of the object. Added to support backward compatibility. 
   * @param status The object status.
   * @param time_unit The time unit used during the simulation.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_object_begin( string object_type, string object_uid, string parent_object_uid, string channel, realtime start_time, realtime end_time, string status, string time_unit = "" );

  // ---------------------------------------------------------------------------
  /**
   * This method writes the object end information to the file.
   *
   * @param object_uid The unique identification value of the object.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_object_close(string object_uid);

  // ---------------------------------------------------------------------------
  /**
   * This method writes child references to the file.
   *
   * @param object_uid The current object uid.
   * @param child_object_uid Child object uid.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_child_reference(string object_uid, string child_object_uid);

  // ---------------------------------------------------------------------------
  /**
   * This method writes a one field record out to the indicated XML file.
   *
   * @param record_name The name given to the record.
   * @param field_name The name of the one field in the record.
   * @param field_value The value of the one field of the record.
   * @param prefix String to be placed at the beginning of the output.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_one_field_record(string record_name, string field_name, string field_value, string prefix);

  // ---------------------------------------------------------------------------
  /**
   * This method calls the 'svt_vip_writer' API to add the interface path into FSDB.
   *
   * @param if_paths String array contains all the interface path.
   *
   */
  extern function void add_if_paths(string if_paths[]);

  // ---------------------------------------------------------------------------
  /**
   * This method writes a name/value pair to the indicated XML file.
   * This method is added to set the filed name and field value to the
   * current object to be written to XML. This method is used only for backward
   * compatibility where some clients directly called the field value writing.
   * This methods needs to be removed once all the clients moved to new writer methods.
   *
   * @param name Name to be saved for the property.
   * @param value Value to be saved for the property.
   * @param prefix String to be placed at the beginning of the output.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_name_value(string name, string value, string prefix = "");

  // ---------------------------------------------------------------------------
  /**
   * This method writes field name/value pair to XML/FSDB, the value will always be in bit vector
   * converted to right data type and written out to XML/FSDB accordingly.
   *
   * @param object_uid The unique identification of the object.
   * @param name The name of the field to be written out.
   * @param value The value to be written out.
   * @param expected_value The expected value of the field
   * @param typ The data type of the field value
   * @param is_expected The bit indicates expected value is present or not
   * @param bit_width Width of the field, in bits. Only applicable to fields with
   *        typ svt_pattern_data::BITVEC. 0 indicates "not set".
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_field_name_value(string object_uid, string name, bit [1023:0] value, bit [1023:0] expected_value, input svt_pattern_data::type_enum typ, bit is_expected=0, int unsigned bit_width = 0);

  // ---------------------------------------------------------------------------
  /**
   * This method writes field name and an a string representation of associated value to the indicated XML/FSDB file.
   *
   * @param object_uid Unique id of the object for which the name value to be written.
   * @param name Name of the filed.
   * @param arr_val The filed value.
   * @param arr_exp_val The expected value of the field.
   * @param is_expected The bit indicates expected value present or not.
   * @param prefix The prefix to be written in the begining
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_field_name_string_value(string object_uid, string name, string arr_val, string arr_exp_val, bit is_expected=0, string prefix);

  // --------------------------------------------------------------------------------
  /**
   * This method is added to retrieve the uid from the PA XML header string.
   * This should be used only for backward compatibility and not to be used by any 
   * new VIPs adding PA support or any update made by the existing VIPs.
   *
   * @param object_block_desc PA XML header block.
   *
   * @return The string which is unique ID of the object.
   */  
  extern local function string get_uid_from_object_block_desc(string object_block_desc);

  // ---------------------------------------------------------------------------
  /**
   * This method writes object begin block to XML file.
   * This method is added only to support backward compatibility for existing
   * VIPs, shouldn't be used by any new VIPs tor existing VIPs updatingPA XML support.
   *
   * @param object_uid Unique id of the object for which the name value to be written.
   * @param object_block_desc String holds the PA object begin XML data.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_object_begin_block(string object_uid, string object_block_desc);

  // ---------------------------------------------------------------------------
  /**
   * This method writes a comment to the indicated XML file.
   * This method is deprecated shouldn't be used in new implementation.
   * Added to support backward compatibiltiy.
   *
   * @param comment Comment to be saved to the file.
   * @param prefix String to be placed at the beginning of the output.
   *
   * @return Indicates success (1) or failure (0) of the write.
   */
  extern virtual function bit write_pa_comment(string comment, string prefix = "");

  // ---------------------------------------------------------------------------
  /**
   * Utility function for getting the #begin_pa_xml_done value.
   *
   * @return Indicates current #begin_pa_xml_done value.
   */
  extern function bit get_begin_pa_xml_done();

  // ---------------------------------------------------------------------------
  /**
   * Utility function for getting the #end_pa_xml_done value.
   *
   * @return Indicates current #end_pa_xml_done value.
   */
  extern function bit get_end_pa_xml_done();

  // ----------------------------------------------------------------------------
  /**
   * This is a wrapper API provided for clients to capture the predecessor object 
   * information inside XML/FSDB.
   *
   * This method calls the 'svt_vip_writer' method to write out the predecessor data 
   * to indicated XML/FSDB. 
   *
   * @param object_uid
   *          The uid of the object whose predecessor object is to be specified.
   * @param predecessor_object_uid
   *          The uid of the predecessor object.
   * @param predecessor_writer
   *          The "svt_xml_writer" instance with which the predecessor object is
   *          associated or null for the current writer.
   * @return The status of the operation; 1 = success, 0 = failure.
   */
  extern virtual function bit set_object_predecessor( string object_uid,
                                                      string predecessor_object_uid, 
                                                      svt_xml_writer predecessor_writer = null );


  // ----------------------------------------------------------------------------
  /** 
   * This is a wrapper API provided for clients to capture the successor object 
   * information inside XML/FSDB.
   *
   * This method calls the 'svt_vip_writer' method to write out the successor data 
   * to indicated XML/FSDB. 
   *
   * @param object_uid
   *          The uid of the object to which a successor object is to be added.
   * @param successor_object_uid
   *          The uid of the successor object.
   * @param successor_writer
   *          The "svt_xml_writer" writer with which the successor object is
   *          associated or null for the current writer.
   * @return The status of the operation; 1 = success, 0 = failure.
   */
  extern virtual function bit add_object_successor( string object_uid,
                                                    string successor_object_uid,
                                                    svt_xml_writer successor_writer = null );

  // ----------------------------------------------------------------------------
  /** 
   * This is a wrapper API provided for clients to capture the set of successor object's
   * information inside XML/FSDB.
   *
   * This method calls the 'svt_vip_writer' method to write out the set of successor data 
   * to indicated XML/FSDB.
   * @param object_uid
   *          The uid of the object to which a successor objects are to be added.
   * @param successor_object_uids
   *          The uids of the successor objects.
   * @param successor_writer
   *          The "svt_xml_writer" writer with which the successor object is
   *          associated or null for the current writer.
   * @return The status of the operation; 1 = success, 0 = failure.
   */
  extern virtual function bit add_object_successors( string object_uid,
                                                     string successor_object_uids[], 
                                                     svt_xml_writer successor_writer = null );

 // ----------------------------------------------------------------------------
  /**
   * This is a wrapper API provided for clients to capture the custom object 
   * relation inside FSDB.
   *
   * This method calls the 'svt_vip_writer' method to write out the identical relation 
   * into indicated FSDB. 
   *
   * @param source_object_uid
   *          The uid of the object whose custom relation object is to be specified.
   * @param target_object_uid
   *          The uid of the custom relation object.
   * @param relation_type
   *          The custom relation type which needs to associated, eg: if the two transactions
   *          are identical then the relation type value should 'identical'.
   * @param target_writer
   *          The "svt_xml_writer" instance with which the identical object is
   *          associated or null for the current writer.
   * @return The status of the operation; 1 = success, 0 = failure.
   */
  extern virtual function bit set_custom_relation( string source_object_uid,
                                                      string target_object_uid,
                                                      string relation_type, 
                                                      svt_xml_writer target_writer = null );

// ----------------------------------------------------------------------------
  /**
   * This is a wrapper API provided for clients to capture the custom object 
   * relation inside FSDB.
   *
   * This method calls the 'svt_vip_writer' method to write out the identical relation 
   * into indicated FSDB. 
   *
   * @param source_object_uid
   *          The uid of the object whose custom relation object is to be specified.
   * @param target_object_uids
   *          Set of uids of the custom relation objects.
   * @param relation_type
   *          The custom relation type which needs to associated, eg: if the two transactions
   *          are identical then the relation type value should 'identical'.
   * @param target_writer
   *          The "svt_xml_writer" instance with which the identical object is
   *          associated or null for the current writer.
   * @return The status of the operation; 1 = success, 0 = failure.
   */
  extern virtual function bit set_custom_relations( string source_object_uid,
                                                       string target_object_uids[],
                                                       string relation_type, 
                                                       svt_xml_writer target_writer = null );


  // ----------------------------------------------------------------------------
  /** 
   * Retrive 'writer' instance for the given full hierarchical name. If the writer not found for
   * given full hierarchical name try if any 'writer' associated for 'parent hierarchical name', 
   * if found retrive writer and register 'parent' writer to given full hierarchical name 
   * to enahance performance for subsequent retrivals.
   *
   * @param inst_name
   *          The full hierarchical name for the required 'writer'.
   * @return The associated writer, if writer not found returns null.
   */
  extern function svt_xml_writer get_active_writer( string inst_name );

  // ----------------------------------------------------------------------------
  /**
   * Method used to get the format type of the writer.
   *
   * @return The format type associated with the writer.
   */ 
  extern function format_type_enum get_format_type();
  
  // ----------------------------------------------------------------------------
  /**
   * Utility function used to add a scope attribute.
   * 
   * @param attr_name The name of the attribute to be added.
   * @param attr_value The value associated with the attribute
   * @param scope_name The name of the stream for which the attribute needs to be added.
   *                    If the stream name is empty then the scope attribute will be added to the 
   *                    'parent' scope. The defalut stream name will be empty.
   * @return The status of the operation; 1 = success, 0 = failure.
   */
  extern function bit add_scope_attribute(string attr_name, string attr_value, string scope_name = "");

  // ----------------------------------------------------------------------------
  /**
   * Utility function used to add a stream attribute.
   * 
   * @param attr_name The name of the attribute to be added.
   * @param attr_value The value associated with the attribute
   * @return The status of the operation; 1 = success, 0 = failure.
   */
  extern function bit add_stream_attribute(string attr_name, string attr_value);

endclass
/** @endcond */

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
FkTvc5BtU7drhstzPYjTL9CWK7xEQ8eGJScISKpEfWwuHVUzD4raN84VnK7gEaxZ
gvsn5tFYNjCzj70hhTTSggvch5j2Hi97ML6luVFAXK2NWz4te/EEBGaOSRZGSgaU
TzcHdZqsf6dlx6ysVAH8Ux1D9qx1kJ33XrwPG46IdwBRDQznDa+5dA==
//pragma protect end_key_block
//pragma protect digest_block
1bUyqeNi9ZLMWlHnRAi4UYdw2+Y=
//pragma protect end_digest_block
//pragma protect data_block
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
U9WHohF9NqX/nFFoJT3D9g==
//pragma protect end_data_block
//pragma protect digest_block
otkKK0lZ0tIO01s7OkqDWPAXc6Y=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_XML_WRITER_SV




