
`ifndef GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto s26kl_s26ks device family in DDR mode.
 */
class svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
TCkNIjE2gaQFqbr1R6XDJD+u1uhbgTgxm6+/T5CRfwxgBrcr/kORjxqSkNNGCAfr
nBYF9P9ZhioITwmntP93voxGVlaLHFSEAMTjcjTgGTDRVI5sgIEyvb+FFUJEeGeb
ECQZ7omL6KE1OXSJsQxHEL2G3WEKZVBZJ/pR3440i/ZUjMOhaGhJlg==
//pragma protect end_key_block
//pragma protect digest_block
UJt3ZhJWFdXINb9BcUfJ2uSaCHI=
//pragma protect end_digest_block
//pragma protect data_block
bHDAImGe1Ky5tHyN9kMoccomq5VKRyH8n1Kd61SxTLpl90JjaOt4bVVzu6zx0vOJ
TaGkxkuiW/iYTLs6bIOMzkqnrNEnZKcKn8cnW7YmfMhRlqzzArUnh35+daA5XR0H
Bpvp8lomi1FBKANJJi5JLqjV/0cafKUJDL85T6hC8iTKUZi+YBqhY5rLdLpWV1+S
R/jXUyP6DnNvwYt2UD8TesKcAmb4sGJn0O8UIH71rY+qWMhoe3NmsbntMo7u8oKL
Pb3LKAy8XOSX9X+QvzJX3ymPGjD0njLnNd2/NIMwybUGyQz2/lRqMkROwCWLCN3w
B/SDMXuFSb1o9IbC2Wkzh2HSbi1XN4B23zIaPfH5d4WAGfo6zOSc0UKp3hRnx9/u
LdFM+hUHAy1rVDfU+x4QZW5kebjEd2tSXP9A7kw862Xc0JFv3B/uZAYPWF0E/Nwi
YPvdzhntnjW/1BNxSXJIpe+rHgPliwfqXQklfnZui6cd96GDO2gFqcDDjI7QZrny
LL1dbg6Lwj4JbhiHomHqR+kH65JJPz5FS3i46VADMwXwST+O8tKa+a41Wafc3cdn
kQMhuUT1gEOa+fnB2HX1T9uUuUpFJSFTlyNCsLNzlne1SimfiRqmWPIkZpnLF1Q6
82ry/+63dGqVM+ROyMmm6HM0QL2ut6AeBO5BfFO2vVPYrN0vTlXmmIbDs7oThyQN
hsksG81g4hr2FtZ4cWCqYl4RhRUefYqGeqFdI6NpNfYswEhDEFJtldQ9Kka9HaLC
/mSg/GNj12ngg8Z6jBxU5pTi73v2F0TiN3C11t/1yHOlQ+8t/FJYCTZZX8eqBcpG
XysO4Y+P64dvsZ0yjNdMtGKldFfKZiPHW7MNf6TxwR/0230zaLwBQom1tzq2+aht
3isLoAMBtaMTfoqTDoikCKmbsHShbgPOjeumCk/IiUNT6P7LZ+Z1ZE0g73QpdHVi
KAbk4N0fqeT45eXPx7Ie/r1KAETS2+dXMWz0u+QhEgr6weApXVzBe8xi8zHqJAdy
jzYOlAwNCjl4SRmxrzjQIMblHvG7ho/muDJ9F9DWRAepFkDYWE5s6+k53MK8z2tK
lmxyuy/jtd6M0VaOCyD0AEzd0kGaywsG8WM2kCXyHvkxxSWBziGTx0xQGdf7wSxg
lckOHR/ezCJRRCmeVs15ASrzry0b/GeaVa1Sw81g7ATeUjELBaZXFd32H0cgD4UM
iTkm0Q4AtoJAPDzB+gwjnRIUivr4debbFdrfAN+6jWoYg0pRA+riJwxWwBgrAH0+
r9hxFct5U6Tr1dwYFz7VNIMAk/I35Ztn2Tnc7swzLng=
//pragma protect end_data_block
//pragma protect digest_block
Khxj9TjSC7umiW3grIq13yEgqCM=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
f5H36xklu3MSe8SbYiprdBtOW2V3GgyvyJaDaSWbYji2kyQP6V021yLmotIFE1yw
n5efMiIDln/aYddJebAPU7A+BkX5bYMfRUvWOyQYC7kOm0oEibw+9tQKcWFR6oWy
SX+HQsaeU17LCIwG9y0spljXDBVQWNX0V0qtjWIcI5eelgbvyD5RVg==
//pragma protect end_key_block
//pragma protect digest_block
rdYm9KWZhwndiuK594aHHuHksTM=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
req3uOewQGa/h/0V++1ud4s/zDI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_DDR_AC_CONFIGURATION_SV
