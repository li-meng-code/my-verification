
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
YI;+b+EaZTY+<.5T<aU5.-6N^7MRN3-UbbFWFR80Q7>^:J\<@8EV+)KHK7D52DGB
/1b)f<,T^&Kd>fE5g^OV;^#^A.TK^&S>1HE:Q/GAYMDg&B&g\A8F6(QV5S0@R+-e
3U@aP_/W.3?O5fU+1P4@E]4<N?BNLUZEH<HG5QP)&@g@M]e(HCS[)XZ.)V(K.Y.J
:&cU\W>RBX,a?gU_MdNRLbT3?XHYTJc^agPC,:fXBN;\LK6NY-dE?ZJDCfKLcd4e
BGR[0S[g](_VX&]LLaP.9U,:3[,?Ne_<_5],25beUD3?PZ^@.<GC0HU33W(JIU9H
-Vg5#1YMU,L8gCF6M6+/B[:[7)Q=/A\614^JAfMWf(<g/U(K;cLb.7GM<0,1E.(@
Y]._L,_M@[b),#b&^45XSF2\\TA_/Xf9B^MI71/0\MXP3,a;O6\LQ:3GGQW2&=G)
ADWY;/06;O&>DX0c=SLUGS56<V@CGI,B^VcK\F;29)H\C>>[c)ISG??BY[[FVb73
Y]VbKLW7G<CBA1f0EA3c?R2UY@&d;a@-CI##g[cI?Q2F7U/8HSVM)XCAeH(1NH)H
<XbVSf&,STZB-$
`endprotected


//vcs_vip_protect
`protected
&W9OI)ScM3[J</F[d7T8:JKfX?,D>TOf]4^BSA9#)\8-H;De\7/_2(AW43PD,C2f
(WfNRd0./)YD&<Ea=d]d8V/:_?\4<KSPC>TMZ>c^7>>]SOUS-P.]bZ^;?eP)[NXA
^RADeL:<0N8f471@gf<C-6E#2-<\:3OJa?A61]MX^eeeF>D<OJ4,^Y2.1J6W\,Ca
&_U._I]WI=>,OO^X@9>PDUSOY\)JEW6(/80#ZR9)R,>W#,G149,Td?RDE(/b^A[0
=-_QCa/+W&A#Gaa,W=)g?4)5M-M0ZP\KQ).);;.[N^_b^=8<OX>=.06QA?ESP1K8
Ua;U=H5Z8LZXNJ=I1-f[7V;\,b[&YZ+f:eV?IN/1#O6FG<c2<=(2RW_UOS1c;H80
QK+SY].&e82W8>,,BCAKP1S27#3[JDdF?SAU-<@PTV+<&=O<[1(GA5^1Le?6F8T[
PQ#)I0RRUX\U9?6B+=:[(eg5/Y#a7dBG=<\R--XTd\MKgQKY/>_b(fMe8>e6_9.I
W)9:BC4\/4GD1U(@P#0L:Cf/_C:NBVCa7-2NVLA:W+]/6f3a?#ZVDCAS\>DUf-)F
gC334D&^7FKfa.U+,7JX(b,KfGN8D8Y,gcDBV8[ga&E?.1(I5<;?ddPXFE^0QSCc
+LfPV:53H#b=<5HdGV(UYHJE:C8dBN@G\/b^AEb.T0dPM@;???GK(+,cO<U@KLJP
,M@7@F=DLRBE-A_#.3,SE2f#U40NQPUQ1LI#F]e)I#-2OZ[Z&f+M)=eQ=[+F0S4?
1V(^/JaC3\J?>-eKd=YV#S1?:bf\?Q3fWD?c_G4X/9>BN9L@c3F6:f:HFQ@T</44
EZ=NL&&eA=NS,Y@fZ3H>GC2U]GCRS^3-M+]/BB/M(,c1\ZbP1V(BfJ@g0X5V#0G1
f_7V>):_N&&?\75H?fDA-_+BUX@8X2.E_[I-W8(#F7AaeK#dN;FC2XM51A>\P4aV
&=>a<YNe+I\c3K[bZ-&SMRA73U/X6ZHUK=Tg=U0R^TJ[MbXJS((aF:ZeJ0&a2VV1
+#PgMRXB]>7UeOL.DE?V2NE4VM?T9g,;OZ^(1BGaU1@S.M\6W04L?XKCe-F-HS+?
78B#eL\O]ZI.Y/G^6a\8c0A+S<IK?J>I,7,2R<d,KC,3L2QOBI\4)9(_U-PRE^1;
b3H-?[7HC]/d3TR.9L<_;M9,-[4X3(Z_(D.QE@D&<ADJc01S1=Q1&;]=T]5+O5UG
2@^U+\+3@\,^eWTfD:T]O_O-dc<dB[dAQNJNeNbQ:X.6:/5Ab&f@A>(5@R\2aUbV
C7JRP#L<;SD9W1;D]O/@2ZYS/YKZ#QN82;QLBIE5\A3^?[3^bdA(VX/VA3JV,d8O
dfZN,B,CO]QN4],e@1;,C>9]1_VJ]M6+-?TH#P<gZG,]X2feA&(?311:IJ(\D2:]
4[OPJCc\>7eS[KYORS<;[&R;LT;<?4LFSTASXXPeg^H?fP)W,]W-3@egSPaQV]28
8JNDE1S],E&aMIE>c(K:^LcC1DHY^EXca^98#[+J<3bC+#2M=K86GS,Z/_X-@@BI
5HDL4d0=eU5XcI^I=cbc;?9=a)TGC8PMR[CUG7T7K/c9=O=ZO9I^L;6D_33@bVCN
)/<W?O)@5=4H?4XW3U.&5AHEg8D[a0TGE^fH]G>Z)P)3=RCC4;L7=KUS4[_I4Fe0
KU<8^3ZC\Q.:P@[4I9cfFJ07\N/>gbOK-FY]RO&D@7A3DVG/XcHN<&_[(]\fZFg=
\S7^Z<828)IC[GGL7>UDG-MYB,e@R6=OSRACPH>;cD(cXY:++dX(Ta+I5LQ_A9@#
(R-2P;Y3WB5EL[C>]MZ2,M#fUE(J3J#K,/BU4/0J[:=)FN(NZ>#9e=8=H]5;S:Ed
^QgXBQYBfA,CX:8ZP3,,,:b_M31]Y.XCWHg2BA@AUK[>-bY(4gXOJ2fFg5)M6<5[
E;RQSW^A:5(N)::-Q(3gZ2^^gfa4Q9DQ==H\,#B^5B,1,Wb8^F9TVUKc]0[3RV.L
d\K6<#?R\SDCNY&TOGL6;C-<T4PYB.=4O5Bg4,fYR@CO6KZ508L9B9HYBUf34Q+7
MQ?([HWbEUI]:adN:,bN)_QK0N,UFQ5+2eL&#\DM]VNg<+?XAQ8B^N1^I/_K,Pg6
d?T#:WLN9V)K@3.4.=Zg@d;M>5E6#b1U58,H.[fHYc&fK6+Y75MM7HTC3Q7;J2)L
#HMabE@-&5=B,_.AB>cAN2RC=);4gab/C87)VWbg&N;D/-IRaVE8-3-,=8<P[/(N
B-Z^FR>ebX+YYT0U)O^1LcM3DF#4[^::7a>#X0^K1-_&b9-WX-EU?cSWg6CLWV#@
:TGGN>\RS;;2>^2?D_=;/A)0?P?[1F[&;cQJ#J^>1@;P48L2UBQfgEg[P+B0RQV1
Cf]-M4CfB-g17XBG;gRMJ94>\;;4c0S[#)E_F:Z^IaES4;BSVP=BOU8][<8Z>K5M
L]NREe+RAV^?g[U#@X>27d8d+TJPX(CZdN[S3ILf+<_HVS=c?DHd22dVJW@#YF#T
T.W8-DKB@>5X>c<+=-A1a>L@35I(6QY]TBYZUQ2(eNQR,g=/<+/WW:?)B8F3Q]1^
?b]4OR6?G@]6g/G_]b#=M:;;)KD+0(D,6+LW9e1aXfJ(bb?A):M8R0+8Z;Nf<^=W
&_;<4-c.9:GH:-1E7(JEd-:M4[VR07S?bF5(2[\8>7#4f8-Af:7<>@IQK_6N4G1f
5].MD/ET_#.=<RN9W#]_RQD0NGE[ZLWC0KE.BPaU]?C#\G8#:V5d9TIaa2OA,[=<
,5f5JJV/_BI-KF6GF_a^Q+\gK78c##64,+e0IKM)G0TXR\C;.-WG::BL@Z=V:cBg
WO)F-fIcT1-<2PNQc1HeF@ELa85T),@9Y&dS3@(/d>N-L[F-6.DbSb@FUJ+&K:?[
)(0c]L0M4.d9],X2#<,.bQ/V](H,c/3::@Gg144QSW9FLA1:QG]eO6>g<EdgTY[X
()(f1V.&_35QX_R.IF6;-O(gXQD0:=7NP\Gf+U.00Ca+9U\3]_6)bS22c-VBBUI4
.M[M(KVb^2YB39(WeQAXb4#L+g8E2e(g;]+Sd#E+@a]OZ77dLDD^P/f?#^Sa8D:V
(TJJILeTWNQ1edQ.=[OIGI&EXY/;54LXdZ/_@D4O9KB?E]LX]Xaa-LAbOK>1d.=&
CM5>>cNFKVV)/-L(GNgaSSe<6U#;MU(2H3;=&I.c;(CWfRJGDb_M-(E7^.U45-G=
CK/SAI;Q+6,/@/#>&8_4c#P_-\7cCXPD)>0-R(BAZBE@2_UT^f4F<Ea-IQMeY<GN
\f?^,-[4gM+J@=<&J/A^,WPY6/QVTd8UUb:Ve9CWU6M+3H,GQI>O3M3e6CN]?E_B
c[;8[f/+R.80R7af,f9<b&[7P;P8/c2A+fXK/97VE1V/Vf0_&0fB)J+R2=&^CB#e
1AgdCCc^DGYXO\HSW?/fF@Z>92+C(IG<E+?UCWINF@7[MS.FU:&O4ME50?=C,CK8
g<<X+/BbEa=&1Z3)#A#3)DE;QBX&ccJ\V,_B_//X6Ba_bB7U8?L_[G/HNE=:\HYY
MHU<HMd2F)N<[S=F^CLX-)c((-=P=)_Q=KX,f)?MYBS(_d1Q;A+,HSF=:Na:B@ZV
R/20+:/8:0LQT3Bbg6T+)5D,Ud=BVWN2>E1TNG:c9#HJ^.D:?bXPFa7+Sef<;=7e
7=gU=De-_;1<<X6PF.:;.AM#.P8@-(]G5d]NT;IES2T+Eb[=/KP#G;3Yd)[Nd<#5
LU/U[^YP2RTCb:#<<1NU&0Q[#]08;MS@KV0cc18L8\3#bA5SRVDN(-d-/G6eIHV6
edg&<NBLcf5=[c[NOHTYbGAWBK8D/gRILG\?Y;2-ZKX.J?31gb2L3HCUXe&U4)W0
S_E5e#9E9cA37SIQ#N_>5^65VJKDR]8D5Aa5XLUKSW+7Z.6Hc;+J8=5@02.E>HaS
FXcB6=<_<72RM0<[?]6NJI=.3C@HXX:EILE/R@?gGV&dT(2YQ<PeJ,W,#1]TWX^B
<?GU<#d<CO\/.TcR@(b6E=X,7fKC.>_<NB_<TT)ST#KH401M#VL,B-(b&/K(g<<X
c\80]0I28C,?YY+/TG]DY-MVHA+2NL)O7I]L7eBI^0)<XQCL[2K0^g@639:24OT@
4fe82[F/4d]Y-aT#Dda1963T&CU.BGBI,1^YQ&&#)PT)>bK0+a:BD;1?WQ--T[Ze
a\AYgf1T<@eE6201VY?&e2B>1GNGF4FafEA?PW52;<@BN\eKbY?VO)T##<#/K\-)
gU6c9gKU40SZS]2?/.9611PMB?L^]#bSXXCNgR^BWY,K\DSQMI69),22cFU_T\]&
ffDZ53_[C)g=]>bZINOGfHbcE_QQF_D]8X)BDf@&c3=)Q#/S?@Y]SDI(D5L#91_D
8[Sbc5KBW;SS@/>>A,UG4,0>2(+dL]AWQE.454D(5b6Ag&W8-^d]2c-.N84/M,)4
+[&0ZeBBUMR4I#gEFO1PAUDPU+HXBIUAEHXd#AL\JSIM8++/]#:,3I[.OebeKd:;
PRY9eDB_2QVZM?d7G,UEGdQaIa<CFOORA6S&4=cPdLX7-3a_>gH7MV]_]M<P+=K6
a1(@60afbFUeYG[<0)Y9Q]ZNPR8B0)Y,R7N&0,Y[68fVOgPLRKJ=3+d2J=54>9IS
cC0g;<fK-Vf5TPR[B;1=M(e^A>Oe@,QE?30c+a+0RMffV1fWKP\X86H8g2L]7]?M
U?eCZY(V[g,KRX::+S71DD@KX&FbV)-.^,g>>3CB4CMDD.I=Rg<C)J.g@a5;6Fg8
Md1HQJ\?M84S.)O#+8,bA<S&GLNN&P5<?;__?N&6_gXTFPGP=MK9,_FE>K4WV&SO
9EeR^bZcED#@X3ae_1A^-]NJ:.((CRAO]1-^R[,A=gI+WJ@O8^Cf#[eA+>#M90\S
-S7QD?O:&DYF.K&TO]S8dK7D<(#\9R(1CT=&De63I+]S[D,ZMGdcEN\8,1]c1W>&
60GS>S9Hb+&VTWPF=e]#U4;A^PgZSLg87H:;6\_^+f#Na^gL0aCN7ZUZT(cYBY_=
F;]CZ#T#9Z=)HCJ1;,UbEM_QID\N>PU+=f6;dT(L+?^VPT@LH/&9[-6@.Z&X:fW[
aQ6WPQ]f,ZY?GB,()#+.aDP4ML9A1@PCcHcI4g-P-ecb77eF#X#]@T,6CO#+MR5N
H&J/L5#QcGU[O+.)F&beW4/U>1NG,L7@dgS-3-dd=O+X01-H1E>95T/RM>##K4MQ
gNN]B<=R7DVM>b:c&3)E=\a4F9T+;L4R:1107+8HeP-Ed5B,^=0=V8T[-YJcS#)@
=H:?6TC+R9#F[3ENXa:CRQF#G3HX__P,K]Q6Y7\=?X^D<535E6/L([:+a&IG,dHD
-[DU_SQ94ROPD#UWTHPe1V2N=<,Wd<R1\]@(QR3b?bS&H/+QT]7;]>[e;Y_^H\^)
>,+@I-4NX^Q?./c[<9(B58T(/6Zc\&XMMb--J:/X#26?FQ\)QZa]C=15EaaUG)QN
N&EF8X\D-S,c3Y?Y(BIISA&b:GWb9KAHO=c4)PdAE]6&)@)Y5IH]N)6c4+6Q/WUe
dK9PRLGW?4D/3-&E5617FdM?U.fQ<df79M9=N^U>51LJ5L,JQRO3O[OGXCGNC>NA
C0YT?=T^YFD)CKZ@QS;C7Y(gZ7\K6Y1;T+d3EOR-NL?ZAQ\0RL\Xf1<f-F<78>?=
Zfg357LA)DX+75;K:[E:1UFggRcIQHL;P.C83\=;A[V()17(Cg#>SC5;/[-AUDVg
FTaeMB1XP1]34#BcXEP5R(X&.(P(K-ZB0OI-,dKX^V;egc\Nd00d(F-6OB17eNeV
8#8Y2cc<#<,\\e<VK^fQK&?Xb3eM+N72BV3b)U:fWEW^]F25737Rec_Yf/a\A6bB
M\S;^AFCeN-E]DS(#c0OFXVU/CT)>#dO0WNQa:C.;@6_aH)MBaAZY]5&:KdZCV-B
.aGQ,VBVV?30QD_0+I/_aF9_SNT9+&eC\RNOMB\HeDG.fg37cG;B/_bMJQe_:&Za
TZ=V79bG0B?VPZT(T_[4I1fd07QOS)JD,&cX)P#-_.O[-<&5fQ2C@@>LKP@@Yf/]
ZbC?TJXF\WfSOI\D0.3)5\WOFAY_]?)SY,6D+QE0#N=7c/-IXMYA<M\5E0E4NU=5
[9.1DLL704++bGD1TXg=Ce_+XFQIH[38)g[5S\d(J].#]S\(C:CcaI,/_WB-8R/a
&0V,)LYUM0[>CI):=+e+S>W-G]4S:Z.=]-U#VJc4W@8=^9N9U.L]5+NVH>E#F@B#
8IYL+;@0<2;_-LUE1#E0X>7&,B1ZM3DC731TNHfW(27Ng_)AXC]Z//FOd[2^,TEJ
5_LH._RDPMVOK?X<KRFLGK;9YR_d)E+Le_HgDW:5dOK)B.HW>A)PHS];/RP]#\(Q
,S?4P[Egdd;?P^371cP+e7dX\K5+&_DM998X2WJF?.KbK5EbF20bTe33^MTZ0.QT
aX_OJO[d8QZM^8N^MbQCUaNcSBbX)-Db2ffS>Ef++KbK^e;H)e@.0Mf,-=e(.Q;V
;<(;NV_S7c-=D<WP64]8J5d>TVG]_32.W#,ceN5RcROA0JIS&cA-)5\K:8g-W&\_
U8+W.^&TMD2.2MZ?^RTUR?D/cIVN@:F(@]=>C:2H(g]O\KecUWE-)7?M/d#;T:RE
E.4Ud6-[G[13dCQFT0JR@W:e<XK?f06X/:4OE51.,3,OR_(7F<J?DF\#cML4^+G8
5eaY:@P7)>ObbY;&<J2R2:/T_aT/_2.a4H/4QD,1IZTTd>H+UDIR)HNJ??c4XaFH
-f)6#E^=1(QEUGeg/69:PH1<+bO,=;;<XN<AF:01<_a2MBbFAL26Lg=XQ&RJ7VEN
;?[Y3WQ2bWLHcJMN&I4[,@8K<ZN[KW>@4:UJR&.R7>)_^2Z_@COc^:d)Zc@1eDV/
1/<3<3;G)>AYfP2H;.#U_4=R@HH7Zf8X,.PBW=^<HU)=]HW.1_+;@M09\(8>3(f^
^:HZ]X8\eXb)XTfG]BMS+1-:#&ELc.eG)Y&&KF8N-X9?Sb?Y9MQ>\<ffO@gcARR,
Xb_.Md?^O>+b)+[#);LNagCcW/g^#<+.H::P30^VgcY5&>gV\XLf_TO&WDSUcQ4O
MQ^N4R5R-(^_g[?(;8E==S#5GgF3YPfM6)V\@-4SAXZfN,3;0J/UX8&K8)ZM+.W^
WMBD+BD&A<HW_#03PRPOFG+[Yd@b6f:&L>O&9&<ZWgLb/F_e9O9_^-g?VQ43BeM8
+GE>8aK)BgMHE>6e^0J<f:T&UAGN9OM2-J5Wb;Q8TB/7.Ie17\gPY++2LbEE=LF<
-4fQ//9,4V(U-,C0/IBQ3/8B];(ZJY.373CIPXQV8T]SIF3]PQ_gS@+49TbWI8:b
dg5Kae6DdQgPWeQT3f\U+7\\ZHE39<eW[eR[-[E)g3<)2(_e7W0P].]W\f9TV^9d
7f4H<K<D[WJFZ#f<FDS;AE>)NfDfYB2YNaVK^&S0+4S:@7=0Y\#.P?W[/DBR@7R]
GJG#9@7]CHZ+RLZTdNDbWN2>D7[S@G7bD6cKaQ6g=RgXRD7^RbHRV1d&Z3@?cY#G
#Q\_LTKD(7D_Y6BZ_TK[Z_[eCcM8VHVS5FROS[^HOJ+^_YJF09T[WP++V^@R<T+6
03a5)(MV>CZ2=A&TBGa@c?/7c(ZV5C_^AJP&+3^cI1B\b9g4_e&FQ0K0F:+QX.&Y
QKBT5-:(#5S&?ASU(ZIJgG,K)A,(X&[-c:B(;dY\g=CDF7K@,<NE,USN),7#TJ:+
bZ2UdbF-=eRW(Q>SF@,XD]H)d.Z9[Lf^8dSMM9A=U0\#P+6_/HEEcW@CTPg+NZ9\
R:WDQ-:/K.(AaUTK(&3O)HIF#4(F#cH-9/+9C:LQ2Wc?Z<\fYSX.G[HARaB7#c7e
9GbPGO_=+92^XFEQ;9:/c_7HM@43db5f;;:N<-eGEV..cJIAg_0c#RV@#C??UIf1
dE_CK\#Ba+(KHJd?BG;ZPUDWgf.SD06\3PWNdL+CD?M\RT5<P6-?V5I<[WN3)L1=
]CFb#T&0GGITCM+BcB0HL<Jb_6#>ZIMD:.e+@R^VI&K75cd-Z8Q0D\,5PT^\5_B@
I@gK[c(aHG-2HHL\33BdIeVE(0#>TJ=e.XBS2GDWZ97AM^Sf5^c)4TTQKeEb[b0P
448DON#E0P8<9GbDX3SYQ@@&D^5,PHPcIC0gQTA&ARU)G@3Q9_XTY(V?cAdDJIXP
74=UV#ZMGZ-@E59?V,R<//_.(TO;\X.QSU]P-R@PP2<B7Y7^f3AS^)]LY;):M1XR
XZZcBKC,7P)@.c=YfAK)<IbI]cW-9;;71<,FG_<=:1dJC.PS654M?=)f)<GY-ZFI
b8fCAAdW[fC#:N<8[g@<QU=EVR0M_E9P4f;H(OW+?gaCE;O>d(cg9T=YB?:SBJg<
XPM:^>WfSdg(;,TQ.5bY/;Da_S\b-Ncd@+f;&(7]c>fQ0,+4ba8:P]ZN:5&[06AE
@H=VFV&0\?SI(D-8d0+^9U8bW6U&\BJ6/=IbXS#2CQ@PC3SDM.^d^C4AGRgb+<^S
d7XW3E^.Q(^6=QJ<De=M<[(_Oe@_4eB@JD5+bYJPMR.Y@)I(4H0N2-P\3M;&4g9Z
-^:UaGBFK,d.c<P][I_bgN+LQCLIDMcX1P>D4[5c[7>]+OLCX)(IPDX7\JFfM,C)
X(&/71d[b;)1MOTMO3ULUI8843ccCK8Cc52c>G[#JYMD5GRPD9P=0(G;fTf(P6D4
51_K&SCN/K9TCII0BS5SP&=\F.VDUUfIS,44XM3G1T0&Q27KTS<]LL0I7P_]g_S=
c]Q14V+,=;^\HOHNO?JTBUP1b,H@TH(G?ER2D8\88dA#Rd6+dB6MU0f.@B/5AFCE
c_)]@&506-PG29e#4L&@UDI#NN8ZOKCdU1g2DTG&3;;b,TAIaE7\7O)E]TM]4EVf
dEC_0X5WJT^2V7ef/+aK^-./;+bMe>eGfHS,ETTJ^&267G],>Zc0bR#X[+H0R^P;
#)DdHI?70^P\,?Qg5M=C/@VE#@BJdbP74;[B&g[D<^[?SW2gSMdWg,CcG>#3=9H/
HW837)[7HQP59_9fA@&)ZddB2@D0,7Ec_K=dc-GJ57SO]SP^N>FFTYU<^.UT@Xb^
\[M^.6D:G?D2EdRG@((f\4a3UgV-;+/eT#15#N-,P/BA1ZY-#R2Y&f-G<FF)HGM:
>SRQ/bH>8I+_<D\<J<6AUWD1C7Zfg5YAB,>?1cd.ZOTA_F?Ec=bIa.3VUU2O9E)3
@#)E7a1EB>ebZB-#YSA^8W0I=eS6#NY0V9N)A#^8PFQ0CV?A+L=/U<&e+-TUWH\d
@KVdc3#(_]M@8@+(QI:C7L7B]M:R+B2e_egecTF-(Qe05YcGc2dG5;+Ab2L=8YQ9
H;B,gE/<EV9:2-5Vb(Pc/WbBd:#7^_FG.TH\/)[7_DaG;F;XCRRA;-A3dAa\?#_]
abeg+8;>#0-R85(<^/DeV5X0a9@D6e1P\4+J+LXY7+TeS3^0dbC(K)Z5WgC+3.gF
8?+G,,\LcSG?c[FN:NROV-c5dEW5RA@BYY;A3Q+)_X<__.F+S<HO^53;KOTM?>G?
C/XfW\,MfD&XJa;[(EPBUXX_^W9M+[[XG8^?g9VO-.J(QNP,:I(8F-AX/^0IdR_]
>+Z84-aAR8J])8H70F/dW5F9ZK##+[Z[Ac8??c.a]2G\0aB@D(B[aRF>G_<(4U\S
3YX)6FZ?I]6=FXPF13C1EJXEeYfa4;>J2OAO_d1I_FZTXbRE5708-<fd[[OR9P@]
I-(^YaDWVa_X^L5EB&38G)/S&YR/N=-&YdG&8CG^JCf73JY)MW<0N0.S3&P.=:<Z
-)Y?M;T2TLg.XT:1#d85SEFS3dHEd-P-3R+P6Z:X0]7^T19)\I0We:D&<4^046_D
;<9EC81D/gY3E6K]f3D.aFE&<RUK1\MPbf&J2a1&g>=NH\Ue=BNTRc8dg]NT^c9O
P(T1]H+@:6g-#&,40<1>5IE6>-C6^+SKBWC/5_8^gL(EQg=I\ZG=P?F<9Z3E9GY:
\XH^0E8L=>>aN^.52IHRU6?<-MMB7OfO[9HS&+bCE>KAI4Uf6:fA2-c,-FUC/NO5
^RCO-4/[ffD4eX/2SPIFOB/DKQ(LQNf>]QI0W^[K2HY7gYG7P@e.R952DG>@?G1G
ODFABM5Gf<Ic[?=ISU,4\2+^..^F&9N,WC69:),gc+gLFSf;3KXUA;\TADR]Ac6@
KfO-bbC),<;C([(^D+>Ad1G6O5X<\UK=G=BP6LgVFe#L)+@.A.;WUXJ@@DM)6AZA
JVaWDbb2P:\X/1@>ONRLPKUY/IecN[=J>/+4MD@_)\B^bNE]]S[RZ/g8<aM6D7eR
L7Y7;(+(1801b7CV.=-]R1Je5gCOKE.UP/gQ<\dNdI<WUJgBf82(\G(XX.fW,<[+
XTb#0(D:+Cd6bKAL0^V^XK0V8fU.VS>F5I6/.]Y1X^KSRW]N.ISa4WIO<9XWK9_D
J/U>&H_;F#9PYMGO/?YD;CVdDM8[@Zgf/L10ICC(&0QE2^HSS+S)V/7d:_MAGYZ7
>7M/PSM5+5_:^b(:OWbU-TNW^7b0.,#K,CZP.H-33WEP_eg+.@Q&;fKa^I#]M6Q[
7+c+a6,98R&7[c74@)TFaCGS-:2f@//XN.\RFG9A1DB^AOG6YM#\Q10L&;K_,Z^Z
Z=Od[8AKeO6>GSLQ,>QZ,)gZ@Wf9,.4\5#FTS)>7H+[GfcA;.c[S?:,SJaEDId7^
;/KAT+ORA.:6R59b\_.7F6/I0bI#e\Agg0/#3AGFPC?-+PZ^OCe,7ac>)0E]W@Mg
1]D&1;(ZM3R<Ie9gNR=3,)HgJ,_J5JGAP2_JR4/\9/(4RC=3.MU5eH7@.U[=O302
P.&GYQ-C8LDC69J[P///FO;\gbK0UTHT@.S@HU>If,FSJB7YERQ@e9A=:MTO^J:8
VO6::#C=K&c/#JL;BP&H0DURb57UU>\7(:ZAD\O6Bd6=V(-?\88=gV@ZDb09\6>6
>;/OZ)8<9-e[Y6HB7U)ZM>X@=Mc,E2_-f/(^fQL0I03>dF87AE9;=QE4[@571@P/
N>;<]IHE&J;XE:;g^[RF:2;M_@<aBfb\0ccf(F:,_L]5S^SG5:7J#GE_3WC3R>H\
Q8Me+1A72?6Q4#c3ga=[4<F3g<R=5\aCU./cIJ2>SP9a&<^KE/)\N.ON@9<<:;1I
1YVMZ@67HOf6Q_55@f#\H1G=0A&5T&aF_F7Y7\OULR;<<gO]fJ3GH^YA\f/.S@[<
eI\.Tf@YE-_C\>[CZF3A:<6JI\Y]<\]HMa#G52EP3fP(K<?>B(S_^aGY@Zd32:c9
?fW0-,+3,D\CS:K<=0.KQ>./WY\F5PN&c=[d1aAT-<RXH&R(U<d5OE2WMQII_g=A
6HE6QC+I^&;>=>e?;[VOHeN)[WFB7aXNN@I.?>>00:8K@J/cG?WKO<D@L.#GCe0b
=O?3^=fgHWAL/,(P.BAV3^J0LZ:3G]/-Ca+2b[U3<>75L4V._e1BJHIF#6VNd?+[
R(Waf78E7))U6NBECdSI:+4FNXgZI>VG:J81Z6W/CU;@M>[OIDfZW43,H>H3R-Fe
MVX?_ED48P5]7O(/0DX@U(_H-YLW@_g1DZD,V0NC2e<UbBXOW20<BgAJZ(4,15)M
2Vg\.a7YTZ:2SI)IESBefTU.>:gVP\=@,O\3RMDeW6XRE)f<132&-_+g1g[PVNI&
E7Q9?XSfFPMBB]H9F@9#T<#FefWR1f0g]b@^DW3A@HJ0.b(MB,ZG@&9f&d=9OKL+
[/@ff)-1c1PPVD?/09+UMf]:6,#3=?DJ?#:22W^d9AGeZ;B+6>C\^V,8J2J,MV[>
^>1(@G8N(N#[_>+OU+T,-9#MZ2,>KMM#T9<6>C5/U+7_F9f&+Pc^gF9B>E>T+@6:
#g3T1^ZSSA09#Ff5/;VM+[VOU>e^Y9<?M6[[U?9;9ad]QGQBV.B?6O1X)V73^-O@
F4[0ZBLTda(ZO\)-KHc,[=OUSPZa;D+C.[F)//NA2KH_RP&)LZ/<dgfIW-XH#=4e
U8-Y?36G(@Y2Y.<,a2[Bc45L8&6)E0Xa9;Y[X7aE]P:SU)5B5L.2HG9ZYR6E5YS>
EV#6S33BXJDd,OAG+<?XUL.AY:QCE;(0B=]cGOX0PL26<Pa>O\OKNPAE_[f)Rf0U
0BSKJ/FM881JK^-c-,-M\Z,=LLS;bXS2<9Jb?SK2<3IVNgE7L/aQ<^[-aF9D2dSd
A;\&]Cdd^6\5[JZEY1.QE6;><G>7A-EQ1P7USCBE.6\g;>MG:D<4/GB+]WaMJK,O
3Y:A;c6MfUI,[PGGNMLNV.<MCI:OeV)0_5dP?\RFFGUNM4V]7QRIa;=,V=d-XVG6
3DYb0)[/b@#YcW5e)9O1&ICV+F\-OP=ISF6ILEYMaeO>FS:9,OcX<2QEY-T&BXg1
_T/B<]D[9=d]F)M=.>bJCBAFcI9B?V3]?<GO;X3L:L]&1c@AVY.P_fQWQ[#LOZB.
U)PbAbON4eJ&T?fW>IHILf?6NNMH#9O4H:NVRKGcJCO&b<a-PdX7MX>7PHf94b\-
+@:/b\)?7UK09=Dae)HTHfg:=.(7BC+I:aDR1?7e:IZ;X6+BMb9QDRAU-U\4b#Lf
d#E?]\L0]&R2CXA=NVAJdV1ZdG)I^.dH:bJ_;WgRBN(,9DPI:#(Vd^PL2@1M7?eV
39E57QEUN3P=WVGSUe-c3AY:J1VEED](g.I@>VNIAXH>3#c_[,:3)7[?>]a?W5)#
(4=Jb\0A;D:ee71;,Y>Q2=Of/OV-d#WF0U6?aJ)0F:2-RcEO;ZM+&Of):3bQ0db8
;X4g#52-Q]4DHS(VRQeCH=9+e>f,Xcd..J-RJU;X?+R-NZ>?XHG+YJLVfW/73Y]W
\MGU#B<^ZZ-K)B-?4X1]XdEM]U/J+/3ZG4&JL]gNL<^cYJ\:D.O^e1.W+7CTc2D/
a-VQafU7@?BS_I(;9/?&#eZ?J+5Y[7UE<NE.?G,Af&02a]S.5H=+AbV?UG?RJ,^U
PSJ+b6F2,eO\SS9VFWa)cbNX;VO[Hda:aFVVa?5EE,<[R[H5(;cABUYQZC>S^/WO
:Ub>C1,b5RZ.ScL+_J]1NWA+XIF9e8dO.X&AT7#Y2REO;PgZE:JB?#cIOJZ3NEE;
O(]RScQ7_]U_+]#Z5P>?a)G3UB74X2LXUWDI4+PMO[E.,IR?O)Ed.8;]>I5]c/d-
<4eLRNNFa;KAf4H#+@85WD<[W#Ybf#5WNeJ9(2d<FK^P84^7H_3[V_G1JPdH:D6+
8:YJIKS#SHSR@<a[=/0)Vc?DNdc7:GJ4,IEG>]5/g^]=?-JF8\__#U]H2:-+Y-5f
[=9g([[4Y#e31BGf.G2?OV>?LP2ODW;RWLZcHcaZWeM:U-Gd\C:+0&5PJT_(-D>A
fU,WRB5TgW)U2I<bNWRLcU8+FY-Y1O&?KHIW_8DV829+3=#eQ=)D]-.#@6dIESG-
R#CYYN=/C_+CIEcHDd2Z+)8-Y:>=PeUg)VE>GE:eF?57Ic5TSNN7EF7)6U9X]-0:
(FX;(g)2L-:5RT_g=N/IKcE=;+H)]XBfOO_Fb>G1A]?C7g2>fK+>Ad3Q\F.\L\SJ
\]>9O3A<BgIBM+-<+a^HVafC9MW4<a^F+/4=:Q_8@?K)/MR<O,B=fdTaE=A5XZgH
@0I8UCL\g_RM1W)W2U._M;AeZ_]1GgSCM1Z-<^7_eUGO6-N-fdZ.XSeaea0:&04O
(<[bZNO&C<d4Xe8/0bFd1>@9.=c+Yd5LV]JP9N)H55b77=eDM=PK-=2DF_S(6eYV
LgD5/8D#^@=UL_.WeBDGKe0DOF<]J]+]M9<ZPI;g9E+#2F9ccfDXBUS3,06aQebX
GN^D=#)6WU<G0>UPFEF?MaRQCAKGW]-_+JUc2PMA\S\9S&fJ[LHRNPB\;JH<TNGV
cG1]#e-=9cN;#]0HR9eS,8YQUS95NEfAc4TK^bXFBJ]4:0PBQc4O_766W4<Te#P+
:XVVT^PaK-1F^.D(X[219g;,AZ^9,6(4N;?C/GN+@;=>N-#LHGKeI/;(ca@,,1\,
2J_=#_D?-TP&8edD1/BKVA5b\-(3a9&=\4cQ6O@LG:=],L_e+6N@73Y@Y#b_#MSf
XQL3&]H-SG7:f5f)ECc?GWWe0cX.]K(BEG\f;,2]AX/gT63)OdSbVcUDVfJ__+:^
CGH5\IWCd-:Y3.5[LASg]0,V+O6E68WT.D&:E-VQMH3(<G46RAf&QPRWVbVU5E>A
3,7N5eK18]V.;B>JC)a3E/AZX6&?1PREY0468#c4RLN#8AbX_C-Bb7M)MP4UFA-?
f#e,,F<<ZK1Y<@dX5?P,TMAS<NYg3JOLTg6@(P&L6&K)(6GD+S@J^#O_;@^+aPZa
,FQ-R@eG73(KI94Sa(\(S1Id;a;=c4(G5_^/c.cM]K^&Fg[gg=E711^-T\Ng<bS1
aY:PVT7aI&N>^GP@>YE.Ma[9KTUQY,W^1]7#d/&;W^^>RJ?VV6WeDS-XX\IY1Pb9
CTXAZU_J1SaME#=O41H#PD9JO9Offa>ZH0;Jec>MT_:L372/YMM(:THPN69-/ZA=
P\g,b77C.C3)Y(dbZX^K6&+>58Wb)EA<9gOa]<=.M+76#cgF)H/HX<HBVP.2IUQ2
##UIREOEWQUe<DPe7(4&EER3=T5T+X@HOJE74M2EA0RGPF^8Ze,QbC41;5HZa\_6
@Ag]L;IY,dA6J;@>F+)-R^;]_6.f_@Nb7T-:Y1/;[GUBPac8RC4]R7Q);GOgE>1Q
E7e(^N?3]b>f2U8+6(aQ:Fc9c-3GNDO.RF:\VLAILY&H0IJ[9L#&&,+41)8ab(V+
G2MX&FAHeT?\442;I1E1I=06(IeZ7/ZFN]-;dScWSUIYU=e0<9W>1ZF^6@BRa<Hg
W3KNNDL)GWe8X/YK+)=2K[UE]f-DMU#/5+3J6UOWS3Y.&(/eg+<[62aU_5(]e]9)
c[D?gd:[fX0D1#7QANL-8G6aSI?Z)ERC)ONNV@_gEG32+QWKIcb8TMM3MC^@6Ngb
)f6S__TFUHDWGB2>)>7)(PV0E;)=JYVTW4eA6IE#=;R23J^Rc(70X21<:RM(Q[_;
bI1^OJ@H.VP+D-RcGfUA,f\Zg)gZ)5c-:Z9/D@Z^^[?;CeeDJU1^@gKP+0BbBQS(
c<gX4[5Tf^(M16>FNH]4=4^7,d2UCW]DcKP0-\B87#D/Td^ee>/g4?)Ma]B8_aPR
5.WVI0HBWg>Pb&3IG:->0@[=Z[);a)^GEC_6X9.-43A^JQNMFO+EYcZ)@bWe?&\(
(EA<.]2d=0d7-UX71#7:[3+@P+Fg2P7WRD1HJ;_B?fAZDJeE.9B03WD1-LC6KHfV
P&T_/Ra8=M-QDUZ<+CK01dAMX\aJXR&XC.,c8<]_O5]0[#AS\CLb0XU)YFcRIQT:
a,27<.AAgK]/(<=24c0C2+,b3;e6Xe1AV#Q=4<cL#O(W/AL;dQD[AX)dSL2TN;F6
[A7&H7XU>3gW:AP<L=CUF_&HK1Y_gGcO5#/=L0Of43<d<KY;2=W)CS>UN/U8J,#R
-2+D+3)C):>89U/fH+KZ:S_?PV0/ZED0,W]GU5a:C&VR+RE5HFP9@6ebN8Uga],3
BT0)UKR]+^gP#&124O<cY9(a#4E@#caBZFZD?\7#HOOUC8a2)X,cf_SJ?-\Q0#d,
W:I:2],N1&FN3.4e<f+;C-9/O9[Ic=BDGVg&Y-&4GN1:M5[2-@4.DG?Z:-D[D4M<
H@T4+BEEDDFSKMQ)18PM/_J6c25W2XgG/=U>S-GQ\SUV2J3d?<X9_E])?SFGF[fK
4[GeaFVYaf=^fU&I5\=[YLc3WR]AZfe>DBM9BdFG\JEcUgUg+H\X4_D43;SEF#8;
E)N?#;Y>QN@B[OJ^=HHb=[bd8>KR@0gaB^efT+<E0S7A^39;(HOg@V<#7Q)0dQV,
A7W>(AWe-eIDP3V;@^)>XHdb]A]-2V^_0S)Q.EA_B5&[:-G+[+K9bZ-)5VQD>.(U
8YP,Ie<cO+.7]#?T/U_YRHO7OMH&(N[[:3D-LS>f#XK9_[9_S2YG+5d_B?aYad5-
f(RFBePE7.CY>-T9?>JKL=X7=^MS_;6WKYDW)YV2cUeCB?#KEW6eJ+aU:>5]g6ZT
&?.L24OI>^5FLQPB3KX)VC9Nf5TZ9\+G9(fH9D))KW][5?NDT4B:?SbA0+4NN^KH
__g>9QU6cU[#WK^&<d)=^4E4DF8KR1FEWY+G,,EDUfOCI.V6bX+J@LJe):^]e;7P
^C=LUf:bF<bZ:08V\>0/LD4aKP#ZTHUfWHdAgIB2PHC;>H^:=Te+MaeK8^D.<ZL&
eN-:&K.4G^K5@M?(Pgg>#N]2BW<2&\cNObX/PR?FWDGFV8SBRd(.^#N62=(cOP5Q
FV7OP2-=7g;J4,1M,3()G[S7+RIe)X<(MF.)Q&R6<?ff_6W&^.E(=M,51ISfLeM(
A7^A+Pg#C9=SKfOGY.^2G8;XJgBGEf7TW8egQPaJ>HHQHK#SI,G]<b31H>0dS?/.
O1&a,<O?KJFOXK5UIE<EZ9cF0E0g/eJEYVOU:<.g22LA1eRc_?4e;_)T18e0:.NV
QX<CZNE5-8^XGP;>#=9F<6J=<RbBfTR,R:[Ige@cL&5E+f1W)B055bO+/TATNQH)
^/)81#+PCIP@V_F,[4M5dJbWII&cN8M/RZEVL@L:/e0_D7SL70OPB02D,P=+)1[>
W]&IOEbDS=MIJ+=0f[8WRG.)#K-D)4Y^]<CHML?CWYH0L^a[;_CN46TNY^V^/XXA
BI@5<4Q&B6_=W.:98OMK&)HT<dXS(&@K<ZLRUY32_663[gU0bCM,V5<O,)>D?N+d
-QSc^2WU6ALd]ED+/<P)?O2/\4CRb)L&dg>27[S+b0V751&S=G7L0C]2>NE8W#&c
a7+/P=J>GBVUDK)eP8OVT=dR\:#[;;8&dIf4OHZMNQd(fM+9c)E]O5f&LN,gedJ-
Sb9^&@[gA?W0D35&L>>R>([BB8eLPgN=dHf/KT&:;^f7M6<MC<E(:UG.2U_@BXM)
QB8BQ;eW@@0D=]/RCH(58c6J[Xe>A>F89Ug]=]1S_Y+8RL1=1&?gP/@R?@^0SEOA
CECGf]Z5d)^I=P_NC7=cF266JK=B\M<9O[?^DZ#@,C3+IE94UN636KcV7&BP#I>5
D]]4QC:\_13C/dM,Yb0^GGUafAIS.4WLQU7=-G6dNP;R],.[)VKR\Y3c@>c<T5:O
f/AH<?VaQ]aC>8N(Y]/+-7X9P))^8.&D;J#W?ET1RN(406_>HDJ@-@g/6U)f0:?#
#:B]g4QVX:#7+,I>c-e/a&eR>2D@)._J8QWeW:cb5Yd)gId9ZG[b49G1d#D8(U(B
8_1g@&IV)JB\0W[,4>#dX5d=-1;8bEc@2;O@\+EV;d\6PKYc(EbI+I(HOUYD3>@a
H/H<\F99dZRF12I(K0cI,]1:K1:;dHDe:HTH7G2B0H1OP4ZA/?M[_JU^)QL3:^=;
[(.)2:+I(71Z\:Z=L&(Bd>3J=HE8VS>1E#]/MI+(bZZ?7,g?VecAFN.-+bLT;V0c
9T-)?ZVc@UKL9MT0O)NG+R#+<D(I&<4UC]4RRF_a?MSI(Bf>Qg^K[\gQB[9;&H>1
DZ74]IV#/V&@Z69#cI4-/Q;P_PJFF,7/J2]eII&8GdId#(IG7PRTUJ3S4/gYHPMG
RT-9[@@O)]>XWFcWG>&HVKK(2+<._;&B)SOUCS(>/:(Wb56[SUF77MecK>4R)Pa(
G6V.&BA0\b5)5=,D/g_Qb@ZOKKDgP9f,.HA.JG0EU5:OXH4W><FdUYE6G,R)_:A4
+A_TA=(N[3SO^<>/.W=O<PcI9]MCgQHMXEXc=]D;DD3+Y04A0;?/<E4;;,R-O(Ma
J:a]A=Q(g#PTD0+P1Z6Cf-A:CZ3+.2NXYIb3GL<cg2:IV85#VdW@d2/Z&@N3_=>^
Hb@+.c/22=0c,.HFI+WcKAa3C?e1BY-4Z]-TA/B9]TONJ#U^#,TYf&4<HH8RO=D/
6T?H>H06W:]ZNQA0)3,,dS\bQOZ[XQYJ.U9(OMA/374.eW,3Z#H1,OZ+E/8.PV&P
35).N?<G(a#H:OT^c/M#15\OIU<F,)GNE@>([ceH/FgZ..I,f+,W@Q7.>>)\6KY/
=^Yd4]d7YZX71K6<7:cb_(B\#e-.M3Ee=::<^9C)aZ(_K2&@WN<4>2SPf7?=SK5b
:#0?g#D3K9MA8EE8CMM/)X/TdH&6Rb36+e^1PW1e-@Tf]\(9WCgF\T52?S.@cIX=
7F6D[/cO77&?8Z[ZFaLGfHJc5bP07I0/@d][CR9EX+b<]9383CXM()=aE@cYKAOF
ZG))2b4I-QM7^gBBgLI>S,4DLI,YCD@PFC4L/89GI[HD<VWY/]#E(AKWEX<P1TMA
KNL@-()V/>e1-?GWcC0HEK=e54H\Cdc7W0XHN-50c+X@6:,[AMKfdSfYX.(X;(I2
]Hg]3Y11AY7H>:V;^G5Q:?+.0DHWX.[\<<MM[L72Ze,#Eg9:>&AWeRU#7eg6NXGZ
8e,6BH=E6D1e-d@MU/H3TP@,X48-\ffZRM8]fJFF>>bT-:VN2>9Hd+3QD6C-U63e
\3?.?C?7^cGQAIKFe(L1TOED#2>ef<XbD]c54K]RW51\-Y&7A8615W2XB>D_:-<;
]gTPY_;N<[ZULG9KD]=RK_JcBWT\=bD([bQ[c[2VbV#XAO;:+U,d?c3,2G7J>eaY
c#\cf-GNY<I)Q;_S0dKN[29U\,Q2HJWL:dT+#WL^S9&NTQC#^BSg+]2,?#gbD?4H
5aXdTX\PU]YD>5IfHDSDdgNHHW0^;8<[H_VSbG0\^ET2Z5.:/Y+6cAQG.(K4/HOU
ZPJ\-cWU8<#&LY\ed_<aX&&TDLPd8LWJ.6DM:NVW05-XS-ZHVHWS][,5aa+O&Zc+
0LATYX6:eY0F\Z8CYI#_f;@d](gHcCVA,ZGd\<A6[GG,]6T.WDA]]EO-8EU_T1_O
9I[7UbGT6>>/8\?ISJ3+<=[:FK[edC;/VLE=g0T/XW,J@O.OB[U<0DPN?@bKI-e]
)DHY#QPUDNR^)8EM-0aF]M,,@84;30F?GH_HgKXeW&EAIXG^\D=KK\^Je&I^=0TQ
\3H<bHY.NWIISPT1C(,ea._:c^U9JNH=C\\#LbDPge0<ZAdE]#?:DI@7:RJY[b3@
/,CA]\3-PAOJGC6F?Z&O^TX?;gY\7bUM_6aL_].]3I94I4VP^_15AdUdOL?LegI&
/de9P#EaT)f_MC7T2)@3SE[TbS^W#<N>(U,8JEaDW=W38PeAM)[4S)Gd8^@/b<AC
:3Y9,V.BHFeZPS-H7c+5gg#OcEWBRV/JG/)T&JNUT>Be6.7G10C,PU#?O^G77)VV
/H&PfAKPID?FP2268Y.cg_CH?]f<+A0+R^cQCEN<&M4Qe>2PNaP&dC5E.b4IA[WI
<\05K9]<&3EF8M@/M85b87F(:>W^VVAbQ1GN@T?DE^1:QGEBZDf<O/_Ma@[7QX-S
Oa.UDC8UF-T6SEg>W;+I,BK+\Re2)E4T5VcXR.P<FY)WKC]#./=Q:^AN=Gg^V[Tg
UL@_:28])(42Tc98TEJ@d1?AP=Me3[YNWXLf=>QD?W)O]gAOU>\XL/UN.7YJ(c_W
Q(#bgD.@]4A5Yf20(73df38M.#KRNLZcSc\7#G>5)TQ=,09)OV))cTDZP2GQ2&M&
HX)b,L55J8M:_U6cQ&]acDZ_+>8Ie\>K-aad[?/[N^2<2]H/Wd)ae98BQT#.dGE:
+L#EMYG@dNUf3V9AMF\@VPNQ7d,1)_E-LeJ]d&fX(R6U2)];J>H?VU0E[bKHJ=[-
[OfXaEEX<)gHCGH>d&H@IIF+UOe+DUQ2K\S(IAXI-G8>B:KPA4Z[WcN>+MV0EZ/d
;RCeH(S=;WIERO6LD:5f0MO(W03gTL>8=QHFEQgCKa81XK2URFO+WX1WU2c+eEgV
a&88MP,1UgFVNXS+6IQcI-94#D@]KbF<dK:VO/_5\I6\gQGW5NQ@a3(,;^S\/P:N
YeebYGd/WES>\EY0IIZB?c1ddN2W?]=THX2UFL1dZC&<(8@Z2?_NfT=LRV8aa1G9
SeDacaD]E_R:.9;S=D+ZCX1#T<DNg(3eJ1FH37d/1T:c_(EO-\6\fGb=9Te7@&@)
D7e5WA-?Qe\-0K3N)M]CW7X:E>-QcVb1FA/S91NR]FdV=2U@&M=Ee;P=>66F=HY7
f#RPCc@?&NETK?-R?RC[d+MP7>DbH=,/(-W]/2=RZI6J3LF]AQb+OURBU[eH^eID
DAFS4IEW:YTS<V>2H/NFA/a4QT-B0]DgA\d61R>=K2[M6HQa,0#GZJ>G:17WPOJc
(GKM^]UC3+UECc=.6<MQS^0-/+CFHdQE??F_VaTRaf8eXBS=L0G+5&;^YF0R[Ze+
17@ZXW01-g\JCX7R)A=47TKAZ7SJ\8&ZD8FY0S;]K_QB_?U@];?MT]J+Q)B[&^)S
EVdR//aO6F(2(V2I24+N;/>@Y3FO],2.RFLH]f9Bef<b/>f(8RE>[,<gc/WGBO@f
^5D,b&_-LRcLJA]22CEJ&?3B,\5H/Jc/(;94DO<PND^[KW1:)=D]R[-QNA_8^b]N
0.,(TYF+E-#NG@Jc)\#PgN)#3;-ZF.f9V&Q?NaaGeDW:WFbTJS72:6])PJDIf-(G
T+@f6QZ#]TS:J\E)0/2bG+J;(_F1+8\e)ZWH9]PMM>89P8#c24&-TeNTBTC?>cSS
L\8,SaHVXKR5I@49P\N]-9+/0dM#ZTa:-7)9eOOBdJdd3)c+ERKW(\QXC04(GDg;
.Yg?0@Y>0C-@VSG[@+5T7O#OU+,f@bF1&:c=5d[?fTG,Ke)V-a<bCQQ:&ECEH6e]
QP@4R..\A>8C1_LK;dVG+Lf4,Y:E5ZKRN9+2U6V:SOJT_SMV..,G;[g?X5XJ^d<P
OSMQ3K]P^:?I.6JbT24+NP61cc46:BNRDK:I[A8U.cOF6K:U>63\IJ0A6Bc]H+97
[/b,ZUYOUC,00E&8,aEDgM59,YGbLF=aOVgGa#HAHGYFE]HffZ-DWA<<=K-cI71F
MK#LA8,)<QbF+PB)KF7T/Wee,MV\0)_Z>P[:.>a2c=99AW,@(N7Q5V,a+IZG>)?(
>-aAJ-UE/-dVV)fd)(gMH&JJEV[E:;P)N?CZA<?Af\^M3R^))dfP-HNE;\TOc=UA
c(#\9:0HB=_TC2ZQV[3?H,^BU[)9I&[>T-Bbg<<e+.;E+,_ZP<W?X7CNgBLE+;cN
E=T9>gO05WO;b+YF[dK#P2b1:7gKVI4=HS.P0UA8UVCg<6A#_Z3[DS7E2X>?2;\Y
6><Qbc<&K;dX;>IK&DQGXNaG\F\;Q6d-S8,2GbWH445D5XOBV]AV)F).]G-:I&Z&
)MU,bP@Z8QYX,OR=W3D(T_Q>IQ@1A<:JJ+)#M7c[EC<].LAW6MWe7<bTQf:[g?>^
378RU=6D,\[+dS?3L4cMFJdL1F,0V/UZg,6L>L&O;;4ZJ;9SU;5U,Y<Za@P61+8Y
4L2=^<,I2F9TJ)fV>0XST/Y?6A=IMM+_7WA&N>@W^a-Q3gF-TJX=.V<WQf)W^eDP
56(9__-8[&&Y9b)_ZW2QF[bE]_Ha>PYLU2X@8B]LJLQYaF+g049VMXUZ(/,.f_H4
B;<[bA5Pb@O+g6PY?F3bf?0#Q=(2C^>ECJ&Z1.1+FC#)CbH6AV^9<1)aabYW0T?N
QK)2L1?YbEN3fGcTS0MEI?/P2@O)fUJ@=:(8B?^:f1Na7VcfG#^\I7.V5;:BHH);
4H:KV.b,W>SP(5#R@K]E#X#9;KKX^)KN3(^]\(JJ?2gQS;OIc5LSHgO7HZY07/f]
.dY&_T_#fJCR5^9ae(#6GS;R6HF4_F\fCMB07H#][KJP>9IcSSaX_S3P#9S>XaQ1
Ef:[-@)E^=H4]:/N=3.e?Q@WXCY?:FUdMD&)H,9KRE:V<3I@9PJbY&6EU42F1847
eb<HOL:(WA6Dg7;J;O5F/>F0EfKX(JABbEM3adZ4I=N#IGYC#0Y^Igg4J#99@.=,
)E@SNE^CO-:0?5IA.,HN3[BY_<<S=e>:b(-BYHN\98IV[41ZBH_K?YUE+/-.2U8=
JgX5B-(I0bg(4Zb&ARAY7Oc1EM:A:@J;5ZL\YJB#cWe+-7LQe8<4]5F0O2aIPS[H
+]Vf;a+O80[PRL\aC#IcZ1B1,U]N/D=P-=-AMZ^VR8K\\9g)15513^caC-.e3C]?
5()B:gMV;4+f68GEQ=V=,c3##G.[P=6+@2F/9L2CU.cK3XN/>bR-QcDbPG>:,fA\
)a7#-/B#KZe@J1U+6)dBAU0NKROE82QH).,>1(dbfV[:.V,<CDE9>7(EYdUVE,\V
--J?7D,MMPXf77dN\^bgEU8O?54PKZ6CH&e5&^cKNK9VB=;1]5MR:dUeH.B=Z)4]
&9Eb]JN-g-^[R_Y8[6^VVLbB)8_Y;)TSPK:#ZTVKAa/7(PT6#VN:QC6Y#edP6b-G
\V932);?U,X2-K9DSEACceOZTP28Bc37<ZWgcC8^4/\8:caf3IF7(f_N5D57<,;F
)db\BH@PD-YSV=SL#3S^>6D<-@PJ@B2&+64#H+G4WPH7E9OGM@YeWD:7)GgVO]&8
c:RA^f53DX[]K@]==/-8?_fa)\0,(><dEU;PS1:NAWf,RO3/8SffX80F4NPeQTe4
\b9.?UJ9XKceBM/U)>#KAO5.0QEB>((7O33#-[GbT)c(S-<IgH)/1N46:-5F9;PG
QZYPIA#C\;a#JN)DI,LOWG6?1@^ZE,8FS0-b08>6,AI&/0+NE6ACST59GJPB-1)D
+/g0C&4EYcBcY_@JeJf=Pc.X>GaBR96NI8Rd#>QK0Z@_L0DM3ZbF=UgEa2526F_/
+U?>ZT;.<JRSH^6S49dH;;]Ee<P1Q4^/6;_07/cWOCd4,eS9Ed(fT4/<:BX(&I>.
^Oa,?9g,cDAB#+L8];bQY1JJCL\bS,9=;]G_cCL>FO4>W?==[F#1PRdAN#9[S0PO
ZBKEJ.F6.CYNKJfZ6Q81S#NSM9T(\,44XBbDP9C4/ZWb?GU;Ub51b[#11&9->OQ<
e5<\S;N<g<104(4EcVOBH2]1?-#2a<JA0/Z[69U)Y=KG8ILH2J>9cB=&@;1=?Z=C
8e:V@XBZM<#<G62FA>N5&PD+eE1RbW3AO.&I/4:aQ^gcZ)7c0eR6NWJZE+c^C465
d18QV_Tb^Y\-1B#KNF=KDV4[[1ISMP>=XGE#=(-QX@PN>EJ:fUR1FT^+YH3Q;7F8
#N_fXQ?fbN8EJH7NCV>#Tg&@)ZQN?EG)S^0)&RcB.M\>MK5[1W55]A42b\ZKfYNT
+GB_+IK^e5g?AX2DCWMe5GR;dg=L/HXgFLcD,VD;J]bY8KJO??/.Ya7EG@_OV7&T
74FP2]R))1E.@dfT9eE=\X\K7G&XRBY(9^:f7e7V\Y]9H2JP]VO>Y\)?6c]NE95)
H>IN>^a_40?XR?[Vd^]\C;,F9+c):/)@:L11OD&6G@1;g1I;=(WVIAGF7[CZb5(3
::U;(D1BRY5L;g,E&Aa<@)EQC&D^KU?E@G)4F\d^Y2\0Ad5D^2]WN+?MeUOOg4/-
VV].//.)_-:L1?Fc]]>.R=G7HZeJd/D.5T??;V+VVT-AW4+fG0;4A&JA7^,,MNH:
bK:cQ/>RCAT<-CRW52VH5OT-G);<eK0/>>;7^E&/\GVW_4Q^CDS8/+Ta47Q3E1Dc
f)2,d<bR2_NAO1UVZT?F;[Qf@^GGCDMU448fWLa6?c(&5(OLCSD7RZH1@&)?V?WC
c(432;<PD>R7f\+5g)[=@2.[JU4>W1:cYKN<b>/:WOG<9]RDP/^<\cXCd4A4ML9U
P:,=@X9^OM(0/MHH?^I?Q]:,]^G:AOV58D2A]VHATK;[Y6H]RS<e>f+#JIfa\Q;A
CQ_>YZSDb#[D;IFbIg.E+c6aFN03c9SW6<,1-<d6+&[ag]Y2[8<\Z()DbVB^-5&I
_4b4Jb9>X6XT^E)MQ=P1W?X<PN[RU:NS?85H8C#K95KU=+W9\?#&66\JG?gMe<AI
R7Ifa:-SfI=WAD;3=^2aPXL^gLR8a5La8(4?YH7EQ<V)?:F(U:AS<&E[Zf6<8)^R
]+2bAWI:](&E0ASK=Q&GGe.YeH)4[0V&=M)O[U+3<RVe69;f183FQA4@_PU,9[3+
Sgg6BR2DDUIZ.>[,c_=.(f\3Wb>2I0->]6eV2FdFR5H)cA&H)XR1W^(_Tc]W9gfQ
/Gg7_4E;bJaD8VUfURQfPO??BZI^-RY]]TLR\\(ES5ZfY=S&IPR0I:=L56?CHY^J
HLbf-UQ7H]6LVPHJ+<BeZ)Gc8cV+HR7f>1^1]I1FQ3UeJ,FdY5--c52V\LW&T\1J
X,a-Z-^5\)CDEGcM=0,S;N9Re\(+\H3>>=4D6B#AA&_d#81K>&\dbUZ&9[2EZL84
68@,CS7b=d:MI@WZ60<K2MN#U.P969@^UCW:.]d6@=PQ\B\fgTgGKc+\Zgg;]6\9
]D+,D\)+19T1QeCb,]?I01R4E?&(FTe_<F92(82&2RJ6X7J8]::0GcJK6PQ=SNSD
Q<IXbJL(_UFe.]>CZJN9?/+9[gIYJF82^c^4-.GRD//=\6\Nc7QHf_09;6_,\]E^
S+&Z;ZUVF)K(6NL-Y)dbZ.3LO?6#Q]D<b,T@N\BUOHT^/cL^#5F3\.P-fGX=R>[-
Y,f;F:3,^Z-acfbR5&cZg>6_8E;20T6XQG9OAg64Qa9fO(TGaSX^Dc3d&<Q4ZQ.,
Ab.#7Ug^RP:.fA7c1>2>0BOg+f_\N,Sfg)a](@0Q5&QYQE0ZK256>@YZ;0F]cXNU
5Ze;NbZ0@MbR3Qc+-F6DLEFB7>B-B@bc[=/X1#F_S(?]8&<3+M?@PfN\PXK9N=UP
JcK?>bQ6)HE[bV2FWCd#e1Ra0::UB<NR0,:0=EbJ_;HfETVTE/[I/Y87L_2A=9W6
Vb#;\L7UQ7Z9N/C&)8Ec&1dTCgFQ6<8aTUc=UCS4f<BeJ^fF6fDTE78^A3)ZMS-K
U^4+2.[(N@NQ#Oe:D?=DTVY;#JGIa-R=QNPe;cVQ^g_OB(;;R.HWK;-#5CPAP-YX
VeUG_,D)dB4bfX0H#5N94POG?2(J<;ZZU#Q]\917b)<\JZ[T?+9314a<RMA2T;HS
e2>X_I^A><DW.>-_,KX8fU]][;TZ_86QSIB4&YBYBbRN\bP3&F7POZQ#[L1HTE0:
8F@+c#YTX0Z-GB,UB=G-=&;+.9C6690_Y;3D=KVKIGH&(D0&IC2DaEaS&FE9R0-+
O/&52?H6E280XWP,F\T(@??-](TTCg^(\>^40)fR@NMCQ:\&[e=/]9IO9?_/[-.O
J5c]<=]QRO;\P3d:gIfK=KD/@CHGc_.?F>PQ-1Y=?Z)Z)g)8M4F[?K@_H.0&(D:,
^4dNSL#)0YKP/4:b9^9^@(>[M:R1.e#4g6YCV[RJ3I1.)WG,UX(JS[Jc+CJ=L@Q[
QB-,Nd\(5cSF-fMZC8\:#OI-YKB^]+g2)Ta3;eVR^#@[5^V?3X?S=/)O+JM#0Ma1
[(A<0d?9I?8a.U0(I#O@FDI7(6)NXcG^M:d=V+>^+7d;aU-a@RX\]-3/MO5SNf9U
d3B(5[AL@cJMf+G;GZLQ1[-e01F7Q<5@e:OYE=d:NW0JVP.dc1FWcFgAH)-IF<4T
)K,c:2_+_:-UE&g6NAgO2@O=JPVgCB>=R),N_Y;C:H])=Z/Z=7g.AA_J@KB3210M
3[;#N+[cL4(FT[QcG3.:/V5(E42[AR@Fa&[#^V/WW]=Q6C(_fH:\I:;WFSC/g(F;
af6V(H(4CO;aOE=2#,>g@,]9=g3E14+bQ4F0gX=>.e#2M[,PM<V5GI]]8(G)F2OA
VV]b_()D.J(TQF/AP1OTfJ)&PRA40JD]15=I7@aYK0DZ_.A/L+Z5a=DW4CdNHg\4
4CLGB\I.d,e82fT95Q&FHe[AXG)[TS(R3_>a[NXS6?Hge#7a\Bgce93=-8Y1&b,[
=M]ET115=RI_D(DD22>UW)(9G<6?;WQ4P:4^6A;@JXaL<-@a3Z<@(W-Zb],]6.I_
TTVO_?KZcT=67f7SbLJGO3aPEH#32PfG9Y<DV-ca[7^adEC36DEEe7gBQ,ECCCOE
\eY-C&-A;1?5Ge?-<KJN22Y7=g-dE=>J:^(+=2@H=(.0T8+I(<F9@=Pg<2?<,<Z_
^eN?;(6J0&_TMcX/eC1B](HL4Oe+H7-];I(E&NE[Q3Ke?V+Zf;X>.MBP^NU0E7D\
N51BMF\G>If1W+?g2WS9?f4)#8^2P5((H:I<fHHTd[UUN<G3TV0D;A18ME[-1\87
DVHXXE^#:@20Sc9[99/C6cYBd0bbE&\I>AN-Z3]P7(bSU=I+]HLVNgOG1.LP[]Ua
/,A#3PRHKJ0>F.I(5MH\6.g;)9db=#KbK,+DM/A-eY^C,_>If+a14f2&C>OfQf4L
N=W9Wc+MU&\^\eQ94.gdL;X2Q6^YXLJ8>c)&GbUM]ga12+B,JG()dT;aMGL2de4g
>&3G+FHE6U8K6&L;]A)RBa<d>)BRJ6+60\],cT4UeVfRFY\Qf[d&OVE)]O/I9J1Z
Ja6)_0f--QRaU-+:&a=)VN]1V.C(XaQb)^6gF.M/)E=8?\_=&C.Z\@)H6MZ;2e#D
2/bP>7]\,^Y#bY.3]Z]5@EQ<@<4.11<f-3:3J0_ec=9T2Z</WRd(#1YWVYf6HM-bW$
`endprotected


`endif // GUARD_SVT_SPI_AGENT_CONFIGURATION_SV

