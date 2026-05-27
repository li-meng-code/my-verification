
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
uWELfljiMMN6ezUQvqz5tu6uiJ3UtSPDWMQcajJYOk9NwKi+gosJpty+EK6/LsYF
FLaaosHBLfcmnV7tZXCEPCjtpRSlaUFxQ6J/5i6aXinI/IxPmNBPxz5XXmEEHcjq
mLqfx7IG/uDaAkhEj0YqJ6GYVQKIbU8Ew0GjK9jUpkta3Ajl//kd/A==
//pragma protect end_key_block
//pragma protect digest_block
9hCZ5gqdMG8bbPn5X2LlDLOvu80=
//pragma protect end_digest_block
//pragma protect data_block
cMmyvslwRCbYpEiFSCQAMXYZqc0PGqxstkRRODaWsyIzas/6LLur6Q/aFZPexJhI
wvHyBAJs8967Hmj8vcgIR5fvFlGseQqcF1vzsJvyOycmE15itBxuu0jnChLwpmBf
UYcm9/ciaSQ3YgSY6x0g2Gk0xKcWj+s+kT7LXik8FO4YCMVLxtUpIH+J1IY9sBv4
XgBeMC4PA8PVPyaVw30Jfy3wjfdGrCnvK5EpzL5GS8r3NW75c+5cwK2S066AjohK
ilPSEvGHuSAa4iREjo0XApo/5MhaXxArc+qXAoop2pfc17zEXBgu3eoOWrEgFi7+
aVkQk3S95om6HcElxB+zxl3dcROirphs/t2QSApXk7b1s0U5IYsXkSLMfpYDn/dk
9pJwz0DOPxz7irua3xOeuNxcBcHalUTzhmQrDigvztHvMoOckYjS92IrVGbrM74e
FbXWbWL4SG5PnY5OzPYM9/AwR8cjlbjPmGfYBleRVMhznNYivSek6uhPQwAvqBpR
daIgwlGwLWceP7SYAKjHMR2iEsgYezG1VNNDLsgc96qBW8IoYcz2ILo6hkn3YatL
UpplABT1FOu0AU5Gvn8qmQ3308owOPINujdYopo9S5mi9l4BYGJWZJ1YmCCzC+kA
ftABz3eQd0k/MkLQFM1yv++phJP8h5Si4e+uHlbT2esIkhZtYXVN/mBWgGYajkdK
3Ta3d7Z/RrL4jHrGAkci5bsSEwhk/ldbXQ1WuzqHQ/g6glDBAHWGejlr6dYD6XH0
xixAuhjQf8ELJbO0+bwjAPbJvLGaMssTydlvadeIimuHwQ66H5Nq0mJc9sdSaUl7
67seKvsXgEkx7Fno5l57oqnY6ZDtJd3sxhgaNxeK4l69dzoagvsjkPQwADfLCvIY
V4/SiLYxSDoXk0vsPVnzwhv5mti4VPDNfbzDzgCkV3Cs33Ggqc+IjSa5NvF35STi
4O2m73o3TOTnD3X+97HzLBpArw/xTVcxZyQFASsd5lpfYtcjFNNIOMbN5YAKWRyH
svyWGfKI8JuaIKv8qWdTEd8vSjJfm7LJ9zOmCD63+A6klXNwyW3EXrcf0l2pEkBM
dpIcZvZcC6l2VpbxT7d7f0hiOXQ+C9pWkCRX66QQPcI0ZSOGO/nwCarZJDfNLX3u
QFFu8HEAK4i9CPtatCYghlcNsA05D1Ik+XRyTt89daLxChlfyKptxFgkR0ww+/UL
ZHFz9fBMGP9d2K6VUnSvkQ==
//pragma protect end_data_block
//pragma protect digest_block
tPMh4VCiO1IGdyrs2V7JRAq5K7o=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Lmz/ybnm8jhY+Mf2MhsNGimfI9VxZYTI5BE3FBM7ENJANgxEMq82fLoEzRdzx1bA
CoxbtwaW/14xar1yhQysa3liCSHGv/wsr7OzdGksbSATTXHbh6hMxhpYvLc75omX
NvpJOYeFOt/sMNFHlvbtB6HmkUA0lf1qRY4NE7xgitx0GlR83rfXRA==
//pragma protect end_key_block
//pragma protect digest_block
VLTtPb/HaiLUMd0SVLDqtMevJ4I=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
EsxsawQCmc/cKBwAwDMolLCgfo4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_W25Q_AC_CONFIGURATION_SV
