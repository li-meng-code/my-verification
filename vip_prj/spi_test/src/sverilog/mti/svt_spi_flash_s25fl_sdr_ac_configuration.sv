
`ifndef GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FL family in SDR mode.
 */
class svt_spi_flash_s25fl_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCS_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tCSS_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCSH_ns = initial_time;

  /**
   * CS# Active Maximum Hold time
   */ 
  real tCSH_max_ns[];

  /**
   * Data in Setup time
   */
  real tSU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tHD_ns = initial_time;

  /**
   * Clock low to Output Valid.
   */
  real tV_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns = initial_time;

  /**
   * WP# Setup time
   */
  real tWPS_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tWPH_ns = initial_time;

  /**
   * HOLD Active Setup time
   */
  real tHLCH_ns = initial_time;

  /**
   * HOLD Active Hold time
   */
  real tCHHH_ns = initial_time;

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

  ///** Assign refernce of svt_spi_mem_mode_register_configuration object */
  //extern virtual function void set_timing_mr_cfg(svt_spi_mem_mode_register_configuration mr_cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Calculates Random Timing Parameter value for #hold_assert_to_output_invalid_ns */
  extern virtual function void randomize_hold_assert_to_output_invalid_ns();

  /** Calculates Random Timing Parameter value for #hold_deassert_to_output_valid_ns */
  extern virtual function void randomize_hold_deassert_to_output_valid_ns();

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
  `svt_vmm_data_new(svt_spi_flash_s25fl_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fl_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fl_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fl_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fl_sdr_ac_configuration.
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
  extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_s25fl_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fl_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XRAonTWzhdEwAlTkvsvAqQmrSFA3z4JXhCmQkK9wSwcgqI8iFZ9wbIEkUpF6Y2Oh
cbDM0yE9bkODdJH1fG8JRUkZTAvSjZqVBHP4j9zNgIgHTsw+KXvZlYKojPn07bO3
uh2LKq+eH+sPtTrTe+5YE7s7/bJBfN3SKJsTDKNRv8o=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
qip2UoXkkho5sbjlmJggcksIP+qt4S/CcApcQI3lDbXPyf/cAvwqyI1H8k0bfx0n
kCHRx1VqfRh+BvPFgSyqVwsxz/Sck6pFv/qv6HCooyHJjGjft4+/A5RlQMsGYH8Q
oEAGirq8sJVBYeUVCmvF6d8kZeBNjs7q03+Kv3vKSDEtSQWR+I6WD0EB0HCGX4lI
TH2A1oGASqB2FlgOKBCnJ8yeh1JO67SVdU0TXXBwLvyDEVq0AzfpG22SpQC9k5aE
b/Kr3K74snVSJ+g26n08/q9FQt3Je4F2aeiJxpqq14DGzOyeXZu5Gq9OWsoyybvk
qh6nAB15zEA8ZE4quDd3t9fcSgQNa5KCTMY0eXdj3M6OjFPNQKvsG5u0Vjj6y3dF
x2LEhr5ZnRfKsPT1a6AvYCbxK5018hO8oGEkqHVphyCYk2NpTbbfdKpLuOedEfao
padH4YFyJP1XXXEvG6woJedzVlt/4Ua4YdmUFHdpJGoVufGZK4TlwF1AgT+3zJrY
vt+RBZ1K3sKftY2YVJRbxsT5cRgv+qZ8lIvvuAlPbp+dfjm/lbegoFkSzcXwmFQ0
+KXXQ4/m++gVsA1bbCXXtcfLfCSwMhEC3Z0MdulssmT30lKZMkr3MrrHLWw1wsyD
YWWFJicU+ng7YLgtdDAO8tVPT2rcE0YFhYY9YjK0LgwpNwtgwnwuBIGArXrA2IQD
PESYFaDh7zL/AyT4ZwAu0gnOnwMiAOjKIImoWg7Bl41RbEegiYlKH7miUlpSUVUc
BKlwPiLy+cX/DOJ6WDQ/HiTEWA+llp1c7xDDrD7FF7Q2UZh7s503Hjm7/6i4VxaD
RAiwMkehTmzQz0OjE+w5DthZhzZN6B64zttBv4VkT/r+VVkV9Zbu27dyVDpb3/UQ
R64XyXLLZZV9rIICeKr4U9MHWdC7uDcx4L/ItU26VzwXo36EGfXL9HjvpoVoLVA5
9aJjivASECAXJrq0V5g1lYf4mAPml79jPhs78pbLp2HUHdyKehpP5Ws3fQYL14cZ
aqW9WfcbvZVUILPm/L8Atg==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
C8zmA0y7cKQ9kSuclP0CYrg/AUdJl0dxCiJDAF7qPGVPPNyOAQ03MNAGxSpPoeKA
V1tWo0Q5EJIxIeYvy88wZ5Sq9wAxtlh8/PiMENLhh05GS1Bv0U3CfyNy+dlipX+C
fYeX/DDTFHMx546mTly2Is9N6MyaLz3FAr8KnWGCRBU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 32637     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DltUEfvZd8ybp9Z00CVp76uhaeZXL6l9oreECTvoi1FNqBL2DcNpvR8EK2n0FXvY
mtgVhp+bM+xeHowBqDpOa2DcKVj3zkw6DBbTvjcjxLGGsp5OOPo2hEoJAgmqfqlG
H+Y4FlkEkrvTvf0cgUifutUiLyv06Wiq97X7dFALHZs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 32720     )
GQPGYqxz/A4jz539byNBQPrMTfHSzZbhkGzP5AeRoRfHLmnXAtJCfV/jtanGiGYs
FQQjAM4ehqewM1gSFIyOZVG8uam9Gvs4xSiICB4y8o6wgoueSjck4FV0ZeFqvugu
`pragma protect end_protected
