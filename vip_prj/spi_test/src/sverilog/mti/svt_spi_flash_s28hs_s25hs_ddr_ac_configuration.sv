
`ifndef GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV
`define GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S28HS and S25HS family in DDR mode.
 * For S28HS, this class contains timing Characteristics for Octal IO SDR and Octal IO DDR.
 */
class svt_spi_flash_s28hs_s25hs_ddr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock period/Highest Freq support.  */ 
  real tCLK_ns[];

  /** Minimum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_min_duty_cycle = initial_time;

  /** Maximum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_max_duty_cycle = initial_time;

  /** Minimum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_min_duty_cycle = initial_time;

  /** Maximum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_max_duty_cycle = initial_time;

  /**
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock Period for Extended READ Command (SPI) commands.
   * Applicable for Read, Read Silicon, Read ECC in Extended SPI mode.
   */ 
  real tCLK_OCTAL_sdr_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (DUAL I/O) command
   */ 
  real tCLK_OCTAL_ddr_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QUAD I/O) command
   */ 
  real tCLK_OCTAL_sdr_Read_volatile_ns[];
  real tCLK_OCTAL_ddr_Read_volatile_ns[];

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
   * Data in Setup time
   */
  real tSU_ns[];

  /**
   * Data in Hold time
   */
  real tHD_ns[];

  /**
   * Output Disable time
   */ 
  real tDIS_ns[];

  /**
   * WP# Setup time
   */
  real tWPS_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tWPH_ns = initial_time;

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns[];

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns[];

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s28hs_s25hs_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s28hs_s25hs_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Uip/i6ISyFVzS79SyHQd64YY5XEYw5SrNbzKDxN8F49UTjwSydsWH41QZLnPGNc1
XERLIOYZ2+qyNTSoPWxP8TjD+wQSXQ5C+rt12F8FOZ3hI5cK+Ddrx+AowyB8lZwm
Pier/KraxJn31OwLIP+l26i2raLyUf7pzTRI3itBqVM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 793       )
uQ0UUehb3NbL5jM6A5xqYkV0IfehtbNF0XFdWrGv/Y7RgEynvujg7/lFqEdMM0tP
gq9jleWUnwKUgYywB+84u5wedUBQEVjgAfUyPX0voQ+BildRUuoqqpJ+xjsqFOlC
ua4m0C9Id1rKmhB9kS7OCssUXOhG2qIpo1z7KJPO9M3dw6cSoQAAF0ZVutYyTpqj
6mNpAcA8nHEQTPtKiMj2ucYB4MdCOqP/X2N3W6mBbWYz5Goq+6T4rdLMDLXj04QG
vklJ9GAVsFKJgU5SRSIGcx8zPN9Nh5zBZADOj+OTFxT/1ovc8DnQsm5BNDHN6hwM
5VXouTIcSGksfmXgOGV2BeHr3/yqvvKM7wCsPq3BO7DSCTAcAG5aD9vuXZi5CNUa
y0k2Gx9foM7rhAXWjVGpXltxh27qF2QX7s+lg+63Oa+kYsOP/Z1EAu3EEflfQ7g6
ljwm+MlZuIJSzVotuXuS3UDfSvMhxTJcBVMvzBYT3zWg8F9SvgYYuSR76wmpmW63
6cd5kTu3VMIw3rO5GkwDLmynZKgiXcGmn7+Uia9SnIYVxE+IKLXvrYWhRzOK5DFH
oxcrBHNgjo/sEBu3q2SvS/R3tXQD22cAdJ6qUk3EK+u0paZ8a1ngmkvz3vuTnltu
bBtnxBI6mNV+zrEvgqWlR0deTOzRYM+1VagOYb7Llhq7a401gecyoart99i4ExHE
nasSRjzPSs1683foNLuf1scWC8Ll0vgeq3ToqpKvMp+mzo2S/WTuxDSEGlvoDv1a
unHVcNGg4nlDP7zozjLiCGZwsiIeO4Jms1+jHdq7qfQnYHYxB/HUKn0F/FNWSFEV
7jEJUuYLjHPiDO/JrIM+hPgLRzXzVcR0TQWPhvEbn7xOpOwu9iPgPLe0CzBrXbdC
ZqBdroXU7HG+2cz2AfhqCYcX2O93tIPNNO5lQhVqQLyQfjqrz5tqgBmWwoRKt3jl
QDWLPpQsGcj/UFOJ6/w+yOOopwU6EPyZgt/cuu78p06cNKv/MXNU9kILL8it+3dP
Bb5O9QKbsv/i33KvlBeVhcxTsYTFh4DvUE6LoQkoSlY=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DYy1FphlLq9mtptEXzeNYpfkp6df7Rv9FUAZ8RhFyc3oOGAIi3S9qjuBOBHxZamk
ap0liasYgzbC8/5fVpf+kBupdJ0ZSJPX4efWhu0+6RAgJG5CvCLCJmiOvk/l8eU4
3bSJkqbAgeFt7mpGJ5g0RHNk2dBIpr+NuHOoUPy8OkM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 28484     )
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
`pragma protect end_protected

`endif // GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CemwDQt6w9s9xbefUFYHJDpvebTQE9FvOfxxF/IZAzzTRpQVEOjy/JjI5hJfCgd/
uSYfTSuKSXQsMwB0iMXZib9EE4SoVOWz7poH+2X2A2PV7aXmxaLhWW4FFMPmFlIr
qx8rLJWyIVzwjv92Nt4ozt/kOlk6ikpwwZKkLDE5MfI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 28567     )
k0zSGavZzS8hjBCBSQ82YxnJQQKjLKBjNbaUvzVtL7x6uSiEHIQLxFGZYgxwGovE
cHVrgdhvwu+ctPDikbmGCCQBXNGKHWX2brVJo+YPuSp7g+wwpV9xdOy42JMJ47n6
`pragma protect end_protected
