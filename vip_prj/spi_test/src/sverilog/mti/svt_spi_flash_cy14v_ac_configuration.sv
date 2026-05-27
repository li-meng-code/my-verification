
`ifndef GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Cypress CY14V_family in SDR mode.
 */
class svt_spi_flash_cy14v_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width durtaion.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width durtaion.   */ 
  real tCL_ns[];

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */ 
  real tCS_ns[];

  /** Minimum Clock Low pulse width duration. */
  real tPeriod_ns[];

  /** CS# Active Setup time  */ 
  real tCSS_ns = initial_time;

  /** CS# Active Hold time   */ 
  real tCSH_ns = initial_time;

  /** Data in Setup time   */
  real tSD_ns = initial_time;

  /** Data in Hold time   */
  real tHD_ns = initial_time;

  /** Output Disable time   */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time   */
  real tWPS_ns = initial_time;

  /** WP# Hold time   */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_max_ns = initial_time;

  /** HOLD Active Setup time  */
  real tSH_ns = initial_time;

  /** HOLD Active Hold time   */
  real tHH_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_cy14v_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_cy14v_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_cy14v_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_cy14v_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_cy14v_ac_configuration.
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
  `vmm_typename(svt_spi_flash_cy14v_ac_configuration)
  `vmm_class_factory(svt_spi_flash_cy14v_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Z973jRHmBz4XRi7dOFAWfZ+Q7NP75j6+rp23U61gvKP3zB4RFT/jBLE6NjuuTjC4
O1X5ktMk5eHeAZ42+x0313PZR37aoEoE3/e0lE7IUYsiCRg51JTmW6E/oWS7QVFm
1RrkZIxqgTp2KlwWru5iM9RTAQ3RCPDPyIse3XrRkDc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 753       )
uYKoI5S0YoEt7u9Co/nepcHlzCimotHJbmW+CnGj+jGrRa+N/ekS5YoJsf5epEiJ
mvGmD165qWkiI6VAMUlV/D1hRYuf3TEUItnQ3/rFUzrycTy6BmDTgmuuatNpQs+n
ZJFXZoxSbmh6jj7RdVAJjcN+PZ6Kl3UdpkeMlv5CMGetCKjtaibDQuLKVsvUIlvt
dz9RFsE1v0vzqndjQ3nV1Ehm5JHzktY/4SMm6Lxpw45pzuH/+/pC2gnm4RUDN70D
mgW4pmNua+qElxkMfmzQepRRZChFcnFVKMdY9QTQ/R4z7S5K+/yTdklX5HOrfI6O
NaEyXGXMsQrUJ5klmfZCx+YKIJbwD5EUtCYGGhbkFEdfLMaKIFwaRYI8h/zz4aih
cERdWm76qE6S7i5XQ9hwvkCu+GOveu20QOrltctUB1+lpvqYl4BmZbotnVFVh6xN
MOtlKsnG9fHzfmSGyl8D0mB1qJAFZSbB7Zp2s6mHmD4dPmBuF7dU6tF71idroXmH
5YKlilKMUSil6d2YnKvIcp45Fl4MHBNKSXKdFn8TWtdapDv95WBYkTAgxlf4aL5c
AiygrW4X6G3a544wM9ofveY1h9H+nZF45q3/d34VpUNPcHd9NkH9D7oWrgPtyYTE
uG5Dm/APpNIq98waCER1khBmQ76A+pBhavBdY6AF/6ih3G+uWZz6Y0C2a79zu80Z
+cjSJTkHX4yWvOfcbsgVnftaou0K1OQNKBxbkMDGj07facN+yK4Yd5kg3OxPSdHs
RxN1uhTJfqwNFCrXKqXwFN705JwvzjLJMB2mSOsLf/2/F9jkbvqHNIaRtD4rPRPx
U7UQs46BWXoayiNTvg8EguTzsC5fYJVR46cRMFYpbrAtDnfxo/tDN8F/xCa5kRHW
MHGBv71RrMjjioxfv7hrQh1TPKqAzHRJNwxp+C+xYBBg/l8nI3Sq1B9oPPaKqap0
zITHQktkoM1mfAR0E8gOC40NM6yZKaBxxIOU5VZPw19irmEG0sNigZJttKFuj4jR
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
d9X6G5oKzojao2aPMXDqpWktR+bF9Lk0xNXn2pFkrXmoNfia9WJLCus+zsrtXbqL
H7BxNfydKCItVr4K02WzyMy0QHXT6s9Sm4CxirA3vD/M9XVK4eftz1vOlv5r1VgS
ruW9epIrMKgZV79ZjmqTEWSSrWzYXv9wRspis09Ldg0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21040     )
xA4nk3Uwqxys/buXHZzacxpKYZ7UO8BvDdMCrWBpom8wxvt20yM5F9ECi91LjXQS
dmOmnNb15lpdwpECG7CjrYU7KYy2OSwWfCsXNJWTLyEXjQOFn3az6Rn3XDH6G767
yKjCvV48RtqTS6cBWcR0aGUiWQ2dOIgABfkyzLFFqI54YJTCdAqKT7qbulTc3tzn
k4pWVgr4Na+C1sGMn+sxd0cRJ1zXTcgvNrbP1wuBkMxiOgv2/4i8F6CzFvojOkAh
vTrrX9JhxDk5LMckmkQMe5OK80vSkpxOebzV84SgSGiIjaX+uAId+MTdunTITgT0
nAfPaB4hA8fyQB0QDhLKfP27qhF3196MZeSsUv47NETaFv0fEmfXBK1Oo6ZcDzFk
L/1LRfFasCl9B15rNsVT9JdFT7d+GijrIQgOfl35G2QG5+vkbERWkOZJz6+bsDlI
quwv1W/2TYq8YvqMjxtP461q3I1vNkL4Oc2uhRvgr9s1y0O6rGu0U9V3EBvZHElF
7qLQ86hQH+IaA4mZlNNGOWWXY9yfKZvZtcGgzmfYIjulEftAbUMXhwb9oyLaLj+8
C0Etn9Yw8s5NNoBM3mZDwhCbgPyuaxBEWAd7gyte8sXioiDCaPSSK7l546V0HISy
uQFH57nyRnm7gUOTpnISQVh/GdoHZ7a/niOicZXll5pYeOwz4kYKPMq1Bpb20YgM
x59uGt/AFY4kbxRP53IQpVUGyw7xHflUNrx033wrlMJHGBIkQ38YmIpxplNaTDj1
TX9hWr5jEiUjqkJQ5WljWCNgfsjZoWPY7oV7Z8j7yK/1Ml/NYptlU/gFKi/uXJVR
kX3Rmws1Mlf6WioLXWzevvP0R9pHU92XlID29Xltl4uCczo1EO9aLkmXTqRtRjEi
z/iMFUtC+n5lBfrm+iA/xhmg27x/+umTQskzbdcp/ulMeBqMWtQYtZ9pQ7rYH7L2
RLwc+8JwdgQMnl9anZT7Vl8K36AL75ZZLftD3o2RZrYY2/V22NYCdOYXarRE031+
dS9ra2Ydy/B5ACObMQkal2OpPsrzlsl5reSQebFE/BtPGKT/aotiQzekhHrCugYG
JoXr9m1ZLqmFR7fWfYBmDZQeYH2D+sx6xPR432NIGgayvfacVjaymKOzfUAv/olj
rkkh3vDFbYDfYVueWFg3qaBkxEVKPFB64taLIoXE/nQ1zapEKNb3pcERt3luyd7x
ed6UgGPXo8yejTrLcDR/254oioz/LDCDEqrS/x1oZZp6IgZNGSjjSUUbYJjxVO1w
y6No0FTLtchpD17ICKjDLtTM2JQF8YBB0Y4oXU5xPQa2usWGVK25Yh6WZXw5ams+
yNrIsFntdOsBUhMcX41KtEBS/Y/Q8s0NYIS3JbQsSI/SfIEH3XwyX/20i7GX5FDA
eg7L1eJkuN554gRB+x+AnFCm2ZvNCBBDdidb0PstDuag3LX+nXBDMcALrh9eNEmK
jgzeWV7B8+63sqTe2lJc5dak4w/obrsxZ0IwhMquIaJfelf88JIFV9tF5n8WwzYh
hHXTDgbTnMfkxjhg/5wFzCQd2ZbiVHVoj9khlpcTJ02wtlVOkxROrnkKOGwMyr9z
UZyWYSQkncruhT87vK0UUYd8mw/e376FxhFJA5HYpBVRzxXB5hjx+fLig5+6EfM0
Sjdx/EYbNxsF0bAw6swK/w7Wj1yGV2D75rfXPvaoxWqZvRGz0RQsYrcowRqp5Sk7
Z671kYcvI2UUPgoWCmS/T3DEumpMywmTiqaIUt/3E3JZ4MCe9yysUMJSoLq9j/v2
Y/erJP9ltheGnrGIlao05Ln0vSeE5GJu9PfHCsyuN5BOtAwC4rg5jGA1f2r/ySm7
klv3Bf4tXhix5nBmXlsMAPcDFKF3xjc1NY5ZTRqvF79gsAKg8danhrwqENWoWUlF
ggSTMbOhssvlxvqcI7x13GIJam8dTrse+oD8ytLDmcl4f9vWtTPqL7cLrlP071BL
lA3/k/gap3cnQkpqgaqsafZLofxGiqq20C9MhQSYIxOc8akqwurvSZeehx2S9YeX
n0RXhsZKYMqEIX7qsS3xX/agqHZamyg3fRlI8Q7JqJWWtvYoVk1e7uFHwNbKXI6g
pzxwidtVNLAevkUZpoO9JkST9RnGI38zmLZoAnFUsPh/2DCVWWDc8zDO/8UI404h
3DinodZzjTJ1O1fymRWZ2lUsRNYteaPhQZEfsfq6nZhJh4ctihcFCWnMIEL/9BMn
HdAigdeRKmm4aR1N88sO0Xi6kWpW7+ow7WVRfHMgIEKfpwSwwocB9vVnwzRheieK
r3HDHeADWdPb8RTA0WN2SxNvyFktVctDk6t6lNgE388Zr1SZlbv3yXnYwE3s3fPK
hoZJMttDxgkSHr5I5ZcH158r+b0touD3EXoCj4runJexvwV2wM2zpkpN8CypVQ1q
zHsy4x3VDUjgsVkmYoRXT0+1gUtw3+ivuVaebJ7jmT/5YGpJeatCHSaD2iDe4j8I
2APQxa1VLQpDv5v74sdJXc4uWeNGcqepfYKsl1FSNYoZSuYVA0UMhalkDqAg2B5d
SLKze2eZz37x44ydJ7xSoG0vym1Q/jvcLNWxiYED1P1kmxTrdSwi14xz/Y39ULJ7
vGA2PT/9prxS09QQD1gjaWKaic27ycQ941VfWuRUvp5CcoT3CFDCuzY7RaRFYtyN
az+7Pn6r04UnptLwlKadKBR4ofoJjG8TbqB9fSyu/ismmsDUDWXhHTwHC3it68iw
EGAoWMkqADEJ1l8fgiu+XxpXP1cjmiXLMr5jF2w8IACh27DFbqSzUmHXWo6lxVt+
KUtEyizrUjzT0HOV30ETzkhmxDuYTfDEcl2s+AMaSHTVELU6uDCdmL17/l+czXZJ
nOVVTyNtFmEk01Dt2HWPfgvb/2iGdCHspw4MZ1eIKv9q32PwP5e8D9y+HctXkKYm
pjYAhpfktbwsrVGJN+glec3P7tntqfU2mkuom6oLNwtkVFBUxkH1fNOV80mluVmY
BH4J3v93WxB/he58PyimxlQYXfg0I1MVuBwezpJ2FjtyOnWMttJ3CL/lOXazhBu0
hecgIeRpzA1RNOeFuoQJc92jCknR90WOdrBwvatggFgYST5RdGEXsBSbrKkELHQo
VdbD0fOsNnxvJUh0mRsGzw9ZPy9gOzkipnUzBABdoL99a5Z7zhBt0TBMEVD+GVmG
SxDP2NgMw2ZChzhMZDzKOF6aXm1fIJvs8KN9PzkewtuiS6/ZX2ZdM2f9ZL3CVu6M
pQth/Or5F022GUwx3H0DMdJSq85lccw4coF6SGfgYGnUqAWoJtOKHjtoizhQmobv
VZel6L6cIopRxyBg5oLgBjThAhFLu95Jn7JOQDHSCXpHG7ca8ZK5E0n4wZLrtP27
V9pEkcMXlCJ5bVkUubIoRiM0/Jq4Lubm1TRWS5aNNqQmzDaMg4r3esK+tuxzNngc
7eKehPvuDFU5vshFPV0Bxsis/NxuT5eSi/r5kQpC4Ru2dLUvUvMnWo5Q6aPI1jqd
UGgullfbgSE30yyHurM1PWGs/j3trxqvmNlgDTxWJs0fP5fQkqRxe1F1+Vk0rnDH
w8BF1JUT+QPnVQXkRLfI1UsYH2d5oozBXObtbQpkx3Xf2+BmNcnJafsU7uVCxFDG
bEeWgXV+n1ewVjtozuWTzCUZIeHRQl+S9RwbGHWd3aMUEl0ayo+GH17X30Gev1CU
8fLHNTXIXMm+q0yItZPTh01TB2X1wMeQxlAE0CCjzFnUP1f3IDXIiKtNI6CLsJ9p
WSRzl+fDRJlOkLNxGZQ7bseNbl0+gQ0+bvBP8pYbYK9BRlti2YLrpB8WCV8ppI0P
+bQU767lYOLhWh5A7M9NZacmXxhbhAN/tF5QF/klRwMKkMfImgrm4wSoO2LwemCI
fGg7y1JS6kvysxIbqJCF8ls5ze5FWgDpJUn2TD82Q6R5uqb3GQChO32kGu9rZ2ja
MYqIuXgOQ/OGjDGs3N9iAoIJrTWng/2WTFprXtBzl/2Bg5sch87u8fF8fxLnCsC3
sFswk5PTPysAEGkmtHNNEKHt0StKu7eWz9wfMxJkLC77j82lKg0stZDstWATIlgX
BgXr5IkThgbhMZMO8iMS9vREA+7E2gDNidic3gZsdj973llZzWLXJASO+d9llche
zztYml2hau6FMbd+cS81yDjVHdOpOTdlCI9abAHNiGCRJdszSM7vKBAiXFKv0So0
rZP8ltW0k5BhPH1oldR19Lg7roXHEwEK+OrdgSyNVWWQuZ01CCtw2pezl0tbqZXb
+7kECUxR2SGst4TXJcycnJERE7B2L30sMDtD2qPHdP5/7fMzKSXRtvNpTT9XbmbD
MWoLGlTwDIXlfEgSAZK/wV5kojqoDe1HpD8OIplIbQyT65PCQd7zDovmr48m3xmH
oG9LZ7fzILCiJerLxm5NulxCI+FWhUXQd4NWzUCsHMuIg+f0QA0kUHaLKEcmA1Hg
vvLeD/RaGSDHrZoHzRm1WySGnvXqY6fBUAL8Vbhs8H8y7Jb2qfV8NWLqHlAH0yb/
l6AwQsX/eR+EGe625TcfnsgYsGzyw7Jd3o8bh4frCiriCGmsvngEX9Ocy6D888uw
ZLYmwAHOAlXG0aNHgwvs1lOVL3nZfP8PfDyd0+aq2o3kJZvtW8MMciJXvZmxWGWb
cpHyVpvTSQ9+79M0zN2edrb49DypxROSLOupeWH5U/nZQy8dwVKryXck7BTngfSx
ccQn5KwKlg7A+zm5FjlVbbgLlAJnO0Ou8XQJENbf79SIPv41QT//sI06u2FJoXyB
V8/FWpeWyLRslYU3fBooEnar6Kn5JZSU1FWqq6jRAthdWC7yZj7sMYHE8zVPmuJ/
3e+XFLAJNd/qd5Et7nSyD0LqZH94qQdm3Qp5vB4Vsu9ZcThE70CmJDiEyvEBrUoO
kvHr23tkVqz47IhXEnmUq0ME/TzZHAX7NgTSWZxwSmWHOubdaqY3p62vBTcodbSF
Nx6x6902RMGFzv9SQyZQ4cxm86SaFnl0pb8iZq1OgM8K9RMC4iC+mAEssRGHdb+U
uCHVghOu1yG9XGdJ5d1QqACzrX9OnIJBeOgQTCjqS8b25bzP50iUMeubzarajc46
mOaC0v524k0Yzf8N5KZ0fHtlbRF6lgY3Yw6a+a1WfpAEUDfo5TBzl+c+CM54czNR
KPLwbveqpAaN61X5K2jbVNZ/R3X2ngGiJNwluZT+oiJZMdlU4vCe6nEUYG+Br+N/
txvcVNSSLdMZAKV/ZGcqFwIH9Q22Gak8IAK6wNN++YgUNOILsB95eE0Gi4CQFtXL
61FEckXBkfNO3ghTzXGOez7Cy5K5TtX5XYXA1BbaG510UHCM2YdhYwuP/jecw0DZ
DxZK9iq/WPIGLxop5QIrqfMROt4wNglVq7J3QU38THQxMn19rqx+t28Pt/jE6k7z
aS2Bj8scYqnQzKssaIcR6BAI7tcvyQvDUHOEbT1EIH1AuD2vG9uzd5rC5AwidBJ5
yY8bbvw0m0gTmTiVAXOqwfF4kJxZjy7aOF/hLzOCdDt6YZ0hsVviEYcTnyjKegTf
8e3S8vPmQT8GAz6f6vOkv54Qzj/nxeEf/iqw4xVWFE5u81+km6mQWzObU2Qfr6vN
WCpqAiS/2SlAXPv98UwsZ0B8oKYRd41t5n0cKLCw7X1JSPTfwghwnuD7od96wXNj
0jc3UmS9symzNe43VJ0xK+C6jpmOsXK49FLMNs5AUvIVA3ZTT02G5nj5MGXns8sr
3l/eb1YIsctntjZwaACJkPuyR9zr94TT2qKqxEt8KX/uhJYxLMRxfx4pviAZCaEc
GtSflOP+UxYbdEO9NaQ/l2Xu7iBVXg84xZm/fwSsphPqgPPu2BUeorabOy8y7YLh
F5jhQTLwHGL2X0FjsFEqCdWMVx04Sbu3q5b0yrLHguWBBQcmU2d2VBkP9k8/U0N1
izoXl0cAcCvz/g006L1FEx6fhe4KvORCbe/PCg+OL5BSfGv+1Z9l+twYcdfAn1D0
19LadFvPaQXwfG8zNuQWfxkWwEFIH8GHLknJp/gmWLqNRI7ci/875GpJLhQ7O9ZS
XcGa0kiaQ9kZCe9NRg0E07V/zqIrNTPjRcvtU/4bA72rHA/M2mBleVuPwi+P+ksl
a/t03laiKZIGvwZO4zo4MrcXWoaRfTj7XjILxY6WixCciwCGPEE70QmujguEJHWS
YUhn2+TW5leLPLgAHRLmlOrMn0Dicw3fETVnGf/wI6jYng8TGMyxOM6NKQ2UH4w1
dsqCWbWMI4cYWA2tXOmhEvS3Tbh/kzYFqUHiqv7Uenopr9zZV8K39r2XDGTuT7pK
hzyPD33N3iBRbQL+Opxr6cAvrhhktT3aCpPDQUHFIdYXutffBRo501qFS6mrC0BC
WpFgYHhbM5cYKiFcZJGx2YT6y0wmQ4mv9e1jriepFr83MuVsdSb1h6Qoy5gFwadr
6jvzd9Urhw73iYPHcLHsrNHKP2j5ib1CjJOMrJ0UZByhd7F4xAiLL1w/HRap25cE
pdusD2OIcyXWdr1wEEANKqs86AC2D3dyDmZdw6NxAgYVhXU8e8H2tCS933l3t4UW
7PXGTVjtKWxbUlwKtAr9f+czMhgSCPL2PlY4wfU0CooNx5VaDA4DlYgpGLw28PN7
FveKWXS1aQNwp30MnhOXaxJ9sJeyCgK1tZXGbXDDe7F+TyHO9OclicLIL492sb6z
yB7Ne+LtX03ZN897TNgE0lE+dKn56mro152vu48fkZ0A1LPksWqeWXffSNfuAoK0
2i8k1BH3iEwLvdA633MgqsqxDVI+0sPlQkmZgMnFsN0sk90qVyV7MKfUJFime8G7
Bsm4aPjCgZ3vIRm+SDGpNAMs18PmKw5bTzle1jzJvZpJ996AK4/iyAanewhDQ0PT
srLMPtiMkzcFwZ/ucoa5iOzznnFX5k2lUvtpV2EbqeH1buzf0PNhA5e6x9E+zsj1
nydXIvm4ogEs30Xa3TZRcl9SxHeyP678dmJxlfu511rUmf84wf9tHoBgJfShMBFV
fLjbzMZMlUtOZZ/Gx5TXpyOURmjz+J69AZy4wo1njEH0oa+JslY9Qm20cNjnkO6t
Zja8CGic6CSgxnXR8PmGBLk32HmRKpVv3tepOXSWM53C4cvru+c0K+pyeAIrIJQn
UZ7lTQmjfR+yspzB89r0uPudyHcvM0zzrbXYmDCKWMgQEycI+7w4DCosdgSSqeIj
6Fnocm63Wz1CrvNpUUEQiI4S4x5IaQ2DOWn0GZQCxyYgpyLpZ+2j/pAWgV8nzVzM
f2DPMkmb0pQGIWFldA1uWt1hzniJYAGT2ypXli7TJmqjz7TCApeN1jMte68M4b6k
VWEe8Yik2EWSJRKHf0wqYmgfca63uf335e11LlEdsE8+xTWcH1ycMTw9y1Sps6eQ
trm+iqfXTU9kQDvV+KZHWJAszCu3LoQPmZ2rLrUXc5GZ/492ebwg4WiSATeb1S1c
aeg0NVRF3ZzEsCFpcw0u85Qa5cx/iQVB+0GYtWF8F+G6vmIxmOCMgCp3AYjwiTs7
ZgEog9yr3wQIHDNsT+GVU9Ob3lIQUNl4TLpitjozXizaCXs8y9oWEQ8xTS2HGxW6
sLaGB+8K1LjX7B+RsFyIjTanTL9wRMoTa+TuxNaXa8gCOxypaDjP6F17iHVgQiB+
YbCQszCVog/6gYpEmcI2R7Td3yEhpDlTBbipkuPFBJ++7rhWKtWhn5K1gbHGpVAL
Q7g+4jWfdI7SfjIy+K8xdhkpsFx+msD2TW2/dcyWL4n9heCyHtCTRNz4WrxF7ITa
O27KzVFel0EvFAWm/RQcWll2UL9Qf9DSC+/q8sqJOHhC/fBDQ7CpvHfvp1WnETQt
Np5n5vEmvTjf8T1Nm78XrZEnoP/tcGHM3gmP/c5iBzDh93m2+cUQ0i13cTrFwdBd
nk3/tEdt760VhNHl9FAfa+0FCYp/6zHGMJNRBLOUEGmY68i2lU713dD4hIzlSAJW
yg4q78ZVsfHL8Hp7v1TVAkntOhwPj4F6DYpSOobMclfIfbSWVCCLyEeYUQ4lpq5h
op8b1ocJ9mBKSz7EDK682xQDABvbWCk0zYFubEnrjiqV+Rh0j7S4EX7IlIwKKYhl
zFyC1GQqeybxOraXrVTeeCW4+Po4+GcZ6CimCusyX/cwIAhai/cQ2ISEB+iEuLxE
XsLsa5jzw+8gheTclJKo3hEnU53EMJ7oLCRmcJVEsNiJv9x4YWrv9E8yat4IGRr0
zBmJSEFJr0XnjJw5v//weJdrHel9NYg9ozPRv2p/7PmxXBAnafrUF+ks4yQncaYN
VZkTAC/9BkaX1l94O3RFGp7umXFG0ziobEjws4OH9tPumY3vb+Bt0QcxXiMup+xv
uCZfmeeSxhnF/Xmpj+bkkv4e2Vx3AocJm0pOLwVXhZry9R1Ri0AUT7C4zd1W9ZlB
S3zGzLkUBnTPS2iXoUs8RRyXrA5qlkkTK9xUq34b9IDZKEvcARU/wHOdTw05ZMx0
oOW5MSL6TXNdDZcVi8TmDK4AC28RvmOG5glBZHUjbK2kNdWrrrwUbpMfh0+coRCt
DdFdDWoT9zv5ebJdGzluv1/3l7IAo5vDhX73Rqrf1o+7gFgHgLQEJkgeOs1efEFu
7pL9RvmMwqDVPc/YyZl0+1ETIQpOkJqZRU+OyiIBqPRW881rTSsFijdUTMCnQNb2
llRwH/SpC/lbFkzdA7hM2o5ccj6mCV1cwSQWORo1GexIyXRzelUljBC6K/lyBJlW
p0qNdoUkBQxApoFJuSy30qjmcn1GqvzH4bNfZsBH5SOgUP0D18RO6EUZZWR20d16
i6dMmhDfMCNHokBxQINP/V7I1cRH0B6nqHTCc6DP1RXd++yGEMt8/w7yzr+Qik5r
mI2MEe3zydGT6TJAOTUzGJ16mfSR9csOsc68Qa30ZHXBwpajz0DoaPnVvCKSLkwl
KBKcHBIzGvagDUX8ZRK1VJdpFzcVa4z6izkbxEkuTTgllMgpYTI/3zUUv/SdJPYJ
LbhQQUXv2i2VqcT0YamATciVkSONqSgEdCqgg8s+WMkhZvWldEqGTvd6TTNi+XBV
28Vd+f/222qUdYMdkS31h47YcSSQGiaWNlofQxqSMSPAYRbecN+BuJqi28zkGuHh
9dZuJDgtmWoHgz7FU5JWVexTkGBEouKxxZbM6trA3lJ3YNuGhtSZRXGT+aXt+EY/
n62/HzCq1o8XsY/2hBY0/FAB8B2a3wmosxM7UlVGtCCsaXzK3nTsns8WES7RNL9W
4QwSBP/7LrFiwhc2Y4ZznSYly7n+AW8+nKC4fd5HXjQvf3NNGnaJflDhOIc0ShGA
9cddjrDmHqIHEh7hRpK/GI3mpQH/Jh44pcupTerlv4BkWPy/gRg6/PrFRo0pqE3m
tHwLYwzCRBH7ixrViCbSfLLp+xp076ExxB/L8oJW39kaD9XHsEYbPhWeJ2HKN24v
9Tiz9fLScESc5OI2hp1qF+qIfOj3gWIhmQlI9Ak6JJjnVgk/RyqZXgNOO/szSmNX
aLQq/6JcHYtcugFU/Ph1oihMQyX19Z7boowGs/YFagw7/0b9uGjVFK9ebb+Mns/w
Fbiz+OEkU676tcMxMzauzZRE4MEjWeq3h7luYurWYDaFsA9yyqdxPOk9MluVSmt1
sGJ069YZ+uqsSBN6nO9nZRVY7/CgpOSRzCUmhBbwGDvGhXJz9bIHrumch9I/tv9R
5Tme1cGJazo/T+7wHVHE5UAfYqdi+HV8tYLxPm7nsvPpSoYxpAv5urRz3xi+yOFf
6+4aKwFTlTvnf+yFQRjfDoJdLWqQ6o+izpPU78S2vWxfg0ix1jNMbFyWd6BylcKp
5Spa3d9JGaX7011Hpt5ZyhGtzf+PCxPPkfqjPKR7++1wcHVHf4248cLaQEicpwWS
ZAnVYGmHRGF4Bh0dkdXz9GoPUIFHXUwptQZnNQfKziCi5WOFSJ4eb1AgWNPSYyqs
QcgT7PYbukb8Jlvhe/bvtEG+Y754JQSliWRqHilp78axsUkPyVjMYF+Z08jCUng3
ebw3A+GvZ6c9b1r72Sf0LHYs/6MvYTTogeXZ99nYSlYIQcpKo+aDs4vFLzV0r10S
njHnU1R/Ivt4g1kMaKs+2SvawKalg8i5cknZEz3jXrZrW+thubKQrU0OkfxyH/eK
USQGIlKNAmqrHYtJyyxdRR7wp2jrSpbhGlhKhdfLlRhxJkZRnSH1xNXBi+Zf4ARo
Tb0OSVm2NbYpurH9SzxrblZyJSgBNKbAn45JZ5yZdwF3BZBZf7CQwqi3tJhbxh+q
PuGMINkVVgccrbDKC39HS/qOnzp0QmXaU9FtkRYIOpRBrtqDjgcEvXRAzbuBOXZ+
1YtzzzstcQtfyayESkxPK1oWXCg01X7HO99rSVU6lM0ZQY7V8NvO5At8qRdpqD4j
zTk7ymsC+rGwHHAEiLvxGHJ5+WcGm2D2VILsQH06oY8CISs34Ci1DCR79iOG60/N
D9mUQidj0MxrWuRyRht/Zw9fGiEF0iTURv+pGCa4wu4b9rLdH8KfzrDIFJRo3cwp
Qv5lj7cuP/yKwiYKXmmQOdNcx7YlBtWOflO8mynpZ64Kt8q0xA2e9TPyN6QvoB5W
0J4vWr66It4x/eKkw+9fcpERHT2KrS+oVeZjbKxn4TkMobVkD/7FIl1I5o6bs1xK
UMfiBD6thE03R54J6yCsb1VfW+9HW0fNlhCqsAiJNCoWgZLCEfFxOzJ0uWAdNIh/
dWB0BImc2WYiZKxbDsy2Nd4FJRwdvynQPRdF5Rn87til5fdr0XF1MzvFNUDRC9SV
UYO+IjwjL1NceZ89XDr/CLL0c8nZF2EIfTV8Z5X+6/29xaAs47F++85Ni8wmuEwT
7mdDjAPxFU2c0IQEa2bcPp/TwHXGRnp+V9CTFAkoIXcR7FbZ7HqSE40oHd2j+t98
wwxk60m4Wg9IxM4CYo2dla6SZUg+6UT3JzoxpSOQgniKKJGtJexvK5mWCiA4g2ae
tNBE3fphQLRuHiT2Do5nZ9Sy76PtMal8rOFnyK+gj3AHLyRZ5UbuiG8w8Ddf3W0+
mnDQRYaWIVfwgbPMmqte7FAtIebQctqCJzf6NTNUjKO0AFb5cNks4c2fNY/+8Qs1
7+p7i1/rJVOc35xRKUCCOwXa36iHv+mf6PwsOQ3wm5pBN9qqSBBjhPsUFa2ckqP4
m3luiTRGPaskGLjvq5r5LERwPx8mniW9xvDRo9VQZ7Rdb9/0m0u9SVqkHs3qTsgs
M4XAhUlRS/2kUyhsEDpjmTby+ztrlB/IDqTHz0tzabb7q1Z6sZnfWhzSzKeBosnq
drypB+ZEidxua2jSm5pelmEx+8CUi3sVuQ59t96pUhWb0HqPRJrvQqCe2qvbpG/C
5b4rzVD7Q50Q4DMv3a7+kIwX5X0HLBS/UrdGfYjYIa6LF533nKDoWvrWXcgBXMjh
oOiLYlXOa4WUoNu0zDfMN9qFnn17arlmW4s//r8+Cem7IS42/kEuKWmHZ0OIODMJ
g3xRICnMJTRUaibCcgoKG+sDgnyV9HBEuQqafNPmfnjovjgHdqTMZ7Fuerj2qnxY
tDPKlMma9qgQwr6VghIv2QUAb1dcW7HFvxFWfTmTE21vNuJAMtLWYzzzOPkkeoaT
HVca0ApvzgWmwcOYTUT/DQuUIQJ4GhhZfuPOZ3DLbN+nffDbbknXhuVEOuH5VCKC
eUnT6MOx+AfqsseMoqW1bJIrRFSZNsqPljenftVfUhAG1DcFrZRGfBxAXDokq60n
Adtmx5RsfH3tNTBA9ya35c4MFK4k7TVl+9tgdgVnb4sngSrQq57ZPA4yXuxhcB+s
sn2OehPn97fS37B8bFV0qKOziqk9n+KqJPJmtTmCgzpJc21W/r87u0aDPwIDqe/E
V6T+diMfppJHp0ZMgsCU5eBFQp0xXe325NaODcll7nlDvNwOExwsoSW+v9M6ALzB
7bTFZ7Ma7EcpZj1xrg4yStlhHPFJ+Gaw+iDCjpU0jX27a0QlBJE05D3yXOI16sda
tdS0BKfYs3EW6wevBJ5+ch7LhECc/nQTZpVgtrmmGPERz5yooavCiWG5AX5ihkCl
5llPKIpQzvlyRx8z0DSUa93yzHTgkvH5T85Moz6RBFo7enOVxs52o3DbQ8EUJO92
6WsUUHceVChEtfGm0oOMSOJ/Qk2lM1DMVboeR4rxYsMfkNDQd31xZCKPkoS52qxa
VXcai+ugFoK/nxzh2r1fePoEVSUh655mGMA8Mv7QaaSxFoIxlzwEjeE9sZLe2vV2
5ZIdF1+Ynw1tJYN9+5vJaWgPzl/YRDWKH3hWcX+JIo9Uqt/vXMCtVbE7zMs9PNs0
N6RPFzVn/RFlHgvJrAKLbyRlLTpngZBtXBQ/pyguYNkHx6/MhBK2xthJ66fTUebg
JMlAsHzK5Uo4TYCJfsE5Fm8YT/0ZUVjm4GW6gEU0VcgkpXt+wOgxqCDX9ld4YpMr
G71BOTlJcSBGCMQ/JH6zKBd00NwhbMit2LXDORnbINKedpejQ2/DlK9ZFo7mt8Mt
K2k64Bb5ZVuS5Sa7FpERAgPWxuZaSZ3rBha3UcP8l52SoLcrvvv5bl4N4gR8QccR
pMoc8Dbv0z55Xt5OuS17CdLPyute/eVThz80OnHdFfXHw90Gy2H4fsFf6fNRkpKX
rDFiM6LC6pJ5DPefXY4IEmC6lDLbZVNtPI/OzvsSyFQE2dA8uAbJiMD4aLSrwTm3
WcUjI3ullN1EtnGrzMXi+7d/6K3LmEv7H98mmlS1LIrhHWiYpaW6u6TJQgRLhfTr
RJmH6V4FpW3WaBb8VR0L2xqjqrzwlqlzVc0jiMYmyf5axHSRDG1bqtmKWW7HNMYM
aIS2/5S7HgRxBngahAeUh/zaFG+AkcH99/vX742NvXZlUlWhmJxAAVYDuYHoyX4w
SkP8AyEPDG0/tHNzBpa7O1a2A6ysSGLEMbButAqrlcQnbqZdqq8CV9txicXF7QkW
yl9r4ApdkP5i+eWQIfqRlO78nfUw/ecoLIWQpWcqN0QhfWJ/DZjTuITSVB2/q9WA
vCqZGs66wk4AUgMBXjtNPnm5mf4gSjxnQlRri4yF+97/z3qMhuZMc9dvbhfjlcwM
chudZ36uPGtxhPWNc2WvdB9tadhP0dE//UWSY2vBXjlTnNN3ffxK4D0YaAptxbMg
kOnw2ua/YQRv8ItU+77Meook7JT2DxqHdBiHHw+eBv0J6U/3QnCwOwxaVkj9f83t
e/TOE+JGWj04nmkQk0UG8OmY82fhWE6KkryEbHQMLbr1FmfQpk9ae9TWKSGHwcVO
evBWmmk5BcdzwaN34Wj6tGTC024UtFXHuEB5rx3IYcQ6NeL+Ry/3Jn1cCLvKGO3O
YXbTDeoYIyRAaNBMIaBv5kzWKhmQ8niDRormIfNfE4e89/YaJqZuuEvGI0AH58wh
KNUAgnhoDn18HIkK8puhZrMlLguTBwGRpBC4eO8ZKKOnXzHRLUeq9gPfQWY61xDs
Ig8AlLSQ4OH6sjLnvUUCXUtMc+naprbxmA6c+LVL46AofaGMZzQnhn1QKn74e/rd
8m2/nT2D3tbuNLopl/KoXZlWXHZ83wpiItL4iSAjb02Am7hbS88iAJECHXvjqddR
eGWEpctt1Ko3MaAZluXNJzxGDNFYNxMml3CZsWJeGVGJ1ufbA32iN1JLJUa5bFRC
y+92o1s33vNB98E3Zp4K9pmqk4SOh59JATKX2sLy8ONCffkNJ3jnUEJlvhxJSQHn
Uc2uTapgu+LQx865PuZt5sbFj8S5/dC3hSh1Uk6v6MMir0g//DwK+q4I+RCoAzyQ
Hlr9tTYwmAGk7tCWREuDAnuil5Ej/1Y1hrXETMcn+sGcnLlHhb4AoCfn8TI8lwl0
DjzrlzS8eTztZ38UjpIS1SpRWTfE1CWMR4pPbTbgKxLUdvy6ZJS20U6IJ4tJB4Od
P+9I9xr5reRkqWFs2JNVymm26VRmSVF1kWVgdnDAO7Mpgme2VQLvu+qfS/H3GbMc
B8czULUPjnRcVLNZibHc4G8vHHvWeqZgbgIGjG6ttcUJqak0ZKAxGRl92/+KjKH1
anVA04/nA6EHm+u9fCBAPm+L/FIJXBbCr4jFw5DtNdWwuUuyEnKsWdFt7Rmr8TLr
S/uMTz61T5X5hpohbgNurlkiMpp/jC8ktTa6dJjaM30UYNHREtVHBvVbnv0Bxep9
XIgMfwxNFOJKYIyslc0B85cW2w2PXJx5GcOjZppcFIHQ1L3xfQzz7ESkPYltu+ld
Id5Qgn6NphhpqJ7xFBb2Tf4OU9xeKNMJQ6+hJypYG5fLyzYPboMPvf1ZwUSwlwQ2
WhuYzpvgxEcNY+epQeQXDP6ERcPdxxe0jsYzN9YHqg6HwWD7FLEY8yA0f7kJnauA
b8RmQG8S26QnUbj2s7UFuv7bHKlACQBQOPfFMWVgsN2/oG2getzLauV9zRBojan8
Ky4xE5dS0mSqpljzPmbkdjEXiKf4rvchFX1Sx7b0i4HF9KO2xkN8O08fztE55W9Q
NqhnFEeQ6FXm09GIdKB7MuPTc+vj43leTw7TSJlvSKUInUtKpDQ4uq7EG68MapH/
iSzcXPWGZdPfHLjLqKbht6T3jUozqRpSyl0hVagIp6aTIREN+4RQ0WWUU6oIvnOK
yvp7q4JdO2aFooEDAyew1EIh5+SVZAaYN/Q5BSy7sMCCMqqcZTLqQkh/uAP7QQsQ
lq/za2u3tix3FLgpgWVOof8v3D8dzbUX3ysv/k7+ztHPou0f7Rn+D+9IpnrvX4Vb
7wlXEFMZ2N9TPgiXLE7ueMNfXFKhUVlZ8k6xPCY7G6uaVh6mKK+dFIwAtALfi2Zc
qMNvlBjlOk6NyjLD7m8eOxkYNp637GDOKn7uRIoibVyXEUAzMKwSIaUj21wR4rcR
p78meSHveuDW6bGw7rq72xT22uKlqdk/dE5pRNUgEEtVJn8nsK1yDk2XBo5KNVs7
AfIyXYHuCBskA44rtY2X/wFgi19+hEaD902oIedFtiKlFRx3s/o3IFyw1YF++/3O
cTN9cgkeVQecBIocgYpliXjNd+Ybw/hEjfj++LMy+CC510NtXq6styZ4ED6wr52d
4by//u7Uj7E4E7qavDlQrrVBELp6AN2r6t20L0ENn5GQ7ZBTaaQ4Z5FKSo3PXLFA
mwDWDmbxuSuX+p0KxTe/pLNyMa6Krkm20cBx8EWsAwJ9EuwEV8XoIO87pB912wxz
kA/b+Z13ybgGlBdgILDqFZP4qCJKJRj8gGlMYc1rd5Ub4/JlXM1KO9Casd7pKWiT
Ce2nW5U7eL/zBa28QS2yOtnjdn2+i5pqATDNKOkHzFa9GXl3cO29Zgntm9vfr2Zr
WX5XGNRkWafRswtg25m8fIiD/I4QFkFyIw3BkSrV8UT/4v/c7pzh5b5xnmQoC0fX
mnOAj75My64/rKm6Msu3irptjSnv9zSLM6OHDmNyNzPiEkuPee+IlglGCVi8RWD8
Gke+25khigrcRuXMtcwuR83tE/CTQA78scawb/IP9lRRVri92a+TUDBveRQmmjbW
dtuwAAjRo1TPh1HM75X1XKYY0G5OSxiaYqy/B4D+OUdNVNHwHoK3O8S/axeWRF3b
LBelTBPjSsvFAx+A4wCNcFEagA7MayeOkXJe+kYU07fpj2EMOlnup9ytfWaxuwUZ
543foKO5+1WH7SBCisxVpUiFebbnzNh6TeMlIgtMKBawLlBKXsCB7/1Vyyh516Vk
EK6NHHDbMbuYNO7SrGuHYOP7voRjw8E0IqLoxU8NTWXYKQDvd2WO0K4VQebICqN/
dH2HNBJCbtqonSml8ZmVv6ZV+ndvrHRbOFEx+STaaf7ppCCRYE3G+PN7SaNvPt3T
wfRsNx9sKVdtk9j9DTsxAZvOwyhMQnfZDnH7uH42dhCnLYagbQ13UU8lwkaj3xcx
QaCcLAofpN31fdspjYkIgO2XE95YRASYyUmTU+mzRcn9gkR4ZUhEfmQfsYWF4dpN
0o3RsnryugJNr2qlojqeHsdk4zyHz5cbEhBfrY7rzkJYCENxs6Hl5B1IoK7gJCr5
3GMUmauhhZtK4jNt/JUnXl1SfCbqjjKqw7OdBEruLGn7q8GhcCp3Gfv1Pd/HWCAy
cpYKMH0L+4MnMRKSzxk/KPBbvKWN+CgPn4RrkggQjrz8IFcUNyg0UOAciNfgP8rN
1gAwHbtmSJz4Hhch5i22Lz6pz0MmOybcDyPgwg86iPQCvM81Vi2r4G6PIvMNT0FQ
Zin1gO/UwFAHiv2sqxFTyeQThqdtgdpKH9+hKD2Y0yoWMImP6MDYfslM3xuiThjE
FTwUaaBvqUgj3yDpryznRvTT2QItd60/CC/r5yNz0Jh6WYd1V0ECPKzcLDWUBIvt
MrO490IzNs5Vjwd9x1Yo5F36mWvBISBzb4KXSs9ve+eNOhuRMKoTMH+5wXO75OAp
TV20T/3Yrvs9MH/bSrN7Q5+s0EMb4YQAck5QocSJiTVii6rbZJTlP3dCRB3OJF0a
/y/5zXjv+VUz/aV2T+N9y9zHHldcq+UpWVf7fQIiP0CRRZlKmDGcHPg/edKrVw/3
EHADwZRD55RBWi8hWJr5PFeYyGM8CXQhk5KCSS6qAsrDDjY+QRV8vEJKn6Q6vBoy
xqAGSPA5P4QL6QlZJcB0vdnVQEAd6ZZcgXlA5IZXfyi0dkeaW1aMBzeVbSPb4Ef5
0nM4nzM+xH7xNv/dviON/Wf9+RCyi827Cw7fYcoASXlEmHd5Cm/WlkYXSoz0XdHr
goegHP5JCTKX/dhL7iKIl+uxoG8mhEOu2Ja8jl6I0mR2K1pfv3+xhGLtGf95obFK
q+sZcWr+64cNwqbrxJ4WVMrVUHNIuEMtDKWj/e6h0b9CvATbQWhvOF0rYYM9JQv8
b7Z7YKlJk5tp0yrRAeSj4FtS5ERnQBhuy2Iw76w5bMYAj3Evr6ME+UZxw6vSCmqu
oDTBR/yRF9U1bkPMHsXVyKknkymkXSc9Bw5GboXJbV5yyKQzjGjCVVKkua8bvQwX
Ar2HfMaHvglxWD9MFEEV94+KSTCJK9n16VGfur+CEINJWqdKc4LDJv0EgA3bSRKV
aI7/IL2xJpVAnHv2dkqlLmDVS9fM+GtokRgKMNfkxp5bbv8IDmBbtmmm8leDvp/r
e9y/B0Cw9spZlR/OWCU+2wws8sCPxyAA1j9V/pW9Bv/rgWthqSriGKY7p8RZjnZk
zYD7DVdz+LHeFOl4WXDtA48WhTEV3+I412zU4cZ4LV7nVI36arPhvVpflXe/fpLy
sKJNDhq6qYmUGnirH+5SYns7mHaBi0A6v5HhFc09+V1DlE9io3nMOdiw7HXEzALy
+anDjIkCzRlOsVmdnmNJTvroAlf/uP64fQLUJ1A8p0UqCmCKLzVerKF3Y6fF9F48
IdPzf6cBurLPLrVoffMaVxAWBvIb/bMydnNfD4+VvN4wZKB6PvBPSQyYhLcgMdJ2
tERrQa3KSSJm3cQ19VLWQMTyDLrv/ETpZ2XowQMDuGr/niMu9qRDOpJ5ZA15oulJ
0tdKldVb8IJQz2+Ah5zxXtza4QkAp7cwLTf1oTy9ZK0KOhEdl6uFx4WAk1fkZfAa
gDRmJKEfjNSMSDLP9McEao9/I3FEghAbrXLXAk2G0BAFsUODc63XcYzeJ8gVNqFM
zWcsOexs/6u4LmCLNPuyp3OxNWYE/86wpiX08q+S6swFCnzvVNw3x0UMHGbKr/jv
mLFTO2SAz1w471pX2RgB1ZQfkhiE4CfYIXG5KnmrujpobEFSPCNCAT2OKvXEovTl
c3vfnZ6+VJtsj8CSqnlEsdC7CVC6Qy7x68sfnz9z4jnvbcqhPXa4iYr4UlLAr+0Y
SZu4HnNrBqlwemkLxK3Xqj29zYNBwHi/M285MvoZZpATEVN5GEctIroQztsrmZYX
tcGYmA5my+syEovClrqL8EBSfHGEqHVaXWAwfsxnaSxY/Qhiv3OvFq/sWNT/7Llb
eRQNT1dGhbYJTwuICRV8S0f7DFA9/sSOSVhIBLJYwJjQvQ8BkRYCF1oM9mdIhI8u
kZLt9ubthlUNZViKEatbHhbvazjU7ogfOqFa/QtGouXJvQiHqD4Y4nyq5U0DbBa3
o0PaA18VwdmtM/hp8dzZyrH5hh0Y1fFnXLc6c8s5ul6yTFZhbn5ceZ9h1F8d6IYy
yH2fJPsAsRlw6XkFj2WyuidcrbUgJN4NdwxoupmbiD4Lh5F1uZlluqSE2YZYjUVb
ZV0837OqtG2vrwEk5p/VUJPVHNcQvsopESt046rgiIntWN3tbH+b1aKm30sO6281
wbRC6/WESOsTASvo5K/nHeKdQuSEfO8moHrXpr8JD+udwq0dg/IpO1KOqf/vq/h6
qsBuq1zEtcSBORqvE44TwS6mAU0ioUWM+zEXqr+xJpVB9l1C1QCrbstADXEsLYNs
7zDYkiiLrAlju29L3ULKpfCxpyA+O0iDm0PX+4aI4gv4edrQ4UCxDLZPIToyF9O/
w443rBE5TfkaKh8yYNXJ6+xuRBWgAB4svUgiRHmQTR1V1bHAswlxeliqjOibVGfO
v56t4wcGIv1Ou1sOx7qTtV/w8gSU6yZAnVDuAWq0dQKJs39rQxeWmKBUdg3Zxnsi
GpZR7+bfxfByngKK8dzc4f6Z8G6rxnM2cCsL2aj61L6DgsNTivFiRIKhjHFyQ0A6
id3WQ0YfsXPzCU/SKvIZc9nn4ujgkYa8TBy8LjY6gIbLufjSiUHIVBRMu3aBWc3R
Csr2P3mXkGyKWO0eNSsuhna0O0Q6ax++xXr+pbUFKpFCO7goiSnl3/rHgyQ5DClR
oG3OTNM9hosKqbJqEWk3+wt/0vsj6B5WnNdrr0Z8KJAhF//Lyr0g9AiblAedtaRD
rxFvc6lDHCUCWB1COrkr3Ub3Iy5FQSSGPTAxDMw9MV5B54W8f1tD2BoCEC5hWWnt
w2hJHeyf5JJ3yjGbWR9FAiSnVOXRMOyzhdCFEujjXew9905jDhOV8cJ3ne2RyhSe
kHY6YTCb+jb2QAAFwDt8qULgXSRIgyzUkmOT0jr6uEKoR7Zd/4LO4J1qSlh5CMiF
GltYt3fkqKlqJVe33Egm2Nw3AyaUxnEzSqxrpxr0YKhTqKVcvBQ5FLCy4hmPV5WB
qWk5Kc9bfgrnn+j2pp9HwNxJiUbiN/nhnGnFMGZpWDl6K6rSnpcrcIeJYGZ2xvTd
0dPMwMQuGvHzEPOrtsfCoC8BpLCIzFtTTlf1i6a1OUQ6S6U+pgMeuOZO/OzYzDqf
PWLaPbDyuNr0CsqrVrovUOdIB87eh/XoP5NZaFsLO5JXnGtSC6rkLn5YCk3kFLjt
jbl5fiXsrfC8GOhWEX0foGl7KZ1501aHLeQj2XAawjHmvP8rtGQyFo1T/XtsoItV
1rhFYnekCwmJf0MhhvNZoLPy9gtdNU6Z2zHt5BnkwIjq1DV+0aLLaOBJFt+UtP7X
TTgND7YH0A3hLVkRiySMh8bE/28KyS1gm88t+gPeB84QVbb97djOlJ+tMIBuk5xr
FWvKEoRyCDllhK/oOcTew5Xy80c5Is8QTMM4JmfLRAG2GbXqbcuCPltrWzodQzmG
ZDb4k0TKTgf7IdTERkKu6E3UG1F+N8pTS2wWYfCebfDRhCRW+4UazB7678EmZDxf
GVfi3YM87ALIfaszRUxaIqhnzR05JTEvBzP9zxz9CE3jTVb2F9BuNL3p/iULcYfb
CYl2ilIRDBaToiTwuG+Ikk4HcQwk6TayH20M3KZa7D8Oiiv1lpSCCIju2Xb/cFJl
7QLY820AALoTecdSZB/UbRPeqab/yWX0BjjfClsJsajjw9uu75HoFf04GL+x+oi1
/m7BcTTwgneMeSEKeDppmntrjiisd43CL5SyHGp08vlbIRMHqVKBCDCRbLasd49V
ZP2RXG/7YHrZkrYVEfjb9nUuDqs0O1iDrzchcsbR1NXTYqCKVrO4HeKMaalnMyWC
mfGhRiC0YtKqNLT/e62wzRXaTxEJ4p3uRiPO62tWrbJgyT8vGjz8qgZH1H7ZpPL8
zQvudnpp8X7hhImqfZG5crQrEO1Yr7oJ+qCHCzWd6p2uOtY2VX0rwxcEDR12cQkX
160XthMK0nm2PCwLqFSy8J0iTwLzsi0Ar8NPFKEgBWrwm+X1sFUPFVefhIIjr8FI
NvyZ2pqYXcg+jMUdg+m3AFT2dzq9az7HGMlla6ZdZdPjb5XKtZfywo9bW+u62+1M
u8m+fKfhgaPXalr/eX5TOAeJDKlJP68v0IgFPSzY29iAGiVFoMc7Z7wbq3NSCrgU
T1Lu708C54AmCVrzL21aC4QSS3fA7QNtw9ehsEQvAvF55ltkK/sznpsz0vYTvjG/
Ia8VNixeY13n1x9l2OWvaLZVNO94pCCreuvxqgTHc2Pg+zOniby900gCU7uudmRg
xHVz/wIe0L+3EJaqJvYA4OP3k1OjFv0JSUt3SdKA8Tts4y2bVXzFFuRAHwG52G/c
GIsMcTl/dueGIr8uPnoRtoYd9u0eRFAwamOGfZc6L4vWt6Gy3/ObJPP+Ccmn3BNB
r1ImWaFlBRPcXcA1uvh/JXVv7M4ayJCRklTlSV6HBzJ8di4FzgJOag9zQi8DweOO
FOgnbqAKaDzkuxkYbGn82330o9D8pOxR2Z6yQvONYuoUEC1obWB1STLhixdd37KM
zvglXa2O8WAlikSdsOovmTIVWmb8gjM3d1eJyNRKbSKXwfNVsSwETSZeOBOsE8D1
qD3c5+kctbTEjauIlynyAhNdrH0uGeR0d7Wvi8UJbRnI0QWfDetc1U5z4FFrQwgW
NHvF7/anCbG5ZbcqDnH7DgVj1eoEf9U1W6DPgrvU8m1i6+lClVhLFYxXeD0nUVmv
GXzY4c/yxyEjRuwj1pLI31mYvkABy0xGj6/IzqLfSuwTqapsmV80x0fVRB3nXdfs
hqtA4kQV7okYN0iAj4p/G+rlxIb4DIc4zSXkjXu2tZCD/KvArWnWfkrFMXU+Wb4q
cx5MB9jLXrTW2sWSiq5rkp6ayTwYXKuxgIdtUZhsu4ndXrq6O8IShRWaCv5kxvco
iVJHzy8MWiEwpG+74A1V2NH9+J6se7kZjpqKqEoy5G34HEbYWqKdAXkynbIWGHjw
g/lR8rJc1o6xc7oFFEl8sK50xcBDyCUO+ZMq2CTvShRdBSQQCRLofH8+vjGWEI/k
CA0xnGJZrwGS6BlZugcfjPwWvIlPV62uAqLfLg6ysjDjtm8Yfh/MT/5kRsq5kyZB
+NOQKSY5V29OaF0vZ7egOjny/nikE1vCrkkcATtcQL6tGsSwMOKqAA2a4+Bqt1+/
VUO/SRkwR0CmdJT0Jd5rzEyWzyA3yll15hCJVDRcedypQzR6C5RT5jycCZWiC8K2
DxGPcJHtO5Zx5jw7wFgbkAEbzhHeEu6owzOjv4rigD6gKsT+/kERLF8GIe4K4zMR
8juNqeSpnbkE+UF8GAmccMmT3pLg1++mSLu/gSSFfCEOFvQTs0gKl5KA6gL1PJv3
3lLHUVxB8uRqds7Gz9teNuF6M5bGavTwSvVuqW8Qt6VRydpaDU40vN3Q192DzXhz
6qkAgechJKGOro9TTngV0R5DQrQBdrgV9I5RsUIQZ653X5551Wo5NERKtlCIaLsd
qw/jwnqeT29m/C7z/p1y8Uksz7y3tipgXTQhh6XqMsX1PXoFrWRe99QmOIdXSflj
LoZvan97DpidN57vuJ5HVpwB52hcUKAjZAPkferBo2FV4nIUvFt5XpGcWbN0d7DY
rcRNp4FTK2hrw91Gnuyjhg2KMf9bgQflj537Iq8lImHv/BdKdeob+JUMw2Rz/vK+
++EQpASsAorgnAi3pmBqEWtZQtn6G5x0s5EF0WLFf0UzjRGrx87JhN2phBy5lbN2
TeMx4SI3fJwJ5J2ntIEXxAZf60VvAKFSkV+jCJMEZu4v3BE0JIejO5XYlkEMOjCu
K+BLe0SSSs4bzol+FOPKw0PU3au5GhOtGVAzcC+Nm5pAKuEZRSDtMLCPOZ5SpArG
IuFJYXZFkucUGrP/EZIDYu6Pjx1tX3NEIlX7bmxS5gXA7WhqlOPSXuJBAd+07aem
jYXezGy4YaVcUKIM6+MdXxaD2qgi9Fd+8urrChGkTCHFhgq2t2IyoLyyJ9d8W70G
0d6aFC0QUMuknJ5r2JB1HGH5Us3wthmwu+rffvx1YrZkUdHSaiO50ZMMmO5SOkdh
8BHIiEGiZXmuWCQIYhSzvM038PLK3vi82x2OH7NyL0mj8DUKbhAr57amiyDMn5N8
Zv9okywWeVLdTrY8E56SqYYer8yo/F/oLvZLwbeyNn9zct2DV9czpcHI4VHfEpxf
1e+8cwTW8qltd0VtaKD2cBHWP2izJn9u43BmNrR/9Ai781JGV87EmKYEGKtvFG7h
Y+NvSn+hc+bIaNguVqBeC8c0mFccCMZGTRm4j8f4+h2pUqftLlk40qaNlYNGxQTe
m3OqOG5SYbmUCRpg94Axopfcyp5hJ+glC22u8NK9FmXpF/CzkoCoUiTTna9tZ+xN
rV8cCyuIYLzdzEUgOasfl3XYYpfHnvpwERlA3U0MnqvPJAMkgPml5kd5ffTBXVjq
BCQny+foPrtnwcKWAXCCOwxE0tprLHBXQ2YnfGGunRflmGQK60RGu7o0EaKCQUY0
whTXqh11KaMd/5CUuMQ1tttOswalOmECEFYg8TAgQ0wxBuxhbeWS4kwn7QR042qT
aTgRaLa5Sijre5yLJGIggVEX80Y7BVscK8RIa/jkGUVi6ZD7k13rEUr/s82zBSPE
GlzS8/0y8fhd+ecjSMBQ8cIKX4xOjbGS8U7mOiPVCYpB8BZdhKpEa8dHGCqGWJ5W
sp0mAC8kMFHHkjSnJD/AWKiTN9bxInYCLgsmdlYriWOgJkl9xlmxskeqPGDcP8i5
8E11vbmEPuyzJxwRq64DjB4Kumn0kClAVVTZxSyXOgMnkmLsdxl7pTFd0qe6Beaf
bJQura7YWbVUe7I9kci5xqoAwRAvG8hlFKGwyvp4JozuRJ17bOZKetQyqTfjE2nB
vquQJcIeoT9sYs+tsKt22SxYvr8v6GfrJY3qZN55mcapc0i8Nhi1oud9uTwrOXZB
OZC6zqlD7PNfmIkjipzqlW89yScC/PfRfQPkKO7hiCLDRcyMxsFBQx7dCevByVHn
BiITvPJL54iJup35Q8d8PgryWbdnhrICxNGZx//6Z8e4XUEJxRs94kbgJ9fo8d8W
sayltUYiPXVSsM4wlEbXSj6Z9B0PxoOXRsfcb7uSBo0AyEiZ9ipNdbiMGHoSdrLT
wt1SXionvm8IGozyjXx/lhT0SubqwIsPcmePRdgEl8VKJGb8QLbzC4Wyr3M/GHey
LR4LEGJR1+e67WJoWPdowcbxsv0ZE3f1GHfPhRWQpcBHzjDb+RBv8/TQwXM/vPl6
JETyyFngafORd82lFsJiMbVWHyAv3osG9sGXPSlYV21xUJCpKx5dkS0e8R+ucOW5
IBkxZdhzab0nwLvouU2uvspGrSoMjAHFu0PeLoOkjJtk+E4SH+Rql3E1XzMOM8Bs
JO4tWQP1cecO3wzULRqxgwAkVdhE3qROEg245nNEGenm8E2c0GogkppbkTP8FhI6
JhSIfnGpujvugTcPdi0Yem0oE7mXNy1Ra38eEjdIY3XpBhCVmzReHkwOMmOzYd5F
cw1hMGu/D+J/M+yQthywyAbrhyV8vr5zm7Go6EXIlZuk9HSlLP84N/ikC2jtejK2
J44JIeEf0ehcTw7Qz9aPnX9mMoD9iQglV90j3m0WF8eCypPZig2p91znzloU2hq5
4iqyoW0zirdqCmXsc9xpZZG3uy4MP8vX+JYbnFRRBROkHVgkFWEvfRgDBGHkz5td
Jy8Ky39fo7z8Nm5AvwC0sgF4xlNNb9AHrhG39KoSkIgjnRwYq98aZr/HXdPRH3p1
n4EutMamzormBrEP7xrU5mZZa7+Ni5s/c6GMgS748GdxPfCQq46oiHcsHiU+0myr
a0MQnzRpP50cgu8eYdHrQ5m745TMK3BjpluJFfhKj2zDpHZiRgiShunQaBRzOSJf
jzeAJ2uZXyzf3uMiSUTIwVLGX4S4dbmFihmIzPWgKswje8mvB8popyvwWZVzNnnz
HK6RWORoG6AOLEXZof2IIL2YbdjmIb7EntnoMpDCO2lDxRQXLFCuJXypA9nzxKf6
N2hYvr7EAwjlrjvpmBfTR3T4fQ/Gq8WIXWq8L9IP4/BmmoWhXew8Rc6lSeCU+b9f
UQ6ReT6QFH+JyyrMYb9r1n2aeOuIEFf9UUHHGVgsO7Whk/tOCbLATbt65yOLKjAL
L08mKcEhtGQ/rnLh2j0bJLlimHBD0CMJu/Xl2hiM9vhcp6K10qQNtn0GbjewR3V2
N+G3sAq/16q0VFAO90EofIc9A6guXQeBieobO8YWJCK4ptRrWxR6uNRYJHkw1qTr
rcIDv0kgsw1FrR9sl8IVEa0ZhhfdQ3Ny4lZmGerHXFVhpBBYwDGalkHDI1WdIQCS
jCr3UdUW9Ky78dM/kxizXSuyxhhAkYNxszVFfDfpTVWwun3XHCzUd7KuaXs9wsma
JFSoNm0UP85kkUANBiUbHrSQ5siKtsFEXysGGtjIAZJ59rxoiCoXCELq7xnZ3+nm
xD4gN44OGb5ZFsDcGH3DwznegzPzYGznZBKQA/NWytgPhWpKtIKHPewmPUMpS2P7
jftfBXeNwExskJdKbZxPA4dS8lHyRouHM+OfEaXNiydz1K6Cvb4UH7tCUSYgplY5
gfyqAXtC8avTqjqxv+UsUTadzXyDrGaNN1AFxbJcN02IpT52wX01DhtsulTcA5Ll
8A+ET7DSJzscqJZarDCt8/Tvh+ILUsIVCrAdNj2HcHcSj/ea2vVZcgjxB7T9Gjyx
ioE6HvrrRO5yVbY36uT7yo0ib9r1NTz9/4kwpPlX0aXnD9oNmQlo5iJSWKz4/iJY
cjzq0Ajj4ihvvi/ETcvLuX/sTWqgDo4qOS/0SA6LIJVWGAjGyYyNU9NjDsHGupk5
eog0n3FrYJUdgFD9MR5R/Kiv5nS7+bSLfg424A7Hr/RzsOn4T9ME/u96ImIss7EB
+Xl2xl2tRm01OBofbX44R8Sjz3URITiuV6PIJVxjyiH6tYdMtCz8cj3KWeNHAAee
FFy5fFSRhTpn4TsN4Ifh5/dvyQapPXLiZP953YeISZi1IGKDKNkYhegztmqncF78
0WKbBrn9ayEGdnhouAYAdYp7SU9j/U0u+ZYhPqusxLUW3U7/CpLMYPOn7ljJ3VBB
0tMiMnn5EzR2259SoQz57uKXh2sXqK65jf4CfezGiLo7JQnG+oBCC5tYbZKOb/hK
oFxEyd1qLCwo/hEPUkjnbUeqBMxNnI8KPV5sdkw7JdDXYyntU/lGK9csx5acWsdr
wAyjUAlDVDdz8encDTJP4IYnvOf8MRXcp6syG6DOBq1p1acQRGTVxj7AEHlr+yau
9iOyVYu0I1U+Q09rvtydyJfDcv4jqY7xwDuFHgr6WH7BCybamRcF/qryS+40gxaw
d7fUAn9maEsdaY/TD+z8/flzcryxyuBY4vr4P/nHQxtjGWDVcps63oWmpApkWgPH
llI+KmX3QaW4M42MBTSTxG7vk6Xd+Mhn+h0TGqvllRr7P/294QsO/mZ6ctHIcXA9
K9WZTrw4HwJqXNY39EPBsCKLISXKdnhEkkVRJyNMNJJf+/Xja6WAh3DmcnQ9Q6Ji
bfEjYKI2rBXC4zdjNQy3h/DCri3+AQ2iEe0Cw57NdjN1PW+llMW7jtr/EzY5anVf
5v8G650sQy/4cCGNPMe+fqrglirqmLlL4elVTZdE39kONCJBYvi6YLUEKW+ptQY+
cuf9D5Ff0OwM8ZQ3Ie0sChrTXmiSEO7OFZ0hGoQfiANfH5P66brxejjq8S3eqxK9
GgqoocEyCn2EI3xHYH+jv9VUb0Sayqu4kEWYCQelDNG6HNVR7UNDd9xBeS7fIeMi
l6bdqRnEWQA9ip6UpRw5gCwOjQWWG9NAK+kSpG7QoHCsqHEmteQPsXBIFh5uRYUE
Cux85/BteE77y5JamThC+oa5uaWD1xfMO5bB948L83OKflulVR5bo9BlDZHWYnPm
N6+lW5QW2djv/TvVh77h6MjTnQ+mHlAQObfzsDidgp/ExNeFzIxxiHqCaJLZczAz
ONSZOUj1F2Js/iHaSt4U1RhjpqTW5syZ29DtJhOi5sz2BBhyozWHzvONVYFq18eu
Ji29g+Aki5xwtpKY5pwSTpssyuzEx+TxLQJ+3cx+5155ucrpU3HEHrY+/On51GTi
bspIfrolbnQARKTuBKekKN6ZQe1AO11oz2Dt8d65Cm2Lf5v0+oFxSCKzNI4TALRT
MCWMEw9i4S4Q9tC3kdXyzimSKb7VD7z4116npz4a/Ha/wP6od/22dpmqFua9mIe7
aXJizLZZvGat8dfiICmhFNiap44WG3S6mfoctO3W/lB7FTN7rm2oSIeN5aZMtGeB
UTDgKcaMw8pPgiS/xP+9yWEOoaoKYMBt2jMeR1BNfZIv4fgTH+U0F5RwnF0WF9ye
4YU+jc32ofrm+u66gnJC8s/mEColkEiFDceziApD9bL6B6eqQlGMXFdcppGvGNcl
xYWKScDn7MBuW9M2D+xC9OEfmtVGwak1xbPXgdKX7aYUk4+hXbnPP7SvJjo8oXEb
n8oSNyyS5oEFWpsRHx/wEPLiJv3KSzYCzAbhmp3T00DnVpioxjfIVT8XKNDLZqZl
woRITFN/g8nsPn2+otNXKLKsY1HdiRDFeLOc1nNZycuW2sSRpIAqxZ/PognbrHUB
KMKYDSDd8BN8HPomM9bdqZbmmS8VnbY7/bZX6cWkFjwYhKePMj04WJ0CmuSCK90O
lmuG3+5ymn5v9pcReFTA6yDpry9F/puUQhl/YdgzRIOxbdcgjvdeP3duAEixpAp0
iXmkApKXAtwYcGhBYoSsXEv7jSb0YXAM8J/mACikxLwe4llCYXFQYNHu3UzX56B9
6IAYS1J9csyVDA/ql0wbCbE3tcsqdvZVa109EiERlJY=
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MkZEeONsadS/iiNbZ6IEeoduQJAx8nZOIugIX8roiYdGnKyUa8jc4zKVUzYhe51G
gD7X0Rz02dTeU85G0lJXMabe+fqtRbEdA378uiAOkuzXX9dEwKaDB9GEyWtlqUJH
ijaAqaz8wQVwqapsISPVRq9gJGGoBttM4vAx4Tonkkg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21123     )
kiPRKR79baxwJ+aWSRuLJ5Dd43mcHpoHSTtCDKt9FrODmZLSTEkmYg6xieGAQLdl
jrtIimWppexevdbTgWWJHiVRUUQ2PoEkG2n6w2OkL54u1LbAC/mNNA60yl38h23M
`pragma protect end_protected
