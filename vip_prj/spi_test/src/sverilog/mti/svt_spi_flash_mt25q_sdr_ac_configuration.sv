
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
C6i4rb25qwksmX+UvEyLkyBbyW4ZMTs6PNvqpCkbGCtY0EGRefhhxRnzN4SuLSlo
hEwWteieE4E0FgYhwROCyXxAWsvJfP0ESg+74my5qJzvGLz9q1ghE5ShoGB7f2Yj
kGaKzbY+At/p/x2cFcjSGCwFN9UqRQDKSENmcOB838c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
mvDmGrDSII+E8KFlyHPylAEH5kLmUVCmeJfBvm6WeugcaHbvRa0iqOJ5tUaxYs2c
T8sNyxdoVrHoucsZQ7Yci6DE7fHqWDJ/mMKgj0RrWojeUgOTd7Qvg85UbVRcVxsW
7tDO7o7V60g9iSD0I+D/nbKW6lYwxvB4lHg1bUg8Z+Il5bAeNF2TsN9ANbT7nDxo
aw62proIDYiE9jIfhGwuID5XMEyz12PVsaj214cmbC20RsnHN1duAOp4c98tOXV3
cbi/4xWRzjMUMTHZLQr0S7JWC92oyeKxavDXfCVV93vpzr311BKEDAGLAOSgnnqg
1qWKF6IyawK9mXbQh/cZHiaAjoau8ubskkqbq3V6BtXC3zEo/UE7SgaYBVeo9IAo
bMgLPZVUhwT3NR+FhjUfHkjBl3bcaQF2cHENehhSMjzmOBDogf36v6ShISe3lSjk
6eV1GORpvR6hV7AG8kyZuiBLY3GL1MlOaHh65QKPjBkrFz9gb1QcLhBGwxKfyMZi
FwijgqgH8Pb5h6qb0/yRFgkiYfTmNuKaYpsV/rEAiTI/0IxIGyPn3D6O4AKaDH3N
ignzl9hYvkjMyo8Fq3r97ZvNobXSZZoPY0SjB+iaou+mH/iSqST6ITJAQWcqFMDx
ifYzDisQtKRh3XlOmR7HqjD4rN+y8cXbXwAXph4g04o+BmIQMjOIC7JEO//00IFM
7Bdrped6B0Vunu/faANggql0JSZEOxucbtBTE8OqGXPS7Lcx1moAQiezPWVpl5b+
iCQM8jfFVvKk/nwdOisFZDQVbhdTsxCHNMTIufdFphAFW2I5/NzjymXAPtRr3P9j
08afixA4RzCfxWgcnVKSaAuFAqiryvuyDG8nlVjLS5X2M8o8bXH8XmQ7f1ar/Tv8
a+vVeNQOQbag2OrBiqEFuXMbjctXVD+mkIlA8Z1l38RXpSMogDPlwDAfoAorO0iD
LTk1rBi71UOIowz3WblFdQuU3BNQkgqGc4FrftgLATWJAi4QWrae8Y9UgX4rMl4D
3gsW7B88XJp4CP5c4Pl5Aw==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
i3CGTm8KWQd5sFl+E+z4hd2Ek0izvucNJ14PqOKqdEmutnmdVsJZQjfWAsWnOASw
dpGsBNerjwNsDhQBX54B/WaQbvP0MYnLjYJ8VY8IkuwrY7s9eX2bWuC7WD+5rBhh
5xp2cP3LJwXxA1nfF2AtitPLoLdKLNZOqpsl2OQcPRM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 30058     )
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
V6FgUoejm8A8dESuYWze0g==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT25Q_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fIcp2bvgWc04N//bOGpLkouYsAFwHpURKdiAiT5P/dvJwZdG5Trdy0DCfYtSCYE3
96ETIdzvlh+76pB24FPU8dmuklBCve/Wd5BYF6PzNnhIy3m3bxShxEizPI7RomMz
JufP9L0ho9Zt+S9ykbTI623CyBMKgoIbueee5VLPb88=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 30141     )
B/brwc8jxa2gQfyEv+cx73lKXZhycpj1RyTlCI88/bVYMVTXqQGZsBu7q3BSezg1
Sd8HldRyFuVuIJxyduqpR/uXvERfA3vMnBc0oyo+HCL2lqiBEWl/K8ihe1haUR9e
`pragma protect end_protected
