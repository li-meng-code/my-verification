
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
o7eDkgz4VgumZ7Eheyywv6EC2WJdHLcH6yhUXc6kuw9BACQJAKA0nY1Wtb/ejfca
MXxZlstLq0BjpNGN9t+8F+t9BWcQI3h5E/lFkRXP9Wt9vPa4dwJZIJos+qsxHN7+
2C2+StTTaA+h91ELGIlVAa4YZCyI91jwF0jVJVPpDtqlz2gr9kHxdQ==
//pragma protect end_key_block
//pragma protect digest_block
wC+K/zw69JwxCYnjVjQQK7OfjmE=
//pragma protect end_digest_block
//pragma protect data_block
FOHkX/LL4U4Aaf7Py6tfkWtd2pT8w97hZb5jHWDq9I6V0SdWcAcW0PA0UpBLBupV
oQslHPgA6kheWvGNoF4qhAXyl9x5QQyyTIjM2byFsTQohSnW733+ed3v3QBvm3hP
NaY7CbTqybIx+dRLQCVzfaqpOjcrJyl3NLMgkvr/nWWuHgqOKL1YEwwJNAm0/qTl
o5QNtXkVy5Cki7Sn8P6HhRiZpOuwZPN6JhKu+6+AD7rKbvLv3n47bbKHch5GNeGk
GekZBJ2AxaLXJ97/ZjQCQjc/myx+ovvyLwl0U3FPj59RxNrrgakPpW9pUex5XD+d
uNz0ZlH1TwxAditJzAgnO0jS1xvxHAW2yR33Q9iTh65mO9KVTlp5BaJlhRw3hZhn
zwmfZqM13SAblwPbvlsY3l8GDalerUSMBHQcDgL0Bh2yOimmRdvaQK6AABnD2/PH
8k0WRaIzQp9umNBIt7MVGlTP19CpbIFiHVylCJ2PeTQpDLrvtpyrS1xTeurdOjbZ
BMZlJ8e9H8lmv3wkB9dpO9A+fM1HkJxqTRuKw0fkStanbzn0nl4eSxJ0k+sWx1UJ
ipgzRyGSbCvyEvlOvfYjQ25bXUCMjwMartg9I/uRJm1EeJ8Vtz+ahynZ5SI1TOWP
8BxtXlmtLFxgNX1K1R6yWjgSYYTALadKB4lb7kRld8Ly/WTveVGgLnWynmhWfTSa
UUwe4BZPjaDyPjGiwiN+S9WxZHe8mzeT5BwaDbMCTiVzC4QIFDQi9/OHXLgTm7k1
LUPNo9kV1PW49HbGpN4kALdgyst73uZdD7IYCjB/OaeCyc7clMEUtrPmOUhlo+6q
9hfTnzPDc67z3fldzlrkavC/PKN0+sSx1VzF9YWBzMF4NGgaSGzY3KxqWddFiIle
OhoGpFPMJA2tE5Jz483Hu9BntYIkz7ZZIfnldZtVkoM4S57uXnCkCX+Zl+l/Y5zG

//pragma protect end_data_block
//pragma protect digest_block
V5BWjctytWah04779ldLHhakVp0=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
9ywqaRG+4J5QJzTi1dBpTphD8JBF4IXSvLo5ZGkXw91i4sQoyGxY0AI2QEAOhH43
wQqPSqYQCwhKLrLxIgfwqQsSNnExQHyjajKveUI9FLEQAf3W47VqsMpaEfIMteFC
OJwW0ZCr1qe4O0jtVTd40Lvh3xA2etz5lA1pj4sSXfY7VZCRHqJCxA==
//pragma protect end_key_block
//pragma protect digest_block
WlN+im1oQIA3V9MmGTlnTuhiw8o=
//pragma protect end_digest_block
//pragma protect data_block
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
4pXgvkRNjvFWIqtdr0JlTg==
//pragma protect end_data_block
//pragma protect digest_block
SbvjI6cD+h2d/oiqv5zhWhqWxag=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_AGENT_CONFIGURATION_SV

