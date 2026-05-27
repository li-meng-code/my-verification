
`ifndef GUARD_SVT_SPI_STATUS_SV
`define GUARD_SVT_SPI_STATUS_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is the SPI VIP 'top level' status class.
 */
class svt_spi_status extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Reset status indication. */
  bit reset_status = 0;

  /** SPI Status Register. */
  svt_spi_status_register spisr = null;

  /** SPI FLASH Micron Top Register. */
  svt_spi_flash_micron_top_register micron_top = null;

  /** SPI FLASH Macronix Top Register. */
  svt_spi_flash_macronix_top_register macronix_top = null;

  /** SPI FLASH Winbond Top Register. */
  svt_spi_flash_winbond_top_register winbond_top = null;

  /** SPI FLASH Cypress Top Register. */
  svt_spi_flash_cypress_top_register cypress_top = null;

  /** SPI FLASH Everspin Top Register. */
  svt_spi_flash_everspin_top_register everspin_top = null;

  /** SPI FLASH Spansion Top Register. */
  svt_spi_flash_spansion_top_register spansion_top = null;

  /** SPI FLASH STM Top Register. */
  svt_spi_flash_stm_top_register stm_top = null;

  /** SPI FLASH ADESTO Top Register. */
  svt_spi_flash_adesto_top_register adesto_top = null;

  /**  SPI xSPI Flash generic TOP Register */
  svt_spi_xSPI_jedec_top_register xSPI_jedec_top = null;

  /** SPI xSPI FLASH Spansion Top Register. */
  svt_spi_xSPI_spansion_top_register xSPI_spansion_top = null;

  /** SPI FLASH ISSI Top Register. */
  svt_spi_flash_issi_top_register issi_top = null;

  /** SPI xSPI FLASH ISSI Top Register. */
  svt_spi_xSPI_issi_top_register xSPI_issi_top = null;

  /** SPI FLASH MICROCHIP Top Register. */
  svt_spi_flash_microchip_top_register microchip_top = null;

  /** SPI FLASH APMEMORY Top Register. */
  svt_spi_flash_apmemory_top_register apmemory_top = null;

  /** SPI NAND FLASH GigaDevice Top Register. */
  svt_spi_nand_flash_gigadevice_top_register gigadevice_nand_flash_top = null;

  /** SPI NAND FLASH Micron Top Register. */
  svt_spi_nand_flash_micron_top_register micron_nand_flash_top = null;

  /** SPI Rx DATA Register. */
  svt_spi_types::word rxd_register;

  /** 
   * SPI Rx DATA VALID Register.
   * This field contains the Data mask bits. Supported only for flash Mode with DM feature support like apmemory <br/>
   * This field width will depend on the value of data width configured in this system by define SVT_SPI_DATA_WIDTH. <br/>
   * data_valid = 1 : Denotes that corresponding Index in rxd_register[] array is valid. <br/>
   * data_valid = 0 : Denotes that corresponding Index in rxd_register[] array is not valid.
   */ 
  svt_spi_types::word valid_rxd_register;

  /** SPI Tx DATA Register. */
  svt_spi_types::word txd_register;

  /** EMPSPI Rx Header DATA Register. */
  svt_spi_types::hdr_word hdr_rxd_register;

  /** 
   * SPI Tx Upper Segment DATA Object.
   * This contains Data Register and Data Valid Register. 
   */
  svt_spi_mem_data_partition tx_mem_upper_data_partition[];

  /** 
   * SPI Rx Upper Segment DATA Object.
   * This contains Data Register and Data Valid Register. 
   */
  svt_spi_mem_data_partition rx_mem_upper_data_partition[];

  /** 
   * This dynamic object contains NAND Cache and Data register. <br/>
   * Size of this array is determined based on plane select present in selected <br/>
   * NAND Flash device.
   */
  svt_spi_nand_flash_data_cache_register nand_flash_data_cache_reg[];

  /** 
   * This dynamic object contains NOR Cache and Data register. <br/>
   * Size of this array is determined based on plane select present in selected <br/>
   * NOR Flash device.
   */
  svt_spi_nor_flash_data_cache_register nor_flash_data_cache_reg[];

  /** EMPSPI header Bytes decoded by Agent */
  bit[15:0] empspi_rx_header;

  /** EMPSPI Payload length decoded by Agent */
  bit[15:0] empspi_rx_payload_length;

  /** 
   * This bit indicates whether the value indicated by status bits <br/>
   * empspi_direct_write_selected/empspi_direct_read_selected are valid 
   */
  bit valid_empspi_trans_type;

  /** This bit indicates whether Payload length indicated by Status field <br/>
   * empspi_rx_payload_length is valid or not 
   */
  bit valid_empspi_payload_len;

  /** Indicates that DIRECT_WRITE has been selected in received EMPSPI Header Bytes */
  bit empspi_direct_write_selected; 

  /** Indicates that DIRECT_READ has been selected in received EMPSPI Header Bytes */
  bit empspi_direct_read_selected;

  /** If this bit is set, slave select output feature is enabled, if MODFEN is set. */
  bit ssoe = 0;

  /**  Indicates current SPI Operation Mode */
  svt_spi_types::operation_mode_enum operation_mode = svt_spi_types::SPI_MODE_0;

  /** Indicates whether SPI_INT is active low or active high*/
  svt_spi_types::active_mode_enum empspi_spi_int_polarity = svt_spi_types::ACTIVE_LOW;

  /** This field specifies whether the EMPSPI payloads to be transmitted in 8/16/32bit word size */
  svt_spi_types::payload_word_size_enum payload_word_size = svt_spi_types::SPI_8B;

  /** 
   * This field specifies whether the data is transmitted in little/big bit endian mode  <br/> 
   * LITTLE_ENDIAN : Indicates SPI LITTLE ENDIAN Format <br/>
   * BIG_ENDIAN    : Indicates SPI BIG ENDIAN Format <br/>
  */
  svt_spi_types::endianness_enum bit_endianness = svt_spi_types::BIG_ENDIAN;

  /**
   * This field specifies whether the data is transmitted in little/big byte endian mode  <br/> 
   * LITTLE_ENDIAN : Indicates SPI LITTLE ENDIAN Format <br/>
   * BIG_ENDIAN    : Indicates SPI BIG ENDIAN Format <br/>
  */
  svt_spi_types::endianness_enum byte_endianness = svt_spi_types::LITTLE_ENDIAN;

  /** Baud rate selection. */
  bit [2:0] spr = 3'h0;

  /** Baud rate pre selection. */
  bit [2:0] sppr = 3'h0;
  
  /** Mode Fault Enable. */
  bit modfen = 1'b0;

  /** 
   * This Bit indicates that Negotiation sequence has been completed in <br/> 
   * EMPSPI Mode.Negotiated parameters are valid when this bit is set. 
   */
  bit empspi_negotiation_sequence_complete = 1'b0;

  /**
   * This bit specifies the status of Power up Sequence for Read Status Commands. <br/> 
   * Logic High specifies that Power up Sequence for Read Status Commands is completed for Flash mode. <br/> 
   * Test/Sequences must wait until this bit is asserted to enqueue <br/> 
   * Read Status transactions.
   */ 
  bit spi_status_register_polling_allowed = 1'b0;

  /**
   * This bit specifies the status of Power up Sequence for Read Commands. <br/> 
   * Logic High specifies that Power up Sequence for Read Commands is completed for Flash mode. <br/> 
   * Test/Sequences must wait until this bit is asserted to enqueue <br/> 
   * Read transactions.
   */ 
  bit spi_read_access_allowed = 1'b0;

  /**
   * This bit specifies the status of Power up Sequence. <br/> 
   * Logic High specifies that Power up Sequence completed for Flash mode. <br/> 
   * Test/Sequences must wait until this bit is asserted to enqueue <br/> 
   * transactions/Service commands.
   */ 
  bit spi_power_up_sequence_complete = 1'b0;

  /**
   * This bit indicates the status of power Down Sequence after Vcc drops to <br/> 
   * Logic Low. <br/> 
   * Test/Sequences can poll this to determine the status of Power Down <br/> 
   * sequence completion. <br/>
   */ 
  bit spi_power_down_sequence_complete = 1'b0;

  /**
   * This parameter is dynamically updated with the list of PAGE ID that have been <br/> 
   * updated to keep track of Maximum Partial Page Program operation allowed. <br/> 
   */ 
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] updated_page_program_addr_list[$];

  /**
   * This Parameter is dynamically updated to reflect Partitions that have <br/> 
   * been been Programmed. This page address is placed at same index in parameter #updated_page_program_addr_list <br/> 
   */ 
  bit [`SVT_SPI_MAX_PAGE_PROGRAM_PARTITION-1:0] updated_page_program_partition_list[$];

  /** 
   * Indicates which plane should be copying data from data register to cache register 
   * upon READ_PAGE_CACHE_RANDOM or READ_PAGE_CACHE_LAST. 
   */
  bit[`SVT_SPI_MAX_PLANE_SELECT_CFG_BIT_WIDTH-1:0] cache_read_plane_id;

  /** 
   * This stores the value of weight controlling variable which determines how often <br/>
   * the RANDOM value for DQS initialize as ACTIVE HIGH is chosen. <br/>
   * This is applicable in Slave Devices Only. <br/>
   * This is currently supported in JEDEC Profile 2.0 Generic Part Numbers. <br/>
   */
  int multi_factor_wait_cycle_latency_wt = 50;

  /** Specifies the Vendor name selected */
  string vendor_name;

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
  `svt_vmm_data_new(svt_spi_status)
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
  extern function new(string name = "svt_spi_status");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_status)
    `svt_field_object(spisr,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(micron_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(macronix_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(winbond_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(cypress_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(everspin_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(spansion_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(stm_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(adesto_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(xSPI_jedec_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(xSPI_spansion_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(issi_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(xSPI_issi_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(microchip_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(apmemory_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(gigadevice_nand_flash_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_object(micron_nand_flash_top,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_array_object(tx_mem_upper_data_partition,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_NOCOPY|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_array_object(rx_mem_upper_data_partition,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_NOCOPY|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_array_object(nand_flash_data_cache_reg,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_NOCOPY|`SVT_DEEP,`SVT_HOW_DEEP)
    `svt_field_array_object(nor_flash_data_cache_reg,`SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_NOCOPY|`SVT_DEEP,`SVT_HOW_DEEP)
  `svt_data_member_end(svt_spi_status)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_status.
   */
  extern virtual function vmm_data do_allocate();
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
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs.
   *
   * @param rhs Object to be compared against.
   * @param comparer `SVT_XVM(comparer) instance used to accomplish the compare.
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
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

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the transaction class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);

  //----------------------------------------------------------------------------
  /**
   * Extend the svt_post_do_all_do_copy method to cleanup the exception xact pointers.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function void svt_post_do_all_do_copy(`SVT_DATA_BASE_TYPE to);
`else
  //---------------------------------------------------------------------------
  /**
   * Extend the copy method to take care of the transaction fields and cleanup the exception xact pointers.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
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

  extern virtual function svt_spi_types::flash_protocol_mode_enum get_spi_flash_protocol_mode();
  extern virtual function bit [31:0] get_spi_flash_read_register_value();
  //----------------------------------------------------------------------------
  /**
   * Sets the configuration.
   * This method is also called upon reconfigure with latest configuration class object as argument. 
   * This Routine executes the necessary steps as per selected mode when
   * reconfiguration is invoked(shared_status!=null).
   */
  extern virtual function void set_cfg(svt_configuration cfg);

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_status)
  `vmm_class_factory(svt_spi_status)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Il5c+eUjECFWsxoNuWxNpmW5aXT/ewUutUW7USTeXbALpK13NdnuLZgdRtLnV3fP
byCI8nr9wgsx4URcwU1vm2XikNRp+YNuIjMShGpehbj6QM/KHYtz39qd6aq0Q7lB
pVG3d7jsS0AWsZFaYHYlVe0k9eCvWXAg14BHb56vJIE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 615       )
TiA+pM2jWTXa/YMLAtmVOgAAnsh8NhTkr9Rcn+aCDvmGZZ2sbaXv/xh29Ds8sYVj
VsNoijxurU8WUAnXVgaxp3Ksq/7sKDaBwiNJi05JeGSh6B8TNyDmnTTuFnIj8di/
SqUMhc1yx/wb+OT5cvxIQ/OvKOnv2vzXPPYGF7E0uLnfMb/jZ5Qa0sm2TNfhsoIh
voWS6dcrejYgpe99+3bWZCozHwAuKFug7m4CytmbEbMmnNQUyEUuazM38YuKZfPz
NtVvwwrlkj9KadlRb4l0ZP2ByHZA5otw0UtVA4WOKPA2xYXluJ8PC3trvf7Xos/e
WW3dV9JaX30BNTB2SPCtg1bkoMyGWpWi0pUNSkbymwGBSQzMrAW0Tyyni4mKaBoy
h97VLQJly7593w7ySE8GGFb2lzVbql3ZFQAeULYMoodC/wWpTXOki6lniJc0jfTU
q9XSB8tdnFxK0ZA0ake/IO0bewn42+WUESjuu9DPPQRpJW8+q9INbCkZtjHuuaw8
tN1yHJfGgnf2M0rEUR9hLpw37sZczgd6pc2BualOSrjBd3Z6KGVOdOy9zdVke8ac
GpEXQdNPEu984Ff+4TyIcbfQPwbt7yWrOd0afHox9zt9CHKtGF5ZgcGeOZEhFjkq
vhfg/+Fs9ilSzEHY7vGt2Fe0XLlJvKp4/eiuvuNQncBXT7NgO1gG/iAzo6imC/mA
y/CjgdX2Gp77fN42NpISFFJpyJVXpzXH7CUo1gAAheN/Jh14E2/doIQYVK50qFK6
UPhcF3Mxt6PEMPm9c1YyRukTJWuDtRUJdNsp0BLn7SHsATjPAqNvZAan/RVM0Hoh
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
doXXf3xBvCJu240mhoBWf6DcE8OlO1fvlVbEWGFpygcrXbeWjm8Ld6Eps9q7zcpJ
MYN9Wx6C3hhd8SRfFvkhtd+r27nxvCn/QA4E6Jo9/uB0/sSl31oN74gGV5D4S5h9
w/erpkcSCzlQX5qMaGRekY5/5CUft7UxfW9ZJTXADnE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 55497     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_STATUS_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PTAsjxPaU+U+KiFfc+ZtRAVPm+qufvXN8rPnaZ2OPOLuHIhEUR8wla7HQzkZTUoO
/1Xx5XN8dcyenPNXZT7Cj1TsGp+22DN8J/CtdrTDX8/4F95ONukPEQWp+ENFCH3u
pYvSzaWncbD9xMJYkWhJGHLdxFrFBqfdGXgYB2w/euU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 55580     )
qelkfhfWRUmt7S+GI13mA60MXRPQBHJ0conVo/13Z6d44Nz9j0fDVXst9eN9aKr1
zgw8NLkAKDLBRXaJpfoUdO929T8ytZLJQUZNssyKX+q4Ln4yzOvdpvcu0tYZ8+E7
`pragma protect end_protected
