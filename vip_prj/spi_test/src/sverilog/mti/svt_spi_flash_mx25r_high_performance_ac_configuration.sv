
`ifndef GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25R device family in High Performance mode.
 */
class svt_spi_flash_mx25r_high_performance_ac_configuration extends svt_configuration;

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
  `svt_vmm_data_new(svt_spi_flash_mx25r_high_performance_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25r_high_performance_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25r_high_performance_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25r_high_performance_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25r_high_performance_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25r_high_performance_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25r_high_performance_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XhVkB+jL6489y9YuYzG/8bm3kA0J9CKbaVw1LzZqz+YzTgqqris+9XBjukadjJDD
X/6oHFfVysPltCnRMiESrBjInd5zYhjAzdDbthknZv4w4mSx0JXwvtxMdVilh6Mf
2SN3KPc1dZfduzA/9BnDBY0paE3FnR0PtgQygzHPxMc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 821       )
DEAC3mD2Wv1pnGWPpyCnN8G9QvvC7jkZc/f7DJY+KA/AG7WDZ130bHegzvIZYaVg
xX75JNLFJQpGBXq/pJUFqsDuSpZgez49e7plrYRLWdpM5iJV7+1oW9t9fEa/fPfw
G0x5eqrr9oWfKeeENASdn2HZGmlISyymvETB/Kp6rptmJwZPl2aMEkZms9BQqaAQ
VqPDsLdEk14+AnsrVwb1HY4nly+iKZmzOLMx3a7wv5ux8gP4x84TZp2SNb01WkGp
iOilMSL9F2+Plv6aDOXJVwdfHymNqFMilcset70g0oYq/c14Xdeit+U32bfAIYnx
4NVrV0wFoDVUNXtRXbCj+XX3MwEwTMouSMTjWUs659h2F9999KZDVupUf8zckqVW
Vmp63L431uU9/ccE/9Mx8IuMkhqQ3oIyIAL70v+Z6bxoaMNFlCGdIw+Nxj7HKC9Z
XOqhxYyU1qj+Yh/gbnhZigzYH/gJICkKoiXRW8AnS7rv2NBvrS6htBOWb6XpdEop
vDoZOaFDL8LV73YUY6ptqcS6qdFjWBhe7iG6uotjNMzlAucTxHoEZm/PoNUKR2cf
O7ejy8+Y/eje/wgLJsEkVvu1wAC0TDjy0DO+9uJebK9dut9SaApXLpzkElicpYSV
KrlgI7UT302iiHl0sEQmU3UPUuj02xsNLvcYWXtC/JzAd6w206ewXjnnL3muynmh
cJHv0fbTEjR2tuKy3HLdLqd3dVSyQrFfOdhE+wfpIUXxT8qntV8cerLGoyMTkHmG
DQjdO7+8Y/WIIotz0sqUDHVWGnnprOIxWvAud68pYfcEqmIKB1fINcNsCOsJ0wna
pajm4VkC1F7hBTmkZJSxWG0JxIevOSvQZZZQmKu974DzcvSbY0JPtHDlErKho7bb
cvGk+wsEyFgGJS5JAghhBLrcD39ncX5GHGvSmfytvCBfmrYipAIZQ+kzTz6Kzt8+
wY/wWDyBkobj/Q0q9uAbD8BmooN2S8DlASwRynWNd/IfGjgNGS51rIGeTE+OSE5P
0phMVB+nOzWTMemW2s2CDAHLcFotDojBosv+q4PmCE3TSjOTr10oE4d4oeN04LGs
DUu0R+bWhogp8jwAHd17sg==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gYj4TGfXGLKGi3EqM+u/+7JXKpWk4lO2iUt0GbEDB4LGjUU7/hj6iAuyom5E0vlH
5Y5DmjuBzf8QqjFz5IZJ3ovNtpzEci6bhbG7SmRSaRcbTO3PXWp6u671GUyWIL9W
Vk1C+QEqfnLNWxE6NKr6XEsDd945cnDBU4vESRh1ZdU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20871     )
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
QgwObWpxCXMshI5PtQrJEygmfKjqZKczsRAFgByPthRjUgp0CWydIdwkPb3CKNGi
s2YBoUP8UaSaFMQVwShOVhGSq++MjqoCcDyLapbSJ5HpXr5RKTcEOJcLpHvhoRHT
+K9xxDnRY762EqhoDn3jvNQeRNDJABk7+0XmHQ4pARj4KyY6my/3Q+z0T2rT5upR
yA6JiEJQwUGiE7oMGfsxqBl8Pn2PGsg/VCm5CKaubX73+bZkLPUvaUJrlzzcW5Z0
RhWgRbGnIgjQyM+AFQvLjvGg/3An4cXYEcktlz7jIQ4ygHMBqxoBLJx8jMgk8vUH
RJhUNVcj+m7pMLxsz9tIiVGi3WrB6eQpgoVlge61W1xpRA2jSNWMl2OqZJKedzqF
JMYZDjiCrRicecZBeqRbf9S2HqghwBHbNcTe4OOfHx6WnDHXMVaXFOnJzxdio+bN
NpGtSI6qljkguJ93M9w6Dnr2CPJtMLH7toZzTqEl56icSeUUDOTpBQbO5+heX1Uc
6pjIQkQJhAqqTG+WOv0J1I/xOKiwMQS6E8g9AuDwx10Rq2D8tHWj0hCDhnla9zmF
wW0i07Nq2e9nAq5s7KY5WOSHJFFJwYBnGgk3+Sgrpv4+vWqmSJDU9FJ9mxwdkp+y
l/V7OIH38OvrcpMPuAUAjYqHzPB+os2RWErc/KIB6pJFLWN1fYl4ZQHvXILe1vou
U0OhGpm/z8Nrc8Uoveuawh1eN5Y751hwLHeJFLNIWt6eVUXmjAMrmyHdWDoa2DI3
dxj3aMP1/a6jebpCKq9l77IznEtrBWqJXIKDqGhdANoKVg22G6gMDLl2pvT9BN/e
PipjdTW5PMtgyEJ3LIntWSGt5aZZwIGGOYc2nb2dPemY4xWujkRvCa3OoyCJo7Rz
h/u80qqoum32+aPFcuRa7YM80lT65/sg67H7TOHaf93Mcd42d2NWaSpxg5M+za6b
pET+XYMe0k4aunoaJrQJtMflGakaNeVbbS9CRSum8nfPgiyAECTLWivRFCcTX7LY
jSlIb/ecjdjhjouciL/TP2VfmMtYDvV4i8a+L0cmqDF0ypsecdRgYMvSthEr59AC
id4+D1+SFa2dkvkdxjxpdGAwyiIuSjnORnryOTz5mX2j3JLqbu8CNNMziSFQzU/U
n6cpq52Y2mNuKLmlp/nieu+W9fCVnqcCf5NevXWmnuofk2+Uq7kWFhhH1zspwzoZ
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ilc5jwXov69gbZ18uIE46BgsGzyVJ8pnUw/yNf+y+hFR7m9DKrnMtsN4AndjFoCK
twvm2ZCWacAIVgdsHOyn2MBnVApI8gSdW/iQd2ryS/Y3fhSi6Nrrjxbx3fyHFT3V
NOGttKNcMxA+Oan7a4OebZPde7fqR5Gj59edX+Fr4gc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20954     )
rZoobWXSeJ5dothetIfSjlkzplkuytuhbNRzWJORH6bTm/yfKVirO5IRo0ZxlCkp
Q+X/MqvlpuTFsTdXpUok80YAjVYFXj/pHOASNFUGtfKr+12wfeILVXbWymU4U6ZR
`pragma protect end_protected
