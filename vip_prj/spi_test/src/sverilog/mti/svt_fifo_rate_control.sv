//=======================================================================
// COPYRIGHT (C) 2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_FIFO_RATE_CONTROL
`define GUARD_SVT_FIFO_RATE_CONTROL
/**
  * Utility class which may be used by agents to model a FIFO based
  * resource class to control the rate at which transactions are sent
  * from a component
  */
class svt_fifo_rate_control extends `SVT_DATA_TYPE;
  
   // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************
  typedef enum bit {
    FIFO_ADD_TO_ACTIVE = `SVT_FIFO_ADD_TO_ACTIVE,
    FIFO_REMOVE_FROM_ACTIVE = `SVT_FIFO_REMOVE_FROM_ACTIVE
  } fifo_mode_enum;


  // ****************************************************************************
  // Local Data
  // ****************************************************************************
   /** Semaphore used to access the FIFO */
   protected semaphore fifo_sema;

`ifdef SVT_VMM_TECHNOLOGY
  /** Shared log object if user does not pass log object -- only used in the call to the super constructor. */
  local static vmm_log shared_log = new ( "svt_fifo_rate_control", "class" );
`else
  /**
   * SVT message macros route messages through this reference. This overrides the shared
   * svt_sequence_item_base reporter.
   */
  protected `SVT_XVM(report_object) reporter;
`endif


  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** FIFO rate control configuration corresponding to this class */
  svt_fifo_rate_control_configuration fifo_cfg;

  /** The current fill level of the FIFO */
  int fifo_curr_fill_level = 0;

  /** The total expected fill level */
  int total_expected_fill_level = 0;


  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_fifo_rate_control)
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
  extern function new(string name = "svt_fifo_rate_control", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef __SVDOC__
  `svt_data_member_begin(svt_fifo_rate_control)
  `svt_field_object(fifo_cfg, `SVT_ALL_ON|`SVT_REFERENCE|`SVT_UVM_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY) 
  `svt_data_member_end(svt_fifo_rate_control)
`endif

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
   * Extend the copy method to copy the transaction class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);

 `else
  //---------------------------------------------------------------------------
  /**
   * Extend the copy method to take care of the transaction fields and cleanup the exception xact pointers.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
`endif
 //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. Only supports
   * COMPLETE pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset. Only supports COMPLETE
   * pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset. Only supports COMPLETE
   * unpack so kind must be `SVT_DATA_TYPE::COMPLETE.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the buffer contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
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

  // ---------------------------------------------------------------------------
  /**
   * Decrements FIFO levels by num_bytes
   * @param xact Handle to the transaction based on which the update is made.
   * @param num_bytes Number of bytes to be decremented from the current FIFO level.
   */
  extern virtual task update_fifo_levels_on_data_xmit(`SVT_TRANSACTION_TYPE xact, int num_bytes);

  // ---------------------------------------------------------------------------
  /**
   * Updates FIFO levels every clock. Must be implemented in an extended class
   */
  extern function void update_fifo_levels_every_clock();

  // ---------------------------------------------------------------------------
  /**
   * Updates #total_expected_fill_level based on num_bytes
   * @param xact Handle to the transaction based on which the update is made.
   * @param mode Indicates the mode in which this task is called. If the value passed
   *             is 'add_to_active', num_bytes are added to the #total_expected_fill_level.
   *             If the value passed is 'remove_from_active', num_bytes are decremented from
   *             #total_expected_fill_level.
   * @param num_bytes Number of bytes to be incremented or decremented from the #total_expected_fill_level. 
   */
  extern virtual task update_total_expected_fill_levels(`SVT_TRANSACTION_TYPE xact, fifo_mode_enum mode = svt_fifo_rate_control::FIFO_ADD_TO_ACTIVE, int num_bytes);

  // ---------------------------------------------------------------------------
  extern virtual function bit check_fifo_fill_level(`SVT_TRANSACTION_TYPE xact, 
                                                    int num_bytes
                                                    );

  // ---------------------------------------------------------------------------
  /**
   * Waits for the FIFO to be full after taking num_bytes into account
   * @param num_bytes The number of bytes to be added to the current fifo level 
            before checking whether FIFO is full or not.
   */
  extern virtual task wait_for_fifo_full(int num_bytes);

  // ---------------------------------------------------------------------------
  /** Resets the current fill level */
  extern function void reset_curr_fill_level();

  // ---------------------------------------------------------------------------
  /** Resets the semaphore */
  extern function void reset_sema();

  // ---------------------------------------------------------------------------
  /** Resets current and expected fill level and semaphore*/
  extern function void reset_all();

  // ---------------------------------------------------------------------------
endclass
// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aqY/f03hSpnMLJ6AlW7Ln2mrjnowmXUg4ejMroDY4Ind5nxrnjxaOjzdpkfTXiUO
P5LzZcG3nK5vrad03F4y/6fFMrBoK8eFvAgyg5Tg1bqcbVcn2IOo0THamQS2WgUX
xlopGTaem+krIE15u1JrwqgS/X2vOrs/g2ke/3AukOM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 514       )
UGU3PQwGMa/XLhG38yQZkl4/I6TLeHnOQft3npqpZrAkR3ocCvD6uo2EIvyciI4t
dvnsTyeQ7t+pZAPE+CkA7kfn7M9oESjX+MWsnjxFZ5rMjOLiTwHapm1Adhupjr28
PxI2iskOGsV9vJgYFNXOWr8znbdBjVngYU487/eUicxRo+CdO0hGGigE2eEIUu/V
cYPqBA/jJZZxrdaqpWj7dD5FH9dEb1jBJXQGTXFfISDSN02hSZWJHFt5FJ0q3rOm
3hYqMzjFvyBfcsAoWHO5GpZQ0Rgy7QQk6c+Nq02AIpHGVE2MdLUpAGqNpRBMagd7
lrnq2m2R1G5afvygJDcq8+tAOwo5Jnb9VS1nX0hdjURyAmLPCfbrN+fYyyj7+0i5
UhvDiQz510khaIrjA7kmXrlhmLQzXswIPc6uJmGxQwPEdvYTKQ5tPTAreLQJ5/x0
1WHi7CV15QnexpGRd23h6l0bLS8MTZAxwZv8Eujfa9F2U+sxey9SyIEBMzDeNHQP
tEI0AMFY2p7iJ2zPJ2ua34nfj0no/rwqJe+39mppYwwu609pK1cH8D3MHpFWoMsg
PCT+Xu6jO3IAFcRNY2dltMrUxw49V2ClI+4Yw1P3zxlTtO1J91xHcoqjO7u6HbKQ
AaEIC0zXCGHd/3g3nwukusKKDmV1NLctpjykD4kBFDzE+dEYlnNGclI6fn3J+zqF
`pragma protect end_protected

 //svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gr/w/zOP0LcAHGspKFEDhlgsUjOZbX+Faw5W5pgdnIjV963K0h8PeOZ/ZK/9HsnM
H0XIL9uNjp3a9N7co9xC4QjcXu/pcNHjrlddSWxfUr8taDWXExPJ56nJEgVYhTU7
7lHvK0Hbz9+wzp41nyrXjZpM7H5/Az2T7lSM6vc2ehA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 13194     )
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
v7UGcX05E9QQD+37b91j1w==
`pragma protect end_protected

`endif //GUARD_SVT_FIFO_RATE_CONTROL
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
byaLwbuf32fRbXAQTkH/Q2nPwwEizoq8qPxFpN6/KZjwnbdDqFUs7xmYkk1HW5pO
/otw0outh376OmbnjUucUblBmB63KCjNDv0oRQL6bOgxA54sX8PhjYCbzsqPqloV
N1nL0FBaSyqu03is9tmQVsUNHl91BQpTpE8bUhuVSGw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 13277     )
yC9CQqoxYcqhsP9ogPj3OV2PvqP5w/fOtjo95VZczAKz8hVdHeqyaGAbc3Zw9BOG
km5TBRzWXZpLt7Yf9dCaZTPLGkK0a/GKfUDiT6upyxqJ43PUQaXjgVWXOd9UDGpp
`pragma protect end_protected
