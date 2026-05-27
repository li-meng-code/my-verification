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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
URwcvNffIw/Y/xE/uk1K9KTkZsBl+X7siwDB9KUWFtNTtHE40u8IR9tG1ijcDmKS
uC7ekzRVHYMVVbVE8+L3c3VNNgICD4wln/YtO1l4byRFkdMO0kaCIC1XkO/jHAvW
44+If75bIncrYktU2rJKxFeT19XEjz0r/I1JWBOYznw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 673       )
xdUkmr4iOgtMCk9U49aTs7z+VGOenJZ9cUMDdkHlqUymDl4fmMetSe2OFeBMYzrw
OIe7aT+v7ROGOdPJSM2BAuFZT38AFnJbbj4gi1MZ0phVh+j8gzKU2CB8IynEUQNy
yLWUj2EPnMBG2T5jyfxFGOz+EUTEkPfMVx5ZQIrFPziyEeNnvUeEiwBiEAH1TB5Q
Ydrr7dppFpSfRtI8fdM2od+hQgAZemgNByjLQHKK/XeWLpiaXgBdD6LngXLKOXGr
1Mj6Xl10CD9SAH4yuAF6zMTM92QA0C9nCdrVVzyv2z6oXN1O24MtcU1QBoEsfEvx
0T3aT9gQAbqFCY43vfikgrpcPojtLaoDgGDMXEhiGxmJzI9qB/mKBKlFLOEVS9Ys
f10KnGzRwV87wrtISu9eEptbJlyiRqg+FEZwPxJPM5dE8RdOS1e+/9DN4rEUGqGc
WDdVns2Y9a3yJ21/ivMpMKQ2gZrUUOdzfzhQDZesEtWau1pJ+hNPDroTaaitbv6V
etLYZ/ivofm+zSQo7C3IEeflLDmG1N472D/6z4uNX2bW9y/7nVj61ZMpS8e4AJOT
Kf/Nn66wdIp935XKG0CKB8ciGmeeV+hTwqczSN8yK4Or6W1yPoi3SnUKaqNnaHsJ
Nxtxvzul3ZA34u1glqSk6jaO+HhuZrkAIYJZDLaKt1c2xR/ri7xX94nsttfjTS/o
ZE3cMTvAo9td7x5BuvonvPnKegRAP57UoHceUe41+tTml6DZ4yR5+cF+P99BLpVB
swLa+VLzZB+Vw37cjgs6VMZf+YbPc6Zagl749MTg6jyCR5ecCn5dz113pgx/2wGa
DtzcPl6BCYl6ievAl1MFvt11K7t5HGhUj4zt3e55eXwBUgZrgOoI/Fv5Ooc+l8HS
xtMU89mGHg8m6KOOTLWFjw==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TowN6yVXU2Ma1tMh3Sb7IQbmCR3D8HX12+12Vqyhgqsb4Tz74laMFxF8HOJ4ZrtG
IX3pLOQgWaoztx1VUny+5AkA14soyrjqynNDpJnPVJXiO9Nf1QICA1l75z5xr96y
0mi/EGBDzrlcFBhKplRFhxMKmqP1sq2ULWZbxx2uDJY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20190     )
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
`pragma protect end_protected
   
`endif //  `ifndef GUARD_SVT_MEM_CONFIGURATION_SV
   
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
U/Ot9sYaYsYgrPjHqxP34+UrzzFN98bA+p/5djAX4p7hBMfSW6CxCStADqCAApt8
2Yj6ah0jGrsOdCSrCm4Vr+wrtU4VVRbdS8RiKDzfyMZThNy3v6sFLl/PkhRj0xj/
tydJP2Gta3YrQW9v+qmr0oBBqGUIG7x+dDed76xW8FI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20273     )
KPdubIWWzZZ5lFpBIjAj2hjALYhrDB6dHY25VsSoY6LnpQBJWIJ2LDahZxvRq0Fo
UBwu5X1JX2Gvzht2xc/ZJAyYpdu8cfWqJt349pkXAtiivJ0oFECCMzkgYoyT/MLn
`pragma protect end_protected
