
`ifndef GUARD_SVT_SPI_NOR_FLASH_DATA_CACHE_REGISTER_SV
`define GUARD_SVT_SPI_NOR_FLASH_DATA_CACHE_REGISTER_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is SPI NOR Flash Data Cache class. This holds Cache and Data
 *  registers of NOR Slave device.This is instantiated inside shared_status
 *  object for Selected NOR Flash device. 
 */
class svt_spi_nor_flash_data_cache_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** 
   * SPI NOR Flash Data Register
   * This buffer holds the Data read from Memory Core
   * ECC operation is calculated on this data, corrected and then pass on to
   * #nor_cache_register (Cache Register)
   */ 
  svt_spi_types::word nor_data_register;

  /** SPI NOR Flash cache Register*/
  svt_spi_types::word nor_cache_register;
  
  /** Valid bit for corresponding byte location in #nor_cache_register. */
  bit valid_nor_cache_register [];

  /** SPI NOR FLASH cache Register address. */
  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] nor_cache_page_address;

  int buffer_word_count = 0;

  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] buffer_address [];

  bit[`SVT_SPI_DATA_WIDTH-1:0] buffer_data [];

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
  `svt_vmm_data_new(svt_spi_nor_flash_data_cache_register)
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
  extern function new(string name = "svt_spi_nor_flash_data_cache_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nor_flash_data_cache_register)
  `svt_data_member_end(svt_spi_nor_flash_data_cache_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nor_flash_data_cache_register.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Method to make sure that all of the notifications have been configured properly
   */
  extern function bit check_configure();

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
  `vmm_typename(svt_spi_nor_flash_data_cache_register)
  `vmm_class_factory(svt_spi_nor_flash_data_cache_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
2ENU\B59H8TM):\ZBDQ-@=]d_EX=N_2_47_cP;W6bK2]KC-P7baW5)&9Q\Eb,bYX
(Kg@J7@P;#Ya1)MR,)SH;I<gA\<=@UVVYg;1EbaQ[29P6&3RQAf(Fa<(HJF#U^,@
5JP7E<75Y),b+,#<9>40b+=2Da&_O2Od8-+(SRR&-3Nf<-LG@?)+;TEU6PYGeL1)
B-]0)0cYB(LQ4Ze@Q&P,TST\gIAec/+3DP@13S.H:B&DffJN_HP/&]eAbDcf.AMU
A<6/QJFVcG8R;MTTHaL,YMb3^KY2GCR4DcPGJ1f::NU;>8df+0fL)_OAJ@aOKMaE
QgD4XgO+G(F13Jg4UVKdG\fGKeFFK6\:O[PQJ0#BWFRY;dE82<ebUB^/,AXO4eMK
AB+SecN5Y,\RAbJ\K@YM.+;:US6WTK#4_:Q16)JG+b+Z^KAN\aT5\/g?ETX;KBeB
)2IIN=,KWbdEc)/Qb2]N+[>FP2AWN=_RDIBF#_cHHU:A<\bME)cM+P59]VWN3f(A
:L9,9(0U)Qe[<1gB<>&FTD;c5TY9[AWHZ^5Zb/^/(cQ8L]1bO(6K_/GS/DOY-,c:
XAWXCbf5]CZfM7#.;V>_6(KdM,67>P0^WQ/4:1>QGHKHM+MM/JGY0Ga.H9#f41<=
J+#A\\MJf5AX)C9N>A0XTZNb_EgTT,CHgF=)+J:(bSSIe5@>H&8d;(QH9<ABXA^U
SfD(^@C;VV<X+$
`endprotected

   
//vcs_vip_protect
`protected
c)QZMb5(/>>GPcO6X03\=51[DYOK)6RLfFE)C@>Z.0Mb64IH0I512(:)^aC3KUO;
B/Lda(c&HKG+ZdRU004ZNR@-fb3^SGaNLVETN0Pg0=BY>@1;acPUd[5aC-&(/NS+
2E.UMdW4URe+:d??6RD5ScMW,&IJ=BeY+M,.bGW;>SN.-1C#04YEJ[Q=Dg2X&);H
ad8017G2?XfH+25L7:.[/PMI=G0?gM>&^cK]OV16g.8E:Qb#]+A[bS7HGUCOSD7d
T<4aQ1EfaZcQaQ<B]g?B.B#G>KGH\&XZIJ^#9<.1&+C,5aC/2@9&37gCgT@GR(JP
PO>Ed\+:0DSC,J8-]G:ggf/?.E=8-N79-2(?W&WNN6VbT;d33:+QZ=[W)]BPb[CH
95/E[((V^J6<Q2aE(OSUJ6)34/12UFR.b?N,Jc.#J_&HLV/KW;>RI0AO7K,a_5EX
KY(<E-g2F=FX+05:NJ>Z\a76B(WWFC2.HA6G9HKOV/d)..24/[@=@L8VXaHXf#AK
/6.1+&YH-;6bT2_b-d<,X./#YDMLJ\VU@DJ=W.&4KE<OSB&+[gDc2bPVQfVJARNB
ReDYIIAVa5UG)SgW8:Fa-KQ5KX#:25ML19108B\R1K1?R6I?f>A,6bdb18GJ@X.=
;,M6^8c_^2&G9&=&&[B+[5>>DE/3_(WR?)P[/DXA)d+5baC@aXT35LN]DLZ\-(cU
H-/)F:N\gN7&0/dB]K-85OL]6XF2Tc]Lc55RMg4c4)]\7+\/F&N<?@IO7&?1f7\?
;b&#T,D#a;YO:335b<6E)]IC=S,?\#E6?;17L@2X^Wb/=gVMDQYIBdAYX-ONSE?T
R25=7+dZ;IOQ-2_P)C<2&H2RfFZ1D6KJ-<=6B-QSBO;+?)C[V?JbPJ4&@94MJc?,
GUYIGKe)S@917<fCE4aP6B-PeHWCT2.T;0R;/?d>PY:CI22\#;7gKI2<L&6Id.9c
dW[GJW0T[A@404RU48&<(YO:6g;<#+cGeeGSb3^Ig=1/=;56ZZ9CW7g#<9U7KKWd
\e=2L?R1-I_2Fba]bHJ?>73VETg?9DK4Y5TT;W8g:Y+USNFcN\b&)LS?FX7e6#<]
]/@Q5Y+\P0LFH/>FIa?\??_^/5[5>PI/)SYOFXaB@6;Ue>TV6,8VfUYe=?2DQ=>\
b/5EW\P;b5c-4P@Sc3V_]]<A@AQ1B5MYHDR/CAB>O@NYOU@UaV1L>#A8OTWg_\6\
XQ4Pg4JAF)V5.L;-.gL/&>F0A\;VW^X6D#eVC::C,X;YDPGc,:F)T=5?e^2[VVL4
CO.3X7-DMe135@W^6\2)V(&1-H)MgJ+V&)3R>M6G5&T_@PH+.0ESMH?&_He9RWD5
RV1cBV?EGa)9W8CNT@_9WZ-.->6ID?JL8OAPN]K#aEM/P[f;K[a-.8d=Q;c142>Z
g[gNg\YAL:G9=DJfM\,JP@[b@O6AgYSJcXPIfILS,V]\L8R&Gg7G(XSQAP&)+f2H
[.<M9F4SNIPY4KJ0C70ITd/cCS.2WbXMF_a?Q0Dcf]aKK]UNI#5@IP3G<cF^NcPa
OOZLaf>6:4^]IFXE0aW.3>8#GWO\=R\N=gD^<W5)4_#<+@&9g]@K\^J?Y53#,#4[
<3V:9;(Y]Mf_50Y4b[1Zc1:cY7ED:FK]@aZ[7[4b.6gU\6]&aM]0)Z4;,d0#g5&7
d8.+(XV9)CO:<,,)WeQ3=FU97e1]/OW,\T(_5K29Pa;7A8R3@3_K_K0_J6SGD:EL
BKcII87;48MAO/Y18S9XAL7WOF8FcP?,I-+2E=AMO]RH]bLS/,-?MB[L.UO;<O(P
;BZOQd5,#+D50=@T2G9H84R-X0fF2Z@=H4:CC@Y=S6GBY51USJ#EVg3DG>g(0^F#
SCGLJR_dYUOC1G2V)@+Y&D(OB.[Q<WMb7TgP_P#EISR6fF=-.XH7a_T@],@[B\5A
Y.FWR,ZHBQ<d>#]ZgTG]OgSQH+C1eYf)^G0E/P,V&&/>G<8NaN0=6c]QI#UD-FZF
:VbMY;_;c20OY6])SP0^B89QdKFTa)ZM&/03/EfbM<KeIf30+.BSe6;\0aQR7SDf
<2<Lg)/G9R]F-B@-//dL#1EUYf&O>S\+J4C3g-N[I&;ADR1V[-(Bcd1PUE97T9=0
OTNYQPB:8]8eX[FfUYJ:bXIPU\[dGXGWaf4W(AR\-I]\1N.4(L>AJ4O3KD9^4ZF9
OZGGP>(_#(.Z>FOG,.I5+ZH-W,&HDZBNLDX6-)a;I9V><b?ac>BNa40gKVR(ggg-
a/NYdWB;0Id=Y8D7B;3EQUK&5:]UB2\L6-+-6:.2;PE[AF\aC)\g\XO<S1\g,fQE
Mb,c6,:>C)>WgJ^c/ON&L@RJ[+R?W_f3E0#WB>(5@Q9bP1X2\A((bE)f>B_@M409
;NADX9<VVQ=K(gVT@L&b_-&&:J[LEF+SAH&9?5a3Kb#V)Le.,]YDMJX.?P383;LG
LOQ\=?Jb-PJZ:Q4GU3-ZQ=f#N#.Ye_<ULITV>3UA>^DH(&Q?11=IQ?_2KW/M4.6.
Z,:54,75bL,0\,YV>GHTPUbe=N5.=YE.PT:F8=HU5bWC><FU2W-U8)@3VP,:9C?e
5\[5ZTDN:_^)6);\Ag+aEeU&A1:O<AAV+N\ZS@BSR_bAMK6Jc7)]P\(#+C73[[5d
NaG3I#Nc7<ZAF<2K(QN=<.:0.Gf)P_ZUMOR34N7LfL7=U3XI(V^.04]\XQ6_#Ke_
d^)G?d3cIUJgIUOZ&)_a70MJ;Ka.OV+4S+VPWQAE:+@1\^7)IV:IYVcGAg7)?UN9
)8>:5;\[Z5^d[8O2/+d-M)7^)1TWFb#fTdc)LgQ@;HMQgbH_5S@:e_]OBb_bK6#Q
XAT@&.aLY/g=M?/N2Q+MXG]HNYYe2Cd<4U_b+Q+ZJaZZTODU>I4AUQ3\UB:cU)f\
R+BF\?9B:6VQM6VJHR?XgM)Hg<80=+A3O86gU[/-3SR4K0&#DR1L5VJ7F6T>GYD[
Ve@B;,AZ5LG>IF^^<J/8Zf^#_#I2UN2V+T8)G)H[7VG,B=;:>I\?YY]a#e9O_I#&
CQD6F>Q.W>Q=-8HfOU<X?T:^LK;2Ua.XMbDES-9Q<#X<G)d=YU.9e<0O3bdTC47@
NWJZ\&K:eY3+A;gF6,/G]+).1<AQ\MgJAC,;>4P]#+eYGB#.TU8OMN7_Wd[)D8BU
MI.f=#/+_&1.CKbI:a.]?B)]^24Q&>[2SIQ<NK,/4W3T:^38BJXOaUTIg+fH\C3O
e=Fac]Mf\>J64??B;#B(Y_UK=H7CBPVT3g;S[9CJeDKZFGd>2G5_L6TQe\:U)U9V
^9CQ,f=;=L-Ib=[;1/3FbL8D;0#,QSV@<.E9RS)8DM=_,a7?/(:-TLV\3ab5E5AN
L_e@0[7MQ0#]AB_6ZY+#6UKRDG96Sa5GBA[[SYJQDZ^AJ@55.E;Y7ENK/NPDM:OV
+<DM&C^YAR&@I-<YIKe)0BE1VGVI&9<Cb\D+fHQaOYg5fW<f?^KT>5OYR-#V#MD@
KXS/FTMN_Z+^#Z7g,Y(ZC>9/QVLB9L>&\@^b?4+&BcT4#41/3_;;B=Z;OP-A<I,C
B2(+XU\YQCJ.[7-P=PO9HU+]aXgGEVL5a0/b_bO)\MY2)^/AMFT8g2-AF69;bS(C
(c?)S8/^b(Ha8=fQ.Y\_L3fIH?bO8@?E=fX2aD2USE>S6(d3B1(8>EDG]DF]/C]R
,DHFJ\ecSY6LJa&6I8dbL<Z9L=:cS(H)HR0f4U4;EKS(ad:F?_N9c;UE+31_<)@A
cZ14_HDUJ+C1R6F&V_ZM\(K=IA\S-9&BKEXDL9:\2K8(T/4N5;\ZZUV;P((4SM.A
X84QF2_[aR&F;N;2a/PZ0\U<3[JD@4M=VE/;C6(?NN][?8aQ)7-E5AOZ:BQ@#^):
QS6/g-H09P+f;(GE=Q,Z_Kb2,-A(0#7U:8O.T2=Y/_87P8K-\]<H=37E:F@J3@UV
ef?D9VbcYMOb=,^Z/UAbV?8c[5/ZRK/G-QZW(TW8S,A29:Xc.O,8-(GX\f8LR&YW
0S(7:eU7-EWFb1A]dTGe@3VI[;#FDX]RP_&EeYD+#ee=(8JZdMeR@IEYO5]P,=a7
)/C2:M0M5.c]G;:bcT3Ra=XOXO8=/g=]IUQ(-?>Wa@0RL\IOU8./_GTG;S+##,T)
;I70>]KaG[f1I3IXG;<ab;@/.>](W0GC#=.Z/\]YeW9SPe),V8@;eJF7E.B3XJP[
TaWP6(#e(C#QfL;+e9>^G,>_1eE(7eT4b#ec<1.7DP1_;Y2B-U.NLH1<F:USLOIe
B>IOgMc1eDRd9;(+CYHcVXfa@<T9613GK2Cfb-gMUVD@UVg-1>1gK2\7SSW7PXa6
2AKW&&X]\Lb>&D6ETcA?6\F3P->Vf2EOHPS:-/=b3,_cf/a/Ogf;2@&&6Q3_[bP2
@9e\J92XLa-CbM]_6\Oc8>WMaGQ_F>=@;eKY\3]EgHS54SK]9LQ6N[K&RBP;]R,:
4;.#7O(3>]2#V:W5KXKP9)a5a735WG^;_@Pf;8IME\VHbY56][,D4[I,aRcBQ]7J
E:;)]YM3C71+BLF,W[731JL6]UDYf3@=/R<9:K^[G,X9.R>U9/UI[gM^EGMDW-:Q
@66H8?>,@_?);S@Q-772W7f@>EM>6C0LO?&g@?@Ug(Z@Z?\\G5FA3FAa-3+AB/aJ
4eeZKNM?4/7D&/9OeZCGK^)[C##EadgRX<@[[2cK8?\2F)R/L1J/[EfDeeZ(VNF(
OF@<&V(b;6eU_6e:-b&)>XB<,,:02-2X-EBC+WC(24JcLfI=T.1#0_;1/8NS=JVB
.4OCf_NeK[+gd]#Xed)eY-)<X<9aJMTV5/fI@1QNaOMNT#Ef&Y+<<R=B\UC<N217
DgR8(dL_Kb(<7ZWK;)OV0L=53F5)@gS-WVHfYQfcgW@X;<a>=?328YH+598Veb[T
AcWKZDWCgWW#TC_\:?C#/[.TcXe0U^cYHe1Jc(Je_6;BG9.cFB(C-MWgT[]TW&dK
73]Tfb-AC:-<J:BFK:=b(WJ=Q:geV<B;X\Lf5LEgQIe:][Jb6[F9@NGRa^6AbV0I
4g:I_]/Z27U892K)3>AWg<[Q&,&&XDTGfZTZg&^GVdKL<bbYL3O>&.PRd@4N4B3>
S\_G<]>KXNcc_+C>H0&:+e/>AU#Rd\<)DC,&32/EaU3\=dZY,\>RI62F2,_[-.Z8
IP7;ZB=R06MgK+BLS3aAP2:faFW4)gQ6Gf,eaAMRD9[/D/:df@dZV>eHM_(8B)PS
T=OT;6&>dSMYL?X7g=10MB&gc_T+.G/:M@^Af?];@]FCSEdPM\#fYb;1ELSFBHg=
a^W,cT#Y)DH#]@baZg9JYfG_PKa?S7IT.TAC+)fU>.-#L1>LFEOEV\EX6[7^G#Ge
<cb5A,ACW/<fVIHH@<H<_/.S87&f(\_R#HH/,CO=N&#DP\TJ&c,XVg/NAO[=G4IU
GF8,Y<-&78?_f<cZ49\>ASa1Z_T[:KWU?[G;Z;M_gF0@3(J/3/0<@N#=?)P(U_H0
fdAK2(<F\?[N;d0-PK?-I,K@PK4D;3G/]/MUB;SLM/BP8TI,61>]E=1fT=F[HTN\
OW(QBE.6ZV0H\L;=4YCY?Gf(SO2(Ac\AGHLO+=fgXb42G+Oc45=?#WE&&6LK((.-
?[AFMEE/FBe^,3[6>F.GVG^B@X\/4;-X:UBHGECbb\D/?.g22I2H&fR+FYee,@A=
>Z,]ba#(2),fPT1/O+6<TUe/9L[7PFV7bEfTbXVQ@dLI)E-gf/4/KM]T\Z_1MPcS
>:JY#d2)7AP&Sa7I,Zd(cIa7?L@2?E7U@^7F2CD\?Be07=M^E3c>/#/7B9[RaF:>
W/TO_UPY,#9FJZ\V:aT))MKU37VUV<&?(7YN3#>Q8a)(H8=R6Ob?[@cRTJ)_gZMF
Ifg#:eAY#US7>0OH9R&M23[_+1V1WRQ#9)#PUMcKLD8-Z/^C5@PaKP3@)PY3F:S4
J;?>@TeT?U94/BSd-aQ:K:)8]aF\[>]I@KE:&(E[0=VTES@(G?J_(?)LUT9e-e\.
42K<+7S:EB1f]D/;U?JcJ1N]H0eF^d&cCJRFENSY)9@>TC,LE\&d.[V),Z/M(<8X
V\3\O>S47)91Zc4HBR8@dFDdO,D[AP^(>(#::5<6@@/IQ<SNRQ>gA@,.\9)HW-b_
^cIX>Q8_X#:>YS&0(\G;-8Q(cCK<Yb^cDEf_SL\f2J2@+KZ\MEd,dGO](?>]d.GG
R--+T,[8)S)#7[^B8,JESR(7?1K6.6VQbGE/)V?9^N/J2J;Q2f7HIe,VbI])KPY6
g[;M^A0&Q@6]Q:W<+;KGZJ^08A^@I-2<L^UKV>38^^b1LQ_;f38LW0R=Z<\d:c=/
N/TOTR__<FEUb307F+MVS<V&Ae[fF;KM5]<IOCS@7EJ(Z#FG(g9XE#JLS=ZI]ME7
^4H^0+BX,Tb;H\T&f_?.Ue7N62U]fgSN,\Y]CMQ=M<X>ZS^^J[,;97ST7/F[dab9
/(71/Q#>B;K-D7GfW38X,2TP1<6#/?8I\>=c)1:5(=Q][(+)23I1e3ISg0>H;EZ.
^/L[Z\J<KHg45>M/V=(:COD@aOcKM0-T^Y;8feBPANX>-d0YD#HDHb:c;XbRIP=O
;V?eP>#0_OcfLH6M@_]?7/H?<_.Rae7.(_#:@2)WCN&?Q]C:TU<\,>IRYP^7Y&(P
=R,;P-08H.M(;EI.c7113bd+[d_RbBbOV;dK5[7MKf)]-1MTY?3AOQ-1ILPc(O]J
?.YKRgRSb.#e@EMZ.f9@b-#V:PA3Y^JOZ>A=C>1L+8ZLgGc53NR7?L3A++,9eZfL
OV_K](4[[]]We\:0//WF1I1+C-P(00>WJ5eDcBeEBL4K(FT<O)Q@d?_]N7SL;+XK
VR;^F]4G_9I/S0Z@JZ17F:I/CT6-VVRMPaLESXObgO@,E]c9_P\UNGY2I+dS@O<0
_W_C4OX)<+G^+W^aaD#3+I=+1^T6O=IFHN@V/J/>7-QfH+E5@;UXL-A0)ZaRWIKY
_PQ9VT7ec9T0\&2(C..^8UH10cVN;Wa3QZ+GL__)ge0;:0LKW#X<_O^J]9<#?QQR
A93T:#\S?Z?WAgL&aUdfUR33^^:;(&^I6JK+^LXU/KbTA<Zg?L((Q&PWfU_)b7Q@
I<gKP889E.\P[CZRR-Y5T@C6^g0+dXEZ4,+&C=I2d9cOc_GUg-LZY]HU@Vd0LNRK
(cQ88\#CSW#\@NY&YG?ZQ7XG8c/#5Qc7)_Q()?C/1,6S53J9?Q2E\-L,(67O,\#5
66\GP/&Se41M_+Zf>9A3?)VgK\41dZ)C6+6ITEZLe;8OS)MgGCE0a(B(Q-PR<N5;
W/ZH;VM4C/IQbQ-cG7[BJ,]Re&0Y=(B4,DSGA.2HGP<>_OMM<)J8LQZ=&6c80I=^
ebBT;^@#^>Ag/4Xc6.8L\;K@0_B=,TcLEdQ^H8.HK9+SRYeg51aa2O0M2B<Y=Ka>
G8MNJQ:I;V-_g[GYZD;E,I2[L5^9[4KCZU./\Y9T-MISN>KD0d=?fKN;-\cND+^A
bO78d.J147Kf]]gcVPMVA4YUFgK\W0gDgc-EaQ4b3#7;I_Ae-((G7?;8=H8WO><#
d_@^[0,NWU^OVN8=[fJ=#B7^NF^gC.6DF8NODc\2MLG@@-?1P4RYc4B3782+Y1(Q
1-U+X0Y\a9gIJ;0KgX=5#=,JU=)1&;VGLfgQF,2F;a/FI_\)_R1.CK<7MQX_(NG?
&K<@)I:R@6HHO[cgSBBR<_MZU+&Y+K:fR9ZD;fJRW_04-44L.[6W=_(+RJd\[+6-
L3W&IL#e,OKBb]J^42ef7G=b4N-LEHacIG/U;.R3a;2(C/6#ROc9bV8MgT6<FPJ_
HUP-[@#TW4[R+RNRO\.#AO_JJL7W:(BQ0IBI)_G<9CU0\WIIJXG^0NeDA&(0=CCN
3DR-Ng8K0b&HI,AIB<2N=Q7\OC:OMJgI0cdR.Pa0OFb98Qa8R:()1aF978a#XJ)@
B@0I)[H;S\5@M70/P#baQg49a>8b_P.@f=SRS>C+&ZagOCH[L(YAXTY<:OJQgKda
aK5>E[3A.8ED<DBUYVb=F<BNe<,F^^#.@?f0(W/R5P+,NW(S0&>\HAV>;MKMX6#C
.,A)\A\Z<>7a&d3_JU]Ub3+A7@0<;@#+&(^ZZ0,E)#8T]Y4BJ]?FFQ8O/0)4\@EU
,\&AVER_DBYAMaBB,c/0Ee02[F]5I^/?=f4^;QYBD[.XT_8Jf??^P(^J84<[=7&T
ed\U(L6ZUIO4JCCNZ3Md#</#935_Y4AL(X&2F<IKJTG(fS]NNb-[SC/QUgW(3LSc
(:T&eEU+EOX>T=cgVA?K;PU8^4X)JN[:KW\&Vgg46NHU5UD3I_X95<-)Z6A9J+4f
;6,QcPU(+3+d:<F(WWf@g9cS,2;,>38&FZR1=E]H-D4Z@?5Abe77IgDGdBI6.WR9
Hg+.=X?983gJPOIPGC3V@b=d90/<0WAQTU2&1+NJIQ;7dD+Y)=1/9D666@MIF;WP
_C6G+f+Z#eGcJ_P@N0fa?C=Y:SeQT2=IE5CN&DADPV>_]Y/I<-1C_bK),URLR7)T
\6Z]71(2^;1PeD,4#QUW53cPD:1JbF4Hb[ER4&4]Y>8,1F&;QBA.E5.8:Z2?G?JR
YUJ-[Q;CB&HQ[Qdg)RXLOb?#=B.=WN[.?^L-_H&DN9B-DSVS8YSXGL>1N&/.BZR]
,9&-RT\B(^59UP@-3&,GaT.4fP@OQPMU41T3W)fK]Ge,8EJ#)a.3(SbFKC;H(-,F
YQ8^4b?,6:+7-1_8SJME)Y29=FY#If20KP3O7O6#SMXVK3J8P_)gE.(VXJCH.KXY
5A]dd;]@<X2VXd?&OGWPeNI;\(d:.d&9-0^C?+@-S/^)8GB1E(;aN-a+BF\ZI8;C
fJ2Tb]6@U<6/497Db9Y3).@;:7_9CeaH/VRD1EbP>HKBaO\^_[2LF:0\HWACPH2_
\H+Ae-Q54W?+#Y;(9=PU9YHEBL&cDQ6R8O(/Y^CWSABCH\+dI8f[J;dK>XH)F0E/
)W^M=8\<LA&NH>cPFOIPV2Q4P.U7=J#A#XaSGWOO;QP5Z/A:cB^4eBZ#Z><@FM:a
N^7L8cVc:gAC<4@QE0AN5I\ZO7)gG,a<0YdWggF[KfWEY]&9IAc;?2K&dW3TIKL#
e<<G^CDaS32Q6-+Ue/Q4C?C3PZWR;N1AAPH7:PY=/AP;c+A\-?RLQ<,WbZ8]1W#D
B0LGRR/1^I^-\.SF:9<8W8-R#0b>KM276,RN:ZQ(G:VYTI06PS/EN-EHf:<C+]cG
Uc#VL.C@C<Z[eAH]GDN_P7AXAZM&Vc+^d>XKE;9O2,]K;,HL2VQE:GcDNfRR=F\J
Eg]1CUeVT_TcT5>d6H^dV-b>O&&^:WYF;@c]3-M8VPL2>G]+1b8@gC_X1CM3)/I5
9:NWZ6aK;C8;aS,]\Bg3_,[WeT]I/B);dF(TM(SO(Q5>W5XfQe:PF#<2PN3\AX8]
5Ie]-#TZ[/+SJHWFf68[a?DSJ2^1(BD_KRJTF@#5ScBcY2?]V25+]_EE.W:DZSLg
\MM.2\Z=^L@cd=5>Oa5.:Ga,BI6?a.cYBed,A>2O(RZBP5BO8\H5M4+9L2#^<FE;
aIC8>^V:=0bF5Q0eCd).H3A;-f0?FbU8AA<DgDI>XV6U3.TEQ0R<OCcf5b6g0;JU
<P)Rc,-;1d[^6?<04>N[F2bLUHBcD41/2D?AXb;EPRT:de)5I[40;e?D)6f_\>/e
\U4XUY&cQ_<?=/<P/bA]14]L.)-:>Y8EQBB/HOFAIDdE-((N8dY:_^TNLWG0PV,W
4gbe/.)-dXU6?B6cXRf1>H,TUcQ,:R7;KDO3J&Y83Pe3?#A=XJN;]Bgb(/XK?=5]
e2J<3:fD3ff/\0.A+6E2D[34G[TN4;K0LZSg@)Q4;61PV?.=B>6:OQT0fGNdR>.E
Q02dc:Q\5RE6bGIZDB@HNGLC4A:TZ,3E5(Rf60,8EE9U(1Lbf=Ac(7&?5KV<E/NR
_JY<(9gTCW++aK#)HB_R]M,NeP7\0NG+EXCQ5MA_g-TG_bBYB(+]I?7gLFF3&QV<
;AIaV[H]1QH&^4aA?:J<\;-Va]/,c0CZg<?JNK--a?5U]bM;DWYOXCEO.CZ2#I[#
5/>;:FS=<XZ--+R2bZ]XYWU9VV]7@J7DaO3E[Z3^ROL/M9)/ZOCH^UG^[7<@J:/0
8XFXJ[.ILY(@2N49/:ZRN0&aA?W,;U9.e/JDb:)d.71:[148#_.S:cWT_:COZ8;9
]B=EdFAbY0WeF?)OPKWHTaFd.=:;.aI,@R<XAS-M.6?/Y+<T5QPQf_gL+_FSX+7K
+P&\BF4#?\[7H++](bJ&dZ^H_\LW/a57[EcZ65EK6a=<?PRBZ49)RIMLHPBGBfbU
OQ.Y(@+f5\S:X(0JfQ=2@7JUX_M30;B6BT>@OG]Y6,],&]BO,c=HS,,[KS/_TB^(
Qg\8S@+Y-#TLD)HK<KM#Xe@f?A0.SC)fE6eC\DG#TX26]\a^BM82_,W1d\EN#YD:
@f6C962(:Pd\f8B9@G)Y5K(fG,MHaP,ZFW3<FE[P\c,ZB>TALZ[8JL?P_UDbIaPZ
8T_Y<K^aN6gC\+c;f^ZN3#ae_W:b_SaWMY(M(&bXP:1:WVI.JI\TUe.gM802JIJb
P&aYWW^6-:C<]\3W/,/+J^)UQ_Y5a7[G(RU#F.8dR3(TK[JJ&=JCf(D.DAV?,VXM
cWaEJLG2L8YX\V5X=BU765.fZf;3Kf2aI:Y)>@)2&NW].H:6T9-bGN2:G;&A;:V/
[(,\GJcZ<VZ56QJR\9NNM#1PG6SQ@(?,)HW^&C4Fa+N<@495O&=^==Rg&FIC\S1:
PX8P)](923F,ZIUb]HY;.-48UKTQ95)b04,NFMWRK#4a=#ggeIFcRVILVKF#a>SP
R6,9SYC5HAB#=S3BUcf/B,9ZbV:M1>SS8(BTP\&\PaQOC9>7+LI_\W#T2I(NMgE>
S/(LB:>EN55Wca#1RY(B?A+K(Ja+^f,8OeCLPYLJFVK&fCNR.d_YgdXU-SJa?g)7
:#O?/7_2]WX4^QNf>;BD@Y/)eJ69D1R13J<JA_[W\W^YRd9UEJ+WF9eMJ](UdS1C
HeDHU,(.5.Z##bCV(;bEL1bGb+:@[gYeb&Zc@Y3BG?.=VOPSL@&FFg1O(5#]CVV&
IeAgK/Y<-IT1:g]Q-IUe[X69DR9F)MBM&+-K>X2G<#)>OS20cK9Y6fJ)AgOY1?N;
=,J0Oa91bLaeT492S;A<d2-QcN[?(OLVE5S@+?LI#1+;>5,8+=K_NW7D(AAe/Wfg
B>A)EbOB,CQO8TNJLHM?Gb)aDDIDXF)8QP[U(SN;(2GRX3;<]H,?-UBME/0I#8ZX
3_(IPY[0daOH;C=9BSNQUU:?@a];F5CRIaB@LPX_(C_>:BeQ6N/>Pf#E#_P36FAD
.A#AWIM=K=@MaC0Y>-TVYG4;;VLT#6;Qegc13f,[R&J;S;R@FJd<APfSb,\21a_-
OMZJXNI]32C^4@1g^HGS=g,#,R//F8==<-L(=]4=a#cKBa>g3_)>2GO:T/D4YGP=
R-gA;4XG1?9BY-Ca:E:6GAOO^4/U(,)6C[]GRI)ffI98B->;E7Z4)W]D^\aEO>^U
]fda+2NE,P?N1fDC)dZ&UKIQT,g?E>adO?SXXGX4VO7<a0V]c4B5(BN\X&L#Y;T3
Qa@=,G+P\OGUZX\NM\dF.(E1IHC)^PW;D^/4S,^&I02C+@7W=ABVQ&8KYZ&FgX<C
ccI,bLUb2JY-0)bES=[QCI@BW9+BD)9H6<\_P\)Z]UW_b];EX5d>Wb&^12@,OML-
VP:UHTPRTDRMY<ZHgD)eY8LX)\)YY4WcW]P==fB4^I0N,-ZIDaEV3Y=N(;:L).0N
1F#0cR18/K?Y>?NbM941SJ=0FDE+[QU<\V0^7,DbZDEb;8T86@W_@d.8+MBWB8>-
RO6_IcNUaaR8K\e_G5JLP4PJH[[YAHe;KaL^?#JW.fW4a(W3E@V\85;-+XP/DK0+
EZ7VRU<;,W)D54^YbY-_IK3II435OCF0,JPbc98VLS;87H3T/:QUc0R12EXW(6DC
<e<37d),:]9LBWEIa?XeRQ4_5@5R(E#),_WU;NA6]=T2Uf@4d+7]F2=GFTNP06JA
4M.A7Ld+8YQB=faG#gGSA\@:LSL\\ZH<a7I6:L.I+P4KIYW_DO&I5b)+bI&A(&aa
:IUMW<ESP&>IB<XR7^Ab;3&OH6O5TD.#QEEH[<<KB8M?H\T;BZ1Y+0e\DF^geM#S
0]H>^,I639368P>(+J<W-5JOf@:11/b_8gdKI^3+?K],[J[43O]Z32BNc&QMH_44
)SXWJ=Y._gdeJfW@R1<D:O>2?.Mg?#/5,AJ1:YQ.Jg[YgCTE/M@_VfKD0KB&-c_)
/Kb+BKUXO2OEG5YSaOcP+W#+3&Z05A[b1,85<=:&&=bGX:4=@TCNW0C?A.FC1?Q?
WP,\<:^e,CB(LI+MW;BVH8OWXKUKR)T+LO^3Kc3g:1&EScMLa_TVQ.a@0gc7Qf@1
H\.ZbdEP)WF+gg6+^J\FB>SacI<Y&(QXYTFV..HLJgCebA>[\.7a@ZOAdJ3TX4FC
Ie;.[3=<T5_DM8)A6LH3M^VTd13>727-[RKHe7@WL.I0(U&D8//U)&?>_-XRSR?J
E/>I_deXM)/W2,1411fW5c[+e52HK&;YW5K=G+^NE)HAGc304JP<HTNC?Lb;)SXW
IS0A=)(+>VeLf;N/C#A^6_/QS4gY5>FBGCO6Q#9a(DQW-T?a()7#QNX?Ed@3N1JF
6^+.gd(>/,8gHLJFS?X0.SUHW6#1&#9IJ5[+4gVD33KVZU2ZLM&TDHIMGMT/GWJX
T#5ZU(=-6E\c.WM)WT+8W5K,#QVbBWaI\#M[O>6UKYcXE&2VcGZCf-?P@,c2P,DT
b\dKeOM.4EG^NF_^I;J2FZR2,G,^8NOO-BP2Q7TU>53UN1GN=KKSRDH3VIB=+W4d
.f<QLX]I-e@\-0G0fQH\JX<IdIfPaDJOK9AZNS#7OH1MbgAE(9Y(Ud32/+JIdE>(
Rb>[CZ(22(KM1LW+GgP2&#0(2H/dC&f>A]UTC)B_)<dT>?2M=GAGRe0::12E)RP6
;PY]EZW7/94K:T9=R&_Ub?&O)QSM^1cBY?9b;gAORU_>J-[7MP-02>W5Y^-Z9ZF]
VLZT+S>];E0(CG.gf3UJfT^c8H<f#];Q&fTb[1Ff5T2T&TH^@9B[9Y@W2aCQN<U@
7@O6fT_>R4D>6Faf+XBTS/>Fd)dLeTSL(T&Hg4/a?^V1S\fI)LV6]XVgYeRgK@E&
Y6(gbN>0+[cR:GHY_3aWHA1WI6;4+BIOgV?/__FP::_-)T8ZU7I]a<dV<THI/HcH
/=_+D>CDPANN_]#6\cVYE>G<G=PM+J<U>AAVQ=WDXE8#\gHEF]N&ECTb-//DBRN#
Nec_>[ffN++Xe\9\G)3-gdF=0SCXc\R@4Ya(:X(E>AIJBZb<M+\OQX-@@24e+RTb
OT:8WNfVf4.6,Z0.eb=/CKA-EC0[F:^1F1JJL-#^<03.eTTIc]NXd=ZZJ1e47gXI
YO7B9)3f=f64SfN4)5_2<MZXMJ])ZgN/-f8>\+)cbZX9/^.8+N@JdV)X\8GQ@1Z_
eO979Q74H&cKdK2Heb;gLK10dd(Sg/MM,RV2IV0F0U6L=aPM4,Y@LcF6cLS#)DZN
.Nd@g/5)9.1S;40LCE#d5IU7CEA</8;Ue7\TKWF+;.^bVGV<\[/_Lc2(R;L-f6[?
\:?:3[+DS+\9YPJB?<<S)3?LPJ_-)CLUD=(?GO?3eEDQR\?H/>KBc:7[U.83(1,]
S/#)?,SO@P,)(M8E=\\B,]=9#Zb+[2\O1(6Gd;b@c?]K]5?VKJJU3a,>Z0V]5Lba
1S(ED-,3eA&0=WIFb[CDLZ]UG#<=6F3e1X^d/@4^fJH.FZH>9eY5,(b(-L8L6G=[
e.Z]YN\C339/19/ZV9<STM7CdPIWH1NV823Dc\&BdVHN&SXRcHg(SUAZ)[>.6>:X
>KHXBGC2#4C5+L.@Rb54)a6718IQXcFc1)#A]?[ZC@1G<V.X<7L#K<BVB4X&/\S0
eMCS?V58B7N/QJ2]L?--+#<RF:+K3605@9KV01b?\FAI@\O86ce1Q.&AI,>WJ;c]
EF#?/dL,?FN6#OHBG?Y_ZaCM4fT((53Nf5&XbGHg64WRGDL(e1??BGa5ZR3N;eI+
J\-KQ&-M(DacQ)aT3N2)K6_aDbB<B=0e[FH)ff6e#5.N,OX,c1.Od4[XA1E^KI_e
g#:HA.Z[@@3_SA1SBTCF;#\FX&53>X?Z6NC@:&1]VdbaF>WCBfLJ.XV\NQeca>KC
B5V86@FUFF9O,\1L/#V.G=M2OWK+#N-g3:8T9T:&Jg?FU)@@&VW9FOT-5,G,7J\/
#@OYFWBK^L,0PO8<KG(XJ[\XE([UO_FV(>@?D.6B3ANF?[1&-57NTbgBMC:VKdEK
4<,F\d^M]9[e-g<:Ff\XFaOT2GJ,1759YX&&EM[9(RH#5O]6K#7eTLSR&#9g&ZH^
4@JP8:49FN+.NW2HA18J#?.)BS.R9V72KKP5bFL2:3;)RR_fTdQ7S)U#65<2:Z6W
)M)E5?(Xe_;_9Cc66I]WU55Ke8eb,/eWeB?7X0Dd8)C?L?LG[&I2aAPQ6NHNX+G+
?2=4.>b\^Z#B48E&66@,4V<OFALY]IA1NJRbG4N:\CQ_>OX]JK1,V+X2YE;1ZZW?
Se)QNY4[U5Q=L(V7gO_/eOMSQ9)5@fO?:<2;5>E])HLV_[K>:-YY14dZSWT1K)XO
##DXTa53JGQ?d15489a[b#FZWg)]AO??,HgP>&1^g]Id.g)gH6&<U7X#09\<\aRL
>I@LT6^=B1dOQZM\7KL/AVNdI-<Y18EDGad0gPfBZ,5D4-YM6^9PQNW@R5>5.T6N
&I\DYZR&bbOH74PI\L\(,:8GI=a-7.<@_4WA_d)\e]^Bb7GZ5I..^bZUJMN[dR5]
04d@O.33be:dAaaF9&_WfT?@JSd5(-a:]I.7?A7e388?RD2FH#G#\Z4J7,Pg2@c&
@3NH=<6H0KW8ad0V<eN6bOEK]MBR\V?3G>.BIBXMN<BG?f7>MWB78@__XO>@7M5B
UG<cce6Z@EGSTfM>06Q.:Ne9X0)5/R/C)<VQ,0OOSR<6K:[4Ie6QbM[IZ@a5J&-W
,6^(@JY;+GB;XB>F:M_/(TJNPc(G^g^dAQB3I>K#J2\d]Z\?,<Z>fg5)\8TPV)FE
:#[&QIUdcge:;a]IDL@,<\=QH5B_Z95<M^FS=fRdRHE4UAA4,[Ff3[fg[V0PSaP0
fc825[R3DEVR;ReI-D5]Q7__ZCN(M;^5dC@)1S<Pb=BY&U3&13CHQ)Aa(0+VV;B>
FYTW#));^E:WP\V7B0SYd,XP@7<a_.3J(@50G.BO]/BWWbdDR;2dK;;0H>P?Q8O8
ZW3?9gLK0Y-H/TRg_cN:3ZYUH<43I1TQ2DP:7YbSYg;>cE&KcI3.gg6MX<1V5bBf
/>3<;aWIL[F(RNBAM<.?74U06F4_&6:F(#0E2/_1FN@J)U98[CJ&GR9>OB;\LM?A
X?gdFW[WK(>;edO3^^/;d1^eEGXgf;AT#U.C\CAaR3McIR8U1^?@<E6=O>Ue3YOJ
4LW&9@#@a5?M0S4Nc^09b^<JE+c@_EF>)#MND6IF@(K:>35WREZCD5;MeQ(_TGW@
Le\=.\bQRJSa:dS?,CN1&?KJY>V7JM)LW7.bZ@3b5V=aB1FG0f7D&AL)9A+^/K9_
E0?:DA&6M:dca6cI7HGP30/Y&=:g6\M3.Q/VZ7:BO?2EV6MGP8MTWU]8)c@PPPcT
5^gUUG;RT35+J6X9RC,XS(PO&2.C?C;OIFT;>=V;[_A-/ULLR0@f7(]8N$
`endprotected


`endif // GUARD_SVT_SPI_NOR_FLASH_DATA_CACHE_REGISTER_SV

