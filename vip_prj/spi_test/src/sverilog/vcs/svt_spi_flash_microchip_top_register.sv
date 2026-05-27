
`ifndef GUARD_SVT_SPI_FLASH_MICROCHIP_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_MICROCHIP_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Microchip top register class.
 */
class svt_spi_flash_microchip_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Mode Register. */

  /**  
   * The MODE Bits indicate the operating mode of SRAM <br/>
   * 00 : Byte Mode         <br/>
   * 10 : Page Mode         <br/>
   * 01 : Sequential Mode   <br/>
   * 11 : Reserved
   */
  bit [1:0] mode = 2'b01;

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
  `svt_vmm_data_new(svt_spi_flash_microchip_top_register)
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
  extern function new(string name = "svt_spi_flash_microchip_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_microchip_top_register)
  `svt_data_member_end(svt_spi_flash_microchip_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_microchip_top_register.
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
  `vmm_typename(svt_spi_flash_microchip_top_register)
  `vmm_class_factory(svt_spi_flash_microchip_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current MODE Register */
  extern virtual function bit [7:0] get_microchip_mode_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current MODE Register */
  extern virtual function void set_microchip_mode_register(bit [7:0] reg_val);
endclass

// =============================================================================

`protected
,8fZ3g&-&:A(AaP[0.5>.B@SI>MSM)JH07F/T<=3EMM9/]T1d;6L3)))cG/5B\HL
\\a]EMg^&3N4K#9BXYU\LA797+&Ia@_dUITN;D/&,dK1&,\HQTRZLWC&I0[A0T.]
VSa=)f>2U^K38[FY:5W3>NRY&1NTV>)J#SdcQeXaOB:3LU9I@#Y&7\?LEe4.(^F:
+&>J+8ZCK7@.)S8fK(UZH]US-X:LOHaT.ZM#e\0?>/<A34aZ;F&?:cC&VZUf5<\]
^[(Z1V6eUW^J>&OXBbJ1];a/\T>/WIIN/72;aD9K]A]@Q3-#Z[-N&V;N.eX3a\LN
J[^+03<(7=MD[L(=\<Xf)3MI&c^(Sab=fd2.af06QfYe5V4WZ1I)4[&Z.6(Cfa_^
#:E&#WK5S14.2(UG<\ILeaM.XEIWL&S2QVEMda-QDT)G?:2#egRYF395]BQE_4)G
J_cWR1XJPO2Sa&QG/GAX<N8O.G\bb+SP5d4&JI8@]a^7cGZ5^_X4(UC5ZDIX^?&D
QCH9T_(DT;U&#G0[+Y?\,DB0Z6UX[CTe2W7U>UCKL[;0)/F39c,Z;A;E^QS.,SD\
0f5eQ(LF8;\M28a=g-dc6Y588<8XgaG9R\f7e[;V3\:Qd+CC=^?4U@R#6(Q#&<Z>
DF)gUb&2E)8WE[##;?/.K@VK[f>^FZYEZTXGW)E4f&@^773He[)>a;Oe0>P3ERAST$
`endprotected

   
//vcs_vip_protect
`protected
/A/V[Xb[Q:W/DXAEBceOW^X6OAE=UY1>YZPD1gDd[K.3Tdb[)K?K2(D/Q_?-FG4]
gWD]bVKEf/6)^)+GKIFMX</Gg^1X47-.THa>+Y?.?DL24_61aM1A-E@KGMY7K<4L
BPH>WV8#b>0JFeWM]aF99OA3fS\0Q4./ME,QGJ69<D59V@c+a<YOTMM54d5NBW-c
XE8X2YIB89^fS5R/&K\#^Z2Z928VMLM_GK7DVC<G9B=QbfO^U(+/7]=1:[\;AI/_
X.BQOR5&.C2[KJ3V.L)46=>XTGL.1Q,8<eB:J@Q(=dV7E(^T34C_?+D&0MZ\</Ce
+\8;(&L)1SZd)-[X1AV4=L3<0>WCKXH[+P,]/g]GE>A?^1-/5DRf/8^fK:>R(;M?
>MVW@O):6/RY#V9#K9SdAG?45+>c891C_M=(.M1\-N&K\aT)FbXYJ4P<Dd=\cI-/
X&c;BH7D8_c27\:UO>P,d#KJD+LOCBQ[XL5&Cc?^5C=+S)-Nb\]#(NE_Ye\@]aW/
WUXJ0bgJL[CDWCD;Rdd&9bJd^>RNBJUe4J][W>,#QOZQ+(3,USDG+J4UUN&YO&aA
)8P@;\^V\=Q7:4,[)b)=PYMA4b=Ic/()0#4UL.WH0]FN=02QOW\?Q3R<P0-.&L(8
5EXXF\:YR\IJ.8O/bIS&T#NG_C2)-P08Z[5X=dN0#1eI=3b3&W1;>Y]UUe[4WWfF
0W._gI<JWWZ]EH5X@LDSNa25IPE7K.A3.AXR)+b6,\HbS+K8e3[<MDBP0IcZ-?Se
I4F]<;HFbE24_TKHUY)+b>Pg;eVRMK._24B89>W]IJ>A\D;@cUf<J2DA>geTC\_U
UK6)EYV7gJBZB.-F7Y/?+2]#W2<RTO7a6K)5YQ2c/(O4W\(\BKJ?MgRD)8AI4V^c
JMUXY.QJf3J:,]5W\^S03/fG86\;4S1CgM1CKF\JC3ea:VeQXEGMV;9,&7&KJ>>0
<NSVQ4]X&^G_Ob->Y=<g6=KdI#.S,AXX<U\9]=.13#K>ECELga[>)WH#A+=6MJW6
YgV3&Bc:]?<MPG;73IJF=C?)[,K;L:.8T0<#9IL1<R;42;8egQ5f88TK&SV1L4?\
MM6D:WN_L-G\M1YbSOA24N:SbecBI&L^aEGUVPEMPEf[?3#.dL5L)b7:_A^0[#3W
9[E6:IQSADU@IL5H.IeD.N00\LA;,OO.S+6dU89LA]E01CQ7/LZ=TNG:J7eGFTZU
]+1E6/?U=ge]DD5/Z<D(<NgUZ4WBbP/7]RK>[d87&5FP>\2=KK2dd^SPg(AQe0dc
?#C)KdJc0C-C(V+NgA:KBQ4L3Og1-6f,L=DJPbZ9G?9,H2,70da[FY^?SI^32>GS
#]_]TDc=,aK7FDA?ZHf5g&;A.)K[^+cH@R;#[D8GV;DJMUO]7U2(+cZ97dG1E2UP
Q46-_<X\D1XS/f^XLX.\AM<Ve.Ta1_\7f/)TDT1JC]O;W.P)Ub:NMA<-UOC^]dg/
BHTPa.5gDGXC6I4-I5NXTLbON]N?>-Dd&07?C4=1\#]4cY#12g5KN8,g#V>8,:HT
>gC+QAUBV/aC#@,Z.cPLTe&Wf?KO.GcVCSJ=MN<\g-0EF5LRQHLP4a4IaRA+8?LT
;]I7IS8,CXX-9VQ3Y6-B345VOYV:0_TX150SG8d>aVa:cOCBO0GSWR5C>,c4eA_+
/NV7(AC#]I^f.V;K5bHU:)&U>d5N-63>FW)&V>fFb&6,V2ZcG=XV[\4.;^4>eEe4
[QJOE/S],;3IAO,SNKP]ZW-=VO7X24B,Z/XK,H.<&O]TeT49eR[9(C=c?]=NPEUL
Y6g9)^<:LcM7aSLU9)?[7MB[3C0_3.V8AP5(L-dE4@8>:F>E]F=/).-=&.FfaZ5V
(>W#If(09]bP2Q6HH9MR3#__MCZ;gSa?fB[R+P)2f2H9S49:-=PB<-;Y6>DcQJ^J
KHX5W\/0B3\ENFEK=]fKc2XYPF4D-D<6I+7>7,]20@FZ8?761Gec+(]YJ3)JEV;S
<S1d,1C+D&?G2+7D@OEK[52^7G4HF&:7Fe#PC@]7I4NZ^e@+24Mff9Z43ed4=#5R
\K.;83X,WdB_QP&4ELGJG]:M^3\dO?c_WRL40<&>d;PN6KBaGARHa91AH98=eV>6
N89,@,CJA8=3H-C=9@AFZbI4NV8C-54e3_R@DFPT0AaUE4S-SZ>5(P8^Vb:9+[^J
KH5TY^G=c>;3:OW&1#.>3Q)LOU4(;&+=<O71MSUAg9V#3NYJfcBWC?6.PW7.\R#c
?Ha3<EXVAX^1,O,e[T:NNYKJb\7@J2PeT,TKFRE-E3#(KU-KE[1DM[3;C9KO9dOT
W@:QG;9<NgUe\[W+7J;cegcXP4?2cMV:BH@a1053(+O=\)@7[bbJVPJD,f9d-56O
Tbge9^&;CUf41O_.KG#5^UV9XMaKWCTa<>Gb<ZX37VcaSI:V@DHR&.2ZT+]6S?+,
C^0KNd\;8.+ZK&E2gYXS3AcD&]ODEa@aQ^2:7-ZN51]1]1SedSXJg@Uf+Ua&8<^Q
AH57J.6ZR2/_&OfB^)O8ZA_HT>Y_35Y9#aMB7-]@2Z@MgGNV1_I0?.bP5OYbg=5a
6e?>6HO#W[I\)<U/F(=+@a9F[\/,M=.((D/M<QI/fTGC2F0c13MdUK,@3L@+X)b4
<:O1?6cDS/Cf_RDA<-I260e5Ca\&e=X5?O+N61bAJTB9.G/S,].@]g-\Y(W&/Z7;
8>:[NfW_S\P>IC4@;)+X8DPJ)=00ID:Yf[]J>Z(0C(FE16I#d78V_,T87<NZ-YSP
HJ#>\d5K7gg5W)f43<<PC&C6ZWM6ZPQS3I=B1f6.=SUZ^1I.b8RH^?/R,KR#T1#&
(V&UbgLFKC#Z[d69=8#BZUR,<JcZT&SFSEd)dO,aW5;0R.;]-ZYRI@>gX<U&,Z,(
>?4[_1@?3:DA/W75ZIVD0A2&&ZW35G+@Q8U&_c7)g9=BA9U/Lfd7ag,BN?.g\bI.
.;90a^20U]:_fG;\OffCbILf#3E9cQM(T;fa8b##aJ1GXC8^MP,ac)\.BE_b\aEJ
@&8?_LN5I3c##Y)M.VdW;RH<0+(Tg6BE8BYI]c7AMUHKCQT;.DE&7JUR<.7F,TL:
7:Wf#)LcH-6NGbRF\He:BAaf/JO6#.C)cQ43dTM6DFQJJC@->H:H+DdS9Q_>X1WM
&F1.C@:e^>^T_0UB61afg5=AP(:-IEC_J9CH96X&TSPI7Hc:_+F:,:#>6H\LAgA3
HO?C7aa-/[RYVJS.8#)F);N1eRdWD-0\5/6)-C(&fPRY=ae]]PG&fW&K5-&[VGB=
VN(VaWaLd)1^F5:e9M/W.0,F+-=:4X,SE?f\,)K:.#MdYeeU=cXeQ][P#]D0L8B)
.gW:W?0Q+)S=;R&#,+WM5590d#Q-V_V34^C7LYZOf\ED?GTZ@?;JMKcX8N21M;f6
I3[0\&b+\PU,a^-WBbLDH/OSQ93TJNRbBQ.]:.\S<0[+54:_1Vd=:PKE__.ZUa.R
>6DbL#N7=^EYfL4R2<Q);L[VEO,Q95E5U1FK9PT2B+/&L6HJQJO.B-F]P)_c-4O9
81g:Bc4:NUOI0C3N06L,B=L6d4gE3QPcF1^/2VPNed+._MeX4^]\O6J1O_,^+D(V
_LcJSR?.>?,6<?3K-1cH3<G7,D&PA+P8<WH?XMXU8@:(d7OL\C()C-a?>J6HQO,9
.a2/F7fW-)S>7b(,,G1=Z+)>F<.bXX?T,-WQ\JI@<7aXeK>MQBCVMSYV<ddRA7G#
P<=[@Z>M??J3NQEKf=@3]f?L4CE7d;J>\7OE1IF_?D=U[<VR9_c)=/QFg]-^;@/?
Y.,?_(CR^aX?8VTCZ&;-\3a;TRN9H&X^cTgD>>JBI&d\A719H[47K6(^OFVGVKKX
4Na7&0E9?/Y[d#4Y\._DU.@7AGC<NP2WQ.1T>+WcQfY(A)QdAaM7W7;U[HDTXRE9
KK-E]W>WL-HCL:fH7B@I--DAaN):.BWU_fH&CE\5BXQeZEP7B;;G[UT7XFF/<@6e
>-Q\eeLc[/5N@-7Q<SZ=A3C,eE^YC7/Q(GTS]?U<90:7]8CPN?)N5[_R;+[N6?H<
OVF;<J-5:QT;g62CN)f@ReOW(fY.D+fN=L>eLU:#Dg-PV(W,Ad<>-^V)Y5QM=.OQ
d?aG9^5fNS>7OLRAZFbaJG;#Q<JdTK+HPL?&7d^S@1=7-2R-TLR6)da5g_;Da]E;
SN+DP9-2Nc1aF?W4.e)U+6b2DgM&b^/_5=X707F(H?b4->01.c@YS,KH<2VV>g;[
ET7_3Zf@,XS#6MC#D2/<HL8C31TFVfdgH7H9g]Z^(+@PO8028FDBRC8E5C6)NT/Q
\7>M9PaO<;B_C-NdgeOb9V(4&]eP9Dgc+#1A=&R;P(/K#G)6H33fLJ:gRGHI(NKP
Q@HN(I10B(Z]bDS>:VP=&eI_;JFRWbSbDF5@-e-P@f3.f3b1.)_EE;#ZWGHL0GJc
_b@=9g:3RP>0_>UGeU^-UV[UT&U(eJYW2ZEb<3c[1+=BHJT#SfY._YU-IF&)<R&1
1EF.\SZTU[(&6aFDU1__AW\OWVR/b4);.+X+ZKAW@1?#K3.Q#JGX5<FP(#<.2B<+
/cGOY;N3_(]7P6T,[-=&d@&U4@4W6+<<]:>IaI1048f4f22;BI4AA1GcGgXUB_\=
)J?)\c<O=LMT75-EbU=?Xg\Q-7,-E3V03Qc0I0>CYI@5SO>.ecRCcfSF5Rdf\,GX
B=bE(A,&P2b^XBEK[(A^DSK0^:F>e/KX_O:J2^/49[/c>J<d2M:S1#VOd:0ICa13
7?\]eL4KIWS12ge#63>H#AG0,.W&Pb5.Q@WR)&RD@&:\f]7YdOgPgdE2@;1J&6(<
#(fF29\Y1[YYH07dI.QZ/=7bJ/:Ddb)&@@Yg1T06A/.WI^(W9DB[?(&eS59>NFVP
@+8F-4ef-7#]e)C(/1F=bHIK4CQ=SE6^=E3HN#FEC=dT\,A3TXKgOS28XMH)cAZN
\LJXX8,PE@1_G_YE?dHP:eU\=&7/VIS)_BKK>d.V.S8^0MM_JaJ/G2GJcVg3=XPX
W-(8gC#c=,fABJFO)f.:3ffVe@ad:Pgd\+#LKPLS=Q.bGaFC?UM?_1].cc:24&gT
.),7/0^Y[N^K]e<QO&D3X3+>+8<?6cY?aT(a(W[2F?Kb1bdI.XLc_PC<<SHT=Ge@
?[TI>[KRGC\^dLbJO9378d080PH0Qb>E.V)VL2C_;^.8(V._=RW3;K:gRYWR+/+D
J>LX8>F]94_W(GH->F1N#9+H]eaBPN&^&@B0=FT#5g&E(Z^Z\1+)4J7T:Jg<^Ea.
08UDCC.bcd;=].Ne.RaX1-\3I87<b)P[Od>J7O+J8Ze2P[?\[KAb<Pb6Ob:Z2GW9
gD6Da2S]DGEDMDOY>Z0,ZP?@])R9aLR1@c21A3ZNMeNg(-H@6</;EH]O<K=V2[N/
=gBVfIbLI1T_+&gg82cTX(XS]QWQZ9T0^.ZJ9WI=KI&XebM4MO=WFW)/C_b4.Q@8
g,I;L[MC(EV;&>3C2HXM1R+VW5<.-:R@)RM\;<KN[KT7L[4^NT4b3F&VJ,Ga2V<E
G7?AEB7J[(:25fe;R1PP<f]7YAJdD[8BL@6UAN7&_d7WBMDaXJF^;Sf\d@C#<#-K
,cE>=#;Va;c2f\>N-F<F5E448d0SFQKJ1KP19R/:BU;DUIXJQ5PgS)c2(>d]BWBL
GHMLX6F=ZIH\1CQ^TPH7U<:<::MX)a8;QPCXRRYIdU,+E3H8)>XXJ[9b4G=\gJfJ
>_-4L&N<;WAA3cb+EDT;eN3VE40[@T[/Zg4&ccXRZ8#bN2VF+f4bOQ8&L&e>^+2[
;9MLF2>gW[0<U<ML]>2\^KJDEG3,+Q3GO/V)>8AOJ-e_K3T<)4,>#CWX\)/3If>^
a=W(G2X0_-]ZY(H&M471#2;_H./I(5NL7&RL2ZTcMS0Y(f<2?)]7+?JG-PRD]FL)
ad\JY_R5+VRGf@)QK&>843XDNU5)8MHQ;.+I]VA8YABUH6<c13I#AaD+3P\M5]FO
]DZe/2+V(9QT1E&63fW4&W(0JWAHUc#;\Wd-+_MVN89#KA(,G)^0_X?c@Zg)RC94
/)2)O1+C)\E8U-/b7cU#___=-+VA?E3e?6P#S\&UNN>TLFW5c)?3B;KJ;eG6DU0&
?.8-G99cgVGU_),ZQST32c+C?c<.@N3e)W@ZC.@[10^b8EM_[f7N#9Z?f9NDC,+L
9Y+9=0;NTQ7aTB0X1JQGCGP(5CWZI@T@)57]>K_RT,@gPQDH;JUbI)=960T\3\?N
Y#JYL/WZBH\8+7A2.c<&ON3)99X/ge[P?.6Y_J)JAXON>:2RX6adBF)F>E^fMDF^
J-=5-(e?/@JY#\_-?1P_QC8C>d:J\M;]CPY.;MEcc\J]L:>K8]A(2BPO(D+U@JgN
U:DL[3P[\V#fMAOe]1<8CD(aE;SKI@;Ge,GK@)6SD\#(Ddb,NX_bFMQ6G+dO]e.N
AQA9MbSC?;B(CVd/5^,Ef)9CDGC8,YIY^=[?&,KWdYbF]S^NI3YT.eNcK[<B@-[e
<CL46;6+gP]bU2MV3<b1Yb:<Me-47<aC]NC^@;G,aKCTD(+aSIG12PM]IDHW(A]b
g,APQJD91C_<d,(TEQAD0WH:(-:5bJIE(+Nb.MA&d/5LYAHWW#\->HKaNb?G=G:#
.6eFVPbXD;46T&>E6;&F;gAZ5dJ90Y)R5RYbB-7aU2D^V5,C+gCNL:dIE,BMB;c3
=G-aM74RTF54?R]/DV>8aOG>;<b@N/S,I_NaZ4Q\PT)a(M>-Q/<\IVYA#<JgA(()
)9CZ./H?gFbS7M9V<?+DNKE2(U^cQ57E>+6b2XP]^3X675G1D)HIOFY+F?6Y)),H
DYJWK\C4I#;-VM(;G6<H5T540_2,),M3c+cI&FW7))O2GI<20I]/eAMeN5]W5[&\
&D#C=GJ3DYLa&HPXWgW,IMdB.(Y=C.8[W&5-YF#,;-@K(Lf+B3J<ABU<g:O9f]7@
E@7\.UVASI^SB92H=@XA10R1OYVbTC9)9:Q.,3QODA0IDf7LVdK-=0BHNW>Y4=H?
@bA><_[M5D@W\9g:+Q/U<2IE;bLdL<c+AU@OIJJ/KN;-RdL9WS@7WF#_OFCL63KU
e#GJ]<4T6^WeYZW(>R(3VMWda+<g/>d7QIB-^LYM.)STBLYLVLE;:RK<PAHC:.=3
U2J5bH>@-.ED4\f2+9E]DbKY8e<GG=4TNH^RC&VO[T6fW?>de1N7@UPcHG^.X#Z2
N;?D,MFT^Y1UegE>?,O3C\@G@SPET]PMEH3I#9VK/H@d3SUH0:FWJd\:=4-8\3d)
7+c6-HJ0Af#\EPggDMO)NF]c6RF.K\2Kc\eGQ,I6XJG(:D[Q\BC\BPBKP+@_G,,C
AVD>R]RA#AC;UMOK@N)@8+8b9#P_JeW:)@\_^.]<R/WM:_b\:TB.+_[X1WLNHJ-[
)K7(#+.fEbZ15McOJgIN3^9,RGU;V/;AL1Of([F7g6J(C&&4.^F40#^-V;W^4WZ5
Uae[ad#11,SL/2>/3<TUJ?7^P(;ZG5=SNc,7>=aD&P;=S.SZ6fC4N1QH3S1V^0G:
[J.Ig^W,(G+_aY&Zd09Y848S0ef4aV_HaV_YEKYS1VUT&=Q#EfdD_/egHCaNUSBL
,TC&-C)VB9)S&UZY\.Y(^e_#?SAT^EK#L\B(GAF@)P01PQ0<O61BRe_7&CRc_8;D
^OQZBMC65C\K0eeRO+C]UCS63#6FMgOb1CSN6-I.&SMRbXD:V/(dSRTa._;bQ1SQ
9OHQK;)):S-F:VX_U3-T;f/.(Oa?0&Y&)A54=8J2+JZ\)H&DK(0H6J1#Z@(Z449X
.>Wd8J0#XgCK=>3Z=0P9GJ@.J4^(f#Qb(EC70a/FK)Ea<L5.Y+/5]6.1-;YQ6g^8
>Zg?F:1\STIV::dYb8KL;<71[#g1ZEI3NdS1GC:,U:J8;NYD<[IW2DR3BK=1-S()
0S;d==XXGb8-2KFJ3X-=KLL64f((K(;2_M9C5WO^BM.)Wb88gg+<+WX\:2J_d?G]
5cXA&f;cf^2<H?<Q-\#\IU13Xc=-PX2Ob/&:(T>MCb;g0O-(30S;3M_/WcAY#Hd(
9\6#W-[KJDV#3/T(/S]5:9.bOV1N2,bV]V>.B/JaRLdT^0D>SHX\]D0.)8QT4@A<
2[DO##63^M/)T#aSGOATH9K,^Qd7AX-faM=7#VUSS][R,M?]2@LI#FKWJIe^P1>R
HY4A37-SAZ7\^A8IaZE?MMg:e2(P;CEbIAI6YP=a#+.HSP3gE###_cE8aDL?CL).
NMf&L#R:B1?FM]^LBN4gIe4dNfT<[#O1+L0[87dKR(91f_;A\dc8FN:+VZL^(Vd2
[&;-05)Fd4AHRK@[dC(BZAOB3W5@fKS1,8ZYOXM33;2e6?_/0>dA#L,]N=4D)F6e
JF:KF=/7<Jebea@2X_ScJK_-bP.?RKC0M8Sa5(,_1J;1(aS4ZYBA2I+_:a\LI1W2
B](WLg\1QM<FE7O&Z]/V8GE>43bC&N^8SIOEg_O9IaV4_FC]A8+,Q2=cNEgF+X6O
24V1Y]eg#QSfN6^3Wa_V_CF-J(NZZb__gYc0SPgF+\#V[5_@cJRA9KHILC,KJb[Q
_+3AVc6Z_/YKQ:3YN6WcS+\[[^P^NUSa9V3bQ.9>-2b1F232CVLf/67PbL5B.]@d
EU2BJOde4<]XQ9g(0LR66G_JaKQaWR)EA]9aZ;:Y)W9_?W67:[L6Xa<7#V7cHDa\
\<M]=TS@8X9YcFb@P43XB5\dH_dfd8XR@\1DS7.CaQb<RC3T?RF\6X2=BX?X#,\&
Y?e4;3M<Qa;/TbD@N&a2YdR-adT8fGD&@4dO\Ge<B773afX.Q7c^g?AD28)SgOFN
WZA,XagO:7Vc9g@cIV4gg23(>)74ME=K)1L2II&O#VgLPXL+Y-:F]2J>KeAcV@;4
R3\bcR<IWU^9AO7T#SV?3fG0GHK)gFN<]H4c=F=O_F:AXLAVe-<U8U,AEaD?+SM0
=9K83#>RATH3SDe970:KBU+4(\#>]P.e+5??Q=?29RR6K,DQbgcVd+9JD7S-F50M
.a6RMYQE;GA/990];c9;J:=<4QTV/1&C1g#\@H9U\P4-B.2,GTfDLdOZbP]dM?dW
_3BB_?UbNTJGWBDPK6D>2-BCZ7+3_+7HRY[SC=H^[g(/5Tc^\dP#1\#7_a>gILf:
_)F57T,TeGAK3#^Ba:7^a^Sca)@=GTQ.8:8f2QRQ<.fFK^N^:8\52dRI>?DN8IIa
XQ8JCb^&F]J--Fa3:I24,+d,)Ae4M=a4bJ8a.W[f8dCIFdDW\EP)MZ]^OFI8B[+;
5d3,cL4;)DFO/b#1V6>[QA9XI5bJcS@LbGK01>:S(V47&c_F@32O1R7d)GM;;a(+
QN#GSM5#45#:SAA<CgN/gH):^Y7P;/OM-6L;D4R,g<=^I[=]]D=8:J[YP>cC=KEH
&b-<&DC-1,<CF:/:&1Bc]-W>fDC>L0aOJ1ORSScW&d_\gGe44U^CSf7^bKK^AZV#
9cFMa&@=<;gD3PK6b7&,VP(5.G,Y]c/P=SR;18TKA6<W#=WgIO8D(&SVLFX;YFC_
f^KMV?d,IZ?,J8TE<?6[<g7:GX\-,41V#J@66&_CYT]1(dSTU/9CNW=B:L0M-#4D
R;90Y;Kg[/LDR_-L;AQg2SbW-UBZ1BcaB(W)HP.c&@L]LG?-.A[+Fc6TX:4e<CD3
:caVAE.Y+54W^bW?(S5\NWAfdS1_Ba8eb]81,_HIPS=Nb2=GLWZU].cJJ/O]N5]O
S-4\9U+A6K5QWM=RYL,GR-[7LMU(;:)4+9G4dTdb4NTe:0:)7:TWM\@45>CT3X:>
dL#.\MLE]STI@fJ:HS:?<6ee_gB:-QFP3dYBL]T<LVYT<&GA;@&.@6AWg#6fR898
J/&KJ_8)KXMGf_]93V@?>&O_4TX)2MZ6a-fJ5]05\#VQ#G[560,YNYU@U)YVL;]K
-,67I&)M_J-9fcPUG[IS+7[)=NC4K[JE(TN_eU4QZ/4gS7Y:IKe9bM-X2#bI4>CV
,EdIK^E]IKEKST_42^0CO]Y-Z<M>S4&Y/fZ[\XWV[_&K0aSJ,NPLT1J.J^STPD\J
Z^YYed(AM-;P2Af91S,Ya6Y;Iea@f#T&Xa\QEM5@c;g[4#QOH4R:V\^gf>3Y.)b7
dX#19<XX+)JeE(4R4A8.JGH=98PSA,J)\He&/P^9?XB;=8W/TET<,4.S2\QIW6FU
L\NBPO_85TKc(^NT;524L7277_HLEEBL#\G@VRHA^OC3YZ8.eb4TH\,#@>;WAY[7
1A:>)Ye.P=299)3Sc(?=#L91_43c\&AJR_)73#K>=6@)LDVMR)/GNBCJDP@:NR;H
_OKP[P;46gPXe/cELdJGHI_WDgLCa)IUO.<W1aN]9U\?5Z1\aEUJ\XV8gU?XTQb@
Gd+2G<M(2GH-[IBQ@\).Q@KdR5NVe:RYQ<8OPf59G1<H7_W#3@@?BC263b04+UAd
EM_]4H-7)VCF_Yb^R.7H0VO0@\K8D1M.7C_c,QcR6Q.R]DW&L2Ob_[.(O&?YX(2e
E-L/CZG[9^E(-<Y+@B]+)>O/LXHMH];Pd9(1O^Y7Y8=63J1<Gg=dW;HUIYE5DMD-
8<K(UA>H[0a4_[&,7SGP:4cOHAX5B_f)A7C)<]cL+N@?9G_P:=4f<TY7]5a=FI<Y
#QBKR./KL+RWQ<c#C^#:D>HG99gQ(K[f@aS;;D@f/+b1UXfPHbHgQ):3T#f_?]Z5
;)@HO&IA3HMPWC^6:5SZ+Q^5,4gU)H8K0RbQaW_0\6YSN?UYa:0->Z>/BGNP1#1I
>0WRXU9Q0Z]M9609Je&UTE&]g&KgT]Y4Of[IY54:L-4G>L@8:c/&+80H_U]I)MM7
3E:fBKO]gb8/[?]]2]ACMLS&5V92\GZcA)(2d4SNA,7]IQ#Y)#?EK.I.0/Y9Df)c
7:BB,T=\(50?)?WgV1UMaDN&0Bc5K5AJW],d>]>P>,_@[UV9<Fd>-V>YRP.9.FP,
V_90DNO-WT4DH&_gN,PN^_F@E8GUUDOGE41RDO_I4fN3P:7[:@TJb,fQDZ39/9K+
=U6WNKfaE-Z-5@<GMNgH3L5Z>T8?AWLUXW^WXEV]E>Xg0X@fcWX:^2VeJOcR?W/g
C]?eIB.M4+2@RBV5Og-0a]@ag62eA-]3Ub/dPJUVNU+_^#&D02VRHg?A#NXGc=)]
L[,eA>7e#S\U)2&M]4dEWJ9/fZ&18SI1c:O63]FDfB4c&RVW)<gRZ:V1]FKV,;&D
T82P9Fa1H(?,HV&9ZAeTI8bJ]G)CUXAUG#gIO/>FGT18-d0fOOaMXffPFB@+f6?U
\G9NQJ,.cR]/2_N4-R1,\P6aL14_,CAgQERUNb#P#]H=U+IUc_@f]39Y)<eX&JA&
DZ>@SHBK\Pg=G;_+:3XW=E0R3WgQ#;eWQd]d/,ge[ZD6A8S?:aRCa+AZ&bIbG5-(
;S_EE3C5:I4GW?RDc_L\,d8WAL=)IF(NE/6@Dfa>[4?g=K)CbR+Je,a.6+N2#@;>
2SYER7<M5392UHTI4I>JJ\-83@a^dSPXFa/fUCUP4,5\LX^U@3/6^=f9@BJ;GRX4
,L03DI]>V44V1.)R=0R2K)SUFd=dRT;]N=14=B4]70@UDFH43)&^&97QSeT2]T2A
a<6ZVH?^VU\N\fA0[,QCTW,PX_F:a&WLI3B.PYZ&ABKdf+-G8.4WXf?[6I15^J4Z
+,Ib[C<;-AA+J6Bdd=S(^U)bNM:S\eR^<8:77VDGPOU2WPFW>X\,^)_]a\4(bA5U
ZfXYTD?C2Ka@&PL-<AS9(4LIeO:<AWSNH#Ra7\M4M[=(S?3J3aZ@B/0<70>f;A7[
W:9(S4[CV>=2,dMLZD,R2JH<Wg;]CDfDJM-Q25>MQN@#K#G24=[N163IPJ6ZT,;7
cN>eX]27b;I(74&Tfd+b6@6>EbXJ][44.,,aI^VV?M&#?6.JTS<d_U>)1=DCeJ+c
)1e\3]NPTEK+TV^KNFW:M_22E7DcVE>@MB(2aSZgALG+Abg=g@-9VdG?J[/C\;VL
P>cC1T,NgO@F55&TZOTP=-3)9d&3;ZL<0:CKZQ+/8WO_BSM3\IGGR:Ifd)HON]Gf
IS+93=HBT/g?4=MAIE8D05e&WR?^9XFRJGRY&JKOYa&].L(K1.WR1aCgdWC.RAgc
XcI5D6ecgR8KG-EJUG]DCMgF5a;\CAZfdC:9K-[51-SH<4DN^,T(Md1aLKZUVK7c
[T4L(3EFF6)_-a;g<18aGKFMUWg2e1#]8E.DDZIU=M2HK@f&E9g/.33^\:=4NH7M
+JILN(JM1O6FO-g\,&C#,U=:IYO)\.]9)f@K^C3VZ<75f8&;.2SC:2OZcFIN^[7T
7RHcTb[8>NJ<QHW)\[K;\[18Zb[.fZ8cd75c2_b#,+QN2U/71SOC.T.04&7e<7@M
Ba-TbZN7G+(GLTL@^\a3_Z?Pb1[a?EE4ZI:[A)DXY6NWF]-/79)6c2dW#(e[#?V[
_EY27K[Y:AGK&b0:+5J(;e5cefD)MP+9U>YR8NA5/M+9-OL56FX5M^ZWF.#T8\[c
-0+G2,.O#d<-\ga?Wd):^]E57++X4M2E_Rd-_D[>L?ANZgBP.fZH^=eUFJF5/]N?
G\<gb&e+/b_Q8CD7.MP9+IM8c^a@)J2X>,eFN(^2F1:Sa,/H=/OX13C4E..&DKL5
f76I+WK7B,;;4ND+A7HS:Wd(R:E^Za4M;VI(aIX\/BX5fI3.9EKAC(CB\84[61PB
T)BN=0[HWG<<U2)4/=>BT:JJI1Z=c5,]_JL_S>^#g(#QLIXO<2<IbU-1-GcZOUFA
)J.7fQ_?5Z=9_A&OI4F;2P]N:^0B-3S9/+eCV+S7MI3fN,2=>c5L6&P:R]H)bBHF
dC?g>NM+S]A2>9#ZM1g[WRFc^&+J,Q=<A#G0eC1K]-)3a=#e)D;>aMQd4b13a_b^
1Ng6@Q+#Z1_<Me?fQ&-H;QTaB,,6&:QV@B-,67?83VC6Z9&2+bCSHSAeV(>3cC,J
d:-0]P[:eX7XXeF+=(#=gaQcH^aVgLXdUgO&OA__;PeB<<:SW\#B&Xg)[Z6\&<8/
eMW[XW\dQGQWZS9RKK=aZ;JUIIBYQ02F87_WQNXW1S&C(/c[;Ve]-MX+c^FI(K_A
QUcJ6+?2(&6aZ0a]e(SI[J:SCBLbX4Y,MH6O@e4gUB6:Y5S0TZd2XGb([78O]W5V
S)Rd7HO)]T7WFUFUT)D7UJDg^#O6^9f&H1(\\OS&g6[#c<f34\CD[>O)_SM]/XH>
8RS_H5Wg??Lb=/AA?1-0Ic[3UF<bBfDW=X,eQ[fWFJ<\#G4Xb95VCG8F8E:W/4C2
9?/ddg2EXV[FT_S3]2F_9J[33$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MICROCHIP_TOP_REGISTER_SV

