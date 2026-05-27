
`ifndef GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT25Q device family in DDR mode.
 */
class svt_spi_flash_mt25q_ddr_ac_configuration extends svt_configuration;

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
   * Minimum Clock high pulse width duration.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt25q_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt25q_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt25q_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt25q_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt25q_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt25q_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt25q_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
w8edt4idagJx+4SMZRpI8BQjPVp7waEi2elkmy2dZ7ADWbtO/mo85EWMcH7hj8VM
ynlJ/IAwoEuRgwuBKvYkHx94nrxmPlBVTnZtKMNxvP14PJSKK07uXf1jpR4gAqy4
ZNaAt4GEUXTV9Me7R+ZGfrsEFiOiJFMRHX0PtbRNW64Yh4z+R5pAlg==
//pragma protect end_key_block
//pragma protect digest_block
Ranvf8JZC4YBLmA4T+zgDugpypE=
//pragma protect end_digest_block
//pragma protect data_block
oZna6Db+aljjXtPf3uUoyyw1AaiRxo/fpMthhJx6YPnpJ2tBxPSsNqgqi6ovCIK3
/HupzPSVGmF8rDHORQHDzUCvJAsKTgSssA+ui0JzNOy1Pc0Qtu01Ki7TjhUrLVa0
IwNCdpMdapMjH/9Z69YVaoZaOl3ZwqhJCXkRCdzfyNNZGt9Q8pbjwcIddm4im7RA
taMLFAtpTz0OH9rt98I+9PMeCczazxaVRCg/5tS0ejaELmb6Wp+Jig57BkyMahUd
7rU+B9P54B1c9rPm8ZLVvD8YxlXNPRSUijydltu4J52MFrHGdXuvtqN4mODJbtoH
g44SPlxvs+mHYIFbU0FtEcAZpP93Ol5ntcba500TwPAeSzglAb7oITq5Kd28sUw2
a1sv/4pbvxMH7WN4GLsW5VtY5BEv691hmNRhgoQmfFJUbmbqEbYe1I3dKmoaza81
X3wbfn8uZrCEtpyyNbB+bz6EgbURoyhJdkSqF+F0aEEU7/bepPuT+Lq88oJXjlbY
UKvedPe+QMUPO1CizNThzRBK9EA/GBHjABLhbSL23uL+mgBuuAitKpm3AnQm++g+
eMpvMS11q1erT5XgblKKH9AtPL6gzu3xurA26x9NZ6Ko8N4zbwpz8TS6n9koNJi/
nksQ+uHS6byKrqjPtrkEnuODi5pWitqP2iwHlZnzOfvHdWmqjin3pvOVKPTeVbH5
B/7nQY/eIteiIdF14O/fF/7fTYlsZqTk4YzHOV620YjGt6bHt8zKJI1W+5HlGr5/
oUrre5GKAHy6cS1cyo0+pvLIN6oXf5vNFixZk5HhxQqdXb8myN6wZczrYN2XrOVk
4mtby4crCFz2Mlsu998ZVveK/bajkkdW8m0kbaS/2XGzYMNiB38Wr/ciS9HBQ36X
5yF2vR9Uk//i0YQnd2GLOO+/Welsf+dhdl1dnRC4b2/U29aYLeTV5k7tQpruOyA0
yecV7eg/R3XgE2Rg3RVyr28ptIWs6GvDU1ZvFdogEYO1S1KruCCsxOoIkrZkZ83u
uo2Zk5P4P9imX5h/jqh2PYFJjlSF8O7XMQEhR4lh+dFuWtsNwHdR84eE5Xyq1rfL
tdSYKKh2ljnv8XPPKR1voDMjBLb/oqldSE3WOC1/DvPdcQi+jRs4Prnj1BiqmJSy
L66wH59ghYKicobh9uUz/JludD+946FqXw809H1PFd7jH1h2J0qTtgFLGLFnAeu1
a0/LfxzVrmF++CYtT1ISROo/IynABrA/pXdRQ92KyT8=
//pragma protect end_data_block
//pragma protect digest_block
pfAEydtOtQUXR0qZ030orgWoZLA=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
rLdOSeo76xgmfD9jSDLGIjKUJ28iLmZXAqn7/gsZBQXAz5StrTONkPRF2fOOnCTi
Ob29mquhN4umxZX4OgBONB36exAYK7dFIzVDj+fLzoq6AhzjHYIUvrFbxKpjbwoW
KtcWy/mWaJ68INrPFsMResnMUBHcuvwUFzyaOGNv+62t/7m6g4Kfgw==
//pragma protect end_key_block
//pragma protect digest_block
7FUoLdjqktdTBUBUIFsuBPnh/DI=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
fFTxfOr1QpiAVdDMp8pX3I0ZYf0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV
