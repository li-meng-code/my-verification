
`ifndef GUARD_SVT_SPI_TRANSACTION_EXCEPTION_LIST_SV
`define GUARD_SVT_SPI_TRANSACTION_EXCEPTION_LIST_SV

typedef class svt_spi_transaction;
typedef class svt_spi_transaction_exception;

//----------------------------------------------------------------------------
// Local Constants
//----------------------------------------------------------------------------

`ifndef SVT_SPI_TRANSACTION_EXCEPTION_LIST_MAX_NUM_EXCEPTIONS
/**
 * This value is used by the svt_spi_transaction_exception_list constructor
 * to define the initial value for svt_exception_list::max_num_exceptions.
 * This field is used by the exception list to define the maximum number of
 * exceptions which can be generated for a single transaction. The user
 * testbench can override this constant value to define a different maximum
 * value for use by all svt_spi_transaction_exception_list instances or
 * can change the value of the svt_exception_list::max_num_exceptions field
 * directly to define a different maximum value for use by that
 * svt_spi_transaction_exception_list instance.
 */
`define SVT_SPI_TRANSACTION_EXCEPTION_LIST_MAX_NUM_EXCEPTIONS   1
`endif

// =============================================================================
/**
 * This class contains details about the spi svt_spi_transaction_exception_list exception list.
 */
class svt_spi_transaction_exception_list extends svt_exception_list#(svt_spi_transaction_exception);

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_transaction_exception_list)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception list instance, passing the appropriate argument
   * values to the <b>svt_exception_list</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   * @param randomized_exception Sets the randomized exception used to generate exceptions during randomization.
   */
  extern function new(vmm_log log = null, svt_spi_transaction_exception randomized_exception = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception list instance, passing the appropriate argument
   * values to the <b>svt_exception_list</b> parent class.
   *
   * @param name Instance name of the instance
   */
  extern function new(string name = "svt_spi_transaction_exception_list", svt_spi_transaction_exception randomized_exception = null);
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_transaction_exception_list)
  `svt_data_member_end(svt_spi_transaction_exception_list)

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_transaction_exception_list.
   */
  extern virtual function vmm_data do_allocate();
`endif

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. Both values result
   * in a COMPLETE compare.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Does basic validation of the object contents. Only supported kind values are -1 and
   * `SVT_DATA_TYPE::COMPLETE. Both values result in a COMPLETE validity check.
   */
  extern virtual function bit do_is_valid(bit silent = 1, int kind = -1);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. Only supports
   * COMPLETE pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned byte_size(int kind = -1);
  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset. Only supports COMPLETE pack so
   * kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);
  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset. Only supports COMPLETE unpack so
   * kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  //----------------------------------------------------------------------------
  /**
   * Pushes the configuration and transaction into the randomized exception object.
   */
  extern virtual function void setup_randomized_exception(svt_spi_configuration cfg, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** 
   * The svt_proto_transaction_exception class contains a reference, xact, to the transaction the exception is for.  The
   * exception_list copy leaves xact pointing to the 'original' data, not the copied into data.  This function
   * adjusts the xact reference in any data exceptions present. 
   *  
   * @param new_inst The svt_proto_transaction that this exception is associated with.
   */ 
  extern function void adjust_xact_reference(svt_spi_transaction new_inst);
  
  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_transaction_exception_list)
  `vmm_class_factory(svt_spi_transaction_exception_list)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
=1eTDEFPQ[N[&>_:8b[Kc4b;[2/@7SE5RSEbL1EVfcG5CY6K3@3F1)c<(S^.B6)g
eJc6E-ER>c,S))_UBI/aRV(OK#UJ<ZD^I7;@5Pf8^&a(Y=A^_9/],\8d=Z#87<5\
d7]M0=JgGX-//=F4G^7UVKOP=:Z@OL;>bM[d0H7+4SR(M-2d9.[-CA67c>L<D(9a
3TQ]5]/)27FF&2&AI,PHN]FDVZ[FA0LX1]1bR0Q/5#9c<H8Ge0W[H4HY#G2G_dG7
WMd7Y/LFF^.B@_DY[\ef\C6-1<DW;&a&58P5a2<f.FFZdJE)?8V=M6GB^0?3G-d\
AS<DD:Y7[5H[#<0aW?.]_<A6+H[+S>6HQ[J.IU&20Ye9gFg[U04U=24ccKP)B-8B
8@QXC+7.W:(MP&I?S+DJ/b+Z4A?8^7PMP&U86?&_cUCC-.XRafJLEb6GHMA;3\fF
\b8J16;T)2M_WULDX>N#:&@Y0@US+I6^Q;)d9_SeZ7Ae;(.)6Y23ccgg42/+G&75
45<+-HV8,63CLY(#JbH\Zc7ZD43<OIU]=N?,)HB,5ILG?d4DeH-.RU<MQ:1L9:#1
I_XJG45CU&UATDOS#:f4_4F@K,8Rg^;4bZ(\d7KH6\-.SbN4RET1K3Q]K8CSV2dg
5ea7XSBOOJ=@3-,N0gI5=B<EY4T339Y_UZ=e&C;^(7b]<VB+1WI#FW6>=+@XRWdD
)YIP-7-MbIMR6I(GGKAa3/:aTG^HP=RBMEKJc9LA-@ECV(WbC;OQ7&.d5d+FT4AQ
9^+gE#24NNU\-KVZ:SR/SM]<S0?AGU:HH2@gV<,Xfg>aO70+7c<PF9&35H-c.3,H
bQRfOR]QI.WB28)LXLK,5:UJH:8?KY>eM9+8c///cPP_=2BDDe_]c;]QM1QI?JJ2
>4DQgSBB<#4NB><U_/3[1;HZ@PZ@(7([X//b/JKFKR,c_U;&]LGEGW/&,fdS=YP-
Hb#J,7R.M,9Q=bI8.GV:LU18MSNb_cA)&4f_)dXef)>_QH#4f3dBIb?.:8EFgV+a
+cRKJ+-XTKX5[9U_AI4MP=F9EaX9Pf8UO<6UWDQdBaEQNG;(eYNTSdbc?QW.E\Q9
#@=QP+Z^?9R.ZY,_:\B+D<\A6g8&,3R&@Q[9c=G.,@O\>Q&:D0.ZP6[DN#9Q,BX5
_YPbEUb.X&P4I(YIQbS:1&Rff[b)/C8f)Wg06c.=?WR=D[_Zg[CJ==FSHDM+8W^I
HJ4UDI:-4F^4,$
`endprotected


//vcs_vip_protect
`protected
^@ACcaZSX71gJ(QCPVLBRF0>#XVeW4.#FGYU@LfWRJ[f#[LD1bJ>&(F#]J4D?cQL
/[CNZD\7^f78YJ@8/F)H?.[0(CRO/?FfF,<A<9E0E)<@Wa/f>Rc4YO0K89_IYXOc
/K^SCS[CDV3XOg=M#Re#6-<Ia1J13JV45+F,Na5SC,3PO@3:f.2REAGUA262IMbe
6_EP=NC[/N1XEEEeT@>gg=g.E7(WLd2<X3a3cL7-12.1./1LUE)C&E?N]AU[1;.C
X?N_c;4U]bLe)+?CZ@D6YV#KG8+TSI#I@#b]CG:AIJ@_<-c5;Z^QDg\;.fb7O4B7
K-]5YHUfN/GLFZCG#S?1H2Q3gI9F0(U0]BbN,.0M13LR;O=9G8IcUH/TdcX&/YN9
(COD&\4-2AMaf^4NY@VJ/K5U5)]H\HCG4KN#:&Je#VgEQ<MgN>F<<^UUD>Bd\].B
df1UZ)<\D6^K)Y>XO3P8SU3&Ba5#M0S:3].-JUd(U3QTCJFYbbVYAUEK6bYBPPH5
_\\bCO\gE1-FR?ZW/,=/6/-BfJ50Q>)>_\6Yb]P0a@EVTf?PJ^A_>>d.)HYfMRJ0
_C>Kg[/J@,bF6T.KFA/Zb8c\=(1c,G--Pe7I2K^PM)5L:I=267.Q2\U,IU((\>c0
3I&KJK7g[2+K-UR2G,JI?IV7aCP<DdOZ?VO[1-4EERTdS6b@Y/Y&-(>NPP8P/J3@
fC]K#bL<1Vaa?WJ@:/]VBO#[:f\H:Y=5D2fTfGQ86^,<Z\[=_2C.TJa7-L=Yc=K)
?CX\c4Y2L&A[K1G>1HH[;fHO#>Xc8.e7S?P/QNB#IU>>YN9]06cKJ)F4cUQ[17TE
D:YeUT2183P>V<N0=ac@\?<_eW7,/XTT^3M5(1#JMVd]LZ;F@DcS&G&ZdP)(ZAWX
.E\ffD9Q:&b0=07,GJgXV^8M1007HS7M6?.A\PXCM29a/]V?C>+F#_6>T70-_T/@
9df@4=F9SgTe)AN;0A2dH5T4@0=CPTJCX^X.Q9,a^KY4QQNH(9.YP<3\<;/FGA0L
=+8I.4BO:XMOG5(.7@2((MDO?S^KOW@P>MCIMc^?EW45LdW&;@eO6d/J/1Ucag1d
QCYf3P)_9Q)2eQ:XR&d;V03c7Z<gTROYFK3\TaH&B1K6@N69)JJ8T.XfM2QZ+OF@
&V86=R4=JO(H_.=Gf0.a5XgMc>K<&(U)S9)LXEJ#cMB>f-7-@&[DeC]+cM<4V#M/
L<,^.<<4GX<U\MGHJe=S&5@?XZVM7\3>+gWK><)52XJ=JCM#3M9@VG1B_:6Y7FF=
#1),>.<\<eG/T0<5M9d><267CX^4d<f>WYQ>;/Zd(@>BW-2cWg:d(JOa3<\FcG>A
-.WYP=4C[WK/RQ[B4.V[XA0+b,CHb7Wb+RYgMdE9\(#g>RdU<9U)>Q26H)H(..8M
8)/4NAF_VeG4dE09Gc1UIYc+EN4KS@bLK:IQ0U_^=0;8XF#Ke;TbTOEJf9#eR-,>
M.HQZF/@Ea^04[ZLI17D<VWQ20>LaSbfOY8AaMG(+).fZR#=;QA;=#^]Z\c6TMWK
9bcA;MZPScL1QI87IQQ;P30#O44B30):SWRSHEPX=M>/BG+=O<U?d-dK^K2+8P,C
6_Q6MM(f&Z_KOSe]W0SdfMe,1E&Y:]bY?()<(#c_gB-E\9K_NRP+aAbT9FMINZQ&
RK((#-a;>OTTW+,6+=67Ma#cHGX5<I;>S92+[=[&OdI^C2\B(Wf1(.0/=\^f1]7M
&fHaN-bWZYZAI6b9L;E]FAY0..,-7(fE\@9EK&S;=B@]&bf&.3II]X-L#W@F@^4L
.LALGfJB;QT>E4;G_8WS9c823OQYZWLD^g#98P.O:Xg9/K1\^CF(V2(OC\XV\SQK
+a;3SQbcdZEKMV16VNWF[FKZBT55_Cb8@@S>^8#W=5a\bc/_;9N.3\UGKNKHG0N8
)+N1:W1B^5@d5EV]:5H.6UL1d5#MXL(=1&9K3-fJ[[J-/<fXELJ,)agZ+f.4<&eX
JU_bB+IRO)DHV[)<E:LH,3O&g8G(fNg;:51.M6]>0;Ee&1M;P(DVM7_I^Q0fGI74
J=-<U-30?bg7dW9aV6]FB6#YK>b:H64[=H.Yb@+[G_@4=DeAN9EB?BW.]K<0O;8N
=;1K5<#O02#fF=M_0G17(&I-.2fDU[7DLL>_H.gD[#Z4WSI>@WYbDbKI.>NC3U6W
YJMZ0N.N:6L#/92gXW6;bHD3d7^2^6G<B:+)Z7d+S^/MC)8=S6-J[QNQ?DL/58:X
1/H>+CE7]-?T6FaTV,dFd;#L5G5V1X_\9Ze+:cNJX4Y6N?PeA+)FEf@+CD#(RLIP
>G02##@d=7AYQDU^SR9VB;LP5FX#S^H>;F53R4Ob>G&U+).QY-PM2N:7c3NT:F-G
D3\g08-@OWH7=JPK<g[M,5ZP<ZaQ[-9L.5Ua20D/]eN:;BVM@(UdbJ4Y61)0N9UF
&[?;\b??O:]3QH]g,Y:9SRM6?&GF)dO>-U&<D8LNKf9H=IgXdSGBZ_/9]\EPUGA/
G\M6T)^T3RcaIC>,B)U6B6<O5SS6VFUFEP&\.,-U)4Q7=:5T._3LCPBdaLDE6YDV
cJ3X)]S02Ta&HaQQW8.b.#7#[(5&:e>:6@MK<;08?_g:@Da[DC_F)]UV:d8cdO&>
L-5;EA(^/3BM_QXTANM7gP\f_4]NM=E+XR4C]G+-0@aAL0g6>_M^MF<L8eQ/P0K1
0WgJV@RC-WW=B?;HWZK[P5>Iba=0KE-#aX\:_KG5.e>YRRZ0A^RA]:0P>I/G?0IN
2EBKCAaVO^_AK2)Vd57D4_F):C4F?FWW@ffW,CgTE;GZ1S7,79+gVVHOL;c+=_LO
WK2Z509JG<YF2@?8=.IB]L[E_NcOVf2(&+3G6;-5eN:OXL;>PLXdf;0CYL._cVR(
.A^YB<N>5UIb7R;F8,.[cG,3)+2]2?HBfEK:&QVKC,\A84O^;SUgLgT<@#3WQ#+_
J\52J3OM+V5bN#af#P93B4(-BBU+?B/(5I2(9eR;2VXBb]?./^Td8[g)^_S:?BLg
bUdeTU&V]=2WTOUV@3C>g4@VGF8,_CBcE)^O4Xc?)#:KOA3>A]W_24TDBD?f2NYP
dIA>(L>CN<H(=3\X5./OZK-MYV\9=<aJ+1#SC??c5Vg2.9BN^S;WKSS^C=?WKQ1<
LU]9#37WV6>TOSYQQ4CaOWe@)4U1B/OCX?<.D+1NZ/OG@9(<?&bI()+BY]fH_PD=
fedXe;M1=9HO-^@M,dE.a,#C:3@&[:bG9]EYEA(f>c\L>J.LK^;>Q+>c=1R_H<a3
b)LI?;cJ3R,.0e,SJ2,>E0>[J(WQe+b?89/(J@\)cX#Z.>d8AD9R#93K:eabG/33
f;[e2Td>H.(e>Qg9L>;6b9:(S(D59LgRFg]5eY[&RONQKd@YI,d&P]([9#0,H&Y[
MFe[PI?YTcR37U8TdE6GD63d>U4[F,4-?Z/55fe^341>U#F=M9V0fMB8DV2g<b<+
G&aXN.]2YILWB4>WO#YHXJ/Gd,FbBMAF&K<FXgW\7:AYPQEg)g<11cTbBB?dKE>@
8TgA.20fML&?@I(&eNdX@8e[@GP[SWLg2Z1eVdZYDVO:;[#CPPU>+B&-2Kg]g)N5
7D&O_LF^HL[d6b\L&\:AgbQ<_>;&[SbRJ4OO7SA<G6:Uf&gf&OH;)bG;TQ3#J/KV
KRaPRDc]XgAC9SYcPKY5H_(:3Pg.W3>4+Y.-A3EVb0<?D,Ye==.eXBUJea?LQ?@T
_U_NT&Rg0PY4HZ9HN5<e+?7?^-J7/#/Db;Q6W0bXcF)HJ0]T1e.IM(Y+05d+KPHP
fYTV9MXW8[-+GeS3e>+\bY^4/V;Xe5\A>U)L(0-525GRMePIJ8dCe<d0\6NC62</
AD@)9a[.L.&(g]+SN0)[0F(KM>UA8/dPA86+0/#,QYQT5O555WdE_>TRE>\-V>DI
g+?b94IO0):SF\_0S9_RYOQ\g[T,+\IZc\WLJ2&.ANZEIEe^<[TG5J<dT/_E;)=;
_0-.#V7D+4YE1ZQNATe(\;,<]/bg(HQRP(_K<8EeVA.WWHV<fGE5gG4:BeH9HFDN
VW?YEgK9-K9.3>/JG\<\G-GYfE:]J27GH\4MP#C,a0W+]OGJE?]4W@Jg&_KN<8GO
3]+->aFQ(1)S2O)7[O\1P5OZE]@7=E]ZS@bO&1LZbBa/C(&#@?-]M?dS#;NQ/\Eg
@&Wa,H>Ke^IVSIXD_/I#V=5=&PZb?,/\@4\41XbcH?@Qbf;:d:@:85_7QHcN>XDB
LRDgI766OOGeG\SFCO+H(TV+5C+@2L[(g>b_O4=d>Z3N[[A)1R979JTM[C[Le:VL
(OJ\fa_9T(CR9#b<X_;1(SX._[KXJJ,=KgI()Y?;HK]LP9c#:_f0f7#OJXOc\U1K
d,-6MAd.Dc(4X0c-?9WE]QUIdXGZ/SBOQ@cL-2&gNeNSbBaANF&A,S46E_=9ScXf
bdfQ_JFX@B03XFbV,F<,_BFCP@e,NYRd5Z-cg6<(bA/3Cg()dVV1bcf+ENaL>4(E
cc1cU/8b:Q=8Nc@5Dfd0>Y\e&>MOe<d[;D7QGB,Re.\4Ug/J&S3e7\W3c)TW/S6Y
I7T^+G60=,@BLEY0EB:R?@_E3fNe_9TdKF0ZU<V+P>g:d.UBOTS>fg^=f\IYC3<R
=7UK&V0CbEA11>3dg,1).e76\E9/X+L+QEZ3Ec0A6V5))P_:DT41&_,dZ^RYbV#/
7,CP3,7W6^],eS8DNQQ>?Wf#RDJTQCK&cYSeS[[PT7PIZL:?[H(^N5/1<J[+^16#
_[A.a?-a/)?F._0X/PHSJb3:7U@K9<(5QY+\+7;U&[=W#.E7;D[OIX-/-\-CU6H@
>4[_7,c,J)T1;:_\BD;,f-+,fJ[JI4XUXSA5J#<Z_&PE/gd^FgL+A\\dF1HT8#F&
X)5>PHP>1/.AA-CK/e>Z#167UUJ][.8>4>OSO?>>YMM+;61-=8A.P.R_L@b=Q]?I
,1M>ZS3QH@R]\3We;1?eSLAD<>66<E.OD1),IZ8;eY+MO.JFe__\L^2OIC,CJPa&
ZO7>K]&LWUX2X+S@8]ReDLNFb>Q0VP11e<1MQc@71a(N30J_-,a]UDHbWA0Sb7XL
T)+cXHU38F==ZfBX(Y:<QH>XN2]\FY)@,1eUX71Mc?)Rc#W^](.L,9XcdZM?)6C/
\NHLg^e+L5-Q4[B(98<#,IJE9]R-ZA,GF8D4<9fKKAJGV8>]1JJ65(77GM]f;9_]
gQ[Xg:KV/.LZXBD:&cbKEW.6@a8Sa5N\L^/Y,R/7b5cB#f8CMD??5RLDFVJ[F_F#
=d]R47[.[O&:da/0g3V._>F#4Qd5S_+fM-Q17L^A1d92c;JMDVPF?S@]]+f)Y27A
aa&U;?8-aXQ]<D0ON1:1/&\MJ3a#CJOffA>P,&BaN?6(V,Jf9G=3#cV@-dI05<R#
NCTABa4J1JIab(+VZH_6O&6QaL0H^/9</PGcM+@gSET=1)M7:EcO-\1Nba@E9fF;
)gY#(19>#KLBI=bI-/#E@YPJ.TW]/9SL1e/C>=^9.bMf0)441S1V+@MKGY(6Sa#)
N-5ea[3D/>C+19^7)30,RPdN?gBT(Hda3-1c0N1V2UaG9-aKY6\Kd#&RIBc8eJV_
I^/#DQUMLdR#9V.5g>)3g&@3A_]ge))B7_<?QUGA,,Oa1b:/L@R.=01M&d]?5T8L
IO1&CYDeGZQZO:?SCB<(X?321M-M86=\I-d#,I]AA-[JDDbDc+d1_OS-:e:gLNF;
,HDA5[;8Qa:9^369LQ+74&.d\U?C(8Cd<[(OS0-(=a:@<EH+(07eB]B;[K9KR.F]
_Rc3@L>>_F><OD(c]JCK8RU36:AHC?6G?6+3cIb(K<WeB9)O3aF267,c@S?IcCP)
0&)I,+BbdO;bI]fa+Rc.-5Xe5IG>g_CeSdLS7\c346.dc2IS?9:g6@B_fJ]GE8.Y
(1ERJdG?1Nc)GMJ_[4X4?(Z0gW2_X@D@),XWXaAD-)DdD;_LF/Bd=>DV:P2FEF3-
UWNV>PPV:-<,7L5<RM/8V5Z..F\63SbD[bVIT6K.1\@Q?c1B]I\&4(T+<A\.^_.T
gP45KXBbD&S0B_ZeMRF77KHG;c;\@+0O7AdI-bF=.C#A^ZOUb/0-CPd-IVUPb]Ag
YCPGZb<T#[LY#ASZ1UTA0d)7I:&@gI4D)=GK&[ME)5>>Q2^.K<GCH:,PT=Egd5B3
3b;IS4beXYTe#;PYU<@JR\6RFb<J\A-\HNHU)UZWQ\R1VF;^Q58a9Qg8IED1+E_/
Gf(832E]TXG3f0:c^FBe_QAUTKVa.DDPS[1P\GET;aKKNQSeN;g0H+6K@P-c&dNC
7R=F[[d>>;]CA)_W_0<7)R?c6,R]4RD]VbcbAP1L\+B:@U]V3\9-/gVIeM?=?SMe
c9fg3SIB]F/fa4OEU?Lf/O+[g\QPPHSY>EGf.2UGf\[^YDI)77/5gMZ]a#b^=G?5
OG/YD]/K1N=&_LI0^f+GBJ837,?V8LMbLC42?Q/&],&DJK^9WU+<cfU3N:MVNd#P
bYT:C+]RU<]f1EOe4ACGATZ]AN&1c>a6ZF[1[PXQJa)aKfSH5TF_;KR+8.B7Z-J0
f.&<KBUcAS[c0;73J1NUa1?<[2cT6?TT.;@BWIQ2O&<IR;1R,U,3)WZagd^Pa<NY
.W#0X+8P1?_ULeV-AB1Da4T]@R]5JfP,eB1_e217.PKLS,]c0Z-Q]Tgb89EcK&L:
([SP:_R,IDFG7QML80@DJNdYNT7?1+/D-1GB\L]b@U1W:(YLcYS0?7BAcGVL]LWB
RFG00/)+d#KR(?,fD[]9Y>:)=6Ua?/f\f)TI0;?e+A==c=]]AgPO8,-bLEIF5GI(
+Xf<;R#Pa6MLKbe\U@^WA;,#?A)]R&@@J+b#dHA.IY/+a_[S7@X>&L7FWD[?C(_M
g]c/#L2fTXfa]LX>f,;=))/AY+_>Z#a2R<V&.dVO)\GZ8XCK3>MNG=G7.(^S0Y,I
]g?<;>UXZ\15cg+9&PBP:T6D-:+()O7DS,>e>dV6.L<&8:JcM9E8RfL]+;d^:8SV
8VE&H+W[-[7Y+XEdMAF7#USd+GQ5WgJQ[TbOdeD-(U73S,GIJ=-<Sd1EJZ4OB-a=
6Ua:K-GID@LHAP?=-8E=c6CQ)&KgL[9^0RUffY\ZB@R,g6_e9BLd@cdBE@CVcGU4
Y1WQV]Dc-=SF#)#/:/L5#.OG3S3RR4I9WaO5Z+fcO9Wc5)U+(4^AT>E:1M#O#PBR
)]ZV]OTOZU5.88<,f(0S0[=Z#VWXeW>@a)7ad4X5g7#:21OTX7O-fS)/XWL4J5N?
8A:L@IF5,@S;(-JAK/FWdI9>G_CC:+/QZE?^<ZHUO1,ceWOg]I?LU1bBd+9P)MQ+
V\0,NN_VQKK4eWQLY:^,FSV:b[0T^/LHFJC\:A/G<(BCN;\[;/H,MYQ=aM>>@EG>
L3KT8\KF5CIaG+Pc>e+J;)HX2Y2d1Ef2U4P49_5/&[8;^H/@\ZNbNZgO@[GOE>9L
(3N&UeQM6GW?0X_&a[F7F&T3,CZJRN^59R1G_YNV8P)@g6N4?9?cD7@S/)@LEW9g
W>)^d4(.\H^P0@_/NdGP<ZdTC&H=6<R;Fe@1[e+1?AW9a>[&T:S^&M7RNBeeM4E#
c^50?/W<K1O>[aSACPQ51M0((??aS]@R0;YbM6Z>C7I-X]7Z\?4J)OELb82LRN:H
;BP,bZ#QCP&QGZC?:/]BZ^NC@Y&765@BBKYF):]W32O2B&LbKG<2c7&WF:gO[.2b
P(0(?B@\>)^PHfGB<BZg/9-\DH#NTXHVSL:TNCbL;G&YJ6;YC+8O?;4QN;3OWc]7
b#);4eX4QQ+)TAY)=Q&QFPY1Z;FZc>RZ_/7:]JEXfZ1Na^MQD&K#K]S&/TD<gGA,
4D.Gf,_&WEQ/[@OfJc>g;9/&#GM(E4YL<4aO3b<\>/AL+-16.09\1Y[IJ+6/NK+#
5PBF(3TYVULX[(eJPZ:6-cLfNF)<LARW:ZMd._4Gc165S2-GP@<N(U]M[@<^M=f=
(XX(56[FS?GH6V^c-LU(.=?)Kg)P/E34<a&LGQaD:CbAZ06GBNd7K&8egU4+T?dN
)Pf/)gfbY=88gHN]>O&N8=@R<3B1O?/e0>/:,H-_I\#Ng1[g&82)Y<RR:8PS7a;P
_.;Z/BSdMDfY>ePV5+dbG=(CC==JKRK&Y]e=gE_YLeSR^5[>>NB34S@A98GN-6b.
AHMV1Je409c,W@.&BF3O1,4gK00.0?#01T6ZZLAYf>;U6I+=B1ffK2PLeYTAc7EC
O+/#6(TD1]X5;^(NK&8_1+4V+eQ\59d1N5Z7V\e0&OY94[WJaagCHY7QK8eAbb(H
OX@aAMNa5,UP@9.[(@&]V]0T>F91PYU2cIf<M&Q46Xf5CZ#6ZggI@2DIUM)Kdf-6
USb:9W/4.#WQN:c).U=6LLJG.?=KN/;:OH7=cUUSEdbaO,B@dQB2gR2>Y9&8aOM-
W4C3?]0K6PXPFc?)d,IR](U,-+fbN7A8QXFH9E1b2788e-(+?LdMH.TW;D#G-Mc_
6TEdW&VbTBZf>:fBDE<-\DUKB=+AYE92/fZLS7OQIU\dJOYYb0P4P/#P0eDM3O\:
a8\(R/RBCG7OY@QA=R/b-W.c@[YL:[DS1McA>X].,T:[GGVH/6=c@24C;QVGB0e^
J5&Q&_^^O+AHM^X[C_dA?1#]9#gb<<aU+?(BNX0SS,gE[L<(12GG8Bf5edEG]5L.
>L8#>4KC)_V<d^);UY-T//5@.2R4[JE]\?Z.N.Q&\^FHG/LL6/2437N\4fF1_G\d
IHDNL.RX85,1BQ/INCS]cE:dV<^8G-NO<M&b8E^<a6<;fCbgdHNKUE8UYIf=PGb8
H3;^U1[KH;WT=f:D0((/NX=HaLC(^[ZHRBEf<UD6>&5AK6Z;fU,(aSf@6#EB39_-
#88@6\IZXYX7^Q:gNBJ@LV5@Da94)?f#M-D0=+[N6?;I>.?@H(51<5A\0TZXOR&e
3HWS6=U0,MHbVY-eI.KYV_:Yb(aS1SHKD4gJF#\873Tf<8^F\O/9P])1^P[]<UOF
I.T;Q82^U?J8He/BaY?Z\S/RXBc.3bS_O4.^:I5b+N<VTS+_T+@L7Y?5-P3.F0]1
FI_5B4+U8Ib6J\6+eB[Id?V_NdbSfRJQYGbGXCcIR;d#(>:>)\0^_8ZfE7QWUQ2K
<A)bSW0&)P4ON,@+DZEX]]H2TWKeX=fAP]d;D@/Nf#^>WaLZJHG.c]S]C^4WA\]<
O8bC\#/<7.#.AIVD4W-K1Zc8=AZ:J@RSWOHFUT0@g;e&<)K>VL,64cE4IPLW\J?M
W?5-R/+UAG9[-S:YQaN2YIW.4/WJ<A]EWH;(#@TK830TeBMDGKDYQ8U<2Y4DV.A&
>JPIUdR:][;FE>KJ8<_+I^3/[,\1EU&5Pf]EO>0)B68b#RHc)3F75W#_?_S43c7Q
?,;8#^=V?d#,.cEEGF+OH(1-TaA4Da4K)DWU+Va44Jb)XR^CO3\4#@e2)>ggfHTT
)^NOfF]7+P7&WYKN<^7>P&5b<WFG+IEM+6MSR&MR&Jd,9>4d[L_MX4acFR<\eXKZ
a&>P\9Ga4Z88=S/3_>RFA2&T]VE@Y.I@E9(>-PJ:PEQ/2R.ASFF@][QYY>@VM=_F
]Z3FYD&95X#a=+8X?:[WYUM[D=1_f.[GUROAFWXa#A#EQ\LHd&I55XH-FHLTdMJT
-d4_]P[7M@1,b8GcC.e\&T@E10D2XZNcG6[Ia(3D+7)agfMQg65278\0O924TN2Q
gf4IA5:f)7H>604VNS+K:_3UF1/9QW=<ZZAC=J4OPf^[4?9eVfTKc9N<8/S3@2W<
&Y2^-XZTN<91ON/Vb:?M=0Z7SMb2a#Y#>C1_IAg9:b@?f]?1d+cYU;aDg=Hf#7/T
BdC:2a[KU4Z]587&b],58c9_S),f)C2JgU6)eVVKU,fTY@V[G3Fa/TfA6Vb9W>+T
9?-\_bdLCXPR8Nf#F[V[AWXIO6AL1N+Vf)dO0PS_+/9I[?<S#L5_E^J?:^cB1\a7
Z6G@HGcTc@#DSV^WRD>dGcVRWeaCW)+<K.@];fNCO(#R/HYW-SJ,3GRW;,ZJ(fd9
<61/M\ZL3=(00.JeQRD=T42[.IBY^&Tb\II92e@6MB&Xe>MUOWK(eEEQ,2^VeGT2
IB0eV)\6C8CB&[4\M3\H[V:OQ?.e\=32^T@UU,8)&7::XHBSeN0DDWcR9?F])c@8
;OM#F8K1dXA6722AJ^BXP<V]cc5G^789(S,,Y6TWE7/BaXZ;C84C@RYF>^ABO+/c
Oa(##KSDD5M]eL^/<6+WA0g4B-MJ8KDK1E7fU[H@]IX084(T22DE91Hd@H>-3We>
IM\>KGZH<\UK?gZ7>O#dR:3XM3293US@S#;&3@<H[)^OIBQfaJR9<O+(@[@9HO^>
]:fNd)WdY&B_97VbP?:4=KMD(L]49J=5O+T.9#)15&YB^WHcQ?1?VO/B-LBXCEU9
:?^^f(=\V=FX&VRD;?,2>Ga:8]W5a+6UWM.YC8H6.3>W+2Ib(6U;</]#5\X8]L\=
)D[\B5S9>7M&V3MH.-Eb0@9196V,M5\5C@06A&aQG56.#6.Pdfb(CL?Z6/^V_/c_
)e-60<X]:9VIeeP9LE/\0M)XB3bA[KdKY4/6\RdJ^QH)VXM??2,HA>NS3O1:ea13
?N7X)6?V5A2-0AR#;b-)]Z(KJ@ANPFZC>85e,XWLe,B7C6HQCT4XQ[NSN$
`endprotected


`endif // GUARD_SVT_SPI_TRANSACTION_EXCEPTION_LIST_SV
