
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
\NI[.?+?4E4V_:L75BK[&4SM=,fd#b8YbdFG11LX_&f;6I(\0(5Z4(O6Y5&Y#(4C
W0ZJUU)(&f,02c+N7J+,@#;H.;,KND7>-d1IT^E4^TccLA/d;I(PH_8gRGY89V5U
;W][Sf-<>[bTX+[Oa6X;9-N\\0N4CcaZ4UAg2(2[Z.JVUD[0),K8MX6>?F(/SLRS
3+KeU1dOQ_QY]+^AZ.7BbJ#P<]I1OXVfBH0,#M=P<?1E_<geW1/=C9+]QNgFgZFe
G#LO3@B0Ad03c)Z?SS=5K@)=KS2IA9KZc2:+DDd36PA]#Tg_S2X(D[#_#eX6U^2O
9YGX.&(V<ROKWCVIGf;U,TdZ+R/Dc>?7IB>c&;Q?G<&C?GC=A6C(eT-/+N942=f5
?5W,^W.acEY[e5?>=3OOB_ZTa5).B]XH9ZD[;cX:/.^-E3?K?2B/[<-/;N-M#R&c
V]fO.XJD?S6_Z37X1.X0Pa9R>RGM6:G)e\,N0/.c/ddM_HHQIeOe6ZeL0OCg+QDS
?^;fKX6f-,?(dO5_-/7H9E4ZX7.APJ]>U3E:;PU.=,9VTFTY<eM4c/:T04635F/L
]1YZ^a5,ULL(^WNKA6L:TI0aZ<9gD5L=ZAC]Jf7JW1E_?9K>N3bSS-V.6F&f)66+
4GHa6.ZU+MN;f58_7RcJ;CV^0&GGPK;U@[M=K[H-b6]D=5R]M(VX0QO)FZgc+#LN
C\<W(WdP88^VYEeKaWGU&WQa/0.\^CILBfaCR#[bD3(AM33\=Y7;P@PCOZYOH=<.
ADMVIHZ-aeC#1ab34d<@c:H1ZBNT(/Dd<LY/)C/6#3(ML+92cDL=e74_aP51OP0d
,T+PF+IJA#2W/:eJGC]/3\P##bfH&#5eM]?U3eC(U,5C0FSZNQ<cE4V4(6-Z7:JX
8f1:?&2\J<5C7Q[SBM)dA55G(U]2C>9cJ_RZ?7VXgfJ+(:4NQ)\97#_+/OIU;S#a
6>4J27d<YR;f8X>:Z>9HfE6W<=b.\IAVC2AT_EWJDIW0/STW(HE/.@FJ\#6a7LTV
.)Y_PYH_<IOBBACUF3c@#U.-P;0Y^G.T+5]UK7/H=^Y_[;PMPZX^EV67M,>A>X0K
OZK0aT#8GPV1LZB;E]QJPgINd=RJ063/?5RSZ3I_QcI<Q?SaJM7DaCN[HO45CDcJ
TOPRQ,E([Kb3(JbG/YO6YF;<2RO1J+DW^WKL6d8U>:a8/X:eb)49A&[\cF>UJ])g
Z-L_cZb=c(/dR725c0B&^</bAKLVVPc<12-LaGM9da92(9bLWE_O_W9B4[^=J_A1
8@\Kbc+]7(_;&Ef6#>8E9ef>6U^]86aeJMfU:]/\J^DMc:[G<(#d0^c;E\_[6A0@
XSM)A<RRF7M+X2G=W8Gf2g3L7+DH[@A[8&DY^A4&6-[D9JbB3)EQOXC:QW\7P+MG
Dc.(DU^/9Lc<K>aR#L#>S#@cI^;HQ//&V:RBcEf)RVKJFX0J&?_]NTHQ;Q\)./=)
]O<6?3=Q23J5GZI\C]C?b2=[EKV1C?#S0)geVTMEZ\&cdf;4)43@FfPVP#a1=DIa
/X;5f9,LO=Q2SRHVQ184;E8\P2cY0FA>36BX6;GYDCb9@S@e-ZKH1SM^b3L5:#2Q
=:JOd.HQA&,gWZP;E:ZKK6LZP#bU4(-EFO6aYJ_[P/_G,#>f[01,fcXf7XM3QM0I
-72+((gNYT-#.\SgZZ4fZP-8<FTBQ?6Ud#YDd[B??CJ4:ee,LC]0D_M<B1GN7YGN
,TX0S5?L29,/@P?,:&F\>[PL.g=;P1fgAG(KOKB29_fW&>&9BGH?W<.6R=9=M;+/
QS@K&T0=Pe4GQc4-.)>OM))BSG^UTGcWbZ27XD[>BH[1J6:_VdZTX)@@@GOQ]#N2
G.>SI_aS\F([-Lb4IHX)VJFQ5D<-RKV-(^Q>)JG;4SZE/)/gYc)eMN4>geD3\I_,
3adfab&=f8[5RPT_@8JJ\:FNN35f=)Tf4?]f;3Z1.L4bY@GJVBWJ?5dI:,&Q0Z>b
b\bP5eV-eI67L\c^e)Z0/R;cg14.(=&U,),8<>0]^AZP(3E]c-[=age@D5Ae?f,\
O=4UYCZ]URPIGUKHf1Q#_,88B+WdUO6a#a/@U\)7(6_g8\aU0/\CQHJ=??fVC=D/
,<)O+d2&Aa[ZD<c#e@1I6W7S@gacB.3N]DS^@B#\R(_X>SOY8^A+#>>>5,R_44>a
?.8Hf;=gN(M=TP<4Z7\bQ^W^4]EDcGdL<c,K:8#DDDDI4SKbF=[G;Q;30g(:<I/K
?2DM=2SG#IW]V_1E2<(O5[8f2eX=M;D-#1?F6NBH?g&I;W<1[BHb<7M^g[ZUY.Kd
11IKd&=B-2RS36XDV[A].gW-gQ=1=R;F2M5G9IYR.d-[5<&PaW.PSAH<g8BEa0V;
5=D2I;S:^c=I14Ig8b.9?6(TfOJTFdO7J<A4N_6Le5aG0>,+b0>&/FR8L9=B366c
)G_K/O7K5d[5([)P.2YQL^+]R+_Zd:9?Q,c<X1D57-:c8AUX_C&EWTf@IA7?d0+g
/6ZO=Eg.PAA[DWeaUfC/5N;0F71Nd^1T^Q_7_2Q30OKCCdX2H7J/MG>K87I@?Z/Y
9J_)@dDF\QQJHIfB+WN&9QJD\/HV(gRWd5).dH1=T_-V]Z),;+1+=f_&.JV+]9X[
N9I,Q\)4+7bMRWM@Y@/4(SI9O=?:>R/O;_W3(C3+fc>P2Jgd@Y_MeCC+P,D6(Kea
MQ]V&0I:TMe[UbC:=(JXeE>EH57IX>L-M;1@RJ@\OO].,QW3H3Y5,>&)VDR^X_XI
F#RG(T4b:+QKYe\d7/S;K]ROIfd[/9/8ef)#S.UP/GC?RCZ=V</_5Z0V/\S_@P/W
FbX5)d@M\LN3@F4W5R#^=+YH.:D(,RJ;BUO\2I_8QLLTSTP(GS<.W+Y9[1D:R3gU
WN[3X.8C;+UNe::bd-\20D=9cAS[f5]RQQ9MO>cFZ71.=^&.)DTQJ\8\aEM)JLR-
JCF.FbJ4+ef5a&PXJ-4+CE-:G\PU0UC:5_gI07/?W)HT23[6B-D(4,\DF6@S=\QQ
N5([f]U)2AR;)@,U0\dH<cQ^T,)S-777+fdHNOWMFF9WK]3Y:ID2F=BF(VLO9D8&
EO+A:X0\SG3G1;<R3)HadLC:.BXV?b2>3@d[G6=<Pd[S1:Gd_=)CHTCR/RG2;Y#g
cUeDQebY8AKU&g:A1_a73R7IfDTD;fa^@[@a.UaQ7VM[:&:&T,WJI?734gTQcRNE
__-#/eTGWAgLGg:QD)Sf0BAdP29#+909^FO_WWB_R7?TIPEgF:g3VH@1I5PNJ_US
(04c_PZ((I1#H92S&/f&@&I\#I@5Z&7eWN#HNBZQ]ff-V;#:Ya(T9WNT+7IAAPFJ
fMJ)3K7MT5f+.T(W&9d<TM/Y\5S\PD_FdM1eM#fE,(eMW4OP]\?MB^^>GSY?aI.=
J:]0?eHWVd/SLY6Dcb-d9PD1BA2Z0IZB:<^c.d@2QdODCD@R7E.g@>9UHJ_1N1V3
LYK3QT7?Z=/Va.L2A.#-2Q\:W-E4a:O4,Y;1[5WJZ]HRLEY(]2#e_aGUIU;Z]TM[
HF/@[#8-g]D:9QCB&b&BV[VgY<P@8U0TWHe_2UG)cZS2XTBP89e^;13.\?M@bdM.
MQ/LF(<+YB-W5A+NK=b_c1D(QO#I08_T>?Y_SNFf2J0R\QTa//eMD,6OMeYO1UK6
=GI]e1#[VM5B(Q]XKKWP+Kc_NT+&2[-&_3U>Ld,4I;a<:,9R/aZ4b:0#0Ue6?+G4
1;C9de69E>NW:R?,VD4NPHK#&[+(&IZ[GaKT^b._C9?V@;^E/:;N3=/Dg/e\McbP
6MCXJE+?IN;Kg;7&PH@004+4X#7WD,N\\3\?]2fTa06XJ;DM06XUW1\]OW=WMb@>
HfHXWY.;>]D23Q=db0>^fbXg\9_B85YgZY7FK2MN7+J=c+X+#\fML>Y01Z6Z_f\0
b[A4\dR)8Y4dPJ6LAL1D&AB^6R]DV.78>V7@>BX_?7\GA/@B@7<>&#&Xd1I8<A8^
,5U5?I2S##TQY]\9Z)@8NIHC:/[GHfc#b-@,eFWV4U=1Wf6[C9IKTdLU\3.U/Tb_
85Xd>^2K/Rf/b1[#Kb+@T\P&a@GR_AdF>A-/JDHf?1XM3H5a-;M+;7Ufaa#::FG<
d&O19-^e]e1Z;H1(YB;9+P##SP;>f_gB1H;=[S;3V^F:M81cf6eK_K5dE1P\d<Z^
c;(IMJ>SRPX+_:Q__4,=TOC,R1]84:.C+eNda&VK4K\1/OAHX_O37^eTYOOEQXHC
g5JLa/@=+(EYZZKFLC^?D^)WEUQTNJZ1/-M_:K?_a#M6^dcFbd_7DPE]fYE;]Va(
<:a;LQKOLA<_\aa]6WG.Dc+Q=/POe/G(#X[^1,NOJA^D6,a;3a3NSHcaLN7aT.;3
Y@9N]?<2b(H[GN\??N<D@bFZI5fG6UfdK(:)(D=(/)@MTdV@M+0Z;T<,H#Q[&QWQ
bLX;.,(96eKEH;fS2P0^)\9VEWX1/X&5YM(>J8SO081@[Z]&?@62?<2^B=E.8Q/;
?Ab7TgDb<GS_Q(d8E6]6AWB9IgWBB<EJ#?4>L0+)E.Z?\@<W,fY>?RQ7^^0++/<f
/:LQd91<IOU@dSX-<=EHQ?B96$
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
;g)P5NRK79A-UW5Q+H7+dNDeA)T;ZRQaF#]ccP].5+DY4XW>>?ed))cXEXAgKZgC
J5]9X&>U#Q/<AO_Fc=S?E<;)Oc:7aJ(<IWO27&GY2TKHaeX_.VXYd_b_?5TDRPH.
UT?ZC9Sc&e?QQHJ5^:E1Yc(^;H+9L+RHT^CLb5dRgB^6;fT,YASFVQSONQ:/?7WZ
K.,\_GID5GRS-[.ZDK9+)UGN,I4/62M.L\d+Jb^Y?Q?^T/0Ya0:?YGcU@09:fGcd
-+60JMeMB=IQWL?cJJM[c(C,M)B=g:aR@<5bc2C(\P/#fFK=HNQ?[H-+fL9_/[7V
I-UZHS0HagBTb3a#JR:.T:2+TBg6.0d&0OVLU#VAcRA21G[9SS(\)Z]2g.;E&=+_
WD=bR7YVRAZ(8NH(_>C?^eO8S#UXfR491gQ?Kf0W7@X2F$
`endprotected


//vcs_lic_vip_protect
`protected
C,IFe,L,b?]L7]0Aeb3[M7MUAUNa08T[P(D5]g64fBc3O)Xa8P=[1(SE&6NO0)\5
&36#WgA0<-&U]04L-(U;C^-_L=RBM\#BLe4XG6UcI\;1UT^01FW=8@<bb2c0?X>C
_;e<<^Hf/2d4QN)Z:(K/\WcP23f_-bZ<?@[,S9>XISUCH6bPP/VT:2_.EAVC84Ia
F)SL6=Q2NH+Zd,;NO&YY&IUWf3SN&]&>IeJ,+Tb]<<P]TQN7+Ifd3e<DC9Y,NNMD
WF?ZOd(A(9I@)[KWC^)J[Ucb,e#9RdA.0(cH)+Y_K&KYEIF7,JYQaS58D)=TUB27
L)CES]1EaY\a592K0KD-1cS;aA3O>W6(d6e7^?YTU/)&GNX:gdAC3b5^O=7OBOK/
_=CI);f+/0Q.Y.R]RTYZ]=Xa6_OQEB&JJD/YT)f[G@a[@Q/ZAPAM92QXPW,@8bC)
C)E]F)9B@G&@(H(6PFH,39\FY4T_M6_PcTP:E+<W<15-KdENFTb96#Y7:f>8(P@B
=Z_-ZC=G[@M]A=57,N9GHZ721Z>2@RdQKNEeP&1?Ha3E2f4M\6LM3W1)P8VW?Dgd
dUT]B?MP94MLV]#.^Jg#gZJC18A:f>E[ZD47V@f7(.Y6cf,YCH\9ZOSJ_@]N_JGM
R#[OFe+TL\9P<L)2FHE?9d3_=00c9G_+P=<0+eBO35^7,-E>FIHNSC_PONcS;bOG
G/7,WFM93cXa/E_2O3Jc#EP\7B,TE4@\cR9=1BG+(X@)g9/g8T=XZ[Q4\fWQU9g.
/F9b+]9Ng^B=WX)W-JA+I]9>OaA#f?V^XccZZWXGR.fNB+Oag2QN:(f1@Mcf235G
ZO,28K?0];L19]SL(BY\B[.F,W4EXOP2WU&Xe7[VL0KT]K?#;D:ZLbJXPe:E\([6
#95S18E#4Zb\ETI9^^1VA#+QaBLY_Ob^)/-N\.ODOFZ<8E\TZK\H)INPI3JQaA&V
//_2PA&OE-@d2C2R#egIEeZ7)[^A\#0N&[,5V^/4aabOD3S34F+L_M/352b9[,_>
>.\#bfYZMWFUde6MY0_O3<\I#F]eR:7K5B[V\TOO,E8PNST()1N]\;0VWK46((7B
VKZY^<eQ,g+V2>W)QB7&D8UIKYT#&@-e&IO2M(MgFad_f[F;/B8QLd&c<+BHB0T=
)F(McAF]5S&Q>eA\?\,D#A4/YTP.5^/HA7IPd-YOG#[[&<,==N+ef3Le/YNP6&C<
G.>=F9_#DWR-^-I-4(P2.\05CK;2;CVgB)cRRY2Z&&(b=A;KLC9f)_@fG@,B:V^:
I=f,,Y4c@BZDPcA(D5,W1=gYXO4:U\EA:\G]B+]1A::;)&(Q&/,_Ta16Y:;>)L(?
\P[7cSIdA3PTL8<#UcDG8+d\IO5<Ac@/<g7eYP1DfFM(2KfYfCCFR^bcaT&)GR>b
W?&bT5E_b>3CS\7HNMUT<#KAYL/ETaXK31P1)=LV<2b6<@#@2;DZG8YWDcbJ;N5e
>N4)7(6WKMG<WB#U9I?b)@C8W0e@<&f1IPe7ZO6AGA.=-L3RE(Fg[a8TZ?aS0PU2
2M:@\AFIFDBOH2NDH^^&)RO(V616U(]\JVX;?>2)-]GL;;B+Z7QL+BWeM.ZbX^L?
7M7<c#K]aI9@TOW3B847-#<S9CNa-))Kgb(^21@YWCB2IZf+C@BKOPd_96E;KDD0
afFTL\C+PX_C-;I<+F;?G[C(@gb21:U+5M4;-ab^;3c(UDKHZ\J:/3N#:7-e7XZL
@>>2QNd)Xf^:;5-T?&KfX(E>,W80a:K<DeX\ILX:>cT<VYDRbLeOAB@.1M<WL)TT
V6<8_A,IeS7-WKad4eb,fZS6##4fa\He7R0dEXQSaZ)2g#,U;G3C1.CG]U)AT-81
_0&DE4793gdAf5c?V\<AKB,?bW6WRA::GITLf],4ISEH?XYc/)6cfd:>:\NRCZ5O
2]dR=P_R#U4V)_KN2EXOS&SF-Tfe:P]cUJQdIFZdS,KUI^?I8ICU[a:O\QV-5X?\
&>8]@G]+Ce_c1YNZ#[P=LZJ\fdcSaZ9Z4ZMMJg]-g+)YXEY1Q-^2IIf&#KL41ZdF
O#@^Z-,8ZV\T+N(XHa-[;G+,SAHK7K@.#LY>4W4:VX1OQGO@ff<eZ\W/&ZR2YVR,
O2CgQ-?CBE.A7KLFbc5U[HH5Q/TSagN+6a4\_a>0Q/WCdZ-/f.a2]/Bf+d>W@2IN
8<T^VOQGcNI:Lga@F(bM0@4OdeaJA^DE.:.OKWR)\VaKO=0a8<a_VT21X/ZQ-?7G
93-PV\ES5a-P1>QEN+L<S?:.UTW)@?2NQ?C<=GDLIINE>@(+(a]_BL&bV1Lg=?2#
VeODOJ\\fMJK=#Fb,(;NPNHOH^=[T.IB1Ta89#3+^+DW&HF9F=/,GCOZ98J@0:UY
<:A\2TB7G-Ua?cX_PbSN&-J<3FEIL(>8d=4EBEJSfRYe,8V=Rca:(_1W=cF,@e>b
SVOD\8_#>G\)LOJUU6LabDf:T_BGf+0:@5G]J8=+b,MG9-V2YS7K;&+PJbAC\A2M
[MCF?EE6BQEd7P]7Cf30#->F[J,9E1IZIg&BJb7NPTf6f2.[fB?Z4.OdGge4;6d9
YcEc?]W44Wb8Fa&WCe46C]\=QQ4#.]EbL>(KFfRcJ44MD,b.9f(d^N0Qd.TODV@;
+^X(O1F+]Db\TW/Pb@95KV:+UF?[Pb48&>_I;g@,Yc^eDK[8>fIVP9807X:;B+)E
<7UBEebGLgSY=DUGEXe_C^UI5ecWU^1O1HT]M1>#J9BfZY@I:+2<:8(#N7JJgMO?
3e_]64-7cEGbB;]Zd<MSQT?:<XHaP>[2)(Q+6P(V\cJa<>^)TP-(M-OdOA3f#>aX
;,XIa>2aYNG@9dOCa7V58.]3EUE2N<IAC52,-JT?\#033KH?KQbaGJe.fL-&fE\#
e)eO+9TK<@:^)U(IB?g6@Va\A[)BE-3X-3@1;2@\=M:9G@b><HS7+PR2JGd.&QYH
I,5JXRM21FK2^Ie[AeC6H=1A[c^b5O0M5/Y.U0.Y;@fP>?/Wd,]>_3C)V3Y0C&31
MH9I(0TcCB9G\\Sf\##1&XIaeb3\UZ8PcI->RR^H\:bS^gPK0A][bR<AdKNDgI^L
(^aJ36G5AF3N67C<a&CG1d(@U0:FWN_;-WSS0U:I#P4IHQBDf7O,FLa/D6X9<gBL
@IYe:@<[;>?@EgMDdP\#1@87XLGcRB3A.S>@Y5cc_]O#&PM3AEd.HST7;;_<6f6T
QPMBaaFZNHIEJ?dJ0E\T,=UGRQZDR,W+V)+b<YQP6M4,G&c)ST3<5TK.-b5>EfD=
^1c]]UH:F4&ea^VNBQ]V(3D&-97:C^[T^A9c&8YD?9S1G?K54/c^7,bWU@=)3_#@
].&P2a#?EEBc_\N__IP>FW&B\>^aQM5GDdFdCb^dZecI].]P>)P@+LZ)e8R4=FK[
Hb=MKcdgEdS5]?T&D#f=LMUG;WRZdKRBD;1(0=K\D[Lb1:KPQ6HH&.\\6/S5K(^-
^F@e34B:JWI7UKIfNQ/AbMX2ULaW0#O+=eI4Z@QC9@P6f(.4JXA&FDaPf?(5]SJa
=6/O+(Ub,gZB+GNC+3Tc5Y1/S3#(-HFFCQed7HT\(I/3-&=WC]?(3Z\S2f_\[CEH
Fdcf]3HEQ\,I/A>/[7^e#d#S<-6[3.6DA&GGf>6L>1_,S-Fe/Z&27@\DLVGI;D)&
^:Q0LKX3g3d6(eU2eG7TXT=#BWN?/O4HA[DF&gLcLI=Vc>9<Y-gW.B?4;aXQO+&9
@3NIW77KRMIWI-L>PUOgGbN^?OQbO,4QQA6I?@cTM<_G>10XHd;\MIEK[G0d2aLW
+H9IH&W,[[f]7O=\<DaHB:;U7cQ.;g,2EUF:=O3Y,:QW&7LD5RTOZWEadL)T58UZ
00\[S@;+;FXb2,(B_[1H#K9YI-[g#;AKae_4&d>]N/6,4,U?FW-P^+F\dI^(XGD#
RFU#XCFD=a6P+_7IE:[^2AIO^aY/[HFe/GA\X0b@V;2LVe<V005F1HdM44W<42a^
PA[a<>7;HG9b\ZXFMLE]L>1#eIJ[V52\_B)]Gd#;WWMd<999Y6Q5M@QM#5,9_79X
C4).9G_\DYO9_I+X@e6Z_#CR1@R4&ND7&9Q(K3VZH9P,H0)]2Oc?G&^3bM5P]D^M
,gYWC<0\:aFb<VD(<J91-K33TM:C&4H7W_NeTbaU4@B9N?P9&:QMXK,=TU3NK)LK
)1/&aFD,,D@@\]2)b3bK#Xa#daYM]eY\04)<BE<SdN.V_SKWHfg-PI+D#^8LVBKH
4GUTUHC#CR_egO?HE8POJg.4A8AYa?K2cT3Z:.J7b;EK/BR3YP[A\#CN>E&CWgZ<
.AVGSQa:SZ.YGM=IH7:Wf-<V?D8a]]HG/KU<U=B,K:bM=X7<2gW3RcgV:73KG\OR
GfVaA0Y8KMF:&:O/V\&<-eN]?PI>]TU9ac.E]VJ0)/IO.^76UJT)EKdB)[)Y][35
GS1KH9B+d;TRLBBPR8YLO]>3(>3fB6+XOUR+Z@YYR)WF60d\GP1G1Wg264=UK=,A
=.4ScD[K>SIRTb^]T3-dA0]e.Y.\&cB8:&@PYPQDOP@0YMZMOAEBVV14g6d:S4O?
_g[2J@,H,@TL7=HFf6L.K.ga#=:D^8.<75>4BF6U;Q/Z9D7,[a.+>E:\bG_]c2B?
.;1Y\TSRZIO6KI:UL.KQ2XSW;d>4<HZTC,=aFbKBQW-:@IX?+;;(6RQ_\0&CaAfM
-]/<<cLZgUd-gT7e2J38865B/0g&6Jg8EZbPR/&HFQP#fbIX+;9G?#-VJ(=cgZ#W
EbS.1?:Z=ATZ/Z64Gf,Hd?ReP=VA@87:9c7HQHIW>X9IMPC&,Eg.5:/,EJ?450=@
U4Sd(O[B,C5600XbH##g^71,M).;IF_9AaK)2NC[0#/D:b5I#DN6X][WB?0(D?WG
&[E<Ub^RJK&E7Y/LKCJV1YC[12ca8W=A5Z/J\<OE^023f.=acA(9]O/97=P6XF6V
S(4Z&Z8]?NT\8d46FM1&ad?dPCF[Kc>X62A&>=D89>-I,AN5)RRX^G\EWf]Y5F]f
]fEU0L<b;>HM?CF2eRQFbL@aKORR6d9eBS&=&N,H_4d[Q]V1774XGKV/<G9\BH3.
1^GM62760S7=FbS_+^+V9ZDE-A1]b?@)MT;9<fK8>EHC9XMBK9&ME@-/&PMgC[&2
4_=X&3T7VAAf0.,8#U\@/+&>PXGJE5:G:cD3K&,MX5cLGXa[Ff8+Z(-G_3[dHZK5
30I<SY_#A7CLD)21<2-;H1._4/LG#I=2;ZYeTQZ,.CO(YA)@,^F&Q73A]#1)RYXd
Q\R7H8a6E=[4N(,4MG4+1[K,FB()S+.)=O:^51^.ZHP4BVB5DIW=baW]bNcG0OA,
:+&TZZAe:/gAZ8dOA49gEAR07)46?CCWOHbD>/H&=f^-Y]3[8^Z54)b;DPX6<CZ#
C0T?;O1g#,]#KWB9=L3YJ+4<\8X,6R;.DFg6?fM]AZd::CSA5LTe]\4+MfN]Z.C(
Lc4;:R&>1:IS>-Q>HLf,c,IWB+EF>UASW(M=G[bAD?:?)<KSGd\cU),[X)+=+D-&
Fg_ce_UCbF&<_T?HI)Y37S7U;<?fYBJRa(-B?\eSSK?QO2M>Z[F_4geE0I/7?CKQ
.:/e(&bQQa/:Ff[K\UF0793TK22_;18;_764^JG2(CaN8[^03X2c0Nd88<<AR-f7
ZLeAVO8.6GYOH^>S^]PU?Z7R59K32be_)2M]L9A<A<32.Ld[[[?DCWdJ\B(H.]ba
TQ9BaXCEZ3ME<\)IKMBc:JK]I&K&d2,4T2=b=@UZE:X;_0c#<]=Q0#M^9W-WU?51
.;(M0V?;VcIEbJ=(/9PRg1.P@+Q=/4cPPd.[C._5XO^df.)EIHYBe_1#A\_:F?TM
G8L)XZG+IU#fR+?/]X2Z)MERY[R^<&KGMWOINN3N(;W>T)DG#QWR93abO=L_N=.S
3SPPD8_^>OSI;#DD/)S6#A715,5.g/)\PQD^cSQT4DBfLGUGP=YVb9_c8,IZ8S.+
3S\Ib&LR7dLa+E,RFc0-:dC^8GaTgN+VSVP[8)0]beO]X5MdK1BY&-D[QB58_g:J
#cPA[PcFLH,@507TJ)Dd[L[2aBZ4.9F(Pf[b+A;D-3cOM^AVYLX7<Q@?];E;=/gM
eg#UaB3?=RC\eVd4XWXf<#Ne2G8^>@fP(Yc?[#5F5QQ3g+8e/YIXR\FDSbTe.1-5
M,I]Ua[0TAAQMc,A>+]E#FfO]DF\:6AD3)L5NLbEHgJUW^adIZ-:GO7:8IJA-FTA
[CRc+;A_3gGbgE;LJ/,efZ?#-G3gYTO4YR[e.94;2RH_AF&d0Ec;OTf=<B,Xg698
Z09ZE<e0-A:d:1@<f?_;I1Q]<C?#MZ_0^<+AEOC^NYVR-_T0R+.)FU=J5QO)AD3V
_U\+?g@R;?L\aPM;f#2dXGGZHI4KP&N\g>(/f[P,BRP62G-6)f-RX\fe_#(dF)/8
Fg[+_0C_V2Ub#BWeUVb)\eU.b?DU,MHGD[dO<:DDgaHS8HF9_S4feT+CFC0L(&-7
-YSXc@9RdR(5_:.^&ZHWNRg[ON;(O2V)KL4PRbX__EFO&-f[RWE88P\XTW[)d,3/
UPUT^C?QM<YMYZ9.g>N0K/TK(A)S4VbNTMeabb-MMHU/7-E0,X&dV7M@29PUC4^.
Df-,OXDANU/M1Z:??F#8B=-5BFM#2Q]EIZ^52GKG?DaeND>F6NI7QfJPKZ/+[181
#B[7JKJCG>7#@9aQ.C>_^/(>fb+6W-SQZ7Bf7T1)\&RD_QK4/4DDE+BR8bHX[WIA
2-,,8:&W8?e=Y;5?;;J\Ge<V/(06<IA78Xa>:17Wg7O;X(6Dga<V5c-9M,GKIZCR
8_QJK]5,86[R<7)a)J2FF9LFE[9MMIdN2TSI.JT85-@2?gEE)9(9XIR3>CO[3VN:
;=6^LGA_OLf?d;5L238/B2>Pc)(0:UTDA;&ZdR[?1(M^TXN_.#U]9V(K5.ZV_L3Z
7U?^,g<Hc)HB=HT@]K7A-aEMeeT(\K15OQf)&G,ZQIafD(eUV^f25Q1C\?&c]#-/
)DKY]f?=(=&d4eU@NA[55SC^73?-TC<f68f_==B+D_4+TVS2]+(<C+0^;^6-\#g;
F\HHJ,Y5g=\eW<1?K[9C8@T,Oe8CC3/0+QEGP_#,8;e&=@2gAbUQHMb#F^^J(=)F
A+b20:fRV0F5<d;UUH5J&N1aX8J/@EH13>J/<&10PM^fM/L5M)5T)V_2f/QV\:+G
JRbQ#aF1:W-?f/P_M:6bW;_J74,b[.-4bJ5J#ceR>@NIO7Y\)G^bKE<F1-Xf(b1-
SX<M.46#O_f@:83_(\&+6JUPg+(^C.7)7,OBBYLAKeVa(eR=DOGOaf7)LbaO=E6_
BZ-XV]C,_Z/Ta?)5IG?J(JN3A@F]0TR3R6?]ZdVb(1Z3b-B(A:e\,X9G1RT1E7,H
:5>g6WS:S0U5g@e6dBFg7f(_7X;#Q_Uad[AYcW^^:&#BG(7=\F<IeIVE/V@^/&VV
4WXF:9eIObf?OK94I<YU@.F,,4DV,-9&,?[(LA+Ieb+&ggJ2)5NHIN5^a56B+8SL
@2f#BHF5dKEb7c><C[,b1U<YVDXHAGNJDD8fA4g-@.V5HDU+Sd;c(G-6V_2d8__C
4TGZ]-I/\OQF]-bNXN6MJSGML8GI&Va=H<e1WHWVZLRQT;IAQTI8L6dH/.e.Heb2
a4JAP/^6T9-+B^0e]TCCc;0239(C__GS?7OTg5g&fUIcB4L1,-SgSIAV-.AE\TaF
6W)^^_.,M2_gfMFYc1CLQSX1gB>a0ScZ#N3\dd9K.:@e=5B]N\=/D?I/Yg5\AOa0
WIS@?dW>CRMHTOHW8c>SLUC34T=2N(1QZJX,QH#GC1P)S2,U4^gS5_4.+14Y-D?+
9NcgI[)TM1PJ#_T[??MZ+]d11.><Nb?U3e>UQ^\95bdFe-FR.R>bHe_Yd2b>?1]F
UfbP[.fBFS1+@C28(L(CSU9c01c>3EgQfgA[)01CDBUD;a6<(DM+.1]dZR+G&0QM
bM8@OGd.U?[,[AG]<BPUZ)9K_OK,T0SLQ<BV+_?NO7EffJ)+c@)5bDF9KVMR1<9L
V@)3]D5CVF;K9]Kg<#g-W-@5eQN^.U/4DC)D1&;b>5C.FT=.\B]4+1_-R659:S)^
SNc6#6Bd2I-H>/<3B)3=BdcHg(b0RcNOIS46NJK2FG3::W800WZ0N21>.09A/T#@
IJM-TN4@a,(V=1[c36C^aS\OK@UQXT.]62dHK:2GEI+XW+^-=5>0XY:)ePJP;T7J
df=Vg6MOF12)6Q10CCFEZ._Wf3?aS\R1=-PW,dL\ZJTNbU5D)E#62MLc_;Q#3,5D
H/HWZ>>M<d+=d55_1D^c?^aUU23)5Y_8JBEdX<c3]7Be2S#^:L.A?/THg,R6W+;2
CE:<;ARb@[5Dg,5TbfK_2GFOZAacJc+4R-X?NZ6_=_U1b>FR[2dCW.\+K^^#/H(,
XQJ?]KP_J+4)W>+G];PUERVb(HK>KC017cBU[JFQ6TS0ETa44QMe>J_]^\C6YQ9Y
]M_PZ]/#4O;GAQ\5FG?]d7LRe>R?(7<L+dO6(]87^BX+1XX-/3I:OGCcL9@&9J69
7Xd7e5R=QXPccef>[?OWa\/,MMBa5V-=)de]cV4/Y=<2Mg#11JQ=K+f];(I(-O#+
MC0d3;1NFCVV^1+gCc:S]7@7PGc_ZCb\+IITbOOe3+D9Q.;:=)I>:;76;QX@AX02
H/JQ3(G[8&1623c:c@,>Y7a(:a>+fWB1e@&D<_8J:-H03>Y_.d:.&D-(_,:,VC_9
UBR<be(AJJ<&d&T<e=6\WLg32]]<XH81Tb7f=BcS=bUA+V5\<6(AeJ<RaMQ<bcc^
a>\#2W[_U6\-Bgc11GC7Fg273#<SP(M9gBd&G[cX.8T)T)IN.gdD2[E6WL^^D5aX
>>W_C:CAg,aX(0HGfZ]=S-V[OL>Pb8<+]He3KD.>DBO),(,=8C<c47[T+_EPC;K#
QH&^KDV3CQ)2/]LK_S?.87CU7IWLCVYb)K;]A^XgRF05dN[^Ia^RZ4ZZCAS4&8gT
)LQZe#ER.fCb>cB#)YO#N5FY)cEC^dS^=e.()O3_d>6/DcfOT79&c3NadZXeP2+)
(T)_b\IV-??Y[<Z_b8HI(1N:CM.8ZPRQ5.#_PD[UdU<N-3=eX3VM+e<D+]\>S8Bf
H,IDAGVUI/cA.B;/Z;+_#QB_H.#S0e-8_2Ld<28ZR_U]K\E:5(2N[=YdF=g2/89d
-aRCA(;T:bcVSA):LIbT?7cJc)e8b4PODOV[J^X]gIYB0:5#^;93P9<d96#XeSEN
ACDZA0X)K35T3Y7fM+?Cd_=0>=\bJb\KMc/c<P78+@B9e,G/3?>TL9:#JKUg465C
31B[SP.<\d<C<P\d6cWafe52++RR;W\/)2cNH<M:W;PR]<D[g?;].#?K5H);#7Kc
gRGeR=#Q1[f59@C14bQLUR<T)&+C#=T&CHacC,@g5)TA<a3LJ^7Z/^6&B]?PS</0
;QGDPfA1V]-f=57-_MXV/HUL<)\A-;S8cgWaG&F)^=3+,<YbZ^E8M),+/;f>0PHK
6fT.IZT=O0\DQG]?=fH,(GGT9a<Fb[0aN^gL8Q/)[9?,HKL2&2Ja0,W(gW53BaFR
/FI6_.@AB+38>Y--=U\TN2-c5\<T1Y38d7LXO]UN9;R\?-+La9Z1\>]&=C^^KfT3
@gfUF-@?(C)gM[Ge:OeE:\4dRC3IZ;Q#A3SY545[3_HW7R\8R/Cc6>2f4OI&?>?7
\Rd\MG(d?2A05CGV,[]6>g8cG5RO4b.IK&FVSY5Y2YG:d]8[-TML?B?7\YVI3J_K
<ZfOZ\_W<3cVKN,dHL6&^-@;G7@Pfd-CB4]IPQ;]9B7\YGZ7Me[JU6L<K7NgSQFb
/BHCE_-AFEL:edB?W<W(?Pd^>7^U-(^,cg@NdDN?O(;eVVE==bWZXY?&g?a@OIfQ
V0MS?0A^&5#HL&d(fF3.86F))YAd=N;X5Qd\PY_@_FeN>=_MJC&6\a(^5@2QcUdC
:8WV3L3@RTX;BAK]4)]JSI;8.LN?b4MLfe@B0JB^Z3PQL];P9=WVS7X4a6D5,G?R
ddLa9cSD@G49(69NVLU+FS+H^^U<a7TWY\G.D_Fe&>+FT3GKZS^bA?QGB^EEE?VG
Qa?0Y4Aa/VMSZ_4KgW65_,K?;SD64G54OHEU>>M5=d\bZ^SFa+.LZ8cA-QUUNLUP
ZO1R/TJDY8;P<?+7d6/bCC2@KD?-LXJ/3LE(H?<MN,LGHB=,X3J\N@SHX^(^8Y-/
4SCg+HXCF.9RG#MRQXB/?^##GEJ]S<,E?8^aXUeQeZ,,J\2A_H8(WSYAV1SANOJ#
g?^4);&PH^.W26P+f-Z@Y2?J@RS1F6E(CV18VONCU=7ETAVcJ\#:>L^OLA1=Jf^3
_da\5JRM_<\Z,=V6][?c]5U[dJXX9R;HITO+eB12Z?(dBTg^+5EP06M6A9\NE6E<
&I@_6PS3?<(VF0_(;FEX[.J>C=&CGV0@ZKOe<+_4WRUL7RDfU]G8cf.H;6G,,6aK
.+MF#RU_4]D:4;]IE>cKD4US\?6O2cD;.=S[[VSG70bSDK_J:[=,O39M^V?^KHP,
0F_K9dLV@;H(R)S\F_SCBc5^)GfG.81=NW[Cc2GTATb2:ff(?Q5ECEDHUS/,WO6Z
UO(eI_6;;08DJ3[#XZeVDVQLGL_a8>?\&QG?6fR=#-98__:;GWPcGbOdGP4EQUR]
LW:[>FW[XdfP;]AE</:=>M(0AG?VGb_Fb(G=7[MXf>C2#N[Ofe)a5L6d)M]Jf+BB
;dfg#X-c61F\d-SUf#^TR@I9/#@:(?.7]XZ934V3W9>7(Z@7,&P;)BAS=E9/9QN=
6-:OG9#+8Z_E4UbdbMSO:=;)RGL<EgKC:Q^Y6.3g/Y82I\@/3S^HMX>U_J+^J5XB
R_S+D<?8LP2F9#_;9RH4eGCY-A8-_U:DMOSEX@=Q<SQ)E8]7bB1<K)XD7HdCbfYW
BXKMRQf1BH5@eSWBBg+N>RN3;?ZYI.W1HNLYMMKH-W-&\)KZ0.#7(MBN7-,:.[BZ
SQ8Z\E5IDIRJZ]=SL/E@6)D>16fH01EFbNMUfTaXa:Wffaa?4[3fVIMOaDU0XegM
2SOgLBcJA[gF;=]0JJK4@-C/)I[4W)[18EPTAg1E?DgR7(-GT=GX&f^8CXQ&1_),
EVG\g:)9K2+YaV&SQ:>I;24?H4-9=1g1TY^,,N)[]-fXMfH=X[PVAa9J>&O]NNNB
VTIW0GbEUX3H=aUDEQb2(V(b(.DPb7+[HUg[-cXTR^J7R8@1f4)CD@a:<^8.7G#D
YF,JT)XWH[bAFNRe3<7P(XNdI/PJX_ZU?GHT\1:E&AY>:79Q_f+?Ia;?)LN)ag56
PDd7QCV_/\;SLbJ,GU@PAY(BGKMWc\a-f]]7W<gPBg2:O3c?bN-f#U60CQ;Z8V+N
V8AE)P]g8+;fA9\ggfJLD58AMc[VDfaG#GIA+V:W6NU+aU^TEZ)19UgKcW3abN)\
1BFG4gQbTA?]eEBEHeWMKBX0A<WXe?HS2VOeGALAGEJU)@+O:Yc=b\@&d@@_S&/\
Bg?dKJU/H66QD,2;a6S<A=\P?d:1g?1#2XGC50J&[R;2P7Q1&H9,(MPUXNVU5XRO
-F[F<a0HCZ4;BB3R/_<Lb_g_62</#YF6FaO.O\f]AD=6++PYSgX1W56ZY/E+dQ\Z
8OeJ&XYL^P#+,WfNc]<_?4Z-Od2fL2-+AUSK<)WZTD.^^/S[(0?3FITW7[S@I6F3
V-Ia@g5RC]7bN#^#J?0)>N>1dQJ.bR=YX0?5Z9G/Pb,?]\6,g3IURS)2(JG#<TE<
2YWT+H\_1J.K7RJW?TWYf&[N0;Tb2[P9^XgUO,O6[Y5H1N8^TO;:#5&5e/F3C9Z/
D]b.@616.>K&]]b]98#&(eFg1L,Bg30Y0LFS?1A>L:LdOI##0EKL56-,bE;gS7>e
5FA.?TXTX&M?Oa0U,:9XT^=@aHH@RR6QUgFM2D27/SW:d@ed.LM@G@2g@0V\&L9_
#c,GaNA;BSE[RR4MMdN0^OO();?A10N(JYC^ZANWOAEMXH,ZI0aU@S]R=HXNAX:>
3M]0AXA+O?Od.^&_I6SFIC5G8)TYNS_BM=\Z5-V\/R?7gaDS?6S8G7#NV<,07&[H
1B;BS3]O6+D/]0O1fIMcP^SV0.^1gJ4]S3SGcNU5_MQ?]0>C[A3COQTUN#ggMAB,
fB4PVGf^:-@YSDdCBTQBgIf-Kf#GIZg<N]D:+ecZJBD9US:DMXSZcAb?C^L;NQC6
-HAE?E&GbO2c3?.DJ<FPW+-OND7;]]5G6IP@S^FZ&&:X7DD9FQY5A.P[U^UK.;b=
1#P<TFJR+g=B79,0c24A;Med.?#0dAEcR_D@3.^8B_ULT&]Ef].d0=W6OZHUH<)8
JUd3_)N9.D[0S\Z>X2\RH8MdD/J7_)2.1[E&#3EVHW-g;<SHaKcg\CUD:,a4T(<8
6:TK,<\ZL;#1CQ[:[+@@JFE#eQ>(PbK3,C,=\5f&?YIN)M&(B.ZF=4CB0AOPRI+#
Vg2--]71FB,K[Eaf\5N]a;TYF/48[Y:S\&>cT;5GC;\/=IW;F8e,[\B6K-Le(7Kg
LM5_);G=@]^C6SBVOc?TAZaHXN&C&gR-c1<^Vba395/L@C1^cgXa476[9aINK.]_
=aWaLH?:RIge<X1Y>:fPN\EKSSP151M/[d.ZBJX6fcDb7e3Hg;1(W8E7,SDe,R.V
31ae/E.]EV0UZ?GS69(4;YK<(CF2>C68059J(e89D>,XT,:4GObP+Pa>PM])Z=XD
5&KNF0,C56<?95g3&M-da6EQ9E3.-G#^O_JcfADELPK(NPb@]<[])N.?\A50UV]N
#0(7\Je73\,YQ]H9)eA<UFHVd^U^YO=df;+:\9=b/,_/;K-K=<:LWYD[A3<XbRcS
c7_dY^,^VcVI?7f.8,=SC1XG&>]PZ0/><^W]7J0Hd?[8egJX@>UBQfBE4:IM;a-8
1@PHFXT5b(F^:>6Z&J99]:#_W.+0RJX1<X_K_8T<ICA@>ZBFg3A2O/R-=@=(CQN5
+5J;E.MVf.<9VGLe(e^Y8MNAX_R0Y-=?aeK;IXDF5C9@-4,QPe,0gQN>,)I2Rb1[
VNgR;M[Sc4_P)E6;ZV?[@5ea<TT?W/3.2I5^L@T\/__#R.Q^E7^Va+BI(6g]>dbA
:2>]DCTDXSX[_9#<CVTIb6423;S:Tcb<SZ@Z/dd)071E@>4,JICJfS4=aK=1F6I6
fQdPZAL2Y^J?\[]_M#1S:E0fBHbLe58A[.A-+?/aP.^I+H7CB>GQVUc;bKg-)HBN
.4FMP[GZJWC&X]Y+>WRa,8BEP5BUYG\Q3S9EXF<G+.:HFO[Y?b7V#[8cL>GZJ#X.
RNd1Z8#F1^RGXUV^5TfH?,3.3MV5Z<CXI\]a9+L<IW?V=V6+/;-4T]7#E>6Q&-4\
5dGQC[AOXg)O5+aY)41fC]fOL-bAc3U1&Z3O=2#9dI/+U3_Vb&(HbW-Xg13(G>TC
<fN4:^/D_9g7WV3L=2T7e36bQ6Bc47KB8H:<B/W(JZg3=Z_1;168QJD\^=(K611b
=UKQMV#,B_ScEO>d:Z/Q)/,&F+g@7@88?\f:1Q>#f^Cfg/3]FTJLLQ?0,F+<].CB
XBB4RG_5@V0EC05?f.A>/#<?#fV@S#8WW>aS55+>R=MR<f=Iae,A0:Qbd6<8[D6/
-F_>]-aUe)TX0W]cV;-?&O:)d#&?PLW9OZL]&C#gTYK;]HK\6#4)fH.QdH)VV5b>
K6Y]1DSf\F;beQG-X#DK1KfgCP?UZ./#8)M+63_5FL-L/?[YWG:/52IJaEV5ZW<3
dLH(FTgB:Dc-QKMM1aQ.Q[b6AYJbWe?1\(YSM(07^4[+[,4G7G\F^7?-YH/[H<a7
^#(GJe0/Zf#,_S[@dB94QBL^-F9#Yb..N:(ePRC4<@DE9R=?X^/?_7S2<9(7)4HM
@d3gG_&@6e,1Nfe<E2WAO:0eZYdd7G=aA_HIgVd<<.+LCD#F2WI1BD5QUFfQF-,S
C8;KaWaQ--#ffg-1P8WLf&dUAQ:;SF&FDQbO0^FF^e,8(F/M+G,\14&\5G1QG1&8
XeS[6RZ0g\E=Ra[^?=J9:KPU@.4B5WEQUTP[DCFKKPMR8;2b5=PA0aH7b>.S=E1I
QgT&]?+.VaaG93M?1NX</R9&M?Xb6X3>#7L6FK]@4AC67--GJUabDD3NB5cC8Na1
:4c9TR06H9D3Q\QQMI+5W,.I;6aLXY75[KG5VgU-J&^d9/b:fZ,9JAdNU3Y/##QF
2W+5eGPFFg3#HWA\S7f5BA:+,RAY^,)I[HfeZAU7.\MHQNbNG<>5Za)e?1G.;X(O
SIeJ(a17UAK&\YT7Qf3a(cLe,-B710L09g)gc<S/W9NLZPa[]gLI-G:f(C4=,W:2
G5SeS(d2Q#84=Ug^PKBV#9;T-KDVgf&d9I0)UY:@/D]D(EfS]8a>YN?X.+MbKaR)
QODXgDR9C5TYd@=+1S@N]R9R(a;/d+Y<])_L5C9S49DI/2V6(=ZZ\#\\3.^3e2OS
^bB/VYT(gXM/aBaH)Q=<>0R0CULT(aRaU86V<O52]a;.>f-6K8W@<2E@J-W,GV/V
D6T16G76L<^E4YRY@\Y8B:bVAI#0W?640XQ_)Gg?)T8]42gQZ7A:PY>TVVOGD:a4
eDNUX/TR-@AgB#S>7:f,8:6SG_+ZY#U:S77)G)U4HHF,(<^51??(SHC.U5@>YM>[
7LO)IJ<,6Q[]SMDKS^R^Y,T2.X9KeY)d:,OB;S(V1@^EX]g5XKO2_\?1WUa0fMO6
05M>4?_fGG^C8M(_IM3U>#+Ygg)Xb/6;(EF8(8BWQ3(Z&3^,PH..f256SK(\6H[+
Od#BfAY@a7RLJJP(.Bg6-U??B6B+,=G(OHcP<=Icd/TBEWM6PYJ>[ceBP6H]EL<>
#AfE.:E5O62XV7O/BSU2<5X+F26daM_LcK@KKHCFgBRVNU3]W1+/L#8^NN_?+AcU
10-g+]#ZP\LPJOFEE<H=bKCABR>??#KX1<QKQR2MZe:^G3=6#DS^TT5JfNC6X72X
IF:da&e.8QeN<P#&-^eCY]Z;1+75YXd;Q#[:>LG6dNd-7YSMXAeSM.R])GZ6d7@5
[H@EHgGaP-);4QP[GEV4Gc9UG([2_DMI?SO#^_-Qaf#DTWO8cXB]PH3=^58)&1U]
0BI/@eN;(.cXYTG4:R,0DJ[.(ZO+dP;e+\(7E.Y1#Z@@ET+-JeT^UQ,b3+Y7H;^2
HX,]]>b>0C3.\]DW[Zd<WH9:5+L>Lf(NSbe=cKbR:NC])L+O]Z1EIM39N^LdKMO>
AG\d@MfOeL>4B+EL<f7/#fLGOBb(.gYNXR?5?3gM@W]B/._&YY5Ib_L?OU=_ZHdF
5BQI\+1YYCI/R6HN\[f5\fKOe\aQI#14/\MVJAG0YW)PR:dTVE+-3-#SVc[JSW[Y
Xfc(Ua@a##,dM3cJRQD-@USdSVONQ];>>WfMT^[\2HA^0=]LK,S&)VW,PM^:@FSK
bNHGfa0.KXG[@I.P@A825Gfef@E/><eeI#_6AW/YHBVa=TVMN4&L]7S1+HbdY&QX
40<<g:1)YeWc9FS(_YW=>>XT(X-a@X/=P>#fN\cO@/?/E6Z_(,B8WEU_SPGa=(FR
FCf<G88VXASO7.G-6U_/PNF[/-/P5D)3@T_:VDY<++#H5-_J\eX5=.2]>[OWV]Bb
O9Ac&<\O<gbR)Y+]P=S/E8_S?:dIG5I83+7&B;9&V_9cQER8Radd=K8Cg/_/dfA0
[+QE#N=aJ27@-_WKf.,X;D4d<,B_[XU&.9QV.D<E?.O_?WUGKI]#BAW1-0A7>]Y>
dQ5K6[^#WM]J5[?RY3aADD:I7TX^5O2K/c4)1#1CL6b<ZLf-HV:^7--/BMOcU.eY
Ob1&GZ=ZP#OHY&J?gZ]=YUG[OW&^/O?21;aLe^I]DQ5(GZKD298;fP+;=O,RXFAa
DQ&I^b-,+AFH;QMPV>Y_=Ff152b2fI7:@:;2c^]^IT81Caa62G:QB&LL.=KB85FP
Q\/Z),+.P4aCE:2YV7b1?(^VJN>AXUR74,5)c1Lcfc1YM1EH,YK)ZLB(R7NIgeZ-
F&=-JSWK^E>gGTg+aY[HMRCBcPbWIGGKL20cU@CP2_L+dVIaS,0+_(7KHS3Q;[da
J<.(O]9O>?1R[XdTAX#F#WQH<3[7ZT3+9ZPRX3-HQB<U;_H[cY+L+<QK.#53IKT]
)b0_XJ]WB=/=<:^7YNbbgE1Ya_SZGHd>Q&a#RfQN3ZC9;d)S<,3LKCEF;<JgFA^E
Z,OdRSda5X9=Vd7YPH=(Ib[^\,TW,]0/?),1EJ\LD/J\dbf-CO5(AD6b95Y78&<d
Ab;2LHS2A4Ad4eg&_9b?C,N9\S>I/fXMR<[Z=_7Xd2gE#a0_Ud&UFBc)&\B4A@YB
11/R>4,DG/H\/aDX@0&+NG;0Z.82A\BaGg+0[T\#[M+0-B:cMR_[)aa8&_@VZNL+
3bfd)/M6WDAZ_UCZfRH^ABA)1#:3/WGdfAeD4WMB@4?=Rd#Tb?31V>QHB9V-gGV^
_X6WZ7YT#-1ZYA1ZX&G=]D^4LL&C;@2Te])G;/eD_c9>aU8,=/-T]1?e#?;ET>69
@Ac8/.T:E.ceM:Kd&T-O+Ma35&I#Qf=a)g)S0Zdc.@UD_4KbNZYU-K3?2LfD[GR(
VH;Ne;Y4]b.1S)Y_4(_^@XM(FI\?],..c>+R4;5N?UH3XU\114(KeK\YV(YD[?-(
99I=FMa(f[d+5YcSZ<?<gS.Wg6;QYYT@8U1BC5;/A#K90;X>^BB-aGM(S0NJ(ffS
B&>e4@TP>6b&QZ\GBLC@4MTbe5AOV@+Q_RIV@9eGf67ONI8U/.WfST6]>NdU_?LF
;YUgK.<Q_bV[TDaP.6JEUg>&3CXNI5c@cOY;E0_&]XVF7,NVXc^<+c6bXe4e<gIE
CWOg-?@MW.8gQC1)?@_>HYW#TE8U^1d\2&b;f6cPL<EDSc4#d@\^b5D_8e9#4;YW
7K9GR(b.Z16.1WVLL/.LOGC(A;37IN7<3[]6>c)LPG0_U.LVET^BSF#6F@C&3;P.
8;9>7LAdMaT8bOSX)UfT-7-0XDE^]J#:M2NaH/]_P?JdN5VE?,JCV8G)8H:Q;489
cYC1:]/LEdX>BUf1FI/WfO\&,+GK)ZQKKZ,>&b7]@GZb>+[BEWK;FLeU;7Oc5SXN
:JE-3KP]B?R3O(185aE9_>#PJ1.<JD^L=E_aa)..:DBb:(G9>[EMQ(WS<8#ET-_-
[Va2WC]JXEdS:W/\5Ae5N/>/[_>&J.1N>)CKYRC[aMX&F)ZOEK4(aRe+2CZAg[AA
Y:U85]f<2f+g8DNe7(Z^19JP@E1/:)T&,D^@Fb-^11N0_CPCFI5fg2;/fC#T=]<M
82BD#IJ=4T2:;^(?8.-C/XA#/?M+6>Q;,:FF2&8EDW8Uca7I+=4G>QL:I1FA#,eT
UF345W/WDY-GZPc)30P7-8+P_/a+XO^HcNG/QNAM3FaVXBVY66<[C<KeFQ?UFGLC
]V?/a]8J2.WSHL_6MYff4]6b(.SS>TX7e6;;-cM_W&BG:<e,#VOCOdKf)>>aU+5-
[J]6ZcOUCB;-09X3T4eK-\b&N^9fL;cL_7g5F>g33[]V22[P;ab0@O#Q7#F9ga^&
+>BKR5/eR6_Pe\(I3PVX4)U8+\466T)+HUd([/@\/BX:VV,-@O?W\G.H/YVOG[d)
2L#I^?5PV6&e?^V.QZ/W5B7V;.==4+1TL.e<3M)d.FE,<Nffb48^cLR0ECDY>)X5
7.c,[.,E#]W?E,T55A4Y8QMTL/&UIg9)=A=W:=g]VFKeZ8ceKCQO#E_26>XRB.G.
&?=:@Xe,V0J3WWP-PKdMD8TB<&(4gfV^acbaI&)EeP^(/S9Q)V4f07QS@3FMVRZ@
CgA;I_Ye+<:8:Cce+]]Q?)#97G6OaCfL:0[W]:A43\bf-;cI@&4a\U6Cb6K/fRA>
AF8;N+X]7&X[WeNX&?W]\1DFO5Ea;[1Hd;MS?bW4/>8<:+a=SYA(HNM[29f:K9/L
SEY7eaJfSYcf-\^PZ,PW8BbPQ.FWQ4I7>E5B_MNC3TBTAZ/M06&PA7,&=K3F45^c
/a@F:-2fbT=-DW1Pf:-Hb[7O#7Q?1b1#;+U\5G.8T.+B\X)9+,MS+Tf\YUbK5Z\/
1:?HYGSG)fgd4L:1W;MYS7)8.W[7?0bebFdQ;D:eGf;>(1fVYB<-([]>fO4Y^e02
P\Oe>JPGJDPVF)NP4CMbB=#gPg?6^&7d8+@1Y-5)X/1gEKC+NQVN>JG2DDe97-K?
\)=?EU59d0NL(D&f40#c9aY=T];c+PIN0;3^P2GGL=P)_#/E&RYJK@=;0I95>eL+
M66_JU4F_B8IF/TEg.1;:MBfZKO5dN^FTE,Y(F.0-d8E.D#.2b([I9+=8Ff?],=f
TM1(f&^LJII1Bd_]d^g_^/U@;Abfb<-V#8+?N=J/XMA1B9HR5RLRR^LZDUQ5F3I=
H;6^#9>3PQNVeg,M/GV<4?DJKR4?R2D+Z5:&PU/bL.JI;;Y#ALLJa]F6@^O)g??U
]+E1gQP-NSBBPW7&2,2@J;YO)ELK7C<B:#geP<)d)-;M<0&>(fLb&[5K\JG#N-I(
E2K6@T<8QYXe_fH/H>1]e#R=O,e3<2c3\5dU?fd?_YO&/^O^ZMRf&/1-@25S6,?)
A1aUMWa+W(]9bg3cJXN,RY4S&X+:UPTDYeA<f),GYYg,GX@[d:Y)(c);eOc)HR\#
O9bN[5XY[/3[5G_7>Z#aeeA<G4IWN2LP1XWY\)XeE7&8O+Xb=fP#XY);K$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_UVM_SV
