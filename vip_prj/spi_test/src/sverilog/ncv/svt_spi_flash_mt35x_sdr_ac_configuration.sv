
`ifndef GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT35X device family in SDR mode.
 */
class svt_spi_flash_mt35x_sdr_ac_configuration extends svt_configuration;

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
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_OCTAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_4byte_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_4byte_Fast_Read_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal IO command 
   */ 
  real tCH_4byte_Fast_Read_OCTAL_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt35x_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt35x_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt35x_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt35x_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt35x_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt35x_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt35x_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
wNxoJz/2b3LVklHukf062hfURfIY6KHoSXxajeK/jIZgqVgeKMA8BRKjoxYc9Tvx
8jxahVb/mIK3T60tVuDghyCV2RxP4pi/btuPzLFu2IROVZoL6MAYjPfh2kxCx7gZ
P7hVBAPRicpyX2RJGGFoIOdr+boVGQE5QDBDcpDT5NOBAsjG67ka8w==
//pragma protect end_key_block
//pragma protect digest_block
Kzj1CKzqXSdrrlPL90gLDMKzvDQ=
//pragma protect end_digest_block
//pragma protect data_block
ug0FvRRTAw2/nQaZkW0ijMR87Oz9/QkxOrF2jaKZKe/VQQCz0cM+mkgcsRXvW+xH
jbGX3SJ1DPHg8SrCCePuyO7puqnLIWWZ9OsiqxWP6+JN7DvAwkPojt6y0fYgtSR3
2PaxExp9fXwE69iLf/btnxFodaTxxyWGuCDAcbIxskmKdIHdi68EKj+7+geYoa1z
4LfPrt7wHEEbySb08mJ8nA84uIrcXXHSwItuGyrOH6GepUzQz/zkq3uZ1yNfWqTi
KOC6tpkP0kvydCmXu5IoxRJ06kaHhHMxufnEuwQT2MdQyyycJkCAxaVlL7eAm60k
CUJ9dE7xk8xmjVjnGe/Fexs5hs+HFg/6xorqro/Dyeo62Vp3Bgk6Nf7wNcZUZ1fa
1634g+DD/Ealldx7ApfUtJ5sJSVbofXd6vUbXF0nbUqBnI2L0v+mfaxGnJ/5GkeW
/yVRSp6kBYrLILyK+7PGGL5Mft6tWdJJHCKJVuvSi/WZcqfATprMq072yzw5T7zs
5VUIQ/oh2fjM5YE+hFNH52mCBtCMyHknOPiJKCjxS7BGOAYVT9Dn3ZNhttL8z8mK
Fnl3igCHlza9sz5PKTwlgCf16voZoUamccOWQ6rqaFWykY2HHfH36JE+iAMj5Wid
ZDMH7irdweiD0eu2SJlrnqJmttdaVQZvlnwN/tlRmyYYlW5Pau63sM/jpfezYlHL
d/2RtwZFiQpwPpbaANUXCKYgwpuXCfsuVjYsxjnJdqGiVgjiY36wGWmdHmPSN7RD
3OLenRsMK1EyenqW8vAYtA1DlLEaXr6ttVNpuSEJunaMlTwSnH48cD4KLUG2hVYk
xUZenXdDeeG3Jca72p9wyY8LUtSZA93ExARs85DmYPhpTeKWoq7Ipq5bn0mKMA/u
kif1s7AmchR+BZCh6Wip0/DAm+ZTnX16WKnBGVxQyUBDN9W1MuNDoS2sVnVEZ8Yf
OVZUvGCIc9T3SK7NlimcHWbyNuTC5yVkTUvW6vC0aKpIGgmPo/W4/LvVRuDnXjy2
jzj/eCteb05CZWs2GAF8auDOKWbiymLpbjVJWCwNbuv7x4SkBqJ6LEYzFy9NpaGZ
tiSa0Sp+U+u4sgHJL1tXtkldqTmzCYFeqooqHK/eZbWirotdoB50890t9oFHCPg0
sjPuESQVHwv7n7E95FINf4B331/SA/aZlNVCVuLzeLg8zx0D6+stVgScXFUOqNjM
68OgSqNxMTmQNfyzG4/Uvt9Zq0HyeVjkqrsxPTGi9Kg=
//pragma protect end_data_block
//pragma protect digest_block
6GnYhmfD/g5b3k3nKrrcKMI8ziU=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RDUBWTOw7tMORyLoPPu9ZYjd7Q7XjScJ46d+ZQfSIX+umTRcvv57IVLkPg8L1Qb6
bvPqd+/Hi9l+17Z5ZjMQVO++fX6dHGnISwUnA7M1gvom8lQk2b/evCqZrDyAIykm
+J+AIIDTf2ibLorJVoZIjWAqbV9G12tYTU08p0Iq1dYpH1qvjafJcA==
//pragma protect end_key_block
//pragma protect digest_block
ahZRA3PC2c8LYMR6mbX2HjEPfQI=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
ZSUCgVeqVonKhEpf/SAJ5vqPQQg=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV
