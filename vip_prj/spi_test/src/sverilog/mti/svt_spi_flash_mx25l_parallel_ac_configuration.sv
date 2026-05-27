
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MStXww1eIE2BrFyZfRNXsljzCMvHMFA7+ZuqCBw6cX7/R+hPlOG5XklA2e+JeqW/
VIIA1zx49liW2kMYqiRtvWbyvmLXVMU8mtPzi4qveU3on4qtBMscDHT2Bt9xct0a
+90MBcBMAkyIY94LeT9oHEUKKG+RMLA+mA4chRg7eqo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 789       )
avA2zgbdWp3YBBzzj+/J0q4ooAbxHhPfvhrTdOyKLWEc0ssbkjbVN1yW+JNtTUwq
gcaliV4hYZnZFby+6EZAAC/gYjks6GEdiYqUq0ZhusO0bPpiKaks+Jtt31xIO6u8
gZrLoADHhFKucEAd080n0uqW3hWG/wPYPH24jWbEm3ZsII0kB0nfBeDl4AhivPab
2K7aWT7UGHxzdV8p6Y9rLaP7ww9sNUSkm+b5tWx/xvswqZ+pmrndphpOCFgoTSzx
nzzxD+bcHEU9OySp4PVaMFy87NH/KW5e1LkA7Y/iBbdD3lQ4w0v1MeibmQwNPdSY
QNGJXrISLwQVcRwKnv3wcl6CYRUK+FuJFTjF6KoKW2+lDAT7i0tR1d2okgEbNOpk
mE3gs6YM4L/w2gyUt2P+IHrjvDBjXo273PwFF0fP0PRnylkktKeqHCBKn3a4iHlR
CoejIgc/LGWVg/D+IGt+tZ0MZqQNsuqDGV6wroh02gVcIZgAZl+CSksEuGwSKXI3
/O5yPKSeARCcLVUjhEHnXHW9XBM0URZOKWdFa4t4AoKzlIkDQoM/2uZ4rDFtcTks
FIIm5Zy/mX5DrilZRvK/I8WjcTbYmxi9dHtzgSgBQzyFcx5k1TjMJJqhi89C0oym
ILtzESZxKNhT/0acBtcMWpFkrvNCcthPP0gPUiNHWoUej7F4RCFpKs/vJppJbyPT
K4Mvxv+ayWAJeiqHYZU2Ks/oW9WGNIBe+b+oNy2/zmOskRlBRHhajA2S9l7ukF/R
jYo5cbZDwllK5WM+zAZ35z1/f6FpR88Cv0GwzhrP4hctEgMT8/BKmfhOgj1w2FkZ
395XpS8GLuVLvqya5dDMBXaOHDpjxSFOCHfeBsTGv0LaIytRopjQY1RBqpn7/ro1
pRhexNrBMmCK3S/ad5Dh634qI8Sw1l4iS9Ub0pbeYmYIMFq/ZHuVc76eFDw7OIJR
GimGmKEB2YAvXjoaaOHUJpe4FJrmVIvcZZI0dlTZ+27idvgbQS2ybJJDzucYsOIX
CvKo+CsIMUqhTjKIECv5Q2vtVZZ7oEpUO0BUcGoZH5A=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pIH225fBOOXL8daLYueq9MqbcT2aphnu0DC0ecSZj0MDlhDxtt2nJjEC8JNi/w1I
2zi58Vr/SC4VBP/B9H5PNq7mipo3zB3rMlANX4oXNFW633TjoYx/x15V/9Ie9yZT
QXs5AgyzVtMzvNlXSLJpPk2fHpspahf06W+WxJnvqB0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26009     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25L_PARALLEL_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nDy20SQpIyL1MwcbRiHGWqc+uICGMI8blcc8js9NDHx8NpOiTzIGVGzUHk99ZSES
cSlbsTHYCZ72AhbNH8Wy+n+NPICscQ9+uvNJBv2Gte0Bu+83u481+mA/4qbceYWd
gwfHqUq+DF1qvpXIsqOaOPWjgai66Nsh4fNOm0xzxiw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26092     )
zdwEzg5LAC1ldxP3vXu1XR0kTTy22LYGeAGv+dyhrtQzK6UdburJ1UXVL4hCUroV
AhigewKmFMRXZe+hDFP+qU1DOCyUTuRHicP+/XWNUIhsYzI225sjCgD6tK5aSd7N
`pragma protect end_protected
