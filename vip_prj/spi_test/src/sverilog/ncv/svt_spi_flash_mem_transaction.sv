
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RKKSURwYjnqtSnwbq9h+NrdN/a5N8tbmvbQOvYhcuBLVjaOuGHVYKBM1r47Z8W5Z
9fy/eJxYhALarfQqZ684TvM+ehFi3gQuyETowuqJiQXFuTvpYdUjMwWcGkTeQlMP
ALgKCNafN/MQr00dhcH3nNaM6G1Hls5yJkIJ6MsLZAv0foxvXpb46A==
//pragma protect end_key_block
//pragma protect digest_block
jeDkgaaGU3jcIU1NloorKkuyrxw=
//pragma protect end_digest_block
//pragma protect data_block
E4J1XIfMgF4JUBAYhZHXsPLflhrFYLl+Oqpn0+f9lTfx/7xJ4hD/WWi2/+BGKrp1
pxyzT4tzxeDujo7bIES9YZAJmsW+Jzs4BEMOHWeEMw6bUhSj1DeQJsF18f5hRuB2
PW983ZL2DB7cu/xm8yjlAT04fp1e+7OEG4GqZeJYnIZWlQ2aAeez9bz+1pgn/QYf
b2+zlt7yd1gPocKVmQJrTR117aW68mxKKvJv33LkwOj9IAmiSZNQidqNPj3xZuNv
wMN5RRUGlAruGHpusv7Tol9HqRLCp5K6+RxLvGA6VYg/BBJtDAqjqGQzQwaQjuMJ
x9H3pyTYYJsyvw9S2nBC8uwgy5Cl+2gcJuEF6FrVISh0PLlNtOSqOOkL9fccxVNZ
t4HVSI4gMeWOjGnhUEqYi0r/F5iRzQOpfEpYBwqSTaKgnK6o8wONCi1Fz6MnKLVN
7lvtQmwgOn1oooj4rybz0W8gxtJhsCrec/JFUDB+6p2LpZpS+P8cE86nypnwqxUy
3FgsBqgCHSJ7WaORxlON2PC6CCakBnaW1APaoQZnoJyzCqjQLB3Pr0HddZD3kg93
WqM1a9ikOQYE+zSOgAOdJ4nILYKzNebQHYlf0GKdQFL5ZXkJezsRF2kEAKE73uvV
UytG7s9rskNJ/pl5ASHz7NVIpj3eSHTdghWWUu0m3KXSwTrmJeoNyeQtZV5i4lz3
ZRt58oN753zY8rk1izH0KOvlIN2ht6/5Ua2lIdXb64WQ3IIVqqzpVu9faAogA7US
R7YDRY7hFau11Nns4IlP3LOZNktZ4CMt0Pc8TK4AJUPEvBRf/bjaMni6kF3GZagj
PnSHnxcpl8l2MM8XruWW9urqjXsF5HVswdvpf9TWLVECb23g9WKzuP+/H4ObvM+8
VxL6nVBaPhjwzlPUTPtF2deVaXYhKxv8UxmxUZfvu3YgIBJ+tPFQmt5X2m7F7n3F
3TPANJRPZ6hqX2xhg28jk5HfLca2t1WSVe5irOX0Afn8SRK+aMvfPqvG2ai/gY1B
IlZUujJ1IeQA7BSc9hq8Yp8qyJ3MVkw5Y+1DLOU/IyZ8aNB+V6Ub3/pnwVZ5i2/1
GBFDQLx+4qQIWZA5rC3rc+v2GoWd5ecYmcbNsj4iJZ5aTJUycVwyvpMDZElzOFnJ
D/oXRkrcc5RvnNDnxIYUbLfpNPygkM1W+zbKQXN4Z5ePPw65JZVmmjDqd0Ps5V7f
xdhj9zDwaAR4nVAjAMo7YT9cGvAGqTb4J/rtVfezLM5BW0Ivw+q61t9c6YVqLYSA
Wu+dvLMDgtxbf7cbsbmxe43356E6ylNtgCLbfx2Y+qYmMPRkdoG30DyI4lfvsjXt
YUhTog6BFaAT8Iw81gR8WCrO423fTbwBYBoA7JDEI24B4njeHebTiZ7xKRAc/OBH

//pragma protect end_data_block
//pragma protect digest_block
oC3wK2dp+rQcg5J7S7I3hnxVE44=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
SqDIz1hKbnUmAMsb5F9zP95eerYxhzyfJE7QUp+evggNJ6yVlx+iCBUZmNt/mZsK
wlFInyevUy1Joca2+qUPaVVqaMMWbxrH223VAEjO7f0ZR7xidJNyXByZNcd0GS4I
Go+Cy+jZ0KoOTPRHVUuIqrW8gHSCVGWZSyPlXW5HKZXOY2VEvAH+2Q==
//pragma protect end_key_block
//pragma protect digest_block
7m5bp93uzUaZEidOGkwzgA1DUIs=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
HNAsZwzUIHNaCYhCLB/75jIm6OU=
//pragma protect end_digest_block
//pragma protect end_protected
`endif // GUARD_SVT_SPI_FLASH_MEM_TRANSACTION_SV
