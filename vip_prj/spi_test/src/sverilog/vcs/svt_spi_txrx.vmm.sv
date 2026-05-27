
`ifndef GUARD_SVT_SPI_TXRX_VMM_SV
`define GUARD_SVT_SPI_TXRX_VMM_SV

typedef class svt_spi_txrx_callback;

// =============================================================================
/**
 * Temporary class definition used to enable VMM based compilation of the layer.
 */
class svt_spi_txrx extends svt_xactor;

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

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  int EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor instance.
   */
  extern function new();

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction
   * out of its input channel, but before acting on the SPI Transaction in any way.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void post_transaction_in_get(svt_spi_transaction xact, ref bit drop);

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

/** @cond PRIVATE */

  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction out of its
   * SPI Transaction input, but before acting on the SPI Transaction in any way.
   *
   * This method issues the <i>post_transaction_in_get</i>
   * callback using the svt_do_obj_callbacks macro, as well as the
   * <i>post_transaction_in_get</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the transaction descriptor without further action.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task post_transaction_in_get_cb_exec(svt_spi_transaction xact, ref bit drop);

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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_out_cov_cb_exec(svt_spi_transaction xact);

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
   * Called by the component when a SPI Transaction has just been ended at TX..
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
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
   * Called by the component when a SPI Transaction has just been ended at RX..
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
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
e=74.Wa1_.fg>U23L,<4M;TE-NK^]0-]P>I;54);>N7<#QKc#/]/1)<f)L@:&WSf
2[S1D+3Q=EQ[REaV0EJ/^L(Q?IB]g7YC<MG^G<XB[bccH_(@.5Q><2#X+KKFZIEY
FMcE]OHPF4R\F1J<E8LZFV55OHY<@\0((5>cQULB\D.&Q@F?2PNE#.)/0RG&g^^F
HS]4R/&=-(]DeY./-3<32S,+_(]Jf]-NYXYJ&8TRP_D&A$
`endprotected


//vcs_lic_vip_protect
`protected
;PGK#Q9NVRM/S0a0:CGC_a&f\-DMdb\a9a@8G2.b61PdAQ;(,X[E/(7/;FQN8aKQ
@AJYXbSUK?3,W/)gJ:^fU=2X,YfWX2Z3e-D&e:=bTdQTg5e4PMQ0P,1ZC9\SXDL@
9TZJZU+8Z2f_2&D]SXT()1;BNf#g0Q\\G1O9=>=EZI?=0A>\f+fF:H&C+Je&,)g(
38YUdA@7Wa#_dWX=?JYAIY^GMSIVgZS/)f;f?GI8).Kfg7=[E>[6TNe8-<4c@8bR
VNfeCPKCH.e.cc6PO<0@d8cQcg<[LLU37AAB#AUdYBAIA6W1^X_1WD?C9HHAQSXP
2dU)BYIP_[GJdGdI,UI7;(638K-8>:W_W-^D7ZVZ1DU<=Pg?ITI@Cg1T;BfBEBGE
R\0K++OBc>-#L1f/a887QXM4VMB?R(VUgU2:1VNV1P29f^LA0K#Q-cCb\LBGN=C6
NJ_6bHC8,)MFQ<V4F/NF-LA[GYQ;&?a=2ZAHXWHU&)TNB@RfOI<F\gUP?:+]6W]J
BUB8((B^Bd<[71.c+U.AXJ9YQ:>/fWH8]2FUZ(Y-IcJQ2MA_PRW&GcN:4GR[0&6Q
8ba3KGbC10\5A)dWZI5B:9#93fNc<]/dRX-;@0Pcf58OU(a:C.&FZ@_fbg-RNQKZ
/[V>IIYA@4Z]_AMF]T-J[X[HU\W4bUM,9Z-f8W>e)0_3bbd+8:#09#/S0_=5/dZQ
TH7fXJ6J;XHGMEgZ+c)ADa&,)8<:/VR+]g\GDgU5,MM6VI\Vb7e-=Y>>:188\02c
/.eZEB<.XZ<29++RD5@7e(L\7,1S&;@Q_9[Ha5ANbE\K9OY-[-B9WM)U7=\6/f^G
WI7__:GeA08Pb_[4M?L&G]3dXe^DY2bVZ+R_HH>e5-@MYT0@Y7AY.K6M7[[>XQ(G
]BK-fBHG\/<0>3CN8ZF.3OMf8.S4;)R-0H9J+Q1D)PP#(TfIDNM+9LQc2Y#P9YFK
^U<CM1MMCf6RY@>WQC+]#?7?@#H@08Bdc2@3(+W^RcO7>D)7;Md-A((Z8\U/aaVW
CPB0V;T]d56d#?ZQ>f7/C4aW>fEQg#2^>:XV[C#?McSJ\W9XK4K/,+cf)f#Y#OM,
J__E9G2:GIKIc>DDS<42@O.d=]TI73L)60P>6J1dN:3<ZDN.d@RS&X8):O0(B:.S
g?BdY[\=+T(YYDAM1A5_F)7-NA2.03[PCH4\98W.-4?GGZ]K-7NW/W]:XGSYSU93
;07b;O@OK_7fN6EHRbGX/:JeQ<^5#_G12U&96=f>]22M9A)JQT9O1[K3UM1A>^e0
DU#(SM9MfN0M]R]:H\PR6[;?)B;6gcL[MH=H0_F>4V,2&M?BC?Uec>A0cCK+?04=
bP1@[XR35GZ;)Z^Wc[.GOaWK<d(\ZT]7IAW)]HWMcTETR4XQIB=;HTX13IBA].M&
1FL2Z[R@,fd7]YDJ8cWIT0N]1M6<8d[IH,WC=D<XO>-3B\W[cc@8EadMZ_Z#EA>0
A^0cdER=bZaWDgO2P)9dV9?=bQ+W2U@XBCF]eWC_W3WfdaSa(=RM(1L/B5#Iae>3
+g.CS\]NgM2[CK<1d77]d6_V9<TgbQ8#,d5a>[BF0FH0b+9:GI/ERK#MYQe#5CQ#
eX()PeXZf\53-6+P_80&T;S&XMO1GB^cLFYZ@&K&?J0:L@Z8FN2CZ:#\D)E9E24-
9bH#RLT,d2@[(fF+f8&R1SS=Tf?,I8-ALYA.@g57-5+e:SXUE2Zf@;H94?XcOKR@
D^a6<6U@PfP&KY85.Rd#4@T;>H\/gEb(F8NNVf7\_(K6VHX^#@GK]6OXL&C2(a6[
f\aT-.XaSUYILgNPT)agB0gHB;Y_-G1]fA.+f4F4G;FaAE.EM:SNCA_V1<79UH5W
UN>V=eP.J,4([III^.9b,K:V_7X:eOZD5^M>>H,/g32]SO^FZ_dQMOX;#=_,#d<0
&A_3-29,/,D&)R;\(^]9F(TM8@_(Fd;3M<.]90FS(gX:4HL9@#F+O-_]Vg??DS3U
924YM]OegEf#^,QJMA>]NX(MC51\ac#3\]4Yec5B1S/HT:aa]-a@#A1_>5.[ZAQ^
6>P^;VFDD49,7;CaTb[R9aa)ebG.6a-V3_FYZP8:@)>Eg3((#;[Y.=N)0:<<dGGU
WdTdEK254S/bgGO24=C8(_[#c&#-Wa-C9:aA,P:aLBSDHCM..7K5dD)3A40gVQ]K
3VE2(eU@b?3M+HL(NQ14Y:CW9089W96?MGb71YFR2.S3.ARNd#VFIZ0#I@g/OYW<
/:Y8X0Y3-e5[)S_WZ8_G<-[0&@Q@M?M-)#C8DP7Bg=<B)HA^N6=Y<+FWQgU,7PQ#
]<1^&7b9O/+#fcfBa55AfN#P[LD6-&I37WSF0PO-<7^(b?2_VE2gGK:Z7_2,R0J=
6[1R::VfcPFL&[E;D6A:246?6<)CQ7D_d09V11&HD4MBUG_F5(]faN^EOKZZaU6@
BR.-,&)SU_(?f-[:JNC=RKXC4^JFM(99-+?a<)^ZW@UW2\>.C9WO<1f@Wd^K;(4V
V5>WZ?77@NWc=[=RTSG(+0a0:\K.8PF<7/#FZCRUdI3T[V2@c4<9c?ZW(E^YbeXe
(JZU9[=\A/B)E91ZR[g\]J-BF:B,MZL+?#I.QfLW,Y/g\=9@BZCUT1/<\LHAD=/T
#:D^FT^A.e:F[TUQHL=4]^#BM8G8,Q=\IC&#_A1-(b:,&L)a^1O(2fJ/B1I7>Z,0
@[&,gW0,ZF1W^X>F=U8/6?VUDc+4<ZaGJ+U(Sg3b[7JS6LEWI?X1.Z?6M:a]dQV9
_>&1.EA,V=?b=<CGBf;K\IE;GX&C;?Dd@eU:<=P.DDWE)JObLTLBTJA\b0c(VZ?Q
V7\7SP^&@MCD_3dL2J@6Tb).I2^1IIE>@$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_VMM_SV

