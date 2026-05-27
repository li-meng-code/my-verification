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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
cjR+1G0gEmhnshuDA/vmxU7JWTWa8HawU8bUk14BLLNKLaImMJrFocsmVtFLS4lG
er2ESh3IoLVbVpMdZuDzm4+CpkGbQgGa5SkU1m1ASoXcVVAN9RsKRJkqA1top5dg
FOmhdeQYkn8N/Z4HpUI4WVIFqB5pSbbbM+TgrV8EW0jsxRglXGxubg==
//pragma protect end_key_block
//pragma protect digest_block
fyDyuzUCVCPc8iSHIoThJWpKcgo=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
2Cx26XK01EGUie78bCbZmAzV4J8=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_TRANSACTION_SV
