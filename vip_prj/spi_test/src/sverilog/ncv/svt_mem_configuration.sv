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

`ifndef GUARD_SVT_MEM_CONFIGURATION_SV
`define GUARD_SVT_MEM_CONFIGURATION_SV

// =============================================================================
/**
 * This memory configuration class encapsulates the configuration information for
 * a single memory core instance.
 */
class svt_mem_configuration extends svt_configuration;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************
  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Indicates whether XML generation is included for memcore operations. The resulting
   * file can be loaded in Protocol Analyzer to obtain a graphical presenation of the
   * memcore activity. Set the value to 1 to enable the memcore XML generation.
   * Set the value to 0 to disable the memcore XML generation.
   * 
   * @verification_attr
   */
  bit enable_memcore_xml_gen = 0;

  /**
   * Determines in which format the file should write the transaction data.
   * A value 0 indicates XML format, 1 indicates FSDB and 2 indicates both XML and FSDB.
   * 
   * @verification_attr
   */
  svt_xml_writer::format_type_enum pa_format_type;

  //----------------------------------------------------------------------------
  /** Randomizable variables - Static. */
  // ---------------------------------------------------------------------------

  /** Defines the number of data bits.
   *
   * Must be less than or equal to `SVT_MAX_MEM_DATA_WIDTH.
   */
  rand int data_width = 32;

  /** Defines the number of address bits.
   *
   * Must be less than or equal to `SVT_MAX_MEM_ADDR_WIDTH.
   */
  rand int addr_width = 32;

  /** Defines the number of user-defined attribute bits.
   *
   * Must be less than or equal to `SVT_MAX_MEM_ATTR_WIDTH.
   */
  rand int attr_width = 8;

  /** Memory is read-only if TRUE(1). */
  rand bit is_ro = 0;

  /**
   * Memory is 4state if TRUE(1).
   * 
   * @verification_attr
   */
  rand bit is_4state = 0;

  /** Name of the file used to initialize the memory content.
   *
   * If the value is "", then no file initialization will happen.
   * 
   * @verification_attr
   */
  string fname = "";
 
  /**
   * Name of the mem_core used in C sparse array.
   * 
   * @verification_attr
   */
  string core_name = "MEMSERVER";

/** @cond PRIVATE */
  /** Physical characteristic descriptor
   *
   * Defines the number of dimensions that the physical address is composed of.
   * This value is used when constructing the memcore instance.
   */
  int unsigned core_phys_num_dimension = 0;

  /** Physical characteristic descriptor
   *
   * This value is passed in to the first argument to the 
   * define_physical_dimension method in svt_mem_core.  This represents the
   * transaction attribute field name for the dimension (Ex: rank_addr).
   */
  string core_phys_attribute_name[$];

  /** Physical characteristic descriptor
   *
   * This value is passed in to the second argument to the 
   * define_physical_dimension method in svt_mem_core. This represents the
   * user-friendly name for the dimension as it appears in PA (Ex: RANK).
   */
  string core_phys_dimension_name[$];

  /** Physical characteristic descriptor
   *
   * This value is passed in to the third argument to the 
   * define_physical_dimension method in svt_mem_core.  This represents the
   * dimension size (Ex: 8 rows, will have a dimension size of 8).
   */
  int unsigned core_phys_dimension_size[$];

  /** This flag is used to enable or disable log base 2 data width aligned address, default is disabled */
  bit enable_aligned_address = 0;

/** @endcond */

  //----------------------------------------------------------------------------
  /** Randomizable variables - Dynamic. */
  // ---------------------------------------------------------------------------


  // ****************************************************************************
  // Constraints
  // ****************************************************************************
  /** Keeps the randomized width from being zero */
  constraint mem_configuration_valid_ranges {
    // Should be at least one bit of data width and should never exceed the SVT MAX.
    data_width inside { [1:`SVT_MEM_MAX_DATA_WIDTH] };

    // Should be at least four bits of address width (memserver restriction) and should never exceed the SVT MAX.
    addr_width inside { [4:`SVT_MEM_MAX_ADDR_WIDTH] };

    // May be zero in case there are no attributes used but should never exceed the SVT MAX.
    attr_width inside { [0:`SVT_MEM_MAX_ATTR_WIDTH] };
  }

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_mem_configuration)
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
  extern function new(string name = "svt_mem_configuration", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef __SVDOC__
  `svt_data_member_begin(svt_mem_configuration)
  `svt_data_member_end(svt_mem_configuration)
`endif

  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   */
  extern virtual function int static_rand_mode(bit on_off);

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

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_static_data ( `SVT_DATA_BASE_TYPE to );

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_dynamic_data ( `SVT_DATA_BASE_TYPE to );

`ifdef SVT_VMM_TECHNOLOGY
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
`else // !`ifdef SVT_VMM_TECHNOLOGY
   // ---------------------------------------------------------------------------
   /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);

`endif //  `ifdef SVT_VMM_TECHNOLOGY

  //----------------------------------------------------------------------------
  /**
   * Checks to see that the data field values are valid, focusing mainly on
   * checking/enforcing valid_ranges constraint. Only supported kind values are -1 and
   * `SVT_DATA_TYPE::COMPLETE. Both values result in the same check of the fields.
   */
  extern function bit do_is_valid(bit silent = 1, int kind = RELEVANT);

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

/** @cond PRIVATE */
  // ---------------------------------------------------------------------------
  /**
   * Update the physical dimensions based on the configured memory size.  These
   * values are used when configuring the memory core.
   */
  extern virtual function void update_physical_dimensions();

  /**
   * Clears the physical dimensions dynamic queue. This method must be called before #update_physical_dimensions.
   */
  extern virtual function void clear_physical_dimensions();

  /**
   * Verify the physical dimensions queue size matches with the number of physical dimension
   * report an error if there is a mismatch. This method must be called after #update_physical_dimensions.
   */
  extern virtual function void check_physical_dimensions();
/** @endcond */

  //---------------------------------------------------------------------------
  /**
   * Walk through the part catalog to select the proper part number and returns the
   * path to the configuration file.
   * 
   * @param catalog The vendor part catalog that is to be used to find the part.
   *
   * @param mem_package Determines which package category to select the part number from.
   * 
   * @param mem_vendor Determines which vendor category to selct the part number from.
   * 
   * @param part_name Specifies the part name to load.
   *
   * @return Indicates whether the load was a success.
   */
  extern function bit load_cfg_from_catalog(svt_mem_vendor_catalog_base catalog, string mem_package, string mem_vendor, string part_name);

  // ---------------------------------------------------------------------------
endclass:svt_mem_configuration


//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
gkvxeufSh0MQVsogVdeqU0Pf3ijxNhI6upUDea/y+EObmCNqWMyZ7PBbLdJ5ERTv
lajj3wU4BAW53fJQ2m0t6DMCh7pfAbv4d2UZd5eMZXK3rywvwBa/nuJo8GrSp9Mx
FrNLx24macjvjAwtlfcJhikYgSKuMXO7/LUcpljuQ6e2kkvEXaoilA==
//pragma protect end_key_block
//pragma protect digest_block
fTTECGZ1xb5FNR5D4c6MatbnxSE=
//pragma protect end_digest_block
//pragma protect data_block
HHi2Wxg4CJt3ey2awgJyRibYM/voQRtQg5y8FR2OA+Dxo/ezDWZA3HX2ZpS2D+uR
bsTMBc10zZL6NguIiQW6i/JF0aFz640qZ1iz4Womoxkxep9GBOSAhUgoF7hkEXwd
PClMMV54WvHZLlIoRjfcAsoX3/bxhTuROIn5rCGAqO6wcdu8pV7v33PlZjNF15WP
vBUhtd/e8pPNmuwW9cAjAkgP4nIgxUjA5la2EnFg40+TlNhv2SdZzs0vOocKqqd/
k0GSDQsh1sGSChp8kuQ6DqqevTRhOE4tNY/Uy0VSvV+V/z/CboVJkSOe0MvcP8MJ
RrkOMsdhkhiH9xuInSuQMZGfjOmeqsspUKdhnzTPSssKPMWGuyLvKgH5o//0QnAR
IT1zLlBCekoc1FjQlao3kOngZVacQJZ1DA74K+0/sCuDpBeoqHzrQjqmBh8Hj9TY
O0p8yv2hdh9xwmcj1dnKThGLSNK3xvyseDUoyIYA1PJ0p/fo2qrZNzyAaLMcT22d
inUlo5jlCQ9DR0iOD8V6+em51MxNBg7pOXuKbgb7J3mBO6EMgux4LQJe1/Cr9+FH
PFn5eTfz92kTHqmpYshVWB4qAPsDxxD/Q8U3XUA/Zv1izJBG/TrCrQHtXNwNfDfJ
nRfYMwJ6BbWtPFuZTR5j/g+sbMqr5RSVfEK0ipmlmBO8X7enk5pbmKDDdZk+lIgv
0b1g/b8Fr8hz6MGPne8J13McfuuOsoYSvmZiyLpLJmxNIeCahTxtclVYjVPDqdqH
rdmHtLLCC5DMR7kAXFopbXZzeXBwpZ/+83nrZxWNqSBZeRD6V3MaN7oszFFMxog5
1ThTqSnU4lWYu1MQPb7ENpThqIMDGiqUnC9cwcQKNsgUAhaTQCuJhOysE1md9xBj
AAdfhhAY4XN0qrBOeABxL0w+2/DSRkdeEJHbK39QlWrjl2CGIvr2tDUgiRmnNVi+
C66hsC5wRYJ/ogNDFOP23yQbXJZ9YsJdZ2G15CKrOHHNquKMUw/RquwWivBm97cu
MNQ1LN/Ci2kPclwBK2y6imzrxbMRyMzbqvVxUcrsvciFv1u0ZxaTFkLEdTtH45x4
+397LnJEpFps6GZKrc0BfbyRT+GHb1re3XCzm9yDNxM=
//pragma protect end_data_block
//pragma protect digest_block
RYmDIe1IcCykv8t2MPPoLhc1Ln8=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Q/1uZfpwdAj4xbLFbELmWMlr6s8pE1TtV0MbvD1BZcuFSPPlCkrbzPpKZPAHkQTd
zaod7wljuhJREicEoCzmXxBIzi/y+v7cUAdWqieP+KtQ2f3auI9V9AWyuczfN4QI
SVWCcdW80LHJQ5a3Y3q65jCcLaf69LrjFAYx1TaOkLtxDWtQBNoOew==
//pragma protect end_key_block
//pragma protect digest_block
KXhADfUchJM6v0L0CY8HCmcms2c=
//pragma protect end_digest_block
//pragma protect data_block
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
9rQHN30Kx/DZBahHs6P40A==
//pragma protect end_data_block
//pragma protect digest_block
FTyrc0dsxhWwG2c5+eJMDnFptVc=
//pragma protect end_digest_block
//pragma protect end_protected
   
`endif //  `ifndef GUARD_SVT_MEM_CONFIGURATION_SV
   
