
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

`protected
O82N3c>]_CC7?MOD3CT:P;PC?YJH++C44f8W4ObVX_U<;#4bMV=?))>cRNWNe#&6
M7QOJAHU7TBPF1EDMWa[;EPZM;^455Xb/O_PBcJ<2-/eA\M8E_TR)9RS]?FZLA0[
VP-4.JNSD_[Z/QFYb7]NG\&baKVQ6,L6XW3RA0EQ3_.P3RFe[XDP90RSI$
`endprotected


endclass

/** @endcond */

// =============================================================================

`protected
<g\M1(fKHg2CbUA=IB9U\;ce7R^U6f(+LaO[?HH\6VTIQM-_3PDU))9OA>S#g&eZ
6??=a<+d8H_b7f\-d#E-eOEFd:<=6_9+9BW<KaIVeda6CY,SP#>LR(eLcK59=#Qf
U0L/DY6U^Vb#P_V)Oc2YK<g_U@GQE&=J9[(7fYMD/DW5M40G&Mc/:Of:GgH,eJUI
K9S0[D@#JX^#0$
`endprotected


//vcs_lic_vip_protect
`protected
BK\3,]>RXg;8OHfV+=SI+c/-S?UQ]NVb\5,M:-.JK_)\g(GOJ\9#-(e2;/9[OO4b
RW[LLNH5@]CISQ,78C3#&:U5[d4Ic#00/D:a\MP6S7aERT1#WX<:O@fI?K&gg#&]
,82d?>46Q29VMd^YLZT:F])L[Y[Y02\]7>USL<I_^,A6?I+)#D,MID=fYB&&Tg;)
#ME0_]WPdCfIcZXYTYeHXJBY>18fOeMYFbWN&F/b^V:gWC9Xf\:>AGd/I+BU_>7:
6Jb9HA=ONS-4T\.<+=aKD=#1;BNgZ=NLcO:)]YSbO@U\23WLC1CX-1Q]M66CeRIN
9U:/Q+DP1ER-W));L2MTNW/XYcd;L\MFVOaCG?AG:Q2<SbLJ5?(cZDf\8)KF0_K>
&_b,cEG6M,f;@)Xe5Qa=XL>1N]>=GD_IP(JPK]54N=V(MD1&2/3RNFS[B2_\U(Ac
82-(/=W&geC];/_YEfYOO.TA8ZNQFG#ZNU1[(X=-b]UC\e/.[+5W4eJ(YL3([BRa
Q6+DG]SN>>W&D\5R4c_9(_I8[7L^/4f1F0\2(e4DTM_,,QJ\@WX0EH@^N\4HC]\R
J.?4ad_)AG0d1W4P)N+F<7N\(;c[7bcTP?JF_/cE7dJR?OTH5Aee7HP@N-Jb2?>^
)a2[bc_a5X?Y0MS3@,8WfV3FC<PA56O7.;Jb0a)O(O/WeCPA:68K-6R#B>[OE-QC
HLBB<RH51;O+?B<:V./+TJTeUVE5A\\7/8LMe)T0NWRA<>4eXF(e[TbZQQ[Kd7F]
g;,d]V#LJYX[+\)[P;#Bbaf(c0JcG&LI:_EOE1_:Je69Ba1Q/TFT1gOI0-8g8IJW
,K^cbR\(V\X[&,\MEB/Z<>R/(d/TgaVcV9+W:16d0@bFPX>V2:Ig=&9ZgG4gXF&<
BPJKCQ8HdC5,&?_OI,gBDH-33Sf71I7Z<6J,0<79<-5gFE9Z@Z@A-C:G/YZWBWFe
9GPJJ&dD(-&[WTEB=cH^,=DLMS]NGMWU(F6#K+VFU^Mf6WEVL2IL[2b)GGdH)gJ1
3R[?aF2\3>fB<;LKc1N6_J7>/@:V@SB3ID>b)2/H^e031BC\2ZeA7(UbaZ>8HFY8
B(_^S=),&;cPRHGQK9&?@K?dY[7RJ>TPKR&G7Hd(P[YKM]LOB3Fe:TU^d[M@>Q\3
??bS3D9,Gd9[=57=MW_4/JZI8Hd#)aDLM7aJ?b3ag2VZcK]Z7(d7H^:6&F:,V7]G
QYTHOd0e)&bK/_Y:5ZeX@KM^MA/:U:WX<O56E:5;@6K#CC666>Q#KeZ]E239FL66
WVWI2I0XXE\X^c=&\<VLg=b)533#Na6/ZA?AbJCDNQ_@3W6UHGM@@U?QbMHaJ5?W
HP+GVI0YXN461V,0_LSK:O:@S1#We1D2C8RH@0&-LO:H#?9X-UN1.3(,4APC8]-6
+]bVC=K.OA.+,QY&:SU):3-7dXg>2d-]N-X2/EVb+#=-K@ENOT@dN?YQB7e>67g0
]@-]47EF371@ZB)P6L?H#VC3Sdf.9_WJQS_RVG,Oe3C3b<1<MJcN;3d&SMNCW1eR
gYa@TIDfU=9J7gY-IX?3dB<S+gOMF=W+AGaLJK>3\&\d<6.>V0K;YT3-=b,K/\8D
+0F3b&G:bDLg]gJB4^RFDLd7Q\J62YF1AbgVDW])2+89=MAeF=+d@H7,:+fa#NER
&.=aLKfJ7PU_1XZI&UUUA=Z>O&?7VDZT)\^\a;ATVa=\)#T4C8/9+:_E(\.\PKLW
VE#eQbV[.K52LQ02R=JZ5a#+U84O-OG6TGMPYC=FbIHc6f_HG3/:FRb[25(.=c^:
Hf.RU1)10AM;T/24W3KS8^7;8DZ:9=YaZ5+C_C7f>-KUB5:(USYD1/XY6b+DFIQC
Y_[aTBKP7DD&67URO[-J5+MZ-O&V[dQO0)OWB+ZBT?M._(C3>7Ec-XAO-d>[.Q)\
RSUJ/Eg-\Y(#b=8VDU50(Q\,+c[,^B7O#^]B0)><V,4?UPWHYcGWeM0<1eZ<3T3U
g/R4N9:8,-gaYdV3)BVDO=ceRAR1[O7UD];.,Me_ZRT7L;(\62;&DLGI182gfPbH
KBf@/U8GfHOD1^O1C/)C&L6.UV:H1IJPAgdCYPM5IM6c\);M7[#A#CB8Bg]J5\WA
:-_3)bM_9U0#NF/O1O/f8RN0HRWX/5:N>7eY0O3I_9]X_N2aV-NQZN\>FH:b<,?N
2WCY\RXe9Y0&N>G1Jb73QH:L/CUFA6R])W^b<\D7W4AX+UNN3=[5cFQ_<W\:S\33
)F,D52e6343K8P7b;A<-4Z#(<JC&58WE;aD0K;1f7b3^S;]H>NgNF.43U(9.[?6T
/M+Fd\X/NC\Y/Sc3UP2&EJX\[>d,VO6&>9E.b82R&PN3bV[8;VGQ9g[GV^,<,@8,
T)J8>K0H^#N^cd+6-B@]PP5IT<e^047SPU_O\EgNN.Q-eNQMBa:.,P;J]CT&:BUb
NOO6\O_\?49UC&^0fQ)V>1I=T[XG\B7N3fP41QbDMDeE;IOaFRdQ?WPPN-04/B&f
K+?;IK8V;.8c)K3bFC5LeO=K=^INN#SX75gFR1-.7?Wc&2S=TTE8L#TeL@\G3QE<
U))66Z?S7f3734eUIYON1eEE\9S?,ATcX-;N\P]B\[dXf<.S2(S&M1:>T+OBB=PC
Mf.2L[aQD6PgMRXO,K?E/3^U6M/a96A[GA^<(.dM>OOdG/.443U55@cOM)SAgGO6
WO#2-&7fXFU[A?ac&f+E^>CL&S>(d3d8f]?eM&P,&NeK/M9.E8G3Mg>0.C;/><H&
G:fP^G>+e</Pe^[[0g_;TUQU3a9YS=#?e:?X/cdHfAS?F:]B:UT2/3WGHc671?7\
(<0S\dZZC1A_Q<2a;-Gd<U^S:?^H-C[EJ.YGT>NFc.a:=W=[FMFe.EXFW\&.eF.(
C@LbNI&36)6&J:aAQ:P&bM17D1^4JX]@0e;1Ge-,4,-4>)EVLO-E8_2f]UgbJ5]G
U&>A_Q.1N/(FJ.5WT[V5FK(+RAa@OaOPJ4,>?fEBSB#8SV(cI2Z>[;2DTLY/K5-I
)2&RF]dQQF>QC,JI99#A]cPC1=2101DJg?f@:D^,:._+ZS]X3/&e>2_@.bd9)?NL
@<1&3(=2@Z[4UQ/7NY>34:.e1^H-=_&Z?2828TAU?^L+>&aG=PMgJ6_e6XPJ7H_g
J69Y;1)K&F[eVaA&[[.]3P@FY@MWNB3+,C-XFUOUSa^0:Me#f\(S8/.5EE5Y171L
O+_L7C3MV^?=4.U([3DQIRf8)V=;W/a&(.b3H/cD+HW<6+SPMXgYGUDBJ=#:[NGP
O?8H[.X?19@2F?V.3.>+d1[]c91g=IOaaP&<7A+2a,JF9KKHG-6HBFF9U5PdX&X4
#1_A8YSXP&W9-EM,);O7Y3VZ[>J@J\-,g]Cg0O/N5>3YR52+e2C^0UTMe=WF:UQ;
;@SF:<E9M_FSJA>/2K_Q_0>M.HH5GdE_#6SGAG@dUX7S=C_gLVd-YKE=S<Q>9CN/
QQ0=5>^ML\8QU5FW89:SMgE.Z.OAM2,aH\E+cKCLW1BCPd4L#(_9JUb:>0^G)FQ,
=g?DAX7<E,V)PML?/g5(DcN:Lb9MY]JGNX9&dBgN(U659X\(a,d;60+3PReF6^I2
c=54^;&YV,<+,LX1F?&a)76T#c9,faGTaU1Tc^YW>Qc(D;d?F,F.A>#M(#7YID#c
#ZR;+)&OTMFZ^3029b5FP3P@[[&_1=6C1J.1b?=AY9;@U5c;;Q5;I?F2QX)U&5);
YK&bG_HQD,DgEARXT@DS]]L\HKMDNIR\9703]bIKdR4?;M,dA)Ya@1AU188:c.9Y
HUc[PCV?GF]5;F4^\a[^HO/dc9U1(I+8YB10+&F>#MEI0IcY:\f-a8g_Q:2),Y-:
-Q[cbgP4DL/G]W&]\BS[O8&VSQ8F-]XX91C),0HJ@\7S?8@<ecdJ+N69AWdTT>Z&
E7>ADREg-D@a&RJg;#?53Z/N:GAV//EceBS0S:ZY]Q1&-)C,2YT36E6N98g.:EX#
@PY8ReY0DLTVO3M)2=R2,Gbg]7Eg<HE6.H9Cb=G[8T^g]Gaa3La7[OAbAD]e;dKA
-[QV&A#1..T/+e/U0(gP3K;G80VKE56MH5e,Fg04X3>2>d6JD/8@NJEZXEI?6YN8
@G5EZVGI<DP:CPT?V=Z&\(W^YHYL=2-)f_?1GTNeLWEOBWJ3?TYHRN09HCBM=dgP
XZgC#ZLgVM].4RT;C)c(2J9FY;NO?>349LER[,;KJY]c3UH/a<a7;(ccb7ZR.:W_
:E)I3_5ZA25F&]?ece@Wb/7LATc^@K:A>;K>>\eM<E[^[JUXNXZg=K4/QH/;JOZH
KMIf2&1&V6VCK_B\>SK]N0]?L#7R65-BLIKc/)30[gY937bR-#T.7TE3F(J)XVQd
G)QJbHd15;(^F#7()H=V[.c;0#\CAL>K7_:VW2,ZfHa0bAPgR??0:RTZJPcFeOVJ
9+IED:e23B#aDL#HX=97QNIS=6#H?S3L/RX:DU&1DDGN6O;&E&_#g:(\fd1Q55:9
5.V>fIE7Y[RH^N&c(9CJF[gFNX@7XNS[@b2D4[Q:IW9X[[HSe8#5C8\2>FZ2cZ6;
fKb[WQG;_LJ<+6(&dgI^5//^7;H_48DL,D-Ae5M,=<5ASDQ8PF_0V3H;Y+W[a=_W
TKYEQJSK#TGG/MZ\V9RdO&(R:E;FBdDLYVI-0T;2MI#<]<cYBJ_[47=8Ug/((,(e
@#E/P_S.,&[U_S[<<cGCHb+[3XZgE5(FRN]^)5c:;-7WO3IgZV?G7c^]SH,RN5IJ
;B[(8\&20E[^@DZR6/8b49T.A<=KRUNCHBYZJAAE-06MGHBF@6[4(/BZX>Jbe(/a
=Y);:cBaUD5bf@9R/VaYNTTDcKbT=+BW2<17L6,4DOM_GM-g2)9)BYUHB7c&2]eW
SD.2MD2S-bR;2LS9WPg=9G45.c51+[.Y:W__4Q9T2#-YZR3FZd.GWM;5G.DS2&fg
9HXF)^gD<4Zd]g8(?#P<bTCZLIBUSA#\J\@FWN52>52T<2M>Q7aQbO#HIZbIe#(^
9fIO:7TX.-SYP>GGG[]WM[4O/KBFP=bV[dPG_TfGZ7MEK21].<<cSa)6QdY9K;b0
De@+Sgb5K?;#@8?;M_>ZX>.[Xf<7NCSM&S2W8aBMAUQe9bZ8Q9/V7/T@9e4A+,AW
QNSfV\:2g/8Id-e]FW<=<FBG2+bgbO2g9X56g1V?-(O&&1>;FQ_<558ZF=@b@F6[
D8c;1V@:,HY?@^TL#P@ZQ<]]B@HK:cdPbLEC^V.3O)X7M4Va44\UfJEXG>AZXd)\
\O]EVJ<+86_H08?AUW/A&QM@21;KLR,HWUac#=/\Cf;@gTJ_93^J0-?X/(R(?FG[
?X0#VVD23SN1UIQ2B;(A#0HbSXP69/Rf(=-_ca1T75<>:(7Ud?>0W.)7+7ZWB-9.
YLF^g:)ZB8?S#GA].U?Le4Qg@,8/,HZbC1RP\:P,O(/K_9-22+@YbJ[3Fc:@/[WH
4EID@IHXD5SJ?>=a2B/9P\X11P=M[()&-0A,FI&b[_D-HSg4F999S6VQS-aP+=-7
W-I66+?F)L.\Fb1bX)G6^K=UUfP/W>Tf5\0OG-gaA=9cX2W/XJC6SELCIM\BKHU7
2[MO4A>ZPa1ae9/>:>92Jc<:Pe[HMVS;-8W^VSJ&9CR1.AcZPLU0E#LH7N9JRCC:
^G,1Pb#XN:4&V:&])fgBFNPggHJ>P@J&R^#^)#6#PGB54O0=K;PTA8K=OIT.a[FY
9Q810W<EHY<F;g?907?]V<^^(>#GQ0T8Uc@\c.J@e..HXVHBdQE5UJF3D]dI:(B#
(EEe4(:1:RYA\,fN.fC/9B^<K6fO:F8=K(:F,4PF6_eTbF(5XNdF/aB:PSX/=QTA
8-b9TI@F-GF:8JK8&EP.2:4N#0\6SF&R-A^_93dQCQ;8[W+B0R3I2(/=;:T#C_&F
&fXZW/-FU_MALB6LG0/\SY\/d^Q?GF42-&)aFd60g[=D9EU;Pfb;3CUJRAUE1>O]
75)3=7;0(b-VTgMJ8XZ(aF))X:.U+O82KH<^NCC3:UGYePYfKWN7Jb3XHL(#8,YD
(+[)HORC4V)Ma9/-F/2Q2W/K[TAc&Y]NSNOODUf0Y0R7F+Z+&.#I[E4\f2HO.I>F
?.#H?.U?+8#BdV<Od>A?SUcc&1=B02A+7Y=BB;[Wd;F&P8e(SS24G1X/6K4EZSXT
Z=D2QKX00Y\[fYD\gLXYaJETg58\]5XR;]^468&X:NJgDC-Eda,-#K4f@@YO],_-
JNERW]ZI:\IVcN)KbXOBeK<cc3BYQMI@&(_+Z\7e8SDUbd/2-A[2WN\ObTE0e>d.
6Gg,TSXKBV_/a7cS^g1<MUWDTE9@(Wa42&ISdE[Ic8g9+C..A03bK2_H=T#,9,3d
bDL5OE[Y-FQN5J9.1<-V^A:L@B6:b:H0MRZ\R,1KKW>6f<I[(d;;OUFD6:/8\FF8
WJ::52(BTI\?SbTaeS.+A6Q0_Q342-FH@=58:adOeGC3-9_c8eVOLCGIX9S1Z1WF
XNA>+V]D+X_ZW@_M)DQ/:T(D9[g-YZ^88UU^7&-R^^(EINV-_?S8a+#Fe;@ZBC2d
SVR-8DJFEKV6JN6Q,+&d<N1QB7Y016ENaM]]R,9S]05R4(Ygfb_MWbPLH9AMQ1FN
W-7-0(2\(M0Le8K&R4;7M-HdM/G6G.F<YN=P7)K:fCQfZ2H>+V+AS)504&+1:G_2
IB]Z#TU#4C7IJ+0X;cEf1W(eA_?.#cgEKV\(N:]-E=;9U+T,f)_UPQa4OQM>3:FW
Y509\.R#I^&[=/Da?UTS-<.F7X@MY&DcEOH;#CZ+/K,dfI#EaZ:@;;&:U;SF=OXU
/Xe0=@P4T41N/N^11Sac86OZ5O-0-M&I\]M/X_[RJ,aP78/58-VIPH579_E.DeXB
15A-C2fE&gX/9D4GgEL,:\VATU8a7CNG33ODd_J?SZ.-)#DG(ff4;DA7DXP<W(:9
.N,Q:9BN(P-\S02AO6>SD^I=/+,&9_9SbX,)[\2FG,YIIJN@1SY71-U^VB[KOIA1
X4BaW)#If#Q:,Xc7OFC@I+]fFL:eU+DgNQ39N<Ee.eIE8aXXXg<AM]aK:QR,0OUK
)I-H_F?U>#P5)?/\GS4@UWJD[[S15dfLBe]:?\CCZ]0HTX<0R9XN()b[&cG^cJb=
U<,XLLG60IL?MPK,@Ed6NgYF8Z.^BY-Cg9ZO_[Bb:YJHZ:<N]1;A;3ROaa\bMJ&[
BFFRb#CV@)RUG764S5S/Eb[XXZ\1F@C[fKe_WJ+F3fNeO/aT3.[,\>+I519BJ@.A
N_QCW3TcB#&UMR:Q):O&SN_?Y,#0@c-G0aAe>=Va/82b(H0:-(GC<8+IN$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_CB_EXEC_SV
