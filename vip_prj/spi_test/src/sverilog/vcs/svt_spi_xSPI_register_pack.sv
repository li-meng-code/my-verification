
`ifndef GUARD_SVT_SPI_xSPI_REGISTER_PACK_SV
`define GUARD_SVT_SPI_xSPI_REGISTER_PACK_SV

// =============================================================================
/**
 *  This is the SPI VIP xSPI register pack class.
 */
class svt_spi_xSPI_register_pack extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** This field specifies register name  */
  string register_name = "";

  /** This field captures register field object handle index at svt_spi_mem_mode_register_configuration::xSPI_register_field_list */
  int xSPI_register_field_index[];

  /** This field captures register map object handle index at svt_spi_xSPI_register_field_list::register_map */
  int xSPI_reg_field_register_map_index[]; 

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
  `svt_vmm_data_new(svt_spi_xSPI_register_pack)
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
  extern function new(string name = "svt_spi_xSPI_register_pack");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_register_pack)
  `svt_data_member_end(svt_spi_xSPI_register_pack)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_register_pack.
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
  `vmm_typename(svt_spi_xSPI_register_pack)
  `vmm_class_factory(svt_spi_xSPI_register_pack)
`endif

endclass

// =============================================================================

`protected
G:@I0BfX+@+2-W#C:,TJU#b,gfV.YF@aO@A^>QV(,FKF@1TT[cZ37)[3c.^_=PWY
HO;f&NB#W1V2^7BBK@AZ=2D]-/Z<\V,3T8:8H_d?4I/L=O42OcVV/Q/H]7Fe(#Ya
5g2Y<F>E>C:JG8;9Q1M.5RV6>:W6g?TaA>61KE:9UeXU]dYIb(3J_PDagXJUb]QQ
f/JEMTIU7f1>LR&K>aUFfT#;I8DbK:V[7\_S2OWLDQbbb?XX\>]b89b2AfBDXAH[
-/dQMc2W4&9H3#9]L=OIOOGd[F(25O/YOA:T-N:+X,^JMYc@b^ULDKTZ?YP_66E-
&9_\7IgHR0.;,3aCE@.ebV),<KYd7/\dS7[f,Gf^03@b27_T8PYCE?:H[Y_I^X@=
/&&R6:__d;0A.N_Q4bDN1g+2@dE:3,8Y@Vb>fM96MD.gc.EEID;7+O#a,J,53Bg<
[?@(YTORWFEZM7EQIaH<?IcEKJ)D#K:6e@:56ZHV+NOa&1(0;4,]JA>GF9@MZ3a8
/55^S1Z7bQM:2JQaH[2B\AP@.KO2OQNY\fdV)0gcJ^E=&2>0OeP6<=Ad#4c]0VXd
0M3JPWd@0>/&;W+EBD;,7M/N31c(=_A/fQPF;07E9@<#RV^-_FLKN6Y6MS;GCB[?
B890?7OS41_&,$
`endprotected

   
//vcs_vip_protect
`protected
JWe4XCW>1OM8dH4f?IRG\fHOS2&SgFUFPR\=RJD+V;8AQFX?^1711(&RE^J<^=H[
M5WCeS&,2B?&ba)e;[gU5a685\5__]fWeD:fE)=R,OQdXQc&Yb12VM4_1LA/O\8#
b3AOe:R]LKfQE.]]/#,3PXa:Kaf:/NB+<V/?eV.[Bf/#LX/?EY)>;^J//6(9JA69
55=:9Od8Q#F?X=eM<2+A(Z1)=NJ69;ZR5N.D#(-)PO(Z8+GO2DAAYB&@W1UXfW?W
1=bA2V#V-X,US(=F8^NNBR8G&c>_Dc.^&X[4-\F=CGYCC0+L=^+(Xgaa&8>./)LE
\Oc3@g5(#<Sf\?5_C\<aI81gUH\ZY5g[I++U]1:;[YLcUI&c.V?Ff:X,US42=4V0
b<TGI_^40,D9>SHC,P7+TTBLfR+1VDe4:SYQ/ONS7Q].<Bc0f3Ob-)R8^Nbf0Ecd
;T_a(C>=VBM)fEQYG+L-DB3/@EOIbCV<c-@6L^L:(Ga](34ZcSe\e<[7)MK-KW9?
/2c]NU>cQU+.@3Zba,_9&O6&Oc?U#N]PC62bX]CYB<_G=fVP+e-WDM.C\0&NJ/Hd
[7MN&V/+AZ-,G>G#X)g-@VaB;c6T8SGT_ZKcYY^fR,/LcT]H@S6+Z([^86OOCU_W
S&MJf[<Mc,9<8NIQKceV]f37),7?eg_V7;Q310OKN?Y)G.?ffXSB)L[V[@9XU<E1
H9DDL.@3178e,#F\WFU)#8976,+Ob^#+;b0<J)N0RS:=1/,2MXJ#1+:CUfLN#T]J
\&5MVI((,)WEOcA=F=(UBE+fI39]D8[;4X?,8PVQf._/#B4/Fc@W&>2a<?08RTUE
C>;H>R@EJ?O=5XHJT2^4E67)C#LeDS9I8N,bSLQ;IH\JQ_]d&W?[CYH&@[<#X2>Z
O[5>M:UfD@M8FedS)UZJ;@3Z:8F6YLM#OOFeNUQc?2O]T\W2Icea#4:0697[K7M0
IG=IQWAVRM9@NaDLLTeJ7V\?V,+cQHRI(<f9ARD4#ECC61d34PAK)35.,YOTA4:-
ULcO])cUE5/^?WG)JHS^X&d<[#e_4RaI+.71MV&(6&DK>-bP2H.EI,=A3\UK>I,\
FWKS&;XbM/8dePENcST@7?B[N4]fCfPZSWPEBD_A@#2cZT0&W=_QebM+K:[;XL\&
N_:aLed3J(V5aTcg]0]06QWDJVd:J],F+3E5037TXGfT2[2](GK62L[IBY]G4>D^
2+(.A2N#J&Oe#)-@bfZR>DT#c2.bV:=;F1af#SAB)ODW3\75URL-C^T(^Va.F2UV
.N<RFSDEG-(?DPRZ8e&Ug)_&cJ4a;2aV4TRHX2JN;HG;g<XEDYa=T?(+70DRdPKB
,,(;XP&)ABWXS_:[6:7(THc_34f[9_<#+6JFH]W^;/33?UF(.H8c_7B(@OLK-]eg
&SIK,;HJc\_K4V.@QIS__A:G,\([Q-).F_9U#SA)SG12CO0@EI/9WX5\T4Q8ZA,)
(\Y+0-1:4?+&I]&cU&;3PfcBe^+W:HHJ2f>ZTd7AQT.2A89YZ=7Qg2Z+#,A>5^&)
FgDHQ+_A6?YDHQRd/6ef>6E9A?Waf0g2b5833LL5)[_X?4b+TE5eDOQ7+gW-P)_/
A8Lb>(QPUSKK+4]A^?<31IT02ObB,3KT9NT,1fag/0Ye36eaXf]GQ_RH@:?+:ScO
+7PD1Y?BOaeFVI^5eKWCXIQ)e<;+,27KB,OO;+G1ZZPFegFa,R=&DUIXTfI=];=f
FFBd[Z#[LPK_EFCac\WKNM,H4?C(D?18ZM7/C[b=@.3(>V#2,88-Q]C8P6Y=?e_<
/gg@-+BYe_#/GZN7MS=f;eV[VG-8L.K@.>M_6gObT53,8:g;BC6bf^-JR:3J\I)Z
>&]@M2M-Q6JT:<(8@@9/,b75=YUe\<W\-0DF=UTIc(&HZ\61-RE^)EW8&\dBUA73
K^_-P3S38>0C>)HG/S,0aWdAZ;)(K5;@WZ9V(c6cAKBO<eVIY-_c+3S245?VcJC)
_-b716H-E_P7S;=&YbEgA&7P7D[=P_eH&^gX\RBH]_a,-dXW^N61LfJ5?3ICQ^?B
FDH>ZYQI\fXTYPW-ZdF\I[7\?/NM3>B/:3#eNgdSYdJZGRb:A,1BW1UH?+J=>@6N
c;TLD\3?eD\+6IC-H^31I&:g7AM]@]@eX(BH+//\F\.YUR9aE>Z0UQ.60ZXQF\CR
9(g,6g+AQcUCbS]fOR>E=I8=c@U:2#gc;?W15dOaX[O9IFPZ-W3ag3&3ZSL+Kc3I
>bU+5HK;L>bd<1AXTa&6:H8VM2IY\?EZZI[\U&CHc6&L9,8TVfF38OR1be?54A\T
Y\EZ3/7dYeCY;T#3TAO#V1]2e)<74?Ae6#D4PUJG_7A]A6EUSPH2;8&7-9B57@U8
<W83OWZDc==E/QMa(8Y6Y]\JbFGf,;BX/JZR4D:C4L:9GPA-5,+(KZ]Cf)Y-HU79
aL.3bHI68FKC_+,3Id3JK][OK#BE>U#,CaF4,ccWbec(b\RL)VLHT=E(8bA>QHEH
c?._P(0EM(L3.&@E)O4[1d.O5TTS]eN7(VTB9B9c0HW+P^cdG\WLgCDS4HGUN:YB
Pc_6A]CS6:dc]HY,R?>D9>D<A51W][I-8Y:KLd>1S1afW@BLITY2d]&E)9ga^4L?
D[X90gMN10)K16-+RU?K983[#OFDJDM&NK/MX_RW[E1JJC7REP]<8TJB>B4HEUMJ
F>fH&.@;#Tc-,8]Q/_EI>Ubg?X7P17<^28]_?P_e<_49+K\OO6Z#J/EG>YIX]@3P
,:[fRI,X_5^/UVbEE(f8QBOUBX+O4STg9Y[;P0DB@EVM0<9SEgb?-NAS)E&AJA5^
@=eUV\2]&I7FeV;4I2HCHg>FFQgI[]2.34I_5@:]:HN^)Ca#:?JLS2RMGcC9G7Kc
VQ/:a_B<NX\(R6;<HLY5X(8I#540>X2B)B.:7=+g;]/L>TUO5M=1H78M0A4a-<c(
V=Y,0DAQe(7JOfF9_&0BP.Q,N^1fW-N05=.Y[>d++_R=dTSAeK4^B92F))SXENR4
XZQg?ad5,f?/QEM(7(@N(7eDed:Y8f<[?U]R5X)b8ELf)U+S_-c0?L[g]V]fKM)4
YS#4D2H:3A_g]c];G5=K<<\[-d8<aP]B>@UARGaS02e_\PF7JC(cUYRH(VBH-LE.
:3(,C\HN[HY;Qe9(6PH:;5QK79JV3f(U9.M1F1X]-QQ8>[N>Bc&VgX?DgFJ<e27Z
5+7f_f>6ZEf,G0)6;,)C.4[RbX,6Wd@adR^^_;-@3S1XJ)SZ@OD&93=:ZP\Q_a(0
Ybg4D7Z;Y&L+P6U\VeFCa#BB\cAQ)/UL2L>S67QWTBFO-dg5.7bK#OG.TbB/Z@F&
Me-Tf;<0(7-6Y&ZV5MF<[U;#fJcJ;ENL9N9Y@f/RRS@d)=/;Aa]G^CM:QD+SGO^F
.?=JA(L?M?Y?-OO3d?)bF^@I_&]TO#b537X7O,SBHeNJ]/>g@/WQX7G0J3K8N>fZ
R1eNKW\/<#[c6d6JPK0&54[&5DXVbfe>H2EgFBaEG,26@a(P<2:dO,FJ336Y6c85
&CZgMERc/f;bM>d\N[P^5:>c):f3g_5?\W;>baGHWDHCC.J:S,MgZITMWU#&&IO0
@::8f7P0):fW#YR#_K=@d6@)TcCT/92/IaEEgb2&;W#=@a2^?15<U,T9E4QT0AOA
E#bO9JH5Y>9Y>:O<P@U=CC/f7@E_T20)?BWGM,9.>UO,>3H&BMX-f.C:^F7PZS:#
4YKfbEfUV[J?K?E3GabLOg+^Ig,]O<YI.c_LD0]^-W6H@bI[e<c>QBB<FcNR.K=U
<SK[>fVB#VMQfETdPeBBA-1XbBea.?2(9K,DB(D2_7SCRD9c=TI#Pg\49c=cZf1A
BcP3Qf]\7\K+E?7I^XXa.IcO+3Ge?#:A4[2F9PO/#M+bg=>]eQD4cC92:3\TM/=]
:=M3(?U-HMT2M?RVCDMW60XcZ7:R7>dRDg[bHE:0YWW6MY]:(Q&J=WF)1gZR#\JJ
c5:WN7Eb([]L]I\d[+B].;aaXZ_.ZgWZe5UF]##LTa&YOg@:g21Z7IK:K&S/T+G+
KN4#O+^^66ZABG^J7,PK(g<V;,JB3[YF8W2f(NHB+4IGUQ)@PeIG9FJ.-#]QdCHD
[DQ1XJ^5:8XRTC)?Z_1#GK8],=E-PNDb537,I.7#AGY)CJ:#;OKf\CP+MUe](@Jf
ZC4XK@L0A+AY1BPG]S8#dM\UQJ39[SZ#30Zg088EHK[K;>)<Zf/2(T#9^95a/VSN
6^(dEI.JU3]b27]@67e.,a9>YOPVHe)@)HOZASQbE>VGcI]6f+KWR+#=SB\AH;@#
=T61_W<]R@IV674G(0UPX[dSOa;faW89e_ZU,-U+/MX>f)O3#5;W4DLbL@KX=FOc
RNIT&?>]UF\&9\\_VD;#g.@[[a12NW=LV51?BEE2.E^gILL<9M:a:^IM>FA,4?6U
O_0;@DZX[IE6.R71CQZ?QOZW+G?(24,=FA-76\,W5@.K.=WfLGO><@cVggKBV3bL
ec<g;2A>H@Cc-)E4bcQE3a@WDA/]XHPd-<;VI795gRKT=?1D-BS:X@?/F33f?QE]
_R)IK8-CC6Ee?NB2I-/S71)M(BI9&=aY\U?9C0QA;]RA,169>T^eaYA>R.E8RC)X
17WLMFa>a1H^GbXXHFJY6FB<-=&WR+&&=,9A7-H]SY&(aO:WO.N7).</@S,&;YJ;
5:cVgBXSC)fgN/0bdDQM1&E9,Gc(9E@6NQKDcQfR):aP4QaLF9BWDDN-85X0I@5N
N8IPJ:Nb9RA5/dKb02:5N9>2Ocf-1YLN,EEB;2L.B7?1HgE)82>ACOJG(.C3](.B
f<>K?-f5IVSMbC5Y0]:MO]RRFX-N&Od&&;0S0)JGVI#Z]PRbG>^Gg4,+,Q_8@cYW
OZ:N>ZO=&P9LeYZE66;AKcb#f\:L]>P;93]4?a@-CVHNS<cTDQ<,d47&HcCI0WZe
:FO>d)>0@=<dAU1\V,2P?0H;J(81XfW94R;EH@]O1>B(aQT;+:L67Y_e-8=f+N)T
YU.IN^6GXZG2ZfL>=WT[@e58GR#2=2A.I<]VA_LK98F;9GWS)A#\J7@@LXTK8LeL
@^gKa)?eOf(2\0.?,d:Z96;X[W<KN0=aW7c#8CaU6:?I#ZKPV<](3,c<=bZ+3eaS
,@Q5H349,Q@4=_.OPPd?W+6.gX@B/#OCGb&A(K=<K;5<AG]6]\2eef5:3OYfKZGR
6EF=T@JfZ3L>-/J/XT03T2,5NaNK0gMa3_Z9EE3,5//E<f,PP-VJ,C<NcV3ZZ<R7
[OV/QA/Dc:Qg[Z:[b1XRd6Jb^9]8PgV9NMEcePTLQc1(Z:2PPK&QRQdD:7:9,I)d
TI(X19#6/6;Xf.T]O2>cCQ+;476H+>Nda1UQ03Qa/T+g;6&>,L3505(5^>M94P<Y
&;3.5SOS8316).QJP^NdH9&g?1[PGeOC[Vd4Be?(AEV5];SK+^LEY?VYG5Md,/TZ
[[cYNTD0+L)(e;<T;;/J@g1[^2eR8X1))W&;BN;CfGg3a5ZT)_([TC.<d/_>-KIa
IAP6E:URJ6QBGIJTLAdQJ:4d1F+BY3g-c_;d7R(c84GABA303CLf2:^S+]OVE\bB
/E-./&)3>T\;_e/JE3S3QPI=M0e7/G1O94QN\^Ka1A-=bLRB.S+M:]JXL6McO-^V
GO=/-<a+,AT.UPO)EY+1a)A-6@c>_MSdKC@3&R_PRLWRO7453(?)2O^5a\]Ac@C?
<<G_<eb82,)QWdMKVb3O+g\79e\.,TYA]F5@2G,U(c-/_9\WFA2:()<\[e8>AVM:
W2aMJ,L^:,U8]<UaN(d;X#T>?^&(H16Y.,Y:B,BKF.;UaOUYL@N01(M0N=K2&1[d
SP9.NKQ=<W>MWYc/0.MbFRaV6@P-UKJ+<;+\J-8N6(3&1H,8,\X9@?L(VS7-=88c
?_H=/J#/Ra/(X9=M>Ga5?SK^aBN<dOTdF71G(eWW.()HJ<D^<ZO?I1bbEVcN;PNO
a?SQR=b]cO^VdRbE?@Q5/Lc5;f_WTF1fYBfKGY?7,RS4\.^2eBE;YF@+ADPY5NT8
&P7GCCI6A5,6gOI#_Q+BR24L;O6g5>R6g,5+=gK-W@I.5(T0@3;\U@YdLUL(@aK9
5X5a5LT-L5UDVdEIdD3BX:D@LD9@:.YB(X<Ab^79C,/2P#N(C_GVZGeT9Fd3:+\6
PYOSD5WQT(_NI0C]<H3]7FYMgUXQZ-&,+B.3(c?Zb5GZU^;3(<d4Z)S#e<7M?FY;
[6e&C2@KTa?(]AB_G72DO0MT7N13T1I0^>/YA/9\@b+,=B+1NXY280DfIS;&E4,C
]2OK=]1\2,b#2_MJ/[+a;K9VG1ZES.3[[22]68B2Hc6(ADYI5(#E/D\Xf7,Q14Z1
;I3E8(+c_MOQQ52#NDGW1M5>6R?,Tg?EMX91^\eaDb^&#N:.^c8c_V\Q/55:<+d]
\G0NT@Z7b#-X3IF+RW?-9?D[]QA4GA_>&DE5USG-\=KJ3a1^(4.e_(X@X42Ee\YZ
(<G)E5+0<V]^#TPd.+W(R:7)dIg/+&f1Qe[;?eY^IZ&&P.<)<A2XXgPVRNZA@6d0
V\f?I^1e(0FN_03g]GOGEXaJEW\<L0]I_e.0X3Hg:M4)B;:/06^M<.Za=1W9D-HT
,)(]I)dMdeCPY6DT6;/[2?K=4aN&4DZ#W&80:_>,BU;CZVE8)N3[X,RI@dUa:F\Q
HZL4Na#WU/cQ&9HBWUUV?>-)RFE\35[Q<_A4a]&aA]7a<Y23B3gD_A,/3T08(XS,
0c86+GeYW?^J,SdS<C\.;0;ZgPGJCZ1K+3V^QY4bQP8X(PW59H;/gMI>+.,T_.gQ
#.)C^AN]X?YAXP5JJLa8?;XdM@UWFP_^HZW-7[JLJ13Oe#_]3.9Ig+^S=D0+0/57
];,U9X^@/U]BHFC,U;JIf_BY10<=X.3A.[bCL_+&V::3XPeeHPP#F;D13LFd@d=9
7?D_XE9=.?cOF;^D)1+H&JBE90Vbg5?L>YD6PaOUGUV-M(6YHO#S@8M7BOQ36,g8
SO)9;2Z)NF+fJ_303^TL53#cDN,f-A,]9MJTdT(<+ZGE;6ZDc)f6Bf:L8P.6NaGE
.g9]QP.)B[gC#[C-3X.1W]da[gVK_R5R_b(JZg=7b(45Z->GQV>B;D-JDXV-V(O]
&0C:6(T<,,MCK+;JWbRP3K<=720LFC^KQFZ7R:U&EDT>W,IXGde.^H^1^.8X[,WW
J(JD(V4FaLcc6+XSaR/K?,XF\25\G[G4P013>ESM>1/ZdEcY&(_GSYc(eBT8@@(^
13[K#&/PH1@&_Tb?<SF/)NM7Y3TL?e]YTJC5X@AfE.9NRPCCHJfA2\cgOgfHZf/S
5B\+^fE]Y@&>Dc-)\ZT?f_WNb/,f78T,Ig?9EAGN]Y]/bg6MUN6\8;]1J?eKQD-_
X2W?Ec?/P6EY0(,9FYYD_0[^>C=LYV\OB>EQ]?-95\c6MXFL@CPDZ[,)IR\O8<GE
9H,P48gLZ=;[EF23;gE&Yc))c.=N/UF562^@:67JYe>(Ld1N/>Na8A1WZbT&_E9D
A+e:NZ7cDG\_\=Q]NVV2,IO5-(2MMA?Q-9#a-C19M7CcJ3YN[XD5]c?(=R,<dXfb
F5JG4<#QX@T4[M4H#e1bXC2T1IQ[E-J=6g5fC8U;SOA@QZ<H-8?\f9&Ye9#,891(
d.UO-/+)[<;W-Z+/MN1;;XPU_dK)Ged=\-RQ3:Eb=M):XSaD16?2]A;FM?V>\_@5
f0:.YM&X.e<aY@7@5-Ie+;7@XH\/d2a,b.IW6@1,URLF?,2HH>)3PZ+BRT_CHVdE
S#WKVFd(VGIH^DHg2eO3_-fF/L(PAdg#FQ_K2IdgNZSP4YMAbfU1DGNU#c]R,C@1
=a:.KMKb:/fB=V.(S#0UNTf822C&DUV+0\b8Q@_d7RH7LZ=OH=2=d,F41P;/2^]>
?;-#:N<B0;gSW6+FPW,HZ3R_3OOa&QY=]=6V>GgSE_I^edB1VGb\E/gBW5A#g60a
a.JC_2DOGNV63?gg(=b</Z;0=O-HEZ97SPX^B8EY3U4b4_L9G6&JOP0dE#U7><9O
dPA9S(U3I?V&O^ZBI(gTP+V@U&gR+_b7=JG#Naa@=NFE:Q?]7.JL[-3=JbIcIAa/
:D4BY/&LZT;+b>&dK/aMWcK1b6@G3[KMaca#:#GTG-#6I(d>M\gZGK>B1;cCIB0G
2N7Y?MQU35cSXRKe9AaC0XB\A?L6a?/Pad^U[+XCbd0^NfT3^4S1B>aaD__e,AIA
[]50)\.JC0JbGK)[.DP?::Q9U(@&-gB/5L;XDK+H2?UK+JX@;UdT_,7\V0@A.KLH
=f)d_(8HB</6A-(#V<MDJVIRWE;cP_YE,1^3R+U##4/Pg(IUeRMS,f;PX@F&fHY.
3:f&Kb#JYd>KO,L2RY:N)U30+MK[#0-4>EIe^57e8/SMG9_a/A-X).,HJ),?27]B
c5<9@O/:c3??RV=4aS-^Z++&e6:3g8.7N<_a\C>Z<RWO\(=+)AA(\e),P]Y<QS+<
D^@H/RW=(;(YW\O=(cD6;\R8Z86QMA5SRg@9E@KYN;=A)(PV?S[UPF.NMDG;b^CC
I@f,94M5H[c@3WHWd>(FU^HbZc]:W#0SCEc_6W6IJY4bIBO^)3#J[)#9D-6QMGXY
<BX8G5=>D[US&2&0e:E&@efI:[U>9#?N)2>BALXA(HE-QO84/?G(T7IIU8\SIBPd
[P9^Dg>5SAYT1;G[Ee#BUbQVY_/@@_/]_8.C@\]D+1IeOTfea_TN=CI73/X[6U1J
-:LXMd+&(&X+32/1[f;UJ(/K]2E;VM2E.Ve,S?d+MOdadB_[CcHZ)[HSMJV1X-A(
+O3(IScIfM4Gb?aRB)\2@_\YMLg@/^V-07HO<8&+9(++W_TX4JI^a1b2]cP7-g_C
MaO_Z;T3^:La?X#,RH8Bb1c[0>R77NDB)-?bDJGQ[WfBe2E_EQe>T=PgN-726/;G
+]bgJ)\J:dK-Z6-J7/UY+4/:L[U(E;_,]f=JVMISRa3^+\N:@B_H8@8^,;AI(CVN
AcKICGcZ:6BcJ.QLXK@Z?aWbDL#JF]5Rc2EFNe4J[]5DX6G]E@UX<9d[a]QU#0:Y
g4H1:+?#RRK&Z1VIXaV1-M?#dCZD>\Z0L@^O76>+X_W]ePXWDW79&]IO7a+0A_fg
7)ST+T^VL5/O@P9XGV#F4]29WZW4I-cKD-421J0W\05BB9Y65)TT,ZM]N?M<)M73
R#EU1L_GU49G[?@KKQd)&E^7_)OM5/AQ\;Q3(RE.T4<8Q+6:S7.FT\=XWPJ&0bK\
(1^)/TY;gPXI951PLIRP/(d8PO.6)If/TFeE9e9D)Ed+;/X(]R-Og[R+/VJS2@1.
Je>@b_.U@](]]0R>@S;X:VVX:a^0XORJW#8ag1Ke_FYW6=2@^1]6f?[Aa7)P-6]b
JfbDZN)/;[I_XMfA)6+JEQ8)O3,#3:.^.S;W;K3Ld6gEU.c8\]b?.R<:P&()^ZZS
(e@P)DB0fY77SYI3(g2D+HA0AOY(JEG>(4A.cOI3S2].9H3:,_7bM;3[^R<f(#O/
4HbLVf[?4@)(>dO-Q+5_b#Q3AAUT=A\-T8)>e0aL^V@B>A,K)1@--D8]GY\[WH&]
RTM?HK-Y@:]7_#AH:/ca87)cA[Xa4T:@KZ+UF=b\X_@7,Od3HKBVbUB@ESA2C[O1
=gH.A6E2Hg+G^Z^V_)+O:[+_fb7^9?MG_^PV@eePHJHREJ:HQ0.KC2e/3HN9RH1Q
2;ag:6RBMd7Z#g6UO4A([bUe49N6<b&O^Q_AEA82fGN\B7US3ZU>a(Fb1FIRDO?d
T<OaefTF5.\?,<Qc[NFYd^S22MSZ(?N\TS^=GM:M,,+)K_WKISfOUB<\7XD?8(cg
#>C^QITNI\<R1CR+I^&eV=eX]VT5;)FH7fHIgGEQ;0a\>Y8.5ENI\A&96J>;E^6#
P<)Ga/J);/26:e/aNRfJQ#8=\E,UQ(RT\:S7@c#_J:=WNXW;4-&PaZ+5Y&:c]>fe
>bMVHfB[L>AGK.[Z9OY?\-RT@N(56UeN;65(-^^.HPeU3^\,2<B[YX?XH\Z]Lbd[
d6:WIfOcUY@6A:0D(Z\W+4SP.[?\(ZfWHPMQC-I?<V4TB78<WZOf4Zc_EANfTQ;4
Z9WYd\G]I8f(1J>1Sf8<TgI9XXYcTM3OEVLIR2UN^MS)X0[Y:[TYOYAd;0U>MaVN
>BI@D.b?0^:b&J7D6e),_dE8X,eXEc786HUU863HSAVJ57XY+:DaR-?-JAH7FHQ&
6>A:YICc1&c&;VCEBd6Z&\]A]RW2C&YWGQA3.@G96BDLD=bIN1<@c(0;I\3YC>DY
X+50SZJ58S=.SQaYX&=X@cb06->H7EQK4^2AV?8U8HK<dbb<M,7+=<3S]/L=8,9:
0.aZW]2\+Ee)<OBcUbV-@\1R\gMY)=)5I4e3Qb,<6Y1A8[a8NSD1X7_71a.NIY1+
O]&JG-b#V6E&FY_BaTJGLd(0(0A+FaX#);f)JRQKc@\V>7)/LMf73KbJG1;]=.I?
;FHPEM4ODN=&^FJ]NW^86F0d7;Ze7L50GB2]OA=(MDPP3ZR3-XX/7M#c,0cW=+8.
RQ=,[7#=_[&?OJ6gN3P6C,RVV+I/&1[S99]AcVB>,^g#4H,[8\b4W0),EfS=UT#_
Q0eBUg6aOG?b;TSP,#2a56O0dM[:b.G.W,8a]R4,:D@&bSfJ4O;4J-,8J]Ja__d?
NHP:9T16Gd>\B1bY7L=9T&BK8BZZE,AA(K?J25,L>7)0-\0OU(4eU7A]/f&.<BLZ
GPa;N#JQG?G@JX^8]P4@N[+1^3-P0+=NH8;.[gZPK^fVF(?fe<Ne<_^CW^[B>YKd
C:8<OTJ)9<G+&f[#\^@MS5\-VBL[X3N@UZ4c@F271^Y#gMc.Wc4\a//U@FEQTR/>
W#^Yf>XB9^+;_^Uc<=]SR:DPJP<aCC5R3c(BDPcDW#OV(?Sb0#Q)^:FB\(Y.R^02
@BG#f58?<UW55[T5a=e>JAN-3?)/K6=#d?8X^P6aXJL51KZ:MC]?]6G0K(C,OQ_.
SW]#RSM-H?>RYe?Y8BCXIOIR<=.b-_(Z-\>@R)P\eOD=NQ/G]F2cb8[8fc#R(=#6
;^3/3+KEQ5ZMP/9Q/DR[BYKV0ISDPZaVKV;47BMX/NMFC/K^HDb@Ka)L5REE]]P3
>F3#YEDg>#LZ[2,_\\HIZX8^<\A-A>U?=Q)-YgdSN^#D@?THb<Og.O^0VA.Eg5GJ
1Z30+>&M5Q[ed3gZPTdS_gNUdLDcH63JJ3P6?R)4#MCPcMgQ)0I@8-G3(E(d^[&Z
@YF8cC+G_299gW++RU#cQFXbAQ<If/;BMX03M7FJMUIcZ-S]d51I^<ED_=Ic_5#[
9VVX-bPL5/O530^]F;YLE14:?b[gb;XKHPg8.5H_OICUB.]dZ>8MA,Q#3L\3fYTd
J9WHP[gQ8/1)2(TXR?X-4Pg&H.aE7HLA=76FNJTaC(>08#RTRX/MYN03SX[4Bc.C
FCgGH1cRf>Z_U;_REAYXf<S2EdYeBOO+Kfe#g>4(.^7cgfT[V>;\&H13cE?>\g[4
_TBFUJC9A)Q1;YDU(;<8LUHMD<^Ca\-G=8;,J3T+g/J^>e.ZFT#G]JdZN@/8#P)Q
E[_@SD=KFCLJP7a^-g<1ZS\\)addVXPC[PYc;)O^A?&UH8YVVba[Aa?:>1=,>^c6
2YD&CKQa-(AM9?1C)OQ4[3dA532>4W[B1&K>aYGAP,RUK0FdK3JM+JEM0g#=+UB4
F</,FIgRCP3UYUKaM3N2&#J4,[[f4B\3a@C?]A^Yb]_gd?[\d4DT^8.TU)DQO=23
O0>JYQIPb?H]6(5A32M\@:S=KH64Kg[D7?fS0XHPW^PC.fHWNM;g_#-B?P8ICb:^
D3LX<L<=8YI6PX:=9OeIE^C_C/JZ_NHFF)H.a[@.W>OL<@X0ZEXGf_#5OP8OY8fI
.BB:IGCIO.?,4UeC8?..TJ7&(g3FP)_aGdZ<1ea<-.DJ.YNeP?:<(UICfJLe0g#A
^_=3EWKIeOYaA/URO^Me(N-6&N4Wb6aG9;<K39CF#/aC(6=J4/=d3cUO/<BZUIO0
RQ1D,7fH8BVT0]GX9L1d_H[gXP.K4Mf2;&bRd)^/RC[HP\ae6^PS/d[/+)/FOT+a
A2#b\D.)&#4:82AA^SH>)#\--3.Eac?)/D@A3:8N305f3d\85:S]MB\)1fdT[E;N
=.J(>4UeL[BN6a+EW9Q7N\eXRCQ8?.JMLLcV2K7X]4_55HA\NO0:X,a8^J559<MH
N0a[:gE-XWD@;WZ]ENA\QZ,MMI-(X23)?(fN8?fLYFFYZ0/e@V.d3)Hce<8HQN)f
,(c7fGBIXCeJ=JD\gEPN=J@QSJ0O^2QVOEZ;a:<Q4D?K85a3H.I:+a]2DGA/GLQ3
1c[:MG@aU^LdV=L/1f_4M^bdP?5TfAA>=.88PUQVA:3@1+>#1M+)Y,94V:V;U@15
N[4XI3+0>(,]FSVQC-J&P[-a278LSAJdUJO)eZbVW?:fZGHaUA0^/?\>RPKBTS[Y
:O<a<2TJ<E/dR[8X-cKJ//JHUYIP#)A,EO<H[:1(aHER:L,O2(-KO6PLc61I93[J
I5JQ+ZT+gQWD0]FFSZ#K8;4]3Pf.^\@0D^3^V&d[(_,Y1cBVU0N8#=B_PHU>#g1I
4&Y^eJB(./c0.R6\4CbPTA2O=g9SRaXa94X,6:QH745.^NK>1.>e&]P<fNeOH5AU
UBdQ16IV_TO>-LNA?XBd5M1/>\2G7,Q-(0:D.&.U9-L:V1_3T1IG&E_#,8JPMTZc
<;GH5LCLAD@2JG/YE^+DDXcIMRUbbV)+Qb6+5G\/SLNa\Fg=IG4]&-_#L$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_REGISTER_PACK_SV

