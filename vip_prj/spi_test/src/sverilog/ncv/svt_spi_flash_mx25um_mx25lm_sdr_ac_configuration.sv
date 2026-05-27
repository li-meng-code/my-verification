
`ifndef GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25UM/MX25LM device family in SDR mode.
 */
class svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_OCTAL_Read_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tSHSL_ns[];

  /**
   * Data in Setup time
   */
  real tDVCH_ns[];

  /**
   * Data in Hold time
   */
  real tCHDX_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Fk2itfLXQWp4RbdAFt4O/3Ohk+HOiUmb0pQOtDBcvc7gZQ7//92isA5EECGsS7nn
XdDVqrOLTtMgXmf4GVDkqtCY6l+C3+fzQCc4wQAlqall/DLMICGTErcZcL4i3kb+
BX5P6XPdlCIdFJjgdDqlv1TXG4QsAWxE44sH94yt1ULjU3F3zTrpIQ==
//pragma protect end_key_block
//pragma protect digest_block
OB3egCILKsgUhrdSDP1H3aClsYM=
//pragma protect end_digest_block
//pragma protect data_block
TbSFLsXmfTjKxhTYJuosA/3l/rUxILnU2bgyEeUMXT9XUVvO6MYlzciwAsnwNrIl
WL93Btn4iX5JxTY9ZzTGoqX8cV6o04kktnULwtVWN6BSmdfuDcMOHvaErwLQqboO
LIaMM0a8B7BEZ5P4MeIBYtxVEg113thCAebJI2uUfGby0tGRRkepjkHFSSHQaL/o
5J+vIfQX6qtn2FmZz9QZtOxhnMs2rSZeiF5ZxBH9V6F5dwiz7cN3ISgCsp02FKfe
uSyC0sJjkNaPU7V92Y3wfjLYshBum8JYkOwwoeeQJHd3CtxDJoHRfBILRd4Z+iqt
HdZEPAfkdl5oo5I3kU24pks26/PBvjvvJhPrWOwpuBGrxXqVklZcgwyWaBSxpFhc
OhKS6XQl3QQlhfo/hZl1r5oBgf/pva1jTmuPHHwXafvqa/vTGHOYv+DP90rU+zTh
AxhmnlzuqTHpugz7D45ZHIJWfPOal5wUtNF/8x3zp/TNC4tcTo9YbvtM59XfaAS5
Q/s/2aGLz5mN8sA/7b0wuwyaJuDpNqkG1fKs4BDrTnWjCOS4T/0riRD89+ofxCiP
eMgt0wQ/+JJ6E94IpHsfkAkCBWnzip1hRpJHZYtkeMTJBjmu9SOpnNiLXcjP6ZRz
7AyNCTYR++Wz8zwLS80ebpkZVpTw20ruInDeVOro3S4WS8wNoHaMyLsjOXVrPk9x
lwdnVzx8sTIz7ackfUTgc7Rt+30tM56ZJYu04+lTdiOcen6JHLKdjhRrE1Tr5Cde
EzOuOv96hF/LSHOGioMMX3w5oUvgSJuBL5pDlXBnJgEHK8jZ8xs+GFmXi1iQQVwz
1zNVZ/uyoD81818sep6t0ZCmgUzPM/pxX45Y4i08GStdie8F6eS/4aOHlSB1XYoP
gDa0eDSD/v4eE2pmSKA3vnr8k7hd13e8r1B0Son3ZPyIclhrciAX/jZRIFoF3aqa
XDzSEZpcbmCaqNy/ceGvWPle9DewtsMVABHLSi2+Z8Xbs3vCB0HkaU2+cEZnmReQ
O7acMsrbOgeup+/q287rN1iFhvTkt1BpJD2+ChXXo0EPEOSXIjQIBnoiBS9OKYKt
o05yHwi2BejMnNiy3tGcFQ5FmkDcFuq4aVPM4FT1cHgqvfJRKwr5UAZUJko3MYsn
nPy5zv7L9TJ350bwxfgHRtgtWntjLR3uzPTydYZ2OUudMIUkehNyFMGNw8Bllir5
YIXregrsFH9GBVy7a5HssIEfznFRtogBmiGN8X/YGP6J8S2/5Q+MK1KNIHp4c6Hz
tOY9A5EKBuJxBe/qccp54Q==
//pragma protect end_data_block
//pragma protect digest_block
EiqtufTFP2Z1AM5jDRhJfANv5pc=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
I1/AWnoYfLWHJFe5HKidh5F15+Ta+IN86QkDqRWdTijGxSbsCPL+0ZNe5BKw8hu2
rInsa29nIcOATfAzWrN1RWHFWa/jkJ5ux2mgmWrmUZAOlmvGh+PxQLUsumxrC5jd
Z1zcIL+1DQiM4fVPanXFOmPyYihsTitpSLGD2zfrnHkX5uZDGqqr7w==
//pragma protect end_key_block
//pragma protect digest_block
8t+NGGw6AOSGkEnK6ujlLzWlygQ=
//pragma protect end_digest_block
//pragma protect data_block
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
O+Kqhmp0XjjXZPxiKxi8U1Ha5o+DKrq+gLELQ22QrEKUFAKIjPyImAngfudA12TE
eHY9++Z/MhQwqzAU7qTouFwwqpM/D/l07Okg416K08sAr1CVtVTjA/dPmM4l1UMH
jBaAxl0OSx6Vu3H0IIViV5moVRCMfN2lrtDfdGds8181pIVAa2oTPYITnECxefVr
pYyYlhd6F16qWv5Pv89bal2Itav0NiAOcS76QmvRTUrjbJRcmYbbkqkghMTUOIJ9
VumxwdS5egdSGbF+hMScGYESKoFVMRUhlhWuYz4FzPVy9erHyM7S85+8wpkw5XBv
B/XEecpI0SnhLakzGXE7+rG8Yl5DofHIYPmCIDc/3cqUqJTL7FF+a5GDNNrdbaX/
Y77xWqVLVxYbP7RH1thM4/nHhdWxCaWIuEiA5UWSNCBSEl3tFbXq/0gvE9YDL5PB
vRGzsnIE3jLwqbJy2MrEJjDwr45xMieVi0snn5uIfbMv1gH820JeXFdHoSZNBSzR
fn2c56VY6/Lyg8Upc7ZLGluGRZw87bDSa2jOFEwmZCZf/5w4Ju9yBRbN9Rlj+nYn
O9KrW2jGD7vkwDVWdIaTXJIVZK+OFVZMmvM748MwmZeC4tyXRkZOGdLCK90puL+H
dsNmHERzrX068QD/wxIs0bm1D82XenCsoRaOoDLT5lsRMh+TdlcwjPCyzj/7zI3o
yjyXFMMZcJSsjzbhoW/YwfLG5jk4kh3009SbGhUCxnu7ORTYyQsXv5PVIRlTTL0Z
nDh5LY/NjvNRLLtMmM+OCal76IbNCmbycx2//VcGNQyRydtVxlC1TXo8qfdoquM0
j2BnKxHPCh50s6MepRBzfVqKACcww0FDPUDfiQrkaUvNRCKQIQAf7gXcguOtetVX
OglhzrR06bB7YqtfDt8EoetNZzLdAENZSnwk1SNUSpwGq7wuTmKAIBuS5cT/hqyO
zqrQROSPg27lXnxEJ9nXcOK+tTT9u37Nzrfyg6LISAmit+glTUwuiirnLd7jPf7O
uUxjzYatC02yAYYQ2VTTLdTxed0LqHnhmssmKKOqyl4voZRxE0GW0x/RCnH4QwXG
Ab6QEuC7YreBwvPI29Ti2fb9bGhoqT6luK8wR5fsZ0Qt0ZNsaWLC45VtmDYn9PeN
Aarda10qTA7GcQQUnih8niVIx4kao8MbH20mN45RsytqRluY6oa7HojmfuqW9VeJ
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
jbRonJ7sxVFc6Ao4f34ubA==
//pragma protect end_data_block
//pragma protect digest_block
XOTaIa9/OOYt76wJjOEDPyEX00E=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV
