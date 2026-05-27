//=======================================================================
// COPYRIGHT (C) 2016-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_GPIO_TRANSACTION_SV
`define GUARD_SVT_GPIO_TRANSACTION_SV

/** Class defining a GPIO transaction */
class svt_gpio_transaction extends `SVT_TRANSACTION_TYPE;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  /** Transaction command values.
   *
   * - READ       Read the current GPIO inputs
   * - WRITE      Set the GPIO outputs
   * - INTERRUPT  An interrupt condition was detected
   * - PULSE      Toggle the GPIO outputs for 1 cycle
   * .
   */
  typedef enum {
    READ      = `SVT_GPIO_CMD_READ,
    WRITE     = `SVT_GPIO_CMD_WRITE,
    PULSE     = `SVT_GPIO_CMD_PULSE,
    INTERRUPT = `SVT_GPIO_CMD_INTERRUPT
  } cmd_enum;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** Randomizable variables */
  // ---------------------------------------------------------------------------

  /** Transaction command */
  rand cmd_enum cmd = READ;

  /** Data portion of transaction.
   *
   *  For READ and INTERRUPT transactions, it contains the current GPIO inputs value.
   */
  rand svt_gpio_data_t data  = '0;

  /** Data bit enable
   *
   * GPIO output is affected by WRITE or PULSE operations only if the corresponding bit
   * is 1. For INTERRUPT transactions, indicates which GPIO input(s) triggered the
   * interrupt.  Ignored for all other transactions.
   */
  rand svt_gpio_data_t enable  = '0;

  /** Number of clock cycles to wait after the command has been executed
   *
   *  Default is 0.
   *  For a pure-delay, use a WRITE command with no enabled bits.
   *  For INTERRUPT , the property specifies the number of clock cycles since the
   * previous reported interrupt. The first interrupt is reported with a delay of
   * 'hFFFFFFFF.
   */
  rand int unsigned delay;

  // ****************************************************************************
  // Constraints
  // ****************************************************************************

  /** Do not generate INTERRUPT commands as they are used solely to report interrupts */
  constraint valid_cmd {
    cmd != INTERRUPT;
  }

  /** Limit the post-command delay to 16 cycles */
  constraint reasonable_delay {
    delay <= 16;
  }

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_gpio_transaction)
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   */
  extern function new(string name = "svt_gpio_transaction");
`endif // !`ifdef SVT_VMM_TECHNOLOGY

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_gpio_transaction)
  `svt_data_member_end(svt_gpio_transaction)

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

`ifndef SVT_VMM_TECHNOLOGY
   // ---------------------------------------------------------------------------
   /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
  //---------------------------------------------------------------------------
  /**
   * Extend the copy method to take care of the transaction fields and cleanup the exception xact pointers.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);

`else

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

  //----------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the transaction class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);

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

`endif // !`ifndef SVT_VMM_TECHNOLOGY

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
  extern virtual function bit encode_prop_val( string prop_name,
                                               string prop_val_string,
                                               ref bit [1023:0] prop_val,
                                               input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
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
  extern virtual function bit decode_prop_val( string prop_name,
                                               bit [1023:0] prop_val,
                                               ref string prop_val_string,
                                               input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

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

endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CI31hpLZUpsQJbcM0TEHsU0eM4qjylL1tNG+DW2eh4p+mh3CrRp18igjrXpm3acQ
2LdhVsyGW6qdJqmJZ1smoAqGq+Wpp2BhmVlzReyld+wy9zv0ADxI+kaSpj3a+iPJ
q16ZLRKXHw59naMnICyzFhNKK2qQPinhugGXpm+MRjI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12196     )
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
LlRsphLQFk2NI4/CeKdr0A==
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_TRANSACTION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
a2V50b0t0/sADOUkMNl9oU2t9dG1Uc6v08AZp7tyYhfI7cgjXxLd5EO77tGQBAAy
QDK886P+hD/GYtb9DaRVY1scWThKiV7LHxSuKY+F7NWiP9yyLck721UuvAI6p0JW
EPpdHQRTUQGy34aROt0wzL14IQU/lVUrfLHyaMXOf+4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12279     )
nuWui2TYfolf1Lc6Xv4BCAEmrWvxSVhsthRYpiiTV19nWgyzLwqm5exe9k285Uc7
bJX/eACNtfMxj53C+3j1/X7+7I2yEfLrjiORiOQVvg5g5FcEEr2YE4tA1liYzlhY
`pragma protect end_protected
