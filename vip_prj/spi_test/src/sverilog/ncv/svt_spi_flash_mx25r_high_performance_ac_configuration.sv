
`ifndef GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25R device family in High Performance mode.
 */
class svt_spi_flash_mx25r_high_performance_ac_configuration extends svt_configuration;

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
   * Minimum Clock High pulse width duration.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mx25r_high_performance_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25r_high_performance_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25r_high_performance_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25r_high_performance_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25r_high_performance_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25r_high_performance_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25r_high_performance_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
m5PSQmyNmB1DVtQaHPr7pR1yxV23m/Q+6esP6ILH0mQCIdA52z0289sUonn7fpBn
lWvHcsBIwnXaKksGCzXc74vrmffn0dwtPAdWOCupHQ1LBdadKtpTauF5CLGixF20
r2HeEFgKc4UpzVRsTEuTS1nQVWMnDZAISswnlL5sWVpHK4bQg42UYQ==
//pragma protect end_key_block
//pragma protect digest_block
yHKdQu1VbL4+Eusv/omZgqNrjlU=
//pragma protect end_digest_block
//pragma protect data_block
UzmfNzxsHU/8R/0BnYat4kHUp8/vDiOs6DmXVWHmAhQzoXSw09ML8M2+jwcgLCCH
cbhwDAvwvft2mqdmkFhNXzJDD9ow9Fe17lZ6VwetjBz2wR9R7HaZAXMI+mt85NPq
OmleoigHXvH489tk3XTJM6B7fVZWFPx9Z3amXkD/ZFC6BrWFILiDuIlGLA2AKy+L
TISU33r0aBg3y9GNtdtlUIDhc3FbItOQiGXRlbO9wdTqO7csccakJf0hdbxWBANO
V8UBNYkM8A61WkEXevPPbCE3Jly7ld7nOQRAQ296koBLmAhAhJX5XTzMwojor4ry
R5bkZH8RmfBNAFQyF5l2qqYFVQzPAcWDtBEkB9t48UPMPSAMB6TRgJZpKLueZAiK
M+GMJ8W9fNJsgb5k7i8P9ItUHSVKsj7mteKU4lfqoH5dYWMX1s+mAscO2AnW731O
mYfjUptFXLEIjYnQiEFJsD6KKQvz+vIE9mMY0OW5X8ODqzE6Vhg5dEsIId4wmYfY
qsKa6BHAjwjALRdzGrvsfWFJ97B8xqDtFTd5bV1ZXV5kf+DcgbhPLm2ukZecXY1+
LJ2NoVxd8SKtoHS8P6yxcSkwAB1jYr4sSCG16XRpSyQ7i1wUaFbJoN8ox7apL30O
+DFGDpD2F+QjYd7L2QPmHztm9zJhHw0nHgrC30oUU7C4RZRIrI/pek3mSbpo5OiU
IjGJQCizJGyrUF2+qe4Hva8cYMttL6+VhytrdOdx69wJiRNFP0ZTwwjhoHCcx+CA
nL1MYiBDsnGixXD14KXNtE836kKMOPR8Pu1TZK2fSXdpCFd9Z0uGZhSPNjN7DNAW
i99gdtO4hVbv8/1+D/2NDvIcCrGi/3fbe/I5CElHFUh8B7uPOspiRRcofxvfAWH1
TYhEHLR2joLUrTQx1YUW1fkXIkw0GDECDK5+YhIAGVf4nJDS3A4a/0+xQ4twKFoI
HwvQal7XuN5JnH1svTO+JAosmRXF97byyfbeo/pt5b6zzoau/5z2SfO+dTzypItv
8IVJ2nEs9o0+nphaYPdHuKcLsZ4rtRGcVSwJBppw9kpTYIIo55pVX8CRHNOLjDog
yX/zhyc40UxUc7rxkA1WGT343QCxoPHcYplWtIbSVOFXeI2NyBdobjFtHcNbKB+l
8w1XT384iA0piLI4CZFBrIDYDAEMD2fQMewN9THfrvvjxGNftFgXFU7TcxT75Dic
MGzAJxkGdKBygzRcoHhZj65lZT/KF/weQ8auQrNn1EVZavvSFaBIRm4GTR2YNTeN
WTuhdQMcCOAur46BTltd0uD8O88M9Iui0cHc8cwCLKU=
//pragma protect end_data_block
//pragma protect digest_block
wcANK2bTXKs8yODJMuCW1Cl1YLc=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
gR4T3/OVVDzcZowrlOanXvJx+MiU29cbFfND4l2V7Omb1aNc4NYDF9OCeSRpVVwp
dCnWdH6hY5J5Tox3G3fo7wUbrqURwEhGPkrDPmlzhjQI83ybRJ4Szl1ITYp2I3B1
y5Ih2gRv73i7FqQLKfhWiNvQWOFzPnD7CEQShUHgdMDf6WNhqC+ZGQ==
//pragma protect end_key_block
//pragma protect digest_block
R5xV+QtmwcYNgc6JB3ZKltrJVzs=
//pragma protect end_digest_block
//pragma protect data_block
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
uWK3A3oIz3Q927W/uiy/Sw==
//pragma protect end_data_block
//pragma protect digest_block
lysUseDHtZ6c7ZeGe6o30THOkJU=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV
