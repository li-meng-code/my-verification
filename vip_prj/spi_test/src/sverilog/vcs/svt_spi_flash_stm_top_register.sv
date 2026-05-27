
`ifndef GUARD_SVT_SPI_FLASH_STM_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_STM_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP STM top register class.
 */
class svt_spi_flash_stm_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit status_write_disable = 1'b0;

  /**  
   * Defines memory to be software protected against PROGRAM operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM operations.
   */
  bit [1:0] block_protect = 2'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

  /**  
   * Indicates the ready status of device to perform a memory access. <br/>
   * This bit is set to ‘1’ by the device while a STORE or Software RECALL cycle is in progress.
   */
  bit write_in_progress = 1'b0;  

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
  `svt_vmm_data_new(svt_spi_flash_stm_top_register)
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
  extern function new(string name = "svt_spi_flash_stm_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_stm_top_register)
  `svt_data_member_end(svt_spi_flash_stm_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_stm_top_register.
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
  `vmm_typename(svt_spi_flash_stm_top_register)
  `vmm_class_factory(svt_spi_flash_stm_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_stm_status_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_stm_status_register( bit [7:0] reg_val);
endclass

// =============================================================================

`protected
QZe+IHL[Hg@>B@+b)begN\1L[G=K>CDc70XcK]420CI##9\2EJ2f,)D8S#>4T_1=
BdbFQN:VdUb24-0-<95E#&&FI]45([K)808b1>P+A8?,Aae^13^>Y>C/-QB3UP1I
T[eKQ&FPD1)]88=8@+NNWf+#;(BY0-&QWSe#XY;.Xf=\#/N,KD<N4T1[(2#=&0Y=
\d9.XE)AB1cJ_DQNdN#DeRAA=K0^-gSMf0PP?YgRD[U:VZac(<757Q6V7T1?\YTS
:d=7;eH=KRIb,g1[/XXP#G<6VbWT83g+NQQB9?=6=STXVaQ<#g[UQfZNf1<28gH4
f](JNZeV0,SQ]\MVZK9A\Ac.bB=&QSEH6FHc31GfIK?X:^)(f:[4DJ,9A/M#ND)K
JWSKU0LPWG&V<I/_S8@T;EXH-@H#e8+6dOL#2\0F9CO2+C9d8_)#5@IH7EY7\5F2
KfTBC[=U-FVTI:YK9.ZU]V0H2N55<>((]deR/-IR4&(+6L8G9)YWGZ]-K;I0d=\+
1?OR,UBWT-T9c156NY[/N<MIP?,2;XP:C3U^Z-,IJ9&KR^^]^GNJR.[.)T8CdB/W
Y^5547dZaM25/.Q:GW8BS36I?[-YOTO//[-J(87d5gH2(4ORB?OF.[c9Ze)Pg3QU
(=N),BTYMQ>Lg_501J?VE4[@FFX5M6.6<$
`endprotected

   
//vcs_vip_protect
`protected
T814IDZf5<:\;]gf.gALb\6Y\)^^>7\:bETO/QKWJe6Na-A]^N?07(QJ8CQdafD1
UFI<^?+X>1?#@Of&PC1GY#\EOZJKY-:40@&f)1]286U2\fDZ(7YA9_A16DQd;\Ic
Pe/8;<@>>YS.g)b,VPTSN;E,?X/M(\I-7Id+@X<aXRWQ4FH\Ee.0](6QM_\5a^+a
AW>VOd3XS.32=8EBANLZ3fF;D9=f?Y_BEU]ISRE+-[34-Ia^eJ9SC0c>55-=a6=8
&(04Y9=NV=:1Kb<K>;?KB>cVT+E\#f-1>AB8]2cg=X/K?.b4<DBIe<f_NZe_:40:
3MVG11R\HP,2)dceMfJZg:b/B#TZF^A5:NGXDa6\GgYAV;:IQ>S>OZA885PWJL-6
LWDCSEGcE?J1G,AFI?C([:+(OAeNON?aNDTENAFTO=8C\[I@IdNJd+/1AcT^YgdE
VeBO=,N7a1TCG1BQd[A(?>835A,(KD+CI9N,^W[.aPXA6<<a5;Zf+#L;0Y(6265M
XM?6a@/O#OYaLfWJJXM/FCW:_;LgbSDcOYg[=Z)1192<N)-V_(CB53^)1<eSJS#R
Kac(1(0\CBB5Cd1=>P.HAXMT;DM/.83;^:T<HMbCWPY\3Z5a8&[\[0M4.8c-DO86
_d](_^_LK?1(K\Y3NRV,=>UMc-;1NUd5Ug]R?67g:&OaAg(f?IOC5)Nbf]&W413O
O,^E=1W#c#FFV+R[L;V(R0SS)?IC^(/\X)>?(I,5OR+DLRY>NV@\86U@<GJ8\86>
ZN+4^KAZ\aOEd2N36bVY.R?73W)HIC8.2ODg+M.@M>f?.9C&g.1R>_C;7#KG=L.K
+fK5WL;;F2,WE8[#,Ug(QP&/CdB/Gg>Y#F<#a\4.,1,4><JeQ-MeALbdUN+DCdd4
/2c\,-;]W;[U<_Z6P?68ZKaWK@-WY1WF[&H>@acNd(V<c/8</9K#cE5THGe-H&^U
FAMCFZ/GCa,1=-Ef?Jg_1[bYU.(UZG?BV7LQFI9)Oc@-M(Q/+G0^KWW/2FDFd>U/
4?.?3cD3_fd53AGc&4>J>4eTDXF+B>6c4b:gb:)_C[=eX01\.I]4F5F9AQF2\FN0
E6W[5B9(Yb_=ZI#(F2[FL@@a@H&]:F.Eca(Y#<5b+DU<;VZ00c19d1W7SO(_MHFG
UeV(H&:H59#bfe1V;3&:Vd+Kf980bRgH4<-QY<?.XSIF,<>f6GaV-@83D]^>.MR)
ZU89H<5T)E&)a@Sge9=1K[(&,:3GH&O1bc>I+\,&QHAXCa8E)3U3.6^3B9<C]T#)
YC?7aS6&EV;ba2Hcf@4)=YFXT0_[@g1B/>=3QgH?NS,[0@W0_R9:(Q\S0-\UF^K:
F1UNLHFg1]/8T7HVHB:eF:0MZM4PEKSC^6-C+T/0@U19OU.LXG]8GC#(+dSQRZTA
L-b]0;0^6/d[8RA50KC\U5_N,N0<b?:Mg#C-@T?7VCAN2_X+N/d7NXg&dd\CgWU/
6A-8YDZZ+#6AT5<&dGTPgfVN,0f8bE,T&1TD5.5R>I@71f/5PAc#b@^,61dgcN&V
L;B8>&5;L62a^0:9&PG[]G0/KTU6@WRXQRacHb;eNed[PM(X_Je;7H]dB+R/VBTK
:a@,)3:TJ,Y+HCYY.aI74SKWaSSQK,Id8a2PXEL-(R6:X@54fX5F1=444KMAUUN,
GG3?-0Z9D,]9aQc?4Cdeb:1e9V,SGA&?&0U3Dd=?=gBF1X>SeK93TBBR-?(gb=_Y
0I_>g4:Z.6XTDdX7XW&>WJ3T5?^W]G;a6-1]?59^PQS&G/2f?;S<9L^-KORO_?Ta
N\Q<=(4E)Z\a=VC1L]4[1(:\QY+:d263PY:C79IM-F30[#@[N)B00RP[C&#,KB[@
X-]IHg_[3C)A^N;@:#5g\#==:<MG7]eB1EH[7;\b/9:)_g>.d[F2KWO]DMPII<(.
b;6NJ.:-4NaD0)>Z&>ZJ_3?@<O>DegA-ETQ\Q6G6VC5fLN?XGf[?7d/fQQf\a71\
WK(C^>./<26dY?C+&dC(XT[IY7@DQZ4GcLgK)B.XW?;,e8@E?SHYeb5C?GF9R-e,
TQ./U=[+W\?Y3JLYg-VET^#M#C&feHdT2-,gOW6>WX1<[&Y:A/8[QfZ85YaECBCg
aU5S(QMR+F[a&]4M?+EgNNP1VE]Z@8\LAg\DV-M[Wd4X)U\gG3SF&g&S?c@[cK^C
:U)M;0VY.&/4=M<1J@#@H8K6:0.KXaT4,IWU&XaT:67^LTR^QQ?ZL;F7b/82&GQb
fLR^<Ic<Wd8<G9=IK12KAR^cbS?cFM#f6C.Q5]9P8Ga<UKP(@=T,K?K27gLH>.ff
bTb5)ZeP/&c(4gEDHBde.@gGC]C24JS\L5KFH#6+]CZC?fQI#eT[+=9FJ)F8U.X<
a./dJ68?_>aM7Zf)c2J?[V^2;([5Z-R(5)&)Q_P:AQ/.RT?S07<._QTYDTJ+=M83
X>=FIaYO6ZYYU;X&M(Z#R\Jb.NE668)ON&b5<9D.OOZgK758#\C<VX0\>;:[e/_6
#e)5+G-GBc6N-4\db4+PeMeg09IGWGWV/?-0R\8,ZKCWb@RQ@PHKE(E-CSbIdeD/
^7@D@3DcW@?CCO\3\_#7U_A;6CB6K=^A.R;_,E20ND4&I]?REELN1+CE,:S+OJFT
XHCJ1>IB(.PZ>MWBH9a.+>#-(UNDR#<+#:P,=H7EJ/;L:)KRf0]Z^GLWJEE<cU0=
D3A/g+D8IZb_[fG/QUASbA@XSYS4)TC805c>/6758,06/-/ZE.:fMacg)]S;d634
N8e896Z?V8e3(;NXI1>g\/&6VJ^OR7Y4@5g\TS==)?XfHXf@#9A,95AKg>6_?O^_
UB2O31-6TDHbL/,N@G=+X:+GQQ=,&,81KaE5HS17)cN8WD;B[5AFEaL6[@dV1[g]
K.H4XV.5AC>FK5X_[:ZdZ?&&VA?;a7ZcHP[BL7\)c29fM#3R5a1?b6Af-1&H?@Me
]Ja</E@S=2H37S_NLIa/^g:3N3Y\C,B.=K][aXaUNSW\0W;W)[_bcZKb6I7<;C6f
-GO5J>ALGO^@1LYgLNL1d-gGZ9a^\V^Wg27F\^)/\_>9/7:HJ_BB&-TE</K&@:,D
S54(3.cag=P\NdNK(@@2->U/LW#1IGD[?d8_+Bda0HcbO6+V9e\D7K4W,5\(d<Mf
J1=NbZ-59+HUPTbea1WM11cD+ZXTNIU3_ITR3OB>8E2If5T07g3X.4^XYU+[2DH5
VX>X<]KU6F0G-QbWHY7<P@()[dPS-L?:[@#-g#1:@5-D58JCM0g2+D;bb:/V9&7T
Be^5Ef#@1KSf\O6/X,:2g?HaV,ZC[245E+AL4VD)4fHR>,gM@V#:P=\P82&H>[IV
;(Z)^g)Xc7F=J3:/,X2LC/QH#NRe,_WT)]S4-0-@Z=?IG#ZX?CJT#Q2VYR]I,63H
ZGbLaP[L>V[b@4N9XXM<CQ41O+a)&FS9-8OCYLG)VMHI7G?2OKEJUNPgN897?[@g
4S1W>@R:Uf/TfJ)0\[5/[2H7(?&@.WS_7aI0,BK&B#V+0#8I7,+7bBX1Od4&Q+?U
[B3/3-;B0P?U0YW;:3/0&-S1O;9YD?1D\8T^_KLWO(S+:1Q9YNdd+[^[bA>__-B+
H53)fQ>RKg,c8M2@9M9:/TT9(S@)43^[O6]N^f_7dC_4K1]E:3=f>+a=5#\]#>d_
gEQGe4c68=P8K79?GUH/<U-HP8[_f]]1,=(M@S(fbO)6E;1FNCVYBJ>-G<PKTOg[
DAUeVgOWMN[D9HV@(b>)4O#@H&Vd1Z0VbIRZfGMg.T@5)YY]WT+F;#][C@2F&GfB
:VH=:B0NWR_5VDe96T]J(AHea.34dZc?O3&ZD_fW:UUbO)_>/H6<4K:?QIb[dQER
/(28.O>_;?)BUHd3^FXLU)+8g;C?JKY#[QPD#G:(a5:f(GYK);[3DbRN-&-b>E+L
16P4O8=GM=:\2YQM?1a^9AF8bQBa=MaaDA/:MVdRa:+7<^@EC@?aS);DR.b3>bBL
Bf2CbE7+[,gaMXgBNIHf@YHJ9If4=]Qb=J/PM0&DO/<;\c)A@VFgUNO,f0;-BQ9Q
;MJFP)g_X]3TAL&34N<3aH#=HUMEK4BF9U=U3)f+#CT?):4>:-B;/(>?S=M2d>Ca
:2^IQ7?d/M0PAb^SGB=]:WBE,:P-=gTJFH(2OMUO(WV@5P_1&)c:Y(\?ZI0;C&M:
)/bg4N:XRN/LGSF3)^GBV+OOTXNDY)Y_7E&/0IZ(e7a:#KNf(+X?A[?QS75G#Y4K
1Z)b_DI:OH<]>bW#>?cN]W4ASXOK6O,=f>+8YT)^2[C#>1O^_cP_S?[Y]SGP=D@5
?,J<OgaSA)&[;XCEC_-WE2A70EQb8QT_WX+KfR._O5-XYHa8NAYP:Uc#7#:PeY^f
770,=A&J>Qg.L5;.N9+I93gVFf7C_(F>4_1MTMQfPU;QZ]O\SIA7P?@c&(b/5#X-
c,8WWF>I]JU(FT5WXGKdbN+&SSXZOUW[1H:\)KN>?:f&Bc4J;=aT,F@4fFBQIb<\
92DC<e1Fd9V9AI@HgPI)F-67G2Hg0SBMVUO?CW(2NC#&)0O];XeQf;=,AW;R)aG8
Yga&?Y4L]e5&X6AYe,97C24W#^J[>KDI=])DKc>/GP?AV>eD4=S=>7LXd/e464Tc
X7VbAPI(\,87^gNZ2cUC6Z)P/LeI#=]E[e?Z(@<R-4e71=]VZ#UbdbUD;WZ8Gg3;
.-9a\91<Y=6K5^/YE.J@+AG]IA<]1[_L+bP[,2X5Rga+T&A9IPJ5?#^78)GM(P4b
KZW_40(WBM3feEU[2+)eecFGK]RfA8+H/^dI4PX&C3(_H/(2;WJB9R8IQSMcQ?DZ
P,-KF4#(M0WO/(6Z.D]E\>ER);-)6BCaT(38C5I.R@+YA]U#d.=RdSHS;JT#2g\8
&1(9KI:(?f;A<Z^[8&M#<.e#<D??KXM8XAfXLK2M[HN09@:b2UY;9J/FS\&6Hg/G
7(d^H;<G0\VN&:2U[@BOIH_SPU,LG^36.:eO<^<8M\:RL8D3]DQ3F>d8(=T(Ea:2
@1eMW^[XCM#NSa2N=[9G1A3JQFY2UA&EWIS->DUb0dBN(Z4Y(&:7X2[_]:^H@M;5
71:DJK@e9X1[Ld]UM_^A_d@RaLXdM]V.JfM0[HXC3gSTg^E>K1d0^b+:WXgeSM7V
1J7F@,b)H;U\bQ18X#FJbHN^GXDIa;+-F08+D94,Z)UE0c58a_(LCC5),dYDKF<1
2=U@cdd52@+2W=SQa&#bR?JF,V(;Z0<8@A>9aSB53MTXL/+B:cG;;,2L&B901.(b
AJHNZRS-]YS.:eUA]0+DIHbU/7;b[??9W:Q#[Vfc(RN,P=#BABG[,W>bT]@RE-Ve
&Bc^SAb3/(LJ(?NcaCAU5V?L5;Q_&KKYYVQU,.eD2NR?B4WM=4<;<^@bY3?38gHS
_ITH0ACDKJ(Q5IHC5SVd]7e2#CZOc9P\B-X^6G?GIPQN7/<P<Q?J=;H0fMH+6<&W
7/=gR6^4D^WY-XN30fNR,+f-L,>T6MSX[W29e,4#LO)4D66T8e+V.MaHbecR=)P@
WAeLTRR5IRX\9bA-C+A9,/Qe<V<&c/5>3I6RE][cP5NUJ=OW,b==;Q8YF8\_bZIF
PGQE_E7SWR,T0#P.,S0gV@B>Q.A&\1OCG\,/f46,E:J,EO,U2[7Vbc43_F)d&B.2
\gODLWBC>,5K2I0NDZ/GXB0GUK19bHQV9fWHX;#c[0@C;XfQA+HQ4d=,\9(PL>//
UNW:eBMV;G58E6-UK@H:Pggac,AB=Te1^V&X.BAG?)/E2?68G-BK)/eJe<:R;0H/
)W,V=NLPe52I@19V(OYN?SZJ6A\cQ/>Bg6]dX#D0S^UM;F<)=NW,eY3W0d8cI\Tb
1GIJ74(.#g<FgM3Ud.1Ldc:5J0VgV[eT_cWBBCB5>18Ec(0DMe,NI.UDe51gcO?E
4=:>]Q@&6E<.DcIO7I6G<[Sd2B]0.P;cY?I-a9/6X?F26E0Y,[>2F(\?TUAfDU\[
bZ(<0>FB?-c:g,cA5,K+[.^F]fX)IQ:L\/84OQ4?TaTPDc\Cac?SUE6OCNA<b.Sg
)5L,6e:X9=Xf&&g;d>5\.Fb8A4V<R6VAP(^]P,cZ0585+\,]CY@+g>[A)UOA.447
.AV\S(Qd5D\fQEGN7TIg@3UXKDY:FXHOBf__cV;G1^T8EfR(f;R+bZ:V?X6>/Vg)
Z1T[gX1,[[O>Yb(g,^Z?@=:d8MM0YJ6Z/^W--#;&5#EPYZA234GQf[(fF(WPEOXP
J177QgT#c@b5;V8E#a9\5d;Q8V@A=-&Y>+M3I_NO41C?Z#bWXe_[)>G]/c2-.FLV
7YHeV[fYWK@a>K?eH@<g0FWcZ[e_4=@^(?OI)/>0S/0M0e(f9Pf,D>+Mf;d#28^N
g]>W7PfJRVV?]8/_B4+3eJW57<GEa<KY[7MUEQ\C]R>41Q>/9IGD4.\eM-8\?CeU
g5JAL]9\U;Ae^Z;OZHR;N+NIX0)#1+/Af7SI)F+H(617\W;^K?Y2)38_R>H2_/EX
I1dKX\A:V#?N[NOe@SL:CGN)e]R<2J4S&WAeIagKaB(P&J9ObD[7^gV/c4\cU\0>
)fFYLa.R(F.02LB@f:b+J^N+AZOdI&L74;C_R&bU\[1U5CXE:P<J>[\P0-Q?_\BB
;:?J+faaGJWK6P\[NeVTFXSV342-6T#>-C/0(55fJ<P2RG71#F(^SF_F^:D:8?22
MQ&8V(IATF&#@KP#15QA]&Y\,WU#;3:R@YXQBY,<KHHLDd[D0F>CTa)e+/d/6O-G
&@PGXIEK\L<67=FOQ5OBD[c?T-FQ;:N\2bS<AXH=32^<C@8\F2W:)&9Y^>0?DECW
NS#.V?Te]c]P^RRWSe4Z8;;@VUS;JNfT(8[g[>+1Q0E^<A#aU0/)T;cTb2F&-Nc:
P&RVe<32H][\>g5)>;eX7)CgJPdJ+99E4DI?7;]H)e6McG4.+Pe5PRaOgJ&<86g-
Sf)NZ<Y76eJ644g<6-]REG8Z;Vb_X4Z)T980CL-V=?^[;KHS^<,_H\X<.4BNVC2C
(X^=ZG/>\GW-?.&@YbO-Y8G;CfN)K2);^46SL0LfGdK_]HU7E[+)d>7EReb\Q]4F
0)NF2Q\1,P&WD\\fLd1QG&9e-/9RebY#+2]10Q5d/.dP(+;5JCF6,R2FTM]#GEN5
GJ@25#3O/EEb;e]_f5Y/G[=;cX6]4S9S4,0]d-15;?bZ;\2@&c<5G/:2NA;d(3Xd
AU_,;CZf1_5Y:/Rd;S6\=&g4Bef@NBV=IXA+>MDKF(:K07bfN..2<&YF]1:3=C0&
]EK#b1VSM]PUfF?-H>KDYC(TY_dHNE<(J/&Gb&ZP0FeU/<Z+SLKO>=d;S0IK],+K
OR_/ZbTc,E_A75&X;B&\&S;8HV,NT>@Xc;/QG].DaP^ee>#C#]EWKfB:[VPbZ&HZ
+.AcW])A[<;B&&Y7E\E7-Z/bWI7e&bGAUBCPLU:](@d+0>9R7D#<e+-7LR.ZQNc^
1^f>.QKA^Ae?aE9K.#dc&XJ>HITMAW[F-X1BL?):_O4eA6_6d:IA>A#B7G2V5RNP
FN7_IK3#Z#3Fg_^-dYBY#);A\1]<Id@\V?AAC,[e]Y7VO3/6J<-.<F[Dc&EUXdE)
/ZcaMBSZY;#:IUFHYXUCb9Fe8Y.G]#1LG>75?e7;HbQPVAX,\5DUMg385>QdYbFM
;2+81YZJU,M6)Hf\9bJDW(ZV#/5I8Mdb#9c?[0IS88K<?(EO<W431d-D>/G;Z]KT
&bA2?HR)@_B83_DRW2&;,fIH:.ZJ81C55_B+B^KYV6GDKGg5@fP]aJ<L.J.U(Y^\
OZ[:a>Vgb[X@WaIbBP1#+Qda6)TTUeGKaXXd(XU>-@.MX]/Q7NQTQd:DF=#G^1F@
.^U[S5H@=P<;2g]UEZ20Ub1KW/JPadZ(aK6.N)RBUO@U.>@ZMD?4LP>^L7,X;:ca
:L1Vb&a_>Xdc)P).b3[J/^?U1PdME)^CHe#O]g4SN:)[LbUMSQGJ(VO#_/(EWCTd
Ge\Y0Ce+d>5ddQf8SQA2M^OdgJEC\[JRTUe,^(1EXJK_?=J1e>#IIMKQU6+SN))\
-PJbT(DU]@YA;IM>&#-:MX4O/?L;3caXP8ZV(EA91HR5ZSI.g)..ABGH91]JC-QU
=@IM2eC3,2.;2L4(T>/Cb@gR./K?&C^Dbb6BMRd+N8b^QY0^6EPFY2YAUC<[QC/W
fHZX\0XX:?:@_a/G>0ELJ/<9_c@d_1S.9;[Ffb>58+#BS+a&<HaR??PD9WS91KcJ
</HaN/1.eXcUJRGQ^bW7-QU&(c@Lee[+eLD[c7V4><,D([3Z,b\5GAQM3JU,X0M8
,KI>MfW5I[6NVCPf48>N=5U_d5YgFE:MYaEN_VSOO/J6K(?g655-8JC4U+3A_GJ9
2&(B]\/F1S>:RV4PMBaK=M8DXY6C8>dTVL9&(N](+X_)QFWVe:Y&(IeR[Ee6\R@O
+0A+G_I<AQ2TTfaAX0cKZC?/GCAcXJZ56Y/F)9_+92&6eIW9>HS)P_0YR_>W4FZ8
]4&+R&XJ@LT/);XUILITK8Od>JR.YPB,N@Ng;4)d1Bd&0b@LQc?UPI#cNB/Y^.HQ
2#IffZCYWS,NZT.f6Lddg/&(;.7-QG&-cM?<D<Qf?;Y0&=[.2>E3&Z+;U)FG-PS3
4#eJJ.)>JKQ#M5^Ic?-W8FGBB:Y1cKaL9UHGU_59D9-XLC8X,b_[Nb)6OHSD&LXT
BA1T0(/C8=A&_Ga=Y+-;fB+=(NCGUFZ<1JQMI9_AG&TbC\<:R,(/Q1AIMC0_U).E
T?M:+V#ZZ)?(74f/^\S>W#7Z-JD:+7_:MJ,^aJMF]c7^cJ/&-FN\4#36c_@ZOZ=R
cX>T41?DcJ9RIO945_]R<;Oa:(;Y9QM)1#acE(E#7D-fHD-JY.YIZcHLGE/J+(?1
D9OE&YaE4U]YF2I.DE(DV;)Z@gaH574:6LQETE.ZYAZ]0D[5@^TG3GL4)<7^WL6(
&LQ;7KO7@07;N+IS>gab.=f+0>dQ@(5?Wb#d15ECf)FV6C/gJ5@6BTX;LIK8CSU\
VJgUTEC^f1WU3<_,QX=9<3K_CI0f^FX.J2GC,R:M\:B328XZ);N\dFYL,a(#=[#M
56Xb+=]@H)/;KNAT_eD\E)BcOcFL?GP,)JV),C56DCeA]QIU,E;GL,Ncd\e\>3<V
6S]f2eM7b]BV5P(;[(I0f__-3^)/CFO0H@ea>?bF8F_)@BIHC#[:8ODEJ(G].83-
M#TC:-4SZHVcF[ZU[7fCRJ]H-A.@C(&,eY/fEK(.U7bQEQBVHISG]KTc:(d+YDI)
bJENdVeW\=-1ARAOZSCN/^;Wa7,(9NDR:GC54EYG-=<9E1WOT#ETM87e_Z5\0(7O
E)G[dG:ZIVA/g9-7Z?eL#dVB9>2WJ\f:/^QWZMP&HR&1&JA(O1a:5IDG,\MNRV12
XA^LcSVS+435HFSUg<)UBHC^5R:I71b^T5W98R&8[LERC6SJY#NT87N/\+L.@?\Z
DSQ-FH/S3X^\HC6f>;/CN;9<M[-7U;MV1G7Z-;C0&bH,)1Z,[69e0KW4a2Za7^+4
b&0AYA]:.He.?VS&N8K_XbFVWB&_5HP[RU7[E9I.H2,W._A9f)27SI,U,-U(_?YI
C^TE\c[)E^R_(C0AR?<U=dW7H&W#=5ISb9-;eO4^KKWbF/L_<8EfR2IYa,QZVeME
4O[1MeBdfNS/.40,49VUe#YMFaACCIGBQ-:E&gH>2Hd?W<##GW\T=5gGV.UTY664
?MW&N+g0UH3DVL4HDQH67<RGOfB;>>KdKK8H,Wc-LD_DVIS1\-VQ=.MZWV&T1O-#
6J5J#&Qf6.+Ub8d<@#5^^1[MVGY_80D,[E#UabG@+:NH&:I=7_=4X12<N0]DOS=K
?#g.5Xe_cC,KY&,aQ+CaO=>Xg^?W.RO2S1(W#Gag:K_OIF-P9,9<_bQc(9ac(VCV
FN1L55RRY9fMYG\OcZ[)2N^<83HD/MHgc:OY3XQ:=NO;[=cLc6g:gaXY>^PM3+#W
];b<.SaY,1S@F]C^C>WX@-,2aT6RNH,XU2OS^eJG0\La2F.Z1e,.36F-d]VT5J>#
A1fUd#^MDg0NKNbTQ5##DV[6YbIER3?4A]VZdbGS@D/S]d8_a3556^>b&=RU[S6+
#;:<:#^G,0AY3ag(K6&/Y.5#R4O,Jg04RA44D&&]6I]Z[_&(F@W@#-4-U_K+>@&^
.-2W:=4?RGZ_cgeA6]Tc+3UBYL:_/MZS8>NFY1<@#9E)292QX406U[#/(OL(aD?b
&.--IIf2Mg-&/7a9K=G;QIaaN0;>g\Rb:eXOF[88eg<(6BGFgXVP4g6bBJ+K)NMA
MCaeC<,KZ7WZ#Id)/0^B2N@A/e:1_V?fV1&NB-2EO8X2-Y#ef)]gQS5Q2D^]J93&
,af41#-B9#Q#SF)W:FXcBcb<:N_Yf+S(&HBd/OVOfaCP7BQ\NK_#J:<GFBVDRF=O
2EI7IKdEQOT1)32(3Z/?QK5+Ba\P3=TG:QUZ+U0X.&e6LYP#(&)\eM,2=WPH-)#&
.[UI_B(QR5A0+NH7PdcZ=?dNR/WX]:P=&\CNcA>28&21@E+4GeQ@TS^[f8-2P/#?
UV7#B;:IK5G7-Z99a]3RJ9HS>&?IDbXIAOd0#4Ca9eBFEE?)EAS[>:J7=A>9U9@2
AK;Qb<SU6_gH:JCZH-5bIa?]EJGY)Y-VOMWb&9Z4HSP+)O=(d,W1;=.TaR2\8+2B
Y(\/3PFIc[SD,U&O31._gN:(gDVA/<5[KeLU5D+U#&N@Uf+@KXR52IBR[Cf7a8YU
_g-ZS:3L>Q&>D)R;CB&b_O=f@;[C+H7#_(QZe_cTO3gO;R3NM3_<6R\4JB/<dd/G
Q5-&XO6caPJ#.Z5(A[R?#(&9g7,G3,d(FfN/\<SG^_CO<2#HAc7_G)1.QM/0(0BN
4]aFIU@<&_9_(V[,Bd3PO0T(ZGMd6R.U?MDbP1+3Ea6LGGcX0.S3LBH_3WaK-,M_
We:#X7<,.,g][35FWK9&ZLb@X/gRb]I.88X1cII[K_IM=gJ(](FWI.Yd3.W-d\GB
\f3cf:)cZ5ab1?AJ_N7^3b)S&6Y@E^fAb7,Z.^O8d?ZVYTDO47O[H/He:YA,QZ3Z
)J)HC+4&QWOFYb0QcH8(1,^H3BCA4C:F(\9TA3:3SSBXcDO#H8KZY4Y[HC;Hf4@A
3=RYG80gWKe,RQOXZa,EE\JV/==?QKc/=#52b\Q6R,XXBD=e>(4\)_<<=Sg=WBYF
P.OCVdYL+(E^YD<QN=aA;30/?#Ie^@M@S4OZQ8J>4VcCDbTED1^2bI+P#I)YY3HX
a[;[W@5>7(2VC?S9#A#3_@6.KRHJOVJeTHaNF6=c4S=>d^LZbb,5<M(T<e0W>8V-
>::7?3d3:VIGa4@CP-=f^:(PA6R77#V:WRS5;GLeZK]:E+cXf^NeL5eK^:]?2[e[
@4,1GIbG0N9dR_1;,:OD19gEI)I.-_T)U+Y#KE^b]KSbNRAEMT@]HS&:_+GXG1@;
K,8+P?4CRT-?JT^KIRd#X2QB3DE?G&C7IJ6GAAAY=F69O^Tg#<0(Y9(458ZJT1YP
EYc=\-UcST7]W>T2R/[A1U_U[;ZbW((,&5>&Ge&3YX]7GE;PL\#LT>Z?SDC]C,I@
VRW106?LEC8[&Eg0U)VY&SRa7XV-@5N68Wff:aM@bV(I\+60g1_JCd,.;Q\54W?6
I0\\D7Q99&T<P@+MfgG,/@5XbgaZ36;e/3A<9PM@,,]RSgQ_@C8D+UcHU,E,/KC-
<<Ja-EAG4HdgD9<ST=P8P2]8E1CIC1_P6YKf+ac^EKD<W5FH5M<(GJ;c@9499_X^
27R74R,Y0Xg[-[/V^=11:-<Q&.&#K-d01d^7N7W3c]fB>_944J5IY0ab2\dR#P@?
U38-cX.(F2c0I9QGeQX^6G:><3eXcN4B^b:@(9XYN+:g=A#d-ILMWa1]@@J+L7?f
I,d\/>AZ7dd;ZS=)@DQ_HSEG-f--3I5^#@)(6)Ma6a36^/cR?,-0Y82LOU>Ef(SD
I\bXKL<6F&&->7bD8D.BWEa\5#M1EI,??Y.\D-PV.9>R[0G7Lb=63G;1:?>5=]e-
7bYS1RAf0P\V,-ZL>.BP-1ReK0AcKHAQ8[(K_]>6T@XI[eBF5KTS<\&-_UZ,U=6J
.&.BX,[N&Ua<9H;;Z[8^UOJfW8J)1f87XU^KA9>e7_&(Z;G:aZ<9E&?>3?b92K(Z
a+U7Lb.0</<[#HN>OXfPYF&)W:)ONX^1V&F<1#c4_-9D2dDF0L6#9dB^&WL3@U9#
TT<Q)Ka7#<WXcT7BKfQOXWITGE2?MK#:V:>,_&@O?L9UF:UW;4Tg@99B3[KET^b7
II+\XL5+De.1V3UH^-5A+UWC;a5JH?>4ME30@a,aSa7T:9g1D^NfeSN9a>KaLCLG
WaFT.:T_7NDe[-^9aFD6[]&AU9.YMCX;1BfIPB)>^KE+_OfKWY@]=QAf<M-3Y[]J
b16K)e#@CF&aeEUb91Hf)?Wf_^Tc5Hd42YI]4>T1gI3+K^9KT@Y=CJ@,:_GbB]S@
\:8@Fe_Y^+dYQ/H7-?N12H(]e@ESY?S3Z#bae4[USPA6JgQETgP_a[-/QV:+9UTV
:-9fO?+T\5RIP@Y2#I7P,^6AcW@[8D@/E_c\@@]Fd=?H(,<D<WCC(-0f7(Z5CRF2
W3YI/b/-\7?&I4HHJ+AL8@J,=OZA+CHa8+SN)8JA<D;TP]NCIJcC-[<G/:>E)Z-:
d:0U^ETT9CN].;9bTU+HI]^LPf[b5ID_9=HEU.M/+Z[9-/(W9=2=X@Q_a#(ZW\@X
][)dVS_L>gC+=2,7eR2T07>\-UTTG+V<#LH&@#(A77P14gg#P3P@TNL0:KM@d^BH
O2<c[1eH>PM(6.SJGF3Q=;R\Y-)-aSB[DbCGFY65>7Q#c;D>53<6_NdEYTc214[3
N6NXf^f)5<RRBAW13@59_B\W=8N_XT5abUgMbO(PZ=8VK>fI.&0VD;^-d_#9?.0I
F+_b31^U\LfU6<595FAZ,U3a+?<W_a?G3+8O_E#+^(-LQKN&F:VA&e<M3&-F5]eV
(ec^HE_ZI28\DEd8<9g\;0RffRDM>,QGK4>=:??OH/#5JEgO@TI)ZeMC@=LFN4K(
0PO(4SEH8X2e:;]HXf?N@AT38M&X8X2?FIK^U,3N\=QDQ1B[#TVfe(e1G]YDBU?6
+.c&T>YRT5Nb\+9<L(H@Z5TAHUdNHDZ.cdM^Ga=^JKZ=O;aZTC/2CU0G,[PGaf5;
_\;&#&Q(SVJe,;#QJTD#^C2LUKN8&R5F5XGeJ/bBL5K;CNPPHdDX]T#?A;Y)ES+-
^H82/&gEEcUMe0&]S7Z2Df43ZcI)TQOJ-XH0=/R2b9d05AZR\cG7PaaL6BX>>\Y(
a4(NgP2)E5dL3-QD61G@&(ZfUVJ\Lb_:/K4KI80g5L]Oc2>&8cYV;4YAS(afB-W4
>g)gMTA\</K3fN-DL(\a[)=ObP[=HI?TLd0Dg,J(VY?eC@][PfJ1FebQbSN+FLI.
^,a5;PeO,c_K-T9A-]#T2Ve5C9eI_+6(ZA?CLFLD:8:TDE(C)]ZT9\g4J;Q-.->J
e/fZ@[5QK)U6-))f7bgeHa7<P]Q?@5(M/:IZ)8]G6Z<gHH4G6agP@f8#H;cI()X?
<eKE?0>0&=#2S=(eHSAfY@P2)8CcB@52I+;ZB-[d8EZ1\EVS[4@Y;<SIE+WYS4P[
#c:B:01NPX[J^6<4Zf.g>@Vb@D6\)=:->AD8<=8(8F7VMQB.IU,6@ScIe5,[Hf94
=)YCJXU7(PFBa#0>S;Z7^O8M/#-.V9fbECMC;>(]@S=Z>T9.4/3&TaU?#&)JN^2.
74NBBa[:Z\gM58Vd,LS3-X7BQ8dKUXXDQY,/bS78,Kf.D\\,][_6.E)_0QfG+=f>
Eg]a]7LFH1R6XB?(ACPD^FH]++,FG@g_)\(#O>+>NLSKIN,+AX[K_>bRRA1M(08,
#0J>bT6]c^JGK92NgP9;.>R)BNC@V6LH>4[=_3<<MHVVEVG<@P;OW;NW(5b;E+df
7JZb7ZV4Ya>R-7X60W85LP18-bL?6HLf;WOH-3Dg>@=AXQb0/XW&f/5\6?[VBEFV
;b9O9)SgA1OHKL)Yeb&P(X+;ZcgF@7,BQK&2@<aM;XL6&CcW\THa)F?)M:=N<>]N
E0;OE&WSN^>^D,WdM6-#A+b9;6)=Ba_9(K--//^):_ZEN(ZBFWB[&/Z>G7Fe6J+R
32AD02g#9G]DfTDY,_12[OefBF9OK_B5/6>TX>^(cWG1T)O72EA.SO4eQf:1#>SW
^FGRHd^T<Z0.SC/?@fM)A>E+Y^D_WX)1L)9IHV9)^<L[/QI;XF-_:W\_,6ZI^I2@
MZ^O[NK_VSPJ\]JENPZGR+HR:]]HK1R3C9&@N)VO>9-[H$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_STM_TOP_REGISTER_SV

