
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

`protected
JfAXR?b_fd6@aR1:CEX/BQX@bI(e=Q<2#Q0ag5^]XXBf\)][3MeD&)?Zg=[IVDC:
>(:4/J.\_+P29a]D&cGV+#Fd84CDcH-9Sb>0SYE05Ne/0g:&020fWM_M@aP;M+R0
7^E(a[AWGYKgT\P^_<@YAf#WE@f=)8#MIZ,f1507UI4#+KU3f>gbOX\PdW.>7IO;
b+OB?H=K;Rf[/NTF:800;(TV.STTQ(\K,7SI>+\GPGT(JS8SJG&L9B9##(c,Za&R
GYKN(:G49aVa9POA@df/M6^U._#:IQTCU;1;9+>PWJ4>LHa;QMM(,I6?aQK,P2Ze
X;Sbd4P\I0dZY5L,1)e=R0NZH(Z\bNH_P&E@^T(6/T-C^Fd/-6CU.<bB(bOe66IU
392:=V;NCDIW\O(Vb];X]aSL7HfNQ\IY)[a&8@c:V_?W@G4eaZIM_Rg9QF]X(D3I
:>QP8QR[R5>F/2V/&:g58S7-W#-U.)?8LdA)\X-6Y,W-[6V5BJ2dEf-5b,]#M]9O
C5?),))\YR697c5/TgDBSSb1;;_S&CSCD=JTX)<2d:RB^COS#FS=/],@^g3N105&
_S>FCQabII^UebfD+7@K\>)\)8SaNT^DR=CHbVODGJBgdPcJ2@,G?e@Y<]_@HUB1
acN1Q7Y/+#J0(SQcOM;>501T\5[<A9.)=$
`endprotected

   
//vcs_vip_protect
`protected
W#.,\b-RI^UVG[CKGP4>8.6<=2b)_Zf?/L;2,.WNL?a^Z-A7HUeX3(gWBGOcM\T1
=7PCB?[Lg?ge6c,Z]I5g>]7;Z,F6bP6)40A+SaP1:_OC&[>JZ;7\edaKHbA]Y8D(
PE7=d+]FXK(Q(4V.\dHNQ58&QAE;PL#fZWO5TbLCXeK.,WR_=S[&8SCA:E=[(1(:
J:W1KH<c:6MId/NSIN0\b>RPCK(7F?2c3EZ0UC8T0);J0#:#b_JbE4FE9E6a>QZL
)<WCIA(0Y]]2D\(@,,@TW#0;OXO8f=fb#=(GVP,E8((7H=?cU2/32D.6C@O;YZ:=
).@K&@A2L=C(ZW.AU0>(?3/_+-/52:K-B;=XJ>GTCNAUV#cBSC1^X7,X5VFQ<Y7/
X_dS,JFDMWKZ=O1WEg]Y=OgA?<fA]Y4(;MBI&P9d>72+G+3g<\aM8L=aE@/WH+,8
\M6_ZJ/8?@&#UC[IIM+C=fICFR+9HSAc\E9O9>1Zg@,-7K)7ZaL=5;>=\:^XUb,;
2@69d<Y.CRO?^PZ3?1PeYNAL>/E)#E;B:UT@.0^C+Z^FgGKQZC[RY8^J9f9Yc#0=
MYCU+@YcF7P<=IH?>[_N<K(56\Q^aS=6ADYO;cXMdcbaUYgIEHI;P[0S:8d^<HL^
K0@@g1\[9R/;ADMOYJ))VXG7B@GT7RT2[?7g#dF9<O5Z(&JY7WD5,6WJ9L9Rg?IA
Y&XUCdCIJbQ6IN2b2:7=^E(g<8GHC6JW:(SRNP6d.CF1bA4:;SD5WF?aTLWB267,
HN[E2N?CVcQ=.GZ,d]?GQXLF))b7^#gF=OSEBHDKX8+cO)LU4?[a+MeB]L=ff_MX
BH@-Q1BR23&]N):GCWYKHO&Ca:4VZfZdVL;1M;B4>56dR-B4UAdf:4>ITO9-]2V5
Sb9&Zc]P+?H^QYKc_1D4H8[8JgYOQB1.>+>[,YTgOJUEOS7Y[S@ZCHMFeL)>3c(H
.N;F2Je>&J5C]O8-/]G8?J-+SF2/CQONS?fD>T+LG7P^Bd+@&=U@1_FAeVT9^MND
KW4f<NE:V8HHMADHCDW_I?1eT2M04)W?(2/PQAFfb,BLBG)&/IFM&A)2/AYeZ7ed
Le2,\QdARV4B2CHP]gad5&FO^H],d<;AZ<a?7WYM-#eQTLK6L8cgD<bKJ8I:BVF)
)2/?DGY?Y79=R]_aIe;_0eN\03XZIQ#>-8QT^0I\N6P+5]A?c??G#E_8gAGXOa0P
CNSJ@f7XDfKBL&1E33fJ#-/59Z3d9;12-ZLY_E/+B]YW,dMSP4>&1NAI<fT^2b7,
AJ=NP-2FDIS)Pa4ZCPb=VAVRD^J&?+)\CgU;7WYgGY8B7&77bY(e3G,\0(V14LL@
7XUe<WFG]\#\b4+U[;Ka7SB-PEB#W\NLZ]W0GSV+NT?D,&Z5@WE<g8F^J(A9U@AS
H7=0LJ2Q(c7,VMEaec0+)]IX9cI<&K&=c9GP>;[#&AcT,OGC]QAL-JZ=P(Q.K_J&
O:=?GNX[\I3O1I2^A@eL#;P=D[fB6BK-&-=W]S(EN@N>Kdg19eT9H6.QaFGb#dgN
d[<:CPBM0_P/,beG=;=+L]P^KB>EUcNL^G_TO27^-+/#FTZNY5fX/aQB56J->VE7
9N6AJ?cee/D^+#_L6<VN4)H,F>Nc;<V;FUN]a1Wab>9UJ,&6/4@NYF#4CA]8/cW=
2N@dU[6\P?V=ee)U#G<<Y#L7U24V3DD6).Y+eKMX#(/0<6>1/+FH8J69Z-VYS3b:
LP5-Ic=<fM8#@cV-@R3VR,<1&^+KDKJab\A>.SS[_A3LKE3fSW1\f>,>]OM;ICOL
(28BG)B,;N,C21KO^H-XJ\1AL^L]R-@(M?#X__NBY(c4Y2BE<Gf:e>X[^RR5YJLG
:Y):L@@OeW-])>][\2=4;0N.,)1T(6WVYYY0JFgV3XJ)W_g:N6LX^)MBDg?NXO[D
G.EL[0ST>4g,97AaYF)3NYL-L?\M?VZJI.:G0@,>e;C6SY^L<_FS&BDe>J7URYZ^
M62E+3_dOW8QGJgL#UbTM89Y;HM6\aPTbP88NF5.IX=d#Q=&1f=.XP.QIVP4>c-8
XU7@M]TF-?((N;,4A8W[LR&dP#0L\B)^JF?fRB5_P40=^9d+HQI8CCa<Gc[[XK@G
]0?HMDAAX=8_E[5D7_6NJd_>DfPg5])X/(G\fCM]&@+4Z\.=[S)#][BfU\&YX:2C
]_-@4=Y##A<d5OKAf_D>8]1L;B)OJBPW3-N#^7N+O@.P/AHAb937LN^#>Jg<Y.O4
>XMX0KEPU:_Le6>;bPLS,Eg2P6@G6ba1Rd6bQbfG>JLI\FDY&PTM+M@g93S:I+dX
2Q+@1/KYUCB2dS=AV@GJTa3_TeXIZ0=F7?WU;XCR4E1Z<bLU>90O7IA#RUII8/(V
7W<RZM^1F\?)eTXDPDANK>O_Z<#+](b?f=)dI5MJ9=SH14a6<B2]EV=I[bdG.g8g
<Y#Q<=]Z6^W5O&2A)bN>8>.DK1AA&W,B+TL\DW[\e)&:=8gD=d1[O+ea,]XIae#-
<Q<7GKL00QR^#CJG150/QV?[QC)UIH)&3;VS3XHZ9W12)Z7;F.0A8B_\?W+ZW,)_
N@gd/Z-dWLGPAK19^WXD)?;.J\B.Zd3L_KS]W,O^DLA@,@bb>+QI>#La&8+KTD55
DX8If;W\XQJ6E.J4:c^(]7^A2/-ebT3YB@GJMNUAaCTC6^XfYfb6a?e3OK+aZS&.
BBV>PN+:d91d+Q#UZg,=(R7Kg(L>//QSUM;;4N@R<WF<c1E8\B9<EFaCQJ38]PX]
AEM6faL8F-#bgOb)Z:(fM<Va5CUG;&FWcENAQd>]W+2C9XEJ@\fa3&62;18;a>J,
Wb1P/Z<L/cc=W[;;9KLF36;VZL;JNF1g=[WP\?&,YF\-d]-LU&eX\0#0]C1ER3JF
1[<_<)g<CQ-]8OLWB>Y[aN?8:0J0AF>H,Jfe9JALPJ5)EC2^N]PbaeD#&R97aGc;
68b4NLOb&YK5G;@75D8I)/A_=NQ.^F7,,eU4CIOUA0L1??;/WHJ4--PE+P141\]F
LgQA7P9,5C:/_:MPN3G&?1gN&,HV2>E(Fb+8@0IDRKF>W3<Z#gO7/@gIEB-41IIT
/9ZQ.Q;IgDWRgGQDdK:T#,?7BBW>76EUI96._\>[>3+X/;/3&cDd)cNXI__O[4T_
SN5D8aX7>O8YE.OFAO7I8[+ZA9-LH(d6FP9a;N&M,PA#GQK7-R0-e-:XTAW)P_E.
RL3G@1-gV_R3QbAZMcKY7GCc@4D/AV)e)Xe:fRQOS\\B0^V64P#)K9_D+W)>-.<>
;89g-W5NLAN>NPcLMG]acN:,I2=#Q^>42c<W9UW64=(a;CU=@0W4aK06[5&OO9,2
[d6?S2KPYRK8I7AgRLZ45N^;_]QOMa;RF[,DYQ9G&CcAeNV<9/6T6c()2EM0X&S8
N02J+X?;W0A;>>@?Cf-,bAPHUMET][RHg.5;6MRf46GX7\X8Z2#QLO[4G;95QN)7
Q<c_G3B?N5&:UeI>4M+MWRPD[0[HROAMO+Q62g+&,KUYP3KVF8Y05<e6N,?-ZY10
0+F&P8a8CN5b^MS/9>4UV5F+-MM-DZ8;><JMF856N<Ca\d3CS#6W9B#Z:8@e1dVE
IX6VK;JX5IeR-63@XJ?3AK2VR/:/Q.U41>WIH50eT8IY3M0+QA]c<QRITEU[4:FX
Bb//6[3-F08fT0&4P\?7@AcMbQPZb)K63XYJZ=71O@A)g85Q[<?E@M1Jf77R^7Ka
YPJ2@5F/<f;QP=ZcJd/5GD;\FZL7;@?=_E(>.D4#PT.\)YF:W:a19#P2VC?e0(10
I[[^B@f)Z.9XJ7T\aHFP^:9<OTL2E5W.0Db9:W#PK=NEQ,Y?d_UdY3,\G]Rfg(;B
9TYFcD/Pe3^S4=/M02bcK(5f.Ta^&V=PI\#SI-I8bS2O/[WPW4>:E+/5f,X2K[I+
\BG2bK)5S>W5f/:USEU\,4cAe^-\6^05e6S9d\ULgIbI3NGcYN/=PXN_fUWP+d[Z
_KYadeDL9(A)8)@HZ-.-MXKO:<]&]PX4-86b3@FPFGL1@)=feOd7^T/U1VY\QNA;
/eB11ZSc3g,E,ZX,MKWPIO6JF<Q?<b#(b=d8\U?_)=.Ig47.g6#S.,#0LN^T6-e=
b</14N^&;X^^=Pb6Y3AT1M.^1(^OeR-dZ=]ca_>2FdPC3SW;QO/Ug,\P<IW.)7VU
-G#>\))&[7QOI#GPGb7+K<dE3HTcc).WL-f/_8NdB2/E3;VB82XO&9[1Gg&g4B@S
AH>O47g:B-=V;]g;:/2(]H/AYg+F&UATIX[g[dI4-CEZ&AfCJ(FT#6<Z^XSZZ-?3
OO&8;TWX=E_@gdV+-H#5Q&81fO@=&2J&7973C.IP8P0dZT_KTUUQ5,1SK@ZI9E\2
+a:8d&]Y2d#2WLTO9@,][6eAE#e&-VdNcYdZCCNF>3(&Vd^5M;)NE6K48IW(Ea>b
;&Y[Ee:MOZR:N6[&YMFL-YIcF93V5&\RJ=0.XW.MUN@K=W]\U7T^VO[A5[?:W9GZ
.0?(]]Q1QI-5D?R:>VJ9-80C&P/>O-BgFZfLY-@SS>Q@.\aV;&,XfOD&H[DKQ_=a
.3K-9#8Rd+FJ-1L^J8=SU^<3A6ME\7_.FRNP[/5\(P_#c(:KB(facQAC8BA)-,_;
#,FGf:;,T^O<3CGB9cfD:,BPYf?83@C1D0Q#/#E;_F/[^#)+HT-A3HB)N1fUX,?2
O79@HS0\[SaAXJM?RET&[#ATQ#g+9]+<.W1>V<W4b81(/(:IggYb-gYcfMg[OP/Z
YQ>_NO,^+8JNfI_;[F72VHK/6a+X1<D];5TM<5OKL5[-J2ST^I[.7FKS>JcRbH^+
=2B<dN(L_aC@CaRf_UQL]Kc5gYJK^0Ba\f+:?U,g<,#[F4^@KN]MB^Z3+.=RC)27
8RNE;^QTQ3P8MG)-B#KW4]gbGYge<Z0VR)8KCDJGW>&JKVL5U8/AIDZ0TN=I6?0-
9(_4G=#V\U?bV<BDYEP=c,:9ebe&d>b_7]U@32_<@U0NI9gH<YRfO4=XfO(IC4RQ
e[(Q7YVKd1KGgY??b9UY;M7SCd),SeBYeN?&[\^,T1-0O,K_0KA/_c0->:+CN<5Y
?O,B)#-5>=GOUM\_MMg5NG9I;5F(g\-VX(WI/XVS@WHQHG1AI?PFWJXTgDVMH>^:
PY5JAGKVdcX8+5E:9fa+e:8HZa,]YIfUF)M8JRV)d6FM8AC\3=9H6\FagO+WZL>6
[e2]CYM>Ba98OQ9,/#TOQ_-9c1SPB@A\U4<J?,PfR.5J7\<Je<<2FW#eKU?c<N@[
_WAI_/AO3IU;0<D2:]T7O\#.:IYC4K#XdJH4Z(>TDXSdTB0f<W44B.F#.X\LMBZg
KdI;WN;MUQa08/ccR;LXN?R^W\;OVe:HP3T@?/0Z?L1DDXCU;3d/S_PGeU&cD2f:
[SUc70G)=UR6M=)5^;9/.B]Z8_KcaCNFK&Q31]A1O</XeO&b;MFAWI#7=_^Q][OV
)N5.Pb,FB&9>CVY[g8=da+X&.1:V7Pdf/a^+2?V7H\Z[Xbd&V/9@[NgU0=TQ5Re3
E8S#;gTHE)O[VI3]=FaKS/&\7726F4T.;+4IJY[cTW&:[3f+0Ca&5Q0BE^4)B.RW
T\^aTSG#Ea2b&&MBS<-G[OGO\F]8L0T8&G)NLP-8<P#ab>@/7b3C>]Aa<U:0F;U_
6@dLY[;1<Y(.H)Je0e#:X\gX[7P4O)cG9cF[EG[eY0,<Wf4N<N:RAMa/JO8T?[P;
L6>FN3>?XEKe(Y^e=P/&SD.;D42R>JDe&.DIOY,U_.D_Q<I>4)fO3>CTUc6PTb+[
P_#1aC=4g^bIB4)0PN=.3<dVR4F9.C#QLX6]Y#TN-W]O,<X?B2732,DGV7^=gZ&5
Pb)H-+D1K9PG_(8aGPH6C^>b(1TcI/#<6aJS4IO[Zf:J/D<WMBD<bKO)f9=8Re6O
745d2I/@H)F.?F)DC_FEeRR1f8M;T._Z(=E>5VefTU]T6Tde;I&c62N:H+T-bLFH
,[)ccYNZb?45.:@F07ET5eYY9)<Z1<R4;AT&#B;W3)_94?(4&^WQ[DZ5XJZdccK4
==ggQb>1e.Df515[8UJ)IHM#T)GVUR0(7aEcOTgS._aJ.4(DQ&\PQK.9=X<H7)YS
01>>)AK\B_3EfD#Z;W\WU@((2A+,3&R++cC&7[f+OQ4MP<)W^?g.J^J)K=Y:3g+Y
(UgP:/OZ1>53f.9T[_#9I[_Z@_P:7Q?Ug:=Y;4;;eN>YGZ)>]I_J/,g-#fGWXC)U
Q)U/=)cR3fSKO\c+]@&b/8\HFEe83BQ93D6RJ5FgOREE+YE,ESc9)0[:-K52bS5K
JZX=<Tg:2F<FQI>^gV3f>_Wd?&PF1U^dOP0R?+3?V\6?RB==d/(4a^]O9Ia&ca,+
QA?0/&WUH(Y/:)S0U_SRT9/0EYTO:HbH@M.UKJO9N]80e+U;1WQO@L0d1V3A?#V<
d/)3VTNScCR>7K6V\d4P[,-GZR;PJTDYBFac,=0,S;cLaF_J[C-R97cX\@-Y71U#
)W1#.0@BZ^CWAPe@^D^.&/KfAE,D/0^g19_FF8^X+[bVCGd=@G:D)Zc6,bcUIaVf
VC+=9Z,X@B0U/W]BbCU&N:8f.J=g1ge6++3CBMg#Z&EC,M0U:RCGE6.\dgR#PM[9
c2b:2c@-bZ^^4^19:Ld61:N#g^T9FBa-PMM8(9NEO?LM+]^IZC7W4K--IPX2aG;O
d.&b^Ig2ZcJB#:\5)\QPZH4TOV7)6K=M&a@gKY8[CQ/gd@.cGc:_V5?4+.[;<@87
L&CHcQL(A+-&QT;/O56YL0F.WfXKQ_-VY2C+#V,\L+WOa\6G,-6)KeeVMa?;;9]4
OR.4VKY>3cH:SCb4g.]MJ?IgG^O:7V1@02:-U<2.[gO2X-JSeg&8]H2Q<6@SBB1+
=2VJ+:(1c#(C),6Z3SC2;)W5A_OAR8T64K--7TfY#JG1DSESMDcN^Y_B9:]65fg@
-<LZdSA(R&G^^IBTN<C1EdV1KXHVa[]&0;1-O3.#VO@^;I&G:#;Dfb-TfW2@CD@A
N/=[TD:JeU@[B&OfQ<1N7?J&NOeMfd>NJJLd&^^9Q1=<ZA4Z4YfAgV7HCbT().Oa
5X9XJLc,U;g9BNE;>gGM]H3)Y[XHK:C\U3EPe@1E:23,8[XW&8P\HZD0bbY(HK0\
I0D5\a2[617HQ7Z&fK5?3fT+:M2eDI\]dPP3&H.6Nd<+^47)DLG]]YRZgXU4ND#A
W&.1X^&cPg(E9R\@0V(JU5g_V0f</I?;WC85H>GP>:dR/W<Cb[ZOd9GA3/Zcf_KD
<15<R+204H2R2?A[X:P@V\Q2/O6^SW:gB8b[G+a0V(\WFbONLKdE]U[b?,;G_KT2
/+Q6Q5466RZ;-dAa.E>/_H<H=d.?J&RW1Ng5_N[e^23/QL.HCC)3&ETN[L\ZCHR,
4F/\@EH:YZCJG=/:c\LIb2?@^SC4,)Y.b22b@a7AWF47e6EB6\]9_5a;YP(3XQMR
f6M\_X3cC4b^8_(@2)O759SH[@QdFePOL<_,:#c>FGDb=VA1+74E;6ZX.aNd)W7+
N6WQV7HEe#\K(0-\5=Q2c#1#B>JK0cUd=dESd/1_@<]RZ8?,&/+NU7bB[[UTSdOd
PaZ@HMPC,O:TL@agQ;fG>5+IP93BO#FJ4A1<?Pd&4]<=a)_8Ug,O(QONZ&AJ48Zc
9Z[?+Cb5E-?98@Y(If@?9d=O\UCVV(:RO3<\gI:DA0\@Z;F<;Eb:S8a/Y#e8C3^N
XM+ADO.ggg=W-=YQUQR=(V[)RYeIVOf.CO?[+BS67d#bM^+NBZFSeR(X#GfUcSPd
8?XKE5.BYe,CQD2XT2X9EdbGFI9bSH#HO19DGEa:a0;R)ba=MG4d?H_XIbG1N4A[
UH#7dd3\-;8MW1G[aJ>cC@OTaJ@1LbDREI&.Yd49SZCT3ddf,eC<NC;CYXG6>5M7
F,9EdF;OB<7.]dFG9:V5I=Z&-^&8;)AZ=IQ8#Ng8,c7FN2;^LCIT[8IZXMbe.>-d
5):8d8GSBF?Z7b<SO5>Y2)-L=J>G@f+<==dCI_B^B1b8A.&SL\9+M^N[RO<KU7];
dCUYI(LA@IV2]83PH2c:&LXCW;#]4^0MJ90G-F0[>_.MK1D;<(W_V>1]HW-aM6W+
a[aB\L=?I>PHT&<;Qg1)QUTdK_ZLaD;BIc?C=H>G9NPdVYL_dT)-Z,T@T>=E/g6;
d(3Xg7/9]aBU>,2)+cDF6)M/-UKVQ-TLD),FGe&<G-L0;XgdE-Q\GP9E5>7.\M-)
_.(Ab9)RD:\/V\P[W#7.#ac=8+MRH^7B_7KI^?IVBKUHgJ_9<PJYX++.)<1P1E=]
=c8.\9D\LT(c^<H0P>d_J],V;<NU:2HN(c,(aJX)(6RQ37Eag9OgS7G0W:I_B\f.
X-3YG^ZKKDJ(0AC;gJ1KUU&PWWYb5A@b_=cOf1I#K>@_XHa)aZX/Fd50b07?c/6g
FWC1?5@#HNeA/eS8S7SbI0\;XY#Tda(H<EK=#_g&GF;K-F>JGVUceH-=#QN1(fJG
Y15>(B9P^??YMa.LL@_9SDL2U2IJ7-P4O2-b#Q(V_;Y)Td;Q9T9OR?^C^L&ZQ@.D
@Zd3CeK5^7XZ\\ge7)6Da#:X6A(.\BDdMdD,a#-GG(3_8M2P[Y&S2@ZW=VRN05^B
P?[B<(2#.+;H<99<@A#B;14aP)4aYK:8P,6acQQEYLcfS1E@OGN4]0W8D/4bAfBQ
U,Va,VY;,/NKf270O34Ued5F#ff)3V0&DaW)7<+&eJD9,(D.[b00;LCKV-^^7aX#
)\SYAO;.4J5@&:_/P(+QEY<Y-D\)d6fdLJ7^[5gR@a)Q684CCNa?L5Efc2Q4+aTd
M@-S\F:MMLR1R)^5&4FP@:g4d6^)KJeJW_0PJ_C2@-d^I:,QJ2-eIA1E?^E-AL1R
@/T@Q5/T^TO,W_4Hab]@Jg#K;Ud97OTYXaR7RFMEcb-b5f84JDa;c\)B(bRWJ0,f
);DXe=5G+5ZB8aXSdY)<8R\F[Cd2ceQV&65Q&/F\+R+)>&C3e-EN=,@FH68\DM7Z
?e4CE1Z8[,MVf9P&+OUBWA4?I9gG_eIK6U.R^0MCCECX&bSBTQQP7c2e._O+O)GP
f[<N>/ETER<CYeI?9Q?<eEWOXaSLb#S3ISg3A<TYH-]_aS>XF#S1=80?=?/]3?<Q
REd_K55SCYL?/\2YI[C#[_SS-9;=3?H46:</ZB7W6c[R&]^G^YDF5GTJ[3CM<6S6
+78Bgf[KHG>R&5Y-2_V=.FKRH7W2OB<,A=-XQ(2gS.-3;[3YANW#3geb69G9MR?;
[BfM3\JYLHD69bO<+SZL/HEL=8R\F?7a[PYSgHa3:@>_+DFdT7D47IS;(OKEZ+JI
ff>3(6)GgJ\<g>IMOX(;R]G-eY53EfB3TGK-ed8PFMWBe-3>XI(PF,;SC+gQV&7O
+V-B,HIN639AECT<)f@MM./&ZHYZM2B_-]N^cWWQZS&HE,=/?2SdY6636K]a@,>a
E0d<D2a2ZP>KHWKL(gU(R8fV88\V0AASVJ4WPK/J38dP@cD]Oa]SJ9_BGZ.@_G;H
e(Q4@,)#VQWd-e7L+>#@>,XSg/IIBO0DaLI@BU2;PFVd]<6[0F;Wb/5VUcafS],&
S;=SS)cQ[U0IY3PZ,<INCacY6O1X\UgF.&>[Q.G#I5?#O.AE=W>.EAUW#\4IBW-G
)]OLZ\3-6E)HJ(#ZCP1ZgBZCK690?GCI[\#,dD(5D2fRR)HP)VW0]d^7a(+39^8G
,6d6_O-BK=@C,F1<LH[f&)[C-7\LN-S=Z_R<,UH)M[NB(b]/bI/RUP7KPGQY3+Ob
KM\d6g08?A0-3<RADg?Q,+1TO&3@g+@Q_.[6eN<MPH:Y9OO>:1+)L;>_fYNE)RCc
G>@bD[NfB15Z<QRb+IEKW=/=3VQ^7,QG>/3F=fM6BHS8C]f-_0bDe].V4J223#9A
aNR#aX^1]?e7#+a-GJ&/PP=U.AZaG0VB6,UH<R?D]aWD;ccQZST[8]^;Y3Q715M=
;Ffd&aH[MB9c(F2LH;BcPPb;QVc]V3HcA/_6HeaBCN]1T4A_6;a>?g&&=F8@;LV5
9HR\d1Hd/_6a&<(?=T3a212dSV]>PIP=8Y5N?AR>PXE(D,:f6Sg.2XVfU3Oa2NB_
>XJ\PQNG:1-&NcP&/,?3;:;LS3f^NK8;:^;09-aY-FSHQN7K4VbCgMI3#b7]KX58
]UR&2_1-H):01A9BKGUFac1&77S3_fPL7.ZB7I/TG&L(^JMI?MUcONFXO=<LQ5T6
Y;UU<-RFeUSJ75WUC:_XIV=-K^V[9MaO55QPU<=[?^)W?E,CTIESP,4\@6(D;</[
&gc[?1ag&L#U1\28^4PK,<?77>?9W2fYCAQ+/MDQ2@331DdGJecS03@QP_Pcd,P2
CTb::1CH5gKEQL_AcVUL:[fK[+a>G+VK?7MNV9g&)\Ya8@N\#T7+-;J,+=J)9CA^
QK_Z@>T.D3F#dKI:SdbL)TOS[f/e+e/e^O,]7@JJ)22@ADc)#AV41)CHN5Td/eP9
&39NRX-+V;G(Z[E^d86/YX<a.>9e;P<QUVYLdegS8XQg:6,gR624HJ]=FHD2bTJ1
)^9PCI3+23CGc#6-X42Kdf0]L6b81M^SN-\Y.&cLVRYSM#_Z?1.Lc:/S:7K#)Y>G
JT&\4RF^?P+62c3Q@XK-4b6^7>M8=#XWCNfe?H-BQPb9-+_EN6:U[XCbFAZLXV7@
S8.f6S;CGX4&.8fcG:E13C7UAZ>/HTM0R:.&FaR-Gg:gJ-E<3,R<T1^:PDWS^&D0
<C4WO)S.)4AMa9\AW+0eV)g3;,]><#\UV=)X,V-_Y>4+;cU-c;&DHG^:,aU6_.WR
_<+]DgbKE?088+3@&=J8B0CO\J>R?;0<#6=X-3,/aULT<W094=R^Q0JCU71-9<eW
K9dc=VUQF@g_c+J^_F-N/N?L941[A(\GSdO&<I9A;R7WAIW:7U:f(1TRHB+]d+<S
D&-cKe\dgFCefY_&(;DP/5R^T=X5;IXTA.)f5aD?Q96?d9TH_6^YR5+R\=Z#aM_9
Z[>JA>P=]R-ZAA1dR//c7)[FJ:D<ET=1R:0;N&aLS^43)8>247G1)J3adC#bSf>2
FWT@;V:Y([U_eUeAG3GHU8=d=95VGU0I+bBdV&UNYa,Y^/R5TW]Ca_-U(0K3:B]g
D+EKaI&)K0Hee<7N6:-.,K2dX^_XB-F^.MHFG#6Ag(-NJ]1^NfW)Z1GS^;O_cXW/
))_:dJ-ZL+f0MLFSFY(D-L&O;[f\#/S\:H)@5R5\#WJB1E2fPeeZ3I5^;:]ZY(dE
UB+M(RT\QK6^/);348=:VfWcYH_+gH9[^\M25Ze2R02T@(?#MCUENA4d7<G5/g)@
3[C:NR\U1e/Y(DX4ME\O;>KZ7bP5DY.WNB9I5,Mc>_aSDWBQ?L6TR^F42+7X.181
fg-YcV#?K/V3&HHVU0eB?3I=]V@8>\_3=XD_YeN?>d@8WdeL6E@NYP,5)1@T;fS3
V.V:gV)[]NY@^)=?dM>S3PH)cF^eZRZeeS@3&=5?QJ(JHTGV88W:KXa[NRA8dEIc
db\\NScSM4>N8Q0JO7N_GEeOcd-[138aAF@U_eV.4Y1_g;O]<gI_KPZ&ZGXNQ\(2
/(=8P_SH>W/ZA(=bJ+J>@)M_.DGX]b_@=YdbK2V>BR?[a+Y]\XL_RY/WE]FCT4f^
;H2Y3HfR^Y&9L:(E#80NAaJQa/4@BW+[0DcBGX(f1LF&S#g0gI9WG;X43I8-Z0DG
V/>>be0UHg0>Pb<PM#_;d[:4_C(;>01_M4P=3:_,Z]#)&9TH#dP?;6-g]HS5UA4+
7ZP5d[=U&:_&;<WB^]65NFXA[56b\A?LS,/,3\1N>DS>Zb)=CHKHfOPH\2b^)IG>
VG>:ZgJ+[bNT5N>;WOY4\V,W&JaaeV/=XMF^2E]^DS^)J5,9eY^.Q9&PLB#a<7KO
(^M:KD4IP\IeN^L4cXOWdT7A;X9=3X^[+Zd8&dI<ZH)Ba29?dM@03)(QF-<B5TIU
?Wa(L:\3cNa/<TK6.0-_X>4QJ?,LAR(e231-9D9Q5>C8:YeTeHI[ZR\d^6@9Y)D>
YBR^:^((9+?TAeeGfPWGPKbOTg=0f2\R8#C^UK4/d06AEdfURQ;(-PEJB.)#Iebf
a3L4WRY(V)&65e;770??.\5[-/UY9+W_UK8R1::G0+U&X\(;DXL]:Q;eccbg/g5M
G3^EKcfJG;Q2@?T<.39\&5g@Y(2J[-,/aM.03.X6W+cHc&W&::U]>1QaG2&ZT9,a
E3IH9VEH23+&R&.#a\II:B^)AL:1<.9e5T-9VbE67Be;R5GUAP?5TZ2QIf:I=XV]
1W+6:,B;GFScN0[dUDW/[DI&QdAETRNVRR+=KCGNX4[A?)4U7@:\K8e7\(5UHWT3
VS9DWBL9O5TY+\CY?e?3F@eB\8fHXWC/>,(Y96KcdVKA2)??WO5]3]Q-9HPUF-7I
a)eG(T;a,W]EI#XKX1<9\TPeAa:g_ILB^cRY]7;R8fNZd/1SI&I7aceC.>,]_@/@
91C#eSgeV.<59Q&,D(]_3(KN^C-dD&/PK&,^\TS?:RdD[e8g@b)Oa#),Z3.gN.?b
EY//ea<B(2W6&-F76+,(2d\c4>8&P(5SVL;g-/c)MCL6GF3L9cH)[>;Z/O9Re()D
]QRHK\Q>8E[B&S^3>@R[?GQ#Z,5J<YXC8]TX]L.^e6c=59SN3U=/O@;4Q@>J4R\Z
/^gG7,LWUL91U_B2EQI<.8]V76I+>O<d,.(\Y&H3S1R=a?&:=]2MSABEN8P0Z0/?
dfc1)4)MJMN@KBf-B-a<7,M7:EJfEY8B9H4De,Y<K&eS=MbJG,KaH2GGS7WEDB(D
>(K_J18_e+)=K/UENHe1@4VRPQS.]@ZX5CYIN]61S<S7,SJVcNb(I\W(_468c54b
=I912;+X:_6C8a;Y/L;_O]gS=QTJT6\_c\a?N3KV)-\UHb8fWJ4@5]4]=>A]@R^^
M_H?gMN(2I(b+^1#Qg=B#)EVKBNA&4WI;A&QAZJP7JJY_N-RL\S+HG:A7.&8\E(A
ME^KH1;J=F&Q#(c]C?0Hd=L>.S70SZKZ/T;EI9N25+TEJBa^4(Rd:)R-Ib/3P?IB
DS\KKM9I\:=KeDVH)-\_R>Z^RY&)+T33)2eR_eX^Q]JS:Je^C<8CJ<?&<14D@I#c
?I=f(4GN7QX)@P_7+.(PDdZ5D\?VO&aa6>/(&@0ZDV.@8Y4]MFXBH>FAUW\@FP[d
,Md3cBfSO-BO;:)b_C58.,Y4g]J8+O0L<49\)g[7QR29GDH^O,++f^c6V:F7LF,2
0PL=+5\VY21OAJf]#6[O9V-7272/VB=3?.Q97aQ&cGd<R#LF8UFLdQFg_c:df5b9
;+9VKJ:bP,9(gcacZ#RE9a8R^D(:ELW@;AAdbZDIEcMUD6B-3a?.f4Z@9ead5CGL
HCB0cT1dg>e)-3^GLF\8;S[b[NGBJZ-_QHY9OUJ;Ge5FEVc<HT^=O+.XcRYP8[TA
V&5E>=bB26=:EJ>N/<Sb@2:L3BE8a]__:P5&MaQ(VKOQe(NNP5W:ANCYV0g9(DIH
@L^TSNZF#Y\,W)RH<\F6]CU#6IDaZL@85,6[R-+aW]2RMX4+97D\cV#EBT@;BdSG
LdZFG<KC&#E@D-+-0^fg;^-24,(A-aDOb2adTVQBSXE/Qa<#VBD6KD&@I;C<(.b>
1F^A/3Hc@W6f7gC<[P1H(<:V104aNZ]Y])\C0TbFMdKgJ9<afD@0Be/)f0g3#_NY
<,PIcFM6J4<,4N<^L77cETR/Q_F0K:[)BLdB[VIAC0LJ2I5C+:\.[E7483ZJ8J-3
_Pg[@Kbb7cdMd^O5bZ3RN\6[+8bdFaE1:bK8POeE4LYQ6L31CP_<2X&=9/_/W+45
UN]\00S@]aUF.J[-V,X=-G.d_VE[9e&#&C19+@L+L;#D:Z2B4OTXW4PC^^1]-cFa
;2:M#M?;)@JL/<)cTg+00U9b()eSH-IMGYM1g;4@3Z?):,46Y#R2f08L)Q-1H8/4
)HgQ#TCLZ7)DZ2?0ZbW1M+Va-#:d2c+&0-2e.eWeCFFeaga?YfN,gTS?&]b9N0J7
AG(:f@3STc_=_+UO]7+>YH3&:CGHbR\QIY&F:PO1@0A+?23@)A\@<WLZ]8(Q4)[T
RNPWPc+a)X=-GEcU(&9M/WR1>G<a/\L;2_Wfd>C[KD0&LAQA5]<DLQ1B.)=W?A_2
\A3:RZ-<&39A,/dEYg5.=9#)Z/^+Q<Y2N+(I40McA4>g^DgBUQTYF.=JB]]QEEES
FW)32=RgQ;R#GXH@a>XF3dW:9#R]3eadP?(fPNXVe0M4N&58.D#+^NKgAD)Kf[:D
b5Q7.8^5CaRYBKI8A[B/PX>a7JK#NaN=?bMTd,b=9EO&]b?W4T]V9:@?g@e4(PAB
T=@^WeL?E<fUN=EJ5PN]K\#[<a:6a4?gT3#_3+#BNW:ZR_Z@.QcOE23KGLN1TSZd
(+]-dXJT=-XRCWbP+Hf_f&I#I3c>TO53SV(_R^C,HQ/9FN)M>R@e<N\_E,e+^aMF
AJP)+ZR70?##YWPaWaT;9&.5[Xd9FdM7FD8#(TB6DO,?-RSc8CK45_,]F>B.4<7d
;7V^\Be((,>e6^VG9fFK3a/Z4G4L#&P#<[c.ALHWH4EY&Id?YX7+e@N1A=cAH](X
&NTdP+aeb;0=fZFFW3)8H)dU0N4\N@&-8HFH)C:Q?dXEF87);YH=XQM=:7GFW;a9
G)7].ICKCW9HHWHROC65Y6:2bfU=Ne1IM66dg(8T?-GGKK818B<O/fM9<GTbGF:8
9M;/V(H)@\@gNf&)<L2/[1f]S/)IC-,Of2N^SCE4JGO=J\dOL&<>Z:gf<KU?f2bB
JS&g<++YNe@<[]5IBGZR5-P>e^);[+V:4B04L/+7R@WDUU:6Mg_WZ_?1UM9EX-H3
S,]&=PDUGc#(0SB?I_))#/fLNHWQa^^.I)7;RKA]+;HPN6TZO-If/eV<NKND5HR;
4>+Aa^91@(^bE9X#A>5ZOE#_3Dd=]d&ZcK.GJ?I?];2H:N/Ndc_M]PAR]U/WW>f,
8=Cg3&@@5adF\I#99\L;33,aE5CDIQfM^(JSGf>4@&4Y,.C9?=CI3[&Ud;Td.<L>
\N3ZJKP.W7Cb-<P)90#H4RNDT8<PUWYJaLc+baW,I<2Nb@&3UHIA;>&3^VMd6YOY
UR<_5F2B2\^\e@N5_&E1[MbQTE)]JEK8=OW-CSA<)M[_4](R8V/#65A2e<;BC)QS
g-+cT:[I?YR_[+cV)W7Y?TWH=K=EHBMVSGH-gc55fLC#gL\D\KaDf(-]9Q72f;Ib
.]6LZ;;XJEZebPMJSDBcg\>cT+:)Y]B9#d9fL1JENPdD3H.bUG4FScAKRO=05BL8
=FW>/5-7[E1@4/T.44T0\=YL]P]&ME<(ZNC0XfH^fNF5PL#ZfQ1KO_ae,7V7=3RT
J-aR@/\+_3;29O6=;(YOC\UdE&E\?g&ZZ/MD<Jbb]9\O\3\Q^\8V/ZKg1Q0PV^CU
B@]B_GdFWBc9Ja>A;QWP9\ec\LAIW3LUZ/Ob92OWASGH8cbGW8H?5S\A&(EAE5YH
c4E7R:^,N]WXL4GZTMAOO<PeR#Z\_FVd/A(8[d&<^:[+S-Q:6EU\7,INKW535IB0
d=]M\eK]0SUK-8TcALY_60_/]+Gb?FK.LfcB.RY0,e:LW7[W_2WB(G1a0LV_JUg8
<PF\aR\K>H(<D.RKE9>BeaZJK:d.<EaK8?@\]/CRV[J];==A0S3-BRR&)UE[[,JU
=7V<[dMbT:V._@)@F<9>;3M[gd<9C=U&N859Hb/&:ge#VeMdY].d:^Q31Z12DY[1
FY8QZ(9S<(.E78K)fZ\AXS2YH-KSEZR5f#77JA7DI(Q/YBYWY_dTDOVKY6X\Oe5?
Y+Q-@dfaK[GY=&ZM/,Z)bV4f6G&Q(ffG=a1g0B]]+T>?^^SJ+8(cR:Xc2)4R@;RP
]Je++c[Af#:DVEaNFD/KLcES^6.8IYF?[TcVa]T,WKMAOX)bG+EJ+HMaX]RcOK9M
^EC487eE-4]\]]+e[(Na6)fI_]+C.)BKPSZ0Mc(YbL,NZ>UEIeY5:(efLUc\>a.g
HT_16+5?3d;N<7<18FY1?7HRLL;&YP((^=^[eU9>V,6CP0XRS18(Y:CQ,4@9;dKQ
89S9Z/Fe/20/^X8>S3TBf1X]E7.#)M597P1@a6a?X/ELC7b,6A6)W[_J_35/M.3H
T\c&3A^J16b.8/4G>PH4P^O+W]@1BD=&F1g).GG:2e3/V4M4AT43P\^+7?;79Y-6
<.bbP.F\5C1a.V43HVJ>3I6dSd2TERSI2-:,ZI[I.XO_?;;LcGW/<3d(+^+R,)W-
3\H@cD9Y6CI\>=)SJDGA4[PSXHYcWCWYOLS(ULX,#>Gg\c-SF3a0+NCDfXP3N@1X
\]@eUZ;XX_fPA[)+UY)C5+EW;<eB>GQb5_]SMW3<D@AV+G(\R;E:N>OB_YG1H-SY
0DC]PNJ)VM)X5eUVeFPY3b903L_37J;98=\X/+/5c]9+?ZGP20#]MRWdfc;__U:1
6f:_1FBJ(F&?>fFSZVIM#5/M\&I;&A(\UM3Y)GOESGg[4)b6=.Gb9A<TQ^>ND<\a
#Xd2CTI[:_X\V3=2+5X0[KQFZedBN4[1bT&,[]J]]AA?>-_/aE+?]eN/gA-f8YF?
0&()(R3(_9SU].OB,V4:4S7ACVgA3M;H+\+6@DU4P@gOdAJL6RYT:EQ_a\7PW3:A
VW(Yce<;B_gBB=b@AGBHHCME1G5.IYE@L07faH^YOX1(/&MQ1HJ<cW/Y-B&@?gGE
W106T2A0LM:cOU+]5).cadJH9=g(8P<(-6M5MXa2T_e&GLHB4)#H9/0MJ,75SR(\
Z\KWFcF2_3Pce3S\<eK2eOU<9>3@9C&.^+ab]@#&H3=U[9^AZ94M[:fe)aK-(_]Y
0/ReJgA<ZS8(-f-dRVe54LNKIPQT/+,H?(A1HS4AA_[GbH9,eF<>>SgBEJ4LF2?d
N5df(]2_^\Y[T]V06GUgDcJ(eY,9WEX4db4YX^e_EMQ7cJIb3I__O)7<HYC>YP]&
AL6J,^RAAaB[d]BAXCKB8/K\D>[8U9g=^>dUJM)A;0THg)>IT>MeUeVO+^bDU7(5
B1N[1MHgUBe=6ZY&?@E,7_17BHGScT+>^1<RDRA6@+^ILge0V@ab5N7BZA3PdVF5
aMJ#OSZb>D&6P#PGNFPJ=R_#_ZM/cF@<f1RD<@P:6&63afR&8)H,,)KXH.?aLNF/
e]N5fU:7]c)8E7=R&,eg14FBDeZ][g\3;]M>NAM3GZXf84[0W9Z-a/Q68(GT4/QQ
bM.QfGHYSQ.R1^e9_C3GU[6[,2BMHg>([?R>^e/DV5IA\>H3>:&7NH,=S4O+I=BC
JEM54F=BB1,[2YDBf#?KI,<-#^8630M(;UPWA4\?[3W&I?bXG3Z698Z0>M^@3[J\
L6I-1Xd?@FM-RSBOGWBIMW83fAc/LVB/[/?e3([5/7+ZD67d?7>:OgBGN(XQeSV6
(He7EJQ)4L>^NVS][\.Na,gb85-OC)KA]&J9OL6<]N_T#6([(7b0CL+HJMTQT-[0
a\a&UQf51^b&98,U,caHa[\:Jgbf2WeO[QHCgec#bCS)ZQWL&;)N7YIRH5KL#C3@
^4)9F>d[>:\.TfW1MLDP(P)aeb<[9E<g:Hg.>L5KBSG_]]S=IXQL]83KHK-Id;DT
7.?1CIW;?ReF/0D6_g/FKQSOa6HV[KJ\EC1dUf6\Z^bKH,A\,14<;O00>(Y=fSV8
KEXIX[EY7^AT/E;4Cd0Cd>:ff<DOZ;0;ZTf128M]b].19GR3ELg9_\JJEZ/f-&8C
;0/I@?6,3)#?(+C@[cVQQ]JD.ZY=9Z,?g;8QN_14GBcH1TGFG5XRX/eGJ6[UR-Z<
?7,0DFVGfL=(ZTCLP?&@G=T25G7SAF)a-S5>/Q-8NGUDP=6IXgYO8d08]Y.Ua&2X
=^S<E6;EPJZd;<NGAEDIS?0V5AF2->UX5/5RZ+1\M\4?)JU77XdbIfD)VQ=dV+BL
N]9<BI-6H4F+ab\cBF;G6FR(gO8;GJRRP(U2b=F3VV:OOYGPdWZH2WX>4V+>P0Z1
=9/H^]Nb-OZ]9XRAXS/)9;YC3)8GZQGL_8W8=g(5L^AW^LSOHXZ>R95<>G](,<WA
;C,P>\47<3.Kc471>.)N++&@ba<Xd6H;15(LfdN[@Dc80c(2U(7TI.L-R2,NTS>+
:Ve20B>B(&I8-MB2+6^(3V>,L[BSG?9.bWM-2@INOEKN]DNM9eM.eGg[]=&)/1J>
X1,#J:RNQO?CEPbMb91ETP:\3.L7UCDCAeKeD<^9-OY0O=\Y@ANBa;5T-8eb^.&?
Eb-e:KI06SE1+_CX3EZ[)?4,Z#cFb_XV(@b[B.IM(1<75ga(,@JW72T@e?K[=;_F
f65_cF2S&IdS]6#-aHE^#\75=0FU5KBb#L<V7#gd:7(F/aa1A26#eI24769;WK5Y
(WPcHS2<HST-Wg3=;Z=.JgE>AP9aL<c@5VR:NWB(#NeF3,C-.J0ZT(H],@=e=;3T
MbARNQC_Q=N;<T0\.Y\J1)L5f8Q:X30:#ZF&VLI(fY9;fL-DA&AO<=W>dS8D,F2d
Q\?B803L9>W2#WdT@WVE9Maa;XWc0aB25\G^H_K@J=6XN;<M=#^F<OC+bbd/#S9T
c=Q\O2HK@HgDFEH5<MZ3@&MGT?I-<M4]MF:T9[Vg5ALG6\@#YF&3S?^b9;M:fV35
L?E-:>/ASC[DX2JLRT6[9OK^e;RUYMG1#_<#5:LZ>AQJ]XMO<g6dZ3]J7I361eXf
55INGa::P;#A<0M+cfEOaPF<JA-PW-KVZ(RLXDYG4B.O.ZHRVS;^:+WPY]ZQ1B9g
RAd82F+;+]99?66.6RZgJ)#C&PU+O6>?W1V<J_e6MQB,;:HL-GU:N)1E>ge7R^:C
JPP.ZR)GP;I^/b+6<EKfg]FV?#Y4&/GE<ARYW)dCN6K\,4KcIT.\ER;#?8_(M5VQ
U4;^<;F.+a,&F6U-0L,_CF[.BW5>:1G0;31a-R)[M)?a0A926I[<4<3&TdHPc20G
4AWDeZLWVQ#g/](?SOZ.a_,^KBd.eIS>+;K5^3X(C6Z8T6=TeM284PECK=M:R(GO
5A<115aTF5@IeS@eMQTA)R3CEMOLH&DWM=MEa_W?#Y]g2@4^?H,/5)fZQcB7:#d\
b+f2fGJUB8Pebb]F;aVD].9GNE;FTSJfc?:J&Pe3@/fc4##M,Fb8,4;R1IJRCUS6
O]WH26(Y=PW,;37Y1EU<+VZ98M.20GA&O/SZX>J8gUbgWe6>_W@9,GF0],319Zg<
>X#/05><B@8?3]H43.Z_fWW8@7QG]>P4b?&,ce&a+5@XaRE>\KCOYI1a3(^]a+ZK
FD=d;\bN;e6PIUc4c58;6g=\OTg@\e-JY8CVfGQd8CGH]#S2M3AMIZY]EZ+=[H01
==^G_958G>6N#fMP4C9-VPG@TYD?1ZVR(&IcA<KO=)7NG:a5=U-_(P5^5OVW^Q<X
WTNH4?X2+/[EBB-L(,:f84:U[Dc6.Z0f+@VXbM,[1T+\g>4;LVId9fJ7CKeZ94/8
A=U<(Nb/KHgY8fAY&O8I?NJOW2=62@)D,X>79FCD-B[6Y9S>Y,Z9,(5CbgaPNBF#
Od=;HX2^H5cAJJfbSYGb<DaNc-XA@TgLX4cf/aBI/P9SUAA.T#]E]/LIBJ]=FJ(]
Z3O:)Eb96c==XPGT-3.Zaf:b>7X)P\NHT1G??O][gPABLa[S-C,S<fLU@>b9=G\5
;A:TX0:OF#3YC-NC)d[#DWF,.9M)2P>,H7?bV>Bc#c_H,&VRRF@R]Y7F\@ed-(3P
.aG]D/#O1,,EEZ1BcGGV7\-?WOMFD_;B<AaG3D1)b_([G:6,O,9E:g<F94WL7WFQ
C6G2/<G6BDFUCY1JePLg3<-RU:9ae2G0:UK,e#7=I:\EX.RfeI2M]Lb:9_\KD5H:
.RG2TN9FY2TOR+3J(@3SZfc7]L54,fH?RE)7HPQ^:.E/16#a:c9FM^=4g5RZYGOD
+-egCRZJH,:.9;FQJCG1KdC=_38gJFe],TV4/T--3fCO=X9NWJGD>HF5H8WKa4gE
<1&feaPR;_4<Z/SDDK>gaIHa6O-\5gf=IE5<#0D_Q>8&9LD#Jc5OL5bU/4b+NTT5
V#7^JEL)S493@Of_4KLCL5c-?\(;B]<0E#&-((&TM@Y4TE+-Fdf>UBRW5B3QRI_/
,;/b)_#?d4G5D#[e[MXIb2W4IIH+0T9b5c):47cR0gK<+T1b_WeVEO6Q6[8>/+e-
cCR><OgAZaN<Z,WbD0(HTS/#LA[@?QPVaf04a:V@T,QCad-ICJT_LHeYb9H\:3-)
8gWZ@;2S_aU3(D<V7@>&V50O:e^;=5N>gcJ<V4(0>RD[ga#1XXD^7D@2ISa:[G^V
3)]-QTbY-OdX\16W:==^O)Wf6J#RMT#2/](O9T_P)./0^:D/=2H]:=RLGf\C^&<a
[)6.aL2[@25++/4D)GeV.,[HG&I(OKQ3UEAc39)GEe)U,V45B)DB;#e]=0QR+Y-A
14(fT-_\IB#dA?T11SOY>LCNNP\Y>.f&dZQVS\.VBH^JLA0W]8X3WD5J@),e;L]D
E/4G5TS5S\eN>499<<bD-DfLG617fM.H^-(T>dc/b4Ye3=CQIVFMdC^CUTH7==>O
bBS.ebBI8(2IGU34BM9>X-F1>2#VF25S6+X;VfU[BWNHN>VE.\bC0.F2PBZRXM)c
L2&7EBTeR9RMT@=UG,,OV_P8d=#1]+L]8Z.EMUb7)T<9e#bdf0Q?b/@SSeBVdC\)
==DE?G5KYCC,C^b5@71cKQ#^;D<V\@b7D0Rf:/Tb+TQ?M,+YS-bWCP46#W_?=L0T
S@aQN5AM9;G<+Z3N:C<E^7D+KQg3M,L39<(cZ.\[U)M&OP&BI7M#\5PL:bIWV36K
FT,W:O<POO6D@G.bA>@\.,,ScJ<d&1GS#:9-FR+X2UVQZc@[ZR1Q@,YN(YZK63V4
aPW5#-Y@RdVg,D@^eX:@73I:.>/SaXVX5FG61L5P^1fQ,eI:0=C#K1cJSa)873][
^_;H-1,]c\g=18c@d]e7W-;\?bfG?Rd&X,a+/gVYV5:XTPJfZBE-:3VE3Q7]U,fW
BM0@I2K,D:3HEBBg6D@O&S@D/AE+ZY<Z9dJdMUV/01UITQfDXVf[5999?S@=a8\#
_)>TbWRA4g2.TK]?0,e(9;S^[=Td9fd:3<YgQ7C.9+/4H9Y#c8==;V)NEL3[;C\#
gEEge\dT:MLZ59+BODNMW-cUJbS?V,(CV8&PaP>ZZ\_QBIb5&ZBAJFS5Qc7UHB=X
F<Re)SD,Z]11U[#d7fb6BUa[(6/^Ld@E#=fZ9&fZT0Rf,FF,:U#S:7YN>8/VdWMH
<Y>HcbPR<Y/?C^CYV04#:KX+@BYQ@277G8@?.F5Q,Z&@GZN/YGSMNdF_cE6(^W:8
^LDP63N^5MSg^^]PEJ.D#4Q?R9?CJ\,;8Y=4J<,RF;W6D#X#A7XPC6T)<IJKN)gY
e_)N5&9N02=JZSCU_18?7d-+6X>7^b&1Y/<MLd(8=fW<Y453fc)20Hd@M5-XcObX
C=BA=b-(=B&M#dOQ_L0F-VBWZV;9]DQD1HDT[a]c=-;T-RF;RRI)g#25A,3SN?:]
27SI1H&a\P6)0UH8^::\2VEX)3Sdc3f&.UaH\H/W,K5=JD>,_8JXSCO;7>TN,.82
a@::0&f&WD7)T;8,LWdB52QIGN?F8?\=8OC&29eAQ(OBU[7)]08a<.IQFQ\332.d
-T^#F+V\KDc;e.b8EI8/;32g)-gK)X>HDKD/\f4=DC_W4E;MLgL8?SI9f<W,7a_V
,9<dC=B<aSWd[3Q>P>W;KePd>986c92fD25+geJg.=[QV[-6.#I;)2?EW&++K#C6
ZR-SMI.W07YH76/EFcd0FTVQZN?1PN-O[T?6:5:1/H/2@fVdRb&KW/XP=FT<)0D_
B6J0[M8c,G4b6XbNeaYFSR4UD\V^>BZb6aDZg:7,P+)b_NWG&OO(@a?QDX_gPf;G
++N->S1\QHE8U-AL#aFb4_+-d0K=c>,TS)T:+CVbBCX#O^(M_g[<V_N20UJLQK3X
4U-A5HIHc5eAW;(&;YG=\</BC;N.f^?[XKXN3a,bW/>UPB&ZQ&<b6K,/,2WJ5cNH
]X@FaK9g:-dR.=CA71TUYR82YNg/QK:XVQDDfEaF=3QV3A12db[7TRA&_ca2HYHg
T@Rf7JKbW[E]9M&SYIGMBI;EYOKCUZ2A\TG#CZ(QS>&P;D9E1ES&^a?e4V1</&(Y
JK<b/RRTc3?(G,(ag[2QF)TOU4Q)012V4Z.7:/.X8eGT_aG(LV9\=H(EI-JLN376
(YGH,K_2QRQ,9OAg0=AG0.JP5P^K0I+L_f[Oe^S]?,;\K203b,\0.PMJ;PC>>b[K
eW<<&WZ/&VHUZ=.8,]WVf4B7O/b4YWDUfR9bDLP&5\N^Z.HP.5eUV/+&6XWLC_MG
:)+>D21\F@X8L+6(e)7UAF:]9-M?KJ>aYU6=EP5PZ=Igfa3?LSS<B+5ZYQ]UN.O,
>=9XEI;5,SaQ?1@BIfcGa]#@5,O3^c=A3X\Q-R8<<_2g;E9f@cf]25#8RDI>F,/D
:A4MSN;)II=:,MQ0R,7eG2EaAZ^WM_U8NbY>Z)RO;K,@.2H.J6-:8.bGR?>44,d\
NE:+eg9]7La<fBTK?(I4&JR)8,Ye2YETBG0[,F3NZ8C(<^HQQPgfTVSC@],aa3#5
b.<9+=]R53N[54@;dMgAN/OaD>[,9[GM@:+=5ETNP9Q[F?NPe38(gZb8a=dQdL30
gY+e(F3,TVR>QY]]49Q8._7FUE93G:_gC#[=B.RQ(ZZd,c?6P&S@I]OcJ2G#W#UH
,6aSa5&gA<O&b/YP17POTP7MDC:b2NBcS0,Na,V&\CQGdV\BWCIP96EeK_I3(O:8
5bJDG1FSWMJ;PaHE-&1ZL\OLHMLg+Q\/0F=^b/H.4b,[bB549^6VV-B+&JA()L:d
:TB5^G9_G#@BPI\LC5TUGfW?1.B5)\..#<DeX5=#Y^M#8UU#GE@TS_K50B4.-2A6
J/Ld<-V.7V0CKcd1P/(&0/._^SZGa2_V?:QN06&E<LA^Mda=)F9G;.^]##S4Og2;
GW:C>Z&KQ.QUagRW.6c/)9>21B[>@K3K/;4P<R6dagc/QEC+42f0C2_@R^@/9X^M
05C8U[a_HB&FXITBA)?CcLe/.#\&&]TR[a<RN2W;?L<PPC_WPeb<J(5=XSY7gOfE
f#.f3M&=Ld_467f.<F)9C?>^I5UUa=F4H&JcbTW@dB>BJAa:D^fX:J)bf2]Y9&Zb
e5^&W+VE7TWbB#e0HGQ[Z.R79EH8=2EHcfGcH\#[dO[<ZdQ)F)&4#.4X]d[TaL#0
a=+(58YBT>g-(_+=<3W=<QE(10)9HLbHVQCBN4OZP5Vf:+-2[U:X[3Fb=-<81_7>
Yb,Z6<#/3\e#RB\27??G@\(3Z+bF9-Zdbd>ecR;bcS1^(AWbDF7^R_A@S41#BOR^
O/a]fU1;>\9C8KN(V9S]^23EbQ&8@V@A0\Td-L<1KCZS1c\S?=,dI^4fI0;M,0_;
ECZKgb\-<f0^0THNUS\eR=BR;WU9fAGXEU_15,)_..A.4EEGTdD\J6V;<2DU:_EQ
c/<#REa=_KGY+J@&bH+IMO>fF#Tf3=;O#@8?aV]QHP[MgQ8+M,4MU428+6QUVA^Q
gA.bCAOATfN7XX_D8P+:PXDPD6\FeW4>SO7Xff/NJW46M-TaLc\9F3Q0WW^0=c+7
CD]7@]#bDf[:?O7K5=_b,K@83OTSFHXeN,:Ob]MCF&,(EaPYQ87_K\&5YN4&C@65
0Y7&c\TPUFEYfAcSgPQE/DBI<F/58Ad/M(;G>.L8@CTW@V^T>FIOADN:/7P(I,\X
Y?bXQ)RSM:/LAg51-B1L8&([T5dFg5(>KFe6X;=-@P<2K^WK<,1PJRc:#L,eE+5Q
(4fX61,M]?:O8@><AEC+SBdR8>,8JS.7d0TVP-5#QP=<WR)f.L1^4V1DNAAQ<\2A
GL[O&M,07EO.9gFGSH@WK\>Bg5(G2Hc3@g5JQH7XOR?Q6WL)-GU>H3I,?Q18,,MZ
^C[<)9IF&XDT9+&WF+3&M(gH61BFK^/3MQAYb::V)]e>Yd<4AZM12T^ZLWDbK6[T
JD=BSGA]@.?AeGFLZIf6L<fM)YNX^bcTcaQEV_W<\KZ>TIYTZ+c1.XYD/:(c9\TS
_7X1_ZNO9,BQ,UF.Ef:Q>HHZ@FSR0A;8J1JbEc06Z=#DRJJ.Y//-XQAO84A[6OJ=
E<B4VMbZ8+U8g-IN2]IQQJQ+A[f8Q4FgP3>P&5#138)=)fUJEU1-[:)OMBT<V+T#
-D>PSbP?bH5aN0ddBI8ID-333T99LR&)ZEIP<2N>QeIRTXgL;dSd4J0HbU45G+MW
JO47#.6C9QTR78U8f1MAg0b.DD)KHL)YL84F?a5WF.U>K84)YIHT&F)^+_.Ja5^P
V/67<&7DX06f80F;V(4E&1MHTGC_c2678,[^)CP6cDR^\Q,N:3I]X0Ld6>TCY4^/
Z&3MN,&UJV#ZFG^+Y?;BSH\9Q,,10bFDJaL)VH[[-KgW:^KdS4PT3A\1VLZR38)\
QHBHc8-^#_1V,0.<Gb>79/XX&CRaPWK<3-11KVV5[U(fa51Bg\-M_)S<b71MUgbU
6\U#ICP9-4CZabR;9,Q70.#09CC/d1;2(Ma.3TSW[S+K8R.V8U1NFUV)Q^B,g(-6
>^W@9+gM7:d6#@JCFa#M(C):5U80RIBD/<7VT]^TD-Y<#/,K:4#WTf0JE=;f#<B9
S.1:)7:f=NfTH#fD,S1E(W>N#P3d+)U0X>2;f:D7dAGg^TaLEbLQe9bJKfN@bUT+
.AEg=^bKM.^_>78[V^g;-aP)U=^Y\eGN.(Se^bUCLf7N5@O3e9P80LZ-++fcBe4W
4\ebM<W88P)&f:8HY>^TU/]#+(00dR([96V?81R.^,ab8:;]O94>.U6WN,]ec1_O
cY:Q)/dVUHe^J,SX0ANB(eBE&(]RB^7X@#fcTS+&CgY2R<aT3HH-ef@E[KB1SS^/
._(F\14H^9.P/0?O;L3+/@aeBE=JA[?K-Z=]&aA?AT2Z2DQ/4J38-2UX1M[_:6G[
JDeT>E:0e3NR9^5G&?6XbYDE/+KVaRQR+Ycf+RRBO#f,_3T(VZ4(MeaGBQbW)LZ_
N1)@=@72b(>e4P-9^2^63FP]OcZ81N1GACBENMPCJ^EXHed:dU#9YF,&O[KLH+V-
F1:@&/@Z4^bb=Q-^Z&CdE(H+1=.5fXS9e<=_Cg;OU(K[/e,PV1\9b?)&PAUe/ZVH
Q17._KP@geFT##9;H\HEI..;[-J53RQW1@1J4A^&?=1Q0f#,PP3^_),93NS)_EY+
2F&)TA13[YR@b221UT>]A<WH]-;K63(e\0.HVdA/\ba3=,J:=LeJCG28WE?1S?3c
@03LS?Bd&Wab.cI0aKPO^(W2fO(1cE^PS=V8G1fGI(9CS@PJ9H0)RVB\?FO7EJJ#
US4GN0+,9DS8I\KcMeT](Oa<W?952\;Ob#<W4(A&PJB<GBRWE)9]CY.d<7>+^JQ2
HeH,RBDAR^5.d<^_D^IJW6/8OHB^HLW>FQQY#W^CBfeIOZ,.CV4IbPOHg0gAVMS6
#\Nf@XSeWNQce(1:da#W[;S&M:C]H,:SRF4MgU0]=fUP^4LJ3L.O99C^Oa?,>:),
4MW[f=<cX:@O)P>]&ab]#=;1e8P/;N-eg3>8;Rf,YO_0=W#CL+K@-J=NWHH2D4HA
:<bcKZ7V[59+fH7PLa.II;L09)=F0WY6\0)ecgNR<bEDI5JN2;cTQggR+a10_Q\c
[;g_8@8@.H_&/L3UVVO6fL7E@ASEZR,Af[UUXARPeO=-[3&TC;0&PV_RR>FTM+AC
6D\cQ8I@S8:U:F_;B>,]-;Cb6@^MXKV]aN++-#,C9Na+Je&(,CYAg#,2/JR,^;D4
5;[@IQ@?JPgIN,]a65bK>LJ\gf^^c:eS6>QM-Z2+<2B>3+Q/NN]/2HM\:?8X[cYL
abd6-VeaWW>4:YPLAT@,_&;2d>3Y@8D3P2V8Nfg5+IW#:#_DD<[fa/RIg_4&Q[d?
NR;^ZDa7f/)[C+W=24G7B3ZBI4/K^1Ye)OD-H5a1AU[AGaR-GB22Q+6\gZFV;&+0
eg&fVHAX;_C^7J+K7J,OE[,((SXZ7=(V@<8BQDJcPOB-M]K^OHS4F&OE/N^?WLfG
=ER#BL2^bM@T>XC3\9JA1L;@C[T-gVF\CMK;T5(eDF(_2L#DGZ/-[D#&GI93aN\I
D+Wc3,Uf+46^O6[cf/Of:.@>F+M@KJ]3c,@DNB[NKSO<e5EMR<9RV6COQHe2&]GZ
M@:/9M--Ve^B58/a[IA<&@Ye2\-V^e@Dc1#e=_@QI\8WG?\J7.3O,4f_;gREHTT=
M]NZ0,F(KPL^>g3;G8=1=3+^F,3&W&,>\K-6CaEReP<fU:dZ110CBGO0F51TDUJ&
;/3^21bLW?dH;NDd+.N>)=316e)g4XeTIg51N\E]@]X)C5U;AB3B_?2D[DaOccKI
d2ad(B9[\S3/M+4aJZ]R:I.ILM/f?0T8e80D2SOGBHDFB8gT#6MVag<R;cc&9[,9
4A>H7Lf:;L5g9&LJ+g#X8J,YEM=^[X6BRIO1^HaF=767&6Z+CI^[.[eE@=/X.XJ^
Yb/Of#@YHLN1dS>?1;b-@QZZWcXMY;;0-+#6.SW,Q_X,gSU+;#>;Q7V?+8&S0dfS
]TP1#;8g;Z5Q^]X@42Z<@]/fG@>4?<b0H?BT)K6?B_K#;Zc\U]9[IJOR0>./?4;.
8cZ\GU0?6@-=>fD4H40.+>([M)Ed[2Zd:I0/P.[Z9(^]=UR0V,5g/>B0b?QNXXUU
^X3YgeV4F#X\Y9L7;RV5B6G3>eX<&6KG&O\7QOL]b5UfW>_@S/UQ+,(KX@]g18ZU
Ug.cP]ea^O5(7Y[cdWdaN6/P;<\-+KWI#-DQ#6^<?O(fC7MV#E/PZM:XBR8_V<([
KK2I]Kb^=NU6DNg2#bf;QAM,;+,7LY+/OR:>SQe0#c&J34.:@9DGH42c:93g,V]6
cIdUSdG1U8P8BY2;;CY(XAcR557JS]5g\d7Yd)ZTME,Z66/Z;D[V)6DYG9CTH86Z
U#^H;bWGF:JA&.G/>+DLa[4OOFcSUQgFQbWaA+EBa6<0>^#?0T4c7Q]8N1]1=beI
^IIa,E48>/[4,Hdb3ETZ6S@?c85I=+fHO=89d\VNL])([;Q[cUEDJ;1c.PbGL8Y#
E5^;4^CC]9QgJNM>c2c?(UUZ]+,-K>b9\:c5/f4>2cGT0HE::;MB:LY,I4[eT>Y4
ND9+B?6/HAc0D7JS9#^gXC,>e;B=;TKT7d0Pff5:E^:]]B&PAN87UJW4;NH(:?K9
00/I&_AccQNcCd=N.IfVJ8JKLG2^)5M7Q0DZ<QfdLLQGAd,4(VPK0)_G7&I9(ZVH
3H)MeA?6Ie0[cdbI\eGe9J0=K-;)&PB6H6A5K&VG+&>JQVPOXQEGFL+Y^ZdMWS-)
8/VV/^WJK<-D51]#GRP@Fb3L18AdWc9CX9Z0Fd6&[3)GafZ,-&:ABF5ISa9:^MT9
Ge9S,,aKFNBACUE>@&5&59YG_@e1DY[,Z.d?c)5XL6ITVP[#b)1OC.8F0X&/.CZd
f/532&#&/Eg+/G7W[3C&D.AG\W+67>&07,X#IR,PD9+_Z?WQd,;76VRWX:M4Uc0W
/4FU\eV9c>Q]EV<..OK7T[>6:5:HY]N(BV:+#JZDR2+_&+J]g@I4C3gP&T?5TRL(
4EMT7GDJDAc-&MPN;fb9aJ^=N5Jb[b>K[;,[15_PP\YNI-]UP0/D^I;1&IT4;G@(
?dH2?ZFPDI._UM8KWZ9KKHJ7+2X)B<b^@K0eJSJ,W8c^G^H@[[9IcDYK1N<-2=Og
JV5b1MPUDb?;GM/E1L)E^B/<OG9]]fFcdFKUQFG8&?^70M6a+^Z7[F&C>1.S)G1b
6BZ<_PCa20PPW>1a1/ZVYXAWaLM:;X>e=/J[4a[6)_,Z,WA6T(O(.S+=Z2d<6ODF
<X-PW;YB=0V2,V#2KW#,L2WXP2_3>bQ;EW/W)YaU?&Ee=RGLCYdB26F,=)G/;/7[
@A9[^a2g23:@7M3]=-C>9?VNcaY,+K>H0<PKf_H9eSbb./e8gc<#?47Cd6CTa9A+
>B11?f93KTd+9CYcNUNS;)>=Fe&=MF.,ZF;?0cF4>SCfR\&U0WXZFJI;_?,79aJ6
,F8(Qc+700gGOUWU-5S,O_cFOQ^H=(YcQE,.U<:17A?TES:\R/3HgQc,97JWOV#+
,Sf5fD/a5FOaA4F/+^6#WG9#Z#f_I4]94O;Ye:MY3Q@e&@METQg3#B4.c[cUaI8<
@2Ufc\<P9g2gR/3/:0KAWWS^.IGW>-=K)T633gQP>g0HT_<(3WL>1>,UL))LCRN&
AN9?X&><(;OAIFM5&b2BJa[T#EH0NDWQ4gVfAQMEUM1GX@TI\f?(Fb2-Z,@Sa;P9
\X+b2+:Y2]Hdc+EaO#M#gZO0DaNdSea@(0b<K#Q@Q0FOXBJdP@4aCIO:WbB^Sc_e
9/K?S+37(0.W,41PNg</^88.^,^8TI5E^])<PeHG.Q9;LLNTN.7).W;cO4[[M9P0
e5_]S?&2XP?M>)KT;O\;4BS^7M6^M2CI]TdG6H[.I-2X-G=\bL\FO6:^G6ED,=NH
/O:a\==7#FPZfE@7eYKR6g[Y9d8Y<M[W][Dcd&[Q4T?T[G9cGFI0g@/#Y(BgZ&V=
daO>MF<KW\bddf=Q;&7gOe#]+K[dcFD+&XEBgfY>Va9S.AGZ:OL1E)M5@DQE\Q-N
28(0fC9YagKSVgVgZ8FO1M9)4T7c.JGN3ONdM)(3A[-]9?OHAV?RAXJMY/f,3?6U
4QR/(CeJ?=A8693E?_ScJ9NPcd]RWUF)&1g7.=,##OG79^K1CM=VL&Ma7e2Q+f.T
X>59@?bU[);/cQ0V(WW4J=:LGZ^]X_N\64/W&\fVV\4f#TZF0WKeMe[Ig7NOM#C,
S[WNM,:I8Y0\F4)GFTYU1BGYUdC=YfaX#IbgRP-e;Y.(:)3E=-86\PVRP0[\,Z0)
(g]57F\[4SIKca=DOW-&9BX;\GFVK0;G9MWa&G8e6<(SUffLZ9eCRbT18+U0+W+7
YCS-F6U&a64eU<aHFE@c@9d>;)AAEXHF2YZbA9@g,39TY(^WZW[YPEZda2:)PP>P
S?97O949gb2OQ[A8J)\;ZE8/WW@[Q(W6BO=U\<6E1:@eZ9bb_\\C_U\^+N/H5RBQ
ZJRb142RaKKN.H6f1G0&KFE0;10/;,&S9Q(@\PDHUS<-O(P+G<S)Y;be;fde&RM[
3<C.g&OMCaCMU2HC<[^8cOL#7K5:8DJS\QCX#d#,8?HN2/cR873]G,@gd::6=U<3
WE^DM5\dZ_#dHDaOQ@f>I#[<0=1]ZMMD9:H7_f64#KOQ?^1\DR>[+;W72XJBbVYf
<OE?F11)<3I:g0^;V,a11@+=ZOZ1BTRF\XfPUd45MC9W>G^=+]\];V\Rd)_28aX+
cZ0-OaLH^gB&H2addD40Eg3E#;A[7UZcFTE#UVN7H+1B@Ld.bYWNF?D9@B6[RKdP
CQQ#VW7RMeXfc--8+N4d^9P<dHS_4JPa+W>PNb+2-52#c69&8;]DIDI#ID9,Q.)E
]DZ,-?->GF@CI95^K<NHf=X_gL>96E_KcQM+f>M^@4Y1=E:4M#0J\F6FD5Q8+_-b
&QI/X9-BQD5VCRZBX,PgMZWVD#DcU\8d\KP8-;)aE/\FQ=HH9S;OR/?Jd+@(S?3Y
GCTgM=M<]LB_A&_=E-ZV]_(8&b?4.KRYgIIabYVfOd4Nb5E[9:DU?-+.>_V,JOg8
^BO1YCPD)GK,<I\>(FfL==G\R\W6R/J;T,@L&;XAOTI[=a.+@G<>5]]NF)Ocgce;
@A,,#afJ-P[8D^1U2EMT(#0QeWP),Q5g6+aabKWC?6D2I,?K4E,9>Z=UeBGBeYa6
&@?<ALE/50a+PR>8=3K=BT;0aFc0+&)1LOU#73b&)1[B(?2WgO=51d(#P#B4@)9Y
N1AZW)6FC-81Z0aW?XKD7WHa6=PR,LDDB8e1]M(E=IKU]UYP^Gb#Rg-?(E/d_2fY
c9G/0]eUILbS.GfcTMENb/dFc-,D3[LLVKY1#7)^;B6Ge;_>BZBD6.[IV0eBa3/-
X:[JdUf,A]77_963_#EGdcP;NAV&[99+(fA#dRJ<I/\:ZIOV/?ZDYL0.T0@CUe8S
?MOY=OY+UQ\LO0Y@>\]+=E?+A:W^/bC,eFE<]QU39F\5D.I@Wf#YSAS@AP;2GHfJ
#1bFL+0CA[VPX^0W<-@<60dK7\R,TBcV(0V)G\XeI5:C9a(:FeLY&fCENEeb.7cW
W00R8c@EDOcNWF;X_K,MQ3D,S:+_>YRd<Z_aDC:0fZI(#\/fHTBgJJ]?6+;gH#Xd
gD)XOL;K9?[ab@\bAR1Z9#N=B])B^O(7#4N+DAR5e5E>4QVf>8>Z+80TSPC..11U
TKV/d9<I8UEYU,(<8&Pc=7<VF,^@.9W(W/;EcgeN3@]=eO<VI^MJ1P1BXMGC:NDS
YZ5V,F+&=+&)Q/-5++[R:3cA;;E[5C<5^>3()10g(3Y/d(&dVQdD?@#A^#Dd2J&;
[#K[8EWI[&FXA+YWDXe\A6aD4_880>C,/@RB.ePJ_2/E2/604RF]+D2)YCNSZ6;H
T8XL-R9S#d-3Q7Kd1dAJa,8#BcX=#P<D?O7T.7Ie>IRCbXE87bgUdBMRb5Z\B4Ga
]eb2+cI);V^:2=DRM,,6/4fT@6-7S?e042&,[C95)IR1d:?aJX^e\:EV.KK.),OG
NI<K2]ZD&VW4(X9d90:Q4W/_(B?#&TT:Z=S5VIN37E#I>L<BAH6KZb@1D57bUS\E
_=.PNbORL7dB+#dcX6C#MUd\,,T><,7KG@L>:AU.\,CR:=4U>gf>];0Y;JZ\LI\-
D?<[MM&&&.dOEbO\H#GWTD]<=@=Aa^Y?U80.JK_8E5DG8<]QY)THO9X+5fgXb5,7
,d=cO4X/23?8FUG.(NYK-H9:2U>ddXc)DN@IW2_W;6J&Od&?:7+J/PPZR(dA4@)[
90;)5]+_B.Da3S1>[CfU5<P^:EQ_O_3^;4dY\J;XUO7)[f-@f?9O[,gP[K:YfM@g
[@=WbLG7A0aWFL^eKN]L/f#?a_W6A:0KOaN<&=LS4@+bX_.1W>UGRYUEWJT048.[
2b.B;N@.7E9fc@C2DVP@>M7IHXYSVXKUQO?@)9J^PPR_QT?JZ-4(7e/6?E>9/]0Z
&<RG_b4cTW6N:]XH.>282OBagFYBL=[C]5G#=5f)f::D,3=eNNJZYZbe3)@^R[F/
/XKA1_?-GFab1[ccRI=,ZcG0RZ@GM#(5612;;,cC&1&dIMPZ6/@\HeET#cV[.TPP
E(6?QR\bDa6MA2Za2-He5N,OA1>IQ=(AVU94F>>NXAGf=AB#WQNeJ+6(7,(R^\(R
&8FQ,cWA?QR@XO4#AAK+cb+CTJ+NFJZ<772BIUK)6F^M2OXI#R9\7aGRVYWME@GU
_/MEY>)LNDGF&;QWPF-7LJY8JZP,:eMQD4Z(220F=XIaG:d57X-f6Z5U/=]TW>Gb
RDeQA-#IL>EDQJ9>-/d@Q2\#02=E5-3K^gDU9^U0.E\#Eg?UK_L;I?]G:de1Y^A>
V1/?7=[WE6SU?LM#U#5Q_@gO^8>-W9TR8WIUA:]FZEbE5,;(Y6R-TJ05Jc@1Vg^K
YKG-Y(Q9.1NAZb>bF3U=Q++JN>-TBH@HTOg5e;S-)f=M:])0c:R1T?C]O;@_/AeX
1fLc)S[.5b)CDVDPHZ>EeJ_YLA_M^gVQ;WMg6XDJe/-=QPC=>6J-Y;RIE_+<IT8:
S>CFHBWeW?9-:B=eJ2a2:]HEWg9KT=+BHgY])9<6Na9#?;.XM_8;c@\3:MD]BC\B
TS5XWe4-OIF:-DZ)8[)D=Z(>++?&7U1OfD\VdW.1BW?gD]&-/gUE.d9PDgG^5R#7
g)TA94DTH6cSEQ17Wd-PVAN]>3H+-<R,W@8:H5^_M>3U>JQ18dJ\<NS^KUIeAd2a
.0=3,+9,O<-NeTeS)eFKAe;B\5:LRIE@d&Ve.gc@Y&2T;K7UZAKb0fcFZZd]TQHZ
,K0]b<0fV3,ZC6H:1V/BJX2;(U9_e(<BX@eD6I)I/[U((]D.0#fT2FMO3RO;.]3]
WMfCR3.@#-+_S2Y=C#LLc6S(T#@J/^,ZL^T+<92HNAM3HHO)FbK08?K/WOQMF??&
,I[IS,L5TVg>3\3@H&N&cWM[PB^-d?_QVB.M^R3EN(e),FD7UFX7;N^+E[(LP-,1
\+N61C+),_G#VPP#;K\+W.2a@+.A:)_)beO<e?(^\\+.3X1gcH\;gg;-gL@43ZU#
,MR40;\V86fa6:?cb+78L/VF3b+[ONG3Q4>8(T1ac^H)MZ.S\QV>T&/d@2a\Jc+[
]/6\VF6\CGU9L6ALZ2Cg0O^5N5ZY+&H6A63M<_-RDNEC5=&B<6(Da+-F41E1VAb-
FfggccP;5E-U--_=:1=Pc<99#W<F6_8fV(&KTI@IYZ.Q&^bMMg5KKdf-6),EBa]Q
c0I4GH_O9@C67W>@;RJKbV=OQ2;(<0WP+#K&58S@[RJK1F5\JIIYTF^P+/6b-:Z(
8R8NS\(GdX6><K>9I9\MU27C2K4[,#44Eae4&BcE^NQ+G9cHB56eI[^CU+^DD@UO
29?M87C2]152MG^Z)0E-J2-1W>HfN:Oc2fMNPU7a8Pa<M@e1SBTK;HU?)7U\Y#\c
UL9>179;\E_ZR#H1&e>2@LHO/[e-H0FM9,a6DF>PD_6B2G1(@AS&L]VeO3ALbHH6
EAd<7GcQVRdOD/dKdV6CKO:X2(?>;dVBVL@gKVI)FaNDLJ<f/2<Y]6Z[>?;T-8?a
U&2\\]OTb9@5MAT>WCWSMObO,:;@GVSV&HLbgfeK&,6@IcU[-6:SW]4KJT;eLZ/E
59I^S]OLES6X1Wd_gQW5T9LPSXFAbI9WO_&bcYRZ.0QK45/f#T5)ON]-?X&K(Ge-
@N(-:=6<IBI?8ZKLW816&YW)4OS?2Z-YT[DA:gDNN[Ac:Qe&-g1V]3d6c>:Z;;[S
/S45)/G[&4:VV1#.OaV3AbPXM1.3H]1Y6EeW=Hd(G@<6]SXFX:?3Z.g017bAcIH&
+YE#RM[X\;UM@D.Ia1.g3^+/OGO[P1K<Y3dEMM:/W68G@/L,)X@W7gW^Y(17&&c.
9c2NVWgf4\-#WN&R;N+DaQ#>;^M9#V=E?S)<X7ZU1?+Ue7)c_gf1>]^,9PWGBLfH
/#Tg#dJ_<OR;FONfK+MSdJ,/G/@HI#CWP8R16NK>#^B)/+E?Z?[AE@PC]<4d:9;1
QBDX&\cLJN>dc[<KF4F/AA8dM1:LT#/I->MR-,<,RZAf&0O=GXIC)/2f>0DKR[&b
S&a+?4R.5YQ]>=b0\g0?#T?KD@<;X(&.E1TP+c#G)P[+,PffLaXI^K2<L\MZ4P+?
I4(VY_\^0\=g(\cfcNZC>3T#W.6&6&Q=g.LAK;GO+[B/#XdYLNfa\f@9F?:a1d.T
7g9YI<B1@e3=^g,\>7BXRDE-,V-Q9WMVEOTRc+AL1A[,M\OS4W,X=dNf8J@B4eU.
<AA\9XCeTGAN&G[V)N<@:6V>QS)PTJM\-3Fc^?782^(Z\cD7dMaG1A?>A)326-fY
cZE0#R6QNE1,.7H-AecJCI_DY_ffMW-C-4b&gG9-4FR9G.X:bR50P;<-\BYH2:Q=
K<_-MUf_\HS=X6>#cK<)H_[\JWQL#G41>9K1[6U&_Ed=#K9T3(/2Hfbd.85b2/D8
&YW,]=549/78M=CTJfH(.W=5b[^dY]O[+FZ<Ybe:>)QJYXYdR;K:BF:>,,6MD\Mb
e6]@>_)CbZ1<dTBI3P?;2gC]2fI]=-^#TK];12OPPKIU:TGZ56WWG.ebV0<5g@74
-]YJ_8bDY4Y2gLEX?3+bDR0TO)c:_9\eAR7[?KaF&ZR?A(+;SUaVGWB[[8RfDQ_+
>eYS]81E;\7EQ,-J&g/+5)B)dPeJAJI@3gZWe8W>47..P_J?9MEIVTcO2KZ01YeE
&H5:\=gLg+T&?&J\3XE#&@-VRGG/XL6NMB5VC1(fA.K>7VAd[;7=#Gda2+36=FHS
8T.VT.g12SQ]VADI\:/5G\5/Y]B&9186;fEaP1J&Z8F7K?f4Z3RJW405)+>b<eb#
gA#I+B>c1DV;(2YWEO4P3e@/6:5,UbAc89\JH+\<U2=@Iag&SF39CN3I5Z;5S-H,
NJ77IAc1\\UU;-C2dRMQ\\=4b?E:470<-74eWPZa56cH9gNH<2Y4YJS]]Yd&7])f
aE=c3@7K#a^3,c(#c)G\V8VEF7.&V.L3eHA\0@BLQFA]F\GaH-cIcQCLF6)D<H.Z
:f5C03b5JC<EeK/)41U9/bSbKS)b?WV7aT50TL-F)H&L?(PN#@cOG+UE\/2FP6+D
5,e2QHRe^O>L)EdgCKSB\0ce45>MCfVQ<e552>XdAU8P6\R)3>@9;DE-N^YD_Y5Z
?.^KI?4XbAI)c-15\OeWd553\+0)6X]1@KIf.<I+0O>B[=BBI:)NI-,S=)eBN<X5
A&]23_;QGF?JBS@T4_,Qf0a4?R;^Le1_XH6+0)R.5DA-bNdMf[YR.<3;OJW((4B;
:e0XeQ=#F?-#G\BV#IQU6LG]?-)^6W2:)f=,DaRfaB)3:EXG3EWTAW@eUR78XcL]
A(DC@P3..cg?aKYA;KP2^QXZ3A0cHK?23.F;@@b.-&HDP-a#4L[-4OXEL>0,B40O
B&1[_G#=+/U^<4/[_.15RfV1feB[).bag2Oe5UCbUC]7=NU(C=4>]8RA\,0B\U5I
FQSfX)@Q7@:Xc2CAD3:MI0J5OdE96He,/P#(7/R:ABS0U&HOPPGDb)4Y+Y=&X8Wa
W3HfPDWZ;&\?8=<Of9G3dD3AOE8RaAXP?LQ)0-T@1\SY#)Cb/<++ASB?<^N:0g&3
>e#adB\7\55.0fJO2945.\.c@;dM=#\1><e_a1S^(P=3CM\26R[Zg9UU_-D829B,
N.0[#Z85EXbU<N/G>cE.dIaKge^FgHPI@RTaWgRB=VKNU=AIYQ_[GW4NKJN<.9\E
3GKH\>AD[\?TXK<3eEEdC?.APgPH7L^MYA?U,O]LBE_;f,P/KAT>>+dZ[)fgg\B-
?,;[b,bNe5^C.bDRQ\T8J:bC2Z2+I)2/K]OZD2d\5#Q+D;1PIDQfOe8<MFf;_RD.
SR1JS[:c/@8\=+].Db6@0Pcd1fN>WE7eGEb^S-FNgfX)N=>baLU0eKZTD-#R.\[;
=:UB_C>JY]Y6EM_&KM@SUBM>D+DZ<XCcfI4</QC1TBd.Be&H^TLaDV[,W7PM._2+
@?FV^3?CUWaeC1a^<(g2EfN2BTg<JLXLH7.Q92A,bI^:-.5XW<M&^U\5aKVK77:T
=2f41>+W#XWDXG\>#W+;#6[HCK^(K:8^\7VaU0>&8@H+dKF<He<bAf)#&c)2YHOI
4+N>_ZEI>H.:1=D>0R?10_>.JX45W5\=\C-O\c?&/1Nbf#=(IHPd:OeZdX=IOd.W
C&N(e5POL6=&=&P=Wa-;cEL+T[c(OYJV5e;]aSZP25Qe,6_]NGID4+9GH6VQ\V\U
e^4_Sb+dM8K:1+,)J.^:.<]BOXF@XYO19IX,f4;.MLf.([Q_[I0/GaT(B7)^RUUA
>_f?N&5PPSOacP7DYNMP4L+AW8)eP_V^I02#VY/PG[T6?dGDW22VQ(=9PNXbJKD2
,8)VD;a5VZ0F8+R0[US3B1?A(C]^RM/2X]EO;[&83D+Ze[O#0gK8gK/cge\V;P78
M88\O5a:@/BWF0Hf:-Ia4SHEdJ76O;+ZC7JW.MJY[9MM9^FA2gT7e3a)GTOZPLa9
=<;==&#9H/#A55NL90JH#9:f\>G^O6>dLCQ=0_&b>+_<LYR,VUdTP3cJ:[-LD09\
472?H)(1B?a/G9THG.59d1ED<3<bF1a8=4d<D:>ag<fXC7[;L5F8Q/aS)Z3[I>K\
4MfJ>U]I\[KR@Yg9NFg&6M=RTe[0:[ad+:.&UPXY@EY-NL;VDTF/,_9@/K2Z9Nd,
\0d[P/IZ_]33Jc9:#cKfAIP\4C,P#e2_X6/e)4BF5;<U2ba.]A,DC]1M6V/,_S9.
dd.3aF7gLe)Ye8fX3M2A7G1VUU/Q&Y_0RI;Fd#P,+]B)3dBI5G:R=5TSK.[I^VXG
@F4ZEa?cK_c:2&O4&]@J0XQRK0W>/c-D2YAT[OJ^D:SVC)?Bd-+d0Z4=a9FM;RVf
EBC:bCK(d&,IY?EJEC4(35^#>(2W@=0U+5?H/WFG@#bZ8e-\?]+4Y0:aO1Z:LSLY
B.SYW^gXMD#7Cc>4VPTXZ^7DeP3ed2Y644AHg@1B19bC;I743C=M_F&4HAU0=Y&<
/Z2H2F8J.UQTeR9=>H;UJP&&VD+BF8Y^RX;eZ&?D641SCM]YC<5M#K9VQ/0SRfR&
<FQA8]ZU)?c)Q4SRg3LdDA1PcNU1D8S?B__R;F=L-[]&aC2f;ELXDV,WR@OT=HI@
>g/aTg73CXC69NY:.a/HdN0&C^-TbI]YUO(a;2;8KOdRH<G2g,ZWVB\/^YYO\cT6
bR2+Z]1P(+,=L=5=BJW)VTBE-Z]/F,+B3.ba/@B;D>)#S?]L>DUGFQ@.]O[C0S9F
78TST;FQcW,e.P9F+V6<X&M2dRAV4U96MY/5XMDdgCW?d=U3g&&OTEQRfDJfGU8Z
e9E<PKC+]a,dGBDC:E9D<;61?0@7Y-(2FX)LEGf<K(4+#RR7gQ]HY<7C]ENAJcN4
bVUcRU\-FAD;&96VbOO7,:95IT3JIF:,78?a8?TZPbHJ5Q/b+@KZ,ba]AB:.GDAB
Db2_3N6A.>?d.8_@<&^Tc6#LgOP;PNZCT(OML/[&01Pg./-.E[/AG-G]P.9@-:6a
eeMV?8cI=40--&?R-f&>]6=cI8-0JU1TO9S;@aJfV\J>/80F7)/\21T:Q_>\IbQ]
<5+:>/G)Z9Kc\?;<gN<f>:fE@I1X0YA(2cJ[bV6ELX]Z,#P+^R1E1:7[C/V)c-E6
@(PP/A0>TD[eHW<fO>#^f_9HfK^?af_\>998:b13E9RR-0gL72@M=+Vf)a]5HZG>
KaV.4XZ(.=Y[>7YH;,-],5Nf:cc@T(X(EOHN(T(8.D-6KAHB<[A/BJ(+2dOWM2Y(
HU[A?F0_/Z?]6N0b?U(gI(E_KUNE)gOWU4GEVF<cYbgEg1HE:6XGg.-/B]:LP;K-
db0a;8/SPa(VRAFKd:b_<&_I6J<HY;3.0JeQDZG\d/SMA@PEPC6<6<Z):/+M@_KJ
.IEX(JCH?7WCIJFTaYL;E52K\I3;_,734-X+Q_.PTO+?1C6T^T&(=U:++T&Y[baT
:#D1NE>PDPWFM^BaVJIAP@-DbegMI+0d;;]RYE_T@e@J;]#3DcJ?/(PMCdZQUJ5b
O/^S[WI48b>3cXMf14_g^;-&N3d,;80(&<RL=3&UM,G\SVIJF^0K<:8cNY3Udfca
N6I8TVNVUY794.YWS)?++S=][\KV?QcNJJF/J3TE+SI/B#SNV43\b=C[)GPe:dD<
H>#UIH<Y=Q)?]XNJ5<+KL>M=Dc7,SQ#Cd#DW8G-Y2K3;9EP_GPgK53D@,[A)PQDS
&<WJW<eKBce13JC.gI9JUFAH1V#ga5ce<+Fc@.H?f/c;.^IR2<Z/TS.aWJNYY_Q^
dNe<T(CHB2GVaS@[Jb/DHI[gKWG8]9M=1API(U3bdfeCT\0XI^dMgIB;(2U=FFZ>
8d/cI\A2J]R5STEWI?eK:I][AT.cY](T.G)_>1K[ae;B&BKM-2M]_0.1.&g8IUbZ
M;daP44905e>6cOWT.CF@bH=9&b_.=O31-,;G.)[#G3(3D,bX&#(Q?_aTW+<3H\Z
]:6JVe=c@,5NdT7<-;@5NJE(:IcaR=EI;)-S0@-9FBU-e\U)RZ0[P>DYB[1=g6ZZ
LdGd9Y/TYf&:T:33Zb)M\e3D0>9)XNEHG?P4&97f=C5X[.]DaUded1,4@N#PN>CZ
V4@\f6fZFb0VC<N:_bd:]dE>9N?@7AGeF9Pg40Qef+4b,I2P].g.7,TKc.@V5eFP
)D[_8K6N=-B1]dW=PeA91(GVa5)1C60R4@J;NUDGMG1(NZ^/B7b2a>f2KNT46^:,
R/G=S7>b>D<4I)Q+_29+(]G?_8YEW:1DdVJ#)SFH3bJ0<NfbV_3^+&g3PLLe#HOU
1/g;)72D6KB=(gD5.VJFM72bNQOE^A?O227?cU/EM>JJ1bUA/6\;L_<(&OMbAA0&
2)@QfH[X#3R2g+5?:2/Ue@D51X324U5(+F#S0]/9VP_N#[&#=<80dRCB7M)>M[F;
G]ZA#I9dc;F?gYN4QdI?:\8KTc]:)fL7AOd->Y--=+^T6aDG]#HO#J,MGA#Hc)G-
LgPA1g&e^ScOJK]F<@M5?L+@:\/?6:>RU(SRX_6I,EIUY]Y5&A;UK4-U[,AHe_29
2D=U(UJ90g7O<J:H>a411F:HF64>.9Q^>4b(G0H]/:dTD[E?_^\-XSK:P8R&fMN+
..U:RI4_OF54U\1dg3JX2R<6ba6E(_?T[9a\]N.DL=[?FAH##d,(:[\/eN7484KQ
WF=^a:S&./gO3JSH^B@Gecf_V0]f_L]-6&S+E[3UHWdb<=H/fBIfUIQBP/B,Pe1/
>:?1\g1bLM=.+W_TO;#Vf7&4\63<#W0/#.M^2YLVe)4G50a:bJ>O,I3Q2?XbBE:[
0HA2&_e#U,6F(6/e/N3]6#[0gYP=FB>O4P[\=2D^SI<Q,5b6,-c]</7(C4gVe@[>
W^[c#_#(Pc?NgA,KY&6RX==+Ga3a?WeS4Re=B5KaI^N-cbgO+_?d]fGW^]KS?&P<
UO6OPXg43--6aW[?&0@H#XI7TK9^?.>S\<?KYPA4e_QHKe(4+;\7d_IH4VdB6FA6
Q:=L[Z8SR&/Y^K8eX7(BW;FHY@SW8T&7WH++,VR&X<9YE3Zb?a):^++>?49QF@QM
M=^U12a1,ADI-#><2BHWfWG6T)40:3[8>-Kd-@?fQX,2PW)2JVQNVaXTMB;)^6^Z
Of9+AVES::1[Y\=AHII_61Y)3<EI[g.ZHd6Pe#;J1[CTc=Z6b9YEZ&Z,@OSCIUEb
W6@E=,CMLOOM@2Ja2(7A#?F+\0FRBWO3^2EF)C7@LfGf246RYFY?><<;e-)-)gXC
O>\;]c_7,D:3]IT+7\:-cbEGGa(gLGJ+EY=&:ae:&3f3-cRFTK:AZ6HY3I=8KIA\
\gg</[;aOI+:U(A2Ba33_a.8]4F:X;e#XPK\ZT@Y<CKE>6QE-[>3ADN]CSZaEAda
AX3\;D92(2M;eXZ7SES57IMbLMf]UN.Y1@0->(,VWWfB(=3FAYdC@\-09/&DG#>#
028Md&9L\OOZ.J6b_@[2&RJ6M7f4OYK3XaadCbZD2;KYX)A:XE#F,e46E-<g^],:
C&=T_H_E<-Uf_.V()9D=T?VU\HNa7eYd.Z;^#64Za_\M_M8Kd8^V,BNO/[U?^\J[
F6>07c\cZNa/)A_Yd=5Bg#Wd8[2Y76/.O1Y?-d]]\,&B@V_a,W27.(:_d;.81+B<
T:.TV@X6MCWGDZ==b8D.2aG=ZL?SS2G9N(HHJY5/82?;Ib5VAU_(LFI;3DTGJI\/
;[;MH[(L8X>J<UCa3@7XC^6XT4P9=K>>QSWb=DNd-_0-P+R.:4[CLd_=,cABZe_&
F-&^RP)g9.&,_6b\X5?>_3UeE]:P9ZFVd#7;6L#\3aKGZT8#04^#2[gRLg-)[+D-
8c2e,7@:WWCE8P@DHS?8\R6OI;@b0Z6PJH<7[8CKZD1[C<cZ6a9EP1c+WU]T\10f
R4a_X;,G9#:?bD^(a3&_\+L1^,TZ@S8\@QSRDS3JTC8@FcXR7_0Q9AM_>VOg.=-W
?2HAVc][fO7QFV6facG_K)O<>_G7.ZY4Bdb(W2Y6,RR7@a[IW6NK>B_5(F33=4_3
G;Vg]f(2//T^53N1T.>@36\22Z@cg<G0R.2ZHD/1NZB]R:)38AB/X@?TAG?3]GO<
,-MdRef]UBB?@_Q+^X?,N6AaDD&JA8T-IXOH[]B+8EKfS#O\K,>G<YUJM,fRg\.[
VM5#af#@;,CQ9L^<2/Z4K:,[4=fCBZ]H)g[Vead[Wg.F,BEYb5.JC_V(-OFLX=fO
<VeTe[VSTVSb@+e[d.&aGI.F6I_]F9cf.eC_0-6ISbb&\C6G,2/#VPfd[8SL<;9)
8Q;XKL.H-/Q<cHK^068==67?:QB3f(;/<3@^EMUHff#6843&fX^5[:KGQC76VdD.
+bRN^-Id]dL.]QY8W7C1]-@+3a;dB_BS<0+>H@:LF9T[AN+V?PeQ15:N0DS=KBb:
9==(ZH6I((01:5;.W>Id]<fNS2E=9de_/D=_(4(6UVM?PbBNMU\PJGfg)3N.a(1U
Q&IY#NZ;_C,72Gb:RVH[b2IN1c(9[a50<(YWgBLXG9[>D=d@<bB0Bb64I@].bbMO
7a7CfVNg1FaUY_&:(ET,^F8KDQDITJ=@;O)ROJN9Q0Tf^0/@<_caVG&?0X.V+0/S
B6>-7R;fXPHAbAHR/b>]W9Xc0ND:FX+4T\4Ra#&VC\TcG/J9GP8Z>F<\]ON-&f#S
>@;&TN1BaD)a&H_LM:Z3PIH:FT^X8V?18WIW4<H_G\5D];BR+F?^CF+(P>EF]+)F
cc4]a?e;dDEU1[S>fTQ&<QMZ_-](L9KRJ@GF/NX/e:b9WaY^;?WUBS5H5(FV73ZZ
^f8:V95Q0#[#\)6<Y_72^=Q\,TTB?1,,Qg+[e?P.>/:F77C@2eQYOY(QE?E:LEMO
7D3eO0P\TZUHOS.S0])0#;(:+N3U;20:,B0+<38:?2e#eZbM>0)I[_DW(H^7.[_G
,[GD9;N^:ES^_ed++G=g55G>VA[?/3)8<E/g.6gcN\d]Wb:<Y7gQBR<=PaJ>dZRD
T5,_FN2@9G3,_R^KA_aQ8#e[fC-H,QIKXE]I4PgRTe>d.HVCg+e6Q#^NBM9UFWT@
L1H?S+@aX-ASUE;&?Sb\5]J]BQ)WXN=Q[AX948gcD@;UV0eL>-&(G4W)V<7cNIeJ
5&eHN[Y=^Q3?#-D\:2#ECbX\?11]?CW]23:@EKP.cH?KVZS\?Y)J>EgNa0C6_g5b
&7dK9G@6^PB>E96+G+-?C;ca>=eEf72PC96E8U+A5L?@]=<_W[GeDNJI+cU^Ua08
Ae?QOdAg[=).&4eA]MMC@(M(W7GJZ:XUEEK.GP,G6NagD=.DF[X)_OE1.VJS=YHd
JF[G<L4cILfK9YVA1GNYLLLeWKDT]e;=/:NM?5?XgbN<<JB]_.PKZJ;-28g>AUDc
[0,(K=YJ=+G?IO;A/3P?+32)6bd](97bNKY.(U\+PFE^7,IN@MRe\56F2V7^cdQd
LQOKd2O-<-Y5aAFDPEg;O\1<Q,Ie=@UdQ@-BO(9AX79^/R^?Ye^V1W(bR.:GZ00g
7QHM&\N8fMJU.G4,P-cf:6HIP5@TMbR6T6V@@0:CA:dHW.)Edg-g<+<<-K9#a:8B
TMWF\R?#F5]>]0JX-?(=ART0gTE4cOLEC,:.bQ5\XL:WSCYIdR:(f[^H#-(T4eHZ
VSZGJdgB82L4SM#6MS8eb(#W^9V-)JTO;&V;G@Wd\LIZ\(>MNN8ABEdcQO:&aO)/
>gYL+_5)\]E7=L7,094Z:R3M-C#aF@6V=dYS@>3R3(SE&.?bM7_MKLXaQf7L965>
e?fA.#,ab4aE=SS4Q?^_ae>)T(6VCX5X,8LZAff>RaCW[924(X>;=CIg..\L6KN?
<CDFHI@>C9W@:1,dD9N[<D3S3RDF6)BKJ\,^&^C53+78.BMSIgX1;=K6M^EMS0.I
[6I7J@f_LN\-Z3-_0BEY&c7<]V8L3YgYg=3>01#aYgVHA[MCcD,3NZ(1GQCVI#XU
dALYI[8<G&)E/W5@A43Z#8IT\8G1S&:IP(S(-W\_[DHV0<aRS#VW[&7cb7=&^:94
]Sf+,/,WP@<1K@+2f>>(SOI)RMMT#/L)::LMTa3E_a(N][-5()4.[6eX.-(?(>&B
9@PAXV.ZB5EXcBH78?2.5?@&U;;Q9QF2DV\0RYJ>6If;.M<QZ5,0=G+(eZ;gg>Ub
2.I#3;C5gNO?CTG7&4^Z8fPL68Ib=Z3]J[b-;+#Gd[BECFWXX@d(@YBGFAE^PAM8
IRYS13+->[cY]I7;XXASC[OG.#N5#[G^cI,GT_V0-R1GJKJfc09.#HYb4E[b)N53
N7)S8JP)d&9#[SB6]DUed\XQX:a&;I[-?#^bB#R:&,95^TEge=7M&MB,cXKUM:RK
VTc,L\Ba+G^Z7^6=3BJPbET5[SS1]RcME)Mf/P<G,B?B=##,9OQ8RR\Jd(D;0T6F
1+RGVQYKc60TL[DX]>g4<+/WQe=6MM\V6?+P:3+3@DIWNZ324F2\YVF(Q1EWQCGC
]<(7]TS_IZ]cH5&2aX/5B7/J#_B^6S#T72)I]U;I&(VM1=D5JdZ@\0PGS@2;IA0K
XaRZY@cU2DJ1JC?#AD8N;4EVJGU;/5WJEP::a.aJab9ISCeV&D?,Q&BQQ1Z<HXX2
.^HL3QH=3K56SE9ZcICDNAedaOZZS.SERLgBfN+AO<7f-#,)^W=E<L)Eg\9]beKL
@gcN<O]Yba.;fD>Z^6PZ8H]119;M0Z80?KYY96(H3gWgEO)?_3FPc-bHMOG@__/b
\IDT\f8=P/FA_&ODU0c.LP=4GE.(.?:<&2];XUcb2IP(+1/9EZcf#&-.LBbbY@g?
3&M&=bYS2f=XQOMOcV,ZL^KY79N[I&G2/a2?ZO-HR@33g;gD:fOA0H=L\bA@f2?)
V_)g3/6gW)_0A6W_LA5+?]4e<Hd+0]fe?a.;;AG:N-W.2cIBT\S_(&b7WE=(Vd&d
:4?=O#4U)E\/8PL,ZL,9d9b0LGc5a+2RUL8&.@SEe@TYTW]fS@@-9M@f+:e5&FBD
&^c>eYc)#Gcbg?(g]cggMPGcd.?66VF?9P+.E9UGW:K]2dB1/XS.\)]XMQ+;=G64
AN//Nc]bF+B/BcZ<f,Bdfa#^&5LSZHGB4.5E,R631c6fT2GTc-[=bQY?<7dO&269
dPa8&KK677,Oe[TdQ^Z[5@^9V5VVQF-fXAEB@C3B#P]YbP,d:<B_2NL#&E:\,@.2
1H>T(5Y__2;#,^<;g<FeN7&I3LLV#)UgF3CMIG[.[GF6)HY7#-LF(/D>B,70C7Y;
a<G7\:VT]dZFf32;UNZQO8>MA?E\^JIHBeWAceP@L9=38=/c,6POCNGMB=K1F(?-
<4^>K4XQ9Z1[BHc)E))CeJ7J0\bGM;d4^T[_A\),W&Ya69PA0P)/G.Jg<,L2.SY[
IR.FF6[ZdH6BTJ+Bbg0M<=8G^;CeJ.EQ3;e[,Bf.Ba3(C_[[Z^7NGbUJcb,S)##;
gD@9<GMR=<7fY0==Hcg1V4;:GIV-C->dGQ]e/>Z<Q:3(gYC4Of,eM<_O:8J]?+QZ
d/T\QVP[-e^<d;c3G17YETNX[25/7T&<e9U(G?CEegTK+T@WEXNI@NR5A_[SUbac
RX<Y):38=A>27<56@f=R(F@Dc#60F::M;HJ3KQ3(<3<@(X.0P1F7W8(P0MJf:3&+
,Z&D2HRRSJ+S(Mg2E&d-8ecbQD-9HYO6.-L+R/OS),W84?EBgbB?>Nfc9RAe?.B-
e^23MQdZ[EFcOeMd#OXBU,=;2A]==245VcJ+^B0BT]^aV?W=@VM([Y>CPY?b_>>U
K@)\Q5G?YQ71RcO8IaD&_)/UAG+Q94]]6043Y2XSU,O[bdB-ROf<L/?L0@Ud16XC
<F]V##)^=.E5dcb)5>C]XR3+_Bc?MN^UDNc&/K^NYN4)P77bWS[@,8C6N^EU0O.K
e49Rb.Q0G=2YK]CP[2&4Q,I#A;053QU<PgMPC1DZ^Jec/8@a#^ARN\^3G<b2.L#d
IE7=Zg5<2IKb&Y)58]:a,\SZ4;:-^DR-;[:-VPTWPZY-5?MEAcN6d7fD5a\G@7)8
FD?X,;JVg/1.A@gZfg(b/=<:GN,,#)P3RCH<cc,L0M.A((?b]KXZ+X?0c^b8<@)/
Z>?820@bDAXK0f<TdLAbDb43e[KI;XeY[_R]<:@[8WZ\I]b)1b5(QVT\]-+[fOf+
O781afWTWVA719#H@9A4)EV.N/Cb;)MR=.B)LDCH[8b9#PQ2.M?M8Q)(d^AWBO;T
_YT]O[1+6b<8Z2.J5@SC0B&3D>B+D<TAe?&#V5(UHHJ\FODE&KS.&53[X^?1I1W,
,:^@T0F:?1Nf@.F,8A#LCW3A<A603bTN)KdA(4:C#c8f(F^98T8N,[eHN>>E/^II
RV2fd4:=WTMIARAV\a&KU(L=ZBa8g)9#WROZGJI3I0bEH_Z087cYUfHJ)F.8X<[D
)-\I;?B4^SEUb+^H=+3)R7g:YN?HMUBEOC?^5EHYL@-HR<:]Ld5G8W=-L&\Qd7,Y
0)?<R6ZN5C;&N_/>[=WKYKcJB]f>VacK:?)V=J@c&V#AFc-(X=[c?S\=Dg5C;P2]
)g[Y<(:@E5CVT<B)e)NV]g;DGKSCWXYCJV2(gY#QMV@.X8D_QL<PP9bAc(</IT9L
T:-,_aEN7c2=FbE_#:1b@-;5@0[>WT5=4E^^DHJ)PZ-T8Wa_3QD_d+01E1B=_Kg&
;fE6-?ID8(^DL3S+]Eb)F-FZ#930-c5H-E)0G^ZR.dgO4d&)114aZB.[HO/2Hb#1
A+\F_ZKXOa0K,_/DH.[43U5T0^1HLS0cMIQPdd\Kd@>(>cMXT_NQ[d^SM>,N]5EF
HD6]W;Sg51\VMId80@0IT#8KMTd/9&_f&KMD0)<K0^3QS6KXDEebXEKb_T[?82?Y
H\58Ab#(.NUP0ML4S?WY1,8L&J[H?2UdfM4T/5&JPKGG4B=fAaT@[d3)gbHd+L5U
FdI\0DLCV[:[KZRXV207J@;^[MAJ4LG+a84<6@5e(QS&.FVP&G)c\9&@Ad),TT8c
<^;J0KHV5?PWO_dDBN+Sc?MUZ#eUZX[dX.QJYbcfKX(:+PH9fYTCV6Og]ECIY]0E
=cbb\/YT=L=;<g^X6HILXOdE19(dS,4)^GaCdP+F#a4EKcJRG5T#F(E6[:OD4ON2
K>Zd&N:OgD_KSL]VcM8aa[;+1bJfgPTe]APS#EDT.SE]H7aQ5H95NXBCBO17?AN(
KZ@9E7;]L7_gE@^A<SVd=I&/70HU^/Wa2SNB0Xe(EIPTa&g3:NNFPQ33=:J_ZG8A
Z5+)+cC:?bZ3W90,:KJ^]7X_24[#KF)_(=SX6#[(XcJY5X]JZMMPR(XaT+[?-K5M
IUMWDg:OQ,SP,NGAX^-^CJ=5fXWJeK,0]H4R[VMSQ4g:]B5T:=&]?]B8C\UC]J)2
5K@6@IADZJ(Q:M3YFd@KgYb[JaF-MA.A[J46#)3)>_.E(.QWC9X+B3_g5CfP-HK0
XB5)?NJ19?^G3F#5[,:M&aYc.MY6UT6GG(gB+1d];IJMO<RR@FX6VGWXY<Ka92E=
L8,-##1>8)T-V-LKZ+80DbVc=)<JWI8W-E@JPU=4==S#387#]Y3b,EaLC\[#,HcW
F@F<I6]YQ[KFYM@#-Ld6EG55<e8baM4Q<?LefV#JGK4]fP#50B;146[g?F09\N^&
D<eY@?M/X=CZ][?6J7TG?g8,Jd^ELW^2GHg63-ZC>;?JF0X1>VQN7)N?O)M4GIDI
eXXJ2IKV-2M-.=>\P>LX9AX&SNE17)eQe_IIK6^Fg9L+J(CY)JdCe)F>--G=KI0M
WEAF-0&UN9a(J71_=f(_=VRMdSUR+AaOFAK7U^1ZGTHAAVG079_5+b#&#MA.@g,R
F=OSM:I/,P=SLJaG]aOb7P=A5(\79(aJ@Q[\^g:X?K:1(KY9DOV&W9R/^9[H1;[b
ZZ4a^Y)aP;C4NF_\2DfFHa)fE-)?(J<\c>gUCPcNbc,aT9OEdaL_W7]P_MLC3V/G
K2=PPK+8:AO[3(=A0#.G/;MU>C.20RQB(7UH:]S]YZVWOKP[WgX<RE76-b:3(cD4
[IbO[2faCFF>gc&Zf(>6f]&CB3Y,I93W/4Ea_5U#X-8\eVJSV=5FYWIX,,PK@:D5
TQ&a8G#J]GOSF0eBIUg,2:=9A??6D]]4V6BRa9gU=K5;P\::L<a/MdUL;Gf6^&Hc
Q(2Nf?Qf+CeXI(]D3)F:?Fe/;YMV9FIMINMEU3G&P&&HgGM(g&SE#ZeV9LAVB]GA
)9>b[0X6WO+,:5IC4#Y15F,BV6W&;):+GN#Va2c:MdVF^S74:^\:<AL8c(/ObX]]
==U9(S39S&Df<49a_@>Vf(@OZEbRG,=/bcS3,S2_XE5FA/J3KcO62QLZ^7?4).JJ
]6XZNG]KE5@gQaTO4DaeH/?bG&MG^WV[^e>(Xd9#I18>CE9&WAMM)Aa#]S0UG0+g
C(eXLCVH&OL+1O=R<0?GFQ#<CLeUC.]J\.U6A4?=-X=+2OQ?D29:B?Xd,N9,?6Y.
CW84YFYeZ9g.=#ZY<^OK1[WCBV@IB+L;VR?)5e#Q1NE#,(,40M4A26()>M2(G:H&
IbOE><X6JMN7-fHD1M\fcf4)WU>Y_YfX(#M4&+3HV)9PU-f.8G<BMJE4(+_aQBH)
[R1HGa6D6DCa=QW-Nd])R9BR(\FRY]&+Q>8L5#YIK+>DLG(,[BaU8HI1>eZA492^
,?C0^<dRN(+=Fc-<e];(<-#Q0FbGJaC5gP>FMDUW\33]HPgTB.c10-9.AW0,-FDR
.BOBfR2d\48(W<+d]>fY)FXb@SMUe5+\bCD&P1\&=DIa,f+:RNJ?/QTA=Z[R;?H<
OB?8fMeR7=K-Yb5R-9NgI@-aXedGQ;5HSegT5#R[11K,@9f7b;(2>4egdLeV(gH.
DX/X.AAf#3VM[cdSY_f)HUc2VePOB,-3f4bZ+2g;>?NN9SaI:PcGS\+]P8LW@.f,
TIGYED:XaHA82:?6T\?[8QZ)J>K/_NY0958b-5_&ebf9C??<9e><(6F4BH4U9X+d
V]TIOA+]:AMB(O(P^^-2a,W9WB,9g6J1TX_YGV[GCGOD7],U0(HC5cH8abP@e-#6
M;#9V1HQ+fTTO;<+0LQ+@NSdETTL5JWR=72VP+_BX;ZU.<Xd8.?K:2a^N6#7Be[Y
d]HgG9G;;24J?J]fCRIG<cf592</;a-E1;GB+=5bO#IXZMT1G<9f@/P;UZ[PXI[_
Q-)^Cd#@2NW5<0P;\?M-0O5\J6OIb5;V[VD&P[<8E/>,F7LU]M(gLJBKUQ?O^-1:
RINZfK2BTW=E+Sb2D&c=Tda=[5L_+Og-7,bVTW4aSNf<<77K@779CaN#Y1D(BgR&
/_&3@YZf9F8SJ[bQPC>@XNf9R7I1TEbG-M9(eIXU0V96R3+8#d/?gaa9Pf7Ka772
K:GUWET+?B(9V=VG6TAB9D[_--E)O[]b1R2eP6Zc\d2Y:<eWXAGYb.a,?P:]2A/)
NBNgJ12EI^/?:8+MfQCZZaQN[1K^D/\OEMVf2a8\:9e7[E7[P>S6Cc?ZO1B4-3#;
P:(dbd=<+)c3&gBI8B&<a[^Q]Ua?dG(ZY@[+.NYb,36VbLEb).aE)gT3e+,Q1c^M
KM4O0\LXOJ1-b7a9,eH82LZT7Y\cD,O-]YbU2d<_.5PMSGGM\H-5,@HP4SSZMR4M
@5BP@:D.)<=gU<,7/_#MD4Y[:#[fZ_?A9g-U642Nf,BeaaEHMC#1:J[1PB7e\5<X
.8db:M^SYF@9f+<Q.G)e2#<a;Ufe2W/Q=g.YeR3.B^#^_)(7?Y]W)I/8/3HT6PI>
I?N_YVX]OSX+(GV5I8d9SdI5:cEK;QC/WgZEQ#M&-cfb-gQ7_I<W7KJ;+&B#&d3=
5\<QI?c0)2c,?8g6MeW<He&09?XbESP+L:Qf[29d8+2B1BNAHM;U@42&^E_-RJTC
1GB@c7d,KCKU9Z9\[VT6H?TX\4+T8/)9d5c,N(<[I?PQ+7(7FHFYWReS,,@#:.XX
V1XBc=C(K0Pfa1&RbfJVb=8DUPVT)L+&5IK/AMM85SI;cH^E[g5aOFW&gJb&,#PP
/V:(?E:&RMCM0f1S8VGR,bPfTBcCgc@JdMg)VV8A\8(f9M?dL6><R[FfM#W69RPH
+^d24HWF@AO9@f22f2WXIcVe_=G;+CfKL15?Ze_;aXX8g@d>f#\.-YJV7WddED91
)T=1A>G[D+<@9@X1IM<JZCMQCOK)Y<0L,Og_>T>U39612<605+gWWR_A5g.(:\4A
@<0XO-Wg]P(]U(A<LU)^Y0P_Dc^@2EQRL?#1=.ZD+:H.=XJ)Xg=<-f7XHaRL#dc2
d;)0L6W-VA0,5-:O_gGNFXG&4#B67S_Le,6PRIN/+^,I9EMeW#=X+gCd(.7<>-_9
B\_KRNDBF<TA=GYWEJ\>OGM]e&,O7dY2CIR\J<1ZK.[f^[=._0a<N^d;B]bF0BT)
2.;?dU\UgdDDXJ>]bWgV#T<Cg+?cfPKHb:U=5BT+E_Pa:7(0S-3beY93:4cOM1bQ
ZM3@<6cV8BB&g.W5<WMDgL^(2COXL2f>4]/a#d@7HT_7WP,S8IS=@=0_Z7&#f=]?
CQXd\bBYa#RS@fJ_J/6@BaQc5V?CI?=)]DB1YJ.FV-SI2G2(b:6N^f[PVeQG7B;c
D&?TYQ#PQ\g\)U3fH\3@Qf[F6&,e2g\Q3Y727Y<EN4.#]PH^4<:-Z3-<&P;C/>5Y
;KCHebNAO8cK1a5X=V/^F;US^8^ccGa](&VV&)-MK^U[DQ.FU=Af>=PWd7M^@<bE
?B^3,a:XTA\13_C7WcS4WY/YTcb4-?Z1A5NfM&^TDd)gg@9_dagU;G28aTd]O,ec
8ba?])cLNH2-dF8-(Q97#g;M?,ddQX/,0W(VE<ORAKDMFHRUIg=L9-;/BcLXZRH^
ZDE-BE/6cRY(2(5ccd3K:fCSCX80V[&T&W6:@GT8MSB=^KPb2HJ5W^96(bYKHIY3
B)=fAGR^f1D:Pg3]QdNX#K7IM3gP&J0]:YLaL/]8K]IeBQ23;9&-W(RA82Jb,0G>
&HH0(E2egf=N#OQ)7IH)7DVTG+N-R2e)M1=[K4@PA@G,9KeTf8Q+X+-C&ZcC-X2L
TUGeMTI]4F/RbR:4N:57LGQ^f[<-CP8I&]C)CXQ-M[CV\IQHK5b3KRB:0:Ug8dF,
<H<TYbMSf[>A@Dg?)>.0JQ]EY:F7>H5CJMQ5[#1f/(MB)+6H>(c_ZQaa@)KbYKOW
NSd?OJ36I&_NdX8<S2UB79WK8HaP=JS>(77+?#d4_BC<D248QedE&gBIJb:X5T^R
8)f#Q(1dM5<O)f;FQg09b+B@]B@74VP0)7@SF,17M;_Zad9EI=]PP<.5]ETR>Q-f
O92^J,V[3&-O]ReFfM_0[dU.D<VSJI32Z/GQJN&O.KHe,TN>OSK2T1P&>;13O7^0
@8g7:b^0cHU9>KbTbV4Vb6M-;L#2@-TZN[BHVHfF9:GHb0.UT<^Y8GS>YUYKdDf=
48F[\4cYEEA9<gD0G1C5+#@BI)V#dPe7We<X-@#LZ_<1fK-V[,CYRK<X28@-Y=V#
IN(VS9CE)TS25[g(>0Q>QR.JX)NKADV;5SH.AAFJ<g0IN6eE7#K7T#_XKDb8dC^S
cL,bCO6FP<Ee28([Z;2UIZIXQ>7IWf+g.#US9X[\159IJbA&TeE0PS]UIU+Q-/OZ
&I#5L.)>>L3&d4];AZ7gVX@?,O0L5GegN&:?O3f[IHVAAg9+-<+79H.LEfV@+26e
Z1Mb_JF663FY9PC/@(AT?3MEV)-bP(^+JLHfaKd7@6[\d_W^c))^fMM6NIACI828
^e>YE=AT[SZ1WBC5&<g;dBV.]0(2LQC_2Z6<<KZV9Ve5K/&8SU4aa^c]^R0b&da+
=L[XR,Z@BMe9-P1f)G7+I[><:2;:aZ@4d2D,JKLQPTC;X@_cSDVS?7S2>HD5Hd5#
Vdb&WMaeg-bLVXCU164Q=G@0203TQWb?41FefVS=aK-YV=(S639Va6ART6J7ce6_
25bS#.\<S1NL3YSXP?<e9[EI/gb6&CaNEVJ?f1J-(5;8]IA;MMV+bM\Pb+Ea6Iea
Za.00WO/C;]0f^C(P0e@\\Y6I^_.]TRF9D-YB_g5B>->0#>6Y@^eZC9ZH@#,M3T+
<[bD7<d)AGUCR/eF4Z3a>aJ;(1=YO>OJ[XPe[AC:^CG9NLRK8N:97I^;cX,2GC_&
VgI^e8+VP5MJdL>#UH-Rc^]Q1[agb_^AECRa0XJ&(8IYFY3(T3IV:/&LNK]A&H_N
:Q,+A1(EY7R;;cNPc6UV;4B2BdD=;B?a?/04?eV8F,CNS?I:dd7I6fY0RaJZNeW<
<.WPFK4eE3,:THZ4=@Ja6K_<,]bL-1&+2gADKKWDaL(TT-,TPIP45\d5:O[R6TZ5
P^@LcVE8N@60-f0&BaNYYacFI\YOU0C<^8PaHc?g+PB\c^<M[9J]e#ROCHMMMg_]
/F78C,>6LJ4cea)UNS1#>I/A4N/J+GEW,FIGEPHJ^7-@J0E2e?ZWc1-\>&B,FPWQ
8Q,K0CYC[.-=dS0GG->Hf7OUC5Ga)E=7,-GYOL5F>aP@bG;4,F#aRC.&gR(031<)
91b/E0NB)d@[;e4b9McS=KDSJ34#?FC#=F#c[:7.O7VOc[e5Xbg;cePG][YUTcdI
:_OgK@6N+V0)Kd@g(?WV984=P\\N::Y8b737@9:7-5X;^UE;-=+D->e@_B+U9</:
gQ@-CF.c3bFB=E#Z3>K+6f=#@[gP37]MgH/;RL-X^9:)&YUNR0/8L]U;5/[b0NY+
N4\N=+;Z[+&cCL:/7bY;HC9[+0@Y..@=[cDABC@M49BZ3+TcZWA\?:QUed\\C@\@
fG6):P<bMf)IDfI1/;dcX.g^_S6U6dE=9>e+89fe]:=f5C1B&@+8DX_)<,^>.;eg
_E^>/^7A1/V2+,B9B\;FV1TT@;[BP\YYRHeE?372^^@>O^/)CB,=B\Sc)<de[9L5
ICLO_R.VNHQWDC1UXe0:@Ia.GQBbWf<+_3&]>d]\WJ)1QI/9SWB7VVfR&[cSaUEG
][71?1XX>,M?AMU]5.^03Q,0Z(/\c3=O;J+7V:F7@1A&FYW;R1#9bK(8S#L&\=7O
,H30]H>aCCN/T#^C8AJ:<ZbOJe;e+M(g9&2<]W<+Sdc^a9J+)99^M9#CYdXB)R7(
aQ,Q,MaT9#L7DQ6B,)9W/WAX:e;^K=LK.aG5VQ_PMT=D?33V(^-L4TLXE)[Q1F9Z
:O];B)?Rb:H#M88ZW,1&A7-0J.-I,LCbGIKRbB=6QPEJM(3KFS:CBVN(]WX^&W@1
e55f+^10+VB9dJK7ZAL:BHRAgW/@]cO_M0baA:([1FA,[?J)&bDg@1QROQ0GF1c8
g[UgB70/M(_26LQ.D6_g06B<KM?7.^@C,JKCJA[5QV68++3/O3aEB)CBD&&Y6.^>
@\T4R0=aB4Q#5Y&4Z<E\Pb&TT0YWBO]F1Pd2=5[ABJU,7<(3DdN:fT)eCC1<HEQ8
V@1B;FMNG#<A5E;J#-#ff@[.eFC6Y<45[1@bb#3OS0\NOME8:LD7HJ&]?9a]XGc-
[@IA[\U:9AK.YHe#]Baf?:HVgNSIE&J/OY^=:11+IBM_^-C8?7RP1N@3+_)KPc,[
V7Qe>[2Ra>L^>9HCX@SF;@52:<gV8U82K&KQ6])-?]#gf1cN]d[S7OLJ=,?9SBSF
d9VbS<^236b+[[?L++NXb&RfQ-7H5/<PIXKaXN(4)5897XAd>7cMUGJELDN]N6W0
P2T<H^9NO1\-]?Z.VdPF#,b8#R)]LEIY:ZaA,[N@9SD1:^:-(+Y>]J6_X/[1.58X
T/\c?85:[8I4QFaN/Yg)3QfGE;F4LX[Q)P4ME\BL_ZM?PXTA@a2eW4,_F>QU>A-/
94.+0gYOFbQGV-dHMK8O\8M-[\^2(I;<<10ISbM5W=R#ACI<X<Q7:RX],SE\9LRc
d+VX)RK=b(I=e,cT1.SLGY-L9/OL=+W)K>JJ_K&UG2>WH+^RBQ.Ga+,c.&Q6MQfN
:.OI7#,d9=64G9H\&FSX:9dUNW;FK^a7VMO_\YfX,K2FGB+W2.&<-(\-4U\T@ge-
UYE9gX:fRGSDFXeLRTG[@2IRD+<F9dc+-YC[[X>U1R&Z1U\9e3A.=b>C@X,(R_+;
(5,)>(+RgbO4)(A:>156EEJ_Vg].77fEX4-MIe#aGR<WdUg\ePf<>4C4@f73[L0G
]+@(G_T+@>aP<c2IcN)VN=G?G9M&+:e&:Q5TE]b=JcNH^]gZX;OT5XgZ]:_Fg]T^
(,;7.RPXME=H(&L,J#@/e8S.cUT+gIJ&7FK-Q-E@C>&gFa9T/D\;/XS-LY,Z&2DJ
06G?)??b8L)P:d\5gS_/ZP91<QIQLdPcSO8-P\O+_9c-+RO6cS_G8e+QBCX;^.dN
(TLP3+>\<-8I15(OS0KTWIa6[WOP@4Xa@D7O7=@\QOPVV51cbe\GP(1,?^\MC0M>
;H:IM.ZV(g#eaP?[SYbC1?\^g5F>LLdg1;Ba(&D=b4,(<;=)ML]3c+9Y[c>1S&d?
;O86]V[eC>OENDCVe_VfOfV6XEWGc]IB#IAV?O\SNdaN5D6M6]U1,dJ44cBV_J1,
bR)N49W]<]d=6g<7_1.-JcKd(3cO(gL+WWF_3aOLK^9&:3-&/d[BK/2g6Y4XbI<A
/UFZ<AF,13aeY+S\=?fSaO24U^/9C_\A9G:.1.23\)c/-Q6;)NNUFB6A:(La5=K.
bO5bT\)7e8ORC@4ZeKIDHPV5)JA\S8eTWIHf:_X.F-/_:RT61/\G:[,CKcL1Q1II
g;F64Ufg1.Z^E\QNa<YEQ_#0S;[eg8f<[(22HTZab>^,7[eY-2#7,>(>B(76XMS(
[S>C7a</8U+]WT/#WU/gK=+WM46(M&0V1>GTbCN_SN([X2D+=af-;Z/TT);c(:N1
@Jb8Q-5a_I0^R^]#06[0FVHAG;\G(6:,B_NY:faYBaSPQ<(8c5LC1QK1>c,-CZ/G
MMBaN0\UZG4]DCN=KOb6-)[<d7)X@43TV3XR3gg]SOa0QLG3,A,bGOTf]A.\6^D&
)G.PUO/(Q;3Fd?V@V#9+QO_0\/3,7R]I40]:&9K^XF-:7]?3HB]+@IRf&V<:-=]]
ZZ#OX1@0\;]1/LW3J+TPAS:\VYO\@HMX@C_-G,]\4?0cNL<#=\81M8H-U2[5F,d6
>C^8:B)R7d>?_db#b98#F4>?gf]B.3X>d0EAT,f1SQ2VN3&a[aZ[e]SBV/Y?STA&
ab<R#_ePf#ZR3+6U:A9Xc5f?N#b(/5gGR?I^=Y8DAM>@_50[d73DIWK8KJ;Ba0[L
A,L8Q3G53;I]<#cg[_eW/YWFUMCGQ)OY>?#G+e,^,YH/7CP^c6_IT+6G/LL8c9=A
dD2c:X?-F5FE:6B0f^V2N\7?P:JBKe035B=AJQ3a?W7dXc[)Y3SYT7^MO>]^R(/_
T,&1J716X23eY#]8ab9?bLXBgc^V(c@aVHV9K9QQKJZaQ1,a<IB5ZG17U,ddSg3J
+dDRA<?)+cM7+d_\_(U?C]G@^Je;V3b)N;H_AK&-9L[8(5X@Kab)e8KdTMW1HEg^
PHL=VYFA];bT#3gB(6+a)9<BEb9-5#)MTfQ];^SPbE.-ORW5RGCSTJgA]>-8BU+D
Q7&-<B4OEVYB2bR5,>Z+9a53.<>82?_K62;^V_K])Ef;I;<PT16fAD1fD8ZJ)#=J
f,AR>3YQY(.8)0N:5:Z,[KRJX?DKJ0(YY;8[&A9K/[8E]K:gDPM)_G@M^UBT&)[d
:Mf,KHQH-8g9S;,Z>I+\>QDRE<.3EWfDRF8_5[2/S5]\E26+K0\9gAV.7[A2+@\C
E0+<,?.^]-,bQBPU<KP[?:0aF^503OXg[3f3H)LfBM1_S/=KdJ/T_(XAJ&.e>NQ(
bQCWf4>Z&2G:e]HSAP#]E+ETf\XcJC1N0<X<HECY-Z]:fG1Z6;W]0fE?9_#HDS5e
]N,g<e8Ub_3^K?BP.)(7Ee/b&dR-bW,57?^#>Q?\=_[4Je#GIV(J:C_+8bc(5P1J
4dX^@Xf1a5&.JP/T8dH1@^\902/A<OEO1Tf#]RPg<COM:9AH]Fg=2CSB=gL9\]b&
_-WYB82(]H1Fa4GE^X\d40<e7L_[]1UKK;XN:RH@LTbgX239D0bH(bJFJ[NgDSW;
_I;],UGK&KPWFJ@^I2T7B52CO15eJ5b.c4@(A,V;D)Y>U28BQI7bW0L5=d?6F7RJ
EL?gZ1C^Lc/EK+aK4;D#Y8YAM@SdBC[5&MeXV\[Tf;3Y6S,(+RU;Yacg\YS9F=2#
TPTHP5GY_,da7V(fM.\&CCMP2X2+c_BFR)dQaPCO4JMF_V&NHdL7K\C>b+<N3<gA
1PS&=I1FDHUa(M@L:c&6?-_K8J:<81KEV0gP>B9ES0Jf\McMeK@cUM,Q3&AGLD9+
XOdF.TIPCZ8@L&bD3fU(d;UEAcJ]2bMTP+e83B=f<(J]V0EU>(c2AaAKcC9_J-Jd
B,]75J+WFLS@=R,;.<dg>T=0Q&c(f/UgOQ^Ec_7N59df<+JB.&8a7EKSJfQaY#S,
?[eL0&2L?d(J&Sbd1,)E0KN=HFH_BG#&SYe<9ZBP2+-)OT]9[A&?V?KAF>5,X?gf
O+=6^CFW;I/W@X;Q,/1MUgP4[,&e?aBE::gd;@XG\K3(Sf<3YZ\XFDF,F?3A)-bf
7]&>,>X(PdI=#2\NFe?04=BAGeEb-M]HQZ/XI5CgB(F;XgZ)\5_Q&XA8-(#ICF7I
5-YLILRgQK92f??BgcQ/];^5.;1:1&(T.?@?e7O5Qg;gO^]O+:7@13H\VS#Uf.(H
;L_[W-ga97?9]GQM&BOLN(bZ2Q^D=R:4O]RO,MHTZR9LZ7XJC73;EA2)BO+_aeM_
O7Z>UfSEG/+7R-X:I:dWL,AQgeab9E2EM(GH\BUFW,4S<Q0FJV<&_G^;74^M;STY
bbFX0VOP_CW-gX[gVY:C6/??U5M_JFb9A>NBPY(H\;a>(YTF]^6.FDCA:#XO6D9a
RD1KTG.V,Z([]B^K)^&-C[c&2Z56-[X/#?J6S;FE9g?#(3=WEY)QXEb2NO7<P),)
I>b@A3B0,N:9/Vd/_&@H.OCfOG(--1VR/QMd;(5LLF14-Z+Z@5bFe+ZM1@4+-+Gf
YD3UK5,YEBO=-XXWCI7\g;6^9)Lda:9Egd_)FQ#J87(V_(X;=6X7b4J2Sg6MgK<R
FGZd7D(33P^Na9g2f8(3ZFLU6He_26UA=eK]G-L9++IcTFRI+T7.8OI7:U/E)>)a
I(>N+QI20WKGU=I+9e9YX^dGXA9R+/bFATED6><QU&-5O82G=6B(W;fK+&=K8KOb
YD4.6/I+=RT:OEAb>GW=Q?CeZ?WD/<7)D5O19JWe.,^I24^O2Z);\E?U(<UL:XIP
RT&1Z&KJDUKee<:D<R3)fQE/aLbMD&9H(+1<0J/aB0VTNNBIM=U\C6F<2Z.TE.=e
a=]:(W/IV^dDdP=_].)dM2Z#Qg=1e9SRZef0-4<+<QDG#GX6@8aJ_c6gWN]B^A.\
eO=d7<b>9X(4_H)(&gK]6=[VH=>0;TVb_5bD;DWAV_ga3Ea=K=f0dJ+BdZd<;J,:
]fNME/-0deUCR7Df))W_N7Q)0(/6T]fDLc0ETdHOEOPSgDXDHgBgZS<#Q424_0.Q
g^HP.;<X1LeO&XSb)ea.@>a.GL#>AL6])DE0CGcQLIF-X&bCR1R_BYFSX4P7fCVQ
0+EQ#BYBe[4U27&I/S+f2/YIS8=20f8:,S/L4W35K92A.F1LV<7#6D.)^cgT=2TX
:;WY5@)_Z1#NS:0^?X/?.\Y-,JZYKa3KRP9M\KI:?N)L=1MW7Z6Xdd)CKOHb?0e5
F)?deFHZ_>gJQY]f#5E5?@d4;6g)]6]\UAe>7_JWG;R(F6L,(6,J<@@_K,N[#,3H
:_&0B3b+\5TgV\__AO?^>3741I?F/>_b_UPR9d>UZ+VRHKMM=^=73RUgc-0]COJ>
PVd:AP\WG]>E6?a4T;1;F69-Q7F<daCGE^J?@+[a,T4,RKPbA55fI<W@FD;GX<+F
]b_C?ZY?+<2XaCZ5//)/4?AdWPYO?FRIcO.fD/[e-/0,3Z<FaLZJ6PX]ST[=bGfA
X+,O.3W,D6HHeV-=GD9Mb15b8.b]F_4-R#/YPFfb1\+6NEWN[,2;:Z]37(Yd/;=2
K4)Mae2I3b+>T_f)G^:&LN_;)eLHTa]:5>XGZTa=:?Q[McDeV_>@+27-f:H)XTHO
UN&520E>;TT;#QXL+SQ6[R2XUM[,LW5JLFYVf)F82IPDB];T9W9WMBV+V:LGJa=6
9d@_RbQOP?V8963[)Y3<6@I8+#b4+KVKcXZ.R(1[+RKQ5/:TPc45LRM&OX#RVGXQ
ITB80A&>9ZW4M&dVfT0+0()Z0?37_bH+eZ7fW.XH1VASNG+cIGYHUV(OMWW()J>K
9K8>5:W#1VDLF>>B^7)-N)YY(KS^N_0Q:XBFf+.He=,d?gJ]7Xg>a=,P21NWH=P;
&G@8R3D<[J8QRb]-TT]-fERA(>?RD?8e+)S:V?.@[MaRcA3.S9AH12]@aZX0-#>,
>H<Gf^g.(DcMHeZ34H3Z^OLYgEZ3TG(:/._?JaG4P34eRT&TfV3HZXBA24])IHMc
9MF04APBF=E>1?B8;bZ7#F0T1<R#+Y=QW6.H8PX,1?.I)d^,QdI0>QTOI&UWBP<Z
^XFf#4.:b<UC)J7CN_0-+26eeN-@#e.]4JPJXV-;G@.D2H-HRKN4YRVV(M;C22(1
Qa=Z5;d?TGMQ4g^)W&N&TA=T]/SWM)CIEFU:X9130M(0T\.OIU;dSF6SUGNE3:c#
0a8;QB=B6H^eNf0814EaPRf#JeG0^VTX1eUD.YJ(DK<GgPT8<RZ&DP@D/XN:=KHK
57b<bge6WI_3N3T1eM/)UcHD(c05c+P8FD=VYM[Y/W4Z6c>f.Y.;3ZUY@YVOZc,P
^9>:70DeO<fVMY73L)a.M^>L+bQ;3Z\<UGILR,4eII1=6WNRQ(cF05T#7d@V-O_S
(G0/#Y,13\L/L6OXPH+8X-,J/A7fT,6#IXS9X+b&3W>OEeJ4TALdV,SJWJ+BH,X+
QA-#L38@XeKNGRNCAYQaJ>\fIQOA^<SUMEdOHZN5,?4UT9NI4>OZQ)7@c+)Z+e5_
3#5Ked97bL=[3Hf4:HQ(&5@YQfJ@#U=@?)US^;L/IAAKHN-_0KBd(0MM0g-_QTg=
SFGF6;?&?C9-@3L2dZR;F.2Q>N?ZSL)E#YS&K.UP:(T>M&=c+d+YC33MD^G3c^I#
NO+;M)^Y>B490@_+WQ??39DIO.]D5b==R1:1A&,W3=3f1A^;UM?3NO@41F#c8/Q;
L?.(-52gK1DSIY[f9NAg;Rb20Ma0M8eX74/-2REP,aO93PU>MA3M+=5N.9G=VNCc
E+]U2SHUV=Z.++ME;+Q4M3UQ\<94JW)R#@4V6WEUD9VcI40FU>@Lg#D_&6[([OO1
X-5ZNSE&aP&/F=0Y8P^DQ(,3?Y0]PY/KOUF:R4]Md<f3]=XJ3?Q6SeaOBcNV]#XW
>Tb>KZ]JUQ06PeLggM6-M4a>J,EZSW]e7eRg\7L)@A@Te-G#_H0H:O<.<T4SHFd[
AQ6>=0a+B=Y)+b<H5^B4H,2E1#)Q3LT=7-#/Z/,4)NTWB,51&,7&#UR6ee)0.B0_
cZIY3UaEPVB0WPH]@WcR#:=[K>/,)5PW<<PEFLW,^CZae=M47W\I2fTfVHb0ZeVb
Xe>LU.--KVVD2eC6AJJ5[D;B<dT-a/PD08<27RQXOH/\;H22693aC08J4#;(EM15
+).a\T<^NTcSA.\?f&<G=:T[4fW?A,Z6?>XIAK\Ra[f<(R#UNc1C&1N/D#g#PJeb
@ICEf&&UUX\NVE2?eYXI^1W1S-fN7QX+cZAN3A=6L5UYf-^K/4J86f+\@AAG4V_F
eOSRB866117&RT?,-8KQ@69/eAB(M97,4^3MEPc;\#^((_G@g?Oe7Q[aQHI[U&UD
DYOLW71d?\>QgX[39[Y1MM42cGYI1ZE.c(e>J9Sa4\65S6\KPb8+96>>b+Y?ZPGM
.Z)3]BX2<cD&Z9R8V2)A_b&M1fSGdX3>UK(_0/6@XZ-LZ/4_=e(?S-Gd@GPABX,I
]JcOfH09aDU_=a#TaZ#6+JMO[J&<C.#VUL0acCRTII<KVMTOQVR3D\G-/Vf-8\=&
5D7WME2:^C5WR=B3)(K:5OFaE(Y?g7f,e:ffZN;F&5F&7S(\UO3,>dJ\/M^;2H(H
2KKUA2G3H:@-3TJUHa&O?#>IUC^.,WC2a9AWT7M158AXLA>70^X1Ie0.H.8>2T6V
LR1MPL9;M3GT[H\+2aY\aV_Y,9MbHGUg::I=J/RGISgG+(ID=e2Da+e?IDM4K:<R
caSTb4;&=T7];RfHD#cD=4>YYf?&\9dQ#fND0EO<EeUd<M3O+gAP@:C/-PMg6^=H
9Z&6A:;M\,bVG<#YN02Y2aZZG\ZMD(PL\c?N_.QK9#S97KJ-Qdg-:F&-<e-G6\=H
a\6@0FLM1GNKa:5==-.O#>].2QMMcZC\b+cD=8OZJ-X_V^fYACPXJ-Q#9HN[S/<;
X90ZTH<CM5TY8COJR14B9QAZc;53AXI9bcGT/):Jb<GNG^_I2Q?Y[Q<K4006Ug=E
SGH<69>LB,_&D./]dfb)U3[0_\Z?ECV.MX?]Q3OM4_I2A6K]6bH1eIG;C&N=d@:L
LSFY5JYBWNI/I:-8&-8LdN\)]1Ye9?I[;<cISRF[+:c>5^H5,>CaS>L_07M_8?RT
0E8;aeYQ45,?#WSE)(M+TIWOU&V9\3G)HJTIYXMcS^dbO3?><Qg+,D6c=CT-W:=\
Wc]f.BN>.&=X-Mc/cH1[Jd/+PXa=eMWK;K)((:40OU#J&:#d<=G.UAGaJ+):E(;H
TWWXL;d#^4J(?U+5>\J>DJ+SH9]@:3?:O6<1N:NU8a<9[:B(68;XQFU9b;G\,3fG
^)Q:PY42^\U-XDaK.?,eC^HXNC2CC]aB2]8ZJI5,0cMC;42I:#PKQ1FbTSfMETOO
APf\f,XJFeW54V##gU3f3YY<BPd_F:Ie0U#UALY<7Rgc(<BUK,D]HH(CCQK;Af\M
:23fJBVb[7;W].8^+ZQ,QI2@=V.+^a1/BS9D4^e0e:8H3U>d7S,CAK]1/c1gd]R6
8+,F:Z8I5V)CS)LN[+@L6-;R5R<\@F/J6+NT2^,HO<3a7U0TF3,(D>SLGRYT[C8R
^,4OAcS0IQ^a[X8;7P[4.C8:_b,^RdeUWg]eG:<N(YO/Y,G_1F+#EC@^YZU33H.A
28>EEOWDWV)5KfVO-^U)=K9e[=PI63_-g:]/RYcNY6=(=NYAG-\3C?F0(\:0QS)S
T\fXU942f]X:RA^JV/-1;(<3LOaQFV,<18T/#I2GKWK(:WW?7W@a6a2/SOMV-?(N
^NGU);\fae#ZH^L/8O0M/Y/&&#f<<#?ef\XG.I_GW;2EH7A+3_^W47ZGO#gN:X)W
SR6B;F[>E0BG>+g6TNa-FHQUB>ZHPJ17/QZ((R-<f9cF+Qc3)]=c01+?-[3D^>K-
J41bRGdeXGEU+NE=&<a<J],WO?UF0TaG>KdM=L+K;b<4Q/INZ[K4C,]YcRWG&fOF
J.dQ:Uf[R)ePI,+G+;,Z0FV/Md[R#@[bN3P=9WAeEOdU0)G.9X-0AX]C#UC8/FfY
W9HY:HA:&@c?BK\CGIgAO\OM_8(d[0fQ@NA,baSF#;L6;^g]9\YK(#8KL=b\;3E1
OIg<+g:C,[b5C[T?&A1PX5;B54)4JJ)#HWIcYE4=-AUbMQ4aZ?II@LDQPM#0gY:7
6A-P8(TQ.TANaFJNU,)M[b9f<[U-=LCRcPRFg<cA;C=\X6I+>QEc1^eg21P::5>C
9e,_+3FTTUTSBM117eLU?WGf1W8/01:R;1d#KJ[07EK5ZEVY?=HE,6^@[A5FGHY\
V<OV^+d+c>_d87a[O]86HIXbP6BAZ>(6b_MU(C<6?-H7V^D&]cZ#4@DU^OOJ2#)\
gS-Y&12@[WHK;]S^.EX,3:[#TdQ.N^0LScU0\4d>724=T9(\6gTWXXJ?/,d(-6DU
#S)DU&&25Xda=fD2F2]\-1^HDO<9\2gO?cT4.3=f]M4E5@_@bcE7RE]E?C,QA>]>
=KALYVF5^S53<#8UN8Yc2>?b6I)DRcK6[:Eb;\SU\:@CR7Wf9^a:/]8Tf)\U2FL6
:g2]>>@J,T+dT+B4V4^&_=PQU,DG\VN)a;cZJX)J]56[f)T-0eQDN]a#]U]F(VEH
cSDGI+BD3+QBD2M/8GVL2-ZLH845I6-La5cJSVFX+3WV^QTJ3gU-[Y<OCdV2b]fL
ZO,-8.X#MdA8]QZN0?/AZ2B12Z1E4V^DU<Ued2_U)C9N]D/W;6.4B+5dLUIcb:8S
aGLCVVB.c\7/BW#HOcZ:S-/(OY]MSU]cN#+)/9>(?4Y<J7N@a>U(Z2>YGa.ObQ[P
e<W]#Ta:0e-0b0eB1bR]&BcJ5X+ADL;_d&2?Y2@>IX-,9X][22#/SJ;#>4#W6CaA
6N_:2Vf2MHY,O&aAD[OFM9QQQWS^7=D1Q4HGGCH&+(TS:)[-+Q,OXI<dNGV/VgOQ
:+_0c6IE>Lg-[FgWdWGf>7)@RdB,;P3?D()-cXQJAA>&#78.(85O-YBH/\SN&FZN
dPTXY:U;(+a9H+cb44aZNO]dXL+PJI_X[IK(^M2IT]);@@WB8_QYMbPB6PU_(3(]
7BGXHVSI7](]f/IA<O>]2.9QNT1Q9C]RX]CEOdUWZd3HFY<d,,EJ7ETCf(bOfCY_
Ee+G)3aJFX2(Tc#T>f2I>\CXL>c^0&:a3e5N1F;>29;?\1&?0V=\Z(5)Bf,fH\?R
F#2N-J9Be,9]5M][D_aMDGMedDSb11c(LDW:DK\YCe5XC8Zc2W@^T41LA6=<b;<M
#+K8Y2Q4aI<P8+[GeQ9S&(G]UE>A-RfcZ6^8PLJ24C2:+P#e6MAf3\,[/e,=SgMM
XcRCQFPG&3(>\Ee+J&\=W7gG4.LRE3NALU@_9.EL\I;K^UA,:8ZIQ5M6NB:1Gd:P
4FaHe(Q3BPc^W)#c#7-L^KI2](OePL+^_])/#4DYAHSX9gN7@7MVHfVD>Z(:#2EL
Kb>UZcgOWF4\T=T(W35Xc]FWd(BV/LO2M0Z[@NO80_FfWfQ:,<U\^Me;YL?A#73@
9L@[-\9-dS@6K;CIBOL)]3YIK8>dJ^SKL^HZE?\7?M]KYALL5^^D2PWeN]EK0)-C
_c-gAg@\BD&Q[#-JVgBVYVJgPV.MG3AJg\e.EQ73HN9c-e<-HZ3\1KPD)-Z(1-+Y
?U=3cDB#&.:<H(8?9RB)Ba>cT;Ke>YM:H]/OBK0=0YO6A6?D\[\c@Ob58=D^b7>+
6gM((_#H=3-@/#B7a;\0?+6bdag=WS#a=URN]cQL-/;;P,+S6Jg[,d^U&F-<:X]]
CKPA1Q/Be=ZUP]7O#Z^UWBbgUM1=Z-fN=C(#NbB>\+6;d6?:6)WA1HTD?_(BE-IS
B8?aZN=T]f3CVTV4PB4_(HcH_596dCb;TKV_7-_)3Z(H312(dIMab<NPPJ7A#OP^
8=O23#46ec(?OT(ePVg2LE#28R3?&[G=^@3Dd(,cD;I;g_AGLa;[Y99G7.fNe70]
/^5Ve-P6c4c,g=>b,&UKgZbJBYF@D?&1QXN?TDCaGd9ETc&TU,.92ZYEbY&JCI#1
KXU(a=+PfZ_7<;0G<PL>[_SWLRMX@&&ZG#;7W5IbJM4AZPNFBI(CFQN98(#3a&JF
7caEHTD3B3MeO;AG7d2g@a>E&Y.)d\)GCUN5A/X.3gc23=.^gZ_PcdDH23d^THDU
^b>&EF44)4&E7]]LZ_dIe;RUFP..GBT:Hb8(HUK0YY]M.)X.(]W\g.[1DWCWBO[7
^a/_eH)/WLU-]SK>#g]9RR?A.10Ve?RK_.:,VgJD@^d].C^)ZeW06#.e(V\Sg3)H
;&_c6:5Se::Y[bLYM0Y3.\5S<5?X-Oe-HJ]Q;;HXdPUA>0\I]^?d,:OT<VaYST^W
CHfOZHcM2gX&<>/)2(,\?=14S.3BAU0H7U#RfXeGHZAC058G6GVeJ]&BAaeA>:[X
cY<)YEB<e34/:V(PYeCE<FM4GbNNZa=PGI9TPKW^=9=Y\YV@aUFP3@\,UQC^97M>
944,R#[fNP0bZ\SbBZF5WB>AddK3Mf>3C8HM3Y)FCfc0aM<_Gd3S=JLNbIC..[GT
(HS]EbLS]HEI96=GIG^:MPYPK8#TU6\D;4/3_S]+XaG9^?g;SR)A679LBV?775GH
Kg8P]M92bVgI^\7T^K34E_7Z48=fdXW0SK^P++#G+NF_VIY=77^^#._32&/+>g,=
:(8E./F;@_>GX8gCFK[6=F2[/CIeEdN:D5+3Z(>2GD8K5FC>_H_8N,]1#;;62eT?
N\9]/]9=gI1OJe#YVNc19H:ebXMXbQ34D)a\7]L4cNW:C91\A?CeF62LZXVC?(IF
AIYbWZQSUdHK&IUJLB_C61TEPAU@\5F(IAN?TKJfXW_Q,2K0TMWW6^OE\Od5HDU8
^bSLZ#.4^c-Z=H@ab]=;M^(bI)IX3.D8NC1e^:ZN)>IB);,9daE]?G0#K4R(]RDd
eY4,eK_M:EZ\Hg1T^@-;U,gJ.<3F<+a<2@]@^@VI>XIgM)I.I._,8NIF:X<5D8-T
OWS;^>E_^UL[1,I-+?@f<O?2)JdWIDM3\V=N#+0^AVK[T4T?bB<HGc&C_&29&_^X
)N=WZGVXV)LW>QcT?8g,,RAT+dWgK<VK/\<@1#3SPYD66e&@QKgI,P7&MTf:SC<^
,P^OXJ^Y&Sc/Vd.#B+&CW(S]TbaSK#7(,5GbF^KP#K;50&<213B+A>O7VU(1ffQ(
-\NUT?,MZFKeU0QE]aE?b.A\O^FB=?:Rf9<fBTM5FE7B)8<6CE/D<1OE,Yd5dBL\
K)dH1#UWEeQL[GIWRV)<??^/FJX0^LSBWIM7McD^GW<[UBV4CU-,aKd?6Y)<Zf:H
;E[N&fXbD?<_@/,P26HWdXN6_-QFcI9WVP^Ya+M5ZCI96/S^WJgHU-RJ<0Ecga1e
UW;0]a,fPT&/:BN204:@3b>JeCG9#YQ20@3b=H>1CWABfM53?BcTFFB5J<Q:\e6(
]9@Y]gH,(f1^.=W=&Y;)O(,MJ=(.fO_=&==X:BeDNX9)^AOP;P+c=53daR00(2Q5
;JUe^,aBXI[#N3AK(OJ#6AgHPe>\/FDgZ7a\OJ(M-5]VE+>9I[/X7S,9:7+<GYYd
S0VP2W4KLZ-F:c.\=#BX\.2C4GR=7fOAe5S[0E>JOg]#_T+,Ic?2_,IbU;g]DcbV
d6P<Qb&c96,0OY_G#(S].-GPA5+EUGKP,2BX225d4:B+RaES:Md1U)P0Yf)f&O\f
a\O=WJ]3SU>ZJeP?AZ>D>]a#2#R;&\E)=2Y,UV\Q+G:\3BKV8423g:KM0QI4SN3<
7LRGcW\&RD[YDEP.H2WD#^?c?AMg.[0b]3YU2(6]RE+b\QITKJ\3LB\3Q-]T(R7X
2-J#AI7b\U&RbNXb/8U,5<J/PV+[3abdfT.F,T[DcP__(.K+I(UG=TaU3WC08b7(
X;F-;QdGf6^<Ue.<O#I_6B><@+(_3Hc3J\@[H2@[ANSKf],e.1)@B_P+C/Z>07-0
(YR]@(@>d781faQCI_C>XX6#7bS,JD&LR112]_M&BH2_)I.E)=BDV@AZX>I5/_B#
7?)IFd=Ug]30/GGSLF\]dQMZ.2F80]6Sd<g#b&;eB^JRCH3HJb1Of=dRL@X#60T\
6\QeN4N[.Y+6FcF;H4468^Y:f&G4a^f7E?(D938HIUD[NTeP/)4FL?3VI,OPPHF;
bR7QL)-VO&AJ9130fNNMU];^9;4K?PN)b+I692[F^G/0:T-VcA=D;R6[S#IJRcd9
bQ:IZ(Q@F+03caGNBL^2DeOW[/K@GA26;H55J3[7W(ZA]S):AA(c09_FIb/30#Y9
=fL8B(Bc#,3I@&FJJRC@1)Ba=3]G>E>fYDaL\?(O(CD]BD4F)QKB;D\/2X8=E^WY
?f3aCLO67-8-M+PC67;g:cbFbTPbO<I-8QJC73TY0EG-ZNV(WbU>KbO-24MVAAO-
#c2XMUW15T@UbKFQ?;)):=eg9,-G2@<A)WE69a+)DQXaSaaF^DDQ9DV#0,X2]HC.
a)c[#]WQU#G3H8\(SA6H9-Ic)JVLOPgfA=P9(F;a:\&O)B5[TZY.E?Oea.gKDa7)
@N4;5KC_MDWS,H[1=A\KC08-,8=)21X16CX4JBA&4Z5]SdKRfV0UE.c(Xd=cMg)@
CdcT5#W&AW9_F&(C34[5KV<c:?KeE[E5bc^bcQ9.JUPAdUCONQZeB]EDYd/3J].T
b;c.1G8[6SY6Le2#RGZT_Q[=+9fY;e7S+@_K9NAEE(:,[2YE.E_^--KP@b@YKF:<
ALC84:33H)(bSZ/KTebX0a7E+V@00E1KER063g1_9=9ASMg[IWMS8^VYLe(12NE1
@_egcP7?+eT,V=Pg\M6)]SGG]N=e:bYc3JA:Kbda4PKQ.UIS;K\S)C:FZ61NTQ9J
EN(HaWWSC2]EY48AF+7OaIBB\+F2WeE]U9OXTMeS&TUc0-8&LN=Y12UAM,0Y1613
)#_R/XURY67;O\5K(O_F7<cPc_Q9fAYc:bU.>N)TVHUFE4VVC>PF(@74K-VP\8(^
4WeLHVE,+XGR4@fc^eO)APg1)Z.CX8,[#?/POJUSd]CZPK^O737+Y,/&bQ1Z.2<[
,2[W=8>5H]0&Og1VJE?ICWG>\:6SE(TTbRfg^_g:0+P8P9;Z>,P7FfLLRg\_:Z0G
T6Z?N0;AI\cg&^[C6NA:Y,Y1bXIQKS2MDR1Z=AI924Q:+D51>WMFbINYeO3A5>+1
_5Q&_,eWS+/RT[:MCA>^7,Ugec5-FL7Hb)b>#E8PCg)J=2@8GN7/P-4Nb3=H7c&?
c>P#ZZX\X/2;JZ[fB:YT[GDN?=I&ZXZ<(DJQ;da;X^E0AN4<UNeYAVE:[-QC;X0b
@fPZ]K68VWc0[4a84+?E-??HdVX.VEVF^R_<E8Cbe,X6/E1_f>5=#C5(f_@O69X?
)2JN9PNA_/F67,&_WbQd&CE@?(C:KUKaD?aY^X)QYP::_9X,DG&7a[[2;\8Saa.P
bX&;fBV\Q?g8YI8X11LC(fgS[:BGP-KE-S]-.C6SOL_+E/9O:C^9^,90\B13(OBR
J(7^LW2gBSSFc^VMNISZ[?Mg^EC2DC8.d>?fcF1R,[)a?+R936f_EX.)+;OAPZQO
MHI[)-YUAG@V-=,2MG@>/H?QUTT(W-C<[USY<R0E35>+Vg6SK7gWb7Z(SGeB/0P:
91BIeb;#A,g;gNF(Q=7:e#XIU=:S.Z]8@f@KKdNJ[0K5AEB/9Z>#HCV&ScDIWAT/
Df6Q2KKEdUUMAYS?(7cH)8VJgB/-R9<\_9ZSQ]K=PbQOEL35<?348XNYGT:KHGAZ
6PVJ0_DW;<[#:=QHW_X3U+[HD[24U=8[(EB1[?P\;+fFeW_ZXQ<:#&4T9.QRbR5P
3J,1&E.cfI9.(_J<>PY7E2]WI/eW?-+If5YQ49-G=8S5,21,g+>RPTfK&bIYab8?
[:gbdCcUQ:).ggW[d+<?Z\^^Oba/IMc+KUA>Ga6/3GML_eWCT<D?(>M;^#ZC<9QD
^7CKJ^F_[PCOCe(>;/<ENgKC-,+SMc^_BMN&TDOUA(3^\9X,0O;-/4)L,H?4N/Y:
EU6#E0gR2Ff@\=DG=3&BNMW2FRHc@_aVg)g7fe)WXTZ6.C@:G4/THF3>US9Wc[WL
e/NK]B06ZKg+Z>BHUVD2FRX^4\&[UT1W:N[BbLU?RKbR-ULR0@UCS?3O:Q:^]RE&
[KO^UaYNKcS1-3:QfB;RQU=Q/?@WeM\S).^M\Y/0@@CB7RT:@[VLfg(G7FU_ac\:
aEdMLc8TU:<O8C]UOE+WP,BM:VVT@:##b0fOBV/<-O6d2;VC<189ISa,_\HOHLXN
4<>/ePQWHeR&-AC+.J8#ED)FdJ]H]S>\XdR=R5WfHd?[Tc.Y#&ba000U7^)X[^4;
+,7(#V<>0eK8DWH]\aYGM-;d[X:DR?e.L:YJQQ?^[cQ\0_f#,WVVN,J?RTXA_\,?
@JQEQ3TCdT>:#VH,JJ3DB0P8HN63gIJR[258=63@g>4>-:SM?7>QEggQH>-3EOD0
R.).N)7/9Acb9M8M-Lfa&-Z6+1[HGF4Z2-2^.3ddEWIG0P>J-/<VM\E&)@E2N<KT
QH@D-/CbEPA4>e)&g@fgW=1/;4.T?gPLELa3SRMAeHMeS4RCTcC1A978/eE.>/aU
-_,QffcA@BGS)bAP#M:=2G/01Z>@B[ZF<gf@HPIJ##\^;J1(<Z>]5A<59cN(6?&U
@MdW.DCVeP_4#0)A=CC_8NCF3A^91:1R-Ud:1)G)6HDTODbD76]T:HN;&W)(3^7(
/[L.72[_Tc&PMUFYMZ4c<Q[\g5?_BbC_>^_0#8.ND-9#A/><)O1]_F3_NbTVRP_L
^6?Ccf\I+9]_\BGX#[X_bM,/d_,()A0X\dG4+c(<U+B/?^W>V<9\f3=?WH[9D_=+
d3J(&VcQ#PUD?Pc)VgIPW79M\gR7VF#OKfIT-3K?6.[S9RTC732680aEU/[=f\4X
5;+g]MD3eR6\4FQLCb.9H(G?N4Bd0?dRFZ^Y-)QQJ5HgQ5&ID1,>6,^d,0,V<:IW
)=LJZc_1JHQ,;A_.9]O)30WWVEgfQUHTDZ.]Y?fF@^.:PF[V[M58K=_F6g^,]JNS
Fa;M&O#0XgJ3.US&1TU+XPOg>eR+IV)<6Z\E+M7da;1^8OW=.JH<dPPd2P:cW>e;
GMFd1AI9;5L>K79GUQ]YGgdT3@?VFD_8e#;:_a.Y=b\,daB:K:.PT[DSf3f5W=_C
]AU#M]D;ON6[TV]X_PC=a+:W&Y[VQQ095]KN:&B0LI[]+?CK)=MGSJXU?bZ[5b^,
1JPYc4NMaF9Ld0R0EZJ#)RK4E+=\c2RRZfcX(@I5K]4fdB]];ced]R(O2R\1??g1
,PQ@XFf=#f5--EE(0.S;d2,BB5_/:030+>)e3B^48NcE01L53E>:?7T.f8TFR->-
0;J,K0@N,-6:OLE3G4A)C6XK1F93;2fc<#L>_U#dMA3TX6QM?]_bU+ZSZ,P38PT6
Y8&9M,,[&6\FbC)W+U.gRP#A01<A#6c,BY//7O?A#SZ2XQffB?^T6Mg?)N]=AF7A
.R&HZF\8-&)3;J50Mc]8,7(OYDH4W3<7[0Wa+I^b+]MeaAZ,f3Z[.POb(aO60f/c
RHfIOZRVL:bg4AA]5e?/+K5]8+#ZM=21YgQSD>1;TOK\/@EL0LLE.;OTF>=K^/R/
7+_=M@#&]01YVXVHVM>,8g>e/,T)21=:A]I2Va9SO;0>c=OF+K.:KJW#(UcbDN]N
4cINg[JVGTDeCQ\WePg7VcN-_)Vg8egGe_]?+S:DV.&),:d>3NE_dB,_0baJ@2,4
4(-\4Q8,HOScMSg:702\[ed#1[-@cETR>_WBL&3(]@@.0GWRNbJ&UOZ+8>VS1Y52
c&2KJE_R#YZ);N9<G)K&CNa=_QUDTX4F8b-HOe[VHYEM>2WK=G/?KPF&ZL7/9JQP
XFC59YW;[FO852GFE.OUI+(,gR48g8]M],H=&faeWJ5-a6&&cIWWfBd,0U\04K9O
#WRII729+1Va:HEIQ0TR(SQODK30&Z\;8U9ELd6;eZc5GP]YbY<Q/?6]MK?3\E?.
W]Na/5JQ^88MH@9TIecH(.N>LT?MF^@A)(]fgQe[Kc?YMZdX><CZ,^0X,N]FO&=A
HN7VEV0gVGUDc63V<GZ/9Cb,_&IA=P+cDUaCPg7>CQSN_@g(bLCWb7HF(=7d>&0<
,GI3NeW@X?O;LHISAXO@L1gg.X(bTGA=^DaAQZ/#D_(E?Jc195Z3;W6GK?RcWI#f
[,;U?W[4-_Rc96M/31AdYE47>EXcJ9.](A6)Lg@\](^^;WKU9c?<(cKHg+.T.a9^
ZDEC\2Y_b#[>MXYNdg8IFe)GVKX3G\H,6PP\BF#YP/QFceZ8#G_S=)N:.g?>DV1D
VTF[+4,CBY=@K@YOS1^NW#GR)ZMgY3SCZJ\^Wg.M1gc\XHJ_C)=PO=)a5.b1(2Vg
4Aa&.GM\JMeJ1OVTHB1#>0=6ddB-Pc96EC;3]>d<[(LRK&^E64?UC5YIU)FfP329
9c^.\<F1YM]J6R@</(G.1dRgK>:8)QeV^];5UM04e18K>TEbbUQ.N=d60GRK.JUO
,_F<SeDd4\-d;fZgJWO[NH8,Y)JRc1^GHAa_/2J,K&1?]<E2>EY59[8</E.V;B(Y
NU&0#]YQ(EA?7L(KQG6/P,0Y?H+.]\W=#PP;]A/MDg/5B]5PZ^G;^#P27[M+9f5W
OJ4F04_QgZb5TY2@A=(]?RA.FQXV)\6KF_L\;W&=7/8C:C)\I#,1):?J+Q;efOSa
f8-3606EgV5YR=7GF#JdYC;>UXB)gK9:N7>3A&)_POc(PAX)DFc?@C_2+He#?SEG
e@>=7\8?caFW7CHZJ,6[>W\54a69bM>;H2SZN(bEUEX.b,[/W90F#=DgSA(==LfA
Z?gBd<#O+QR@@BcKOC>Q\-)#7>&c6bgQ_0RfA-1<65Y<R65?]H),>a/[dNK;[g];
SPd_MNPQ<c\\].?3E<DFTc&c02U@6;3LG>B^5_NEQ9O6BZK;_6AGV&\>WEdbY]\@
ADQ+ed:NBB/PKMG?e^3JL>c7?,4]NNYD8W\GTB08JU&e5_>ge2:M.Qb(&fV)?gE3
6.dcBV&Y^\X8C@<\ALG=a&)+&:4O:MV^cTc7NZ(Eb0J>MVKA0\>0)G&cN+F[65)a
0aN=[HCZeM+YU\6Q:[gU;E2SM:<JI+G@<5NL2\_3eG;W^M_VNEQG_EWU[2?fZ;:@
.I8e#());gBWFV0)#KT^K&76gJEH.?EX2ISBK+,<[CdCg]RC-YA+#Y[5-4)55e.N
_=&a=:Rf89<RgB/)KR/e>^-PId]]?gU).[YUC>O_?^PD-(G2(de/9.<M])<DL)J-
2=K4&N6RF?A:.[S?;c?@T.OUZL6_;)G-46_AcY^Z-4;F^+)<^fP#7QTOTfGDZ[c]
9MYV4AC&EaRB9aR0bX2Zb?Z+?5>.SA=^Ng-J[Y<3?]6F-Ec0;;abgJ\gG2(),)P@
(GA17eH)+Qg@5W:L4&RI[[-1AQgARC0^T7_?0HPRSW(6&GMc;#)RdaBb3Q:&AXQ#
UI4G\<bV9BgM0(eg)/NQ=<65_77bW_E8GVEOCP-P;.J6,G.@9\W6K<C8=P2K3L3=
DLAWaV0+f80,N]GQL+3f27b;:?QP1c[D27K;OAC]8fR=V#.R4RXSXT-K#(/8NdCR
:PB:(WUZT)d6;DRHQYf?[ag0ADfgb_@[,CU2PPH<WGUFM:d3M#,E?:D,[)I,TO>g
=_>2GZ+952<Gd,H)HOARF+3<OND8X5Ye^JC+.6I035;7J9/=g.aeIHH;VO2:QWYe
cF>?C=f?FcQc,&Gg3PU21AZ;E@+LLY-+D,=4/9ZXV]TO\)#A(/V_\QYI,).R,U==
bD+Ydf/+(\B;4d?E&dU;XPW5R]1fMF8C=B0J611Y.AdK8bB.V=I<^Aa;5ef=+U[#
@3_-V.:H=bF#E_+)C/^VR9EU0QgR_)GYaB\.1dHL0Q0gSJ.Qa2W#^.3FMT2[UDd\
>?>?L_NWA<-46JMA9Wg5a2MO0>V6+HJ[JR)2dGdI5(_SHU(VceX(JDN3@CYKI:+@
5fCP1Q3eC6?6>Q01Ad?]L).9W:6EXBNTC,MY4^?;c=X@W^)^B4IWcP0E);OM,,3U
L)f)M??,JI943GV2Lf7,AgY?>f?]\+,\G/6b)e89D]?X]P.bcOC-P:XV]V,OcK1B
>/:Af,[IQ8UCO@].=1FIWA;WS\KK_f+cOE<7D1P.<7O0\VQffB6E;SW?O^.Y@D<:
dI<[8:W]8E^BKQ&U1KM3:eZXE55-2F@0V21ISdFMHW/YFOa7IS2XYUX)HM;>Yg&Q
g>@:[?O1NA7067TSUFW<Ld2[/c>HZ>C7X[CbA7=\&bNe,[X]TS7QG]g6/bdBU_KY
\1/^>e2g+>P>WG^9-^ETfd67&EQUQV#1/5&Z@/9;;?6K+<b@^Ccgf]JRLaE#J9g4
[eZ:0B4O+E0]fCB8<&9NfAFW_:_J>(bFM\,K(PEBB=O54X\8QM[,R.CWQY;^OZB7
_5\ZM7b3L2\ZA2T?GT]UA(_cfW7\R,BB1\L4.IKaC38LOW.c:T4):V4+Ebf3LC>9
c/Yb,MDET\5WFHM=0J1dc?-18\N0FS6[L..gJf7?g[+/M5A>=G[Ng-8.1Jd:g+4a
GI<eMDL62>gIAHU5+/AGO>>NK&1^:V/8WbS=_IfO,S.R@bP/Wf249cZ\KH\[).TE
eY;.97?5JAAY2B+Mf\(PHc,6OV0.VcBe\F0)[_=07(S<b;K6Q&B)_5RV;^+@BAL9
gb+N@&TP)Xc+#-FQ-.Pcc&:=I_K]L1>=[d:S?[dR?3USRQYQ0#;d8g2?A7/P(J\Q
9FgDgHI#I8C\/dT:R]44X[&Q,@V:.LbH1#MU83=BIgR-Ye<-g+S,C]0==VRBF4;;
S[d<;-1,3fdLQ-5@54QLA,0e_AdKe4L>f\R>KHA1Y1efF2I#<0V74b?=SY:=J_/D
9gb^0Ra?6[8&:FdAI<Gb(\)AFBG86:??E\(D:CGVf+\/Z<1KTd;[Mg?L;TcM#>Ua
RYWQUXgY^\0U^>QI?Y^4Xa)H.&13;KV=c0A;cN+b5+3D&#US_/WIH,5+?MJ4N+45
@C<PA#+M(9HF(bMXD+UaU(X=.GAf59?HNXYN1Q>KS:S4EZ[.4;S7/HbIP?WH5PP?
P<6]d56EP5[A48U[\65N#gdSD]NR?^X47]W,=BFJ@GIf]J3:KFZEQJ,X@I(MHRZL
Y<Z.WO#8QYD18W_R40_Y:bfIgP)<^U28?1M(9L6g)cTFb7+/b=0UE/..d<VO7f)2
4a0LD[C3_1b;ZVHP+J7C-)0^(1R;M[)Ga.:YX+H>FTfIF5S@>8+XE@)3_8XEONQ2
S(1U]d^>Z,E?NQMN1Cb,HXW:>S1M?e5:/#GZGC_g8B?]=4KUfGCHN>J)@5d=K51_
W/X6@-]gFZ&7=^Tb;>Z=KZ,/:O\\8]O5D^:FE+Pe]<K_[f<D_\SO2Ige\JDe?^aI
P@;<8cFbJ6D,_,5PZ:/0RCWB3>X#TE.;ff#^AOUL)e=^;UZF6UR)Wg?I(Y?AS1g9
gKOCX8P5cDAIR-R5HA+5f[X.g,^^2=1]ZZUP@[Q=QD(7:@W5S1^P-&@LCNJ:438J
2Q[;8&F1CS4Y.\>JS&c<7/U[9,@TECe2#1X^K>.f\AW-7bZ,#1H;3Z@+(LGEGgMT
K</S^_=JC>?]-=N.e6XO_QcPR3>YgHO^7C3GZ<>WRYFc+>e-P-;gKb.+F@)A<5Be
3[C=H54RO#^.WU(E]Q4GR14QK:U#PCcJ>g7,Kc7^#S2?H^>)ZbYZ.aQ3Kac93XN/
AX;J.;O>Xb4U9+<8.HC()L\JVBKeN5/>_ZT<W:f>-eb+LY>9F33=ZM7P[&cL10Aa
)C&^J.E99)Q39e6,b?5B_0ZYP>GTG(Ic<RB1X39O.O5+.\+&\97?IL5bC#CfP-Rf
9Ka_,>9fWB7(Vb;LBN\0VZHA(eHEC_7+:=THN@2VCWJ;[WaG?QgCWBTfOA,992FR
]Mb4g1Tg40XEcbcgX8:8#5SR34dRA]K0S_^MS2)ZD\:PMUF5e9#3^@UGO[e_=e?(
[A]fY)/b?>+c.0G]a46gQdT^C5)T.<8Q7:dUe[?+&XaDbLXAb:U]HHD,^_M1?VB;
/Z4L)#(D&Rd8<YD70W<&^;2#J/SPSBRLA-9EU.b(-f\L3VV(QL@R]_P/Q9^Z(2/&
:AAO7HRS@JdX\VS::?Y6SH_d\9[>[ZYB@FB#gIb+):SJ(&Z(/X6RVXN[5PEG+??M
ME#IO\R^_cT#C_F(D#O4X]@9[f.V_B0FPX41L7&31@L>]b@<g?XV#YPbQ=e5UaJ7
;)KGS;:2MX6Y+1YI2?;Y=AZ?99PKU44:_M,WG5Da-7B1MT4QEP1A[I=W:PX@5N8#
\Nc&J^]d6FT-A]H\\+R-X^,8H(AQ.XP\IO/\.aX\23J(1G&5L7H;IJK.F]U593V1
U=,?,.2Y458U3caFHZ\+X?bWZf#b0eDWaM[];PK[&C1VQB1R]&:^<#W:P-[CaN#3
0_(JcaaV7LHfYg;)&&0W0_ORDMegdEDA5=(#V3\fJKI09W&9;:U<e#F\1A.TWX1f
+4C&\3_=.OWDN42;]bd@b=6AAI2AfH-R76Z]M4d1_dL>8P-T3I>3+&2bLd_#3723
@4>S)<BPE+Z5Wc+c?:??9A7=;]GeZVeT7:YP,M>0S)(W9AY\L<eFF:9&4^3)WQ@#
,5SN?;W&FgV^-(_3.Q?COA>K<5ZAVad:L^0[=^:TGPF;@)GB_J,(aXPRQ_CM^&0e
1d1-WP.=G2->fWF2&NfKBK6IJ]Tb5##)dg_ER>55L&^;^[,^<^aQ+\B4gQ>+B#P_
Kf])HJU#@@L4#f2;]3O6NCcPMbW68Z:aM)A>1(J^fKb_[J-Y],/+f6V\NC]d+fNP
:f2c1CCQ2e(&IA1H,Y_?5a/N444HYB^SW_0B;UCE]H]aN?W>=>N^[,ZLBe+RW9@-
KWZ/5aUJQIQYDUSLdZbRf3=K)5S-FG\8HBSB-L>\:a\7/XDQ.(8a;-cI#4<^H^6f
#M4NS84TO)aS1TEY_02&cC=[?bCaLPX69g^:=P6d/=)WY;;QG8?g;A_3:T=;KOWJ
HO;EGf6T+BAAIVQ1-NGHY83RSWL(<1PaINR@P?K#ZcEC]-ge23+4LQ=V)ZCNKDI\
3EU7H(02_dH8CWSRgbCVL?=HAZ8)3QAgg_>;UYKRVZ.IZ8OZK8+&THM^)2C^A=51
RaUd,.PX.OJT&R3ZCc@__]C^N?U9L,2A6FgA@cATDO1CXDU2RWKL0^?YYNPgCC(0
g&=1HZ;9E]Ued?,dI:/Jg]BKZ^e3S=eJY2UOMPJTP&JNT:)Lgg<NHD-(.QQVX)J:
U<0QM_#[F@:&SVYfJYOf.-5aJ[5(64=YY910SP5:3/4.PR<>;/Mc#F;[ZS8I.0?c
V6+7#\AfB^FJ@Ig-P@O6Pg7^)LT<1:G7KF)/;+H^ODUZ[1;4DD&X,.a.EG&S/O]L
IRK93,S9LCW[Z^ZL0d(\ETd[>_L+27)9g;=L9eJ(O&CG^CfS[/I68W/B+Ed)e^57
R#J[;9#2O-B/Y^:AA8MGD.[B#??1&XB/8f?)<I6gZacTH&Q0OZcSE?=7ZA5J^DP6
\@0A/(V/KeF(3#7?>NN6E=[aYBbK6JTSS,-[_:CIG<&;,)PGK22?0_4=\\W]=Y<F
dI4Q6VA@1I)95ZU[SW(-V.L-^I.Gd0Z,/GG2BGU-+J_<e#0@c#^RU_YI,cU</ddW
B^?O2)SQCX3[WK(#II;M[H<BO[]Y@4b_>MXRe0W<fV]\2>E\LTPPH;.ag852g7Pb
5S^0f):/Qf-I+e.UaOGH3V,KB\Oed56Q\b1G)E0MIJQ..fL@H.V=,5=5E??AR(Q=
3,3#9e4]_T6OCbM<(DW<<[4B()00+U#I-5MA:S/<a&]:e<7cf\&P/gB)0+P9J:Zc
:QG?Q5,e@?6=3e]4CAP#Y;.5.V:GQB;(K&M@461>:OP=:c#N6/1)2eNUdTN<@H<Z
4&J3IW7_Lg34J65G_,.CPZABNg^)5a);\#?cX,X0]C/NZ4=-NbNa7bdWMAWI1b\0
VNe&a0QL?CR04.>VNJ]GG7d-1Fdgc^7]/Q&0_@VMaUFRT^BQ+U6&(31Z6#RSZTQ5
HgeUSMU;aSF?J?<K#BTA0KWZeQJ#7&<BE<N70<_3bRJQGVOBa.6@4O.:)6gE9KTG
a3?+)2U2;[D)E^N6dOSefV.EDe#>f8L1V\fFH;=.9eR0PXML1U7R5bHN/=F[U=Qb
TVAD>.L@Se_<ZcT0\8<#7Pe_&N@[F?6TA2fb[38(_>1<P]CA0VAMe\:#V^I3d\5E
G/c?eBQeB98e]T)X4&^(f)-.LB7QbP8FAXV/)8DBGP-<H$
`endprotected


`endif // GUARD_SVT_SPI_STATUS_SV

