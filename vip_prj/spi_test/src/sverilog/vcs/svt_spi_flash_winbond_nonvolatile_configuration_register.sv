
`ifndef GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Winbond Nonvolatile configuration register class.
 *  This maintains teh copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_winbond_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */
  bit [1:0] status_register_protect = 2'b01;

  bit sector_protect = 1'b0;

  bit top_bottom = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit write_enable_latch = 1'b0;

  bit complement_protect = 1'b0;

  bit [3:0] security_register_lock_bits = 1'b1;

  bit quad_enable = 1'b1;

  /** Output Driver Strength */
  bit [1:0] output_driver_strength = 2'b11;

  /** 
   * HOLD#/RESET# pin selection Bit:
   * 0: indicates the HOLD# pin is selected 
   * 1: indicates the RESET# pin is selected
   */
  bit reset_hold_enable = 1'b1;
 
  /** Write Protection Selection */
  bit write_protect_sel = 1'b0;
  
  /*Power up Address Mode */
  bit powerup_addr_mode = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_winbond_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_winbond_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_winbond_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_winbond_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_winbond_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_winbond_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_winbond_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
  extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

`protected
D?S:ed[JR@]Q1+KOYS;S&0a9?]6HE0I17D\[(05@aJKdDCc4)S2Z()ZH2ODY19LR
gZ@^S?Aa1>&&[g60XWKdF?N9=</#DNV-E\Ob^G3MJDXZOHST,g]+.(8[<5VJJX3d
0M7;B(U++9HJ:-)b>c&<N:d?b-9LRNF,,6L8-[114eE5b#>A/6^@&XbI5)^]bRMc
DMc;B+0_]Df=0ZPNALU_NY2E4<-:D]NQW^V>HWVd3@RP99:bJQTHbN@0\J0\-Lb2
a]S9#FV3I3:SX.c)JHPCZ<cRV2RY/>.V6WL5Nb7O,L6=Q)RE90W^K6KMg,c:KTM>
_:dTdWL=#<f8b)IKSUV,=&>T1e09:Igf_,Q+4<]Q\_GBf&65>fBP]N.U>H0ec##4
If)1]RC&a[Q=?VTbe(BLg#S[ITO9c:g,7Q@D/#CTSO+0;[e&^H?@g/Cd#.\b[E(b
Bd(>:/CBf>LF^IVCQgU0fS:>4-N8:7SI2;?gAL5[26f_PQ&.MP8:UN2fEFg1]#3L
ULQ8[+0Y^2(7UU7dT0^b;(8;^Hf]e>I5X48\c1MHTJ&)GKe5V-U0KacDe-OW)Z#X
^E(a[F2Bc7>T-6O\+E6<:&acGCPFMP.@>G_HVb>?79D3GW1W&,6;I&:JZ7DWOf()
68XSCY^C(>O9LA;<SPgQcSOIUGID+>_RKc@]F1A_3:M9YT>URQA]+F+>H1(W;fW-
,Q.d3PDKNaJ#2AJd<C_I#Q/MVH/U#HR?&eZ.(KPI5]/TKVWI6Bb?NLLYfFb.9c.g
eCH1J+d0R1P;@8,U=Pa@)WaB#YN@g9b[f]D7Q/QV)<aTD$
`endprotected

   
//vcs_vip_protect
`protected
:ETg9\OTXD-5(e+AE<MVIR2IRGH8OCH)+c.E#T>&:>Y=-FT<FD2K+(gac1:FS^dP
J9CXLEZCT>6NC;L<@JBA;1+F:NM<\L0A.A_G,60>G.;HS4VV0e+Ude=I<E0T;?3U
L8<^Q.eRJ(@F4H9eIAJK>=P)f79^JCJ0=Af7]fQI:@g+G8Na#YN)<;8^bL)YRd60
I^1:I3#0bf>WZ\.)Xb\,GO71=MeeZ,H]]Y_B,4L[A.0=-IT53VX>]&L<Kf[+ge&I
\Mc&&e4XHX?B0GNQ7W<O)Z9gR7VF@f\)c(Pd[,Egee(dZb1M(7^Dd8Q):KH5Nc90
D-ZI>W:P5,\AO+(8BC,GX):7BgcdT]&BHZ.8,Lc61IP&fRYgZeEV88O87#(3-IB?
,6MY^>Y+O/+(gK@_,QNV:RD2,FE;4^6TO,+;EV#fGQXG@ZW=02Z>O<?O3,eZ4GN8
9A#YbM#b=/_OT_A/244ffJZ\)c5dKN6OXeB98A9M5.-(2W,Y275:K4/OIT_W6J#E
4dDJ,,a8Jd&33:N/MKO5CTDg8X_KaOcN0^5<;3.KNHgCY:=b6STO=.A\?J2.Dg,;
&&OSaE0^UZCG+,_1@#?S:e:BYTCaV];:B7MXf5A3<fMY5WcP+Za<<[RADDWR8QdR
_QWK#[V.,A7,]BJR1KKT4\]Ae4\+_[IASU93KV0W#IbY^]/C,1;5S-WR.<@;1?Yd
BIeH[:?3VFM;GE9Vf<#R4D7d6d(]+ZC6-dZcM_U#W?V(5WC6-PYf2P(^3CGf46,d
>=XK4VNHY\W<2]/Sf@FXMZdMLeZgN.+G[+-W\d7eB^JSKT(bQ3M-W,/]//M?V<N&
8)[2d#@\H+WY;Z/5/fOgdF5P<5L(V/cf;UH43@GI&T]SU&59OUXLeJX@]BH22-fc
U_AQ/[DCE+Ff)&S_@E]gEPdTGc//0JX?TGYY4QQ#XP.T-YUa8GPE]/Pad_a[aSWH
.^J]]3YIO1gaCG7.YfQE6MB2194>;N&4-g_>gQX^TVG2^MT>15RJI8g)0C<;C=Z<
V13_5g]M-8(R:ZC296TLBL[J(AaPN&M#]^/+dSEI+HbaH?.9LDP_K[/#C.GVP+D4
7Z1Q.2J0Q<A7>?ZD[:VXN^]Sc0K41cD=R@U=&CCZ;J?2E,S.?8O0VAM.QFK4d3_V
XRWZ@/.3?Q:2Je?M^0fT(K-62O0KT;KMO_Y\gC0cO?M7_TV,C).<_]<MZHWV4A]J
+3_gNYIKf=DW4=][80#O-NE.<YF]1<:FeQ5Z(E;/<S1^NY0)9<.W0_5AX1RD^B/)
KL/b/,L0&?50/X-VI4Wd6N1Z_;(W3gNHe5=713N)d9g4J4<.FIT4JZ-02b[7YIU3
7/BDC:g;+.ML=5(&/56=>MU/W=?>T_@IN/fdYMfUaGH5EXf+&W1DA^])JGWM>I2C
;B73Q&09A(04T)+^:-UgUfc(G=RAA\W=S5Dg_?9e)0#Yf(ENGcGc1AgMY=SI@d3H
H<PT&1U034)DNVRO8,A(LFdaNCDfIO4C./2[)D#PRa)^&-M3/K<e/OXc-Z1,5IXB
7d7)H\B-?T#E#QR>QE4\b<VD4K8@bFR_@Z#)d+818CSOKeFR5HaB)dKAL&7C/S9I
\Eb.7?_=^#1[:ZW(Y+:>7g[O^7L:UHYLc3)HPe:GT>J#LT=<;7+,:B#J<:AcESKd
Y3[Jadd+a5KQTD@U7cCM715a5L?T#bOQZ8,M],4d^&E.8e)+HMgU3b3E\E?(dUE/
1K8Ice]F0O993058/HA41Ka:.[U)T^IU-A?dK/C5<&R[W4EH272CgQS_CgKOWOPc
V;:LC9cbQ5\3;g]./GdP/BX)#W=a<)8R,(490;J&W.2K.aD3dN(XaK1=(\[(2cHI
H+4+O1RX+C/V[>QD,M&32WLdNBK]>V.C2bG:^d:#O>&0PL4#d4.V(:IM17c/ae\a
Rg,H1.^/b?,&R7gcO/VB,?+>X)D1S=RBUb7P:e\fS.:dGU7ONL;T:3NX]L7f:;gE
7/3&Q]RR;.RJL3M8MBJT=QVbdN(JI(N8QV=,)-]ZTMIJ,PO4.TdK-g1>R8Z<Me7\
ed[beXfM5A)QQ0+XV)?#\K,6.LK3/c+P#;Z[VE9BRb8#N;4C\T,=d#Z@_C,BYWPP
9URI)6\E)4BgL^=_4F=cG+-MHadL(8:E\PC[Y4-#+_@cN-##?R57DSN3.4LSUE)D
:#dbRTO85@ca?O3&N[6[ef]cX24OU2LH/TB(NYUZBY98E4I=_fWZE?cI/N/W+\Y)
Xg<HR_C8-4.]25KR=T]V?RWH(,[.cSZ:,6.BIZed5f\f0&2.e=5^e&6SEB<Y,NbK
T+1P[_SHY2Nf)4X^S=bAW.05VBg<:4VffM>;31__T(+MZ#-SA3RPM3=4&W:=O-3B
He&1]4GW4(?;Bf[M^L=dR(C2:]R[OX-;)K[SBD3Db-.67I7a41_9(O?301#_#R?R
PP=@;;12[LY0_@4#C4Dg3GQPFSC1+</]+0d??LPb)Jb_?ZF^MLC.QG9E\SFGgEUK
V@WT)S?KRE4TcKa2e^\e1-+@XPd+0:L)>(>Y,H[6T<6((S79:9^DD1WBA8Q6d(1J
^41.8bgG2U+-&1cVQR\1Ue5-##_<C>:-3_SSC5T0,W\QC>;<22?M?XUMSZ<2>+S/
R#]01Z1FOQV1QGAf,.<[C#Y.H7(6L>c_A\@A.YX?>Fg4[&Ha?0=b(M;;&_=90@JJ
VEFP0>^2-a+BO6RQ28.5+HKSeB[6F>_5X&@@];3SQfF-U\)@KA2AA(Z+(AE2LML@
C5(EP1@+/L+<F5YF:BZ4EbZ9dXA+Xa/4M6^<<T#;H_W,[WR)3bVLJY;1ANCEK4KK
?\-K(C<<&IEH_:B5@0bfg6EcWa40,,c5Ag]Q.3d@e0C8gd/_cPVJIE1RB2KTE(LC
a18#,68:DK;:=]JD,[?#cD^?HbN1/3T9]F=XB0N5QQ_4)3#&WfRK^;L,gJP[LPPc
&a_\&dZ>TNXbI@G_D\=C&Y;H^4J)AZQ,VA@a;42Wb&2TO3VC-1c;0&Le7FUFM)F^
7K;YKOQ@g+Y#7@P:B1)F+FH]Y7<b3&R9gFSJAHHGK;F;7FJL7DA0Sc6UA.VL+QE0
ZB[Yc-Xe^+fG<P<#aB.P]Y@4^@T6P&O_MF4PVJ[9/RU7;&<OV.6)D2^_2-VML[cc
gU(be)7>Ge0T+Gca2cHX0Z-BTQ6M,Uf/MQ<L?(Vd5)QfIW?W^-;d&?g><@_eFN;6
#8Q^G,FXMaDRCS:Y/FV8fgCJ#2JAY1TgQ)ZZZb1DJP=Jd+gc8dHY(9G9XS:9Y@XG
f-MQF=ff.cVROYRb41F0#-B<)Q&;JfSf8I40-M+7-G0L[YF4W^,gC1KXcH]_G]Y-
/2cJ#4SGe@Y=(,7JC^9\?&9-0.I\HZ()1c@I)9BI1<Mf\DLW#HI-<g9aXQ8.Me?4
M9-K)B7,9;Z/6AFJ1-+,7H4g@Y2T@(gaKL(dc>S1NaO-ZH6O>5MSS8YDD/K1f[/K
C5.F;I;R0gEbL6dP\5X\aLg358OO(?.S>S##?L<]QOY5S3N8G=;C7;9L<B8O<SSP
aK&6-;6<F]fIR9.=96f&d7MA[UQ12AA[X-#dI@C9U@E(4-[63)F[/85EK6a&JFaB
+2W0W\#IN[)(g^ED6M:0O:N/Sd6(&?MZ&HHX4c#\RI,H@bD)PMG^&-[PBADeWNS,
F<CeU81XbXLWI?->&WFed8IP,.=.K5U1YX_(+I7bN0\8cXQHC>57e@Z):T.G0/3c
?33b4Q[N_K=3=.02Rc#2gL-C^N8YG/X],=-OE:2K3>Ad=H@LbfU5KU05-#5>9)JE
NI;1Z>W:C;82QHL&ZCJRG.0M9,e:]DaU25gF#_Fa\ZV8XN5I54@CGXa:f_?\abU9
5Y?/2dF<YNP5.&A#?X=Sac[S?eM6X8I0A8M8E[:+\G5,,K1)5?>GF7a0]9:CaT&,
+c#NP#J)cdXB:J&K5>L3R49UY>@DM#AY=X-BQRKH(F,UAGXVTRA:;,XLAXa77_5G
Z753DG8V+g0e[S5b=+MX_gMg8UO>RS0U2cdGM:MN#]d[XPY4681eWXP8LW0>dWW-
=HB=,++5^c>FSX#dK1I,^^#08(?B2J9O3Se.#)6VP/JU7^_aK)^Q(UO\N>c_2OJS
+564.@C9WB(g(O-BIMRdWL9<;CNJ)cPEPcg6+b<JZ2+Z:J:MQ\RA+dU4V:U5B\&#
D)_6T<^FJQ?AJK\4>SAYeAKOG&bA<-+bMgS0?@GXKaB@\EX1()a+WMI]8J(SEQF7
c>KW^:cY7A&BW=S4Cd[8^d/\ZT_O?)OVb@M&(>.=@TbD69^EOdY3]LIT+XSIAT;M
/):)MaLcB48GR=0EBU:3T1:ZeANf9]A<ge9VAc,([8>)N-8O+@5D-;G.LgRe^H4F
@@37278R&B9ZF<Y3ABC^<H)?L76^^6:+E,GUaB.ODDMg19GI]L@_D>.f5/BVd_9)
4]KXSY2YC7,^f(fLMMU0P;U)^7bK:DE+F4[D]V,TdUB^@D?Mfg.4\F(0ICg?)Z+F
IH;bf&c^E^-DU>=.\^C4/R-AWFKQ9:@=c?gYeS0IdU]:QT-f_6L9[I=X,)][=O)-
QG5-P6K6=P/d6)M@8gScSYK/.JZ:>#,.Q^a-ERM:f[./8fM4\:8V)E)A93&N.,fB
@d=gg<UCS#?edL@+NZfV3Gf[cde][MQc3.5(L7/dZ2;M]T<-g8B18EE2<4_Dg.ef
IXNC6af/1C&+WTB^RSDd7/+I39NF@B_-@1KQ-UfP-QP7S8ZV,d_RKSDKcC.2g@DE
OF=c,eZ7TeNg;,LHK=c65:MRcVbWgRfeH=TcO)KJ:(dK=@#/BO@E<(cWOEa-B\F-
HA?H[R+/eb(>(WKa_QOAd+7[+]GT,cRcVWXMM:?EF:\XY4NF_X[9Wb;,GA/Jb)G(
1@9,0Y=V]J:WZQ[N535)FYA]K\WNE<48AYGX;V[cST+b#5IA<NcJM_OUW\OEP4?Q
)BQ;#Z]+PU67cML&=-4<g,;F@B;JV7G[WBgFbEI<W:CY>fDS#9WgDY;N:=eA7<O2
-0.^RC/83)e09^H@_CAK3M43C/A-,c,@8;\5Ff)23AITNL(?#NIQU.G^<ac4[dg\
WD;@bC[G0BBQ9QfQDJA<cg/]IKM]a@CP3#GHK9#a1BgI6YF(>1Z=dMf/Z-_EX(:c
TIANA,4TFB382IBD]9EQD;HCcNBC1GWKMB=>f3V>D(PSI0.GIVU/3+QR8X@)bgXL
M^W8O.AR1I=AS5[X#\Xe\<ZaP/Ha:SLZ#6CF8.ZA0aN5;\;-(ec8<RN^@E(HEXS]
\=#(eH9,a[17/\-5,\>IR4KOGHCDHE8A2ZL^,TLbReV?DQLbAR+PQ6>MXW5KUS1P
g3>&4W<QB+edN<H_L+N5b]:eBV0LRY0F.;I\KaIF1FQ?41BQ6V=aQ;^G@IBbJF-Y
^&LI#(?5[B7@:)[Bf,#b#J6J#MGdA:(&eU3JJ^R)(@PE+TN7DSeDb>E6B?:S&LZV
+4JW1KG>1N=.=0;]/dAE.IZI7>_L,+]fY0c(N]&[57g-6=<#UbQO2GDY5U42^X\1
XLD4a:I#\XaGGbB+Of9>MFP4\<OI2).R>6X=5Z,2F,eT+2]eX4a[@::^G-eEb1=O
S287?RNd;<?L5b2@KHEX\IWR4TJHAJdXGdBHZHXP[ZBW+]c8O=I8:g\P66W<d07@
;-E4;-TQRO?^^D(]TA4@.3U+=-D/USe)F\RgR<B1KXQII4XfBH58=AC^WI]RU4\\
Ob0<_4).MNPf&UaFe5ZJdG+F0RRD[SS,/A8g0Q&8#/G)JOdVWI,P=WSNPF\R1+AY
Z57MPf;SHLJcCM2fW0aSeO0aO^<6M_7.AINS[1I\(4-RaEGKF)=Y72b]F:/@HEZ[
^@15S-QATL;(aMMJ8[d9B3,1,4Sf;S,U5.F.FQ50ZWK>N=;V;)8+@dC6J>Pa1(Y2
#EZ?;L\C).([RX8@2^KZ8].&JAE1bW:LfddJgV]^KIKCNB)EW.@,>RGa)_IJORTQ
:&Qf;LP;5>ESO@93@0#:+>Oa9_+NaU#<_1gIU+0DUFfLMQE,M]YD+JQJD+:(T-_3
D(+OEAD(GIN3^3YfET=EZPMdW_-Q0LF54(=[F3LL4<E9VU,?IH2cYY(&#)FNK@;2
QXPVS,5TDK>[0[^gLIELJNB(a1RC5MJe?KF8X^5Na&F??G:f0:Mf/dW?6/6F(AR/
7=/I]BZWF8IK=5?EF](K^\21RN(f9d3Yd.\5bWE0V&H=DS&N4McbK\D)XX>,VYE3
[g&eUC;gM9^IQ/<WM6+Y8UXTXX5[^R_H<a(2Egb^b?2]0VEXVIDAaV)-@?)TOJFO
_E?6[bDY]@cJPd)];3g1g8a,_[feX2@/Y\DgW.eUC9SE,>g[Q>F&4#Q5c?RaP.2:
;BE^PW]?A8:<QW=9SGHTPS?WW7M)#DO]9L(QW4NGJb7U8-?C-eb;3\UM_/T5P8^E
&]d/_4X:R,7_#N.<HVfVW9,[bg^c@=c4@0VP&+b>=)PTWd;)21R8)N=AC+De]<:\
Y?((8fH&73U8395Z?(e&[C8c2d0F4609e=@KE?#<;E(J;7^O@/Ha^6#V[2)K71.3
Z@7ZB\<37XQ2:8NO<652U:91]2:XT4>-1c5ZHIZ_ED=OX\MWP.5DfV6NAcSBQW<.
H]eb9KE7Db&F&4EYEZ[fJaa=GOA7d?@GN8]-V0.P3c#&YLd2&b(f7=)/?3cMA[RO
b]ADC8XZ+0#O76YOf#fS95)8Z?9G;J=EMC.;SQW)GX2#(:d4LHb-Z3-[[8P0-/@^
[1C1A.WW2VN>[3d/J,53)P5+63)bd1M^P9?]-?UF>I@]V5CNNLaRDW.N2SQ34<JL
/X\&f\LCFDDHFE5L//34(g.-:e1:FOB\D2O2J.9c^1Z;a7:MJ,YKKRWWEdA/Bf+P
N5ceGKZ22Q+#9H4Wb7J^-WZ<8c/<P.#_FKRe7dd9@EFL,&/T,eK93#A&^)PI?3gF
A0f]5R)c?Mgab&_[K(3_NA;=TK>A6CINWYA380<(L)LK@FPTf5HA7gW?cRZ\_F.H
9dO&9@F8:>)ETaH4Mc2b^BZ_M)W=AW3+@VX6?F<4/E(YG(7NLa.<Rd79KU5Q8f?K
@0D=V>)ZK\Pf)++b@UE7/7d.DLDS\cIVfQZ&TD.WH7bHegE_Z[-\2<2&f_X9e[G(
FbDD77K]D7>1,7EMZW3&X[5A>-S2E:9O-8GMET:RU=A(>c(]Xe.T0c@D/I6UeW7D
7Y4,@_3ZY^CeQX,0]dFG4DX7.+P+a+VW@\[?K#9:ODLg;6TI,4D.fSA^8NQ?SS96
KVS9>U77HSIDCKf(BW,AQVPX@b+Rec,Z^e5O3C6Z6-^LL5H7Ga4X81c\_VFJ+CN9
A1&SK&\NW(f(HROX]=REXX.^F1D\<9;,P76+aKNbYeQQT^\;/EcXFBKc/+DU/ZAO
>)/+X##Md4.=#A-eE)]>0+E\TaVN(FO_,[M&f-M,]JR8ZBY(;&RbRW,Y.Z+FRf9b
A_/d.S80e]\C<H(WX.bBR8fDD7N^aKZJZB4#);@?M-\cY.Sa-T^bPaa]^78_Of+&
KN>:W)gGRK98ZK\[.,JdZ-2)3Hb:3TXN_GX#B<>I3J:V(._1Af.S<[/C@T./?^&L
-a.9#)&-D4Z5K5+O5=E4Y627]_:-a3KX[34ML/VFNJ/D=T#J8]NZ5XJJJMZ&0^OS
a<6:gK3J,NHBV5\4\B:F0VcD/eLEaZ<O1@V@@>?,8(+bMP?OK1a1VXRHW(5NPR\c
B2-Q16,P&\MC7DHJ,B:d_d/>Y/\3S]EfaUMOJZPNEb()0RdPAa[9&R6OMGH/KZ..
1]_B]3TR#6PBG3IC_7A=2OG6Z:)M0ePT25NdA-]S(7_9J.4P=P)S1@19Ob@cHb-[
EcBa,];4,^ag@G13-U_T<IaB2BMd-1d8c-94Sc\J@MMB7DPa-(?/WJ)Y.gM)Q52b
EbG.[)b.Jb/>=U&34MC#A#XQ.XN?ND>P8?CdgBg]V?G:_Z=TG1Ia3.M]-RN)JDFX
CA\AD[AYGV(?;FE\(&-D[9C_S>+g]C3XPF\dYYP=7OTOX&&]WN/EbgIX.QA2-I)U
G)EFVD0bFd[Tg+\0ZQ5X+IdO6I+fO,0+LHcC9#_7.D\.)]=PC5@+EfY5/:1FG6B7
P-,_-f)U]:gd;M&:cVBa//55H@4cFKD.KE[TL@^,cHPbW8^3API&/U8ZfQSNPWe(
N37BX.;?;8Qc4g@CFQ+_[^/bW#:NJ6G-K8,]N+BO@f?-)UPS0.cc5#;774Z89;b=
#\(BWd&JY7C@\<\WR->=A3MWQAE\8Qf4^1]TeC>U^/=CN1\EB2UR9N.7<HCDVG]H
8(a2=?WUS8]-=bG6B]7J8,+.Zfd_?(Z\=_(RZZb;/a2d&6f+/_)>S0,R]4NR6I[.
^YESCA+-TRg3:,-#R:TATR-I.HNKPY63P,HNbR2++.T-XSdeX#9ZQc5?abFbFL^W
X(DWM0Z_PI.VK(BM\?&O7cTRCG#DT?JX]c72,/R/M&87_Z2_dTc-E4II>XegEFCE
<UT:ac#T[bJIZ0&[+9BL1\53:XdIcLI.3fRBEE,^O#5L>>8+D0CUd=M-@_\#UJ3)
3.IPP&^TaRY,=4?=b@8^-]M-U,>d\e.C4bM7G_bW=,#Ggc5AR-b1BX.DGRVQYC9H
:0d^.D<V+dKSLU#Ye:b=L0b=bYC)GSK[>9<O@;&5MWB\c;7D/V-ZHD+J+RMERcDX
J9&EKeC297S^B:,YRe\G<A1,a;29Ma#P;-F)[f@O6W1Vg#LeLE;^]>6[Y6.GQb?Q
P36^1eb\[-,7R3H+7+#,_EVMV)cJeYbS:+(+IL),X@)X@/cX9R\AKd-I/d>H^P]_
c3XWXfYM?FTTQM>fM,e>\^G6fSGXO=WM65X,Oc#eJ3]X3:9_aV6g0FEaYF#)DDfA
<5-H<C8G(E[N[QM2b#VT2[X9\-#Be;D+fP=UXQg8U=OK-YgP4U/KcAQYTBM)K]R7
E?:d?TCe3Q4<F+MWYX9D3Z4#5)\U5e&5C<H4]4.VV[ZU^/C9M@:]H3XDCC(;TK.J
\Z2)SVODY\_CSIcfJ>fEfE563f06MS1:^MKXT2IQ9]YL^WfSPO9VdfS7444ZC[-]
^4fDG]8]J:eH]XNQT@7=N][85A:7-EW^[Z=b\IKX(P2>#<Nd5[N#)=Z(M1YA1fc/
M<6f(14+S?GAYg(PG[d@+fG<79D,S_d-5\-a^AM23NBW)J2R\95PD_Y,)Y>b(X,[
g=MbR6Y<d,D[bC#SBbfJ=,==91Z-TMX0)7-L\.KB\e(R/4EW6^FFIC#AB6NV/93O
]A9.<E6Yf_B652O<[4ELF<eH?+9:#-eIQB?>HdAHGJL;#>Z_X8=\deO?QdU-dJ7G
@A8I0B#PU8/8c_XeG_/U1@gY]SCfK6a)3UT,0KBM-cEF@,aC_P3G\W2=.9G6H>#F
U\MBMMcMSM/^^DfC-3:W3a/J0]_<;DaBV(]gFW83GL9)dEIQIM2X^<U\=+K7H&,T
^,7E\JS-R<AYTKTcVM5,CKFGD11\ZG,3N@c2\)KCbK\/4LLDGKPG]>dg72g93d7O
;Tc\O2.A4)->fEJ1C#+9]Z;Qc9&>:U_<1(X1MFI:NEJ+_aQO@M5YRN5B@2]PYRT;
_OTXAD=2SN2b6-:2e8aDU;]4#\(Xb7V?c=?<RP#[.[bSFV\GDB((20@:FS^B>YWW
S?G(T4S;HDYf:,EA;R,T)SfK=3L)XC=6aO_9GBLHF_POW_]3VM2H3GI7Jc-2)Wf\
+4UeN\6P,QV\>81]cLY:?9-YfJ-4aaG-WW#gf08Y(ge;Z6]4&OL&I1F4G@BaOaWa
SY]],\?ac2WLd1A&XZ#fJ=dB:b;.ZP&aWBaEIa@LQTd2+A(MeNV;V,^3_S5fGT&0
K2WM,bddgD5<_bC2P.)&-aA_.09=[\6)O<\8@Hf[eZZ.6c#1I9&6P9RU<-+&[(5_
ZMWZB+L3f(b/K-Y,9T;5P/R;RfIfd>DA+R0eEU(>_54VC#gT76E)eCYE3R.OB9E)
,2J&3BfGJVK[Hf?X<BN-\ed#=/b&NLD_A20FY\PRP9<]aA4LIgf<<ZQ@2+OgKgTH
DTGP452J(C)-+A7d#/MB0Q(e,R.<_/MG3<IJM<0[K@=;#dF93Eeg=5\81IHJI:d0
Oa@P,MeCVR^HR4XH^\X5H3LdE5U2#a(^VR-]2GZ]5D++^+cH3f4:Z^gG]QgTXG8S
J<L_7>JC=N\/@->U<S];DQ@\FcCZCFD-G>)]\gHWaIHS:bO0MTRS,44CXSa[+^-d
RS<^)a;-Ed@bL.c[Q_DA-VeSGZC@f<#6F&7/(XH\3L1JW_YLcPL:(9,Q#4Cb=d/g
5)?e0NJCfN207e^G?=#EJF+N:<fQ,:P7FD5(bc7Y&)5WFPd7-Y3Cd]27B&^f7Z^f
Y9[8906/[VfcHDNN_-G@:37F1T]VWU&d9DM#,a[[?H>0+1e@#)e;0?]S:/W-Pd:#
5#YC:Y&(c]<\6aP>0/J^^0f0NK6MMVB1^YH&b>;/<R@5A,:PG),/aP)NfX:Z[=.d
\K+b(ASXO<bE#4PN@7<<_bW[K:4ETCdXI3QX\>&#_@:=aDAa?XR^WWEF9ZR:B9A)
U,RQ3GMKD5^L7\ScIKdeQAaH-9_LAZPWKC6a<=/ISFeG^,2#]Y14fS/Qb6>]M4Q)
M+J@9]cX5\2ANc9TH;I1M[OdN6>J9ePU8Q)FS?_4@^2Y5D5W?YL5b]#<bA=1:W>.
PYX&.UNQUH-_ePZE#5+D3;(E(<Og#N^LXCfe<D7RI7)]L&K,:3[@[2[Z@dWcKW#f
&W,W9;RZ?XRJ:GN]170PRaD@f.c-23CDgRWaA)#/HT):E:bIcF^<.Q[9Eb]2&+;D
>4Y/a\809[EH[1]WIAZ>aAM,[FfJSK@bZ9J)Fc.?05T=a4dW(_3EUO2L?g:FFG4X
6K-Q)b5g@0[,:PF#cQ,S]W9.T<a/#BCFce0\C(:)>J?C)Ag^3(E7Q?/OVGTI]0dV
C5AJGa8(e=bF_TO2R_P43C#35(YaMdI\?#54Ic:=DJIMN-S--RSLM=0^)_GeO4<@
Q#:SM)?=A;AM/HHU@e6FW_LA2[N4T5^bSYCVcT(,)UHTd48TR].\9C/W1\b@_N77
S9QSYLRaGV:3_M02<e=c2D72S3RDJ@2>LRVD3cc\B@A\Xd4QHSDC7C?.HKBQP61d
W^I[Qb;UR>4fJ)G8HQ);W.5UR3:E;[gD)7+=UfS&,O(D\T>Q2>5QWQ>E=CQ1)[XU
;aVZYaPUKKbVSPN?#aT#LgPE2IC0\VbC^WZ^-\N(/8FZ?,R?X#8+0=2:Zf=:=YD5
8J357]/E56cWM#\C1]JIb,3MG/L.cP[YJQSM#I=M;CKJCSY,ACdeF8/0eS_<,;E3
V/?4V1,F85#Va&:,KG=/ZS.X7:Q=BSN4=+gCUbEZW^Hd+C@M:#K)]EWWM5GVNJZE
AEgN/V-#M&2FKB6(A1#]LB+0@EX4]^I6M7eV#Y2^2LV:CE+ZPX&8V?T.0VRgCgN;
?.HMeRMRCNc4YU>I=JSJFQ@YW=1\MS\)d?>4EdfIX+.MQc]I)?g>\D<^cG7ZLN+4
S1J#@NZX^6]3NW34V^U1_LCaHS-eM;ecN9Vb1HUc)W8M/5B<@L;&_=>D^dS\<aWR
:,COT^H:Od?62-9aV+92XJG\GCRH?S^#2:^KfS#BZ?+F^(LC<dNK59)QH?E0?JJC
ZW1PCR,OgPbF=C_3L&<2]H\,a;+Pb9@</DQP[Y2^Q;=\6FYYO?40NYQS.&Vc18_J
9CR>IQ(efbgM5f),::?/1&YaI>.>Q_+V3><X;^U_1gb5fddSJ@f<6bC(&,HMc)51
(BZ(Z99d)E,>)\=8a_MSX^b2]ZWV4@Bc3K;dNgN2/GE6<LV/UC9>4GV+ORbe#<\+
ZN:KYL1&HZUZOJB2W08FR?#XfD+e7Uaf[>]0#)SM+#K<X[U.:Ea90R1Y(811F_O>
.AF,99D/@[N/_gT<OL^6Ze[:UZ4WA.ddfGG<QTf9=E+0YF1N6aG1\(1U5ZBDa>LL
e.=57gV;>c]ML-@BOc5+7(QLT(]g((TIJ.Ze?4OFPHLE(,ZM\Q;]dc&0T;H=MMTH
T?I?<=J3#AdZB^LF8L#:H]5QXF;-Q2K9VG>(?E@U&X(H7;ICgLFa+TK91J1K:/U_
^(@e=g&.Q;3J8(LfTUd\MbTFX+&LAf)J?0;F>?aGPN]/V>22@d6?F9_19,10]N@,
SB6bIB,Y(0_,L<Kf6F&,<X[N27@UVGV4[::G_0#8.IgXOROC.3LHLY+OLX4@MRMG
D;7R\@F.BU30?,9]Z9U4H](7UQGP+O[TR]WIVC\#8U]PeD]DO0e2^?D7WO3U7ZO@
2Q0.VKH0dAN\^HcEg>[=,(HVeQ,Rc?gYQ#LG0XeU4F?,bEV#./GbPS()(\a>5O0+
V^J[G>N.45f<<0B5WG1+16,63H3gUaQ(P,aCTAEN4a)@d]:2-=EOAc3KE#@18f-)
c\<IV7/-K;c4P?Y,f?^8EDgBHOB778a^EA,:MB?SYN2e),53,_3++53egJade+0O
?V@2ZID(bY[5KPPHN.>>5e\8_8>T0#)CAMNC<MRV[A&X9:;T0JS+-5dA>+;8a0OH
;EB\E)__,EGQGNBfW8C9A:F:#VY_eSN4&7-\9OZY08(+.)F)O8,CGJ\geAe+/G<(
,_L:<J:A^;@K@/&25S147UM(J0=PB?2>=3Dc.b[d,VCbL9C&QI]cPOJEM.WgeIAG
^<1NSGVCT5<aFB(/J89aK^#9UVE>R505?];8MUM9K\cTB4BP0(0^)WZTTHH.I#5Y
Pb_+CZO4>.&SaJ9(V1cV])T+GXZ6P[6aP9_E,SHIL66]8+&I#J0XFK1\6S\-NgQM
EX@(>bI,TTJd^F(LB&+WOGeI617I@3^W4/DH9#_@(3e(PM[.K@UOQ5VD+]9=&A=3
:I<R4BT[\EK@3](Ad94cRdL=_S(_YEM+Gc^4@1T:A97+dF+S>8^.gb(1=KSSYP66
SSIH4&VFO5F9IK7PHdV=I8bF4F3AZTXfDSE[#[.XJ.Yb/9gL8e1R3LQc#(d\Se2I
c4@6H.3C?/DP@46(TQO/Ug^KI?Ub-702d.gCN:3\PD7baa;NX].5>QT)&gf^XEgK
4?b?e##FGF9:6CT7)(DP/7QNX9cO2L7K9]S@8b_7UTIe58<G+f7Fa8ZD[f1SQa]7
)=^<>&[cB\R\#PFcM&/WFJ.]EX9I8#5+eC]L/-0QZ;^,8\8SgJg.044FMVW3N+:1
\P#2#NPJ3J?M&VKNBCCCc8/ME7HLNM?d90QKTT_RX9O<2QeQE+7fU[&APf,fbcDb
)^#J=3VI@.FWAFfRYK_.>d8_QY)AI#&b&]TKc_QKLOd;;9=>I7Y3FB<g6QQWG&>C
&5P_>/318X19g+DGb^K\+6:eP9\8:Tfc938e&LTAC<YUA&M31]#PD&]J<NPU18&]
Jd:c<.bVCO^U]@+WC9-fbe[;P:3H;\K3=O+-#?Qf/(1[N7D[<V)H)],9A,JKeHa)
618GN5e,>CP#J47V]1;N8H5V@B82A;J+,OABSEd=Y(9bIKSXa(31N:,gaU=[Xg53
:C6c#8KGFBZ1L:Y/=8c]3&;U0=/XBP\E]Z5eJ/5?3PIYEP6bf]XBDXeG_=K(0L?W
9F3e^SR59^5]9g.g^8gBE(KdKSIXE^>2(=Ba1H.6Ac)L+R1:(3X+5+)B(gR45??4
c-IG@>M?6-Q8QT]>&1D3[J<B@NW,_FP1>CY3/VPB3XBKAXJfZ^^#PaaLRdd:0db8
9;I4D-gVNg:gQ[JG1IXFYF-KJ45:_9eEbC]d:gYI<</)1e(KE2D35SVcAHINc#?a
8X1Z45Fe-(AA95Ng[IgcfNDf7bSJ81&F7UT;5eCcBd_9YH#9d5@TB=gB\^LC1@2f
8MIK]c;--T\^NS3[LB2#^9[SQ#KKaGOP)B5c_4RTN>VNRBbAaL0S<?^.[I1R\S.#
Bb9@4aG<XcQ4LYd?E3=1U/BCg&,32GO5gQ2.6cd)/JG>M[TKR6_6E3]e0.S05T5;
Kfd,@BN=GBa0#M[(.YT\FA-QJA@[\6(FZCP>\6dLPW.OKV^R>U;;R0-.;AH/VV:D
((0N4b+E:RUW4^_KI,71(]5542C<RIA,-FLA69bA9,KTK910@NO=C1fI8bBbFY=T
b(H_0(RRHS>DIgUH3MLTXD^?^dC)N.J3Pb+52b>5Qd98UJJC.?T7C+b34WEF9-:,
D38^6>_e-MA#I2E=^aBI06:T_DZ)fcQ,@:9,W=7Q-57^0TMAIcH.#+bLdAJLT@P\
GI(Z@P9N+PE:1^/].7/U&6ZV8Q/fR?P2ZF7EI?JLPMTeAW=JGNJ0DCfCNHDab22_
JV_6SUDU):CNVCZKZQ>)O^I.5-R2f2\EeM[0dIf1/gL_7f3KcD;Q/MOHDZ/UKK3U
5&G8X4eC(LFBV6@>RKY1ec6d^MJb=JeT,8S54IYfQR6:YYRO>]NWY:GBU3XR14gX
[K;^[6;+DN5cT=RIDG;(6BIBL9CeP&UX]F(H86TG21OG,3ABWceWZK7HDRVQ,C:#
.M=O7T6]&T6,Q?/8FZdW@+QOF((IT1)UV@CZ1eW[HHL[^D[@@CV4OFJgKYH.OF-,
>A6,7CA<PD+eJH-f(3579^+5B^1E4I=+WOMW7\QW)_3;eAYC+T^KgK(A8SS+A--e
LXR5E6F9X[e7Q,UfR6W_O&0RK=?S]1TeNTU7J+YAc3Q<2(Z=K3<E+/;LVX=AACFH
-PEN-;Y<eBVD=:0]23UQ.fWJZ:1+6(a1<MBUg<;fZC/30b>[f1D:^d^f86V9B2RM
A&G5/.ONT(^I-e+8[SNYVK<;Y>&e:)K=gT?[)]b;DN?=XG)IN,WbMcc>1[]81.L^
-XSb[T>aS=(YMI);Vd2WL9U51U>&_fVV8:DMS/6;=9SF>3(Z]AEQcQNbgF7^@52S
R>Z_DQ/2-241\0H)/44V;>X1FeG22Rf)M9e]=eUS^f?3d5FQf:MY=+J#8H1[2e-&
0Sbg5/15W:S]@#(JgZ>/0<X9<)+eL[:@(GgCPWY1(HNGD7>PHB:7;G(-gLQ2U;TU
MO/3]=]H?0JRQUT:@J#JfZ6ce_9YQ8ZB_Q,RO-e9F]7b/IZG&(MHK@(8Xd-X9O)Q
&7N[U=T)Q.2>/06.DGW)AD8\QgVLUK6eP2D#,NOcY[:T4[LI2=[S_JIQGQ10W2]^
B^Qb^)[/KX>@<;72MYMbRTUa)^FSbOMY_OX7[U5(dL#8=.Kd/CDa@?<g,HHcP4_I
(]L@.7&4-:V<HJgVE@YORUTA:HA=&J2)Bg806NRRegc&LbE;.?FQN6/OE_]f_]4B
]C:3<8ES&.f.+[.:@AZbST-QURfQ-B?R=ZXC(-LT;09/b>>3gN.Z/=<eW7E,&N)g
:-W<\B2IJ-?Q)^4BEJISI>b2U)8WMH^R<YY7?YdI2#I;@G47=EU5\^))\OI>]J0C
HR6.+Y2>D>,DA24PDJRH9D;?GH5A1P;Q6B9S-)-,;XV-0-#8Jc,fb1g[8+]DOYE-
5;L+5Y,Q#?:3>Q4;H4P?,O<LM@1RTALOgY_f?Sg]XRAW3:f3X=<JW;.?X]^;Bc,_
A#:9\^aKd7>0[O#>TYD:]:RZTEL6/#>]Ye@G/c#B:SDG]?J7R)?DN,_MS50TP-:9
@5_N#32F-?5#)f/X<^4NX3QU,:<f.WI8RT2Z1/_@[&A9#C(BYW.:gSL+/RP+&1b7
IB05Ia.Q^VHaU40>g/+56WP@1[)>([b;1\TBOK#QR>bI0X[@7?8QCZ#7(gYdaVAd
a[7WBD@K7RAaK0e:0(XPZN__<Y5^eA>L)H#)_<=4cFf8TUc4OXfgQ>&:g,d+eW@0
L(5#3WP^VNCR/Y.=@JC?AG4CT0_LJ-Q#cd_aY^b-G&aG1f67D/&&NC968J-_=ICI
+N2EDg(IgD^B8QGS.7bg?W^6J-+F6/:&1Nb]Q+UMSZ>Xf1\1BTT1Q])>969##9=F
/R[&O?X<:]f#EeC(?DIRLYV0&IWFPLD?A[5Gd-1>>DJI\-5ME&)CK]UIHE2-G0F\
B)+;&@JE-^7J;6Z6Cd?0GXbOAF2Dd?\eO69FgNCCLTR,PQP/CEgN7<<)cO9^^BE3
,4RK,&/E^EEKZB&>B)H>V1>O8c6L_;?@EL\,Y>\TMGaTJ48ec)DT]4Z4QOf0JHAa
Y5S(gK2)X>FTG.I/\D>df/MNO?83/]cXf8W-7K7D810MNd@=>fA/?Hf&:8B9W_c(
6V?5JN7H7ce<+4dWMea2<7=2(b.aeKc8FA.&H11S,-X@a--4IDYJ.]IKM)@@D;f<
e8=LI?T@]g.-<TcC>1.OTdTP+[9(1<,0[9Hf==\fOPIG)/(^VE5LNPe@^PCH5YIf
9@bUHaNd6L,(=XV]?cC:3\6HI4#TXVKIBbc?0>C?DH0bJ7BC)E=M&e>:ZM32U<7)
b=Gc\.WdTa0;[I/N1LVa+E&Q>gAd.#G>6f/4<0A_I<4VQB#N=c.]DZ@^d)\cWEHU
EfCHc)accGC]N1F,-+ERWUCbAaS8@ALddX&I8X7f/3b^.UWaC3[,D]b74VYXP[f)
>7EKNCF>8Q:F@J2T&IG#8N3bf.C;C)(=4F6;HWdYR^#PPDeD6.dXW4Xg@ad58?#M
We>f#,aJ1FZc7B,,\6J,70+aL^PJEBbXRB-T3+V.9IX>d1+=gR(3TBNZ00TKX,d+
cH]F=[A/P2:AO\JCO)6ZF8@HMR3G#I.b/9CD75gDaA/VH-P,>.1OR:bbI0,V:Lg-
9>&9)ROdVc?PF]6@3<<BMQTX.e/,2BcZ@&+d#BLJec+DS,WK>OXb(4XPNY-A=gee
V>E]Qg][-U@1]&gc=8R&b^,.(4E4:GH&dEH-1.(L.S^.@8abQPaLZ?3J?FPK^<8H
CJ[1Eg5GOVb=gOJaaZgL&W_bVE.4g6N,WK7+APIX7fWUKGPU814L-OVJb?]M\[@>
gF^YQ_9>3N)<]>9d^3^SH<JMV@UV=OXaZ58Z+e&5&M^#c-U(0WSWb47]d3[F]69a
4:fH=?H&1_S8]T=YOBGfR2>I,R784+6Q&c2JGaAfF/a#V<\a+;a4H>N&W+Q]WIIe
FKQ7VLc?-Pa;#)Q+L@BSMb=9@,/cJ+<PA^#FH6^@R\QBX/3ZT76+71eC2TQ9W+[9
;Z@D?-QXad^T-26A.g7XV<M]K?8AQ[P)M?=c=GE<>SVBD$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV

