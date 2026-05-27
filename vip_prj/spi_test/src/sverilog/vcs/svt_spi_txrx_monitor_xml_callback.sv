
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

`protected
:E4C#Q\W]c)&]E(X-4;<:.PC&+GO^J<7KSZ0Ba@/A42f4Zf_MDZ/6)/U?2;g2E@O
\#F::L@EFEJ,Zf6?P?&Sd1[fOgB=&;:8IQY(T75WWKRc.g/gJ@O7MB)14IBdPMMI
SVUE]61QF&/Q\MEHC7<JS(-RR^;F7\3+4AFFf7#YedGMZCG#e>(eZ045TeS6+e:,
QVK]6.56;f:8?(S0X(WLM,/71/bN5D3MW-G;M?U&+XeHb4J[,IcMM^ffd>.=(>[d
([:\LRD=_e^E1^K#fJFEdCF\>W9<>U>eM>V(O58_I\QY\3e#T92@bDD+HgTc-6Q:
8PWT@=I&aFH<^Pf5+6MH)5IS^/aS9V=51,8^f[NZ^gQ8C3d(e#JGJCD<#Y;OPD3_
SUK[>K)-Z+25a^-cUMJP626VQfG^ZT7FLGJ7AC.<P5GPVg#@MB+5Kba#@_/&Y#5H
+[7<RW:7_8@D]<@H/2LF#aWc:W6><8),AD9F&FRV++a9\(GP]2=B;:a#I$
`endprotected


//vcs_lic_vip_protect
`protected
9L6]:^88AgU2+_IJ/eT8JeB)Y9YSRg3Y\T<,^SXC/;IKNN+K^P[]3(R#UCNM9TKf
:8Q+9U+51264J+NdF0Zda^YJQ,2DLa1-YDLCaT#^Z=5R)4gdQENPW.FMW:+01e\I
C\SUL\#7@P3Ua+]=Q0dKQ(CI)-G[T8T+W=>gJYCaW4c[cOMBZI)b2+\+HBfH)Y::
H\f7g+:>QW_H;g3O:WH/G9ZAKQZ1fQ@B3NgCV[@\N?I2B;a5[5(/H>AXfBK=^I77
_&H5D2YU4(g^FgW[dGgd5aJ:RN(2AW@QL?^S&72-ZJ#fYFMc:Q02gB+da\b1f-5_
XU>g:.3]7VVM>Sea<T,.bA(.0^^A3Cfd6ICN#^.P^E2ZN),&R+e6R=L7=6KfaaF3
FV#D@4LR,KH@JT#.QS\7QUSO0GKNScfD,N3___#E3YGOS-M7DWDVEW&Qce8VH04Y
&SV5HLQ<8?<)9K51:.R55#21/9S7P:L=3cACc5+:bRJ5HU\J9YF7Q#aX+A0Z;IN1
HJ8LO.,;]3;:d:YdIR^N?EOQ.J+@CHCbQ4:SZ6\O7[_R<_-?,?B7gg[d\2H[N7dL
_J=aGG:Wg?EQ@VU:H:aV\.M8HEce,S?\=FIP6NHIRZ##E2L=E6-_Zd&Lf:bZ[M[(
THIe>N)CBY5S69W;>U@LQ]M)d)#+A?)=Bb[V]+H[0[a[/E;a6LBB,F2]T+VT37&6
H=Y5MgcA3egK#0D\ZWe4MP=YNK+GVEZ9]QCd9:6F>&b623;:)5O&AMV8:O<2)b12
E&R.9[:UVGSY.VYZNdS_XdGS/PM5eQ=9)ZDgMb:5M7dNDAdd>C+TSLP-2.;Q&&LE
;b[X^TN7T42MU9=BK.D^F\4JNaATG?L2>b]RCY7e,Y[#^#^Qdb7OS)EIfb1Q&(9T
5O;SZE&ZNf5K8\4/bATRD4:5_MG?#^,gRFc3^AF=XP3;K(B1,Ib9]HJgER.(M](5
YM,8O9>[#K=.b0WY&8)Q3KZ7EDS5O/gTK-Z)B;Nec,Gb.(OZS+=UJ(b:V[(4C7J)
9FSA&W1d)\b,-SR=VD4_RRcQ>^-PR>?8#T)E=WRG-Q7E3_(GP;FU)4PH(?9M\[PG
PEP=72=gFLU^78B1AGL^>R-U+9^Ae.>SPU65?B0&ZI-J):^\:3fa[YT7&:Zad+fZ
O/LSS2(Q>RF2D@b>PA8ITCg@_6IF_/)@[VS4)FPZ87)gD2-NW[-(RQLE^=Ue,69O
3F3U;W<Id@(Q/&82fVVK-PX&_3eEQTS+^/f>3f3X9MD4J8@:[/4=[Q?^5D>V(Yg<
FS&[K88fR):0\Xb3[YcW<\?CKfY??&)94f#JVWaD:Xb]D+A><e6eA)KJVZT/+U.e
Q@&]JKCeASDU<#0&</NcMM.(B7&SEdOX(H6fg+R]5_RDHL.HDZ7,0E:9+OHgA7cX
B],gLg-M==gVW[YELY([;QbYeK]A_+_dQ7@bTcg[.8NDC5<]#K:a^DCbPL6Xce]#
\8^.YdYLd6e&OD:2(M69=+;e5Y5()?IR>cW\7QfaU\gD2dcY-SFN(F5&b8[^fc#2
Y0<&:fVWF7<.UZV/]AJ(PWX:9\a]/f+=I@C=4N5GS_9)VK5E+#A)(C^N50d>V;CV
I:-\1^XX0QKNb>^C>RK7aC6GQ]3PA_DN/AeUWLZLV;BbL;J/928cEcd&Mc?La/1)
-&FHYJ[T6+,I^NFC--@Zf;.7CEG:;5Ad#K/2Ug)JD,#/3HA8<X&XO<IIZ;7M5f3>
SbBB;6O]2@:b7=]E[f6a32E)\F<UU.&KF\S#QMM6>(.[RaN:(eF]g)L9+<&T):<M
QT9:B68W;&fb6AF>@1a4(Q4dOXBSK3O(B_<)EVE6FY1Y8J&(@DSc6c<VNI0:J;_C
^.U11b:d@/066I#.HXG[dOB^IO<^(7T&6fW+W6:JLQ]D9NEXYP+P>QI6Fb7&;-F@
AE>Q?40\.BDf8&R@RICB;UeXXTHNWG0e^[3IM@9cEd+f9gJD)RXUBHIO/1Q8^4DT
&:8]<fVNGGA&KITeG#+Z.:TMW>Y6<R6I3eZ4+A.DY(9#:R(f2GGOfa^HA;.6fA/f
W(@2.,BMAQAKUW<Md[DP+R:.cfL_K]R9,[<46R5IGLG:O^]7MC8J#NP[UF[Bfc<)
E+R>?DMg&b2bA8VAUD8P>DWK@IAAK)3B>70Tg[8Y^(WB,088eCP9[&e1)(?U@Q<#
F[0JR;QNAH@g-(OF[B8bV0UD]S,4^bRMRU6W?4@(BO.9JQ4:3@/+7FJf6+?J&T80
MfYMC[Q?G@(VG3f7>_A.R[DE3?2976ISBPMG7+M3]C:#LL)0@EDU-,]V/+YW0[4C
.DT&S2=R:00N<[,b;Fb[<BCP>Ub&X6L]A@,20@1;5IRX0d+Ib>)N70.OE1U_<ZFT
?Dc+d&bAUB&S:N[ZIHQaUVT.-@fEQ9O5(?@,?bN1(2DCb=R=(+fL#MPV[&EP3fEN
50?K+D(YSd2C9)MLQ5);7L;(6O0cA,TXC547;@7W..#WBFH>=ab=_-AALZ;<(d>M
FZ=c@6+E]8ANEXK[CAV[a6f#_>T1cM<A[<B<<9EOe]&]aU&@HK(SNFf/;N(3BE+[
dd]B7[]^LV8OF7].+eE^cTOI3?6^_3L^>O<97]#F<KP5E8(;Vd0a#UB8L&R9JVU+
@,TUA;[g09:94^UBWZ_?+37a^>0-3c@6Y]W]&77VU2E<]KGNS>cND(K:)1Ic9MZA
]8][]VEFJSIdBYB/bFSOa739]RDH4UY2P).-&UTf2^3L2MUB4=1X#R/5bRG54SUR
/JdOb&B:5692cbYbI09=YOf38e4N=7;Dd&(>AVDC[;dd+_=6[4+2ZWJG]J_D1gWD
P>e-A&MGH-S@TA6+[=8[a(I/gHE<CTX^ESg[948GT>>/XHf(c/ROC@5X3Ie7(f7@
?W^g)\U,(T@@0$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_XML_CALLBACK_SV
