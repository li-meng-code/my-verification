
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_XML_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_XML_CALLBACK_SV

// =============================================================================
/**
 * Monitor callback class containing implementation to generate XML
 * output for svt_spi_txrx_monitor.
 */
class svt_spi_txrx_monitor_xml_callback extends svt_spi_txrx_monitor_callback;

  // ****************************************************************************
  // Data
  // ****************************************************************************

  /** Writer used to generate XML output for svt_spi_txrx_monitor. */
  protected svt_xml_writer xml_writer = null;
  protected real xact_start_time =0;
  protected real xact_end_time =0;
  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(svt_xml_writer xml_writer);
`else
  extern function new(svt_xml_writer xml_writer, string name = "svt_spi_txrx_monitor_xml_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_xml_callback";
  endfunction

  // -----------------------------------------------------------------------------
  /**
   * Called when a transaction starts at Tx Port.
   *
   * @param txrx_mon A reference to the svt_spi_txrx_monitor component that is
   * issuing this callback.
   * @param xact A reference to the transaction descriptor object of interest
   */
  extern virtual function void transaction_started_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  
  // -----------------------------------------------------------------------------
  /**
   * Called when a transaction starts at Rx Port.
   *
   * @param txrx_mon A reference to the svt_spi_txrx_monitor component that is
   * issuing this callback.
   * @param xact A reference to the transaction descriptor object of interest
   */

  extern virtual function void transaction_started_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Tx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Rx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
mpOwzq9ZLFM0+124kzNzDocNIiCPFdaPcmS6JwSJVSWTCmNu0HK9EVAHyJCQgg5W
ftHbOp5Kc+MhmVQN8o8EJGnXBog+7l7PMoEnl/RLZ5fmDKk4wF+pPTtjqMdhCOS2
ElAAtPXiZgRS90lTc6BzvDvwSKgpGttExkufv1HY8PaDVeX2/7dASA==
//pragma protect end_key_block
//pragma protect digest_block
AhXX2wd1mmhuOwk6eVueBdUTxBc=
//pragma protect end_digest_block
//pragma protect data_block
lzdD9HAP9sAkpjODnLyeaO2SzddnXSOfayMVj7RSXV51SMn7L0IegawnqBK8A47d
WUf4RWt5pFWitusSY0hr78WsNrtIJtm2ab4UYfvkObF5IqpaLuUU/H52LTuRRzS2
Gwm9BUD5NhNg+COJiXU/ScU2jDHxcWOIX+bmE2vuFreibLe5aTji5uKLdfpXEjZc
tD5nH2fYP3MM1lVZsKsRnDXgNd9qF8wYerEkXdSq5s/wNH4c/97L0JEzHI/iprxR
k9yw3DqkL02aTcsz9pnADroJKDv8dSHw0VaUuTVPBfw4bzmLK+kfSqe1Y536EGeH
1n/5LdUzURNlDNZHELG7L+xGaBHFLKdyhKtRTx2/V1Rb8lMjd2ktZPDZna4kdx93
LmMesYfGc6eOx1QkIZ9XcOYmd2Hnbi0pG0PTr0jrso+TMbLTFJf2gYZaUimGtm1D
nOALAPWRlJVBd2fFe72f9jtzhjsahE3aQN4/eZGWvxPdkr8DRYbVDnflS9fVM/Vy
3jUtnMOi/sm928IH3Xsy2w7JCvL6XRaCgXZeT0QQ0oxDo82cMlN9SSU76k3qSlu+
g1e3AFbFeXExyHDhosOuGc0Zasodx5SoT3yqK71vhGlNHY4EfjAVxECnZkkgjvSl
Z39LtIDlx+NQj4PbTAAZrg6+fQnL+pRR8MssASCBFhcf+QpMtZWXgC2u+bLPCGLs
JdPWqCrd1TzreeQ2vb6VL7XVBUOJHg6Sb2QQVYA9ZPTjztqfewppXVBsC7M1LYf8
HIAmgbch50YEk9ddrrrEnHrXtM2+eg3DhKAG3LlT7M3fy57P7bFTQ5n1aRNLyclz
Pe0IrZeNH42aX7GanH0kSaRghQUD/nNOFGTceEYNdWc=
//pragma protect end_data_block
//pragma protect digest_block
Mqdy2lwOT5g266O7uextGmdeelE=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
7RinLRsdfspCc6ep91TXEF9X+P3gRj8Qerh+vkMTzUuQk5xX/UXgqXJYFmR1xtJW
DUmSsHQ84uhxG4KMIT4LY32m2OGw7sAs5lDajKZFYxdBZRowj5yFR9cg9MzpJYQL
tHGWJ0FyFnKXu1FoRl6/vsg6WjeBA1CIsfjgf4Thnisl5b0uHBN0sg==
//pragma protect end_key_block
//pragma protect digest_block
QnP5DT9L/FSiGI9Wtoy96BlBC28=
//pragma protect end_digest_block
//pragma protect data_block
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
aLb58+U5mYX2DuV0WXsl7g==
//pragma protect end_data_block
//pragma protect digest_block
bNNudbfSiMu27rRhwl/8T0kjDy4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_XML_CALLBACK_SV
