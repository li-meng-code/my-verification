
`ifndef GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Everspin MR10Q family in SDR mode.
 */
class svt_spi_flash_mr10q_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width durtaion.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width durtaion.   */ 
  real tCL_ns[];

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */ 
  real tCS_ns[];

  /** Minimum Clock Low pulse width duration. */
  real tPeriod_ns[];

  /** CS# Active Setup time  */ 
  real tCSS_ns = initial_time;

  /** CS# Active Hold time   */ 
  real tCSH_ns = initial_time;

  /** Data in Setup time   */
  real tSU_ns = initial_time;

  /** Data in Hold time   */
  real tH_ns = initial_time;

  /** Output Disable time   */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time   */
  real tWPS_ns = initial_time;

  /** WP# Hold time   */ 
  real tWPH_ns = initial_time;

  /** HOLD Active/Non Active Setup time   */
  real tHD_ns = initial_time;

  /** HOLD Active/Non Active Hold time   */
  real tCD_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_max_ns = initial_time;

  /** Minimum delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_min_ns = initial_time;

  /** Maximum delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_max_ns = initial_time;

  /** Delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_ns = initial_time;

  /** Minimum delay between Hold de-assert to Output Valid   */ 
  real hold_deassert_to_output_valid_min_ns = initial_time;

  /** Maximum delay between Hold de-assert to Output Valid   */ 
  real hold_deassert_to_output_valid_max_ns = initial_time;
  
  /** Delay between Hold de-assert to Output Valid   */ 
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
  `svt_vmm_data_new(svt_spi_flash_mr10q_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mr10q_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mr10q_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mr10q_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mr10q_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mr10q_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mr10q_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fyNckEVGHsCNfLZfRDG3lNY+zbp71dZCZtsO6p0H6ujB7tuqVMtXciWEa0IVKwaX
X7iE40ncPs61VAy1wMBCyOFbzPskT4pctlAl0vd//VNt2r+vFSmAuWxt91ATOtMP
1B5ibnyNyfywIWNoPIsJIevyfJ/zBhJMeRKqPKQMtVQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 753       )
BqRbdIIQj5l7ps9e7n9JML9a4LENaW/i1APYll/iuYZRMkwIKciE/NAAgPLqZNlF
VA3yttI9a6xgcFT7BGPbb+nqd5NstKl406u/WOKgMgWxYhK8K0+1b6qLIAf+LII/
Yf7SvihCyB0v+ZimWvmuTwWBVxIP9Qs0FGeFCpR8adURWDFEFDfYMqbJvAKdvJ5n
K9daDrDZQeD/NRlku6zzGaEFw856C2EKvWSanzHcs2sAgMTSehbU0Dp2xrlnH47X
quJSvHgO5JxwtCu3AoJttx1AwJe0WwPxv92kHnRJ7Pwe2/R9OGzv7sbuY81Iu2mL
CmnuAtDujSfelZVTgR17diQyTdvSYuut1ChJ+/cPnhNoDOAeuJ62sz58oBJhN/7M
x0tmqZNMCofGvwxpCyy0Zy6DnfAUTV+QmFPQCmzCrX7dFlbjsOncL/ybb1LhORc6
79zkDkJLQDfQFK9FiuPp/cF9y5xTGV+lPaVAjv4FWaGVeQpTS9R3hvyc5DqCZFwu
pcc67fnsKEg+PoWiDIwO12jBmGEPa9Aptz1nirjf7hn/66jhQas5FvMQfTPYhOUt
ZGL4e+cEYWi+ZXChiweFXR15Wm9WDpMh9PlEZSyYhzxC6v5ophOuR+d6LeKlTH0m
9/xFrrPfByTAP7nIWtJOSrmrCDDgsCzYThQTcVcXW7v7KDdmnf+KxyG07pkPA7zH
Acr9of52xP7hDYPy6imHnuawvUQr7FctChcAxXqRqlIlsrVj5YkKUJjJwPM5wpoe
nFS0g5Qv9RGBUnVjlbWVFphI9w2/HGmrTq/Y40d+kMBDd5EoLmg2KYA2ABlUWKpa
s1tyx5lS6ogiiIQE94CbBBjptftNfsEjdpIfne1XnHz+TSgJ12WoGhahBIw/wwpf
nXvG2tfU8Zyryiupmam+x+X11QPp88ppnPFtRgXZbeWj2OR4afbGPaKSX+7QQ7og
NZ4ViLAilIbncNaHRSHuSZIZiiwgGnR5oBjpgeLdyvt8SW9eZUxpT/lfuQkXlJAV
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HBuAVUk4SwxROFNFRjVquY3JBNQI0zmOP1raFzaWgR/h+8SFBtS5JlwFp2Rb4DPV
RotTWEP6DrhimwrVb2chgGx1dQwiGbI9QFY+WYjzAl6Ev7wcA5IaezmomUJAmfnQ
1QimLMIiSbvnii1mm1JLZlzfg7nz560oV6Nbze+7uJ0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 30940     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FyUY3tIesJpPkdA5mIsomSMYfO5g4gs0/bveWFqdR91z7xIt7EaCTOpD7NX7roqR
0bXfVNY6u+2RG/NbIn/CI8DNjwMjsEfnWb773ARoyKZuVz0h1Yhz/jj0tXk74WvD
Q2xcwNrGFjp8EI6DME1YAtvztesKWSx2Nrj1yu65vQk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 31023     )
6f9E1cah9g3FMtXBKyKwFYkuy533LnLCjSASgjvOYaA3IZkv5juEvPmbwy+pvYNX
4ZfB5fPVM5MAfpXztecA9/dsrRcUpCecThOldKpjiWNNmUzM+ttDnjcTyj+7ihoa
`pragma protect end_protected
