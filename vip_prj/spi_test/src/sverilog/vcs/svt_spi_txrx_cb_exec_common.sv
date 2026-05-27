
`ifndef GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV
`define GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV

`protected
ZW_..U>f/(AN:[)I-b#Ga?Zf(OT9/W,;6d3bB]E=cHKJ9R5:PK&M1)=VW_7NJ>NA
4cD?43TBZR5/5XR;ed&/)O3H>&YSEVDa[4\.C#+BD5VT@+8<74+dCf@XA.>bY6WE
#HbY0EePcBBE_^ANGg-aYHJEJ;IT8@3P?+CcV=V4gQ>V^A3O5gTWYbZ41[DedO0P
(-@.3.ZU;/ROSO>e&3M73E1BSVf<6=C4W^S;H+[]1JGeV^QT7_Cc>CWST_gN/L<?
RffIFX<&81B;01a4.+-B[cC2MBF:g1cP>cfYQEf9e0@.MGZ81]/9gFb^4TX=_B6>
<LO0U?HGZd9P3D)b0CfX=M:_QR_=J9BQ^I]>]?MRE/@DUe<D\d?<R0^5E:fA.WSX
4<1La:-bR:bL:9^-@2(TJGc_a[DV0QRaS\4::GE(D^&.G/DCDaaJ]RWWOAERN5NX
[c\A5FCY])525&(;G]@.08fcCc>T\.GWORA)12@6^6Z<B?b6:PZ2fa0DeA<_I8M<
QO4LB5S\^-9ZC4Y.aG\DPNfc5$
`endprotected


// =============================================================================
/**
 * SPI TxRx callback execution class defines the cb_exec methods supported
 * by the TxRx component.
 */
virtual class svt_spi_txrx_cb_exec_common;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   */
  extern function new();
  
  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction out of its
   * SPI Transaction input, but before acting on the SPI Transaction in any way.
   *
   * This method issues the <i>`SVT_SPI_TXRX_CB_EXEC_COMMON_POST_CB_NAME</i>
   * callback using the svt_do_obj_callbacks macro, as well as the
   * <i>`SVT_SPI_TXRX_CB_EXEC_COMMON_POST_CB_NAME</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  virtual task post_seq_item_get_cb_exec(svt_spi_transaction xact, ref bit drop);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_out_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_out_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  virtual task pre_transaction_out_put_cb_exec(svt_spi_transaction xact, ref bit drop);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component after placing the SPI Transaction in the output.
   *
   * This method issues the <i>transaction_out_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_out_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual task transaction_out_cov_cb_exec(svt_spi_transaction xact);
  endtask  

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at TX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at RX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has finished tranmsitting its last data bit over SPI lane(s).
   * This is used to update the data content dynamically while current transaction is in progress.
   * In Master Mode, additional clocks will be generated to transmit the new data bits.
   * Data driving to remain as it is.
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * This callback is currently supported for SPI-Bus mode only. 
   * Only svt_spi_transaction::data and svt_spi_transaction::data_frame_size fields are expected to be updated by User for this callback.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */  
  virtual task load_tx_fifo_cb_exec(svt_spi_transaction xact);
  endtask
endclass

/** @endcond */

// =============================================================================

`protected
6L(<S73ISYZ:IZSX[.4bL^\JK2L,;ac@^OYO9605:NUIaXNG7KbJ-)Q[;[WfEVLZ
P-\H]DXH6->#7QN+W[RbW?O<=N8/\gS@g=@<\MQbe\.W>b(#LGN;Jg6WAN4bg-,,
D\b3_VaLg\ZV)-S4AQ]#WUO<6$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_CB_EXEC_COMMON_SV
