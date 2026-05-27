
`ifndef GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto JESD251 device family in sdr mode.
 */
class svt_spi_flash_jesd251_xSPI_sdr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_jesd251_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_jesd251_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
YqCgGm3Rwuj72YRBQhZqQJSxT2+gyJr1rBcgu6zunumdLWz05oVRdaIW3bx6cWSF
M0zpCQqGo3vY8j4W75CU4r9d+Wrt2mlz0mAK1ZIImfIQmX/ySFgeCclfDQB5uwBD
hvJl7Rb3MkNVL15MbHYZ6xBDJySkVYp0HB6Nouf8x281K0kqMa//9w==
//pragma protect end_key_block
//pragma protect digest_block
zZf7DQVP2ssTSVaLKLTgc3o7gM4=
//pragma protect end_digest_block
//pragma protect data_block
jQ+PuA/GJVbHTHSB4ZRJCIilFDET6jocgrIThPoj4jJ2sTwP1WI/J6skHTz3GgBk
OBbst3oXyqCJ4EAO9mTs81+WE73oFdAQc+yPefVdCJ/9C5TI0SQaKu+Qpnnpk+Lc
Mz+qKLBMvZS2lS45zn9sjhy5lGuBLTuONkvhnnBOMhfW6r/m6sR3Gde9ajy/OCjh
EGwgDaN0I7mcRPfZ7LmPgrFcOngXO6cRsusSxSthCVqxIYgoHaD/SnrC69sjnyLJ
/b43MUVst2dTIuxZQogybG7HhTP7ONVESBiE86kQ2iHmdvztTAfpEKp2Ec1B4iZi
SBPR/g94SgAIs2z3mQegE7Fy983/jyo4c/BLHWjQaQyCOhwqme5S2H7mmrvX8d3Y
S4ctsMiyoio4HlRpNJlDEFXFOctvqELgjFLdt2nfsDgP4T8YyyrvcmpVF+kYpiMI
9CVKmmkvx1l05W50Dy/l6pEr7LxkdHZM7+5sgQ8zGxyi2Z7uDmlK0bfY4qnyAifZ
IjYyrLBJ1/iRjCDBXtADvE7Ao34MhDoOxg1PPqA37JhKGr/L7075lqFVwAT85YaP
FG3PE63jgbfgyLIIEP77CqbftSDvGgCuUrxWL8pvTkqBuDFZTCOBVXnk3dqMaF2o
9J+YFyWzoaPRKhITeciLCobc8g8WYefv5l9SEP1VmXieXysA/T86B1bNnP0HbaNI
M/5rsvtpIp3RzmPSenSx28rvxKfc8zz7swxp4QL3aWGZnDotBEBWfpSyDeG9L2w8
dlFEBU6nRfMFFSKt5dKztPd97JAeW7w2t1CNrrqTCWcMklxpyCPpexkUKPfPwqxZ
UI+FIE8/68kOex3DbhG5lj0uu1Z6t8ejAJzOBi6sRJGXQWOnT9VElnwWOeGNo9Eb
c+hTyVnh5QaTaXD+EYYJ5Qf6Ec1DXReBSynpPjLt6Yzd0Ocn5P0DJMotrg60WV6l
jS5mHm9x61yhnLHYSkGbsZV/JodK2lIA1998NVG6trOQY36yWbKzFzNBIIHZVbaS
STHdwn8mbmBECIdsv36vMa95KCoknMWVdNyQD56g6ixWclPH27KbEu00HU/9rwYe
eCuoCUpgCjAVLfpm3gdXVVvm+gWcFh0jboJ3BA592x3O9K8TTQ74SkB4ag6vpbXn
+RseLp5uD5Q2I4dE/ZXgQsxtdRROAmK9jmuK99fMemjV7uxquikbCz1TEmKQZSvK
MoCSVVf15u6tkLTZ9XBgDM2RKLJG/55t76LTq9GC2EuxhidGrfFoGN9BWYljhk2y
/7KJ70LMLbtUzXJAyAU/Ng==
//pragma protect end_data_block
//pragma protect digest_block
HhZeCYe6gr/fC9gxvyCcZqx0Wvk=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
LXYMesE/8NFM7hxrRsUYvTw1n6VavdAOsWul0jK/3NK4aXPcO8e7/tis8CBYVjFX
U5om55r2lgx+LREM3QYECmbrtUrnq7wpdKO6kv5y2xcWHjVOHhpOTv/nKIt69ujR
yu+qZCTjXKvlPtm6WOuL1P+b2Y2WO4xRl6folVuauUwRcBT6Kjq19A==
//pragma protect end_key_block
//pragma protect digest_block
fXRpKI2v37Abw8jV0BZxBk5J6mY=
//pragma protect end_digest_block
//pragma protect data_block
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
tPPXrMYCgqP+1sH6VzfMhA==
//pragma protect end_data_block
//pragma protect digest_block
sGJVXMyjTKPBUs4rbeammmdgd30=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV
