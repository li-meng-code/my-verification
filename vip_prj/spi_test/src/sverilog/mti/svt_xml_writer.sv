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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Tn+BlcBgSCZ0ljPSqzm7bZjF0oXZiqjSFHNveQCdwNO8Dm/KLvqbSxrdsqMNkVlq
XC8TF9AidrBN+x90mAJZd98Oc7jeA4oWRC0BmXf6gi5aGT7fyMxeSn9ZMQ2CiB3p
vHr2rRouBmd9tH6LMslzpJk78Xn3QLmCLOsQCZE5Lh0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17127     )
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
`pragma protect end_protected

`endif // GUARD_SVT_XML_WRITER_SV




`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hz2YkApCHFi8pfekWWIqNke8j4DMV92UX3cv1nhDMJV94VWLcO3PUm87bdOqUUCF
eLT0JoVbUpDrPA+ZLH7GX08KSyQa3qINdrBt3sOum7YLUTbwBJx8CwIxDq2L7NHj
OaisVAvC82Ogs43QG1XLjMVDq/Tgt3RaKYnNaBiei2c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17210     )
4WFvlzXcxqe5PHN31pupQTGzzyKFVBGXBbXOc+jfyx6rk5GHIy2ETDqS79x7CjZJ
DpG+LLII0clY7TWHn0hnj+el5qt2Dl1u5gdoz/K0pqNRTvB5ZfuMXf0s6TfBQRBB
`pragma protect end_protected
