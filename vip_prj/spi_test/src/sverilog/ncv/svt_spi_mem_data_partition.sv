
`ifndef GUARD_SVT_SPI_MEM_DATA_PARTITION_SV
`define GUARD_SVT_SPI_MEM_DATA_PARTITION_SV

// =============================================================================
/**
 *  This is the SPI VIP flash Mem Partition Data Class. <br/>
 *  It contains Data and Data Valid Array fields to be transmitted in the Upper Partitioned Data.<br/>
 *  Currently this is used in APMEMORY parts where Data is transmitted in more than 8 lanes. (16 lanes)
 */
class svt_spi_mem_data_partition extends `SVT_TRANSACTION_TYPE;

  /**
    @grouphdr spi_trans_flash SPI Flash attributes
    This group contains attributes which are relevant to SPI Flash
    */

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  //
  /**
   * @groupname spi_trans_flash
   * This field specifies the number of Mem Partition DATA bytes in Data phase. <br/>
   */
  rand int unsigned data_frame_size = 0;
  
  /** 
   * @groupname spi_trans_flash
   * This field contains the actual Mem Partition Data to be transmitted. <br/>
   * This field width will depend on the value of data width configured in this system by define SVT_SPI_DATA_WIDTH.
   */ 
  rand bit [`SVT_SPI_DATA_WIDTH-1:0] data_array[];

  /**
   * @groupname spi_trans_flash
   * This field contains the Mem Partition Data mask bits. Supported only for flash Mode with DM feature support like apmemory <br/>
   * This field width will depend on the value of data width configured in this system by define SVT_SPI_DATA_WIDTH. <br/>
   * data_array_valid = 1 : Denotes that corresponding Index in data_array[] array is valid. <br/>
   * data_array_valid = 0 : Denotes that corresponding Index in data_array[] array is not valid. <br/>
   * If size of data_array_valid is 0, all indexes in data_array[] are valid.
   */
  rand bit [`SVT_SPI_DATA_WIDTH-1:0] data_array_valid[];

  /**
   * @groupname spi_trans_flash
   * This Read Only field contains the Device Physical Address where the Memory has been updated/Read.
   * This can be used in Analysis port and Scoreboarding purposes.
   */ 
  bit [`SVT_SPI_MAX_ADDR_CRC_BIT_WIDTH-1:0] address_frame;

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
   * Valid ranges constraints insure that the transaction settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
    data_array.size == data_frame_size;

    data_array_valid.size inside {0,data_array.size};
    if(data_array_valid.size)
      foreach(data_array_valid[i]) data_array_valid[i] inside {{`SVT_SPI_DATA_WIDTH{1'b0}}, {`SVT_SPI_DATA_WIDTH{1'b1}}};
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_mem_data_partition)
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
  extern function new(string name = "svt_spi_mem_data_partition");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_mem_data_partition)
  `svt_data_member_end(svt_spi_mem_data_partition)

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
   * Allocates a new object of type svt_spi_mem_data_partition.
   */
  extern virtual function vmm_data do_allocate();
`endif

//  //----------------------------------------------------------------------------
//  /** Used to limit a copy to the dynamic configuration members of the object.*/
//  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

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

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the transaction class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);
`else
  //---------------------------------------------------------------------------
  /**
   * Extend the copy method to take care of the transaction fields and cleanup the exception xact pointers.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
`endif

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /** 
   * This function defines the print task for svt_spi_mem_data_partition class.
   */
  extern function void do_print(`SVT_XVM(printer) printer);
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

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_mem_data_partition)
  `vmm_class_factory(svt_spi_mem_data_partition)
`endif

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
OEmJfft4dDeU7NxgC5Iu5t0DZ8CLwiBqLx5hj6MwewcPZ3/qSbJ9LDKXMamFbq4S
+Lnc9gq38mdQWQjPGY8MDitvhNMdumfJVW5Fw5DHk8d5daN34Ly+mwYLzJNRxGGy
hfCsSJPC8KDrEmftw7qfr5pSF+OgdSEtUa9payYGcnNVzJGcq1fO7A==
//pragma protect end_key_block
//pragma protect digest_block
F8vvezk6OA4Noxds3b/m5LSxtbA=
//pragma protect end_digest_block
//pragma protect data_block
KkiRG8789WHw0bXKLFz80PoXg+m15Ps2OOv1EwHG7nDgdvMh4b+bGRkZEO2OnXwI
u5rMybkMNGk6pQkJfGsKzhtmbRspxSd3t9h/V9U15xqUy6cK0agUNr2rHnXqRlJw
KhuHLy+U6Maq0spVZ7FqV5WhDbiO/kitRuFJdKk2L21Fbm63bjLW2K6UZRBu7BFC
7sz2aBBvog27FAsE+w8w2esGtuoBq5O75gwziFRpfAOg42jzQ/MV2WJV/VXfNbr+
uGIvtMtBvsgXB8LCCdmpX61l1hq4NMk1JrquA7SlcaI52MzDLjOG43uGIOfwYsRP
ZHTLJVxE0EQkVaGAD+6dzW/MUzwZMAXlJNT96BG9WAh1gFTzJABsguqOPyxdZONK
RAFnRuoD3xEUKMjknmALjH9a+gYJsdvBaOgiaiiQ/PjHdwCxWJLuyVUXfQ3gpEgs
jD7IwJSiN1PdrQGuEVuQBX2iBooz4oWJklMxl8J5N5Lz+asjXDMtUdNRKsDLLVKR
dHrKa74DQXulP3GdfLGoOYfolU12FIHHyOrPRs3r9U1fNxhuvqh3+xQZ8reFnil9
FogNVRqkiuW/q5Rm455TIXrsPzbr61JF7fcuXNIpjPExTgowSWoia8e+Codhynx/
lcdn00jfbWqEQ+4vyEJGkBSQ8c5a2fGMgCq67F4KC5jeVAYH7qUqTS9581xRcB9E
5QTyPn0J037Hw0/JkdlLXNJmffIs0Cd7X9dPQAIB+8iuXegoXZtXzGzDGSh/tf7e
7rnWMUAcDxJkpAfzyto9m+Uti0O6EYCKKoZnGCV1kSj0Xw4kexFiUFkWdi5erBgR
6PmdkJIFF/2PrS8/7VgoLZDsRobIyMYPOtX68VC/CEyI8exBX3VBNWbcEaM80swv
dTmXhPUmUzBkr1ii0i66Ox1kxyjvDaKD88CQ1aGwZe1byHsgtJGbzeL/Bmc0Q9iw
xbTDxiQXUTMw4bc32P2L2N5lFKlLOuN3/gB78K1TjfY4qP1OW7o6xWN8MXuQovs1

//pragma protect end_data_block
//pragma protect digest_block
Ywx/UblTWxS1UtvvpVqOFJmqSl8=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
W2jYFPgFZ1eLU7/OSeya0naK4R10m7j1wezJLxFCrE8p8Pjffn/0xVHuZU5nGqP/
afrF0Z1zICrMEoIOjWbJzUE0RFKFDiUqZvA8AhjYGXf7ntiwpFC6Lxs1pE3uO5N8
JxSZ41UeC01DRA3ihVQ6czp9RJJUpJoRSL4FZZwD6TWl9StV+erN5g==
//pragma protect end_key_block
//pragma protect digest_block
eOlkctfsN7MoWh4AiEOjZcQH4sI=
//pragma protect end_digest_block
//pragma protect data_block
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
Ujb8nlRPQ1FN2d65w1ljsQ==
//pragma protect end_data_block
//pragma protect digest_block
TikCyU3sAEAC3TMm58DcoeUAzvo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_MEM_DATA_PARTITION_SV

