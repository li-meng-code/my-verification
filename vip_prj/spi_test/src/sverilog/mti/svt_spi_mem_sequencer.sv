
`ifndef GUARD_SVT_SPI_MEM_SEQUENCER_SV
`define GUARD_SVT_SPI_MEM_SEQUENCER_SV

// =============================================================================
/**
 * This class drives the memory sequences in to driver.
 * This is extended from svt_mem_sequencer
 */
class svt_spi_mem_sequencer extends svt_mem_sequencer;

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

/** @cond PRIVATE */
  
  
  
  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************


/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
  `svt_xvm_component_utils(svt_spi_mem_sequencer)

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this instance.  Used to construct
   * the hierarchy.
   */
  extern function new(string name = "svt_spi_mem_sequencer", `SVT_XVM(component) parent = null);
  
  //----------------------------------------------------------------------------
  /** Build Phase to build and configure sub-components */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void build();
`endif

endclass

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ibkC4bmm+uEaVL6bGKHzRpoqBAq2srFhhlDQUB/32ULVmg55lP+Wke8jKhP3/NEx
1hVZ3LsTeYoUSlKC60yZTUgEaNgvbqNLPNCNPMUR/bLhWEIsNawsIPB7p1jwqVfR
OyhbtrPPAh70g2yEtHP9KhljJ0nCiL4aQR2+0syw/NU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 363       )
T7HL8mWr8IwyICf6YiLuYoA5Vopl7uKNMwCb77XnmOdI34WJWIzXWWIAQfQB1SfP
ZACu+RO+26+rfX/9/MZw+kccYNOoUmZuDjzTJhhnx8xSMdZJqfQg+P3sExykSWsh
wsyAQiuveGSigWGWFRKXYd0+GQVnst7ZJLSiHzGShRwcecCLA+2pCjjPeIyhj9pL
UBU4TNgzSx4J6ogRfLx3sqcTy6GP2SOT6bn4xohixhpawdrqPC6t8lTvBfzynOjH
aZB00nG16LuaTxFUQO2qrca+veVfMeobaN6WaOTbkYit3jk8sFDVpNgRFdl1X9qd
YcoTXoH+97KlqLkIZixv9huNQW/cnVQdREY5nPOH0LXNQjeMSqSNLPjsS1D0P3El
uxcbAZ54Y8BvUX3LqjuXrxy50eT1CdAj6aVyUIYTCT2KOuE57umHm3LmAe1ah5S8
nviQ9KMoWjpVJcfKjzHg5rBRer7RoEjDFFy2On7aF2Q=
`pragma protect end_protected

// -----------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
function void svt_spi_mem_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
`elsif SVT_OVM_TECHNOLOGY
function void svt_spi_mem_sequencer::build();
  super.build();
`endif

endfunction

`endif // GUARD_SVT_SPI_MEM_SEQUENCER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nWfmsY2EsCm4TlXXIiO3nN+6shGbmuU3CZ/AZ6nr31ZsMzjJsqoxJm+FRzEVSU5E
/TvRu6S6X2v1EkAlXovc7C7ngHWZKW4U7TCDsXJT3udvLsktiZhAoM+3nNrLzHPf
68y45cq32FAkvKYqqkLgsnZYyPQZD0VCVM/lopfiyXw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 446       )
cjuvy7OIfulRbqUQyDfbM3zmHeLmtTAEmBpZVOfd9j8XrUiLzbQKe1Jtvxn/6nHx
h+nFz4rPag0XfewCbFqp6OU1Fhuyf5i9V4TCpO+blefARszAxY8x5ybjMYthLQGz
`pragma protect end_protected
