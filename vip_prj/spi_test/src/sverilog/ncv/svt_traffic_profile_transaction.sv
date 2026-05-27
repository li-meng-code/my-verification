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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
k1pPFo1f5hDru4XcDLF/IUp+W6VHG+ZFUS756onVjm4Bn4VgvwJX26bgP/lQO/N+
10WsFZi1a3a8JNYS+HGcLlHELB6xDfJGoNfUlt3tvhy12Afj99OSuoZvQfx59Lvz
XUhFQJ2TKez5NVp9niz5Dct1wdQkRijeizwz9jOP6BN7xMYLyZzaeg==
//pragma protect end_key_block
//pragma protect digest_block
O7cOkYknqjKGkVsX2Gsb2rRXA5Q=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
YbAptLWtGeQ1+HFHkQGGq/HwUSI=
//pragma protect end_digest_block
//pragma protect end_protected
`endif //GUARD_SVT_TRAFFIC_PROFILE_TRANSACTION_SV
