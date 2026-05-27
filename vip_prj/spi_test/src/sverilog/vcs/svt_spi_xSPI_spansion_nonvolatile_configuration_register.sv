
`ifndef GUARD_SVT_SPI_xSPI_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI SPANSION top class.
 */
class svt_spi_xSPI_spansion_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`protected
<TA8d1UZ8=36_S/7J#E?&[8Z09:FdR]U^((S9RQZ\>))I(42@J<d7)3TbK+0Bb^@
-JIO9[]44&2065;/\ULQFH2+PT29-(g95AD\YAa<\QcZKN3HB.VRF_c5)HTK-AGK
g#5JVSeTa0bG\B076LfY@e3XNN.89LW+]9=I\OAAFef&QQ4^Y/DEFTc5P$
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
  `svt_vmm_data_new(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_xSPI_spansion_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
`protected
UdIU+D05=_:E,IC-Q:XIEc<A<ECa,+V->V90f^2e+6?CK0I<K;PS-)<f.^MU6>G&
(Me5Y/]A4I/5U2-3^?(1H^a2R,U;c:A.)>JWC-\TYa(V2JaFdWDK[8+f#U0V\&EB
LD4+SEEF1YWN0?1L8BdY=]S?&[dAd72LMK7@XVHT5NC++G4@5,:,2B]X.^&R0WO8
.ba=cUTQL69,KSS;P]FH#(?#B0,2HRX+eRUL>?QOIMW+A$
`endprotected

  `svt_data_member_end(svt_spi_xSPI_spansion_nonvolatile_configuration_register)

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
   * Allocates a new object of type svt_spi_xSPI_spansion_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
`endif

endclass

// =============================================================================

`protected
\2IAF_[P#S<C3\KMcYYC^\PA+Pe4D3UH@0J-c]#Ld^M>I2>Z@?HE0)UWKDGH;_;0
476(30,5.#LW55[:(4C_3.3dUbLEA3O;Ya?8/[TA(TW,X1YTeE9cX\G6(_9)#>12
HYP)MfJH.I5&WC\103GVZ>N[c5bc</aXBI)L.J&<b0(dY:2O;aYe_deJ=eZRK3Se
V/)W,.#T<N3-\QR:a,>g?3G<=;KFM60QSQJZ:^LB6]ZF7^H=Q\+X/+3ZEMSccRG=
eN>-=@?G<GaD91HT,?MROB(O.6ZCEWX7[D>_:+2&[WT)1a;(RVQ^:&CZaE=;;N4Y
QI(QJ5AG4E4H.L_FEX6:\aN7[1@ET_JU6N_0><CF9_=[O7a7,:N&1CAb0eOa<WPg
;KPYb>T#X3M;0:c@c,(4e&?\X5<E_T8/_.aZ<@^I]0D6b/8O?)>95]CYFB2\C?22
Be61;gNENY6fLeE0Y\7AR;0IOKQ(bUDeWA6=?5K6I#f?.dBTKC)fVdAQJLRdCf:S
cID7)eK[CAFfc89-=\:R>[,P&JK7)Q8Q^&IB:Ye5<YNf51:&82UH)L8O\fZ=Q[7&
R(Xc6Z+aC-^7?SeG+9[-4\#MFdGIG6CJgQI4J.Od(dd:U_/AJbW^M[[YZDE/9;7C
&(b<Kc,L^<C2g:;;A^VaC5-^_SQ#dWI=^OV7-R>L,K&_H]B#,KZRNGPBVC+gYga^
,TSP_Q>#/FZ^P_5gX.)K3F,d2A-1daO,[FY^egOadFSDMLCa3U24XC6ATE]e\^99
DQV^8de3D1I2S1++c#&QUXHIH>H\U8<AK:K\L8bZ#YUDD$
`endprotected

   
//vcs_vip_protect
`protected
HH.TI8GM8G[<Agg3aJ]Z&+1gZIMa_TDN4D#-DcW@d+]>4Kga;AHB7(;C2>]9R/_A
6\+@ZY(bHK\)_>X4L(dUK+<EH;VeP^A?dC.9U:;-&eaD8\;Pc]#9JT2O2(;QNLPG
XYJb>SZGMcNOF/\ZH1WV;WFNR-&6Z/ELWK#955c[WQ?S4UVG-I6V5_Q=Ja?Xb0Q>
@L>-JW@gUOZ.P-]?OA=JQ=<D&5I7VR-G_[+>-9IE;W^HTL4Hd9UX1<N@PQ;)<eD]
HT9cHb/#J(([4&-B(Ce?KY#T?:J9K,C)3W;A+>U:UR3-?M8-3bBZ\Z8N>XW.S);g
GcL8PWfRbZN)0<&,2J476BZM283;UQ7@J#[-_G]f5IZUCN1U\]A=Kd[Q5E1:;dST
QF4Pc6Da:G(K+Y8.=+VPI3JGK9Y65;^YbP2+QEAUC.JYM)<J3;KbcCOd\a@XI/4Y
IFO;4b,L->AV_\LNHTP1c38J5?3ZMg?V5NO<U]+fN,8/?[^^dAM&b,];[ZV)LTN<
?065S89VL?P0X>F=T?GDOD/V>)P#>[]@eQ@F(,CdEM?bZ/,BMF3?6?bEdbLP[,d+
Z8MX7ZWOMd?R@.UD;\/&H.f(^Pc0KfM3(NT0=Y_>A+LFC/9_g-.^X^@G2>aVS0KJ
8)K6B[K<Bec/eP/W4A]4<KP4BCR#[CaT:G(D\bTJg^8E[f,VUM1KHL=?&>ZfOEPK
(JcY_N1W&;_G]NQ_^UcL4S;:.SGVGe,Ee?aMSLN=8X&U+2+3gM4VM-\=(M0_@MMQ
6N3N+a7[65&WGNG(c):\QJHK-,JYO43SBS+7P+deZC=?;I8LZdQ)V@g2Gg[Dg]&>
V&aTP,1.^DJE6Na.;KU)5ZJ)K77F1Ie1:\5G-b[W;bME-FK8MX1fL<b54f:L)]61
KI:PaeO4McZ^C5b/-HX_M8d87<XWI3M<Z]AIH)TMW;ZB3_K+<([Y#Q[B3DUg.f\O
aKWVVM(-(H=NRL=b-3gH??V[2\<,\87WFM+aZc1eU\0ULWe;2H&#C<#?+g@U:,=5
G1]HU]&6cMd?ORJe3(bG#gQEYXLT7^5^OO;^g4ERgLE\[K+P.)3W+?PG2MW:)63R
8L.#SYfb0O\[+)0+:ZC9/Z1GR6CKJV1gUW-T]Qg[>Y.R/67]BO]^7KRgK^[\;YIP
eKBgKge_/0<f3168Ic.Jd/dXN#)H+)<9[Z021<BZC2GPBB]a8MHDD5Z[:^J^3;RO
9,XWb_EK.G#:aK1,YC1RSJ)c9adTQeAQ5)UUQf/F_a51(fY]d?Fa>>8++I^#ffc\
LVe7eP9@7GgC-(V,(bbcU35L6V48Wc9:&U:c_,APKPb_ePBFE?79F#_4V+)?\MRg
=-[<?,]5H.EX6&TSN=b?O9K6NWHQ#N+3E]DRc33(EE:+:1aXMBBWc+T>8IJWD0TW
FeK[PMb,7CMc_;4@U4ZK[XD?4VTUIKD],<6JH]F:;2]eR3TM+JQ]RD;IYcJK?E,e
//dVH)9Ug[WfD0461g&4e>V0f2@KL:HDV>@60\,1Vc1M5aSUC?:.5>H1EX3dVK=P
-W#5LOLIaTbeWLa5A<fd@L_2T(aX)@)-@eF(JP1)[H.NYFeL-BR6K-b@2BL00E+[
dEJD^&[Aa2)@KVc9\X+XST?P_B\F6&61Ve=,--b[;X\(3R7f7F4HW9,YPGUJQC;T
V<LFd[5_9/b7eGa@^]7A:WG+fC7IMfd/./3d[R?[a+9gJCIDc;8E:Z>]0[a=HE6&
0JL5,V2,?W5B>;4gU\,1_?U7S9.+g&\KZ4e]DCaQ2K4,DUYFX+.OP?OdGe;_MI2^
Q.0;c&A/9e#GVHGX>[Cc4D(2I@E\C1(9\U<#F?4)(&128?W_CcNS<9_\>),\86Rd
#^<]f;^9f<OOF\777^a20R;,ZgI=_aSa)+^D/O;QX-E<a\IR/e&[=J1Q+<MP;b+M
Z#g5dZ>Ja]:U-0Q;S/];W0524W+Q1?g@,f5#[d&7F7B_,4eb3IT-<Ld0_Gb&T1e4
LdYa,O#HYVFB^B#:YR^=GN3&O6&TH1<+L>I_>_],WR692ga&Mf&J,JN&eVg_H::-
-^0C0:P&(A1IO1JY:d7Te@K_F4BYeN:9F>g&I=E5<I72>,gJC#I,TD>SdQ,25E-:
(0M7Xg,IEG7^8J[-[:XF\5a@B[P.>.b/IO=edbHXTPYN/:\4QP:R:gA/(Ld;JgbI
_V)9GYTZT<;OTf(3a_,:(T6(95_0DSXV0TaNa72&1CRC)d;Sd1FT9.b(&&T@65(2
&Y66f_L3[La)NbN/I]ZLD;JD,)V;S=?85X9R^[1,T;bP#JbF85I8^SGCT0L>T/F]
T_J[&MJ:DY;W],.\2,/gJ\K[\g6:R=MA,NBFV.+1\bM>O/\e_I>TPa7&F<IFQ)+8
9+_CAeT3HCVCK3a<G&ZOH\aE03D.PcL_Hcd8O6]G,?M]ZZLH@VHH3g:g>@[PWO6+
WecD-HS8-b6WKCcd^ZZEA[W1M#U/Xb;+:]O@4,(56#NA_RXREeFSQTASgD7eI9JX
@[VBc;AJRV7_>#,#?WD-T_U+7#PE4;.&D.L6Q+(O7I#4YQ+Ef,1-C+e:\(4Q+@TZ
ZNaW\E4R?<S7/]Y?]5f=GdW,=e]3&Ba28b:,:=M1G3W+B38DL[d8ZITO<GG@2[Zg
HJB2]P)If1.V;CP.85Q49EH)AA)I,7@ACRCDXAE10(&dI33MPN0#4(e/_^\1_d.H
^I1B6Z4[]>c.A]aG+MSM;2G>LT.HS[I:3GZF35Od3;FX>eeC\AdedL=QHN:=O-.Z
=TM?:=8BZPYX6GfT6V)+D7Xg,Kdea2W>K419,\6]N,NS1\b=e][Gb12@EdG+;LVR
U5E[Y6OONX;I003cET(QRbS9SS1\\E3d@(:M4F8HgJJ\&;X)DL98ES.bO03SBEbX
NB9WO_JDQI-<<TT:d5QMY9E((;ZQYOKCI(>HYRZ.bM?VgdM/)/;Gg3&3]QM>a)9:
TaO0(89UI&@^#4DCY/WP=#.4>GOO(c,fR^:#1eO8+^/N58L=bOU^W/eQLS<c(7d[
PMO43/RWU3XD@]KTIB_4,bP;XWW1Z<T2:Z#ffK3WG2FD[3CDf2ELf8E\HTZ_[E=M
J]F[0KJTX0:\MO,/1:11DE]1YA]#[D3@JbTE.1ZP:aG653K\LcZd?MJHG>TfNegC
KS7VOBA[Tf=GK;.7DRT0YOe,.>B0<YED;D(=4ZF#/f>Oc?_NgATY)gBT8]_0TaON
3=FHHO@/)C.B4SZZLBB2a^X6PNV9JSU(f1&Z^M??I8JD6^d]Vf06^<5&]&P#-g69
WHKQOfd=>#f,BSc5-;ZO+5KK,/L=F37c3_cGV)D+6@W#D-7TFGdc&L&-?]/Ra;#&
NP5E5<KgJ68]W.;1IW<>STO)X35GP2/2_OW2UHD7^eEJEZ^U^a(.[V7aA76O.Q?5
g4;7V\3#,_X&&8G90XNTDd/Q9CH_^0QbWbgG,?9a(;;S9@=dX7c5??[,4\JHB+LO
RJ-E.Z+0^.LPXPdBD(XT0IX7)aB?204ZdXX>,QWZB-W:?UO3OaQUQg=EEUZBWB;Y
Y/TC>]Yf-TSO7]L_Sf:N^Q-2@4X2RW;?YbI3EQDcT[;\((O:.>YQM>I5D8d3F488
X8eA>F^f+H+__f@1&85c9bJAc/cZb:80a^aU(/2HV_OY<?cgK/:.]>P3I=2AXaMe
L@#@<G;Y)1VMA&\1Y3OGL)+I=AY3eT:<Dg(4\288(<#BS,95;B8?.b5CXB09RPZV
Da0=GcA80b##_0#+>M:AFUG1TdbZffUG686BGbG\F:c:L6V0Z@\QF;&&]aSU5e:_
5I232?2K+/NQ72HWW+_Jcf<5)Ta^fAWL=b_UO\CF/?6_\g;&_<5QcM2-?B>?&3G3
_2WJ^&a#dLTG/e[:=O5^7JYY_aX(Od1Y<FgK-g9&42dAY;_-864O[_6d;NK>^Q6;
OYFFBE];=d>,6)VB8FTO67,:W1^93#W=;S,PUKUA;79eg.1<GX6O2T_d285S[Y,C
^76O/&S?5>2&L0[T]X;_LFPHa:&PLWYZEP3ZZ6FM-#I;;D75#Rg4[F7]X?JHaH)T
c>WK>?[gO=:PU4;AA;QRVU>_CQE,eAZOT,21,?2@MAA<G))X^,YAd-1b#N4/M6?-
\WOE/^Z2NZD/HPc5d-WcBFeJ8&b3Z,79-DWU+>Oe0(b_Kb5U6W6fQPf8VZ)JO2.^
\.XW);</R;HU,:/V33C+=SF))eV6e-\_AY2BA&YV</eH&NPG9cB&YZ8#Q6PLfGEE
,FI_NLB5PeI/cb><)Q7LYE>UW0I<a[f_B-Y7bI0=QJ:CBP+&eS,X4-7T))>C\dN7
4;7)V1BH+cF3FeJg??[>GS98(QP.TYH.O)4)NZb46F6)d,2H\-&:(VMO.F8:P>C^
P3D][)>)CQb5(&eCK\UbcO+Z^U4-)^d1L0W=PP<219(HaNJ^Ce7dXRUTOZeT2CI+
(Z,Y.Ec1_:JN<M\J.2GXC<,/+::KZ\JZPUXcA[6B,>JbY#NB5a:6PWM72IH4b5cX
NG<FcJ(>b5R-4CC\)J2fbTf-;6FM@2&@b6&=NKE@aEI>;A&6E.0Z>Da[[XPEJG_,
PE@Y0_7B_6_a[dHD]148[];&g42F<C)W7+R4IdZ@</cg,S9.)Q.S:Y]HAZ<:XOCC
4@9DaY=^NASM3aRMA)]:e<be90H+:R0SIO-QTb&>(=@6?@6S[A404@)?3@R:X6d(
.8^?:=C[?d&E],8/\6?E]-<e-Od.@8NCbCB>EC(B.U^.)E\)S;>A0#gGKd[Y-)V>
ND:=b<D0c.NOdAeKcL]=NEUOI<<+c#I])9SMXbcF2cR;@7JAGCg2ABH78g/b+gHI
J)JMCH4)9QGe#JY8>_>[7c+?JB<,1c4L[_a-_#79bUJS_EI>_<b2KH;>1GGA@,8K
Z8g.#;QF2e;]+&)WS\]DESb)\T]-]UCIf:B[ME?\C]\/gN5[E505566-7(3dIJ)4
6@>?E8I+CD)1O&>@c9d.I3&/3Q_KB-Y\ec^#e=SdT^Q_S^YG.<I>,I[=MB?NRVT;
VIFcL]G7.3\3\\YN#??.,>^/O_JT4gTf.P.CBfg&JW7((K-C,LH2F1<BbWN:(I0g
4Z53>W/0Mb@9;b6VS-[\K?+A_70b9T94_T7MD.=FLZ4b&cQ&C+BVC6dCZ+Tc+?If
4=[Z1(g,]>I5ICH@B:/-LM=[X>EXS)NPLFR/\A+MO5=R]\#V-8/)H7E50&bdGI&8
f;;P_Z#?QCR[GS6Q=bVRAO-LSN2/A)QC5=LWBeOf>ZLFHI6B(CIbJM[,(FbF.^)9
74W++IM_@6<YUca<T,./dHSB<?1QZU66?K1^O8U2?GORPPHY^KOZ[N@)8?Q5U\_K
gJWGZcP7H=KbD^C8MTG#TK)I^K1&B&+8BW7S4/DE:gCDf/gc0C[:VP:[A?;OY#V)
^HV3+b+Q5YKV\[Rc5WKSQBR]EAaQ4g]b>dQBdARR?Y=)EVJUTQ@eUV<.e[_^I)](
O1N_#Tf1I?gWVO#WI\;MVOSMZ^SFPA.Z2IL?7#bD)GA_af0G3b1;[d:)T9T+.d53
[)EH-_bP]6:fSde76Ke]\EE<PO2(eZ1@d=8T:dVOJ/0&5W-D>3MC-^XeLMgSYb-b
X:(Q\W005IE\3MO^ICG6SU3WJ-W:1CeL[8,RU,W_3Q=XZL2+09L0dFV._\C\:dK]
bXCP-+aA&RT#I::6c2FCc<O6XS7I/6e,.&-DJ3b)]H.(HeT-]5DZeF<WXLT1[[4D
U[./L95B-AUNf):.<2I3e1]F&5CKIIb6dY#/E57e?#/C))JHZNa3ETI(Ae/e9.WQ
g@..c1):1UAX.D):&\Ea0US>I=bM3E\9_DT(HFWQVJN]P[cXZBQG,\0(R]JV9@eK
;AHJ=OQI=-NELd58/Lb8bEGc=:d871>H8Q7R];U(KWYU5a8eRPS7Y^RU#2?7Wc3B
OaYL@Q3e2PHfI_OcKc<FM=)eIZeYMeS26fBI?3)W6f/VI\Q8PVScUM17ebg=UI6e
>N)_a0caL0&#Bag==0)RY-1>0LNG<-gA3I=b;-e2_1L1L/)@(c7KAD/94:3bV/ed
gM=U\8F?&BU4[I0(Z/WBKcDZC.MPa\X,WNE4Ub6&[W<Ba69\DNc1DNS^\)=,K9]T
7MN\M+0C@(-\;8B<V7@?/b7fA>M7>A_@F/UJ^DVMI(KZ[)=&>DUO@5>F6De0Y4,e
5(8NaS+20S4-?T4cHP34Ng+[HZC@?EKM5F-.SHc9>_(e0fgAO@X_[QH#bAURIPX?
2_X3JSKd]A?H^6@Fe&QF6ZP0]F@FR\@(DF?8X(K^(WM_8eb)c>7@):b;O>@bP5H7
TPcQE7A;b4Sc5(c7C,IeL[;7NOBHIfgcNI+LACM]Zc,^)dIX(fT1XFS&c<c>)MV,
\NB6g.CE1<W[RSS&=VMB]f4f9TgTRU0<e:Z/9eLa23Xe.+.I2D#HBPTC/DFP6FI1
@CZQTP?=[L9(V#M0=DDYG,Qe[ZW0WdE]MV\3+OW>\5WGI<g)^YNG/;9Jg3RN2^#E
]RJB1DJ@aHT&,U/F)3?F+.1Uda\7R-f-:U2:,A;[\+E[WEW:E=fLNZb:G9K6PJH^
V3BOGVL9[.Ya1,XU3.+;HYN5Af_A[LZD_W7HG<OQ@>0@W/>aS+0O2+:\-5&<D]/8
75APXU<\L6GN(:?@.;W[J8J+bgd(?&3dP3(#Z;(,23agC.,1037EL:E2/<[,HNGC
K/b:Y-gXeG#[+aN]#B4ODGR0\Y/MDC\6J>9N7#O#PUA-dBDKe8C[(e^[R@]CGM_7
(-]]A:#3TPI;R)^#M&=9cI.(UOfLP2=QVd#6:6HcX=A9bb#0V94P^7QEF7F:a.,9
1?[4Q.]EFB,MT(HO[K3Q,b[L,Ae+S(C69K&]10cK4RQ#db&?Bg>#F810\^YOPQB<
b<fHJL36],1XNb?J(84&TE>^=<_[>I7[RKD3E,V&Q;B@)1]1)_efVYDI;-I,?b1f
PPU&UM(\>C_LM3/TP\5]VCQ-\Ga(JH;KM[(TW>XQ0-9_ONV0O7E9&Z:;X3G2U^]2
?J[X4H3DOKM40SbXWC,T(8dMRe)I(CBK1>DJ-O@gS?;IdKLY0NL5W7VV2Q8RL0PA
1:e#>.J67.(5JL,UO[d1Mbb<SUaU\Z^N^VIA1Y0;.(VaG[FbM-/8MV#-CT:YQ[7d
(]#f6)C]IUZTDZD9:W/#+JV&X_/(QIGg_be3-)?&>EW]0)ZgSf1Y;7YA?X6INA>:
#E()DaG8<WE3X>KJ3MH\DA#FbI4WJ?PQJ^40=dI,#+RfG-S<4MDOYe9=0;STI?Xa
d)Q(ZRSV[7;=9@8I70R#DTe>g2W#SV.I^0fRM6Qc?aZ,[-2K>:PTY=3JRgb/..,f
=A@S?-8\GK#=e>6f;LLXfTf@cd@^<9gd0/D88[/4Q7@+[?a4[+7eTS@FX;U[45Fb
T_QN5//Z>[23(J@A\&3\:d\O[-XR_e6+6Z,PT1#UJgc1G/A,JPJ)dR6)()WT+,_V
_S6Q]OKF)806aTDHb)Y3/Pa#0YM5+F6D3&,98XFQB&]]2V<V^/LJ??>.X8,M)79L
<aJNREOOTLG4SFX8HW7XSI,8D/gLC,Ya8+Q@N(VMMTe7X>+S/(.VVD/VX#IBA\[L
Fcf9e+W8[8a\,:1A]0HO2A_6EO<;3#@B,FX+O8E9UW=G>MPH/S>#a?Y+W]#]+(b)
BA#C\DMOVM-#C<:+ISS&+OgEHRAH<_B61EDK7^&T/R^?f3AYV,SGW(C)&)fE)@cO
Y,)1?5MY#beOEeXAI@W49J#Y4U[Na?-&,\,HWJgBEc5Ob-e/M]YV2_#dCbCS@b<Z
+O2/c0FUNU6CB7-HF1[WW291]bPC4FOF]6-OO,TQ?eM7QQFYNNR._7X)\9?+5LMJ
BM+HVGKH1Q4:d4-UD_bfER[ed\GV(eaB\N_TY)PFT;8+K7I^bZKS(Na<@EXW<a<f
Y+A=)8ZbG(Le2ggFWAHOBM72RSK73CI([egT.4XD0]0GIG4G&f0RUSbbM\F6-)?e
g6^QVSQO&2)Qa@1+GJTBSHIY.b-.4R,EJ[G@aT-1>?CddB7BRL(O;=gd\.(.8ES8
21F>+;BcI(<W[>;b_CB(-YbGX>Wdf]RIU7>fUS,KY@;ea>-(M_EOgJHd,T()2[>c
&7QS0WeE([YIBH0P=D3F/@\/[HY=BZ/6S9JBdOddJV03G]I3<S;8X.IDPg81Y[-N
C;BRLMWa0a@e]@\5gQ^,@daK:8@Ja+DLS-LbY(OS1e9.Kd_Z4J7Z-/OE?<gEV^7_
fP^R,\bEM+6DH/d-W_fB#3)[Ya<U.GaTCVfBH:^0e\U_UL)?71.=-A]3-2M4(DK\
8ZBSS3/J8@EUGSa_SV)b_e(.B2#O#L_c\g@)P1BI?G#T>]B@c6[U9YUFE1MO<YBd
8eW5<&Yd@H-BH1JKC:=3Nee#6DTG1NJ+g?6ND0^0FBHC,B[^d+@E@.P=FT]_&B)U
F0N=98#2\5[]FB/)AJW-c^K9b99b9LG[/N[=2JI.]QfFD#7<PgW;8W:<dP_USVYG
>fP6SER^U.69M_8Z;IK(DMeUPB>KLTG+^e_H/J5F5;g(R])V0@:g0bTZbdZU>XN8
PfAGc7N;b+T^NTYWV&A26@bbO5E<7=eg5O?ZV7<<H>JR.Y9?Ve[+0ZWc.XV0C1K)
8AI]C(9:e7Of_>&9;:Ld,3([LQ^#RIgYLZ/2S)CJ(TL,)PNA=[UgR1RKeIH^g-3U
MggF6H\<J)X]]KS8[4c7?/XQB:72OW_;9+<YVKH#FgK6XcLa_08OD;d67^a.<&-U
_7&1+-\?VP/OPD,)QaV7.2A?JK.e:4@5LNQ:\,d:B/OQ<+fUU:GHN_6@P^5]P9=C
aHNAZ@:eMFJG[5)9H;ZFH_eDFU3gW2#==&E/WG=N/ZY:F;9;<HMa)^e=1>4)ZI[O
>)QRPN0_.g]BbDEWSP+N.WW.Rf=d2agS1d8d2@9ZL]>GD(QgJG3:BM#Xb@41UdHH
1QBA;2/cS.-2bW2Kc]RGa\@D3<\c#F]Ke],L;=dI/XE+8(DT[#Z(UJLb\=5NgOV=
J<ZQa_f\AeaL6B9J\\3f/@8H8Z/SeS:[)+V#KJbH(D^H@Qc[\Ab_I9E.:;MK7O2+
,/\_I4Q4\/]HUS(^=+JNKc^MR/<#BR+@cY<B6^V0Sa1SS>>#BedQ#-b8fUaSCYf7
CXdP,=#4JW<C:F=@JfWZ=:K<K22FF)5<UUN(<6bO@FU^2?HcX=cF].X:7&IY:Q-0
fH1d)efCPT./dH/76PT8d>>:D>]^W_7gARU^5;g@M9[^&Z&6X>W5;#O=XH+QU9VX
HUG8)eB0,N>Q9e:I,0c56EO;X,TD4<.e,U4P@@@\LT2[1J2I6;<T>9OAH&2W<g9,
-\488?86H1+^VQ8BD_7,Mb?38QO[V7?]c;^DM#G8^D_N^^1dDS(/@T:D0LP&OKHc
f<fLHWU<:b^X/V@O:[]1AO[HD/@@ZSFI))EUL<04:6Q9S-4>:KOJ-3AQS8QZ3Y&;
WI@3bd_;R&;eD9W,;92E;LAMU;&+\YNMcf,WOA3@:2T7?HIcgA_R>:O^]_R+:7HU
<.P[-00gXfQV;CdXbROX[6aOG\)YAVFI@2YK9T8;TeE\bS-.<N4QKcddKS8g(gYK
(b+eKV+JOP5bR>2PB:gM,c:4#>e2K+L5RKaX;1C6,dB4d5ca+]-dFA_IQIV7UXdL
W+HR293GF8CHV^]7E:f6VFW-[>bN+3-,XLTLWR)R3HBcg[]H:ZCVRgK4OSUg5cK)
V-G\@:3H_+MFd2X>B-L6MFdBf,N&1VAFbc6UV9[A[DYE>&&5ZRE<Q6VXFYZYd6X9
XN#2T1;-6<2L+4(KQ]]:T94EM<Bc[XNf(P4_^.daE)[+4V@N:WW99&U3)G0CcDa[
YJU3DVW>>UdO&&Z954RFM_9E7YYagHN8=<;gL:Ug#P3797MC7K1VDF)/19gTZA6W
.0IPG&&D0Lg?ZZG>e6R(b7,C2faDe^S?DbVMNI5K+T.7J1+G2#+LIFPM:B5@13aQ
?E?>RRfFK90GM&AW+@f/>,O0+423/JN&;dgCUK;HY)O^EG1ABNJJ#6gK)bTUPOVX
C#OV1S@=:Ff1bDO.--8UfH-[XDSVbKb[I]S(\,?..>=dfR+L)aa#:=H#>L+^@OCA
0N0/O,gN4\PO]25[dHC4X0_]@#NZ-,>LL8/5X+33;&B:3V[NfeL-@&0\:WFMDg1,
.GeOSPRgMUa1#^G^X1C09NVBP79d@0WZU.,/NPEW+9c\TNLQ]/6E2N,IHCU2b)AJ
\;S4R]S;[][.81,B)(\fY[V7^<;B&P+K))+>.3e:CdU8M>\AU-5K22#G4NOAc3V\
6LO]3?3fU11+48P;?ZT7KGA)UR9@:HHC[eM;EYPF2X_K1_?[NG[MRL[]75W5,CLZ
_=S-5/D+V^WS/<1&821e6C#3>@-7+H2XJ5VSDRM\/9Q;cCDUL-NROLH\d_M>1EHS
Ig6>a1,_1Y8?.f<2,6(/#S9U,P/gG.YMf+EJ,.]fMTD7190IVZ(90d,>)A?cE)DD
P-@V\X)@Q8]WcG-=f[,L(TSHa_-+,bPK(7ca(aJ_>U#(>b5]0+2C^Na[b?[8\b,1
4_K&,@a=G[==E6K_DZ/\,YG0gL.X^8d24__0f#FE#L6VfVd27NHZ]A1S:LF+X.LM
J(e8J;4?6\O)Q(F4Ae3]K<DQK1K?G:=93;gbY[M.5E-LNXYS@).<W&1F)YeE+Ae0
3\(LB/5Y28Y^cBTgFLLA&L:UW.f,,1F,68?URDRT,6ce11MXJ\8L?Y[fH)L=40I8
X&3:N)a1)NEcI&@8S5^8A=N.9NZ>^bU,IO7W)<dMf:_7)/7#Z7]M+8)LJO,UJ]3;
)(H?HfC5OW#\93+I6e913E6Z#gCCLPNN\7e+f&M/9\MX[77OaFON9Yg9/SbJ[7[5
6T-@f;9KZK4Q?5DGGbZ3_[\O^TDQ8K?/Q;ecHde;M3J4f7];Y2^8?FaeM9CROPBT
HS=4g).\H,GOOH)_?)<B/]e,A;]BI_d9D@.C<dZA736^7QBF,?1aL4@4.eW/08EU
(HQ1Q4gJ-Bf7D[Qd0OJaB20F::1CKX5ege.>\)\ML674D_CX_R&4[ZX@_QBe2&CR
Qc#VCF,G,XY9cSWU#ED&Ze45/29HBVgfd=SUK2?M-)/:dF>.7XgX;>-SE9=6;9IR
dXJIHFK:Ha-KX#U]IMQYgRYFPDE;IC^EFX?;L/KC<5B[X^[8P22EEFTH.3E&:15=
::D.,+LQ4Sa>fW.8]6d-#HVMXS(H;=bI;\b\(+5?<+gLFbZW)F40bJ?W8+>[3c1c
(UWXX,/<8:[QF)K[.1DXBegS)eA.,RGD5Z<#E00Y?)eY7#&R/)L<MYZC1=)\[&fa
J@LaF3/ZOP40N;<GI3M.R4I9FHO/Cf^@<=Z)=-bfU6NWH3MFTXBL+(GP5+;84#H_
.=GX4Wee,6C[8M6&^Y8>fF:CdYc)b#gBIe]XU+,)-U=>=\Z;_Q,X/645N9\,J\[7
H+bG+@NZN_J8W.\>Y[Sa(]N=_FGKaS@d8<N7ebT:(L8A&cQ@GGdRQ@XfggIUdNCX
?<5+Q4)=9UWD+gE22bKf2)OP#U6WG6DNc<,aN[TY3-g2?6_#]1J.8C:PSA/_CRWa
ab4O0e3bJ;X&R9QKQKQbV/d6/gecR1?A/Z32QbgBR7f#AHO+A+=X#^:<W4A:f1-?
8)UGGc86fe)3O/cVR-GfHRNN,KK4ZJ8YSQf)]9F4.LP)Y9E[a&20N)Lbg+<IB[Pa
#&XG(Va89E@F/2dJ]-+?YO<^5FYS\?>D-N@_+A-VL1Z2V42YL_;T5D2#&T,-QQ^\
JG5=)JN84D)cO)\B6_Q/M>e[+^S9e)ba^O&-deBPBDgCJ<#FA5VP6,-cb1F@ZS6g
6QR?BedMEg?QCF;EMW=ePLFaXS-HOKLKA:.AOfZ-\(^/Rb5YbJcUUTDdbR]bPF7-
UV\+:-&QGD<:3GbB/L.g@:\_4c2e<+@9#:F+9:[g+QGQ5Q<E=Z13D/1C(^H(&T@O
dg2A.F:5?KGJ3WO,DC=5\Y7^27SV@+Z@M\,1H>QSZ2&=DPK)(Mc/BU)[8^Xb4g>?
4,Gf]bX_UE^?K2VB_O\+5:S)<3>?9(ASTZB_aA0)5JL=VLB@):&6/ZNG(-I:g6LZ
;aQEL#^JAQ,F#L\]b]3<CI&5<?;:e&3]EJ=_B?fAVU\]a7G620W47cME<<2TF]V<
IYZAE(<Ae&/#H>cRRV9MC4Zg9H.5#;.?H<=cC(Nf949)eQO<<9^g0MAU=];09<:5
#1^a#d/OOTCL<NAWaE&P]aQ[A6Ob.5PHD6E@BX.A8d:SEU-8c8J5LP(;C>ZI6K8<
4)AL@2F@VD=W57:GV@X&b71fB+0SDG7,9M1[MIKaVW.[g[AH2YSR_:7LQ,=\=<#2
3fRA&SUaGDV>Hcd?#bE+9=(TReT(^,QLb9H;:,+8+FHK(DGM([<(N;UW#@+TZ1Fc
@-B4W1EfP+VD+Wa?]McVVE#TJP#4H3UO>C9J7>HSKYT_cYfM9&J@N63?UT^Pd3IH
_WH7T2:,&c^;BI1GC,LZKXBWI-c[ZF_\4a9^>I_B=2]eF7,,(^O3JOT.@#)(Z]N#
>.5PQHR@?+f4)BQdAaF@#GCSY_RK0Fg^9V-8>>.c/6W>BNfY(0d^fXd/R_cHeVCY
QfQHB#?AGgT@XQ7fO/;A/M4H7<B9EQ3\S0&J;N>M+:N7a.R,W/cIG#,SPd=ePOZT
:FL_T9+MZe-dc.eQKJ^3:5@ANS:3a>G<[JXALQdCH(?^b+VaOSC1Q.7c>,-a9cS+
:CZKCNL[E9@F(3IEc#LBVSgcTO3C1G4dE-]c,=7&Y_aJ)A3I23IgXQYWRe;6#(#@
=3J&\bUMId1USXd+UN0AE+&L@F6;P,g4,@9?f<B?;AgcQI3^:GD2(S;Ge(P[(\IO
_&@Pd2TV.^e\9,XKEZKf(I:TN58OeWe)0#KZVERUE<)-dBdadR<)T]&PUaOALG<+
EEJ(88Z?@8J-8P7eD.>]+G<(E3\\Y<NV,Kg\)e.g&(?/>B1a,)5SK&D@9=:)Se+?
C/]<2Kce3F_\:gc\V)VD&M,3FMd5YgKIVR7abGIW931e6E<=2Z4=5DA:#Qc=PCOM
Z=KLJf8fLS2IeJU)6bO.,b.e2F6N6(g2b?UVPX_EZP_:996NPFZF)gS]?5eF4,;T
6Z?+YEBAc;91/b_BAVEZ@M53NA=(O=FQeNQE:P;GN5XIA,MbNLaH_P0TR\XQ^C9W
8-I]R-6<La<F5eAKQVTe9I;Z(?_2g2;bEQ_Q4=K3BZ3(2WJW/6?YRFZMO51Mg#6#
aV+OQIYY&fRO>4Xa<W.3G8R0=P2K(HgXB9f(+X@c^Q=a^ST5-W=9(cLU.(?AW=,Y
92\[K/d)3(c6ZPW5-dRKO/[KT1b4[;LeQX()V>28\Fd4A-J2YFE]UJM\&J20E4.#
(LTb=W3>?WcZ,fE5ROWeI+&N(.H/-^.;PM&P>JG[7X9]Q/.5WJQ+B[DJ]Z?VWKg:
?#<7Q\MWQ>[4D\GO9_X6PMVTAOWR^B417SV5(R(BeM=TI,@[AJ.N0O4OdEWSP@=W
=E3e_<IHH@)Xd;g=HKW=M:Q=c#@d)W&U@ZHK3_LSZ/P>,OPGMAbAVL((ZI3(AQY<
^6T(A?aa8/I.SEUg@b58Y3/?e<O9eQ=-7,)f.5MUf/<<\AJ3BI0>?&1,UMI^YAeZ
.=aA;=P6\d:A33_91==,)](#1I-b72-D8<9,Ncfb+/KcBNI-8>H[I#=1cUNYO2G[
O9DbF-/&SL>GUKDHW3D^I4BF<.a9[FBT)f(f#_]T\DR)3@S)0N75/3fV9^N/1ZTR
B=0Df@,3_)_+L1.K&X@Q0_)-d?Z_[RCRQ,C-8?YD(,7I2[1L:DU0+OU4YEBXBUQa
7J95BMgKH-dYeU,W=Xg<H6N?#OF=b6A,32b-GR0LQ^(>PC2=6K?GGPfA<N[5ZQI@
_P5/LBN<6L>,Sa2=:c/V6:G[]=,NA?4GASaM?D_UT^=2H2&aT5#7VH-3S:D\;289
=+F8E\d5Y8\0E]A),Q]S\4-WfQBPTZ?a[G8F-#eC;6YR,B1+@A\CA5CWb<<(3;a@
^+_a(:cfP8<,I#9N9Q3^(#).N&&STgeFD0EB\g]^1.AUPaS#@N<@@CFR>0HFUdb:
WHN/Uf].>LLN4^fO<2M0Cc&>K@3B2D[\4aNV.VcU8.\L_L^d<3G+6Q46\QX&OJC?
Pc4B=<17>(@(;(-,08b1TH+G@;Q(G3&2QIL0=B?J@gbTRde\>MaA<GDQf&CQMDCT
U6UPf4>&/[:OSae_E/Xec+5HUN[R1\ATKdESSX34b34XGCN;#3c)V3+:FP38R0a[
;54R73=^[99.X(.UZQPA^cT99Ke(E;(g<2F0(XcQ\aRb@Q7ceO6L;0EaWYfT/a;c
EZO>\X17,8V?]+@9NLQ=_YX.^JD]/_@>M?d/_,4>>FJEIR5E/LNHOI?(cA&TU35f
.8;(fI9,MY(??;ec9XP@WcSP&TfX#E#6QC1]^+10e@9Q]8,DSTF&d(^V<d]?S]R[
MZPUB^Fg2E_Y^1\3WC&_QA,UXM?eA^BRL6?(N#VER0BTN#B:afb]4;KC7eKPa]US
S]T9Ge#\Ugb#7,,a2?9V:-Be?]VQVEZFST]8H4OMfX:K]F+=;B<cFc<gVFBRVVb6
bI7cLbTD1.\XWZHKJR#32#8.]#@=Yf)?6dLUL42KDBK#PJQ>=6?I(K;DeKdgS+AA
Rf33A1.YSS?aeUQJ51>)379^/A5WLQ>4?c0eHdBFcC^f0<84Zb+.ZL^4bGV?O:b+
b@DO>)?8^5>S/?]UT2+@<E<W.+Q7<1\(J:FJTfb4OdIc^c],-#=8/d[b&Rg<_C0Z
Y-bEMF[284MLBDFgX.gaaSc0]dC4#[1PE>@YO-D./UVI<8W9?8-Gg)&G9_Q\VeMe
2K(6^@.W2.dFN=F\\]G^3AR\G?W:_F4P_QQ\:CTfU<HGFTM1>O=e:;db?L\f)[eH
(C6cV0T;PM])&M/gQP4^2#)910@09;RO2>FWP-CDZ1G&D;<b@0@g<a5]-C;F+c)O
I;RPQ2C8A#99I4R<XUBc,H2^FfQg8:,Y@+YX[d<CcP..e>=1L.GYYT,1aQI/4\N/
\Fd7c_a.#T9aB:^b7L3]bT5Kb#VB;6Y9K\>[[70FH\:-50D0,LO-STGJK--bL:<I
d_CL7f6Lg=E(JZ/K=L-5^b<a[M6^\VIBIPN>P_&I&#4L\S^-/a1=5#?1TQGJ=8gU
X+W8,eKg_S#eL(-E1[C^U#A.C2cS_,QSdJ)bJGb)]YdM@-OAQSIe]V2bGV4#C=5=
.57ZQ)]Kg,ZS9L705)dfP\.:b(9]N>c2O?g;G1V[_RdFc\WcW]+R#IR8Ac669&c[
N:YfQUH,5]aA.J63AgU=.^72,7a:IBUJ/(\e8E8GDYEZBb)D9KML?X(=fGQ&<0^,
0Sb0#f)&b4=A:6XEbE+OP.K##DIC]fe,_5aX\;]NC4d<5HD;42?(e:+B7#HcAUUB
R(GBUP?3.?)eNf<Kg>J@VX(N1>^>M)C<Y\YfQAdIQQ71ZXF:^.]^2J[=-ZF<:[^Y
>9[N?3g9UDHOA+I4gZ.cfGI7SBLAcP\b4LFXH>1a)RAMSD-77QKb6AQJGW8=M&1V
@VIa+aY@RcSB^;ZFZ^=C.47V;^+NFO9BYdJ^A@4Y5.YL85XUO(;4=+T;_T^gU.@U
7\>]2:Pc045gM27+&K;T>1EJ;5H2C-F2F\^T0>RY^TSW3:0B4>#[2V-QJfJF?9.5
cH@F-6X,EC>d2/WT4#GA89P@a[e8c7@-SU9fcQQ##S)[?P]2Y?0;]B:N)5(Y@HNP
7a.KA,>7K^G]WU],308LS]A+X/GLBa<TAQb+\aGO[34H@GSV?P_BbVV8X:E:RLAg
/8.[b#XN15]1OA32&KceI:f[^UL5#7QF,/JRb,FTfPNB7GI0eXZJR?AO</&eQY(4
]K9GL3Xg#+f3ONW-N,0DQ)F5c8-Tb+).W1?-cREbP#E1;S0<5_/G_b8<+YFP/9T,
=Xf]<YQ2c/4E@6Z5=OEQ(4CQ;<6=b]U<?>A:-:MOQ>OA/S6-PH^^IJLJ\(bQGUIf
W&1Y.(DP4EaXI&[_\e1ReOC9VCWI33DVc>1J6Xa6NbCB_&U2Vf+;UD334_Af6RM+
#&G26G8.c?1FT6#2:SUEWf5&3:?(g?L4N5H956)VDKNBdRKe.XVHP5Tf=]Q.=;>H
e#X3KdNI6I&/1]FSJFYC^JD1P&g6>\W]<(6#R/Q#dPeIEJFQQCGB;?FH>QY0)CFM
(\C0GR]RD06KAZfF&5D\-e/<^C1BYfA1SQ8,N^(:XFM6(.JIb_/<L&FW(ZR(:+CE
HQ3-IZg<XDZBVI]6()(aQ(LHB2>B,D++72(/e511E1RZO)T4C^eVCaT=&6#UD>;/
[RDKAP3?X1_6?\^_@=I\(aASN+.#7UK>dZ37.J1gg8U=1G31RN#//\TUS+[:89B)
&420b++]Yd#6#OVS7@TJUED50-2RfKeI/UJaJZUT;./>G5=ANLFRXX:W;);QBa]U
]C-bVIW#6+V,2T,.<).=0&/.[beEJ#\NIY340KT<ZVK6g#OP&W]79dfDBCYQ7?FV
ge;Y1.ZN:0R[-b)@U_f.VUde_J@:0/?/WgOZ(eQ(^D=-gcHGDDO=ZT&4YX]&ZU9e
a:J3Y9BY(cKKFY99T5T#YgZ&)TA2K_#K;<ODb(4?_/0R-RVLCYRDe,9RPOd#Q\9P
M2QQ1PFIK:F]LXf.B=<@Sg\M=8,>FY=@EV2:DZH_cLd?5P9^EW]G;+K)],OL09&K
1[JS@?aB66_Ef@3ON4:eGZB;^.NMTc;NO<a]V&HDbKZ:233fa.5P6AP<Y8OIER@N
Sd\.?)0VK9J?(DFN;g=THcb8<4//^&BBTKV.Dd9_KQ\-,:d,7+N#bBa&=C17(Z2S
4^(=TZG-O1b(4R(_W(9Ac>(T8WKA?NJ[1)YOdI\4FZ]WZE.90_Ac/A_8f#R;4,NR
ZUESf:3]PI#MFQ1G^1HIgce:PB7R9D<f#_2_A2HZ3CG\MOTXE.TC<d^3&=d@\a@6
GJ@28)U(U.XICH?SG5Z[R6<QeV///F;M-DfGgb<A,S)(0Se-#)M-6LO.A[8J:&ED
/6&5P23HeNZ1+Kg)R:DCaTW)=>W&TMKIbO(X(MLP1MJfBZ4K<ZZB/QeS9He8-9Aa
7(bXAGM5_AS5#F#2cfM]9L)&[/=B-X](?+;IX^5J87N&F2(@W4W1V_,PbY26)1MM
Dd2^9dW;M3N-X)F6d(f[5Y[7)S0/IQWMQH-Bd?6P-.A/dP<E//\2J[[)Nc8/8<c_
]#0;8a1L>-;^2&/2aJf)+4YP;/DH@0=Nc@CfK0#2@S+eZ4fW?:JbZ4b):W)MHQKc
=YR,dgALIL)6^@,S03Te_,DODB88J(gG_cP:(ONH[,b83:bR_(^\ELT-?)e7d[A4
QAS.e@M-@0=1TTW2RXKSWJK1?PJ)JMEWEg=YMc8<6_Q(Oc]Pc@]V5;V&0G/M:1CQ
NK8;]>+]#UK=LI&CS(R/X>-TI&BR-SX,[T>DZ94_+DbS+X:>51NWGg-gIU16Kf3Q
fe<TN[-BWIF=@W8M.McVaBRY@IfNd:Te_[9\2&7@<--e3<6GP3J.:HgB6A1S5-5?
25SL_0O5[-WR&7/,S=?(Mf:3Da7IO^0/OWgROf[ObG[cWP#>\V66YXPXEa_NLK-I
&#:?507;XWKQHKRc5bY]BN5@-cQC@HBa1M>E)S=Q);?NI/7S5][eF4S75#eIcFQ[
[<C&dZRc7Q5T-K(W7##+ORJRcD[fIgge15,;Y,.-RP2BV49SGI\DTZVX/ac>cf].
gQ1_-HLPBe-]K-+c([H=(AQX65&aWL4E8KdbU52V9==F3f4^(D5ROY1SV>->gX\J
6eT+gJ51?;9JCA1E?V517(fK8?H#LYP[5E7Q=S3[\NWZ/)?FN>1)B^M03VVFON<N
_J31EH1JEDSfcJc.EQV]HX7&OF5@11,0U,3F?^@1f-ZLKgZHAg,K74#EV59Q_d;_
2):W@^1aW.J-Tgc[SMJ.bKAbda,3;4S5CSH_UFQ@=E-Y++\0K3[&CP/ON73<VGPH
G6LRB#O8RF72d+5+C,[]IPN(-4a1]3f8?O>Z>X+#d4Z+7P:]0@FNJNeA7JC9>5/A
RQBCW@IJdRO(&KU:^U9C&E;WK;].HQgG1()/-ZRO.X)#gED7OQQI<;A]?6OS\]C.
L.aF\RPKMGRTNIIMZaJ1_MUQ&V:-Z[[Y80/@bK5[_94+b(=bO_NOb5_5=S1]XYFU
#N?RE4gbVAKa^C),&.aZTP5Q<01;[?Ke:_/+[[_5,>9@4L=#MS(dL3^GU#_))CWU
N9O<-VO[A@7=3=[g<NH3bH?0eMCgF<+6][;B.#1:J?L;I.c4QA59\)TK5de+4SLL
+4M_N;@4IJE[?cKe;CL^H6C<WR^1#cM48]ZGeH7&Qdea5V[fL--([Wg2]#]KB:#I
<&7=DDBR^aDKePEe)Hc_4[b&/HJ9ZGEYX9AcGCa^=^MS^5--X-eH;./:<DG^e]J:
<&0S[/9@.aY=4X=)Oe:QRd#W&5(EgLU2U;<K-.OXS>;b3&FO;fN):W&&/=S&C(d^
e[3A[--c;WB0X-4K&]a[Abge>g&gg5N5;]^CPF>:cdP[PL5W>G3AONOZ916.XeJ0
/b0._7Q7c.\4^-VBEFg,<::-<aa4aPDeVfJJ>O5DG(KLK^WdV)&EWS9bX<O8XFMa
#EaPG_(f:RNFM;<NY?fA87X+C2dbG_J/.]LEaXBMf215ZPb@^GD])ZZS<L,&Z/,1
;Q<JDCQE5(,eZ/\KBb?T-2+-&\6H#S]]X^?&TR_RZ8J@d_0&FO2Xb8P4Ra8aCf@0
O\1=\_LI+U?QE0BQJcTH:LS]9P+Y^Se(bEZ)1</MWV_AERI\E&P5Xb[G<a2_a_._
b2S/S.MWE8;AT@<-X<G?(9AM6Ub:HN>2PC1/IO)S\_WKbZ=^e>M6[N6Y-05+:Af<
PV<@BfNI;Q1aO?4CG+6]UE)7H.Y4/^6MeVDaTFPMD?aa:e4e<^+M@J3M4HdMKV@G
X1f<=JEE-42=B+LZ)4D)2C==,9HY.=XC=3LL1@;69g_PS;=RE9O[S=]dN9fUL=4C
:-bO^&?,KO5UM@8IN68d84:8P,>O37#AAYJGSD-[14gfI)99B@@C-LXAc30W#0W0
dIF2CFe4a027XPe]bR,?1PQ^)TG\a#0bA_-<:Tg=cg0e#UPg7,FJf91?LXCVNX+X
fQ/08OX+<f420YZTI@#7X8#X__SbT>,I67AUH6N=fFfV5ZcW&e9X8[.NQ9ZAY92a
.;PY(9UJ57fb[E\8;eY5=0Cba\A<#bKDUT0C]O,A#=,T\.YBDAbN))-)L8@L;W]U
5MSX8I#_[..b?ZTZ7X_,TOfIGYD@,1fOA#>HKdCW0LU=SQIdJb]G[7\eRC.@25c]
eSYDTWD6>@V](K[O31WXT&3D]CDDD]e3PD8-8NU3<2[;N&VgB5]UNWTE2Ga,QU2D
W).Q9_?]T79<XeWBgWXC8;4XZHB4TKTafSXO&1fU\2;O2+@&&MdWJeU-_&OXAV1@
[d]1:BTJKaBXd@DV,,a:B?0S+88ReOPAD[]//BR3->N27ZLD)Ad=g:,43COa171a
BE3=O987IU,=(DBS]@SRQ^fZ41SHQ/;A=3\HKdM2XZ8@MIYbPIB1\>Q&f5),fF4c
J\4,/FH^B[Ha4SNP7MQ>M7U[S5IV<UW2UQ\RQ;@^7NADd^;^9^E@C^UM__#S(d\+
ZGFECC)Y2C9@RC--Ug#:37gLX>6dQdVbFIB2PA\b.5[8)a,e0;F8XD,Ab2bN[6<Y
OYM7\TPXI4Pa0I64NRaaJLZ<A3XBWC+(7C^#)O)HTV&R,\?LOcL9H:g:)>.^\U<1
b9VR<TKZC4fS1G;Ag.H6ee=aGA9J9e=3[N0,-&Z5SC)</:=TKNV(JJ_ffSTG-(W=
VCKG#+V(EF_dYEG1cA0U=VQLN3YH@@bA79=dc5(4\P>NWQAPIUf;RWALe.JX)/)H
\_0(6&2B;8@E]WNG;B@cA+Ia0Z^&A31Z/TQfTRRC++KB6S4?^7FGCGO(C<3Y[0d>
(+I5BQZ)N:9;GKSb&Q;(W2&1U3R(:E6^T[#)f@1N]Ta@-TWI/6daLAW:R(Z9Z>_.
f?b+NX@O\\Z1YS3ZeQ?@L8&BOFf6B9EZHDKS=,ZKEg(@J=Tg\\#AMf+Q3Q=g53C,
+2OE:CZf;@?755@X5_eNU^:USVJD2P[DYS#Ie9UPGI8Lf4U2:JV;;2b,gd[V6[D,
a;6I\UMYZ5cV>8^V\2S==E]R-]KREcP/?Tge:?FaUOdd15DL)B@Y=7LNKVDQ2@,U
OEC)EV12Q[0e_AH;\..;?)9@?C1_C=BBC,1;@O./f4JCX\S<I&NIfK@LAY7g36c/
21KR6IJUNQ>?,[\_c([T?.T:[M2NHd(2ENUPMZ_(GX?bPF(/=e<MBK#8])D&.;<#
5KW@>4D6<,&4=LTaaY<;eRd7[IJ/V^VWM<Ob&&Y^;Ie&=]K:0FSXUKT-U:V()dZ#
S^H4b+[VD&&+VPEV5SALf2E&QQ=D9_g--+b,NYI2IN;Q6W7;0<9\ZLRVAfWJ7(ef
\?Z?;W4Ra.:C4.D^B99;\ceLTI-[D[\+]L,3OHSP&#W91;(cTBW7_@1Rbd@5aV4c
+5/S.E7-NA,=9&(GHHg7/e],&EVS/Z-0ac?RV>[DK1_C]]V4H2Ud_c#TFb-O?I&<
),.H#:0&])3dVD0A_U.5:LKJ]ZWS>CQ-I:7HC#IH\A2d(:(3N#K3WV_JFd/=3@A-
?YBSX7:K6#bN3PJK@I=4=]B0AC^92]e-TFA6E+SS8V3?&)R\XN&D(W)01B3cHc7H
/.>=&=S^UcH13/1A@_2:ITB_@U_T@VY.Jd?OaNV6ZY?HHKc0cEM>7V^(XX=C9Q[U
;a:5,26S>J5b)IY&fC1RQ3eV5+E>>;4,SC4RQYQIB>IDI>K<HLZ=47-UCO>MUZFb
HgU#(B93/(1?RYF3.(ZO57Q9(4UbGC#05AbH,9L6(c.d2?+K4WZEG1SS)CX)Ee,9
3?YU>=X<>VS1(_Q:6O<Q.Od]T&.TbT+_XeY]#g1>&XDXc2V1A,P1VfFU16f[J<E1
>5?:ZX4MNV4dcH2FSE&;]7GAcWgbT,7#7G]A86KQ3dV)[_/DW:#_L:>8fRgQ9O>b
XI&\BI1S;M.,+R=A-e^[@gWb<=6d.W;25GdI6;D/g+/-]5S4Qg(1TbO<K(VUD2_;
SOY-Tb(d-J=Zf25LcbY-/<X893<f(E<]f1f&5+Q8/22c^Z6U;@e,<:Z1)]F@7N5g
.68.H<,T3Q249LH=N_-YdP?NP7#YWPg6dbK@DGXfId#H(;KPL8Zf8B2VF.[I_3aE
;IM:Y8Hf6P3I-3^Q5^#)C8S>:43,Z+0b.E0[XPK)7eaQOYO(MHP8WPTZTR/MB^,\
EOeHeL\DA;OBM7G3PW\K65+#]5;c4V1EE2d?F8S3-];9(ZR^3a1RI)G<D98?<Se:
?V=EE50)80TId)d;??;-K_+O[bMQ.EdBGZF-IVR#==2(AeICTV7.8Qe+03aMKFP8
1M<;DSRQ4D^<@Q_QDe1&b-e@Pb<JZ7bJeDQWNNTHH<M&>GK173;M^E>>3<;&^O:Y
>Zf_)aA]\C4[I4B_^O>IO.7gNUT(YOFY)+C32GaRM_c.\.aH5R6Ya^g0,3IRY2;Q
//;9R3YdYHY#LAW-]Y8AA56JI.eW-GP@c#7+L(KT+3O7=f.OPV1=T&a=?-DJ^e>F
4C>e3O5FO>75?QYbOHPN_]bN0H?7_LILMQ#T_=LJPg-(^e##0@bD3\MFF49I1Ab9
6fHS-;44E>CWUJS4Fac1)c2XgEb<T-fCWA3G(WSUUK,;SO/3FM>IU146;2W5-I;H
e+@U[aZ5#eF[JAZBM(W7?6ZYGT&FZCT.0ga8UcPJ)Z:eSX+=_IdSNPHD,X#eQ[GC
83\cK#SP]NYEP3VaY\cAZ(U?c>e4gfLUF0e3U,(HC4XU&=2LXJ:-A:6-7K#XTE8Z
E,6NL&N]7-3gFHCM]1U;MBJ).gM:3)GE#>G\761^:aGG?-3^J:47U7beL@V]\\1-
c1OZ]C^Ucgb58#BEb=[,:R3\Z<I72C3B0K;3eNP#FAZ._VAUIa3>2#fM./A7gGHg
S2)Bc]#TU#5H60+/FPG<a^DRWX2E#D[^VU[?NM/80K@:SM<J)^X(N=cH,YJcZ)(6
a:Jb_\1RJ[8T41:gKc-@>;f1S#<ScIZX(R4G>NR+X_1=.<b][)C]U\fY[DNeV9Ag
(5C]QTacO[_=K&aD,UAa2I,F:9@b)<6\;ZKH97-L:QOcNY-8TR13RU>5R^-Q?5)&
]R0S^JQKbWV&H_?RVf:e0)K77ZMKa+]<e@0RI<R/])OFC+e#VCN7McgegY@f)1AP
[86R<=0NJOH-0dCC@X:PObH.SF7^L_GAN0(8T#=QDXD,SU?GPJL=_B19HeAd-W]U
C<<RWV>ZYV\?K(:NaPZW7_(]Y,TY^WO?HJEU#L:ee=<BHFX5^E0#&5[[W9GE6AF[
>;,a8,KbCIa+;G:KfSA;E9S/]92C&2)cDRGPRfYe6Q#_[,QI-eO?QLT6X+\6=3&=
?,P,aGaLN+<#IN9R),=bXN3eGON+P5DXKGM]P:L[3fQ+RL/[8CJ>)M[_2LYC)bB8
>RQHFA4ZdMRT6>)A,0Q3.+4M[I.gP;c,_U;SIbVL_JJ+C$
`endprotected


`endif // GUARD_SVT_SPI_xSPI_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV

