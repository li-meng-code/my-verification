
`ifndef GUARD_SVT_SPI_FLASH_JESD251_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_JESD251_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto JESD251 device family in DDR mode.
 */
class svt_spi_flash_jesd251_xSPI_ddr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_jesd251_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_jesd251_xSPI_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
EPWpOOIfoOwD5VQguTyckON9u0QqgUyxaKKqww4n0UAA75ehzPFMtXvMOeBveDmp
sZgjAMVJP79O3wQsDVLlZH7TsNkly7VC96HxlvG8ZyGSUfUhPw5PEBbdmvgMwPST
/VNCvjOQNGQvN0KEoCr4q/0kJK12g4hIxPDwL8/pi4k=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 797       )
z8mMW5clkDOWgCSsUtQb/ACzWQopmd7zkIU69cUiDjjShZQ+QARBQGezZzwCgRAj
ByUjlZA7za6e5c8f44wg0q6b33VhKn1tZeEl1VpJyfVxfLmjPjcGuaf/WD2vdADb
q5na6Aa8kY2e2thHzWQVtHY6NGVfutgFIEoKz4w6eXGof0Hf4Lc+qs3BpmLUPdZ0
wyWREsfqvJbdb2t6wLXugtEDE/tPYxDMDn2XK3GmMRwr/2ViX0zHVFRqyxCOvDl4
FqLcTbZj+N3KxhaCNIS7LJEV9DMgn7woSU4ksjLGwxbO7JW0JomnA7dKmsuqfBaA
wkkP8YWpIlJ2JHIl4YQn0KRA3smMt+/EkyvOZJizXLSHvxEp7J3bPJaPeT7eS4Ot
80eEDdrT0RKdVIAIvADs2ZDsSWaZ7jI1g8Yf75A7aLtTgIJFOpQqJK/NI9W/6NYY
KRecVJiSgZeSDi0FGGhgYAEXLRKljaGENOWUpVrba9LeDJDDtFNOwvb13HnYcJit
9NrkTwZpQABNMSHiWmYq+xpRipRYBUwPkKBU+ODRJBVJGIzL6gEhI/OMZHwp4iL/
MRbAq8aU5HSq/qL34ToWmCkVPc8wsS3+I/UIcIPm1FrdRJLsrxazeviygayKHsw2
lfDxRpgwlhglPiTm4JdZc5OKL3xRHdWB/gTgmpWFndV9Krv/phdTV3pUGBYzDRhE
o0Ds8hH8w6ycD+dobpynPgZRLqMZuzOfMq1miaUxktSDTc9FyDg2w/7xln0ZdoEW
WYL6rwrzSVaZauiCOqO73dbgiSnp8pf66TlY+/n3eiYYvSZZT1nGC893FAK6iX/g
GfFI1Ps0botBbTA2G2I1djjaoDhKvf9Wop+MUtbEy9Il26E6q8EE/fv2ur218Ixo
mGDGR3MtuU5hvKAJ0jP4sSerFqkespkqcbNI8fwNeHDZKZEXwXjrxNnRrjmrI8W0
EPM2feIjST/NqFARh/FsRHjELuOqYKc2BGCndQv6scka7fP8XgyblWwLPZt4+KnL
F0asYmNu0A+xu5eD9pdq3SAwAaiX/Fn859KOEpfOyGI=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
lXwpICI/YDhX3DpTr1qMD9qSu/8cM8YdNAAnmp8/diMnZq7dJcKvBzxqjYuDl/J+
RbtDMVTVkCswJ+Z3cWghps98F6utPI9zbh8rTZBZ3TWUuyuWShMM0VdznF4r/9sv
140hw/HXc8jZ2YYvArHHAHrUkdcqh8llqWl1+WMPGJ8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23250     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_JESD251_XSPI_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hAnS3P2LqfguAr1JYl0Rr0Uw77vLVgi43vG8zMTgKw8xSyWPM7YDJZ9kN5JsUQrM
dKX4YfdYJUfflRindVoNTNq8bKEZkwvQVn/hEVLrq5BQgrDillMzxJo+xSJAGma5
yI/0XuAlW/cVohOepPXRIHNoSxiBZFmp4YRqpnUhGhA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23333     )
Yj5KC8GmQS6tjxpzF14Yf80FCiZLBas6PouK9P6d4X3LfWKzBVd/ddTXPXdmOKB4
YszVpBmzcqBuSHtUM9vmXiyJxaGSnNIWCHVw/wQQ5iLiPefmaHoGOTJDinPWejto
`pragma protect end_protected
