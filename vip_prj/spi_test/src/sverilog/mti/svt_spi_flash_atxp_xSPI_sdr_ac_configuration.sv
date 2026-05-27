
`ifndef GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto ATXP device family in SDR mode.
 */
class svt_spi_flash_atxp_xSPI_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command in Extended SPI Mode
   */ 
  real tPeriod_Fast_Read_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Quad Protocol
   */ 
  real tPeriod_Fast_Read_QUAD_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Octal Protocol
   */ 
  real tPeriod_Fast_Read_OCTAL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Quad Protocol
   */ 
  real tPeriod_Burst_Read_QUAD_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Octal Protocol
   */ 
  real tPeriod_Burst_Read_OCTAL_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tPeriod_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCSH_ns[];

  /**
   * CS# Low Active Setup time
   */ 
  real tCSLS_ns[];

  /**
   * CS# High Non Active Hold time
   */ 
  real tCSHS_ns[];

  /**
   * CS# Low Active Hold time
   */ 
  real tCSLH_ns[];

  /**
   * CS# High Not Active Setup time
   */ 
  real tCSh_ns[];

  /**
   * Data in Setup time
   */
  real tDS_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tDH_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns = initial_time;

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
  real output_disable_time_ns     = initial_time;

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns = initial_time;

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDS_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tRPRE_ns = initial_time;

  /**
   * DQS Pulse Width 
   */
  real tDSMPW_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_atxp_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_atxp_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OiVSnA6WzXGsXSEKS1ZwokXfcKUN6YpmUIf4HknAZZ2ECFwkTRh1+8oc21UtAAbC
nDC5IleCHr2FUqOZw/TGgrhTA7d6ufL2Tt5usOPkPDGI9wJo1YjuvlzR0yhgKalP
LlIkzOhRwN0poMcm3dCZm22ayeBMDPVIqxZKe+gkllQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 785       )
eHoau6pp/piKjZwl8MY0CB+Q1+Us7hTFeQdvQlPa7l4ky0DaUTMk52Wh5UiHKHQO
hfme1WW9qip4MkwWb3NIAfplit/G77IczkDR5S+DIts3tQWIFRKbjgFseyXs/uhn
MeKX43hhPDXlJn/dLs9x5f250J6RxHrKyp0cZFjIgIvA4LEvBpHC0BEOUrSXqRo+
xOZ1KRaRbLFywLKU6fzckG8ZkZtjznKYIWAWR+/z94p8lb76MOCh5SnVaVDx9y9r
QsIDKBCx3Ul09enP5Ip+fcekEWrGvVZWxDpei/sVcufyZ6LbzVDpshPVDX44IcoG
aY9aTwDOHUk2X5mDckipgBTFJEzmdj40OoAmj+/0RhZKHr7RRMUE87h8GSbylFJs
wJRTbbTpv2iJ4iBy/46gfD/NQPgbHAAUfA8bVEDbq36QV9l5VyMtS/T9DtPfMISU
DntELcyV8X10NqQKhWzXOJvvRQcRBYHBcRGwrCND7zmTd0k/aTAjQd3quScB3Xnc
CNQSVKFaSyBtAB6+iJzP++8YydnjMmsKXGVsM2yDdEQsPS6wdps+2uGwfDEEcqw1
xi1i+eYILTBgcLhdfIcJ3eqhvEwRUywmhMv8f5E4oB6m5S+QjnWsjZJhnC54JWG4
w/6zdigDt8coPwyJLkcbf2GfDOo1ge/VgcEXpBZIFXQZElAC9vqJhkeRNZJgdcN0
q0NxV0EcfI6PzHFdzpms6WljjTd9Yc8gA7zRL29P0H8b0jcsFheLiYmr5SoQ4vzm
9wPKi520aDijTnAvLrV6X/ZuYbL5we4ktxnhGxX7Pe9FWGj4HYNx/GHR8jGc9YQx
say/iMUJVA++1Y3iwk3m6vWIqH204uL9I2mhjxU+F91dfcAnKbSf0qsJnxDKO5lv
HN3QUkd7vF5oyeB9J1kbGMhfdc2RSPOVSpUrlajh6HkQMJfXVqC3/VJL4ovQVSFE
ybobyVoSRJXkka3kfjb2ou6Kqw+wZB0Vh2Of2r0CEsosSrFP7Bstd5WXOMNAtM8E
Wi1oYpHB2keDE+xcTkK63kxVBukrSBsuaDVxyt2UIgc=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
curtl3kzjc1PKR3Toi0Q7/bivlZw2ejTHy4xp9MjjQBVKsBQhVfPNv09A8V8YnYx
Rk/YsRXsX4TI0FkU3kb59XqNg54Vv03gsmHA2p/TzMttyQBNUQonlsQnLJqcRBd0
bN8TJMYaBmMNVs29EvyedV7apNcfZTxKo7yl5lb5YgI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29110     )
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
ZcS3otF4WZcUQMFC8TOzww==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
EIcd03HnybRT91RSRssG+u6TR4m8vbdjTTGnzvRjYm+GWmTZ3yL5t6A4pLRdwjD2
/ODNUSpPkuu33OKoDVGF++gzQtLtDqAjtI7fgNXGcctyeIo91vgU6EZNC+w1KR7p
SpfGlfp2qzg1JnEAD9Rujl6CiJu1AkZCq7QYSORh600=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29193     )
Rr7S193wktRZ83TBJRJ8RXueN9zNFiyAVRZDqx8azTp3F8+hcO/23HZZXPRiYg4r
UbHsBt8/PMpQsV+50le0Btctl5H8djrjSr2BvmgNYyHU5IPr+JnMUuYx/xLWKoL6
`pragma protect end_protected
