
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
2Eh8btt2SALYZFzgoyeJwRYVCz/zriChGsPoevfTNvuTxFEYDIDyzmJbrm2xlAvF
F4VO1SvWj6YfYsZd+OTG0FN2L13BnNUemo4KVRqczPX88yv57kbKpfN5DAAD6wY7
XkImvBtmVZizIFn+EDzk9LUa+H7EhKkpp38DMu8x9jWgAj2ZwAf04g==
//pragma protect end_key_block
//pragma protect digest_block
GR3e0+7HAaCakW8ENlDj13oj4+o=
//pragma protect end_digest_block
//pragma protect data_block
hAQ8eXYJjRN2ClBUyUMUMD2C9SDHzN/pXQgxQwhuZIvNE4gBENnsl+0BfdZHIgC3
fGhGlNCTx6HLIVvPt0MmKIbzg6JG4EEn0xcINeuWD4TBt4bzldAxDjezEtaFq05m
wbwtY0KkqlZ6njSa15BqiTvtGxAsDQYjmjBDt7HbKU3/+F5cuzhBqCojMmIMm+HC
AWtNA2xW6uSiit1x0dLhC4TyxfiWAgzODTDggmfjY2XFUvAhhgaOCtFVomXirED5
uelmGkpLXUFkGPNgvQguQVvcrlpUbETNgKzAXsY8Y6nXmYv98ZuF9XrWHkuPWocV
rCy7qlS28ZzhEOAMz7tJljemlrNQcH+uAG+QhPWtwqmvFc+DfyaVyQ+vU6S7SOQq
HHYqjDCWLQXqsZki/mEgrdhFp7i4XGSjxU8qjkhKYVaOGByLEt+V2U8Gn1/Au5HY
a1xfFdHbmNB0FOKIJvkDiRfifv44nPJJR9Y7n4CpnhIrkMKH366JTfQhJ6qigMLD
vdjpr2TfMdH0NNWXLjFDvdlqe/VAJVOmvd8UrQTkgAi2PAj1LmS6MQ0u6lFsI75W
Lq3O8ZJf4hir4i6s+KeEQZzyyf6CiTHK04AAa9mmUqrzo5AgeZ5xjHDgunQRZKB+
kzlXspUnbMLAbByqZN1TrSrZTsggzlPSEorwsQCCzRafsraXSAoHCpoAeh/YOmJe
lhJ1vYUKnAqNA1V/1R6xnOrjh25Bv6RuvUbzqrKLmFJlGEKoaB997BRIOe1Uj/Fu
Grr6p2qShQsuzAwVFHN3C6I5cez45pzRCDnwsUU7ddi7FfVxK6GalwBx4IXLCC0t
RhkyIBgszoeMviLT16fKnbE3Y6mOl8uhkEt1NLlZXxrEaJ0kxmHVuJWqPRplWVOR
mR2uAD0Of6CfeEi1W9XrnYCPn3rI35jESP49T3epP3QtP4hv9MUaHDOK5JFK2w3a
r/j3rKrtdUnafm++QArBzSTPkeDOoCG8ZKbI4Qbqrq/w/uN85mFp+Nv9vVztJusa
rASzUckNi87Y9ymmc53gcEqVZIj6T6OM87xFJ94rMM7u6CpjtLu6t/W/4phO4vv3
DdOvYSUuv+cTEA1uoP+zQ9LbZJRK8nDJrXoWwrN8HENezS/bbxYQ0F5OHKfZ6r7s
/o8dsdwPTpDeAqxoXluAOm1tEaG86WGxrwKlfkP7dVnYE5O83Lf71xFtc7BZoT1+
Ipt/W2XcfeR5cQZGhzuT7iQ+NDy0jTlzIVxFpjJTrVorb+uxrRB0/JUHLo8WprGZ
y8lmJ/clsapxrjf/a1DJWQ==
//pragma protect end_data_block
//pragma protect digest_block
ec4LsMlOTAS+skIsBot0tg3Jrhw=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
27QdpjXNVqLtbrU7NVt/pLTDEV2fPywsljY6pepaiP8DgZJ7swCVfJQ/4dcnELGU
kVFIcVckdPz9CxtyhRJ3hufE7go9ZKDzQF8zOW7+gajYlFPciTdEncOlDQYGv1bh
IgSQSSlhDp7DXBPfWdDtV4Q3X3G4F7QpgNeAuWvtc6eZ9zEdxZPC7Q==
//pragma protect end_key_block
//pragma protect digest_block
sGGS/jraruzAGPIzG6jdUuijPAc=
//pragma protect end_digest_block
//pragma protect data_block
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
UuF1UFmDZZL76dpco0gKel2VoJk6Oqs7lYpFfB6YoSvpO7ChGKtU5UcwFAL+Wnda
gfXS7sMJTbizNWcEhFYafcbX4BkrPH6SxebqpquxKqTTKWAX8GZZneITyXN5SmaS
y5PJA4GjjPt6ND6yBD6OE4J1FB5N1lxnExA1l//zNUyNaf2nzGeHiVNWdrHFmEzA
NAzD3nq39T4Aq4QMZZjeDEdzVuUCMpZ4ZsBHI0ht3vLUigUwv6ku1a/NM/666rFw
Woa+1CkxfVfi7mF0Fr7OKsyL2CdMhCyqMHcXqaartfVGItz3+Gbejev2+fVt1ITZ
eL1QOmOw9Oqian/CCfLHSgC2HcBmdxmUDGaePB2pdWwm70p7utzclplLuroglx8f
ignuDXN6HpPsnty93wE4yJJyCXY/LqjtoUGht+iN1Wb1UYA2MXZ2GJM+fkcLdxmE
2EJmfWBDOyu1Quei7W06uT5uwtZjyMxVl3ezzWMU5IGs5DjPae1W9y3sMcD73TFB
2v9UNRebAOI1ziluYUWaQUEffmSjW9WYttVEaErmCr3owt3P4IZujSYhrTdwujKl
oLj7gt8DctulW9Eex0iT0Orq7uY2ce9RaBD/l3CQXL4+fyZvlVAr5Ea8nTJ5G5Hv
K8dV6pDxmMVlVJtMypWCB7jvAUdpZgp2Otc4jNmnQIDQN61Mgyreap/LGAUf+kps
uWoCa91BbqXAhiVmzfYPiAuPeA5NXAL/10pstLBY2TBRQgXFGO9msLGjpGsLPVrM
J+6r6i3d2JY7Hz61YElfa7Q3P3gUjYwh/3wgHo/LMPmWIl6INiG0ZpWgan10nlwM
hCiBIJ5GDGDnQRfj7cONqjBRkP4rOgM3NtPQIqnHVVxSaonU/NPJQ6mZNIKNBR27
LPPV02Mq9NSXSshBijK7eSDxaAHuKw+9dhkqUR7xPX+b7CLD69322tQx1eR+fUwJ
iGUgPspA17myboVclFKeqEDCXOGPZoHqYplr64c8p5uY9CY/sXW7jXFmyDeTxMV8
MRQLU2uvy/C/dyNsQ1dwLj5jTNdJuTt/PdX4+5I/RhnGTd8cbHNk4KR4PtPWoVPx
yz1DKE4aYePHr+UapocNPF+qXD95rWWe6kPqaCeqbjGKrrLphcyLbL+RCMroaUXP
znCAXAC9YyDhUwmyJCeNmOoOTEwjGTzAXtCUum6z/BmohyIFl7Bs1dFDzkGDl6rY
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
IK4n4iczTMSlonNvCiYTpu4SzrAPx6J0iEPpXIOHVdqs/q02//ILAPyA/qTq1YVq
hbgMUnvU0H+YJJOvyfeUMYAkL5oMuhQrs7mXm19PzYq7uYnPT3aP48o9YTUa/6ff
hXZiVYVbfbHzmpCrZPhuwP0g3G6qh8mRmjwj+qVsqLrdy4FlztXxK2PI4Nv3ngo9
EAKmQfNz7UbYjy2JZQ0JdtL11hpjJM696ldJLLFmpTf81naJ6JnZe3ms4bfP3SUF
F+YBNIsnj/KHY7ncIrO5R059K1nVdZN4VkGyHp6wIKEVpAvEmxJHYEwihrnumlCA
hI24e39i1aMJG4yQf3g3ZRVNy4ocf1gEtLtkXlKBReVN8KR6YYIs5erAzh5z2SxL
pXy6M1DV+g2ELWmycqFWeoxjMXz6CQawUZwlmOSh5FwUCBWP+AdLmbPZcTkp9x82
aRk/FT+Zt/R1drIComwfFGzDxqXvzpO0XmpctnlEiClrWAYYLun5v4uO8ikXe4XG
zbtSRkP8iebERftiPmbEnFE7co03x64EHL2ZebQ01Wzap4nht06jQQXkQkHow2PV
tofO9lx4IJxOla+p5alVI1ntXWoGNki4ysGSfiAByWKFM7YYy5LSOZar7/0nQD/0
f9rT9mDRc3uk2Bd2bk+JDjMqXLGV1d+ucFJNrJ9iz4n6ks2/Ku8J746+tI4lSi3y
uf5GH8BTl/dsCeeWo5rt7mX3xPT+/EsWFTSAJGaqVZV/fZ6ayjl8HcG7DLI9gPVy
leCEE0ifuq83aZ66IGLLYUXVmcbOVlHTcwR+lOlwITR8S6D2AzZwqIIAf8cMwIW3
tlALbHtkSnM7wIPrxZwzLU3wy9Fy2E+64WKPt3bmggvU5EojVgAfl/kMe5dtSlVA
nua92ztnGgfTDhtafH6YETSNKBh2ZlGfEIWfARmBZOUQCd0ROc8FYvlVQQRmlxfm
ICDHt3a7CjwfEfHt+w42Bqq0j4fqGLRryrcqNc7E+sBZIftDurnIrZPx6WxhMX0p
tlE4dRatkYn4HNPiX7whV1SYmLHuPatAZuRMdazITaO0bHLvmsWhI/p/b83GDYo2
1u5WWjg6pMpV5LvruA5Xlx8kOx7zBh4USMxWh3I40UEQKhEByo+1ANyL2sBFTiNT
F7XpdwGrbJ0Gj5ilw/0hdHlcQT743Fo2A8Abe1W08EAeh/H70Jt17+s7zZZcQXfx
kgZ9JdaYnnxDfFTbTm2NbQMALeTESz7WUgxh/RQtDOKMKwF8+dMcIs/emlhMv6pI
4TdUQqJAn9Gji5p6Putz8FG1VGR+QoPFcpePCdWpjPseX1R7hlYU3BP+sBfhruRs
4icG2uC3AaMnoAdAqv0UchxLEGHBtjQ8v0GJV3KSb3fuGJXtDKjyaMcsexYhU17F
t/EP14IVB0Y7GWQRMcDpJToYkQOwZyLUkWtc7ZO4fmssxx6gdHpyaqmzJ8+Rcp7o
gQKaVOsUimmBzvXrVTvWvAYd8YrPss8gr0hwYtEHTiLb3dcV0z9pfBvNlDNQVo7j
5nkAsz8bxfQfIqrzvp/IFPPTcotNeUpei84xYz1so7CDpg1v6puu7OcbEaHL9QYG
Jb8HbUeKkyYbiNrT0kiW6bcghzwISvhCFEpuAK+axRtsj4btrKkyV30E7TA+fljc
nfvVo4VdsbPhissp7kXhH2iIrFDbrRjUw8AC6K6meCTQOqM4csedZJ38FQzUlJX+
kO9T4l6hRT7+0HKBONL2863kb0nEMxzkRaPrwDDzonBINqIxorksVunkV8B9X+Nb
82kHg/moRZKNo2u6JkFobXlwQGUdgf7frUOWLb6RtVfK5EL5rYOZiVOE8v888VmD
iTxz7p1hkb6oVAAfXRr9/g1eTfgmkMbWOe2LPcJVg1oE7/uR57M3y/JEJ2yugP3I
ssxEkXqT+O3rC+I24eQEp0CiRZTK1ijoNEgg8R9PBsBLiukbN5n22M3ij4qTU3ih
DQoMcP0PbTdVeu82VxATfTqfkWeIDzETKLOd+pjfxIMJlTOU4WSJdBCjHgKl0AoQ
lDFQ6cT+JKXAkgfTJYTRlbG3T7krb7goC894AMu5wMg/5LTloiiub34BH1jzbzOe
AJWsLelbI/ZBi8sGrq+3dEbiSoWwoh/dYmqRIL19gjz/P/8Ss+rHOkkRS+8SdhdL
K/ui78NsQJuHv4mVRvwFvw==
//pragma protect end_data_block
//pragma protect digest_block
C/BvSJSjua1cHQk1wnu2MHtbBa4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_JESD251_XSPI_DDR_AC_CONFIGURATION_SV
