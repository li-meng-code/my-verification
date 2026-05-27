
`ifndef GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT35X device family in DDR mode.
 */
class svt_spi_flash_mt35x_ddr_ac_configuration extends svt_configuration;

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
  real tCH_Fast_Read_DDR_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_4byte_Fast_Read_DDR_OCTAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Protocol Mode "OCTAL_IO_DTR"
   */ 
  real tCH_OCTAL_DDR_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt35x_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt35x_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt35x_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt35x_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt35x_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt35x_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt35x_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HkUX3Z3yqMFL24Bo4yJu4m1CPqzSr1gkBqQ1yKr13YjIuNpL1u2Ki1mcJU6QSWaw
RKm6Ch0eCMMeiuB9uh25xeNfqsPAAU1P8Fyk2sqB7szP96FZsiSb9iyrOBpKz6QP
Islx+04jC6b0cIyN0d1QMQm/rK9uhEhEvcsQgBwcJG8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
WKfCwjbx5t1u0167J2It1gVFk/fsV4EX6eGszJjy4ejTsmb+tH+3i/W9+z7/EnR+
Wncwnoi5moA8ZXjHXFr+rVmoG7DsrFlmN0KBAsKdIy4ZXVWdGW/ilNsHiD5xfVZ1
7/x6qroCF9aWS3kFgpsR9bJUFK/0DyP+fK3oDXeSDQoRougpqUwd69xWXlrBO2oD
l1Mm+7v+eA7ld7bqjtEhfdIJ9AVSnL6waP3LVAl+83fqEQjVOXEr7j/Qd94+ekbK
6Lyd3zRuAEKbCKLwOt0Q7MHFwVom6xs5yOvGvniGLbbwV1Sc6dG+YA6gt/8xHRyZ
JEbTzxCKKmzIbxdXtWRhpWOTHXzJJiwFRs0y/WoXed6IgnFwXcGD1EPKCjW+XOEA
Vk/LLJeWxf/ZwPGj82qWV0lGa514KIB9901AauO1K1smMgHO7dVMlkaG4qG5fqpE
1+Sn/d7afKD2xO8j0WoV0zCHhweeO+swYbSr6X4ylUzDH12YfRI90jGkkbwUNNRn
hMRBztjjx/U3UK81X1iWEaMLtB5WvT4i4lSUehdzJNVRgHUTThxheRQuGmjGOLM1
5Nw05ORsgaQsF7lYOi1/Zr9u5K2vssthe2uZrXSr0Bn374jWW5FJaXPbxdfIL08H
SyiPPCaUNmXsS5Tog+TWYlv80cibYmdTl1GZs76v7QWnfkPX4FTr6g1DK+cnYcMQ
MCiDnakx6qEl41e5aGEwVeXwyY3x2dUPa99/egmk6Z9uIw9Z9mNPGWqi/26+YX4Q
94MCKy0gIxLSTIMwfeQk9izTNlsfXiZgVp5VKB7oohrIgCKPVhaM4ZVXk4nwQ9OQ
O7lVnrDl6jbS2tTPcdr+/0Dq9X+nBs9qQAoCS44pZghk8ylEXwOIEgmpJxhdP2nm
0QqhpdN6QCsJ52LlSlSZOGXBcQqaFCjLrL42+1rm0OQ5EIH+QIFcymdUtw03N4H5
ZnQnkYKBeD355fqkWCBVpTcFcFwYi83udioGsCRLqudfCk9JOKeLS0AOQX8hLKIl
6Zy5vO25h3aKxvnrvm+RGw==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mkDG9ZyaGvHrIYksaLL9V7jMZ5dooU0MBsKXw+U0PWvBq3AcuUcIkwdsnKhxVYhm
YqLo461JYRBWh5vGoja7pILPHYODaa7H9TrWkHF2c33HyhG8UL6HCdLZswk/4ZSZ
yyajXh8KSsvdVqGJmnESdYLgXcp/h7zbXDH30Kr3I1g=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 22662     )
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
0aV8+hZSaCNRQ7q3WclSe7Cn20nX/Rx6N8zawxyDKViPP1vpyoq6vn8eiyubZtMi
X51NY/qsX2dIwlB7pqOMYXRu6vM2DVk0IRW7DJsz6W/BG7CuKMtcKCGwkFM7ASxR
aawkFSsd7yZRnF6G9FhysyLGUbyeeg6zl//eXF5if+MHE1EZ1PyPx8/zySFesaAr
VOy/2KZoZALIYTx/UOdkUgC747tHedmSZWL/7ewa5UNoiljRMTBb1D39PHV07thL
PUTp11uv+HxI16yNinOHYnrNe3uCIOLmz7UdIpA8DzquTxhbmv9ivDmiGgVKx59u
TABwqa2i3rqwPaSLvuZSwqsR7iA74H9/dzKIuKkI8GDimR9rLAIkkt0uw5j0u1WJ
iaZp8PbGt4hInBXvV2Dsih7R2YyNMZGhrNAN/n8vwMT3ijx+F4bptExoaqYrMc22
EYMeN6g6ceToVsVtWlj0z25jxnEGVuPQ0f5aCp2Ppl8d1LM2fVB4lzYnYklLVcbl
yThTEwq1A9Es+I9OcVkbIaLhac/nEnacnUlK8zcp4xAwTdPHpiWPG85hwbIBni3d
PVvhTG5aC6SGVRqQTh+rT9OgeXwWSXMCyCOb9Em6CwZxKHLjaUG55G+/0IcxGYaz
GhMOzSk4eMoT/vXE/E/NNQjLT26nza/DRtUrqOq/8vz4Xu43eBo88hiNBPLel7rY
1h7WmMHf/Od91Mes9EXokJasS7nUoBIEwtVkIPOjKhQO8ylHW1WtfyfVtFQcrsno
HzAWWidHcWyAMWFP+zTC3Yq77kaGNMW5pBv+9rZiMXO1+UX3ZgdkEMAFxI/CUYyv
4JSC8b8EJRmhcOeJZ9lPPnje54luu11KsOMaZ/iRzvsubgJ7QGidfxNl4KsPqlDy
NTxSGpi1JxP7F6QVfC3XozS+Yiq77xMr31U1J9WUpkOM5W3yYy/9Opg+4wanrGPv
/e0zfkPPrvv9eyF7rvelecBiM0pmYfTitMQxVdG/CHKWjgsl1k2tZ8PEuH5Vd8Fw
NdY8Qhb95uFYYpn6VR8rRuC/voHXsuSnMWNG85LffOrTnGr+twsF/M0dH4Hkt3pg
j7zi0HCGoDHTintEHBrWZZWnbjJOccQZ4jM/5Bu7rXjQJ3maK3VXQ/iW8XHp1KrI
RJQhm1PiNQqCyiGFjS8b0j49hDDdzlAyRTSOolx6drjfw5a/KqGwzl8h2Ide9zir
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
/jlMJd6gujIwlRJamsEopA==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TCCli3msRtrdX6K5AGWinoktRJm6o+lsor31T8+q1KPlkdXzLxlz5X4DqgjJm6mR
8RTzPQhvktGGjQwTTloekKGNZE+yy9/y84K544ow3yA08WgvjU+jlAePICdxFeV7
BOwtt3c43CWVDbOX7sLITBne/3HQrr2nK3j6zHBJPWg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 22745     )
m/jIBshhq71jk8V2jhtweWpKeBFeFp76Lhov3d0/ibBN5GdR4wo3iRB531CmS2G+
H6M11BZCR6fDAqOBS2ynGYYSIz6FfEKX9ubuZJE5FjZGLfNEx1TMe9uL+/+P6eHI
`pragma protect end_protected
