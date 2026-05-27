
`ifndef GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25R device family in Low Power mode.
 */
class svt_spi_flash_mx25r_low_power_ac_configuration extends svt_configuration;

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
  `svt_vmm_data_new(svt_spi_flash_mx25r_low_power_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25r_low_power_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25r_low_power_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25r_low_power_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25r_low_power_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25r_low_power_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25r_low_power_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
OjL8XZ00xTgayhOXYF6C2goINPOH2R0r1iGqeXd7oTMvgAOGsXhBu5AJpvfva+YX
+eSBI+2+5FVzOtcWaD8gEQwUVPKMuYus8N7U5IGasfwAYc8F4k+Cr9K2LkwhkkAJ
D9eFWGgm/EPzumJfXjh31I7ohwPfjI4Ztp0a5JaeAea5+PlNFKItOQ==
//pragma protect end_key_block
//pragma protect digest_block
NS1q792kVX9+LrqBuzhS3u6szoU=
//pragma protect end_digest_block
//pragma protect data_block
sjcKOSoyUy5SLk1JDg58GNbiCpZC9ui01hCHKY2O7CuW2va1W4w6SVm75TOB7zqj
zbhwpW2GeXEQ/bB0oMKvxMICaPxVB/vePikz+BjMG9ySICauwPBMFsZoILLoIuwQ
aDoc9Pp4eJtSDwVM/QBHCfUp4zumqRbF5WgQBmIe2sY7u94N1dpijw4t58EKZw82
3CI40GbUG+RjjxsAC0OoFZd0Mub+T2Y93AAORHw+VamGK/qWcKHCf76vI/F/l0xH
Tg4sNPkHFoi4uWW4jLi5WzLSRF2e/NeALyotg7CkEhabPD7pwiXmM9dI1+lE0QVH
vuU2kup4yZ1hhCrFFI84uReqALTX+I70IPYbHEErKwjg0VOvsRm/7K5YAynERC5l
txTs2mf7Cf4mMnKDEHnCNC4JFeVogvgWT9EsKC+0FMIxGyQktEo9VAHlq/H1keca
uyiJYDsgCIxf3jiv8dfMOMOTPYN9oPmtj/8ziTdQCfUHElvXg5vu0zcAxBr23ZMS
d3i20dvbiX7N+gRfCj5zKpDb+7RyXSLj5uJ/vb1aLlUQuH0Pw5hBcGqkHARUBCdZ
V5Gf3r6xBEbi1rwBBN6+p5OVhVBArEXT98bHz5KfQOKUuSTGAQYRjrR5HTMESwHL
cWoTlpygQ0hJ140juF4Um6XB8tx+M5T/x/aSWxBZWSx0Cwnz6LjmF8bdRHc3pw2L
o5/TVQkpaoQmT/E7mBeRaySLOSpQFYNT6o8fs7A9sfjz1ILJfzITn0Yl3DNy0a5h
ivkfp3qcHDOT5oPkID6MbF1InrdkgB0zDVyI870P+VhRSTum5Cb0jNR8iLHIX6Jo
EQpiJdsZ7I2FTxfR2X2+cRLdV+BQNrdPbalESJPDliuxBTR/1gWLzAVoVdJZAs3D
7Rrx0i6EhubLaBiojZji824rZiqjhnxsDahCQd7b9WxSk8A3OqiRu3Vjio14HhjB
XwpOTrBzHQAtVMW3tdy+iF9zH9CDplHcB9KuXT4mdKtL1f1gz33Dh0pBoW2CknMR
UnIYfkIwllJzIote0jig7/rF1yAJ3vViTCyW/RPwOdjpueuy7GzCkUv4m816MX13
1QARcAPakluN1JSh+Ehi+mj3he3g0uxxoEAtuyoDEEuUbN8LpS0QWAXyEStDaFf5
7W5Jw9UF08svaeBkWkRD8CFm1HlTFma4jEMg3N47id/UqaSC21od/BOpVULkkGE6
lE/BQJOoJU3cdD4yCamWhDBrqEevYZvHRxexdulPvOMQMOxT8kyF8MEVUy5eu8Ob

//pragma protect end_data_block
//pragma protect digest_block
MDbP1kUkA12xfjo7mRKLiPCLdCU=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
h8oI89G0pGDtiU7zRbabunlbeaqwuaWk78kpUc+a2pWVKmpZsHWBm8eBzk6F56hA
SFdYQLQRgk6y2NAQuZENdIALYdnpM8FL9MKwfhCeMYCOfTiZ5GM+mRl/Sm4+N20i
RwnjdhneIxkI4HXLu7eCyxQN3gUbG5YX+7S+mZT+6ajHH8z+kLhy3w==
//pragma protect end_key_block
//pragma protect digest_block
5Lt90+UateeuKYBdndpkthyrTbE=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
L6xZ+i2CUjkdGe16pqf3tefMp28=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV
