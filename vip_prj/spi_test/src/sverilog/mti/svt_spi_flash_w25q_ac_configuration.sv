
`ifndef GUARD_SVT_SPI_FLASH_W25Q_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_W25Q_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Winbond W25Q device family in SDR/DDR mode.
 */
class svt_spi_flash_w25q_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Quad IO Fast READ Command command
   */ 
  real tCH_Quad_IO_Fast_Read_ns[];

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
   * WP# Setup time
   */
  real tWHSL_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tSHWL_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_w25q_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_w25q_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_w25q_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_w25q_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_w25q_ac_configuration.
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
  `vmm_typename(svt_spi_flash_w25q_ac_configuration)
  `vmm_class_factory(svt_spi_flash_w25q_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ArADj07nleZOb7FWk7gHwW3Tq3UDF9MS9eJFH/D3Y+TpIdkevdKWCV8u/zhhO5Hz
1JEMaGQQCqa9ZOv5BKsmHYngOP4bBo4KKVJ/K+XSZiX0oOqZ4RwlVM9qKzzg5G0G
ZMvL0A4et768tYUvHejmuNU8DTM2rjE1kOiw+HDlToA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 749       )
ywrgFDoQB+rMfg+6XszgN74Y7icL6vOQeMY3913CXh+tpBNlcZvyTHXc7xvhWDGr
IOWwXLJ1qNutjl8041DQVCZKvpqDZc0m6b0QCEwsoOX65wt3IouDWo0lbR72fe+I
UhOIJmDtbS52qVQLTLqwjeMttm2PaUzydvg4prawLzbap3WYBhCx7HRHO79Upmnz
e+/81Jxh07kYbT283oytFjOqYUQCUQXrhiCuEMOKveLCZDseCLVQBnNWQ82eTGaI
ftaYiGqUQ6OoLOBg8gee+a1KM7CTVWkh6P4fuTP5fImnOCMalcxownnsx/P7+pbz
pMRi6niN6NdZ1BWzmJfumxHMYfbolbSpZDvqu9YO/s1ahhfxbnvQd7Z1mY0efaj3
x3c+V8yZBXzwDdzYMVMh8bVracOXIpqVor7hkEEWmomTcJtE3eGJYHmJ4Y7ebE6S
R06Xolf4SJ6K2HPnlF+yFvLYNbaS9SJa4eAENOmZjPM2jIP1tScEuEGxqClwJUru
RA/J5ZiNy2S9LLZucwNCGznRh8R94cVZ/l4aEsYwXjEAhSiEx9Lwq5S93YtAuOQO
xq198BIppfDwRYNS7aJCeO79gRDFIPdhcnca7+FlGuGhFX2eNIqHZT2U8jU4wJiz
IFH4tPRxa9hx+9Pjl9Stj9uGkzjKq+njc44PN1eK8ml+NYHdBMnK9NoMiBbwbzDs
DvzcNlHgKfLGaCKt2b2yfXNIfvcbNwQrU5lQrW0mtas3tui9F01qnHNS8imneJ/N
u0qMki+X/MtOPeidbNf47/JL5eggVrR5neDWvmZ5IRce3I3hhqniJzBpjxCD6MCJ
ApKlMWznFOzZxnG1MpQRK1NL3/8Ovm4djJ+PIL+oQY8f/p9iyg8lxROSxzLgYM8+
GDpGCdPfApg0c7R8gR9rWfF+qCy0C3QA/PnJ+CdZBzcTS5CyW/5n9xfNXgK4cE/r
B5ANm0rm9hEmnl/G8Oy9yVFM8RXsM/pCBpMl3dVi6DM=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
iZe4VxFksAMdRBXen5HJQVLLG50MsgMmJaR5nc0oZFSZvfmvFnX2ZLd5OgWB2Rcs
Fcpk13H0qHRUSm13HjoGkJOmLD9kLYh3VryXqvtqqdW1lYRY+mP5QcNWKgrDT5WA
pyCaTeYYKN1QQbtSlvnJ20RGMrUoIcJAwfA8OKcL1Pg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23124     )
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
OafEj73wfiTuKmMmedR7xQ==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_W25Q_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CdEDA0jgOj8oZuaoQLQOpdiG0fmIWWImqvAJr4W77o+Vn8cl3z95z2NqvCFUg/aL
s/HoWyCwVEu44hCn/vxwIZ2nHeMYHW0fMPWlpHlGZ2IPR9W6spq/rnoi5H9tYZpQ
QW9sBYTsi+vVtZyvj9D5vmDxYmNxR7UjCSEbcOOLXbk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23207     )
jH9XllkVFj/yCLcmUojF74YPohvClPh3Bg4IrIiy9iN5HiAYpcyVr+yjTZL1rA55
98R6Vmd86MGSN43hN0/YcjwzJxbwaDkWjYWE68M2AIA3odYZPJHEjxMm62b+PgKJ
`pragma protect end_protected
