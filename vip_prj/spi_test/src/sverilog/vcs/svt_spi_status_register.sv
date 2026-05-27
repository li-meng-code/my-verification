
`ifndef GUARD_SVT_SPI_STATUS_REGISTER_SV
`define GUARD_SVT_SPI_STATUS_REGISTER_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is the SPI VIP SPISR (SPI Status Register) class.
 */
class svt_spi_status_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Mode fault flag, this bit is set if SS pin becomes low, when SPI is master and MODFEN is set. */
  bit modf = 0;

  /** This bit indicates that transmit data register is empty. */
  bit sptef = 0;

  /** This bit is set after received data byte is transferred into data register. */
  bit spif = 0;

  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_status_register)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the status.
   */
  extern function new(string name = "svt_spi_status_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_status_register)
  `svt_data_member_end(svt_spi_status_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_status_register.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this status object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);


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

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the exception contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val A <i>ref</i> argument used to return the current value of the property,
   * expressed as a 1024 bit quantity. When returning a string value each character
   * requires 8 bits so returned strings must be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The component will then store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * construction is taken care of automatically by the command interface. If the <b>prop_name</b>
   * argument does not match a property of the class, or it matches a sub-object of the class,
   * or if the <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val The value to assign to the property, expressed as a 1024 bit quantity.
   * When assigning a string value each character requires 8 bits so assigned strings must
   * be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

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
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_status_register)
  `vmm_class_factory(svt_spi_status_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
Q[Of27WHFd<0-gdHc>_eL]/0QKg?@YW]5F9gb>[P?JA[[+=FbK\O3)I2N.#&1,T1
5-4@+61df6R65,<:)#UJ.dC>cL2>0aH7aQa(Be96-B)-O#RJML#@]>Q)RMFKONg=
,R<I?/LT25-TO[UOPS<)]BfH_QYQ;R6\;];B1=QLM+<(W4-4P_>1LgcKdED-IHP4
=<?1#X?4BI-=d&/&OQbS?AT(41.<Y/1;DbJ(_7gg@P3geOc3IQHdFF@]D2W4/]MH
@,D>Y#Y]MI@<g_()W0d:YcI;O8WAH847WY8I3E<[UKf;G3@^W3ST[#Z+2a7:H]T7
TYT+KZ>Z\\6P-1C,OO<;9E#J3E^5547[\.4BR.1T.XgSe&6f894fLa(H&+;[=)01
WN[f1cd=T[</(M7,d>9:eBQJR<AC<7.GY.Z,C7^(@GE;//>-X>d][DM6V7+NF:VA
Gdb<&b4\gC0aSF2D.OfTA:;7G(UTZZC3CB;DZ;#I6X#\@ZR?RdMTTZ4U4:@?G_BV
H&[&G5Zf]e_07OaA,L8/fO6YU@Z-SQ9Md9#+JR\+4HB==[Z:5V(6T>)MU?a<4R2M
H2OAR+@:FK>(KV[WTV=:a9(.e>FR\Te\<9VA_X51=YLf\/\H]/,+D,7,CS4c.gc:Q$
`endprotected

   
//vcs_vip_protect
`protected
f+KeB5Z62@e/H=]c(e>>06MXF,,:V:SZ>EYQ=G\=VP;cXcZ=J+E\+(3\4P.3,e<X
#6aIV58\=(S#H-_1FbF6RL58TfMT7.Xb+P=FgA5P(H#H^NC06Cgg/,+X0:1VNc&Y
W)HK[>1]F:B,]C1-Xa,cd2&IQ7H1\I+8?;3+aUbP?0bKD,Q9]J2R9gX;I^.T^dSG
,>6C:VT:N>B8P:dX[&?UbaT<NIb(9C^]XRO(=HH[LS21,6N?#7DcfB/\4<I#EP(:
?533(c3=Hc32Y:8.Hb2M8<W&=TO-a0ED?LL)3DL.V<-<e;&g[fOP>=WP2SW]59IY
B+,)08O9Vg.6^\5.[L;_Z+:A=Q8fYIV7I4LFL5^LU><<6^IX2>/91PTCUR3<)6;I
;=T,8f/aB6aX2F<X:O,7?/dA69\0L@:/+BEJ5AM1B26FTT8:a#@7^/_O[BQeL53e
?KQ?]52NC02C]>Z;ZWW..UcV_>XaH\gSYa,AWJKe9S_P.^Gd(T-S:Y#ZUBKA9RQK
,?/D:CABT^gEGOYN(V>.0G:89)H:Eb#A&G],KR@V96f6dIS2_SC<EeZ>?cZRVVEH
Uf7Ie?RM,&1M0e2a0HP]02IIbF.0+O@ZE;619a.e&?ULb9:D0[Y:@S;A3f0c1dJ-
0WMI@@a>OFT\FZ=LG?3+X,]e5K)5ACQg/4U=KJd^W<L]Q(-67-+O2L==6OS_Z]Fd
1AG5PX)[UJV:g[=D1CbTHgO>.&8X7.T9;Z&g-D32/56@aWF;)AM=@f]QdfDN5fCV
,a:(,^G.+3@N[Wa(74I>a@eX+K^+3R;]+ZM?2D>5gT70ba]R#=,AX>8Y,;F(WQ1?
49D/3P^VcbP9#\WG.;aBCS<3_^RZ0-H6LbJP^QGg4Ib<3\F0e:7/f>VQ\^TCO2ee
OLN.=_eMDR@#Ab;FB1SU;aWLa^<cag<[F=d.]OLC<H/.M?6fC>:T\SK+0)Y;J9;5
d11aYIW?gCTZXK&(g_C8RODVX[59U3;+D_@BJ09X@;V:8=)KfGVe\AFL\4Ha7_F1
2T55YU_P6VfOUgHR/2DY->Z/XYfL02D:X2_,YM<g17A-b/.I2;MdGa.TWV^=TDJW
_3[fdc.=\]_CBX[UcNDNL94?XL[[76aa/,5)\W>=S+1DP.QQ,(2&PCEU.([gKP</
6L?VVJU#.J2.aB3X_+&ESNWT=]K2L5+ZVGa>Y;f=8HLXM#LHdW0Z.beA3OX;IH68
QaE<NRNN>cZ&THUGdRAaS+SZ\Y2#9CH?@)P4X;I8e3K&?f+.XV,D(-;\#[920TSe
dO9d.]/@g(9>PcUDdXIfN447\X;-^2RC6;E2Dd1OTTFW]LE6XFNDRXR#]2<:OK\Y
WXbHMV:.KGP/>e2G]CC5SA-YdLE3]:YMN.:=;b>7Jd#RL&4,W7FeO-DS9(PX9W&[
;K4VVUC]/KA-M+Y--#30R(S)6]g:4TSXT1Lfac#O7d7ARBXT]9<JJ]+LdP^X<INZ
e/QNa&EE[4[=c;TTREe+#8I.JS,OUd6--D0#WOYKHc:fP9.L3#05;+II1FVCEdZ3
0/D?d3ILC28_PFfEQ&HH(-#>1,gTf<)Nc3.2=DAU\LM]4BT2Vae)J]J/fMK;T8+\
&2BX<KB8882UQ2PU-Z-?7e(H^4[B6;O-a3eZT0G?d^O?->[O-37[XH)CCXKJ#gcd
2:#<^[b09Q.I:BSMK1/JV.8#/SG@_9\a0P&?@Ie.<V0D8<b_8dCd4M<Q;K3ORVHY
gfc4[XZ=c@>gb3-@:PU]PPgN12&a0U3A26Td7&_@W]+U[dAB<bbI:eD,7gI+M-0]
5e^+dWEFP]?49EGB7W-gQ?J=87YOc0)e#;.C8NLaZUH9L9/G/6a]51Zc[EY+<3I;
GJdU^2\G=96?08^.f0R5SO6+XBMAfW.]UZbSc0LcQQ+?55DC[.89.TV2UN-QSH^M
;[SL]R&X;<I&=YU(_JF_1eO^2#CM/a/E2<PP\0N3b<.&dTWA4B]#b#EP^/=BG/@&
-P(N:Q&^Q,.3Sfc)/1J3+M1(Y0aOD^(3U(HD6&eA.060E4\3WgeK43E5f@TP1KB?
62ffP/S97^85dI]P9G9H@4@1UZHIX_3_88ceARH2C?-VN;0M8E#B&9H;IP72&7TO
KA5^+Q4A3^-29P4eZ\0a[LRCd;2]IE0Ygg2V]LYP:FXH6;?QXLWKUS9-g\=Jbcfe
eE\V<0T#Yb>DF:UA-NTL/:ZUPL5GMD33:RXd4POb+86?X>Gd)9P=e3E@EL<>ORK6
\30D7_7?.^&TEfPYRQRL_^aOc>@HLOZ\M_WZ.+Y+((MN)M@.VB(^[KI3W]OH5L\^
8f-Vf7Z<[+#&7QTP#]]eX/^OJ0X>=QRR8QgRB_([_WcBZ_8\L_=BfN_HNfG9J[Ba
Mf[d2JA(Y^Q(M[.KR>4Xg&b)2-O</b(XIJHcQVI5X@7d,D,7Bf]II<a((bZFeHZF
g>@BCPTE,>?-X>+Eg/[Q6N^BG3,Q0c^IRPBFCX+EdJ0=L@]Y7;VPQH8/.G8b\;N-
&>g2\&<VD7.\-dKa&ScLSNO/2]9Qf)_6f_7R/CVWIMG\XU\RR<SgI?NYV3Bb]168
V[OL#F2MD/&OLe28D^<8aWTc0O/a>IgIB;AU+962=MJbH891_DXDO;c4W7[0=c8,
6J+GfM1D\7BA87E)K,KZIFF3YcQPe5e6WC6fR3T_^R[_&f5?cD5M[V\Y5NO5L(44
@.2FPT0gL<C>I_=4f5JQ9,?=eCf+a&[^dY,Se/U^@H9FO@S)YOIg/a34gL+O<)a(
E#bWE7:C>a0YbOe5S5=6A:,P8^7,)0cZC@<[Z<?d4M(MeQ_9_BUa6HPb:RR;3MRT
2;9/eC&K[4.c-8dKZ>&\0MUZ()A/0VdRN?_\fEQ^YT)8R]Y&L5&5<g^QBGORJC,D
@LODE<PEX/5eF3XS5AJ+#DX67UKb1:3=]G?64C(Xba;^1F/:X/T&X<3=bJ:Z:S/,
I_:BUXV^B,?Z275=5(-,W5KSQ4ffA.G.cZ=+b8UOS,T-K@+GM5)L0&KgM\,8?TY[
2D.],]a_H>PSUD&[WcUH4OSfDc97CNO]/(=gO5#@BST_DfaV)(;WC9OO2V]C]WO;
?&;-6V-f2BQ[;.CJG)+g67I^M(>F+?HG4b,XVMeJe&^f@)fO/B1_69Z#T>a&9G]P
^dN_R>4\8@5ES4IYO)GJ^Z9IMSDS&BEN#IbIDLT(JYd=17U^TFEcGK(B[V51bV2Z
b?&d^3H08XM&F^WC#+CQG:8f5aML)V@VSV_eXS.M#20=JWMF?[1J(Z]4/,>;eUgT
b08a>Q:;:HDVF8c4U]S7+#2:7dAT.[\B#d(D:+f[^&F]f]U3G3L^)2TM<7;K<(;D
/=V&=IE,9UD2QaE>eJ#OD&3Y4/4HgIPY_X@RQb/aHPLX4[CNG]\>CfIND4ZLGFc6
ffQ>[5)>5dY>Y\]4f+UA\?.7&)CXbefKP:M6T@^?RZ40bH:<BYQ,?f]@J#C/+A4U
QLCA:/cF.3PS0RT-3.^YLQJaTOJ.Ka^FGM9>>@-G:&:9S+CM3VPU,)Kd/+0,Eb<?
3)@e0?>H+5fUKX,<49DDWQ7UI>7?f+G<,TLOC<(8;UP7_IB_]eJQD=9G=\BCSACX
A8[\>8EP(<3/Y:(3\,Q[><_#,R@Nea\(0d8bYgH->dE:5X9QcgMJBHZ-F3D97&c^
+MT<.-6XZ&#_FS?g/QT2-HT+K/>7UH/XF7_K?4Ne=(TLUH&9=>_T7IFH^5HFZ:N(
[-(C/35H#8L?\(NDEHe-MEfbJ?,R8B=MW2Y3=P+g-BaX5#9E/&5UR@:6RE]J1(4G
M3+0bAF,U7\LbS7U^8939-WU.2505ga.O->RV?La&2f)\=ZE-21#8F6N/.VVB[JQ
1.(Ig#GX@JVU[)GC:fT&@I^-T\L8a=UZ^#:&,b;0;K^_M-7UVQXF:e[(KTPJ6P=8
(@f[FfIIVB^H_K8JaF@2ITNI>9Q.E9\08>;bIC_2WEW&RAHJR#S#>f3CN-BVg<V?
0=QaRe\.CW1N)-[7STMCPPUX#b0-SR5SJ9X<?F-,4_S][?&,]IK-V729Ed,L^:JG
/eMWf4G1_C)P:B),f1R[3?0DKPg0I^[E=.:9bLc)(A=O&((<DOZV(191U&\O=)f4
LQ2\O.JM#OFYFB[GG61gcWf/WS;/VM(J):DK39NC4CIGTZOFBec,RNT[:)7P-)K3
0fD+5BW&&-MB2MG@C0d&@-K8a6OVU71_b7E6Y:[Y,.I24+GL;JC/Tc_cKKF\Z<>U
SIQE_OWPKM/JIYa4aa]+Zc5/][a@P2NT(AE]<dg#e2_K7BA<cZ8)Qd_HS;HCTRg1
@EU3Xa\&e4&-2d6e5D1.>97NgbJC(9.<D9dOQ]_4P^_4XHQa7C3NTOg94)\Zd)>M
W[S(C/0M0RCA(eH67a7#/98bf@,6.Dd^CH?4U25.g:4?=YG8d4WH7;=>2>?TKaf#
I_(8;/V&74IOX/X7f5U=J6<]20d=2,+OFfR.C0X(_&c8Xe.R.D?9>c97(6:&K)3+
A\a&HP^Y#7Af2<70CXYDe5<DYILU7bK0JV4>89Y1aD)&GZ:15_age6P.50\QTPCB
1.,6BA_\>>I5>3MF5.S;fJ[U+K,b.)AH2THgC=e\KbSD8;fKTXCC0\7)EO]^^R+J
J)Z>9N==\S@X<LJ4#[.[?b)bH0RDBQLQY>)I-gE8(=.;B0Q(I<Y.[_VJKSK]eU/Y
g#gE:I\U<FMM(0P\M#=8&>4FVRd5)C(#2fQ(S&DeZZ3D=&V1=?[f+,0;]E-K[JfI
3?c?1G1U]E<9:[>6T5-,>?cJE6\S3)+C94B5Sa-#gE2IbW9^0#IfC-ZDC;3J:bG#
T:O=d]@bJOZDd+?dH0YTVY>,Z8[PH=L^gDg@I_aJ\?TS)&8?],.gTe^ObOf(A>4e
P@^@HbJ)cPgO:_J1IOM-e1\Q<ZV4+WPfD8&eVTH+8LPX?6S#fFQZR9+#>f(W8,\@
8M:#/]#WAOOJZ^#AY;9<T8CO[@N^+IN@:JT:-9dM4H-eO_U0>/9\FNgWa?I5)\?2
LObag1ZIACRG^5Q8,IB1LfI[+b,2L;9AL#S?G+/S#eI@X=4181764R[BVg+adf8P
]>g.>(@DBS7X5LX]:-4<^]]\9AJ.V//5>WgXCS2C,\VF=&_O&;L+M?EMLERA;^[^
YJ0#^?6]@=)g])E?cWLM0LFCTD.@c>-@7^UZ5e4&CBK>,[=MJ?)34IeS5/E08O:(
gA9M,2+J^:L(a@@XVb-ZcQ-,4Ng1Y_>9/\U[]6@<U,<CWL>dL+>MSbQ2gS&faMP<
?L3VM+(^g>ZW5S)YY;C&[F:b/d#REB?CC]c56HMKUT7RGVW#&K29YcX)B<Z-ab?+
.R<_=;2e#)+LJ_d,.dZ1?ZYada<871)@3AB#)-.c>LZ=#bN^e<0ROU?&Z>:):f(V
A;9K[BH/7e7>0WT?cU(0@gg3O33F@?Ra.)_1F&325_<_3A2JO&.P_g[KD<b>JDUc
],M4X;Ma=JVUd7&<O8b+0ZFe5=CJ-f</AJ#]NaNR[^C3ME+I_^+^5a4/.F47D\#[
.>L4B\Tg<YgU\P7_6<J,O9H3B0N#gG=7G_IdTEd6>5Q+DZ>(L?dUbbLO9,a&WF#Q
D.5#Id/6R+;6f#gI0^AA8]fb9GEN/F.^Y91Q)N66S@+7O6Y8EHKW_C?@EU2\4#O6
;VB>185U]E_H0-V=>YR)dA2bP))gHV)N==.-d=R5a@2^QcU8/ebPNV?ESPbJ?#4E
_d(7E<&0](PPQU53C+:6KY[ab3KX]G@;]#.aVTdf7JLU8\R94d/(+a:^:XY:b?Od
0V2)]Q3_d@S7F&J<Pfb4:IKY4YQ2HYY<9I<dWH+<MCC@<KC)b#23PGV(?HQ6IZ=+
3#D32c5\TFI8WP1&:(F?5=^L:NS]2f,>@>Z#I[3DbT-,.1HTUL4K3PEI-HFO.WdG
XXQ5-POX,S+(IHQ[:IT_@R+?eUCTLdR57B<FHX5[#]JIfdEa4b[B,[>(&7#\9D4f
4B)#^b#)P2RNBN=NP8SLZZVZ><.^#b6;F40QAHA;T>FS.?<0,gLX+CW/6@,Na-A<
&W]07[Ge^)4,0M9CL5GGCX4R.DFOA#LY\K8Jff#C8(UX6@LD@:P+VcbUaW]XUP9+
@=Xb\a5(7<M=NWN,2fAfS\L<R@#\#\D3KJ/>LacXZBQVMV6DWOa8JAUB\e5WP0S2
2W?1FD->_H)IRQFJ]=KH78Q-]1<CeI=WgDUD8,W1(Ug1/;3PeXa(W3+L++C-.\15
9+(.E@??7XX5BTXR1&8_]>bWW;1.I\_M=5B\VU^])]ZRX:bRL,T,_);CB7@1(3YB
VK>Q@d)I?WDX]OP2c./JQZIfHT^b2Z)Bf/UC[/UA_b>]ZJNYU4II8g@aJJJM6JV\
2W6MYP8=;2&2/)_LA]c.f/J4()/T9,_7_;VbS^5a7E?342@P=/de&F27&;Xf-ZH\
M,JRBF@8A0QT7I50Pb\[V]82TAHN6P?MQOfYTUN:IH3?]V:4KU37?1MO<:R?<1P;
LVN/\g^=bbA8RXQLd:141TD=4&82Q-U9/GXO3<fX?7W+(1KD]Y&KEK,PCDST-+c9
=J-&cQK_VM5Z5WCM)c3M?S.aL&Z+V/[08E(&Ra4Z/>=AVWcg/bRd5:9&TG1H5dD@
D.K0A;L)TX.]U8+]6V&5SJ7D(YS?d?>^J&?V3c6I7NcS?MITXPUW)RMJ1=J\81+D
H]X4Rd-#G=FUcDC>[_@\f,;FP>aURR+f6ZD;VQWAf:N#J&=HBQ5:A&FJ;(WAUI=R
19K#=e74J\gG@(b>3C>[A(Mg-4:\=BZNX>_]&OH4F;>@)dgYU-2Ld\ZSOC,]?X/Y
YG@G<[Z&],F6\&d3UN)d>>J+2CMIDO,<UReW51-#CAA0BBO/gUXVIA^fcc56-.4Z
ZX-(>=2Y<ME7QW[&B7PO4^+d@F\]I;d,9YNe)WP&)^D6J17c3f)C)O2TN:L?UNPO
[5+.<[?5<FH3Q8]bPUS\^[Ia]F+_?9T^eN^ZAQe_FEcR^O#-;b0F:A=U&_C^J);R
U]RF;8W\P,PgT-H=UI#eda:AZ7\L)b]I9_,8Q&JI[#5+g2e57bO2AG(C0b4#O:O+
Ngb?6^;b:BXX743T7cXTCIN0be=ce9YS\7>(;f[&_cJ&IUUHS_<.7<AF?(MIA0S0
QbTI7ODXA:F7T<,M,^YG\^6PKQ#.[<MG_A_,KRc<6@SdY_])VQXX=[[S>>Q>LZIb
/CU1>>7X5BMMDLV)@6<d7dJFR.#QW0R_X\5PfLXYCTQR0\fT[G/E(M2\cAdV]dYU
>10<J<A@GT2<dVZT,OIbRH_]2]Ea?Ma&XE.?:=/>f]\3bKa;(;a4W9^F</RM[5>c
Cb6)<V2LFd<2^Cb]?a>GTQ&<Yg=7:@F7Q>;@VA&Z0a5PRP&+&XNgN#_;BEA[<HSd
^R2S\HXa8.4[QVc<=A2CQHVbL;NU7=^Q9D;>,8?XOOeg65g(Jd^J=4P9+2H-N_Nb
P,AP_I;JJ1eg(IfW+S/e;4BD5f7J&e]0GC3cX/437QO4?7S9F53RAAZ0/_P)=K5(
4F:Id?b5637EYV(<@P[6B[&fT;=X6+:5cKQ)XBDbYg#]cGOefbWTHU]6)Se)47cU
,5LYAA&4D>B9AG_[S8,[:C(cYU]-X5IB>FU\NO2e>#Ab4]P^#eZN?XZZF^?UagL.
TQ6e;^L=#^ag;PI3CK#CA^[15f),dgA4Xf\@;D]c^HAD@;Y,RQK3GEK9+Ig3#9H)
N#J,)1b0gGFG4):PII/_=FAU1Cg3:N,b@92+X@aE(^e[H8/?\_aPCeQ05dHA+\BL
2G6.#(JI8BX/E)^VC&0_NNNcR6;1@gTaT_f]Ue)]E=d.GR@.;cGZ+9;X/fKG_cZ?
KXg49+.gc&51\gS0F]U,4L)aC<Y;4;<F#AW&[-U/dUJA3;WVHR#/9KJRd=LCb)W+
P_fO2];MbVQ&AVK5B8M@/&I+SBR:[3e]=(,21Gf<5UM1gBXQ+a9D,c]?X2_XW1-]
?H5UDVONE3MB]0F<f0OALVIMW9Y8aA4aRLO&83b08_U.EF_^_Lf0QcDL;:7,UfSA
KOWO>/AHQ_:6=WQ,UHaF95S2-DE&:AUT>#JV606b?[E+=:05[>P-NDHMcRY>,_)#
6L@PM.4?D8[+]NO8DZ[LLLOEdJJ[6WHg1c+Xc#(e#8<4^2]@#STD/V9QA9&3AMIS
_8&20AO8<)SMIYbCH6;MgfM\&D#SEY2.P=f3b/(CR[0M2d9aOg>db>E/#IZR,MSA
@RQ&XL0Xec8O((@cO:GD4^^fHO;g4,IZR5FSJfLU)N=R^1<0J<+2[,I--2+CM8Te
N8>KbWXG:WgYPYOM#eH^]+C;9I,e3VBG=/\9>4@J^U2(L;cK:#7YV]BQ&XF=5EGU
U_WMCW^CP(P7g,7GP2XY_SU,?K3=HIbONcbB+X(@]ST5DN\#V_Xg.@]PP+fVc9>M
AT+NfCcR5g^-3(YId6JFNWJ1MSegW_Y:_WWQbJIV;cV:2WKU5@<8<C;WI_\;7\2a
#^O-D^(R,9H5<f.A;60IW^f?FMX4[+9\[))/)Od-ReXI<MDN=9#Rb/79HXUEZ76R
.gCE2d[1E>6=J?6g<L@(aKQTFg>.889X)BO:/<;T8d61SIK+43C2d2cK_cR88@Y2
f#&2);d-W3)C02]7gF.S,BfL2I2+Q[g2+)^#P-R2O43aW,?/=,)g]2XL_]SRSX=M
7B0e_UMHg>+-;d(2]H2OF4;J<X<cC#f>gD53=FaeADfS1Hd0,@QP;c#MUUW6eC#W
3/2g:YaRKFDc5(f);I=a:&+ecEXCZ^X/Y>55SgI5TOF(RJNHUC9>4@EIZ,dJd_/<
0EA&/OBd9e9<AY3VHCbNaH?@Pd^(SSTcd647A_V0V/QXBRLFO^/0bc.:P9=XeD).
Q-<P8;Y<FQ_TIZDeg+91OMK2</g6@F49\\\1W-1RM&;0JXb3F=T-RcTRWG_cb.ZQ
Tb#Y[F@:38c5@5?)<(b/K?Fg^:;/0M1Le6=]9P6+)D31#438YKIgED>7QY:5\aP3
g79bVe2-KZ)92Z[=:IJRc<L0-[7)a47FcC(G1XQS&E_SeC=9/N94&CO43\K-&@/1
1>\8O9P)WK4f&M@8DV+QZ29>U129:Y/e7QH&]5d4T,><@UC2.=gE]V5^ZR<Taa3E
ZZF)]5=QHE5^#7:A>7)cBFa8^T/\R0A3,JcYW@5WDK5BP^8^))J>Bd=4:9TG\Q9e
8&R&E;2=ZZ0bP/NFM1.VW;^a7@E.fX83-+^)DF2/J(5CK2JB-JW89E.N0@TB5:SZ
B3PS/;>MU]GQ]^#2CQ1C,#ZVS--/+?V;g+GG(CE:?UDa8<5Q]5VPI<S.DYc_eeU5
aT.b7^_#eLb<,ME?RU,<+R,;W-N=4A4J1^gcB>A,\0/_9<OMU>H)D-++H9P\L4LL
.a1K3O=#\.CD>,C,<+Q9JKD=^/e7ARD;I7WNC3XC<4.N9^f7b4C_AJF_b;D&TT0.
56)d5eC3R,5H)EeGL+6d&WD=3$
`endprotected


`endif // GUARD_SVT_SPI_STATUS_REGISTER_SV

