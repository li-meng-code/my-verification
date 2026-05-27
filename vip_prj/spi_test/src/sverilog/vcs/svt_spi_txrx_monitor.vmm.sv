
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV

typedef class svt_spi_txrx_monitor_callback;
typedef class svt_spi_txrx_monitor_cb_exec;

// =============================================================================
/**
 * Temporary class definition used to enable VMM based compilation of the layer.
 */
class svt_spi_txrx_monitor extends svt_xactor;

  //////////
  // Events
  //////////

/** @cond PRIVATE */
  /** Event triggered when the SPI Transaction is first initiated (TX) or recognized (RX). */
  int EVENT_TRANSACTION_STARTED;

  /** Event triggered when the SPI Transaction is completed. */
  int EVENT_TRANSACTION_ENDED;
/** @endcond */

  /** Event triggered when the SPI Transaction is first initiated (TX) */
  int EVENT_TRANSACTION_STARTED_TX;

  /** Event triggered when the SPI Transaction is completed at TX */
  int EVENT_TRANSACTION_ENDED_TX;

  /** Event triggered when the SPI Transaction is first recognized (RX) */
  int EVENT_TRANSACTION_STARTED_RX;

  /** Event triggered when the SPI Transaction is completed at RX */
  int EVENT_TRANSACTION_ENDED_RX;

  /** Event triggered when one beat has been Sampled/Transmitted at SPI Interface */
  int EVENT_BEAT_ENDED;

  /** Event triggered when the POWER UP Sequence is completed . */
  int EVENT_POWER_UP_SEQUENCE_COMPLETED;

  /** Event triggered when the POWER DOWN Sequence is completed . */
  int EVENT_POWER_DOWN_SEQUENCE_COMPLETED;

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  int EVENT_EMPSPI_NEGOTIATION_COMPLETED;
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
/** @endcond */

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor instance.
   */
  extern function new();

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

`protected
A^=)(@NNR<[I:(b.P]7T?NR7EA,9U_ETY&NDa3DJZ>]?&>MH\+@4/)fWa1[fa\@P
3)I]eB,S_70+a7VQR0&XRPM:O[?5Sc2V^aEE2-B9ESQ^M?BK^O=24EU0>QV7c7[0
>75&a)AgT?G7e>:E?4SL+gA:SL2bZ,Fd]/E,9)(Rg-?)/]>F#3J.,0.6=::+d15]
DG06<5K-P&87Y12@IITNd[Z94E/DSc=;HW#?f-E1J,@(?8.A/2cFe9+O8A+CQYTR
3eYcUP,I:Sb6FYA<f?Xe6-9]:GCK#-@C#U2X-YO5]?c4:RUV_LUd2C-OH3+;S3Q)
,9D1\&dBcB/]]eN;>J3<7RKYT7#/13]9]a8I_B+>I:LRIPcN][JNXNb4AF@D>NAb
#CJ6SEOfcJOD@RI#d,CI:bMI[0^c:@P3,T]FG5W)70HHZ>VNIE-Idb(/fdGX8Gg1
YJ?\N.9+,c]X^12D&I^(B]R0/2TgW89K>5U]#DHJ73KK+QgfUSW[AQcaG>AE2Nf(
aSV&=@/6<T/V8]L2]Y\?2RCg_>#9^T8a+^=g&F&:SIR8#,)TEUVN5:UK4RBMVT79
4_Y9)).32(81>G_FKXYB1HgeIOBD\V#VZ[G[&.M5bTe8ZCW@+I2)23a3LcO)KdUG
FE30LK/f#N^(RdCH=;(_5aPP<-G22E9X:K,UbV&..?P-,HS)gFH=RS>#:L?/XE#C
G&C=_;96K^U3U6Y<0BGVEMg(F=RK@9LBb#2?2Ac3Ac[0M)A0]Q>7LR4KWQGN_>K4W$
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
   * Called by the component when a SPI Transaction has just been started at TX..
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
   * Called by the component when a SPI Transaction has just been started at RX..
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

/** @endcond */

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
gd2))C=YFgeV9C]2Hd3[B2?8Qca7eYe5gI.g8Hc?Z/U+HeX]:]A/5)T3C[P=-NZU
MZe#CXME/>Kb.cef+22_57_d8Nb3a6O>7RTP+0(_gYf6MadY(B>RO8Q3OLZQ-N)>
-E>HfH]7_>SPGBM(6f=]35U3+[43TN->I)0/]P\K+cT(Y(\J]+/E&MU@Jb972NP_
f1agY@/N+bRPK^]UJQC4-.66UVVXAH9&L4bf9(^K@2(=K(;;XebT#OQN=_E[M8-HQ$
`endprotected


//vcs_lic_vip_protect
`protected
AeJ@,Y7@G.DPf8HK:OOJ#UB]QB=.0YgZYcZB=8@3(eGfDM&-U_EN+(Y#P7@H0Y-a
68[16EEQ;QeS2@c.1BH7&&^TTO5-NbfgZeV5&BDPdG+g6JHdU)H6)FAY<N5Ee^@(
E[/,d+Ff:H;:TT60;6_/P._bSE,D0>M>f0cDXJD<G2#_4,=dc,cAf=b\cKa#.]LQ
E</gLJ375f0&\=MTFO&<eR\eeDI/@3g,C0(Qb_e4A..bU;)B,f\.TV17]/,a+Q#F
VNdK;6G9,)27#H5.5.SK7>cTK_&50DaMH7Y:REOG^C603[IKg:>^C+@9CY_fQW7#
U2+7_,PgEGdMQ4^W-c&AK.N,3C&M1=DT[L\f#OZ[?T,31PXEU?cT<G0a=8NLQC^_
G23FD5g,\2N:7eH?]J[1YD3Q^-U?#9Z+)0#_;>eAQBVd;O&7R3cZ#>Rd,3ZM=FSY
AT1W;\[-d1^K/E(HI9ZYI4Ga#U65C>JI6gWX=1P/HG3>,0WA]dM<;T:4fWH)57>?
J9Ua9>W[U@?<4+PV)TRT0/g8YP,D+3XJCGg?IYHgJF5a:@2VF7+:MbL&4WUL30[:
+IRD;1\>488K9/P^O]ecB7ZJaebECd7WBaG(KY7/ePB,TV6gR9++;IVC<c]S.SH.
558T;\BU84\GE;OJ4<3?dcZYe_1CJXOP]M#D;\=#d2[&@S0?^]^8da>Y@GQD+:F(
@OGNgMWe+P:K]<_d+29#_F]XMbK9TZ:1S-d@&Z+:GSL5J&&/eNLXUR]aX1#,14I9
/#=O?PF96+ECXY]_ZE>Y,OaV2M86cI:2db0FWQ,4YKOb.NYQ^SY]GGD,2a>f7<KU
GP^eP;NbII;:H/I0//cd9]V.Z7)/X;9GE2;8GPTe,)8@EZC5)+bNFRJ_H6/)K1,<
7N5aa(ZDge:7#f6e:M@fPO/GHQ<J:/>aO#df6HTQ,Q;=A[Y5Rg15cF-A3MJU8>N?
&X(^R=^CV)&D]fJe:+6Z?&5HG/>H3I@^F1;M;MYGYBH9#_TSb:=3-4U59U7c2L,H
V@_KY4S#Q)3aZg3dHe8Ta+P\U(92@)Fd#8]@SZ:<1.Q>>K8CJ-FV;B^e87O/[e37
_dANISK:M4L^d1#C-&1OVV78\dO:3DB-8RK;D[aA8?Ve3,P3DHXGe^C1#_&4#5.g
9<;ZP[/4L18V(8MA2N]43J]>FSK4@I_8<&:8a<Bf8VQb<TDN9WeJMbZfT5V^R)9&
[<9\(D27)5fgST\W@;egV\CHG1)+6PG6E<-0=26.?_@F8J:Jf0b3/>Ag-(NLVNQf
/7geW<8D7()E-5[PT].SebE]Ja^^S32cWDETG5WFGQ4TX+X@I:=K[+b;YE(4CSRV
2JK6#/LB+4a3cDf;PFSJgb-;8R=M276f>B(8?-N9^0gUR@)MJ/:?YGg0GZ4dV-aK
_6U4H)?FRc.e&/8IZaIZG9De>4ae&875b9gE<808-=Z:R)6cANWXVgff?8MB]#LH
8+gZcA(4YIH?+Y#DUaE\VSObAHX2><Y;^<Dg/<82MMB_A+C)X5C&5KSV3HB>6ffO
NX\F-\#Df)R.X:(5Z:YU&JXQ:g?[IfTRF.AXO53:b?Hf4cFQKCNT2O;S60)?EE&>
11[0Z5>)MSa^bH1/e5YfBQe(BDJIg-7E7720Y7)g.NMS=KYC,<]26,>6+_4c^#L:
RT&/?<&GDU]+B>NS\D?@P.QcW-BW#fTBdU9OQd?CVGV1g8gDE8O6W0VE8AZ^YCEc
:@[(OaRKEX1VLc@X(#?)6<40C)((_GW8a,+<\GERNX?5G8X?aK]44@BCBe&6X21=
c28#1I9D(63/<DU\S2;fge231&-CPXAg)3N.aV5/Y)1F8SVJa]+/M<a_^8YYC)D5
/^HOM#Y+M/Gb&]/EgTfY]J2BEMX284Q[MT2+R@;aJFfG.T&0baZI8aeFMR_)&K#f
9J)B8_)0&>,b]aa/&a7Ab5)])Z<5YCVf?7[X3Hf?aIUV4;QBV#Q[A_^RH)PG5=?/
+ORg:QNcK]=K(2_KO1eZ=6#Qbg(J.TDRN6^&=6Y:J.1Gg6]\-DK9HZZ^A>Eb@1/V
2b\g5^EBX&G^)R48&>DfF,,&FE1?D,CNNY:\MR9e/F5&^RVI1LXXP^U[^?-NQFKF
03&V1\e6:EX0>._/Y:9C<X8^MbR;IcJaKV[-],X7V1YV=[gK0K)g.;Vd4E,Mg/X=
/PdWSBD]L3c1,-4fZCVJ\\)W_2GgPN(9?c[&_MB5X/WYD]03>;f\O1&63F/A2V57
RP9QLAb9O419,NZT0)K,cc-B[[;LO(8b>9RUE#UZN=R.0JCWX>aBCg&N6^G.MaUD
T)\T=IG5D+IO^2V0=>+fRKG8I?DEM#(9PO^T(AA?NJZ,0LYfccN(4Xa>(CZ0=Ab:
-U]#.//M&LI+[49YBK4UMT,G>e>)IT+X]HQR1H7)KM@H:TR@HKPM\A:QEB=WA./9
=gSLWPAEU+1SVVFe2ZJ99Kd<2_.g?-&LH^b7K:7-8a3=17/Yg3d59?80[JZA;8Tc
:V+04=&ZN^V=b#1&BRR]<c)2g-.(;C9G<J)5HUJV#&QbREXY;#HMAFgT8YH<Xg)c
A:?1Kb:JN2Y^2C^Gb0<2)<2Egf87DT:MR.H<TDFg>Nd>LQJ3OFO5W-DZ:ZETQa7(
KE2:BCIV?YZ3BVD\/+aMfM+L9,JJ3N:<QUHe^I+SY86&(:Z/c6^:S8SW>?9,G3]3
bHH^CT:28P+;eBZ^,IdFU^?0U4PFZLQc?]G0&W&SfSbI<[4I3g)Tb?.aYR50J>@d
6DaT6Vb(e2][D@69WT#eTFK=4bcgbJ?:KY[01YN\=-EeHcF]4a,V1=<1[UJOH2/5
X<f6C>+LgP^+9@6#[-\4e^WHLXMQXBD0&/&-O@^D7#e#/OKI?FEN_8Q#2<KEJQBQ
/<MI4JWf9\f>bgD^IaR84N@>>XOW3NT9VEYZ[Z:c9]gOE_SS(O&\HVOdU\0+I49/
[S0dNQgJPWET=_2G-@B;_90(f#NggGNBTKL]D+]YUE3O2G:2HdY9=3_V5g1H0&6(
U9\Ng42V<S&e?NSWCcLP=)5N[gg?N&T-\Y^bICG#V6M9A9P:1U:LJP/+P@VW-ZFK
dWGWA]25+/\FBObC(]e(8TR9_9^DB-RP2P@4&.SV52b^5B\2M#C2?5\E@TDCGOR^
df#2ea=eL2V1eV.XDc5O/5d=8W\&,28@ddSb.>Kf.YBGd,gH4T,F,HbgFI<LB_X>
^4RA2M5&aVMAQZVO8I7VP=/TR3e@I/0NKI[aSHTJ5C=g)TZARe6^776@;KRBBBe@
CV)948.6-X(R>4@D_d[3aEcTW6aVU@PNNW.>]-f@SDVMJXb->#DK:\Ra3Pc_c6CS
&D,3=HC2.;Ob;fRRP+)P:+92[.J-&-4(G]\B:9DMZ)&fR>_LVaM+0I+W;-_0\g1?
W?]..NPJNc1C]ULRJ1Q<LDY,0B^I\@)[4ce<P^1Z25^4-TeJ4G@=KDWUXK<NeK+a
B97ebNJ3Z\9?H=13:FBJ-JQcF1<(052D+PdOY:cgOX(KUJJ6,1Q(Y9B14_dJ:.#,
GBSKf[</LLT<GN^CT+VZ=EX_SLR-YEd@N]+c.HMX1ZSbM5Z2-AJNfQ3LTO]EHVe\
2?f1?\H3_\d^5R[YeFgeR<J@g:4S^E>,NaTP;8B:/ZX1?#MOWgQK,e+\<3REFd,G
XSU&[/d2>T=IS&<6/29LHdT9H1;0TRC:PT/]fLgYRR]WEa5=d^/HZ1:27Ha\V09Q
deJ\<e12?2=SJdf4<NNK:+aFFT9JD0.<B?FQ5==@dT:@?Z3C>WOQ9&Q<Te2-K6eC
(8S:E2P6DBTV:bggQ_(gB30;C3GS4+gP>bN2:_W4+ga<A#.@a1DQZLDZeb,:P]^2
B?NG#W5P>W@a0f5NP/:<UU\(\ba,Bd2^&+-2b6[&-M+3P\#/Q/,V7dLdRQQ5C&DN
d.RSaU1(;<-ICP#K=@+@:/]^5?g+=W5fYd(-PX48&Cg]4g+5+2f(@U+@^e;EKH8Y
cB5].(6VLAQ6.=<g(D19CXZ+[;_c8F8Le2T(cA#/;Q<+:IF>bCF5,ITgHbL\>Q6e
a2aR0:HYXGQV61>0D^>K)3Z2bbKEITKUE@[Q#D7OAP:_UW.HG<0O=05\/C0f97R\
eZR-8\S(c;9(&,HB<=+eCCZBe_PG#_3U[RGa99P-<L[IB5aO96IA&Te2#K(OGSOD
1XP?fVQ?1VGAcO>T#Z8=4Y[;RTeBg7ec44G#ecX/.SU1,M)465@4?M^+=a[IFP9U
Vg)?N=,\e=;5?d(7US+<Y@^>MCN;=aec@c6Z6FU]Mfa4&K6_Hb@U#(T2?AKfTR\0
:,Kd@//?<ZeP?ZZ)Hb30SP6=:U^3)L(7JJcL)FGa443\e:f7U89/WQO)b6I1G7?9
3fEN2;;5J9=@4Q2g\Vf@aFE([Zc]LR-^8X#8g8,Y:W+2IS5>&_Og86#=00f?RKP=
2SYIOZM9DdX]8MQUDGGBT_FZYeS\8<H=KbH23>PE]8DVF>NTPWE7GS)#5fd<J;\#
5e[CCK#\;:9,TUOOF_1)=[1CBNR8EK7J?+KW=gfSD?\e<WC^=]I-.b:KUK7aT^;[
^T@adQ=YfZ9K_B;AFZ<:H9e:;4K@UQ8ZN?IJgc#WE?#D,GQ+9Y0TR8N<.L7\ZK4L
/I1\;/E#[9375aWHLJB6>@TFfAg5:2AVYK@>(VXXfcBV]>JDd\@GE\@BJT;3AcT7
.D@JU],@O-8HMSg])27US@L6VM=Pc5be#=_#L@)4#cb#0gQ(6SWT>INdZ#E7ZJQY
5K=W,WY^<FSIAf\2T-AZ)YNFH73YIHWSA1&a8Og]YR=W=H&d6<BSI,AKH#TObVBc
=KG8DLZ[fPF\=fdNHN+X)XJ^S5&<_(#A-.J@&/LKf=CgN+.),agVBT1-ef^HG/cU
bNN+SM-;[:5I>fJ34L((Q>1\F02Z]EWL2Z,5-=C0D<W@5=1S<6-0B7NIW5TP+Qa0
dX:GETF@\e@^F[OLJ@?/<M09(@RIFgU=WM23K\9N6([LJIVF:Q=O?L1f:JW_/1K/
c3\^^2Y0QA^XDcRU5ff\7)I.7-PEf@.,@W/4(g#L@J7RL3f.c#JJHD@,M^3fTR^.
),g<67_-BS\c,_M@g:3a/5/B?0#<C.EH4)RHQZ)Sc7@0MKH17g-I[8bH,M^)OcU<
&]^f65K5:51OE+@]=OH1V=S+Lb)gU1NNDc[)K1&@Sb/1,f7f[N9>\Gf5OY[>AUG8
ETbI=Yf(Kb,W3;3=Hge>[ZLTb@<M[,7E0>M.acgQZ3Q&0R-\;V7VI:)g9&PKW=W,
Q786#8eK2,Hf[/AQV:2,IZHM@CdK@@Zg.@Bd2-E>U(AA^)1M2PddX((e57,AN8-e
UT:R=SfW14M,Dc<4f:fIgN/EK>A?MCU[+E^aOR+B8>-2+-EbN70Q(/11MUe>0Cgd
?)NO@UB5WTC&,\8f_LBU-Md&QA+aL49>EO.J/daLMR&/EM<Ee0@/LML)1^Q0G74K
Z_+[+1e]W>^(\g3;&;^ePIVE(8dYF2(^)#86UM@(;76X+\d(TKSHc7<,.G#7(aLZ
1RV]5SGA>6KNH/N&AQBTVdYF>P92U<\(ga_a&Z^GCB?TGHId[,NM7-^^)/E)^Zg&
64/U^d9=\J:8P3LZ\1THZQ29I4+L-<H=^KX@,,HW8<O_L764T,13C,6C(,,XWMHb
-4-)8>c\&X_P?DCf.gZ,DJ3QOdHWSfZM1[XZK74)2=MY27P0I#_+ON?cZ1<RMAQU
^CIJ-AP6A[UJU5B-GeS+K\O3Q#O:5[QK-A8CS6S[1)BC_;IY,ACX8QQPY)bZUFGH
@TUFZUJ<dPO;=,<CDG5Zd[ff#YG4@6aW(:YfJAX=[S<U=MTV<HV;_Z4KAE+>a/4T
gE\TC]=)bX:,B-JDF]Vd174I>K-1LNAHcPWUT6+CXa?KaY]cf@1\:c-?.IEKE#\=
IOGTT(I,10AY/AH3aCbEO2671.;+KD+g]d3^U(3I@].DILP(>F\JYT+Q]aB.GX\)
A)@E1FUf)J8dRZ3^V5b,<P;^30.Sa.>I+Od^\THK:BS-\e_RPa&NUg[T&[^?ADGa
Oe#W5OUG?M=AW/:R4[KF,\S\\.TC:N4-4a<=bP_6(0.cLed:1=3M:8#?OPAN+V5G
E=L\,dH-g00PWE8a?C^0;Pa@Q@UUUWTK+HHZXc>JJ97d+P)[G]KM;ReN1IR)#>JN
Z1I\4DW-S@ZP0$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV

