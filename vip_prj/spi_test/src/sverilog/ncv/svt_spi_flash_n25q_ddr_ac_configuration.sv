
`ifndef GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron n25q device family in DDR mode.
 */
class svt_spi_flash_n25q_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns[];

  real tCLK_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_n25q_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_n25q_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_n25q_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_n25q_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_n25q_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_n25q_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_n25q_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
XOnRBg1/VilY/Txog5Zi0CBGJexSOwmYXWkbraFEBols9hM+Pjc6AauGCpDvUaER
xzeeznkaSglRdPidtC8k0jnODWbSrHWQzc/XX8X7yLuED2AAGx/Z3pAJW5IuV64q
Hc+vYpsl4WlXLU8THi0BmawvpBVMZ01fbFkOmYwNpvc4B9mYW3Rapw==
//pragma protect end_key_block
//pragma protect digest_block
wonjYNzJwOZ7DTFI1DCX+pcJvQ0=
//pragma protect end_digest_block
//pragma protect data_block
ahf2dciPWEBK7JTNqwQ3rFoqGmVPzxofiEvAPs7PKV9GKmbCreSQqp+z4E9PGlyB
m9vwt+7xoLu/gLJhNbIdAF51TSNqEI5MUTeUT0MEYDRmzUocRogkd7QaA/7vVoq4
zngu9RuVirF/V2YmqntUXNK+Jp06FPqjcwtK0LlqyR3i22Ft4E+BXSWERPp3tAbl
BUdCoABdKFYHm3QNFngKLGTpHzr4knIW+p9Z9no95VsvNM/eKcJ6sm+sjbwDkUab
hERNx8CGIdkGe2CcHxdq04yzYd+SEUY/KcM/7UwI9GQyk/EnjwV3i9pZ07zrcNPI
XzD9tqok+kseCV4ri5f/5vpWDva81Jqn3IxsCFdBiE8G+ELWkJ8BCZH52pxBNhHX
G4f6MKsVr2EgejO53WfUFzQqubrcnBYj5Z7hJUO4vgWnk4hTZ8R7sV8SlQVBTPPz
hLq7ba/wWT06sU3cS9FNrMGLStXo828mvm14UNe7Kro1ZpA9WyKNzliDhpdmbJGc
a7/dZuVLKr9VhPvEoxJe32/OqcfeUL8zfCIY8fr2/uUJuVpOPdzWf8XO9PHjAL7o
hRhnqw+/7OJs3ajRgLJtl2/DUJZoWbmeSRDZM6QTq1SbfYeCO9p71kxtq+qyhqSj
eiCGUzx7CCHmemrGmDrvD2SJnoodIGsJHxQc0dusJF5GPCB+QJBdHffRtKv+Lsco
ZjDTcyoRjrFMWPyYZx0T7/PfzN+itLWAPBgfUu5K7RhTrDWYrUvWcG64mzYGBjyY
fBX+ikwJoUPg6++BhtcE5d0C+SsbyHA1smJhcHCwJhCHyY7UD4dppqzYP6RyE9fW
zC2LN2xCrJTo4lawuj8VsP9BbvEMHJxVKkEkfeBMcZ7qI9n6ogAphkGnoKbQvWXK
gyj0bkV555rRsAaj8bQW5bcSCVIkQO8PiMaXeRe9X3BbOVjAYQrD+KSOGtRDp3mz
Nk5NK+5b5mcXivmcDgPthLSIVkoZjFBTdRpVuNiGXDM+IbEOX2QgWqJW0PSDRerZ
axzqgsjnKHRMCbWU55kdD4RGW1wldCZ/iRz6wdwkz8UMMW5c0FX/CU42lSTflTq2
RoLBZ0vsz3zAdGiHlv9wk7EIgTK4zC2rEoz7OT6wViKwRzoULNPWiSRB91RKO7Z0
b9OOxRC0NwbIDF+CfzN53rz353KyLPYxfbfY3tXwklQC3YnZb+lp7CH4XHVaZcD3
Xe+x6QhYXqBpwcwDjWdbWtxUBcMQjxo8Cz9jXfsjHCo=
//pragma protect end_data_block
//pragma protect digest_block
iPk4F7QDbFA+QpIkmcP0XtZal3E=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ArvJdUBJd6TldfVdKlHqOPlZkJU611K9dnuaVjVXWupomqYx8En0ES4WYyFTTgKM
auDC2C9gAp+FuDrm6YB/rhV5mLVizqD3Qj6xBDZRBO56GQYhDWbHbbDr8ol6B+EP
Z4NaNihbWV1Zs7HFuFG3PPUZWXUpausa+5kLixYPWjqZxXiDWKiC6w==
//pragma protect end_key_block
//pragma protect digest_block
5z+SS7iHaRTtKmN/ixvDwxeXEx4=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
5rSYL+5+pMa09JsajfKgI9ge18Q=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV
