
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
GjKziqP8WNlARn8ApQ6+95spDtfYogcgJkiP8vb5cHk4x2dY7Ir8HXw1hrcTne7k
T6h4p+1zoIgYWzAAdCm70mtrToyISu+tbnIsKjv7e7EyGhLTDOzbTCpEfFXVn+vw
q3+KhdOd8397esLpyJNroD3uQ1TgPLYzo+Aljvgisn8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 551       )
yzke6OwZ1xzYZjqgceL97yvCTXk7UUAeqz1d4tfnVe7lgZrSGy0wsZx2qmHaudOa
1n/HYnHb4nvJfbw3nL0WzCviIVZN/zs7EM+YSnZdVE2xBZMrJOM7E0+5OJS2LQH3
WGCKcd++Cm0g3dJSorc2M2aa/f1j9TC6wE+k5gCaIrStwE1ZUD+XOwVP2ruCVwLw
NuuldudSiBowmoRSD8VjnpTFfI+bDzBAav0d9/cIyamAFu48mhecxytwtfuUkC00
HEtLKKFOAXXbMXNQofvFcqRqjeZ7gic6H7BG8RQDWLMG5s/dXd6vc9IjTXn/qrBe
+aHpLKPNtK9UoREOsttpNETLtRbBJb4nRjAKwSRlFj5nRxkpgr2LGZhj1I8HhJVp
ITybfTlCGwgAexHhbOxlKMT/w2EFDUf4XF9J58EvNsLYwjgDQ1RmUWPda80ktGpO
NahmkARlyyoARVQa0HgX7WmpPO+ZdAEmqoLZnXf4yRlvbvrO+eolrVoXTmvTX0BS
DGKP4yoj977L/Em8v702JBUriO8zLXxnWbwNlPOqfkn3ThlOFQF0dNb9Va4RXdj3
lmCeyWfJcUn993ZLosSFVLYx9p9xtxJPZxcN/XIteGVMQ/0aa3REOibF7aN42abw
3A+Nz62qkTk3FVrWSx00kEMJ8pp7O917LUQ+kvss59iOd/FnFqOAX674yhQ9f9XG
qtPUzZjQYRNxelu8kTzon+wFCXmv62gpDl5PnFeuIe8=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
miG1kQf7sl/rfyOUslspv5kuoimY7a9X0LgjIAJ/L0J3xzs68iz6HyA6Rhc5qpnE
ohLr8dg203+TVWIR39cIHeSD4+VHvAT1PwP6AZY/O4RNrIyMxoucQtZ4gTgED22m
hq3WLaJ+koiw7fZ/nktq22SOyKN9xa+vXgVHseg6oLw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20360     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_AGENT_CONFIGURATION_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JUpHUemLMYgRpgWPhNguRvXGMCpRqBz+IZ/y0a8rScwG2/qCWN9wgY3Az9Pof7oA
lXxi63kWp0i5kvsoBVholpPnlfkjLnYZPui8rNyJ+caXPA6x4zhogUU6Mfif/kly
+WC4BiUqYMiWA6/EvYiyE706ggUWo0rlqcH0/u7/6tI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20443     )
dtMUeidFTIPwQ0IP4fPw+49CQicRS2N0/VmY0qovybmMeZ4rg42yKzm1P4Jif/ae
LNn7QEMSJWelZvYVOQdvt4ZVhNHy+6sth8Tm5eb4+XA/UWVEW/mMfp3i86+vXnt/
`pragma protect end_protected
