
`ifndef GUARD_SVT_SPI_FLASH_MX25L_PARALLEL_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25L_PARALLEL_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25L device family in Parallel mode.
 */
class svt_spi_flash_mx25l_parallel_ac_configuration extends svt_configuration;

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
  real tCH_ns = initial_time;

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns = initial_time;

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

  /**
   * HOLD Active Setup time
   */
  real tHLCH_ns = initial_time;

  /**
   * HOLD Active Hold time
   */
  real tCHHH_ns = initial_time;

  /**
   * HOLD Non Active Setup time
   */
  real tHHCH_ns = initial_time;

  /**
   * HOLD Non Active Hold time
   */
  real tCHHL_ns = initial_time;

  /**
   * Minimum delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_min_ns = initial_time;

  /**
   * Maximum delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_max_ns = initial_time;

  /**
   * Delay between Hold assert to Output Invalid
   */ 
  real hold_assert_to_output_invalid_ns = initial_time;

  /**
   * Minimum delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_min_ns = initial_time;

  /**
   * Maximum delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_max_ns = initial_time;
  
  /**
   * Delay between Hold de-assert to Output Valid
   */ 
  real hold_deassert_to_output_valid_ns = initial_time;

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

  /** Calculates Random Timing Parameter value for #hold_assert_to_output_invalid_ns */
  extern virtual function void randomize_hold_assert_to_output_invalid_ns();

  /** Calculates Random Timing Parameter value for #hold_deassert_to_output_valid_ns */
  extern virtual function void randomize_hold_deassert_to_output_valid_ns();

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
  `svt_vmm_data_new(svt_spi_flash_mx25l_parallel_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25l_parallel_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25l_parallel_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25l_parallel_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25l_parallel_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25l_parallel_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25l_parallel_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
H24WT?>(PI/YFV5eSOa9KZ-T<CX]I0Y\-P8Y-@+cfAW4edYWEabf3)ZJ>=BD&O4H
/RPa/;a,3QBR4MILP1/9CFe]\\/8#aVXAY\>-)1V#SL?RQZd2N-V=]DG\WNAUe)C
^]8dAX:E-8Kb;S:g4J4:Z,,HW81HUG3;TRL0)G+()G8A)BYUWFd<\ILCDJeT\&b.
RKE/&F9f:g]]-9gD/:?2F61<MW+#TAF(TH/Z4DOS8DV/-WQddG17BS?d]F+73e\_
LCEa^0eR7;M_c8KV9(@V\eMA1K\WZ=#1P=1PI.6CH&7TdKUd+R3)QRLZ5/#>KJ.Q
Z.)&7X&<fQaeT]WU[0ee^JF+&CYB2YF\D^0OI(N&=5Wd[PRFULB(ZXP4^dHU+-]#
=FFZ-3b]I2^Qff4Z04eePB[0HUS..>VT:.R>E&L;9U.=O(<YF>+:45OC(]-HYDH1
\:&OR309JEE@.(cKSE8E_FF[X:[Z^=1LeM+((,bIZ:F],]QC[]DH4W?#dNK4X_;M
K29eXA+I/^BBRIURVG28.SO^_4.P133X.e4TB7/.LECb+?B^/6\,R@;5KebQLAV[
1=UTOU8eQA00&CA\E]5I0I-5dM0@]A3fc?dbfWBK8VV&3]a)\/I?<P_]#LS7aF3>
AFIDX<4NX,4T^WQ&_O>?9P/0@<4DEL^#LbePK;:Y3,dMXO0g3MG#L5a@()dE\PM9
F,g3#,B#WJG__dV<8^<E.#b11,;?J<Z]aBb#BPg;/U?/_.]Pg_DMYWB5I_bH?KOL
M4HHXCO\f:0LH3]Ha7I-5CaP,f_b<f6_L/CRa^PgM_cL:TIIO=6A)=B5I$
`endprotected


//vcs_vip_protect
`protected
82HAWW9(D7D8+TT9)O.Kc5M120663EO(\gdC(CJNPcBT(W9\1d]=.(IccR0)E5=N
XP+79-ER.Q+=&):g.FNHa8F]d@7<:MfI^V6-&dQ)gfV<A9<eU4]6,1+0R5E\I4+0
g3NR4Q4X-#37NE:?;P:DYXIN483GB-1FVC4EYS3CYFA#@12(/DaP5<MD9]Q>T/CT
Y>(AZ@_=817c8,O-7M8B=@O5D#f+abCf3^V4MIZ_+&dcU=8G+\41U55CHSUX&aUb
BXY:]EB_efGY#B8Ff1B:=S-54edd+EbUOfTZ90c3WWgVUE^4<G)5NM,2aT<R@OGB
)(#INgW2eWN:CZ61,1W5W7[=E3C13fXI\)c+dVMZ?&:3eT)aN-(9YXA\D<5ICc_+
469;]VXT3JP>/35:L\O<TLGJTIV-^:3\7OXLRRQSdIT)6T++,9])OV0_?(LYT@]-
/6L._#<D#ANaF.(gIS-0KB^dRFR1_e_+:0f03Cae3H0Q?g-3.\)0SA=HaBbJ^UH8
TESddI&NP^N)9\8cI<GEQg,FA4cP,>+Z;A+/VPWPUSG=P/AIRP?\L7+P5aE4;S-a
/;ZF4d0=J>DXd78B^7dF)/V-M\RG/BX&_V^GH+e2g0MJg^W2ULU\D+K3NH[W5Og,
^-WZZ5-Hf\cU7e=a)A-DEP\3dVA7V]Q2;\DHRb_I+M@eSH;0/f3aZ,c=>VT;E_-I
W_&LM+c/,8DIJMK>UV[@(#-Oe.J+Y)7XHdaD9RE.L(QcU\PXB(E=._:(E2bD&[Z(
GgBG__GPF81FO-JA[0/B#ZO0g5;_\3PCLDHMPNJYJ[;M@ae]f]-#9(_dI6?GR6BY
@J6&Cb+b]L]I=56:XU(43Z0gAR8X=,?G<;R,PD_K60^BFS>&R:=YC;REAKd@RF_1
TRBQ;SFY9(cLgD4/RIL_+.L2XRf@FC&f,/ABZJ6<)gII3Q=D466?.:D_0SU]dHZa
&RG.2Y_aQ^_./T:D1?g_Y&:f[^e:&0&U5<PT0#+f1?&-S71S++897d5a3(XYXeG:
O,7IVgcDJ>TeQXP[KEc,f7LB/S5bHH3,G.JWV0YO<08fa2V<(FA1-/,JO4]4/<LQ
Gcc\(U&;@E8Z.O6F:S97dI(_cK_FVSSQUF(;L):US/9_EcD=eg/RZ02eFE?ST);=
;C:M,Q75Z7^;JFb=SL<)16I_Z+5T,X.)\6VGX;+>:,Z\0DO:?5/ddgSdT4A585c\
3K/U[59A73J#VX81W:8Xg)+C03Ab[X#EDS&##LMEGSGUV;1Q?I>V(OAPDH2c59[)
@@,S<<JSC94R;c9OU)6Mg:T7([X#_?=JN-X.F\C&A[b(\9U<F(\XETD_Nd._0d(9
T?G^KV<1([-.-8IFONW5,SXVU(GL@3M:T;Ef6O#\fG&MC53_8KCZW&OT#a,G+AcE
=/V>=<52&R1L5DPK;R4_8X.@IUL(M.V?_IYPcIERX@:5M=MGB[Pe9BLgJJP=T9\Z
aMU;]d973960(cKK7QAFZ7/JEgB88dJY2aeeT83^,ZcGRJXZbH:-b_I2D>GK<BLg
?VLB9+aVV5(&:QTS\<;>0V>/^/FR+J7dR6dO+PfH5VW<9H;JZb48(<+-3>[ADg>=
T=fMG/0DS,NHFeBAQ-Eg7SDDR7QFQG+Ye\5XRB(S)d06E8_?LA/T;,Z5e5OCJJVK
K7f1,@:(#H+>1g@fZ2(:VZE]HW@\MQ8,+b.M4L.:<9E@JR0G6S8dH;HTKZM&7;4d
cbUa96J.GgO6FGC)b\_e9H1+=VCc3\&5g_9J4eYOc9-;ZE=f9)5GY#6<98H(]@,T
aDG]RddN^a@WS91d)?eJ18]9S@),GfOM2N5:#QTBOHI.030dR/#BV;YK)9bR:369
\8?Eg?)e59]_d#H&>WSM3cJNI[X.@CM1FKa?Y,faP\S.&^ZMRXM35]K5[=(WAg>F
LC-SLH#=8,+>Mg4A1673dc(,SO(0Y&TcDY0X5V8>W/?2Z):;@8?WKRVHb:1b2[+1
ORAY;<LLTVP6=+..?\35d@S8U].F(.IVX,_-6OJ3db8XPV<YJT>FAA0FWTc9F5,@
U<OMNARBJAA;2V[C0b9?C.dS37^[3?g-3HX-GR],FLQ[9IR]#.8-bCfeV1;LbB.I
NCMN-g=(?14,ZHOCBe<L^QdGLG)^BT\;eF&XB;H6-NXc)Y?4FD4D^[_F8PgI:_^f
(,)/0175(-6eEDHf6/0+)]V[WW=ddMA\&RKWP_SA2Pc+AJLRdCPd(CQf@_R5<dTH
^512.?DUcd4XLY&gg;5_Q3<V&&,C27.@BT?4#_N;>HHZ-000&;RMQX5@Y=@ON9Z=
1LG#5VM[RbE8QDH,<,&6=.7XfKTY93&McT\ZSZe4T2=TUAE\]3MB[TQeRDG_,a7(
,c0NH)+OT[fO0462eQb=YRE_:&XX/?12\f\[T]F^M(<3V76d]/(E^gW^Ie)<:==A
/;4S<fbSZfVE^BC#[bHVF@2HEP5,GJg)FcH4VB1?2=2[\;YBE6YI5CM?MQ8Mfa/d
f@#NZg+V)cND_6g_CGKES5a++cZE;6V]?FG&,/6]MbU)NSGCOTF_6^Wd6Bg01R.J
bY-aCDfIY7=#NY,^IT<TV[c7.J]KN9KcO865#M0QIFE#a8C)75a]Se^L>Od]-X\/
NY5b=,fYb8-XA[A6O-MEA0f5A#B]0/>+DR6G&&:NZ.3U[VP]D?3g@/Ga1AGb:XA>
__[#IO6PZ?ZP)-JU8(U;[@U@.F0K<37fUUdYdOP1F-N)YRSeEMUYU[S1T[UfX9Se
UBPI4:La4.YUP^e2^D;Y2Rdc@aP5c]00+V)5-KbU1YY_XR.e]8&(U4c(Z<:@F2-Q
4GHf9PF;1HCbY[,;S#)3?a#(F-8?BbWQ)?+AFKXLYdFb?Wc=8d/e9dff,PYf:A7>
6c,7/B76Q>/E]Z<@C&FdaDa)W_5U9J97</cW@>Q?:1Of&,J6E:b8N8RcedaG@#8O
.d)IDY>GXgWT<SM@:g[N9^;O<G874[7^DZZ#TW@JCe1MH7,1:MGcH^T)BeMJWC8(
PcR(&][VYKC9_50X-&/.E=8f3IP[004Q99^U]U4IH=2;ESP;]2d>]]eI_YX83BYW
9B2[a#6^cPI?TS7W)=.-L)fDE2dIdL&Qf909I55_XfP9DFc@B1@fG=31<XQ>8_.Y
..G1.&2U?T)\HCDfJIOaD3).BX)+QDU]2[]<a:61PKDG-:F&bR)7GN;.986)af:E
(R_SI/VBLFPXR08F4.#40V>.=A;.&>PBIa_(L3O1RFM8BRFVJLCA^8ON3/3:^?W7
V7H&N435E#\OJF2HfI4)EEf^=/SKSO^,17;@7?#D<\_MW@HVLX5XG4NC&Ngf:>J1
<\<YHR1CcG1/P9#ULPUK44=I-#5]Y<.Ea.PE\QBPeIB.44@?egD-+Lc<>7\dPWI<
fSM=[303Sd4SYeY@6),SRS+G6O>NaU2>@NAeE=;UT^9UHBfbb3E/N#FXQ;#N)@Fg
48PKM1^&A#Z_>_J3T<0<@a,>1)QA<d4L^@]O(]3N_cfB&75UAI+?c0:G/@@,KDd_
8OX-&#GYdKX?.YSJG)7@_48[b1a[(M20e-^\(Sc/CJ(b+b5(=CX1DHULT2Pe4(&Y
5]N#P,;X#@aQ,]#)B5J(L5(->,BRQ>:I?\N0ABE9^@5.UZB\9^?<\O<]79Z:/#S^
ODE\FR/&5TdcF+-]\8(B/bR?bM/(;BW1XU?74OaW2UUJC.6LFGO#)=6?FK]fV1<-
##9<(H/EVDMCS(CBc6OP9e&@H#OfIgHcLED@RE4OWR-J8Og.>[Z).d_HO&@FJE>8
6X)fe[.M(\;e_AKAUF;cNY>ZM+GS2(3[QW9:BJ3II[R57c&_(c#TF0M0G)7^Sc-X
MG:N/IS]=-5?c]XQ+HG@?#ROEHe0C<#DX[S/6FbTXNG?b)>\V/GG;K#O7N&KM/CF
@Q6ea&d(:[,f:dM^?YDJFEV><;]Z&D3I&e1JF_-<@0EaW.<+);.23._2.^7.U<&?
8AC<5))T+1P6X<^4N>b@P3X9#@G4-aUBHe2LGS]#Y6G7X/-K\SSU/0Y&-0]2M=O1
Cd17_UH+]J?EZZQ(X#@:_AbSUR4W;gJ:9DSI=[94Z8Y5W[>RWQ8@SQ7Q.]GOGFBC
:SS]6@H4f^dAL8R7WM^TYP4CTDE[R\I67+-JN([>(7KH#8AaZM[LJA>ZHNB642-<
cMcFC@g?Q]9e,2\UV-Q8BZZ-1+-A@9aHcIER^f12[M9HX:dC(S;.\\HB30EA9c4:
4OP).P+5?+0-A\-XDA_0]baMZJ7LTX&5\<QA7>GTa>T)L:?FE<;6^dO_YF/058KW
<g.^8HMW&Q?;0f[QP45O[;g;&=GEOQQIRZ[a0XCRG7^g/V//Z0_G_a(JfRdERNbH
-QT>EgZDfD253JCAY6a<4>-UJUI:V,)eNEP3K<LgLQb-ZW)\V;F/X(KDQ6GD^LB5
_E^VGf+X)(BQ/gdSVVJ,>NJB@GFF<#bKeV^6&b5Z@0EF]NCHL<cSBUf5IIP[A+-+
5#HP=X>1c,(HU<YIFdNFNFbc^P:\Sfa4C/T+0baCV0Y)OH#.-NaH\f[Tg<A8)(2G
?,K],;5AE5Hb4KHV023Bb.UXC9#^F)WCC?SY#QdeP+\J\cKRQ31ReGS[AY)N7.^d
_fB8AK:eEOSN+JI(efQ.N5gMEH1A-3/>QSLT^,7MZ;0&9d7K13Uc),(2\K3b)&/<
9Q0.)X-?5(5Ya;4S7Q?\=g8ag8Tf.[eO(-=U=eNG\)@NAQ=-M>4Lc/>,PFW[KP9&
/>g[N.eMFWG(2ZEIF/G@?:?KQ656SF/[ca_gEY<>JdA6MA927C[E5NMJVP=,;_1?
g5?TaLLH2<#G>)VOR2QX&ZS-,1(C9JB#T.aM,DR=?S@]/6@QC;&@T[Zb_H@40L;d
/JT.ffES:_c9CID=MD_D1Y>;SEe7/U)/XR>U)FG5a1<#A7XL&ag<\(0P;])B#O8[
Qa/;@OY-#-U1IYQ,0Z:(D@X;SG^H38#XV,a8&9?T[F/_1PE<OOBVg[e\LIHL3I&7
.3Df]3LO-5^fHQ..X#cZS,Qg:]H2WUY4&_Y0Oc#bcgQaULbJ.JXS3TZ9^JO6JK<e
2E0VD=I;-(N3E\CGG^fb4J]+,US_;FLd>@+LaWWM00[Z)9F@Y_6]&MAdP65^\VRK
5T<GGE4b6OR,Ua.IB7@OEKf0_=N4\1=Bd&W<@B(g@D:4V+WLK0KI\3BA::gF)^Yb
\FSb\XD4XA-gS[DF46=a?:(I1IWVB,C_POJV4K&G__TEE2WQ:3.V0)KVP-V=O4IY
c_e,c(;]Q?O=RT@)TNdcTZ3X];J-5=]@?.^+5BUIfXe/;QG2D;M;\C]\(WB@JaPY
.1Z.@5DG<^+RUaCB)MN-WO)U0OVL7\&MN37X[P/E7RX]]#VV/-UJC]):0T_A<522
e4W=3/WPN:D<1Z6AZfd-5<>=S>e7GBIOe4W_QT3a5B0Yg[9F@#<4@:TX@edP_CAb
L-d[6e.P1PXD\DJ<<=cf88#f@@66\eY85K,DI#)fZC=P9GO=?<(+QQFJ9ODUe5[.
AEZ,A=Y8Q0B7+ab+LAUB14DJg_=8)Aaa^.XEBF388/?]+cZZODaT2&FFQ[ERHO7(
c#004\e0U>(<gbUZNNEEY\J<CgPMM#5YH]A(&,U@]ZF9M=+fADZHY\12Y-gTd[>G
:#EXDb)LC@>@9@^Y+X9EK40=6G^I@,c12b(Y[=g7<N]c-&1?X5FDX/.2e+L=[If1
P3F0O>^,48[I:eHJ[^.ZHL+2>I#b3##MfRcbA1[R_[ZMO>eJ?ER&E;g/<Q6G9fWC
I_7/SYb=N1KdfFY>dKIGK-ZTaNP(=>>2W;.T[()0Da7NMQH8Y>4TF_g?O9\==9@P
X7](,V<+;Bb.,&3S;3e=3\KT.0dPc(WCEV<HW25S-^?U73bdXQF?-]T#AYRCNF1/
<L_>1f2PLgZ/D_bIR+I?bc0\e_-T7GP8N@G)H<9GHHPY]TBd0OMT_U;UMKCc,R_d
;#7J\_G+2.(Vba1@cOVGaHeg@9&R9?TDCcf0P&>8+^5?Q,[SJ=/U2_V9T6cT1SXB
B<P_.M1;ed:5A_c\1Hbe3Db^c:g>DYMGeX))YGV9J<O\T14bS@\dE/ULE39<]g^,
f^9K001//?d>0PI]O0Q-+Zb^;fZ)M_?>::B_:H:J9B2BF(f@^T71X\XfKF.@)XJZ
5g8BLP9+&>W?Q\\:gV[/4@bP(,ec4]]BF5U1c0/I8;aeM,.CHW_WaK&Q4PNJ=25[
CTLfN&ca,AA1#)gbZS@Y6FBgb(W[W)R9MJDXHa55KcT:DCC(OO25PCP<@)a_c0\@
H04E(E5HA,.3_.]Z]?6O6LCLE]FHR>H[0c+IM?a]G:Pdf+&DDf=#J<.bf:eP:)^g
E]#F+#]0(^YR4Xd8<a2d7FP5Q5^cY2XK/[<a;+Z6#A__W6NMW@(8AC8G6IE2#5QX
Z[-N>;&CF#U@J)Q:1RO+d1ULEAAA7O>-VN(KXV.M4DP;4I&IZSIL#2P@?70A+<#:
4A1TTH,=RHX#O.K_\[DNWQ[_.FP4CV+<Wc5Z.+YW5YO+N+R:^E::c)=)D6&R>&G&
T[f9L8.B=K)^^30<Y1;^0H5M3NZ#+-?NRVR0g<e/W7fB[8^#S#EJ1<;F^a#2ZA.f
NQZda=X[)45-DC/_H2IB2=XATA@KQK]L:[DELGW24/O/Q810XZf2OJK99AO;KZWW
MF88f2_96d8g_W<1DND?4><dIDb#.[[D,-&5=QZ#3P-4E6MS/2M]ZBb3]>N49e8,
H)=A+KL=2N^7SCTNMb[b\Re.3&Ja]cdR&U44@A(0XX/1:.#@EN^Qf^X>VBF^Ad7:
e4Z7OVGY(NG53K=GUPK?](F&9+FQ-GRdaHQVNKKKMe.C3\TBB-^#&Q\L?Md);<Z2
Z;TPc5;K.^VWHf4Hc8GH]B^Egc&K)PJ&/Qe9?+1Uf^A)-K9;OR;]4J_U/5RTI+EY
&d[@=]&Id4]:(f2#]D0PPK#JW,OAZ](.3fe8PRbR#c3L\7=d@LFW&/E8BXf-VY_8
&.5Z?Q:+cd2GE15WXWcAEfUdL>^Nf/9@;MJGc3C-VDD1FfG1g2Z&985Y<f9>cU#;
#V3geE&@gW>>c[5JAC+P\S^8Nc4?dHd\_S3?&bVKgfD6N]QQ7J1_/aeEbYKM8BeI
2]1EE9L8,g)<H@E/-.He\8WFMMNZgdKG&]QV2^fL/F:Zd:Y(Dd6M+aPE4/(fY_4d
<[?,]aY1gFAL+=-K,W:4H?VG&,9d1>M.NOEfYN@5H<?K(7<BQ5=;ASC&J61GgS1c
VdLQg(_.YIO9:V+CDRUBZQ<CU#A[#]^E0XR@-HM.O6MQ)^U-9S/8(gWN64U+a4VP
[>f-<TM0.DX(egLU0X593gDg,/]YSXH;&SGPN1<@FUdea7H.M680g=0)LPT+fH^+
.?.I/)NP_WD^)-P<_:\IG=]Y,b4VES&OggFS_cPSOVKX^]3+^RfMPd&OP?SBYb=)
&g-/V(<LEDY9QO/3H53EJ-X]8JeD80JM)Eb##^G5E/L.K]4L+(X..:Q^93D(]+f\
:F1@;EFI7@@4A&(F=UcfeXIZ3N@_Q8173.17CCH>]baWNf]KJV,D@M,aYY:FZ^\/
[6=D,RK>1C)MWQ:BI>5AF,ZY6XSf)dY?M0D/P2HKW\Q)RR8<#Gg27<M3[F\&4JJB
#<K,@#@aA_E7R@b>Y9IgO)AVLGfB;O)RWY/^KI7AR8:_(,NBD<6[MTYK/.e;BNAX
29-->8[GH./\TCU.,+[HT,8\cW@&99eD[D:=FX:f4SO00#cc-VR_+B#gCZO]&G+L
,A42gZX?IMV<d?>[H6YdSf@#c56._7/Z7RM>gMbCVZ85AE/<N-S8KZ;EeZ::Yb8Z
.\+-TK#6:gVe9Y277T[L-^,Q[+^(>WeC,IP#F<O2?d9ZH,,M==/6RSVOH4W9F#5;
F;C\;MA+S]B+(2\]Y3&UPA@KbM23A-Ja0F(A&g<BY/WdNB_DH5CJ880:a>838@1I
_29BQ<[gR\B5S=JEY[c/SFGW7<U8QV1HKG2K[]6<G9(C\aI0?EU\+T=Y8?.FR7/I
?>gSJ0dCK1(A:<K&-<_&T5?+G/HW1;QBUT-Q#IJOK(-A;KG,@7__,<PYX\+GY-[2
a/&P5S/F0aQ30g4G+#Y2);FND(N7a/7RY3CZ?Qb]#@@]8?4U1017XMEfQOSQOLc[
Mdf&)VHZ&KDQ?ELB(9\H&d9DN]1A?;XP4R6V?g#CdCNLaO7Y:g?IbO@\Y([J\WDM
0C)/SZ6aD)D@JUS^A>Ae3-1&GJG8LcY5.(bBMd?&:-H>H(VKFQ#0A+59b<JB5O-(
2CYc/C8-9;0M@8(T\CO=2441[ZFXMdUEL.Ra3TMHMAIQ<C9c_@)eddY?@Dfg7fSC
g_[7a@E&F3EdOe=D0D7#YM=OT76SQA,IeG;[@eW>VNdB.LE60<VO]])Q6K;\&WQ7
PHA(,5;UUJIG+PCTKW4+7SaS9>I^P-_UBNbJP/XSNDaYU^T,3,@ZDD/,ECc3^d^W
E-f+7c]S]-4F&f,+<O9K3aTSLbfAR58J1HGA[3S30BVS(4]KaCdJMg..:A;H[U;_
?8@(O=;]LFc1#,])R:&P-03Q1V4LJ#H7LBeIeH2OY\PZX<EPO[:;6@Bd7=^)b@H&
K)/0A(BcgF0b4HXc9H<)52EK\B9dXZ/>_A.;/bSN-,(0CcAg;1a0H\9U#e[V_R6+
ZL#2X>]\D#RGH&gEY:>\^f-C:\_TfGHNA3gD.W+X6:)0bZ#T+G[3TU(BbC^dNGaa
;1FUF#B_S@<++.eILIFP4YRaQfXBFLHC@^R8@YOFX8,e=\15a_d3EY&++5E>3&,H
XRSbU0Y@Mb-SV7B,2X1BdeQd4S<K4E;^ZC6GTZ+(;Da=]G]0P)N87R[SUH80ecSE
-JUW]bBJ.CI@6gQa&b>ZT_I6_[.<:78&DUdB\Iag]HHe7#,4VHOR1H8;\b]b(P^,
7UAT(_e<]FRCDK?ZB=I?a;)2[AJ@Z]a[+GOG/3Ac:>dTH0Y]CBH&/dU3d^&e,NFM
dV&-_,.gKYKeeI9;<@)C[OEgI/[H(^0<5BK7e0^N]f>e<JGg#1=)+]9g6L\@e(]a
bE=4?1[D(S\IbE\CHYMNJ6,M>Z[?UZ^L6IaA830Z8>^E^:V@W?BUa#bC.9YX;SKC
QHTgJEZ[\\2G-g^1,S\eTET=3UQN=J,IY,JDaYP:[cAe1R45_(_G)X;-EJYPRg/2
:^C.VR^89EJY=CBa^_];M>eSRA_=K^(+^)7AXDeV79VRG9_19FGgC6V:?.ORXG_5
MO^[fAcWFRU<DF=)?K.GP<7=XQC,=FA<>N6/LcU@Sa85-E>F/H_][e;_LCfSEG#G
=5+gb.#9g]<JXJAN6J@[D>^S2a0CRTgP&\7;VMC\@[S0Zg\T@:]bB47PBe&e;WKM
5&MG33W+QU5dd-T;OU)FB\#]=GN#0Uc?6aOVR:4]7QB;Pb]fOb1FLDWWF^GR.3B;
;^(-(bKdD5,E3>B1]L.T]=]_&JC?[\.S7E+If+f&g6UPN-(B&dHeMX,G?fVGJU0E
6#>YG\d3Me4I.9#:)(ODd5PC@Yc>H9??5+GN:M6Y_>fcEV3d\;c5fe#KRJDVcaS8
OTKX[7fQSdf9BB#9)X6&)Ne640b>#G-@S][O/(KZKU+\g=7<bZcJ8BAX_DRLI<fM
I,X#f>BJ>P>AI?)OX.RbI,LdMX7@BZ\Z4NVSe(YZP3=D7S.:8fV;\2Lc/?8UY5,&
ZRa&PN^B[//=bdaX5-b&cCC)W-W[:f;b\95<(#DB(cXG;<)E[M2(+<[<a[BDWbL2
.?N:Tf3O9OMQ6+4Od(HYW+RdV]]&@=+FW9a24\06_QPH4<[f3+^UVEHKa8X)ZH72
RbP3@_([0d+^^,D6MUPUaY(6:BfR6Q;81/&YcGMRd&\QU>T12J._;->&8PG)eIgD
e[=cRgWXVQ6?g-O1N]^51fW[<.LAc>,[3^[MX2[61-Y]L)d74ZbPCL)WgL&g<(Te
0V&4H4W^M^2L[7@;O.)P4^_JAJY;I&U700K4RQg/c3EC4@90R^f_\Q#.QNMNP<>/
G2eed5&aXLUADfZ/_aI55#CHdg#+7Of@&M@OAY=&fZ3(WVEGEE,-<,4BFa.?;cU0
-Wd^RNY?XYT)ObCaMKV7eMLD-[65b:??9_g(fGg06H,:[NX?HQ2R5[)UfXXIOeC@
R8b0,GPY)d3TN1V5,^M/_N[QH^(U.3/EcW3Y4eY&^H14T0.cXLd;>ZSe.@1Pf)YP
=b<]GCN4LR9V_fA,\H6XZX.\JB<U[d1BGWBSF)MM^6WfJY^>E.6aH03FIdO9?PCU
>ECX+P50LRYJ2DW#V.HUW>aM^CGYT)>MVV^7&,W>>Ud)U<TdZK]\<EVSd3[E/8Tg
;#Lc73)bACU6]0-3465;_BKKPVXMVB0E\?_cXPZRS6<(9g+&V[_E[20ZaF/C#S[&
g(f(7(f/LX5+@8H40D<V;b>A.U@-b-YLFLHF8A+SOTRfQ/PSN\d:80ZPL9(=1<R]
XZQAQHWG)BJ;W9_TO]WRV;.b9e+].E3@.7Y9d>LDY_T);V;W=O5^((5@fL7+8I0c
YJ?1IH>9@=/2+Z1(:S,[IH),^;_C32/]ZXa])JaY.9[M:3MPS:VJd:X]([R+V^+=
^U>GgKZQA9]Jb5dUffS+\d5)+HK.X8YV5b:)>A6C^2aU#Fc00M3IY\#dF=D-eBg2
7S7&,5-d#+@RKKL(EB:/:)_J(4(-?QP5_#Z0.J:(T.X-aF8@2,O+.JDYD2I:\04#
>Z.;RE5:;b>+G;W-_XYagNEfM9c@:PQUH9^9_S7:I^)J,8U/S3G/Ma35;eU.9BD@
#O\Z2a@D^]L=ZX:9E:#f(KW^>G1bQV19BM[:]+8BT<Ce7NILcX5@(<:2LC[gL:6.
]g-7fN@,]?)9^0>YC>>&\DANT)3+4.GX3VbGL(Rb6)e[8-Oea+Ae\#]7d5F25db.
WY2(Q1dGdEaR](RUQZ:8>>J39K];2O/(>KZ8Q?VUN/M6b3eUedWFLYZg_=@.QDJU
\3dBbA93JMQ+4<_7LRQIF5B<>R&O13U4H;D+e\1]-OS^?QYLHK+;7^()-Bg=,68R
L_E.)f_FE3L=8eJSBD^++86?;A^cPWf(?,[fAdBe.3g?4G-SW5]UgADMEMGJ]SL0
+If;L7P=O^@P5,^S843gcN]T.H\dP)?#PX@74WY9C8CVe-BC)a0CeW\Gd@Sa>U)K
Z]8fRG;c;6.R]CGVW#B;M6UKWOBH_3)(LWVJgIX-E&SP,NZ@LCP+GaJ8dH7<2Z>e
dG52/a:537\5aLE/^CRg5D:1.Ye+)KP]-U;WV4G_3b&-#[L^YXPN-6?3D3Z)cKeC
&e9G5,>.T5@-7.A1WN6fDU<+KAO+OS5QeNf8,AG-)V[:O^bD8:--/.1B+N1W>cgd
]Qd:^?Gd4RcdJ_Hd695GIRH+>TSS(?[3.5dLRU#RS+G/>6G/O75AS-F#K)b4d;)R
-gY-]5SQJI7UF3.EV&U1>I+1Q4<d36Z2Y1W.56W9>BK-KbCc/^1JW:Id0]/IXTM9
G#C].:bR&SIX3+&W_#(=gHQYZ<BT2V9bbLCE8U_VL?N9N5Q&1cc7XJR2-5V1?b\,
/.Ff^IK+DYIP9M]DfZWX@E._PE;;#Z3^f[AZXB1;91<c3GE;Ada9SQ,K3TBQ-WPY
C>90bNaCEXLLHP:12I0Q,8A_0>RDZC+MM7=cdPD6eL<4Ic04d5M^>J[f8ge36,bF
X@LF5?:MTNg>e_C+.F1:77P>[./a[Aae</,05Q]gJQN=bd=R;HgZ;g=&JLE;Y<H[
(5[3Kb^b3&:H1#31@dHE#9PP_QS2VM;=c#YUD0eIIIF70EE-H:TU6((dW.A(7#:e
YHX&SB/6FD-/f_:-++F?<PCgECaZdPHPHeI;>BS/@]gHCE9:Y\8ILJVfVV]?C4S<
5g<5\_8OP[bV+;SFa->)5?W@,Y380^H(KP2gS@]4aTCE9/@Q-g<f&OG\U+c?&6KF
H;O;_/P2/R9dX5,.>34NE,CF:bYfD-b0=&59RYAc.BCZbC:JX)W]g->V9KaeG6O+
M9+7-F^:FdF1HKDEMI;W^B9GdMM);Y5ge[+MEK<\a&UEF+]KFADJ:T=GBA++eQcU
^)L^/UHH#f_=7eM_:1]^8_QB[5;YGA-V5QNY#J^<SLXF+W4D.M,c61F]</<GYZ]H
#K5LP6_M5#5B7\:E.+-J1/3O3(Q558K<Z\B<Z6G(7.[cRIU<DS<c)Y;YgQGQ5&=?
KKVS=FXZ6SN25R)4ZWS.eB+OEgG4b];F9?g>)8#=4b\K<K&NP6.MaK#__U;8=PS(
V1W5P<KACbO8PX:V,)c#ZZX(]7B]##^E6UT:K>6J:GUd.5:KW+e(EbcQ^X^5-Jc2
L8-#B1_V)7bR3Ua+#0#4D&Y::774KIdXPD:<gY.Mg[L#IZ)9?aA3e65cLaB(&(+7
([Q7/e7&6MXX5ZYY[.,NJYa=RNb_86:D@O_,TF(1T?-6[);;PD1b<VR@GV,HGU&,
>N&Ocf=ec)Le[gPgBWN0V7M1A[aWeU/<F)J#R@d&CPcB5E0N,&([(4QV)V:#1C3Z
53;gS,DD_U/[K;603E\>U1_F\gQI^&>YMYLK]B(UI5HPab.3,QICR3Vd#-F79P:4
^PNb>eb&4bc@9D^6O^/T@FNYA\J/].?RT_Y[d@0Y2X1?5d7]-@c\KfNTUV&JS2?6
4Q0E6E?8BNe5T,a0YgO<A:N?)XcORYPY458<<.2aG?Z,@JaBE90-PDI6##HVV15?
#L2.+PUZ_(f(eS_FPZ,]PO,V604[WZ7f9I1?R]_>OI-HL0Ga\O8d);L)gd)]&O#N
c&>?a/FXf#9X2e]1RaAX5aTE3POFMfL1R)/O:S=Sfg)^S6-/-)R#N9?8KB-78e6S
6\C\3+JV>-g-Q)\48&B1SdN-\12:W<R2U_HVBFdU>,#MN#dQfQ.NWY)ME(6T-UHA
G.QH+ZN))#6RBUaScbT:;BfMc.-QIbK&>7;Q>gT6PY6_S)>d9CGA)Y2(^X:4.,L)
XbH1)+55<\(I&4\>fZ2KXNL-ZD]N>87c[)MV,7[abA5b(V=,+A>eVGf+5I>=E(PZ
H\Tb3IC#XJd0^?RR/G8=J+U+fg&fY<QF&a>[EY)D3a6P]AGI9Mf_6(5f3fU[U/\D
g<Z_\5&XIF00/L4a]/fB6:/33I:=/^=2/dMWJ-SJ<X&-_Pf2TI[Oc>a47X97;#cJ
bU_db@Tg?#6Ug,HS@FVe60LJ3DGH_Wba0eLIE&:^#H-+OY2\?VUTN8MW9MI<XQAR
4^H2ZD=,(>02EXT2B2>Bfg5L\ADa.\cU0HYgdN&e/V28ag>MEA/d_43S=_VcV\=;
Q=-Q60(DM0E2,bF9L0CJGBb\1e0dDJ0ZZ<;eCM(+<W:#NO3Z-X,Pf7R93[(/(W8T
>70T^]:NdROY6Xc,ZFXF]B>&D5ZUGHS>95)38]F8[80^>99-.V31Tc<E.0]U,7@g
VM6KBL6ZF;NM&RTYLS0@/cV(c?:#^?\<DZ7\G5W2XUJ\Z6,c.H2Qbf.U3\--#+S5
bea>5RR0(&@G1NVaP0A+[ffCTUJCg3/0:1^b;(9P6>41Bb;&>6H]9/@>C\OYCG.H
2#INGSa7HKJ5QG-389QSH.?P[1D3/H,5g)eKd2@_.eLWHZ63Y9-M1GJ;^T>gZgWg
G;CY[ZDZ2RcEg>0EEU.O7bW.ZLA(TQ(>?D21E?-3J(I\&GFCfc:,L5R^@H=KB_b6
=cZ^S[TD06<2c7F+H4JKNL)/R.[^b1:a+Ue#GdJX^@V[:QR8f-=2?]BYZPKQ>gK3
X:-RXa[ICAGdBFW&8TM9J).6BJ=90?J6Nf6g(R;R5N[2=N?F(+G5987>Dcd-J8:1
/H43bX]HJ:F9&>W/8SaAOOQ^:S_:3_b,gB7QNU][JSDeIUQM-C9P5MSd[S3^D2gG
@-H.a_d=6KC:\R88B47BAfZ/P9V,Waba]ZVTI1>(W&g)a)@Lf#PR_#=PGV@2EX<;
1Z5@VT#8>@:E+ICBYE=Tf6F_b_(LAD?8NcY,H&b=O2fDF2QecS6I:-X,EB@[).VU
dgE7[_2bg;[S0(XZ,g)Q^b.&(2AeHO]gdeVGCbL>Q-YFOW3Y4#PZ]_H4e_=5I[AM
:ZMQ=ZZU7:&1U[OW1COIQ=Y52L-==GW@E2BAXVHC=UY5JJ&L?)-88=G)?bXL#0I0
5^30[+MX3],//+/&D>\>Z\P1>GH3BO#BE..B-;caR&E[g?2[SF9?eVc.-K9CHd.B
=G3N9&<KMP_C^GaL4.&SPS@=H/52H+Rae2A?#c2Gg(M2,1P_^VeEK?BWd#MY/b>>
O.@9O46?,>[QLBS41Z2SBV6SSVGOB;?O0YG3AY^HJA/LR)(4XeE>]BD3JOLL=@DW
CdCd:+#UN0,E7JYb?Cb9cYGK2ZG7,_HWB=&@,[<T(9UXZIbc&B9&T1bQ>b2.XXK;
PL#S?]AcV/(c5.cCQTd?W?4@(d);Q9-eWYgNA?ea.IE&3\-6P^caNaT-g0G1>dWZ
;[0R-@K5:MeO/T0IOQV6WKR<H8J=;OM)aH(Pgda[_)E054gX:@&:KJ+R(=5;BX_S
NMPXWF4[g[ZG-F1CXP2WITC>L8c2ZES5g2R8E0N<3<2W-5?IJ@EMT4bJPP_3fD^R
O[cfV08Z=7_YX.Q)g4a0agd?=<DS8U-3eMZJe:+T;2.dGT<DXP)GT@9\49Z8D8C>
J.TBDV_:1F^e,_eDNcNPG#W7:TQ-&K=..2HGYV4GXV0<V711WSNFg^:._<)E++EW
gVf[U(Q9cJ1L7c?PM<gE/NH:X+R;RY<7b]G<+G&Ga(N4/#OeRMB8KV>+DZ28YJZ]
IJ.bUHXI;R8GY(463&0KYV]^^Td.GKcFPK9;0AgVO&?WE_>.g<[\)SQQR0U[]ZQF
)f6=LLRa^,X;S.-:3L&\M-,(.I1gOTH\?YbR0&2@5A.f-^4GcAH_fEZPOG.8Q)YU
)&e]#&DMc20P168YR_c-T9EgHc8VZXLVLcEe00Gf9R7C\EEY&>b)eXXRJQ?^A14]
g>P[A>-#0N?K3b,G^^;JS(4GXIcALEADS8>E5AM+J<],D:#Ja[7P>dN7d.ZID0g_
c]+5#b&.8/daB07#F[FAH>:2dAJKCXOD1:_-YII[2^3[/C6U-@g.<OSFYdU6cFX5
U0I\@&[8S/,O\ER@M5-b8K1A2P5WIJ_e75IHJ;M=+,Rc[CUT2Y4MI,JV?U]LG9WB
4bFXW8f/SS9DH(.&W\&F\HfEFP^9></N9;6bQga=cB76<GJ,-)C3-=-O)\OYbeNX
[.FNB&2HC\O/HSFJ69/35\DQC#gPM@HQ9T\b.)e2AV^512I5R0gEbDe<e;-DQKK7
>G=D\&<:T#_c#NcNAX3gQaG[Se\=Y0g,OA>CO.,\Z=L_e2?#.80.\a7:-NZ1F[D#
#D)Z?LdRTO=6@PJdW89YFBFGacY>RQUe+]BgJ#7?LgDS78U9/2J0G1>&KeXgE0YB
CW7(#:ag)(dd0UA83LTY)M(FO:0bdSL=0LG.OO([I3Vb.ZbfHEQBNU95M<?3OWd@
)<8PWD#0gZIBA#2KGf3e0JUf]VCc,b5d[88+]L9,N-3(PFL8.Gg/7g0BN&ZM:D+W
T#X=/_:CBMMI4T@6=OAFBZf;O_^FQ1L3e+HI+V#bJTXSE.:gPZBP=E+C[BK(UX>E
5T6f@@O0?g_G=O_JZAb:+^N5:1LTTUXXDga,#HRJ_0JZCU+d+F=6>#6aSdSD,+].
UZg5W8Bd0\CLS.e6WY2Q3[]FCeD5dH:cM,e+HX?,48Cd:C7J27eCRWT)gUZ[NQJg
XR.,J484F???OJ2(\25e<8XL/fV8fZ#7\CDPGc1]1gC1baLgDTSJ8#2?.g#XJ=P5
cY617#V,6&D(?AD3aVT+OZ-NAHRe2S#&aeJd]8G+Yb[/,Q?V@6#^gcad@>+E2/G\
OHY(f=C_aLZVT\Zd2NJ5,@(E.MJ/;-@H57aed#[?Z^^_0SQ)c]FU@B]^P(^^MWUV
4-RN@>bBFAg;[[KPVNIZgIV4)/ST9[8M]_?Q@]T:6QS6>K4ZS[P]_Y+W=^\5](g?
1P1QN>O^3GL+N;(L^e?;L=D7+S)B)Q[JBf5aG^b)d2Pc+B@&.9J[Wf6OP/CWPG:4
&2/9]>S9WELA.ROCP7b9US<DbD?UULdYCd)Q(PaOB<TX8Z9fce;g[2.6)^1PDGXF
L<M?EQ4TIN&g,6A6L?V76?TcDb-/]PITWa6LcWR:c#(10d9L0BFbeF4R>e,8)=3N
ME#8-8Bb(QZF9Yc1X+2MX^9@.N/P]H,:#3D>W,+_bML)X#6C0XT)g\?4Qb3]C)&L
V5QL^R.W;gd.1\L+UKG0N8):HNbL8,AV_bYA9X)IaZ^M3PLA9T<<&A9P,09f4bTV
&4J&07^?5).S.Y)4QN+b/P1I@dO(31Q7S.B8b+K15cI0W-97.G7Ve2?@8b(f>HGT
,K3XO@B87MU].D2;S_@EYG;ccQ3\7/g;FC1&(C+)N\KFEE>P53()BJ&GN(8#X3L9
/JOS5d=QR>]T)?Bfd>C1Q^@I)M@4(-,U0<b@BO#3b5G5CG6^F8),Q9),(3aH<L)E
-[;,&2I9_8C4@b-=UfX_J+4c_,4AY6.<U;L^&B8-?CeN=O./>T1aTBeIG91K\A7d
K[1e>4J0d-KKI1HQ-0CTGP@05A2\F-QH3eEUB.GCd;R)F/>MMMK?(W5QT=bGF&.D
gI6WRWc90.D<)N<U6-=fG\8=_&(f<\S3\F@Z2\>JEcf-IUQg=-?5V(VEZ0JT1(6_
AdFHM5I[e4\.c</@.WT-58bb#RX3a(+]_C)<R=)V?G[Ng/@I7Z(/-L/1K.g1F(gJ
;5/+cg3=Lcd/cWD.XU1?0Fa[@P)-0)\G1PD4(>,.IUD#9I@PW6QJ^/NLANM.@D4E
#JC_,^4_4/YH?RZ87BeJ1+&A90Ted,EL(cA2W(MQV:E8]HE9N>gA\_MRbJTM\<Ub
#Y<.^c[\(R;9f1/0O0ea^2fT/T:QgJ8,C7LUJLVIIe?f<B.QPgdc)AH.Y(9B-9/M
Wc(91I&)4V.D322+F++[EN>T2Z<6?8ANc#2[TICB,=f3R9-b3]>a\[2K\g1YBS:-
V=bIa):O+e2H2e)#aYX:X8dK[_MQ9>&>_E)?3-?&J\S0ZUNGP\5MW5[Y7P\@?Ufc
.\-1DK66=84(fAfNWXFIXK(D&Y(BK-fe#P,2NQ2]?IHS2IJET&OMJ(_&KXdE3.+E
<MTfLC[]5@WUR99bf[B))Y(Y,DDS=QVU[@/O9UR/_T54?/f2_?-@&27E[fS(?&ZI
3@:/d::PEU(VP.,_4)52[:>FUH[@(6fbM#Q/8967dPZU84Qec#U5C.7X.^1:^MKd
8[B@=/a?;PCU42/\_@D+D7T/YJKe)TRBBd7a2@8E6EN+aZMGG)+.1QP\^6e[2.W8
/d)G,ITSFC(Yd_c63MQZ[B^#>BXUU8+.,FH?L<gbDZXfNR/:^9)TEHL0(R@;&J(e
X.&Y<U]R(aC7QA@CC+R32/92ACdE.9X<,b>ea634DGP\UQPg+?3AV(<9?6e_ZHGZ
_3WcHV)(53[.YZ(H(:P_:+eTRCf\bUDL3P(4>O4dM(fSX#6[\+-C(dGd=2c,e@>G
f3GO/CNW>[6E:[eF]-ZO\RWDT1/N14gU)YAd6bC[2];0--O3(?d<.7E?)a3HA[b]
dGL]8E@J:LA1cSG?E?,ET^#aUR\U92(@9TbWMW#_(=9cWW<)MEV+:W3G,;@W2AX\
dV7,G43D1RJGOYB6_>O;)DH6#RC]UX_^5K#/JH?KGWcV,PZ&TVI==##fD^eVI4@g
3MRFQ/c)M(T,2]HG3f1.(.2YAF072?):?6G;?.\&DC3NZFGa99A6(QIgN#T26=P[
g?_^Rf\V]&UTC(IAMe,5LN@DB?Z-E]DVaKS(?ZgH-_aQ\_V#Lf3EgP/>N<fTE01;
OXPCK&/FLM(J2FeVf7JH[]DfJ?:JK88cX_)A6_aa<6eOY@X(KD4D:6/4_6\>>.F/
XV(DC,/NE\(4cXG0S+;XLHCKX85#V#X0^A6,Og3GR(R:1D@9a0&.PAQ9LNO6(V@T
H:9Q-YZ</#1Ac6]>+9WUAXICSG_D0IPAIQF^70<KaA60,C.35bCHA[+.e;UIafJ]
XP8</\b;<GD<G#__6L>5N_ZaXPSSHLgM;K9+/&48Ke)<BID\+NHSf0MF&#(6c)5X
6Y:>6XZ2(RBQ8KJc7)9SgPAb#PR472-D@+fQ-N0gL1UDNde#QC[>B]Y1UCCD;I44
Rd;H&[SK3fZLV@ae29?E+I]fI;F54MDUHeFK>8>9.b-&SLZ-f9683#Ke>a)PD5_?
L?R9C>O84T8=AWN.]:Y=)9?YcY/]J84/@HVRKVW\PUJI^dC.B=RE8SA>8^U/2RZC
5BU@^Z_)GWBFGacE@LX(US#(A@ab.WVTJ0c(S5K]+egD5a4B7\D(^d-<A<8FH&N]
1D?fFXEYg1?PA5U&VFaM^=Kc_8DA6JOK)X.CEZc^I\&]\NNF0+TS4NdW0@/#T[:g
J@YDWc?)1^/CKaUIWK^K,+QHJ@.Z5dS<3YBM[?#MGEW=,IR9Qf>\,?V4c(U75)N2
6+UU_4dg5)d;+>4G_>H>:H7ge&RO+/NZ&V.0TZ:.IDQ+W)87eF^9bQ8,+fI:ULd?
VSQG2Je[[A5N.MS.QO^MIF>7BdE95RB]+JQ)4=/&+S_IMKXMbW2&US]M6&ECHb.c
@B@9[4e7\D4?E([[+F.R-]01J\Sf,B&bZTe>34FE6D^SgM3/.6fAPS^bJS7T,gAA
,fe:a3&#MaT#\aVde8_D7<LEH0_gScGF2Je5ZIJ-)UTX:0:5QA@-#KT>G#&.fY:R
QPPZVALF,XG,P,O/KJecX<?KeFK4ZRUZeRgF6#PZ@B,+=;0,E_e_I]N0S>@?ECBP
:V00>G.dA5F?Z18&1e6I&8KbO6R)@]/DINMO_XJbG?4/cc\2@aPI=&6<+RTO^+H)
]@EIFegB7#@PUGVZ(ORc.(]^]g\-]N.ZY\TXRE)[:UAGH6[0DCNU^;]-B]+Y3&&R
@?/d&0I>11-#C]/M;]N:WOM794OGU#I]B7#<#fgFS3.)cTKRYD1ZV=aDBD#1R_W?
D/^A2A5/+N0\(BbV6E?NSX=RP7HJ)bF/>Z;>/T0a]GNTTeNEdHS3,S0c\FIKZ5P[
E,(ROSfbL4eJDMG+?833YPXMEE^gIZ;88)#GKaNeZc3H7X\DPPM56TcSZ/O95e[R
f#MG::U^T42CFe6MJOHa0UJ,9>b<0RIU\3.HQVM/ge4Bc#N)(5:.+<F(49Rg/W7/
Yg7TXA=EXag)=X-OUAfW<dM4G^NDgFF11/+fb-WgE-^>9R=d/OA+S[WJ.=Wa4g+4
;B&ON3CWg6J65L9g:_8CWV16I9FgDXOP#cg^V5@^5a#C\d@Y:7(CMZ;:AdB0agFT
;[,d;<,a:Yc\7XCSa_]WXG-L+.Dc[^e3A;e+e_CSc5PN+>>:0CcN0O51GG@f=C)B
(AP)GC4ROU/Uc1)V&GRF5\UR^d3HKQ<>=bZ)e4CY@GLGEfMS2HI(fVf79ZSV-IW-
@I&]4:+ET?S^/b7fP36]1BIH4[9g,JH]])[U7]KG_NOQH^1c#Y_T:99LN][c^?&F
g2HD6gHY@d3B+36@g^L043\dE>6EOR8WWddO0F[?R&:a;E<ME+#7d4bC\RTZ.+ME
N^)H,[5C66PePAeC+0,(;c)CDEG?H;F)<?A\-?BbZL&0bG=&V=+&KgBE6WXg.-(b
^L]?[3W2X<:^c9\(gPQb(ARP:-g>g.L=##0G^G+UGJ;_O<]#&KN2?VE:8J4LZZH3
=^UbJ1^Jg8cV-.-Q9\Y>F(-fGV-IgC]>HY..2HYT[2f@+&]f;W0<-9Ia)WRNG,=^
A@N8P&FO3e9V\TcN?8P0=N:/J14e^E9BaS)BHV<a6DQ<7(1=Oc#<aLVS^1,:>7QN
WV]LY=-8<I-^:dgGfQA.4H;[:YV=8+)G:]:]BP=+FH.:DI,^FN#VKDY_Q5a:4I,M
CWJGf4G>=aO@cX&>GDGOZ+Nc[SS^;(@AMS0?#LVf2#dTM5DSbPJIGGS27I0#?&1G
g3)GRA:L2GIdSH/Z]G5+P_C=(B\VL7XHLabP\A(S3L;,eNFdVO.?a1DZ4ZU:MJ\<
Z#=\F2>=Z&,8c<@CYCc7>3d[3&;Q/>f29]FM5EN82c0?])0XR8.\XKW5W5AKS@g7
2W<143R(MA+5Va/US,bCXC21,.WO/9bA42Q_4+JZgT-7^1PA=13?Pa&dd5U91+cB
:\g[E-[_\V]A#W@gQcgb(eTDVK0[Na8#B33KZa\)aB/R9M?&a45d0RJ^@08Wa^dP
\_7I<0L9^CX()[OAEgQ1a5Xf,V>IH>JBcGANa0[\e78A?95b<>4UeJe_1WGR[8Ag
?+O3OB<ZcYFTVJ?UCB<M=]Y6OEGa)<M[a:6P>ZN)BaNaQLP5(MIeV=Yc=dQ<Tf&U
G_/G&)6MPNIV<N=HH:PLXZ@QSF=<=PFJ;=Y/SX=<E(4C:?a_bcM&Ne/7\KR);SQO
I3f6XSED(,@MI:&BC_#\+a;VO8,6U?A87I:X#(NEL&ND<6gf1U3M5.#;c?B?OfS<
SP27>LYD/PBW/80g7C7TE/fLTTK.Tf&&f>O[Y6KOPYFUd9dbW#QYcZ-CT9Ib67R&
<555P9eYQ/XNN=IUR/LVJQa65#SXZ(c:K.-Ye7G-<ZL&GQ2.MGcH<(Pf\]>QB1[R
9CR:BUI;\1,<bKR+:b[TTEVC\9<Ee_1=7Df32E].KZ^V=YdC]^)2ORVOV0H-?F(M
)YGD,57@BOdN7DHVGWfFW(&H&a]ZFb,gcP1G,#I_N\O6b4-,R/aU1MFXOM[Tf#1,
;dNM2N:([Pe^71SS[CPTf<2N<IPBd9J\K=)+]8]DcG0f[=D@6ATb^YeW1X,54M;;
182QbV.#]<d5=f;\ET2O@XC=IC6UU2BBB];/89+gQ.HDAS^C)IX^]2_f+;CD5UF#
R8e3VC]fVJPd<g_+e(HV+f+g4agAGL/b/20D3=gb;8,fO-B1>2\,;P6HY(9FSTMG
(K35MCYB2S85JDGI=K0SVBd.b-6:A5EL5,WbV>X,20DC<Q]2V\6Td<)Z^L\]AKTS
_fY5^6_6S,fM7HW5Hc-8#LEHPSLPe>>>g]/C7J\-QD/38@P6#/,CF/BS2UYeO,PV
<dFgQX,QAIdYgLH8I4L0D4A=\ggTQI<C1^DK:.#<H/+Y,OWM>XJb2d^5_f</cP<P
1bPafX#AK=fg2QU\,P9F=X9Z.ZHcO(8GbD>E+Q]MAaAScQHcUTXd3fBe0L40+QgL
Ae>0=7DK6R^.\W^TTYW]A;8UMA.A?#+KT/Dg[afc<R<SGbgd\.9XDMZgLH;Z=N1/
CWHD3M??J8f)L>9\)<J(4R4+/:8M?3HPT<b2SH@TfY2H&9R&VFZ5\Z^Q+@WU0MGe
@0P,:03E/g0A3/T/O^\[Xe4b=aQO45cQ:?CN<TL;JGV^4e>#?)_<4I:@;F4cLbTc
777f7^&5.RG7P>+^6f24BC^MK0GT0/G6ga9d^MIHCfTZW.LKd#S&_FR3g7XD_A,d
46ZL\@<Yba6CX=e1_SfG/d8EIC>;6g37Pd,2,7C;:CUGTc[+)H?JgQ;d[DHL0Ned
f.P5^4B[9Z7+)D+)61a&^HPJ]65+eGg9Db-2KLg=K2.QE8??1/BR#W6B^AEKDN&a
>18&eZF38DXd6UFPZJOT<PI6\H3WY<Tc>88^VY,@E1Z<Y7MDK[,[YVZ+&[PT3eKQ
</_T9>)Ad4H6AFXOXX(0cJXd,((N3gZ&4M6^TIAd^;\gOKU:VR60&/7EM-G?g_c]
QMZZ<Wf8YDK#2BJN3X7UA<7E>E[F.738FC=;0(C3[.\5A2I@>:Xc13Y3?&H;W9I6
G^?=;#UEB5_?4V&):TO-\29;1)#B0]0Y][5&0MXOO<(@#BQU\>8RG\gB9(2C2,2^
CD6bD_RN:a#a=f<e:)D55FJgd9FC4eRa>1XZJ,@/D2XKaK-#Mbd6BMH@&=4=6K?E
?UX&3^7]0L:Dd4#GBa>C;8A<U&B>7HWCBM-[5Of-:4,2g?0AU8AYeYU?+&0>R5GL
_BTS\7#0=6.Q/7D9N:.XH12g6J.1_H1VRDQC+dg+B86S(2-\0_H)CYPP6.8&^#>.
H^KX#>@FF6_LT3K,g&f8#7@b&,&PK^&-/NRHc8CTGG;X42^>4PS[?c6W=^N+?.G=
(0ACW1Z;(L7f\:9)#aV\UZ3L,[bHST.W3-D0c[EZ\Ag9MTBeE]:(e,\1N+LE3/TA
Mb[WDad0gGM8-#R<LN-QQd_M=d3gI2]3AZ/0?7UL0>9L:78R;/(-ef\[a0GQ^P#e
94U1KG@gL6:0#-DYN4503GM92[a??2F\FYFKW)5NcCDgRG3GZ8Bbfdeg5XR2a<e:
d&^6C43(aP:?]BP12(]SE\;[IXgC_4C9L,L[6A2R5X6TG)?dQ4/IM:^4T^^,:8,M
Df>O?B-W5AJSEYV],^_2:QD2Xe.DcN<;ag[8eRcP2Wf4KL42dCHCc>Ff4H<Mc?8_
-bG]-I=B&&+UV#d/<C6OIZ@);<bGU>ET3gQ.EGP\9S=Y@]?#YeMIOf7PY47>?dIM
&f&cO0UYWAA#aCX2R8b)L_\/UB6RZHg+ZW0,1a=?;]F(HcT/BB=5TbUAHI_]<)ef
fecW::YHa[4-/-[U#Q0Fa_P9ac;d=B:-I;0c[==,,#+cgM>9&Z6RfWSF7TcS#O+:
0Ja9bHPCB7RRB/4.3+QYS48Jb<fEK>D@(DJWE3C#\JM7eF>?F4CC)T,XC@<P]#4_
:OJ0Ad)4+^9a[U]fC)9)S<c5P4);ec#BOK5H0YQ@;]64:53F<KY]>NW64I58-7>J
E]/TdVB;b04ZJ<BT#d.ecAYHN3eIOC9_g1QLR/>:TN<=;cN7Q25b.OA)M<gOBa40
dW8]O/@b4N0H:Eg6COa?-Y8d])(MJD=#6/_\NI,;b7(.RC3DF]+9F:0>d+#.U4Pd
3RT8[[ZA#-NHd=/:#M;>b30:Oe/gV71VT;dUTI?Je9+A.+C&/77FQ@bY3?\/G9>-
H3B#W9]W_8)97[401bSYfce3/b#-7>ZQX10BKOaRE:YdGS2;PBb:Y5<96C&1+H0H
;WLIH&f><U,+Y5LSX;<O.KZb:M0OB:B-3dH,NF#<b>WZ],=F\cJ_M/U\K4HC.Y+I
@g(NF^cYE=Jb^0O<a3?E9#F32&b(L;Z41ag?R#UbE;K7\BbD)^=AW&De@Q-C-8K7
+70V<BCP:?N;Z&#)&f2HDDI/@KI@P,eXY[g(]-K&ES:cXHW4:(T);]PIA3.0T(^#
IVP>@eI93bG).1+6W1RVfT<-@YMFUZEIA506S_0A?3f2H>a\NSP;QFU,;KY7e=J4
RcIXYR.X&@:EfZLbS3BY<e/=3NWc&-I]B3O31WSeQ892:X.^@T:=4OO/W#W.OS.V
46H/JaIJA2B7LQFJP\d)7&#?)+?5I/IKD:I6bXA?&^2:Xd?=N;JK_]15Kg>dbfa8
R8PMGC4_^,5>V;@^QE^<QdaMDeb:CYc8NUcE@W-KB^+785CY25EKRNL2?]B>Y7B4
2_W^;7AT&N5>Zg#7J/Y+_MV(G]M8^<)ec(2>T@5ab&][F.-UOP\7Y@eK-HOWM_W>
b#?;#P<<fGRP+(//,U>;9U,Ua-Aa)/&C[.[b2V+1US?CFB:Z.PSRUQ/?O\5F40^C
\2R7(3TbA?62@M0@YQ-:5CT.1@EV])c_A<3XIe>5:6U]CZ6.5>_2[0,U.7?5-#G=
3S4D>(XZB3H4<F52(G.gF2J&4(E59;)H,6D.HD]gO?YcL/C^/RJ2a52[N+#0);>7
5#(?ZCdG[]U=7CPID]Q::@K^Z//<4RXG/;Z9W1)I>cBCD/-Z;]g4B=N@@-AX0MT1
:L:gca^HK@gC8V215WT\H?MK4V5<_gdYdK76,?LKVG=VKc?89bYO=9=e-B;9Rgbb
.QA.Mg.c0L.#WZ[FSY3a#9#\2,g0=0:cWGbc/6F4M_/K(C]AO?I93X=F?J7R@IRI
7@)OIfPWN/O-f,->ZaSQbd-ag+>8I7FK9cSH_/b?LY8B1E7<SN/L5C,(BPAB+<&X
Z7Qe^5ME<B=^7BXd0R9d6K[5FaQW(MQZH_]-IS9QAPF:cK[?eaafX2V0Q66M)M;X
I3_J)MfZ+Y1b5F>GIUV.83VL/-3ZJM?80^UPN3CJ+c.AQ40Ja5O82K<),6S8B9O7
9Q@-dWJ\?dSK?c\4N\UT[GGU4R]_?;&Q;R610/I>,A^S=#BQ-#S0XAW9)JSDLOV>
N^^c^:FbMW_OU[a<[IQ]UAE&&FaPNQeIL.C=8Fc=I84EbX)XE;gEQ@c&U+ULbXL#
RLf<-d.T:[7?4aM1G6\Z&c&-:8LIE@TGc7+/9FRZDQ/9=D2MfV.]3#=(cRJMFGe]
1?L4.gE__?C,>;G@-F&2]gDL(]f)OHXBd,?DXg7)UW>T0DFHfPHE\XDLg>6N+Y8M
+Zf>SS:QO(fAS>1A#>(Sc>R>&_Y0>(NcWcEP^c9(HEb);[4Y3?OTT6@:QGL[[7G5
(.3.)2M7/?<;DbMI5_&:(T>a3O.65Sbc=MPDZWI(,#Z/cAZ]I_G<5&C94<V/B_7Y
Q3<A^13;O6UVVDF>TbKfB@D;LF:UAI>8QL5PDEE=8L-4^NYLK1cGDXU5;]Y6OJR(
4M0.W,ON>UeLfJ(KeE;K#F\8f^eN)5@;8RR+(79F&HML<a7KC0,A7P7NN<]0:SO,
76P-YUgNMbJPFG?=F_9>J:217/SJ/ePf0^V=J]f7-^aZ+QQ9EM2KY8E]O[&cMEFR
MJ];HdF(3B.D?4WB4C#AN-#=,9/#?(M<.Ef@2?^P2C(TZe.NR8L67Aa/-D\UV^f7
GMMR3B30K0ES5AR(=DdU/):MT7aQ=GQVC1#@(-U1Ra:eHIGS,NV1X.278b)ebbdc
[RVB;):_Ac<)W@B8I:I-<+<?XJ6OE[XZI\K>?RQ0bWebS-gW99Te)#K6GDHN+4Df
8>N9GKXZ8&(GK(8]G/IA]K?QXF?ZL1UZBR].Q^#c,<S1ee1P/1(/PY5aT;AWHX/g
2cP=XeNJ;=.DbVB+7RK0/<A-1JN3f5d:ZOX8,F(31]E+KAURg#JfZ5LHG(EBPCH9
fI6Q)DB&C35J2a>(TBPM<cW8<-X?Sd_RQde+4R\Hf:J8[BZ@KWTAM3^#N(Rf\JNV
5.eX@ZK453cJ3,TPAHKYSM[E?\ZbC,,PE3)BgPPNH6#4LV2;V^(LKfM?(I6U8ZKc
K/:^QRbU)XLII9_TEY7P^J9@VI,AP)^b[PNgS<7M^TB:Xb;/KC0N#IS&b?WH,J.8
?GDTWe[-6B,(fd]e28E[>47c+WW(=Ka\)#.gZG/+ZP\2FI[Y?9)UGYaIS8GEP<V(
3E@5f>DHgJ?8_\:ER^7\>gU9EBc/P7d8#Ve5LIG);GTd(U@I)+cV)2a@/Z-Hfcf:
N;1E<790=c=(MAMSa6+6R@WM#+@eaC]JH:6@;;DNPcL/S>Q(SW]D=(G\bB;PV<1/
aVF_3A5]gRb1DSEdM]]aN?e;=-AQBBTZQM8/a]J@Yf-@5E[0L.BOaJIT=Q696@/B
/)7-S3dEcVSNXA+fG@A?=7(_W(-]@^+_ZVb[C1O=@D_+a=A<\5A,23EXAcDg_F.W
\3;KB_Ae[BYAMH,FNe5@-cg>Ib:Y9cN;?UO>LZ;48_A&Qc9515a:KM)aN9bBRBJ_
cB8LIO+D[4T.ACCVW+?38XB5R3Y-)ZDE;^7b6c/e#^L-PF6Q:@5_N9C&\H;=cNDX
ec?=#.XIG820>(gMVJ;@J+:ZOG;_X12.=3++FO(a/QVC37E/bFKQ(30\4G2T0Sf?
>W0+;cJ=FZYM7:&J??c(N?bE,GS^eWe:H-W1D0HSd40L&Z2&P8;=-NgIPXGdG)3P
6Bb:68I5SKC<40Ze9=M2^2@C9)WI-S#HJ1/TQXN+QJ?6MH<d=QHRd/H.LD.)M@9@
1@f@S8-bIf^3@L4]KZGXO1TQ1-,I&ENe-Z0/7@GM,g=N59b[Fg254;N/bU(NN1H)
UTGU/(YS?fDb3aF=-CLa.I(cX]+UY#<5.[4/-d3e9ESUHVYI_f<]=0Ha45A2LY+8
E(2,XFaDG1V,6GH._M,e=aW(XP+<SDL5gH8:-AS^=U1H]FC)V=+>@e^ZBQ5LW&@)
fQ]_N+G6RRf;=D]Bc7I+KW4B#&8f1G&P,9<\6UI(ATPD?d6=.=6.L7QA&cHVC)Nc
_8AGZ.^S_F+DGQHQ]<RGEX9\#5[SY5+R)[;Rc6/@+f1<f)(ObZZOP=]B[>R2\P:M
+H^Lg9#&H/HN,c\#eU-N+6.-K[CTB8O9GNSc<7b=M1OYL2R>I0#TF;JR3>EdU\=O
FGeAa:bEe#Y(PD0:]MT]O&H@GW?((3IOVNQ<Tf)8Ab:6&]\O56<6L32.[>8(M?0A
Lb<Vcg_1<//Md]C7E^\0LH\9M)[Rfd3E;aYI6C^@D7aWH=,D.0aZOB7ZcU;f@ERC
VgZC?.HX\0#H)8beV0IbV;<DeHfN?1WPT6(S\.#<AQE?^+,^ZFJ<dXWeXIW4#>Da
g?R:&J)4YfZA</-1C>0?<#-(d^Ng@#T[-IMMOJ220BMYO2Ab@RT:_WAa5QKIc>;4
X4THJb9N>7VF3/H=OKcC[e+/DR2P_(b#-?SLUG4];M9O4;795fC.f>W]RG=5FTD)
BYgU5GWHDG8SOR+F+9_gZNfDLQIG1)4B190?A:]9,gdKQ^V1HaPGOFR_(.>N^V-e
#3>4A_T/aVSV1?&5>^BeI2W<2^SY+;IZ;0X^892-c_1f<6)H<4\\RdO3bR)JRP[6
:K_IV3FBWcc,-J06C4cSVMP#[VOcMR+EeGDSNaJf4dJcYa:f6[+BG>]OAbddPC?6
5Y4/9K<UG;RE6C5D-9CY4:-UBf(B3>addU@P7_56-TfNc6Q]WKV\g]O>F.1<I;XC
d:P:[O]T9:74_,TfRWW^c@.(d)?3IVEG8X547F#)YH/M/VQgB9C.T0Adae>Tce.+
&<ga&MLNNFB]8a03HZ+T.ET&=g(SXSff0_YW,P27)]Ic&P_0<e;cXFP6?e77A3\/
DJU5@/:^\D;9f_^,?@00]3-bOa4(FRC0eBP6[#_-4Y+25HW>1,3/cSQCc>0Pe.HJ
64/bLY0^-D\.cK3[]=QWA\XCR2BI#5DL6B(Xb<G5.6>E3R,/UPKe9gBFE#@K&8QO
BI()KX64=//XY6<LE_Ua,0\SV^_QfDZ(<;(O/7eX<B1VA6K39?9H/>1bYG^[]P\J
N:_/]0Y(BKMY?EOTfFf19_4:.X)].6XBf:@(4408]a+Mc87-\TW<[fG\_8c470EA
M?Pc,Acc:UgJ2\S_V?/>8Uc?-dB?.IVPAR4cD>4C7BF+?f=?ECL_g34c0AVDZaE^
ZQTXZ-Ma1X]I06Eg+@.A-3H5Mc^]TT-P]J1^]68c#0I8IF_BUQSXG3M/,I1,)AIb
7.9GVKAQe=D9J_J[367XcIfGd6<@AUW^IX_<H^Z];8JOYF>)B/;=/PQ.&?d=2^N9
:E8D?JeV3g(K[N+#6?2bbO1fE;Z_QO8;@</4]R361/B0.bEEY0-92bJWJ-gZ/NK:
eHU:=^<OfG85[1>dW/PGE^1N64G6WDOO[>+C?ONU[C)/ZG(/?67.PId]DD\4-UD6
UYD[g1?E8:0>]<Gb\]7;?MLBeJ;;5&0dc_C8a29KDXT61C(5LaF9C8DW.gZ5aL\#
a-FQ565E)6-dd^[bL+eJ/43E+O#8(Ue6BTZd2:5_0I,35WU3@QdacEA8dZ.9K/2D
X=N^\d>IaZW9fOY^_E@@H64-@\g@a#\7R327?f)]DDaef(Q53[#&cK-9].T6#+Ka
44#+)ELF4[]I65OAg23Kd=aUB/^.=8?CbcNb&&7OGL>/RDH-V(W\&FfUR(H9:/bd
/d,:YUb?YO;\9c772@3,cH>2WH\9:])gg)aN&1_XAcT:<3LWR>-;=G]4/N+T29G9
6dGfLe4Q7/R371+HF]0</&@HS7QPA4MQcM>\0.?5e<YD\78,DeMc9g?XMQ4aBMY/
\BKDU_L_?c<3:O1RX>V6^]\We)\&D0f[UA+=&U=+=6e\U7?7]2XG,(Z[H&LHB/gF
YBBVXg\M/WI:#XG)G[Sc)LJ8KV6\aTV(28/N(><01:@9L=.ZOX6]&4/W<L><NHgB
<1M8D.dHF]R&L3GRM6e]Lb=-X:NZ.CX.P>HO+U#3@FR,[?J:?M#^.3_U)AB\HF-]
D).9H8V.RfVR-1F6#\W,g0:-LTUOS7#JG;>Qb&B1N)RW?J3Q8P\O2Ic^aZ9Ne]VC
b)fQdQN[Sgg\;g/SS3<H@M.a#Q0QY#)>\>\K&C3:T1(:9RE.Y;]M+WK<[.-J,AT#
RT>cL3-,B:_Vd3XP:=TO-dG,5g3=.0gII31YBQUX9=((]O3M4)=gcFJX[=9#T2;2
7NFbES--K:JJgKLY-IRO,d3#K#.,76&YLJ#>E8YdY7CW=UCC\d(=fOI]<bG2@VdA
+4S/D0[YCJJFVL@)?;BcUMY<0RH)ZU^37fg97Z^D0/7G,@2X>UT:]NE?SEV6XW>L
B5f3[+DO-d.fHZ72>L,&dcPNPg(/KP/C5<PJ5WDg&B>I<.KS0G52PJUB?YcRO^X=
O)9d4-d,G2a7UePGR+=V?OW2SJ\;:4cIK#ZS>OC;<c>MVLI#>f,P2E[cB4DHB[V<
]<1E[NQaO7H)B6KF82S9e,M:&AT&\SB7?;/1AHeZdDe3HW[,LL9b32[=94eUR5H7
33BP3EOSEd+CRRa:A+P^YG&4MOec:-;g8^+8TN6JQ##,N;SKDD3cX5ZV9QKPQGM7
+.\;1\<]9@)/Y3eENRK@2d@NaVg5gYbd&VDN,OAF=D^91egd81gYTfIHV;R5WaBc
ATJW0H9<^)Ff=2\dMMK>?B[d0-b9O;8d\90cgEb8+Vd/;2T16HJdTAcOP0=S=GgJ
B4N3c2G(D0XWd:@c?/J/Q[C1;+F=IC;N49Pd2P6L:Q#dG4;5UM]YTDfLXNIQ)N+]
DU.7f6,,B0)7FF=)ZC@VYS,f>1EQc?N8L?AEDCeE7cQJX[P1F_/+HfM#ad@NGd34
K>S9X&S^J\8Hg(bQ3120.Q_9^U3+\IFaHU7VYgP_T>GH@?\@17eUdI608aY>gH\U
^C6QS99Kc[@\dQ\begE=+#N9<SIg5c_#R>9OLI2_H9gT?M6#5dY+Yf2,(B&eK>AJ
QCPQg@d3#(bL+>5Je&QNVCP@].+IK0;F75<c((Vd;Y+)G[@J\VIg&g_RTUOTHS74
Uc3&gGMA;6E++bT7V(UET[OE^31&P:L&1T5P^[NF].?7dVO.R)56FZBJEWV_[VJD
c.WMPY7<8I8:5WMLdI_5ZW&JP<?FHPYH8?5UI6)(562O;8):2dWJ7Ga6c)BX1T=Q
8CC.F>.+PCGaUfAg5]GR<8O)gQ\,6,QK)#&)4S0MWd?Q(a+INdFB7V/](3E1O4VQ
S9[,K(AARD&M5[e)Z=<2Q^SN4H^c7M.HfMS8(5A5U;.X[D735M_U/aAegFc@THYL
f^f6Y34>Q+9G(,Ha-D1N@fM4TV4>L)G@7f,MZ<7@c13JBb6SLXA<5V>R@a[0=./E
bRRINKcBS6LX=B13C-<Qe6HTBcAMF[DP^<01]K9R^]X:3eU\9P]SKFcf)VgW_4ZL
bC2[bTLgWA;-e.I3>6:;G5)F5-AQbGO8;,1V610GVL,d4:HQ)QJH;d)-IIB7#@E&
3P+TIUQJK0[gPP=7SM<L\<CW;HHMOJ+D]Ac\P32dW98+bI-,f>Ke7F#0A>)JfJXT
[WSH.,a;7(d-CXEdZZ+RN0UU90A0X6C4&\Y^+(c(@F1g&P=0;MZ>(XK<C6-2b?E,
U:-(F-6NONde[ZgM++Z7_6+P9JIJ:GW1^2OXI1C5E=L6cHHP=S=C\c0-Jd/03WZ4
,HVBNQXR?.9(\U.g<@M\5E?5:B=:RWIUdW4#)B?4[gDB(.R]GWWb.Q&4QA^^3PN-
fb)ZJ6TD&:BSM0(+0aF2&WG^N&S3IT<\([P>3>bZJe/-?ZD5)>+Y<WWJ>@+R(NOS
Ce.:\bL#AIQX\K0eg#,J6,XMRO+63O]6N^S]6:-[NJ_?X_V]cb/Pe/Z[KC6)GH^:
Z0_FG&M#7M2DK]Q7-N6BeCKL/4.cG;X-]A#P3&V/U57f@0&OT<PUU]I8@CAcC,-F
ATC2^gZ6.-=FcZ>6GPe#HV<P/G)XF?&G481GLJ?4Q^^01+2#[]g#J5P?<TZg8AY8
6E6_93Y6QEL[74adQG1L:Vb^A\e4+Q]O.<#&P4T1H,IQM0]1,g>J+L,Bd1GN5^Z<
I(6D)B@1e<b78b=2?223aN>CbRMDD2H#&>dLZ#LW3EHAO,+[:B573;CZK@YY2?87
WHICRFJdJJE3S>HBc+f7B,LMa\9_g;c0:@8\cAcDU9gSgUB\1e75GB(.>3L@-JX@
G.7g/:dL]ZOZ,YZ.T/8.bA29LcMC<0754Q;TU>9OB8\>2)F92O0dQ,1>(;&^f;GW
V)BE?&#06V0OZD#d17Q\11SeKbS/)d/8>-YJW\42\F)T3M<E<?MWTZ(XO6#?MKIA
C=,@eE)L8S&&.Q=G#;[?:^XEW_S,.I<;7cQ=JBBU38_^>1YP@A.2_ed?aRG(MgC4
>OD/\;Fb#&--+O3(Q]Yb)^PdZR=6XHNSR5R3A=V1A.<2;G99S49;M7U8]C\<MJVR
Ifc37MD?>4<(9X>Ba^QBZBE\O@7:)6,eR;N#\WeSO=DB0(68H?&RaK-)+=AYN7J1
1BCTd2UJ0b)YVAVXU4)9aP@1L:8:535;[F+(HCbR#6<JV;X:S#6A.U&3OF9.D2D=
=X\S+&aa3eZD<Q@D+2Ag-DLfc?d5M0Y1O8V5dV5bJYQeJTY::8?5++(+N0XNQVfC
.6#JZ;XZKe6,Z74D]>5R9#V)G.gKRL;&CZ9@f3X^P[7-UQ[QgcF^,TAOc-7PPGJB
XVa/W&_8a<\XD@MN^Y^#(+=H)1JM5,OAeDg0IS-=0\K\g&K)5NYBc]]W#(aM1:4G
BLOMH^]f^PJOTAfP,WC-\IP4Y)6D=0VSX@=9c)MH\KbBedRR(G@5g:c/2fUHEbOC
1G9&PKKMDEKFS36,T6ZZGY2gP44J6:,.SP^0M0#]g@IQEABM,CGFT6BN6<RMO4ee
I@,U&IY(AR4P3ZGa;?&=gRQ?9:M#8BU;K1U9)=6QC)V90=AXQZ_,Y]/&;;\J+[;.
Z/88)L[dNBfNC5>X<Q/]f41<D\&e,:HIPH4/8Q.E5N@R?1.@:[FZK()IcE8RKPWW
Egd.8N?X+SW&bU,Z)^@D3/KYDc6118F=e.9&Y),C61cLY/86c4H.\7U-1dK=JGRC
/:M2ZERB>a-+-b2Gd^+B6fD)?S]-Hf\.NbgT@f-U_X[d3RHg+#f2Y:[4\ET=X4^K
1g,&<Z(c?.db?JI:?8J_9^^,0MSM:Y54RAJ7>C\DTB^QQ?;UT>3:5#_g)8OIS[IQ
#73+d8XSS.X1K\bR8=aQ[f7c/gG3c_c(DOC3ZaMS#1;S-DG.-\B++_M0Q5#VIKV3
)35GcDEP7FANZ0CB?e&N;9H^,-_c>FEDLS1eSD?f<NV3J<W8G(P6N,N)<W8M->O;
8c)Nc<SH)a1M38=BGHD-U;:[1eec^f_KE#G\Ib4Q#\B):WR&=1P.IaZI&XDSRLVO
f78ZK9PPY)^AdQT@_ZOI]L[O^T<Ecd[G+(7cRVCeGNP\:8I.BQ29-DQc;?b1(E/-
V(U3E;XPd8;U#T5QggcULTaTO=8OB9Je1<T-\(#W=T7-R6@Y6C+XAJNE6RFXD?b6
/5M+[)@5V+1#5C0aCCO9)UG<9SBIeb#Y+YV,Q9c^RSZ4D]+g7[2?RNVZYME?5aG,
PP8R3_b#XX[dBdMUPUM,^RXIcSZ0JI<a\NXV3?(e.P>@E>RIXBF^2SI7IdT4[EdU
TW\3LSW/3?K@MX:/fgE#XVLW1<A_FdW_=B6W(#,@+,+7,f;KBPF)JLF-dg[C+=-^
=RSeLU-TXZ<&+]KBZdQSaJ>B6U:#SNVYS6)Ya0GC<(#eW@(4^\?7N(.E9D-CC\SN
Z0J\#M.&Ccge?ACD^I?X_C7Xc5O8<d1>?B&(^NSOgR3X+2PfAeabUJB?>bf+:Z3E
D=8#LgCF5c?fFQ7.Q3><adWKO<U/-5YXDU2^3,SQ>Dd?TDbE0XHfZYOfJfO=bA4(
7-.BR;U@(D\]fHZJbc[KQ>XLE6e0M+d5O63O-YM>dPOE[IH2A18g=4,)(+I.9&6F
SeF>=eGa6e]2(SN\#ML-aJ^;;fgA>I+eaX#-8T.9RA424b(5W3S+XTXP41+MWc^I
PE\65fc,)4R852MXJa+AZfS_Ia:+TIDHFI/C,<C\Z0MI]C5L.:a<MH?FQ6KMQ/J,
-FO_&a36U0/GPJUd6SdO/:aPB1G7f/Y5\W\d?cK/BfWJ?N]7C]V8Ce^8_Gb02aBW
/L/JG>^E6J3,9C9(d7=eU,,,Vg_[Tf8@(1YD_6&P+<f^K+c\\CALB]Me&<N5JSX_
HgJ[.ee/Bf7Jg6XOOP_D,RTPDR@>I;f5Q,cXa2ZW2dc>1IU7_BaYYbE^EE8&ME22
:M>#NSDebM]3(7LAb0Xf&>WRRPQLEA./)U#PIIPJ\[[+4;,,4^B,CQB[(6MH^f;(
(K\+24:L@8DabS@_L[C_(#:J^[V/N]/;c[efJZ]Xd[:Ud.F]P<-CI7e^KagMTS3(
W+G1VaELMD2D_DXB6-OQC@9/:1YaR3#g?=.9KX(HL0Q;Q=H4QgDJFHf0ePfD+3?f
g@,gX3M&RfZZ3B44^8g\eHgM3?VOfRYO6CS6KHS#7BGJ:P2#b)D5T?5cP<EaO7H0
Q5LF\#;bY2#a_LAfGfPA<\B-?YQ&@\+PL6>]96HJYeFJ.R&IB(Q/]3_g6b-0:C_X
NO[bS\B>00ccg/42#BLG?3Bd.Y7R.f6AdMBLdELg6aT+FRESW,gK,CNK4;P(^^0/
CITYc[c2XKP]]Q+fFE^X=V3^82DB8-g+g\UB\G@dYd1&a9&UHecGI7gAf&EcN]/B
D.W2F5;N#<\ECD\Q7(&+/KKP;F,8I_XH+&CYU.Z-G(LP1Vc)79gdS[I,f@CKM5JD
7PGeTMNBONeO@[^VYH)G(&S-,C95AB+UP&OTQK;=G7+e_S(W(C18K(SL9<#_GHgP
U3D6;KF\faG^QW-?;eYD1c)35OTgPgf3(0WIA1Z7c<XE.aQ;#a&Qcf<]].<P\AV(
AJBeN_RY?Od1?><[8E6MYG^c45E_KQdb]b7\D\G#L[HVHe;6L<_O+RGEf;MbA)fN
@,&@gXKc-XJ2c(AfFb=+cI&,P3[U?\&5<QTXY2W\CNMK#M@R]:K_8QZafUa#8D?B
eGVP7)LW+X6^5fQYLH^YX8CTOb\,5<HQJaLNHfJ/9Bd=TM3-eD[NE)S2U=[TV&6+
0Le]9M<LMW&Jb^ET:A[EJZC?fEQ-4OV>cc^1>R@QFYC#WZ,9e=VA1YPGe;,&eKN^
8(g7^Fa:K,8O5A@#KH7d&b4;V>ZC93X-WX^_H51;;]HX=#^1RKE.G=gEg6>PDYN:
ge_F^CBKBL(G10UZ,EDLY_YJe4IeH_ZV3_NU9[Tdaa^MAM?eE\L_2SRL@\f(QIS?
g7<1#N>KYT@/OYS:<QC1;^0D]8_FZ)NaeBYJ=-Q4IeO1.SU,0,U&\c.]O)8X@NDU
(VaT,^Id,WTXKe;1c(?D@TY6[Mbc,>]OFe19Y.66K?B0f,+/Q9VTaad>,#5e)AU/
B&6R;eaW?L10;aR7d^I.GE_9USNADe/\OK9-ZI]#bSMgZ+1]a@Vg_OR8P)TNV1D<
KWc(a-9@W/7H?^(\PTH?cUe[,@VS]bKF)T/P?B01Yg;0ETO10/d1SeC71F7,0H0W
X)Y\6PPO+fNE#/223dXV(&7eU=M#Lf&f_>4&ce_MN+[BEOIC6bcVc:C7J$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MX25L_PARALLEL_AC_CONFIGURATION_SV
