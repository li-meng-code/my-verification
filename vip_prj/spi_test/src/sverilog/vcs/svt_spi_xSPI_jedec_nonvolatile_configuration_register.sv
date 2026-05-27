
`ifndef GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI JEDEC top class.
 */
class svt_spi_xSPI_jedec_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`protected
,>LbbF\e&YbQOO2<Y:U6e,g>IUS3M6/I0R]RW<\Hf<E[9BOD/V]A7)IW#g\ED6#D
OQDXJgN/d]^^[SC\\79XZBQ95&]QP./SaG33)B0TTSFe^+KXK0R^84TKRH-34=T&
RK8W2O(OZ1)8c&N;;2L87(3AbSPP\aSA<.WBPe&85[<F--@@ILLK8+TKP$
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
  `svt_vmm_data_new(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_xSPI_jedec_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
`protected
c+&P=YJY-Y_)^_W\e@+4:Agc-X&^=<V@F,U4:Hc,^b(=I\FYJ&OT():NMgRP64&O
,H&\\WNA?GKebVFT\@JAZ]a@L+GbRKK(DRL]T)XgfX3\^-C]@f)(H,P=J#,gFHP,
agHPJ_F/?NQE;c+XJUf5_5E;5PT5-5;aFP\c@M?6O@?.T(-0P;6(daLHHeT6;17U
+e966c5GS(eZdG(Y)GGXRVP]YW7bUSUON<U>1/2RCMP.A$
`endprotected

  `svt_data_member_end(svt_spi_xSPI_jedec_nonvolatile_configuration_register)

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
   * Allocates a new object of type svt_spi_xSPI_jedec_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
`endif

endclass

// =============================================================================

`protected
W.)UNd(/QK),5IOf7MJCZ5JO5PT)eF_:H,_c_S&d&;;-RMZ6QD)E.)bIR;G+DWSL
?++0)ILJKHeR)HgQL25EEFDLCCJ54#[M19WJ-K86L)68BfLTLd^.C8dLDd,N/G6F
Gf@ECQN11[B60^_?\X-CNQ,?6S8Tf_2,3#&F+5_Y39f\1F7_&5._?,UbIcG/S4_L
-6/QeVNUFZe-=JOgKc9-f2K,F.bOC:<NA)RAJL)/baS0IN.GB4AM6N8BYI5,TV>#
K2L&C5D\R#eK+NDOf/<[AY]eVD6cb&cDB1QYH0,=IFZTC>+1C-RBU>W:)C\ZPaMJ
G-#,#IcAG(14H.>:Je9UE&8Z)2#DBO.\AWN)BEFVBXMeGTW7+]MWMI++].&OO(5V
KUfR)+TKT^\L(NB?9fSLT[bV+TMN^HD>ET,ZZ[NO\,L/SFP@\/_,/(g6Ue#+OQ6/
(0P:U6I=#SQF?DLIEE5SYRfV@NJ@#/<gF;\eK->Z786@#V,g^-F64P.U@VB,@I0(
T,<D^D(aJA4&[=L)/3aP<OA=bg]\4\5OIXRAZQE^M1XOL/ALI^#X:](dHK7CN_9R
(2]G.a8TRGO-N^8A2KP4b;&VWW)=ZJ/IQD@2UCN4B+7f844&XRY70M&K9U08Z/JU
(([^>LM@J,5@)AM.?YdVL0@)<@V6O@SWd),Ta+328W>6Cbb5;X[)2aN1X?U\KEX=
[[Pf=W/,OBc<@a<9RC1>T\7Y-,1+MZNeOFCIO&eDJI:.Ze+=DTD)RU4??&8<0H&.
(W3^H#)/fAPbY_Dc69S]4[7Y8$
`endprotected

   
//vcs_vip_protect
`protected
;4?++@c<^b@egJGfDGZ0=4U5:egN4_;If?NgdA<S:e2HXDSQXZHE6(/)c6MZ]=XH
VVEf,\bW4(JGTYY(8Pea7X0^R_T=C7bAdT(SFD0EFW/O[08]NZF)DZB;:AKCWKH&
;_IB2+>@8JA<Me_.QK7d-W<e33I))CA/R.A<]U#:g]S^H#7V:GP?Z/55K4E]I]SU
;FN_6@GXZ?DJb52X(bg9<:2[><0ON.XUZI9;G&J^bcK@C8:Y6,G3L@^,(N,McP=0
(+B9EM)D@&E&R<NHRQ&7bBCQg_=QF?_/HKLI.=M8=eJMN53f&Af]H/4NE8X0+gG#
)e5)5/PCcQN&LF7.>UDJN)#_Y\T[6g4VN11B#N5L67(OY)TBAe8Qe-@.XIUa_^0d
QLEQK8Wf]VM&OI8^JTe9FA_cC/>Kd4\R=<\aI3(8g^ZI/e6#Y)C^\P<IP5>PZ;g)
HD7[-,N[b]_d-2-I6IQ>^L.,e)aAbV@-C.<&B(V@<+0](9a6/KG/5A5[&6<RNI+D
GAU&JZK=,1VB4QaQ@gM)5+#)d-0N=A?V1AdMTcXNgM#Z_2RF:THc:AfS.aUX@Sd:
Ia?2G>bTdA=Vb#&8JCAXL8/4@&WK0:bCWL<>fS,JC#,3=:VC&WGAaU[MYQ)<BTg=
)HGDP0b?E>+KT8;feZ1QdTIR8S2@[L7_3_Q\X\M<V7>dG.#[X1Z[d#W_FWS).(bd
cJL+9S0=5GZaBFLZ7B,&=.,IYQ6g819WO;(2ZBH]7F;T)^/K\?MS(V\_I1HagF>C
4\H4H?GFM,T5:K]A]19_,95;4#QMZP4F^;DE.BXXe^I]PI?F@@(1L>Ib5ePNW]1J
cEA#\:bgBdUF\;=LBZX@EY-1#]^\PM0E?0L;47)OHHCXG([c@YU7)^PD:-X06:QS
^E)@]<M=A4Z.a@1O?[ZMM>N>Y3JdM(fW,f9_K,Z86VF.aK053CB@IK+5B#TKTE7f
FF4>;a7JEV>6[K<67_Pa[FKN1M#=3L[;WR?]Z#8JJbJ2>9JZWDEW6,=I]g-@f0Y:
P8dAI3cfZTAFcd[9\:7Ac@GXB=0W.[.H?#<c/>.Z8X?I)>GG83;dBbABY15^N))+
Rf]EMIZA/PIA(\M2TSHS0@c:1:bS5W/]@K<P.Y2SA#N(0dR8A^VHS:KKb8X(f^IE
EO+Q-YCcHa)RZ]80I5=19T:/d_.dP\B\_K@e8.+1BX;Z]g<H4BS7_I:?]DBKd-(+
7_5_MeV24TWGGcVR.YY4-b&a8=+4\:M0Jgg.M+:FXF0,&Qa4bbD/)\d#:AM\NdQ[
4244O::];V1d6+7;FCSc.O;7Rd,NJ5F-dR:^=aT.ZeB9S)4QKV),cBbJ4JLY1.L5
dd4<X#D;0T^N/[bRFfBE:?LV7Db\XE?,+--JBE4ZVKZ,)[Q+^Q(7edVSCeU/;+-C
-f7VEPWHcMHX#ESZbX]J0\<5e_VG@-4)33R9&4B9#H4B:Db)QH+R@(Y[:>R.=)C/
7.R]6gCA7UHb^+H]dHH:@G(RY;HF,Y:1J7>J.fCMa_.M(fG+HO(0V[8#e/V,WR0^
QM4MMD85NDS&+)Mf<G?()EN>_g;E?&GHQ76VUZE9c_)<:Nc.QL;FH@A6MO<T&M/<
<NS5Af4bL&3OXUYEG#=#0:L=Cd=KPg+D/()#<PdcC^T(QF[cZE(>Tb<B]fd5TFL^
W(1D4A#292,d.P^WZ:Ua.[V#BD5=V[/OIe3e;dZ2^6>K\^V=J4\6/IZ@Q/+LRDZE
L\YGN1=)FH/5H=]@#/M;cLH_4IJ13RX4Wg+3Z04H:9FgFSd62ZC:3((RR=9F+KK,
YY#_e7+S3IK:GbddH92[d#eVUdd@+[YH:4:E9&D5Bf3Oe5T^^9:AXF&OS23V]PC4
FC_H+3X(9Hf+\XWc#94&FZ95VVHVcSK8I@8SYb,5\W?WR]=^)W15DW;M73G9^R;D
#Ce(D2fOJA7?8b1QG@_S#UcB^aE?#XP-Z-QG7(:fGNNSTM7eOfR0,?5YG@RI,;Z;
V\[(^/b7:8eON.7PI:Ud_eH?^^M6@1@-?[\KXFdU(b8Q?P(TRfA.a20a]?12KKd)
4^)3,<JG>^]VV4R1X58/>L-e\_Z.K]YM-Q&fL<R>9K\+.6cP6/5f:O=Xe2A9,)3S
S6#Q;]5^=4H:KJBV_/V@-OdBRR#M&;:>8RY&?60F-+CX/<gT]abNU]R;-).c.^(Y
LN6;0fS4[bND[0O[69a6d)R3U2CcUe-,J/-RJ1Y8Z.6<+f4f5QU#a#46WZX&\Bd7
L+RTPfWdc#PFLb#>aJR4J?RO;^3TFVgY:YHI.>M\(B^8AQ2e[EUAPRD0cX:KE(2)
+3_>X_PW7\+3.E.C7JK);_FB/#3J,DB-13Z&:ZEX0L.eX@0[B\>1eSJ\,O6/DLRX
-;,:_=b7:dM8MH\8@9bS,V+LR^]0?Vf)d<A=I.U02<O9DX&/P/I2ScT&<K/6GU3\
YJ>KD-:\FVN5ad#-2bD]8Z#.-(ca)9d2cAf#e&Eb77M:.+20;YO#(_)aEE<d2OQH
OR)=XFF?8.@CEa@Kg-ECA7QD#G]Wg73Z51;85)^b46P([Z_)gA(J(e:g(<#3[?QT
[A0\TUI)30,4VOX_dZB3b7XT)[<@ZFPM3T:Ge.[,^&[(gNKdfD&1Yb]5D_W;0B=D
^V+>.CL]QN:QYBBbCJ6fXNN,?#N/=.&Of8;L;)A2QM1FR/CLEc440ZE4_)Y3(.\4
:Xc(]R?^2^JaGOIZ=b0793ICRd7?IgIL6.#PWOL.O8R:&O+5F.]VX:GfBW@9e-:;
N5[La5^><.QOTIK:_P8@_U<\EM[#Z2UT_OZKFfO^59:VZ&]K[D>^[.8##703Q8EY
8+e?=8?F(L4NVMU9WG(.>VL=9R+[eb:)Y^(b8A-bdSFe6+#=/C\4R0[X=cMADVK0
VH>[0GGHa-XT:+WE;V,f;V9;<_T+K\Ye3(F,HEV^QdI5/N;#_.9,,C_>?fKDPMRL
KB23;:/M6d0)#5g<8cK&-Y)1D1MVWb^,OB:[6GbV_HNH:2Ne?BNS5e0KR;I3ZMMU
G&)O&=fUace:E69<JR;-C)>5>Q^LH.L]J)GSC3(Y>GRdTcT9L2V9W5F:eSB&9?VA
Y^daP+f5>=dB?72f^&8&=7cN9Pf2^aTJbKMS2C:RHN&eZ9eBX.,8Oca<6(LM,Q0f
S-Vg3eHJBDC#,P,\9_aGWf/+eEGY.dL7HgFLeS?Y:@5BP3RT;OEC2YF2+6<Q)bNY
(M11^aZP?73FZ^1I&JS/b1e;_e/dRV<M9[+XKU#.])OZES_J.\7:0=P)<[HWV#QG
.@gJ+[9H08+-BgLBJ+2b/70&(CfB/R#8Cb:G;B2cZ4N]Uc;PbC7=&PK-bTcAEGcB
AAdegR3e6SaQI\148(P\3=SSf?e_H#C[#.FGRY>EP6M<#IgGJHE5-6bOK2-Nce)Y
AVbGG1EDcRM.2c>,GKB&LG+?MCZ/L6C=MO>g2R[\UFgD+./4&RG0X5]WLY13DR8Y
W2Y(V4<Lg\NgZFER1?PFOC/A3/,.7GK=NgP1c<+[[WX&P3NVA4M&5O6JZBbAMWYB
SMYA)Zg2]E^9PO\Q[U[VHBG[G_R6bZ.B5M]V)IK]L<SL+2#J]C:]HX::JLRO<b.N
@O-]Dgf7Qb.eG+EH-[R5Bg.\e=,_fUPWaDWV31Ad\MU3?4FCIe#7-IPgAA+0bE?:
2I:I-8,#@#6#Ad91,WZI>&+]8(#?W3KEca-d:gCJNLZPb(F5&<A9VA8f,e3bY[HQ
ZY5U]_X@S;[R)JgefKS3KCbIFXPOB4.Rf7K+(^04U_^I_M[<0+YN&-S:E-Y+(>=-
VdV6D(ZA](IEFKT6J:W(bd.Xb=2O218TCVJJLCUPN_#M#<)W4C>KA?TH2^>^4B\^
Ie,\X8(#Wg=&;39RWQ_82JY-B05D?bCGdIDO,2(bK&N?35LX]1P(J8A^/),&G8.O
cEaNDa(>?CgGHP36):TLO-T39.]ND1b&3^?&eO-YKA;YaK^#-Fg.6SV,-&IS[>+I
,@56;SP&VX.;SX1Y4I>e^=<Wg796[a?<.5L=9CRf>7,CU(TTFBaY^g<&Se+7H7G#
E.\G^FO<dW]/fG8&,GNeQQO(VF5ceI#\EKD:9E@]Ya>SR]gcW+Uf<TMPLZB_7&43
/eP#]4+X?IdL):g:NfUPZ\>Q):(f@VV>UPCTQccM-Jbb/gK]-4L<@._)7Q9;HQD#
^=/637fCK[FMbHPIZQcV8GdQ,G@<M+8Q)3W;cG.+\?V\2)[I:05T,PV;YHTN??BX
M^P@Fa8P[C.9LU^ScPcBSLaM.S<=[U[HHUL(#((]dYIg?HJX,AQU5-gY:FSV2)Xf
YDPYU8@UW>--]Y^O-P3Z.IQ6a<=H,aY\/9__19;8_=(9XTFf)H@aQ8SFTBJWJU]Q
8;gPQJ11[_#D?\[e9^K92+O_:Na.9HY.Og0>#/2Kdg)2WL=5bIe1a48Z3>c([VN^
6fH5@VYH?KWUAM^(gfR^?I\(2&A3PI0^[71B?GPJ()a,&74CNANZcR=87VOaXBc2
VF:,bU2K>[Y,D4A4d(Ne-E&5L80cZM]A6M-D@FKaWI(2QY10/[OC39(SWD09XUTP
[SKA,WfD16H3U>aX6,D)]VL(Wdf>(fBHY\[5+aD+1X;RHW6a/eH[edPE>+/)G\bS
A.F>7Z:7FbCKU9<F9K[XEK?f3?]]\FX3cf)S@(D7a7WE+Oe;YS48BSTAN,e3XB,X
_4TDF7,&SMJB//V&.+WZHT_RKO04&G1(;A-TI9\SY,IHc8HQ9:e6WW-3IUJV-\8:
J=O==O7/[D[&:CY(HaE3(_4G^<bVDGYG&.AP6XS_S(F1Vg@OU/Q6]L9(^66.U5+&
H[)FNWF_?-)G9&LEP42^XE6Z:++:RKKe4c+_GB5K0#eNSbHO6,)C&]6#;MO,]DDO
V2XXe>a\EX-ce7#1LAZL\I5=EQH(UcFWbQ\Fe;@;^^bW@f65TT+(K2QV/S9=,N_W
f,f+c3(=-A<=Z-7X?]NVKSZWbI,Z7K7PbX>Q>2(=9Hg5Dbc#@SaK)W.O3A6MWePa
8YBK)-X?;8,M]/ADW,W\+^VGaE/DM>X.4PX+<@/?(OB.)]98c9SB?7836LKSLfI+
>/9H3DR9N=F9g?YM_5N4&3)KL_X@RbDeAJ234E5F+KeR<>(+JgA^g^=CEK^g08R0
+[GQF4WKC;g4#dUJ]-N(NHNE#Ib;Z?YN-J8KaMbN3aCdCH-F3d(=Z3_4L]PJa,Ea
?NH(+c7/Wef?R8VZ[XQQN.:/=DO[<Vf9L#B_\_I4gX?\)SFb;3XK5QUX&HK8KT0^
MP=dSDJ(0[<[gKHa,4GX)V[,_J?UHaU.O873f;62(bCV?KHYTIK_c4O3fPP90DW?
C>PAH5Q[#\;&MY1]ZIP9e9H@1W\BaKM6=a5.Wf=ZAdJX1E)#09UC:B,R#M_O;acX
SOIdaLJ^3=22N4_&0cC16c<PaDR]#g-R_/5S(#+VH6He-G,6,ELW^dN&;-90@f9b
FXOgW]&=(=12F+b\1d@[Z4<[809[Ff?8NZ_a_;/:3N/bCTPA,VPE;<)1<>+aW#?4
=IO6K6@aG8aK0:>R/VbLg]P6b3N6V63gO^SYgYO)6BB)c<Eb+X17Tdb00Xc:I?A>
c4[FIS+e#,dRY=1Z?[,;[)/c@:J2[>D^J(A1J;XOf7g9L0Jc4FHfTZ9=LgA,MO6+
_/EA#\T7/6X;Yb)gBQPfOV?[ZHV4B7W66VBN&<V_FY-XKK2,U/5)\Nd)gH<].>6I
\A+P1HL+C\S^<E3cLgW8e^4F^,2BK@AZES>ZGe/2TB;W/^O(A.PT?N2.S>CDJ/-E
W/+>X_UYR]93d?24XQfgW?&0H-[QW&b&&6d3CIS)b(Ne#=UgS:&M\NPa-:9Y<8^<
+.84BYEX/)>g=Q0?6_-28W-2-9>>&&9X3@R5)3eGFFN6b,,cYFWHLe6<,TfVXH;U
YYSB(N+)&gK7<J>(^]WA]UJ/]_GQD8fNN)&D9g6=19:#Y>g6Y97G3W9Z)NDX/N[Y
):Z0V8g<cT2HE]I8P\[32U/:f9[dW,,5PZ=9Zf98Jbd@,5O^b10^1+,=49KV;PPP
TC]-PCK.2K:A]F9)NYE)F6NT@d/B[O1<(53JNaB[&\&TPOOC/GV23-5a3/T;R7(3
5.E3X;I[gce5QB196ae[;7ZFI(DP<.\?d2L>=[+CJ>ec_XFBZ22f.0NaXZH>T053
AMG.ZS.)&2-##VB+^2ES(WC_77JU+fH7W]L\0DU#HM+2RWW\_P87DR\VASL[SBd,
=U5L.#d1c2/R&&P,,[[Q-0,Ic0b\d^VY0OAg,,bVY6,d6W[g/@97JDTR,)0/2/B^
H2V#X=a.E]>TWZ]8da)ULCN,Z@bG@_9d;XQ,ECV>G<d.Be6b@5d1N:IaC+RWMJ/5
1[KS(Q#2S5gB]:fZH-9BaF<cc\N[aTPWPId;#EfLTM-6_GZPW-U28=B&<)4?8ZD8
[PF,0S+D)?Uce_cbH39N8I]Y@2V\5:7RfS.Ma_gS@Gd0#IN;HdC5CJ]EZ+^-#L5e
,1\W]B=G3T1II@0NfL\d.1U-6BR:;\QJf5R+/IW<BC1C39M^;6d&L):0f>,(6Z,M
/b9ET/;A:]TVNCg8@.7UZVc<89N&-:VbQ4Z_1T,Q1T40]?/M:X81=(X0?)1eFI_;
]VUJ?DSTNfH.4N[ZWC&Q5fXAKEH@gZPG3;;aQMDJ6aeWKQOf=VeQaACM;@c(Gd4g
Pe0;WCFIcSXN7Mg>&+PPS<Z46cH8Z#&b5,IdAaFV&F,0Rb4Q\-EFFP/WNV9A6+_)
5A3SM2/AL_bZM)):V[@#Rf-ND<M]G:9YD<I[]S6&\R/B,V983()<P-<Lb8TJ\05X
g-SX8H5a0,aIU670:,dP7:UZ<QP1+Za=PfVg]:KB>d&6:1CQ5PKdCOY3#>OKdJ]T
RSb)I\GT<3Ze#Mb95B.d_,eI8\V;JV1C=WHgZ0,F+-N-&+GLF>07AEF-^Wb=>NJ5
Y)=&82EbX>EXUU+-[93L,U:GAG1:Le23P_(7A3ZZBW+NS44.-7;:;IGGEA/BNZa_
M6R8B6Hb5,=Y--<S4.WLDI<F+IJFR:EFP9ZJ2-E(GKC)A@OIZ6f-J4C^ZFQI0-Y[
E7GLSb;Db2>P2O+0J4Z4ebKFHINBJ9=5@8[XH]LUQ8&6FPV&Z#(J1/GVZD4IcfI0
-)ZbXKKB(=8b\D^1>5NfR?GD7-?Q7RAUMb,LH]NTT5]RW[9,E\P&L-CRQV2RPM,P
Cb/[.?d](PW1f++6.ffGX]W2V+KR<]6bJVd]V]ZWOJM9[SMVDRKWT<6;J@VMMQ52
NKA&b.WRN8M<IWeSP(/^0(/P?F,E8RVYP@-Z50f=E-LaQSFFaF1^&6c>GXS(HP+>
[(Z\SDg&_6FPP)75RNd01gHeM#K6gfH)Y8<Ac)#[g?L02ZX@Ve#eGZa?PH5\#,:Q
H]Y5Q>@^F)(C(b0/72cA3-fF#9?(SA9-2K^T9^KH#C-TGMP56I3C>&@.W?,&2W&D
#4]dP-8-/_;1aYI;-Mg3IVRB9/cSZaW(TI]=WI?]/):&&WY9);6NT(,WCN4SEg<0
VdO]O63afWVEURg3P7UW9@[7K2X[[H:KPJ/f(0G9BEB6-g@f@(eIL0L5(g/J=F62
2d?S:<VZNEYT^f)b/;2UdCL[C&O6F\Q7S^=Y9^6C73RJAS,K9JSW0H[ZO7_-dBK0
?VKYbW_7>Kbc4>G[e(#Q,d8)G#dQU+TU&,b+;g.#-\,[M=:D2+>3,eN]-O2RYCf5
?[=NA#EEM=)]c?Ka4X:b4>:.Y,gH#7Hc+;7RJCA[1KS/WMP8IS&W)GI-Ye\I1\^8
dXSC))@c;[AIT[EH)O74cGU4;/0FVURLd&96B^@)6KF8E-MC&B2\V.\X100A-5G(
5Ja[J^Ma5I>I614.7K\#+7b7SNRW=f&aC1e.2WGK?8b94fDP_caaSRJ)JQ59cR,0
59@WfPY:A+2AYHgfIUE>L+cA3cDNDYX9D8#V]T^8X/=,92dBCVCS<<NPFbJ;3@;&
8]ZQGSe@S@+Q3+E]c]P4dQ1_S,dJXVWa[c66OFDSYb.IQ&FY8ga<>a3f,K0)7;U?
a0(ccDTG7CN;?13SB_a^D9T0UHWIO,0C+<8&G0086B7M5I^K=2X?R4;0FIGKK6TS
aCS@F[-a+@f3;^U=f7:>LF_5CgE/1Mf2KDR.],IJ][fbE\e4FP0MYT8V@,)SgYJ1
-AFSF1^F:[FI#HfG1b&WEJ-_15=YX^Id20Z-DU?H];aV3^F-fJg-NC?5b+TDb3fb
T[g7WdJ#Fg4@+[S9Cb](&(;7J&X&M/PJ?TEC2/_:S0>CO4S,L<Ib6?;MU4LfUcB[
PV]R7;P6#.?,K_-bg=/;M18II;Dc&-E\I^DE<[S9]=EW,KeLSbR.K]5c.L1M07;:
\+@ZHTXQ/Q)D^@YRB,UP:PUHBI6P1PgFN0UC7GBOFaBR:WEE]XZ(AY5V2PeJfXB3
,4RN)19&I&3#9HC<H3G1ba>RD/>SL2)^.5HgHUU.H2c5#5<C7^J7[3\00R]DFUWa
PR7^c^U3]<K62OZ&WODW?.EY(J9Xc@V]ONH&4:?f<^TA[@V>Y+B0<G<@HAB592OA
)GB_ba4VV@D]PL5O\GFJKe5GKEK;4WAIf.C->cWJ#bG,W::1E@c@._=SD_R:RGC&
4JE,8XdW1aPGMSW:5^U8K;1c,W9gYIg(\:H\^CW]MQDgZ39d(J?++d?Lf;N5B+C/
b3],LcF171VbM9Y86L6;IB#QEfR[BOR+A>V.e3O&A4[YVJ?XTO?0PI\W8IFb-F+V
\UgWdO;R[W/@W]gQB\A@3+&]?d=8MC;E#H=c7/.;Q>E[4Ea@-[<]ZWH/XDYA>b+X
Fd=/^-#B\c\2,.LY&gH[WGf_1bb3f=.+T_0b6P/d^cUG<OUKWZRYRY<H=AS/?5M-
[d4J#^bUDS(#fa/dR8ZeG5CW&\A9&ZJ?>cH8QV,(g/_E;8D4@5=3RCZO1YD:b;<0
D5<F(C:@P:5#Bb1cWeRa?<fQ4,Ge<XY#)d7I544L\[2^4O(e@b/:.D1-+XCQ>WAX
0;;bc>257&9@CWgG<1Q^)aI@=0E]3Z):TO.W+UQ\O]#WZR=,&fG0#)S@?Z(&XP/[
dSH:)<P?YS>?S^++C>#D+UaO:I>OAc/Q#eJb55>TTRM9KY2Y2\V6/R+I(((6MeIF
A174RMae28UDf<?D?d9c]TY^U[>^K\(L5/,>5aO.R^/5/X\6\?C7[ZZT@^_W/IJ.
Y0I#YLW[^/).A3G,?aYC&.@=,PUYa+6#1XV2>Eb^Q21MXQ\W?=g1(EWJ3VG;Q8I^
V=fO?QOJ#_?@).J9?/K.Tb9\MJ.,N;@1;aK?K>NVdWR;+4KOfc/LBLJQ4L)Z6^84
WVB#JNU.;Wece#bdQ8]+=L6I=(IVU32,C^ZW<CH>)5a[XdT:HBg3LJ_fJcIYXc21
f_:D_BJ(Fa6;da__QL.N[+D?Rf2fPd<ZY1UBUK+HCF?QT8E=4:5QOdMOEFVH/ZF[
XW96J)IJ^(;MaX7#Wf=5:TF\>YLON#=)^f<-@,UJ;;X@YH23SX\LMc5(Ja;[90YO
#M\/:\/]Sd[dS2NDJH[A(?3_T5=Y2_<.<5X=<?\6_fUZ2>Z4T<Ccc;-1eUdH&R](
-SW#c2GdeF[<^aBRE-OA^E)E+2W>JC;0D:Y22\_;(<;I?2<1K7BB:2?W,&D]UUK;
QPS7J)KI?1Y5(<<eNG,]2bFWKGO9:EO:f\E#M^C&<\GHaDgS]_4M#dHOTL<g<LAN
Y5XTF#I\SP))YGK42dD,g?A[a:4</-,Q?H=:T>&FB^c-XDVS^LTg=U;SB8R>HC=@
2;+RBP)5=G.X4AB6;25bOKdM4>R<TeE?\80SB)J>N0CJ-1W@c9R?V)NRA1=-[YH4
<a2N(U^N4]I<4KYH[EK_1fSE\3858?X[[#ORRTP3\d&(_=5^_R2F.O@JOdE6EHDd
(3Db6HcEZe&_C(Y4Yf)7[?C;#R;]CQ=\]ScS&fEF7UJ&R4EOJW5^8.@XT3@VDIY6
_?E]Y4JRdJB(>SE[[NSC&>^+J8f8-[X6WdaHGd#;=1WTEg=:WU(QYHfOaRRc)c0X
?,7=F4]-K.S_]c>YKH]/8^JWA/-c/[9P?OdV4_<5S<&12:&R;>R,3[9:G9VS3PgL
8:Lf\CYeRNc:c?\3FETEEg#IU&Z\^@JN_DUC&Zg@T^DN(NQIbM7_B/Y;C3#__bVL
O/4;LZ&<:L(g@CCU)BGd8:^fFT)I=U9&5#,_eLI1)5Vc[d\fRT#1aa(SdR&9]KfV
)P#bL/ZR[aJ_[DI<Z?/G\9@U2S+1\(#MG0_?XD,dH@dSH8H#_>2Vb+:LPWCU/g]6
Df0+J02MU?LSZAf1XCcG>eAG46IJ.?IWd;CZ5bC3)6C<PWULeE.bd#KS?S,_^TOR
8Ig>bY#^Kf0@A,e]8J_II3.[4^W]c=e(9BbRS7fd)S&+eaUa^2L9J<A]8)F:4eDG
R7@NFQf/O-(USM,U60ORNFB,&1(40Y/;OCfEdKc,L^#;G6=2e3W#aT#LJc72V1+Q
7B96?->K]-NMdB34)>UR)U_&),e#?<OTVW+02#\+174MIe@8J_2HAC>2ED((FF@W
aegGEad\W:-_7#C/DXF,K=f[FCC,#K/4S:I(?+b26C>Z(D?D6[IBc_6_A7BgKe[0
/V;Ca@\\L5],W3XeZ=MDOBb8PP]^=:]\_e2bJE(>@YgIROFd&cQca-07&Y@&Wae<
DbDXPO##3IAdZW>VGE#aBF2[AGP:@XYR-@4ZX+CEW9[TSFI8<Fc9(AYADB][&?Ec
19=2\0]9PUX-bXd^^f]2(VBcZ1&Ra6B41#PE5RXZFG6P(6[ed[K0#eT[W3DN,EDg
&=+W=>We+?E.]#c;Q;SGH&@(SE<0YR;cWZ&A15[QCV+-;;:<NIRDENW\0T=#7?CO
M?Ud23ECTfF(_[QP#IYY]VRQS>1Z<d#f,YX_Z.==U>c=GA0Q#[_cdIaFKaOIg[CD
B6@0O91fUUa8Gc+9JZJ_Id&g5YM+H#@:5CS0HeZFM(RPM,7bAV\7D-1]^[-/FSA(
9PEYKgU]4P7Ja83ZN\O<VR]c;]UAZY,TXf,D#5SZQdO5323ZC@@Mg>CM/K3g@1+<
(W;<D0A)0]<;XdgT4W\PgXB7K:E,8H9XJ5fg+UHHK\:;:2FbUL7=_YQ1A<S=SF8M
cD2A,QZVR1)/W:QRNT[R@K-Sg-,b,?6F\0/T6?)d\O(04^,8g(TUc,+<e+6@\2].
V7>0HbUW)^<Bf3Y0gQg3gD\?=,V#))cd\aM^2GK@20MfG+g^EIU<SE2FdMOX@)#K
f=:J0ba]A]S;XaP9US287X>be<6.FG+LacL>J4S&-55T<W_O@8UCbQ>]RA_[]4\U
G>CDOIg226-8=V^Nd1>Kg7N(40/IX^[UR5E#VRZ)DG>^UMdWD7D\AW@LPR:>06:,
K9#K,8/0N)?;6?I@DR2fJ?170H]A=J,@>P=(QUVC0R=(>&(,>Z@a_X[:f,P<7X36
OM<<6#KQdQJTGR:?S6,NK4P1W4;R0@L[?03A3UU:1G#eg&CcS+GYG8@0;HgQ,X/_
0YL/<7QW4K7PA61F3)8T6X-.cW?R.DSdTd6UO+RJ;S.(PPHN:HQ[b38a=[;K,fP]
M8/;&<FLS4YgZLU2?.3OV\e?U51W3P06Qg.0^X]KLca3.@agN_I2;DMeM&T##O:N
4aXbY:J([ZP^C3+?8L<I@&9+8;fNO#<BYX4;\HbLLHYFH2e<,gaOFbC2FcLANQ()
BI#92X?KQ_>W&Vf3]SY])TWVD6]BGWKgR3/:1:?D3J[fU_;BA(D5RABI]0]+d,L,
0>I9FO.fFE\WD1)Y=;L[IR?&EdF5,-C@D+2e@2I<4f7O\M4]R0FGf40V[.JB>/E[
0N&^WFaP\-,deYUB>Ye6+P9X7&9ddH2_M<,;0D.P3O)0TOX.+\6eZJI<(3e>&NVD
[L5LX8ea+WKCBQBaa@X8ceD(S9B-UcUY7]8aQQPa=IKA9XZDDQ/e6&g/P-Ngf\.U
][+_8S1aUVb(W^dgDJgTP?0a7:.VL06aNF9?0GN@U;D)a8:&>OGOWSS\O7=cbV.g
8#]f]IL.)#<)c01<ZVff2.10LYHd+JL=K?DMX/FM[L3J,9SA]&59<LCa0[EN,?ba
@3]0/>:cR(bN,8^Y9#g_WECHa935QaJ3YV.f]H]]W],L_WbN;5\0(fcTGD^8I2e5
WgKZ4DNd.UAO(0XN_I[D&=Z0c03fBHM:DO[-Z[(R]e8+9MQM+d>^5>\9Ud2&LM/+
YPQYF;YN2PaQBe[XNT#SV?4\c5F43#DT&O8A?NI&\Z,9eb883.VgT^U>]).F\Z?W
DCaQ03=0CJ9QY>.TGSUV4BM@HFfe?a]1/g1:f9[V4KL@SYB3<?3#O/Ac43JMUOW_
aY/b;3W&68]d9(E;3YTddDM/6a;6^Qc7E^R&OVR7bU?FJfa=cFb-C+PMM,-BO)M;
][BEd0WS<?df78NS_YLT:S)Z+,-FgXMBK#FUX]-]C(>8=VNP_46NC(]_+X;&)@X4
He++3e#,/[SS4/XL.G]e_SGI.+&J@@/_?#cLbIGU]SJMf.^CUOJJ2,c#:3>H]^V+
YT?[_,a_e9FG^aV.M.S6[,+N:GHZU\->;\8]E041>U_M\8/MN<a,16ZX/(A7CVM9
@H/KFe>C[cfR?HM^_FXagZ5M7UY-QL;<.4c9Xd\B0NA)3WUK1J9Ub/La9DXBQ)K:
UgYd#-HW]L4J=4:d#QPS,Bfd=7#:&7?69QaFS()2[.Nc(ce(U[1RBXUPdEHJ^>cG
OX0Zg=Bcb9E=.PU01I9GI:^52^WAd+,.Ca#F<4CHT)QDK@QR)\fK1J.@e=?FH^5O
2:JB&/RYI]]I]3O21U6?)\CGPCgBJRPEGNOc]EWU9KFVaf8:8S&I/02G/I\/^&Df
g[H1I;UB@,HXFb9@(E7@_aX]Db=3R9P73[-TM&d)8SP1]/2e\b0PP&NO;O#ZD^U1
Q92AO^9FMD3IU6BGLdQ_.B<cTCK,3ZZQ1M-IQbG)9Q3dcCf79?(U8K&PD.dNVB6I
R+_1=M1]6QTcI/>+EPJV+@Q0_I_>e#IS<BfRI=U^3OHA3adXWc#UL>RK;L5M6Sg3
A)KTEGQ6&JK5CQQQ_CX+Gc>]V)9VR):7+:@9HAF0e::d+G_K1WdNV^>CW(_d7^F0
>?B1]R=G[0W?,3DL<BNY/5>OH5O.O6Ucc)=;=/90/AS?C4P6>@dXE2F#TUO^YFL.
#:KBI8,BeONPBURAD)fFfJN:3/gDGM[>_^adH_,</UG#)MGM[&K8^;])[#3?(\IG
M)ZF(_D=#2[_8,NY1KW:P=P>J5Y_1[fb^eHQC0R:V)0@J=HaWbUCa[.YeMU6V;<X
7#2T\@\GPGTG&>c\1K_)>=\Jd,(XEQ8JMALBdL3A(TQ0B+6:f7f^),@NYF;E.C80
\_\S:;F#2LUd^GedGU<JICU2,Cb;53O(-+3.741L?JZJ1U\&G=Q6-/>\;@X-0/3/
P_T5=#5^D^#da5O1^QBTVB9I+F4:=Uc;]?I2FP=HI8JKY91J[COWG(FL_Z2>S\GR
.J0C]69DG=G-+@29(V@G4E4V)11,-]GSS6=^_Pg\5&McD_3S;FB7[#.@V8ATH:JM
e^;^K5KCOWA^1.R)WaS;)5G,e?7bY_.52A&1;K1;.1QH.&Q/H+E#af1-dRLLcL79
1WZ01)XU3+O,8\cVD6P[e6&F4bT&P?[4:Y1_<#/g&#eQ,?D49Gb_dS]]>[O+0^WJ
KQWeX-WP;R_#RSL\fIa(IJB=-SXIA,.7>,aLa1BG>M&&[F?A+O+KPNAMR96.32Y9
/aBJNMD&9Ke,<_@(fID/V2?_SO66NXfdPKJ1gSMa]A6PcI0Ue8BKE@5@/N6+=K0&
Bgg]LWUfINHGT@e3.OU9g.V7)T#]gTHI#EV3;c[-9HY46TJR;8W7/JH>_f=QgL&+
HeL6#Fb@/f;OLaI6;WIFMf-],HQGa-]@Zg<NGOC<(5>CA?ED+>&W1XU6K_?RX6XG
;&:UfI#-EYcORYd.E5?-6Z;(PXV-DcB,H,SUg<?M/[S[K?BO<f5I<#.G#A5B1+YE
6R>dgIR_P?H)IIQ@P6[:MVDd6c[N0O7K_M+_\G@7Q=U3@SI_;M2\#9C/=[f]0eg(
830?,:Q9EJ22Yc[B-KS<T;P@&(C6G>1Q2S@Ge/N3Bc-#Rg#L>?U?\3FLgUVW;388
0Y1f<bDDN4.O.V?PH7SgQ9>J,d&HL.=98T):.NN]VYV(F-.cXdU:<\](b9I@SB:Q
+4P731JKY.B5#0Z++&XSL(OGL^C\fMVEUK+ZDU,R6=VRF]d_>VV(&65.3OL:\^(f
)5MML;>8E7F9]O#6+KP70FTXWNUHc]L&;Ld7C)b&aWRJWVYG6R@#a]Nc)^AT>GS^
Ef2VeeJ(,b46V._98G>/_?bI[<ZSfOObFT,G,UYSMe#890&&-4R.Jbf&b_.c#ND6
#QaVFfPH,5cC^CIgUg?@T)#]2?TN6[+3Z5I24DO(e^XOd=XFB^V(@<HYE+-/.4)e
SHbU)7e=UgDQT\]HLYK;DTNURP4;XH@^?<6>WDK5F2&F7R[)/Wa[ASG?(YZ.J<U[
-:C[=-L/WYX^/QGX-J=D\.Ob7E95IY?696EIRK<AV0)[-BYg6KY97_dI0fJ)KP_8
>)b=W_Be16-46W:WI#?6&]452[^bKK&_La_0;+PGGD7T1bV41Ib(.N9J8S#HF^MQ
g^E./,9NM@WIKI[/W84R_@1Ge,g1_;&UWEE0F+T?gaF;FR2]^J+<M=0X2#CgEe3?
5UKZ<88E97CX]F/K0;?AFe@V;AFD02R,=7,(ZaC1(K3)J&SK.dFNW.-@EYOKf;B-
@)RSCT#0WcP43FOUZ__SY7JVH1\,#3A>3EI+L@8LeNa[4.<eMRD1<<R9KdZYcSB,
O(BZ=5#&;IU9>+0ee)VGIT<OS<EA+RVMVb?OMD.5^cOIWIgO>8.HKaHCDVT[U:AY
U;LJNbSP9.<8IH&GGDXJ+WgP8e0KN#QT]UI.7T)1Wb4TYI_,8F:?\9I^DR0NBd&U
:47:X+3220,3_17+]bM\PZ>SdeX79SJ3Sg\Ug++WHaS391K,)3=\?d>JfPQa9]C(
,;f]R6YQ2F_E-UH6KZ=ZF:R.@9OF;A9BTR8=MWEGMLZ7.BO_VC6YD@J6X;OGDSQ<
#2dTe+\0F1>JXJ;e9>=;;[VDBfI.^bLaW_TLaKF4N6YSA.RW&9<>GJ>525W,M<cC
2Q7#]E,X9]J5:Qe@_12^+JWc[6)c>VXQQXA.YR/Zd/9Ef,b>SC8CGCfTeTdD=O;d
RUQHZ\W8F#.WR-1)9<ZQ7eQ]=Sg(afIeN/f\Nd-^W?-.TQ\GNSV?:JJ0abe9U#Mc
OC2/_Z)4SGOR;WTD&g]=,b(S,,3WZS;V16V,+(T=8GMc8\5:d>\?)g]1TD)H_)K8
XM--O)O_IRO>M&@R/\Se-05S51+X7L:W8]bE:;#6WBSA[\LRM930#QMEX;bg.bgV
2QGLLH+0[V#BKfP(2e)VDFB(YeM4F9VMF/PRgB(B[Zf7Je+4:dNB\L]-cJJ#41?A
SFHK<H;E9V,b#/HL9A5\(/IL2+4AL?d4\P6bBOEFd/f.b;3[^2Wg#g1T76,S>B+?
Z\V6+6Q(13A/LX;,3D5dFV13ADTb^37&gV1F9&Y@NZ7+,8R#e\3\T9YJN9&_fJ@2
a5)dG1TBFYN4OPA[#/;,Caf\RE+;;@QgEQPU]dJ\OT]L__29O7ZO9J+fABF<)BIS
:H^/)SZD>6^S<e32/Hc,SBP3-.Kb3?5=a:U3F2\HPbA/F<3[@dJ(@BY>NfFc77&8
JPM4V?MBFAECQB+da;C1V@d:YbTQXNJANGaeH8,)02EJK&3/;L+5J#Nf#/+DO&31
2=YgZ^aY7K1L[LI>CQbQg,CK:[eV?ANdD(NBS1[.e?:UA9DgAJU^N)SWA_f?3,WO
aa;/&[C<W\@,,2&\)J>0CN-HU6)DG4:RKFI-)Z+Nc2N)I2]Z;6C5;d(=G=g/SLJ4
U]@I8egZ=(4505[,)68-W^=a3Q@Y9=QF4D<J06e.+DL@(9+77O5Bd_UPW46e1Ob<
E>Q)7B02dTE#WG/J6;H//6UEN]XV0cgF0>I#.bQ>#929^VOdd9[3R:B5<KZT1L)N
>Q6<VbRGg0eU8?&P5<cW]=(=Ad4B#Y_ZeAQFc<g-75Eb;D+C96_7HddMe0<]Be06
U7L[1W;(;8K(d2@2O?L.68dH)a>;0E>>f7@HPc9&O3bH.=>3;-348\A-&G2EAR1L
<HSVT,KD7F1gWGR-6WT<?M-NQaWB@3_b&PL#Eg&cQKTb(\3R,&Q,EG3<3ZDGH#DM
\0KW)EF]OUGcD,d:YTF5aVPY_UZ7C4>J^T?93edSaNe+L7H)C8e:9>D8#GOW<40-
MB4dF8S0XGeLW=.H;T)R-3==[>Z=L7Q^,E^D#1Q=TS^VOB4/)0WWY]<b]&?J^[.R
Bfe]XAf_1,<,>9@Hb/YUc?GJN_b@G#@1C9e?P,e@IT44[J(2?CMWW55?^e;VGH@.
,f>\Q8]9DU+W3-]++R\TL5E,@&KYF&5TAV5Le#;KO1L9=aE1A[b3F>H^>PCST2?#
G<>P&&gJQ\2.N285ff8.;IPTV0LJ<ZAT30NRS^80Z&J<R;ME+4/FH\:ZT8^Q/W81
QaDB+&:]R-;U<Y]I_8HUWeH.+9#LFMc@a?Q_\PdLL7U))50M(#KU&M+ZdNgC:2[c
I5d<:1Q(A#?P]1>+I\>GWANGGHDYXe=D:&YA&a[;C^e\/bE^U,&\<=TOf=SK+H>V
YZ;d,e[-?8<CEFE7^f;ZaJ5^NH@=A?A=-g/414NJX:[E[08AX/JL6Q>RJN[>1((C
(94+-[<f[.<=N>TTb4L,]CCTW@RM&4+OV5Y#VdV6V,B.\<ZK\4Acd/C9\M]fgC6T
(?f^OZb3\;XQA:),3X]2e&0I8Vc;f])7/N^@98_M97cX.)?4VZTYH+U#_Ne[C:<O
=5O^PDDNe8=5Df?A_R=YIcOM)VR\82a8a7cF@CD?YI>P9&E-L9)2WQ5&;W(Q@;O(
(Y2HICB#AYG=1:OcVCKM[FYPVGM:L(7#<YAO]W[UebX=@@<KY_594cZ+bc4Y1gM/
X]1Xa6EVGcC7Z@O?(B8:gWX];>gB.S0V#4HDgLI,X4BZg<Lc&ITBY8P5+,W_7L3@
S@[X7\ObCG;Y4OcgYcdT]BEVS;ccbUGM<0HKA9AU0=O<#>U?THe0@fI+BVBK+d@<
0R>:-H<DF-C1KXML-gIQ:P&2f.(#97>R:(PegcZ&1=)e?[T\>2g=K28&L(@=H)/V
aFd)[W-9_XMQX&-(dJMUMZ&d6?9a^XX@D81b0?17IbMDdGZL-L6DJAY=,>L_9A,T
:eeQLF[#XNP/A?Z\O&K,-(ce0cTJ4<=-T>,9?b.>]8D80/&PFZ:3O,16LRg@0aOT
#P;P1gWQ2Hg#H<eM#ReG()@+]<8#(R6QdWT]Pd6,VVRD;a6Q&)-ODT)(3aJO]b\@
d9Yc66E2]d8e=@F9)WbI7B&VK36X#)?eY+NLRM,^U[?)<,+C97g[V6KO6e6#1(CA
^Rc-1_.G6BV9D^[7/b/LM^;>51V1_0Q3J:?#.UB#H;P0Q4bWJ<@dEYJJ^>Q:(U&&
).7]e^NGU]N7AZGZ)3M^.,H?e]=Q247Ta:c+U<F]0PT(2]ABb7bC9B+c<4./AGJ_
&W.O&O&8#JYJCVUb,B<2DHY^,532&7g_OH3C000+e4_?@SUFTB@5TP4WcJ=(@32a
HD^1#=X10/Y^VB#<=cYd)E6EK4KU=d<6WLBGf:M)@VJ.KABCcXS;QeMg0AG9>H\Q
0F_dPIW(CNDA6-25Ibg]/WdE_QFKOCMW5dUaSS?&-VU8YdW,(Z&]53&cJ0L,/\Z4
D^9?(9\^FL6ca]^SU4eV4a@Bg7:(4cDYO_cJ:&&710-@AS#9-0QS9KW1MI=LRR/6
,@3FdRE8P76^E#9&#aO7P6QNUFCP2#Oaf7b/D3_:Y</3X&O0\+d;(.+fNg/-:RGU
)O&>ad+M8Q;\;Id[;I&,[\5AC&F/fT57aB\7>K0_33@2?(X3dJU]>>8M_E>U?PNU
>&^X-+FA;X-1AD4Q@G<Kb15I0@E#X]5+(b7bMG>S5VSBZ>TYT+&#TN;ReASAcPCF
R/eH(WQ=cD92^5/ege\HSg/\Z>U,09^YI;gQK@\+M92Y>cIU?A-L&gWVGcH;P6HF
^Z\2fO<P@A7[.8+8GKMBK)H^E>L^gC>eHdX1a7X5c0V)CH-(Cg.7^(K7dM]R^GO(
[B.aO0:?ESJUIfeS(FLB(;<6>FM1##HMI+^#?::N\N>PLC6<0[OZRST8?4)e@gOG
HFI2=UCW2926.6+\+,^B1/g&GG&>+>M?67I#J;GGFS+S>JeT#:TD\>9UPc[A4^Kd
.gL&[a8QV32F[:f([6H]-7[82M6fd3\7)b#Q:Ya1P58gCFKCA&XV,G2RP^\6c\11
S>B[YM>E9;4UNa/UK+eZ76;O]gN)0YR0eSV0[G4ZV?ABO-c_Ra0@OP:3fIS_/CJI
CG6\\-f\1(,VTH(D\gd(a_TGQ;f,Z7CAH_NMP^LaO(F(9N0^@,_(<Le:9EIO@KNR
B\?VYb(,P_D>V7-7X;-=@]H23(B@ZK9T]&GAX\>\U]a,D1=fB>KV7R=KQPXD#>\>
cDM(?1.NKU;6>=F(=ALHdOQBFKJSaeKcK5e=,/S7,MTKA.H<]0)^1+2,=1TN/cKB
<dQFJW3C_WQGc,0&Hd&A/Tf]I-L^X1\D.5O\UA6c1=e6V/+b,7?P>gKQ5P4^#CSP
^33agL]?6-)d1P0;#^-Yf26/D8@-4&^)^+)KS<(]FB,E4dT9)E3:^93&J/PS+][T
#bb3e&L05X6CK^P4c=\<W?2UFH2[-GK9GGdcU6)U;)^_;&Y\K>R^&.(V1f1e<A6H
;C5I-E6FYbM@L[EWJXO.g=GII.b\b6AYa(6c?eS64K@]D5._M^GaY_4OQ4b</Z]3
TY4Td7NA+#ZQ3T)^42?@\36)/O52&9dgb>[c5Je2#\-VL/N+XQ_N[3Xf]2gU>f3<
ZB#DD1\(3KCYd8G,=<9g&2YY&T6)DbN&CX8(E#,][N/f;Ya1U#XK)<+=efPP/LGK
/?&f[bPF\D=-O&0?2NHRWMf8XdfDWD&RQJ>J-SFYc\8QHQ,9a2fJOCR;d[+-/IXZ
O-M=0+d,4fI7^W(.Ke^_O7=NTW#;Oa/VF>SQgbZ/C75-2RP<+==#N6#N/[;Z./0V
FGDb2&I/G3V\LZa>cG2?&XXIYEf=XS^d:8TGJH?a=4f3G-.YacEA6#Z<dSVU71g<
JY7=3b89.4aWg>3+YQ:?B5Jg?&BZ[\F[(UdFF-V+We+aL.G[I3.c1I_TQ2MX\-LR
<TAP9M31-G6H<Aa)G(SNP@cc=,@E5EF::.aXfGLG=+;N.LOGeLac3S0>SI1=(>S[
Q7)faC&X0SbCX\.>\EVHTWTV6]KL3#X_BLRb7+3a4Sa?YH,W<3@3ZG&^[N79BW=g
-[8&UB-cH5&(d>;B497]9]6QO<;-]a,;eI.9CS\=\V13=c3,0&[=&HG8f19c-H,_
/+O,IMC^V)3LZM9[MB9eTd)-I_(\MP=\A3RQ00HMf_fJ9#.]Kd)TBRN1>YSR9=F&
A0U6d&d4:KSH>4fRPe6Cc20gK/d6\KO?E_>G,Nf5O>#?H<Q31f5ff]]L33Y_.&,2
:8>eL-0J^38IB&#NWdBK]754:dG;KRFJ2cRC_0,GHBcdJ^;@7^gdZH&\G<P+5EB6
SEea4g8T&V.;bQ8@J?H15O2-RL&GfOT-\/BDYIS1c:E7EW4OV\;-e+KZSdR?#FZP
;,XT319-)X0.RS?]I]@J4O+=b82B(XT@4PCe9KKXXGCdCaAL0_aSR#bST2;6P[+Q
<9b2Z8PW(A?;\GD\Ub?dTL)J^09U9fBGZabQ+^g?H6Jb@33,3G+Z[-D1TWcFTV6B
7B-+<\V:EN:f5EeFc+)\>5VF&-gDE:7]VAS9<=Uc,3R=#9O./KZa93UZWgO6CSI;
W;+@BQ[)Jd6gf^B38PCJ51N;bc[[VfROTO:geT3.#U?F/(WOQXUBIU]]T:9TIMN9
d[QX3#a98FS?(45CGGJD#XN;7G;7?+Q@.(-edcVXQD0FWN17J(O5?Z]<WD_10;#(
V/@GW\a2/WAJA956()-CFXN<g6ZM:b]QKX9g@@Ke&^E7.=;gBDNY0-:)E1\HF[,.
3R[4(WSE0S98f9(A6RDG4gCGM+Y\ZULf]cW,[Dc&#<f=b(d6:1,2^]MReB\=a=S8
L5#ab:(()Cf02/YMcB\,DcB\9;c;@PRU+.;:_/c)O,I)D&GXX+B^QV7?H\]&-Vd=
Y:/HW7)E&dV0[])e<0XW+e@60aT_c)ECK.8PY^X[2F5(^.gKXO47<_K7&:1PR/LG
V9DNG;fIeFX\3W@W^GXC3,POGJMAHZ.1E6e(?A5T(4BVF^-WKW21/YZK7G,+OQ7F
GEEEaM[8Te8=;FY,J]&FaH]_6N7F(.J2I;YbD&3)1?K-9PJIOFZf@5L0ASNYX^.Y
K,fZA5_BSWbU.+c>=/?;H=RIS;81eV?0;d,cY2YbaXGc#C+[>Q6XGf,_)4/W<.4N
9aRf.?39XeH:fEO<#8;O_^6]4_HCR-.9,6YBd+IRQN78aN@.@Ff.cW/^)4RWH.E#
ZJ?0\7YW?4WBC@=L3@^D3JJCfDgM+5J3N[Q.0ENa6g6EO+.L\Q;CBWf1FE^1RWU@
,E:QagU(B,SNE/gg@d^VYTM9RY8FSTc1CYgReJ?VZD>809;8\\;,K]eQ5,.DTQcX
/T_\E)6Y19N8/I2(ZNMN<T0f^R]>/c\LS21,TfWMM,I<G(R?RCR:/UP+He3UVLL;
9&aNP5;/ZG>P>4D>C6(\_<R3IMSfT=W3(fHCX7FOSU?Z+XOUA;?d,@+N#HXQ>;G8
\YO(a/cL;=;B:4C5-MgN#(U)=M:I)6#^M0(aNN_[..gZPE3)Q.R]HO3Ia0I&?#01
@TSH>.7dNWPU#+C8EV3/57<-ESEc)/4UL-Id\^JQ.Y]\IYR+Z&UHGY2^&__4;Y,_
F5Gbg^KD&#\3bI1]c6X-C#@TMQUb<<99GQ_)S,\UN2;DT#M860;_;^J^)OA0:4EO
ZOMW^D=5ZU@FFWG-VgDI#4Z=VQI:0<G9_H[]>>?Yd15aCfbT@O0cH8;M8Ie<bFb[
_;5+]#@PNC>&TM.@1gC@gS;L(\gHe^:aUa1)f-J-d6?2>fY(1gIY&7#2[0GU5Z:_
2T((4?f#-e)0J/24S>4=,?@,1)B&6;CNg9d(eYR-.70?03\OZd(L/a[S)0#gVA)\
]J^(@&@R<?WPFBKP_e<UG>MBCe0TP6Z6f.aU&U6e+21egX&bOJX<-2C_T>RD.7)>
[1V@LSdWIYV-R_T5PBX(_e5fO6/)T&E^/b>eU<R=.-^^6<:c:?AbEdP1;-RbRb-<
Q0g]a(eQ3g5Q??NH\6BGO6I@7F6S)NQ)YEc)d8I5)127+AI5/b9[A4eBYYLgc<UA
F.JEdgY_>@dRWgAT4GOPTF//\(/[#FG==]3C1FKgZLLM..7FFA7^8J7Q-e\bK3cd
a_,6:DY22\SY.Y6A)C1Y<V^XGVRUVP;2A?bS,NA)7Q:Z&bGZ&)/^T+T-PRWQff&M
#OBbPH:<,OB[=10/Na\R(@H1TJL:cAbFZESN@^BA4TT9<+cS0aH;+08e5KbA9(RY
LeBPCFPXPP=\.,=,1WN^VK;3[.+aNN#T2LBXB7dQ-#QG.2,cPW&\Tc_)F0:V1@A[
3FW_RbKW&eY24V@+3H8)UTCXJ7+/Of)UX(HK:KW1H)F96NU)I.83ee:/YL/;I>Y8
YNbL5SQ@=\I9\0EN08^@6GKQ3LOd4,CS3N36^)5HK\eaM^;+TTQG,gW>gT9AAC9Z
3TWV\a+CX\NKM4N.OaeTXJ9Y+b6BLa1-Sg#5-((g[D#)IFIX84,CM(FI3a3.:T&B
gRc]O-/2e,T17N:VUc.=c9&]4HC@BS&dP8WaLWM9[2QZPQR91Mb3N:3\V;6DQ@A[
PU,A4<9;GA[<##<5M(@;C1W5UE>A<^fB7^MX#TEKCIRS.f/>Z32:(45eI>E_Z033
PcLc.YRR,ACcNe^>9^:Gc\R0V[F//BeF<+F(LPDU,+ERO,@+EMDR;bME9#CZGHfY
1RCY)JLa=UX_^KU)T7O8e#(&B48,D2,Qd1[LS@95;V(7CECT(,1LQE+ZV?a&8A8P
4_),_F.f2K=UM&V/),Z.N?SRRd?E&_AT^_[UESE\F>R#K&F(@60RDG<6=C:GT-IP
&B^JK[6]bAZ?;)X.LT-bL,12g_=T[^Ofg/S\EZE0@)>SJ@I1Lece_^4c]#ZTG6WE
cd-(,MNJR\M2]?.?)&bQg<WYH0I@OgP8BLXe/LIbH?)_#O_d[S8]_X6F)UX46G>W
W^@4#(QA.\0SQDa^T8)6cG+&GA/<6>D1:eY7]?:/7+J_a@M\E5</ARW)+,Y,HDW#
e>;@c<T+:A6E08K/(<^0JN69^29BJ@_/dL19?#G/cCER<_PAX)(UPfMeOf^\R<AU
Y903a)4]BB@YT:1fLZSaYV/f84MQb]MVKaKVSTb2-2df=.P=D7Rb]MQ.&H=X3MVU
TN@Y&FAe@&(AIKe8I)gWK16gGJf1O-/8b>Rd&=Z<5X@8+Ka01d.KOW=-/QbI1Mg:
<32f&J#4A3GGdN[HeDEY26_DY#Bd]X[(E9?^VaZCGT=FNPU?EVGTLQIOOMfb5g):
I4A,PffG)R:S4+^g98AEFC>_&]Z79f?UIMD/EK.12NK_)SdU=]<=O//LcDeZ63fO
Ne7W(^8WQQ=dH3Dd2ZONI9=Of=1,=VPRcM,+@P#3MI&SWQU&[X&P>O&-5@IVO@?e
&@[A)O1LZ@;C8?]fDT(5XEdaQ2cO_]fKM^ZI7\KQGc7YBJ&Sd2HX;e^OXee@/IgJ
]Z2(KaOS^Rb.-E^3,Of+<V<79e?cQ:cL8)]0L=CP^.eL[-2C>EFX&&77EUSQ04<^Q$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV

