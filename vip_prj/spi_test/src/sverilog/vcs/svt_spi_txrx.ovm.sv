
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
FV_/BV1C/f5D]TLSQ->/Ad@@Xb42P\4P^9<e+]KH#L):Pc>-5?g85([(gI_=-Q\V
WK80Wg73N6b[YF@RL5+Bg<42FW>9P=//:I?QM,1d,CQ/2B5>Vf?P++57@gKeXL50
)TY\JJ8gO/QW1(DV.TI^G0fg;K\4-Ha6Hc8_8Q9X>I)AN-[6P^f=O(+(5:@8YT,[
VG;.PROZ2-?+L\#?Q\3&VMGFHYH6=U\64#ONV8/WD23-;))UG_:V=G,Ga7IaBI_G
]aRM#N(HDg,VT@2);#f15EMUZH);eW=KfLU+UgWfY?VE7;f0SC(.c+EbQee&^(-7
dF<X4X]#<QV\GCQ/QVFZd&ZOFMV@gHSBEB9DK09/7AfVN=RM-DFS&0>A#;CfHG=@
-2)9GLI.9H_L[\DPgPJ]W>LEa-JE\C1GN<e#BFb>#4F3V(PLH;OY4V.O5N&D,,dO
?EE[:W)GK5WJ=P:PJda-YG<ONYP7.4E>D#3<\c]+YPb&U#B2:[S_J0?V(M1BMBX6
L2?^g?eXNW>2f.X@-eSTE:JQ,aPUO/&<G/1_6g;PJ=ZETEV0X@QS#8UCCWg@aM+e
;M,OE+GK/0;I-^HN,J/IV3.#Gf5@eeBgLW^UP<S:U<RSaFYP_4=;XgfU0]B5;=B0
P)[+2.NM#]&Y1.cU(/:@TWcaa7R9(090/KSX8L225&0:2]I)Z^+HG<9d1>5K)EHL
W&1Rf>FS)F&JZ+\GCP.)=Z>eL,0HW6\T:6&+fVV4dJR^7NEP5+\&ZIBLY82]M(,]
)Y>=I3[O@<UAD@Y-1[K.;A^a/Zd[V3T(5(G,AP26.KbI>Ea\VM\@fcD<XIP0O8.]
W3(a,8O]JeSU?&e]S:gCE@T7?g\;E#;@I_S-9++[S/D9NEW^;^;_f[@IAC[6H>;0
dCM@(J;++8bCKCH+29?ZH#T@Qe],f/.^Q+fJ66G;)dU2N#7OTY?bHLJE24@gIOI]
(-JSHI-D#A[;>I]3KG(BVc5:4LOe;(EeT6DAXd,d-+F^g]FK:g\#C-I,-)Ed[Wg1
-\DYbBQ_#aC)_Y:0SIUg<^UL]/=d7<7C1.K+L/b)6MEBD;>^^4MJ#_^#5P1X2(1F
U7402.+J?&35FI:LR2#R@MD4aL0YBIHZ4A^Dd>R,(Y8G=ZXE/:S\@g@1.(TB?3bU
KCJ5_2FLWfa8:;8<ZGd/AS[B9:4N&KceGdd17=YP0X/dM5+HS&e?L/YF<EaU@c(f
DF80VD9&S-[3C58YX8.:Wg16/_2._G3TH]3>5QWH]aFe#T\TUTHVM=1997\VFa\H
64f0WJ=KO&CK;3O6763a/gWP@Ze<>ZC2RGV5YK<U\gc6]55=B7cPc/\4U?#O8S<0
a2?33EMfB+NDbeT:afCL,13K36;.>e/E5HI<C-A7?@aM4#\UK@M\bY>D_>6XP6<L
6[337b:Q;B@T^RDJa<9>NY^X0>fC[7GM3bI_5Q@?2^Q25_f/M#PNCA+<P4N9g.#(
+LLfeKdH_b<W8Q,G<JNVUgQA/#-LA)(+]O^-4\LZ:VXc3&=I315.GPb(gA<bX:@^
J2g[c2,7V;SSDD)\1@1LP7K:>4DS(RMB1W;LRJK&5B-M\ec7+RUD@;=-7/LSUA7(
_^[\?QP2(bOKXfXTHa[A.8^?LM5YYg?(1J\0W/@0FF@N(R?M>HJW/[B1eG3C[XO3
RU3Wd+R^<>W)LK1[CNFI_BBgRA#)V\W,2A6I21-b2<76)=TgETAV,QBA&^C[K=VT
X5H[:5E5d,J\\UQeW)2H?A4c0/&[VQ,1VW_V0Raefa\@BcTM549.CPGI4Lc8=OEa
E\A_fR\R)OD5a91>5aPN0P@H?9Q(,.-/-RM5J([&,C&V;4aRCG)W;>UPcR&S?MIS
T3aKa=-OE841eDYXe52BIWI8@TcF-NF(aF^DL_A[HCM3-O8<&+]C]IfY,OgNH4dE
OL04,,a(DGKV2<)A)><[Z;S0H4EO(NADICO4bM#FY6G(6XU]L+;-[Id86X8e1QRA
Sc,7<<Z04ZCNb9EL[T34:I.]R/62#SE6cWTJLC?))>AK2,bDGe;N#eP+TBM+B;/&
4d3GXagZF-RSZ7,4>]Y?,0?D:HeY>YGfP:5fJO5\?W[3[VNP2YGC?+JYcCf/)1;b
9bXQL3PNZ0d8EGP1\4c>&cb9G;L/dV5_45X_HC5Y/>[.GW6>TM<7^0gJA^;6GfP5
>f[bFKX/&K^GgW5@,-1X.J@c^#CHgZ)\>H(_[S5[4=)D1Ha\5I[eE[7Qa&#^\,d?
#XL[TEY1Z3X.gE1;S@;H^TbN5-BSP41ITG/^^X,f/M0=aZR854Q-e<B40&0-[@d<
F,5:6)_7+5>5ITQ)=//cB2QM;@>9fbMF3,K5-SOCJ,DYV_d/>571f=9,0HP_F&4F
N1)D#g@=,RP-H.22f0J)90bI@O1.PK0^.LJ7HHD60fRQEbFS]<AgL,PJ?VX)F(-X
4eagbCEX;YRF#;>fQ94cf5G4,J02C+T_JdTb2ZSIeB:ec,W+)D5VAY[>MQUPa[.c
76++PUK[&D?@+QI&>a]?2A7Z;U8d\e^<OMEe)5,XIHMQ+1d9^2^QC#9QDbBAf_#:
b8gObdTKUHM3_SWC5=/BW(IG^A=<#P;gK49K\,<SKS)GF#G36/N=g[8F&QdJML1,
?,=MeKNOTFI<2:XX#5]49.S;_^S5XB0M>Z;@6P8VZ?/(DN^:>+]HZZGV[.+3<:&U
X+/AN8M/IJL&(YaQ)V[,YX#G4@HF=6>c&1g]bO05Cc21Z)-&E^.e>BX^MTTVF8:J
+V=Z2bMSbUTPUM89CA@ZJcY<5e=SYBAHdURD_@<_.=VT^\E^6ARS5a:;;<f7YT=J
/Q_He@cZe4LgIQ[^1E.<71YM;A_47;RI.6H8P>?-9#3MT9EAZT&6S9AJ()WUOI(L
-@F7Q.M,.A)aQ#\cB/96DOAW_04NU>A2&7e)b<f;?;=DD/PNZG1G<2d^F.TTfKd2
DFSPYSREebRS\Yd8<c+H6:(aF<C.S:aB>)+6N37Kca8Q6Kb)4K^+8>LX-eQE9FVL
/BT]0TJc<_X0RTT\=RG^1cBNDC_R[80):C8F+YWI0T\PSF(WG707J6BTTN[X2f,F
_WLU#=G]4beI?#SQ5P3e2BREQ7,cR7-0V=7G76gU.Z.HCE@3Af)O#ca3#1N]6Udc
+QIE_S0X21<FT^A^^OdU5:0@/:1@c#d2,@M&:04E+G/L1VP6T;=9B^C/;UDGOL>#
1-O:(PY]U:Z2\-EG^[W(J]DW@]<_2C\W5@4\fe)4Y>\/NY4=.B,f++1S[U@B][<C
cfLPMPY0NHP4.RKN#GL]ITA)//:YZ(:dZ\51F+2^X2,7YUL[f0BFR+NZac]aJOg2
K\:DKMOVD6ba&T/EdWdA2Ac(3/6;+T;6S6aEUD&M\DNgC4<<N8#:#_.:Z&-JORKN
Y?9UgTVW7,B9]&:B3/()Z<G2DZGVdE\;C;aNTBcS7/9K(/Q;9:GJgZK)Kad0g^DH
=]OdfV^eOgMH3/c\0,\eWb8ELc9]:d8T51X,CA4SO<#M=H6TcP/-0,K5^90^e3PA
TPQK,K)SLI^J]V8d;CTCMeZ7<O7@aR\&]CXWF?U\,edT(U)DPW<J;>TX](dGO=:K
<23ga+W:VF=1)CGC0632c(R8@ag?0Xc8YNcEYCR,3(PbUaX)V[C>HTLRJgSVKSGS
]UHQ)TL@P-.5/SFN#-6Tc/[bC-[Qc9]-J2JK_W6EJ(OaCdRA9H1(IV[OH;dP,D8)
GSTD<H]H1TFB=<6Gb5BGCaP8c.80G[f)9dYcAJV<UZTag906gUK;@25M+BY[LD7^
)8_^PWZ30?[9()1[F8Pf1Dd1Rb&Fe2/CCA\b._7AP6aVN&\FNe8?;,PWJf[(\I;e
8N)Y-+&?>dde>CKUXRP_+4AP]5EJ[[.g6U#Q<\eL71cUCMf5578CN?6??-\.#8c>
YU6[DgQ<\,fb:GSJ@4Q_O_;6(PRfV=I31U?b5])+>KL:W/dYO-<>9]#,fL:B(XTT
c8+@TC<Qd&BLaEA6H3&01I0^URO&)YB9BHXP8WC[T@#87QQZUSSMI&?fJZB]eQC-
5/+=+B?480E7S)KbI<NGM;\0>e#3g@#=\Y]UCOGPFXJf;H+aDc-N)\?fP$
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
J/>HDYQ[5-HA;UPc#54=)#/EY2ILSM>??L#71bH+)PW4QO0Pa5eL-(.U;a<#762f
Y2-&d1QN&Y-]FMUJ4]?fcS)6SOH7;?/T9,=.D;H6gC9eM@ER5;S8HfD0\02QD-RC
3.2H(b/,MEf+71&#E_?WYK]?/E3+K)<O8SX]eeX<B^Q6If)Rg??+M7E][]V@3Y^4
,^W&U(KTL9L8e?BURQWX;b8^;E-?&6SZJf7O,G)/U;2<<8\bI]8Ac9bK6^PLTWd\
TQ@24BfXR1OJdVL54^LB+O9LP?)O:O5P/]M+HX]2db;ZM75g;+Zg_f_[HIP,gJI:
/0GX(\[O,44+?XZ=B)?>U&YV6\W93/KG5eafE[d3=+\I@37+6SB[F^85J550Qc>]
WRSEDB]-:CQX12FdY?299c(;_A>;&MW=/X->9gI8?HbSK+b6c>6eHd=OALFR>0CU
b\=MV6c&7,G:/VT--I#c_0+ZVcU(O172R/d52B0=DfWS#De3^TK34ZZ1XgS]V5>+
1+;g/2T]EY9MLVXebFd35KM\Sd0+VO\.U5AQb?b-4VLMJT5_8AK-]gY&Z=7BV&L7
\(@;;88bbA<:2,F^T_f_#7P2W@T3_#T6Kf0]J([1cX_gU]e:MM7ZT+])&OQdg(e;
NR:VCbd5NEA_eUe;6C?;U--\#NP(=N9Z,HgXd34EdFBaKP4A0EXb46L8\C8R?,ZH
K32(NE9L?=N[T#8O>:d/7AcM6/gK]Z5FO#Yd4Reg5fg(OW)_(#d4fU/H8HH#P-SQ
.Z2b+JJ1FbaG-VS#8DOQV)XV=L1LZ&CY[bb#<F#O?K4TbF,UG>b/Yb.H1DB-Ja?]
1FENEa:>)#e+a#&.8g@NAOI5JMH;H0JN/Q8J=N7SZO;.0^EA9+RE(#HMgBAK9:[X
5<;HW+QT0+I_S^&NFI@6K8FcI<E?4(.BF)b(:G]>69gM[[&G&HO2V1bSfeZ/LB^6
JQ/@D,WO0VAQM+EKJ&P6Fd>>gX1\XHfC_a(41SMb3K:YJHP3O?cTf16O.AG(RACc
3:[@]WTMa2[EDR[D76)>A.O#6^ga1(+fe0T6FQ(0&dW?cZ]Y&4S__?Q[4eZ:R^U5
P1H3[\NJNeK3ZaQZf0TK;3>@]e^8Obfe)S#X5K6c<d36<XgA#2CTe5V&1JG5,T-b
OPYI\,+^?;,62@B>fa^GP@/E@HJE=gQ30a&SYT+--6NNgHZA7>7#;HdS^_Z4[/]/
Ka+HHa>^ff]9d68#0GU,g4<cRS[@WO^XCOS7?IBHDM>998<@13<PcbCW65b^QFX]
N07K#PG1QN\OZ#d^3^ZUP[^M@YaZe(7J/b+S@2V_2=8EE-3e7>g&/e100KB05/OU
_E)bBe,;YU3A60^&59GJ&Lb<PBWRJIWXI),5;DA@d;&I8EdH)?F])DY5CP;6_Wb_
OXZ#=/NI2[0H=Z\Qf6V2JZbA1YGe.FPNZ:be-Z1_;AY/8gCUF7D=ab+&Q_UC#J^<
aJ&^1H=L]1Q>a.,fLV=LRQe4=):_8HYD.gGdRc>eD2NHT&//JG,d<[+PEX3aK>b+
X:IMbgKE6PV>gOYT\UH.4e3#.f<\BX6,[gMTg07#01UQad#^=_X[=>2d-^<1HX@H
+U2O2TagPJ[#FQa>3H[eXUJ-BE2F9;O0I;T)Y5OeT@b(SNd2.I0.@YY:4C5TS](:
/1gMIY9G8SHSG,bW.#H1.?@9P8YffZd2d^)+gI7a3)0a;UU^4\JQT]fT-#S<^fJL
9/Sg4VcL_g\Bf@VZ@>W=[cW#9&LP,#;R#bR.>@V&2(Y@dYI,NGDQBJ+,^/Q?fF8K
@d^Ig9[gKRg,_+Y2KFc+\2OK3<W24ZH0GaG9K11Kb0W(V?-&eQ<E][J(9LZ-IK1E
J1aZBX^^Cgc8CCaJb6&WV?bOEC05^/Ua;gB<EM#7PC)GXA7,:-4P@(&7WQ@8W/5-
ZMF>.S=(DD1O<6J6DGcHT#JdRR\KJVLW]ENb^XHbJZY<[13^1(MA+7_^?deIYS^H
F>8-LSP.ZP@&T^I=[g45LcU<]IM:/YND_N@Z1d0\YbFcb,OQ#)@2RbNELNbb&)EG
&#?5DD#7Ge[&.=0E5),9>BdZ9A-JC8:=,g84(#LGSD[HDW8d@G/?8BX(H0aYLb8_
d7&VeJQVK0H5YDV-(5W8Jd=d:4E=4J@.Jb^;0]?>NUI>fa7\AZ(X:OO2PH;87aNJ
1PVO;<DCeCbK0D+N=RM[-.^7g(GaE(4KL>DE@N#A6[E0+EYgdJ[(f1S7G#YL@3BM
/Jc#f3M(XI,d9b#1c]IA-MJ.\0C<B10#<L8M&(+^Ke\Y9>_7ZLW&Y+b_fG054d<N
RQQ&Ded.aCRWU59WL.#P8.LI-0d;EaH\L/JOP4+C:]_^c2cV-BH]G[S2B3E#/\LO
4F)Z#X[b)N0J8VfJ8UV.5KZA(2bETY@MLE[>7b@;RC0J261RQC5c^8?-U6VL<I=D
,^?G[R#V^<TQWe;e7TEP7fBa-Rcfgd3L^,g--9g-?1H,;YQL0?/VV2J@3=+EW2[7
]:066d+gW6M_3R.fT<5JOM^=BI3VP-[;BK&<e490c9[K?I0PHfZZ_7Pa\T)d[.11
<T(<8f)Mf\\QUO?X7cVQ-5\B&L<Va;[(cOK=N(PJ?a/8P@AZ+,:5JC&[#)I1c^T1
-SccV&(EbJD3eM[8F799=2>)BR:&4_9P(GC#.I^2]XDaE)?6U;4fbC5Ge?dA.bE6
E[CEM]?8\-8/X5T3\HV_[[V2eV20,)W5?F)?IMbI/^AHbQ2e1B)NAHV[^4(SFJeS
?DO=PH0bQHH]WZ&4gZAbf(g8Q,RfV4a:eFRZ@>]+S60<,6gePSE,>(<G25.SQ\gB
H.I^KH]M:KNTK3cL@^Q0F[358.N)LGGW[g07J^\>CQP7Xe+K96A?L^IDfc=TUa4\
,#=29-UC4S;^d)Y@V+Lf_\?)aQ4^3Uf<F:CW1[@@)</=QRQPYVf2=M8F,,I(&[?-
0d;cbQ_;/LGTNVM/O/1B,aKcUA9e5f.8Dg712,#0AQ#1OW&STT,U^A/C9UXa(0/^
,d#W^A+Q9(/ETWQ:&1>B+6]2C>(L;[NBFM7ZCS@8Z#5(U9Y7VfeX^V(^bCeFWcS2
,aW8]1OfEXH(RRU>DLbaIV?565.8:6d-UK_bG^0&@Y@Og(N.Q7gC8<NSFYe<dCFb
4?b;E6Og>f9YRL6468X36EgBXG&N3Re]S)@^?)Z#Y6.GLP3OdZZR5a96I.H]M1Q,
,f:ZJOEYK-80R<LbYD71d^b4])adK2.RbRN2J[34Ac4<K+f/M0;Y;9XLWM\ESG+1
\-)f^;9BYca-eND.4T^Te8)2XW:3bV#Te>#[\H/6S4Y<#gbA@:G9K9E)DbIY@H))
3G)DC5GNg2bF+WF=<]eZQN<fCbcbgMM_A8d0bJ[W2Y\AG0?BGL&b1G0<J6(=;e[7
^3Q]gMXEZIJe1;g:+W=eKg/9=IPafcMA2<7JMg3U)#9#dR@KeCO:^VUcHd<]f6Wa
_7Z+9DC35[f3\:Z\5;#.-fSg^^TD368C_?_Z=Y:=WJK5.M\)8I/W&[27P#F@bN;7
1JPGBe=)Y&YPWba&6:N4QZ05[DXR<\7gcM_7d,E+,PG>/6^Gba+_D+;\LW?O51.O
82OeK]N+1(E]<R,>e.MFNK\LPV/CR26K._-<KHD19YdWG_P+DG+2-D.[6@J15Z]#
^ZH[7^B+_Be67OE#aQ=G&g_9Q-G/;(?BbQOL9@^S+W)W53080G>c2->-_g97FY]^
#Leg4aMW3W<@V#NK97Q)&S;T;,Q8D[+-&P<+2gEG:\3H:WM<I&>(.YK1-Vc7#,6Y
J+@1Lfb#X>S6)@OAg-1BT]X(^#+fTGAgd]/L/B1dI7MT3U<->:[6-O1E]NSgSSIa
>:>IDgAFHdD>J3<ZQ9?CTVE)[f]aO8UMC(:O,C:7AcS[B(])/g&-HU]VER#[dFJ<
Y\B;0b/KT&SC:=:?]242df:5>+_L4:b6cJ^bB1H#OG#Z;.8EB&>cCI<:Ff?3Ee^9
2X+0=?EH?U,RMbPZ\6&C^[WN=M8P[]HgegL3(((ePQX06\;00:/a6UPM[d:KdE-&
A)g<^QU]/7,DU5>OfOc(0T#6/eCQJeB8/O<.:8W_6Cg-KD(S=__A&@RJZ(=CV8eR
Ic@deYg&T+2F=>/=55Pd?/f)V.-V4:QAVTc2e)M^;9Xg487d075]8LI6f81Z31>/
CO:a4::4d2]MY#?=#K(@A0gV,_BY<1D)fHT:4\<)CJO)]FP)a;0NGVPQf4#@,g>-
IUATNPT<d>DD;M[0WWYK6O1+,J:1gb:BOGaK&SN^APcI6eD8aYVS88G48;3e_SHW
#/DKWEM412VKD>5(2E&PSZe;V8YN>=+/TeBZGX1QB6?/.^IKNKbW6=,4OaK8Yf?F
)NO:<PTV#D8T[(6AYBCfY1RbU1XHfVN96:Sd_5XAV<MAT9S_]7X>&]OB&ZQ=ZbaI
@GQ6W<3EOB_H^-J/K-a1#X3WS&8BOR2JN]gF&P(Y26WG(V[dZ-\NPF(YfVaO/EgU
VW7QK^(OLc.<_b/ME5SX(J1LYf.2ZfVH^,7FBaN;D=JaJ)IB8IIFA4T^1D.DcN9;
4GX,JB0G9f<@aDe5]V:W0.,<YZ?;13N@f;KN7EXIEb,RG_N6&VdfNS&]4)F;^CBS
=D6KW:,;>CVRa0X)D9.Z?#(J3SG<dgA:F?[(3W(YM([:eNJ1=^>JAR\46==eI^L/
,9]<TQV613_cS\I_2XZ6bb2>1#d.OgcIDa=YXCLL,2:KD\_;5d,(abb9-N9f?G8^
:2D7OYeN1XcaOW/L>,^O[+4P,2cc05#]27>II#W:Y?,T2108\)T\>/NR?WeQ)-4Q
G-f.[PCEO[6[a&]LKK754LZJS6U&OJ^=#M/^;48N+0a^,\/-=6.7XAZ=g-Qf5c-C
?)/>JK7LJ.)gR1;V^;LHF)3XZ@?Ja-g8QN0)J>&U6\3&WfKe[ZLI(KXN)B@Cc\QF
8OfHEb2N=0_Y(gX,E,6cN&;]4If?K0QOfO7egTd+6e:1L(:;Y?\2(3,cQ0-c?KH-
9Z?M&_VU)1.0W);;3@gL3]M&6SA+X-(NG1(Ec1O)-?)?UgA[OOFO6E3c[J4^MWXX
_&OIc^C+fB8AH=Ub81DWJ-Z,QUf?4K-QOU(MSH;?^bHVKC82VG7N4Q[e,+d\(U_6
EGafcFD^8J?2+,GS;P,E,TBFccQ)S.Q9]Q;AA^TbGOXHLZVg#dC0CD80\cWIY:5>
;5HAS3W5CVNOYR7J>9\gH<LXaQ4SeWV?<?>MV^-F-d)E&ZCMLOPIZ7GeB;LBJB7W
J]4_@BE<@1Z9JP<]W.:ZdR-E(eHf\2f-+g0Y_=EH46ef6Wd;.bWXPZ4WMHT0D9((
U(eK__C;)EE>](4<KRUf+7S;F>_=T^FOEGH/d3_^I4W35GC@\fXB7.)8/[]gV)2c
D&b375SVY/U?YZ8/](CZ(MCf#[MW1(g^PeHD6df(;AUf77:CNDbGZZTB760VY0Y-
9KVFX,?.V:FSPN/((U80QV?:R<2M7@b(b67)FVSXNU6R5P16OdA4PY3,FL<(NbTO
S\1bR^=Ka3M[:ON;AZ@[dT?eJcW8dO<VKBe..7J?e=c<MBK.[42X\3]N@,#&(dZ9
&LL9T1H:NOM+#P4#_/B4AN4IfYC>RQM&_ZY8eZ93]_d2ReO(FN-E_OI^0R^<5UJN
2#B?X\6.3=Z<WE/T)WL0gR9V[RI>(/NTG<bf<&T#b1Y-cfEU??L<<YHIPc2@AGZf
:TTYCX@fMVEDMXOYB<F-8@QQ299==3RFO452.26H[]^=0FXd&Yg^f\EHAZeW;EG+
6.a/G#&\\OdJJAIg0H)@ag9NM;QdCK7YD=;Z],Qg&,1,U/(a/>CE<13fde/UI\^;
1JJU^9W3I(I+:TDF&1Z6K#MDZb)F.4dKR/,PM#.3Q9H>JV4cD]8ZS^RO5&aARWAK
Q3JT>=dII0_1VdAK5=MRJ71+>CS#@VI(UeTMO65PbZ?#D?E\T)DgVa&aYM3P(UVE
eedQQ/e+SgbE9+@61OUd(G3R26e4XG^X+V#W;#0[WPc?.N?VDNg-dTcX9:(V.TLb
^e\c0Ne=)Xd-YYHSUR5cBXgU@JS8N_gX0UI]aLR<#ec36J\3328&Lc0V(a.c6:NQ
^6P?HH-eZ07(4cId9aXX&a2dYf/GHJQFAV5&-F&I42)/JC)GQY-OCLQ;2[]FK,(@
a:N&SC]D>Ne48Nc6S+6e=&[Z>;WRMFR9;_RcW/P=G&MBVDL=@OAW]F;;\dJ@(QeO
ES6<7d./KP:(KCLfW9\&eX,F5_Ee?g3O0&_fK984Xg,UYg?5,c?5V8HLIf,&,07O
?3[6PO/1[bVA17G]f:)Ze=<\eLE&P3^Y5UQ9gTNFgJ2/Qc_e)Q8[LMLe)6T^,RWI
ZbNK^g[46d<ZIE_ZY07/b1HGWL1,8=0&(IK9MS0^+[\PS=,E9_^-f?eA50WX&5@E
>_STcJBdaLPP&HTQ/VUQTO9/U8?_eJUBU)Dd)<1H&/?7H>LM(A-T=af8BFY)B[g>
WWL=VDcI&.>GOALG-BV/MfD,R/]f(RD<KSa5QD309f12GK+2@@Q=Y:JEG=++VDcB
DVJ9bJI2RS7E8)Z-5K9ZYY_Oc+A8?\,_UT_gBU:RA[Y4ad1WJfb?#M4^E-/[7BD-
.34V56:BAQ6_c,O-Wd,_a@B#D(4NQ<MLI[Mdf&LXNJ5:/-]@^L#eLeE8#XGJWLS=
FWP^J0,WMOZJA4E>^T-bT.K]LI,\\#]4DLE)QB@:X#EFV8Re;]=0V+S.V24GKe=R
e79N3Z9(4bT>_WfPTT(3J+6LPT#[X2X8T:XX;cAc#&\^5KL29d76]L.,=3e6f&TK
,&EBVQdSV^S9-[Q0D,2dB2A??^GLXe:\.NBbK<bVaU5K3WA-Fa:3=QWO.9\.^-W)
>(eO?@(7O4K65PKEI/K4AdWQRC&),YH.RXHP/2E8@9462MYQ^Nb.:1bR0Lg.F#Qc
E-f.B\SWN&UDF_E/_U1Y4+e.^Q^\Q](LG8Y?_VFVW)S]@]MC9EU,&O2Y@<ccL3H5
[\TgOK@?;FASKRSXT>V3aZ(KU-TKg9_3Kg\<PF]O17V^M(CgK+)._OEC9?K2BQWV
>_(LN:AUXYf3[8cU3N[)b>_Z#2;>E(50XG=+_VXP[LZcd-]0UP7_RHH,JbC7VV\L
)K@LQfZBM,@FIBIA6IO<Nf-;S;CeW&RM-a@>[;B#f+5[[H[\b=S6WW7U]LFYQD[U
>+>5?;],2+FKM::;Pf:OJJZGa],P:=@.;8)R4Pd7,ZDfTZIMMcLWH6ZC;b95IHK4
LY0\f9)0&TH;e)I2:f.MZD):UXG8.Y+/(FNCC1<\D/Q2^Sg_ZUX+,Vc/g=b:QK?J
73HDT>P0Z8ZPL]/7K3=.RIQQO)a<AJY;>ZE\\?aVA2LW9-NPZIDV+M_-T,(KIZcb
aBI@JAYR<2f,ZbH=6Qe[^N-N]S4CHURE0=S:agUJT6Ob[NTT@P5KD4DN=RcTXABN
cUZ\\:&PK)\<&DM(BUgSN7OBW[>D=65/KK(C45LH_4b4V1LD_<edgG5C;]O3I=bG
B+8U2cV9,\;4?M]QP].#BEUV/Z2^#YL\W3,&N6&7?3Xa49U.3(eZ-L<>,TJ9WX9V
EN35-ML))J[a-<GT049g>Ja+[c#3S>#PdSUeCc_9[U;)e7-,RT=./]8b/H#G4[K)
A=<-X>50+]LJ=HG,59XB-:VVc0e?+NSE)_T:70e7[F;H=I8PHU30b4ab<#2OUfU6
KE/?LT_>Wg]5:\LW&,R)=<16#@dB+JY(V_4c<F7+/caRLJg<DTeda(SQgAQc+3+P
3(#=/>TGH68CJO36UNa85NH3<Q>?:WWF.86WbY4N(&Z;Dd+^aBTO9M[MIZM:DL12
#>S)E0f#bgDDWG^9?dMT5A_(TeU^F@,;G8>50_QM\:3CJ0+#7Z4N0L8d/1<^C^(:
b5,fH8,X2dS_B-#<c?;:M02:MDQNCB<^4@UI658_^)C[gH7;9+=e<MX/F5764[IW
/]>6Na-=Hg8NU.L[C\2.7HcF8S1:<8^1HHP_@T4QaK>C0_@&MZ08dU^SRO5F,+dP
WFT[QT_P2A):H[][//(=@\71^g[A1<\J635#HVWE5Q8fDC0L[5Y547.H+8DR&H]Q
4-ZL1dGL\T;9S^fX4W;YJ/5T<(e:B;2_S[E.0.dPN_>O>1ZL&g;f=\PTFS&I&],G
#P4];OOXRQQ>-R67LG/T7e#+9#^0L,-84+;KJa:<LDe&.7?1GH+NA;7NH/9T.1aY
:29#B9/:(2IG5X][HVad,LcS:gKTXJ?(fXN?,+VQMA63_X/SOULH@.WE8?7WFHA+
;=Bb()FY]d:H2,7f,Uf8NBXY43GO&6K,E0X\];V1fgY>.&Fc?()2g@,W;[7ANSP5
g-DX5#&]##d[I),7X7QK8U03+K(:)g9fZ3&E)K]3e>^JK/6+QA-=QRU1/(T//X/1
=2<Q>H[:3#.B;HX?T5O#QR/FcXa3WfXO29M?#SZZ/020fg5AdCE7&O]>_R2:BJ_^
ZZ55GBcLC=G1CQ7_2cH\U6b7AQ_F)CQ3C^@H4c__#>T>HV0&=FYB,N4RQV]2A#&\
?C76]1]g@ACMUF9A[+T28U>g9/Q^HfTM=[W37U+6e:BM4Z@&:0J:A/KdPMBLcg])
=.FLD/RPa=E@I>0>;UD&9+a@/BCBZ+ANNGW7XVPGf.#)-#Y=_OJ;5D<(YeP;.)^G
08Y&/N;WgZFCOPWJ]E=XHCJLGe]5X:HL5#&PF].PKO]IPOCQgLQbDdcJ7]DO34QK
-;EH:+&gJQW#9/ON@G=8PLU]^JC(FU&C3.<3_FEb6].#+f/f5AA<@#2250cQ57d#
_C-H+=K&#^/b\CMAAcS&HC=@4G@>2-,HJYe1C;I0/L.4PSJfHKU^g+cE3<gRRDEN
=ZG:HZ2RKQeCYOYNQ12[-BfG.)9M#FE>\,<;\<\ON)/),>V]A2K,f@a^,6ICH3?O
HQ4)>g8#PHETa8eFR0\,U/a76+\9:6egHd@=<U;9XJ(S<+A1M/,J[TMJ+CO/Q1e+
K2&7]16McY7RLMfIZbX<T,3)Y]Ue.@[fWEI<c+d;GOCH0N5QHCB_^1(-X(RQACBc
P_.)GbDUb6I0B4KXQLZ+UgMXDEB&2,6H42RP6(b?FY8+=]Z<@MC1/RP[.OKB\WKN
.>8RXWL.9KY4.5B[2FM\S2&>dFS[9cE7.Y;E-DgB6P?QYE0WcM#N>.S)c\)PFE=4
D&1F><Se4^g#.M_Q8aAWX1Z&H^M>9K1IEDVF@=.c9a5B4Q[_f2FeW#BZ0N>:fZCT
FCJW#4RV(a1)-SNBd2eQW2>dKQ0&c(1Be]1A?P&?ZNYa/R2e?P),Jd(>WE^NQU#)
11;<>2<#&57>P3?O?R3Y;1?@gcBRe232bP]GVbM#26&bSd+X8BPQ7e;aW/,f_2LO
GA5ITQ2<<b:=YRR[[WY7A[EM@1AcN[>OCTI-2_RcC00Ra;Y>WV0-.]Kf+JPH@ANd
J94ZK&JVPKY/fIA#Wf^ZWZ;7OZ:(2\#-B?-;;Ma\XA+fBcVDL,Ee&e6H1G,M<MIJ
aF8b#QN_Je^[T:[NTa9FaC,\(VE:>Zgg<P/Q8UKc@+.fB$
`endprotected


endclass

// =============================================================================

`protected
b9IQ;TJM0g/UE]=5-#dT8PE=Oc&U4)([9Ua.^L/8cKA;[S=\:UE[1)B6OW921CaO
C>+JOV\\HH-O@)EI&\,NQ580ZL.W0A@0[PT=G).^)T-9g=DcdLRKA3);NW]E93Cc
,/QC:@L.07P&I78)aF[;T>5:#Q7Q4Y<WYOTO>_D?f<P3\>TZX^1P[:fMgY;U[3.+
f++HNH<eOMTb2aH9ZC#,ZQ\X-+[L[L71HQ/AA?XU>LV=PR_.0WX1ZWc,SB6+0<f+
g<096)Y=JUN0SIPRC<#?=V<@WWR[2gZ-&W:?TDA@eUcEB/.T(E=7JB;9UAO76@H@
JA?^K,SF>H)d?EU:=b;MFLE73@bJ2M@Ia=>TX9906)TQ5^9&_(;9a2a<>OW]566?
&L2BHT.eYN0_YC<2--9G5^dd,O8MdRA6:$
`endprotected


//vcs_lic_vip_protect  
`protected
+E&@LKNNH3:I7<-NPKQ?@/R?,LHcUC&=FPXNKZ4F6AaKVMeaQP0e)(_UVVB=#-Ig
++=gPYBF)-NBCfeWd+>&VHP^[&bIL2#8+Jf)YQ]Edc]7/AKEI@-DJROA(UAe,/2=
#Q6J^&SaVbC67<3M=G,dPRKQ\.:DN;&fgV,<;C>H<-,/DDCcKB\KT#@/#5_>Jae>
R8d]MCJBf9#ONGT-cN>[JScd\^&&(Q^^F8+HZ=9&Y@&NX6fXI:H4(K2f)4_XQFg2
1ae.A58G>WA+_Rc@G^9DR)^\HGOf#bHCgS+-WP80VDS(1@-)<B<C+R/K9I+R#S0D
1?@&e3XYQg16X]F;CPX/,@P44A2FIdI/0FZU>;^EKHN0;ScA)4/7\:SI7X:/+gVP
R\Z>?[A75HX[<\-KQ;/9F3VK_E/M^,2M.SCaV>/@YKaP8fd.P09RYfSUXdJX#42H
).S[&QdE)OYN7>.c9PX(3N<]&#]YS\)\:Be?@/[cKGBPA<C=W3IXN0Qb2U:N8F/_
JdOSdAc]B3-^5OV_5B?-^]Y=A&[+H_\Ac+EDJ>B/]Wc/;W8Y9Z;2Q=:8a3I#TZ@4
D]g?R[HTXQ\3&L?QN,Z0JU=JEP)9TbP<P1Y=#4.N0ON?J#1D&cA6SgLXgISFc::+
g?ggIX:MC&N&L^fAKPd1NXXZD6G/Jg=56\XY;Od1ZOD<8^76C+V9PR\;EBX=&U_O
6#2gb?7FfN59V1ZH]c]JO+dd33,;6@,d_O_Sb)ZBJUYE>^W8BGFa#fE2DXFPaV4I
e^^f35?48NVgSaf;&5YG5XWB+4C;cIfe12f[?)?WB@4e...Qc8=ERa_1HX_-X8Ng
11bOZH5^HB@8UU^VF(7N^Fgbb&M@&IEfTTZO6a0)FF?Y0bI;9a;TeE@@:P:&F5@3
Y=J])<=-ECA^BH10_[c&Bd6XS0e]?dB&Cd9Q7;DCEUfOKC5/1dE<d=AVa)a(::3g
PT7R1KY?&,(UQ:93.M1]2Z.c9S(KbHc;5eIg+/fNK1]A[@Q6b1DBL7.YgE8.?[(J
3UFG1I-O)&dNZ;cH#XD+\XEb#79\H1ec/AQR<<)<A/F_QBDS:WX[aedJLQU;>:MM
d.3P2KXc23fXg5&b.3[3L=U:IUC<+\2([ZQgb_\[R(-RC,8WMZ&\^<JEgb7(T_KJ
5^)I[[e<_]OR/7#GZA5-[K;7cND4/QSI7:;D+0:PVFW9]9EI5Ig[-X:d;1-5O/E3
V73-De^>-SfFM,@c6]^3EAIIDP#FA-dMK<T;JSP73NB6c/[ZV8Y5dQ+/1TbVC?68
PLZYd6,NI8IceZYbgQF)E_H]M7,&g3@_Z\RL<D7fPbOgAa8\f\W=6&W_75c20c1V
YVU8K?V<//S<fY2HgQ2::C0U(d3,S\XE,T6B419?G;eQS-X9:];H+GRBeD]=&2e3
Z.H8e4D_ea6HZ2E]X/f54Re(-T[XN8c#EfX+C:5/>I#CDd)eX1K0-E1eaR]SQ0aX
;eR9:B.Q=MfbU\7N/=>73CH\a##,.e8KC:L#eRTW+_2A)B.&9Z_CRF1)MR+g\e7J
4?SVdL)H2b>aZ#b_Aec#IPgM:-eXY(508HWC<>1g>:5[80QEI8HafWB2C=C\,@7^
^NF+X-UGeOF25]eCgcNX7[&P)bI8IDQJ3f8.9KdFIA>UQRK6BN/PX&L?E4d8M:d1
b/\a:0&-</F#b99C?8<<5,DXM(H2D87Y&G)2OZDCMdTDRB_CXFQ)0\UR1FXEgZ#J
96,X/TLVK&b1_cH)=HDFP3Jd#.Q);YO=:f+7@P65dJMP;[^-B9d@dS+L3&;;7(3+
P0P+DTZbb57aKZYT?_C5Jg(#aa6c,/#7J.8J@?cHS/94\X#3Gf/3IfPXCN2[P4\_
++MB&U7(c[8(f?=9I4e7Z=KF7M6;Y.IW.XW#7;CQ]--f[XeZ>?7G+5;PZ5HFaJ_/
_YZQ/-<JE8^[+Wb),1]S,aY^DCTP/EX]N.;-_gTf^af4_FH.TN2Q+e;DUIXK3bB\
X4U77ZE3I]gI7Z^c,#TcOfV_SNY)@ZNX8a3e=+-faG#G3e((-TQ6W385(FR1O@(W
^<R:e9]aSLL9Oa?6B&[b;;MEY557=]HOBJ76_Oc(YU6&I=KXA;6&bPQggH/512M[
.T(PN-cXK//6@.UB9JLI5dV>UK2;&eLX5S+5b:J@^,TG;\\X((GK]?@?S:9Z2[D+
d:=)(+8WD0EFH[X8SCVXdfNJ0Ke,=;2;(M[I)EgA06=/I1#]ZYag4Y9O/>e#)8QH
5<F&5f(ebRcLSdBB)=WRN6C@3E+>eNL2TXDgI_eeC=Wc@4];^?0,L3<?cY;\eIE<
\4Ogb:0\aP[Zc<0^LZe)TfR?Vg/Z1/A+,b(JDH/,L0ce;bV]/@geb86+JC6RY(9M
6&&4QVN8H,/CA(293P9(<UK;LR59[5IANJH]4(f_2GXS_F5).@#dcTSPFb[QC6/_
]1c?A(:\JDg>ae_=d32?G+<7KaH@,1deTQ.RbF:gDQ_aSSZg\EMA/-+Z:caTNJZ8
;<7>U0cd.6eW)PD/34U(>f/?\6;245??6HN8>,aS)T]P,<0\KS7a+544XWd.MNLV
=ea]IWdN>/P_^.5YG;Y,+fY7&7C1,YZ_U3NY<X8b6Jf7F.U(A,X63WHV>+d923g]
J^&&Ac3+^+.(?ZW:_[C+6ccQHCcf;-9PH2eEgNOIc1_NU\SDa1A)D8,/>@WXWP@P
I9O?J?F<WJ+L]KQ@Xef[ddQ+O3Y#1+BQCV?L[a<b^c\7NVG@X9P4[)fD7]JSG(AT
7g/XP(OL[V&0#DS3=(SA6^Da?QV<cTG:R#:0>Ec<2.&Z+)>,Y.PGNZZ1gP_M]6N7
eGW^PNFG4LAgdff,SUed=ACAQ65RJG:C3EE&4<g.gb2EX/D<5bXfTU\F4<V/(^?b
?F2P^Ob4NM@OC(1P+W][dgV^F@YG<147,b]VP,KWNR]dBMQ>dC0/CcHR7YNAfPK#
HO?XbXHDP_)L5<R_[A(OAT+--Z,7OHeWLW]?6]L(SM1e?]c:2+@GP_6)cOMGde[N
X0?B;;3G9A;/>e,0;UB_JL<KM9WVH\3-#^[>6=B<fM<b>BZ3/&N3ZVGYK_Z82e]3
^XTHaDA/aDTDb\^DYe2WPb?5S7:V+MKJ\RF<5GZK\MC]=NL[=]C?->a;WG\CO.EA
J4\W;Jc]GKe+Qg30A.Y+9AD<>9XTfgF8:f[WH[aG90=)L(9B?QcOPLN_JD+eIZ\U
E-TNJ@2ST.-Z7T437+IS&Gee]9GTH4.)JR(I@e6Rg>[FcS[g;R2N)&2RU17T2_E8
&_Y)d4X+<J6RGPZ]2d8J:QGLE:bBH8V164.ODU5G.U64&=_3SE8.H/&L9E7FCRY#
-+[;&QYce8aDee7<>.53-+/OSI0BKQaO,cR&e54,ZOVG4B.?/N@Bb8VA(C.76fE\
ZR5P\,bKH6-;:G:&1/[;2MN;VCE-\WEO#);(^O+1Lg\+>LKfE>>.BXgY2^/.RYd@
&]JU0(S=)_@3Nd[JR[VW34ag)AV0OBV=E)2[GFRR5&D7+&7X&[e[^ECJ4KDYA1DC
<D;]2Sf5UR#XMf4V.JPa^LW9ZKYWXLO-UQg759Q5CM34:A2;<1S3bN&,O]6\O?QB
eF8Q=[?fNFFUYb6Z8Z;]A\[;a0AK<>Y?)7DWPG_7=3/&HJV=^(UT0TBIaS)9dVUb
;Vd_aP:>DN9H2#3a.g.S&Fc7C(89RePT:HX_5\J-.28V[0@X:)fBL+,&RPDa\/72
,a<XN/.[<MT9PR5E,&D#@R5P/^G,8_=0>8>/02AO_^eec(DA;WSW9-FX/RA=d]Z]
3CeJ=E]Q0?(9Na_U0;IXMf)SL8O8R>H#HDM9Y/RAJ6faNTfL\@#I_>;QY63#B)BY
/c&e+(S5NLTQJM#T9BdNU.c/]T#MY83cO7RCQ>TGcA2=[&g_3D?Qe(<6cJ<9Bc),
-S)0WV@Jc1^,^0OI-Y(]<#=PK\X\T[L8KZc712&P3AXSb/Kb_<M=(Vc2B[3Z[P/b
57W^SIc@UUSZK3CS9)10+9?/B]V4a9cJ0MfgKYX0/RGMabSVQJ4H\e)e_4;K.KQ+
Ca,P+b@,_:,#[S3U=E;a9#2(F+4KcOad3HMG;Kg(=T3HS@T]TIIeK.eS?)BKYCX^
7K66TKW&S]Q+M)W9NW?C2ddDNc-CJ;W3ITL,f<;P@;PLfGC>,9ggXSg7\HG&U..A
YRNP<HZVL=/_#)=U)PaTb1-:XY.4<TLV(MX9TYQX=g2EadgF)]H\g:<NK5TV0F7@
_YO[&g0,]GE_9^BE;KLcQ1:6MK,bUD[W>DT<Q;e2Y0:VKUWTUQ:;61FO<_>:4^&:
\+gS<V:V6\^P;=0/--QP(/M?N,CQQN&:GH<fZZCRQcfe<a=52__5])/d#I)EY,,&
Z,H3a]eN@W3O7B-7^-(559INe6WO\#1HBaS@[dPNDCE,]6HI)K.[FfZ[M:4+U=\-
#\#6/1Z<\U@FO(FX26Y[Fb#J>XE92H?6:Gg0CSR19=2]SZGf/<<FeV#RE?)H>EWW
T5@>E>e(AQ(4PGAN4[64)0L+&.bDY=f#.Y-Z+T8V6#a8P&E9ZW?/82P:ad(53e)1
#[B@3G?AP/^&Y>L5Cb]+WYJ66Se=#fDMQSVDBdOZ@Q9N1/)RB0BJSTIb5^D6QDS+
+[f:FT5CVR>@a0bH_E7;AXb&RaGC\[29L+K?2+CUM9FBA^<I(G_(]XMDfZMOFC>9
:d?^PLZF@H4dJ)+JV9bWB^_/,4>YLb/G[f2][VSP\&H-g[C:Z1cA(5E1.GI5?:S,
+NWJP1TIZKA&J6.SU<Y#BY#BZ(3O2>>cHH^=XBgXI&&G@+TME2;)T8/dQAZ.SVI>
BR;(bgS7XYDeR7L8cN60O6\bc=7MPCC:858R0\5dUCA##cOX5O&(L+GJ+E(SGN.6
^FCfY7W,H4TH_ZJIT7Ua?.O_N,gI6/Q+A,S#NE\aN,D@W-A>:57[Xc][C[7_#+@W
L[3>1K)N@aeT7)Ib<TPe<PX+AecJ(6?UI2>VRM(2X7:78:J+P&Se^DJXX]a7:ZXY
/Z^^:EA;WJ-_JWJ7N5-&L=Uc3??feA^Vb^3b(GZb3H&7U]/gV83P2N&KU2[5cEP(
IQU0P2gFgM(L=>PYg,+JHUMKFPLC0R?fBJI5:4]VU\=T6LXYPCa1EHOS80I3NMX_
?9(Z1?,MOJ9g8=(428/cZc5Y<ad+R1HWVZCEK^>F2<VUUW<O\K;OKaH.-^Md(\1N
WI=M]8UB1+++cSET,E+c#:@7f-c<,B,0SdQ?[?J@,PX20[4,6Y;V(VUA\_:?(\VW
BBJ>)7CObZGM.dJ-T;g(?/RM7g,AC+b)-cdJd8S^P[P.HZWI):#B)gD=QK#A.)?L
CX=Hb?e+4cf5+,/>fTG[&?P50.,Q<__]N=A[NJ:DCX8S<2\F?<b>e4):76fB0&JQ
\8CE]=N8\)T9L)2/.9L<5N/CR<+^#c,8LEE1.,/@]XfYV7?=Y[7#7->#;4(+.7@6
<)D?6fEVCYD60dfAR3,d<<Le+ER2MZ,F&,GTW_RCHU9gfG2,>.2-5e:VOHTRMNT(
2K0+AZ:NE(,.F-GFQWLZdY38WRB?@MFC4ZO)OLfMHdHICZY[P@?4S&Q&)N@__#OU
E(-UJ9EC035#M]WScg1<aXZ0GDPa@>MHDfc>:HCQ0OF<4&WW9T:C6/fIK0J9H+c2
GOV&MZ<dMVa+/L<BD-IZM_7JN<KMF@)\\5Ta-]3[>dNE@<dVF,E[O>,#EB2UAAEF
&MJ8VIg,bU:e0DC?<],DdeH6T[FK_O4N?Hf/J<2+M51Ke_#&++I2[1Fd_@0=368?
W9[4(fSeFK7D\J-9aE?<O_W)>21PLB9[+PO3@?G55:f?IQY\I)?/fENX?[28YU52
(CQU,1KJbdGG#@3RHX7PBSFOa.^I@^=Y/Y\V^H/B)(+X,F=GP/0e]EBAcCTcd9F/
#+>3&&,?_cbIN4B9UGQ+XB9/Cd.=2DWdg^7+-aAQ;/Me;ODgMH<1^GGReNS-3/;a
#(SB2E-5bX4_<@_(S\(bUSTJ=^1,CJQ7ZM;UZ7_.bVXF2(AP_XWf2W;bBKM7gH@c
HLS&&IF=S&@(\Ma:.d2[VOCaX_G&>_QHG?e#V1Q70:D2b6)^)/+QTcR8dM&KDM=N
6V[3#)GN:,/3U7G+367P7YF8(IIPK3;.?[07GUUdC&Y)AJT)FV4K@CDd>9\RK9,b
aG/d7WfO;8@bfFSeA11(_TYSg?c.94#620X6^E-?O8I\/B4BeGBbQP(8.;4KV\OZ
EAI^)cMWT.ge82Qg673@e.REL<96]1ZQXTc/9<cMT(+KNb).4>W#F#T)eYC[cJA/
(c5-0R^;6<XXdWaCVS3<e[Z7aNEV5cX4Z<Pa9?f1=PZ1^+[#Q1FY5\Ub[gH65<YM
:[\bC:SS:c&9fR[b3)X6BO&f=c[)D/D#XJ(DW;2;bBg,cU-FOf;\VOe?Tf(SRD05
@WPd-E05FM;]MP\:@BR>gXSF\U2[cTc<(#e6D:Xf.FKd6>6f<J/P#+P7;20:?3T\
(F\42OYg8BQ4D(=\a2J/1LDY?+N:PZLO:Y2BIR&+U,R:VV?D&EeVR:4@.B(KDA()
\K)X++Y][&8OI:I4Z0()G3#cM@9bS9VOG2d)H3.T(KQ&&2\P9MD>[82W#D\P,ZOe
59H=GN/KAWMY6YV<Gd29SH_5,N_@YBI;-W+?G=S4K2M?6:Q<]gCW\bea,YC:Y.D0
2.JT0GG;)[X<gO6M=D[EZHT^g3BP[DY2U),V.#1M)OAf4.MA&R<ULe3Rb0RG<\N#
b<2XdQIbKbM)H67VPcNGG0A9UKe&b^74gg>KKS@V/a,X,GMe\9)Y+=I.Ha:0fJLO
4+JC9e)8NLO:)DeNTSW0R?g38G]:J;((Kab+b,LQdBDGB1dRC8OT(C]41+F8UC?7
fVc&Uc?BSK1M=VP_N3J@C=#2^/gQNc_Zd@&@]\c7P>Wc(B-;Q]82HDe(_eWJ]]\c
d4(0Fc///OPd5;[[]JHOd1RZFJ0g&KBAB.[DD#W^X5[CK7,ZSa[FV&?CW<NbTA[2
MS5^&J=g@Z<61eMB=GZM282>J??07X\:7@O4OFKOPWYG@cgYN_U7gJaY@M@N4]LC
.72LNd[Qb@P55N,E7abLT.7dRR6fNTGaB)c&[b,(SDf/576OZHJ/>LcK(df+c=AD
J]S0KA<]V;G)\45FS^MPWDDF9<Q:Ba4aU^IKF&6@0e;R69Qg>-3g^d?96^WE0cAG
3=G]7#7b2UAKYW?WM0(,G:dQ_IceDJSd72McB3F6&U42YIY;4=_[T:H;FFaPe7KI
f1B9V=3P6LgLF=IBAbJ@)\D9X)HXR?C9DeG1T]1QC,AQ_.7?bT.=dV6FR<UIFMZN
)[V&d=+S?U4SWTP6T8V;5;-.Tf&21)c@X7UEP+3e0U5.0[3UD:FaB@K>=1;,HNaB
JZaA-JeGf5I#B([R.RS/_0dB[&J?5Y4XK#3K()g=g9M[TDY8.XXL/?65aY2UN;J9
/B\]X..R<8TdCRJIAC:5SWLeOg0RJ+[-4g[<L)S34>>TOgNZ@cOPJc:-#[WLXSHJ
e^B9\P2]AN@EE]S?2_OPEDB((/#a>^PcX4_B2bfFZLTa>PX[TWY]=NN=Ib(bAf,B
dV?\F[^W/PGRM2He:,>4:@0U6+B[1-E;;@#7T\AAE:SaN_WA6R3a5<a1A[fZ01O8
>OKA9V:93IU4-<9AbWH&-dC,Q[J>7-.,X:RH5-UIc_@_0K28ED9=)B<.H&;&]dbP
29IMFB2RVfb9):JgN[+,;6^-3A0VW?=gfKC\0JXN#I5g08H^Y^S7K0>1&O48@900
M(P-(72QIJbO2C6WO:0G4E#WL]B8,fG36>WK2@#KeUFZ&VH]/fG[UBB(Aa9Y(g^C
fg4]P7H#/)@HHF1O;X:J#9L;>WI@C?Zg,RCI.&,WSR69E638V5eFJ1X+-f<+X5Wf
+[08NDObV=R5RQGGW4\88M;UAd[6??Q-FZ&,AAXdZ.R[P-f<C7FY;)LQ=]-c)CaU
cQ<fRgN=c6+1C4D5WIcg\-12=Q?:F(]0Xf@3ELVb0FW6CT,1GK3_9-a4++#2H&;K
bWYb)T)H3eXG7Nf\JWA/6U6V6M4MJDdZU.@\FNPd43UM3-QXNOC[VZ>_a5UBVP>)
3_8)]V?I@O3(IdNZ,Dg2&)IW00^S1GW+L.BYd<-WVPFEZ8,R\5PDNER7D_S^/]be
e2XH/b?6#@+AEaSg^B-Z12,WXU]3C;_\g(>FO^JEb<;N;BZ87;Y02:9&?7E<R]7I
?)I/gAL=A,H<0g/PcS[5<C&<V):JH:-.Ff:@9IO;YX2P^L(Oa@@WYaC@SA70S#1-
U(HWQ8@^R3+W,-R]168(:RAI9>SCG:W-MW#YR1&Xa.8EH4OAL27TF7WD+;S9DFce
gP)C]A^L-BaWP)bAK&=#FA9V?&T+c&<\MX2a]YN,[S-;DJL-Ed#Mb@JD4fbV^TTg
N])ZB(IGbLSRW_@/F(>eOLJW,-cfgHTCVS5a(G)B@_,A1F#C:6,.J)bd,&(AFI9I
O[4@>E@5.4D<2,S2<\@MX>RM7>aK.QJ.P_c:GP6A?IJ_eM44P:dD=[Q=<:.]F4VY
>A9F+GcgCWE4g7)2Rbc1Tf=Sa/+3#9C+C&_@S3TG-#N9VVXH/+NaC)JZfE:TQ@;6
V8\)T<-A(ad29Y.#LDT?aLPT>OC@X;1K00+Qd?)23HGfD3a,)[Bb/;e]92)eD)<Z
g7eD=/])Z<Pbf)8UJ6EQ+1_@Ef@M=cf&^J>242:QSUJ12ESIRDCLSRb:-9>.8=Y#
@BJ45_V&Xe1,(?N55a,UWU&,POL9(6\+E)/g47DRcHdJEEW]84T#F1aAg]PZ__5F
6EET^DeYLg\GKee@_IN;]Vf5/TTF5Y/4(V[5EP;f+_eV?M;XXeHU<dX3WVGc=Q9:
.,I?d-(8cQTJ&=eN4M^3[Y=61B4b&cILf]e-?,R)7X03XEfKIJS_RH8BH@0ZHO<U
H>H)?]?A4E44g61RJS^F)f;-?5^HDKV;W54L.,?O.]X,NBY2;:N;KYJ0)>dXP[Vg
JU1QQNQO&@N:FKY3CNeD#bbIF<8_1U;D;&QNY4gGRg=+@3&<GW0Q4;5@#8Gb-SU9
_aPGBF^P(1L)70+F2aKF:921WXZS@dTZ>8;I(SA.f#LCTWdU1MF^2G/(01(fG+0J
U^HFO#7KBdM?4-f4N\Z/@U<D4KW)W]g3[X[:&>P3BJ++d3]9TI7c[;5Y>^JK8=K?
3#L1/7bWgKfPG&I#/E2./BeL1/?IMALA2e906&YUJgK9IICBKeZAc(Z5;ADgLc6&
b3(g?IWF<Z<\PWM:S4f#RHDSSQW5Hb-_@F>IL^5A=e=Yf4.T:eA8K],5ST1]Cc(G
9+)2_3<\Id0?^?5OdN+b&[PT=.<[RO>FfbY>(^D,__2YaY#G>CFX<]F[f,aU4/8+
HF]Pe0TQ@eNIf-+bBV:^4X];X6>).0bG;T8Y,F04P0Ka<da>O<>d0+:C/D83fF_G
XFg&Ld9AHS0[;1VG=F<W1e<Ac=]6&<)M[&]M0=6\G\+BLHHN&fJ(65cC3g43<J?#
<7[R(0^Z_XJCA1ef[EPZ_4JSVOO&#XZ87d\d[@(A5KC+e-+NMU450Y@C8,&:_VI:
f=>.J[aTU=Ma\XaZ,IGA3Bc>5=:.eg2]]KBC42V.[@3GbPQE:&+A>PE+9LG5Da9?
@W2JSEW#EFP2dJT&/N/BdGH./6B[T20;T]Q\S(RPe6S:3>#<F[+PQDT:=ENC+9&E
RT+ga[TdYZK4JH;HK611.OCTZf\47>&<S0/=KG(0.CQ:c6g8Me])>Ma9^<+c:<Dg
^J6L:&S=[1JAL7>5MTW7;gDYQ@8J:4\J^g);6e^(@4QD;WAO-.F0H6WBdENGRg/N
YZG#8F&[@KYccZ,JHMfK6:XG>,PN@Q.cT]0;F/;__86cgfGD58=6I=^8]]DW(8<N
N9Y/_O1K_&Jb5H+bL1OVaf1G73GPO,bWH.cXY=f;6+?X^KScG&SfG<;>F6^(;V5?
GN<JbO(RR-5:S=<HNAR2<7_3.I4>:OP(]P#\&9=E5)HQSAB22f3^d#=DQcS;&8P-
(DZAVS_2=+VE2Y;(7OW#J)Oad5&<2-Dd=(#Y+PBP,WcHO;a;GUe(e<+ag=67IYfc
DC,JZP;U\EIQOUC<ceW^PSNYIc3YV[76Y[M]Ye<fO)@Cb-V;H(6/E]b8eKSFBVQY
-Yfe-J>BYI&.]EVM0<EBPI<6UK3;8_We50L\/C^SZ1,.3eS]0?Pg88d^/V_C(V&G
X+V1dVQ]-8OX&&PSg#)e<-cAVB:XJK<X-M@d-XU<63[>b4@8c9\L:]<ZT#6K;0H,
OKWf;K3Q4A0S;=X[@P4M,Q;B:e1DM]TC;B5:0f_d@B[==^EP6IT5c7JK?)[<OFDV
RTc#&3J]BGc#\fbD#<)F)cT]?=,9NH&6,>0e&<@0;P-+K[-+M2PPa?a.(Q2O@^:O
&ZWXEgFf#Q?TF0De@#U5UK9A@_()>9=S6@^YR?=\@BeA6GCT@LaLWANASbJeVf#[
,@[&3LWEe),.a7=VY+>a+=C-XIgM@/\AO9MC2)G)T._,Z4UU7#HX0:EOY4W9WNc[
XTN?_B>;gIFLGf5QGfFWbU83UL).9cM6(G_2EeV/PJ-050AVONgFA\@e/.WP0P\D
Fe./QF?,BQCPALPG\]IV=6?OAA+CS^Mc@[d1.84OL6>YF\;-0c&N_@fF#R)FC([f
.@BAVVf-^M(N9EeC/]S^GgO>XS8C/);QIcMddVWI.UV@5KE873JJI7@7.-LPZF9.
UN96:PF@Ka(=Q,YH]HEbR_N0f:449##5)>-X]<OGR,<2@MLGZ:SFBQ)/Z\C2GT>[
BRTH8&bB+G]#g32_M#dDJ+CcUQ=_e,EF>5b,T>Ua;FTN[Q7.J[UgCLHFY9cX&e;2
DHaH]a/K-Pg.a>a+.#7=&]H(B]G?@fDWE\Y=P?gKIaMfQ/RW/dQJc=)TFTKMGAQX
<W+6_JegE)H1_;/2_20OYVeN.a9aS=a+I&63VMeY=6c^933EbFS&c\IW7eUb;SA5
Cd(O\2e[Q#ebe>)4=&,=H#@7P7(g.\a[/@0(DQ.S,Sb-K.5X2d&7e\</+G5CE_6Z
G2.XY1DU#35)Y7KI4>1>KD1,W8BMUg?20;32IOV(8=:-)W@;)-fKbfIdDgT@:Q7.
DZP#ad?Ae,KXW(49SVH@+P7Bd#V#CS)GKL<?9LMc+R0I(Y5PNO8#E(9;CH(402KG
D_aTU<WELKeM[BMS<AQ)JD#OfWFOAXKFQCW#]dPc.d:=;5L?J#[@NYP\:&fQ3fZF
7LHTJE_E4V2:NE8RPDXRW?8H?>H,J]]:17-N&97.P^b[QTE\3R[GKW7[FQ_S0(eI
+JF.93605eHQKc<F0>64<MZ,Q21bQX<^aD]EI<_@48&@;5YgC?)U@I@Ob@]KgT+a
EJ40\bce@@MJHBV#B,f-^#15P+=LI;Kadd+5bAQ8VR&6,TT(5d?e7RD9/BLf9TOR
E>CYaR0^P^^YgHIgY>e;MV\aN?1Ed^c,=,(XO7fQ<L\_RO?CM)GAb8caJUV91]T4
5\[YL9\_@\L=M-B-J3Y);<[8f+bc]12BZZ:A.SKDE?N8OK@=AUgW6D[73U^aSdFe
5#-:&9-Pb,EK=de76@5F9QI8)NE@#F:8=@+HE^UA1HVIdUb+bQO[dg78,HdN<QaS
/(fDd7N_/<L3QaW,TYOK3G-_7^REg.7/T8D?N7gT--BN]F>C_DC&?;TD7[TfTG,]
5>Ya[OeJfG+SGa&M#X;>#\_@X(GSJL0B&aWP967c@LIFB[X1Ba:Z<I0R])OL:d?M
-FcDdQ34E^-fMaH>NF(7L+7E?U<aAAFfg)^=&NW-\BVMgA\CZ:)+@IP0I2ZU+662
#N2bOCS2?4#9bQJa,I6S884<G?B9b6)8#<G[&=fBYS3FG;M5Nbb?F&W&afQG4;FC
GZQ0)?7\S&E39<BL?^)&8S^7bCE/LWRGBa:c-+dBXTAG;-@L6:<C4SU(TXfYaTX;
b?MET6[37;D(D/(QfXHbN^WHGLYSH\,]3#;.QCCXW6?>&gSN9U0Y9BOIGaRa7L3f
cgH>gVJ#g:cR1d,@8;_.UT<KTP:+/0DFPW\WJKMQPZK_)f0&K8DG[9a,KL6YA<31
X_@>:Y3I7fBAW/&<-c5G_e8\XY7Y9=U+C7J9^N]2NU;)2=N&5e0W24W>74S\9=,[
a)aGY/5><&Z_E@-]W4X10A9@)Nc&dFc2:a,\E>B4d4+^MKIVEU)7IgU6E53&^&54
NQ?/e5-T)RA;475[[c@(J[@196_3,^&J#-4J8Jf)KaO_Td@V<ZYU[022;;f(B=-K
8&db3VBH8IWD)d4V-bH0/fE8C0WXR(eZ<a8#L.&N[?I-JC7fI<BK&P]Q>_XGMcG<
T)4:FaWaa3+7Y8I;X#>U_UeHa,#A/E9CZ]Q.bJ@X]-8;81Be+;KIS2C+3gSQI0XM
FM])O#=]N7?&\XE3PY-UMO.=HL@0MRP(>+@PG<BO=(TFNMMAMgb\87C-9gg4,WFM
ZEP>4_0+D<9bdSL[H]B?S-H0<=TGS[Z)UJM,3:&LNeZ&_9(d\WQ5P=gSRW62fO6B
eV#IWGZ#PN^(GJ1F]0OH5.g03G]9-<8(JI]M:f:_GX+g3LBG6SHPbB@<ZY9U9();
#9)XYIHE=cH6)J<8+)#SIM]F&TJ9[DgG9Z>PMHadQ=)Y9JfA5?a1A&0KQ@RST]+[
2TLZPI+6/=+O:YaDSQe&6K&]5f-04^.=V>gNe5#QQ/^#X_A.-CaM2([>\-PYVW.B
Ac5b\S/3cCCR5R8Sd(9>424SYGHQ(;:W6A&S)X+0ZdU,0QD<L)b02>KL)E7)2EHD
#cO4;1JPAE?H(,J+I&E5=OYX]CGZ^F[KUT+\3@T)=HD#F+:+K:A_U]a8FYB(cSOe
f8&U/+C@Se9#DY083Z)@:5Qg-Q,7D4Z18F2Bf0>Z.M3(_ZEcYTRL@4aXX9cGXL_J
6bJ75f0bBfZ\,^#T;[T83<,T<5H2aY&,U0JA0aML6gPW@@Q#G8,&DCUK-\S^1Y:Y
-U#3>d5XFcGDfAed/P)J7P=-[a/Lb/+>XVH?P-,ReABY2Q)ZDd-R+CV#46fDIaKJ
XU/aSHN0&Fcb8E[Mb&J,U]OT=ARH1^^WYF>95:<+6cb0WO<\&(#CF-/eLcLK^=Rc
H@afAXaV43>EWAY4X(V(C;+[-9,ac_UfXW43:TN7>W-cVBeYIJ-]JEY.)0cEdd/,
LXI>DZDDB8=b3-6SH>=R]DWE<QIgf7)OU1-]V@b(4CbQf18@3L6QM]d12Q_PAL6O
#BYFU__/V;V;NVY+;)XL-\TH<X&SAKDgE+BKe;G>FL(&b.3RYJI9DP((K9D9.2?2
GeI>&V2_-=;Z<Ce]/V+WB;g#N_AR..;VfPBJM=A#WFOPHGJR@>YL3_\HLWA=\V4=
M5N:8.=W#;LZ69C)M94==J9bO,b#-Z?ePaV]M.=Pa,a/Bg+a)4B[RC+HL199X7._
cFRG&-_WgF23OKP[UcCBJ)4AeFOO?<N-Z>fPQ-/2a;AI##GYKG=N[/&^ZV4&,Qc)
BD(,&1[AE@3>M-d.Y^.TW-ReYH0D&G&(5./<6E6A6^3ZgK4M^K_PPBRa-:T,>0@Q
S)RHZ-#UPNM]W?9,)]F()L>9QDdB\M9ONgYPde?.Y<<NZ70QVGM8FF24181?C]Wb
5YIb23b=fTDH98QC4BQ7)[-J5KPM#D)GU+<,GLCXQMGUT4W_UM10D>7G-AVCJ.MC
2Q@FN[:G_MX?.@MW@5F;0^BFU9Ne^0/Z.V7I4I6W-KN#=9PfaD8XL+MUP-DTf/MC
\O.\JFQX&5FZ_3T+>2gcN[ALcB;gWFT7Ff^M5<fQ/VeLgB(fcQ<G]aUFHc@bK6#^
bMS6fZ:Qa4ZOLP>f+H0.GL4DOfD]A951,<YEaB]KUN#6PY+EON>?a5:5XIUf>[XE
7GfE0?Saf8&CI2&3LfN?8cHe3&-);C,ONNC13Bb(4U;JCI[.E]67_C7N\PLaSIW:
19[]#3aRM\bSPM,S4a3]DGQ:W>(17?.@](-[L\DX[YW7-L4GE,W9U5V/GOb>Zf#\
8=[F<g-[9W(1;^b7T-KG&ZaWW@4NGT1FEM]?>4R,<AA+5HS8a[>?J=W:KDJ&N1D(
a0ZF/8g\/X^/\TY>8ITdC;:&XaIZ/V1]S/D_/=dNTL?1/W:X/Q;Zd:2[ggFedfCb
E1OUT_SXf;NZXRf5E9YYUX1OWSedJE85_N6(DO^U^2[&g?_G>]OY8.Caf5]AeQa_
?dLO@fJN@FT;K8J#6QUQNVC=@.(bU\bN?@?X=1dfBP@NO(cO1:Y?1(NNO;XF56N.
<AOUHb1:-(M5@=Fcc^GKO#IA/Jd+9Fd[OGJ<?MD6F+6AQ82IU&E;394VD5d8U417
B\FN(b)&^^7E]_>ccTZf.c6#[HW^?ScGWGN:;Z.JR6_F##HK.-[IO4Rc8BC7I)G2
cC(Q66(-dLJN1eE)BeM/E4<HLKPO?ZG&aK[Yd-Z0-#IWUf3#31^[bU3eU,K^_22E
IV#2&\Z2[?a\EDTR_>gFSIacMX\301IR>aXQd]\VW8_0.Sg#Ee&8gXeT406<Y6VQ
.44=]Wb=Ce[<@\aM_LDHWB+J^Z9Jc>(609+Ja>:BfDC_Ib+EUS6c6Z[dGU>NObZ0
COA?g15+(DdcgZP32;&Q<c-)?4ZB2IU0<_#FR_7K[;B>5D0FLJ[LJ_M2/cO3-dCU
5O&@8Y3e6+:?Mb3JU7S+]aN@F_M#4.&]5]RU\LBB)OVXH]B3Wg4Y\+L36\d>+8Oa
J=-_7YdIG+aD?A6(L2&64e)=e4:FI3^IEI+<.UMI7RRO+4C8@ZH==9G3WCT_V[8e
[cN@B<dCV(+>0.<b?I_CG\&W_?A.G5eZEF(#RdCf+H]+M#V:-25@Y9DY#M+]3ZXf
Wa+,S1..GcAG:W\O,=UMH#KU;,P,ZGa(7WcW)OTH@ZXWE?bR)^]+_&H?fc.HQFc_
dRBBVRJ=I].FcX)K)4WAAQ&BH?/P2a.:2Z[A]#\@/X7LD0^C:Q+_Hg-XXBH\S,=W
5P<_CLZ6fUL2F3FFaXJUHf2\?P/G2)N)+G0f9EK?LIZJ6YIU_Q^8WZb>F(3DSfG0
;MLAQL0OENSA3J;Y].F=Oe_gK\3.fR6>5E.bd;SX37f1g+34(R3J/TgT#6a@YP;;
4CGG&N(H0&;9(FHJW9TFY?FK4F(OI5I0=/<@IV;95_O2\)&FG6a]=2KAdLA6#RU\
],FT9LaJPV@faH\eV++O1:0D]5SFb9,&\J<b&B2;FEI/,XQacG):3?FLHZ1]bWae
,ULEAMN6Yed&8E<LPS:IQgQXRAD+EJdH\?)4\J9^Z\NPKUG&G50T/1DAOg9.G]?A
AedH]15a055YS[])4FZ:c,c?;U@P1668&WAG23EM9EWa&X//NT#9&4GK:QXEF\C3
LC;0E+SffF9D.8,[=8K+0&]I8:H\N]FD+C/WQD5F9NH47fOPREe]/26Wb]A\d)0C
B&&GB-[2N7G#EYXPeK#S6ZK0fUU<&/#H&d6ZY38+WfX/.B/:I4?>0D6EX>gY0b]e
36@g&PfXIJBTZU_P5BT-;.?PB1Q[Zf<2#>f>d)/C:(eUTRLA<==Wf@A@07#.7c[:
5010&J[<RA)\/)VG<Af[(2:.\],2]4)b[M#(85C#J2H>W/A-^KdW3K,+^G(8?19T
Fbc06OI;;:10@=83QKX\QTYYB#G\-R,^>2?J](Q<>O/43[4c_[WaTC/T2D/N.+E=
4E?cb0^67AWOUgAQ7C&KY-;N&@d#(BUOMNJ6c0f+UGAOOa6@0=Se:/Bfa?/_HY@f
=>X9GBdPf+DAbW#=7?BRE7N;<.b5R#=b=HAf4;WY8@HWVeeZ#YT;cWU]VSSP(<VF
,_.F>cY\cb,4QZ[\:/PRQ@OPF&J6PA=8,.D]3MV@MU)0b,Z&cG-DTWB1ZG3H4d1O
4D1O^f#T,cEfMA1CTON,#:<7AgCbM_Z6S_OND@X]Z^;-a#;K:D?5gQQ,,c(@_4gL
\/_3&LP-[1#KC2RG815#=,4:aX)&XIYHg=I&A/<19P+-PGNCa\>]Df,7WFfVE4P0
\a]Z)&>U]AK.;):BcQXLD)S[/E9N^f+W-5\::DETd-L#Red_5XR\G0)X=V+?L>_N
XO1R4LWKPN/,?;,e.(g<Z2&ZG3_OA-+B-6W,dP/]2_S@JA8_>-gfQ-AI6S]S@TGS
OaY]X(=dM/eV)MWNBD:JD&(8-V7gf25[KLB5)6WD?#37/#)Ef(H/fP+HeU6@//)I
^##3.H7D\P+/b>(b&JY1ZT2JCXY9AH=SX8+R&bd/\F877c^&+6;)<YWdf>-+dV&>
f\2/A7W1H?@EJ:6JSD0d4<bP6c=NMT.b8X3WL\/N1@dJ1>fL>9H2-.JM(^TFeZN=
4D((W?U;?ZT>]94Xd9&L5AWTH2)BFJ3]&8V(Jf/KT@X0N3gMCcV>(SSUIB88)8fX
g;A_2fHMH<FY0/=PN7Y[bbOUH?<DH<#5#4J./+@ge1LH#?-aI\]W1#.D2TCT&@f<
J7\WcXI3(G>CK[7P->cIA@S+LN8V,D4<VZ7I9O&g>B^f1]GK:ag<=f46G5e?5_<b
+3-2XfaR([4)Jd)_S7;A\F(I=B9]4.67I58dESSB\&2Ff,T<Y5+aV)(0HFA^IL/Y
S+(5X@.;?ITIb_TSJ58XE>)_44=:N<_A5@[_&YQN,Q=+1/a>a#Kg<<G^GK==;Re/
\71&YYGSN#d5K;64Ra)5D,BGKBdAI,7_dS4>Nd0?e)MSa0S,\Pgg0#a4RPEc]-HT
b9DMNMGNF@?)dZH+/c#6@D_>AW2D_b5@^,0#^1)IeMB8?T>^)RDEdS&^eg@_5,##
3).4+4X0N3+3;(Y2:,U54A1\M][-]2HAQ=JN1[O?S-X,FNX]aY]4[X_S;E;O4=aA
II9:UY5.R=Q&_Z\@I;-6P,-\;/2WQ#c)_4AF^XZ93bKT/Z1gg:J8FHA@[=#(2U(H
C&F)7LV7F=&\/O.TM,&#PVH+Hf85=[_H3>/1J+L0/8V6UF6I/b_<,G676HG2U7]H
U>[dP\O(FUQ\+MNYTL:4>BcPGJ.HO7NOe6Vbe0cc]MDGIMfRcSba_[&a.T]K)XLQ
48^G_W=/L3CZHV0+f4D8B4/?,aD<Jf?d_.#gFfLIH(WJC4R;EgE/fRFHdF0.K5bH
8(@4gKfP)+8^IV6CFNEdBR_2S_07LW>N5FdEK5G=6M>411I^@Qac])3FAD9MTFTO
X_RP@g&=\;SLH]<aG_UN^+[ACeK4Vd+dWXV)B1G5F[ECb=/+(F,#W1;_ba9M/Q(Y
.bCBZ[EY56#bd2/IJ4?c+B;)F:ea7Q_;RYg#JH8A\+<f#83#=g&&/A5dOR(#Ve>X
7ED.c)8IJ@;aWL+_.SFR9[ff4bdLM;2^[M4+]<R12-=UE\B56aI_cE6bR[M+YbP;
[;3PLMQg=PcRDcDWH:0,0e>D?E_MH1HVDCa6[\,eM[9_+>OG/cJ6FD1P=aOeS#1f
A=]0G#WIWN4c-(VB1e-6WFUOLK-XfS>bcJ)23BHe05G3W>J<I#.=(AZZLPO7@NJI
d2/4R73)JVU-,?A77QHed;5J)?Q(S/,8\cE5=7J20-YF?/B-K=U5#X:9b[PT;LW\
/gcLBY?<MG;L7L:X5aX,F03?P/95d^H0bOXG#cF9S-><N60T9TBdN;BNAA5COZTe
(.b7FGN.(/XGGK>0A(XN3=J;aGN[JRYK5,]_b<9)MX^adA.7f3&?@),,M=<b85H&
XO2OH2aP(g(Y:1f;,>8-gKQHc75#6:IX6I<7=F+Q?ddPG.a]QSe/^PaT>gK+.31)
HQ=P7R+ES8&<Ge[TEA;9LdXaM?.,HF#G^bgR)E))B;f:42X1,4#A?SG6;+.JY^[Y
4KQ#\NRfU>=-Qb</]WZEYS\U7IE_B=D]PH2AAV:50f\.YQI.U0LZ>[DNO_c]?342
=G3e/?]S9X:9K^MC\7aaQa[Z3aY@GXJ)dVTV\Xa]GW#f4MXJg;cD-U=3WXCCdDO0
&5J5a,\eX[3Y@RL,G9__U8THN3T8,G7N35&UeIXKGD8d+.?RI3:<F:A?<86eC:_A
0,9f(^.Y3S.)CKRB1c>;[7-L>GZX\?3WD+(X-#f#TFWUbK2bBL_+]5+5H-VS0,M[
[Q/14&G98[+>M9e48[cST-ea(J10TfWNg)D1f?VaPd/-Y.3(#f)Q;9A/(UMP\0;,
a_]:bHOHU2.&NU?Y0ccH<ANSF>-dY)eDg?3<=SZ^KaMX<AT8^Kf89VW,FLXC<aQb
(?YH&O+BJH-0X-XJ&;MbBIX-FC5=46WV3_MNB/>XcSA1C]+X,+C+9a<MA(81f>Y:
C^63#P_\W?EG-<@\&Q/L@[3;>_NT1Y-9W##2WE:]4_#VN/7]-[\SdKN^4]J#OGG]
g<\bTZ\b34+IeZ_W]eP(f+=BL4AL?\P^]8IY:T>X],JNS?80Q1;Y_1R>W;F<#K&U
)1&PE&I)6O.<6=C(dPM.O=QC9.WP,ZYE_958?bM?dGC]-TW]b<P(6_/8Hf-1gF;,
5Y<GV&WfFSZfRdOFS5[X#c-375^M7M(L<gW2C+R6,8:EPFF[&V/4MZW5dNN6bSFV
7\.^?9]<=\ULd>/;-F(A;\V9Vg\.#:GP^dL>D=VLH60)bQ87BdZF#a<ZE=5gW?;I
geNTARdZ63Q[M?Q7A3d;[+<;(MG+RJZbC8b\dXbEW)V@dR5b^?5]\D_H1,K8cOSd
aWX0,X?(M[4fMf^Nf-,<,(=_UOY?UN0/d)WN)EL/TNW-SX;Ac.[gF_4[X:Re0F_-
/I^V#ZfTQKHY=H9Q-NK4<:Gf+)aOeDXN^MNeLPBf>]?c32XE-O=1OVI@)N3e?)W>
_[HWW/Sd.S=;ID?\1b._91Cc/9XN;\S39>>.3>HKB(L,a\0X&FT(2&K1<F6Of4S#
YTQ]fQeRFX:RKKP(NB_9&2Q.\ZYL61PP4R=6+O>f4QLaQ0:/[45_?)3;-gI_3D<^
(SVgUITE39\?=@T&;f:_I(X88,O65__.FPC[R1K-W(;^b8RE8[3=RL_9AJ(Y6<F#
H[3Pd27UARbPQIUNABX,4g\#]FF#(Ea>eQ<bAdS-HZ1H?XgW;+:S^_d7dRH^C:1\
(1O_ZN.ZW&a66IL(]fa/[Z+6\\B>FJIg7cZURWJT&NZ(;UV[>KCX[LMX=&a<-[)S
)+B)1]=,8,P-Qd)>GaFB4KDL:5f</<#5=\ISe^LL56-:cP1-JJPdg4>X8.:U.c[-
3L8B,gZ<O8AHW0.NK3=;KQB6R+0@@_44-e<)P3a2aAR)V]TR;Wc=^WQ;+NM\VDBU
?fHNY.#H#QW]F=Gd6bN[-<)WG<g_b&d@,FJWN]>Q(Y>_.e[NE+L59O;eDL29fSYd
^J3MO=[KPHQg6JVS0\7F,,aG4OYN),HaPJ;016DIZ/I3\&d=YT(Z^\V\Z6AL99da
E:9cW<:UWPD#E8,>I;Z@#K&c0P8J5fYY^8BRfMNdfVO1=NGN(VEIE:+ZUVR1a.c0
cRaT5JV9]XETVc1T?P_.fgeV9_IR4O>>ECX9].b8\K,FeR&9BL(BA\B+JQUP5BDR
Q(&/,;9_gG&C&Xf>E8CX0]:CSP,1dcKTaZKG<S@DaV:@5e8XQ]&?bG]XR8Ka3ID.
5(.&K.Q?LPEAg(eMK4;BD;?:CXNP0AOE<+7FcgMPNZ@+P&Ff8BF;;UBU4>R=O&gY
HMYMdKc,=#+NO3M.>TH:(Z+.K3M<>MC:(f&gLUR[Y\7&5=QIJ1E9OL.XD35(>#QT
f-,2E5^GZcUJ1]8MBTRGI8(-WEZfAAg5RD3;#B@Ge1YKW5Dc[TONW;LP8f&3(5B+
:=]fC9M]J/V2eH(LUFA=0Z_bIGCN][+LJ38]-5Y;N2Z\V\Z?LK7_V<cZ1D+L[.Y&
PIaN.aH3?.QWO[Z=^@J8dN](&56>ZSNVN53#;2<>.72)?8G/V:5L/QJ^]-^_,+LB
,QQg+a;ca>[BR>R^Se-EeE/2MCYe,OX]^>(3PG=Y+21dVZ65&QH4QM\bNU\dGQ?&
>b@+ADB>MEAQcfK7F9-\ddY;BFHbQYd5B,b,W9aM_O^dE$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_UVM_SV
