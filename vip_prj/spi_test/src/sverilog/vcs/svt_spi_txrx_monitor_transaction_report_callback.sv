
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
 
`protected
L91GOC^IZZSU>TN@fX#5+P1aY/FHS\=&L#Od[8LI-))M7JcMAg,f2)C@XM48ZZ\@
5A5OIRV+-&)f]^?[I5fK,9STK60]R:gCUX#J(Z?@@I^\dD)8TD,YQYI<+M(6Pe[Y
+7XZ2(f56M?:Ma2DSJf7TaGG;RD0#AC_XW87W?B/.,fDO5B:=#5-V5+HCEO<Ue#L
HN&M<7H@<)a+,&U\bbGW]d@J[S<Ug<CE)EB/+.ZLFcHVW.4)ZM?gYK;5E(geQ[54
?_ge(?W)acGE6]K.4f?94H668e-^C\J57SQ8VW1#B(N)XX4_&]K<EF0F1K=?<Y2L
B32A]S,-P<9TN<D.9Wg\CY3OBWfBZK@C(\_eFI=HBfZcJO#QW:4WL;HPU@^)4HS+
BD@3@27c3cSW5cYWdFEYaC:/IA@fQfP70/,G^S]R^FS?R.e?X3fO(#\7QI:#0QDX
cZ?]\4CZD\]M1[KZUO[J/AWZ^3,HJa:/#+U4F>cX[2bU,L-CJfPT&4[F)/8LN4H?
57?N/JB3H#gRGP][<8We(P^P^,c&d]6ANLM4KC.^15EHG\]Y_FO1Z)[FK$
`endprotected


// =============================================================================
/**
 * This callback class is used to generate SPI Transaction summary information
 * relative to the svt_spi_txrx_monitor component. Transactions are reported
 * on as they occur, for inclusion in the log.
 */
class svt_spi_txrx_monitor_transaction_report_callback extends svt_spi_txrx_monitor_callback;
    
  // ****************************************************************************
  // Data
  // ****************************************************************************

  /** The system SPI Transaction report object that we are contributing to. */
  `SVT_TRANSACTION_REPORT_TYPE sys_xact_report;

  /** The localized report object that we optionally contribute to. */
  `SVT_TRANSACTION_REPORT_TYPE local_xact_report;

  /** Indicates whether reporting to the log is enabled */
  local bit enable_log_report = 1;

  /** Indicates whether reporting to file is enabled */
  local bit enable_file_report = 1;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ----------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Creates a new instance of this class, with a reference to the SPI Transaction report.
   * 
   * @param sys_xact_report Transaction report we are contributing to.
   * @param enable_log_report Indicates whether reporting to a log should be enabled.
   * @param enable_file_report Indicates whether reporting to a file should be enabled.
   * @param enable_local_summaries Indicates whether the callbacks should create localized summaries.
   */
  extern function new(`SVT_TRANSACTION_REPORT_TYPE sys_xact_report,
                      bit enable_log_report,
                      bit enable_file_report,
                      bit enable_local_summaries = 1);
`else
  /**
   * Creates a new instance of this class, with a reference to the SPI Transaction report.
   * 
   * @param sys_xact_report Transaction report we are contributing to.
   * @param enable_log_report Indicates whether reporting to a log should be enabled.
   * @param enable_file_report Indicates whether reporting to a file should be enabled.
   * @param enable_local_summaries Indicates whether the callbacks should create localized summaries.
   * @param name Instance name.
   */
  extern function new(`SVT_TRANSACTION_REPORT_TYPE sys_xact_report,
                      bit enable_log_report,
                      bit enable_file_report,
                      bit enable_local_summaries = 1,
                      string name = "svt_spi_txrx_monitor_transaction_report_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_transaction_report_callback";
  endfunction
  
  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity */
  extern virtual function void transaction_ended(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity on TX side */
  extern virtual function void transaction_ended_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity on RX side */
  extern virtual function void transaction_ended_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Return the current report in a string for use by the caller. */
  extern virtual function string psdisplay_summary();

  // ---------------------------------------------------------------------------
  /** Clear the currently stored summaries. */
  extern virtual function void clear_summary();

  // ---------------------------------------------------------------------------
  /** Utility which produces trace short display and verbose full display of SPI Transaction. */
  extern virtual function void report_xact(svt_spi_txrx_monitor mon, 
                                           string method_name, 
                                           string report_src, 
                                           svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /**
   * Controls the implementation display depth for a SPI Transaction summary log and/or
   * file group.
   *
   * @param mon Component reporting the SPI Transaction. Used to identify log and file group names.
   * @param impl_display_depth New implementation display depth. Can be set to any
   * any non-negative value. 
   * @param modify_system Indicates whether this change is applicable to the system reporting.
   * @param modify_local Indicates whether this change is applicable to the local reporting.
   * @param modify_log Indicates whether this change is applicable to the log reporting.
   * @param modify_file Indicates whether this change is applicable to the file reporting.
   */
  extern virtual function void set_impl_display_depth(
    svt_spi_txrx_monitor mon,
    int impl_display_depth,
    bit modify_system, bit modify_local, bit modify_log, bit modify_file);

  // ---------------------------------------------------------------------------
  /**
   * Controls the trace display depth for a SPI Transaction summary log and/or
   * file group.
   *
   * @param mon Component reporting the SPI Transaction. Used to identify log and file group names.
   * @param trace_display_depth New trace display depth. Can be set to any
   * non-negative value. 
   * @param modify_system Indicates whether this change is applicable to the system reporting.
   * @param modify_local Indicates whether this change is applicable to the local reporting.
   * @param modify_log Indicates whether this change is applicable to the log reporting.
   * @param modify_file Indicates whether this change is applicable to the file reporting.
   */
  extern virtual function void set_trace_display_depth(
    svt_spi_txrx_monitor mon,
    int trace_display_depth,
    bit modify_system, bit modify_local, bit modify_log, bit modify_file);

endclass

// =============================================================================

`protected
/Xb[:ASc#+;Y;1_<IQ#PHaHg]c)W0V72F-\===N0@TPXOA^G5,>=,)Z7[YD-eA<L
:Te6T^^?.<3c7D;H9-8CVAUFGTLKE2f^65XfW?<>71EJ6d[>^R0N:+;XWIZ3aE-D
I>gX5AbgbV.fIM;_E^ge=]@TC4[7/9S?;.LG-<eeM1aS_^40L-,[Y>(Uc>M55Y]0
5^aMME[6-B3S5T/bgMFg_S2X,W,Q5:[Y#ZV=eafRPQbFQ\@=JV;IX+/)/F#0HSD6
HCa+-1X,>b[K=gd4>G#f5-\ZY5]8c3X53RQ_@?c(_>OETIS/,T5K\]-cHXg0I7T(
#3C#MPVLE&FY>IK:^J;WOFNKR:bV>WD4?bGK?&VNS2.b;_NGD=/-WcZC-4YVTB_Q
>+>DRA2+-RV2N,&JJTT[[I6#4g0-9d+0^-BAS.3L)Ad[E-ATHR&;CK<^6PX&)EO;
X[(8WeZQ+N7Y?gV9;YIdVNAV>,S_[FW>Ea.eE5VWCbg<RTR#BdgQE;E5&)[gTEF0
Q&K0QVZ3X/Db8R#Fa)E/QMgedABSd<Ec=7Z;7/CO[?ZFS6^33Zc:N3N^33IZ^a&X
I.KH)3Y.DfU\dY8b4<bCY@U;;K6MDT4@bTeRe<LNX#AQF5<@/G>8Jg?a,[F>6D2[
UF3@DG/29Z\(Z\TGAB6C>(V@+cV0&dSb@N2P-];NT)C_6VG?AWSX&6M7(WHXT.1Q
-UUcV^BaEYWcHJDP>Q:b]7GaB#O.M6_0_@29a#@]UZ(EB0H<KW<_^:d3ZDA^EL(_
U7ZYA,T<fB2;E8O1VZB,9f/R88Y<4SgSaPE_-D=4dKLT8bG55V9g]ada8;Gb3C^=
0G=+;J=1JHD2+Z7-?)Wg?P[O04L57T)V;T^\fFaRg4^3S+_X_;:;TS.a_U.K?89L
,]bg+b88TE9M4KZR[aLFB_-c#VfF,7b[3?.T;&1WY>RHP<AQSe54aFL8CQ)PS8Db
XKQ&TK-7Sd^Ze6dMAPfC0FHE-.Y?@(cL)?I7g8O=VG6,WZK)+FMBZ7E2&O81-3&;
Lb[(G?T>SJ0(3HV3=DY\67UN1_63(-\_THfZE&ZPBaLdJX@dCQ)I/5a0f\O:dH3E
KN5W/@gVA2()7[?LJF\WXF8#<\gT6,#Xc#8_Y=7RI+>Lc_Vb]UY>W#\dbgC-8L@-R$
`endprotected


//vcs_lic_vip_protect
`protected
Bd,f)_cUTgaOHL?4aT+E+WMaJG9K@^U>2-FXD1_-NT6_V0&/AbCG4(1SH\]VM9K:
&,A/fb<Z2#=<]QAR^aE.^eKcJa,1P=DP[G1TYd>/Y(->dbPX=?<17M[:HJF,+>6J
.:bb;/JX5D(]FIZQI^78A>U6,&L7FBO:<75FOaTWPR=]0?(.LLcTE(d8;6d8c^;2
bUgU)7bW\)]L177V<805O.A8:Kb]YCYG)2)TV4\JK1>5JeDg.I?#K@7HcM_L\MRN
#/S=?2Q[&6JRHOe#-Cd.aE\@0@I#7?ZLC/N<L0D&L4U=c\]Ie0(fE>65E4:Xb^:R
_?JA@]+K7A^0Q[eLORG.FBFV78b&M?EK-3QE6E/gV[.A_0?2e]):-AMK]URPbY,B
MPebe^+T=Vg\D_::XDQ.a@)N=VGe:72@6:((5OXI?K:fUb\<=Rba^O7Q,8ID2H9\
4#<\#SVVa_M8112LBU+ffCHU(\(\>^26<RYe^SX5G=K>?MD(aNVP<HW4)L3&:B1\
FPG&P7@O?\MV0P=II;UZ^5J-]+[GZ?S1[]O4H(S,J5PBG0a_VQ0O(N]UD1eg>[=Y
4^_KGFS3BP@^Da]^Z?(C_+UPO3\S3/)LAFN_BY<_e90gH?IM5FZWI_/F2g?TD9=F
6G>\8N-2+RS/SB&6S.eV((]C6f3K@(\];/ae=RbU0=Jd\]DJC0YB)OX?^c7_<Y<a
H\>R]GUN&ba4J]SM-CE[65a:P.MKdBZ7LN/?PQ/1N[DfaN#aBec@@=ReY1[C<5(X
L/aEE7Z&N=YK=XEd:QBI0AN>76bB51/GVC^6#2(TDR;Q#R8ZV_D&>CB3)c:I..B^
]PbgP[(e)8H#A3UT8QQ#TEBN14?+6a4<)d^7)^dUd617,IEX>;Ac>[dc9O]57KS6
>7WcNbP=#P-;K@,S9O(C[PAXVe8P-\6OAKGZ.3:CPUWI=N94(@7?=CaV_dAVEAVE
ZeFAeB/b)6Nf-W#->ZD&NU)[N>MI1P[_H\#6?#SU:=T/64#eBbcXQS-K106LM]D)
gbM,J5\P2b9XeNg5g^4\-BRT#HD_.f6A):aUMD\dG58WG=Zb[K0RIV>5#J1)DPA#
^R-)HDO7b^V3H>1fLLEe]I@9/JK-U7E[Z7X8Nf?ZR)Oc__O_#M[F-EXLf.QZPaW8
8H3AHb9R0QA@c=3P;V&J:g]A-2?@-J-@VL;NI7P5eVYfJbfCD8]M&?^8B>J4ZcVS
H_0&^[2dbWR3dHYf3gJ3?</CUa^bT7_/&(.3FHPU073WG,)(JBS40Y\C<CO.6#9-
1NFXDXO7Uf1<I_3f+RZF2R14_6bZ<G,Ue3(LP#M@BHCB+<&VQYT@ZVNa-M#a5@5b
=0PdU6g8NOO_H\cFcbc.Rf-MI+>Qb41L@?80LbM5W/Q]2_.S>a.NG<V;VC7\dc(?
>C4C^MH(3YPH(+4@NLeg9Q;LUOA-aGBPd\E\G1FI60R=cLbVBR>e&T\ObCWRE.D(
\Q6],(1Qf_.SW706#Tg,AY?a82A9SK:7+BbM=+J14857S982?5/@XfK\GR4O9-^8
TCMZ->QD2?&J9Y[SZ\U3g-eMW\DaCf7fAKbbVSQ/-R4?Ja4.#?OGa_\&SU_4GOHK
bE?-,JV2-B#.g9AIMJ[EfP.EG\:.FbHWFY^.:g>_],dQQ3B\3\-W[@4((/^1AXG)
\A/7?UO3DgT;H@[QWV2VD2,b/eN7f.@(T\LbIRM70Q9JS4_.;_&^<J.Q:Ib@HJ(<
/f3)=JO:C<2OI>T-3T[2<6V#JQ;cIcbF;IfRTg(^]?6.,:AX5)E&Y]VF?JN2P8JD
<a5Laa_-IH<3TeI^PM)FHRF[cgZ2E0g,cbI[>\EV[J<3[>0MSN,7TDOeY/1YL.Ma
VGfA8V?.5=E21]XUI]IMS/M7>;JVG?T_36ePJ@Gg<gObN\GGbOd@D\feX([=Jc+@
4(c3)6EG,JC3\GY^6@\I.LV0#_-YN2K;#([+))7THdB?[71+Lg8BgO>WMFT6g)D5
4gFV&_KLfHZ5X&2-g3Bg)8XRU=9<=U#^L.XTG?>a^7]0Z1bcWQIF+&931ZLe4E?D
Z6UW^N,U96&VK+2(c1[;,7-U\dPT,05(?+)J?R14RSE1GGF:EL@_8EH;eS<A/fFB
9_#@f6S<]8G^RHNeI\b#47_OBJ.E.0^d4.D&[G>#E<[<H938c-A9d2<B>GJ9e76D
+F<HG55#BA.DTAfEQ4(fbW\:N8YCZ>;aHIB(H0:BebBC)-C\^9//Yc&K5g\a1]JQ
R(P.S<0X9EU3AZ2b_=0A1?ace>H&=dK8C&Y7I+?6#bK69,_>6_3&@JNFb]&_US,Q
fUW-P1D#OD7GS@B9-[CR/.TEM3MPN?]3B]DGGH:#=V#U-Uf6JNN_>\d9FUK>>06I
La>&0#LAR)I6I9):T06A(aY)+eUA_e-e==_DI@dU78TNC##]@Q.AgCJ?V?P]&_[Z
a.d5>?AC?0AINLF+YKU#-73DWIG6@GBB[0\8:+JZ??&Fee(0K\XQ#V(3S.J7C=VU
UMYM=O5G4HBf63&-cJ7K+?dZ-<@N46U@I6@GFeb41A9]-1VZXLfI[ZGD@DcNfD6#
Q);\G-+IU6[&WAQ5FM[/29.>]5=QGRA=Ebff9ML,1D\@QGPC66LR@8C2^^CKa10e
X4IEWcB#@;?gS),J(+>@)(AMQ@VGeR0e[P6O,:/QY60SbI:N+-L5RCBgTDX3X,_d
0-GGa<^CV0A,ZA4:(-e:W<]M2\WJ_>Ddc69#R=5&b/&GVAU7P=OfTI:0>?F\1R#a
fcV;VZRZD.R#[6M+E\MLCL;XAXS8DVZfd(,7:e2:89=KA429ROV\aDW9^.YS-Qc:
E(P3@3T\gF&bF[67@TWKA1OW6TDgH0,#C+^-,Ag8f,JLYTAY2NC\3HP@=@BA;V7A
_;GE?VH>(--,]BK_H>/K#1S5ZMaC0@G:5e22A_PTO0)PFM9&Mb^b)\_#HK,,0YD(
Q:?D6B[aYf?dbdT)QT)VO=Y=\]dS3^X#gZLA&^4(5\-R<_W2+?721S.SbG83\d7A
]BHO_.B.5d[K<]2@U5Qf/F=NB,0<5[c,A&8R:FZIV0Te.0+\J6Q3\Y:KQ68)c[OH
NFH]84N^(NW@O@J4dU[I3bXXWfcU_6c\_DEIb9#P)O>dT_H.:)6..IC^U<:aFPaJ
&]\<)V,JcCF-A/a91HScc^YT5SDD?Jbd8.VP_ZT?VQJM4R#__V9fL>=O;8[BWRXd
T(/YcMc\.5DV_>16F9_G5H((6O-EX.N+E3fX3QdV[AL@N7AC]2RgCZAVBVN(+6+F
69/EFe>]=&E:33db]A5EZ_0:KSM\>XF\E]TQPI)Zc^dHYe.^^Y?7F:]Ff0]]NS=8
>[e+=+OY=5XaHT?<(9aedY\2V33e3>_6QI[Ma)BN255/)2>OG,D/_ZXU+BBDXAD)
B919b^:?XU0?49:_<\OFKQ7,4<:73_[FT(\L^&>\-^J0(+>EGXY=6AR]?87\>K(T
WUbL5Yf;Zab4C)R))W?B+#WNMLE?KY6B9M,LP.&\_,D/eDGT8@@7Z?SFQ(&eW4)(
)V,34C91VOLdTW0LNLb;2JI^Ya->EQf()]d^>aM2a#D^I7g)dU)F[YDRM5=7X9Hf
0O9Ig(-5d-fJVTNB->Q##6TK3A/[e@<JS7:bPX^4=5#Y[SJ[HYMa]<3cZB/DdD32
0C/3b#@N+DC/&>IFE#fg,cfNRMWRDAOD_+#4W((Wb6QISNJbT1bcW+;\]K,cF:0F
(1OO,7+0aaTXe2>H@?B[eYCdeE&6L9:/.RGIHTVfH,=F+9P@DUOGc4S5M#<Q?OHD
b@\ga>50f,4CYC1B:-FLE>U-X5c7DPT4UdE]HM^X8,S9T\\aD@L6PC0N11#[;[+f
JW6(d5Y#=\0-8#S0UXGfRR9Q#Ke/>?GBI[(W[eB;DY9PSeHQUVA&;6HgNFB^5WXJ
FfR;5Cd^@OIbSK73f[YQC#8<1J;:GSJ<S\0bZ3YP&D]-@faE]T6d1=HX90W&#8#R
:I;fg4aH-(Gc>T4ZFS-6baE5_(5UG1<^:VT>@V]]eLcOSaDP8KMD200.=c1W;S2_
O^/UX-RX:L)K#SWN,FQ):cTcP>a9bIK?[;RPY2V7U25^WVYG;7eO3JOQQ49.NK0f
-8Y&&Z0c2DR]<KT2X>gJ9@5HIdd^V8_WL2a=gC[\8b_V[?W/;U^];OMU(g+fDR=7
P611EIXNV/<ZX\[4)M;BH5\L>D/&eR-U#R]H?8=]4fBAGUC>IHBTRV<g\,4>[f-7
MM/a#[9<a/]TU(LOD^/c^3CLKBL4=J9K6X3KR)69g]>]+):SbML\ad&a-0E8gLde
a<6?b8)2SH,B>;QaPBcG>fUAO2&N[_HEQgdN(/@0JB;6(+H]TCG7E/J8.W,@DT;3
CQMT21AHNO#)N?,A4F?K@X(V6;8GXO3,b<gQP<Hd2&FSF,;?G&9_=&bY#C4T.cb_
:B1K?KC&7:]<0[79bdd0/AaA#PYOWPN[4WZUY_d:@cHCMMe)NTAB+H9IYT_U-RNL
/?\9F/e<]E#N5^;_L=)9]d1\TMaITg0^].R)\efRXV3W<+EfP/dHGMA.Va,>Ye:R
f\-/F<#C[EA<B<X>OE<4I3ga-e][529GR4aM8#Fg<&>Q/K_-3=1,f?K\?I_S=bQP
V7DB6D&0L2bPN71:(<Y1C[I851[&UOJ1D3[U#b?-cXb_OL],WKCdLC9dLC\X4cNL
QI;BI57X>1dS9YIUJU=bgBaFU\fJ2^EVCaO@&Y?ONcF)YOO9S]@=-<C0;0cd3CK<
&C#(Z1X/3[YZY[8XV569#;Ga<\cg[]X#0g<E:@0R/,9SJU8W</BV75;6:5I219_Z
@YaWYfC[4]5<NM>4G13bW,)3CF/01DU[SG#9bU8[7QAB?.Y->E8BOQZ64c3ca@-J
PE;\8F^+cS2W?N-6EZA1a][ZTXe+CJ>RV(e7CR7SDM(X8aWW[2d+&cT0Q0K?]Gd]
3cVOU3H3DMfc,P8c84+)5M_feb6U,-f9O9FE.YGAE@<=)LfR.C,_IUR_;b&))5IZ
+I8H@@bd_&T[)W9?X3?0bLWY;3N<C,L\Aa/RJ\K9cKYOb=2RR#JM6?cXOXH/P47a
dbB(=(0U)/bO33\eXc@Q>8@F7:A.@C0)CU@YWH<Y7eaa;^&TJ3:YV#C#HTa()Bd;
:c0[-Jf5UfRIQ\;1g#1>ZHY(F-Q-2X1_DH1?&?T+.]/<=e<ec^:>ca,9@d2BNg8-
H&PK/)eQ_BLP0(CKO[9[;-6-1=&0KfH\UBE^C.,7GP5c9d?Eed\A(=Y=K]2O7M0B
5a.2A^/4)IWU>H4<L\QLO6-E6c,4@gI0#6?MIRcb#6=Z;f:=+7I5AcR/cf@.48BW
cD]-AJSe,]2]f\0=5)eUB50)JR>,(gQER#59P/LAI_=EYMZ.0=5DO5\@.d3MJI15
HQ:)T[D<?H6&fD3\_8/A@-O4Ge>H@#)[6e-:.6A+SU&QaI^3[BLV1UF&_/dGd6TI
4gY.&6+QYKB5KN6e,J;-1(gK:_OTNQIXOa(VIgYR?_,TGWK0a6NdIJ^CE23IN3IR
2ZXB)/WEWJBD/XK2M;]0SM>YJ8X?FPD]7AecIC-UKL.JM,<JY\ZbF=GIH>)IATQO
&Kef+@ZYD54MJ@,>bWF?=bW0GS-(5>HZ9]R#cC,[@C(YIFbMdFII]6OcH]KaXIc>
39g:7f03TMM[82_Q+LT5,/>[LW5OR&0]W^+S7:DY_bKOBUd<:eSAAe4;0C\fG8-1
,HJBEc@TA\N#]+N.CSC21WCb?Af=8b@;6Z#UGHFG:_^@<YC9Q_Bg)bS&W?S64S<.
XU;LFb,Q9c#+WLC6(b3Z#)B0EcC]T<gRT=&&a&[T(TM\804;ZOYDM6VTQQL8&EU_
16O^T,@WED#)&f7/L)+X]V+J-3WSe>XJGX,>#F7(c2bdf;]YBgM+=G4?@DZdV#>,
]?.dXW+FZ@^U.JX.CeP[KYEH5,R(KWNF103QL3DCM0c1]7V#<A];1:9fHJ6/+)_)
N@6DQ(OFO6/[O,X3R^ce@&dG^>V#7\8ZF3UT(51\g&?WT^1QAR:RGJSB76):5,BS
@_AAVGP=[Z=L83];@PTS3>J&J5^)M#Ob<A+eTE:5>XK1-.[7?EW1.+\S;ZG[S3E,
AU7/<J#42-8P]S#/=N=9F<Q01A5Zf/RB[R490W+[?=2_1S+_cc\#W/9#=(c[MEBG
XG:_;IS<I<fLEQP]+JF&cTRM?D,:.L[=DG+Y91A;M/ZB^N6_#K33C>03=d@LZ[\&
/3596TM>?&G0]L7PYY,?T,O]K+3][cR,>UKLcA\<cD<HVg3T4\?+:=-:T,9dZ?:G
VN/f)TJTfWQG9(Z/2W07;fH0@a<<K)b<D)8eGF0@H;bQAT@]bK(4>9HQHH34Y]L2
,N9XD4W6)G/5+A]C-\.Sa8@V<OTVf]=W]g8]4&1X_K4eNYVOQQb,Mg?gL3I-_8KH
PKbTMF<+>K+?Bfe</2P>g_Qd?9A;,2Xafa?2K/>/:7ee=.1P3?bM0&FKFT?.[)U&
QLa94[KP(_+?Xg,9+:+A50,[+&KL.OS?E^?IH,IUNA&_G@-9g_6aL/fW@75)4PT5
JB487V]3>UdbIMb=Fd:=N-,V8bc#_,a5INROa5RbE,Ld?-c1(9g,efZA]b^fZ;V2
8c<8Lc_EG]a.+;C50B^-RY:Ib=f@.F)c<X3A0-IVMPPC6HW[K]OSLXH#Y9HDJY_I
?HH;3EZ@OE-)A>\(?&WCF<E9g?./WcDX<G89T]DL;6H3HeXH\?R<8\\D3]O5I-V<
S-fQ\^B-+PU&&Ugc>fMY(QcaG^;3b3N_TecTWeC+=CST=.>JfW&9ZgTZFOH2Xa^8
F\GL70F(-E3F0JT3+G=A9/=b:S&H5#NS6=W<OA@F)9_9@714X;K\M3PKa_?YE,JO
4;_?LTLD^d].=@UEDd+U+9OfR]c2gI/^TN^>SDD668U2bU?]<HOA-O._K<TUX:1[
g.BU44W6;KD.ZM7RNgX?PPR#gfI2MQafKJ#QG1BN9Td1)=2cL/5GJb&O?R>P59-[
DD]64<E<=73_[37P,\?&R<4Ba\?E,/K3&#(TBf0M_]-7<cRE7:D[K+eI1:RW_^,1
OCW^f/8XFH9R7C:?RTOC/W.&N_8O,]0O)ES0,\HUeUcA/DdZC?@@=ILfbFX1=:\#
T.Ie0K#@U@H,C(PQ#+)CQ(;dGMRQ1c&KcVbeO^PQ]8G3@0F,)-0a01f&YBPS>T(2
/cL[d<6_LgLQf9EBQb,cM\=W?f#RU[XC4UUeK4F;bBA<:.BbAJF+25/Q(W]:@f90
)_2C@0Me&:3,b]=;J4@MR\-fVdT0Df?e\9A97)/b^8ON^@9fB&L<0XO3;B)WO(/9
#C6Jc(E+LU:@OCc;&5/YRMK<(D]Z3;];9RZfDL<A.->-D7-J_.NR3;M<V28&#2@4
/;G8_M\7[5WQZZ1,Da+Q=,+SfgWdFa_OS05WNH?NFeJdQME48=KSGNca#/K\eE)c
SDTV#,^P0L)c=IdV/<8;1(dfL>Z&L4?_G5=);,7R6CeJIeI;7ZZ;bTdg=1&aQO(<
HRL1cE+X/Zcd1V5WMP]H@adXW>7.+a#0CA#TQ2,gd0Rd?dR]9YXL,-52=7;FVf+4
L_+e+d)G=BRE>2LU\/WF[=FW/7=f8;_R;P)OR(;N4BBO8EJc36_9>>H1dB#F+BLF
RHK1K#RSS1g;@U_>d=S3\B^+CU)2&e;?MHbY8BA<Rge[?GJ@CO.V8ZPbVSD/]6f?
L-G^L?F5+)<^gcW.,04W(g7M1DQVRbS8fL:E(M,8I9(^\XJ))E26b\b(SW[JAK)C
07NeTEd-60>81@OY(KDR^V;(&R4Q?LWZRXDE:WgU#g41]<[)-8^8,]g&#AbE#M63
YR:H8#E3(>1a1?3OQe8#M2c9RJ).4_bI/0X0K\HDRg2@6,YEa3?YAM]UN>QBX6)T
ZKQ_Og3-d>C)aHQIMC4L,cfTNO/M&:VJQB>5UWUc85=P0cL1JE]A(R/HH0US+,@c
Sac\:O;,II^c5Tdb/82HIY6TW7TW7>9@fXWbcBU(K=44T>#/e1LFG.<US;e_&>H3
QWIcTNC^N(?+T>L>Xd^B///NSE6P-?X<f)b&1\UTfZ5b,@S:?E1?^T@)\U?Pd,+:
5[#9f;3>D:X2OfDK9R^2LM6ZdMA-4&fW+&3gJ04D6bM<UM6RC0Z9Q4IAC:HY96TA
bXCd]&.0(23F,YM6FXVMb);#e)Afdc6G^5,Fca-1MU3Bc#LFB&6D@5c/J3NW@f1[
#Kcg)e.#W?A)VMOQ[^OHbNKgf[a5T+;X\9bT_9IO=[IF^DV3bX_TZ+Z4gf(4#8RZ
.1PBcL:HSS[.=N#VM];5?V+DN609a_J<#92b5(^c54PJARK//NKP0=G(X<8V#/G:
(W&:I40GZ,,-.:]3^PL9KHUE2)1Sc2PAL7T\SOWJ,cE],c-a5NNX(If,,Ig;^IcH
?IFR<d,5P6.R=Z5(YSa+NP)/-84dTDX-+e7[U+aG1d>A_MJ]4@E0N><<8Bd9gH9;
NCe-D(gMG<5d^<:K2DfWZ[.LD;C[2&ON\0W\2TaZXP&cI+PNV1b/(+aaZI>KW;\)
(S\;;CN1IJOUHQOKBG(JHL&RED;fVDG_a?)&/-M@[S=W/-?&2DGTcP01[6\G\^#@
_Z;DS:566&c_>RZcaE=O@LSC@^A,fT&N,D12,)V&S@:G0(#V.Q,X4>TE<7@JM8NH
=.@)+FZ-P2dO9N],@\SK23SRE:gWPXHbI#EP8(AOS#M-[/YX]Z_EDe)(B5)_A\J(
a+Y[9c7aB;T3^S(51(@SMH?:[EK=+?=PeP[ZMW?Gb\dN^5dY-A[9>95,SK_c(2;b
7ADDGaG:c0d(QTG]b=_,(E;R-M;7F65YDI=+[)PY5<^BH[-HE/CffeB1eKa4F,OW
D]Z93@c6f,7A&E(:_OF.[Z4GXG2VTE?KA?SFVQD]Pf==-+fL_6/Nf7FT@LQg@QJJ
Q>Z=f/d^bZDF4@H=g@.Q98&D>YE<PT4KQTa-ZBRg&EDf\.;;+<(-X)+1KX#:LJdc
EbNZ\5TI.86WKQ5:FV:<4/[U.7U+FaD_04\]L]+,2:6V6J?A=Ia7,Da7_6HU+=7:
Y?R7;LOQAFQ#ZL-09=7e8GAPZQcBJdG1MK.LVfV/Zf^M3AT>VW:9[#@0EWYBF?L5
QE:Y?QVN@>A=T7\6_a4H_W#+_ITC0+--M6bd6SNQ97J]&g5VWe3\QQJa?Vb>K-Jf
SO)YS)78f[Q<a#MB8HPO1EXX)YCJ(WXI5RW;,+GN).=<PKfBfeMC-&^IWZDX6EC@
WW\J>>YLa9MV0JT?<JXg[C(,UfCc>ME@<A@&57TTOC=V,b2g<RXFPDV)K,(5Hc=K
]:e7./_J&HRTB-&4K:>MG-#HWOK2WH7&OV_c1B4BPG-NgCK,98U)=bd@g3[6)K8^
edUP8THQ=H_2f@CZK88,d59Z(2/2YM/)d#)Sb05#4FG29F4YM&QF4^0YWQ03N\-G
.]WJgKeV:R7L]0YW1L4M@ZDN01K[@3U1AQXa7a0>1\[bG5,\75&M@JWN?N6.V<UX
aga=;AXR@:4LI;a1H4N(&DR<)LDF((_B>_&;^//0F(QCS0R,E6F]+_2<DU9J(RD[
\VIFJ7=6)cd/]HI^dTU;O=L:QQ?-8RJ8[;eVU19)&E32:A/Q28V;66>OERQdfc<f
2YZ[DEaF]N2I4H8NOLQabc@aZGAICPc3E\-d3]DA3XP?4EPUB+;>)?gdcO,MW4^H
#AB/:7C?F6<e>^K9&K5)6W0e@5@<?4&c43c21RK(0/5O>5,=N69c#=QRG8@,LVGD
^M5Y\@Wg5(<T+/-,&64O.^))Z\?0]86/TC;f6>?<L(fC/dP.P-<4K.7PFH@Q_^@T
7IB;LcO<R]R>ZLTI0,YIDI4NY5QceU=S8B>_Y8A+Hd87gUJ0O=#M1=(C7.0F9f3g
#F^RY.<-9D;ZaC9BZ3D5,.eW7WD@G)4?M;IQ/6Ue3^f:g@N1304f7W:_/)RITQ\\
5fF7^@]&@]L1db2e\:T(;,<15X33TZH=cFP6;+V]2(>S^MZ+4671TIRcA?cfOOFO
M)4d[bD.6H4>NF(.K.C&BXO5=WZ#XI-;C;,GE0+WQ2X=Wf=>SI#)JQ];5/T:(MT#
2E>4]>07N1SXc>=KD9><\C-#Fb6R4T1Y-T5F_?H(Q#@O\3\Cb@4_cHEZ-@BOP8GS
Rc7)E3XIAW-VdfD>16D0\&-#3$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
