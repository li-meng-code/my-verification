
`ifndef GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV 
`define GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV
// =============================================================================
/**
 *  This class specifies xSPI register that holds mentioned register field.  <br/>
 *  A register field can be distributed in multiple registers. The valid
 *  locations for register field at register is specified through 'register_field_index' member <br/>
 */
class svt_spi_xSPI_reg_field_register_map extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** This filed specifies the name of the register which contains reg_field. */
  string register_name = "";

  /** Specifies list of 'Received Data' Index that are valid. */
  int valid_cmd_data_index[];  

  /** Specifies list of register field Index that gets updated with respective location of 'Received Data' specified by #valid_cmd_data_index. */
  int register_field_index[]; 

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
  `svt_vmm_data_new(svt_spi_xSPI_reg_field_register_map)
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
  extern function new(string name = "svt_spi_xSPI_reg_field_register_map");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_reg_field_register_map)
  `svt_data_member_end(svt_spi_xSPI_reg_field_register_map)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_reg_field_register_map.
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


`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  // ---------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
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

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

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
  `vmm_typename(svt_spi_xSPI_reg_field_register_map)
  `vmm_class_factory(svt_spi_xSPI_reg_field_register_map)
`endif

endclass

// =============================================================================

`protected
[b?cH44YIB^Sc[QP[OEK,PGR=cUBHMe9)RRR6cI0XE@Q3;c]12N01)[O#eC+GI+I
8>b1NSNCeM\+VAb1Z></FFHGVYIE&<SGXAOV\EJTC3^RX3,.C;K_^G-.aZ<I;:WP
XUH-VZa-N^F@TfL[bEdX[D1S:aCRb/dDIe5;gX#5-g1LBNQ121,5CM11DcZ4XJ6B
LAUKCM52OTT5[F90fK8/75N2OA6DBJ/:(CgGOD3Af::K:&EeVOFJ@Jcg7B4?4c?#
O1g+B\B0=g#IN3WCffeOfKH?R;DS;C+TIQH+.BR)K0[OgA,/J@0\>QO]FV-bDK0>
_)g3W\_LI5#X]@K.e)17_89RCD=H[BL^T<N9U:U/XF2Nc]D]LWO7fUVdeDdb/S^A
Ic[.P^Tg8<:\dJL#K3bWYVY_c;cg>#^293Kd=,H+VVbe]HH7<;5<A8Z4U62,Gb=O
K97>9B6?<YYb^RR.89ZCQS_<dg@ZUPUI+>+JTEE40>G_e73c<Q3.9\Ad&G,0+fOg
/&XD0(Jb8d12Gf0[gb6>dS5BVXI)f>,R#Cg]H[5E&O4Q^LX[@\84ZOWUOOfRd[C5
3e-PPN5,GO(eXV[F)Mg.L[O>+1W0b[-762.OHV^I:2Pf/EPG=@I-Md-Ledc44I=V
UN^H+;<XR7TK>#[7(YN3F?>)B]9BK75QF(GdfWXc6K[F-/Q.Le@S]5-LP$
`endprotected

   
//vcs_vip_protect
`protected
XA7-cUWD>/][<E/=@MK2&)SR5X<R\UQFf;Na?>/c+_#-4Mg8NHV++(,Vf>O:FGPd
-WNS0RSCB91:[dA8-U9A(AGF\PQ0-(dTJ,g6E_f:U[20bRCe#JAML,&473d<X/Jc
QR+d<H2^2)LERX#KJ_.IUP.L9QgMVHU(SXb<-B,[HX@HM5.NLFJ9PE]WR)([1^Z<
YTaa<f6+c_.AcUY7VeR84JY(:[eQ>;d2>#OCN5S8OZ7LGJ)=/B0_+S_2bcG)b)-:
UF6GN6X51IF<-6[[cSbaFZS=GQFQ5TC[[cg3Aa>>fg6+<C?ES+CU/A:#>)2WBQc9
_dB(SE5,A6R7+_5Oe6FH/[VCcS9&IP,WRHcLMK,QF1bM]]ZB)Q>\^BD>#8>(CVS?
^V#S]fEKOfHF-QA8WbHSZZTL<9OL1&OZ&Ra/@(F/P;SZ44>PHX;C-ZZWU34Y#Z4U
a?:&JJ<])-Ug\.;5-F(_VN+H]ZdGa8<JW<d/X+B75OVc\&I.K_ZA.+dBU)TG?W9(
PAF6AQ(=BXUP(#dY6.+bf</@dJ<.?G+BXK<9-P<H+(NgTEL&2Q1;;gHc\H=FU2)R
e.@P9+RJ,S(R&Y2C((aN_B5R\<OJ4/,ZfA[:HB&&&K=K)V,BQ(f54++#<K7T2I#=
bbQ&WUZDPCN=d=G_6^f-TYFR-ETJE8-(]aY0##<PfQ6VF2<f8Q2/aACKG>+NXGY\
RHGGKZL=]OW)+/=C6)\bWZ@Ve.WF8<>R1;4+J>WNJG4>2<.[QO@d0a[1ISSfX)&0
FV68+b^QVBa38\g].8H9I0g#ZIZR1T/2#8HB02R:PWR&EKe,Bf7,8bbS53OBCQ65
]2EK9@=8[G/0LB/4d+c6/?_IG2-#.<_1_,?\>eV0-:W5;[aU1J^TVSgY5/WW@Of3
I(ODT<KD8R,??:YLbc>WRQd;J^a04?eBB[&T(0^7D^?T=RKF92LTb-eG>>C[(,-]
SAH?SdcU+G6GGG@>I/W_XW<;5cbGP3W5H5S\=<Qe3#R:0>?>638<fXCR6S8AFEAL
)b7H8QX3e0E&#PW@GR]S@2=M,?@=3L+F01dgFIRH<XbXZ;gb@O]S[Zc>UR5+Q&gM
SHWX1.09\D?G]WFU>2D5Bc=@_DP91@)()>SNJ=_e,#R,.EeKe=F1/?64_0WZMd_X
)f4HIQ;9#KE,6+)g8+8ILYLIV9G2Ze#Vd/2e9/TYE&N=F\&;=69Kba&)RUe>2V^_
+>A[MgAUPE72481DaCWg&PA_=fIg;=1L(cV>:[>FKbL[STO<U(1LcYZW/W0OBcP\
e7ZZ):FI/6/K51<V.Mb.]3Z7X#1TcLO[-=?AF(E9EZ-N.]8a1-?MOMP4ccP<Z8fD
T/&.+.,X]B4bdWgc.C/BeY3BEJCLL[MT&_O\_VW.L9Cb=PWff\cgfZXI2M(C17Z?
1JOS&I&W#PN;14[S0YRJZTXA46Z6Z_b-TBf?J5e@CR7-)K&B+/UK,>UAf+_eZ0gF
ZK?;5P0XaZK^,]cAPX]<D>&+#4W/4a(VQa;fLDO3[Q_b@ES?0<,He=15#\H>ODC6
+1\,L3-MF;ZIZLe96^c<IaaFFVBM55-Za&\4FTgBNM//38CPS(#;6;E0-]c]B=OX
3MWW--J?9JR)MQ1-:X81.?C3JX12&9F6RU7Gg2fCBF5TCN4US>,8eE5d#(AH/:gY
Fc>AJbV4C8Y9e^PXO@[,0P&+:CSOZ.)N5WGaHT:_aQT6:I\JD-HcUPdLJ-/PK&+V
5;T=\.E:1VZSA)G[7W:=IZXH4BeT6Td[USbQ)(b8@eJ5KceP>HO=.6[I_&&EgN(6
c#):bV-T_N1(f_[691HaI45^=2d3O3Y@N69a@V/:#Z@5R;BW8U>A<IG@N_EM.5R@
]c13;@&g(_.8##^=>Z0gE;:/:#CI31b=aWObH=1<;7b#.,Y&f+dZ0RGBQH8R>;[+
[(f^.SI\XC>0YfHBV\62;b).#WSfDIW.JQG+++:2E8cFO5Q@VH>a7=MB=>JPFO2d
\1AKXJ;2JQ(R:2H0&/.S0c?75I?YNHMG^(G]d)X)C-I@bEa8Q;Q4eGC[8(edfPN(
Od0^P8\O-_,2/Ya3:(H<216eOIW?cbJ[M[C+Ng/2a?I;XcRKU6VdKBS\Z(H,]>5\
Od+9S=_2ZZGT:/3YY[>@ZM7XLA0)(@W+>9=5\O#9#BM8G0O(<c^</AfP(U1E+)??
6-QC(SR+VXXN:f[]_3C&)2>)_A>^\;5=>_.>,-KFcf0W0=V=,ZP9,Wb:@)Tb)1]E
Q=:e]?I2La1.XfDgX.)D.2NTNIH_\_Q[DU0QeYZ)OXYATS)/P.DH/DJ<C<0Z_33,
C62d-6]D8X]7K_9eLZ@3aE#6[]?d&):1=SD6R/R)]DQ\,Ya1?#FRDLEZGM:50XR[
XWUFHRMf69LQGc2M6)(DaW)4OOAFOM0TS5C6Q6C=N6-U403aEUT)fDD-6S1SaORX
?(0K1?CFgdd&VXS(O9FCOHFEQ<Ta8bLc?:MQSM11AF&b2#<^G-I5ggR.BNFA/AVS
3#\3f\K\-QDf^4>5bVSaAB/=B[CY0F6>QT>+A-R1\S6GK]3(DK8PD.#O+YY671=F
WdZTJ0fF&:27P@#>URN@S]</;PD5J0P]@>8V<N)H4Z2(e#30=8cKHeG)UKD^.K.Z
,#7(:/)cB;cc>/\QFH6S(MMN.()&3Bc1X+27cZAcdbB:A,A<#?EL<eTV?Z79YUXZ
eU)BSB+TJaf#?;KANKcLP[<b^fVO&K=661C[CS&cPTAeCISY/3V0(5GaU>E1M[K^
Rg[d8)>\7[)WaP>](D0W_#VQ2?O):\,T7B8.7U3@Q7?aFedKG[E_9OU\U0^9_X+>
U+[UA<Z]/I9XPd_Z;>Q(<c.#<_QEbSL\:dF,CQ(?(:H)A1I[Q2Ka:1N8_OH#7.[H
0(O-UK-FdIY=He+3[8@bO:=LL:c7<,K\D\EO0X,G(V79W<e+4dQJSH>@P\RZd?Q^
Y(ggGDJc\^#E>caeQI6Y^g<B9IIHR#U&:179OYB@HO,73L82),b\a;4KI^(ZA?P+
]-F);38;GL2aa@dHN9.(++&NOF.gANDf61&:)g.V0IVI/TR4UWSMa,+#f1\X@X35
T2[.dM6X/S739g<<dNY,-(K=eV^/RL/Va;2a(Y:Lc=,N;B\Vc\A-=5X]+3Q?VX,3
Ja>F7d2=Y2NCZDfAN8AUc2KB4/bbX_43NZ(\Q8/=II4NT0bT43b_\9e-]IBd/M#5
<G]+>KD^XG1E91.bgL3_e]+?a\+-O@Zb@MVfIGCP5]/QffM<G.5)F.dQJ09&d-2-
:PaNFE#D\&5La7g>:-9LN&H>??Z?cD^L26081,,MAG03ZSPS\SS3=0M5/6#(e^<_
7PA?_PA>3=&JU7KHQ63=da/UL-?Z9[faFU>2U,S/T)^&Wf]D5,NZI[]<fY]O1]3Q
DV0UOJ^3;QFYBR;[d7WQ8(.DK0BH-_+fe?G@T(H#=-LIXc>79/B\<2b8QCYEBdK4
1)9CW0c6WPMKb2I:\0A(UQ??eF>=.;;O>.0g5V^B++5LV@=a@<+#QO6,fc_c&V5H
A(PCZ=L\;<<#7TK<:IgM+ZWJXNaT:F&]SL3X_A&C(QQHd/][dX1fNU#?H6LWXBf,
0S?e.(8;04<dg@cf1J>eTcb:E5UX^@<cA(P#?RgI6]/NR#U&W(T&RMW,SE9,Tb^&
??>?^cN]Cg_Gd<,98gD#+bfb+DJ.]JFJ(_(+YJW@>6N3YL4.B^/-)X]PD.\OAG^e
_IJdFB8CX.@X.KUbN[S#_:N4G[L,g7@&D+5XYN,T6&Yc6M76H6.^@99TS6?0>RT&
6>?6PZB)US7848CgSGR0/P#Z>1_[?U]8^d.e=YWS;K,MIDG7TYW[2IPXFY22@.5d
(bZ7c3VP-[+93L(a]dDD0>VLeA.U@SJ<d/WD:&dD=.I:aDYb(B-AGa],d?CWb[&+
L5K9d0O=?MW.(6F1B5TF=2N)HFK7..PR1)5V>E_S\1X?[ZAggJLA>XC)d+6B>=:L
:Zb2&+K_[K2J014S,BdGP4A)OZPI6<]RS58QV\J9:G<]W@a+43[<HCgV61g,8[5O
J,dc0^_e_V2&#I^H)fbAY5A#S5cV-SW.gR7E?5=YAPCX6K=P&B2[/Y[42g9H(aCM
U<\A5^-R(cRV46d/VYHS^^;T>bdQYZCMNJ1QZ=#;ME-=?+PW/3a1D;Sf8M#JG8)O
\Jb;AE+]P>FYJ06CI9S[<f9]:-<N]&[/;NPLZGN&YMO1KGSR+JPTA7L1X:2b#;GO
57K[O1:dUS.OK\BT<&0,0YbFY8?AdZa.REf[9@]J^<M9Hc,3D?NC9?W9IT(R37?7
>>ZA..&NTN:Y(d57WOaDT1e:dG?3G6TMU\/?#_<2;a0;)&:<f<2-YRP&8UV.M^Tf
6ScWcdfC0gSG3KGDY4+./K#9/@cA<\.3[)bf=E2.PK6gJ>\;<U?9CbgaBb(,J);:
_?R<)TaNWMVS;dMPI02e;?[7aX/;[ECH@/.d(KLD,M1I7HGU&P[:fH65LIYZf4)f
.C.dc:D3S;fN^-6KKb(NT@7]V6H+:2)<NFR&\aI(N:>2U(RY.;-adN.#7d69(:fA
aU;[UUPI/Hc8UZd1dJUaXD1(2SdE>TUV)g=NOb:d2cMTa\]5@].2S4,E=T)_MCI/
57,EL[B6DYcF>=9Q&=TbN><5bJ(46Q(_3#SR3&aPDRT0G2:+-^6.d6e)K9TVC4Q:
G(1O#]4U4WE#1U+4PQBG5X^W+N?fR?a_Lc3a]2JVGU]Bdf:cUQR967E6/Qa?gdL<
D@.c1X26H4OF0I:FgA2HQ0H>KP07eM6YP896W_f>[YZ5QeeU:9E&HDMBgMS.-(:O
D-O;LVW-;JP=#:8PIJ3>D<M=1DB[Q9AGdGaT\):J<8H0C5_[gNM)+AKd]4V?-294
)X3&<^K^,GUO8EeD3X&NK/&CJReMb.@_/8SS+TI[[bV9>=fTX]We6FOU=,.5/X)=
J/KG]\X3.SN:#DWHO,X+Z^L3RAP:LFF>;,_Q9c_G2Na;K1[09F/g3MD5@TNSBUMY
HT=cR7ZU9KMH;OCaT+MD,)>91e,ZJA+G45e.SN:Y<MUIDSc3Z:8UBHLY5\g@=8dN
SE@U]?c7DU#4YYZL5,Bad[WYe8f\PW?V)1^cOL_KN].FIMREECGOVE/JCD.=E4cY
@@RG2K<H2.>:FW@4K4@O+0fT>eD/4OI=d5R?/\gG46?a@+_bPC-&Nb8^?]BB+ad?
E8X;LFJ=f^>fJ/TPa#=&\Y.Q:P[_+NU]NZ5GWOf>a3HLK,5ZK9T=N9WW6UGAcCE5
[MXV2R9HXfD86@?#)e6<DP:1fD[]08MG4MK/<5WKK0]TK<MIKL?V.PD#.e,LFUZR
N^;LA1)<eMC]16_]L[X50H//U[b\CU=_@E-/1c\acbc(9gLXB#\?0/)De-VC0X:\
#ee0Q)G5Ia53Fa9I.Jf35OV>#AC.8a+fdT2+)+#Yag99WHPW..FEC(7SH@BN4=B]
HW9e7P0DQGH6d&&.fI5.f1b3-6(SO)Z,(\]aT)Q)T#,aUg9C]ZJA+7]#.]6c9K7D
:@e8(?/DF_3CC;B36GLMcQ.GESS(;SOBXd9cg@T82PCV?8^XJX)Wg0TA)-+-V^fb
^aZ_Q_g/J&a]60\M>AgfPM8AB@ODT;^YEeC7AJK3D6gb&Le=F4-f5b7GL1N3SYB=
BO.CN.;<[=.?;/)gCZHAb&0HPHD2+,3(:ZAW,FXd(YHc/T0U59S@]DFR]?WIE7B3
5/QYP,,E;Od^0O=eeI&;G=99L<R4:5Ldae?HA>fTA@N;5&&,PZ<D@N:1.)ZT0=_1
2Y98OC(bQ?AH&?UV/BI2T)^#^Y.-XX4fEFK##IFS\L71_e1a[+UQ&RUNCH^Z;K.c
6R,LZHJg(GWQ97D5^R\DLIVNH/0Y,>1=MFb6aXGC&VV>PGLIGf,^RF(<>cFgdE^A
ZD,YQ^8\XY/).QX2FS>PB6YXBF#:IN5dTL_N6P?AP:K&>>/@A,USNV1AI;f>>CSc
/a/BE[b(=g?6bg\P#D#Q:Z.&E-)TIL7L5:6-C@fcY&K5>W+EX_VBW_CJ,0[\/ZJY
\gdU)XG+M)G6\1=@<(K?0,a[ZB-KEI9\DQFF\A8^XBde8_2+C]L][UK?@Uc,:LeS
M^KTD)+^<Pf_V@1J#U>?D5]:6&GfgWOHIR3c;IECd1f+9MQRI]8W:5HTDY1#3gg6
DM)H^,]6f6->FSg@31SMFR+bf:NEZd(;IWORIVJ+/?;-:]U2,YNF)SS/W.+G;T#?
NTd#dU+IW@YZ(S^U0^PHTL+TcfV-Cc3R42YTb0E7K6HE\Y(_>b82Z.>0Q).9_,M=
-=Z^b6CIHJZe;b6d65F06+3QXZ<fVG:KLN]bOQ+85)c9&-OCE00CfE\R3bb?5Y\M
,NEQ\S]f_+\?g0Md1P\Y8#]10KU+HZ2-S-,fPES:I\96Da_#H7[,_e3G\=I-6B?F
,3VfF5]F)J)VY15A,(L[)BX(C>J7<[^d@_>F1PR\P8;dgM/VZIUgC0P3BMBd3YPB
E=d9MT1AXO#N_dPYaf.X[26E/^G3E+V,.?g?801QXD>@6R;<5VPZ/.N/L0NfA28/
dZ6EWBRU#SLbB&d(e,&JN(3fG2NPMAH]Tf72R2Y7M.=>5@6I++dIafT5]LPZ@[fC
Q1^]WIUKM3ge_2N/<dD\-^c9]T0C4U8:df:XdNS>;.]<K8AKa#-S5e^^\6.<5_4R
CU@NdKVL&W>R4b=Z(-\2SLAa_AbJBQ9.a+F3V<,QAWS7-f^)O;:8LdNY4MA;Z[b0
[>_RFD_8Se];g/I\YE@JKHUZU(]e/@WP+/I7TVI)I^+UdR4>a\/>3^C?.Q;]>](S
O[8IN6)6)_+8c>10A1:g3H5SOY(Y6OV7^Ug&(JSQ9SHHUgdAaI:21)I9I4-a@-4C
@9fb2H)\S_:[.C@4#1dJM>a@6@SOE_CTHd73N<DbJMIe3O9_G74NMJ2)T95K1/=N
4Q,DC.+B>b-T(U^+IdM^X12B;:Z9B8\WfI5OCaPR4g@#d]J1#3F,M=Y#&93>6Ng1
S<9O[9IA<aP10:&(,&&cY/VG]a,JKWF83UbAXW&:0/BSYAJaJ3H_U1-e\N0)=+F.
Q0&Z#MfPT#87RJWcDBg#]@[3JY\A?0=UI#Q[\eLHKa)(6#V6O#BLH&?M98#E.D-J
6+RCT:6CK)f9=7Od/<+MCQZ8g[ZQHQOa1L(AAY\E;A22&QKfS53^)48)T_+6Q+NE
^3Vcb7+PUT6baKdTJEFeBMb&FR+OB@](f@^.(CR;#__K2WM_HUJgd81<5\CM]c39
aR:7KT4,&#[]K;1\=?Qc^.H)F3c+UK<YVG8951=SVP(7e\LFeZE=_]31gcJKE\7b
EG#\a<VQ[4]5N#O0&8;+(B<@G5HH(B[DKY819\aKUO#1N.91HT5INY0_+9C9(>[3
\[:KG43WNXD]LP?Ta@bGcGJZ9E<E)G8<aed5)dU(/>bc<8?c:BI\ZeF/K]Af#S?A
+/\].VP?a,@-Fee3^AK?^H3++E@._]a1cN4)a^a=LV>9PHFEg#2N?Ee1W11d9CD4
g,)2\da]OE++D-CSD-6525e,ZVb0(,A3TZ4O6>\AG(Q=:VL,LH9V8>\A;g5AZ>BD
FT@]-PdS4OJUefQH;K#,+R7S-?B#:8M=FJLP??BJN7R44A0&Zf;8B]d&0W:0Q^8W
>.V?JZMH=,)+2T)6J:QP[Lb#>WQYM4/>\?^Na]eZHB6g^\7ETXP[fa8]d0V.BR]f
E16[>Q@b-K1_.aKT8];H6V#4051PHDK=]Ub?RC_6].5NBbM6R:\44.Z]\C9)[P7d
I3]Y__V:90BG_R&Z2NB^T4cb5&1#:8(?D5[-_/cIH)g&L7Q+=(^(Q=?8P&Y.C#E,
EPZLGbOWLZ&1+=_JS\8eV,)f5gM=cXO.@a)9W=/=3g1e/WK8f\7J/]6#;FQ[TE1B
3RDRBV/UMc@T9[=;c0>f.^IQ<]4LZFPYLR#G(+4LF@Ib0aF+-OM)e=@,aFX/d<KY
2FL4A&1>a183L0EZ]F(YW-./SR:d]^DN.2MGE^Led>@&(,=DAf/UDKd#67b=f1&+
gU:=BdL4,ZDdK;#.&f+N^0+@73C>@#9/;EV5JLY&UF#,L8XP(91YU/LeNYW?MT(4
H(.8fE(W\-0EI8\#LZXa&N6V]MWNHO@M+[c1Of\INAc4MU^4)J0SGA2ZR?(;+3.O
M^MF^_LOb)W-<Z\F.8<W<<OAcE8WNf_Z0JJHL9S+eCd+\#J(QH1g(BLSGUGD7<-1
V5S7gE-[^1b5^-gedA91fb.U/,(T-RLJ_/6)f=[X7Q]1,W#2?M2dF^Y]@B(L)8>C
GO86R3O#@\V2f&2(P)^0\8/K?]:dF_JG:RD1TRU7b\?Q?+g7?8QdRZ4.GDK_0MY(
F,C&g9BNf/S1^#]A>0RN.GJ6f]IKQ=)1OC^)7>E7I>@<\N^d@&ZDVQQ+;Z.?:g+K
aONa#E8NgKV;KWIR_g-CBVH0CRX=YJ[&T)5.(1b?NMM\L/Q4&A^ccX)8U]91R5d6
>\/XRD.5/G)X[VHAPJ#(=H2(>7#=:U^O;IcD;Ua.E8>[2RVOGRX&F@I^KW+?/E89
[</^D7CK>ZLA=9bZ8A-gUH>HM;Y?K(R&<a/_N.(ENEI^:?1]:&W8,&KV.+?dgI/B
MI,V97E365@DS4g[L,ZVXU+UI>C^G/2=\FdDQP_;,fa46NBXc^eG?)U/4Lf<@LGK
c>P\)_2P#Z?/56[\5>f+2Mc>CX)N)&CgU<g8-YWNTT/[#1ce-A<0GZd7K&OEb4DX
928&2\WW0E6NePW(;70U:E+Q]VCB]0Ad5CN,/5Df?/OW,@)(c537G<\..U_\-Z:g
;4^W<[^+=bZZO[HfWAKB:g:6P6(cJ8H6XFc6/OD/.]4a)D6&K\[+AW&\D59Y[[21
8-CM\4S_I,0HE(9[Q@(Q,3XLaDe]0g/Ff>.#X<b)#OKOa4_^8>?RZRR7/Y+85>Z6
2)eC(YR^.#B>>UH=LP-YI8E=+9@bP,W,LJc3/B.+,B/5T?M3eBKf@:4G]/<M+d=3
<Xd0J3Fabb6;<D9J(JHWQc=HKc\0/2#52=NgN<J-d_XDCCQ=,/eX=:1IAH?df+=0
dg<Y:KJcWY4QFAKK,EdNb^42T@.R;0N4HcRBIY)ag:>\Z,7<@[;@=cIVTeB-S0^W
WR(c]<;#.LY;_2CUH1.1SYPX<fU89:5T+HT3;;LB<FHC0=067\YK)C.9MP7-KK/:
/aD:&,H]V&31^+,D:968>SY?ICMF4C>TX\)HM@+f]?GON]fE(6c2C-HfH?901,_R
K88>25L/95YH:bG>2XM+1:(UD)L<3-&cCT6#K[VQ_ZBOV/gA67e^L>^Z1R;7N\R+
A=WVMXJ\(,V,#@XN).g&4<eV?]_[+-]M4WQ4VD4KZNYD_)5#>a]E)R7179<5&+ZC
8H,bc2F5(gBP9B280c.K[ABK@F[Z^HIa)8E6>.ee#>8M:Va9DR[V(^B;^+?fCDJ)
f+8&Q@M9c8f7]NBJDE/2H0b^c.W74d6GC^.Y(MdR#Z;F+BQ&>FR89EbCO@c^AF:2
#2aSbVVU_&>4/^gQG5e>;O#I/0@2;40N:J\YB4+?N>N=313Q<-NTgGV[b@ab/XW2
1@[QK^6ag#?@@?XTYfGaW[&S+PP=9@I=L=gc1O2DZdZGb48bdJ-EH[O9R=KYcP<)
X[8#=b@SEb0f\,K4f2@aN3=B5bU9DC8J;&+dUTTW6^Le):3KggY#2-86e=LcPTUd
;#MaLUHS:]=XV2;4S=T9/a1:)cC,@_F[L;J1=e4NY9)Zf6]?DeMd(41(0+0eTA26
WWS=PKLQ.9B8.=f/P)I/PM364A5gDgNecP6-Z5M(g[5-D12T7?,c9>c6+91<\fUg
ML6H8F71@BPR&\?LM.CMfS6R[,]XXR@Y+AO>ATg9DF,L7.N1IW2,TWTRE1UV__HP
W[&BXbC]eXM#9M6+.VJ\G1<K_8YLKD[NW@dQDU3==UXI\F9Ub+YfSEbK=N)fAB6T
5<.MBNcM>B(W9KfAGX6<JE_A5C656I-eA^^a3JgcSKAFDg^1T<R[<KFD\55Z(VJK
/A&e#,D(,8fMQ,WFZ;cFQ+FDNIP5VEPdS-9_?Fe\#A#^<Uf678\Fa-W.(0_ccf<_
GGc#PK323)UEX]@cg.eE&GI\(g<&ODFd&BT34>e]?MQH@YD#8:9^deANEA/IA4@D
T?L0787GTAbTF=aFYfGRRK:3X_7^@VI51?[YCML;:JX:\9IU,78_b<91(cU)Z(<<
<)Z#QC>7:J0fMD/5.aL;c3bEeXD]U15g:7Y.RVU:GWCQ<MT<BRVgI?<H6-,A,:C@
G5:U55I.PDX+&09:D;c42G4C?:I#G8#c,ELM<_/16\+@KUDG>LLZVfT2.4bF,0WH
6Vf#S[)VS8_AH&eER)80aYBc?LdX0Ug/SQ@b]@O&>NS^)eA/<b1O;+U^0JG1YUN=
XB+82.MH0XE?863R(X.(;6]>1(8TXE?c=HC@?-V9Q20c]L-+&]=5FOGRcJDLY6;2
H+d2]L,gF1U]ER-OY4XN5^D]egMJX1D_38;.SBLYI3dB(e;c789DT4LU=eI:O&)\
(g&@JACfeNRf1CNeER\7?JfCP9B9fg&XZH/E&_?BP5>\Jf/4MIYaPKd6OJ98W0?>
b915S\Z0L.e&-NR0Q-^2(X5>31QR3c)&d+[@ed)05;4OEQ?2FO?bDM&@B7>K04@B
SC1A1/ca,S-(Y\Mf@,INCQ#@;Z_d7:.+?B3B?_F.#MECAW2+.c#PW<?\-?H?f)fJ
#Y&5AaF<?@>TbG5SGe[deP_]c&#P)<cP,PD8gEdL\:QQMNX6<E0X+36bS:Fg7e[Y
J3#&/I((0FO&_;?)]DYL@>CXb,RYf>N\1[;,NTY=D.d,>0K@c&29A=K0B;1[O#)+
-;#&KRJQdJe_@9W21NPYQ-S;I-/#+-:B=JHX)+LWc[JK(]9/afF/S9SIUY0c5c3(
&?7?>/7]C,;TF)8>XQ8@.[Y5-57SS(XUH2<\2;X[aPDdTAMH(7a&6FE[)b5<4=>=
[FUTf[B0P4C;.YGDR_5FXN(aT<4G)a=/[K:2NZK#1KX-g9aBMAU\]O7&gb@1:>g:
bCc(d=GB1LD#TTBL/.Uc_8Nb9#P#R[\DbHfMHY6R)b2BPB3:Z8&ADR55Lf_.9^]V
G;9.Y^[]]C=:,+IP6FZC#+8H8SSA>G\TLD6&=7#,+G.&A2_C@-@O,ESa297cA.3M
\Lb8.=[]?B8?Y;YLDN:SQNcG)[+_U3OM65DAX6R:3)g]IF3Z<U<H_Ug4/;aMcN)9
@1/RU/H04HeF;,+8DRF<eDX,>3Q8SKIH02KT+6:_FT0I5e42g?Xf[cF.-_bZ#D&.
AUNFA)_bAD6+RFJFfV5YR?;(SH9E+Q.#C)05V@)RCbTT0H+VH+C\EJEJOQUeR3L\
&e^BN9?YaJag=OX.<D-<_ea#ScfNFaT4ZeEJ&[U:<,DGYe:T3;^fB3#:+#(cIB)6
EG<8^)17HMGb#6&.3W=L0VTa2-@UJg22<>SQMT^+IY?XM\Z47aadVBV,E9DRJSP9
3SGN36NJD=X+OQ2?MgNC.g3_TLL-64RMEE]Jee)0>B#\O]E8J?/c#c,85P\1=fZ6
Kd^[2ASQN8#_4?b-Z;aX(<JLE.+@ONS/+V5I,<3C?L6a.6=9JW3063^Qg2+<C\fg
M[c^]/(C_P:,=[1CSP.=\AG7HeU1=LWEF5JNd>,EKT;70O1T2FA;^PBX-V#WUa]f
Vb:W5S?Pa)/,R:@a6I];\U1aI.),8:f=Yf6E0gdH:e<4WcSGdN>#6,.,UEKEEG]W
Q&,HC/>NL#F(.I<WNHS5;Hg<#a>^9HJ\5?&g2>L@N)<K_=OXWXK]a\2UOa9LfW>2
(-@(&cYOM@fQ3aK,1LMY\b\G7fG6,fB&gUDB?3NeTA<TQ[aLB/e+6GbI9B.?U=\_
,I-B+M-:a\H(,#8ZK_@01affNWOC@ODB).aWX.H<1R0<2TR^b<Q+.3BWc-ITSO(e
,;VfMa3AAg^@IMYOE&gJ;a,eQ_&PfYVA#=/b0PBH_]/eC-ZK793;A3dYA_^)Ub[5
OP,c,47=XJ9QE+.>5WIe7S\:cQVNG=XCI+B.<^2]c-R(YI]7TP(Gc5NJ)7abHWgb
L).-3bA&fGM?S?LcQ?C[>]C[VZ(R8[T-Sg[VODc[(V7B&+=N[O6_0bDKXGb-gOV+
T-<IVYP)MCPOQ)^^?O&9P9V1f2:I?O;gfK=YT\PLI>6,30<FTFHNSd^QO(cWd,&R
fg0K;VdaTY@IAbc=FTK=+_NT\5UWI=7U)6OfC9#9R2.f1PfV0#6ELTPE-M@6Q4-e
fEd:]M,NQdK,&B_XR?>>L9SW-aJdF3BQ3@IP63^J\b#]T#242#\OM<:;0(Z2US9N
<B2O#4LNaEBc]<H7,HeVB>+3NNFIG^X1<@G9_Dd[:WBMD?\7Q^91@2Q5c4X@AJ5K
OSc)P&CJ(c52D1PcWL:Ue@1eg-a@ZJ@LAe,/FD^I3]^G]6MB?cc_5d4H3[X]Y:F-
9KW/Ve>?TVE,f]e@dJCUI9\DWD\aM1T0)VX2;E3I(RXV.L.g?^[<Y(-MG3UHcHJ&
O+C;H3O+f0BF28DSg5)M0U,/Ye]ZW1VCV5@X/Q7WWRQ)f2g^?J(AYAD[5I9.a9;/
/ZfLd0,1.0c9CgSN7O77@Va3/&=@<O]eePA&0Q,e3+9OAcKbI0POCS,OI+@E-Z-@
bL8K:HVKLYYZdgg5bXPTOe>?.?fCdgfH5]@;21(VLfSHPS,(4QOLPgP&MPP+[6.-
/(UeXW-W-NF<X)YTHD0X(G\T;E,9gcfeV@91C4.&;eMM\GK1#](MI/W;09\1#++C
UL=ZREX1QEW@H<&_1&7/X_[MJa=+,DHM\,dE9Y/IBSaEPVJXC4^VKZ/c;K)OKW3<T$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV

