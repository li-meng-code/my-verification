
`ifndef GUARD_SVT_SPI_FLASH_MX25L_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25L_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25L device family in Serial mode.
 */
class svt_spi_flash_mx25l_ac_configuration extends svt_configuration;

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
   * Minimum Clock period/Highest Freq support.
   */ 
  real tCLK_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD Output command 
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ DTR command 
   */ 
  real tCLK_Fast_Read_DTR_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ DUAL IO DTR command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_DTR_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO DTR command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_DTR_ns[];

  /**
   * Minimum Clock period/Highest Freq support for AUTOBOOT 
   */ 
  real tCLK_AutoBoot_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mx25l_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25l_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25l_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25l_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25l_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25l_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25l_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Fw/R/ioxYc0AtE6iJMjVy2O+QvNiZjzjPpapLfuZRkJDEALjOuQuug24Wiinz2GK
VodWlc0YzmWLu52Xj9JX4QYsVZ6S9p2W2hREU0J8BP9LVN3YttMklQcn2e9Q8EtN
qWd7sqyHD/vTDRBDod/vfsA/leI2vs/yRErk5ukUW5M=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 753       )
HL7HL7Mx4zfbNcfO00wRdVHuTU/F4YF123Ox03J40qLimvmzijXVoLD8GxaJsRh0
JZq75Iek+az7wVGqxsdNwc9v861BWmE/93WMhA9niGlgFa2fuROlzGiJFwJJpUJS
cOZneNl9mCm+Ae8R/xIaVoYcGrGOe+/00dYUp4XBKqI69qxKR+eINKp+4xWMuNEy
jT/9zL+n6QKkudYsR7B0bsqdccclDKKMH88f6aTr9k9mYhPaaiKeZvSfOQyPShA+
Zr3TONWm8Hos4LeT/7IUtUJyU0OTOPwXF9Lzn4S3+WseAi41ZlMTEPO/Ekla3mTW
z1YKl5Kwit2mnXoQBmVWlArsYy31x5RaMCpKM6v+90wy/Fm6VvbP4IilKnW/UsFV
HaJkKXBHJHvs3DSRnRLh6TetnRZ0ORyHIpu7E61riesPdH2PF3VF39L2nGh12nmf
N4LMBYPeg3ph8xb/RsQYDnEqiFn29xDr6AcaPqVb16W+otwmpEedsReXVvG32AUk
I1utfZNpmQEE668sDkaPWv02/0n8MPiFuzuNWDETb4k8IyHpGjy9/+ZnYK2MByws
/NQEf4NlGgmtGa3H/Vacwr8qWy9DVCEBfSKWaeltdfLLSuHTbf4D8ClS8CA69oJA
MElGQBWd/s89Et47ojkL8z6xlHkDrM3yW3Hw0skSBoIbfSiu29HjT5/c28hVsZWT
8y80WRUr9g0AOC2edyVFL0aHxN8fNn2UQspl/Yd3kmWZIiZe/tZRzFxHYrFSAmKp
y793ZMMd8dM4xw2iJ5yH1tROmUfgPnf0mhVkvqx8RxAZAbQiPbDD0Bf6ktm/4YCo
7Cw2mypnqK0LFf7riBDwEJjeRB3xIaYeGEPOC971x4oNmh/5NJNtIPpBSsX0m17O
5ZioB2+1he8dW2v3+/xYYthKtDfGeW43RYEy9VLUtsL0+HAfnLD8hMjy/QGW5uEB
xe8RzL4L0FB7MRs29AjAYldMVzAnwQPw5kxCy1qUl7BSmzGxqie40xxoRJ548caP
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
frH33iMrNZeJI1YwiaSiXdkE59cuWIb9guFIUSuu8fawz9/zBS91ms6pr1Z+CdCO
oD0NiaoD+8HW0FHWfnPWV/jZs7JduDA7GE2+38/yejRH2BDqn7lF1eknLGT1mVYw
x/ix/bLa8X7SLy27kW4k9ItHy927TM7SEe+qCKInN+E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 35343     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25L_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OOLLwr/e4uV4KnIrceNATnfDgmFj0fclWry7/7xOEGjzUmuCly93IGbjEUfOH5eP
8q0gUcMXlYGIeTNEruL5dPfOdfals08x/GdPs4r9VGSfT3KW/zQj7m71KU29Ns6J
Oh5PRBmrVLC94GGbXvTHfXwKDwdwFkj36xN5TIjU3+k=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 35426     )
3yW4dLFjcKklNuBGaVIxPWrbOGWpy3xUIkyU3FT2dJW7+57mb8WxjhcedQLw5Rxd
6lAI2iCUQs3Ro1iUr2odhx0C7q+Q5q6p9SDfqm/tPGslQ0Mh81OHsSF4r6d6wnbH
`pragma protect end_protected
