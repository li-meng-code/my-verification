
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

`protected
[8(QW3XT1R1NEUN83e^6IA_=YDEZb(FGb0SKcfUTTF\BV0eM<\aY1)V<6BR2cP,(
&U>F#S8OG/0Y<G?I;V;dD2g^5;5CDd&TLf_G3QX,BD_AUegZ7]YL0BY?MWE4)B?V
1aeQ26IL/W(;&/FB^&:@=>;-7GWF]c;8.+Ef&\f6>I,&@UN_Wfea8g;SF7cc/f\R
8\E/5O-90BSNX3UO.cXG9;ZO?fPRgfe7PLN&++g/H8:+gB>C&\gVWK@H=Zg]_/I7
>5b3TcGc5FfO=UIJ[)c(96H[X7R0@-4AHX;BF1Z-7FJ&(//@&]]9J09P15Z-VRX9
P7#BF)3,#Y\-&1=5N:M088&\G.5bb>\^@TF#/6dJV;Z<@..7.DVP4NB:L;21#>K1
J7DCgQ?G+[2OFX2e4^NdX:\UU.+=A89fMSgH>EB>+d?LX?=Pd-c;.@Pf3UAe^\2E
KB(MLfAS_-:>V4+XW_K&M7MYGVFU;:;CQY,MK+_:[+WLH$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_CALLBACK_SV
