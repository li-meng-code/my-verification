
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_SV

/** @cond PRIVATE */

typedef class svt_spi_txrx_monitor;

// =============================================================================
/**
 * SPI TxRx Monitor callback execution class which implements the cb_exec methods supported
 * by the TxRx Monitor component.
 */
class svt_spi_txrx_monitor_cb_exec extends svt_spi_txrx_monitor_cb_exec_common;

  // ****************************************************************************
  // Properties
  // ****************************************************************************

  /**
   * TxRx monitor which implements the callback methods.
   */
  local svt_spi_txrx_monitor txrx_mon;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   *
   * @param txrx_mon The component supported by this instance.
   */
  extern function new(svt_spi_txrx_monitor txrx_mon);
  
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
   * This method issues the <i>transaction_ended</i> callback using the
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
   * This method issues the <i>transaction_ended</i> callback using the
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
   * Called by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface
   *
   * This method issues the <i>beat_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>beat_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
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
   */
  extern virtual task flash_command_decoded_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Power UP Sequence steps has been completed
   * at device.
   */  
  extern virtual task power_up_sequence_completed();

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Power Down Sequence steps has been completed
   * at device.
   */  
  extern virtual task power_down_sequence_completed();

`protected
7<KaXU,Ng0,H<Ag?,B,5P?TQZMW#0/8RQ?MaF=,N3=[XgNGf-EJY0)/19,H5a7_#
R(5#2Z8^F89WP>+/)A_OU;I,FU0OH9B.8ZIIOe,U9R@RT\K&X##Z1#JW]8^SfGZT
-N^;F]17JZ1f>DFU(dGGBC]AgO:N-PQ6^#H+SYYa;]TX38)9]6g<1H0H2Z]469#7
aVVS>_Md6b_f-$
`endprotected


endclass

/** @endcond */

// =============================================================================

`protected
1F43K:EfY9cD#96H:#J2_J]]d[)M<eUS).X3F:f)<1VcHfE^HY,..)6/LJ.Q2TOE
Y(N9BOb[)&XUa<W5MUNTg&4AgQ3THW(G@(BO[I.A1DVO/GRMS<ZET]PZA?:Nc3C(
KX-Y)V5c35)1J\1-5417Cd@EH?dZFa:IZODKfLf8=J))NJXH/;/+MK2__VXNeB,U
SP19&eO^>&Y-,](dd=K(Z7)W5baCZ3S53XS+2E>ITRY-f30-gU<.=B2_L$
`endprotected


//vcs_lic_vip_protect
`protected
^&eWEf4(ebMbWcT#Kc^Ub@L:N@26793D6?TI)gA0?C^c-TZ]&b6S&(R)<[M^;HeB
7_2J,O(?^ZbP0(?I1dE;c6?X2\e;e=QRM6E5P>3.5VL>66WZe0GI#f_67^MVd0IB
P1+;DD#<Z6&bCN28\:<.O;G._Z5R+.1,1B6I[_S@dPU+)DXODLHJ?Q-E1?KD7f6c
:6>a<N0^Z:a);WAQ(1)B?QQ,P@[7XCYBU0,5I.]=6@B]@ZQJ?I98^A4P49Ge(T_.
S;V?^bZBGDC(9OTR\b79/]>8+gdd=e@JV<BEI3?ac3[.A=IZ4-fb1BXQISL5f^a4
=G.dMB]4bPb/Ca3DB89#Dc-499_K-eVfa@;IW\7[54P3;gZSTRcSa-^SP=W,\U9/
R7]H7=[[S20L8&83]bM&7^/KW0FRXC&;eO&YX\=:W@Y+UTT:OeE.-#1L&E@JXVFJ
e<DGOe]BM7BFEDL&J,N3RUOETc]#(^N>c8(M]QTH=DWadR-2=L/LP6.F5Ag&GRC:
&I==#E2Dga+6X])VR#1a-5fF^1,Tg(O)UP/PPJbP&Z[^,2Z3[-3J4@0.e4_e;<Y^
,V1K8NYG;BVDF@3Z)&UFE7(I;,fCG<_:cWAJ^5YDO-\gfP&QcU>JY)^C+>ZE>^F2
#Rg<,\O_1GZ8+QP8_:,3:Q./8eP.C]7_eC>7b5g&0T^g>+915D4aG/?L#/_D,]KJ
L\T2[df:Q1GHRCg,2:LCG)IBC3g=MLVKWaYYcYbY];[B\T0CSae6DZeK@<5S;P;R
<<:1HFT5_B+8O\5S(g;Rc.69)eF-E806JI(e+07]]G[gVF1[(XHFaIKU2cPCN2)O
D+K:[V->[X>.,[-Q#TfbAEeDKA?CCJG0F.\Z@H-g2GEHKgQa4Q5=,e0H9\I[FX_.
Z-?\V&?Nd,1c5T@#&I(^WF+,Y.\Q-]d\7G>8<@3DK@_(&L[7,g1)dFQ;cBZ-[M+#
NdA0O)Q_XOFG_1b-7)EWCZNBD-@D]f=RZ;5^YH]CHXOE,]?Z;/XB]9CbX\)\G1=)
(dE,d><SUbRdeb@geA:^T7PfV8+6?c#[\7?2e4N#28D<,>V]dJX_Z]I.+W9dVafX
a[2B7NO?[>YI+UfP:#Af._6[N8P//>T05bG6^f_HW@>.7Kc83a+K:3Qf/N0Q_V<G
2+O#(c(<]7=)e>^/RR66+,Ia6Me7F7CXCT)PRDOP)F/be)I>4X_<2^+8e?JA^^3\
0P\X./L&Q#fS.;EOf&V2)9eB:N_KPeJQ+EB+SUbMgD5a)ABV8]F.9]=PZe[YGM3f
5_EJ+E]aSb-,AKJ8R8?^1+TYR3/@T9D&5SZZ1EPCK8DA0XaMCOD]_Z)HJQ?MC)BD
0]_]Y7&00H.(<Oee8M#bAT/f8LTF=I[6S;)a<baE?#\bK=_Sb9YW9HR\5FabB&MY
IZHXg8TWgD+8R[(bL+6X;6C28\M3)6(.;6DTI]P)],#/.?Ea0EXaU_-??RAd0EOY
Y#aF>H\RHEO@BR^_SI7484.bL#Gc\RT6_V1]DVKfLZ+2(HVf\e3RTXP>a+Id]RK;
JP&GA9S@ZQc#da64MHgT]c>5LHSF<0beXgP(3=)^\=,,BF,K2=Z\(09R^9_4]?CI
GU19^(2I@]gKV//:V.ec/5^cd)(,_-@Zb^O_H1-<aI3)4(E_WWWK2/ZMWXWDOfg+
(R?EGC2bKLO<S94;&d2PD[GJL;=8B>5U&QOF(()e9XL+#)NV<7@E1,f(KP0b:Z&V
#Pc=Vd3e.cFN&/Q45KVEbC4,:PaE:KKO+1A?P22U7VDfO.R2><?R=E4>_\dR6e@B
4e8Z6A7<2P(,9X&O0/+_E[JfJDH^?)8OdE>(SR_F.?,)Pf=TLe/&[ff]W7P4XK/R
C?IDbLKV&7J4JB->NKJ[>57D)?[Y-#a)>@OV_>8\BN#.6,JFHK_dCbVTS;>Q9&@d
0DV&QR.:T=a+L;@.(/cH^B;>_P.G+4LG4+Rg&@@;^]Od:L;&2NNA<+:Q#?aQUe_)
Q?,EL>c)M33F:ZbF,OA666#\?.,1A+ddgYZ+e_f1I&Hc7>a7D^?]F-K1;5&S_(Af
TDCOP:SVaaJO8^DB;:Q+0S>IDCRQA:+=ESGAVO3G;?M-^F835EO\FKY-M+>DUI=Q
d>;1Qg@&dGNT+-6N\\3<8CVbO&9@.F(b5,/faf<9ROSLFgX,,URFK\BBF.O]+FLQ
M5/7WT=C0E<<[\cH<D2L8\?/Y4)?HQcL50>^31F,aD(QR;<G))6N1\fA\eKAJ=_]
2Hbed1+R;9\/;2I>PV@9c7)7)W[Z#Ib9W]16+WA7e&UMG5NY#MDNf?SWe64./MD=
fL5B;C8;._^UK;1<^/f8e9;29Y-f7HA)c:PUa<c^0+:_VQ_RCbSc9=5aDH[aU<5/
D7J3HH5X#[LI@P3OPA1[4&ARH;2+R83U6;5b:/N)U4<>XC^MASa.)UH1/56,Lb>c
,F,#S&e:#O<ZX.._AMQBX\0Qd#/#I?IH28;C6gS,RB.?ea,KePEFC5J1&^F@<=M@
X3XXeP/\0^(UPY-\[=J=Q^HGaK[[G4=PS3MbZ9+L16MMPQDb41dJQ26QXKNX9bE@
)I0=Ta_HM^3U;.;)+09PgQ9&BM/JJSZH3CZ=TB5^4bCdK^:NQ006S^?F]E/b^-?9
1=ZKcfMOeQVF[\fLZb#5PV6(P5U3)(8B.LVI:fVT[<,<d1\]\YQLJXTKB\13HBHO
45NQBBK:&RLPT<.d(ZN?FCHD651Pg63/\M-S:Y][K40E[?BV0.?QV;WJNRefKG]a
>95Q7#KWHQ3G.UV6;,D)8Z^5=5)LQ<f\1G3-\fQWV/O?&1DNIO+T<5+(1_(\2ST.
;.F252bZFR5++@a&Tg6c3-DNNe\>f9+>A[^C9K,5=9,Qf[VL,R+>J7C#ES7/NGI9
VF]YgU;_WT5<U4DePK983JZ#9.V)=;R:+1=FCCH?e[68d\/[gP8AVZ9WCQc(AYaX
0?bRSRBY#&NS:<Wg?,=>^&Fa=,FP9#/L?,5U74:IOfU7U&e-^+.0e>fa?(123?&W
]:&_Y+:0X4\YT1IAP[PL_:62Z[8CG[B>)/IP.dg30]ZI4abCa/XMS<6/9G47CE_[
^1#Z>_@[<1X@9I7)/caX9c>Qdb2M^Y1_K+VDC@-)K6L54_JfU.Q2,d>_U&8H:#22
cfVb&I^5VNW=^gB>7gb?-^]RDP/K]0,F]Z6+0Y/1:\&8G20@:-eC-C13(5]?ON<A
=-TER6R5<V?5^0^Ud@g@M509BfgG?AB9;263Y8f_@T);QJ+4=+AGIR<U]D9U=D+#
0S:DXO>9@XPON\Gg2L@7)2XT5HbMP>GK&(.Y>-BTfU_1Q=A]]3]fHF-DUMN)[9R9
D26e/>G&eN8N[=#Y)cga\D<NBP/_/;\^=-@aZ&;OY^J6W>LL]eI;YJd21>WQ[XEg
P^N:C-(/P[-@b0K,PK&Bc&,98UKBOW8^87RG?+fNV6=O-?d>EaP@CE5c?PA^4=W5
,95JFF^;b3P1+c2.0Y,X3@dZ]:YN,b1#OIcGeNEC1-:173X151^gb=\Q39E7Me2A
F#3W=F20X6@Z;NK1K_E.g,#)\5+D#<];ffU1b#ce\6>YMLZ63=A97CV^0PTIY]H_
8].NOIM?)&US0X#XDQ+;Bb/Q:?IP(eQE^K>YTP2YXS:><@1Dd&B&AJI4d#[,W-0V
T_WT:;6P>5ZWE+BDeHB_5UTRFP]3]6G[cK=F:Ug<.WbUO;3=X^Jd_V>1C4QI1If)
1d+O6).T\IR8H&<X^S/:N+gC+OTN=LT>dKX#Y+Xg>:21:WGWWH[U:D18Y(,CO?<^
ggI8^/d\#.FP&^f2:2^6YY@,/49eK:Aa/+1g]aWWL+TUf\f:-F+)H<PH@ba>ORR.
@2EHIOL_TP6HHS758&GRC1X;K1\IL;+=KQ+[\eCc9I=M^O?VV,)S0&\_eUR:2C3A
:8ZO2KWQ/)):\TC9dT>^#=C;Z^EcX]R^UePO9BEC<0^2UF\^ZB?>WGRD2E(4SEfC
]NF@6,I(U;#g1f;_;XG9/OSP7R0U;,?Pg0K7,F^OeL8^Lg-_Xg6X,Sf[7H#18VS>
723W[+&\aC@?08dTP7B?J&3[M0eHI&9PB6/BPaBW3CFO1PORTU[?f/?1D0TK;SN6
B6AS]gVYZ<R1UD?0;BCY[?1)F:[L#]XE/G/RXPUU)H=bC(6+.JK2-?CE/A0;OTXH
Xg6F&:.U&?&agLDXI#OB9P#fc::/TMNSGa3P=(X)<D^KIP7f9;,5Z:SPN]e0+b3C
H3W]d=/>XUGQSW6,?bBU&L&Y+gBKI3]-N&5=IW&.6&/c0(DV:E;Id#,#^,?C6gOS
=0af5,^,A;eB;bNK[8;8ZbeH1,<;;L\NMD-51HO^-ZW/S\U6-?Z75_U]9b\O89=d
IHbSM2O=4H^cIVb)Q5Cf:&a2<DM_?2IN8F>I2<#PXX/cX5#>7U>M[g@=W/ZXQ=Ie
#]e8</0TQ,T.3A7OY/0KJa_e\[@=S+cL(3FBPW0T-]=84@c278?\[+M^MQ+=X_H2
d6Hb^S:VI(8E]7bdV99=gN#1-/J1Q<H_CJ&EDd&EE>WVc3eW8e?<+OH#[]PgQ:F#
e3/QG1<Z6]dCIdZeaBU??+(76K9cg)5eK(f>I/PI\SbXTK\Q#>/<G_fd+K,G3?WH
FaEBCBIE1NNbUZEgcK?U#P)<Q-<7=R+=[(L^5eRDEX1#8ad>eUF(P,\gJ3Q8;A9T
6aOba9I:/aS6R_G&:FLg)7]/C\7>4[#KPa,g5DZ^SP_Db=E#7U0=>AZ3BaN<Cg_F
UZT>b;=#M8.1NF8#6;A@.>R-g(L1YB-@;P2]SC;8dU335.eD;NgH=#3&KHGc5>/5
37cL+9C#b6RfGaHPH\c[\BJ4#I20W.6M7[a@a&)#,g^3BX\A43aMH:-TD3EABPU2
4\_b3R&>CWZcBD_8K,@b]MPXgRV=46gLV?99V9?,aDB,PC8R44X^Z+gP;f=#Y6H]
e<C/0c>+IZUGCH-Y;g#L>V&c6dW1d8RAM(;UaP>;10P^UJRADS)^aT\A&L8e)7PY
7VJ7W+KQU\=bD&]1>3BMKcdINO,d8e<f__Mc2(M3QKX>3/>#KO<8afeVc<aeQGY3
X3.\5ICCV#VYg\\KXOL^#PTIGT3]La>>/.M26M6>?=0FGJE(g:EY.GPfGBF3#LQT
AL;Z/X6#:?YATSeO7JR,DJDBN)c,1PM0]EA.G@4A(D.6V2K06Fd+EU-JQ8Hdc3QD
?Q?9G-X15+g6#24ID]D\W<Ge+,2^G7]]].OAKMSYSf4J]>;MDR07XYU6T1WOF^YS
g(8]7X.2D27EAQT^e?&,:RV<6)0;f3V9,fWIL881MX]KUY_I[f/e#gEgY/(dM_G+
&AYBJNbFA>-(gdT+aU[2[]L#c.DX&R@6^]:XP6O5Q)Ga\;1\Ta_:<,Ge:E:?YHJa
g:?6Z\P_JWTbL;P(Z/#]X19KT)<-[B)CJTE/<31_>SMA^5_3I/YfNaEY14<K4CfF
XA7GRI083K6_)7W^1be@>ND_)UX19B8JO(6K=M98>#+&\VZ)C?#CORgZ1LE);E.G
AT66HYd/M@W&5A1;,ADNFCXXc=07P&/L-J&2-GS6],7QJKC37PbR(g;PO+/W@G4N
a&FZ3)AX1G.@4QHW2(UE.EFb6J>P&OSN2<]eUEECBC24/S5+]O\APA,U8Ad>KI7@
\F@KC_(=[T=1b.<&cd3_SP-@CdY>S4d[1+@=NEM8)Kg]8(MR(-:CC0F<f;0(C-D9
.;D)LWA.efNF9JZ=Y3Fc8AN03ST8a]51Ob@KM3?gY_gM?WCX#AfJe@b4WZ9F<6dc
MWXad((95Df?1Q(aaJFPgU&=/PRSCG9[HVM44cGcU#U_#9\C<-4>X9^9XH1Jg8[=
(/:5T6E=aJYGDIL]?I8_L6HR7d;F_76WKRBUe6WO,ZYK0&,K5.fO-5_dDP9M0:=&
7,[Yd2dKLH]R@R[e#S#MS38LPC1,;#,U0QII7d1OQI)T5^O#^DY]X)aC:eE\JCg-
cG3SES:0E7([ZGOIS?;52eKEe7OcBM539ZZ:5[U+&RQNJ8e9((c7:?=SRVR3)8)H
>9Ffce6MAWUI9:a@/E4[8F,@P,2QK&;c.67Y_K3K12eWO33gd</7c.;JadE1H)K#
0MUeUL()G]cg2\Ne8=Z#aF3)K>.[G0Z^E@Y36_-8?_SK\aC5Y?WFZ\.TMd0Me1V?
;W)d&#\#U-Ia8I&IOK.]Y<0WUD8=QNIC]Z5P:F3Y7Y@PRGJ\HY,)f(06[QL#>Z>g
QHFJ.Z.O7;7R09Q<NgDYX_><<-feAR\dNDeF1ZX=Z3P9N)_MgW5A)2F0cWE7ZaPV
J:^S1_&N?gPb[OY(4S=_&AZJ.]8HMgH(g,=Z&GW_<PU+fG_7G+<[W3d7Y^CV:BCS
c8dZ9VbDYR.PJ4e4eY5MZa:8DQ\YV)Y@8-fSDBP\9<TIa\8Oc_7.W^;)Md^J:Gge
N^P@AET6W6\>2P->ZIA?Zc/L)NJ:V6Y@#,d-1GJ-._39^S:64[1Ng.1/7FYWL9\\
f_JO6;0G-Y9SWX9985-&;6YJN8-8+-[+I)=GeQT/.5#IMa4W/[-;ESd1d1^XMQ0/
5<L/5L\d[W<8B^2Gd;MESG_J6K1Vg,-a=4<GZI&_W4OIG@(34Z)FTK+9=S>3JL59
TCT.[+fa5D??/JE>5ZYSUP,8bK\U\[U[]_0LLBZg-#7K&;HC^3\[1_>?L)=;R,W^
gY:SD@&&]Tf69]@f^2GCT^B5B6(?T-E]SU9EA5Mf,XG3a@FJRQ-3G12-D<>QWa,G
>J/KGGe.b+bC]e=,LX9/f,Q7/aK(5L=0D+U[HR?6ee>A>_4CPIM#D:T73&G&ZI?b
S[.&CVR1e_&FG@R_<S7M&FgM3>eR>Z70TZ325/D0fDNKN4R-9E6]>fS?-<2.&[\1
_D0NAD7Q/f41O>7Q(:;6S[KBKNG;EGfNbBAT]M&g?cgIF8A[KJ?EOEN;C1>Af]\P
O(@F&f_RcaC@MLRA#JBC/)T^ONH4)a2Q7C;/_Xfa.N)0VcOZR/K&?M-b<,;[^b_(
JcC3RbZYR+TOc/4C_ZVbU5X0gIPKO5V)M<\1?5U<4E[3G3^7eX.aNdg19FVUMCT7
D,DMT([5HE@Y-J?/TA=\<JG_QdT2,WGUNBOb-gJO8XfV3/?&5@[(Va746f/@>+(?
9Z+[E\ARHeg;WZ=c:AY3E[51AJcK7=,8dR<Z,[M[5DZZ<0/9g7ZG?9M/>KWg]0V[
GYJN63I_U#bWSOcde(=O&3:>3[VAV+C^5CaQ;[^3BI.bI-PGX?ZgK=9b/U_@)#d-
ETE?@\6/4P@[b^DH2P_9Td8P+OI_]EBMPW9KNfHP9Z1]g2(e=-PeAQ3)]9.L<4cc
T7_c>ZN#(4LAMJ7_[\d/C.ATQUP##./HTa4?P8SR?V+\a\]:;Vg2#)f<8\e=HU)6
f[QQQIJK_H7PRF-C=F2We:CMV5([:GdWC7SbJXg1:&7G5Xc<@F:>DAK\FJABd,HV
/0Z[f@#QR9<Qd(+7;YDe-5B)_Qf=WU\_1(<OEV/b]:JQ#EQXY(2eTD4_W[OSC?Bg
>FL#RWQZM06]La(Ma0@,?[1gc=([_Jb-VaIcB\)\7@TN9JFg8BH=]Z0HXGAAEZS1
T4N<M?]4DJ)e7N?_CG\4@dfVQ9F-C63RQ,0^&F?_1./6].=Fd4DU6e2S<G;_W_-F
9a==&+)Z/]EFa0/&T>4VfY2F[K/U#XBBBL8b#Ddb3fB6M3I4F-_,T);DSJO^7>^g
L^g7#47E)K9P,[RcXZ8A^b,dR)O25S=EE^U>adXSCY:6B$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_SV
