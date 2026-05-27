
`ifndef GUARD_SVT_SPI_FLASH_S25FL_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FL_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FL family in DDR mode.
 */
class svt_spi_flash_s25fl_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns = initial_time;

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns = initial_time;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCS_ns = initial_time;

  /**
   * CS# Active Setup time
   */ 
  real tCSS_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCSH_ns = initial_time;

  /**
   * CS# Active Maximum Hold time
   */ 
  real tCSH_max_ns[];

  /**
   * Data in Setup time
   */
  real tSU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tHD_ns = initial_time;

  /**
   * Clock low to Output Valid.
   */
  real tV_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns = initial_time;


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
  `svt_vmm_data_new(svt_spi_flash_s25fl_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fl_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fl_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fl_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fl_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fl_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fl_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
bd/Y;C4[M4UBV^3M,)[ZD1+/KH+f3-6A+I&e,/TY[E1,^>)QCT0L,)&YND&K;63M
^RLfGf<#KD#be_B5a,9dMW.]<UX_eOM4#M98#ECU&TL+^87g1[[KREcT@AcUU_<.
=^OP,9A]D/f(f=4f6Cc/HBD8,MG=#&BOTC=982T36RG(JV#S_Cc:L.0E7LW_QSCT
a5Z]PY&RR0;]P[3ISOZKS6Fb2U+af9TSdMZ0I+-##WE)=MQ[fc6=7e0Zfa-N@FT2
,^,[DWMWR?59M::MVMe#+)#W=SN&L7BJ)a:TC)HcdWYPGF>+[+??8/AHQKRJg+_<
KXX/Uc08C@=(Se3---@UDV7\P(A]YMH9gC]1[,J_c2QWbdCVg\E(?T0;89OIDgX1
4/L2@N2Q.2+:d:^)+ca]Z5c(F.;WQ(4ESE;DUg]Y?0,Vg?f:COUHK:QS3PODU;8b
CD&SU?EN1]),=[dECL.#P2UR8\WO@0@Y8^_\#VFd7>CI8-EK3AIfQN-\F7,ZbaA2
-?K25/?D7)^CI=7#46HZS(5#,QVH4QYD821bP1.fMUQ=N=]@I><BcHbP+f_:b34B
5\8g]f>=A_aU=b/&d2M9R4,AAgc9RY9Q)M()6RFR)B7Q7]2Zac@48UA)([;RgR?]
-NR-TMS1WFIJa6=[g[AFZ^R(Tcf<Q70&+UP&cPUBEJIO>09)HO>W]Y#\(,S?+?c9
OHdZ9GUW#8JIe&<)c&<ENdBCHX1178V?EKDc?UOWD:N0=c^-])<=>;Z\_:b:[^#X
dJ:;Y;&#9J6D]\UUMWMF./BC5$
`endprotected


//vcs_vip_protect
`protected
_0CAA82d5#g^-Q>IaA[O1:TAO[2L,@&O]/EPaRR[\8_IDA-\UIca3(MXN&fLCQ87
6@9;,IUD:P4E-#W;M>W6fG&?g-\55G(aS&dVOfBba3LT#3/Sc<O[>PCWX<F.761A
1^5SRcd,;1g([FdRP/8SFB&XZ2f^Rg9XL83b3d<\2<;.d.I+THTUXT\J5a5U>/,^
TOH&d\\=9P4N,NQgW>HSA?&V>2^cT_,UK7G:c&_F[71]71+UQ5L?a^Wg7UdF;8/V
13HBH.M)c-H36(G49Ia5GZIcF0LNOLHbH^QdG\#9@1UbO7&OK;S&YM1()\N9b-K#
W8ZU\ANF>PS(a;FD/.WV):PH>M&HKTA.a:WdRP0P[?E=OBQRXVBZ3g_2<<CWAbF+
,FQ4;?^CW#OPXV?A:.R#7+M^&[-[]<Q9P[LCT+@:4RI^>DU16S\?TVQ1\8,[c1R=
UaLNe#ZYUABO3Q7APHX6[<9f4>/RGZO4NKV5R8ILg5[W/=_/d3?5gd)SEJ<_eU<Z
]MB^I&fdV^:_3^XXSK-<V@CLg78=UBUYKVSW-.\C;J6R5M7))T>0]eM[N@@DaIC>
W1a/dc#d<R<-T?@G[CBFI)/]b]d1V]T[-R_N9W3M2)CB[:L#34GP/7;gT#K@E59G
4KC3ObG9SZ]8(YS,TW&efQ;,GC0THFf=?4U.=WW)SI.0<KOKC-N&ggHC;&BRYc=@
d_f8EE/@;G24Y-;>g9L\:PTeF)4Nc->+81?\U2<#:aFG/ggbQ=1U<4)=#L@2U&PS
R;8K.NTK,ePDEM\1Z_.?9TGHOF:D.K7MHJ516GYKI5>H_fc_X2g+-N;3Y[A-L9(G
I+b-B0(H1:Q=X/G;<,QQ1g++].(3N<P26DZL]LP\7?18O]0fNcR.K9gV6C[/X\AK
92,&RA#A,K?AQef4)fU\(G?QC7=0XU&AC[-/Zg^>@^.]W?&:S8-NbOQ<N[?</K[R
f3R[ZBB7KU/=[[Re#FG-CIVO7(_-^FN-]6.\5#>AC6L,AaM-#K.K8LTYU^B>\=IL
a,?M>;F&^?=J#P9+X?eHG0<=P9X5g^IT--cL3T](MM14,7\QS4f]L?FZ5#F,7D.?
e8#gM.#GG]JR,\eYZ639E0[>fgZdH-b)ROBf^g3;dNE-7I,0UZ1GUE6U\ea5SWAC
4ME7Q5JN?4=EC19.F=NeNdFEbL]V?=:C,dR-3ZS=4b=H:a574dPN]W_6-6^9TG#[
WD.F^W#QBB,46G(Z0c3BN)>:)QF8V=.=49F=)e22,Q@8J7aYaG9YGG0E[9;AF\2^
RKcX_&IUNQ-YGL8:B>O^63ZaFLTYWc;T1SEPPY6Ld1#@]IAd?XXA]T-(2I;Q_4ee
ENfR][g\2c=JAOA6#/])cU8E#=CTL(:OX+(BLZWL-EaS&cVa:UQUXF2<)R85faKM
cdELJVE9^MDKK9ZZ/7;2/G_\cA@R7gY@XL;OJ16M_WI:aGAD]1e)XN,Dd)_9J<A)
#78#aNV)QO1AJU?3?E]TZ3O#=H3<X(4I0SKAadbY=B9:QZ9cgSU+].&cE1595dWU
]7X.X3CTfCBWg^<DZ1]OBMLA6I=CFG=W5Q0@95(=PE>\]E.<gbM/I=.g>K;^@L9M
0/=[T3ab9M&-b1<Z6;.V.NWbdbg9_15@/eO6e7XX.&eQ/#ZWPa.4;AB-23^efH..
>QB0@Zf\eSObP:Uf8>\S7.B+YU06[9<]CXN)WL6)^/5G]VEN[@b:,f#;+K9T\bFS
b:VD+XM#O77(K/WM>];\FEHdTc:\eI2@OH5,[abZ83eD)J#Hd\8<&c0d13DOQ>G-
<F^f3>.L@,b=f5QPUdL16,/82MaDRV+eX0:ZFJBLL3AM^M=89:S:M6f]Ng.SL]/<
ZO=V\?7BIW4B-D/LPf.ETHOf,([[dc)VIP-W[EC=/e45>9F/DD.D;ge>1CP+7fce
C?4+G\YVg]g],ZP;S]C86FE.@K07]S-Y]JUXd/,<0+PCYN3K2@&M]YTK^2gLdHQ/
ANdUM>g.bDC+5Y0SF9f>)SgOM3CKGN.5AE>Z.Sg6()@N@[a>]WED0[OXe4HgU]Wa
I4.+2NY^++ZR0C0PDdO)(LUBK==cFf]g?@IKA7:B-AI9b9X6DB#TH\UT@QI?>PVF
cc3=[JNQ=2fcD?2@[9R9R,+F)KgNQ2)8>g-B_KC6N3<-&FP?-:T4fg^4XSV[[);b
54?QC1IZ0b70,&9#P26=.5]&X+[9F<_GQM@8H)T=;6NJdd_1PHC2_SO/,;Y7>,K.
_[IKJMYd(9V#R6(T1cF+;fT0:L])a-XB5QeYLQH:Zgfc5UH(=@fZ;Y;3H_&+NKGg
HQ7Q;0c2;>XF@c__1Q=+39aFHZFg:WDRSH=PgEb,7?+3@;.X+C4I8f=Md:2Q7WGa
H-LH.Y;ObUYG;FPD^LP5cR9TI;+bX6)&Af\F3<bIMQI:4]X_3dM_6Ld94]fFOG-.
cKM+O#,;V-/K@9d(N;&P-UQA28[(<?I/gN@\0DE\P1+XO_-P.B[b2Bc#KI???RME
d);7M=B:(dZA,\L2D5JJD^_VKbAafA#ZTDaf0EKZBDB72F>Hc+fJD.X14^cS<8C#
gH.95^;95YCT<:f-:,Y];C2@PR[aFY6;.b2I=64&]);BH[,YQ5BC+./GB:V]4.O+
Y957^HX?FRIG_EI8017a^/04MNF;IcN3Z9.I_>?NR]Tc+Ub+/dJ[Q42fBQd:N;P^
P;f+&A\[Q4KPPT479QCVK/HRBaVF6.d66Z\Q+X8De.<&G5HB##OZ+W([W#8J5&:0
U>B4Y<L/W#e0V<(R+NJ;bQUHS^VSF@4Ob_7&:/T_CaW>=);K+UF11QL,HCbYEV3.
^2]KL)fF_P:D+&e@I]O)B,NO9.<3f1<J15JCfBCFS)[\)749>(@&Y1-f&7W\>=_2
6>6>O^OFW^KMd;(fLOZ&d]M0Y;>N_=L???)2<<,.d;_=8[^CHI,M7==T&4HP9gXM
K3;cdP3OF&2_Q9#AcC&V#[+9Ca-2L;GO&B<\/_8X?F3;EHJ(RE\,_&eU8QNafag=
S+Z[#@DL]A.@^A=:a4b_OO-W;BI90_K&e=.9C?[;VUOda:<XO[C:KKNe\(fG5&-C
#A2EDgZ>)?Rd)ReOY0FKM0#VO^_4MT0[9Z@c+=cP\7g#YRTg2U.HI[K=E@@TT+0W
\G/aTfS\MEBEF\4LA:Y^/)1..8aM3Web0E83X2bXGg.Ta3W:X9d8.A>^D9fAA=]K
O[1[6RVVG(;bYEQZX8\_098a<HPK&We-7FPJ7=LGV9dR2SQS,g#>,J7d3\)3F/c=
)>W1af_..;8)=V:=?1YP;g^^L,605+8>>b&7bgN&@TLFTFL0AN^;/fT6]1O0X^=@
b4&Q_aCC7Bf)J3T/Q+e)RF./2cN>I<]U)^T#5@DZccF?e017WK/+N6_a6(FEP\?M
-+WE?1F#M;\N,VVN<Y?RMeb&:[(Z_>dL-dCOSe5L-WGf+[)ZPB[5JVcMTZK]T1:D
P8c&bG5U]SZRc9fQ3;D+\Q6)&bRfJ.MA06:P2RLc<10^8(+(bWSfEa7aIb9A>6#K
IDX_OC\.f(]\<FS=3NgHY&cKP5115]1].,O)ZH3b2RAgW+_1B,b(FZR,N>JVZ)HL
J_2f5I[/cD[Y?^+_eaaE(Q8FBd6I.+DDQb+5@9@N5&[JZg3&[@Y(c.<#Zg/8H@a7
LBdJH)C;R3BCEg3OFcZ5HIRdZ>57aGS,9c50WdB7@,L?c1+GSH.A+3ELI_/ODbHd
9.\QF5=UCJXKI^&1X&)2C)\cMSTGbd#;:ZC)/e]OY1V[3D.KWa;(+\UQGd)F0a>M
[6]N<fT<Z?TAE=\(]7]e9eK;#T-F)Z4I))Q2bP6d@5HbRbWK58aUPA5_AMGK,-9J
<Nc-6DQIL:[\IP;=J)f],41:81/aGLZW#1JG?d4[=+f:LTFeG:;3C0D6C#\R>U?(
:U=dLJaFXPFe<M+:+?Qg7_#2aP8]<WH1BUeF,3_Ef_C4edP@&&@/5+3H+ge:MA].
;g7@2/SHT:1Y(fBK@.TFEVHR(NC2IUJ]<#\)bea/#f.0_N3ED@<8(BfDa)WE]6Z?
?/ZP54?[7H.F-9eXB2;cB.0HHLf1[7,4RFcQ_TOY0;SDKCJU)=#TGI<88Q9N9=f@
-YOA=ebMPT<DXP+S_@0fd+:d#<:S=F(0(5N:K_2Dd4OI8.<J.AJ>18GAH?P(dE7P
IbbDNMQW-,-ZQU?6,eL]Q1@)OE65Z9b@aDfefSL(DNA+\XaECPN@BVHdQBEe&OHE
P)dPXY]1Aa(8258g3)L?T<YIM=B=C.HG;AP?I.G3#V8->/?G)5R.R6L1-L@eJK,/
f,1W4YTC0^9>9:ReDecR[PY)d;D]?0U\+.5KF^&WA1<IH#XeV-1gg<9IaI7eAbP@
>:UIbFV(W-b\N.5M:c<MSgf>D]JVY?B<[&867)@H_?<#(Jf=P0b1Z#6ES4Q@B#94
0U0S>1(SJ48-H90T0[8&I_:TDN-+gK,;^OG2PCWc_?O0M_N^O1Y+;Fe9)E[[RO75
d\3KYY;8^8b[0J@:D>O?1J3S\d2eb=]-]bX]+Z&eeeUQ0_TUB0+JNE=bO]W_(HGE
?W+407=95cbeNWT@CHJEe??7A,Tb@R+#RCCg@QD2J?5H?;-?@M-.P7aW?NAZIR@g
R>NHS<S@.Pg2KP5?.SCT?XNfNGGbU1QQBfdeU)fM=Y5OBBKT,bS?MaTSLYVBSOF\
(\&@=(49C#ZQ1W(^RZ4g<3M8NCP_+O3g&,eQe^5TSJFe3B?K[M5E]HY>R]),=6;@
)HHA01VbfdW[g9)#3;,L:c]GAW/Q^_cZHX<&2RZH53<.2]VT?^4&7DR.0C/Y^,/0
;Y3]]<H^?)LdA^/HOa]BGg#/g9cR9\^2US)?CUCWU^/&M@F,<R@YE_K5QSWU)38Q
;&g>b:,:;[G/2.E./-F,@eA@gf^,+R=>:LMM.3QM]O4DcQ=,>9AXA,E55:C<:SVd
D<dCgR:).#X<^>dB[#@?3P@XETX14g??()TR6eI>eG;);:A0bM6P.(M(25AN18DW
T(X9N,5\BM?5Z/gIC.HA[^[2cc2V+CbT8.[T0W=564\2cZ.2U>)-g6[YW6cKP)1X
.G0<#8UD9UME)Y278INgT[9+a_TbHdR0./1)XT6_-7.]-L>Qaec@#0Y=&Bg2.^9,
,V,.MXGC#OPFBLEJY:]XfHf07S/D6_3KJ3LW09]953Zf4NOKU^\R/08.1F8caIA5
6.;?U^L9.b:S:-)A:]/3P:3ITaW#VNN<7KPgCB])S?FTa_(69(=)FD>7XGC8K))R
@Kc=;-H:/agR>28LP2SG4X(Lg]9<bA<,7fJdJR72@P(OIfA0C[CWg9bbP(S>9bg1
W8UEY,TRI&3[g)dJ7)2@-Y,gfAKV\5?#dP\(WTDTL:&P2e:.J08JB6A1OLGg8J64
f=0SWMCg,c4f-ZU:1@)R<dWJb<A-E[4;LD##GALaOHUDE2RC2>ZQA,J&@Rc&JaCS
&5KFHc.eeO?0@V:DC:aUXg)7[fL#^&9=,ZG,PJ[=A/1=VUV.E[64#^[eJJSa4@(S
#fA4]L0a5EZOaNA,#:[#?>;M8gDSQbFY/a]JEZ]&<4]JV+T&3<:B4)Z^&79T<URT
);ae[(_CEWEeY0.Dc\L&[DYbaH0BOg@0Y.Qf)UBTUedB3_JgXMXZ81/;(^3e#M<f
5A0VS9AGgdXc_c]\J(LX[[?26?NY7C#Q_/FHYYU;D[e/dH+)^\0V7<TD(#QWIY\]
7Xc<5Wf[0P[f_d[UdDH8ML?N<N8ZS&HEIR=XQ@,HZ?.cNCE14fcaU[Q&?[ZC)_fJ
3,VM,MH<])KfBI_ag6Z>[A1I>VHXHfb8A&N<ZQQ^,F@CXJ#:SF3@Za9V_\dJ1JL@
-?>f2D1ZV3Rg0BG&UHc3C-JFB.1P3(;(>&a&Q/J?V5Ca&(U#KEUWOC+COA?/D[^X
DY;D\+VNH1:IbEV,_;LH@6#4I9]7AB@;^cS(1fX4cS+I8#?]=1Bf9J_#\3_R>.De
;e#F^[G+ccaS?3[a)E98HGV@\972IRSE5=U_g4[&[;.VMOBFXEJYEf/ZR+O+(LPD
d#?eV1a8=gKXO8Bc)/Wf>fYf#TI[:aM+eAPf6>dG-?4GB+4d(UXcFd>^_VLO+N5g
G@MH-BSbe(@T\]4X=Z5aS&c=7]7[<fE;?VR8F3GPFNf_g(]^_d&3B:59.Q(VY6>Q
OPHJdKAVGfdb_Kg-_c+X(N:]eOH)IK](/e8093GJ.RE[eN\_ceSCURIW>,@)d2Pe
V2M[UVH@8B3,<L@Z(\FGV(IHd/(0H0K_M@a#cf/XLXgEB0fg1\7/[_&9U7eb<TZL
M_I57LNfLAU\)4(?_;1);Re9Eb+]C,R<5R8YIdag7HY]]&^N(>B,E,N=bdIKELB-
B4/AZ5[<eB6-M9e0BEK^\,b:18NNGZI=444SIW,>P?:+\47d#aV@L9dVW876YH)X
7;@PQ3cZ\f\J2Q+9J(M,?a?dL+,XF=43:[#+]2S.>-4/e0XcM4d?NI<FfK.c/+ZV
DS9Fc.Wcd9e;#f(H0DBTbbV(>edE)0:cQc[#a)c4AKX-T.J3(MP6<\FG-@.U0\VZ
cT-M5Y]MHMM=5:7MX@>fDNZc2CZAC4:]3\fbg)N:AJOHddN2gdV)L6.5>57.-J(E
G:-gF?V[B(HT2=KKYM_F<&X7Y)[7ZYcHW2SR[b#5#L@YUfQ4R1^;gHbQ@@)L>T_+
a+15:GD0:@4#TM#aFZ/\0)fA5Jc)2g8N/eCY+6-PRb;SFCYN4eT)BG9L2-XR^>4f
.4-4F@ffME-NdS.O?L;&[]FJF-ON@^M#aae3DU+WU#Q/E.I+g;?eNZ-(eBW@],LN
A=:(WC#:;(0WQG#W=de(D9<<PN;[QMDGXM\4FDR9:K0H:dC9)&0@IS4K]+WQD;DR
-@+deMb:&KJE+;9\>?W_W5XUIF[?AQ[ZfFCZ>bMQVBc;bbDN.GcOIGU]K5XJ-#e2
&-1&d5[Na&EJR37E1S[?A?I:@Q+[<)Cf9R2=UQ:TO,bQPV<;c3F[^;-^O^YR>-Q8
Y^bR-6>3=-FI^#WXg#G<[Rb@+I4.7^,aVUN-D(MAKgXJB.D6X:F-fOD40DX9Z\XY
aX<F.9Y+#_#]>@-PRUN@5.Z,]?MT;GG9N.G3a8+VS45Y;OP.3c=b0C.##JbRJ>G1
JRP3\3RH]UG0)\W3ABL(7155;^<XcB6]&I4L;_cWW10?7We00)cXS:;>&<+2gUJ/
N.08=MdbMS0,V&6&#L&8dfJ9gAH=cdKdR?(17+?[6K=Rf><D;(]>6F_gO<VZ(^\P
1a-90g5JYb&OD#_A=+^T.4:)\I\#->;M?6E-2/90<S&ZVO;+F8L^-6N^5#/b.XJ4
)Z+d=>HX&+QSOc[XP-M1PUd6E2Ye^_AG-?>NR)N3&aINWFR)@JV2A.g9OeOc)SdK
-C63G@.f0]P&B_KCU0@3\^K37Q[;76:,:BC#3I[ARO#Obf^MX\cf-/[cXC6^I2@.
d.PUQ/dH95R]I([5+0cVP<H1De4<0_J&\5)0S0U>X9=8d9=@_gefNC66Xa5B(NM3
6?XIO-HVF^X3baNa(cRR)3UOS^#OeJZ-UagQTXG+IJ6<&PN+/-fZPP:.2H\a)5-H
c=;-_ZA4ISN>KGW&<K4+F&]5C-Lc-C(De6UC]XM@B>@3GcZ4T#D&-DP-W5VNL<37
<#O\_719X<Bb^SSC0De0E+1BZ45=()^6&NO>N:(>-G#OC[ML],)fT.Df\fG<3;YE
Z)Ee(6K<g7BB;+;F:MCOZX^]9/+TL:,83GZKAD3<@(I=57dS6Z>D+FEQb;2c.=\?
LG(TaB)D45a#g7R]+MIXCJNVNX+<[78==L=SZ=R+(.JOVAX@,[5g0\7QD1cN2Jb]
HD?5;;XNe)V=Pf79fEN44B@6I^7g#-)ZQD)YK-eac49)WZA3LDGeb[/3<CP^-1;Q
.e0<)R/=7>;CXD=U[]Q]]-\OXP24dRg/0Y]a4.@86HRJ#JWcSMRWP&],)#,J/NE[
XUfWK>Beg&^(DQN6?4905T#K1G1_-0Y4g(<OPBM_4eaE)X5fZP,G.=U565&L(^/X
>,_=84gC#I8d05D@.&,)JM?08(LK2d#.?dU&I<,+<?LcN<GO67_AcW(RQ5]HR1-#
O7J5&#TKS)Pa^_fe-3Qg@Vf2+IbbJV&S=QOV@OdfM3Y@,]V&)[&WS-269#MY#MCJ
geM,R+I^4dS/@_+>+,Ya.WI-)E+Y5U.?8Cd?/Z5ZE=bQdCC]G:40(LYZdR#FeKe)
J(8abFb[5]D?U<-KWUb=2\7R[#A.HN_+1@LFOH;5#K)UOEA:;b.0N]KH3IB__1P2
2\)SX(BaJd:].>c6@A.A(D<_]d11(YZ4Ud2Z:KP)bL68a8AaY-&:EbD9\+F;ReD0
QAE:_Fb6FLBUIWHR16[39Q46RA##NOT;Y>P:FG2GTdc)S4\E6ZOYM_T=2.D0ETA2
:/4]6)#KQQ#:-+RVY3c+4&BRSO^W5+I+cg1MMbaUW;S1TOeV&9I8M.:YEKd1R8I=
79e8Ya9U:6WET++7+X?Lb7QJaSFH0;MREWYaG72^f]<CJQb]?Sd4H\G2WaU7&bE]
U7.)Jg-a,Z=^P(V5I_UXRNM=/;R,(?=G#97aFCU/>#JZ,RWN+>KI(1V=SFagfPD4
2=>B/a@5KZ>\<]V0)N0PZ^<?Cb^3)4]7_4J/fa;DLQfd1]0M1aXMREd2;@AIKABF
UZ#([@P80BE\3X^BY6^RedZY-[dWG57]<;CC41bLSQHPHK/)>PGHU#@J]9_2>fRI
V_:F&NJ^A;E]D)g)\&T9MHb@\OB(G_f[(5M&QN3d/U=J+95c?:)4ZB1;3cF_/TH0
T&UgCM-]N[#D5f6??<Y[Q;&0V;.CG?&(MY78cA+2#?a8XV&SFEd\[NXW3M=e)CFb
\Q@JYT<^[8HK.^(_5ZKF^K8?.1;EA\LGa:DVA)IFRde1MSM)fNGJCdSKDVF1]bFR
VNNS@_O.G:VK?a+-\FHc-2/bXJ7LY;4T.F(bS=V9<Lg=a(b0\>:@J;MOJfGRS(MM
_&QUB8U,0I8dXH?d52BE28;NF3V:S^cLb7ABg:aC]G8C;AJOGY.]_5YX7OD&4.^P
:-WWNc@0V(1b@O,aPadWPfZUH\>Y5,SYU]P)3E087H_dF5NB9<8<_-,C7<96\N/)
KEa,fWBI]MT&\X0.?_I;?QFNMaXb4<fT[7SDC=@4/P>g4D4b1gB,]?:_P2?^K/7>
P<SFcP\-+#g14BC5790)7g;_C;W^WHC70[<M^PM3Z?95a4NfWR:,C06.[C;?Nf4Y
+Z+887-5(H5NSgf^G+M63B9+5ba<b#\bSD_4>WW6,<e8=&VG>SH\a_<;Pg1J?eHO
,MdZC_\O5R)LS1D[\K+8\^b-4K3;]^Q_bLe.-fV:NR7P)gMOJ>MK[gB^_A8gbOcY
#MDO+?;JD@-,QeC1.MW@6?@gf5#TfHg;BNf0=:W.YXI2:Z=W2YF4>V#B76&4),Y)
U0G08LIX/SD)W536RQ/(_&9+cbabgeT/MaHIC#\VV&@X/C1#4cBdBVK2:HM)c=8+
d9QdE)Y88@(-efG3BB@=Me29\I;Y8(CN(c03-PeCO-M5F/WL5R&6.B&)@6c-T&g\
EBbbLgN)b]JF]+eg.D8-G+aCg:9?7c2P8V\]OYNeB5ac0G@J?;WS1+,SbA,]V?E#
8YK3Q>;3<cNK[1c;;a06V&LU.f?_L(4O2Z_(UEg:BA#Q8^462-,I44:PNUWJ?R&f
d_E_^4>A6#ZV8JgZ7JQ@NQcQK(8fa=-[c9\.dZ[_c1;Q3S:)\0\Ub:VLaYE8-D,B
T3PC;2MGY8#).B<X#Z.DKGZ09<415.VN;&/\8\L#V/0&-AE>4bMID@9:019#K.IT
c]\CgTPYb^g\D=.7R<:gC1U_)IM1eNYC(+EANTA+b?L\N7QJJYU:UX(4S>?S0ML&
e9-2RDR^/7HF+RWB\#f[.QNO9?3R/(3I-Q6Tc7+;F\ZaQ&3UCE]e=LNO\XNYEENQ
#\M0D7W0Y[4ZO,Jf1@VfS2#TR,dLMS^-J#992&+;UANU>\0LYdTP6VP7[8F=5HMG
E>aC6JZcPHIf0;&CN4b@;XB4/I]Q_O.E3^H/X;Xf.T>L;Q5cEDII2VRg1.Ig,<PR
.M2/>_I<C0UHY:\&-V+8?7+S\\V6)YA6,I<I-/4FFdS[c)H2[O.a(=;S#?R^W^C_
=;UK\?ZK(:OfO5:N^beO43_>c^+=2>RCK_G-OF/=]64UT9,dUV;)<I3VCK#2^BgQ
\O=4;B];?WF-[<?d;ZT[OBW-]KQ[Z1M8gA-3R:T6VMYa)LXfN:U:\S#QNEUf\.#O
bT:QFT36M+0IM-.b[;\CcR[cJcV(R6\\DAY+H;BagROSMW.^F3W>U^.W(H4ee?)M
]/RKb-#/J1Q8067QQFX/4d+Z<e;KJ8C,G0^<F.3NP<RY<4SN+DO[4d04]6:_]L)^
YA=YIR/-@8[0=J2<@>a4aE3eNN_H\N5)g+]BJT2+1bH,&6NTag680XWgSX/)C5P7
_a#?3O=WO<=(J@?G<UCYH?\SH?@LV/S_[8Ydcf#(<_4:>@+GeXA:GNQ2NTXSSg[Y
V0-@4Yb9SUX&QWW74gBU1-40[HQD\&O#&CcQ7e)IJ4]\<9AVOc058_N2OI]B#N5.
7^6BH/ADX\,4EFe]J#>@3-0F]c5;::AK8Kc.6VIN>FA(;af6/a\^WAZRP9VU:c^B
da;8/FC^C>>#de-_XXH/CE&<CK#V)+9,fIX#MC(.-L+g_PSPJ26J)R-S+MIg&6)_
CR0Gf+2[b.:C6&[fg]]gBe^cM47JY=]g]Q1=gU3BL9A3VCDPD+L-a5^TGU4c+8M3
M;D&T5=a.fX/e>ER6XVCBg:XY@AMfJPJ(#_d>9QN[J6LAXKM8IfRAf#AE]ZZ9,6I
+Ib-\DY,.HYNVf8\?cfZ,3f=H.W]Jd<;9/g5=>RG>gaSM7a>Q>?dJ,#XB2;=VSIP
2:0cdD)10-GDbGGB&1B71^H:0.edF)>]]30IXL#,A]g/b](JWF)6TU<<(\@dCTA&
Y1(LU_aIZZcA<e86Q:8MXKD6/?ddSI9/]gXVBE4K9b:cSU>P&&,,RbXH^+))c#R,
FfU3]3)/7J-_#bIVB2F;+N_5Oef923:86Z,V5+AY\W=;9<;J/IO]4[7fZ=4-@6gZ
C(Y)7eCKK^=gLG2X8=\G73X0D3JggB;KG_;O:ZL[cYV7,07e3RVH,bG)Wc(&URTS
KU]5(U3YR/3C9e]+:OefEGRE-Yd+,-J7b/UKS/D\/e<VA=DC)T,J-e=@FJ&)bYI4
OC_]I6.LbT&FUPc^&B>3WD[L8fg;/b)@&:N31a2<5V6J4e&E)<[b^a#JG]b;YbRK
6O+W,11QVWQUeR3/1Vag&@eEg,UI;+P,N>S::\8(DO91/VC:=I81:BTef>#_I3O1
/JB/ZN^,6g6UV_bdc;HDU<,\]5&6^0,#aae\I77?R-#f7/M:\ZKf2A;DM3dR<9ef
]U/>=\(QXL]RPC0d^ZL6Z3&LR&_P#;LHA]DU7?T[aT)&Q;d>0R.TA><:cALPK;)/
@@^XZAgX0<IA4SM]<ZK]&bAI,HaEd#4\ZNZf26==cJV,G7;(W/)LO[@H_-E#(17]
fKTa=[L7SV<aV+-<L[R.5fX(A&EEJ\:FTC_f,5]),T3M;@3=14T<Jf=CVD_03HNb
R^3OO2UW.d.DDK]c^I@U40^2[Q29;8@9cPN9CFZJ0H/9,Z.;=:)]&d..4.CCHa-K
bMUTRR+YQ_YDZMRJ)?=5D^(HJ_V=@cKI.T0JV=3?7(U+HV]b/33PAZKAZ.MBS>AO
7X45);?_[OW@=@cJ1:DE62^<;DMZW;YLc(:547f[[SS:ecB&T,4=-cZVbY.KX).@
A540R=88)=a8)@2PDaT8ae6DGgY+VbMKI=BM-e(EZ],Ze15;L#Z(N@aCT#.P]4<\
R)#O?,]BJDHO?5D,OU#D<fF@\E3CFC8JH>b\5\,;(?O,(8[N(?8B7ZAM3#PU94]E
>gDZ3C<..68;=?eIY)F45cBA4C6<eKGA?LS?,I&\0T[ab@.L3D5aS[eT&/W\QB74
P&17A88[W6S4A8G.@RO7CaScC6J)?L>08.c=B2<)Z/FNMFEae>C@&d_V]<OTPU&J
OSS;DJLL4?YZY5HDRb3OJ#6<#,2Dd2)+,,TcX8WOH-eY1Z(5?UC\TGdaDNURGOGQ
PFYf68XMd><>#/D)86a3M[A60b\D\gOW>_A&Z4ZKO7d>9FTC>G-0PI-X@g^X7-fc
[,YF^W,9^VB)bPEGWeE^f8&.VOCYS0LE+)G83aG785C,9^e^AIaV5G2@.39QQD9-
^AT//a=(C/69KKU9XF&?1ZgOe7-IX=VJBf/LYYC8-b4[(;=g2;P5IUW.KY>GdR:a
7O680#-AV(gG+\S3K5:8=U:(^/2;e)O(5?5(5[>K;+g2a22&;SJgZY_VT,1&3\M6
.?Hg[\?L.HEB467-3gNT/HVNGD060=5LFfG1C(g:<fCW]C&5#Tf3H<6L&9egTT0\
a(RIU5#JQ-SWZII-L-dMd1F&LIO2,fV8DM,:.Z.#-F#2f].45d?X75>5U_[FF+?[
U?dY#c&K0<??df6,=N([.)W=8U7Y\-E9A2#1DQ-40.C\OJaJIW=2eAfcRbDZJ(Og
B]@JPg+ab3J)&AR8XS(W<f,8U?McNJ9OdH.8VX\fdaePaGcH?;V;C5UM4f])0c#3
[Qe&RKDK+-#eQY;1W5Y2M4G1dT@GI\TMCFHNH8U2a7U_+U.G\(<QZM&ZO(3=WA(R
:cUZCXV+WMUKRdJ&F)TANJ5T,.4]]\5U&N&>6-N\\:BgRH\:)@+0&3VN+d(T7ND<
RNMF><V.++]H3P\GgCb9V7EQN5@.I,7/4@RQPcc2#6)37.+&_#,AG[)&NeV_D#FO
0VW+)39@YNS?43/._=Z5QfEg@VI<c29S[b39P32GL<0J2CGVGYXcUJQFbU,LH[BH
2P-3@.E1>K9D5;3Y@[aP[5/T],LcZWS(^L5N#(fA8M)(^2U(BTg0+,?GP7Mc^QWA
f?_^72A,#dY<]LM)3+>P_5g1B095T-#Z.3[5ZXV/TDXaIJ,(&c?G_XNQHg.ZJ<(Y
NBdAME[Q3[S:[OgGK-DF6:3>&J[fY#I(G-OLQ9fD\G]fU<D&g.37?a+6>](082XW
@]Q^2?8;G)GYMH(OXe@LX)Y,eA>Y:([SGWM7T_[O(=34I)&-Ga0E-ZGad&OMG5F[
VP@/&5(RN11L?F\8?O3OO2;H>T[)84:QL.7W\Me]9#?UW]1:Y+DMKKC4@T)-,OY3
AgD)6BB\:MfLD9fKSA2PKE8.Q_AbIRA3W4FL5df&DQ1:/E3ZFaSWNS)bc6[-=CN4
TSdP(<Z1S(#3Y>egbGBY>G.DcQOb#,8KYO/X/9\LaUIJ&5#aa5c7=Pf:3BS=563W
SNT73cMbeaYVX:>adC@bM?VQ5XG3TJZK4PP(XR0?\NC=E=BE9-#>VKI?]WcJDK:d
;=)63-dX5TdWYVCQ3Cb;ZG>4/MLb-H<TPGe0TFP5MfQ?^K1U-[A6^+0^..@?0aec
.WL5U:VJT9\cU-d+KC;(LL.J;[S0?]KR=TE\;#([U#Z_:H:H0SS<+FWVH(Y;;4#H
8V/e.^M@FY(N[:c1NFWKQOfTe/\F\-EXM_TLGc]:O)Kd.b^C\>;^19=(?@8_(=K,
_6.c).JECG4QFM:96XT8S#<4-==Z@.:.#CT&;9A.I<c4dZ@O<7N_XYDP\JJ3(6,0
N8UH<=-X(Ub_2@1IZFHLAaV]1K.IB@9,2#,59(KFN5LGaf8>_b<;4DJaFQ@M5R3f
F-;.6P2bA)YKSgD\97N/.G&=E-c>a.bQg.Z8N&1;<M)c5F^^ZMBa2S,NEfDbK_dC
Y5PI?I/L45-W]<SfOXgT7,&]_=f2Rf3aEcAKZfEc;\B+#L,B_e25CY,MV;8M\c69
>Z8]3AVg8g?(.AKCK>S4dE@R5Y<?2P-dT0CF&KPSdWNfcCFP).+;gbS(:c-0+J7R
;5U4d^U_UN4LZ8N=g\fG,1U.V:UO&;,RK>B:B+G_S7b]ONK(/9EM1Ge1X5dO]\LL
TR-Hd1^N>8XK#PcD/X:S?J+-,:1U#U#C,Y1d)3HT.N@RW&F[gUaPT\UM3&=Q;.)^
,X]P\2LbF)W]_AgX(;>=6_cbHMAGFIDSU7^NP-L+Ibd0JcWJ7Q[2EOZc>EC?3Bd.
GVb=\MKI.?I6bHa<f8&N-MJ[d6X#UCF>XN#),\T&edN-HOdR[19#cg+ZeBLTMV>?
B,9S:a_\]KDZ=gKJ(JY?C&/g\N#^C2YHWMO3N8T^EK=D.TITeSK+Z_O.VZPI;HK.
WD@O])WMN@N>8\Da3WX#_VGg14\+U?:D@I700M&#.O69:eMIM)+LSc][MVK\d=8P
;AYLUb^ZP-TL2QE[,+0.(_6EB,U6b]BM?8=,R@C):_gbMBF:IgV9R6\Ja,&YfQ/_
J8:X7J0-I17PSOEXEU;=cJF0bMQE=Y_]QC@^;_AHE:ad,R^HJ&8SKWJV?^@e.#Y&
;)S-:O2Le]K[(:LN>F.e.@K5@bRS-bS1K2N,\[C?2[Q@-P&3d8YcYDVL[bb1(eZ/
)]6AfG^dYEN2&]O[?YOa+)17<,833W9=&>)0VbT@I0d4f;):J,g^LO=/X4L1TWaP
HA=.+>NPgE?8BD?86I8<YEN>Vdf@E41aD-R15f,MOJ\-Y#d.D<WFV,CY5>8Gcf5=
ZROL=L^Q52RD9(:NFLfG\BG(B1X7O64M@IVEfHX@4b[(.2U=.ZC87b+^eH2_<[:d
c1e1?D1O6I&<QeMSgbP><PI.CT6U-+9HY^V\0=TA]bTI3C?RVa,gUPEP9SA?=F;=
H;QPb]DXBWT]HJ/5ZDO>aTdN8@JQQegbJUL#T]\U&>?&f]C8=HH[L5gb)HQ,TD>^
=<5-;[S[e7S@G[SC6ID2J4WJE[FgR^3fK44IcDX&MSEO\3/I7G[LT6^2+U6-6gFS
&T;P]^JV-+2^C&K8@&d@D4\.RV,aVREG/LXI(#4I.WE0_UVa8V4MC48+b&E)ZAL2
D5<]PZ1Z_L3baF7;A/T?1PF]4Y[g]&bJfL:WVOL;<<CUVJ1@ZNg3^;_>Y>bDNb=G
dLNG(XLM)IKWX+19c/<;Q[d[MS08Nf9F=+FEQ=P-=9HC]cLK+_/B8;@T\S=S=,)>
DBf1\F]G<662W@-IP^K\H:Na9:,>C.>^@P\@#RCV^SLH.EDeXIMR^&I3Z-g)74#d
N9c&De49Y=Q+Z>[9S^+T\e1Z1+a6>PV/[eS,\J<?Y[5&Q]L=UQ30?KN_Y5Q6?/e=
9XedW_EC<&+=Q4MPWW&=#-dM8CQ.@bD#+Fb0X_6-FXCT;T6\#O5RA?P_KW]dc^K_
5]AI3ME2?9Y[_eP0AI2)T^[9TeD6K5gK1(UA^U_B]UHG-]0+1#eWPeK>LfUS&H5E
0A,NTJ)4E[MNNDR\Qe+<TIgVTVP(8;WR4(f/K+\-Vg;b7Ie4_ZeU:U)?d5g2:a;c
?LLfT2W/5Cac)OL)N@=a9=TH=&HaEGN&=F?+EH?+LI6A17+;D_Y[@3X^eU0;EX5O
@@R\&LMaPagGIOOL3MF\(I7d?XZ:DG6;LcX\\d;[,:,eG-BFA+]16LO:XbUPGbP3
]g0c<#ZedD/55X<)>f3K&7.E,?4ScgJ(9-H533,=@Le7CVSH<P@g(FBC2UcG1L1f
3ZC4-QF?@/1Qc]SDABAcAUEA/5XZ/b]]T7_ecC+EWM@&VJEK6c:#OLTDSSA>=WWS
DMRWIQNWbLe9b3AP_/LH/PK@P/0HO/8[W]ICOAgLD?@+4&PfK7_YKcLQD(O.P77;
8-Zc_[:LSY2K<(0[U0KPc_#VC<9CZ]ecEW+-R7;3W4Cf3@/3;_V]&<A.<_c6f]=3
H>]aOGaU6TQ<F8KadVf-aXGJ2\ON:LE9,>Id6H;U_3;FTANL#Y^B+1<>=<16#cOP
7(A.ZP?G2,SRSSWH02O96N4NQTAZA9S<gK(a?)DdD>=>6;T#[eKa=ag,T2)TZLVP
SCT,T[Q,D\X7c\EG9Q8F/SO6HJ8NeGAEMcR]<a81Of6-:RbbTZ8EZVUWe640>),1
?H)<3+ZS+D3VT\Q=Y-DV-P?^CQ2FV#&CMT6R69?9M4-BAI@HCOM[SWV/g/:TTc([
L4#^;]dKG/UE(,+]FQLA6=68Jb1QZI4YQ=CXSI/4^Mb+C;a6RRAE=EHca+ZZRL1g
JH,bJf6@9P#@K&.5I-MFIc@7(c\QT016M0Q(dcGC<[O_KYIVN_L>:&;I?JUR.-\,
fD9KRCB05gJI2P[MK1/M;IC?^E6,b_<JeNFF=]-&.UDSYGN/\C_5c]AWf6&(&+8H
TG2[d7E[NN:2V##2K#]OcM4M7D>DFg7(FcND.T3.D[TXBK6+aSK68HGQH9C(I2AS
,R05LUCIP_>,c1/gE.YJHP?J8F+:4dM_T;9IQH<UXgRQ8=Qa+Q(aP-\QA>U.KdTR
CLR^SU^KUAA<Z/2Pf/C>V>\3,2I<J0HI[B?XGVd[#eYMK>W:9=JZ9DK)O5;QKEea
A/<Y6#Fa9Q>G@,\48)AX^HV[L8\YZIVSCYK1OX)\53WBd@[YU.BgV)D:[TOLLZ--
J#6IF(.9X99N:4?GP,#/;FR89:4.8I)^BB5c-+1W\&MV+51S&4/R[1WHf&MF7ag+
dcdIRJD9=6)=W,c)4_\f:^\0K<619:R[F+FIK_;+Z9OK/A#E&HEF;.a.R4gU&D\@
JHD/G/36J=64V>QAAZ.Wa\RRR?ZV(JaG3KO0dQI.?2VA0@)R//UQV4J&f7/.#N0[
@K56<2.?_N\g.\P-ZP+#2:)G\g;.-T91c[RKaacggW:\<2=NdJ,.=(A)YU4Q;[92
)NOTVZ03U>\T]g5?fSD##FQ]6aNW\JK:BZ1Zf)LTAeC#B,7LA_XMdFQ-UJJP4-U]
MgC(a)\<DL]:N:19+_fM-<))7,OX0O#>+IL)/X[=E3DG2F;7VX\IT1Ab,C6f8W&4
9@H9GeTHc^_>N^#+2&&4U36..\LXXc&1#f.3&N#NE07@XARb3R;<,6bE4cM4QL4@
LEa=)ge?]+T>^UB#1OM?PZ@PGK1[DCde)^TNaL@g-XM;^d1<C?1aYaKFAN-0[WSR
g(:<@8JK7]PaGYLgdL>&3;P2RCd0+DTbeW1:#gWY1A;RdQS8T?M&U+aQE<W_F6:Z
1P.Y?(c]#F\<?(YU=JAM^+SYaGI8;KJC[#5dL-^PI<Z5#5f&-6GgVbJf=W^\OTQY
cS\Xd,@ZFX7]\T>@J>V2;-^D\EJF>-.cM_9g)/:7.2V:@K14Q(B157X_?)>b-(9^
XVIG?bFB=Y_<XWgGUB<.>\Q<VE\8\b7\]9V;HY\eP6><.H;A0CDVScKMf6M=&X=f
:2[6SU.399O3#J^T,2&XTDVD:1TXF,)U1O#VJd6QWZ8e-10)Y:-:?]OXPc=>WbBQ
Y>)ObWfegB)6TNLGQP;:[Y8=F;=67VSg##HFAFJP1aM(dPM(K?.5-_R#P-C]I1d:
\\B374I@7fFgHFc17fH194-2WH]MJ&7/VETMYR=[#>PJYbZQM>)69_Yg/;>LfREP
6H2fU3][?)Q;.ea=F6,_.+63LHZ^ZbG@IDL=+f76L;1O26.#.B(7.V+-g)&3&L\4
>=:6(b_BXV<:&0;]]T,1,_43LA<1(HD/-]KN[K7,)W9V;#\&:X-EgV)H/J>.]<6A
A&M:K?CcF_-T<1YDg,9;VT=XW?SQM,eRa(ca,W0K6(^QYL-g<V<I#O2Z_a]@9O88
3B#HPQdFK6OGOeK)VB?Pe/C_<HZ?4cTE(JW-IJI#R4A5B<1-Ze)7b/[VC\RfF?GI
aGf(F_:B=PFYB&P/B<D.F5G#4?E635J3[e.8I<^8IeC(1b7S;gN^fOJ-f2f,I[FN
/JKWZ2>e9=6^2H1[]31b6_]d5O4WbA1Yg)dS=_JdMGMF-FI+<MSdW#=NXGCf8.\F
J@1W2be6(NSH,-/Vf/\8O35<W/+G<R(3<9<?:2ZS38cY?A6K5VRIMdH9F/>9FV=6
33#D4/[5fUadW]<Qa(\/PA4S.6O,&G:ZA]M(>a0)\b::VJPX.[[FA8@_a])DFc+K
JY^H<4cBZg_[;fcI.P8]dSeWZ?2OV>6IDg;#T8VH<FLSa#T/-^ZgR,5e[bKg6R7-
JG;@R0fA;JO-P))9;F\91AG2).eV(]dA@UZ[(M3\JD6,DMff6,38Ye+4O]&=Ud;/
>eVH,#:K9LDT5<aBJ5:E9SJ^)X\AZ(Y+WeSSYNg2N[OEWKRHI]E&1QLfXS_^g?OI
17gF[;Q15d.,]@OL-=(YeO?aB5EO]6U.Y57)7H+]]F3UfNcIPc^X/f_@bN)]5:H^
U9=>+/&egIBDIRScSa4dKMdI^QH@3&e8AD\S:<T8N@TFJ1RKU0;D/eV+21J@,2J]
,9aI>>)H:Fg5d+KATO9.#_=T[1;?aA^\b\)\<6?&LO?fT+]EA7;JUL;ZH(_6\\09
M,aVMU[]#NaD)TPHJW[/SOJ4H72VaZV^Z82T/&Q9>FP?W.a(I+PR@@I1QQ,5/SL?
<4<e_H2<&^/5=W9ZS.TW4#Z>d/&A:,aK>U>aY[8d-<BfI\a0IJ.LH(ec,L8>]9^V
7;M06NT9fbOP&UdGQP)0^:>eP&?UXe]RJ3@=?##S<N?34PJ[3c&EPQNPf7g,4,f\
Y>20OV8/T6.-UGGJ9<XGO\C3/)#>FKOIGH(@D#dQHP<1B.X:cUGe93EDg3BZYF0H
Kc2>G/eKgHL9IT<,[:=[fb;_/,7:#28g=I32F4-<5KI/1.OId<?g>Z&YZCQe?@aU
5[Bg<JeO8b(0Y+G?=R-B,3BHcPZG?-]\gc=AFWZbdI7;L^X&--,:4I9eKS1I5(L3
^_T?0)QK)eda?H&3NKISB<B)ab1#6fBGNUIFX/<6KDWe7XT+b<eeeBG0DBM.[C1f
b7T3gX2bCDDYRY7Uc5e,ZS[4FX2)ZEE0X^V=++B40PZ24@ELJ/>#HOdF1VM:@4BR
L4AG9ZeYQAa67U0d[7@,67SEc0N10a2JJ\91;EP;>IC6710a&8fN#?FISG+1)Q8X
-E9\,cHT8dYZd5WX4Z^-;2g)HJQ<(W3+<JgF#]YL+cQfC\<cA)4)CJDGbe1;YO-a
Y&#a#-OONe2?O0?A@]>\2R(PNP\g^VUIT0\U.0_6/GgaA0R1C<8RIKM],A;a@a?b
;a;Y;B=82B2MH3(4AY@9=&U+>,Q/Y1R]HRO1<IW/J>&JK3H2E]2..Z&dM5UQ+19a
5T/4N1VY[D7?]IE#0<#O#7-cU_3c&5@.Z)Yg).[VZO+:eW+-2>?.5bR-Q_,&Z>_S
PU5ELI//8V[-9HZPRM).V<4??LY@ZF)-@/PS<XA@4H6+_c&1<27B:g4?7OB7QN8K
\+VFHXS(A7N6FK5d.^Y:40.V\PHd:5f(LHe416SPHZ?C.Zge\B3QSE+7N8O=861L
,6EG5I:HW;f>A5KQL7g:g8DCDdC]&LK@&]793LIEc:M.IM:&\GB,5\KJ7NcORa78
1f7REbM.82#^WI/:+f;](44WXGUTcM(F?)HC<;Y2GBe#(,B:<1#CAH.[1L(LTEJR
Ldd)Y=CBe9#UQ-_]#6YIN=[(1L9W@4eW@g@QGd1PV34SH@U(/f#T4aOG\-V_QFK5
5HAF;M?&^28&;]-=\e3d^AA:QG0]4I(JMOd_@dWe3PEBVTV,21If,QF]HXb=,YJQ
8\3N:<I8SH:9SQHgXQ4O<Df4WV+]Xg4MWLW?&U/KH\&9--7Ff)[GKK?ED5XcE:-\
)C:9V.MCE2=W(]1#gZcR,;7Q@0;N-(HfBQBMLQ6#cC>80J9X=)9Qdg)@+(,3#2Wc
I&)325#B.C14e3R:<6R&0/&RbPF>3B9I.ZJ>@B^b64BF4dAFUNf((:L1Y2dJ#.2_
#0TB)XSLM/,)-1;I#B]0C@+:6I(>[1W[X5,MMK)L4:9?LKT(U<B82,H)U-0\9X^B
4_IU3<EV[abK_K&4,b@TU?T)YEDMZ=Q)/g^NAWeP(5aZX-II7Y1A+aCK1(4gM<VU
(&\Y#Eg7M_C8H&S/#F]./K&K_3NV01OdM\dFVJ4^/0/IDe<I]U)^e>&8?)H6Y]5b
&1P)1E(FSa[QV^21/6I(DS9[V0XbB;1O</IFJYfR^?Y,Nf@(V#g9O<f8GcR]8M5>
]2T0C8AWOBY,TNaI:D?_SbS7?[,)+FC/@af0f?&Tff9Pg/=GUDL)@M^aU0GS#AZ>
Y<##K@-c>bdK9VJ.#V3J(EU;cDN_X8b//W1B\=dgD[5^C3HcRb?KSV&baA)<H1K]
\fI=8.Q;&UDY:91aMK.-WQ30<<CHKM6-S9&VT]R84g48JJ0[,0H5^?dI^PIM0Hfd
5c&+C@dW9R,4NFJ7P##V?+R?^g)QO>D:[H<-J_#8:F9=1TdGf;f^gW;e^d]9JIeA
&^0\:+aHW>TeDA.)+N.J9<II-(DfQ=SA&4,-BF[QZcLCNWeccN0bP,4M<VW0;,I,
?\KegTMRBda/_>-Y3?3bH(TIVb(1^2b<SLAM&TZ31R^>T_@D:e.0B8C-c+WBVLS;
;UB_LW;RGEca(,>2Mae8O7&cLaZ6.S<-=-&YJc<eK_K9P&T@]VH?gC:,.^F+6]g4
9EUY+?:fHT1K59&/7dYX\BB(Z4N>P7S\L2R.6RX6:JY/RB9ON49a(.NFfCCIO,==
>e4)+W@H9JV1g(Q\#+G)S_JMHc[ag2N<Wf(eWXbRfZ/6B3C&4XI+DL@eKFLaUTdE
PT@24J_Me#\0PIQSdZ(^^=/#eKAEO6[#4P]D1#Y=gdO7.X>,TF@F7Z.C/bI^=ZD-
X^#8W]M>B32,6(HbNQ.<DNS&6[SC-<DWC;L)1gT];Z_B?L)9M.YJ#X8F\PgT=UK#
51gW/,&Y?c3FLV\XT408J(50=4EB+KaQ++MU4D4W0FP7(=?-AQ(FUWM67W5T@Z1J
/ae/>IJ&:,C;=M1I,f#3Y4@BK1d-C8Y^C.J#c0Cc,a\N[KL0+V&^X9^CW;HJYW-0
;b5fN_Fc1O>7S6@0LSAX0UJUf(b8>Rc](GQLO^9UFZ,+I:JL[@0P/=&(FE^=MEB8
f(G<+aP<f)3P?BF<0UTDLAZP#7,7YI3<S.+=JC\DXFL,fJGR@Gfa#6OC5^W7+?JM
+Q>YB,@.M9M]<NIO<PcHB;BYPFB(VQJ6;4\:<WVY57MYVHMO44Q[,:aP3W<S_X:Y
4a,fYOL<O3c:/?C)>#ZJ#T#B842]T.]3Pf3bVfL0&O429cg@2/dNO,KJ(K-;4cGA
SVO78DXR/QWbV?_f[gT8a?Pe/A&#aaK#\&P#+_Z3[O0&\J7HdfT?<R5L46DT3F(]
#YAR/]-0B-&g&@T(Q<=@)f1MZcFg#QF#12?e[b^=U_?CWd]c\ZF3:>J#dG/>4=@N
.;5gY:H0c\[X&X-BSIFcM_1CD00d5IO+@OfED>R,8N<K?F34T<^U8g-YODD2H##-
6YC9)RFJgM78Qb8123a^7:6?Y-Xb=;KMHG@Va;0A8_G8\+AH8PE/3F#5]cON_ODI
CUW)#aG0NH6/K)B.@K\Ma.AeYJ??6g)49;c\V+]-c6@>6RS4WGW@cdb1UNbZZ=F2
=JgCV<_N2G3TSX@XAK^KLDF.A)X4&?C_/2W.&(@FeH;L_G9UaMZD;/R4OA1H>0]^
:JGcKfZ-4,(IgEIY](Uc;ac-UN=R)I>Z(KC\UT_OJfH9Q7:gYcK4MED>/Z#KK<&4
>8cHdK^&XL4@UJ.g\aKS--\MN-BdP/11)FH1cYKU:IL61IDVE.BQKEfD3MRe<]g.
beGSDG-V-B+TZ:MbBgJc[7-XD6F,_)e6]FgQA;Ha(N_G?DBF[0cfgN0dRB2d?UZ>
dR>0Q5bbc&5aO[/5+L4g7<<&H@eJ4dWVfK^[O:XN0ZV.ZDS+8g9DeWURfe_;W<K)
6V1_La?31_1b3M:4.BNV0X.Z.3DS9d(-[G<de2>P7bVQXLfE6^Z_UK[bT5a<CSLW
<)L\)a-Lf25R:J6\E80F6/e]1F-(/(<_AF07U#8RA]6#ZOeWZgEWbFJ^M+Eg)M]a
IT-^M-BS.dDEf02@ZdeKLb,A0Tf^<H:-_ZO[bQ8(]QObU(C6eSJ-5^WO6>JWGfMN
O>UZeTY3D&f\[25V:<CDN[BfBeP/UIPA/QZ-@fd2+0T7:B2FG.J91=HZR&TO1;])
S^aG]>O8\IXV,RXHH<]XffO0[ZHKd_C,@0,I8@9O<eUY77Zg;&SHcP[[LWHU99e8
=O)?/Z7A-7.6XH_AI6#N\eb@Y9G@29B6815<#(f0\;?-dWN8U>.eW-H<T8IUA^2J
Q.5KZ/I+QTTKe#:_YKRUaBJ&SA^IXIE@@>()JC@&1_GS_^0ILdKXZYG#9Sb0CbcV
]6G6E2F:Ga\dZ.=T&PVMbQ(eSQK&+7[BM_IG\Kg/3)(=X&L17PO:YfcL<eaZ8]2V
IK3WZGO6\5&Mf#<\X<d:=g=OF>_RMGK+D6TZe(=N&c^3De3I<M41BQa?79aM#]KQ
d1D.E2PeV,N;-)4D[I_KDB9FC2F0+02Tb1,C>G3fWAQ0:<b(#WgRQ-S^4:+X\2cI
G&GN#cb>,3;9MbIdSYR6BcJ:UA7-YZ^^#=dI?^PKUH7J=W:CMbQO.<^+bU(d.E0R
9TX.EG?a0[a&]\PWO[Se?bSbT6.2=B@-)IGRQPY;<5Za&L+07@+gT>GT&/H8?H#4
QQY:)QSB+&A4YRP1EQ7#Dd-4(I-LFM+[G.4ED@-c@O#a.4cQ#Y&FM)EX.C#E]5+G
;bJ-.4)D&IVP5WV0eEHQGMH+/J#5KPY]DJZ#S;aN3N1IC@IHAc\IdgAXggQ\]c/^
C:O7V-]eI8(^gN_.O<)#FF-]AZ9YC;LIW=U84&S=GU#2J.:3@S].M;aN,)&&f@Gf
K3a0D?\,RZI.a.BKa\(\S.@V^IFL//3Je=g).bcM/b0g/@/ceR04\&X8KF+&P9_I
P.<G>/RM,1A-8aI6:HEP#g.e#Vdb]SL;VX\2LJ?;+\R(YY@>HL+RaMEBAL3RLW1T
WD?@@_^DXc1P[)b.[OO>BR]:/#bTEU.Sb7/M^UB7I9_A,6_XL8E_O0_CQS8S7N/6
FPTK07BRS(acM5]-f;X;==:5I6#[?8\e&65aLOIf-]FgQ:7PWNaNP[A:XOC4g#K5
F<DcL=D&&.[FVCX_][+cZU^4F6-FV+>/0><;H\[:86.,]e+:4K4SDJFL0d>X#_W9
2==B(P9UVgO/QX/eZG0]Qb1F.Af_A1EOBD+(B5A:2=XNGZ=-]f/=;gVe4fH.#W+(
fCW7PB(G:9=NXTA8ceC&<M&&[UTa1][5#<DS@K7C:0/CD9dI45^f<TY;38bgIE.B
8c)).,\+G-<CZWT&VF.-.[Cf?MKTf3S+]+D=_[,CR4@-8J1L[eO__I,_WfUN\=WE
D=5B[b8]C0(QG(cR3H\75dG\RJ4.QdcLL>?QAY0U.-YI9gCY<\>WGOBNQG9^\E2-
Y>+,;J8,W0U7^8QJ1;,^07I2;d_7/f,26JW15)]V7ePe@FH31?(Dg>^b#/;b=/Q[
-d4^\a)gC#.C]G[CUWISe-1@f(dGMG8921fP?8UdfV4H@A(];-=b\,e;9FA8EDgN
ZVO5,#)G^;Y(IEKaV=a\7>9CQe52K&(@;,96@ef0XUJ(dI9U76=5_b6M41L+H:G]
O\e[CX>P2NSgPGK8YN8Y_5>>J<D=d=9+5.X,J/MEcg5G.-K>?Xg=E->aXO<8_f)P
cSVE^<VPUI^?C)?8c87af2P:aH^R297ZZT7cQgV5gZQU498D53M.8d-QMF+/FMC^
+8f+>Z\-gcI]8d6N?Q1DM2.:+[^R6efIg./N^\/KX]da<6dCO<0]:/6)VXBWg8H(
+ZU47CO:+fYcMfC@c:Wfc=[7J1EeE=#/K9PHg5gEQeXK/#35]+HE6eZUbEL6:/a]
=9>Ef]X@]gYUHB&GIW(.fSS?-.U<Lb2ePOW:Y>2Nb4WJ17)\F=+8F3_QK&>H6F?^
H.=G-\U3.df@GaIDbYNfQCODJEP0L6HI<T3VIJS6=:/3\P8[B#1&;7GG(&BDFJR#
9&[8W2P8<I3M.\A.5XI]A?BFH6VE9P0586@c:LMX>9VWe&K&^3)Z#S9G[9^2\QRZ
7#@;A/:f6Pc#GX\F?<F4N3MXKB&(f>)3g&0O4a</&\]_J#RUQ_\Sf:=9F9MLJ(#L
a-2b_G),He[VWg:TCQ:^?g(XDTZSN?KY;McON-B<92PXe5<.f1^<9bZ]O_a07M7-
0,eUR&_fVf-8P)E2-_MWL\A_T=bUdR6C56>_TeI4ESDL)#H9S>_0CV#Z+fH4I55R
c?4WP&_;6#SQ1\903U?)?8VD3.\MbOO&3<NX+1WB11a<F,a6QP8<Q]K<C7J:DO:#
3bFcUFUGGM10#BXEf<(C6-VCA+K+E01L2^_#:ecH(DP;ZUad>SA8F(X4+K/_=Vd#
fF:9L<A2cBVG3[Z2&4Z@/@L-N:dg,8<cQT\gab4RF&,gAHOd1)D+:@D+;^DM0S1P
;KK)>?6_P?@RNadI;Gaf3E8Ja_-J4R1I.Ya^85DF8O.1WDOX/^89JZMC.=ga/RRF
YI)#A^DINAANFB:FOWdTdY:Ha^cdV&aRAI]K4RIa4Ae[Ba2,;5.,&XgUAX)f(@[Z
0eUQD=CF<0-_N:[U/AT_JQ/2a(?gC8FG_#3Dc0Wf=D><LI:g39eHI_7eTd4DeeH-
,^VK<U;;2ZJG;MAF^cRH[B@DQ,M7_D^8O2.)7<E]3cAW+VEZ)CgFBTgY1BJ&^4_f
_L9-KI]@K6C@eL07(d0)[<5Y(0F)Q0GU4XU?0e9aJ,[W)-MAgPAV174edga3<@X7
28EML^>I[[5BU_D8ZZ#/+\5Y2$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_S25FL_DDR_AC_CONFIGURATION_SV
