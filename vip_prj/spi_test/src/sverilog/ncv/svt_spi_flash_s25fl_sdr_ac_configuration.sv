
`ifndef GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FL family in SDR mode.
 */
class svt_spi_flash_s25fl_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCS_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tCSS_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCSH_ns = initial_time;

  /**
   * CS# Active Maximum Hold time
   */ 
  real tCSH_max_ns[];

  /**
   * Data in Setup time
   */
  real tSU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tHD_ns = initial_time;

  /**
   * Clock low to Output Valid.
   */
  real tV_ns = initial_time;

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
   * HOLD Active Setup time
   */
  real tHLCH_ns = initial_time;

  /**
   * HOLD Active Hold time
   */
  real tCHHH_ns = initial_time;

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

  ///** Assign refernce of svt_spi_mem_mode_register_configuration object */
  //extern virtual function void set_timing_mr_cfg(svt_spi_mem_mode_register_configuration mr_cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Calculates Random Timing Parameter value for #hold_assert_to_output_invalid_ns */
  extern virtual function void randomize_hold_assert_to_output_invalid_ns();

  /** Calculates Random Timing Parameter value for #hold_deassert_to_output_valid_ns */
  extern virtual function void randomize_hold_deassert_to_output_valid_ns();

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
  `svt_vmm_data_new(svt_spi_flash_s25fl_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fl_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fl_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fl_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fl_sdr_ac_configuration.
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
  extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_s25fl_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fl_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
mrKV6xAsXw0ItvqAreB9YvWuMSrJXeWpq+kpfqRc3knAoicKoU653PmZ1t0HVmGv
koATwUwNx7/f10/fcVUv/Peok4frVwfFJ73ld0NXuclfq8RNqP1vq0wEeQeW5LvL
GslZ5OTi619U/0p4A8NHyle0c5f4/83jqsn7oHBtS4MblF9OStP1LA==
//pragma protect end_key_block
//pragma protect digest_block
216z4O1DeD057dFw4z1iD+lgnEE=
//pragma protect end_digest_block
//pragma protect data_block
Q+lFmnJ+KjU/AOc1TRj9PmWgXfS4ACJH/sapwfoXGl9mNmxFIYgsomZxJFTekL5h
dfT3DZbqanxwg+nhFlrkLrOCbUbAQ7C2oHfmnC8NfERhdiqMJG4VxaK/lQ9KqqrX
6QZW8O6OuP86GOQrgvBCchpO6uR9ZDV/JEHOGI/25EUcg7TDpYbxI7xez/SgJ5kS
ZS7Ch8lY2kv6eR+tT/uDYjS6eWMTFhSPk5de6NBVBrV4hSG8/EuTrc0gGqBtl+2A
D0XxBOdkIKf4+2QgES7GQG5LwsC0XYFtuCenpMzYY2pQFj2oK+mFiGstHGKZf+jO
QHzWYxkI2+pr63cGZ0hFRJUQLYJCcCUWgeL3HIs0rwQ3Z1bwfGtHZ2geJmioWp8f
/cmHFa4NHYMb75RIgA0VU9Vfnpj3mpBp70r1N1qcY+AQhgf1RC2KDLtAAmTePPbh
53cjoNjEPQIxNhyFN4/beHZ25e/E1rwd/lUgIWHECOb6sjarKl5tE66ZT10OwILO
mqzsvLeJohiiccpJHrjLDITIpUVgSPXMPmPoVq+Zp1iX3yrlksNlkpqiNuj9Awbk
AEkpZlGndZqCglO7izKYXQvmwGc8CWvKCmdTUZH1LhNmfYG6zlclycXR0HsUA0AP
vqVC2eU10u/G4aij/G0OD3/RmZDvFakT/a3sVqO9jLWBMomUWC0yv4rZtoZLr/cw
+L2h8P6Cjx/hlFhnwWKZzju31Q7G5wqF9DDx6KRzcdl24RbwoaxFvxTk1qQm9MZ1
UxgvI30jlLgVoRYJJutmeya8W32jlcFImDz0BhpYJhm5QI9s+jkTSUpowurpynId
Zz0poA2zY43lIhJvVuZJ9WTzM1lx9LMkGgCDmTQhvGSY99rIMbCQXhLR7JLwRg5S
jaTw6Ca9+tJdWw1bn9P26rHJTSnc1gIBkz2OZhO9f6ImbheIUyDVcPH2lMXvtu06
9oWNwW7hsjDsyVbQFgEw5J7fizjXHM08oLt60javYjUoymAHC32xKEJ11GMx4z5X
OMOI9ukY65PGvYkSMC4Zn/H6q9E0dNuIAs79HGxzKxKSrk2ApkgoXW3/642OkvZQ
4yhKZDexaMgB/YrAjX9ETEUorY0lWZUWGCv3JtcwECNzw80m+pJLWnynoQQ+fKvR
x4IvUyjnGWZK9OVHtMOATtCEAnSKp7QFlmEfHyOWlfJM0KTd3A3lkcTlMnhsG6DD
WIoC5wgfkEE/j2TVStQX/OSYwSbOL4y0c/nhoYvwQM0=
//pragma protect end_data_block
//pragma protect digest_block
kXB6hMnTGEOZj3FNkfa+D+fh+Lc=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
cOjEKqAlAXwBUMcDS1xYt3QZjTRs/el+TXaISs17LX+B4R9MhGZMG7d1Gb07Z1ot
PeTFi6TUpqDW/U7QKVzLahZc2M64xo30e/SJoPmoO7KqWZVx5VjXRuz9Zg0eT+Cq
tfOeXpES4EzW0lv1iLF4KnGAIawTFCmzWeMn5NGwn1WPzqaIlh0k8Q==
//pragma protect end_key_block
//pragma protect digest_block
Jf8s5RNN6ekqgHQNq6DN6yZVb80=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
j7HhwHsPZE7tlGe+ff8y6Crx6aY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV
