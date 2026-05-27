
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
7ILf1ipEDgNhFojXzP0IvijTiy3onpzJ80k3ACHUgC86Grci9w7hIIfjMBBDUIQp
t7zTOYQB9ZWNfEWqP4znCu8LxTO7XYrfoxUm4bEBStRz3yAs0L2kreYqdiNAqsud
50CUeQsVEMqEpQAubdk69AecPCbO+mzMb3Sl1Y1ulCvgKTqUvKrJ3A==
//pragma protect end_key_block
//pragma protect digest_block
jWjPtGYFBDK+GWJPJZsIwlo/R9A=
//pragma protect end_digest_block
//pragma protect data_block
0Yod+KJgN9uN/4Tf7ZDkaL3RHzlhNY/ANGJCc46SJh8xEBghNHG0CW1MpkBhCRlp
Fbv+Z5x4yc2W64KvrMf0plOIBk9SgYwg3NlzTXos6QKPJS+KPvOZDKnpXaTlBdK/
8gwyY+dZALYIBurYvMuQMbImoitAUSlLoGNJAcpY9MpTDYxnlp5W8kVJw/Ip8oNE
Kiv/DcSct+iup8PVyjSP6Zo8HARSZibzVyIlbu7p8+riujE1TTdIgGPAnThtjDOJ
2Bw9OoqOMgD8E+PDBw9zNiPCh8jVAf1XtDO7nYx4epNcsJevz16kGXnX4/N9cgmo
2PYkrKLr0hvxC/qm+UkRSIWbVDiDeLtTFMyGaOooAoVpnkRXbzIOOLH2QTmDbtB9
pggULmQXpIZpUvVNMc1qKuoKNNtWTNvDDcbnqB+bcedTMSCF6RpDrDYk9/w9xIBb
ZArVMkPnCZzNUESO7y3MSAqAbEaRkE6ZJK5DonG3fc61to+EtARDJz9ghzTVzHDv
buyFk2AGJQoxUZlpYX3coG3wDW40Nfzl6fe0k7gemjry9uLv03aG/A5kTFNMsqqO
0UzcoWIg0aknXFO8q6Lr/o9rjzXG6LGsbdl3+cO3NWt96FDtXWLI+e8Ot3t+xr8B
M35Z1utf4BgL4DKJ1gcOIzX7BdGjByX5V51pSE5nIKPPy0RsMBb3Zqhrz6lilN7n
IcOoXQLmHOeKNkIiJWR05wf8Guhxv+nIl1ZDi9hUgfzxNAKhStjr/3SEjFCi+1f7
kDcwIA7ECmRIvchK5nW0nYntW99xoZEwS1/u4FPTFhtt5DfUMNF0DFqXoahkm25q
0WYIj+wO2AhKJGh1JdRx2bVZP9hMu3uezZpt17gr5mYpHAtUmZT17XC674t4e9Pn
s1X2EhV/+lAf2rs0y8wflsAW8eo2vZs+Qinu8/2MttEVLCRosjeJ+/I2QT3lR03f
SNL/CHkA3VSd/wVT7hfjSdR231+QWiZj6lJSUicl4QC2IBimi7tyx5/07paaKOWc
t2HH22aAO0Pj/x+Cr7fXkw==
//pragma protect end_data_block
//pragma protect digest_block
BgCQwXODH9QZkaIjlLJUGKS7hcY=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
VwGHp3Kd8A4Ze5RsScACh1ELLx1PvZ2tbv5rWFNrM72BCP+wPLhqObdeB7ps2flH
STq2B+IrkVQlXt5viH087zfNaM2CLON0JGB1CBD9lQzrSqg4AiNjKbUeqpChLBmg
RxEDbs1pJha8DC1p29U/+Y562iyY05hTf8LBL+q5fTW3dzVlvEOSfQ==
//pragma protect end_key_block
//pragma protect digest_block
XnErL4BrNaPPKbyAP/h/L6cWFWQ=
//pragma protect end_digest_block
//pragma protect data_block
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
zmrlpOBtFGeIPI2pxSWpMwgE53a1T0QxceeAE/X6wjDLejflmQjPZi2CHeByhxSu
clp7WRaDpGxOuOD2jxPR7ZFT+PeF1G4x1rUHBfvcXDGrQKErBae6iuH2aoUwNPte
iklazT5K9t8mJQ6zcbxEOSnQYF2F8O1LfvRZB9Ig8lD4fXIrQcfRkZeCoRhVtOtu
xEscx/hifbgTv0n02Z7ZtUn8cIFjyPdrSam/lWDQXxICC7loXkTcxUBDECl7pjug
PojgAHKmbuo7blW92pI+1m4ltP2BqxoFH+VOW+T3fkNmfgoj1uftwRPG6YrWvNRG
zj8YNT9cxXD6J4FNtgRRA+76GKIZb4XVpCu+S132qFn4gpKM/arrz163JTm9Spnd
VYspidr75f5QfHdBqcedltMAZ5kQWz6FAcma2jsrF8ukm0DZD68X9FBAIYg1lmbr
5oj06IKSO/4e6XLDfFCuu8PoG6RUmD6JK8kcls7iWKsOqPgnDBn7f9Uutsuv5A0H
67qgqgdo3goYQVwyqFK1o5jeHcXhuVDzWyGBnToMc3r8m8SfHa28HpMMg9jjIhMi
il49sYt98zVNykagth4PJTkVuIAqYIbrVMwdWNsOj+fydBE0LL+XIfDYHiLDSkGz
nGSvsxILBEnyQhwZpvZ3qctfhf1MgwHi5s7NwbBw2tA92zF+Dk8PFw5lyZXdo8Ul
gh3y2BYpfgq608v/UaR6eNh7e1uT3rBfMzl6XN+6Z409djo8Gn2zqQyig3prU0n1
rIYZdnOKaRDc4ZJWK9auscUePGJm5zHcVWtrkqI6ZT9CBbbspfNqYC/MrgsXSviz
XlWoMXEf3uMKQaNice3SKtugFejIft7bc0h0YFD4E7PCwBt+BKxFmm1N+uDhAIlt
tKN17QSQe4JbtObrjd+bAvFjJz9Fy7ZeixVLIofERnFJKQ230Hob2ubEapPLmK4y
+aIiDawTKiLTZVnc5ZD2FwdgZc97dVSey7R9xebMmadr8F7PpxsobGNasxfw4d2R
IwGPXasjUdDZnI3Yo1uLdRX7H+fiKh3MPx/86j3cSJq+kNEoIX9K1hR3cRNdZ/6L
FNabha8cSWeO16H4dCBtSOSoQhD/U3E0amlcdb1ihnZoKkZBkh/UMewqBmaK/VbJ
fXmjAOiSwMLyHGWDikPVFJ5WP2IJHdhrjImLCCugP8tpP51zz0h1uTeRFI6zHQ98
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

//pragma protect end_data_block
//pragma protect digest_block
bn4/YHPZJXi6yCHpoxwOIJEBvVk=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_STATUS_SV

