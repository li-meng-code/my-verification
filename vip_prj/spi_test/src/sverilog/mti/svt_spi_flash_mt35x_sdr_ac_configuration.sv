
`ifndef GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT35X device family in SDR mode.
 */
class svt_spi_flash_mt35x_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_OCTAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_4byte_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_4byte_Fast_Read_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal IO command 
   */ 
  real tCH_4byte_Fast_Read_OCTAL_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt35x_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt35x_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt35x_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt35x_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt35x_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt35x_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt35x_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nlP+z0BqPNesPjgnqMVlNc5/yreELPCD1xNFZFGw/4Hy9lI3TSa/UyAn61n9kwh0
WyiUE2udRqXv8XWEgYV2i86gDha4TOUXhBFTRGtejJCQi1hJSr9D3lykhrqMHxUj
mULas3mR5WLFnwNidFj2s7Wve3CkMvvD02XiYbaXXGI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
FZtxtkYD6alJ4/E09lxOZ68/EBT3ctG/hVIfmuOD7PyOwahLK0ogxCv5Nq1MWVRi
Mo9HxU7v2A8fZobNC0AgJ9wHye+lluVVQ/veq+kW6W4c5JQeYOJDTE+Dr/pzwi5I
ePTKy80DuRUnrJmc5zII6uRhSSNNUKrZQZq1l8HSSNju+6T21eOwl4GKAENQxqRN
rpl8mxmNQe0fAP6Yx0Obw3Ao8o8xerJKAHq7RrHsKUFqqNtjWOoaqvSJWvdJuCgW
pleWZUofxau2Vxfvm8KBidqPRMiTomM/s9g+zLKabR5EuxCu2wdAwY/lSFiJD01p
zFlwhrPifCiymTSwk/icfKo8ptka7TxB+48F+qCAxSJ+ZfrBsYsu9nKYO4TXbJOU
zZAcnRtXfpYjDNLolNVbTMneMQtCpeYAyhtZz2N282yYU/PNM9A66Vsmx4kF05ax
g0BTG5jCG6RJz0RZwfwAX8ZvNRxAuKcs67mMeLS32tSQiSt40A4puBbuQ1TgUXUx
6bKHxe0D3BB+pSXJjFV8gou+HnIZ02hV20z93Nqq1yDZGh2qtcp2vfBBekcnMDH0
Rp2AlfPUO/vrlfgk2wQCV4XXtZtVZ9qrCA1prSyJCmaVxGzVeSs1AemglSdr8BV+
hNy2zaYN98lNJ3jNus7fI43TPOl3kBkX4WjOrZNwZGpbJRnWubtTySoUhdxNU7GP
ATqPLe2EpoVztlWOr3peNMrbxQoQsXSbReo+DKxBaa8bPWj93hMx84PM44vg17Zs
AVivsrVf8oFhJlFgnPcirG0zfQemoacVLGM1Sg5cPAKiLQ26+yWr55SD6N/rhLSd
QDrzjblcbZ5I7lnw4B0TknXAmJRjWhNlR9vu4yzgJOqRLRyel5FQs3WmWvQhnO6d
HvYHA6SmCgBXtlLdJ+6ArVGdXOEKF/73qHq6N+fm3lnKhh5XZSso7vSeuAbS/+FH
Lu7r/rwMkDBrYfgxUzZuIyvhq7A7S8+iv1OxAoFgR9gwfbTY6jmFHFZeUEngGiAm
6ywClU3zzhImfgiUhpSAzA==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
J2fpf3OPQqm8Id4BWUeuq+TzLrcJ535/Uuw+4iUlLtyH9u+5ExkUuAQHu9QTZpZg
tTYzwLGFUg4YUlJM1Sm0YYFfUYw372A65CngZn/FmbxsKD/Th5IFJSlkDCwontfj
j2uWmAVPnhJFgBAfVTbRLzB77ZdQ5+z3+T01LtTqSow=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26259     )
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
hX/zUfqgVfBAWvs8I69g+g==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CfzaOncXymUGAkkHUw5eLrw7e/yjHIG0WaEuOC09jbbG7eSVp/wUvpbCZulBWELx
pgpVNoBfRinMjIOFjvdfJKfJSrJmSq5D1cy4i17BjEZiQdbt6bthP8oYELyUd8tl
xqA9yEGN6SHVCawse6hWrRpREb/jtN9q8XbCjtH4RhU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26342     )
r1qbSvfBYl1F0Zo2aSeHhBAxT0ppxUFj1PhAY6e10p1/qlIYpA9bLkzv++zt0VNS
m4QhGZwQzhE4gKyAxxCrjjecvSmLzQa4weQkwuCs4xdzQLZZTMvGMTE7kRRnRlRR
`pragma protect end_protected
