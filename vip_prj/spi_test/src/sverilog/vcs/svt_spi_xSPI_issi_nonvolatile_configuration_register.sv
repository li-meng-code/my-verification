
`ifndef GUARD_SVT_SPI_xSPI_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI ISSI top class.
 */
class svt_spi_xSPI_issi_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`protected
fea4)b4]KQ.K&W6:T,2\Vfc_5^TEVb7&OJ3f7?@f(7GA<H+G_E35/)G.dWK8PJI4
&1&G<_@X/#NbfM,+U;8__?8Q5WfFD(-2M.aeF)Y?1T@P[+dcfI#7E<2<S[c6^UOP
Ma?CR,BfEG)T\5:Fe:M2,\S#=2fI]09cZS=+DFaV?3YW01Q8Jg;:e)2<P$
`endprotected


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
  `svt_vmm_data_new(svt_spi_xSPI_issi_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_xSPI_issi_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_issi_nonvolatile_configuration_register)
`protected
<+d=J@<@&A6:M_2R6]?4;>,/GVd_-OB?DU0b=dSCM089[LNdNV;P4)Sg#)G?<5]B
DA;7BK_6YE4_G^=BU+70FKTOT6O?HEG;dCL5df<JDW.@27<]BH,VTMP[[gg_cM=P
[9CJ@8,,d<ST5U8a)[?;B7.(W22KNOe1#-PPf,a=(<bK4E)7Y5=1J\K#HJDZ/I\1
A7#0,cd,[B57ZOM>+eSJ\JVU_EGVZT1&BK1HXG+cd56KA$
`endprotected

  `svt_data_member_end(svt_spi_xSPI_issi_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);


`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_issi_nonvolatile_configuration_register.
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

  
  // --------------------------------------------------------------------------                                        
  /**
   * This method is used to pack the register fileds into their corresponding
   * register using the bit location provided in register field class.
   *
   * @param reg_name specifies the name of the register.
   * @param reg_val_serial specifies the of register
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function void get_xSPI_generic_register(input string reg_name, output svt_spi_types::serial_queue reg_val_serial, input bit enable_profile_2_0_mode);

  //----------------------------------------------------------------------------
  /**
   * This method is used to update the register field with prop_name_field
   * value.
   *
   * @param prop_name_field specifies the name of the register field.
   * @param prop_value_field specifies value with which register field is
   * updated
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /**
   * This method returns the updated value of register field.
   *
   * @param prop_name_field specifies the name of the register field.
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function bit [63:0] get_reg_field(string prop_name_field);

  //----------------------------------------------------------------------------
  /**
   * This method initializes the register_pack objects with all the regsiter 
   * fields of the corresponding registers. It stores all the register fields 
   * along with register names in their respective register.
   */
  extern virtual function void create_register_pack();

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
  `vmm_typename(svt_spi_xSPI_issi_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_xSPI_issi_nonvolatile_configuration_register)
`endif

endclass

// =============================================================================

`protected
dU-#1Md@\.J#.CZJ_]aNOOaJXQg>@H>&LG?H&]L<\6/2I,&^>SM@+)fM1UZG-;B?
b2M]@-51;6681eVb_00=5b:[KB24S9JBB/@;1Yaa>S6]5><fY(Ca3+WGWbR^L@OH
+Q6Y2+a>W#DJ2a=U,LFKEG7_51c8^.),Mg/4>KGL\gMDTC<cYMF09Q,Ta<J=9gBY
76gdA?3@D<,f4a/QbV=gV:-7<b1\K(IYW7;H?D@-g-KS98Xa7HRBCg4[/71[05.)
)\3_g1QXYP]B)5DaHgg:,OPCfM)&/&S<.],-(IO3J#SESMPL3#3fI+\(0N:-]b_<
?QSg(c;WLJWa6ER<(Z/SF;KO4Z#R>Y2]>6)d..Bd8=f5[Tac5[H.[/G9D<a\ERQ>
)]=W1d=]:()2-fF8^ON?+I,TJD]^2D0KS2[5[Ec4PI,9VKI0KDF>44Y2Y<4U&=V;
AK/g5L.8R/L+;K;NWD23D_G(<@,4fJ=3-LD.6P:5Af/?_D4CXg<]fgQ1<F_9C](I
3541M]]BS+/g]f\DHN6,e?GW;N7L2:8RQWg\GU8Qdb86>Z.Ib\7Z3H93X2d>UHA(
=4:^U_U8M>L1]4]\4Hc-S)@?da5+]Z0fA>_Q6d[RgW]aKHA#4OI3YOG9+@&15d@?
/#9N67PIS.d8MP49VJ.3?c]RD<MLZJMIb)22A-fE9+bT]DY(c\@T,ZCXLD7bE2Jg
^MJD(EBDC:KGC2H9T:1A>fF=D&UI?<TVP]d/>_.d5A0<,Z)M__SU@FWW6)cB?c_:
P^E3Bc:QFU@=NQfZ#.(eN=F=4$
`endprotected

   
//vcs_vip_protect
`protected
^=3;LP>#daO&TS\NUg&DP]NEM]b(3Q,dR6YW^U+0=,e(L,:]=G4L6(#I+T_K6/T2
ZI/34EMQQ3[c/gJfM8\9e?[,4.J]BB+2Ag]O>NfT2?WQ(H?DIU/VBNJR0gQ(F,3K
+Y5(GfTIbL-E,F:KeYD\bDcEQQ.VK;)BSFdC+b<N)&W8/dO)Ie?Y,^:/E&6fdEI3
30NPe4\QNe<FL^[2.M#cTAG<(WNUH#X4ga0T/76K4S)O8U49PdSZ@RSZH?_/NOHK
5/=-.-,?EKPe:+Z^\#UI+4@54B_VP_-;<].K)GH\P9^_SEX^5^_Z#/6JK<T46F&a
L@20I46F^VGBeHDSQaDIUY#2(?<Y[Nb0+#Z>QI[]@-@0QIX,JHH?184\d..<&>:C
b7@eIXROI587[:2FAQEZ)K[HH:];6\-0TaP-+aVX76Z+bS6/N\\B&.X>8OZL9(#[
HYRZ;<Y#9eLP)f.U;MN0>5&-OYVPM=JZAcF:78WCT>X-ae\.7FT5>F><B&0>UF_@
GUgXc/4f^bNV5:O)c728[M[U36XO;8SY.YB1H;5J0ZG0L0GS3B]CPNDH@.L3YUW^
QY^Za+Y&dP4RB)KW&aAgU(LD@5a6&IBZMO;ZLO]@Hf>Tf3K:=V8cC>3XH:#=\.e\
+.\0-/>27VgX)4M1V44KeFd6:5#GGZW7cT\0(L_&F2(Z]1aC6J3V)SIFXB](eX0D
&Z]6=@HRK^G;<f5L4PH3dE6X\6KO^S?,D:25CD2V#_&@XF7LM;=OfcL()#HOacT0
8?3_]?f^PLMW&80@7..7PJRT&9gX?<KR#]fO-F-^G<,:Y.RN3T&O)dH4]&cWY276
R_W?R:SgM@N\91OfdJS@cW)7a0+Q#/WQ?b+AeU^Qd1OK-KCN;cS^R](ceAS<<Q/K
/b<1:\--QgARWVaWGa4def<O&7P&TM^UaSI^9+a5M(22CU@;7TQO0X=?gIMd31HW
4HdFC2<7;M<=Cd(a<TQ=Va(M0818XP=BZVe\V.S?d<Z.e,-Va3c-fd_fM.?D/N=X
H)VOORDH79A>>aK/g1PGD-RRVWOXO44J\#:HLH>gVOZ8U\:[9:WaUfD[K4f1Z?;S
(AfcIM41;[>)5)@U?:9:77\0HV/^L76(EVF<(=E2dB#0/X@M>U1dYK[<)\AP@^c+
]AC5(:TT6ee\]AWa^ND2;:-X?JZ+-<0S+(\Q&Q;7?AK-FI/97WB80B8-_MVT14a>
OOKZ9H\-g1VT0W7<4C_\0^MAK,5RY4+0Hd+=S][CZM4JR=,2cW0_@C4JV@3\cA);
e811[/JARC4KK)R_;,cDb>A.IQ@]c_44C=J:)bU7JA-C[-OOCgg,+f/8TdZf(;\5
:8MaEeBE(b@0[H61-=.d()&:9I^,DU(BR+UQbKBd#[X5W-GaXZ\??b27AeSJS+?F
A]BV7g):fQ4BW\B&f0=2-6[)1)(]aG_-4FPAPO^cd[BZO_@(dc7b3S]>45GWZH^a
#6M4UXMICXVa;5:<<@gW_>Jd8EA#+]<RY&AIIDU5AdWX+U4H]fP/Q>:.eg-(X?.a
QEJVNPEZ34#3P@e\&G34/7.>U_C[e-9GLGIT31;[#V\CM39W;))721W:6NA3J(9^
6PW,S-&?X\X9;6X,I##W&]ZB7]S\6gg>JXMP4],N]g8@;K:AG=?4DN8F[YJZ=gAC
AdbB&c&GY:M(.g?I:DG4JZ]>ddOYK#fVJ66G^X^^6QbOQ\D^.?0d^_I&TSa/DcK#
_0=)G4RJ@F[VNY>UUQ#Z1T:XYQ:?,f_8ee0A^-7).MO4Z-SN8[GGdK3&OJ#(fNEc
SS:/8K?+3\GdLYBfZJ@(D4]bT_@S1I.D3K?PSe&N>X3)10)c9^VN&_Q+F26(eA(d
?<g[1?fWD(dd,::=R,06:?9,[T.<dEP>:E(gY[FVM72547S2.OI7aF3+6Y:B&S+P
OBZ\TD5<CeH6VA,?E#1FUCEKc\\&<^DM)g3b7/d/XT-[9YMN)5>0X-XAIcZ1@cda
;#b^?b6W@2I=A?d-]A,U76GNOH+(PO8a5UaTPFDH^ebeACJDC#G.1HU,B7D8-.f6
HC)_[>efU6R/L+c>](X0M[.X0[\8F#1;I(O(6RG3(7S)Z&Acd91.W07KMB@G:;7T
\C=7Id#a.,H[:&6ZS)<@XBH@>O6\@c;@fN-@Q&cc\C0Y8:GP-]6/4SMP?7(14&T-
56V9&;TTICV0?fEA85C1^IbdLA<d56P6bRN)4/SS7OXTF0SDAaEC;U_Z.aB@:,#D
<>.E3DgEAXCZIUO3>V/MO6@g.]0B9^e_,F2F(EH6daR3\aT\Y-.PDb,H90I&9]eW
E?ZHZ/7QAGO]D,=f2e.<+gW?M60:&&C+QE?SKW0_?g9d4&55/B0(ceWFF<+d0d7g
XZ<H>#PQe/+TT^#]+HM3f4OT=?<dXaE2TU]8bMAGC/_V><]EKA;6d^(KeCXP[:E7
[^MbXYC3d3Fd=A1@3W#KX+-)92BSM>(B0EcNEQ0DYa(B6[3#[9e;U0A_Z:gM_UV/
_ZK#R6ZUdO?3==c<\&EB(<G_S/H<7OK)?[WC9PL8OSWPC&O<=,&M)1\FfaQT3.(M
4<0VR-RLA?.;]dU\]I6VQ\f@gefAK2NU(TfI83I<JY;9g::NQOQIR;@>&g-#E^/[
\4#0(A4J:(=E6gH1=W2E2.\))D46ZNH,J17)6?Vd1R7#).c:cg8.b40>1=]@BJB>
If#7N-Bg-_^N(SYg+Md\PQ<;/PT^[JH8R-\D^&(U@1JNJ(B)cI-?_Yd^1B-9TL=-
3c9),=RXFW\RCe6f\#Z]dG;H=TOfVU[^YB2:.2XgU,K-ZcS7Fc2?B9HQ_0I=TXM;
X].0;N+0GH0Z&?HcGVe81?G0_VW/d(APEc_\Hcg^L;DQ(f+8-A_EDYB6=5D4KCPa
DN8MXZUHV7Zf.ZRXK;;cY+MI&NX);O8DJ7bS&;K.,E9+ccX80.U-7HI4#<R+aIAV
eTO9:HX9#eBd(bAeJ)34F+W5S(Z^fF_#EESV510/7Z48cg^bDeRO,]&TYO&N;7L4
@O@X@/5&+5HE-EPc-#Yc<dD[b15<YF0>:4U+.gXDgS^JB_1N0Y^NaQ?Xe8(a2T&^
b[O1^UD>,V=e.XQ+RJR,ZCB>bY;a,Da@E+gXZ:Nd#,HCPWX5?ffK\=5BP]O(>V:Q
=IV?R9N_&UOf+5FHM;^Q;\JLdR@E+3,7\0\RJ4AgW[TJ.(eX_)Ee)4f_L-RGQYI5
F33R;^L3E+D\e:-Z1B48ZT,V_Z=S,7;-Bg-OS6+3@S0>2_cI58K_bLA::UfK:HRW
J?ZT.Ke36N_Q1JZ(QW=@4I0B=bIHF&<;N2RYd\ROE7Wd\TcAQ_A:?Z+5IF@&a5J-
gCd-5>#-3PF1?QOR/9bf(5M_OAf])\#>?JOQA9c#gYRJb8D&<N(K92f^M#H(O1IB
.[dg?W5XUQ+<?G<=RRO,LM\\:NN[F=IL,KD/T@\92P&#&9);V3OWFTEU,U5\:>W+
)27;S4\X70fY(R:9aB::H,:?8MM+D)XWcYE<9XDA7#O;OOUFN94WI@d^]ea\.MB&
L)>)6U9QI?O53G6<SJ@^S.&SDC-Sc0@bT]@BLO7;VL)Z;YD-5;0RC<-ATZ#CP3N#
,<(P)V^c0+H7:Lb9^5RG(ZOb5#>_OH@;96S\/#IEY+(HVQaWK4[[>TNI7?S4K?LR
>cGAS9X-U#/-TH1@0aBb9R>Z3R]/11BP#6G\A\eEeYacLP/3UPE0MeUT;72@ORBV
,-&?)G^+bDZd6)E>1W4HZ<O<Z[];Rd.(ca^QZ1-P&TH/QTO3L@5NAcMb./=.SdOT
L0Re_SDWWT2FH3Y0N(?BA6RH4IBdG:S]6L^DW7#A4-Og75IUA3C>F&D\X@DZD&/S
NLX_=739MFT@VMFL[NJ=U^JNYf2^N05G<Sd&:TcU17_5R.Bd^TN=5>SV0O\-R7;D
];ZCEOc1XG;g;b1Ke=D1=?WdKfd93A]&>M1G8LM2]H^^.aVAbTWWTI^(P=/8;I;M
9UW\I:J;a/Q]QDc?UY?5&d_Qc/#A^/d@Aa/:&N0E?KB?1KaSETU?fVB54#_L</gA
@7BZYD7F4H1U)ZaQ_0_[W+LU<-_&fb?9NZ]11_6g#Z(dC&Q=;.VFPIM(0B<9JbOC
3ag7_UPE@JA.K#daMI<DT?IEDC<HX^(P?[d;OE+HG=3XL7#E28NP&W09TTH7][M\
HX+g=<]3F4cHBV+T:7Cc-5VL@ecF0UUcLa</C/8]SWcM+)b+A&5A6P[W>GHDSL&g
Y3J&c/HYQ:_@OVM^#^&KHG[MS&\\HBN7e8[G3?#K^1>JcJc]KMG-&@BfT+]Q=Re3
X6EX\E.&DUN4JAF=f/?I;bDL,+Y?ad[L(QNI[OdX/-b)9LfK4=#]^VTK2XB#YX7)
G0SRM8Af)J034g#W4eEM+NTN]DX]#(SM_WdOMQ8OV7Q8V4+^+S#KO)B.G]fI62&D
LR69EH2?ICH7KdBc(,Qa<Z<?;+#H9eASYP0]KZfG#7A7E?X^AG^?CZc3Tc\+Se<D
3N?D>TU7.g<+QJZ6X@[-OX2UbS[->VMK+C]#e04#E-O=Rfe^K-A/c1b<UFMGQ8a8
5Wb1Kd<0dBcU)TJ&,]SVAZ\&K6&U?9F2?PaVE\X2gRQdf>00PCgEfCL2/RR,/(UP
#?>X>P?#,D-QN;2J4>N.&/e\1^Xe(P;RS(+fe@PUVM]TH4_d_U:b(RI@\H;Wg-U-
a?SJQZ.4_B[ERe_G=)&;3J7L,BL?7RCH<H->HS)QEc7_N>GdE7R_0f29#CZE&G/O
gS5WeE;F-^RX8<=b7KcK+@I?Z#+U^(P9R[))J+AZL8g8Rf]3d598YGT^3L,dB]OT
9(/^#G2Z/HGO3N&V7+00?eM7<cWWL6<5M2+c)&82fNR-DJD7TT#Q5_+L_3a_GD=5
FE+HG7WT,>:I@ba_AO3OT:T.AH0W(+KX9gVGZ0(O@A4Qd=6=D=Ie]CG0M6L\>fQ_
01#39F1/DbWZ-J7S#faVKbI8-NbBf;[OKKN).)9Q=K\LSD\a7-e?dQHa[[ONWgec
d0&54[:_UIb5H?Mag(E\b1+<g9)&19W,C:=6;EQTU,bc_GYV)[LWIdgH#gI=@V-L
A3=B(EdI-93B-X2L=@g(BKU\aOELg()dSeaUZ(4aS0?4OP?f9;AMP+dECdR+IQD=
;=R^9E1ZZY=P8NAJ1A1_QXR=AgO(_Zc8e^Q@HUfeAO8e>E4F-U\3^-g?U2DSBfDG
cL(E3_HCbA^P3RaR4[U]?F.;MOSO>;R+U;TbN6/R\Ta[A[65FMCOb[#)Y)FD#>,_
,+#(a9BLB4aY74#[A2]84cJ&PD_]6f:1Y\]K5[?X3E.d]?00@a6LPIC_R=?@\Bb:
^XaT6/9f]HJ:I28c:bHZH]\0,LJQ?B,NV:Dc9))<P59/C@,3]:+H^ZLQ&J-fDWJ,
eWP@SFbA9;>3WeH#P.aE&L0]C+UHc=Q^/2_1UP4U,N2GWA:V[&3JX)1BB^BIV/I>
K:NK/Z]]>YD48c,Zd+,A;8QIR-X:@_I&abT].;D.Ng/W.W^R,Z.[8e)MM.20(>_W
6cIW<E-;__5]d&2OEXRAPJFaA,CSF+-)[2a-)9?_];8+B6,F;@?<7DXTHH:PN50[
/Ga[BL64b^IAKI=dP^b5RB_:02Q#:?B=FcI&8QWAY@O.PeA)^@.aZ)eDfSQXPE3]
&We>fM.JC-Tc2XU:(<IC&3XNZaU]4a7aDI6Cg6c9WIH[P3/fLW)eO8]7,&-&C;/=
>S?H-O/];-?a;#I[c37f(Bfe@6S3DOcUHJ_RB:<=Ma]:R3GGfV>RD\G#SXL52)_X
6]S+<eCV_F3H+9WGH4\aF57H:H(>+GdaABN>52JF;>#g-W4]MT6ZAa(5HCGV)FVb
\D)fb1+&#KT?383UVRIJJ,G0QB]J]Zad,OX)0IQU&eBK/?=]F/:WXO/2IS,R]f@D
)dJb/@\5a(WV50DCeF;+<]=9[4&TJ.d_0U0#0KL.L[B.2(^B5(J7MLZR0?A7ZW0W
Y/U[ZT\#NT9f[(#J>9&--+N4E@e3;e\])6E8acH>Y[Kg@@DG/b-aA8QG+S/&C<C=
O>e2T2;KD66Q-B0=UVZ,]f&2C;c6bNB[P1+acg&0SQKL;Yg,;d[#6W@=>FOY1;XA
4#D.+2>(#E,Gbe(.926+C#04B3;aUe_R&IZ=2XU1/fZX:7BegY&G.?5DgOg>VR\/
T8Zc2T4G)/e8PK>E(FIYAI22D\@<:;)f_PEH7a<O_4GE]9:HG<FP&&M_]2A2faM:
,bVY:?cQX;UBg/N<JcJV(P==_8V:>XTXY(ACOD-?NFFV.7NP9_R?aIV:T&\EYg0a
>=GP-HCe23;[H@HQ9EQB/LCB=BOc]XSea]4TfSIIHVR)MgHNIJ<WSB49Y>H(>H_C
1;@4e:J8FEEJ-JBV[b:2YZ;-RF;768<b-(7QA\:c)&KFS/F^B3XS?g?/9AI@-6?b
M(A<Z_NBN<0^LK^FW>e&4Z_1/f\)<SK.WSJ[DKAH/.JVZ1&I^SQAC?NM=9MEMA?:
+PI0;#DfWH?,XY7^Ee97JUDd_C&J^XM\eL=3@F5Q)S=.\J7MBUI8f)=[5E&a8+EG
)[2)&C<PZ7@BA^d@:7]Ef/],4#@,O5R/;;ZH:6-HH6a=@\\RV:U=GIWT)dXRb8bA
J,]D\J>VeOHg?<O7aNbMTNZJ^IZ#(L0]][+MWSNaU91Fb=F8N(U8:UYFS+Zc:P@8
NG78gV]F?LU@f52N.)9J8_-PV;.1d2:Q#5aD:)89N2.@#LI\&.)=D#c8V:Ca(@&3
,gcMI+P7<Sb#FV?BRN>\GD2@A,VeFHcJ7B6MZBYf:9LZJMaGM_e]P2YRXD_(R1b)
+CdIfLC:c?]D^aU2fIE#4\/T]0C7:g4X@>2Oc^gPUU5gJ5I_6KP&eEM+g,GCVcN,
L-=a@/e]RV+;VW6c]fc,gL=X^U9]TUE0;c,^HA&YGJ6eE,U@FK2<J3g:E7<<MK/)
aP6(e.#EVGY7F5a,>[eUVJI_1M<4;V,O^cF+gH&=3-NZc-1WZTVJ\g-S2e/c9C(S
Ca],4NG\HCFCa(.2I2B01)4=6A3bZI^-\gIY<-YX#\W^M-?<F9(23cOLL6J<FdZZ
<efc.L@((dJd#N(L371LDWA&V.^cDWSf_WUD2,TTc_Q_d@,Vc\OKaC=M2Q^/>5@U
_^b.2a7Vga1&>0U?^DF8D-G)T1G.bINSP783dK2g21d9:SYH]fgRbRI(c:a9a@QQ
FRNI.&(Z;.PdSGd?3O/:Me)8Pd?FR<8&cc#P-WQQcVVG,<Ib5A5E-6>UG6SVVYF6
U<6]OB1+V63HYe6<UC55A]_HD?\);5MfIP][4SWR3#Z[NG\.H.H/D?]7eT+58<De
C4.e4c<7^fMfD:A[/&/0aE(0Y^g3LJ5L<=2F\JZ_<Y.H0(c1>;-b2KD7=7D;aZO]
TE@CJT2(#eGgUG-7\C:W3R2[FILgDIBc#WY5K7#1>N&=fZ4S[;a<#=]PAEeWB#R]
])ZS/)>8#:VC>/8F]WaSHS:EQ=KaX_2>YS,a6=N#^N),eV-IE>W?G22U1<>R8NMB
/<&M^K&2FG0eD(0&]-.:Q:22]cE3Q2CZb#1?I[gYF^-P8BIFdcR?:b9S2\[8.(XV
W:d#9/Bc6IVLgCKT?0OTRZY,^<)8eW@4MKCcB\A@VOKccR87I,VK)VMN#AXPCZ9O
]<g?U7ECd0NUQ,E0g2HV2ZR0c=RXL;Ba(>B9&Z4W3.F-=f@^X-a;4>^:ARQW5NMH
0NbK71JVW1YeI]CB@X[B+:JTb4(NQJ^#_Z3TVB._NG;X77+.b-(0gH8J<?I6/QKb
;A6>fI/C@S\AV,D=+DW5#TM>RC844__QT79G]T9J.8Nb_FRNcd_<F)+Z7aO:X7)2
0MZVgYXGZ:2SEY.J2PH_\<2b)KJb,EcJ<fVSf9;@861B<9RS[S@N:(W.,4X)P0V\
-_a->bJ8T^;[I.J?ZR2d6_;R7B[5[>ReJPK?PW4^DT8e.aeg<0[c^R0TCg=9B]aL
R#Z&eB+a,79#HWF@[I[dE5+,82FB#+\Sa0+A::([OZ#^]cA[;VcX3,CG/<\2.+Ac
,_60X=)?9BVXJ:,LC[b?C.O02R\-/Q:DJ0Nd[)83__DS51BXR4eO^7GY]]S_4O70
)OdPa2_A^5U.aA.)CgaYUaBU5U+BSb.99\0J,&<X3R:f@&CD@TYOT8>B\gH&cD@S
G-2WB9,L-;=9H)C]bWK0Eg<&U/gdD<gZY,cC5_,N4ee(9IgIV6XbJP)_GaR#ca>+
_1AKTe(ENBJ_VP^D[N<6aJ5/KQLS]9\F:ADdJ?GY:g_HQaZ:aPaca_U+?;73_fQ>
Z5B\8C#ZY6(]S#L8[0T]ESD^\D/9JU)09\f#4;^OWHD#P5S-[gXKT)RGaeM2OT#-
K^Y8M8RPA)1)V-JFgXc-e-C9e3.SJ3N.Z@KEL;>D[=A>[L)I8/6F)[45FOCS_)E#
#(+FcH4fa:@K+^8,#/78cSCeKYJ+3eg0HBf^VB^fTS2EC7NRZIeJ[136d\VP1eAg
f3PUZ6559&ZL\eLX&_:061?d5F(H-)ZCY#<WGKTB)NHQSf_F>4aY;H9FX3]]+Zb&
#E,64Sg:8&SBWI=Z=^/9,]C0/.gT)HFO+Z(&<c+Z7Q)H3@Y;3Mb,-d:K85DbOL\d
e/H7(+8Y]DGfN1)=T-AFEB2VXO:MgMdc0AP>]VEJ>2dV)25#f4+cd(YY:&T:B)9D
>WJ97WVFa-,+\7AVFEILd7^A@G(L=g]^6=9X7?/J;2cH;MN4#W7cYeQY@JaNWHH8
GH&fJ7]-@Ng49VWJX=8FAJQ=^M7g^G6ZUH;e0X&VD#HT@V-_L@#=+dJ4H4(YCL4d
\TF(G0G#&T&@9XVY_DRgYE@G6BTa7:g;fO:[B>CEK=,@P>\+(ZKES8PF=>W8>b.Y
#aKT(4KMU/6OaA-[RXO+f?/fFEK_#]#Q(WY.V6+ZJ5YV8CN0@gWa:8eg-VgPW2N]
&YH<O88_-O\:XSWXe87\H#OW=-W[H-Zd16)FU;@Z]I>-4/PKJ_MROf\F[[3bV>eH
S7M4?E[1B@gPIR;B^+(WMD8G.(.?H:2R^df@cSNBJ](XG94FW\OYD6=Y>Fbd@\_:
GC^L\#G&Y(6\PWL6/[#fFd1P:HU6P:f.E1K3#Rf?5>]b)c/#9(880\05AeN,e5KI
I14^a.Te&dV>FIZe:,CWR1S.DBEW_@HDI@>;YW9:PZ0#W3f,=&KUdg]5-e6ZEV5(
SPJTcgQeAPK>/eB?<NN=)DJUS;^Z5/\JAf2S)&T,b,=PA),.bRfO-[HZOYMH7M6Q
J78a\d/YLAeDW..3J(6>MK\&JNKYJN19-G72d,8,bP@CQOSZ^ZF3]IUKWE^fQ(A4
Rg-Pg-81^2S(C09Hd067<PA/7E;cB;_07./N(.7fOf<KOg4bO/bB[ZIW/eL7J1_>
cf\AHP(NL6O=/ON]WE3\I#.BB\f6WTD&eU<XBCID_0B[^.\SO\;[\(0BZa@M,:^O
b3;VCMVSe&#:1XSGJE:gK5&-/GQKg1A)7/U+M,5^gAM(fPO(3PR5(/@bCXV+f_WN
0ZRWH4GPF#bEe/4.XT./?\c+C-ENXL:R&(B/bg+_JaHPFW6(HKf;FL@Bc9U&K<H;
[SEP/>950JL79UY9b9^+IJN4_FOJeF]J3]H7O1^g7Q5>DHaJY+eFS:R:W^#SRYRc
?XN<C_,/ARX&<[(L/_>^Y:F9>L23><aP??5ZY.@AcH=7ZaBLO0Z2VV,(66b-R)?Y
2_&28(@a]g8BQ=;XNA0.R4_QTfW3B-;Ve31Z81NM#_B@_\HS8L=.=0=4][X8;20F
YZgU:BYXJTHMa#XKQ]FL,Y:gd7gEf2_7_GVgD@J.@d2?TZU20eW&CYD74A)_bU5&
=GIFcT.<UgMO-VMHT<_c_8P:^=^aJNA/gWdKMA7K,]MQD6<\NOVd;]XHQWZ4N]c8
V=F;>C3(YKXLENVI>G0bK7QPM01,&0U&38S4g<VH#LR?WfDT#G?BL?[Y=;T:QF&E
2->+2V.>-6g3=BYK6_R.0HDE/@4D+>7756<1FH-g5UN5W/GJUPTD>5YU/?0f-@_B
6L.TEN4,c[T&T2-fJ>(;L@]fEHF--27T1RVQWLP:SfS(6KKCJ0:H4=4F]F/)M#-6
VV:QAQTUKFfLJ;1QFJR#1<?NaAI+ZP,C&NN\T(<M?K.I5E\;2K1VA_c.)Y=_GefQ
+CZ;#09G3MBD]N8@<3,KB/bJ@.PSD2Y\-+YKBF3BX9W:1)0bcSSUN@5230PR7Ac8
7,SE:S84aa6LS#A0A+G+^N>1#(6.:?=f);[:Fd4E6bQ2e45SM.QF(ZMc\@U+P-(]
75(ge^fZOE80G/O?28;+8M[\&@:?g[a(F?Qa3E=ZFGRB.+#P>5PHWS2IV-5<;MgA
6N;ge9N=;I?-+CLDCOe1>G.=)PceAB<7&.e:>AaP<c6NJI[gObDfKLb\?eN,Xg\7
:GU;TB[a@ba]db[HZ7<.F[2I,fR76CdC[QFV?LP)CP9#J76T:Q:JJaU?.=>c&1:2
(W&5ObU>631X0Ia/48_6@1@MXZ7VS@@.V=N:d?eHW;ZgCA:ZP1H->=QeZPd_L>Z<
.a-+O]@C_aE)Oe)_0Q6VK[].gWH0KRK]+2W(8K^,Q+J.g_Tg-?+5VU=(C4^Ce56A
F4LIbGe#P4<eZ#\I//@FCd-:9TeC:@f99],[..Ag7P]b1_)4UYBB:X?LS^471^P&
(LX_)^#2_O9e,@H,&1_g38d5&JZ-#V[3&4@CG[J9>MB;+(WT6+Ged2bRC.[R(=JF
V.,)::C\UE_@c^>-2=0V>?AaS&P9#,gNY4C-I-^Wd_bW_L^\0YO4;^;d/^_CR(]\
,b^?f3dGN\Z<HT:/+fLO9:4bY)4g(Z38)e+SR=.?/c2=P3<ZOYE0/0+H@eXgQV,]
R04XUb(#F[Pd]O,#SVPHXT@T\c.SB3#VZUg+?->],?QZGPMUL0CUQ+C&(RQc[FHE
2^-#c7EQ=EO;?Z7;6QT5\0)(b(a&<:8K-1YG<X@FSc?Gd&J??Wg\HGA2=g&UZ)I6
UV#6;:FAQH93VJeVWM67J[&a#14WKT[7T>9527Z.37T<e/KN[8M,S0dcANPD=XEQ
D-eYGd\#[,,J3b^06d2::;dJ88W91Gbb<(PPDf9;/gFIggL_N+fW;E^dL@c54/4)
N5EIV^PA4e3X2b8V2F3T;a\C[@+GQaR&=a./)Y29B3,+^O)L:;/O.aI>K6@V)->/
X:61-6F8):S-FG#MV.\ZN[T)MC55&MfPg>NH/XYa2CVXQB5?=-1e.E9]JDY<^[5D
N8B/8PHb:d+WH;5^J9RUf@PD&N&X\?,,+V1^\+FVcV3?Q=.H=:CP8eEgcXFRKO#A
ZL<Me>TM]Yc:OBT9LQ\>c:cN0-/AfgOA\G+#1[2>K,2T?2JO0QKV6LfM0RX.]AW[
-E]4.;&fQHdF?0IU,0D5CU?N&1^:1YC5eWV6FB_c4+cA^)3PUV?2//X6-&ZXaZ\)
_7C(/SBB?Z9VJ_60C-Q7:2_b)/;>dH)e7TM?K#/;G7KX;7f;_a<JQL9(.-BTg<5,
gP&U6Q0G3JTSXCEEK7e)+=5dUR./[(I?#M8[G[9PRR-2V\GGJZTC0=cND)U<CGF+
f9#&V#C.a@U54&(QJ\)(P->9]3^@#8e=K)S-0#?&bENBab:MH0GDSC?(Mg]fZ5&N
PX_1LHT+@Y-@;2(=JNB6B//f]:DXP[CO+JRcNRfEK9P<G2bS;bTKJRXgOMCfX5VN
D+X(?E#4UA-/TBeK>ZPK_HV<7JD8U?/PSJIM_D?K>)?8P?Df41\E:>[[[]UEPOJQ
L^/UQM+R]5EJ\b-F6+)AIFJ8-K,X,(a/>KGeD^2-eG.VdP9)V;O00K<H-aPH:gPQ
/e1\5.Q)-_ORLJY<a>JD=A>b5#K/AO)UH2AGa#Pff)^R>>DY(\#\<P^UH2M&8.DX
efF+;&6OW(DdMaBa(WK.[2)VCI,RELDB3N\J;U)#W<I3>/>;1Sf/U\\DEZ\S5QF@
K,E6_2POXbG6B[#W326-QB+e>gD>;2ag/YXH4\?L_(ff[c+]9F-].WPU8D_gCA8X
MT>?HB@Id>B83[6?e=I2a)KL^EI_Eb2CB9KNDM=N^B7U^U#[)EbN.\</7Sd.>UQ_
,=eYf_@T/OeK9f\CMS<6+W#D=#DD9)g1O<&JN49=5U<f9:#9G9g1/AX(&9,_)=UA
3&&ZZcd?5+N42(WfXEc/@LU3L@;0/8.KP<HSZRf[^9c5#+3^C_]R#(6Z:KgUOD-8
<)D2TVFJH>8gE98RYS3)K8d-g2Y[+K.VI_(@d/3-1Jb#G[,:\&@A<,FO1-^<VUbV
[N,)7T7CVgMbRF6Y_O(:-X^B5VA.D@L#A#TVcPX_7BOX2-6X+/S,=F2A32(UE_<O
S<gF\_J1UUE^Va_4XEeX#2HX<9G/X865G=#^bR0(Q>US^,O(_Fb,X+UX<((6O6TZ
fDY,3bcCN6=-?FP/V4H0;JME9:5?4DG9U#R3d@QJ,CTf;8#^MDV&54^O+\Ne#Y>+
D05e.8f<(N:.1P;A-M02,.(,I8JfK1:LTP3)X?1R1WV1D_73FLfd@/f-NM7O.+Y]
5&HUK9EUa/K5XJ/>FW8R^A>U1<I1,K-\.1dTf4T4X,-5Y#[WI]0MT#gd6^IW&787
)QN;6\_JY)c;9>DW#_S1O#gTWcAgac/7G?\[e6[LPCWF9UR4<ScBTQU@XdIacgLA
#;Q3)D_+5+@)fHOY^5MFdb0;1K)c^>D^53=JBIFYcL+Za]6d&.0Ff8DGXIMZ)S[R
E1cO\:JY&=:?G<5Y8G0#(.a4Og_&[5eU(T([G&EKT#W:QaVGQFcU\V5WeTP]V0d+
SE1;/Y-cS9JSFN8fC3Wc+?X\bV#C3ZbgP1U0V+D#FW;:>KP+0_+<GPD\E(A6V?a[
2Ea9MfQLeHGa7FS0HLDZfCO[77.W/CV<0+&R66]5;eK/W;=GaIP:L87RX264S3Q>
18V\^E\\4c?-@:VA=I_]I=+Pe5U)OU^+HbS/D-7^GNc>+5V7;7].7Y0TYZCUOe:Y
^M,,gI(b_/1e1E=Q&;JDc\+;^EK68P(I;.HaJYI6KXEK,aJ?CBYATGTH;KY4,H<?
(RQ2[f3>)Ye\-OKfSAfRG;DD[5N52@<I59OZN8_T#.bff@gJU(WN;/aA0LcCd\/d
cKM8,NTDE1^<4A1&#X<HPHIe3I8>BNJ9(N?23A>a\@OO?&Cd0P#gER#SCF&bP<M0
7Y_<48a1PU.f]@[;f2WD[bPb])_I^(_ZHWWYb).BB(TXQ\83bEZ_G]\EA)[ZNbTY
d<97Dc\e.WH,^aHTBZ#Yd@)4[;8J=[.PT^S-(SIZOLW@<VeK@WYDNF+?HJL[-Q<a
R.?1;?,MO(2DER>+[ZU^eWa,NHU(b4D.B]T9HMF0d/c#.BV27N9dcX<VXUbb53^[
,5ZH?(M=;ONJTRTOOGL(?AZ<^ZPH2c/+T0JW2BC]GaTE,=0SHT&X7TQR_d7d,dOO
S.+L:)H#D=I_:WHV+12+f30EFgJ[MXD19B:9@\(M)A))PaXG9fMCBC/?b<L4,2cD
;RETN,L+<C:g_@UR&RY56+\^bWa<#+HJTX#47UO,&7+IFK+:[&DK1:M-]FBH?-7P
-S<B@4H-3a^V@=U,D[:?>B/NO<9Q1LQ<e7acc?J&X9S&Mc9A6T#>WV7Ff+dRO]SW
ENBa2)ag:;SI_1>BVDOZYD)CKTUKNC,PUb6-DS17KV5SG23c[G,X]5#g@98-CT=+
,[+FWBHF6I7CRT(TUF.F3VVf#L+TgI9&/@O=MdLXEUUYS<0\W).8HSb<P,WT2+MS
7e@QBP;CdE:IL,DNA6Pf3L3M1BII99eP;\M]&^bG>fI7CIJ@:aW)(9M=L_PWFcDf
B4FfH#F>134Pa=>@#9\;/b)ca,GO[fbAcKR46-2&N^ATQ+=>4QgAVYK1^->F:C5>
@[.bG7UF1Na^7WXP&#7e<>7+P+6-NS0&6a7c+(&/11&J;1c[VHZ\c3,f-5YB4(]>
,g@=3\-@5[G30.^BBM1FCW\H9&W>IX\R3#G&(3047KDY(g;+D#DEBO:Z^HMIPAJ,
2C,P)9+8RB)T_&]=5@_eRD8>eSUedCPcUb2dTfY;g?\MRG)gSd_S]X)-W&DQ2LAd
=b_LL^&(45OAN(0&;Q,^7O5UQ-OMWcD-(aX]^>566B#8?5[MK0d&&C#<gIB,<f+Y
G4-8_J1CR6FW1fCN5U74E2YW\CaA>,4M,^S3M-<:CdVZ8UfX@EQ?<_Y94CS68=LV
<#;O<][2;/;^FVe802NGK1@XVgC^\Qd<>+S7+4dI(;?F7]\eH,^5V8aV4^P45]@T
1)G9D@eZ??#GH9/7T2dY[3\YNA#^<+@QaLL61cJ>cf3^A=BB9g,JScSPX1-gHEM8
G+E^@8QFO[b6F<7O[\]eR8&1/FQR1e6^XZGF)+06@=WBZ0B#Q[5a/>;.7@f9).(4
<_B1_\89W03WPPR2B44-U=_W&<H]f6(WT&/1YQ=9QEDFRBW/>E+CGK7IXfMSdKUA
WQ9.7(VZLbOL<;)51L;M6MSVIeTZ+]IGRY1S(#5&P<@YReP18.<O@1^6YHaU7>TI
&[=aZ:N0T3:<FIG9H&.UQ#6[>7G_/d7NGN.03AN7>Ld1+VTIN1K^+7PIcIb[^aM.
4La?M?XF.L?L63:.MJ,A<XK?<b/HP1.L0<gSTTW9._8IM^JU48/Za=aZ7^51f57e
#T\43+CT)F\SB0)TNA&^>18PU0;aC2>QQF4D72;#^Xg?g(W(J74TRKHe9T/5gb3d
EZ\&[MSd<gRC.28bNA<1ZELG@V;Oa6#:.,QNFMF1Te4AHQ1+UAA]4MA?K=<dM=Y>
fYeb\KY.J0VXJOREV_>0LX^P2gX2TR?]A7B>S77;E&XJg5)eA\I<(J^T0;PbQG=7
BNWgS<R;\>M,70+<c7+@G[.]A[2Z65[W43GV&f@5L5bYYd:WZ.:e=_c,Z>+1]]]\
YWIH<@Y\K.e+F[bB;OW\g;YK1K^W45)NMP3>eD,&@WHbg)[V/F>MCX:C/+BWdBH:
Z5U\-_S&62NN+5dc?cL.SN:.FVN?bHS6=7VN)<ZQ/1](7XE5=\S.<cb[?(I,YKQO
9D)MabKfT,-L=4da?0g_BP,BGfMCT+D0I719@E-56Wc(GgZ_-6/X^M8dDNWPC\XO
J<AV/?J3(XD<?:NJJC^7VU:;c,-bHUY=:HQBbMY1K[904V+J5HJ<X(d\K4M14_[a
9V-0<O,dd(QI(fGa&QbB#+7@@-Y/0U7)#]._fB4LI3X\#e[Q:P[)gLR81AdYI(V7
)/[:O93VAb,\<P=YOWI5;?[6:Q3g,e],;NRKa,[FP0U/B<E+&E&Y,N>=.gNQg6[\
bN@YK]/<Pb@19R]?1^e=:M<SC#4A@]K,P@Sc5Z0[228@V37KI7R20b0W921]CK-2
U)+L;deBbA1[;V0;PY1XZZgN.YY8/ZXFdEGgE:L&3:;O;OYb@&>INIZ/RPY&4KGb
W/ISYVW&6]SP7c^?_&GB7ZPe>C^M^7EFDZPCf;,0eA:RMO.K9,[g^SG,UWK&5?XJ
U-H7>_]8YEY-8OS\H&PN2JH7J4#-&^)_)>XD2][BQ:dI(NbU)U5D+3M=PM>=_afK
);aa]P&(LB6SEZ_8<:GF=#??T#38L0,/.4.;KdZWcQJ.KQ[J,A?]12^(:;dXXfIK
-J_<)+TXd/e3f&#g+d[P99?^e:@]S?(<<U7=#7L[7;?49C_P;;5A<Dd.5RNc-/^W
bK(G+e/PCgQ=@(-7CLgSS+D1f=T8U387V9+ND;5^W@3_(RQJX=F<MeKPKV7K1TKF
IaOV)_N\Y1XbPfW]-:+:VJFJ2[c]9fMO6\RSMcgfg&FO:BO[[MP?733/2H+b:=[J
4]B@_aJG,5+@a2]BM>M[J#>bR;bQSH7MHJ6S95LS:PSF=DG\gGN\b<J=K2IL5]4M
]_/:,I[b>Q93F@PH=bZ)ABOS:--P3eVPb)4ZWDfQSBA]P5\YQA2YETJ]R59G@:@a
L<:DRAEB8N05MY[-6/95,.d_?(gAR<?e]02]>bdF0ST4J,g,^R61HZ=([UD?L_@O
3S^_b.82),Ub?6FUWW&EQ]#cJ75#MWSf.g2P3d3+V+-K17F@XLc?AN98a39X1.(T
,C&XOC\LM7AaGBce^_+T>(75UfYA_D\)[F7f/8K2-UDSdg-BPK((dIAU+AFLZeY&
\CIge=Af+U9I>/Zf31X=_S=;^]F[f,P93]H0XW4]52\Y:Ic,A+W8-W&TNce37&GL
R)KB\2ZDKTXP8bVg5\>?c[g.5N46cM\/2K[Q&_)V_.[V>:)^KU0QC9Z8>+;:eKJ\
fH5SD@ZDgYAc(AR\O(JE(:&30R<VQ;X&@3T.)(HYa9(a<T\I-L83I#/,7G=UY-Y1
JU2#TTaE<>,g90-D^FT14W,eLM3ga<(IWQccbRREA;/(g&OO(=D,Fe4]K=H).@Ic
UOWZD]24O32g1eM?S->7BJ0A^g>\)Lb:1?\68QW;9CMW4I-P07dNH)dFUWLTCf_H
WIMHPN5Va/FRcNgGe0(010a,=?aQA3?R9BDN,3N[3Q:8Scg2gHKR=KccGBb62<3<
d>SY<F?@JJJN_J<K.]=f;>&e^0cJ7DfFY8D_=8&[e=b-ST3149A0G-7UOe4SGL4Q
:AV[\b-5-6VC]]^[6^2J.388LKHG&\bX-5ZaE&gS(aZ,WZ>D6=HMV<5cHTR65.0D
,M.FK]2S5G+EGV01\;1Ta14OEJMUPBd;W06fU=;0)2QH+]\/R08SRae1N-^8G\K^
0^cQJL&F&\>XOb>>;,D4BJV_:[&e8f>V#@Q;XEVS^c5&51+NO.B7&=F?U3:6JM07
Q0ZKU<VL\(1BZCC;MVQ\2P_/NG-dX5QF3>bcX#ZI1<]9gVfd)F(<7A;;X3/EJYW]
#LTATZ;N4^WIT(@Z#I=LWU98@5a,O:d^DO^\&SCa=d:#B\XSVQ;L^4_c\AfANL(4
8R99>1>A280(cg,I5/7U4:K8b9WMUK2)L6^e);93=eKU(28e=MB2//,?-ac@Hg:D
&V7Uc0Y7Z>&b^+fT+Ug4.CQ3\^RV@&UPUDWTVV#ZgO\WgQV30ccf_+:IL&PgQ)9L
BLg):eBd:KF;>5c#=\:XCO&GQ<WTaETf]4>CPIPUJ:L@X=EdX0<MIBQ;;2a#[S^4
HCE#BK71ME?P<9g,+C9#0>ZA(0WUH1&f_JLd>]>5]=R&S9Yf)agd^\3]7@+KSY5A
WEDC3dK#&T1=dD(^<_J_7?.1(.c-<+BQ)dZ]3/IVEE>0#PBR\27:fO66&8G>3JZe
]-fcK9&5MN?1EWZQ6]I#?RACc^)a-HE@HAb^,Q?;P036YLL0G89>?J<D8+32(1>C
\F-YWV-<R[XY^7RI@>HLY4<0A6+);bR.;YK_VH8LCI5fV#J:2ARVeQF@e:+eK\V4
BY7J1P,L:Vgd341e+P7_/AJGV>3^,,61Yf[UMb8&L/2&4b])^CH>,;2-RcVRd@GP
56Q]=M:QKIQ\gFC+9Z_f74_HNQcH)D-7;X>e(dCb+EK#S0@c^3f?[D(_-N>E5+d[
c,I5>@/W[&^?2&dc+W9BE\]fc<M9R]f3g[,D(E4O6IL_B&W/N@-Fd&(CKbc\deG.
\#^fP7aP77M,+8975F&]feBd)/eTFQ)_[BEQO#@NE)-HU4@\A(RSCNJFK6#O9\d3
<;J;TOT@Q5C(Ad&e(ZO#L#&T)WX8PFTXAW6be05.4ZU(g_,&@4#UdKd)GO9QZ=K0
ISQ@6O0>=dZ^5S&[-0@D3[9M_]DQQ<>e_(=c:<)>Ic5?5K\<g+_7<g40MN;SU\0)
&I[PMd:T]+[SK;dW9;fTE&b1G[H7QO1S[2O15]&g38>PJe7>(fdLCaRK-RAb0ZAB
2@eRX:)#&,e2ON@V)TQ.NEd=&-c5-FgVP.)YE9gF\)&M+KAfXCW2MX:;&<XJNWM(
:GPg@0beaIK4NaE58X/AU]VVf-OK6A8O8BBZ.8E+^GFd_LP9BFF/D8.]/La,@:OE
]OA.7>_-DgbV_@2?S.3c8^GQV#O0#&0VRQJ7Q=Z0SM0F[ec@Q]6b=fLZP:cH;Ze\
2Q=84Z/2TfeE#+OW[9Z97ZOO-R:<Z;RQ#aDCPbeg#c@#1J]..X>6^<;QG8U,b#AQ
;e]X\c0/_XbL(WgU8X]DS429_b)B:]O8+(N2TdZ)C8g>Y6]/<P5-.GP5b?\WQZ5F
>#((gL3+/EIAE^FccPS-NYC.[bY^VOR6D?g44d1f[4I&^9GJ_?c>>@4>QWALD=3>
3cT/\U230F,>&_IJZ9(&2X?J_4[@Z:DU#cf47TG&[-G@U8QQ=,#(4W2b.T?4Y6(^
cXC25-6b;d?eZKDfd@CJ3-30DO<8M8&>K:Na?3;C0UT([c6SdS0^)8VZKAB)aCU]
V+/_IT1>8D)e+EPcDeD1.XcVY=XMF<gI-\e<6]AGS&:+g#g9P?TL;ad9:@CXKI)\
4eBK2N02.<HD7:5NOg1f?9Y-8MNUK\Ya_K2WYXdRd_S<JHZW&/eF@=&:Y>P>?SB\
-ee#Ia))bUgXK?CKVb.gTHW&KRVI272^N0b]S8f]_5-Q8+&FF?.9#dQ04S&[7>PL
U.HfNQ;,1>EZLHGZ.]gO\3OF-.Z,^H:S<7[H6_b@d9a->S9+-2fdd4fZH)/+E(LZ
Kg0KLQPabOW;6@E91J57RD;gDJA7\-M[[B#Ucc1?NNLcGB>:.VAD_+/QJS@\AE;:
6Zg<XP1VUH=K-LaHS[I((&ReR]^XVb&XGU_)QHJ^VG&R/Sg?Q,;W2M3V/a(?Neae
b#10C-6:,&#\45C[V^R<#gfgU@D)])Ob3ea9-ABX:P:8G.]e/4fa)XY-19KRZ47b
&&B[V&U^-GTC#T_FTC9=YX;V)gNC=I0cgCd.^[R^S<]\4EB7<(\1EI5XJV<-A&]7
DI=,6PC5V(cZBMbQ[c>48I3]/5]bf&VKO/\<-Oc;R&ee.NKdMW?J\F:9&W]e5CYV
ILJB&fATFWg]KG3U<d]MGPaKPB6\9UK)(2EAbCdH--06C,/DUU[0[NHAL=O2Y86I
S0TBKbSGWR&DK[NCf1-c]b.IaVCg[-).97<V]^WafS8M4_V)1AN35IW,#7_<VRa<
+#-A[La9_P[@(Ig5BS0]?.)OR@0TNgJ9g?Yf+QEV,]X;2YZae?4^3@H.H9W6e?BP
KAD,)P4&)/(BSBdTLE>=XcgICM&If[3dJg5a0bE+B_>,HcIbPIRR&ZgO#P54Kc1.
9;FH32(H]/,5\UA#>HYL&_c5DY,J5f?2&a<Yb;L))NI44T\76))ZOaR-A8.[.-e1
A>S[H:]6XIM3.ST&d2&ZL0@WN+5N&.+T/Q/>3S#L,BL,SMWC0_<7>E2WN+cV2F^(
Q<@.L_P6S9C5195#6-&^#N##[fGJ\fU)L\[f[V^fJEH2EE_QV#fT.]NY,O6I&SJB
CP9ZA0KJ64QCF2MQH5N-3O&ab9:8NXc5C&1LCU;GJOFVNXBfa:^g?;/6\[EPW1B7
\LTX-87Aadf7dZWLURf:+9Ca@3OL72-VL8c5>Ce11TMg6W:b.\^LJMG8E]></##U
aB:B^b.&+FW]Q7^:c<EII7R[IOJBB+FXQID],^M(:Q94c+?I@0a)T0##1\X;c[\8
Q+8Z=;_(5Ic<D^H_VYQ,./R9c4eJX-.NY:(7QdH__A?UWC1Z1e6Vd:RD?K1F#MGc
a#9.,+f,gG+3P,[GDR<?EYD-C:Z(=:PFFTH?)#,fJ]5ZYcMLTVM:NQ9?gf&U+;JH
44?Q\/=K>X0:SI]Y322&.89H9>LCC8+3>gK54b)\[O<>ecYIeYQQLOPc#H+OO0#B
;f#.#bX?\Se]b6-[_ALdI3g/aJO9YTJXXCT3HCW2_D[a1gG+YaWFHf&c?R[WJXg+
d.I+(P0Lg38[J)#?-bIAYPbFZG&5/5FZ-+F]NT=d:<9W;FBX\Q4HK\_0]fcF@:_.
RC)\;aY&-;;]FfN,5=&K;=NSVdV/R>1d1b3@&,L^?b8M25Q0SRSE+X\8c96ZVKCM
D3\b_0WM&8J41J8P<[5P?&AN=T;P1#>+^E5#+<Wg-:BJ1(NLS)4\())Xd98:B;d>
-V:c;8Hd1\<SNf:1.>M3)-Y\H2:V3LHZ3)C010bLIMHJ1Gca(KL^+OVE@DH-?X1.
Af^Y+^JZ]K3RV(7Y7=b&HIMA>Tc.?]?G>_V8:AgE49L_#KSHDY+7#N#>D:UT&->D
LFaM&_A3)U_P>WXR4Z_;F.O27dX/3>5NQA^.J=2>VC&3XJL?a9/52P(7)FMPBT6T
4NKg0OQ0;-SF>:+UadYfH(.G?3CgVMfPIC5T1QfeVUGg/SUf=,eQ;Pcg,9?^eGYS
c<C#,:dA/(I<YDd/KAUK)V2GYX57LXc+T1ORSCA&.V1)::N1)Ed/7Sd0;J9[g]A0
gQ4.\N^4+6>37QB-B-=+BREPTQ?8[0-@/JWHG@FRc[PX^N1,DY_(UGP9EK:O^?7;
XY[J01dW.<NdCfZ^43e8EH(,fO6^)X=LNcV@DcD(U1.-NGa0F._^eeW5gT-+><QI
HfR^XJQ#_LL7W/d9E)V^]:A&M&aAG>ZZFZIJ321MXJOV<f9R)a\c]=PC=d,,UQ9&
)6fXUTF9V+.\D50(Ug^FAQR.35.[Y7=FE,.[cWQJSEAJYS]+C?XDdcHLI/eZQca6
7J)(:>/N\cC[bL0_091S>JW5FeYWQZXY[:(?8\X<#-X8;SN;Y2d:U(?,\=&L)-T.
#(-WcGS:ZeF]CA]c];\37@f\8Og29LG\AQ6U_X+&LF:<E&[X]<Y?JW3(4e7:ULK+
#7cSdGEPKDLI2&(WP\:#G?fH-D]KK[;@N^SUQSD?C(6XK)_K9_ZOPJ.]M#QQ264,
-\]BS+R6\ABeP-R^b6e&bB.I6aY4F&C#Y9Q]gZE,X5SVcDGY#UY/7R(JM;O_@\c,
Ub>=1b0RgF(OHNJP3<N_=e0c2Y=^e#XQ_0-U9/-M[V+g;)VX;F&JYgL]+&KLg41R
9IPETD4_VEe27GUVgd:4cRO7&=Hg&5Q43b0g7MdR/6PB0+=ZTM]=K<9KE<a__L4_
KKYB&.J-50OJ+4-U_4;O21QHEe0e34G]XH(=;&KO7D6[gNH5YPg0S;.U\+3b:8CR
-/;^OS+2+W,dD<1:\/TS_7ge#8PL0=c\1=-HL55f35+0@XM51.3b5Z\DeB.SL>LU
XO.NL@OWM,YMR=3:7Gb<8V/ZPWeO#0QE5XH:1MWL5?BM(_C&aG-\L5M-S0R;ObfK
J1]I,<eXJS0?ZF>cYRHJA5@OfNCOeJCRdg.2G?+#\S?/Z>&Ba^<UHA_P^4/#4OPK
@G4d;+)9D]^J;:O@&HZXge\b]E6QYXUNR>KR5e:(c2PTER37(MU[9+V2(FEHCd29
^3&g0EAFRQ/79Q.WXC@^FaK2-@#H1Z+aKO?Bg=6IK=YEMdfbA==a]1cMBH&.0_+?
MEXcUF1[YKddUSFdc4DSb?+GI4N)MK<\IE(HGgO,;N^5&a+GPQH/=fOd@CK\H,g_
R+)DN9F>2II=&7UOT4A-9(@E=B0)N-6>-=78ZOYR01S^:Y<-=SQ&FO2B(f9HY0X9
Z&.^IVEFYHd??F<MIZ0[CbH6c9/U=_d;A+M8-KN+I^W5&GO.U&:[2ce@1gNR?bGT
]^7&f-af&3\C;Ka?@A][M)BV+9,V>>&+8G-<^@Y?Tb/_LHPR6)Uc0A3=R8^5GD7b
/NVU/H7)@1\@7=)R]@^N[aVQRdO[:PC0XK](5a5Z)WfA)Tcd=g,B&]&5ZKTUPXPM
DE.IL,cW9[F<X-Z6UD^F_=c/#UPV8TB,X^F_OOBeQI52e?V\faI#)[5^d8(5N5\4
8V)_K34PaX#:M#c#P1AQ;J/DN+H_cSTd.6J49SAZ?3T[:\O]V7MGQ6(c6OX^Z;>.
a<O@O\LTN1Rd5#6+]A4;DHf75V]Vd#eVI#6,E/&L2:R@-X-2=]Y6@eF#[fOFXXF8
a^ec^eW98KWHJW5)dNZ3F)[g2=5SGMc=>CVVFT1H?-9ZGIdY&.0KCLR&&bMY@HKG
NP-(/KI[A3H2265+60V&.YJ<&NW8Z07JN,56[>Q6[:L\P_K/GFA(3SJJ(g&B9?4@
9c)W.#W++1#GX>:.&,I9Y-PX/@dNV;Y[S;BQCOA2\:4-U+S.T?1Y(&=3J=TPQJ/B
(Lc7ZdSHcN;A3G0,=1MHff@d<U(ZMb:NWG1DKE8W(^fI=-[.;Y]d35f2[G<f=>a=
3MRJ=bWGEYECE.J3YPeg6X@8A/cA57dF^44Q5^[\@(<^2V_N:[(@a1-MQ/>>Dg+_
X;(QB[I,>(M#6E)8K<>MUL\4+<DQ0A[C3.U03\9Ff+]X)+8&Zf<ZB)D=Y)]&D3:S
N.X+-9_\D>_g^bBD&U,G<X4edV2DSHaP1;;Y7I+>@Q1_MfcHc,RCMJe6c,b)0FLc
d-fR]6WY2]:H\(O>]EDFX2WBVZ@I@2#D?6eCTZQ2;&4F<5b2\0c#,EcgN/2GVWP/
e8FS9ANbIGVVB8RNK3[[QP1F,KF-D,3bU2NA>A#)C+2IW0Wa@]&:e;g;a^_CUNd_
/1WeJ,#8XDA;>MF+eO\JHee+2(V57R[d;$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV

