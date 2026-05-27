
`ifndef GUARD_SVT_SPI_TXRX_UVM_SV
`define GUARD_SVT_SPI_TXRX_UVM_SV

typedef class svt_spi_txrx_callback;
typedef class svt_spi_txrx_cb_exec;
typedef class svt_spi_txrx;

`svt_xvm_typedef_cb(svt_spi_txrx,svt_spi_txrx_callback,svt_spi_txrx_callback_pool);

// =============================================================================
/**
 * Defines the SPI TxRx Driver, used to process
 * traffic in the TX and RX directions.
 *
 * For the TX direction it gets SPI Transaction from input TLM port, process it 
 * and send it to the bus.
 * 
 * For the RX direction it reassembles SPI Transaction from the bus and
 * then delivers it to the upstream layer via output TLM port.
 */
class svt_spi_txrx extends svt_driver#(svt_spi_transaction);

  `svt_xvm_register_cb(svt_spi_txrx, svt_spi_txrx_callback)

  // ****************************************************************************
  // Properties
  // ****************************************************************************

  /**
   * RX Upstream TLM Put Port
   *
   * Provides a mechanism for sending SPI Transaction that can be recognized by the
   * Upper Layer. 
   * The handle to the SPI Transaction TLM put port can be set or
   * obtained through the driver's public member #rx_xact_out_port
   */
  svt_debug_opts_blocking_put_port #(svt_spi_transaction) rx_xact_out_port;

  /**
   * RX Upstream TLM Peek port.
   *
   * Provides a mechanism for external components to retrieve SPI Transactions 
   * from the TxRx. These should only be used when
   * the TxRx is the top layer in the stack. The handle to this
   * port can be set or obtained through the driver's
   * public member #rx_xact_peek_port.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_peek,svt_spi_transaction,svt_spi_txrx) rx_xact_peek_port;

  /**
   * Blocking get port implementation, transporting REQ-type instances. It is named with
   * the _port suffix to match the seq_item_port inherited from the base class.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_get,svt_mem_transaction,svt_spi_txrx) req_item_port;
 
  /**
  * Port to obtain the response packet of svt_mem_transaction type from
  * mem_sequencer
  */
  `SVT_XVM(seq_item_pull_port)#(svt_mem_transaction, svt_mem_transaction) mem_seq_item_port;

  /**
   * Port to obtain svt_spi_service object. */
  `SVT_XVM(seq_item_pull_port) #(svt_spi_service) service_item_port;

  //////////
  // Events
  //////////

/** @cond PRIVATE */
  /** Event triggered when the SPI Transaction is first initiated (TX) or recognized (RX). */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED;

  /** Event triggered when the SPI Transaction is completed. */
  `SVT_XVM(event) EVENT_TRANSACTION_ENDED;
/** @endcond */

  /** Event triggered when the SPI Transaction is first initiated (TX) */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED_TX;

  /** Event triggered when the SPI Transaction is completed at TX */
  `SVT_XVM(event) EVENT_TRANSACTION_ENDED_TX;

  /** Event triggered when the SPI Transaction is first recognized (RX) */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED_RX;

  /** Event triggered when the SPI Transaction is completed at RX */
  `SVT_XVM(event) EVENT_TRANSACTION_ENDED_RX;

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  `SVT_XVM(event) EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

/** @cond PRIVATE */

  /**
   * Response packet from mem_sequencer
   */
  svt_mem_transaction mem_rsp;

  /**
   * Mailbox used to hand request objects received from the item_req method to
   * the get method implementation.
   */
  local mailbox#(svt_mem_transaction) req_mbox;

  /** System configuration handle */
  local svt_spi_configuration cfg;

  /** Configuration object copy to be used in set/get operations. */
  protected svt_spi_configuration cfg_snapshot;

  /** Shared status object which allows components (which each reference the same object) to communicate state changes. */
  local svt_spi_status shared_status;

  /** Methodology independent driver for the Transmit-Receive features. */
  svt_spi_txrx_active_common common;

  /** Methodology independent callback container for the Transmit-Receive features. */
  svt_spi_txrx_cb_exec cb_exec;
  
  /** Peek Transaction */
  local svt_spi_transaction rx_peek_xact = null;

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************

  `svt_xvm_component_utils_begin(svt_spi_txrx)
    `svt_xvm_field_object(cfg, `SVT_XVM_ALL_ON | `SVT_XVM_REFERENCE)
  `svt_xvm_component_utils_end

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   *
   * @param name The name of this instance.  Used to construct the hierarchy.
   *
   * @param parent The component that contains this intance.  Used to construct
   * the hierarchy.
   */
  extern function new(string name = "svt_spi_txrx", `SVT_XVM(component) parent = null);
  
  //----------------------------------------------------------------------------
  /** Build Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void build();
`endif
  //----------------------------------------------------------------------------
  /** Connect Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void connect_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void connect();
`endif

  //----------------------------------------------------------------------------
  /** Run Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern task run();
`endif

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

//vcs_lic_vip_protect  
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nOtN/ll0fChj9kU6FDm6ss0aWtwxiAkgiIMhoEwtt54Bjj9nVEsL3u7pNpvRIPBg
0rbOCGV+pbEPBay8D5WsndMJuwlyYmTOoSqu+oG+osmdj/quQV7IKzlc4THforcd
qqItQfo/MpWvX6GSDQ9IzMHz/T1+bm2SyJkbckPzvjRhSZ4UBjYqAA==
//pragma protect end_key_block
//pragma protect digest_block
FsTbXAmISU1sE6avhYMt22ZpPmo=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
8dxnUwA+27c3pl+EpVBtzKeWp7s=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * This task gets svt_spi_transaction sequence item from the sequencer and make it available
   * to the common driver.
   */
  extern task consume_from_seq_item_port();

  //----------------------------------------------------------------------------
  /**
   * This task gets svt_spi_service sequence item from the service sequencer and execute it in the common driver.
   */
  extern task consume_service_request();

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction descriptor
   * out of its TLM sequence port, but before acting on the SPI Transaction in any way.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void post_seq_item_get(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void pre_transaction_out_put(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_out_cov(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Tx Path.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Rx Path.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has finished tranmsitting its last data bit over SPI lane(s).
   * This is used to update the data content dynamically while current transaction is in progress.
   * In Master Mode, additional clocks will be generated to transmit the new data bits.
   * Data driving to remain as it is.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest. <br/>
   * This callback is currently supported for SPI-Bus mode only. 
   * Only svt_spi_transaction::data and svt_spi_transaction::data_frame_size fields are expected to be updated by User for this callback.
   */
  extern virtual function void load_tx_fifo(svt_spi_transaction xact);

//vcs_lic_vip_protect  
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
LvB9jTV+T/L5GMrOgsjclzoylCYKhUaBY+rRFtooRJz50INhhx4gFwB0lKZbRhLP
/w/ioZPlTy6mt0SSTc2Zp11JTV6+Itp8trOYlLmhqsE+SRG8mF7qB+bkNEcg41AP
xXOtbYpE4gUq851m+TGaf2caIHfIgmjSB3Y5PPXivIppin9VolFpqg==
//pragma protect end_key_block
//pragma protect digest_block
G+eJmF7a56UkaWT51RVo40W3ahU=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
KFzSpRns/dxADllzkCZGuXLEvxg=
//pragma protect end_digest_block
//pragma protect end_protected

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QCWLHR7J5SKYi/aK5J5gTym3teEXgrQsMDq2l3k+d9ynsXwimczzBeKWb/Q3rqjL
qIgpgTCM4n3h3BCEQ6mwLprZ0L5jBgu+KdJffHr/XfJEIvX3QIHMJuQtP9xUvVK/
Zc6/2DmE2PzBrYGWlHJl+8/TOJHlTaXpYZrJXMjK91yS8NmswNRxfw==
//pragma protect end_key_block
//pragma protect digest_block
k+07dDctaqHXOXfSXWBhgJgSfu0=
//pragma protect end_digest_block
//pragma protect data_block
m8pcJaBKYXZwZxPJ7kGlnrXDGBFuXH+1LWi03uy1TyzSExpAplYIEKiE663QL73H
A5WjHFY1Odb+Ihx/sNo5+WeiM5LtL7hR7Kt8e0f7c9VggWMSlHa0li4qOsvukYAK
/bxUxV4Hd+NvfONt1qYGLOVmNSazfJ1PQqRCPUO4SvMPgD04WgwBdMSN/m0pR/W/
nNeiAq5VdWYZsC7ccAUR3O72bexEv3BD11WJ+TO4lK2ycSClyQtLnwsZg1JKTTuF
WtMGRl1OHYKvpa96n8Y/ngj0Agnp/lEpIcaULuiA3BbUOqVLA0MNxir81/Qg758y
2+tpxPldC/GVjRT4vYthlRzlHif6H9O+8wsIHEQL4khiDD3Zg2JsyObgdmnmhTmJ
NUo1GuJZq7Ar5MYsasUxh4cs8Uetg5jXeA0j2BWkgfxYW8XF8R5JjUqZ+Ui6aWFK
fzp5yNKHJyPz7liQF1TKoLerhxjzxZlK02ItjkjDPfBzPMJ4S0vtPJO6qyd2oC+e
5GyMbDvwohsQBxNn0G3Dfhs7wKgLd0gNemKoHlQ5S56MFUCgr4SPd5oZ+BC6R7S/
nirQtEPFCt2+0NwwIs6n/GVAd72fD8Csglh0kylinGYuKMBRmBwireBSVlsCTAHy
nK9dB0gg+zeS6wuMyiMIVV0qk1A2PqMSnpD49Mq01JxCQOASDBdddGfWwzBo8t3o
N8zuUAQPu6ITBHE1SwY5toglRMNTB1u4oTFT0TkMv6flHhgJ5yCHXzHoVfGRo+u5
bWwddO7YLNhk19nSA3zcDnjMa/6WN6unSFS/b52cMyMzc1zA69JWiXJkAQx2r0sR

//pragma protect end_data_block
//pragma protect digest_block
B2kOJR7vXuJqREh+TcpUnn8zSWM=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect  
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
qjibKvZlaA5krhx55AhF7A8s1YC2BPSdCeZ6G5EQG0LPIBKOEIH35iy5i6tIbfSW
KRc2UaJkI6vN7ePTNTfagKm4lu/p3d8QIQ6Gj6IgHMowluHUa8S+LQ4xzKhq/BU8
KzBfE8LxbN3FC4SuKsFQHHGks3LsNvwwLpOgqKy93SZdLu7OtDDRBQ==
//pragma protect end_key_block
//pragma protect digest_block
/AksibIfHP3D1Ywtt8s6voAejjQ=
//pragma protect end_digest_block
//pragma protect data_block
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
N3QDNTKDZLrPMZkN4qlw13N3GhhH0FBZV5LucwsxImv+XuPr24sUp0kKfCfeJgnu
cfUIz0B8P2FGsVeEFOnAFM6w2+8P8Uyp3ttQUyj9LYG4Y44nb26cA8DfaXJeYpPD
ARGr6VafeazSPNZdX9Pf4eQSoIdOlvYa7zYnK46PjotjkDBdtruwy1IUYprPE2Fr
Q92pf11xVkVy+F2oL19spbLiwuAJhIddDcWQ8z6K4iyyfy3keMvZ6iJWXsbKlSBH
r72uvFcavNSx8E5yXr6ltZGejg8SLUAOwvwvEBscwErIQdlh3I9j8S+tu7ZBK4pJ
MY1Yb7p1qtdz4qcDhrGvdSa9NNMCZKuO0OmMX5Iful/+M/Qq43OvRr0auXxuBh/p
k5DIr0Ei1RC6UMHCkyvkw17vSxzUYY8iz+vffksCPbVM1kGIEo3yj5iMv6lCHbsW
2SSdg5AMP0JEpgNwmJwadNkyakDjgwFoqAMQSu/2s6bFgU30oCtj26UCoEKpS/Kq
AQ7WV9ubkOzziMEXwpU6jZqH+hTWgWeNYwIhmN6FrhGiORvSTlos1lWXqrj7cmtx
FPbsU7fOVCppyJvHv4WXyxgMUR9zfXXTbBkX3vuo4XQUpkKYNwzSCMGK9CHo/wtR
jlm+i5HVrqIe+MQVaEwPm3hknP5dr1YV3VMn+OxPaUScVCbIs0jjRYYLne4AhphK
VpZiH+Wt9b64cBcoDeekokrjqC6gslT9fH3q//6O6q4dQp9IW7SsCtV53ahl5qSW
JOv2uDvj+OoRiCaEILItQF1eKVWqKYywgBxdozcEzcZR1NTM5PSfcr1ML3Bq2PK3
ZwaOQ9to7LxMVHryn77VH1NiJValix+uGGuDRQlDa2LsRQE6EE7rbQ02eQpPrjoB
nHcnPizX25IxGZflxaKoaqYbAPv24QBUmE6w538CEN/X9k9eDtvggKPvSq4N4PVl
BdpRs84tTH4XaeUdv2kqgtc67hGAWrSazGtYHplXNUB2FNly6BUCjMHWITF1u5Lv
XGPelERjwZDu2wlrfz/YtaZIMreUWNkUUUGMfQVerJzc1fsWJgGSkvl3FGtb3tsf
T8P25WYCd2QfP116MLrEDMLGjoEX2J7ftdO8r6rBUDmmmjkdPRC/WXOk12lhnX48
sOqf+TiNlNPrzTTOn8LXZtqD6PzuCGH2vBG7JYvaN+GnbG9g3+qW6ieESjR2T+e/
SSPMlKGw5Zj8ItAGyLlPGJrUi04TmJ/9CIRo/uK0FkUF2+5v4YTOhQxz5wPFOxcq
eALw5/ZymnYumUYqjBPuHntUFE+6tugu++nAsc1BLsRzlgsYB2nV6P6vCDuQ+l7Z
kyypFTrlUTarEJlND6z/+mhbo2O0jAC4KIHItH4gqKa+jE6q7DG+OlMApn7QN/1E
MaIHUDr+ZhuugyuJS6yEOKOy9/lA9iO0WWeT9nkexbtHal70I/dSjVFFPkvhmB6d
VdqkJfYfPhGW1mDgisEQ+Ku8b1ks/A7NPaSyLRvdHpNUNDbDTFNHYaR6bTpYcRwV
s+8LQnxpcUEzHXqxyh6UgkaobMj/100WK05vMpiMol81wa4AawEe1cMWMAoq2kWn
AsJsEM5YerWibBhvuJ8PZIPfVf8bVCUlZfDNgzKnlRgL8clQXWbyITfRUX/sxhkd
PMUUtiXNBj6FTjbvJMuR+JdKt3nwIehcvgG4K3OiLlb2CTD9M52QzpsmqxHNjRMz
5K6r9TGK3zw6x1KwpGciiYKFpCfirxlxGXCSwXecgO+bF2qenEjYiWGP3nzPa0hF
mQgJ+hp/dnDrXGrtJZKbBzyKnwNmDiwjpGb2evVqTzTIxg5b8oDCxzwMKn4FBKGG
TRDGckNFF/JnYkZbCeno5gZc+bv0yNl7ltENOojwx+LEG701Myc430w/io0MZPIm
jNt/Xnl6K5EoHJ1GWpQvDV5gzwwJol28OAZoQbSiO7F7IGH04vCsv70g0U10U7iQ
WJm++PANLxgUlnzFigF1e+hyUyVDDSnxLiUuo62cVcVrTTc5glKDUWbutoNR/Rpd
ijLZnEXJypJTOdJnRC/iaVw9S7/hmacP1rhnbuJ+j5iziy9ahJzhWeklKD21O6JV
BqYLcgoq680Mh8Sp+7QcQo7JgMYC6bRItGRn+djDf+5r+XIqHAl6nDE9GalTuC7p
iYurnhe9vt1hNskEZHnr/oj+5FEx+caplHqe8P2unJjXXGIo4LkIGjbPxN+gDNRf
OQkqP5ksTDgNyyJm2VeCSYSbRPj2ypitXzfRCQCA188k8WJkV4dTDY1a6lWrltOY
ZcZ2Giwu2woV+nr9gwBimK4DQ/C7Thue8Nz4Rq+9ufVMvGsFhqqfEMUY73AhUZ8d
g/FZFMW1EUrkDjVXuKrdoIBJbxL0jDO009fErmYK5OVxPwTSq3jRV03guXuMbvIh
lfg7zJPxnMrNf15lDj4BNVJsJqSPdLI+SwKSMix355QLHj/7akkv19lpXFVMCG3i
wFD1TakQkHgDHBtEVP34PQkWPpsco3/xaXRPtdjiGz7eK12/CM/C4YnKFzZhAq/K
uFXp9I5sBZQE2SOlAIFtcfhG2Hp8wrDoVjQvyDMDGfQZ1RiWkAZ9mdJBocXkGnPt
HDPyVstJL84mQD5Yk4grWu8udQfI379XRAsGNybDDHwhvOBHJp8bt/VcuDkqnv4i
T1mII5Kx9BybKHItgbFwEAm1EmD4FNL+N9yTNHEkEeovuzruHHJWZkYDrGV5uJNG
KNCEeo/lRljquI29Vxgc4mTENX6pUsAIPhm6aCiHwcPm3/RcVURbE+UcuC+IAubn
6G71lWJS7j9p9Kf9aGeBtITUFbx4Qvj4mW3tn/DmgP/m2xKFT/dY1A6IvPh41sCH
cO+kFFNb4TBVYYUYmUtoKjCnBdJtaHMFIO5hI14HvLqT89Tu2eg8rEOiDtvGQCCy
GpnafeUY4OuFnkBkMZijPBWMJe2yG+V3xno3iNRLQuzC007DAnBTxI5RIqRzkdrB
x7BNeMcvPVG72JeXhKn3osUQmW5XXnWaJ7dD9K15tcUV4hqJax/lSeVWKT2xw0a5
6A6D9AP0de2KhuR94v7EtQLIXtpn3waBo8ODWheQ1lnZXH97LKgkAHSJrh8TMtxa

//pragma protect end_data_block
//pragma protect digest_block
G/JN4f7PB/gfZ8YkYeNFdciQEJI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_UVM_SV
