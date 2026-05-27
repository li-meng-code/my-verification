
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Omt+kNB8jjiqmJ73mB64foGYqG7X7XN6u1sqnPTm14beaViMgeesXLnXaPSekN0P
5u5XCkL4Sm1sN05uvD57AdhgO94uII4sMYNhifzwaZwz+XjmPDSlaOLF6Utdp6n4
D8sRSTnUF46etOzFPXG1Xh6Ht8Zv3sshiUFCE2zPlc4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 813       )
UfMZZW5xtJU2tcE7q8MRcXaBGztlP9g7/AvV2ZdkWo1EkmmNqFOp+O7Z1mNiJBty
pgI4SvP7IX7YrMfTKtLBGcT9Ze875XLg+DQFm6cmkDGWrZfFCOqj0RoRHkj0nxnE
f7Walh1repH9ncBsi145eINk1caH5NekfMWIuS11OtihSrqxlyN+ojsk5jCsujuv
YRMhqV9GBDIeB6IHBurtpKE+lvucrz9CI4YS4vKHXCCEK12JphcbKPWem4fth6Am
pzASMRmNx7amEbTjETSTK3AuXJjWDzv2ipJZoJwqBTYzfYlZN0sXeaBaVvtb/2SD
p0Pq7AAsUBLBiMbfa65FXaBH7Pcw3xzFIrki+Uw8jQuaFA/IP38W93f2L34kmaH5
FRvupteNa/IsSAFpuBiJMo+9namrnSEdHDVTFPd8NTJFUKqTZRN6186mfderd2mw
ZfGvn4G4HsVxs3jAMWKrJAgf/ILnCH9L9N2S+Ui+dGQk+KdqL+Z7q09UeI7t5WLd
5gByHn6J0wiAy0U2/MjGi9KPEP565iWhiIOIaLZfgcDBQAsX2wurNFCyIuqMOWIz
tEN1rxGe6qoPMpVQ2s289IXFLBZTISZCnlIp7N+ToRZfvuWAqRBpkhi9UqW/mX9B
cEmzqjl2wwOkSoxHNJ4B0a2/8RtwvBF0tHGL7Y2hxf2qIsnP3E1d689HdCDWCRx2
Xw87/QzaHIwnOBOWc3gJs6e/qAd2tv9BeptaYozfyR4sL4fNnTZhVf8/BpR5s59w
swGvj/7dPkIsd1s+EmLZpnU7y7kIsm8I54oEr3wX/Tgg8YttJ7SbaItxDtxS8UbD
k34sLrnRTIqw7Ac9eCHyUai8owIgop4t1iEL6qqOOm/UAAdxHbPcOs4+5uY25n9M
+oPsun1J54qBAG/W57G5fmUoNlbMuU+QY7rwOhu5vdGdTtv6qTYnKj9cz3UtV2r+
38ORlgsE401L5H5eq/+OkdZpkqaneoPGg+r2n1Zm7FQC1+sNjDV4IBNYQ5eZDcJl
NtuvztZy7FUTd9OHZdpI8+v96V/XsdltIKJXuxHAiRlr/Ug0X7vSAzwmyh/zwjiY
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MPGnzUtd4Lye4JJlS9yJumImyMh42u3CmAI4WW7KRW2fvIEP6LNbwklQu1GLsDEC
yhC/T9P1YvpMAn7+QU+6c7f2LtlGrK4/eOROV/+G66qvPxJsziFLWrWnRMy3iaCW
DWEv4zfqKU1spPCuTeyHONhvGEta0oXznkfRKCJezaM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 28125     )
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
SN9ekji2Z3TUbGem75hUtw==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
G60zn2Td0CAFuzYfPCMoTW6FWjMgBC+HM3XsT/FHfs5r1oFPa4621PUV/HPAVxhV
ZPudFU5mHXVsOKUrMWmht5vWcF52zmN9NRM0dqtdx8BPUmE425H6diFL/0Q6J03J
yeALqDR84+k5h6zCbVfF4pEViyaxVJZW+jAx7ClkNDQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 28208     )
K+Nn99fKmrGT2zn8fCS7oSLQH97Gf5O0PiwVORzEc9MvPFrC/s8ze7D6MSf3L8Rp
qryQUszHMqKuMPOqTerpPG+ZN0hLiOJZJtWRtgorr8cH3O02LuA5oteepzCtoK1g
`pragma protect end_protected
