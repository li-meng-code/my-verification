
`ifndef GUARD_SVT_SPI_FLASH_MEM_TRANSACTION_SV
`define GUARD_SVT_SPI_FLASH_MEM_TRANSACTION_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 * SPI Flash Memory Transaction.
 */
class svt_spi_flash_mem_transaction extends svt_mem_transaction;
  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Handle to configuration, available for use by constraints. */ 
  svt_spi_mem_configuration cfg = null;


  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_mem_transaction)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  //extern function new(vmm_log log = null,svt_spi_mem_configuration cfg);
  extern function new(vmm_log log = null,string suite_name="");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the transaction.
   */
  //extern function new(string name = "svt_spi_flash_mem_transaction",svt_spi_mem_configuration cfg);
  extern function new(string name = "svt_spi_flash_mem_transaction",string suite_name="svt_mem_transaction");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mem_transaction)
   // `svt_field_object(cfg, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_flash_mem_transaction)

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_mem_transaction.
   */
  extern virtual function vmm_data do_allocate();
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

`endif

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
  /**
   * Method used to obtain the physical address for a specific beat within a burst.
   *
   * @param burst_ix Desired beat within the burst.
   *
   * @return The physical address for the indicated burst_ix.
   */
  extern virtual function void get_phys_addr(int burst_ix, ref int unsigned phys_addr [`SVT_MEM_SA_CORE_PHYSICAL_DIMENSIONS_MAX]);

  extern virtual function svt_mem_addr_t calculate_phy_address(input svt_mem_addr_t addr, int hier_index);
  extern virtual function void set_cfg(svt_spi_mem_configuration cfg);

 // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_transaction)
  `vmm_class_factory(svt_spi_transaction)
`endif


endclass

// =============================================================================
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PdXjcM3Wy5gXnVjV+QbPLVVynGDaNK3jMZFRf7AHzU9BhiR9eSs4Sd8QRWsAkO5V
rr0IddEz+tzXt2RhqD4HuNLupeiJhmf7GQ6nn7cJI52JSYjTJ3QM5vTdC15E8VOg
roaiigOSe6XEvkNHoPvWRgnbQ3x4DLlf1R2Lrdodqvg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 889       )
x+4Rf6gQt2MIMukvVZuN5rqJLlSVjLWzQT35hyL3oLR/B0hx4+1kY5WQwLQlQPOL
jcWhPKV3Vx5ZbQMhIpdTt+RR1Mwuc1jezqfgLVrppkxI+JC+UK9oq7MyygAonYE5
qqwMCa5PkpqOg93Ar8iUPKKDduCvYAGPVCmnb+pH4AsrOLoNjPXVX6D6AgYYP1sG
Fwz0eD4zuDiLGZWyr8nRhQwEtvUBBMWsqHKRxR3Equ5+MjJ6CdLZrttKOlut8VIC
sualfGZLBMf8fTIpyV7u9PjbRtr+1uuMxR2I+0kPZc/Tvn8sQ/mzsmiXR7rHjmLY
tHQJo8MNC5DfM8wtmjWfAk6+MzwK+dpWYADcum5hqWlvFFtDTw1Vcq/L5KdftOfp
K/mqRBCMtYkomVIwdEi/UOHol1YdudVx0XRlNrL776DLnduA7QomoCY5NfvqKQUf
pRLw7fcjIHh6u17KM2dJIakEGekwZQFhQUI31NHPgpcEDV6eF40DhZgoC+cMehwD
n7PA2Wwoa7B56deXCbDrM2wu37vp4ZapSpafsQqfcIGHre1HTZLQYdgGNq3opCJ6
0JliCBK11VC8RtkFGIPyrrZiZ95G+NEq2De4SQlHYn0jvtZOi82y5Dr+rv0FbQ8/
pkgVsskHv896IAXyiu9OYK/wf08ZCTRSNu69nsToVszj5NsOfiYKsFP7H5lABd/A
bFM1vUyWA5URfqmeexx7iIC2/dG/c4xsdyGtGL0d3i2LR5TD/u8p//Z4ZGZ13N18
kKn2OysRPmA2TD6zRoEFlUIiDSWsfIzw/6asBTh9oW72yXxHBwrSFRRJSo1DE9/E
IjUpT0ZfQIqO2dGdKLt6DzYaZ6Ri3eqQrxB3QBbcDaxqlhVsmIIQ4katZdebz6VE
p8Il6YGoAVZidLmN9WVFYqzt0oTcQicwIY03f2CRY04CNpIiOWjrIfzVrCOS9FuE
CwAxlNAoA8lmgKOqxHU8sPp/tL/JVQs7FHCS7ByCl584y+KkmVezUtUqvZOoMyVB
mgbNOBP1NV/pOD6IPQDsHpBAlNAxe4EhatFx6dK56ZliIVl6nBeWbcnUMExQ9Sfq
QYjMWsoLLQNNq9hMpNyL5DyoTpOqMSTZPjxaUynumjmq6465ZEYuJodeoVZHjceC
7s7iIfFGJNK6CtWZL8kFBOc0WpEFMxMFZjzQ5daM2nw=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
lsFici/NePPoyLagdE8+sg/TUxzhh5PhJetCVhRqLTm/P+5PaIrWPDY2fE4A+I6s
ZDiwJX87ftRZq456BPwqWframb2Vs93OoNxlJFuRMlMN3D8nztzulRIMxOsJEIc0
foXNslFErKA2rV7o3n4SURDoXYCEQfgOBJLWiJ7rI24=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5355      )
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
c8Z2eXXS/GbLAUnK1K25Ug==
`pragma protect end_protected
`endif // GUARD_SVT_SPI_FLASH_MEM_TRANSACTION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IVEloIygJ5Cbe9m156Hhyrl3P0kagnFF4A5eaULxllYB1dNoIs4mubFXVBvw+/RT
0TzupT4yVW/V9nLDJBu9nUew+QC4HQrMTFCXdnDUSu6JaWztnXkvmoNJT30VHuJm
8Z+KAedI1AsMi9nvSTk08FZPHhOalH0zP0wAy1g0KO8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 5438      )
hGlBkFn1cVZfq32I5195vx8eWNMR4Fgu+Mt1WVpVAUQODLaOXNWc0lFEYO4asWTH
fmf84egXXgLYZx7KQo/oAer55nXGr0tROfv8rD5uiDSJta8pnnyvgRhFipk0zcUe
`pragma protect end_protected
