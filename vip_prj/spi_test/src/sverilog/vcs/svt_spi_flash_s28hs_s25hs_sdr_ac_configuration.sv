
`ifndef GUARD_svt_spi_flash_s28hs_s25hs_sdr_ac_configuration_SV
`define GUARD_svt_spi_flash_s28hs_s25hs_sdr_ac_configuration_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S28HS and S25HS family in SDR mode.
 * For S28HS, this class contains timing Characteristics for SPI SDR.
 */
class svt_spi_flash_s28hs_s25hs_sdr_ac_configuration extends svt_configuration;

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
  real tCLK_SPI_Read_ns[];
  real tCLK_SPI_Read_2_ns[];
  real tCLK_SPI_Read_3_ns[];
  real tCLK_SPI_Read_4_ns[];
  real tCLK_SPI_Read_5_ns[];
  real tCLK_SPI_Read_6_ns[];

  /**
   * Minimum Clock Period for Extended READ Command (SPI) commands.
   * Applicable for Read PLB, Read SR1-2, Read ID in Extended SPI mode.
   */ 
  real tCLK_SPI_Read_volatile_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QUAD I/O) command
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s28hs_s25hs_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s28hs_s25hs_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
/+K>Y.EAK+\=:U&cYHQVFHfMD_M1SdBL8gFC17I2YK8L[6N[)9)6,)ZfE::OKgZL
F-RKH[#EcG:cH#/g,NOc/V75=4LBPE?4d,Z?g[G07Rb9;9d\GJZ:MXV)aO4G\0#?
,_.YdW5J2=21b3+MgP?7BB[)UB(@-F[\M1M2Ed7X<\V6@d)Y((9[9/ZS>=2L]Jc)
;KG)OH-];XPXHaAA-2NPRZPN_2^IQLEIV(#Q-.>LO)4>63MI96+WPCc6S)N>\(e)
F80WAcALE^M5f.:.=a7/;&c35T]BgRQ08D7(^LZ<ML32[[<Wg<F7^7]H84c(Q:V@
))F;@+DFI\A>@LaT<4[<KW69;STLIK1+EYJ2.7F=M+#cQ=EA)a#e^dHZcO#.PY@V
@bX\?KAc<XdKSGTc?g]d;&\b^.LGIEUVRYUM5XBB]B//>F.45NG3#>CIdgIc^V)\
G^4dTNTV\^OR)?E+CXTZRKT43PBK3\M)775[d<TDPMK++]9Ld4X0_[@ecYU5^_Q3
@?-V,K/SKD162\d)O7T/^gg2.AFe[/0(/]K00),]dUa]55VC-(.8PbRKcHR+#GIM
#_EbN+IA]&3EIEXd83AHF?c]::55@dQM)AVX]-1IGFHT3e>F7PBZ-aWE:ZU8eGa+
)dZXf^?^D=_\6dDK)Z<K)(?E,g@TN?4^T-F@EQ]0>JNKLeL\R^=Q/P+O6N+)-6_>
)7;N]N(FK^(@Z,1)T:N>d6.Ofd7a2F,V4bC4]K\.3eF.2LPEC2Nf:UV1;]=<,=c2
2JC5+Q:^M3bU_UA2ENSTWAIc7@FT^E[J??YDK>\\:J.;\_6:0L15J\V1M$
`endprotected


//vcs_vip_protect
`protected
3^KMc91YB_#)fRZI-\=K1X07U+0<](G.ZfX?eMW1X2CdM=>=3L>L6(#S0@T)\aD0
E(c(f4_NIN+9(+#MA>[8\&XP23(B1dP.S/aJ.\Bf77.Q\>:Of@X7f]E1F.,OYG.g
1M^I[,g50>,_],S:35C,653W7XP<4F;ONG@114@?,N/EY=6g@H+RAdXeQX8)N+I>
L7cN6LfJ(@/_,Q13)K?XF7c5(D+:1YSeEQXK\aP@[\\UL\;C61WNgM.>@K[I2#/J
G;]b&#></07PBe(AM8c0PSSd:S-:C,d4U.-.0,Q8,I+6e,46g@885PT_HNI<F-)K
^7+L7(=<UEf1<XZ8ebL?Q2c/e0>5c_,0XKPIIMCZ^QcQ=EVP&SfJ++MP#ScB=&^P
31LDM4G6T]\1#)14Z:NBP&^7#GU+/H@,:&:MaE@QL=e3=7dYRb66F;-c:9)8Q8]2
_5^Y^;>-TRY#b5J9-8I+UV(@.c=b<B\1)OE0[AJ_B(7\)eCN/Xb.4bU)4DCGT;N9
>#^P8:KT+gdVP6d6&2[3e48I8d\XT1O_f:e7VR;+gQ>LQA2DV-/3I\U^eC7TTMfA
GZQ>5e0K>E>?d[A+FFB.[a<Z=CYgFKW4QGBL).Zd.@=7OaXMJBF/SU9(#&-IM_8=
5[=UAHBS[@@+0+L8Q;;#14_T;\P5GNbf])dbH0eX)T2Q\1.W6K:Z<K,T;,3NdY2D
N@KICc)NPKW[HPO[bMa#([]4>/=:@CO],BM0MVfK9:;N2BaSRP<R#A.C^a6WR6)_
)6QDGOC&2M@NGWMVEbO3)[J?Y+a>:f>L(:=5E)0NJC#IP(2FZ:\U\e/ZZH/?KC\D
+,JJM#fTNHT2JTa_5]3RWeX2[[M25J^759S7fU^-E@^e4=dQGZ)/e8S\Y,/a0>H)
E.G1S9_A93e9F6:4<#2JL4?c9=S(BP.ME(^:H6D3G[GD_>&#GO)ObY_Z&0HJQXL5
[^A/.H1\=#E;<W5PW5YHSb=^a:;V^07_.5.,.V^V^44NNEd9f>K7JG8/VZBI\CP0
,aW/X309_ZS_&[-,/\.C/XU9TG0_F7U,+M[FK_0_,2R/8J6J>O836?\(+37dH1aT
eg<H@5P&7<@&?[]W8_JbVLWJETd/7WMB]>D_Ta]4eXa0]H6aH5(bJ8H00:7K[=OR
P9W:Gb_864[K.g8^)J+Id,T)HJH5dC+GWVA94^#PC)e>_=9V=[R,\V]>YLbI01[5
fQ@Y+/=\e7bY-2]aCFT&gBM3U8ZU?V)9&9gaPf9.a#NV4[-0>+[3Z,:=W/-AP>@W
6)bYM/Z;DOHd-M971CVUR76C>D]BFE)D@ZA95N]EQG9(.JeK^+CBRO_PB]GT\Qe2
DVOZg^+HC:Ma95W4Q)cQGNJNPgV</@(GWXPKg<M<:A@RgeEU7HC6b\M6ON3MPU+4
7Z2XWf=OKRGWUIB6TZ5KU&H<N&A0(#+a<5@ERI@7/8@56HMg^[X@2BI=P2VQ&(?1
bASWT@aXJ2._&F#:UQf>6(8D)FU+^aH+TTHPM-gHHg;5LO21S=)-ODfH[b,c;eK:
@G(@N6=8+.9KW+:R5eU?W3cE(AH&RR4VMO>cUNJRN@#V+FFI,/1;2c)]IgE;K6)J
;ARV:MW<F\.9)bH]F5)Y,REg]4GPf=2@7KU5KM]FB:Ef7PAGY6.);<#:K6GHIOE2
E-\)1]BFeBH+He=ee6AHDe8CCgWDVd@BO(=<3C#-29MbdX?;U\ZCE;W#G)gNdfZM
]<N8N\5aY/63:d_Z4,+-G<Y9S;c4C]?e#b/E40]MMB^=cZB.-4>5fF_0-I]T]bM_
N:KE^OG_,R8\RPZ)A.CWKA3#:P+@-g##<Ke]f@P&#gcQ_@Y&EKK8ZPLQdbT(HN5b
8Jb5_K-/FPbCP,8H2F7=>ab_52J&TWaXTF&dgM[&Q\#E1Z&bD:0WTd9;P\40<T#R
8XK<5^bFFV=MHJ.X]S@,5OMYd@(D4[&2L88fdYd<]W2Y2^a-2g2H5Y+Md2O>>ddP
8\X0ZLU3]J.1N>e(MHF>);NGU_XZ=588W,>J-KG@>He5H>P-=ce^Rg\e]R9\Q8.Y
.3R:.5;d9OS-2-;H^1a35E&3c3W5Z>>QD/YS2aa:(9Q-O[Lf+I)]PY1+.=7K.41G
MP9SbQV)\6&?W?Z0;Z=KaGQ(1WWAfO8\H49E[=2c2e&Gc-RSHB;c4;L?&24W6YUO
dC2/+-;L,[HNK@c993V.NR<aU-/^L#gLG>f24.BT>[X)D4B.g,9eYc3@cSF9EHMK
&4H5+Da<_Cg<DW-dR-]V0eERIf[[AH2<I59)9\IQ/,^T[3_4;;#Z^d[9EW7a.fOV
A:T0:9\]:<g5/^.FK1d7/;.N?S(88HQW:?dfY:4]#.:E:5gUF6Jg1DMK4e4^]&NY
J?D#Y,SgIQ:(cM[cC\Lc_HK,DFFRBdD1=7J/ETWZ)7HHcKEAP\J^fY&NG.#IDa<Y
IDFdM<&<.8PJKI]JHH>+7OV.^H>/cd),-;V0C^7gF/H7b/BbOFG?/+L4ONQA/bc.
@F_]/Oc0SZ3N_X>e[UIH/5O8;RCES(V[d&^BBKUD?KZH,_B:7&_Ue27:N/#a,QIA
5Q1@:>>Ef+HaE@NId?<^;.<P-@,@\dcU,NJ/K05I&2;^aJ??Og^DZKPZbR,)gWe0
FKV/N+B60f^DBPK3544b;W,c&?9J_\>d:8JX5bDQ9b_/@<8fEVP]3L&1N-Eg/6RJ
NTK4BT&0[c(Ee-.>M/48I5<]/e1[AM5-gG23I^YP+X93^7M+d-@#ZM-ZMMXELQ^D
UNRAb)bL+O]9+ac<HeR.dd1aUM(.aPP5S(J<F&5?&MY@?M88@f-Zf<cKf.87VTBf
+)@eNL?PU(DFAd.a?Y;,dEMW.Q7[Yag_4(&KD;8Vb&I,+I1e=Fbf<P&HRg+43)F]
9/-&(XX\ON9.<<FP8@\=E.[W.9C.F,IX45QcQNUNDS8)3<S-.?K4OWUHCQ&8Y(5-
D5.K>S[Je0@]F1=W21.Dfc+LCYCKEUVR.<T2fYH5]/W#G;4=a^^de<BXNHb7g.0P
OQ7DTTCCK@S]+3D>S/aeSD/+Id/YK9T\JSLV=C9SH+<bG17??ZV>a3E(fH7[.3GQ
4?P#/0F/O-RX<COW@Sc5.eSKcONI-^[B#EB;&0d;F_1P-1NEWX#\HYfDX4\GW>+d
8CP]0(.g\1Y>NgdNH0cBIf\?XF3)F)Kg.J\K=fM6@Rf:Y;INGU35=RR&>eOb1_[8
QUCfP^(]g5dR2+\/R_d65E6cLf\<RfQcU(#G;8_>52AK1AJJO:KS,AfF8J=fHRM1
V&B>@WC(46==\65HZ2B6;52>O6gGO?FA@X>5SD/P3QX1&/.<7A<[Gef+[G>eKJ9L
RU2JIU:0fT(NBM,Z,HN(FG+FPb/AeXDO4OGbNT/WWNC)7Zb=1f:(93LcX#AVG>SE
]9_:da9]cPZN6<&JfbAWKg,>PYMFR)L+<J^f443X?JSK\FV<()940+@-[_bY[8\W
Y:Tc()RPS,)eRSgI.7JQ&D;S8U5>&@E[SN_0<c2DW))R(1T\>C@(OCZX[LcE]XVV
ZA?B+RMI=_P@@P1U05fG2./E6R,?H&^V]:]>XBeU6UGR0I1F^9I4?S9;PO/dB+,f
WUKQHFP.Q295-fC-;@X0ES]aU,eG<Q>C2=Z1E[U-;8WID54,=N_.\F_;TX0EECc^
38T;I4&QOJB2G7+.&RK8ZLD44aRb_#TVfK<F=#cJ>7Z..]VYUc+D3-fEJ.B6B40T
VQ4/aJI+(XGKd&4&dIV<[5>f.@A;_#O7FDO0EP?:-e0U(A@R^Ec^QTM:6Y1dAJFV
91?H-;SBGFWdW]5Ad\RF_OIHYLZFV/5@5</2USR?7)_?/b02+WNe^9g+][1O(=;:
+.9GFBN#O)_Dc4:,XX3[,Q4DEX4[.+342789RT<L^Y;GBV:=HPDc)ASWW@CV.gVB
.bd:I6NgWf=.W>E4bI33-cK#\:eX0YV;:bOF3M6Z<Q#5YZ(_;Xf8.(UK?RHOOc(&
+L5(D6]2_XR]A6(]aK/;@NSQ-Y]4c?DVA4cT<BDEPdW0fU+Y2,W296_;GcMEK1QL
eI0ER6YA3@=Ta[Dd1a&Qe^?O?5GQV>c5/-)]_X-@LBbN(?C(IIbT4Y&JKd2NJWYd
)Ne)U@KEU0&X,JBf_\,7b\S\FVK5a0#IF4eK3Pae3g?V#BgdMJd<RXd9REbRHKVc
#:()6f\+TM8W>JKWXKgP(d<L@92KCAP=K&3_4QXN??dVT)bOL(S[-4,H5C/\>8La
5>+IEL\=-W7gfO>N(g<FBQ:C,,5/g&:2@1;51MH:T.V/0e/UA11A_Me;a:<dcC=M
7E7<HO<EW?F,0PeX3)?[@Mg_W?GLIX]LQ4GWg[.+&V:.KMga;6R/@/3&FO#2dAa3
/PWa0&GbU\fCW.4?,>L23#fM,Me3S7_6aMZKH&a41F7Y^@WZS@>f0:-a.Q8=Q7P6
cC5OE)^fbT=XSW.>8Cg:dLW;,J2_dN(YV/,[&>/3S],6:5+G+?b[G/fK.+dY\XW/
)5<FW1]0.QHSE.CgZC(UF>3Ebd<I9URLK-&HB6.(@XdD.Pa#SBH=#7;3)MY]<OL6
R=)D\I]^&B(_KFJe]C\0DS)OKH\8_8TWEa8AZ3>#Y][J(.cCbd^<4Gb(T(D5dX@Z
.->-@(??gN;7F8X9146TJ-a#G6M[M,Xf=+E[C\1J+LJ\8AdPI?OFOB6a7GJ(g]#@
^KH;8f4\HgM40#FA#-UE/T];-ge[8#L=FVPE]DAOg#Y8PQVfII5(,dEMI03H@#@G
&Rf)_dFXeM&DN]&-ONRCMM8B>Tf+.(=\423[Ce=,3aGdG+.gL6Q79^.b_,/)P([7
eF3V(W<XR[W(T+^.&e-^^6[+A(]1#W?2(&Z#3UUUIaV0C4_#Y;bCWL8V;56I7TX.
:TDK5OdHWU)L7C3NB10+D/eF+]B:L/I?a)D>KS8J8A=bII^1@QS9=eCY:(32J@=,
4S<XFgbPOV<D8VO4^==U\[+<HR17MH8cWK_X;U:5fAW>Z4M5]ZK@0E_Z273?:XF#
eBDD5O<P?Y=IRYc9]Ff-S:HYC8:S72PMb[:4]#1HBGdfb)g&Q&.UFg0YK92AaCEC
E:E&>[:/cA1Kc)=L\5ABd+_Nc))g]61VeIGcPe,5Qa?@gbT4(8ERX-E<8RGW##0c
d>S9Q.,.UY0>D[:Bg>.g]Rbbb(I,Q93<[M6Q099[2B.G8T3Xe]2Wd/dM6^C-8&HV
@Hgg>GWZgdZ[Kbe.A:dHWZAGA,@R.])Hd/V_,<AJH00Q1MRE@/O(cg_\XEYU#_a=
G@[c-VM:.MeT(f[:W7(KaJ0<EO#GHD\?#J_HW20B]gL>IEJFQ8?faP4<F-.PQJYe
45,b?JP.(T/+0]E:f]4CN:BB:IBX^T(USZ?&6:EM#_=Jd#;dK9A#a:<XHQN0EF<S
6NH=e[HM+S]5^<dJ5H>R3H&Q<)BCH@E^Rf8@+dK6O+]G+2O^ZJ3ff6BL0TaG+21&
PWC<g?6C?,fP-N_<FCV8-QdO+F@g^)GdA_/<L\M6]G2U?97?YKbHg@P>P4+Yg<?Y
GbcKP4C/W19K;C[KHDIcN2@\ZF_]TLE+IRVVMB^X@;9S89KF:a,A5C_NET4bcWD^
D8D[QLL1[,XN7?,^D4W;aJ^d[PTb:3d,;HFaVRB(0gZLJLBed0d1+3=Y6+X]be9X
4DP)?W(ILYG3@>^DX.O4RJ;/1Xcb<ZC-LH;#1_,PBSGPdIJVeR3CfOIc4/Dc\/D&
ZL:3P8&D>:(aX8cNccL/eX?@3SZ3PA/Jf2=:cV4BJ<&8Y])/ZOgc1[d368eg4TX?
+O]:UN<TB\:>egWUXA_gaXS)62]D>9W_N@TfA7?eF]6Y#=dFQSVd:U4VYg]@]^JB
\SWPFVN,O<b9Z]d19-4MJId:_8:&b.,+Af>?FUEe0Y&>VE(XT3R468W7;:1;+J4[
G+DL8WK[BE)-:LfO>AJ.\0K>F<72GQe]H_YEY4Q\:GQONRK3)5;U^CI2J43OgQY[
a4^P@N]MRKUA)X=(4B#<VX4AO@a>51bW[T&c0^JI4f7]5<;_CTRS,)R\#C<.d4^J
D7=/?R9FFAL)RKD<^fVU6\7dV^N2,0GGJ^E,IFUV&#WW.,=0LH=^+.UL)\6MNbeN
0:[(;)AK?Kg5BC+&c7-MV)Nb2Pa4V@&T?bc6(2O:ZZ16d^@GU]=e+(eaKN/FCgI3
.=(PA&D?<2TBe,P?cZ&49e#P]T+O_H7eE?g.2.SE@]:07T5c:#Hd0c1NaO/>-EeU
IK@G7C[_7(97(I(KNC-UI&c[(AVJ_gNSV^@f9MTcNVdK:U2?EPN)[gGEG>:_224_
\AY8#2I9VbaB5GIBa&O,F.d1GX0bEL+]MPTS<a6G/-?\UeAH3870]ZM211&[PN>J
fda/SY61FK(4g9.FL7\[TQDG18(#-#]=gdVN\[XF,YOb?D3/8I960\:RNb,\O(@Q
45E:6(YI/MDfFeaJe/<:>cFGA,_.8ZO(2Kbd/WU(\?>DTQBV8;QT7_DL#AYeH3?-
c>:]=9Y7eFMUEEg=3QaaMX-R_CD<.0K1PK3/dHLAPV^4dd6(D>04(@-^bOP1#:+W
L</-9La^I3#0HAKC^J=HK@,P9+TQ:HOE?K_C>X6RE92WJd2N_,c(];-6250P[]96
:[7&d@/YgU4#^WU>[PN0Ib?AVF;=,gf3GY)A&J/E4-QT=Oeg]N04TV:)f2f8@>e-
Me[BcN6=NY-<aE)dOW5][J<3QPZf+,9c/_^9Kd8HIgSO>6?6LCMc3T+/ecS#=_Z6
Z#WG96XMA>,ULFKPWVJ)QdPGdQB2=K[VbW=WdTSc\/PMY36>4D4\cgdRCW?4AG+8
Ma/_#5e^.H+_Q58Z3V2YBcQf3<OdXU35]J_M0g6VeOZcY]C2R2+7GIRB=N?Pa6NO
EM_25:4\8D4_I;Ed_fd<J#e[X>&g-[-<1/]a>W-\ZCQ_6I:J6ES1d&V8J^aY_33&
=/]e3^8<+4HET_LGgX^Mc+-0V-c7MIAZZ2@0,]D02/B65C/I(?fI/O^)U(]NgQ8\
1,87H)7:V#<7\,;ERB8):_Q)G<eL(=P#\.-#;gJT4EQ.\3F3M9Naf]aX#LJC8Y]=
=]MB\f9PZ>W?185N4K,@>KaG_J2Hf(80.R3g2GESLQ>\V;,^HQCWSB.IVHJ[8^Ag
SFBB,RFB1JWf_J:2)<ZEQNdF2=M=U[>Ogfg,+I&UK6f;VTeG?-LN2#(c)2fNDGG@
UH9V6.,g;)<SF1-DL+N8X-E_a4f\+bfOZA25^,KEX/aJQX/XbS[eZ<(ee<#a[CgA
6O(XGRL&1@_VXN9<3dA3?0)-ZfZaFLO..O-@H?5SNd.2#ZQFfG1DLMb8##.e.2ec
dT6^XVgGZ)&<#XESR^QS@RCAHb8PPX#0ZO/V7@aK391ONL1X/O7?S;95b.8C+?f^
P?N&(Ge?+,Gddb:,9#XPMI@2dAJF+/?Ec8CEg?]Y<:.eIeQE?dWOVU,B:Q\c&5dQ
\SeA/J,Q^Y@KgP0b&NJc?1I[UD),d(Ie]9fSE?cOJb?S?4IER^SFCf6PfRZ9_>dB
JcP9_Z]5^=JYI_&+KPR\0>I79_.2dd3G>[R\_]L3VUg/&=eL=Me22Y8QB=N@;H,2
(7e_HM\,aMec+fP>ZGSeOB9VZF>72\Y12&9g)YPQYN&UaH>9=X);1ZI[Q>#KE,(_
GPT7a9Q+.NWcJcI[T[3WR]bH\HMH.LJ>R(QM:7,5DIU;8<1UETZ&J=F;4^cfa^(#
5,_;TN#DRYSW+U+J0M,-Mc4B3T0_\5a>@MT(BbLCgB\f2(L\HASe&.HM:9,E4EXD
+B>D7.<]KNG/UL13/F,WU=T#\a[&2aR\]\[U_?/La[QdaEDgOL3V)G.9<eUZK03&
YFJ]/Q6P[3);FKM,W^9a].;O1ENZdGOe8&?D@O6^./OC)Z_be4&X/^L&=@3E?/O_
Q&S97g@cgR2N/bS2J2BVQ-.)f3UEO>:&3Tb_(LA(d:E5\cb<XW0GgK#:b_]]2ZZ/
aHDfN781\,RT?)(]7LC66^Y6Na[=D<TJ=;(KP_#[TfZX:ELE81DM9XH+-QKW=@PN
.R(W^6@#aN;9bgREIN)7D#S-S@7/9QH(^b+/FTKEK-#gC7bJG@(>^>#A_c.cDW4I
8KIOVSE\U/G>-RI5I[JT_QRGYX_O/]ON@2V^\5bZB1VYABYI@:AC^WA+&b;Pb+Vb
(0@4-^9/IT:VYH,;LGc?(eD:PVJRgZb7JI>d.Y:G?B<5=3_0F6SHeX^-bPb#3E,\
c+EBG23O<M_<KRD^8)IJ<I;0CJ\3.;5;a7-Zb=M;)D/;HNX@;@.1)dA]92?=He56
)PUa<eQV=+::LN(U2M[5-YN9Q(3Y<LV\P<\2_F@X0e5IS/?5J^WPSEU.>8ZKGQ/,
3I/MFMRPM=0VTcU.E2b-+]YgACQ_)QWOfEWJUMYP_UYA@=Q3>TNZC3ZL)H4+HBUf
3#e>3LU]T?L-A.\1KQGAQOI:=e#GNC0/SQ0B)Z?03C\;)F3]2=-f\OB\W>B,0/N\
P&a?d8#G#O^>YD]J5W+J)eRY<]A0YNQ4.&?G_TG6L]IaI^P#NE0U=@]W(BR<bEST
SA(YA;6Y5cY5<)5Ce2#e1f4U2]MGFaEY.4#Qa=LD<a3B/1R[T\OeL5[CbGa^30MP
AJ4<B\3;VOHU,S#f)TR2X-O4+A#LcYVd^/+JB&3G:26GBeTfZd0=d0887#=IXHIX
_414FVbI^Q7KNZ:\]g[KY(]7&&Q(e\XU9(Q)N+TPK<T8G?dB.GdGPT)^J^HL;eA^
0Y)c2d1NY>eYOZB,3NI?0>22-([&5]=CcaF2)[799.AfGEO=Ia3,U\:cK(N/JYT&
)P1..#.7?)^:\5N88g=5R?M9TE>TR#502KRIMg[XND+M&;6e7E=Y:#A:JcUK;])=
8M>J7C?Ug,?\e&7DY5:eY,-VFR6T;R<EC_07a.,DP[9.FY@6P2BT>a&IIcD(OY;^
/70<+0^)-:TUYR=X5^\&7^HKeOXIG9@#X71=)B#UaPIf^H,5#;)AY?[S^KPM-Y_-
,a::c]9aYLNbGBad(BY=-a\2LVS9&<Q/6^#-RYWOVR#WKC@0PRBPJ0;\9.Z<)(Of
3EY<fI:U5Q\657a=1]:3_[M/WbE/&N+]VL#P@DcYe/)>1G=&Z6aJ,SZaG[bMXT9R
B:8>LY,cN&B@SbOcES)Y\C#+_CZ?<NT6(5b^:[5+>L)gMKJ1CYVBbN-SXHQ&HDC/
VNVf@#P5d:;.N;>VF7=VG2UDU60>40_fCT8JOB)-cFY?U]-H]aZYb3>5232IbH6.
R&N#9e6Qg:[3;:SV^FD#H/XH0.S6Cg.(U?<?J0Me]P=]eCeDCEI4&QZURZRZT(PJ
3ROc,M)Z1.F)a2RAD#;YRTHZZGOVWFFO=G?5d1I>:X0)0&5S8:)CM^D]JY7D)OIC
MS5T\\21df_P3T8E>0?EOB<2W&T-^6]=VSC;<RPE#T\\Ec97-BP4:428:CY0;,TH
a/91Q1#f(R=_DGDBaKSY3]RVD>0T#T1:XeZHdQGAX;Y7g[<]#PH&-b7_OX,LR[JK
a_>5e=.QVOTWbR<HD=>Pb7HP5(f6X/-;7WQb9e4F=/MW[\WYNa4;BTFYD7?-XIN,
>1ZA+gIS\cS1CP8B0cU#dN\FeNW8,<<.:+DJ?JM?M8HT[RI>X(Y[GR4LDK?V.6V?
^\6\E(1&[N8W0dIFKZ[YeOWRC0f_Z+XcL^;-G:/&VgB:67I7Lg_X)_>e;4X/92-I
,c=,^(/++=N;[E1VA-AN7AM(SJ9S0NB^KGG+;1cMEeQg9;8B]edec@_:PP#QAKYY
888JR@^Yf9U\W>6<4b;F(;)>(O\T4HV,HH8+7W.(TI&_&Z=0AOBAg/4XeKG#Bf/>
ZOcWCT7]5,-VJ7[JM\2]5Wd.V\g?VaLCc)M,YZ]dQ]:_D+7I.P9#e<GI1<VDFZ+\
.3,AH[KT/E/,TBI0BUOO5:2bOAR][31bY/S]1RV,2f<IX]Wg/WX#FK>H@/T<\^=>
f-C<LD1;MU=^;8CW[=-\>0?2.aRWG:dM\6EgT+U@E@)@a-C0#Cf<+]#NLI^aM@WT
EDDe@^Eg1OVNH&T?f=_G\gUSJ6@?^c@2>/3+RL&S]JC?I,>,F[(?2cSC31C#WC_?
X?D/UQWa:4QAMDH;_FCET6S6WWRfPPQ:IVE9U5NHMPW-^)N\MaHP=WaaP<3Q+RLJ
[aZ[[>D]C@>_g,V1IW0Q>+7D[+&C2.@KY0ML+ZFSf1)TWPE+L]d0T^gOW7dZR/^C
f)dbP.a@]I^R0->78R8aHVU>4S6H/Ja.cTCWBG@A)=:;WNJ:ZT(ed3[7f,?PE2^B
5)8V.ZDNda?^PWFc+MYHW7HVe/3BPR(X>:cecI#>#KP=E46.F(0\L.N=W]3B)gDB
FMH)HL0L=bd9AaQ;L2_JN8S0NU;4.5ZOD\9RNH<e-PG@:H?b19[-&=\<=L2b088X
.^AeDe<BPP+g+.0f62L-&FNZWC(23D9(E<-Z-0abV0\I/[=WTf8b(535f1_MH#9g
#^].\TJ7JM:f0(?0=AC=Af06O]aJO?TM@HD+RT(&e,PT8=\0NF\@P_Ae,PA(=a8E
R9Td]Z30f<GWFTV3&.)GB5X.eKQ;6/Z,]W;_XH@G4_&f^@K0Z9)^GTJb8ES:+#AF
QJFU/#gJf,KW=UBf9<977Af:4c16IVTOPMQSEU)2dFf=e7H@fAMF(J.DN1H;M.BO
)ZDdGRHK8_TZU3,\@b-JQd??dX0O2([Hc3a+f)]8Y(a;=C;JSDNXB70O5F]QQN4K
Z28aX>;S2O/a5YH+8JI<&>b/_2GeT@D5bNCCNQ2Of2^EXO4SA[QE?aU_^c-?a:5&
>7a/K;LEADf0(0eG:HMW_R_^gB[JQ(GcPJM3GG=-K&d,E0Y0#Z<J7g:^W)<4<<#^
6g?a5J5N28ZE@LZ6?cCM;55VcaXO(&AMdY7O\PQZX^C8M=>@O4^WN0G8E/G5RCOH
)OD)1;bU5XY?[\)6B^?MfN=,S+QR:)#)dI1>f28Va1DU)RMO-CTRWaUNV<KI.56(
VOG,Qc;BZMWIZ@IKDY^KYE,S2>9c_9JUDNDfT5c&)RWI.VF6UE<8FZ?Qa(INKaQU
1:_UVT:/C3VVaQc4]@K>eBN:SMJ]8::JQ+E1EA:C1&O;bG0-<GY--^Y3)3GD/[O+
;#QTXIXaM(a6RX<PP\K\R6Zd,][gIa\CZBX@AEW;.WBFO,F2e.GQ6LGRI4+f>WGB
O,e1eGWFBf5_8Y[XcCgcFS;9NcAA,+PA\&bXbc&daEN5(#;fSFKAe<?)EJTCOJD(
&PYI(>D@M.fd39F7W4TE.eVLL68/eTg4J->?4&UNBCK267UJUO:e.#a</SdO(2FB
GHX_:_KRU;aFc-)g)0Xg_W&a6Y_66LW9N22cQ;XUIB1EAK=eV?>Y/b.KQ=5=MFJV
W775?dPKReQ^66[(a4M:.a2b_;31E9,bc;+/JW(3^1R#Ub>1VN#1?Zf_OSaRCcS_
Oc-f2:&I78)=)425/3NR-@JM@Z^+14Efc@T](FRXQ+JMVE(_93(2CECbSNUOE(]1
WBTeP_fZZ+[N1=N9bb/Z?Wa5I753H6=8?+7g<#/83Y4T&Q31:6/XBd@EfB^b@#-S
Je&+ET/KB-U2^G(?b7\5)DO>Ja@XK@=fUbOOORA/I?R@DYMO043b?;Q^dLfL=0SH
;0Vg8GB&0Ab#\(>]TCH:RTE=(49]]b59,a7K65[=&0X=SFL36Rf[9,[5A8eR\KC@
_TRaMCSS_DF5cO:@dUI<E&=/S5=.VH3IG<I@\ddH+/J(J#_L5@>_P5IUgH7b41#W
&^^GKH@.Qc#7X4K>66,b&0bbb;Q+=f>ACSIG20,TaHFRXVC5UCaDO[P/X+XD[G.:
W?ZI2OVLI,[Zd6<E1WFE+QP.aFTB7=TIGW__C:5L\DN9U-THbJ=:J9<N-&3+E:CR
P/:=Ka?GR,-8Oa2H<La)J8dZ-,6:.YX<7F_5g;=1(/(\_\;,bc80E3CH8T\>V>G&
O3eRXUAOTRPgIg8Yb\=AW6,c5#M?\,U>76?OGTdE9b\c1B?LPR7USAb2S(K9a2_;
J=X@7a\>O>>WDe4fa<NWQ_F_?gg60Gf0#<<ZW?/#TTB.7\d/4)8O-F-JBb5;O\(I
VI3<6OBQ[,fS<Xb1Qb5@JRfL5df1&B<AG)-CUY(-=U^eRcL-D^aB2/6;<8IIRS^[
0agfV(IQDT+P5[5[QN6W@Id[G::=>T]c_Y;TI9K65G<:SME&./3-6T]Yd<\HJ=QA
<2eKa6;VAF)(@d59^[g+PcZ<21a[,9eY>I9()]eQ5VDX,-+5;.Dd[FV:=bX0ND^&
3fO/HB@ZO>,MZ4V?@[ZON8<K)2^-==C=M/,KeV8b3T+S.Oa#@MHTID&8898a/R+c
e]7?DDfP)(gD-3B++8,g(/D/9E\^]A.8M23=TO&4IY@@6CaNQ_]gJRKJ9XLBO57=
aE,]IBe<[QD5P3;bZOAUYZ&])aN)L<1/@XHa?&[I./YC<VWF)HZ-Hf8UF@B@=^cS
\.\-6;O5/)54T=F=GMPN1[S6CdF=KY]T,5DIHe^d9-?\[<ZW#@G&R#(5FUHf#8#8
,4gccWTRK)<^E]U>UBZ:1--LHaN-b8YZX/=37#=:8V+HX,CR5,0@D.OT7b>L:+-N
]?T0572Bf-gH5_SNJa>c_;8^b/FZDOfgE2c;WNJF8V/B8:UGHfH3A(G:g?,I;BU&
/M+A9LF>.e:O?5]^BYZO:@gQ?VYAUc+Hb3SH.1cQ2dP#B(DLP+76?Ug)D;@Z<P36
1W35;7>U6Pg6@cG4,)N;aEc6[cCCH^R<5N?dN&d?.J]5bVa<H+3YeTOYH5VKB/-S
Qd0SXNJ9=HPVCP)HS?fNT)4V^cS+04?d:7C<(D]X=.;cX-G.GaI^J+YRPGE/NIf_
R9P)@\O,573.W?b2(49VR/A4X9.:912/GJTRFCQN=ETO/M,:)U(b;IS<A[N9#ad0
J@FR0PL:6P[5U[0WbeGH,PQ4#HUT_Gfa[R,FI#]]^BIg95BRbfgSH?EN3_EL487,
e?:(F8Mbf:>35fNUKV#IKe>/_f0d>@_/[6YK:=a>1;&D22=SCU.I7\f1@RW1,XT3
2D)Q5YU_S0F]d5S]RLS)/Q3U81-[4Gf>G5XTUS-H#>E<JG>>Ig-Z>^Z6<TAeVI+=
EQM>>5O5a5RgPZ.-/J]CE)T9(fK>^EG5P4GBf]9T9(3F.&J-8_>VJA,eYKOQ.aT_
VF>U^:JTe8#2D,W-K\fD;O:596HJdA8@YU033V)O&fF:SH=Z])N_PB,E>HT#dg(2
[eg>2)7;ZAT@_8,OQ+J2.M5;J1@[/>Y;c(d.a0)[0_1Y+dQTJA0OXPO(A[H>OFHB
+@MJ..XbM<5Vf(](B4JfBTJ2L0\R)Y)K_UL=5KbQNJ&XCMe-Fa[/C^K5E@(KD5]N
DGBb/QN-SFfVA&=D6I=.Ge^U?f-JL[RFdfL/80B)PJ.gg-=7&U&D,B+TI1NMMB_d
D)P6BbK:7H,/b4+bc#7NRO:@I1FRD(N3.e).:6]>CMOM:Y(<Z.[XC/e90SI,8b,7
]Z9S0@@[S^bET^C9+bT99?A#-;XKZ=B>_Xg8D85Pg<>PH6+I(QJBZ#>V/&<9H)?Z
b?-/A?5bLB&WU#/RM:NUR8(,gY(<E2Yf_#XVK5-dKAV1PG[<M&(6KVN,IA<X,2)Y
3?=^cg9_>YAbJ9,_NeF@1,0R?I_<4(GETe=:C4CgPWS^P]0]JNIa4:e1O&3T&0gC
Y@WFO=:>f\[;#1_\AU+A.3WK0WL<fJB>03K_:G6NC<DLI#CLbOPIJRPS.cJ0EI>B
JfW#J)QeK&PO]HPe(DcI>eEfCc<.YV]X7]3MO@H(\A)^>Y;-+O/U;-?@:[P#093A
/)B4_MX[d1g2g^JY5_cU4c53FXDNARRFE8XC\d0C;+I\D;Wba\#2fMD-&JJKQ&;-
B8AX@Va^X3083,:=.D<>8TSTdXJ-8a2c9R85F@]JQNb03I=M]5Z62d0OG^1Ge)^a
27ZVNH,YbJ[N.8@?MeW#Z-09Ec4<(PSTfcQAY.9+0Q^LI6M3/.;TfR8A[AA[?)-M
;T_(4B6R8\c<]Ag5M:WP,Yc-TM&NB@<R7H?L(3:V]YB6cHKEd&e,BfB=SNK?RS)/
=TYfTUY^96QD<Ae7&768V48MG8.P,E-?SS2>6=^fc@cW/Q3V#;&[W>&Ng;G+&-G7
T2)\M=TBW:QEDNH+73Z8Ub2aGA64:KCE?gU7Td5\]<#CXPaF;XcEW_)L]&,\CJ]1
T]6MQS3He]eLASJCe1,@HWG2/W;?Dg<#UXI/]NZ#VL^gC.f]3(g^KQ?[)5KZXXQE
+:A9[fgL^VPL0]@)aJK0O@I.KD..;<AXKZ\7c9cdPLgGaT@D[O[XZ[F?b]##Y0E?
G>:ZU=^N&;WC7?R<G>(MKW[HODL\@+FFT[2(NS5)dgTFUP423\IRg8+D4&^6:5>X
^#fQ4-/d4]HWRZ:E,7),&GLOd&J_;JBEPGKH#);RE3+Z_2J5=@4-?Tg&16/cO6Q=
L<#afSa+7HOJR7\&c1<KQ_YJ9&c(QKFUQ,HTY4X9P-O8YCXaP_2b<&Fe#?X[]=6I
589Qf[.b2=b0+H1J)/Z:[#8IV1FZ,:b&R9S3/\P]QQ1FC2eP-H3=gXHH?4N.cafb
41AB\\0,+CDZV6;UJP-cZd9@;OMfC93=T?(&GO(/>f;ebZ\5FdE?_<C]>-F@MB?#
CFM^SJ3I0GZ.K5P@8d0,Zf@,R\#B4b_MU\#WR+g=fGD>P]K.GB47&]5&,/C>BI\b
ETI]Y7PXG(HO)70&[]?d7ec5YXDU,8L49&YfKAM]_UB>DZ.&GCJg<#/J:Af:M&.7
8R7LC6[0=U/])WC.d5:8SOAC.([?T_TR+DYQ?CLGWW<=\PTaUTeYG-CU@e[Q3U<A
S<HQc?EGD/H80/:R_<KS.7EY:C0&ONSU6dPcT:PaC]F2<]7C]NO>RD_f)N>3?]1L
)Te?C,Pd5b1>d5\J1eWS#,#9\baPQL82b&XNb/QR8E<X.d)M3Rc[2-d&+?HfCX=4
Xg-^cC#a6_(4J]+L7Z(.bATT+)41_Y<AER.[L0_S0K4e3//;YW,G]98_\:9^KccD
4Q5PZUX(T/HbAFce44T>NGTAW87a1G-9fG8I>Y^QD?WEL/EJ&>S?dPFb+;O>C6>1
V50;0O4)?EfLbV_-/2LK1Uc6)G>@^=:&9N[5NS##Ra_EWA:Vf4&.0;eXTb:Q0D@W
c./c=):_>-+#\@E,JZd?)bPG.(V-/I+2Q7R4SZgV18fT7a-D<+8U3?<Q<4_CC+68
,:\#bK-]F=TZ@U(>;Z?e-,X+;/dA1,RgPG>C^F[]Q_C5\MBZM#D/KBA-<V\HY=NM
0Zef74;/A8BFbJf(;/Ca6/8@,DeeSIAQSC;=/bd4[dBG+HMPO6NP/LPF/;RSS.e#
CbdK>)A-&NXM:=JA]82/_SQS=QWXU;X/YBOR-=+H;8ESOb+KF/[;e&<Y]WQQ32dS
d#gKcOdS.Eg(L\:[.SGZHN9ZMZZLVG-U+\X-\\4>XT@,E/1d7914K]Z(VCL=Y:H-
,M2_XQ^CVD;\JVDP64d[O/1PNcB&0F5#K5@7RV3F)VJ5RK1B<&6?4@8&U.EAJcM&
4CT-61Z,..E-M7CCF#^@8+2UCN22GQR/\V:U6[LK8>UG5FYP#@8=6;)25/4?8=;^
Lg)1ZZ1^_Lf96?Jb>/-CI_8>N20OPH&fb.F+8(-UIVNE=#e:e5_daL;4_/7R1O7Y
?.[-#N1YVTa8f<#>6f[0FALI=&L@V/R;B<4e<(8TU]@\=/.X\WG0[S+UH/BQQTQW
KQAC>3(+:,\&M,D)MW;T=2TW)O^VL4I:TRT&C3]db,[Ue;eZ6.XD._.UQSdSVYa(
(1(CBG-O=(8;4_Y3aB98Y<6400f_[gW]N5c&.KF_ERf62[L;\O1N1M0KC68O.bP^
E\cSJ,:6eb)D]I+W,5+dS,L<=9>b(IFaWE2.<DE^9-3D_WGB_e_ZD\N:cGFL<SP]
[QKg-R#CRCDYgGN32VFG/T^D2Z3IV\3/GPcJ;01)]<4B>]/D>Qbe0JQ4P7QM_+^B
ZN\MWGTfEg]-?NFW7@?dZN)X\@a6RZP8S&8?WW<:<W9\_LW9#gCL_f<BPA\@\<8\
(T?L]be:L)J6/IRe^+aU=EWUCR=XDY@?;)GBES.]045UZ0.\.(&15d4aYI;O.K7e
V&QJA+CNOTYB?TcSY-Me+;U48T;]J3=F;O^[J\cP.6N8-Q^,YcG/C>TAZVe?Nd5X
NILFI6Y\aZ\IY1La+g8(/>ZcP1-.-bc3NS5_Hgc\N;7T6Od<(C+FFJZPGWDM=@N1
CP__U0Rb_SK8(<KXAF3E)P3fKXPQe3K0[]eS-FF9)N@W+R#6LgC3/Aa3Y>\8]@^;
M2_POb<aYccE)3IT06^G;X+RQ3Ya]aW01d(GYACOY7b\LI(?@9OQH&.Q(eSRO4dA
#Y6G0EPUZ/9OWAGeD2bCB[C?&),/;+]WG_TVJ?,OM_7cf[Z.a4K4Z?5RBU;/Y&.F
a8-H<YQL/(dR0Y.0@(]g5a[Tb1WLb?XF@Y],5;)aJbT5a3G:BSVO)DRV\GDGa_.N
]DCR-BXJbOfMU5b949](+NR@?ZKA.Vd^^8S-^@]8<;-Gd]GaQ99H&IWKWYK728#a
R&0/D+G8:W._(-KD&.[>:@/<N#NRJ1&+Wff>WKXUX7O]HKRA8a\Qc&CN:4_S?9T[
4OOJ>RS:L?(:32-TA5e<\f?^=5d]M9@<5F#fK)e>\f>:UR<DT]4;]]e:N&[RCECg
+Sc3#Y-<MaA=^2,5Wd1:UI,34Ja:=E-@eHbDF&Ke]Q/Z(_;c5/4E0Q4Bc)ZHUcDW
6RW/QO20df2MCgEHDFbZMbFPg7;4--b<8U:U0A^4SHKYQJ8QHO)A(Mg[NcEABS@7
(N,-7\,D#X;5VR8VTA/7e9/OGU_C-EZ)4AMCBG)+4;Pe\F\P[N<c^cP0=eXJc8T+
<21fUf@16O(F0+EeQBIY9\+GJQ\1+&Z4A)XYWT[MO(S]_(d0DFgA&^B2fG)eA#&5
gC#(@0YVWPJN7+J,=cf,9YUb7PPXa/#[?8CK4Mc=T3+5=)X=,/^4Z1=[Yg6ZF6=#
@Pb8a[;Q/M+-V\<N2;K&^1.)]W&AER#+.d2?4VN(c@ceG9,3Nf;&9KB9#1JYg6Za
c(JbJ0\&J7GUZ]-R\5^B>8WZ8O^IFT7UZTZdSS\SG[4_@Rc]d:W2Y7KO_2_J?00D
T4RGLe3:2)SU@_dVc/=[=OMC\:[b)HQf6H9)9OP0YB)4fA=(X/Q9O4a(:A>P+\EG
G88);S0-OVXB&IWCV5=b<JR^+2(Pf>A>@&F/P9b@SDM)La?X9@49_Y,aXS75X+W4
J+f@efe&;X&()IWM/Q2V(#WF5QG,74BGLbC0-R(L1D1QSaM>T^,4T_,UW46c]YA;
L-XEM=O_;I)R_d,IQSaH0[+RA7<BcCg.d7Fd/5dO1\]06Lb5g<g8#DC-Y9b,;e8A
d,N+6JG4+T0;>,4e/>KX31=,Wagf005B&P+e<e>/>Q;X3I&KY,aSIJFVEWS^c+Z1
cN4CBAfL8\]6\7WN@7_TODId5I6Nf/@Q:HXJIB5V0I7b[4;E+dIYUZ32A_1U(UGJ
L7+2K5&&Z#d<eeb1c#c3f77g144W-4FOFM(9[12&GOZDD1feT;=X2EUL.;&8X4cD
:+^#Og/I_CCNXcZ,K&,?><.>?e08:e.B-Z/0,B1#fU7[=D#T(L9_0ZQgXI]5bZcK
6D<L6LSPc,1f<b]f8c<ZF:Ra&5\Q&T7/&UN3+:H9cJQ_W60[FP_B1Q]aHa1M8E3+
dQ-J.(HS@c4=0-;)IWIS5ZBH;^b[F,9+0bXK4BbC/KX@&O3-U)K(FQ)P\4OC/R;8
eBXU\e-T:4NgO&ZO>P&fD+]KV0;U]N;<fSDcWd[@+f1CdH(2Ne?cdA-Hb_/;WL0E
E_RgZg-b(DGAEU7[X,^@3SYX\U;6.?Sg/M54(TOBU0_c?/[?D@T^F/3gU;NRNLZd
JKJ#:@OZ,c@5+b:5+4J9.D3T[-/(]ZCJX^#67bM:7FO6W4EWe[4GE-A.#E5?JUBe
Z@/C#]2cUNZ7L(g[H+dHc45MX].O6T?47Z##WGF/35faQSC7>:#0\c,1V7^5WB3J
EY0()(6VS9K,#WI7I4gL9I9g^(K.W[=^]e9D60B,E9UKQ36bUR+L.2@:GUU#Df4a
,;eaY]T7G,gg.3=EDI+.LRR^#)ba79[6A8+P.LVa]#-JR1\9\+AA)A_8/gZV7?Eb
SRT;TH#Z#7U5Jc5FY7(\@8GK:V8.4-J[CIQ@L1>0X#3T@]O6J.GOdgS4\0_L(JfY
:fR[,68?d]?5YAdWA5F]IKY,\<V/fE-A1eQ<e0dFCO40BK5ZDf&FSBQL.(\27#N4
65/3gM-6:F)gG8=K@5LDeUPNb?N,ZFL3UH1\-40C=FMVUDTbT1@6-#W)@.,_.5S6
+1G5,PA8a/#7)LWeB1+7;,]U4KCX=Q8bdS.)<[TK&VT^XX6+AI#>BdA_IR@#QQf-
&?)/5TR/)3DH1YGbIVTb-<,:5Wc^<E?/YeJ/Z/?Va_FIK7.IM0SDN>?db2:G\e01
SHD#C#2\]ABRfa-J+0U34[9<LY&.G[F=[N&b8#U=&EfMAG74fT83I7=2C8KFDCI^
C_/cY3,aZ(H2>U,OUX]eKDOR&de<\WHS86IS]X0R?W(6-dAfc>Jb(a8cV1XR&HP&
\T6N>097PSV0Na.HAM&6:?FcM13N7aa7&3K:VfSfK;LY#OIW>ae?e7]D()<4&BO[
KTXDd=Oe.:fG8RGO@3<H@7;5@1CS++c=-;g4HWg0EL;,]MdSV6aa(GL^>Kd#DQNG
Xf>T-(\BS26JbA.QY#0X./a7EQ8U4>_ZXX-5M?Y^7O[M?TM3E^a#GI4IWg,>_I9U
(a/cCP]=[dA=/LN\\Df9QR&8T18<-TDW2R(P:)<4,Z0]&6W]d\I79Y,3;<3(;X-M
4+1a=9d/5H--dM9I++IgDeY@^Qda&S3+a>FQ>IAGGA4[\cF38T3JOM1IbcKIFKc\
ZgcgR,-T8.3[)FW+dO>,Y2?W+b/1dVLXQT(HNc@>Z]cd]TO-P#W<)(VcBJ#U7,J7
Of5Qc-IPH3gX^9MJ-=RWUSSW,0,+73?J/-AQSTCRVD/^=_OX?eK48PT5Gg6aU?B=
17Lf9X/RNgAL(e/>GZ5b1C,(44Dc1;UGOU3)g^cAW/4-R/-R>84O1L;I>1fb#Be\
A]g^[adYIe@+;C_Q,.H:<(7(60?Q.X/FSGCA.fcC(]?Uc6[912XFODgY5=:bYOMS
33D-c4Xdba4<fQb9;5B5JVW\\K+&F8ReaAIG^5BE8FCI+NUSV:D2YN\J1-P18,^A
\gCg8Z+0Y3OB:SRXD36R6Tf=eZFdZ#K=#WQ)88G\1gOe\_PcTbTB\&+0,C\&B118
?V+>J/((M>^<b[-H-W+L3HV[X&^K;(V_deYV79>N4G3HQ#4,5P;b8\5C8\QICe[/
SG?Q&S0=D_7VeFZ0g&]Fc;D;P808FeEDEad37S/[BS\C-]fRNR()efW,EOZMCS]P
4V0M#(ScHEJfLgFUgfB+dY#@9(0NBPL0NK1baLZ6KT8Ad7LO>V8DD&=@8<2+Q\M]
/;=P:P<V1ecUCG&,7S^>1/=TDMPG+gOZLY5&N9;:CDU19891;3W]:#7aE+:;O58S
_<>fdabGXJWA1McBUJZ+:,UEH[.+52FRY+AYZ>a-P9B)DIE_;/>B.P3-[6CeV9@8
BRP^G@H40:L3MIENI6/b[g+,1a+31gc(DAK[dK])IKM5-,-cIY8M0).-8&AP+EZg
QQc_Q3[cXc<,)V@+Me1)#,&_<4QPV7/R(#.O.Q(G+^CD/W_JNb,ZF)?;cF95DZXX
==:0D&0B=4[Kfc3RL)O7E50E[]1>c=E+gYK#K:&PHR;V=Ta5g43S]CNI3HCP/NgX
?+3_.IR_\6FgC,[1JAW;OJ-4IOW(ZR9R#Gad62.56Ae47YIS\f])[AD+@\X_8I_P
-3D+c\L;D:^c^\W)0YG-BATG;JX)[cJC8]dI=KgJ(RM0\<1:NRd,aSC>=VC8Gf,Y
;WA&]^dJd3N<]^<\9RVUF3.;&0JV#8aQBR0]L?@B(5]=0_UCAX>,(UCOYbY9\(J^
VWC/?^4<#F(HHZ#T;4,Y@TX[c5CDU\Q>I_,&/3cH_+YF,W1=6d0&T)cG-?,a2;P]
Re^D5701<6^da2/U]Zd@6OF0?3YIK(/QQ=@JbD_V&#8LGD/G1<7;W903PO),]>_Q
G.J2)Q;-LO_SMO;[Ua:6eAZQ10bZWY91a.6RSS^O[B2Zc\e]NTL[__a4GEg,#a]3
^YOA)=9VOA/UVa\+[7JVLOTP3:\g(X_B9aB7.TcSF6O(X1<<feU15AE>-#9eHA=C
f-Z>XBA;J;cY.fLa:f;K0X6:\MLRKFUF^W)3K(]OAdTOA]RT6.W+.0GI/cZHPFAO
e9::gJffR^U9-8P9&^b2-QTZ]JHU)=J58=]5UaAE9&;E(J92)37Y+UA51gLV\.c/
92C:9YPf_#6YTNSM+Qd3V\<dNR,8HNd3/#Ud:bE[0a\V9R@;2HW6+<U_OY-K54:M
6a:2NWc&B23e8;2-33DV:BO_A:0ILgd8-Fbd>MDg?Q0V:d^)F8Q>RMVYaW].<#8K
>?7@SJ4XT+\Ja<1b41_)8:;,6JBe#2O^#H@AZEB-LYNggU@L4WY[6HEHS;8:QW/:
^OM7[)B5e/?>0NI#;>E3B],_70;G2,,3>N(XHY22^)=\(FgEacXfK&Za;T?55?f^
Z_@9Ie>3Q#a\Z_7?NU[)SMA7d3Fe+BNJ.g2&3&+01PWd]B4I7D]4-?C(@5EHZD8@
K<?<]2=P,P]UHU,M8b>R>L0Wcc/HCM+15<>+?43&3<DU7AM8==X9HP_JAJI=aUM:
_\:+C.&C=U08)Aa<;5LOb]c(Yd.BWLFMS.+7BO^WROXU@dLLH>GIL1d>2?a;O^e8
Ke&-A62]F)Ig63=Jb/D?gIa_W0@cTJ.8@Rc/fdPgK,eN8baDWTF/?&V#;:/R-P.F
&X3=b6Tc2]WDcQZIG[64TdCKD,&a&9951O\aIT:L]HKUKA&KCJ>b)O:,0/N=+5_5
OZd(c(8D/[EBY?^HWOXYQ=BU\W+@-NU]ST9J)L@?6RTC&>=(0KO5(@J^Ne.,],<Y
QAd&?ANVT@[b7:1/1:aD]FKCeNWG;SZ\6H2K7NCC)]]Y5ICOW:44c,T^CHJVDII)
T>)4Q>\,M3:=:g\[30ZdP7YL=#)TT;dCUd:e;?f&></@(O#O0D8RKG5>L@&T81X\
dYHROdd1TF93&Q/c4;XX?bZ\:;g4e;LJMA\I\c2(^<][UT2LG+cccNR#P;g=>6C.
SXWb+]J2^W64L??)PHNU1K/#gD?4ETY-G8M+>+3b^&5++(_=CXd@DVNMBHOf:\f]
HT=4>&:DR17BV/fSE\[:@UZb^:AW&#].<b]K.d9U/GM\e2bV,aU_b2HES3#0,caV
b^:[]?VT]N6.&.F1FcB6E7369UPK;T(-M6E2SUBE#;94&-ANe.10c]K\T,6X2Wb?
B<A<<aW[6e5gNOg]G.5SM?P>.C2A_9&N(XD<]Z]A4cY<0XJ]eUdJWH@ca=E@)Wdg
NbagXINVBJ4GW=e\S-[QC5,<Z#J8[3,1?VRJ]gA//519-<Od.,#)1>/&SS7F^;Y3
S3ZTa(K-Xc)bbfB@g5Y\BWB5_V53(\G>,?B:bT?W76U..(M[2/PgP\aSeA[W(?d&
TGYBeY>UVSY3&RUSZU67H;C,.T#I^g-C0Y/>(8=Ag8GJ)SG73Ng_1)NG;g6/[J]-
-.Bee,BY#[RPEG<>,&PKCTW7d](LE/bZPS>1I@Y;4[J<DV.C3-[@C\OcG6e^6TSc
(Y=EPLaQXHASbaNRE@bT]dgMP7T,Qa[+e7&MG,G1)ZgPTKBYRd/TNJ8CG()QZ6XZ
&9CYf;PLQY=cU03Oe))]S-G[DNXK\Dg9feVS0K2Tb,=V?,Me3<H/B\Ge;QIdY[Id
7YEg.4.]/X-E/Sb3>7<LDJ5(/SS_^S/]RLd\QL;aQK8/NRK<WYFB:4L&a8/0P>R;
?@K-K3#G3-g9C#1;g6CB?S(_O>C01cUO#\3H.:]N69S;S6@/1?V#@f)6a3Ea\=J/
N[?ReaSS4RbD<KQ[00P[^3,=//>bLGJ0+R7S2&4RM9Z1=:5-e5b)6-YaA2]gC?7[
E2g8AK#8=J[gg<KdZ35&eNS4:OG]03.K]N_34L0<NQ5,@HT;68NS,2\BAaZ@#(?g
Q4O^)FO0<BFFK1^2/L^D,PJ=aDQ5YNCdUDX@;:?,3-[OAT;9F/L-:9#,0JP+D&2c
]EgSEF^:ITDWE7fSO\TP&83AccAc1FZEM:&Y0=#/2I,VE-P[JfC=B10ANa8f<Xf0
)dg3DT&DWZA^MABR:a\QEGGKB;CK.C3M4^X:9\df6?_X4<KI+)_a^7?@=)A9CO.7
Y3QO36=2CBfX7cK)49)@RbPcB_>dfbX8b)LR9Pb=GW/D-dBY8]U#V<WY4QDAOS-:
,O\G0>38K,6(SHOf_YdRA)[f,K>P??1I#.W_bXVJKN,/age@N4H/AKV4,PEKeI\<
:dfSBW(PfF+)cB[50T#]FWXN0>5S\7PTK5-g((HL8WGV>4I[S8[(ALWGZ5X]2V<P
7&:FK2VN7Z7Ea3V0VP1=.f9WT3E3^DWHg6^gJW9#Y]=7f\AMLQ[,8]M\bgK[FYe>
1D0dFPa5,AVLIS>RFR#F56E)7NOVP,#TIYbGaV7@[5D2,9fZ&:?W:#DdB^a2FPc>
^ZKX^]<,5&7V5MO8&DP)]2Ha^U&/VIWM,Z7L@<P+\_5RFX_fWa?1Cb;cf9(,Z<Z9
QO[_d]c8C#^(<.>G)CeEI4QbD&MOIB/YI.,.XIPMU85@6+WBbO8Vbd60@N3N1RER
W>Nf6M6@_bIOC60/WNgKW0HdLa_0ZMO/XY;9N#a&BZ)cE75QfMNIO#a6<N>b=<IS
@7JX(<<@@R[ET89<4:3Q3U/YL^6O4c\?UPL,Q4;d=4R9=G9V^IJ#[W2K:<O8>:b]
:+P:?eV/5WSXZ]9Ff5SP[QEbM()U-)?d5L6P5gN_C9^5WUFfC_.PZQ5D9>YN;S9f
H+.O1?2-;3J)=@-@Q0d][5P3b-&7]E.2[UDOOYLD1Z,fNK)AH5SYR/[L7(_3#[b;
H/7B-[a;+^dLea^e<e8PKSJYO5gE6X3Q_&1^[T99@(ORC22++HaJQ?M)IJ9TBMAD
FMHKG1f@(6fSA#Ac&_#V>\Y9B3IIR8dMfBDab8D+=0&G2</HN<W_>BP3[TVJ5AVL
[+a/3^Jc\/@/]:SNNM8#_SSG5bb39e(I^bVf9HJ\.1H6U#</Y[Xg)Fg>RROO-2X7
4?gNP73EG>6DV0<7(6baZ5B7Of#SV<?@?Saa-L1D<=4(&]cPD==,C>\YLbT/()=P
#+.^H#H)+Y+#fX_BXG^b3MIM9_-R\;U:[,A,M,L901]Q]UD\P8Hf^=SdM6+UFXQ=
CEY6>AXST;P^#XS9=2[DDA:OfY=d..)UO9<:]EX..c;+M7+[gTZE:=AF.Q+WOXH5
_JCN-21g/(<&_Z=,T1b^5W5T)SFN4d\>?/fV498U?X+Rc+bVD^3?.V+F:c##T52S
ZO(a^[W34W8FQ=W?X49+/HdEA(+@Z.&eJ8VPQ(Z#]7]M7YaI\LHN>Z4E[Z7??5Wf
412P&LaJCTX7\@BV9P7);[=a:L=8,9>34M+MT14)5_]Vb3.eSX^#3:/I:/XMNZZ7
5EJgeM\A0ZS_93/Z[5d;&LUJ2(-^2ND+ER4N6CYW./WI00?H.C6]Nd-6T9Z&99U.
WJRHDKY=LIBB.QOPM-c(2?;?W2PIX+:_d0F6Y8&5-M:_Y;)_:W8cT8#Lf_E572f;
]7^#=G_34L=B&0g(B+S=\aOe0M6X5I\9-35c6gE,UH0Vd\4CQ3UFcYS1=Y3b<1SD
Q6?=DK<=A,2LD>@PCc8O+HX.]T]>@,J:@53(F3+O\U/PM^.0PMAY/<>L?]HA7V0\
:.#/8a3&OW;6dIAY.R7-KY9_Y;3eERaHR@c[S@]>NF)PG+EF&E(F([2(e8/<K2Zg
E^VTbG=FY2DP(6K2BX[f)Q24<(TAQ#:A(g^+8A;73d9C2D<RB??R.H>5>&a[M<)Y
6O:#W-KRcWOX,aUED6]4]05XYXgT>aVe9-U4]IQABeFb44^HEgdS02FKT5I0UJa)
d#Ca3-@LgD]E_QeWfb7NC01.&SHAWAV1V/6Zc]2J-N5JbVJ,NeYQC1Z?/Mc_?JCR
P1cC>CD4gEH\HKPW)96PO7(<\SHRdU@^6&dL<COD&@6UK#JeL#>aAcXgM8TPI;.C
JHI#=f]e^:@Nb[-Jd&XXUC0&U]bNf?P\1>[M)E:_+3<9cK7Ze9S-K#/2LSP6;9L_
X9^3X-3/ffM9fbJ&AV:Z0]ggS&+T/]GYDcfeAS\=Z)PC_3E5+bXe>[;;?RgTHBMQ
5U?H5K9D>A89\>B+8Of^_RBd)62Ha&f,D,SN>^=PS0+]E77&]QFfa4&==NI9cOV0
)/73T2S[74I.D:2XQ])/GPU@?1,Fc-71[Nb-\&TaODeg7OM#TX>L?:@S3#eVH,R+
cI?A=TH]+dXN6;U_#=T-H\)P^bM793L:f-6fHK]^[C4YLAN5b:QJb-QO3TKDY(f;
-T[K/>LVe<+PVX+5CQ>UUM+DDPZV2WcA^2RVQE=87M.8=7=K;JV)g0[ZB\I,GIWO
0_\P2P0VbE1.F0EEQ:SO6=&G64)SY]JXA^H>AaZ<K\(V+I]NL1=01RB2<6b7NgF8
2CSb^AMZPHM4a17E^GP1-Y423NDTE18bZf-5S)g@dfTb]3bQP5_?,^AL?N2Hf8?g
<-9cOV>C?5f0]5Q9R1&Y:Q:WXSOG<U4dD^P=MES8&]Qg\L/]3C1;dR^RY^VC)WQc
,[4;ULUaYF7XX<3PJ;VDA8_#AbC39L6CQO1G>XQ[J#Fe8LW&)3BW:AIfERA.Z&EL
caLN?TBW<-Se50I]8Y-2RB<V1@:2aScP&d[H.>:]^_DGg-_a9AD??<7EA<0VU6:O
4H-7;eIQ=G)TX1#P8B^K(<-][(D?N#_\U2H94NJdaC?BD/XEI_]^SB=cfL19=>[S
8Vd18PVL3MLE3+KfU,-E_c]HdKLf]SZ:GR=?e:]->\YSNT-9V5K2^Z?YMCD<G9.-
d1]+<)/WN=:JVT9B5C)GdPM:Q#(bR_-KC3[_ZJU:L\;C.1Uc-cM?T3MC[9)f1<:\
?QD,#P?+Q1b?g(IKOG<)6<fW?(-W:ABLKA[,;3&U>_QZWSO0;H-6+c13,LS(U2])
<aT:aP(TU0ga,XE+^Z^J=WISAb)N:J0AB[fI01MG9LeDb)WXg9#7-OK-fC9<Dc?G
2K?KU<gNZ:N++F,PX)e1L-Q:1T,W/80_2E3bW+12[U]8>eU(=;e3XV;S;_Me@QW:
7+96ZUFKMQ>CU^>^5JK([C=\+D#:<(MI5a4)Ag@2K.)Da;-geE7Y=#^[8?50756]
-SRLN4(NeGBEX-^aDVC_ZF5F6@T#HSKZVL9B)O3?]21Y[[WLMHgL#LSUBf2USVC7
Fb<a(D6eMcQ/#8N2.d>B[G,B;C:9+:,85)[;/LH5/F&fRG-d?W@(:/BL5[>UZTaM
gL[N9b6^,;_4+R&/._[Yf4Vdd>W6X&K/dfS]2XJE[CU(S@2@=WdF(X5=4Q9GE;.0
R<I_.BCedS#B,E&d3U4#_=9X(=ZV\.bZ+ee5bc^KXWb7/>8-@?>fS&Z@a4EAE(R^
Qa:B38eB4:60aRf)14c5Y,CB@YMI1eN@]HKVd,\CB17)aQNN7LAd[BXWH#H(<PC=
WVKE.0J]E^5ZK.^Pe/0aCV])fL>(3[Jf&OF,JZD)JSV\/<EHW15,1-@Q92=PN(V=
)c>L-4Lc@UHDO^-BO>IC-::e.&b:CS77L,2+WCJ]GX.8-)@aeIgH-DV<.93P7MV:
JVVP1>4<S,/OW.=2\c+-2MM:2WPUQRI?LQ?KKDfH+FI>UCg]SY:XHU^>T=UFc/TM
FgV)3Y_^G5BMdH3B#F==7U/GG;LYYVBO6TS<.?WPK_;eEG#[=QPc8\?6B[]CMR4e
+_N2RdD#?=L9GI#GDVCN(GETX.8[D/2d+M/,C3XHe:;<V?D1<9@QG+3UQH]e3cBQ
]c<2>=K[)PB9dZ\>0M\d;ZJ[+W>a_6PZB]KKWYD#7]<g^5Z[[I4XXUa\_+@3Y:.3
W;D5GgJ=9V4>PIWIJdD??W,g_K;_#,g8dbfL(.C\.#DK0Q)@\a0#X[bEV>@gW/7<
0=,g/>F6[EMWb._F5/RU9)]afW-BD=NL?E(Z22d\Kf@_L\Q919D>18.]d6BE(VK-
065g^Y<NbV9C\<&DS50;4CEE#JO>:a_U6B6J2_ZcIegN81D=&=NH_=&A?;X_F12/
6fIc:bSPFc3,+SC=Q[f6g:QdPgHM28;2&F7fCS,>_I];S#]=?MWdH^5/Ee<E2-3C
S_TKeEUAFHL)cad(>D9E?\TB\V[RG=FS)4/U[S>3,/;K+De1[cdQ6KE]D;-#[ZI@
P[a782M1Ce3Y/6.d6L(7>Vg?dWX8P&D(=\DB1^6CEN3ZNLKXKI_#@-):@R4&#7MP
16P,?b)N;8T?1L.IQV4S71c[#=3fGLK5(D[,;RUO>7)Zbd#b(d<Q#W)-8@B9AgCQ
)8bEV(\>L8Xg]&]See-.BK@+YFXTED6&4eE.?D7\#AbB<.Wb[-I7.R^]1&f>SBL8
:XUbQH1PW)1bS8a+0[;3KLW0X@O\<T?Aa#+fSUUSeJW\AL([64(6Y<VOI?-VZ=+4
/Wfb2C9X4cg#6Q^34VVMf+-\\H,52Y,NC]6^Q/-I29DbG>C+GDZT>0(EM+=9c/K8
Me<):&egV8d\NR\NAOe>S)FI9\aKbfGgU[]Ad?D#@2A7LZ)Q&3@;R]3UZ)8DIECZ
\MWJG#L^FYID8d#YC4g&/-/Y=[VUVa/B+K02K(e(RDE[_([89CdYgMHKaRP]#ObA
HS2VJb3;VUGg^LcIGOS3Z^I0^VF.R:eK<VQ97)SG/#8DR^S.a;CKf=-eVO68]4Db
#>\NGZB?96cOg@_eN#RM^AGC)\AR@SC<O,<&X1Bcc^_H:TU4Af?d5V+cKTD8[^^e
-X^U5e0I92c7)9G.\RW\(4+IK7J=05dO0DUPJHS3aYeCY2F)#C35;U@:65eDcFPV
Odc/#3^OM+H)gW=/P<N8I<6THRPR2;H6/?g33-LL]S04UW#V.[W1adSeM<_8E8/]
[W#gUT-@0.^9GD];+S_.N#-C1.<YVHY]GO,4D,4L1aVPU/PZ/Mb,(gd#C9FUDcII
+7d2&GWL-F106Ve2YKb9_2;:J<QQU@?3+b]?;d#bbQFOP_O3=J8L&e#QS5^L1EF=
(,H(R5XP??J2#GT[QXcTK=ANZcR-B^K3[UN=8f+7GcHQ@b@WYWf9(<;)U19ZOCU\
@[FecMBNFI>]/^V?c\Gc#]8/dNDV^D+8g,WE/I+K\EY3I<73UNb]>@REB_\?>;eM
VDBM6b[dQK.FH<,Q5[SY,QIGW],dII8K,4I3KL@YHWS(JgDaR?GLW.JI2e\PaH?(
,:e3_#gJWR,CC-]Yc<7QeH@gS4OEDG\3.9&5EEX0f61bXSKMb?\-,>Se;&3YM-_6
6=bB/+?,=/A\]\RbVSDUR>Q#K:7A5PZ;>Y=F18a:YXY]feW9a8IR?JQZV(g:UPMP
W#1LI)8:E)D_a[\JT5A?CdbG(\L\TBHMAW)HZL&&&A2NSPZ?fY>@<&IY5gPVPN&M
[&M9G+@<6MVPf50F6fDZK[f/-9MOOLG,T0SI.=D6^Hf09g@+F1VUH@bad_S.IG@\
;.T5Mf)I>WOQS6f#FUE1@@c6H)1;f4AY;(@/E)b5aP4I1>JRbM)<Y(eU3TJEB.f=
=(&/7NT_EV-cV,8V@CD81Q8;_F_MTL@QGBV#CB7?.C8_C7CaI11P[O5;1b)&&3EY
IX@=VAe^IcX/&9)(bZP_AcY9327,;gE&QX>dJD[\Y=RO@I.2R4O:;X=UC]#W8AC<
BRE3HHIO5fARgTGL.PL,##PDUH7,V(_1.LF+eDA<4^_UcPXWQO7>-Nc&JQJ2K2E:
_SQd80-V<6#NAedK;2).Z^:=C8R&B<]UB\RQ59BPL&.X0Yb),a/R6ZTFT+VZ\YB)
YQ\)f-D4f&\ZI,^1@T3C:JOQ.3-3,KPeJaMP++Q?]MZVFST]:@Cd1b]+\\N:YSZR
R^5<&SQZZGUIND3#cXO?(<fg<SfPHA)6E,;;4fOd><AP[S?(@6#EL4M&g+>T-T.,
9LM6#)?[B2]-U@:47WY&(P44=H#8<MUWaC0T]8]=f,IZ(RbPR1+?ZE504/+U=P+O
8@1I.\3>B-=4^b.?ag@<0.\_.G7gQMdB\cQG_)4fXM<11=82\@LDTO-B[LBD8@eK
>D@JUG9#)@N+N7-WDQN>^CIM&2QX(ALW/b_(G/WJdD>RF:.0>g<Q@&=CP<D>B&eD
V-GBO::G>.LaC2+ReID[IWQb)M+O?Za>R,e<9>OS#M(.5DY)WA;_YIN9QZ4;S#2N
8U3U2gL1N1d2Qb854eXOX_SU2=&&6bb1Z+QUW3Ja,ME=/g<B4S4c3gJD#F+\]OXN
#=N@Z3fT]^E?9E6Je>E^3Jc-c>&S.4&Z^FM#fMC<+MUROE7Ib@>e:DLP=@LXI95f
W+)(#[1:]/Q3(<5+&cNO,:bX+&];fX_PIGdQd[TRC\H]8@Hf&YJ;_E\>:\eTJebf
#A(8ER18I)>2;#7LQ0gU4AeHeU6AN5M&+_<_f=?cX:&9NHVVA4L<6WfOWC3-0JNb
ZYePULW-5SCMcBOD-;U^#8X?J0Q9dN>>C<^4^D,:._?bA8#bZA&L+-.5-Ob#)U-E
KLg9ASeCG2Uf(C7;:]f.UT6J(WVdB_T2K\d]3<Y).IHK-N_T4]H<[=ZH?g78g7A7
8]f\+&Se/XB#Ad(Y,VRPaZ13e@\7a3KY:+Ab[&#..RKK7/SD.IT#5;8ZX)ZG#g5#
YRE=-(Ng#4G^+>4ES4EU0O2f.NKZA8U3SK5EE]@_bI?O-eX8@F:9cB4TFc.5.MgI
T_2N]dP#D#_=0/?:;<G^c^#Y?FD2O>eY(Eg?;c=VE[[:ce^]T8b)cW7aZd=?7YeK
G0cI@TZS/M0W/?R4[U.TFdT/[\eA?_<dFd9FQ<(0.W8=EM[GB35MTUKF3IbGT/L7
?9f:IOa9Hf]==Y3c.ED2dXGU(^]_8B7M@3F@2Z5?PBH.Xb7b<X#R.RG3B0?]QLOG
F1>b=&V\aJ[\V]6:\C\bI)I8DG78_OE@gS,:KGUd0C8<MZbg@7M<g)6W]T,daMTg
N>@+&B\MgFf6]<1_R)e#S3R18/gWA@H#BcKZSbY/G<]#H)^a?bL#gGKfCX4I)fHb
A=KVb8>2R1LcKK)b_d[f(2<cOYb04\R29&fC27VZ&dDE4<KAC?Q;>(]DQRY-HbWQ
,XPZIY9ZR(U_[[g/OZc?G<A1Rf(V1^BKED=2G;PcP>T1(B2Z?2G;?;GR?#>FU)E^
>g1f8>60[dTb-S]^;056,N7?OXS@3bIdUV3&6Q:XU[If61P&(EN&e)5RO9Qf]CW>
Zb+g:aP6QC\FfcUT2Hg:O(RP74O:aaT68PGZ;]QgYESegT<XFJ69LN&=3=?=f7W;
:@_T.<:D([DYKCA]2R.;L.4Hf+HM=3Z&g(43/Y3B(6+131Jg<]a#UB>,J8KCaFVW
G_P?5&H7f\gKXSg-Q?#_2gf=_cU98O/M;/GZQUUQE5dXH(K1PCS.b&Q\^+,#)HHe
NMVJF,G@7V(VY,LZXS/5cg+CDZ.Z>.PHgT-4:(,7&bNdYI@?ZYZ@WK11&K\5J^]4
,AEORX;V5E1Z[@aeL75+I0Q/\NAOOGM5?T\&-P=_H>9U2?-c.dN#?IZ9L6V)S^c7
8+(MYZ+N5#gV1IV?[84#FFZ?Oc1_g)5_W:5A=b,803Q+@-bK[+J546V^;c+g/c=e
/&+LSJ5>Re9L[;;R7E,)Xb9V5&>:^Ue;0^R+6KCLOFF_9OVT)KOBW[]KQ0[D3N+8
CNM,-Ze>;A]Dd<e4<#I;#,C\<Hd6^<,;EDcQ[64(&5MG@B>^2MP3;7N7gbG2\.-?
UGXIGWgGJI48T;<dg[S5c/BgL[PbPIGDJ46K__^:SEbK<UYgbEY9=Oe#L9XXQ-Ga
V0Z^3EY/6H_SF6g?[e/=Z=XYJ11&993>fGIY/:,E.P=)ac0+@TBC@EL[CB1;63@(
OKVJ##94G,#ZERZ)&FA(g]<Qa+&X@\a)RLUWgP6M:6LGIU7=cB)g11F6L,UJ&>LK
L7]WB9X=#X2V;XE]=&]RSQJbBg;T)GOOLO#AeEED8\76]91e[KDIFK=2(^R-Z-YY
](82U;<+)KGCU6<V&#(=FR>Y3GZ;MIa4DH.?QU_0AS]@G+(_=d[;1.NW[\1dT/g3
GO/V5FWaYXWIPbZ([)9ENA[[[^.SD=3a(@G,-caJP7af_<F&b#T6\#^Vb511_?Se
4/B6X?^G[ER:f#/^e/_Y]4QdQV3)Y#6WC009B97:)e;ZD93/YDObX9Z96.>QWfYZ
]-ZG._:5S6b0N[<91KALZK,aLQf6HS6=dV07)gZ)O81_-_9.5-;4g\92_>Gb.@48
b+9S>,U0a2\P+gA.FGK/c_Ng)>I&5J\A8>=:U8MTMLSVdW_#W85?dcAP(8a(W@F]
Z##I=8<YVD/Q5<9/df.g,5CPfZ-F@R1gf)gI&S_)F4NM<5R-(cUF^(&_gJd38)I8
(53B\.P>.a:7RNgW&,HJ^g_-M19d1KSP6I;1HAcKUKX1AN391ASX)GQA<K^?e5?a
@4G=BT_N)]6D,:J2T1_-&]V\U57Y4JS3S)TK/g0>N:/fX]HafY+V?R_2(])WJH]Z
MPBNF95+gI#/CKcAUE4>,1&_UXZ7VN8@[ZK?H5N\_@((8-0SfNBZ(H1/7S19]P_0
=S3:/O1/OZB2[dbbNcU9XZ>&VGW0TEeU(?UTBN1&(e?UAUfcM;[#[Fc&(I&PWXEK
8Zc2F<J&gCC]F[J7+_H.2,_\@#R7ZOJ9@F/C2?1Rd8W)5;(Mg(=U>L6Y)5.fS/T0
A)0]Mf6^WB&eGJSFCAN1U-YDX>W0b]47QO<1:\e8.#ZII0N2Q[D_(:XQL2RB<),f
#)DeFT=-92VVEW#>L>S4P0?(I<1]]L.MJe\C5SBdbFY&-/U_I>>BCIN&2]#X;C-@
X/13\^Z11[&]OE(WKV,4@;4bP7>7fc<F=],d(K@Ec>:Hc/f+\_NVQD8fgA]2C1C>
D]W7U;G3fGcccNAZ3@1=&bFadgW\fJM))-2IZV9-W:,D?(S0:M8A4J]e5DX[B)G8
)S>Q1UVIcX2c+\<&(T,3]FQ>@/[CDeTF<R)_8#QVa=#(IYIRES>64Q?-7/\gcfI4
b?_==eQJ&AacV8,b@fUS(^LFWJR6],bR<cg.9<>G/PS>+AcGM4,=4d@2C5R?AJ&<
8(FL=Z\1[F5W&N]_5c:(12,1LGc>6eBF#>?GA3)/#gC\I1K6bX;+8=c0TeJ]?Ja#
EA,KP^.T]0J_+7Y?A3cT<Y)/<ME/,VVA:=MCE#[H\)GT+J<FLO>_7U<aAX2BdY,C
3dEQ>F7MN2MZ[=/@9N04Pcf+QBaO,g7T4MY(+R_c&Rg8(V1YX>L>DNTNb76BT(X>
0L,FCJS[De(.a+<4+F[\=),76XBU/Ac87_bK<_896Q1?OZ4P(8OQQY5#\?O2I[.I
[3?:]e_])3C>8;F75a>7M/gG+8K+5VRU6W1/[fE;,]E:(VL=H4@KNFT_P?F\.D4A
F0Dc=[aJRQfO@=;4+\=#M]RVeN21E>HWI64+D[B59:7YO\3G;+>N5&=AeR\]78US
A8Q368abH(--FY97B?2:d?)Z8]ZL4I:EW34T,=f_cBPQ.]\)1B]XJ:L^8-9-SO=@
@^CL8;b5O26\->S9]KR(bN=@&+(FFT&40I7;,]<H])NQEa;9d0b:I?Mfg>BW/93E
^WA_H;(>#>_3<_@]dWb(<\M<QGB<RG-D5d?d2+YV[RgeAM(6V2+D\L)VH+T?;RS1
GWDUR.c.PI.1=-#7&.a5>[NH1>ECbC496?18O[S+BNDD0cA.<TI)-VfEN(UZHXf.
]8;K9LcdDM@V@IE&SOE2.#X=\8A@6cV-_O^:cc#O@bCL7[V0USOeDe,0f1>f^eEI
#9+?#0WPDQCFXKV08YN-3E#8^DG2#KS^eIea2X=OV<O/:/@O.#GPW->_4+(R-XD,
N+:.Z_>9a@eI5K9;=c[5ad7BJXe,Me0@c9e#S0+).3#-_L?2J10&-S>/)L;,R?6]
.8P,-<&U5gLB-^CA^0IB04R:8+c\ePT+QV=(X,I[PdZ,^\.C=b2b_&]3@RI\B1)P
04H7,Pd8):F.\OS@U>K2HF:cXK0@>GJ&=EI8;XJUF10.[(\&_&FPH)[/Ze_E+09U
Cb78+)ZC-I7#1E6d\PKS>.NJcM2R\^fJXC@FA2SCZa5,=V83C+@RfF9Q)(NNV]N\
GEGP2bTVgY_ZJKeL7C+NcN?ZbWgC6YfMXD2?5A>K+P28DQ/^C;=&O.7;\N2L8>A#
DeV,[UN[\&d.FU2^I5HTX>\YICaD.O9X/&0c@&VBdV/.>a;G4QSE8BZ=Xbb5GNH(
g^CE^KS@V9DG]D^STIQ^)7g/:AX2:4LaI@6<W;S5[A/;DG=:[V6Y&,2+KP[LV:FU
R:X^Eac98dE/[[,;dY88<NMN4\LBPV]QN/<#g?-]PX>0TKON1XWMLOCVa<=R?JP5
fGb034g8^.\FK<VYA_Z6K-fFG\A1BA/P^4FA1U@+e\.&8LU2^WO_a0MbZBB<UT1S
(&RA(U2T&6B0<QZOPEAX,2^0=B]eD<R<#]/#Ke9d1;HfZ+;Q)&V(>;+\a=^_#^+R
fTGBPL,Ig\,a(WA&@cJKV@I5H3VR5,g9]]C_:&/7.91O6K)gf(Rb2VP#.C@7;2N7
T[Cca?KD:RSC.1QL81,N(X/GW_/VKJGVR2DJ&&0L4:&2XOFRWUJ0X[9J)0\OX@3Q
95?TK/[\S/aL6XQN1cB?&FP)KL:S_^:UPeX@I1&]8LMUZ>Ra/IYGL/QJSQa]Ne_Y
[^1YDEJ2d/>#4fYbC\C8/I\ESEN_IdX>#QgdUH&^ETR8;.3CRQONHRMYK7WOKE4S
C8L#DOXW10<)M8SU5IS+-I2=(-:N6]U[2&^(J;>.QQU3W:d8d2X.gEIQ]TIC+Aa7
:V&e+^-KTa&78Vca<.a0eJM8)L:Q3X[1VF8a\W>F.H(4V.^=d16ORPacaUAYR?0]
YOM)Y6V8YF?\[G&Pc9A_T41a..H-SL.9+KR69.@f+-;D3VMc/<-8>f6CK^g3R1^Z
Y[/.GD_Ga&2f1Q0M2YDEU83(V;Cc&3=+aSaK16O<,-AfV,/TX5@X)FM7P9WO)O3/
V@8G9-1JUa5VB2)Y@B6GE(gV:F/a-YB;eTXW_OI..TG-6&HA;+39\D4(]SP.cIV\
;U1RJCK97/Dd)0aW.3cTW8<c&18aWb#&Z[]](8a3e@RUBNV)D67AHMSc>SGQ4Wc&
D&Y-J8&B,U@E9#.Y?@g]_0baCVK#bf6;c&KP-&=UY+:^1=JZaeDc+LYaPS:]=3R1
2>g]F.M>GL;JMO>BD(4Rac:FP7Q+QZ\LE+A4IX##I:8;MG2TQ]&D=J;K>=).@KD4
K&Dd&ffY4:QSNB@O5+#31Cg4@7U\R]Pd5NdVQ60=FH34@31U1Ag>aP(4e@9c#_fJ
U?>a:N<^G()C8(<?_R7bUM,FEI-W@YLcgBe;5@G:GNKAUf=,3VOZ,C.g4W9,AC((
,]=-HPFR]G?G:1=3.d#+.O2FcQ^+.5U_EZ4HOC=W0B^O#9Tac;gQWVd22JXT[CU:
g7bH(S_,K0^c2&R0]c=MS.K)0AQg19E>D<=NIVEM3R=^RS8)UQT;;@SfO9G?[Lg>
LH#^U;7,2ABF49??YJM5)U\JSQ\:F30S=N8\SWJ=.)=VEN/C[If(bL/d41/>V9/1
/VIgCc=@SJ4;a(G<^I?.bZ\FXH/P\8FQ?c5+6WW^]\]T/I;MgN;9XE7/:&+0]8U]
7OML#]EELAF1[&eC&V;5gLKfcPeX[+H64@6,\&Ig\a=b-5>O32,9^Wb]<?E]FIe/
RJ/_T?_^>=M;IDUT5X;WKBRU=,<PY;ScY]TL<N.N)W897==-.19.Y<I2+fUL[&^R
V1.bB.PA#;-^LdcRPTJ[+Ocfb/Z4#@UeEJ(KbR;5b2#RWP7.)?0+.HIQQ0(CA.PR
^]BJ;VB2-^MWF6^^]P4U;P#EO@=#]M84YZ+dYVdLK(.1<c<XA=)b4]&.[;\@JXZD
dRQ<RgAb@@QfB]I7AD_3//=;&9AJg0E^]3f_CT.&eb\2^bJa@;c-g+&d&DY?ST_g
-DWU/R@1?H^ZW&20#DR]YO+d6#Z45N05cEDL#+.\gVgOC-FeZYeIf6Y3b8][geW^
]a0RXAF/1JEX;;Tce;b-ZUHD4c2L49VD<S#(LCggRH:E/K;/Xb6Db_Jg]843:1OK
C&B4U)aE^NP>Q,U?ScQU;7CY:08^(X=HbU^:&CbHEXMe[c\LSaZH?=^H7_VPBbVI
,J-GLg(O#)N/R.@H/EDP98OL]cOAKWY/,e/>SIO,AOg\K,9e<9/-7TPP27=d8C+I
T[Ma_CcdD<&Nfc\K0_WD+YMgS17aX,JC&>AR/2W7[P^Vc/;5[WC:_E./I/#fAb-M
-e@[=(\U&?<EQdD8:+B?7_#S1G\ZGNRg)aT5f=Eb]@6R?d6+G94P<5GT8<MQ330#
<<Fc1J4_H@Md&KCA9Qe_)5[T8-+75QM)DM(??S(=Faf?<WA]^[0A3IM.(K4VS8RB
PASU2H;>&97_>H<9C1S2]a#4X#4/(CcPYfVG3OGQ2L1<3bcA]^@@7]0Y&^@)S?^[
3J@Z\S,]8_;29<V8_\f5HCB3b@.PWP(f/C0@Y@8PW=71(]NWX6)[.eRS5\A[MdH-
\aeNT/)IQ02\V<;)I[D+95+0=XQe51S=NR/1gcQadc0bZ&EG=geb6FZTK3<2/;3D
ZO:C]W?B#(UXT&<=QX[]N,:NRJMEA^F#TT3P/M[;>(N^A9W1X]-?U23_E\Na&1\8
I>LX-I=29YFMB3017R_/50_V@g)0=<;eHYc<=^d1ETcT;9edH-YEUFb#aX#A9;:W
cPMR9K,^g:6,5-H7HSBQb9]8Abg\eY?cXS;gfUB<YJ0LYg,e;11G^UXegN[)dJH0
+S-aBZ_T]AM5,V)/PX^#(L:a=cKf+.0JL-.]SYMe.c4IZ79TJ?d0T=BML/-KcNRR
QZ/1Z(B7&OAbZWY/)0E+GGbLZN9KC8>R1B/FV-4RD9_CH8;BW0Ra[-gY;\0V3eN3
c,XXG^5GSZYVCFNXH8?T[WOS^MW0QXbR)NdC/KYN]d_\5ILbVHTEScIgWOe\CA(S
<e0[IM).NW879]ZM:HD@.OWGL:#JTgI2J7]\_3&H4XCWX(5SBH[4@YQ(RJS2NNF[
\6=TP_e#W8?O9Y\\@]U6DR/GK23OFJ+GCD5O2PN;7gB=X-W9_5X@5-RGOgCIgM9I
eFO#F2#a\ERaIA(F[H1#&H5dS(>:0UWDWFDA>,Z<.M9I_RJG)U&,/EN?Mb#VUPb0
&ML4P,82WRB6;\4MAQC]TPc(f3JIPLQ6H0P)g8T^T7:-@J9FZB-?6YCRQ?R@38ZC
ba4FZT67&b4UEY,Q8feadKf0[1Q]fY3>X7-38,bA-L<.@:EE,.K1=\Yd7/EHBE,c
HZA?Ka_BXB2):[L=3<.]>B]g,E/OO&_5I8b3@XM(TVRWCIYJ&-MK]ZU?G0;3,.I3
?JT3,H/UU0::2Q+5K:@/eLfda4fe[_URc(Ac=CKO@d2)gX(JG2#-?X[Y,^a.QVB]
X@U>L;&,gX_JKZB-217=\ReHbad2@L?6TSL>LM;f6dRU9->d[60^8@@d>b6DOdM=
e3+9a4V(WLacQAYcUID@e>.&XD,IB[H:f4&ECW@D?&9V]H^8c[@-A2N]]Gdg@WEG
dc?Z-BY2aXL4e_E#CBb(@&03JEU-))EcI_;a<T(H&6=6dI=3#b_J#Y.37X5HIH?f
&3S<d0VNNbLK4)4<NgW^KM8KP>V1^\4W4AC@>P?2YK-8>=Wd2I#FX8:^1PaNLPEI
)5=HL9KIE/NIYFLDC,IcPT6UIaZ?7+GaR9EUaUc?1_Q&?G;C@YJYaV4.[[<7>[aO
-HWdE(,30S?P+O6L?FTg4fgYA2R?WPE4Z#4)XdCHQ&,U30_+3JeZd)=5d]E=Bd1:
M(N_YS@)9PE-/56b2:(d?VLc=_+@B&cAPd(WI3edEX-A1b2ZW&]\\OeSI#gRJW?1
cJ=+BF)/+P=ff?d:8\f=3<eR+_,U[SVM8F[;=Ma_P^_&IIBCgQNHQ8/M[:@;PY.&
(XF)#OEY-88T/gES,&M^F;&gQ2+S-eH4?a>g6<4E:0E@K9-]1A?KN(]=9\@X42>A
&?-O.^)2P09E@eJ^a]W(XDUe9R-GG&V-N4cPY+1WgK4Tf(c131CI](7J_).\;C1c
2A]JPdJ)g&CZYZ?53;COFdR9ad)UD?G6QbKL9(80=^d^GC<YY\I^@_MQ/_3:K\DC
>A=fAU-1VP+&1TdC;VCQVY@14]^IO;MMSRI0V@:_6bK7-=@9R#NVUT0];SFF=G@=
RL+39RSLP\<.WP4/[@d8X;AUE2BWUe)bQUaZB<X)MC@d:U\J-_-4U.UD5W=)SM3E
1P)bA<Y^-T\cgS0#4VER(+2[:f^WTCaXG\)^MS]AF4BXN9<^P(/[c?86.Z_DQV9_
eb0K)[K6G/G939Q2f4#V5W/P093&EQJ/d79;eZPU6#ec95gaX1LeX&_Wd),cY8,b
N>VNMZJ_)E7Cb[<?DK4[Ld]=<VXJ60KP7a-LHV6RJ]E#K4VD:;Kg;c0F,>8a7YQO
AL<^(0V72E=];8@3KIILYY,U(#&gZXUOG146W[XF8L9KWU0IK5_L@CBDT2JIA],V
1E@0J6@2V8/PWO)>_(KTXdD7/HPP@ORg61DW)9&B;-_D[O;:RF;d6KW0X3-F=gGR
[J+,]_UL^,2V/3S84/4dQ@SfK?f>a9_OOB^7@+XK;f2M[GE&(7\+8&gN0\^NV+OK
H^:GBJ5GVQa2>N+Cf4dF@NL&6HIAX8U;9&];&+dbS,\]6L?]dN(<3OK;F:ME]Te5
^[EcMG;@)f:9QDbED\XD1g/(AVbaW<,PN>b,A\_]]K;?9_5>EXg18T.#2QW)J,M@
@bg)Df\f37)Q/QI:=N.,f<O2PBW4dC79:WRB_e#H,GdV:I>MR;J,MFZ+C(?;J^a/
SL<^)ZNI7XV[6T)TC&K9029D,G3V],^<eZLbU9_+D3dLR)S:gcG,0-_Y>4TK;D1Z
Z<@9&[ffC[Y3H,#g:LEF1OSIM#Db.HUEb4/&c_HKYHZA\8Q#>#6KKJ3eVY,2gNdN
eS_;bFLQa]?[C_O1=W6:.(FUL2a[EXIE_\1Z7Tc529].9W#B^.3ZY8/VY(QALWeE
#H#-2BU(DgH,L_KLD\4<)F-H++G/GEGU4]Be(F+/?RZd?eLZeUZ[TF/SU([-M0[?
DZ@LZ/bNTFg0Y].@#CFE)8X?@2^E:93INKXX,4FgVR9]A[^YU=0de#3?16_BZ,/S
d.?6=U,0PcX1J9FT\8UG:1F1P,]^&JG\MGJQ4C5@1;Mg.=?;e#cL=OLR8IUfcTXg
TQB9\(\_85&c)9CB_8NUDU9Q9\\?SWML)N]LIT;\:.BQXCZLA@ccBH>A@M;gX-/9
#5YS2I,64[5f5C8\g7#GeGKVb#a:9H<53V@8UcFQ(VaO^]^3G\Q4(#d@>:>\19Z,
FQA0:DRg0>AZe4.WB?SB^A[GOGP/=VVDJ7^B9K4A<HTUD[?-8=5Z)TS>ee8bC)Xd
N;Z&:\<]K]R=^eJ57-F4R8=a78[2D&-a,NfMJETZ;NU=Y[Y&Y=>@G7LX^WEKOPae
S&fMG)+<]]J?)>AJZGOWe;bCB++41M2CHTL(5>K[_f3T3e_#+7Ae]Bc:IPZ7L^N8
?d+?KPeG4E6]<\[GeZJ4FCLXX14P.A7g>Q@W,[\ZT55U&L-=Z8aRB>d.6ZV?Iec<
Z1H.JJH6Q0J/ZL82M7a6>,RN3Aa.7KaD8.,Na@cHLA5\^KG1U+7K.H^22IG.0fc3
@:.2NFa?e4SF8VF.3>^3)9Z4IDQG@:g;<6749#[7?9O(Af5CgDGR,gabCLcYeQU&
NNa2ULYIf2IZ#FEL>E.E3ec8\\R^K.3E77Q#ceE\Bd/^/,C37(6S0GZ)K4))9EX)
:M/-:+FVg)]6RF8DO\55V7/LFPR[2P;]6ae8I7HG17/)A)N4&O_/d?<\^[TH)N,Q
]EgHg[fU,S4ZQYgVa?HW4^aUf6,SgUbPLRQ;cZ-bIOf8aUCE+VJe5)QQ<De,bKJ&
GISdKUE&/5U#0-@VXOTI0CRJFTC5.2>4KUedIPEgIcEZ^,M,1PNVbG[23^Y:-SWC
Yb&I.M[83FdXU3]::(6ZZ/WeKXZ[<L_RAW4.=N=W]ZWe?BMG&7<g5<S,STfXPbLX
[A>C>W;DT-Ff)M([+7G?HG(fUTU#IEMQ+fX3+MIIHH>\/PO)(B,62)CaTETF:6M,
Z_;aAg.Kg3bV<_]8FWFPIZ[UJFRDX)4:G?R\G)EUHDfK/B5;f;XG_g4==L8,ACAO
Sc7F1>+R3d;J8>aB0>c^)A9A>f]L93Q@Q#3G7X7I/dfPMB/a\YbcFFD6_P0X7B=H
3B8S;1:?d-]^-G7E2[aKD(UbL@;#7E&2BMRUH?LIK+>B..d_CJ1gX55Z.:-b8N4=
<4fLG1?GOLKXF-J:6NeW=>;#H)JV1gBI3a\e51Ta^?[V&TLZaR_PNb&M=G6SaAXQ
8RG+T5:&6=E+bU<9)T#DRX]D]E7Z(.U<T=P.G:Y2&c)V:D?AE]<&_fAG^77)CO4)
L_2>C+G8S)U:54ZF#8L-HE2/7C-YD;#(LX8-)e]#M&PBf)62a_Xg5dJ\>?]&TAMF
J:;8[9VR5fDT(-=8OC>LMC3O[,843^b+XTe3&(OODKU<<@^\GZ5R&S;[bKb.f,\R
.33>A1LB1\Eg7Z5?a6@5NTYX;^SF9-eacP<R:9RP;9+()b-?)-Ze>5L2XLgfA?Ga
+Ib+F_)OIL<P0ML>_a+XgH\:9A3Q/e&cOOO/1cLD#K)@e]A1LX5:+A=]Le-JK4PX
VSJD^>7-CKFI,c7,F_0UQJN[;Q.JLIeF,UYe6+N:,d6@QN5f=;5&_<MZP.(@.NVa
[4PL9M&M\5-P#Q\,4&Q@g9M34>f,N]+=@YI&d1UQE[41V:3B#6\(fO,<1JT>R:3Y
@>Y/)4&KfAQ?>J2\SRIcc\,A3JD[S>]Y/-bZb1<<?/>ZH21N__PeJ^PDH4&c&GFB
8R\_-QE3XNWE<O-W,MbJZf=C->]bI1Jg:a)XHdWQ\D3)[@=F+=c)3Z)4A=&cg).f
.WY)ANQ.KcJeG=)B:IY@0N;4HaKPd(W4:9[O>;)W2@W@/M20MbQP]H,U4.F?0cD9
EFaS1UN226.P4cIZI?4TF/g_IC/)N>13CM2G/Z9f5b?.NH)-.L42DWZA.+G<g4K9
gfGb+/VcQ1(,/Ng@J2A2@=XG([EE:[Yf2#Ec]FC1<.DLfGKg;HX=dB]QdMVPK=QZ
SC-EV]P^T@W;g<U.TGQ\Y:3_Me@ES+C@VQR4K=3)SK9-e6F.Y^79M+fMH9D>2JBY
,DI@/b-]S^KZ0(:;gf678#3/4@;2\\<-E5R=/JJS5/78#C1Yf0f3ZFWg88bGG:fa
^IO,DaRBH(P]C8X#UI;+[0+N7,[_3I0a9H+.OVNbMTe#U1EJeL/_(LHUF1,OQ_W<
?67g9P6^9/FKBUC3778([_>)G_]Z7fCSUY9?R;W1[55?LZ>F718]gA^1eLL^cOE5
AUU:21KCA4M?770)@3D_^IKC>WY1EXX@]DeC.;;2D4Q#9:VKA3\N<P<U/U1323RO
Pb<<aVG_TaTc&.^85L6#7-U;/DHFg-_La8+eD.a]K2,=DeFUVJ,]<f.^REAEXX@T
U:4+HZ^X>+]:YOJNcdX#YMXSM_O>Q&-#P[@;:LIeS)L_-1Ff@ON@LAE0.+_UP-G2
J-gLBA-eP:JeJ@X0J2U&J;+YIaKNI_#d7Zd6D?aFKfR6::32JUM&U,HFI9/@4>O)
W5X=d.W)UcS<Fg+W<R&c1XF?)B=?YSM+R4:>PN@b/#R/^AE-TJ[<7/e9EUd<HZGf
T=6V_&KW^V.4YMTI,SfAeP1b91+1P[Ka5-Z=XG11PG,g+8^5^2?Y>M@6GCPJYN#1
UCYFCR>c9(S#8R7Q@Me+=&[dG978FDIa9(24?ZI[GO89-HggA#)OHagDXK#,cbGR
W2YIUF/&J2NFHBT8PU5F;edLV.5+NMKddI8I5<7+RWG8OB@NUW[Vb9W=XI[VeDI)
UM@DO>E(-#=JDDK\>a>@)Xf=<f^4;Q\<.TZ#H3BGd<YX1N6WO3QLR6)@#1O2Z([0
23UL+>E&(6(#a@8fN>C/^OI(8,Y;Q935?USZK\7g]O-CWNESGI7(@3K43Y=LWWK]
3O=Za(86=,B1NLMH^>#@8@64?0D6YD\F+=775eK>)]&X5Q6[8]ENAacGdVD>,]P)
75LPQA[a,T7,A@S\3AcT/^RJ?-<L&GBd11d,BR.I<Z>:[B)f.VWa2c^bd^Y-;e\Q
3Mc<]R:FDIGXL/c.7;J-BE(aWG+66dPBRO92dM.O)[5Q&Vb3JGf:0c)fYNO16IG@
4/XUNDJ@_f/W((N?gR@g?A,5Cb_601BI6Oea#g9;8eAG&\+(#/Z/J<:]HU7100^3
K9RJ)UeFX\81ZIO<63&;;bIOS&.]NGR:\M\5dID+IGc12fU)g?aFe,:AMCb=dH?V
#A3D^fZC#9PQR^N32C^EP@Y]:[](#bb(1/C9>A)L6D8---TS^b5WSa/1<[.RWQAS
9Wf/75d,PR0(C_?1S&-Q4bTD5O<(A9H)+W51bG/b\ZGC^?\DW=TeZUJ/D0KaR)XH
89?cE^CS,;S3?EXY94_NWQc+DIBF93.+B@I\aeL8@+4JRI7)7F_V.<e>,VU6<9Zg
@T-^[[\[NDfTR[bd&QJMdWM@^1d0\FYP?0_4@fHA:V)_E)B89GgE97J,+3ZFY/U8
L.SYEXd(2#6dIIYHMMB6]7M7+Q56(7-,Bae[G[3R&S7,e6e.;T+?g3^BT(9NJ1<a
XL\L-f\=Y@_]/Q;LX;8]+6O6;6If2L.8,gKe7^:F\1I^e,GZ_A\[-4[X\E[T=ZaE
B#Y]ZY;>W#9A8&e;da(XOPCD;_DN6cMVc><1^1MfFFFI:LHI==N<HLB;Z<b-N9JW
OS-/N-3O&3CZ[T6:/HgVXg(bY-(+.(JZT@FYgCO/W?0@T(:RNR:4L)R,T8-Z0:aH
CL>?J]NW@]b12g;T3JX=[4QQ/=]XYZ1,>PFB6>A0J?Ba1UTNT\fg/B-VM31/A>/#
UZL7#UMY4#3MY,[@9CTXEE]QadB1R^8K@$
`endprotected


`endif // GUARD_svt_spi_flash_s28hs_s25hs_sdr_ac_configuration_SV
