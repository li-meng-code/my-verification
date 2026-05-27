
`ifndef GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FS family in DDR mode.
 */
class svt_spi_flash_s25fs_ddr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command (DDR QUAD I/O) command
   */ 
  real tCH_Fast_Read_DDR_QUAD_IO_ns[];

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
   * Data in Setup time
   */
  real tSU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tHD_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns[];

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns[];

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns[];

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns[];

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

  /** Assign refernce of spi_mem_configuration object */
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
  `svt_vmm_data_new(svt_spi_flash_s25fs_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fs_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fs_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fs_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fs_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fs_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fs_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
YSUy5AjYiv31OimbWZW31OSxG29gkHGtu7hSNO1ELbUTj93tVQXKPO2UFvsYlka9
ue3Aqbd1emep6gWzl2l9rMIonUvT+CueCwOrf5IrEDNEqCqY4zdDyvuxYhSg2unq
kBwjJs1WlDauDFbJxw8R3a04j15u1MAdSxWMy7L/kGqbIz/L5n7OZQ==
//pragma protect end_key_block
//pragma protect digest_block
kDjBE7JNYD8OGVbgE9kgRoR3cYs=
//pragma protect end_digest_block
//pragma protect data_block
Q9e00ENHOX5l8p+SnSqwVTMRoqw5IwCxqGKq2TPBXgiAMdrasg7RIKy7VsPuZ8vG
Lz0rGkA9o2B5YleNyGlnj/p5NAULzxAUDhq8mSws+Uqdbsg/CVnV9KLRBri8LHd9
M5gTGU3wQUpC/PHxiL0sHbFCyFDh2/b+Pq5R/UTRYu4X6tiMmMIpa7MIJYwCOXFV
jRt4JJQ87PUihD2f0GGVG/RXSgl0UEX3TDrscuKup23jo5RHdMuGbLmZHwx3IRNm
FWdJKTpfcz3J/mpFNWiYVRCRssd9ANEmEMstQ5NVVqly5e5tK/kGLG/RWINMsLr2
op0nuvAt339Ul4v4HaPDnpN87yJvdDVCpNNAKRSVbWC+0EQkF/2GoesYSi0JH+SG
YZfgIPjHOiwD4dKlhylX/MuFRw9X5jd7NrZ7vcN4hcoduRSseBtYCsnpok/iT741
33UlbHDfT4LpUmXFI2CYw/Pl3//knL/v/yRZ2yySu9UQE1HOWJIVDJa8xrey7VvP
pz6w5QkUZZ4iBG0G8LS6Vol/ScS0uxJAXV8CAwD2qRP2O06S3hqOLhB8gGU2pwsR
CNtdVZhd77BmdQt7tjsMtanj56raPkkuatgb9lR9cPVttnrFZqw5mJ6MBdvbmtq/
B+uBXFLBcHxirnz53t8WjEkvkriaXy/WKynIIwuf13GhQiPfo6qWuHaFI/i2UNRr
qzNshdi+bALgRpGuWrr6blIEBnvYWMfwp09oDjIdDLwtqWoD/Fgywp0FoNiJcM6Z
6AWh4lGYdhdHaUep2Z5/pWM63y2bEp5iBnz/+44tf8PL3tPrjpOhodKQicMTquBI
/DQ/ANMc+SVHF1TuoCI4cdc20foQ/HWpVylLA8YLZlw7sA97syb9wX2eBGzawlIY
N0U4q4ikFOxRSI5dxhbooFt5d+MhUNP3+hOk2a6Ek5QZaRvJe+tqbMERXkm0JqGz
VcDMHXhY8IC1KKh0UWvRCto/3lJKvNycJTiq3TcRZ5FAkpdWFPJQRNp+qA6yCRtM
xNC+V+EF/IS7IaEWk+vVcgnN2fcr8cos/9vglsKFhRWlcI9qaSQZZAGW+gVdAC6f
x11i/irlB4aQBWmvVIEymIuBFqdifLD2Tip2l1mg9TtabV6q5ciSkLDWWYXH7Tjr
bJV+/ELioST2svauMkjcVZtmyyp/pxCqrsTynzE+ruHw8wIPcoicIbgcEawnuJrW
m5sL5PSrr7oKf6NosnyAQhnnGllRado5VwIydCZ/fTs=
//pragma protect end_data_block
//pragma protect digest_block
XJC8txKG+4gHE6HAgyPWKKRkclI=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
USLAzZgfxwM8bcW84RHIGZbAig2BhA4Ffu7Sf6bAWbX8BnPGvGayZEihV1UH4kyI
HA3VhPLsO2ppx4x3U6Hu+eVX8k1gmH53JfTzYfwzhpiuHKxbsmnopGRlosZyTBCC
A9c+y5+Fw2IsJ+10+D+rwQxZB35EsB0BjbreS2AqdlLN0p0euxA6bw==
//pragma protect end_key_block
//pragma protect digest_block
G5J80PYJ7Z+V5uquW5fekMpHZAg=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
ZaQvB6asBhu1SK4Pq0ZBJGiA9Ts=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV
