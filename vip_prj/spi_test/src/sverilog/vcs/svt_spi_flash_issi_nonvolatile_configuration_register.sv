
`ifndef GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP ISSI Nonvolatile configuration register class.
 *  This maintains the copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_issi_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Read Register. */
  bit reset_hold_enable = 1'b0;
  bit [3:0] dummy_cycles = 8'h00;
  bit wrap_enable = 1'b0;
  bit [1:0] burst_length = 2'b0;

  /** SPI Extended Read Register. */
  bit [2:0] output_driver_strength = 8'h00;

  /** SPI Bank Address Register. */
  bit extended_address = 1'b0;
  bit bank_address = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_issi_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_issi_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_issi_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_issi_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_issi_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_issi_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_issi_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
endclass

// =============================================================================

`protected
DBfX4&#UeO9(M,)R_^6)W#FH_Z#X(@b^GdaDUEe16FJO=I[X714V1)Tc)9J0D9BO
JMO^+J/+Z2<;O#87&=YACY+53U6Q(6^@)H\;649F)+:Z&&0@,Na@FEgL7K,+ELNZ
K)CKM)TXa+aX,M#-)ON#M<&EW.756&Z0GJ4J8<e.O_6RD+8;<+5T=@[A3bf@LSUA
/bSUS:cDJfVLC<ET1O]V_BUE:4G3TA+(?]Q8<>,N6UJ38&;V;S^LQG-HfY&-1>O)
DY#@LYW3NNI;A\6:<[DROR8\0/NPBQW=D\B)90=IPZRU--8?FO2#GET_DF4g#-0;
3,e668-51WG)Rb,_:?J5ROLT7Q#4]0WKVf1\LWeS9e>U)#(edI/(Pa3A19I8K;dH
NIb]GGd7f]g[E@OZacC:6_Ig6[f;g7A1.dN6AgHWLG<3Mb81OVc9ID^@^fgg4IgZ
Ub/FYG>),PA6=:Q,@RgC>G[Z(ZM9?DeJfPSGB61Bg,F@<G8XH<I-#815PM_#>^A2
YL:/P<6JNa3Q?T.I+TKPc(XT=?;E+JIZ<HNXWG&NSL&87LUC]/IaEFe5cffRgJLE
5#YC39H[C5?@(MB=M)6/=;XP)b5aW2c8CIbL<b9\PU^.#&:=IA:T.Vd68<AJ^WbH
^I#XQ85K=S<Z3,AC&#SDCIIcJ@VZ7?ZSf?RRg]G^@<cTKHb;#Pg.M1ee?c)=@F=H
_L.K=Tf6HdYSZ>[D5ROZOHaP,8_5^<646L,5Z3/?2#WXT#?Vd1LfP4^U5?(FI,@K
<&=a)S/\gHB]I\89Y,TO/]aP8$
`endprotected

   
//vcs_vip_protect
`protected
:,/:M7e.AWX9/[e6;cB(YP@@N;f(85MUa/\7R6-PJ\5,cB8PLR0).(G\e1A6M1&M
/XOD=T>UAN+aS#MPI5e^8DDKXU5[4Z<6C-d?K-8eXWe)M=07)dV8;#LcZZ#=?Kae
TBJ#+A=AX9>1Y@XI+-,gZ+N4I.b_12@\Ga7/dY@@Lf:cC/9ff]B(SXWb@f05(4&@
c1NZV3[,L)e=A2H5bH-@ZBPI5-5;N24Y+Q35524a@F-@EN_,d-1\UaMD_?U^OL_+
FM(UO,CQ\96gdS9G4,/M@d[^dMTFdE2O.L)ADACC[_2KRFJ>V[)[S\^U??^VLWMO
5\U0@]6GC112b+H72(7,Y^#LU_L/05FN-WVJ,#_Z=7SZ6d&32)DGU(8+ZO@M_eM/
8QC^M^Z=Kb?fHAQd<d67QZPb;7HNE2-/07U_-8DP.L5W];)@,Vc[X9-@#T/e\)6#
Za0=)8G8JJ?CY&P\,J6bQJ8LC8=2@/82:/S(TaYJET5-O3AZD/0QF@ff1)SNMI:N
g-2X6X\3/bH(P.FI.RS:H4H+O:==DP;+25Z8V7)K9/feaEH610&OD_0KY[aRDc&P
6AY3g/D5#5U4,d45^:)/UA>.KGQ/aIg6QZa8;,G;]HJ),&DYYKW^-dCB>^\?I>G4
(Fa39+VUI,576([ND](IaG9b-XDL\G^/Xa:>C@YKKEPTEK?:+P\@Lg)e-D(E\2:P
Xe:4-QWN#PR&I5)B[I#G.W0[4cOJY9[EVgE2;;W4,LLXBUPF_=We[_RW0b6+2NR=
UV8,\\VPNbSWe.+O._?>eSc<(c.dVVE/a]][@8]26,U90?>PT[_Z0<GL?HY2H6g;
[Z?Q#OH9C&a(^T1L:._E>3@/#VWJ_ATdYW^>RT?6d:P.f[,ebW=T(?.A73MS+<-5
JBRFU^C\VP\e46KE<;/3/2MD<a-\YOC].P8a^^[\V2\>\O#S5D_6,3fIAG_b1,.X
2KXX>&^A_=a7PJ(3O88750Kbf-.bRE;dgF_dKH3gb<_P-C?YXJb08,b[F:55)/&A
NaHBV_SY48cU32TI]PQ7R>.__+OfZ\ERD&(ZYE2D/<(,2d75W_B64JDXHXU^D[.[
,]f/:X[0[PK\ga[_8I.F:Ac#;5(&FWgLL)U9T+g3d)+.YVZIS.7O-:7V;+GX,KYa
AGGQHCf]E8GJWN5BGZ;_^ec0),6_\Y#P8SF9EB7[YIE<.L]SGM6IA^?]74&YE#B[
E:1WXT^[X?:7PFZ9R^(EeH8#E(WC=H110MC-:?0><c5ZAcPYa05.87=7cI;:.T:C
@aD?<Y(dLQ+1&1<M5c8E0470-VA@+(PRYH,LWS68g@K2WI.W7U,C/=-UJ>3]4]J<
(e+E?e5H.4R[9bI#\#:O((/@beg9WXL/(-ZfY:bQ4A3^eX+aAE.NV=7a#43K8Y<+
#ae^QU[bJP:2M1:T#=&b#JAYHMb2:I;?eIK/)XQ8cbU?S\&6^=K<CHgfAW0Cf^R[
4BGGD22aQYc[I9YEbZb07c#7Qg]M^/=WdKLM7fSG(@IEIc38JW7aHB])_g6Af)OT
CAXN1L]UD\IN[8ACIDeR2VWTB;AL@:b],/ZCb9M;P-1J&S@S<a0ae31.&E:M_cb,
\V5KTMT0CfWAQ@49\@Gd8,]gO(RcL=RC(fB392@;643cEMY/FR)aZcGJZSD9b^Lg
^P0#<#=D+e_4YT:3O7BW_1;IQNQ82+-fDg,N9.c(+U,N74Z]=_1EEebAC1W/SY>N
E60F8/SXLJ0T#Q<WA-c:\9G&G#054VXed\ZaXZZ30^_+6PT+[S&?+7/&_L,Y@R7+
JVKSIZOd/PRFU]U-\.bHP,3M0,2cPH6?QSC];-e8#55&B._[VP>BN5<2Cb4[0f)8
]^]IDO&//1F7?9B?0<IDRD3F#&I>XL\.\0>E,P&6>C)TF27:gH^bBG.2[&@S+V.Z
a,;[P_dV]QLc:?eY?[;\0HN8O>X:4cI4&Q9-F3P32XPW=,g]EJ3B_;QC#LB.0&eO
]#OAN4U:J(#+aQdF,HJ4LL4YR]d-/&VfGN1LHdZOPK.EU:F)L]678#fSNA]H)gQ)
:1\(#WL3?R:.?NCcQacFPQBf[cXd0CF&.c#9VeR_CO;M([&^QPX?7C9YBKZ\J3a>
VL@HT&+c&3a]TPM<;Y:MO9b0QO4MZV,Z\,78NKS\<.a0&.QWRIEe#_D&Y8g:(C-g
b?VIY^HEX<,R0W&YG[TM43WgW)<.Fg37@P2Dg1QQH&N7B/bf(J212eI8;&[N@c^L
Ab?@0(QALg.Fa;/+TG_;/=b[BEV>/b-8MQCET6OG3:b:e\bCBe(2726E\O;:XU]#
,NZ2RG;.H162K]4<D(F8YV>B[B+SKb?aN3ZeCAYCYf(Y;+=?I1(.VJ=/_fZ3-/B(
f,GB:Ga/Z<4+,KdPG05>HPO2WBd.\<E)?f=8X1(PEH6-UN?E/&-HaZ7G3Wg(?)T+
Z(M(HTL;V6->8ab^eK-9e-/?g+aVQZ(IE=+;<:EV1/f+B^ABB+\R<DV(WU11b;#:
VD1C_Kdg6+J.fC:?8#HY<?R:Ib/E+0<>P4+-5]N2&eGgF,I;RCMXI?#=;DcbYg<[
TdA2Z(YY9D+,U0fV(R]b[@J^dDd;1:c);\)?eF0G#360>#AW,8P8aDa@FX<e7,[4
NS<3<#:4+;#M)@cQ3.TR1<IPe+064O<PBY#J;Ce6aIJGJ^0-O)],:F?C[/&Ad>gR
.bJ(9DaYC8TF.f/<gUJVDLP;Ec4dHZK1M+cB2(ZS-937=UDGdgE;eP<,=7&7-\5D
e[]a+Q#G?7R;-d;J<f2K<b8@QIMeYYX1^VUNCJ,\;+g4NCK.UAY9?bP[:QX/&NQ:
6eK7WK:)QA(@G^J\PFIFVW4M0KE>ZbMI2:^IcTJ6SX.L/+Mf#44:/dI:T+R@dZ_4
S4(#K&DWF=]O/cT==P.EO4)Pb59OP[HG/GLUf(_-V)HMaCWOW19IL5A]@Q9^9;5Z
:CHJ8/>2IU3_=#D.We[3.HB:-V#3NK3#2bA_gXP-NOe8DT#:K0gE)U()c3I1OC9K
VL0K&L#9\<-gcO,aONSOBT--8OMb/0AW6#ICG/QSaEN^ZPLECU5/0\O/#1<F7K0M
^U)Rg0:+VFB(37V-UOSVXfRH=?gR)LSbS(SccXJ5KF.GdGWGQJW.)UebPf_1S:\Y
E;##MLbM10;6@Q[TA6H81ZI6RCJZ\N.S]XH6(M8&COIZ_]\2&_aEO]UV8ccIFdA2
Z64e2^;+(\+VV1[a;BV5KK35g^(+b;Bg/VRFe-3RUK@8bc9>SP_Z.BG)J-g249Mc
GT=UPKXX1/U@(4K<:QP8E[XJS17abbX=NIUUM@d;A[#Ad;3VR_/J/.dBceH#JLS1
P,9?-W.@U7&_+\a2FabSM];74/QU+)>RZRU=QK<dC8CE:]^6B8A@/><3.ASN604f
PcEgKZcFa3@@&CW#M0/X42EGCgXU03NS1-IdcJDR(gO&J+1<f2Z?be4314>I2@M[
M9GJ:A_88gTU6d2M^^E7<f8Md-_dE6T2H^-A5-NTT\a-OP@EFIET[egAQbE_?a1_
U=QPd8L4Q8H5@K05FD;?dIOP&;)(IV:RRPE/+AJAS@T_I;DP+CJ?4>-gGDSS^Y3d
IaZa_U9KH8NK]ZWI69+3SN65-]M4<H29-SbGS(/6;GYdQZD<0e898)ULR:U@eLI6
41?,K.YdKK]#8Q6;:<^((UcFJ^3K2cOSU1_@ccVe,e/[/#CN\(^;([9HBT3gd/-F
X1^Y(7;DDf-65&f5.SG1C])GITV4-fWWIf>g&O0/]LX17]-TPCMIcC-FI\e]-V5O
^;c7MHKU_QbP_b+LO7AQX+X=D-H=B\ME[W8+g5VT?#4-ZBDO+CZVVa6_VR/gWeQ3
BDQVQNVD=2],+SFg&D_CV@gVc^E<0.;c9K_:/Z(b]&Y5EUF/J_]92b;T_SXY),6?
@#8NeH<(;cJNe5g_XF).9C4/U?RGe5JKfK\d@RF4bFRE2GF0,HE-A]#?<)>/9ZG]
BV/5;HCa3DNZ5f:CAWF=df07)D#DRG=g[Y?=KR<7>GKU8)?E5WCYc<Qe]FU[1,Y#
KZQ0\979+F<]I;?GJ=36^YPa,=LS6@.GOc>M0HF[?FS,g(.NfZIN[U,5JeZX9,)W
;VB[,P)N1D<.ZN=&,D-9>\Y(G)/WMHRb#D&,UAR-M>9A3.K2bSDC,L+K>3f[#1-A
R32)U,8RQ)E#ZAeP,CG5JU.#]g,bAUY5P6)4#@Y(Pc==0fdS3/Q=WB-9<^V>^]@Q
<f4CM8(D7F,:-dA@NX[YU]/8H\7C@]8SWf[gLGCF2ADMQ]L-@8MVA[/a,dSD@@SA
ba@ZWSTF4fA/PCO3,4I?^SQHKXMRZgYMA0([e(+@9K.^HZbIPD;J(7OTSP8+0cL^
>W>M,JJJEg<W(0\/G]LX/He9eOHVa_E=_PZWd>20^[)g=UaOVP@O(M.P8)cT@P]3
R+W7MC;1WJD<[P4\P;.c]H>.7_,?T0LL][MA>6QXa)GR#]A@E=3FQ1aN2eTeAZUN
2;.(WG?egCb^f:/V6=AWYK,#bb8.DJHf6?_bg[#FJ@UBSHHLQC#K,&RT_1J-SX8@
ZVRdd&&SReSe&#S8:X@O1H:?(E5&^.dDB<#Y>W7<;TN-bN^0KCgM4WcbIeI>=GLS
M[7P/1@4+=U(RfBc<A5b\_@)M8b:^:F]3TY8P;PcX&Z(_a/0;AZ^3056:54@=)eU
Tg-eA?U4e-832EW&1^0J7U7Gd;[24@W;f1[fFOI>a2226:WRM)X8A]]6MQD3,9g^
S]R]SGQ^\EBKd9+IH:636/+f1LFL[OER6:9c=,SF]7H-0L;c(\M8b)SCVPR07(,2
e[eE<5?&KR+&f&M;CcEZf2&]>9(<(Df8;Y0Fd8V.X?)3/BWI=c0Te-ObAfFU1XA3
I<^=?&FK_/6.4?#/19.P;@U\VKY0b4>X_,4AReF[?5O+=&E/B.8C9B]=QeaRF:]^
49(N_@S&YPadA6=gf,4Fc_fZ>#WRcRE8RP?:Jf)2/HN]D)KK6.3ZF8K#We?(J\16
_6[KX7^e@OA^?V[/4(8^K)1(dV2(d)9X+.]K6X>AP[>eR0FK2M&@5#fWXaaX<48.
8O#f1:^0SB:MbXF69DVa32cCS/B^,>.Z.M,-&W[>[FHHH-9>Z6XBK7R[XSgGTG@H
3XUMb.3/3.H50EC>=-S[E81@FWV5)U&QX(g\[><4Tc4cQW7(7gF3Z/+3Ra:H<D=f
YZ8A1NEZY3KL+,-Vd94PaKcU/GG(d;]8;2<b#f58:+J^eDK\C+[@N)SA;4K[D>&>
ba?WHRcU::0SA+_//4T)Nc6<48?_[g8MLTe:bZ1agN&ES0b[@P36A]#,aDS:,QK\
6aB;2E<F:C^.<FRPKRFOS7Uce)7-[#?/[Q?R>YU@McX)-R?@C9421&Z(A<V3O<fW
8NE(O:SXX[PQZ(JTJWTgFAT;#XQ\;.MELN<NYc\V<:EQ3^R8A8#f0T4Xgd2I[+D]
<DQg;U_W-FM=&4QB&D/Z+?UZ2N8:U]AM0[1#:\;J;3SbIT0/(M(UV,R1J8Ed/6?+
;W-+JY:O<E2/.B,.7RISC+2>EV?K944USA9OX]/8g9G7]gL2g&G>H5B+4F\7:IQL
/\A(4GKA3?HQ\UW>P3;Y0O?Ua);MIKG6CL.,(PPPNP(\0W-3N]PT\?\W7eO9>GKF
M8^N,^/T5fIaTO4U(a<cAU#KWG0QQNDe8&71M0UMc/db@);aDVKI.gSS,a@0MOBO
e,d5^RV]9b8GVcb<F8R(/X=.UVM>X,ce\M>I/,9^^^E4H+<IV3VN6,_6WHUPC;9-
c<VF75B2^cC36Jc]B\E8K.P[1Y=DUWOCddZF8dN.&(MI#W.5g6/5\/.AOY4cQ&^@
eXIAWTY6[;9LQSHeU/_@@e8I5<gN=ZAOdBS<10Kf/8(CXDAOT.8;#BT;E46Jf_=H
Od;.Ddb@GYB9Od(VPX@,1\QCQc0WXNg2I.cY/5<0SFG>C:G&/-YXKFO@S,N7MM;P
Z=WCb\9-.WDc.b+T5FY7]/C5S&[1P#40_ETeUOXS?c=b@+IJJ<IM,f#+^>>e.<Ka
1DD;@^+M>QPGaZ4396CW(&b4KA3A/=QCNS-\cbL,fUYU:H4g&3Ub+0C]a.N;fC?:
[<V1ZfAbKU0YQ)F2ZF=0-&7\V38GBN3EH>^H@=[+S1&RgIRS0@VB,<,TDUA<;:-V
c+&La#CWCT[O-(OPXf8<8U,eS-.D;6b.f@U606[WLc2a1:2Z(dd_\.Pd/7_dP<PH
?:2e_3\97ZES&@gD)?dNWJQF-])UN82I<ZOCHKL3+&V0V:&KOEB6ZU)KI_bF=8A?
\ag\6/\PE1Ce&]fegb,c)_:>@)KQREZd_<^[12Q[^AZTEb9F#.0C/AL[:#<97YA]
64c54U96DZP#0f8QBV71ZK,[P;HDb9:345L5dR#MVfL)6.>+#&]DJ8\KO+))H=0B
HXc;@(.?_=T4cQbGXT=FP\a<PB0Jc5=(e0X<@19,N@9IQd.6YRPS)NGJ@P;ee?@)
A+;6eMASL9c#JJIaTPVaf>S&0H-d/L(YgME.6@&a24]]?Z2H?IC:R-bWPB[ERRKd
J<bE+SS,dN(MZF;JO@FY_EY5/PUA@17#0Oa6Y[T7aSPU\gL:/N;_TU?OGZYbaIfd
J7LTGZV+Z4FN-eeF)D]a(Vfe,[AZZZ;&b:]c-[a\]R3(7-&b3#?Dbc\9#<1P5T3D
X4HW_fZI5af4X4Fb<XK=6B:bSHUJMG=ffDV(7RAJ3WVA[@eK]?GWJE>5K^R_7Lad
Y;I?EH&-[F4[FB^O]3A+M_cRSPJgZMP6&2A)1b_IcO/5><HT#YcA<LG/H0XO4_b8
^7W5L>/;KJ-P5IbU3A2O;-EBYc=,@b2a(GGV@#,8Aa/7+c^X#.)3@.A&I7)Z_=,^
^V16AX:9;M;WV?-JW/OSg;JA,+HL72?S;.+LU;P-8<)XCg+>gJIKfH7.:d;=C=e#
5HfZ&\46OfW5^gYC04,:(#J&)U]0[DKg=7HFX@>Z,/DNeeB)TZ_^;a5P#<#>S+Jd
-X6,#Yg?UXZ:<Vb/4RXg_Dd=<gX^QQR_P4ZPRNZd>4]?X];8\5gJM>gSJK\cP\f,
S0gCe&_)<1gGJQ#>Z,)/3E[D?g\NP1cF;SMY-deC2I&M;]MU9N+8((KDQ1NS[d+Z
V5<FP2&V_,]WDCM6fa8,FXY)5.Q?Ag=NeScOEXC_^OKB9c;#93S4([6B@Z0+B\f+
E\4?\68VD5@/QeHCLdXN=/Q7RD\W\\IHJ\)]IC]<^XKN/cQ^d1I8CK.(=e(8BaBZ
J<a>L9g6b?XXLf1;P1G4Mf^YJ[Kc]fASGb1,?PY]#0HaKT::SQ1g^aN@dIZZfBbA
#4+V/F93#,0G9(dA9Q)U2;B7Ica=NU:#O2Q)2V4F60fTcXIf@4DTZ5A&:+DCd4S=
c0IW6(O?W-cT_S5MaBVY1+GTVe_D,\fMKD/CZ(Wg<9JK=:4&?_Q<FM;,B2EYGURX
SgA@=2Jb/ORW_-F:FP+11+\c)/I0-CDQbb.;,K/<TVE&(Kc-g7(aO:<DAGa\-7MZ
I[caO[FG4166@LN<AA-;dO]QJ2\TCRG>c4E<;),aLB?/gCLVV2QG7g),RRC[f5\7
+_78K9Q8G;I_9E>aWPa?(620^S(Q?XKfL.=\,DV?G.L&dVL,Z(A.GeOU05WaPYKN
GfXTe^=I1)=e/K/OZGL/-Nb^WU^;,[T4&OUcfVgN-)#,[.6(5[O+W,5-:>c_0#;e
+6]:JB4PPC8c?c0)=1HABTO>N^ReVS7\EW<2B4ZFDG5+AI,CGF8GU1A?@,HB.Xbd
)M=UV5gK8IU#(@^])UPGdOE2H)fF99PFM,W3TH+L5M]XV0)>^K49+F=_\M8JNM?G
7^2UELgDB0Q(-QQJ&1Cef3fEadT)3_25,1;)+8>;AcARY?,.\?C&S8O,cVJQ[)af
,9VS&C#:T1^NSR1V]#U7/D6#[bRe]08e(]WcP&:)dAF=,#X)d</?:_3I&0W07MH4
>AAdC,1K&1(28eQ9K6F:cL6^PT\dTd]5Z/NXCN[B4.cZFC3/VHLUYEV^1Y7&^9,(
Q(?\&Y9RDdda@\Sf23L1;;\8&XJ/8:RM^-&W5GATKPR/T3F3+ZO+3RK-5KVSbf>\
?XEDfJOXB^fB<Z>0CAgc^:A(9K;4F_[U.Ag:TZ=afRI:M9A#EYaAU7^a-T20QC99
_YS0]W.J<54@fXAK22ZA^#TN(aJIb7aTE6J\YB/MQPRb4&C8W[JVM,O.&MWa.&Je
A+D_FXYeJ\>7/7X,:JGLN0.I]A)S]A3-O?+BH8MS\^-:BK0/H9F2-WE#Na,95DN:
d8>BS)9W]#+f023P+3V\W]42_;E(J3[KCMeA_3#d0a8G1)d_S[_0O^23GeHL[YKO
Wg<C^NCG5)(^bgY/&\[5X=BL\f,YSU=a:LT#J(RddS8\=J5T@]S36X#e),Y&WV>V
G-@L4&RVGTU^JDdT,PTd##RYPf<L;]>0:QCfLU6XE<:+&FXH_cg?L]VT.^:g1e5#
^S4:3gAMa4D1\K8/#O6\QM6[_X7L1Ueeg^FfNEY,(?IXb?[,)(d.<?V?GGG;)Ng@
EMXBRS1PgDPd@&1Ha((4/ESHI;5RQ^-M:4NK8;5I4H//adB0B?SJS[4aTHYE7]B;
]T3I@_g6_<BUf6N>CV93cUbXg\g;:853@(?b#[]NU)Z8H,9F7J;ZT#19OONHDPca
8BdK=I/ZBZ)HMT+6\aAEg&4Pd\N)5ETQD[E;C-fQ)g23GQ;+=,3UCH#UOK)2\E?O
LE/<0-W#aY(]]Gf21UKC&<DOQS.ELGN2U^^gL3eg=:PY\NE>&0PPV)D+g7;G2Ad6
:c7KZ\_;;Q3aS_=U6O.ZKT>O[@++,?fNe6=1@eFb6.0Z0M/)L7QLeB>[^KY/Z85&
Fg4S>/OaS?-:J==+<cgV/4OS0g_4YM3L(^#F,Zf=TNcAcb2=@LV-YOJV;V,gX(CU
#bN>G:g-<FDe8:.=):YT0V_X)Z9TH@=>(RfEf-FUCNd^^d:V8D;,V<4Q,@?L:g-U
_SNRLO28LP_Z^K?.L6IY<R)IE)Rf=5N/_N6HZ:(4-d<>NCFcE><8P,JHI>C\VIXY
0f[99_&7LJ&JDYJ7A[WL6T51B;RBS;L^)<:7gF5X;B_.LY0(W,ZbNbA3DV#Y9F(;
BXKZQDNIAN6_HO?&S1=E[g(Qf\^(=V6MPX33Y-\g[eVgVDT2@I>.b^3[E+(-77XW
9a6@_cXd,bSKCTZIL)H5[cNR0Y=eOMA>Q^8-R?gT#Y5eWe#Ke\;>7IQW&bfHUff^
LVdAXY<KdH?4a</^YJH+.b++=fXcdCcXPRW0d47L(T&1TLd(/Y2C\aFG:P#2B]D9
DG/b?c2Z^<LSP1bJAMZ3H9GddAI>:0:6SMgZTD3D6-EQ>ZDK#G#O^<Qa>W0##(Kg
:KaX6e4,>#7f=ec._X8B9A&@0DSL9(A0L=BJD5bPAJ783Y-V(U2[fRJPD@1)C.=W
:d#;_59TP_KX==ZGKBM/.A?.a.GY?(I7I]C5Sd7XTJH[KB_7#)eA<-\UfRW)Q-<D
/TRK)IK.01=Q7,Bd+/N[/_g0+FQ?EHeRR6<7@4\)6Q<3YYJTH,MeEAWV/_,N+T[B
;ZD^/.U57#Q>PEKJ.0@(gTPLX<_?gDLO,2R_@G@WW]O,>fA5aQc0#g?[D:Gd-(,_
.LYP_,[=OZ;N=?RHMVI4?\V5#FM6DZ?0e,4@16[aG6GPe94Q?=&B()JE<JU9#4,H
>GS^1;)).-I5V<^3C512Q[M@UdWI<R6V;O;W&+J@N7Eb5GRTeHA)@M1UIF2=6P2Z
BH5BZWYK[SI&U&6]#AA/0JA#REcM/_75P/DXZgS>MK_L;dfR+gB/#[2TZVcfc(@I
.C;Q+)V,_Ea2>#4?gf,afL+W23Z4<3cg1)L117YFF31_.@Cc<ZXaNPKZGZdBI3X#
QRCTEa_eT,79YNZ7TF./3+EA6N[(O[:Nf.NT))H/\:-+&AC2A]0=4.)^PS6<IbRI
W:b791=:KL<#281;7&W4W8P1ES#-PbB6Jd7&_M7WFaCa0SE7B4U+#Sa1T^bLbT9U
&OI),77>f5R6<d06L:2>6?=(GdW(+9J^I:W&L64_c+.\;K-T/0:\V63F;?^O89S3
Dd7XYNI?,/Y-MBM]H]270dAK>2?aPg4VeC0GSc2,IB.>JNJI8=??0ETCX=4_JN5V
.A.&#8&fbSS==e9_Q8[bC&@<MO6.DULV5O1C=&/[=>2S;4+DE^:Z2D<Z.WG(VIc]
E5T(XCM>G]<@b.MLcE?,?R[e&bCL+D1F)@V)8bZc38E;DcP@9\aC-6007W2&Ya_^
+S(fFH)@B:Z4Bd_-0F?-<9d&XY#DSQFWWT.W4IV@Q@YDd\&)]-b.S&1e[O[cD)#;
[04GNXIDQJ\dX6+LgYZ6^7T/TJAb:/J8g8XR+9g(V,P./#)64A[)O>X1QNY2(46G
IfSS4QS.II^U?7Y04QPa<J:DUR=\/KBH-,O0gU<K&1@aV7Y8J@G@9AbAaE]WT-O[
^=>TPef#f+d?E8>RDLPRNIbYXU>@U,_T9SfZ?f<e-Pg5D\UeEISTeTfL+@66,JRX
N:)+eSMabS)6W^RCe^ddO_JG28.MQ7IQ\6DZ:NSZZ=\E]C6RScYa:VXQ<CQL5gJK
.,Gg&bR1ePP/dXN@C^VL],S^(+c6^^d,ZOZ987H,AbL7aE@3M-CG=H?W-T<FRT/.
W?_#=V3VM(S,]#J^47?Z=SNJB/:\.G[.6+<eBYd/c(eBZ(4P\?)S-YB6;=9f;b?R
YX-#;cD04&F\T1FWW0G0C5^>;Ia;Y29[\CVD3RE\:O(,Te/V2T-TN.P3J#L/,B#Y
4Z?4X(N)7;1#+RD@6I99:G:]g@#Pe9NE98CM?OHT^S9KWM?0TV9Y#U(D,(fMX7>2
L4-:F]4DNB<73>43eG7Kb5F).]ZC_NR0QMG;?@aHK.DJB0M((5>_K>=/2^+23?ZT
3V87[1.>^f;gQ<99bHV>[J_YaD]^;\<9ZR0GT7,P?#CP:T?60+ReKQK?O1UGEXSc
BGHRG3YdS&+HJY32b?dKC43b.e/#HIRS3KD6NM,@>OP\AY2:&<^a(UPQN^T]>YX7
g0G(PG;b0@P3WAIWIR>cY]SfOE;^@_4?b>+\F<^_:=_O@JP3\WMR@=TSQBMG,1=0
6+a<0XBg+(M\Sc594,KIF\^3F&YV5U7NL\9-;FPJZ[H/_XF^#8cY,+#]@d/&(PX_
\2?Xd\2]8:^F03C<3YJ4G(d(S5KG(RN:@-VBF7<)5Y>>cFM]be/SHD?c4L)1HQ8a
cIHNZ)H-1):[N,]UIZ?B=2O[9I6Od=_ON.eIS[a(^^VM)dT4f+?J@4(2VKE:gT6/
EgBL2AF(TE.Q<?\OeV;7@A3BROgP]G)8Q@J3O>+I@WV))?/#=K(35(AAM5M?c_,N
GGJ8<BC:-9GSMGb^FSWG-#?\@S#Td/]OdOE???L8dY0cMY3Z+4DAG0]ZWV\>P3Y3
-\_AYG[AX;3ZS>GS/?I,96YG-VfG[0:,_&.MIg7EFD2cS)I:/V1\Jc^RKI?SOHUf
II0Q3;B7>15W[G6&;W).#@4]eR;a+S65(AaEaQ(KUN;#7d)1P\I^9e4O;T,K8R.c
d/><.b)CAQcMA).#KU36P(OJX,7ZUAJM/-I3R+B57_Y485SS#LYQ>)RW?.\F52MR
1=8a[T1-8F-<T8g[7+5Z_Cc6KO(X_bM7S//eN,#bU?.F=;/6+5C<N:eeN@.\L_dW
9:-/QdDZQ8S&:9f9Vd55Ue+:WSL91PK(OPD7JA9\FN(B?0C7@/>\DAW<\dQP0=BE
-&N:U+&6EZ[-12Y603?fXRFB+4aOa\=^H)5<O.17)W,@Y-U&U^Z_:/6RJ/O=?M:=
Tge\;36&W:B/P2-NC@M(;F8SY>+e1D[8I4YJg]cH(YOV&AL#&N_DPM8:g_QEU^<[
T:?ZAFB67K0Tg.Sb<.;&[,O8?&9gIAJ-0=5,HTW7M59^XQZ:gY1>+9@Z0B/.D&K_
:&289V^dHb@J7^cA47dS)/\D@][_=M<<B,KMQ(+fTdN1gYa>/.YH3=SR0=:4CTf,
e)Z40RJ+UYVGGQ\KcgPMM5JTA2K(/O+C-FO>F?X16B#OSG(bg43:5@/H:Be;TS0X
gS8PHL@>^-,WG_C:JDPFZ<ba=(g@.:]IIY#BN/?WTP/J54O]BTW@;H;0-17X3KQ[
NR?cXEV>=#)6f^J5.4\JF,#P6=6aNeRAd3W>UbL\SS14^(,??6Z[;-3DM#4_8:_c
DAKFf9(VaJ+:5Y\29MPd5Z2^Y1b2cNVdD]EcYVRUO?E/Y0<3eD-W>QgUZfT6^aY_
:U5\6_e[_G6<2Ed8(9L5T693VbWPW>G04eI;UBA,,M:/]&V8M,H8GF[bM-E@3W,?
,-f(UeNd7eN.;;gR6A1A]ae]P[7ZJXM+OF2b#Z(gG(#QJSL[70[W(-57dB3dT2M6
DP6g#0c/=#/UN)A97&8IOcT6b7/e&Q@\]I=#S<c@/-_R3Y,5J,Le[SFAA6^HK8LY
ML:Y83a1#Aa1V,]NC&JE&/5_1U5X_GWE;4S#1e+]2,+GX=Df:[FG=N122-V0_GP\
c[45HcFb?a/#DaUce63&;\BU0Jf[V56?_;X[>Ze149b.K]dQ#_APJd\(IRP=?0gE
(&TV,ZSU9DQVR?,Cg5K65d1X(8+<XU6-[HG7_WHN1=>+[/1\KbR)G&\[VJ)?=K^:
PYOb#UI^PILX<E:b/B&9:N;Y6a2/F<<Z^637BJf?eJfF-)IY+;HBS]8I<=4608U?
N_a>N]C4],:WEcLB\1]MEFG,B+]+EMfef<,DB6I6Id4O,#35>4&aA)4GW<.X^2:>
I1RREFe3?(OTb>J4^>+XE3a4#P>0GB?#(caL-c.IJL6bINHRKXa;3^;8((-C)4VM
()MBM&J,S<Q7I_c^1DC/&BYA3M4(0bKHQXPg=N2DF53KGL?81e3]<\)L06Q3-Mc0
OLEJ1WS__9Z6&g>>](0gHQa7@W;U_2(#YBK8\(\XBVE4I/TI)XM[NT:SI82dG1&N
WZF/8a?9N?U),O)=3.1V]KE\=V)1(?20@H5[dJ;5)):))2bX#-VOJBJW\B;7HOVF
06T3.]BOa+\8BVRT_P;T6SYeS(9b1Ug]KZ52;g,1M2ZJb6U+DM5F]]5g?IALC0ZV
:6P)d?@B7+MI_=<PTc&UWLg5M4WBJQXd99HW/#+6,R)(;ZfZ@e/Ig-Mbg7TN1WDG
K:#>J60]S?E]4a;WL-J+_?IAU9gIfC-X;Y\WaB0JWZeZ1E+26]X07ME8Y-dV5&[f
(621()\SfU1,LKcb.UXeP.&f</>MQdK(&f9(S\?/#<?NXQDA&.#RA+K)?S1EWe/L
g.BVQ4Y[[#7;KRB@VBB8B()NOfB13XO>,dIW.<_9S1KT<^H^&bBUK38\6=fM7S&I
QUP@bH#;F/F]b;Z?-R1.9eJI^X4)[4Xc/cY/E;Y:#]MQ7:6c9/O.Hc3^S5@+QP:)
;?_@A9fDUH_R1a>>Y34QUA?:bOYI)OH60bT\gQeK5<d\([cF/RZVRPT&X40G-5V^
).]D<8U78HcCPD:V=)C:U^e[dYb^d=2T^JE2?SY1HGRd5Y_3O/Ceb=K/HR@I+:Y#
I)6SJ,?C^d[&+adUIcA,78bKJ2D91?VKZ7X:0AAX^\?dMbEaB/?<78,Sa[=#fYZ6
0+g)OfZ./ESU-66U^U8EQ]LBH.+N[P.JF.c?P9#4G5].E<dT/a6F6+cXX5BN<L@C
1^-[YL+NOMD9V&<GdbM55E<_<I3(KL9ZD):=Gg;cQU((S-N(T5e1[3:QT_N9_@<B
?R\L;>2PC):.G\dI+R_(E/[[9NdPER2gR\bQOV0(dL6WaI0c^S/+D1YPPUHM.=f4
cR973A,(-WY@b66-WFAP>S;6aDU:JN@K@@GHNc5/GRTg2(-NOP25[VYU5UW]\c6V
:;0]7\A=K;;];IS71fCXE^S.2Wf74e995.ceXD0W><I][Xa=0TB<YL)d,0=.+XB:
^_KCIe[2RCQ3EJ];D2F4^UDVb+P>XTCEFAEHUR+4CUO6g36GGM@<6V]=^d-ISc?6
+YIQ9IdPRHNR54EVc8M^)(V8\\6Xc0HG6-DB_U9&R8WAbTb,TXZd:(2f&>0PRgB(
bF(AX//I\S>OFJQAeO<c\/S=0AI;EW<7#(>@_EZ2?<.J[-d&XAf+_.a8EE6+UFI;
SG97Z5E9ed.>?>89/gX:1PdM,LfWRC9)7V8_fe3ccX0SIQM)J(PA[bA42cB4IOJ<
_#N7T.;0K_IV5FWgZ1g_-cF;8O0a#>B=UT>UA-S^K9(Adg7[TR9Nga?DAI(<+d>=
9A_9V:MHI<4:Y+B:fC-V)I8[S.;gKBLg)G0X8DL;@UeI;gHBN&3AK8(DR771O2fX
\-3+<8>_;W-QDe8EY&=b4.DB-&Odb:G.Y>)9]-Z+FH1S+4b(935O[N/7G]ST84AU
5f0d9RO^TFSR_(gB3OS3_6IKCZG<Ha>5X;+#8UgX#,a4IPND(8QF[CG=/#PP?#AR
BZ>FaBA3(QZME<9@OL9e^&PH0^dP8La\1FBL=:-1TJB0+ZN);U+A1O]YaZHYX>UO
8]Y;a,GW3?5Ud+/BQYQ5[N9QR&X]@6?KHYCD60+95f1GXbef31-(\S5-[>W0J]=K
>(B8LF+OX+=CP@^R>CQV0-5;F@3DUVW>.^;P5dM8W5:&]J@S\PM8L,c@f\KYg)RX
7+4PB/dWM\Ed7KE&YTRI4DaYXFS1D\(g+I(OI4SdBPe;BOWM9?(^(Bf7S4,F<#@R
EH\Pa7(AURP0gTBCHZ.:QW8TcC.)JD#M?PbQ&;aC>5c;D$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV

