//=======================================================================
// COPYRIGHT (C) 2021 SYNOPSYS INC.
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

`ifndef GUARD_SVT_TRAFFIC_PROFILE_TRANSACTION_SV
`define GUARD_SVT_TRAFFIC_PROFILE_TRANSACTION_SV
`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

/**
  * Generic class that models a traffic profile. Only parameters which are
  * generic across all protocols are encapsulated here. Protocol specific
  * parameters must be specified in an extended class. 
  */
class svt_traffic_profile_transaction extends `SVT_TRANSACTION_TYPE;

  typedef enum bit[1:0] {
    FIXED = `SVT_TRAFFIC_PROFILE_FIXED,
    RANDOM = `SVT_TRAFFIC_PROFILE_RANDOM,
    CYCLE = `SVT_TRAFFIC_PROFILE_CYCLE,
    UNIQUE = `SVT_TRAFFIC_PROFILE_UNIQUE
  } attr_val_type_enum; 

  typedef enum bit[1:0] {
    SEQUENTIAL = `SVT_TRAFFIC_PROFILE_SEQUENTIAL,
    TWODIM = `SVT_TRAFFIC_PROFILE_TWODIM,
    RANDOM_ADDR = `SVT_TRAFFIC_PROFILE_RANDOM_ADDR 
  } addr_val_type_enum;

  typedef enum bit[1:0] {
    END_OF_PROFILE = `SVT_TRAFFIC_PROFILE_END_OF_PROFILE,
    FRAME_TIME = `SVT_TRAFFIC_PROFILE_END_OF_FRAME_TIME,    
    FRAME_SIZE = `SVT_TRAFFIC_PROFILE_END_OF_FRAME_SIZE   
  } output_event_type_enum;

  typedef enum int {
    XACT_SIZE_8BIT = 8,
    XACT_SIZE_16BIT = 16,
    XACT_SIZE_32BIT = 32,
    XACT_SIZE_64BIT = 64,
    XACT_SIZE_128BIT = 128,
    XACT_SIZE_256BIT = 256,
    XACT_SIZE_512BIT = 512,
    XACT_SIZE_1024BIT = 1024
  } xact_size_enum;

  /** Configuration for rate control in WRITE FIFO. */ 
  svt_fifo_rate_control_configuration write_fifo_cfg;

  /** Configuration for rate control in READ FIFO. */
  svt_fifo_rate_control_configuration read_fifo_cfg;

  /** Utility class for performing FIFO based rate control for WRITE transactions */
  svt_fifo_rate_control write_fifo_rate_control;

  /** Utility class for performing FIFO based rate control for READ transactions */
  svt_fifo_rate_control read_fifo_rate_control;

  /**
    * The sequence number of the group in the traffic profile corresponding to this configuration
    */
  int group_seq_number;

  /**
    * The name of the group in the traffic profile corresponding to this configuration
    */
  string group_name;

  /**
   * Full Name of the sequencer instance on which this profile is to run
   * This name must match the full hierarchical name of the sequencer
   */
  string seqr_full_name;

  /**
   * Name of the sequencer on which this profile is to run
   * This can be a proxy name and need not match the actual name of the sequencer
   */
  string seqr_name;

  /**
   * Name of the profile 
   */
  string profile_name;

 /** Number of Transactions in a sequence. */
  rand int unsigned total_num_bytes = `SVT_TRAFFIC_MAX_TOTAL_NUM_BYTES;

  /** The total number of bytes transferred in each transaction 
   * Applicable only for non-cache line size transactions. For
   * cache-line size transactions, it is defined by the protocol 
   * and corresponding VIP constraints 
   */
  rand xact_size_enum xact_size = XACT_SIZE_64BIT;

  /** Indicates the type of address generation 
   * If set to sequential, a sequential range of address value starting from
   * base_addr will be used.  
   * If set to twomin, a two dimensional address
   * pattern is used. Check description of properties below for details.  
   * If set to random, random values between base_addr and
   * base_addr+addr_xrange-1 is used. Values will be chosen such that all
   * the valid paths to slaves from this master are covered.
   */
  rand addr_val_type_enum addr_gen_type = SEQUENTIAL;
  
  /** The base address to be used for address generation */
  rand bit[63:0] base_addr = 0;

  /** Address range to be used for various address patterns. If addr is
   * sequential, sequential addressing is used from base_addr until it
   * reaches base_addr + addr_xrange - 1, upon which the next transaction
   * will use base_addr as the address. If addr is twodim, after a
   * transaction uses address specified by (base_addr + addr_xrange - 1),
   * the next transaction uses address specified by (base_addr +
   * addr_twodim_stride). This pattern continues until addr_twodim_yrange is
   * reached. If addr is random, base_addr + addr_xrange  1 indicates the
   * maximum address that can be generated 
   */
  rand bit[63:0] addr_xrange = (1 << 64) - 1;

  /** Valid if addr is twodim. This determines the offset of each new row */
  rand bit[63:0] addr_twodim_stride;

  /** Valid if addr is twodim. After a transaction uses address specified by
   * (base_addr + addr_twodim_yrange  - addr_twodim_stride +
   * addr_twodim_xrange  1), the next transaction uses address specified by
   * base_addr. 
   */
  rand bit[63:0] addr_twodim_yrange;


  /** Indicates whether fixed, cycle or random data is to be used for
   * transactions. If set to fixed, a fixed data value as indicated in
   * data_min is used.  If set to cycle, a range of data values is cycled
   * through from data_min to data_max. If set to random, a random
   * data value is used between data_min and data_max.
   */
  rand attr_val_type_enum data_gen_type = RANDOM;

  /**
   * The lower bound of data value to be used.
   * Valid if data is set to cycle
   */
  rand bit[1023:0] data_min;

  /**
   * The upper bound of data value to be used.
   * Valid if data is set to cycle
   */
  rand bit[1023:0] data_max;

  /** 
   * Name of input events based on which this traffic profile will 
   * will start. The traffic profile will start if any of the input events are triggered.
   * The names given in this variable should be associated with the output event of some
   * other profile, so that this traffic profile
   * will start based on when the output event is triggered. 
   */
  string input_events[];

  /** 
   * Name of output events triggered from this traffic profile at pre-defined
   * points which are specified in output_event_type. The names given in this
   * variable should be associated with the input event of some other profile,
   * which will will start based on when the output event is triggered. 
   */
  string output_events[];

  /**
   * Indicates the pre-defined points at which the output events given in output_event
   * must be triggered
   * If set to END_OF_PROFILE, the output event is triggered when the last transaction from the profile is complete
   * If set to END_OF_FRAME_TIME, the output event is triggered every frame_time number of cycles
   * If set to END_OF_FRAME_SIZE, the output event is triggered after every frame_size number of bytes are transmitted
   */
  output_event_type_enum output_event_type[];

`ifndef SVT_VMM_TECHNOLOGY
  /** Event pool for input events */
  svt_event_pool input_event_pool;

  /** Event pool for output events */
  svt_event_pool output_event_pool;
`endif

`ifndef SVT_ENABLE_VCAP_MULTI_OUPUT_EVENT
  /**
   * Applicable if any of the output_event_type is FRAME_TIME.
   * Indicates the number of cycles after which the corresponding output_event
   * must be triggered. The event is triggered after every frame_time number
   * of cycles
   */
  rand int frame_time = `SVT_TRAFFIC_MAX_FRAME_TIME;

  /**
   * Applicable if any of the output_event_type is FRAME_SIZE.
   * Indicates the number of bytes after which the corresponding output_event
   * must be triggered. The event is triggered after every frame_size number
   * of bytes are transmitted. 
   */
  rand int frame_size = `SVT_TRAFFIC_MAX_FRAME_SIZE;
`else
  /**
   * Indicates the value of FRAME_SIZE or FRAME_TIME from the output event of traffic profile.  
   * Applicable if any of the output_event_type is FRAME_SIZE or FRAME_TIME.
   * FRAME_SIZE indicates the number of bytes after which the corresponding output_event
   * must be triggered. The event is triggered after every frame_size number of bytes are transmitted.
   * FRAME_TIME indicates the number of cycles after which the corresponding output_event
   * must be triggered. The event is triggered after every frame_time number of cycles
   */
  int output_event_value[];

`endif

  constraint valid_ranges {
`ifdef SVT_ENABLE_VCAP_MULTI_OUPUT_EVENT
    output_event_value.size() == output_event_type.size();
`else
    frame_time > 0;
    frame_time < `SVT_TRAFFIC_MAX_FRAME_TIME;
    frame_size >= xact_size; // Transaction size for one transaction
    frame_size <= `SVT_TRAFFIC_MAX_FRAME_SIZE;
`endif
    total_num_bytes > 0;
    total_num_bytes <= `SVT_TRAFFIC_MAX_TOTAL_NUM_BYTES;
  }

  constraint reasonable_data_val {
    data_max >= data_min;
  }


  
`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_traffic_profile_transaction)
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new traffic profile instance, passing the appropriate argument
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
   * CONSTRUCTOR: Create a new traffic profile instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(string name = "svt_traffic_profile_transaction", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_traffic_profile_transaction)
  `svt_field_object(write_fifo_cfg, `SVT_ALL_ON|`SVT_REFERENCE|`SVT_UVM_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)  
  `svt_field_object(read_fifo_cfg, `SVT_ALL_ON|`SVT_REFERENCE|`SVT_UVM_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)  
  `svt_field_object(write_fifo_rate_control, `SVT_ALL_ON|`SVT_REFERENCE|`SVT_UVM_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)  
  `svt_field_object(read_fifo_rate_control, `SVT_ALL_ON|`SVT_REFERENCE|`SVT_UVM_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)  
  `svt_data_member_end(svt_traffic_profile_transaction)


  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode (bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name ();
  //----------------------------------------------------------------------------

`ifndef SVT_VMM_TECHNOLOGY
  /**
   * Extend the copy method to take care of the transaction fields and cleanup the exception xact pointers.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);

  //----------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`else
  /**
   * Extend the copy method to copy the transaction class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);

  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare (vmm_data to, output string diff, input int kind = -1);

  //----------------------------------------------------------------------------
  /**                         
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size (int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack (ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the exception contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack (const ref logic [7:0]
  bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);

`endif
  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   */
  extern virtual function bit get_prop_val (string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);
  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val (string prop_name, bit [1023:0] prop_val, int array_ix);
  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern ();

  // ---------------------------------------------------------------------------
   /**
   * allocate_xml_pattern() method collects all the fields which are primitive data fields of the transaction and
   * filters the fields to get only the fields to be displayed in the PA. 
   *
   * @return An svt_pattern instance containing entries for required fields to be dispalyed in PA
   */
   extern virtual function svt_pattern allocate_xml_pattern();
 // ----------------------------------------------------------------------------
  /**
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
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

 // ----------------------------------------------------------------------------
   /**
   * Checks to see that the data field values are valid, focusing mainly on
   * checking/enforcing valid_ranges constraint. Only supported kind values are -1 and
   * `SVT_DATA_TYPE::COMPLETE. Both values result in the same check of the fields.
   */
  extern function bit do_is_valid(bit silent = 1, int kind = RELEVANT);
//-----------------------------------------------------------------------------------

  /**
   * This method returns PA object which contains the PA header information for XML or FSDB.
   *
   * @param uid Optional string indicating the unique identification value for object. If not 
   * provided uses the 'get_uid()' method  to retrieve the value. 
   * @param typ Optional string indicating the 'type' of the object. If not provided
   * uses the type name for the class.
   * @param parent_uid Optional string indicating the UID of the object's parent. If not provided
   * the method assumes there is no parent.
   * @param channel Optional string indicating an object channel. If not provided
   * the method assumes there is no channel.
   *
   * @return The requested object block description.
   */
   //extern virtual function svt_pa_object_data get_pa_obj_data(string uid = "", string typ = "", string parent_uid = "", string channel = "" );

//-----------------------------------------------------------------------------------
/**
  * This method is used to set object_type for bus_activity when
  * bus_activity is getting started on the bus .
  * This method is used by pa writer class in generating XML/FSDB 
  */
   // TBD: Add when PA is supported
  //extern function void  set_pa_data(string typ = "" ,string channel  ="");
 
//-----------------------------------------------------------------------------------
  /**
  * This method is used to  delate  object_type for bus_activity when bus _activity 
  * ends on the bus .
  * This methid is used by pa writer class  in generating XML/FSDB 
  */
   // TBD: Add when PA is supported
  //extern function void clear_pa_data();
  
//------------------------------------------------------------------------------------
  /** This method is used in setting the unique identification id for the
  * objects of bus activity
  * This method returns  a  string which holds uid of bus activity object
  * This is used by pa writer class in generating XML/FSDB
  */
   // TBD: Add when PA is supported
  //extern virtual function string get_uid();

endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
col+ACj5WUzxTUeHK7320x2FRcYQBpyIKpxYOPDyeD7yTwmoF1RZjK5JLIlsaPLL
LaziOdlWdBAMTAOuW1vbmuClQ1IDlOB6JcmOxkWDzY48x40Z/5H/AIw9CCaJJRp1
aMvS0M62jORmBRIoEtf1DFtQcn0TILLY/5eT7VTNQJs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25898     )
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
`pragma protect end_protected
`endif //GUARD_SVT_TRAFFIC_PROFILE_TRANSACTION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hdrzEKJ2w2eMGOs+thf8SBvstZu3B7OEgDpcM+aG1vX2hAPKLkRVIvTJK/vtLiZI
Z3hl+qrK6pcNCaMwY3PIA8b1Njno7UV85UK7blFbL4igGdOKoxgMChmkqhOEFEjZ
UpY+dCM5FHJACreBmUwTZnVr7Xl95KE60pB4msfQS1s=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25981     )
JFKlW4uEe3JAhG3sPb5YFUBqkCRwLhibT3zSad/hd5Fv9x6MS9l5rlCjpbsx/Qlu
BJ/KTFKhwiymU7bg1NZXPQow/ynZZAFa/NZwJ1MO5U/VZhNT6UzOHPS9JpFDK+2j
`pragma protect end_protected
