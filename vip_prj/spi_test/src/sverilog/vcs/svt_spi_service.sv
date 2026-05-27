
`ifndef GUARD_SVT_SPI_SERVICE_SV
`define GUARD_SVT_SPI_SERVICE_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 * This class defines the service request transaction items that can be
 * triggered from SPI Master in SPI_FLASH mode. 
 */
class svt_spi_service extends `SVT_TRANSACTION_TYPE;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Handle to configuration, available for use by constraints. */ 
  svt_spi_configuration cfg = null;

  /** Processing status for the transaction. */ 
  status_enum status = INITIAL;

  /** This variable defines the type of service command to the Link. */
  rand svt_spi_types::service_type_enum service_type = svt_spi_types::POWER_UP;

  /** 
   * This is the weight controlling variable which determines how often <br/>
   * the RANDOM value for DQS initialize as ACTIVE HIGH is chosen. <br/>
   * This is applicable in Slave Devices Only. <br/>
   * This is currently supported in JEDEC Profile 2.0 Generic Part Numbers <br/>
   * when svt_spi_mem_mode_register_configuration::enable_multi_factor_wait_cycle_latency is enabled. <br/>
   * The Max supported value is 100 and value should be multiple of 10.
   */
  rand int multi_factor_wait_cycle_latency_wt = 50;

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Constraints
  //----------------------------------------------------------------------------

  /**
   * Valid ranges constraints insure that the transaction settings are supported
   * by the spi_svt components.
   */
  constraint valid_ranges {
    if(service_type == svt_spi_types::MULTI_FACTOR_WAIT_CYCLE_LATENCY_WT) {
      multi_factor_wait_cycle_latency_wt inside {[0:100]} ;
      multi_factor_wait_cycle_latency_wt%10 == 0;
    }
    else
      multi_factor_wait_cycle_latency_wt == 0;  
  }

  constraint reasonable_behavior_type
  {
   
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_service)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the transaction.
   */
  extern function new(string name = "svt_spi_service");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_service)
    `svt_field_object(cfg, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_service)

  //----------------------------------------------------------------------------
  /**
   * Performs setup actions required before randomization of the class.
   */
  extern function void pre_randomize();

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   *
   * @param on_off Indicates whether constraint_mode for reasonable constraints
   * should be enabled (1) or disabled (0).
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_service.
   */
  extern virtual function vmm_data do_allocate();
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind.
   * Differences are placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs.
   *
   * @param rhs Object to be compared against.
   * @param comparer `SVT_XVM(comparer) instance used to accomplish the compare.
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this transaction object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);

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

`else
  // ----------------------------------------------------------------------------
  /**
   * Packs object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_pack (`SVT_XVM(packer) packer);

  // ----------------------------------------------------------------------------
  /**
   * Unpacks object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_unpack (`SVT_XVM(packer) packer);
  
`endif
  
  //----------------------------------------------------------------------------
  /**
   * Returns a string (with no line feeds) that reports the essential contents
   * of the transaction generally necessary to uniquely identify that transaction.
   *
   * @param prefix (Optional: default = "") The string given in this argument
   * becomes the first item listed in the value returned. It is intended to be
   * used to identify the component (or other source) that requested this string.
   * This argument should be limited to 32 characters or less (to accommodate the
   * fixed column widths in the returned string). If more than 32 characters are
   * supplied, only the first 32 characters are used.
   * @param hdr_only (Optional: default = 0) If this argument is supplied, and
   * is '1', the function returns a 3-line table header string, which indicates
   * which transaction data appears in the subsequent columns. If this argument is
   * '1', the <b>prefix</b> argument becomes the column label for the first header
   * column (still subject to the 32 character limit).
   */
  extern virtual function string psdisplay_short(string prefix = "", bit hdr_only = 0);

  //----------------------------------------------------------------------------
  /**
   * Returns a concise string (32 characters or less) that gives a concise
   * description of the data transaction. Can be used to represent the currently
   * processed data transaction via a signal.
   */
  extern virtual function string psdisplay_concise();

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
 
  //----------------------------------------------------------------------------
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

  //----------------------------------------------------------------------------
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
  `vmm_typename(svt_spi_service)
  `vmm_class_factory(svt_spi_service)
`endif

  // ---------------------------------------------------------------------------
endclass

//------------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
`vmm_channel(svt_spi_service)
`vmm_atomic_gen(svt_spi_service, "VMM (Atomic) Generator for svt_spi_service data objects")
`vmm_scenario_gen(svt_spi_service, "VMM (Scenario) Generator for svt_spi_service data objects")
`SVT_TRANSACTION_MS_SCENARIO(svt_spi_service)   
`else

// Declare a sequencer for this transaction
`SVT_SEQUENCER_DECL(svt_spi_service, svt_spi_configuration)

`endif

// =============================================================================
`protected
FGHR3/MIdJ5+9[5g0Uc:IXea&&g;)3&0FLb=I2\M0b3;12a;+8)1,)K1347+REf(
:W/W/U[gB]3<5U22?A#X7(J__X1g5R8@a+^4<50[:WO>?eBE9TYER#?ZMBMX80]g
6GXDX[I0<K?c^+UD2E#STDT0C+UfWY9Uc/]HI@61.8\@D4+(\cDBTPQ/_0OUb@#N
JHO=O6WN&(]?CR]EeU0M0Z>0H\f&]/Re0<>@OA:]H3.gRC+=a<I#>B3003:]QI.,
_Q5/.YHBFe(OAeH6)U/N<c(=aN#<\\F<eL4-KZ:a]b#f3LeR,55Na6>+X(PS.?0>
GRe?->)Uae]<?ZF6d_:_77]c@?EK@CK#Xf?.QPE,Xd/S>e=VP(H@^DKZea9=&R-#
;KR#_ZF[Y8]4X+?PSg2/O]bT#1TF<&fBe2]J4?.T0</)PYN2DA\?XP,f4V<6Fc3&
KJ\\T^0/SQ/NYE]]]@&_fCUg[5NB3PJ#S3.e/(XAT0WT>I3P&+^bJdfea(Qac(^@
GEE#Ta/#^D5/,g@HB<FBK(ff;^dQNaO6e5,#?-;.N80&@KIbVB/E,\UJ5_<F/cN\
:C>W1&4,287D/7)V:?>0C@Ye1WUDBIb];Pd2SKK7<bQ&/<Ed0;Q\6B9e<<3+0O6Z
[fe?c+C>3#LV<=&>HX_FIc<D&U&-begFVX/M)O2Pf]e8b3N4bNY/49:/?6TaN>23
?EA=05SDABf<3^SM>HRRE1+eC=QcK767(Q??NE8]>?QJ,@Q9&:7-eG3H>eg#:J3R
O;b-089c[L],,ADce7f[FN^IOe:S@4d]>S_F850NE;PHXN2DYD\e]J8+C5M7AYf@
^1FM+MSORCdR/:=UXZ+d,CI3c&=TO2Ga-<T)#84FE_I@H#XQZE+.=,I0W[E5P0JCU$
`endprotected


//vcs_vip_protect
`protected
(da^^OgHLZ^bS-_UFQX<Sg=?C.H/B&UQb1a#55=^R4,E4O&;ZJ;f+(/JMWW;Y+WO
@g\K72>\f7/6E-T@<.=O#Rd=#17)RBKE)N;,V]WbG=8]BGA)EBb=@5=EYJN^eO>g
INC^7N7ES.6GI#;]>O\2LG&\/H60g-AZLSHJ/))7B(IKcOSfAQT>e\E:A9WI)M3K
c+dC[G1?\.aBL:I2f2gQ;FAg0\+-DU[BE-bE^>S/bKcIQ.E7)Hg<L7GJ?=[,f-J.
<4B:eSM1b#+E>X:I9.B+X056WB:?IYIQ6]QQYBF3HUfD)=Y>158dC6>/MW1g<02H
8K7gZVV;^XV-,3dZe^F6bI3/@c>W:&<@#M#S?BSE7Tb:_:CC8JZb^1R+8d1)^fGZ
2=S;X\?3^Q2FDUdb;D\Ee\;gRLeS(J>g_Icg9..1WDN/M.EeG<c6MbLg^c5eaMD&
4(UJ@]R6:4TOD=5L&DQ-[3P.QL\VH3]:_+KdR\bAa]K()[11d9[G5+F<JG(^#LQ>
HbDBcbCW:D(PgL.U0@)]0NOa/7/A)<70>IFV;DXDcV[1FaJ2e78HEJO\UK<NY&X]
ZU,59c?(S8dKXJJ7K[g3QLc^SZ-(SMEJ]BCbK8DUB]V4NS.6[G?0J@D3F4T>[KFU
;(&^52F@JJ,Z)F:#e(G_GeB8\3->-YLJ]5YI_]GBF(6f1^-SAP;D#B(S_)<9&.Z#
5c0?7FP9ZXLd1>)\GMAacRE,,>AB7[eJ<VFa-MJR#7a7UG,aP3DPAcc#-WVHJDJH
<Iba+L=KDS9B_M.?e^X<QRCGK<]&ffeW>]ggf#;<A0.6bGOZgZG(>-NOUI-?;gSR
82RKX+XVU/@I<e0ea7OIVV:WOZ?B1M,]1:aHH+-&QY4[#M5KbRgfR1IBaJS[&X2b
[.V_044\b[^Q=4GGTb2P0?8JKDN2^=>BbOCD\[./@EG93_B&e#U&5MJQ0U^Z9P8P
=3We58HWCUH-/SKeE3CHaU3e06@:Ja/V@VU/+eDOMXLTS-AcR7_8KQ9-8Gg);f1B
\GE&,AC?]-X1>?=[AR1fH1.+<\J^ID_/<P9O/BA:046eH0.4\+X<4D1=B;7LRT2a
UG6H3&eCHgKHT98KegYJC&]=QU_;\7DHf)RWBG5@>/0aZ_JR5X4LLD#f?O+=)c_4
GZM)K,E<Q0I.W_40g7&?H]aY/g:S>(G4DTcKRU5MO5aBT_C,@WW@=YQW;7>E.3S_
I2\Z]862J^AB1e522?6#\\Q8AF,Q53.=9:IJe8>^fa6._O;.Y6V/V5SF5fe=VR^O
&-XLEE?LD#007Nc\IZCWY]&F\La=5KQXZ:0GG4:g:C,FZIVfG:-P>5Q@cYFKcf-Q
)5cIH2A+PP#IJb=Ac7Q8N^&f0)\QR-[/0b=_]C\bZ35[)4\F=Y0=78N[>a1423L\
&D_WL\;3Ne^dfaG2:+M-eI^PHGKBX]QO0>EU1_IM0c[5DDGUb[=L<bY(<&cg>82I
R2aIU^5#VVU0;)P2,.1e^ZZVfK=KfD2/cHaZY;d1_>WG3M><T,&Q;?:@@dW\3,:X
676J4Lc)D2]P/H0LdHLLD(#IYXKM\NRA+9fBI2dYXS2_R#ODYTd6BY<>,7cSa-\:
:fDP#CW=83SCbGgK==G/)/R72Xb&^XX@93]YTcX;9?7FEbN]QaX50G7R<<U;@QCf
QTK\I=NIN[G1ADD[aV9Zb:F:VKO#V@CO@2A)Z\=+[C/A3B(SNH6@=A+SFEMXBU/6
F)BI6CbM[F,FQ3HEVG_7DI=e@Z+Lf8I_;YF4Y?>,A)LEGGA)F[0L&bO60YT02WNB
8d6PgM6?E#;IRBCUF(b&Q&BDCYeAX[@Ve[=UPI8D_.DA7BY:6A.C<BO>@@1QHJ1G
@+_7SbNC)M08]<6@KCD=8,;TQ0e]T@gWX]^2M#WbQ>=(<HV)>6\+Z0>=aQ9NB3CU
DgIcW5,GBEfBMD55GZ^[VJ4c?@[UG.]b1>+MCC]G,9>];,<bAfY[Uc^3::>C&YR1
IVPdUOBDC,3=1IKSV1:bW#&BR/[WgTYI2gc+6@L1W)g#_03/<H\?b1L[59YGdT&K
L5N#NXLf([Z=gX6/I03JVM0,eS?0BAc]WAX:-E1((0b]T9PaZ;\c<]K2bXb.)XQE
BT>]b^7+EBWF-]9>bX(_B#R\ZCM&<ZS:d0APOf6\3b:GB@/656;5#J=B16NL/Jb+
D+g)Q=Q+_#L+PY3fLET7A1?\_#+-(5\O+;.<)WbW.&Ig,N.f<V(UC5]cLcBE\8GM
f#fC9S])LIS,N(G/Y,J#WXfc?ZR,XNU.1Ca/,>A0DCN9TJN.VZ?D9DLIF_TQW=IN
(^]38M@ebYI?]0Yf1&4bZ5K+RLJ#-UV7PI@dC^MN@BO4a3Y9DD4V:SKCaX0/WTQ[
F0C)Lc(c6FV:AaD,Z2SO0O8FAML_=e(8g8[W+cIYJQ>NV)P;<S?^Z2RY8J6A(eBH
Z8C,GQ1@eT]L)>:5a.SXD)M)AG[FeY)5(.;QG(6g_T;HM:,DLU1:-V1/)2J0;_P=
OF;;N^6\QA^HB&LXWJ6,PaP0:[D;.VOgG]:X=L_JFI.)b/;GYM8+c0RV.\(DRB3a
Z1.2/_@\cF[.2LBSRYY9TOJf:Hb5C6\/cAP<IYGdX7O^,]F)Y9E^64>(V:S=M(QV
<)da?J:KB.cfbI_O_O\2ZR()GS&V^PO:F=0@Z_O#?)MTEcLC@F@DO6]^.EQ#QUa7
9H5L9@.7C2MD@I^JET:R&bb4^#U1ceW5H([[NG;3#F4Zc+fK788CRfWe&g/Kb8aS
&+P92+cS->.4=QJ2Z^RdQHI@A5HLe#)RWIRJ@^>@VbdJZ=VT8<-FHUb20(8W:JaH
XfK)GCg\8^J05JaN#>4[4^bKN>QSZ2+F+8;FK]L[f5OD_eW@.J/deLKO1)YI<XZ.
IIH17I^74.+&Q+Tfg)B@_HeZ\P.dCVA6S<dQ]-\W.,N2RDWSB+APT61HfN2CX1G9
FCH0Qe&D(6-e6Z+:W<\>H1UHE:4([6;1eSbN1W&K,#&ZcaQg,/_,]>PH^DFdGPWG
#1gGV[1)2,J.VEN/Q0>:bA=.C@&f-7X<(-&Z<D];IBMW8,JJGVY78\795QgY_/P5
#f;L/O>OHI>5/aNCV+.Zb7Q1.WEN4M&dHS:=e]X;aU;MWEaEfR3bI&],,]\@ac]3
a02^J2-=T#/VTROT&>14UQNN71gfTe5g<IGG<6[T5A&X+QA&WO[C_b&EVK3Rg5dK
36:TcMXITE[6YOg>40NbSJ_XA>_e@)T>Xd<AACF3NcceXB=dFK=cI2TD8V?]S77+
1]e)IB3&[3Z-?DC?Hd,8[M60,P<V&4LYa(-K&aaN]19a5PG@26C)HC8,aEW&:=?U
GTVG-&:JIfcF@g[UC3&Ug:eOTZ)TOHA1g,]<S)f;(R+T/Pb3EC[O.R)FKE#C;6Y:
XO0@f<4c:V-IC&B:W<+J#_9^Nb]XN:;991<d:.d_GRO?<4ZJTP]H[=/LPMB&bDMW
6DbD#CYVV[,3:Xee7@,M4NbI[c:2.Q.e,6^9CBNH+344g#7Q=;1=UP]72R>:^PYI
V0TbI/GFK>@Z5.YGA-<XG50\DW8SKFYCZ,)Qc=MTL=+TGS29I-M\SPM\^D3cE=5B
K-6(U,DKDYDCHQU6LMNe/E3NcAUec-Q2UDKYH2OW-PYXeJW8D;&Ld5CB/-A)cDJd
\a5(XB,F)];2&fJA:^+&&VIN85#0@Wd\8X40=Nc(fFgJQ5Cfb3P6gfP:X3Hc.6UR
DQKN)0M#0[P)#\WPb?J>fUV._GKKY@J^ga^K7@bR1E41e+7F./.Ca<7@SOL=6\46
RX-YX9)Y]?<6?>6K23]HLW.LIKJN@IU95>YSg.F9B61DEf&+;J.VB_M6A/LD:WHV
0-29#CQX;#],A-G#aDTNE51bgWL_K(+W=)YOPU)B^&F2:fQJ;WfOFJ1RC90c[[c0
\J@HGTZQ3K/caJ[4Dd2\8SAHA7,^dE(FNQYYaPP=\F=H?V<Fg[UYGdYg,0W]Ce?f
_S&R?A=U#^@/@b@F1@_VDO>I[+G_T[]MBQUA7L_H.X,X<5W[D?)8,9IH(J73TH5?
MeL/-J^2^-+NE21+@M:Dg+6XNEfBC:EY:##BVg=BE(1WZXF;UQY<SWJ^,<UG-]?R
eA11/&gCK:eQNBdU3fbfIAVX8<f81IH4@JXG_;g-H#[AWHSRF+#KQ/J^V]S@]BV2
M5#b)[T,MWb<U^:Cd_)SLT)Lc<:SR7FWeTI\7F)@]V^fSIC1^EbdV7c>Vdb5GG=U
eYDf^.3^EASB=2)X#PMOb.ag6G>bP\X=1a:DD?]DcEHfL1Vgg5a5)[Tf=cG?,6JV
Q0,;01N<eO^CA7],b>@Gg&KG5)F_7LEQ2ZfEf-[eNK/;SKN(:RU(bXgIR9>Le#8#
T;[b;)KZZHX25]:d.DWD^.?caG8:G_b[f(a=G9a;A(B;5]U;Z81)=+bSe2</)ISZ
X)6gOMXG)U,&3&2[>:3I>RRd5bF0@RH791[\<V6LH<VFX\D=ZaR9V#\bMdDN6<=b
A7KUB3PHZZK-R2dI[8McB/25F_G2ZQ/,R[4R<06&DUDDG<?PF=@COf1QQ[:M_PZ)
-d5V<.bb)2GdU\a;ADc:]a4W4<dZ,5_Tf9X&-]^\LXY/?I_ESRY:MOeKdfC)+12[
F=>29(HZIC@7V]Y^F8,0@Cc:2B:&2S9=&A8.9@G)>fFg<V_ZBCaB\Z6FQeN2LMPI
]c0<fEL/62FX/T<5:WLN=FATD2L5cW5LT035+KH]bIffH,7<V])5+IT[1;N9NCV@
deF+R(T.ZIV4:RV(Ofb[_MEXDac[V,Z.O^>bWbR:Ag]#(_:31&cY@(MfHEDCFgZ9
BfK]aaWF@6IRe]bPE+/OW7HdSR&dZ^HCQRWZ7[M_HR5P0U_[]FeQB(_;QRgGHRH=
PJ964[EeG^F2RDRR[.6I8_G(ITd25b+75>ADG[HL2J&4LU(E#G4B#Cf==O7MS-P]
85ZG_:4dO1<-E#NG3LF]@1S6fD:&_c:H1WK3MCHCH;788?a#fDB>(f&]GXfaD#8[
M+.8.T_Y:R5MaXadE1+,?LNMY;1;+3O29[ID=;,__D8V4g^3;Nb9<AG3P^D;dE@X
S4W8UC#:5.MYQgPT>cfV3I02<S0Z(gY5Q\4I0Q-;,AX@XH8@8d-]Z5UGWM+J=704
/NKOIMCL.^1T<N1=-^:?b?828.?e=:6:[/1=c9E;PU5J8)Lg-?WJ;<Z&UMR48^Q)
^b]eQ,=b?=;dFdB)/\TBDNb+^L[\LYH>a(_;1\^[OSAEJ,^(3#8)b8O]R4#2T,<K
.8PK[PX?LI0H2Se-_;e@<d&C^MSRF&?W2Y?(^(ID]dHC9QTQYB:&+Vb?4ADKf-@3
R+edID8Q_bc72:6NQU04@a#L]Lac9eOg6US4ePV4\<[T=gH<=(M>Jfa+#dYg84ac
^HGd7+CA<COF?I,>>NfU-^DB.58P<3>OC2PO^F9/IV\D.e(QE1X:c/.D\&J991g5
Q))Kc+V0MQ8D6)O4)](aRA(-\\4CQE3Q#/]6^Y&>eAF324]Fe]fc;]DVcMAfT/N?
)D:6cbeTfLKE;3]K?HLa[[TGUY?fV#f8DFUYN&&:\6fE_32&2B4>:J)+/Ja/FPTR
Z7PU9HCYagCA56Q1VW^OV_VO7YS#:Pg:YFaVfFXOc2NIW&+A]K/_4&d=\c.NR3Y7
J;M1ff8[@Ja@Qa/4_)b+HIN41VL_f+GQ.1gOIdV,44NXW^W8;1@PIE(]E+e[#RBJ
EJbIK;YT/]M=#gT-4dSB2F6)gE:NJcf-D+QM(YL-RfM/ee>L#W,ae[fSRB@2-W1F
cLIa;0Ff+U1T&74GWOUBYU60P9,3;)E6EC7Q]+]_aObecHZX4N.5&2^]X2U5,TfW
T>R/-?eeE(77a60&I6dIEQN-R9C[TNNSHbDFJIHDGOUeUGBLN<f#^X0JW=)6@GM?
48Xd+<);V40cHSWALRHXdG\_QW=3gX/Zf,[\C=G:_330K^NE#-cL7^+fI\:aa@]T
P)8XQQA3IIBN,+L.>PPQ\NQe\d&P3I#e<0K39:3e/(G4@8^..]bH32A(f>K29R4F
4EZ_@3H4>=WO#SCOQC&@V0HODD]@RF9/0]7X4WAacaKN\Ie&60O49OISZJe9_A>9
3e]A=fd^@@101);MVG2Zge0-WEHXVDfN^L,)1Y^aX:?+PLNI?bL>AQ/7@eVc/8HU
Z:+F#34)XHS9/K,3a9/WV,[<0L<C(\f)Hc-c1,:&f?9EUZB1,4eV(cT1CcWLKQO.
#=_Id\F\[b=]UR.JQG9A1SYeDR>g0PF3_c\V+4c-<d.QY.&I1T,;+f,RNN?d_G@>
Z6JTg_b+46.0PA0E\e-/8_PQ0K<e=<,fIb@g8N_RTJ/,1JS5LA9GPaUNQ8SAEZXE
gIII&OabgJ)<V;Gb^-5,]<A6L7-ZBCGCUeIZK.-H:,Jb0TX\F;-FJO(_deaK]=Db
&c7Tee,R43A(-VBL-[A3QIEEI?PNK+]fLf=OEY3-J<aV_gfL&=D@Af(Oe(6Ta/X2
EL16QeHM:DJ:A[KDSE>U[:?O7Ab#Q1XI20,/YG:;,(,g@K\-E]#U0--H&f#=bc<c
@26eHOQ7+R\&)fHY\2D7IgNe8fB?J?H;#6?<g,=:S-_I1HA@HEN32X[gI2Vd)^MJ
WH=41)[];;I<;,GU4A96cbQTd[5[Z&X/QQQ2&,EN&>b)_5D()=&E9gVfWM706DUG
G]<@HYYMJ0K-IcfVZW-JO9C06&_&N/G2G7)CX&_<]0FXIJdaeeJd+XVc0[9+H/5.
A(55AUB1QX7GC)>f1Z#5U>J+3I@e&4A3R@fd](CcWEO?g8T./HSRe8&X@a.S7JHZ
S,1d1S,>T:bW9&bJRcQ2JJ-?0G:H51I0FX,-0_X,?9EU^^.QQU)@eLYOY?=FgI<(
S\9beaSc8Y8B,ZKU_3MUEUP[=-_-_EA)/)=K2__H6XH,4,P<7J>U,G[Y26LA4+#b
9]^QJ0KQ1\65C2,8M)\a0(c<b>gd3.E1NbeLHafXI]@:.NfFd#AFB?O+6TE.+R(U
+aF@D-<E8N#1/[+DGZMUP>+CT+52_bE<FP(E-0<Q:=VCER(I4[AIDC(^9&^-:N);
,=4M8LcZ3;S&e=b?RUT?dF\PaGLf+I=/:KP,Vgc[?.eJOD#&GL0T/)1?gJI[4=Fb
GcM^C6#53;bGX6:K^5QWFK(BDV))S\^X)_YPPBUO;2TZ\ANQ>Z6,WM1INS,-@_&f
)H>24]V4N[DVZ5+7S3eEfd2CaBY5-Ib02_&G3X/YD#(Y2SNJ?L5;];5)030P[Dg?
WE\?PdXQ+RZ]g:0P@LdU?9B2S;+R,YDZR,:2e49IA19L5+Z:C[D&IFRd=D:T71LO
E(]bQ6>JcF=L#ES5KRc&_Ta:]ONCf)KJ85CJK4RLC0b>U+K35L_<5,Kb=e^A(DI^
8?D^Ce2,XOM>_Ma&0JReZ81T<VC-X.-TQ@RZ^c<I2:YZINQ;L:#LbeOFa+V?d2Cd
768B(^+(-T\WS=c79c<Yc/;@?#9aT]7>gVZ/M6)NE7g[&YJRX8O?:T:=aOge]??;
AB0M7.AXO7LdAU/QI0?QWNWgL<UK;:C#BQ5RF@JE=@R09&[].RXgGd+?@JS[OGaR
1I#L?g1<g,+fAJ.EF4YXJQBFEA[I)bDL4W-80F=TAd<.7gPJ=1/]TQX8PQ2W2)Na
ccJ5IB6Dg.NV=Y#86NB?3->S:(7ON;=?R1([8X5Pf3a54Id//FQfaEQggZf5E?,6
N<\McKb5c)g=CD[66e62]V8A19\[O)==L]2KE5Ag.7)eSb<>QE4MS<?WHZH+@V;K
H3DND=6CL/+dCT-VQ&fM87M#Dd7I/BPab#36eMJ+&YUF=0J[McU1@gET/ac)YddR
C6<P>6-07CKHZ7(I45<1(O8751)2O70&HI04J3#AU.3c=TC\=c;26P-<I,?M;RZN
>H]/@:=UFINRBdR,fgF=f(&]D>59=ZS560C,KFDd9f:V5.)PSU_;>&d,c9<\.gR,
NC#1G?1<V+3;.2&;]71eGdXc>.;cBYACSO02,fX2c=&0(BTGF:+UMceVJ]EgYJfH
D3E;U8[XL=5KV5XV(W2b;,<GY,;@#)\;XE;^S^SX]V3#(I5:W>C<6;G@aS)Y2S8K
[F0[?d^<+V02W6TX8T8[dW^eL32MO4:aX:PJ;EQ8^5\F4.C7Ag3La#OWcE6[YIIZ
)OIf93WO03-ALB6RBc_V,YF.;->/H^MM9SeLE5dgX/FTGI5cN-A^LeFHQcY/KeF+
A:>\RV^f;\5QIIc(IW:.I/V^WPZGc@g:G\KA=;YDOD+@077\Oe7RD.\]E>LH=P#[
/O75afQ0d&SBLH:f,YSDdAaWC8]PfLHJ=]Sc(.8A+&HUE6;<J(=@,cWfQ7b]3+5+
Z^a3=?JA;2[ER(&UBWTU0\f9Oe+PJ3MZAO=BBg=LYD[COHb33SL\A7bT:daT@)-+
3NO6SY)1(6CT4;3^4(<b8O,DI^YMK;C-f[-g[1&PBcW:;+S><.C[,.TRc-=;WL#(
3XA.#a1L^HSY7c&c0[^0JZ9Y.M4Y(3F@e]dM_c-=LT:T9)#?6P)<.\]/?UcM?=LI
+eD4TS0=]#,g<:e[ACYJ;/Y._M(F>&fDPL88W]U]66R4a-J_;^bGa\Gec<Z<E5+c
cK8MR++E;WP>&/Q#BSWcCDM4XQc/T:RYN/Z,6N=CJ#B<fQ^Q8)Y&IO:Cd.J(CA,]
KBcA&A<-US:+R#YTBZ(R2+;7DW5=bR_G]J7MGYT<\UM@6_7(eINK>>F3OJ2J36\)
G/)(68XE#f5H(RG:WTSGTXZVM5/D^A#A9;.Rd<<e@-Y:NZ?&gRJ:EQTf[ggU6#MN
&&bKCQ:-c<5Bf/MXfDZ1?VDA;,Cac5eK064U>Q.AEaL7>N6bbJ&dB-C[(cQ).+VK
[f+HW#e46HI#]?2/45SaDV?[]4W_LP(Q5WG_Y+#+S>B,:X8V\1UMJG[AKO?M.7:P
Dag)1A+>6M=RC;b8PBc2V#/#CXVHg\L#IHBPYW>9^a:F;6QZU-dVYH(:&66c(Y:-
NG(fA-&AC3GU]AWcWFEfRGe9Y,>NT+5>];2EID5(NL..Q5;c6RI.N-381YG[.IU<
_f8J)eYeM1FYg[^ILDJ#I[P_(\D?)&PJV@PS3U4M_E)S/b/Q[V,V6,=IU<QU+&bg
K)]9/X84DSMD<8;;U+/V5a9JF74N?WV))cE\b(eWUA@T.P\CB5DY6Ud<)J3Vg-E\
V_5/.5AbEWVWb(663OU(<MRe].\RI8W;]L?=Ic81Rb5?DN3bK/dg_W&ET?eZQ/gd
V0F6@<]D+,T2:9=+)PQHDX9NJ7[DI.&\+SS7f[>>R4\.C_C?-:Z[eAHK:S#TDU>^
aAW;R[K/dU,AO?LAL,?^[H+[GO>RFU^[_e@>ES+bNW=+W[N2P6TG2FYFOeT7_O(e
YW-8X^3b=#[;6+#Y,><FCIR7J7?4G6MKW.Y^R70XVI_><A7Vf5;\Rg-g:E8=D^d+
IMO6<&ZH@QA1(BC_)T@H-BL/?W#bD^V0DFK2-MWC?G^J&P&X4#<R3DM4O0A89+Q)
Ob/a5OW.:ZP2Vb#3aQbH6XY9_HHdWUcTaBMN2=+:dfFK.I?&0T+gG.SHe=EOA[WE
H-9(?3][PFDbU-Z51f?HE5LgfBfXLWc,C.H+9]KA]@@I[]2+-NA,RgK=GE5NQPfG
>1=-YE0=E+KJ\cACQHbW3WG_M^\,L;FH1(]gUfBL)US&IE2g[MW,.6^=]H+0a.75
ZWfefg.SDY<<3BQ_?6V1Q>bc[XX1\ReU4)+fFC.3PB;EMUI4,2RE=Ze+P_-CPE[@
H>g7bEIA:(._#T]QBY[0=S&=8@AO^6OS=C;=dKPJbPdbZ4<WE,BY5bM=90O3Rdc.
B3SO39TbUG0OK/E5,#Rc2/LJeUN^;M\R\g5g8O_&ef-X.S41ReG?1JHXE?:/8A@Q
H=4.5?]3C8Y;JI[#5@PW4CY2(aXJ<JSS5GRJVMQgBGeL7NS?2Kd+5/[L94OT(A=P
4#IJe(L#5QTK+[GGbQ;JT@8^6C>NAPA[GP]1QYVLHWf=P0EG-:I48bZ-;1Se2[dg
RU=ML#GY&_bH]9CV=EEF+5&XHgb4Hd+,A8XFCa.PB_6af=_CU9)1DbdNQgV+fg87
J<1cVJY8&F;HEF<R[X#L@5MSY=c:DMD3]G)J]a0Y:PH::)N([VbJ1@S2K\(0Q&e;
K=/^gIcJ>/Ue)^R/f96<J)=2]>X=TWaa6-XJ]aD;_bfSeO@53I5:;40X,+PHd/7A
X<HOfH2^Y]9+A8+O2CWdBV70^e\L/IY,7cR3Q2+HJ-55QDOg^#Hb0:KPB^cfIfZ1
Y?#+XXZ&aJW377UQJN5.=)E:aRg&M4&]R?Z9N?4E,#+Ld[+7:JNaLMZgRF1CX5[>
3;T?\MF0C42T#DD_TgM&5\gMB#PfJg,.@R7W#3&;_10Fbe,[a\#.7RM&Ad1QD&0E
FUPd8B-2/=)Z4P(,3+1@6SJc7;6cVM[@U^J<1Qbad\=P6Ig)@G6@[F1\dUW_]U>-
a6OH&Z4SgR&=SeNZK:SOA0X/[+cbA/dY]8=bMZNY[IS<fS];=L,9QB@ON.SA+Q);
>f9<HG5/64aZ]&X;d#DH1f7+1G^Y&>?_f&MS@=QPA=;\XA\Hg44Pb<d+,]HQg2\=
-Cg3:L1=^);d,+7;bdA[08ULYTA]P,]J&2_\H3#..E^RRO>T<+@1S8K02K97+U[/
WK2X8X;,WU.0>>TPICDbM\@/a.-B?UTK.XWPW3CW]IC)e0cS5GVbM4/N8>7b;L(S
O/PB.X4be)C:2f,C]FH=+R8\WCZ@R+g?BDC1/V[&@><U#]QbD:(-(T])(-&(Zfe>
(MERC7.1H/a#J<).)ZPH7g3484JJNY?BI-LF&9IMc8GJWD\-X<TU?JHHg//F8ROG
3))SS]#c#TX,Y+<Y=;2RW/QQOe/T>TdbB>#,f2OW]TS-FXg9A.J7dPN[0\cUaW(<
fPM2NTMXAbI-fE2/MKUbM^>2+HCMEQ,&O)Y@;AcB#M,VS&=+H[KX@?MaH<;?c=5X
b]\+E.0?<,/)69/LH@@_EI_<3++#e,L]eHJfSIVTMaHWC8>\b5DSPeH#J6H;;>W+
&PSQ<)gYcd44c9#CGQ?HOaJ#)3R=(IWW5QgA:_[.WYN09)7^fCX2C0B2(R<JbZJP
?V0d>E5YY_D.]J;X?]Ka<4fC)MU-PZBDX:>W.a.8KGA:Se[3+.eCP.6AFD]>R]g-
c)+9INK=^9GL-LDWI^._bMg]1?=f)C[cd1?gCAM-bAQAYCWJ^HAX&Ne3QeRJJD0S
;&LBY;J&8LMC3TRb1?P&0Q/LgIWGY9#Hf[=Cdc;WB>/T/GG&+E2EE)09d)P@LJJL
R4T32T;910)XLg@S6R5LO698a,cB=@43SLBY8abY?H?ZXVL-A/8_e_/D&]d@,IQe
<d9\0/2;35=QSd3cV]aWdY6K:#&N=&5B?f8C;?16G?b2d=JQMJfA94GKD#YDYA&V
[B5bTO:ca;D/=TAVS<FIM<:[8E;<U,)M5WV)N[5,gV(O]W5^aZD,^)eEZAf.N)F7
)_0.I>G5U4E6dH.AEJ1E1fge[#JKT5_C./]N/I^:1H_+_LN2EgG^2&CDNY3>30#e
IMN<WWLI4#]CBb;5c(7O4J,2NRT?OZCT>#]5E.Q[g;):f=K;Of0C6O<[:+U@UTW?
LBH0gYLaLZ@Ube>]CIS+>3+N3\Ba:W\#^J\Y(D_<BVPbGKfK[f8e+BJ@/3#P40)C
QSU0^NM[Q3O4A81P132N:>&)O_bc&E0g=2@N@OAb^c5&:FZ--53XP#=Q-0=egbfU
<DJ8LDVGO+?(3(#\C>GfTPJ7d?.L+@>3Ra_P#6&(?I?.f7A7VA[NUd:&I]a:+M?A
f:0(C61+a#Z@9Q9L+&e0e4KUX&QJBKELZ\7OO;G?C.EZBR)dHX_IgaCfJY^BOXLa
N.60eg0X:@:LNS=E&8NeIc2ZG<4(C-E990487ZXC[M[I3Pc&Tb,]8+F9)VXM;JaU
5Y=NS=@4Ye)O@/I)SO>H;VaN>6f9a/;R4_;:V0Q\(N:SQKT<YcDMQT@=W8,WBM;Q
3HG/Cd^O6&F[V[AGgaH<f^3RD0P\-PgA@/>\PZHSa-f#C+0Pc6^5J92NF9A:/CX)
g[YGgYFII)UNP1GWL97A+A[?9D34=^)MZA)9J3]A(a(f3M9M70=FB2.Q3/W\/X+6
4RKPcPB7X&HUI(d-Q4U:W8U;DXH;ca,2,&[7?C\D)AYZS;AK78=_JR(1R\_(QP6N
WMEZO1L#JO:Z<-;I\@:Gc?LZIcH6WdDCePRA7&=&#=;AXYKG_I]EE7#dAS_Y0Vf(
K@&e,\cZZ/\V8#bW8_YDgBV_O\]#6#3gEU_I:@&1@GbD<+ZZATSaH?UU)DK@3d9e
I2@)64H/b8DN\DEKL4J,6BN(0L?>Ya53Pdc&gPg13?R-VQF)^SMMC0#A/+G8=1C?
W3bB0.EV:W-M0CUV/2E0<K?/\WK_#4QGF>^,_H?+HFb3A38+S>>Y>DRL6O^GZ?YP
CK1(IU]3W)._:c9J(3@E[0PR01JMdJR#Ua6dP_7^,VNT93./_<+=7#e,-;(CBd1]
/Ea^b9UFIE5V(CgO+C,bR&dIf^C_V/J<6K_a>F]I[gRFXX/3>aFQ;76eA@:,]F//
[373D1I(,OL+;Nd\TcVS/<=1_>_T72XKSGS&&7QF8#g=?NBc1+?(G^0K-A0Ab?<[
3C769#6;SBHA=&N]H-<NU?+>HWUGMcN&Wg9FdfE:.+YL@QdC@W-DJ\?Idee>IGC4
BI2^[]937W.fS(D?-AP5XTf\cF7<)144MO&1e:APE1Qd7a&NN8@MDVUZc3E:4Q#X
;IRCZAeH:_>.(L?-D)<(Y+7b)cBf)^G9RT(_@?0]P#PT,6RY2:gGCZ)e^G]f2g0a
:Ge\0<a9N1=W9X/Bc7<?3X+Icg9b7TNCc+c(@)C]c<Kf,E3Z&_g]d([gD.6.Vd^(
Q2#S22c:FdR>5]1O-.E2ENC8dJ3FQ-gCQ_>KWK<C:gU&aY4A:(AeC2ZH\+F#.7D&
5GR(QgCJ#E)W621DcR_Y-_5/J1bc@P8;+?-g:Vb?f#GSH=T2#NT,NZKG^:49UF<9
-f?26TA-bBLBLKJFEcF[S4E<KU-g3?^@HfXJX?BCc,YJM5.f,6VOd=;eZ]]581Q-
.&6gXO2f74/2E<M0aQ6c#Mf<&\Z=gLU;\a817bfG?>2cU3-?b89]M^d_I,I[Q#Z[
K.??3eS3AAJVCD7GA6^7)FJ;+XQJ[C6b[1+US(5XZ_e93;PTfR:\VT0fR[FKTOec
Td39c+X]BGA#]ZB2GNO)S]N)FAYR\aXc?82:17PG(>RK1#AgUM^J<G9Mf4WI#^PV
X@NA3c/4\<^fXRCFK1\B[XO>dWNQP6-+e?=:W<4FPbZ3K3\,B:.Ff6JM-(DPANC7
CKD-^1<&U)XLB_?U+PR9G-8g_0J8E4TJ093W8VP?M-]VgQI\L94P8W0NDF-],c>N
P\7f@IKg<AW3T03Z=bd#GgB0Z\f:WKW1\:BQ[H.<aJ@d[Xde\_1X1aS38Q^LaO_c
AYG1LWXG/KFBDQRgfKL@&Z+R\6RR3BD^B#ECNE&)_DdXNO+2:.Z_/CMMDBd4]b7[
,(Y+Be_\d4]4ZW?=G&_@:0Q51(C&I+ddLYJE1?R10&[-VaPNOP0J/8O(#3CgIPIA
UJ/6fEKFX\2#QP6YfYJ@bZ?PXP?EbHbE=b,4R(GZ0Y_)DZ#d7<+0:Z4d0+KEO(<O
&HgKQS/E:3P&>#0CS3EO:Za3J.S>fZUA1K]L;]JQH9VM6(#EAWRG1U:C]/d:b[-7
G:2c4R=cR13RW()TZ9d=S#X&8[WPd<@E>E_B+RDCK?<@I0^9-c3/63X]Od#]T/bg
Y_.UBMUK.Q9?N_NCA>;CZA_^g4/4@X@PZ7@cBf,6&C]-7Sc2XE3cWK\.6g^[/+\Y
>IR=YPH[Z0-_?7c2Y<8b2#W^PP,2<-YbUN1b<KYTVFKI:-G(G>0QKGTg[&0]43_1
?^c(=0=F8U^NK==4g1V<?e<a0.KbD(LDNY<&?YaAc38:)87<VMe8^&&NUU4Sf/9&
+/U>&F0N0?g2UGLef5Q(CW:4K^.MOCAa.]8P:Q9D4&fL&JP6V=P6M2GGB0a3F2_S
KJL9e\Q;X?:-X.5HL(4e35^7NE2(e+@>SOX#KgKIRN=93JLHQ6fWLF;e49>K>,gD
W>:,P<8>20fd7S-91ZNZLPQ=1,@LdA12HX+^Bc-B@R&<V2D4KS&SdaL=0ILJQA?[
M(S1]3L3aC0QPMeATEUQe5#DSB<)UPM)80b)EfAf(,.)TQ->@]##X4AV/eS,df,N
A]NaJ+4MC+I<cB:SIYG:cW64(:>OO-d;5IP8MDbTea<6/L?Qdc],)aCGU;NgSQ+K
[<,P,81bBTD?;fHD3)]F3(D9WA1BC/ObADXDR?B7GSW_a0S(Q/T6R2Y08HTdMR2M
PTf]JHWR(4@gP7Mae.EO_D9;#D/++QI&\85WZT9S2UP^>?\@XU@I+/g_9Oc&cEPJ
Q)YRH9&C^E(Md=WMRU3eHaY-AICFMa?M&]K#?K).UHVI+S:O\V4+e.42<Rd\=\@a
2&YM/:-23>P0[<HPA,7VBOP#8K1cPP;H:D+B9I49)^e93)[[f?3_YI(44CD39UX_
B]ObI^W=g<V9=<+OS997,ERJeB6;88YO>#@KCDB4e[aLBU0=67=SVSN+a8NfAbTE
3>G>L\X@W>MK@<]?2>YK/3c-ARWL.aF1LSNdCN9V9B8:Xd.NDXRIf4;?MB).3V\9
(Q4<SBV4<dD4<=0B/_GRL]aA,)VcIgT&J7e11<(VIM<FdPY0]3Z.U0>Tda1SZ&9U
?TK7Q:9+#a1XM@YGHT-&9FAWVRg)HQaT#@d&?,QE_b/1C2Q_RXGE(X13C].I^7W:
;-DZOG564GBH][/LNL[7C/90=P025SH/IeeNLD>5-^N?K/Qf91a04;BeEgJ8])WC
Bf69gPS3bJ_S#PWXc-CKB5FT:Cb>DFX[C(gKM^W/=0ML\KJ3O#8-^e=F43T(@0Wd
fZ:[4Bdg4cUf^-BSX[4)/+2d+E3.WgdP4=58b^F2#TM79#@=0\9T]@bPP)F\DWV2
35QLQ):T3;b+?)HMcT5M7YacHcF_4<(-g2g[&&3]Z)I7dY;PMaPfUO)[2;[</MLg
6H:g[;^GUL55SS\\CE[cC[fG[3K)-6b)Dg/NeDS;]aJ4<d+NHN#87V5;L<4ccW2T
IUM5KIPeffOXW)6L^Qc0TIOfK]Q@[3UM=P[d<J3Z;Yd371\1>>/&Ad(f_GHZ-KN:
PH46_CH9GYG2HXR^;A>b(L7=-BY=Zf(X<_O/([6LL/?/.#=Gd0[7dPa#314.f<&X
?+WGO2UeWcf:,0X?;39C+G?gQW-/O5<_+ad?WYZK7&RP#1FC8cV<-_G:YR>2Mc)?
Y6R)<;DQ,C?>cX?0ZSLI0<>])L\NS7Na1R+:dBcbHZ^bdI(PeDB6[(E@(Sb5V_Ug
6J:-MDD[Pc:A;\b2;UNRR_cgURK3_Sb>#c4D]69g4<WA)Q\GH10U7YGXC3@(e=3+
a_/aR8OUU:Mc(<,(Fe1>M8FYXBJgaD8:dT:gbGg2dbA@&9]d)g(7MW]8Ecb.<AV,
Nb]T8[0;M0?T90,Dg@ceBNf&94b<_5);gDGg<PZB0I&B\6G?PHg7R=,<?1d@,..[
<&)NcETD[V\Tad@F\ZZTV1B4N+c(>U?S+5X5RRY8#HI=g?b3d<H<6eYc\&,e8H39
=L1UgWUI.Bc-4R(=>F6XBYBLJ;b>Q]E#ZHKc#][ZeYg8J>RZ?4dc5/5PRB;R@;dP
dWROY<:c7H)Y.(1&?aA3T>V>,&]_BF(5a?L7,PY[6UeQ:;@H;DGXb/?#N]+\WNVW
M0#:XTE2^.1QV+FQ+MTdC4T(^6Y/);_K[NW.C0Rf2Ea#:dJX.&J<2=/,W[&86L1[
HKY#+R1dNX]C8RZ.WSFa3g0PD\Na3c^ff-fB9d)+?CGEdM\?(^@;&K^;CMEEJY(9
ce&H;U+UcdL)YH0Mg>AQ_+FFD0DG>]8GC7PW2_ND@_;L]EXMb\+Zf\c:)00]MN;\
@V=7GcS4IB0?Lb:/[22A^Q?<Q<@N[(Og&>c/HdbAYU4B]R6SC0-BT_/GU(W0C@#R
.FX^LHZ7O+M?)Zc<B9UJ7F/542)3A<6Qf\McDYe^W7JG,4WeGDbZ/fHN]<JWf/SV
7FO2EAG-HBNgRZ.\7fI5[e709S06Q1AJRP0dV.a@]=P)R&L:-D4H#F>F<US5?5]7
D.Xdabb/[U)cUB]#0K5[Bb0<T0ScLWSFJMU,H-=EW);RZ+B(GZM&g&;cS/#f+gM\
I1-@0RNTdT2c5YIW7-Y/^--\CQ^BWD[-3=&JEG.@E+>FJ=9->ca<;53=4^c,_P)A
(OgdS<X(792fL^L:(T))V8aFUTCSR0e9P+RPeZ=JZ5cf(GP3Q]/EKDUGD=TcTV[H
I=)ZKV0DQ)b<dCSFFc3Q^;dBQ4_C<=8L[c/Vac5_8ZRb[=HLE4M^03;<@2Gf7a2S
+Xbe>R@:+;A1fSRgf&F__f/N@(AMJHU^adRY(86P;7ON?Jd>S//9A/F&LH&(_<FH
(3VYC4c>=9(dd<=)VLe5(cY:a?]b8XG^0H^dI\:KUJD]0E&K399f_BD<(PT>S4a(
O?5S\CLAG?fY^.>WJf^,f(Fga[6I8X,c3,9ZI_C-/;8[eQG+Y_T(aYXTBUI(:0LL
]&CZ-c[S7+IFEPWEDU#==OP_O^E9TgSa5]8L,[Bge>TGaN?:\fR)eLPABQ@-Taf=
W@@RU9ab>N@^fCX8&E:6PaO]-Lf=;NV0I5G@/V<-<)^QNa19c4\+V+@BM+Kc8YA-
0V>O1f3KR8c5cOKQ??T<5KVT[O#M9BNK=3,cLE8Z0KTG#8)-HR?B1?P^9S:BHfBc
0cEF[^\472U<\f..^\Y3(bbRH.+>02QRQ9=D=RZH.)H5-:RPf42a_d]RCEIO_>4g
=&]]WU&130W]KUQBR3B=?ZODC1fD?:)fY7.GQ]E;S,1DC/c&5>M1^U[a@-N<76T(
83e<e[+^0);]SH^;H>W5B47@9O[dgQ9N#A/A#B]F63cO]gN9ff-JX:&TS<DFJVe0
/,E9^&XP6dTO/MT.e.,#+X9^d?I1C@&=RN)I#G7@bg7P15XHT?(35&=[P@0GPD;>
:\XKZACTRa61]ISFaIHR9cTY[Ec7baZe9WgY)f>,cT0>Y\cc-<2<5O)4dI<Dd>1?
M:OA+S3]U?8,&5bC-HX7WXAaG]V.=5M4B/7>5/\gVGD9]9S;;F[>>9E.f7ZYIUR(
<K9I^d.\e/7A(N/<0b_Og0_G&FQN?SW\a?4++M8F.1G.8,bBG(Y/]f@:MLZWJ#.J
_X_4L>.dScSL[O2fS&Lg4f_[JLRTY.\b^+f\?1X>HA&W#<@YAV.)SP_EXJSQ&^3P
MY1\+_B+)/gI:KGS#P4A1g[O<=3&[0I_4XGeg/\_HC9<TJf;?=[UN5^.Y&IK#<e.
e9N<>CKHAf)T,cJUU[LD3,ZY#HIf&G6a_.0ffPN+g5<4\;SAC#g@b09FK;4<_W)V
..-XN#:_FPFfE\\VY>UX+OD(g7>^_)EV^&)a>@ZAAKP#O_/V1/MCRMZYb&0=+Y3A
X:^JO#ZYN,8ccITQOd7gB2&U+Yfb0P[3@J;/FL26Acb+Y13#=fH\eCKdU>bLD4FZ
KU^3.1.3e:S\3&:bYL^SA)g52NR0U&<0EOFedcA6GEHNQ,Ud=BKfE&MEa]2BRcad
6HX]W2]AABS\:BgDLcI1IJc/_UI#T);<ND.8IK76]?-8b:(8TgUNa7@P7=2K3^D_
MH>PKT(K33f^3;(IED0E=6@9#\WJAW90IE_eE?T^]NCFOgW>+X7A.@FNV822&6E1
6Tded#&=GWPNEY@#JMX.(VWT0(83ZZaH0_Vc4T6BAUO/BbF[B,JBYSVA9^B[fDZ[
MEY[Z-SaFB[>1?Zb+2PggA]1XcC\@JDE+^D.4<L^aJ,6(PDEVaV5e6[R[(<C;5D3
M(4I6-8XN4APBH-9<V]Q(KWQ5Nd,)/7fJP)^DdKGY&0+OTdff#W>_R0dDCIgVf52
fJ,QV?1cS67:8b7A]gY#[V_K58V)E0Y)&N:7N8DV;Q@X[UPa][QNH)6#)W0V_U2>
K;>_CDXY8)FEaXRdT\2Db4115EC&((M[GO@_LEP:QZ[C?0e=[FEIbSO>F(a?,>BE
^-gW6ABSaD]86?>D?)gg/c[7W7E7WSO=J(cJ:.)+T+9Lcf+A2RbX/N(ZP-+KAXOG
[cY\8P9C(eN,Yf&d3L3H&f,G_Kg:g/+YB+JFORJ/W)g--PU_4;;62[+6dLP:fR#A
_&(6^DXHdKZCdM,[&P--J0XS&&#?4OLTOIC-<_.,W[O68PL[?fDC(RU72/=:ZUK3
V[[,(],T+1S=g763>e=\a6OF]4^e\U_0QK30T/\CI.c?H7V>SJ7/4W::^?2\7?C]
,I)MV,IUL9R+#BF4eRG7HeI)&D^X>Ld3DXCFSb<48YG6CY290:G+8X31]_:O1BSS
2E&#+_;.:OX(ZLLG+R.A1G6c<P0+URP0-?9a^(7CC])M9JS4gF=A&II0R1PbgO0Q
b=\OFScg76Q9CES=@aP?>fT6Z5?,RXH<<T9069VabP9Q]TH^-=HUO:2PPb/<F--H
QWd\7XX6QeLT)=0,6MKY6/Y<JFb1>[Q+=e@e,S?UK9?YgS25de:OK@\K(UR(;-Z-
@&)8#c<Ba6b@Z;N_Yb/&YO>cf&bXBR&0C_g7)F;D]9bM3OH)\9H>GFWGbP+<J1aW
(_=2^:\JB,;97:LOE8OfAdORDPZaWY1Ydc?WGP#M[>Y#CKBdAEC0S=93.Y,#6-NO
K<JD&]JC92+5-2S(U6#T84_LFeIL4[99,A7&MbL1HC>SIcQ_N7S]b4]E5?PcJ0/1
($
`endprotected


`endif // GUARD_SVT_SPI_SERVICE_SV

