
`ifndef GUARD_SVT_SPI_AGENT_CONFIGURATION_SV
`define GUARD_SVT_SPI_AGENT_CONFIGURATION_SV 

`include "svt_spi_defines.svi"

`ifdef SVT_VMM_TECHNOLOGY
`define SVT_SPI_AGENT_CONFIGURATION_TYPE svt_spi_group_configuration
`else
`define SVT_SPI_AGENT_CONFIGURATION_TYPE svt_spi_agent_configuration
`endif

typedef class svt_spi_system_configuration;

// =============================================================================
/**
 * This class contains details about the spi `SVT_SPI_AGENT_CONFIGURATION_TYPE configuration.
 */
class `SVT_SPI_AGENT_CONFIGURATION_TYPE extends svt_spi_configuration;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Bit indicating whether the VIP is to be used in Active or Passive mode */
  bit is_active = 1'b1;

  /** Bit indicating whether an Active VIP should include monitor capabilities */
  bit enable_monitor = 1;

  /** SPI enable_txrx_chk bit enables protocol checking*/
  bit enable_txrx_chk = 1'b1;

  /** SPI enable_txrx_cov bit enables functional coverage */
  bit enable_txrx_cov = 1'b0;

  /** SPI enable_checks_cov bit enables coverage for protocol checking */
  bit enable_checks_cov = 1'b0;

  /** SPI enable_txrx_xml_gen bit enables xml generation for annotating functional coverage */
  bit enable_txrx_xml_gen = 1'b0;

  /**
  * Determines in which format the file should write the transaction data.
  * A value 0 indicates FSDBXML format.
  */
  svt_xml_writer::format_type_enum pa_format_type = svt_xml_writer::FSDB;

  /** SPI enable_exceptions bit */
  bit enable_exceptions = 1'b0;

  /** SPI enable_txrx_reporting int, indicating operation enable and depth. */
  int enable_txrx_reporting = 0;

  /** SPI enable_txrx_tracing int, indicating operation enable and depth. */
  int enable_txrx_tracing = 0;
  
  /**
   * This field is effective when #enable_txrx_cov is enabled for SPI Flash mode. <br/>
   * It is used to select supported flash part numbers whose coverage object shall be created.<br/>
   * Coverage bins of loaded part number will be populated in a particular simulation. <br/>
   * Simulation run with different part numbers selected can be accumulated to check the verification completeness. <br/>
   * For example : <br/>
   * enable_spi_flash_catalog_coverage["N25Q_1Gb_3V_65nm"] = 1, creates the Coverage
   * object for N25Q_1Gb_3V_65nm device. <br/>
   * Similarly coverage can be enabled/disabled for multiple supported part numbers. <br/>
   * Please refer to catalog for list of supported part numbers. <br/>
   * If a SOC supports Two part numbers lets say N25Q_1Gb_3V_65nm & N25Q_512Mb_3V_65nm. <br/>
   * We must enable this array for two supported part numbers. <br/>
   * Simulation run with diffent part number can be merged for verification closure. <br/>
   * If this array is empty then by default coveage object for only selected part <br/>
   * number will be created when #enable_txrx_cov is enabled.
   */ 
  bit enable_spi_flash_catalog_coverage[string];
  
  /**
   * Reference to the system configuration object.
   */
  svt_spi_system_configuration sys_cfg;

  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------

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
  `svt_vmm_data_new(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the configuration.
   */
  extern function new(string name = `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_SPI_AGENT_CONFIGURATION_TYPE));
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
    `svt_field_aa_int_string(enable_spi_flash_catalog_coverage, `SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_NOPACK)
    `svt_field_object(sys_cfg,`SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_NOPACK|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
   
  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type `SVT_SPI_AGENT_CONFIGURATION_TYPE.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(`SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);

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
   * Does a basic validation of this configuration object.
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
  extern virtual function bit encode_prop_val( string prop_name,
                                               string prop_val_string,
                                               ref bit [1023:0] prop_val,
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
  extern virtual function bit decode_prop_val( string prop_name,
                                               bit [1023:0] prop_val,
                                               ref string prop_val_string,
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

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * This method returns the maximum packer bytes value required by SPI. This is
   * checked against `SVT_XVM(MAX_PACKER_BYTES) to make sure the specified setting is
   * sufficient for SPI.
   */
  extern virtual function int get_packer_max_bytes_required();
`endif
  /**
   * Assigns SPI interface to this configuration.
   *
   * @param vif Interface for the SPI agent. 
   */
  extern function void set_spi_if(svt_spi_vif vif);

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
  `vmm_class_factory(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
,K>a9V0bc5_S_#a)LGU.dZ&g;G]DOJ>+#<+6C>#^,12;E2]#R9PU&)&<X8I)9>;+
Se9:-JTUN,\<]3_DTd\(5XfAFeOd_2)P,6a[P^/;d(5AS.3&KWZB@Q(,,RaUB=9A
f6WT&9gTR=73OTJ5EIAQ+Fbd-C62O(^_Je<fA#f3DH6CFQ0V(C1O=#Bf5S/K[Gcb
/UE.cD.]D,#R7GfHQ2^]VZ_N=gB/4KOF52Z;&<f6B[>gQ(UC^cV@aLYQ3C&E/?5_
,UG\Pe(-;<G.GQfLb]0]G<\93a);g@9K)P>D584-45.9S07e\C830U_d=HNP[PbX
]dPAU00J6/)48\[#O,92YC5A+:T[=QV5,M2@Y=0D/OUg-R(8YI-.5d2EfA?C2;]^
NQW>?[Ac<N^T+(Z<]K?#^#SK0\FN)OYF(/X;82XJNX^>?=.aFAe^LK26OVHR_S_^
NLK^9]KDL#@9>IMK\KfX+bOA(=R([=?HIZ_\__W_XO9A)TV^34CV+[#69()>KG?Y
H:_R8dJ7(SN.+bO5)#I,+2fXL]9N:8db0:8aL_0A-:=3VfQ[g#9_F7FAL>6faHD#
5/X,aS03\D;.-$
`endprotected


//vcs_vip_protect
`protected
f9+Y2W,aGW09B)e2O^-T(YDfEY(0O381+HIQ/I^d=KP]+.S7[=BP4(UNQ+KS\V</
PSX4Bg_Ggd&<AgS\[KK4b_G;:^@_@WIKd+49V\[Z60C)UY&,F;QAI\Fg9gFZ]LQg
M_\1VFH#\ZDU2A+9^6MgH>EU0M6-(3SZHW:aQ\Q26#(OI/:/HIMY>Y9Z;(V?=\YY
4SG9/+4BG_6GA<_W0D_8JB_7fX-1E5=O[5-;BBZIH#V_-B[ebF(/:23]\N@::YQF
B7PRd799bOMQVaD]/0[=BAgPBZe9Bb[Mdf#[W_-Pb<dJ(_X?EZd7^QG/4@68<]a<
_R1HbMHHUfOW=E?2:806][>0VV(cWKHRbQ.HD:d@@[?_P.;5YJX0+T<5;d0MgF3e
SUHTd9J8:_3>9OQXPSRLV(.]BWJ.5=;D+F?8@d94\^1#.W(@+[IHS5]_RMVE8g;6
3LNF:1g6SX@a7W/L.GEOENAU4?#4I37KFG6(L?.>0bd48_J?LUDS)d@McYKJ,e\B
@0d@RKI+<fOI7N3)-a[\YGDJG>a4Q>@;=[+<dC2F^/O]\eBV<ZN=.ORZCb95K/3=
XcFFF)+AI6c,4RX]RI96I=IeL5@RN_4L4F[(C.NQbVM>K/\S5bQ:L,B8?DdPZ-X5
<>g90^2K8aYJO)0&;&@Z0NB#AH_=OLH_N4BadTMFTe-W2&GT[GM6R_Q+[-[gHe_;
@.<M.NfV=b9DVO<D91d@9AO_3gT2<0A?2#48Q7Ld.S))d+2V8b3J:@P<CcdQ&.<7
@cPbCE6>2aW^GGWX\+LY_3XOW.73X41LNg6T6P;164f]De5(F2U;H;7>b^RgYCY+
X&LP9Vd>9]+KNP/NH[[BH]_19TO.67bfe_@+IFJ>dbcYRGDa>e[>cUU9)Y5f+gMb
W=fPMf2_Ud.ZXXVA7^(#7DRULI/4^Z.+O[bIC]^;1#JQV<Z9<_=?([RF/-6;M-(E
CRWVDI;-54?H>:3VTEY78b[C#H2c@IIe#>9DeRTP;4N,SYS#8D7a:O;Z[b59_\I_
b7CbG6KJeXH52]:R?:H._\fg^3P;U07g01QDQ#^,?N+3YL+16>6aIgg(cW?8fS=\
VD>[:<+bI]g[:0YeJ(MKO=b[G[;KFE.4X3QE2e=]=0AD^:[F@DF^(UO^RG]CM-C2
]M&eX#[<3J8J,:C[X<LBE>DUf(cVaDbbJ4645Bf4P#YHVb\1dT;4dY@I)aB4<5RT
)3^:>(Pf[J9=I6U+a7.Ag)c<WF<&<\X4M\5_fW-bW-8PP1W?HPFZg4WQ-&TCG8H,
f,5L/bO;_560c01?O-#a<d(^CGbZ<^47:E4B_G4ESa=]+.#@EED=IUTMDST:+1H-
ZN#(.W]IRf/XT[RD]TLXWY3BMScP-8_V^(H-&=@2I1H2&IT4P)H94ef;3IWSMd><
GU+#,C2GM?&G?D;=552C^KRJ;Gf]8K-WfTa+>B,0aXSX77NM2c\C+IZG197NOLR_
V:eJ7Y=.[0aCC,<?3?S\>-&5J;>JG_@<N/TFK,fSVK4E(L1E&DO9?^2MPERUC]_N
1U2=H2]9?,QQ;aF2HQ]DQZAIIa^]@BY6H+O845(59=+@?V:D1G.Gg>Y@]QOa@29M
Z0T?=f0ged6X^0eQFK&2+bJb:J:4NU,dM(g92bNaaa2/P.2U5YSW<XUG_]AE/;Qc
6?RV6^0XbcX2?9UXWAb0117T#9G9,V2P-074EA]Q.7=U=2/8X=A6Z2^3a7>?)0.U
,680YC@0AMET0AOc,-KA/7dTTZXea<<+??D45SR;IZ5-6W_L8&5:AAe,+<VfD\IG
4:=F[V>P,H9_ScaXCV3IO@Wa^\)Z9VCJ^2g<#.GQ[BWIK?gAE82&:1FRIdDR3YY_
Q&6Fd:g_9dT;IfIbNZXM7)Zg:#-P+X8]g;I&]g#]fT(gTYF_P0DX><<9\NJSOa>=
+6O1H@_8?+C-\)1??9K3^HOKVYR^O1\&>:IN98K]^,G2aVd@(TXL4-a>@=eGOQ](
J.=HaO[,9V3+(_01Z^/V4gdXIX&\XJT2FNS7/F=WT;IedNgeIB7a.5]Z)_59FP04
7?&\K#]++^L9PXY60L\7[e2H>=B(b)I>K4;UbbTG;\17&Sb3&L1c.O_[fK#.JgKb
?_Ge5F;0<U?A2<f?D08)A-P<42^5]Pd8Y\KSa+N]Pe(a8BS^?&0SBG4JY[P3MADN
de]c-BK\<P>>U>gJ(545[f1RA+)BP+Vd7H<G:E\dPZYgDY0EXWGaK=ZWed_a>^)/
MIN&1YYEg^PaAS<N4O0:]PUN?-ce-LgC:fI>[RbW.(0NY_WZdVCZP,H9QcXI+/+)
G6?2,OEW-Qf5@:?9DACA=-dR5-K=/b=(4RS3UJLDP>M8PP=2XTH&;Q^N1\SMC=-Z
(Ta1_HLgHO/eWdU=#@,C#E,VI3UY6OWKG(UU[V:K0<<M9eFBBT?#G05M3;^M_TaE
bZ7-[LRHYTOg-AO(J6E(_B?\XDRYd<,88YB[&MLQF,>@:+>gF/)3CaZZ=&,^[^8?
4a0IJ9Y7;9I<6IUQ_T^BgB)0ceY]_1VNVO:_[.&HVBBDUHM13,?]Z:1PMVM5cZ0W
L>>O_C<gW9)0Z-0H.7>OV@Ldb94&T0dU,(D@2Y-._Pd&D:ALc]>Y_]_07C=6Q>f/
YMe7eaZ@#?D5f>YD5W:4?W_;66)BDI94\-)YG=_.H5ND5d;;(1AfUfKTIC3>2QJO
cO8@Z57.(K;,2DS4DbAeXBOcB+H2^;S^SC0C:3JOUVY_&2JF&35a)>1@Z1?FZ#P^
EbTUIFbW\:;bc17.fXB^;\ANS^(<V^Yb).QBFc)WJ:06a/&34\CWV+)UD3ddgTX-
eDbe32.\G</1bS+FZ-ASJBX1:eOB1>PN83G0JUCa9CHV9Y<?T_JB3Wd#e]Gc&G+Q
TagL46fXNaESUM4g#JQcA:44G[)2?d6V7#+LF[:L.cRQ?=/X)H-D1eYARRScXEP,
WHc##YS+8=J/+C6d8<73V_0Y]F:ag8YB<HCcgfVX.3ZJcI(-Ed94TTQ>C@+?ZcB)
<I=UV:27-,\S=#;9T<,H,DR8MB@3_KJ#.7G\?^gBJB;(EINA4dEX^Cc&UORR3IWY
_GZL&KU=_,YaX+ee0UODZ(,dBFNSOT-dO@cB,LTUJ^:&0+d@(;D=UF3O(0^\,^2V
<DP/b6/8=Z]@:/J9\32a<:aaDMA,b])23&[dMdSa94<]WNM)E&Z0-V5&MS/FNGbB
?F\&]_BGg96<.Wc8E\>KG;b+A^5_(T3DKf<J:aHBc?GUNE>9c+/WVEMLdD=86J0T
1Ta>X-6348IHM;.3E<VX]&AL^Z.S;@N<S_]X&-Z:Wb4#+DGRCV(G(NANJZ/c\bTM
a7cd9OSEK.-+eYOA\)]K3TLaONJ/J0?B\RA:8]@-2^:UF,TVZeXF2J,1L?#)+^b+
4O(b1gf2SaH\aXXRZJ_S-bI-PKXN7H,:;;C,PQB?49UW<+<7G<O^L?7GR/+Ze;=I
0@3Sbe+,NAFE@U,[+)B[Q6TU]MRWDaP&)[&dbYGW<>gfX[ebZ@]]-8W.b^Z.[Q84
>fCBBdP]FQ9cb@F7Z2[)TKK(HFQ8K>HU=A+W>^Qb@8P):2JS2JL:\T&[3VcY4Q+K
+>+[g_1P]f]T/F2;)M3FK323SGV3CPBTgHVN/KFH/-/A1e/SS[)1KPB_I#ZREf55
a=T;&EP441Xd.8Y]6W/>=\Yc8?WSU_cdY<?F=G?I8PM1Maa.BT7I=dV0UaT)4F2+
?:MR\]\@.+T9dVOMdTdPDF[9?X6#KcQJ5dF1TfJdR;P04X@gKA(V_6^:)(VF,E<D
\+KOKc;Z(bQJ9]INT=RQW\H^O=BMYCU^b])4Z2(CTV0ZGT^W18dM&;U1-3,K2a>M
1NdQ0g8I()[(e4^b]Tc(&5<O?_Z9J@?E7TW(OHQbaL+,-NDM2N]]0)ZfLFL.,E3d
]g)]9\d:7C[XRH28#Z]:B7OeQ4M5gSR+S>):D3]<>FUF;.#R1a(?PTS->0)J]T<<
,6K4RD+-.5.-Uf;]UV/G)UXI,,B;QR+I)/da+)H-L(WS+SA.FMMM+\[695Q7Sg:4
H3F6^,J(^]-8eE9P5\BK2WGBDf:cM2:#D)dEW\QG\a#<)C[QVPe,U[e@DALE_;06
E_d]+.^\#[+Tf]Ub0\g/5\aHSQ4S)g(Ebd13f6P8F]@aHUT5+0Ef&ce=c>D2I.7?
14]6QTM?c.Ea_XJ_UMIM)e)[^E>)Z]A4J^G>NV)]c1[QPbB.1^A]&6fK9gO.X,6g
@USCPN[^]9#G(9@TE.?67#_Jb5J]\f?M+ZfL;c:[a=C23N4N]SBN[X(efFQ,H#5&
&MXTHFZPc/Z&N_f./DM,M<NdbaVPX;YE]@&SIP/I;dF;cNL2Bg6g3g[Z^,(a\)CO
(W)278V;)\M2HL8HO,0ZIJ)(aWAgTb)HbZe[#K0IT7R<7A/dJ4-2U9^@<,-OQ:T^
dRV9X(6aJYa6dB/eA#bA/4U>Bf_/XH7?>+6/U-\f.HESN=/6\#:O4FXG,aF0D^16
,aZD[9XH>]^7/]\a\SFSgOTZB@]b,Zg8RQeLCT/@&SIb;29.4(MI6N=D#DGBLC2+
G\R6S+W([Q7]@+//BGV)/,2F/QY:Mc&ZfT(Kb.N)8(Ra.T\0b#A0_.S=JY)NDL-9
<B/G6fU,#;JF4g;=)1<@)@?Yg^Z&7=P,Bb[^&A^EXB&X\[HOYA6fKf==]/1KLH<8
JFY15SVSB_d/dFKO6[JE[VHR/,LHDET=DVACc]#;KBA(4b-)e\=;LH#;L9C,1][I
RWVHXN-886U#:7MLO7X.5D<VV0=>79IXL29/9^#&5Y.4NFI#&ZgIFY)>-C)b#cZ:
[aG))NYWbJ=I5QQ>JB2BQV<CcUc>beMQQ;]GE7^&1[V8<f[-gg7I=2TBJPe]XO1T
@#N=2<+dJ<&(\:8-b.C&=VMMV\@IRN6XGcQ:L<3/\BH:.E]>(a0E<8g@L1XP^bfg
0,g_DEUcR=^^d#Pe;Q.GGH)GB?I+C+Xg1U2;(UX1KE)F1M0bLUDKOea:ga40g0A/
M)E)b5I@4FC]H=_B0aM^<A20V,VW<(7?#(9@JT=UH8OFFA@XfJcWPAE-ZAI=UM5V
G4KWQBG7F(Nc&_S=+PW)ZG?7g>C9a?&TL^OGDU^685\7D2][Y3cJ^:E(4^8&#LD)
b,WQ?fK^Kc=(e):f&OTd&\g6?X=XFWFTA@]D4?F(BHS7d33CAJ=;Y/UJ53O:8C0d
1B:SZb)6;Z_2=K>XLQHC97KFY-DMLCU>=U<JP,d+P+2?41?dF/P\)2JBFCGVdG:-
3X+6Q0;.W3>^U70_LH9]H/&)8^,;35_=)3E&a[VDfSA8P-<DfZXNAP\Q@@<W1/+9
=W=##MgWY#-J-M;VfL,-4&_N[K_XaP+MNAa8FPI)#2@eIK+YK?\Ad=6/19)G:_MQ
\&KV5Z4b>;.I:AQTK5+@1E?N1f<((aU;c--[eU^F2E9cU6B+62BC/^B[M?&)75D9
NHN<)XDe]E7-fJEXf@TfFZab.f\)gHaHQ1&=BcZR?W,,=3SS>^KQ+)M+[[^;C7WK
+\e0.<W2Q(D8/A52SWH(b&gYVWEIR2:;F,2YbR,+^(67;PHKS6H;[ELK\6b>^/1J
M.\N:FWX:7L-)M-6446T62fB3e,6,N593[_#);.]N5SWgG.)[?#.1V]+;4\ZCS&7
Xa1(];0&>/55Hb_A7YAK.UI0K?-_aB)9+[T)O5FK1]gFNMGQDHH]/->EWU9PSFT6
5W.d?.Pc3>/F4gbG0CSfY\Y62GeceAYdZQW7g=B7f985[IMb<&(C=7Z6Q^T,.,L8
c6[=VCGTeL4]R1&[KV_BY)8-=^WYJI4]g24OW43TJNPK\04RcWGVNJaV26D[+9)(
QM\AEX:P)VO@V/JBd>Z&fGNU+PQ^D]MJOK\PfGbX8B^OC#G@T_R76V^eDcNQ;UN[
6\BLU3K_9Y8[,(E7&DFLaeS@:.eVQ[BE4:.?T>FRZf<U8P+6-]337NRX&WMH:?7+
_6E[CVXa@+8a.:6#CCKL^#KTP3M?J+9ML\@Xb].7:&LaO9NBPDQ-AUbgP\MaC.&)
WdFfRN><Z]dfU2E6?RgNS_dX[B0;Z&&T5U#dcCLL2J6gaQ6)fdU=IR1WbAB&B8EU
;DGcEJM#&NNgaYB?:8&d_ZUd+SE@QFL887#[aKS\_.\LS-,/=D\7IO7eL:XVd5#[
d;^ZJZ_IY_WI2>?Q(K-V_aWFM:L1&-g/O)LABM1<\5PH2=J,J^CMV?LQG0]O,1N\
#^+aT&d)b,8WAe:1VZ?];UO=b935e;GXN[HHD;GO08b&&K3eCYQ:EP0e9D:IBMBa
.F=IbH=dg-G-K7WdX++3D8Ke#6OdA8cg:-fY]e^.GRQNIBD+V0C#[D7^?G8F_PCB
3JVQ#)5Q/V5LVU]L^9__F<\7c4PTfge+F:WL_L6-WN&CbeSH1M;KGFMX=PK4)YPT
Gb^c?T7&6D=Q+G,5a<TPU?:\<VM68E^ZW);I:4,+V;X[c09OE8@@B7259H;;cW1J
N>P;0SeA(C5M3d98]a3CT>;DH_2bZA4.JT_SfR570A,/#dGaV:<]5@1NX=A^:]UR
5\XRZN\G.O07AK0],=bdP4f/YX?=DdT;-g/A70:RN9dd.;R6<bbM@dI[9O.?&]fQ
(J.5[FEV?>5T-f,14f8/Y,6OC:3=OP7@A0XA4d?AA;CLNeN[CbD6Xeag)+.N.&]c
\3.Q/Sa@1fG^g^LV#fE98-,P5Gd^YF0R:26KB0ggZcI102#@OS:1YgKF_+);CZ[&
.2M#262LU#Og&4PgR@+77A1DH?)I1DK/VGI^RXPG5#]6=Zb=?:Z#=R.][QdR;+=M
XI08F/OGe7PDR[1_<4\Ie?.=N]2e&2=e(KdK4d^aR:Z9VA1Z4X.-QSC#;+-T3O(R
+8\T8#J],>>dX,6-^92R(H+cd>):9#gEN^dIg4^R:8gBa:5?0<+FWJ.3Z0HYa;#L
Q/JL3<c\93D(E6>fXAH8ZQ:9;Ja9R;5TVD.=7/gY/NFXBZTNFaHGY6EKc6SNU\OO
I^_Q(>[Z>[<NQO>:Z^4LGR_@2]5,cW7<f=^;6=VT16X.#ef43b5Kg4TS0Z=[?Z#E
f:CWK8\XMf#=Q>9Z4NPc(9c55LQNV&;?YMR.8=8]4A,V.:)2X^g-I3,]_1J2(W,2
6<eJ_3-_L<1_/@bLK7fgFJ3-9?Ab<,Y3=e0)_8e[].><Y4f]GdMJ:N,K;dJPL.I6
^7><F?:(1J?/X5?(A\eR=<+d7&,dL)J\G]L0@HcBKd[E[RLG3SFS5Y8)HMS7J5?2
Ce-EK/&<fN&L3:738ea4QEfFgA3f+<Q>Wc#VeWRKV&D4/0)eJ_(YA5VS/:9Y7eJ:
J=4/gR8X^2Zc?B7ZS]PK28=L9-V](EEG6a#9SbdUUF_RFIe_>0JVU\[8T&6F5S;/
6e.g5WVdBbO=MT5;C95&+@==EWR75HMB_MF?)>QSfQ@TI2+^?bGOWV@?SZ[GWXV<
#3aXZ[>K#Q/R<H2?,1==GO[&J\EI^>9,=cV,;IZZ_Z/L,Hfab[IbAA=KA/^OdIW+
>ZF:(AW/>WSHJWDJcd2V[[D6J<R3N-6KP4>D::V<g-Z4LJ>PUU#f<M#ZAbE\=T4J
NU@/I-1UTY=/:46e9QeE?GKYeV;.DR^51V0OC8bfc5ILX37>RFP5=FNIec]e-dD3
V-fXN:;cIK4fASaQ]>NP&KW<48X=9EaEOKLPA\(?K=6BbU57_)bdaTZR.(W#ZF/<
KR(&HFCf3aY)\.JaB.b6=D-d[XRd2:[YB5I;VFW\I=LGAa4\88^]+Q4U;A6&CIB?
eH5>3;TF?If3Ba-)+U;c).C\AYbN,YJ0\YJV[@<R,_O-2<1dO3gNf/e+7.2I+7,<
Y3EF(P<Q2-CLKV3KZ.<fA=&GAH=c2EBWCFKg0(3a>3<M56M&X4g1/A:)Q^<_Y2Y9
;PS6M8ZcD_XC\.8_?;\&+:O)_@e30Ec//_[&JD[)(?)[4I.I[+d;R</1,9PLROg0
AQ9BM)1?8abQT:K>ZVT>?.VfffYEN&>C-XDQBDeJ(MD@F;?IP8Tef?X[dP8;C(RS
HS4A2daK/gVg\_AM,&Ha7+g\4LV8[VLP,)I30CY_eK2997QgFWOg(J#NMR+Z>Qe@
CMFd#+W-]_N6:F_PJ^],73\+,-K?AV)?H[4Q1[FYb4@PDG?fEG[UMdN&#5d&):;X
F,Y49LKbP0-M(,X>bf3>A&a()UcEeO=AYZd7)E8Q<Ld&K=?8ZS)\4[(Z[Bb(aUf6
FSabO,H7_IfdTIB5<19=Cg&d0f?^7JIS3MdT9=f8Bb8dCLZ@IeVI/P67H[2K&YL4
>E/SE2[Y;QZ31BV\+\,]4GA#[B-4NI<Z4c/#PW/K^.I9QAED<03@5B+(A&8-C2+E
6D1)Aae3WfL?_5B@Q5T5&]O=;K]>1,WeL<QE&XL,>eYP<W9DHE4EgXO7QIOHZdX&
Hb/d6<Z)ZDW2Y^5Qa<IcbY;#LI8Q)3GQBQUeLM-DS^D6P+@(OcX9I]SQ=19a=]FE
^HJeJ^P-+/&Q)<Z]NG]]GZe=VBJc.W5\ea:F0NU#TA@>,5..1Q2=f9I#c#3&1XBZ
<N9;d,;I-8-V9;a\6:eT7dV@^]3]=EYSC?ZX^J0A>BMK+NTP#fd6Z1A>4(:bGMR5
(GEG@0,#f+4#U#(7;L,,7AGLCbLe.a8&#<&NG3Q+aPBc:7^M3Ea2LXBUC,1-.],A
O]\>d:8UM.PQQNNgDM1;#][NZ)cDV,?/S1\T79-6W\GMFfO=<fS7.[:+4fQRYRRE
g_QQ5VT2132]B>M:DQUTO3cEC(4LK,I-(Ga=5\AJCGY=Y5+,aCG)d6(.)U708gXF
^9b+g5>:MNSAVeA5QV[3=g1@fXN#b]LgF5^[.8M5J>PUJ>gO+\4G-LIH^fG-TI_-
O<1;#>=)RFC<?&YT,OQZX=c)/R:W6HcE6c1=<_VZ;RQ)VV:Dd4g+f.RY<fIUK(]I
UQ/eA.e1,\^TR_Ca[+SU(_:G;Y:DBa[549XZY9RW]4BS=eIN8S[X55/U1_3Pd\g^
;JU&aS1bPL(4P87+=9Q641gIF6250IY<fR4PM-Q]dYY7&4AR4UO:&<DY2&)E+GD_
+IC>=YPD6]+.AP[[?2eWG)N=5;K<#0B)Y.S_^<g,X;0@Pe0N3?K:KXOO<;/]>VQg
f0]cLO(H\Bb)f@3A>I9c2<--6-3CKP[\0E>BRg6[g:c&If2]UCdH)g@)/5[3Ha;]
J:=?7^X[8>c84=YH=300JRC:#]Ig[[#(6a4T@+&2#=edbWdc4[2U-Y4b,Z:]+6++
Y.+N:L0N<+41J3FWH0VW5;J@e4RHc_S+.L0EVI-f:#:/aL8;P[)H_)?3Sg4APQB?
e#<X\QCHA3^MCF.c.?A(>_IO?DWbg>JXEaGS]D_+4?<W=;VU=QGH3DW+^aTUZ(;Z
Me2+YN(2+Q(JNE]LA@dP_fEP)5030E^fRNQ&MD.7G>Gc>L?_6[J#UA#?M[<d(aHV
U>\4WW4W_UYX?BI/ST?T8-?]cZCdHYO)SWa(MYQJ]_9g1cB=EW9VcQU41EA\54Qb
<_?L6:-.[.1LVHKQ4:;c9LcZG-;eC_X??:B0]-0?X-O=1M\1Od>cX8^BQ;a2,c/A
3P0#^2G&PD>YF3B\1+7b.XE\SOE2<:?J@A3=#2Y0#8YLZaXbf@CPS96WOUB8Z0Ta
YbWK+#K68#HeLTA)K&#AL/#0MDG[Ac>O]Y1cD\972.C_2XU_B0Ja4W,P<YQ>H7g^
2DeDD>_?YSaSUbVb(dRd(9gfZE>]C6dK7NMM&dgO1]Xg)YSAD(:[g<GD/;TI2>:/
bBg-fT<68=QQ7@MNXUV9.MP\JAbFb\\-;<+6O,1_8b?fBKQ?MZYeXaZdG6A->9g0
.L-FPK(4&HNHZ2RE]W/#_6&<J7d5TdF1:=(-Nf-gd\,>[\^PeXBF,<WF#AMD6e=-
f:3=EZ5\O<,RO2SN6QAUfMb7\Wa:KLdBJ0Z7R(?@GRcg,W#02.Pf><R?(X_.=N@d
fSXFYQbLdAU.Y\B6,D2QfBYT(+B6Xb0R8a#D?DMS0]0]Q5/\EXbPV94-+LYNWdPL
<\MW5I5J<g.EN4bKI0fCNO+^TC\C]O#I7U&^E&P@PAc8cC@2//bDL^.KS39Yc^#<
RC\Vg<43U0+CQD=1).]ERAdJH9=@Be0<81O\H;5g@Y4V+UY&<AX;#W<+3cfHc.5:
CLO7F+\#8LD5DA?(0eZM-X]-.=/=<3E2AW:U,)[JG:)NX8Nc=+7-</Vf1V5BO?F.
AfX75==gbB+aa&2eS7ZIG4FBd<XP(<AI+/(#H9-@U<YQD#YE=]WOCbf3MTe+;3:D
K.M=)VWeKa&R;\>dc[TfF,YZWYJd6X:GG>;,MWS[\NP5\8W836aIE>D8O/79FUK3
9_8&];_?e4)\TeL&J,+#7-((OHFNP[A7[:&Y=I,?.Z/LU.N_\=)_7WKOeIU5NeSA
D08M7M3\2X##fC]]Q7C74gSb>]RUJb<O]=P?\ACFXH?Q/4I0[9D+_aFM]#>==GQI
J+[7C>XP?CJF\#CcU_Kf:19M)Sd\02bQQ=HF^&I9:D61^##g#;Ua(8QLfL/[aJg4
3&&g6>F)0MHVV0aEER/cb\6+ZOYADIfVgIZ_[,gdg8WgC(9]SX=P+OWX&=)#(D01
\NS;A&PG[d594JE2B1M(8gTe:2>1ZD.;fA3DW?+A2E;/)L-bDC;@IFLc8ZM[H>K-
-B,L-Bg#DEXa,EX+G,R1CDCMF<Ke4_->WUcOI32<:<3N(J+=R_IfZ3+RK7-:A?<[
<5J?8S4L(01;GY@L/TX9.58d:L_/49bD_IK#35(>CW?_N1LPG9D<C_dNMd#FOFW&
Z0S(8K4P@gEUR>(&]H-Q5GY,Ob<AO(RY4-ATK+M+9V9>S:bO(-8gN2E-\TbST/)1
](0L\EGJg@2GD_L&N9A4VB;CH@;;YDC3W36T9GY_S=FN1[e.\6G(]8=UeF@:aeWM
MN<T?VOZ[>MU\NHNd.SD]S6g]g@(MT2CV^6d^,DG:/SEH-,T;:&;H\S=6#;d#ebT
6\G,Y=.,D=WDK_>dL_8&b#cMD3GW]fL-N@AKPUg]cOcP&#:@-&+UC@.\XS2R^8OO
E;5=I0b5Q9S5<Y\T6P>.[QX<b;,K^,XB[-^4C[-bR0##+ZFWQKeS>I1/9c7@)>]D
_.7KdA/ECc/)TW/W1^0P3d6GJYTcV,dU;CJ?&<RJXJfDZ2U9F,cX]TWXX);-)Ze=
4V,NCc+RX0.M9OJ#JQ2_b#;]W2S-E>9Rf^R]J=9VQ3XOQAT:/_=.QB,bH4,I<a5=
3;01&73]80^(9PT6G5TP4C@)GIVab0AK(FAgb7(<DU^M;27S@M@Mf7S^,FaGf\;G
+7]P6DC>U<V]N/g]E+NR)<T)UNc;YGQ_?e)2A:],YU.7dbTVd1HNL16200R@R]NL
@d]9OQ7+VV2Y(LJ,f&_VVggK4#]F#8Q=)KB=.O2VA]J#&.7)2,#3?4;1)>3@_&E\
+U,CC?1=bIUQ5SN?J)=aR]1V<Maf1C?:#fD.3-#:<NIY_G0_9BSIB</<0/EZ@-[)
/4&];F+01/eRI:EB3K]9N4d/NZa-F=d_VUR1L)&De+DO+9=LTIM1JD,:.].C=;O@
ea_TM#TMN=O:b?F2YXf,^]D<dJ4PYGKOKU1;\VD40b>M^8-#0DZ0,fD0-daV#=2c
7CBeC8b.OVHALR8D[)+:@9Kf2eb0_eI+@LYWEDg^:K^&R7[9HSIaT#,FIY;Q<19,
=H/NO1T7>AFTX^,=f;6VI?.+g10WgUWTI47A0I_R0\2DL>S(,,C[85)CaOM/&M[S
U9Xd[_D;8I^/?4OBJ.\@LSS1gJ:<FVVK&5STGa>Q_\V6G\^U0JW&=ca\@#^:13&b
7)@AW?9>N_\-d&MG#5O&8>gN]:C.98MC66(AP9U/))Va?4;,@118dFZC+1R&LMY8
NG56.H?VA<?KLDd8WCQ,ceZD0G8]9Ne&2.gPdd=K-Cd91b]VSe^[;A5URT?9eB#L
Pd]0JBRa/g([^R>.M=M:MUN++F(\W-V6&847EJY,c&WBN0_NP/<(/JK+4-bW@P@7
_R6S=OKeR.4X=/W:O_N0:IaE<^FV2a@^IM=P[f_&e>1=U8>cP-?aSd_#FWb@.R2A
gRDT;BC[YF<3?Bac4:)DG\^;HOMQfI@cd2.#^;.bgPV2+g26O&6MedS+Rf7N.5HC
b[-Me,\O>FbNQ(L+5@-^(EN7^gHWA,USOD)7))4>6DH+b9?KI9/c;aJJP&BOgP^9
d#C;.(4_>L[[P&Tab2ML>)Cc<aO0L0?EK)Ib/9[XEHZ^7H,6e)Af5K/BX>2c(\VT
ZA&8JM7:.1)d^cCY_;4B]4;gKYcF2O3aHYOgEY&4##_(P,-9BV&\[U4>+KAdgGc&
IbE[TY=(,4FRR)d###N<:CbN=g])I=+e]ZY(F;-^DW,eS.8J77.9R<SHWUA;0Lb9
FLD+(fC5PKb9(];X:9E4S&E<W(THSa\2GF8^BTSYf3,(c>NV23a33/O67eDV=V(V
0#)M4gDV\>)3WcRXKH=S<646)bVNTZc.#GSC.a3<F9;ddIL/,VM):Md8c-5G]+,&
gK&@:dEIP?7#D<@@.&=5Q84-,fQ=1>9NGc#?()g<<>Kdb1=#WV>6?AP\YCea9+A+
PCZABD5,8Q/6G@Y.2:gM4CB2IP>SJ8G3?MY<SL9&A3D]EN2d21BB.4Rc#V3L:,V<
IFT2KXfX-DSKSdQ_@?_]=Z6G4V=WS9=>V3K?5CG3a&Z?,?[WN>93+\DbZ<\=R:2g
]NIC)YC?gJ1(QH>G+8/)YR&)O-Lb^;K7Q_@2G:>=?T4T19\dA-),O/S>QG6Y_/DE
Z(aLd6YZ?fE:NX,,&8O?@EFPNf.G?18\0?43L[SBW-<_@]GNV;H2aQI35A286[Q[
;\+Y1Hd4SAO,A>N<8-D\I):)Z;C>#MbbX-CeA^;,-MH[F4,#2b-DS@WS1F@OTS-S
FARDWQ7&TaeaC\9:\EF96:@A^P\8WZFDYU?J+[7V?e[>DHeM^XVU.\-gCCbg2f>b
N=7;4P]CD2EM\(-JL-TPb)-Q0e>e/[ea-0S#V_S])L6:5[U@?Q/T=(-X(/(HP#Kd
7[_^2^\8=MZXY-f-M?f2aNAP\U;]]RL8,b]QP[E=X9W(^N,Ef/dZRa>b+dV]0cf<
[?P)A\HQ^K(P)Cf@?,,Ed(Y#d)E)STRgYgD@36cRdKEP2F8#8X<H-eGJ;URPTFTE
g(fL92>&-UK/T8C+,)V[/_aLJ]9I;.aMIGI_&>ASe/TTT+PK##.6J^S^=Aec1<dP
PPH=EL/41WaEd<bSET=790Zd3F#0T1Za5Q:23R.)\JfZ&@.KH=UeK.Y2<U7DC[#I
5FKO&3YVdSbCeH:D_.R+G)I\],XaN9>S,f^Y^U5-J^fTbdWaSQQD+?.YOSO.9:9<
Yc4@S(b-?ZK^\JB+f<IWf/Cg^)a\&DNZ,X4&7=FC;Pe>J:WG_J#G-PVIMc@^[X^]
[[gD;)S-Gb^c(1]S1J0J-J7N_g++&PJAA&<?OY.:35;,#.OJa1Z]VO9J_K#4YC&R
]b^cab:0\0C/KEW)Y0_<N<,c)(?G(I=4cP/O7.H2&)XEFCO67cSO=76_Z5<Kg.e(
TGX@]dJgH[:M9g<L?8GR?,,bJ++=C<B;&P\V<R<CgIRJ:RE=[WfI0<B(\5Xe+EA,
e4ESf5O6aZ40\D,d[B5Q_(_0dF/TYF0^Me+3DY7^Df.&#RFFNRYaB5gV4US/&:>e
0gf?V[NES:D&>BL-#GG+>f2@Bc9J4c2>8F7G)+e]9]^ZZSB]IFY\ZR6CYCOE?-8:
1XXPc&b2YJ4aK^fKO<bG)^.f[-\=CeB(aVM6/6/Y#SW:-58F9X1KdeS&NgfDEEg#
7Y@_2QKPc]JJ:Zd_(KC;ccEIQ[V2/ZJ0A_[?VXS8H>?D>)(V4LKW(IAC4ddL7S?6
<_Of[4gZY#=2N_:X6Zd(PNN1_1YZE\-_ee_gC115J&W2-WT-:_9eN:^/?I#?[Y6^
F?d963C2Pe^ARe.LR,N>VSBB,.TU:T)0JK-1f7cg;Z4@B(P(T.NfDS<U2+[]IS?F
b#7H3XDCO.?Tg=Y>4c-=?b\-eX27T?&Ca&5]b#-47VH5W)W4#GZ&2:^,fOgTZH?b
2FZe?DCRS8&NCf=.\/E?[,2K>^.BZ/G2DMe01A&OW,HbSFX(#11+GUSF[NVE37TS
1]AQR&[ADGM:RD#U=DcQ\PQ)gc/4I.e1Y#Yg2B[BH-gJ8<FK)R&:SHH&@T62AR#S
R.Q5W.Ua(C\QK@4IP(,@7>eG36Y]/EbG)bFY2^=>+dR+0J]AObO6H2CaGJ.&.OFg
0DE6VYR9b<TXb;Z7H+6W96^=C;HTZSZO(NJKFZF:19O0Vd,R5EeA95;TJ_5GL#e-
g9EebN[&]IYFZ9?Z.G<gW^9O;O[1FF//SdKKTe?^SNSe0@.a=0,5SE8=E[6UMQgM
+c=D5BW->+?e4:C7.>OS]9?EDT7BOfgYTIL&&Z/D[.32f<+@O)LW35)SVA0#f#.B
1O/d>-=B8QJ]#-7T_L&L1dA#EN7)a?-V-OSTTFH,d#Ub7X><301F:NAYDF(Y2M_^
=a_.:.[]8E726:Dg_gBUY.056ZIS,V7/OT:4)F]BV5XSdW[,7^aDKDdZKD-CXEeZ
&b7_?dJg62\7><b](.-N=2gJUL/&C..GGf/2C-Z_@ac0g&Df&]U6f7@8=;K[2dd_
e7A-TR067S;Y9SdHG9E6O^?V1,@G(JXTe+>ELTfYbIXOMJY(Q;)&Z95cee_[OH6C
<3@=fH+A:-(B&,?T8TC68;R).)Ra(FXS2@W)47J7WD6=PX@H;#H@e?d8,RICYSA.
@8.ga#SWKBF^>Zd-5e]/2==P;a.fG/.[K#6;AXHQ=>-fZ;+^9#09ESD/d3DQ8\;3
3JOC9Y723B#KM(9])99#&2U1g&ZeHHN14Z2GbRO?WVL#8=O_]NO]18IPLE(fH37K
K(5g,cR<?D7VH;IT[\:KD]db@&(-_^KCJE+Q,?OFHO->X7H,>E)^dG]66]60)/fV
Z</T/.RdN/ZR:;:F#d,L8;]=aOJ]>O&ZZ8d17M3aJ(7K5c/eP3Y:@+5R+@H(^6S[
_PB1:ZR&eX,1c[YU?/,HGB&)F>_(-&=JOdS;gcO+D6)dFKQ]M-^6A/I9PfISO<8Y
M?/_ZS0C\]/?1SfBOPCU[c^=KM++,WS<_?BD]&)@B5:854I)R?WcOI+KNbV/DGgb
=IW-D:E4:KO<?EV.X#d\T;):8YQ#c>b:NLabV,)#9:OY\FJ.(UULY[=)A_85S8N@
Lb0M#_0]bIN]\HfL3[+Nf1KF^>WQ^aAO-U2D([:752&b8<;G]Cc<NH3=/MT[F5SH
1bDM,D9D2D:L6GXNHZ7e)]DeV+0V?7a@7K>EGV<(&4G_,b_J+3DD5]g1CccV3K3f
_?7eeV,ZIY+:CegI&GaHA9F2LJX9AG?<^e3<WS.=?Z@2/1:U^gZ;-T64P44B\N&C
U-S=Z#.TBO;&O=.\U?G9#96c<c#;b@[;-;fa@,6TDaE@,>Q\=##8f3Y_BdVC>c&>
1Q7dV8>/8-X=M69>eT),^A<CeBg61I9@[Td6N-)+<01E^.,8EQ;,6IQ0^/P]PFGE
F)SMAIbUC77LKJ/JffGf\K-<JFC9VF-EV9^N\g#PWK6RZ-:+KAC##1g#5\F[3A-/
NI5VgV_)QbXYP;&T&[;]S1>3:#7RS9C2AeB._-U])fYDX<FB0@XR5QC27IV0dMe-
&/9&OC;FMCGLB@76U?>\G]ZO6X5/Lg.Q2V)OD8@Db9Z6VIg=/HUG\^LdM]RTU?HZ
/SLa@;3FMTQcb1dFK-deCY(LDddeWSGF\>/52Z=>da7GE<EN;S7+IJOM:AgZ?+E>
5C4dGNb#P(C<7=dQA[@=EEV/W4W6]VYD0([XDBHP2V/BY+W0RTEgVSf^GXM@+ZGX
eEe/)0eICX.>?SgFY6]0<<IG5dVXFRT4[KQfe_BVBIWLK(A4FbRF=HdI5A<RdLKZ
J(V^(eH]YOW,+==P)NPKeMQ:.76(f-<cc(+A5UeS#D?;8;&U1a7CcYIM/TEf.bPN
RKX<L7acWEG)bAAOH.SY)dV,L&A=A]:f<XTMW8MYL1&>])NN#N=c)g4<C8I.L@(;
&TN9-8AO(<2O/37(?^,X@g-.:<?Ab,\,/\3g=8W8]R7EX-C.QI(-A40(&PJ@V]#Q
RWCbQ=2G/\8VF3,^B,/?JD]&;4Y&-8bMK;Y5_1X6a:f8DXM)/a(/AQB8\dW6-d.V
eXPR-@A^GKZTCU^f3(QBPeMS]MEKcVTgE)BLgO,:-[8U?a?7^#H&75BU6=P11\ZA
Q?GZ)5(#9]/L?XYSZ6Le8=YO)^N-8O(eW[FAN.7fN7<PGC[I5DU/P33(Y37DTL7C
SIGS<&.f@HJcUPQNY:(J@6,NQ9.(H(@_1(g^^:A6[<[cf:RG>WKSA(Vga&FIS=[@
K-\KYA>-W#OY-,(Z\:HK8Z2LRGAW;P?Yd&8M^SR4,Q]GW2F9+7QV_:L9T;<)S1[f
eJY2e:&/U+W:\3,f6,;)@HR+@I&#b/O_T:D7>Nc)89c3fNgZO0RV7J1CP]Pa?F2g
]D;K5P,;I8(cN+[G<ePNV#=/Xd+8L(,gOQWgJPBFH>PEK:E:9OJeFdS9d.c0Y^fY
_+e8+@TAS)>DV-(@d.HA+AWdY8[7dY/_M?R;63&g>,a&T&b@Tb.Y/FCQ1U);LZcM
#-:F_a1fH4RCIKLC.Gb]NTCcX5I-e4&ZIa(<[3V(?>4gg@W]a^:&A@W7=]Zc\::\
E6,OP-]Bg6/Eg;2fC67&XU]bS-dO(b^1/07:>fQ#((-RHAUfQP>gJ&b=O,@\78]8
2G6X?W/QB@;_7eIIU8d<C(GBCfXceg23^PT=)^L0LY4H9KHbG7AKUbHZ+JgO5D=U
fUI,3X^,B2;=b[2?O98+11Pg1A;DG.Sa>_9I2ZL]<R&d?IL]5<R,#I+[(6gMA0=_
0fZ=&XeBHW?:WV:<VBb#Q#-#PGZIM(=EN#&RdA-6\080eO#_N\(U8E[?#EQC21R)
KJGM7D>&K23gGXCR5A^5HK7fE(fR\TG3W[dVV7<3Z5KD?+.-MN&EedM?Ne8J+a(A
AJYG4UT4A3T_.2[++#U.b3)0fEX#],LM<1MbO2\Oc2?X+CT_]N;2HB<I=JHW-g&T
S49P+,<)fB=U^4cd>#IeaMYQQ>WOb_C[04G\0dMED,S]f,@2JLg(,[aF\WCJccL9
T.N-J?b0H()QXeZ?]RG[K\&X&MFGea-)\7EZ\ea5Ie66]N68KR=LKMF=@f\V.Q^J
EO(bI)YgE8PaGC=7YE5=)5T-5K_T=:U;,H.E,5-ca-9RWWXWPH?3MBOLYNMa809C
54KAa0S5[C.Y3dO/&-<EA?CTH.?EB17;V<FI7)WYEA][]F55Na:FYT,\V5Z##.FE
VA?#&U].&3N@5=[T#FMW0,,2.VGfRAN0@1fIT)K3_@b@>@3XJ96(:8XY#U;/0/IB
VC.aM80b]EAVGBJ_1ZQGKTTNAb?IE[&8\,b4SBge>J=X/H4@C,LZK]&5]E;/XH=D
\ICN3=/3=M8OHL8d#RMKIL=&?M)02Ub_dKD-UJMgQ@O)M_>:Z6bF+0=d9QfEd=f6
I]:E?>V\<7<JP4AZ<N:5MNA::90aAAN4edAH;TO.X>C-T1W0X(W5FEVbc;0g:Z:E
7X.]-KfE/WS,?#\/E;TA\^McgB/4B[TB,WDKEH>THBAP+RfKPfLS5_4>R./KOK?7
CS5H=/gE036(25PfK)12L2G7AYL:)<17S7<>Y1GFA)1CRg1<QNDgWFC.@QI[UH:A
:B18ZC_7VV)Hf7+g\B4W;\0DDc-5OTGMRd/J6R7?PH:fNN5LFeRg,YY;cXgYX1+[
4>)?Ag69<PW[^;Y<Y5/-7UJ.X7d-#)(Z(2gK/?[V\KFPJH=C6NYP39^#;b^fP<1G
(DHI?]ef1)DYJJ2>VJ5E:OS&\fg<fL7fD?K7#R&)=/bK6b^GV:0MSQ0S:A7=/=9b
QU+C\/a:XQe#</.A/HG0O&T?/@?#9Fc^U9YL/ZgZJe.(05d]B9^\IZ>gVe#3LM)b
[;N\PJHK6DdQe+([M,.U>d57?+EZ&5d,0<]\8JP2R^YGSQ43^&X=+T3W26-a4.aT
SBXN,cJHA)(EQ2P4,4DB,Ha/6VPX_GBRcce;R6L@)L)?R:Z0PC9&6L\WcI_8?&#;
PRQ3=cW76Td87#JYZQ.M(#D)^;[dEgFTbR<TAZ,R.M1f2cKZ3MQA;@K5YOd_UWAD
?d43cKR.#gAXXV#9Ea-F&]2=@MQHRd^DGMe_.QWHH5XX3&<5)I[Y5VSYA^W?/B4U
SHDcR7XH1eLX)[>?Ue>=1YQ(cg@V1-g<eI;K/92^D_UN=L6<?>[cBfc5\_g8P__a
J0070)8XYGc,/[/0b9CJ&X@2GbbFOMW<J&E<B2HP3664=^bJZeS<GTQJ).L7He9@
\K+#@d<RDP<0:^YAg,XL3S-;Z]_U\TW/H+/M+[P7[Sc6:Ff@T#^VcdB^KZDGBG-6
@90A\\6EKXU[S;c15J/-;O-9\NGH>JTe6A7_Y6N>=GHa0:g?D9B^OO<U0AY?T1UF
XRU#a)N0W8DW.:Q^19=KC0LE6_Z[.Q;3+0H+:4/[I3M,S)=B9gH?XL&M-F)/B;RP
gQEPDUINb1aC6NaF;1&fUHLZ[6D+E#fI59BA&0SST69bN8(=I)&@2]PIJ;+EffHe
X5Dc\eV;WQ;[Q;+e([<IOXcG6^^gNL_)&:4JIe[eFO^KeQ[3aIL(aNAXeHA^V0f]
B>b\E_6I5SKQeC-P?_SQSW;JN#.d:,V[B#3A2<COReG(PPMJ@D>e&QNIVBaM#::P
Q4TX7KUI<fT+,6:95UCcdf3CACB)7:)g9VY>0FSN[982-U3/[>HCfKL492&Wd.64
2M5(FVL0fVHde14F<N0N+]K(,O4(,@P/E2><@Y>RK@0:M=#EC0QPG0aL+QTA(Z;_
(OO))fPBQYCOD:#JfN[38/L]fb_HR8P7cfAQVF&5R_)2NUd5?IRF91WSb[Q.8KF&
A8f<O#^a:);:X9Yb:<bD7IC^3CJ=()\.EU0ffK1K7,&IN(G\8JQ8Q@X/b@J=#@-E
H^K:LDaa7PAN3L(b4L+,--NI>FQ]FP\[JF>O>SBA=Q#G63K+(PU?GHF=#=?OTE8M
F0?E->fd9R.,#<J9?L-9(CC>;W0NWfTJ@J)77QOE[bD:IZ+:7.MG3V#_.TFI)<<Q
7:+(6-;;@R8NT#+S]265gE+?W+DHc4?a<B/:6=cec(\dbXR.0O<:<IQ4b;dc0C3V
0IaWH&=\Sd^gaN5O5COTbcIERgXYO\@A8K:G@9GALQ3:N]F0U;ZJQF86Z13D-6[\
0QKK&E?YaN3Fad-Sg.J.=6I=0dS])<6Ld8C>E(^85<^_b_I++Z_Q-5_IT&aXc[AL
Q#<3U4RKMLOaE0;.I5HdL-K+@@VQI5-@E6J13Tg\H_<>MGHBaV2aMf7I?)2dfGg]
aT7ZK9EJ22G+/UVEGUVCCL2C1@]2.;=[AG#bHOgdWRX#HNbK.Z>0f;Pd^PZ-5G+M
)42Bg^2E&5eEOg^b>d&AYFKM,QJN(;FN\.-/9@2C3(c=+YXJE,]0\\(P-:.dGCU\
R:Yd7#dFK4Q5H6/<^Ge;QM)dGQ>4XH>FCZUbb-3WD-EFS^2Z<KCc>Q?\ED,a,/O\
.cUI.32JQG)]W1gGGB=#>C6<ScC/I9;LKSMKKADBcCGUP59F)L1agB/,]^84^6Se
FLa;gdQ8e?5G(gK=I_AV_c;H<ELK+X2N)(H]\?egEGd6I_Wf6W\2AHXPF>R+8;>R
[(cCgT#5PE-=fa=3R<ecfV/JUV)(a]HHLQ0[feZX\]I7c=N5UU.0IgTF\0=Ie:@Y
g&);b8_A=0gBMV)Q=?Ra-KUU_]]a^]T2<3&_IS4e-@MdeQ&3<O=AW)47MM0)]Xd#
e65:M8]3^Y-NI=a4CZDTK7SPLQD>-0:YE>dH@d9G(6-I.?7=2d-4aIfI(7A:IVM;
NR&8^(U;GOPY6W,AAP.g^_8VNWSX2=cg(+&.CIS:B2bg3U?CVTKS[9O(dbBWPASc
<aA>Ja2DbZSg.0\cdAOeX+)Oa4)0LIC:->]g@)/_Xd61FE2IRZ+a4O.=D3++U#P0
&5CVJQ(V47#13-AEcHH69bNd^0g)93S<)-C4-XOcC;)UF9;V9aV<eb/9EL?-5OFa
,R//S?I\PM@U)1-IJVPRQXPe&_-T.fBZO]1K^befg5J:&_(03]7+^@E>&LR8/38;
f=^#<#YeeXe6#KGQ)?bP>f=7U2QUdTcFGSP@dOP:+5ZRK9c)GTBX3_L=We_/Va17
CZTSY]](:dGg[BS<REFCM1;_ILXZM)(&PeII6I?023NVa<^?)M>Cf::(A69V\1G,
eWT7c[KLXG<B&S4-5R07(3B+RF)>M5.BLO2=CBAVXd/0DO8/.8:<b6BE]BcF:;AF
8ZJb+bbRAQ<ZH[.b0XP/P,35A;(<cRZC05RA)XD8#9,3MSRJaCLeeP3+PS/f:FY,
T,=8E(PA<FE=R1TXA<KbSS+Q<1#A-e)A2T?C0PJW/H4QV8>?C499\CcdfHY[_RBH
BdZL?4RaRCfQF)QD<&+LaTcSAJKe.<-7G49aWDJN(INEG<aK;I7eSg:HS@e=P(2e
Gc@?fLLSI0YHI>H>AZF@S[XW[Yc9E&b]e[g+JN7fDg#ef>>EQG<Daa]^.;IPFQDa
,:,Q3:[=J6NU1.+g<5H\a[&<-DFdR,L)d;WQ;NHcIg[d#O2K&B&1L99I\<JSTdQ/
<J(0cT0>5<9(g-2cSH9(O[MMbcD]LI_Q_^;IRAeLd?&aAGH(D2^D?EYI0+eP1K_2
NFHBR7T:E?KO,Q46@IH/75WDO7]Ue83IAVUCNZAYY<<U,:Z-<I<JP2M:SD_6G\RW
G])gOD4Fab6dZ4Z-@YR]7eBBO>e[OT60e1:ZAK3G+:[6SCV]7fMeg5IUSfQf@ZG_
BH)OOJB-Y9d31);O=D&eFaS2>.N3[@_B^)\-7EF>+ZBHbVRed8;JF;EKeOATe0?D
bDS)YG\088AI/L9.XR?5gWb+\>D2,HWdB+N)CXd=7>[Q]LCCTD&,Q3FP2RaK(K9;
B2,7N\d1\OVZN,]8<@aD;:5VVcC](bB@I-?##Q8(\V;>;?^c\_Y,ZE51\e[8NT@Z
RHFM0JRV4FRgF<,PX24QD.B6b/;aON&@.fDfR5:]P,63H\5JYJIUT^=VC+F57UEY
(gP4c45(S#f&]-=V-c>MKBWC+6^]RHH679VAffa2NEIf<;.Sc#E[.;6<8;#_X7[V
;f2NgEV@)f;,?J+ANBI01(_HBYB.@#Q<-NKbI0]-JQ2eJf,d[;R?_dSZ3FE5I4Sf
HY5:B<#A1>[;e6.EN2Z6,A0=0:Z8+dT,?KZ_[:,:NV+2I583XeKG0gN.;XMAY^gF
77d#[^WRH@GeQ>#049Gc:b^/E4GLE/b0\WS7Hd@IK/(;f@/7fdb\YaCfON/(]2Z=
8PK822&Z2G27GT##Q96T.XZ/>#(Y-O7ZWD&9X@g6+4/G5N,:DLHJ7DJ>gLF;]Qc@
MI+cR;=+-R:B=#Xd5K+#\O(<);#56J;UCK.C&-1NB]f;F(=9Lg8<0=HM(L&dJb(;
[:gZ69?^1=P#[8U@/2LR.,9NE@XZHS2Z4Ncd8[7Z_C<>f/X^O3Q(S[PI^A1f,b<#
//GKODY>eX3Q,1b<D><B+?4XDV-0Y^eR2cJDS@/D.KH@Pc&ZUd@OHd&?P-QL-X=1
&W,a4+I\;A-U1Q)eRWOAPeG/J=dHHTQ4CM&FdRJJH,T_FWX(;@:653TT?IS7>b.Q
S(UE;O@;A&a2N-+dLN\<b2@7PEBPFU2OZGaPG1BdJRZd#Hd>XgV-(.d<.6(1b4d;
[]5cXN;BPBXWI\/10TZ>MOU8N6\fZ-#a3PO9,PS5[1J<675dBZE+JLaK6>7b9d+T
9-\\T[,,EA;B8-TMLQDQWR__77E_1M7?T8O[d^<f,AUTRf,1[IHAM_E^?b=LTEQT
I.E1JWZ5caRe(X_9Q?FU\EWC/Na))<3QA=]8AJd:M#MUb9LC3]_cCK.ZPc9BOde:
cB.S8(#)Z>(\UbBc[N-BcX+QP1@HMLA^\MSYWa57g^:@-^-ZJ.LO2PJ,^W&#4Iga
98ZWUc^COLa>eZ)^9R.B9[F;+eL&6O/3Y-QW4M1-G_:/+]1VL-B6fXI>Y/H50ZO>
EIUS#)0&R=HKdfZ+69K&fc)Nd\C(1VFE]=)A&C@-7SXGBXJH]>N=/0H&91eUTSgK
[Gd7+\&Ya-ZW@FD/G6a&d#F=;,O5K<2=]?fNfG7F3aFG^-N8);\RA)B_5g?<a+G/
FBaSP9@e@X[(<\B27J?X+2de]C:S<W,CBY.\DH<XYGW89^a0ALK:Nd@Z.(S=aYE-
)f\<Z-ZN@&R0<>D\BdV0T,0A8W@aZ=^0P2Wf-[7U_-WC3b/>Y^,1Z/5gZ/IaaBRC
T[g=KXHa=9TYV\LC?Pf8c-D(6H3^(2DI65cTL@DG0ZU6-3\(M1gf2A_-HFAb9RQ<
Z;3CB907F_-6?HBY(#-DDFLE;3a6H+0,V/E@g(&G5f@.=GGd_HY4LS0e#<&<>Wdc
\9RR5eO(beC)-Y\1FV#+M^/J+b=],/>2MP<aIG\9Vcd;cY8X6&C&IGdB0aET_d@P
Z,fWO>\U)Ng6MG9g_f2-dW@43J0MW:,Z7#EMT>(71ZW1:-W^a;YR]d6SZRGV=?;N
A21S69(ZBb3LPC2,fS#BN37AfRBX5aO(>U?EI)I\<UG6)e,#,d(B_OQ29CY0&WW+
TOM)/(PXT)V6dd0Z=_3.VXDMe:>W8Q?:BTAa[,5E1\DYCdVVNG>NGIf_HG-e/?Te
>/-E2A_L=W/V7)YN4WWM)1ZAH9I@JC#cA72?,5&[V@GG8eDLL6=@e9(CcI/-gO,7
?8TFY>1:c#1^STF0>]3.PDM2X>A+S)SR]<\\@f0Y&9TCQG70SL=T:1LS,#?7JZKH
UN^Z4\^4N]Y=UM3>;ee7K/_)e>XKXb/a<.=Y4P&Cg:=cMP(NZ1MXgcE6KFH)EILY
W4?c4-OW5:P\fMSd<LEI[+BNHa]Z<#)3A^]-0@E]cS.gcE\d7EJGT,b\7[N5WGB>
>L3-#=;;Q(^4D+^T,/_7Kf29UG?g)75,8SI+NTBSOSb?B]RJ5FU965NM<c7/&;K(
U\D^ULJQ3Z];:Q2gG_S78]T=E5V[F1X&GS_OM\A@CVc^JIFNXI)?0CA^S>=Y=,+.
2GL^HW.0U=P?WG.SeP_..BJ.9R._Q<V,9&4^b047)EO4Z5JMf4S;>]5:^dH564=g
42N7E[Ub6eQ)>3=a(BH2(=KgGBRFf<RG].QLLV_>&,d7&8&beS-\UIPER379)]4P
44>Q8:Y98X@[g7e,3D886Gc-MWM\6GIb/CG^;:V\3+J0dA_)BFS[EgDb[&:VNYN_
M()>W,=,FB/QIT8DdI\PS:FeQ&P7OY(15GdI]L=I]+(;_g:_gA;@]fRb+E5;.V34
79(&W,1/ZTDDM-B;AXHeJVM^6D5XCgb(cJ3MM<&9@bV.TN,^<X/,Cg50<SYPMH57
41B-<[_C_3_c=gSZAd^GZ+GbGbP-?0T-KA<\7g1B83[VGPJWC36T-BTV6Qb=R.V6
63gDSBDdf>^@cAVGTKZNWK3NZI6>7WNXRE@N:K9f2\]&V2+;SEd,cJ(^71Ye5dM3
WGTZA9e.@L.YYG?4aQZOGd_1:?)(&Xb,TK.8._=5TPR9ZOPHZ@]33]fdV+MC)EEE
8I^UGYKd\E2_e(fLcV)59a6fN1S7b</M,YBU6/FXI))-DQ>\//Z8KVIcMQN^ZAZJ
VA\f2<:6eEL41B=6Cb4XX&7Y[SQW\MUg:#BR7H3:c-G0M#/-a<BPBEDaGVe+WKD@
bA\X_:A+(<-5N5-91U7[]=\-(YL:=Y7D6A^V=Y:1I8WCEV2g==VE/F,3PWDRI?7G
^/^M?Q9ce_BTcZWUJXK=c/-XeRX\INeTaKNI<XC_(:GY>#Qd98XT:OFMG?6/?OV-
G>[TU:\=>(DaGJW8e)KQab;5=U]WA+Y_X=_5ffPaf[R>WN6E4OEI8L>JWUBY/X=5
Wa0:U?:Z(C=3^23\f\e1:Jd-eP]P]X\54,?d49,eCJU7AaQX-f9^c9dNaK5aQ-dQ
c<5=J9FP-<KMVg/g:/:T&FDKCLLC/=-H[8>;^5bVN=F2g<E6U@82(Y0H4\4\42+]
9&IPA<a)J,/fUTIb^RIeU9#BF9FCZg+?(30:2/X<8Y+R&R6GZbRFBRcNQ\eOb4F,
(gL81JR<C;IB7#S9H;AHX],?CaN+KOUA->;0dRM-94=Y[(d<9RT9-A5>dL+T.@,Q
#C9DENdX#K-L4K0bgf7X3EQ><R\d_^0g,@+-6@TR^)3C/7C)FE:&RORD0:_HS(a)
>+\GERbRWT>bUCAJ#Me.?9J;)NQ70U?&VZF_.UaDV/+]eO<>U>#5_<YZS_B&_b\_
YB:D4&]ZC[gFgTAcFHd=9_DJ3T40@;K4Z/QQCEU[K?&02F@?Je)>492:/[D,-6e>
70F.4B=]dHI#3^Vg,)_7YLfQQ)#47d-CHN.QMQ_UC&C+G2GTZB-g^]Zd]):3-gOP
U@Y,MMLEMR>G,A[O0g6XGGgK.&B^L4:(IDS[7\=P7JgKF15:5^7;JH6G1V6Ua(<B
CSYC.ORH;NK5YZ=EfMN_YQ?#MeEIJ=-8dY5Y0W<22J1?1V[B,&M:3:OVE=Y3+2&d
e&5-A99QI^C&J04?PY6RHf(#9KNK[NEDYbDAOO_H+U[N)\]fKI]0S56E#6P-08WT
KRE85FFJ^5KM=_Ze(>,)BM9K8RFe>=F_AH]-6g6L9C^S(_d4@4#PMWYBX.MgfTW/
>TaPDCTMOW@K84aJf=&DF\fYT(dZ4+925(0&R>-Y1U<)M^>?RCN=W894V0I1d<;8
9;#5#^VPbZE#27Hg>\KW^:48K_>VW95/cU-=1eb.KBGAQ^OBC#)L[H;&9F3+0bIb
0a@Pg#87@_=M#>e<78C@+,6-+-_1)Y,@(^2SB^4FVXa]YfO,]e332X/2Z^FP2b^a
^:.9/6DQ(NM7.deAfYd@g3VL-Y;:V&MfS/1ac5)a@<d\5LP5W0DOA4T4;NG=5ET4
A0:JCK@WI>=TBT)fC_XD;8AI(Y+QdRCBaJ_;[0TY/QD6=4AY,04V&Z@dA\I7O_L@
U1gGBe@RFCY+fcC;;I7V<a[a[X4JadgE8V[-(>[.>:@<H18P>Q.UUN^gH^=\gfTZ
B2H.HYadcJfF\a&M(JXL;Y(DZQ0dU;V(+&5aRQ.,c#b3910HRdbWCX\:QECgW.99
M@.#3-LVM-fX@0=aPaEY7KC>8NRBJ>g+][:Z@?=TE0-6ZQ37F?)O1;\(^M8@B-J#
-45cHW;_B/EEeO]]&)X]]/_ef=T3T2cT#TG)6dC&^#_&^6De2QNab6>.YF&#D(I5
9cg/dKP.=fb1)DL]42E[XFc6GcMCgfaN>-Z.fDY9\c)f8S4_<aG=L.J41X(aU7af
(OZ/M1Z1^]NZ^#&EV\CIdO)2J)RP###Y<E[1257J3)eb5N#Rd,&a,_)L_N&g0#+@
#9DSH:I]MPM/N>R6Mb\#9<@-21F\cKW>H<Mf0Ac4,CWOb>^XWOeUWH@Q)]9U>gY]
_X)DPDYd+Pd^P4)RFN]?:T5&K1^U57>9V?8IR[/#bQMQ&4LX3D\T@GH0MMJ\3O\A
WCHf6.GFE93QEe1a(+P2P#[B7CT99/261R.gD;aB>cD6G2+CTFL4NY)7VC[G>C_Y
cc-P=X)W+B8NM(;F<c2;b_;I+M#+cRE(.J_7YUNZ=[YfdE0P&K3g.V#dR8MOOC.D
f@fB_S=:4/@;SXQcV[<X0GVVd]2IFI1]^ZMO6B>VFNc4H6/_J[eee7+Nb@I(WY?Z
TZ&OJ]OAB599[XcU:O[6,4@X=CF<Q?&f2.E-M3dISWGOIcNfA8#G[Kf1#<5+cQVV
:d<9VK7BAKK9(H6VU47Ae4bg/XOe+1H>NP?9W3E5[a1Gd0\AH:_(DVJa\-J5D,H;
=QRE.2YeQOBZ#:f>W=)NHO=I;e]Q(2Fad^200M6LD6MEUg7((N6,@0.4NRLJZ/3T
:Y>#1UGE0JY.c\=eKf_NZ2ZJ&f#D[0L?Y35F<4M-K>=S1?T\,8E6,ZKeG-N&#2=g
_/2UOX0GCXG,?,B0_]?]L(IAGR]=,R<BfBaWL<fE,UTSMH&TFgH:T;C-eaL4fP_,
AgaBWZc)<d&RC0V;Y>-J,?@+TAgM]eR81#(aL7MT>=0:]J<gD1cG.)U8M[eN#Mc9
57+-C/fHTeAc2<6\)8.7FaA7L+:B)^f9N83Z@2BA<)[N[dQPDK](g7]IIXP2_VV;
\2-.TMaIg1bCgPT60:)Ee1H3@1T;39OZ:/-,BQ\7>65TdG]J)S(O2b?f=^ML1;aL
;G605d^E=F@H?B^ETRWXU/WJHK\_1IFLX89PS)>[c]NY)#eJ^9Q3Mb5@Q50:DJM<
HgYK8SHCZ=T[Q2g#ZJ@)L(3LC>)LYSgN&9bD2]GOf(;IP\2fX2d_@_J+bVA.&e1=
,RO?)YaFd.GJ#:&P+eBF7cA696[dcHDN1>73g^S7Z4DZ7fXQS(c?\[5@[,BMHb\\W$
`endprotected


`endif // GUARD_SVT_SPI_AGENT_CONFIGURATION_SV

