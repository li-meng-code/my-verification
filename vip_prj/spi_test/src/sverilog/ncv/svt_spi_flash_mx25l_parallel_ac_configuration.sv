
`ifndef GUARD_SVT_SPI_FLASH_MX25L_PARALLEL_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25L_PARALLEL_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25L device family in Parallel mode.
 */
class svt_spi_flash_mx25l_parallel_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Clock high pulse width duration.
   */ 
  real tCH_ns = initial_time;

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns = initial_time;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tSHSL_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tSLCH_ns = initial_time;

  /**
   * CS# Not Active Hold time
   */ 
  real tCHSL_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCHSH_ns = initial_time;

  /**
   * CS# Not Active Setup time
   */ 
  real tSHCH_ns = initial_time;

  /**
   * Data in Setup time
   */
  real tDVCH_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tCHDX_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tSHQZ_ns = initial_time;

  /**
   * WP# Setup time
   */
  real tWHSL_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tSHWL_ns = initial_time;

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns     = initial_time;

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns = initial_time;

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns = initial_time;

  /**
   * HOLD Active Setup time
   */
  real tHLCH_ns = initial_time;

  /**
   * HOLD Active Hold time
   */
  real tCHHH_ns = initial_time;

  /**
   * HOLD Non Active Setup time
   */
  real tHHCH_ns = initial_time;

  /**
   * HOLD Non Active Hold time
   */
  real tCHHL_ns = initial_time;

  /**
   * Minimum delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_min_ns = initial_time;

  /**
   * Maximum delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_max_ns = initial_time;

  /**
   * Delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_ns = initial_time;

  /**
   * Minimum delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_min_ns = initial_time;

  /**
   * Maximum delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_max_ns = initial_time;
  
  /**
   * Delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_ns = initial_time;

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

  /** Calculates Random Timing Parameter value for #hold_assert_to_output_invalid_ns */
  extern virtual function void randomize_hold_assert_to_output_invalid_ns();

  /** Calculates Random Timing Parameter value for #hold_deassert_to_output_valid_ns */
  extern virtual function void randomize_hold_deassert_to_output_valid_ns();

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
  `svt_vmm_data_new(svt_spi_flash_mx25l_parallel_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25l_parallel_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25l_parallel_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25l_parallel_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25l_parallel_ac_configuration.
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
//  extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_mx25l_parallel_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25l_parallel_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Z10ED2nRicFPD+DHKF18A2lrMEqj29KIAs1JYdpKlCwNnbBPxl18xxfGZ4NRMufj
fSTxiOWzeu/QAZ1Hjj7cIXXol4o2P1jI4cJt/WjeXOHk3Oa6uj+gVOpWrbNkPf35
lFVL/xgwrui5ZgGWE2h5UhNt3Uc0UzS2lS73fkEVImt6M9VntSvMbQ==
//pragma protect end_key_block
//pragma protect digest_block
V+peWMZwph62VFYRBsJSEV0D3sk=
//pragma protect end_digest_block
//pragma protect data_block
nIgtZ2y9HoAZB1639vfRHzgOElRHHno+/6rHNx2t1H6yrHSvXsrsqClLDXlNVCMj
fQ9AT9ncQfrKhDnVK3gowvMPx7b4oCAdItRmAor1DDRk1wpHG9WetJCJ5mYxh8M3
lfx8w4pAp2CC7wE3aKadlPRWSDzvY040sj8uOgOV2KYq+I9ODCukjI1OxT4NfOJj
vfP+LdYGKCtt9b1xcl7AJiLIWOu0wrcjGOB+wzQpSQeJnp3jnX1Vv8W238mY9m6J
oDJMaK/rylht/bzc4oTVI/6xLuJoPcav02r29V6GuYbn5PKhp8SiYSgH+SV0/rRV
W7XYsWoexStuVub28sHn4Kibj3AnR5TPbmia5VP/sZRITH8xSmqy0ATPEAMp2rKE
VsmSNre88cgH9xqqeZRKILKxV0KcNJ6Lrsvl53vg17EL7dRH5yJzwoMsNEv513Qj
T0a814HrJ8v725oZtwvY0zjg6Oar2W/zJJQSN4l6x45fd6UZDuoWb2mcSSoPqIDo
FRJhH21FodndUVh0uFVHqkgcdxchibaY/OEMulzZ7dAw+B1uT5u1HzkvRQ+cRJXQ
AZiIqJQWvs4h6O5V+pw6OHFRrnaO9EM5pxs3JyoLAehVI0UyhewCbv/rUvWWUsQ8
JMZeIjHZM2Ma8kj4/c8C2gxNBqzjWDYC/PdjgzLDC4WD9d6FhJcTlG+xEUOhImEN
3MOQvLsda02knaMywJ8nBuqxRpWv6aIMjwE+lPviGwQrEVkm38rzTYCM57qL73NU
2B4ndrshNM9zWzjIbKmdHijQS25c/mtgdy5GVDLIEb6kmZ8+s3gNZnaYA543LOR4
m1rn6JvI7kOTUFCazwYN9sTzn7Z3dvk03TDqV4y6vJf6hB5WaT/SYX5hQOaDoahL
OKRQLn5JtzzDljg3NRX+BTjuS3Rci8zGhghQUyYZmeQDT/81WVUkcElpZZQHnNUs
pR+7bNTw6gMaVASpwQj1GBa8krkGG48u/Z3lq8ROiPmJWU1Yv8Pr+7kX/HUgXMrW
MFIs/mrtAHLryiZEMRfi9Vg3rxKPpyzSZz66M6jvbaRwvKAvxJ72V/1VJMn8uiul
CqohJuFnWJrKbtL24GC9tgRTbJZHwq8gJudeI30pBWDTbEMND9LWYz/zt7vqPKc+
OP4TzUGB46OyhlCvVQDLrjKFNnXyevRTmsSMowSPjFGgt308zi2tuAqw/USSWPvB
NFjH09NbvSPLS3syiWcZEv1GN6mnzRmOqjgcWoOSoj84kowH+cNBbvuvE1Rr49rS

//pragma protect end_data_block
//pragma protect digest_block
uEZjgPiBM/ErG9z+fejnMeq19/8=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
hQbXB8MUuTlLrTnK96S5IyOkNtR7Hj6VazNAv9/xjb/OKGEiCfm/Qt+WJlQQMn/3
zfbLRqWmE9L5GbflRwdA9uvCRc0y5HanXhmJQsN2PGhCBDl4qWI05VEESa+Ppg3W
SXx24C1A7/ZipbOtggfHQIw3JWfzClBsI8npzhs4P+v7hhbtG8V+Ag==
//pragma protect end_key_block
//pragma protect digest_block
YdfpFW6OZc57PCUNo8LYTLvIRwk=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
TJlFNOsTp8yzPgamq06GTPM9gxY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25L_PARALLEL_AC_CONFIGURATION_SV
