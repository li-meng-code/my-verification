
`ifndef GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25R device family in Low Power mode.
 */
class svt_spi_flash_mx25r_low_power_ac_configuration extends svt_configuration;

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
   * Minimum Clock High pulse width duration.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mx25r_low_power_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25r_low_power_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25r_low_power_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25r_low_power_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25r_low_power_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25r_low_power_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25r_low_power_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YvA/eXg925HbcKel0gjfu8IvwEBee4ZBKV4pMd9hMRZZc20aDGjpmB9Py2AmAYOp
plT+igPiz3Y+OpMU0Nbbv1v4gdVIkFpKWKvV5Vv4uswZ1pOaNf88Fk1uDXn42DwA
laeKXLFJSz1hY8NqJG9SIqFFRm2VIgRJIcD48YT5Y6I=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 793       )
+m9bSGiS/WUlA3mMl0Gnt7XWUy2WsC81fsQkqFPXTZ4HnfQjRYjzPC3OJwVwUOwa
tj28QAmbkhBADPGd32uNpXBKr1XVhMq2ELJuul3VIyLpz0s10qxIAUyeFjjGRa52
Ju5F904RzXJJlD2cMVdWKOyASIDunNbvvnNmhpqrhlltT+5muUlt2jBuVCBi+79u
kmCC4xW6CHvx8hiotQsuCMgFfFqKzlpNKrjAoIIXnF45SuToMv3g1N6bSojxSzEZ
DuNlLT9WguD8YssvQgzqcFuM+vAnRhYEyzH6xhY5ZMAS5QbtvfrXj900waGabKuG
u2R97jVNISNOGPYI/kPqVZK32C0zQdTuRUd/XmB34+DhWDHRk5VMoyh+oMHsnLNZ
NJW7kOskDfHIdJBEU8K+oalaYb9XblM2TE5nSwtIrYS5d8ZftqDZnSMEpv47kATJ
pVjzZKusBGHwIGGCz4f0C+llqli/+u7Udv8BU42bNQkA2/cz1mijtPd5nqNgjuE0
Yd40/QsFvhLGC2Ny1MdAKQ87jb6zhy5r6A4+v/QAhdjXj8/iyuBGPmPxJOhTBS+6
wsIMd+wdjpBaxLCosLKzwZPo+/X8fKsuRCKmmZ8rAV19PM78ewR6ccl6KR6+OMpU
vhbOvpqfIh7BO2JgLf5+JTjPBQLPb8xeHbd6jiricWnwSgl3/3GfkeX5ciJ7c5mz
Wf3Kl9adw7MWfYXVIyTcWcpcxMyBJNeKn1bwTSGwFhNZserLIDmpSLn6D0E6zcHL
Y71XHHJ0aBQYXKuq0+EroK9rTTvgdI2CXQceTDMpQcQSoFUwhqGQq1o+0wnoqLbA
SwXWwe+7vYmNsWVOq0RROZSO4ysqgUZW6pV9FFnMImAplINvsQKlXyd34+QMJEic
+B9hFC2aZj1myoc8l+lA3EyMFVJuFVUl185R3qMxHiq6g6LGsR3IFqo8U+PZLn02
s0zxEx4a1Y5CeYgirukARV3u9KYuqZohwViczBPRYD+Q5PejI3nJjj/8dbn3Bgz7
VVYCNTI8wu8eVHvxvBG8/EFCx0CyF0COs+0Mv0fB7pg=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
M0zPfwrsp39312+9SF1lwwLeoEuNxKOgKLReJQE0QqjIOX3suRSngMzav5QgjGlu
NULIRPiciHFGedLjRr6knCGsxHRPuAKErhm9dGJnjNYgnQSvWxPwrb56nuPscI69
v/XWwMAaHhkzrPt7JQKltt0BpWXY6niEfLLzeApl6RQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20640     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
e7Exef8ZVThjHPMx4IJrLjrqggdg1um4SK7my03QtESkC7yj6olf7uurAKfFjxjm
gGgnspjkisLx0G3rSnYPhoOj8r7kZJmp8OVgRTLIQ55K1xSdRoCRm89a8u2BwvdL
u1UnAmgTfhZXe9DadAkCXxYskparp/TLTRbmA3HCf8U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20723     )
bnAPZXl6AQG4VNHCKOxWBC7bpVU5QZnqU5wXV7+sKi9a9DjjmCmrjl75HdQJwNEI
nZpUCCebxYlH41GcxWrpoBVFoh5P4cHlbFOAPV3MV7pJLnfJlhfXX5zM+wn51hqd
`pragma protect end_protected
