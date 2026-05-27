
`ifndef GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25UM/MX25LM device family in DDR mode.
 */
class svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns = initial_time;

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns = initial_time;

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
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
  `svt_vmm_data_new(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mYQayIfTT6rt1GHmfEh87DBNYeNXfSCpVpALwfEeLny3ghx1XxsMU5DP8gFCtb0Q
eZrILTIyjsC+5hlquUq2TOUDecIEvj4eQb315fhr5k6EkFK1UX5KL5h7/gYlpiRm
GbeBI0+bfGCFn8PQgcTuzctAnGRBxVhwBkL3V7Z82Nc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 801       )
IdajB5GWENmvWZgPZ+KWCl1E0SF8+CLMwyzq6ypmod5vmJ7u9RyKVXRXaC6TL9jQ
Z4PbkCXLmtvy9M1X6+3nknrcoq+ssdgdt73PIbd22dytf8HsNehlEKc3qkBMd9GL
pAreXYupI2O8KonqPrfy9y5sft9UI+Hr52W8pxSiLY0ddWL691gdiJo6o6KAQYht
1yPXo9/lu/nLzhvs90npJWja+h8g07s7lB4AbCCWNucx7jDzQH9pbkuHOrdrsOLL
Az/bwrbjU27DiBjAdjq9jsXpXmlO8g9iU5kBJwlDK5VqfAEj8Ipi7eyDQegrmJ5i
m7W+dIB/EBQpGwCLOkDXgeMuow7f1y6oeytihwYLgPJd9r1TpbSGx9KGDAtjAJxm
3aq3KUhxjFqyEIWCg8zIIWlDJNh7BUIZAEzDRc8ApnWdxQ+uU/jyiZLLowSzWHmI
HBBZ6R//pq5/FTlGg8xhujd/UQIrh8hNqHxN3wldLGW7lNzGfAO36pxCwwLg31WM
JhFi3mDZdVaoyI6JCWWzLx6ci7wh1FJnhpTzXhNQPq/qLADn28Y2qeCW/O07Z8fP
Vwer948q8TmtgMKK5hcQ2VshE68utD58hY0c16pSFEJFnTHsBjX1JDr+NxGG0aYG
Zz5SgWK3Jb5noLAbEoPOo6PyNC9yY9IQc1btIaLkszMZXSOllo9HUat16x3Cu7Jh
AOzA16xfjOmfnTiuR5kH/IFL9p+XJhNDyWUHxFwpWfssqIJY00GUkFNCY7lElkKU
/0fG1iErBCOs6PKyaNj21CFAS/oJBFfEuLj0+8yS8tmzCEjjm+sYAzoTN/1NfsFk
IRZBEfTfz8fA2tgylM0kAzSLOXRlCgunRGm1y4Uhh2CtInQhbrT5h+vb0zejyFJ6
riBcVIjpbEj/hB4DVBXNBKfPpxr3Ph4kfPxPorw4D6jPpc3TaBSVPozqab14zYFF
SZCfLZ8vtC6x7r5xEVyTFgN79qevqCGLCbT0nLSFi/U2lI5ZiOTgxA5uC4+T0Zds
jNRG2/edJdriKg4YyDeljP+yuL1+Z/gPGtEJQ/Xt27UGFiS2+t4j2dsK1eh7YlCj
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
j5FkWwIgWh6fwuZZLtbzY0i6a9m0FSWy/2K9UDhdmPxxsJddUrOgDfqNWKp+O+DT
Ke99nMTN4JZxeUHhKa/+/3nW2WjnGEnJjKeS6pLTpBG2qHvKvjI/wBuuCzecP7GB
rZoct5hBPF/F/3y07jVw8xtFZNfZMDXnN7L7QDUnlg4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20669     )
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
bzmv+D2us7fULh/BolfXLGFfG4x9dry5gkGMc+yn1F2H9vuEaiELrTHHclxYZhje
xeo1nDtosmRI1SWdjhf3GRJ9hwUi2+hMLwEMR8heCCZubwzGb1ZWX8iD84bz5HpR
bH9HeXNYpCIsaAw/PzBjb5sOoZpSqvKhY+sXzNHaebuILO8aNtDNosFLLD07uqUO
RPvQHxkgshwJfW0q24QpKM1fcMjIVSAEoydwz7VpIluAOKlK/Ebnp1xArsxsGOrU
/omPSsjt7JkN3KlCyUrYNnwuK12ha1wwPATTD/vl3v/LXATbV/rs3MytmMhY6Pne
A+0Wo0hdXd5HqeV+1w+aNmywuxS6tF2OZC+l8Vf/31zN0NSSLiEupr7B0UvIafxA
zoBL2AIu7GHVH8iC2kPr8Lhtp2cUzDA+MNmnd+uGHhLWvM0Aa8/D38K4fB79ng53
zsOKZbURiTTOOM2NXkeNDnp3AMyWUQaYwkXxTomC2qUMnm8A4fnpVm1QtmYmUUIC
85/T19eWxetpWpCG52bQpOnLZfwT5RUpmysLX3xYO4pMMYlpFVlWiRW9IX8FTM4p
Nv41Tsxj5MIij7ThCYWm+2bm4dz5b1yZRDKYpM0xwWDvSrJGFkarvEUHvqAZLl8V
Xf1VhE8pOz/SxlY3CMOw3NKncZDl4Pb1tkzOqlfMIxMVtgQQ/kWPsXS+v4cimK7F
plAy/yKHQdAY5owAdnGEjHNgi1+yuAVPNY6SObucdGZJUUp+nY3mtTfSC07zkFKG
PAMLtaUtqpMwgpw9qlQmNhFLbupB/2r3tndE6zjBQNeUOQi+rbyLTFHTZTrB85KR
9MTz1DNT39FVuo0M7O2exQejqnaiIKfIwLBx/nvXB1G7l+kKZGF4KBkxqgNcUeCv
q0C4laY0mOXjFXaHusOpNRm9dTptZpFlKa0D2+Ik0rZH2dH8/qD/WBxQzE/AVGNY
Y72q3fQT/62IPw6vUSFQVZamy3h93svYUKHgvrO8urjXuGVFxSiySkJxSrE4OzNz
1hs1+jJfg61g3VyOq9PBuJ0/bTpz31iPgP8/h0C+WUUXQY7g5eOrSbDbIWtBUwoP
npyfGtDIjAXypnKhx6lJM3k5wH8sNuKbdo9VCQ305GBK6wngyDMoHJyD/zSk/TsF
PEAqGQRkQMsLYkeP5f9ng03k1hcMQV5rX3aRykoP8wgz0CBpru5p429njpknM1B+
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DllXgp8J6JRwQEWhSFTfb3M3uIA/iHNwU3wTJ9fANg6+V9rZkLKSohx5yAoOJdIx
oWODlihiQkjfXzaNN3tchZ2Gs1/WaVHeLUKDtgglOsF1o43bgTvBb0RMb/QxiJJZ
PQa0kzGpix3sD2KeMkoneTejWdZFNQ//M529nWwNOP4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20752     )
1UPJBjA/aXYmz/vhcn/Fit0S9mYpcvpJVYjmn9/z2j//m1Yo3gZCArbknaBlvGBK
RBCFypHPLLknl8BUjl2uDKVxqWrIyrB+qS2zzWN6ucELRYE9PpoqyYxgo/fSOBqz
`pragma protect end_protected
