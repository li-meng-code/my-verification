
`ifndef GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP 'top level' status class.
 */
class svt_spi_flash_micron_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  bit [7:0] dummy_cycles = 8'h0;

  bit [7:0] xip_mode = 8'hFF;

  bit [7:0] output_driver_strength = 8'hFF;

  bit enable_dtr_protocol_n = 1'b1;

  bit reset_hold_enable = 1'b1;

  bit quad_protocol = 1'b1;

  bit dual_protocol = 1'b1;

  bit address_segment = 1'b1;

  bit address_bytes = 1'b1;

  bit [7:0] wrap_mode_reg = 8'hFF;

  bit[7:0] io_mode = 8'hFF;
  
  bit [15:0] register_value; 

  /** SPI Agent configuration handle */
`ifdef SVT_VMM_TECHNOLOGY
  svt_spi_group_configuration spi_agent_cfg;
`else
  svt_spi_agent_configuration spi_agent_cfg;
`endif  

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
  `svt_vmm_data_new(svt_spi_flash_micron_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_micron_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_micron_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_micron_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_micron_nonvolatile_configuration_register.
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

  extern virtual function bit [15:0] get_register_value(int addr=0);
  extern virtual function void set_register_value( bit [15:0] reg_val=16'h0, int addr=0 );
  extern virtual function void set_cfg(svt_configuration cfg);
  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_micron_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_micron_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
d(@V?4QA=^6.(:[P^3f.B5d=V]@baYO\6-NP3-M#3PWQG(7TNKTP-)c2-E//0K;,
3_0,;T]X[g(OP0\5=]FcYeK.8AJ]O=cQa>6C)]1GGg6K5PE9=BFPZQLAKA]4Ga8)
Q1fSQfJ0HXB<?)UW0IAUXXMJY7gD96,\UgS<,O2Y5EL9_eH,40c##c)[K@>3<gPY
@FG_OCd;L+-4Zb&J84Y7+c;8=A0I=VdI1IY6XBP613E-(A@HTZ/3E[CcT]4S0JN]
\7W0TBaEX=TCHQe4XN:fV.B:TNRg\<ZW#F98#:>SP7(W,LWU0U@#?K<c6_E5LTNJ
_Zc(eXOd2@-2VVZD]G72c>U?E26aD783?&-dC>/^.3B)Ma,)_(ELEPY/6=;5MCCe
DBD^1EJ5_WR3]c?NIOA7V/UMK#+I&#0O1gMFfWWESC#V8>0aQSgZ1ZdDeIM)0V>d
A?Z99g7BYM^c4IWc@<(aBJdQ;Q:I/e&EHe\(IVJ&_4#Na=K&\,)0V..=O\QM8DB)
c@KebJ6?/DEF7@:LHXW__577ADbMQDA#7K58B<R>J\-<W&9b?&O]4c8R/a@=^fg)
UOLa4&#]Za0UZ4CR2WYdW3^MJL.(M/>GKdTI1S.UGA+M.8<P&_6[bF,#@BR=fT)e
;BV\^]I2Bb?_D^fE-aL[[G+.#D-LSF.NCH#);^]O;;7Z,(d;QF][KR5(ZF?a^?;&
NACC;B&b27\fUg2>D)LLYD)cR_M4f-L:4c#g]1E@E<PadW:B\36N]eN?DQ+1aPPE
I1Cd<-@RP],ZEIbGO@YIN(\-S\BSJF/(D>0R7e210<1_^V998/V+<SLGD(S8A269
O_#I2eE.Yd:ZRW+<^JK+<gdS6+-(LL<CGJg12Ce,7GAeJ[WAfP=9-RP0]/@@Hdc=
)aZaCL&@0KF.2F_<38^@\(C^1<e/c((6?<7R>a8V(adNcI7&_CZ-F.+>NL=GR(0E
7T8N[+59\J_>XM0:^FAI\4fMTR3BT#EW-Ha=:PKQY4BaB;-9E)+8+\YFP7>^VKXg
[/A5F(CDSdYAMeH\1a6@JgE;8d4UZ8SX8O=#FEL-;^@G&ZC\?K76cFPS/1V0FY7#
f([10#4E/5&/S3?2gcQF,4K(A;dU<=Z(:$
`endprotected

   
//vcs_vip_protect
`protected
eDF19J^(c3>PT4)6U,P#X<g>gHVge^KbA)()S0J<S34@-3@/>18M)(c<:HgdY@<b
Kg?GK2IA;284_2SDC6D(<2JK3D,+^,\R,)<\>5TM]^R3-W?Vc]K]B+KPQN9Ya[a-
\MS_ZL18.>:Q>b6-:-[U7XOSZLT6_[B+I=e:<7[.fUK<b9d,T?efaBHSd^eD4I0-
_=d.Cb7N_#9B?GVEWI0X8V4RDW@.E(;8/9&RS+N8W=U04\<5J6QZQF1V)+>6-HR=
3RVT460HFe->4TOK7)P^]AdEA>&]>7B=4S9P]\NN]8_4H+P&YBGV-U+6Y9f0b,6/
]+c<bW^ASCXGT8;]Vd=>Y70THIIGcebYQA6+-(YMeY[4<8JVA.EK_cFAdg4cb=72
W[PB[/@:J]XM-BMISQH#_D\6#)H(5.@HJ]d/X)R@EYWVbc-R:94IBf7+(-VA\0SB
[Y66bU^U;E#T6C\g<(Se)UQC\=7g2#bD2SUeQ)#H8WO;G[=OK^Z3P,\#/]9J_H:g
g/H=@FPc@^H1c.EcX=>FK;74:SVd;RXA1G:bTZ0P>D#OaOaQ8JVH&aI_RPeC.ZR5
-:Z0H[afU<g2/.6E;<,]D#2PFPQZ[)a3ZeQH2G\FfKCfYX#ES+\1PcSgWD?QZgSX
bRY.=Xa/\:\fJ46(Vc,-1?7XCTd\J@A8U<]R>3R&&IbLfW87LJ/Q<\I)DCg0OB22
gUQN;>eL9O0@F?(BTg@f;W2?U\U&6eXKPXZ+,&FVf99E[.P,NaI+E-X\5I)WK>^8
N6J#:-93]TTWX<>UQ\+/6MKVZ\J@Df#N^gP;\E;GC&S#,Y]7D/-/geg;&FR^OI?O
]+dTS/34-I--61NB-L\,NPc0#Y\a_Yc4dQEK_Z)MZfg)::,aGX4PFMe.(bMb4#SO
dM3#Wg_Y:0E;9U7O+?+2>7UDO04<YM@B]G8XeR6;BC\IKWd^O4g]\.+IDXdc&-eE
OY197V.(-#K(UN)</]U;D<RLT9\??]3AI+g0/#;?-/QWfQ)Q(OAYXMBW#fdfE=FH
_YSJKQ3^H<D-GDG=Qg]g#QVT_G>(#c/O,TY60K[DA_=aC/F3^O_(70UD/M88S5P<
?\QO-KdJ0,=B:\5A?WKP8L3+Hc[.AEZBM6G(=[4\-Y;TP(+f1/TN=K6SL3.4-+?#
/Xa&_cI0J:N.2QN]aU-7MHG)c\Ie.KEfDGZO3_YD_e^#F9:O#^cT/7Z-]d&O#8?6
Se00CfQMb<\J4-c0MP]N4He=YVYPOZ4Y]C1DG&CaW@28:bP,905-0+3:P2Q5Ja8?
:b:N+cg\+-X+T6UGe)D-/bO^9W\<79UTA->9U-XWM?DGDF520,2]\7Y@bZID;:b\
?E2V]//Ac@N-?^X>I3c(E\597+YaT;0AO=:4VN3]0GJ=2=QL.O&RCY1fBSQ62OF<
I\d]/(7Q39bT8&0HXL?L5ec?X-)YKJ9L0bS+O=>2TVW0+P1]a?5)37V^E@:Q#@4L
;f[,dI4d^.g&)CYRe7ca&CQ<^II[0=^DZY6U+cIa,8G8/R;)/+5XPLM??_Y7cZ35
1cAPaBf-Ta&<L,JWH1Y_:\\fIV.Og/-X7&QC\#I8gZ&S\)g9N7IHO&H>>d4d3fVH
eT(<H7?TQ2M(<47I70d2K7g)_B+PSaJM<9N>W,Za@WY?1ZD:dMd;:c-S1JC3cYP7
3,LEPJ]5(/<(]D[P0P9(,7YX:NE;,94+CdFd/C>97M]bZ3ZO,>O7U6DT;1F@OC21
J_ffe1bCg]TXb8;F-4DU=#7a&07J=aTMH788>GYE-?4#G90&X,JR>ge[[9Ge@d8B
gX888;2Z\U[9(9\(/CRPGdWTUYH]OVfbdIC#:Sdc>N/@@_@L99.455A_egB[:Z8;
],:Y-7QPPF[+FgKJ;SF+R/W845HYI9FJL+#LbRQ1Pd,5bg4JH11?\6gFDQ8JM[SF
VM>/\gLD8M#A8CD3KRPXA/-#<aR?\A_>=R>(Z-:L\#S@-EHJW(;:7YPcV61B71;)
Z8=Z#Gb#.X=3<O@W.AG<1\7eeV)LgT..R-e3;I0UQZd[]LL<THCGg5,JG/E7@HV_
a([f964,a[9abHI9,f9M#^/2S@VUM\L0_]@YEB1NI4RHNE5cUKX^PH;>1Of2SaB9
=KEMLfeM#..0g3^;NIaHG6]cW74P+R9Xe_63E0])<C&N_?A8D=4L#7A_?b-&;/b1
H4dbPe2\1HA-fL8EfY]VG3:K1KE8NB\@6D^)4?3S>8UQVK@_LOADeQf0Ie#TR7M(
)cCA9@HMRP.@V(b+6-?Jb8I::0EI:@UXG^eZ[d:<&[\>FOSY^<U@EfXO(/],AE?>
ae51\DX)bOe<WUA(B\+/\BG6YJ4>XPfREUA]XG^]UL3<Y]EUT;_/8gJc]1YX8aHI
7C)+K)U)3AZUDd(N,8Pbd@.NO+<Sg7V5[1>Y&&])ZYGgPe<AZbIT>-7MUe1AP[g2
/Z9:<=F_[\3C<.F-2=H[E6.VX[?<[]H5VD>2GD0gK<3:+[D#@&f((D?G6].]d9.0
@aSe(-;(EaeG,b;[SW[UW7+<D;G:c7AMW;FS;[A0PB(]C[D:N,cLN_b9SIbE.\a=
_WF?7ZI47UC_fW\C0gg@f#>:)J.Y&ae-#F1#43-A3(1;_J1O=9+JW9PQ0ba@S>a(
V?RJ+N=HYGS;aFTL+3.M]a8GPAABg[.a86?5SA#Sc)Ude+QWC.AZ(DRd1&=&^Sd>
\9<J:1_-1E+?=Z8:/^JLeY.,1.a>2&HPe;5V)>F20>N]T;UEO:A.RUDM)b@,3Q1Z
8:4eI;>B.5Z._TIeEEQcTU5(FC)=@HRURJI3ZGB6eNQKc23VON98(J-VRE^E[]/)
/TFdVLC>(A\CLL-0)@V=N;C9f>J1O).7U=R?;FU-ZZLEE.C<SF/+g/aGOWgQ1Ma,
9U(GceWE[B1TI.^0f6ObK/d4+MUZ9X5@/815<WWJ:W]J6(1M:][bIST:&A]_UL=\
4.c5b45Sfd<VD1#J--f-0UFLJJDCNeBc]T9+9H##4?9Tg8]2X0PL,[JJA7^V1:E\
.EDFPQ97F4W<C7(/Gd&QT.+DV([AD;;bHe?U4f_39BT2MgH7)6=/G^=,^(SL_^ES
^K@Ve6V,8-eWK?98/7;C92[2S=D,-/&5McO7e77RTVX,4N1D>ZNZJL3fN[(N-O;@
6)OX[2FR9PL32:AdW^L__E3M#_C(d2U&P8H6g\:M[NMAHa=K]?[I.TWDON0=+WO[
;c-0aBf7@a.7#DNGF(Z+_\/_Ge<E7a<]FeeL:]XZ)J:C(&d>gD3bDT<3[;^XG08S
([0d-+/3JQfgAP\dI0Mb2PdSA8KFVD/@ag,_=X?GGX-,<SOYM0,D^W#,(N2JI/NL
2a>->+P-MaS-8I+#eU0WR=,JFLF,67H>/#^-,>;)?50-Y<U5X)Ab0fW;,5;Sg+V-
W97]d4CET5RVReX[f)\VfaQOf,;3?4Z2</&L_,cPbM#>^+,g&ca/@?&-E=?Af:YI
2]SL\G\-[<9=H(C_SH9^/0CR,fGQY93?Z75IMDHK_@)@#?;gGOCW:I+GZ5#:YA^T
;Q-#UU/SDD2XaUS>dXaYS>)JNC?N0IU,9<cE]Cc+9M?S[S;[GI,b[eA4bf/&5420
V=J25F:f3:UTe?(;R6_B:L]RBRaVKH^)36BPS&Ke50:/\ZBHFXI[g6bU3J7XMg:,
DOS@)P\(;c^9EU/Q?<U]O9._8AID\4)df;^;cA4FI0HTT\-a.g:OI2@HGc-\>3,H
WYd/8O4aHHb_P6V35YQN.R75FM4RTN#Of=5TF,=_PLQNGG^KM2Ade.H6)L,1HAQ]
1-JDOLbe(\01,X;V9?Y.BJ-ROWA(_/==DE9S96X(>6g/G,U0AU^5<eK.1e_DH^D/
@KX=<BDfZO/Bf7XYd.^HFNUD86E(ZLGRU(ggf<cL7AfK<+f:<RU8S^bY5Xd:c&VG
\8OD9:G((=4+DKP6UB>44#_BFag[g1Zde[b(EYb>,^&\8M1+&dTSK=eU^-)PDd]]
Kc()GLf)Q9:g]1LYVb_Nd6ZgT1d^PAf]2AD#OWKaAN8UI7aKZLJc++G2]=QKIO\O
S\5QB#\F/8IP;6380ET(EX,P.MH/-TQH];ALHQ2MOLB2A@YH=bW^V8WU,LL2-P-5
EDM&eTTJ+Mc6X<EId0;.O4./^P@d;eMe5EVNQ.,e:RX8g.18b^J.ZF6@+WE-?1?K
@3AR4V@[7T:?b-DC\fAU5+/KO\Cd;a?0MS.4PZR+MM5KR4M?;DGNF9:fO(H94c<(
/7U<eP(2?XfJCXVTUE1)M5=FFYG(c.RJTfZ)6B[RRZJ0G5.4/Zdb6ZHU<AaAECXd
.P;=Ladfd1dO\T(FB?2>YEYYSFMdBcIReL3251S2B5+Aa6(Mf.W_#:;>^c]B8OY5
]3f@SSgE5FLL,<1,D=4Nc^4RLe+OdeYRgd3=ZNAJXGA;dRTT.eB-YX,9b9?E\<)>
XRFO^6P^5JTc\f6gD4(eM@6cYZ,=(Xff;P&EVAbIb_DfQAJfdF:V+CZ^G(+1c==D
4]T#3G<VGLB07(FY&bVK:AdcYL;;H.C./_3\?fHYb?3DG&=2+(@8DK1Z8bTG=Ce;
;Nd-07^aYT?8M\P8=S<2&PD\_gPY?7-T<[A&9(\f/F>-<Ye:RAcN_aDV9^A[59?g
,YR:DMOG2LMG0)L0@<BPQYL/fcaLS3#HE+J?T@L9QP.Oa\A^(8@R9G4J4R5U9d>f
gU,QW(N0.(K>?,#=:Y4e4?4\P5IEYWedY>-Z=4-/g[dB]V#T.0Z#1)/)/_7BcPZ]
J&)R(7DBG\:Z9&Z(&[=A3C)E9J6OPAPeG4R@:EB>cN>]fD7Nc\WFb8HDD;&g1OG8
e5R_8dc#6>RAMZ9./AbNTJQ.<Xb-N)&@FEU]<,WefIGe?ZGUB(=JOTYc+(cB4/72
4J+1EAU2gY8P?G_?EQNM5fGfMX)E=[WAD?^J\a4#CW:(f:+/^e/b)8>Y5^9<L6VW
9</7@_T5_DFDA^\aFVfeW>C0[O4/:WO)8O&-S2FNc]T,e:8F=+JeV_QMS2P,__e&
TZE0aY(M(H-+S@XW((<0]KK9AFQSV^(8Q4.NYf<;]3Kg/^5@>R_F?K?:<)(@?c>C
;[;EB;BKZbBGOT\26KAJ75T/=W\Cdga#da/.X4I?8+8X?JH\8W7?QEWW-CT,A>:A
Q<,;;9(Y#=X_L<1@K5R53\+QG9g.DDUNHAXO5@Ia/R(@XW+3^K#3X0Q)Oa^L-b^1
&NLLbbC?97#Dd>(:c)T/RYE)?C.?]NQ@Y(e_XO,>[Z]a]BYVgOdLGW5J:M/H&E[>
VVP_FYKgM+9c\BTcIbN3fR^,,:/>.BN7;G+V,2AV7Z]c;7:TaE@8K70Mc\CO&W[9
?T;9T0MX0EF++<9[70c70HD,BV5)=@-Dd&DSP45]O/eFH_[DJ+SQLGR2._A,W:(5
#6=P:2fA]PUT^G<2J@[J;Y@?f=[L\X1P/:ce4TG78([]&T1_eXUT06QXWCTcQ\K:
H8XaO#;@AcATU^GXe=Yg;M-Zbe@8d0S_TKg1ebDd(YH:@<6BH,H)Fg/10=O6T_0D
YT@]J]<LU#F##]>&O5bIa)&d21ScZ.:TN>OK+<Z3JTLR1L2#VN9\EG6T8+,G0IFE
gH[>L2gHKU7aFOC.ETQD##0;e9(ab#8RO[#\J6BVRf5=ZFAgKWZSF4_&;-A<PB/A
(eL32PTFa-7NH<R;#517K:Ie]TDO[=7+[,20H]e(&V#F(S59HOKQ:=..98-S4W,J
cRDaQ<M3ecP?<[LMY@>LBHCeRc/f/.c3H-&3>]__@f-YTOJ1HYLMW+0]LaV?GAUZ
CJ#2+C8;bI=I;UcZ^48;<)FYV\M?c,SE0;/N7&>g-66geIEZPG2Tf]^\YE[N+d&1
S\db7Z6#L_A2S&X5eB5QM4MM^7N?c^d90&UVRfLT0[K&=AQ(:SR:fE/?0<c-_Lbc
;X\:=(-WcMB86V5V:NBfg?&aLX_[6aU;.V^FGG#cE(\_:Y:;[c7g0)OQbGLP)</>
N57O)68^.KdJ46B7??(LY,K(5.\6(e>1=MU/1M@O]-?:TK4[RRT5Z/&@&bO5X5M]
ZSGNW/W,B)H]=(M_</L_0)GE)X;F7B[V3AOPD>9b<3RF?.-YEAAee)\CZ\L#:RA0
D)<9.JAS8?>>8YB]ZO6\2dW@)8/RP94W-;:9#2#gDgbG^9YU8P131c;K5:KO(/QF
AHE8)dB]+,F:/B.)J6>-^(VQe0R2bSEgO384^;2YLM06I<;UJ=gGF,3^P4NY@Qa=
U<^8dF;<>3:O0U1D:H=]Z5f&&,Y=F^:P@c-XQ#fMC;,ORZ]V;PU3?f)L1BHP;6fI
17?VZa][>JCQL/5?f/HU].WN4S(?;?5,3fX/X_Q(agBN[/Fff4Gf.Ae#OMAI]=IU
;eXgL9baZG/4JP-O^U7F<+^>fS4GK>-+TW_S8Ob^)XV36NeGK7#+SC>)/gL/.0@P
?J(?KfU109I2JQB6BZcK@aM#[eED.I-]UFMLZ?SYgY0fCdCR4SK?f+J7PUQ<5bCG
>:>Lc\_;MAV6KCcDL)I5=JYZ(/3f^E0Z2;\a+A85/+aE[\C7[Ma-J?4-.,1+JHQP
7BI>Qf<](;^@@_Q/=CS(71ZGHI@c;cW1K\>8+cV?afD9e]_Y]HJE<>d1OUfd>Q6e
b,(W6JLgc&2Kg>V:6[8Z022Ee>fOc8N;4EV^[DJ51<d#?I0<++GdW;d:;B.@R<P@
O#ADOK1+L@bK(?d[NH[;.)917<.7_8YYI@BfbD5[d5_U#\^I5L_]\:^^_2B,bd=e
eDSBEM2R\d5A1@G10H/>g;ga[fX\dHR3H(>ISG+,8UdY11W0AE^RK8#KbHRZ((8-
UBJAP=c(,+_DUg+R.[T#X8A4bN(=)G4.T,@#6,NVHe;S^e76&gY@/-XW,0?c>2M1
DDA+,OI2ED.(H_:@E_T)9LK[df7+4>]J]C\4b7>=WTDUC?fe=Pc3L/;ZT9@D3OGL
T_9a(3@=WOMWaQ((_8Z7OeA3C8[4E[T8ZMC#/+[@f>N;dXPS=,4Mfg9Y88&&S<[Z
,ORN@g#c^e#eJFE.\-1O-Ae#-M^PIW,6WE[(=UG;fAW0CR_W,Y5e4RN7V-#eXXbV
MXJB7?cR,4,N/,&W-P[NIH4\P/F;S71F^EN;5&E#VdH.N@=17QM?&eS0Z5GcC/K[
W1&QY]ec<R\3-L/e77Ef82(G^PgF0c5VIY_OdNDEXDU984WSLd_X2X8#)P7\FHc,
6@A46f<7QVL+X62?ID^/d531=BFUP0KOW:O0RS9V]B;BT]0GUAS)^IddbV(g8a=L
eeF3f?eGQ_0^J@T.KDPM2Kf83#PMJ8@ON0ZGf?R7DQT)\,BLaGZK]Jf31M.HYZ((
1XHOB>O\2K4a<INK>H.CZI&8e7,XX;@RVb.DUKR_<DCP<CEA4/J8BX3^8I6JRbMX
:00CgGReg\GYcWdSX:\bT]6c(+,6]W1@Q.Q-SY@Y982dP4dJa?3UbLCT=NRFK#[D
QRUS(Q+AgScI.RgX2>&/M6UE@48Q+FZLCMI5#@W<21^W1Y5/Z;D0^P,M3GY&=a#S
551-:41WC-SD>geID@]B//_LQ1[@VH5aEW&XdKRNPPfK+(Ug?4&[@C7>d<+W+#/+
P]5XVGHfgT/fNWPaK^;EB:\Y@]2+M9\5P?f_UNP+7T9,#1ERYEXF6:+>A-95ee7J
GOL34gU2\J#Cf@RSa#->N.9@:,Y?I\?O:aQZWZf).=:8aHK5@V67d;HeGC-=@>/g
#?.@,)B4Y<(OWTFZ]3c7G(_<U^@GFUa7,Ic[0e()BM+@AL_S0.__J9CeMWM1a@e5
&1DWP\I(305gV9B\[D=(CFeMc4:1[LZagN(>6cR:)RKUL;4Q0Y:WV7[?7,_OAU5H
5@UMD;0dHKG0V<#dL<>8UR;gaE-_Q;;a2RY:X@_^2;FDO[7F##B>.cSQ1,A5&3VT
9#>0FHS,::Y><]9D_IKDG_9[4#e_2E_T/H1Ic]_MMG6<43&L(J5B#AfR_ZHVbJLG
2PV,Y_=N?D&F9[<EcWF2\XAW[)WbH?4g3f7/C8@:O7JK\Y>?JF7-@5ZL6+C;I^L7
6;)9SeHb257,I]Z]/_WTH8#2Kf[7aZfI9#-c#]Vf91bC:e##UZ?=51&.bHHWI8L?
g4389LUbe?3S8#\0M)aFXX,-M@KK14?,:1;f>4[_Z1,,7g-4K@SWafHgF3W>9G?a
d=@R?N=K_]e_,M_F<B)^[fB^;W1(B)0ZdBFN>3X#627\8MVUP;R:IdW0:R#eWR;7
M74fYb[Qa^_Zeac8Z>&Xf;[bTXK#V9MY4P&A(bC@;ZQGa=7eR&WO;^P-8Y3<O01e
UYSPgTRG]9M1H.X(7FJ^4K^>==^TeL)VX>aSE&N.4@8126SK-g.Z7AHHIT&D7CTT
d]#^eOg)W@d\O9K[Og54I0^W0/.;H_Z]>ZD3:]<>0C.8U?WeA:X1OM^<f>OY?[-Y
O69fEKEMKPa0#:@dLLb1L[dB1+TBQD.9\DcCc4<+>LS-g5_^gZGRe0eGO(c;82)e
@)L#M5]DEFZ4[AdXD#M:Wf5dL87W.8Ja<0+bCHYF66YCR.@N?4_/E0J:.LYC.(DJ
(J_NP1AB:S;2a+2M\W(NJ6L=[#JB+/.BPaE5[TI,0S1><D8KQ33C2_H#bE/6UHY^
Ha;2=+KSF7S,+VM\37A5\d#VWa0&EQYA5eJdQ@PLB8(1C,/0]GZQ/10WV(BgB1]a
1O1BZZD[GV/7>Q@KNIgE;QZ=QX5:1\6PB^X-6,ISVfEgA>/<0V/)_gb_9d\/2+)#
Db]=14,]^I&(f/GR7[XC2Q)@A-LK-T0e+<&2IRgJX=3^GU8]WKT1)\)&.4,Z,SIg
f?ALC_baQ_Ifd^D/TIPVAZ6?;OUT2[;#[CP@+VCU\d&-CO/>\GM2KKa]8BWKGA8A
JDG\f7fK)JTU[3X=)/\+1SLTKL/7cgX_^M;ZA,aNfY6KCD[)b>IA^2bDYE]+)2/E
^S=bW>99_QKFZ[)W;BD64+Ma=b4IW[O>L3BFfX\c.1B]b[1(c\c4,]GB02e^=I?G
g[24=^aRD#8M)Ga^)ZHEFfeIgOU]MDID#A-/4=?0_G7\>a9,K190L2F5F,T9F79]
,KX/ZX7.<VT;HGNbMgc01Wg@W/^fP?_cgQ,9&G.-A;SE7A#46Kb(#T-/GdGafGa(
KD@58/_:JFccM)PT+(T)&Qc];5D-RP+P(\/RL(;<bdK?2HVeNB0S-OPT@Y5IJMH,
V?c;_QB>0[a1>9P/CV[&8=P0JS)&aaA6,:5.UI6S\T(60YVY4T_N0LEP@a.cEUZ9
BHWQ(<JR^A)I=,CX62g]/4_3bBfTVOW:e.(9];3Wdf<R+914QL.V6;dbcQV/=082
\].QVFJC_OFRY&M3/^PHNEJ=C+@/,K(H]P:VGV3IFO2?TE66.)]2gU[CW0/N[3gU
S,S\IEg1??-<Z>=WU_?D/8H?6:-[50_>BJ-/aT\&YWQ5;DLEEd^9Wf1K&/&f#7(7
E,^/7M=82AE.8bUPQ+Gd2AD#.cV@L?_3(R_f8Sbb0N?252/HOb,Z:M>X?3Ge2#Xc
]b?7A^RBU^#\;ECe58)0,,([YSdQ&cL;W:d:_U)f7G^b7A?bV>Z-ec/ac-e;)7;)
DB>5FVRFE6>QV?J4]NeFKJ;NNf@QTP,O;MTCgW#fCFQ2TRa^3O4/MV3K97ZUMJQI
?#M)Y-XWRA[^0_]Ta=PTA/>FeZQR1MNdA/6.:S5:f-\cQ;B)Z:/fJR-4)J3V#YfU
4-F?NH-,OI=#_acW3Qe(a9J8IDWQN(L)Y728#0?S^5&CdYeA31PN:8AVV?/>Ed[Y
NI-^K_/M.?(@N+\IF6F3_bDB<5DEHcV3B1H,@Cdd81=fB/;TL7FJN8HWU7<NG6eR
eJ.H(d-QKD&ROTIDR#dCe?6Q?a.I5+V1F\GY[9M0XQ9-R#WY1fcO2Ng1;[\/61F^
1W,B]]-aVZ]90]UDDQF+9F]N)dT/UgK^8_f&d5@ESef0Y>GSLK5O-@aU8UAHbKZ<
\c?@J9][WHV45,dK2^VL<1XK12KUFbD^bG^,Lg5[VJBJ-b#,:OP>=Mg+R>#/-XK=
6+F2F[a>>#R3+H/7;&G+\DQ=eZf:Z,;O3->-(fD1=GOd4W,(3=HN@M&ffCXWef.c
YSc-c+0692BY]0FT.M22OcRV6:X4Mb:F,ZWAMf;PLWMS13C.D81([?ZC;d\+AWOV
=7QQOXWRZ=dL1?U(SE>HZW?YM+ZAcY)FV5fHC<a9d=e&H1O#M,ADeJ@VAYRP1NeP
H#9?SO<T1&,V0M4CFG,A]-R7?RB.aI?M97=\O\+@c]?6UQ&Id1&HbQCcKE=2L]S7
>NS0f+DWf[JV?,EX&LW8TSZf2[R1CGg\Xa(Fd6<>P;8R[eKHbdP6Mgd;[g\ZbT1g
>g1,:DaSOK92[/&5?[Y?CV+XY/DJ/cA=(J].ZO9>9/CGG1>BH40KG<=(UGW,_e5&
]eOe3)(YO/dC/\8B/94d6ESJf<0#L(QYD6IZa<gL,]\4\_b1f>bH.4<0](TOfCLE
2HAZ8R<(FJ:)^L;RRFRH2OQY8)\EF5^8^(MOg07IB.;OD^VB]X59=_+8UQZPZUR+
SMOg=AZd]O6=DIQ=?MY62W.88@QR3?3:3:B<V+@3:=MX9U@IXZcB0N9W[=8Qc?KI
g-@c,N=W&]/IT?/A76.bX60?aPM_dAa3:O\UC[P(14<J;Q=d0ZA;8>497602Z08<
](GaU\C?2c06E8^.^MXg\QW>^Ae5(CNc<Ic^NJ=VKAXI0U36B)56VL:8CLUEe?HU
_cbfg.RPSHRN\C&BSSdOPAL,faf?9K<^MJ9/@+Y:eYb-2ET83?S^(F5^5UQX2?5M
a:3F?XI&VS072=(WRB/(9EKO3OVT1993SJ3dc(ZQ3=.Bf;//bf)-HBUU1-U,<>29
L\F@/=]-c_:=@)#AB?f5eJ#;7[5\1Q7L,:IVaXM]A]NfaWI,^b9_<DA>:>YX6SDg
f4d847Y<6a2P;edLN/MV?Ha6GLZ-9R:6Z<H[PWVI@4b;H:3]C:](VXE]H2().OI>
0MDC?)5SY9&Z^\Dd7UDYCcgNBJ?6JCd)+bIPG/N]9VLR2PCc9g.TJ[WQGNaM]6)[
#bS4;4J-OP7gOM+;Q&]cZ]_>E#T1:f4OT_T@?.&8S)QO?IJ1E<,S5JcJTJCY7O62
bI?2L]DfFaM:&f:<;O<XC<C1:DI/?[+Z^O3_SKHaK()(6Ig;_LY&A6^fOOe>Y;RL
&_1@aI\2X&QP.?L<UYcA\U[5U)S_\0?dD9>IX4VW1f-1A3]&Of>+4V)M_RKbY/J@
RZS]BYfd/CgOK2V_?eJTED]AM@I.a19B^#.J>A8:--L(?NVG_]SYSYf5X9d_^,b)
?V[IOfdTbV?)G?K\H[#=RZ1GPRMT].CXAW;^NYb.#SLEL.2@[6Z9B+T@EK?/g=X1
^BNZPDIU/b,D.A-/MaJRb14=S(^c2[Qf>+-UIb5N4&ZH6B\^4N,)PH#d,MVXg8FV
[EgOLI>9a?K3O5SC<9][UP+KFI15bI23X^[&e]aZTGHK/TTM1#O@XR7:^O<282gB
N5cffJ#,)],Sa(Y:?3e03#E).K,;O+=/8b<9N?2=N=\?PLBGfKcQ/HU963P_OXLE
=(OJH12F]RNAg1-TIB_>]+40Va_@?>KMBJ@.+YCC7=bQ\F2-W;=3U:A+-GO1:8f?
2B2CNT>Z80<<0>WEPKV(dA@66OeTE/A##=5_66?#feIKPT_fO_@9gUY=E4TA6If\
&07H-AT6-DR.9D06.@IEY#M_F/3W9_f2e1_?b9\JH>V=a,SV]/ZY6ZP=5DbF6HF+
/W7c3A>[?C(\ESS4.S2STI;XE:[[Mf@d@-fP\#^CA1..GM-2<3gPUW7:_,OddBPS
-K?,1Md(a_Q^A=[1/,bRS.=]=X4/XDcLE6HRRH>APEZEGTH\(T.@+]_<RDK^-[L(
fb;[7,81#LZNDW+0fe3VAY<E9@CA;dg#JZPJBga_Z3e/IM.8W1cNZ)F)@XA,3b(=
B=,<DFg&HN?N&[3+g&G?D@34\]T=>Z3b]<[(L<VfQUV;AQB:aJ2:15FNTYef&4eb
/-<\N79B\)4YJ(49+/@E@<df&/EeJE]JK7EG:_91gACI:#[S7X==aJeRKKJ@FH<E
O5_<?^4WGES.U6Hf=>UAbgJ-c[eL41O+K[UFSfgWM@04<7+2cQUVVdJN968JDaL+
7N&7HW/U8Yc?c5#BBH3#>5U&_d5O7WV^]]-2(B^B1+4DD,L<)&[XHCS?HO10ZU)f
?R2a(V+fdf6UU/=0dI@5DZFRg(__U+@?\JT]<fc;8E5\3O2S]<UU,84MON)NNX&A
-@X0:(X-4)#?]H4Xe&KTO5G<22:[]N(?N-6?5NQX2Q(KG&T/+=REG8@3NIT\.gYL
#G_\L1:>9?+:.EBO0-=CE5Y7([ZK5T)4^Y=-7E;91#Q-K>E/eP<^6O;0P;f#S^1T
\HF#F=Ng3X6&NL2PN4Xe1He75=4:I&];RE19V_I#=4LTf7dO1O:C6e8)I,K_.:.A
2E>U&Lc+W/g>WO^,&3S^g1I,)=TD#_5/BSC&/G?^-OATV4UXZ<J<N-W/;e3/WYbB
5ZI=AJ3BC1Z>T0@=L#HVN;E50eK0Ff_7<8>?X7b_WR=T@c3DYb)1MZ#gM,Z7)/]/
;f4OH0-4T<ad^3^,?SNQI_T>.&)@LT6eb21T)4BM,:DQ\C,U+SfI1C/A\EQJf,]C
I8CcIC<eX9S>Ag1LHN/??OB<3MaK=4fP)YIe]\9GI7Y7)?c..GRWE\.@CDFZ60&f
TWK[@Ka3V-O?X15Z(^[&L&EZ[FPOQc##W#e(#=)@PEYD;Tg4:<NX=_ST&Z0FE[TZ
88T+,E85J.eN/C>P@Z^G\dZ2_6<5B/GeT#M3/0Y2<C8C_=(&&R(TZ.B,aKeVe43F
SG@0(_VgD;.b-PEEQVHK,K3VIYDf@1GU2LXNO_eNI5N^4B2D;MUJRe;C:2AK3&L,
g(,-=N+b?\<e(?,+#A]ZEKg]?\5/;;TI?V:C[<g8L^,ZY^D.ZH@L/@94=(:?HHT#
>(<WcKSe\E^Z3,b6=Ib^A;Y&aO-N(6KYfWFcE3@IF=QO[9Od-JBI[cC@egT^EFBC
>b&fW,7\#9,:g5H.a#^<-D[g9d76e?:792cg5RM>597UL()3T=6/J57/d-fQ>Db^
R6[\^RLYICbX\5(6J=:(7;3&YO3d>,eafbXKHL)MeCARK(76eZE8X;@S<8/Q-g\C
QSf)QPGWIC,0WBDLKV0cEIdOd.bPeNP7(a\,P(C3]ZUY3)<FBa3RG#aeGHOU(U6Y
f(ddY7,GHUH1O+g4/UUV&B<VPJ>=0T(TLU^,B2X.MA^>.fG>DJBU\=]5L<,;4J\?
^5EZF/K^a3?JLY3D=\EeIb>3NBONdaF<R,.,g:9/Yd#W>JOKA03VA#7=F/F[4BB;
HB]f4d++>fMU>2-d3B2ef3&;M7[IGeJbI=(^@Y9)LdgSc\L(W\UOVPPKLR8HP3/S
<1SQaXV,2aeIR>V.(EKN1HXGB]=G)/e-8+:E2PGC]V,;Z^0,3eC^F\B3L3<a-faA
.-d@BU;YI+A\]=NHH6+J#adKU[]E>_&bWNJ)YO9;LBc[[O7b?82BcYWN><R?d8;J
d_W(:M6?1SC::>P:C,Hg6e3?+@(VYV3_D7N=Nd[A.8#d6QY9FA)2AD5L>\+M8F1I
Z;V2R_)0C,\[KFC;F4e_P&P=/JB1/fPCH^<0NFCa]2)U5_YUH:1?QU,#UYb9)@-B
H(GU6C^_MKG;Jf<:JOY(G\ZUCf;=bf-RS#&HYU0aaZR]B3L]L]+5cIKCUQ[O_eE.
ZZDUR&7G-8OVcgO)bZUKBA9DTR_<DK3-N^F.@F13K&/VAG]-=UTQZ?KJHJ71QFKY
FKe)/TOM/2N:(LbFQ.17==(DcU>IV@:T>E^NGXY@W6GPCD@QV,=\RU5K^VDfcIZf
]Y?+2g>KA=60VOF=-89X=3(YZ(>B[=f^:(43I&0UTU8/D<>Dd7I0B;G08\7Y6XLV
GL):>cQd(JVQcC;,,?)D:=.6C[c4De\Ef/@E;AbYdc&PWBYKQD-3/1^=eI/54Y4:
V5e)TXG[8#Uf_/YbfCDRDYY(EWAXK2A1G\&&f:;RNUV(5NU>]M.R(Y7TOP3@^J3>
5ddT(e[6KI@eO#1Ia+A0+()Wg.YD?d\&<5Y<=JJ8bHQ44N]G[ZT]W.C^<6(OCDe&
/TeJP2-X8S<,X-Hd92?PeGbc@[8acNd_C(d,B:^QEg]7TY>W8?&9a0VV7C/M<)32
KMAcDP&JM0Y2ef./0-cdUSC=GB69-T2d)f8E04:7;TTNE=[>CN;CPR3.D1J9LJHS
4DR+N1D8#g>9C[-@(1#0/aA(g9B6[CY2fY)48DOA.FUJ\TO=IZgRT@?BD8<BS0:&
16;S/gI>ZR[^=#U7aY.7<KI?Q=5>#A]RB#-5f.gT\7Rd2J80II?S]YB]<[MDdG/Q
a93B+Oga8K@?5<5<-U9AQGI+KPU1C=^9XUc<73GB3JQR>ggRgI21b8eML00Q^]Q2
Y_5B]443Y,^V?VcDIM?R@AB8I\S/5Z51?SYbC7O1AW,BGWMX/c7CH-/Wf,OBJ?bL
2RBSIPcO>)4FKgg8BbW6?157.gbNJKJ&4++bE.c#NP,WRCK=WYWI0MWDR3SY]gCX
/KM<GIF+BY1(61GDe,aKH35C25NT\2Ub;d3]6eJgCcCUFZJ6L^5AMaVb8[,P^63/
YeAg5dUOL>:SN:Ud#J\3R[H<@#7B:P.K@DPW24)+=SQNZb/956E27YAN37A/WZ\9
T@Hf/Y.^/gR^9:T#6(:1Q-CD8JH=M,gF4694Z[_dNB\1YAc9\N4KeI_L5F5EXPbD
/=4GFR>b6RcWQRe.@JdeDMC;[IMc<A7/PE4<+ZF0dJ[+BA3NVDe)[/BXaE[HD@>-
A/B2LL4EF&Xe8ZK0a:(LO,eW0@:)S:D)#.+WPeF?]RLX@QQeV+ZG_Ng^>KS;ZO0.
Qc4_\5#=?^&A:O)(E2X;CW]6;:MGUPRc@4H&Sf]WZ7LAGc1-8LA+;fQ.IY/?R2(E
dNdQ/+>;REbO(]E6f6)&/fIcP>R=K7PA1A\:B;0\&EPe^MSM6e68eX5#A&#[4BO<
=MFY#ULBTPZ4X\MA0]Pc?JR]<Hg3P]/,4XS/69PQ99dCDT+9>>g<e>]MO^[LfKdI
81T3[Ag8eJ0IL\;YFN=D69@&Mb@dF(T;@<.ba^YA<E:C<I:NMASX^R\GNEG5KCO(
0:RM5&^G.3>2(94)@Bc\b.:0f7b8ZX63MgW:Z,6gI+U=]>4Y.;D;.T,,YGZ):Dcf
,>5TOR.ZTV75=/.?-ASQM-d0P?>L#f>eYeO(=R&PWRXVP5?g?e0-9;.Gd41_5VOH
RCA@\06La3SDOV>L^Ld&F=^.<L\G7D1PWF(b7\OS^8O[W>W&Ze^bSe]7aM2]O/4Z
ZG1@\3MZg-/^_.KBc,W_CQ;.e6L/SNB\;0,X3P.g2KdB>+Qf8&MDI06R[HQ;FZ^@
3@:6^:&7&W8:B#XEV&0Jb<2,IFM/X^Z1a&2aT>#a^)CS#J6fJb\ba4CDV@>N5-b_
WgcHcQDZ>CKUQM9T#IaWA?8eFY4bPa9AEK>H0GY]#F3,?HE[SVe9F@Y8@<gMAgV)
cAVK/H2DSSQ5d]LI4Td#OL0YY)LIeOd?A0K#W_5R4H(d5#b@7N;^-RKR.7\)OZ.I
MH#K<@#=BG8K7D3)HdNGAbbIBE=,5,KK(HRA16A:9d,^ObWI+ON4AT,)TB69XD#;
2DU9^RE4<&Le:LIg54\:NI0\=?eUH/Z;-((\AC^X2DHf<<D,9_0N@dC<I0R+^>c,
Z:^-R,<KTbG6A#>JR&POU(\:3gKSbEe1O;M.SgI,4^273\9gKTWI)S3Je><3ePbL
NJ0WVNB^(<:+=DNLG@2_A7DUg3@3)[PCL.YQWQ/R-X]7^@,VH<;E]+V9PDT4CJO8
DH[GR@6#5P&-d<Ve5Y;[?Z](MWX0g@WRI:#.EU3UJQ<2.J1P8HUWe=\aC>AQGF5c
[0&dWND@<YAEWSZ<:T_\Ee>K1SX8>P&1U,;)9<fB&Mb@abI3cbG55E4@.</^&)Ye
T>CS>]5E&F0XGPT090X0/XSJ92eC<bY-<?][O7.=eZ3d8:S<Fg/2Q&D)&eIf(&VD
M,<PNPW3RgR<+d2GY>_dT^C\Q(YGV^#&[&>TYC@1Da>E=3;,<XDIOJA:TD3&bK<3
(cLXb[J-#1]g5T^\NfODaD8Y(B=N2KM-f0[K0/.b=(L?&Lc8@)B8C.g/^4;\VBS:
+XMAALP2Yf.3M_F7+ZQ=P:U>V9P4N,X0bC<#=U6Pe]\=GSg[0a[QN^&F:8KP=6Gg
+5Bd8bU1/8K/&XCDM?=fDbU0RV>C<gf>@+IE<SY5N.<TC)IRaI<PG-_A9G6R595Z
cY1YK?PH(91[a,HH-Pd[7ZX>DXT&BV3,PX/.P@7T0LIEZ83.5O(Y>)aX)&O\FTcc
\e-2^3G,.MQ3S>LU26(#c^TbMAC<U7PaJ0b<OTLMJc[LFXZ\9Af/[X2^PQDR8ef^
Ea0JT[F;6baD/+\L?,9(M9-/01AbIbE7:)0CVG/EL6JHYS^3b;dF_83)NQD1.c??
LH(P7Yd_/Vg)/eU/&0EKMgO_0D_9E=//O]dZ(5Qe58OgT6g5-,;C))//6KVZE1WU
]7d7MD_29/S25@[#88NVd68?9>^V#fQJDHISYSGH@cdf)KY>Y14\39@Z>4:HIV3\
Z[(/0P:1NL[&?J@2M#BO@6CIW<)RB><X=B;Sc)5?_9)V]\7[T9:Q<D:gLZ(67-?f
;S6L_faU1I(dN-fG.DIE-4YZ(;@2U^H&A-T@5E>B;7_+MA1,R/9>,PK(_\A-OA8[
9T=f;--1d-O##0[2(2bB3JJSK0B,SI8LFT8c=->^Q[^)\cDf?>C]+1;CM_#J=.]1
:H8O5BF;IZ(JJ[,#0BMfS;XH[,GR(2\A3OYRQZSL&;PH2_dTa=&a?eN?/4e(P^J9
U:ec[FI1b\VgMD2/Ae6\;F25IO<4O<;5K8>I/fDM8<G#5-4Lcag3+M6aM\[#f:cS
0<ZaQU\O(<Z.G]LPNJUga9_;(OR\DfN+JP?gM.60c/V0\[<\SO]NO<</=b1TWeZ+
S[VFJ@E.4.g5NK)IUVZ,\a^&4]f,IMD7]RDT[:Q.TK-/DU3aQH:R>VS3Mb/a4GM[
I::<TAJ1Q0S1eZEEd8Z0T5U5bc-RF<d9>\_Qe\+IbU_2LT]>2P?6.aOgKT0faIG/
BY=Q/TL+^:9g.C)#GMC)EF>Z7GLN4Q&&fQ4)Ua)#e0HbfP2(KPcI3OX]U(LB1?f/
JZ+c,3]NZ2EW=Ob,4FH)C]]C>]XVM;Q#G4QT9:,C:<cLI,;PH5U:/]53J_&fJW6e
27ECMfbO)^\4.TH2QHD.4B[fKe?6I&EgU7&\1?+UAK4=Kg)5Pa12]Dc9OEL5;F,b
+D&^D[KU39a]T,B(\)F/@V&.PUKYR6&^^,/&ZYGQ4CeIK,-M25>E1_N695(D(cfe
V,AI-WR63aBTTWG29ZGdL/6U2Xd_45Mg)630>A?Xdd3EbBLCKZ<@AW[K,6Hf<6[I
#bSLDH7Jbf1IDB_G/#LMSG8[7.8&&3T]WPTF+W-,2>:#>6JFcE-g0NN]FeO5P4e5
^V746dU[-Q22<O1>YZYMf\)_1A=+eR7:-S+G#.Q&D6+ZCZK5XGcLNZN[@SPC65#W
G2IGG[6S_C.68T2O(bUGB+S#1Cc_()K_O;2,\K6(-J\RCE7^4OV^.fY)=)AN?W/F
:9J+TH+cVcL0V7d;JK#,4P4;eSX^cbV6@eJ2.@BfX+GZ7/d:.UD[A&;>S<d)9f4O
&Eg:A&^6Eed6b^V1<CH(YYLP=0;7AAM#1]FJ[;Wd&\4>fG@_]d8T102TSM^I+Z>L
,DbDMfN,76Q@89^fD4UUe7199E]::TT]eT/DT]fS79P@P6SJ?@?c8NRF=XV&0B.,
DKF<&GYA::9O+6Ga^6R;6E6J:V<f,]J-?&[X7YYTbV#9fJ9_c?Q[-3-\3]e,I,Pf
Ee]2];GLYMWE&BQ9afJZS7<7H\B_fH(6#F##95;=BO>-GY/X3X)7e+bf+V]HC6;0
83[937O_J:V+;+XL30CGX1&]a:b>UEC:YSI5bfe7J86PK?A:bXdV9^S6+AB,8HQa
\&]b_L@0gQBY&ZgJ2M9X8UIeMAX#F>5PE8D/>IHS_0\ebd,7#+6^?Ha/U7LV-/@E
W4RE5.gZEP,c5NH[MA94RDeW4.E8T@\I)YK+97,>;@YdgA?MYBfT_30#C;f;B7AK
NSb>d&USR5a0F7BS2I<J^UXDLf)Ne6c4Aae,2K5=e]^.UF9BV30:L?_MbTKgOK(-
=3&#MR=cT=R\9IK_G(G&FZ?MN@E[6X<JQJQga4dUUFW+[LH]R:L[V8e^&M>&Nb8X
g2/7,#8GZ?)GV)6ac6L<(,S]OgCdI&aC;&R#ceR+].4c8b\+E:/QW&aN6B_b,XA;
M8gc0L7OY077cHXZR8BR>D:dNPY[W-<#LeY:dSDN5@U[\)G)R^F(Z<AFFMBNFJT<
^X_P-GXe<2BFY>=JYY@Q+-=.QQ3-b<YZ)bM#&-A_[LR14fe0:=G&JHK,V5T;VL)A
_+7MY-0=c8I[B;E<^Ggce;@cQ2eISQWd/3V=RHC8(bOCWJcI@g_^d<@=[SN[;2<L
C7)[fH&@/^AJDHIMMe4WMP_D7)]A_G9XNI[;?XTEOE8g@(MTNE,F?V?>:/3ZT<=U
T-FfNA+b];<7Pe,:;^T^1]_86UUV0:]<<Ag@5P#3;&7U[UX9g;G);SC>;D;4U.:Y
5N:BJ==+QP=JS&#F5Z3Ja;=[Xc#]b.Rd&MeJFE[7ZEW#LYYW.cD(I4d=#fQ/&>N5
eBX+F5]CHKP?JCDWD,Z;4G<B7U<?,-(P-QFbXLS)KG7GPc:151.[]5&g?_J7Ec(\
d57+J3;&fMCH.ZM:C0;ge;LE>&4,WIW#^PZNU(+]22[.fc.U/@[#+TaQERDU?AEU
A=Ja]L+R_=WZ428f#_d/8>-T:++>IfE-<19<S:DB.d>eDe?Z@;V>QFS#g,\2A5C[
M&Z9ZVD]dX7a5#+ccYdDGR-;_?EX+SHd(E&LJ8#=?M(JL4[?SBA5[Q#J9RDWLHW?
DHI1X?YE^#(6/bR4JeM5FVLY=4SEPfBE-GZX+^IF0]&Y4dF2PbTS#Y4O]82+]a<J
,95TK37aYWPR#)WG)HJf(?a,TIG,9_,V_H147K2H@POaQW6#Gf+RZ5W4?G3E3V>6
7LQ963AT@DGCS&/X,U;^?]>59+)C/>Rd,fZ8CF)J8ATHS-TP@J/aY<T_G9e@f5L)
TDUWJFaG;Zb_\PB91<>IPJL0L4G5^FZ&+Hb4]Z:Y15L:fDOCB<8V?ZH,9.a?H=.4
/@2^XAPSK]=-M(CFJ=3G)g+^=00GK34MfM]R:?7(+L2#dXdOQG]g(D:7<Ea7W<TI
^?(L>T:]OSIPg=/=a0CVAHV-+cY?2fYL>eWLc[g]NQ&T]JD-R7\:DGF6eK./B(IW
F0)V9eZ?:Z2L51W_a19R;cS^C3040dY);DM^NfX3I/_DF-<ZXH]G]R80R^;P.AZR
\@D;:6\_cf26^,<gXeA^JaPF\TPT:LA?0G1[2-b@8D.BMZf/cUOd/4/f/fYPHX8V
6-0OVe&.+b_;B79SMP-.KNK]X\_2<@P;5:@.2VTg+aKSB:&I&9C<H_.<W1.I,>YU
MRYd2^N7I8-[T9\F4>L.NeT>IGV0X;9faga?/82(.4@WQ98OIIH8DI8.E@=E>e^_
Z0d/c400Ve&-XB_eC,W2N_aH0?2f:&OU/249@WO=+d(@(768.M?B>;NZS[T)9Nc&
-U@:VNT]H(>VT/QM,.A69b)+Uc_+#dJSG8Y?E+GPE6?EE8#,^&f;OZe(=U]@+=cN
URYM<f]85FYZK(\FINXcLEcJ-?SF@?C;Ve.?4_d/8H)))([I(aG8>_96UdTTQ:aH
>J,gA/c81&L82&8SCCQ4<BJ=R#ZdZ0aC0:@HV.GWVQ2f3(\>PR\4abOQeTVT)D0U
T]C<LeD?X+MDV5WM<;gSFOIaO0_EKP95[Ad]+K0\7MO6)D_FI.WdKVM#D^XU)/W6
2d@BFQ@@TKAfEb:P);7BT0C>g/V_;S8\KQCZ+1FD9R3EI6aOHNgY+c&S;ABWGD0@
ZQ1I\]IHYBGa32O;^H8\)EWTV-H33\@0O&X;N8T[H,LQ#CR2A\\W&+OgfMK1S-=C
O-CKXMF(M81?T#A3fd<M/+:CTPR:KYACXV)4.X13MPg9TEEUX2<B@a3:/;eL1&A[
1-J-P5X;@/AI#<0+/QV(D\CdgBO[8X2V;D>&/QC9&d3#6_]4cB>0R1=)FXAH_5R_
Kb5EAW&([@@+3OCN9^JeV1>VJ>&@]+6Og;NPP(b9#XAE;8eXK/WV(f/4&VB\,KFX
#D>\2#02^D)TUBcYe.Ab0U)eSO72/g]R7@aS:7R^SO0KGN71B32\&5]X+:1Gb[/b
)E=\?+8:_aXJDNJ@7/4(bJCM7HL6B0016g#^4a2#fMM4K[(X?D5GAAeC@9?2TdD)
&fN23:M)dVV#AaDPfKb<5Ka_<e\cFO4[eSKK-P8=[3_=Dc-9fG@V9D)e&ZJ(2K>0
d4AF=eE.49)</N@V7K,K@K_2+:OM9SF,KE_O^c6PF.O@WA9&AQF(WP#K&G;\.A;:
?Z?MR52M&&8S]Da\d#[5W9d/\5L\GO]dX4aR,g).5d<UJNSP+?D]ccO,MTA9H6&.
]3HL&@9+B?bS,$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV

