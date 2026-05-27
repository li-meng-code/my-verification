
`ifndef GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV
`define GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S28HS and S25HS family in DDR mode.
 * For S28HS, this class contains timing Characteristics for Octal IO SDR and Octal IO DDR.
 */
class svt_spi_flash_s28hs_s25hs_ddr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock period/Highest Freq support.  */ 
  real tCLK_ns[];

  /** Minimum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_min_duty_cycle = initial_time;

  /** Maximum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_max_duty_cycle = initial_time;

  /** Minimum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_min_duty_cycle = initial_time;

  /** Maximum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_max_duty_cycle = initial_time;

  /**
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock Period for Extended READ Command (SPI) commands.
   * Applicable for Read, Read Silicon, Read ECC in Extended SPI mode.
   */ 
  real tCLK_OCTAL_sdr_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (DUAL I/O) command
   */ 
  real tCLK_OCTAL_ddr_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QUAD I/O) command
   */ 
  real tCLK_OCTAL_sdr_Read_volatile_ns[];
  real tCLK_OCTAL_ddr_Read_volatile_ns[];

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
  real tSU_ns[];

  /**
   * Data in Hold time
   */
  real tHD_ns[];

  /**
   * Output Disable time
   */ 
  real tDIS_ns[];

  /**
   * WP# Setup time
   */
  real tWPS_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tWPH_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s28hs_s25hs_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s28hs_s25hs_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Dd+3pK5SnkhjiPRlI4dTJc/hsuscgngutfRzkXaMAdsbEsihl5SBEqtt87/NdZGL
0S+cPaEAr3xJgCdKBybkcX0AqC4wRHjn1FfBZAM7nbfbRyljOj6Rqmi6slY2T1K3
652ttjkFwwmx0PdhSRfYvZ1x5LDCYNDXKAZ/09ew1LOQbU5p55W1+w==
//pragma protect end_key_block
//pragma protect digest_block
l2qejQGkNLWXOlTRFDG9SHlAgCA=
//pragma protect end_digest_block
//pragma protect data_block
9dmN9ZYFITVNiN/O8JBkWUqfBATtOThnVeExh8sN2oLfREBmsDyUAaAKZch/FsQq
wvqHwf+0vyrRo3hH0ZMT/RgBAWByZxQZfjiIfFj1j7+ZpcFRPkiSi+hQAFJlrR31
Y2XACbxDVv2U2pilf5ri/vAW/dWn7GxeRv69Fdvog9Bdigooe5g7XqWTilTyduvW
iGZpyOBOlouAH3FC5GmZTSKGo3yAR+ZwlkaW2POiy+vaVgHRg6Khzphr+rUqVY8s
+gqhuXfnIooabqKgDutVq0ozBXxsXP2LCFUv7kttMrpWs1EApa1TxsMv/m5eLggC
MsJM1hVzWj2Uo3w4j5UYqtkAxbkE3bu2LY8j4c32jrTKeSkDSOGlE1g4t+Z1lOv9
7Zo7sCSyoc4st9id+LOa8EJ2XRWarQEbazTP68vl6uzraIrngtYd76PVzepGSJZa
DBiw+z90JEecXn+atFq1I16cEWJizAlj4gvim5dy6omZYiMj63YQTzJif9aaWOdm
7jf0NeVKHx9+aHHW0GF2E3volC5qBSzcHvXjnmXzzKrCktABRA3MRIAWI8uajruL
Dgxw9WHHRR897pvWuEm0CnxjdaA1bJIOXrHnF37X6U/EPEm3pOSGvPWgI/R84Oj+
K4wp+G597jVXorAf3thYslCyOWENsplg92BdvPCUFVE9ThlDRLFJfrnrYmVkwrb+
DbG/rVEi201xjEozW+ZbR2Pcs5PJ+yi1sAviJyE7DaJjY7XiHq1sYUZrjAjm4IiD
YmHi89cVjAiYQQPmbCPwRWjnlabhFaWYkjG/xZ16hybZgMi2JunFVaHbvQhE2gDC
kXQtLTZjKJdlnFQBB74m0Bcyvue/BNWJX5wF12l9d5bPXWErORoubM7kprzSGHBZ
1CN1193B1cW8Z8+EPGjLVd7Homsck5aFCdKxX+5sMYJp75kTABBNmm1I0wMALCQ+
hsheP1DFBrp9lwFlWSZj5b0XcIF89JnjZaTTPx/FKbGkG6HRb3Yq0xATZd3yFnWx
Dfwk2hz7nrtcrfFExjnFMPZcd6+1E3FWGlXfIoVaSEGVBHxEO4ZNVjCcaJxGvd2Y
FKefozNmbH1yJIRL80oj7eBpwHa64Lfumm4P25p3bE5g87ax2H2MtVfhONETjE+Q
mI0y29Q9cDrWxqTNF1MKpFFQgvfKxEkoyZ5QrLS+690rB2t3ComX5vKs4mJruHlr
9+ZUamX/EFQsj9za/LwO3CLfT3xe32gPVVfvLZ7ItQ3NXf+kSSpuoeusUiaVRPak

//pragma protect end_data_block
//pragma protect digest_block
r7W3bqfYVrtCtdRBS1uVPjj7P2E=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
3mdGmi5PBAyoAysvLdqMmLTqcd3xjANdDa/7wryoaftD+ajSYHnN9Po0aYCTd84J
tfb4m3h3xJzH626h2qg6O1OKrfKRNnhRN7IoBd1mkPCKT6tFwvvSlLmIS2KBdlP/
EQlI7DkCFCf0H6nTOV2TaxnCcneFzhfjj6FIwiWstrCwcaeAKPsHKQ==
//pragma protect end_key_block
//pragma protect digest_block
nGYyYOHsWmtIfz35ae/9QCH39Tk=
//pragma protect end_digest_block
//pragma protect data_block
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
sJFCtPErNUUdUUdig13+BQ==
//pragma protect end_data_block
//pragma protect digest_block
n/b2bebrNYbhgZx4+2m48TZkKLE=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV
