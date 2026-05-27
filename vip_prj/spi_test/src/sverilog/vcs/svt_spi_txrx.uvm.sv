
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
`protected
e&#)W^L#MTY4D=?:,+:&)&,8LW.#f7_4IZN]d9a]Rg-\a.C.R/(g-(MG>RPY^RQ]
1L\F-I]I9RDIf-<gM=aZ/cGDd59NL6I]9(..N4;JRdPTXGO=[Md-XQPa,YX;e++R
(T+.QJWML8B4,\a0V#SL#S;GD[520g\Bf:;eaeE?Df,OD>&Q.:K06IHTI3._2&d\
_/HX5Q/N,;f^\W#0EA58=1IPQ@e@(<J]=M1#<\[V/eMY^Q;=(X+Z1J46MSEb\SLN
_NT@f)ef:c_]&J/&?QNNCDL=,c+&_A9V]6^g3:R)TF2WN<7dH\_>)8?O^Ve_V:@P
Q1#:-W<Q.W+bd][b-A?E4#9Q]D0<@+2EXVK/D,+9K3^_EX>M4/&C&,>44Oa,g+TD
&1<EMSPZb[.Y&9?20\5H7V>ePfb3TE\9+7Hc.7:05+Q^0T&C9W5>HT@-^DFOYcV(
b@/FbYW3;ZLB,J2)Q4LKXLDaGV3bY@];0XI,TgC_3UGB7ad_f[Wd[e#c6]S0JZYY
C\DJ0VCTBBMTd^AXd.L9>L\fBB/V]Wc)4#FY1^2S\GBYcJ7X:b>.<H@JVBg?Hb&,
41?^K[Y@F/\ALX9X7P[]<=Sde\^A1I=,BKea]EDB:8D)ZR?X2[-OFcGOB#^)?CD)
YdXSV>\e1CTOgA/C-ddDEJgLY=\@RMVDO<UgVZb8@b]:+8IWLTD\fNdS-HN[^^HI
A,)[M]+5XVG_TLZKB?[dT_HK-F^EI\6;)6g+HV+=DJ80Pc_-F@/N8O?(W_;/-#=N
gaKc.J3/)R/R]N^e>F#6#9FN+FgG6c\?BO<[?gPTMfEOQ0aI8a37=EH:&^6f_9[f
+.MQ8Y.,BJYNIQ>4G:O@HVV:BU+&7)=CYM^?IY00?,:I_.3M))?;U-gKM(./Z;5;
WcQ,15_GJMaQFE=CWL37LMEYW]N.;V^[39L:VBHEfM[\NW;U=T^d@)LeE3-30V49
aDCEO(EQ<6Ig_0+Vd9e630SEJ,dR7S#:QP-M0Z4P4b<VJg^f465+bCD?<@RFUN(,
>1(U]OW<@B\PHFJG]/:gXR>6,5VIL):]M+1;Nf>3ccBb4MgRS4U-9b:;/,.THJ2@
>#ABc2D9?P4)2,a+gVY#G]-JaA(LY5OPX65PcJ0/f0eN<CK)c;d9O];D:>Z6(H3I
V56N=G,]F:;6QDf&]OR:M+H1#4&1F_OY.5aNTK]0BgeU&H^_GbJ;=@fce>X)M/dT
_7c_6<1&b_7gLW@UTcLB+WbQ](EOZB4ISZC)?WH4HISb+&Fd0f591N,@:@V>@M5W
F9+.EN1?(+RX?7>(BIL;BQ4H8-D;=Ad]\AacUHUKIW5I3_MB)UG[Y9E^R>#cJ1,@
@8:PXg:7DNc<(AW@gT0FP=a:J=2N9Sa8JGgXOEN(@BNI>bX12S_.Hg]>EeN-UdWW
;W;\0HO:]=;(#;H;O3-?A2JTP4a>7@W/LQW]QI)EXDX-N9;PX5TY0XN+4XX.C??F
-G&J<IB04TM0.0UT+JUCMBQ_K7O2X207fCC-VQ<N=gD::BIEOBTP)A-?LfJHL)H_
g]e<a_2<;OTEPLfLKIaGWF#1@^?>;#ffCH+KR?Z+?K;aS6/&OEG?)ba_gQ#8.+_L
<2KZ2BPSR=:C,7FG#S=.C+1,@FCc=0MbLKK#F@4d,1,3F<eX5F.0MCC]SeL?Gg?S
R0,9<Q[R4XZZML3O1C5GMN=JB2R)RK8e;Vb/g3AW@OJ\7L5.RWc:O1&.)dDOUY7L
HS=eL]MMB)-\1KSK7AUZ\])77H_0O6e)CG0a_T3J]&#E2=#Y&0/3S(-RS1M<\YW>
SVUBXZSM+cP]-3,(BV+VP.XFdJ>92+dZgZOK3>d[UK\@7[cGJG[.6;KQ\[N27H=^
A2Aa6e<\7M6>I?^0@PC_T\YG5McRe:[?\2N&^a:50<L711eMdQ70>-bN@K+HHKV@
-SRX,605G6BKc_HGI48MCg[9M(YJ(\g+K3M8;\=GVQ@#JI,/G)NZMI7<9Fg0cfW;
&+O0#IAR,b3g/X9+Lc;S_;D7(2QCe&-5bE2I2L<B:&(#5Z;BVAD[D0+=A6TK[Y6/
)H&C)H;0<VA=]LD7TI#FH_D@7PfUK<\@6(:bWZ0A;O+,.]_2ID2\P1N.LVbM,a(O
@fAcV[T)S8+K)=3]76b;K_GHFM\0H5KDX>&@e9Dc[c-@3U?7(431T>_Q)BQPH6#c
-)([[fP/X/;]5AbIW[?9faaR[&5aa(O.72O6g<\X6OE]I3-(fcN),O7[R]@gEZ1M
O)SV>W;&B3(X593E&VHVA/C9&UVa[Z]aWOT^&/ST=,2OFQaT+WQ3ZVA^BTYHgf(A
BGW9cT[NZIY,6d?ZU4a>T==C(U(H+T+0DG&4C]7I3>\QL@&R&.eZK3^84PB09O&L
),gDJ?K7.+Y@T-da/\+8\;f;7WX+&<c=]\;YG[?A)5WQQ<#_VY1]eI9W=VbRLbX9
8D[O_9)]-^9F,g[J]/NPYYSf_9e[e@;(Xa:M8S6Y9IZL)dBI\3G?L5Yb;@g#99=g
4\)O@?ZY^YY.MaU:,URTU=@58E3W4SFb/,P>.401a=_][O]:/:GeE<PObN9<3WJ1
G]3Lb3LYeDGW>48QZ7/V0BOHR9TF.#0M9WDJX<&\4E40#+W3<OP[9T[(_;[Ic@T>
Q;<K(^F,eXE;?d,g4MWS7(U,Ec;5?GUS:[<CHZ;#6_g)61]S1\gZ.?YZgY6DVM^B
fb<=2V92_Z>fbWUZ1Ng#9+QO\1;HRNe7RT1.A/S?C+AE@BPU-76^.KJ9?\?E8129
PcA2&;aXZe9_a2OVL4LF7=5-^)5FYa@(SJQ.CH>X,T?_4L[5bW&0d-dRYC2PH28Q
06H1=.25,7P+W&;g+ADXF,Q+>_H.SI0@S1cFdbbg_(Xcc.Qg&R@?\]Ha:6@58K1(
Y10JQ&;5IB-B:D^MDJd8N6C-Q1_@dMO4Xb7.3NaXR4C=1=0:(b>a^#<ECROB2K-N
I@&]0;V9@c-21<7ga)V\[Q\c,UP:N-4Ga5I:QJE5RR[J(C\fEDI3K^SFXY&P?b.B
L(28GE2LJYD_2PF,;aE?=1)4;E-AU9+bH4;)Zd:cJ>NSN;KJ_GVQSc7L.YKeDJC9
Z[TG7Z&dP,;&I>EX,Df4T2VMO-)>UJU84CdAQUT:c@.>@e)]H2JCETc;++;=R+;X
@XfRI8Rb24TCW0FKX3#_Q+H1EE3e/6?b4R7[T4#^Z-e?/>F6YE1aL<U6N/Y<8^DI
,#Vd8e0X--a9:GHV@eB,(-&d/7#F4I4J8NA7H,D574,Y66H(MY\aTd9_HA@S\-;B
[bXb[bOVM2NgH7We;-c4@=XS5AS24\VCQ4]@5:)6Db;-FA/;IB:\OJ][7dd5QOR?
S,\24>>=a&5YR:Aa>3>f-ScH?@Le3(1[-(;]Y..(V8[V@ZFeYX]B+1aE^RAMW(LE
g].XK,6KFD?K&6)#-UaK[10_\;\fN]^_U;?dM;G31<JD-[>WF-O,J70XDEVV)CZ>
8fg:9/SR;0c)<B+?HD/7J?QRcM32SDf:I9K01+\3Bc,.@-5K@#Ada_;HY?3K)^&E
;CU7C>3SacVd7RQ5DC).RT#BC)N,_1TDeE-QeOcQE?ggM?G8UDN9R7?+@X]eU<Je
,Z)^^S)KaIZS<Z(:1BM1C)BB+L^^ReL/7HHY^-HAJ^855&X;\=K=O<bPV(@IKW)B
#N+25,@Lb5gN3cPVX#H4Y23]TM-cSS+UX@1_G0+21CJUMaR>OB^625?SQIA.@E]2
Og-3YLP.>fdEV\WbXG/;836V7/McAS22O_,7aTb=N?6G?Z.BNgT:1.aXL3:&:J@6
eWF=DT5S5F5=ZJBR74=7C)(T]U:/(L7=APUD4LJX9&KL;SB_fLHPd)Y-abeH@f?/
11E[Se@U)6O6\M].424@Z6SIGQX#]Rd;<LI6>Q4<OcP<f[(+N7VT6N[G(6\1.?=+
EVa\5/9B]:AZSLUOM:]736\,Rb1>DB-b(W9,.60J,#WX;7=#@_-FcLOLE9RVPJLA
P^TYEA.SSH?7&]P-H8KE1CEe6A:KFU?eL9KE8J,M3N@.]QKVBRA7DG=F6SGK=>RX
#BDeJb?Y1S<D^DC.?)P?18f(?B_SfGC/PcTV?,CA5ZIIa8L7ATB5d^=FP$
`endprotected


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
`protected
TMcL;c>ZB[B>>ZP81NOcZN<92cIHd&a-WIKTe:5=+/\)JMdF^G9H5(Q9+A8#4;]4
,54Id+(dX0SfX?N\bJ,0W/#YIF/&[d+Z2&U-7QH2YXZgPV5#3a^d@FG]8bOfF,d[
:DTR]LU01Q&B,\HY_+7)CddQATJ#d>f#57a5KK7bfXce,];L9QZeYT^]Eb&R53^:
81NC3I<>XXU9e/daF9>+)P5gFe/&HIEHP?=fOHJ&aM(=(=J/KF^>Ta84PH7bb98(
DbF-B?Sc:?)cC:ZT]<#<\\@)Y;U3&L/5)682SZ-B4R#9E8>>\fR:^N=[/UV7G2A<
OGDSNe#?#Z?@2Jg)RT(Y:D;K(Z&CQ5E\MN4.OZL-7N)[.5DW5;YdJ/CBA?&7(.TV
\[cSAAf,D?8SgR(fF?^])Q:/1R>4FS#F4QRUG;FHKcab0L)aRaJ<YVXHM>e]K,^H
CC/IR]dDI8QCQ_7d1G-UDW8Q#?5,>9e:bD-dXOG,^=KW;?\=^;BM@5[BH0;^DXKM
Va@P;]4&SdZBU/_UZF:?/fSJ](6AF-_)DWW6\4a>Va5_VF&7Z4c/.NGU>_--5R()
T:eJD@b(@TJRU698?VOYR3ZCeEF5/>ODZ&D;=OS3fUe.&VaM+I+a&IL/d,8b.49Z
Wfb23@5,3.Z06f22/1bI4C]2MYCR-.YC[J]UEVD,=(D/9Ia<,/c89\F8:_d6KBZG
UfOUV:1OIMJ2#RTCKgK2bS=(>PgIV0UZ.^5/6B18<01c-?:\?faRWdCWC]>6BVV;
\XBXe/O2;4<-TD/1A:@.Q[R=2(fDaLMCRDX.(68D[L.71PMH&Tg&)&7<49^K?4_U
8T5&a@U\5/(FVR#Q+GNCAYBR]SE790)I)fg-^b/FQ[]fdV3Ce.[[)G=^Hd-fJ+D\
I[=bS@QJD8V4R2_HWd]K_+Ye,,4Y:;1e53ML-6NXbN[RPUE;,#ed]S4IYC\ZMfB9
c<#5U(+//TYg/AYcY+<MCBP(5:g:HM@1fM5B+:&)caV3_AC1c.1QbdS)Jc_3JeBE
&WLfH#JZKSVBSD&,P_IF4?=9I3:(0M=VI2=>)SWGFY5]FYLMD-XKFc9YHZP.V58T
MX-=GZ5_K?d14/aZV@Vf/d;E&;R.]-eaV^D2Z,a2A(CF>g8e\0(<YIJ^.6L?;;UF
+aI72#\KMNLR40];E;7;W7./SdR)\,3E+GRWA78g\bb/B>9;G+#GF3F\0]HOJO^g
0U)a6Jc_((cPV=YT,/>PVZH?8&VgFPYB])9&3ga@d\A94eL4S<?W&(#GbaB&EQ+g
Q.^8-)7-fE:Nb8LOEWX3(E9]M;+SY3P/7WdaeF-UW62DQC7NagH_XISNCZE5/eL+
?:DFSEW\),=-LWKEIMW@P<;g(5@g5YT^Ja]&KRB,Eb8bU>?2]e^CJG?BV@:TJFAZ
KV&=/fNOJ-[.)>)D7]>@;ZU<eN1Ngac=>0S)VVF(gfD9cBE4G<,JRHP<\2N+WPWG
4KRUg-WU7bgN^3.@-e5.BQCUD<X6Nb44>7Jf?d#HG35X87]KPZe/47dY;Z79B2Vd
#;Db,AK^8QT.FJM@0YSL8J[_]R.=gUJWeH(&G0PJAHKZF2-^C@O[)g9Gd.2=;=DR
M/90d\<S--4SRgF?c>We(MO+@+I_)6W)efSdXK=(eaVR@ETJ()KL0,aVSXG;1(g1
)B(=<>F3c4YWKQM3+5Xa80b_>-Y+6.F_5.;I0bLOaH;&b__B?X&;]PEXU#H=;J:#
:0CETb/)[UR[K/ZL\C1YV_g/g8LYF9c+W#^+75SNf-LR.[-B[^(;?ebVGVD8XccN
MU?>?]X7#cGd,aP,+635LLA\I5Rb&>22gL+2ag->JE]SP[@)MXLZU\4UR@OaPKNK
/aP?S]dS#KQXWaF1LJ-g&g#@gWCTbJ)>MAIBfFa_66Z&=(8\.UFMFRPY20H4R_NU
\2?<P7e#.dBEWZ5gG/e[Q?6]+OX8;\a4Rg4?E-fg8b0>>gJV^)BJ_IcNOC1a#[J@
OTM2)^;DJC:8\,Z,E(TQM,O+;,34]>+&4#IX7T9A664=.Ob;<gLTJO^[EMNd,Z/)
/J(QI2#V@T.aJ,)L)0#aT(L\LZ9HF,_52AS2adA7PY05^f9M2_T)&05cC]cXV9D9
XUXdSF[afAV2YL/QLd/@@KWDUe=McTcF8#BdH9,CWO?BV9VD;?951AZ2+a0-cf&W
81>g2;e&-K^#2a\YIS]EGba5T#b9^LU_]c=Y7S=6TLXaX(V9?BQS-d///Rc_[@#.
f#a6H?c5)(Eg-)Z_<8.,2WBO?4MeHQ<gGbe&O1.R@=\ELPKg)0X]_GR64KFXOG>V
2KJEM_a>_fL4<,7;HD)&:2UM]ge8/e]SJ+7HJ5Z1gY2(#I;KE3/gWQ6)PU.7\B,>
2+^T,AEC/N^PN0=4<P>O.d@+3:85(#QXRR>D6d1@4.>SQ(a<>]b]4E_G+c]N<CA@
B>f]<gg)B<b1[[^DdgZ9DDXQ;)?U#39XQ&FP\(CZ2A,ZQV>=]SJ[;gAA;J418\,;
W;/N\bUG>5#AQ]T55d^T<7O5&QXE)a,H8EN7&[dW7GcOb_?^5@VQ<4c1>G^(_^FO
.:ZSNVLGPTbd:=3@>>46=(;c:A#=QEEOKeM?M1RcZb_#U+gATGCYT7e/a0/GS1E4
=^dC[F=_+(;N+Q2TG=@M(DW.U)S:;/d+?9_WNO<FJ\Y^T;Z]K@7<;NO6_U/R;fW6
cg_Ka@67:E,7^#8dMD.PK1_eYOF9<XQ4KO=J<D0)]KL7+\9^?Bd56JO8P3QFL7F7
&?));La7#YKE2(Z1U,UXB(Ld,8=].32\d)-^3>S.^Q1_-a//f.=eaH;eNg3L+A:7
2N3EBG3@1D+DJ,.@M=d?g)6/LcYEU-1Z1#+N+@;JNUM.Q9c>Zb_\=IO9ff2=&@=4
a5?SaHfaNC_W<gW>9XFa^9KTA)U1a)/<I-(1ED<Q.K.Qf9W1+-:fN&4QW?\/-\I8
4d>a2ELT@Mgf(GST2_R4d>RM/.+MNd;D\L\A)FVLAPXC],.N\>f3K^7=D))E_YLf
8M?-Y/24U_JI4]6PF3&_gDeJKgQ-_-+FNdQNfe#LF=;B^Y[Ca=E03Qa/FS4We+M?
g+VH:93VH#N.^AG[H>F7\O7c96d&+-X\:OC?T3;^06NBeR<HH<6.J[5P;@>AXeZ^
952.BJIYODPO>(ROUdcd7&9RYg63EI2CI;J;SQ:4c@@0/>9g:):(4GC7dI36YE#A
a,_FPAOLBQJ3HN)2d4/Q.IM+AV]d.O]/W=ZHX/gL^4V5.ZGK=OAAD4M(Cb6cJ:G<
TcQ8/WJ^,e:38+>?V67b4J@?>CP\<0GZaADGEB[ZM>7Lg=(+GBJAf,65EFbf,_C0
ED>9PD<Ve;[^]?/P>+D<.=4d;+^Z/YA3af/e4D3(T5U@b[fc#0E_QN]>MU?9IcU\
ec/50-M,RVP#9OgUQ.UD2+0e4Z#6<<?e9d7EG)CfKB6_/_(80/WV34H:4X9@Fd^f
Q+DOT-F@HWP9B8Zb6XV4H+g<N284<+JIaR,b3bBFYRf9-8@3.28Q-MI]Vg-NF-=:
7Hf&<YO/YJ9=]QM9&@CXZK7ZMCZg9JH+W):C#+VV.SNT/MO3fN,?>-I&>YbH_H/e
D&:Ya)K-]+;@,?OWO?8GTUXES3CG,Y)][[-Q3:F9WLT\2N./eQ2SO11C=)Sb9=/E
0Rb<@^:B=Z(g)N]R^G,[8(#-.VE=QUC3gE^6VQ/d3F5Rbg2)V2;9@(eV>F74.Mbe
//-)CT^/J2OSF^7QV\?]Xcc3XgK0L(7.68KI^;e[O,>0V=gcM],4T0(-EGHO3DdL
#4?B&PGTK@&P&YYVGe]J5ZZFd^fR+(++20_&,N\fU8:L&Sa)8V<9A84UIWR;J0,5
&>WM\PI;[QV3EKK/ES#NW(L8VBDbeg.fdVbAAbT4RSO5(AGc)5@fSc:d3NZVG4aH
0,OYeU=TcPAV(1GN)EPA_:Ac2\d-UHAg:480#-;+VF;^a]6A:;F9\&b>4P?\N-RZ
=(b53S6d,-DY;,(e]-UVEE>Xa/><X-dca5;+7YQMe^0/^98^B4N-QbNYf4&..g]L
N-g-1XK51(T>CLO#\7=;\0N=N;]@#TL<^FB>^a\3#KgK/LCTPUJS.(/OE4T1\\51
bXdU?4?FX73E>KG#.aPEbT&PSB9<b?RM,]::133R/W/[8d8J?d?9N+?NHfX)5JHT
=CM^MBJM^)E.?/LZPZ3Q0B0:N23<8Z)EN8/KCE7#61AJXC(])dU2XL#(>/]W7f8H
U6U55gXH5?5&)RO3-##1)(GG7XZ6L=c=T-V7]bK<>>C)9Jd18HY5ePJdM_V3cHPG
LQXXWPg,OIFZVDb=DXcKZ846.fa8daGGOU?P316&,)+QU(=P)93;X1)-ZG#@4QC\
@;M?C\X4e:0#1PW?G?(3:S7=(O2)I8PYD6C-0SQHJ_2g)BLNYTX]&7UEC^]QO^+f
MZM.Y(1C^[\/Nb#-RS0TO]..O=>2^YVDa])Gced>Y6gGJ9JB]@C8\_SQ\2I[AdKU
P^HYLg6g@a/>EGgZI[)OVC&Ka5+,Y>/M=;>::J#F64de.23>cD9YNSJfS3#f3QJO
b,a88d=ITUU7YTgf5Ba-Y3SSR[@WU3aLNLQ3E#<EKg/4L3KO:HGELI=G7fOROcI0
<OD=I-(LQ-1Ng^?[caPO/X]5TU85G+R?Y1+=D6B\AFT=f9A5<T/aG.58:Y&N5fO-
CY5C&.P(4)F@4+C>7O0g4O6R/-2]#-27)4L)+@7>C=,()M2QCWJI-@CM&@E.UE]e
FD.5^ZBX<-::WX.aH>RIgH/<ETa3bR+//S+@]Hc_gc<(eO^MGG=H6K+;4bIK(7Vg
,\KCX\(_ZI7##7K<C=&0(JYOUSdY8gF,&,R@J47E-/V6gR9;Zf@5^70>9^C]CU/S
NHR14IS,aFTB.eOBVMMW.P\D@&7H;]-I>K[2a89c>f(>_B:SVXB5d=2MBN]gCUSF
AT4b?K5a:DU#=6=SOM#6OX[AK?[aG:GF1//>X?NadQ(eU(g>GD[OC:c0RA51A2LP
OD#491>)2-;P,=--7bP_E@F7)4::]^)=(?I,7-F4:CG0,G#fV<82B8B<W<XIJ&b>
OS<0G2=7T7W=8).7e.D[&g#-E?HJ<MOW]<>J92.O=.0/@?b2e-L0/,Q@R[8H1-e-
OYO-H1cAO^_)MN+T;_/K&.ZWG[dOWOX_?.ULE^6@U8?O3LWS[517]EY8RD03Bd/7
cZcK5g-1),5/)XDb0?K[?]=[[02g+.676YM-]7Y5AUF6?PHAN3]SQ=Y[M75JRI(<
4>^^FVAeVV9WN^NR)bYLM/dFOP^Ka(T0EXGb.S4:5+0E/0<-1Jb)#g&)4\J+<Z:N
.)LDSP+?;b/?<(]O)b&eXL8gFBGTMaN0IB.2-1=[R9GR=:=[I+a(;JH[D-aS.A_Q
4ZQXF/[Z[V-N8A]H@+bW<\^@YZ5<&23^a_D^X:^\L0?[&UR:GNC4<13CNEBM&P0b
6Ve/6AJEa@Pdga7M?9N93S^f;OgdR4;ZZJ6JWBa/Oe_N[VUK@JBAffdNVcU=Mc,=
\9(_9d^gU)SXL#T_PQ.A^XcU,d:Z[,X0IO4&()VKF)9#SaAI\B]e@f,179gN_QL9
RW9KWNF=NHOaLOVV\>9;f:;C2[f8UG7ba.GK\1g1d0NW+O_+Z1D61>I7\g:&;9Ga
=@BfCBCSbKD6RNZT:U#B_@c,H?P^11QgHN)9c\6SdZ8KIGT_aW@Y\363L\9&d4ea
:PTaf]d77/G#.4N4.F?B.&_BC^33f=R&TbY;?)LH>adAHSeTS[Y9E^WfS_[<@A74
\BeFgN=b)18X_(G0N6P+IO3SJ#;fR2eY)_MD+#.DA5)-d+8<7-LHDS2X;L@#AW7S
-EIe3L>M4J?;)0R\U>GZ[#fV1CEIED<@4(J&+FD\>E9KU?F5_5I^N?IL&g04@L=a
U-C>-Mg:0:<::6/8QAS.5-MATMVU,0@eWM4[O#IF,deQB5JAVc61B<9a5DO+Q/^9
.7QSOfT^L(I[+1@CcJ&=9_;f3C7MP>]YSOB31g77f,B^@:\E3T+^:ZLC5<]+,[Rf
LV<^91[BDC?;W4;LcUZ^/G+UIQ?ae1P3f9L3ZMEL<1SEW@ZR3M>PFG/TfCUJ+RE?
K#]U=XZ0FIMIQO[H@gO?)aOa2TG)W<A9PKdM4T.)5]/[]RL8PLNSe]6D0D(\f.OR
g,]=45T(8T:@b4<,S;O9>cN]Z@?KU=C)YD4+DDMGeL#REA\1f5KVJO=K#Z+bZ&Q#
@C0/W+/-DV_Ec]2d87L.Z(NC;+R/VN>4;5LL1M6PUJP&:RZZHNVI&F0d\1.MG&:5
W6?8M4MZZ\[D<WT@\A?A^#g\ZfY=H3MMM9Y]CCDF1/N:[c&)WM?2ASad2)VCHJ7L
Z<D5ZJ>,XO8&340LK..\cJAGG)M-Ld4\+8ZERA#10;)A)+LX1#H?&9JFF50O33;8
a1S3D>O<4c\H?dIVg4Cf(>.RVa06O1(DNV=7c^EbT_]>OdYa+9?Q9HMRE@QI1J.\
:#E9Kc)O<,OI4/ff3PL4CFW;\RB7K:JB#6JS11JZ<+_52WQ8Qd2VUHQ3C1QMB:D9
[0BEeC45[R[?Q?f&NgR],[D^7ZK]J7S>&&#97T6_P..1fG6Rb;GOEXYJGJ,LA?SO
Qca4G&f6Z8dbDQ\L0/-G]Z&:KLf24D(JEb,F+UG)HIQ/P@8^d?P[DNUGI3Q&._2G
B5&eWQ>a0BfK15TZG4DA+_HYT/S<dG;:fF\I^2P9K0=V_8<G_6d0<dX_](Ofg&P(
HcRA#TRCGg1e8ISg<R/Z<[a-?#7,7K1852DZVXV:O8H\I_J=7?@Z5=JJYd]V0T-=
3I(,=>6/D.g^TN&:-6OB5a86)LH8+^CL>8d).=3Z1&5PV:&S88R33O3784&-AN+4
&346<?afLFBQE5Q3g_UALC=:8_<Z^@eDB<0:Eg4=P<=3J]9VQcWJ1S(QA2ZIW>]9
ca?&XP]_1=56++Q>J:=FKU/cOS++C04>B+/H-8DNE7>agYEGQUFOeW<8=3S.P<Oa
0_9_>6-SM=0(=).1IX3+AE<M4be/.dYZa[A-928)80S(ODTYdd40\L7_HTJ8N8W/
Gb0H\+DU&MJ):SF_EI,0N4@(?1[E+3MVP)&(FQ/^;48/N^F;TZ)<J<LE5R7FX)^B
]T,cD77f&7bQ:eB-fWHcXK4LbEcfK^7_K[&55d\6DCV/)[c3)4a<W4BZB==P;X(,
GaS>(FJA:9^,EN>XE77(4@CL>1gfZW.[L>8<JT-g[W(&N#UJV_U)]?9BZ=UP>2@f
BM/K;<^<2^+fZ1O1F:/L#>Y30_dce=6c5^d+B)b^_PL=R6HD_CH1I<\SZS3&5R(H
]?;(-+H^_)CVHGG7B.HSM-B4e9+5d<-Q&Q5g.A-54DJ20ZN(H\D:fP2TV-/GO&gD
=X+bM8=E^:2&ga>1?[>SW+7]>-./bJB2#3W/XUM1T[?]8?Sb0AF8eHWeSgM@]7SU
5IX:RZ@U11:DSC6F-X>Y.<+B&.V18IY^P8W9/Z4cQM6/FdTL(7TABC3?#Ed32]aN
Q+5Y@;A=9b&a_+fg2GgU+D#2fF:IEQ9IRN]@@:S(WEA7=.R;dU\X:U,/OP8&,P2-
JI+;/@\^5:_?9A^#5DaQA&22E@O,?Tfb1^Q[6_a=L#[V_8K-BeO:_:0>W::c5c?,
7]2XM-WGT8._O22Fd^J7#/X7JTJ6G?9UON91KH>+aGQ]<+(:ENH[KPA@HaZ<(UP.
LTB?fAJ>\,.P1eX(V+>A2)/,4<;<)2_U\fFWD-bI;9ERGEg9J=/PX0_C(Y8\>1I3
J;>O5I(f-(^3X\&?ZJ.DTGH0@,X8(X)ed(N:/KR2bFFR?dZFTRCFVDaV8T0&gITM
ZTFS@)fA;7J(0fN(^\.>U(Z#L4-9Oc6=;VZIBXSQ>#+J-VNE#?WV]9Y&C?_ON\Q-
OdQH^CSYX5T/Fb]/IORaa5G72G,b-6Ef72PNbGRGQFVTW088>7M5#)_3g4?0MW==
bQ;6_?0(,7T(YM1_DgCKLE;3;M0:OU,U5b.U9#S7RW9]S.Afcdf&Q.IH8A8.R06A
[@g(UOLS[85E;bRM^:S:/Y6PcHZKWL^>E-Oge2fRQC/>0d+Z\:MS[?F#55CF@KR,
):^EFT7G__SVU(A5f;Yg9fRW2d^J,bT;A,]S[G,0L,2)#<e)2C.;=I<9d:<-eIDR
,G:<X.g(9\cOgF&=E9F=V;bJ&Z_Y(8I^/OV7b5eA+\[:eOYa^[QSHH.F=O^46-YP
5BP/_+>QE&&4H20^+#DXD(KG^PRN)XfFb>7P9WI:@g+?@G;_V>LPWC;S92JbI=-1
7G#2N;6=5]X/RfPZFCP\S=](08\H5IO>&+1M56SfE]H\E,=Ff_L-/>;K^,#3VGcB
fd\WPf-a&3.-(56ONObA>_I&e/9],&K>KcY^@81Y_7Edf?gbC(3=XXN1aB(3d]Hc
^1ER2DGHG<31.c&\6<L^V=-WgU1+&+ZWSVS^RE<-FF01;QeGd<1A\A_0^L-H2RBW
C+aT7(ZF=fERb7_C?g.H71W+(+86(PZDWVI]SD3O;bY94e9PQKWQM#?W8W8LW6>O
d?LLT^F6G5#8VY8@:U.\a:]2SWe>7;A.-@+19f;[^JUI1,8FfC:H:4_5DH[>HLaP
:D7U[&<U7H4[O2L0ZXUb8^A#-_[,0O>YPY>P7RN6Mce6UcMP=B^=./Y)?DO[T18O
(4]N]37/N^96W=ZgI0_agKeSQf_^_J?Y/^gFA7gcQ(^?-a:_WJFW.4N>c<,-J9=U
b#:(\&G4]P[:.YWcCDf9c>S]g;C&>?WZ#0[3;aN[56&X_GP\;WQKVYJ[1S@T\+U)
R8=]aSY:0/@/-EeO<L3Cg1d>49Z)aA2<>-gcH\@Q.]<H4_aE4&\Q:WZDeA(L0TKg
.)gY/+<Yd&6W@5L2::cTFb)Q)5ND//CBT6EA3GX&_CdT3ORfMN40c=N<DT@d4.7Z
S8b]T@L]>F-=Qc-WNR789eX4:a[5EJ.:O:,(#,@RNEA9db)4_-T-+2H^LC<e8GGT
.1+]fQXM?g@,8AL-M>F^#NZHPcF6[#@J0WE+VEaH:R6cgO>PZf5^>WIP]=P]NLg9
5)^K^;d/.gZP.UZW/X9KVLg<(A=Q:DR?+S0H@c)ZXJYU8JFKSJK;LeSZ#[b1b8>/
(;_-d(T21;XFS,D&990F3T9KAU/8-1[R(NQAW(ML^6GFBf+eQU]4V<-I8dF7XC;D
&&2R^g556(B36SVKFG5AIVE:=Vb;FS3cFA:Q?RHFK6ZP.A6?,8WELA(D78T_J-Wc
f70[fZ=4]\Vc#J[LNg(QWD4#PYM_c_@_A<3eFQZSFMY00V7:M;,W;QI=<VS7^ZUX
e6A=YE50+SJf^I:=]1cTS)?2KUd6@N8)4=2388F9<_0)LH1_))@];7]DDEJW(&X>
7@8<P+:K^8f0N)4V]Cg:S<)Oe=EL6_JX&6O#(+K6aZA&YM6H4K2)3ZIK)SGd:4T=
C+Q8f2E+?^4_XgLRebI2LUCOcMB&R3=R0N(+WH<,7F9Ca@Oe22JFOPKH^<J#bP=I
K\.VcXQ_F<7VcK@NZS1\8866I@G62e0#S=&UW?&NCQ_CB$
`endprotected


endclass

// =============================================================================

`protected
NHT;9MI,<GA1M\N>U0TE][U>?-H54UP^ad(-b\;b]g_GS78-[#8b-)]=UVe)N2YV
CMR)e;JgPfM<>JCZW\5G#P[BQ?[Ue._UO0eCEdIS]GLe>dCgW,.VOB^N)MF#FZH6
?BTG3,:6909:X]CJ7P0Of^]IWaDH=D#.AN9\fg5MO=K?Ce[XgKZD:/CH,(S54WJ8
/-HP:[4+>&_QJ)\S>[Ha[gI8f6PPV:)GKL8\;7L/Q-R9d<XH^.4CdTMb;d04U66E
[K6^J#7\Me)=a1eGC9bJ/1c(W8=@e,@)FPMG)]:b;bGK_\7=_@.UHZZ/LT.9_G+;
=QQ;7NXQLZZ(GW1.^)GPV763,V=,.aK[a,_d]&^QE?4F57B89LEPL>,KHJ,SWI1G
:Hb:^U;2&]aNV_R6<ALfLAWcf([XBW1L:$
`endprotected


//vcs_lic_vip_protect  
`protected
J^Ug(X7X7U5\TP9/^I8d\3d^7P4^)?MT?T:QUUDCcB7A7T(MJ=BZ4(\G]>>W);IR
/d+IW8(.J7,JN+.N<R#3Za8FY;BCOT?1U,RcN?DbHMV_Wf[0J3\+CV;N_L3QGeL9
E8NC548//X,&fX>CY+YF[>@-SNI#]N[M<Q/E<Mf=0YC7L#K\1gMBJ27Jf(8CLIB>
U@/O0g;NO?VPQ2:?;L?U>,aFV[I&^^]67X85f\Z=(HW[M.cfRUPXbE1IKUB3?_[H
Ie3OBEd,>Ue0(I8XC^]SA5/PP/\;Y5<G]1:Z=M.;(5a9-WJ/U?2e:6eC5W7bRW.S
3e>SFGgd&;YI>)RFS<+Tgf6]b]@[RK,VF.UZ-MB+Nf47\0(EIK4RCX2g+aI[RBZR
A+FK:d0IaZc=/]4N:O-_2E/?W:?W3dF#=UHP_I,Q^_W>1WS56;R5Ff7-+e5.(EaU
C2cJ;1Q<56U-+\CCO+CeMNJ1Xc<P4/CbQTBM+R8X+HD0X:f,)[HRD+4X\KCb21G&
UTV(3Y.XO.g@,0;e1DG)T7QTFK:#1+72CaPLMeU__1_[C></O;ZED?9#_)W:6/JC
P,T\+-,9e6YTDD2UOJMTSc[,)F]X?YTU\(dMQGWg6P\?USKF33H>C5)?aL0:W?SB
5P.,W]<XM,aeDUD3B+3De@Paa3,g3,0@cX#?_#Z@FU]Q3XVDXH)@I\X\MNVN:QLI
3gD[CBOIKDfV5ZZf56XLdNXbeg#7)WCSgZf+_361(7-cM,O-G4-&7Jd:[M@Z(e\1
,eJIFTcB1.gT.:Lb\CJ2CL&E;IUNIEcgH3\_<>=C6EP9d@gHF8B^dbD(f:+M5A0W
d578FZ<M-+CYEV5bRUYH4aDRE8(5c),bdf[5N5d45^IVHRBDR^_>TZ0YL+/7c@32
9b1=_5C1ggd(4?\ea,&G5)1G+2f9+[.=#cGc]50ec>Id#S<G+]<2SD\BbONZVWUT
]_M>g>OJa(dg(594.1:&Decf+;&,a_cM=^L)CB8P1gKZQ-=B<NKLaa.C6G<0RC-E
FLQX\1=??@89EOD,Y)7<ZT/dA[X_NUUL5G-VDHI)\C^5gG#+MA\AOPO2,.BGVKb<
GEJ+<;?4e531YdX@O]V,8+Y-2XW0?_Y]I\,:GVX]K4fAfC(20KFcVTBOPF-DT=[3
K60KVN=82RB)eJV.(:M-[b:X63WKK3F#JFQI6X_)&L@\1ggD.JRVA)L)3JFaVT):
,7\;N=83^2H&NCT)_,?fZ,FVdV2#MRWX0d2#4?(75g[?/]e^Lc/M@]@D[aO]+@6c
_ZK8S<cI(E@B_,CUd9=Z9X8@J.X^-V8ZT9=Z9+=bQL)g<=<MV:A#II?SY25DHOL#
d#I:f]7,+N^gb#>dN0[d3SLLE,e2RA#d0A^dM)OC=+,.Jb1]UL&>d;)P8?d-0).&
L-URD4-4[YSG0dE+/AOLW2A4[=E36cK\@?R^5M=2aZE:C?@^#1QFX,W4N3:#Q59A
ba_eaR-9?F_?c^,^CZW\e2221N8.9W)GV^B176:eC-b9,K-^Ue)(-\c=:0a2<Q,M
bJN#6V<e^YVI>/H<0).b)=c/2=1\/(gQ9]L&J0b&@(60LgV+WHcW[;>M.^:cXgfG
:/Wcc17V0N<e)+g\I1OP5LJb&bEfH?N]A;>3aTEXAP97L80\:eWQBI>fAL[H7ZZD
__CA?374@A7CQIR^?[67[_13(([&?_KU?)^C^70I8;54/^6X2Oc3W;_\PP\)+&2V
FML4FR.W\#6c;&NESbeSVTXJH1N<eXU0=@F)^]PDcL#0c1We,__+9W36)\=JIYU7
,K.=1W0dIM\FXSPQV#RWS3\#GW87F47JIP62b/g,;)#2G2\6b9P+Z=:R+)>?;8]g
4)VXHg#E@HU;;A<3CTT>C/&.JB6C.(b;LKcYGR8T)G>Db\/23:Vg_LP70>.QGO>5
40c#gPLIROdO_EbZDM1g]a:HM-E\9]fbE5d\ZM/_T-KM<IBQ_:6E/MP-d,,L@7B>
7I8GEGOJ5+S<0gWdKbRJP><2YUcD5[L9,+7B1SbRK.^L6AL7QVe<^N4eN];K:g11
QWL)OIgJ]dPN??X/LJTe<1IBc(D9-V6HD=YL;\N.a-<Z10J-4=+aZH5.@b^\IY@e
VP9O;<b;J#N]L;81>d(M2A38S1J5UET71GNe0=UWN<9<&#SGB_V2;gcG)SC^][Tb
f#NW38(,a<d9Nb^440N0E-28e5V4)1=>?IaR6K9a:6gcU9SMQ[1-Z\RJXW/<=NT#
+6_(?JE5U:KB+)Y&/6:RJJCIP?IHO1OUWQE>c(3g=fg3+281O(L-AgX_FNY9eN5U
5Qg^4a4W,(g)ERP2?_T8QOLaGTK-VHbZ9SI&eEVdIP9O8P_,=J2V.&cX[c]9G3;8
9:N3]VEAN^\M=+2E.V-.)=WfVH9Fa&[B9RBQ3BK&INCFMDY#<_NffK=JKBNH6,.-
3[-L9PO(GgI1>WfBC8@(M8(FI0gXB)U(Xa<,06ABDJLE.4O#aP]&T9A;,1,.J_GF
K^LKRbcB/71/69-4[[(H&=V_b=@4JgUCJEc7G/HF?-_9L7-+8-a+W[B#12V3AS:B
g>TbBV+.cabg^OI+G\_Z#EH./6T.8OE.6B>HSI4N36;Q4.Lb\g-)IC<OcZ0EAbR=
K\=_?<0cDJQZ:U,(QV2c<a6[(BB9Va/>(M@7<;faZBF6#)_NF<(T8A(IAJ6J?55X
U\BR_P9E]SZbc8Egd)&&<WNOe;9#GbZWXTV3\I:,:BJ@JPg+.;MX9LVH@3P;(PBP
@MQW1-f#4-4(Q[Y41>]Ae9\_d^:g,V(<H84XZ)S@0_8Q4<+\c0LZDX8[._HHScJX
AK?+4RK2Q?EN.f0A[1eP)\-@4X6&;5PYV.)IRceaP^AOV6DX69?09.MV\/^>_^VQ
=.]#XYg<._.A[9Z_UdFU0Q\b1^7L&N?;>4(R)GM+;TYF;8H7+LMS7g0,)7J,e8b-
A@\a2)N^,=.FR/YSALC3Q\_\7PY+f3[2VS=-fU<Qb3[&7<EPb217)H&T<T<[:]7_
2C.FK.23I+8M8F;TT&<^J[ZL5Tb&_P#6N)\R;_8=#9MG]T4D&VT.e2RCK9W>D+.H
95RY0:C6ALeCG^T()H].Q-FN>F)3;#P^3YG97&U^U70#EcD6@ZY<_))D;MW[\EX(
^=NOZ785ga[b7/HD;Q1c]M/<X[6)WAb:+,c1&bHaEZ0W)fDA:gUg)CR000[]>BIU
N&U?35IX(b[3<ceN64([aM1gH4VPEKdSJ])?+\SIP#?<dVQ.9]6-IMKILOU>aT&X
B@Ud-R&bH,4JB^C/T_#[DPDDQ-5E)^FV/CaCU?fU&?b:Z6/LdU>48KE[=WXRH^PP
+\S#XQ7SQ1<G9IdW\2+a,,QE6PdI6XIXI#N2a&FFPe=KgTW\MeYEZ-EU;_@UMB&Q
GG028HR13T29Y^<8)X90E17(7cd>a]\B4^EFdDR5]+e8M4SY>1eGU4/c(\0aObHZ
VUNX2+;JB;4a2J1(5HCDeL3adOQeM+7aR)>\&^7Eb5#.^Lf])5B@EK1GKTM=^)0+
O\4T,<NG(\P>\OO=]XAadWKLR_J#2Qf_PZ6?cgN[40bKG47Je3HSaJe6F30S)@JE
XHPR#48c(CaY@Z(&=L,aXR[MRIY.3gST1RUYER71PBfCR(/]?=U\=Z(@M].,>N9+
JY_71E)c#B]\6W9X):[?HG,-eW0JKRc/fN\+);^L)OAX6fRAeBE_G-f3O?;-2IDG
#&4<HA5=UfTF<3TZAENDH8E)I8B[)#b[cYDc(/H560>B81C:?1f)D)AT8c)\;1-M
:,<gDM.b-1L;Q#^[ZY/D?<b-WOIbK89.IRK10aR]4>;UaS,L<VM.E:X/HX:DZ&c7
L8--&CKbc1L:Ff-2KC88F;75DGWE#5,Ba.b][=\ZNC)KD.ZI9A@GR?#SA;g,7]PI
Hc&W/M7\<P,EYAfdMGVOCbP<P++gQJK#?6=M0/J4Z^Zc3)R^cA[+3R^,[ge).>[X
K7PPG;?WU@TYKD860Qe;&]_QMa/E^8a.=8]2A62K)UM3?B<H#Ta:?FFBT2[QI>IB
CY.#RE<T:3N^O&]7[Db,f_#E)0,=?YbO[/K0Z#+;J)(Z,I)F;TD>FDeTS?50eQ^U
F+3OI)G2O:;14XUPe,C[2F15EMJ[2<d<T4aCX<&+Ge5#(L/XA[.)OeV]PceHeW<f
cee,FXBK=(.@Y4T?T1ICFOT+2X\)<]>.];MW=SWX#;58a(\a&9A[51^H#Ka)_.5I
6AEIbd,5G3f7g-2]2H5#,.5Ye]L]IWUQa\.W_2#SN;.@91T)KbT@9R1Q3&@Tg,QD
L;[<Z.E_D[-5\<^5X<?.=?IG30RVA5<V/\(1VP?Rd/c6F@R]P]KEF,P^,F&O6+LK
E-a@5GQ&VcR^+5YJMC]C\KYfeR,]Q5H:LZ@&AB^b+=F2gJ[HPd^fMKT)K56+LM)[
W@0>__AgI2MIR6Qe-:?=Y63WOVEDS\@TP3J&69>c>V?e43QW4EL?RIQ-V==K=GP6
=3Ke&b70fSb8[(G1#+K+U)8RE&3?)DG_&J)Td0(CC?.?a<g)KNX0SOP\?/1aG0I;
5#NfQG9)?N.C^8?OT]QK\/D<Zbed45Q0<ML39<NFIM_1VEP;:KZ<DE35OZR(Ab#7
<=2BDQ)J5Q/I[?[7]+Te-[Hc/[/Y+=?(FX3Y\V4B;.:&3,.MWEad##GcKZB3?BJ5
:be;+/+&P\9Za1G;@OcF\K,(\f,)/PLYRCM0ON+)O_AA>dD5dK6][6I?SP-\06A?
\MS949A+8[B7+1XM0P+GeYL7E_<+g#<gfQV7I3R,J7XBN,+#WMM@QL9(0?KQFc8>
D26ZU3XSXMfO=M2RG<WCdd,.OY1R:;,I/N^G@/][ISPgQR?>F>IG8?b,>@aEQcaU
M#d()f8615-BJ\TISEW=^7+?\><NX0-&)X=RWB>5:YOYIBd))MI-9PE^7]FcKJ\N
_+:C0E07AU]YCfM[A@./)6#.<_SWN@?:Vg==I.b,Z/SUXZ)\][=<=WL.d>GOFMO8
6aFO)&/IM>?=0A=b3V1XIY4PG_Me6b5<]aMG04ecI=J5SLT/^,;@<2=#BHA)f4O^
;_S2==^Y^e_GJWAI]O>I75e)5B3Z+H;320GW\M+ZG2Fc03:\BJZcZD4VF83R]:(D
<Z.82W6dIDI.DPXWOWDGGORa3]J,#E74Be.eLTJ,cSV])Tg,7-&53#)2=)-K3.b5
a\c<.e[MY-C6fb/,;I>gHFH^IC::5/11?M^]Mb4B?61NZ5C^CS4bYBfE6Wb0E7[9
^?f/?bMF)Q,=^]O[#.OCc2Va-+AIc2S0SU>B=?75YGMeLIA8b_//((eNUa+O=K-2
<NdY/CV?A?aB8FJ#dUBV^AgFda8@.=_I[_[2g0VJc1C<W#X9-D+,2?]E=MVD(]#J
Q4O3V8dB2NV,#_\7dc5#SYLY])D]GY]Ed\,(FPAEPPJ>]gQ[A-9N.LDg2,TcFNFU
b^>L=N_a[=XU:.,c,V/7:=QE3AMA3cSCS#@TBd:a_CReE1/<3Rgc538XLDYgdBXL
F2a?&+dZ<I:[Gag7&G#B8=RNBIPA/a?5dD>E8=94d:[JdL;eZGc^ZTED)a(LWCF)
G)=Z\XX/fE:1O>Pe[<=0NVQ.UZ:;_HA+=PF:XUc[;ZgJC>.fHcC705J5G6T46^89
:g5[\e2D(2&^SWD=]2Z2Db?17T5#VO-IeHX_E1_cP5#5fc<5EYU3=,E8/[+Ce4/A
9c>[>VQM<QL_f_7+N:C(P22_#T/.Z@2PR&;&O8LGb9/+&N@;Y:UC8>c;QW]MU+#W
+2D#3=2R#T(G2f?,\@K]J,T#)HD3=Y;CRPKcE#?gI^[9KAc<LAK&P6Kd?TcOCgTg
C+6QbKN9LU(MJDTe;b(R/\MdeTRQdeM21VU;/G18KN0WSb?A9Z(g0<.cR8HJIUEL
W85>^0]W61G-D<@9cWfBTe&UXO3+;VBSg+:T4>H5PeW)GI,:S/d_g0_4M8T==^6f
F4<^&5WbbXMgGQY0Zac8[5-Vbe(,BG+S<d,U00V6PeaR#:a0_/GFHD[\^4Vf-aZg
Bd7cL)_/^VQ^aPG>]TOT5D[LHT?<KDB^X6;gD^P4[6R3SZc+#IT+)@Qa0c6Q[6b;
.+U4&&.9X_J=X2#/TWS(()+QWa/?YX(1I4)4+SdR(0C:Se(T&9[XH5V0K=9MSg/V
c@ZDLb)<A<D=?/O3X=QZc.X;M0cZ[4M5a3afF,a#.TVAcADK/^NHK/.UbaZcL+HL
OVfaM/))W^@7&4eDCJaH>&KX\Z\.;?Y>7PE;GFDa44(9V-:IH4<SPg5I:0M&bJ0F
3^QO)#FSbeV1Z.TFWWBaZfA10LEd6bUW^Zd&YG]<JN8[a&:f0dE1/9YFJ.XNf\M\
S>O,]3T\S:a4c\57d(86gW:FgL+:E>RgSX>0\+cG&RK]QQXO-2d:WJ#a2P3->T.H
fN2<7>6cL/Te^#ZYB-+QS3g,N9UMR7LU6\5af>>3FG]IdSN2Fa/,.7KI5A1Ja=]U
NPHU8B5N#;I8@I&+)J#E[XJ;(5XgU4g>7,U&Z@<Xf(81/7V2SfWYAQ(:)?:?5_Z=
-2B^?f&J(?)D&G[>^/>YSReT]I4?G4fUYB@4L]4JWVdYN9?8XWIeJX<&5TYJ6,+C
LXS,6OYTDEDWe,?/>MgZ7QU9\]0W2>#:aaM3Z&8Rc;Z/_IXdJ(ZM=A;Q28:IHPg_
=bKZCa4NFO=[=^\0V=@=.,NRN;_9B2gMO6[RC-L2bN@N1a+09]<c(U8KCF]Z#e=&
16EC;4\DAJfACNMCD;ORFFLF8#7<0=140:cCe24]#;O>fSe@XG7fOZ[ASWcg((W_
V_::Q^]T1U[>=X-9KSfP,N,?gB/HM\<X>#VIEHU=[\/W1-dIBf#70Ba:3U3OL\EW
1Ne+:#S;T0CIfeF#gb1EebfMdEL)eU<<b;\M2N95N0NaaK=W5L.e=]9@4;?S;_Qa
X3Ca=JRdEQL+,^,D#C2-)WO?VT5,1QFX2A2<@DUZOEI_^ZP;#K)-a#YK_cO74NG=
6(:S4-DFYgdU5ZFB@G60R?E:\2W2I&=Z.?a(V_OS?G-H@J=BX>)9(G>FUcR1Y3Wb
X/S7XM#eD3_+565LGIV)0fD-?^YNa21TZQ4>2EPG@;Q<9.\QJQE3&\;U=8-ON:V2
\)FMKSAN]8DcPXMR[2PeZ_0_P>OW2M;dFO5>0<IW2/F,9ENBYE#3[HBRg;\:Q6<,
Q;MRJ\&EOHI-RSOW?eJ.fZ:]F[/&a92IAd0ZUfR^O-Q5X38;[Q\#NNDYI1gCgF_)
M^c^f=[NccG,5&1Q0/0)H9@f9XKaMPCSWG9WbA+7L(Dg0FQ[ARL&:LC^b.9HcSOP
]:N6->+O?.?Y4T;6bb<8)[J@RY^_?6NbWVR3FY<;44QYABK8MYdT19\E#1IFXeZ(
;+8^a0DI2++cWb>OI3DAMW_(OL</fC9NA[DYR>^\Ea3[RY#-IBfL9aIc(]80BbK:
a49<[FPTFY67&L<4P9.d?eQ_=_HP2If[@Y6U9ee+P7L4?#])>fe:g)b[-80\C9Mb
RRJa4gC3Ke01ZGE+A^/bBF=2[>P:[3/e<fKf@QRC(g@-Lc+W?a:Hce)Z.F4>2U:M
#H1)DeVcAF:Y[FW^^H3.FX#W#DI;EfS5UgHeceLEG]>=4Z-aQ,61bY1VVL4Q):\6
?[f&:2W0N\<>MLb;=#eRZcf#5E25E/@>P^^_GO+?Cd0cP\=Ta,bH&@Ef1NM1_H4=
NI^2,@&LU?.=5X0YW9IW708>gMYE4e[B9F/aD^8bP<BIWF^)JXUaU0UQ3Md06.df
\M[1\ZW>5B(094G7[D84MJNd90KVA3UVS.\FUY1IOQ7S6gA)X?+I:cc,-YaI(RQY
D&>(64]HEH<GPYX</5I78KPJ@<\8U:^<;]F5J4[]ZZJM2XO;C;^<+D)YRX.DSOL4
<bec[Sd.K:dF3^TX8(S6Y5C3HKG9&K3Z.@.-5XBFHO;PfJ:4M8(47O#A8DO)4WOT
E9FGWF@8.;^a>-&G]TM.d,Z57L(\-O.\R&Y3E+I<A3EES4@<WF6EKIO:P+Z&DC=:
UVU2F-4@AB?6&OLM4R5Q8g0d>5c9T9TGg:G\;OYU7C>3DVf,B/3(T5TDF2+TO;DJ
g#;T58BN6G35Ve[2FAGSPEE&4WB)G]M,>921Cb^(84K[d5QS9DGC21?8J],FHb.9
@T3L=E@bQP97&Uc60/e,afdL\8LEEGPX]LA_#.#7^LS\\ab0.0aY3bPA8C+aMP\c
T4;W26_;,+[1NX^XE_\6F6/Z=R^gYJ_LTW-c_]Z8EQLJ4:0]e]?&>eVcP/^adNBQ
85CNB?6=b^+ZQe@_)4g<7bSQDJ1>AJK<e9+CB7dKJ=H8Ag6<AO3gIdNB16,^U0.L
QY\>(B]&S6@RNPW#]CD&fFK.^_a;7MR+0a_g=^(QN7GJU_?2a+:P>ca3E&aLgH@+
T>,eL[3GKR2&IB@VC9ff?:Pfa0AL^_Y=51<CFW<@A[_f9=MXZ81<2JX^Zg-H3\)_
a<C4+G)H&Ga32VY1R7<[IDA0:#ES^:1B@@Ig048R6W1LU,c2#.8g1/W[:9UO,d>Q
)XZ#>^5b5FK,X50=_9K61c/>daL(^Ff=bg5T(Ka&:U10Z\VJPKQ,4XY@XN(NH=eS
gQc)N(QgLQC7U_gRd@-08Z?(-P7R[C++0]RWb#MQg)5CGJcHVK[;fbYfP>-F5Qba
1S;c1T#>(,HV+7K<Z;Cf36.PMRPLH0LHOLMH2M0cOL&J:W_C+81LV_<L2gS[BSPJ
NdE:D;I<7ZSC@14D-D+DV8./-E90VD>&)Q\2a^3d(f:;Y#4e>-Bd??S3e)U<178M
\,M9>U/gQLX5\)ad9Y9P?,@2.e0R>).U?H\Hc?73(^ff9]/^^J/aZT2Z+IEgIgK4
I9=/TRC8>.7BcBe@?]H>7dF^@K3QcGPeeN8/8SH7I2^,aE_:\bfETN[eHG2&RX=&
aA/AL]Q5]H.5VdO(041aeI6CLH<HZ,3FZV2)>H-d)>b=+M,eE3Q.OEW+.-WGQ8[Z
R#YHbeDM^c?45EB]cV_E-2eHV^8Xag&_6:+OJW-]/&V/Me&D3ab9c@O7d2:[R):?
OI(2F2e7_Fc#24J+CNe:<FOg92BKO^d?4Q)S&T8QL)1g1\R<Fg]5)IV50Y\;YG2e
P5_IS[AZ)Z-I>7<8]ALL?Zb?+)@W#cKWBQM05XI6W&VZPBF<L;0N;?^;e[L#gP>b
efMY1_TI,,C1a@./L)P@U4YFN7=_6R-E6]70VDA4bNU5QM>/1c&fc&/g#&)cJa0-
Ab=A2/HTZKYaJ\<J1AC-eO.fGW>4.&gb[D<NG&ET<95#?SA<G;R_6+G^4)8JHF&(
Q;ge;fKNE&XRY:eS\B>eE;N_Vc9O2PJMR-<1fWAJ9>CBOCa.-c\/6XCVgCPX135V
N7(<\6)MKH/K^gPJ@SR5a@KA:c@:Y3KIcQb6Fg7b@+>\d,ROd(>FdZJCHP(cW(T9
Z(+@HL\P]]S@^@U_1HO,M8XSIXXA-R/?R,E,OcR_dL&Q7.c0_c73H->B>-g;.B#;
U/KS51L-BCaT75CCZW80=SSX@N6:P236U<VM3+GYcNL<;c@<-R,KDAZbCY7SGBJX
[R<DE<+:EYIe1b9AcNIg(K(G)##+NN#F11gX_[ST,-a[bfEY-RRa?+Q0/&)ORV2T
#[GF&W,6?Y-J[\H\1-M+M6U3FZ_f7.M[MY(2S8NbF?R8:Lg<:I;I@SCNYfdMT]A)
0cUNM3gHVc@Mf4HX;W1-+UPDFPXPZfS;WSKC7g/+578I7@8?[UM=d?7X[?<2g@<e
AB)#RL..g_<_g.4Q>.][Kd3/+B5&NLWa7M(=TW8GICZ;6HCeeM&CTL,KFKJTKN#f
-(cggDY9KH)fO(40Vbf8_EWLI]C>I4eUSHd_DC:,8aHAFI?cX#3200,Z_/a\-JZO
)Hb<_1EIfHe;1.NZ(]M/W#W.#((V:9\K(?SC1),#XBQM0&I1(G80e=BBb,R7\7^.
:3G\?DB)<\;f-g>Cc]+VQ2:)d?_+=c#A,a938?SLN/SMZU1:+.>M<=P+^:IA28J]
]bBWL\BOQCN?P)4X#;G^f..&>-G5fKFEAPXcJ8.)M:,@@:SHI/D^BB-OS:2FYM]8
A4DRWRSB.:GU1UB(_8GbD6EVSgM:2B+MUD4U^;]O,1OK_-^g4LP[c#,+BgKWbRL#
g5=TXag/N+HD^d@]e@/O5IEMH&OAJK;&\Ma6SK-+?Ya6^Nb)Vg52H\=IcG</&&-E
K&O+Q8Z\@De1AHUCSG];0.GU#[)8-d2&8Sc\.a/e-C8YRZK<6DXI)?f:4b,@dg<R
-M&5-3CRX,aD9gUBR8+]=cZ06KU;A-<AAc3#U+f,A51+.,G]\=c3B07NgZNa0J9A
,SeCW-XgR:<<[<;=^<Oe=(/3B9JIDSeC<9M>bKA/MQ34.?JC0V8VXfHCg_L85]32
?7X@W9K<SgbFS,0F^?2IXDc0#L+-)FZa1U.7)2Ke.?L#fNVa_9P-,4>P:gFQXOV9
\a.J\#+BY:@^?a3;&2?b9P1[E1<I;S#NRcCL:aMa&<K32TgVF55gGPF3\N+&WOVK
@C8eT@2=684?@-DE2SO[G8d]H@CZ9^G5e\/A2a^=\>2Md3d-XD;KLJeW]dFa:MHX
<=K;V/L>?9XaX,\(DR+)22?[bgXFBTeM1523,f7+3:CcgBAXRbeFM<[AS<Vb+aAR
QPL=;+/9gH5WF;AcA>PbD4F>ggg=Qf_d_>>f<;9Xfb)Y@IX2GgRO&f:P]7-a:D^P
e[UJ4GYG5N>7AD^89gGVOV5Z:N0Y\Z2c,bDCY;Y^Z+eWIR,PXc14f</),@)&?H&/
e\]caN>\,e_NIW+_5O5gT0UQ..EZ3I=BG&7O-.^ELMKY4eOGOaE\RZa>J6N.D+<:
J8@?.\M7.I;VOT8C+9X_K1XZ&LG\=Z+)Ab\;f)M=.IJXP;#^gN]AUF9TLOE#b=]a
XbRO<0P.:>KBe2.MS&C=)_6LX[=-@c1M#1&0H3J10<YCGSH9G2D./b7+>6^\:A0U
bMU9QNTg_NNZ)(T+d=.@IA5#G>Bf-3;I-@bA0RV:Y/LCJ@TW3T388Fe_:Y&6S39C
92/J,D5^f3+)<(>._IMVAOfEQag(-&>CAUdS:=:&H&.PJ;^95_00Q\B70e),87(U
JfJb_6gN-#\&R/>&Hg]WgDFefIB\^CS;caS;00U3#6YDW)<[>)E\RH?LP0P@d<.I
BKX2#\WV3GBG[X86C68T+N_(E&Y[]FL<M,VFEL:SHc8BK+UVfW7\?XHbP,T4O<U+
N:eEgV(aeZg?7(U=g]NC906.+2CR&3I5Ia#WQ+NP:-URc=Ee:^ULZWFIPSUPWL<S
4^e(45#IS&FNE;]98)S;3a<C\GL7Y(]RKS5a<5<FC>,X+T@/O-f1NK#-(2S/5]Qf
])O3EN5FJYReH+_FS@=Lb?A15G-9S-9Ag)0Cab&RQXX6I,CKcTL<-.?F53Ke@_^>
11DVD9\>1T(.fSJF#9^7c+-+BJ#CR4(][+6^b2\:)+SfDO>C>3YdAWF>3C6=G2:V
3LGT9/L&IC#ebR^CL7[&(c9L/aTIY+QW)<MI_(O7dSdK0L#Ka8(\6Cd?@f>6bU;R
/7OB/_:_>+RPF;/[74FGgDcZ11<Ef1>30Jb5D:[6<@\&MdDf34&fB^bMO+36;&P0
RJ[X<UO74.J<-eCK)RgI#J-I;SA(3Dd@A4^RNM)OI&1F>/gPNM2)fa-<3+A2?J_,
Q\E>YOX?^JTdBB3=0KQ>]^TC/Z>W&@<^8D<:JNIAVJ,Y@cf94L@CFdCC9.Bg<:0(
d3VYV;6:B&^V_\C=7K8>I7B)e,;O6>_,d=&^]1GPI(g38IXa#7((5-5>4E6ca,Ad
.I1g0YMZ3gI.Hd2&_1cNFFSTYDTFDEdA78\,TS:B<dK1HR8V2H^YGA/AE?7W8I(H
??Og#OI\f6UfU7.\[603_/G7Q<7YO+:YX#P>L=OeY6T[LXQ=bTWg:6M&OcFf<[5>
;/g=fMVVJ+N?8/ZZ]QRDBNMf0,1SW&</2]39BO#,Fg@gS8R\L/ZP\S0FXfO-;c:g
=J5AOCZX5U/)5KfK<cPBF+[;#cJ+fI--O7H.5[2<@3@CB;^cf/O&d3aVf[JdD2aK
DOJ#FRIJWQ_a0gKNZH2=LF;S\Q4OA4^+YPEJN/UCKLI#,Q/_;OYaH7;:_eaE.M:Q
_D;Cg&I^SLPd,E(W:&NL,.SF_6?L<&D:^S7J]W(Z,[EEQQY6O\MZ;A-^)SQ03<:>
V>Ed3DSgKd/b7QdY@_L&@^I[&E?V_eR;-F[HP]EFC-M-I\O/3-_\1>A@<DE<6L]b
c<UgdZ>/-d6=e+&I:2A2WU76D-Y_>TAeJ3&KOKL3:H1]AMYAVXL21=RPL38580@+
AgJ(g4EHI_ZLR[TX]:R/+0HX7<8RR+6)bg/HC;Ea;PO3dXB&J#1OKcR)?07RR/Pf
g)=MQZKBH0-=KN)UK:2><UZ3LFQJF>Z@)F?-g&.F=Wg5O\W78XOa=S>:=74a\fdc
9eC\#4ca;#29^RGP+9\?8;E43.]GO[+&M313VgOfGTdWe/;>Q9W1#4d)D>/e:EQH
&OX:Y7,DM:daY4g2Vb&2P5=b=E1gHB,:EfPP;4d,OH@R(E:)S6e(0Q5;,TTXGUP5
MFFS9gR+U1=e>3[A:/\VQ:eGDW9.-0e_U-7-^b=2;&M&(T/eO?\/&?71\+GJ17F<
,RF6;a1GC:ZP8U_=+_:_/A3\[cEI#8,a=]]FQMA;72:EF?[9S[>_a<HKH6.=Zf:V
;=PSWVC#\8BaZd>[2\Ufd5)Mae;Of?eHU>&]a<T_a\LWL3.Id)d5B#IJ-F<YXQ\P
F_YD=FTGd;SeOX+c;/.S]>EC8QR.L22N^:#Q#<H_>Re.[9g(;Y:N^8AP@]TeU8_I
R5+I&XK.D_QKgT9Q975DFdUC3Q=5;d@<4\Gg0T=C4g;<AWW35K53(b#fJ]<deKLK
3@>H=^ESB.#gJ^+W-;f0OL0_eBOARbbWU7)DfP++JDV(+-=&4SV/FOgE5Ag)S;f4
N//R\;>U:[1:6J)<HW=:)AfXVOP\XWNIFWFE0H>B<KPK(gHR^VEJW(c?eF&IISFc
L].LMF7)3:3MMf+,]-H9Q\2.DSDbIF[@5O-(e;9PL[_]KL0C)b)F7C/W84Fd01]]
UCCQ&+\EF^Ye;X)4DR7=POe1\T.VN4Q,?4]5/PY^\YIV)T_O0d?L_3H+.Y-81<SY
O3>d+.ZU[V,XdTF2cC0;5#g5>S#)0b>-L((;ZQQKHE:^c1W[HZYU\3We5RbM#5KH
IJ7>FIG]B:>7.ZM)88D214@J:f,72TF;RER=#P)<WP;,T:e&9S@^E41U\#;=QZ:W
3OHGeBd:IUWC-4]MJWN,?@&?N6TBXeDJg#MYe#0#3[E(.cK:KY3@b;R1b\Pc\T:e
]86K2]2W@0)NQHP(&fQNW0O@4g.H1;1U?dWVCNYC?VRNJ5KI<cPdA3#)/9ZWGHBO
Ic_Af+76OMc_H7Kd8[KV&2=>0AVLU=dVF&4AM<;:;FHCcVDcV9=g\Zc00_&8JT2/
b<-[HE+<SR?/4/<9[7cdHIDZ(B.F8C)b:UW?WOG&YY[\LLb]W[L),&M8?&D:.HWC
5-Z<PA+7_N<MFS)fN=&QMae,3E\9S+486PaM=J1TRZK;;/Vf;1d(ZI+UU_(^QG8W
AadA/KJR=37^1/J=_aeSJ8(6#PCc\[S=XX=Q[\+B[7DP5dG10>?]T8V&K1W/2,g)
WD06B2e?6XY4&2RW5CQ5-CASUgB0=-^+5/39PJI\<YB&&YUSOD88SY_2R>PA@#D:
ef;O8SANA.,C]N]MA;5S^;;Ue)(OQGRC-JOWVBMc7E1#THaWU/T<BTV=@Xc>Q#A4
V#AG)O@EHDafNbVSU:[NU^2?9G\1\]g+,fYA,K:4A78L=.PJ9eRO)(QR];602J>O
F\_a2=TZF5A9P:9<,(e(R[&0>SbE^=:Sca-JI]0XfR<)EOLaO.:aM50g(@8Y=6BM
A9Rd#1?\O-X[^5f<&+TTBU;Y=KE+U\#&_\G21BC[2HE<([P26WTb#9N2>Qd@#R4F
75EfcdH3_X-UgQg9S_If7(cc075UCGcd>8;6;@UbAT,G4=V.EP/J6U=_NJJ?2[M^
.,cU^Y+MQ+Fd(J3.1NME(973C)+EaSd?HM>1@d&OgU_RFc&X&;cZCF)a6-8g2V^P
6cJ;YCUH?ANf&72KAARDU_bB/O)&#C1Q,K321c#+UZXQZR/)#_9@:=@3C<I0cVa.
QW2A[3X3;][B_1fZ(=V#P/O=OX7VJ//Q>a(Y4SS@6R6eL-bbcZ3/X5#IQ->bb:fd
])Oc4,+WI/7<L+Q-U>_D]-)aUN\#P.&f9#3E6C[Ke)aN,FUZ([cS)5[S&#@(8=2;
X_)X:(Y+UJ2M<F49F+/J\d#XQ1#,K^Cf11<9:S1B-DcG]\EJ@^-J(W]?FJ[WKGG_
(Hce0.YaTR>0E4VQ;3bD^)g6<>YL]+gB7[<&;W).(CfaHUYg;;;4McbZ8R2PEJ:H
<A,O]J@RL+b=c(a=(,>GF&_U1S^31NccY5C\5?XbY(^CW0U-acYG#Y_R^5fdIDY0
H;LdDXbcd0fWE_aaGR/I@gbK4R?1P]8T/69We+J/>g45H#7E^F]^>+0Z<B1,)43)
6L4,\;GM?TL5Ne+S[&:Z4]c\O+^-+GT)G&>eQ2=cR+7LSKL;-g@a+J2-3C_1<TK,
V@RX_X5@7:9Nc^L^LX7-@11,g-PU)M3Kf5cGc0)JC/P[,g[#E^BAX4WV?YEN,K6@
<&L]:]PH(2fJ]4/@e\.>Z<gJD=bD8M(70@H@f=70T57UbDB5/c]A]W>(B.PXEQcU
I&/)HE+W,=4M^LNET&Oe8[KP-5U?^X(;[[(=[YU<B3b7aF,#0Td/cRg.cg^T),SI
U@)OegRc.-6\\L+Z2KX=D+,:K2<.3fW>R/BS8F^M2c6BgBE;9C=\4a.[IPEgPGeH
QAYBJ/D9ESQ8PfKZY9XQ(.T?,PK2456[<Sa&_4<<9^eT^.@9OP3^U-T+DYg@,X9g
./S33#-=P1Y>/ET:&FT>gNOMZ#EATa#M>O9g+(D&<3O.=KfRPIL(4>&e4,acN-e,
XWI8X4cMO7JOMXV>>S0JO&PE15UZJPQ;^ETNH]?[(]BgaI,;Tag7WR1#WP_f>Q09
X857L,32be/=-fX^,7L28-Y=Y1179ZL8KGT74^18EC=\0XDDc,?L-M]<I<YHIQ5_
)<S7U5N)((RWR2G@5V<&NQ3QT=g^[OSXCF.ZNC=^(e[8[W#^L,QPP4E];DD(92YP
)5@=:Y:>:0,)W(6/PMF&\5J;<K-b(T,VO[A]0D:I5Ka1C&Sb,&<>^:e2/0H)@VLL
;&8=Q5MBQ(QB(_LQIRd4VS[bdMRd2P7R=2S]#J_2\\(G^^5e^A9WD@X4f=.YgY#e
5N^&^1O1d]&4=:SPN?1\^>Y3LT]B_d<8/CSL>LQZB4QA6=8GI,c^6THN7[X5+ZfL
BZe)+=@#OS?3&_Wb>P<C.IY6])OF^dY?a:A)UZY^QUU27-Q&;R:O8.T9_cB0O)^?
F1X&fbNXd#X4/>BYT]+CD9f;aH8=+E.Bg_<5gGYB>_[(O_.SI&Kc)68D>;PX6M3C
6^(&;eBd09EU2LULUNQ7b5_QPUK40((_J6T4SM/4dC#.9e>Y\NTIMPH8_=.W4XGL
V<_U<C=6-5e#W\I,-H]N:,53^0gOb7^9IW310HF&)Z4.3):[R[0:/eC,6YV502@;
D6UgQ8Z..HR@L?bFa,CA)M7(2DX=fXZXEZ_4HIb/,^gN00b/TU&I4:;=@Gf<fIN:
Da?gWA+K97^XE9SH2F.V44H0(F28XHD^S>_-/\HQ87R4C1XeLR]FDL9+H>IUCc8>
VFV4a\#@EBTgDADa6FM.HHTgJ23TND;S4)Ze0CO^Ma^TNIbQJ#&77+.)ZUW/WG-<
;CTZb(8f(fa,V<eJ,;__ZMG)aJW\GU,IF?N8?0E+WR/KVSdH6=Y]E83#T=?(,GN?
<>ZP2W[A8+@7KR7c&R-OLU7+@<Ng5^-YAdP(-6BSdeK,])fgA=J?E8.8:-.6DH_)
780CAOI<aM\KF.S&RIbXYWF(^.U/)BD;U_15:KJXTg^/fOGZecZLW[Pd9aE,3/4&
.0O,_PSIKd\R.0W>7bfHd;30S+C/He.6[:8-(@.+B8eRf\&\_?(R:N3ZZ?^2-;E0
d(/6GdP5&^?Y,M0Z;CQO=@W59Ag+GL\NgG>O:Ng6fF><D@E<9TfL)A@:(b8X]0S0
A\d;bFIA8,@?.O,P=]C-^_6aR.HUSg6^BZ?UXHGAfMagBLY/Z.c=FWd.O9BW[>1?
KQN)).TABgM4H8\4/g;=1L8KR5ZN?OZZ@gV.+Cc8M=(+EaRF[[T>0W:d_2IEV[C2
X)R6ICXfH5c5Y=C/\?M6:&PODTHAb:c6;((64[:DfaLJ9H0b4(40Q\bX+a=,,UEI
;T_X?Qa=HMRMZ9L?5U/EeH?(XJ.I;EeBdD8=_+fgDYP(;Z4-UV5\;#F9dQ4<0(/3
NQP1P0Z<^4NeT7(/H7:4(++_\3>?-V5)_N&V#T[QT7TG>bB7:DN+)6&\e38Z6L7<
b\1#e0#+<R,gYO/cbe[&I8Z(&Y.VEZ/^A8D+Z@DV<S>5Af,5^78J)@&+a>eD?+,2
QIP7-,_W#g?WafH>U1V^0#WfB(-QY8P2:V7_A>Z4gZ\]CRJH7c(c)ReLH9f?S7P.
HRbcb<=<fIR3>d_:RHd5_EFH[XXgPN]&6)?@</7)8fP5C(8(::dK\A>MI=g=8R3O
D,XgN_Gd&3;4d5<U^PUbHB9=B)3ce):+Q4M6S?S+<H5M;GCS0gH8/TbDL0^+J7EY
S9dabW#fITWb/g-:fCeJS.&CO,[Cc5VW.S\2)19WY#\P<:[-AQ2TLf]5+GZ,0AX+
Y70\V[^VT,>EP?0de44e2K=]E-GJVR+)DP>Z<6.XNDTaQF6HB+V\3^0-BLV;G3K>
(BXG(J1-EF>5TGXT6).(X6/<cBGg&^[(0A&X46]2+F@B0(+^+U-KIXe:C]f_dL]L
7D+:=-S<I[S-<W83=N:QZ(232<7/:F^L/;7FQBbA\=_fDc^.HefD:,C0Y=X]XAB/
JJIcMf0Mf31UW5_X-a&+=]]+NYaZ+Wb5,XR&B/]6BgLB+a@,,B.)TId+4N5NQ1@F
L:1\2PDV5HP;341+MZ4NQ<)KWAb=#P.-(eYR(JM/C:CbKZ5A@ZJ-D3U=<S,&B93A
<#ASX79C;C5MD_MYZ>;\Ha-[EfDKE?&4_Xac]5+d7aH(=_K<UTDX.Q)GU+O+;881
U.,E/e7^H);]6OP@EJ:bL1B#a_#fD=]QT<3SHL/BSd?1:a-@K0G]E3-?\d=B=@:T
^W#/>2+EMZZGK0_E1#-_>?JB\/ag&^>Lf,)K>9>XC-L13HgJ?VLN.+f[<QX:9IM8
1X4[A3YZA7E^4;-9.KL#?LU;dbe&&V]2QM40PMWd-C#LXJJ&gK)EST2]/:M;6TG^
QK9(SO3_,5fPFURG0BI&LL0g[X?-;d5F2_d<cDgP?0<#\C\#[gM+;LY)[K5I-+M/
8DCdJ/C0(.)6Q#Ca/RQ,U^ER[GK>DQAQU^,9ELZQ[A1ADaQ8][;+_:/)\-ZJ/ff3
c4M+UXPQSf467Vd[SgXL72TP^Lbg6c,MB/A(dH#GL5gY&\0-5DY:^&8_[+/aN5F3
&be/BgJIYbfWeb4C459/.SXb,0JMUCG4)Wd^)fSbB+(3a#2C0Z)&^^UDF[DAILH5
;U,dU5Oc?I>7HCFSS@@;#9VbC1,1cgaRBQ?:dX]d5WOWa[6&>31&4Xb>P2FGQ((S
4J,(c;#2.=?#JN_2#-L.OBH8U3TQ-B4I^<B-D19(NcL_0V3.4_FZQMFC0XLJBKb5
N2KFC3SS0H@8/@0[-eQV<6DS<Ed[9]V/T+S-BQ&=430#\_/7^454SF>][g1]f&d\
7bGUBDL2aFOK(TP?bK).AbNV=3]OE.5BZ>1GaFe=7H_;[IG\cFUbfZ<20;YdWDFE
H[aVdS@7Vd\4N>]#R\/C+RFRF/J3PG&_gJ.]TC7VfK=O))c?FVGAcZBgZ(.F6<-;
4(1B01;CJ?JBGfY,ZSGa6H]L;W+<9g/3RNYJ&.XgU-CdPaS,_6W6/?d4^+^F>)1I
7#_ZG4X+e2g7be_.GL[9e/C&75JI5I2V=MO)RR7Vf6dT+HU@[>FE0c(VWMQ@JaCH
+46_2+)G6>bBKeQA<J9J_]YYZDfd31;-1K,WYXb)1UUdJVHGa_530OH2P3W3K=Z^
fV0H(O.?LK:3Ie?PQ04Q>MP^XP[-@5=<#4YPWL\B;fa?OcQTUQN#IR[U+R1()T.F
=G0AM4ZQ5a8_00<d,fD@60Sd.Qc-cK.^@.KKS?W?;L0;&B6OG0Xf1X6DY,DRb0DJ
Y5<QP^^_F<fG8V,bW[\-#4P@\#PU+R:Z2#L?(AYB8+[F;7701TXOPb=#3N2R]V:[
SLYaSUFT)=ARV:cT1E.=eN8aR=-cM>N@_Fa&39(9_]A&f[?>_Q4N)fY&E4QMQf,Z
VP-&\;3?JVccgDK-ZWCNK_<Q/;.8ETQgT1><8c;CJD7-gUAe7GNJ#fS4=OU1P@&;
gbJ?>XO@\eS/;@TfcNBRMM>)cd^\-4J4_XUc.)9fIBL:7<8FPW3BN8b1=#ZZB\]L
69,T/WdP2AE/Od?Z?f9=.FTH]=2&M@9fdHI@JT<L-4:6@TDJ1A:VI9gV^151FE0T
&I1TU_\_XE8#4O0CAZ<]N4@2bH<9:#>d?[FE/5aC[+fHd@66Nea^M^=gJ+1OB;Oa
89)MT1)SDI;R#:GMNEA;8?DdW7\SEHfKeHd.&:UZN]=I91VT1L+BISZL<>XQ2[ge
>9LH:>A,7?<B\d;HWA@a#gD><<dGa:g\16eN?D&L((/0-Z)/TeXSD[Z46,.#B@_Q
\HO,0DHQV@#P?),E:-[VL1gBcD6:/=c-CIF\LP@bB1.fLOA\6_.]@Q_:.=Q7LT?e
8fSYcTBE#gdM,0/.FUIZOEa10b2KHe8ZVO,#SC363IbQ[-+]g@fUDdP6)J4:dQW,
(1R:aN=UZW[e2fUTT>MZ.3BTbWU<GWL.8B06[O2@+/:]>#4;@QJe9KJN\H&\OSHI
<GJ])B>0YM3bb-7=#:)CT+U^K5EY,0[]P&.?):2,?Z\fN#8-,-2J;f:DaC5.=&ZA
6(2@2;\53W=c48a;S+6(Gd4_H?8a,RE7;g=@&WH7H#3ZF664J>JfMMP@G9N<\>c@
e;Qg]d0(A6;I<c[4]K->@@.(3JI7.f77/7JfR+[RaK<WMKUU83>6gLOBB#)1.RHV
V?.+e(-99B.1PKe/5EaY&5PRgFCL0@D_2L1\64W1P6\8^9-M8AZ9EWg_4.=A>7H7
:b?HC2f_AVa@aU-g9;CO_P+.3c82HA116Ra1BNGR?(LP,Q_d11f:]6(OeMEQZJ/4
0XKHASC;,0I=#.A2c>cM8C4[2O<AXV7.N1?RLX64]:^L=#,2HP-3Gb\f71=F;4CY
[)>gHIbQP#(68N#_17->e<;La=&fVJU>,I#TP93/4WK34I@<6A(d+;E6^YU+G572
DcPa:JcZ:S#T_;aBF<[]\c?Z6-a+@SYcLd;20]Q0WQ8]I2YS;,f&e9[])ePEHI.+
fK^,d-DH1AgN>,<U9cbJ7V(d]XG_2UXU7N1)S6cH]ID3(04TEe[=_5<^+Bf75a9\
&a\cPL75fTR9c1H?TN<gbI/gfa--<AE:3[UJ6^+:Y2@<;5/PFW;dE)++H>.97BL)
2C8?R./X;d<[&M:CBY0(A415SWKYFf:VRE-L86/KA.?I)#M6&_^7UHROESL3XPNb
6D(AOg=R7:e4WR\#U+B)G4L\=Pb)_<,33G:DZB>aME];fFGIBGbHaYDHX>OT2[1e
AE;T<?LSCB_FL@UOGgNgUF]KQH39<gQIPS:I[&F:392(L\.O6]\SSM&)QMeUMH80
4cU-T?e@JO;JTKA)ITW6c4RGG-KKNb//8M?--Z#RE5)fW55KCTB?D33YS9@]eDPZ
-(f\2aY5T2#MeaV:]+I6CNHFagg-bOaU(CZ7RY/@AbHfE$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_UVM_SV
