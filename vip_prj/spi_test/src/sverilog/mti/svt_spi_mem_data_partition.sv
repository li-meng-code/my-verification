
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hNXk86zVIOoEiAmmP/hnx8Y66ZBPUMVzgPNbKl7wrdPmUbeUwMevVwz7H5NZYdGM
ugm7nAUGJCpLDN3G52SbCj1xZbpfb39hwLZn+QuswKbl1SMEPj7O7iUZlghnWne7
GQ7Mr3dA+zxPjhCC/hAqfuoSTE+yJTlR2dm6LdC/TnA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 598       )
eZUdXKplVoyZZeTorwcTE6rhVEpukmM3qZS12I4knw3SXtLuvkL+gzzUay0ftbdJ
CfQxIHBPdb7m1wRrWWVGOL4gWKDWb+/jWxb9PMuVUPIDnYXk28VEB6kBxYJf2cq3
IBvsYfLBBL9T9r9lDqaMxJ/oYGx4LGGaRLl3IqqRpuhrhL2TzxvEV4/EP2iXGQUL
x1/5dkFFlC9CqdmGrxwbXNGAHPV08m03WjRHMzmXb6FCGHiUYTVDvl5bg8Gys5ev
dvIpqLbbekPQ5SeBeKVhBmryuqnFswhYJsr/I+yAyFwJch/oRbwmQIdhrdgKSDrx
oGXlCxKjy1pOAH6w4kojupZR8N8JR08h2HDvN5ZZISgcxTin4mFChdMSBiaMK79v
A4pCZZ4HxMh+WAqybQ0o14lfiRKPR3RJdfIsQpNim6UqPxN8HBYjbNS9yps0R3ri
9+qDxzH9sNPY1JklLGaEaOcLuaesk66GxMvLOsC38tcNbt6SvSdbghAym6/AaUOo
piOo0nYtcDVhAakl47ElBqtyjjnnyBQk71ceJn9rdMQvPFkeWqOVgC7HYylzs9B0
9CaBqnIVw1YpepTgYt0AVvzCNacq+SPiYpwyp9UFUM2jt5Gy2C7MKJ+8b2ZX3E1C
5u02Pnhaky+FkdEMxqlvSKXhOz7l96MGT6GHzP8O6IYrDJcuoqa13t3occwZttvQ
SW87DhX2KEromIF3VU3SEXszTuJcOCSKUCRHQyargloC2ETw+7kJjJiPxW7l9822
JjxXZO4vGydT3N4zaw/Y3i+hHccf9xkC6FMF/siVBHs=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
B36ViaaGDphPb9h2QgMFrZ4lAuAx8D6ls9kC360aoFY2nalDepzEV64JA4EN/EqT
sJBglLlvi9XUJylYl2pFwkBg0bcWb1flKu2VmCaz1lTudsKoXJdPoVDnUbKhfChR
ZCq3AkRhuVf1AA4V1txkwR/TrhzqYPoOJC8S3tngXvc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12632     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_MEM_DATA_PARTITION_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Aa41ybx0l442YEdTzDVHMB6Je2YignU0xc8ujOsSDV0ne7DY18qk941hI5MUkPfl
C9dUiIVWVo1hVf/GAM5xkUrWCo1FLRrsxv/EAtQatU0nbinMT6k85+XW8qPMtgT3
yPiOAKDhqntnhGQdvO/EqhBY16S/PxdQakKw6OT4NCE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12715     )
SAdrERVxUNR6tadc3gLkwv2E6w1L4U5nd80ATXZDmfd7g2hjF1/ahOVPy5Kd+kGk
Y4pNejeeG5ttxzcqAraHUgcey8Igard+T0GblzOctXQLIWxHYv7pn62V0mrmoojZ
`pragma protect end_protected
