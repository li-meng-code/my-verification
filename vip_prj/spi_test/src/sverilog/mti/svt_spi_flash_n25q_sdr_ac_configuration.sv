
`ifndef GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron n25q device family in SDR mode.
 */
class svt_spi_flash_n25q_sdr_ac_configuration extends svt_configuration;

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

  real tCLK_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

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

  /**
   * HOLD Active Setup time
   */
  real tHLCH_ns = initial_time;

  /**
   * HOLD Active Hold time
   */
  real tCHHH_ns = initial_time;

  /**
   * HOLD Non Active Setup time
   */
  real tHHCH_ns = initial_time;

  /**
   * HOLD Non Active Hold time
   */
  real tCHHL_ns = initial_time;

  /**
   * Minimum delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_min_ns = initial_time;

  /**
   * Maximum delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_max_ns = initial_time;

  /**
   * Delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_ns = initial_time;

  /**
   * Minimum delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_min_ns = initial_time;

  /**
   * Maximum delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_max_ns = initial_time;
  
  /**
   * Delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_n25q_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_n25q_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_n25q_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_n25q_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_n25q_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_n25q_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_n25q_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FUF4+D6nW/W6hp/qdBD0GoaHv01cQEak68v785BmGpYkKzcNO8YLBzNwsgJ3zBfg
kiCcgXxgPwmcbBayq5Dt1hXXuFWIjghHdcksYONJ73ugFJzaQAgPG8k3JVqqDlFD
g9IJPOfK5mYRXLCvKDQLZESQGqxtakHuf0F7KY+mxRM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 765       )
VnLHjQ1IOuVoy7wnCGnZw8CfwGlobB/xCDe4GLyujCCP5RS0BU9EK+Z+8ApGCGUv
C1kFK/t1cOb0ojWWMMlxANztC8N5RjnoTR0cHFPT5YOuMKTaHafTUZFF88r4E2gQ
XPr9aQlKiJM9P9fp+0po4YigQ7E8aDV7VozIYiKMkFqIX2ufxsqUt0WQaRq2/oQs
tqWqZI7WaFVIrpfacccVR1GU9mB+ZpWaK0sVZ4SRu+2rQoT7QD8V8hn9N9NqGGjl
r91iA4C0VnQg4XIAoNya/bKy3laQPkcKeyOXtnsRw4UhUOIloGi64VMRgn7d9rIA
WC6njDVnPU3PLvCEs69ULmyx4vfSdAN29xiRYW81u7lPzImRL+R0aw9HdfkYAuNP
zlk791zJc37cEB4kny1IyjI/YlpLMp+V0MusUFqIVczjNvozrszY3Z7wKGVlyzEH
rSXiPO+Npb1iwdyo+LYcZ++RKvNCNUcfNP2RAdWBF5MIhBOlSYzgXlEhb1oaDrx4
L/yk+nIvuWdY5R1+8Xhpn+zlHHz4bywG5fnUrJmh9maI4yt1UwuNT85YpwSBTaJw
w2F+sAGmC5pg37HjT2tFoPpIjQFm8ufHGJZzjZm7yaV/qc93q1HNxTWSCZAP5kmF
hrbd0PCWf5/aYA0IcAK5ASBx8utZz/nzOVBTavbpYtyvTH+2hkcvufL260CKnPQu
DS8a5PI1K/hFIt5O6Xxdz9jBSlubK2yS7lA4IwvDD2InPqLd3AEjQKzudmZG+2+B
PBiDEQTGYdz6I/wjwwWymynLhSdSpTvXan7Y6PO0E79GTvsJAnRl2jVHTbjHhFDM
3k01ayWWcYnyc2tDhtZuAwhPXAYexePo68X4yR+ROrKwW+TdZjxATqJnAZ0YJqu5
jFh6Y2fFvEWK4ZNmbwe0Oid8z5ZS3FSq//vrDjEdUe/rOnw56yoFPFup8twolh03
Na9yk4yQb9BPL9Fj9ih7pEJ7AyIvsCq0rsOKHHfxAnfXw3B5yDaxnundb0uYCOTr
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AQ82x6SXmENqOLpS0+ZofapKOywQpn0au5wIobMdatgQpEHFjZiwBgBZmHTWce5q
1ySHDmuJ2J845qzwOTZT53jtOTcxha/Bl7umZtlnynecdI3f5xCoRMAA9tbHIeqw
gtt+PR6c2oZAMW4bvLOy8Nz6j0DiNmroy/FQ7TZswJI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 30854     )
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
nyGOQUbC48p9NSEgVImYNQvLw0PzyDXYnH/Tlha7cP4xMSfZoh4Rjjnnf2SyH+xK
ilurDju0IHq6LUaARR/HY5vLaQ7hNHuLHQU8v9xvz5Op4Up74PQUb2uR7MREk9Ih
Pgg3o0RJaHFtnXZkBeGAk8tEyq/8vMjPObPVKO5YYZReRxx2OlyAegUfyap4sJMU
QUEIrlYb7ndxvUkdnYBJjmkg97/bTGw7jpOVM3lXhkj0xS0VhV3f7vwb0wXE/51Y
47gmJ9w/sCbQhcWfBsuYQAmlgyw8pT36DwVEYVLSWsYcd4oZdwX3L7+pXDzFK9qs
bmiyZsRMTJ95NxzYDh2P3yjIYuxJR4TvYAh8/ucg50dvx5ZLej0/vE6DFk+ueUG/
kLDlD+HbEfEjMzOHb2xfUzsiuQneHHyrcWlw7qWRoUD+VIEvufGL5wjxjY6qhpNt
OCZlyXe66+Si8y5xR0280vH+R1lUQz17skKMM17zgXWG30rV2gxgwptfs37uDp4w
7RtOaqehuWaPuSnTakZq6t4gruiVP1XPLKjHWRjOLhgpdwT9k+mPJnphrqn79dYs
/+rmUI1w1nTLem/+TbuFTb9U2QZtgJKt87+Q1quh+PdSWfnP0qg9yv2crCIuczfM
RRqs0CjlBmoyakU3bfmKtxEwpJv6tr2SuTm/OKWdgrPuhdqR332pEPvyeWzefVPr
ABJRWi8AAjlGCNoFfwFSCbwztQO6Gx1jiL+DLSX5AenVW8gc8nqmciWD9Ox8LA4N
5/DB0XYtsCcI4DTsblD4wfwmyVxXrM15J3/vaNbhbXNXy2pAVwdQEn/wg6OYv4IN
6ZxU0mc50sednTmNpFU8Tfb0lKlRj+iS8EJShlqrrOC2dZ8sd4iLl6O7SnW/eItl
IgvLQBEbhol/YPdHKIe6rC6s5qacZpDKTGlnzJMQ2zRrkqun74fsrlKLzUCK1IKw
mcabW8CvEeYvQ82dFomNDm9PC7gNDUwlmaPJA8zVavwy6ogly/Li1LraG28Z8P1X
+55efjlhBBPeWMsqiEWpB1MoS4ioohcegvFecxURdwOowLWeFI3OCGV/vooZt/GT
IdaB0O1IzTGyj1QwceO+xK6FiVB6pIYgOwN0/3GtvTpakX3qczyYpfF10WiMTGTx
e19DBmBvtq/xlMrJTG+Li80C/hvJvaKqITf/FbkI7bIBwZg2IJRZhXb84zR/PoTX
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ldwE1lU3YTMrBbrYsJD2zhQp39/31p1sTn41uFPZ1sVUtdqjmoPV5iyJ8kIO8IsX
p/c7TK/M0+JrqP4C5W44P96EsYfWCixNIKVg/H5tFamNB+Dbb6VcSlgScGCZIPhE
JVoa5kTJnHjCBJgpBDjcJCfm3IuFrnkNEJ8BBqQhDF0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 30937     )
jM5pTorBZn+o28FbDJpSaYBCLLpd44sZcrW1g2nKQ7YthpG+nwXehhsxTMcD6D+I
cjnYUVPxHqxb1ryYLwWgZnrukOhaJApwMphy5p3GH/DihJzGGlj41rwB/Vsd/w8I
`pragma protect end_protected
