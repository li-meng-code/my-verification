
`ifndef GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron n25q device family in SDR mode.
 */
class svt_spi_flash_n25q_sdr_ac_configuration extends svt_configuration;

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
  `svt_vmm_data_new(svt_spi_flash_n25q_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_n25q_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_n25q_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_n25q_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_n25q_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_n25q_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_n25q_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
FXzkma3v6oht79MCVortxiahWB6Akhqi+oXMU4oWJXxonU85nkxnIvPn3DNI/bgl
wIlXwhfiQVgkLlUnylKSAp9Fm63xfVZpvsF9EMaqDrypqGcLO2NDnqql001eJ3rA
6Ik0UsK7Gz/hlY5Eos7jucE6b7hG4wDPvyBG/dDV6D+JghnGyC4ytg==
//pragma protect end_key_block
//pragma protect digest_block
DsMyhogKE2Yk0L/Rgzv1+ykt5Zc=
//pragma protect end_digest_block
//pragma protect data_block
w16goUUO4xOPvkQMNSlkQY/9/6llptRRNWSrC38NRXmGmF6WWMYeKXeGBhk5JAvy
wlqqHc0CX49tx+njPghQ+7YVy6zc2xxLobU5k7Y0aO4FS17lqDBr3ka7HoHeXwnu
vrz1/Y5mN9hC2RXg6xteF9lna4k0ZjUkTORW3+vXP3O0gpsj+Q2DHw7BLGe0CzEd
B0+Wp4//j0xHA/3ksRXa3xOkIvbqxQ6zyX4AF5VHPI0MhlhBe3EWMMr8rINBRD0u
72S2pxdBn69/3cEpPsqGAHRqjjuPmdISnSjXZRBqIhON9ZnrMbtdzk8ShWX51dxE
4IkZycMsmTj4OoYjp1E3JTO0HuuA4SoeCpqlNFg7Qr5H+v/g2juXdPy+P9jj714i
xek4ekE3j5Wo/XvdE+eZ/3heRz7p9n4R9PENppDi38IV8NDcluW1DVgs7dEoGtyq
6EH+1LWqZznAsk7aXKXJ1LHqwm2LolOBVpoNOwB3coegk0s4FViUJOn30NDt22Dg
OL6RtlHjTW6BFPq0qExSvPcabRks1Yd6Idg1j/OzgErNKB5zlEZr/Q1jgF/Z9k8F
AvyG9Icp7bGlhRTxFjs1952pmRiA3ijtvv3JXkr3lK6zhATZuN96XM8urQ0yidRp
Q4/3lPTnMO/3MgoM35rLP+JiLqWZn+A8iQBhrtxYr1tyO8RHFza5g9wRBfHk7tCO
EHxb9/BqStnwyRIll+hdN6iZbvNNCoxW93SAr3tmBk1MQZPt9F+cFxGyuYOBY7JN
c3L8uZgUAhe23S0+YEtwwAeExT6ELazlAaVZ3Wb/rAVxVniZrcrAhHHPvH6JuCzn
JCPXQa96RS+yOxCckVQqD0XIrY8PaoR8gSo5UmUtg7L5EyHuQ4iRzOB/L4L3z9B0
vw3uouWFD5moaGyAmMmGANPi9L4tiA2u3IFzUPHPFTUV4Cu18zOC/QzjqJ6AiT05
EVEhoTe+smBEff7p3vnsc0DR8TzA8J4lRp4dockBVEcpyWR0TVFJEKYET7xPxIND
HM5MSwPSyOVq6uL9iBhhGcYQIPLgPIIAj3v83uyl3/moL66QLbXINcfka23DUhjx
qqobI2T9t5F1amPHVS79TaYkxAIO3jlaFj3SiXC5u1tRZ1zdoZ8q/TYhka0ZECE4
CLuvzNYgVV5df/lQMaVf6ryhhUcEJe1jICylO/TyaW94j2cAQNi+Rs5/4NHrvFKO
c1h9MB/Fo0P3zSq+74K5SQsLIAyfT3r17//zc0EGzdg=
//pragma protect end_data_block
//pragma protect digest_block
GyZEw463i7I2C1+tH550BEtLl8s=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
zna9mWgnDc4wUv7NtPzpJcQ9Kv7CKkczFEOepw1f7PgPscbUNaJvvjruLJSL/f5i
yrTuuQGLohM+yVcMk/Lc83tkGV3Pdb/dG59BrBbFx0og799eiIM9d6FQtfQNzQ8G
0NzAqNffDkHWKRcOE6kLOtb/LBKZ3cVG+IfwEZ+TBycQmVaT/s9uNA==
//pragma protect end_key_block
//pragma protect digest_block
TvYxiy9vbzAtw2MxWNhl8dqOv8A=
//pragma protect end_digest_block
//pragma protect data_block
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
WdCffRSR/+FXGC7WSyQGTQ==
//pragma protect end_data_block
//pragma protect digest_block
GTRUj/8wGeDEHz/5AGOmajWCD1M=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV
