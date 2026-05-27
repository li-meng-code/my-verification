
`ifndef GUARD_SVT_SPI_FLASH_S25FL_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FL_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FL family in DDR mode.
 */
class svt_spi_flash_s25fl_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns = initial_time;

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns = initial_time;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCS_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s25fl_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fl_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fl_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fl_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fl_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fl_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fl_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fXwohI/1UxDqQTrGaoDzFg0uaXA3H4X1O1hQFazTGc74r4XevmfCUm0TPlIl9156
oEgYWKjMu3ZvtGwhQhWimU6KWDzaKNH7l0592dYv5I9NF5FxsVOCBslurgHl/acu
vaHOquBbxScnBu3Lf7wTaJaEVQxB20cAB7SARoxk92U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
5epEdIh4lvKY14ulzfiPoolT5juVoSuWaS5CkoW+ZKfAJ6HTQhh6vyvQKsNu581g
NvII6emOi/Xk5qV0p5eR2ez5nSbdPdlvZoX3YXu1KkTdoasLzN/SjtIAVSWI9YwT
dwxueCzw6F9U9A3iH68TsutKCgWe+3DGVWXL9wD1U2XzYe4T/KUos3JT3X3b2j6A
6fVtrn4/oi4kFR5mLAVauTccfwMJqwKa5Rnv71aHi/FBc2LVc5opAP9ve3SSKRqZ
u+/7gv2lHSyNNoK2rQP6+Uflp9Iw5dNwVvMkud46YF5yi7PndR8VLpwx0vjJdz5H
ad0ajNUaaLerPqX1zoH35WXwVTxuAJ6iW4aqaj8CYEscMoPfk58Isd0b25AZHkhE
rnlXaN32snWMNvLxrsB4pYx6xZzQQFG5sLQFDpnyWBMhwcDl4N/07nHIER/A9Z1I
AasCRcRJqSxs6UgguorqtXkVqJiwZJ0F0goiVbVXh0+svCIr+5UCoEtfXRUCtaOU
JeEMqVQmmCrs5ZSVfJo3Xyxa3TgWZ/cfCdCCW4tIuOXbmgxkAzfTMNKRnm3SX5YT
XTcR8aYVc/bn6mneMtu/DGnTS7KGBIfr5PHdYq2jikKLIDelD7yIEbCxEaB4tS5i
flXuZ7g0u8mtGJZQv4ZOKdFHeATqd8Se2451/wR00fce3aAd+bauvLBdc33SmNxR
mNCp3IPJNigfLvEBl0yCWhqNz1XU283jjNzsed67t2fYILwXbVp2azvsQVxWD54e
HEyXif7cbMq8C7XhQV+8PmSBdBhbZ8ytD5ohG65773QnX66BNSIiBWgeBT26nIN9
+gCEXel84Q1wpjqdpRvhh0wby6WfDDLbR66GD+y66us1ms7H1Osdlbl3ixt04TMW
0HlKl6JsWi7RdDcuwk+YOA+p6QtBkAjx6ROGgX0vvkAGv5P7J2PM3Q6jjSlqmGYa
RpIhFCy4LMVKJpGy7MOYliVOyNTjWW2eedpB6P1wIC8lIcGLj4SIeUAAeEcNgpCB
6/KnbaWDAn6K18icrjW0gA==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
EasCRSRab4sOUWNZgo/W0vBuL0YS3IBAwTPanaXq0srCC+SHPTaan9ai3UHWIM2T
9DxKwn+ZFyj+06ikPG/tY3j53EtOzQK2P49Gb01MesqmeGYM0JaJbM509GnFpEwb
hWywA82aUhL33llIk8lYjSfY6zBgjVDJTURhNTZUCfQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 19245     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FL_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aMz4FhbKONrR0nVybJtMGUdKmjp2bVz8su39ZyrlXBIxLWLUMQjG8DP60JAJIfuj
ZngOW6VjWAsP+DgDUIb66ZPI494sQ38FpNcR7QAg4IB3bJiw972mVqTr5V3qj6P8
AKoHqqokglebNmnkV0uV8qU8q+E2wcTGAATfJ+Lc4D0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 19328     )
FlmxsI87ytTmZNrNrI5jfIKOnKkgJI3EpxJY23S+z5uT/+ocLrsu/rXoL7ILgML0
RPYZ2OLrOmXWlOqi3o1GJS3w2MdBk4h0ef/RpkOxtqg+FeYHoqmGzxyA0xmR2XzN
`pragma protect end_protected
