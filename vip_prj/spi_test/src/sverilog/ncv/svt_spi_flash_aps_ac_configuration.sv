
`ifndef GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * APMEMORY APS/APS_OB device family in DDR mode.
 */
class svt_spi_flash_aps_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width duration.  */ 
  real tCL_ns[];

  /** Maximum Clock high pulse width duration. */ 
  real tCH_max_ns[];

  /** Maximum Clock Low pulse width duration. */ 
  real tCL_max_ns[];

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

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */
  real tCPH_ns = initial_time;

  /** Minimum CE# Low pulse width */ 
  real tCEM_min_sclk = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCEM_max_ns[];

  /** CE# Active Setup time */ 
  real tCSP_ns = initial_time;

  /** CE# Active Hold time  */ 
  real tCHD_ns = initial_time;

  /** CE# Active Hold time for Enter Half Sleep command */ 
  real tCHD_HS_ns = initial_time;

  /** Data in Setup time. */
  real tSP_ns = initial_time;

  /** Data in Hold time  */ 
  real tHD_ns = initial_time;

  /** Chip disable to DQ/DQS output high‐Z */ 
  real tHZ_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** Minimum Read Cycle */
  real tReadCycle_ns = initial_time;

  /** Minimum Write Cycle */
  real tWriteCycle_ns = initial_time;

  /** Minimum Half Sleep Power Up Duration */
  real tHSPU_us = initial_time;

  /** Minimum Half Sleep Duration */
  real tHS_us = initial_time;

  /** Half Sleep Exit CE# low set up time  */
  real tXHS_us = initial_time;

  /** Half Sleep Exit CE# low pulsewidth */
  real tXPHS_ns[] ;

  /** Minimum Half Sleep Exit CE# low pulsewidth */
  real tXPHS_min_ns[] ;

  /** Maximum Half Sleep Exit CE# low pulsewidth */
  real tXPHS_max_ns[];

  /** Minimum Deep Power Power Up Duration */
  real tDPDp_us = initial_time;

  /** Minimum Deep Power Duration */
  real tDPD_us = initial_time;

  /** Deep Power Exit CE# low set up time  */
  real tXDPD_us = initial_time;

  /** Deep Power Exit CE# low pulsewidth */
  real tXPDPD_ns = initial_time;

  /** Minimum Row Boundary Crossing Wait Time */
  real tRBXwait_min_ns = initial_time;

  /** Maximum Row Boundary Crossing Wait Time */
  real tRBXwait_max_ns = initial_time;

  /** Row Boundary Crossing Wait Time */
  real tRBXwait_ns = initial_time;

  /** DQS output access time from CLK */
  real tDQSCK_ns = initial_time;

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

  /** Assign refernce of spi_mem_configuration object */
  extern virtual function void set_timing_cfg(svt_spi_mem_configuration cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Randomize tRBXwait timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

  /** Randomize tXPS timing parameter in between declared range*/
  extern virtual function void randomize_tXPHS_ns();

  /** Randomize tRBXwait timing parameter in between declared range*/
  extern virtual function void randomize_tRBXwait_ns();

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
  `svt_vmm_data_new(svt_spi_flash_aps_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_aps_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_aps_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_aps_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_aps_ac_configuration.
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
  //extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_aps_ac_configuration)
  `vmm_class_factory(svt_spi_flash_aps_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
w+NXRld6msv+owO/bBvL0t+2tMpsU6WhPe2bkyaFRhlf217HfLERzOS0Es61grTA
wkW035CwtQA1cGnWRFnTLXxaPqU7W1IBC3PtfH5I5bYPingNGxu4yDTs5+d+Qaxv
rfF4Qeu6ojJ2ewtOqvt/NGxSRaDgQf2t1SdwNdv8JcTqAM+IQA+QOA==
//pragma protect end_key_block
//pragma protect digest_block
mo2J1WyBzKsvPfdtCjIAQSun9OQ=
//pragma protect end_digest_block
//pragma protect data_block
obJs6DD6jESMpzvybbfb97FOOh8dkU1oCP/FtgVn2/zRIkgIGGF7WqOvI8MKfqB5
ka4f1iH/VxP0+p+9nHvGCrJxVQhp2JA8v7zJz03aAbOTvDZMSVPOV3cU/UJHySw/
cCkPi7H1rlxP9U0/6rXtqx0xNxj34KRVDHNVUtuYye7HPMJp26P2Nvw/HF2GpdZH
bwh+iY3DLYk3IzceYkhbMo1axCHdwpoG76EXXINUWV+qRXVN4ehSueoIwOv55HCh
I8X9DsB186vKYAKIlGazKrLyphdvoQaGJwMNjQa/WYPUW5cLq4wO3ZvbUsHmEDV/
fL5oZ+fc5bbrssbg3jukZFxx1ZmPOwyysG0YasreIXOVxAQHbXq3gifI9cmc+6ub
VzGh5F41kfb5XXHWv7L29syBZl/o1alV9p5DdyBzcOr2qVTZ3QbGfm+t38isLh7A
wL2xfvU5fDIBiqC+ptf+XJsaHm+LF56cP8BEIcyIIIMM746tU+LdAudOia9zQfAK
MgCbO6d9EHq+YXCqsO18ZGSYpJXwel0y7qbXxl72HlDZmgxXfKjNBTFYheac/9SG
0BjrG4daiHVsdu3utVEDelPxM/+1E7R6oBxs2VQ1Nlos3HM4528c9MFuzQVUqYUk
d2GrTNwiook0+zQyAeVdgS+R1juZ/1InAdb99lyDLfTeMYSaksfg+v14XCCnWIL+
rjLln8XCfQZEpOfBGBnUTS0684priJJFULv2msPDDl188+NL+3BEMCqxMQsbgmi4
lsU4pPudUlDIXt579TgO6LAhSwPTEhP339EOpNHwmMS5v45yWc0H1LNxcMeg3Q9/
PWGPUVZAJXCU66L41i80+YMOTyfx1OaVvpTi8Ge36vYOZecC7AkBijBxqMAyoW7O
sztUawVgDliwVYWMuaqhQHytyM3U7VO5ztvjVd9/195yWtrbJhAzDTf5Y4Xt1E18
Ac/Dv5vsJv2zPtHaAQneIlcZU5+4rM+1/G3AP975krYOkzXiCrz8PcgWcZhzIHE+
QVKmfrlNXCwY4b7kv1BjeTd2BaMS1ZEvzbwHg6LPSEMar+HdRGrpQFwjPhCCYfEs
qs388WUmJ8YLVWLMmkXP4kl2KB7V1cBp6DMLI8qfgYNk1RAemwDJN3CUxPC8XLl9
ddtIvZGdjllidxyK9NWdY6f1FBj2UVj0/2rG/HUitsyj8HzJ4FWubsxy5FV5BLed

//pragma protect end_data_block
//pragma protect digest_block
q96FsDut+uaf/W1NhkJgAPH5E+8=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
8bbXLLac6a1vznn1M+gv2Swl5R3ykMaLQkwD4q+eiWVCbdrFhksKTq9hknF1j/GU
NXM19hP+zdtD7z5CwdCfKNschI4Oy4ygbbOxQThFloosTUFk/Mem13rsZgD4iBur
CAWM1qQbmJCHtRLb+pcv6PpF6n9DM9OnjQSiV42yAUApAhF/ck3+pw==
//pragma protect end_key_block
//pragma protect digest_block
4M8R2wy1ZucOSWJzluv8vkdQupM=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
7A8tlQdaxUS0xhidfBK7pcuVjBM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV
