
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
typedef class svt_spi_txrx_monitor;
typedef class svt_spi_txrx_monitor_callback;
typedef class svt_spi_txrx_monitor_cb_exec;

`svt_xvm_typedef_cb(svt_spi_txrx_monitor,svt_spi_txrx_monitor_callback,svt_spi_txrx_monitor_callback_pool);

// =============================================================================
/**
 * Defines the SPI TxRx Monitor, used to access
 * traffic in the TX and RX directions.
 *
 * All transaction, regardless of TX or RX direction, come from the same
 * source. In an 'active' situation the source is the driver, which is
 * processing the data up and down the stack. In the 'passive' situation
 * the TX and RX traffic comes in from the analysis ports coming in from
 * the lower stream layer
 */
class svt_spi_txrx_monitor extends svt_monitor #(`SVT_XVM(sequence_item));

  `svt_xvm_register_cb(svt_spi_txrx_monitor, svt_spi_txrx_monitor_callback)

  // ****************************************************************************
  // Properties
  // ****************************************************************************
  /**
   * RX SPI Transaction TLM Analysis port for Monitor.
   *
   * Provides a mechanism for retrieving RX SPI Transaction recognized by TxRx
   * Layer. The handle to the SPI Transaction TLM analysis port can be set or
   * obtained through the monitor's public member #rx_xact_observed_port.
   * Used in passive or active mode.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(analysis,svt_spi_transaction,svt_spi_txrx_monitor) rx_xact_observed_port;

  /**
   * TX SPI Transaction TLM Analysis port for Monitor.
   *
   * Provides a mechanism for retrieving TX SPI Transaction recognized by TxRx
   * Layer. The handle to the SPI Transaction TLM analysis port can be set or
   * obtained through the monitor's public member #tx_xact_observed_port.
   * Used in passive or active mode.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(analysis,svt_spi_transaction,svt_spi_txrx_monitor) tx_xact_observed_port;

  /**
   * Blocking get port implementation, transporting REQ-type instances. It is named with
   * the _port suffix to match the seq_item_port inherited from the base class.
   */
  `SVT_DEBUG_OPTS_IMP_PORT(blocking_get,svt_mem_transaction,svt_spi_txrx_monitor) req_item_port;
 
  /**
  * Port to obtain the response packet of svt_mem_transaction type from
  * mem_sequencer
  */
  `SVT_XVM(seq_item_pull_port)#(svt_mem_transaction, svt_mem_transaction) mem_seq_item_port;

  //////////
  // Events
  //////////

/** @cond PRIVATE */
  /** Event triggered when the transaction is first initiated (TX) or recognized (RX). */
  `SVT_XVM(event) EVENT_TRANSACTION_STARTED;

  /** Event triggered when the transaction is completed. */
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

  /** Event triggered when one beat has been Sampled/Transmitted at SPI Interface */
  `SVT_XVM(event) EVENT_BEAT_ENDED;

  /** Event triggered when Flash Command has been Sampled at SPI Interface */
  `SVT_XVM(event) EVENT_FLASH_COMMAND_DECODED;

  /** Event triggered when the POWER UP Sequence is completed . */
  `SVT_XVM(event) EVENT_POWER_UP_SEQUENCE_COMPLETED;

  /** Event triggered when the POWER DOWN Sequence is completed . */
  `SVT_XVM(event) EVENT_POWER_DOWN_SEQUENCE_COMPLETED;

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  `SVT_XVM(event) EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

/** @cond PRIVATE */
  /** System configuration handle */
  local svt_spi_configuration cfg;

  /** Configuration object copy to be used in set/get operations. */
  protected svt_spi_configuration cfg_snapshot;

  /** Shared status object which allows components (which each reference the same object) to communicate state changes. */
  local svt_spi_status shared_status;

  /** Handle to an abstract common class. This class is extended in two different 
   *  classes to implement shared functions between the driver and monitor (in active mode) 
   *  or monitor only functions (in passive mode). The containing agent class will construct 
   *  the correct extended common class and assign that to this monitor.
   **/
  svt_spi_txrx_common common;

  /** Technology independent support for the Transmit-Receive features. */
  svt_spi_txrx_monitor_cb_exec cb_exec;

  /**
   * Response packet from mem_sequencer
   */
  svt_mem_transaction mem_rsp;

  /**
   * Mailbox used to hand request objects received from the item_req method to
   * the get method implementation.
   */
  local mailbox#(svt_mem_transaction) req_mbox;

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************

  `svt_xvm_component_utils_begin(svt_spi_txrx_monitor)
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
  extern function new(string name = "svt_spi_txrx_monitor", `SVT_XVM(component) parent = null);

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

  // ****************************************************************************
  // Configuration Access Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

//vcs_lic_vip_protect  
`protected
a:aS<O/N>CdD/&-gGc_P\-Wa>97LXI?FdTSA45(RPB\e1X)0;ILF/(cD71]<cXc&
\&ag#?9#2IHfWT1GI5YW2Me;f08NNXWDNbP1A[;V[MJX03+,XI<a(K1d#?W.\)JJ
D.KL,X^LNX(<9N:F969:ZdM)9=1R<NB[/_ePTQ^9TGYRB-@,<2+Y]]9HUf)^bJK&
-P/M[AS#LM),IOS3T,:S)XfLf#,YN3&(BBFGT/?e6:_TQ[_SbOI<[]a5P-d5eI<5
W[Q.49ZTLS^4LYUX@0@Ia4_(FIZ@=+\fL@UO<<38?JPTOFMDIY=WLVP^HWg(@B^V
>[b,U85e+HJ-CGSPgDPYQ41e_MMFJHGQ&_:eJ;YHcVZJa17/0?=#-[WV5OATW76W
I//\_;+)?dEb-TH[O>2C(RHGV)TB:HdWE8,@<&7M>;9#bVYUfL;cc3Y,#=3SD>^C
eS53e+N2#:T3W^,f)]T07)U.7MG23N.@&6e#M_OXFYG@g0@-/Gf&#F=82.HN.J2f
]=>;QTD+80IO+PD7F+)NdYF&8GcKZ<3V;(,GJK]ZUG2(LOQMTef_2>_E&]fL&;;7
>9ba(ENg<WcSg=1G);IVNYVZX-<gRdSD7=G5BaE,8T.6)N>AE-#0eU[-(P=@=:U<
YS,NPGXeSD;WM5U6#b:BcD1a0(3@1GSPS2<gf@VUB,S^[M?[AdEXX8O;=V,1WdP>
M#YO\eC8K=R_\;N?:2EZXPEYW2SbgcTba9GL/&/ZJG-#cXJ1cS+2GB<_<K9F)=GA
_:KJIEZ6T(@KU/<9J6NS^[Yf?73JE-K/N.V<#]BaOP9U.b+28IIKH#=UW5T8G:\9
PW&^GV?CANb6\9;-W>+6PWR)TW),4ZX.ES\0#Z7B]Gade4Ag\d4c6NC.,[Q=8-D8
?23[G6^T6&YWWcLa6[&aYTCb,,I-SU(K7F;T2[_b\/7YAZL^)+3633?WIWa\>[_;
QDf#dUW319G,:\Te31db5U5+WQ#U5=[,G#R)TO>HLM..ZHGA,2Fac,JWb9PA,>3C
RDf0Mg/9,:YL8<?-FM)40M+/SH1^W>O+G/]DAbERV3Q4ZeSAA.84SZY-KN)cAP?Y
FB\Z;+8(4N_)@E3g45G21Sa[CY_gfPG\VVIG<UbIfH8b]EDg;-Q\#>[c([=?)aZC
>^cfWF0BR2IX4-eNQER7B_PV=R&.W8CJY,MNd+b[cId3be#O1SAa\Od0&H81&5.\
O\9-MSN&9B/5\+#38ZQ+H:@Td>CW#<[7cWPD\4]Ff,0AJI,V,]LVf?B;=I9KNUZG
aE6O@\^L6H39?F?0T/HT3HfR?0_Q4DHGP:c<4W5gTE\;)LNa^QS6H:PRT:?aCdF(
Q49N9P34?S@a>,A5V.1+K/8E)RXJV0[R\8S:39O6TNY]U]L\ZUYb@0Z51JD:bf@>
eD4DFZcNc,=-AA2XdA_:NgPZ8:L69#>#Ef:7e(b2b94fQf<W85;MN&DaEPVKJD\<
8P)9<Md6fO\J_)V0e>W#33#(-C>Y>T5]1QEN?U_<\-MENE+\.@7V4EY>?=;?7@P2
VTB:BC5JZKFA<P6L+65K&RYU/;9=8.\^>D?Ac_H?LW4&;HV=_,fdMY1(VQ^+R[<<
eO,B#U5O63/=?#NT0EE1NfRS\Bb0HM,8@UbVLWBEaRbA7H.-P(68.NeN[2\WEg7N
U:;PfJeR_)2C9]4F)7HU6Ze>0A#?MD[35QS8S8bO8EZ##VFB&EA25;U=>[;3MR-&
9^EdQcD>1e2QcKX<38IJS)7^JQ8RH8^#^F@8_2V(7RZ,,^IM+PY<#)Q,_J@N69Fd
7=XF?<4L7GdTI/#W+Kfc>fbAF\cQG:3dQ-aD2QAgM\BGTSE.<I0f8IC+F.MQQ<^[
;=UW+/#1N20N?T\T9@fI;V/3eLe;J:_69L_a;gZd=\PFF&3GS\H1[VM#1@dd_T_K
#HWS[_N\CKR@4A:(1CM_1/<DVJ[Qg8c.J]F#dS3#D2@Q6M\4J,a7SC9\c\Q<3>=1
Be+E_b0^UNVGU;&\5cG42EEc+1dKCTZ?_d@I@XZ?QfVD\PQd5R_3RV-A<W^Ee21d
F&BNMS(O3NG7>@/=AQCU6=]=(fbFGH1e;6\4.3P-<:bgXQ;;GNZB>^TY#D@F@ZTQ
XBObW]1C_1=NVR9b6.R,aEfIH;J1IF)Pg@DbT,TXP/0a6aKUWFF03,AY\CB@\0(Y
YKU[X:Y^1#1S=2W:@d9MFE1TV;=a;C#1Y+7P(.3dd<II_2^[<]GfZH(M,[D\Se#E
dQ=Cb),cFR,1)QE3].#I?Z_UI]#_gaCK_P&23a^9;_ef@U=ZVNX6aG))e?OfUP>&
R&PD#N:J6S:KMLJBPV?MeG)#=gD10-c8)O@X3e3H,FF30OCT?0SBVc@cTf&0d9Y=
F>g=P96+Xe;@EIX^&8YM79.O,MdD8-W>&9gU=NVD10#S;P;KVWEXNaX=0^?TL9f(
:<2)._]IL2@BbZ>VQRg\]#\QdY+SJea801/=9;dW:2J;-Z427(26fM+\,5ReA\-E
\cY=:QD=GHg(C5.4FH.RCDb9+L5_e4^Q2U2b9/L\Re.,SGP(Saa_W/MI8WA5;N0M
GP@.,ca.;X6R?QNW_&aW.Y[?SOfGX97dCD62@3g+bbf+D:[dK\[4_W-+0cH^Z<Fe
.TXZ4,-PLU2B=34PWffI<B9AUDVN1L08\.8&]_dAA-::Z8;,HaJUa6Z-a)[6PENX
Ga0(4V98PG\US)M]Y2F&XL,)N@8_NRUaN0#E9?[O_=^G).W==3.4+O4Hf0E//OAV
_]DU0D,TAKNTM3cT+H1Tg^U+IX>.DR2L6991dQ68Ig2KYb2KEUA<X(#VAbRD#5P:
1cCKY=2COd,PV47T\KA#f#aE56JV.&73-,aH)IL2GGUB5#54C(O:9+1d&3,\-50-
Ag]GZAJ7.c[K+1FK,J1a9Fg]V>NFQ<V6RX]RdH2EU,M<8EVVBE)]1F,9S]a/V6)]
IIP>ZS]+X0DCL)EB^UE85(/><JMaRUG2O5X)AP+UeZBRg9=X:U_OG?R2Fa>/_]T.
_ce]-62^UWH8+>)<;(7.\b;ZLcRVga91f]KcX4P>QVDb1Q^11:)C0fL@\+;0dRWG
HF++G6F?:fGB\3-^JA;+B0:+ecYBQdBg?UAd:,FF6VG48CX:KKQ]-<2UB8aTRHbb
ROP>\.+K_K.0HI=YID-CL+VC;cd_dH8e0a_dA?9fHYcgJ/;A--8Rf=(G0fBGCW@:
P^gT@;F]Fg8?af6ZE5)fg4QW[ca1bb:e[K(4FaQe(dZM<DRa9;W8-7P,M:NGVYN[
Z7GEVJ8O9T(6)@85UZgB2=7_2TN#Y)-V7)0,Z\#bLA_a91fPPc&QAWLcK&JFNX)e
HL]-V<JI-e=XdS,LF0#]S,TW@QZGH_8UQOT7M6F4/B/B].adA9fFF[ZVc1+:>DbB
,,B,[GST66M,.X6C72]K\;LdX#V\FREEf4/b[cAB#S6cV\B:_]3<.S8YTT2e#^da
)LO)[N-@:7\Xbd)UgM;^IOU5(Y:EF9A34R8d5VfN9M?P)-I0(S@A-R6)GC9(&8.M
,OA4XJ5A+?K_4PVWG-)LEBQgfdDVI^g[V^LWF1:DDP10MB;B>EK?H9^[8Le:BMSA
QZZ;Ob4e.b=N(U7eJ7L#)gW.Kdd\TSI3fW78(FCNc=,;6(V?BOE7S&@EQ4DbTB:+
WHe^ZZdQV/62@0.L@-L,\F;I:);QJ4ZR?3Y]G1/N)F/f?fa^0O9@)IL>)7O#AD>K
#+KQ0:)FDL6X+C7VT[g.ROVP:W5[/b[M/GRVbWW;(P7#NcUCf:X4\DC?DO8PYE>b
,N+R76,Yb#TaV3MNODaaJQ2S?N\W>]5K47^a2V]L0[GQ/3FEG@?BU/8VJB<7JRZc
P:cM>f&?B&59G-=V4Ta.d]XQ#AQfSQUB(e,^I?ONa==\G\;3OMG=f+JAQ6Cc^f.4
@g:G6\TK6U/M:+=V:XX/H\W#^_,]8]GeVM7BMR-;@[L#Q(FESSK319+MN_._@Q.]
-[9KC7SOd\]=-?3?:;R@HW=NF4<K&;g^3bgV1f_/Xb<58b9]1AU>]+1)IHdI7@:I
A+Cd85g<]P7FD8W-97=9gRI1AEc^DE<SQNBE7f\?@F<I<J6<5SFADXW\Z;b5=XA8
4NbcL>21VDZQOYVP]^00ea(TVA#0@(>.8U#VYEZKFK>XN\fDWb5Hffb>U(R)B,.1
2c917d.&W<@cP7)bN&Z<6dbZ9cN/)ALDB6K(EQPOT;Y:2W=DS3dQX]QVf:NZYRCe
,Q?fU)0B[-1#9]gLgOVJLU8-4#9.3[LP,=-@QZ^MMe5=9LWd]\.+7C4D^1<[bD7F
L,7B1DQD[3-.ZX0PcW-L<Rg\S6SHL-3=N\R9C#2N,LJ@T0Y<YBX<:YTNdC.W^f^+
NT-O6DWJK:/M2e44_7NX<S,=LbObZB0@2MILAUbN\]^K9(,J>&<#bK:CQX[_JJJQ
(4M5>AC4[KHCb;9NVBaE<@\bB-AFX<M+ZU(4.NDJ43[fT,);H;@1UWD)S1OJ#;)U
^,;_eOHE)PGb4)31V6d96A0HI\74B.XQ0O<WNOV1M]O,fK4PNA\G79SO=2b<>T<4
Q0(>cdAD7MIWADREY;2Jfa0H6$
`endprotected


  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void pre_transaction_observed_put(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_observed_cov(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at
   * Tx port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_tx(svt_spi_transaction xact);
  
  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at
   * Rx port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_started_rx(svt_spi_transaction xact);
  
  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Tx
   * port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_tx(svt_spi_transaction xact);
    
  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at Rx
   * port.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void beat_ended(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Flash Command has been Detected(Sampled) at SPI Interface.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void flash_command_decoded(svt_spi_transaction xact);

/** @cond PRIVATE */

  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_observed_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_observed_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task pre_transaction_observed_put_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * This method issues the <i>transaction_observed_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_observed_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_observed_cov_cb_exec(svt_spi_transaction xact);

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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);

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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);

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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface.
   *
   * This method issues the <i>beat_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>beat_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task beat_ended_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Flash Command has been Detected(Sampled) at SPI Interface.
   *
   * This method issues the <i>flash_command_decoded</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>flash_command_decoded</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task flash_command_decoded_cb_exec(svt_spi_transaction xact);

/** @endcond */

endclass

// =============================================================================

`protected
A)36)A5HJO.:5+M;0T(V]ISeOMA^5eJY5BRN>UBI7XC1Zb[@X;+c))c?G4M>ea/&
,8I@eV9NF+#F3f_;CO>(/S:\O<aR8?4e&^B@8P/X9)9:IQUg8bH8?4+\_OYW.c,[
K[J:R(1+cR;dS5L<3D?(P)QGa\bcfCIB<NJ<A6I1:U)&7U]^Me-cFI1^Jd<3Qe)7
=.>G()Q]6K-?(/aSI9<,W]1a+;7)PVeTa<f+&S#d2[.&5U3X[.16KCd9V)NUS-JH
g[&&EVIL:NRDdX4J;3?I@O3=ZPW)^P3BS,,-b6a0<)F2d^bDA9^dg31;7W_g95@b
e:TJ9-#/=R-]JRDLdcZ6L>X@X/&./U?L-f:R1804L17F?<D(#@[=39eAEg3Qa?.U
GH5UI6_4H&JBAa5C4<VP\=:6LX4Y#YO;U)7K:=#DLgVFF$
`endprotected


//vcs_lic_vip_protect
`protected
dO5S-;@+9D]N[+X(ELF&J7G81Q-1TAg+gX3PF.,WN/2Ve1MX80Uf,(.^b(Q<R&#Z
Z#Z7IZI[HDCaS2GCLPH#YCX413?,][eZI>,9(0:@C>GM?Q>+W\P6eTE>_,ORGDg+
,9#N0\DN59MEW5-:@Ub8Q:;)X=((\<VL@A4AT9N91NK5b]M+7R)WB[JLE3RG&[T;
#3;Nb.HB1DK]G=F/E>;c#3Ecg3)(0?<db1F(?CY[7Zb<FBDBKAWHaC-MZ+4CV(?T
C&c-ZBL>-H67I9^:5D;+EEf&VVaQcG(dC[YaHF=P-WR0YIP,]K4D:_[FXG[I6Ff&
]5AWK_:O(F7:\](?(X;9L55dVcReTZ5OC9g?_BO@F401fQZS2f#@]JbT.-FOOE@W
BF.N3Ha3KDXb<JUA#O>?^2C6TV-e<4XOS;-dTOeD=L+FXYfWb2L.N7A.a#6TZ_Y#
,4f\=K>K2&&_83?BCY\);bD,Ya)5PE56^Z>XCI,Z]0CfP-YYE4T3Ya>/6BPNaGE@
FVV)(6d]E=+LF&M8#JgN:X^@R52Ra-HNO@?N;7(aW^BW=[c.KF?JA&1G<[C/>Q5\
MK7PK?G:eaB,-GE?b(4,7cKD):LNfd,7:/Dg:E0gg<#B]fL<C+KgYBONWKC,RdH7
1LadIAf]eZ=_/]#7=V0E.#N&X^JX6YH^LA8;g0T.H0;WU6>-JAJW>21a8JH1T2R)
X=;dDF[7(?TW\8c?&/GLNNIcdVS3(9,\WO76YV&<[M,W6D-M0gC>Ng>471;F^c/_
]+^NC+P<^FX,_T#684+<VV-CY&:=?SFYO<\+aN<9J99b(#>/VIfO,H(;J,C([dFQ
e4[ANB-ZP_;TB#cCb^UYI]9P^](1/A8ObVIeZ1?fX-N8DeGF2d;c1<S4J.7(>PP:
/Q5\?^d4VMEfOE=/J11O.G<4QgfZOWPG-X_OSQ8C0PB2M)>T9]M<7EdgM628\aBV
J6^Gg<[=Z[&,80[4_(\I=.E&N\&RJ>a5U;,[Z.,2-@5AQZQ;DYbb=08E>J;FFN_&
_3D[A5fL181Y#c(gJ?eT()DLLIY[?_XPXSXQQM]N]ZU^-4IL]6>CX<YOE\(C7IeL
P=@3W[(-]+f)R0PZ_f,,CX6Dg&Y&)]&A2ZC[=)K4J16]EC6#dJ8;JUU]@\g7USHS
_Z.Z<,1YMcTYg9E>Cfd,WTXcTgf<A50U-ILB#/9;YF(V;>U.26Y[RA,IY],<S<+0
-=WLf;cg@P;bR.TC[\#Ne^<8Y+:K[Y4S7A.Z;c;,L:+SJeAZQ.0@R6-31V=c=+//
/-M&aH0>RE4ID#O4)gMW9&<\Q^TDfb/=Mc6ec9<Z;8-_C#^;59#C[e4RU+A]A+J#
1_E__>=#S4.gTVeK(:bF&.G0[OJS]D72R.++\M[(@N3A_FZe[C#b_fS^ALZAOL&W
G5N/)B0?.++U06(##;]>IQGHe&2&@VZE]aZeB0TYMU(JeW07P7H7M>bTL93-3N\B
HL(C\e(cbUFg1@\SgCS\L)bYW0g(Y-(9HW)=0LabdEO=58K,X(CYTB+ZB=/@,^5,
E/e8&_Ua<cU<0AL^QF?2:.YM#JZ+=N?-_]0]=6P7fZM@\,YC(:EdgYZf2=N)a:;9
f)-a]?Be\QPU[b=466Tc/d8d/&RUKf#VL7AS_2F6>I5GeV18<dc]dg2L7d-c]C+N
6H]Pb<4S.1GPW2V@L_)3ZP6=Y6a>62PP-+BVNZEb;_Z\T]^O>?K(8gV_Q7TU#I<9
VP1Ud-ECN^IWa2]H>f:-/?g=FP&+C_VN)OPNQG]d4QHK&(:?.e2GC;?V#.89\g-0
3OVaMM=V+0X7?#>?0UN0X=R@Q#962HD?A8MS8b>CA>QC-(ZHPL0:SA8SKQYMeIEP
b(NI8,b3EFb;QNQALM5>8]NU5.G_(UV0#6/9&2+63FPddSAGWYc4bY1<TJW:Pe)G
LcOH)/L,FZ]]S\E0JO,@+J.JBZTTVGXW8T1+CK>)&;:aF_]Q&A2/F[ASNH7P(9FI
_)Ed<#X>fZAPc6VT_=Q#:3.LS3116(KD-K/K<\_GY4,WL_@GB6edLKAQ59f]]/:=
a0@@Q,1C3Y(TY[\(2NaZMLU\\,(+DH/g/BJI]A/9[C<JR2B1BeRgKD2PFf7_;OUG
g8=XVD@3F/MYG,:a+@?3A36OQ0WSG3HCaO<OQeCMXRLEFZP1b97GPE>-=gX[PC;Q
NO@XefY026,.0FE?+U<0?D5e,g46,R]5F]Va]SC5a54f2GURB]+0&FG[?a:O(?LO
a-^)3SJ81=aA[>G^b#\ZXP&L?I2007+<gR:^[UTa8V^YGQYUGcU^OKTS46U/FICX
S^6g^YALA+\7<FZ/)E]N>gO7e:[+g.,&WZ2J@cGFDdD[+ffGCZ./::081A0358fW
A3MK+\D;;b\-X;RGK1N65[/I2F?QCa8;XB8XFb6KB2\=:ce8PE-+bXHZU=(.17[&
:gQF-(2U48?6Q.ccd0-4S@N[LHd4OP=-Bcb<__])Md6]K64;;]c_O;e[,ZH1:aSb
>OTA1gPNA<--/d[M#97)d;=YK:VAI4UO-Z61bN318RUPa7c0+EGR,c<=J9U)O[+]
:Y=J+C0fX_<;_MR#3=.7--Y\U2JFeRF&A<3H3):(D6C@W,+^^gO59IER#NZCCPK]
#/Y<bNG>GK2H85Y@f+(P:@f9-_fAeVfP.700DgNN4@&I8EdXDG]X+#R>#V4gbA&S
HMaI_F&RJ,<Yb(9I#_;<-.B&Pf]_FDJ^P;G#VRgB-MIKFdNJZ(A6>Q6\K:.V2]4d
P@S4-QgG7A9Y5AM<UQJg)X44K)8Y-SJ,4Z[.cR<Q@;;==E?aL<EST0f;=F6M<AQ-
^>#S1.<+;\eTY?),(VO;\fIV9;DVdH=P<WLK];WCGNX2BNJ[A2F]:f83Z1QRH67E
XU0T#gF:f?_bYdgDeMFLP7BMXU?.cFb<\W2Ab>a1PSX][&8T&-2:5MfId;ZRd^30
<U\O\;33-\XD3\Q/T+(N0HVLV@L<?K?E(8UXQ&/f=(-1_#X8/@V-CTE5MA/25]JD
g):M3;S-_@JF[bRC.=XZ-P?\PZKB+fUQgN7gcYUfT8_,FL44CUe4Y.Z#]ZMb4K8S
#&9Nd13/]gBL1YNP1T:IN[7^S+FcWQZ,BD;F?aR?fM)-.9X=3M539-^\JRWYTR+<
[BD+&&4c-5,\Z&,;Q^/)G5GAPKLJKZe?B@D6\NU3P_HC.0TX)H+fHQ6.a\115\D(
/.4<MdSI#Lc119#[c(Y#V4LR,1XJMb5g7S[&fS)bEL<dT/W0<ET4Be4AU2#:g596
05a?OVLS/2X<MD^fd#L0<Q@K)RN.d/7eAQ=.+?[Q[YeW:1[RbgaQ:DbSc4775N:=
a=_N+,dMFBeQ>bWTVY&Xf#UBHPV)PH@5eHIRC#<BDL[/AB)VKQX>Ree/[I)_FNW=
c].GJ(H(L_:.,:;Z1.7U/g0@H14]@_R:9(@S2,A(K5Ea\D@QCAa^/C_XL;dRYa08
LU2)08=6b.)Fe/+@Z#bUb](BJcc4IW:5)R7(0-g-R&R]H.Df^#YZ7=+,=APLV\S/
##JIT)-Y7/cKK)1N[d@/W-CPaH<&dYDVNe.;\756L7)#7fe0aQ]a8cF[<NO;?7R7
4NQG,C1M-HdC>&TI97bM#aI5-#((-)c@=I?S\DHa3^<1C/A:_EF3g^BY?1IMKD])
36daXdFG@D12VNRd.-L2=6a9(AD3XE1N_@OM4I[P(^N,IcNbDJJ?LWU-gGHT40GS
G@\YgR;=aCY^WNSN]3#;8,[]bDE&+E,M40BE)aOcZJST,CLWJ3W/YfCI++TEEX;f
#LDI4E&=1F-Pe+H68H2NQ+0>=9aIfROd@g:F\0X[&DT_2&P=WA@3N/e529P0-VU3
6aGXI51ZagC[@.=c,)Od/4?DVV#IY#I7J.9Sf0);fRUa@/QCW_XK[GA)a[]SO_CJ
6^8g_GQD0GE0Yc4C.Rf.K^7A[CS94^G+.2YS557[SJXPZK+,.0=WJ&:4>75NQ1&P
HR6bUMeXK-5HX&\M?)Y409IN4MXb.=4@S3J5=ZB;ea@bWR5QDWe<T#[e4Y,dWa/a
f2dL2\_,11GEAH2&]ZRf85UU0_SAK[#DYQ_&]AM((gK5;VJOX(T;-6#0f3Cc15ZF
PF:gfNIKB?.-64AUDA\\9@X44Td4LKb7W[g,;I)95V343QBN.FG[G3W+DPVCZ<?S
CB@>=K3W5[H<FA1=gT.(#]S^R0P51Gd^ZN&^AIOQXS\C6#6;OPE5GGIMQG@6cU?5
1Ea\-6[>XPfU42e9&0[O.B<K8V;/]W[P/Md]aTO^(]FM2K.Ga,3Ce7LSRQA[Hd_K
XL>4(T4T:1?#D-];54I_8/Q.d7J^Hf4I@.Q1?=df[J#bd.c)&\H)5:;+ecf83L+5
S(D7eM83RbQ=8)DYCJ9H?1+H4_E<&SI,IZ(6>V-OE2b4N8&B7+=]Cb><8aJ0DTJ8
3ZDGTN;4adPHZ9aRf-IDBMI.C8Z]1b1LI<M7=;e:R7SH(T<@FBc1I/]TKQJ-AF\L
aCKOODV(S0f=5]T.M6>DAH=GV)&:&e62SJAg=4)b\2cA?cK,>Lg4,=[c@B.(X/<e
K?V,GG@1QT#Ze+>WMI:IB<4^=>9.CI3.d&NU/V_].+T3X4-UHJLM>Rg_GVH).VV]
+L(-?WFXeP>dZfFMSfNZPU8FFN-@?M_Fcc>X?Va:2fD,Nb8/VXb+W4PLFede6==d
U<b=>HKOTB)C3&[=B+e(-SMYO+F=7K412U8H&I^#LKe&/\81189Be@EfSF:-a4>a
TV,5,UJb8E9.7c4(IIOTH[16ee5&eA>)ZB[SPM@+5.6C19O5L00_S-PL+YH?@VaT
gZ,]#1LVfN>AZ4Ia]VV?LA3Z7GEJ:JdW\0H&?.M8?=)@1)<;c1IFCCA[.C?AfQ+?
N:6LZN.A9;3.=9/UFV^J46U_>QZ3KaeC8YC\X]?C]V7\C^YcB&?fc-0(==0g^\-c
<>S0bKDAF=)8]FaQWbOH2YEA:f<HA,VL]_Lc[TEB=9V]R8=/VcV)=ZDEHdf#2RMJ
<X=^#\3YA(JK;^;DZ7HQ.36e=,-NFC^Z]>/@dg;8+N2=)f>L@W3HPO9c--KUO0/F
Q)QF)>2[.W>IS@5=eX;FG\;#gb7\[c5[a.U<S,SD_]=GB]KY\JYM_#c>\A@CK6GA
a(aDN#MT,D)-Lc.:\+VPUZ[[TWZge-CTP1KU)EP-<3GP,62KQDc91Ka;H([68DNW
Z\@M5,5DP<7c?EB8X?\Z@0If(?4]2A37f:MW14YNc\=fA@,:,2;O.^L&.7M(12?P
_SGO9OVQ>/06>II45UC)S34CL/)W.Wc&HM1fORdAWS?b2-eYE2O#<&J92C,]]WB:
R65HTWXGgcX(D3?30[9>70b1RQ2_]NMGLVU9J_8a-_d(GHXAQf/cQ(PN\2O/6UN/
Z>5g+&O/(R@1E3X[S&3dF(gdD.0-]50P,YP40=?BHVLV&?c-K[J:KH+-+I-BPFg=
f[12I+#U(:07b>AQT=7)B_(JG+e<M5V2?E(<f[fF4eKY=:(F+.;Td&f\41fZRB;C
P>H7]D96@TDf,DSRc<+PI)+)XM<9LKfRRM\cQQL#7AMgVS6Z,:c).^QO^.4MC_=L
M:B045d/G4(AX90OU3FN04;LEL;BeJ/,HBQ0T=U0O)bb9YL2H;G,Dd69Y&58VK)]
J\3c336FEX-1_N5>1^/=T]=[bC4[]3OIJ?I;68,[^9?_QH8D]JCG>N>T8aaZ5^Hb
d,bDDP_=1g0S(R^F33a,^Q9Ccf7Q&EC;YXaJQ(1A#<3=TXG[RO;D31EKXV0Ac45E
:5,Pa/c>FC@8IWFF/^&7H_JAgL7@55LG_2Me>-bLDg]@O5N>=dHf-c&c#0<&>WGV
g3Q>-9X,TM=f9UT:ffK6Aba.d\[W&+#+VP=084/^OP,aCW]ZI-&WdFT6LYVXg=dI
K8)J,HP8=&D/)cXR]X_aKM(5Y=J-MY=H.3EcOB(gSRSb58bLKZZ.@O04YBJe#gdF
gT_c&;1L801/eJMAWYH#,dS_@AB>_FO\GA.9Q-OQcU@BWV?XU9/PTb=,baIf(ELL
R&33_?7[#FEYgC:g2;WGRO^VFEP3C<VgOBX@?L0:X\<;5]27PB2Y.2QM[K\#gB_C
YMJG3bN8WKW,3B09#AK.a<M([K_.SR54W>e9acM5_-4SbK6IUgM<U0[^OS\2g19G
PYd8UI)OHd?&g)3F#VVPCcJ1&\(\=Dg+@g+ZUWO8dJ_HLD=_1/>e^3[XRD>(J(9<
W@:R6_aEfbP4E^fVI0U4)/ZHG31^1,D-]3;2<UAdK,cD>&K+]^MEUceR]Yb8;J?/
#&I<].NSZ#EaGgJ@R(HJO3SL;QdC?;ISRbWFJ4TT1[&:H?HYeSc&/Z^G]M,SO,Z?
,&^b;RYPP.<RHeOY,WW:N;KLRf)/=&KbE_gD<TK8V.6&,PV[A)@\9)4A[,NJFV#.
+=:dKPOE,P:]Je.>Y[3-8N+T=-WC;DeXZK(S\d-dg?fVY#aG:Kb_g8U.b#HegCTY
,,^;EU.ecNVS+>1,0X@QX3WCER2;2de,G+;J&WCX8)f>AT.Cf\<_RGX82ETX=@&1
,FCR1c8g0^V5FLQKK_b-@F\M<TT=>>N-b8e]eP76+O<3Yf=I+QQc1\^b:,&4MI9=
P5Ec4\O?eK6Z\JfT:]B#O]G++7-f9gXT2<VOIGL(MZ<2/&<EE0,)JNa],VBBP^QH
+?)]6YAB/(RSNTSYcZR8O5:P0KIF]AGZE+?V#8Y\77IKF\K2A(=.6OB/fYa_(I=Y
F0@CC]bM\V@;0LI#:dQ-9TE4MV\g[;b44XEP#)Ra7d9cR/@MIMWWCQ9GY)F#GSR=
0M\9.H&+F<8=VYANHQ]>GBGVXFSI@N1;3ZFQc>D4WSI>>-HIdZ6TXC7g>aZN^QGZ
S.L2Tcf=IPXFd&:;ac6P8:.G9G4/0OEd87HN[6UW5ZTYGe7N4a1@CE[L8U7BgZb]
L8NT9cU+DKB,^=S@K.OXCCX5YXfNG)P]PC;W?fe&DdSHD6YD>GJ04.]N]@W?YdY+
;>H(A0f-J);:XLb8<KNG3SWdF\c?/73-NK-cM17U-/gKETJN,/P#a\0?1@eNWP0Q
TTWDQJJ<Af#KV43WK<fFS(B1RgLDc.a:e0Af57e,9(\/V860ZKB/<EX\\<e#OMaN
39c0BY(8TUb)Rf#Ya0f-?)TH,Md#:-F;?AI4EZ@1#U[1TOPe0_#21^)G8(gI5);2
67-,PKf9ASU,)]B9MKK::=JKSY#G,Z[]WJP&UWC5P^Y7KH@-2D[_9c+4dTXQL.,a
Mg<X6-b8LH;O4J[0#QeRFS64a/FAK+X:D>]EG;D1+Ag;MIURS[@PO8K4)P3@_g#V
9EPAE&F6?.09I_1/?;:W+^HH>)(;GYHfSK&]Y/_SR;MMEITJcEe-IH&/6YDDHKMa
CSbe52=Q3X6g]0L@D#\JV\2-NA&6dB[Fa?ADIgQ367-K(MMO02R#cCZS.3,eO^DO
fLa_WG3?V0\c0O\Zb0Z^7&I42We3W\K)BV:^0CPYBNWPSF2DJ.CJ_&AL,;+H;d[4
-L-3ACRY,?\8[+>?f5P&eT5LcF(PeO@:-)Da[3\A<E@2HB+4Ag^(dSN0S5Y_aE9e
)L=8XN9aHa+46EIdd.eaF[f2AYf@4G3O#1+X3_@OL)aUTYe/X#]bg\\MF5M7B>J>
]-^.LV5:c&TTa0#&NR.^F_DaNXH;QMM^>Z+NYDI_)R[eNRfMId2NVU_2E6,;DLaQ
P4[+L=>D^;DE.ce/M&IER;G&EGBHVGa8+7:J9YdJeU.c-deH82QBEZZB(,e1R9bZ
B=.:c.#6SR^CMF]-8YD2;,+HfUT?ROI,A[)E<WMU;c^L:g(ER>(^;3U4&K:@aScB
0SB]U9:aWWEJ5J3?HDa#CUP\#Ef+S.Q(V#U)J8NP6[(8.PB9NO.,6f818/WDQD77
8O/.\U9D5F@aYL]eJ+AX+U4D1(K6\+\^)dI^\6gdU>Ng_GHME+T?K]XPM(.D_PfC
QKKFH@PgO(67,\=4T[QP2S+V6eFYD?TDHR5S\=&M>.U<7>,K(Wd?ZRAA:G4O3U_W
WN,36>(b&_c5P,@.5V36=TO336eF>INW72g:-&5X9LT2EF@PCTDUNXS=KbgL0H55
R-Ye-=>f&(#;TfMC5=F&UE:[>06HfY,KSG]T1J\3XDI9.>O69f2W]gb-FP+/MRJ9
>QK9Bb0Z91?ZG^=PP3,].fFT<b?MU8)8I&C:H;eK)JNMV@@8RU0fK#7.HDBd>^7E
OKT[9ZK^QH1HFDdL-7K7Y1H&_(WX_WN@?/VdE0W_]\b?,<,0GGEK(MV[IbM(_4<)
CZ2/VT2CdQ.MU<T4fGHD.+9D@5Tc7.Y=+2SE.@V]b6G5(;FK5BFUbJ71&^bXX4/:
g:g>3U@[-]/@+GIT)Sb=S)M<OaV,#MMaY5@P>IRU-PI:8R.OV\Nf?OgKUR(9gYI@
:D:0QKSRTg=39>ed+H/^NR+V,6g9CX_LK9MUG)672\O9O7d7LPQ6\agKMb/@dUJZ
G/Y:/23_H,GHPL__5/4-_QI[?b.,,cS-cKJ9f(Z25@0^Ka3&b.O<\I+=3LH5[96+
Qc@ZPED6H4HV&/A7&+3LX9F8>e@d\4,KLN]>^e8)e,e2J<[O16CWegb\Sa;WO._N
44YMK1(5KIP>e6=C5P7674<YI[0TDO#7(\6b/.:;SNVdCI88B2O=86F_L.+8>(e5
DY&Xb5W=D3&@NYdXb9B7&L\8L::OG/FXSf,]75A+^JYS1^3,-ba>2&>3&UEOB,9J
1fC;=Xb4MI-H+0]-DCg.4BR41O<fQ?FPH[Z.M,8\VEJfE&:_b?DgE\8+X_1?)FJ?
=K+)A(3=_PC/O&#/C^23NFbQU1BM[+eO.>HZ085XLF^/@HCM.0G2#g]97/N?(K/:
@P7D@1XJdP18Z]N_)7/LIXV+GcK/g6Oc)-?ZQ4.,PL5UIM?(c>86KFg5GE7O2&9V
<M2<\3<(,;<c7D1_W2A+/28C[C7cV&f]JVC+;FK=:Y5F-c902b+O2)eM4#W_9b4d
EXWb#0E_\5O1fSgV2;(K>AYd6KaA@#?.]IU5^ID13<:UE][f=M0HMI<-2OKW;WcK
KeEf_/?R1F.V#^f8DUC<^+F,<;)SQWP8(gaHLf>^.]YVGN#f\:;LSLI;XRAR;=]5
6.BPYQdLA2fQACcIaP+21/O=-#</-,+CP5S9>C.5cR,[#VBUX246-([UZ2G3d;TP
PSQ=\UO66N:2,3;#L>g=#.7H\02c7:F6X>IBZ?a,F)65F>Ud#>#-.aJ9#[#Q=YDJ
:O9M#5d-QW_0A&RH>LU_I<b5)HU[U;N>AZ<S:72KB;<E(<Y=0OdM6YZ04-0gV,@(
QN]Z.Ba5C2,T_&G>/BeCJW_/g,#5M(,bgKfC4&LU&./<F)RTG_.(e4?57BS/V3R;
]4B)^KHT8/;)N3KA\^WLbRU(RMfQ<B&R:VMK0;84G#Qa7H\O@?1<bCM756g&7S-1
c&7/7G2Zd0&H[:?+cVHY7KfO_TA99H98L=1SUFT_IAII2^aYEFTD2E6f>?\U>E3@
(NXYG]>3(^GV@&CWH5)_\U22E#Ub/g51AV;LX#d<R[/#__f-5c5Z.,=H=B6>/4E9
(?&4&Z[Xc,a(RT;^&[R5I5.LA0551:g?g+c#G,(\.SDKH.;#C)\@4ZO#Wd&).WHZ
><R9BW-b<D[d^HGSDU5IgW,D.K=+B(-/=BM7>d-=OLN&O_?=)4-8OU1Q<GXF]6IA
.3H_#Y1BYa2YXQb[97.6M)#I0Vc[W<&gGCe8cKD8dgIcA@D05<CY#83:+.)[R7Bf
g-20b2)1/c)R9f#Y^\^bL=_^&MZ\3ga?96f=U[6=T/YBL\:dW,>bHZ=Q#ZUEdQNT
I8GI;^<2@9@@,1=ODZ\eV(M0[e;4<(68W>\]?F;EE7P6eaa3M;,XI8?aGX0@^\4E
Qc]SBXUd&d3I=_4C\g?DVS;TR765?CUFZ5eMG#1PE9G.&d-=XDG=,[;CNXX(HA:F
\H(J,B:KX_,@L<\_FCS&]JNM76[\Ba5f.FM0R8>aV[]9]YaHTcZ-I.Z3TU=20F?-
UU45Q1/)+]?+&eS<7/T(#f=\Sb]?[Y6e\,A&\G_=#2HM=#>QRbBZ3/(>aad>KCLb
89&YJ+39T(Lb@Xad\\<5.+2e=9S_B9@F,HC&5Z.>H185(9bMdg-4?^J/HXC\07F?
[@3I<BN3)ORW6Y_.OM-@T7K6Yf=8Z^a=a2L<VJW:P,HBdR8??G^0a_)[SA_bX2c+
.WId54[SWC?)P2&8a;T.eS)-?57U\[//ZdF#6-]g0de>>XJ2-;e[aIcI#bb.9]5R
+F0@](/OTDL##X6]0OWcdaM;J9ScUA6[X<F>C[5SdNaFdA]LeZ<,(UJc^=R2eNNQ
?2+2US(g_\7]T.JI560ZdE?2QP@aE8fgQBG0S\8[g8?=9F2C(;d;;NgdADJc=-@=
D/9)?H20L:#W;(P,YWfM2&3)CEcU:AJ&3/9fL@VNeU(V01e>+JB5/AZEM>6BW?.>
)WD:;e2.SR391750<5D>K(ccU@d997M9cL1e6I,-_eR@XO5d;-g8P_eBc0GM>\NR
GFMM=RKHYB?D_:TK5RSDY.8;dBFWJ-,XZbXc>4_Xf9Zg=8c>AR=&MK3@FB@R?+da
PfGEX>@4Ka7>/=@J7IH>J]d;1D7,F+)KY0:.G6.:[=S:egYNgW:TKUV-,^AJbXO1
C=cYW.^F<[4#K^f=0=J@X_M#7.=^@9[]&55D3^5;#H)g.QF46f;&+.a6d<?RAgaK
b_:0_C8?KV/6fQb>0Af3MIN1J>g@0.;07G2AQC(6@F38e2A^#C<:?5:RHAC:C7]F
YP;V5:.9ULXVJ&L1:-;:GOL#?A,fg(b\\<]/^:SBNcG?UOQP<XM(;.3?=D2M][3Z
USV5<W[8O])&1S)R5@IFAMdfDURa1R127+WO\Ag:N1ONHYcKOU=OXXgD40A9_-?0
5=OR>^d/#Me:8@K^MR;#6YD(_]7,;f?,,WT^3?.BQ(Q,cF,EGA7G>EI>]--P1c]9
/Fd)9A4]B_\c-be#POFFQfD#0,IMG7IIg08E0XeU5DTES=TFF;ZEGEf/?E)FHI[0
)@)fI.1gXV4GGOV6@R]7X8C39:8J]<WMb@2FgPBV/2:?Ta__RNKX;,W6Agf[T5<J
dY?&L5gaO1cT/+/>E2.Yf9d2<)58:]U;SWE_25M@D)N9;6A0?0IW3J)CGKB?M@Ff
TG@c&eeV\UC8N#6XeVZTG:@RUgBPf>/>(3fH4WGYMJYRc0=#46/1@X;-?,,^4K&M
Bd+/@=HJfMI&\_Z^A5_eadQUOIU^0T9/[a6Bga243-RFL#-D7CL[Td+;BMF0#_a,
0PebB59=CP:N:0Y8P@N//fD(H.Y]G#\P9(&H;+RB2bL0^4M/LL?2-;d4f+[=T_RK
=e=M0[fcPK7PWG&@7[K;K51W[4R)I\?0#fU[OIGffHDf>CBP?GK#g_#bfWBWb8_(
BD9PHMd7bSP.,.+FS;G&E6N417GJB:^[LB&^C9GI0^c?-]JIK_UJ>5/CK)Y3X4b4
@3QSROV8D11@aEAfHER(>?9_;(U&D#V)Y,SdJWS@P\cQC=(aS7BKZPdb3B9aQ8[0
3[CSVLNXS>e8F;?UI4<U]FO\aaU:AMY5ba8Z;c#B2#G9f08+_YFd,S@_\T9RP-ZC
[g^JNfM-N:)+(P(X838a:P(L95DF8dXW)K&-]A_CZ21\-B[Ce9OOOK@+a_c-eOX>
Jb2TeJ@\C7?IK\DQ7Cf5_-&TL6AA??;,<#9E71+K.MZf)a],4eU1b]I7L<B-?1]A
LGU3FW_+N.:^,L<I\+IZ.fD_#8.;3-1A#CZf-fMZBH5/40=GNdWA(\K^2#eRe<d5
></eA#A-=aI=F);C+1RMg=8H,/FB^g,+=A[b._>S;_bR_beEQfb([.9.)G:L,H>/
2,X:#aCa8T>:K[gU1LQ4@PZ/+@\Kbad3^36P5?=b5X0;IEK;J9+Lf[KVW85C;17(
<W/G=NF(6eQKBR^aCOe&(;^B8f#T6+7\0HOQ0N26IdZP556YAY@[O_GXUJI3#HO\
2Vg?W6-JWWXab363_OO/7c;(dS5RJ-6>O?(UK18V<5(^HVeSWQ,+^CFSKAe^72#d
:g:Ve7Dc-aV>93_>:B[(T#9#.;/F:]HY+&.3,be,V;X^S;<QFE2RBU<LH2d_@6,8
5<gZ/19CE1BYa^EC]Z9;7&6AT3;+B.;T>/Y1SWF^/3.N4I+K2O=+QCZcI(7dBX\;
H([c;BAcSIg6D/EL2c2+4;N]/&RdJ@a15@^Z+]6g/&fX)J)\<e.W3&[<Ad+a777T
V^/Id#;I;W#7gdN[(<JWIM^F<3^=&12b;G(61gZ&G<:-]O);A\c_g\I4^gWI10V4
S.?7?S#ZJHP111?I28^1Y4Ha1L1JI:J.\DB:WVd,+1FcZ71CP7FZRT1&(=QKL372
_LeP?=>fVD5dGO&4I3.E]+=L75.1_X_\Bg:XU1(US>Ug/&<^W[TcZ(#0cK]]g^f\
Hf4c/UC7LSbW4>7R#;9TO0Z2#4/eVRD#.2Sa-[+<-.QG^1ZV;+WNgfcWf21<1<Q0
aGgP1;Bf(?N?e14cH2@<UgcVa>R+.eRX6\8H6QQK18EC=-^-fG,g&c=DRH3T19c:
eg6gYF=Q/Ue^bX=@#e#S4I6&OCA8<V4#W1=B<Ne;-.J?H]\OT\CYL3c.JI6LGVPO
8OW6GJd0IP?L0C/AZKEf90SWA&\ZAX<LD]TD2H8g(+bTUbDV54LZZ^WWb4IE\I_]
7>g5(0@MZ<M:DfG6/6g&-?S6(/)\aJK^<EFH-X#g?_,>5/DecFA,f15U_#]-DD?[
\A1g.L4@(+M1^d@TeX9=5fbM,^[?)Q@UfeN7NL_PeQE,AVL9KCbA@,ZTMVLF12^9
QPdR_)8;66ARg=Y-8XRY?g.?0ZcF;23660S<4H<?Q.U=_\e_JTRdd4ZWb1--@VS#
Ve:71ROQKWY/><HX@>g_Of6dK5+\ZM@HF[S.Fc&b7A1A&8aOBU3e<#X>4V]ORd\<
;K@fd.)Rb+B7^)NZd>VM_BMBKBE_A8-Y^5A/3F:[\F/O\GCQ+#dY_?0F\a=b9b7U
0&@;g3F3JD_7f?d3Sa+GSOO4_cHC/-\OcT/(eMF@>]TTLVcXJRH^Y(Q_A2:Cg(]@
;c.IWX4WA4RSR>4VfCVc:=9==QMTS,#F^QW[RROR@bF3P?f]E93(D1C9)I51J=Z)
WHP0V/;Z1c>K17<366.--^Z,eRQJ?gP3[Db2G:a//U:(28^>K]A>3Q3TKK-F8M#=
dCZ9#d+25fB(b6&M4E4DTf[S(X2;\g(G#4>^/VVb@7fVPT94)ZZK/=DK_N-2F:g5
WZR,H[I_TE@e>#XL1YUT\.edc#1dQAebXG(Z8GF3)7VO7O_Q3)>1U&T:^UK_K9DR
S=cB]>J.8Y-Y,,9f6I_cXaHXSeTRLH5T#?^XCgAg5K+-+YJC>NdZ@Pe4.RU;cO4:
_4Ye#TX#58P-C9CfbaGJ>YQEL>P=aUMb0(>A_ZbK5FBeG0TeQK:^fPO#1<Ee>4&b
<Se;20#/#MI_9\JaY0S)>>Y]K8_M>:H_M;VZ(a#NAgb\=C<WWLg/C[;6UgT@b[:S
EZWf\;POEE5^;:I[7^UU^#/,c_C[fJ6.ScVbIMZCU\3fHOU1\Y6)LOb65V&\TIOe
]?>d6,TXaJT9RY)^YI88_[aMKAHbTL&PBY[AWdYFbBH6f/GSFQ0RX+2d>+5/JZL@
8DZcMQMC15+&4M.XNQ9BagDT?/:XWX+F)@V4_bK^M2/<XJB+Ge7Tb4C>[C@cV(MN
XLZH2F0^#XZ2AMd-A>#6eT??5[@_[XJ65FK0W5e=W,2ed4CM:LU#8UDC@;N15UD,
+TUDL)7[UR558;J2Se]g_5_E8LZaYfPHc&9D@[5/[e7E[L9>cC+dN<<XLFA9DIF)
Q<D.&^<A55QGN&#[OIO&JfLc_,eJI9X94\0UYKZ]W?6]_,aHLcE&3Q(X;eONBHC(
81K\Qg)/(W>)F8S(W5\I<9_DDBf^Qe=ZTR.9JcWR]ggZeW(MI9/97YJdbM\CPg94
06A9M[76-;CP^P:PE-=P8CW?6B5S?Ie+2FM]<gQKU,>PSA-)C:NVKBRC-<eP_e41
:c>Z)NX-eC.U=;,9TDVQ(@)6(_<_=R+^-1]4@T2PO><]5H13cbY9@@a3&B?(^.RL
DRDe36[CeQ,e)<\+X53(=M[WR>.IKL^f]53>c>\:OZ<3b1J?_P6G\eeE>XR&&KVc
9d)\4M]bd=XR&6VEIV-,,fLR:/9c1N@([RGgQ\UU=d8-2K-YU>WJ&gFW/72432N+
J5-T6+e/J(Z,8VX2>:@P#BTJS-ZG,?IB#S)>Z4g_A:TNTDS<3.DG3HK9aIa/L93=
CBC0;7:bEQ&JAU0\;:M;@.IM97a0^Q9<]@1J#R2ORO6ZM-_KNQO[N,GX=TI_1[4/
></7]6?J;N..c8)GLbSGZ_<gXS-+egV0g0FXQ+fJ35?HE?#,gTB^+D-P?@f3,_/M
7TOUcX^?E6aRD<9GeRDH^dZ=]N2=::7C&,P,c\\+Y/17RFB,U-Q^BbWY9-)=&VLE
90IGZS[?Y9O4-eY:Y;S7K.FH&N:5N3H3/)J5:N;\_7-;D8_-:<=#Pb?K4SQ[A>.@
+H]@NZa90DP7IV3d/_PO.+Y.GNfLfTbZD9B(HKUN9-<&d>#ZbEE/OMQ@e2GM>+d;
T.D@U)W2^c>LX9b.<@O=gE=]_Ye=4K:bc25XMUb1B,=GFgVQFH\.VN4;D6A2^XIE
D=\?V>GY&:GQBBPK&<=P+d.)c#OZCEZ:RN>W=(H<aZA/#YK_H[5>[aKO28e5IHZG
VD3_Pf3<2A#I(<3EX@Ya8R&G&5aEDf>2)]N@96K/G5J/eI(8@>_7NOJf8M4<;+f>
^T8PS7[_?PIc.E?R^ge+D3^BF2\E/GSJ7Y?gc:J=.J(d\Vc\-((f[8UC8BJ\J]AG
/F-/g.?Ld^<Rg5-0^\Ja-\^Z91EB\M3FS[DMf;FSc08[)TCKe>Xe-=Hf4:T5+Xe8
cQP,M9BX=0g_fBXILXa_,^9+KN]g7#<WDe\PHAZEBW^.@@&V(5\M0:IO@aD5ZdL<
/UfFD2OF&/@;A=\Y\KWMMC5HAe)_;,W.\6U7UP4S4:&56J7)[+?SA8@&;O,@)P#Q
VP)HX&3g7#)-:?0eYc-)aI</dd[VAU5/-O+=XcE2DBTC#+g+5X-W0T^,CON\T_RW
YZ6DVQLM]D-5agWVVDXT6RO.eD18UH<M>^8WVfZ\)^@#JP.@4#0f5\<?5D,DW@K_
7LM=Q/=VD[H5]:PNba1c?90#B4Ke\/.CNQL^HL)[764>e;,P2>]8]WST6U&D7P4D
Y\fAU-H]^Ya5#26(?:]GH1PK877460]Lb31>)G.>UBAaR7F??ef),B<8HH2-T<B;
PV?2(LML-F8Q<&E4f8cecX8XC@1M7:>:^Lc4>A2?\KF-bIHX1G+0HXM4JFD(F4(a
fV&5g+2>Z=_G9A64>;.N^_4OR-_LdMX>K&C/;91N4TLIBDf^9)R9X?>4M.GB;:Y<
PWeJ-PW1:4>]9R+>C1:bEIcM3GbFDd,K:A.S&LIL+@UEO3T4QJ^@DU4>G+1B]<K1
J@?@)<UP9R]Q&WL>?Y\(-:Z;BF)+7(ZYfJ^JT->ZCca57:WL4N4V-N7;d_6.KC\3
FXGKX\O5TJJ8aWT,e3F);U4?4FJaG;@<Y[?6B11/VV;JVB-619gD@.1;]931Y0Z1
8X)Bb?9bA[-b&eCY,0,X?cU(VH==BLeg_CM7ACCT=d-LMX.3O&:+7/X?P(XK55,5
5I(^=2R^^V&.([eF]_E.T_)?OQf,V\7.\>G_+<8#.NPDKW.gFF:K@aOT3FC0P#,8
AbTD5PV-KL\^69T\SWX_Tb/?,<8F@_,BE?Q#^D5FV-023cN\@.>Q[/>2YUgc_LCc
TUW1g8GP/,e\\O<JbANbS93-?LW>&5UfA>W7Z+SZ,K(T9f/g:(/\J1916KPB,+QD
FJ4I._=WICG?#BB[7<g@>8;Zbd3)-J5XK5@@I[.(#LV<G#=[P&?GHRP3&=_T/Td4
2I6W1WCg5725K78#HH^I0e([#TN@.DHeCX;R7@^CAAgP__]D9^<_KNZe,-aXNN=&
ZPIH_WQcXF+.\BVYUWM\]Vb6P:]38GNS&&F@RTReA,e0:^EaT9&EZ_NPQ(NQaFSK
1+Ue&Q9b0HF_SZ[>Lb1c,TNG)10.YbJV+Ef&4)S>82J4;-bR.F>G;UDaZf1V;D.9
3[3DfbETDZMC);6Ug_(=D/PfA8^RJ9GBM@[AH)DM+?]M-]\4[;g:Dd_]b])2N#SY
[.N]I)P.=6/ad6RM=N?I(N/ec^TE6D>[a2Z3+C<WVc#96+MUM=#cCIb++S:\\ORN
YKfCS8@IFU5=;=Z\UU:P4)2VC9YAGC2Y9;[5.7KRd.^;-fLAeQc6GY,K:cFg3<a<
EdE=aaJPE)W-+?eE.8bQU44[7/NfW/g[<XQgHQR&c-U;39X3L=-\R)-3eJ+JTBQG
]Q_1/G<24eCa4g-=^(F?Z7W4d_,MFLgC^be0>Sa9_aLDO#G;UcKfgY3ES=1(g]cE
>G3__-KJT>7IZ<.++7I.)?PfGPgbG[G@0d]d@/02@>;YMX+-dW-,QTTdJ,Y_))T]
OFHG#85UZCPA1eA3@ba1Q9.9O;b2:I0O4(/=[gbRLHRW&K6?fN6TT)[EV=9B/bIO
]eNV4M4Z+,bK4X?a=TTT<)Y1)[[b7+J+IKS8NcERSKb5K=fZHN+K#UYSDAWd5N;#
OMT-U=HCSdF,AY?]VG-)9/ZDag7>B:-b1F9a#]d-M;8a]NTfV4)R=VF9-#(VS/TH
G=:1R.#M_7GQZgGPMbH7.V[bMegF)ERA_+EN/.N806X4U)[<J5>4Nd#fN1b./PU]
RLbU3b^bbg]6;_25;ETW&[>,TLEI9S(BTQ[f?Zab8_VP;K_2B(=M9FYU:Y0>ARL1
dHdedP^BFF8--O3IHcL/Ob7+1>7K^R4_(a9F:WSc#Q2afL>gY?&eeCU_Eg2,P/E.
KM5RFc-?&#PH>0:YYGb4]Z8?UC@V5(_H+b&E@KMMa5Z=b#?=9?,=P4TDa;[],KRV
X;6LB&2IB<f3S4a3M&\XcB9RBZQRXV=:DGgU88BG2DG-P5J>W-b-ZODVO;D>-6eL
+,H>V8NW@I2/JHYWL<C=?S&U?\_+T7H,_aK/BHITZVHQ5F0]F7BB:TV?9E;g\c9@
JH,6gcL3FKN?cIY(XYZd-S,dHXF-Ja8[:KM,8eF_]8?;c4<)c,JW&>-PK-L^6T,C
G]68DG2YQ=Z&B.,&Z\A=&-4ReS^QO#QgNWD)0[TcV7I;2a76;944B@Ia3aRb.O=(
-Z54?&GBSB\:W9EX1&U4b/-WL?(YZZ(FH0agH1<.7+1GQ^bedVTA_V9[gd90E&gc
ITPE(5[L]:Na9e>\&6.R5fcT3QIJPY0=/DM;-X;AZ;83OF<SGSbf7FA?6<B6W___
<Q_dF-52(fJ,OWEaXeH40><e;]5SVa\G4EfSaDP#J@E&9;eGQf+b+)bK0e5#U5JX
d@c&g&SN(?WDU)]5I>34&1+9I]b,W4XgDT&]YO8@,KKK+:V3,3(eNA<YYO4U6/c,
FIFOL:5J4(YTgf6CQ(CT0Z5ARagD-)fJ#5.#,^_f<EK?EH;fRH,(g[BW(<9@T1&:
\XD#0]a2Eea+NTS=XYT)H\ONDL2E(d/@I?-X2[N)V-a(R(;X;>/e.,T2>AD1>9SH
a.B]^\6T(@9:XBX0T=a(g-BP)M7B/Mg=@7W]OMZ6D&N)-#SHH]g<(eKK?LLIR-W?
a4BU^TJ56>TEFa?\H5TP)bCB]1[&WB(bb,NOU)O4<;?J2c>I0#(b:faD?#8=P;B[
7R[U/N\3R@b#DeY?6(CX4H5/3b>5c5_4I_=#U66B/K>c@@,7O7)33CFK?L=Bf)-)
H3Y\VB@)5afY<:[Yg7I);8Q\WDY2YZ8e.5BOg<O<2\C+EB3.6dDPCcM-UgN8.S7;
ad1:39MJ3W@=F>-)-aKG.M5Ad63006BD0[<M,+.JDg0/MZHaGR1ET1S(R09O@ge8
OUf?U+.M,gM11IZ&90SCHS03=B(a\DdC-LK99+g(<68)EWaGg489&g0e-1NAM;93
)d5<<OOFF(?.ENFWKO3d23<-D?Df#Gg(PE(,#[?P13Fd+M\[:K^(E04SF@N71,)D
;Ge82HYB#P_&/#SI2RN.1\Bf).1Xc7F,0X[\6.CKL=87H>?V.Z1S&+^\+efH-,@P
BQ5:@&66dR)/^<8-;&=PYK4IJ)JF\]:^\)G49LP(49>ZOHYZ:X,1W9U;5&XK>9P1
DeIJ:BILD9<QeJX<1W7^1ECNc4N(cZKS[(13?dL6EOFIg8eIT,_Z=3NOS?]]O29V
IN#=9gP6)F#BSZ=@OCNT0E99O+M?YYB_+0C:.fPVUPE,XB^KBc7I,XMAXS,^PT?U
C2F=IKa3DE:0^JAf)42)RIM]A8<Ag6;6;H,5gANHg.QF>L7.S8BAR-O)W;Jc;K46
(7Eg=DcSSJ?#8;>U)FRd17?]K7Cf2GS9I,f@-)37DITO,/g7&DR\3E8a-P?OM(&Z
8M4T&0E5B3AQSTQeLIXP?88RdW^#K+S>faQ4&9]]b,MN.>Qd^75@3D9[=1@JQ-W\
4A=beA,;<46V_/?ZP>\cNPeQ\N^+VY4edgR2+\MceBJ^gRTO=<TYRN_NZb>M([-9
,dc[Uc/V(WQV.GR6Tg7BNKZR_b=)LBG[-Q9.&UE@48\J[FV78P^2BG_NK$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
