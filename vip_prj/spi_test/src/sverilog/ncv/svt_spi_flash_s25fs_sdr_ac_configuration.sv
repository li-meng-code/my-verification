
`ifndef GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FS family in SDR mode.
 */
class svt_spi_flash_s25fs_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (DUAL I/O) command
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QUAD I/O) command
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_s25fs_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fs_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fs_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fs_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fs_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fs_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fs_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Ac99xzq1DuobbC9yJWuu1+Q3gszpsrEOSaWc9CP2lFeLUuyGCq4lY3pv65L7YABw
Jux03f911Apfr97X+s9H2hVj9FnL5aGX0oqslujhpud6y1gr/dUEu68q3pPJK5Hk
ftjTeQbJxZp8AKBDYb4cqapTckokepdJ7VlTtcdG6MZbRWC4wKbN3w==
//pragma protect end_key_block
//pragma protect digest_block
dizyj+GQXIkGrW23UmBAeGNT3Rc=
//pragma protect end_digest_block
//pragma protect data_block
TcMHHzj6FHay1qhpvXMTtexxWs/7iWP6BKm+UJa2BW6VWml1CC/51AnjqsLXD1EO
ZES1so7jPIY9I0G0s6Om1MKh3QDXlFZmOeYOkvn++odjLfJAMTcqJssM600F/E8i
0VgPoc49e5lfEs0ZWfWISA78970ZxXq797APp8lF11SNqrbhc9HE3uK5tRL+9bc+
v5GynC59k5Kdn/LC7mDWipDmRmg0v12lPb4QCYzgbLtuw8RqTl0vf3omadz3WC6P
qlSd5lfP0gZVoo0PXoD9vmQXrL2vgcIKuPTj+365FDD0CwyfChvM1qmin9UOG8HR
a7eCUH0J7Omd8uFYOnbdWPhLMVDqje26RR52tVIky4b/x+bDn7lPjkUE0XKwaqo1
RgONRh/+xQdlm2ujJKs1dNKQdEBzff2/84CXK5nMaY9nVC9SzTFt4NzpuZsSjK5i
pDadaXr8gB2q1c7NljiyfG5dhYf78yln0ua4M3Cm6Za9l9QbemBDvo30LAVhRPbB
+RWa6SXR7xzOr+YoLlKWqETPXUYPxxDeiWfu1K6E6FaY3Hjymw4s/qonoMdNg9mA
3b674t2QNYn5mdbJ6odIjTDDuDmilSIzMGOnQZKp/EbDhrGtb6gFrt7bpDOGjgwS
cnpTW7Y03oHs78XUfHCpU9JJTcuEbRWWdvQT7+j87ePc+HNYSU3bJP6/wvW5OQeg
nusobJy1mnoUoU+XDZr+3cpGPm4QG9JtfwkEeR+b9r04D8sOARKdusL8BDLKaDZR
6hnzVg4HwCTr3dBndJ/pgnYgOBRw+pmubXUKq3a+sKgHqkJ5bbwJkr+EaoGTgE7F
ycoB6iXSpKrHPveEB3cKX59yB0lJUWKX3NJ2B8jD3vG9iXUAG218zkDRh36nDJLL
hlAK1fJDMBBAYatwilf4YBVgHaax1efiZ6G5WDzt7S01wTHbCCmKSqPdWJ61eMCA
1i5j154RTf3Zwgpl6x5NApd7OKh6yFt0reFBpA9VRshdyIhR/poC5V5GNtvNlluY
zmFEWAObL33qVQmY/m5Q5ZuYeixS6PiEsl5IwdHWGFn8UINCnAW9tPI3/U1A3bvb
+Bhb3H31kdtzBAW+3Ep5ZOHMkqP3iiiiSPUj/I5wub/TQm+5Up8WnFdFRq9Rm8QD
Kd6P4coUC3p2n5g0D/HbL7s4B/0IBeOy3m1BYPO885/F54g75JCwrihAZ7pidtRm
OXsqTv2jXTKj9HVSvbSrd3U95emK3Y4TIUqB0u6/U40=
//pragma protect end_data_block
//pragma protect digest_block
AEiO3UyfJCkwndbC7RNSJDxOFtg=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
YhJsVv31ozke0cjiZtY0eYH52c3adkcTMbjmzDi20NgTbYdhJuSjCQa34JK8TYuk
3+f97ktbYUQbAS7WUYuGVxMIJFr902rh2Wwfn1k+8xK3g7uUchrDQzL7BacmCB3j
Fggs12/jD5oB6lLLIPLxlBgLST41j0looNRWHHc9KOx5wR8E/1HYsQ==
//pragma protect end_key_block
//pragma protect digest_block
sd2kvFut3iKy7lTPBOVvEZQLa8M=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
NTO31uQQ0xP+itkkNCR/xKx+ZgQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV
