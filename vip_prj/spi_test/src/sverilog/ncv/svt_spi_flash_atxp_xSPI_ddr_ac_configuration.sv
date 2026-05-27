
`ifndef GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto ATXP device family in DDR mode.
 */
class svt_spi_flash_atxp_xSPI_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns;

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns;

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Quad DTR Protocol
   */ 
  real tPeriod_Fast_Read_QUAD_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Octal DTR Protocol
   */ 
  real tPeriod_Fast_Read_OCTAL_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Quad DTR Protocol
   */ 
  real tPeriod_Burst_Read_QUAD_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in OCTAL DTR Protocol
   */ 
  real tPeriod_Burst_Read_OCTAL_DTR_ns[];

  /**
   * Minimum Clock high pulse width duration.
   */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * CS# Low Active Setup time
   */ 
  real tCSLS_ns[];

  /**
   * CS# High Non Active Hold time
   */ 
  real tCSHS_ns[];

  /**
   * CS# Low Active Hold time
   */ 
  real tCSLH_ns[];

  /**
   * CS# Hugh Not Active Setup time
   */ 
  real tCSh_ns[];

  /**
   * Data in Setup time
   */
  real tISU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tIH_ns = initial_time;

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

  /** DS output active time from CLK */
  real tCSLDS_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tRPRE_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tDSMPW_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_atxp_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_atxp_xSPI_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Jz4vozJCtU5bz5ikqx9J+UsYe0p9H2qWbFLtoPR9mg4dK665TPCCdtZtGTkLpIRS
1hnzPC10J/kpDbjSvzzEHzqodAyrU38nwhaqkodIoHsIuplAmCXeg6x7J0B0xydM
OA0Cx5ouvQbxjjFm8Ix1wExLWJxpzY8DX6HZHeQm3XZjDc7msu9NDQ==
//pragma protect end_key_block
//pragma protect digest_block
uw/Ec9JXHpp/OmNDrwSHZSdNf/8=
//pragma protect end_digest_block
//pragma protect data_block
0/daly+qb8Ms1FPcu5d+6s3aCsnhJQeJgkbJXeXGnS4sb7OAPA+3nvDTqOpa9FXy
vRKhFDLnkOJvdLsrTVmVJwaN59+OvAGZhVhOlv4gjJwNHSkKj5AAVwpuwvH9ChBF
1n5Or6Ae0k/WqEpAzhN+aKFXSfn7zsk9SixJYq0xWdNSflToyFwX+Wahi8v60dPS
Z3RwR2LL7fhHS2TWc6H2pxJnN0oIsS8H9VXpJYpry/XBJ5z34MD/2Ol6qWbSzwZ2
an+RNbM0EBIMEhrAWf6ATD2mB3iXYUK9YbNRvsfHU3LqK3kAF61M0l41JcAOWnB+
E7DhFHwResl6LEPZpZ7zfwpeN5foCTGRkjy4HStVeWMKx8kVPMvT2FOAF1DXJk6o
REFOVq1EBQscz8HZmtCLpXY/UWjz7TEOEstsyF63wcDpSlIjHTT98ETzfo7umvQL
oy/9+SInPzJje/bCVg4n03HVslroz00xuSJYECLZWb/EC8jZ8CEAVasDIRiA3GjM
d+/NCR1P1ZDwMsilv63s8xzBZpLlEA6MWZCeocTH887IZbdUusw/JhTNWSBNzHor
8gQNucatU+O5sh4PJXw+yaNOvGDm2c3AmotuxM3uE5XP8sM1muxLQ1AWAN2qE53e
pzkUdN2CTshF19Xejd9D4HOd/EhB/wBdJ3zZkbICV81531AyOGvNswXQUhsT2LDN
L/ZPFhNmhqFttPSBSkNbdisc0uC+EKbBt+yGw52ZZXu9wuquvDksT4EsloNVLhD6
/C6Fkdg+aeGoFM7elsMGtNu77IBG7kVAiMDNGI2x4/aLS1oVnqH1pIKa+K5qcLpv
vBjwQ3qq86Ra5MvjEuUUJIRqrWzNyjmSuIz964Fr+OC0pFZyzs5ZKLXKR/PlMTTH
KoE75o5QrToNSMs9SEXY4l9pHa136K1iIwotbS18O2jx2bsgjyE3rd9yRKQjMfqr
cIWY2Ib2zSeKNn0UaCtuT3JohV6ll2nHN6BUHnaaPoWm+WAdK2EUd2BlJbsXYM8e
D86MNhbIgP8FulQ80n3ZJwTujneRYH08Z/6frQB+wNEznhKoQJXlfSIW9Hn1V3eW
53fBtqlQXCE7jIyK2Mku/p/b5gAzrbVn878+h+80g8ySHV6CWXKs3BH1dNlnDb/b
ogFLEANtFxChSa+aKmG7lapgbLMH22EKSLAS9GpEOuUmb/Sw2Ndjxrdnqi2FThf2
BsRQGSZf+6h/K4b6ryQC/SMz+NTxq5Lp8Kn1/jYuq90AdN6mBk5oGU9Jlure5pZ8

//pragma protect end_data_block
//pragma protect digest_block
IOL1BqlWXDR1L0fXRVudcLcGgNs=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
JdU1jckXYr3L8X3jJf4sn3uIZK7CHtTZ+BQehm1J9nzBzgYKRZDPPCy3WhGS2T3v
Coh608gCKCm86k9LHlRRG+M1/nvrGW8kw5k6vsWhpU9zF30uZnIbqEN7MhHiL0sj
MueyvJ8PGBh/3UEicND7KGsMvaym8TJJVfXVYmL0XinwyfBPsqkHwQ==
//pragma protect end_key_block
//pragma protect digest_block
mULwCIeOJwVRZboW5sGAS6uUT/I=
//pragma protect end_digest_block
//pragma protect data_block
FKAVVI3dvRBEsSKrKxsewFmcGaw9wTvenjIwW0uEDkd5sVJx72V9p0+fwG84CJ73
5n078Tpj9JTg28vdUcUiJW++1Nax67Yw0msxUTUEYMOk9QMxCtbCGSecXk5b6qZK
WjUEN4tuldVaI4WxU4vE7abvOHp6FU+Bd7zLukXhYIxKTXA8b6U19G5wdVGe443g
dskVCVfFldFdxS2Dkmd1ER6WOkoRS/z9umaU1rVXxQ0aFfmMB9nJU24HgYTCHZal
7lNuFEcbnuUeZxVdF3nR7nShDavLftxpMmaNcds0WxNnypZQPEjzB+rynVziOnhQ
dismHrhg0wd1/lf2wpGpVK3frbFJqfJSLRvTSiFTvYzBoRgIDd+g4TyoBfyg4Z+h
accqGIGArdWgCZiWiQlhVAxMd4EGDqPmf/OQtE9r2d03PuocUMPLreO1cQHt7pf0
aszxplY4i+nYoKoX1Vt27gmqrT6i3qm5B3M5hzp+Itf0uVJbVGRBbNyWxRjulKkb
Mo/qiR7YKjegSMz5emCovTcRo4nNd1jxcT6h3zOxQUZuQ4QWT9orOk1fRmZ6/VwX
0EioqgFrCFDCwNKsv+UIpNMIgFgvLRh6u6IkGR/h4MAhK2f1U32w+ROwS5IMh3/s
x3y+gsdBN5a/7QBUY+t3E92kV0IKxijYkTaLM0q0ci63ugLfVHN5nVLtud1qjHCn
Tz0yDv6v+KPS1731Etl//z8k1cgTS9BXsBFmtiPJp0N+mY2BLnDwNZ25f2DPjCd8
w06RjFGgdaAuFCtEW3yEsgxDbMo8CvUHEnbjnqhXH/sC9iQvrI/27XLd8VcrffO/
ibr7ImcVxmf8+lsCyKT2CVY1YTHKYzGXNvr12QhtER/cHtywENDcdK8fzX/cLZNV
tPIYsqzwARw3n13Jw+IyncNtaKS/R4o920MYjhEHzrOcPFRbpcw6f5O+5ck3WF0b
c2+R3JnKzfPWKicB1grGZQlyV5H+GKNXJlwRf+T3plTNSEj2BqV4xGUUSNTXTQwM
qtTaa9/zpSwKaP1Afz2liRSlQM3eoRwjqZe8RC4R1G60NWzqZdhhUs9H6KK0Fhcs
eEFlM0zkGk0FzFVWdx8NkXIcg8PB/cnRlU+YqR3o5ColZb0oWYwZzzk5ECi0b3U5
ogo8N4h2nFGA52WH/PTuVLjblvgbd9r4wfkkoqanZnycZf3IdQbWCHAQKXqhiPtA
IyqA1aC5YBeRP8FFrw9Ok47aKXa3oe2k63jxT40TxJQBlV3sOXm+HQgrM7PydOq7
7b6RqOwXQEtknfvI8qvr9NpwCtUBKNX+mdJO9Q7M49hW9t6NFiYN9oYU8v1ksgeh
BCloDaiTKkrKtc/9qUIy/99c5sQGgr6KmbqZCmAGYh1mxcME7ODUYHxT8aCxUT2Z
3IdRt/22KbQtNNTwMyNtG8FdObxGf1p8GiyeEV5xNhhbASc5x44AZ62y8ws/v2jG
f4EGs6KyYkhOR8KYY+ZRQpAAh+9GszRBFYo7lRouhVxRlyQp9BTDLdLho+CGRvFW
sHW+OHtQMgk5UN68QBKTSG+0/3gIrdHG1K9BnNA+wIwjZxRTQZrbGuTs+DXMkN/5
wDR9FCXRDvQwhcUCiJpg9i+F05ZXD5SXKupsar+tR6Jo65OXd/Y9SSFoKR4wXi8Q
zbym4gF6waiTkXkE0q23gIozhiFUyVBKM1fHr9y4a7o+mNiXlhlMyU+AWqM7bHOq
lbiWsFE3G+FJWVqenkfEm+0Bw3u2YTQhOci7Pou9RlO616ezQIbxsoLGQOY3TJ0F
VogdiCX2ni5CNQre041rA426eUXVcstDdd2k3kSmTsOymWu2ONC9Q0p4I1FYQIib
FYZYStxRTmJt+nQ8Qnc+lsY69J/QE9w4+wHQWanYvULA+1gxHO0w6/OidWDmAUi6
Tah8gawkD7oYN/vOafljiUl+bMvrN7XBLlEY37R4NgJbFzj2mPZm0E76TWGPJ0KK
74CgPqRa32hP7TK+vloWcg65W95kXWM36Y4+o5qwjRQSKhSK9RFPgFiR20kryXO1
xQJrk/kNMNlSwgiJd3g7GOpCbVhTfjsu6n7jPns5TaLglEOGDZXPGKMi7M/qbGQ8
gv7xZ+CV2J2/h26Jab6ny5r0vOpnqjpUeg12MC4h0jA+7IepqCeAevd18Gq2NVGR
40nWnSI0EqtCLOr+1NvGNGlXmjvk03ckKLnm6nyzaAm6qLUdIzzl+wh6NH7IOPSt
pfz51sX66TWtOuxsjv6Eb+jXkpDv3fVEO7aZzmsvk2ywwtJ4+8crY0gt9Ao2rgjl
rGb6hFAWyaPbyE5ybIN4QTPAEbetpJpMB0klTWxwKonUpqKXkP/1h4IY4SemZ5pZ
iw4q3I8klWV0HZbhCAb8PAzjfxkfGiLAzj2z69PWcWkDAcUmo/z8N9AFubSYKHx+
fVD5ECXhGQwxwmULkXLYBG/IjbJx0l3i5WEdSFYemM1CiL3lqqzW3j2xr/bdSG61
gtmQc/wQvnxTTaaTylQJEC8Tdpgok1tLzP/n/zeZ8SuvMv3nBR7FmR97XJLS7U6j
Mq/eZiKAxT9sxDFecezA4a9JBKlgE4MSCTkpz7Shc29hkL8aEdUoldIHhD729DIL
C8zrJ2Sdqsqze+2MYYwvNxK3ff/0ZfxvuHJxsOBccNNr1PN/uDOq5Jf+eDMoDBPO
RDDyUdlPhL+2mMkFVvd5/QZWGkN0MZGmmVOjCrB8wblNinWjPfUT0+/8yTA/qruo
4EoeW0OQe6Ei9X5Mp6aigR0jAPMvrTpzNi7tMyvPbvs1AIX8sRWYa0CeBA5YYGHZ
yOCowZJF0GEahdBIBoj5qps7+0rG53G7pcXoyNkPCkqJbXZ0JBm9rVJuYVImn5JO
3VH1v2yExYndJFQ52W38IECWAMnkQAK5KNLU+2ipOGLmsYUFn7HGtdtMLR25156P
vxSfj9bktY4CC2CbjyE0glfD6lLuUkWA3DFP0dQToJWxwH/7p9wsFVYeYUqPJkuL
cRvwO6DZ6Ie8h6lonzUZrgqWi4dxgCjt8CW8grFFxUusxhQMgOfzE3T3rod6/HSv
8MIj+/I4/poI4w7tLz/Yc0GFCq7Uc52nH2YoEMwuv71kfXtkEV3oZQEz9uNlyiPY
ND/ALfj4SOPQclQTbMCNnQ9yGO25SdIE9Svf/GFBNjpIAYW9RcQAwvK4yofuW7Vt
lOxtiIL2LKAo7EV3cgSW8LCQeaRyOINPMAOurx95ji3XHaVq5c7Rqm4rALUF0TsP
/otXfApJn5E24+Y823kqvNYnY+kRmSewB3ILU6LBq8aDxHXe/eOP8IfGqYLQ7TLm
KLK/aqFUbhojnydapbxafQWGw6JdQnzlso0fYJaXAjxQM4dvCMj1G/0+pmM6GL4y
KyUFQPj34FDPRa8qwKxkOVpFN3Lm1B/YGM+/8fzzhvtu/cI4s9ipri9UWfyibJiN
nyP6Fh5ndbd69B0oldf5q27A0Ajy+QpXAQnFSgm758h4w7egMc7wzzTg6dX3rS0G
djHElJINvoIDjVolYEC5leEknsrDlLCVdlIxa9rtWHmcJpvZ3kbhCtg0ZJFTMAcL
NIlKotlOQW8CS5XnhiD4dnkf++ET4FuyxA7KxQYuGVqaTZZntg3gvEanWZnIHQz1
ay8DOeXcmdaDQx2Q6PlSBJQtRppQMKluoDeAO1jbM23jN8bPrl80eNrYiWjzsAF/
Jl0IhqauqnhaRonqPVrOUw8dzbMEjP0pkMRi8TNpU7vsj4f51gj2A/v1v3Z/Ojmo
Cg/jzrQvsYoMPI+KOS5gW4Q5Dpt3fOrKim89Fd3sB8l+GEyMT/Hf2fy7PbV1gDtl
4764r3Wh5Ztf3USFilzfD6/63FEpkJpGW365jmBVudmzKCohYgl1buw0A2sIp8Ix
MJuKz7fjH3iKJaTa1EZqZFtdTDHYIuIOjgzrFn1DOCY/1sqLXI8vL/KKeOK6oKPj
F41XVbpBw16Pg7l4rSKBEmY1cLdgNMO6ejD1TWQUjHGetgb824ZPXnfPp2jmJ2KV
NhTUIjTqqmbbngwwCi4fV3TxFZJ54pm91tSEfpSLz1mY16FUc6yIqVYItjFx2scf
X8iGyCSvz/xuHvgCYulzcILASj40y6Zk/zukvOK7g8d2ldV9/CgPjmf9ozhVH+Fc
sRMA5O9GAuEoaTwQki3pY4komR7Qwl0WYU/Dinuuz5nOcJJ6KigZzDNif7DsWHZq
r8b2l9jsExytEIzGeS40EIrZAhmLARp3O/vmFKu/E1Tdi6zvEA9R+bRIkGNIt4bZ
77b/SMkBOa0tvhAzu+dTfo20/QfRSTJyR/ASUif0sz9xGvfk4+8yApcG04ZFpLnH
ft576avKJ8a/tKm6XqwzlR7La24aN53iW5+fmGNNE1i7lozPi30RK7bbAwSwyEck
gOeLfLaKiGidErg41ahJIMEP1RD9EsX9BKH7h5lpjFZvxKaLSRqXDOVU+VEnf4AU
qZ6fWWA0tZ+AlN5b3KQyIvnsboprw8Gtbh44HT9bR65ToJFU5VP4k4Oz5X+l3gau
OTMmqwtVfrqAdXv5Jb1Pq7Ne0+8AtLuK0tslmxSVg8g40DcgtJRPZsIJvVkiBAD/
maV7xEHQKs0e7Z+AfewROxX+ClcY0IE4C4ziK9MYUW0m8pW63IEPO2bUHF/IU9/9
CmGhPDsrXzztLgfio0pYkDQb5+0f+QFhTgqGtAhNe1pmjQ+OVILzdQ/FozcZiPhg
h0aVV59jdKKOHshBnmDBE0yZ6jbYO9/U4OtUgsZMC5bGFhnfrBU3RBv+DulvZXD2
/ewdFw7EexMx5X4hR+KHDrdxlkv6QM33iG/kz8OEXQuintZbUQOgTsef4eX/ay8+
QCKbcjzHwSlt+LvCo2VU9WNGNv5PIOhDhu1Ho0Gk97pGCPSxGu9NoTKI48w7ZwzR
0CBZ/5fGuxTswGD6ZQUoy/r3gftoLjdG6Ri1VRlFXkf2MRURUxFRXgBsPvaL2ENV
05bywCdbyyjXSgtOeodYE0E3/7v0nj+tRO68q/nb9y7DJjLy/Xtd4gSB3DAjhfkS
Fc4jh68cfuOPFSXmYu14GFA4C8gk7BkzsEtD9e9oDGVJQ02gpbggWrYpkFbNUV7d
uoHs7qVOhNM8DqPFP/0cX6B+YIGbYDuSn0Nm4Bksiaew8IAWdjMGKcuxHZrwQX11
2hKnHAnm/O+4io0F7L39oOuqWTJsNevHHLhVgim04raQH86PkWu4iAb0p5Sg9g1W
3pqHBvqxqcdzy3L4RSI7dKU0GPE8rrpocBHi8wAnamjOA1o1r1rGphNY6t15SFI/
CP2oYR6UDo87sH4lb+1GJzVNjcaLvaDtBm+tdIn7jpuZfXbRiUOpUGZScjErJeOV
1iDfak6rb4bU4R4FbT/wXdEE5i83JOkvt704g4I9BEIXhCtduf7zMUqAFA+DqfXb
jX08j3RI3PA/uzwlQHEPB7jdw4TTMCwRvkDSfpJ7iEhW61Mzs811LQFnA9y1Wb4m
tXy7qPMLnMGyeRsbvuwJ0x1LC1pKrU3ckiOuhv7xgOVSuSB4GNYy70EeKTUwBGJ9
PgIkKahYo340J/Qw3awDb/cbXaS8MwujGdwYgsSR64y4UTa2wKtFXe0VHKELb8+C
OGBUKA5WlqNI+Jo2xW8FJyCXxJaal/B9np+3j5alM4G9OHW0HNRVhprzqRwED0tU
AzSDj7+v2rwqrjoQucS1WBCMWfoPf+zhk2TQjNhyXqu4akVjjgtNSos2jCeYGg9k
anKxSLJEbCb1RBwNm964oIuMqOtk86c8DxuiZp7lE9v+nX03QABQHmIEeMI31Y6o
S5bl7qGqSYIGMz9qv4vs7krxTBeUfh7+Wp6je4oCm+d/km+MVtdXeekSnEmhwaVx
s6NTZpFjgtfFz8xSDP4vT1BJnlCvnnwmCiOBIm5ybuQFRk6/upyqh5Y7DZTxKQlu
XTjWGSn/yWO4qLB+t+cUPYJMBOp8tMZSkSP2EtfrnyvpH5Ycr/zi44GTMhrJ53g8
hn7fdrdHo6PSlkZKOA9r21Kxbfhx7XDGPzV66kyO6tF/iBgz/RfQYT5SF7t+ap8X
Uw1VINoWY5Dw6RRHvtN1A3+CeEjEzCTK9/koqNhRjs+qlBzApzU872MJaBME/CvB
RtInsQKSrCWwyJLgmQjFEHD/9wuGTQ0C/G1iurZZqT2GtENb5cmnnaUuEG6xnj1D
N1wFFNUyhE9ig8mfbXZ+wVrVzo4TN+IA1Vw1gRq3xMej94vKg3AAssWrBkpAHEvH
lc7CPpk8p183s94r8Gzcx4wWAobzBXYst4hZNGKxD49k6N9VBo1N096JKTWCWRQ5
N0E7mtjoxOGThNEF1unW29oUusftwJnG45mi+7BNLOZj3E+fT25ArEyELDK/hF3p
VkYBy02v9Dwigx+Tp72yb/O922hSUV86cpoMU4g7Gae/4iz/hF4S/bI3ElEnIwny
l7WJWKIPlQjVGPf1fRcwFN67GpZRG1prUrMpuZ46n0yNHnQRsBWpZM+VELs4qbFQ
6bFqQlofzduFWeFvmw2sxjt7hDy/3BGe7Z1iXBl0sIUFwVnMVOJ8YAj8ZtnkJ7eH
9ue/0n5S4t2zEdMoVW9zXbmikGDwGU1D0XZvx2qOf746F3D2B/Qi7ZQ7UUe/8Ydw
2UmgXj2OIaNo4u3wFNuJcA1ap299OFk3Sr3UFZxdbAUxV2QiG+mvP9pnOb5KYJlo
Wlcw/wEpO5xqLD71FaI7p8T0keZMLMI2FrdS5J1KjSHNaTVIOSuqxpHkHUquGnEX
6YDARETnrCcZ/aAZwR0Q4HkmZQQzsCehfOwK5n+7C2wAoa5gulzZu2WXfNbeUyE9
HOe2j2rDwHOFfcuNwBue/vr3L+Sg5kLYnQZ1iVr0AF+vGttqtIXOhv57HtTuwtTi
R21NzHF9cYxzsDCtXwK8ZMcOD3mGfHjOB9Z2b+JAFk+SLbK+o1JKOIq9SgyefcAx
DBcISJlicyr3aEjd4clTGD6fDlxSbAN51/bMqIWxiAxcGz+4iMqQND6f0dY3QW9j
kaQvKxHyRMAx1wpUHHXMVx23lmbos6uPrcdhlF7xfECfXQmdz2jk2hONoDVVeuJi
3C0V2RjbG8xD9cH8/tuXZnoAjaplxB41uoCm1qERuTzAgLk5zLheZuUaqdWJFEKO
hHuCUEpOqEOTpA5GnM3zT6GdBnLk2QulrUq46m0rWCgVhKVF53dMPwqtAz1H9wWU
Co4UdEKLrhpyq+DVElb+v0rx3Vpj9HjY+bA53Ds7QZnNm3ycPWfDzgMCEeCTPIki
Y8KU8uFMWFuKyiDObNt1sflGrFWHpevS3N9GAU7TORe/8VLcDhdFXukGPGiQzVnb
wDjy1CqTkiC1Q1wbSXUJW5Kewg7lVEUfLJHpAEIZz6N+Mkfl8Omf/tvbBWFZ8+uG
NJQMML7idHJnNEUPzG/ZtCJeZaRPTcKF/ZjQBjPSZnCYGdiSafK/xeMsnLTqxKuw
trJQF5OogrWD6Quzf+RGZSh3BDJhdjEyg0HGXkyzVdhblfScGCAX4DznA55+jyp4
LMZpxcPZZoT8TnuwQV1Vahp74LSbq+ZyIg+tYqtK8i5+5OlfPyrUTqFgX0jNrRN7
4s6I/gbRtws7Ky29j8qB0UG1gp8P1hCiFuUQbASnKDBDazSTJ6hoQZ7GBDkIRQWH
Qo39ZEfDVq5WsknRtYBpp/oXX+W8lTr5e9Zg6lNLwcFnVHuZQTlTIggoNr2Ql+Jz
eRzpzaCqNrBgy1PDj6Efm3JjRl/ybN+GzvemI/BL8csMUVt/WPxx/k3Z4bmpkS5/
Nhs7EH9P7mCGaurRsrMVCqpAbHqVEK7mKHjNhUov4/hjuxIXh71lpiUPVXRmRzSS
R0b56CgJVArkOdnoW/COA5Qxp845Vg+X+Qr2ewJ0CiW/ERmf8mbSI6dOq85VSn0b
ENcLxzj1HQT+5Df+ocQh7fM2h+L7kuRb8Q8jQ03urn+gGTPFaH9xcsweM6RToxmq
iZRGt/SwvGXkC3Ly6za+FuweZ6MQmesR8vh/x1UnVKBKckJtgYJiRbwcN13FWdmJ
BHznOhmb1xEncmimvYsSz6ArYBZXTmdCItzoY6bwXdFgd5A6pBP/Sc6igweCP8z1
zm2AdEqdx8gsBjfCVkqxxJePAE5jqZ3lJrtiR3JO8CkMDU3Jr2ZpyRU0lTF6Zb06
1vV7ktbTMmNBze9WIyksCccHvukdCbDC7Mi9WyyxTL4yk5WZnFdDGLIrsHp5g0lQ
L/SCDjRp2kkulrxu9CoT6hid6alOc5qNwfRp98XnaQ4y0Cfzsel+VRHHLKETbkVw
h3i7OIx7/q2oYrpUHRjyAiUs0FcLOlqzJKHowB5SwKndAMLaaCgljCNgNpn9RMF9
4S2p0ebW6eTv0tD1p8TpwMIoeWF1SGawFEQKkI0hiUp4W9g6Le32Aut5YEdQKP/7
isDue1gr1VV7MmHs8ykUNNurLIvywM8AUgBvRyGNGTKjtwq9xDjKjRgjgG7iiV2T
gK6C0/DcKPnZjzPY+w8yXy1reRbXP+OrR+DhP+hOhyBsFqdjAxGH1zC5WA2LdCfO
yQf3kYYNnVuYdXtJPYKW+B1KAFfIKo9A/YdgasxNXOCRJNkdJ5/Sf0QhaGgA1VnJ
nAPPszWs+V6FPgGOpxrqntvUdkOdzTfUl9IFV35/8W9Fd4zWXhDIYy/LAWROsdP6
9t+IFhmjsCY6NormePzC0IrPzW/+TDx3OrXh8YBq51fNDY+KPlLZvSiQ6h8k53Jp
JarYG88eNGGMIpS3cQWfEaLCnx1dSd4b2kXYi0FFAdKZskJWOk2njyeRjdM5xbBG
YQE6QU3kq/eJSWSqbfJIIpSLwSAD8mS+++iHuq4E4M2C+fHZeFN57zGP7AEBB5jS
QdOxIvCavMwWlfn3FaLCn6K5IETCxECFqFdAH+C5hG57REUmZODXSl259ZMeaLr5
CsOfbC6vMIN8MpMs/xb/49RomqQqYh2I3mZuo0C8oXLC7izTLRtVMDfTXqK+4d3p
qBCKpJ33NDq5yRlqnrN5HZov37ZKJokikGx+EzckVTv/GFcnoCSamh8EcJkL9guL
enUJveP2o7+WfUYltYCpdsEvlNReAqx8/oAB8lBdxsx1oSjNeWYIrxM2ej/26/JS
7zfFfL3K5P9sPbF4cpmKFDQ7ykjcBqx9MT887/ld28dvZSGlB2k38K/KFrRduvF0
RwheAMxiV96m4hjGmGp+X+axLxr9i1yJtGBqmsSeyZWvwVL0+DlJ2XXVns89ykh9
yqksEpAkubZW+EsvEdkATSRDkRj+XwIlSBQuKq/Ml3tj0fKEJ+5ROp+zI/wimoDz
Pj2dgpPmLjpbODLLXXsXRo5u2Zj002ZDjEk9KXMy5aAhnLJ23vfUGZFYLBrxemp9
vpJOGK/dH8Hp2nsRcTTUjNbIdu/ZU9s3I+wbq+LNaiA/tzfS3Alil/eH/cqE+3B9
bW7PKYk/os5nrtXAwjnvf9XuHJiXPa3RklmBS3cylc5Bbay5kXEddGK6Rq/5NO8g
XU7f3mA+lPSeE0duom1QteTYHQ+GkNeplnOtWzs5n4pIc6jJV6Rge1iIrklmZtzj
9Mdm23lGJgPuNVF3tHKIppUXg39vdjI3IlLxldCCpqlrE2PF80MdDf3TPcgihc5O
lFmcSsz12JqSXm/OaXFRX+ouX2NN86GQ7dqeofBm4CvIe1cpX69qDN6gRJlSqEXX
kUebM7UwP4ruUy+h0K7MtqCQsFuGJsJ4hngc1YJ4gx2+LGsDG4X5FoNaGaAPFkcO
UvLj4romJ1wiJ/SpVTGsQc+VadLLCQcctj4R/EelSvVgWAzHGEM3hnz0meM8tYyG
AIfDGd6In8eogr2X8XastZdSen6zr+bRdVSCwSKo0vWb7jHr5fTE63fq9c6C7vjn
luUXlkG3B5BLvDCMPnRLOtL781vRtS32mbvnwIsPflC8j4XqrQUNAVEgTokUiH69
SZbEP1FkFhN7/w2Rt8zFF4lV1LD+857GjGFWVFGJ6bD/UnMfanTQSyWAUugaVHCW
l5yy6vOIt/zDqN0UU5UFqGnOB801n+0E9ocg1ndsHzY/WjwZ49FNeExaOSBNg/fz
h/df0vgzExwwqrHfIfcs1dJMGSxkYwEMrnulbwRKhHPpDXplWJ76r6ZN3E9h4beb
0bTx9QH9tb7eMHGDZ9sG+VDmu2YGunvPkqfhkmVBEHz6TDzMiqnSU6T38qARyFDo
NixW9ghd10EQFS3i3dpxUdbAjF0DskOTaWy68CsNV1ui4rcaC6v0iVyC+bct6280
3P48C4P2HR5ZoaooObwkSJt3bLLS7b+uV32Dyn+6PfAjRl+a1M/5NF46ESycrdWt
9DjwSamwNEoJjP9uiZxvaA2o9am23vJGWE6GU7gj3hc3SRyOtv/b2jd+KPVA/ZN2
x0tkYHaBMIvSXmbHVjnZKmXznqrLlW/Dvlsgl9Qk+f/9w95fdvHbRyzkL9Z9psxn
0zar9MnZROuoadD8MWuZkqlJevdFhHXsgC/2XR/QFWcHAURpX2B4oMrhje/zhfbU
eR+zVC2jLO5z7iio8N+MwNxxgcsdOsOdtWnCctyrjEjms2rxIpC6gph9RRUYvGzk
H0ufdJwY7avM4INemJtFcGUCNCB3+9CT6rtdpu+1XheiqFI7ou43DZ3yzXEbJyJH
FEQSOtnUx76C24965kWgID8xxVWN+GRI6adGNdULtW4Plto6eNibocqwZCqRvRgE
zzF7n/Fod6zRJBsKu/pSQx4GAi8AMzJmieURBSqYKxnDgQoqXgw4Vp4KDfBkb+d3
pT68CC3SHXnF37bHSkwmrh5vStkmr2Ote0PQHr+cWc4sJ3/2lPsX8xvtnqV4B7il
zvw7K/EksTa+bRJqGPLNLErRfOZovx3krZrP9jFpl1uaQg53eAzsyuGilA47tMuf
ArSIFFkL3GZiphZCx8Vo1X2UQy34Ot/Ne9seU2V0jONXt/eN5OiL3TIH9wHVizqd
KDwVb61tPFSo5woRO2yInZKtc+Y71XXNoh4ArTdqfeECc5RmPaMqcWp3LaOIQM5c
0oSlK8w/khGt/U9GbC4ypk+t310zVmUovGz7zjeBRBE2TSQm5jfCKSwU3Ut/vXCk
9a2+LqBdn0QtiTAiyzcz+TSKLVDXMrQoWIu/ffDbF57N9LvC25IolIjeQ9vVVafN
oLJKMa0tdDMT2E4mXfVZSeJMnzP2BzwNJAbI96ydzJePqQ3CJBsL1EjjoBCc/r0Z
Hl4I3UpPcyITlS2yVOIi7MQ8dRHacKQl+nHtZEZmUP7CUolqWQAXnTXVPaMGWR21
yP398IgjLywoEXcS6IQiC6pGe5A+CwhmDeAOgE/TKV2M8pzA6iFU5FSmWSB2JU5j
4q7YttWKKKYMzgCZdYoxZMRU9gtzH2EzQsbE+zdnbl5EfcXtL/VdFXIdS+T9R/v0
e5CxRz4A7MtaHp4EoKnhv7m6WqHM9tzSMuSHTPScAGfimCYsSA0xZANTX/f1c6ZV
MwytQ2frH4hmVoMqbTOH32/FtBnWaDbleU2+SF2ZEPudqnFKFkbRP3ek6FJh2X2k
7W6ITNtgOSQYvmYZmB2ADCcNF6ex+zhFTQ89pArELo+8sgan8tl2KmkVKqTLTDpX
5/3btfcTKGBAz0OrCYHI1Fh+bHOnZ1SVcqgj/yoNP4RtQ3ZVqCb8BXQu+2g3zMpX
1l4F9DeFw+AxCK0MrOfIceVjQMVjIUh5Zko4WcgHXy6AFFaE2BNjUobq6PwPtbsp
E87xPN17Lgf3HovqB85ikrwMOCBVkUlSGPsQtetRrmyR51dIgWwuhlYEAxOnQbAm
hHXB9uJWTKEhU0u0MpfBvERxWfoZX2uVH4iF5QrRbHm9B8f66fzZzfYj/CXqT30O
vl4SI1wQzIYTjuEZNU/aa27I36m7j2GRh6xwTU7Xi5krWy6fAOkQNuUku40ONtRL
IMmo8J/zXSGY0crkGvKwDKBNVqLQDehK+JxXKkjSraZWVnmYvGtFYRkuaiPWWVwp
m/Pc8Lg46AdrRYNX6p/0CNjoLl47XLhcNe++7TYXEfJ5Gz6G5WJuJwrQ2IS4qiP5
PkJ/XjB8kajTsZiYQ0I0M4/0NqUJ1J6l7bbRVBxh3OPB7JAIxg+b44vSMJQGJE6a
Nds48lDHGwglL4hkwsjeeXRYlbLHI2PEuyJM935pea9DAGYrWjn4E2SD9XwuFOZH
SrJ0ZQ54e6epJxb1I+cYqnrSS0eIvbXTp0QskXrd3QOAIE4+bexAKleDB9YiG6qq
7PplfDBS4PMu0SvMUJIM46k36B+WPGLIpuDm5gf831eiBbXc4MJY3ik3ruT7gL9M
9EqxZ51fnsR6AXU8WTSZxPexYo87DALE4oYLBYMGfAJ0VUjqz5kpj06+3SiL8mvi
exMTTei0Iz55W54kASD/fFhdWbwpD9XgvEJD0uin++K51igEpWhgPbj85OJzmUwL
vRbmILHTDhrmR7Gz9/zXICZ+zVxegXPLnoNms1GCeyjFjxUcP9m35DzHyC/dbqzY
Eq3aL88AuiifB0fIp+53luzc1RY1dQ4IPDHHihe0tS0eJjMlj9F6qIjlvfaR8VgY
gwBEjA0Z/SFNWV0+a4rNIKIdyWaSpUtQhhNjbxWlWElNoCSzFz3DoUuLwWKNB1O6
oIJJvue+TvFIMbUQF37EezgkpvpTHTl7fk74b2tkbVrQ244SDaHfDdmQ1KL2b9Ky
1AKASZ3MeVZG5/iPgZkxpwb26rVna6m/oK97Hn7XwqpCAZ2xlxpagWcGw+lAVbiF
uV8+V52CPJcyhJBtWRoEm6BECAvJYdCWOsUGShbR3ZrmLXh3W0MRL69BPm3jrSdC
TeC87tF9CYjp+/biv0swj8iAbJjdh3jVkrKBJ2/vYNrkpYHMTK7ID63r3mKU1wJg
rP/Mb9IgoJ3I+1NzuESmHznPHjtZ/JC4UiJqsrkW/p6icEm7mulUexG4TMZFGmW1
oGldTzgBj+8yEDfM0PViwAUo1OacaJYX2kJPw9LtWeuctelDhjgWQQYx04N6z0oi
bvh6yWeqzt6+HAb0j3TINsk4u0QxASgaRFV85aSH0w45vJFVzDMhLaTgwW2f2AoB
54Edk6NQQOW6YH/R9hOGrXP5zrio0eI5HtXUpfHt1LSN6qMtB8Hrf131iI76i3HA
zNbfmFld4jL/qFuwGRC39gq5h7xMia1rB29f7EKsgIRnse4zDCy3dT/uhN8ZCD6r
S5S6hdpK2Qq2QHvh7YRfJATqpFdgzL8NOBFnLLi71Agb4SQnio/pCjMygbSELQq+
8fHqv+5iHEqDbWwXFZ2hcwtG4R0iFU8TFixisGaBn2qr0JOQ2DeMTiSmHOO+L3t9
kAAyhgMJs8nfsszEiK/5/Rnj9F98wNvZjSRyt2vAtqYaf8rO1f6ZLXtpgNHFuZKI
LufzYM1IxMr+WS37V6SIZ5IIOkxFJlGCZfTLolO16AffprksFMThk7yRDGtujoY8
yGcwovLjJmTXJTMvhxO1C6zjIou09wW02/2W8Ye+Pc8Tqz+7Ul2ILRAjKODeoZJO
lXS0HIHnxXzCCu8PITCgM5yfzjwx6xdawMw3dp+3JvUpxGBYVHQsg32QUr20tSn+
qRvl58ITYOYawhC76thRzWpYgdR8mGpP8EAfeA+2JXlC5ResIe163w5nvJ3NIoLx
VOpX8xN1ydyDk0VZ2rxy7Z4z3bchANfOc1+Swk+HS/zwGBVhirUeQykC1ZuXMIR1
zl5APwuOWt9lkkNKYwWIhtQXNATNSpKrEJncwEFIv1tcSBQy7xG5MDpR6Sxgdstr
fu7R7vP3JsuLKT4hxawRZNKMkfZd9KjoMFGvWmZb5uBugWBYtrUpqpE5oAXiyrpU
jva+sLbwmsDMlEc35xVPYSZrIeWs8ua840uZByAi1paXhXJMLCd2byrwb+GbfY0w
1EcF+GzYSsrErqy4PJhSdodMmma7TPEAWJXTpwTa1K6g6Ti51W4fEVNvY2t7YY7a
72KtSQHO2bihKbTErdRoimVTbgN4H+Vpgq4r6xwRUmXAJXHPioQFaSMyCqIvZ3gv
R5/njs5rxfpYXLkT2o2bXESSUZG3N9PiGIUz2E1KbdNVSwZRg07KKob/78QfBaqw
bHQNs27Q8jbqlrJmWbtB4kA+qvJJgd3JaAFufF3tSGpTGHUmZiDllUFcQdp/crqY
g7YfLsW3uVz3cI/iRkQYu3Nc1+PfpTEEApeqAwNlkc1Ok3DdnbVy4cXNhlTEQDEq
cF0feaHGfxzGJI1q72x4lvVVwuqOtAgmx+1MIK9nBQRqmnaC3heuJ+25cRawXa7X
DJYayfegU4BZAmUYUjvw0KhxF/mh6rmJZlI6MeCydmiOhKDZoa4rXaKhtvWb54/f
Rc++LH45ySIVK6/sjv022cggfhib0mtFeU4FPZauwojqjA2kDm0wTj71VIMN7wAO
3rClRXBkMWjMsmYBSl8yVT1icdBdEhwr8mZixFQtsOQ3MDuvoBDlVRwH5tR4Guv6
BfaJmVnIL4JFPljQkwvj6EB73oRqemUwMnW8yu/f+8dK+8wQIZD4rh7gWlTPHYZf
CXxgr6AHhcmo/dDJp39psRmlJ9kGhRv5jU9pyAord9shDyEqG5Goa5P6DnRXUyYw
KRt8Kr5MrxxDrmjwUaO/ekjepcPgMmfk7+i1t8LScqRX1Kg5OmHDitlc9jY80JI7
7cvpzz2QFmgfvbbLTBcd56V+s6Dp6968XImnln2qjyTq5rSz1PqcruEGpkgiEFPI
YruCN/Yu/283W9qIr62jeczw1vYrmZOcSs4Od7TgH8bYdAUSk0KZqwnom4jV8zFT
Yh+vhJs6Zzyj2ev/cdSOlGbDDBzeOMyrh4lyX82oqngRGlD5rOPmhReniIUEjcZG
46B9B4tDFlpmiYe3grjvEP39kkaF7jZzLBE0L4+OpGQlsutl/xWS8fbT2eefQw6w
QzByeXZ/FWELXj53t8ppEhA8+kK1soQeyKBZeQS2oXm/zHNLkTmM8EfnPPmTsFqE
KGy5Yms2zGTf9BmFLsh9HdHvXQyPyT8TjJcqbS3frcC6XchDJkT/HGXQ38juMKnK
HHxWXqJKn0Qg8K7z2gO6UDB2f+RTXsPPwzS2IIFuc5LkMxz8HHZS7s2HhdsLH3d6
txPOukB7tyJr/OprJJAsJJLu7gieTwpNaUIZB3SACeOkIkbNFgeVdNSWQZW7L8p+
eJsvPBp65ufaACnPxK/SpNzi1VvY9SoKXSIV1U+xWPKlWRP2RPdrE4KudeyeHAO1
Dv5aCgZsOehGmiPvPn+lygPFMf4P4lUcXDMOdR+fs6jHPeTXxUEBDuMFWLbAvkqS
5M/KQmCsTLfuDEtIRnyo9epVOIMSmwzZlnEf2Xwahm3adbyAqTgGXfb/JJ+oniMw
gkA/Y4u9EUXaqzVS2vTS1KVtgx/heN6JOfW14zEA1+8o4TM6Hn6Pkw7WDKyD2hNs
OvAU0FMtwF5+V7P3HPl754CVPD1YRwTT0ckZInsDcXQH1GX7miHDyT2pZbKR4pUZ
rWTPBwvV5K3i7COdMDfNfs+G6ReykDYIhS9Rigve6gdTCLXUqKUtUjrqsvB7b4Vi
U18eaWd/H6sJEyDGMGN2JBzqhApSItbRaDD6V3o3eWe2IRbkHjiHbYPY2832wylO
7+N5B7/5t16jAhdMgOncgP/3FAtqpTC6tq32fqYll1y38srmvByGxsFYZJI2FqWS
jqIujXkTGZR0TQgjx49+d+cBeGl8rgn8VVkLO8d8p9JiZNNAlZBLaG37E5NWCtWV
3/Auf+T5CyppIGio/c+jr9WSa/fiVjKFQtCo1dM5UznFosdttRT37zqtfI5kSH7T
6lcRBaGR0adeRcXe4aGzXYPUa08nIQmDAXWIOJw2D1qsSQcTNTkmwaQI86qOHQs7
9axbeMJJ0ayN0sYcuWH93syImQ+bCoB8IkD/0lGmVBQV1JGUI6GFSxWk08MDrCli
zStEy14ssdBLwDq1icvIGMbYrEasM2RXeHUhoU+gH6L2pIvJ/1++9nQzVQUYqVcW
3i5vWZfNmYl9tkFGRV2xuzv2Y7neCkF1gsBs9p6bg0xLwyEve+T/l0L9B9Bd9T0f
EGa9tw/QY1rVe9ZkNbid79Z4U+y/CrvfPp/vQIuFRwF9PaAP+fV66hHS3A6KU5Yh
opVmuVJR4k3Q/k9oPqaskLOl2AKwQ2P5ZTGeBftu21pWjKRmTtVxX6RsvyIg/0BQ
a1ieU69uNHRZ4i7JmMV6MABsXIKX2Tpb0yoI1ru/jQhDcuIdgz/u6hSoB9R14mbm
VNrI6lT5M0hYWjH078NTe8r1C+xUN7IndAERCKcLTp2WFqLbloxGtdjdWYuH50T0
HpLFbC39gMCa2jjZofVE6gsRxIqaxcKwoKqC/fUpP+b6xOj5x8GFabSdDPRqev6u
VAzfeUryBPIiyO2whdQtOr3eZi+Xw2T3xuOX087DmchSBWzXP0tfLAkQioeJT4rQ
jGxKrpuEKmbge3itrfxcaHHNyTo2ExhMQ5yCOHlWxmzsOcr9yXh6BUFpBW8J1gwe
pYuyT8mtWUitMx34euu25fill8mYAcAY9yQqpDfJ377Rbd09ZRvc03Eswp7NFnCA
/IGWDURM71jWU3wz/7gHebiOzbyCeN+1s9YkG+B/ZdMBIvVw7LHpM1cMMrOoFB6q
0pD38ADM0SaiyZg2TgMERifK044v9npyOA98DRXdOtqCaZ6BsA/f6UHhm6gwVgEB
HFpgOXGDOUNwGqbnxjZH2KRytH2227tG4fjxLmZb0Mctcp/D7Ut4sh+SjX4h+HUN
/C50M1Y5DR8ZGtBqBGahA3dMZ/2mifCo3JcNyJE23iOf9/IMQHxvVvU8rmGfQelK
KiwplGq2cHlvP/ePoC3WqJSfLxMlKXCOna765EnJIAZmPNNlkkj9zSz6aAEVN/OD
SuZePQufm1uQwOn8qa4yUpDOeTbFLIqlmQbBXPT1A7IyJ+3jEC4CXq+4s15iLx3j
H+6s9iuerGx2AblOsXBeXMngPmqYivteXUg68lZzCMEGizpJQSeYnsYq4nqlWsgL
qC0V3rXnmzkv8fdYm+uyk3s6cIUbOUEMVaSBYHPtaDCAqUUQLqRDPBQqRSPYZZIX
9SexMx+24SUlDGXmS0hXtrwLYd/R6Tf8dSiCZb6L9dORnEZNizDfptb6Qx2nWui9
6monmmAyEWyAXC9GTpuZ8oGEVqzqeYrgmp98nPlgOmfHKO3SsMUarLIQBoITif5J
H839xZzkIwo+QbLuj8pHxvqaQajo0be5zC3caqd3++HWSJkC0sGGFSjVh/ZAxFPz
UdgbNXceWwte1xvHpd+ZBYxvrmAsveKEKUby/sPFSAPrpGnhqQ0IDEnoFA71OZVX
VAlJlt9q4qS3DIadAca+T0R6xC7fbC8VeW7bCZaXS9BL5gzSIYufZcGh5ryKI6QK
LMloXV5O4BQiN2/SH2y3QFjzIduFEX4/B2PLQ+QHzBZP/13Wl6NJY2ftsL264+vH
OevNNTwoRx++v0k6i4XxyslGM6xfR8VULnEqsD6BuI5z9F8mvkdGh5+BTlqQJCNt
FSDa0EtZbNYCOElKjYtE9ubDnV/b+uJUaYB4C5O36X3aiPr6JieoCFimBImNkLNn
SYakt97QQog30EQWR61FnssiETIfgr+CyRmcjDFxOdKCRA4ecwV63tXSOeVmtKnk
NdK/Im4YOWauia9kT7Y5F6t0qipRbli7594NGSi9C8QfUBsSz8+Tj+606nHDhuev
VMdw4p6ES40t0umcCcG6XV1vlogym4yPKWmeadp1E90It1neFNtlZGCQQeiJNVul
QNye5lVKyYMDRfU/ZZOrz3kBor9QuoBBllAo3eeIsjf5UfwrC2JDiUPBfAytmdRb
NEGH3EKkqqLxyDG2iWTXWHrrtdj0dwT6jm60LXt33+Aj+i/t7BzFDGGe+X9lFrGt
8LpXZn5DorV4kmEwQmq/DltbfglMMWd24mIbdrROrDaYwKSh6ieyGvxLHI/Fj3qT
l9BNWKNGWPj6qKlzQzkRQ8kZWOIoY1w48Jo+kW6S0tC2hdoBQi6ebXxNw5m3UdsF
POIuiQarxQZoqaUGovursctq6Ek0EPNyjPJ9HIx2dyLPbCIJc7MznhKf5R54Rp6F
/O/g1f7lpsjIuouZBmnSj9OCwpINXXfnQrp9TcouwurWPBChyMck8V1am6H0cEIJ
C71QCHdQoah5kFX8vDrY0/SI//ivct6ijOQ7wc9TZ0RIJEl5GnViQPQjyxgA1ZKl
Qwnva0dS9rLUcgyzZ5XrqEPOAYbgbj4P9SuzU7223ga/paxdoCnlGe0zcIiHlVVT
bv+gj1Nb1JUMN26mM9J0b2tGytUGNIGZVF1YfGOT39/e8170ZhFa/MTe3WGHZkXu
Z0uyNsdwZ1ptZHL3Q7fpyAvmaVQj1Y6R7Z8hrb1Eqz+uUSaFwEpNiZlckIBv9uJ6
IZ6dPtMZ4d5VmBDK1w9+TreoKfcjMiJNtTczG3vtoFr4O8grxfkY49bFf7McrlBr
yPMtoDOBJpdFNsTJURNjR043BbKem6p8AwOgxcujxNzLcNekCZNxq7t6RtA1va8k
Rkjko1Jm5ixqRFyODDHAfwvECQ5HlOMI9CmlZeJ3d9LuVtc2eFbKeRNPcBPmUe63
Dpedc8Mp77aituteYEaYeCmgui44kjrZNjXubpEx2hn5r3bREyC8ouPnHjlsdgor
voFIe4KDTSWmuNq5bjnhzCUY5rMtw0jy/is+DFgB+1wVToFPtfSXed7DbAamkuzr
zEE/CxkyHGHSE+iS2QwbXpog78xkDkNXrqlbAZHK0ywy6CNrrnVKK2BhJDMeXoeK
F+TujMdq6p9Pv3PV0mHMPzrW5C3zk8f+EWlz8kP5+i46VyJ0eGA/i7Rw8eWvD1K7
ySKPOFgkKe6SV3hBJVuyevFB8492Grsl6N4/Sm34T5L5Z0SncK1fYqMyoPPw1iiJ
5lVjL34cf2r6KoQI4TZtGKtMYvevNfp5NCWqXjW4ZvAx821J3W1kLoOhK0fISapf
JzNY5sRVekgYAB6JQijGGJSIOUEzUqzGhku+JNrk+qI/pYk5Aq1A5mi4QoFDFKKN
tE4zuQVcYrwJPLBl+duVNy2dfsOrJyt5TnAGIZ6J+MRiXFY9iXwGkWkG+1ba3WRc
mXNG8uXDyf6/hI2JFLw2OCTOby2367CyzG2S4/dXeX+MDha4SPhfIRNGZUz/+W9O
hSM5Rk1YcODKA9reKCAMVCyGg2ouTmTLFrg8ZpNRr2RKBdAC38EAMx7+zYQAEhYO
5xUgbsjeqM4ETpmqOH3AALO4JsTeFYyehD5XEMi3Nor/M3NPiBSvpK34UC6H5r5n
hnKsP8vI32vF1cHHhxevg/7k17bZGRF8mc2VXraFsqnGbEZTzv7HS4Aj29UpG+04
kM9hVpyO15VfglnhQU/Xsu11dho0sZ+x+sSgRFU4dk4h6ywlspzvFTpcQ3aiBFBG
3YUg+Ed7jK36KmUMzThz/cxjFSZMxPTrTzyXmlDpQDjTHLGDqVK/wk3G3irU5EU+
OOARONNmmqm21f6lzrg/T2XDAiLZ0LYieMYZmTwnCbWxyqSeTmxiwS/FzQBHV8Kk
7IQpF09YglTnD0+INokjgFR8ADAmvj3IEdWD+oqyY1jZdLmr6sRTAhbL5jC6J4Wl
zR8atydMz8m01Rd6BH/PVF30SCvG+2c3Hr+MRK9IC/QwBsl6tm4brgChII/dXHbS
shTiupbmPgRddCAT071OkFap/6crPGPZolwTPkAzxjeyeT9mO6t9eGD3u5YOVKRs
SgOhWrEPz2g0EZkv7mlOduKfLPKNE6PhFxEJwtSSQua5CPAhF4BO4aPVOKX/0YgP
gSqLs62Hjj1lpCgsBKlY0eeLy/KWjRPa8T+gHyk1w13fhVwDR/IpPva7/3xvnmTQ
mqbSmn8Pe+3WLosn27o62hqRZhsHNxM2Ii3dwGtjvy1+sBhBw24AHoNWGr3xKfF5
EolhasZQPgqCxfuq3lnfTGEL/LXQd9z0MTcsyxeKbFGLaMloNrZQZ427zxhgnx2B
4ckXHHtnl2hAvztGynoqRpubNdIBghWXNqYWyWG4q+Qmlg+lUsbsqT0c1VQGB4tL
0/x+pAq43YZ0UcuFMAK7+TCtFxMKK9y+roPtXldk1AE8YgGNcQWAJqviPZEgbHg5
/4kYO2wm6tCTuMG+mLWU0JmRq9FDx94yNrOSPUWLmNkWulamTHrVQkJbWmXAAYz0
0nhNoxav/NqfejbDIIjNDQAaf8jUrvm/AIuOBjQVHlB+Q+7I+c5ce/L9y5hYrBWc
zh9oiGPOgyRXMcoIJYPjltHnnWeDWnU932SllyEoAzNnlYx+Rx62+0B2fAIzwchf
M/NYK31U+Mg3/XLvZUNgVrotNuNasS0kbCdIWqYWJsCMxMtF58bOJHHG/n5aNldH
ox0FXKBC/EJg5MZpC0QrA8xtVGAtYutvadVOZXpZ8Pfey8EfeQbpegRTb3fTH5Cm
GRNmCW0PpfnKHI7YloKtY4vrm90WhkAeMR7vHpD9VUQvXQ3UU0GEIopOeOY1+Tdk
kr4mW1rPOU+kuPV/QrY4SvklCXoG+Z1KOrR4q/ReXMS4Fp+l2CJ64qapoF1laxaP
I3zF/FbmSuvzuOs7cO56WfsZf8uPaT66yQ2yn9bdfQms+UY73uB5s9TOoEe1kv0J
PuYeNLjrcfl0kxV+iGOpsOLV90jHYw5gl6VePW3ugL9KweR3V3k39GqtO5jSrWr4
o7j3uJOIlyxYzvXAs+uxhIySmWRA1UkMuYzKXdaJAIdxtDGM4qfjkaQ6aQE9w7u6
r3dPKFAi2W3oxuHZv6wIFLbB/3MN/OlKm5UYNrpu/M+5yZ2vmMeMucidzu7y4Kv/
ahOUExq8w5z1B0y8RoKH0VaC9BwCyFgIEcJWH/OU+E3UncrjKi5QHkZi3zpOUCR6
im0nZaIPDg0oHHGgv9JlaWRgqrZEjzJOowRxA5pVaoBIritj0R4jPLHbb80Ci0Yv
3ZNx7vwfElwqEVgoC9PTvw5vN6AmiYz3zkAqeKLm4vF+y/6CnqU+mCadC9v7S2L6
UtiIl2cwwDDVwHV3Fuyyd+q16vJIjbeHpgcvfT8bKToEzNv8Ny0HflBrIKDfI14O
PjQuB22pj5D3CjV/PohujpwXT137RHAr6s1nW08FOsgHBwXAARJedC/QhNioeDq2
KnnRZtfCmNi18JgIAHuOZjafkht8ooNcXlh0Z5nibAbSlKLmSyjDU0zwVhnGshHK
Nt5+XdJ/mvTs+/SKhaMdWIzzLqF63Apb19zI7+HqTxic0kfyyJR2QaJMJyTecJSY
b6JjlK0D0njCQkSBh7xKiANSih+ZVwMJXqJM2mOkg7J9tMgOyVhWxJ68QSiQ5/oU
HV9AJZw4cU2fz3JmQpcxyQgPuAaTGQ8BN2MvxgT3My0l7WykvYsWgNlcIqVcv+/Q
shUM73TL9/3nJ6uUeFBxDbCSMn37d4kS2aU1VHY8cTJT3rfjTXIU/t3tQ0pnUiVA
Exjztr0xuspYLqAnsWGLXQPd/w5aULNOcrQf2kgON0xU9tdhmqpaQBr+geWIf7cv
DJ4ItD2D0HKrF4s5wUeOWVBN82vzFJ0VhimayP+Rjbt1HuwGRNHvgeBaH3yuCT+S
7tTIjeKMRudTC/sus9He+NKyultGjLY+meqTCnAcxL8u6vhKVXDhn2Fp8NbIemnb
ttlJaMYH3sMLHg6avAuIyG7aJ/9qgswwI3rJdfOOncIOjFw2a6XdDn7aDoGnlJSS
c8+6RDWLv/Te/8sb0S8LwiL+z5cjAVhYVBGtKZtgBOwIrOTFZz4C9rHYEI3RP/Mn
HAev/3rTzyVAf7YKPvqcNAZzbtbD7t2xzz4RYsohO59f77L7w4Bg2WUWZDpkoyKi
MgO7RX4qg2m3kkIezQ5tG35MD5xulWyLkddwuUUY0o4HVHaci2kd1upLI0HDKUaG
iSrB1GBbp+VixN+5bsW/aXQTBspY2CGDFE4vM5/W2VfiHiPRU3rszLrY+xHlhjiX
jBnLel231VV0QRHsGFUevsnRjvUwPNGuG51TJNiSkpWhOA9TmdBIUM8RjDXpV8yE
6uRLSZP3JsL0C6lhX9YpUnOzO8UsDT7kE5shomDqWir0tVLhKe+/qR3EopE4Lfdp
ZlDwRmO3W78g0vJoZEUipjb50wEnuXYrmTjSWfz1bcvBr+zqdxbKjdzPWsTXiUKK
3cAI2q1KetXDn99Wr5HpQurinvlXz4swVQxVR0BHS/vtJHwvQNc54cZjq5j5HROu
PLpHV7ZqJp4svd35a+NWlySGO/wSQT0sVvpSEtblRZb+vgIHOtUgCQOids2y3G0o
yad2GPIdTinD6RFG1R+JvqFnDB5DuF3u1y2guoPgZbkrXYFcOanTDhcLX8TzgBwg
AaOp4hOTiIhs7YEMotMsEiFr/dTW0Lj6QV/qREZc+5eLDjQFF33V1yb5fLRYnBZc
DTJNkvf6CpB2LP0rWHE10gwtvKqvUw6ApJZtdpFKhvXJG0zHWZekBYwPs8amsFnn
k/HeC/iIcj+4huhdwVrb+PLEnUZqbaHZ88AghrdE8XwIZX31i/LA2Nqgj3FVNT+d
XB2A2qcQ2sI13AuO7ltSlUC4/RUBrPMmT0DFuYSYDA2FW5dVPgQAZlL0lBb07Q2u
UZviNBusCvQHrw3bEhF8Zy7e985EkB874o7zYYoimDpb+JOF62hJ8jq6H7A1eM56
zB10xRkERL+sZJwaCJkIDlaZHiv46YXqcNmb1iSCtvxB2G9H1Pdl41zo+61AX2bI
EFCpxO8M2Bbb7Ws8/sIjcu96umPBCFvWRIVQ1lR5ucZhaNynaomXBe4R0VMhoD6f
pku5P6XUwmkT/IwglJLNwEchAsBPWLaM+oA2PrbVNbAFspaEd8RTXelYgAxn7v9V
KzmkyXTKo67QOBbxDup0lJehlj5zRCDi8b/gjf0SFhwNYqBp7bPADU+bQOiMSYOh
p94tzeNvMjTJh2ziSLELOnRDwtSqbtam/8TL+wEEyK73A7DNr4aJzMbvz89crQyW
L5lCBfIRN3T43VkNxwPWefHtb4jm0V4PKounm2KEFiHssI6emqLa3q00we1ZFlTc
ywEogC4cLZ9z0Wv6oh8LK3nAp/u+ya4UfW3GZrcxPhYhE+3GWH9wY9QxpR4gpy2D
xzYBJ+5bNABgzy4vMuiOog3QUsgVCuR9wB6wUJ0XKBL2gdoFLPULaTFC7YoZ4H8f
KAeb91aAurpc1YMmnt0anW1DvGDkuwi25ED+fgFAC32Q5VLZ7kSst28fYDGtDRme
IOZewbrv6d4KmpxPuIAfObr7Qz8Aq0w4J9+Yu7jY5GyYK67cvXiq3oSmR/mcOUlB
ccxNBEIslPkgNXvGSunVFQed+N2tWlT52dfgo3H6EsSl3C7j33cm4tcnZU4DKMsw
amMLgbgSisfEjOeiX6x00f7Zn8pEXPV1m8QvQ994JcLaIiFORune+d1qZJ3mtoks
iAtVHgIeJ5RruR+b9qUgqfppGMry/4iMZXLWHMNEzV5+IsKaQ4MzGJEE/5aH+byO
TE+0O/Uj7vyCE3iTYfeQwNqPwbuOlE6uvMHaxTuB/0o2riifO1EI626YQFFhew8y
qUaS43ybJnYfZx4/RmDWhFa9qLC55OHpEvymtKz+8AK/zbY0xyECDlGiBrSOYWEt
hxgylNdlKwrFIDYRUG51Nmfndx/erGcb9YI1k799DUCBLiQvVXN+dgxRlV2pEpf0
/qufc43aDOUms+HRoqeUgJijlbL4ZTGbp7RM8DBWHfo/XdpFpPAte7/jJBmJaQRG
YuCk+3gy7vWpnkLdqu2OIhpWYfQO+bsjwAHPiizdL8DofK0y9XgN0qqGktdueNTR
+nfdI2xG0g6ewAgtRFQRajbH8WXmLG69lS8gVZInRnhWe5z1/w0CJqh/p2+u7NHO
q5V3q7KA2bU3/sAcvZVQ0F6Boy2YhfryI60ZQ1w26ICW7w+UvCGHgdcg+w7vsCPO
CKLYI0A11pmxMpxEeGOzebGPyiolYEc+2LccwAxaqzNOKIM/u9E7zVBPm4Gwgc8u
joMeXExs2r5W5shsrZwWFJlnjHhdTyrFFjDcFmtzYJ/KhsAUGK27AvSEYXWmWHNT
9gaMGM2nwMdOYL7rL4VsODWXdhSE0ew7lIaxoNrrIk7XJEllI9+w/ZKhLhP+I0og
6IR211A2AzioL6JHAQH8jNriZI5kQLrXsYN08LOt2vZZYirSDAmrvl9BrvIR0SAl
qaBsHr/JSHPEv8fip6JHpat+DL44SHqULBnrn4i/a6UsXfCcQxYJjyCa1+RoSvIp
nhwIUKceGrdtIunzFBPzECr06S4oqqImsrwv1LJF6q4pnSIjm6o2BKVVsgRpW5+f
6RBQKYgmq1NohM17CgxSVGmh51HtWRrudmS7t+S6p53lV6zvzs1mY4lGGplwF+bL
Ao95CrO67IEXslYpAlvfjtkD5Y8DVWEGfOTouG9cdQ6+HzOABoVOm92IVEsahJ64
817s52oHX+eqfOtJgTYhCUTJWczQppMoLdtmmIs7EjEsSBmV2s+7sTs/9yu1fqBN
IFcQ8d6mXyhWoW1HlVpXncYbZ8wRP5xacZhdCbksdHrv3xZvNZYbbtSn1fIXV7KO
kYwliKR60kpUMliI5KYSkC9zFtA/sW3uaC59SAN+XnJCr3ailufBDRQZ6Fq/rUEj
LlSP2OaAK/WnUG4VI5EImkQEmRuNV7qQEoA7KACAmcb4CGme/H2jIFFdKqeFwNnD
srcqK674vPE3/KavKP6BAMUcU2IbxqRgD5bdQsJSSdr0bildWrHJwnp6b+J0fhHZ
EtzelxR8DYdcmqEVoRw2S0tPSOxUgO7KAxwz2Gj2UjKatjcOcx2YbVo+lZe/0vD0
pCl0soU8zADNeAtlzfQF/sGfLHsw7Mz53x8F7w1XGOyYeuFI1C/mTeJsP6V79qkj
9FAXoVpxUfrHAIQl0XbYtYO+cuE5CTH1Kshbxj48y8K4Tsi6uv2vr52XO3/MZ+Kg
LrCXvjtll1R07elCO+hPIDQmHfKUHT7n5uJI9lc98Nt4qvPaWYDsmbgPFJtIcxG8
ILt11PZuOfurKxwD1xFZAKgewppwvH4zlkjUtLDRnIrsmpinAUzMmfMMPkiLr4G7
Y2sGs+L9LWLAZjHLyUmjmVTBjlvs3kgScTGc4RQOboh1YHR3gPwwco/msXisvKhF
N8fb8vCIJ+6fYhV582MN/AAEqyvio8kyYikc3fNTyzdG+zghHHz+9KgpJIOOK78B
6m/Blq2wTD0WRUJay6oDNf2ESUV0mD97AhspckbrspEdGahY69yG6a//YvnjXa+V
+ArQqVbDpjzyg2gB6qfJewCcOcHeERwzPC6PUkU/DBROyrrSbDBAAO4F9BFzTjvO
VWPTOMlmKAMtJmwszB8r0OZhuhsp1JOerbBZfm5okA9TmE5z9Wnw/a8pcgjVfyfA
/Yc1+3xXElCV0JQj7OzaSIdeOHURgTRdZTxKmcVmPVfua0mN+4kL/+bALi7L4ZQn
Il2GTI05BQMMT0mTkHYEfKgp0IwE8EbhNZCmbDWHfoM8z1vunkZRosgDDd1X81n9
1igH2IVUGLRTgEbhXXKo8ICaLDMhRdeT4YrgQPVl1cBsbndyjVXl25qVbjHB/Hcg
2K/zIwtm6dKV05Dhp87I4oe4yNHUB5qGbzkRJjAM/JpnUGOnbphh7uuuzgITa1jy
UKbBQbsfJ7xYAF7jEIkA+nqByKnhKhOvYn8+gHiTOMEF/+I+tRreKAeAKRfmD0jB
+k/RNI8Yq4y7hqpfUX36SsTh3ghEdgpcGpH24sErusjGNtNiUW9+/j5+T0LEeP17
Ktq0GiW6oHqtCa3Fgh0cXP6S/8sftXaXxuX2kfdolFxjcIMShCKCx0ki+E/vNnzR
PCNjq7QEItysxNRq0WaR6nbI+i1uC6oT4KMQ4mfKNYyOJuLevLCU97kp2nq/4E6m
b5I50wWWOMWfWDo560akLrV73Gu6qznSbhxd5LZ0d/nRfVAq+kSpNNDGOBiuNswn
YXtQmZJcDOitbNPfJFXXyJyXo+GEgAA9Ufowumdrpedu9l2G9O3nDRmlejSJgwGa
k9FzllXc0yeCy+CoqwwHM2EK0Isv06PJrg1hG8JPJ/aQ/bp1Doz8EHIV2SxY20Z9
7ICsOkIitD47TSGajOa1fJP3+GuYf2IUx7SlnA4toLLPHOzzhzYoCGF/DWjdN45X
wLuxvh8nGzxLmyQLh+QprCXdT6gs728xaGawTOopdk3NcOrrzs3VKBcpyQzsD1Zw
izrTDkYhjcTruZ38Dq6sAUtAsnbpH+8Jasa8f2hYNUaFLOa9L2MBLEaoiPPRP0uC
6KsbCgdtLJS+XrRMrTr1qDU1fer+ROTp+5lYj/8ib+J1vDA28j8UoOhj+Cl0gBaB
qUX88uxAgt1czLadNWvHsQfZ2a/Wr11dBBokM3acuLbJy9zgEgv+pzlCKA5D0sJO
dvskSLocyWqnldMLYg0WghbU+wQ7Vz+gfW06xbCpdhd+lrhz2iFlWidPZ9k38yMU
D7yr7QuM9eZVeNdJ4jfFbiN/LKv3S9+pV59ab6RjRbjYovo8hhLIHYU3X3LlScfy
OffqtlTid84vDcN6AWTy+rD167jyPrhpupjkvF5E+UYLFoeaVhy9rUDCogN76ULr
634BveSsFC2iQH9dEXL+S3M0VfmB/3e4xYMQDizhciScytBxeRdubkGi/PjqqqCW
+l9+X/vsLKA63MGQKgnYm957F0D8Est2PeDeAQpsKSc10uFXHx+1B+TTidoPyE1F
FXpM9qF3YjGTnXdanNAQJpM/nu8ZtMphKJyk0vwmVBQrxP9RfNoIODQg+1YXWlAw
h+R7lUhjkXaKzjYeb86AD+dez2GSLroLiNleDHHMLu2GaVIw9qKZZ5fsMKn5rBVO
Kx/jJg5XRmxBjxFw6n6KMYnK+2k0kBmfKP3TvzzefCchdVtYYXeqWd665KqApvej
ifDE/+aY0r1kFEMVou0VNgDUYiWQ0ZCk+A46LZ1Z9f5yXrFnlJdDLunHrw9i26ap
c1BTVGQBcFcLCGyDhwebShe87Y+PGayScZ2KdvCtllyDwdvl/+JV3VuwzwZN3XQM
VVPe8jtQPHRffdZ80MBUqenDnHuK/MM6b/gh5ClNjOb9gLT0gEHuONvDLfonJ1i5
3pps5y7ndfDbmPbgHdxs/qR59DFQWQhUtRLVenX3QyemiHmefnZW8MurIz9zguql
2UNpIi3wcRgaR3pDABLnzmJih6DOqqpAr1iTc8tWTxvz8+xGoNXlD89dfFOhEzaz
1FgY2ktjrzP1DgDSvfEz+W/CWRh/D22tnej66rMGfjAghOs6wJjhjAoWeD2GYMit
94U/cWI71FEcLrHaKMidgrLdjiY0Mo7uTM0GRHgOqY/veWYZyqqgdki8dXyk0114
+Lju1w9rmpxMbjNuh3CHd7YbEgt1b8RJAmYsS9M8YKx23JE/ZVgk4pOJYaGKri4X
IJcBKknIXHZsSjt5+Eu6s+XnPlmNGAzttFDBT8GbuCflbtE9efqBeGMBFDPGWZ0H
KWRGGNor4Eyyew77BRt7JN3xg8RC7zl+gfjcS+VFZgUnFV5oIf9Uuw81vDfvh+PU
0AAui6XakZJ74TLGjkgDgeTtQf8MxO7CxHLXjpFUDCh3Ot1kLi7TvCArOMmYkQ5K
ckFLqICI3qeqKkIdkDoywhTIZ9OYiO3jMEcFYXowcUz6xlH+HzT1AgKIvf0XQzvB
ollhbJc7u2Wf796434DmstWZd3Q0luu4kWZ7plaZLUcgZ9otJDDPfUsx8RfBlvgT
N+fktVMpmFaig+zJ4rbT2K/AowNhRRy8VmlMskHqoxmrxAbrklawnvopaIgFZrn9
sPmO6uxi1I7FPrPZEECUAS9KmOZjIxKdnMsH4EtI/vlwdrJUIC6d/uiGVvSan0Va
veaNa+Hbfva0G8iOT3yjNRKHjeDwQq+ZmE5zjtlbLvv/N+iKE8A2yu0pT5U/0x7g
Q0hgFJjt/ytTiYOhgzduqMXFF7fYLl9CXhAVOaCZ/2ORWxby/Qq8vqL6kWtciaCF
IM9OkrKJII0V/MtSUYtyTn1YMdeEQvbK0P7Z6zDXuk8b0GU5jQzLs7ZpsAlq+4Vo
t66SBowKz4TvqglRIh0v0bAq8g3ZXxsIxXwvgxWT12ajpIVnFDVjybj454qIg9op
QLxE2G2x7jj5kNKBS+p0Nz9IMNxVTCL5BmYkx59JNDnPvLwS3YKUUTP3aEItZc4O
aF5v5xaI8KqdiOTZt7dUlIK6fSbLa4q3DiYSeEdgH9AbHWeTDT45MZMoK50Tgy++
a1cr5BxxlwF0u4CMtVsGNH0Ke/+KNHV4ciK5DcZ2/w9ne8p0xXeb4gLKiZn1fn1B
xOnf9350FXvJNOQTQwoxBDG7CvDSRHk8wOVmiFwvCion643zJ3By6GV3t3mkq4Qe
AvVjFjehxQuWaoMK+u4cw8ZNUDH/sg6Eg78mridy4014tcGnR1Asm0S8kUmvpp4M
BEZDjvaXAXqLje0wr79uzfgIJPvMWgEo5+3kBRhg5ckOEvNiXfK8k5SdMfAEp08C
BNGHDulnsr1ei+JT6MB2mfssRfD/o4h3XLzUKv4lDvaRfvjJBRr/j4vkGiMdVtNS
yNuzvmj9D+tKBnaXt2xpVTDy5Dit/BEj5kDEvIfxNXLi41BBIV96t/EZk3iG+jD8
dHc0SKRo2VzQBheDQTUJoRzYBqSMHDRfnjvTDrNiWw2VFV5XV1aIQF6OIXdw/XJB
3kwDRWuDXoMb+v34I9a2pEy+yqVdt8Ojba243ianimb2LYHk0W716QztNefAT+MC
Px9wrJMxPVtf6hnGvE1h4+++AbcrT1iiaAN99QDXMXoOFXfNt1IsXMDxdSOI6t7y
bZ3EXl4UY4qiNnhappqj7uGm3nDzFE5OMLtxI0sV3TQiahhHa2T0Q1VYH6v9le6I
dA+fS42nT3Cj7aljCO+OIRdEOgCc8BD7PRPj45+5ILr4CG3I4ouJeTsgPmCfWIKy
MtdxDxFRlfNyMdO/C6LmfI2pA1UfPzY0iadzxa2H2WgbaztcNV6n6Mk1t4qFO2CF
hjk1YNUuT0zS+I1K/uuEsW/3iThzP9yWiXUAcTGp7dyB4RJjWHBd5/i2JxDd/KU3
+E5E3sgoAZid6WU1QzFyh5T8atd/xZxB66luYbFfqx2iPWxhlgWXRiKpoe8y+eM3
aha9HSQ708J93nVXt09dUszMCQj9a0kzdCvswQleXb3346MNGBWO9jMVFCU/pUmi
oxVOb85rk6VSeA6fNCzE8YQ9MRoFwwR8BZsd2Hg84N08b+z0jf8VS+Ru19SFAvMx
hIK/cu4YlipwXxc1RW4M2Fyfd5o404mqgvfddJVxe8ucbabdS++yZzHGBmGM+sdj
/Y/wdmT8LwH+5jA3pl7rHUvr5A//JEW/ejCFVHr2Dt9jmvtF1ko1D24EbCYdwvlv
XFGik91nmAoYx+jF1nbPQKstmKUcbfDf77G8lrP1u9QFQMWCAg2NQxj+abEEL+od
OQ1QNrW9iVnZFhL1ikRFnedCJAPRlY660jFx1YXnfXp6C5FoZ8Avs24SfY6ibre/
AChs2GPh7i4t23f3VEd/GLcrkkSLfYDwym5ONkHbt90lhca0FsZ+wz9C6N3kGb7F
8kzvq18mshrq62GZqS43KYwsXvDbhlq6RuYWp0jXJsqh3AKNh8tR8S6dIGTzn1Uj
dIstELOHe9IYImfvTWdENyHYFeDwFCW6TgP3uXHHT6a8v/C7kUXDGV2Zjj15V6kV
6S415oSd5UapG4VwCmH4xCkTAEZCTRDudUr1JrZ26t1CVfNE2Xm7mGFDT2ffDNLH
B4zKuK2qt4vESna0Th6BijlXRAVMT0j0H3c7KHP4bw4Mky9SUpSbX0IXophmhPK1
C2dXn9ll85WfAAUqdLBSHf8wXY3xqsL5oLi6Hx7y5w3uDdjLPWxBYIvJIp24iIE7
aty8Q5AXg/yOTVViVGp4nC5udljhti6D97SCMRyya6y7NilaQns2qNSxnMuTB2mq
yGpe3cq9SO2prgQVHzFiHQrY5btUXPDjzW4U2wh3oaNJm6p495BP4AhBJ3cXA2AO
lJVzypvojV8O7AARkEFKLltXArXOdIUVa1aUXIvYTwMwAbb24n+WK5BCbUb2CP7l
9M7uQEGeagNhhInHCdRJaSAnOsBHkiSOiIahFFtvnBOkTskQYF57ma4X+ChDNbVF
gx2F7M1LCdP2w+w0kfola7xOMpFeSOxvay8RoPXkNqClC5oEeZCyNPzotyppQxxi
695AQJ+PI4UcM8YWcbd5QpzFlhuhGmFUSwelXotLUu3i/9A4vg2u4frmbfK5TmYr
nR2P5g7Fy53+tr8yc6e4U4Xy3WLWUvAI3ndX2sOubWZ2gxFbEBeuxLsB3fJEg6xv
e2+rMP2Phs3Y/kVwz25v0NXbGpanAJgojemJXGvWxzMGNllHy6AXDGJeYt/UTQ2b
9ZyhK4V0YlGFEA88oGZy7M2lHUyg8EpXmyzgj4hLmT9p/RfcAQkhIL1MScNVJNcP
9CKeOqT4suLV2wUVFe5GncBAh+1K6m33PatJb6JDu9M3DgqqkYn5GODBLhSCB9qg
m8MF4tyW+7w6/OmwPgLIBS+mTzBvRlY4l6XYPyjDvRkCYFPwPEopFN4h+4uDygMg
0ut5xMJKCXOXhuvoUl6GveoxGCl3DYe21xjmOqxnIKAPZ6dNSWuYE/FEXLgLQnSt
j3rZp6wX/tuU0udzomtYPft0VWC464O493dk6DNxd7jzFN8fhA2VEGBHetkMkolL
j7F7jLqq/4p/5fwR0OSI28Qzu/tlpW3OuKRgBLe4Hdg9RWzbjcdizsizxS1em47K
WGCokIWl5T+JvLC8WTXZoK9KQclaGCqPvSPRde5akRPa0i6kqeEHNr4Dp0mmrUvc
2a3SlAFWecK9SqZ/MKj/HBTYbIvwuz1hulymciAuEPIu5cU0UQs7GWgJgKzihqAw
eWTbYhIeFRD1dovOsaoUx0xQE3hdEF5yPHOXLOJbEof/i0cvMGSvsGBE/nsU1A/e
W2lwi4XhXm21FpNlm+D4ZhFAZjRm4aulPM9o+hmzrJZoHLSMBBe1Sm5cMDj4Dup0
XsG3aZ80MlzsydOftmyFYYNMBujRZwvzZ43TGgJIGL2GILtjLjJxbXVV/6SAnMfZ
RDbmYv4pxUVOKeN1tvsrGHWyB6tFli/RW0Z8bBZBvPYLSW3mbYGGyooWeipcO6Vp
JTx0GNjSg1wIvgTs6hR4xp8G4JCooFLOt3mRrSRxz1Ry9FDaVtwc/IcHCD1x49o1
rWmtmpjY0R99Ydh2oVEHwXQ5m9kqYavMrRH1U5IrOtK8BbpS4zztuyS7ZxUc632s
E11M2qwfhlZm95W0ozhDkJ6aXN83a+oEFeT7if+8x4Ua00l5NQUJp6GVceZGKylk
xfAenbvlSq0P4aZZibQAgu7uP3D57vH1RViRrF/Jw063CxmOeFCSAO4bk1nZQjou
KxOpJDKAfzLLNZDOtLTxtAj2RPzTXprjVkGKODUaxqRtHLXhqCFtZnySSpbQwSti
b0j8m3VqonG0vbTtEMumd9ZTnM0TZ0o0PIzuEjKL2+sRICYRWM/82pDpwDrJ1RqD
D8G0ikRmaeDJhCiPZ/wuDfOYw+k4soiYFCf969wKDw1t+aRArwjdPGB4y6r1BU7J
WSKHR3NSgkqFJ4bCBlg5rG3UZ1GWumM905HOCIh9o/pCPgkEGSqu2Y8LVS0rcPdD
96HxknrZ/pL88rUWXYutup7MlJ+xB7RPpvHJUl2yiiYEaGg4KV2oh0fXS8cbCBCU
TCLiIRhSqGUBPrVmc9dGv5mkG17Cw3MSgKKXBAdxrKJH1JW4og7YOtwzJk6IOPOn
Pvohu4eT1JU9TIY0jyQ8Ou0pmPoqJlRVYvw8th3cC9xLE1sCaWCtCU8AazgeN+FL
SV/IX8wDn7y3drXfE0hApnOBHQo3W1/0yyNR0HrYVSAVNZHHzNc014I/5FB7so2G
u/KjTheaqfNpMN87zxFoHhHU+oMf/wi0riMbm4VMOJ46Vvtk6cbg7y2747GbEU87
b7dKMjmAfhVqWL9y35KA5Tj1IBEG/JgG0tsE0wcmqG4viH6YkDslZRsjhvqhRE9h
1RBWR3KTKWXHvUxMA+CVAQb4TZFT+TjhhLL9t4RoPGc3Zb6UoVma6n/e0ja7n0na
VblhPpRUwXUXSPvoS6DhVwniaD2HJzCa/MyjqZWYfk4j1WHWui/WH9ZcaxkdSGd5
0Rt5ve7HK0PLampZZtRPePrFdc37Rf5+D+SoWheoW0xtC2HpReguRBi7+pCfKqgw
T8G5KNtV6zZYgJAyRl37Yb39FVfQ6yLjPD4c3iU3I6utmLGsZVnevDkaKm8Rrs5T
jaK3LycbzjghD1rLh6aPhH5NqXzlPOHMQXYzHEaBLOvUTcBha1DcoBDD3TB8dnjH
7BdKmASRI62vVOlOgAtEKiKV3VujyCDZ1QGFt5KGh+BIefUVcFD6xwkGdm48dNR+
Q0tvxS9trEJ4FbesQ2W1vZCYWjZKWGOzwimnHCzcOMMWoBV3lUVbSKfCHGyRrdET
LHNn1cyYNVLvoFoMD2QlzcvP4+ddpchTFXywI3LsNwN3lMdAlSZjRRSOaY/QkVsb
XyEjK8FTyCLWTpRyULqqum5Ppe8OoBYDS/4QU6+lPNUXGotkMWvkp9qk7PKbjzpL
+jkSrTmHBaSrjYO05Pvq263l8tVIio5ObfKq9ULB9pxrMAwkQ0K8uCRLx5qqfzWV
nOlOvrzOjJ9VFNhUxoLv8ZL/TChgW2XNI8aTrynAfxr4Ru7NpR7CWzdfg+IItnX3
2Pab76Nw8U1ya5ynXYczpAXMEXo2U/DFwSVryJRscFp+3H+Ird24R1pUPMYAlbti
AV+jzNUlmxB0+dHwZyVWv5M0TOhFxWunyVw1KV5R4bm+t6vCSslycNUykbBV7R6D
HR9d7QhzwufQ4ug3Nz0mTm96iGfSR5aMcbsFrR4XOfPkwvIV1P2Z/qfnewh2I3Iz
YkMOsJKbIKYlFi7P5i/pBGyLyiULLbTru9MBrlKllL3M39dzucjo0fwCY9CCXTyI
f4y1cXOgt1dJPkijM8N0fi9wm4oSLmC8XswfkS7kg9acqkU6tlRVVWbw1c2PFODV
toRZfs15JYME/JHe6oOGu00vNTp/LZS7iSRnPrgeEwTEyTBe4erxOCCBpjWv6hQb
pa3zXA4NyPK+ujUkSIXt7r0Yz8ghXWFQWYkteWUl90jYGSk5iTm0aDJDc+yghnf4
r4j4LNvPfEZg28iE91G7lN+Dcupu+qmPMU27ldxX/1XCGSf5OdsFC8ZK0CZIvX1u
zXbU9mheX3BRUiz2u5pTuRF228NTRYU8A+0L3W8njvtyIHrXLYBfdpYyyQ+OCUJM
krl0tkweZ8N5ekaewsdiwcgN1gk3Y/vtH+Udf7mWDgq9wOhtptQ6Ga4q2LZRmq4p
7hdgckrIhgkYAY9vr4hJKk3XdT9U6PtHG/un9ACFd2UcgfiUeuN38+wyGZuM3Qe5
eOTfgQ0xLtoYCN8DnWBTFa6lKPYzKfPNZk99wLBd06sP8Gc/ZS4dA7n8Z4kc4hcI
AkEhTjeB3dG6NASCyrPIjp18AJiy4A6X0pGyYiIGWcKaFBGkDvCkwfscp8FS94Nt
l7wwXXV7THMCsj4D+IYBuHVmLOnhn7mwW32XwIfF2bbG6N5TaebuDAfugbc55/fq
uG/lIeLU8yZ6PDmZbl7qCIQYn3vCLS/RM11h4ItP2bTqB9oiMZYjVsadEchV4pcr
XI5zObGIFoIU0OsG3Tj6RnuMP3cWiF570sGJ1IeONObVil6v9hB2V4HUNrreB0gN
aZ94+nCcUMV14MylKUg1JTXAHKEf/3UrtHoInHemzOzjkrELXJU5OpbW73XKubJz
R0Z7vAPv2blZ6NV3/RZM9ZKWlZchsv7FhK0cQI4A24XTCOSr1/4EmVtIu+zEJhKE
GY0I/VjmYc+JLLP18CGyqETnNwWc2YlCobNuWgk6qmlBs7RvUP1KJXh0Mi+d7M/g
nVyIGF6Xu3wDKgUaTsmnoF62xyPBmgW7N9IOFX8ihP5jQ3lM8naaKinbtZZOn0zZ
QVuvCWVLX2LF0AG5+4GWRcv95YmkMHIMRmtBV7y0JjCtwoLhaurJBdVxM3j/Gdeh
qs/3dA2HtI6CdXgLGKFL4dPtZK+iaLgPcW3iG171XDiRAefwImjf6iAkbGzsOSUB
o/QYiP2x6VheyT6AXk7T0wNjw0HbDgsMyX1G1XypkdvNUNHIlM57+sgKyN1Q9r+x
BM0eZqBZPx77jAn0cGC5S7k0iem7LexM5CndwKQWP6n7RDNc7Y4+JcJ5BFgmeB4o
HKgqonuvvWApOGkkjQ1h79Dq2Apf+D9xeto+RIGYNT0hcm/o4EHPvnyyq7oQ6pkf
O+q+95RoTuwj+GLf7c1XzXO37qbN/4AqP3BWYy7u2IYBCl/Cd5Caoyty6M0p1dp0
NMnIH6At1WApx0EXSpEOcno1kHXIWEuGtVX0bQq5CVvRvw+PT84RHAnmcxlUc8aw
fqSIpWaAzK9gqsRbdgcPfK7WZuFV66NwRFIr/RoF3Yv5DpQr3PgQSirZGuj8TZZx
2TUTMTZkLJLE+Up+Ha5ulkZM/5emNSGX5r/pS33vsboeynQhPJ+Ono5Bvzk0VE2H
6EV+d+ViIXnPBThIig5qliu2AIU59UaJtf3CtH6NOrKN6Ss+EKVxF9gCTy2ioZ2b
x8oyb3QZzMEZkte4NXRhTeeAAgJxqc+e9un4e4bPkN9rvvUdzlK8Z0FyUaahpikd
uv4eFIBLBwyTKadPK+fRznuFKxhI/mg7H2OQNHBbW3OytKbgTCpFu7IaTmFs1QLW
n6olGtf+LJ2UOPkO3DrPinekyyO1htKjd+UQhSZsuEZqhU0jrINSn/rnB5T0T7Mm
4KeW0kD/J8Ihhu33ps3B5TLd1OejHqS74TFAPmwmQn372HNDdCCg8NhZ3PE2Nrks
K4B2kmTDLYpsXkBoAPW+zLIqotut8bqGYg3q8709+sZntPlZaOLxKVsPM/ttBpwC
8uy24uMlpJr5Dg2EQPqDb3+JXzkJSqPJ/ZlycUGvJfOhRU4UubwQ3/MXmdWMEPTZ
PyiJCEwr5boUhG5SxTwJKQk/MGG1HoLmIQGFJCCL0IkOktxEOuo2bmhv7LCPg4tK
2/KTgrBOR0p1IFHOLazoDMm6j1JE193VwNnowwvLyufZp4RGNMCcTOXnqdplYe22
Ld1xLzy+dFhksi4nOtgkdxWpDIgq9Qtm00s8Op//hIYpSYGJyp+riLR+DBtR7Kno
t5D15GoQDJ7QjCDDk3vbgowsJWwbM9M7X7w8GLRoUOLGe+LqaMATY3Xx59ZqCBBM
x1Z0tneia2qoJ5p5UeH/qXUkwxGabbuLGx2EDglvTDNW5l0S7RSOSq4Oq9rrss90
7fEUkwDKTLlM1jBRFNGsKAraqLiwDM91gg5brYpB/1A=
//pragma protect end_data_block
//pragma protect digest_block
HhKYHkx0KSviMBUS2Wc7eR3f8os=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV
