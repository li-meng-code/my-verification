
`ifndef GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25U device family.
 */
class svt_spi_flash_mx25u_ac_configuration extends svt_configuration;

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
   * Minimum Clock period/Highest Freq support.
   */ 
  real tCLK_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD Output command 
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO DTR command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_DTR_ns[];

  /**
   * Minimum Clock period/Highest Freq support for AUTOBOOT 
   */ 
  real tCLK_AutoBoot_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mx25u_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25u_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25u_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25u_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25u_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25u_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25u_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
duDuGWH+oKEp8e1x+B2ME8t+uRo//JBwAuI+E2dAeP+qLeABYURY8hV/oM7anKgs
JW+H+qwOfU3UHY234lqtXBfOfYrkOp5+MtBL/gLVCKfgN+1pcQYEs8vdMIxX8kIz
WzHJmNc4349QAyMqK/f9Two32xhFq8I9UXyPfwG50HA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 753       )
6M2ANDtSTnKvH49HbEPJj62sJRk/Plxfmd4cuTHMTGf+Pid9VVBTUYO6pxn1s27w
i9BlsBb8GFaO8yDPA1Rqcr5fUvO4VS5l4T+NJDgjBQHRO+FlXGo5pOg95ahIxwXn
i16/sJHOOKOmrBpNid8MufOlHk4JdNccoraZWPAqabtmhEQgcTpbaU/+N/NUDibg
Ck88Wf52mFI45Tl5ni5c/4YJlMOFMKao09pP/iB0Q9lvQb4G689Q72QWy2vAgCo1
MqI2M0YSD6WvdSVljPsxJZY95o4wzZoccxvg9w3xyR7WFklNkj/CAmGL5ckS4JJ1
81O3d8k7nbQRy0F6VaqQfn/JBQRjUk5gdHJiIzKoUR+wNxdL2YSR9DcJGIvDxmVt
qUdNHkfkdGEVCJIjBANy7BO9I5sIKoztvchj3UMJrQ6sTmvLfe74GiVepQLtDN4X
ahxvuiO7uu3TIMObppuCv9U7zgjEFvgeDcZ5FYTlKSo+TRdDx1ZXKynZ1tFjn3zs
iul6LQtm7PYBAXiB/AN/QEhWFRKuUXdHFRJHs5Bms0ZoRfXJcJ480f9e5w7UEW5a
3zn/XUlXihCmbAy+yYdiEnY9AFlWZasSQ6mPe9a9aa2tRnEWwDvAGAbZBMRv+7OI
E2+YiimuC1QGyrGp7zEz9slcOJpooDLJM9LtAYw06tYxvDvgjNbDT6ZmSMAVvCo8
vk+JMnkhKwIVRP5RKXJUXgKvBqiI65AmdJ5Bmljyg4bFv1j3X/a53THWrSCiv3K/
c6xVixCaNbUuq4GNEOe1mJSy4GSmyUHy03e+GZHemp/JRRt8TAxtTF6osEFImLbA
YE6mblEnkufIIeemAuFH4//oNlny8sV6R1+DcDvcbw6mpggXAf3BQ4GN1C6EmkfU
yGY5EadZpPFddsQ+6RFtS/wWmu0mN/FSs6NjlrwB2WryIk5Jbipwqe0+LOKMGGQH
k29hJuWv/R8eo6E5H9B/sv2gM53BTJ5P5HKCkR3yc+cq6hMV2BZA5clwrR4C149X
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
h8l2Fgn7zHALbB0mvBXlUBYs80zn3Y8ioZsIK0reuk7dI+6d5wkUJRaKHpeIgm5s
6z9GU8++gxENMY7iEwgeKc2Y60+DWn00AEmB6EqRi6gK9m5rux7IrWemuR0KQHru
DlxiuNqI6d4ErwUsfsvJ/UJYbuzeh2gmHgl1sDI7T6s=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27203     )
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
PUa1PQQvzDt3rhZK+aAUow==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dJw7bpUqCGVyPi0ztw2eJO7C7UKWgGFnwGPTJ+bYIchjFf+hl6ziDQNFo4/vmbRJ
D0JneyTHxigBm2yvFKn972PMIiELHIvgnrTF895RF1zMq2nd3nmBGsvutpxq2k2I
TzU8Q9NG5uuEMKxRkvaHgkdoorEp+8kLtWK7ZfdjHbw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27286     )
ah0QozOlSdL9y287HkAZPYx6KMsymFcJTZqHT4roYaJbKtPhsklQ3xrUJQzkx69i
NjoMI5S0+yCwetqIL8gH1kC9eOGn6FY9Er4s9Ow1EYwarmfou24JPAKvwzZ6hTbn
`pragma protect end_protected
