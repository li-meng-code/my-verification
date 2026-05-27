
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_CALLBACK_SV

typedef class svt_spi_txrx_monitor;

// =============================================================================
/**
 * SPI TxRx Monitor callback class defines the component callback methods.
 */
`ifdef SVT_VMM_TECHNOLOGY
class svt_spi_txrx_monitor_callback extends svt_xactor_callbacks;
`else
class svt_spi_txrx_monitor_callback extends svt_callback;
`endif

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new();
`else
  extern function new(string name = "svt_spi_txrx_monitor_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_callback";
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  virtual function void pre_transaction_observed_put(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact, ref bit drop);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * @param txrx_mon A reference to the component object issuing this callback. User's
   * callback implementation can use this to access the public data and/or methods of
   * the component.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_observed_cov(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
  
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been started at Tx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_started_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
  
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been started at Rx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_started_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
  
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Tx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_ended_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
    
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Rx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_ended_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void beat_ended(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when Flash Command has been Detected(Sampled) at SPI Interface.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void flash_command_decoded(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
L+rKVM+heIIw5Lnzs68cz5wL1kSM2eBxtkfV83arGJPo/nMkQJD025jvgjooQKmM
FRq6fGO6mdCwoD89KXc/p/i505GCFmQIVhzDKIdUDbbn7gVGT8ZvZO60pgGGHTGh
gill8K51ub+jT8YIMQeJiKJ6N0YB/lfbMNGC823mlid1c+8oq/JjwA==
//pragma protect end_key_block
//pragma protect digest_block
o3Uggw3G14McN6J9twhUQGfE/HY=
//pragma protect end_digest_block
//pragma protect data_block
aXxYf1ACyBnbShTjbvzUqvByHaDgDkpnTkTBc9WfCwRmcXft+/yYRii2LVSMfEqG
Th2kt20IG7Fs6s0j/2Vw3UeqtkICAJ3NSGfk6amkIIy8DpmPuC3aOVnB7XxVH6yZ
QDkjS+8Wp1q0klBka1isrnEOvkvNVY1bnlcpqnnwZzQTM1y7iUCPL4Dwy/xjx73c
FS1Ta+axBDmFBIXLwSbUaCEn9aOEsCaxQE0zjMoh4j5k2DSYZ2E66wPK66t1Zv/D
jqZ8qrLPDDC2TBtoEu9Z+2PlpwcOKKfFJp4c6zdXTxgU2jwXqmc3crR7/N/mAfHF
qY5kOkuFY/xYA5VoZuD+c3e55L7BpvWsRqSWvzGomEHDnblgqeRE8UGjDp20SaXn
h7hBfe2slsRRu8evP2DPDWSQJn0viWvcHab9O6HNVCVXT75yxSOXtC6lI9+sKPHp
8kuNaj0hFMo3AImhh+iq+Go8sG0tLuxzI7OvWa7Z7Sj9tbHniMnvTtEnuN6XUZDo
KR97k/gsUx7l5WvDM4iLosqLa8QbEYY0B+bawPQZvE5iS1RhifHZVLSff4wM+7fJ
C21u4Lc3g0RXhebagswe3k39VjbNB18GVDryhEeoxXAI0ceUh5gFGHOBzT+om8TM
in6Y9D5HZuOPnWeQLRpwc6PpfZiRieW5hEthrZwHbwTvqCXjG6HO/ibfIJsAD7ei
7OAEc5Sgageu52j3B+zCVJmFnsOhqgrkLxptVU/T7rt1jkS4SF4Cgy5tnvFK37uk
sySZMZQU8M/hpmUvUFu7PVaxc3JKMSUh747z1kBaJgAAHIsB/fY0w9Ysj+moANfE
Bk1AV69vM6Crew6Qmkd7N4hQwi/7Px1Xf+ceq4EfDnw7P/O+qY6xW5E45YoH5z9+
JaB0i3lUF+sO0sud7MLKJ9uAkrbh9Ith471Bk1Qx3LuT9CWhuXplSA77+SuliODt
dKjXfto66WZEhWRJKqLDdQ==
//pragma protect end_data_block
//pragma protect digest_block
8Ue90tKf50t3KqWNW0LHPrqDXvA=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_CALLBACK_SV
