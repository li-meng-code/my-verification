
`ifndef GUARD_SVT_SPI_xSPI_FLASH_COMMAND_REGISTER_MAP_SV
`define GUARD_SVT_SPI_xSPI_FLASH_COMMAND_REGISTER_MAP_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI flash command register map class. <br/>
 *  It specifies flash command and address frame required to access specifie register.<br/>
 */
class svt_spi_xSPI_flash_command_register_map extends svt_configuration;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  
  /** 
   * This field along with #address_frame_list specifies flash command/address frame(if applicable) <br/> 
   * pair required to access xSPI register mentioned at the same index of #register_name_list.
   */
  svt_spi_types::flash_command_enum flash_command_list[];

  /** 
   * This field specifies the address frame to access register specifies at <br/>
   * same index of #register_name_list.
   */ 
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] address_frame_list[];

  /** This field specifies whether the address frame is required to access the register. */
  bit address_valid_list[];

  /** This field specifies list of supported registers. */
  string register_name_list[];

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
  `svt_vmm_data_new(svt_spi_xSPI_flash_command_register_map)
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
  extern function new(string name = "svt_spi_xSPI_flash_command_register_map");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_flash_command_register_map)
  `svt_data_member_end(svt_spi_xSPI_flash_command_register_map)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_flash_command_register_map.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(`SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
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
  `vmm_typename(svt_spi_xSPI_flash_command_register_map)
  `vmm_class_factory(svt_spi_xSPI_flash_command_register_map)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  //extern virtual function bit [7:0] get_stm_status_register();

endclass

// =============================================================================

`protected
2CbXHSI\[1Q=I5BIY:KdCG8\RM9<1&X^_c3(FUO6/S2<+NTP&;@?.)U?:(gb1cF2
W@g,7Pb,@8,@?5L[S]:NOeZ;5;YW>WIM::G)58<)]J323E)_9JUEM&&9Y>UFLgcM
I0V&aW0:(cL:4/gWQQ7Y4@VPE]8RDQ3>X9K#N3R^58K,Zc^F8I>B:N1S44^)R+b;
4=QKSNGYWNP=M00EKCY^-eW@,e;&NFEFf7c,TN-G]Q_4Xd/&;FY)0.8+5+#;F9[3
PD/0TC56Za;H[?K^DddER^@<ZcF1L0]d2I/E&edD2aC.N/E>6?@bCe+<>^)cRXT8
bO8<?gFOFS/JUQ9Sb0D[W.4C=^PK)YU2;A1MRA\OG\;NG8^C^SCS=;6IP))I/d.R
K(/Ba_J)F2X);H3bL7>;Nc5FEa<bGLfVT:bBS;[aK\)+F+GGMd#H^+a)2W34)/6D
=BU>E>QAC^PM/1Z(AS420@1g)P1g;:80W-,)D>Y<Q&.;fdIG.S_#M7LKJM],Tad@
^bf6T_A2WJK)^J]gP7@gf\R-4Y,7X--13:U9XL;g?\9eO8IDITe#?8a+KSL5D8IT
+MND2Hb//&<IQaH<G_-M\99IQGHVIBV8_LZ+1^@GQ+)V@FC=HIcJ[U5ZJ3?Ne6c7
2=6N-:OY;&BS+PDGgXe5Y\Y8,U[<@:e]SAK3KK[cbM0W>#JLgGJgB2AMK0gJS./]
?G4?BeB6;,2S0$
`endprotected

   
//vcs_vip_protect
`protected
S-8eGObNCQZ=@aTd4/?a\X:&GHDIAFc6d\b5(W^S##135I9gFf3[.(BEgUH\-O8.
BK/R.:]18^:JCGV>^\:FT30c)O/+SAJYQ?EH6f9bD)0X1LBX^fD1DC-,g?Ya]PbW
CQC)WfY8fYeB9(0JCA^@_4(X5-?9E&8YKfPJM_Hg_g-E;RP+Ec2HY-eMZQ,^H^03
K2OM^7>E#(]9(10L[H^9(L^W#X?9aM&EAaUe/bT3R6ZIW/:>4U=4GK6#X;RDCdZP
KW6bF:AZ)d9<UX>:FfWRe))>0#2DMD1Cf.JMS(&R>@]M/DVM6O(T)3N]/ESRTHSe
E7)Z-MbTF7C55>6@<([FWWC[].#G25e(Q)27OVS7,K8Vf0D]0?BG54<M[FfMf.GV
4c36\cc1dC=X4_)-./PQ2b41fY\SU_<<]Z>Y)RT1RV7?a:dH)AgFH^V-8H#&0d9,
bP1UHPZ1()3PPdZe3YVC3W-@0[VA?:<ALgU-MIUZ>\cI]U/dPJ:^&8_0((M6)bMX
V;Z#C\XWB3fQ(:1_eT(,>2f4=AWFJ)CT:1,(C)1AYC)gR828ecEW?gM+Dd0P0U)c
AaEaE^M#e#3@5\dTSG+7>.C[S9&JQK_gFKXa0/A@7W4O(c;I67<V-4\XY#R;VUdd
R4Y2;316\?S&:=QJ=#1ZOVAI<b=)T-.eY(HH/J40CH6)0>>.e7cP<1#0f8HYQCH^
H[aT6/+G/??cM,HR]G7fYeQ=,R1F\V_->,55F,R^E@D>IS72#?E&HF9CH9]g?afD
5)aT/A;X(6g)8FQ^A56fTXJ4g4F,-P5^7=e?_7H@a^9VBMR.__0F+dX44KXDP5.(
JLSPVH=e#_N44]6,6KE0=SVS]FJ(6H&QJbZ)]C,T^1GMY>/U4\UB&@J<YL1W6YaL
Y^(CZPb6#)LFJ?K3-2d(8H+N7->G-P\H;4V4O(<NRIcZPC6e5L6e)BbKgJ&DB0dc
ga+19J.+S+;ec/>1JKE,A-,+X[W#d<_eF^>C0OFPM,#+S&KP@E\fdZ)D]KU#KPA)
,GfW1J]TH=L/c?I9bVMNN3&[N>^c6De&Z^6O&RO:?M@f/He_]I3N79LdMH4NPdFe
,X#b3/;dd)K3L33-/1QD7+UBB^#+KVZ(S=[XOY/+V3ERXY<FacJ.9#8K.@Y.Ac/,
#R=;?/1_C[YM:.cENa1)V4+cC6E.QL-f8IE\@W;C1Vc<72O5W@87DgJDQ[]CUXfH
.aI=)9,PU&?eQ6Sa_5K;PAY9Tad5>R(=[A>Y3)TS6NYUV;@?J3W4#g1>bZ_P1NP(
CHbc0YCSHM2Le6:=UNdB?9R?,<S43+gW440#ZS2[+7B;5R&KY@,Md(>-I^O&6C+8
]_3)HYQdVP=A3G5IT;49>C<bJ0Z_S0UUJ_7N99)R[_MMLfg/Y#LQAX:Z,7FRFIJ2
A(\@XX6(=1>UW^\&JR+J2G1QX7UY>6_,>)KO3I1KeXGM5&\caD@6)Aef;/9f=e90
[SYg:;##_XQV8/Y\JAaE0cQ?VXR.FNZ(GB==egD8@[UO4^M^(b&CDN2^.IC(]eX[
_(B1.C^I7^+;U^61R6L3Ha^0,(@H>Z-f\Cg.6fZc@L9QV(S/.RVYc3I5L_E#W7,R
(Kg8,LBS6JV&ON.P3F&-D/a+I99@LJ^[W[X@.DPL=W(:+9^;>f8AH;g#PZ2+0=KJ
:2XP2KCO2Z=&;>,6(S.1>ZQI=-;\6&Hd8Ic(=9_,.B:KI.DK9P(Y2Je(JMXMIYV0
ccF0:/<UT39dY4PMXLZY]BS@D@c?4-fD][^[H#:_BQ4MNWEdJ>W1C4XU@1\efaOD
\-gagZ].ML16XWA:>73d3_GV#c0(I8V?+S:0_,=g4B7;U>#&&:=3V=^?7Pg(Z3?4
:V(TfJ3E^M:<91Vg_7?TQ6V@bTa;NHFI\STGcT5L])^\[\YFD:;GE0__3](#NTWI
8PMB]aAAXX.V]VU3FL^g?+RRL4JQd_N..=g#e6B-8+9A)b.(>366W/M#?eLeSU<(
#X.bTTI?Ge@JNX@WO]-e_eA_+S_MJ:=70WcFaebN]E95f33MK/Q7g/Z_Z-e1PC+,
TW;d.#;(>BF]+.&8c.a[449]g\Yfa\50>F:4]L609aYA@TCe;?,WD.^42A4:K#G<
FS7AH;4MZSAZWc)@fZ7F:+;CHJGSTJ5c1B58XR=g.S453V^aBL4I@-P3b3=_&DNQ
0LD34UH-Q^\^>=E5)I[3N>?@EER#?<RS31,B,WKX3+#[H?gQ)O&g:N/^2_gCfWfW
#AE,=^S?eg#4a:0EV9V5&3_D@g6FS^UAUX5#]IaLF;)A.[Q.ASdH>>LSQ<>OGL4N
WgDb:P]W[Q;TT6Y6<LMI[I_Lg),J#LBAJ0G#O[\c>62&Fb\R[?L;b)KKL@<60SIW
@FJ7K5DK3,Z>V6g,2FQeM(9>-DZ=F0^c;BJ@?AJI.;@b0=/T4OPP@D=OdB8[&BRe
dSE?dP7EY]dcAU@a/):<<gSeW.>1+4I/@VTLXW(PB5/(9=E>#)V:EJCAX+2WUbX>
].9?3^9(7I@LW9>3eEFD@[XR6c#:4:8^IJ;&L1>EAZf<(0:f)4<06WKH3Fg2GJH6
\Wdaa8&YEfW-4#Rb(CLd6G#[b2;C.P-U>P9E[[@.;YI7\4c]?RdUU#)EfECaVY_Z
G)RL.B8dTZF/I&Lg+e7g)59MWO(>:3).^;Hd9T(.>d(/T_]YgO8H+KLI<290RfRM
<[3G7JOX7V6T6c7C>M6YEC&_;DI)7:I]_F+CFT]1a?OFXd;Y\J6=,>^M==KEW7UT
AL=X^VS:&#4+2f<Bc,gFY+#;.-AfT>S7QZS\;J;be9O=9YP9]I@4T-Ea);IcK\4M
.<I>Y6^M)L&]9,M;\..T</M9AbUc?CQ2&RK[E1&\MfK6=+)KDdC-S97UAHTBP:##
VHQO5dN8YWA@1b6^VE?31G5/\J6G=DQ\AN#&6N7&\g)BK8:S&.)dd/^EC70Q&TZ3
)T)C.<][;#2@Pa8IQ?60WODM_=:I(?.E82YA7S>gT&_U>60aW3Q5-7]+-\X=YV@]
&GKYc-#&dDF;eaCcFF>gYb3O<LC8-5Q]_)5I616g<Ae6J@X,:Y18O):GVdd],R(2
SD15@0(O9D:W:9JU1>L+5R]Z<KB+3_)C3)Ce>Z83IJZVWT1WC71C__=WB7,=JPJ6
RE0.DU;d5J5LYJT3XN9N(?^11+VZJP4:<_;&GJg_PE6^]>HP?BN)ag1F9.[CFg+C
YeL;^EJ_+@R\d2\DQD)&]:G3c(+(\9-VQ<@B@+LS-fW@^A#IRE/>IQ&d&K[DU@K,
W=@L^g4LQJ.6XW>KG-QL_.e0b7G#^b<GQP,=[_-)K55:_G?fOI?ZFNL^Y@Fe+7^G
BPOE:S6^M5+@;-aIHR-(;,M)Ia#E,>27fN?8be+FKd>MZB1]HT6dKQGS<>R-cKH8
V+)G^QD^IE=T)KZU.Y7=cc&E=5Hfb[KU\G+E]eIa41e:NQTN0MgPX\KNFLNdHS7@
1cM,RZ?M3>K+#5L>dPKc2:X^;2Ec12.5KB33JM:ab/FH)NI;&7XYALWR^HO)F4:=
=AX)U42QU_]dP+W32>CfLGQ-?V@Z,&Z<b)1=LAI<5J)J<(Ug(;?R#Y@)eE2@AQ3D
]EPY)&G(HW-(C8DU1BN33M]A:7bXIE1)K4&-\fKb\c]cfY59\OC<BIM<<e,)<F?9
d_VB4,=O+cgg6A+dO[,I.6S5(OR/8ITHV^U=f^U+#KD@7UO\b5L7L,QAQ\L)&>P=
39E>eK9PBgZF)f7Q9EB2B_/_07I49==+c]b8@+daG8De.Q)0dGBa=UUUM0D>[:RI
QSN,&P@:Z_56O8KATfN=SLMF>46)cR3\6I.09Z>c/^Q4(@V?+D2Oe.dCaHd]+_eS
&8e=;=+_:_Ce=/b,KCR9PA5^J&K(f8+,_eV(^&a/K+WAE/RY47H5D2->^_IG5.eD
DX@=eCQGgCBA[DT/B<fAOTD>\JB3XOHP=;TI>ZHad^UI5Jd6/>fH:I9]Z/7VCeda
Vb5?(S&H?:842CM>KU9Z_N-D#[_9H<b=&/YBTX<,L-VL)Wa,7^4KGAGJ#?5)b\Ze
77LX=<c-,>FDGN<->=_PUX>A_@UPR++CQW<.O5c/Z_W]6(JOHaL\T-ZE^U\EaA[B
Ab4GN9(_AO&Cf[]_&8_JH3J.LEJ3-2D]-YB_W^-.B(_?6KR(8G2OICCK)S,0IFSQ
7U5JW+325AM1PVMeTae#G)ZWPQ(R_@0/gd#)4gc3;H<[MVS[K[afV\7-Z##?eG0D
K6LeS8Q0F:(JATR1VHK8gV?POf[M4WMa]]FbIa\#)ZXRN.V13:Wd4Y/Y3fT1:a@-
-)C^@M^M=M?e5GTIJEPg@HW#d_#9U7SZ31W,c0,gG70Pc]0e8L@-AYR7=eY2ZYK4
M&YYQPUTO+6+9c06N1(7@6IFW:d2ESd/\?1W@B8&&fJ^?>J=+37SI?-X[&JU/IPN
(11=6J<HUZXD_-\:-]BFG&1a=6M9M5IDKXSf[c[=JEF;]DaR9=#W:8,G)?efSM7?
0N&;W?,#&6TDSER;E:=228C<2UDfEX8fgJFV:4MU@1C<;ZEG&X:<@7H&d=C.,E-b
,YeX&?<U=a^_\AJ+KaN(fJgNa-fSWCae6YL(O)OYBbJX@SY>BT5<ZHaT(GC]45OC
D8,@U^RK.aHV-2.0ZZLN]feAabN(45F5#4=N6RYNCU5^U0]B0a+38/DV[7;7eOFf
?Bc<gZef(+BT_BW@c41L@:/aJdFI+<.c8>8[91e+CdHYN_0;7=SMPa_/BMVfNR:J
8SI,,T>&WY@L(:(Na.3)JV1OV;adI2c=ff:fVEd,\BAL\db-5=7NKO9g(3)dfRBW
eJD1<Af]^I,3gG::MYUFM6FNV7A9a7V=-Z?K1?P23)Wb6)U87+c1:V^YN[6DfLRO
PG6D=^1cM4;c3YCPJ76BdO7&TOVYY[OFT_D>I.1ca/SJ(-QF2/Q:<>eUKMV@fSXS
<LSa52WY1,50[;KTg9gJ]AOY\S>8.AH,^gF.9.:OPYE5//2X3U>;FE].aBPD+6PD
BKZN&)I2.Kf)RS<U9E-gg>NK+Ve\eB,bMf0F2>DAA7W,^/AGGa+#:\]W<[ge&>2X
=E81fR9\gKH1dCYEX7DC-U7:3.,[;g7O0J4/aNO9KA+Lb2<@bPHL].[@\K<<_I+-
B9;H[[[1Dc+=5+;2EINFZDc9&.[BU[7R.;-3(.EK^)YfSdeKO[1#:2TXY#.AKCa(
gO:d3(2De?N1A(BH1O6I3?XfSUO6)HFQK6P;FZ@dNgQYc)^6(FW@]Gf8c9]?6NT7
Xb[W<Q<BfGFCA/JgTO>1:cHEb<Fe]@_11d,\B+dO(WN&-NQVHJ6PPbEB),<<91,U
(Za_M];>FMVPbU2A/bN3<?KJIRb.95dOY@5ggK1QL4O2>P7ZS7..>,5+[(W2bEWR
60\HZPZEf(C,IBAYP=\VeN=aZ1MM?J_^E.;A9fMT&Z]/#f/[dAI63/ReX3FX1T0F
c(P\KZR8O[=[@CV#:f4U7+,&>QfW+QA4Be[#.G.UKN\D/;?eQ4SIUZT&(01)7R=>
XCZI4+(&N&GNQ)JGLaB,4(-OVZ44P]8+RVA-07;F,@>SGMSF]c^G2L9PGf;(,.H4
C,:Jg2c#:&Zf0eb-?+6gSY00gcO5N9J[&MFX;<>#TcR)RaS6I:F8UHaSKR1<,C?;
VFD5@GS^Zd0MZaecS[.J;>;C4NU(.UV.]=5XYccZ9.bY;MfWW6?LA>VG0TG@3GRQ
\8.UDS0U:)K+L.YVJIXK[<?_VSDd<D#,W-Qg5gYbDgG2EDFXS:@W<<[Ac9C\0R>Z
S6ebLDO9M>gT7e@Ua9__;0e<dHGgC6TWP\eNP5JN_7D+L/D,3Jd@FTU:S98KWc3]
^e<;g1=<@fEd8dYYEJLQa.T8NAg;6.f@c3]Md#(WcU<PF\RUVeY6&H]#HGD-?V.N
A4],V3-\;^^Y?<_6?.e3=SeJZ[W>5Xb,(W/8ITSfe[f]A-DBH[>X@)c-0CRB+Z<C
X3-WM;O++JV2L5IJV>S[a?U@eU)^VeGU(E79A1E/)7EQg##P>)7P08@&8-3d@3bA
H;aMH#(Z;3(?T,SPM\:c#JR4RYQ^5cc[JU+26(dWZP?Z8>\dAP?3d@.Q#@L+;.R&
KWI8;Pba/,?EE&+Z=U65V@AKRDY-\/A5KO0UFX5SP<F>8NRdXg;>?]_+V@QRB[Xe
CQ0(g\+Z+W-\gFL\K>==NVHff#>2NSZP0e&gb&^L&F,&ALRX2S4JSO8](dbFRSPb
b\827_]d28(9&7M31>6O#PMJ51P4A/^)&:4?Y8]>OP:2W>be?gIN.:(U&W:X+C9Q
ECSG<OG^&0@WX4;?2[Dc]R13RL&ZD^&O)/LbA3U#X^bRX-6?#))/^@]5H0#YdffK
g5e-2YDT:PS<E<^WYE;,[K8IdW@0^AYB+5c5UbH1=f?U2.,V@QDb_]JN-WPZA4X8
A9U:+_5T>c,/@GXdKEVX;-16DUPAL&VN6,2K0XbX7._/358fdXTHM@/&:4S9A9F8
23@KG/+4.ZbXN[&A-/YD<O0\A<L>7T8?a6O-X&0EUG=ga-QJBIB[/FPVQaJ]3;]B
0(<NREQ.;UVEOIAY\J>[9D0,5<I3(Z#]09T[9d)6BM8F6O;Y?X=.KeTM@61>NARU
<b\-G-@2AP]Oe7ZT^)bUaY<GYIe0[bVCF2GM,9S@VH-Y\PJ8,A<#3+c37HW[\VGL
Y+U=J0g&=45;UCZf4;TI6b#7LT40?d;L)3VbR]LOd&PSMUg&LNLgfC[[P@R6]T]N
_;^E;N-C:aeCQL(N[a6ZGV.aPJ[&/,TR-R]AMYdYQ_a+/2V31[+bYU(+E<b0YbC(
&?P[-]-B3@RT1>D##2-L4HafX>7>F6[?K,Q)b/:?,R0X(+1+F.I(]7^==X8OE:G@
Y&),0-#agJNHUV:34_=2BA/CEEYGN]Kg(318O6PaX4&WgI,+A,:J];P)J.e.P]3d
X5F&<H5.?L@L.,Y#:FWcV/dF),==NSBZg-Y1S?#1bMK:4U5O^fW&GeF\Og7)g^a/
+QHR3TU)CF:.>gO]Mg@9^FV[]<b1UW_@U94(9VNVPVWY364\?Y6^YYIYAP_SCI+F
f[QeI,fI)_XPLW=gb;2)P1=LYD_B?TC6IB5V&Z1)FGaPV\9P\_Q4CgZ6EC&9:0J<
\Xa&<H,72,[EZQ&K]Z)0_AKCXJVA:;bJePDf7;M38TUP4+gAc871O77K528@S=([
&(33Od4H(MN0dTcPA&cZA1JV^7YITW2L6:9C-AO8gB(Og5NTgeJ;+NgNb599B6OX
RT.(JNE]J7ZMPBUgO^X@PBfAa^A)VXQ\;6-XH02a.KWHfV]6.f#9(3BHdD1)K7.X
2g^0?/7H?0)U<c&&50?88(YJR,7g:]+?aIZ)O.5OOH=PXeC>>R,U\(L:ZX.Z<[X0
?@V8HcCJcO,X?1B33#)RCDN/0#bf80MYHbGaQ#N-F.^^<^(/<6EG14(7]F&-H_Xa
Q15EP3U1^83]b[V&MYC(4F&?S+KAJCW91/F&.g;?cA^P46HgV>f\U+f^SP=6>PT5
?CJ:DeITaeE-GIL)J1e(cXSH0;5cEWQPC9JeAgPXL_(EDG3H7G5cGV&fbGe\;S<[
b8=S^ES3VW>LXJL>,cb770&01V#^B_e[cW>SD&5dTL&Xg@a^+9Oc:<9A&^A9N:cV
4f638fLAYE7]PLT0MOVAUGU?<P^DG([,]^Ac2BQ/+<(0>;_EBNZWI5a9WK3W]<<]
#GE]EUcFB:W1X?VLb2^g5ZgIaO;262fOW/5BVO]@S]D>U_4=>A:7XIQG=AJ:(<aY
3UZ/L5>ZPUMc1YU:59JL#eW:Pe>/^DbY_P,)@LX9O1Q&IXPQ#WBLgUg@/=_TWV<D
]SK(D/-Kd13e6.AV6O]4AY[De8+Q:YJ.5.CP(6GS8>Y-WF6=M3+f?=H_EMLK4ZID
d;c]GR(D&F:gcfHO_,>a_BHJ?#?2CUAF:J62?Z_?<I7\Ff[W4M0==;.A9.\(JX+N
&=e?;Z[fPNY#3WIWE5K?H<)/][R^ScV89\XR0eC8(>&94QQ:bH&;;c)NERD;4D-g
/28&JFYb3@8/+HU@5L0EF#:,If[<D=eMHTG+XcV8OYaZ,O<<^(YCWP6@<<8^^W.E
UXAVS5@K\<EP9B-f\=<Z9])672X=daFR]S#H77feZd?S94H=GI>T3QKCCaV,edD>
&\E0gd>5Leg/?-;7&GAGZZS=VfU6&;V+VT:08-]?25eN1HJO5dJe#S0,BV:(^]RD
1PWZeTF[S4L2T,<d1-)IDTE78NN-1A?-F\Jc?YW7W0D660#8V4EI(aF2V[P-:FUQ
J6-@7;c<(<<#LGREP.VS4gW&^G33:&J>^\[EcIKbf&MdM+T(d\+agOVNM_QcR&?O
[.N,UL^=YFV8NCL>95=N5ff3^,U8O-QE(/(6XH0SL&XgP-J4&\K@?fdQ9T/;-</a
LU=:-DN6W?2b2LF4\=SRSOE,KaSOI-b<YI2>#J?X8;2X0fNGJNbE8KPOUHP)W?UE
2(_^^IT_J[H>;J9,\cHF2cVFYe_]S/<.,K^6\9--d=FS)YR[f:3PaJ5)fHOc5SHY
IH2N&,Td0/\RZML<[XU=\KC6]IbeD0C]9;/WMW8NE-)XX#D?-+GAM#?X^\/Sg+:8
MF42(T:9D[,WEACFgH.=T4EF/3\(]4OLN;@Y;PXE&5SD;UEHAN9f;3IOGa]f,;R<
gY&2^]O[UgG94Wb(E],UD(RKFTdEa9YBC/CebfS&KJA]eU]Y0VIB>L3-_N]Z0_Rb
gP68J8Qf=:Q;^()gYbRd68CREaO0Ga-W]9\L9])7^MY[K1_bV;+<8\V;ZPMT^N?1
LS;Y@/.=<=Pbd#cI-44GR;&dC-@J/1EXF54K]^]SU^^&f,[2NBbPa&VU2N0QC/?;
1HWHI@gVe>=eIC83M1DIL-CJ3Z.#LQC^/)b2HK6g+Sb[C#+XcI?F:@CVbbNWdCE@
Obcg&bBR9X2^8-HP&MgeDZ<(RG(+Z=M#S6\UC&;d\B<R26<NgQG_70gDR88Y#:0C
F4<]M=/F(+CQ658^B:=L_,EBcTgbdF:g(LV/8_a247]>L2&9,)FHJ[_e[B^YBV&D
7POFT4N;?:GQY.6\d_09HLdd8T\afXE;>1Sb4Ff;J[064A38ML)DVF65QN^4)AN7
(ESN_L>SEACA=EF8gW2BQPcc;(W081N&RYCdO\4W0EP?>R68E.6_FI&+]13e.#ba
a_EKX:PIW^E9)P.&Z/Pa=6I#V+>26cVK&J5+JY61CW3ZJ2WF7-68]ecT7O-5.dY[
.PTC2IE_R=L2G/NQg,L+c6_Qd@B-RZR0QFHU;+?Fc^ZPK]&]c=gEfJBY)U>]4bUU
IdSa:@4PS>PSG;\:cJ\gJZA8ZcSZfa6KSeMLPb7g8/L.dK&a:4ICLOF//06c;/fX
Jg([BCLJ]I6T5\b96<fGE5Ca\.R9bOGB,W@>H-df0P)A/=665b4YKQ1C(Z1@93)B
?ACdCcA^TNADXABc]b+Bc:GXGNMVH@>f?0\C:W&\>C??[0EN)5S24\:?\(U[_V6.
8LQ/WaN-CD4[IGZbfKU;UQ81_FRI5D0[9\(g@:EY7;53f@K0Wf[R-L([505=X-e[
QBE4a\VHJ@dI7OUbJJ4)W\2GP_26\X:OeJ[-FZ(Ud/F/82L#A,^7ZR1=AAK2R>F[
f2>0\<b?N\FY=F)OYO4@,_UAT_bbfWXRY8IMFA#-Y-O=;5U0ee2J<[PPFbg58:15
9fZCG>9]MSEa?@g)aT(+NK1@c/0?W>MgA;_GCaLAQ4\ST<6,.5f2P05RESS4XAFX
e+6YH\CY\cdd1AKX444AA<)AB69<MNS]1V448+.@(+=5VQ:IY1B)D5Q&B7_<_CcR
A@N-JG7_CW-6H[NJO;B^_a,Q97\4g8faXUR#[5>+dfU@UFIC,1FFT>_J?OA\WC-B
K70U<+6H>D.KEb9.,^H6^V7g&2?MU)5c_1I-FR_BW@4\^/:V<&+5DI)&W8?Q@46d
8N,a+:-=O.4-g//dB1IF=WS0bTfC+f>cX]@dP])<dV/)@6=&eEO>C8X(0b#ZEYWb
4(>4;:F3Z9dZ,X]4db=?D4(4Ve4]QACc=+<,8/.f\aSAXKHQQ3d7LK:S^U^g)aNP
@[VaFVL-@LJcUVSGW1NYK2F5:H9@^)ST,P=D6,-QJ9^YJRZ\UEg\ZQ(RDSAI##0L
S,I606-L-@&54@/TX>M2516[H&H8&R/f#]3Sfc4_\=T:SL0gTb&K0b4NI0.IUZF:
KMOV0O<>THE@E2#fFH8fa+K&M+GS.V<gVS,3:7H9;9.J7JU-:6gWfMEVa/0\JRJN
g7ZY#Q3P3)d,XPbb3P>9aMR<N#KVK&dQ=X7U0b#L-2.4TQdE2gO)0dIb.SMD0XFb
\_-9[2F.#-/efg2B)RcHF8MMEP=5UA[K>+JP/2d[EJL]/^9/EU_H5Ud6JDc4>60=
>_JPESH_?@g-#CX+LY#cY2.LM(:3,bS@:YeO,QR72Qd^1L<+BIRMD2f?P+e_L>AJ
&dBNgS63e-a)6F=C?YW:D(@C_,VJ4fWf3EUV(DCdcZC.M,89):d@;:_Y?SE,]Q1M
<)#18XAa\&\)I43Db_afF>KPag0:WJ]N)^9ID46L<Y//1#F@NBf+;83X>XJ0I1[#
g3A[HM;Cc)gY(^Y3F&TV0^=SG?A:8-<&Jf\2;#Z1K73LV2-D=:>L=I.@,W=#7VTE
gN)X[8A4OA0F+=:U(M1UOP@VFbRM=^-AgQ(6PdMKWf16;0d],U@)>GH^[=58LV;K
;Q^dO&5<9NL+[.8?O@3>bD78e4Ec4^^LEV6IeGFZ4YeK6RI,U/ef-gA@<L;9O5XO
^U8<K921WSf2>NAFV#AOUc6^Rb=GFP(39DOgRP&K+X(&6Q[Z/BccME-G8e/4FdPV
Ned,d0@QBAbMR=0=^G-9>VNS2@A1<7A2FJW4a7dU:@>-BJDNbZY>W<3L7S;-c4>+
>_4D9=0A@bc>U6AD^R@]I;WffUD(ccZ+1;:P+)V6H2Jb:RJb&/SQ,33N=6C^65/@
BX5;=44KN4:M1+8d>N3/-fBZ6T_2+W(BOCGLXX]3U28(ESeSf,dA=U:\>]T3G+_7
d)b^ZXd/O)5_fO1TgUXU[72PH^^e3FSZQ/bDI:>gH>4G[VO^HIG&Q0EfM@aLGg?7
\fO3^XLg=_C31<Ve,@TM;\f;[1AfDP_d@f^D<PENc0c6HM&OH[)[Ze3MY]X4_TMT
D^6:Tc:PRX.XJ2fcIOcZTeUbZIU+S^BO(G3Z^HMXbHbW7SFN#4b(e.4LbF)?[Jb]
bY-I@@I:YM_eW&g+O&^-G56@/CWadFg02RXBZYfNd4,IgXZ/:3YI@?/_7A@208D-
)[:(0OTR_M6Ub5.aL?5MWSUJ#:+W5JLb:9NbS2Q-e&,4).[L1;D0gPO>\MPXQIQS
dH;L<)b-[?bTV>\E,OD.&]EY.(L-8D.&W,GMR)OG07g)LcZC#^K-SW[AdUC+>)/D
Yf]3E<;ALVC<6#0L\>T4-4)/IYc?O2:bT-EB[?Y,S]8<K;^K+,WUc_)Tc0#RW)&)
CRd4GG]AY-27eKZfUH(X<E.753BQ?1>OMOU9/S<K\(/e@?\;(G8@P3aSZ)]_2eSB
2-RO6]^I@0VaX,^(Z<SK^)V1G5>TQ81+_1;F6VbW6@1;82J56=F\SSE\gU+>K/O^
9YMKXR8IVE\QLga6Q;]aTZ9I7LGO2&3?HD.K8GB4:U_B-VX5Y)6U37T1F1>eGg?Q
N.PB<VPLUQ.ZQ)AKJ;<66fWTMcXaJO5S=KW(X#S2HUF(DC?bd[bLJ_fJBIC=?UC8
MHVZ>G^YVA[b33I6@;L&)&#;,P@Q5HEMY(V?H)/>dT>3[6Q8@3.O8U:;=d7ER7N\
;b1\B6AeF24^QS57F;0.HZfN-6?a&N:(]>EZDGCQ9O>8Z<@<f_GN:BUG&[^d3?S#
(2.^dfWINXaaR+\_ZW;N&aR[/N/,JSRGLfQa+T,ZV[@;MJbdKQ::Y&O2_/X=aeg1
.0HLIP-QA>&44:LOE)2O-;Y\g,)8,BT(,[\(3PU6ZKQH,R5,MUEN\Z<UNM<H=<JM
2LK&+;QV(b[2QR;5?R]fE:<:IcVI:g>cVMJKEDRZRe_?WR(;1LU)5TagIT.\2X0;
8PaR4BF_</-8M2]]U.[>1C8N9c4K,UBO3HRSeE)0_cYe3P3\14PRBN#\>2ZOGD[E
^YK4.bEQO#=]c\?&YZ^-e4b[:,A4>)BVVB]R=M6M]b2W.:6LVXYa-=I5ae4J2Md7
3fg.G996?.LfS139(+/UYbBU=5>&c-ZF6DW-+4AeAP8PL,2Ifc@<0f(DM8WV_DZd
e4eR;7L/,B-?/LXM<f;eNDXM3A;T;M.caSW53QFI@Dc\I568>>aB>LBR[)W]MHL@
;EI^2QKVB>IAd^6XgOT7CJ--Mce@9Tf-YUX?bFJY)&(d4./E^QS]\MW]]3C:IUR8
[aNJ/7P3:\+f]5,NBP&.-TL-US9QIe@c_Va00.6.-0GGNE@<=CY1Y?,dIE5TgJC#
Z[PQbAb>\6CTb\eG@#2=EZ\ZZaY<J\b5_4/g\(6@7^8GQ57d:e7Af?KW\:e(_BQN
Zgb-)gL]Z?_fEcJ/bJ.IC@LGB1c&S(Jfff84V<765HbHJ,-[SO>6+I:N=654#@fJ
FFC-DUOX@]c+>+:.WR<?[?V=UBaIdF5Od6QSfYgAG9DeS,^OD^W@/OQ<\Cg)facO
1S./R8)S6GE[7]B3LO:P0CVU2UR]4D6=Q?1GOV5CfeK^GM?\aSUMKHP==9?_V42B
9(-5IQ4B@b#H6SMG;SSgOTFDIN)=+c_B;g>g4Q-C/eB:SP)T8L2Z.e-0U,UWLVU6
dcAD).e;MBUJ+8]BBQL+2MCH]?SQ/;5aU70(V:LeOXb9H-O,BJQ9dN6BIVc/+QI_
f#Scd<?X&[&CTY28/9QGQ#J;d1S2BA:JDW8Kb5?9b93J9DbTFZdT,cOV>&8QYBC:
+CP?H5g+eGKZ2QBS&;2D2-R:(P.Y^X;YKHa8-(D;aZge^B,XX/:Z(gM^&c_0HJ<d
_B2X+d[(H&B;#eQ+&X&W@#DQU#1^.H)2Dd,F3dD-M<:gbeAMWc:50(:B?-0dN&0W
C0OM;0VTQA>R/ePPf/aO:6.2T(<[LQFeB?&K-bI?K12cO8.aM<3/2Y(e=0LRH:bf
TSPNed^^aag(SeRC&+3.]eSX;21WS.QNO1M3#&7X3CNB<J+1bH9M9:=2>]a\Q4+#
(^Ld?b<+-8KJ(JO-;E8BeK8Z>c&H-1KPPKD.1Y:HMV#RK/,fb7I6FT)YIS]]N;6[
a2?1UK2,0Je-)^J03SbcD#Y9;cf(>-H2Hd4G;#9cCUNPa(^#_Mg:V+BT04ZZX1NW
UDg\0RR4Ye.4W:(f37e:/:\g:&W=\1UYA#W=f#XBO4gRH=c#:YdQ1=eUc(AVdS^B
J1G5WGaMNA?=<ZSJGOE-b;/(KY]0e;79Sf+UY5([G_I?gKe8aQ9K8;ADFR[Z6SJJ
3FD\?Cb_6EEYKf5K6c#CGJP<@\4dO7]ePJ;.FC[eY;S3RJ_,#-7DUQT(JA\HdJd0
46UO;XVQ0.WGH&@g_02RAF-^8f7ADYF,W6#0d6g7ZNY]XdJ4g[5aZS84R(#9#5WD
dSeX?0H-4>G[E-H^461^W1U5aY[)YF3EP)12.Rd]>_5c.2+5+8/IBBI2K<@U;R7<
:/OeZ64T6ZG=_#f]HJ^?da(aM7^=&M@N.Df2@]b9A>6CXaaa.Q^V&cO17-Bf)5bc
C4DW\?-[^J]T)dGFf;@]<YHVCE(Q0Uec^6Sa4_3Y/NX20(#;(M2KYZ3T/FJ60@BN
F(LNGBAYN5#eG]5UDeM(RHIcXT?_/[=T)QL3QdM3aE,)NCMfR12=+_(O(&.STM=a
X]A)INKFC.PQJ]DANIbgdOdOCY:AILL19IJY01Z6@R_eK?g(S)BF_-,UZETO7#?U
WAFJ[c4,#1L-g]ABRO6Z>,Q5J-P\\@)IY4/G:G)5-I:+TUW9/61N)YGYUgd>f\GX
][/5(-N^HRN1A+]6B[2.]9]a.5f6eCeRdU,0\?:]FZH72,Z.B]FTL]EP?NZc[3&Q
Y(WO4\^7TI,XO>O7(Q,L\D,48NGWMNbC38A882_9E>K-[B2Nd0^G91Z><f#(OfHR
;,K8eg<<P5:(@?bUU2:0Q]4g0OOBX87YZ?:Rb?M>&HIY_ECT4NWNfDeS16(255/H
M#HSc]@4]AQ=G4.(GT>,5_OS[#0I+PbHH12&##<8OG3Wc<e?<V223Q;+1\@7HKR+
>bMH>6(-,N-(_NH>5@.+]33L:V.[>4CPK8U6TD<MJE+Q=>J[G>fc-2<JFDIf/]^#
EecHI[UJ./M1;eRZE+MJ5JNg>M(>H7L[;X+EfTD7<,ADb7DW6]QT\#A=,]NeQa?B
52^XDM?QcebK(OFWPWUf<AT=Ve1,W2?KdS,Q(:@e-P8<SUD>DM4MXTUg2G/9=NFT
@M2eX\Dgf5fP._+Q8A2Q4M=HP9R1L)C\K.7KBB?U>fSA,\YU_GC1F8gG?I0^+A5Y
.U<GQ.e?G<fdZJ)EIHG@?CGXRL48eV[?GV;ZSgZSPJ.[-CD\=_F-H3eZO#BC389]
LA75_]#,O971X:Q/^5Z2]c<HAa:&X8&Ug=02\8G?gM]XEKO8H6#ea.3aEO+J9ZB=
M)Yc8=bRTBVRfNS,NUPSG7Q[b4Qg<>T[@2&V_&fM6OXC9aA9:Z2&B3Rf@,Y2UPg-
^_;-d_ITES:::[W\_Fg\[@/S+VL/ZN=\ZcY<]VLEeXN;@;9<)#EJL,IP^I-9H(bc
[WY.2<cV0eCK._QTK6Z;R^S?/VN@-T.R2M[>H=<:5H5_BIB6]WY)3\9GC&X<4R;Q
O_7,0>&D1>:K>_\d-LVNL0]^^O+RaVJVKU(YN_M@Nba^a6^(VbXTW+CWT4I_Bf/.
Eb6fA8g.V&U#6f+V?HXLB&d#c95cVPHDK23@H=dQ&1[_c5b#J#,9AY@HIBKd)UD,
Sa1RR^8=RXO-RA[4gGf^.]9S8SY+g26U99FV.bTcM5Y1/Mg9E@&[@eW?J9AJ.a/I
C#5c^\Nba)KRD@YgbAU4f@516TL15NO>9c(->a97L&@;H1e>d@;\.FcK3X1+f;?d
)/P?EZ/IH/+JAG+5f@12^S1cZ32A)YfHSSJ)6.PX9B9_XCbS(&]CI\5f;RafK0>L
T&)<<EM[^>Cg.>a0C7b?.VUQ?d/d#/JVH;HR1\D7Ob.bYS:e.ScB3W-7]IX78&JD
PFBR21&T0CAB,1-CDVa+YJ&F((8Q[O^FSg@)3P3@ad2b#A#R;D2Z#-=9a6&b822(
1_HRcUOd1T=)b=FH&]GaJ(TG_^VUfR8P^P^fR1U]-gX0aGIST<1-.9W;]&-@G=U.
cTJaXH0T4M:<7AM2eF#/.7UPRbS/]-EI]a.Y/Dc;Q1c(L7ZP<(]4]FA@=_eeO6A^
DcVKeV?[G\0d2<M)9&PN)(SX;R_KV8KX(5LKGH0PGKU?U/L+OO,T;Z?Z?<+.4<D9
eVR^;AS./AHI9(3V]0SI0:)J/]NM-R7A2?W6=(>cIA(Z]N9>KS._@Y=@C.8LNCNI
))[\LL2?5O3bCcU[RJ<6R:f[)ECL4C>2X.ZM?eSX.[dB]7AE)0a&[61P3@IcCab6
V](D)#,;KebbPHA;g8M@MU:g/C@>@d[Xf\/c(Xb/WgXab<dBN^__PV\_De/\b[0:
6_7OFEATeE(W20RR+BT)IN2TYaFRTFMDX73bB/DUaKYgRL-3E,+4.0FF_d5DOOD[
0B]+AW7<#O/UU8a:eL#M.5gUN^1(-b,.bg8fV0AC_f26+6FIa=\g]0>U+e^X=QX[
C-Y5IHO;7/I[,T#9.;6V]#1KaHM\-GMP3]BaA1d+]3f(I4\),b0ID1]Ke/2H_7b4
1Qg)8=,eaB[cDN=-@/(cIRb<CK5CR9VONF#gg7N=GRF\+?OR;[HKK)eXLEON24CK
A(@\(GA?4S/4.>PR7d&a-5e[>d&5=PgNDH?8Ge,/UMXfReMe:.aD.eA>Z92QEaO3
N;V[X1,0A=V2fP,3;Lbc=8Ec_Me&dDg3>N7-.F1QTN)e[NY0]Y;K-?BS_37d@_\[
(Pa.b&OHN=X7aa.R_>IX+Cf&GS71dPg]-JO>A<4+HB;2.ST.XZ=/T@)D?HM:5H,)
RefDF,7:O\F[:<f&7=eS:@(5BK-=XbdK)01AdERT,?=NSbHVUO7R5S]I)<B5XOP0
\UR#9LO]A2=?WZNg5;:QU&YMEIe\-C6)c6dC\D0bK-=/PXP?P\;(BFcF27R?U#A7
X&]bcXbZMd-OW[La4J(g>JKO-JTYaDO+Ug3W0c1V27BVOE#<QWZ0IL^^/_9>AB:<
NN+(cIPcGK]R,P/B)8FROY]-Xe&HR0NP_?#VMNBY@Ibce./V-ZZ98b8D?2dE8:_A
WV:NGa6C:-RKR)Bb;1N#)\S3WdK_dag;[@+R<6)UMU8SSY-198eZ.Y7M;fZ\+g1I
OH^SB/W_0SI1A,M8P<T5.:Q>Z@UJ_\[:(;2/C:E10MdPa01ETW[L\dd(8D_CP77M
CEOVYFE8Rc&((U9fV1THgHf0TL752JP>C6=d&&gG7:))4^L[].Z6TI@(DQDbTUK7
A?JDR]4#@]J;d@S4]\-FF=<0cfZOE9&eWG6E_#X&e_@^VTKIfP28=T.^[-64TcfC
g2)V8NSJ@S3MWU9\7E[&IA^1W..P)YK2TA)5;,Mg=O8>>7IIG9R/?Z5)3N8[8[B]
783AV]ga2R]g(,022#CA2/.2A<:(VV>f8O<]\-8X>?cWTZ<X>.;Me3?U@9#bK8eE
[1Pe&R8O-CI&c=F?GgB)^S_).ZA_U=(QL1_SO:-1Za6F2IB@.K62)\.5>PN@eUIH
OgW1Z?J=,8c]E-Wd;?dRZE+#_N2AB=c/QSIOd\/UBgBUEX<T?Z?fZgN&WHWZ:W8Z
#ZD,]ZW==bP-\?X0g/D1/,^abEdMVOC^HIWA6+99YdK)I>G=?EC5MBcVPe:(3\51
c_421#E)#dGVKc,MD1=L^PdNQAS)[B>UX#O8QO=A5T@BX?]DEKD:CTgRJ<I9450,
]&c2P/N70WZe-5,:80S5[4,WV+A<=,Q[^E^,6,F6R:dR?g,&KJ&G>7Z>94@Z,1W,
;LHW,=R7JTW64@VM5R@L8QZ[0O@H)]+3.(V>?5U#T1EJ(+/U-.&\)6VJYF>3R&A8
-\[3<fR&(0#QV>T4WX9a:aE=XGVdO>C?#68JcQ14O,KM+<4)8+(W<LEYDOG\J:RD
6@V=4J0CF/[#U0gFP&\Od:I_7SJ<Pb3#@A])8-c9#6d5I;?bJWS3<3-)FG_2?0W9
JCT)cC-E65^:7:PGYHA6@(\YacBT?W,GKITN[=52=,^:@\&_^#\/9e11X+7b11gf
2@bW:B[P0a2;N6E[>(RO?Q:-#_dgFTZ>P>VN#AS^OT5X>/<[MOXN0-6W\SZU=O-5
/:R-/;8DbQK>;:;E-8#A,<M:/,f?IRMR-4+@6HbYb)?38]gO15@LP9(:2gIJIcYE
#D<L3=]9=N<eB)aVS/[H?FA+6(;F4YgO>g6f,OT:YDQQ-0<[==6VR^#(>aQPA#MT
P6Hea[1VP?LYP/69.T4TbN3#;cN96N3?Nb7.F17/81C2NEN1DZ1#.dVacb&4A]4F
MFSDT_WcG>H/dZZL#O@ZHDL<E9]74\B3d_+(dg?SNV24_5F0<#ZYQXeK?SSR)QHY
Fd,6#2.P>4DOEB1Oc=g6[aXM)M;E?1.4Ob#Fg0_)QH^OAEO34KX+XD<JH17E2-g3
#@ERDJ0US(OAf?U\;_8a1d_H=gB9CU#5P_Da]2TB^LGA2._bK4a_N_;GBF:<-=_;
2]JaTA?bNK^JDU=E)<O:-[)-+.V0H3^E-QB:F<bLCHfANZ5UBD^CN(X6(A>EE4A9
^IIB<]_c5=\N<L&4QVC348C9XM#_S,gUcA853&-Ld=IOa;)LW77,-LMEOM@A0I#d
HO8G/5K1Gd)E)DN)a)E9VCc9I3g>^A4UT8GgREb7Z?#WB;B;8^cc:R8M+Y7-P\?S
Q4Lf2Y;Fa)7_SH2A_BV]fQfW=VQ;E]MXWaZ)XeW+YMDZLTO+HH7OAB5FWLQLEBb&
CH&f0R9;79KBbJU;a0d(H0(69E)@S::\3AdYd2:XA?T99_5FCX4B+_M^.,Y(0b/b
[&<Ob](<//DAFQTY-C>^_1CN78g=YfXUf.9\N)GEPeg]\c1J28PJbH<ea5XJ6PfU
fB8NQ[0X=[Y3[JaT_L:?@dTA@;&Q#LDR3N#gM@KgcO,9&M,JN-W(eP9Q,JT::)&G
9J_cV@Va7,GKWXgWXeJM@^PUJ_NfP&=V#A;Z\E6@fd4Y_NRPD.?=F)BLC1WeK_0#
L\L[cU2]8M)+2?ZW99cW&+(EQ;g\IIDU[D<@X/gO[M<S?]S9PUI_KbeK;E\_\ONf
g:[G\bM)MNUWROUdVgP:KgV(@=E+UdBge_[#J0BL1\#]GSa634&](RY;<^C]0UZC
V?8>@1.X?P//)E\dGd=[MIbBB3W)I+JUe^741]^[4U^[/VGX16[&[^C/J7]L7,6(
KV;a[(601<AYM[<P:X&==H3dEV8Kb<MS(1<L76.QP&)(S[>GN^ID5=cE[F]N5R]L
=;M_:?N,Z#,LA-/P)9U:J==\g<K/dH;N[I5H/:I1.f5+gDIHTc3O2P#L?KJ9#-@Q
.KMIXXA[-;-V+Z#^fF;DF@b2294Z[?Lb95ZCb9-d<:1AL<PD@JD&&1IY8a849^F]
RBbII4JP5U,O6(,4)[Z>CL#+GD7.]b/-gCB+Z6@0#7VgQXf6@ISTT1N9D#Y8H;RH
N@gSG][T:VGOTBB@gKA-]IU-<GV?^?/G>MQ0KA,YYbVBgdRR,M=X=TA+:4(L(9L0
:Mg2HNE+e#\-PVgVIP\48_,+NF=VM+[.1e=L&FEQ:&&X\6/2,bWIV,dIe[7V-bfT
Bc>\+L8BbG>IMC@EFe#)UM0->Y@EbfAWBMI^@,F&;G7e?T([1<\0gOcSMC(;M9F^
V@5W6e+BEHUQ1Je]6g6OPgE@MV=9(cF(CXbb6G;[f+(ABS9=C[-2&9A<gJ-VIDFR
0E9#J[7.Y3]9ddV,ZLKH4Sc5&Y62>EBP:R(+,O6]##Q+f4.5fI752(cL-KGAadg9
0ZIQ7cF:/]4LE9Qc&UeR1>DK><,LKD.?=$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_FLASH_COMMAND_REGISTER_MAP_SV

