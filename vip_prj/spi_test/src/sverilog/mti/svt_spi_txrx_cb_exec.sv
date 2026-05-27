
`ifndef GUARD_SVT_SPI_TXRX_CB_EXEC_SV
`define GUARD_SVT_SPI_TXRX_CB_EXEC_SV

/** @cond PRIVATE */

typedef class svt_spi_txrx;

// =============================================================================
/**
 * SPI TxRx callback execution class which implements 
 * the cb_exec methods supported by the TxRx component.
 */
class svt_spi_txrx_cb_exec extends svt_spi_txrx_cb_exec_common;

  // ****************************************************************************
  // Properties
  // ****************************************************************************

  /**
   * txrx component which implements the callback methods.
   */
  local svt_spi_txrx txrx;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   *
   * @param txrx The component supported by this instance.
   */
  extern function new(svt_spi_txrx txrx);
  
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
   * causes the component to discard the transaction descriptor without further action.
   */
  extern virtual task post_seq_item_get_cb_exec(svt_spi_transaction xact, ref bit drop);

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
  extern virtual task pre_transaction_out_put_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>transaction_out_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_out_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_out_cov_cb_exec(svt_spi_transaction xact);

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
  extern virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);

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
  extern virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at TX.
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at RX.
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);

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
  extern virtual task load_tx_fifo_cb_exec(svt_spi_transaction xact);

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
n5zJF5J3smo0J+TBXp6B+rWRQMnBYlcJdg+K+Dks/erqHdwQYlyq7X1EXmvHsExL
Y6pP0t7tI5Y/vs+Z+ZdiKOVHEv/Rx/pf+KIBz3+7KcsXyc0iFUAq/wYrrMO8bP1r
4tP4ycUlb5/+sFsIZUou1dq4U0LNDZ8nx4yIMnXLeLQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 209       )
Nm9PpaQkqCkXZ9/TYXUGiYPRHDgmofEDGBIo32aI3XSj0feGTEYhSkp0QyG8OmNl
PvzsVTyaULNf1OJZoiB6763H9hcWoqHwVSshpowICM9sgZYFjY9teIcMkNTsHO00
qaNfeM7O3AwyiBJEmQWMkpuIJP1DOTxf/uEbizGdL1xjacF+yz3e7waa95QhJPGE
5YEKvp8UON8Zz0koTNGp6wIQoGg301MzEEDRskaW2smLvZ5kKcV/VK03MqZLCJiM
FwgILu49U39VC0XyoFhsb3150Br4XxIUgcf2sQKmj4g=
`pragma protect end_protected

endclass

/** @endcond */

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JGMF80r7VjO/KaCiYxgQSDqFr+pmWfAXZ8cV3YUUUxL36E4TeY4Wgp2xPRgKrkdP
MS+AccD5OMzM5Y/60IMsEs4vhao4S0r3opd3ssL6ZWZ5Ph3OnjW4l1K9VOvf8ywo
F52htMJpwcYHYehREeqfp+f9Dumvy+ieAg7VtOA9a6w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 508       )
G+KfEdKLyrFlylrS/iJojxHShPODK5LI8vq01fsjrEPxaisYY9SJ15740oWIWYkS
dSMHQ4RXaQEgi5XwxOjZzXvuN4rnRKTa3w2V97FeOIiexHtjBwQk+cYpb/K1hR1G
LiXDS4V0rzog3yVTU+WAJVlrRLXkqtLqDpBctjPphjyfWKrqbpfnK6yMRDi0a+Dk
xgCy5tYWdnhzBtR84+Vo6rNSycCCs+uAs7XbnmNBRkjrkmsoSL4Vyrtys84TLyIQ
WjO7aJTyhML1AoJHAKSc5ky+mGa8+3p2XQZPuDegkxt4iV6p7WBEZZPbQiJibp+P
pxjgqX1CKqIXjF6pwaWI8pgmEH6t97BiAMjLrKhnUVVSCKoGx9ppxDfGJ2OnesXs
e9aBsq/GxRJqzWSgdfTnWg==
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
iGfF0REnREltFXcXvuWKivyMmomHRrWzFqWuhrYUJNhbAkK2+8hoVmbD6VVNYafB
+sLKKGCr7PXc3eA/Aicl7vUVBdbbwBGcb5jaV5lRrgjZs/y0+ZlL/HdAZbCZAXYU
cX0MAbTijzrNzAW8V3TiyPOYPv0vxWUJaQfnZqh2fUY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6004      )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_CB_EXEC_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
a8HK0RlJFQoH9bFFilqxu+YBwEnrVI4eRwgNjJBzUnu0EY82StIqbRQGiqwFW8ln
o+XuaAD/w3tcKltBR+cpQTw2geP03ha1XSTodHtFOrri/ZvRGq6GiIl6pt4fh5Vx
/3DUYSxxpwpuJcuCmQpG7KXT7YL1ggHVOnrF8hf8srs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6087      )
3Aim2cEZaF1frH+6IRY/eCkM5TWAkS1RqMh/9IbGcQgFWM/XdV6JDQc4oscYOr3V
FSknCmS/++iIDE84X1KfDmFdeDqM5nLDT/sH8LVxidHulkLWPcYQtpdWBVQYRoZn
`pragma protect end_protected
