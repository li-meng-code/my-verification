
`ifndef GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25UM/MX25LM device family in SDR mode.
 */
class svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_OCTAL_Read_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tSHSL_ns[];

  /**
   * Data in Setup time
   */
  real tDVCH_ns[];

  /**
   * Data in Hold time
   */
  real tCHDX_ns[];

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
   * Output Disable time
   */ 
  real tSHQZ_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration.
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
//  extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
^HZ@K?Ta-7YRA.6UQ:&dd2KF>D^LWQW=>NV3I=Ka>5LJ.JdYb??A/)KgFc]&=^(N
.84d86N<VSG1_<#+[E:[L[_X4@Rf^?a9A^<F4RRJDUJ5-f)GD/P/X:LBMaQdDd-a
.I&,fD[B7@f+A.dC5GN_DMYN:dHNHVY,GfZ<Y:/d#Wb[Fc9fDcX.UBWOZ.)UZA70
BcCG;;Y+U,9LDNJC:X,Q2HDJDU-Z&^3QSG+/CYH.D,WR&Yf@fOU1>#T(ScECRcNf
C#7KD:Y_#+\<T1#;9[6e]=5W_gOCTbEY9Z&b9);4W>IgV7PJ9KL?F)df,-d)]^^K
M_K>NfOXSI=Q62YP6(HG(\/J.4A@1B7)e8cF.fY-RP^L16:G>MZBNNd9<C9P/,2F
d3BPJfZW@1Pf-Z><Z(QD<V>52C#V)U,;@Cb2.D072aJ-VR@22M@34Cd4d@[S\)#&
]gE(1UW4HZB2SMRd?gP)7FFE.IA+X\+(XC1W]cRB^ZUT50,,X,(U+61<:BIaL@R/
44JPgg/U#I#ZZJFTb.>:35\[I\eRI;KUfEF&5@^I(X;g&@(e5J5>7(KDgGI#b3f?
0d455UW4RF.J[FWC1R4VW8gA0:6/_O/bQD2<HL2Z3DRaLRcNg>M&KHEY18RG1_3b
^X3_ZNK+K\<cG7c\#UB1@\a0?)(R5c&J/^Se0XTLBb]CQ2]8E&@O/A+&XRg?#FFY
PQOb(]L9LG-RdY@.FP@2<^5U#RTJD>E:V2\6WAE4Y(4\b;fDa[NNWFdUY]50JW,@
S:SS:5WgGQDQZ/8X7MJd/af6S<OggUPgKeEYd\;K.g(D(d1eaJe/\@_f=L>--F^,U$
`endprotected


//vcs_vip_protect
`protected
&Q/4=W#EdMeaI?gC+83JdJ\F#Y@cbKNF8KI;aL?:[14H?Vc>fGPe0(-AP+=KfL_>
<D89#A?@:dYK>1QLUHU8EZ4R/2=<6@Dgf51A6[-,gXEbBL/0cEUW(;La;:.Q21Cg
X+\1B<5dA;V\#dA#\S)V>;W?bD\Z:A&6bc7))3XbV.(\C:38Z+-BB.PgM4b2B0F[
a;\T49XT[UOC^a&.V=;f:UAASd24g1L/[e?:&YHZeID2WBOfDM=d5AAD;d=DIU=N
@O#>.E;F9V\IAJAFfI4+bUgR8#0YZ7=Q1J#JF_VYS_1:<9\OOYIHe[WPff#V1R)M
U7UVU]0:DZ]#\C&_2@N>^PdIC[e7C-cW=]T<J41d#@e(G<TNM&G,P.J,.5STYNZ\
Z2W6(LaSLQ7b8DMZg8)AL=YXXa373Ae5_QL[DN6ZNGEO?IJ7-4,P:;6Q=OdDf9\D
0.(a,a<.JBY);N7c>9#d9LBS[\LT>BTL5B=6c?&4WH5^-EWf(Hc0U16JB7F/fWf.
2c2c+ZdTI5M6Fde]1;0F>+#532WM&(I_<>5P+<?64LF2L:@0Q2efTO-AZ19O3BW<
Uca2Z7:8B,-gRUW+A&7cbH#MWc_J,HgTM]1FOad[4,(WLdMADeb;?30LAgId8(LW
81dE63VM;HHCULVIFC00-DR8ODcf1-F[#e[,Bdf@Xd+a,0].1F=KB);W<J8R[JVU
)CO?NM+1862e#LII/FGUf6#=Z</V62]bAO1=-]f0(68TRH)C2a\)Z_>Y1A<fW2e(
27B>9GcU-bN-7Y69gNU1Kd3K:#R/E?KAdc.03g6VU=.MX#f-bZFA#NQNc?Dc32T3
VH3]#[fA\W>6HM?E_4b_&G)[Gf,4^&K2ZT,e4H75Z&HT&;H;V3A4_g=+:^#3E5G;
f>JbVQc:Na5XHH4Lb+:R4+U\W-RMQJOOa94;e&b?8aWN\MT1;[_M3cP)=G6Y/,3F
V+V:F?]MBE2/<U3g)U=0+SVf#Y._6HJcb[H=@.MMNAY5OYZReHU0cXc07#dc06QC
1LR1WD/,0DP)c4V=a9>3-M&J]bQ6V_/C[P1g(8HaQZU02:([,Ia-XW/1SK?9d\#7
L:@U=Q2JAJ=@VP[OE<KJC\<(J51DbH1<[2:^=0KB8e:2eS0FMAZLPZPAYRA;E0f@
UG9f10FBLA(<>WTRBE1D;F(:ZN#MA;&&;H0^FQ5T+@>6[@4P_2(@^/[SUSMMPRM-
.Q_,<=3>3[Xf1[IYLc[<_HC;d/0<_C4^b1UF[>8@Re,5_TIV_^9WXIO95G2:4((.
C?TQcSG&]57&86QZ.QE9D[+&1V&<7Y:de/e^XYMU-82<?bLKH#KZ6]N5M?FPMCOc
;(JY#,_?POZ3^(S7M7(dKA[^VH?7aNW4H2OOW9eIZ^YPAO2GeF.cCQfXa4,?<WW0
YPK=@\,?9Y.2>5Y]cGW^6.TY+<G)&Ra2,)@Y+]R4VH_YDH1OJ6,;0>9ML36W-FVO
NR1_&)bL2H3[>&P8W@<+-0FLS<-[[ZE>1Ug^b0(bL4>YN7ZdU;\ff+JfN#<6EO<0
J^b>+,IWDbO4,1X>/A/b75?RU<IF:PD-[(&R)aGYFJ5M#.P4_QP@6[:NDC]@eH-d
#Df+9@c(KY2SO\U.O:gM=BIF>6S/P:HO8Y3^T:R>NJ:J+3>bP@LMP;FBN7O5P7CX
)C@7Ha,4O1fe;5G)9Y9+IgV;.+:)1E/fe#G_e1S.4VP+,__Z:P)H/YXQNc4(2_[^
VG@DS=A.ZP_9Ke.TOXf7(G0X]9Q2bXYFKAe^:O26^8.d,<8e6Q,JNX,geYYYJWE=
3?5;IQ^69>R\be3eGg[,<Xg[aIf.5^SKCGYJ;QTcM[g?K6[WPgc9AA-9Q<>>^T;1
XI]BGI@YI?_MbI,gbHWDS47@&=.W?UbI4/HO)5ZU3VYTA<G\Rf/6,0KP[FcOD_HH
aQG,X[GG_#==QO@Gc_f4OU&0+,TX/9K_1U]d44M,]DaN_eL6,<NG#^SdG&gH7](_
Ua+>=0\5<Se4a,L_HbYcE_V4RRfD.N)0&24cRDUP826:&20VY\PHZV_>E^D::[?Q
<W+OAJYCY9K+BZ,J+C&;^bRb758_1RcIdAX49aRXJc?456@XY1g7D//:]^;Q2+X@
OUN,6)V3Q<aUfK@f6HTVL=Lb.74.?L<01Td<:a\14-M[<\2^O>+?-#H,Q0-\/3B0
(/L88[22]Q38VKZ1Q7+NO<>76F,1g(G9Fc(:F#e&bQ/bR9&#bg80+6IM@@7_Y?B<
+MJ@d-HHT.f4F^,_G=5&^W]?1eH(7C#VI(NLH.PW9:@[8Q-0DW8)bG5?EK9c)W0+
fJ]?bfVP5a[@e^_Vg/@X6Z&ZK-Ae\UTRgI+0[YZT^bN&dS;B@[V]e=aVQ78A=KY_
[b@Vc0>f9=<@>)gP-)9IT,<VHV&+WGBXM-fU:9UB\KcP_e(ZFc9C=O/D8e&S8GAG
#84-McP_Q>OTE[4,ROd8#1e46P&[26A(TJdd=edUI(8(a8&:K9aZeRIO^<KVO=K4
E2_:c2_&F,5+&7;g0gDO)J9Z^..RBWA&R]83NgD3&3=-X(C[a3&97>9;2Fb[0K]:
96X_(X.Hf[]II@Lde4B[BNU.AAMeK#S&e&.@VUP2GP_-M46F1<U4P[4c?JacOX4e
EA=_=Q<X=3S1.e)a=Xd.G_@+AIb.0H0C-PCA>aCGf(bB[[LSBNc];4B7U4(3K5C2
\6@;)IB-f^XQOWO=e8B4SVaE[7/V3DPQ37;,R01daU5YE(0[JL3&8d&LGERXM(31
d3A(DV#[84KF7Wf0YB;61-)Tc@Q.)S[5:a;[Md+g)f:-3.0XQC+_<P@0G4_]^(Za
)SFQAH3WL??^MgN+Q@W&CALMcW0.XE_:YWbCQT#[I-]bWD&)]@N[[^7M<4]H1S3G
/B:&5FBLXTKeODF8G/4+EPI@9.gCVNgCJ8eV:Y4L7,;Bb;98;fQ:I&FQ=BF6e?ZG
JdFF?3C)\Y>>d)-F@>R8M8G+#QG99+V&MXb=B[DJA8#W&SDedV[U0[W#c#A#@0)S
a6-0H327K#)=K5F2]8A-=7P4Pf<Y.].SN.^1@3DR^a@IWQ5/KH3b,0G9+0>;6:dI
EcUN[b=,+]FeD0Kd;#7G)@I1bF[^&fb:NY:QL(HI<9&\VOeSMQbMHJQg<8)U)8#.
]^IEY-=]cM;b>2\3:+PX.e9PcK[Sg)Z1?61#bcK/cA,NPX<c/[A6QAE.)eEE260=
=N=c#1@&N+f@BHdB@YT,g01fD[:W<+eJV@f^/bdb911EfAE]BQ1_0&b9-?G=b^<M
>.LIP#^E5L[]6UY@4A?]\[<HfC].J;_W??[^2_(,WC1EbMD5Ie)ON_I3V+IO3cI[
I,TC3W3H0HNL[KQ=W:\-?+NIR5ZD/RdE39X/dbMOBU?>2OX_7PAT]>_/4K]9(T,R
a&8HVe]@G60UP0MefG0M34If5]HKZOcCbMQ-_U/aa?0.&+YDHB^;<TLbT-(:[6F>
2;:F=<&?:D9dAAHObeQO7-&3\+g?ab/[/EecVVJFH]7H+e05_0MX^RCC^]1,Gg[#
ZQbWC6J@;P4M1;80UB/><Ac4,0BTOV:NJd&If<C?O<_e<K)<(@/3L=>Z0^)1N;G?
5&F.>7AJ/=bO-UR8>gEX503>]63+[W\;.3W[]5-?L^C(.,4TLP?e:ec8I(WE0gT4
]O=2]2NCX/>7c]P&]1a-&M&,BgRf/9SH^KFT)<42HWa.BKM0)L=O3#0Q&?JgA7e=
QSf]X9<5.DNGc,AY&&_6<UY4<NS/Eab>&4&J_RB-WY;R:(6D;>_/5bCC0YHCX2NJ
WS;QKOXHYT/OD07BY,EV1-U7^U@XUf@Ig+HA/egYGg]^MECAb:Ce]I<eQ[2UQG&,
bT5[O<b0>[FY8;O@71,I@9(f18B]G-S6]M6NEQMJ+DBYV[R4aSe=1,O69@]U2:_<
K,Jd(/MNOE??-=&N=_;6DeD#9U6;R5bNZ_PVJOfF[:=@Y\O8VJQ4E+J)AJYBJ:,>
a(]36dBY?:-46Og-#.N&-^Vb>Fcf?G5X@&5Se,SU]KS^882JRE+&7,U0V9f7N>eT
W2AcD/>O3+(4ZOaZUFcW8cfc]C-EG#<g+D+0g<T]KKO2STW.afG2.3b8dXN,FNS)
DeCTQLMYTg\?ca0beS;\)dJVUFA4dGGWXZ&?3(02Jc+QS6>b@a5E5fBQY9fLaQHO
SJE<\0_/WH;dG+/QE^6,;-)LQO(3e&PQ2BD6C211B,/@)-?IRWQd_?7\TFa.H+/S
12g[1NBca_#K+>aXG4R3Q_.TNT9=d>#883GO63L,URe=.YT]L:P.1:S.X5cZX+Ic
^eXA(7acVF,,;><5g+2VUPP/8Q->c?)[g&KJgS<A[FSM_D0c+\[/SSfT9H^9FH.:
QdYF+Y5(M,Xd56a:_(=@VA=(&>bag[S>[N+VLeR+UJMCF\=#^:g]&UF0L<Ud::RA
=EV_20I5;A=)6_E\V?+IRSDW]bA36XY9@^\RDd@DMe(#@XDSWS^XV,2>8)(29Z^B
:W+^I;Pc>:-@3TN.BO^ZZRG+4C)7AQD4/&U4dde^Og9K95URWC(9DK;+HQX4@E.g
=BKZ5-/DGY3J_Y.#A1CdbQ?.EE:UO;aN@QM#-^9_/14_Y#+&&IX)a1\.?Z/V5<])
HPO=GTT7-BZJD<ZFA_e3[JDN\O<].24e-6UaB<692VJcP@eJPMfLGL3aH/&,CTS?
P-M5M-8-VF0[W+V\@EL\8LA=R=QGIWHB6()LY23)#(PLX7NW?\-e/Mg.Sa2:<E42
fD9VR_Q5DV:XH;3e(/SaFL2W7CJ2U_T4D1;B+R2SVNVNOe.Ud5)TXabe1Lc\_H37
FP4@:?33=GJH0E)1KQQb#@Te/Na57^&?PJ=A=/\)Q/S]fAc@.7EI?]Y<^V^d+Sf)
C)Q.c7I0H<ZJ->O]^]K-[G/=Rb>&KB[JLHHLWe,_>K@RZ=:NMW^+.WD)LF5)7#Fb
OHA2@eMPF2CU4N<,/18B(.cKO-H]&/fe&gKc,M;DZb>Dd@0XYdOQ&IYW21F.E@X&
4F_7WQKgOe>\8M1D[c?IXCNTIU\U++ILOQ@RQXUf\(IQ<0DJLJ129:^g;B=>P71=
+LcC[=CZRSQUIgD),G:USbKV6PWTNNPAF:EL.7N<S6K5b)[W#YAJ4K:RR,]-1RG<
VD1:95Y62Z2,@C5?5GcGZEH,22]R&&9P-D@UDeGN7G-U-5H)>E\Mb,EH0GD6,/<9
]af5GE=?(De:=D[3TEAC)<),>MS.;K3/:DUFAR[Z#d4@<9RRMDR\IEG8eUFEG(\Z
fCV)4=LLFC&d/3?UeDZ]eO_S\e53fV\Me1MW<?ZSW(NcAD(ZK+_[V+Xb,L4bMU^/
P:Yg9S9f+=GVHUN4QWUdM&a@[K?409]gLXLWE5CfZ(fIOW:?2+BR&U0f0XY#TB1c
&O5OFUWE4JEXd.[FK<H=+FULEc3)V;[7\8A<,8@_<O/7f;AOT\d&d)0LeZ.,B(.f
N^dF&;I4[1a\43F,[5bKJX/Db8XC0d(CUfG7&L_<DE5.[SHG(f;Y\VUY<)^4/@F\
&CXPZ\NWKX?+X7Z6RM_Q,D_@FF.(#7#V56&Z(VcW[][8HCDW;C#M<2L3TcOYQ.E@
?56H]b4CV-)H<aa[e,eX5HU4C0FJXabRE7E,1V:CTM<1L0=,&=A+3@470,a&I/U6
,UK#E=^(H7W8QHc&ONC-DaJ:X)BYJ?ZEc\N^T4SJGQ3+,J-EMF(X^?S2AL-?Lgc,
1eTAN(7g#.&P1J(KCGBCY0&b4G8/0<;IMHC-(-dLG^:>5?1dE.2)ZS]:a2L<@AQ)
@5S1^2HDL@9bZ3e8cB\\(:Q6<T#UFHaK(a:(a>?UY[U]BL+VeS2Q(8NX]U+6+c87
6M[<g7_5#_,gGg;Q1&,Y-C_)JM=Ga[\B^#V@+J=J@OUK<K^EG/S.W^=ZDKOPJb4U
b6<&A/I850E?BX^1L&TZS#V[1XI?g6-ANaXa2(EV-H@KCUQ7daYZFb+EYAQfcP)T
.#NeX>aP)AN?@]de.OgdBS#13\C[4:_Pc4NHP/U0M[G[R&6(b?DKN4W2KRNFW8JQ
)7G6PR(M:=a-<IYc9EeHEDI8X^H#>]8PE=R;BIJU7NLGbf=HD(fX-#)Zf]g2R]K#
F?F:^HE_B+eH\8-NbP\B-aCZ9:RZ68M@G^^Nbc]/<aaH+3\E<LYC3ZYW5QK&[bK.
^3^/R[7<IPJI+QCbNd5/TT#GR)CC.H9F)J^_dG[_PW@IQXbdL;+0Tb=^2YJ3TB-)
A98XBQBE2R/.01=RUBY\?+^@3]0_A/S:f-ADfK:U/#U6gg1d;Q?P81eXGC6-WL]1
Gag5_>fag=_3.AHfgE2E\1D91e?[\&.Jcg1AL3+N4FNUHF-L@1[X<dN9g6dW@FIc
d;)(.00@OSD8I;D7)0(aN3QNefT]^[64P+[\97OH00C/Y^:SW\==bZ3A:,Y;\[@U
W[Pg-=dg^4>>[<#XK,Y&EORL@ec2&d_7N:KaOH1\9aAZP)<PE1_1T0>EO9(#))2c
Ig?U?L/T\7R>;<WK-IWR>B&Z.C74BT_bF<Y;Z=?6Y6EG??4L7262Lf<fPLL4P0DU
5K\BV?4O_5>3#1Pgc;Zb6PG@)g^.C]R&N5e?0PS6gc:#J,aKeHaJSXI\2.ID9HF)
MV#\Q)U[/f_b[@8I][<>[CJ9=]RCQ<e)5G#XR@fe?XOH[V,2HLHg?fLccD#[]-IW
WR#.g9gWUZEUS^6Zc->Y@LcI@207,(J/Vg5Q)7>+\_f.^P#aXC9JKceQR^H)OF=V
N&BTZNRM];<gZIFD6Y6_-;B4[/T0,[A#c1X:,C@>[g+VTR;972PM4ENFIgFg=beL
4R;a8,\V#W;HA)ZXeTG&b217b08+DQY=\9?][@:/^\3I+2\HH8,-K#E(6]D\KKZ-
PJ,X;g;GG?>5BTVcNTO-^::KY15+/OO<+K\^&QM5XE1?Ee,@086VR\6I,;//FJA8
YY@/::J9TL7c#3O55<8UL)XYS63f>.4F>Y:=Wc01PIL70&_JS,6F_VP?C^]XT96.
0Y7A@Q6;&a/AbQ_CaLP[46YaSCc;;H40K_Y(=R&#=KH]R6B5S2[eB>,CI<@83&/0
04/@3c4:XBICQ^e=:0KgcFd0,BI)7=&X[XOAV1=+;LL)X<L.6.CEB_<4_ebSKb]C
Z0WZ5a8[B;0PG+b-Nf1^TV,/,(FZ5,Jd26RX4.ED=fT)U7699-GP_I)J?=-gMX]J
OLMRY@I@UVKf^1NPf4YH[N+DT\b(CS_@J[.Q_B1VLM_Z]9CT#S0^<&Ec=BJ[6=ZJ
efUTQ&HZ8,;>@6b#Z^P#H5<L-^.C<)4RM7ffN&D<DKfBN)QS8;PLIQM1QH,YVD-_
72-51O<XHe^Nba^;AFQ&D\1;Xe-17#XM?LV[3-eZF7IF>\J83b;L+H6Y@^KN.2]E
HX_BY,gO./GUE98;YUVgB+NE4>DbD7[]VG7I:Y;AM=A\H#AE>#]:.]]ZfZ2)\1\B
A+V@BMP#Bbg&:^4E&3-I=UW_831BEWKP6JDHERSA90B](CBT^3]cA)e4VFI(L13)
Z01KWMK^M:?G]:Q+4LE,/79OOOX7A2O5e:_P33NX^M<4N\7/:N4dH</?g]fAEabb
?)Ba3,>)SA5Ma9J^).?=6W;KI;0H1X&[c2(]\c_fBc1<3QK9<<2>df0+7_NVBY.0
TP#BNGEeJ_,6058_W/[.R0fZD)\&+E4cKTO)FWBYN_c5-,(F0N.<#a\&TM#J6RQe
4K[1fM.0^.e[YZITCDA+_H7&EL?7Z#:JA@C:L;\LE.d<&L]C+<71aK=N>WPKJX,d
-]P\2-b/=_fD&6ZF)LJ[?O:[6#(\HSVg(XXAgX.Ud9,.e@.6RA6I+\+VLVef=KAD
Bf8Me1X>ERGC?1<2.C_80:eUHWeYHec5#c<<6K^BZHX8NR.U<6JV)daL_PG9FF[=
g<_:]&B(>>9G6J;JZ]Y(1XLd1NUYNV@dM5/7,T)6L1S#5@5VS159f\)FLd\OV]0Q
2SPRLde&IO:J0Nf,2=-UQR;&1L^;gg>J@VC^:IR^PE;.XVX.(dFe8B3;=#;7Y<(_
YN&DO21P0fW3KOWbSR0BX[5DOGV^OOcO@,=FH],NQ:V((G(TdZL]+W]H+8YK0_DS
]NSX.-gV6gddFd@]^aX\>F5GJN+LK34(9GX[[^)AJUQ;E1W8a2U:9(c?2>,-6+RP
P)F>M.VABC,^6,<8GBD>O_1;+8fd[U59;?INWT04b.7-<\&D7>[6_gg3J5=cY4Ua
X=,UP>:/PNW0X-^/0a_\E3VKG7CJBb7D<cNV,Bd]3Q\NAR?1f]7GT&NJ9Q1=L=eM
PMf-AXBNT8PV8g+,??;U\e?RHF6g3WO?eS;aK68A9e;7NXP6(8_-40bK/C^Y/ZW?
@=-VI#T(,:X.c+L7g)G,^b?WRPI-^1HKU5JYZC@_O]6S-/(H7L8U6.T\d37Z2+Wa
W&]23H7/3_LM7&X#8/I+_>]/<0MAfV=X)LU+-1.+1/F2d0_4+W_T]1Y0CZ9R2NZ-
-HX]+^]8,E[/5Og^ZZeUS-.\QJOC)Oa)I\d@7aT(P6bANQeB.TF#bKb]]&_Ig:V1
\3c.XQb/E4?F-.\D&ZR&,=0H-2=14NWH=J^>&IKA(E,XWI=Z&aAF3++d4bXcBO-B
_2-@\Q.I_KS6XRg?-<C1I<SVX]5[>S1A9R^T8Fa8b_2^,]PSP3c_T\]GB]e,baH;
TgcXGM_OL^]ONE26[T@OO?\Q&Xe#WgXdN6?gg<G)=\H6AMR/-TUJ:NH>[1IL-Q<A
Y@S1&?E3\J\8ORL.I6Ua0Kf?eV<e]=Y)bgbce55J1=CUB_ZagKSfe3K+ZBf8X6#g
FFfR.J+74aIE<2&>db+g5]&<B(7f57BJKTNUVe>XCcgR6,FP^KGYfdDaWg/(?aX_
d.V>S=Z\\-3)_LT/M#H4RgWH[K52+K>QR(4#5g>+)F-,:@K?DBB8+L8;bKOgEN6c
J)[?]F9W#T+1-=-E:DF#e?1R:X@De0H4USG(<P=ZF:;UD0T#I0g?6B&8\WAL)[Rb
IMcGR/E-^,6aQWc<J^41VTcK[#1Ld:&FaZe.Ae0e(YJRN)H3PJ]1P,;>1L;Z=M;@
UAHIJ)\:1]6E2d/KXZfZ<U:77?a&B^@SRYeZgWH[7F#>Hg9\0BPS7#(\H.?_H;bI
PO#Rc2bVM>)0XcI,6=F.JUeBGK-8g-UX)d/5F,J0DJ+Y#W31K?OcSRNe8U=S^I9K
HVRQc4C1TK[?,^4-_#5O/RFZ#-;f-J^g(Fc:D#FGc1&+YWYADM_57@=#T852HF,T
#W.L.MPPH,F2RGRNO@XU^Vc]6<Xf4Y[2\9X5?K\IOM[N/47_@X_HLcN]>FTM89XF
ER2M]PKgM4[d@DS8Z6Tb)3YJ\F5\I>A2@9cG@SLaA,g^JNKMF?03O_V4T&U]5;UJ
GJ8[UN#4W,O-G4=F4:0=O0@HYIXB06YSd/GZ+#M,edX:^d-@g5N;Mf1LF7;5)Q1d
PEPGcA4-?TZI-1fTRV0IKJ^#>NRe4+&C^CE0.UR(a(W3=H1#V1=eHL[7@d7b#3LY
gFbK64NDN@^f\1V@Ad6PbaG(4GM^K5RTSG6MHdS4CNB4HRLUGgdBR]g;HZDOOIeG
3OU7L^acgJ)MG8(EEUM0ed+a[WG#5,e:V.W/5H5F?a?:^@LcI?@K)Xe.R;DDCK\9
dLa:.-cEQ/.CZ)G-,6b50U1c@NBf2:@0J2),=623^b/V_7<+3::^O[a&c:L4S?J4
RE:MbT7D.2CP<1cWICQ^RdEY=BML&f<V]W,\-YF]0dO,ZK6NV_-P/<aDb;7Hf[5<
7T,c35#[)\<O@9+=cOIT[1K9dG>301HA<c/+-8[+#fg^J&BW>Y:-g,3,)?1;dS+=
45WQB\5W[QV(<5=e-=-e.e(fKAgR;:1)JPQWZ(g,\4]44XK/[)::QD+Q#F&JMP9e
Z;<VZ>?X0(S(M8BE&W>TEVd\MJGLO;:G@22fe/J]0:5BX(QT&ET8:K(]eP;@8PO0
JXZFNd1N@/[(3@;Y\K<GWPFYLfX-B=U-P\8]_S5(dO=>@;E&=C(M6R&Vb.(M003-
,T66D20[49B1_K>UZ=TOROdIgP[WT)8(d7HORD1&&gA;Ca>\7&IcG7N#)c<C4JUN
B2;762DJfFOCQ&D6ZOA/?EY:Ye8?f]L.X&8HE-\^YC3\I)NV^PZ^DC[Ca/FONJCG
a(;9e3\E3,R:QZV_.X92#Od.]BGLCfCf_.bP3Xb&f2(@f_7X+fK&\U/<#D^FXJ:=
C-TW;E]?#^c]Y-6fT@I9?9dDM]L_,8WL9M-14Z=3Q)bWX6=HC16DeAR;5KE)]H/;
1Z6bSg(JD@3PR++5F8ZORPAZI<Z40S8,G,g0?=HX=6M;ZGD7a-\.M5WA[7>H9J0J
#&aVEB3V@D<C,&1N/NEAZP,8:0FD):5^CG3CH(64b)U&feUFV;58Ta4OKBZ_-QU>
/<+FQOE5F+1)-\?NITHP^cB>VSA@(N3A=0Y^(Ob)f9Wg<PW-W[.FOU0,(4HcK;V#
X?<&eCJI_QG6O.E?>OGe\b(f=f#]&I\.9VbC#FV>50L^/SA@+/cC?V.e3P1WTW>f
b?BCRWFCMT3_Rf-<;RGVM5\C@X9QP[XA(S/\Z=7F8VMZAX,A5gI\_H+12W&O004I
dWGSegEU-)YJ9TbXG_ZBZ56_Se/5.ea2<U^OB=Q(QA]RY_SR5,8>XZEGS9H^L,9R
236Bd_X29QScTLgfX@Z6EW^-9S#gCD&A37X9-0FPVQ3[LS(4#dDWIB&Be\UaZ6Aa
=c2_#c1Lg(HUP[<H\E4&C+Z<7^81&bb-7+AD]F_V43>f/<Q2.<e\&\G/F@edK6/&
XM5dI/,@/E<:30d4Yg-@5)&,[.Y_D3OM;^be<a^cI36SG(#bf(+MB+aQ>/Qae1Vf
]PbfEF^?f?4_4)(_7+QbC@[>g[A\0IL2P>_M9WQ@0)XJ]IN6;+Oc9AIW<^US@eQQ
cF;,)Aa^[\5dbR;WYE.;a;VPQd(=ZO06,K_#23a[AUA:MVLfeHE2+)^c]V;^9KKJ
I1-2&O7:/RGHRW1eU47JP4\(/2>=7,G>#4==Df0C.6b=@98JIWK?W,>cCT07=?f_
fZe2P]Jfb@=-Z,Q/\M6PMbAZ?e0+1g([^H13.&SE;eQ2OYRAKeJ0Vc.+Ig#60^C_
@bB)Jfd_e7ZB2F-C-2aZGPZ7FR-a]=K<-[K<J.R(58cf,NQc>\.-PAWPb6/g?[W]
/WHWZI@;NEX;]D6\Id?W.@Q7-ZG3Ub.XL\gWZE+[+L=G<d06J_&GOV^S1I[EK5]7
]2,HeN@@aGKURR.@eP>:,NH6A/@S;dFXK\/RJR&;ZAG>,_6A8JQ\gQC[=Q^FO;UD
,#+U4X7V5c/[A]3&]Z,EaO-MBE91Z\+GPKT[\.L6a=<ZAE.3VKV-B+7MRD1]@T0V
bRbCM#DbQ@&c+V6+LFJ\Z=LHDHDKZbYYRI7DO(8[NW26MN9?9:H[;)>U)5CJeZ3_
)V2E17BIZ?Q_B8U,PZ/5eXG;61e?MeN2f)XIEb9a7QW(g3#[;C->358C(76MF-<Q
P.R5;A6N)4gA_4R&74a4Q=c\_]V-B,5+&6F(.a,@fUXCd&-\HPfCV_ebY-@ZNXdR
UQ34@P#ae;g>.<E>FBSM\]fH5.OY2bfeCMaPc\KTU[5TYbNM.]Z\A&\)9X8>5CT^
Dd(@)@P>B?C+aT5UbEb1(_BPPSKM4-)N;4,(SU(H\IL(U76b;4&+6gG<b0?>Q78@
WXfbMJdD4GO8[D[/TN.[GZJ1_L:Z+Rb4d2?,c@&K6^W6LACXUC>6V9J>NW7Ee^?E
4+Q)Y;E=XPQ29KYE4^3+e_.Ze?O3Ig@)4\K8F)5E[[B]F#QYZQ4BbYQ4?<L^3;eL
A6d#?T#A6=G[+/XfJI;aQLbL@2?12QT,B]4W?^gPX=>YJ>7)0VM>=(bM^OU.UbO6
g.>(e^Da@PC[XY)SZL1##^XdMeNL&/gbEJ;#<g6\7(,U=,U;a&G(+eT01P]J15D3
7G(geN21=XU@[b5?LPR8Z.a;5Ja2bVKA7aB>WKR01Ic.Q;X<WfDZ+#Q7PR\,@K0L
.?E&B5T[=@:B<XE\)^&&VM3(/P-?W73[Q&7?58Q=JUQMgDR]b_..29@G9&OE&/^4
)H]f@CCE7)b4O-C+Y(e/_a==LEg:=2gOHfH(AA4/9WD-CPW?>.G#(:R8:I-efS2B
9/A:>P7WEJ4I+ZJWEN@_-M;PdGUGf>/a+gDN(,SI8@<2f.2=?1^;VNOO_OVCDHG,
6=9LQE<]Yd/_^^>;X47JN>9>Re2IPcP3Y7/OG>E:8-]b034U[8Y7?\5NVBJQJ#+g
&,_P6-Y,=GA-FM^a9L&I9C:T.P-BD1B-P18GLD6UI]SDSM-E26=M==&(SOd3SXN#
@R/A&K2@_=FRU@,(G(YQ#0G.VE<\D4+^L>1g[,=FMO;d<2>H8Q#RPC]<dU67\76.
A3TQV=^COIUObB]d+O4ZC1Ng3]CY>6a(.FLP[FfA?@1PV>,#]aJaW8V],>Q1Hc\)
HPfVd>CYH[@>eJ1WDb^@7](0DM^FWZRBSW>MKBVcHVCX9&A/ffZb]c)^GFP;?0\7
X,<YNWN=f#edACMZVZ>P8H5I/,=0beFNeY,34M?S7df8Y:Y?9;GL3E6DNZ,65T?D
IWEe8@D+_)Q@KFe/f?SNb#c/Y1D23)-XLYV-L4O1?Xd9T70J3N4R:O2G.;_9-\X&
APf=&\/J?,U;\TZ;>JI)+\Q4\89IS=IDXA@0ea/>^43RCKRD+16X+VOI@CfWILOE
6EPZ2\V4WZG(U+\QMVBFg0Z+f/IL:?8:ATNN]>C8\;e0JL8ITcB5ZAO#W>bX_[=f
L?X^f8gM^gdBF-5gW5^@>(RY)9;#g[4DU^AGcKX&WDa1c792DM<#YB3IC6R(FF<D
4X<K-Hgb&KAefD,&;,.TLYSU,5#US@Y#2?6;;K471.+3P=J,_):H<T,0Q(g&0.E_
D+#DL1QR;eH<O&3>LUD_-SDfFEO_^9Q&Cc&83Ne@?6b26fc?F[GV<,.LYJ7YOCIJ
I1^gHO)&>&KE1.KPUQZKG(<9Pg[aTE9[KVW#Ub4#AQZ6QF)22W.cdg--EW[6B5^a
G[2\,B[Vbae^=\6VQNeGI(=J3LDH@5B<;I)-]6[K].7:.M((Rc7Pf\b#4P;>:0.2
B1)\/8MaP\]OMKPFQBa19eD1GXe1481-@<GG9fa^/OK,@R#dSWFg0HD15BX9FZG6
\PYC?6DN-0Hb4M(e)5e9/=Y4>GCI];/2VK?D_.HIg<1f.M)+>H(FA-<f+XRAd6:S
fOPb;fTcKFcf^?HP5XOV7WLP?0b[_6:A4Od/;FcPg^=PM-O,#B[[ab2_7WWE\71-
eb\PH:XbV<[5:S#154\ag88Z;]>03Z,U-PCP(GAXb8M^H8-@M966fE1J[C],6.6Q
Y<[>#:5ecLEP0H/4H9A.USB>cM?b8.-.P^PU+):XdW_+5\CM/E.<=Yc3eQ[H6C1+
Mf>d5,^L7612WQ0a]JaFYfQ>),\IV97RKKdA6IFF5BOB=A08CEQ6PbQX7,4M_V2A
^<R?+bJ)V5I,g<Fc7M+]&#7&UHaT&)J/]5S8@/Hb;bTg.2&F2)2MP&d\?&W\#@fJ
PL9b(Z?M,1(VQg_C4IOc?P>Ab+=VaT1;,Y@@24e_8Ng50eUTIHW2B\\I:3U065(R
YIMK5EHJ(VXHg)B_]g_,_O4U;##Pf#PT@g+1].FNMOWR10]AHB^U^9U(&Ja1U0C-
C1I=[J\J].3<CO@Z?88@LIX41b=E<H)a9\J#V9.2C1AOP>.=:(L@GZa#.<=M1)3D
cPAY8>DWUO+IDX=H^TKdCJ?=>3..0C/eV)[AB(N7CR^250<,1=Fb9/b?]?5XY=,5
K.^D</]L3X&A4/I1^0M(0L(1P>[D=&)4&[2?KRG9<QfV;A^JL7L86@fPJS.(\&[X
M8S;.X\dMb;_8:I&d,ZDXWOgO?A6[a,/JDQNAWQSHgF3EF<2MS[f5aDC/.G1GF=J
T7[g(g_C]O_QO<H#)V\:+^\@]]+2L:(9B-)>2Rg6fUC=^0IH^2/K8O1-1O&P@C<2
FT<f?[69)2(T<8Cg(H\/e(fU3EJ[Q0+/YWGJ]RF?KJT#Sc_945[a55BIH-/HY_8O
De7NI>U5JN.95EE@N//H)/UPa5?QeF\;@?_WT8^(6cL2;S>:3U]&(Z(,gH8Bg@bJ
+d6QGWWfF\@Ya1C0(TB6Ifa6)L14OR8IDUS5eDS&D=YT#b3d^@-<aQ;9A>TdSEO2
]VX<g/71@J_5>7N-)eB;(413,]c:\UQ2GR?==]46KIb-Eb?cVeV77J_W+\HYg08)
^?/4b&+b,[0MMP9;B.A)X,L\QW,/I:=O>]3HDD10FP#QcKc)DIAS_0d/3S7N99:<
9ReY/f59DKd(><R^=df:RX\1DJNJRQWbIO?-KJ,4@]:=E:(g()NC61;@2Q42eJ:V
0^125(8<P@+aY/?<^4Pb-G+a+5X/bW.(TH-I.:(Q0M5aFcRPRd[\&bAKUF&VV?9(
8)+5BEUL-<UH>XB;Hc;.ILd3B(<:):gg80QQN#eJIR38:K[5d>^Q@^S5fY0YIF:7
&:K1NcNDeM?9^\_QXB6H&5X50YFA&;Y7Q_-1-]=NLR=UV2\1GPCXQVA]FP96LV\R
b+=)#8I2;&gfYIZA65JD3B[Lc<UC+=5ICS\2+gd^1cf1WU79fU19#\59_JUMD4c>
;RYTD=RJf<86WR\]UE/^FaP)=JB)3+W?GbNNP)OS2OVPSE-QJ#MbPeM<8Z]SPDSV
d+HD\B9b+72V1(()K6-Z9DM<7[9/9U#QWKa>B=-JD91]H@IfN0T<5#+fVdHg^K3[
6>426-1J\5J.7.B;D9.ESWFETKa^f^:T6F0=(3M4gN&TQ[:e.X@(Y><fNgS>,f:<
H\1IT8AFYBU]Tg<FLQB6<Z6H0a;-&MYGNZ--=ZC(=9MF:3.L4W@;Uc92_ad)_>Y2
HfZ4RKX/3g,67>A\J;Ke4\0#;T,^6a;e6+cSKTG2dOX2VW970XW;_SJ#gBENDO;F
Kg::=^J@2GA/BZ:9,;Ub:DODI&4/L:BTKXI7cUH4f.Bf4O:^)H1,RI&D@BPH#;XI
?U+3d7W(/cb2a:Cc0a57#1>T0L)&MB#>B-d(]K7DI:[SOID2418(b+ZLHBfFG_Z1
9db(d4HNK-N,W\J3.O1]fX/9\X(H+[AN&P-WaNBEId\TUDRF5-DRDO@W+(,K-MQZ
=AUFa&_<DdG2I,d,>I5f&_44Z/D6FgX#;5@g2a?_V\9cd(+[ceaQ6A(@B:/&SQHd
L9^=44=cAE8_Z&3F8^FKIbS@+/NBHTeUefTCf7I8<N7/cAS15ORP@<+dO&\MdZ(X
VCVX.#,a3eTC9RG#BgP/(X0cVY#S1LbW<TOff_.QCLNA?Bb;3BdMZ5CD5)#N([U?
DC^F3g7AMQ9&Aa^+B-.S1+S_WZ;7(L2GPO=^c[[:TZcJ,+L<VTDVA4ZD1[eDCCGK
+:2QGUdcU@+X8MXK^?-Q,\:aPN=N(FP+4NWS&[<&X8TU<f^RY^Y<)D[51YaG5^M@
BM.Db(9C/[N#aJXaGYOMa2+eX&R5KHFX9gRbJN#g-e/LF;_>Y;?-CZZ/)aV8L_[O
GK<C5_C:??;/W<,6>K8&B;VL,O&G\V&GUTe.\JTW20#(g)JKQ3\YBG7D]b6@NV^9
S_>_A0KF<T8NZ\/W9>d6R2\+BLO6F]82.?#/KY:V@E1;@NRDQSPAFL?&+D1#4FRM
Ia)/F/+7#VBNaPL7.:T+aRKfU)=5USX2E/RgV+W?b_aLBd_ObJ?:W.gE=dQQT8MG
H=Q^E9Af<KV9)#d&;\.U_&[J]b@+9?\DS.cb^(&f[AJM^3]:cGd94JYb\fNbcKQ]
ZB7RFCe]I@8DUOSV)DOe+Z@@^;d\XFGT]ec[)A\ROfeN.g,OSPa4/SZCJdef>EUA
WQ]b?d,]5UBS@I9a<d@baB8Q,CW=PQBPK-Q5CD/f?QE-B#aV-(+YCCFg1WN@a@g^
ceG8@Lb3OS9:-KXOL=WDcSY<dYL)b4P0^W97SaAZG;Me=S^DTY#BB<PD.JT4OVJ2
<NIE0-?SM2)X/.>+=8N0I7Za#?-GGfX#>O.-S;9.1fYL0[Y7@_@K><_2]O=<<90:
W\B4LY+JWY7,BR3fcb5_//VNXHE\F)cT7TX9c58Td&bGfJ8FZ&]0#2.FaM30=c+W
P:cUH8dOJb,6LZE)[I^LYWK2S(P8OQ_#BIR1<?I,-XUQZG6ee5N>G72\.<\]IOVJ
<[/P.>fZ?M&Z?W_)T1Za&>S=;Wf0F85I_YU@PLK9;OIaTd6&VF6CX(O/gCa;>^C9
Nc=<UOL]^c78[U8C5#S^K550RG5;)-Y]DbCZ1IM]gYba0X<BS/b-\XA<)DR?/TfS
\Y22Tc:e&3/+)UadFT-BA/)?:??H1fLO?9MPR;b?1eASO_Rc_AdDO=\+[F0_(CV-
-I)7_e_5LGJ\bR\<eM6\ZcU=(GDI.LAA?9IdDP+:R6/+)U]#V-<&-]gLP0:[51PB
5bM16]E:e/(^EDUY@#Q[\#EM.Ac(O_@)ac-;_[A,IMD/dWaXLK+>0,W:ZQTG4;b(
+4U>N3^#,4U4.SSX[Q=;(.?7UMbT>/,6@IGL8aGG4-;8YHRNKD.Y_MQ0>e.-B8YM
IXcO51CeI86Ja8?&R7ZcLg:a0AO3M:/0_;,J)))D66BGcdVHUDQX_f3dH=&<Bd2C
0.J;T1fIN56F6(AK.D@)<#JE+f^1c+KKEQ#>g^]_NdK?E\)0QM7bJ_25<+9F5:/>
C[MdRLBcS1;,6@H3COE2D3_H&;NDAK2C3RJ>K#:,?:1\Qb4g<bVT#4W9+#ZPX),I
f3)+MK?A/9EYD22RW8U3bBBdH_6K39>?B5O+WYPRTH[)434;&6Qb+_>++BP=.(C,
b4[cg[;,:NIC,H7R0:UOc8ZMJ]:HS5BcB5Z&X#eb#)aF<2.LQ2DVPUB_LC0&<_#W
fWMQPW1d>V_e9//]CRg)5<:c8N9/X_M4F5TK-:_O4<V.H804GMXSd723?UON.B)3
c>QFRP_9<W5HI)<DdS-;3(Y435&NZK>+a1WW/O#\]RX[a8?/54W0FMQ.M@L&g;[]
<Rf2M2cE_]f.M]T8JB<=X23.J&-/O:Ag=LEE_V\97a4_1cDO1e9(^KOXR3f@.J@b
]9IA)G\>fE&XW-F891CDYO,49:b.R.@O983]bUA9TSY_<K)M_,,7d[@Rdb^L&dbH
:cX)(,49]9].8M&JX06F<fdG,WA5NVM,LJ\QE]N7<YC#aD?5,&c/gabc6I+L_\1T
[,M,(2]-LW&Z^\N/dTYb(0P/0K+:+_3b]4eK=@&5SbCF8@eGGD1L<0R7@d<G5=[e
515&e_ZP&H5Z<=PE3_ABY56W0D]Bf=aX1AOBXQ5\3gB.,#fTYAVd0bN>9I)8RK/0
ZX+6fNGI89?4C;E44Gb5.B>\9UI=)9g[O2792YN9?1?Od4-+3KYdEOO1//\DJ3#f
UNI&U)B^:?,=TYGU]2<34WQVG;.OS^4;4S+DG-FATJbXOD+J,BN_LbT@1:Sa2[a9
QZ1=g/;#J5&GSfCK./6af9STAN58egHT<],6@CCWLT<5Rc;_7@C:>_X&IR&S&4N\
O>N#P0^e\W]dPF4S0HDT&,:?NNO265=C0L_g<B2#_:6fWT<<BA-62=91:MLE)WKZ
R9+aAf]9Wb@Z&G#gUW?BBc5gfba)CT,:97QNW(IGT3.\RY3BH^TbRCV1aYbF_U<]
SQS(Z3R/B14/#N&d9.(GPDVZNfR2U[XYbG4/H2?a7V8C7AMf:H=./;VY67+&?60Z
<LN1@S)&C([0\=geRX--AUg@__\S:DC=W<DF8^/bdJ];X=USZ]<86H5Z,5I2?^(9
RWB:II^R+O1e::SI2OGVQf=27ae4XbB[2^5R(WTWa.8gG0@e>Ye2LG-4Sb^VUR&T
W5?d3cSAfC/0e2BESP(<fK[7;N2H:XRBAVZ)(9FXWE0SYZ46<_LK,gI>R3D+,H..
>IVS7LU6<M)_;H8OWHU80VSb(EMHZ0>1NR@(b5O4bf[74KGa+X0dSZOE4#Y+>8>U
N_9gLXVFONVX;8YXA41f:/:F7M^F;@+(_<Wb>Kdg8LYS7.HZ\Zf?,/C()H.eN\(A
S/4MD@9]?6cFfMMAA=SUVaEaZ<7FI02a<WZ@)a+:F]F/YRDd:/ZgAcc<0dH;.bfB
eDIVA0>_agDK:Y>D=f3g3(][e]GNDg\ebOYRFDRb_\Pa8ZbLe8<IMXCQVQF7g;QP
7e=PACM[3B)E]]?CGHd7/P=I@IbVg9^D[6c.&gPQeBG=0Y4a?P27#@Q,=Rg@F6U(
\L50\1BFO=eF_dZ+<c]/2\<E_X;QG]I3a_9XT[gT[96[@M=15ObU5.8PGXYObP[7
=AcRNBEa=4)W?5aTO^e6G0^C.D0Mb,(cd6./^2;+WYHG&^14aY6;8[?)DV))#]a7
Z;D.BN(2b4PKK.b2;gg3K^YgBC3W_U]HNF@V+H=-S:CDTGZ+40T.NA0IE6&_CRg;
HQ@US=Le>XgBT@9+?/6YEO:5VN/,-4B:d;)-HJM_KI:?fVd&ZRWQ3GU)^5+a7^?3
BY2O-.V,3=-.F;,\_].6S6#]6?G\C-9F(^;@S#>?+VX1g9[\>SPH-M<W8/]DeJ?D
Jb._/e2cJ&;/I_50C]R@TE6<,^BZ?V-aP3ZaMegIX#4CL,M8d-V9fOE[EAP813YZ
2FM082LH_YB]3KL<H::f?DXPZBJFDX+_HZ-S.M<PV?WOb;S]<_S6CPXJ>U3AE\:-
f9H7/G7YZ[Z#0@:I5#I,Tg.KTO9a[?&XaUB>;aPbQ8,2aN4.g>PO^2a)1a5[U0RW
,]>]4D_-\MLgZ5eEKg_CQ<cGY#ZA#2V@(KLV^TWXA(gKIO&SKZKL1L[D.W;Rgd8a
>Ge.^H0BG#9R#NG1P5H,c(,VK3&=D=+\_Gg-^93B8B8&gCW_a5,5A_N,RW).Z\b=
?d+EYO9K&bO[=_1e2LZ,0BOa;6+f0<(5BgNSWa;W7>:WDa,VY&.IJU:-]&+c:W:<
A1U1(J=63T21;V0CGJU[LegY#XA3@-AQ+0I7IgNS>L:UPS/_3H-AGSSYYf;1Z>eQ
4I\9(cCM6R+A5/]#==EJaLK>SeLKA?).S_<B&ee6\5f9-]X3)^eDdaG+]8VN6Igb
ZcT?/3/[K(#aUDK<5(R(\C>0fR.A]&bI]YK.(d@QXUF#[71VK_AA&JGIW..gK<5I
1f]7bHNBAV+/ZFGD[f#cC>3ZI3@K#&@A2)K[fg4,f>8B7OGGG084<JDP2LcB03dC
(1#Z&@&Q:SJTS/H7D;D)7aIYJR_-WYH[:\7J0R&g0PN>>WGZP&Z^/X6641D7MPHP
G[gJe,EK4,e;NU#a5]fP#R>#?92AEWR[Ub8Z.gMLB,(-@FARY]KBT/WC7UA\CL+#
ZIN#^e,cVcT.6G_WEFcMc_5b<II/;U>..P\&d.N/XH:53A:E?O6_GZVZ0,-e>J9?
K9/5Rg5,fC]0.8^IBGOY[GPOTALfN@]TGN/;E9+M[Tg:?=d=,AJ7,0R5+1NYPIb5
V=4Y6B(C()V+5e:UEB0Ng\e1ZQG#/U6:;FE/ETUf;5aGHYE<<^<U@=NH9@HA#X.V
C\<a)3e2Ba;)PO\-4K\QT3R?7(HC^S?6PZP9S52AOBeW(&J4OM)Gc:MS:1[#4+LB
-:d&])#O4>0c+=Z?ff3cg9,X+NfM3[6Q:^(@3;AX,a<4Q8?bI1PG]DVccH1]&&WB
)YPQ(26OD30eVH9J2IJ94KDOcVL]2.N-(RKB^a4OFPOK7\RJd\c#P#b.D<efDJPg
fb60QfW9;&J24]]Ka/44LVENX(<C.L_72Y?+UPIUI?D0\BBYF:FW][,G1.HN1d2B
]=@ACd+g>(eTQF/GDRN^<AI.eY55SgHd&<#,?8RSU:aEX^R\]^<WM?<M32AHc]B\
?W&69-LU=-XM_M\G_F+H?R;E<&,-_XKO,N\,LL3M3G+5&XY3HN.JXSXER,>Gc,YM
c2d.3]6O27b12I3MfUVD0W&aS?,8H]b>]2F8HdZc[X4.d=Z<J&a(gL)S>0\gKX@W
P(KYf,^7F^3SFca[SX./W_@UK5J^7UABQ[VLc\-[f)I/&R4+[b(ZRS[:UZQTS=,E
-;9;N2D=OY88>F@dW02K&c8B2<GgBWgHKK/gKEVBAC7GXfXEJ#_9+50)f1a=7dH,
QCf2(U&.(2V=fFM\ZP/6;QE1d&KdLSJbe2#fb2K1;eU7cGZ(D^5T)+.PPPN:,I6=
M_&Q(ZPDXC6aKD61aKO;^UZcKd/d8Z7PGHDeO8c0bY>3=A:@4I:cG6KTcI=R9LHI
2[7Q+7gY3DR5K03?FA10ZdXYL:[?Y4[G(+bc>?&dV<_6@2aA6Wg05e5IOaVeEZaS
g_dUSMV9._?f]VLD\a^<TL3c#M66\VRId]_2Ob\I1<,XC>YGd61JX+#CG5IYb6]X
AU0V8,4_R>#4@TD\KZ6^Nb6>.LM0VM?^_-X[#X1.UIQ\Q/e10XC;Vf,Ua/^ZXOMd
Y7,d7A7?c-2IdI0+<R9_?;bB)RRO-E@;G;:J5IFVZKYDK.ITH&[23EQ4(?JaA,.Y
+TR;g,<QSKQZ21):++#R9IAHG(5)><U>M-P.\#c#LZI5#^NMd5dIgE3@.b:E+-2(
AT&4_4EIDUXg=U7Sa4Xa8D&C^?&CSL@J62,=]>]cKI0HSbQ[GW77RUVB0Be=TG_S
d+f^S4<SL?d?9CSR-9@Z+#.BULI4(WeW/D+b-QZ3M(T?KL_FD+_R,AU\((6#aXVY
KTgSb_>.WM);-a,+D8;33F^)GPU?,5gP.&2,Y[V2]M:A^(cSe_BC(L&.JW8LSHI.
THM4;_J>EH)E0g=#A.eAN4@J<8g.4+acb<[E).8>=RD>?Jf.US6>@f1([(?f6&bR
=VBPBeVbL;G;2?+XEaBe?K7K:Jf[Q#KQG>7SOZJWVAa<ZHH-&]HNTNPU:B_TNZ0N
CQVdEf]J9eBGY,a)XZ<61.&=O9gA1\>(ST+B^/+QSD(K=(_=URI=@TE5>Jc.O+[)
c835\-?4E?RW(I5)O\FT:SWGfJ^Z5SS/LK29e77I4)])aeDOFV7gD(?)eb\Nee2b
)0,.+a0b^&Y8<<^^L0;E4:@H[NMR2:gKbdCWV>2ASO-R@\5OCX8:cG6,O^5H+Y(H
C-fR0_+;FSPE/GfJf\[-8,)).Kd+\[/K147IFJCKM(:e(V=CcR<1&.Q6T]1BU30c
:EbG6I5cF3OIOA.S:Q<;=R][ZHAAQ]V84e:gc5PJ=POB]VO[B[6S\FYbSI/?Vfc)
4d><D\5EH/dN>MX;I>GSR?f3,V:U[W6#V\?6Y[>bUN&?BB1NEB@9,#_YD?XHcQ3;
A;J+CMJV9OgK\N=^2\_eg-:,UH^7_de(4J/b9;Ae[L.;]F5;9MDAJ1Ff7-=/Cec6
[?=&32U5F?T=GGK=.AOFcYM7(J]a.Na88GWee^[G#@IdTGA,.0P/ZYP3F2XDcOf.
41G<WM9KT/N6cK/Q.L:P?M5WPQ0(#@8(&I1V[^bAAf^Q/HL5R/VKK/&O5G-fJSB.
-C[N02d;1WY9#Zd)2FX/@:JZ=-62>agQcE/3G=M\S7#1=D\</Y27[KO0]@:Ld4aa
R2^APJScK2^HQdAMSN6PH^1bZ^(1OU:L3\P8Ld6TGPKRfB<B^6PD;YCS[[@S1ZL9
_LPZ7@A[SN(9HIgK3B.#WK^O.5I-AfS#2b7)EX(eQ-E/Z@PZcKY&B2E\PR3dGVDY
FI39cZaD:f3?Aa8WU831&Q]aZC651GAG]d34eY>03I<VbagO6AX./^II]@><MPd:
5NL9cLWWUG8JN7LS<94IOS,\a<<J9]16gL[>B4\E\P.d3ZZ4M\^ECWRW\)OR7b^K
/(9]3,_c.;E@6:@NHAX9)e+G@8Y]XO;-PAJ?J)aG_RB)eD)SGEQc1+OR,YUbXEA2
R8Pdg].9CWY\].U9S6BQ.MdVH@FAe784VIRBBcW+^PK3FT6T35<PLf77W1C.S3:\
88_^^TR_=]=][I4]9;C3LS@TVXc+:fQ9GW[3[V,9:Ud0NUPUd(@\OIE-a#<gf<5G
OZ276_.\?2GD>.]:d0L,ObM=eb\P-1SS#:8/E5,EI9=#.c&TJ0A6[19KMQ\\G8O5
C+c13&-g:TPe(:5C#GU(?\BFB\V=\5WF4_MFAYS<aA/RgG#(6\1U)>R/1_A1JU8R
ZR9,=>_:#PI8),7CHKcV&]gI6K_bM>N[G?E7NeAIQ@_YaWMdP=6?V&V;gP>CcXcZ
)2R(5?gW6<C]H6>P3f?PTEg[f_9W=JG?M\YAC+Wc3+6<L@VE+acYNaENa16]VBXJ
607M9QTa#CN.F(L7U;J?aJRAQS@bd&Fa;[80LB@=FF&S]QO[b?.]d&NVIWb>J-aA
fL/+4g:C=DeX[M2b,F1=X3@,/\CN,5.B^ELAO<.[GHUN@[G3:^[6KRE._b849A(3
WC[d\7K6<f6W4\WBgR^7FWLVW/QQUgA.FFY7YgFbOB,5@IB.:H?C9#/TC0WI_H30
&XQ/.-BEEU,HBX=0QPPQ_&60LAacDe9&Z)Jc2\+dd4fP)+B-eK85+2W.[S8>L92E
aYSB.L-P?HN4bLCG2G@5R.73.bFKQ0+L/FPF?OWJ6c@;(>QMGGA?SPcJG[gBXaP=
W0D]P1L.7BN;B>>1D)aa5?DOPDT)AU@TKH5cR_K(+R7+UI>9?dUaad/.04COAG@f
)6BP1NE^dGPd4G5B+JW^9dGV+??].]E9G#EbKVe#+(cN\fOM1E?=)gP32e+J_[G7
5MS#VV;B=g=.Z,BJ3&2<SA^TM^JIHL0+M#8bIHR0O[IF6RE3/Rg/dTH/526ML>X(
de//H^--LTQG?b^O0#O<GT&I-<.4BbZ=EDOYV#CZBI]MU6F,8.#04#-M6c+VTS32
g[<g-dgZC)B9TL70;[/F8N7McP?NadgWF9+OYc>a1<CS@.KAdW^Taa.8=aD<>(YQ
HVG=H<&8\?CH,Q4M2>Y8C^L]g:B-4^)0Jb:J,5#V=fE5PAIOE-4==T7b]E=DANQC
>]NX0L#&:DD1.a<^VA]U5bE3&1R2I8UT=+2K_de^=\]44J9[a4IL_EYfT7OQR8,A
a)(A^D^[].0FYe,7c2bYe1.&e>TX;X:^Q<=c2UeS[F1P5B4NH-2D@0fGQL_S,>P8
E1WI]d\-5FcDNU,W/W(FX9I;ISe:TNF53Dd1L/?Y1BZcV=N(,;8/a8M[O&O;5K)A
SO>NQW;U@CICTZO2@g+e;>K(B_g0c/Y7@52?\X;GS;P<A?SZM&<(&>(UO,>df^SZ
E<&F.f8LTQE9FMBY<[07Z<7.?O&T8HaY.,/40:[0e]BJ(01OI+__2ZPg8=RC\(.^
&-NT#R#(#IX\:#5EZ/1J8PHW]75FLM_7(DY_RA2\\1eYM2[[,NOFF[:]2.=/IG]4
RRD#3bRa)a0;K=6_:T_4c/_CK:=ZB:QGcEJ4#3<G]47cKAb]O=YeZ.,5A?OY/aPc
R/C3L)8YJdK4X8&7EYEJJ1,WZ)C<:PM1):I0<F<<JQ1;4W9:(DGL+g_1AE:(B>4e
@>MeCag9^<YE1[4930Y4)#0D@K>.LF\#AT;VPGMW9OUaEc?LY6g/#HbE2aX22eIX
ZCWOR5\#d6Q2f5G7R<S^L:dAXDc59R(LW@5NHH<<FG7V2FQ\_.RU1FbP_63(3H[4
;EfFW8e3aKW8UW/@dRZ<e4(-N<dd(L]BLaY6,9[;g0G2eR(XART>ZMA7T9FE^fT3
6f#/6Q-AYc8_]9GCdaW.E\;]C\F0^c6EIG(++?/DD#C,&Q)1(]<_B0^OSB__3-bb
2N6eU#<?L6FW6^:-2:F_bT<P-X1,ed2?c5SC68J(X(ZH[_O+L\\/5c1XJJeL86[A
(\Yf_=K_+8D8cJf\Q=G-Y(HT5Q/f54KHR1E?=@fQcLG^_BcV)_Z1<QR81ULdOKH1
e+OeB&aGDB71^\9729^2?THEE;PB=_IdgAQaIKgaEVaXa.[2\^3WL16VRYAEa\&/
_4?X^g>0Mf<&eK+RX2^3fJTV[J/=&IedY/EY_?V&\?f2BMfPY35bG2,D<Z7<B+6>
3(9/9#>+]J4583<QZf^G/01dY19<AB[@&OFAc661WfBOcJ=@TGcB?-=1MOEZgXDW
_(^THeXc7^/?2-TbI(+U8#FPB1S[.Uf(TfE60@@8J1:JKGK:D+b)QM_@#-(2@\gU
<YK(DWSE37VY-HPPLB-Md)G\,LXZIKF0?N59ID\9S#J]FTL.eF49T6NN:#TU.B/&
G](2Wc(ZBfP@.X#,@+>R?FB1WIU54?TT[BX6CCaMWc;]VRA0PD&[^3<LHAP_:NH7
)W;Ba@b6XNQCA[YUNU.PDBJ1@KFE[7#H_5O;QE\=e3?.1#gMY_9;1JJfQ,8TWT?0
Pc4>aad3[K3^N]N=4-bg6<0Pba6P=&)eV/2#(eX]:&9/Z@8>D.\OTaL<DS^Ge&\&
8>2;S_Y\eT@QL(J5]EUZRL-:+[@UT=GUI1(.#==QLRe]>[RPNIcVE5dM+Zb,;ZU+
&4AYQ@.ge1,D[;S,O-_@:PRAR4Hc1(/.<&9DE(LKA&J+eT5E_UO/7Q.QYE]8DN?J
#SBeHMP\S)Y)BTg@O=,3_728Q4\,Qg]4\<>?dgRb-_QP)S4DOYdDf_N0N\a37Lf#
]G\TOB]ATg8=a.#K4aPL#S;bc<c;((9@&K;f6&:eID+E^4[DO/ZLf?MKdH0XWFK8
2#DY?\;:86&6G&+8;0d3Z3]g>TV=^NIMLJcFHFZgGabfLY[.SY-)+7LQd<fXX/--
+D?KE79L=U&FWY^GHD1OHRaSKa0//Y^\Y]^\f[3,:/A05gG=g).:B4.1>JU8,A.H
N@.8U^@e:[\YCOAK0VfY/c,-fVKB&Jd8,DMY)/HI@_-^d.#(5Xae?IDK2&Hg4a-2
K<8F?IUN#f0&P/S,3FDUON/7XAIOQ#I<8[RN^[\_[^5+.bE)S)+&)(F_f2?@0)(I
f<I8,EMC9[N\Se],E?IOL1,cSY3X-K6g)[_[_.1c7R/ONggJHJ:<PN>DfRKY@9N(
?XRV/5K5#A9>NMLAK2fbUF3GLA;Qec@SB2@SS;&<^0F7X;DQcZ-(\+6(b^_.Q([b
5#N<3f3,?Y0,D,/<1:W]]C8)[/g.b:ZgTDMa./\aWIU_F5UH.15RW9W\GgHB@[JQ
GUBDgMAaTNMc1@>FTRf166d,<9W-aBDN6Q[K\FSgaMgLCK:C9Q0?BVd,af247ODe
L@1I<.^RO3553bg;;&K]M)VD-6]H6U<@=WdeaL,X+RL?</[Y;&_:BPW&FcEf:TXN
1#;W@8EHZ[2[a:RA<H[NT6\QWT/b<cXOQeLSJ0;_H0AG;+QbP=OF25Pc0fN<:E;(
0C6^&AJH,eR+9S64TCZPE5^9ec1W369P\TH,IO9D1F9HgPVUG7S_-_6cT/BA/d)@
MSeP[CGNGVEg@,B-]Sc^3dg2f&Z/G.&].YRYC\:G0-UM[[F,eZa7E5G.3)&=f9(K
:)T0KDK>:A+C:2.D[+N9XC.>NIe2=X8VB8Oc2O0EO;/28R#TdC2Wf=ZNYY34?V:8
>4([N;QCC;cIL?8a.fGOE]VBaf2SX_)7;cR/R^6R?IZF:eTYE[DGP5)(N\7O#SN8
Z]e/HC^e1VBa<@0:,d&eZL/BT@4S/eOdKcdb#LeQB@D47=3dCZR1c6K3M;LJH)1)
AB-[BEV@<J/,W=27M.ANUP+T0QX(2[gRD)-GW<2J-d?4#g?5F5UZ.3\_RfW&gF>N
>9=a5Ba3Kc<W62O?:F?43HeM=PA;L4YeOEaB/M4AG8Fgb<Q\]F=#cZfJA-F?Jd\A
H+GM5KeVBQ@0&a\JZ]Qfc=A#:]&OI4>0]G_VLcTMN)[D>K;N_b_Y@NN)G6]T9#?(
_B9^JGC7bD1XCf^J^<Vd2Md[WJ6JD0_Bec]GD=]\0J2>.)gZd1-d#T(TC4R;F#/L
Xg>g=7M6I;,N(H:H6cHVA9/g13K+&D2>U6/:9>QV,b[[.JH32(AFO5AGZQQKgE8D
(DY9X>b;9#]c[L;aR2PNO6^&92<9_Y[RLR)e+#T2e1[8QRRIdL(?=AM<S(c]V=T;
48MEV+/2^R7c_VLOFS)413?ZU@VU+8=-6?,XS#EO@2;f4d4I_5\]H9Q=.1Vf24@_
D;(D_g&NY1)8^_,M=@(BbSaFG&EW4Q76KXLMO/-#:fAO,AUJR75dU[cB+6&QG/I=
&>20;MH[U7H@H6_>E<_>eAJKS.bIV>&J@3I1Rf6JbGI:Ba?_1HWJDW]b_,)+J#0a
(G6#I^&6<Efcc45=4&W(daZ8fdNL^HC-e_C+>DH@N+R+>)4e31Tfa.S61DEP5_3]
G(30d?dCEb_#Eg1QJC:56R4.L)R-@F=Q0b4>D23J;.V/MCf7ZU,#W;5S57D^Y_M@
aT@0K8,9YcbUF;/H,;0Q[/T=KQK-_@<Y?GGH-5KZ9B-Bc&?Igb<dKOS^U./C/f8U
g7@F9:,WXZ4FD(W9;f7A0Za=?,59J3a[9fV>JAB&ZKJG]J4Qc^BAdSJ/VgNB7.[-
RNO;<Jd40]Ra^H0BfI792)LTS97-b(S>;WQYMG3e/(;C-WX-]YP16BN.L8C^5?M2
bQ4TJF0\&7@,SR[N\/+-/+,P&?c9d=G[68DF]_<ZV7+#YII@\H[CB9>0ZTg^/,03
/R-^e,+[>DebK>6.OH=P23.V<5BC\6dBL8<)O6[b7C+eGOWU(.KW9?A0f/B@_c.;
4XZDMTdN4fB9+AA)\[8U:A7.BOFURaf7eM07U&]BP@I&bB<GPNGF;4KB:)VECE5^
.C^-(d@U]Se^]VJ9a>YE0PH/;=4aV[?D.fbVGHH(C6HF5\C1.[Q#9cZ7-U^b4JY5
IAe.g;Z2R./3A>&K#L;0?#R10M+eG4>d7-.fQdW>608B2RS\BBcA(?Y&ZYB6]SSA
W<?9L76@.dKUe;N>QW,>BYEA3>e3T>I^42\\/A2/O+cHY?cbNH_NM6K0XG06QZ53
78&,cg#8P4[&A:b\ZU,VNcZ?D^aU(6N0LQCc4FK>D2;fYKZ&+XW\97AWFK+dYZ^O
@[T]>>0BI<&:][);_N.B;6F(4JQL)>.I[gcPT(Z9Y5@5(6@ZM[&A5f;HWSD#WB&E
Ub(/]W:=eKJ_c258=bAX-RCQ.(VD5-^@M?gTcH/-YccMK7K.OBR)2OPY=[DXOA4g
SL#bAgMK7:Q4>8@O1^Hd5b0\gV(_I7XI6EM)\Ff5[@V#dRNQ<OBWJZ([T^<1-2@I
C8OMe^SYc?L-Z2b@Be\SW84K9<A6NfWADB9L7[:]2SHdafBZAYZ7K#L<+N6F]J=N
2\AWg_N?QTI)..XSI-Yf@;f5/EMBB;VV:7J(CKWYIE75_##&M-@>GKXM&XZG_aAH
7S?&07Zd1U5IVJf;NG.P-dE;>E)aAH:/8cGT8ZA[@b\-\^E5P;7[2fTEK5D>@>5;
VW?B/ggb?;]>VN/f@(]]OXTQFfZ,LcH)A:BM0-P][;]ZKPd?.M/U>WU4UQ@5<6RR
9V?(g1f;.9R.LFIODf:UF##@cC<&WY)8/E6OVFe\F3\:-Ia\M95P>;A=S67KF;4D
ARaEB5YT?T8PZZRD<&dN](RE89&43#OBd6^aTHMHa>gfROEIWL4GC9C:;QTSS_W6
A54:XfMQS^\P/$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV
