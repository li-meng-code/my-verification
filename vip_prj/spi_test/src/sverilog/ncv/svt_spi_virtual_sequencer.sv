
`ifndef GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV
`define GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV

`ifndef SVT_VMM_TECHNOLOGY

// =============================================================================
/**
 * This class defines a virtual sequencer that can be connected easily to the svt_spi_agent.
 */
//class svt_spi_virtual_sequencer extends `SVT_XVM(sequencer);
class svt_spi_virtual_sequencer extends `SVT_XVM(sequencer)#(`SVT_XVM(sequence_item),`SVT_XVM(sequence_item));

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Sequencer which can supply transaction requests. */
  svt_spi_transaction_sequencer transaction_seqr;
  
  /** Sequencer which can supply service requests. */
  svt_spi_service_sequencer service_seqr;

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  /** SVT message macros route messages through this reference */
  local `SVT_XVM(report_object) reporter = this;

  /** Configuration object for this sequencer. */
  local svt_spi_agent_configuration cfg;

  //----------------------------------------------------------------------------
  // Component Macros
  //----------------------------------------------------------------------------

  `svt_xvm_component_utils_begin(svt_spi_virtual_sequencer)

    `svt_xvm_field_object(transaction_seqr,    `SVT_XVM_ALL_ON|`SVT_XVM_REFERENCE)
    `svt_xvm_field_object(service_seqr,    `SVT_XVM_ALL_ON|`SVT_XVM_REFERENCE)

  `svt_xvm_component_utils_end

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new virtual sequencer instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name.
   * @param parent Establishes the parent-child relationship.
   */
   extern function new(string name = "svt_spi_virtual_sequencer", `SVT_XVM(component) parent = null);

  //----------------------------------------------------------------------------
  /**
   * Finds the first sequencer that has a `SVT_XVM(agent) for its parent.
   * If p_sequencer parent is a `SVT_XVM(agent), returns that `SVT_XVM(agent). Otherwise
   * continues looking up the sequence's parent sequence chain looking for a
   * p_sequencer which has a `SVT_XVM(agent) as its parent.
   *
   * @param seq The sequence that needs to find its agent.
   * @return The first agent found by looking through the parent sequence chain.
   */
  extern virtual function `SVT_XVM(agent) find_first_agent(`SVT_XVM(sequence_item) seq);

  //----------------------------------------------------------------------------
  /**
   * Gets the shared_status associated with the agent associated with the virtual sequencer.
   *
   * @param seq The sequence that needs to find its shared_status.
   * @return The shared_status for the associated agent.
   */
  extern virtual function svt_spi_status get_shared_status(`SVT_XVM(sequence_item) seq);

  //----------------------------------------------------------------------------
  /**
   * Updates the sequencer's configuration with the supplied object. Also updates
   * the configurations for the contained sequencers.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a reference of the sequencer's configuration object.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
9vLy99zZB9VZJGewijWit4B4R2jEFK0rmUvnzlX7H1UFTESBZwFjzkGKGkfvQ8cs
5dtNiaGoOKSD0pVlZxIYIp2cOOgufexLjp/a9DEbwb11CSPpGlpat/zNoIR3pN9D
OGN49CS6ODTXx25eK+U9SBJWillFlNAd7oHIfElh4YWGR+abTj+9BA==
//pragma protect end_key_block
//pragma protect digest_block
qZCSvlOd5QslaiJ8SHkzKn+vCtQ=
//pragma protect end_digest_block
//pragma protect data_block
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
Gww78EWzoYWNM+1DvfUmqQ==
//pragma protect end_data_block
//pragma protect digest_block
PQP1Pr3h1VWepve8THO739kdcjo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // `ifndef SVT_VMM_TECHNOLOGY

`endif // GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV
