
`ifndef GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT35X device family in DDR mode.
 */
class svt_spi_flash_mt35x_ddr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_DDR_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_4byte_Fast_Read_DDR_OCTAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Protocol Mode "OCTAL_IO_DTR"
   */ 
  real tCH_OCTAL_DDR_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt35x_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt35x_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt35x_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt35x_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt35x_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt35x_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt35x_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
+bpjy7a9BoEtGnVeV8CN+8iO/vSZlGdt61AlarZlhdHtrCXfG8xw+PancQyA+6TU
pd4DmebZAzGSyczxSgBc6SG8WxENh2Z9E6KO6iurPTENISjVabYi41jP4ByY8y4S
Y1F1Ef1IpKPLA8OOY3wqvOu+NXsjizy40zjjCjLSCGkt9ebR06SZcw==
//pragma protect end_key_block
//pragma protect digest_block
jDrDOXH/E3DZhIF+Vut/aOfutcI=
//pragma protect end_digest_block
//pragma protect data_block
1jyrS0IrcJjMNYcSzICgg7ese7UuISqmKkk/p9P3n8Ig2eB4/ar7oo6qWB1n3l8w
EsQa+ZGZVLAa5YDuyxVQ4m86X1KmVzppeb6E+0m0EV2TpqTtLJWa28rBUCO/1GVu
1ga9KoJQUnL9M4Oku0mqyDoK/3T2IMu8B1XULJ89sCu92c93DnTGUQ12N53BMMcG
kL15PmlGO5m02rXyn8REBxRfV5LZL9Kv1Ls6jeuSswT7Fp0GdNssLPYdOx+yye/J
WHhV4WlWg5TRuFRDz4Du2GiYziZj1V+yOiXgAnGXXDdj4eu+xMW5OxmWlRqxQa/c
qfl0pd9aNB31rAzPnJ955PTJOsVXgP3UAIuG721kSPMdosdyUI8Gjy/WYuf6p+Lu
qpPFtLM5RoiWOnvPLPfxOaj+9sTuv8pooYbXH7GRzj4xpWBKDqG3/LAil5xnTWF+
hR+yhGDA4SZhlqW5WGWuJQjY5kNfyo8V2Tpw634MIPZK8NeTrW3RGJwtojBRCUrw
Gmrg4bNBWfYLXp3iBE8+RkRyFlFLIpzDO3KyzYZcvxrU7TP71Y3xuXa+/XWt+GpM
wqOMg03IIi4DTxLICxkJPEf03NYaCk29QO8YFHXabu5DDBE6oKSSXXTK33hhRe9T
EvEJqccxUtDi1I+L4lalHv4Jba9GZQmNJwFqfkwEpgmc7mf7yMRuybmbxcMTGKi0
l7R1GwJ7CSfN/PnFTVuDF6ExCm2ckgFzu7Now2+VuEwhciWF4vukkb1IPRBe1tMj
5BqdkReNtw6PatUMXWBi7qpvw6fLsWAdxi/T0pQKaKy0v/wKij+0NDOgGOZct95/
SNbpVahSrndMcxksG/aPKVTt5pkpt1f1W2nvMRsw05AK7s65tZgjukmPK8tkvX9i
DghaZXR55Ld8e2jPSEsMrQyv83txD4K1peGFioM9yUx1FE1VAP1Y1AYAUrhw3TOd
lFfoDksxW5o4B3UwAMrlussDbMlEsjfRablU62T1SlVdiGZeh1m+KXT7m6X54US2
cWalmntWrOnRlDEoJ+pKPG1ygZRkjmDW3c/mwmQ+A08MYUrk5I+GP9XZexOlUrVd
f8ZGhp7Ast6S7HJtsaQp8s3TVg+tSFwvuSZpYOJn6DnzwZ2MIn25ZI3PA/qIS6dJ
EPkdSuK8SoN/8SFXHACUkSvNzE8zbDycIln9o50QO5TJeiH2uFN+CROr2sSgMnWO
JRzmqPhcyDDyewKwq4SfrfUUJ9O3r5QE+3rr/hb2ntA=
//pragma protect end_data_block
//pragma protect digest_block
l2VlmP1on13g9Bxhx1wt7M9rjOw=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
7NcN2aoy8Rd2M8o9VP4N29DeVmir9nL0WDLaV+gp5v8olG7aROCTVW2nrgUee5kX
6F4bXOYETgs1fEHPTV82HgTmLxuShISFjqcQl2tvEC22dSMwepON6gMcZ3DrEFzi
/rL0IN2pl7KzjvsC8JxmA8GCrPyN8dotGVREwmXV+ZORo4uD+ZInKQ==
//pragma protect end_key_block
//pragma protect digest_block
AeW4RfNQV1rJnVBi29V/e8XGRS0=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
Popv+tcW6TGcBf0T1lDk6axgjk0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV
