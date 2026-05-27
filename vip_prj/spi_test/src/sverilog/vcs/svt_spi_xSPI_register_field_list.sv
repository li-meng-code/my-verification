
`ifndef GUARD_SVT_SPI_xSPI_REGISTER_FIELD_LIST_SV 
`define GUARD_SVT_SPI_xSPI_REGISTER_FIELD_LIST_SV
// =============================================================================
/**
 * This class specifies single register field of xSPI Register. <br/>
 * It encapsulates field name and its default value, supported field width, list of registers that contains this register field. <br/>
 * Member 'nonvolatile_reg_field' holds non volatile (if applicable) version <br/>
 * of this register field. <br/>
 *
 * Following register fields/variables are supported in generic registers: <br/>
 * <b> <font size="+2"> Field Name </font> <br/> </b>
 *  1. write_in_progress              : Device Busy/Read Status             <br/>
 *  2. write_enable_latch             : Device Write Enabled or not         <br/> 
 *  3. program_error                  : Device detected Program Error       <br/>
 *  4. erase_error                    : Device detected Erase Error         <br/>
 *  5. dummy_cycles                   : Sets Number of dummy clock cycles   <br/>
 *  6. quad_mode_enable               : Device QPI/Quad mode enables or not <br/>
 *  7. octal_mode_enable              : Device Octal mode enables or not    <br/>
 *  8. ddr_mode_select                : Device DDR mode enables or not      <br/>
 *  9. io_driver_strength             : Sets driver strength                <br/>
 */
class svt_spi_xSPI_register_field_list extends svt_configuration;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  
  /** This field specifies the register field name */
  string field_name = "";

  /** This field specifies the register field value */
  bit[`SVT_SPI_xSPI_MAX_REG_FIELD_WIDTH-1:0] field_value;
  
  /** This field specifies the width of the register field */
  int field_width = `SVT_SPI_xSPI_MAX_REG_FIELD_WIDTH;

  /** This field specifies the access type(Read Only, Read-Write) of the register field */
  svt_spi_types::xSPI_register_field_access_type_enum access_type = svt_spi_types::RD_WR;
  
  /** This field specifies the field type(Volatile, Non Volatile, OTP etc) of the register field */
  svt_spi_types::xSPI_register_field_type_enum field_type = svt_spi_types::VOLATILE;

  /** This object specifies the list registers, which contains the register field  */
  svt_spi_xSPI_reg_field_register_map register_map[];
  
  /** This object contains the non-volatile copy of register field  */
  svt_spi_xSPI_register_field_list nonvolatile_reg_field;
  
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
  `svt_vmm_data_new(svt_spi_xSPI_register_field_list)
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
  extern function new(string name = "svt_spi_xSPI_register_field_list");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_register_field_list)
    `svt_field_array_object(register_map, `SVT_ALL_ON|`SVT_NOPACK|`SVT_DEEP|`SVT_NOCOPY, `SVT_HOW_DEEP|`SVT_NOCOMPARE)
    `svt_field_object(nonvolatile_reg_field,`SVT_ALL_ON|`SVT_DEEP|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_UVM_NOPACK, `SVT_HOW_DEEP)
  `svt_data_member_end(svt_spi_xSPI_register_field_list)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_register_field_list.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

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
  `vmm_typename(svt_spi_xSPI_register_field_list)
  `vmm_class_factory(svt_spi_xSPI_register_field_list)
`endif

endclass

// =============================================================================

`protected
Q:)a9NZgCV(e-aM@eK\9-TTY.MXIJXJ\@_bU(QQQM\?6[6(?U-F?0)^8#/A-/A-W
Z5##E&Uc<)/Wf755_UO8VTI8S#@b=05_.P(EZR8YK@AVEeb>?NKA<0f+\EbOO3gE
eJZ6M]7W\]ETFU-5)6KXSdNY9=0U^0B@0baKD5d5^7fEO>9SY<C1>[M;P5(d?+c=
fG/eg/RXf=JGM]\PX^T4UVOM&2]Q#[2eK;XG8T?.IB0F:OU&W8@U@c.Y<Q:I:F<V
2(91eFbYM4K/;=]T8/C>1I@I^5,[TUGacZ4FE30T=48T_T9L(_Y>GT>>[W+83/A6
R0:V4O]W\S\Aa@\;C2/gAK:Y<5dZ^ad7KFWC^W=FP[&I3dQ\R7YMQ#6UAJ6&S0eP
_+IfJaL;PL.5(a5W?Yb.BW]Q<bgP#ZJ4.S\[FB21eFZ\06+]N0:0>-&Ye:)9c;H)
,=cf(ND_[B_4:CSCGBe&X)L)1FNC:_Yb>&#R+HQORJ/_BFI[?1Pc_fNGB(5GYA8>
\bS=28EKY15^^2P>g296/;KM>RFV&-63df]Bb+X]_1+c&9.R4,fAY(S^dRHeYHZd
AU-PgV#-+M,N-@P@0d0+]dbVFc6#@;.ef&RY4=?YZ<eF]FO8\Ia_:3[96gdaB6:4
WL>(Z02QOG27eOA5dL[OT_2KVG,(0#3XY6Kf-RBH.C?FD$
`endprotected

   
//vcs_vip_protect
`protected
8I+V+,6)NQ#a13aJT[T=fa[P6EMN=/<D;?D]#B[c:2)E4fX3AJ5R.(4-]&fZ?>#L
Tc9Y=Y53&Z,4ID\J9IWZ1I\GeI9b.[@&AA]@cAXYaLgc1</THQK^#D=&19S791M,
IVX>;<:J_/^WQS9c0O^9dBRCK0^U,TEf@U(Z<C(R5C/[Lg:E&c@2U?NN\M0+N?VZ
E]LeN/,Fe9\,>,\0F(I]QBG>B&EF-=AMV:FG4=/<>)6\L=?EAC8,^POX@P?]f\PI
a&L9]TR6d,=TD]A@)VNM>@Z9^B]W2Z1EYZeL(6g4\[CXTNKGYC<D4@(a83H@[IJZ
B1?-]E[fG_EZB?A2U#BWOYFKN+G=&d^HD<H?P\?+613/gc][gGA=fc5f=Q(.^L>U
fKHe+:fQd4K0ZZJ-F>^gRW@Yc#)(LEL2\PL_-[d;=]Q.)EZRFLOBE].A>OGHgD9@
Q<TKSZAg=6#@FRWG-dNGZ/87(_1E<Sg&2KD2.PA]<:WX:AB5b2]HC8E):c>M9,);
B2VY<d;g2Gb.gBEc0R9BLU78[^J?9;OEVC2>;:R>aHQ3BI+-bR&baUTFMf.NZ5.\
eZ2/e1fH33S_F>EF9]fD6YQ\SB/-N?)>@EC960JQZ\^]aO\bc-7O)-WB\LKdINO,
->)?HOJSWaQ3^)2@J3gb?/Z3[>>UA([^cdJ,;#HLM]fc2S=V(MUb0FO.D1K5&)GS
<;BPf5_W8-b43=&:f81,L:W_HM9PY:;==acUC#L\:EY)L>.OY(J.CTKTgg)0.=M:
G&e+c>3JBY[f&NAK;;#H(9DagAMd@a@EU0O.6+g5;&#[f@A^W7a74PEN(\TLUF=?
faScSH9:I(aeK]ZCb[+4P<[1^[5&eV^=OP@gHb8Z._]JVN:;:M3PHV>991;BBP?=
Q26gD,?MU^JHG8f6U9GIH@NR0de<bcR])ddbcC@?6e4<KK>]XCL=g>,;GEO@^)KL
=8^a@39-DHPG8B6W(/WQc:0U5=@?Xa9Rb3a=X/7IQQBHBdNf[P#9#-BIce+J<b2O
2<OdYA\)W&ITPfONP,aDC0P10f_BM5T+ZWAB4T@1RCD^/?+)D^:KS/94OKAdC.b0
@T=.Pg97^@d&WJa+ZQ,G9McH5c4@Maa/4P8T2#<,Fg7DZOR.DNU5__Tg@ANFK<DV
EIS_D?dY\QFW11X&^I.51O(cFOWgOY09Ya)(2CE,cFEW,L_YZWIfK;NI.,Sa?2eb
+N(?#92W,<-;?]6ee>^N<F0_UF&f?,.g@9])W0I<7AG\4dEQaO-0\[eNN:GMR72Y
+S=2^>.JP[d#/HL-;[)NXNYf3dIXYSAHN>F6NcIaSffED_ORa218DLZ&[&LD2H:&
UDe46/9-:.<8/WeM5Gg[EQ,T),2CTE_gK\QRB^,I+;)PU(&?H&8;U0#V?RYNU5P>
\3B#N@27>;#dR=8:USGK)WK:?]8ZA_T6GIBCHWY70E:NR@RPJ0A-#.AZ.F7-,@8;
eWT,M<1aF>CIe,O-.I=?,C;C7F1>:f0MBSVDW.16LI-XGOVAY:]ICY[-+&2ZaPRN
8279]N5O-[7^OPO]O&JUFJ6AQ\?b?TB^CPW)Qdc\:B;([Q2TF<d[a0X31d39E1/2
Y9L,6:)TG:gLJ8U.BAH-:=#SH.AO75PZ7@<e#AJ0Q5-M2D#<RYA?=W64)+,gZb-0
1&TB<VH=Y8BN^@GJ5C_E)@a6R,2M4OC=)CBN-@:(.CC4Mb2XLY8XRYIOIc<S_EBZ
USTaU0_:g07<^3UTG)12V[6[2LDYN1ACJCEIgfLE30aZ3TE0?KFFfZE<(YBV&JM&
]g=\1Y(D31@Ffg,.J.aTXLP&]Ed_6^+\99>T?R2CH(a4e,d;K.-,.2\,cV\C_CLV
<S)JQOJ>56F=9BU5Cc^cAX)+3R@\3XSM[g6T^:E0_\)HGZ(#1CZ=K@>OWTRJLGP5
cIU?PCbC.g-FHQGa/c;L+S[7]H)\UE[/#(]3]:2/W5XQ><@eYc:S+Y32QG)fAI.0
N]YDLL0Y<1-J+C_WQ/^;4/X[CG>V1bF^1#ea1_#EP,;(DKJQLN6?,b12fK58F^4X
Y<H=]7Y(G)#1RQCg=OHXBZY]=0X:GHCV;X\O2cbAG7C9+Q&9cT732f?WBED_T]4g
<K5NRG+=/a[5bX_D5RYUH#N@B<G=B]]P+S)U[/0Q>K:J6f\a(]F&LXd+OK+JPZTD
O00;EN=4RWP:e3BbW)EcJE,6JQ@VWC.FI4LY]b@__XOY\YfO<DI[7\32RC4Yc5I>
UO6)G:e.2A0OQB&CdPL7Q_-2T7-d[5Y-#P_G2SbPf_48O/3T_=KbB70H+,[,K(>^
,W3@:EXTVAGPS:WQRZ(VVH(d<bEB),#8Lc)MZ6\CfBY5CB?;b=.be>FH8;<M,@]G
M(#Ka;eQ0H)W,J@fbPKMf[^[#[GeA^Q>C3O37G,gKO:LB\GZ,-CeBX3UITgGS2/X
Z@)342^:GFa.2LFHcE_gGR,?T5;N4<If(a_NAQH(d,;[T2T+E@/8J653G[M=R>VK
PWP>;NI4Q>P9/R,ZfH>G:b5(,4cW1bX]YNK_-=JZae+[C^;65WWYPUI@YKS4H)?V
;V7S8Yb.ba[+4&OS;Zd1fJU08^\N2g]gb[)SGgSdQB?VR@+KFF,=F450;_.B\(8a
?UdaZgeW33URA68O@)M[?J2afYRU7a6VMGTP[7;3E3\NOXgZ&;II4^?[Q,Kc/QE+
>e\bL@--C_#QPc]=d7W-P5U.FED#/^:E=Z34S7ebKF#bYL&?B</6LH0#_R[3NWcD
eUb^(,,BBK22AI?Z6WU,H+SeF)QW5/deSJCX2D,/aYZXGg\#&d0Aa0&>D5Vc5P<Q
K^N1a)Od8KV(d<g0UH&]H2@:1&24ddT&ZKWNFAYH&3c)L)PX]TO\1,=6M1S2R69O
7+U6)5FJ51W1GZ3KN12+bG]N8;5X0BLc3356/)[S8:8&P4QL,7IM:_]^YPe=OK,.
W30G(2T5_gV62:4g40:W^JA[U;5ECVP3b&S)b-?8a,JGW=)P3N7L/545X1H/FHgF
7g+[bA.=\1Af-I5=Q@WI3Q[X&9^#SA,dbFE;QccZ+;7R:ZdbWUA)?Of=g4H&S40Y
cQ301Pc0NGKK_ZG1W2f_2Q:AZY5?WNN<23]?=@01gLb,_^6]Be_@8(/6Zg>XD:]5
HC(YeIUT7?:<\<7(T(V4__#7=)=<F#(^OfP:B-U5O5Eg)T5G1O+P.X8&VD3921/R
]JM=VE#N189a#<TUH6YSAL^4#OZ+0;;f+5<K[OEf,UV^2P:J]f:d;,\DbX4fN(4,
BUIT\_+03)@0+XV2-]&YTCYWAKL#O52&PHE03e_;SdO^6HSU7Bb_Ug5M<Q]F3^de
bJg4@+cT@6c4g42TdQD5F#CJ@0A)KD,+4a3A-HR7GI)/E2M7F.?@J.&3&B:[39>J
V&V.5<<.ONcT7=7_G6DAZ5IGC-C2?K#CC_0KU=LJ3:W06GHE?KBJ1U73KLAB#C;B
a+BN8L#BKT@Y>(,8^6=_V?B1@Z+LICI=\<&KMHb[b(<9DaW(c-;F8PI81IHO&2TL
a@:a0PQ>K]/6Me05,9.00=O7SfG^=<OJ_EQ19,UT6-I2N4@3eJ5^X(H3>CCI&daI
g5F9T8PMeZa7POe1[O,B:e(?V]VHf.,df;4O_Vf;)D86H;L-9RU/.D?D.I1Je)<)
@3g&Z79_0+-+-MaHJR\M>U5E8F61SN4KWa,fM]V;]SV2BbXH(eeT4/.P7b+&5^D+
=c\L[d0H37@)3Rdc6?]0EbM9,3e(Hf(+7&M]d^0ObOf</gZ_ETI70@#+VB@>@SZ3
>2J<XSFRdf#de/8d)?JC+QV47K5[MP6TCRM)79B+[9CWNN5TUfWIHSFRd.Jdd\3[
WFU;dRZ(9X,(S/\\5VQd#WS[:RUKdEaY_Hd4SP-BF6d)<cb3d5X4]eAZ\&QI?b?1
,1X/QR(AJAa(<Dda:/bE3/UKQVgQV?b@;)gA=)Bb#8EYR2JY6<eK9(X5\0F2.[[7
5Y.F<;7I2+0G&9\AW5cS.@(@3Y1gfeEOIbLMOLRTIBc42Z=Sf]:N(cH5ZeHAV8=0
XPH\4DOX._Z19cMfQTIB)TKNP^c]VI.JZKAaH.aDV1-2&;dWb[cL8B06d@+R(,@]
6[W(QT688>b4ZDfFRDWU3YNR1SeYI3@E;ABBXeV[(E[>>f),GcI.=H=YO=M50\I]
=#M6O<_><RgA90gLFM+3b4_a@9QC)ZBS^4D2SJD.(a)C8E;6LJZO.33/3fbL8FR,
\5K.&Rc,.O(A+dZS,fO9091GSY(Z/WNYH8<?ScI17e0@\V\27c7S)ZePMbeY(L.@
\-/[UKQ(0C<WF2gD=ES+K#S_]COa0>c;ZdWHD-HSR:39bB[-<N;Zd_PYf++fPg2\
F:1L2WR1.5aQH+R#U2fg#;TN^C>bg/=UVHWO&ABMKY17>eI7eKRAN,)QIYH#6X(0
7^JSV8O@HM6R<]90cS7#bA93cT,UK14G7EIc?BY\JFR&CFD\?],U&/eg<Q^g#G&X
;aDQ5SA#TE9fJPL?&I@.5/2Eg4&0&8],aa]gHc[b1eKRa])&-<#EAY>\YUGbBec)
\:<VT;1?eE3DP@2Ye5/VW;??^K8gHF#E6SXS6X6/7)dTbKFcbVe][.e:IH89c)=Z
WOJ:)W2/C/?U<=De5LTV=C3.M(_5/KX.P0<FG5ZgQ.2)Od7N3>\&(G.M=8V[Gc9I
.A9;4]O_?M/.de3(IMT+&39I2_R>#V09c?XQ\K3?PMR[=VU+[T\IcVL+3dQ[XK#B
<TQCdTRg@YaTc)74/&2[]CLZM&Pf7I,1>3Z,]L+]CO<6GTKCP-79&c9N\5AAX\Q<
B+AggLSa:[5BYf6TeMJcG^L[UMZU;3=g56+6)(MJZd1R^<)4B1)cf5P;8YOKV))&
e6dg<)b5^/eb=Y:0L6>e3.g&)NXeZBXg.F6)Y6#Q>76ON5b,adC_02]b+;V)ZNH<
(I8)^0H^]5+;>6cJa[/QO#89e8]T/H&ac;GcT=#V_DD=W]Y1EAS(JQb/TNZT9XEX
ggEa[US6<HcS[GP)I2X^\b:+():aFRX)=0YdV,8,+K\M;OXCb&LbUe3RRV_aa:3Y
^3YY#K)USM<G8Nb?6f+.cXBC>72880;g=?AQPfM-\L52&7UI_F2<I],d^W3?6fbI
.S@2WP.ELKF#W,8dBVc=08-8V]FWWWL]5SIe,-]@4^MgO+:CQ=;af(Za445dWgE_
\,b)QK\gFFLQX7eF_)BPPe9f?P.>E8RDNWKL,RfD\/UMF4116Ne3QV9&BXf.JZP^
d[\_E2gVC4_L5@1Q2B71,dc#(?Z<&&R?GU/8=62-1>c)V?2AOI83/H?N8R6GL&C^
LEG2g;E_B<T,Sa_YG6-K#d&?7T^T?UP81?0=.f^UVIKf0O+Fe>3)&ObPc:>ZU9XU
KN]=]V8eJ16Xa_U97>M/.QFf&g&d>+.2UFf.=N=)@-V,/b@?CJaZ,:Q9</V<\2dd
g2Y2YP<dg1aJ\D^>;IG6EH?+8_^-Q88&B.(ZX-T1Qc>?d82,DGKOBMR5IEZYP-A2
7AYJHT[D8W:;)a-V2R+Re<I2A<MU^d.A46Qaa^,Q235:Ee77)]E)A4YYLXDN4DXA
UY],R^>20KBJG/8)65/RM(OD[e)DY#Mf)DM?9S9C2?7?fPX)N2_@J>a,^1O;UNE@
UA/.QGbD6-#Z(LH?R=HWQR3L?JG[<48Qg,dHd)=#W#eQ>C/^>(aCQ:.9(R95Jd(+
+e=#D&a+[c.WI(6;34,FTKZCOJZ1aF6D9&7+;-7\K0cAb0(GI,5-?X:7>5^Ed5U1
J7ABFT8U.C-S=+DGfSeGGN+LcK4AAUEI#^\BCNP.C.<DPPeHO/1TF4@?Ke1O8eD)
=3(?Q.B2&#c8#@8;^[(Xe4+]&UP#fUPS[[TK?@-QU0O\cTJB8G41OY8ZKKf^@5gC
?-0gU)O(g@.\&8YId5D_eQT>)F?EXPMB,fLB)=0M8I.+e0,K-M,0USf^.K)1W6e2
\>8U8U9>=YKL<I(NFDX[8@K>P^>[SZJEeGLcQ]B1&&SN:T1-R>U2IJYZb<^Yf_ZV
]]PLJ&QTISQ<</-LPPY^,=LKb9---IZ?^OK3_/>0-RBNN]IV74T86O?B&Q6Zb#8M
Y3\4UL._0?aGI)D\[O]TBT6.&=\[,#=NHNEIaC@95^Jeb&^>3<M_[NSY?URU/+H=
4<Y;04D2dEYH-/^Z&&d2?,:F/8,Sc(Z+8^?adE0VGZ.Z38LQF/VQ41F\eOWLEB=@
:_HDY3cb3+Fd]c7WX\VVRQe<0XZF&]CdL6^L1M2Xbe.EP3O<DX#(0>)Q#d5)Z@a1
dcU1Kb,MVbfWTJ+DROg)<Y[DYdOQ5RUU+]@7G7&4&g)U+,1E\&2]^DF=R?I?<8Ig
0HcC6]>/eC&e@@UcRY(X[W58+3L6A,f1PJH^Y-bU3<\CVJ?)3:O1dTSOF2865/LK
5F6U/<B[0^F-,40\LaA8>9FTTea3b35<Q_VUBLXCTF=,EKH=HK)2YJ/JdO)[[7a[
#gLeWE\J8f2VO>/<::c?D(Q^@^X(b?T:^fP&8K+OgWZK?bTg-U5^U[VC7#PY8((@
2B+#AYRHeJcQ\UdCX5.Y\U5<d/4+KH3&-Lb-C.7d_)-+Ab3LU)_5gNS>&c/1?/A3
dEJ)^a>2?#0DC#R5305Z+<:98S/-O6^<eQ/ZAO\DENP@RK3@._JK5Xfg5Kf]ZDNg
#XS3T_A+L@N<<:KbG_9H)STZLY#d4=S08^+bAZDUO8U&4RE>X]GVZ>9.@UIW8Y/C
C7Fd[/bfJcC0bGV9P//;\b8gN4Q][J9I;W^WO3FF),I\/Ra=03UUN8?Z+5@:B/4g
\>@1GJ6Mf5:VNbW]PKF#5Q+W3G#RHGdC[R.5L/e//<]DeVA&DW66=[/_/ZJ&+aFa
&<XM+0K;I\JR\L]gKOB(0Y8TY9LSeCg90;<\b-AL4fLDcc(&B4A?Z<&Zg=U21#7E
8LK@Z<&2]?SOEH.9S(^cW)<W(A=b)+P;f;;96/M+cb0XI;>97YA(-V/;cL]b@:ZW
@HBK]PH,0E<K.FO6=^^T2FcK][#2WLIAc2ET0.YVZI#@V+4D&:\]90&-Dc.CZ6Q.
;c,3M2EM08959TZJ=9?78_+RWVP2DZ:fP.V)#,<^^LK??C:8,;D6/((^A^S/=NaO
2\7^.C9/HL.AFbU)AEGD?O8eVEDUN4gW5bbC\-+G(f_&-BHFD81AN#IRE-D268CK
9EB#H5+\\)aJaS&e.W#<4.M5ge4BGH0F7ZEFO31VgQ>H<4bAN,3JZ2T)3TG\6:O6
L(YJLcK6=(I#f,>I.?PLZ)gC0)7A1eKde+-f+(=V+P;;WCPg][KReJ)D0;E2+M2@
f1O3FFX4UF-X.EQ/69DV4gDb]0;.bcTMdgNCUU8CK?1c(d2:7^.R_?de9(W+OS-1
D4FS4Q,=-U>bggBVMAQeOO+7bLcW0[bV^Ig@HMc1PXK<+P3Bce6+4MUPXc+)UU_Z
10YVS&e,gbL6Vggg,#XSH4@Z,0PFR=DROGOeF[@X,KPRUO#\^\@b;O5]KeMET[(c
AHL&FHI9S4[(B/E(4Kd:e?Ze9<GT)EMKW0a+B?FJGWK<\aMeA;[9MM6S:ad,MJ:#
:3b=LfRE@RVH0N@UL>O:b]Sb7@cTYVDFL,LB<?,TSYA@VbW=/XMOX;EW&YKDB-U5
&GccD)QI8Zg(.@]Eg^ST6ZE,\4YWV3+X,ZT9+cRMYZGSK1+37>1&/g@Ic;^EfZ_E
??\>6T-]QW26?B,?\6]^N?/eBBJ2-:+/FWbZO3W\H#7>V[RB-9L,F_-0?cD4\14c
G^1IbA#;(UT2[aO+Y>Af^6]=-OV]Y.F->ACC/&cd=IbJ#23@7aX])DA[E(<E=MSW
05cKg<f0CBEX9ZX[U3eF1L2.]&fFX8A/^W.]N]RIQ&(9d@dg(ObCf-QaL[fJ9.2J
X2-AA3.RgZ:eAN&?T.N@HG<B2b+QaTCa1?eIJH6.9WQIcHdJ.Z_/PYa1eR8WLf+&
)EU1Q0&V2+/O2aa::XYFO?N07^2D13#6OS;)3=YI^II8Wba@E/gPE+/4\N_-#Je]
V[2gD::(O.#.VGeS^E\)/:&(83NOd<[MfI7H8f1d>1/R1fe=.D;a+HA8T9\#]<3)
.OOBGCagX&?^bLMO:F,XU=+bO)3L_aSI#=cJR?D1]7#1[0f/2W7+FC09EVES+O:)
3H(YW(213IRGdZP+7Z[GP2fA^=_2X[C(EFN)KJ\8K[[Q2LF<&6-][G1_W09D-SM8
:H_E?[)V)7<+MTT3<?P6+I#ZAc@TYBcI<RFaLW;g,aI\5P68HcSTXJ?PO->-(<(b
4,MZ<2[L@/VM_S^Jf@HY_e&03ZE[EH&\]DS]Q\H+.IK_a8,;=\:J9(#7,D_J2+0\
4^f@8:AS=:9:Q0,;N\B&J4=PGQG>37cIO-;5HV(3eFU(3AV+((KgX#Pa:NCY2Y/.
eLYO8SOI?9#K7f+gdfG,9NIK_6A>4E0MP==0\F&J:e7&KefMcA&/0^_P<EI16AMd
W#0.BeD/c[XDa#^PMbGM\X@0+;?-+60W1Q?.40dD[JD7QSP&HZ88HD+a)PA:J5dG
AF.HNLIGO&+:[#ILZKaM#SPYG87Ze7dZ#&6-I,M:EC1UYO?)0.]MfFf-=[4<ba);
b^fSRcUdRXaX0UI@a/:Q7JL;K48=eM#6R:90U6L/\g]#X>(_O612_PFEROMFg5ZI
QS(EJ+[DF)?#V?>F6N_=fEG1/YcPCLgLRK_H>2Z2J()]6J#H^7Fa#bBVU)\Z3SH2
0:/6[#5XTOAYJ521NS/K5:A:fEc:U4TgYLI5P^,e^ZO=7+#L^6SUWR.eAS@_&?PO
]#Z[;8,1;JIE9#WTZ4.dcH1A:I9]e&]KE^-QMDYYfgX,3K_c7WW/J^YY@b_0M@PO
IF9G;GBa_-X-@]_QdIDQ[1.4)-g;WTGZd^^ENSfW^)=e?59TZ[(NaVgCXc<4^Q3?
@<;3.2J9/8\bJ/HP)9AP\M00cV/&bI4@H].G.X-[BZ.Y4BKb2EWDICO7abPE,YQ5
\fbQf^1/<PYZ;]Q<+,&<6148#dHaPWS5<c[b.\EK^8EB@b#)E;PZOaNUK8Af8[89
&+0:23C?BT<Gc\02(0T<<LU_2_-@5b2&>Q/J8c<T2C@WM(UDY9=dL=?Sc.GR\OV;
QVNeWJK)fAf6C_PBXMAWGJ-FS&R@1S6af7TVO)YJNbU85RYKK.Pe-Dg6JVRHUGME
X3[UdI4O6?K/ZYC\:9Eg2OE3Q<L]XA\K(P3&PC-2&X+_XG529?)\dANO+.dM^1Z(
F<7-Z5bVU#KY:&:__@eQJ00Ag),#YMV:6#8J+VT8UZU=,Dg#&J^/CN]DT7;Md6Y]
9R4:+gd7eN@K&7S=2NKA,XW2A5[TPIb\L-6E>Lc&=HO;acSFOF[C264=FVCE^U]T
EH4DTc?4=e(JOLT2c0&E><@W-7a8\X&Q)<f02D2)S>)aXbX2AKAGB4VJcU,e<5-C
f&BU_d/>>243,QH[VC39YT2G7/E8gg:3cTJ_:^7\He6K]_bAI[C\TX04bRH#U@HD
QTS5F.9[VYC&+ER:4.ac7K-\VMY+)2OTSRDSP-<dL]MCNI1E0N5KS)<bB9f/Y4+2
^,0&D)_KH-;;82;PF+@D^2W1J^PT:C37DSJcDM_3((..U&>dKgEK(g53aU3(NGeV
TCb[Y)FBa(.g-W\N7_A6F<gIZ>Jd)8W]V5TXJ_<247@d@W\/-]U&3UB?+57?KC;5
F:aBDV_#:]R&_7IG3]H(GFAO&I2O:KS5;^OHV-B#@]>b2GT.&B[LR_4NMW&E-95a
VJDDZNPI)TfX6d)>>Fa-K-dIG(YbZ>Q4(,X,fYFf4@;.8G((O.;Dcd;=C8?)c_NN
2&SS1Q7-Of+8Y-UZ^/#aC5(\Y=2/:[@(9-KD5.^(Id(#6.0[bRJ@aE;Me4#RAD^M
18R&Z:0L.La/S\N++QA_d/3,UOgV])K]^;ZE@a-d?@R6;N^_=4Lb+:9ZY)/]R9\^
XRD+AF6+OKB<A.);VK/+.8V<]g:T6gN&;BMP5#6;KFd)2_&6>bI8JELZVd/,W1ZO
7IVFg,LGFQ:e,VQ.,&-/2XD5a#7^#\bEM:_C0N1NTLGORc6&M[29<dg>=_OV7(DC
faOMTCCQ[9&SC13#WBUH&)0UH-4;g,Hg,@?V1gc\<M]XK<e-,:E&:HD]@J?IB9(Z
@4O[;ZIa9#&L[:5#5V257<eQG0e.=@RAS4G^-=ZD#V?)/)g6]:6?SW^G7SeI#Q^_
;Z..OK-?CD:a+Xfc,I>/#&>)8Sagd8PAgO,C51W+-<VbV1H@516NTcX[8/W8,\5S
cZKX/E]KW.O7X3KGR\Y2_FDR(UT8GR;9(cd;/d:EJ\TNO\5A2S#E?0<6f4IL\M6G
a-#9AW_[,M3VfA3X;WdLDMe]\(]f#S,I:)&eQeTR]3T;B:SJG,+4J_8S,;#LK]HC
\,TSa8;a_NTWM@2=ZdH2B4;\G_8+DCc59[67E+3+#c6[<]M,D-+eMN5SO3WUI76&
M1,&d1]b8ZOL2GRAJfAX&/Y.gP;N;Y[?].eZMGFWX+GK3Q>O70f,(=)ACN<JCDBQ
A(R+:<2MgYYcgbAbJ0A]/C3f[0F-710aLfD^WJQY7(ZR/NefGD;J_UKB@OMVM^Pa
F7VH[V8^/9@,U02eN:B,Oe[X4U)Z/.AJK-TBV,IE4M#PBa[Y0CQZ1RD>GHWfPfWM
J_V-^0/_R00fd-S6,\Y4FU36/S\#Yf@I:b=QN8aBa9CWRWCR995ff8>^E0Ge<L>a
:f^7LeLINN2JC9AK1@8@^-_<7L?RK<?E@D54.HAT&[<HA#BKBG05R\d^E5Q)9Q3U
M?-fZ.6OMN(_QDD-bB]1VV&;g:gUHQZ?]A(ECRTAPJM_e2RWH?+e9JG#Bd7gRXb8
4,XaU+81@=QXJ26@^R[O;aW]M8:EF<DSbL2?\)KL@?f<(/1Q_H6E5+02\WU0bKVW
X,OI>1IYd)a(RYAVZ(4&CbXJI_(HIZ_(TCO_S[-J@fHTI(@PW?b5[;8c#c.0(Zb7
\0W:5&7O3/dS>G=c+e-;e>W3f78eWG>-50@/@\[F?SQ<>^SFC+VIN)0g5P9VOe_;
[;81:.f6)+>,^@..J\/adDI,Cbe:YT6]A[eEgT0;fSG5^QXPH/C@ZXW]N7Ob.Y/f
:LDWa1f9-=fKQSMO_Td<XU-[Pb)1\_NIFOW0[])X?Wec9^WfZW;.F>2MHJ(V#7Z@
(aBccD,Y<T?65)g9aD,C2WJG.0JWc90-8VgcaC=3^d:<<B22e:Eb])b87?a-8edB
:<NVVBY\4]L1GKRVg#c_TO9)fY[-dT/Eb>Df^9[6U;5C0QD\0_&8T26DKL3EP/aa
[_/54dZBOD(2IS),#]QH^U;PP386_3S]4C6S@I9H<)0/)KXKO@HAR295Q^GWXERg
e0]0NS6?07187G,+(LaP=g6AV@7,T)fQ?.&H;E,6>/X/G:@DGQAV[]3U329fF/ZB
J&OJ/>]>6CC]K<DG5AU#Cc4V:L3d<c5S5dU5UM+P^g9+WCG]QaY&R8[X4aaF6d5.
PUE_4a]G6TgD.UVCVL.f\g(6fg>8b6M3ISXaE(UQ0S[ZU]@@:D+0DW0HY_:>66?C
3>\Rf4MS5<?FOLSP4<e9b1OKb:NIJTb9cFY;UUXIZDN#a_BLdY/QDHLc&[+\=.,N
B@ZKNa=HXM?g]H3/6S_X<2_8_:_MFM>Eb,[O;X@BT8#f)[F+13>]@WO8c)&0X8gf
OLeD-DFEQ/O9NgCfJ#9H[@XH,YS)KAKW3COLKNa?DXX@R_K]?\6U^U318P(^H)I5
1J3=K##da[C:AUF3O/@8f=ME,7PJe3EJ5NK<ATaC,Pe\[Mb2@1+OOYV4F1=W&RM_
-T<fRYIBAXX:17.dcgC8,MUa.?e4TQ>6]XfeE:@N@fMR_E.U8><YA6D#GXebD85:
AZBQ/cZH.BBd[&8E&[gCS8C6eba7P#^03e9@S)O5Ug(ULA3a,YGMH+_-?NJV<W8C
IGT:GLJ1RVO/A1e2C6CXVH8_Z70E/a_M89YR=^MKH\2Y]=.HQe;WA2d<a-[TM[7-
I;bDGN=)RH&(ScU9Sf@&Hc##)d1Jd?/299EJ&T@8EJ+a3FSc.Z001&f0U/cVdY29
4;421;A<B_?Q4;W(-YU2;GD,6aM)IX3>1MCZEW5[5T8SSU/bW9O0-9\0I3S<KRC>
M@7b):0eN4SY1H^b.@aeMgD53b]I)N1##H[)8QU7]7()UbI7C\3:9BY8=Z\8_TNg
a]6Za3AFaI=:IC>7C2)9^[bP/Va4g+)/PcTE[L/WPg&5d>GI1).L\G_=8-7^=7[1
RI@YQ9\HI,+Te-,?4cF@14aZASYPG^gN-8J.V+3[8;RVJK)<c]F:W2RSR8IT5gKV
+F#FF&Z\d(+MJ:)8IJ7@96WR<cg2La5@Y&aA:T[,bZ,Ic+,MLc?;KfS51caA2,J@
#<(4)?3AL8?7^,GR=6C9W(YK9()<PU&Z?cBAAa5g;N+(EP0##N+e2\R.<;_^b9J0
#Wc_-PLSFR@U-cN;dLWe_\LOaDI(HS1T)[,b.:XO_#NRCVZYINZOI\65MY[(PZ.[
B)Xc7J;P0#-L6,ST/ME8c?-:T\.eQTIW7f3)<G04F>+;?:I,99Ec8Q.g6L7FOR5U
S(Z-3f]8bX2#fDGN]1KZ2ML,-EO)g+MJ=K_Z0KJcJWG(Xb#-X1Y]]ZbYDPPCDQ#K
B#68Kg@KZ=Q\^>H4M/Pa1:U/e8@Fg6[]XN3<PRS,+Zf&#LQ_cG3&0bOd7;S1#6Y5
W]UOP]P+XbB4#cT0MU6+HH(X6B+3Yb1L/eER:E3f2e@^U1ZQbG=[G7J2=./J;Hf0
U_NVQKCKZ1=+\.9],P,4Sg^R,eeUZ0XIOg3V=CZ(KePQcK>c:I]#)ACI,]F[.C]=
:]U(F3#O3fCb/51^DVNXJ)PYN9B6._+(Lb9B4_0)WKPHBJ3QRIZXaf#2=cUVX&P:
(,7UYeX\_N3X_0L8.:H>B?K9L7(<5a@@gHH6XKU?J>4^F[f#YAP>Of>fdg=TMRR5
X-\/=-\_DKG4</@#(a51=(O:+c/NRB7K^/8Z.;7N<Ea4:,1)WFDFRY(O_g?XN<,K
67_gP(L8DPTR?aWVSXbSXdAge5+,;gS>:F/)#D_)b[ZDZc#K6.J1fJ4N]()CE0F.
<)_e,O::Mb?86;G7S)ObH82ZgR;JM#.Off,825UP>4Ud,]AXK1)cNQ93.IZI);HI
AYf63O)b1MZBA6;,,W?L>V(.<QT80bF,(6<;J@W2O88W/.X?XGN6FVO,Q/)9.O]Q
R\\8#,&c7.P(a7X_DV(=-YcUH0d,4P8?(>cAHM3>SFegRJR)Wd3A2N;I0/AR@E4H
Df<5()dTKAcN.FbG\.@^\?ESJU@DNDW4D_.YX2c1;cZ5<EY/3g=Z>\NB_,BGZC##
:9d,Z=JaR@&-4Xa];J/c\<-:-(08+3/JNOaNf&Ocfg4J9MN6(ZT8A+3#JCB\[7Pa
V@cdOCga7KMX7e/>WNGJ@[=#M#.O8?8PeZg)V6R]NBc;&OC>PC<)GEXf9NIMFQHK
Q^FF[:cWE66J]BHW,_5]XJMJ+X>I,F&F;Jb,c25+E&g8+44LZK>H(E3^/Mefb9bI
[6AB_daH)QO=f]BPF#E7N([_#0@LbZYS8F6fcA\+P)FcDHWd=]M)X(b8JSaLX3A5
X-@9(EPJUSH\7Z4C+/67K6J8aTLF0_L#&Tfc\eQ?1Z\I2Z(@F_?8<:TYM1;>_C;W
,Tb0)7d&B,Z(S\FfJPWb]-2-:92(B4CD\?CXVBDQ]g9>]bG#fbRC\Tg6X<5R]4_C
-=&_MB[[)J<;B=b#^+bU5E/^9JX6ZENMKWOf>=C;]K+^+C61(aUFKE+.7MAKM:HQ
>V^KZ^M\\R\M\U8Nf/gRZ6)ReS[a+V0;47:_]=^SM@7E@41:Z7I\JFX09[b_#\JW
;=DT1R&7KA,N(8\.@2UL]T:cUJ,Dc;B^JO[9LZEQ<5S4fE>TFDL9D5Q[DB_;;Sga
)-&8[YOc95YRgF]A8Q?YLALEYJSO,=Z(6>Y@d3gYQEHD7IN5E>WV8=:QC5R>QXH@
_1WYQP0]gQg0G,/FN#_[:_6EWVQBNKf<08RX#A8df-_#YZM&;T+2KQ^GR1A\dRMY
C+S(RYHB,Fd.0NXKF:[I?IGC7R^@e0g8=(gX^SI7g//@94RBQeYJ^T.)/+9:7O3[
9C:bLBb7W27OIe.9=)gPS;c&D_H@56_GeZYcP=5;UGU6-@>ScQ3.IX\PV>_@JK)0
24]ST\3\1dFUTNX]9^f<PE-GW=J\XG2+facG=JA6ZK8UBYS5e<\ZIPG6>LY:(_Q_
R#>-54f,(X>C0E;8+0UH4>L1?c/T;,:.8#V4_@YNLJ<[cKZG\2C8ZZ)/fVLBOWc>
C.FMDU:;b2Ea]4<AQ>/G/);.76))NG,Ue@;77f1b&MC^&/8KUX4e_A=X=HafUOb>
2<KE-LV0H<=Y1e29e\EXGR&CW]]YQb6B(G\G9R>aF.M)S>,Nc64QJTbC74eQe8Q.
(:H4Y]GKed.V)e6W=AS;<^N8H4LKLg3a.aO]IQO81&^KN1O3&GOHVNUO,+DX?b5:
G<(R)@;?<aYbF9;((BM;e]c+;eL9<F=?D4b098SeXeOIb06O&7)8I[A4BgQ\0&+5
b3]SX8P#@LDXHWL7Q3f55U#UeO5JC=T5,]]&Y[GMKe=T?WI_V(=>RT6fab:O&UMY
<94XRW>R15EFF/_17WLNG9NC/[,=NG>+(7=\/SfX(\)A,ZU6[LIY;E9G>OODE:W>
<BgV0,=TZ8.0@<&)8dIY=_F3O3dR3=<Q-+?]T?/NSYC;S8ORBY5AJ^&KTE&<04,)
=.MV/bY]=A6^G,.ZeC5PUK=/H;MO=06Q>X1-bKN-[IVONFg(3PPD^12J5);^Q]:]
U@W+,dK<].T:Se(M(^H@GG^G10+T+9F).D.>U=5PZb(/9^M\fbN#-A1;fZXdD;.4
8Lc87VHFR/N9HYB<;J>//RZT4L^)Hb6SLE2CRUDD[O:^^fLEO^:^@YE[]LGHde:Q
TFC7M@fMb&>1:<2)b=J-Z7MQ=B,@BK0WcLA+(8B).77/e1T5NggWd.OTG4OT/FYe
K2>N@WC+:;Qf:SG>H1eMG^27_e>cU6bVVGP=.@/XO0\>U=A6379LF1(@PO<XZ.VT
I@9dYZA^c7Ye>7EQ]I@SA=SL-Vb?4g5;:^1dM^WCU)OI?64T[HZYKFYQ^Q2U(f39
@bW)P7P?g,[(gaLI@(&U#D<VO)HNL\2+M0cI7NWNAa_PSg2-90SQ.fbcP+KTb,PN
b[2U[XeR^-3a0Y=e#=_;2T]TI>[QBJ#P>b[#&6G\/H6G)7G:BdUJQ/2X-:FFbM92
O#SO62/6QD\=P(_&Wb8_Y70:,-_V6GUEQJ/,<^KJ01ONWGgII(@RHF/e0b<_>Pf/
D@X<9T-[&SAO9cK;G(7TBC4gHZNe@)bS4WET3S;IcT&/(BYIOb@#.SV>7E]c_9g)
T71f;#LKOaLF3G4Ra]+1U]1^cOG#=O1E5caG=G:):][XZ,&VbU[ddG3DF+5K6:eG
&e<[#4A-4[6K64(21>MC9/1SUE8&F_:VB)^BD3SB4V6XSc^G3\9R(gf(@@N0e9-/
c>OOIfCL2)@MFT\MU6caTf0]@B(_29Z0N9;W4ee^(8\+@].b:S&:AH)07>]Z9-#5
3g)Bb5PZgL>/IDE#T)95DdZ1:O:/;@G;gIXOJcaBO[>R)#V@KL^c)_?_>TDF6@@e
7e2\1cMa#53aHaBa88JR[;1K&1ZH212;T)HLGgGPPDPP5-C&)IS>aa/>KT^[[P=#
8aUY@P05a?,305T?Ob5U;E0CGR[,R/TXQ[.5^Q\.2b,f4gZ#9@1_UU<8V#B\eRB;
1\^R+F)e/aZ(a6d^0]>GD#_I#9BW.b@]a@I^QDA<gF)_P71AT/PU\2LZ0V&+\]9I
QS3a=HI,.I^J&:UaDIV\?>b6[3/)H/D-L_K4P[.f&&6ISL:?A@\H)5>8]Va7cI>X
]FdMMX<OeXW[LL@CYQb)FE4b?Ye[17:5F14&;B-GS/#I(ZNQN:U[IB?LA@=E]Ud8
e,NcE0eW1E\)]VNBD)c^P,NP6Q(]EINT9bR),.AA8GPP/Nc12;LXE9:DJIc<c-:8
Hd0RT..I&P/CI-X8Hd#OHA9g??b^G#bVHA4a@G/T]6g)E.Y#NY5]]5cdG12:.?0f
)SK3JC]M90K,48^P6,\aXb7QSMIU,@P:?C7]^Y(#VE/C:4A(,>aOPU)[?A-KO\@c
ONL&7N2YP42;CUA/e)O32_DQOEY#ed3KTSATa4R,NQdfY++([G>PQ\9a7g@5Gg-)
/L?e^M@;ZBU#-R&MF#CQ\1XFf/#FSeM(W85COVaag=)Lf1[#.7)R^#c_L,Me&c@R
[.J58Mc?.]+4?g;aIRUfAL.QFZAQ)]R,2ae@5QX^Q_,-#fLU7[dBKV;,^<Nb&&cH
2[_cGa&N62[,AIK)HdF:b=gE,;N^/PNWU4c6;66:RZDH9Q[H:JSaIOg@LQ8M9+L?
f==c;A:F,ZDR&XcJXAHE[2/G061,TZ9_W\/W#FF#(AK?Td7HZ(FX;:#A1Y0/(Aa=
M<;QA3e_M^^_6Y@c;:VK,TBTS[5gXH4O+HO[P4>5OUd);>QNLS@?M??U-^@[e#aV
1ZV7Z:<-:KX=S?cQQIIGdC1e&O3_Q]>eVAZHKY9f[.&4CDLQO[FG2UPc1bFXeEd8
F)O9L33f@c;<+9]4b(U9e8[F-1=F9aL/EbW3F.IL&NCAOD<7LH(_eB#Q1Q3093I+
]_Df=b9Q1XE,#4cB,g-c[ZBGC&)C2S8<PWBdaM^@Q(V@cT8AD>Z\,gN&e2F6dfA?
I;\J=[8f4,XGbd+70dFO[<P&E#:^YGX_O\6,_-SCK-SI>6X/VY&I2OG+2Q+[Yb+]
Z.Qc+=FaXIK0[e2;_fb&gb\).Jf/E-bKN4V[4,VH0E@R/b6Z_73IPKT,.fGeU,d3
QINB5OG)<J[cSYEZ?Q<7@6,OZ8,eC(2BY)<#)F98-SQELM&c-?A^:8C.[62-CYg8
QL-@-\a8gD9ULaM(M&P(POYXFUL7eWU:@R_g_KR,T-Cf+aSE5]b[b\3,XPRE4TAL
Q1FO2fgNY]EKA4)W(d1PB0;,7[(XG<LB#0TTVE.+G4dgG=RMe><?R[b];N0,Vb3;
DDUT4D7JB0WgQZUM1HE7DFU2903[A-:[8VaAbN<F,;O:_G6DHg<RM45TAPZ<NH#-
bASL\2L8RP7f0WKH;MJIIVCZZQI8fLT;;OY0/E??Z+FaIJYM9P/9Z>]X-Q<LdD7O
Vc.AG9dL.Zf^8Yg1b1I[=8:fV=B/=@C\R,<5c=T;?S<=f\\gJL+7@@P9/3:>Y^D/
QTV9WC][R0eWf4)H6LFZ_T1:Q=T]JA491XJUXOQI&XK(Q2=7-Y_ED7Y\_8d^<COR
FYcB00N,_88HNRURAJW)aOP4@8-=Kb2FB:9L8XL+ROK?>0Cg#agcg&,DL@&OR>4?
WM=\C2M;d)8XbdWOS?f2Q9P44$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_REGISTER_FIELD_LIST_SV

