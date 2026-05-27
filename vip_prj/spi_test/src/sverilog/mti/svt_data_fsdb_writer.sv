//=======================================================================
// COPYRIGHT (C) 2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DATA_FSDB_WRITER_SV
`define GUARD_SVT_DATA_FSDB_WRITER_SV

/** @cond PRIVATE */

/**
 * Utility class to write data values out to FSDB.  This base class writes
 * values to an FSDB file.  All values are stored as strings to simplify
 * the read back operation.
 */
class svt_data_fsdb_writer extends svt_data_writer;

  /** VIP writer instance to use to record the data */
  svt_vip_writer writer;

  /** Unique object identifier to associate the data with */
  string uid;

  /** Singleton handle */
  static local svt_data_fsdb_writer m_inst = new();

  // ---------------------------------------------------------------------------
  /** Constructor */
  extern function new();

  // ---------------------------------------------------------------------------
  /**
   * Obtain a handle to the singleton instance.
   * 
   * @return handle to the svt_data_fsdb_writer singleton instance
   */
  extern static function svt_data_fsdb_writer get();

  // ---------------------------------------------------------------------------
  /**
   * Write the supplied bit value to the FSDB file.
   * 
   * @param prefix String prepended to the prop_name value
   * @param prop_name String written as the property name
   * @param prop_val Bit value that is written
   * @return Status of the data write operation
   */
  extern virtual function bit write_value_pair_bit(string prefix, string prop_name, bit prop_val);

  // ---------------------------------------------------------------------------
  /**
   * Write the supplied bit value to the FSDB file.
   * 
   * @param prefix String prepended to the prop_name value
   * @param prop_name String written as the property name
   * @param prop_val INT value that is written
   * @return Status of the data write operation
   */
  extern virtual function bit write_value_pair_int(string prefix, string prop_name, int prop_val);

  // ---------------------------------------------------------------------------
  /**
   * Write the supplied bit value to the FSDB file.
   * 
   * @param prefix String prepended to the prop_name value
   * @param prop_name String written as the property name
   * @param prop_val String value that is written
   * @return Status of the data write operation
   */
  extern virtual function bit write_value_pair_string(string prefix, string prop_name, string prop_val);

endclass: svt_data_fsdb_writer

/** @endcond */

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
b9Mqi8T55K+hcmNh7Y/1WBvZ+nYOxlYS4tqbhANmg9xHdTegFuiCT5WJk+JASFH3
4NxfvuxHbc4AUzXp+ohwjSb2cA09YsOoKbfw++u3x/nh8gmHTSYQbqttYs+3oPVe
IG6K+CQgexy1c7FZn051lCDt6tZCiRwQtASJTPhnwEU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1837      )
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
pbgTDYO8mKZOwwIK+5/IfA==
`pragma protect end_protected

`endif // GUARD_SVT_DATA_FSDB_WRITER_SV`pragma protect begin_protected
`pragma protect end
