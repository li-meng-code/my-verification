
`ifndef GUARD_SVT_SPI_AGENT_CONFIGURATION_SV
`define GUARD_SVT_SPI_AGENT_CONFIGURATION_SV 

`include "svt_spi_defines.svi"

`ifdef SVT_VMM_TECHNOLOGY
`define SVT_SPI_AGENT_CONFIGURATION_TYPE svt_spi_group_configuration
`else
`define SVT_SPI_AGENT_CONFIGURATION_TYPE svt_spi_agent_configuration
`endif

typedef class svt_spi_system_configuration;

// =============================================================================
/**
 * This class contains details about the spi `SVT_SPI_AGENT_CONFIGURATION_TYPE configuration.
 */
class `SVT_SPI_AGENT_CONFIGURATION_TYPE extends svt_spi_configuration;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Bit indicating whether the VIP is to be used in Active or Passive mode */
  bit is_active = 1'b1;

  /** Bit indicating whether an Active VIP should include monitor capabilities */
  bit enable_monitor = 1;

  /** SPI enable_txrx_chk bit enables protocol checking*/
  bit enable_txrx_chk = 1'b1;

  /** SPI enable_txrx_cov bit enables functional coverage */
  bit enable_txrx_cov = 1'b0;

  /** SPI enable_checks_cov bit enables coverage for protocol checking */
  bit enable_checks_cov = 1'b0;

  /** SPI enable_txrx_xml_gen bit enables xml generation for annotating functional coverage */
  bit enable_txrx_xml_gen = 1'b0;

  /**
  * Determines in which format the file should write the transaction data.
  * A value 0 indicates FSDBXML format.
  */
  svt_xml_writer::format_type_enum pa_format_type = svt_xml_writer::FSDB;

  /** SPI enable_exceptions bit */
  bit enable_exceptions = 1'b0;

  /** SPI enable_txrx_reporting int, indicating operation enable and depth. */
  int enable_txrx_reporting = 0;

  /** SPI enable_txrx_tracing int, indicating operation enable and depth. */
  int enable_txrx_tracing = 0;
  
  /**
   * This field is effective when #enable_txrx_cov is enabled for SPI Flash mode. <br/>
   * It is used to select supported flash part numbers whose coverage object shall be created.<br/>
   * Coverage bins of loaded part number will be populated in a particular simulation. <br/>
   * Simulation run with different part numbers selected can be accumulated to check the verification completeness. <br/>
   * For example : <br/>
   * enable_spi_flash_catalog_coverage["N25Q_1Gb_3V_65nm"] = 1, creates the Coverage
   * object for N25Q_1Gb_3V_65nm device. <br/>
   * Similarly coverage can be enabled/disabled for multiple supported part numbers. <br/>
   * Please refer to catalog for list of supported part numbers. <br/>
   * If a SOC supports Two part numbers lets say N25Q_1Gb_3V_65nm & N25Q_512Mb_3V_65nm. <br/>
   * We must enable this array for two supported part numbers. <br/>
   * Simulation run with diffent part number can be merged for verification closure. <br/>
   * If this array is empty then by default coveage object for only selected part <br/>
   * number will be created when #enable_txrx_cov is enabled.
   */ 
  bit enable_spi_flash_catalog_coverage[string];
  
  /**
   * Reference to the system configuration object.
   */
  svt_spi_system_configuration sys_cfg;

  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
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
  extern function new(string name = `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_SPI_AGENT_CONFIGURATION_TYPE));
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
    `svt_field_aa_int_string(enable_spi_flash_catalog_coverage, `SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_NOPACK)
    `svt_field_object(sys_cfg,`SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_NOPACK|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
   
  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type `SVT_SPI_AGENT_CONFIGURATION_TYPE.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(`SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);

  // ----------------------------------------------------------------------------
  /**
   * Packs object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_pack (`SVT_XVM(packer) packer);

  // ----------------------------------------------------------------------------
  /**
   * Unpacks object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_unpack (`SVT_XVM(packer) packer);
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

  // ---------------------------------------------------------------------------
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
  extern virtual function bit encode_prop_val( string prop_name,
                                               string prop_val_string,
                                               ref bit [1023:0] prop_val,
                                               input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
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
  extern virtual function bit decode_prop_val( string prop_name,
                                               bit [1023:0] prop_val,
                                               ref string prop_val_string,
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

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * This method returns the maximum packer bytes value required by SPI. This is
   * checked against `SVT_XVM(MAX_PACKER_BYTES) to make sure the specified setting is
   * sufficient for SPI.
   */
  extern virtual function int get_packer_max_bytes_required();
`endif
  /**
   * Assigns SPI interface to this configuration.
   *
   * @param vif Interface for the SPI agent. 
   */
  extern function void set_spi_if(svt_spi_vif vif);

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
  `vmm_class_factory(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AXhsltPPxt0un8kKB+C+sfiLOgYvDFgJoSI6nOMReNe1ik6KDHaRfWV0RdoHey55
zcrqUABMpCZyWJbExKiJqM/xQ/5QiUTzd20wJZXWYRJB+2Ut4CUnnrnNIwfmR41i
tgdxvP4O5CPJRRAW9Z/PTdj6o7ipO0bOMvCRUIJEJgI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 551       )
Gd7cEKKCf2fZJjZySWkkGAyVSe/QEcnYFC1WfTvgPEMEjWYm/PkPjgU3xof7xFIe
0xWsYOEOcOwIykFBN33Ya2ZUKPJ6IEj7atzRXbEupaLrbpezHmXeB7+d3nPo/nRI
VoqkBfO2gBmovmNmftPDP3KT2LLU5NAQTpH6MlcF6axtb+Br4Y2hjkzQNyPiM8+4
YYocy7DnZzVkvakZbTVjAjkecCMaMdR1uHj7VE0Hg+rIz43TeBJzi3czeGCjL9xS
A9haZAlefMZLM0JiKoTS6N7LmGOuw5XnRWwJgY4QCL/sN4Wjf+tGBBS6wDojZZvm
ygmXAnXv4qpLKFphbjvy4IkiLh3tVEA6d4spQ49lLb7dz3lUoCAzfcMVGGD2mm3x
xwQwQPvZih2JvgH9YsnFCxH4Sj7rruSJGnFAbCZV1rH0kq2A/K9XWE1OewGaF7Ni
RmvfgdiWQQJnna5w+lGkoqRqqjGtfpK+j+thKyO3u7iXepKevIjTAK3i1SJ2H1aA
joq6ZrOGdVnrQ1lehsd5OGqKvHUXfhaqS+2e5BYjkLed5aM579VQgHC573xLMQhF
75GDC4u9Kdx/l86Ra4pM6S7PXMCV7KpYH1E1fVPRRwMA5+UnEWATmsyx/oU7rD0L
Qoo7+1LkvqRa6kKZyh8uBwoIrBQNt8SCw/bVFPenvUlgEouh4t7iLqs03LE0GNVE
jQYIPulC6whJqm40rgO9yOa2VQQBtLQQSgANUJRAvVY=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ABmDgWAiN5IaFHwk8btZuU7DinBHY5/JXuYkJ7VO5SQfafwBR4g1z86LDbHqDsBn
yAhYKwjFYvZBvEuyEaAUrjfV6uW3olmGmuoQPwrg8SujjVZvnp/3y3erBiqEHB5A
YzRxIx7CIrTIV4La6sxl4zbVmUibCiALax2R/9t9hvc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20360     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_AGENT_CONFIGURATION_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
M+gqKwiSiXFiIWoMbUpLVTAHORvr3jWPNYTB35H/8ebLhwXEjLg+ra4wqDn2YQ1k
28TJdyV3zSoJGaQPJnGYhdkdWdQY5di/7kK9ofFH14/+OaJS9PBGZLDBSBPAghMO
nLojZZRXf2ZrUqHm8cfHZumKMYPa6QQxxVeTq45rVHg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20443     )
+Syw9BXs8Bo+Y11vqHYkyImUiQX0DwLNJy/ivSJ8sjahQHBQeEgBytBNyvR+uV58
ZwMEZLktn0bZ1u/P0JXLatD55PiGT6QzcVPQNOK3Mkgj0nhZgSREtb/eg6f0ZWey
`pragma protect end_protected
