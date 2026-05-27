
`ifndef GUARD_SVT_SPI_FLASH_MT25Q_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT25Q_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT25Q device family in SDR mode.
 */
class svt_spi_flash_mt25q_sdr_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt25q_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt25q_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt25q_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt25q_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt25q_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt25q_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt25q_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
/7PKdOX+yofKW48lvjizIlbPzJSvu68EBoCnXSOokjUf3ymZz7hvbKGH2+Nv8NwO
Vsz4w/9Yb/5ipG0mcOTR0VObuzzxlz11sHN/u7qKAH7e8GDYtsKWnrvPSRC5uhWp
YOOMSQBIt768n36g2Nd/hpYLA+fA/y23Eu1d2Jaqqaq8m47BHzo5qA==
//pragma protect end_key_block
//pragma protect digest_block
u/wXGZpbGbtomoM12ZCwQ2VRMA0=
//pragma protect end_digest_block
//pragma protect data_block
uMWftcq9Y5CLhmiF95gPZHlTulUSaapbv0/FfrYU84Y0r0VHQxySWb3Ho9MW+B3D
1aTlJgdVVIqkCgR9QXs2ox2g2OnULktUhHmEONE/CX2Zv3YKqqUCgxuKBxw20h8v
NNbCrEqcAqiOVSECrdlPBQrb1wZZw3AwcuJwtMFBPi201RxeEbTccqr/WljWrhF6
aoBio+xGrA9c+wZmL2hINu3yujjCxhjMr3bbfKYfMepXymk05ifIyHe0vEsudiHJ
PqJQ4rU09Lwm6QQNDndDOInJ3Bs7lKiH6AWjbjlBz4BOeQCdOwdX8/9YnpQ2MviY
SeR/MjlVsQdadCQPX1wK+E+9gMHWemEj0ddupv7mH5+lsdkTZbf6QH02JVCy7oBp
UQNU48JuveFW9l984n49dB2mjXY7AnbbrR1WdRn1Cm3wpCCY39iVPSimepJIAhRU
XZZSLFYPy2Y5uo0afF5KyagVTB3htLtw7xft1t3t8CZ7JWf+MxIfeNoOnckwuPi/
bPBsfPgsldNXF/CUU6XSltILH5uQKknYuHqyGgGngCRFjET+fJLs3eCumiV4tv5h
vk/Lkaa6mw5Z+3rl3kuYPkdsvYLnaKGyteVG+b0FQHZ3C+MoPtbpvI0JUEbV4fHO
c9tNzTJKfS/gQONe/5jyXz/h4fsilXkUwYLW8DoaMBIoNJ89g2GVyLfxp/UkVaEa
XPFX+Muuu8F4CggKElZE9Y8BKBxJZ0jv7I8DZaeWyX+33W5XD0fO+2SfoVbH1VGV
YVlFgEdlKTiyLZ8nmk4ML5qsuClgDXIRs7juG1T8mY6rhoBSRqW66n6gEm8UThtj
2xeMCgJ3/HYLcx2BTY1wq4sOK3A8w9RhUgAlGuN3nxJo+Guao4nDfjZ8RDYcaYDC
GW1I0gA5Fs0FkhagSydf367p4AZEpDT/aNmJvTbsMpIUKfYkoZwC3r4zTgk3Djzd
av/v8EZbWC8Ods1+US2qMVTEMDbn2+1ay1fB4tY6DZGxoeNo8md3amkGLPZD+9Ra
kT8mN7DAqXlbB2LMMg8Bmi+NNVNDKJ/59gLUL4diuLlwwqgM0pUiPzqJMJfQLrVA
uKX98h13m/LM7urEK3j5AvoH2/rAWuXGDRJXcvSG1uyyhfGDc75iuY5+q/Y/C8PB
LlmVnubGI91JM0a1mGZHKqGnZvE3wZVTntOoYjg/FoSU2WAUnM4Wd/nS8EelSvZi
3OYbB7J+qYZ0hSoARJBhW0bv63OJyC0gXDivFO9pz6g=
//pragma protect end_data_block
//pragma protect digest_block
D6Ax7/xdp94kafERZ8LG0agvFHc=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
1UmI9cLcquiwGsTmXXWyYaxtoL1JJZ4DvmXcVsweHTmt6gH1uxVA6XeVKTh7mvOb
TfJufLo/PG7lNFJ1e3uou+VFfn9THu5uPsxmEDz4lA986OA46VXBD1bZPQwmDEUT
H8xcqzKE3RyOP4uyfm7tlJNoi349y3sTIXSKjclTT7IeD6q0+78SRw==
//pragma protect end_key_block
//pragma protect digest_block
C+xPOs25qNSuuRW3H61zIuBlvR0=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
18hR2pstEyw2MfGsk6txciJKvC4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT25Q_SDR_AC_CONFIGURATION_SV
