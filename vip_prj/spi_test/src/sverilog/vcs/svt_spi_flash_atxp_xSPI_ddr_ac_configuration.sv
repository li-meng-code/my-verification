
`ifndef GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto ATXP device family in DDR mode.
 */
class svt_spi_flash_atxp_xSPI_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns;

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns;

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Quad DTR Protocol
   */ 
  real tPeriod_Fast_Read_QUAD_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Octal DTR Protocol
   */ 
  real tPeriod_Fast_Read_OCTAL_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Quad DTR Protocol
   */ 
  real tPeriod_Burst_Read_QUAD_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in OCTAL DTR Protocol
   */ 
  real tPeriod_Burst_Read_OCTAL_DTR_ns[];

  /**
   * Minimum Clock high pulse width duration.
   */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * CS# Low Active Setup time
   */ 
  real tCSLS_ns[];

  /**
   * CS# High Non Active Hold time
   */ 
  real tCSHS_ns[];

  /**
   * CS# Low Active Hold time
   */ 
  real tCSLH_ns[];

  /**
   * CS# Hugh Not Active Setup time
   */ 
  real tCSh_ns[];

  /**
   * Data in Setup time
   */
  real tISU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tIH_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns = initial_time;

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
  real output_disable_time_ns     = initial_time;

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns = initial_time;

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDS_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tRPRE_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tDSMPW_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_atxp_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_atxp_xSPI_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
TgW5O,U?Z(d#.a-CcR?\U5W+U,N[+,OKDXVI.eU#AYSTae2cZJKN+)L]HX75)MDc
2K3V+)X_=2++]NF3UEV]0+<O+=DX?NZ39VR&?=<QdF2cJ_a59aG\?a8V[aX?A50G
NJ911Gcb\@+c+P[?-d37Z)K3/-34?[X\;A929>_H(_,(V<UDL3X/]L<7&O2>bCcU
#(?B;f>]#_H#DOA&D3ERZ6&802NGGX-GRc28;PJXY=(QOeB\\I_PT91.8#Y:XF1)
J)+LN?MRcRT;#:N?eFg;R@\,CeJPS4X>\Wbd_7^edN(60gbe=VS8PdQG:UUDS_<T
VFQ_5L41&Y4NGeddMLD]:2HOdBEg#,L9R1PVME36F4]L#X5Y60<2]]RJ0RgO)__;
,7_4BUE>N-31d)fbTRc^?#/2,?KbPC<G_-Y@Z5F5Bf2K@.cCg@W1>TFg.&Xe8XC3
+OX_,X^.AIYN&fK2,BD##63^A8DJT0J&DMYQ>+O0XURD;97V),=V3MU5fDOg/U)<
d<[+2N3Z1R1/7[18+&J2EV=+Nc-L51K<02YaP:?V@(XZAW48dJXJA1\,YS_76P[#
\CPY:++YVY()YA<=+M\;dOX4MVG==0A4d[7Z<270S8#-BL;5CBJ>LZT2E]4/fKCb
J[=)A3SZOXN_82aXgZ-gKO62T.e2?ET_PL5]S^Sa+T;B6LDdMR9_>_#US>2(PP-V
-VK@K:S9<SB3)a7;_/B&Ud0c>ec43VJBU66CaNU0D<WX^>\P2PcXC]V):34X1D4(
SB+DA9V4(G+@d>7)Z<;\aO\>)9aA[]W.,@=6feV5T93XE$
`endprotected


//vcs_vip_protect
`protected
-_E0dYCZQK9^_D7JU<(WV(<eR5ZP5f.4-\_C;(C]KbZ6cG09\-Y?,(YAAd,@#R+U
f=W/MDV2]b[b<_S<=J]BL:UAd<C;Y@]0^O],N9/d,1>7Ob\I3-W7^<Xf=T=61cMN
()[+2I[N=8R@W2\X]5(JKYEdEe]EV,S)A>-CfTG0XCXOXBA.I8_.K=@bT)_VQ>G(
_V)2CQO7:L-:19Pc#-+&Ue)]/F8\c5CMD,&+e^ZS0\F]Z2dVIDfMgAE9O?N,42]D
XMNM#EPZ2B(F)HbSK/=MMgTb^BD1GVL1Cc42BAP&\+XT4/aW52_:)e[df))f5NP;
6_S,QRGQ[FD0-cRC0X[AS?2CW2aCK(=L:HaML6/Q_fM&A?D]Kf^-T4:(Z.+[@X_)
bYbZCEX)INf2SY1:Y\,\PUV(e?.T1.Fgec(WIZ+];,Q_7&F]M6Y363C-(GP3X9PR
G.;<aL2Y1eIc:F^9OfFUgGb/9YY7b,MC<?UY,8fA[19A+VMT+@158\B:ag^[AR?S
(+:WU:NGD2JV2?-HVBE(>-L#ZD]>Ee390U(WR&.?)c\TN#aS4A<\KCUeJ^0]dE-.
N)J,DQKO/1&Uc)2a_PJ7T9^?T_4XVAE0MD-g45LJW0=W/+95B&WR8Q4D.6))U9HE
aKUU[=2&cfGD7O:+MN;(_0G,WS\ZT&&K\eWE]U(56A#SXJ7cfcZW&FO_=>Q(YW6a
.-,0<)4P5E<JeB#_=STJ(++]KIU0[S@,XJacSFOWdff((;\B.dY2FL<W&1U1ad_\
UWQ:/=^@G9FCD0D\aK06f39;PCWOXWdYYdJKNY7+1OA2.F]N8ILO2&I&d+T^c+_6
9496TTcYM7fED[)BVC1+,bJ>GBZHN+N@VR4^G87Lf4C@=0?&9J2:T@W-?_JQ]5a\
OA(d<d@HJ==2(^N1N:&c7BLBOHO8eM1b>F\F?A]A5?a^-4]d+U?P&(,dXE+A:#0/
;9#3b@<F>>N,ZO-OaRU4/_>Z21BCXTa:>Cb\?0V7@AB+^2]<c0&X1JAP]0@O1D0Q
aGgA64X^>88P8&?X=.BH?5Dg_g2[0-DGTe>I(UC,1U3fe=2e7e)Q[D2G@^=XMD(5
>Z_#0\70D)^H2\PO_>+QL]6?)K:-R1M4^/@S82P-;FUW4U-+H).e#84;T=7,(CNK
TO2225M#7XI3g>0f+4PfK/_UN:,,4_&GX(,;gG6Y=6Y?WBfW1X^ST[G3;/O]3Y.L
?b+-0]UP?ZFH_U&?OK>,37f;fe31W:=+@GaG2&/d4IH>cXRcb;+7eKM5,)6K?]E^
0##2]4&[-9&\aN&&K>HA(#TYW^?9aOGfKbg27/O2(N1<g,W_HEeQX/E7H@gR7gf8
3E\[U^<?;DV<E>e<b,7_?E</>JV_?PPQV+5_Y,R@<AJQPEEB#6JEF+LSU)eM2:+=
5M191d]EdA)/:Dc@]XR-N[S.O(bL]PTgOBQH@Ua3(C-#:dWS)dSYC?V/L_0dc-7e
/B=Tf/.16NF2eWgG4OPFF6K)QdJ.Lc;dZ#M^KS7RLGaCc=+;/YX5X<a?S3YE^b+8
L@e6\8-4)cNBSM3J->P2cIO??7&d+M9MgJcT6cR#=B@R0R2>XfQe9^L07\fFL@XF
UI\UT>4EK,[A==:K.YB3?KOK8<eGb;LY7U5IccHIW?L3#O5a+8K0UEBOYX]R_ECb
DNf\>5I)XQgQEQP+2DfH7(^,aFB>8^B^XJ.F\NJ+d?X>>>PQ;D[=ZH;874(H_+QZ
fd\JCe:Q_AT/ZbN5T7X;AR=\^H=R-Ae,eAK=0TeCE#EKb_=9W6I6H;Z/T,;E]Jdg
;8X?<ESIO795ATLI#M<D&c^ge+fNGf?#]-/E@+9<F4&)E.d05L6_YA=;[C47/QSF
5e3H(3X7[g5b@^5Y7WR]>601+cG[=T3W1d\Td^OH1GL6U?.5X&GN4N]FT,]V0Jd;
PWBCCPg)S?&fdVZ8c8IMHUHI)@51EeWG;/N]]9MH4UDDQ6)Bc,&8_&;AcD39PM5Z
Iefa)cRN1F+6BB8P@A&;+CPD3[cK7?^fDS<9b87eINBTU#D>VR7H4_.+7<4>P,QM
Aa&V6XD,FaIB4?g_X;f#Rc05V3@<5^&,A/03d5:70N@T\3+_4:2I]Lb12;LE:6IF
G7E;D&(J]P0.GOM@c9Q0=(O1:GfLdgTCY3<&?V/@Oe>&MJT&cW54;8+KU?5b,O.\
[PFIS:bV<aZ)JC_YWD/](ee(C,M,EX9&b5];PV#PPT9P)ONEbgV1^7^VY_VR_SO:
4_Q8dcTR:N)W3NaH?)6,=SeGc)(#f\4ZRbFLAW@?KcNG>U27WN8<H9:;#gYG]BUW
JQREJ,XG9Gb<dG??;EIHe5M-[CHQ4W(\0YFaF7b5f(PJ@C^ac87RTE/Y7V0G-,+b
B@?cL9e:P?YNEcZ5@Y=9D0;3d#3D9Z,:7IDFLY\cEffY+KY+P5]bF\L4R(<(&Z6M
4=QMfXXL@O\F^^A:N5VK_V,2\B4NdWa^L9809NQ7Xa)CI;N+3[eYAADIEA27H#;W
#UM5#RgS-#[=JWKBL_R+>-:B7fJ4LNGMdIJAL;@Tf^eBfU=M,5^QPeLM<F;(9F#+
0[VXf5L6G=^:@X[c@Ig:IC:0[CV]./5E#c-3aK\S]#V==-;)(,\.(5E:J>aE(0[,
=,2OQD3S\MEHIEZW/O-W8)_ScAL7@.Me91<H=/=Q2ZY&7Y.:H\\ZUTL.Q-:aZEOW
/)d3;AF4WHYQbYYMF#@J,B,WD>))0Yeb3@f.FD,,(6a/7RA=N@K90KLW]OU2+A[U
B&XEI7-K&.G#NGQ9b35SU>HHNZA>PB-M;eLAd5E+SORWF15:BN9M5_[8,J4F36#[
;&F<40+Oc9aAVE&/I-/,RdM:NA@<\)UR6<F2<MA/_+e?R-AJ-Z&cA#-2ZSSE^COJ
LTG,A;E80ONSVd(R0/+#W:SFMAXI)G\YZM4_.QRQUN[a(53<=CCM0]+GE976+a56
_F@D&Q+-D&Gc:3>a:R]8TX]9g+7ZKM_b<[<d@I.<16TI?2d^:H=3\d:,?@\T0YU_
C<50cA:S&DRVRRX28Wb54LO/+:6.d=8H]SCF6KP_f##U5\9=\AM0NYMe)5e)CfFR
D\:U\Q1ZQ<7<LY77:5&bI/7E.UZQ3I->WDC:LX9g4QBSVEBK_2SL_=02@X52VC\=
O.&Q>V.0Y^MVYc[_\caH#(D>3=?F;?53S<R>V/UeG23dA],@dX.[N+B7T;S=<AC<
@DQ>#+1;N(PbMBI3UB+#YcdS\H->bH@SPORVbGBN+WBdA=C<YI7@?_7XRSGWTDQ/
^Vg\FU=OG1C5G/ZJVD@E?Y=3JaV)D:0f+C<H=Od8D^G31KA[2P:EX9A3eRN(]@>:
_/:K#],2/#WdWZTRgTc>/Tge&-B9CGA^:\JgBD?8R?P8^ff/AJ#bGO2L)-;L7^E0
0#Xg@_eg4dBEV]2W,,W\E-(WT(GF#X&.)6@YZ+6AL>V+CWdDJ?Xf;X\&F<G(,NO+
cEG6PIF=ZAW=Q_##F/f19J:/J?<-UE9\6U+OIDPH8bDMM+S/cX?86XMRJY?\R#f.
O/BDA51(,9b9_OQ=[_4dZ/91bD=H2=D>bO-Id-bR1&.Z=<,MdG9JbZB;.@gf;ZC[
?)@5WEV[@\IeaEHG[SA5cNP_4R,>V<YdE)6U.54:.8N:HC8C:HC6g]]1.&b@IeOE
fXe^0:5bfS=GLH;<6SF>#VbS+RLN)CFC0MYMa0bQ:g--a,,M.>FYHTT=71EM]LBZ
3)F+9P2[B@=M+IGH/fC1AOSH/<L7GG>9fe0b[Yb,bP79@e=GDRHDP.b2P]5>Ea#f
Z/\-T\CdJ]P7+M#8:](E3e+?TDQOTCZY#fY/_^G4;GbU^JF__M\<fO.IHVYMKS[>
A^V/O8IMgBS_]E?[F_/T&g@)+d=;B,+YdNT+SYILR_]0,3QW4eYAQJ#=Ng(QSI9A
7;@BYQUNf\OK5:M&WIE0P=-aNE56<^N4]O1O6N&OM73\^>DGMCVSa>Za;?/AY);f
BWXa.AP;(#TbN,GD)[5TA7QFe5QgS1O)gaY+N=:B=;6GfRg^=_CXQFUQVCM5:2:6
J)4>]RFGDNP##&4?1M#)JeM=?;&(X?B[YK<6FcDG-f5Q/cTW894VdFZVZdE@bO-K
W=0b2eI(1YeI^JW2BZ,f;M4=7Ya1B3TCXSQcV1.GO7NMIAEaUT,B<a-4U(#a6_(#
Aa:5NXCVMFT^:RBSL@10K\+9/;]W@gR@/3<UeP)SgZ1Je^(db=NfM:-2L.)_;1aY
7:]+@5O<3MDK<42P@)Qb:RM>)FR20^:ae,ePaU,X<6>P6?X3DLM_/VYV)1L^B).&
&XMe:LILb0(^7e2XDg\c17^Z?2^O03.:LKN05d9>;,Mc+#,GbUd2P:dYK(^OT>eX
\N8g:=50c3e4O#-e44ZJc,]f0cYJeM0[0D]-_&0aW_6M7EQJU)L4XE77c72\)#90
=A@,^1;J(AUX(\_8A(G^CUdNf6UKGc^eC04ZGSL157@JcRR,Y8VV>&d-8^adPg5<
8f(/RN\Y7FUM?G5MK5JJ6._@[6Ic:8G2JD.R_[d3W?++W]=&?K4#MOGfc2Ub/Pe.
a@>UF@QAF(aDQccVZ+3M3[6?g9#fdVX8b)+]dCE6I8V7J,\2RC3]U-TEE1/AP#6)
S1UWCef/JgHT0)\K2#B0J]3-\4X8bTEW,9T:e\75-?UeJ+:,#S05M?ZO<+V5AJc&
?RfMGM-f3S-JY#8QUKg?c[O<R(:^P+52SHe)^RWYceV>f)C.2?_A&<1\@R+[[AN#
@McT\V>dE>A#Q<JHS//KcL:a[WTI<Hb_=;?T6/I63EF.?QXgd[9I<e-#N1LDI__]
C5@aP9bEVJe[U8&6/?^]5?c7R64f=-Q)K3(9W)F^RVg64SFI+-BST8af^P6PKeF9
<,BZ[VV0]#=W7NdW9=-Oc^B2A:N#0U,5(]QN&:d^NG1M;)3\[[^8)+0d\C-C5CfF
>1PfPEXUe).WYaWHg3A.ONf+/;P,L0J[F#79L&bfJQ0AHU#9ER6Q0:cf#@4;H[GT
-W)F\2V),5/?cSK<B6EG@dA,@PEJ+cY0.?&JU,0YN860N)KB?S,2bA^8,7Y5J&?[
XS950E/F#2gbJJ#=a3/_(7(d#?U0UYRGH8MEVE#SYLAcZSd//>bbV@5@P;@^W&(&
DB8?,eDYK@PA-.))82@44UCB_ZO0YSSV/]G8?bN#JBV5O]P+[;()ABbSCb>MATfJ
aKF8N>&9;=L#a.L<W3;IH>N@T5&6NFQRUKbEKd8\G;:R,]Fc0JC7<J32(^0&4&L_
,J/G8AL_/L85L/@0R;N>E2E\bcYVJCP(ESRZdB3DDgAQCZA3-D&_/VQ<?F484LeX
cRX80B&2D4\&3T[ZDNXd<4N0R1@f1QX38FRRd;/KbNe/f61fB=4V@GP><19#WS.,
OLBBfXfgF/5U\c9IEP:RQJRHUORI#(c49Z_E<SH_M>LIT4Ue==]1C\1AMHag../&
F/OB?DA;F6F1QX+6EO@[OG/<BDG])MIFBUO)MCFNY41&Q+T306Y^e:;)7NZ)?g3X
fRg:L,L??32##B^e53=d4,BU;M7K-cYX__QUD-A@/GH5IK4&1fC^3O]F\,B.(BJR
\?1_@.CYgIXLg&[]QIUb=OXE07dO]@/Q[L@Zb)c&]GHG?3/T+T?J>81H1[7LYUXQ
gDRX&.XcH3+eC)E@R@DMZTaY[MK8J]2CTccaeE#dd-<(G,]UcSH_^OZMG^O3]QB:
ZW3)+I,S2FbB,27DP=PKX#2>]>\3S?6,PHT;/;J#=3bDU<0<5N4a+#:<<X?g3BgO
)6O,<fKZWbXegEc>;YC8QGe-XI+QNJ^))NU_ASg6WX98R>I57RJT7B=@C4P@SVJ]
ESeJZ;W5dM7<Bc_Ic#3U>;N8-/1R#N)3X.KSDSQC=2LJYLND:d[)>>L(6L:K-(ST
1a)Ma<G#++GQ+[[#;[0Tb_/T?9HPeD:4OC=[/RTT^f+<\O)\E4JP<FV^?ACMK.UW
+>_XX?8K(A@1.#aZUa<6Uf^FV#Q1FP7/TOLaTS7,]]gPN1:)(RVRE3Y@4A>d4#;f
Z[aK\BKRDe?,f=PD(M9?^N^5-V@eWJCdKd8LTa7#g,R&Q#F2NV+U=M+M6;.c?-&^
-E\:)(FF0V5D<I>e[Jd4(&GLKDJTNI]VdNX)S#_/a^6(/1+L?^Le3#/;7Mg&LINB
-g)aRATgV_fKW&LC6FT<;[.=X+3OA,I8\\5BWX1G,/aN^a7a\d[PU4N7E\D=K4fM
[.06KAQ]R8)XS-dBV0SHGOH97)A>5J4+]0EY@]/>GLT1FW-<U9EXG;22G_R&(LFR
<AaR9/UWA->Y]@5#+QTOBeP?S\C)4:@G\aKE;[A_HaeK]H=\,[Ue3DebbKWWTJ:G
E3LQ@EK2B5BdLUML+ZZ,\B9F46CZKeKfOHf8GgFM^b6Y10-.c?V-^)@TJBba8ceL
W&NMbDW]8eWZ:Jb#F<E/<RTFXIK/U_6TAXN2A6#_aB-]EQ_fJ;/Y;G)-)PWWJ<CT
Y^=XYF#d@2EG6aUa81_+(L5<F&_&])BBaDU+V-D]75A=MID+7^7PMPJ,D(f#<-g^
-)@EfeXb;?ZW=JN,X8V)fIA]a>BA6L=7K,09=a]KYdIXTB&WJ<?^=#(ATb:L_C&E
\X7dY/QK/C&#+-,.X<Jc4cPV(KP#Pb,5?Y^eP+M.3QaK<:&BeVeT)2<=JLWY3:UC
+GO297KA+RRe8)V\f+DZBQ,Q3gUPK-C@-?ZO5aJ[3>E\S=YTY)&N;C^9]J7c(CdH
UT7[Z86>=c8@NH<0DN6@BX?[[Y(Z2@4/;-S?b4L^99Jg.@_a5/0_FGUD\dG:AWUJ
AGSUPD.#6=UXbB]@a9O7.KBG?cPVMAQ:2QA-SWP&W,a8>CN+@N;P;><B77?T=W6D
9N(G4K.Z4UDSXY4/T4KMgeA_(J,@<@-W1@e<6;U[3>P8JcS&4[#0IIPU7.+S&a[,
7P++<aT^Q:W8M1^.Y3D6@dbC9d6?2-^e&?bD8[:ZdIE6Ae5gM@^.RZ</bVEK=H#=
Cb1gUK6TI#@N2\=c8,8.;U>:cL-KT;WedcdDfQ#Q3\HMK6_DOcQ3-GQQ\Qb/>R&)
02?;T_>;>L^B5>ITT.?,c.<P9<K&e)ZJ7PBEa;5-0,QLRNa5P])2bV],/BEPaHc]
MPE_7>ebC#D^R6=6?Z9)XC^bb#ACfD@[5X\#.<7-NNS3#&RED+-CPRcHIJ>YM-P/
SFeY?[Mg)0b5[e59e@>7a?N,^9A4VZbR:C<J072M^6Fa;<A1CEg8I2M,VCHbWbSB
+0B]b:X4QL-G2Xg:#2g@^=(VE/dga]Wg5gIHH3]MAKXU&_13Z<_BQ1,+L>(fY6Y7
@L5Dc^.Q]:Kf2->]BY-9Mf:EX8E_>2V>/H=AAfQf-Yb^/f\d[=V\,S_gLGgNGBb.
/GV0/LBD>--eH\\.\3I,0UUc8]3S?,9@/)4W#_P_E)C+4Lf]e](RLB3S32]?>>9F
0gI?JQ9QNAFLcT+c?X-_=S@KC]5gRaVA3R\AJ]7YU97H1DI3)7KLMV;D/Y@VST_F
6<[KD&I?)R7UZE>VG_IcY.F4AabOOD@..PAHYT2^6:f59.KEa8MAEMO([OV.=4bV
=;.81gXf5A3=>,=f1a8^d>>eC^=\R[;,fWU/#5YKdaM>a=DW1N_5_O)Of=@1_R=6
a6D?TZXV&<&0V?H[OC7TTX4VEe^+QVf^#K>N[Q49Ca@CYTGRW#3Yd/_J?9\4M?EK
._;Mf#4)SBgFT8-74()-1Qb6^PB/U?7RE-<R+OH.,^7c6HAFN5HQ0:T.+]NdDJ;T
b<BHJS^AV]1H5.\3bUD+UE52_db[</=VB:8L@&fdD7QJ,-;6YI[b6WEA++T7B<75
49\C;&7UdXW[DJdgcD8IF]6;4G)D.d=6N_YBG(1?<I]52FGQGO1[\XJ^+OV)VTKA
GR27^N7_)HM2G1\];OVec_3b-;A?3AJ-ba8ULJLTdY4W=g@[=<_@>a?5YfT\f]#&
&5LRW17LAXa244L.@>:FCfa1B-<CG;]RQ@G)P10)]_<OJH(1GZZ,JSRR/GY&S6a.
gGSL#G44#_)JB3E[b3IP8#J.\SZ8/4bG4=T>Z(HJ(.GH5Y(+6>:WMM]MGB(8^F0^
Od;:Y.0PSf<IYG)B1d5b)&>G6286e6JB?A^/42M>F2>P^WT+3\dAP_XKX>B#OQV;
>-/+LH?R\J:JRQb]4LS.UNEHTB>BRZ.fD15_\g:@-BPD3?QZI==N]G+;C^#.EL<G
H4OJbf[[E1U,C-P_&61/OUGW_eIH,V?M=J_Y:YgY5QSQM2(@;TX:HbZF&-B6\YdX
g=[&;NB,[&NZ@dTF+/#2@0F)0H+cDGO\\H5N]3,<\9eQBF;^gBU7eV3,dMZHLTFE
Rgce.:IP/.\If@\S2gTQMJDPIcR0fD[]N177Va,c-?CES<(8caAC9YbT=J-/Z5G5
\GYXaG/fM/)IDH2fJL-I-Y_R^W^WOG+Ge\QC.Af&a^L/)=)>S\[EG/QGF/BL&F2c
TRVK+@R4P6^aNJPO5c?fWI7gXdJ1_(LC]WOPcO_7-.;P<DGFN_ORJdFX;B=c_G>L
,9:F]@PZW/U,0=bO^&E)R>>F@(@HIe&#YM&#C)8@@(<APUW,1KAT24Y>QcJF&K.Z
06b30HG1O)4\aE8&+YWWd\64C-]4DOb-RD(-N7[N8A3;<DUHRM,3#_US/KR=@MW]
[H&=TU,8CIK5XaX)/eXeDW&&8W7ZC#&f;QUf@a2?4A7[930e7@]^3/NTS1HU-B9T
-1QF?:[B]fU40?^0I1gFQR=&4/,^C>-KcG57C2]<AA_Y3c[W&(3JHZMVWTX(899.
Hc9f@SZ2GL4SC1.G5OLV1McO-1.GTUb2aO\5YRRcZH9O]87L0?@__49107aM:b@:
Rd@?0(1&?f9g7W5;D[]9-Y.;D_aU;3\c.@U<QY9@Wc[@8c?25LM@6NW:0Q3d:#W0
2UTSNCEGKVO?W=7O>VB(HF=4K=[;<#eA)O-HFAGY/ceD6QF-9T>;&T9Wb+MAG\NV
^A49\)E9RS)LF9eY^R@:5&gaU8]JV4\1V3\9RLPN^OZ.g):cQf8T?GX].AXSf-42
C#3^MGgIXV#D&;G/]=-;R;=D401g8=-;f4_#/I60\J_662cO-F9X8F]OTQJ3dB\N
Z7#T>[6NA,84e:27IEb8RO40EgHHX.b6+E=4YA&P5;J5Be^I4YcTcIbO.VP@M>F.
EOgO72H:&AX#.cgHB#RRN<VWC8:H+4#;WX8[?J&Qa&[YYb0=):,089#G):\1;6/[
aS6QFMK8&CWX5?:R;Ja^L:R=Z@gUFEJX4C#&Lec=<_?O?W,T^)Q\],-^,U.[F^;[
FG]^[e8TNF;]2(gVT>JRDZA-?aWKb=U:U],.E3WHXM1#5JQ9=IF11VUN(08B6I7F
1/.M5+ZM_)7P7.Of<&1PY[JOYL<_.7D1cMT#JY?_ZDH0L87TGDYVL.=W^]f,_-1?
,73aH#WUTX;0G_+<5NB7?Fe8T>5BWG#L[?WU[SHZC\U;?BZE[2M9g/D@S08C4fYd
G.\XY>OIgGP#aPY/E:-f#eV;CPM8LKJ]V&D,eT0_9^Yd--+gYGRc?9:#JTRC,=H5
?@0H17NIR24=(8PACN^8e\>Y/YXMTF12V6U=E[03.Md;>N6O,2b(R&BJ)#XUaM[A
<VF/YV/[L(=e4eZ\YPV\1Ce1-\#O)gg2Wc?=62>=Z-#B>V:STX1&2e4FY)^N>NeP
DPT=<X+SG0@SBIXNCF-:dGf)I^X#;S;>e[3(VGd:<1JTTOXM-?1HQD(BL0KHVWf?
J6NbAES[cb2M#7ENb>3e,ab&:XNA-PZI8;AHHO6],E6OC8]]5PE]/9=LXe\)0H<P
:8gJYGHCV.+@@c9d@/H@38D?d1RQ]Z(&ZKcY6)&UU=O3I>PO]U\\Wb3c),XF_=#K
W+g,XFd#EeCKLJ,?R:;AB<S<V<9dU]/b0<>SFW.9NLdb4WW8GEVX?Y#52S]e^>)_
7I,?(#,OK?:3Gg@>,Z<T#D:4F[.aJaGHE&M2Q/L\(+9gG]88>Vc9JG-X-,aIFbJ.
\\+gX4^(,+]0S+(K?gZ;9SS_&?@DB5c:#&>Nb/fa.W8]5J@cd_#_9d@FW0]=)35;
H7eg,VZS+PM4R?g4f6JaUZ<,<KRA_4PA9J^:2IGgFg-3NbQ^bcH#>C+=dO^CDg>+
<4]K=)V\,M?b[J<3G87RY:Q@-<3a@B/<7)NU&3d,<X[/E+J[&HG,PGKURa_4SC[Q
4ggfbR6?Ve/71/b4Bc/IB?.-_37aG^A5OJb.^f&T+eg.&91-fE:H<d>6g7;dDeM@
9PU>6BMEHO^2URPAASQ(T.d_R@OG[N#B5-C+E3a.;FIF581&WV?^OCK=C&K+=165
J_Z)?B-,YS5&J1_ePV.285R/SV^e&6#ZHKGMA(g8^2?G-&U=2Y3Q/NSP:LO:067e
BbEKD.JMHU3.)H6C\SAMHP[R61V+C^K]:_/3VL@fJgWG;>Q@PbE-d;J3d>7;JD[A
.]8[8C<_bZg?I88eY.-65e265c]KeJCLB62(^)(R\1H8MCH+H<HHXSVd&PV/_WQ;
#gXZOBV@c)5(SJIX5c858eMS-\1NT0.Vba+[N82F;@[D3=,Q4L<a,BT8(O16FcM.
L-+[\0a=#WGCgHX=+[_:b#+HUa3AIP.]4JD(@JIV/JHd,@?47A=E)OC1/HZT#,7/
a561R]#CW,cM[V0Vg4_>Xd?M>d;+3KMRIYJc_Y4)Q;>W<(1FHd:&e@f+afR\IK>[
VL]&1ScM,>\]80X4>4ff\fU1aW&VQc,eVPDAZNHL:,ULC]IMbALTd1)8_C)BP8dJ
E/I6T1(HR3AW3f;<##T-[O&ML&QV<QFIeTK^c<RJ,S/C/VG7G=[7ZDYP65dZ>1(J
1dSVe@G5g,\ZP4NJaVC/dG[VaO1IFRLVFTZ1-)+H\GG:V[XHQ1\16VAOeM9&O<D:
P##WOQb-BTF1.7TI[:VI0d)YTB:NJN_=S<R_c0B&JME]74cg^KD(@17Z.W47ZFeB
<cbda;?dBJ;6QcU3dD[(+>0,;]T0Fg6OZ9eDMQ#bV^#3_.NR7SA/6,MD:X3\E0N#
AdbcZ)(=C9>&QIQ4RUPE[YEDIH.IN=baTT?L;JC[4a.P_,)@<0+=:C<4PIJN^U?D
Q<]-<(bQS<_gSNg<EWGX\Tg&,Dg@BS5#b&.Cb,&U;^b+gN51DA+b2O95@&FZ.2=1
H<^]8TV3&>TH4+eFPF.XYPHb6HcHX4]+5Y5B;3VJ&a&_M[]f61S#7OJYZ>P4IKGY
-W>IAP^]:dD9=2+^PHMcYO:@P.2,ZHeD]E5P((-WEfU,<#[#VS:[Q)#,M@2dfSHL
9(g)U/Pd__@YN,c]WW,4R?ZFY)OB.g.6GND-?7OWCFIFU05,FV1@Z/[IYg@\;,12
GZ:_HMX[,2S[SDSL;HD>V=,dbM(Q+G,:b39g-<G-IXK>d+3Pe8.0&ND&X?6,@gLU
2NR-fL=FFS^cN<#8#QV[DZ:M#G6EcEU&bAGc5O<2:),Z<@,0^aT(?#Q;)]NF[E1B
aSU6/5YY,J&/Z8ZN/XC3+6J)W66K@#G/7fFAS]&XK3-K<=c)J>95\M_SJRVNKHCV
JT#T(Z;&:@T2SX,;J5fA??]Ab5H0MYeB-)-0.M.?f+A&1bV.]L338fIV0)S-K98:
Ya#M9+YJM/^#PG@)Y::=374gXZAG23Vf&5VbFH7c^LB@G&P4Ve5-G67fM?b^(AZ:
0fDb+7C&>C/MHeAId8:\8),[eR(]ge/)IEZgP9W90BJJMQK>Y\;76]BJJS;IT9.8
=ZG3,\[QM.ffPPcP8K&5/ZOP;FcQd0LRU>c\D9dJ1^)WACU9e_<,I&QZ;ZQ7eRSW
^+8:X;7O81:IcP.1B?&/_WMLY^EBd]6<RO9L[FT0VfLFJaJ@QWQ1F25R4BOMQMT&
dS9?M]VI<d7_[A?>[0]98^/7g:KLG=#OL=eCD?F1NG3/8#-Uf&&>08(YW-f3+B9F
Q;d&&J9=BAg)=YQ2784E5@0AgXV+V1=6XH]d]RW/E]Y.@B9=17WY(_#8H&,_NA_G
Na><>REedJSZ:LV[eGLVc1M5<J?e)BV\=d\Sa7038=I)^g5[fI1)/\P_SN/Z?RVW
3PUa^\8PWHE:Te#f35\(\@##XG-NW2PLc1P(1@4Za#>/\P2LUO[[IUE#f\^S)S<\
cgY:??#?VY,;I]K7VGD5=RESR6G\g&8bBA?G>@21OQYW&6/AR5HG[_9_:b7F/4>U
g_J_:OeP&A(HV3d25.9M4<+_Pg+df-Z3W3XT+Dd_J9UK,ARW,g4fS9?>3E-g@<2+
(08f5@\JI;5#+86BE&Y4_Tf>X8,[>093:DBV6DJ+c/B]G[aZ,92\@;SM#f>Q;8RT
+F/T;SZEV:EYJJC-)BI<#X/_ZR)L7FHIV8e(8OZXJ]_Jc)a[:f4L>QgQ&E4PPWZ4
bg4cQ[E;_228A;]&55WJFWH@gA#@J&8WZB?(H^U@;O+KgCARQ;EU>.6c@)KG??=1
ARaOLQ?=PJI8E;g60fYYc.2]MZ.;ZV_^SMZ,#5+C?Ne97>BC5,;fB&+/B4GYbLL@
K)FD/U,0K,Cb#NP6+GXgZJ\:V4>;):S27Q;;6(]HW/F]DEUWAS9NP6J:,,R5H:<O
<V,YOBS5=)>bRI(QQ<DV2:72\TR+&.53X)&T32Q>.?V2gH[CB#QI^=4&BcCDW3Z/
I[P&Lg1D<L8,<fb8D9J44AOSOd5WbRY[1E02LKMS3.TLdS8]C08We?@V(Da?f#a]
ga<EHD=G/_SJX:QXb^+EIf5g.(/1?O=3HZDc6=dFa[-7e,SQ16)RBT5/gXaVDL^K
]a5V?&12^)0,HIGI31);f[@WWE:_Ybg-/D5VTBaS99,&ZGU/XGFLba7U]DD/cO(f
4YC&G3e.N0V1[^(L=dB_H_-d,a5dbD+B0OQ9X.W^WM=2H#6I\O+FLN[U(.58ePaX
\W6+7;fg:P>UP/a?(1F?B9gMcdWK6H?EYF;Q;U/^<J8cOKYYK6PM67M^MFb[gec>
L3&^_-EAI@0Ida:bPM?d;?g,-#U+YA522?+BB-_K8(d.B1Lc3-d&-3L,J+8KX#KG
AG1&;A8S<aGd]f.:JH^KYAf/:,12J0.<8cf?ff+@?;?HB^.9YQ<3>X4bZJDfZ>2:
27>FH;aYcABEGL6;(HW/M&9HSHg3KAIMF_1gbRY)2>;@1^G@dN-^bG7K0Xed68X;
-(>Ye,USBIY^/Z-:.2^-=-W5/)\<DeTEBDIa.KTM?-cY1HD?[,SaG-7EJT:R[:-X
<7-[C__J^&&f&?5S;E@1cMQL1?4Q?Y(:f76U(>Tc6O1?[6F(I0#)[\(4D3H02TK0
R&3LI(C__WJ02^0dW:Lf.9,?F&[3;&Q[L-^@<+Z&:91AYDF@dB3b-.214AC=Z(1]
;e852+,\#ee6#SEcL[?#e1CA_45SSAeDcVI3cc:Q[KO\]>PP;,GAR<Y8K]cF8;\D
]JGA=&/g&?SR64Y4+A;dbf]]XJ9-@7UO;S@Uc?VWTS@e.E?1J9M2);X5-U]HL[3X
0,<c,ENCg1T3>]9dAJMUfeS@,.DR2a+G)H3N6L#,L+fcRZ7HQL&=+)\+PfL<4Of6
d:GPbEg(/1NZ(<\FK1,#<\OT;g39Wa/N.>1?J,5V,-X/G4NaIO6WQJgSOEVJ/adb
_3#7g>Peg)bXQRKS]c>B@L#V^8cS_/E#a59=gQ42aUGJ>QHJR0:,&9KOIV]Y6&L>
&;6C=T53,?b]7-GT]CP(18)WMc2]8)TM_H[6ORA>ZcRcS.e7X,NY1]GRbDS,#9X6
14QCOfY,I+XZZBV12eJQ3.d4A?C2^#[\dXQ\aC4THMb=a3@C<cRSc1gX?BfQ-DZO
@Q(<0=LF#93B[HA=:d(^N30YKW:0d_PJe&3>dIIHDDL]#d10e;C_\UaUEZeIYB6?
Nf8HKJ&L6;-C/B/GP7<4Da4/92Z0SJD^=21J58\H&g:VLC,DI>Y>f7U(ADAePV-#
^&fgD?B^6bb[0D<&6beP<D@#J\1+d;M=:4;Lec3N#AR+U)ILCBG\>+D2MLXZBPJL
NHcDWH49>N[]]?1V&QAd2ETZUHX@S,YP\E4+Jg]c123KfBK&a+P6_S-T+V&f9WWY
V^):#Lb@B4X1_TX>#4-]2S?=UR+YEQgU08HX+9]\7VdP=A[e=1)>N/Uec.;C0T-W
W@#7GLC=Q6L90\<54QW;N-^^U+VI6JS_\_3MV#;Ye:G0:40WB.L;6ePW8QLNbc#d
QIK58LI^-&KX#fX4Z,0H>FY_J6JaT5LfF-KgR[QJ3;IUTC<g+)g^HMGN=2Gb/TYN
]g5T&1KW&JF6[0JX5M7OIbU-+:F197J.bBS6MJ=OI549-gfMgWNP0I/RBL^2DePN
b24Z_]gUTbWe@FX>Ycb3F[d.>UOM;8;S)CY+(,,[@R;@a(4a[OF\7=/YeMPd@@JJ
8B@NBSY_-QZ5:?SWJ:dBg3\DY2^#8f(:\85c7,&8_XK5aEGK2Na-\cN8dE?M;L9&
UCI/7LYKH4^c?RYIX8g4E1_+P:[;e2895G1EOK4](/@4ABA0bWCI-E:458[\-_=R
;PWR[EDGO1_e:2UM;W6HEMA.MGU(<Dd++HS)HG;\Kf)\dI=2J>/(OE+R<YY_KKPR
DN5K?M?cQ[E03K0K4S=MH.^SdVV2M\OZeQMX0Z\W1NQ83+fC8HH0)40FcIMGXRfK
fVCO;VEJGfa&SeUfVbNUc)7fc1YPT:8#X52KfWC11-PFI/+^OAbG&Df0/M1E2gPb
L]/=QC++?6]6E1.IJfU3f080;EG-5<@ZSd\@MBb)@9D=gKITRe^W^;3/-6?3bQC6
Y^9c[Jb_6BB@UI]?d.GFMFB0_a24bUD2/_KHg7/9^Pc2@XR-N]HJG#2-T>)/(]VT
_a9Y^aNe8JQ20L91dP5WGAe<]eBPe&X,3L_=#\9PJBb^8Y5;F&BH=^SHH9)ZMQW]
^9c762K:=34Q.beT)O-F7T3&L4:W.[F<gT(T.BQO)T@]B^V5?>NLKT9;DZbHGK#g
Qg_WOE70^XEV8J^2W#SCcQ]eKLB;Qd(-L^TfNXVd^e:HN62cgP^?PA++S-HXeH+D
.d?Y3<:H1-2cLN73SK;Y#B1BNSaVNJP8^)b:5I.Y8.SgXV<851W+)bF9.P;,PfSV
cV4[G\>VSTJ=VP1>GUJRd<>_8MAS(KB/^P]-8J+;.a=>dL_\\BW[,fA&#@Z/AD,B
GIRSD=177<2[WgeJ.Ac[PKWEG:A8AB]:8ZcFREM\);Hfb<Ddc1&^-)_VRQMSVTS8
[@Gc^.F8R>=H1Z5M?JVK&^TG0;RG.QMXK+2&H4FF?1e&fgKA7823SgQ1X>Y95?<3
)5Ce90Af1376O>3(9I/7DAFM[^;:143?#ND(0GZ/@B/bS2)D?L=KY@BbHFGU:OZ-
=W[&MWagf?Z&YGb8&HYYaX26ZJL-F^+aH+eDJGXQ7\>1U/YVV@J,]PMY:DGD-+L)
SH]QYHc03e0+?A^\Ff#E-11.3c4&H]46UBd_^e@#?Wf:AIa>&Df#\-D5/(XG@_;8
01)>/62c.J(V1JRA#8DE^)]1fac7(f.WHPa&IFb.>cF0<VYA89UNS<2:;Ea0f,3&
NPNg85c:bLDUH?R);,R(A[^/BEVcdENBS98;HY),4QdddaRR?B91K0<[5O_6eLWQ
,dWQC29/:]6.JCa_cR\ec\&7?cSAX8[-+8#X\,(e:aIWP;4_&d1W<I85=72405B)
-CP\)&_NJ^MeQ[;WK[XSRR^M?:9TSdW:)gABTA@A?-d6M<.1;K<0PL@R&WN_:K9>
Hab/,<gEOVQK64]XL?5+[B4HEMeK86Ad/(1R.,J5/LA-[3bX?[AXLZ.,R7gMZ<b5
eac(^T0>3f-GI#IO<(cWZFQFU8R]\RT6)T-aHgH:NQ-+1)g+@B0,cPX,(1QIeCR9
WV2M14A/Y-BTHB\L9g.F;C1GbgLa(2S_cc@8P]BQKXFLb_CC7W@:G4L&=EaR)D\W
RD#[&FM+PP9T)bgH#GP7(FRU:eRRQ9gHH1;7P8#E](c.+4B;HJWK,QZYT7)=Y3(L
:1?b\PSGb3F22N90ZaB4-c6Ne=-c]JSWa&TC;/D@_D[EgSM/Y<-?EN@KLGL^,6E^
>;F-3N3K_WOGIC-UMRLDc=eT)f79(;TWOQfcg=_O:#]3fMPOcd?<[eId9f:HE9>g
SbNE/IQE&^a,d6bfA6&VVdXLfQ))50CSWUYd@88>7\I+\@G&e6[###8c(&dKGJ60
@PRdLH[SC]a?f6Gb3RFQIOD_?.\_fRIU4KH\EX;>YP-7C/X9B&]d3F&0>+LB.;Ue
A6aO<g1A1#@?P]S8]H=b4CG+<gB>)KeaGR#P/6Sa7XBI#4T6HB(a[P]M5OVT)OfZ
,@FE8)1X[]WBDfC4U./1O+;U2Ic]L8>XN-[NKXB,cHU7IK1KMVP[K0F>K@&3c^d@
a.SRB7(KS]gL&fZ],ff9&b0:D/R&C:<7L;-].[e7;B#+M4OG_\(6M-?\]J7[[gF&
X-d7eDXc]&PZGH457R37YgX21&)GAR[:=Uf5\:M+F-2L-66F(edQ/]6AU3X+V;V7
<e5&[0I-,#O:)HE&+N6,>CFg0a2@3S43&L5Y)A.?V[P(c5=<;T0T0=a@+0=f:<B8
G&&+aC\UDg:3XOJ@LRd85fWLJ[+Z+N1.EAW@8;M@@gbe^AT[P=c/a/f+IPOV7WZd
_H-Y.;^1^F\,EDAJWIKT+<bY-SX/.ON:\^\^gF]]&>.,Z/0VMa<d)gQSB3:bIANC
Wd0Y(D/I4:WX:X2e4(c6-7,D5>MKCV[4^2H>bUe(S&B7VeY]If)++#BN.)A6?3M0
87D2gNQ8[DSe5KY7d46+LX<KJb5L9T:;;J^7b:db#CNaV67SQ=CJ(cC&g6/KO:K@
Ic\[UM7XP:W8^cY\P4de/a-C#MLEVE#U0<a+B;<:)\XLI&MP]7,c^^]6<F./Q636
?H,Ug?G5,&9D2Q_b,Za3:KS/M:-Oa,<42]H)XDTP^:f22^BRc\We@&YML5@O;A9W
Z3UbTFY=WJVKJ6@+_D7R+&3IVbWW>0>eMP#KWT8O\5>C7T/gA+\K:?YSFGg\?c#L
A;#H7Qa:9BXK?RW4NNHW3_7GWP-FcVG(0b>13abT.=4cZ5KA8F8HGV>._I0bTbOB
3G_FRbIg<+:&?HaT5aJfP)F7.(CU^RXfO[gL(UFe>]6[YZ1W)Rd>6A([YH:&9d:g
8Ea&G2+,bBH8+4+H\,eLMeaL<7LU@g>FIeGM;1W8(D-=R8GNM/9LV-Ya3W9=KAHd
GI?GE/4P],J,\=_&0RAF&TQ_-]DgN.CH<\8)[(7>ZOTD:W5+b(3/a9D0;J(<74Jg
@8J&DEbF55&f^TOF?GW3cDMXN)g-d[WD]aT^+BMP)N6cU\B+LaIf;5(fe+H,9\eF
,Y90BZR#X2IgTUN=TXK/Q9E([aUUYXVLaQNEfE>H;CFUX3M0<#SK^-eTA6AZ15B?
9RH@MOGI\3+HdEQBC4821E.J1X[;FUH:WE3=WgJ:QC:fYS@?=5K]b_>;XIfcaL7L
aHBf,)EgMZ]dYOC0WZB:<9<]WBQ)L[VIB&\5RX)]3afLT&gQE?9E(Y1e:2I&a;^;
IV<ELY_f55V)4_N(e?#4WC33T;F2d.(A2.@W>PLac2QE_)W0//bQ5K7;0&KLJ-T.
L/B/:U90(UTBB<G))I;@c2Uf]^P5LXeg26#Y5_+J3)=HBf&J=UG]:(cY(<<c&1FC
eT4^2[CD/C&U7G_HI1_W5TRI^F#Q72g,20a[#2^+TX6QdYG([1a-8R]HCN8/@YT?
4S6B\R1X0gIJMd2;K?E689Icg+O[B;bcXPTb82g-U()Cc1P>_RPHCgPV.W3T;d\2
=K@Y>I/74&E0GTK>7X+9DH7C3DFg)T5:cLf-eIQ1gQeJ[b(,RT,EK>1XZ/:IAD1]
?8/43H_,K64@XF.<IUb>[cR2)c(@BRVa<^Me\B>)_V04,[P,_cg6BHB1=]/,K&2Q
Tc>/>I^B+DQ=..^YF_>dSKU8b15cdb]e)Z,@ELP8=A]bG\TFKD>6egD5DGPKDP^+
e>b4Kc4gbCgB<VH8HM1b3e^.O[O1-;=_RFR;8AT&DWXDC,4a)0589&g5RQ:K#/DX
W[b9BbD>>.[\U&>VVZ=+\cc157^R;dg,_8cM^;f+4B,ZM632^dO\-F@NHJ[D6b9P
/H-V:MWWB5DN0Ta<-]8C(Y6.;3/P]IX8B?_\,EdFd-1\bHF22\F:^9)[Ie/?],KR
0=_/5JD[)a0OA2CcA3Q<H1DB2>>C7O^-60YUN/.eUa6&A)AQR)+g9A1L/=9<6<SE
f_+YcW\GK.Nd&E86Q6-S]NZYJTb/+\eV4H0>3X6U6NG1N0VF?aN7GMX?6><A8^>\
/1gPX(X<_gGX1cQXB>E\GdAOS@#-\[:HG-V(GCeXU<)(R#ZV68g31Gc\TQeXFQ#6
ccSXEe4/EGH<)+B)T^98;^N?X8IW/Q5NVIc[03I4CAB.^Z]8f.b-d9(J1fL4caI_
f\9d.]-Pc]V_KP;44P?6&S6-4/_8ZA94]UHFUaCdI6[28([cWd3Ge#/6Ha;C(]I>
]d>#4L_0R/2L3ICUN_feRBR90)43JM,O?.#/P>7@g:@FKgQBIGQ_Y->3_LOfE^de
@^F6N8f8EDW>LZVNN1ZN@G_<.Jg,M6BA];L8)O=]c:L>NaXIK/#W-T,4SW^PdcSO
UW9\ZU@,1<;KXf#8T0[)23egXLG=KM0/ZAE:)_M]9Y.0:2g)HHafY7OeMZ<(Z0d-
<1&7=T;@K+A3C;1X^,=.6[)Ra&&c(ScO-8Ra#74<[<T5Q]-g/A&b\A)]H^11Vdbg
\O6e@ZFga6:G@YcfE7DQRKa-KJ^ANHG@;,aBT1.XJER@-fIW.=A8<A.V@W<b2DZ:
@[;:IYBDJE:[RD@79ZT/d\SNTFB@N6Z7+[/fR^)/8@Z4&FR;=X7G.]AD+4_Te,,W
2@AJ=98I1.Q_:5LRZ>CM;f7<gGTY<=aEKR@Q(K[OY4M;20R18F6S[E-Z0ATFgNAE
XERVI4CM]0aSY-Me+X+NWB^8)6Q[XS]7(aN;4V7.7d9KYV:.2IK?Z[;C:;,9^)];
bfM(1SI3f8K6^@>JK7>+cS?.G4fF]#b+SM,Cb_0-e+cSMVT;C8A[S=g<a&&?_14.
fMR;bbUB:G41&GG#>fPIPdKX?J#;N/?b<ZgV5^@QT(KVePc&K2PU:gNGZ?KZ;)-N
RHaMJ8?AW+),NK/O=WEI,-HYcRZ:5@]URfN1I612WD/OB(ff1?66E#K,a8M#0X#f
E0QKE\/O9GV&.(73X.-dI-D+BF:B<HgI>b+7FD:KZGYL[;A/H1XZ&eg:Xa6;NABW
T&88.HDAfJ6a3@QE3CRN4YICMYHPG9fGU]b>32.K<^-eY;7FX+@:4#&?/d<7]28J
Pg)QaCMXY8+ePfAYV#=>86T0+ZFf=UZK9;D6_L+0fSUQ<7KI&Y\4>,(Pe4&;F\2K
>[CTR5)&W.Bb9>8,N+,Xd/3M5(SFKS:A:b-._Y#>DF[S+_LO4/d1;fT0TS_J]0K3
_dU9PF<8Y,6_R5[F^^@dT-)KaB.R0PQ+^B^<D<LQDLTc)Q+STaSgHV?DRdY@TIcM
3<7FK:BM59O4)4b@I3e2JXV1??620^O7<=-T)VAD>.42a?_#ecGaS+6>V&LNFNWV
4T^_EeO.DS\\P2EYP70^.B+[gA&4YVK/CTfSc(5.TJK4cM6L2]Qg,\1@3:N_f[:a
D.B/,a[dUC-gZ-V2aFDWa;d]Wg+2U:XQR]4d<fXB&CgJX]+VAHU3IT[-dcS-3?5<
Y(V8X#NT4Yaed.N.0Zd@+,(8Gg<=?3I;MgV]R/_K#>Z.^0@)<^=+UO\7LA]9B[[[
\\3>(V9a^=W^1LB[N70WdKdK2B977<cM.4Xb>4#(X[#<ALVE-<PW0beIc-HCFY),
Ae,_B]a[@U25@cEOL97bO=f,EG5D#e^d</a1K[f9XDZ-Sb3.-QG^\V/50>KEIDNg
4+f#@A7FSH3^bX[5VcM,7:N^,&bE/=SBIcO(7.dK9XM]U1V?1E&1M6Y26Ng7)03#
_J&<aOQV,_Z38N2,=TZWQ=Wb^>;>@edAe]S.5;1_dH6RAD6AN(\1K79T@LY_7H+H
3gO2/f8@fcPTM(O#+V#:J)9Y094&bfLL@B#AD7_:[M-2[Ka[<-CGPg_5b.<:]GJJ
]Y5)@K1N#R26A1S;H/1T+=TZbSaCC^PX;CYP7L9R6=7)a_??9\JdT>YcR)aPW<L+
=+.2BNQ1K=W>#9D,I0FJ66I=N.G@URc6fXS=F1/YW;gg4_@;CD.d<MBE.JX>-)\N
SS3I-R0:TG<2)-JNgL2d@H1O4GD:]aHHOA3F24dZXcbQ.Y5d\06ZXAfUFYRe9JD6
ERTRIV=V,2]4V-=?;X_#(Da?3BS>gF<c(FFM=(eKGgG9,a939Oa?J]Y5>OB],;NS
U_7@<]8/KNX=9<V==1AF,I/Cg\G\/L;>O33Ug-ESbWN]]8gN=VPP::&[P-GPaMH6
CcY--+RC[G<\?F8X6^./=^S]&>/NINeYQV#O6[9TT7J_QCLaN)F_K#JOXec=LVED
5GNC<2AEONP1g_V65XcH..g=X96+<I+,dSD-KEW<5]f&Q,[VgU9f]?F^:bPAZ@^?
R4VX=Ad/g>(4X-+(aRZH@P&bC&AdU[8D&QQ)dae=7:OA]U(.b5W9R_\a[5O.DV\a
29@gY1+8C.;3HEO>a)JWR_,D,T^OPaZ5[GU2Df\dD;H5+3cH>7]V;:1a&:N\SMO[
L@d38C-XRg9F0,TZ/:EIWJZYcVQGUHTV;[1WPXgI0(^?D>)Q>3FBM^.BO=-MND.d
>V_\>3ZMYdZ?+Z<U/3b)I>0;O,12L/+K);O:MD[<7SdD);[G2F[P\Pf73VSd-EU4
_S^)\Xe6<Z9-fG?M<M]OaV_#VfEZd?AV.Mb+ef\\<X4dGFG,8M+:2NO>\2X31;@d
S>RbQD9&\<L3gGPObZ(XgSA[:?3QJ_2FG2e+<U8H.,U;YMX4#DJ=JZS)?E(860e\
Q-/DU&@/=,S+9=JD81L[DICeg2JK8826AJO]NM>S>X#^G4fM@,8Vf=0SV+bV:9(-
V_3DeQN^A\L/ADP<X:O;dc,>Dc1&2&8X^.D\<^S_7;LJJ#\Nf2>>^f@>J9-RRP^X
+^FCL:FM:I,9?>4JD#a<.W3=AHd4g/-f<e#V,^SHfH^)1<gGfbF:d?WD.+K:]ea_
S#X>(_P_HNeNbI8/(8ZN,&O(GD/(54d#F>8+>NbPgTX3ERHaLANW+g].^aTGd@H0
:.>CJ-<E6\M)ZX;.ZQ+&7FP.7^-]MbO1+9LAWFMMMg/\-^G-):558>=8C]6aFILe
A-]b3?:PAI:b+XRVOVVNX]>#2/J&MP#UCLBCUg1++7(7,WbL(&I\GI6eR:<YMFO0
6<Q@SOQOCGMDTX5]?]V)YT>AUXbKGO;XM:_0#]H9,Ie3)a8&b0G+AGVAfDeRTE=N
<-f,&S?O[AaJG?f0[>^/X-,Q/=X=OUB[A3UCOF,JBd-)_U?f30]gfT6)2^gg)<97
Z7K7X^2_2+G3H;>IF3#U;UIN_LEG,ED/\^(#]66YF9&;ff\W<=;1<E]M=HOX2?0^
L\.abUf7C7R-ZX/93\[9/KI9V\UYD\)E(1QX)W&fACEd-,0?1X+#P2R?1^6>F[JM
0cH+0[<Ta=H0#dSaOK/b(3:g)/#U=#1D-2]>-9cDT(#+>M@S<?GL7#5PCIQN3.8/
GOU1T2/P#^7X2L##3b^Id8JV-:X?=10d6&@g1NfFd&6f36&P_7O&>T3GZAC/M_#g
_@.gJ3.@-WdEC5=1+(7cV@YZHP?&+UaOa7G4BRBMU\(dD&D68AK^G9XR=9Abb1WL
AIYDgT?Z6@XI^TCZ_58ZV.aJ0:5(?H:AVC(0NfFI=D78?2,)F6W5&2fG-a[&.d4V
MDDP_)cYC7S(DXR;SH1gMO_)<>,_]LE\13cb1Y3TV0f5]5]DM?F(He;E274Qa;8T
0bIdS7b+LQK3X5=EJEf7DFOG5+YW7c^]RFT>V3>OW_BfLT3BZ#N_O=,7V&AV@Q21
a/TWeg[A)L(]1TI@2Mg:)b77=E(@7C/;eVJY=O2HW9YO4T2LNgW^2J\_OV@JST3a
XTNS^&GUKe[(cdX+E?1I-Ae-P27ObU[C)SX8b4YQ=L4=5VZ7FINL4.UQ5.RJHc.9
U8fBRDR[b8M@O28,LK;[J5;)<I2YFLY@61V(bC-?eaA@aVbd3ba-cMAYfEF<N==6
42=U&M3B7T[7?BOcW>X&MU4ZS3C.FOW5<V[ABg:gM/M,HBHLTRTU8J@eW5TN2\^F
^2G-/E//0I?)90;QUUM;+XZZK3M;9Rd96ODA>^B+;ZXf2RDR2>P=Peb.?DRCS,S<
VEag=Wg[?&VHAL8YV@O_C(?])-D-fCAQGQ89Mb&>g<Q5dD2QJLV:<_b8]5eIM<IF
#I1N0Z5e#+7O(f/dd(YgJf0;FYX/?GE.T+ZB[PE<2e[C]CaL__cSQA,EG<)>5?AX
XeMgM^X/_9<gV.f??Ug/_G#Y^SG[S<9.YbVGS_FL2C(5g1YU=.XF_Y@A0W+SGZ&J
e9Q8JI+(EC@EaRDR6Z)4CKGbF0ZF8R>111SZ>K)?LA)29#8UM_:X(HAS)?:McW\9
a;@?J_1F^N>bXAa@4F;cGNbRJ)BH^?Z=O^>,@J5;6P77J7VcK^3)ZEY/9&Re/HIb
@-M8\Z;,^RAK)B0TI@O4L1B/#;NFK]^:82.,[0gM;PR\(c[13>>MX)Wb)#EcIB/,
ZUI.\:f3F0\D?>D@5d1d6e>R8A5e9B.@1-E9AH85]]+F<1A0A8Y@WZ6(CV;V:H6Q
0<79/P+eWNQX4JM]]8=,=Y@(^X^]#8-16IWA2FFQOB2).[9G;?)c&T>b/@:?G-f<
I1B:f;VCH#RP3/A:/G28-RdYf6J;g_ZGOY,F-@RCfGGIHCG:O0McS3YO]O<e;>Y<
5c0bgP,eGEH^TQ^))]^,_/G6#_RM\RL&3O5C->)GL<JI.g5WU?-76c-:MUP8V,3B
31KOI.)X46N?3PS[#f&;)(b4a]:<;?HQ)(CO]@^@O81-QdNC,+>T@B^1Oa&_gd+E
Z095eW;VG1Ne13,1;/J-[1P;&J(QTL&]Vg297:a8QENEa4SgJQ.We)/Yb45cDXIG
^H<JEYG^gcIAMEA8#)Y,K7\K0Y/81=UUA@9[D&Le&41#R&[Y30g0bQO1d&aTBCKe
PGW<XGg=>9GGAEd_<MVCK=8U.\UZKY^bDC==E\8cc016:\b3E1E8J39/<B2+\4+D
[7+^IOO?7[EE)EeR9;\RQe<3:3&V[F_XAW)DP(H+2(VWa:M)#;#VA)@3Df2]Y:IB
AJ>&,efXR8+S^1]W^LN)=H@-b@_4MSeWY/O@XXN8@Z)\-0R9TM?6S+99G8MFF\]/
WB^;]e7^=8;1B=>T2B?dQ4ZX3]a-6U_W<G=POT>SYKb<(1T>[NFTU/IB?JVD:W56
[;<NXdE&<fM4[#\^&Jc2T^;QT1Wg(OCTP=3M(S)KQe8I#4#2X;RS.U4U?ST2-(e#
[X^.#KQ3bG0OA<dQ#>8RPQ3bJgN.N<0LQ]WaD:3-M>BP.+SJ1-UB6<1(-#+dX-1&
JI4AK.Ja^0WbEfR^L-J@?4^VTWY&bTRN1UX_1K7S+a;47[ZeV\Dag8:7TB-B<TeA
-a#_.8&Fg6O]V##PV,.;WW&RCE=O]4C/M&I_USKVNZRNP)[_H;5UJBg/1F_Bc^bX
\?R<9WML06D::L[W=S>7L:TM3XeHS(QdY1:,^(VPPb+6K5K^&Q8^U(dXOgg(91bg
Q9-g2&@Mb;XEMQNEH#<6SP/f8@bBbeUON:CfLO[,#K):2TXNRd+LVUS:)>GIVKe]
?B9H5A>B9a=-BI+D&-V#?>)-7#6+8.Mf_A8M&>eFH33RDJ?8^>\f5LEgA-24S0?=
3?0&3)T[5:FC_LZ7>-:3Yg96OcU(Oc#aKT6MbEW38:V)>#bDY/Fa0UeWf.(c/\63
U;\=1c?-WD;Z@+\D@P<Z\(G28A.&^J;B+K-^dWT4IKLT(5Q#E_-Z?IC9T;,0.,TA
B_\4:8(gXgVHH-&_[Df8Rfc]/ZeX6G6b7,STQd;;C)+HE=/;d#;^_DDW<8QRJ^/L
bH7XT,OH8V2K_>IJU1(;>6^CcY#1(8<,,8F6-K;/Y^OUTF0(IA2XX4OJ^:C3gYC<
d=^.1gU53SC>C8^,U7ZZ]K1:KGSZD@[:dF[(ZJb0+6fX+:YI#Y;[^B)BcQ#Md.<?
VC8&4T64W\_/S0>V):SV.E?Q7S@0LPW)MK)XCT/c_@6M4KMNdc3LdNX4>XI;>9/E
c5d=X,#0e/B(64@aGea]b@^cPeS>Z5.ZC-gdf4F40Zd@Y>4X0Z#/<d?b\P//W<A4
Fe#RG\:_Yd8H\8>&R=1\E,e-X&4D^K?Ud\.QcSB&6#T)_BS9/;e5gU(D>QbM[b\I
.53d\>GOaGA.Y+<PM58UM0YGa7Pfd.c^@.gcW\^0aT/T,A+CUcGG)]:#9ddIG-+G
;aDgK[W]e&0S+dBf0[:-UWVJ&YcY2/RC+?\5,(N-XA5T>41JX2>5IdHE\Q5f;E41
H+-GgM3[2LU:.G=>903]a,M(CP9=P6,Tb[T,6f7-0<8a;@=@f<2.X>&B3&PRcZ-)
\<ANc&A#YJ(?JG+e_H&M[7a\SQ&ZP<WBKO6RRD90[@XC(eNe1+J209(=#cV#GU0V
.5Z)QO/\1cRbM.MS4H5-\QGfC=G)XULVJ7P9P4.[3\fRU&7[/?K3<;+O^3:.+NZ#
S9&L5.dP7FJX610H8=4bHDV\+R6D7N0\2#fO/>bK11(JN;U),2Rc^#gT8NX=GQJH
T-=XPBY#Q@Ic&WC=&e>9A[?8fULdHT2UWg;2(IEUR[[a,ba-Z2VG5,401]B3WFK=
38W&6=\K024I@4NW>_V<CT#C],NFVQ11N;dQGV54g7,a;f1&PO3#>3W0IfSY?<=1
;5V;MT7G,2gLOH1D.=JD3+bg_WKH5TH4d_&f+Ye#XP^?20fK(6<I2aE,Y#bXRIAP
eVfJ_ME).S_db)@:G))6TY+T&;GS_57NQX3#S[_KDHF4aK/]4/6\:+4PSgc,::GO
4F5UOE@U?TU&_Ba<b3XKB<MEM7\e#+CF,1gL&KZ(0]_>ZJIgX.ZE:a&4>F43E/3,
].f>7[2V)e7+E0\-Ba+/GI[(Md#(3PNK_WF^988O5b#[A]833RV-X\>EW[P9a1Z<
DfUHYRIbC;b:a9?1,376-WFa,X[831(c&?O2=Y5W3^_=<9f2gK?4/=;\d=RS4PU_
V-+-[IW3K0)@0GICP=]4U00D3[6aZ:SNFa6+[#f^O?e]D:V>K\.5]]f6,fF4]<:.
0\cJB@1\_GTI0AU?>-/RS_-5ULTR@gS:CJR:7W=T.ICYBYOABH8OQGXSf)HM+[_@
-U_SW<TFDPQ,=LJYXN7gGW2b_2-T<)]<HKYX<;b:e;1N_c>MUI=BW-CE+efIO)AV
</\4FANEF<Y@F2CH<5AJg3MSRWY;RG<00RS:5.2f:;IO(#b[eGFea-H7JEgZU6Xd
,;8<^:FFX,UP_)=_ZA1MC\MO#L_M\\?G#.E+Za@-+eWHZ3K_L7<9=Z)C<7/TbXB]
LT]6K^XE3gfR[^a]_7@XPd;Ue4M?<5P_#+f4OE7?Z-B0]cRXL6#J=O/RVENdUR#A
ETdNZO[:b&IcaC_:6_G(g;<0UGW/#-g=-O8KOB@6HWZB8SRM9BN)VGg5Q<?&9MO_
<@9L^d:^>SX,MQC;Z3+3@\e26(:R6(cWaG-@Y1BOLc3(I(Z-;;[/DK[6:W455RGL
?@<=/.:8\@20/B&(LWTHGEN:bM]?eSKPO2FO49Pe#_d9/JM0PCQ-EQaCVL,9(&A=
?)@53Ad?3-UYc9VRT/F>TFaAK?VRGXORD#MBI/_H(719VV#(0=Db[B3aO/UT3-)I
I=]]1?[,,^I<N5@@MJ[)/R-bX?#ba(E.e.F]a0A6-3515.NH(HQ0^.Xb=V4E:CHb
1d(RVP#:OWX0X]]\S.&ZPg=0S1^.E#.A>H_8>WGPVR19D-V[WMf@3C42R(==L0df
+.CL;-M[JP>1=/ae:cHP[ag;eY:XM<W,/_PJK7)]:YDH[^;TaEEgQ-\.HFGQLG\,
Q0J,K+cK7<eD].AVSJR.<M0F&D(6D-^34G_65U#.)(ICU4JM=5[X-8L&;#<g[;14
7_I0RFR_2/5eMLffT>8/4W#_4dCUB-WLO/e<J1;[0FBd4f2\(7IDNS^Y47]68JPg
96K<X3ZLO6M&-cQNd@OC-)-L+R7>L&^(NaD\,-#0AN]^D_X)E(AV#LMEfV<2e(74
^=U40A^>X.XF=ZcI-0F&B5WC^_0E_;VD0?02:506OUR@0=.3D/Q>fa4f.9I7>Eg?
/=f^Jf93@aNcF[cg6).+-#M>Fc325PO9HNfH<)02CSE(@^^geS6aY@/E(G>TfIfA
.LXW\30O46PJ@.#f4[.cGIeJ7#U06J/24A_HNfU4A4##Y>HZ4LPN;9&gI#[A95CA
ZFEWP747b/Q=f-XB7E;fMOZfG0DaRfSd-MS0X9(QUCC#3\SC?5(R#KHF@c-e^>Aa
bbA=V&-9_0>WaFF&;U9EH1[g)6X+9BP^HJP6EId;LEUDR9?3#_Jc,W?/<B-)5YL8
W>PBQ&IET@d/+NU_L/eOFQX@c4_C+gb3C)fPG<Y&)O#^V:CHD\C@TF##dbQbd__f
S20<.=)UQg\;<65T@(g@H&/4W@OZfdYW+_AAdaL@?;#PI^>PYASQ/JfEG5:&,FKR
OG)P>1U&0;3?#HgCY>gg)39cI+,gHCf;:Y&.>c)M]/9;(=&NeX?#W7X<Q91I,):d
eT@eT1C#7-e5??XfIc7#C->YJ_[23U+=Eab6UFJ9e-eLMfI(f[W>B6R03;ADNUQ2
32CD8>.,#X]W2-]R-/^6C-4&&JA27Y\>b8>SW)[_^#>K[#9J[U@1D_PY-OXC4Lg]
HIHNQ(M\=?@c_0WBUW7RX[SN(gNb;d&(Z46RM2.K?=5O.B-AM5N4+AK(;d4^+V/b
_>eR]ZZ;TCL6g\/5PRNS7N\(\OZY2L&D6c5dIf2\6_OKcHV3B1J]2XP=KI6fPeFd
1YeDS0I=R:EF>.44_Ad48a((C.c3;8UQQ,FRfXX9^0H:d.4H^_a4dH7ecdEK-54]
R-^V+#;+&,Bc&O,1cbMBV2P0]FeK^LA_DJ>aG14EH_1VP2I[.N@/ZG17\J-JRCdL
M:,L[?H@K&eVcR7HZF]I]L(Z?AJU\\.<K2T#YF.G>],VKEOWKZRL;DKS3Rf#/[9C
_cK^B#\e?[&44K+]<TAQGL?E#J\NXbRb.?dP+)1;^QV3.ETNPI3[(g(e-U-,4BZG
#Mf\9A+:PR.[&)8@L]_d(6CZ9KE=@c.FcTY0REDT\<SY5T#gNSE)M>WR=JQV3O3?
:Hd#Q<SO9NU_3V?L9Cg](7<Z2,Q@113C&5R5]d^(^C51J(NK2a3N:@eE../6?DOK
KW_L<&N,5B@OC4;IT#;PZO:CcHP=^TISA)ACO_FgLU]cX:O#W,<5eP?+g)S7Yg+]
NT(UB;V(D7;XJ3-N&@47C9-#KB8e(/TH_HfP7K<,6Q-,Of?\22(W^^DPV_@FHYRS
\WRcLacK9Z-4UI=WKMRTKc@##Me@UO@F5]>7M25=<QLBPDT-Z[WLSN+G>>>b@CGD
+>3Pdf(d<P;9KH-(FdV7_VH:@NX+MdU8-\-BN&ga+EB4/O9JbRC5Q-/YSU<SeVTZ
PSYeZ^fc=baJ,TLEM>T?M8c/D-=P\3^65O(UDM;6,2Z-C=6,D+\U05bK?BT_G>N0
J6ZOGEM049\TfZ[<@X5:,O0UFgLCIOBY2E_N9FK1/(_N?OP,a(3F+/c3ad_7P&a;
,NGc<EH>)[8RJ[1Td8A2\M]LKNdE9]UEIP2?ebB42U1-=BATRIB&dCVLT,(4O5Qe
Z=]VSeZTV5<@<Y8ZU7VA0G?dN+Cfbg71/&38LMP>f/&8#9BCQbO&DA?(d3QC/PP:
;R&6+@V4bX7)UCLcR#7G7P6MWKH]U=+>5V9J21HMf[-.W;,P-E<QTQ)4W;)_DS;N
dOU5.+dgU:/KF]0/3fVd\B(?PTC94?DcF7J1^;M=N8&K]NfNe+]J&DVCAD::GO?2
B96ac#.RE-X?VVCY>D/LH.L]5:TBY@cPeX0g5KbPW\F<&DcT7dQXcWW@Ma;K^#&6
2V_1O_N8>;T+Q7V?3>8\9RT0S/G&P_@55?c7DVe6YcTRe))/9]U3&cP@c@RJE7PH
BPIY+VG>D1,EOH#B;J/U](FGg59])24Y.B4b+X@CceJ]K\#>Zf.^KF]VZ,>FX@TW
NBNDeC4I_0#/EN2OQ-NK\7Lf5&Gd>fQER8=KWLR&S-ZXNMdJ,48YN=X=I]=dHQTV
@dQV^<fR45D&/PMFUGC@OaWE^E+GG=d5,ca1fX&9MRE]OM=0K8?f@bYGTE#U]];D
0/^6K()aKF]HFN&eI@_>-&:-4,b\^NJFY)6=eB2#/KNX6QN/H@G#@K@O<<@gSNAM
4-H5XHFJJGNaH(X4.=F?E(dOS3gBIRaW5LJH)K6bVI6)c[NRHfK=<6QO+8b)8\-[
fJ79a4<bJ[WN:J3X&b;6G+3a(1[LT\dGOJXLV4b@M:@P>QDf/:BL---&I>HI__,.
@(]4D</_\=)NPQ^TN\dP20PR\[C818VYd6.^IYJK<^8:(X/Y_#fEgLEBHd&a;[:,
bA3_>Xa;[W::G1[9Hc8814,02cdg&aR<g0R3B2FUd=ec.];VgXcB+P6&9X.+VU0H
eWP([3::/TXb#9C(^/?fB+#^dFeGf)XL.)?RYX/#K9;W)+X08.+^RfS=K)48Q2J>
U)-]bb8EGQ9KgRUUIdf^-]HIXN^R4R<@=FdEd,@2MN2gf_-6:d[G(J4FA3FF1(0H
OdMN5]DNE,VOggA(gT^4&76^@8N5BU&BA).<<1FFbAC47S9G@24Fc.D<3F_O?[3f
_1A\\JLK51H99VOF>K-78C5b]O5V4@D_)GeZ@27=NM70:&?VLKO23BW;\56a)N:6
K-VNQV^;/Fg44_D80,[M88WRBGRKU7SfF<<T\,8:F#WCM9#992[)KYW-#aJ#VNcN
?g.L4=c=1Z1aG^+KY#D>C\-cOZI??VF-fKXH(;45\SL/^F0^5ZPY8Y)QUg0MLBM@
6CLUQ?+K(KLT#f)O(d3ZP,4,,7gAP[66?5G8fWFO2Z>\[+RaIVb6WQ6\^gO<YBZ5
(#U,@F]RbUAZP2:0bPVEOU;[PYRV\]@OL[D0YCZ-BZ@4eJ>/JQ0F6I[#b>;YN^6:
K[Z;9CZT+D(QR]^A4d12Qa7TJ/bb5WVN(>?>[7:.A)3)g,J?a4[TMB<]JL&AIJX6
5cJJ>.-\8+/cGDRZDY63]eE3aeG0>4V,N[dB8OS_?bO\>Y09eMJCB]]XE#1B#H&)
MTHLR6AgTJ2KSbee0^.\(cXfN6&PJ@e/P<3R3W[.eFe,=2,=2J7FV^BEcD#F2(LV
-]VYJ/baF9#Zb;R+L9UA^I@3<=^VGW>FS4+FY=Q9Da(^SH7+Z@BLAI6AK[S)=c8A
/V@c6eM]5]HHM^X)MZO996>,V@HL-)Va1HCJC1Cb8BKH#Dc9BZa,A<5d]SE3UV/3
UOL-Kg??3K[S?VIeDRRKfZg]-JTg])NGAaQ@I,#R\gG7BgIa4c/H]gg9]X;3]<[9
;N+U?1H:#?RgB,=>:S=VZI6YT2_[a-WOX(CH-.2P/&D(#NS][3R;AE[A]7#T5X;.
)FC3,0C=-#F#@Cba/KbV7P7cg3[W1LC<S?_^VR;<270EeVI),</+5Y;5ARP/(M[G
?/GcZ9b9.8&TbPJJLMGELP@FFK)VfN(0V]Fb24g:X8-TO;;84V/SG?&H0aB&gYa>
QH;Jdg^dU>P:J]:TEDS:<Rd6^]_;55M<FU#b#^UG&G51:@-&5a8W3Q>A(BWB@-S8
TF4][3.L6I_JgJ>5P#b#;da#dRB\=#L4a)U:#GTK;Z0[J;CB]+&J&F#gU#A5#Q/(
R#TE27L/TLRJ>@/96^:Y]Jg:8[W[>M=dbTT_[\U-VI^aY(PC5]B(Y@AB8cf1c[]Z
cecCB6]MQ+f_bD7<Jf/beRaa+LO4<&G[<QAVTdfO_ZX9f--_/;YHID-DEL?F:I\.
K^Ba\aTYYWN/JFYOYC0UYcTfG[KFXbFeRVCK<F0<?LL-.B-L(+g>E+E@@2eA&d]7
(7:QW^6?JX-cLL;C4@>^aLe2\^??C_VV7=)(TbQUJPZ6,4S&eeCf9RE4:/(AQ-V[
SSEO]#\M<&bS,^PX<3d<5<5BCWI;70#_TV62Id;\I<T4L[]H<]_IY[(/7aNRLe0a
Q9aN[^R;gQZF#,W@eR?Z:7]DTe34#Y4eg(1@9^/8)]URGPcRgdC(W2I:+X]NY1AL
O5CH#TBe-FN4)MJ]b5>(]568d;T;\]L?Cf0f26X<gb:47,L6]e+7LY8V5W.fKNF>
IFfF5H#(/>84d6EK2_@8Wf0&@\.c-5-XRc?[+UE)ZEXfbaHd4(_CQ:,#J2.fF&Y9
GZ;)b^;(c]eWb71^1S[4EFcZ4<GG47XL=Ee6a(B,eSO1ZK]f,GEbRc;ga>?Xf.&W
C:@c3C=2X<H/??2HH(c(/O^O+\<?_SFU>CZGN>e#:[U@,=++YNeTZRMGFJMO-5.+
Y]HcIaY3.Y6VOGE2BSEd@fA8ZZXCMC79<.bc(ZD^B8&<F\OEfO#C?D(FX(=H],BI
3.U/dTggadf5BXBggD(GLFJGTgaV+D?ZV_I6S8;,F/7^42K@<A^fSAX8KRY&;<33
RHa-ZI5Qf4Tb550^e&HgHKc^)5a<=_V[^22^>GCL_dNUeK5/-Ie_,+_07L)/J=.4
[>1?<-D,Z+K&7/G@OB(PH1X5?-<ecX,+:@+,+b+M.4F45-O#B2D7N7L;[^-O>0)N
M/A@[:Y3_CV@]S&b/,W4dE\DWRZ3).85]+.MA(4&XP402OWa8#2V1#M;D]DP_fH7
_SI+_PZ=.,=(&.YS]Z6IB<\6WgUCKNHCDe-5WeMa8e7>58T2UG5.KcRGIV2G_M-@
]+_UHIT,LAG/c4/:gGOB[O04,PM33J^)Y5D08;)NQb_=(Ia2/K9#JSQ7G3(Ca1Gd
dHf[1)g_6J,X3#LXPV<@(BDA#,S&KJM2)5PQK4YJe@?cZ6d=?IATNW+Y)ML<EPQ(
MYHH<Ad/#2RU?B)Z)f^V?^aLdDVe:0^BgGO7D[9b-?(C9Q/c8N:J+d4^J&IJ?MS0
R8C&8dG#JW;704+[#Hc4Vd[/;D+,E>GI8+SVV7AH3)HC@3??BJUQE2aO&1,8/CW,
VA23G[c[Z,<PdY_e6DMO,,P;S+GQ).0(aT?K-P90?:I@BV2?K^(0+&e@AE40K0X?
,@>7b>Pe4-C6fCR:0a?V=4;c;V5:E2J06T@#fU>=?C1]L+\25fVR/3PAAbG^0;3f
+LHAcfY0BG15f>T)OFOUL/@68]CMXFI.P00URC:+.XM5ZKZ6E+E?3Z@)+aCDW8Q^
gJ;#f5D;[]8\bQ@4/V23[P3;U@UZH(^OUU+\5<0#LNX=\DB:7CD^I\.GX4_-H.^_
XN,8//WQR@4@6[^[ad9)F,WD-f\&BQE+(9:Ne54UB7\f/P@:f8L-^LO[8JBX&(Ac
3EXGL/4#Ja=XXgA.5@HI^W4P2PC(-WZG8;dF=ILY:^L>KL6P:?Qg1#Sf-.9@#V-Z
B0VaaFLF<^=+7\2J@DM=&7;P\/bR@DAL1.04@RQZOS.6+&7P79;ZFd]#T1RJBXe@
]HRH>Iac.G1ER,H-_cAQOg-(HNNePNR(W(5CC8QT4\9ab(<a^F&DA+N#aF60IJQB
Ob#gdB66?=]]@2UH=cgK/,dAQ^^?+ZX5YX[GZB;0ef[V#@IUd#0&aE+UNf\HINMZ
9KAbU+(R@XH7&+;4gV&95KJE5fWKOC[;:F-=BHH@<QD^ZD-S([g,CTM<9=3,,--R
b57(F3@@->-Ldb=Pg::DGIGG:-F\Q.U^QQA.@]NcT,7\SL6[Ub\a5O:V5U7W[8_?
<M4UT;5N0.M(7,@@3U#P@_?MOI[N0P_N6\;#Z4-4g2J[<:bF>dVG<(PO.B+I4WER
dDM&)C4;f>+/7;3,FB.R>J+DD1H&Ne@;AYD>0R@BU-d>;[:Y1f5UB1R<^JZKW4Ag
:I41.Z2,YQ@c/G/B;FXbgPPM(_5ZIQ]GLgg+[dJP7J.TK^3Z)D>CUL\@3+V?NR[7
Y/a@9X3c0@V,1X:]QP@?9+QYfe9+3JI<aV;GW.9MG0RO>I=4<[=U1LO0abM)=252
cgBUH;e#JOC,K2L15<)Rb3T&4-]3F.7WSe23RcKSWL8;bf]R[JJ#JFX9dGUJ)H^L
IJg(S\X(4>Q/0EU5VQ2<4WS076I>U=U2f]5<7UX30&gDN2^0dUb1ScQab#(+4[IW
I\D(#+<7?:aS=Y.1GdMI6:R&VecZM>5->aYO[(;^7J#313MKNCXY9=440/#[LM>0
BIWa.GA:=1NC)Z&&SLHK;gVbT2Abe0?<434-P&gVE[D+^UO2e.I2/&@6gJB?RF83
7I3N8^0c<&QB4&:,L6B-&GR<]&3[MO;,:e_ZJP.3JVQQZ@,WBO3e)E@F88BA<^LE
-JM8Lg;QW][N:9Z?M#:ED2Z=R__)\UIWaa6.YVNdCF-W49HfPa@,#V-Efd.6U)\-
5G0TOQd:#]IgQZ:.=3N.g/eB[[^.\PWfK<5#Kb.P;,3<ZYDEGB^IYQ3;KC)_[]Cd
P[M=)A62YNM@V6F=bdVY4EB#)8dBJbI4N6DI)MJT(KX1]^[&J=;LH1g[1Q63Q_9R
DcHG)3V0;KR:R>3^?,G#ZWVYIeaVPC(K4@4b9b7E\:@1#VdW4+_S;C,H@07K0EB.
HGa=S\_IZX;5Wf0efgYPHL=NAP)IV>0<J]I4HCecEY)f6&BTG>I#6R+27_G\NMR.
HS=A14?70;B#G4P_V(T/E1b6N4c.[)^4VdVDf_&4>#+,RGC3WfS,<EPMI8bKX3&X
<NSb@@R<#]6b^e;&3b)+aV>S^\],fGV_b-93VG30O/E08M802b/eQJ[+51&5G7FU
H[442g>K6PFgYf-Pf/S:M;AbH2cKJ?NLJGPe)DQP)e,7M7>,@X2[U<6A?CgCA0UL
B><J-80g:gceQ;gI7e8d6,AYT-7Hd?&^7T^^cJJZ>W(GJRT7c7YA]T2\)]_U(=DR
HJ)e]-PAZ8#N[_8(g?&:N6_T[6Dc+[5]c4/&a3WFd\+.faeV(V]1DHJC08MD,g)S
<1)-XR4XA\R5#G=PcKCdD4_NS3WabIH0_@UAX#HC&C>V?]SC6RB.,DfV?R2V<)4Z
MUU:,_c?+^,O61M<4.Wb1S.R8;d;Wc?F[Y0QcVX5QOHZgFH]]^C4R;2RZfLf3QH5
Dacf+UTJFDUV@XbBXMd?X(>7@AP),QJE4XAORg=75;Bb0C0]X9]509VU>^(cHHZ[
<c@<N9c4bgT81:.T>=;=Q)J#Gg[62SW-H<=1UK>+D]E(D_5KV;-BDHYI+RTcJ^dD
TVOA8c87]0;IUE=HF/;DbPBcDL7QCe?W\dGN2b)RF]-aPaLb^:O]9@W/S;7EZ+?<
5a&C)Z:K:5WLH=EbVe1,4:.QTc>AaUOQ9RU?3](5&Ne&JS.^IU3L.cK)2D:f&>(0
U=#+Bd;14Y5aF/.-[f;60[7&P,-/9#eW(J0JTg,gJS>)dPcf_935SgE[cN.#fIG;
GURAb=94(SX:+;C;PIaaJeG_<<VGaSA\;^&6KEKC\Cb.-U7_@ETFOT^[E)(KX7e\
WG]GW4>I;HG6.IO7?Q-M)EK6_DGZA8WR9,K8E.dRJUQW>U@K2g3)3_TEPXV?2=EA
4.SC3T;^8R+;/J_gegM/@5UfaJ6TfQdUBJYON498AOb,1G1-0ZCRE]0\0^/X<+HD
EQ:)9XW_.eED+?2a(6=:P]9Z=GXa6-(PWB<OVg(_5>02&)HFcVFST:F989+QeABL
ZN0ONVA9GZD<WD6#(^YZJLW[4I\:5&9=c?:3M:1IC0<?F8c\1<JE:b#eM3)SZ6_#
Y.eN9d198T-gJ6IU]CWT,]/M+3GWL7G;GbZHP>&I#).^,(UIMf5I&6gM:7Y[I09J
ZKEd,CKGUd@)a[3E+J]SfH]A_ZT+QBaM\#[NaV7JOT2]71ESR:,#f]c.W=1H0:F<
3\0[FKFURR4\6@-[JUd,B=JDN:ALaF4SWO;-H1;#YbJ295W\KI\V,W2);&,6]<-V
5V+9H8+?WbNP0>,0G(&6[.dD>/BCa+3E4Q@4I_JE@BM;I(7MX)#F].01T?,A9S(c
\fbTDMX^?=DbS21P?+7W2_8I?e#:bbB#71[9e?1bENZ7G]7D1]JKf=#HJQ-7MR\3
CQ]R)/gO<E[6a]H@P.8J1/R4R;995WFT65R/)DFZY[gUa[gaQC:a>b>RD_cPfZ2>
0?=edSP<1V[AgCCSAMR6gA74F588@2/PcO?N5:MYPQ9M_S7LdE1<C+;)@0Qb8];A
W..8,65BVXG:f<fd1fH^KE(RaFHG@gLUOBGe&C+Q@M<a(M_U7E&;0Q&#,8LSPL]?
6+H2NMQ=V=c^?,J@&29-[Qeg@BZNeSdHP=B<T(66H;N:I_-#H[QY^]>]&U60)1]P
/d1g_^:C1@A-Lf:CKNH#FK\>CL5R8+ZRTEcOeN11J9X-4J]ZD4]J?eL4.Bb4&J&;
)]/X[XQVN12G#d0RfL_.bL6H6dJ5[;d4IQMOM\519PLe;9dA[W;/P=g-]6gI]^4R
(?Lf39c7@>_a4DN27()E@)L>0HJ?VMN+c_O^E@W@QH^1<cg/66A6KOG<S46??FL_
3@.d,LLW=,/fG_(dH^0L779.SU?:[<<a=4?&dM4TU+]BLN;+(E>cXaAZW-f:S;)J
ZM_bNSX#,;BR1N75]:P,=RD:\KG;233UVFQ+IDUafE=H\43HS7KFXN[/#3B-POKa
LPOa)SQJ-?We@&4ZVMf2^.L8(/Df-RedU6(V1&.Y9OP]-STZKgDHYE=JW)W+JOdG
e=:>f;)/:B5R13NLBQQTC1&J)[LL-9Y=K2H3b6[;b(4I6YD]KU1[Ed/^R40<#2LP
XB)Fd;KDbGY;CPR1Ad:bYgF/J/fXY)M(3&/98?LPYYd?cZLL0HcM6ZMSPQ<E<AZB
#a=Bb-S?]0_79G^5gRWGE)X@VY+5<C@KN;5G)a3PVUI8A0LE\+9LJA0#EV-)-)TO
1ABcUFJ;-11Gc\ZKHX]5c,9,N#d<53X:.ceFU@&GcbP=F^<JQ6-TcE@.0M.KK34O
SHF,5fRSO:Q,S.+4KgG/.MeZ:,YHKW7WFG;C@EOV5O[=[_^1fW2PAZ\N+a[4+&R,
DNb->MaI,77Kd9V@-f=2L-HQ=71I>Y=II0>A?31,)+<ZHba,LR=PN3.b?f&OQ\[B
/\R17L#?a^H+[VVQ9ZVId>Uf7BX0Cb]_ScggREgg/>GYT+,-S6G#D<9X=fD(]UWQ
(?+N\2=N/550f5#1-eGA9S5W)CJO<>Lg/>@CV-<g-M+B9S6fFDO7S5aE@4YLM^Ua
-=]W9]Z2DT0/..RPT3YeHSI4b;D\JQf_7bLCNe_@LYX@D3K:WQBJ7?2HS7PS[Nd:
X\OG1U#b.1T/^67AIQ8g)R85:&44?S\:ZM.Q6+T.:H=]BHFec0/VGbcBfZg/bQZS
3&?)A9YP^?X[#2((fA^E9T857$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV
