
`ifndef GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25U device family.
 */
class svt_spi_flash_mx25u_ac_configuration extends svt_configuration;

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
   * Minimum Clock period/Highest Freq support.
   */ 
  real tCLK_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD Output command 
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO DTR command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_DTR_ns[];

  /**
   * Minimum Clock period/Highest Freq support for AUTOBOOT 
   */ 
  real tCLK_AutoBoot_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mx25u_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25u_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25u_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25u_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25u_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25u_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25u_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
8Pu4fHNSvbHvN92fDPnNo6SGzqiiYCluj9x7PhFtpc0D4B+gxoYL5M8W5+3PYDdd
mWVbXkhcptDxsNNUkR9opNbG8Qxs4miIkxr0M7gcWBwE4VAI5lh99v8aCcmI3sy3
nhlZOMN6CBJbfOv00KRNyFF+trXVizXyq7F0soonnZ5vUunvdZnRFg==
//pragma protect end_key_block
//pragma protect digest_block
X7FcOn+WI9w36aoxMe7VZdSYdJA=
//pragma protect end_digest_block
//pragma protect data_block
DoC69FzH4kP9/BuXybxwhEQdswgqZmm+4jBNVUBNgr2SR/sIdAaYR5Aq+tJNmp3o
WAM55Jybog6RqtARYgkf145RZ47sMMBNA8FJq4Jih70vMp/5adKXaf1BNssRJ/e0
E814ufg31OC76L8JYgFi/F+ZxZqCL2I48QU6mG9CfpvyQ4JHnGJHIXG/951zDJFV
9kkG0dOcjQWdL9y1KSuF7hOjJZeWhePEyLpzPC26Rb2LNTu1J6v1reE/zqP85VgU
PEuitsMacHKvjdU4io1I/7+xKaw99JwhiAS04Asd4S8AvGXptSROAb/P1FQFgQBm
7gifM1tHgosod9Do/qf6P2aduMsnGjTtY/w6nr2sjkPXAQ2TvJcjLQfogy2gNnNj
WgQu7/St8zsdC4ACcoeLM0MMMr8fBSQFW+NUe6YCrRYyeONmL9EqmaSLerHGCQdA
YF34qjJPCfP9UBGPgj8EwTo/Q488RWEHhwgtx5PT/PEYZQsL72/7ir802zVSaBHd
dTH+xALv6g9gyimHO58uu5WDmfAr41ulHTUtF4nuRtL5A5LZUevz7XliwTiRRjyR
y+5Gc2Mk1oLeP2CI/7rwD8rR3ofpJLL5K1RmK70viogxkpyKbP9xCaqPnMbHUIoB
clHb02qTLKSGfNfW3QjResB9qjuU/S3QUiA2O6wK9mlpwd0V02OUN8i+cz1PuKb9
wMCLA9hHscS5xc5ojNHOZTyvP/vw3UgAvB0AiprPFdh/1iWOCPlHPe9hmWJtZfs5
WDXGbX3TKZCsDl8KxJgVNhN9No7iRIb5I2MZ4AYG5iVloicHpwjnBZgpCGEjHG2g
rW/yigojAwXANZrBiOTIOpqITIXccbwKN3MAw3hHODCWXThqnzYzSVlV6g2uDb0U
G9JZxpMlFSnArc0R5zUh56ZM6xBt+hlv/1Jqttd+JKcyzAzaQuZaPT1nJTaXp7Jg
qJlsmY1JxgETIFepPgKqzAgJAOWMZbMSaR2L3ZhD7NyQJG+CKbxdxa72KGuGrQip
5ampRzL2BGRLAzbptMJfVfJBZwA4ZXSugw6rh9doamnh2j38w6/iMD7Edwtf6LwM
0NPilcE3sjddmN1GYWjo5AwL6dZenbvvVRT+UWbMBMEgiarwqLk9RKyjjkyoOo3Y
YJVM6lkwtpxKe8xPWWsQHsdoE3pjDk5Shh5AuaoF3KzNtasOZJvUznvEg9wZcos7
iarEzOy6Cn0cDDAR2kHPcg==
//pragma protect end_data_block
//pragma protect digest_block
e+DgQn7lUUsG9SwRWIozdWaLjDU=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QHhDqM+rZxs+hhyv9+opii7VpNXhTIor9TeQEn3hSlJB13fmKvk0SGR/jo5aETAp
kbKZ4W4XBeAe01BrAj5dpEt6hBGbqi9bhTQqC3ZBe6rYgJgYo4dFk7Y36nNHF/RO
p/o1CPAGVguFSyD8BdKmRfoiQFKo45+a895KnHBAzVxC8qfbam3p1w==
//pragma protect end_key_block
//pragma protect digest_block
QiWhtn1InAFrt0uIEpEBqdQot7U=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
5tcTEJFME274LxEqEQuCf/dqxRI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV
