
`ifndef GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV
`define GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S28HS and S25HS family in DDR mode.
 * For S28HS, this class contains timing Characteristics for Octal IO SDR and Octal IO DDR.
 */
class svt_spi_flash_s28hs_s25hs_ddr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock period/Highest Freq support.  */ 
  real tCLK_ns[];

  /** Minimum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_min_duty_cycle = initial_time;

  /** Maximum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_max_duty_cycle = initial_time;

  /** Minimum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_min_duty_cycle = initial_time;

  /** Maximum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_max_duty_cycle = initial_time;

  /**
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock Period for Extended READ Command (SPI) commands.
   * Applicable for Read, Read Silicon, Read ECC in Extended SPI mode.
   */ 
  real tCLK_OCTAL_sdr_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (DUAL I/O) command
   */ 
  real tCLK_OCTAL_ddr_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QUAD I/O) command
   */ 
  real tCLK_OCTAL_sdr_Read_volatile_ns[];
  real tCLK_OCTAL_ddr_Read_volatile_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCS_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tCSS_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCSH_ns = initial_time;

  /**
   * Data in Setup time
   */
  real tSU_ns[];

  /**
   * Data in Hold time
   */
  real tHD_ns[];

  /**
   * Output Disable time
   */ 
  real tDIS_ns[];

  /**
   * WP# Setup time
   */
  real tWPS_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tWPH_ns = initial_time;

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns[];

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns[];

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns[];

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

  /** Assign refernce of spi_mem_configuration object */
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
  `svt_vmm_data_new(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s28hs_s25hs_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s28hs_s25hs_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s28hs_s25hs_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
6F\IWNAX>8XN7@Q3=\,Jb(0Sf;&(KA5&[7LOf>bOBMf[UL,10^71()W^[dKaFFJ&
e;&e7(4J9QYPN,KVSfOQBO&)6]FP-QQFWW++8/+S#C85Ne9UI@@Y+)U700J=J>M,
M<;90]MZQO[;:I^XU3(I^&<FMaU2)29VKH</SA6:D98<6M4=JPP&bL9Y+2AY\FN\
+I0-#Uf6HMG3]IF^Kg.+Hg=bfBM+7#Y]WY5AITB_-DC3ZFP<b^e);Q3#)VM):R=7
PMD_.:.cXTGK_)ZE)ZbQ5BH7-T8UT8b<g/X#H[OeL1F85]-a)>+9B;7TF=Pa4OaW
W-QgE)ECK@AVN#c&,,&;:7R@4:N[;_A[J;R4(:Yb&PZET3.:[3JP:Ba:#B^AD;#Z
>\J7=9YD+-E5+f&B>\]cD]g0Q2:P/?&a8>CCR.?bP-O->7#8;Ee+/9)Z#2F-PJ1a
1GAVJV484(I-Zd29@(8Z4S[X/3JO.PE,OLSQd\WU/:@PM>/3Y,8G2+S/;ZLY-W)U
V._-<094&12,WBNER^)\Y^QG(8H5=R57:aP.7AY@0[eX)Ng0<g\Q6]K3036?HL/8
d#4&)UPRcQ6J]+3=80U@Y+E)ac+=/U&[V5g;#>.fZ/WIHJAO#97U).FUSHeg\L[Q
0b?a@R)O(T/.7SJ;U/2EV)KVBH^UAg:3?gXQ<.:>.F=6W>):O5TdUUDKa5.0ES9(
1_M[J.P@EP:5O58X@=BDb;;.#-<NRCDO[U>3FfPQ]M?>X9M3RNJD]AA1bUF+I78L
<;T[VWR:?)7d/>F9G;XBdZ1.eC0M47/\WBIg;OZ)G&WMF@f<fCP.-GA1M$
`endprotected


//vcs_vip_protect
`protected
W1)79IY8K?Y[/Z\U>AAHC/Ve&Da<]PR&-GNL-@,/6ALBbVM[A-BW/(9DP4Q]5TXK
SFS4A(Ke(a&+HD\,],>5CWX(Q72X)X&abfa?P?Q\=[^O1^F&Ig7.<08,^CBJO^dd
C>d4Rg+a83M@SgN9800H\>4gZ8ADB@T2,V#F<Z_1Y9.C[CZQ0gT:0@6CQ7LCSZYA
^Z7&&E9NV@(fB50fXB=<X4I#O]=MAFaf?[4;RC3RM:L\PL?-bU81/=7V&;MROG[[
(ZeOPd,/gB&KX&F^Vb=KV4ed=;M7@GI.N9X.&_]59SS<:J@W&&\QYEbI_&K/5[a-
YVBA#GNG/c+>T?CI#dLdN6Ra](#AgdL_W,1J9eg5C<C1(41)=eE,R)2#2]DV_ba@
MD>KRVG=RIEUJebeN>J9V)FW97WI<BKfUBH@KQVU3JJ3O9@?YVKK@Of<)N\R4SNZ
67M85W_ZPA#GZ+VT&[gM-bV3W/(B7aP#TPNOZW[L7KaUHBd\/L]#GHU971285,.;
&Ta-X-e^RQ?B[^ST\[Y>MTH.(dUIZPD\50S^3fgCD1M^W2--=VCfRT4[=;=,M>XS
9Q@OA;PA5,-L,Ce.8#WL0^80F587?=?FQCTeS;J>62O\YcT7]]Y4GL>QI8Pf3^;6
_ZA4:+<#HaK#9baDVZgODMEK+YP94K6]SZag7M/G2\Wa[OM966U]+1BGO+^.7ULA
(e-Q-20WRJ7HNYPJGNg^390CCC@PFIULDZ,>,AaUTXcS\<f(+4Nf+#A._1c-NJT<
&,1_?0Ob0U?eW77YZL,8=g@NC@DVY2>b4>S65V#N#]eN@F\UHN&ZcaB\@ZX(.@J>
d?L7.FQLK;-;AZCZ&d[\W/&G[>^,)89#<+(LVLg[L5[@X[&a017_YRd@46:7I82.
I3RdV+98Ja(S>7OH;[O4;_X0MS43=X_@,YKTI/01?C7X_1gO.N6>:e:L_DLGfIUV
;J7]A>[&=@fZf_+gK?JIR1\dN:@5<K\//7-V9B7PFeQ1&cg.?GEcPX9QOQC<cU2J
,cXN=A[,LV7W=>=d?6>@NADbRc=H?ST<H2-C=aK<I\1=K96)[;I?GCG7G553>SPV
T,4LN^UbB([4.T5M:fCb8,42PgB:#+T7L[eZ.8cINQU<7effTO+S3^O1M>>_;/-9
-_\eU3/H.@+A_14fUbY]XK?L9X5gF7a2bQdf7(L](:g-XZ6Ig,?8JD8TB:<LK8YU
R=C_>;@[f<\I_U,VU\WC,51&<4a;3Dd@c;A8?RSH>-C<7(^;2e=\/@bXbcC2<5,S
G/S<;^)KA_cBBV?8Q[.=LKQbSWS?Yb5IX<#Wa7T4LIc,N890HZ?#d9Zc,)aOY<LS
b^/=,AHfcDJCFVUc/P-RROB6\f<XK)V+1IP^XF(g_YP.I(272QW/D<b4AS^UZ.Z,
(=IX\c@O0XTN,<]YOG0UK37\(R4-TY5e30A;:5-P<C[9>6CRJ:GO.Qb_cQFSbIY4
M43dfOLPF#&N8L32N&745[9+GbZ/(4R(3\9@a&Z2H-@M#d(AX+?TTF0[HS/@G813
JOb]H)a^3?8<AN=)gV8E5b[2.A_?:cAL4).fcgaAM;)2:Aa[@KC+IU/McEQ6-O20
0X;5Rb=U5.V;Zc;2fES7R)2T:W25-W=U]7FMYRNVXbdAK:+)5A:Ie[/?VGD6431O
=]5eGb6ZR;-_W(&1W-7c\Ng<J#9-[?F-KHA&?DH,cDD]3cYG]@<YfdF9b9>3g0f;
FF]X+6U-c#&#c8.5C2OdUH[75ZcgTNNR(((C4J84Uc0d-NP8O_eaO52YU&MeHK/F
[<?T[M^Fe,DU1B^?g6Q3-L^PZ[#]&GcU=-3@>bV@I,^9M#UR[e3g1e;@/52BXGNg
#/&DSNV>Pg<QUH<f&1A)/@YFE34]\)+E@-b0=F)ag5,I70e#F[[>Ad2bB5VR]aDg
-9_T0,?N1BK0SdU)I:1+(Q>)CMD-,]UM^EK\SaA2\;E(0f7WZ,V7JM5V57N5,@IO
DH]5g4]UYS)F71Zf\LM#NM&KV)^:aEQ+]:_I\G#SXX-G44<VaI?37cU,TeDT:b@c
XBTV;=A:PN4G2_+QJ@4e)^@Y6.#J/[+Hda+C6@LZA^e2AVf@5Ycc&+7MTAH-;Z0O
;K[a2^dX;X(K/4Q.S5>R21ecS,PTJ68?c+I^0e?RH&FZUN,4+DQaL=cNeM\-N0f(
#gD9U6+65R])2UWRWJb32Ca950Z__SJ_e&aPB9gWK[&O38#POf+Bb6_eP5#M=PJ^
aSUDX[;[[^T-/Pb2LgVd&-fHKT,([.=[^TM^O+ce?^)XI?P3>M9GW,UX7->)Z7&A
Q?<J&bS<2<20WaaQWBe/-\>/P[B&Y5L:T/XF,HDb,(]@eX=f?XEJ6A@_R.g6dMP.
gJ[RS&fKf23H7;Q9D:-;/F8fQQ>?<8OC]IYQX&\/PJEOSCE],Z<>9=&21CG;I7A+
eI<I9GCB>Q9KQY_(X?[A2R/0)KeY/\gD)2dIP[46U@0BXLIC142R<B+BA58,PL4>
c&]fVNWcWC[f6_[;J0SX_fF(V3.@O3;_SgZfc#_M\M99H\0NaHV0#,;,4]XID32c
Y6Jaf1NB13+A0dV:;].(XFf4PcI:eF4Y)78Y]Y6?;VKg9VB6^FZ5UD,+>C,,0OZ]
1.BWdC]YW[D#YDI=NVDc>FR:Af/J7Yf[K-RSRG\36R_@QZLUM7(X3.4Q.PB#__2U
eaZNHGQTf6MGPEH52LN(X(X1O>S6OXRc=1[)SMO)W+U34?WV/-B?3B#XRBS+dMB5
BZ7#gE8C392>PU]Kg<J=,9+^8F]b6WBKX[#@_OM@REe>d_^6HT2:e+;:S<,GX?DI
9Wb/Q]5f2]>e&6]F:9QEZXEW(F(?R3aQOCMUA\_)4+f/Wd((<ORK9,I6OeeETWPF
dE5V1R12fAdH6-X>^-PPWeIeNBWPA[DT1E.Z-XRTFFAYXKAW(^](FgCGW,OYc(P1
>@4>5.,.@MgNgL[.4<GQ<]NB/3-7.K+[M2D)N5M/GTXfM7R[1KTe0cZ^;<N<H97Y
FaA_:.1AG)3(8N[M7>--YM84eH1]LLEfI.bAbb\aV\+\9Eg]D\WSeSK&L^([YM@>
Q28ZTd0?/F9IT)-9U>GYK]7@H,==-)TT<ZRfUY1+1EW4OJg4PA_#Z#IEH9gZ]=K0
+?Q;e>3S1NCP>6[JK?;PG,UPMA#SK&B\F9XAKf&P^Q:_Q_/.,T@&)B[,FJKN:V;2
&SASf7Q:7SH15)X=-9VdZgFg2_=ZT<X4Y1b\:.[=PX[&OJK&a([QBU@0@]:LT?ag
;_V-/TXKOEMS21Rbd.=JX,+TQU;C1#b2&QZg+15=.-M#-(EO<IDE/f,5Q#T6K,R0
)^24e1RX0A7&?]3gF?1:?NHdb2#Z>UMc&T;L.D1O&J_gZQgf#QD4=T5?Y_AZb8CV
Q@=OZV/=,HW_ABVWI&F8K9d-:P_aSO6H2@YP\4I-(\b&,eR4gb^c5Z5Ia^,Ef;f+
Z73MIR(1=bFQLP8LGP,c/>[-3(#&F1e0=c/<[Bg^:2)L?9PcNK1]&XMNWH]D;P3=
[McZ&FZN++3>3T(;0g7Y=6W4Md8F?F,J2D-<DF(&<CgN4.+8:0GE26G1,=G4,^21
92We<=S9V8H9?Zd&,8XY\F6K\d,>49V=5_5c]NN?3Q=J7@#+^X3+9@?9^SCJ_;Z[
@77Cc\=1:7]TY[O3O4G0O3/e\Ad3&XJ(_aaQC-GS^?;U#J=&7PA(:6<0e6b;UT\T
6S@94DaKRbTe<MO?10,@(#IEE1S,_>HWMFGJ51eY?/#ZBF)@9a#\GLPC=CC)AVQ+
5Q=I6/YF8N&[>5M93-F2bec?KT>Z,d@Da7/cH.XISY?8-9cE3HHKJU:]W]K@<fSb
:0A;FZZM08:,_N)RINBLc65J0Y1LCXfWFbI[57G.07JF_+XR?:1fHf\0H[EICHSc
>4]BXQ/4H,0-<O,B1X+3A]ZU:T7.3d]PVDKDB<)J\.UB@]B0.YN@WD<7>UR5/,>c
X9QM?^I+.^HRAeB[9]RV-O\LB/Z>9/-M1,LV;Bb:8>HTGN6YVHY^dg1a+-8)dL2C
Q>V7KbRDEP4B=>Z0D1aaJA_^KB3_&].BPZ:@U+:M#)-.KM19P/EB/D+E;f1KA:_F
_AL)(=/EF0UF^+(c97d2+A(fdUD2+d)&9&B@Y7H1?&XBS4,b27)^GC&OAg6\+[J\
1]W92W[aDQ?EPT^?2:.3@7[L@#QgZJg;gdS(N.<4W^^XYBV0];B6/>Sd@&LE:0IG
A,R>,IN&e]QRWHRcE^QRQ(TTT+\[;[X&RY?E^F)O]XC?KC9>[aeAGTPWe6;PFE[J
Ef0XdA2#T>0.5[\3M>6=,5H:AF95T/(/H<7>I?(P\.Pf6T?XE4+#8<IdeM,EYT@f
1=>HP/dJdJ.d]-8:?<A\=HRB0<8M>/84?9RZA+GC9[8]NcaH+WE3?\98M(>3A>+X
+FcZ9(GH:./JJ_Q]ND,Ic)RabQ^?^gM7_f.RQ6]BC8M-f+:AC=HI[?_+a+VGLR&Q
&YFIEG5W0OB5Jd]:LWVeA/1d2EL7&^dG/;NDW[-7<EM7Z#]ATI=N&UML1KObC?8<
)>W/DIgR?c+U]eZf<fac1NNBV>VfERR4QIP-1TS>?e)UA_YYZV\S1[DJICMWPMD5
\&WZA))5FYQ))c062M2NHGDd[V55A3:&\B-P@&4C33&WGH?<5fM\9,3HMaM2AXOd
KF+0B:^U/@GN4g2]F^&H6_-JbMe[PV#:9ZH,ZF7PaWU_T\[\K,UN)dIDXg;O+K/K
RA?]]E_A]7f66NKBIK3Za-bA;3)^#1X94dDEA_dA@0AT5W)ceWCgOdMeAbNRBA)U
/5C3Sf6G6Z4g-7/76?5MFP&eGb09Rf^HPOG26:+b1;A?AL7QNF>WWPJ(.D?_F(dc
=B,C^gC/]Dd;P?M_/QG7<ATfFcM<b4Z=_X5MO:<bC8G55=+Q4Ka<O@QLTc6@M/g6
H1GK?F6M=A>E0JCF85/P#Z-/2P,452\IU1+?COAU<bKASD;S_HAcOPd=Vb6/YgG+
NJa\:?aW>X?g/+]7<&>O+@,Q\cL^8/K^Y;VLE.+AT0N>c.M]M0X8^a+BY4\49PFV
<d91-.FU/=R_:0#NBJB;21^<>VTX-J2.^.TbR:(c]D@FSc2dQ8MU(J7]0?Q)UR_I
WI)eK4HB[S;L\OAETD9#=62V[b:R75APVN5ELdN.d;b3N^SXI9^3GCGLe.E7+)(7
R&V3]-D:SE3D9F8CGgL40LZ72_(OOZXeP(,aPJPaYS6.Y_?0HS28I@H/37B@F\[F
(33U#H)Q0(N&=EAg5<:.&,@&6]W0HIKDEdJB:8L)aVIM7S09S[R6_&[,gUX78cBa
^=NX:BZV8OY48FbXSZ[/[1R14]/F/@](Ag/:,_@4]I;4)Z(7@A(DW&#LZRX[KG:f
/c74\9MTgTV6SG3G62f25B3-YJ;dUY@b8,V]&17?@>Hf9EVfSfUdb]<0>9-OCGca
JegQ\dIDT<\a5@;MJI)AeMA2^[9,U#O367bOd=,KKB\_I#)QI2X.NbPHYDF90UcG
-&Q2Q]JcS3SUA^U]+.Oc@Nc8(EI^/dBNY,1J-,(A<Q1KZ8fU4Da))3X,_KI&?&G7
<YKT;&=-cXM0/^Q]KZ[[K]@H\M1eTT)8eSY,4<?FYQMIA3d,7)XZ/KbX+^;8U)OO
L/)=;1V&-(3e@XW]AMZA.DZDN/?^CH=PKBWG>>ed7OC8/D_e(.TK68I>aKB#>CNI
9&_[JG0ZR=R[F,90#M<G+N;2VeV[OL?UT<Q9_O)cdWTTDSRf-Gc53QA-576A0OHC
6>L[:<V+Qa(],gLA<dF91^I&SPcU=EI#BOWAg[gTFT=DIXa\?D(+b1+,;fT8bD]Z
E;INH0@bT,=^.(W3<RV;U@e:JIXQ6Y8YaTI7Y<7.XDg\&WcA.5<VBPeH_>Rceg:;
2-NHX?RgG5Z<6G#],_aQ(\f.5FU&4d<eM)\<^?#f82bbK&HOK<g_+B^2SATgL#.L
4g71CHHLOH&XKMK>8UV@1I5ZgX=N,_a59aU([\g^M#5UL:_?a]G]#[X-V99EM8-A
C+I707d>E[KZe.;f8G&BU.C(XFOI1IFgLc)G3WVMSLMKPIG,B(e2^SW+]4TCa=VM
>ECS1OZCMO-c&c=EE\@DcR4:T/CgHO9VZDMFM0e@A3TL3?-d]Z3CCA+@KM@4DEJ2
@B9);38f]PeRS:OH<7D0.&\6\N3:,^D>P^J.Z97C#=#8K^7+PY?F2R4^^J_Y<03)
AF85(S>&)45(LagRA2BGGR9W+f3]#NdA:e851>4DDKL-;]HVVS?aO-R9C_V>,1ZS
71.V69[fDLX3+#?7S&:Q[UBH^+SW_5LgX+cW>LH/-b_92_(;=fDG81O>KF71MQfE
?.dW@e?.DGd:^?&>S4@_fADdUCC4&9Fc#Q@1NF[=7?DBS#RUcI&T9PLRNf0_30?M
W+1_#M6&P[Ga?/@gK0_2S=A]Q=cWW5-9@?QVS,8M;\=.>.Ka7&MXPQ@(V7ZM[OFQ
+WNC,feRbL>4:3@MR\>0L9Ma?g2)EQ50?+PdbR@4d6dJaB.ZAPNN4VTMZDZ+1X&_
VJ8(/OH,JF/=4_QXdAee&LM&9Qb641P,;eNDG8a4@9/RMFG+-,_WW&UW:DW4_IFG
&M8^X>),C:R#8_ICJ/G4Z:H1c,TL?f+cS[SaIX6VQg9<g5Y=RKZVFVa+VG6W++T)
PMOAf)^g5Eg3\;.2PD\?MHYW(Q48I_:DE]AXV:0;SYV@WAZ]#P6#YJ/^a(YT/AAF
-FeR\]?24K>PM;1Z9TCfO4:R#JI79-bQG^\H4O0>gR,SFZ7[1?U,e.Q((47;KGGG
1\C6EL^N]fYF6[c6#c1aY[53E,K)9I.D#^#\<V^RY8.A42T9S.b=LL2XDD+4#ca#
a@KNGDS^MXg2e(/-\QdGWV8@I+=H-^E2_eGgbD2_245,R/5@C=:d?a/Z1CM2KSdY
+>=2gFCg6:;CA9KaTW\E<WJgS&EYK+[^Q3#YK?3O;Gf(BGLN_DJ+0K>UOX5P=ec>
/Kc9+/ASQ4D?IDX19C-_<?RFbY:EP]PMW+9Dd?e;17<\#B>6L8,,-MGS)]@5#/Of
R37Z9-[Y7bSB4_2P<[?IJWR<BN7I(W[N?IDU=(PMG_B?NOQK&F>F(QBZJAVLdWNG
NT5[AM4+N\^MKJZC4XKU?[.(#)QT)8Z7\CEOaH<b0?VU1P3;V5:(/TZE&CA]-G@c
Z\.Ub0eK#AVKZ4ZcHD6JM\:LBR\Mb<I602:N289KaZb;e2=51+=[3RO@MRV1b8Gd
R@]>=^M,EWeOeLU_?3N5:QASME77\CWfb.M5BC&]]1D)&f56>6g7<5\N(R_>8AG^
R^)b#_+6T4\?e@_&bTg&g=+Q]>\AF-Yc?\EeLVV\GGaV@_bL@UV7KeSSVF&F9[])
#:OVO3PMU1/G6b>XcW._95VT66T:&VfLT5MDFC<L=)fIF3(?@@>X=O4VDVV/W\F^
L.76HTbX21U@P9NJYODP<=87>@X2KaN66cVWJ2&]Fa(?AUQ?_QD4YSVgAJ,IQ;/X
Qc7Z5X7&/1ZeS1(8>ST@I:+)I7>BQXAb6ME.H[HASK1FJ]4Y9fXK5K3<[9A=6D,g
9R\.4_/-PcAgB5:dU/R&:GJOG=7VaGO/57C8-]b/Yg<.BXFO>f[-XWN>ZA@M7Y-(
801MD#&1.I;BFD(_T=(M^W#CF>]WF&af1U5O_=&-eX0C(<PS+Y,X/>&M^=T7FX)3
&:bJI@;SZ:)Rb3=Mc/c1-Md7(G30b.c=-DJE/0WQW1\,)f+,:E47+>QXI5Fec=@]
9J<d@K-O6D#?GAcd2V,P6d_<=P(9a7FASa+eY5g94/K<(=^=bQ&N[8)[K)c7:RWY
PF_@S.25dN6CQ@_C/T/9#\1FE>MXaDfL6cK5P[Y=0KUFSO=[bA]^O,#0:LK/&++U
83f(g4g/R&208eZ]_<[@A^1TS5(_ffgFC-=.#=4Qg1RAfSAdc>93(UdRN&<TCVO;
Y<G8^^8=R4ee6@VAK]DK(eaW))/L\>S11g&:,gg<gN3TdQEM6aU)T4W5X[=KZ,4C
NgbDG]B&&\9a4QE+a50EATHU.B]MAUbQ>VL4OWg6_8OWPQ7#ZT[+D[(bbQ1F;ZC:
(@JIIK&?)?,aG(+]X4)R1B,@8L6dXI^/YPDV/f<.2(Z#RCB08Gf;_9Cg10L@0IOM
S\6@9;M[]:K2TRG-(J^@>1FAOcE@[UF1^0fH9,DA@K9bQDDR:02(dV-[9A7HgUAZ
XI)<\PKFVER815O\T5M@])#6TL^1NeEVIJJb&gS]3gK(8)QK40]6_V7fbWDW@8W5
KdDK_egQ4O6-cH,O9HY9I3IJdMQ@S)?>cUgIN(SgM0)YeC5CV>Mg?98cK0b\F.4R
XGGKU[3gL=)2>AIX[ee@_>R&6U)#]aD2b>).H5KMc\?N]HF3YQ7\UMZ[f+eB[Mf1
fe-,4,cYM@KNaOJd&:WL^EH#5BM3^7/@>J@gcYO<0K7>M[EL@/41P+I]DXaRcI^&
CL6Md06=(aA>&GF#XL4_MJc5ScZGA6@Ga0Y;G]S>1X^:3DNb#Y&g72M+FUaP?F<]
@8>;KPCOPfXf4)aM/K9fSA4^GTT.cb=+=^fK^3bGfGb&?5]8O]>]R.[:6S_\gdW2
AceLLD4>-LBRcT7bLK^O,fPg2Q[,XTI+8;+UM256Z.^9Z^A,96=Xg2P=:U5X2>e)
1GKdbU^4bfd[D\6D#]>TATgMMW9#;](R];58:Ee>;CgLEFKCGT2/2gB=3f21>CQb
b7B>H_Kg=&IFRSX^>2>KT^@D]>,..<f;)13dW5IOE:]O1WaNW4cPXQ8cSPRXdVZC
2)\.E2aWG@QQ84VSF&B+_(AVJGIU#^Q]S@N:]4U-7,)2Oe70PIf]a#=[3)c.f:EI
5>9_BI.Z:(E_d\C);9^N+bHPTHMK3O3Oc[8.Q4fTQQCdP_a^F>T3#GgeMQFCC;O-
@0X-<8MU.L6B1+@GPBZ@&.G:Sf,0[90RVEUOLB1bE1KIYF[_AL:=:b#404a,T6BZ
PF:X?fQLE15+>/P-T?M70H#0=IXZMSbK:^&KM\_^/fP)\##H9_QK<gaa[X>O2SSg
1N(YL.S3B3F]B[QW-\#P0.F=UX<OSN=U]=\F:-3d+cTQDG&KK[>4[^285eE)8Lg:
;RKTeEMMF]/O\11YA<X>&MO7fZLC\RX11AN;H5cF,0Ce/BFQF&CZ[GD;CL>T^NGd
.@)3Fa5B61Kc58.WIaPKIIdeX24ZD#Sgd=[EJa#@>OQ5N0>@cB&g6AY)UM6QX6R7
g#PP-5=:;4+Ig,91;>.:a3fb2UV.KUM.R3g,Z9XZ8C@BW?;NNS2-(_D02)]a6;DX
3d(<OQ.@a>?-AVNTAd].g?F=UMg88^[?6OTK1HYdO91)C[:,L(&<X.L=MM.5-FZD
d=6,]6;>bH7d(QbNJTOF?;726E_[0JO(Q0+BI)Z0&?V9ePPdT2CeLS?5J<&84J1V
5W4[[.L?gW(5WQA1(X^>O9)c?[?(b(CcL<bB,Wf1G?KV<I4E7V^>2HBCOX=&0;A_
]V&)Y]W=&b8+=5I3=(NObfNB>/ZU7YH7J,I_K2<Q?U-WfTHbZ]]D7D&+6LCE7TIP
#ZL)4B;WBe:H\T;g9<)-1I?gWLa7/2>^@^]N0K^@^S3Y4Z=[NK9GVdBQ]=X>0D=4
G#>N47@LM16SWNLaIDC>F+OA&&AVR9C&A0,.4EfBKccEQCS[EM\:8eU>G?3aaH>4
HJV?[aD[AJON>?B8]E&WTP;B&OAe>H6^LI7T4J4?)\+54edA_XOe>HX\7:dC9=)3
IZ2Ud>T32]D-51/e4BcLRg/W8FcO2+M.6M0+O31gP6+-3<)F6<Uf-\a#DY,I?Hf^
:L4<:M[IU=:27VI@QSP1_7)R,>3Pc#INR4)8@@#\REbg(,VddK)GH29OL)S@UPa>
7Y=KLf;C:KF]cX;cZfK\70;Ug6L^5dIPI=TFDIB@9+&8OM[A3Q+JQ>:XUd)N];OY
>K6Xe@^<8(^-1+GfNJ_JL?TIH;8QZ60Ccf4Y5P0f]Re28f_@V1PFN^BE24G\A^1/
\_B5MaP:R@NYcZ2L>d(S,bd(3da[2LAB3Dc_>7YgI9d.YV-Y\S;FWEbcR^#_NgI1
PX=Uc50WQM99=;1XDS67aQP47#1/a76E.SfgFGGKO1+-e.35dE20GD9&KdGE9ZX+
.9/[Ff(Wd>SNLVJX3P#QK@-K9:8^O;3/D4>[^]\a2#IfV]3.H+Gd5g21T>Y8J4-P
g34GPgfeW28_ZUFUSa>b]O_J:T,X:::WVW[7F<TW^9:HU8?6.M3e\5SMFZ<SGKP2
B)>YAVM1N/ARF@O?[Tf;Be/0d==K0>H;_YZV?7/O(^a[VGJ05>QRbU9S,D8?=6d-
Hb3[8Qe8]/g6;&333HDEg;,ONN(\Y+0#/()[Pf=IC@4TI=b&^;5CRC&]PVd<RbZ<
>A<0Y:+.7EQcNGO0Jg9N2CgJMe+@IW.)D/C9G.IXVN5d:.9PL#@(#T0K)WLBT4&g
(R8\(O=V_<AI,b\RW<\W7A1JHB4;:AUB1?HT5eEEK_M8F)7R/C]e\4#1fT>K;D1B
FY2M^M?YQYCc+2(Ue3^PDAC=5JCHL]TDfS4dH?\<aT>L_2HR=cLdD_4[AeGMEIa9
CUf.YVGLQZX9<[>LT6F8LbKAR@c50/]fNcY?V6HQ69/CDd-)HFA8^=8DM.WbMI:3
/V&YH7OHY;AK371&@8P/Lc_GG&(eO_OVI^P71]1D[8Od>e7bNHDHf8_=a^;]<E(Z
1Q5c^=8Wa\_>OSGe3B(BD9T9H[+_J#F=\XT2IL+AX/@6XVEIYK+@0I+^KA3WaaAB
2,e?>N1bY)CX0F743D6]#<9O1)S=Q,b^=\&4aGb_]T(N)b<b5,A_1B#dX.AD(aKc
D=@HO/(JfHHEMTEL6OObPEIIJ]c&]HEH+c=bI=VJXLHAR2JBPRB0]N^N08TH++\/
ePAYQgfEWVRcUN-:4\@b(aSWEZYW_\IA.G\T>Rd4NM[:@5Z:5_/9XFDQ)<.VU(PY
8IPJ>TO_-66SQDc+XP(5WE6f3Z_E>QL]\f=7[c\7KH)>:LWSHMN+F#?^[ETV>0SE
HO9Z3FI7)UAg)Ud:#<I09AS+=gSCdE^GR=K;EVZN9B,faL\AW4.4UbI),Q+WASVg
^PHB29V_#L;T8B/fRCY\-MA97B[RAc3eA,]RbIc25V8Qa^Y8bA9P=d)0;FL9dK/+
;>/(RRYB0c3Vd/2;2\g:C@e=SFNYQOH1=,V/HEN&-c15?.AG/,e7D-:aJ.dF.^ed
T?8>^1.I914@<&?U@[FSEQ,8Mb\(Y@/IMf#ZF7eK2.\2E,\,6GFI:8f9LHKY32HN
]03):-aX[)@-gS[6A<XM,@^SP8Y#>Q-2+].BeTaUT&5<,29B?XNNWNXA4G8]g.6;
\FIaIY&W@>B(<B[E1&:=Q0,#]LFGIdGVHRA-W?g&g9])4)VWFB9H/#dO]L&bNdOC
.eM;=4^Icg6W0G_OcR=/7=b?:daT#R/1\+33;cY^@;[bTL@fW,17[e]A[DdCT7Pd
=dOG#FL[#)M7(W(SYV@WB^6GZ\_E7+=2Z9SZe++UG&&WMf=>(+8022-DfPI1VYD;
M+eS9FV1eI_A1B1WK9b^:42#=4YZ9GW_GeBR=;DSA\7]f9S>X8MX#VN:>9KLe6<I
d\9Rfa_0A_@7LfYJYC_<J9:^GZa/XN<,.&e4Z+4AC0WgHeL;a_U,BZ^Z/1-X3)g=
<]=Y:N(KV)VWTDGD[+d7]&L].)^?X5]^&^\JL5E7JOPH\LF4&dW1<JI;Q;(5)[J4
@.K]Z_?gI1K:F67XU)WE3A+3O@3)IUdOK]=0U[DMQdKV6^K@L&a066/8>0F/f=[0
69VVS[>4<4PZJD)=6JBPOFVIC5>;0Z1+6&W.DS>M/_](U?^_KI,:_AI6(&TbM2Ob
GS[9ZQ4&:+ZEbGL)F4Lf]5@57,<#O1^=EY8&fRF.9UOgaY.I#dd<CZ/P.&g>X_:F
OSRIZOc\;Y7RL:K]b.eHH:Q.G3&:FH0:WaP1ef5^JV.S/W48::MXL-5>1#(B&6f_
VNY6ZgH^aZ:;[T;]RGAb6>53^L\OfU)=43594@dCXY)2\@F2+L<FPbFCX&bYg(&-
/?>3fIUba)dXf,HVKbR[g]VAU1?gV.[[IAJ+5V-<(\VKQK?@6KKMY]D6V(gG\Rd:
(gD]7MMLa3Lfd&@g[#)<JBd4gc-e/=I,XW<UCPg(2d\bPS;Z.#^Tbb2./(1JPZ-1
^.7[bfc:W@7+J;0_U[Jde@A7LSY?6BQU@IVK<&XU?:31^FXg<W8S9(Q=XHN\(OA;
T,&DT>fP>QX_g6\Y-K/gESJ(9R@7.U+PV0#3NRaR7@R^=U\W.&c.cb5d9V2PgP,4
Ffca428I;<2c(N,>DAVe5-9bX18Qa(JXXbXL8)1Ce5FQM-X7\Q>VKR?UA(?HVW2b
T^#3B61]RO2_NNK\?We;[G.HPed2R+=AS_^^?56Nb^3X_0#7@UROc#e?3\\->CAK
F2)=aL#^U](MB-X?VYaW6Q8(a,&Fg0P/_&N50-9,-dZ:R?-TITQNJ2fQ>dD^^[CO
T=]119B^28EdcO<Wd+Y^-&c0dW6VFd<cc^37[Vg&G>8fd0VLQ#7DLI7db?U;G766
O1@&A&P^cPY_c.gdZ19bK:NGO264Z5L,OL+2:>E0Ua5INKbJR=_6H5A,U\Ya7?dU
dB_31gF@0fT>ZHGbg^&c_P?X>Y:Z]3+aU^Vf5f&N9f8I=P[Rg7\UJ9DZ2AMWL^gb
F<a)1805>F0D[;JWQQYF5ZF1FZBK>26TYHf7L7AK:VVIAC^2dJN#g;@.0[Q76D;@
2>9KW(_9IKb.e;2_+U.OI;_T?JN(#L>K_J>=Q0fUK[Me63;>3@E9@_S+PZZfX-4S
AA0dLeeIbgcU,NGDf>ZM->-KYB=-dJG?>K3d-\GI5Z9cbU>7@BEe2534DJ?L-0<\
12>4Q()6H]<9>IO<EB76<,_e<>RH7C\)1FWSdE;90^C?/G5JTaMUc[_QQ2/(;6a[
?7]+_Ld=DSSZ/8K[dB.JE)dgD&fZ@DLY(:gd))/LGG8\GXN@I0D/R\@RbMIB]W2L
1+SRB6bM,?5K56O<bWT]CIPE#e1S5FTB^C3P;,=HQ<7DS))/SME=aEPEBV.N5-\E
3L#b;d>.P5K=8[-_1CK1-(NT\E@UTADGe4R8;PFe)D34S4LNbEW>@3ZA^FZ52;FZ
Hb]GS?1CCM:Y\4(W7Y4-E=d?0Nb=A=dA>YP^/O4_;:/1V-/1T51gCbbK[6C),_,g
f2G2@KbG/D/d,#A_BdX(6B@YEPVV@ddHdT1E/+YU?R(N((<]Gff:?g,I>eJ3>,Wa
C>[QOZV.2-)H;.@)fA;WLG[->7UU+,85#@J1#eX([gG/9(OMFcYIJ,BdDJV=g^a,
WCaLBE<S+f.EU-LYHB@BX4c>58C_^,CcX(H+0A\VA\XE>IRSd&;7HP[SN\#LT[G^
#9P4TJD78S9_QS&C[bUSb\e(:W\PGb][b_E7?>85\X_PITDR[O,1@<g<9<<M-7<A
6=__dd/PGH;ABa^2,OgW?K00<P8;N9@&85&<8R+d[24D0JT=DM(FM:WJ.+1,50Rg
L4;Y:J#<O.^\UM24QWgH.(HRJVCILdOe;B?)cNX>S>a>P5:)>[aLM9H/JS<NgFE\
X3^5KK^_7<-#cQ?+@?M-,4SZI0QX,Y\,^-/).6[&=ba)2YFe_;Rc-e>)-f?\S<X1
-3MNc80YG6EI=b)YA)Q^Oc\^#dfCOc\.9DN2gUY]=U)eM?RccBX/?R,U6=,E92ZH
T2&)S2YM[)aFfDVcd80?7G/Q;A]#T6P0@M:=VD&eZKV\bfG9I[1GK;X_Q]J(1J->
J_608e])^38(\^Q3DX]PHE)YHJO<</TcRg[N(NcPPI-Z-==E@X:@AKJ;ZE65[NSC
1gFP^.>Q0@;.]1X\?\QL(EXN0@ce/g&XI5?Ie[NBRb&dWLP&NY1PO6.R#77BF>:I
2Wee.:3aR4]=QXUYOY5#>E-1E[&[</eEZSA3Y#)+_WLTgNH#g)b3YEY(K>I8c#fH
E^;38@2ID^9-MZ-b_682fbN.QS79Ogb55Q;BM9<0#c[a8]0g-\\c0+X8T>5:R39Q
4QGJCWYMCVZ4d+>Qg@T;JKD+2C8<]P)#)?L,ST17+4S]O<SG^2\1^HbRHR.[+2d)
/<K4=A3T1Q2N/ELXH-+J2G@bYQP[LWJ#=?0F:aPH1T:;UUY@8dbFTdAeH]<Ye2be
/=USH@XC\D-#YfA<eUBS<Q8>_@X@@c1PUf>BPTM>HMfcYcMZN7gA4aO-T=KCX;.4
dA;U+d]Bb6-PaaDH=))FU>b?\-2IW#T>P0H&DfZL7d.O7KO[JFZfUUL+9BG\I?Ff
+GecX_/=I3#5(#/X;F6W4c]5WI]4/>FC6RHbJPa/6MBKF[++G3;=F&0VdYV/0gH5
GA9MK#_M<H=X1E+U(0I(9KR[>Q&^DON(VN/43IJA+cDbAfe]G07Q/R=\.XR7bJ4Z
1a(KOBOK(3W^d+HcD[f<K-&J7Q2)\V6@2)#,(0B==2OR5GVW7\L+&a2J@>#,7XU[
@;+P[[:<db(SV:7@R7PBad@TaBUaU+M@e/S[\M>+fZe5deZ+:IdeO6Mg#R;I>-3,
<.gFOJ)GPK.O+M<NYUS,e/\#cLRB71+aT313NP<00Pg)-CY31@/D]aCA=R>#@T1F
)M,YJUF1<-LLDL0N3]SLUZSA)3^P\4.-K^=PbW1RJ?NWTX-f[PW\#>f1VGFc<ZAe
H@X_(^R@b5^<]CR7-G&aF20=e-AGFf7KS+Jc2UfA;WDZ.003C^R7<Ye<67S4E5D5
Q&?4T2=A2ZE.g6MB8_WO6ZRG8_]\S/PNP5DFG2SB)a1^]283&Y3.6]#g?VRF/IMK
]O@M.XZF=SGfXACXZSM0_2Fd4S\>d.3#ae=1>caXD)#SK^3G4;2@]/aa3N2d;Q.E
3I[XP+1fcZH/3WSd;EO73AAA9eEUE9QE;Oe<N0ET1XNN>_MQ_H[8H=@9T+:/[T12
^GREPX<-7E#H+0a9Z0(-U+a>aN@3b9e;PMENH(X;.\^Wg48F72P9NFdU:S6O7d5/
S/B,QWNObC@_.->@V\gTS(@4EEVGTXV7HSc_GQFTI#GVg[2@<KJ])^FK<-b>9S<6
W)7)U;2T79Cd@T8Nb,&MQFe/+d8#)(eVN)f2&:^ZI4\9[;;6P?\KUb2]+beCg3[;
-N05X403<KB11IK9FE],.=+f/?)bSY&WHLETUKb&]WDYP4[NK(>Z)8F05M?JQAD>
8XI+.3+K,M=;R.(;(G#2U.XV62.#XWSf6W86]?)7?=6C6(R6f;?AML3\7E8W=\B#
XWOF1Fg3&\Db0IX,L&:SX05OLMMR/#V,<_(AOKLfNEf:-?UZ:4HSD)D@OVeN+Z,8
EY+9=NO-958)UNCZCf.9)5YW-/QJG[YCY/_QLE],/2>WE3]97_I\P>&/afX^O@bM
AdX-\cd>#>&0G\?>YJL_1-:?@/.66=Kg_;bZX](U/5A&/S-=VWM=VJHFQ^-;I_Z\
XY7MMQcKWO8T1G=a[,RO]OWQ;75Nb+;R1>Q8Q0f/X(<EHW4&(.2.7HB.g<B>C#Nf
X;4][VF?1YB_2061<]@X_=_f]F83a[XXc#-dDYF1-2b;FKN4]9L>+fEX&[8R:OYT
e:dBZ2\Cb=BX=a8;9E5PSBc(NFgZb=T&,6]HZ<>HA(fOe0IdSK/)Y_;aE;#0G2TK
M:TFX<PCDQ/G937(01OV>X]P?8RRRV9fe]cebR.T242<ZEM+C;2S13S85V]I7SfH
2+^OM9:^:419HF/#B5\HQ#]69ONLE_<3dYS;GV9VYVYaVHf9eY\ZYTU-QE>@XIae
6VO^,54EW(6O.277LM0;P@SWB9BFVKLXC;.7B\?\.JNa)5PC5J17&OR77g[G[@E3
T/^6aJT0FO:&B4?;Rg5=aZCTeP@/YBJe6\@ZAd5IYb)-B5a9+e7B#]N5([=^1X3c
>Y;fa^Ng@8O;6Q@RGFa^VGe8J<8Y+R?;8XW;8<6\4R3:Y@7&T;9?cQUDQX,,DVR/
=K@C)X@c.?VB2]3C)c8PF+3KAf=XCB,6YaL.&g)>-:-=8;LHgCBOH<e6Z5)F<FKW
>N[,TKOb7RWR0=F\2\SKUd#(S^=R&R,BV,PLDC<AM+I8886O/(BdBQRV,+BC^edW
10YA9<L-X^SF&3BI)>KT9]_H]XA^V[8+4U-32F])G0P\5(]]Q_6(=e^g7TV-VQfW
1YW8]FgBH,V00H>A2B6\d58TL]4b+<9R04E:;V[2<A5ce;/^J57C4_1)NI=9ZP2?
aO.1Z25V63]3QFGK_I;1?<U/((+f\ALGQ3<F3(:e9ESJge()@/U1RJK]^OFbHUU]
W_X@7NEHN]HATZPKcH<MUL@fT1e<@[]A&O=/2Q1g0a^2IJ3CgW^]gZYET0G(/JVU
KT,YS?M.VZ)9F]G3MgD,)C-/6L#+@0bPaW3a>[IM)?H19^-SPN?=5^QPLH&Cb9>e
;&eGQ/7548I-)QA+^4d>>RFE+EX(.]X<GH>1NS/I9<[U+LY4g\04E<QB7[L230G^
TCAO;GE44JWD[a)+A?M2BU2<Uc@N,dF#X)ad>D6Hf3GL8f/a2CU>=KPQ\c5=B+/8
P;2+5JNR_0J#0->2E^@WM7>QUD_<BKLFaH>\IdeFZAW5NG4WWf6WQ/1P=<UZQ,dU
5,SKR3KIW_d3&B^(>=.GS#7.C+C^^_>NYGAQ5:\.bf-/2R&BDSTT:bT#X_JS8&M>
U6YbMXBK2A500XWcb&5,#OD(dT27D@M@_^.RIaJ6^C&A#=0Y3UgS;Q8U38fUbZ,Y
8faHVfFX6A+;^FEU[AR0]YE5H;a:.@Z>&H#O8B:<GX;R\)Cdb?,5D@ab4^TO8T.N
=>:&J^A/TPM,Ld1_PNQEOafOBHe-d0Tg0/F??LaICWGNXFSPeb6gUTcL9^<=PBZM
MP^,@7cDff:NMe\1+<CH<XKKcG(aX>8SCG/XC,@:eT6[&bJ]8(EU)\WYg]TL3ET1
OGD3>fUN<8&A39A^4fXFO0ORU^6TJ22O18C#a^+Z,<EJgIT2]_@@f^4RX#>4QO^L
<V3\YE789E:^7/WC>E4YOXWL9[8QcR[X?dK4](cdFNC+V_YQWCg-:R^&eMQM\6#S
a9B)09#MKPbU2U,JE@OSFL@1bFcIC)\Z^J]I1X5+ARa\DB-:,Jb7T6Z6@Bbe3A+_
+=+)f>WX+TZ10&OL]cI;AG?#,aI9\@#3JQ5M.g?7Q:T_WTLSQ]ab(Ogg9S6[DF&I
..VO\0O@C]:THVOX;FSV#M<RdH5b(O:geFF\gOD)1Y^YZ5P=e;a>QFfJ7ACCV)6\
HCWa[F<59A#+W>WZ4)/gG+R^<<38;5HZ7^FVV=&Y-7caF[+H-1&:OBKe_F[X\[B6
-2LJ:#7=N59VH-)81PAT33M:OTKBPUW6eO,92I(OfM_Q6+)_6OZQMN18&A3->7HT
3a[OY(;;<VE>:ZS@PdR>./#+^\\fG_5ZbOP.IV7-]URP<,Ue3V&+=T][>Y#g?9:,
QAKA7Y]VG.&b#,0&BY)G16fRZ=9^K@-=F=99(A-65;F,\)4bF\)0&fd=EVNI/gae
05cJ^87?J07/J&Rf9GT:fKgH\39)5d)6YQ3Wa&+,]AeP]GV.H(aD4D@f]RLZYX:<
VS70-<G9f6.>7bQ4Y)CeIZb,X#WBFc,RI:;RgT)IA)RY6Bc]R9ZeRC3[YAE,IG]/
/dNBW?-,STaI3U)&H>.ZD&R1)H6f,A&[<]EU_ZYB@8d?S^(BM[L2cb=RTIL)O_#:
BO,BCWUV]e608f5#FT/:eK=Ac9[SMNY3G47NBfcd>XW,-EENZEK1//ATNKNF.F\W
WeBfF5JNBDJ(R1GL_.6[2Q#0cS0/?FP1+7&TVCVeX\N)P=.^H)H.c_L@<GLTe1FA
>>BDeD]A<FX77?82<_I_,D(eBXL]=,,.HCgZ^,abed+A[4UJ,EQ=gIV_aO_C08PH
=&5GSg?aIG275)b_=GD,]&00D&P/bUU)@@I<_/_^6Eg:T;^e9KG-[6JJJg]9O;gc
MaS_W),NdgX?CU]JLFV+7NY3C>2G8F2@S.+)?]KV0U[M,XcD6#7]g1TDf:eI(8A)
(;9-G#0JXWKe.DQKO4;Ze&Q.YS_MOeO8<8^S)H-&D:(52(S\b7MA)KHFd<[I_IAO
X;Y4LB3SOe6E(PKU[@FegeZ#7KWME2-=McOF6IP^NU9cV,_O(&DHFYS\)#F-6>#@
9_>.#6S&;)TBWb[E#M3PPMO;&;_]RAd;@W1XIQVHL<-LIcWCNFIS=YD5IR4MS9J:
]<[XS>NK@ITKe;FKgbZ]V42)(=Je[/A4bb3II<V1E@=,L:HO;Z1T#,D#:JL>MX5S
F_(:gUdP<ZV,BF3ZWfKMc(NIK(/1KCd;3(1Ma^HYZU;@W9VKH(AbdN4G6F+Zfd>U
L4I^<_CI0UI+f]=dOSWCM50AF/d_;,O)47/5F]@W@PbFCTQW,\JbU/Qb0e#?;=Z3
6<D>\XC,Fb^eP:f[O/g(Xg^27?7043_Wa/\7<<fJ&P,.S:C)V^H:@:6OW@PZRN_+
L]^IddG\B1WQ5T)9=CR4R\D:dCQL+GS]I#C2K&cAIC+=]e3[eN:T0UZ4([fJ#IGR
.N_b#X8/(5^44<O&MLOHf#O2&XZ@J#^HNYX5e(PBUbR])P@P.UKb(->]^#]J(8,,
<&#T?IHR5L8UVP+WKZ2b4G;VQE,GNQIDTD_[8cKb3-If\/JEg1N._EOD?U)C+dH4
&-3--SZ\CE1e2?)c,72T&/6,YX++eNR./I@JS-FZ2D\)(&g=F(:ODa3)@TWTBFL5
Kb@0C08ZZ,MJ]cMK4;M>cXa0[B]DT/B]2ag?L<I5&4bBa,^BUB->=^,G<)cf-E/\
c:[ZC[C=e-&]T)LUX1C8.YaP=d22-,IY-M5E3#_b)\3+cfaI\^(?9)0W)c_7#4SS
P@RNgMSX[3H,.2@<):/ES165aP&;eSTNcD@C;#5ZfMFWfC5XPf&9?1#HTY7D81dS
HaN\1JJR))L;>HWMZ:L+A,FgIO4JXB-M),RL=^_BG8>,FLW7Q3?>I(>N=XYc]Z<X
.DFeE&)S---b0H(T9JWHC?V2Mg0QgD:RY9AVD+G)V@.f+,&:+OH87WgP&-#C0+Hd
53eRS=KL[H;QeZS;&_1K1eZZ-#O5HZf]Mfg12]e?5.O22/Z=R^,ab&P:2>KXf&^F
M5OGWcN\;O\2WCg+J#1O?\Aa=SC#XU>Ac7N\<\?T<Pc-_\3#g:JX,[GGUS7G]-13
8,3bdFV+?D,bN2V/9@=X3^J^2CeTOO02L3+bXMP@^P&3<D,BgSTS?D_ETWeC_PI=
H,I((;CIU.6F&2BBGfG72>;,EM>\V2Jg<e7AOKPOAGaGYS]XVBPA.bD\a)YT&R()
&)TGJOPLZFM@\Y]e+7e);QS6Z@^4L6ZN532-./NF=G[;SA1)H,aLa3Y\\cbIce75
e9GU51cE5\1GLID3IfSX4/U5MTQ,&\gX92,R_;CK-AR8cIeBad=3[L)a8E?7BEII
M)VR\CK-OC+g8GVK+@=L9gM34UP3_A(G+6R[---DO2VKG^[g^&6VL,WDLZ<3e2YG
CCVLd2&50(M6ggc:<gBDYL^(Vf\7=OP(>=GUK@S2>NDe)M/ZRe/3cM6<CSRA#&-Z
AZ/I/c3E<N0cA12U1E]eTMT-I^F4P?SDa8c#O.aA90RZ[/.82\VM&S.g)>N/[7c<
Z9aDcH_/:,EH..A8Of>XJ4cCc=A=+QBSCIUEC><(_8eS?MdQB05O&d\OJ&;S.9<^
GQ:)6fc;@H6>IdC/X#0Z7T>]e4A/K64Q3<A-e7b,S.A,:FQW3S(E#YP,A[Y;FX&I
g=bM)^Kg>M.770E]M7#DFO/cQg0OU^=79V234S[g.A[+>?CK&Z5C&B<R,;S2WH+:
)=-V2LDM/FO[OEGK2+/3II80K8YJdGgW_Yc3-bfX=>8/B)BSL_cdP#MX6Q[IG#]T
,<:P_UPO5EJISF\S0QLL8455])8G?=4@.T0_T/c^#c2K:E_=W3:=RCJ\QVA:Y22@
;.GQGK_5X<,Q(BWLW<9ZP&OgF3cPUE+_VT.g9+@-T?cA@@FZ.;3Y>KeK>U<>&AfI
90B+5(=^M#>c9=O4+NAf31,_7&aN3Z>=06Z@F2P3@4/cYZF\=T):cL,6gE<13a@e
SF<g<\aU\0-5M6#Q>bHbO4TO8]YaS.Qd_\SF:R63A#_6O,+G<]EPK?G&+0Yf?X#=
I8d?FP,LQ3Ka4[5L74-WD\D.9_K[;e9aNgTM1,PYOf_baI]d5:#UL^3TILVgD=O<
)&g\@<EG70V-OfP5Fe[XZ6I,.He2E^<J^+g@HUBN>df?R(<:V9I6(Z&LD.9Y)];N
Ug60cS+?>BK9DSgc],E0.(\?NHXYIFaU,]RJ(+)ISfR^2\f^L,H:>XF\d\XTV,6Y
BBP5F/UQ#__8E4DI12WPYU>=5C-W=-,86]#(0\/&+&O_f]I\&=eY@+[QX&\0VJP>
9S?IIBU.DR_gD-&,>_K@VJL&\_D2;_)>E+,:U82M6Ia7UTUR];;B&YHGLC.;^HDB
R<F</:@S/aPgaL.^1?]V,M91PT,8HTQ3D6/<5YQ<gK.J=&fR^Z3B2_0e/_B4c-?.
;OCP::J3>2]:Jd.CF2GWJ<\3\gS9B604=QJ@bG@f5GR+:2;,)D./Jg[\0(#J-OHT
DLZME9O+gc<NI#cP^@2TSIeXS]HOf[?[#VBUM6Na8U^,.6_aF(((OI;9?VgTf<(]
&5+SPIET?=+6d?IS4UR50UgNaH:#VfNbC)K;g8B^^d-B>NR4=RG-M,,>a+BEf@,,
4/[&ZAW#d_b+96XZD;4_Q=BKdZM/-SU\JC8)ADff2;KB=)C^bJPL]RM0Ae+Of,.-
bS91Lcc___G&bX&+_@__;6BL-^DH5Y.(;gC6bg_+I1baSXZ3V<>@da&_eUM&^d>(
:1IEa/@2X5a+YWU6\FJ&SNI=+F6U)\3OA:_;?U<eO5[:\AWV@a2=(,Z#(@b)M[1<
_a<;W2HcUGId.CSSYTBbgT^@IHe+TB_Z,A,ADZ:-F/45SQa<YA1\Y5Oe\=Qfbc95
2]:I-)D4-7&JNdI6>^ILd8RgD65(JI_8PV;L(aHbHMU;JM-Z8H:?(()QA.^RE@RV
O)PA3&b6K;Z5RK^a<>CWgG@1E=<EfCdQ1&U\E0;[C#8^YKX?VI^LTYHJ2YWP\9</
@8NFXA4-B+R6;5_89Y6&Q>0bYS\,2Yf7DWE]L)C+\O#CcUO(P0U40(.,A[S;f(J>
,dV[Q.GVd<+<e2B^Q7N<\fc08U1M=.>5+3M>.:<A.<5>Z+eNaa4-\V?;3_5BWc?@
3-,]Z8C&_U2R^TE<a]W+R3B&BX1CKOA8&?R4W0O&9F#3LAU;M:0M]@f39a7WM>Ua
MABR4V._C4C;WIK0,=/F8gLL\G[-44<?I.f94=:&DfWJYBg>KSf1>ZIUG;>UK3#[
A(U)7CR_a7V9e22bY)4864,c=9[bD#>TMSV&OKCOPC_I3dJDH_P_Q52=K)>URZQ;
.#d^W>&JVDH9,)#VC6X2S&TAX67SRCM-[7^dGVAM@OR[CRMZae,0+d(JGWg:0_L2
1LO.a^GC-Y?I5\AHHgMY39P,ZJZV]@XN[L5GDI#[M8WJK1Y]e:Ef,c7e;@=+BSNK
)YYG:/.I)6_5;<YJ4L0g6e,_KK1S[c]ZJDLKcR5SA5@abV4KfEQSa8WdV[=9Z+Wg
_c.fM)3F1SKR]Q=Ag_RZF[KPIPIJ9])<&FB-;F\#a,/4E1.7PV459I43393KaXQM
/?[D^5OIP.]J5HI\OA5TG>R5)_WN.TGS1?AUaJ)PQ\#>><MUS0gXcIH&+PP9+M78
3c6Sd[4I=]A>9K2IS7Z6<Gb208>98])PO(IPb><OJ1B\9R[:Ga;[S_8[CFQ,/TLI
:eXAQ9&cUTGBYXQJb/9BTc6_MGH.@Q_Pa=eDUO1-JW&4WLRKHT3ggT2:U-@6aV97
,Ya2L#af]6g-)G]F39BXDWQccb9O:Q#aBbd6T^Z3Q6G79S/b=@R;@/F8,_7?JAIW
EfD5KN_[C+103_+\CWQT@92BVCgYb<PBO1U)7V\?1[5G>,Z7#]ag[eNC?^Y8fW3,
IegH[,&1-P>b(+@(3Db._Af7aJ<FQY4V&9C3#J4Q/DU&LW@aW)3GX4[>FP[7:K6>
Y0[F,U+.#-\8(Y:5P[F13?37)bLO:29fUfC<HHOJf=[2gDZ@e+7UcGG[;g:fNIZ5
;6<+@B2A6>OKQ/FM3g2_D9Q,>G6Lf/+fW3)U,e/129I1U0#965@Q7F3fMV5daL(<
-)&VP,Z/Z+JD+bO)&.DFUW4EN9UP1KL(e]gb>E<3OAC-4O+e9WWXJ6E+^dbQII)a
C#NIbV#[MZdI#b+\b,+P+24DO&R8<Bb-HHCY-6-8WK[14H503IJOe-ZD:]a(#e+g
f[E;.dLD0:53-3TDd/^cYdSa;5OYbS1597+M.I&f;QgL9E901Hg62>J<2IT8,T1(
\O(YcHc^XJ/\Fe6&Z94VC0SfILYLT:Y]+20=QLI;\BM#LPQeY;cF]+^dO?Tc#2==
P(@[RX=1FZ08-L>CW#b2FZd373M>,YA09(68\I]8OL2US3HW)^20:66>URCG9TP,
991Zea<fN5g:2T-gB^03G=O&QW:c-Pba3P.3/46UIMQ@[]K8X&T2R)77J9/B5@GH
Hb](6\D<H1^4V)S#W-37fA#0=B@SQ#;&.-gU4R0G4a_89aHU3eY^W,6,<Y&0O:2F
#bW?8SeBIa9K[K?=B094Z+g4-F/5C9O[>HHgK3ZS-1a)3<8,8X6K,D[8F?3Ld@GE
\bU;XYB7&3GK\W\=H]BG&f[(V5842)).dVg::bR_:eG\(dcY4+]9HAGNQOWH.3Y[
U&NUOAF1b8T9GF<<0:[2E2^8ebR\64VcG^1.e^U52^TL^E4]UP@:KSOZT/XG?4FF
eZ&_95VO=2#>^FLJ7)Q\&ADVZYM7+YC>JMMKBP2Ja8bL)[(.UW#f\:a4=ed7S:]1
./F,>F.)Hc4L7e.F\-aHZ,5a6B][T7HgH6[9(#(-9,=SN)KJeN::8dE]AP\2bRU-
M,D^KUY8#P,O8IRd),\6U9,TRML5(g,D;E+b_3Sf\-]I6ZJWZ:&BW\fd#ND@JbaO
MeRBJ2Z0OZ&OaGE.0DRb-NNgg^bGEW]O]-QKG.3D^?HE4._UY:N>GcXOGFd#NaL7
6B@5;8eeSK&N./\=-O-?f)La2B1(5bbgfIaP+,OUHBADVG?6@X<93dSbcb&4KZO5
?_Af@(ODgA2HG?RL=fFNX61RaRM#+S<;\?J=GV]1RQ8NL8O0R5^02IO_.4b84c=P
I:^ZeaAH4PMaB9cY>/U0?gQ?ETL]6XScNW_EaXfV4^g&[TZ0MM:C+a8C/D3&X<R1
)U8c(S=VAI<g&gOU,FUg>)7GM3[<ERHHTcIB=T7gA&T-IN^BgN&^eeB5A=2-dCIK
-,4Dg<DgVUO&<\ba:S_81WbE1d==)<,a86O:Qf)798[/9=[afbI8F)K]V6(I?Ee<
Te?bHRSKUOR5]5,ESfCD1c+4=gaB&.gZ+:Xg/WcPfNL#^@)@Y<3K3#=HK14O+([,
6g_9Tc[KL#XV2OGFaWH4=C7561I<5dL5Q1b)28V<K:<BY\X0ZK7RMJ\S-J6/]5P3
gfM>DPK7:#EM+fG;d.D>&FQK^CL@Oe_&.9N^RT<6UGI\@O4^CMf47bEL,V8IgKQQ
f2-S.D(c4L?DaIFOZ?S4/JA:eCN^13BF2Qdb0KS4X1A\/5gP2-0947\g=<H161BT
0^;Lf#U..U?M8]7QXBH9a/XbR^;CaKKG_1F0O4TPKGUDKeL12[OXQDKHbMZXA.^I
:P5eOLVfZ@)M&-YP6;VeE8IN-E6\aOVS0L_H_]/_-WAI8\^Z=7=+PQIUSaD;<b,S
M7+I#e\8H6ZCP=#OHd@Q3SRYBN=9AcIQ<2O29<H6^0HbPS]#<,\0gC]dN;W\<J<P
;@O09S5S6T7d\S@b=HJU,8;1J?70N=0L5MHCD_e2#AP_5V3YPaE9g4/<#Ra2,1b[
G3)?dHa;D-Fd<TN]K>N\P1&D[+5KLK879]CDB3\6WJ:SD_,#2Y;L?._7#]f@9caF
\O\B)K9+5GaW9g8(_3W:(?g3aA5cdJEgf/G0#\J@HL_eJ9;]1D+d7?OR903c2[3c
&4C4O_C[_:7=[OJg>:MA])+_I6(/C=CB[DNgUNO-IaN&YZ[f@_QV1HIKSR(PI)JY
9POSQ_J9eNA08_bU@B&d,)VR;ZAVL)aCReX^e2ef#H5>/Sb1X?3RT)G#QO&I)dMN
+<OPPDf^F.=>4&4B4JHab&JQP8]^c3@DW:#cBHM&[RbYG8\O26)]0?979LO51&I-
FPG[0N<3X[a[0g).25J21__H-(_V)K8TfRe3KR&Zc:Pf&SHC;cJeaa/g8--KJ0R?
2H5dXADZT29B&9\EC:_&#UfVOW9F(4BP_)\QWGW>.0([_9H],/dY8/S4J:8IN-/P
6=SYc#6bg^EEWE\:^\NE@7]RQY8Sd\9MH3(+ebD&1fE)a=^/6H[P;O#0O8Y1-SV@
#f65\[3UZP=BfFUD=3X0C2M@]33e[:3)D)IO:,A#[Nd&fI/&(XIg9=Mg+-)DJa0g
.M^Ec^.d4G\,Rd.^a5G8]CYVIGOZ88O7=PJg8F7-K4V5ZEcL5_]CEaP)NW+RB2^Y
DA4><V3@1](41HcUE<@CRDY&<.3<OR.<J\AY+G(MFgcW>E>J)J]N8=48)<)<N(Tg
7b0[)1ABK(SXO5,M8dNU8dYEPeM5R2,(3H\ZGSFd\;F?WO:[HaX4eVOBfgS7D8H>
SZ#V&ed97R,;.?fU&56bgI9dYIEg@P>;cBZT1P+_<D,9A:CcJ7J9/E#JT9[OgfYD
>>VF7DUE:P[14Y@P\L1J(:K1(S0dg3S=SE&NC@)<<OX&c^)[GCV[C_7>G/U9V(LA
/_WY)YcGaI6C5:2J>g#4.X_13R3LegSX<.#:1#D=C[]Hc&+K:2+-U9(0KK>I36RK
VNC02W6/Qe(a1H5WcfVF)JRNVe=_7=dKb@P6Y?f27ZBB=)+EeV>6Y\SM7eHY4DM<
a80&/PGgP@3PE5NVLc;-X8EPcDYPYGUBE^/_VCTGd0LgX7)^a6S(eLXfF/W^&]QD
F?XP[4.CeUS</e7#3IXUW5Ge#Nf1aGH(B>>W5(#@:Kb8ZY[aTV01bOD1)T:PF]L/
GZCHMX1^RUfWP7MOH&dAO,:-_UI/X2N);6)X#OQ7/ZQL)\<gG)@SW^D8U\I]40FS
Qg;+Kg8PING[FP#Z:)GG8/P(W>eB6<VAB+bA>F1T7JB2R<;M+T.0#N^7EF58/b)Z
D+/FM[;E7g(U6/aeY#3];>\A?HgH?U>bJ_B2#MbfAbDC7QURUM5SY>e(_N.PR5b@
DZfd(B1:;Z2:bW8fJH([J/+:6_>G@\5GTb]>OF8K/]c#IGDHAf;J=Cf>X>#Q??=7
.]=60aSB4X064g(+a]:G8eRQ61(;]/Z^cZ9e+EP[5OFUR.[N&O#Ec[QA^+]e[G3^
6JJE6L,[TL5[.:,<L.X>c80U)&Xd7c=Z\47dRP2XL+S-C\0EgB8S<+,R5@UVW0(a
Y]D1:)8UK7I\CQL^]&<\\AQOJ=)4.TPf3LY_@Wbc47OQDH;V_]G4,C/5Q(Z<B0H0
39Q[D]/6(V6aW[;dKI5@Z1PX)>X6N5/&N^9JQ;Ye_[TKFH:02=C_RDQGMJG2R=HX
B>EW55cI_K]THFBHE??ZZGG+A352[+AC.U52N+)O4SN(M4G4J0A4KOY3A)2Ia-Ya
L1IU9A&Z,,Q^+LC\@&)b@f1RT@3eBQ0fI/dbB2OLXJ[5g4X^G?QM/4PE@U1[JT)J
AU+cD=M??4S:5R_/,1;4@.dBHQAO8<=(A<NA18>SCJ]SKS<fC-?>eO8#N,<@A:45
1U(ZMYUQc6>4[L;[4f>X.2E7b>WYb)8W7;>=+EdIR/32G8e^F\3Hf-L-fXEYSX5c
EfUPT.J[GQ1]+X#0A520a1^+dddMe)W=4.@P(N?2I;-T+6WMQ;J9YUU8e]XWg/#(
K#6]R>U]E#@[:<_O(QHJ[)G3-1OV-2J[c-_edPLYC?+31)CXHXDQC9J2PIIb[FM[
-L4de[2YX\LASNKYg4^2/CK_.<X;IFE0CR(>A)&K3TfNG2DIHTZ2AWP8;.(,Pf^-
ZYAT2U5fG<24B&#UQITP=N<FSb?<bbL7e9P;=7a)0/INWEE23cMU>Y_H0U@_SQ;=
<-I^6S^==+:(338BfNPRQ(RgC:dBD=KW6dX+:4e#<Zca::1=Q,F^K@+T6[:FQON#
CG],c]Q-?F+[&P7NJ)16(69JG7OK7VT@21HUf_]33c2OW1B]W=75YF=X7IW6gH^B
6A:NA=:a7^,P:dO0-B=cX8M_1R#,K8&3VM8W.JSSO;b-M\>/I/H,3F8WaI[:>/SS
YRC.KPM>LH#?-.IJ^Z6GWG-F6.gLYMc;DI:^3+-V#=8LHK^+MNH-B8J8=D,aP7^a
eCG(6OPG9EK;\RHd1daR37Z/DZ(KO>:S(HMF37cL@:]FQ;Y(F<>-J_:?:ZccG-g2
,(3SE5#U4&(aG^/f-BZ<]SE1.gC5S9C1UYaVJ2+Wf]PJHB?W3GD(U-)Q#6:0B[#I
@YF;6.S:2F+U)6?48MR6+L(e\V^c/eXF^W2E=)_a92PAW3E+XMdF9_IZ52gJ56SK
XL\\BXMI@aT<KMaY[ZC0>K#3[aA\6M.S;fJ9BBA+[UGRKR2[::Cgd5K;W2;&6_I<
]A2-XVaT\e9EZBGYYXN5=gVG3Y:CSCF<6b-D:XJBB,YVL--5@e4W3,_S[CU3W=6G
NU)b7_/472f9eB6.;61K-WXVTID/K6bG/X[I4T[YfX<J[bb8CAEDBQ.M0]DGX4\e
OR4=@-_]2<&1cKa2A)S6dXZ-V-;HB4V\b7BXe&#]A_FI0a#cQg6)V\A>fO(]ROZb
.IBHX_Sd3DgX0>\bb2B7PS@F.]C)IP6gZ&_W_TC=ABDJgM@29a\L07Dc2Ad4ecb_
aY;?\fIDS+XL;X7,/I31]N;MA7Y6+A+af018Tg<ePMDFe+V6])@N<c1<KU(5/g+L
?PKc\UGdg:TTI.]C(UBI.<PLge;<,LfY4>NSMRLE(,-Rga-SC.]Pc=H5^FVME/US
^23RKHF@L?TUXPRJ)]7?LT4S(=&X4T_\H(#_>653[VfU+&(1(fK&Y2aa@cY96=[J
X#(<#400):\CBT#KRGdC0[5=]+g9J;\.7M-=FQ42Zg?\5dVAOMOQ^Q=eKK3C@GWX
E5B.A-+:H,,f&U==5-GWG,IcP]VZ<.+]?7d[)BN4QAEUF+QB8.2C8GT.,6OX]AB.
#4E46W1PA?94Ce&IAXB<PU(:d673QYCJLcG6bJ(Q@@B#)H3?MaM6c;;P2/\DCBB&
B/W+F=96Qac_^-O+a(>+)LcCJ]><M9XGT/W+K2_V>T[aP9.DadHBP?MT0e237I]4
c9,RKO:AWX8>3LK\&W(f]SN)&YPPEELWH(d>INd8O4])4^A-T@:e+;gJ]3;MF&F.
F+];D[dV#R,7K\e/9Hg@]@3@G/9^<J4VXAY5^E0:UY3(/6[WI1aF[C/DDJEPOSL_
@Se.<)W8aG1O9&0&Af^B@Df4\R-<JC]N(Kc&CW2BH=.CQgNd(F=K(2A124[@(Qe)
:REDF\;EKA:=-6H&BM&;3W7^XR+3F1VdNC@#?5?GO4+R6#=+AVDECN558eEG3e@]
c0KVI91dF[9=aGc?6)/O-D.I2;HUDdWS-?e&W[6WO=J4)D+K/Q^4H4<+ABQ6gDO:
FbL?O?^FeN4/#b#f:Y9M6]FA(1AVO._T4+NIU659]b9DH=HU:3MGUWL1F@#U7E.?
#G?Zc=LU?:I_49Vc#?SS>d67:GdOFCO/E/\06-D[I1Z0LG?]VW3d<)2@)C),QMT2
/)4TU;_O8X;eTW86;agY@_aG7<I\U1/d,6V+g]I/G@R2&N>[K[3&4B?TR?8-LZX2
JBC<I>bLP=X+GLXDO=[7(,fd50JKL>KH5,KF9J,LGZF];_6A:--D1e]19Q^Q=EK;
SYdS,/OSJOb7_0DLb3H;TL[F^eBH07?P#Y_2bKFH\T2R.EP>J,S2Vc&[fY1MDT:7
:YX28#BRf8_?;X@4ILXJ\O?0eA[F&e<B>4R95IgTTW[OZd=F;aS2:>-R&1S9G3>G
PN2XA:@eeE/[Qd1dfa22=EBG3/Fc(V9J<=b?;^Jb-&WSTPccIRBN9O;3M6X-VHg(
P@TLHW6N9C++VS5&1MB&K8\WFLV6c+NH,Xf46F4+M/5E9:2KM7JAV,aTUVb\;--K
U8[4UR.4Z:?,Q1\4ZaK0]>ED7M7FYKB+LO>Y-Kd;_W_[g9A6(afT\L:(VdITODF]
[VUP?Q,a0+,c4Q8KOUQ>ZH;V:IT8]-65.C3H5<&>\aD+VO)/;>Xg<c;[/Xg_XBNO
<N^Q#C_=]MHS^#LU^a0U2.OVDA,[7EfeC?MWV9<gb,Q>\[6+KYfUe0Y9=T?IE1b9
F7]58JB&V5I)\G:5Z]3UUgI\F,N0,aYG(V=+OAZM9LgT>=5d_UZ\PJQJd/L.RI#D
P32/FRW7fT:8:GEIOL_eEM>#:-G7/C^2FS0UOE]^FC6:Ae>K2>E&P=+3)B7PF^SG
)0b:JYc;:&XN?+-c8ZX,DS#8;Y0Z^6QOa9^T<Q^F5CWCG=XW(^e#J]TgZ>ZH/P]1
2J#?PSaUFReER9\20FU\.DPa_W#7/1db.8a@e&(M7B]39Qg)\+Y)V90+;<ZG\6=X
Y=D4\;,()I>IB^dVccP^>Vb\1S:(E7T(KSOOD.,/gG(@GU9e/g1>H^b_LHD9>+).
?6Y7#3Q??L^R-5BFRP=K-:=L5[Q=_H.Wc&9#K@DN2\J=DYAC\YB2Lf^b:><JKgTP
(&g&MbO&W>:CD76aB^R;\=dHZ0E^cWGKbQE:4H;5HU\T3JGZ<8=8<=21VO=0;F_U
JOS:UeLMTW_;(]OcDU/85LCMK8))f.eEN]YDX5YBYB7<82&=(1<GW1(OE_J,LODM
>V1I&VGc48EeY0KCTJUXD^Y9,+@X[7;+\@W<?^.aAP[X.)_1.7\,d>DYf_&EO8fA
:45F7SQL=[1bAdd37I.Nf^CJSH>SKHM_=PY]>SK)0_>7XACF6APJY)=HM^;PO[ZM
[bGV.C?<V]H-TCA[BUNYL=+0V0C.gU(bIT4fBDDV@;[(P^/8G&P>Z9-9^2gH;:WJ
E-NJHTMR;KG54UB.bT;V5:)#d1(R0&MI@8>#@.VJ31#2.VA8AS9YFW3)d5?4AL[I
f+/_>WV?8OQNcVDGYL(c)X[XQN8agV[;=]:;4?9HETI^#?_3N)34Y_F_(XY[/-]E
1/UEKeUKHYX=:DYF#^25[XQTLA\3)MeO1UbEJdY^:#5U^=Gc#4-WKY]\AcMTfDL7
(\acDN6R7O&&4gUQD9^X(8V1b70L?VVDI2>++bY+(V-)QTeS^J7g?5Ke[>L+4.3Z
TVF8gD@T<Z3&0]73P>@(S19SSUIZUGfS;PdKA:\e#ca\EeQF?DUH1DXYT#aX<@>O
CJ>^S(]N;1cb>&V-PN9^75B&Q=a^g@UYY4eP(NWTI,N?LgC=B<5)d8C>(f;9G5?&
V-M><ZWJ_CAG9H7a@3Sf4FU8=WAD^f;2VUZ#B)e6HD#^,;gKAFOLc4\?(;T2^.D=
P@3&<9A9[3W,ZXEQM<#fCY4I5PO[2Z./Sg[c8(F@=3WV=N7Vb)TBYBA&@4(8;/-L
8<>=2RKX37/g?.X38B^KY.b[a=aFL-6M]LZ@gO;\AS-7eD?9<JG6AHXBL5a/J_#[
=PaP[W:GX&#cO@Rb)c[?&),#5/,00/B1GF\SOde\7O8_EXQ2/46gMS:\65.?W9AA
M_3+-+GD&>HD[V1Oed(bOM,CT&c-b1F<[-TP&\M:g,)cZcD9?a^+>P;@e./d/C>6
?9<49SC&[VNd]Ug==#0O+.WC]UN8c,=faJU>XL#U#:O\_:WUQ)6f/7T:^J18IN(2
/F-Z84VfJbbgWY>3f9ObMS)1<CY@M_R(Ge_=>:)(;JM&?:BbX[Ka\/#F+P39/[>\
Z_/^826^5g-C:98][OWMd7=#D]FLG-E\;>:F-TME;L#Z1<1+9D9JCR,U6V)WeRB(
;;PTL5.+]f>[8RM3dXK1^d3WRI4F8CH+)B/Cf-5:5E9Q;=>Q)-@JCFA?7)Q9Y4M]
EC3CN@>)+27?RVa(UX+^<Re50Gc+V;dK.R_;A\FO?1TC2DBg=6IY>N(fAD+/Z9\1
dHQ6VY\.Y#]XbCAd_9V+U#2&6[HSfH7C6MW1FTdS5REa=9-\84L?_PG_]b#,,;6]
8B2:AS&PKV;RYAM3BC\NGJ,H-P)0,=99EC4L>>fID^7K,F1Ia[baR6c>H7G5IdTM
6YgSA7HcM0XgSY?BJ)RZW6XLD=PB1O3;eIU,>Hg>D&f:RB@8#.\=T>[bA-],@^&1
c\ZXf4WF/)<ZMb)>NY\+&#E(KJUDB,.2Z)5UBWZd>77+(FX)DcG)DWJ4N+FK@T?5
/78[Ba?HeK88V=2]5-[1[cVYZYB9c&DSXaOV(A0?_,6QgeUH:37UfVR9=K1c;U:=
<fI_E[I._:=A]R6&0cL.:S7JbWGHNVEY_S60J(W>@=,Q5+eS@>Bd<?1#b?U#:Sd?
O7bfC-CS+TAPI5N]Lb76<2]PT<ZI88=2B<AH[EJ.I)VL=YT6^+Yc34E1d2[IRGGP
.-V\:85+IbI3&\9A;JZgb.-Zg&E&KA)1fTd-GU0-ggIKLYgf&\/b@dM(C=R4g?([
TPIWY(.eK(&KE.Q]6++3d\]5_+/H7;]78QcS.RE=4;28V(fI+)<9Z9cacGfYPfQ0
e@L9(ND-[A0=3JYJ=Nb9V6;:@D]b3MX9N<\0]:C2K&RJKHMbMNF<WM0&5)baD:7)
fR6UI8^,TecFfb&XCa[]_;UP-B7H<FN)0MYbD?^d(R8Z-9gDHE^.7HOW[TfC)&[=
C1beTb5WCRQaWN/M]05(&VC+9G@,?Xcc(A^1;CC>K#RZ#(9Z+GB^?A(SAA^^GC=R
8.58N2A0@G]DWaXW=8\;&IF5EB_<aX;EJ40K?M/.QeL)KA4B]AL(cY-5N]A,._0M
IO_6e==[=d1#CU&NU1P@Lg<WP+2U6_\:ZU__@O8?_aO&[BKDfF44.XDe><Ve_,YG
27=Q9N)JN.5U?O0>Z,^T>>a6F#aMF9LcB39&MRU,Tbf3\gGN,O<>&Q&H>R8C>6[J
OQS1&CY#NT]U&[2f:UUU@e:.Q(60F5]US\LEW8L[21gDJ4D>\(R)Y0@6g:7X2IXd
+@VP_A9<X(dC76K6_E-F(D>45/PV6XOUBdaVO?BCONbM0VL]a1&(;O:V.fIc/^Y3
-gI9D:MV;8)2RB<=FL;QR3F/6?X0+Qb3(\#D@Zcf.01dU5PUR]f<N1M)1K.D_g]e
527g5\MS8BXOTcVAX02Gb,4ZVbX7SB#UM?P[1b52#_4f&2T>PUHE(.Rd^Ve\80&\
FT7NfUE#@.0.Ja7YF]=^8&L)Q]JCDWUK\X(49L,KZc&PT52X=>68J;=Qf0N9EQWU
g&)c^8d[P:(cH.U[1UI_eNE6.K3D41&PdK4(ST=#gMUME)BaZf]a/I8NB[=7cC6c
(P\LJ3#ebe3(76AWaaG0D#1<VMQJMKL486&ag:U2CN&KFW(5_)g[bQ-Q?/a[43O/
88,a>I(RSL-I]]]EI@1Q1C,UbPC>#Gb\BQRRO7U47<-Y6Gd;NCg^e#e<.=W=9F7Q
Dd=+d#e5U,G(e+3]7b2F^Z21=(^(Oe^81U@[g)\/AJ=3ZTc-V\eG:O^E,PCd\WgW
EZPT2+fH@?7O>d3_)-L>dJcfHA;IOKCZ)FUB[P..(5@bH+@Cg=\NJG9M7#Z5_8)_
&\?JY8fJfg\73VQcT(+Y3&e;(AD6dIA>6@U2+K6eS&8:f,WHO#^@+<0R?.6N^_DY
U(5C)S@eT/Ad-<<N#gLK(.EdN_@HC\WUT7(W.)+&UVX?X;:8-JVebG)dQ+7,[O1N
#K)g)74H461GK3=1Qg2_[67<0#727N;I.,gJ1=P\BeT=O.-aRXSH1,X=/Y75T2>F
dQN6X.Z32D&?EWa-\]aEIDgXD-(#ca=Z\&H0\bZ=g1L\MbJ>.MDS>cVaV>_\U(Yd
)YC4W=T_Qg/fH2?bb]g\+^T\5U-eP98KZG^gZbeg;#KYJYKA>_\B,9NBJJJ_J^ec
Y(#(<cCFdJbCA4P:O&7<X?OE4;6Nb8UHcAZ-Q\F0;DGH1N/LG\7.GebSM0?JZb,D
8]C?9)A0I<LGY4Y1Sg7.N;,+FMEC32&>d,VWUZ,));>#SGd_7E,D@PMVHS^YPB\F
e(dJ^B)QLg#S5K>R:>;D&_(,A4DfK=?L\S1G^D>fcN1gPAW[J(TbMc(QY48+U2LG
\S2XF^2ed1@#7Y<(9a\@,8DF50Q5ca?])5NQR9f\6F_#C=M/5Q&)ZO7P7L+U-E26
ZAZ]//LAJDVZ=9>&Z0Ea=?-W98H=8F.@FS?FG9^T^\R@V@+FG2LSB.C?ecc756K#
U#=4a?Z)eYISaN\;aH>#.(U&:)aQ#W/O.0ZZ9:CZJN;ZM2d(^\\_C0LC0K9bP2ga
JGS+T=WLbN=I825?N#9f5A978UG22.<A9e)7TV-G7<f4U)-;Z:J(]&>E;_:A(TgB
IE&WQ,AQaR@/07^UL[\YACSU/(@9WRS(I]W9=:],G][FFV=,NScEWOdYWI-:C:=4
(><c=J0b]]YZCY<&];+cRNd9<EK#EEG/,1J[LORg(RJ-EY7]Q5e3))3#V4:;U@G9
G\Tc1P#g9[V9H]eJ(I_=9g6LZTB7T=/=g1/c:HDRBS\J]FW/:EZ0Y9VWb6Eg];TO
U2YG=:;1K@/MC;ZS?c7JFc[be#MR+,:<)&Rd[C?0b.=,Z4;P8KEODe\ZC38QYFe;
-S-9bg:OB+S75PQ-FBY<K:_4+Kc8V&868)P>78R0#cd,/F.9ZeDLCAI/:79WgRAB
GHQ@Le6b=FWD4A2009>fF:>7I5[C3c/EC&b[Q?8QEQ5-TZCKI(1:g^-CY]1?-L?+
^P2eaPeN9E2E+;Q==a3BOZfgTTf1U-,8PFQNC3ESA1B5?4W002;<dZ<f=PY:SX:e
27?@^EJ(b-5[VQE5@dR4]FP]_0?TGXRGgT^,?I>V2N:9/6X[Qf&FPEZKe)7NKY_a
MR.;0bD(L6>_4(beBd)WLdBNG29CA51@\LSLM8;_R/4^P=>?[31A[QYA>>eN=P:2
aENO;P2/PLE0f[#KU9Y\PMI9c=OWdY??cb;bZ<MM1K8W)&2H9:,4=^?T^b[L08G@
[9^.M=dG8TLGLSNX[45YXg3RZGSb6B.C(Y\87.)XWD+T79S_<1@&3A^Y8Z&8<_.<
KWNBJN_e?aZ\Z<\DP</?QK&IQZcTOHA+U7@],O+G6).MF8(d,T#?/eP1&.QC^U;\
N>bCJC#DHBK)YddafG^1^;@6FZ:[#Z>TdU@_)0L@b8DgZ6_SO?e[)OORGf@>/=g@
U)78A6T0<^[+O<I];&Y>dV<5P<_>_[M@AeZJ[f,#CcMg_TV_87T-,CAM;V7Y\ME?
?>9a>^C7G02P:QMK8Z9R+caY8dBN=?CcE&8?Ma932</^+RZ(>_EEX8KE@b(Q;MYH
A;0URT^562VgP5[L:O&1IYfKJ9-g]B/UAS=85g]0f@;///3M?FT@8Pa\Q,_]+D4e
DG/7Qg<3=f>dO/@8U@/6_ca\bM0[K^Za<+FV(7FLW#O./CGX/bcL9COa-P-?6VaV
J</<8+#L+1435M<]P)9aZ0LT\f;PKLEdB8\Ye)G&BIS0-FBeb-:U00<Z29\N:<.Z
(If7fPYASSBg8KD<Z#K12ZOf5D]ZILKO8XJ0@bP,\RC6G.=^_1S3(596>NQBZDUS
&B0J90[]d1c7;2--U@4BW[/TbfB,WC9H[+b^RY5.)=Nf[C)SFaME@VL=_K@dZ@e.
I,F+]UU,&BN-3;<fPBa:ZDf6A0&0B)S,[UaUcG8_[eQ8.:IW:EXgX5//\M_e..83
V<IV>/E;PTU3FD3HR>S?578:.N9\^Q\9O9FU_c7e(N/F_9@:@T_I7T7O,NOFJ:#H
HeDTJVC+-f]]Da_F))18(/@=Y+5(FA/.=QLJ]YT/-FeE>Q_^Z<4[3J)>/^VK45MD
,)--?C81[6KC0dJ&6&JZ^ROa2V,Z^P^;eb/36fcYCSGc_R1E47V8#\#3f2U#S[8:
bG9LN^Z356FLJg.__^NQ3cFET:JT>-F+@=B_57X)O7<PB#QbCTZ3X,5)W8fA0@36
.<L.YZ[ceF5abD5F068H>GOd2YPI^\_0)24^9((g)>\YL>O-70eDeA0L>N+HP&OE
)f?Af4SNO&d7d([=f8ZP&>O4W@:bTUR4XQ5^6:FSMB17:P1P:gX])8[N@d]R(BH;
4-#V;V[71R->YE)O?;@Dgc8e,;_Z;B@(]L8O^^V\Dd0d)>19JLKVR9DHCS/2EGP7
RPU&LKZ0Wfb&=E,]VUGWOK>Oe>gKdYJE;Q9L,]AfQF@HATF+/V:&@.f+e2]F\.3B
:KeWg&2WaE6YDS#BW#/O-3FLE42/MNb<ZXYaIOP8IU\^QB[0#@g2;c5R\6RPTRG0
Ref/Y&fa=W++Cf_N\e,P=Uc]#IacUB1:PXR^,\XM:GJ9G_FZZ[3A-->VG_71)5_F
[F2P]5(=2\E00[ML5_eZ0P0&d-aGg<,b,.N-R,eMS[ZN/b_V/Odf1:M_1]Re?A);
/d0K]UfBfR^#R@A;-F1L;eXKKA>Q,)B=.CDd]EUPM].48c1U5\9\<@FeB7R-OTF0
YbYOaEO@XJEDZP@050^-Y;JSVI:^3f]H#W=Wd[.9bU/QeAb7CPU?Q?OZ5HTd]O\[
X>>Y,S#U/X]WW&=VD45+f61L;afO6REZg^CM<:K(ACCE1/FQR=<Y,Hag;5]N1)Tg
SYC>?>0F#5\]P>HFBN4(:B#F2JZ@]Q?3JW:^&/=P2GBP8dRL8#3F.,6,R>D=d?M\
IP[?8CK#9_>3QcS+VbAO3MgZcZW,F=Kge^9GG-4AA;U?Q_Q9QQRXLLLQ/,a>a.\R
10N9Kff1f;9dH92<VO+ff;aV^+L50T\VCeg)-\[<7ZK0^f)40S5_@T&W_N4R/c-O
3GXPMTLZ:4&RT@;DJIFQVEIcGCL7O_:?ZLEA_2b4/I\,]9#bQ+a6^fSR/d5V+B7A
He6CMVIND(g(#(\:ONXR/SfBI)#^HWA]RQWa_>dY#=XLg#_0a1A2@F:FK&f1;SK3
H&9^9@P1Q&adc:>RU+d]L9V(K^/Qa)K8,gg9#fH#7Wf;c#[LUVL6WO[CIXU+ANed
]C>W50?_^2c@19eV=e1KS>cMR6L9SJX;<I<8]g@?e)]#,&IDAV.RTZ-^e7C,XEa.
PW,[f/\UHc\L\=#C3PRaF4J80V5T=N#eQ[:]E6_,-aV&XI;1D+)2L6PJE[Y,B(\f
@3BgB55XAN_g/LfA?5&a@I2c1M(97RJG.39\-6S#WRRV6@^K)+e-cL3.EZH]eJ,R
_eW;/TdH]2+_\QdENY+g3.@BAHCJPK]1a#=5(@T2#a1XYBY4=.:(9BU(JKXL/GX0
Ia:eGIBC^24&YCP5e+6bagJ^A8V)[U1)\&AIcFT.082C.(=7Q84#.L;W]D?4<D#@
d4)8a0&.GBV[Q8a+?bLZ&Q>XK:SC\F&()Z1Ig[->;X]SNR=R3-X(PWIYVUT]Y>2c
Z&ULUg<eJ<@.4db=9/.8KaHV6fOC(-8;_)1ZZ2VF@O+Ec?0=3c_&@d0XLT&faRBQ
IC]WK_,6d^D)C1C@3Y;gS.(TI>Dd-9=6J1+7JO>1)Z>NUG26W@b6.,9N]Vb&cK&I
,J2g+J)_^N#W\6e5?YE0+3--/Q\P;;0bH0POV7(EQ.WLP+cg-IKFf47U1/,6HUHT
+W=T+RGWe_A01N,0MRDQWSU=5@E7J@e(]\[S]7bM0]_4VaeVdOaK#aM>^\gJfb27
QF2aYM<U;N+=?fTb;N2&bW-Y8Y:T.4-XGgc_/0aHCQJ0S90]GLR(?Q2aBRRcEaIL
@dX?_]JOW,)^OPA2XR^KGeCdM8;9=9@T_=>4f@2V+=OLFI?90XI]PWbO>;cP6=(8
eC.KUCcCaT9J\)P(11].KSLJfD>ZLO<;XKW3ZX//-A<G-WMS7=NLJ(,\/]8cJ=+N
@.e;GLE\88d@B]I+\Y^Z1F)#L8d](,fb/eD/a&E,U2?EX]g7[:a89-Ya2+FFe<bV
Q/-<>8LPH)-^:\XMd<9bVN[ADFaHdK0Q<d+eEIAaKbZ1[H8A5@TLUC=MNa_#^caT
.\IZd?Ff3NZ?8M^,>-_b/b,7_,DR<e1I^I8UDcT0B\CS\/6F-H7Od&bb9)]4\79M
3NHU8H/f=CK:3WK2d#M41GXb;P+@B#,X8e,/[)BG,\BLHA7L42QK2>B:0acfF_e.
,P+R#eH.+1C&P]^:;f,3>6Gfab@eE]ZPDDWLIZ>>1#)R@;@65N:KYM.U^SIK+3]6
Ua<K\W1Y=KW@1R&YF<^HHe16YbS<X8b#VRN9HcN[?+1BW302Z\9^U/cP]4f^RgG;
ADC\c,Ugee[#0[3dgQbdf5OQ(/5UIL2[:2B+L<b4=;FDKPZ>R4MZ/C53d.@6QTBd
#0VY^ZOfc/.5YUFDS-Z05cZZe5.KEA#1E.C)E=1_Z1GX;@Q=D/#N.NT6;:Pg+H7-
[LD\W=.<6(6>UT41CV1;CPLG+f#IK;f.-@Ig2:RRGU\581#a8b-NK1[]&T(?fC^6
ZA,T&4d(OYX+J0<9JO:MNa=(_.H/d,6H5.(B=A5/[&c6?0NKN5N:c:g6bH&Jg6H[
(FMg+X#G00#DE>4VS3b[,()\(L^+0&W2;HW#B&\:SgCfPIgL71Q+1?A&V\_FWdVC
E\7]U.3>FVXC(I.(X6#?\<ITG1PN&/a=9:,e,NAE_TBH[YF^#W08IB3&2+J,1249
(XaZf6W[>Q@Y5&AM6KS2gUP?0fgB=((8(eg0#gEfTL\(KF2QH=<R+gCZ8@;.,^,G
<.O#<FKg]:7QMF+b_]dEH8Jf&RN1e9/_3UVgX4WAL,<O=Ke>=,W1EKe>6f7g9@&g
^<N)-6PJ6YHCIJK)54c9YDUN4aHSLgR@ZJ=-6V=4F=TC:#D<d;Z45WeF>SRUF3Ub
@G:):(14\0?=FgK[VF/EZ-SV^dcP->45HW(E20c=<a0IK_Q=K9.7[_T/g,0<(7^f
(52PM7?88,W&8gP-],S\ZdSV1$
`endprotected


`endif // GUARD_svt_spi_flash_s28hs_s25hs_ddr_ac_configuration_SV
