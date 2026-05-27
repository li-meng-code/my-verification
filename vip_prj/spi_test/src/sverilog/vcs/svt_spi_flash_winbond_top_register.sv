
`ifndef GUARD_SVT_SPI_FLASH_WINBOND_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_WINBOND_TOP_REGISTER_SV 
typedef class svt_spi_flash_winbond_nonvolatile_configuration_register;

// =============================================================================
/**
 *  This is the SPI VIP Winbond top register class.
 */
class svt_spi_flash_winbond_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Flash Winbond NonVolatile Configuration Register Class Handle. */

  svt_spi_flash_winbond_nonvolatile_configuration_register nonvolatile_cfg_register;

  /** SPI Status Register. */
  bit [1:0] status_register_protect = 2'b01;

  bit sector_protect = 1'b0;

  bit top_bottom = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit write_enable_latch = 1'b0;

  bit busy = 1'b0;  

  /** SPI Status 2 Register. */
  bit erase_program_suspend_status = 1'b0;

  bit complement_protect = 1'b0;

  bit [3:0] security_register_lock_bits = 4'h0;

  bit quad_enable = 1'b1;

  bit [1:0] dummy_cycles = 2'h2;

  bit [1:0] wrap_length = 2'b0;
  
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
 
  /** Current Address Mode */
  bit addr_mode = 1'b0;

  /** SPI Extended Address Register. */
  bit address_segment = 1'b0;
  
  /** Block lock array, indicating individual sector block lock/unlock status. */
  bit [7:0] block_lock_n[];

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
  `svt_vmm_data_new(svt_spi_flash_winbond_top_register)
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
  extern function new(string name = "svt_spi_flash_winbond_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_winbond_top_register)
    `svt_field_object(nonvolatile_cfg_register, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_flash_winbond_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_winbond_top_register.
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
  `vmm_typename(svt_spi_flash_winbond_top_register)
  `vmm_class_factory(svt_spi_flash_winbond_top_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function void create_winbond_nonvolatile_cfg_register();
  extern virtual function bit [7:0] get_winbond_status_register();
  extern virtual function bit [7:0] get_winbond_status_2_register();
  extern virtual function bit [7:0] get_winbond_status_3_register();
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function bit [7:0] get_winbond_extended_address_register();
  extern virtual function bit [7:0] get_winbond_block_sector_lock_register(int block_count);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
  extern virtual function void set_winbond_status_register( bit [7:0] reg_val = 8'h00);
  extern virtual function void set_winbond_status_2_register( bit [7:0] reg_val=8'h00);
  extern virtual function void set_winbond_status_3_register( bit [7:0] reg_val=8'h00);
  extern virtual function void set_winbond_extended_address_register(bit [7:0] reg_val);
  extern virtual function void set_winbond_block_sector_lock_register(int block_count, bit [7:0] reg_val);
  extern virtual function void store_winbond_nonvolatile_settings();
  extern virtual function void store_winbond_nonvolatile_status_1_register();
  extern virtual function void store_winbond_nonvolatile_status_2_register();
  extern virtual function void store_winbond_nonvolatile_status_3_register();
  extern virtual function void reload_winbond_nonvolatile_settings();
  extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

`protected
a0A?5\,XZG<0M1g7?14-T3D=L@T2M51B0M-HY@?ZdT8+1cc\9XO93)BT<_JaTcU=
A\d,_#)&6ZgO,-AYeRYC56BbRDFHNgGY.0E]CX]7)JS#Z7@JO:VeYc1);VKf[KeW
)]^\XZTG&DdENFI9&)GP]GE#?Q#&.H9VGeBC/FN<&9#8OC)]AXPD9^2.K&(>a<C8
26a40J?-.@<eA@J3^:/:2_S,8ZSYd.M0G7AZPK]X)TBe]M&Ub7Ed2FJeC#XQf=3P
(>;e:bD>,CJT,L182#,+PgSL3?=Lga[BNU91M[Q=UgI[<R13[TOXX0H9=V9^##E7
BR4(@cZ(Y_\UC&B+#,GdN1+?LWgP-eIf(P[@_/J>J[;&HA?;9=^eb#d>KVcLO=eP
Z92=C0V@=RF;D[D=CC2F8=C\<.US5I#Uf:JF?4;O2QSG0@C/<L4)f>A]FS#M)AOF
-<2Z?\?&HUdF(7=8Y.1F)QHYP<ZfOM8?\&[[@2XART[)KM@H=Q\O6#DSd37N9AIW
[Xce08=;X)^A#98c,.G;H6&40-_IM;.]I?7U>S_MH67^<#X8V2VgQM/CKQ:&RS#J
--/;833RTVI9eX,.K8cEC8JdWdN3H<427O//?TNQaX0TF,JHYU;WTW=N<O++-eg2
?VGf]<c4IFd1=4<,Y1ZgKNG\<T?d<cgC+]89LN2d^+8=QG#M.-)7dH=NL$
`endprotected

   
//vcs_vip_protect
`protected
U^W_1?#C-7)6C;5K],b3Xf7NbSX^GA@7<.8Z:f3F/:YWW@-@0^M/+(a]/2eV?<ce
:HZD:H=QfDNR5/c,@(WfLeb:?HQ,UC+ET3SFM0eYfDB#gQ[77e_&&a^,NWF[1OV5
0.2LM\f-cO7@g(HZ?Ta55+9LRQP[d;?EW70S;Wba5X,N03J:ed6/B18E3W6+<.^(
=V-@BDD_Pf@51Hf<3\6P3fB,Y,^UJ3V5AAZ.^,@dZFZgF+OC-T/K=8^;13X9)QM+
AbJ;H[#dXbGJLN2Aaee1&]1QUAOOVd&8AYZM<?UO_YDH9PGS/3N.DWC4X1TX5+L]
AWS]Ue@(UQEKMcKb>CeAd>g(IQHEX4O/e.TLR+7=7R.(&CMEB87P(LX5a]6ZdaV.
d_Q5JV4CB.F/IT_QS53/=c3cJf\b#RQT+@+UDE7<)d[/+f-@_];fS)8e9@2_Y(@O
GF[61GCX<]b]?KPX&R93#,,:.=DZ6PWEd&01VIEW\<T55^D[XL>L_P0I.F]f_Zg(
GMUTP\6=GT2C@L#-Z7)cW9E?Re&D+?VYgYc\f(/R,M]f<cKSCS8H,aL05#:T^c^]
Q5K\=3/31ef<XNW<ZHP[I;/#TA_ZcgPE.OM:Y?JZQ77LU[.8A[H+:7QFcdSD&2W9
S+Hg:g/RY=ER5XP?NQf9&RDF)Ka8Y3?g292>BYJc]c5NFD,LJL[NV8b,NUN@7aeO
+a^+EO8GZ<@&6TdJI^3B)=U)KBSN>=HQDe+<6cOe(QgL&3+FB(b]7W^1W0dN7^CE
7d9IgMNZO1cQD.H:VLg#fRP_bLJ4MB6VdIV;.VLYJF0\PVc_.SBg,H)LBBT5fNPS
X:fO#M(ce^L4@I@-_XgLLTX@Df+Ce3T(X21V9_&Gg7\-FfP)V]1UTK\;4ZW+)@?)
/.c=W2K5YC<beBA>TUcLP@SA>U6^=3S8W>R2e3\)b8O#(H(C8FcZ;5gHZ\g1H8TL
>II6O1(@U8:@9GgFX2T5<@cVcbTGFAc=,Cd;=>\Y?<FE=1H3#+80fX/gU1\Tg7)3
OK>O#K2<K+B91E^Z0>9=D+&37cO-86cb:[90+YA_(2,EJXFU(@#VVaDQJ7MEP88J
P8<NH#E_I5>@O7&DM7d0++8LO+Ne7_4>1ZKFD>M?YE></HPc-DT,1cB55:HXE12_
b2+7QX]1<VR0)<[Q/.>#F5-\QYUAU1WL.gH[\Y>&B@/c?(7G32N2e_83ND1E-ZE\
8[/.3Qb#(9Pf-5H9eEOA]>]LHELafbS&,A3LT.8&YT[-V7=TAS[YaWLYgdKJ)KG5
?AW>7W?LHee@AQAN^T;eTK67P&/bDKaZAYY&1aW_B/BYb8(I,aMHN(Q_0D.TCS]5
&DL9>8(EH>8-eg73SQYS69eKFMgB=eQCXc&989)HfZ6EbSQS6ASQ-8TVBFE7:6QD
Rc+>E[J/0>HB(\Q6]IJd9U5;7-2bZ:D8Z4YDD)1X]F>0Z::>fEG[RTdQST.#7<4(
HCb&&dg(2E)dQcb7bcQ<:/M4]YD;#:dZ.R\g_Y_>3><Wf;_+HU4d2[LM2K2<4G#C
,/B/ON2V9Q(^RA_QO(TSV_+M>I1AH-W?;e7KIJLf^>P+G+#3?3&7b6^Y@O5?b@@T
E(WM0K;P_499<Y9/(524I2HSE.2]>ZFc_E_>J2aFOEQ6[L<dYR#MAIQ_#ePTaA0a
0/:&T7DB<N>Z2=_F55#+9ESE61_\e?_Yf3<8EJC0=4FN,47e@P;8?cG=+1Z8gf8:
&/A=.H3U@VN/>K+<g(UHD4+\7b/:HaOc?X)+Z_a@_##X?0#:\MbS#c-4ZXLVE3g@
L[:9:+dB7WRg>3H]MC\4HUV@B/6cd?\Q.:JC,Gb5AQ97A0)U44#TZG7BXJ62-=W>
AEJa-LT7L.#b:T#fQE?^6:4-@cUI2-9:AKX_H62bdZ#O07-WY-/fFX9F^)_6<g];
8O]V(L7NHfaJEQ,2V=W\GR.Q1ZS8#Q.HW;S7IAX7)P8Vb:Ode3IMJ2c2K\bC):Q3
2)6ATMR^fS>L\&geIL)2PeaZ\0+DdEO>Cb^S_M#GFI3-7.#U.=7A942<NBWU7O(O
b=6_\QJ,#g34Ze:9dGK91QZKT)@XH/E[AaW.#0=7[\[/GdO1OR,K1QT)12?CKN+Q
^#18fJ#^@c;B+-4HSMg?T^?_YXP25Z[&/d3S\fDF1SDI::JD9Zd-Q;S6HTOcS2#U
4_;\K_3)5V5GYX45G)Yd<A.@1affH_N\Z]ZM8;Gd1,Jg2<Ze^E6g:ED0R1:<,=E2
?0Dd^6Aa.3<>HJg.&DYYCa/T(2bg(4WV=BGbTJ(DI9HU-F7IDN/+E65LY8fZ6;1/
H0YZ9UD#X_K-;FDIJf#T.#-3MfSM7aC),J#;/I.SQX=.0((F?FHBNJYNc/aXK/3=
JL&>M(T(E7fW;,KS]ae1-VOcE]JgH?eWA(SOF?<IY)U/V:Q,>YQATdg@_3f=&WMF
RQ_5fg8BG9]3OP6U2.F=QTPB)P=/\^WM]B,QAW,)CW6fUF8Zb#NbE>^<G<SeE,];
X+FCUH3+I5Z]Y848.Y9ecO)^Bad1#Tff&>(7g0K1RZ[,A,C]dg\I>UUU\aCNf^RO
Z]&GS(I;:E4/ZeQfBR^9;e(9cD+VH@?UFXH_<0N8L@\/30\8XNTNV#SCKN5\.ZK?
PTfWH?NLd=L3:?d=MF8ONL+Q94Y2NEUYHb;ZbU4QCeLQ]P<2)@4_&_M;+_;Y,YS2
^gUGP<;d31/K_C3\,)WV:/UWXe6I4W5@9CTHaS3\ZcC5H4_?,PaY6>c\VD1dOANH
0.<b[Y/4g&V32JR(WEdH-Dd]R@dXX:e6=:L(RU4;2UcB7KFNYN+0NX9?38+F>XU[
Q5ZE82QUL9UR&-L&GS/QJ\.2:793)?D<?]F,LE/(VbB8F(],X6ZNO,-Y&fRJ[Y6S
S20?]eL,@/,b:@-_+FI/,R&I5g9WbYAS>YK+I/3OId\<BbC+MTS;]X<?@CM=a]C?
Kg>(H]_&NGC\&>QKd0(\\eKKDGAD@548c&:UTc/bMASUf4dRWR_dZ_c5L:E-MAZ_
4f]\+7;5CYWF1XS^^2K1a8Ze<Ddc(553-/IF&=5[3R,S.LI?K&fX-TBM?A?^3(8)
<]Q0<^?4aZOeB?^J:Ka\NJC9W9^8?>.9_84,=-+(<4Cbd.]WP<CWH45N30=GC2]9
O+F20MX#bG>6&\<g?.9(-Y1<g[YEgG,aDD0W>\B_IQe&X@HP+9G9(.V;N6##KK3<
)T:^JU.@M/;,LPY2(F\d;L=NCU_OGg.Cb^RHN1[Q(TSJ/)#U6VMfI9;b#T8;WV=R
]]&?[J8(:3ZbaFORF1T[+.<,baPF=G4NKCEQ+[8-I4FaC&^?VJ=,MJ+Z8Te>2&Ca
/Y41&,&AH;(>MK8#eR3TbN>NP8SZ+/P=VU80aV,g=&.?fA9ffOf<f(2)[f5C?G_M
[Z\<aN^B9WF3OT:-P4UQK]2BU/5T/74VDYQaR@QAK2cS5/=<1V3aPfa(;4+e9Qdd
7M;cYeXGGfJ.I3Q0S)-L+7?LZ#AMI)LS;N=HS8U4]8-Vg3F#d:67GB[T[,bVCT/[
()_]4QXP,QH#LJ&[OcV9QK,K<UG-e3^V,S0EAQT>\WZH^PN[11PUcBZgVP@.XEdU
SST2BV2fG3(AQDPDGRYZB^PW2EECTF1cbL_(L-(f@8:QL54ORAP;W1<N1=32REge
-;/DgcY9Mf^7?eOR>3Wb[f3cQ\T9HP79XFMPZW\F;(Y,K=-J_^@aNP[:F\f1&A;/
^_5g-E@5V)+??(1U15N#GT:f4I8VLCXM>]aB]Y^D)MDIVOQ\G-dS8?b6WcL1eLNE
EIQ1)2@@EA,5C8&8<ddPJPYB8RXa@?8_0&B^<eV)\I1)-K@M(U_W+=\A:)#>8df&
c3d&2c&D1.MF-DH)BEG;dF-&P]/Z;7M2gUB6&MYd;Z1VMO4C)^ABZJH)T5RPH9=E
e^]9K?7fPS7YF1.<RR8D514U_9Z(_EbU2#.V()BZg9\S;P&L3dc@fIX#H&cFa@aZ
KEPE3@FP6[;E@+WM--[FUWSE4ZS^IT\,Q9H5L\KKgZ@;EXVSS;;L8WVIUAd1C0]8
LANGI5.K&b6c=7]6FER/4AM7^GM]aPCg:0aG5TXc=J1H:M5FV_M+-5_28J:#Y_SG
[ZE)N316\N<FB=34)X7gVDLU15BF3c-4>+7&V799f/#YIfO^EK,<=69I+&(/2)@K
9/^JJ;\7I#DOA(bHJgd(YPX=A)M)C>gbIQX0U3ffKPKB8[GMJ1EIUW_b?dX@8Yfb
?O,23&RbR>\^bb@.DW=_71_Ggb<,>7MN[8.4@PDM&N0O[WZQgg8C8IN\F<\[>_RE
OD-Ef\4gAI5ZP<:DeeXE>XVG2P/Qd,.&;X:F;D-3.-&AE.b4cFbB2E.R7QV9Q0gB
aA9\9DOg@CSG-FF9)]SDB)-2-_&BYAZNP6Eg8&@4?&MZ)H6-@FX<f(ZS:#OM^:P/
UH&FKR<8Q57.0ad_g&05UKbJS1]f6G0<aOad[[G653G]:ad[Ud#S[_;)Zc(_WM]K
HTUYd&36LT6ZR7-DQN3QX[1C,FBe^d>Z_(OKM56N756M]F4N<VOcY5Z?cRG+5^A-
L=SCH>)c^&3@>gVMENXe^/-Z=NCb[fME#N@16J/K8g.W-:dSFELHF?TS/:5CM&X&
C.1F(_B1W/?c3.(HE-Q5Qg(_>d;0ce_^VDKV>0SL]+gQTLb,MYDV<cP+OQNP+\W(
@NgMLDGRMM@5Je>FC7FfIC,@g@I?P08OKfE91<ST66&;+S<KYMLJeIdUZGK1]bF>
dH]^=KCV;G-TT>H/#G\;2RXgeX-K6+M#b+cQQA^6\_38E7MM;U3Y6<-60#/UL1>D
0c<4d#E]C2aKM@QVM@_I/AY6TETe76<>1@:&LBV3V\\@+1V#GK96^.+/T&,G.IaV
&\8-g+ELIQQIF;ZXL0O4D@1b::a:JWGU-\,X)2#<Z_Kag@a6_A<44N^_D#G(T2_D
^QDUc=dbcQW;OD]^DcO4RG9P#-C2G?JU410UbR\.g-Y+eNFB+UBJN2YX@.7>[LS1
&D:ZXdI\JBVN[f<+)9fd?161>)))fa>9eEHX<4bS4U[PWTZ]+CKHcV\Hb_GGFe=T
ZfJ&6@_eD[9:+VPc2CS81]8VH4\e3H=AVT1OPW-2K,KAC-_@cJ^8D\Z[8aS;]6))
<:CBH(L0EA2;Z=9-K/=8KZ^XZ\<+#Ha@CP:1FcP=:gO_[S44D@L+B[ce2NB/NQ-c
@H(LKU<gfJKOF,de=F+aeI5[7>fDF(:2/5#BA+ZQ#O)FT\6[.7F6GSe6XQI^-1Y;
-gaG\Me^@S]+B+IXT@B;?<<+7<6Vb.[>_g8c;+de2Q>^Q:A<<4?MFGDJB0<;_KJ6
7G77J.0:)MS)K4Cd>9&@+:-HJ(gYW+JYH,#9YTba\XgTb5OAfg896:CNB:V1W_-+
Hg-R8,#aRV@CeWB1KKeWW\Q+DC:?^J^d.f;0=\-Q\D7>B<,3QX3K-1Q0F@f2&HZ0
>CEBNKFa3BNYJ]GfKKC=>005],LV4LG+:XJ-gXRY#W#d0X_?5_,d]TBJf(Eb1?<&
e2&U184)<Q0fH_X&<Y8/UJOCN+dSPgdPB7T,1TP\JYd]X:J_&Fe#FH/J_XD-]@IU
0LdLRX-fMT-6fRdD+7ACZ++-D^4RI5?P/C#TTLOZ)7.^3T;AXd4.>Df7V[TT_&X^
(b=YXPT_W8<0aaYU]S\-/:.?U?bRUA@437PKNCTRFRGf[]+X=X6V\Z6?3Nf]:#.Q
P.daC?L&H[YbIVaFa.VfE_[6XM+?C7Oac(KGEW?aTD(YRPPgG0UILac.ca]e7GRe
/cPD;Se9(D.&dWM,e:GU@G(\?+FH.@83]RPF#C)6e@HGOaAe\P71bDHf>D./K73b
)5U579Nf4++GHR0/IUMM=4G0/Q38a=(+7cKZ<F^fM0/89;C&PQO5:6>/JDL_f^N[
KL=U29d9WGeMRbUKdfd[7VD;CT>2G2URX-Lb@O8(6]eGXZL4^_5a(A&A&<C[bHA(
6Q#,^aVHAJ6)ZEa0:OM5d5BX/V4b+5)/-aGO3(?2(<]:f#]GPg)]@0>F[X;/PLNP
\2g\5_,IDWL.0O&AD(A+A2H>.VT0U]OCYPV5bPXOa;0YMD&]A#cc9OMD;RbZ(?_&
1[RRU3+(^52Z&c(._Bc)1R)XFLDeI,aJ9KK@Y\Ff&4_07SY2d8#=dS-:&LPYL0C1
D^>X@P-7;]dBBN3?GO:-O^^B@^4[BGCN?[&,9Lg^Cge4II,#\4YZVa]-EFb#H+H4
;=,L5Ge-cD.C)RY?GT-3W1T5_//@U08V2\2&N3?SS=<\../IgL61@B5HWS6PB[D5
g61.8)cO9I<=dA;1;CYYf0_]OK:NGLP,0MTJWYU:CAFX9WTHOGc_&IdVa7=XD-IG
WU_2-&b.34Yc#4c-\\eN7,BcX=5;[#C8QWH?5LaH\ddagOEY;R14#?XWO]^>V8=:
[NBRWQF]b;O(&C<SL&d-bcDN[deEX=[3#GSYXAHX\W4&H7,?@T@6+adff_a@#AS6
0H+=I\_/Z+)?U//QMCcUB_:M4g^XMQ64Y^Z2_;.WeFYOAPY/>FaRSU18B9ZgbSEV
33V9VB^-a?2U).9G#]Qcb,(&eLN>ZL<RNV+GW/#8VO)).T1&JSDE>6,4==<TENXB
U(-K_OXP#YgXg)5\N?G/YK=Ga)g[12?(QPKC=581I/QO\V>NEfAE?Q8gK+e<GYPG
Z;fO)P1X(B-gNDb#@c[4,BWZ=07S2c8R::O7\2Qb3M]Q_GTA[@4Fc>Z9F(\X(OMY
S)ZaKQN0^V?bV)dQ)ddP7G0OHM\C(L47U3KKDU?>aOTdPOCCS45/H?QB(LYC4-<B
;I6cHAHA7DF/F6M^,Y\+=3/b0-RW(gAXf+bBN?DNf@dM@(^O/U7e.)=R&.,E_&@P
Rg;JD:H+.[b#cga_N67./[Y9e(YQOGW6[63]/8X4-)fC0?c>MSEPf;OZ;3&Ld>28
&S&DNEHcg=RSXK8:J#.FVS/>]dEFE=FZFB0BJ9;N+A3VPgHY&O=#gR[WR9+<Q.a^
f)Q^O6&Y_5EHI0]NEQ&S(4WI+a;FgeEeQ;AT2<?YO-;1#L+>d4>A]gZ_PIdW<Xg1
=VfKcLDMVd-1:.K]?B-d66[-;9>IB?HI7LJWYeM?.I8>c[cOJ)4S8g:A@D>f]4FZ
8I_>VgQY6+G0&HQb7HZUS_Q4>\C?+QU0MV:0CSYN3Mg+1#O^dG+_/](9.-I/P[]K
JT:d9#9JP:cTO.VF9Y&S1]I@)D9PfT3Pa\,H&E(,6NA\:#g)4d2=agSOZPe>e^<4
=8OE(9P&BN-QN]JEZH>:JW#?ga#_1cEC\[=/F@TX+BDRP&a]eF0U_33-I<V?Pf7f
/WWB6ED0ec/VbGX@Ie;ZaM=99++Rba]d:0d-OdEE/Oe1:fWUPT\<M<&ZY-/>MVQ)
_U,9Nce9TPKACPK7<N74OU^R=\6]D9b8IX??#14P1ECP>_S&UXK[6))b<8,YT5J7
IJ@]Ka(KJ3JD@BaeQ\:Y:#8N)N#6C/M-JY^Wa<V:g_/)^WF-,K06+A[G1,5_<#He
K4[@\/B(QL;A>7)VYM<IO5=70?4#J]0T<>7:]H;e08P?.cE(&/3=SZUO1L5,H,ea
c#P5MX&_G;c8gH\5.15BX04,G.bPN-V:2L]QMBWTD6eS4NUg0=0D[](]@7PH=Bf3
2@fBFN9B3R2X-575cZb@],E-2@R,(SEH_)/>L,OL8]NH21P-T.NY)-+(J(/7]IUE
9H<[WE?]<CYYZ.OL+JR6D&]NT:[>?g,SSTJ:Le/@b^7GK#230JE4DJCAab<_D4Lc
1AK)fe\#HT^]6g8Z^J?WBXGR9<3B_TCT6Xd8;F^/9D^;EKA/f^7&-OVNK+^KMca;
^>M#5e5R(g(g_Q3a0INS_g10ISBS(HW>faMcN:N2E;_g)KO#g?Ga/RC\DPQF1UZ]
F-/TN4C_0W2KU-GSA83g1GA</].&;cBL+&F#FNM)GHAV.(UaaeTb@4g\X#]FVVRH
fNPR_VF6B6U=OD6bD6K;>OLS-(HA3f2H8L7-//C]g8_4-UJA0?PL0O1]gDZ_5019
K;aTZ@g^bcLDX?U=--=CK[(cV9#HW#@^O#3BdA.eN]T?>5]=)=9a^J?FU?Rb=(P]
MdeMN:cXf-8DJJW5)(5V5[^-:3;4d0:Ra2,I8gcTV[OSZLLRI+BTM=cV4,=]1?QN
dORWWEB\824U4e8eJ<?bOS?X)?XQ(eAH;.7M).&(^W)1].EaDBRQW,1,&=G1X(bL
\M0RM?ea&FFL2,R5L-97d+Xf3T3Z49XTZ)4\HeEHYf8/[AVbAE0OD==8PDT^#(5.
K0+CB-9;.Hb^agG^<FEH@eEL?5_>5T_-DRR?<[YB#:40@:NOL,B(@9(_W/UN[Q(O
]V;J8PW5Z263&E=/0XYR#;#AbDXY]OcITWAFC&X;T_S2/UG3;gCde1V3=[BP2d,(
MMX5(LVBIZ+Kd4eO(W5ZZa8-09.Q/\g@1<g18<,8:3NPU4LAS8CJPeBF2IaRS7d1
)#]?4ZFGCdQKYb,XBDWC>>IAQ)./LOdAY#YE=80aEU;W)0GCC2D[Rf.>C)<K)6K,
#MWUKW)T@AIe-SAU/K#M/^ZUQ9Va>81-Yc6>.\>fNOf_^KGXGU1?V\cK+G5--b<G
E@NVXHWdgA5>P,2O+(b)8F2UFDJIOFa1Cg//Xg=G5YfJ9N><0.c8X3X_\GQS:JUL
](e7X=?7P6LL:)XbgMA/&^2;D7AgHN])^JK#+Q;SfY=Y3<CNVU7QYZ40PcZWZAE9
S^.d2cVTObZ3NPGAa(_/;[MN/1Y.-BT):&?NZcC-NFK.B?aTZC8?.7R:9,NFT&cR
LT66Z2DDKQ])@=HM13?)C2YJ/\[-LK,5bOQab8NUba[EH]PL^#1-T#GQId_?WIQH
d<>(a.#F=AL5G4<634Xg;e.RAQB+>A,&e.+GB7-3W3Z0DRR9a?6DdIJ^8c:2]D<-
M\]YXO4aDa.If8F\<V-JW_.FSWfG_K:,SL2Y6SbgN1T)9a94J;)S?T81+KTJ(_Cc
:ACCDQ0\>[ELAb/Y+TH[QB8Zc_a:_We&G/5AM4=JgWTFN_fG,g<I.d4F);DR2@]@
&8DX7[)^>ZA=2NU.P9\;5FZWUg4dTBSR8-+gFb](SACW^a@U6.3E:/C51L[FI]+H
A]&K=0@?8<QNJDP<W1)3I@VW90bea@P4VCISEI-?5AT\d/O5Fe[=E6_4(gVKFE:)
&H^Y?Ob.4HK>)MJ9a]f[VC>MdYEFeOY+IfB)[<NH<d,,,:fB6WW\d=g?]S<BU/,+
[NRLa@CP3XLK6V92-fb/:#(ePO^?3@:F#-R^KG,3cX)8eG#=O<;\8X=\&#;Z&(R<
],9Lcd_MYLEK>aX)[E&+G/e-H/M8#OX,g3I[C>U_781]#T6;37g[eHWM.99;]G49
2HUd5=<b34MF(F4/>,+CX(?5,J?I@R,RHUPga=;LIaNfdA4#eX<PZXF5dP6g7695
f56df9W\[C>^9[OQIC<1FGXaW<VZ3)b>,WYK+S7ZCA0O]Q^D9@;.0H9R[)&ZY^E;
G4Zb)V#>7_-N_e<[1>4eSdbN&aV190G_60fH1^PcVITIPXdP]@;71_:MG_IB\AR1
Q,.VgD4=P_,ZZ0I)MAH.3UW:,@^<_#G@5eYTP5^T[g5CQ[,gZUa3G[_8Q=_6W3dI
#O?#PVGTL,#bG(][W>P#4\+2QbL#&+7HI&<\T7)FI51(._;]\B=8f+UfW7[<,DX:
(>NB:7@>P8SY)f8JM()gX[7dI6=.13<JCGDP4.C7=];,NR3D755)aR<,33[@0D-O
DOYMNGf0gF^UJ)1[EM,#cB(3H:Y[0ZB719BcN]>9-A6GND-3O)\K;UfBgf3c;L9W
DK;[YJ4R_^P49WQ##B]G[FQ8AT/;/&4\C&UQYXP#8Y(P27\[3[S)0?2-G4e7DdN.
LX>.Lb_,e0P?_c>dJ0@YAGF3?d:a:2L6F&@?eSbW0KK3+gD5YbY(XB#-#E@b&2V2
5SSc+,bZdJ2/IaK;2aZUbZ9;M@\CD3HO-+(_]-IM.V4e#@=D<eF:\[Gd-+3OI#g<
5f,8,]T=/(;PX#CZ^4XE2&AW?F#,BfQ>JaG9GNOPbHD/\M6-=91IK)7TQ@V_TOZ:
YEGa9;:PV50CbFLC[gY48W9E6\WSEa_<N^<D+#J07Of&S.@aZPc#fDg/c+6C/E&+
:<RG&#CMLDO=g@)f^cPN>e?M#f;AS6U@:fg;)OA1Va#+cc(L)cPMLcWK<_)H8cE?
F@I&IAX+5G5df^KMbfIDgM:,[\]aEZQU.IB^aB1C/d5\5KbG?=D6<+6LJGb,1:ZC
A7<c&+\A,ELR[U(<H;ZQZ^CNF5\+],#0&MM0LND@5@^.@3.#/V^?2Qg#\I?S1G:,
ag6bUKgS=_QaE)gG+d=JcB3R.<06g>+.#UPI=78H<C-F[PLaHAdSXcN9;dE[O#_:
aRC@4;_X)T?Q()T;MK9E5fXbH]70NAYNOXXAV]0c[U.Of[cR>RR@52NW/4,O7YgV
cF>7FYUYeM<0BcJN_BZH=]3:0[c]EfW@R2f)WPP7BL4+GV4/2C7X;^R5O-DWMW;Y
<5/#H0=4;3MD?b7YBJ/L;N#<g#5\6SdI^FZa8RN92.3_=0I,5@f?d/IU=D6CQ8ZW
&IYJQYX35Mc[>9&WKXP0U0Z4YXKR5<N0=K@;Md1SQONIC_F-UKKF(d5f/)1-F4LG
J7S#aNVGT:3WGUTZOI#\ML#Qd8f_^bgYOPBOA8@^=L#d/_@.9N_5aT^:A:\M,[H3
#4\^+Q)HU:;KDS37&cI)_B\.I^Ldg-/3>=-5)M9g;f^TI>[NMKHEA3UC/?Y5g8A7
)M@5eCSBe6Q&faJHY=Mc,Y;U#IQd=PX()>=>@G</g336RV7.TYDIOW+E[QYSP;<B
MOG?/GV;+C?2(#8F>P\:-K.=F_TK/3VBS-I6=O>eQD;F-2d#J<[]d(H]V@K0S#4D
Da6:c+:PU\XZgG\Z/IQGdCa1W.,6A?GKa:8]HPQHJ8V9WR8WQ#7P1:a;C][:HJ21
e-d<?<T3T,1/.7-&+)a4cXT9-[V-#=]agOUEEM,31V,=3GM1Q>#\;=^:LG?]fTZJ
\W,TDaM:MTa[<^]bN-(g?[/Wd^,U^QId@O:FAAK8[UER6;9fK:?^I?JcK6^I/GSE
2V]g[=f+Yf&G1d@97LQTb.^U5-b1AN7#+A^@TIL-c#JdC)RE;b3c6aHdc7QaZ[X_
+a?RaLSF/dI8@ER;Y+^Ib<8b+J0\YM5SfIS:/?E,7U.B9^X<Yg\3Q]&1@XZ>K@.9
b5XS_NY>)RAABfD&-;D6e-5eg<;6Ye\DB-MTLbg:68;47@+CcR=OK8\5OV<7D4-H
OG^.5Kc&DB8CECOFB]-)2RQKQ7C_LW+REI5I6dL@BNS8UJV-QXYa?NG[g;G<L9&>
+_\3M=4AU#TJ;2U.C>QO>5AAFgBL,TW(W94J8:/A3=F><J=FO<LRE35b9/RBS7CR
P.c&a92#1Sgg6BA:):;KgI>92,97QaU:TENd?T9S<87VaW_U([UW47Rd=-XY\:Fe
8<,g9;E+1MZ(L\#0S6#IS4cE?3]07g&LF3.[b1=<G,NJUf2[=UDZ^ZZ<NN@V:&,?
8+1^JO222(U6XZP?78G1P(6P+:TSd6;1B-Z360;gc)5ONB[ZO5KAf?YER8UZ[6I@
7)<M4TF2bWO1L+)I5)@@#>a]6bG;M[1(@UOL+X/;19I-O@N_aMJ1bLGFJ4#f7I4I
b=GLcZ(:LPRLPI]5?\_B4T]^T-+.:/5JZK<>[A1c0M)-2YX4I8,QL(HWG<4&g11R
;KP](XQZ>U+&ZNMSGE9MH2,dRSQ+Y\Y#8,d?6Ae2>H?/0@T:cZMQa<X?ZIZLT#1L
.ebUR)JZdP9gAZ>C+)#SU#?-3C_@3U8eWWY3C(e^.LJ(>AMOF^AO5RVcGDGNfa>H
8C4c6AV7+(GJcA1JL+0,L0?3FJENYJdR/><N-;KQ41)6K_D4\5TP@_:=d<\F8\-6
ZYb/FW3Q=Q-5PUA2gb--2;RGd8@c1Xa1Y-L@S^3a\@GcJ^DP63gdI_TIb:8\>LBf
>F+_U@N/gKU;=N.1NP:PCKPbg<<>32IT/?Be<<HCX\PX]JW,=S\X>9=-f098<gbe
Pg=PNT]W,H9TE#ES9J.,+:>;F&90=#H4V_QFXMBA];[F_K;bc0\Ha5,?N\a0XOC_
??gWSKO\4HO:gE#8.+[?<G#(^-LY2b<M55,1b8TdK81<:94;1]^=[QLcBf5F<6FR
fQICgGY).KU@P=J2R)Z^X4W>#QGB.2+I:P]&S+HD1E4T4N<W5I@?a,N5VcN12?M=
JfR73P8;4=PcbEWL=5W#PVBK:(1XS5[_bETcH(X2W0J@CTVJf6-_;c;71T\5J@e[
=V,@5/?>6YZH@V.DPM;77\9WJQ_.ZL#IX-MB,+W_Q=f<d]dN-SbdG]#7()2:H1-U
5XMYG)+W>MX1fN.0Fb\V#a7X\0/g@M,eOXSV?Q9T17:2&Q<(/J0FN#?;V;??),<\
I\@RI0P;AA)YZ4.dN\d[[K.7Lc=FP?JfQf;8Xa83&7F(cHBJXDJ1J5;bVN&/\7D<
@S+^?TB06a99927[G5gGcf/KFK(CY2=PZ=HM7;[DeecB=I;<Rd]:FBKZ]Q:#I)>W
.MX7(AG\8]&()aW1NKgHZ<V?D]>==>.<9V]:X&[JZZ5EI]QZXG./9<e<fdaHNaIC
8HJ-gYI1a#,L.d1PJ,K+FbA^IfI_[b0d=]_C+AL5>NJfWQ9@T:0P0]^d+_-^<?Y?
f).V)_TM:PO[56]18^aDW_b?U&7fY(]df6(dK;2R]+[=5HSYf^0HOVF,OaFM\UGJ
Xc4+Zcf]0LDaT^IbdU9OLZKAK;-1WQBVV.N;GAa+&a:T<BgZBf5MHI(GP5<@-;C@
7cc7Va&.>;,)7(9O1U]TS:>I@8FMZN+W6I;c5865#6@^R,(YN7JOWH(Y2Z:dXB#9
0\8DO:1>4[eZZIG2\+8,;Mb&g]6(X-gc>bX7WG;E5P82X;DX+W-d,V.4^EBD:MR^
VaU>]9P0Q_/KG<W-83dP>Y(e1=A<N=R,@S@D9D\eA:NgK102VKI#[b&C,V8S1Xad
a7bTf_.IBK]SAPeSCOZ_Ud+>@Ue.3WM38MQ7.WD@,Q=N9.TQ6dEEEJ@,UK2,S47\
f5,-HCVLYJMF2OcHdX-&;Wa>=c3V90DIg6H3Y@0MPgU7dP]+)/QgW>MdA]PW^GCL
^BP-II\cB3V<[d@,D^)?7HXS\d(?ZId5<7:YKc[c7,Lg57S6VN[J]NV)I2PFa]8c
=B792BKAgB#+OI08eBNZG-#XfERKB@>4f^V##-[-L(Bcd?RLQeF_66DY&T2<@XGa
C1./(#U(^?S^.=d#PKV4MBUP75\4M3c?=b:99;d,Yf\VGB/R0IQ<,J[7N42K4L6-
\Y8\W?(Z(XXIA54+:OOEZ5a<Md;07./IaFcb9)eQGg?-6-[EHgEb1aP.Fcg-,/M)
.&fV2#Q^KI,?<YMM2-05LgZ2:>]S::g^H>\L^dVK,9,H4#+B:2aH_0a1E_06Ib=g
5NDId4RFbGdK)W6aZ[X>X;&JFJIZDBH?MadfRg@44dFP:g-GbV+N@I-8ETY2d.;(
BO)daP:7<E0.ZM\-C2fGQR[&@&F4>,R^XI0e>fc.[Bbc(U+c_D-7CUI-#,EA4+\b
Ne/Jf\;DY&Q0<;5MR5&SRRfZDY[7;\BUUPT)XfgBe0U87=b94ggPD)E4<AD>ad7-
\.\A(g>S5G^NBIZO2(5CBP_@)-?HfWS72Ve#fCTdH@=ZgRCZNLS?><WZ>P/IdP_K
O+aZegS=Zc=H#NUN6ASXA.-9.P3Ag)I8gJ.ZW=EL[+dCNE(PUD-JgQZ=T=T/FYI1
KL6@ASH]0cbN9+JgLe[G>4EB.4VJIH1DGO7->2Z0)cOJ.KL)A(&4C/U[&;IfBf=)
=,SIZ\LF,PI/#HL8>Od]-^0HKG&eX9T]P)UA@Ud,QFb&gAFfe9LPF#D?ND-?ITDa
CIXX9H^eI?>bd^&R1.^TKdVf76e&43=CaROH4Lc-5/D86;B+J6]CZJ,?1^4-@FLd
g=(>Zf:EbKORCC2DL,Dc4#4/?@WeUcZGd+Z2d#Ua/_,W90AAeV/2/DR.>P4_RKc4
3OY.Rd168A6.ebYD;8OH:e0<<=gMU@f+@6X^c\K]C.VAZOa.,c^Q9dcHS@3d@eOY
6=_f?4@P@XEJ^FZC2<<(5^2U(^?XJ\c2^NR(U+7I:#-OA:HY^>5HgWJBeg>.O.f+
Hff=;FcA;JOLQ1L^^9c092>/5@:QC&EcRb[X,TR;dLMSZK>2ae7.\@E^3P5T8_NE
Y,UN?c?gI10BIc5PF\:I#^ZL7>NYJ;ZUS&]-)>bZBD4V^,_f>EDbNGW<:+D[,Q-]
BQ;Q(D33e=-P=RGG;MY#_e2QS]C<88]dH9\<ObdfEWIDF3BeM@B@<:0K,3e]M[QN
a9\#@)>a05.BSZR@dVWS?eE(]U0_9#P5>b.Q8_@#WPVX2F)J:_JHJN0-LZdQOHLf
1&e-#,UU0E&R1Q\BCd57\8KdB9RDT#^1OQKcZKA=9ePK7+aSUFa&>U1BM6_R,CTM
BAHe^&gL113aSN:G9a56g-fFWNYd]f2^BZ+O39J3>K[2\./+\;SU@cV-(@J/CMa>
D2?8MS?6>Id2_><3XE=4HEQ:bU,^OQ284107?E5RM++KHeVP/VZWCa5=735(=+UI
Xb-&\F-3PZY,M]JGN[g_]>=>1^FA8RPSbF#/VW,?_XZ-H,(G^^E#;[:7=e_&g_X5
<_,\2fL?KE8fML&g2QXccJK0XFOK;)1L1^[TU&J0=BgRRYaV&X-[d7W7ENV4(#(,
UGR6G;<YW<H.bX?^7LZ_Bg(BC5EM0G+gaUGI+Bb=.a?2\deBc4XR;</GG5[L)KVK
\W^@C#U4+cGPL8(SfNfJ?L300DX@:-6\d<[e,CBCJFZ72#a.[]^N?VA8ba?9g>;B
CLa1fbfY;)FbXIK9-.6_7,GN2_KA4T1HYL><B<,ScE>&YSJ;F5?0E)#fS0GFDK?B
IcNT?<2#,58E)Ga=Vbc3=PCW7MPO=(3aHb8LB.gYUS21+1I\c1bE8+JUNP^<d1MT
1U/D=+F86@@-2cK(F-(?H/W.E-<>]=2-+9WD0TOgUPKI\g;^H+FMR@Zf[NW0^6B4
/A0a0=>R=C^3N8ZQ):deJ-_F0JQ<5ee:_5JY>GV6:M/;RJ2bEe,B\KIaR)M5ca=5
2]KVa9bWgbgI&^D_VgF:P<]fT8g:gHYc0?<CVR(eH=N@-:.L.[D9#XXE<(8AOe,9
YGZg7#-W5IOKETP[8aaW9:E/RJ)#(]B4O#_Q<XF[0?=a>M>X[-/P?YFG(&4<-eM]
gFLg4GLS/7TUD.,LEJCc9?T0GbF=]SdR53OVN2R9+JJe\WI:UdeL-&Z.+QFPR/]a
HN=0NC#^)_.:0bU^4+05/b0>F)UI[Z.G#b;Z&&/-.)+TGW6@C(5]#O^4#V2X)KW/
G?1OT<<8d-Z/b]0:aZ2-)adAY(GJ+_LQM),#eCTM01:?]NY(XW;I4_U2H5;+>GGC
_=8\UE7G&342.J-&.FdCL+NbFE?6JK<d/PP8#d@UD]_E:9e<W@?)6,S_Z4f;B@K<
dK@+=c[a+D(dKQ4+&:@LDT7.<]S7/8G_EF4R:WE1?:ASKNTK4N.eFNOSOU]DJ[30
2JY2P9f)2QI\I#g-Z6NCQS.aX;8-1a-8-?Q0aN:PcgT?MZ]eE21BO<U10(eV,10]
IQg1F4fLCB/G]JNWCYVJ.I&[ZNac2.G56dY?2V]VTe5(5CdY^N;c9K>6S;3bL;J7
fD,J1VJ#OU:CPUOB9LW,-f/Q?U5/K6D3UcHG=8M<L4WH3IT2H>.QO_cc0[762AI&
3VU[4T>UEH0,.eaU2K7>,ZZLdVZY&./.+HU(V0G,S>E>C&G4&O7#UaR;#3Kg&AYP
eK_DEQf)]d&.XE-F^S+cR5V#-\4BI,1a-\0)=7LJDBcKPO//<Q0^)>M5,O&9K-^I
g7e(>+gP9^g,KDF5S^A63)08+aR;:HIcY>N6])C6R5(f^8(57OH;(M?.GbL:2PCL
C2WBdNA6+g_Te25Z8Y]Ig,WL5-G^V,929V7:)TJX4<5S1-<GG#\GaX\X^SS92-3#
3JL7c?AbU[VEV?7@d6.<_X@YE+?A&g>/A[M\&^,4JHaGRSe,RI?XER>H(Z0.[A/C
:P/E6b3[1A_EB.gASJXF&ZG40f542H[>EE3/CO=CS0Yd?d:d.ILbG;&dO]KG2\35
18J3QbYY[/9,:&4c^0]QMJ_H&HD1MFZTN,<+K)H+=&WXCVCSZ]F7]bK+Q#(:)[-S
RTWT,9-9W8f,3e&=.\Z5)[TOAf1BA39C083fWb8XBY;EY@-I6RND<L7W\<FZ:#.c
1L&078>C^YMMFAJ[L3X\&S4V0Je1PSd@<9Qd3?Z@PfD\\e0.]UH6+,,.O#D=bC[g
(c,cYf0@]73U.a3,:LMD&-RdC&HR7#8(4eL./NZZ(J]K;UL8P)g=+bcAZF#EJTXT
F:BcU&Q#?N-X4,\]gbF>5R#P5S#b1IB;Bg1.7]0.D]#eY(f&D\_b-1<BT/d69gJU
_e\&GCBgM,X<AT/@NZ\3a_D=ON@@8F7W0C/BL=+V&/(5cU/(@N4RSfA>D@_;#.;L
YCYe&U^S2&MG]Qf((^d(3ZZeK-6@8Yf\,&],0VA==GWFM/DK07_6cCTVN/YWfL=1
aXM^MdC9_4WJ\KHBEIZ,ORG7)0.MNW+@]-3F4L,3UDTf.?7-IJ@AI\#GVbZ+3^H4
&VNIg-&FH,)A<>AdKM3OI,&S2^BG1Gd(_OIMeHX0df47S_L5,GO<5b]9&MIZO_]&
b>>P^1Z190QM8GS.FK=aR)-_BK=SLe#>YE9aUgT6L1QF,[:#?.9F&83b0B>P)c2S
+Y]_\]-AJfMT;=9f+/6PW0QUaWH/OfTYF?J<D3DACe==WVYcA@88O]NRXJJ.YPF&
DT7\R-EZg?\CQ&]&A]SHP3WW];cLX=]^O7<U(J15MR[@/7[(c[_NaAZg_?CVJ3(b
J@^QH)BVSMYfIGLOKB.=\1VBZEG>/:HH#L;=&>EB-,N3#9]f/\?ZbffP;gWRR2:^
=&/UZOS\D-W@N9JFgI0]g=2KBT_[Bf&#YW3a5^=e>HKBdX1EJ#eC>KA,B&UI?0Fd
B<A]A@5>L=N7;(>EN2D/_<OZA&3#YcOOW_,L1V4JKdBKY9C;c0=+AU\_;:E@.\_>
283#A+INA,SQIV>P<1[=EUC-R<VAE=P.dbK-+XEdYJS\T-?Ld[/TQ&U3013&_g3L
,57c<f8#Jf+V20)A#d+#P9d??=EeVcIGV@&#O9>(<5&1FL>E/3=7A+S@X#D3[=MB
X#F/Ie]BU;E;NBP[6,&_Qd1c5O&?fQd)gUBS<KS@[4QdUAM<\U1J9XL_=b=KZB;Y
J5f^.>Y.+.+B/4&/Hg^TcM8L[8FHHbQ.4:7Y)1S[M<3L_fQY]683O:<ce^A]C?Y&
aM(.gWc6A4,[;N?+[S:GVQX^DUDHB(XZ,INZB54:HdP)LMI8R^\36&5,aD]0=/TO
LMbX3=N:BQZ^&/,c.Ic?O#c5e]9H6SS-Uc59MS>_a_W3LSOFU(b0g34X--DT?)<4
[K;+eCU(G1_&=I>BE49-MK^:M;KO9?Y@Z45PSTVCY,8:_-N[G1eegeF_-C3V[#/K
J:K>\B#g:P4+A-BW:\YDf@e5;N7&<;]_G&[N@XBf(\d2TQEPgAP63BA4gF35eecc
L58;c+Z/(fV?V#HFXQT1g/5,QDFd]_SFK->EfE(?^YQbB[O5Oe).1;:>+E16XRKX
#gC]M+^3Aa<Bf@HYM_a5>Z6)Me@FcbXa860N0QFBY7g<DZLf9WKg@=8\70W8Q:^&
H9Z65e61Bb_4)G\1VE1&eW\P55P&9@@KNH3aL78RHY./)?MX)<\ZV0F.66g7B)4D
b.N)?50IE9QKTT2R4^0g9\ZQT?,,.PS=^C@,CAQ\>UL:5=I0F<Sg1_^X:^_,11\<
?AgP>a&]TCZeEQMd>R:Id9@EZfYJ[VZ\<30(U:Na)^/VO/8(F;01ZOW)AYL(:04G
PcBGWS-#&+JJ.;I0MYV0;:7HY-(JZLHGR0]8b_S,gc)PNg+56Z=A>SK7NI0;1fRP
Id0,@Xb<&0VM@a\+(KD/d^ZT#)+C&U0V&9ON/aeAH0)L7TRO_<[g#eAY0QcAQGH1
d=5:KRZORQgQ2?QfE\fRQ3)Y].24^X6A?H76b,M@J6W#D(K\IQ-4#UME\7a&-W<T
@9:=(a0S=U;0)ee>V=_D9#:NAD=GQ^Ba558Occg?#VNGg/F@4f=6(Y;(YAW2+WLA
HX)5&R\FB_VUc(L=X=YX>,?ZO#dB<PDbf>Y7[XGN1;<-bQKX;MSA7SA5J>Z5<@QJ
]0FP[A^)dN9B),O^=0;[b=C,<5)8\SJE8NC8[?_4[3\S7QKU2LCEFT&W>V[aHQU+
T@V,9S?YGPKU=D^)33+NNES(T\_Y03ba(<6B(/UG@OeF+VOIZF4A.\\I0N[.0,RZ
SJ;,@S5T-#T\cU-IMYBf(T47C9K7:#B71c[@ecS;-C-5K1PP+/OOQ@;\K<WQK60.
Lg#K@1&P+JC_13;@6W5aLH)b)dIV^E3;JbeFV8;VK@^;0YLb:KSgX(L_6QaW6)O^
1(Q@:)XVCV]LT2.O.&GaQ;LgfC22.:cF8(8Q(8WE?;D>36SE]=f0LgI\?>FP?5<&
Tc5adL=HX..4#1Qd3DJS)-aY)=XP\,,VHX?C>7ENXN:S3UN4CEeXTG8XcWS:2C.5
>I>C1^67S,>NU>+,>:IKR;[P)E_71;D-16=PN45PP1^ea4/9c&d/L)2)<ZG[3XUb
>UOTNcDBOg)^>3..\c3ABI3dK^,\=(I5LU?RCdVaK\?O^3DX3I)_&S<VPG\JOY^0
:dPW7A)E:WS5+@_Ue>RUed9/[@]XNfdG,=Qbf]KSQ@FBPHBW-T,_OdCJ\P#0/]9^
PP-E8IEG[>aU8W#2TGGY;A,?cGe3^QAI(D9\,c,d(&DGB-0Q^5K0?#XOV?G+67JH
F5g:=69\#6T[.DK):[beaCWQG21#-[Q6I(\HUCN6-EY/^88V-.JAJeA#CGY@G^K:
LUIH5S9873cB>5Ra>X7S+CR&5&U;D4G2#a;3+3.,/g?QU[PY\dC@.aSbcSaNR(7L
DP2OP:QNO.6V.&;G8.GdMQ\U97<e[UE-K0KJZ/H<>8C1U8MD?K\SVN8A/=>1H=:,
-)_V4.?IBTE2Oc)62J/0_B\OK,J_Q4JD[>4THL-[]O1P<EXZDJ<[E/DK4,/5K@?T
4MCWYM@^IB+7FERC14^R(/gEg7b3NMYH?O.<XGeDBaP<L=F\RY40FaP6B;4)9P:8
LDIV7<6&ECL-A:]d-8-3>2DBB?4gJ76S/U.R122::-,2B\-?a//7F;[11PbY--e#
&#(Md=^<ODd?C)Z?dO.6fJI,Sd]1;N47RAE@.@1=M8G>3IAa_?VgDb8\/8/:LEK@
L>L[6Z(/TG^M=O=#CE;aBTB[^0KAI2GbESD@:HKeTP)UgOb&F2M(0>_V3EL/6aT[
dMT5<^eS.M>2\[[MEe>4/N?Y93IUGc88=e7RT_K<4F_(50(d/,Q2_IMGJCD1JZ2;
O2URa@3W;2Q9V>KVQeeA7Pa_HXQ[[V/e2+gKFdA:OcFME\6@Id@cd0@K^)+1[<YZ
61e_=BLa23R:d&B9eQb[\deaS+USIZ,dQE-@UL]W<2SFg3UZLc:I\F_9=)2ae()c
f5(]ELd4/+>.;E#=7cFR7C]6O3/E-#P=fU6;d>95/L0P5[31ZD49]S:d.gX+VJ@=
\0g0<.HTBV\G[EEMBDL&>W3I#B>+e5CH^H<SD.&.6g/;,&_YB<41fSD]KKJDN-AK
E52[7EA&&.:>C[5K?.A:fS0b]N7Ee9Ya33RR9K7MgAQJ:U.QY-J(89/>#/cO5WbR
F.CA/I;aRS3.7^a<b@W(DA,eJP5dDV&eNAS>KZU+0GG6R9/,PB,S11UJP66-1FGC
\Z5?V0NDN;g571=K2]Da1D4\OB73fYXg0\RZTT;Md>g_YW8CGE+./US/WJaMYf+R
SYLaP(F/04W=#a9YeeMQBCW[=/#Lf_0#e-63]&=;-_bf=95IBf25_0c<VPO?->I#
-L=1V?UaJ^BFXM//FE+=0+cH+QP?2[.g7g7(56/[N.TS[?UJSc<#\L>)624\M1WA
5,>XW3\c6Q>@]d^6FIC+5;@GbW=HTH26CMFXf1fOec;Q3P,8HX[A/&?=PfF:R1b5
OQP2CCbC3BE<Cc8ZTA7SL&IdDMb+<UFVCeB&J=-91;:Z.ETW3.<,KdW:Z3J)>Sc.
O8e&bLQG7We/S,(YLWLXBILFX0S:7UXW39A+fBLR8_AeBHJ3#B2eTYVeK\S.W:<5
^(QV;_5,VY-H-8d]93S<_F#Y=b8NL1Be[0.9CALH\L.YP^#X42[C3.KOfIC.2\TG
2C+UM?U:e.8,=Ta\=1H+fgNX\-LJBbQ1-51D2O_&M1gNDOcV;\ffE=B?g,.^CAZ7
RWO7,(K-;<&>1(GTSV2ACI))GF3a=>AA.>30W]/NdJ:(B[74N1UY^MQ)3=0Nb0Z>
c-Y7W^\?=55[XW5T9;^=[NQ&CT63M7a\36,B,(=Y+Q+U;TR7Cd6[?B@)cH=J#W^W
Fa]b(I2JUV\&D-[7ICXIO/;fJR+=]Be&(T#5[TQS_.R,/A5Q,C\QF+@0C5>D-(fI
L[02&5fP))<=MZCg@C&+]UL<FbMV&0bc]fDe-fICWYX\?Z1AG=HE?N><^]aZMf.N
Oc@^L4,,VF-R(3,/Y5^,7f)?=OKZHSK70<Z6=)^-[6ABRT>T@L9DXL1b=NG@O1(E
@,TL]^F=//@^V0_GT?RSL/8L<Z#SdCT7aN,3&WL@E9[A6&#b[/OVRF6&K\V-=&U?
fdM50P7X85KUC0M)R\OZVD&A66CWFg3JY<8g7:XQ^BN<L@WBL^c>91?W_RC#gE(#
HJ67BUOCZRe,XgZJAM?5>XaD6YZZ/=>5FLA/.76ML:1DPM_&gZBU]QP4T^R5^[-3
WJTWc&CGAX/ffDSY[I#SR[+?g1U+8HJB2DNG8eQK1NN3-8BPVZ6K3g,5@a43C/&=
&W[g3=.5:f1\-<8#[+Y_KH&;(c?([R?X92aS+RE,.Q>(#TgNQDYNXZ6AD62K6NT-
N?R(g4QQ0_:Q9K?YT0Tg8Z=c@@[b2DK8ST=?US[W>_34(U2\SggG:]/&Z\bNaF-K
Zd40cEY9TV-Q[:YWWIS=:2@RXDW(V2D:E.\]_aGP-IagV\bV)I)SU6A;(:YS^Nd-
Z)0J+U&7LSME,R2MU7Q__1QSL;C:[XP&Q3__3/]SYcJ?R<f837X;A#e4[ZAE6;9K
]4b3_C=6NT.W(b]1(#,ae,J]B.g#=J\<4XU(Y=1XC.E5KgQ;JEeGaUBTOe)U5(G_
8Ce0;#;_.FVPgO1EA5FQ/D8&J/679976I(ELMO],<^DZ>F&UcdPSA)[)D(c[JV&=
CW0T2^7&FK-8QcY@\A+PA(GJN>[P-#CQP@FWT7c-;)NG<,#=D@#CT;>Xbf;d8CQG
cO<+DG;&^Q&^g1V<:SN,@69.b9^BDSU&>_O-FNOaMYd><8S_6N(McQK(8VTbT[8:
P2bfVgJUD/dR6ZUa+K8AR:dfdd,=AP64W\A&5?eAMeWFNK;fO8>>W_BNCY0/6VJ\
e78@/aF-cL310MVU4[.YLJ=_VDEUgZJTN3Y7Vc,Af&M3=E,G1Z#O2DOT20C,3M\:
:QeJXYg2Udg8eW\43L99:CLSR2bB_>..7dE&HO)1,8=NE>dLC9PZ3DY9>VR0+:&@
7;-01JX(.\>=P@HUC9T[V^HN^#g#N7a)#dBgVG:eFG./V.P;A\cY\TVITP;.VSQ8
HI(IgER@8AFWL<:5Z\Xg+7QLb][A#d#1<eMN_\_[L4##_2=\g#Q<H3B=ER,,#GTD
]cIbZ3BJ]a[&VB^)3BP=(RO6(),0>dOVZ4C()I_L&ALdX[dI:IPYT-ZIb=S(#5[_
-I\ZMRDZQB;ULB-+&]Q#N41Z=^=E3_JWKU2F0R,)5&A+:R0U[A0B7,[/LT0Md,JZ
gB4_6P2)0?:bFSL+?[9ZSSP+2+SbYH;JRTWgY\SKWS>eZ4(,fZ8_R6Q#2+bK3\4f
IBG>ac]B)<-W)T2,927VKLeY8+J\#c5B=b^(.1OGgL=>B055d=5fWU86Fa;g]2_M
>FEb\\[ZOL]RORG?<^S\XN^f9DEKR\W/4-b:7AP9GAG-LXLSX@_@e&,KU/<ZE_Q)
ISLNRMge7&-BG9R]H+^>+A,UVEVA#Z\G1gf?Y:Ag.>dP)<8?K@Z,-.5R_.aNMdbF
/XI^eT>4UXe/^YU]f_1-WX)e7)CFa0+B:@c9FJXBKJfA)H.)PN&FZM50KI(Wg3+6
Ub6g-QX56ec_?<#OE^,PL#KIa,/HI\HU5.@?/CCKR2(Y]<FG83_=5&+1b?;M4OTD
&Z8e]D.T:P?X4UOaU/gN3]U^3(D<7NXOGBH(dbDRd,7T0(KH7K4L7-d;Z<#3.O>N
aXg^1b:MbH-JZ>Gebac:#6>a4fZJdU1eJD]97T<Qe]\41&5M-CbJ_3HT=S]/aHH:
82Z/>&A4@(\_a@WD-5d0]]\a(WC-FQDb8:JNYZ\?<^O\G\)dMef;WF,<Ffg[T_b6
2DV>>QSf5a;CMF\^;@5D.0[[M,EQ_a<7:0CY#Ge.3VF&[[;c(/HZeSf=bPY\7Q1_
bL/E,&a2ZMN168+7:e),JAME/;+N?F8DD&-^ZMSXIH^XL@YE18KSZ&CdbJCP[IG<
b_e4;X7_<FFZ:AT68SddN/_cbFT+_;27G\M,[NeRecCWZI)&@^@(20RaNK.5bfKP
2/9Ng.+N4+^YGE5H>ML<&4_NS=ZU&7ba9WCgB.&.80([<<E>ENSL_b;[fJ9-2Mc_
)/g/4MAWL<Ga1B^Qc)1IMe3LS4UNJT6Rf=G>P_19QV\=<Q0A(+J.1JA)3Qc?<LE,
4.d;^D:.@@FdeT6cb);^BQ71\WRAFge:fAZO#/7G@Q6Sb58:<#eHHW23B;&IGZ-H
Vb?e?KbRWf4?T>M-/3e\_TBIOM:S7S:0F0PbG/P1Q55=PI1LBcD:ZC\XIAYXUE4X
?)/<[[ga6C0Qa3R_E65WPH0[8PgfXL0fKRAT5GQ.:.7F1dcaX^G?)dND001?Yc#^
Y@SBHB1.3YF)6-F28/HDR1F0<PGAH<UEK6^Ee0&]&BOGK_9XH27[(CSB<406[eH]
/)RT0E:b5XF3AP6P2JL:)UX0@#-C5OLM^V<=6bFd4\8#4H3MXd#\18<ZA^RAPYN?
dLfN>dJ\RFdg8Y/CK##]>FUX,R>4^U@OF(:.7II6g9Pb@@O+@QW.>\?WNEJFeOG=
:MEZFT;g>S^R::I=#.aU0N<&LXK01T8;H4P1LA=1=JC-g_7f@Q<-:9N83KQ8>TM6
.gZ0HR<_cF3_AC]LUVY)OPXe<:U.0-;F18^U_L3D]ROJ#&;VSFK_(RPRe[.=;CKT
>B-B&F3MV@9?\H65fJXND2&WZ[D2HY&d_>Y)[dV?X;G8H@1X?><A:N.S1J.>:5f+
+e@&80NB/K7C15DNgI-OMaWKH>MgW>1\^QP1KXTK671DH-8.&4Q2HQSgB^<+BF.O
F=c-S:,7WEd.8;?.](UUbdBN<>I?-)Pb6+5+.S4,-#R.^X6;]A1<bU,AfY+PD,ML
A,Z-_267f&P#C:=(B/04T<NLTdYSdA)-ZL5V(R[^95,@>JH^67D>bSMNBD3\fLFd
KURCF7@YL/0^a\0WF-O(eEG[I<9S?OELSP9-f+fcQE6()cD2Qc<,QSdUb&DDa@&I
LDHIAQ2AJ;:b;g+Z8c<+;K(^PWL[RTCZ,gFMAZWY-a/:c@.Xe)-5XgTU_;AR;M3J
PL]);&?I1:8Z0O^^V/T,Vce)-L0S06G>RKUVT5-+>Vd8eUPEZ^<VK]R(TDG<R_AW
++9PX&=O:c^Z._f8K&KD5WI+M00fc/2,Ub;00f(D\=g:V?IbV7>f=c0FOcW(-KOg
PT6;>.H1I5FE2aN8M2?1:+JRJcCccZPUR?N-5Og3IJ4c-9Z/(L?T4<gd3W&3ZNKP
\N9Fc^e7<?](aI^P-\f-a_F.)(VDBXY0?H9]C+bJBc-E6=0^OS@&@7DW:NE9G8YH
\f_f/^\X.5RZHN1TS@+9L.;Qg6973(U&MAVI,[HeOAV(0/>AGRX46b;b4DK,J/+D
#D=T+K[5(DC-^V\N.&I)RH4e4?dafdTUNB4Cb9#fb2DO^6WLL_8<G)c7YA,#\6^c
)W6E^8)93#eO3WZQ#eA-<]@3><4]Q#<,+DcU^+Z=TeYfgPaO^\8U-]6,FbJY(4/d
-4eV:1aZSPUg02,3<T,3&_84<&]8_)RPPd1I0R>1].+WXfgJHDHBX/K:A_]PgX@^
^IL)eJ3>=Y=DbH.&?9,UWfJ(b4;d<@L&;.:e3=]6E;IAG6.=Z[T20WWUSa6CU-FA
K@8N6G4>HJ5#PF>a9G2L,b:SegE.]9)25B.T<[=Q&^6>X1AVGZHLKAGW8V,J\;2J
12c>9@f5W)8BBI0Bg28=3FOQ]T/^3<=Sfa0Z-c)94DU]SdY2I.dFba/fZ:[KGd)O
U7E5a.;5H-..CVKcW4Xa=TUN@D_(dM^H:7T3_A>?X(O7a+-N&04?(@[IJI3UTH[>
3(H<9(=(2.@K,g0\BSZ@8cKKOT\SE35ZHKK-KT@00?]K#7(+RO?(25&1F4S>W\9f
XSXTS>Y>Q+^E?R)M=9,+^EWM=.Kb+e/2NceCbQV]G;@5d&2[&?U\,GR09fF@,LKQ
cfdP?Za&>2]\-=_9F\+]H2D\\95<SaTS1N\QJBP@8;=Z.ETIJVNSQU\F3.>bHNN;
LP/;6X]/.;MeE<9QRBXS2U\68KRM4\P5D43=DD\UQ&U7\Q;/.3K;H]3OL_]e8X^B
]A<6/JA7B8>P1g_#Xf@ddIZ^7#>Z^;OO7QDP,J\fU=+UQ<3,J(&TLY1R-S=(5]9]
:89+fE>Y=JZWK\3TS_?G6KFG:U(gDY39>WX<,[;N_1M7-)W?)K2(MI4M9E:3XIFG
_XaM.N2OSG=#)fLO)FE&e7Ea3WV/]c@8DUS,++N\d+8fB;IbK/[+A+;e44.-=^(9
6LV?J7Ae\T@-L(f9,_L_8CH8CJTP2JK4gN=3\X:\B(]ZW2.1LE3Z\\@L9KgfE<:/
e2NW-X+3#>ABN&>-??[-Ude@bZFFD:I2.R</Fa5^b@YNG3bb)&b\HOLV=4?#&)>E
>TS-K9HX:B_^UfVXD,XC+FRYEb_XJNV<H)b#?L(=/W6]=-K\45?@XZQPDD^FYKgb
TQM:@_?6^PaKL_bCJKEZM(4_RNKP-JQ]A;Q?1<RA@Y8I?abNC7\UQU588[#e@/B:
5aceL>W;IST\38^73SQ;77f-cUZ7M[F(,5bTJS[Y32(^T\/(0MRNZP[I5Be(G1TM
B>c>[8COUI4,^N;7-&W>F_1bQ[_C@5F^1Y4X>Y]H:;(4GJC,BF,cRL)c>&QC]ee;
@((c;X1R#,,_NE[b&HET39V/N1H.M+S=198_Q-DVM@[MJ,=N,Z/&Y?A?\b:#2H<T
P-Ug6]4T].+:=BZDCM6\><C6T^]X7<SJ4dG:>V(&=ZH3L#;.@[QVWG\22Uc8fcc4
/SO0V<_8NYf]N^dNJTT8Mbg).L]DX[[89Jg[_F,Y[+#G)(@B@d5c)4e2eU53Y2?K
(;g;>E_1)]O9aJISIf@g=LVS#09Ue5&:e^Kc0[BD-O/+EXaFFHAL2?>E=fQID(O9
][MCYA[8\Aa:8HKV^&[cFX09\dQ5OTH1[/f._5UW6M6X?f-HPc2<@&NXMaG>dB_I
HAC\;J8,S9,/;@VN/4B4W6<_Na6cH2Y<P6SY/+VT<NT80OAb/#E7=:g,Z7g)U:9,
-9^KI]EQIDH;T8,4_YIfV1=AgH@Ob<:RDXN&J\f<bJC7VIAD.[b>:I@XK&#B5bHB
0dH]bO?BJc=)@41+Y)Iad,W#adH@/f]UUb<:3&Tbbb-OZa11578]B=F?a/)>7VW6
UZQ2?Y,[40/MdF8,WP5>Qb6?43F?81-3::W^9_3_>AADS<U;B0^Ief8Fb8-(bGK)
OVD3,PFa=;P.>N7I(b#VVB1[5RC\-+WXPF<E=XV9W;#W@S=A@\D6I]J9,E5##<TX
c4g>F&.WAO?F,6(KU=]F048[+4Q^b/KLd#)C:UON>1X.:c3A)YFS]dE[/0U/+f.O
CZYH;IEJF[:L4RGdVg6FS-GBSI?0e_SN]T&>WZW9=c<675fa&Xe/a@GeQVM3NV39
UN1-5WZL]HgW^XFYX;A#GSd)O3[[:ZIe^MW.K(ZDO]gf.7X)Q[0^Q+e/ZQe>gNbW
CLCK^TfYZF7MS>#K[0[82\K6N/4T-a3a7Y\PF2D0^/bR@<UA4Xdg^,7YVH&<==af
_7,G^TD?CX\\J,&OMfS+<^/ffS2V\>X_/([U>aIDgQ5YPVS-A,MUgT3YR1OCa28[
/)0S7_P,_1+?M@P.6dM,K5N_KA>+bI8Z2?fZYc2?_e;YK9]gNfQXb<O_e;VF>BRC
,1+QcRH5B[,HHUf8&\35e8;6U)72\P=08cTeH68I-DS7H)8BUH_EL9<]:_R&<,:+
bQ?3Jcf\-2X_0+:_&G-P#(NZ<H/Tb\CTN<T3GV-R+,/4[L_d^6N-<I)3Zf.+b3d6
XR8ZXEPY<LOS=7GE\:L1F:81>O(bY&P]/4(XUbMSWD>)HP6V501cDbFXBd[gM_XM
S[c[TL.;_7cW+<[ZW_UHcH9E+DJ2+U\CcWI-F@@82MX9ZN^/bP@fX&:S&c_SVA:E
1]-CB.27;39P:LOf#e?KYX9K512#bK67:#SOZ>8g5)BNZ\H9AAXcEga<OSHU7VaV
f<7g)>;1PH4)A>ESHR]:B#&@0C]BOO-5?I>NPM>2J>)\]a[@M:f.1gI8)@RbW_Z]
V<(QI_Y_c_4(U[PQ^c-f&/]JLIcWU@UEW6ZN;QOPBTH&5#=<:[fd4DRI4FYS.+g.
cHVE,@69SZRT+I:JC7YK5&IK0OEY]H::6?J5a<)d](^.J\O-44&3dc0M]220ZK[E
e(E+=+.d:Y2?RJd^8H(>a2.)V]ZO.9V1g&g+Y?Q(.(fHYdZ<6Q<K#/O:S^HY[MAU
D4,bEN?D\EA&;egR)&&WJ\03.[E^\Hab_R3K=C==JD1>H+@(-YOb?HVN(L?d2B;(
0^W//fdfUa?=#SKDONefM,38]Q_SAV6M>)IS2Y9c](7TX-ZVTg5<8P:6LO>KgbYV
B,OEYL[gBH-GE&(5::^)d-Ia@Ge[R3-Ab6gV2G.1>)aIZ+/>FW+/IJ^]e):0?FV-
3(NO,PABF)P0c@gc16OgfLgSL;B>2],RMeG/\c?D7O-Y6b98fX>IS)@>-M?#\SW6
405[W=J^OX9X7F?-YI6<b)98af8B>3G?4+ISOVGMV>ATH3G.&HgKQ)bSTb(_?MN^
_CC7,K2;2K097WQVNT;Q.9Q>DU_T(Ha=I8QfG-PBK&ZCSgO+U2[JW_?-=9>X5\+H
5CB)5)5L/?#Hd7fJEG8?;G3VN;aH@@&Y-U?Y;H&C5HY_B=Z7S[1#3..gD#]8ZU\Y
7ZFf<.>PUZdX-Fb@CV)DTXX_L<NF&(&OLH\KK5+1_Pd?&^3c7O>efP4U^_c4XP2N
@@-_acI5PX\FLOPURfaX8/T9[.@PYbI(d-MJMYQ+&N#1J?BBF.\28R#>J2WV\75H
<\;1d):K0,8JTU<]fX+5F\U=...+LF^V@Z&NMe</6>:\F]a967GV5cX6+7K&d-K3
GI#.78WO_\W_=+B.B7/AEfedEbeF#;_K5c+(@\=?Y-fK/+,M\4IT67+K68g7_]#;
??aW4_aN?-,0S+Sf_SAL4-2R2D87^2.Q;3VI65,8N)c,Y+J=01SaVJIHHG[?;#aX
b)eH(YAKRN\F6g^=KRbB1+#=_YN<bY6)(]ea:P>D/(W,+G66#9DX^3<8&f>c:4HL
<NOX=)L?=YN]3Z.1M[d^U&H;[7-I(75]6_<5&KFXfVHKc9Ye-/GM[Y<7?5.)#YKd
#0NVG<UN\^e]g5EU/(RJ,aRWWa-eMSU)>:?F<e:IcaQJCRLAEVafOP2UMO.R)YN9
<A^=8V>5V^b7R>d4TPE5gP1Be#@4H6\L9+D-@HSKg3-8.1SK@OO]7=_96G;<6gR2
(=W4PQ_0KKOX628<g3V@T@;+BY99gHX_Ga+ZYY6HU-_D5/5]0^=@G+JRB.;4HfJT
g5JIb5MWD.eWF9>gE40&2O1HFA6:[QZ;-?P:HJ11a_6998YMT03Y14Y,1YPMMIOE
9+=OGQg<+ZJ/W<EOE8.T]ZR>c]1NEcY0:A#A3_TG+O_:KWX8S?=->Q,T]GE.HZRU
0P@17\OXF+YfOW9O<9A=(=_VFBbW<UIB7P[.1YJ16[,OQM&K8db\:>3dW^[GbUS;
X1b(Y0LZ-E1a;3bX[VGNPBR,N+>W?9V]eOR_\CB6a5MKLQCU7XH<20(V&]Ba>Z1U
#TJ0]fF+/b-<AWP\\.Y&E2+ANI+VagKP)]\Jcf8+:Hd^Z-fN(bg>LYG9FSJG(W]D
[43I0C_B>2>6d]DBPR@@(/SBWK7R#-3_MUYKT)C=/YURg;K,3T\C3JYB1UQ9d/M@
beYMaN(+L8Wf+TR5)d#:B+I-e[BTO-?S:]/:=I6BCg/WL:.H(+(<D]N5Xg[06JJS
b>+75S8K[A+F\0R&CFCfV;71@\-&#G9=5.-Bc\7#QO=.,SEbg7O^;A.d/@28,&fJ
Z_48[Rg7bNIXTcY5?</\K0AC-&<-,)_BI8K:G=ATKPa+1,gC:VB&VAWRI46S<@#5
B<W>AJ?P\ASf+.dDcI)J,:]0X2@2@<F8BO&\SfeRO(gMX\)73E]=,:&3FHW<&9aG
+,,SC^^C^/E1??Bg6f7;((W6B\SI].=AEO-6+V_4F(bfFMO,B:ST5REZa4_Fe_1b
HAA6P2GQI0.eXa#68ORIMAd,2/\J?8eCJ5K0I;O-#CZ&=I@H5FFK-K\f_EgQ.>dO
)cBYB6>KFg4EBI>=H?AF\;O;3D=\?IIT2eS?Rb(_S&RDaE38+9fB=IUHT:J>:+,J
.;g8?VX[?<H(AgR>>^^aT_^e[Y-NMPJ@PX[^Pc5B]4/PQ7.G4ZX#K)V9fRELFZ=(
4G_Q.0W170BIc/),5RGV@8J-?LM837A219&[O=R;95?+V2TWOI5.&D^1A,^#/7^7
a&GB;)VH\??L\ZR2:60AT&Z3D^YHdgF/+^)b#45\]AHL8U=[QdA.EbTBc4WZ2cF1
[C-+@(NPbag5X+W<ZAX7O\.2NG9KS4O>5[Yd@4],;SSQ/KYNgfKbFN<30CQ??[HR
>QV>d)9Q,>W[]TEA._3BIQEfK>_)UaK#))YRB&g[WFRH5a+,\])3.d4S=<P.FEG7
=eQK:\a[@^MPSGXS?V0#fB=;J&KW+N9_7FZZfD)FX60-=UMga<PE-8+4ZH.Qc(JU
CHSCQ25&gNX,B8Z,WgI@8]HR1=NcOd>aM5d3g.Z&XT?J1<4+;XZ^<;B+^6CFI&^S
9XW(V&=c:9aN/<NMB+.FGXdP(RbL)S?fD#Gc8852/Xe\QJ;TH;^d&\6[Z]TZ,J8@
b.#Ye+RLBHP6dE;PG\cJ.6QW:GW;D&+6KfA(UZY\GBZM-,-CKX&+;[3-HKL:S3M@
gcU/DOT-BQ?BI_\G/DRJIe#RIcGHUaKK\5T3+;O6;gcQ07MAe=1K?:.)9/XbgdT(
K0IT,g8-f<)^;/F;J(UFUDeBAJfd&-^cFGBK&=NPM<g712-TD:8BWY6QXE@\+e#A
U=,X]dU>0T&NaO-2b7W>.J&Q(/7:R07M]8[8^ggb9@J68]AeS^6&3+[J@ASbW7)e
9PG<b&<[UXb.]bYF8=E(^B,]YQ?(S=O_af23QLI))HB43YX/AK^B5Z<,26UI8^Ag
@FGDN8(_[E=3Ba60^\MC\dLECe@I0e(:])gU7c&TKZ1?/[&=4P#:_X_D7]PCY\e2
U=@<9Yb+;)8;U>CCP)V;1H&<77Z/RMgaF],NKDWBG4MPg,Wad\WN\NIS4[ZS_,29
f@REV#e1B+[SWKD7EHc?U48+\E>c9Va73MX>-,921T4;/IMYD:=&&&2:SP,K<F;Y
MD?,.LLHVJ_:P/4MQcN+QbVA&[cL0MU-5/:+F?P[NQ:Q;(cWWE<&a(3K.3WN&5SU
NF.Wee)SJG:0B&+HKW#dN8GdFg8O56]KJdS@1eOZ,(4A4^a?H.R>(TR\V[e+&a5G
af-)^4;F+3Y(PI^RTg]\PQH4B47BS@ML.-@(6P_FH7CdZ)^4NGL=,A5CSFM+0JRE
)UN)H][KFbL0Y1SY](X8+2g(@0>VO1<NSE>GEI)g-&???AEXfCT;(LEaHW#;OGWP
eH_R<Ye7T,ZZY;]4LDEFEOW&\LE,1BU;J;&3X)ff:>(IJ&OQRZ1&5Nc#d8JFA6LO
c<a4?0M+T);aOGF9448?IJG(a^21-c72-3W_8@T-4#+fH^;ZdD)<IAUN#4N:9D5<
.8DH3;U75B3a6MfJ:&@O00(<-1E>?.a;2Ac0SU^1fMZ13ST<I_Z]cK9/^\_HLC-5
5=E5.gEK_JY-\G,L.<;]BO\G#L-a[[C:)\[P&)N5&dT&/aXC:#/@?S\N><8CT:<A
Y>B&21g59B8OaN>/\4d,T-+ZK.Q(54-BAEG=GP3RLRIHVEOe.0F[)dd2GfB<#PY.
:J]F:2EGV6M_b,ce85T/GKb\&9M/RG>NBE@>DSX?Z#:AF/FR1ONJdMT<e.Lg0U-e
NXb0Q&,QdO-9G&B93)g8((I[?9f;6G2U2G7\:>&A:dS[NG-Ad]GFUC3K1CX@2&+2
)[8>J=gA:GT77FLBFGETLN=UC\2L?034PWIeFOELB0PR6N6gH9SD-:;O_ff3:M,@
V]YRd0P;T1TS+7e.IDUSDLVOT+R.\)JK^FUB,-_BRR=+.K:c]Q;88Z@.5a4D0TYL
_3Q>M7KNLTIAfO)VLYbW2LTFEgZcAL;X639Xe]+4Y7[/(V:<4<S^L/T^9[O)6G2e
cUTfdNGaEH\aL[)WZLAc^#]FF[,]eWcX[?J^cM?a/27.@)=N:,.B,GdSB55A^P65
b8NGE<@T_,dPRW7K89@2)R0&P[_c\ZMMUCgP3B:UMNc&?JHF_YB=L:[3/aI9Ob@P
0_>9U_^T(X4WYJe_f8TF,#KUTW>eE>6dY3\Ra2baSPA5R-gd.IO/6Oe26YBYUW;/
>4F0&ZJZQ]A=T6_.BcbXJ+;_a(WLRbK.&8CUF1,U4Id[G.GZ(ER^SN.R>=8A67J9
I09eE>b]A00Y]aGT<40E0UPcaN<S9XI+HJ2=6_/#B&;83TI)6A&0:K9;.B(C=?@A
249gQYI(9^SC0VD#He[&QX0gGbTO&;3<0,PUOF.B,4Q803dR->/J8ZdJ-4Z@_[8T
=O@LQYQ<E)^Fad.P,7U+aMgQP7g7?]>],2XT[XSK/V]L1#3G7EbRSX0Y49MJW0:Z
R#NdBQa+ab=9_\eC-\BL+O/K@P6?B2(X9/NDA,4RJI6(G-\K.G_,S#99YJ1\bHBc
#C.:-;Z6,LK0LPHd=X,V&974d2@Ig#<J>Ige_H7_gY@YeY-OCPf48KP._\Y)):bf
gd4bHW#@gV6g09K.==f9:H,X&;OR0dQIIg^dY3X-1Y8KFNISI]8C5]LJ;c:RgQFV
EWWBO(2_7f.G,/->UM4a\I>Hd^MBOIDdAWC10@S<8?Ka36.W-<JfB<=6]ZHW>&a-
F0?(W:.^2Tb(gBaTJBQGO/URBOdY4>F160d25dg5&Hb=/7NSO?XR/^UB)2b(XLLX
JYMVgQ/684g>V;]QK0RCd&^IZ\84A@61a5D^?_gRZ#SIOU1Y7H])=SIX-HWP_FcU
eHa<J#>BC8AJ?O[eM7ECLS,.P.dL4NIMdNQ/Z,2aa<&f]?W/:?L7FOG+6d(;aW;]
8O/BUBBCJ\&[Q#0RMHd]:Z@+Ae)7/D#d+66V#O4B3D=Ce1^F#]5>,UgPbKI4#=1\
9.:9JG/5ILdeG&64DC@(NXTDGL3OG2Cc\^0P,NVGIYWbVDJS0\K))DXMHOMUL-PE
B#T?K+6?<ad[):V:LL:8[6L]=LE;7/S)L7P^R,E,V3HZBQe<RdG1V5]MP0C2c9EN
-;#&\0b6;S.L.HK;e-\eTbe>MM]BCAM5:1+]Ie.+EOF:GS?d&A/Q&GZ5=L;H-[/=
VU2O2/;E-BEQ>BZ>DBP>^:DK[aRUF-B\FLLA5LBTgAgfaM-8Z(S)/6+9F?^Edg[b
/a4;D;E57<MDCFZJAN?0^8KO7F21<6a)Y9g@WbdDdW<\S9OAJQEHS/&;#&+):HX>
0<b#<G],1@SQATLFV75Q2M6VOb;V&BRSF&-3aD3_:K<#]JfV_#a69d82DKEP59=R
)XW7T.WL?feM9^-M[B^a0RB<YfR:B2BA)&ANC#[/0D:Ffe;+#JPL3/7QR8=^DGBK
^2L>F8Bc,GYd\BSISM=:C]N<R#OWUCXA:2E(1P\-G\S_75<4T@/4Y]FR#6Hd33BE
R#Z6XTA3G^PMVM3^?Z\#4BF6e)K9<gT6e6Ld<O81,RFRfbVWY&5:.5caK^MH;Z]U
e1Z]0J=8P;:8B+d\IRd^Y,KB])XPTC(K1IB[A7TaO]W42Z&B7\]H9\#T.[9b[c51
,-DNRMO)ZLH8\gH(afa._ZJ1=E.M;7MESZT;.(aa\LK:cFZP;I3-YW122YI:LD24
@VSG0I-1/7E,(X5YaD[/fdJ&PCE[=LU_PgSQ]])2b=^D:@),DdXVgRJdN,K94#UN
YP=&RBDX8[?EcTD>f7Yc?V#JF1SC0=M_J5NZ1<a,LC7K\bTbdM;Hc:YE7,KAF-3S
8&IA/\gZ34V&0eaS(gG,JPA\7#afH<.^QK=E<V>D:VWL3L1L_aPTNT(bL#T/)cH#
R(&1W[eGK3c=P@b,SB<ILW_6>83T:OT5OC>-><c]OHP/(S/PB1>/;IX8(MA;8/&)
]7BJ0QQ9NJYV6HbIYR0XA_17^/+)g^S)I[J6B@WQ9aIZFDN]84Nc.b=FT^/]]B7)
RdW_XA0ZC474F+[PMV?D/Q=3>VDWE-S:DGAQ:_=78f=,gZ^+X1_.?e\2:<f.VbD1
6:BG/<N++=Eb?c2P2N4(7Q5JM<[V>3)_30;9[:[bf(NP@86XJ#<,dQd)UFS=U58W
)G,?fNL:Ec0f9@_L4^c[D+>M^OSdPY)KAGf=#T2Z2/8/L6eFJVMP26L60-:P[Fbd
9GE3EN<V38B5YQUD)N.2B6;D;G1MJ_WIFH(2fV8+?8TPT(a8-\2&dH\e8=99]b/[
<<<B@SF4Uf)?TT,-U/&SR?WaO.L/&KFJY4=3BBGM6_KBE4f5N8D+e,=CeYKWI4ge
Nd0QF6,1c+-10dg9T<URQP6]0bdE+0P7+-S8f^C=OO+f+#\:&eI)6d+;T<68J)]>
-Od9&D#daQ>)d;eMHSJ6ZD#.@2WC=C(A9N@KJfJ<RDcONSUHA7+HDKU26]GgcK@M
AG_VG2H)_/Z8f\&9a]X#,2#Lf(cVZY-CWG(;<1@K^DJOKNeeTOQOY@\^]-P.O)UO
K/@Q+/6A8,51@#YE]/>+IeBL]AI7+\WR?L,=&f2D;3O+C22N_IY2Z(a<>W(:N).:
P25&5c?.#Z;T<c+)6]V.3]:.A03T4F+N3Ac402C?+NNO375E16<DO:RWC[J2PCQB
?C92LM<Uf5FKL]IDWNb)H_U9OSa-cIFU?.gF_2=S><,0F:]Y18\:/)RWN$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_WINBOND_TOP_REGISTER_SV

