
`ifndef GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT25Q device family in DDR mode.
 */
class svt_spi_flash_mt25q_ddr_ac_configuration extends svt_configuration;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************
`ifdef SVT_SVDOC_CC
  /** Workaround for SVDOC CC circular references */
  int cfg;
`else
  /** This is a handler to the SPI memory config object */
  svt_spi_mem_configuration cfg;
  /** This is a handler to the SPI mode reg config object */
  svt_spi_mem_mode_register_configuration mode_register_cfg;
`endif

  /**
   * Initial value for all the timings which indicates that parameter was not
   * loaded from the catalog
   */
  real initial_time = -5000; // must be smallest then all timing

  /**
   * Minimum Clock high pulse width duration.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tSHSL_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tSLCH_ns = initial_time;

  /**
   * CS# Not Active Hold time
   */ 
  real tCHSL_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCHSH_ns = initial_time;

  /**
   * CS# Not Active Setup time
   */ 
  real tSHCH_ns = initial_time;

  /**
   * Data in Setup time
   */
  real tDVCH_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tCHDX_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tSHQZ_ns = initial_time;

  /**
   * WP# Setup time
   */
  real tWHSL_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tSHWL_ns = initial_time;

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns     = initial_time;

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns = initial_time;

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns = initial_time;

  //----------------------------------------------------------------------------
  // Type Definitions
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  `ifndef SVT_SVDOC_CC
    /**
     * A helper class that can generate random values for non-integral properties
     * 
     * @verification_attr
     */
    svt_randomize_assistant rand_assist;
  `endif

  ///** Assign refernce of spi_mem_configuration object */
  extern virtual function void set_timing_cfg(svt_spi_mem_configuration cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Randomize tW timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

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
   * Valid ranges constraints insure that the configuration settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_mt25q_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt25q_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt25q_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt25q_ddr_ac_configuration)
 
  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   *
   * @param on_off Indicates whether rand_mode for static fields should be enabled (1)
   * or disabled (0).
   */
  extern virtual function int static_rand_mode(bit on_off);

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
   * Allocates a new object of type svt_spi_flash_mt25q_ddr_ac_configuration.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

  // ---------------------------------------------------------------------------
  /**
   * Hook called after the automated display routine finishes.  This is extended by
   * this class to print only protocol kind relevant fields
   */
`ifndef SVT_VMM_TECHNOLOGY
  extern function void do_print(`SVT_XVM(printer) printer);
`else  
  /**
   * User extendable hook which is called immediately after svt_shorthand_psdisplay().
   * This is extended by this class to print only protocol kind relevant fields
   */
  extern virtual function string svt_shorthand_psdisplay_hook(string prefix);
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
  `vmm_typename(svt_spi_flash_mt25q_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt25q_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
?PZd53L=T0ZU9;;UPOfGW^BH=,+\OVaK4XE6@Q&T<fS)PAAT7O->5)V]H.=[4L26
>O9df2Q+:#SDG]:.FU\1TC5e)R>Ac_B]ER=LEXd:]df-1JGGKe(#E;Ib==W=>b\3
U\#-,H&9L?Y>TFB3N@S_Ha]Z?T23RO#.>?UP[[4D\.[=)8RMLKV?EbQO;7-,\?O0
WTJ#BdEWV>?NJN3X+e7&R>OBWNE6ee@5.]G/MT+)OAFJ:M?JWCB2GEQTS>.a^6=5
K2(YZOW@P@5NGBV8-:R4aGOcMe.RPAZEdU\@A(b9F,63@>Z/Y:>ZL@KaUefIWT/a
E5<MPdV__YMVBV:&6O(WcW/X@D1DI4(-_JC2ce4g__JA>OOZ@;_bP[7#FAJV(9-[
H80_>;XPJD5Q37],[e#8AT>.<T,cVW@UK(>^JUQ_]dNM_CO3D0W?>JCE^F\SMFf)
G(ee9I046e?aC125(+e=4]WHcP_]ILT+cW[0YND?(HYKb2,>FNYTT=\AbC^[K;PP
MHD39NE7&78S]H+SO96F1R2NB:\83WYW^)662UV_[O]0BOTPZPcB]BUXAA,Kaf[A
J)GD3&9N>X>AE[O1Ad8[V;COAWEO3d^MPV+PP=-_-]AA[(f6KF6PK,#3^K22@\@)
KDZ9Cc8CEV;7g<(b>(3Z,+F(N+9#I;X6\2IAa)BQ.Q>eNA.D/7WOI@^=WJ@ZBT].
J.A\74-]WJCDTO2ZEUMK)2T]PN)<]<Ud[V>_=A)&MGgLCcN1VC\4A?+2NVUMYa95
,d4ZI_YY4]M<):f>]<+@9)T]5$
`endprotected


//vcs_vip_protect
`protected
/[;<C-VZP7[NFP=PN<;&_G;a80g=NR@&NGE?a:)JGG==DB?90<f:7()T^-=g@/\:
M6T_T.fQMO69L3#J1U1J9(aR[N\ZLdPR11&_(8G4eC2F&&J0-(^RTP62Ba;bX4#[
^#AL31CC#Y5C\[2g6>cJdc+\&g4HG^(N,+MT.5:K<EG<AB#N(52Y)<WDKeHL8HAa
VQbbVTZCX5N&7<&F?KD5AO643^b_U<3,NF0ENg&=)dI5g.VaB49[HY\LBQZ:B1/;
W96(>eM2WJ.@9Y1+;d-<b]9=-=N0#X2;c1TMAgIPeb.Z..@+Z>&P:T93<QC,\B]T
L->Q_dIRA88e9.+18SCICFb)VOJ3<EF[+fG-d8GEe[Q8dRZG3VRR>\R2N;cIfD^O
3f1e1IY&#;eWPX^4-TS@S;WCW;6,3O=)0\@GZ[b138/b,G)9@B=PDRP#)Je=V(DY
PV3QL:c=I_NUACB#,QF\]@g+\0&0QV+_aa:CR]WU3&LSM&&f-A?=2&,4,_DPO,/U
(D)KUe^f?d457f<BN,K(+e=[KVIC6UDHaeFg6TQ^Cc\UP:YZ2U-R,+6cfD_aR.>b
<ZR<:PeWXN1H^E:DdF?W+AEP(cP=#PQ#A4eA0:<1WfFb-HWgdQY6-Z6d)SJ3)>f8
V^WUaFR?=cTVeJ9)&R9-=>g?dX1c]-JFbFYS310:ff_KXXZK-[5g0++@7]fGOacM
@9#R2[S\HgR[e.0@ce@-LSXUg)S+0H7]a9Fg;G[B8K.&.?A/bLC&R68(Y2?J(#0?
3K]O5bBI.7)c-;5Ad6_+W3bG(C_I^d8N[=CO;Ed_PFg^(^eNW(6293T:O0_#/W9b
0PKd9,c0]=6FcX2T.g:Cc+Uf6NfQI-_\d0+2E&M_Lb&ZaO[5PZb=AT>(\,DQY^+I
NM5?H:^M[36\TR,?<UcDgH791gWR(8AVK@@+LS^2+.e>gP+H;#FZE^T8:0)bP:PN
8CUNC\_,&f56EeegZ6F/-K,#^5KI1^4FA1\RTEF;PZP2cbNG4&aDKM/BM;<[H/YX
K8J/4T>Z/KP0=>25&7AFf8Z#<H-#9(24F)]f6[f99&0P_:CM2E,NZeg&:3V87BR(
LOB(^^2IP1CEGVP/B0\-8_6HM8AXb<fG9bBJ,S_gV].b6L_XMV[W(D@4&e4cF;:W
/cc@bTFX^a;dK7K\GN&;N44=f:cMO@BC(N&-,L4]]HAB^:J#g)dbK&a&C#6VP3.V
A@c(dMEKAWM5Oc[XaW1<a1S_+1c@1a]D]]9cR+DWHO1[3TC5R6SC#V[C.P)SaY/?
3N#Lff8)YU=I,Na=]7+IF5::CK^bb,//N3O=R7[\Z0aZL\RW6#YW+bV1cKe=CM/(
]U7O;I-,4LO^Da52g585>M(-8HW-(9b[\2++RX4B<.a+&\B#J7XK-\OA0S_D#N[&
Q^?)SBH;0=U@&0\Z1;IDc2Ega,?5bgTV&7^W.dJDHJ?:3(U9bd(E2]fD_,R)<YJB
^NdbN5E64_/CdQ?^,=Y]O4b?:I.&)#Je88_f<\]?-b]R8/?E,_#1V/[(R^(+O[1f
>\[\+)[<IM+DK<G0RWOG<@.;O91YUY3K&BSOQGf?R(R??L&M>-7MRK96F@LM:cR#
]V_bGPEe+OF:M(YNSN5=-P;Z3[K4B:/KQ55<J9)0?1P:<.72?(0M7Uc/+9?DTM3d
[bT8PZ6W:<ge@e_0IZQ&eTTY6W@FMT@1I&&Tf/d=/d&bGS,QAP4V[:GP#JJ,b>AB
F<&eI0UV#A7V5cH_GCE.&DGEG3C4B\F2,]0FX)S?5S][XH/f=#G-G0+;dNM0AXXA
=>LCd<P#7LbbK0W@A\^VE2=Y2\EW?SB,D8agJ?T_8JHYcFY/[:YdHF#&105#75TU
EPW[IW;WZ+C?R7HWE_gMFdQ=VCafIL(9M=6a?d/B^.ES^R.I.0ccRY7T.69)(]0R
d<F:H]3,.@5,.NNRGSBRPSRIA9f<cY</L4@bQEYW;VR4RVR?93dg2=_59\#K7MY2
>/4g3bBg_d)dH(W^^ZHQ]=<7M\>S3@;\N;U<]I+ZgY-T&PP;3eJX4E96@O#eM634
AEL9_H(6+;UVR(TN(8E1_[93-g:a,d+K=00B/;-VY71X]&YP6KP2M#IBG@QTUE.0
S,O.:f.gM9\6P>+B@X&a0SUVG6HX[XDP@U\B?Z9#&X4M+)(4R6/T-5NH\[,REbJ=
VX+OG][6V[/?U5:b>@LNeg^XF<1cUCF6BD70)Z+I9#<b]a;]&WL;KL=a;,65baL0
32bVP4b[D.=A4]UBSILNCf0Wa7aF.JTY<>E]98(WI[3;VYG+K>RA=^eS:5]PdcQV
K[.0<[<25=DUO8N<M^Vb/Bcd5A0@\^0[JX)ad.?cX+0V8N&_+c7BJ^3(Df:Z?]KR
@+/P6EcZHY)JDQJf>1-,IN/VLABWV:KU.2J(gaOH0.AHQVe+eK5\ZDT>\-A]H/>]
>JM^4E;I?YJa+WPYB_B<;^H/E[TGT57^I=:7(K5Ib_[0YL;]))B7UPFdg5_.fNFE
:a0.IZ)G<L--gAUIdTaSGS@3Z^CB?EOC4a69&-=/EMG\M6.;XE9[5d.d_)]#EN2P
8RZ\@QCK5=U)fdc<Jb^:4\gD57:\(3F=[:9HUCAQ(;CM)>bITR2?^TW&c6#G8X;Q
58&O8<K]AcU>,cL#a.c.2WQH&BcYTBEICR=<PGBI3Y06aRdad^_8dA:f.:A;3(-3
9&B&JW4,4;861I\KC^b2&NeGGZW.G:327>>J?@AGdcI[V-D\,JBC7N)Qb;,W/QL]
Cb7K8DD96^_Q]B;D:9).AcP>O]5IASGAY/B0YSU[3[=BTcVD@d-99d2^Z/?2:+>A
&-CSB,2JSBfMOR-)MS5)d_,HTJ2(_cUAIZ=0@.Q:O_KFd[V;TA4>HE@BW&@+Q?L6
DND&EH10aR#<<c5a.J0INPKKd^[66SWG_+,2+N8J@FD&V9FMaU(Z>]ZDEF7S_(#J
J._<[67UX6\HG:\2URVO8T4\;XX?12BP5:=LN4EJETC+fQ([L:DBM\I;8f^BL=J?
\J05fL2QbXWA+./6^CBcaC4Z[@)6URFJUA[PM,Z(U.^.KFFJJC8#B]d)=7/Y-cR)
]ZKHV_&DEc?[]D#(^M0f#9[O[D0/>/4@F]#;cF03@207QQfdf2e6_[[9a2+?^)QC
BcR)))506=7YP_?O6M8<:X:6IO(#G_U^dK=DbaXQSY:PP^K,(0=8RH_TYBXaGF=Z
YJ^C9E(EM8bHJW;^Y4:E4]://XXDS_:M6YP6S7CM).EHa:GH.SCPX1[&WS3:LC#K
0+G+.[@)-(G8NN?W)df(J-7Q9QBH_=UJ-DX?31@NH=)KSZKc6;6bEOQOV#CSQg^^
LZJAM4RRG03HSJU==>YKB(.V0;&c+3<C<6RMACTfK=?Y6H5W^6META_=(P(I:YFG
d@NDd)^ZgG)Xd[BdW.0fQ3HZ\@daUAaHV;@W@.XC[#W6^VIT<4Mc5d2Re5RM8(8&
dKJ#@O)Kb\C;6<aH4E;XU5d5_,[R]Ab=;M\;N8:L&;0b-d,#05;7(f(G7W6RQI9L
]8OJC[8[,-1LFL#/OBV.U475^C2b-096PJM2>=2<fff:C7SS5K;-0A5,((f&]-RX
g+<#-MEX-/+LZLXLPQg<G)Ng(LG7@)1ZDI/Ke-V49X04&Q^3&UcJJa<Daf[H:;/c
GeEWZ+6K>fI:_60PX+3]8Rb8Z/f7U/:A@:f]@)]\MVXBc;QO.3SA=G:9C1OG/YMT
+<dC(5X+Q;<7Z]-7KLPa#Q&UMB[gHR&fXgZ2UH&JaSTW\E:G.-U_K/0fDf6N:2g7
:EUF:YY?KEaCTf1Mf3D;ATeL0UI8(@ee&R6#XD7-P1g5+1a1@\L))+7Nb-2UUM.\
O/SI\-Af)#S@6&^#C,1??_C>UbSf;.3/WF\7]VL_b4DI#B)YV6Z:AU28f5&2&>?9
Gd:;gd@OHdW>X0=/M@9IaZKY=8gVB>f01dF3Hc#6;HcE_PeR<T4>-]0\1U8/R.FJ
/L_56^B;Wg;PDNB)eFN6cDG/NQ7#OfI/B=]:eRNgd4\d(FX,9PKeYYMG=L0<e6,&
VOW&=(MR7M>8^K,V=.W,GD&]51\3]-0fd0J.4dG)8N]2&3;b92:E1^QK8BQOGSJZ
7/,\QQLD&6#G@FVgcJC71Q+cK=.e])>Ig,9YRQdD.JY<YV9U3\ZQ8E&4J/7+MXME
W?UB>XMIXZ@a1f&UfV]:CY54)TH,@^5:P,_\&S0?FLA>NJV5YMP@4N6QXY8_D[W-
4?gL4A4?W2AXD#cQ0g:(<V3B\99X.&HaZNf&Z[MM3-(V>K3/XLK@G&8?;N8U1:;e
>/9NCbMc(]c<KZ;_2Q?J<R&VF-gAK.8)B021<MbLSC6EOLBU7g(?;;/@A#G)>Y73
Q[,fRFUX^^8g+e1&AaXcT3g.B#/X;72bQE-KMWUP>DHV,A]g-D@VI4^=P+Tg>OU(
fK?<1G-\a,fcL<&H:Q>0KPU57Q9MX8F1aQD1P5S=[>Tb<(&a)/2ed+9.)I_WH[b]
.U@^5(OG<I&7,N60YY12HAY#/7H^fG_f&P;_U2U-a,.(bZAWS2V9g=J?EUJ&<AdN
C630HX?QNC,f7b,:;g12L49EM?BMf=AZ=P/-GS0ADXPG0UG&F3(^0fZ#DRYA8=U]
2VeDNW06OA6abP5g.,E2#;O<U#@D8b::@[FY\Z&;GKYTY<DX;W>XX^.?^A+gL2XQ
)F2gSeP6O0([L,[6;cC,_A)(/\^W.fJXP@M5C3I7VAC^NQa;ZSeWMQa4EB_WXF)O
#:XeYH\S;1fQ/^aLOC7ZcZEgS#-H,F)^3TB)#-1&3Z3gR:(7c(N)3C,F<]Sg/a1/
We^1GQ[T#_M6LD/R-U\P86^e/98?eTaLK56ETE](12Y@OO@a>#P6EVAN.3;(_]CN
,;UMeb&@Mg6A760TK[PfJUV:1^aM]d#71#BTQ6aZZ;I&gQS\DN?GX<C#1-_I:c->
-G1@f9K.fL)M+QZ:^)5J>C/@M.I6G9>I4N=b)5_8EaB=Wa)Z+\F_OOC6DgYWX&L@
:=d7d^Z15TR#V7;>MJ+)JRZ,SQPS6OAfAZ5Q[1Z+OI2Sf2EJ<O4O@3<4&?gXaIUU
2O7g2VCUgH#BIVd)/V\M?LR2&>8\&TJY(V2#LZKK6]4Q;S(/gVgK9;KR=4,/MJfN
,.T+O+6?N?b#0RMW?377KQ/5L[-[O;&_DH#T,I._d?I.,[\Z+\4/QT^=<04PHf/e
a+Rf#L=\.8ES.T2?d?^.]BcO385e3dE6RQ6aE(>DB=d>>f&HKIU>[[A@T^@MO)7b
:7LRJHZ9._3+0>KUYZ(g5R=ZA<P_8:[M8E.3,_.@<21J(D33J7@IFaO(d\IR4@gY
4]]WXcDJQJZ-1&f9Yb,<K[-PN=<g[efG4#ELB>)F0?d3/,Ff(9&H2ScEHOb<6\5V
U;T>=EdJ(A_acaf]:@()Cf45I?BHYG<+I.)aPYBDP,RP[^3de=>OdHJ1=4N4_ZPG
<.#aF1Cd(YF6Bf.#?6F,GY;7)C2##9_N4=5+_E^4B]c]9bM]eE+.,3bB;G[SJ^RV
I(66Q9d@0.=MPX6N\9V?X3FXQLZZYJ2R&K[UDbb917[b1Be<HV?,);.#Ag^GG,e,
V&B1_7aHf51BO;0^CQMO[F<>)+L<8K]#E#d2-/GD(B8P5X[Uc\c7C1edKf\A3J.2
I1NCD)<PO@&]IdS8:#KDgL.LdKVW1SNX81<M99P3DYc\]8SX.G2^f:dH/[S86gC.
Cg5Q(A6:S@(,[?J.W#^SJaD>cfEUe7TMAQ0eeOMYDW7c;Y=Bb-?_#VN>9<S>&;Y)
1Q_A?K+@XLH.8S#>A,48;YfLcMMeVQ(]CGES<](149a?+NFg\?#+_R<;).XG8\cY
2Ib2Y&6D^9J)TT09S1;bFU6ADFe62/+(KCI27S8<^+2X[_B8N>QST]QV6X36\A2;
X,;@YZ4;e?-gF4Z#O>Ob6O#888G/f)^Q=?.<Od1Eg@)LA[GLN:.>Ug/c-IFWe6V/
VZ9BB(P;4F-BM:O;;/b+=ZHSI8KdaFNcF-B_.^\S=c<37AFJX@#0G.b.O:+-KC8W
TG3MU<Mf=6F]K60.<]\&eJ\?DSTHL7(>9_0W0MdI.99_+T(SS1e=M@,dHXLC)5?[
0KcH[,C5@aWc->-&&E[JD?H.Yd=-D8(e:@\:BMfMZH)b9YEb@Za&LX6:X[-g,F#J
4>Q+G_T=5YT(B_E,[\0+9gVB^J@/;XV/YTb\G14Y4L1J\]Ie+8Qb@.;UMS.09adQ
D,QK1(BURe5Y-Y=Db@J<f@)9&<D,NT6K1VEJe#+XTK,bZc?YJCR6L>#+dZ;73QK,
L[)&<;IdCgdHLd000I+bPN6SG13BReAOGK1)T]X]4&(HXXaXZ?b3@NHQE@-GKFd8
L80e1WZ&^eT,bF&Lf7cBLKHN4V31I,&EIGcJ\GeY3A-)-HYGG6#fE&4V#.,B8=,5
Q2P(c&>\\S]\Z7a@3:P(Z]=(GDT(3YGW1J2Y2YR=_6HQB0;.@g8G^C_3]DFL=7]C
,<^:6O#MUP>e2T@75f3C.]N]BB8dE#7FU+5CA(WQ^Eb>)4L-JIg(-#F5ARZ+^50Z
X9F;_4W(9GMQMg<NXTcAg#5_:0d++?Ic2_0Sa09_HSAE^+KVW.YXb]BQHGX<T6I=
(I#HOE.;@0:_/@MJV_bc2WZ>ZOXH,2E]6?@J8&cP=^.P]Y#>BaSgIbd.;@30UUeP
c7,B\2.d+=/[LB0f8Z20.)RAQC/94^QL5B3JIVXHU43Z2G35e\H+XSFJ(8HH#^;F
1?\T=1YaB.\3=@;d@@6V\BGGg,(Y)69fH)Cf9PJ@JP#bGL&d5;+]EQa:>ZYCaPK<
e&7NHeaU]31aY]0dd=@?JAOH:S((P?dT)WFIB:UPZaYL+[ETF6#7S5YTG0c=:+PZ
C<W?7AV,0Pd7IERJI.,_;TUY^Q.IFVM?8/g(HDG\X77c2d3(7R4.d-9;FP7/D@\L
I?f.1B:1bGJH/b.PK=9AY5-.F\G1<(_Q1<7@@NeK&5QYH4SFX?VM\f.@AQ:?N?KE
bZ8dGb2Ue]fc0ITLSLU7dU\B68Z/I>9G2GP&0)>98:FdF]5RdXZcf2,GgT^ORQN@
JC,(ND[RMRC.(gYOY;O]R/9IEJ/Z5XEXdJ>KFFAOLaeZ\[)<7ZMeA/_&]1OJE,S@
1F#P4R0_)PQ0ZTd>3O4YYC6#YP#g.)DWfD:04)F0V9-CV0ePUXg@-UE(.\X8?PGd
:G&AJI?]I2QU3KgSCCD80a[(ZN;,e((5&Vc#g9c]Dda][@0O2DX54G7?^]SF<)Y0
?6;9Y7,fe6Q?bC@aR0]\AUIW3-d[QE\\)U.J&VMUHgPfHL1=#(EI?#X?EN,(W]2M
\.9K#CIa>J?D8Gc[B84JFc;&UPBQRU7C,Gg](-bAWP39dY_J7U=J3VNS3DN,,Q-+
bXI?JP1+^+IGdK6Z;UN)Z_+7ZCB)LI>NO\O0/Q]U\IcY?A/VdXH/[1)CbFEH67fa
4)]14);JY:B;9HY,P<3>+VbZHD0b@S=43bZ;B2-02\I_PEaVKfS<)^c\Z_/3>PBP
QV31V39:8HdCO3Ne08gCVMc<=22CP>J2f/(XOYEG<J?b^X<Y0>CNZ@Pc#2f&d#^K
MTfgBbd>,(b1?b=&=,5Sg:F^M-[R=-/>^U2b[]<3Y7QH0U>1a3:(M\MQRTJ+X@1;
GN]MYZ(H#]^N_JfO7F(R-@1F+7f\,KgfSQ6\8PL13IT)2a3(:U.1WY,PVQZS/6Sa
KcG:]:7E2+f^NaG<gQ/8+#V<Dc-9(6/O+X.B#I&_5@[)??NJ9c@SMB0L2993J-TH
<\ZL^AR+9JU)Md>?06bHXb=EL3J._]G;Q4]3._[KLRbANU.]7b=7@?f4)L)4M)FA
^UY)<A_;DWEg8/R>fI?9GWFZgXbg5QG6c6EC]eVadcT:VTLDN\HFZ>SUR;6gWB-c
Xa<)Xd]:)8\1:9UB]X7Qgg;C>Hc^aea;C9+MR-g]--B,S7)0?:4M2>4+SPO&gR&/
J6X)LDF_e+6?3@/^.NFW1/Ie@]e3:ARDZKJ1ZIHE+NAIQQ)0H\L]73&GNCTB_<[5
[K9OA,R/BEd^73fQ1gZ3,2_@/e6d3gd/G.9bd51a-#:beggG0_b+8gQ8^JHO7S42
1Z<AT.8cJ#W#/46<a[0c1Y9EKJ7,<V4+XLc/GI,.)^8N^?_PJ.TJ]WKY8LUBB/AK
I^U4egQa;SF;BS]ZWR:;/\/N1<He[#-Ee\T)GT9BaA0?@JZPJbaZK:/&)0TeW&=H
K)\@e_6Q?68&?<W7)+3b<H+,:eBI6/fXQ2WX5=8>?4YR?YR@_0d+9EX5ZLaeI(ZX
HI(^+^Af+.BgO@@N[>FII78d@2.0U0@(cA&;<EA<W-X6RS&8K@IG=3gO\b=eUMUW
=;MaPg[K;J#0C<5T8]V[cHDCUO\&c<GGb1:-BPEbV,4EJXBFXPdRIH-7[D@MR=M:
I2H>Ra[CD=:[K1:#(9D#T@RUF1X[1+U(3:)?G7J]_Pg1>P/41WF7YZLJH(42eQQO
+g+(\d</SU/0RTZ0C@?06R#KX.@9N&6<^&5UFK6+P^BGXCIJeWbY>&-?ILR3WH;.
UIaTc\_]7<5OWbVR=)<9E,aGPaDC_3D+NdG56Teg\_/K12GVQ8Cb_E2)IfMBWNHJ
c^9[>J3XDc-OXbdc>#W<9,\E/K.)TGbT.ee9?_[&EDAb+BMWH<TMH/bR@YKR4;J^
7&(H/bL:af:P@Oc>N(.X2>=I:K\2ILWc+)/g6Ae_GJ(Q5?[\),;RPK4N+N3]edG.
:=f;FeaM<-PP;0K2OV4&.V8=XE&#-7G-,^\T:d3fJWD&#WEdY??)YAR#&O_#X(-b
()H]PR\B)XN,1,3RQ??C.SA]S7OWaIa:DV)GQ2_Wf7\36C2T2\/N45c[L4AOfEf+
A2#):P]V:ZXF@Tg0&[:TL8f)NG&B]g#M=+X;A/-)Sc/)QGH8NJ;.-EgLO7g)e<0M
f406Y?SP>120LaR?6TgbaKQAfaVK<T)Q8HZPN2;N/V=G^fX2HD.&,aaIX+=g;JMa
=)[F,.e&b7F61FfSOQVPM7Y(_/-+;E741+-U/6YF6?7(@dPLU?2E6^Z01YTD9\gc
=W4d]03W1SLOOg#c=D:eT75Z:PDf6RZ=Y<Fd.:?#AD-b_Q<265HY],S4VcTZb2]+
A.II<A)aeKWLJ.Y]bQaE)c^e7aGAabIAAJHGd((]E//V3IKcJ_AU@b47.JEd7VZH
6UXbF/.+G9aM<f+8(3c]/2H-M3Id9ERS-\ZL5P-^HcV:BcP<#C@DcAAc&PR3)@]F
R-g:T3#5Pb)d_OOOQM9/5(d[.4F><GJ@,9,9MS6;B5]2/WX&+@aSUCRaU(\&EbY]
<cK?E/XN,\PZWQIRPXW1ca\];1bMTTd,D>&.SV=2Sc[>UNe6dOL57_G;>Id2B+1,
Rd>36#?<eQ[g1:D74#&.QG,f42([(4a8LBKL_F9-BB]KBAebFT1ZDNJd4\D<;V+4
KJ1(3=0cD4Te@?4@4)0f]A2=>^D0FZ1AAIeVYd&GD.bU>M09ZA)P<>#DT]:2dQ(>
\R)6?EKdaae0)UIK6(c_THP.&-Z9<fb&]7)XDX)#SA:KBQZSAO2,&)bd#NAUHW40
66)/]<.^)2+97+LC4bPEF9I8e5&?AB=MWSD#&64]+EL7#=@_OHYGfFK/b3K:)d.U
WF5N3M<c==:H+\^6O;4V)YD^c,][0GgV@]b(;:^.-Q.4<P@eSZg#PgfgV3K[Ud0f
FM,R43M#[5__bgfgNR@\=T3E<RIFHeW^--AHY=&a#\J8HY):W5QU/&eFMI[6gV77
H=UX;CUd5O#AcIFegS<V9BZ@JTb=.=T:1./G-?OQ^;:>Xf(@N4dM<2^S\ZJD@4&2
RWV&326][6V),g7=>\CK3,<c[&H-)EX9UJ3.De]M4\>9/0CBUKddE62^eECP?&1.
cOSCcI(5f:P8(^dKa0Q.,=5gO-FGL3.GX_++MX]f]:ffGUJJ)2:C<9Q_[SYY&G+c
Q&[E#C;GL,fM0N;4/gb;/N)&6737?(()KSC&]AJ<?KTdEC)0OD7I.B+:,QFI3PM8
H(4f?fJ=,T4@b+VM6M-=P,-Of#OQMG-ON/LB&]^NR\eY@S9dT;Jg:7IR191UM+?c
-JOXGb[RA6U70]RKB@H=8c,].OL6ZT\S554K0H;M+=6GbecU/0F4A5(WLcYZ3K9O
N;_eMEG_=6@NX51,2g:&O0XC#T;L^LNBbb.5AN9BOK=7fCagWc@2@V#M0ceA/81T
A7&F-XHSSVN+U:Da3gBMLN.Q/4>Q:=@Y8EZ\C&)3+]-OKe(S#faVS&UJ#R2@1#NT
V>:A0UN]]>aM@\c-9[Ka>:/aF23?&=69]IZY6X#Ee:(ZJ/UUC=A9(&XdX9&V[/\=
E]-@DUVHY/M<cD?eBN>-SHBL?RGD^a4Z<]a2g4V]CT/F^+cJQ6<7S4.9=<<Yg6B.
=0ObTQ@3]=I49ee;#D@_c50Ed_FAA,DNG73f4S0JC_DQb1YH8@=JCRgQVa;a@ffb
[GKF3Y(\beN0+=1ME:<2)-B5b_KP(&X_UaVS3]8Q@JP_,M;V/8EP(01,<ZYCNN^>
:-DQ/>3?2HG-&ZbF^R4-]\6ENW,XV+(A/.IeJ^MO?4bg&_9RNA&:6HHUW<8@FW2G
bP?]B[TOUVX<:7/eZ8M7K;<I\R^FO3[5/6<:Q8Mg+INM\SI[E1@V<C6]&2-+?EaN
Ue-XQNfCMEbP4VZ1fFaTB_NXVa,=\D4,)F<c<=S358?1OY_BP#ggBT:/H5,A0<fc
1I47AQN--)42:A;8\W3@?K<a--Hc79a7<,dfC\K^U2M:)7Ecd-6#>Q[cH96Tdc2Q
_YNO[HQC^-]2agR(?]6#O&1<[AeE:dTa&Z<NOZ8T[/:6ba7=g@TdG:gP^W-HaTU)
D@#J4-<AM=9b<<DPB<>QC86?G>--NO<GK0W-J/5g_:+&Q]_7[CZJ[>@#fF@f3,@;
D9IeNFWbX1WHe^ZT3#E8U4C)]?E?=74b/LYCT<AGY](/::g^_RETLQS&cd+Q3/PI
aZ74gfI?#<LL:/Q(eSWOBdG,[KWge[<a,ERSQS:6>ZBcOAABV16HO24^30CFMd\G
^C<Fe4]TE\BK3C=-=C^T)/7RQQ<DB(@-23_L_g=dRQ<P:f0.bNe53WSe7+GAYGFg
6@_3?a[(Z/Vf]V+UE:2dH].SQYY494U3a[8,&eA57R</DMDLGS5]/VDJTa[g\Z91
Y^aRJ,Z37,C><D@9\7L&M6S/2/+(MVF]VA+M,/a&)HT@2>72GE14DgGNP@K_53R/
A;PRYDGCWVN_=D^C3H^7d2.[GX2aR6TL?03RC:79a\(ELP)X[QZB;T7AUcSe,D/#
DVH)\;_7W9]@#0KC<SId9<QI:b[S9,PNG71Eb4\M0^c_8=6]7SHeY?^gV21eNe8J
0.@_RS7\.N8R@GH7-)0XC^V0@:OU#[a@&_6#SF8ZCGTHNAN&=.V:X9:6J,cUf[b-
cdV[J5==H=^P&A+=TbeeMg)G;9/M?D^E2;0Mb#Q<O.eWOZ>FZ0Na;:RLK6<^e&CW
#V@H3SJ7G_;,Rb,CZ&?P8eYX]=^P8CZ\HJ/3+6[XUTg-<XX@2a:JcWHT]Y@./eGN
2&f;dZCHNP7.YgH]5+PV8Q=b6<3-NL[KeG)c]HGI?#^Le\P(Id&[/b]a7SaabK7T
59@6FOg;A8gCBd,]N>QUOKD\6BO=6V84E/CgR2?8QY2AK@A<Ed@bCVFfE0dR04/L
VbH(/d0[E[?:=1O.dMQ.-geZ)b<QEP#,9CD(X^YDF)^U9#^V&gNXG1N9BZU#:Idc
RIZ4&875Z?(bPf3J/&H9/[Y(A-Ka(_S>b<f@G0f=JI?BT/c[P+TFA[[?^Kf_5:2,
.3:A6+?R99C6g_=H4P@(=LN]]O>7)D51S88?7F?SODL3EVHKT\eO7Y\W(JNLLVJR
W4a/<.NJ,H2Z<^b^D<NeMfc<=YW/;5)=c8>HUPRG2T.Y1@1<SZ)0V;6:6,.Z6c@a
R=<-+]U8A;GC,<Y_4QM[;^Lag^6V[N]Nc\X?#><C)aGJT5NQES&(a6I8KDS#/M6]
WcC<a;,MD?S#7C6Kg;UO[M>_JK(GQ;?K_38_M[]ZFaUFb/]-Y6WPd#a[,CD)F6Z9
).]3CcC=f=JF>1GU]3Qg53,_UdNUd/FHFgQE9Y[69Fa-d=A/8,FXUOTWNgg&cY5M
aNK8S/R7d9_d8Z=X67(,)Ua&F@Z<Q3GT7bRdFD-BgUcaAJJUBI<_9-7?G1cJB63V
RbIg>A3<R^B3NY^UZcTDO0R?^\3cd0MCR7A0FA_^+IR#V?;PVeW4T\)PKMD<(D<;
g&CN0#X3Q-cL;2C_bdVG#g;d6F+HCbcC#a[_Ld#A.+ceJC62>59KYS5I&O8ZUHF?
6HKgDI=bRY0)58gHQ6P#gPGQEXFg?JZ;.J]EI5F?;dY,)g59M<Ladd6/V&(?+(<[
\(WW(E/9bNH+ZAF@Q@\=<1KTHg/O:.O])?)M(IEg7G:cX9LMQ\RS-KAC#UJJ(PHB
A9W\eB\K(SX_&<SHcYP8EJ#E[&A^B.=Hd\.T;U+Q]Y+a>[0a2W>GL0-9<WP+/6#R
N.,2@<_TgVLO,\IR+OM=J2?[1^1g?gR?OPSM:MIMO,fXV\Za#:4ac<CHMZ[B@J\K
PV#2LP1_\MXZ1#E<5eaCbI-:[^H>31;?3<<CW0eX2[SAU[\](3/PY&SSFQP\8NbC
T<dd:@:BM7bH;SA(=_J;A[Bf:+9W17&5WM#RR<dAW[@.1>EL4(@G<5,K?QG4SEe=
^\g?CZL]=JgOg<YF5Hf-]#=\V87YR1MbYf[AF-XU@M/B7,#UJ>@E.6aNAfa4_EVQ
#^c?N5?afC1LJ(W832JA329Zc>,_]P)_.K/GA65]eCb48E[RbXe&T#</e6K;ZM3c
92KC4TDQg8PU_7e7]HRa&JgBDSDbf;gNI(^P5@fX8=@N0)WLNVIW7]R#@d2WWgN\
O[,]aSEcN^?@O\bRWTTT>g<1.eI9c9W)KLM20@TSXd/7=\E7+56FP5@A8_ba?P5;
WLe(48eF^]gN+Q)PVTN.cDQ,J/6.T?.+SN/JJ.,CA65Q]<7_)+)MZ]94bK\O16)L
T9e;#341@W2/[IdZ8?@,\+T32;IG6_.JU1++#B[+N9^Ib<1b;Q^af,C=FF96HQ\A
c2Q@@DFYY+[KRGYU(_=2[7Z3dD>Z[XQ3cC:;g+7+7TF9E03ca=746H8CT_JcB0E^
ZcPC=45J@b<]Ud\LbS9>Q+:C7<CU)1BgUI@DWRENc^UC_(A^&6&9GCKT@(K.0Y^1
(KN#9G3?:+GGZ5@,Ig5;g_Y]@TVAMfRT6L4(c_54BDF3a^cE73F.<=)I:+DCERN+
MX8Z^/f=VE<?:+5bEJ<>C-5XbHS56/GfQUVNKVgb]T?>RX#2+9egPBDg59XY]X_2
VNAOUS^(+64gB,MK8O=:7(RQ2M.4K5(E_E)C[?P,-Ag8fP5OaBH+)XcLGX@89^Z3
-7Bb)A8EQ+f\HTcN:I,02[O#/aP.OQK#ZWT8^L-e#L9U/045LeP[4</QI8,MEB5>
egA0RHH88M1>QF2ee+)24(J3P2g#dF^ZQI+L,TS_:gPDT7^.SIL8>0R1e<[3]gJ?
2-4;@e/\&M4^BD)-+3JI3S5X[<Q2ET&@DQ,@V=&F#P8__SP5S&6[=4P5gfYLgFFd
gUZd.?8dWL0N1=[:ReKC-bc=a+V8X//<V64^DR/(\Ld0b5ZfQcSL&N>fYQHDKU-/
A^dMB7Td.H1<3Z6TRLN[g=(_87GM)Se\P\#VZg(LRZDeB#gUP#6Q5:7.P(O.fM@>
bPMO.>Bc6TEYbJ&LI/L[PD-d42Oa6&^bfHH&Ge,Kb>3ABNGJ#@--[>_Q3[5\,1PM
<F.&Y\8V3e4J^eV-eWE1U]S75B@Vb\a/&W#L9]Md<@U/IN2634OK_YC2F\6(RF0M
@BSU]N,S#AeG:Z?F+fS.RAM3>?Z/,,>TbXRY6]:ZFdS?Pb1>83;])I&Q<9fSBAW?
(1Gf84U\=;Q6Q;a:Pde>fHGE^bPa>?3XA0+N+YUPO\EYbcT&PF363-N>CHdESDCC
)/CH<aM@W6&.NC&Ge0#V=-XARRQ+D[c_dO8#G9P^F5JAHW=\[I.-K@2U^RK;5GJ\
Vf-G8eIaQ0,2,HKUA]^c_:PSV)BBbO,YE0G3^PVK)3-)Gg@MW9<<;181<0fWI8C<
G@]A?XUO[\4YG-FL>3ZbIUFb6AN[&U)f?6@&[a_g.=Q,^_:;9_9_E)#B#_TW[AD5
/:(,H#:94EIX/Q:QUE2bI[;bbJ@G>aE+U[#IZK/0@\\V(KFT5I#-8O5gH;#\-:0I
RE)57OAEX(L_?&Pg&K-IW_J)=]?/f#fQS-88PX;3MGFT5JR#e2b:>9QJ+Me+-U6^
^>E[U3APbU:J.9CTML@>BLYXN)6f#Y7,B>[CY)g4Z;,/HG(2?T6Fd56ZK7?V,YN+
2ZG6+K6]0CeST@H1NQ87,PH4KX36cV\+3P<7M:IHNB#OHV-.,1a;CO+d[)=fT\H3
79Z;CfNA6,RO?3K20]ggSCTRO(B_GLe7c>R7R5;V?WgZ)DX@.?\&QM4/)eC5([(\
_;gB)=I]#ZUG6;+GM&V_d+L>JML=X-C#fTeR;@OI.YH#Pc6e\=f48=g[@##AIe(#
Pe1R)7W9UCF,4[95/NHHNS?AQRP><GHbg1d5U7cN&PPAb.N+bbc?cHEc[8QE,d[(
d<S2VR_[R4Qf8S):5W&V.RDT7a:ILV):5RNFA2)g,A5;#=[WO@G6dbSW_Ra5:5IN
AR;J#IEQ2V@]?;XND52c4aJDM]UF\dK+ZLF@3PN3^X^6bUK\]-7#>cK^=@XGIdN=
UO:<-C6acOJG(bN_45+Sd4;<(P.X6AO7&>XC<JZB5XePPJ(B>e&2N3XPIWa<IW19
N.cP#S_LF5ZSb\J[3GKag&SO1Za&E)&I<U[/R@01CWfH)D]5#.?2?\Xf#L?aA3#a
)59d@cb&:.FBU^,>Q:#I/Sd.I9,dX8:f/C:3>1H5+?+?ec-N;aaS&_\X#C3DYGG,
feTJg.[Z&I.GAJeX1H,f+R8P[5Q^@4V6QKSe+40Z9#IZMC+?R)1.H(L#ET5L(/B1
dD7Ee(T(cH5I&RFIEe.f[=AGETFcOcegLPJ+EeB_&9CZbM-Wc5Z>8-#38C]J/B:4
3ZddbJ^W@BNfYMfaAT+Te6J2[HIC],8G&BHaF/A_TK<D#[U5<K?>NDS]A:@P7[bI
8WJS6BJ76SWDW<Vb1;DUQA_>0f[[U[,7L,MH(GU6OX<5#<U:T=BK9fZa_V[;4/2a
aN(HLR_5\((R1g+N/KA_F-[Q@e5#eJ,^a6(-H+bTV(WN<,Vf@KSR;N,QP0GeCQPO
9fLYY/53LZV>3,Z:XdI=IB8HK,,-]+eTbGg/7U89UOO#e6:UBUA8/,2@PIgE,M@R
#WN63L1-)^-Mb=.\3)YOP6I.<cPWL@=2X04BM@92:<Q\4LYc.cPAgQSZ^J[]b07Q
Y#>7[IBJeP#M<=1H^H83^39XM-Je(6<@H(\H3ZZRg/X50T8^QHJLF;3Z,B_E]^::
,dEbL,#M>M6<=Z((/EgCaRZ+@WI1,gDR?c_E-3=L1e#[\BIDE(^MVHc^PJ-7O26f
14T-dL;LSIfB,Z04Ed6Vdc=E_W]_E?U6/6[<>H5:X&J.LT;@9;ESBG8ac^FUN0?;
<@1-g)P=9P6\.]/f4KFS[WYY4Y@9HT:]9UE1S#PBHOfI_ZVW?9SM,KbEPGYJ]-Q)
UX8735.6eVUV/VW_2=Bg8<D2&(8b?UE+U6>?R_NPX\:E2cZ@9/E&DWRJ-^-B-5N\
FEG2aS>(496BMI:A)>_-]RBdP39FA<@\7,DMB)SRVTBE-HdL\QVY?E3XJJeR0,#c
&WOCP?]HJNAIf\[@T#CYfBUDB(A@O7gd4E2e5W^E>6GTTL&2YdFYP9>^Y0MMVA:]
Y#/+P7O(_83^LXKg[NQTF\1XgaS2WS7I[0bRZ>_T]XfJ>7d@;@DQUT.XGFb_<>g]
L0eO_E3OFPQc[e(6(+(<:IQJ99-;R)N:]Q\(-TZ+=:6@29=gXPD>MU5Ic->fLD]<
=4bQ2M/bQWeBaM]P4B+g4eGQ_^UDJ(+dF8++V8.Z&Q:O>0QX433?UZTf[M60=CV3
N1gCXPWB?@/.43H0(ITMX7&6<[NgQ)^67-]E&3.<Ld4WRKNX6\DRK4+@+0I<Ha]:
<C+?S]?+QAM?Qb]Ff]@EK3M0cYCgW,0;L#B>J/JB&TgG/cCK>be3TF2+ROFWT[JU
5/DeSZRBC=GJHb\@(e9S24fLb,P)?Of\TWfGJ\H?J8bW3\:SM16/#fML9?c,d/VB
)3,bI1-<+Fd;L9EeJA0.^5032OENge>WQ3:ea>I5P:bd(#)25,6#IRA-5U?TY6EN
S<8:9)1S@+c;[;d^C-HVD)Q,c=&>T(P@DS]ZV]5b8^_&&F2?F#YaA<?e44@Y[Q5.
JLgb_\MUJ?4bVVFg+BTee.XbSK/)&UX9f+R82XJK9B.I;-b9\YW-YSaH0W:GcC27
#O/^7@)N@1[;/&^E@[HIJJT0IX=C^H7/(P1@?\.BC3)#4S4beP8BggSGMBEDE2QF
NXSWLY&=6)7()Z:fV70#c<b>@3RgJ#7S[,X:ZZ35:\8g\;]MbKCPS>CK;Xc)TQ0T
5;_U.&(].92X(\<\)LI5b?E&&(07J;H54QTM7O^DXZN##UQ0J6aW:TRf-ZFYdA&B
CITOD?c4?N4O1Z&^1Rd#^:J)&,,_\7cY05>c&TXa4-eW[PI9T=R]O]WEQ8&GA>1G
8]6Ad:U\2d@b?VCUG3@Ic[(UN:N2DJQ>(bLI5A-;\Y9:,W1)S86/>g)R+>U^E+24
N;40gUY64:@3M4gQaMPGO:=57QW6?GZWT?<VZR]^A+O8=HNSA(B=PHbO4],.gBK\
[>ZPP/V).MN#OJKLLb;6KC?Q\B4,C:]d:2Y+=T/b6<AX<c&A1K+Vcd=M=AZJ:Z:O
#g_^b]f(ZJe1B]UCJ/3<UR^V1>IZ1(K4dC[T(e@8Z-O:QW2.?b6.OY5(@SBLS+fQ
aX7bG[,J4^gG0.+.>GIFPBB[J_N2O55QN2HFM\F#\(&I5>\FF3784OJ>7.KG>)^Q
YgcZ?_-Eb]>&N9Z[E&96I#WJ]c4F(_AU=_c\FU:_N2)L6>a>PLU]eFJ,O,GPW55Z
WO0@Kb7Q9dE@BCESP6OTON]=\?9?Ne;a],:/>;ZC)Fg80T_:Ka5;-Y7V)::]=DD4
eDG5PA=-]4MW5(g0P,0PQW6#&_>RYUHAe3G\6+e>G-VGB@c]GcXYPQM[BY5(?V7/
20)O#W1#<^R79E></.>6_N.a4:<f1WH<TH>]dWVR7NJ]50)K[E[1I5[_U?2Y]#:c
1_S,P>A7?P>:T.H)ce&K?)CSVBYNdPCDQ>?R_15Qd)H=_:9QgGYL1[>FR6\fZgF\
QP:LgT:6+\>J=f6441LE5Cc]SDHcO>K9dKecg>GGU5_b&b5MbQ38(Pg?6(^F[H5d
g=88Kc:1a->,9NL#T^IF]0UUT_X4?_I,9CFcZBE4Bag<HN5P[7CAF2;4B0GS<CDS
1.;693g?Q^eBV2U&E746JP?6,:#=+b8a/HOLg;;^K&B\WAME,B#QW6?bK.QN@THc
7YQ=VK=E/dN8Cc>&V^7+M=M\0E-Q:f\VN5;E@AOJ0da=[ZJCE;#^c?Fb81SgD(eZ
,L[(3DcP:C:FQ1>4W.(WW2WF)+(2T\fNDX5>c/&HL5@H(9BR<JT;6b^;THd2VL@c
U2e7ID=M+dbQU=8g+QBS?,\8I/]7EJHI+P+U(K@=Z8-YYTgfFN;F^Gd3LH#U5Y7Z
&7cY^:1.1SF_5ZGD.E+6FU<)2#^X@Q29S:c(aMX,D&DLXA+W4HWPA_ESU4C;(6RJ
eQ22A@D//0f;9+&5+dVEbIC7[G+?,C=>61JOSQHeO_6O<e^N+e[OSCEQ&6GZ.WO9
e#<4d,OXfE@MIOG(S\-0N#ZG-0@Y=KbNU/EM?]N7I:]MZRS6\-AOY)e_/T=F(;VF
KeMcYEE-&XQ=W^U?<TYL3.R_If3#g=TPS0.,<]_P8)b_\R9S9BS<gfG,5MT]/9G8
++X49J>1F>O>C+ZN,GfR(2SMKG3O9O.5M;C4LD[F@1<[8U;ZBI<bLS&N:_M]gR>@
eFcEJ/W]-1T.&Ua.)a2T+49H[HHVU1US6dRM&\-,_WBL64S:VI3V#C,^8U;c+MA7
[YdLM5?6#+.?d\IfZPL2afdGK;E4Y@P3/F>D@H:DP7+Y\JC1cR45HN78;TB?B.;T
<VRS9H>8F:UG9f&(X[\PLfFIffVKHaX_d0+89]Sg&a&4;C@-9O#eeY2_YDd8_HBR
TF1aSS@De1F7E;U?=3\6GX+@6]V?#d>\F3?1?G]7O<FJdgS-/J,749b]946X5QYN
Ud^aYHeP^1KIg9/,#R[(DNVU@cA7K=5B9WBa:8;dT?5.9K>ggJTHR+YJUKeA(_&Q
\+=Ga6Kcd)^dG_e#IfIa6\?WF9N+77/O,?PO9&b8I?LZbU\<?HeX\JRU-W7=aI\L
?CZ]W_TBeEZ,;+9+RWcBSZQ6XM:VNG5f+#@/R6AbS=Se0#0ZYEN92cT]6^]O<VaJ
J9]RRX1^Nb3_@K<._TK5=Yf:/]d]RLIcMJWFB]D79IY5W<Z^B?SRE3W2WbHfM4a3
5JZ=9<]ZD@TT@J^34?f@M-faeM/-Z-8916cL+YU]d35L2A>:2#8_G&JDM4+]>SA^
U<(5?P0K=<0=BAJX[7O0RQe_D]bS;+=,_4c\)?0Uf&]P5c)gD[+d\aV9.UE_/B0/
4<8/B#QZ1NU,?YY:UfHKS5AaPeHae,USJ<+?7&E&T^MT[W=eW&BRN+WU8\#(_S)A
a2AW:b8E_\:B_:HNcVYeR8/aec<E73bS?HDT)2/]/J#4RCFFUdT-,I1Y2O5M\5=T
65H]060<,?7\8&Sfe+6>[7Aa5Z&Id1<5Kg7(([/GM&/POPWb/#N(OOB/-GD#B7U>
S11_+M/<I2DLTgZUQSE4JgV&A#\1bKG&N-A-J,+=UGG13VM]\JUT+NCD&?:45=O&
V3S[?,d,9L^#FW6]O?22G03].Q3NSB-OE;-9W9C2>^^=,P^bE52:g[J+P^2bRP/K
5I&EO/XU:EK?WH/BFK&FC1TWZ]]+Ce>8C[WEL<6TC2&A_R)_)3I5R2;d_@/[6NLG
E,d2Z2eXIYWDcU#U^WPQ3/O6Z?A?BYHOEaMdR.2]96O8CFP\aTe7,VQ,Db&,57/)
0/=5:J)0<4][86#YFFbZcd1_/g2)6<gB?Y(Z40HW?.;O&_^+Kd=KP^O4I=X5[;^N
(-+3BHO0[44J#7/_AEI72700Sd5=LET)gH,#ILC/(e:XC>?142Fbd]b._Ua+)M7-
R7L+_#dI8>MR\F<Ec.\4<(K2[J]ae=R\6N9Y]CF_SCF(1@2/K&SJ?>SNf33d+YRM
_6M=?\f/3OLNO4JK##JUB@JJ?^/_@P;<?)G2eQ04).+SI&e@-O4.63B&aXBYSSWM
-P7S^_YJEYPcADH1,ZQ3PXc<\]MLB;LQT2#YbYad9)@P^YN=BT10OB#Q<6af?JCL
80d>Y]V<]_]7g8R^gU<HMG&DCVX1H/FG,D<<86WPYT]MR3M.-cWL7(W]._0[;=2B
SC=cDb9\B)ScefWSID\ZaZ6[aBNT=NS6B#cI4&&XR;c>HIU>)F@NN#;D8M5QVXQ;
6,^)GQQDE#).fN)@0O,g0ZXaZD,V6@>Ncf^D;d0O/UEJ.ELGV-FPGQ<O7J\e3L@2
&)&U2.;)2P>Z\5ZW#/8^+)FN&ITFKgHCH/<M,_f\#_6)a&e;LOcAPOV0-Q1d>5dN
,LGS+Ib&TP]XY2Z4V#^LW1-3P8-BRUH>0IL:WR8Fe1A.3^W8[K0;aIVa4:GPK,.H
Q#U24Tb_^HW8=-S9bZ=U@/^+UYLK22[\YO\MR?cKR_JM7DB5)A/TK-C?aOFXV/X(
Z7W83T+M6C^Jg3>W#RV.AB0?A7f7]aH:;+C;I@W>;U;Ig@N9D8[dQ9@cdQ2]@787
\Cc+X<;(T^@<bMT&B8I?9J=<)fK+GI5+GQfL@8L(KV?a@T[0XE_>B(E^c(1GTJB]
d[-:gf1P5e+SJUf8@K8DT)P&E8TF46#/P>9V6T5LC1ZI(UHC@XE5C1fSd@TWL&\c
Pe067(Ve46I7@)Q-Jc]I6R)0WN^&6M\-^W>)KEL@ZZ?T9OG5RT7WMYYFE6Y[X^Q=
5E^.=P9gNb3UKDG3RXBBO&cJ[ec>ZWSNC94O/EJSG;fd)6()_E5c^LC4?Z1CF9_9
;LK,2ZXGe>?#a-^1V#(@LcXJ2-8U#(PFR76C4058?>_TDY<]4Y-?Eee_S&HIefM7
<?,].0,Yab7cf+7WJZNFTbSFRTY(OB^4(B@XJ+,MK(GeMAeD8MAR4Y:YP7GN+/[M
bSQ9/?>Pc9MZU,?V1FX@dF)J8VM&-\(PXS\cKOQ0MWCfe9ed5.c#3,W.3.IM4J[V
LQ)?;,g#fQ9IEd3OT4BbRK+(>KEKX@[32J9<,(#,\C-<>T-;R99__)eUF=48BQ5e
0<gC566G+S\d\OU:IMX7gX5N[B-?5>:B@:N<LH>\9@O]B?b=FCM&S<eTb^XZ,P??
cPWU0?)eV+90FVTDeED):J.1U;Qfb6Xc9&2JB52BGSV<?T@S70)Rd1YUb]WN<I00
:U>c2PX3G>APQ@JQDf<HdDGfC(6\U?aFMM=c;,2C\ag0(8A@.T[cgH6W&AYfZKb)
Y\>4Y?/D\QcTQZEG(6<9O+QB&GLW7>QC]ORP,&VTW8E&)MQIb<E0EQMLb8@+_4b\
Lc5OOX:,9K0NGF@U2X\/:N7fX=1IK0XNO8>3&4-gGIcK#?[?DeHgO:AN6N[ZWRc5
AUQ>LM@N@R8L3_\#79(Qd@+f6(\6+Lb[GS/\MgH3C?.M,2Se/f_E5>DF)N^)Q#T6
)YXL&).&P3Q@:4;9\;E<XW/)MLNgNdDRB0R\VA,Le>W3(KAde-S@DRH9(.SA1CRB
,_ZV3Ec?W)Nb^6f\=_N^@6U:#=77;JYPQ19H3_e/I97f-HZ3V<_dKPE97_5cb,D?
]3U)MVe>64O8&D6+ZG657Z]5LP&&_EL8K-gXd=cdSdI8?9/@6@3Y4LXETYN.J;&=
_QO_RP5e-7]O_D0KB+L>Z#&J;=EAGC;J.(XTUP[?=S)f.aD&MRf#-@eNI(WPbM79
4AK7^^6/Z++Z954VOR)=M^N4H>=C/@YLHf^U@#IQ)8P>JPK(]&Z>XbSCE_]f_)5g
ZTP-HVC)#PP?[7Z,8NWV(35Q6:,cX(Q02?=6&Z#daA/HAIQX;=7Gg_8#DV-J-A8&
VE#W.5FE#YeD+/HL6;_+ZcAGMO.<))CJ,@^)+56[SbI)Ggf6M\AT(e:X1bLeNMV)
YO]\a=FA/7<f1T&058:#c8D,A>f1D4eP84BE+:.1L&>.T<R(NFP]3(A^/bbc9^\7
8U3DC/C4Qb/D1DG2:1QF.G18NZ4A:VW.D?,N[17:;U#&&)g0W<][4A-133;B]1A5
DGI])^?3O-#eG^WYS3/VQJ;(\fJ@OP#VGKVE+e8=I#&N84-5GBcL:T-Xe6_L+^SV
-V5NgUEIg[,][SRKVS7a_@<-7(],U>KG\LIFg4FVFNGAUE@BM:YdUAZ\FHd9LfO(
9CeG.<V-_DT,0/V3Eb\L/EfM4-/Af0M(g6IAN&ZPUG7U?:O2@;A@Kf^0I[ZYE:Z5
bY))F\c0He2:HIX\;4>UN970c?(/W,CgXDDUceLaC1OEKdK<H&@XY]e/)10VOg/b
S5=&P68VX@Idb9=W_&3+e_AE6+@=-+F2)FW8_?cM1[MJgY^gc>XG1U>[Pgc1@Tg/
e07&g5XO/0JCU[f.8;&U8/PEUF4T;aOUSHQ0GdQ9PO:U[E6H.LYCB[_U=YEHS[_f
;dT>](8G1HF^JWeNPZFCg7SLdTZ).:IdHI((b;=2gg8C?8db0.G2HAVUMS6(=>F@
f]EO(Z&]V]Dc\K\Q0AN(7@AUb5<X0TY;Zg;JI3f#0a(>@/;)O>bO0UV@T=/YL(Z#
D:@,T9+8b6CS+.eW#[<DdN,&IT0Tb=XSMbVa@-@=GB)Ie3f;LR4>1LIMX1(cV[)M
>PK[(NCWF72)Q=XSf7R3O75+WW1V\X<3)=?;_VE5bGU2\9)WbUeR))1J^g-2(,H/
/#(D<X@@#V^I_geeKeeUGE@YKba#/A&9S+CN?2aT7b(=DCSES+&fT3?bYLN.GQ;C
-?#515XER53VPW0<eEfT&3.aWeT2_VSC_<CAA&[0O>9_BA0NM[(+IIICcS:3@U.B
FE3>]XB=<a4H.G0K;a,F=.\ECN\-:R5:.1&?1<&BY:@IZ9WH\C<J^f&/d=.<QCG/
@SaP_1cR3AWT?J]-.GT\0aIX-/b4,fISFeg#M@(b]J&eBPI5[1bLBL9-bQ=:OC?0
MX#VPNJ0#L/@/B3^g(7?5dHTb-=aa<a+GcHVN8K6RJ6RN46/IPHc<a]De-2Ve#0M
6IFdV.cDA.6C6ZeV+[81Ca8eZ/eV]47DEG>?VEVeC[?IeDe<L_0]G0I/e_DeYeXD
U)Rd_FD9:,ALbESMRW6O2QA;KcO&5<B]5@fYQgXVJd=b]597YAAVg3.(I+BTYMM,
TAU-?)bCJ^KXEaAOZ0#I5DMD,]]dEXJOf,NIO8\(OA#UYJIa7N^ME:/9\SZP_X>9
J(FWL9,?F<T?d1W<]0Rdg?7dL>A(_N4K2;;gGEd@Y1<ARbES[T-<,3MW5W3Ga]d<
LRH(e,UY[ISTfM>XZ><#H5AWII]_,H,5.W42fN+2FF52EF;YPGM67-(7eZeDWcJB
D\XH?7=6>]12IC[N<>3I0N1J5fU6I,_7\Rb1D<-14I1YN^_F;CcH,FP;0=;0=]S-
78T^#.QX8OMc(X3:Z#8(HO^#U)19.5?Lc2+MG8?K[5ZeRGN&8W3O2Tf<gD8g)UJa
d(^Lb3c?&6HUK]:G1agg:O];@7Wc(P6A>5-fU&XF)6;.Z;L]#8PPe?9:[V/74S/S
>6_SD&;OVZDXB3O@0)a0^/PE1V[c#DbQ\?Gc25Y1<.+B22@3F>1BW_>&_B>(^?g?
ZBN7X.EN-/0@5OH^Kfc.-X8O5;08<cWGD[MFJTG?.?Zf7R/Tc;edSO>&WdEZ/CTY
FN4F>Ud@6IKW\0gccFV7XeN4WQ&/)O1:DJC6F@H^aU^Z(XBFOUS6b_IE67@@4N(]
32[5LA)YfQ)\?XBP1I.EZG<1BHZJ=aPCMH)7+@YYG;_5aeFM64ReE,[R\8@d+B;H
DSP@G4YZN:(YS5FSe=#&Dc1B[gd(&L5<&.]^[aFD=QU=OZ21J_);TTbe<9/7-Eaa
J<(;HNEdH=fdW0W)e>H[<2)bRKJQYd<2:_U.V7E^_HWT5K@_X^P]UFH\D]]U(5MD
\^C&/DeG,E2[,0]R,:VdL?S/@#XG&+YTdB)UYAEA@+Q&0b7>O--M4a(UQ0;?OYfO
d?3N00-U2Z,CBW9;FRe(Ua]BZ0.O1J5Vgg&ON45Y2dbD5+B>;?UK[ddUV)\4J;&?
e=F4VMSB]YNb]_BA4U\=I/e+.W;3^?/dF@=bA#2T0^MH9-G:<bfA=OD8C:9_UV@B
9@RaZ]?A7fL;2AZMd3]1_-JG^W2=R\/56EO8AbBZ;7DWES+/Z/Uf+;=62FDH4H6O
?c3U4.@3?>=1(L/MW=WCfQM:@4c@52L/#aC^8XEGBF<S#K.A1ZM[gRI9X>P5::gO
=34VNR=#SX[@S60>1-.O\752Y8I.BPU]=8-dOYd)UC7a(Wf][.SaH-FOCdBb^B9H
]_-Ye^L88,M[Uce_73<9K[=TEXb0b-V^1cF1:(TUY8^9e2=;;_=(^B9,P#IOYA@;
f[.7YE&SccGD^be>^,_5?a=-[fS:JV1^H)c)I&:Wa/fZ,:E).U9+egWgcdSGbEN[
fVW)+P=cb&c,TT6@1Bb)B;f:[:A:F;:62C(F#>OU5^,L7:UbTNaE5c655T^\1Yc[
KE)JdgZQ6@,.H<4&\2]9LRU.-H2ESH0F+T7_AXeOO6gNXZAD45DV1G0QM4F1TZ_?
B9^KXK2M[6dC4?[,X8KFQTBP]:-0cXeWZg6)(O-eF5L^bK?3Za6D.?Y]]0F>dc:F
20BRKR>4>b=0?5WS_.41#e^ZXQ]T65^bT]>]\g\]N<&#:2BKYB&d)SF?eFD4TKV=
b86V-##c,AT:<C(?FcR1TJ/M(DA_EF+=_dV^bYTcEN6<fFAf8d161E\eV==P5Kf;
68-1_0.?,1-,g?[=.(gGbNe9LL=R_?;Q)Z4c]de(614)6W20:UR3<97H_[]@]/f9
4WE;4SF=\WSQFKO=YT&)8LcG.6Z31LL(Q3=/<Z_R4#R+J;c1T4,R9VF^#9f:DDJN
2&5\#PYf<K>48CP;L6L&?K_Xb125;U3VC_a8<.D6>76cQ=abKZANddQ(J-dfDAXC
\QZ65A]HOFbC.a6E1^6[)65U5:BMT23X/_1fOJM^fPE;H>FGFWODZF42<3/FCa86
]LgG-I](bWIPU[S2P-2GFR4@I<2>Xe(A46fe:S)7@VgQ2&>#1)PSCW]/ID4@f<VB
@9.A0XH]O3\\J)=O=S@DW8BG6).B.TFWdH/f<]e&6W4=Ja9DRDE,a[Q94N81D4GC
/EAV:&8,FIe0AQVZ<1YH)d]QSRFYg?_Y5#94C6.QN0N#YR\gd8R[&PO7S#bR6PWR
3^+Ua06?1aUEE(]Xg)1LM9]8Sa2g;b+fA1EJZGH:K8DeQ>(BYAIR[XVDLB0NMKOR
5_/5F_)\c(/(D#-)(1QOI1A=E>FC1.ARI1RKL9&HMP_1828]a5H5P((J\#bHIB8+
+C,G@e>)+A(^0-&VYE[OF1&B69#_eM;8.81b,W]A#<^TC/+@Z1-;cFNK5W44d_MZ
D=T4H3f@>5?Df/3CGb=3E^DYBUVWS2>:NHN-PA[Oe)OL<HcSF7&?R._VO]53]/&T
^Ed)U#FbF53YCR5^KRKV^U5<UN/W2(_7EeOUCaPXL1T4bNBG.,ZZe6SG:O9O[W.5
W]_(A^?:_IOd[&+:5?Q+5,HK,-)G[S5e(B=I/S8E2G0a(SKaWYW_NaOI@0RZRc0C
gI9Ob&_#59fF\+:Z7G55U,JgZ4/TI9O7^SHKLKX?Db,1E2#ZMA,5Ie[f?eM4CAW=
/dH\H50IV,7M\aRI\0ePFW+gc.<aUIgMRI^@2AW7K0[8-Q&V0GI,aLSKYE30,P9-
R:<QV@9fOLL@X[\&8X)Y1VVP5+.546XMfe:;R_SJ\_&94Wa-[>.7CU5+=B&PH][#
U6VfKM8baD<55^IdAc3#4-#2,/YA=IGf4X&GN-HG[5GGJR?YW=/JUceHUEd.)cI4
g]SF[NVPE_;NKEQNLK7I):\9VHd&YE#R<H8T,^F8a5+Kd894<Q@3c@<[\21=f@K^
.:]FV.^_VU01>8RcQ3(6=[B^:-4.G@?feI]-4J-IQ.998a&.;^\/SaFS-GRGP<IT
8L1,7/;1dEgK6E0]/d\ZL-P4#Q>-5CaG+CE[G5@N@\[dH,3@be1/BFRKT00=TU#9
<USMf-14^g([18OR\W_7/K/,GL)QHQg:04+[1LP8gFSZ8d=G+cHO&.^.F@BfPGZ+
>BTJVCOf/K(O.d5WMHIYU-SQZAJIb:&XOZ#URa<+V=>BQR&.5Hc6HOHT6NFTS,MJ
E^U4dPQ[4c:#f+;V/2W8W+C+6<G9eFA=Geg/?>O-(U+/c_C<Ye_f.NO-H(KH\(]@
cYOIgBJ7F0:fG7:b-3&PKB.0VC&g.PfM>CQBS,IF^ZQUTS-F_1#d5U(A?3]<f#26
RT#R1/YG<NM674fNacM:dP\g/8NH\LM3DPN4,[Q+D[Y_dW1d7+ZOIAagB8JC6X?(
JY3F-?>eM;RJQJ9#6-b]:bg=d\.R<8CM9^Ha94<[)]FISJ2UVT\.6W;aFD3T6fH&
[I7?e^g?K.VAG8@6gRK^BLWX>L[d2H/CKcG)/8V,9U=1C?@F[GMbH2^4FV_T.I#S
MYQ9IC,?GS.NK38UKN&bGDY1W/OTGGe(J9I5d/aT@e3Z98[RCF>J.4UeB-R,//6Q
?&N:CUOTAQ>N54AdZ^JfJA:gVZV.a]E#9I?g2,LeK0-?2=5<Z-f)5KdOECFHWH3[
/:W7GT\?b6Id+6I#9RXaE1P5=^aT0Pc#]C\g(0EET,#3dHODL#KcZH:bV+=N7XCY
F6JH_YOJV,DL0/ZIJHU]WNTUb;[XM0K]PILDYR3=1[DG[:/1-7^8c.N+,baW#ZM\
KSUEU6Z^B,(.1LXUAN1YI2#/bA4^YL#/YgdDLOeQHC6-&@QP/3;NM2TC#U<=FDNU
Pa[P/KEVH&b_#/;I4SN9M@MBU@3-]V.H3Je7\T[C>)g.gg8IWgbG]7F8KXRAdd/\
G_Ae>88G@D=1I8AV#>LEJ16WcDN418-.JAFG4T3.?)G.E+O[AY<A_2#4[aS.[;16
a#K0Z)JFA?7;aAN7eVPFMZfU\g:^K-bb7-WcR]+7)O.Z=DW=^JR;1:5)O//b[=e)
?EIW)YRP#:7+<bFY.bO8<dJ91gKdK2=&^3I[875B]=M,@6U^3.#W5WE1#??102>(
</IFV34)==-70T&AVX2JCJK5<?S^RW_#IHfX_)\)1&cA\@Z;4WNPP]3b-^DdFK.N
_].#ZRL:.cI@bf]#W1d1:Ob1KL9,I([;TJ8La,F#9G(JJDAUI;_W@UWE,XR5@#[M
>_b9HUL5TP/]OLD&cf6YW[J=K_=8>7EL?5MGCRQA5Mcg@X_(BT6c_aMQDbAYd==O
.Q5G+g@_?2b_gTA2,.C.UUc<Y&-S;dd)cTa:T8Y&fDb4MFN<4E>V^<XbOP1:.CHR
XP;bIB^&^JY7J]F#+gFDJPg-Zd/bOBc^ccO_3G.XT,@&G04#)\21L744U<[J+)ZZ
_W/E#O0<]G&g0R3-Tg(A^SU01P2MIXTCRI(X).X48e_798&Af+U,bJ^6YaU99\M8
E<e7K3_IT-2/YIK0N(E=6&@Q6EJb7_H,S@1=5WE@JPM_1K#V)HGS+6Y@cPB8=AA)
>B-I6C>;NE]AP[EAIbESF;I4daTZ2-PReBQ[EK3_Q;727dL7AEM3B5G[b80^a/5G
<a\[;A^Y^[fQ#6/=VX9LW;OV;WQS>5ee<]?g;G27UD[Ee#UQeKU.UDO+@Vb;^2f8
_LH:?/e)F;Q4CCP&Z+FUedXBbZYYYHG(LBbV>2\>69LO-#9ZSf(>R0Hd@g6Z&3?8
(c9.#,+E\7Ye::0\=eWQR[)(P=ga.T&]\-SfKFE/LXHNgQF4Y,B(TF_/>\1gbO=B
/AL)4C/WNJ&HP:4#=<2UfHQ(cN)A3HW8YK9(:&,2?^:03&8J=(?P98cP_7U,a[LV
SP8G<=4XEF^EcP.S4^?<d?L?+b>eZR8bb+aJa0UL_XNJ@YB_BA.6ecAGWf;BA9&,
;9TD7T,XOLN_R1.4e6&>4Gd<E/]5&Z;,SdeFHbX,,=cfDO3Hc&0&9Ua,ZeMaOQJ@
AbFI,N#+WL@eSYN>D5^0:a7fX=c^-VNLH]+IPX86)B;,UNJY-]GP47=K=fJc\.X=
TYLQJ+?T=P<<1<;IbJ.\310JSI^CX[,:29\>f5g.TDbg(MM.A:IPGIZ059K(OEAe
8>B^+b7/.edB,UP2a\E>:0dHIKgg=?4N)ac/2f^eM#12U2^O,3W7gKWVcdXKE_R[
\^27LbR^E;c>.:=:M1U.XR^>3TT4cDL4Qe1ZNXYS(TCC;21@XT>3H:9QeYPU4=1=
9H,F6+X2VMg>ROO\O.7SGM>GfJU8C.gK0<b#->KXU.F^<:QB59)P&LY47+MR-)fX
F;4G-DSg^cNGN.#BQA,3W;I3US6CWTK:-deRWI&0+aOUFSNgQL2,;a/DHe2?(@YD
LfTKMZ7N=XR/Ba&;ec\)+;2W];3]VP\99#PNL4SJ5\5,gNU66NXZ[]0U\gZ7>0K1
NU/5_ZQ#E.W<O8F7UK-7AD;WG9aOI9DJ<33=_^7LB1U&JV4G-AUZ0L@]87S)5@+O
41)H/:1A#BMAXJ-[g1)HOCPG&W=OBSBFUc(:B4<2OS99H-D.P&D7TTa+/VSA3..c
D?F:DE2Y.B1acVVSSRC8H,(E723R24=&J>Jd2&M+^Z>D>a6,@eJ4I4_L#US#LNP:
d9ZW0]JDQ&;M40,N-8DC2g^+E&Da&,U>03=ED\).Bg?5g[NRWf4N1WF@Tg#YAHTJ
:&7?fP:/CQLR\2/W@Y#6A=DEQH7AFPW9:D>J5(.cXB5EeNN-a7<5VKGcDN,KU#0-
f#4JZ(ZE6dHNFKPA6(?M?<J0\gT)O\]6c_>1VDQDA&T>;^\_.aaZI9?:Z_\:,@VP
1B[<4R@e_0]?]cT(3+]:&5BET)7>cLH,^D8C#8:c(]7SCF^6,#,f:8b[13DQcc-b
BEaK2ET<ZX&FE7539,gW//<;:bM<QAX1ASC-U@#G]gH@gN\VXNMD^H=XJ]LKF@<f
d]c5^>_T09bB=?3FJHNKG:#(&d7EaZCaZbFZdC2=UU7S)5Ra@a^6MbVF>_+W50b-
@VaVYe9^:<?5[fEKX0YQR0XgAc91>;E7?JHIGfR;MP:9)OWHQ#]cOcK1_dA2IJ.U
SCZNd&LCTFGc<P&:F>&d()-)93A/;3R-@Y7JWBf6X#<QLA0dbO-_]K(4?5G<KZXG
[>O[P#5:0:_(80\?>2DIKacWHGNJULO?2(DT[[)S>U-;dY&L1Le8FTdYP/N18@C_
?ELgV,SJdH,+GKb:E5@ZJ-CJ77ZEH]-fIH3ON4ZP#1@^g>b1B8A9,(U)TRcdXQ]-
^+#QE]I3,e-QZK2e4N2bB766S>P&0ac/D5Z;QQQZ4Se>2<]ZU+ScWc>?:4Pd_EgF
JV+[1N-aYB3/83aY0FT@46M(\26D,fQA9JRD)a.=ZN[H4AWI.[8Q(B[-8e&?/U<<
;2-[W((M9NH)g=b\g0gfIN/e_-LN(b^e3.3/^7?Hc_TP^H1RZ:ESRZLMI\0-9I4/
MQ\:FEbP8Db</;S(X-[IU_3_ZGNI2_?9J>F3dQagS&9F11fcd2-^dU=e:2#X.b6W
-.VV0c,\NE?cBJcaMSAJ:dR#JP8#HPFXFV40^97?:@\aO[GPMY\43;MR57^E9DC>
MS>PScY8JG<HbO=,65d]6XPE=NV)5^>.2O)A,&5,7QPg>]3W;1V)WI;0DI/+8S)F
Ea_DaXEXDB:.(RV0W3/\gFR1^8^L]bTF060)\^-fTJMQc9:RL9B@<ab5)9OU&=&g
ZgDf.S_d,.=??I<E7V,L__L1/D?OU#/]bW2L>\1CbYbY,]7X8SPHKUH7L>]_?:_.
>XUd)KE>#--Q+:0(=_S-E6Z<=e.@M13#7@5>K8Sg?g_;29#WHJe^HLZQ9E,[(3Y^
=P0TPc3.0_7X1V-OY&L0M-8IR@;28\YaNaMGOES.d<.8XJ+9?E=.,ONFT3TcgT:5
CZ@6KJE\)0&8&EC3.][L--HP:@Kd:HJ#=g=Y5gB:C+OX<FO^LfY&eQG)C6/;V9NL
#]K?47_Y,VZCM([0Y5g(2OdeWG-D?d.)gB9c/8.S/J6&M.EfMM<_?NN1C/LF:7\F
eQ.U+,4gMAb5EcH?Y2[[K5bR0,eNgc@+6M06U3>Y,B1EW,G<aC>bC]a)LNHSX\,\
DDeG.4I1V.L@;EABRf?GI9GMPCZE<;TIM6Nb[@M;#2,A?7Q2<\R15SD5CV>[#O#d
-L]cAB1_\]9QRE<TV,/eG67400[f?F/3dAT5\=[HB&a;[V<.6GgaQV[46J(,P,OH
Of1P3BIdSI5+gAK3W8Qge_c>G40NUH^O-;ST1de)VCIHLG9HJ][VNX:,[E1W7b)U
+7:74_JP3V&KdBD;C^2//[FGCA6]@TRfT^fHBADDARS66+6DNcdM.;<aIfd13d7@
7WPYg4Ab>4e3Q0.g:[&AC<>MOL-\BK53MM.6S2_SO(dJRXCK_:<(LO>3Md_>;U)&
P]G)&SKMP2KN_F]K;3?9T)BKe/FP1_;:S+Q:<?>^:(HMB_?B;ISOA?G1Q\gC5_AG
XNS+80f-]L?9?A,2H?P>H/C#[5:N&GGAfF1^1G@O<XbXPT.G/CePQO3g3cD88UNJ
6a_4-[Uc(;]72GE<RSIK,M4@9fAXGg>)cET3aC<T#2e90&F]=YF:4I&2C&IIND:O
)]PcA-[K-0>;<N:^?FdW@_87/?IAV\^T&4/e15&5_J)f8Lf6:2Jd&NS9J.0EDBI+
AI+88FSTQ_&1F^Z&S]#e95WY?O<D6N\G<2-:(@EYGNUJCbLd_.,KN??U=8f6VMW<
W?T/c+^G;\Qe_H8O?a^/1D<^^C3BYTdEFF<g_(bZ@^09N3^gE=c&RRT_#dcg&VEI
Df9F/Q.5Ga71\E=bTcFAJ_C[/)FRQTO4Z@?Zd?Nf[ZDZWHU-A<.HPA0P^(C_Jf\P
C>:8cJU(<>_eT_A59Q(S]J7U&)[.5gb8=#;FX>O[S\=J^YKbBMHbFJWHPa4-V:bF
Z223>KE3d5[B9e.a-4,=AAd0E[W,:8I6g(2N]-[0ee/KJ2e(,2-/>@e#fCI;ZNAE
[)Z)2T7d,a@D/cHaXFfdfPVKV^&812(C>^14(>aJXf]1+dd>/:]MUS,R\71,4MMg
KG4=:=&-<IY--;c&d?@O<:_c<4SLTED7e5?FST+#0T:O@aP6]GCJC3AB^B=Gg.)G
:5bT:7aQ(>,GO:BXcDdHMC&LD9D2HU8F7MZMO^K:eD=-T4R0Bec;EF+3R>g,Z:&6
8ac8>d[0A@T1SE;f9X>.OHH]b3bER=\OD/-^2MAE6&HHN5TE#5(gB8&I0Hgc>NL&
I_1Q3&a.5)6QOM7M#.dR2/Ag&S,B0QLB\<\>]CM_C0a\XN226H,?\eIg.[HV18QM
Q,EbK9SJ\(Seg76dNK63F^0f.R;A,:YYQ0+Pf[c9ff3\0EdPEUI6B^A,5g/W0#+a
U@HYATXLL7U-LRZ<4F<<B?G,GI\WZ9]5HAZQSbD_KK/4&H.0[Y>JeM;D4BK^:#@@
e5L136)IVBUT)?&AdK<A8]+PTPa->S[=7T9AceTX@APa;QdL4aLI9W;.<+^E-b[@
G.1)a-)92aIA2eWVU3f.2C7W>01V4PQ:1<_S#FfLcXDe#/8N[[Q+V<IE+2becE)7
V2MdDWUJ9>QEI^ObgJg(VI1#f5)8MgU/]</bE?_><dT&Z9TNdHN0e2)ed-3a<H,=
MSB9I:S=H6YMJ@?IYBR^<Cg(N\&#2(ZQ4JReOE&EL]GcZ:PJ.)]G2,@5_6/b_>^a
[5JfX)FGK#bK.b<&W9>3eY(OC9.f).:3P9E.VF^M9ZbVIRB]JT44105\..b9]X?_
Sg(e=8ATd>9TUHL1AD55^9H.JQ2g1gL2T(I]d.DgN3+]QP,cC?geaDAc9;Y)0dOa
bdWWe[8&Hb>?TR657<6Z^agLY>7[d_,AQDKAf8-MHe#_f,0C7c@.<[_PB:C(8TU<
)0@2HOQ(NBN7X[A5Zeg,E8ID5<G^-]<&eeO_<5U9VX8(/MK=/MBI&:/5[/fRU,G>
bT^Sb=b0DF3\DXKJBUNW6f3BL=XZ@QT4@@M(_RLG,W7a:2:J_RQH;MVR/JTf:-e_
8[R8d@=3Aa31B,JV@4cKQPQ7?MU0L4QF.XZ:2/WNCJY^&1LO3/Q1MCUS1GaRQE.R
4aT\:(C;5Y6e(EZI;Mbb2]:?8H/[(=g2N5ZK8YK(Lc(2g@4]OQ1&X[FCe#-Y;;64
\A?NcF&eK2e?8[0f;De_(3b2^P_7[\>N:ZOcD7d[cZ>.a1G_FZ@JXIYQ,C,[3#NC
W@G\>XTdUB?4>^)L6.a,?efGYT(/N,(?XJ3d&a>B:9I+\L7H7.O#,C9)D721/_b;
.]E_QLaCZ5XLW&LC;S17Z@\Acb,fA/(6#]4)a64b4+&3@RC34-O(+AL^A=K=_66L
2/7,ESSM:/7:V[I:J@a[18<UA)_F[K.]8GQDag]V24MGMBVA>[P<IB+6#>9MdI9+
<)6-OEf:1,D0P8(8D8<Ie?[];QFOKK<Ff&OM.7aI)7X;@;Ye<GUcgMB0Y+Z7dJ(J
0(Pdde/2WM=[8DeXHF?V.#-0-7LYf.7J^>FYOeOUF#&T6d&@H:Q@OB]<>_)fKQ_1
YfRb2Wf_V=g8.c_-<]_+;aVW=BM:5GUXBc>4)fFD0KH^U#X0,Sc99(=GO-K#&_T_
,\6(WZD/]MPF;,b3>#N?_bV_LQ)]V?_;_](YHcZYW\D61XK8b2N.Mbg,Z-,([K8/
IO@,GSfQ#84Z:F;,6:88GPQVK&X16dXUIEQ7DO0NTdFO#HEM:ZB_ZPFaS_#.E1Z[
INYSdDb[gXO1-6g&OGW=K6BW1J;V88&/.F7FTPDc[6cFdPVTSYCI.]56/C/3UKQ7
a7:HUf2\J1Tg01]Y[/XJ4928?7<JM;1bF/:QZJ9OKPGAKPS_6f.&YRK/\,^+^(Bc
<&fFbR1Xe6/Ta0O1;=T<ED30R<=SM<::<P).aBLJ0Z.BRW=J:<946GCMC3cQ]=IX
VUB1OGFcVGW,dJCJD2Hf#D2OJ#OJ&[SFJ4)>+;)BV96,f5DO#HVA&LVC@)[VY&cN
:;;gTQF8dGdQ3eQ#a^#BY3BW[#\[GSfPDB:SdI5H:M1,E$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV
