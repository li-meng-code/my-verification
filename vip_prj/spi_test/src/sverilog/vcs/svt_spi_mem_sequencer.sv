
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

`protected
QW@GT-9G^U2V6#2#DRL]7.;Z:(G_Kfe=@<ec9Ig^f1@7<3?8PSKV5)^W7-G;6aMN
5e6gKXLb#MU9G0QKAG>XYTf9aB?<VNO1B=E/Cd37d6LKKVcQP:W9]KT2DM0Q?@.&
QI1f#+c:a5;\f&?FTeDagTe)I04@<g2@/.a?(4IOcTU=63(A[g)J1Da4c.OG/)5#
F6^425S88WLgCI@ddL/>V\4J1)#fOc=(3V##OP]OfJgQAU3;P-6:-0(/<I:12BH^
KL=b@4][ZN=^QW,^CUK&5YVM,OFYdPH;9\:\-S<V[@R.E8=R,I>/J+@8bF8+A6NX
97=0W[c#:f)@A.(N_5=[EeVM1$
`endprotected


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

