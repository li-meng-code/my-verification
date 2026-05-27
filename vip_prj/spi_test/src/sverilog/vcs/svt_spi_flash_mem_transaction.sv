
`ifndef GUARD_SVT_SPI_FLASH_MEM_TRANSACTION_SV
`define GUARD_SVT_SPI_FLASH_MEM_TRANSACTION_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 * SPI Flash Memory Transaction.
 */
class svt_spi_flash_mem_transaction extends svt_mem_transaction;
  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Handle to configuration, available for use by constraints. */ 
  svt_spi_mem_configuration cfg = null;


  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_mem_transaction)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  //extern function new(vmm_log log = null,svt_spi_mem_configuration cfg);
  extern function new(vmm_log log = null,string suite_name="");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the transaction.
   */
  //extern function new(string name = "svt_spi_flash_mem_transaction",svt_spi_mem_configuration cfg);
  extern function new(string name = "svt_spi_flash_mem_transaction",string suite_name="svt_mem_transaction");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mem_transaction)
   // `svt_field_object(cfg, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_flash_mem_transaction)

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_mem_transaction.
   */
  extern virtual function vmm_data do_allocate();
`endif

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

`endif

  //----------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  // ---------------------------------------------------------------------------
  /**
   * Method used to obtain the physical address for a specific beat within a burst.
   *
   * @param burst_ix Desired beat within the burst.
   *
   * @return The physical address for the indicated burst_ix.
   */
  extern virtual function void get_phys_addr(int burst_ix, ref int unsigned phys_addr [`SVT_MEM_SA_CORE_PHYSICAL_DIMENSIONS_MAX]);

  extern virtual function svt_mem_addr_t calculate_phy_address(input svt_mem_addr_t addr, int hier_index);
  extern virtual function void set_cfg(svt_spi_mem_configuration cfg);

 // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_transaction)
  `vmm_class_factory(svt_spi_transaction)
`endif


endclass

// =============================================================================
`protected
>)AP)4TB1fX79I;),?GI5TF+PX;35Q6+M8^?FU,/eJC;1^:]0TM=-)6aUGL?Hg8]
Z@a\_1ad\.<8a-+Md>FNILX9TW1&#1_Ag:>_>ZKQH+<T1A56e581+BbXH_S-4\I,
LMJ\-RRQVXc<RD:_&dg,S@a/Og4[@Ob),gVO5LP1@+ZM<c3@INQ/WN([3g#K(PK@
/A\-HQLbO[\1gBG^S_bWK#2Y_R)Y5II0J((DPCF(?e8/WT]_4>3:A2N.&@YXYL_a
/77->Y,0Q/P.CHaMDM:7ZgLFK@SXO,V1RC62eHY7eRW#c4PZ:A=(AP8&=7BOB8,W
f&4Q_Kg\c4N-XdXTW-ca_[_aN:DZ<]&[fMc@LH(_F?dZYaBBTZ#&<T3=6L37Q<M/
E][SB:c_V63LgJ;T[AaRd[<-6N9+9SG6[T_AR/.T/06VHHb]a&3^J2;^AJ:Ve[6g
f3?_,D@_=Q#1CA.^:;.+W8(=5cXIM=([)#c([Af.@b)a[L9C4N/Y.:7&UNV\W5M&
S<g+Bc+M@.R0+#09_aTDP[&??_>G-AC5We2e7N6c(+MHA3Eb^9JB5MY.R3L<B]I>
P:]dH>Q0C,ZN2_KU)WefL].<CX\OfD:=,&?4R:89,3-GBN[TRQ]F?W3J#&2@IcRQ
#2WN:24DfBg_eSWZRS>e[,P,-G@?d<[),R:NaZ\ZUC[0=X.NQ0[-53SJK87cP0UK
;bSM5:-_T^4IZ_aS\KXJ[DOgg0S+U:?\gS\?f&PLL;6+2d2SKG]a1#E9gQ>A=gM?
($
`endprotected


//vcs_vip_protect
`protected
L)0SODMOX_B4OMK7.T.>4@_cb=/Q7cL_+[+CU2&R-g2ABS83aVbb/(,Q<^XX&4/N
fC2PbaLEKQ5);,>GVR2Z4/>^Y.2N899.g?,UA6bY#5:FK-2^L76&3bOaGKO)8ea/
Z?&6Z.76bH#A@27<<LD5&1QP/6B,[;K9-A+-O0QXZc-PX&M)E14e;7f09TNS98^9
<OCW1X:=&X;Qf?A;8X&L2>dYXAP?d4,;MML8YW87)NMM+ZS&6B\PS#?65X(cAO^_
VJNTd&Bf7[A;;cU3D[-Zb?&4JGZgBJNYAY+9bB3[H,&g]?T>\9eY483Ea6@1LeE>
14M&_PTBBb^[P7Z2bdX5f=M76bEYc7)-1+=69OC@HdYO1WS4.P-?R>Z]Z&J0Hg[7
GG:N]BM]C?<b^a[\&CZ[\Z5V3J9-^#De?U)Za&\&(Ea<1+?6KLf&#2(b:Qc+U4,J
O>(4HR1V3A:a;eaZWFE3AAg#;ELZ^>_]Df\f,[7K@c^RJE+0fJY<:2ZVOZ[c2H5>
&A?,de+7Kf69PX&UV38/\2RBb&SFT^R9Q:>1g1IGR[/B.>M1JUG#GRa9[F9b(DL;
?+^:8H[/Y/V?Z47Yg[N>\4fQdH\Q.g^EW7#F?a#:I6LA=^GVX#9B(+bVCB6VQ&^1
3D9#648GZ;[9O:RJITBPS=5,M(;::4_\U,;M-\O7,&<B^]V]5cQIa>bZ.>a@JNAI
KFdL5AO9a,Ie?+.:e8/8O&\H9CRb(;1/>aG4B3\d3:2VIE6(LP)(QU.5WG/DY:Dc
@P4?]X70HW8gC6W3Y@K/JFRabD+=7\Ac10;Q>S&^8:#O^VA&5-U;GX,A>RF+[UB.
H1@^gA8<CB][G4Sa^?GZFIT7OCT^<41#cPCbMK70/gg)I;\TMCCY&+7@2L8:N;--
0E_MY^1\XeV]Q52cY.EO0^&O1GX]#V(Q@\Y\c<=?+XJ]3[6C6f@Q1(09IBZQVB<g
IK&8)P0=OMf>SO?ZNK81O:+-A_2A0/a3@2YG)eN8:26d>@[)VY>E)bJ&e[C5Z?;.
HR;9PN[[\_@ZLQ-OKLI8H^Q,Q_)0JFCB3fg/c8^78I>K7;RaSI3H^^#1:fFa30b-
f.0V(Zd8B8B[1&?Mf4O6^.]PQ>\eFeOK[fAEdb=?<M>CIB2U^SJS=e2+5RYWW_BE
FfJ6/=DSCKUBH7_]IS_2;/[J+?LET\bS_^INF,TFVO/d68J@4)d=:10>X.c#](M>
dPUXg>Ub[[QM.EUSZ))Z2G6,E7M3V@W/5>\1KRdN;?T-H+=12f_g40-fJAb>VMC;
FDL.gY&^B#A^ZfVZ_O1\HQUYE&EAF3AD@@<&0=Hbd;3-3N];N(W@edS(f>\UMgd=
QIeFMbAND6#f/_VHcgO^WQc8L[?[g3MJM&?fX;4XeOA5[[XR-,UEb+=CR=;(@eM0
f#=U_eJD:cY,_Z4Q538/Y)54TW6Z=F/=)=S<0Z^b0FS4)Fe+H8@74@1/I,g_4G<H
T1Sf4X:8/-aF;<HW+U5,(B.FDK[KdOHKb1aCJ@?1D].EX6Pg8H>8-)TFGJ+eP@:+
][),)B\64eJM;375/_.@fAT-6d7DBa;[d\-^Xf_4F]J=.3]WZ/D,gf-e&AZ+NSMC
AV8[S)aGKYgN&.Y[U(a./.\?R^3U@-LAa0AfT^1K3I5/2Pe[S@AaB=@YQ(WTeWVS
<#;QMRXb665Yb-dQ9G\\QU_ZfNSHFIP<PVCLK.&UZYP]E(TZXYE_TOW,Z.(VU<19
9422ZeXH3f[6,g^UgU_H#X6Af+71V)e@,\Oc)f;gZK+7T.d8S_,GCaLFJ^0TO1&2
2ZC2[KI.(B3(W5>2&R+NeT3A&R&7b:]\PdcM>cL6)W6O[J=Z4\87ReE=C=H[XB?R
1?9\\R:fT]LI1fd3,X?EWA]#__deMXUIcTJc(&OF>=e?)F8gGg007F&SG2,AD4J;
<Z+\W)5acX2g7;75X?HV;1?>4Bd4Q[4SD1NQ2fa>K8QRMd;_WGHJ+\d41SF0_M/(
K:R5154f;X_C1GC&d6&(4K53VE\M]UVBgGIV,O6]&P@P5NH+33;P(WSF^,UP+\+9
B1R:3Y_5HI-6VX)N-<J?V;1-\fKcNF55IFPAGSB&).e_[,?>(Q]2/N.D(@J=4,D3
)+Z48=@W#6\JDWSR?N/^VRb],<-NQ08eM\O?KEcW8GX?-Z;@Nd3-aaD?,CeD@T(=
-Uf(_^]<a=&[PYC0_HA6_E[a&BT)\9P<+E/4b5IUT/WS^4M#e]X.g&<[<2IbP(J5
b\,9R;K1,b?Z7I\&,GK28/,7fNKI,@0P6_R,?7Q/)KT1UcCC^_931N3f41V?,H,K
[AD=6/#.WM;KEQ1Mf/J0O@]_+K1COS#eN<A74@/c(DS4;)TF<A7A^(\4T:8aNU=0
QVE@?=MgcS+1<NLNQ5+URJ_EQ@&IMKcb26YK(aJQ1?UF4J(:b_D@YT:FOYKX@US\
;)5Z^30UXQG,B\7N:Pc8NR]>g;1F)T_(XLF^fDU/>NDbF^b2UXV,/:Y#DaFLY&;X
JG+Qf+6&50X_O:GCP?Z)9CSd6gH)(8CdC[bG_MLcXaIUFSK<3\[8OT)A)-=SKTPZ
gb2CfZa(?+>)I?GP@>J.dI0CDDWcdPQ8[BdAE=^\dQFP1^O):_[LG7:[[f>R]&A6
PY392V\E)ADcdU>6gc5>VFg+6,C4LFUH]#G6R]7&I9]#g/ED4_=.PfOgKDaVE?+_
L7dN-I+-3/.\PZAE<=]fW#2L@+MEgZ55P&]5,07\VV.?ZTN?EQQFO(>FF^7Y4)0?
F;bg[KM7,94=P[(f9eWUeS:DH_IG-:H_U]+Rd0F/5+WY#+0ce#Vc@=R(AOVHgYK5
+ARWDWee4a2Y090/B7HYSdaAYL+23L^NN,.OE8T\gf/)RFE4dL-#bG),#38CT#NJ
[eNbT_TP8L<3ZHdZ)JRJ]]8FJCXW6UT<e#T&GW@U+VGL=REG#Q0?-RD20ebZZY7I
gFGBORWP\MAS8/aHY.;5UEf7Y].KQMaJ#=O8G?c/9_dRR:J8+QJ@]F>]D@-\\.c#
153,L<?_(MbD7U-faA)9GI#PQd\29XJ7\XdB\ZA=&?YgKF-PMJ1.4]_UBW#4O8LX
^-La2YG&9)U<Z(fa,b]DM>Z=PX7^#eDU>0KV:[?fXC2G8A3-=A.DR;<ccY<0SU7E
R8M.+E:W)g.cM?-<PCfdX7H=Ff3<:7cbN/PPD\e84BRE)[?Y=G;L6;AR7[\ONO3(
CZ9.a;a8=()?[9F2(HQD8T,O-?Q[-Y6C)]:b?1_,\Y4A2W)7Q_1?Q?6JYQL([>=K
-dU2;;aRXaJ06.,8CN6]&NHYTV5g+5Mb4WPTCcU9Qcf1J2egYG^;8W@).b(PM),-
<;2>X^C1K-a:?6VKT_\I1M0Be,,a&I.BFGR7P_Xf\Q3+EE2QWc2W<0N:@BB_a,@G
Y]WcA.+3,+F2&C:SBYOV+FJf_cT[--S^@7ZP98T;DDVFbe0K5(B)<&=+D:&^5L>W
;ZY<dg8(N#_7BH+0_#C33FN6##4G,b3],?(MbV:&TX[/K#6Y)[/2K)cHRPJ?H74V
T@.9S(?RV.KBO04M52P(0::?VUA9bP<(SF:.FD_7c20MS>:SR]FJ8\ZO-eb4>cMM
K.,76,-7&;-L@7C6P5PJ./SB?^D8aF)6,PSXOIURaLdJ7dK@F0/#\LC>I^<S9Z8@
;#f@FPK^>[4Z=QJ_R__L.<;&\\WOKSae=79-RQ-KD@I2gO<>a3;>[K?.56cNDL,D
OJAd4F^VW4DMa=XRX4SH>HZ&9,ZNC/.aW<6:_Y]JV\fZJ2c(QJ;g<.3TfF#g5HD5
<28.J=U_aU]1=5UXS\7+)RY_<bJ9fA5K].3ITWJ]P7_+OFWKF[2&1ceDIB0W928V
DbR/T[09eY:D;He)VbBDLPc[&>Y7+S(=F-c,ec?RQP&ZCZAC#Q0<#V\7Jf=gS,M>
/3CXY8HB=/;aE<T00B+GV&+ac63=E0..;_)DfZ[R1B_<N/P2:O(L5Y>=[-TOaXH4
UE93Y684E2g(G:d4HU88>5ECC3OEE#P:f_;Xb9Pa.RNVTXaYLCL@\9N(NDX\2BY1
TGP)A2c,9Y\L?d[FJW(>G6PP:-IbJ\;0X73dWBA<RP0&,B>AUf)3#QJ9K\PI[eFO
WOAg2fW@,-d/POf_TV39f2+@+dG6GPL?;P&Fc2>+^E0/=<I@@=NQ;dag&db\L4CP
7PY(B/BNRQfW,gKSX?#;-QfYE.)Q3H[TB]J:I_:I#QG7MXJ/FX9fSU4I:Ye_2J]=
?J+8b<WO+#&5L9#2HKK@L[+/:/F^c6&M,H4E9J2B;I#()-F&?<,ADc^C50(][0#a
GG_be35LT(UVWg>&=\XR&JDGKD9F.\ac<c>3Wb\FdF=e5ZR6P1IG=fL/5P9J2@KP
O&D#NP3;XC->X&(^=6-B7JIGJ?ZQY.8?F9+IP7)LBbY_bgH_,7PL7V0;/g<E76a+
CA(I;M:6_R/a?]QQS\1?H[_3\69(^_#)3,^E7UDT]cXFQQ(NQOBg(NNIMKP<36\.
d(R0Q\[Ed+;3<PQ)X03.&HHK8=RU-FgDYI;&Ke.V/1LQV1\I>L);+;,.f8/7afRV
)<3A6<L(.g+T6@7;,&,ggT\C74?a(B=Y7Z#=3/-(V835b(F^6QNF,2-R\MQC>P[N
fF[^X4D-4[>F)U38CR;Z-YC[U0?W+_Z?FZ\:cT(KU7_#MF?5EJ8&(W9M(MG5TNRK
,cV^e:3JH5NOc1GXZ8C@P0=OMVZ2WW?OM[YeQ2Q>P#8T:;])6>aHV>MU](WXY.P>
W.EVW8UL=5<9Y,-;)6]E-<#)X)#_OD<Q_F@F?f=+,0Zf2>.;K,3_A]QRMfD,@L_S
F.CQE,4)>]LS2G?V@7<(,<EO.P:2\)WA\KU3R/9R-18&:E]<@I(.RC+b:7g]4d7U
&+)>bN/;WK35:5X&ZdE(@7K/@R0&+OS&Y.N]05;D_.4A3W-JU]S;PU1)SH)XVA6E
@\.c6+>00N[a6#MY4K;AZZ<AB(LSY.U5eJ:7:GZO\CWU,LB.E1<8-VP_)ge[]LNJ
_OVBZQWMMf6Lc(&QI9U,baTSc)DIO7\^beG\RGSe;/^V3Q&;cTD-I^R&Ab;26DV>
Y7(+3WWgfRYbffPd^BOTG6D9(0gA9<V_eG?ALT]W@@6e_>S/>T9a9L9>2_O=C;4K
.P;Y2VdBG(B59T6V7XQ,>8@+Zd:=\@0BVaS+N)fNM\219R:(EKbcVV3Z0S7IM<d)
ZBL,1YfE&(+b2#13QeO;2bIVJ:I[P5^62g\CG6?&99Z#((X<^_0f?;2_G7X&(9?3
AH[4We>dFMCdO+_SPfBaJP?a>gC^=ZN;>7)A2Aa?TD\3HWHbO3VRV\Z,^6PGTJ-O
8MPGYIO(<S6Dc@^RQ:_EC?70ATR3FN=]gd-AF=2<ET1Mb_NRO[-VBO:HIC;K2c1U
H\2Fe3];[/bN1>Lf;UM4>@T]QZ_^,U3G7;eb2?f5K0L[I.0.WLMI&:#9-]T]E\?U
Wa/^V,_4G_K:+SW9#45./7_)e;-,]IA>gS:1>CJE=FP)7&USTD119a\bE&FYOC.9
:<QS6J(<.c2]77+a.c\aJEf1eIc>.T?\,;AJCHM,]7D/Q_SQ@TM#cF:VJGK]Q&VH
^gPEP]MX<]Q(69VK]AN-8;+)6=70>+2WV>Lc:ZE;\P,e7:MD5:@-Q8W(S]be0,-7
0d3Ze;5+ed[^AF:GWRO.Nf2baDIQYCIWTTQ,bW(7B?RL+)+cXc=+MT>a.Ebb,;_0
3?Q):dO\V(/?@AZe?=aF,6<?U6eRV^OO/]^Eg^c@OC1LH09b6[A5V,OJIYb1_g\Q
KLcB3_BVbOGZFJ++0:?>S0F[]R_K5UO&__D:QBGf--bQF&YV:^[=g=P62P1c)DT3
8?]A7]YGg6_:+ddT7CX^V-2Af7;.1++Z0g,L#<Cd/dg1b;d4FMT/Z+Z491Rd\L;/
KfK#,_B/N0#5gS&fY^;+6U2A8$
`endprotected

`endif // GUARD_SVT_SPI_FLASH_MEM_TRANSACTION_SV
