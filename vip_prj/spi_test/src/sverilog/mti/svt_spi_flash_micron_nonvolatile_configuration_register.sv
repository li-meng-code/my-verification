
`ifndef GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP 'top level' status class.
 */
class svt_spi_flash_micron_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  bit [7:0] dummy_cycles = 8'h0;

  bit [7:0] xip_mode = 8'hFF;

  bit [7:0] output_driver_strength = 8'hFF;

  bit enable_dtr_protocol_n = 1'b1;

  bit reset_hold_enable = 1'b1;

  bit quad_protocol = 1'b1;

  bit dual_protocol = 1'b1;

  bit address_segment = 1'b1;

  bit address_bytes = 1'b1;

  bit [7:0] wrap_mode_reg = 8'hFF;

  bit[7:0] io_mode = 8'hFF;
  
  bit [15:0] register_value; 

  /** SPI Agent configuration handle */
`ifdef SVT_VMM_TECHNOLOGY
  svt_spi_group_configuration spi_agent_cfg;
`else
  svt_spi_agent_configuration spi_agent_cfg;
`endif  

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_micron_nonvolatile_configuration_register)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the status.
   */
  extern function new(string name = "svt_spi_flash_micron_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_micron_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_micron_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_micron_nonvolatile_configuration_register.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this status object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);


`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  // ---------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

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

  // ---------------------------------------------------------------------------
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

  // ---------------------------------------------------------------------------
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

  extern virtual function bit [15:0] get_register_value(int addr=0);
  extern virtual function void set_register_value( bit [15:0] reg_val=16'h0, int addr=0 );
  extern virtual function void set_cfg(svt_configuration cfg);
  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_micron_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_micron_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JfBX3+f7A9fwJh5kBfh/4ZplhVDXCqea23CrdW6Q5fuyVfrD7pIWz90rs6cND9HH
oU0TWjlpCUvIiG2dogNIB6p+Z/lZ4bO8ssdlu/zOjTPB7frZt2KJ2o80jYbvJhYm
RVMckDPKiPrbhO6GMywNXgyVZrlQs13I8tGP6R8BSGg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1028      )
25a86+3n0bbnxxl4zBVd04z7AgW+XL9LDsLmUUMH9Em9G/Yl+OtbJmvaVZZa7BgO
SSDt7yFGzpeMDpC98m3J988F3wkwds8brV+EKnyloPah4jUXU5nva/F0n+PHBvmQ
+VrYFeUN1FaAgPu0ztnsN+Qb8R5M1ZcBIa7sCE/c2WcUcO75TNFCfOH18c9mKfDk
bBmYulEDRjDuDLV9RHYyoZHT76o5lRlNq4l4NV2Gn+yTaGa6F7/wW/EiZRRxHrYK
JiYmRzfJVJzLJofn9kI8M4PeEnwHRK+vBHMFJq8vQy7RV8pmwkZM/g899OGLbE4W
JeZ3GyazKS98BciA6j39x8fHrHl+vgLOY194etYGAjEHH6kRe4B4BNj2i/PmNBh2
KkAwFDHEvvITsWpF9BvjjbhHKpObCXjJ5b7XN36LEqVEVmWAH2W7TpeRRWeHirLA
jCfoOVKw8hWYvtyeYeouodvwGJaeeeDdMqHwM8Pas/S7eAL+89IQ8s7vGHS919AY
CWa3/XWonbSVcahSd+oVrgftnQlkEcA5E0IuUVm86JWRu9elh5qguodpugWJ8XNt
sl6IGd0RQ7ewdtHQzLHJoPc0DvGxqwggNbde/ErAzyngTePtjAUrujj3kIiwElEX
MjML2zJneQzvYW+PeDTpU8W8b2J5vQMDKmwfQbkwngEiK5JkFMyoWvzHTkHUQjoN
ikQC9hR30GgQUCYG+xZPsy6gCogkN//YOges+WWNIm4cp7qV4/5tVWiTu5ETX0XF
gnYAk+o3jwxYaTkwRAv28NAXSgMumLNHeDBt8ivwJ259lr51vnVf9vUsuKeI855F
3y64sK4hELjpHuqFF+et55kQJDGwPKQB7ERzBOwoOtOEy+hptQ4smAjqXHiAwqD1
39Icc9YbVtHvv9rumELvQp/pJ39XoWTDoXYY3Q93Z6uTKhoJmduF3JfwjCHLuzug
hdB3Fg6VIKHzRIe9nGQhbmuMYmhWdLlVnYIYAaOVgtIF4XcN7Xs39pWdZvbXNTxV
1VAv0TQwZheNPsrW3YFrAmzb8e2NafhBjoWB9YLQ2LrNZp3Wa2YqZu3bcWEGwpME
gWIa5WLlGUsxIdiC/52Nwkva1N4zE74BaASk1Ilw0USiAIXQbfas1dYZ41JiYsnD
vJGwG1sWfuhDQ19Q30i0HKb/kx4Q44I/3Wd9c/MxXMnmcFShWIOB1yPDTTpcoUSl
IEFvsRm4nt9kgEZmJEuBWXQKgqFWnfh5MnIQcNbfD645GfalEc+vogrW8RWDk7tv
a8CB+M7pdlB1J+tRAjtdp8hYXemkog10fEgA0gExWmhguCptElQsG7pl4F3EFcEU
SakyaH2cF2vGhedqSzsIVeHNtqVgW7ZIPJ5wsA0UuwU=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
lZu4EEAspQoMbw8DMWH7XpUKMBmAJUOQuSyGoPXsXwKjhGi2bekQOGHPvY5s3jPF
U4xXhzodv2AToyGXaV+QukRtHbmO9mFHTjFIj1i0XcRrjrHWQnbPh4oaJuy/YHgb
Jls7IeFB3C23feNuyRIGSHDSslHqKIuwj8EFjGr/uFI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16474     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pVO6b7aB+FzIWj7P0htiChHZzzb0U+fDtMCRKK7T2LHnRPM7gobio7KTc1FzJVYW
Xw7N0NM9BkfmGZKnzAUGNyeIeYDmERUBjxqd/U65w/w3fXZXnCu6TQgzzBiKJN5e
of8q0q9vcekK1d7B8Qj+UMI3N+JpG51utSkKuUDrh0s=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16557     )
fuN1S8+unzolUMIRtl/riZwRLlx3m/2zmh4LEHaIZGgGjIAJy9P3ptzT9lQrcSqP
TP3+tgUiG520O3rRglVsHw+1VvLCu5WskcsISjyORfA5I9dYS8dmt3B/KC9DRr5M
`pragma protect end_protected
