
`ifndef GUARD_SVT_SPI_AGENT_SV
`define GUARD_SVT_SPI_AGENT_SV

// =============================================================================
/**
 * This class defines the SPI Agent class. It has drivers, monitors, and
 * sequencers implementing the complete SPI stack.
 */
class svt_spi_agent extends svt_agent;

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************
  
  /** SPI virtual sequencer */
  svt_spi_virtual_sequencer virt_seqr;

  /** 
   * Shared status object used to convey events and states between components.
   *
   * NOTE: This object is to be treated as read-only for any accesses from outside the svt_spi_agent.
   * Writing/modifying any of the attributes may lead to unexpected results from the VIP.
   */
  svt_spi_status shared_status;

  /* 
   * Reference to the system wide sequence item report. 
   */
  svt_sequence_item_report sys_seq_item_report;

  //-----------------------------------------------------------
  // Instantiation of the SPI Stack
  //-----------------------------------------------------------
  /**
   * TxRx - Driver 
   * @groupname txrx_agent_parameter 
   */
  svt_spi_txrx txrx;

  /**
   * TxRx - Monitor
   * @groupname txrx_agent_parameter 
   */
  svt_spi_txrx_monitor txrx_mon;

  /**
   * SPI TxRx Target sequencer
   * @groupname txrx_agent_parameter 
   */
  svt_spi_transaction_sequencer transaction_seqr;

  /**
   * SPI TxRx Target sequencer
   * @groupname txrx_agent_parameter 
   */
  svt_spi_service_sequencer service_seqr;

  /** MEM Sequencer */
  svt_spi_mem_sequencer mem_sequencer;

  /**
   * SPI TxRx Monitor Coverage Callback
   * @groupname txrx_agent_parameter 
   */
  svt_spi_txrx_monitor_def_cov_callback txrx_cov_cb;

  /**
   * SPI TxRx Monitor XML Callback
   * @groupname txrx_agent_parameter 
   */
  svt_spi_txrx_monitor_xml_callback txrx_xml_gen_cb;

  /**
   * SPI TxRx Monitor Report Callback
   * @groupname txrx_agent_parameter 
   */
  svt_spi_txrx_monitor_transaction_report_callback txrx_xact_report_cb;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** Configuration object copy to be used in set/get operations. */
  protected svt_spi_agent_configuration cfg_snapshot;

  /** 
   * Writer used to generate XML output for transactions.
   */
  protected svt_xml_writer xml_writer = null;

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************

  /** SPI Agent configuration handle */
  local svt_spi_agent_configuration cfg;

  // ****************************************************************************
  // Component Utilities
  // ****************************************************************************

  `svt_xvm_component_utils(svt_spi_agent)

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
  extern function new(string name = "svt_spi_agent", `SVT_XVM(component) parent = null);

  //----------------------------------------------------------------------------
  /** Build Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void build();
`endif

  // -----------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  extern task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern task run();
`endif

  //----------------------------------------------------------------------------
  /** Connect Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void connect_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void connect();
`endif

  //----------------------------------------------------------------------------
  /** Extract Phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern function void extract_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern function void extract();
`endif

  // ---------------------------------------------------------------------------
  /** INHERITED METHODS Implemented in this class. */
  // ---------------------------------------------------------------------------
  /**
   * Updates the agent configuration with data from the supplied object.
   * This method always results in a call to reconfigure() for the components.
   *
   * @param cfg Handle of svt_configuration class
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /** Method used to set the agent's system sequence item report object. */
  extern virtual function void set_sys_seq_item_report(svt_sequence_item_report sys_seq_item_report);

`protected
NG[_0+D,\I=fFACV>GfV1RKg@QP&ISXB<3cS(#-ZVM&7I?a)>+^32)(R.gFPYT04
;><.2]D2-NGY8Cg7+]<.CSJ0MU\H;ME#:#P-61[0Ic;SD/K.53S5T>e@H];;Nf_C
9R8P<HL<+XIeGD&]D(,3g1/d>K,Pg=:^NAJP0H2(A0><>.TEX),X;D5HFG.O#X0R
W&1bB)PVGQg0T?cgT^Dc&92DSg31TgRQ>1U,N2YaDEdBE_@0CS0L.@6I9013BC)1
MbR&).@8&L[)3Y5Ge76)<]@L7Kb[:3P?I+aCN2A2a@398N68dG.I?>G)1>AEI-.2
\Y:^fR2S8HL=)N>-T)0,DfLc2T)W9EF1V(a8Q3<\Gf/YSQ-KIZTQYH.6@(=cIO<T
0Y?IP0c<Yg:M3;KS?4OJWCbY;VRgI#GgLgSTE1d]#<N/TfCM-075Q>VUWWAMXNBQ
K\Y4)LJ0[G45[_d+9T>^W9NN,0<AXDQP;)IEbI6-C5&8-DMa5fPNXS:A,^0C)#0R
0eL5FPY5Q-S(FeCg-?2;dbcBYcWE]9C3>=2WXIIcf_ff/\aWAW+<#BBMF79dLN&A
A=>OZTCc6-#I)Ed[2daeJN2g1C2YF;gagbHRP>Dg(1bX&QT(BOB^NfS8[5T#<?PL
<ag1-3=W8_B7]QJfV,K_)-\_M2G2GM)fQVdOYIXCaaEe=8NL28Z-+@/T]@=<QfX^
<f=@)g&aBEK34\)f[Jb;>agV16G\dXVH483?0<OCZKY,.:+K07ZYNb;4N=YD6Kg5
AJ(Df6>4YSJ^0HJ(4SV-U,M+(WRFS.&GNG7F:@O;J,@YP(0F0<_5f]TGNQZL@E@K
?[D4)F@>bBH_D[N/Vb&-GN(MSC?NM2]#PC\8FZ(L1P5)9f[;#\J9OXMZ^.I^>&3e
,OaT:#Ua,;&/I&MQ9P29DCC5157A5<Be.1-Q@M(C1eBc\8JGVG(Vd?Y;=M?BH6X-
5R/)N5)3-TfD@7DZ3e;T\N^@?+5QK[GF28Uc\H-L1RSW3;C@S=VO6^G[GT&Gb/a[
ADPO8E;OR_J&9M=O4+Qg_XD(H5@]M3GBELf3P^1DW6/f@T<O:33OEZ;F#a#)S[+G
/\#^VTW7TQ(<GQKPeFDd+N]+bGYZT#R;bMQ9/0HL94H?>8[+XX?))O>)RF1(=#dUQ$
`endprotected


  // ---------------------------------------------------------------------------
  /**
   * This routine triggers ECC calculation for blocks from ecc_protected_start_block_id 
   * to ecc_protected_last_block_id in specificed configuration class & also 
   * Program Bad Block mark in Spare region for all Blocks in selected device
   * This routine must be called after agent's reconfigure() to update the
   * mem_core data base as per the latest selected reconfigured values.
   */ 
  extern task initialize_mem_with_ecc_and_bad_block_mark(svt_configuration cfg, bit do_program_bad_block_mark=1);
 
  // ---------------------------------------------------------------------------
  /**
   * This routine triggers Tampering of Pre Programmed Memory Data with its data.
   * This routine must be called after agent's reconfigure() to update the
   * mem_core data base as per the latest selected reconfigured values.
   */ 
  extern task tamper_pre_program_memory_data(ref bit [7:0] tamper_data[]);

 /** @endcond */

endclass

// =============================================================================

`protected
K>02(+<44H4EBXGITI+4\>)E;[<&;+L&>UJHN=7OGHURR&;35GFe4)AbU\ae4g8e
\DIC[2aTf\b=/)U[gER:a8Yg\:c]<SZB=afVe9XU&LP@8fDGP016:(3;+c(4-3V;
P+T_1\LRWe:&Q5MaYbK0;(d>A+(31V<-O\I&H9SIE>HF8EI?L3]P8;&HC[00YbfC
\LSB^JOHD/WM/e8VFNL-,),FD,g]9OP#B1]d/A7[?9AZAU(Q<dbT^+>P^O4QfGd0
;FBe37.._FfSPTJ=K,A/;0C>-NdXF/IXIT,G@3e_>7T4SIg/-8aM>4>PP$
`endprotected


//vcs_lic_vip_protect
`protected
S]6H:(S]G#Z=bg/LUNNE&fb)[XXRU3),>,]e8(\5<ef;6/^>f0VK+(35JaX[M=VU
85;XF\WBXU2J4;N9ZK<@Vc9P]@013/9U:U@:.<@U7O]>Jc1eQC#N9WXHD]42DEN-
@++a^\\U\.86cDZO^\0QT-bgHZM7ZefWCU/ER3Mc12E.YBNW,V,MO]:P>Z2]OMZD
,eWTGO>/>g_LM6cSUPBcI5?(E<4KdV@=egDAadg30eHe<EZ\SOc9d,4,SELN90/)
01VYd4O?\-8g0fadXVZZ0H89R=Y?;D,\4RT2R>J6W-bfH_,&DW&Of0_Q&BF6CcGD
@c\3fZFDV=RK0YQ6G-TJ8IB<eOeWDgVLIa,\]g&8.3\#=SdWY-D>cU>2KF]^8?0X
=U/^;5gfI+@MRN8?DJG4,cB_I1CKJ:](:5J:[8_]:4S3>PI?@4ggb57_AbT?S+ND
:])#CFUT<ZZIgS<cE_N#&+C?J_IATJ(:_+IV3[_c8CG+<;J(6;[.\W.7aO+cL-H7
CKG.T3#<V\(/C3a5TH7.)2U^Mbf_&2R_+g/BTbECfMU]L7(H_EA)dB/A<IH<&AXZ
]X/8:X](CX&d25+ePEXf1JYaW&QKV9._9=RBcKM(fEM5L]3g2@8\]9_&YNM>Ofe@
\^YK\:EgO<Y@5J67?2&2^PEb^.=QZINaegO71+]JOO;,\:GBg#c+)]I<(Z7=>.9\
^SIST_/2DMd1R9>US^8DM<+)N>HCPeGAE?U[(@TFbQ<^/TN9IYP^^2QCS:S:[0[2
Y>,M&+_NS8]J(TLc]7+R1T6VL)ecUC??gO3\VQ)ADIg7&^VGUH&?Z>U4)QCC/QcW
ZTY3-2\b46=STW>)KHXLY8ZHLP+:(eG6WRMa9SJZTT5V<9-.(AG&b.)X2V\)LP20
>HA9HH]B]g2BJ6Q\T1&)/0CbK,<#2QT)=cd-5C+9ZdQ#dBg)#/[Q?VLc(AHDI:=L
@XL/dZc\<QC1/4[S_4C>A37Ya8^?EgMODDaJU^[K5b35TVA9<8QT6a8\][7.(a0M
GT,AcC)ZW>0]KF@^O]1+##MTYDAEda.@UO0,-4&Y6_dA>SJeRe;_KgVO#Ya[-1e/
E;U+JFIaB.1ecNg@+/48^BLC6dF/?K9>:J:K--G]-^T2b?PR&2&7#S71A,A[P,>>
Jb<<\1FJ/2GU0\5eJb-?9^PRY()&(G:ZWa(;VDG(@PY;]0KdgAIY_P8^@V:=-VOH
G/&VE_(d71JTV0V_gb#NNB:/MFI5_Ce0c2^dP=8\@LN0Z&>D3S&L^V8Rb7R_:[#X
[c?.:bUABG@=><5WP>-TDb.N8UWV4EL6BU]#CK3=,I+#;33&aCQG.]<ZVC0//Y0(
N859[SMW:0V1e9B>H+7_W]ZG@G@;:XFf/f2(cSWVX:?;QS,2AJ7?5d(eEY_QJ]Fd
5Y5)1+Y>YbA]0]88)4]Q(#VH0EO.7ZJ,<#,,=,5TFF07X<,S;be6>6RIeFY_bBN[
2453ZEbFC+9c_-_\J\Ue\JS^-X,#\P]c\9W)T6H?8J)Q,C6B7/IEG,BKO9GO\V-O
?=Z<5X7=]D<374#7^)@S1ebCI\-/&[8PUKHC5I.3C154[/NJ5T?<X(JJG7(a4(a6
ZF?(=4F?[f8WFL2c,-^_2d6EZa@R6GG=RP4E(;a#9F&.>#e3I;b3MJR+eZ^&?)W6
8G@(Kf4@c>;5\GW5/P:GE9.egGZ2)b1=KU<0cgHfYPXM54M+J][ba\0FgB#-_>@=
R6^d.,036ADW<)53L115/M]TU]^A-_CXF+TD#Qec3K]0O:,g)WE.aH-EEIW_ff+c
gbB?VQM(:DLTNbQ(GI76#5g)O9UOF;;7\71&?^QJebV]4(-\1A<DF@@2&GC+29dV
/0A1&FI;7[bIP+GK:e<^9TE:RX=.&_aY#&JR24(;M6g(;.W,?P?CZ0fN?L,[+5B]
I.JMN^Y,-FC0J2UM,4L6HgBT<-B=NSaFU_0P)#AU#^7_cC1M4/?BY]3+&.;0?AbL
.ZSC@E&-e9<5Q2@.NU6_@8EfGYZ+d#)e>c=K/&V)YcBP_&VDf6>;09E5OY>eaX\Q
+d.-_71J1aOc7Mf#Ef]-LGVe@IeL3)U1-&#a8c5#>[_R?V1gGK)4Z1cM#4X4f=+/
5&JL]]f?DEP14:RC0b]4ZSZB]\,=DTE6O=02RcAF#a^N>;AcX:LW6bLfX,H3@)E]
OZd0;ORZg([<Cg9#AK&Ha/=5-f1Y600@-7V62@&bODIWZ+K_&#(BZA-DD55PF^8)
)U9Q<UZL@R1,JT;b5RXTN)>=685D>9@-JENgDT_=56e9cHf_SBc6R[_1b:Gae3((
BR/WDbF(?@C?@LFKL3c7LZN@VI;:M+;X;+^9bWCNX;e36+GZ2+08;.,<,@[7X^Pa
/+e=R@0gNcR?2T@-=>a\-HgMY0^=I0f3>H0WXR17PRPWE:ZI^VU/BKd3XdT,^fRc
RZ1V]]?K-5&R^eU6)J@UVD4-6W)P,K]\PN<569[6Y12;I@+4.3b5:G#\[Ub95K?1
665XTC)/QFN7OGWM_/D&[LT3,Q+ETY[P,Wb4E#(WT:GUeIV-=;CFg,D/H4?\7TME
<8^5XCS=ZBPK,Y2@GHc1ecKY.IGV^Jfc4V_L4IB@e>Ic+&Gg:\&B7e81MW(SW4/U
R.F=.Z,;K+g&Va[7:9N-[7&.H&@bVa,<^f4Y,/e.D((H3P_Gcf[,T3cIO\)0fA.C
)+C9a&M.0&T]B_)>?gg(/V4=MKaO^F(AO:dKQ)J2B5@4.D+9<G[cLR_M]O[F6^?6
FJQ6OAE=)G2.bHf<-(5&<+9a#a\^0bI7MfTGd[9Z?NJ=/@5VM8bAc-0>c+c04?>Z
;(X3,ZJU9YPgP>KK7LY^HV15g..d+>L>D@Z[H3\Z42bG75WI26W2^&.^=\G[0JD@
^93MCeAT>9D(NRKM@A>-\3_504.RH[I&T@E-,64:0DS\N0faL:H,9[?T=>Od#)R/
f_IB<WdD-c6GJP9YA^2W=/6^FVf<?+_;AH-,Y=B0<a=0^903[4X=?FO#E<KHY/bF
UcU4Md[d@CbOXfU:Y3A-Y1[bU<ZUOCZ-aMGC884.,R(M@.1,SE1C60,ASb8TV?C-
>LNQ_RKNcNTF:[A-79J@+5B.fWJ5L2RM3R7_X,e;I<0@KE+e0L&U[6NUI3Y1H6U)
B1_WL_3Ed1A@#LM_;O/?=a]V]>eI9:S6E6:@aPMH&OUI7VH&90^)I9bIc@>Ob&]g
>L_0;Y_<K?+Y@R2C?eSH3UNf=)c1+]:&9fUE/O(36.62N=)J@/2ER<0/Zc,@CN8T
DRaH^FEBP?@9\V&2,(e;0WB>OWT8W+.<9?5^8(\dUffP&@g<0>fP?W_4ZQZ[VHE&
0P3RI5KYB(D,QbIa@(R.7G<L(-f,LP:]B@R<:#.&TKM)&XH08\8f-C]_?3RLbB+C
gTIb>a^N^/&Y?)]B<1dPCJIU?T_^K=CJ(eBZ_]R)8g,8?9]C21;PF1HL(#,O,#8@
>3:1^MF7OTY(9.CSG2(\5S)IZ3cF44;<-S4<HGX[H,MA_RRc1?S@Z<LH\NegR1R<
Bdc4-8M.DF<K_7=.9+aA]4/_+TfXWV>^ZDOI(+W.Y/YGXf>bW9YT<9-Y.FKMg2<6
(R<930>2c15f9VILAX:gdR4/1,X&K0\X<c_HF#cE_U\eL3+5VO1D2NbVJ;:CSK._
@Jf@TB(9dCKWgaAGLC#YGWbUO\_2JS+15Y3.M,f-,;?,J-aS5\(.XM0TYG+KcKeI
<F;Xf1EAT^3/V2[XUR.FO[K<Qd=C7TI\XU:b])3e_MN_E2#?>]9&SIWL=::>4XEZ
C(D#&MVV(W-2=W&b5?\QTB&-aWNZ_]U1P<5f6R_f(XX>FHWH#17b9UIa:^P[5]]5
Xb7V/7)IZMg]N/BT3dWV#]47I8<Hg@>]VMY7RJ76FRT(K/R+E<fB^,5@N\gE,WBV
1dg#2==S-3N>;ZD#&02SY&9V])MNFXfC\P&:L.SGSKCOO+7GB^KgL@EDL9:7TCW8
DMf^S.S_^SZaZg2Ug;AW,[SMSA<)_CeA_WIF>R6EEQWQ,ZUE>ES6V_;_KEKfaHG<
cb_&>4V-DLVe7=ZCW+:CJ](IcYPJ>AfS?@<@Tg(R;#>N6@b2fOKF?H77OSG-IIPD
44;E)54LLW[YS^2]Ad]S7-<Tf,2SQfF@9-)af=.EK]V[5_P\3YX:O65cd5]=\g.S
.[HV)O.D&)[g(c<?+#4QND>\9](XSL6>\dXOIJRM)5/OM0_W5DZN?#;HRSBPS8cK
@T5P^b)9;^NAXF3NFI\J5#PaGDP-,Z:d=&K):UVBRL71)(U,4^O@EUWdYe_<Q);[
\3eP94SAC^[YO6&;,3>>6#HS\WdE/13;)\7N?T7ed97@g@0RM?CN,/\B##1AX-49
3_Kg\V(V2(eLa1NXV118[Y]J1TA:6)U0QPBFcXUZ(:-.ZE6cIB)eNDW7MaeFW(@G
4FTbACeM-^FR3DKbdC,SL?2>bG^I>@BN38<W)/7F;EZ^;X1^T;59+_+;J4>U9_Y,
=;AU?,ZH8QS:3<+cE=QP+cWV?:T6[5]>e)#Ef7M]MP()S]8\ANc6a6[85BPYRK-Q
8>d^X717b7>Q\#_de5@67cC,ZKf4(e1_923:=0WNVGE62CKX6;R?PAR1BIQY[eH5
+6BX)CcW-JD=_7aLV9UW,<[#+^TOVe+EEaR5bD3B,JGU=+I6HPF1;EgYRGT,)3g<
R,KR?>H6b2ZOR^bRO+8@)R6I8+:R,WI?YL.GGG[J2@gab>[)H2@I32TGONSXGe+:
F;W\e<>11eO?CY4)Y>Z^>]-HGLGVFW/Ra-LGc>\&\WC1YWYU@P(@@F(H2>^AG-M5
50>B)bJHG?bWd.&-3M2]/RH<FgY&_Y&NVP;5[&>W+++;VK(LgP>^[Q?EVE7U3D@/
U5M]\aYQ@Q[YUG1g2EggN\9=)RCS-9YZ2.BCg.YaWgRS-9?2VVd1We0Y2FCYcMFP
[GYaAbXY/BKbG][J3/L@2_^K>U9b;FEQG=a9FfV<fZGdYbWKS3:M1XGNF-2S>-:c
^-QJ@<@dUJ.;[B4]-0g/)JQ)AXF6E07DLbQOHfLAPDHWHW07VU9C?eNO0.RgW]G,
TUI[2UIV[CJ,a<V/.C8#4adFJ++cM]VWPUDKZ6QJg,56GQ&,4\ODYcM5c1[>T:W4
GdM\cCbbbVa\J3@+9E._+)]0H:DX/<Wc_TDEU+KN<>TIY?P,,6T;D^)IFQ#;6WgW
U\_>H94;Zb9]fa,2F^?9Wc=79;GdYVAcgEP?;9B#;B@5H&YW96);9cE]_CV\)gL/
+6eEe#.P\KW#]2I--P[X3+RZ(cIDB&;&13X1O&b]^fJ,T2gK,E+:f5W,BaaWEU;)
b4Ka5X>-Wc\]-VGcKN5A;Ne?S7/9g=eO;MYZO[d.)LW<gTYQYg&-F><OcL-fBKW\
)c?:]IXeTTXb\P)-F7[Y<&bPd6=]G=NHf=>FTCC]))1f_RQ98I,H&R/4V]acIW=c
MQRTgVCdTO\B)(^/<b4_7C+X#Q/1#/ESR1S=K5Sg.2AY?FSYe5-JQ=bPN22S5;IS
HaT8(KNQ28e+NfXFFDAB?+DRa>?(4aY1=-6g(a^+YVbXJ7SJ;]D&O-[UcP8AMISO
U1b.Ff3I#;UOU?NW5TR8MdTSC+:f_FIbYe7A43QE^B0OKH_,E0K-^XGQ&+OXJCPB
_H<daWK#gd=?D0T46D)Ma@YZ)[L8KeEU&W3Mg0I4]eEf6DDIP(POg9e_XQ#R&[VU
W3Z0E+;;D\[H&d(KN+0ET>>BM=0^N(VL5L76d(99B#VYT,/H7F-<7bIG7aT5AQE,
:M;9aOQ6Lb0/,HY&LY.</(a(dM=I?RJ?R8f#Qfgd:]D/29a/)+\:__OBG4,SROeA
AX:GQYOf6CNO9^GFUbK(H2/WRg[[63C#5Y44=N?;FIWgSWcPB[;dGG>]7c[@9]S&
GQO;3?=7#^7>F\71K[6([4g5(Y[GG+LcQg+][6TH4&[9-T^ZL.1/,760?-8LYL)W
=eN49Gg;Q+I,)9T0O9e-Z@II#/X)7G;,4g_[W#6ID\>7-/?,S;OAc+FX).068,Sg
2;7f).4;X]^+aC<OV8B8XGVL[^66H/6#cLdJbL@L&>^Q([@J1:7FcM1>N8ZO,V)g
dJ2JWG)_D2a9?KHc)25GC?[>bYd05L#I9?0,D0=-:db0?AY)D\N/b&gZb\<X?)bC
:/9Re5b;E1PHJKXRKJAG;f_)Z;0S@OEHb96&JIU/4dXPT_R;2KB]c\_\g:/8V+P-
3H0XAf>Kd[:X6&N2^AY0E2,XUObB:TVb<2WO,]5O9\:f(8:^:@)YXP]/.C\M6b@>
3C2fFcbG(=70I-:,033D9LW](10a[Uab@5@bK7QQXP][I+EYfF>E/=6<5HPUGLec
UGQ7:NTR6HMM5BZ7AH[QRb:ag>]QB^QK^[ME5a;aYOf\N(E&V]0\?LH+,#Ng=[\K
]fN9GU#\P5C=XYXT3M8A+cGeB7V:U?Id-AEb.@L>Od=M+CLO]^L@C8\W.X+&-4DD
(154TQF+[7?KY\]1(7PJ\Pa;5;4fMHI1Oe65[]X:.I6V&OUe60]b-&d7#A5:]>5+
&A69gF@1Uf7].gRL/<\JP4#gJ8;CAe[+G]2,]C\AG.ZA]-FAIcCSb?@bPg[D<\fJ
-Y0T@A>:9BG[::FT0C.B:UGZ(/Vd9[=\O+L]]g)PY[-g>MCC;V@F(W/E#K(8@^@f
0G)aU1:;(&LJH#@_RB]>I:.A_fKGXP\(/5eRgXK/QK9@Y12XBBSS1GW.X..AZ\aX
H]CQRZf,DLD3T?IBTR,Z+F[1F(5+_DASH.;EfF)BCe)QbI#1=P=\;=fHM8X>3?WM
)UZ;:]DC\QJJ<R=,&YPBe8Z3&dN[178D4A+f[c:c&?_5a_9f=d?OD6C4)7X:,:Ra
K^7OTb[Q_PO&W07G6M^Q^Bef7:cP5=X<WE,7LDG<@0B^I=VKcA(7+<>=&CKTb]M<
[+46GA4)#M?A7C3<<T>;M0[aLL>]ZT5VVc4>^[02(cJ.=>P\5O@8Z5W6d[+\7QRU
cQ\+aF<WG_78?=IO:W#D7ZY5>BLLJ]/QZN+(?H_=HB9#e=BCM792)KN[VASO,TM1
e<6<N/9LB78G&Y?6]08#F_.]N^C407e2b6D[9b^#3]Fb1+>K7Y,3&FI@W?6?[>>.
L6NFI&7KL]8NN/<GfEfC>0#?P\cNZ=Q5b8;AWFLX&G<V>VC_DN?M?O.,5NQU?>->
ZaAX[C4)P<P+d5MIJF@I?:6YDR:9[daC^.bRd>B5F6V)AU2ede0AJ0@:d,^)bISE
+&I5UPg(Tc\P55b++XG_3/?BY[8O52B:CH;WX@L6cS>YZ+I3CPV[]/2YZGPF,CIf
HDJd)V)&FI>JD;Z>4XaM?X=4DP=eCd4Q9C#=DeQYc>@W.OO>BH+acKC>_7T,#/KZ
W[Q8WWeSceLCGNZ)63fIZIZYB;RTd95RXM>/L3B-ENIf=.5E7@?@HIQb:LO&;-f1
JOW&d=.#aD?KKTI1,)=g#/-A.(8?PaeHA8HCNNVb[&Q/=#R&#a>@,,X>[&YL3Vc/
Ab0OeJ+dC=)27-=;L3[S]BJff/^2:>,I10LL-U,\B.WWTTL;=gZNN1P^9_QI]Z-:
.R-7@;O8-A7f#\R6&6C,VOL?4fB\@H<F:eI<B[[A19,d70<=XDLS@:JbIV(CIg1?
fRPIW,^YgHJC;83\(MEB7LZNAVJNKP:4#W\<NR:[-U5R3^WeW4fYORY((YU8V1b-
8f6L4d3T[WV\:Y;(GNRLed9OT>TLP4IODZbY[D&bf@OG/01#B0CZ;:CHN<:S8P&K
53@\OT+#U;6\OHK>A?(#cI/MK>_.)B?IA]9Z?KZTUU<TM7I&&E6YS^_5JZ24K7&^
SRR,FL22;f/O[SV+QU[ReW\F:9U/.+(fXE&:PXRAA2S-T.D#T31ONBaV(AOg0KUH
<F#LSd9#3AN3:7H@QSW8N9F:D=,LBSWc&R4\:5-9#WXeSI84Ka7]].+?^DHR5X1I
+_6A=<#5HU/\C^aLd\VAXeL&;\ENgB-1P675X+_KZFFTSR7^a&.O_B&LK[?;HULA
N]4/I.cOUC8fXPO<V.f_Af^fV#RYCJLbR.)1:AF+RA@6bFcA9B9BW8DAS3Z[,ZV-
/HO<,d[O>HdSe[H?=E7W:a1Xe9d[;H4ZL+H&O7PZR.GagJW^R9.d)0IR3XZ7fXRF
56][YbdJMX:Ug2.U@H#0LJf:])T\L]CL0GYK(D.,&/);?IbT8\7M<I\T.U1ea#8\
.<Q+H7^,,NMNTP0bN?+;+\1CPL/NfI>,3?c,7?UGG8b^AOZ>/5D(9aW^FLd3LKR.
:TcF[;NAEZS_6BC4Xf3dB#^+/[O)CB<NV@aQ2a@W;+/&PC68@)b?Y\b;f<cC&+UI
bXQV#8L<A?X737FbQ_=80MN:[b.\Ngc@e39;JPC.N&MYLWd1[6+KNVA7D?Y0@,[L
&1+G?CH0L-#.(LgDMPa1XBK#51F^4F@=\<&9I=HE;)X=g/+&<Z0bU9@T[K_0#c/e
_:S[EORH2PIC&:Kf9]S]ONH(T(0H=/AEH[d=#EBPK#&Y?]S)9J<1T>fa()C88AZ:
Y4Tf+/RXe1e7Y1XJW-6Sf6#M^f<e7?(TRLUUXHRBS+3H_a8B32>f_VL6OYF+X9[>
.)PW5?[/S_()N]cKaG6eb.2@;>b>:#U#dOMK9S3UbHK8H9cgDAKWLJXc5FIH,(bd
O\aRQQ>7(SY\)ISXT6E>:/3PDA3NDbTd/<G<(79&(T/,Rf7Q83@.F8VD@G.dFH/_
e^]X1cP_.A:g@3F@H;&5@Z(,;f)^NGSCeO=ZfZQdg?_;>6VNP@BUZ(E(,QE5ZXfA
6WNBQ9/J9]<g<J:;dGLN1I?@QF12HN,Z[B[=96[;1AdK18\+GZ0QM#bMc->L8@9A
f:b?3CL^RVF4Q0HNW&@g#6T_+PWc9^V^=47Q0fWaH4O&#@J@eV.BEH:Z7<JL_@=a
-GbDbabZ9Y7=5Q-&WB])[/Y;HG#S-XXd0;WQ4@=H];M1)QV];QI&A4ZWH=5SS&I)
X6>@F;>EXU^5EC0?R2\)+5G22S4J0(aa+QMQM>gR?^VI>Z/Gd-?\YDJ,8\KcHLIG
>=++<E[]Z/QGC3dY_R=EZ@^NQ6VWad5T.PBTdS:]^.G=V(W39P-X]Y9QWfNP34[6
48Y??70T7VBR0X4YWEQ)I8;fT_1:Y4HJ<5<fa8\#MM68&86=1VH3AI=5J<;fHU,1
0:>BJ2N>4e>GLO,.-<IOUA]-GS):KTRffM1Y?NM6[RKg8:W/:FRa;^(]0RN+/1&?
e9)\+^fe0:M)@?-+<(_OJT2H?Ab77AZ636IO((6^Fb]]MZFTD-\A(@Y65fX53YP4
@P7I9[I,OPJfe+bC1#NfF2^(RA27I;ZINGFY8?,)EdUIITKGU@JW904^f_JR6<T7
T@]VAY(AO:A=Q8d<&&(U82bfF5W&fM55I<^5[3+XQ_T<+b57;S(#,H&+eBf0UXH1
cL_/2W\?Y[9\J?NDd?5O\U7O7gA_g#4TA,VUM+W>BFdc1aYg>Q\2aP1OD_@XE?#Q
4I6B=G]9(QWE&(X_#25L1WKZBW1eb4,3+S0);#KLG88D75SHFFR61\L-g/O)DL&[
<6#;fE)T\\WX/VM)_Bb9KI,Q<AE49P21RR76FNEY(#=0Pb@L<M3JC+6&6/73?A:F
^-:\9,KT.RXUJcc+?=N2:4W54\I@-Ta5.7Z[0K[U&J;C:2QRS-#ER/MUQ4^V<,60
@6,^]?/?NgR&P-O-VZ^g_<8U0T&Dc86B#bgPgH/>LN5>J&fT9JL3W3(M6S5)fGNG
)?0ZBZ1XLC(NQTKBGV<UOD\7@OIOcKO,6Y^aSP<##(aHaZ5g9+Ld?U3V6b/>c>Pg
^9FVS8.,;&Gbef51EO6I_GFE;=G<eYWEBaCOF,FfK@;N1-H7IJM@>69:;YQ,6WZV
W#b),La/_dHDD2N&L&3(ADRPd-JJ?:.8ge:^\/?D/NLEWT3+.7.++83M(<HH0B6R
=[JOP.B6YcJg74+S0W6&E+W^QC4[Mc;-E#PEbEH;6-ZJbHG;=<\-N>Z<J6d_T&Ef
#L=]<PIa=R]cSY=a@e3DUcF@FOB=:gUYfR.+^Q<HbEM^=XI>&JN@e6&W4>3]O9C7
C9d4:]DUOQ]^?LVJ./ZAI1[,dW#OM^cVRYe3F5c_9(U/7SWHTORBa@52_.:D7gC3
cT,VISIe:H.XQ++NIgD]&N]1T@JfI,,\Oe(@5XP4g:8c0#[Q0\We&L=(T4+3^>Z0
(Y-b?4;X,W4:\f@cK9cOc:fa&5,/JcF)19#A]>+MSO^0L<_c.Q(_3b@VS4#>Q>#^
W_6+SLRH)HY3TCa[6MR.LT8b:1I^H@ZQ2e9+(5T\^QN#=Z9T6Y-8T6a;B@/.OOP.
/;??UL-5NSCa-dGOb_?@S93=^7,7D80EdJfY+F7gS]PUeOB,Q.GE4W)N)17NYG1Y
#O5(]3<5CW,e]fd>@\]@ZE.b<D&Vf/CBL]5S@FSa,R06[APBBGcL8I@7ALCO63?b
)69ED,;],X&ACW0ag6eISZ>+d?&IPQ\a4MdaXF9,M/V;#77RVIM6NY.>J1X(18B7
/K5Xd?V3TKc4g?+7^V<ANGaR&-CTR/CbV7W4@Z,K4V5,a@?CSG#c:.>M+BBRa>;,
4YKPV&;=]gQa+.--Q5).?T/UJ._Hf7/2M4CM<G4E>:F8>VMTBY17c.M^QGMIL)DP
M8R)cB2TNO6Q@A4^3U](A>TAQ5?9&Mg?.RcL4<Q2S>>Vg0eb=ZSFBTS6aDX)8O=.
FH6F;RF^3^GCbBOcRfc3FfNWFUQWYQfU6>SPT<:0@7CJF94UEY&?=5;Y5B,BN4?F
:13SE&&bgeO0WLL7VI+VEJXJcDV&.5(8gOUWJ_M=P]S+I\U5-<F3(a_TP18a#=S)
FU8g>>;EQAXXPQGbHDO\d[6;##QX;WT&[ZP;3\RC+eTdBTE?(K\@)6<;Y5]N0AAL
VHa&HIJN<>Y9PaCNL?IY#C:_dP\&I-D=D);45eX9,7ea2;OHe.K7cR\]GSLHA3T\
N_f2Y+5;:\S1<La<HIgA:URH/SQ]DUQ<gDFRD&&(M_8CbPgV?NZG;IM_PFML(VD#
3ba-\5\M9\);35\/d+OS8caXYK=;Q(?+KWTAdOgSag957EI-8UX:1IdPdf\U=3\[
LDD:6[[D]L>?-TKW&.MVBMLY>G_UbcPGMf#cbBEIN78:GX([d/b?fIS8VL@U@DOD
7ZR1Z\WP)X2I8-#C.(GXAIVe7f-/Z3]^EbN^3g\D4J(Z,.H^L5@LQD[[BP0d7OU6
cO<Y\(#)X?RT@f>fQ9DYX6P#aBQ0QK9<gAN0FZDYGOFc<^HB#ZOe4ETOG&@Vc[FN
6gdde_K_VLf(TSW^4:<H9,TD)a^<]K/W=+@:VWa@=;Z.<6FB9b/FG3gJ+(DORHY+
VG#5?,&)MOPee>3KQX5B=QZX5E+IcXBe,HD:@HBV3-H>_B&66c/3ge;\6];\.Bf[
+/+bHC?/Qd[+89d6H[49HNAE((DGabAPUU:W1(5CL#8Ye#&bS#QSQc2eR#_(UaGO
fLE)HJ+WY7[bD80LCfF;]FEM;HAadCL,_=-KX&;=>OTd=9REX:bBE+0IgSH9;M)V
5/1U-bT#[M_6/):M9:2P>9Ie>[GMQ^.OGd\T8=bWBU-./,YLa53_a]=_B0ENFX5R
^H+_UB3g3(4BAM\g>Zg#>&TOOd_.fT5BW\F;L9K_HZG7G.^DJV_#MQP:?4&Ud3>2
&[[Bf6OVV[=,Y2TO#dbJ_R94)UP:0_E-\BaVa(&4FT&&N;9>]HSE8e&1Y2JR9Y:c
a)Z:PBIGXLMU,),N92X.8E-#8^6Bd5c4d.?S5=RX@bS^B)_(AfgH)-/+20FXb0D#
)(4B,B;Y>.AHBYEFKZfYA>f>>(-,8;6&9/2(Y[X-IF6+.Q[+EVD>a.M?1NQU@],D
EVIA->^W.(GaNR;&MRU4cQ0)O.T[egf3IBfIffBa=^7.W6AK?6-/ESH>=U5TO]43
Af/AUNZg@:@Z+,6#4fHJ_2.a]:Y53dS7S+NMgI7,R^Bc<NY\3WF)3WVJP8_+#=a/
N:?DR^/U5IO_/b:34eV.Wf4dgAV&a=N\&TD3RS_7V\Q8QL:FHbHWRTZZX4g+:=V.
E+3dUJC@\OL__3O]NATWR[<Z/ILeJI9f&V/C0.ID&6\g>gL<9<F:Y\&B:4)>g@0N
#=5AKb36g9=5=>0CW-[CA.7c0T.D4TP+ITVF#:c.ca04M(2UW\gF>^?7/Mg)\,?^
.PX_0GKS7>H1G.Y1a,SfZ4T;+6H<ae/L:A9L<B4g5fe545)SI6C[#2YS,@U4;4(G
YLdIGO3M@1:NZ^@RUR@&Ie2.>_]#ZN=L\c=,MBSFB=9-G^A[aN7?8W?9QT3]#<TM
9dOBc27cDOD5=_#AA2X9JR8[FA<a2F\THaQD4e1Q1O[(a&e+Qcb69_9C^?I&L>+U
-Y1+_+M\/W3D8N_LDKP8Y+G&Ggg.gU.I?T\-)K=A6bGI,Hc<-AZC29.JT<^e6<4g
(#RR-XCb&X8:aFBZ0bV>fN;<^e4YUcIe+b@>8Od]ZgUQ/RO.JAT&E)])XF=M#;b+
80N]=I1UYR^S@,+N4VC8Y0:&@_ZCa;4bVEG]5?@?EY<^78Z[I-3+>@g2][8#SSV;
ZA<DL-H(.f?d>&fTSPb&S6YQ7XVD#:C>bGdaE[&NP;2B;Ua=]R9?ONX1PF<Of/S=
g#)6c=0c>>]QW-[=J)Dg9\<ddVFT(XS^.3HZWZ]HI75<J7;)Pg1.Y8R&);[_GTeZ
HDP?P+[PTVM)_I/?WJMZQBKdeH;)&=:4T7EBSBZPG+8[.b+9F1173d2EMVCJ.,K5
KRX;\Q5]6HY354L4S4?BAgb#bXc_0AR+9_bCeMNQ<D^K5Lc-d2X0GLa,R:]D0BIV
OPH<D;@B91N7&eI8.?-+D\\(2J;@R+O1TRYN\H7PgG;E)/)W<+6PA1,/7[Y9YeHN
;;&?\WLNZ2RP2aSEaS@.eJWa[932JIS6ZcVb:[)&KI[bONQ#)(JIO;6XHNE4;529
@3ME/LA6a-]Y73.DO>E3UBec>?K1-7FVS=OFW_Xg<0;&+F90c<NcAD\66_-EF03Q
J/b1WgC(QeZeT28,^PcXe,V&d/\:be7+3@9<::1,S36/APR#K2fG/g?@L;0Mcaa=
B0G-ANKLKAEQfHIL[Eb,OG.48-9>#)6]3Ha:>?YD,<X]Z.H49#L(F:YNKc_W)]R@
)cf/;-K--W)(O@:^+?V1Ib7US6VAIBBaP;G.3:Y^7?]Lf\P7;THgYTR8fQ[>D+T1
3\4CXMR>R5.[BMJ=/eSA_aRd^_52f2RQLc)3DF;abL2G4>?,R(0R(P+6S_8/U95O
0XW7)S];F5S])[=V3S+9^5Ca0a^NbX^dVQ^.6R2d]]7[3,.T_A(KC5)JJMdM<I4g
+]:2<YM#?RFTQ6ZQCc.GFg#/b_F,\cQdfAU;(A-JW<@fOf?N7^&S=)N[7:.:Bb>^
+PKLeFH^^_[[AV;V^65KDa)IX-f8fETOFIPSH6RSg.V\ABW(cQb][.7Sf_.A.U19
RU=3HW-G?L2FMPM)Eg4[+B50f@f@<(@7MWP+IU-)Le,]Q3\\/0.BMW:YL80Pdb<K
DD](ZH(1Abg+\[[cAEZBJ+UI_?C+>SD;?eY/&WR>-E>J4VJe^=?.b8H]b>GM8.>N
A1<WeFK3Y@:FRgeL#Ue8AY/Q/=AJfRg42&\9cP3,15?1_K^(f?V1H[H9[C)H-HJ1
U1\[(3S(2H#bfS@IS#eK?GJO5&_#DFe<>QN)E4HOGK3bJPWE?deWQH>K0]K^+&[S
4\II[BC(gJ,?=HC]d\]64&,]+gAKW0BOL,:-+;]#MN-fa6ADZV/,8/dH.4a4R\_S
@gHPcX#C7MN&8[O6>?>c5A)S)\L-]TWZ)[0(Q_eMAVafA$
`endprotected


// -----------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
task svt_spi_agent::run_phase(uvm_phase phase);
  string task_name = "run_phase";
`elsif SVT_OVM_TECHNOLOGY
task svt_spi_agent::run();
  string task_name = "run";
`endif
//vcs_lic_vip_protect
`protected
NB=NC-@Y_<S:T(U.T5Q<:E^g/Z]2c#2<d-&-e#?Z\L2KM:V1&DJE3(Z;(]gd91DZ
+^:]#5+F@<S5J&#:0^;,Q>^,GW8X0dYDNR_c+J;>[CFR^R.=X;1KfIFX-3Q,TB<#
Zg)40aB00P-A_fT5@2>L2ZXaN([RP6fH>MPDfU397NAR2I1KK9[dB6)4\I,NccOd
4fd&4<QX0S(&1D<eTIf7O#M<c42J0?BYdVO=P+@TgV>#Z=M]6P><Og=260THX.D7S$
`endprotected


`protected
c:CD=+]FBL.[JS)3ODM#gTMM,M+@/3Z1BEO/LAWK(4QZ&#CETD_9()Ae0H]IH?I/
.XU57PZN6a/+K/HHBSTP;6T[=ON#-Y7]F8+C=L(,.)+3?7<?fG+BH2AeN$
`endprotected

endtask

//vcs_lic_vip_protect
`protected
S)X:7(IKQ[,J?K/8U.9/<\+71PMe8Kb=5GA2?(YQZ-PFb#Ad#:=I3(g[_b-,8)a0
S3<AWQL2&N1)eTb4^e9#@ZLL#:/\Rb8f5D<L2\V7GOUEUJ;WY@Gg#5IBFJFSK?Sg
>3]f[&<=Xf<-T6AE=(BTHF5[=;_1-RgWcaY7YaJ+IGSKf(09COX&=2)4@CeGBLgR
=^-Y0afT&CKBK^-UL\(KfBE3@GdS&+G7G\=b--#B=U1G=DR17Tb7RJLGQ?](.d:^
[,a1aKF)TUHL8QCeV+T-X^e8JE//O>VC0=_0g;(CFW>aDKRf.)NJ4[f^=ZPI:.O?
E/JT8bQ15Nce(XL(c\B=4I6gPgN@I&@]aY7g&I]I[=FXF2@Uc&Q&?/Q2\Q11#RWH
;Md[A4+38NeH<TMJEXf,))/,1Yg73OF]YS0e<3&TI]+L->Rc]c.[/-c/(0SaeQ9>
@Gf,7b(6KbBZNg:-PVM07)?[a;Pa;DE67:77I8eJ>A\^Ac>fESB^R^M:F#N&d/[D
Ee^<R<EQG3O)a6Y^VVLf_&:3O68N(d]O,J4G9\XX.>O-O@P7SLUD0X5>.g=Vc#1?
<6dV6]#<,@bMcQV.f^c-dO?fWcG<cZBSS-YbC=QK;(6S#0DTR]HBIAARVI\T,=PW
(R&8S.;8+PJeP9G,5,Uf-dI7B^;/6dBG1NMT^&d5UQg/I_&cd^)e1Z8[4N.L:b3(
.O353,Q>[N8bI;5dQC.V2\SYEZ=K.P#I(3H7+K;\cC5X1[[PVg6DH/P)JNX7W]48
3g9#ET?EIa\\TE7SCEdTc7eUE_(Cbg6#6MIL:(.BJPN<5>G6,:>LfFM;fC7C=EPN
-fG6>4ZU:dN14G=NL0[Y=6ECNM;NWX<[^W[IM:MIV,0S13ZJWR5d#cf65V9C<aI;
BN##4WC^EM:3K^+;/E:Q1fc:2?QfI78f9R8=.:M&S[CYSVgg5;6+/]<6YN(KOVQ5
)KKC==[=CKG6]LUdc/4?,@cZAHI5B\SB6MEgQWPLLC+9KM:VHeGaNG)<S.K#K6JI
J62e<GP_^EeUVZLKQI@.E4ZU>@A]J./,D+T+QeWT^NJZ@.M8-EHESN8Y;7NbQ1D8
VRb:&+aIETKDG+VYEJ+>7^K-2<T@SWIHbg52E8T=XC[CD8/7(1\b)dV_?_aHH.JM
M8;H9U=,_LVa.T6\-73O6XI)-AN))dZ0MPB)=+Z]^Q#;>EB(H/XJbQC8LRbc,X#4
G?&E/0]TH.&GLee3Qc8bL&P2YD/g>D-e#:GG50L&O>?H.De3;)<=&NXdLe:)1b^7
VI:@fCP>)YU:bC-_fF]E]OE#[H/X)?gE)<V0=aTKC_1@af3&5addQ^P_<U,)=5YI
Qg90:8b#,C>BE1E;_)J3SNKZY=c=>_X/@QJ8Bb0]>VR,bOEdfe6O6=,=OLEWc0^#
:5LV]@J4V7K0J_[:J<)2\?O/f]C&g313@_5A(;M3C],_B>c,]dS1a#(=H2KZ+K.5
&^aH4[)NSEcIb20@A9VV..?RX&0)[72=]A\aYDg03Oa2&?+Qe#2F@=NP[S2V>4=&
3P^-/0b?ZgB_g@/aW1IAK]&C4E;F5:cVfKX?d=K[Z0X#;<C+KSHEK+<SM9H:P</]
gA;[e5&FN;CV[/UA@0(C[?K[5X;J&FM@1.J5;&?N.=T5/RH9ZJCMPG_f2N7IX5Sc
=P2I_,G3DPT7>0<,[YFJ3.#,=.234U-2PE,#JI8#b.]5H$
`endprotected


// -----------------------------------------------------------------------------
function void svt_spi_agent::reconfigure(svt_configuration cfg);
//vcs_lic_vip_protect
`protected
N5(f(:CY>VIf(QHW,;LDD&ZD;)c_>VM_]IHdJMH]+UYJXc=<0ec<5((>.T;bX/=T
cZCg=FP0EXQ0F7SL0UGF2QU.8/HLb1;WdE8OcLU-f-&IgO;..^0\^[[,RbZ=H35J
f7c9#D06,??CSTS19K@1\S2If2I7f\QfA<X0<UB3#A+-+?D,3?PX3VW<ZC:b,:LI
e=4_Z<=5cf/:HR[RgB8=BQFM3,0EER0DF&f1Y,)H7(8V2@cfVA=\70HF1T>#Tb-V
D-OGWb]&G=Y:MOG8C:>I2MXN:,R/UMCTPY)4:0C(SW0.DGZX,ILXbZ#0HVR3SK(S
&5-R?KZE_M-@>U^@a5.XO\ES>/_\_e+T3g?0gM.#Xd-;S>cfMNW?7KAZ@)GHf7O]
A9Y6+/HIE/)S8ON87PZ=,9b@@a(ggHP3>XM&G,JNc.M^[S3URMQKg3AZK$
`endprotected


`protected
V(;BNC]I<dISW521d)^#E>6XHT51YJ20P_]C\XdW3EO\1dV;fI&<,)>^Z(@Te_Ub
77Y]JM1d4HS?YU82IC42BPC/7G8]QI@b\0.A<^(A\9:=TUa.BU]:Igg,VA)SN^L2
Ea]+8A3MFX(^>+gHA0W@RBLdL)0GF9N,G^MZZ_<[\Q/dIN7MZTd49Rg,L$
`endprotected


//vcs_lic_vip_protect
`protected
R2Gg;c-B7dc,Z9Kg2)fF/-)=X45H3a+\fU&4IBbaW;g6TP5@KUD13(@GJT@EY1EE
N+CC69@,6;_UbQT&Qf#ALg-/IGd<Rd=5aZ]?d/eW91dgL0/<AX;FOaGcDX/TbJOZ
DS3_4d>435:(IA&N^??6JD\1fT61>CBScA29XR&&M=#KOGT]5]eCMW-_bDS9UOb1
O.^-BeYO1VP5f;B+WMCY>(.J6PK\OPCBbYJV#IR5c)D:D[SETY+T#3Q.0-2Bd8D6
W)M,P(L\HV.Q[GJb.#[NL]QX=+c1(cb2S;8:D@bJFPPG8aaN[.ff\GVdEI31a=WG
&M;FK8S0HIIE.6<S86K[&>>)IZeD=VM+:.276>Jf.0eFT=S&J,5B@O8IC\9X]ZYQ
68RX=;8CXZ@f3EFfVZ(g(UB.O-LUB(1Nb):/NY<O56YTH&Q:J9_[-DZcZ4YD=^#7
0gXJ9R#7A_He\A)#B7<XeBB1SN^:)GXVd4eOL2fN\fTGfOCC)b7&MJ&cFc]U:,-&
Y6)ZM\[MGI68(QBT)W@[PX?RI3A];Q+4TN^=YIT3PbEW\FfeI_UN+L3ITAgHY^<G
9<ed^:B;DW+?ZSHD_^#II+a;_T:V?J?@91LW9\<1eOV0Cd<(I^X4G^g1#Y\Z&4X:
<bVc1dM(2QMELX[[Ha>bOF>TGD>gNY>[,=DRTAIXe5AQg<g1GEY#f2?D&ZF9OZTA
>d9X4KdE)-.I0=/2S=^]gK@630&QA56NgG1#MIPGVLTZ-dWB,][(J92b-PSg84\#
cWfV^(J_NS>;e6P^Z[I>:f5&HO^b/VD,dN;N?e)1)LbO#43@XL^0:Z=?5.61dT_f
EQ9\gH&/5RNA9VA.?+,@-cTbSJ.X&/KAe@&[&a^J(+7c8+QGC4<OV7E0S/UdH6/_
Cc1#J?K7,f7ZS7TH;L(e-ZY8#PE&fc^]5Jb)M,)^>EL2OF34&dg9WIM4^WZcc/1a
//EG&AXE<g/bERBU4ad+34(&T_)))1CDH(<)4(OXe?DNg</aR5[\^F\1=7YROM(V
NJ<QCaG:2I\.H;?9dMYTW]DLE6eMP+.(f8U7W9#+T?WR4BUD0f>F9+;d-OWM7U^[
7Q1B)(#NP&CV(aW;+ZUGTf(+UCJ,=6M0dW7)Z;&#XeX?=d?OQ;#C+FB+1_Idg-Pd
HBUdLc;L&fUR:821eb>@U_#2)2ZDQb=,:3)E?#cV6g6be#Q.W&_cL<8K0?+e@TX>
K&da7&I21,3D5TV(.1,09c<:YAIQ5]4KU_cC/K,)(b2==d&a]V4=4KB)(-(;4Sc8
)9GSY:A#F]ec3DH31.ZE?MM-M42009Y^^3(DQf4(1dBJB.\_)?3Sg/^)7J7HDc0X
(N&D@51:dLcW:]]df5#(#bPU+N+DM)=SX?N(M/3#g:]T]S]1)H1ag.WX0H8.>MV0
Z)fZGd?]H@NN:D@OZPU@[MTQfUZV(fI2G>&7+c4F>Fb-1(]8e)95F4-EG0KEa-BF
a_=/e-D)R(+XL4XHEZN-8IB_<e.S6[_J#&Z]6C6U+P[fEN.#a/,##ee4\(dZ6,4b
&2KK,#6U5=FXSVF(D6X66UQZ8-/Zef6]V4MLF757SZ#@L8Q[Y5YX/P+:\JHbKQHc
&3I&Y6;aN20(>A?WG3LFX:dP/.fKOGHZI;df=B\\SRgCH\X@VS>7I6(\J]_S=I3>
1WFD6?eg;J6GS6]J)Q9E:<H?)3d6@a4CLH@394^H)9F16V50P&+\5?[8;N,TUS^;
.D&3.5c5Kb.0Z8JcB):8g)]:dK/)O6P<E[M^dI,Zf8,]I7D3JO&dU6[8K$
`endprotected

endfunction

`protected
I5?2D6E6\7EXIgPQP_c2d0=AE;eG-8R_BV>7L3HSGPW1-LeS/g\d))XT>?ONYHWd
HJWH5<OW..BR&L4S)H=>c61JbN_EM-C2@=,STg[C?L6F3N?JZY.8[]Y[^Na]AYB-
\1\S45=_PgJ0NJ8Z?;BYg]Wa:<Vf(&.DY+HCT?SIFP2a..[2-;QA_(O6>AedSO=A
:AAD]1Q[SB,8;)65F+X2=2BcCIFX]^FL>H@SO;3GJMHgGDb\0#A0CB@fc[@\&6Xc
JR)R#0J7^/O4Qc3/6:KEWIO+XSg1YE@\/C[P3Y3,+\>VLL&KTPMOI:6F.(BQX<=5
?aAfI11Qe>7(OWE01N]RM_Q/]DMY_/<I1QKeB?8g67GY<H_6GD#PfH@28-<e+Sd,
J8UecFgc:eB\\gVCY082MG3L>0NO[H@TYc^;8fC^,b-_HdE;5)RAIeUIH5^>O:Z-
):4HeT5PZY@-d]S-.O&bR1<&),#6D;4X#MPF4JPD17E;e4S6\I-deWc&ge/8_TCP
^Jg4^,Hg(4Fg^RE[3P(138NNC@5^Ka)[(@5R#0CfM;)VPVB7G06BYANBXPUBVSg+
\JK8EDP<6Q0L3))Z0#f83b5aID8cH<Hd5eJPFVbP[-<52E0da,1^EL7\2?.Sg,L#
=eV6[,0FR/BS7NZ=+()LcPO0@JK]P6aU9AYYBZ+/F:2+M.ABZ3MgF:DP0Nc&IZgO
aSQDU,40_T@dVIF;KUd-fZdZ55&#-N#9b0<SBK6=GH5]Y=cf_HbQ+G5X4P#LR-BO
.M)9U/L#JbBbD]?UXH&V&9GCL9V#M\5MK\8<W)]XKYD@^d+(\J1BOeS_Kb0VRMU]
;=IHE1\dMdQ+=5gK2bGWd?SX=_J9>8(KR]2L2/FPG7Cb^^PQ20KB0U9EZ6-aUT#5
PMD(:C;MgP\]<=?\4.50O[;??_.[Ae38]edO_HHYR0GXBQ@U(D?bV(@KcH4O]f>T
#?RD>c,;/Mg-NfV+=&-LQ)cG0_&.8B@@\5-O8N#9AQK>:WY6_]K467/VIO>?@5U1
+R3N@DDW0[4I,g.G>^9;WW9cS5a4Z#R.+V5g;+S1O6,()Y]@UXZ3M0K),/09\_a4
O-JU_=U;b[Z/1>&59a?+S_;PY=9/3/^,U[a,URfLaC\AJg.g->VZeI^C4&F.WT>\
X;T33K5#&G_>0&D1AQ#/AQD33b#O0CdA^:HW5a\T]2\?E7bY<A8c3deZR<3>XaK4
C8S3UT+XJ5]9/GB?&@c^IFNT@,gG53EdCOCS]c<UUKN2[YJ#[GH\G##J;&5e)_UN
6&a5a3begG:XGL]Ze:00.Z/QcgON)Ib#g=a@Td[XU.ATJ7)cC#HEU_\RT6^5A+Wf
_LQ#I@cG2G:E[QYIaKe\J4OVYP\;&J;D(Xe3[VPCW&#L=Y3G9@>#7F7\+eK)LRLb
.]S9-P<RU77TE[>CY[T?QKCCG4:JJ2/HA\Ieb:@32U]5+<]aY[aYf02C+(@I?Wc<
eGHU97\9F(5IYeJT)+;S]&6[8[6XUX]BJ826);3>V?&-9[;6^TcFIGb02M(QH)EF
\L<#:ITMI^+/T)eY86Zc(UQge-:,A2/;@OHfQD:G>eF=b@?]&?C9KJHPKA(W7WN^
(ZIKN.L56JK]a?1BJY8<8CXLS_8Q6@CIX;RLJ@V\/K(Qdf;gR1.G4D>FH7T;BR9b
Ka,GV<UX&8V-fP9ORd?HeU,Y^N#;#,:\3>e1;VBQYO2U,QH/])Da\b2QdJO7ZT:f
d-c2KHHH^OW2#GLML>Vg15J=a?2D;,d\8cQ0dPB?]#/\[6#dZL;-M73N649a9)]Z
FWVJZ?a52?G6ePX&&.Fc?b46?GW3USeCTK@HcN>H))Wc0WW?Sf=D?S<+H0NWXc3N
)J[4B6P,+0EW;[]U1B5X,ME@=-);BE_CgQM>0AR]@3,aD>@/GJJSOe2DA;FUTNXR
f.)UB8+5A./4Xb9:UfB5^Z+M()CIXDF#4HR>T\/b[Z^^\<aBDY<<O_<BBJBdQ[ZD
5+A5BU;\:,B+RbH8Re.-LMT-EOJE/,HaJIbXSfRS4Dd:4:6a7V,^OG9e<f_BKRU;
JVGW\^)gLIf?<FB96X>Y0ZXggQD?R]K4V6<c2;TK0XQ4c]=5JS8#8MQ2_>3@./6N
8T4E?JV^[XL2I]WQ7\HTU>J+U)\F#90(6HC?ZQ-FVYJ9VV&:OI\(/[7[OeR.1RO^
d)f^AX)PVfL&,B#/&2NRLA)c8RNI&O,b[NE]SL:ZNOS9G$
`endprotected


//vcs_lic_vip_protect
`protected
AWILUEQFOTOaCE3AW0Z@6D,>88+/V;X^Dg.F3MO4+I^LF?3XR6HC+(JQA6RDLN-H
@.QKd3T8Y7gK&+Ab?O=a]DeI4CBJ0Q9cJ#S)CO0U5QfWc/D._L>-N371U]=LER]I
;J7UAb9d@RE.S=e=K1[>D38g-_?>JC\/C-./?&U@+HA.d1J7J00If4S)E2+H+N[3
S/?e@A39EM9cFNQ0a,G6SI1LX12;Q)]W40TOOE^/dafdGR9]a)a?UGd;3fX/IB?N
4g/UY)+_)?-e35EWg(0:c_GH(_.:Qg3K3UWR4Y/@2V(4+>Z^F:Y\aV5Dd-b5@C_a
HRE2#NgKX(3OT7O/_G9[8b<:BDK-feGD..ZE8FV[<D+cdN?>GX9d92]2#L[A)#&c
eJYc8.=Y.FYOU<#VWaUWTL?1BN)>/PY]/Jd55UIW+JH6+-^d9OdgS?3?X>TM;-/P
>P3e\2.KReX#Oc8fe]AC(VMTJ[?./RD:@fIRA8#:UOd-T#-&LVY.U#^.KH5UHc@R
K:VgY;/aRO[52A>aO8<g(fe(cI>Yb+5F+]2a9Z(PY)Q,-Da^F1WA?.<BZL4RY=SJ
3BDU(=d=,:@1GDJ^3&_:5>\&Eb0#gD0E0Y49[U<>6JJCK?XJ?bM@cKTLK@AL1g[L
N_dg3JI((A5f[#9Qg,O#CH1N:/VHfX4Sd&=U@I&,O_f(fH3Z\bPY[IJS]^9]a+FP
QB+DC,S_>/d>]&IKN.KJ0e6ZC)1e;JK-VA?+D3,RRZ^\bWc@/.)_A<N237g=V1@-
WBSbQA>@)8gCQ#+BJ4M6@5J:\5e4g8O]AMg:Q132E@f,/]8bQQM\Z#Je(6(7CdL(
^Y?1ePaP;VFfK32^\F)#<<I/.JUI>MfJ>5J)\^[Wefc-a[X4fZ^?DBCL1cc;fJB=
PK?(7>C/S\F\XT+_/O)0S\3MZd5^(UX_Xd\gaL+Z)@LdO?[:5[Rb_Td<2+4CaU##
aJTW?4\]+I51VAIAe0-F0g\QQ52Z/,2\K(XH3JX80/L33:E:KN&.CUK-HF5;WC@;
?WMSdM.9TXb.<2WBa;R?RU>H1S?K+,\=C_>Gf\^2d,GDgC#.EFXGgR3(cN4bd2V>
F1V_KN#70()MU)#+f:C=EUg^:fGQ^Yac.=QVQK^=XOPdFAR\0A_-c_?a+gOL7/2R
[--Z?FgW7)[E\1@C]_&fML&Y995ZB\5+?U2A^OR?&?D@WG;7Nd&?#/3C\?3U5CVE
.BS52AO415;&,H<T&gc_T(13Idb7e35J[N@S8N/TA)Wg&L\JA^,=MPEZ(E=Vdc;=
+TY9Rd>SW#[VS0=#L94BAT)\)H0.1YS_V:YSC5fTUM.La-)B1c[MEMFL/K4efFb2
1Q<HC2],^13Y#S2M>:HOf-N4WH9Y^8GS#f<X0P6SN,A64^HR&fGI#f9SS5^GT@8b
VCK],T/NC5JHI6ZAQG#9I/B60ZfP11M[B3fKMV?B:3.\Y&F@]N6W<PR(1MZ)f/G@
F/D:N7IM:>T^MPBL@L]dA.A2R8]@ZSZ.:fO?B7IDWJP.TE^f0V>f:9fKCETV4=_B
#5J^Cc.;>L<OQ\<##b](<(E>^&4Q4_=CIdS_ANe;[Eb6C+[Af=K7MRRZdFe,;5b<
AP7[_4@2OHfQ[RO;6g7H63fKaA5-G.U4DX+c(OQTcRQA7MFP(,/Q<TMbDg)e(K<e
#L3J2K+3Y9(_[PFBd?P6(c^K,0TI\730f^KJ9/YTHfD+dF(6#XX?,PU=XL_HW\#/
H#S_#D5M[:UTR\Cb7(RM1cZ+J[IOQSEd)8(E/YIFBfM^QQFI2)Y0/S=82Q61C@LE
Le5MG,EI,J;_@cJ4bJ_(1a/?7JFJJI>/RS[6^+L<HYN1e1ZJ-_F\<?d.=B3OD#Gd
R]WUEQATQQBF]NLM^?\,cZUR,A#MZd.[BL7CHg,Q\(4).>6AT)#@Y0aZUYbHc((E
ZZ?/]7Ed0W<I>?gG<]6Qe;f=/c]>@eaWM5^eCP\<1O):GXT/N1eaW2G0W/K#+(Kb
,:L&FQ/#OXBQ#Q-a4b75YGH@Aa\+3YBJ(Z.[7J[fGS4G0GZOMN]DJ5>KKE1X9+@J
95cEG1^b0\2,)LBS5=Z;VCL38eWb&KE4Eg^])S^\UAXR26f/3HO(=Y-S3Dda-TYb
Q,CY7I<f9O8[?_LcgQSM3S[D+>#3WBg4X?FTW17,e<DR#>RM3H;B1MJ##UgHHZYY
L+,(..L8Mg&(>AgBQ(Z.I,LNa;g3g#,\+7MG502^+<A0gCLScO&W4LR_JW,9V6]\
?XTXF]V^HI]D&c=\AfIT6^eM?6GTI9]B4fdbCM]ZC]GK>e,BaE(Y6K/DCB(eecFO
=aFLW/c.e-cO?cW@g,<4//<26OacX\97[2eW#+@/3e_5Z:=)D7PgZB_5;B]4TXBK
9?^F7&Qf9-RLZ080,b=aUUTB;ATad[RQG5XB38K9UH+1M^-JLI&AB(O[bFgD]/:N
F/HF?]G0LFG37c;X)J]7C9SVgZ6JQ-8(8,a=^K85SUc4G5f^B/JZ&H5a?7e=_)[#
9U47YU96,UUEKB8(J418,c2.24=.2Ve9CAP-eLEY?d8OQ757@V;a]IN<&PFA4PVZ
a_AUV95<GcfT1IKZSKM9BIeY5X)0:7A@V@,Od7ST.bCF0O._-&M/3]DNecJQAF6-
eM3[F.Q\bDI)?BI5([U4SL.(<Lca(308Yf>3L>7^NX0HdE?V1TQ+E#+)R+3eXf?\
(^X^W[/>7>S@d[fW,=DU&[c#OW/SIK=dW@)?PX#g2(79BPZ7S/ENO0&gfR_=K\V#
C;R733Y:YZH\Z;VO/]^I)(O2OVW\=Y(<T_K:4bY=P9B:>4WZDJE[+3@Z(L+-91c>
FE<_7W12a/\f<EE+H:f<B&2O2R6J?ZD>+.>N./0B(&Kb2)de8_#a3egYYJK:a]=]
,U>6<)I/^f@)^DV<(DU8P+4egdBJQLB\[7LI-[Zb8T^BK6:O/[QZB:<ERf+)@39?
.)M=Z@C9>N,-JF1F@L>fR7Nb]eMd,bNNYcDeZDgEF>QQODd;/N>65_abT\S5I\Ne
O]LU?2A]:PDR##V<K0E=XfONO?#b43S4]E+:ecM9EP\7Y_46g@7:5\U/.6\YM28g
BP>3]g1@FQI<QP<WZY8+9gB<NIQDg&..cGYe/dReV#UJAQ6U<\,B[KAOBRNfW+.f
d:HD6d.:SbRc]XfD:PDFJLT)YYW&+&Nad&VHd\&+dPdd[WZQ2;b5XUT:d],?GJ>B
b[Z@MDV1#0A3A4VV0HgR]2#[@I2dV@0[D>aET&R?g2G=JN[Za]33K_/X_NUJX7KF
)[3Oa^b4O>,^Q5LOgaDA1N0(+N:R_J7,#e053I9KNV4[NW=<\@Sf7\PEB;_/,(^Z
=#9a\.&66X76ed^ZX#;J)EL,BUXB0g(Y?Z4A7P7Ng]H<;DT]JHD:(T]Q01WQ;.;3
CQIgO&-,<H&d2G-XNQ<8b-OcXT\RJY,U?3\G2/.a/PN_/JgN.3aL_M)#Kf#2gU5G
AJHDRVdGgMZI/,F3OH_)HE5CH.?b:?0OVNL3_MWCDN3\AM1915UM9bX@T&AX.gZ^
6WGQV+B?QIQCTS?LA/2c&O&g3?#JPD1P=9BY2SFC?TB@1GQM3B:AN9D9&T5B^f#P
T6T&9J_SCdXJGEfd6=<E(IOC9E/3R]/aS>eI8NEG5/4C\^),(W#Ifa=RaaP9N&U+
M7YaNU4,3C+S)P^gX;XRcN)L68JTKYf4__6N-@cN^aR7]>GcCOZ^d)aQ2ZA,5VQ_
W7.[<e/>?X3SL/[R,?.J>WK(8LNaMDY.UG(2d<U5gVXP+]JSJD4d/c#bG&\;C04b
)]S-V+AEO\Q5[RKeA(bg3Q&d\P2U.\>c)\E:BEH[>U[//Xd@/#c>-Og0D\,LJ_8W
.FT)_(LIG=?,Z#OcRPY?FO\:_+f>H627B9c:e/JAc_17I&/]gH+Yf^_0T9UVgMQ5
ZA?(5<.,]:W]\E@G@&c]g[4-7?NFa&T_4<X8VXHJ)+6@Y/I]3S5AgdB3QVXNDO^@
V1(FE#-?6HUGadQd;XCH9^W+51NGJLFPYe3Y/4)J_D.(5;fdEI7.d=M>cecE9+dE
9_g;/<Pb5dTH\\ME^UJ/e,f)A7TVD?S9R5#H:dQ;#\?8YFDBJU#R8G\,P30F82#X
dB_1I>P3J7,EPT5Mc?(U8=9.>+#9]M.](g>C/f3<)b6=TS48G0I0N04SRX(>?N<D
bUa=c?^1NbF4+KT-F;;a.7J_AM\@[A5MAB##V(.#<Y@DP[S5W\);X_eeFJ/@T</.
W\FCYb\ZRf#WV>&AWD-b_+6K?3CX^\QXfYHcK,V0Q1c+cN:2:)d&VNB0c>2FC&1,
K9[6=TbHe>I#^_b-<gJTbRFXV,62ZcSA?7e]bb2cOcc0fNS,S:(<I6(\:5\O;a]_
BA](GN1&6<SI\-P@;bKCWc?Id)\;Q5]A[L\Wd)FE:R=56abH^1UDYQaP]_eHe3EQ
NOG#U)4R<H2LId+>:#&.PO(<=a9EO^Y_XAB^/=LDH=-:&5K5g9#M9+@FNa@2]<H1
UQ\;L(8\&+]<CDeRUSA>2IG+@fT:4f<8A>QZK4T&<]1];BE?V3T1<(<eD&XG8(Dg
I:T2?R@8:-89_G<\5/>@N_N-?1b]Kcfe^;#+.<.[Y\T)0?.EfW><:UW,J-A^O1MB
e;P6<7>IK4VVSB0Z-W/KV&;+2B]]1[#1HU:I7ZBGC=bKK0.(HR]9NOYKY[EN.[1S
^1N@gP2+XGcBAJX.16:,(ObSX0J+SY3eRMR,@]W2#T0?93YLXSN4+X;aAU7?eZY3
\28C?0I#ca9SLLTY\a9gWOaD[&TV(:K)?UL:0Kg42gJM>ZS,QUCPLEWc(MO&+Ta_
YW2b4a,+VSdA2[W/#J,GXZ2MDR&1.2A_9_Le[/7Bb5^H=155(FUL01dbQ[;gV(F0
Vaf?(b.9b[3=ID9[YEJD_Vf67^aN5>D+\Xe#6D(2g7^&ZO,?@#M5C.3\#e8:8T1I
a+;ZXZ3<.^B_?.dd[MY_1UbDQ9[3E=X)H;f4;9SXeQ6UH-H\Nf?54K>+;d5ZI./S
#cI+(&e(Z[M\\)^XDT>8M/d<D[F:+g6+?f8gKTT,62b.Hadec6TaYHQT:b[=cdWc
C2UMKN33)aYM:B+@(b)c01,;4K:4U65,N(08;@TZZ/_Hf#5CQ(>JLL17\2^@/[0g
-4>K).^&_GS:OZ,=J(\T^7P+#;<5#@fMeLC<WJObCD-ASQ\B8MS=Cg;,\9^UR>6U
=0,<K+d>IXGWXbZ\K[;R-=bD#-aW7@VbU\9I/0#:/a/#PJM6G)]B.M8OKSMZX)1P
<+bHNUHdQA?c7Ub1&D[+I:H\+?I5CH3)V^#eL3cBO.LKW,UBJ-)bYD>)-BB[PU-@
fQ^\20<gB)SYOOAbcAM=^M@VG2IV#AL;WE(,YQDBeJe>aI2b-;;-K-5B319;_PBV
+bT#,R\_La=-E,4/f3W,;7V6BJO2TYF8UE>L.]A]G5]M&He02f.e[\^8ZXaN=f;Y
V/Dd0XJZ/4@[<8-3NcU09U^decNgK/FZ8&?fL[HZP93,]E+68g_Y89ZY/NJN3b]A
[8G#\@5M&P(92GV?(E]P616G14V:-?+/9RZ,>TRV6,L).4JU_b8CbVJ1G-b67UH^
4]FT+.aRbP:9K?f]-KFK.:F;2Pd>(38G3g7Kc&^>8HUa51E^_\WE+GM]cSB(>FVL
;+P)E4NcDHTJfAgLJSGU1X+#S#K5]2Rc9N>=/ef<R?DFN#+Z]CE:Me/().>QK7#4
L31#D4^TWHE4,?Q3V[VaA/2Eg.aA2d)M/11I?)Oa4^;&F&8,DeL6LN;D9[bdZOQC
?-K^RWA6;QI>-#W\IT<0C47d#?,)G5bd\I9)3;-/^G_2^PR64K-S(1[&aODK/)68
+H)I,1&U#9)_P-VXPUC3MG=&d]AYc=>\9Id,MWT#ONGgK9+CG:-9>[#N)6,U&PD2
F\1Se+>XOD23^;P6c=71QU()YCAacSC7b)?V4ZeB,NbF03M_\7[#4<8<XQN/fA/X
-LKXeS&;;FaP2KX6AEVUVB72B.J:IHeB]8#I?I^UYGb._JVdGY-YIb9+=86K(8c9
OSe(VfVFIgU+LdJLOQK_(0K#1CV&>.Z+XP.dF1PM.ISa/IU&YfP3.PL;JTda4Lb;
A09a(^H_c96Z+VBMEbKPbg]e:QEf\=69G\57DN4BPXd#4(fQ_(I9G8F@)T=5,LBb
gDA5)RZUDNe.^fbbCd.028),7G7HRIO8CCaY-_Q#J[Q^bC>E)W6<V@,+AS9HXRU;
714AbO;BF<4.[-C\Z^WeL5N#8gDT.=CWGI4fCID<D.R[S]I1)4Ne+]S40/d#BKH,
>26P\VK,S=W;6a&[bC[VB8[ecY.?1bObJ/d+ELQ0,a^R(b(A\;(HC3^;b#URO5CG
MWCTf&3;I;)56e65]GfGM^(Z)+Q9Hc,]IY1@(<<J[e9OHf7c=bdDVSDSY,L72NRQ
E=@Q.0I2RG)b,5S(_F_P3U8DPAd,:9e:,+=RYa5g6DHP-<HH,S0+9STO+L;g4;,d
G<;BT2<+Z_E6B-4;,],^)F9TeXR-?I_/?d[NIa7I[8AGgZ,,37[DOMG5CI8O+-6C
BM2+F8C73OVXU5HbYC78>R0cOUYT;#427RSJO<c1SKdcI_\fJJc<VGePP)BGafC@
-LZEe57UU::FESB,]ZEddHVH97C;RMb&e/18C:N=62)#\c;^367CY7[9>+0aU:g0
0]UGOYVH12>YWFEZ&D:,P5WN8[D(808-Zg+(A7GW4IbX\S(@WYS8<ad4IR)91,0O
QF2#;PD1PGTe_;XGL#dI4](dPVE<[W<#e+>)c75SR-AeWLKPM2&E\Y<-N[MD0C1?
-Ic\I,LS,_#P@;(dgDaaOH8&+N\OQ<W2L?U0-6YPJe-5fF^VX]&MBQD01;C@GPVd
-)a:KWUbQB[ER.02V>PM)ZG<e?]T)I4_/KU_9W5R5DVNKXcfOZXGP^]-MRf0^-Rf
QVM>^..D;UT,O4W:;>,B;aS29K@&c:dOH\+Ra7GfId6=R/;?DdAS[-.g=PE+FANF
4V?3:Q(TBA];FeEcFGP1c\DE\:L8VW-Ve92R+1c7J8AO#(N>_Pc[M,g5>;2XE4/0
Z3UW/H6LG(fS,2bE+[feRaJ1aG@SFV3,C1+I[]Ud3MU0<6BIB7SQ7aIOO5f_2J_B
Y(@UGd^VX^acC4Q;N;Z-#5MI830ac3MgPfH/5GDa+M8e?EX=^,.O7WC.O7YdRK@I
#N^WYfIOQV@FRXRVOJF6>4ZRa^A.d\bFbQJfMFE<M[QIWb8U8:SV1PAeR7gQW>I_
V695:IR3D&V1dM4gN,CdJ/7?d>E1GGOIC_Q@eHJ)\[a7AZcC0J<NFBHg00eEMI9G
.HTK6TIQHY)QBe5Fg1G=P]DJ4c1_JAGR0UH?2&f1UD;NC.L3g-a;^+DbgF6=gM<9
KGI52:B+2c9?U_U=)T6\7XEY>#5WU3+,<S7D8OU:c@&NCGUIK,)UfAbF4=&ETOEY
5+2MGZgS#WOO)>DA_?&bQZD)]@9\;c^Y[27A5fcMO#gScV)afY=XFNFKNDQdH^f8
>?8HH]C?ed<g8e[D1#)f)<T(Xa.a&dU)[16:B3EE[95RKA)c(K8fE_DCD=Ka+#)T
&9DCe5.380Ud,Y4_+>9e2G,4TGUJ)4a@af#4(fcA,efMK?AA(@KDVM1]5H@UW[NO
<3./.B2Hf8^.\65;B@AEG^,4\6cUXd]9_+1c3L0QJe].HPD@N^D;&N&ZX(R(eaS9
,B1WC3OGCO?Kg)MH7gEaWYTEfUA9()=R:L-Jg^[gV3+JMY+C3/]9[H@S_9U.N2g=
;b;G79MJ7Q@<-:9IYUCI;&f7fXY+@3fCF\#Hf.]<<75S)@(eg;[5?bg-+bLR7V)[
-.^:f+2+eLa/Qc9^MeVYMQB@I2Z@U_R4W8U63DOU5^b-_.THX5WUOd=/bO#763/7
Ta3MBP:O]CW@]\cTG<IdY_BW,I7GRO/8=S(2L6F7FDEJQe+2<@ABLM&I^UQTH\,4
/:c#I(,\<7ZILG7T74+T4P&JI5Cg[g@=NVMSAM[eCUT+1@JRJ=I:b?X;f,DY:+A+
#<V9d/ZM[[I_08WLfN9d+P7Ja]#AYA.O/4#^HRK^@.7,;NGI[8E0/c\ec,c+^N<]
[C?E9263gUD88VV_F+@N4+bYR\bd0&JH..E5K^7D<R]aT#O3A/aK#2C<EY+3]RRg
TLXCO6/+B8TQ.UgI)?E?O@ZaT+)E:@D7V)G(EIIA9]LLC]E-A?]O6RV7=//Z_I5\
ZPa&-^AVYd7c\eN^(E\ZVD.UA]GD&]4U=F86dLe)S0CeT<L=\&^P.3JV69FW1/<4
7TTG:XTfGITI<:(RL)RKL@8;0K2Y0N0HW?_LM\Y_)XS2:c]A52D^CND40P:9C6H6
LR/H;aRZPcbW-^J;8[Y7=ACI\9:a6#bFS,[:Z+(Q4.#d@&A&;,RNZ1[M/H)/2P^&
B1PG+@.1\TM2J&^L@9&e/cE2<7FPgVZO,XG@8f^D2H:6Hc-fc&eW6&(EM>->;ZTS
Kf+G3\NZG/.G+>??/P8f:<(^;)O_8#.W)4>N7c-TMPO(aILGf4NPG\.BF.Zd3>,e
UPTMMX.(DS2M57ISTNLM4&_ERL7:GOUP+IcR0U^a=0=2/:1\@RK-cUSaTc,bbJ&7
&&W(KgJH+4&)M=YI\b#DD=PXY-YY]32eHEB:1C084M16L\G]dU]&f=b>FD.gbXX#
)MMA_98F(6&-J216;G)2U8EY512Ic+Vb[[4bX@F,/\Z.[U[dc846@;OUV7?93NL5
6]>\2O#8B28?e]Z4d?R/>L.4]EJBO-Oe7E@^-Gb0JN&?&3XPB1Ce,8d/)e3,O?2g
NBKH@DN18G<8c^gCIETBTag]+Q?@P/YBGG7W7HT3]>D.+]V;ZSPIY0SgYBgU037W
Sb]@UO+\IR8YWaE/e8,EZ0A7G2#A>G5X>SAR+9:>(fa5U49V[Kd0?R&_XXG&1aJ3
b\INJCe_]G:VTS4N=.WN98B3@GgCf2&40S#/U3gFZb[NCO#:R:f+I7IO;QUfNC>O
W+\8KMVZ\eLV(.G7H)dFZP65<ScJ=>cYF5geFZA\OE:9N;fA5#4OgICLKQeLGPYT
dD]L1>\C^,<ARB)P)AU-Mfg>AUD#B(VQ/0c8S:R5#ZW=&24DLNS8F+I]C5+&(]VM
=c<S[Z(GfGQV1cJ0,Q/=VXcM@)OOHFUWG0YD34_&@Y?ZaM+:IE\P]@cP:JL1g-fB
@X=]JBKCM^^0<.6K962/G39C)#-6+aI#<fVNA<5PXDUH=(8W2gd1ANZ)2K;a)2.5
\J/R,JM9^/;K#MUBU-P7VZ=<g2IQ]dZc^O4IV1R2-TE:>)QdI5.?)]4;)>4V6NF6
K/>_ge_ASJ/WAK&7N):0S&80L(YLedd?4<XJ>_\Od-Q/acSNW\IK]g,&.=K:K-4#
PSaUJM2P&Kf3eO^Q;7&AJDOeZWT[J;Kf_L3T\KKVS7UK\?K5WD]R)9N8MgO7F8/B
FWYN-TcbU0bbTM=_@3_N5KgH=L8U?S::8,+aGOON])X^bQ:5FA+Ge4@[6R_EZCQa
cVL+F>(=7(VW+\SPO4L:7c,KJ2bbZW,UEXF(SbXGZdUA^Z0&@VY#^.Z->87#VJYK
eR8?@dTgS2F<31&9_e=Y=O:P,\C</:G[#BW(d0I(YJ;fEQZ_L;@-CfX,dE@P,&+>
Q]EJ:f>\SX9FK(SaRG#2/9c>-)9V1?H,@/DNRW;;M3d_4Z[EHaFJIJC0eX+>LYg5
([HK&R@JY<S5I^Kd36I\La5gVgSK:BOPe+#[HQ3^b#6LLSTeDG^O:[<B1&:M/N2W
L9P=]?7-(;7MUAU>.N6d^M8,P(2-+eUI\NI/O4;RdU>[?e(:7AX:W>6.e-C^VW5N
&>)L<dY3bX[H3GGX6>SZDHcJ2KfT38a]=)+U]^-e[1V,?I=@X2QI6^6I?aV.U#32
cae/UYDR[2[E_;XYgPRBJO)IOW9-__3Wdce\F>6QFF:#2X>)/A75ADBVH65GeH@J
6D(QL9TJR[[JJSTaIX:.B,<RFR5>MUY[01P.E6QI&AO5(I5H3,XAY7.K>H71/aZ8
4O:=+^N>X>7&,W3d&c-W+(XX?\C5bF+fBE3&PU)BL\RYG0-(ENaM^,->E+3g9<1g
_SFK/ZfM>>66Ha/--)Kd/=X;c\L:&O:b&f.[F3-CP]Z,,M/,U#N_Z(3Z/[de,3f)
Nd)54]3RN0&,aP&e2RE)X+9(](\F;1V_3\AOV@X[McYG=HcMF?PCV0(V5#CPc),?
Md-^/K?]2MA5G#EUF,]E/XN&(/&ACUd<Z\9,Jc0AR;C9)\U_QQD/KgGa4.#Y46#g
M2)HL6@J^&=eQ6/0:3DD&(DaWcc]/Ecec@XIKHRb.Qa]XASZ];]MW<_7TP\]?+8F
6S_COVR43@AeP0Q6E1A,a?>3.(Kfc;e[&\.eWePL3eD4ZW8+Rf4#_)RTNWb2EaSQ
DB-SGF78[d1.bL-2fWC?->VRZE;YVMP43Df7L:U^0,DQ/J\-+3T\0X_4]L78Qd:=
b1F_50_;b)/LFVg\[a7\J-/(gI,c<&Oc^+VP1#A-R:7aYO12L7M[-gIA95TcKG0-
C_0/_=Xb/c^UJ01)=(+Lc7L&Z<\fOfGcXH_-S2<:\XR<DAL^CZO?48A+0;NKT<)b
[B\_Y+(,NFINfK]ZW;):PaMgaD?<dR3cCG<>Lac6C04+8H4DR3.QFg[dIab?-&B[
=\+&BT@9)6fW)b?Dc7R0O9\e4^]b^.d?;gL_dS+\6^,)I,ZW4L^GaQO7edT5]&6U
<d(\2SOOGTOEPI229e<VQV<V5XSg;^b20R<F#[A#?STNE.D?Hb:]YJ,K;^A@[-&Q
TafD2\U.B1BG(^#Y9P;7L7[5,/2J&]//D.52A/K]2]GX__=7&?]b.?88BX@FH71[
.ZC)9fX#I354X26VNERDT38^T-Bc--FI)T2]aS,W).BND(6PP_E-S/fRRNFZ<?_&
eNa)>-Ec+Y4G>+QH^\/N6FY\_Vf=<SHg0.O;;/1V]\.-agFJ.8D]d4+-SJ#42J\T
10TKE7<EQPDR<OQH\;4)_RM0Y]Q]fJe^.PQA9a102F0K[714.X#S6g(SY\/C3IK7
8Ob87DBC5K1a1@5fYgLbQUFR3P[e3fV=ccY.(V]CXWEEg5(9S-/H9dGgPFcI&XH1
;.PF)&Fe[(5[D9MHW)GDKJJ]AHF-\.]cLO_OAF>(IC6X.PJ#F+>SgICebMe;e&=e
d4aNSRbA00519OL]SQR)c85N(RT:EY#(&A5A8_+\J7&&g6LCbc=2gFK2#)DB@Y_U
D.@>?0GV4g/AA1@:9BO?-^&?R)=(,7&Z_=Q5?H@g0Y&S>e62e>A7fZ\6Nb?gLdeL
CME[PaIcI&T]G0_Ag9e=XZLK-bcMfICB68^>^ER:5@NO:a>G+W-.B^YP91GY^.7N
UMS;(g4HI9SG\)[]4@V2bRb4<a0dWA8>(S;CUK.@(+S==;TSH+Hd=DQ0bK74)GRa
MG#7Y^=cA(<bE[5))-IY[9Rc9VO+9]L>c4@BLgcLB_A<50>[?LLDF=2YSN[J1F\.
9OQINPGBHVET&)[1ZQ5.@D3fL=VS+380<C@_f@?F<(M9=3eK)AHc-M8Q<c1ESF,(
OXV4HU>7^WYKc@(Z_OR86@0,Zd-AFW6DU^,.g4eefBZ#5\R(NWSJbQ&fbXe9GD9@
7WM:NSa77#-UN[Vf^Id0T2e-I/OZ=C;FcUW(<eFaG0S=Y[d1NS2,YE;]A^,7I+BB
g8WN]KAD8LABWHL2/:3_Fd#Wa0#bYA=_:0^aPe;eOU#_IBBB\@5&OSR](1GW7R,K
\F_e7fVC)\9-:?Hag_IOD<KN4->)c)^)CI.35I=9R8cdT>YK=]bHM19;RZ>XZ^)F
N\AAF]Vd#AD)IUfCEX\D9f(JC+a<Uf:cVc+SS7eW@e>@OHHAX0XXJGIWF8B=(291
_P2#F]J+9M@8[EAME,L4M=J3Kdb&^7.L<:PHbEbJA:d.JYNQ?TZV7fO\#1f1P,.S
Q@NKJ&#2R+.]&;-QU>.bcO/9DJ=aU\9SaNYV2dQT:6\AVcBF1^<OCCN])9b^Ed<?
_UY@=CM.+A[@/GP7[=_@__5g()DF[5LfgUZeJ1PC-G_^bD9X1B-]DS/NMO6QLHV>
7M@L8Ue)Q/]YLe5;BF8+]O#LcG:>8YNYC?N7FbDUPOTc[L)HdgP0XG6#]2IU8>4^
5XNI)R4.OH0/T&:20bgbUEBM6Q(W[a>QDK5]5IAP>+G2VVd33M/XZfeBQb,^b<T(
X9SXR.(aL>0+FXX;.0D7#H\9)LCPK/g@R/acB.N0MQ#?8Rc?e[^94RL5)>gRX^<e
cd=R]/MOX6W1#aNC(I7L1I#H18T2YN\g=1J1[WT=7)8cUTC[)1(Q^24T)GGFaU0=
;DCeS&^\;;V:_ZgGL<2MY,[>HaQA>G@7^9A72<+3e3-dYgI>Oc\\AB6K_b0:J]WS
g4RC)_TZOZP9A,6bM6TD-_M.^OgL=(6_bdaGeNeAGY57(&5JCA\;f\2V,<[WfgcT
Yg+\HPXGK01B614BG9\-U3aTYZTG0ZYWQF_]ADJ[,XADQ#:_W#/1T@@aG8Gb_5)=
6/U_Q.K3e+a<E\\H4.d,a(#+.[)>,N(CK>d[4.(,eV/VSXXP4bC2ASF/@g1W->8N
I0fdWd_b;5?I7DGBf)DN8WZ:E)[Ic#@SfL,YNAA_;:J)&=/6FgK&A@0<IcB[/7dT
/79CO#D79D-&fGE9>.3B0<FOM#D<J^APNfK.gR+J3G#TE4EdZD;W@AF\^:EGT4;H
/2gb+LI-_;V4AYT8\H(PFcc2K[f:QA6+;J6N/UPKY,53BWJ=P.d0J?+S_EFdR>,3
LR7Q;7dVF_5c\\=2Z25>143SN?V)C:W)B@/A[dM1Sf9HYcNN?=JI<TN\_+[SUQg;
O2c@K7_?-9OgGUC.I8S[UA^+0]=cD^BR#dNE7I,J5FGR5Z-W@I9b];R0NX5U>:UX
5Ie/gG#10A_JB<R/-C>T9>6PR3(GO0U<f[K0]Ab)Y;#WUg63d)ecUWZ9F:_YAJ,)
,(>QPOZ<-2MQ6O-9JX7EEIJ^_MW-+B,S\=P^8(<VA[.XA&]EZV,]KBbaG;1@M.@V
B9\e1be;gd(;?\F,FV&SdIM/Y)?=15AWUd38?,#4F.2B=6N/#,V:C)]gS]55?J.;
_#Y>N&)Df_P(RYKY9IHXKFP@4cX2TR=>@H:4A2gW=_W@A7>f(]84^099R>X4[:+C
_FZNEfS1PHUZ645BNS0/f>1&-Xa9C3#eYMGJ?@IMJ9cEgQEUGZaNWcI:@.c\PE0/
=6_-@N6U#Q>T;S+_2/B8-TNPd^R+P[df2fHg01UQO9DbF1d97VS]T39<,,3>dP;<
J[gZI>UcZ6Bc-\-,_5@\a?+?HN\Pe[]Ga0&NA[=QOQ?g[#MD\L956R,2b>-H?-,7
a3W=9I2X60/acbK1)KP5>JeN<B8YKQ>T+]8C=ba[QUTQA]C.U56-;OJZ_ABa4;54
c?FZ:-#K-;;HI)XBA##6_[Q8&1a=Z-Y&:[E@,OKKf6S9.F:O2.G^]=#6]S<&M]cf
1UWBdT<JdTf?/X<K(KN9G2#^Oad7F>9LL80E(3KC+PYU\P/23XK6?X]KO]X\@4fG
:<;C7-YM6][MHc^1\#->(]]g4RBC58IA&9fdWQA_V2W#(,@a()^.B@RT[#NK9g#:
1(A3FLdAP^d>Sc6-gg,IaLe>GBN>CY?#,EHH4U@Z)H9Gg5D[^_RGJ5MHS[ER)_AX
;M/I74@ML_04UM^X85MIOE9BV:@1&-,_@bdEA^RN(N-\86D6\>#8f/@J\MTCTR7f
EER+S?+8#eO219DM:e3H0N#74,:8:]Z2(dUIZ<3^O._-NNDVg.5F5H3\cd#Z>1>;
/;SJ)VBS./[71+,,J)+ga/Z>M:2+)b&EYbW3.eQKW&d\07C30>=cI[C4XL/QgOYU
^F9YEY;_4,HJT@\9EEed>(:1(BgUY-ag9<[R_;X,AG3Ee[[I[I6JF)&V^#J_@PX?
@a3HS-P[YN6ccNd[UH?3,G1dTD/PaG6>Q\S^B7Y&NF^3Ee22@YQ3SSH+A21TKQQ-
628YZ]5QO?T8PANEK:.)<Ng1B=#dKAT5FW^)D[Nb&;G+S+CF=&P&HU?<QR@37ZD:
c//ZdX)P.O::>7c[RUZ(]_9K>QOV(-F(Be<OfD99Z3KM=f<04IJ77916&H^R1(_(
7BFQ3TGM\QT0W8,,]0a:;O(/-^-D;c:#IVOYXDeXf/,ER\<L)e_M-(I/Nb.]QB(U
c8@G:8faZ7bM40U#T?W#HI+6Ha)aW/GAaBA03AI.YP7F\,HHJDZb6/eHH;FZ9E-F
\AW_[;]Ka&UUe:UB2XKGODeY<-5XegUVOIO\QN&8L-Q,)B)EYc_7gI_CcBS@3SG]
/CY75604Mf.+5YTD72IaL/\WP[^0I1E9K:UJ6eF[N[+ZII\54>ZO3M;7VFC8gcV/
;FO=cd;)2RF>,-/JX/cO\-=C[0c\fK4]2HK5PH=74cJAeFO?fJ-@Hd/-TaZ<NPM]
F=@\]SC.+\SUOFEU\BH92D/XPQ#U_^_E#BL4g\O4a1C<>@3BBENRIALU46UeH1+^
#D)OTM8935Sad9G7dLcO)XPTNBE\]dUKed5L(GfYT6UR_.H]ABbZM^B.H@)#;T[&
c7YIX(b6QNZ4YD\a5d?X0_fJC666TO\.HfX@^T1;-g?EfeEQZIAK<35^XTBDD]IQ
OS?Vb+4/W?HNI\bEI)K2XPO\[3a<KKfO6G1+UV\(0;J\Z:VeeE)K^[C_c31(cJa[
9D<(1/-UO2?:aOYIG.]9dVbYaTV-/S<+_WSJdb#CVcab;N6;L5bF5\<6/HGT-6/.
B_DaFC((OD0e6+]63#QRLE#b-?Q5;RIFKRYW4YKKQJ29[@^a;/I+#C_II)OA@eIa
;5JTG;Q<c._a./bPR2g&@d658P-CZ9P\b3ac[JSIQV#Z;@W]#DKK&E?(Z?#eC[S1
fgb\5H<TO31=\K)4S<7N;7IC2#P<AC_[eZFd,)<W#H^1//SfU6?C1?MZS,8?)fP>
CcNNIP)><XXdNd,V@L@.BYf/4Q\#<Q>I^E2NQR@OFF29U5QZ][^e&4JZ-^QCHHD\
HPNXeSH?EXfZ^Dc]df@YJM(=HJ0Y=&W=1VBb])[FSE@7BV=)FDc\(RRd\MPMU+9M
T;;AO7VQ?.Qcf(H8+];B9J:H?H.O[INAHG?_:e0^IOK\a#4@BMc3(N8GUOdEMM1.
H=eEHS/S4X]W\6FcY]((^YNPY,aWJdcQ9Q,7]QR1a#gK.Y5Z^aH@MZ]>4N9e/\;G
V3:GX]1M[+Q[I3#088@a:=SCg2WRMZSR,[a8G9V>KRK+:XQ1](J8,?J/H<U^OB6b
/P;_Z6M=8(&gX51]5IPgbfMWG27PR4c(K[-[f7dT.7LSg4P(Z3W<N1^_.(7e8a)f
6+IV@R]6WYQ^W2WLB>^KF-HgMb^9+=4/+c75C?^_4,.C/R_Qc-0[X&F)<ZYAYaT]
0)9#Y)6dW9(YZ9P(5SY>>e^KeD2cF7HV8:?-fJc7b:8].<>]5)UB/BR,<D]/3&:Q
,X&b-1[L8cU<@08VX&1Wg6,1PN8^.^UR?TZZYe454ddA@,_8:bT,9@Rb0[P_YAY=
8MU_1,>91&:V/PK>Uc1K(,g6E?^AC&:eM8eUR2.5Z2,ZIDcXd./J<I/RZZ(<42HJ
Y<[8]5A[H[KT)BSMH[UdKI=g52KMWHSD3(Ra5;fc2:dW1f+?,A+e)Y]L#afIS?cJ
5X7&1,NLE?D(_(1SM\See-+<;@TQe[#1R/=3E<c[Vf_&1H3D<&d]bcOZ/4+fG/T<
=aHE<EeR:cSTc+/Y\<,dOYAAQf.JK[)TK,R0WN8[/62=U?QBcBW\D??7F#^)a8F7
3fcM+/6U@-<\c4YAR+(;+eUQMM:08_g@?EcMRQ\]BPQbZCBI<WQUCe\8ODPA5a&S
MCLfc]P_3/HUfU&V+I>4a&0)6Q)@8Z[APYfCKF_]R0Z>1Y#La1(dWOFQL>UL]2#)
.V:.+==C>(6IGT,;cf.a5Z9KG7[NM07+52D\K[X6,8#MbI@YQ>>#XY<Vg;^CL^_0
&&UPW(-6C@P5<?eHQI?aLCeQB5<H[OR_a.(.@<#[e-c^1QD3PVO(AeI.eE7=^.NV
?K:S#\6Y63]+RfPK7XZ.HTL<5NWS:Ic302LGW;\f(E]P1&fJJdCHF5M9=&>8SU?T
+@5N0MV^VEZ=PbH0AWdU:1^6>926FF?>KOX.9<7gIDZ;aQ8e5f>JE_7D+eLS)7ef
8S/OJ7VbEPZ9F3]#.-\VaC(ZD=>N@9,f3FSR7]X,\_L2Q?Aa9..(e#;/>Q:#\7H6
[#UE-<OCX>>E38#c+\TfUA&UE4\_RM;J,&2S2T?8R/.g?+cO@N>C:Q+^c7RfdT:)
M[Wd.3,.QY;\I&3:P#AFQL2]@F8@A<^a#_A4^(LHRNM]L5/:NE+,:e<BTHK=@#UH
]:edKbX8_Kc-53,@?#+\ZYV+X3()9)e+[B.2-OHL/NJZR1(&:_T4:4_ZRaDcI-Bc
.3_#0+C;GO\Q.CUR^8)d]dBXH,V5(IX(^TIa^-D,JSK)@FK@36MBLH?KX/YKH-8]
(7Q;\:5c[HYN4e>81SN;aYZ72=U&2J]gP6.4;<HYHQOK=2;V38R@BXRY#a>A:.K<
R9VC36RX,9Db^e)GJP+cA;ZJ4YG=A6?ML]B\3E2#5LH\Z-gYB.A@VXO(E8a@3QE_
G9eIcT2^K?_.4fOK#/;+CJL7MWd\f@BV<A=<0)Kf8RQ<8:Ccb6I^;<bRTKXLG^C<
U.0W;[>e/;>TIW&,_NH=_4c93MVb_]FC8VYVG)3gKCJ#aIF1]7T@CP-OgO]/&ZPb
gZ6)FT-aC,aCKT=#RFc<\.>Y?<H]_PUG#+F-XfbYfcMMVcJ_.ecY;?g0PT;+)\@0
PL\feg.3[@@@#d/b8gL.)2N:LeYK7cSG^,L#IJS\]Qcg4GO.60KP0E/M+(YZUaE\
KXB,(F<BK8fM9a,?[NRQ2;QC[\83;QH+,#KKKI_L(f]\R9Z4eL^efIV_@PJEP,3U
&5UND.5+V.WRTb.-=>5IZGD2D3O+AR[CgE+O4(@df,5YcRd@&)?),OK8RVX(B>;C
FC)V2HZc+2cTMfUZI]D,H-cV35cc]DNNBS;>/]Yf\5O#1.fKH[.N]C?9\a93U=+1
?c\ZaJ0D2AY\V\VYU9<Y3BP1J[d/P?M1&T,]aEe;_<)WU^H7BV-SY(@3U5<M&U.0
>FBZFIXT(aITJ8(B;D#+NS7GYc4]YFJC]Kd;>U.egF_NU.&KP1,CdWZRSf)C=9#:
3-ZVW.3c?M)F?@VeJBaYUIL4L\__F6McC)0c\+gJXQP4PR3<581\L[e=A5e8;9@[
/UT:N>P)JQ_IGgFGR2EO#V-J?CTdA&/BAJ7T1WC\.-@&344=4N<9,2]?^?CL11;M
cL8,(Nad1_.6OL-4d7;Y,LG5gLF9;(ge\E_)>PcZ&f8ADf\BT3ITD&1^N]NE_=@Z
K&?38\9._EbF,E91OJ64B@MT+0<U6+13DgV)aW(++/VMdSW;Ic,B6aQ-I1S,;9WW
Q.#9X9KB0ACYYHbP,c8.FN44aY=.D;bd-()Dd,P[K7@<bB(e?P+a#fcIdMLJUaJN
8KJ,7VRgEN/S)?/4cY_2ZV(dNKY1Ue(WGOGO7YH_2]0gV^.)OaSC4OWQ@;W11/\?
?X[=3J1Y6gc_96(QX6g/XH655EX7,L4^4<)[3^C\;8\TY_+>gKZaH7286A,6D-T+
OBR#]+&6MI841+V.KF=E6eLbCM=^:SeZF6]<4X)3eVF1R0CT24WJ;]aB^BYGR[[[
f0QW=g61)R>d8eaZJGHe(JN@Nb=9K1#U1f@Xe;XF+/9]=TVSKJ.),;4U;?C6[>VJ
P/Q<M-MA0]HH@-.OP>g95J?_a.QIa40-faGaT(H?1?5cAJU(^Z\&/c&O@.@RWc,A
311536Mf?;V#8fDKUQ5K_C/Z]+bf&\N\IZVIW1bXH11G+3ZZ3O-2@Y.&9H&.G_#)
O7.;Z(F(?>=YFb63WP8?_4CX/FM(6T2Q>c2=>0a.SP64]f]#EBGW<]S\L>[-4BPf
C(.>Ia[;L_/6X#fU6MG3<,Vf]RcT5DTedf,XO==8KO<g7?U/f43]V^:GPO71:AC,
#R,Z+A&^EXB#cKU0NA2:?J5D@1W,9QUcM71cVUCE7Uc1VC2K.K0US[Q89ELIM:b1
2-PB>#77Mg=f3PafKSP9_dCdg#FbNE/>6bZ-_aWCG4-RcQg2g5VfAV;NHH)O7QL4
FI2cVf0Z3L(D(?1CP2AV0=0649P<H_#?NP,T0BTKQ9TF8@cJGA]:P1@&cM:Te^TK
WeOXfFKV=1?<9N,B60Od.)b7(.><M3\K18SZ&(E#>dN_7d>CST6ORP@N^.7NB@[P
:#@CL?PKT[PM083SS.NX-)[\5)H<),P:.(NaZQL\R9:7K+H,)98[e9#5?GF(GMaU
eMU?:I5[cdXVS.]IOCRfLXQMK\ZW#MT=7QD@B8f@N^7A[X=aF#3OgV1f>-3A&3ER
ZP^.].2>gW/g>XbO-<LW+K1Y=8F,<F4g>H6TAM&PMY8^c.gHH_fXNc5dHe;C8JbM
&<.<U_&_M#8SaNCYDeVVH2C6YSMO:.8ARLYC&La=:&8P9O9X#b@X>S([f#gZI/\b
4_),6/KD]e3BF&dY&#I5;I+f=[[.;P6P2U;B^P2MZV(eY.J758_LIJA2H)Y)2EXK
)OWe7BRR/a87OP]8V;?G8e3SgA\,J@HcX7-+X<@:S/G4G9?f-NH2?+-7S(+3,=-:
dL>T2#TOW2HG>++;,CB0;W0<Ob#e3)#(]>E(9=@W#Rb]WfHf2#B<RTN&WPgYUW><
U2g:7gA199)L.c2f9::?TM0#VTG>,^1dgX>)LY&O>I8QBJ?G/C4&Nd0#EgD<WZVX
U\/1#KbL^C1<>S/_\JOHI_CZ(;;GPS0fOLHH\93L?:L@)T[_^QAG>1]+^_>;A0-U
L,=1Y>IBfB-.X@-S2;20CU2X>(#@KHB36DEZI,\U/e:XH8G4A&(W2_3OV?0FH:DH
aY]B:>eX-.YERYNZ-ee^[EfGDN>#TaX3A&bJZ@fGAZFf#67<CNW@Z5^WS0f2eM5(
EQUg6L8MdEE8gNL>F7B1ZUe1/A7]JfHA?cGE:@W-cdG74R8JTCYQ;8QB/,LVEB;-
G\XFR6Vd?5bZG.B/P@/6b-L7E-eP6DNb37,bWcg/_<>U,=VC(Ue>P^G&e/VU4T;-
UZ+<BU2I+=Sf(?9-FKQO5YUOK>1#E5G&.c5TSG0^OM]12a0c:b^AbB;H7&@8PH]+
QUKOd=ZR,,E4^UUW#TG41B#E&MP,4A<2CGg,RTD[B:=UE_QQ>M@GAQ=[U(B;;bFa
KfF9U05#d61CSc3PU\MD(H^WT:J5a^FE<gEVU^,B_3+Xe<9IN=>FGFN2+c_2GAYb
0^+G7ZL_fNM3@)gB6U4.B>TgUFO88\W7.QX=,Geb,W66e#bEIUgTdAa;\XW6K/5E
S=NKR>LgZDRN7LE=SY7>JP0P@Nc+JL]a4U4=@0S1g@.0:HFM@\=F6BW]9\16O>0.
MN19)]2HZf;Jg7I49N@-\FNL\D65#d.CS78N.P8Z,GDQbK2)2d8Nb^G@/@^UK2F/
,^GP4?]4O^.:/J:,442;<QU1V/^<^5SSZ,Z)_eT&++c6(\[E8RaS+BB<7gNU\,F)
/EaOVgdBGK,6YSU<aDJW>W/e5=0+:X,cY:GY49Y\;>//e#=7CC2R4KDMXG7b9<(4
5.T/>g0_ZP75J.D@IXX?L_487A=Z?Y_+\YI=0LI.V,7NZ?6C9.]@01/_:E/ZYGJK
JD-=F:]9=T)OQ(/@\?BR)RU#S8HDT\2P+W2#-@PHKF^_EXRDSR74U]\Y:@?&Bg^:
UgA4>5CXDa/IO4U)X3Q0A:I56]cB9(S]H4O[0=_-5XVIK.]HDC9U3L5c[KNgD[BT
P7Ye-SCYQcQ85MXNbL?OY5W9K;C@2&I&Pb&GMOg;a37<G[XKA++N&>6LG,GJ3NY1
QI]V=F\C=D8aQ7X2^H?.>G^B9A9UUGAA)&g]Z:1bP]P7/)Q59bC&T].eI]7IM0c5
3/@g(fTYH7dP/)S<,@Z?\Qf:dH]+U+4@eJSG9aAN2G(8R?PWMD/+=TSA4KN/_QF5
?(5@0NC]cS#J:3<5@C8b1E[bcE@Df>4\ZV)RV<5_8Xc_(UM0NZfOWQV@Hg56Z?]4
ZG/c43Z)>GL4<(079.X_:NJ82RU59cYeY=/8C_LV+(Ng-17(:-@#;YIdaIV@E9Y-
40d/NJ]O(I-a>Tf-I+HJU5#cURC,(_]9=cc51ZdcdPCZNI:MTLR<UE3L[P+Q:_#-
5@PEI:<Fa->JL7Bc0bHE?3b:&Q3].7/&(;ZZCY^5_AS3^g[<)5LM#8(Q1YD54:;0
7)]U:Jd#U=<J0TZ[7_b/MYE]EWc-Z6&/8f0-\N6IRfaA:0X-e&;Z2LW;PAEc@[WD
(UP@Z1ff#/b-T:P0EU3ASTbcM,2?cZT]\GP\T:EOG2#/bJYfCJHJ92=6T/,a3Q2@
-AK[I)fZIC>T2<LU?OID+Vb,6GG^_PKRbL<C,X4-(J->_W90_1IF(O.NE;Q#OJRg
-=#VA;1aTLZ.#FXI_DS@G5@Re7;;BM1C:=#1@E?@H0JWbG1#[M+Yg,<#=AbV>8_-
Dc3=K==>RQdH#>#UYbQ;E70d=KSQ(M>[W4ZaYL:eaeJ2\2U12#BF2g?6LF#@33.:
\2<\EDgG30W/ZEZf7:ZDBXXE_2=S#,8D>Z>5L4?_)Hg>@2NUV-\(0C#?>2?a2A.;
R/MFLTINP=>(bM/;.:/#eYY#1YADUSCFSB1AIXD-Y@9J=E^K-&\B(e9IPHIBLfZT
E3c\Ye_)f0g<eB3OL838MSV(/,-a111f@-8+09gZ+X>^SAX<X(B;SXe\[e@^b(Y)
W\;\T4EW8W>gZeXB.Z_(BY&b4+(+J]]EHI45^Q_]Nf@V(:<&fPTe?4X>GINKET]:
P=-E-&[2B-f^N[[&)V7]6UA:+<197A9]#b8:eF[L=fFV71<^@Q8_FJN#7L?4A4:O
@9^]\\B4Zd[Q=6/P1-XE(BVQDM@Q\7a88VTLa,-g3##D?)X3L^RWDLVb6B+,7ONG
M.2fTEf\RbGZ_LN]R(+5>SgS\GOH/5f4Z@[^F1_]R/;e_KU2&dXX59:8PWG_27ed
/C.F1LZYe5DF+<e#4FK;fMBR=3-g&JM;QRU;B&V:]IbPbR=M_/K]NS:_;g+++B/H
UH?R_3=Q/^R)2+J02W4Q>?FU5=,g@Y6V??O)OF@.KJB=f1?:JI2PfXS4=:J^_8B7
ELZCCH\Q/WO:>DGg+,f[I@3LEWc=:/,JS#MLWaW+PQZ:KPd2/\H)1E)2&e[GOfXD
Q9;ZRMD+;Dc<OGPU,,Q8O^+c_+19-a=8Dd@5[Wd@^f<40[?/+ZCIHKF]IPA]KG^#
8>LI_E6Q\g]<GaW7JJS.4Y1\@OUNP\0H+4Z4UR(/6FU.)F?[(+^[<+8\FOe=&\4c
4Q/^dg1:AJH.,?aIOB??PY@3B-5RdYKKOCc8N;L3IMIB0.N6XGdF.7]PM>>3S95B
0K@JgZe4Y=-3?10dGc68??RZ>E5&)d)E_[Tc?B6^=GWS,Ta:Z394S]-XHH9Ue6DV
aZ/e:L;N&H1:ITA5NIC:L7\0TQ:P],.WT;2YE\A[M&@>NR.+B1W].6DegV1]UEb>
BT>=FL(II76UL&:Xe&3MF,,^9S8OFfU]A:f-R14>6YKY8B7K,.B.,^gSCD&Q4@PG
+S/FY\MGa,^JCGDHB/0240d;]gY7J0@JSZ3e.FfQ<<\26L#I_@\Kb+&C:CJ_g0?F
L:@I2@/dZA]S/\1?L1@)-6bWRNb-PMF-&S:XS/?c00=SH;1]FEdI)Pa5d4TVc>:[
S:IU:Y_,ddO;4.baK7BJ1^WJ>DBa9^5b_UY;J4V0A^HfKDf5LD-V@]<c+bQX:BTa
VI_BA25\.4^3.-gfBFV/C]aFF1BX:cFB6gN][#;dOKB6@RN=A[OUPL2dXI]U_5[Z
<-I3a0U2,&4&\[e>I@Q5RZT5<?:c()&eW\C33(#W?HeZLI:c]NYO>&Z)Q[\8G?>L
W1Tf:^/DL7>YdU&WNPAL.5&0.N;5:H7VL:#_D,cY3CeH+VG9\?g7=(LF^Y0C^/IT
bGVO6<?KS+[Q^bIeTg6:\Q70IY=-6D<\U2)HG-HP.1aVdZOaKd0W2ac9eg=96cAQ
U7EOSE4HVEeE(N,]0bWe=g,_gAe;96V6L1/8HMK=H2_H4D8CAPD#(6I4TS.A981:
SbI8UZ=)Y)_7GFZe2VMNeMS6N=Rg086(=0+C&3cI(e;6S^#F4?2f:cA[[8X>g<^c
P5I)VXbB/S4Ga3fCZUB@(DK)\SPNEZ+P,WU3L8_E,XG+,;E1LGTH4fOc0e:C2c7C
0H>GT],?>=0T/_.)_bT7E[)^>>Xg/G48CV\R6B_XP#NURXT0.;C5fOZf-LM9T_OO
ULVJ/ZT@>YWEQdU)1e@:&0+cFd,M8V;Bd<Z5KZ,;XV&459c?P3WL;LG(6[eMC<>G
f^gW^94E0?829BDW+>.;8CCe+H7@)TB=P2][R/&R+#1:+H0&0K@GR7KH/R;\=<JL
^g-KJTGQ&=&:5,<52SAHP90(YEZ+1L1S:]A5Q3]#G@U3,(GOa#_:/g83ag.RF/WN
9&CB_HRYdc&404=:3D,<UJZ+8/V2f(0:E6O;K15XIJXBa/C;HP\:4]Y51A:e,F6.
ga:/b<^FCQ?L)T_(_6>N89K>E+LefRJ0c5NJdZ9ScLFXT6,&OT#B1]\f8SOBbOV^
eS:EIFT/+g.0PK5bJS<&GRb+[;/MUeKabUbBeTN/(Ee/1.S9T@F@/Q3f&+KTMcU^
]>HQB;O33c&L,>a0b[?Vf&B49C<1>MEWHS\140-Nf/S[&^ff7fL:0)8Y8+=^_HC0
_d[WJFD0L1+NRd](W;^G3TeSa:?.XTC7)1Q[E#;)?4+a,W.+a\5&?MP+3_cY6OU7
ZCO<,VG_X<6adM497=F)UL/XM.4f,:FJ.Zgdgb.^CGG?4W^.@,</fEc8SMQW.TU@
,E(-ZWVF^9IY@Z-3/0fL)31&BC.Q>g5N1e6[L]\/;5<A\)fV]^<g]5[[</#/J+.A
STdE]T2E_?[HACW[U)8,?NYO/6aB:f(#Hb41RBWP.]:CIOO95T.,>fUIQF8B,AI.
.1>,Je^BHdHA/]BM^AEX.Ma_e]E>-+9#;5[18)9/VRXO(eFS^)H1)9Xg&SN1.(+=
1:N84c3YYX(6VYgQ.gDBa.Z_Z8-9]KMGFTAL,C:H(#:Wf:&I6?0VE71Q\gUc-28J
MB1=L&7BEU)]5L5Z((b\ZA8R8M3F,SC8XVP1G5P#-4/R\#M(fU,6-H]gc()9c7GS
dbOD3DZ)g<#T[\/g<EFHPB9J74V;<GP1VS_;HD.aGADWH9C#;,KG-Xg\+g<<Q<X\
A7;+_N1X-4F6(/,><-R,9=\Y@@.LF(dd57=ZNZY]-g\^G,_U38.L>d36(()1c4>^
gC3C=bJ=eT>g&;6)4X;R6P4:0(@?g7/64XaXS=Ka-)6]VYc7<>TUe)<-)):Ue3-@
OY3^CI;1>)0L;XX2=UAAd8>Y2IG^9GA&R9E3O(Ce)dPg^g+AIOV51aB97<Kd5[df
1SV8\FFTJI]Og#E,SdE1E]99^0S/#be#<&:ZG&.)4\4Z6;<&?7DX]?HM4]/G=1[[
Ab<.Jg5DZ#DDL&BI?F+,3-2(K^AA.f0(2)V?9f2\c1FJSJfIB#MA-B;Y8W48VNH:
LOPS3F^#/00VM9X0b/G2fQ?+S^L.fe#?\UYD8+3\V022<^0:G.H:G)(SR,^,VFe1
,;F=+:4UMQScd;L[B-]5\I=Y]3EcKgAd88\K,0WH>TSKdKNS<O4>PVY0P@cWf7G;
4A0E[R<gCJ-W\+7+0G.IW#8?BOU+734?;L1:V@cBU>+I;A_NMffe#MP^;d./Y=S(
0f4J)MYLg\R\bQ3c@>Z\1BMB(VJRQQSOK,d-2Pa/I)Jb6C_6LN?.&8^[N&_&IMa&
O54RaQ^e@-E8N&Z_A@O2(KEMBB^Wc+H&@;4:\U^N5NA,[#YVZKYDb>B54gc?/O4U
SJde#R\QJ?._S.VZ1^AZcS^5&fXa8Yb,IgDC@>\P<.M(-U0>K=1G5KNJcTK.Eb3J
PC#P4XVF\GAZFA\KaA,2I<:I.BcSc9]d?9XU+5O?CGU7,8F=CL#&;#/>VDO#Y3Sg
295&80+#UV#&;J;_/e8;=RQeF&A67>2AH;fFG_725\fTOF^/,U(OZ<V&M(Y_1>_f
P9;OKdL#fTb\/R6d[[<TV[^)9H@QbQNY1,;0T-S^CN4+4+LZO./f2Q,bID89-9WG
_EBAQBYL;(e/PHX]&^DLG6X4<^1Uef1_[^SSbRM=N1IW3bbG(J:0G6WW/<BMFX+0
a^I#@OAE.8d]Y[X),O,Vg34IbH5_Cff=@^A0<IMeO](<250:;=1,RL(]),U1U2++
B9P=3)I:BD-8B>g7QRXZF1V;3#\g[8eB9JH622?bDV7QL:X)7c8X:HaS[33+&8IX
gMG33^Z7/37=BVdFO8TBSH^d\I^/YL[UH=U4Y@7&<HDU]2#5RUf?#;4fHZZ</&^S
@1I(<\f[G\^?R_;]Od6YKI<SNB/b6<K-;B/0-YP?aRNF<?:ZeV2:KLZW5Oc+,HRg
XdZ:cD([GN0,7gf0M2-(>\VZT+d<KO:Q68YW=5\d3g8.],8&Z[2EO4_,^S4bPJ7b
-M@#eD),C\6MQYRb2H5PcGgIbBfD2W^g.]6?#c.A[+0W<\N2=C1,&G(^aIEfa^^B
DF_9&A9]E+X=TJ?c6NfV1:PPaQD@M@7ACD]XW(=N3SW.Ne:L;<59eG;.RV50IQgF
,,A+T<CA\@JQ&d,WFCULAM=C@?#@O9UOREHXX5]E4c;&RZcU_.2.6<^+bb=-M8#?
DafOJ74c=?<?RYQ>.AQd?X=e_>8#)A&S^&(I-S4W,.F=Q?\dY(g3ZS/)>K;-)<HC
;])aO@Y9d8R+T/S6faQ[DY(JVU+GETTKI;+V@g6@E6XPCC[\)7[7d6)L]DI.M;Ma
JJ[Y\G0.XT0=)Nb44fGJ+]=53.GfeHVPdWM_+)QOEHMN4:N2U1U;&D6K,HI^GO#\
8V34P@J/7HUfB(HR6[\QZ3Z7,XTB8O+=F@HR(4E4S<DY_F_bEJ#Z\DUGDR>8UM\U
5ZA.O@-7TZ<^?#b41V\Xbd_J<(CDe(T@cJJf&Nf[-:GL86HT0+HT,SB(MAe2K(G?
QZGL58NKF1@\@+@@=J5Q\Vbg71+dbZLc^Z4P+\-gA^(H#9gfG@>NM6EC^W3]S1b^
_d/4.+U/N-SJ5<OSKSO,Fd^0Y6I^MOD=Y.@58KIP_1RJVXfa:_gCf##SR,>JF^e5
NaQJSKBLUA?D@9NCF1JBc@I(:59>ba3NZELQT-)>8.H0713DeHTDLPT2c_[=Nc1\
^S?PEOALZbO^+OIPdM91X[(A[(c4>A)T?O^7S8PR]B/W1,VQfX.CL^.Jb4+f<2I:
TeDTSDYZ00F/MbB5dAeL(/I(bf-#Y;^:+0UBG@MffN[AQ;[S>J0-aSB2U95::a7U
<YP2/K8>:9C[f3IPL?]3)AZ#R>YFD9,D6,(9;?OG[Y)V8ae^gY8X#0Z&e8e[JO)a
)7_CZSANc_Q_YKY-JQALCW-^)YgVaSf8gUfU>@T^=K.)aKT0&OV=GOf)P5L58_6)
WU&MJaBKWR-b7)69J17HP;AIfe.7W4e?bR+T0aG,:Rg:J)Wc/_;Y?1G=\<[0G?+E
8P>2T>+d;0TR\OYZga^Jd><VCS-?P]_Z5LP]XYYAcVA<5&V6U1_;_&P;7I@0+XP;
XJH=b,CC#^6fFT=IJ9&MV5R&bZ7)S/TQ?M_KA>YRVHF7;acWfJTZKaQJ@9L?c_YL
07Cb)6L+X3:9c.)N/+)=[gW)LaXW-\<N/B3-,>I9\Y[8O\(#ecMSb)e055TN^:Rd
?U:W1CGIZ4O6S\T[ff?T/95H088Ke^[)OfC#H#?bT606SV;;(a2].#W-5=)H&bbb
?RYe0<3&gc[3EQ:,\H&;O7&O0);>ND<C[3Kf_J&3S+N:U2,0R-f_U.d:1b6:[,E>
@fObJZB>fD?S5eQ2A8B9)C+X,HF#-:fKae4gd/A424DG_Z=ARc3=74O@b;R5[DBc
C3N0HY)ALcVBQG]@,C([I6^1f3eg7-WMgX.-=WfT@^KcGf\FIBF9;,+14A7S,5\3
4<S^Z?d_-08d55(P(/ZHJ<;B+,KIRNQf3_1Ib#&)deH>75g@d5d0L+;HcBWbE(.b
HB>b)3C7BEOKdfVQ30Ua#fM_L1If?G@<e_9BVITcTa1HREOPbg)BSM3:g\M_d.LE
.cX--#84aJBeH]aXG.@]E#EYJb:e-DH2,eMH/>9=VY)a\59.Me1+e79T3X3A?B)]
@2Q3#._KGP0N>-7YC09##+cS4>Vg_E]6BGLZUL_7EE9PQ1a/>6:+&NB0,VededPA
<DV2/)@^N=>]+5KC=J[V4fa\F;_>PPO,DYR/B(8;W9UdK8]YZ0._3MTY-Y\.QcA]
.UB2Cg?f6bcEW@ZIWV#:JK[XP7#8C];?N.=):QIbX)8cKXJ8D6Y<G7R_HFCUY_FL
DBFA[/UP#&Wb+Q[SYb7F=]PVO7H^#W;U:^59DQ)La><J0KFD53?=E?HGdQ;H<VMW
^2]916cF0(IL:C0\PD86G@V\NNB.]U_U44V2=Y=N_MKE@T]JBCFHS=?F>\-.&IKX
DO0gZ[509W5;dJWNb#://6VLG+:P0CaL,L;??+eF51017JAX:CJQQ:Q;=@^96;DZ
P:^UI,FggJVY#f>6c<G#AGbSd0bO1ZdZ3Maf-XAPWTQU=Y/.1^B-3Yc+[1-/[VbB
=S4_MY2&@X3a(OSDNT7,LU\O+g.@LLBD_d].ba+EccTQZ>DP[cgWC.eDgf^\.@Dd
46TJ(NBWGE_9E,7d5?^X+<MUX+J;f?ODWcI&+PWMR(3C3,5Ua4U[5))OLZ:CaIE1
^+7)<TEf4G3=dB:2)E7@OK_::^Z74+P+YaeN0/?-:19+-8MNF9aJ[>7ggN6YaMg2
I0f8-HScSS)UfGecB2fDfTXa^G.2E^4I30J0b=Ba6)aPHWH)+E@-2:b;I\3GP;HM
R+ON,B7(eQR]/f^N7E#d)(KaV_2f2J6CH:Q?Q(KW/G#GD,=^1gXA=KYHA.4R58.G
Y/WJ+2^OD>+GYgOe1.041^gJ+:EOFECZB(7BSe2)f7Gc<S;JJQ.=J9>fDYRU@VfL
^d<GCdG^(L(+5>BW/a5bcg5CWO;6DR.Yf@YdT:),ZNY[GBb<&f/.Y/Yc#7F^5#^N
85CEM+SNMK;[_TNXaU-TR9G8=O4+@&.4N>&W:IR,QaC<E^9I^-8>75f)8U0?]Xcg
5Q?S_Pdg:78;9^I-3\9&-^FK\+7L1D&55cA.,HH.VC6]W)2TSg;]b08ME6E7NY-G
TXS,\E+2[?PZLSR&AdZZ=HHEK.b4YF<6U5?OX#(D&C.0008K6;/;^ST420,:@Bc,
UVW-W)1H\S)X;MW:\f.Cc#YH[B=5GFb3CPJR,&[PI#9E&XH<8#U/]SfZ<3g/2Y;4
J##Y<=^[N7&1WDg;S7HOO[3a)AgS2>D>NDF(R--Ma_IWcb9@H\MgG^dZ.)d[M/.N
EAYG@>\;AJ8:,4(AM\C6XdPa61T-X2<Y3LcP[KWOf?ZF/K(a#cM6[eLI_WHB?TfA
+S3HQRf_^9K5c(^E5KU7a.UfPLS@1OKSYU&YNV2^fYe/4&^E=KaOMOY&VgI&HNeK
UB<)6\M9WDW2e:C(-7D>3(B^4_R>8ZU,+0BK1T3<HF2^V.A242dGKc[AgC4f&@a5
)7KA3D90Z]dJ7RE5L)d(b,@K]YE?6?&F8Z3Mb\?e=8g-V8@FS=D6SITg&LI5BCKE
_Bc3MD>8,/+#c,P1R]=?T_MT7):[7;=KFd>O];7[]4BP7FU>78)Ga@;Ad<IPMN\F
,5f@E>UfgB<E]&>Wa;CNWLQ1PO&G=M[d(2D6PMNOR(ENAX4/RSe9@KBVc&-Y0#6g
Y#c3TKd\2-.b-#5L7J7ab;@\&Y=L&N:U@NKaX;[\224Q^=\>6=UN66f,;\7gbS_Q
OP;W]_Y5>b24NME6U,SYM[RY[(=Lg:@/1TE2cBcE77Z,Z=^-[](2eYcLFI]A(9F8
;AQ)gBK&Kf@>FO)KaPfA=V1>bd1D=F5[-dJa-;NLc@A/CPM40GVPE=bF-;_GP69=
#&CI#/ca[^,&[,6K[YZ-Gb0e<a3\J1G//NIMf^-f;+d]=5(f3ZX307JTT>B^6WV/
@ed\:7C]ATKNX-7##0[0_?@>SbB1gUG_2X?\R6c&WDe7J?D(DeTK&4aUQUWgP5JS
CS>FO.YW3V;@\Z;Mb+>07b:Le.]SAYP#^N3N6>,+E/K6_>d<Q4>RO,&8Qdg8c@]5
8P&RQJ86A8f#HI2@M:=]NHQ62LW5a3a++=1U9gHI3Bg1aaTg^a,SNa.C;O_CAUCK
W,19UG(]59SeZY92A.FVZ\QXU3H&U2I8J];#SL(fMf?RK+KD2T?Zb1RM0I/+Ka4@
c(.0^d2B(<(M.^@F+CdQX+2QVI6\YS9@C/]=D(9C)1&[(c39E(\-&@D]NQ-cb?.d
.Q5C;V[78@7B=4RN>PRc.1C7)/K\Q\7R_4;Bff&TUL?9VX.73Z7(+@84[8eM>RP;
V]f7U9b/Zc,P\:6>4.L:Ic/B@H2^eB&:g&Z]/;(Y\,W.R7NL+6ITDe5g/[A@1d0S
6YFOWW5;&3SJcIYeUR4D>>A3L.F<,(R9[:ec\)K518M+JRK7O(gbe5S]QQ[[?+BN
a>NHgC-B&;91fT@.P+4I]/0RGf/50QYE>c70]BLK:)Wd:X:[]47SS?OFg/_aIIfN
CAR6G;gE<52QPLIH&/eI>Tf:GF8e]L6eb+)P[/FO2+/a8+dNV0eT./BVSGY0L4;1
A=2a_P;eE1/=-LNc/b-P+GNOPg\R1FB8<X<D2be++IP^fQDUTB]Z_);P-W0=-=S#
5AX<1PZV^6)=UTS4NdPPP5W83.0+5^BeJ(>\(&P=9Z8eP3-3,P6gGcL<LW8dT.>L
E=P7S4:7fIA\ICD+^SM,C/VLXZc7R(_4gGE.6LLBAO1.a)QNE>\-BV-0OAE4O6CB
K0&8;LJ;@c0V<<H_H^FWf+RI,ZE(3^_S,g)RCN/358dORUXeI/7dT_bT;ZcLbXLa
I>S5e0g213<AR+A\I=f12Y@d\#EIC2Mc;3ZfFNT;(?IeE)eSP,&Re6,e]+&Q<ELH
bSUHUM9.De5O33</=(4BNF]f]R;V\H6<6[f-1bQP,P_HXV&1QMOJ?O/DZP,<Y01^
XAbNL3ATeb[(&6PJ4_J9Xd:;/+-EAg)T6M>We&eL7CYSY.>OY[VW?.)IKZG<RF-;
ATKa89BE>M5XCUZ4K+]2(=2K/b?O7X)C\XA0ReJb_Kg#^#2+-&,(3fAd.0+.dPPV
4?<W\+KaRPc98)IZ\]L:gd)X^S6-)c6aaEX&#Fc<1OSC#TGKgD.</_6cE3b5?d6b
9gHHOF8KO/V56G#,B/TZ<P^70-cF/M:0gb]@KY]C,C/TPMMR@bb&0+Ma@]MgAHa1
>KV)VSZD.fUSf()HfPJ0DBeOT1CV=J9<-&8Z/>(gLe)5e-KR._@&F^AOPP-6GF=g
7_g\H-<E@<&;X9eCM]NC-K])H_>8L;OUDWWcT)FRFNH;gS&FH-4efU^@LTHDVO:f
P309KeD[0ZgVbR>^6e,UX)0O7PAfUC4H,;==.1G;POX[RESALX=H1S>8NOH,f5S4
SR6.739-cL:UMNXA(6IbMJ873&J@^[5B6-BbE@9@dd#D?-/P2)&5&P9TQF)X2IKc
-e_Fdf74MO#&=Z?1gT>H2gQNe4ga=WAdY(=CD?ZY34K-[6N&EgVU,9#;&?TC97g+
AM1R:VP=gO(aFK,-ZDQg&G:gEY&4&<M-L=@b+U];Y22/N>7gJ5g&G,4)Bad\)Db]
LKC191(4H#FG5da^U;EeaeDTE#W<VQ)2&F42/CK5=Mg(cKc99<SM#(/D3,=fX(H^
,<c3.;]QAG=ZLRJG]8_.CgB.N\eSM)+c+))aSRXW/g10:LWN_M8DL^[R1#TOX1]a
\=U3,=Ta^C\)]H2XF0fCBM0PDH-HaF+_L-Vg<KG5,O@F[DD,RQ4&R=^X;d?a/3MW
>6:>;aWHK2][ZP_<b8,g]->0OI\,I]a3,51+I&Ea>DB\<P7&@cQ2La;[4.QDg^4e
bVbcW9TLQ:?1cKK0g#(5-?<]JV5A4;:=KLDc[RJRM>-B5GLY86(K:dA_cZCXJ<7&
(EXO.^3c?.L=1-9XSJT-TFGNXQ:^K32Gd_<Bf7C^:/T)3YdF1):c5#]4TeM+b0TP
(.LIVg7WV>=eR?4)YZ#BRE+4fPOV_H^>U#Y)SIWCfJ>faCa^LBEcMM1NX.OFFL[-
-AbU)8B&S;Ue2_5>+GX6gd0RGbe7&D1>#2W/4aYGA_bF^[ZW=E5WH[7d1Z,GZ#LW
b:G40AXU:HRPUF?WV>DA=(29eRNdbD?E06a2NCD1LLTMD)XHH->-2@/6BCa]S768
cEb6M+C)(_#U#AZVe.]c43QGY=^A49EF0.FMeI[;GJZ3CRF,0\<FR#0+B<&JU;J[
DB[<)OR19/3VCHL28aWPSF(gGRMX],^)@b5VK51#T613V#UALK1Z;-2PEH;g[?eW
T>ING)5fGU_+B.:ZZTIeSW7;+^0=BG3eI33_fL0Y=X(Pgce]A8T=1R)P7<67eEgY
TPd9GV#BN\RZUJReQFWLbg8E/IK^cA?Vgf6O=,[:Z7cM-AI4[??0]T5F,LaQK7bR
M.TS,&X0E=BP7eYM3>aR9NZB2DV=W-SC5[DaS>R-IOMG9[+>Z(7[K,#?W5F<HCPQ
I],6R;:Ga/+,Z[SO>8We9=ZB3$
`endprotected


`endif // GUARD_SVT_SPI_AGENT_SV
