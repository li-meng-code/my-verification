
`ifndef GUARD_SVT_SPI_xSPI_JEDEC_TOP_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_JEDEC_TOP_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI JEDEC top register class.
 */
class svt_spi_xSPI_jedec_top_register extends svt_status;

  /** xSPI Flash JEDEC NonVolatile Configuration Register Class Handle. */
  svt_spi_xSPI_jedec_nonvolatile_configuration_register nonvolatile_cfg_register;
  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`protected
,bTHAfSK72Q&gS6[a)AH+C8FI^38ege_3[53[#:EO^.Y2I]]be@<3)B#,dD96D^G
KIO92X^SS-F\Te<[;g2_E-BAMMV-4U+dTN:eJ:d7R2H;N\(N@ecV5C.O[MD&#/_U
:;1R8[:(8ff;(D2_(M1-FY8b/?b1P,-Z]0DdbD9NTX:(G]&a\5\?E^.OP$
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
  `svt_vmm_data_new(svt_spi_xSPI_jedec_top_register)
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
  extern function new(string name = "svt_spi_xSPI_jedec_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_jedec_top_register)
`protected
6._G_3(R&:#\M2>.#O3A#D[dK4aRR^)-IVdI/g@>GF/AYS&T(FOe5)HF7R/Q8+KD
IdI8M9.<44O6GCCUE^N@B<EOgU=<[YfO]24Sd&E4R#Ida3EDJOSB@.NOK(dSE:M,
V,E3d>#G4U&=9eI70LOVV3[(7;#J>ff94:IcQM9ID9B,f2.@da<2JU&9+D,TKXg_
^UVbRf/,Ba>1HfQ)GHL=^OZBSNR;5^\=0eOO1TUJ@_5,A$
`endprotected

    `svt_field_object(nonvolatile_cfg_register, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_xSPI_jedec_top_register)

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
   * Allocates a new object of type svt_spi_xSPI_jedec_top_register.
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
   */
  extern virtual function void create_xSPI_jedec_nonvolatile_cfg_register();

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
  extern virtual function void get_xSPI_generic_register(input string reg_name, output svt_spi_types::serial_queue reg_val_serial,input bit enable_profile_2_0_mode);

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
  `vmm_typename(svt_spi_xSPI_jedec_top_register)
  `vmm_class_factory(svt_spi_xSPI_jedec_top_register)
`endif

endclass

// =============================================================================

`protected
aM>1ECDT<dI9_58O2LU_SL]7d8MN<A1.M^Z4IG]VLbU35C)_6&cU5)=J\C#8Q:D-
&;;b7HI0MF#)RUL#,9=>GG/6AeSW=9\[V?PFfD_f3VST9J1YL5;6KT\(Xgc3&#17
=-G)FTQJ.6Z+.QW-Le(@W\;H+8IR7-;FFFecZ6NP.XcNK,\KOfMTC,>:LN1GRRMa
fNYd1G7M)A#;5CacbI8H5Ga,<gANYI<>0<&0L8I@K>@TK6_d3.]0&?EO1JPEWX\:
c#8EBc[RQ0^OcKS?I<(@BF-8>)LG9\f;7<EJXe1OGDBT^Z(gP1#LB)_:g=:)\^DI
9(X2&gL17_YP2]]1<)\^/4R:<#7P9VJB6WSSU<9=OQQd=<W@2M\@USWcM,>aP3Mf
?@L70?O\/IR?+?0I^C:f>6]2[0@D?GCVIGU2@3Q(62:);[f640NS9,8MKHWXYCIG
F:(X]_4a<ef)+U3:NX]cA(U_#VSR262:NP-[Qg\0HL]Z7UOgWQ+BaJLH@/CN2J+I
T7^?g>P_LXbGE\VP&5^e:dT_FOPV&5;Db.-WC0<XgBT^VX5YTc9WKTOHFRH3>U3A
SE[>OL+WWS#9K)C&OU(OJ3,GUZ(C0#=FN#.PMU<1,L&JZL_B:DHfY@H7>F@S<O.F
\3-^bXV\I^KX+CaQ@QOe/[S76,aOF1Y\@$
`endprotected

   
//vcs_vip_protect
`protected
J>cA_6Vf?+EJX?A@e,;3=HJM]G,U[Y#):;;a9JM>RNbW9ATC)dOb.(V@SbZSI,;5
&4Q6V=WW;Cc+PCY=[^J4KXD0?8f#YYZ85,W.LaA5WPWYO&)5N7:I,\6g2CdM@+gf
SW9.I)V4-5cY7?.8;1Qc/XR0O?5P?&EHZ1[9#,cBb=@?9TGBCVUI9&S>J-ZZO<:b
48@DW.(O(gBG=0I_/GQLSH^LJ<bR(d2>GX8[ZU82b>b3CH71BYYN;ZOYK,-?Og?3
X8->_H0HadY[CaWBVV_W=Dd4MG()KI,PS,?e\aOG6H5-;:4#0BPA@Nb=[<DPPg;S
[36<Z3Y)2]+<be#6GFV3&<\:K7E6[O_f/FTgG#F)OO]<]->OfBDI;>SAP22Ef-1C
.)c_c8I)d&_Leb.[T5>@<1D_#XPN@g+S=[@b#,E&BWfN<(#<5ZCW^a\)Og/+1]WX
1#5+JA\Ydga>c2,_E^fT2/-e#=-DO7;LcYAgQ+3X1E]#S:E&ZR5DF&X<W;4]efDF
Q80A-NcF>LO=cZY1>e1H3L79Y?:FZMT6L/#\NgKa\bR>T;^(afPe:&BgX9^-2[2+
&L_7[S_b0DGZ23#[HA3G5L1H_):)[A>4Wc3Ie\YF2(fe:<C?8<c?1?b&X+3,U#<R
E.25b675;bP)U;CG)003R)\?ZWC[YOL\&<B;F7=R;Ba2Z1GOggS\?,-==[9X@[.d
YU2=FR5ZT19)U8KVC&9]9/J]ZR>IR371?VJ1/.A=5B\fI<L113>H6R0U,ID546?F
.0Q.-eYTcDQ_QH4/gB<D,UFLe)KR5RG2VHH,]UL+5R?RU0)\FJV;bL(DK.YPWcfC
F7QED-H8/Ic4&-4gTZE2\++V_T5LG<(/>#/8V4(b+L#74/)FYUC26[VLcg8eCBX9
3^QJefMd>49BHOEJXIA:a&ObN8DCWHQ&fO#I\:B]eN4?0J+cN<E>cGT]?K,cG-M,
_da=QBGSgKNJ/Z(WSK37Y12/U6@[f]2:/dSX6@=P4+=FA2W0)1@+D/?cC&bd]4QB
3TR<SeXg[Zga2V[S+(Jc9H-T88G,Xac7N#@[C5:K6#]aX>)YILG^QXX@VaKTX-AT
_36)43G==\FIKDS(<B7#>WMCJZ4<ME6gD/W49D-JTD((Z4<BL1CT]Z)X047-2]FT
_R+=3W2)4RVN78UY8J279aGcEZaJM]B@]gA.?;8)07M>[?1G&J-]PA^GTWTJZ-MM
bY(Lfa9OB-N[H/E#bUgLI?fa5VG)a)U-8WRR=ZgMCD)T/d1C0g8-_EIGg^PePd/O
FPKbdBKYfN<CA:H>.)[J>JJYA7e&I]=6Tg[.S8?4H8D7(X#4K1afB.@=]2XLPH6Q
O3KC\@^Q)=cg?g4)E,-JF,/2+L^11Q)J6NY^A:_)/9>>E:5gS=Q)1><4HLY;NSXf
fX)f:dPEI5LHRdHA<TTK[-1cPUG+-3&;D-XIgJb[#NXbfed;RAJa]_9KQRH7F8-^
ME&XeN<>=Of^:YZ\[WDGTHO5aPIF_BCgK1]gHI5aGEfA0:?<^(+g[8@>Y;IXBUWT
H0:CEH0L1NJD(;4G/29^+OOLb&]bMcRe1fYOHFe:PDg<IAcOAINZR\=5NOYD36A.
&9]#LfDV1YF[f67INd]CB,/eOAaEKZI:d4HUU\PR.K/KG\2K[\)2]N&]4AW6Ff.7
Y60Y&>:G<(MG.F,]R]#B?##-]+=,2^@O-YZ6K(]<NGD+ZT1LUB6U/FG0CHM/d4(T
SU^-Y9fg8,]a[82]NAQcY3G&SZCV]+P5?2]/9)JJ[@E.7IJ4Y#?+XgGg>67NXI8:
9(-Hg?^BVCdUYS6WD6Dd;G613g8JcAbZBf,<,)9<bUSM:MRUa=1A,U74O<:^M:1S
UTaTB].[9ZK/2V)-D-051-)H6_faFJ8D6\^;aIA-(_=HAfK@]H?A#SPN^<ZG2cOD
ZU_V3b=2OWe7PWe-0YLITZL1RcGKH_c+SBVSXA)@d-OML@YReg/&7f[3G3R;2.];
f2^U)^]6SOefa2BFCB=Cb[(7H8^^_S60M-QVSDgL,1(/TEVQM.:QSSMRT)\JCLQ:
a/,VWLAVAH>bAf4ZS7FVB^PE_6f(..533B+WR_=M;NAZA,bYQ((=3A=bN[R\A:^7
OXC0U6)Y#KQ90S,eQHU1C,1>V04A8G97@0,_3.5KROQX[E-I7JPded3,SEZ>Y4FI
8;TF^CIB,62;,eH]KcTSK>CJO-fHAIXURF.H?/Rd\5=J777+KU>&)Q)QcG2Fg8Lb
M_2G;]##94,XB141F7ND,@&?cDab;:A/,7T9bg_Ig8aQ>.J1Xc\6XNMBZ).Ff,Ma
<M:4R=_B>54_9[&_HK;H.)&</2(8U/C?AeL@]C43eSL;0L;25IL)bdD[VB/4ODAC
?Q20T,0JY@8JW)KA\49b[[V\/V,?<&d\;:eB-9Qg-#[2>RF8N<+=VV0Y_6.KV@K1
A0fUMONMD(U3WW](62d4L=V#KVbd\NZY91EK43b6^g63/g>fW;SY&4_I0-O0(eDA
+]QSQP.,^00I(@5-d#<&FfbW&DTbCH0M?dAI@[d;PeTd3EEJ10WfWMc6:PK]R(b(
d7[<FL_@:U1DgD/19)=#bdM?U5G28VF^&U:0>3fXX@BEIYU-dEW/Q(51O77g\LTX
+^>#&E.+0-JbR0D;)_O+93a9G#^9#:Q)])R=YC0.MOW3Vf_F44Pa2/AZ,?f=\b+]
)(L.f;U-.6-UcUQHANZWH^b3CMHe4fJ89YfbD\/Z:73;YV.Lb.]9P2Yg]K:PP.2)
+aM#5YD-?Q1c;J807H:M@QAaR#;;HC?aOOcK(738Q;aEJI9-,5?UV11SMdBgfNRc
12^(L&6YP;I=T[&d^^8UMNQ8[fSV\g8XKU3g?[+7D.CQDdA]/fTd<a(4/8CA\e9C
R_<GUI-OFEVF0BSgfd_Hg5TF3AP=?#W^YD#Oc2ERb)LJ=?H/Me4G&>;22U3#=M<g
Ec+2e3IF\Sd@KaPJ^AQMG]>XPVF8#=:SLR&@6BQ/,@:9AQ2:a;N^^aN?YL-H--82
d2bR-K82P4#ZM14VOV,Q46>K_&AOTPQBG=4_M)dOcP@2^R7)5^RCY1:ACdTR>&a+
8K\:V#La;_ONK,/>FHQQIKIMSJWDb20=<4^:#QUR?JaZ=8395S-&FW_8E.AOGA45
Oa=]gAd@<9?bV>]36XOYN6O9AN0^Z<NHNB<5+gJgZI2eX\:GFX8:OZQD4a^.LP+-
ON:221e^ZG+H0R<;JD<=R?=SO)4P\WO+cPd3^6CJYCg2WRMF,7eP_0\NIUYC&;e(
VJ5a^^7D=+[E>QCfd0#6548Hd=/:Fd_EgO)XfKe_Ff-S2g5d4-4^.a]4W]JN9&BJ
9SUSFVOLXEELP9@D.S2L?R+QZIbR30)1P?W=dgB&BO82:6\U)JWYYWIg=GUeEV:S
5:#P<-Z&62R&R);4TbfYJL4@K2E=2TRca/>M=CWKQ7B;GDTOS^C[f\24CO428P@K
c(>b_(UeE9HT/YP4TEMbT(<a@F/2V?K\MS,6)/3R#[E8:=CPKO.FQ:cJ2PM2IQWE
N),K-=.P3)a0>dcH18+<P^=a#);3+f)D2AKNY3]]D8UA862T:30-RU&ESbYOCARW
_c@4#-&d)R:FW1>_fAC(a;\/g5D_D#4Fb;4T@P@^/BF:8.AGZQE,fZZG4#X<ef;?
Y&C=I8XA2b6-Vb)W9XA>:?X<.=/Q9.KH4eM)#3c\V]WX\],J8ZE,0O[71&17T=+b
,D@KFGXg=.7(^aH2A.aVH#EWcJHe4ZF^3)N:-cANXD66J@=P6W^#1feHF1Iac656
HA/+?_V.^?YN,S)#RSdU4?W@I,2Q&6_Y@=,Y&?=0-CJ8UDCY?Q]G50]e@,GJgNa:
N7W2GJ)/HcZB].)PJJb9?(]@cT^g3\LI(@5M=(4NLbL+5JEPf8YQb[F,#9<C=)EX
W.PS):2;[G+PW&D4&9EAG:T^&RPA2.PJ/[O0_]7J,XZ6>BG/28=b6Z/3SWeF(=Xc
dQYaY\[L,<IFA[RD[8P&H6\WY^?Ca+AHCf\eL8=B5=e5O(6<GNKG^^C,,(;,9MF+
^<:<-:bAZbbDa1X8ZJH2LLJ_827I:\PVDGEA2:1fPAac<#C]-/4-Y/YJV,]=P63+
&VU-ZWPR;E>85MV6WJX)A\NBKD7KWUS9)]NaLM#BBLXfJGVE<?\Bc9]F:7=0+O:P
3T5a6A;ZOG32-^3JIKY8eLN:(b^HB_45NGG@a1>2D[/XgMdB&O]fefQ/TQ>:U2\A
.3e;N1Nb&=UFJ2Z/#[W(+/O9g\<>9R&51IPM&)2[;&ICEJH).3NCVA7)-X62XcRb
C7,L7RTTT(1eA-P1KUgIe>fd4&=:#@3AHD=?8KCA;_f.g^OZ1P-W-0,)FK-4\KA0
Y)eQ:-L7XTDTXfN0a^a)DdV[Q;,fBX5IFY>O[1OQ+D5:_?IN]IWG5;Ae(c?dX?Z[
eT\d:)?K0_.(XIf@?(L-AW@9gd92BfO<cCD4\.6JV/P3:Cd8E^#L9;E[LF1O@e[S
,I_FBP=L9Y[D1<^=Hb/IVc43:S2_W?P5C\,ZTWO]0(:(JM0Q9Y/5C<3UXN]FI)U2
^O+fL:R+I60\MQ<C8P9I8F:Q^013e\6QK>71MdXcDE:/4/U:gI4&FOD;H+&AcRHC
fbV<U]YO^)4+gL.R58@a.W@d@g\@>IIVZI+7+=-NM3?QHa?#LRSdD6BcK+ZY#:3_
g51MI?)G)S7-N2Y)P0+.gaa/TK=F.Fc7-JJ5?CRIa.eJbO,c2;.NDT77RPg9FbA1
0#5Lb6#I,<;gUM2.8H5DOe9K^g69ZRCK?M#8&J,TY3A?6VTYH]TbV8[R;RAf/O\^
be5KK&#a^<Y0=G6;,PZT8<&eHHdMQ:8:gf8(.A];S+a4,5caaF_OCODR3fZ08H=,
OCU,/e0==]VZO[5=K]_(AJAX4]&K=/H4;POfY^+#@VY9@_#9,#Y=I&7XEb.E@F#E
G:Z57[3\+96fLI.^R8O-I\5GF9F3F5RMWUG>RdJN&NbH5YDd).1N;-eHA:<\OZ_<
\7e44[eJ[a87UW0J9Q9O^NJFS^L#3Z&.a9&Gge7g<>?MDO(4Z@DD;K_/e>82NWgb
BTe&Y@EVP1\ZKO&gA=0:(F/g#)A&Yd>g-E9R+B[UP.4L6_QdJM&gc?SOc&SOKL+J
KV/NPTGJ2ETKAHT[e3[U&Z8V]M(_[;?+eI=/3.MabR7]ZQeJ9/U\YaX_]W7a]A93
S/3H-&HcaB4U;e,.7O6ZG=,BL;2D#<_H:,f^1VFB05D2Q^G&S\eEQ:KO/fJ.fA?e
W.K.+.8^4C,d8X8-bJ08T[FNcAQWfM8+360.,]Ba_SG7OP^[P[X_&c.SXYZ.)1EU
:9UIEg]-;#XJLKT91::0dAT[HZ4XU;JQ\CTZ^+JQQB]&;OPW1IGBMAb;83,^]MOB
E]KR_7ab0#f2De#97WQa/V_9JW1&85^:Vd2PbGWI;FCE&UY2>+\KVLPFK_TX/AI:
gU?2.g\X+09J#3/8K1(4@)gJ=[T7PFJV/T?C9Q4N0XK9[QTW&gHTa]RgYYb?S)3K
ce>N<<X5cdL>G>Z@@B\^D;UXe()[5,JP>85/c6egF4#3fb@YfAe],03]:S[P?SD.
D1Ie[>cKaP=&LWgQDa+3MG\=OaWEY,1E;LPSRK#V^@AU:e<J==7J<C)7<._N[F&N
S8B50(/a>)C9ceU;S.(cD50E<Bf+B-:Gd^ae:)BL7MI6KbLR?HJ2,KdU@U3b5DI+
&V1ED:D_7GY[0gSX/5;E/U#W]fC=A1NSB<=R#fYEK.c?8]GMb=R9=\Fb10\[M?PX
IQg:#g7E\>Y.cU:@:?3-;+)VNdBJ:[b^S\TgX8GbAOOVTO&[HZ>cUA-baPf/#US1
2S=2ANc0K9@5=9I)00WR^OO1,aaXfLN1\Z<E6A:Y>/Y8NND/Y\TPVP@E.6/(2e-a
/YDSg8:IQ3<8:Ib2\OH[WANdD(X=>6<g:^V&/5\7X1RNY^1WGS4R&W<;[]Y.681c
&6:Q#,RecAR2;\AbR<3B)NGMH8CH?40fZ;DF^f\24]b<4Fe_U+XF=_1L]L[,d+1W
PA<4ec:;f#8W^2V2M:TVHBHfO3+Bd8FJ(]O(@YL4.?Z]Q^f44M]S.5HW4^[DN4UM
682)1e[@CF\L1H7E;+_cRd8F^;\DQ7VCUg#<Q7VQ_W(5EB^5d=UR6\6,E]8K#+]@
-=&(9B)S7+MY#ER;NDV?N3Y_4M)I+;>JJ+3IQF@GRH-[O-XZBTU.>^5H27UE;Te.
Ga[J2Oc4KO(3RE(Gg_gdfFKJ,^ZSO4HHHG<UdSR2<,\NT@A7UDDW_P1:036DK/]g
-+2GfR)M9]^P#LVS[MD.0R[LSP@[c9_6215]QSA40_bbR3,]ZRDJ)Q4]UU:^W#F>
1-66OC]EYB.FQ=/.VgP,3)L28:CcUWRLD@PCC:++:#KIUK3b,VR?A/b0[)cC[7d(
Db+-^9]RA:M464+YB-a[?[BX.f1RYYI[1W-f_Z_;>>_,72BI6eG+>?OLX>J_D?YN
dBE#;WcRf^A14;L3@^\3Z=MaZ;3Pbc]b)eg2#RaV42PO-DF5C.Y>L]a_F#VRB2+K
S8eC#Q0L=/^bbaRLe@c7bgDYJ4,NePP4^VWPCE]W5.;YLf+)I-@RFP,c;<PP<]5&
?&3\Oa&L[DaI^4eC,d-5L-N;)Ff87^X@Q=G)_D]Y]9(Z58g/g<4:?;Wb2^TML>-S
G;b59)FA]bY3Q>V;N;aNf>5+6f)Ie:<2W#VUCU:WBX-+7,g\]AC/FIQN7[S(Sc7V
3)49P4K7K(QR,6&YC.bL,@6NL4f@_]e#f.20&>/_Pc+e8fV#f0]aRFWSM.[3EOP.
#EK38cCVO)#bcT>ZP1F\]?a_5#P],97IY+:bACC)3dMJ3We])KUOaYD7F==(aDCQ
=SGPeX1F5cTJ8E:]&C;P93NM7+;I<,-8VT1B<JRS4D_f+\bOPU4P+<Gf.?574:H,
IXA/)8A5&c5M?AROCT7OY-TB-Q(T2g6(T;ZU2U_9,(2d(+45/YCV#NcU,A14\W:3
6WdVb-=_aBJ\4(28D>V>aN#X5BD>_b4@Y5=[\S)[_34\c3DNFfNaX0ITN;O:+=^4
-)2(/72ecKZ=GAXW)fWJK:[SHW1;GKN;8KVFFR.>(K<6<H+>\)/C4ZS3,FN_W;Qd
c;\PA5.I7J(?GSAVe>Nc&V\;4I3GgF7:(MX)/HURcP?,b38[EBcEJHV5M.9<_13D
#EBAT(JAPJB/@4,ST8J@894Cb2K-;gIU=fO;[MIY#.[5;X_<3=A_7KKDB2.3g\-c
7QG<XWJGGM]adZB60H_SGK1I[b^O[J5O0.Q(W<LCI;eS(F.VBHRg)9QV5W^_G8a_
]9D\SJ918@0\DBSA)_GH9J]0/Y<=T&;LP7a/6G&R-NEFAXZ#W.78IHH?Ha)dJA8S
&1PaVFf\N3V.Z_<>63M.<8B9\Td(Hac-A)6>K?,E053N=G2E2XF)^7>Nb)BEc6-:
02HJDI\XO_#N6W@>I89+5?/0[7O7Z6Ha^Fb#e^D]RD)WR:P2S6OX/,[D95;0Z,C2
cGE][\F#]APBV^)A1JSCEGB5C5ED#V5Y&U+NAS&[XF,-NB90>KG.TKVYL^&YF,&U
9CV4@C5LfVS?)3b5/H?5KP;:ZOd-3SbFE]<3Sbeb[O&K7fCCSd9IP4O[8VEOU8E2
0&(/aVcJ#KX45>(;CPJK<A#3YN]-@F\)KA((5H1\LQ&;@12/U05S&N-.L3W04UY2
<BId-1.aBgM#;1OWfJG[g9<#]+Y(BaWEFf-8=9c4@Y#1B^9M;[#.?6:JZ=Lc)fDK
P=8R2a\#35Xe:_ee3I?[WecX+CC,/<:+F7-P<VW^N9AV=4+D8gD7/U)3PO+<^;V(
.XfH0f/9::]2?R_b6@T/4Aa@=PJ\HKD2ZMHLB.SJ;=4G&aSdBd=/P#QHR;.<?Uc1
18A/\/QT2U\+>[@d+U,aCN][5O1Q(?^Na3GQT_2W\1XBS]AV6POE(O-&D_#\&[PQ
#F(5X11UR0Fe5V=[cT;Dfc/F+PWG?K8=1a0&-0K.,#5B4>@<2=UB8]7;+V^E2dG2
ERIN@<f#K^UELT9H:.N>+_2<2^Z9V)&UPVCLBN62PX-;RAb-#[_eEF/LY->\<d)0
9YEO]#gR^7<FH]6RbH=SG(VRT;U/C=S_DI.&b&a0g6PI1Q[?/GfcF?@cdA5/(,@K
A5V=TB6;a#SPQ4&4.]/95bIK9O=/05T06cB@:00NR9BG-<9XfH7@;JeMW0f]T]:-
S(,@gLG)\5QN\+_=].>5B5MGeV#Y5Sf#J.ceb:ZM+0I2@S88,-VBV,gT)He6&AZ#
#OTBf.cMS&eK(K]gHda>+NW+837<BUWKQFTHN&VU_ZK]N(]bFAd/fWXa1GD<31]8
G[ASLZ>+HI69,C9Z2cG(D2305YCB\8^QU[]1A..TeCH?-Q8.&MB:7d03SJ?O)X.0
HQNe\ba@XYGb;F&T8g.g&7)/gZ)BEbcL4TE^;(CCbZC5>Ng.eVUJC0b23#9&13DZ
?/#WGZ:&a2_RU3G>LD],>D3cId1O()1)(6>.88,f[IY^&aUV93S]9D<>HYSH2WQ9
XEA/95?UR(]BHGg^dI4T7ea7f>?>O6gbSJT#b]U_J740/bDVg;0BRX&0@]dg[KJ@
/.B@NP@IVg;#\E&14IXX5P?T))<D--7\(>S.&AVdE/g7Z0AEY43F_^1(=R5KHeDV
?NfKCG?N<3_,-cP-\GAgG])>-gGH6TB9+fJ8N\)fEL_0^>OKA,9c_#;;,&SH2_O7
>+<A\.^/e9.&,TW=1_.\f7VW;U.I6X+CbJ](=UHYOO\d6bcG@[=>Og_DT]<=\7E^
:<5^QPe2>NW/GWbKMXfKAgH&Zf/O3?V0V@ZH]7FLeOZgZYV1b6+=f#S.GJ?>Q-P-
,8<,a,-TS&MD(V]D_,#,C\JSM]>^gg\=gK(NGbYcHf^g[?PR?#/Vb#e@1QG3=Lf[
JD<[2aXLPOA;SM3eG7[4KX,U:<,d^4[B95)7d4NTS694b+LME<[E?V<,0QfDG<-9
2[)Xg61(WVR+0:OH@eXe?QYBV2[K>f-#>6:<F+Z^;ggOQHF1?89;A.d:#VLId9VC
5\Z>#T(D7Q\FC?C;(D-bO=XLLS7;_aKdKc1WOeae:;/N30^6,8d8HGOGCZDAX3Y\
><,_N6,DJ=QO(>U@7T?SaM:#G&/MBU_eD@&WSQZ,JX#fB2LOb#N,0&d2P9Q/M\8?
-0B(e=4[eM[8<D0Q\/L34^>_^;N7D#I<K+bWDO?QG+8:e9YV6:M/\-A0.5d3/Dg=
?@U8:<7CU0<L]NdF,Jc)1\1(1WB5#Td&7UXS.5KA[Y<0=dZ4(NQEMCW8O@)8&WC,
)#>.b.<[-Tf(K:V8PGBa)V,=2D;L^>2eg?CI;=a-0_+:^<A>+]?+2_MH3bZBP_>F
][5(OKCG?0eTSY/T<g7TE6]aTGc<9WW22[WY.3eL5NSJIcB@9aZ5\^Q)HVG=/RIV
]PaMI=Rd425>IE/RLW5I5S;O7Z0;_UMH89We=FPF9^;9DVKT9A/=<)NA.;/XIW+P
Nb9#P)f-d0P]e-<2].^B=FV@6A^0.X\b-ATGFE;]X:/>=#K@C6A19CL1a/J-Z\N9
b+e.]]E8[)SgfNVY-,8/X/O7N>17LWc=3,P^I2N<X[T^65BBZgM5Mfe:<W59=>=T
f;c&3;&)UMeF1?W?[N6>H^_OF])OLA)c-0Og:?2f7Xef:1TDQ?L-Wc6NaS>35d[7
cPOLVP;a+Fe=H+IFMY&29EcHD,4,UJI?aeSGFC+1I3aK:[3dU_;Z?(JL_I>LJQ1Q
##\0URY2@cX>PH;bdC-=E=0]Y7N&NJH06(@K5KAO4].@7-Z1F@=(U.DG^a[MS0XL
50aN.Z:TQ_.#E]6S=+aIRY?DgEJaV_>aa13,D=Wc^<G1VF[YEZ1ePPGE?GFL-Bf0
G^KS[ED0_8F&+YeJQ<Pf3#Q,53JQ,X1S./&;:E5B.cPEF0SIV4+RR74D5_N.,FJ8
9+8L31,>NA[^9FS?A5YBQ5JNc5FRNS2HDDL4,f4XUf\QU7bc+S6+/^3/X.S8N1&S
U&U)@_/)CDX@?8T<&08L4]cO]+FW8P8aS]4cG<2G<d281f3R0/</--;DLH;236?M
8EGg8TK[?GQ[R\\TOUbgaN#Ea9ZbF2)O9ZIf::#7#[@^6]22Df0_NI;1R8UDA/N5
E4IR2RXe,4POA\1,]B4++1b.T0ZSdPF6+?-62e3ARfTEU=+SOVZQL;ZE>c<0WVR1
&@D48:Y@SU1ZBCGSGWe,BdBgXXfd\7cS^bF6D5EA06B(1TK1fb>XbWQ7A^d_4[JD
2HMI\dHF\&a&RP[g]NQ)T63,.LNeZb9265A=NZS_Cf,ORbGZR>+/AK6eVD_7AVA;
Wf=G/36KCK[P)gVI1KK8T8.[\8RO8\e+J>TMIEIO)&K+0MOV]=(RQ[c4P4+=WMK-
:^Y@I^,Y/_6UW;B4:\b.O0f7VQ[;ZV7D@ICWgf>T-Wc;TEGfOb\d<e3f+WJPXN9+
M-<F.(Z#6dE5?C._cI<&1G;;7IYSMM7C=YT2#4Sc0(f.7ed8.V@L_L;fcJE?;?-G
]W[d/F?]Cd1C9O24NCbUI51Wde@CEJb]HRfg(MdO#,DK+cL[a>VPBcG3gP:,b<5b
9IaMD_^@U>@+OYKDG<BR_MYe0a1-#@L&4X;f-Y-dQ8d^a<&BQTYV@1<K=bN9=#L3
B](,2#a=LKWP8)WT-XeQ,Zf-B8Y;adORX^[dK+9dN/GF_#OTA-dRa7M,0/CS/YLT
G8R,OCZSZE6P4/+28(_]9]6Q6^c-Kd]UYV=fF0)H7WBQDPGLZ(c))fXH(QMD\5]<
(R>/&^GQNLFa[+R(NV(=HYJcfQ6.cZeAP83/H/I.4dNb]XB481@FYDY07],J)@@4
>dN_b[g(:-N-3YfEA>^.995#b=A6Q__@KM^2+UaYDI^c^4EI=[[g@6?B\g6X-1:U
?DYEPMFAKW+:8Y^NBfU-1Bf:[=aHLDacg00JK^)gDK9QcF\,\JCK5&0[aL\##LY)
(g_X0fQEBEPb25CF(/cXIg=3P#Q5,NB8@cVb)0CD&:@3UA-S\T7e#>28DI#[)7#(
3:3+gPPL0Y&?D7A:b2&5TGNgCB<J7N)3ZR+)3@_2PR[[5M]faW:SOgU6I.^8dJg_
HS9KDZ]8?(4Ja4;G:d31V#>94,_e?#;9/--OJBA-f:IX[,USGUS.#.N(Q2=LIKWC
NN[g8Fg-.P&SL;MXWgLR,2]1P>^Gf<;g)FH9?7I(H)3MWTOVTGMNJbZ-+KX[=TY&
??N7I+RSJ5c6<;#gILA0I/9[fb2+f?R/)?9[C24f\6TY:Z,bJcJ@M5>@Kd8+L6C5
G3H>d_WW9VLGa4=9Y;dJG+DJAf_^;G/&C3<ZfWKcZd:KLT7U[WG,CDRDVccL/68>
I>R;<XGD-T-_c5:>=;:(>H:Wa9?024UNKA1ge,f@-a.,/D<F&++1S+K&C^:^Q:cR
]-\SXc7IZNZ6N:FNU/QMXGO+XBT15AT-4DGe-0Tg4WBX2\V#3Md[>egKFRY,6>LR
^7+[#:YJ<a,G_?)&@0D]#[S8F52f6TQ<BB4Y/P>=1/eM8MZ8-Gg14SZ:WM;8E_AO
IfDM&:2\CfIPeK06J[?cZ<)P+#;TVHWMD-@/-8dYATFBAH@8&;(]0U)XN2\>W,V3
g9,c7U^I\,]:.8Y@&VY[]_&e995T6TBQFOL5Uf\;Mc&Z.MbGHfG]7?RZ8DeM?[(c
NYQ1J@AK5IcD#)&12I&)ZMRFdcA;_1=^S@O@E#A\aLf18H4c_=6M2a.<VafT2V9f
54?ESGMZ6L]S5^)B/AAO+PP(]_de9T-R.8LeX8bW<,P0PZDafCXVcKY0dF/59C6@
e)(QLU5(><]G)d4^9_1eL0ALLI_Qg6U45(]>g\fgO1D:9A\Z2YM<=GRM]CY25beL
Z3ZL_QNY3KCTMgG&L:0R;O4.dFX5#L_;-4S:G./B+\M[#GP6F;/^?L]IcMBA(DBe
/6K7@OGcgUX6F:/9VSXQJ=FUb1e&41314IY6N>PWL=Z@KYg0G@?<IZ]LRAY6D4,U
14OHQI36_LO(51J&<.L-0#(d]3W5MG@3AJec+;aA9,3D_DFa40C[-Hc6bE<X,Gef
1Q()9VJceVR\=J+R.CZ5Bac59N)DKSH/XYO.>Pc=c+M:(1dE\dZ&?HWOD-dFH?NX
AfE[O^]Eg)W=P]UIHN@GT8Z&HOA;c0C(gS5652/f0:a7f2,;R:0?)>5#0@a^IG?0
A@KO[TL7>L)NGBI_G7Pc=3G[V]R]6X66,Md>K26DV^bE&P22U>5d]6[(d9:(M>Fd
e6/^5G+O89]KaE57(AG]SgCW703eNA[+2=S\>Q]1(C/-9S9BG0,P&318HB+X2c(M
a6gPHa0T7S<E[Ef]>V6V84fFYC4ZKV473>SN.cIN+E>AIOM1#EM5-SR/D_72eUG[
SbV@7T0#)FI/;U((d#A+Ae\76R@gCH?)HeM)X[P6cUOL]A027])SXJ@Hg])O+LQ&
MI8\Y+RdGZ0#Qb7Z0<DVf)b(HII&,9^]=OH#;6-D+O7^ZA-Ff47PYX?bH/T?P-dO
6,]X_?<R4#Q;#eI<)bWcc/9+)N+\gUJURC:QCCNQQ^.5S,LQJgI0#OM(4,^ZTLHA
F5>XdJ=[70+GRcdeT;70HQKIBJDa7=\Xe;6&SA/:X(YO9TQO]aFDT-(NfXTF9C@Q
c0>)Of1_0LR?8B-SDKVQ?0GHU:&W7,I#P,=a6<cM>Zed+dA4QYaD/WBJGgg_Xa^1
VMF[/TW[Q0bZI#N=944&_^>QJ@E=d>TAFK?I=.HJ,EH-7QM5&ZWQ#4H3]RbObI=^
9a[]/8P^4a-2XNGMPE@6P/WDQ8)ZYC;RYdd]1PWU5(/5NKS:/JdLJH/bP3Qd_Ndc
+BDIG3H5F-J,NBcEdHUd)e02B(>;^_c[bNg0G0JDVKQ5MJI\\H@1DO]4HJWY@eGU
D>4V@Zg\0R]A.c]VOOB+#P+eQ=@\FJXQOLSW2\J]4IQ?5ZZ5H-01f8,NTfPUTOX;
4UF)?=6K&=,FY8@DbFHb25:NJH2?#aR<P4LUNAN5UQ^gdN+)d+2DS;>faNEPV:ge
QVOg.TDd0Y\=@MQOg2.?Y1\(2DN\=+eG1/eGaBa1C6.CKV[Z,VfO,:R6T/+LP\bX
/:XD^.A_Z_TRWYIbK17dV,g4+_OdKdZ?.(<E[F<2\3g0T\70&PNAa0_[T@g,.K2f
eL3U+F0\3/.[P60(L_VXAY81KXI+bB\R(>HS#LGNM_3>+.(g]:J0aTE[2:#F,8I[
6@HfWDJ]D^+W2,>;G=fc;W)/5,)I15C,f[97K]9EMW9[O#APOK[T^ORO(G8PFW3F
OF\?R1@_6[8&[.6f(ERdb><(C?FV937>\g++,@cQR4X.I=6Pg_8T3VZ<eSXK=C+5
0X.JfP</]WB2@RD=>Va+H1/OK0##GTW7&=WeW6:>/M0IK2Z<Z6e]QX305.-\MPM?
6c4a\E872;ZX+&AA[1K&O[<E26OF4fRb:B]U(&[/-WWF71>J8f[PF;\?(L2NIVDB
Z]O#?Wc]J0;JeGR7#ABPe7OH(;c_Lc\&04->V1.TTFKbZ=@T73C-Yad,S.#U;M_B
=Xc@=1U?\44\R8.07D8S/<D@-b&<N\@a^\^@KA^_I.=RP:41L,6+<5VU#Y1(^Fg2
PR\)?7V8/N,FbCAB_bJLEL,G;b@.6/VI.40HKNH2BCaJ@L^6([/R8BS]X48SZ=TS
SB/Qda4bTEPcd_O18eR<,=N69E.&+2Y-Vd62#IB73:7gF/1T07]ZCSG,KLL8)P=\
cCTUZ9e/RUIQ,JMcDB@_)LGd]f1[bdBHQKWE&efYRJgWBDP#LL7MZ]C2,b81]Q_a
7>Nca>aD)W<3VD>-c-YDS+aX:ICBX+]&UgQ)gL7/.6D-&^;Z.IV=B]UL)O,V1GBS
9G-.EUd-[1FHJ]K.:(LL0,DIdZ-g\#dCMC:[g/9Yg85DgY28e-53WcU4.D:<a,QM
AK/_+bV&)+E5\,]4[0LTf_(\86)CU5)(O/O27U&JU.cD7)JL1O?F3:;eKC^PQTDE
Cc=.+Q>]fF8_gD)ba&UL55U?Q1.RCd),W)&JD1_I9=gHE#+#g##.GcYJ,6@dJ_<c
NXg36,c9#dD+EFP,M&L)5aI1U^;:A6ISW.D45O]I[ddPZPf#I:,SN.]9?:U]H2Hc
,QZX=9:9V^BR6Y^^\CR]:T4#cg&Q6QaQ9;b8(1@I=b3f,,)_X(Kd&acSV;#I,:2F
FVX&LT[,L\bg1L9:24&+8f5-K,<&(]5>S;J\NM4/32-C8]=Q1]=D&Y;UL/6M.10X
)_H1C7Z4&><^VVA;b8YHY05eJ650Ga788-UTO-=8YT_R:>e>dP?P;-@c[ZA)3)@8
D9:2L>+)e>2DGJXU3QLF)XQB31DB:c,:<LdT)/\e7BY3J7DDXDN+4?L(3,^c/HMI
788TX9)^IQAUeAUX)]P.\W#dH=/f7;P3b9DLH=0#.<:Z\/U[QVM.F?VCBb;MM9K?
&[DML60-6;:BPdFEbBB9R\_3].4NbA1.5+&N#_T#+fVA(,MGIB(W7HJJ<b&EJ.gX
7KddW<^Y4=YKMfS:PZG_>0W10L.&ZXAgQ,CL185Q1Ib1MHSL)3N.(^WR8F5JZ[bJ
73YGN0UB/NBWf:O;F67=dG0#Pa=-+S6>]+Q0LK2AJBMBa+>DB.08<Z[ZX+:XCVS8
f//?:95,N[db:HK7=X92+E3b];O.V/]ef79V:=^YBeD1P3F_=ZOLE,G7cR,NTSB\
=eTL;fGa3/(M^,aRH)\A_/[@[89PMSa3XeU7_^GD--2O,b9(DY@<-DcR89V1GR^6
7>IbOZ<(T>TG3fgI/[<SR0>JU/50R>EH^<8;V6dE3HUIB7S,]@Jedg,R.9]<@GAB
#Z1W0@ZMHU>b6d8U&Wa/XXeP?a/M\K?FGD6B20c\#.Y6/7=#F-dD[A#C2ZEOfBXD
AKgWT=U5eV<>W(ADDRQEUUPbTE6\gU6DHJ1)8:/aOg;b7<S-g(B<Tg(8K[TPU5ZQ
g+NOX?ZN:&6KOO>-\(NQ5,AOTK?6-eY<c5ae+KO1X_c(+6)/Abe;#=\<?&C>,U7T
47<eO>EE(@--e8AOc_9NEEW=KRT]?^CF,RH<5Z/c<;FCO)C7Y6Rb/:7M_W-X1._-
fg#_-N\JQUX&=NFM+S:AH+9DAK:NV6?5ZK+L\dJ2TR(J93&IQ_J/gL#\R;d7SRd2
b\J/ZXY5AW4S=ge>g2D3,:^>(bf&0VFJQ59\ZF,1=f6=/9=X?c-P>=YR0<3.JKL\
=0ZO):[2W[.B&T[[Z^][f1cU0?[/CTPO?P2f0P<8gEg[.<d,KSTa+C]:dVA-]NP-
1((YX=e2cBNE5UG4a#B#.d2;3GWL1XTG^g/8(eKL)/RVYeV8TIcEJPCYMbO4[f/M
;bD5AIP5_NA5W2W;O1(Y]T2[7,3VRSV<WT]8A+YQ.?5aIA_+9I3f_2<LARR=B2\&
&&<[1g+J3^SN/R1XSPg2Y+_-&S[S&<G>Y62ac6?e0<GC2O,EAWGe6=S_:V+WdGNQ
PX,UY]gf8#<J(.^XD&0WJY]UQf3(KfV-,e/cR?YU\&C8U232CH5->H)YGNO1I.:[
cOCZ[OWTSgeeRTXFYVZ<8;2dUF9##H7QLH)[W,K#B8aEE262XR[I;MB,.V1/XO/E
>7>F4A;=RZ27PTTRK5_]&gINGCA;J+I9G^N8M]RWD>F-)CfX+[7+];+Za\bQ1^IV
5LU_P0Rbd68;2R#[7B4^#E_.f8/LI8gX267b,C+XLU/4TQJOF?KC9\Ua+EIJMcfS
g/GM&3Y:[X0e-RNC<6G)[FS]\74EUG\&1]]5eVHc\80Q_^P.EDAB6NKX^ccW+,E2
Q=3VS6c]Ee&;XCONGYQFgNM8DO,&Qa5dgGA@YH,R#YR#+OXAb:F[[.)/RV8CNR/[
eOEP<7FR^:)Sb+[WG&E8502UC:.J.c@16cUI33)YO5J<ZP^H1Wg5<gd>;D.d.LbP
S?&&@a>8O=YD6UG^,D1-X=J]0N865&EG)),3gXH[)gbYW#U.(:&2R9MSJX]@Pg1Z
+4B<eZfK]+T)8Q<)Y)NH^Ze[)W=^I7>#:P7dJ@[TgA@=]]NFCXJL/L;6QFU;VV6V
X=V8/7Bd^1V:J[,#Ba\dGJM^0F..(AV#0eHZR=X8VZgG_M^Y<XZ-@5-Wf3]UJ8M@
bbP_2(F9.S\R>#deA,N98>/^<G4GA06TF0;4N8F]gJ[aYf#A;Pdc[=G.SZ3b@?Hb
#@UaC<XPW,U77e=Rc>HECDOW;VRPf-d;U?UQd]/V;O/.01W=2+X-H=[H=BJLeOXX
5BH7V[<gS>1aK5gT)@8Q2cD]PNgFX]8_Dc0P>?.<R-7CZPGGI?a#Vf&FPN2W57+^
D^?.<N<Id8O0P=P.7cM(SI.EJT5]a_Q:&IaDZVOcgN,GVT[\FV1I=dOdBI_;c=2>
UT.dPV+Kg#.#IG1)cbc&M:B:57E[<3TG\NP.[>C?JJFXdWf5A89F#^>DM1WL]61#
a,0=3#^I=2+#Z(cKaeX1BbC+83]U6I_-95&LK)].eYceC+4F.02L>R8W_\4.EQ5V
OS.K^KWP3JcIWVKWgP25]DXFbVgJ>PX7[N@\L(HTZ#IU0@H+0WNfa69;<BO7fV8A
J/,G+T1@4:E<d=#f:.B=_I_9FDKEeL-<WK(IJf)+O3,1V[@YG9FK-Q\#PL2c:LPE
=MW^:/.b+c-O&)RY;1GE<VV^E<IF4)\D8C=O@S[2,U>,]U/JNJ]\),a\ZW9-.GQ1
UZV37)R#QHB;J8QGT+H(\WVV2H4U115E1@-EKOQ?KIKUD=fE^6E26&E.>JcTcS\W
_5Z(@2e_c]UQ+#[^2.8Y8SW9L)5R8bgJ^N#CT\]:S(Y4SWF2&J-CQLQ/C94(XXT&
C>agN5-#T^.C_G1YHN.-f;WTO&Q^BHP82.eB5_bLYaaX1C>[:49UB4=0ca)RK;)V
&ON,P-^TY,K@b+R7<B;Z]IY?\:P^XHAK5D@-e\\AIIHOE)=9.BPL4^6;6(^D\,XD
A86K.(=[K_R,4YPT50V:M0)KEBb(F4gb\CZUAeN+<a\g=EFT.e--7b7RWD:K=KJ3
SeFF[:X)3OD@EMD8/IAX4S>e&cF^TE--3Y\^cb)E)K-O<7?Tg[0D.5]#SS5f/>H>
-R3=-4I&PQ39A4BLe3:[dMYQ.ZdKAT:VQEA52M6/J92VHcJT<YFYS8A>0@I&<<6+
_QId>26K@EeQOP^[:gbED6gNEHKQ2V<YgVLDO=gL76R/>+gJ;O[B:YL:=dFJTP1W
Y-9dgG]I12QdQLW[7]2R4-]8X>.@J1WP>_B#PF>NJB]/Q22OcX_><(W(cI-]+aMR
JeW.=\+R=FM3;1OO5YK)[?gBN/+;KG<TQgT#@\T-V]F<(BX8P[+(b1cX3,bPCIg;
>?Qe/))fe57ON^c8NZLPBQ^5^e7+[Z-T6:0MEdR9>S:;J4^(e_JaNYLX,4PQKP44
I\aSK(=KJ=a5Ca+6>WZ4^80DX<@WVa/K3[W<KK0:RGB;-:-:&EUC#KA>SG_&;MF#
[f&Z@MZJ)HV=MeB)N_Z[aGTP9.4V4=>Ea(GT=9HNgI:>/-T2J.)0\:<g-U&c=;2N
P5[)\;,A,e9b-WZY8f3Q2+9_JSN@G_YV=f-aX:BUGH#)W77AWDC4VSP=CWg?HfFY
A@V)0E;))59D^L,LAT8HYeMK1Ec+D@YW#3+R-X5++3Ib6F=RUL^:V8cCU>S-9C&;
F7,G5aR,BST7.]6bF.N8agd:T0<ZI]e9gL6d>ZeQCKNR?(^/EK+?LAFL)U4bL+80
//KYD5[VeRT@GLc.4;-1&ZS2=&C<O.&;cP4I,8N9\G2aD@VC6M]QN8e5J1Ne3-@=
HU9ZAD8HL&_WTW/J<TPeY3+&T]U+=O8dY=d0TQP/H]Z[GRK/b:;b:Z63XX:P9\,[
2BbA?Q4ef6N,PU1D8+O_0#JI9>@V<C2\SV.Q#H61fGf>XH:@PaX:_,T29)JE[S+:
=M>-L(1ZO:cJ\VL7&8JS=6IcQ]@#10M/d80ACgO_V32fSCd5cH1T-cb2UeZVb,PQ
FDJ([++O?>aB;CCe63f391_^d.bY>X.=/dd1a9FHg?P[.,YM8]IQ8QaK6:3.9_JL
4@JN9+(KRWH6d=+JcB<Ma49R,::4Ae.9DACMdPKJD2cMgM:g6;9D>_?M2;FH0APb
][)^)(+L-THR-Y\aNb(XIJ=IaXYQ,MMMZ@XYO?f=2REP11N^EZD[U9A1FbE[H8O4
Z7R)D/If).T46Vf2U]QfDDA]a);IJPYY3+:6JEc2A,96QL.N4>J2FT,2_A,>OCQ:
K0;4,aX3QGX6HA^##5dJLbYcddY>QJZbT>c2H?ATI5e3YK6-I\DgM6+C:><,VC##
be1[#?.aJ/6284(E\B-9FD,,.-dVNcNQ&LGP92#bANT>/<XQ9\50DO1\-?c8LB4P
PQT#IMddBM9H&.ZIVP2G1GDf0.T<aIZ_ZPg@83HT+K;^HF8@/2[:04^JeWE5BL/P
W/@,;BL,(SfTAT-GU@7C6Ja\8]G?e^)9)KG-7IPIAPHBdae<[e(Haf-62]E0Bf=L
-c0+QKV=WYXE.Y6b@R<ZZf8&5caUe\FITR@3B7Y41:HU^<]b8>aaG#f>ILcL0T]2
W8dF^3e-5^VY0K;G-ACG/F;J&L[4XSWAX:L8BVdST7)UBBTP_1[d)E7BWU?6M0N/
d)1^0@KNT[2^YO:Z\/a?:4(0??cR&LNIa.N#fSO(FY1QdH-#DDXPM-]c<G_cW_9#
3_(188M?4^\I3T(9&>0G,0_J_JNT&2.FcC6E4[P?C9A4KB=7-^J(].K3(.(ZH0eN
CSZf,(fA5>F<Odf.DOg<PXL.G)#(eX2[cTa3-.7GS1]Md\EeY],28af?V/bRNfAa
D-=(OOe2]b?-53:+]L6J#(5=B\_@OVg7F#<a>;R8fM(@&Q0VS3a#(LQ4,=Sc+<Z\
1S/bX)R3619VT>T=([f.1VJLZLfJJ<+H+46-R)10)T^F@<a/H?fJ[[8C;.QW7W/8
/7#0^@OJCSe)(X=CI56eXe58C27)U44\eD@_6aFGb;Q@&S>dIHOIa7;VT>eE2A7N
8C<IU,KfK3LJ^]^8:F;TJDY0T7A_#^@<8[[T2d;+8MQdgD2\1>SKb(XIUNZ/5^g_
RDZZbK.[;dQ2XPHeU82J]EW4[ML6Z;0(JR\/3]WJN:a_5]F/D-CBYJB]?@,FbKOV
-9[/dMAGV&YXfe,gEQ]/9V;/QF12L:47fHbd.P@R)N=AGAaf2UP][J_A[)0E<K#;
M9_P<bVaVW^->YfK/EE6QG5\5B\ad@9ge[I7L)WAa(Xb)?>\Fbd-M4@g-N(UW=.J
1a0\<+PF:[?dc_&O&&Z2EFbC<+.^D.b7(3?E]?)].)A>F+=,0eaaRS.RQ:NAS,EG
&/W#]fINZ=UI1RWMW/HPXH^2RHQ>aaGK1TQ+0a21aK:G-b)S6V6NB6LZW#)&QPgU
KPaAdLXfAM(^,VGg8K[6&a-8G>_4\bcXL07+Ob@)00NL3WGX1FC^+K.BX[M#06YD
:[<=3NOXHC590.\gSG@IDa7BWV@P#19Y50B+;-QHdVbDW@7V/&(V8eMf;V)B[FKF
B9>E;1:7&9=:Q(2R6X3T)ZFUODdEJ@1=G-Beb([AP)KQB2WLTA,g4e/RUU84J?CB
C9Q&JUbIK8F8],=5PJWQ7bJH6-KQc[=BA6gKRD?3f@d0CbF2IbcYXH0Y+-@f&^EH
NKPH1J=@R/a:X/Nca5NV[aYdSd)dAQX98^CZSC1bPb#[L&:NN]T,g5BB)ZFN=gQ1
E,^JM<EfYfg-)]M6HTC6AD=@Z98WP8UY[Q1YOPG,IK)-3-=Q4_c-M8gCV720WNQB
FDgH.9-(,=dN=(8c0PE0QEL2)gO7L+3RE6((LY\.K+f4&:#BL<=-)G8X8:)FEX]#
/)(+K4[ISO5HTN,;OfT2Uge9,T.b]_R?ON/QH4IW@M/OPKQ])6BCgZLXNU-ULKLG
G^=:5&=,XSAK+:A;SXH3)-67=02f5bYS=<?(/=6&98NLN)6=S,3fLP)KF#Q<\_VE
Y5-E:WGaa+O1BD(+4d#5L656LMD583]ZR>dfO^Q_aI,/^#J6F5&C.6e\WC9=Kb_S
I6HV]4MVE0M#J=KN1Z-SO-]^RX<PIQ=b3+?X1D,O0#+;&a[2+WID5^ZN7:;#WM/:
.cf&Xd,cJ5]c5VJEU?+ISPHW54]eg,-G=GK:A9fB6gc2K\Gf+d>LJ^Q^7\WZMMEL
b\REO>&&:LC;+EAgKLU5];fVQ7=5&FaG(VDH769^XHCY<e3#KV#R)<ZN=?3,PE<#
[91KdA,8SE2<F8\Xb6M^;G:1BF>>+g:?FZeLBbRcZD6]<S1YT/E(JT2aD^3a>??<
EegfTDVS3QL;AWFc<baX4/Q#:XG/gN22Y#.TLP:K=C)0Nc_cM[18GEgA5ST/NFPZ
dg3,3-/@XQMZ64?5D_KY_FWbVTL7+.EQcg&+/e8I<P+=G@H@0WIKf^K<-eGd(b,2
5:UX>fT<).5,Zc:d:(\\_FAC##IC:J@L>aIfWHW.^e[]PEUYU,CVPA3/&Za^48b;
BRQO5@184H1&0+)UK-5+QV?F<;3,gEI-J[@2Yg7);\Ta;BQD,XL33;0P53HC251P
J)X5-Mg1G4f_Z26b2EY+C@TIT3@FTeYUL3Sb@A6,/?d9)/a@6/-OD4RLTFQ8?gQ1
DDK^NTe7I&1]@87d8&5>>=_/S)V);R8X4TM2[\>&EAX&9.LBF3UT<4b<4(]I8FY(
&3ZDcYH7HI?C]1>/EJ6:P1dG@MfdSb4@H.M<P3a93]\fDTCU+/;^\Wac8HM;<K^O
--S\V-g);BA9_52Y33V&417TTaD@;P>b=R7<@e9MJ]a)0F#5BW<Q5VLB@Y?4IRN-
F/2.PLcb)J]GP(@SDK5--gNG,,\BS=QcfYDaS947e:J/0c(X5S4B59LBN$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_JEDEC_TOP_REGISTER_SV

