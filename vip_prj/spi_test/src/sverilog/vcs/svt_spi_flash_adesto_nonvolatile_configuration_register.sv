
`ifndef GUARD_SVT_SPI_FLASH_ADESTO_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_ADESTO_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Adesto Nonvolatile configuration register class.
 *  This maintains teh copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_adesto_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */
  bit [1:0] status_register_protect = 2'b01;

  bit sector_protect = 1'b0;

  bit top_bottom = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit complement_protect = 1'b0;

  bit [3:0] security_register_lock_bits = 1'b1;

  bit quad_enable = 1'b1;

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
  `svt_vmm_data_new(svt_spi_flash_adesto_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_adesto_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_adesto_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_adesto_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_adesto_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_adesto_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_adesto_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
endclass

// =============================================================================

`protected
[e#S;_/^[6g\_ZWP0ec:V&5R@;V1J^TPNC#X-eNZNb8,IT_8_-^7-)D0J-@+1?B8
N3K1ETJe4[KgG=7:1TZ9Xa_M+Rd?[aD#6M_Y7#HNHQY4I@AUE<LPB=[\L4Z@;UF8
UYGf\+-M=eQV_4c#ZIA(N)X#3C<85K7B<#2M+e1Xd(MROMUaM>2HE9/DWb4^Y)U)
R>M;Z9TE])W2dXT[P>4:P&FKF\4VMCE37SLcVSOPbUT:bO7?16@-#PP4NA>B3/eU
342?6/3]BQe<U.WbYW/Qf]cVPBUE-@;d,#f3?;ODaMTW8QR7Y<;7R<#ZCK8E32N2
PVL#76)@.MegK1TWIb_,-)P_.eHW70/O?.V4aeV[BbJR/S[OICd;CO:;>0^CA,)a
-<;7TF\M3/-gKC0#,6FGH7_/CH59acOM\BFBY(L5O9)a(=;5SU;]fd/Q0KB(R(UU
2.VH@7ARFMH6_ED4H.35-]GEX=QWX/ff-;RRTeK[=4V#@(]NcPdc-)B\.V2b_+DE
DW5&KPEVL&[dL.S2H#XCGbHE9BKLY5;=2MAV0;K+R^?K28bT)b<=<4bP[EJS&?f\
_aWcUL>5fa22DQL>F\0&EGIGX39SA&9_GO5C6:fSD9366+09WK8^-T(_H3VLGH0X
[;L6#4b0Nc)H?R395PX9?bF@+9^^@QT7<@b]<3THX#1C?GK1HfN[:4cOKNU^[e28
U>RV?W:2)C;,&R@d3aK72bX1V-f_7GWDb/O3.VG^Z_Q<J<@-b1cIKR.f?WZ+-MY[
Q)N/&<LCA);4IYR]1J74)SXNHSc\7>)P@$
`endprotected

   
//vcs_vip_protect
`protected
>2eMc6e/2_#HTHb.S9]AAZI]=22G4KNceQR;;T&T)cWGDg(KFPTY((@[)-PO#FB1
;RG2YY6c46#f#cACa2Y)[b#3R@_,6FARJ1[_&&9A/7KDZD+/;VN5HTD7EE/.g.gO
B[(SM#W#NLB8/?L>L^d\FI+F_M@&L[&KgL\\,9/P-,IF?HUKS8C@b0U(Z2_ONReB
/ge[L(+P&W-GQ=APUJc96eD^1ZO#d6Qg]R<A#Q/db,O@9_-1U\PgICDeP[S<#;XT
<OE>46(6-:;2acEaO4geeNW4RQfME)B46<Y8>?=A(.?f7;^YE2bALZF[#1D3AMI@
?N+IQQK#KGB#Y26,K=e.>L<&DE56HA7,INf&)5:BM9fM,PY#B6KD;/]D/IgZF5U0
>3;+4NJ1>?^?=H]fFaZ.gBaY9&3e+EN6CA79+TN0+FZ4?+aMPF;d;@ZX0\/=1C&1
4_QJ+WFOMF@XXd;+<&S3bS&(T+&UT/M6[3RdQY;D@0J<<;0+NA2M<4>gDfQMP46X
(N](8FQ8JSE3Hg94V(<]A\(:CF^TEg(d<@/\(XDc3.@I<A<d6)dG1+3FC(MTN)O5
4=X=K&R?[O9b_KUR4>[6>)(A\>MH2W\3/efB()X_>^/2,8eEg.07)9[<^AN363dg
XMZ&2WQU8I10&F;Hd+1JJ3W::\-IRQ2Ubf\)bPF^a]5AGU:gVRKXTD^.>;4cJF,Y
.H(:AGVU0H(#07RMa>IO=?G.HHR0/G-M\3WB?=?40T_4;C8d:g9]TIPWJCJH_0M&
XB[1X./W]3^,74ODFV?R/(KR0FaI]BQeRQ6>LHIJ@NK^O8,]1g+8SC8a:9<8POE@
^R:_AGZPe3(.RJ=;I\22#-BZ+&8&^P?0]a@b,<3(6=.7R1O(,#I<dd9Mg2S#eCC+
N1FU#)F88)Md8UY:J2KEFHHabLbXYM8<N>H[#[\<,:QQ;fA:&.=2&T(VC[/_&a<f
N?LYa,+XLWK3T(R:A@Xd_#=OTJ\7VR7<CN.QY3K:(&G(C3eU]c]=:Wc6(HS/.J24
42g)9CMA3=5NBKHYBc2+4bd#UDIa6-R);T#N#3UOP+NcC-NY:)7NaS6?KN;I[)8M
VE^0TX^g=c>Q<0.HL++G6#M[INQ_f]>eP/N1I+E#YZSO-QY96.a@>@2be-9FH2R#
MV5O1LA0@5?Wac6E,[#UL_[XYe;MJ39AFL3C?YA;^gXFJDR#0-b,Q]@NUWU7A\&2
cXP5FH^D1T2/KbU#:/;K;<,cD8WS:FA(:6g=-H[HL(@03:W2=d(0?1M.<8Ed7f-E
;Ic@A6XBR8O0?=,#f&,2-AGeXgGfeIX\>PBC1+&cEf&/<D=RZYGPY<:ET-HKb@\V
3:J55ED6-?,0(FZCb2F\BY9Pf[FZJA/RUTS[VOY:C6ccdJYe^:D6CUJ=9VE7a=-9
;<1Ha1H0BX8]VMV]7aN-4RfW)L(<1VAI,M-D^Z.&YZW;3#TcNFcJgMgM@\:^1@AU
-X;UHd-:[DbS_IF=4>&7FMT[OIJHBJPAXS\/>/TR<R7B9#1-W+a,SQH^IZBgIBF)
^VPad\G-8TTQ<:\VHJ=eD-eF#]#4HW^DU9_fDT1@BO@4?]45KX-JT;5(>\(Q-A?X
NEW[;UF8EfU1[]b0cgY(\g+H;JDMJ&@0cQJIJeFUA=8H:8aU\(#,:B_eP;#A&1_2
>\2TgS/W1_.O48,C7L3@AM1HO+6/58V8DJ5RNUVOa_@3L]5faY?+FFd-WW&:OXS#
TQBW401:K[AC2>:N=;SCA-)XJS,G(L_-S-QDZ^;7@Z3^/>J>M@1^^([JV9d5QaD)
<R#B4Vb8(=\0XT]AC4ZG)FF-dEdAAYOT.>H_<Q5O>?.;cL)M+2_AXdBC:^D?),?.
1egXc#\+Q,I>L)c]=8)7YReLRRN=0T5GFED7A/9b=,<.\5([A.&HdD7UN=T<)XFA
3[VULOA3g=7CWaQ[7HCQC-:<?:GSWZ43<fDO8D0UK]/bK/Q:7c-<1&P.gb;[=?.I
(<(2N<-OX,B-6[59LgdYP5:@Z>8Y>/CA(&gJ(I5K;\J:eDG?TUbN]CO83:I=ZQg+
A34]e/(5R]aW@5&BGfe9-)\<-LK&:):S[-4[T]6=eg48>+g9D-JC.C<5D9Q#7BU]
Tc&N&]&EWDJ\JZ]V=6TH2ABd<V3@PS6&.9e+e[D<&-TW+]:@^>V?GXNG.&>Z\))/
)#d&^J7=:,_/#271[<F\W7e40)6e=YJ).0\W^J-]\:.BXT2#&IHY@SQcDD&^(?Ee
L8JY?+YJ(cD_9SER-VBU&fG#^WeCMT?2dP;\]F3;=:K1=d)\3=<8;MRV#7;C9V/=
J;U:GC+ZX5C5D>Cb,>RG-G+GZVbeIZYe7C))I]6J30]W<(_-D^G@eH?U)=R4G+@0
?3gA=EP>f90bc3>AI7W&N<OAf)[a9Ua?3OG.Y&^.[dMO5@N0b)/_aO_]3ccOED6B
WVD/a/,QBYg.1b5;Taa/A<M[b1P]\a.;?]Z9HU<#:9P>ONTe#(KR6J@K_BKZ13NN
W\73+A5-1I/K5N(C4c]XUd_FTKc3-CYEK<XcPWAM=E\d@dHcGPa[WVeL;81e@dE0
M;d7g7aYRbPO]/c&T,V9;-1418A-C6KJTf)B,32H5)S;,Q9E;RFee>@R&):Ef0e#
,#OXD+G<(<S<I4_KX5ON&6Y3IMJ3E-fE8O9^La,8&[eZ(<UVFEVKfU>A[OU0.AY0
VOMD.T.JH,SFAJ9EA78HZU(4?_@fXHQBC([gJ,,g_@d\M;O?,MEOS+@IPP+OTHc0
W,(C:a_DW&6>B]NXF8Pc&:##6HZ?-CcAJ]+fbd43=-U#8GSC#a>fL[LT#R_U5,\[
VFKY3B>UU<,E?5a5S^:/HU2NDE\AE_MR_4]a4]-K?0[#&g1-6.&^RDVB9_1\ESEb
=SRcL(3E#UUN6O)0GfR2WB@Ce7b3)977Pg;Y3,g/ZJ=E>JeM=)[V\)0BfCQfe;26
@4WeYGUO#MU]GI8M2_(RK]]<O;-<L]O@E-a_XAc;EEXLMELUAEg=TJEU>N[gb]#9
D@16?:fO[[YS@#X_:>]Pf>5T=AQT.]<=<F1_9KC[Pf7)<_XKeIRR;@J:(g6.98G-
O70K>ERSNb,ZJGY4TT6XAN/6GWK;AFQ5:We\F>.GBc39NG)e6>1<?_ZL\LE=1KJG
/bS#&&b:27?[]e;KQHA[dSCX)VI7N)I:eACL-.fY:+T?d9VeZG)H&:4B=FaE2JDS
,)ZVbSUNDE1QEATEE[Be_F/2K/)0LS?I1?<>B7Q=FcV2a8)@]&;0N,1DTeF?80R2
E^4,dPF>BZMBNT_S>@U9[ARPL_([2;:>I^:(\YQUd4P9@&21a--4<_R>:5[d>48<
fSPMSQAJEMAD\PgI(I?(7]Ug?G7@86#MM061)-G;OU6(Rb4)a_M^/_,\-\eEZ2A>
&Q7?#M>Q>5_([,,79N<QA.f9I[BeJ,b.0C>H1XSO7#ULe[<(U2_<aA5YWBK8;QT=
aM+_F-(G;XJ2Y3b,VHLXe=,Q0J0gBa1DI=Lb6+H8OI>gcE3>WMN]1@O-QcQVV[Bd
D][\F36UHf4OI=Za1f.2@#&\GA.L4O+69NAMa<Sf(_J^V2cWGAY[JU9(7PLFJ?E2
S_YY9\RW[5>GU&?)8,B_FG]bMF@(SRg#C&H?fM8V=^#T\RI)[c/(8]^H8a/TbaT]
?QQ;c<@Hfb/J\d7.5EX3)=WU#\g<BOMJU/XPT2FV^#\/&8;2BX32ORVD,I6Yf=GH
_T^@MXTF>CI\U@b4Z@S4Z),.CSeFPZLf>(TOK<++DOFR]c&>;B;^FSW_.@bC7WVa
5/Yc6(<ICHc/R9.RaB/+NNV8G-<Z\;L5VT#7.UP;Ha->D,WDg39\SVF0YCRdGDQ?
1WgNK(@PJaO:X9HY9gd==\2=4V/RPV+be[Q_d\&61]V_Ke5^6?BfY.77[&bQWY)L
_+RX8GI]2FRW70&<46R,P:2]/73T,?KUS+@/(JC87.);@1VF8,F=./L9[:7JG0&[
9:TWUg\?1dH@>Wf/)<?1^^:.\ObXS/4YIUT<W]^bcX=OagC5:2a#A5WC4a2H#9LJ
-A27/=feIW\9b5[1B6/AZ1,K=GEGMgaUN5-6LJGL0A+@:ZB+Gd[UNEd\>#SXeKG0
][O,;<FZ-^dQ]5=bb4XJA_HSZG;cY=bH3(J8Y3b?-,fHbP^IG(O^X1cX-?-=Y9>Z
cP(-0==e[,?DB.8&O@E<>/S99LbJe?0Y[7He#B[\O_:=TX6aCBT4D?5YJO)ce9S?
:GbG:Vf8S1JaJ;50NYD:=.YZ3.V6A9+N1?M?4(KI(=7CJ=-c[T2UG+M>>;&7S--:
\&(OSf;EJfg^&.fQ6@CMXZA_CBgbQ/IG-0V4/E#b1]EOTb4=6-2>f=BbJGYY43T6
4-&RNM29#OfZHfIHU_cZM\P,e;A50RHRT]aXfI7.\/e>/3/[eU,&N0EV/.Q8=^4U
@U\P5D1]W.b;BY[Y/Q?.Y?X9\)ES<BfDN8gS\LX_DaB</;9]N)Md@E=6O\(&9GYS
=6,MffP0>+g@N4G\X/?J^c+]97.E0Y?:#V,9[<7ZRYeX@_Ld^eAE.R#.;3AA[G:F
.(beCU<:G\YI(WYW\fCBI+Lf7W>;6<_8a;4b3gFIQ<D:d^cE,fPVDS?UG?B3,G+d
)W&WCKJFL(9_(H+fR0-U+@85^=d?QbM(?P+G6\NCGFc(-/=@R8>,f31-g#7&YZ49
c/TMX&]\Ic4Z#^PA-dDSNM[MN[HPK=^2]/^1Xe=>P^.3P=O<7IDLea3b]GVSa.bB
B)._ASX,cf0BbO@a(e0aLP+5OFJN2T2?2baa88><EFN7#[PHB<&4MB=<X&&;#eB<
P(MDY6Z3f;c&9XBXTA_?4.H1LW1#\,B5G.b-:C[@9dH\bgO/57\6FTBUST<X?T]_
85_ZX#aM-@P5]:&0T_/:D15)+eF(MURL??#/617HTFaCOYJC(YJJ\B&bF]Y0I2?R
D8#YX33WK<<3O6L,^X,<_HG[+YHd:\.QWb;D45&:7U4Q3F:BAA4gGbPI7>(\&Q_:
T<S&AX9F9gQ8a74a[[G<&=8E+d30EXL1@X:0aDA7Z)@U-;&UT-Id??HRDD-NEfB:
9O^dX)PMC;e/SB\55LZ]EWT\4[YcQa.,JdO6K?ND?fI[>;;U2?J_@ag+)O?-8DLc
WEe@fC+7+Ve,B5UHbEXQH<?O;1dJQPC-3&&GZ1Na>8X3@S<QXFG0;)?85J\;J.MZ
LK#)O:C6V+KL=PKXbbKc(L0^RN2=V3&M9A?a+BFbP_[;1K4C^(Z,EZWcD@YQAcg5
Z27P6(?9a=Z#7(b.B)T6O&7Oe0(9D2#Z-Y<0)dS0Y:FV0,Z&#.4OH(aOS18R:MFI
eg#?JUSE.?GL,B7^LdJbeOX0c_EOWU-9:G3gD;YB0T@(EeTQf=GR2Pf7+SO7C,<P
O?&d=H(E9g5+IA@L&I:&gW/(;]5;>U]a[Bbdb5_T[aJ&CJIOO54+8->IL]7UF9=,
VORR4^IWF5+6Ya,-,M^A9,N?X[1SMFa2:2I##JZ4R-[KJ7S9&OF:CQe0\K?a)dN&
=UYQUE+YWdE>.c=34[<50NXJ)J6L&gOZW7X0bRDCQR>CS]QdF@XF=3C?AN/G_SFL
dKQ/(&XJ(Z+21FQJ.Ad^b@.c-F=Z2W5O5Geca5?7dSAXRG1gUdFf+Q3QdeAD<4(e
Ye^?>=.G9-.@aW07^O-Z3P1c5f46^3&?KO<HCAXSNTN=?/W@[A@/LG\<#C[Q>+e4
(Z:?DdJ6GZ&S9cC&PZGcKdYL?QbMUP-.:VfGC#B[J=0JP_\2)@Va:^BDD-aU9cO0
2)[(J)(?KV](gg[fNUeK()JEF2#eIFT]TdeT:;<ASA[>)Z@<?BO+DfC=b1-,NHTe
I7EW:73eKE=].UOJ:W[a?-2O9H-+_RJe))[I2.^30A.Pb)[d3VAdN5?Ff9EW^(\T
]CR5\Y,9e[6E+@#&NQ=J4UXbUXX9T.R6<fDL#TA6eC(7a9Q3=3/;P-g7G+>UO6^+
K5B2JRU\+?[V&Y=4^OR#X<1FCOMA78#1c.fKc)c<aWA\8dT/;(dR<L-9\e_\RZ^D
N:d(f4PE;SYPe?MeC\ZKB<5499&:60QBH\ff@)TMbeb=I2,2<7a&(c3=/]#0O7U.
:@O62RJ[F:X5PRF6+D@M]A[&fAM@()ad5T&L)N5]HbJGVD44UDTML[^(I)?#;EVQ
ANXK=F+/:2RPT3\O7beNa0=RJ2IHBQaYESI\77#fS/A_L[aMg228;]#9.:(LGgQa
K,57SP9Y28]G=g,52O[7ZDWO3[XV:<JI/Z85\DZb.;Sc>gOaVWG2I]GA.Ia,5gM/
2AF9e<6I8J.Bc#^+bac94JNg5dIGFPG\O<V9KMMbY<GUS4B,Y#Aa>U0TK1?1Y(Yd
677TR-29W16@LUd42NHJ>5Mb.e:P&)Td(2?XfN&_@GUI716ED/G.1X&]e,e(bH3@
OQ=W=6#OQa<[RTN=6M+fJJ]BXD&D255RcRDaRJL]\,TFZRS&7#5408@R8U<\:2Y8
?&6ALH1&RIU?f;7Lc#[O94/JG9CbHcUb_FH;5H5#F&007L>O>fR?\_XW61^9.[+B
AS<DG/I>+9M+:8#2dQ<U4<SDLLB^W8,NVVSU-[MQe1UNHTLX/[M6;9U#11&]UgA(
MVKdW9OT_+BG<\;B9U5:-WL?J5Y=cANf#U=B#/./:ZHF<;M@B/8AM1A#R\A(CX_-
\M^Z9K)DJO-3)=\I)Hf4EQ??;A#E0fLgTY9H]81aFEd3S>U3[&SHNJ4+AC9802C9
Y0ePL^YJ#Qe1fYaB/LG-M#LGTXf[KK\(0.]4BUQV7(XGM6G+J[5ME>=3Re;g=<0W
GN(7@=5?5Z?Q-NU2PgdP+WM#E0RVVC?a;D+U,:F#REg/6;5gf9T,42788T#AL?8^
89IY3RR]I1DO\Y;I;RdeP6K(.eM\R3V=BbNGC3-NA-1=AeTQbHe:3SdbI^D-?I3Y
C<PKVA57#0--6M/G.DV@L3MBJR[.NVA[[g=#COS^3MTHWC3XQW]R40SX1b.)Oa.+
5F^[.\IIeI+?20RP&UKMR+SMY#)bFdfE9PXS2U?,2KOc,J6>-4Z;9./237)D5U3U
4:J^8@SOL51]C<]\^9=:fW6]W;LTgRA2&46UHNT6(Z;G^U7))H4#,255ASL1,2Ob
]&ZX(4@0DOTHVU1:>MIfd<E?\?KQ=Q.Z_GBfDT)BaT^cRQa0JQ_D360UgJ(/YYR#
[W((XNg\8/eZK;EC2ORgC,YH\8,_TTgDDO54R[UO<-b7,0S/09T35c2<J&M8&(3]
aGgFW=//G.K[?O_V<RV0#X>8ID5<GXf;ZTA)(&Ab^S\MA#O1gf;ac;ILCZV;4/NH
334CVcS4f@<gC&97f/2<5M4)0@Fd\>EZcS3P419&BA42U]UbKMW9F\:N&E=?&C^e
d9Ec_8V:H-RU:9\G--=ed.5;a,W4I[A_WJ)R_]XL2EG(P^@@1aMa2U).]a#;UR>R
Ua1\bf-aBed(NCb9Q@,Yb95Da9PXK+5ZS43DNNNV=dD;Z-[JgQb/WP15HMZ1W2QK
Pa9d4KCNE:,Ydb]G]+4]Y3_29e[^J<c\X7fB&-W:NJBFFRB-QdIR2@Qa/E[BP31^
#I#gYR=L2^1ZdUG1.RLRNaZ6QG=WI20=]430&DOZ>SYR\MA\(d^H:9g/S.@TQRg,
_]SHed)Hd[+X+H/H<27FbSP(@@/X<f6KCJ-)D)60HQaZ(RAOE]I\3D0\abX8^V/d
56dJ,?WA?19bTGRH)\KP6GHPG.O4\ZI?P<BaJ;R?IENc/7RaLIM0>Y+cKaSX9[g2
gC0GI7B-WFHKRa+dK0Rdbgc=MWdAM0(B=M1=)35D_==T>EX[85^+g5M?F5<4=&(3
4H7WH4SD]d<0JeUEU\I4WVgdSUeB=<GEG[eOU=AV>,SEMSBO092Ab[H&Cf:[]2LK
?703:Z@?Z51CB:N?;8HcC&LKEC.>3(E+H.3?._43U.e0L5/Y&S@;b\H#^H&6EZ#a
1&EPHT5Y3D<.>a\;Xf?(UT/KSR7S:V;)>fKO9EDMOb0XE1;7?fMED8YJW-Q8J)4K
1(-@N;P=N.BZB+^&K/KB(<.,?fO]\F,:8QRGRc4^]./f_EK683(S&(dH/++US4@F
Y;UW?@c,ID.b.G]_E,FV[M::/?W.Ed[cH4SaEX+]EUZG\1>&\SQSe65eIAC@)5Q.
egI5HaKe0)[APOf,I_)ff6fK#-(80M/=4VWf^Ya/SA4&U7]_.AYHVeGQ/d+b,60c
LPb0\R,\>[/MYFOU#2P&SeK:N&&]PX=:]6>B]be9<fQO=@gV6Y;X1GR85cGGLDZe
L461\U,d6+[:DKZc_1II=0C88@+Z8I122e</Z047PCAF#NHa_/[0?Z)]3YE_WYc+
/,P_5_QKeY8e#<-)Af\:K-3#^^9A=1R4AR43e^R)#]-f,0DdZS<L;O.=Ze&T,8AO
M4SYg9E8<KeNVUaP\Z>MegD-06;71E7YNJFWTf8D5MY/VRMD;JT2+c?d74dD5+L(
C<N6+0;8L>fb@SIba?+NNA&-(?+<U(.V7QO81-Y)PLeUgV<(8Mb8b\8WRVa,B++8
d3A]?7gGOPb+N0\ET<Ug@5OBfG):7e^I=Z;L@Yb_+#gSJ(JbSL5+II5<+&\_9/]B
C\(F0,S20U9Bfe(7-_CNa((8ggfZG8K+41<-DXb>(D9?.XM<8;D\HV]f]6>+KQbb
+SAfb>8>TI0?JEe.,/f[V?&_N(88#dHEIaEBBC5&FFR24E1@bbg^Lb9>FH=WX>S#
E,7_E^=#WE3E1]ZHA>0]KZ\\9_MCSbOfa>/02,D,-Q#=OF^+5XQY<Q@T;:P=6FO;
G\,V_UQ?+_F)S\/g8NO_SdF&O7;4PMN#9=9PR)R1g554ZM\?cI1_FT;VOU(:PO-(
aRS-AYE-Be#bYe1Z+Z5\]GK2E<+#6@8-QN<FYP_OX1gUZCLLS:8W>D9L=YCb,Q_E
[I1XSg;B0AH.#4NMM2[W##(7?N7^XX(ENG<NMF^J;2&QAC)c>N8]b8YG(4g(;5-5
F1<24EaHLBMadc#fRc36g\A<@dAT9EJW>#E=fVg-O5P+W-I.B],.6gb8K?bI[G+&
d(&C,Z6G<,DRb/S7HHSD77Q1=bVOR8DRTe&gBJ2&JQ1g3JaTHc#@YWXQ_?cEeA[8
g.F)T+3dY(dZQO9LDYH8IBL)K@4BM>-/]W\1dU5SVRK?Me5A4f02S8@>#/=ZcABb
0eRLW)9;1&._8I^FP2^F.bS2>dVAL+:LCN-&gX[e,L:YH\bf]J?;BJAWfFbH0.B\
fNXa/dd^D8HM>N8eaNg\IYbOR3NYTMS,g<-JV8dP57YX7PY2?cRVN35YPe;Mg:dD
HfL)fIcHWP0TLf&<2X(@LF^7\;:26\_2E&+U.I]8?ZTU;gcNC8BSBgfR(X>54,aH
V?#bK6?\-c:@&OV>)6>48b@<K-CgM_fSD4,&X()57G.d>8@+W,+147(bQ/9B3KU:
^MIeA&5,@HK74/P5_EXecWD<F:EJ7H3>T6USKJRc=VP2aR[WH6b@1RK]IXN6.L]X
PPINX_H^JaT(Tg-6GYZcc0EZ9Ja^H6JGb=G\-T=Q(.8f3\;\gDAd/aBP[A8PYN>J
U_Ra&dfO[.DP-^>8L5BIB\^a6,<.K^&^2Nf-G#F3QOII-1R4B9(E?dW3d<LRFdCD
2_IGNO(W:F5#POT(+J84R.gD0>5^\WAT?@@B4Yb54VbQC6gUR@?YRTNY?Lc;JRfK
V+B,_eH/<:1MKGK[^MN@F0Xe21H>UVd7W:4-D1Ya[3,]^P.HXg[MBIc7=B9-+P1\
,8;dI>-)1;,20FIT?f6GDH3[VbW>B0G9BU&+OKYaGf9YVICOAT5K]X-bI<YG\>R9
a>5fdE0gRKPe;f)6-0O]3fJ^ZA^IO7P[M>8]E)H_)bNCK/e67KPX:>(C8N+?2,NN
5,3;;MDH1f/HGQ9W9OER)BDNG0HY]GO\Ad:4QG@?L-_fMPB@KTJ#1C\MLY/J-dEZ
^&A6DI;2NZd#7VABEYf<FU9EW@EE?9V;V?/[:Z^..MNY:L[\>&S&ef:0EDP-X55O
B2<AdeUcG^\\RL/&=>=PZ2KR.RW4cD;0<WT/Y>AXXR\6KaI@dZ7N[Z_561;:;ZO^
&d8Sb^F@&;B&8LRD(gXM5HNZO=CXXFgc(P]GBFd-##@;?ROG8I7.aGNCA\V_5B=G
E/X8W&b#&7,BaGSG9SWOSfPWDG]RJTAUGLLY3?XJWY,\A@@AT::=O/\8^b]f-F+?
?U.Y#E/W>]<AG4CSB-DU#eG][eb\)=:1-.<3/5gf_E1=15G_KOOHZ<@Y&4))HRfH
fA=>Mb/aLCTd,b\9_R]I3a:;YS[&V[NJeg#3aHCR(d9:6BdfJDQ4d5d4&GMFS6PV
MJL@)2ZV.UP&?dKWLMXDBO;[4\LUQOG:7gVF2W16M(^)9PK,/@QYgfdWJe6,Q&(Q
E:^?&cJ1gdd&:2Bf+DbP^/Ag<YA&B0b_@F5AU1TH_IZ^<(L(,3[P;R[ZLWAQ<&9V
R;U)./,5U,JOQR3N&)bd\13:YE8RAa#XNaT6^.HOZT0;&U/3XZbFE4.>c5K0S2?<
[0I_CUCZ9A1B)9SM:EE4a/^3S;D5^Jg&@^=7#S/P5WN.Q07LbS09-\2S0V2U?U.8
d[P4cbKE_VbWI9[D4fgXL1.-F1#5^=_<=W(1(J=@6+31H)&O-93THM#Y^4@^6X>H
528@UC=3A-f;)96Y=;,<cCb]a3NT:WI3[?2M.]K<(8DLfDBa6gEUX0HR/(ZYMUE6
Hdb0ZSTP.GHebQZ4a-(BgW2S@FR99;5],TLf^E#6_<@[cLXFINW8Q6cP#K4COO)9
<=-<]4\0^aXS\+BAME#?:&4,egB=5Q<B2aL4cI9GFb6H=QC0c+?=YAO>9W_aaQJK
\d.R8A9:UWR1J\_;#FIJ+]X-FMIRED^6?[?c_6\efV,V1R8+PLZU_^A.@geB9SbA
L6>#[Y?>N;&dcZVbfcAg\3B>QB#e3^WYH2)U@.Yd4312(OP;G+Scg:#cc,CSRG)#
(^]TBGR&WQ(.Q]9U?5]c0e-b?F5TG@f,6\_PS;QI4+@MMW)(G28X)T];_YXXS2c8
@>#/d<@g,.g1))HX[S7:V@5c/DE?T4AJ;>d\4X)P1KBVDQ2^aHY4cC<1_gC4(5:T
3eDFc8W+^PbUPaB[3P\IQ4(E<Rg^63=G3e:e]UX[H-.d-F\DM^Me/?U5O/3_/H3_
+DFd\G8[.KcAX.5A1P5FH\gCF0\01KJM++G+,(UTUYaQX&@YEbZZWKX(gS6X:M53
9gVW[0[#Eba_SK[=&LPGJ-4.@,T?0P?4dIJFOO.PPR5[Vd\/?5\KgfG]FDN]QH&K
CG?QIIAf[+K#=8aB^+#f.JJPaZ.a+#.>OE=FGJ]0&GCK<dG9\T+?OOP+SI?R?\6F
6;R0&=K_Md2D^184g?IB?,&RW-=)b)?O6A?4M;J]]fD/[Z7#5TZXFaX:S3GOYS2d
aE&5K?G#TS]2J[W4DC24^4:DEWS(\Y=+:/VV=8O]J_:a@S89A?M0A&;(YD0^=&Q)
;9963_#@7#;AI?JWeBCJS[TPDD5,]JEUFeS,6W]+_[TRN;<7HFY7BY\OeL<\@6?6
7V2P9I1\D^V(&Mb+84WJP;RYNeZ#28U:&d5V.cL,4F6gWB;;5J[3F:f66];W,gEO
eG/S=33Q5(.X[7B:5(_+gg-IQQ..Hc_Ga+S_Q/?V&Q]2d3a6>1aZ>E/X6VK+\M-L
UQ2NG3S;(CeTPTY]f(P^R?,]PG,X[@FS[SJ.6]J;\\K-<R7Y,(C94D1X=74PZ81Z
P#Me22\;(SQOf)([2BJ:N-C&K:?aDg6>>94@2#0MRANQ_TcdXEVZ]HHJXQ69=+Ic
(7UAKTRU;N>9R^eSYX6@4MRJ&WWWb#BF:[gC1K6N)W+TKNK;RL25@QHV21?SF\_d
e77)LW;[)b(>#d+NC:,Af:4<DR10+1P(L1NJG?;QD-J)#VH67;(E5TXDL3ND>SM^
:(IWFB:4.#2,BPQd;S>]U@B9ZU7:+6E;XJBZZcN[XKX3&BKd-QNca7,;D6b#gHCZ
FSa9^J==D1O)O,V;J#fO9ZC;67cTSZ,/]=5;&THBOVPZd93&@G9WI4Q46^dPf::-
()V^>ME0,2Kd=&bL\QK@OYPgfI/1?^J9SA?[a0E.Y9Z6aMJOe],;(f=T<DC2=CVc
e1889+WL@X+5+W?P@V0#aW(=UL\P=eNa:VR2#VO6MDO1^/P/N^66T(](&ITR=?^7
_JU7-aT@\Dd(WSXa3+NS2L02K94O58=5NI0A5:C#:INZ3>;Q^/Q&Z[-f#6&0:=MY
6XI:gC\>?5&1.H>@@YaIO^L(;I6VS(M-.DDE2bNOH?J]Ye^H8UFAe\)_B]2N;,)T
#A#6X_ACWaK]2R&b)U,K?17^Fad4UB0&c<_fX<)Ea75SH/E2E:U6cCKM#NVZNaa_
E5DY6KR&SNW]g_---^/,CUg)D7WWP5f4U:UHC-.G7:5@0[1<VJ:@7GdL]I)_N3(-
\D#=ERHA26a_V#V^993]FZ4\.V+8LTda.LQP0S>O95Fe25b&HMV5.<)];Q3N35CF
.fR\):+9N+;B:9VaUE\cAM>d.(S<IF@B//NCbR]f]+-@QaPf2cBe9Rg_>-C#>4@>
@^Z7ZbLbYUG6?SX/O&>SU]-I@AJPCc>5WE&K2<UH_IC3L@U_#Td.H1g6a[/_McDd
O9;KU[;d[P/8ZKBgUM]US;N1aBNUe]AJ;-fPI,cKW)__AS8O1RXC(+^710RRNfKE
UAV9E613UV:Z(CRT[BM7NX)46^TagQcVZedgW9I1Z89fcEB,UU,_-cI=g&#_<JB7
=;3=8Rc&Q?&5S<]E[)aG)H4<\HE.X@(VDD3?.6-A=5&@FCHM9P]9dG463V_R+=Zd
]4I<H6]NMWJI\AcPX1:UF.f/,<[-]Yf\-+g_+G=e0#D3J5Pdf]JIbX#,3:H3/KNA
cF4#+aUa[O/EXQSCH@8=^2Vd&U9K=JK:N(-35-YIPJM;(+ZDaF@GfT_=G\V?d[;3
bFbOQ14PfK46fL>RYfG1LL,[\G81REMQ8K4)0\J-bbe<P(BcT\ZAO1a;@5S_^6OH
P.J-O,7FAPEc-;Q_+U8]V&EDLASWP8)^WN]AcdWTUJ8>Y3OG1Z[^e1/)4M?Z#?6B
C.U4C;KbL.e3;_B309d#24aO8Z\KK:][<[-U@<#gdG?Eg,HC^H=N;Y3Db5f4-f#9
Tc]R5):;M):?R_1=GCb>eHOG7<5G,7g[OdaG\U&Y,E)3I/NB6U(V?2+)QM&S#aM[
3=_U57-,P0:1LNLKUN:=KY@.]A(T(8Da=0MVJ;c).[#0731\Z[NLe8?^,Uc)J9_#
.9TP&DBTd;geHac]@^VT;A][f8fX6H]I)6\H)Eb.-C#4O4#AFR;7YFU6?YY[BbI5
_5P0Ne(;#,W,F-YgW^MIa0TT)/2(1X+Ka9gJTYIQLT3TP#[W:acWQ]SERBX?BT]1
.)QN1^<:]2PB>(#6/8Rc9=&Gcc;R2_]:F4K?[Sa>A3IXFA\X\@cb&VS.W:@F[[dM
^2\#d<<^SGgL(RE^PF5THf3NF_[EJ?OL6?:K7(TPI?+(_4\.--a/fc>#Z_\KZ&(Z
\=g_^1UX0-d8S@Q+=J_=U3Q>c7@8]@DAZL4Pb4<RS8]T-ZE:@YO1FDBD^7__0O;9
ZB4a,GH)3cc&UR4bgO\baHQTfT/]+B_948N47R\]/7P(S5.E5T&N:d:BO?PADU+e
ZMWJ)HX^Wc)<D->KRb#JaRS2b(K?4cMI_:,R.DRX<,UXbCRQ+\FJ9eP\8e\HSO:>
abH_7)g3WcHW922X4Q0cXdaVM9c0LGL)R60_GIQ,,Z4\_=M>]/4@,g2F9O=@#113
35Y=5V<?5=7g&gg6F]BPH?eL11bMVM8RO7aa,EZ.G&ND:=2B\=H>?K)395H3_O,H
-A,BMR:5H/^I^4/]a&Wc^2SARA/IJVC11\J6N(P4+LCR+QBUK<P3_7IA5,(8YY<W
f[YRPg:19:N5G]PW(T_QgaHf4=EE[ETD\@1-R)N-+E&VNU8639XgY+SXa<#aYc5)
EeFFLd<Q4-QIU/3Q7--a0/@bA1&4Y.+aBN/3fA0BF021eMUM@7DFTZ\d,1O0A5+M
ff:[4F&c4@MMRT=S0CI0I#HN-?-T)IM_)#<_gX3OeX)<.gbG:MGG;M&&LIM4_Aea
KH2;aFa(dJCfMV<^Ob-NFXLd2QI:G;D0_Z/]f0^T?7eJ&ZLGRUTIg&3[>(T,6X?_
X4@1dFLDaO)7.aa37E,FDJ+<I36ZOJ>)DN1^,.G_ML5DPRXX.U<aY[2SdDd^e@U,
U[T&Va]-&eL2gS]UHB722TGL<?S)b&-/3-4Z3D\Sb8H9FFe/DE._1G@(..\);/AT
IYJW>:(\TVD^_<#T/4[Jg3G^SeR:CF#&RE;AO;D3K=G6O(AZ?QF5/6W2#TBbY^P>
D\O&)E<BgIf1O/(IYCTdMY-0A5>c]T;<[f1a.-PM,4^AWEVG8FH8M1VSK(Db]=4&
:Z6WJOIbeO2Nc/EAZFQ<89M39K5S##.:e2JeBKF)NI3<W5RN9Y4f_d5D.T+]S\AZ
MdG=.EKHbc7#D>fUb^d;7#DS/>NMDZTJJ1\6)=c\06:QXI\)a;:.Of;FdTI8g-CE
W(M+ICJR1A)F,+RUPeTTW6e.:R8egA4YBG),,Hg+F1C3B[]N\TWI2B;GNNTVR4Lg
,2BCPH97K9TY)M/_/c?P#b6E8UgH7CDd6TW?9W/,C\ddOU,<4c4+&?gGd-HcBe_^
C&51^ODMG39-VLIe3YW3LAd]JG&XOH,cY4,>^NI:#K>fKXL/-d&Y2P4?[5UQEATeR$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_ADESTO_NONVOLATILE_CONFIGURATION_REGISTER_SV

