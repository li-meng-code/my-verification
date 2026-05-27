
`ifndef GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * ISSI xSPI_IS66_67_WVO_M8D device family in DDR mode.
 */
class svt_spi_flash_issi_xSPI_ddr_ac_configuration extends svt_configuration;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************
`ifdef SVT_SVDOC_CC
  /** Workaround for SVDOC CC circular references */
  int cfg;
`else
  /** This is a handler to the SPI memory config object */
  svt_spi_mem_configuration cfg;
  /** This is a handler to the SPI mode reg config object */
  svt_spi_mem_mode_register_configuration mode_register_cfg;
`endif

  /**
   * Initial value for all the timings which indicates that parameter was not
   * loaded from the catalog
   */
  real initial_time = -5000; // must be smallest then all timing

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

  //----------------------------------------------------------------------------
  // Type Definitions
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  `ifndef SVT_SVDOC_CC
    /**
     * A helper class that can generate random values for non-integral properties
     * 
     * @verification_attr
     */
    svt_randomize_assistant rand_assist;
  `endif

  ///** Assign refernce of spi_mem_configuration object */
  extern virtual function void set_timing_cfg(svt_spi_mem_configuration cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Randomize tW timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Constraints
  //----------------------------------------------------------------------------

  /**
   * Valid ranges constraints insure that the configuration settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the configuration.
   */
  extern function new(string name = "svt_spi_flash_issi_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
 
  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   *
   * @param on_off Indicates whether rand_mode for static fields should be enabled (1)
   * or disabled (0).
   */
  extern virtual function int static_rand_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   *
   * @param on_off Indicates whether constraint_mode for reasonable constraints
   * should be enabled (1) or disabled (0).
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);
   
  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_issi_xSPI_ddr_ac_configuration.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

  // ---------------------------------------------------------------------------
  /**
   * Hook called after the automated display routine finishes.  This is extended by
   * this class to print only protocol kind relevant fields
   */
`ifndef SVT_VMM_TECHNOLOGY
  extern function void do_print(`SVT_XVM(printer) printer);
`else  
  /**
   * User extendable hook which is called immediately after svt_shorthand_psdisplay().
   * This is extended by this class to print only protocol kind relevant fields
   */
  extern virtual function string svt_shorthand_psdisplay_hook(string prefix);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind.
   * Differences are placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`endif 

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this configuration object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

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
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

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
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val A <i>ref</i> argument used to return the current value of the property,
   * expressed as a 1024 bit quantity. When returning a string value each character
   * requires 8 bits so returned strings must be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The component will then store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * construction is taken care of automatically by the command interface. If the <b>prop_name</b>
   * argument does not match a property of the class, or it matches a sub-object of the class,
   * or if the <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val The value to assign to the property, expressed as a 1024 bit quantity.
   * When assigning a string value each character requires 8 bits so assigned strings must
   * be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);
 
  //----------------------------------------------------------------------------
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

  //----------------------------------------------------------------------------
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

  //----------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PkL1NARGtQ/fe8Z96hU6JEVy3rSnvBrWh4atRTw9zo48vLIn3opULg7+Jit3peaj
UjVFJJYXcLgF5UWaSEjILtinMkQuQloy8uy2wPrzrT/QiwBPweDNv9YwBLm1IF6b
VqN7f01hG9NlTmNwaF3cf7xnI6RCp5nchYdcvtqKls0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 785       )
vGacaipv7lop4qCi3a6+tF020i1b+o6wzLKEMtx1h/kz5a+y8xM5nfkD9RKyNd63
wpQ3wIf+iKHFXb4VYGl+N5sBv0GvggOj/EiwxwnPNMSTmd/4s4YmLxu8RWWPbD9j
zhfXkcUx576FgjhApsH1G6iaJAZFjcz35G8a4b3QLL1WVt2NNEVpyqej0sYsobTB
jKv74bMhvOsRBUGVg5+Iu8oMl9D8/8d6XwoMcZ+p5egd4rsh7zc4lzABxLDQcdjk
7gLUjIH6RuvkvEAHHsLJbJoPiV+zAFZGChSt++0B5Sca8VDm2FDOPSd06+Mn6IM1
763qh0A6RoMu0qAdJBOQBzme4epSWaPqxk1lgHYaevjeuq33Ix4cxWoxXSMI1QO1
ZP8ONJvu1GPtNVQzkxSwD6MkEeAS8uwPJ2OEhTZ5TINVfE6IJxYAw6XYEmfJUpzm
gT0Zrip1nCK7ynQFEbVHYL9sRURpZpqnfrYaMFFSWpWVEka5ZvfHHtHGd8BgfzVG
nJxUxyWLkSy5F47mbh4EgFets26GhsfTVwYK7EiO3yQnv1G1ZySLo+mX7EGivhNW
vqA5Wr+tSp0JZht9JGnBaELeAWnhlFHCHtyDjonWFTDwQ+Vd2AFdE3x1rCpi1ls8
d0CvJiFKKnzXxzZh7OkBZjuggKdVC+ixqCM+LKP1Ov5rhR/kJGmdmzuDanUJbd4z
kmlHRgKUvCltkl/6fZp0vy48UJeqJXZe18k0zbbLUL0lGAANJJpg8W18nOQ0V5Bi
LKk80zY+zb2XVrw486rEzVEMNFwC1ZtuyaW7VKNc3Qx+Ti2CRp1/VxmxTW3Z+t0n
DPvF1+1C1qNkluq8bswpBb2Vt6UU8y277M2q1rV5z9SmYlRGFHojXmqJ4oY/FpoK
Kpfivu0xt7yEgs7IBbeLdFtko6AZmgDS6Fzrc2kf+aiCgXkqqNfzrfDFAE9NdmIZ
qNzryu1xhBH/z80UzJDEdzXLsg1X5Lc7YfZmknIzBWf8iI7foh8Rs5XBbUPVKSZ5
2Ymvd9Sv5EdVZfsXSZ4WXjKKaLig6sluO9psqVh8jO0=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pBostmduiF6JyojnUhrDmzR/Gt7DBZsL58ytBuccHFF5eRUVf6PWWy2lq1TOhxGZ
5avqFlSHcECjU+i7rDvTxgSqr8b5ktxcFdo98CrXDqkJaKbyKlVPjlV0wTLfXC+Y
jNQd2TNRetLV7hl495NfX+dbN+Gc6OAce7urDAmvaBQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27894     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NQ6BiO4nS23HK37DUsKhVJv1bTupIpooFR+AWDSfuaGtNw7xOz6kUjyXFt95sygY
cEd57JElHOKfSvSF0NG9/xgDKticGSPfSJ0FgPZRtcjw9/kyFwW1eWOrMvB4DVEh
AphW+9ADU9QhqhtWQVvTa8W2HkMJwchq6ThLbN8sfGU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27977     )
AMCWSCSAr1oJnsHIVsMySiWSIxgUhM9Ga8C49JF6NXnQnj63cFE4mTLPg2TBA0Ll
EkHvXrZqnyaysn+uTtQxIj6RWyNW1qDRa7rtzaU05nFMmZovWXkbMWhTYyGetGr7
`pragma protect end_protected
