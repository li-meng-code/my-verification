
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
u/EBZusIUd62abFvIctMBULY9ExTkbEfa8LTjRQWUkP2QdTg5YwCd2sdLUvKwU2g
nYS3v8BKlN7QPfBZNjKQnCZRnh/z/AbI53Uin0K+XVmwm+Sn+SYScc4SkT+4pqCX
SjE8cOHB4BXasa34KL6jezRd2RaSTZVeg7a5lGSVe6rcG2LYeAWzlw==
//pragma protect end_key_block
//pragma protect digest_block
hfSUEzssMwS8qMrYyi3j9A60fFQ=
//pragma protect end_digest_block
//pragma protect data_block
8C2ha5vkbaBreYL4QGn7jil2H0TAaUOBmMHIYmkYtXsWTfPEjQcPLcg1n/rULJMC
xo87pOiRZ/93lixvTlJXyTQiLcGePsYc3wQci0DjEL+nmcYayoF9KvWfPTpzYfiz
FaTU9C/tMDwHalnUFa7QYA7m0UsBFqwjIerKpcyyuysdAD7eWUbVcui9dnn0ds18
Art4xeC2clagpeQ/oN1tYrc2TAmXUkAVyJwc+RQol8iWdDrCybB1/Rc7v8x4ZPmy
XJ0b4ZZNz8h0wn0r5L2vGo/EMVkIucHXR/pgVGiDsr2w2Ot4SSLpkPfecJ1lZmch
vetsLUVfhHISAfy79X9g7X7l9zSRkIY9LHoG/KpigP529A5WLBAs1Tc03gH1ScFs
Jglo5xbT8d3VgNVpoJGd9h6FUUCc/Ie936QjIOysgDEUOZgGDpD6mg3o6csvylr3
QDMQi5oNX8hV9Vy1b4xPjTw9irdw2LMn/hRuKprQmxBxfr4/U/8gz4Rj19Yerl5W
pHufDqThnRmxZPJmLEbTUqEuijh2l/1kqaOS8MCLz5/gCyxoEcNuoyyR1euS4Kng
L01w06Vow8O9d48dpv7syy+wndhZdFScvXth8ay+Gzhl659wIPUc223NZwEQ9pc5
0qty7uM2czO11iezwp/rt19SiADv/opJSIzCZwl6Tc9fSTiwV4dBmShn9lOSbeiJ
0lEMdg4q1wk+LOM27sWBRz4Wgc5sLo1X7szCCE3DESvIUNeSsEfQAlcOCGE1bhK7
wvn7ToQBmnrAU4RALiJ5yfwfrDCvcrLkpSH1qabv1aeM+7sNMskCCk9HCkR5fpr6
02OCwxUXxylFkf/uVn6HTwg4OuxBIgTKnXc/PWh87+JjKjBz5mXqZHEltcJ+SOil
j/J2x3Pa5XKIvPD/HsFz10IP8UPiG2iu8P1OuUGYPNITYNX8KQ2CMxGQE9scfVHZ
OyezxYMZTrg4CVcruDl/rKevnDA6DA6wtojPOIKSrY2xmAONUD1RpQxSmst10T25
0BkccqLRBbyi37ZSdK5aLMgRdzLzKNI4DqY23d0EDaqCFX4DQGiL9tL46oRmyWiM
6s1QBfsSfGrlsNwKe1cIMgRd105XrcCSo0gl04RJPS/CjN18stLMfOItithHQ2xe
a24752kP6tvRVTgLx6YZfUApkXKU77eKvZIJjhU468QTxFaickzab9hm3Wh5NyOT
6izNakIOjdcj7PZ4ywkxJ0zkER+8Zc81cgrr809vJQU=
//pragma protect end_data_block
//pragma protect digest_block
nAmysXTgLDl9PfhqS2DJsVph7lM=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
z4RxxVDRBTQeZ6ZsHHyz23I0gkEfSlglIy60M9jqwEdWZy02LxrSNsFsmDz21GTK
0/Oxbzl5O/JR9zU93k5zgqRZKQTsb8PJ51/BNRRmAl5/N7D74BbuNlVW/PiACYjY
HDi5EXAA+IqNnu2j6SA6D3/KQjBfJfGVd5mjL6CcwuY+sJfiKW8frg==
//pragma protect end_key_block
//pragma protect digest_block
eM0KBLIlSDpDMBXpXP3ZYSFve+w=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
pAiRXll7BnBnLLIO+G3FcQUScD8=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FL_DDR_AC_CONFIGURATION_SV
