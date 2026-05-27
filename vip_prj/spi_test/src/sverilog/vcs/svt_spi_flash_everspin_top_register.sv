
`ifndef GUARD_SVT_SPI_FLASH_EVERSPIN_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_EVERSPIN_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP everspin top register class.
 */
class svt_spi_flash_everspin_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit status_write_disable = 1'b1;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_mode_enable = 1'b0;  

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [1:0] block_protect = 2'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_everspin_top_register)
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
  extern function new(string name = "svt_spi_flash_everspin_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_everspin_top_register)
  `svt_data_member_end(svt_spi_flash_everspin_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_everspin_top_register.
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
  `vmm_typename(svt_spi_flash_everspin_top_register)
  `vmm_class_factory(svt_spi_flash_everspin_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_everspin_status_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_everspin_status_register( bit [7:0] reg_val);

endclass

// =============================================================================

`protected
9;>(D8E1g83@:fIC&UgaHBCP3ZNN_._\X1E]+0]9,B5bDa9H8/8[))d[DOOZIG&4
Z_cJ1@aQ6,W\E_.KXUYR>HL26YV&MbXBeIb4ZL:/2AIRf?2AB2Y.9&ULcZJY-=H>
59_^-LgXH)>,0<\J;WN.We3^EHU<dT1R<G0Sd<W??:LS@d;E5P;OS25R:[Z;NWdf
221ITZ^T++3EI-<LHd1,;L\ATb_/gXaCcIA5-#PdEQV:C,W7>LQYeDg6-.BS<F<9
]gQB0H67M:_;?9b2.YW?/M<[W(?RYB[B&)g2]:>Y4aWM8?@G/;^(Xe15ZYJ[)5T7
2;2=3-]f,VO,HH?M).S<f\J_[^UJ@[[0K2:DSK+H9(R:F66VBLNI>>4c?:MZ@P>>
:K@=d3IfVC06TK+V)UQLMe/AXJELU/CSFeY\?G-B#J:0I0Z^/a>HLL8_#,2dH)E2
D=,+R\D1-@##fE^M\N5XB^N7BNg(fJbO?<1@6-W1;8Gd.[D62/ZD[529-@]^BTB/
a4-/8Sb-+AfH,46?&US/=72>7RVIQZc5QDdU[77^?fL2403X]KaE4c5f2[5I<>TY
+DRFF6]DHGW=60BPaa1NE^#^KBGYT2B=MgJO/\V_9CEC;:b(3Ga/IGYX.&J?TgaO
BJ#5)08U05/9HB+XF<2L1f[;fCWZ)&\W7eYK?B>?,[+db>U&P7gD9VYXP$
`endprotected

   
//vcs_vip_protect
`protected
a@,19R6&VXS-\>3a7OKKO?]J>/PGIA[C15B&Qea,&1EUIe=L23;c)(Nd/I4F5,K<
g1da:MCQ4&UJVUSNS7A-0KKW)]-@(PfJb.:bG>:S^H/^7P(b4CgR=+H5fW=CORe3
6EZBaAb#S:EELPZ4HHL]:?G/b[77bPO/B@PD)>;5H-fHU[LG4]f4](J3+0E:8R-Z
,K=M&MAIR8Tf-HZ+/FHI,:34ZLX1.85WJU#PK?B^KbA7UCgRMQ95AUG;2.5EL.<Z
f-1A<(8&&^I#>4J5.S.BAQ_STWG,HNK4RdH-2,T3]\d2W32eWIgE\]Z[GPHNJYF9
f-]Y:+\9Y+:ASGH(/XJ82GH0)21EPQ0W7YbQ8Q/e)8,fg+fcb,[N/.ZM1&SHQH3C
[[H2FS?J9dFDA36c?82OMeW;R,[9.->SL2B4f+,-bHU;PYDZ&IR;Cg6e8Q@EL,99
@8/L:CC-_\750?^W8Oe.+Y]c)V=Gd:[NNZG^,P9?Tc,\S+R/+II]YKF/+4C\++MD
(ETPR#-LVZ<3YS=F0G(?=NE:IgVZgLKR/T1b8X@K\X/Of[362(_d5fbNORF:.X25
_NEJ^:,aZ_9U#@T^W<9bL@QdOH;)1H5.c;U?CYMX5BB[G,<]8-Dc1QXXB_4<XQL.
+(9AHOe.69Pd8=dMJ0KQC[OSO^?aC73B]OA?9)KFV\)7e67f4gINOV_0bA/R6;M,
^@+:+WQUF7OfNKR\G-d>/gVf\6IXW:B67g1/N1:XRLP\Q;\Ye8CcBKcR@8eRXF=>
5DY.AYPPBb3_@QP:V@+7ONJN+/U\IS.9LFM8eMEI51d?],1dg(3Da=c5)I>BaU;S
&KTIRM4<EEfKJZa2^\eT\U<M=0[bg/TBUbQ(471c2[:RW<c#>gPR#98g.HC/.R\K
.MHHV[XbSLVB9,.GQ?:CPFR;^2X77BI=)3bV\.W(c4,aD&G1=;(?I+CML4&NLMHC
1DZf4R4?\b+VHc>=FGP@;ff1cMGP-S/YUf;aQI\f=(Gad92PT(MW-A(f_N<\;5fJ
GR.d-RI^2]CY+I/_=_S_V<@L^(?:X2[<?TIf8\.SU?FL6Y[;K.4dKN806,+A^?G(
[L8,F#5U&_+/\51ALK1IY_Gd-fA8AZId6BC@>\/O/8a?T8bBYfZZNKcg(N.fC>LF
]b#:;:]bM.?b-=LA1D(?4^8_#8(+NOP9e1D6bS_Ie+YBRf]S=E4#&#dB\d<][MMc
g\K7bd8FZ@EJN+^&>@dXHX,DY#/&eKBc+:?6LHbXNKT9OXTAGD)(^(Ve9f;g9^JE
6IJ/9\W7:7AIR[PI(;?(_0OBV<M2CIX+gP#,H8;V^4]UE^BW9HC=&0M_/S\,(N>Q
;FaW8H\SFf2,J/e_U3HH7::KX17J=a9>XUWgFeDLPL--[Y&?:7/3H7[Pc&4G4FcL
)64FNX9e2eEXV3f9O9(K9#5;LKFReR]7eNcF18aQeH>B<42NS#YM3[ULTQ#E:Vdb
#,Q(Va1=8=J8=Ae?I-AI-2PJCJ@JeBJ<9TK=CPA3&70fYXKge-.DFQb5[X(&DCf=
\2Z.ebOVI3O\IQdHf=LZ1CNHOE<-YRWR7U5EH8#?H)D#baDJA?_.0/R:E(gT->/,
.YeT\d2G2--=WB.5JdcMPP.4KNAY#F4H,NaC7O)?(F;?c(IKS_2Q45]WI<BYLG40
f^bS.E9M,,Ha4.E@<_-e^9_>;d(Ug#ED75D7GXG<@B225#+f7.UR<C;-QB.3WS5)
.64<@3I<2,V35b1X8TQ:\<;V,,g/<1?7A@<LV?#V0UUBR<LU+BGOD\8L#K(,F)GA
SO+PK^X]ZQf)E7;3,:B..T1O]5Qd8NHG(0F<LEVC_=+&#L_^@B(7;YaLR96-3&U(
57L0dGK:3PH&\JH8(f[N4L.X0M4ZYBX)9BX?#?K4D)K5K7Bc&(ZHV<W4(0AG1_.N
MHW--c,EAE/4FL6c]@;STQY1=-Y+<:eC(&eX:LP5bK]/;,HFM8DA.P7B^P,NLb]b
>2CaA\9P/YBAO,6=]J=4ec#9-,>b-AA,28YdX3Tg5ZMU,@8S(W&ObH\GMKa-I,N_
LZ(bI<X5M65NA\.^EJ6\BP3N^EH:;KAD,UG;^0?61e/?,=)(T#6Rf/1EfS#LUBRR
GD?)(O/:8d<Tc5+>Y35.@5b0;e0/.2>=V^P)9L1N7IHZ4Y]W+.#/W[f[]J<eW5)^
^/3S5#IJL#)2<H46UU2>-5;C)CCf4a)BV10M&H]Y7IGac0UZLG=[Z;L6KbI=LPUA
V>J6RZ16eJ>KU<gg+:852e;M5a<CBC^gN38+HF&^FaP(fG9@1>d)Q;S\MF)3H:8b
VF\]0c1e[d5cW.c&MLF<C)Y1b?NJKaE+WLA4=)-2JWe3\B#5\J2Ca/;:<aF\\L=O
YN(B4[3N(NYJ0RHGBX2[X:_=cONgG>0OYYUJ.GC->IOQ9&a5#2+Y+a(Ed5]?=EX&
9N#>A1BPY)E5]C]fWW.,0]9c,)\NeWG8HMaVfJ>T>[Ga(ba4ICH5(A@E<7MKA67I
[#1JP#D<V&[]Qc]AWUC3YbVT?-\=50[Ba9f7OS9Q:RaLK(M\CSa5/-_&Q[2XNKd=
UX.2N7XC-D(dAGOKLcY^K5=[<d0IEE-ad9AeM;Z6HZBa9F\DC1c;<43Xf>J[f=E)
,@f3bT,_@GT[OVMUfN2-Gg[4V-5SWbO7@cZY3>X\FK?\9+GH=B>9/H1agTMVWfD8
3<ADf_>>28d_VEGZQ;-fdM&NT/ed1X=35MY#,RfBAIHV1X_NZ0VF0VKf__TP&9Z]
M^Of2a]@.U>QV7#F#+B@VcV9#NS:B3gSX+(_0YS./<A#]X9(d<NLg#C2DBVcP@/=
PcW.]NMJ.bQ;I^f<0)6)=MIUSXM0#O4B2^f)5b=QSFAZF?&>GTSdFS#^<cTbV141
Q?2,JDA-QW)?5eE@0NDT,,eXW?D#.;KM=#2O2ZTYc51&b<S-IPB[07W?C>7BfUa4
8Z0VMR]Z)FP@Q>^gY8=#@DXfNO][XJ)2dGAb[B9Ve+]S9WK^_&6AaTE6;YaY_DG4
NgH--910_<]c+Qd&#YSIA7DD_;ddRFfN\VQZ#I9:;20T7Vgc94@J+T)NSJT_:d5Y
a&D-U^6-?86Q;G[FWNRfZX39N:e]-AHb=b^:E,(C,A/.RD/I)/Z+J3WP<W[g4g.<
Q2X<RUQ=cQ6geAQ-g?O.@:5J_1dT<<.-.;MgB;RKcV\cTQ84B[RI?^PU.@K@(>G0
b9a8f:U&6X=2/&8/@TbAC_,1EN]4Z<_:(#gLQ6_>_[#4cLEg&+<dK#[7AEc9f];0
#6.0]Oe#&Tb-S0.NPK?g#.TO_M1d3eWOS1Rf9CJI4;F@)HfgRYbDfBL;dCgQ6Lg(
Y>:(TG;&7V.U,&Vd07Q:?4/?OGeaGb;5NZ6@dF,]MG=2HTDUVYO:?L\e2+724#]O
H8<PGYOX18IEH2NgUd1HAceOPaaTVHW>KGYM;5a1180]=+Q?(9[I.DVK)9>=12MD
AYeg0PcdEeA][c2:,N6;C<g5-\(RYZS,/2L@)FC\[Q9SAWI5.>>FKF\gVMa@(bcD
C<981U/K/:.4)I&T[@<-,[DgB4HSJ+T51c_H8,FOL\(?\>?P^FXZUB;AK1f9HD2_
I@Z:IZ?IS@&G>DB6?]3&N):(?J=[3;Q#ePHJJR>f<7UX[+/<eOgB1+Y+>8f\<6>P
[93K0PK?g(S3#McSJH0D2_@03?/O4\AZ6_b?d4A[;3?/[SN_d-J3V\c2SX]K&ZPQ
fY]ZTW\162aa[(V;\P3bdB,+#e\AM#Ca11?O)4[bU=JKCgKA@QH1(Z=e9-f8K(C&
@aI\\J(EH?1X(dFbDfR;2_;E?ffJVYFEN2>5EPg5.SVX1JZ5(LP1L?K;^CLT2W]4
MTQa]L&Q1g.O-#67c^5_L2Pd2C,?1_#U@O,CHJEMd2g8#=PeE)L-bV_d@1N<[B];
74#g)__7W-[cJC@^bX/ZB4L?H:2A6]W,U.@RSWZ[dSU)=MQJFJ93P;Fe8XQR:E,1
2I.C??T4M)&=8ca94Ndg:&C-K,BK<MM:MP6;0gUR)]4(W55be:B.=\+W)@b&=918
)fIKK8_UYHHfWUYWcOdNL9S+7g20(CG7N&JBT,>-62c@1:RcE1#X-[,>9JGO:-?U
Y7/OR7+(Fg<bc(<W8f9d+5<&?RfS-N91B])->7S4Ke_9CZ;eO[gEHQJ@DR)P>8G\
^3/)DZ>HLHK<9-N6>I@JSKUdc.\3-].VcFfHZMTGa4)Zd84IRda8eaLQ:,a+DC.W
,-)g&_eUE_\[5G]:MWOK:e^E)Sg9M8I+7g^eA42N.Pc_P=U.4dZBE0MZ.DK#4I\>
5b3;;-_+BD#8Q_3d_dIM?/Z5&],AEcUI]5g(THGK6:a=6[K@SbK?QU0E<FYb>L5;
PRBYAO4BcQ8A-EW5-X-b2@?UgVW^24<+bMgASgAN<ZWYd5DX]3-X+UFM6Oc.&c()
GWY(KWVQ2:A@NUT9gU[V+g#c&eOPPEB,/GQ(-5S>Z)N7_e4GJ(<f&Rc_KGEA8[5U
YD772&4&2DSCOcVZbHVKRF]6W4TSDRV&_+#4E3/AVVb&(C&U,<Y0aF#CG@[/5T[7
Uf-2MU_<@U6=+.=@Vb8ZZV[MPPWf4-]B@fFBd4WZL1QBEaf8])8/e\KPB)#.Y;4+
Ae20T[MA/V@dR&\AA9M>>Z\GTCCBLLePcZFLT[C+,&M>(4?L=LAg/\SNZgI8>]3E
O+/@(AB]ZN5cW1=10UQLM,EDI)f#1STTY)L:;/O4R2LSNMNPa&X14Z1Y=50)BXAO
/ZTP9a4STVQ7(BJQ35?^>_5;V6CA[_\ZT53_OI6g0b#@be5<7@^bf_@Ed4X\>JC)
5>E6>Z^&EfPV.Jdb6aV0&JbS).GYH92^CJ.f4@R=<Gcc<I<LNO(0&dfLS_-[1LGW
<b_45#SN5G_YI:CD6:1E@4]T)A[UDbMF(XW)0+,0F.@[=:)Y8V51TA_BXXCCX7M;
JBe7NBf)(4XVca?[;DgE(b3Z=B==FWd?>FebV:VXe.ZOSYI&eM5Q##DB3^6PU6&[
N9,2DJfF@1+MG2D8TeVS:PUHSKO+Ud&ea.,;dG8&@,8+f&A,aYS6I;aWXF1_Y6dE
++R?6&C])Z31UACYRN<H\bTB\X&;-KJA?5Z9OI4bPH<()?R;N[2WMDVMDM-<1^g)
6E2>ZK0@Of26PVID6K7^dG2/3/5W;ga2P4M\E#-(P:TMWK;?EOC;68/],8V0R#Jd
W?DV,g8SYC_U;fe;GUMN21J-eOC3B-B@\^(=+BR^U,IIL(BRWGP7T(??#Gc=2?eB
TDW2Z8(OGG;+S.8be[.8_J]Z2?1/H>0Bb.LSH7H5L-24/\X9EP#2Y^;I1+N/KANg
BGF0O+_(Y.?^J-A9D;N7SC8UY:Q0;&7Y3<EXR-2G;#=EVAb/YNAc5<1bPDBbO/3R
Ha2@-LZ/@cSKeCW>?FP16;CDN?9^^=aWMSfSAF&&4N5,36DCb6(eT9dW.O#E^?T;
0V#QQD:4;2MP^@.H)4=G?0.N8/IOE):HL387^LA,5Tg<F?&8+E\cT)T#KVf/+eR4
<QDFD.?^Af\PbdH?8&ReN=&9H+dXOPAeF^(WRc<L85IYEATa?gAZ:<=M=F4f\>aZ
eBaDR6@I@WHMUBND-FY(-+dTI2=F3LO[D^Z(NUJDO3-L/#bQaUUY/FL)[E[.P\L9
5TS4O9<aB5N-U#[Y3A)^P,f>Eg1+?_?QENQJO_H<SX<[G#_V@C<?P_;0Y&F9_KYL
?<C]S&KcL=(b4QJeF-IBd)#4_#7;ERL35<=#_04]IJ>gP:BF1V2NAB)K0_5ES2Fb
:,#^f#-P<e@aBfd4@9IPDOg][02KS4(C:1A[9^Zg<CHIRUZOO_@c=Mb[I=>84X?b
A:+c.F=aN_,/WY13DL1Z,b5b(VZ+QC=4BLIOY^:E(#TP.J6G/&&BI5/\4XadEKY?
=J@>A3aG+^_C9]INYSG)>2T(R09=E84PMHU9,<&UXI)WH4b@bDY@?72(W>Nc(=e.
aL-P?:5AQf,+X/NL(O)A=:;Z<aBB5;O9]R^,AO]0fOf:aa\=_d?-CaJQRU.<1QQ]
4C>\SI]#]G5ZQC/(YIA+@7/6:B20Z22\b2OI^[UJ@W<E0EBJbM06?5I+<O:CQPQW
K\/?XLgF8gRa606&5#647Mb4Vb<,d+B^a21cI(J7e(8:T_b^gID-dA^g&;K^F3BW
#FVCU4#;4e_@-Z879?WGe1&:2=acA0Bd4;?EU6JF/09F]V;+X46:ZI[_PBY1gME-
8]?.E,5&6e;4+^LZ)\@e4dHXNV_a]M<\4(NWM2B)QQ305X/+1?=0dD^<e6D>0#4+
:G+TIG(&\7PC;Z(NU_e^d2^U:/[2NVORM[c>]QW<9d]6SK_RMM.(>9LFQ?&IRUd7
.]ML>6V>1WgF@UQ@R93>;f9Z)BX+)D\H7^Y.bEaE@0<fKAX+:c+>S9G7)SG-GZIQ
K<]c+=PM:=g6E0\E>;B;+Ie\Q;(Gd=DB,8H[KW6I3H@PZTB09@DY]M9^EDI+B.&0
_=/G>NZddJFG,.5RFQ3_b@\4<dW]1,EM\AA:[RM:cXIN1=5^W)NTf26>G28:37Fd
MP:4@)3@gU2YB>cIW9(dC0>W3)]N1XE0+S6f)YE/+W[OaB.8,RWd3FYIAdS+T<fH
/:6)3fc+J7B7Y]d<bLB)=LW>Nb6^.I,TT7.CFc06;VGZ#b_#E;5+K7-_/VCOZH,Y
bRI@9@Zbg42Wf4EATA:^R2Na8,DNXAeBL\GbP:LW\=MO_E/ND+A)CXN,;Z7[G7>U
ZL?-6g>6P9UXD0V_A<=J/6^T/Fd_G0V=;_WYC]/IfH\M-b]e(7U>NHAW&LKU-cH9
P:OW5(KO_&f(YOe]fdfdF_gRQ^g]agYY#_Z8#c:_0I(Da0;e3L.JdU=-4>,@a+<9
>\/]cPA[,+ACEAReO4C9\T]Qc?O:9BU&S)2-UJT@57(AeE_A5RQ#Z@,K<DWdE@+Z
fgV_SI526f:(JEgETN(\YYI?ePS\RN5KD9@MJ1K5P\N)LPZ8G4gUYKc<=8f>=AJO
WO[G50<OP_?4]@E<C-;cg[9EXP@dRTG=Je?>)+1\KM86g8X&0D9_0BaDd_D1YDg[
.VR)5Ec_0:AAV.=TPGN;>]X0JgXeR2NE.\I0e(PRU,0b8g9<#UTG]_f#LH]&g9&K
#YPaD3<#Ef8HH?OTH;gXPB3(ET>&<Y8H>3=d1S7)fDZF-AXHY)JI_SNMF(Jd4SKB
69-M1<6X6_Ze/@LQ([/O<\H;G+MYEF/IE,gC^f2@V+LGR5<;-dT1c#e1Y[;3;#K,
?..D<Tb53;.[U(]OE(ab9dd\<;SU5X.(EB>Y;(W1c@Eb;Q)<^/d;KEI;dEMKce;_
Z&U12M1Cf)bRGJ&=.PK7JTU],^PGT7V?])ZDV]3.2^8(MSbQS<?/1X\&Fd=HF&&#
J3[VB,H]UNJ_Q>0+\A6,)HH[FR(gRA26]b6dZ:]b]9_,WF34L1LPBbQHe(IJW#Ad
WdHF:O+M8P0YH3SE<]X)[4.]eB:>:8>_.M.(,#D0R2_=#9QU0/\7:@@-CB,L#eaG
T/b>IUFg-X:6ZTOXD>0.9]Q891O(B&(:A+MD1aSN?6a.KaL2&#+e=;)a#J0D0UWa
U[8EPY/+&JRcI_&Kd@8e-MZ/)LCgVHZJ\L5+-1QV<g_CC-CFabNO:)S7\<OYZ=YM
MP-7M3NTV7,4]&NBLBCA9C[^CQca_5=V;/M2Ia):<4D.;QG=acbBJXEH_,R.Dd-R
2[U?b3U:a8f?SdF#W@UUW\/4D\&^X4B9#NL(#9bFE5M@\JJ&\:S_B_>@f=M&1-4X
d\D/HDIX+79(?3:<[S8)Z&W59#J27=Q:O#=7:.9ZAdRaT;FHWC<4\]I<BKT[^=Y,
e-K7OCf#38/7I?8_QG2MMS]@;e:cfbaV=e_2V1EHX;IEC3JVY:O&A@H4W^_MJO5#
C^bW/<W&a=K,7-Scg7)3S04ZIVHVI/UKMg?RBb=K#[I[JQU0AcEIa7<E9+>F]\B4
eJZ,@DUJ0,BEM/K9dS-49(e0<Z\M>JMfDWg9<GaL+7CMI2,DfdeV;JR3\VN6;]7d
?&b1Od]HP-BYEA1FZ6eB?.^VbN=.c84:T2[BS60Y4&K>^\+LTg@Dc6b#L[g7Q/c-
_<N(MUM1&)8^2TPR0]8;V7W#G6@S\a92@BU7Z,OJ&=Y=U7;=?NJPM_I0HcVA.288
-KFaE.DVf+eUe?K5b4LJ[S>4F:[]e+\6BHcX^[E:_65PT^b.Ae#5=>(gMNQ,E[HQ
\<]A]AS]R:<8Ga6dI#D\^4X.M1.d#d3VdfKe9B>fgOX3Q?>N6c-[-DS.eg58E=\I
&U0>L,X=H:3EVFB@O95NggWgEd<AWaE&.JQ:,bMSLgB\+=ec42U+\:.)1P7gVTXQ
K)D;;=@Z.1(SfM1dbNI?f;P<MTJC[eI[8DD??1.ZM<#_SW+J1HYZK.O3+3gK;97T
+X+aNe^fK:UIXA<d=,YT3S1;A.R+-0\QCd_>E&-DXR[^Q2H6>#C57:NJVa,e6K?P
>&R:/H[X?gI]CY;5(JTQ&:Q;C--;fVH4(GN&6.6Z\LAXIPWP>D@Sg;&G+[AKYW6:
.FXPW3.A/^a6:__g4A?0a5C:ZY>e[a?MUcTC@22#BKE0D->deO0G^:IJ/E2=SSV;
(QfDB-U.^),W</?=,dVXJE1O1EX;(5)F@V>X>AVV21QF_-8ABfBdagQ3@ZV71:7a
PEH(fB#SHRfRT:GBbG3CFF:KOE&Pec2X#_bcHbNAMW54E/=MNY)S@QGB2S^BKN0d
IJ8R^8.]Lc:<>dZ;NC&cUb,T_R@MS(?eP].+e[:G@S;1ac5aYF<]VMa0CCW/Q=>6
NA\?1=g0#09CP05T[TJfYba9P:5a-O=A.LXIE(VLY\cfA+@AC1]K?PM+T_^(2-D0
OF6W,d6B2]6^<Z-^-<X/(<8.Q^KN4VK;cA[VO_f8T3L(^b-d6J&_f_cR,+KKg)Zb
/5N+.@44WeL9X2:2\@SGTCgHUS;g=e+3CN;5.H4:FM-,82,UG0D?WHMMV3U#:)R@
ICSZHBD;-c4@Y[@E-dH7=,FC[4Od=F,YD2T9Yc)5BD3E_<dN:&@6VY7IBgNE7FcN
9&5DgZ9?S,?O;fX9I9L,_6#4UWCeb&b00-=#d=5;7UHEb@-=)b9g55)c-Ngfe/NX
4-O<K<FdMA,g2:N6CN?+GDf4:0RP^/b70Fda2)8.]GP0E,]GJ_@8O1A.K;A@gNab
2ZFI;E+-ZW@g@UdRM6\LbE1_.GB#3#4e/,9QHXa[gVT.F2V@))=@c#(Ag47=749F
Z?+eY[UR98CMX2B7b^JP(.,@bT=<K.1GA=D\.HNY)R2OK#Fdg41N5R3)=2e)\cd5
..5P-:7bEXE_?(KcP5B1E4C<dRP8L20FAVMS;g,+TAgaXe?.HHEVR(eW=H?TS,K/
6e&)S1X=J64I-.R>7-d4<6LSK_U(K3J?Mf,+eAUa;S1#)a6b(?=<Bf@CCT1Y<9g.
Pb?;,5^9?Jb@(4W^06#22J&2KG:ff9<K(>(XHQ(=R)HHI#1YUH\A5J;aV??ZYA23
>_AQCR[JR=PZ_TVDa^RO+UU#]OG>2Q)1?WVCYcCHRb@TW6E3-J3<[cW10^-\0V;3
I]D\]QDga=O;T5:PB<DEGcW>-H57E)9d=,>83:->6MCTVNd0e-)D.0J9+5,4D/Y6
<GXW.XS5?U)4,6_Q@XNg1^8/0.5[C4^EYRdH8a/0<eCE7,+Zb,7XdM#+7:,EV,c/
91.SIbFV=b1MZZU)?RQ9Z;,@GIfXMLY@;\2c2D6S_W&OF=H#I9cQP2\ZU/AYZUUD
c7(OQC]T?Kcf7P0)(C<(_K8-\Rc[MB:TTDZS4)?__+#(F?/RR4.f6J49HRR\L9;#
#X)ABAK:H=eTb[0_8G+fW/F=JN&^K&IXAfG]OgBM3bS_7)WHXGCdJW0YCOL=BB#F
@6=7e-MM.PS=EcKOCYIXbQ\O:6KG2B7R6=^8F9,cZ9HL7Fd9<K0<J_02VcHG_P9#
#9^:--5+C>)<T6(LWXbBUP)BSMLQ4J]M?O)V7@,gFNW5^-6Yc8fX5Y(e^M)dW->_
G2H#eWE)#:_0S+CL8>Z30=+3?507A9AM0#YQ?UVPde0<>43I-;b9c:Y#.f0N>AL>
#.YOG_109Qfd3Rc7RC6D]M<D9L^&.91D9CZZR0O=-SR&#OI]B>Q<4GM=+?+.L(2^
8Y2R)<B<G[C[K-]1CeI@ML8LKa&W#,Z1,O@b<613</&SZ6/8K8NX7-M#cR1WO.19
7(HNN5/10E6e1;\\;=8QUUU@N-93095U.a@.5DRg\[/fb(g4FY6+^(P2f^6bM+GF
H@B38;fE2G1K7dZEBYeZa&(OQAbB[BD1[@eFXC[R/,LI-Cc-c[K,(F^f7[eM/ZHW
F)BT#,cH;K/)L[]](3<+I+Kg+2SV6,DU\#S#-2HUaT6L?D,GUXf3,7/(:?_Mgdd/
Y(X9aTB?.M4-P&(&DZ^&H;;S8785CTX2DT0b0eSUQLb9E^UFV<-)_a>MCb>/8<gF
:O&:_NSR7[Y8<Y+)N(DaSI\^-O5QBQ6HC6+_R2HRb4;S0@.fQHL[@V+D[GGOHfA6
)A]=75Z:P4,>KKb]d-0eW)K4Q3D/Pb:e#RI6R<g7G8JID+UF/fgdFgTe,5U&9#4f
F<49[a16._97^aPNTN+VIZBSgf&JQ+C/];3O?P_@RG5(QSdZ[.)4W4O)aEK3f?d;
CD[+34U.bDRgdaGRTa9YDbO\,2(;V).9OB^QK_EGGXWEX<MJc\#X<JG+595d].0?
;&WU?1R?JTT>DJMba8VDXN2OG&D3fN60J[F#ed/.\2a>L(ge2Ig<_(Ja<T^_+TRb
#G8P#:0G?RVJ@gHg29UF<(IRO]2R,.0A6K6T;CTDe9=3&62^.a\]:@e#bQaE3#;O
R1K0H+#8P=+d-9]a30QaX/\Z@Y#E_c:_O/VgQ9<#5-NT(aVXP7+A^0c7BT5@^F/G
)Nb(._7aHJ+BOI:.I9@MHAOUP=3fa+ODYZ1^PdS)K>AEdeD5H_3W4:14WG^GA@C0
I_J8HD81A=)L/-eI_#R0,FMMU([(P,W;+aP@L\4G>[Gc29TE/N7N#3GE&c?XE3WH
6WfWZ=I5:;\/CR#<4?(g[bDRG?@50EIf82HATBb-3CJK:O92A6CFKS]<eT_:=P9]
\ZbM(B1J<<2<J;@)AZ-.@X5S(J)P9XSH/3)\V.2eV<X.WOFX7<&KUYS@Ya?)dBdA
+(FTdORCIZL1.(AH/2110WAFYI9H6D1@?T@_cZ8WL25DWFC?e20gQT)7M148I8H,
ZCJ^gfIE2b(FRU<B55_FgAKB,;\UPJYMX:Y::4B)AQYC[b^T9U^N-6(f&1:K8US^
(V2WR\;[Ac5N0(1?ZOL].MR-WOI9A;:b\3[L>4ZJU(//](Gc+f9e;d:1X+BV9)6f
X\93);B0Oe\b_d7[>PAc@95^]-RW;@A>KEeb@4^?F^I\V9J1RRPS#]ec+W>XY]-O
W4=B+K=]S#_]ZEg)HOIP41NNY4J1<R.>>=N4OX=aLDF].:=D:6a,a[F@??179K<C
c9?+CeC_-4LV>.Ec=FG.ZaSMTHS?Hb-:/1b&a;?XeP]L-Q+4b5/J=A46+bTY3C?e
JQQ5bLG)Z][>8N[>-a_HX5OgQ?0c41YJYDP_AV_4Oc[8XB6HBZ&_dZA,T#N5R\]F
#7c&4:IZLP5)JQJ/T6@HM3D.aCZP;]=HB&Z;AP)C1</6;LQ1:XB?PG2]&fHZ2)8D
,gWWWedW/E>:+_LPWb-=U=\9<4g.WQPO>]:#8T.M)\N,9b;VaEE9,)@N0/LeGX?9
G]@NIK?N&GM\:<5)bR=2_I2;RHZ.0SF(7^g>9PWV[(ALXA&G_5M)]ZKd3GUWU+ON
E<?NX&:^;YC6=@2bP9ALH#PYG)4T7BT,JFTg=a<bFCId+#dMRWB<gH/V_I6((>0d
4-a8bFFY(8LDB49W.JBHaa/Rg+2eIXP<1bPI,I25#PO0MV4,CP(0XI<P0D-R6I#;
f-<064.VX47aSQ?P8>KIL72e-U&@+P?8[X6+2D>b9EQ:M#fF],RGJ\TgcM)CW2d.
:D#3;N7.e<[Dbf1S,WK],8,;WNDO:JC[gMG@4O?dF3P\/O1@>94\NZA_K9]AS^@_
bKO+f/.FOaQHS@91/eNVUBag0>&JVPO.4T1;V8?8ga+.^0J[85?>7(=#G426GJB6
8N0FSEM]Y?4<7W[cU=M7+VH43T\K#[98cZN[dB>b+?4,XVE73#a[+-V7B:feBT38
80HYcVg@]d8@/OK^@JfF7bK#J.e<^E7RPZY@(3S?]2XO?5[O??\\ZdaE.^K=7P&<
-Q9Z;TU90FCF.,V]UWB@[#,bB(Dg8=]Me0;[/E;J3-0CR\?E9FAA^-H@b-5^#.gW
]?V-XFRe(3QIXb7MN/YN+]B0(aX<3/9<DcPd)S\UBF<[bW7Zg4dED<(Y+I0F3-VI
1?X6F076Z1bE;68WE+@NNUN#7BN@YR)5L_<b329Q5[=\<63Q33S=B3ESH2SPPMM;
9c<QF(gM.@DQ3Q[eJb3</NP]PJF_51e9LG)=VCZ>)>-TIO8/?1aDE#5TTMU(/IK(
ZLU13<3S&ZY<X2VSXEKD,,876[<WAEGCP0cVHNU_8NWe4(R4[+4LFWbMS4_(^[>8
)2)X\0TQZ;/.L?&,[Gc/YD(/3V8N[Vbc__1,?K>;V#]^?b8RB-,d+8BQ9:Of:T<N
aH=Y>5V\^bW8c<5K;0PBSOa4?<JLI<VH^[_8Bc.NOM7X9M_RaU]#_[#W<:<2bc+P
DSTC:,6RKd:S,>1-cMP98K2AOTS)Z<f,1Ug,[FT=)ANT+5_J2JC;P5;G.5SfRKW;
(E;2OB^Q<.L14_>F=#VMfc[Ld.9?P_WIF?DXgY6P4G(\I:HDIE9#@G10>ZRD)a,Q
S_;=WOFGaW#_[+AO;<#F1+A^_\<74Sg+6-DD52Z/U8S+5Df+T:eMD#=)WX;R8I[F
&V2P[d9df>(P<=/<2;U>:dIBeeSbF6g-.A[&@;C:C,GMMVYfRZ_EGc^242dGEY<5
^C<a+F@<17TEUD).5ODD==AZCL)KX&EF=d-dc.@IYgPF49N+A7RN_RXGe,<>[BG/
W4ggL.;KB0b)^b=2,J&.6)Q\/Qf0.@DQI;G01:?&3RCb4Nc300/eNa@a,3,W^IB1
&.c[2([_A,/L=8S@0V0KfVX:(9@^/[#Wf,,NH+2UL1_ePZa63gA#5-S0WP<8SBYC
.b&;B=)P3Ee&6/UeY]9:E97Ia8KS9<_9X,dW@H9KF>7Vb+O,/O>JE[3JP]+c(RfL
W2TO?/=D)5E-[f&WR/_2BddFUJ(H1Ibd?,6J=P2@\:#_=d#SR+\CK;UQG4Ec5,O=
,8eNI0ER+]Q4W2Q_+ECgO&eP-,;A;JWX0H;PTB>54Q5eCcX<UeF?@2]^IPI?Y0eI
P4#_S_cLGJ4XO1KJ_._#.X04aTbP)I]bENa_NQZ.K.dQ31#3WQWM<(34e#=)]M7K
OV_D-M<JS.WW-G4M07J,#eOdL,53eN,dB(,JLfW5;c@bVXY4CE/c\=F.:V4NfUO0
(Y#>N:W7KER8##YS[CXUQc:5N;MbRILd#9PZ7gU](M;QSJIB#]aMSa2E=:?Xa[TI
gI#+^9R;Y5/^.K-ZR1U:J2VgYC,fN8.;KK7^M#:/S9M]G;[HJ0G6S+:^cKa4;(<5
ZWF\.\Q]L-RQ2(ZY.\&fO[N9T)04U1b)Q9g7f4C0Z)WZTNJ0BbQg]EBW5VA9&+W4
SN&ZH1(+G7+9J&P>Rbf6MH7-#JgD1eA)f8GBC#:a/D_UDBE^N]g)I:8/BSBdDC>?
ET[7I[XO2]V645B1=+9#=2>fJ,d]GLP3[&BT-TJe8FBgN6)4.-6e[&\\Q0e:EM@(
H[d_+I6DQTC/]#e^&^H#BYaNA.;]BOTUYY21NaIK;DUOEMa1bS7QYf#90U9M3eUC
[U984>HPKC#.[4<B_9H<aKK.b?Cg<SS^:3;-4+(^&.AbHEJ#CTB.EIL6N7Kfc.RB
GbH=&RT<PAUc^[@0BZV+&8-/\B._DYH1:OQIa5_4Z\<?X42^d6e@H@0ZC5W=:>JA
Z+CY60NQ(U9Of_MKJWG_aCId6O2c/UY0N.(cZ3S)5+U1=/-CV?O5&-;<;]MdG,6e
=g+BS+?cOS1M6U803]UG1E)BTFQ3F?K-4V9Ea/X@OMT0e8:/;P:(N9=]a?=6gNg/
J0LKV6E9MO8&EJ<d_IF=70<Q>1bS7TST-5bgE3,WEE&3A-a-.f2OB,+81/T7YG>f
X=fgIH1LdK-W?g0RE)&PCRBLY9VK?PZg9f+6WT>KTcUL;>)CUT4<ZNWeA8e^fFTN
L0aP_HWFeBAgVQIJW;R](,I[-6CT?ASbT0A15/[9c3[?IC5)R5+;O_1,(1a/?(H+
;bI?Q-U:4:X]]C1J];3K_)+bDP@^/5P]6N/KSKY1L\/]M:f8CH+\.50\8KZP8[P,
PK8aM5-E(_0c5&;7J.G,&([0@-@5+XQe)]V0>FWIHM)d3RT]NIP:c7C[NcbB,T@B
I4-K3>O?[P(;=+)BMX/(>JH.Zf>MAP6]>:BW.]4H2_,5M>c([.CeU0;<3SLR3MJ5T$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_EVERSPIN_TOP_REGISTER_SV

