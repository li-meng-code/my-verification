
`ifndef GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron n25q device family in SDR mode.
 */
class svt_spi_flash_n25q_sdr_ac_configuration extends svt_configuration;

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

  real tCLK_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_n25q_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_n25q_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_n25q_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_n25q_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_n25q_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_n25q_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_n25q_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
Z:93de/3BdQKCCPGAI8B>+,/9WNXA+,-cYHS1>0_<(CaGV.R(.490)1&<4R:)MU>
,E0AID=,aXe2)S9U&L1_2-0E5+=ML\L96HUMA.;KJ18:aX=93^_=dBS7B(a3a:=f
\#;N\e0(+WcA8+=XD/\=P3UUP/G9+TWBeY2YF6Rf/+(c.V5RQ@]1AH?-M(,I<3G=
9E7,2BFL0HOb<U7;B(W3<@YE3EF07C];X87DT>1VgB2b.,LSGI;^CLEBA:A81R(O
=O]H,ZZ_3=RPLCa<W-@@P2D^3RR)M#(F7MAV<6&#FSCZdU:3(N]PMDJ@2[6B3fDB
QES6_J3>@@+&0,3gc@DaK[?S>RQd#,X7gAg@X+3</18eeY<#0JGLX)EcD/RB=[fU
4JIAI8bO_G0bV0MX&W561S6,V.]H/Z._.CGf/F9E<;5d)8&E??7UF;0CZ1EN6<FV
:FD:3<QNW2;[ZZG)7G1B)Z8aU<.1[G3O?#4<XYfZH=YOCGL1&Z6DGd>^c4.BZe&;
0FIYg93b2-FAG?(aM=1,QPZC4\V&/Q)V\ZXHb4B7g@AVK0Z\JJZ3DD0LebE;eLJ?
4X?[-6[aIZdN-K\+KCT@?#dX_&>^6KD4-VZ/g--V6aFH(8+aL-GBN,W5BTeVY]Jg
=[Od/,\_0,^W@[6>1K78S:1RNT.,&[9dZI=Q:<#J>@(U0NTRGb:YR,YE@4)V=c3C
_]^P-N\]HdHa8O(=[NdE1/aIgW3C27CF1H23C+de+S_1gDEBb1IbW)PL-UZM.F=]
ABJ^09FYa(&W1?CH<.gIaLaI1$
`endprotected


//vcs_vip_protect
`protected
Jg1IUTDGT<dGF3LN[)McV4/_CG8MW#dVMa0A>3U-JH\9a=+0W.]F6(EX[DF<8?RD
D_.Z&Pf\6B))I=5&TKORID^<HINL7^_/M8VVcX+RQ;dgVGL#C\eA[CPYIY8YbI;7
T9a,@9f(WQR>&F<1:P]b\Q#c6V3U66H]>52/:RB<1cRZ8Ra58-NY@[dVKcL@f9L,
P.M3T>;E=#0.6fL3:<SH:CeWE9;7b,fUFOPFGNL^ZDE@@H<2M@NR&/c\F7DR<dR7
<XT_EGZK^5V0,N4809Z6P4WRI3(3feLXG@X\.0?Q2VB\fUP:I7eKGN387@8BR2Fg
gOCCTUZ7:6c.Q\<KXSK7>6-QK9EB_Y^UAZTQX1:2-TVY@2g>=-\K>B&A6f;7T?DY
=\CcSX,[W#LVEd8a(BX?d?dagC5DMX+OB6JMRZf+G#OU:3@d/RQU_0L9HE>L,b(N
3.L+-#.Ve<Y<e9=eY=]FO9[L9-;>SGEL3)]TEGcC)OK3agMS8L>_5CC+OOgY5R/3
dX&WFUM.-5ZANb96:P+;4dgV0-#[/9d^I_?OG]7CBM,6Nbg&1OGZ-M2FZV-25eeA
HgaECN\?JRNe,&[366G&54[f:fL&Yb_5G>G&PgII&F7PGbZd:-VXM7G1>W.[;2><
9_@W8?VVRFA7AU@-^R](91AFcNZQQI&L(>TBUUOX[F-Rc[-c,;eD&O,#C/Na0,NB
aYPX@8UA-OG0f;9R)+FQ3gSd9(+589cNAAIJR<;B,b/FVKJFLb(U?Pe[4.#S#O1a
X>MP4eS/I38H&QH:TGcdT#DK\3^U2O#)IXd7,I]N9[H>B_7E&MWY/>7f?<dIc>O;
M]d&Q,43,QK#M(0O>a=RMTK.V+\b[_g4(<_\DJ/UZaA;105c,VJ@1=8]M?X&=.2f
Ag79g<Q9W)>FFfWK=NM;TS[2ZC@5Xc3K.#OGV,;.MJ#aY9V][G#9&;A-9B_YCJ4W
NBYNG<Pf3a?,;bc68cP]geSE12<#8AIfE#SR&bIVM.SLA[^]a?S^0>.a5>LWJeFX
,@f.UV^QQMPN_60:BI#462GO^R,S+-?9]95W0d5a?[,K0F01(:CFE8DE@JVI,6-;
-[85>/F[5e9H=JL^SO&eTCGeLFWCH@]L]eC1=BXd=26)+-FD(6[>:(-15E94fc(\
.A^[S9T>[G3JLNc#LZ=^UI7.1;LA;+&8V#GD#AAGN=LN(3X02_(/SgID]Xg:])CC
6+b#E-DbMdb:GJU4JIWf?\D3#g4e_\/d[+(AP3IC9#gN1>2NeR.@>@-QQ4(5JGdX
e9C;,9X2R/&Q8.[N+(^J,EAEe9[ba1VT,V>WX^NfD@J@(KLV7L);]&M?9FD68aEB
4dUDdV_g7^2RBTdV3FO/K;MCag.d[RLJba?.?7QJ4@@:9E]dWEXS;2T^>Fb;CUMR
3H.4P9IR;0SBB;Tb]X5[=MH[L&AYXFgDgHg1WNN_^\;ea7_;[53KL+5Hc38OJZbY
UCCXX5Xd9AaARNQI:cVODA9,=&P5Y-U8?#Z+2>;^>^07W;+#4+O^_f3-gAg2GJGf
H=I8RU<ZU.b8L18;Z<c&88=-ACSQ)TG/KVK-E&<WEV&b;QIIL[F#H2@BBa2Z_NA,
:CVR0D5bN4B.A3aDMFW-&ZR6DfX&:7E.L34MR^R_gVVeO<4G]5_\R).S][,XT7R3
f=03_@<:TQN;DcAXP9X7gQ4(QbWT//cNJgbZ7;D_>e1)ZD^_<N?Q=fN.HKKA0J^I
\PgJYdP3.a<]O7)D\L558L_X3)b(\>6Df^#X92;#eVadY.X45LgP71TPV2_-#S@c
\gWaE8GW;>F0[19=@aN#)MET4W0:_RdbB25GN7Ig&ZVTCCe?8YCFE;8@X/E/Ve_G
LZ;I-ae==@_COB^M4ZeB<56G-Ng@C2Kg/JE++0ZNI,..GX7(<_A>OdDXIFM2+IB#
(^bDU<P)dXF8GDRL@6g18+0aBCZEeKH@f;g=2VPXa0c(F_V1]>L78<)W/6JU)HdU
9cdKXH<3W?TW-JUX=:ebJ31@Tc<(#^=dL@Ze+.BXHL#K9RK0U(3bHDO+\@f;B/B6
RN<13^W^3]J/afg:-NWf-2I&5Sd6)7?=R=(M;Y]fe;X\I&L+N#d@WG4:]BDfWg9P
8K]g\S5/V/OY/6^(c?=JUEW41W&YfH+88E_VW>3EXR[N0+Wb<;K.G=H1RIN0W]&I
9fN@6X)BOD\UfCX+I))d5Pad4.XJ-fJeGf0ScIK^g\feg6U#)&]H//&-@-T[Z09U
f;=6\\3c_G>G\d^LM7SVOFfCLR[6U#@W1>?KO&P(GG8^54=APc2C?TKHI:Sd-Pe]
)SG4O;B8NO;(UXd3C&EK;RU#H5.BdIcE3[QS^V06T,/(C>\ceF9F\D2?RKT>O^\N
+V,VF>>=#CRUD0VTJZ:>KU<0:e\AFPK;3&+KCN36c3:(F57d1RE0Ye)><GUZ[7e+
IAd/9C3#[,9=0]B3L1D4\@L(\KR)g:.@RS(D#Z>=[LW2>JD#-#YeN+_g3KLB1=],
c#^48,gM,cSN.>S#B9CJOf3:DLKSe.BZ6_Y<UO\1>9LD[T:=Og,,[@aC[QY2gF(\
SSP+<^Q)Caa[WfZPC_:)KL+>5Pd?U]A9?30eRH+^2AM=g4;P8N+4f)P)3S)^S03K
DFQWdT<Ide2L8e8VcK&8aB+Y?<8g&9QF0ZG3WNK,?=3UT-E>L\5GXG3-3:/?:BX,
QK,3bX>U(ZQ=)S.,AX@#;>=):=G0(@+8-<\U5HTMKd:==&\LDead:_U]1g)<-cPc
JP@M@OQE:PI;^Y>##52K]T-26O__?H3===]8CH-dZG6RC7YEIJT5/++BJ/8@@Md6
/_<KI7+;9J;/<6-]5e/fNHG\:UR^PI([XII8QJ_UEL9-61Eb[>GK5>G\f,I=WH-@
[EW):IDXfUXP3Fd_D\;=LA>be^_6H3K^1B#-db6_#I@7GePEc.)T3QL<JBOR68R1
L827c3\(cN<ADWDf[J4CS3EFGR6fB#UV,XNg1Pc&2L/a5EgE_DTe3:>2)IW\4R&Q
^[9#\Y6e>BD=0X5(+UL3.P9(P6&DD2]e3WV4L>&]Kf^XZ(+P:1J=&7Fg^\NYIc1+
IPf_RFF<#;g[6D2>bGG^Z-eWS4AV[<14fD.AgM^@@F?E]?YP;58bI.JL6XJeaf-.
M^1K^E.B=XT@^X&.#FMbK,\GO+0KT61(RY=N6;1;<YAeBLFgOb3@CO9#eOWY]2H(
JEA.^f9,\S.?85I))H;C2^VBRF5Vd35I.W2dQ(]--]gD(>P@S,1B6JXdde?OBGb?
W>+>W,WC-]DSYOTJ1>3e,Zb632F@)TD?g<A\CMY<N:Sbb;\eX95C6fIG=gDF)b^U
O#>-<W06J]QHEFSeP\W2T/5;G1X<>U@GSH1c((F@JJS5fQc6S6VL3MF>QA:^X@U6
BX#\G4#CLC=FE,O=Y/BW>Z<>3^@9d^PF@L94/CPRLLC7FBBJUSP67@_H8?cR4N:Z
Fcg_gDMXOY1>/,AF;&=eR28DN(HNF,?&]g]+f;106UHO/GVKX\U&)&[<3[\W[deA
;HXTb8d:OX(fS(38G&bfTUH3gH[O&5]3\NdF+;W[F7<R;X^2c[DQ4b0\L&C,)LVF
UgPLg1gc.,bCLU.>FgEQ@4b>C4L,R&<d@gFH2^SV.9b::H1:5Bg4TU[CaE(=PfEW
==e+bEX7\c9a)?Ibb[Y0b/IB_fRCQZ1MaPLTHWaBQ(G^cAaDc(1]YC0,2FG6)f91
3)?N&&<8c:43R6OdH7<#G4(aG?0<[KB+0He[I:N<MDX&<OA1L/D2ORNG@0Q12g&,
#L+_?gV4AX?R0IY&\DO006bZYRY54P+3P>R&SJGBB(HB9(cCAUH\6;^eZ&CDb]D6
ZAS5(6e>-M,-<>S=X_23B.Ta\V-S7^R+W1fJ0bVaT]gWLUAO9>Y:H^3f+9>BDUA0
V^WY5/acL#egd0UNW<.5;I</F<MeLJe3D(6O7CWEKg)f=/31M<.Se)+W:9:^T>f/
>.Y\D[BeDCF9MD9#YM#Y4COWNNE1\f[N1KI>ET&QBEU>\4(KUWc<Z7T^dG&GZ+1I
Vc+Ae9>+YIUDV3Wd\WTOC5B5DV\NfP&IQ64FZV\Z4g&Y>?B88CReP##:)V_VR>M,
Ta9?g2L<F<]R^+D)WJT7f1FECQ?QJ#&S.f<J.H0C3PPLJ5<B4#:XGeV<8>1W1>5@
X+ZXKP^\:KADF&\NF/VR3,@;f9KVR2:<H9bebH)@<WY;/47XA]0H5^/2c&=C0<C\
)-=#]XY,_WO1HT44g,)dV8@O_6gAf:)WV:3@D5I:Da]bZ>Q(QFVALCIGbR,X0e.&
BWTQ8K?R8CV\gOEHM@TQcgbd1c^X44d#&JBf:fbW)UGNWTIX:4JgAab^g^:+7<^.
ad07=1HX]T<Z(a+\U>-<+V<X-MXF((@KN66aKTF>DCZ:.5[6a+-AI?fT.GP/(XAD
_DTFJ^-77?bfTfYbg[60\84@GaC@2cCbfc6?2/Qae,I4CL?7dPA1PFMX9C]AY;-P
0@1L4:HI:g:6:]#GfY)K5baJbZY5f=9:HC4S2,A\g12:d/ZSFg:PS4\g)^aD+d2d
<]gcEf@g3K^c?4=8EO&E&GZcCA)?8J0^2HA?U6)59QaMM<^;,1/gHLT3P\H@V2@&
dbf1W4;O>VHf6Y-<5B/VNX9>TR@_#<4RCAc9F1-9O7-&16E@-Y<O_UDCB(33@E2a
g1AP8^Qd#GK+fBLR.P8?gZ,.D6a<5c4Jd?F>7WYU,KgUDDe_X[1f8;6XV#,>0OV.
eVTb;QG[d#=+E9=9]DPGXI5Y?9I5W<9LKW?\+VDF>&S#8MA7J7KH7;PgSR0<(0A5
CCVPX3AP<D<I\UV>DC]KdbYA9,IFQ6a+_@4,NTR]/A\^\<;FbB.A68;G1Hg:Y0d5
(R::Z6)OF>&G=N1,=E)Z;b0X:bbC#0gU8XE1^d/=SZICZ:6V6ZM_;@PbK2B,\UA8
bJ[[D;#?LbD0B56R@\78Lb->XbV-1CF:X5:?=/]acf/ZZE_9V/_LG&eSB_R[X[9G
BZQNOA,#M-&G<;YKDTN05LJ(&B:C^XDPRLRbXR^DQN-(Tc,KbaW53Bd=,1>)EQ[2
@P2ZaN[T\DX>;TWZd>_(Vd@#3/JDg.XPMgK^)>CAU:1g2U(FG<?7-3P,&R96^<NO
OR,OLX3#7#YN1]Dda9OQ8[-T.:F[)DaGFQ2ag[(;SU]V0[0EWE=A?fg,C8QVaGBH
C7D=f8)DW^BDZKD4&>Wc@.92A4,+#623E>g+[EBOY^_^aP;@L;fCU4;G1@KW647;
B1)8>b(_dL:fLP<TX?(9cFfWPc/&X+UM_@9.aW;.0Y:.7&)0@&5NgL9)-8f;0ZcR
4:cEPVe_^70RGQ=;S7UO(#J;8WCCM)&UcIZ8fg9V1]2g@e\7V##HGa6@QZaf)6&I
?CbS,>,8BXF(.O<YCP8&[G)O>7CK<SP>J5;<G?6@:_;>3+9dM7Y0Pc,0\YWW88^(
=-T2HI].4ZX^IP]=D[/C&QLP3R.-)PEUS(fTB4=a#LU=K)UY?_?b0);CC_(g)SG:
SE::KW#_SS1G/<^;P>>aTgT;>/]XBN.4<S(Z6_AK)+JNBMCWLJQR9WdaC[dI^H5:
)KdDF_<-L>?_&M@)Z@1QBEN876[=fEOMY^TS07Q/.#9^4N]F&WZ(3>R(f@4S8ML]
f_0HE82>?KJ)d.B-dOfEHP4?c)<(6cH9@GU&AO7IU4TaMZ>ZAb;D,KBJR/E2<0eY
[a5O9DK&RPO)-HV9H^^N2aL1H#M]C)<MBX2\Q++d&]fQ7B^_6@V/3)CHYO)(GE?\
UDA.IdaN24bB)[:KfA96IQ90/J+E0.:<S-5D\.+9_da0=/^.1_,J^[XQ7SJgV4\;
HPK)TK+gT/R05@/c<X@BN(JIEZSW8;<88&6B@GV5_WN8cM@]5\-fe6EQ>AS1B&/&
8(^dYI4(21]CPI9Z_O-.U5c3a@]cfFdZL]M5TU8K&J6C1:E?abY=1daDDUF]Z+)-
e;(.N(NJ32>EW=A7H1Y^&?]MO[_#MUg<4V9JS6GD-aGgTMKN9Z<Ged)?:&TX=DG5
+9MPB:XYPQ83<g9,c5:>U2NZb^[@@X,2\f#fU[9)>7\6AUa^7:&gG>.@F1;GBG@#
,-aA#7R.2O7Y,Md>E+&UXV_TWP=4c<E&S5Z[=R=K+26@-CI5_,&-(e[^H13]:9#6
D[cNHSeD;);-YQ<Zf2g@e8&eabX^I.J>K21I/#IL7>P,COPJ^?N03<L,LA&N=0@H
Fc<dM2=F[;d,IADQ]05U>Y16RY2F].E3X]7\=S32D_&8.g;,FOKJL+0+0-3#;ILJ
(fD6.bJ9c0CaQE:MW+&[.CUTP5<-K^XAL74XS^_47de0\/5:)T@c2WZbIOOYS@FG
ZG?E]7^6..BU_#MA4Q)>:PN4<T7KQ)7gXG)T@R[U:Gf@a\b1C@B1#KQQcW>:bYD^
Ug\<g4W):U[<U1QA=WfFVeM)2I3W8XX7EVG^P]<?#TMIL[4RLMd_Z5APW<&B/fgX
A[_O//aa9P6L,U8Vg@#.D]O8(08K9J^_#VU&=eCD\#LZ4Ue?VZ<HE?4FB/<NW,46
E?^T&+)6:9aC2U>R9+AT#3bKA-W0779fRRdFE[6HOCaK,5]5.Gd)/1a/gK,W3^)d
OCT7UY4ZW[\Y^31+Ub_][GE8UG>Lb=;YPacT>]g+:c8/UaIH5ZJ_(RV@LQbGNB:F
J:+b2-C<;[e,>RXS2A#dQ^DBAIPG0]Y.QIHbD02KLN(^+>Jf&<\g@+Y^EIXYAcJ3
EENBRb]dXe<&@DEeQEC0H=Y70C.7TG2?-WSFH]BDU>/\8C@9;)d^SbT[G(;fNC@D
H-7e^>^^8_aK)e&?C4NOW@;0)M:gKg]XQb3M#7^RVER>/d<UYH\Jc)PGY&.TW/c:
7>@57HgUdUYA=ZPO83?)a>3DCS+MQD<&cdE6I:6X;I=>@O=I0=UH2@K[f@(EfB<6
-P44F/Ue4P.7(KU?\fdNcY:LR.#RbMU,bd+]0H-W6OgeG;\&-H4KU<28:/W>FD=e
;U3_T1;-PQ0R[=31JG_:ICeZTJ@2P1LV(]B;84#O;8U&3RJM:T2]d#]#=]aAE2.O
R/_7-#e-<7A.2</&5F-J#?/K)38)gSRU@e+g36d@]=V(FXU^<;.(eT?a/EQ[2Y=d
gR&^3E(b@PLL:_DO=M8UPU>/D;eB)ISJ:#>900^d0\Z.N7&cYSM)I?2GTEU08b[P
:2WdAU<-:WI>A8>TB^X[QKD1#W^@ODI1BVX-P&4:;=HQRAA@JNN,.TSc+-1f^7[+
P#H=Nc31+8DZMP.VdJcDCFM,LGUgLgY0\E<0Kf0E3\;2BTJK]TB?)M928-gDd,X<
NCgB8NZJ/OR>.8,YYMS?b;_)Yaa(dUg/&2cC#<C37.G,P3+^>XS/g?_/YeR3Z?[e
-+3=);QATWLL8Wa55/F\9M-aBZ^J6fA;b#a@1L=G.?\=MO)&0<8Q4#[W=Ta/,]aK
Zf@Y)X)0#@\FJC?GTP3FH;-^e(]BLEG[&LU6HWY_^UU=.P2SS<>EgXK[Q^-Y\CM5
^#E<-Y6Y)VV>eGKZU?[:=H>R0>XL4)S/I7G7#.G>>U+[S4DS-T952N,1AU4.T+JE
SG4>X^Wd0B?E,N0O^;]QJdT11B-D>W/DK<2ZHP^I@9-X=?23g>?L_e;]^T3g5)/<
93)-<bM(3<2DM<b6/;28J7AF.LIW#,5cfDafI?7(Rg]3C18[LJ<ZfZ.T=THH=_K[
[9VZTCC&\]M;RWY/5f/.eQ=fP-gP#M3f1KC6[KM>BA398V):LWLK/H,[-ZB,9@F9
7,M6;\,P+-]YI@/eV(+DHK)1)PO;K>CJ2A:?1>K[_<d2KN)4c_9DU;L6VWUR>U9,
[T1_-B&#\V/F\S2QU9FdFU#bH8,5^SBWUFAV.aZbXY\f?UYQ/-3A<A2Rc97O1COc
==^C64M=[<G20&1)\&4;(f?LHYgTPTa8T)0T1b:,+?b5Y2+bde;MHJJ)\5Y.SMGK
F]3[UEGed,/(/;5Ag2aL;+ZgVS<8UJXS<Y?ee4W:L,1/VWN)RPdNN?HSU=7+\aC7
HT;DCY54Y(8d5]:8?.XYVG..S8cN+H0\1AQZ2@3&>dfN3+@e(/6<(=26W(6JXG@4
1(gAK+J0bNf<=IQS8#bU7S9e#P#]dg&1<dU&U_=:LDFI&O/17.6V+)b<eC+/3-Pe
/,=[JVBB5d<L1+c).+ObV#&c2Mb.@C1U)J#PJ7G,OV\-dO5;/+0-TUJJ@dH>J8F]
P6=/Gc@\P([#F)#cdJ368J9.c:\LL=+MDBT;W,-MX\,BC5?2\T02MZ/R^I4KSRFV
&ZgJg#D[2.Q3>7IR80L<1Cc&;GbAL;_eP>)J#6)NA(F;9GZ6W>K((EAX4a::,K1X
D8,9<dBC[+R#dXI_)813K^4_WafaMN&>G<EW[)TC(STDNfVPG9GR>6&^H7NXB[R>
bDL<?-?0]\[7CXNG#,-AI^3,f3:#GeN_45S8e\If;OcM.YEIYZI4B&?QZIBB5[_.
&9;2g1OO977BJ70Tb>SI,42Na7S]WL8DB/60:2O?M+\HGW,bRb@^Lf]LY3NWe)RZ
8&C]c;&cN6a8E.W1fO;5c,/a69>7(X8N;KR9_)9b\_Q0[]Y,4/HGIGMXC<^;8]A4
DD]F5/KB?]]g3-@15E7T2JC@(ceMQ+e=&9-.0@LOFPK.bO+CXd?Z7RC03:LgI&.N
3DZ_M?^C>ab?;28/]]I-1.EDZ6/1#Y<\S_3aK3HZUMG;5#J^#C;:^L^OT,?>.RXb
N@\R)0]B5A&,WE3VMIS+eM_W,E,-3b61_(@gBC[7_\;G&FN8e/.I]d8C;0;cDM+@
58d<fMLB11[HAP_M/Da16><d?V+TX@]JE]J,2;)JGF>F6@\W\L2W.&A5#S5aXgF/
&E&D\ED(1DZ@.?R^2<AIba9X1Q?<M?c]-IC&V9>BdTRSd.=g_XPGIZLWd>+>M80/
c>:,@eEZH;A93_DBGg7GI+dA9C^=\\1):9N^4UGATf;XUdUY:T(4d)<^LPO@Y#\J
,/cZ5@1U.+VNQ/TUbYNK(2geW@;:/+YP<_NTT7DG8F#KdZ&[\A26SU(K_8?2,J#C
FOBX8AZ4S?E;S@<YZBH-.59D[RX+S-#/E3BR/d)BUPNZD^927TgUL&+L8[W=?dDZ
ZLM?UHf/:7&?<D29#B42?;4_c:/U1cO=OWTR92e&Hf?g4N3L5cXOF9TN+gfaV3Zc
0MFaXC\fPaCRN/HPbF&00R,F@5]FR[T\e2eX&-903]1Yf7?gG8HSeV_S&DCLCZ?V
dH/89gZG^R\XC5b/L\6YSd#9a([@6d#P82_HL>K9X<P(BY73/W1VN6O;P1EA\VJ6
G([Ja-=DRU/:[B=5Z50cB1^BMfP=:4Dg+NJ\[-=C9]Jbb+C8^VBbb6Od,MdP7L&1
LS]gHcb\KFb83EU^7aP?6a.fDcO<F@]O74M40b0X(G+X#);C7HS6A/OMgdd?L/JU
-L:C>XMe.TQ4A>O/3TYaaJ1-36a5D,0.6WfF#TJgL@7fbU,b0M@c75(_^0gPJ]gP
gXMB^e/C9a?CWP++@9b#[UcHcAN+C74,E?g/])+_=b8Z2,P^3<cG(&C/94(4P<c:
CK.bN1D9Xd0a(a-5AZC1<CK84-fIL=@N/e4FN]f.4-O<#fCGV9Z,2MI]3cNIb@95
,=^)JZ6fcSVPB5IPEAV.Lb71_B7_=A3b[S(I)2[/b95,R/fESY9gX2_,.<ATEQDf
C&baQ3TQbI-6<&1K?K;7ZL7Z=cF?6YL=2)\JSV&Zf=&(-8):+G1?b+[e;W)WcVU(
@;+&V#I#<-X@d#]+UEYHZ29</J9bK(C?2_].^a219N_AJC&1\LKY_3aJBTZab:M_
-IV@)\Jg+d\.0&X+UFLU?a.DA_[OGK]TQA;Y:#Y94S-&/c]SbQ4)PL](G#.]\7Tc
eC5+&XL2bcAO9L98B:?-3R.^:HNOFdU9@3=)1e#;G>H_JSON&SMF61/?_+g:&2S<
[3Cd.ZKSBNJgb4SRbZ=@?F#g@.+93=@_-1DKRX+c<>RFR_R^9:ZDEE\53&-.a,#M
b.I:1JZ:_b),<WATCF6+<EIF_-eaHC7JQGT:f+4fXSWY-8,4(F91\WPb>&:a(dR)
>a5\AZb,#7D.GFE_YGI5FgC<:6Z_I9Te1H8I&:O2b\6[K)b&Q971TB[B.+4Xd^W8
ZTC]@(-fX[(-_()Ib;]#Y?MAU/\=4T]KaE_.Ld#)U>d?R312#SC<6B08X_>d@KN&
IA^IM:5L-]&?<e;5,TH;.U<9LIC8aHd1eD>cQ?>eeRA6c7R@P5/674G[GT]E-2X,
0:R->:6C_7J90XZL;O-XOB[;WIg72S1[42bU?O\MFKIJ)Y]L2fZD#=T#7Z9>]UTP
-(=DJ>+dT&@_#^ZVH7D)\0/<Y4cO+M/aDA]0e2[4,OBPZB@,fL9b>#.NA.QCc[a-
:[AcL:a0ZD]@7cI45UY\+f<L<4&X7-YEDZ-a1_[1U\K-72^>Z9=\E^>V-./O[YZ@
QL-[942(FLWS/C#-#23X>[\6EV^B.D?.ZG3X(E:N\SU0=5.cb.[3?XS@>1#eMfXg
#)7B&T7QV(18e2#[V&EW^H5?-fB2-@R66e_UaM@RC(84]CA<U2PYcO;FaZ.cB,Mc
GE5<?+UM;gUBR[/d:4]A3Z3ET=<Y4N)_GT3,:UT_WPgI3;[CWTD?51YH2_IZB4Ud
5P=22#>LCS0eVM#6ZF7/T:P\J:LFI=VJA2NH,BSc_^OT3fDMW&<O^:WDO+^[XTJF
<?J;O#g7/&R@WRFf3J7QQXA_FMS<37<4+g;AGO9.+c.+:RR0@Oe&3XY)aBM.gc9N
HG#;Ad[Y^IA[YK.&dY,<Z_MF7_5eW1Qd_SVLTP_E7AfQVOeVZ5bNRfB\O@JT2UYG
\L=Z1ARc,eg(eQB.<H_Hc9gN43Y>I1@D]U)CKE(J#f>Bb6#OaDURWPHUbCc.>MeU
L=TH8>c<IQ<gD);,ZN0DASC,15&J8PPC>7J^>./^7Ja4G49\Ue5)4,PV10:,d8=E
aMC9?OF1KIME_LeOW4.4]/KaAMeg5)BCV._Rb3<4&5BdO5O+OOUAI]5:;<6H_KfU
I?S6f@DF@JAX]f]C19g;+#>FBFUfLAH9O2D=c&4;42T:TZ^@88)\Xa[TA^K4<[Q5
+d<+W\PJ5GX[9c44dJ2a6O#?_&FFK:64S_54-:7><]&6QT_F5Q[;F.,?K]XG5G&P
>VUJb1R/X&N:]=^/f^SL(X6YX6ZgMQc]N[Fd#017+@BAZ[C3c1X][cd<f3C_RX\;
1U4#??TE<<.X<_;A96J&J0DJ&[7983P(/+c^bO#5T(=:,-2<^W6J_EJ+#MX+C>JX
V9@T<H095GD[S9ND->P>\]M(9@EF9\UXDI:U)[AMSPG]_)@g;BY,(;b]La)]V2^.
c\I<FSE,6UFU7g9\:I,YM4XVI:&1BgP7SbYEIZS:=NOc8:-Y+fTG>fA^KD\X+fLU
^gdKD=c3>J--YV-_N-5H\?Bb=_4OWe4O(&DN0F,#WSFKW,=>#X5D(.QA+YXY@Oe3
)a3c]=KH=K40R]?cda[.F/I,@M.#19M3L@B(=Sb7/4BP:G5V5@d\Sg&1G8S&8JgC
L7)C5f,R>@@)EU_J/F]d1>e?#ZXe?g,B-E[e2ZOTa0SD90QBLMD.-Md6aFGb^@<>
=CEQLMLgY3PG1-d?^/1X:eF\N96.bd^/Q1IP->D:5\;HWMYDH-86N\>74CHKdI_]
G2033G-.6/7==_6,Z>]_1QBOY)]g1S+6-a:TUSO6cDFIGKR?H>^=4d840CI0V@.?
S],50fF0JYaa@XXK5A;I?dFc4B;KaYg^=KJKcU;d7;?L2UT&D&LRV(CT0L?6+C,2
5J8S&=K6^E#OS_H&1E&F,3(><+@Kf@+&9aC&A>aCeGYe7A7BOd[dLC-H)>]TIa5R
[8FLON;6@g0)9/K[4^7)Z2]-?:+f@C>8cIW<ebX=gC5D/<7&2.e]J0RGK7]eYaf(
cDM\06>4e\g:Wf6W)_BQM8DN0Bfg0^gLAM(SZg+<PD)K,XQ)>I)e6VVGe7H6@H@&
LQ@ad]-8WV(-X9>a9aOB1D0C(RGaSRTUF-gXYae1LD5A_S+WPA_8R82GXU@HS+b<
5V>W00c8&9gI_RQ?--B70<5]&V#P2gM-2&MS&>Rc?+Fd-0HEK.e\4H39Se#Md-8-
4XeIK&M,J@8TD43)2cB^X3G/5dTYV0:R3M@OdW@;EF/a((S\L/9?[MgF>T(,>[7c
Bgd6]e_bFDIUCe2J1b#H3D^HeacfM#][E6Z44b+94F9F.J/A@?0f^b2R-]SGa<e-
481X2V<+,eb,).[QPJ(6:R/L^(8f2-IeFa:TC:8PF26+C/11<=MH42eQ_GTg7_,N
=U,CS_BN#(?95RMdQN0YA5X?c?MS;X8&/@-\&U1?\C\L61g0ZX929F0E[0]gBC#d
./E(U0:5aTJRJBBD(7D,-^VJJDB-):3/B-&\d,XBc#;_\a:I+(d9RN[Q4[a)96fY
Mf]NH=-,cK;1U+9XH/0bXEVYHeFUWU^bZC18eF_5+<#dGb+T+3/T5S;J/TO0^1[9
:8.b0BI4dYaP)(.c(NOd3\8I.M9aCXEWa?)WgHUOPH[UafA>PdB<&\5cD?g;OIOd
@DgHF71>)R8^KSX>0T^52D0b>#cd11_.-^<Y@K]S)CaLII9NIF@7dK_NG9PVb#_c
:A@GQ:_4[OKHI_HS77@PN]-ZK/M?aJCe3IJ]5?N#V3Q\6?W)<NeMQ;a:f6T0/V7G
G@#fKRXe4-dSbGS-Mg=_.B=UY_3g9)Z2-VR;YTCJT2S/9\^a(^>#F@8.bJFDSd?/
YEGb?A)9A>9M>;2[bPZY&W1aOR8QTQG;B>@KIDgWH2KQ[.Pg?96NPRIC(CJ0Mg7b
2U\UT:>,5AJ\R><=eZ8OH__/#@TRb/#?S8b\FG<F@PO-4=FdR#9H?aU5^5c-J.<4
Z7:Tc&U2KcC68eVO2RR/e>48c@,2C(ST9gM:2Q-MLJd([9A04:9=\ed#6?RF\e)3
FL/9f73DY\[K11+^NHB&eYc=.ZB[X#5(W;T)HGKNLN6@/1(JEeC:QNa?(--3=N^Z
MS-(Gf>Pg^[.Uf14&B3+A>,DRV1/X,N_O&OXI&\#SL:;Q/&D5Ja]WHO3fe/=\c].
VGc@3Q1]LgPT-YGZH1&b/_-;^0dFDES@MV(<YGNfaT+b0@/>9._(3-XT-fA8UHEH
-D&/P>9<,96L4DB)J:c;],5dE?T.01c=+YKZ5UMKfM)]MOg,[-54]@?_LE<67RLe
J&H-9f3@8Gg41F@.GEZaQ0#W0S?:A@QD2V&d-W&beGU\aaQ^<=fE2^7.-]:2<OeG
I.VZ@9^d6T\+<KT,9BDE>4]X1_@4_P5<\3]@_f/aO.D<[b_1c1eS+B8a/cS9LF@Q
d&]#J+UJRN0#I:&CbH[5:<7ALNLX3I5_aO[K_3b;c6R>M3=d84b9M#H3MY.X.6+(
W(+N,#A)K2-aO-K2\L#\713UVD?-5V2.bN7c6VUY(-_@f(4-#O?&55,QL>=QQ@[Z
E&bA,8QGV0d<3-J/)3LW1&CR=\W6H)7,3dc-F1Y9[]>g\VQ((H>WMfFQX,;dJ1_A
T_IHGXK,[UD&cSECZSCPA)V/)/C)/dcKO^>[T#D5;LdGB^O4<LK\2dTV_dX;I?>U
TgC-PP#R-R)W+3TSW^F7OR,S7eE^QEIGS:&HE#d#MKJ0^PT0]41=^N\A<>UG9H0:
UK5+_A8ZD;c-7gF9_.WVUBL5a_&^1IW#K-7K0bYBdBHX#ZAE214aOS30(TE]S4.:
YPSWCS]K._Aa>LP,5[c73.:9,[&-B]DMOS#HYV(=Ka-M29P8J)^8g;2AA+M;MG(Q
:1T@U_[\/,?ULeT1(#0BN->OMHG[/a,0QPg)FfNG]]F&)B++3,#[564f2/2]T.aX
O+VM.(M?D+BMT\g4#B[YQB0a0;5BJaA5I39<+C:_S3I91JdWdF3XYY<T7g02=gJT
K7T:DO5ee[,?PEQ5\cVQ7\>Mc-8(?DG,6e3A-5@^^.>K+28.94S>23(8R(I:6;?a
[>7^G#-GUF(=3BUS5FG>-eG-GL5cdaHF:OLRNJI#>BWJHb;GdJ)RcN,db?_8TQ6A
BXCWOWfNLOQY>YWMXQZ=^ZBL.=@+O1Q\bW>e3M-]0fc;S9A:c:KAVKM4fV@+^\Eb
1g68fQg;a-Qd^&HgeQ+d50-ZeSNd\3Ca(SN1QC\c-TW6;0J).^76NE+;IR5U7c6,
&<.5^Rg#eC#:d6DH#8<?-WH+X[H?-GEYA450aS+?U1d\>1.b#bYTg&D7BfE:5),B
-[D]V#\\?&gcY]aZ95ZZ(8ZDI,^8dL9>\6#R>HDS.N<5X>3_L_@;KC72g6dI0@AS
NKXG+aaB/eEP<7]GL>;XZ/7O3A/],Z04^/W=;dE-XEV^acgNaGXgVM=H,2=3#8\6
8YL&U3N856WVdV5^8KW0@[FAeXfL5d8KV;#R;8?:?QEMGR#\7#>/C4OSXBEQR3#/
/L?CgAENVDX27AH=d6G_aP]?R&MC(<6W_bA;BT:XD1(Bb#;SAL-4@FBW-=VQ4WP@
_EZ?6bKMWP]I2_OIeY\8+[PGeI^5_bb?;Vc/Q51eAf\Q57[HEICQ<8CAV>Y#A]OT
c@=FV\\fD,BbBZg1WZ9G2A\E9=Y4DLXCg]#MZ;[P+K9fKXd<b8g;]fVM<Gc-G<+D
@A>+2QOW7TYR,C(<[;K.OO9H-O2QHb.IdaDG6fQ,C5X2C/YX3-.5E,H_&3TNJ&SW
e,,Wf#,fW\VbD.5<LEL_HDDU++_S@<gCLbBeEA,VHZ[Y/(/YB5b[d)C:;)L&MgU0
.-fP;LRUf&^EQPeEBK44,W6]TIM.gH;Ig5N/1H0g0M;0PWMbO[b>IMHfQc4@__bH
F:W-f<=GKZ^BRI8gE1gD>g@Ld#WbJY3;[4+EIO[:_/-U2J2a[CML7=ZH[@+EH9ZR
899/=:HQ8@H1050eSKdC]eEe99c9P-GH80VUJ4RV=QF3FM/2>>[Ue2HG^);T,MUf
7>=4DLZ_QO,Ze#V?->e/V2^:ZQ#O;+=I5N?.,U,14;W(0TIcG0a]NFI@T\S31S7.
3IV2Q<Q>2L89/DIU4OAbKHZ\4-^2-J)7#<M3Mg(7[-dPMW?/@1K:5?cC]Zcg3>57
;Z)>X7\g??NfDYA/<5QD(\WgP/;T7;CbDO^SXaD]I2.a@&KS,N[2=&,CNDKUVJC(
M&@_;C9#<&VYbaA),eO(U+g,8Q>,K\c]?(48/)@eK)DP/SEPaFJ#\g]Z3]3-44^4
60c6FM:-/JLM7#2d:F4\1#U=CaRA.&34=N^@IY<d)F[>G1>f:ABE/1?g.RXP@d\c
M5VE4=e+&XJ6gL\NL7Q1S+Yg2[_AF\8<.N=KN#00IY)-SGW2MJTXI4HCe4..;gg,
BKB-e/+<>]eIFX2TN)P?Q05a+O>;G\_X<TVWFG5<HIGO-+1/0Z3?X+B5LI31JbWg
<R0LE9B:C(9PZH:HH]JgSWS91MeEBY=ZL5S]F0dgS4UP&bS=bL,Da&UfJ2KX&R+-
AJ=I\U8\2YHNdVcQgD>W9E9]AT3FI-NFEKFfL0aW:Y-Y4EL=3C@85g#1G=G.ZN3?
^0PQ),GT:3/\B/8T<ReZ\XK_Paga\YG_?-_UVYSbN9b.HZ@&/aC>BaZcBGVVZDX>
bKY.0Dc:Cb-=07@VD.+_U/,BARX>H)g&JP_8UM\2<=dO@+4f81VQFZ=1;>][E#TJ
@R;C]/O<0dZZO22OW7-H6G\I)Fd?F7WRJHD#_]2fGac8eB?COEWG/;^?GC<;WSN)
1+40+)?S1OM8bN6YEPEa+gV[S\HI(2>aQ_R#VW^F&(_SB_PBZc5PbNYg6^R4AaKH
K6TQ4a5<6\b0H,;SPQf:,#Q>08Q\0MV#b(NCB/F<Y1d(F46a(dANJRS?M;@[5-9=
/Z[D=]L8AZN\[D.6IWI)f?^X11-Cc5#bJ)4-=gN^F60;e5U.57=E#<d9ZK(3QMdS
YO;G3GL#4g^?f2K>\gMP#LCE4#/FW+8#]gCaHcD@MZNJ<WN>Q\K@[=MELG3IcD6@
&;WQY2Y^;WA<_R<SWQfL#bZF]EbHGE:YD9(3R=[V1TE^WRK<MVC;F,Eg6),FLBe\
DJ;^NLTKYbK(\#0OJOgRR023X2e1d95:.VHK<&K0Y:FGIBOEDe8d20M+IK?]Pd/U
J,de:H31^PAcS4QW&9>-\.3SA-Ef03@U4U:JMdR]FFTT);S27fB.ZA^?L;a)eJ4R
^RcQ5I,=6TU#WVIGdT+Rd/0c1FVYYO7@#(6\(U)LS?)&dA?bZ50aE>N-\#g0R:(-
N,-UC0Bc>D3-B)TVO.:@8,T;T[X+98&W5[>89&=Za=:gEIV4BKEYR#08](._=OL^
6_KKV]U-=?ZQZ&>accc#\e)]NIHId2=F(D-IPH5_1PGdb=N9PMVYQ9=>\a/XPR+S
[BO0T&adS.H2?<&T5O7&GJgGBf]V&f9)BbTMAgM(cJ?>Gf#)>.I.O;&J\?=Y[Q-;
2^9[)1+T)0fA^@B+D-/6G:((^S14GB_^Xa4+>G8>bb,&+C?9M+?FYEW0-AbbB.,6
&>]XNK(_N.QZf5=CID>F8UV=#a]@^9eX=4[d1D(&+dK69K)N(^#De7N,X^O^QV-@
P.]#DgH44/4,IZB.&:/U\@4E:g?.OVF^QKJSfLI]3LF1R37R69[fLMG+5\g\N2gF
KOGH4.a\g#RYVeeEJ[+HWKF2g9[\3I/GDQKXaU>4CQFb)N/<9SPaAaB2NU]#J8.8
f6^TT_N6e24/@\MK9ZBF3)b3/4c@8?GN3>P?4TBG^_XJ]/eAO&#9fa5fUEG&8>3;
\QHI8=Ic222B?-LO(6;A(YO0217PLANT3J(]a-]a,5Z:29TC\B;7?90-NT47G;7,
CQS<>b6^2,D<0-+KG:Y=_B,GbbVQ.e7,He^(?>bR_+D62@PES8(J+H4P2dJ#LcS0
dM-.DV)?A;ZKA@T1\57B[HE7b<&^edA-25):REGaA4d(7CC\8D6ccOCW=O+@b_=8
B:&QZDJ:UPg@5HCc,]aLKL7g+D<9AZJ:d=E^HR_bNCMQT-M9e2QORHN1<F?<7W.G
-H=7>(\-7Y?-Y3=>]9&>A](9+1VRBHEZDK)7.O7/EVRK;;M-=;eg[6UYM(ER2Uc7
Mc7#B.OGH_8PTgKBA09PFc6U9JeA^aJ)@B@9>eJLURbOXX#.E#]&-@<4(43feO&a
Pf-e_)R;7@b3IFA,-f/(+:,1>da[)K>7PS/8KGe4IbS@HJXc#0W7Z.+KGYK)7@-O
9e<H49:&?F\D#1L\gV\P7#XW-AVZ05]I[\SC\RO_JZY&1g/PB/]2ZG9F[fC(GG&Q
a.FHf.GZJYCWTO_I=UB<-##P1gFE00)ZGSWKIVJ\fV1DG+_#=(d/()gbGF3#gd06
+MNC_UB3F]-OSK0e+Bc=^KeYR+KWHAE7b]&#O.]e_>@JA4Z\H?[NTT1VcZ-J?-:0
0&9UA)?;?KM<0d7SYacKd6795FI0<e/DK_f6&Sg:fDN9Q3A&4AYP,Z_](cOF1S?a
9DeH564EE4H2#E@465(CFe7-NR,S6_E[O+bP1aJAMeY]B82XS6LaRV#EZP[V].6+
A@K5TQF_gcCNL_=5A^CYA1_B?\b&45AD=)?2.QU;U^S?_\>AYHV6SBc#;Q:&4\UY
EVE;UTH6;(6PabO&V6fV#T1)a?,]#KFD]9A,1+=AQ0\:aG+OgY<0acF:?V0@a(+5
.eKQTRc=fM^<JF5(LgR2?B&OAUV>dVYDX4BRXdd04<B8IB:(^./&WXa9#b&A>+HH
_YEKU.]8aGY0d[W0_ag32GJE3[:LRO<,K9(FR9OGdK@_\Fa<c&>>27DIKd9<&MVg
7PEI9,TVdVAW75.9(7\g7],X]L80/]::J).>_befP,C2Ne&cYUCN[;I;QZBHZ[VQ
X58L/[a+?H/RK;((;X3d&EC:0G:R-RXAP,\9D(D4@+?(dOg7)69T/J>FYU_WCN42
UB\88dW1C4OYM-Ka)aRH6d>5K>TLLe)D22+LCZc+4.?eRFWfdBT>I7#_0Zag9\]K
+#bb(bY5VMeY=(G6NUCVAV>LbR^6T(/.8gLG@[e>#Q_L:G2_B;1a<0E\1(Pe3B1M
FcZ]_F7Y];.QVf)\V-(8&1U]>V)5WN2@fBM?(_I0E=.?ecJ7BSG3]?S@X#\<f6QQ
\OVT3T4RZ.;W\0XEaRF3Sg,?G@9;-Xd>ZX=:ddQN@<>(C0V/cMEK9K.@5VI<dTRf
3QONURgW2K5=1VHf@f?/X)+5)W83Bg8\QJ/3)AWW/d4dI?cJC[gJT-#1afOf(>f+
f=M]4g_HAFgW2S>Q+#9^.;KE45]:M-Q9MM;ZG.1RQMXS,;9PIPc8#?L6YJKCW_6>
ZJ/S:]JR9IDV;)d)1<FWATQ;T#c4=O/PPJ<I3#b@6J@>g2+T]#+d0\=(,//:F-\9
M+N]W/ET/Sd=S,J\@adRATaE8HNV/dRTV55KIKe]&FeNK=P^8FH)&<1U4C2X806X
4903-Vc0M?b071HL^g\#Z:ER[H(4IXA395QcT05O,N4aD@ZD+2;)0<[@SF+U:TXg
AbXF8g,Y7#1CCeF7=RgBYSWE.RTUcNd?ASUD.64L#Qcc&A^P&()-S6ZQb;[dPH;X
.[XAV?JOfCE:.PbK4WI_c]3+[@.()A2f.A_4Q4.gAg]UaYK_eCV6AGVgWKPWAF[g
bU<:]baICY]3]9,^&MCZbC>6eW^OL8(Ua?N0_X7+?I/5C44T(#Q9XA8VR0]MdPMZ
[T&:OX6+L71UV^>\O41bXEF4:-<@#2PGe6c_-7,^F<I1Ag,e(.R:RMZ=,\5=5F\=
FD05(A\MUcPG_W8aZD?##-V1#Fa?=Yd[_OSBF.e&>]-0c9>I_3L]c8@/1++=L<X-
WRa+2<D^:S>cKa8bF25>B=(0^2NZZ08F-^X.WA6CgJeb-/Qe72+#].S0T@J?Qe58
EJXH&ac-.(:P-_[8M+\A-0R2PEJWL[JW)(I75#P2e06Ve+E17\UH:_PLZ)6GN2W5
3).3K.WBgK-X+Ea(ZY6>CBE3\f(dO=F:B@f3Ka.:8C20T<Hd8]26L?MgQ\a@^gR+
L#ebF@EFg\G:FDcSgH/fUAR&W=KXd.g0U+E)BC_dcgA1cK@Y^aTAXI7eGDZ\Q2-B
Z]ZHG:QM<Q3Lcc;g<IF_7,.U,9E3Ce8=\KT^+_8B7O,E5)6FXE^(R6Y&dR:]&.L/
G)5=.A_d6g<XJe3GMIP:&CQ/WCZa&5:gBY3B<(K4R6MO5WY+VT6SQb37dSUYeYL(
-]YE/,GKbPEM9;Sb1)#,#Y;Ia23):9.LMd>;TdfBIUJS#M[&B^^NTL_3:NQOTF.L
,6<9Mab_2+0X0UfcYP;0;?:,39C8GY-M&^-9NfQY4FB\a#=JMXf1MV/]5G>\(,fA
I?^dTX?=0cQBGG&Z/DWRO0;8.GN?^^&KT@=NdfT5)b]H:_F^b[Y2g9&&g2MXE#A3
BDYVEP2aA22J:Ye-R#L2#)B.4JE6c(W:gD._?C\K6NeJF4+0W-7f)YV]>CY@3Q@/
4,G<gc=2>I#UX,UC9g&Df7N)(M2I+@A5f82V0QW5A][3-43<g([=B0<^COTgN4>W
75@18=WI&&_24XODKc#3N)D;]?MeJN=?(bR,FA4a+N53gI<?g@-?Ped(;MBO2MAd
9f6?&gDG8Z+\=(-^M?aS9M;T5d-JD\Z2)VU/L7Sa+UC5_KZR-FCZKe+[L20aV79_
FTY)G7EROeD)#,9T_+f&\I5^H::AQ\#(SXfD,0XE?J(_B6@-;.I>/W[5J<ZN:X3V
#KMb^_NC;OdI-@R-9=R@4H5IT:UWERXcW(.HeZ_JId_\1I:DWf+](I.(S&6POFY0
2).WKcKaW0AXO0fEHK)NST65^TI990/]@1[.M/2g42[TQ?CH6)I,I6NANAAPc?T<
:+Z<aK&B+K<@\e[:4&>O4G;X^4RWL?<V;O+Y:W-P]QEFT4DW[HMd6W=3Z;/^O<Fd
QaW2)G-MKBOSOM9LGVS913HDJ5eV69GK(cWCVQ49(:5M]-C4e4[[A<&D.62CNd60
FJHX[4@(JL[32+b+D_X\@gN/:6W43&(0OW#G^Bd\@ZZG[Kb.CdI;A-cR2S-g748;
OBQY3/,c..F;5aDCZODXNGF.g?0^ZfB-Q:[:8D4eZCg5Z>&C>>&;5fR[IGAS<J<d
a><1N8HT<AL]RT?3D=00Y_#gZ1+7<K[48INH\LZ(<ASB+S&Q17\ATZ&&O47cK@O_
<@(().]X),dWR[)?eVSH/fD/J<-H+?#/]Mbcf<gU,(C?6K3GeO-DP1I5Y;RL/_NE
.T#c)M5-+9PL1gDcG)8,?B&XOL8:/,c=+<@Fg@d.VWJe,:/-.=13d_\_1YUX2LX#
M:=P;]Y2fS4-c7dP+X+b=_:62@^/HQO?@g:&8=LPTCa:GBR?)0Y&Qg&:91/]C[(b
CF(SR3R31C4]PEDGI3>U0S&&/F744)B@GBb^JLHOI5Xa&IP&T.6,27D9W9:5fD/J
YdPC9Y>)J+YVg_D=eR^Z:C+aS21\Q6U/QUec,U5S6W7H_R8I49/PZgW9Te8>;Y8M
CVQ[UJ-6_)<aGDb[H@@ANO-;842aCDTf\\J(#^CWG>5Y78R>ENcEDHcD(ZHVK(3;
N2?F-?FHC1,@Z65M)N-c#&=B[\;T<+e@_PPD82=-C]L0]_ZOQc#WHf[O)SBCD]DY
/Ca[^L#_8FV^FD:KIOSA-_0_NT4_?VRK+XR]M@/C=KH9LG;B>+cD]=Bd7G>]\[SU
:bE(ZMJL1\1AdK8T5E7L0Ac3]#d0T&:O#IWdN2I6^=9^RVOcM6N2]Y?(YGX^IRUO
=/WaG4=(\b)TZ4SGX.Z?Y>.<SWN32IX:VB?P@UKMJB,T7YeJJ\;bCFc@56EJ8/gV
[C&XRZ5U_e>.fPFB7:&?9MgBEJI4[C\;6N/dD[.-VbQ@T_Nc41GJSB6./WPb.Q14
6PZ,I8_fYUFb#SCANfK3e3DaZ8-FMG]S+<aG/>bbUB-P#KC]2^Y.)U\D@dGL2BOZ
ED,(VO#[9+=:_9]]U4190+AG9b-GbN;6UI565=]^_<E#_,L<5dd654DV\8+N;J:Y
LH9W7028Y.\ec-?U?Td+#9K9@CHNg:?K=(Md/SaTQR&+H^+J+[NH8:7-?R#/eMXH
?O.,6d7bdHg(YegA,S#M1OQKQe0FbKD\S_@b2&TA@EgI8e_?J058UGTUbZZJ56&e
6H5_)@#+UAePee>T(/Ja#^4g<X59)C731Z>]XbQI&,:H09?5&JGX_S+].,FH0OB:
,W/-D+0+Q=;9\\@Hde\DR)YG&708AID<,:U?+TVVdcF7@FF5;=7Jd<9]Y(V+ACDZ
I78;:-YRg90ACa4P_7(\0A0cdJ&YfDO^-;\^VX-;gS8T]31GHd9G6BZ<QfF6/7-E
#8,A4I1B,NAa;S(<PcHEAf(>.R]H0O&Xf_U^H-AbJ26(>&c./4fe:<3_,HEW>7g1
@/TK#XO,e=PWZ<d,3K.R&Ha9)ND0[_PNPcMVPe5\2&\47G1@I#cb25B6gA)Q6fd6
.A/D9+-^]UC)AYSSb]?QWRGP,;Y7D#@;:2@T=BSgLX[Z045QGIWGV9=fJ8<UGL6=
0fT-(?L-ZW:c+F-dJ:9U:ccAF.UDHK,CAa@MMALEA_Y5e/+[-0g6E>-)GEIJ6@=c
B5PL7&R_1eR2GP\2?0fg#V/d2R\8I>GN0TceD.Z47/d:Y(GL\)6a=Y4M7dC6FSYC
b=W@P12&f]2;,IZ3K8NNPVf>UA(g#&0YeIS5-9=(0WZ_Hf?AP=J:I#1@.ASD]_H:
?/K7QLFZLEX5Y0]fK&OPD/B_<SPW?e>c[IR7M;)+&808J6/&a\YH1G._9CXbLJ/<
I49HFb;PRg2R?7=V;V85HWR>ZL(cG:dZRH5OV#b_\DeWU>3UAX8dUX,BY,Wdg-]8
#C6).SQaN_P[[3bcSQTRS(4TaEIZE<f;E#WVc5;[#H<f1H4&41;:CUMBUC[\aQ/&
ZA:=U>O_6O8Z3@TNY4S#A?&3eS.M_5[6V@@6;M(?MU59Adb8bIgV>\F=_6Te)BNP
(L;#/N)H&cQ=RF\F7XCJa)>9>^?[Q]H)A8/Ad?G?5IRg4M,5D4L)fSH/eaYF\=&Y
f2?UVd42O@FgPA)Gg&L8OK.ZVMJ;?0BZ1&VIISB;/=ZM[3?0G7DU&bA<2&X82b&f
,,@LXAML8(C.9R+Kfd]B97H^5]SfM;USTA8UAJX-a.BbJ99#6E:S7dbWIT-g4.@U
M\ae/]5d^SLbR3CaC:II(Y+gE\JP4U5ZP-8:a#MA1,TTYU/187#AZ(FUL?.SF=7a
,576S/?F++QSF5JT<+T0Q6O_.60EeZ/g&PK7Yd+-OY4,:>][CB@1Y;OPFP<II:_[
NfH+D\SKXcEG<.HC_J,^dbbJa<L8@_O4\G4[7c9QP/cSN+T8;N>WDO4H3\S2]G3?
-2eEc_NY(,@dVA^\(M5,D[>?,T],^L4HIT^PBOK-2J.=9FB>1-R(_^<V-NG8)aCB
6P223@R3(N3@XW<>+fM@0Mde-[E_C^C:]C;/@/Y1A[d(7bCbP6(X=<F.CT)S@8Z5
e2I)+[OFW=bG8Q9U.0FJ=MN1@a/,8[JG37KQ[)g3B;3V&#,X:c>4<S5X5g#<SO>[
;c0SXdE,Z9E)I8&U:#\RgTHH#Y0[]KL^X6WQOb\d:(PKRG>F4KaXU0b6,\)7dP04
bNYX.></ZU(+cI=19aH&OQ3^93&=,ab4#UEb;7AQ,WNLa:SNE^R@HL)HVLJ+9-T8
;M)8M+Og-33TQJ^?,0Idg)g.HLd9Lf3NEV(\LDAW0C,a;CPf;RaRcVJYUC>VO8(K
1A2X(7Y56gG+K=YWCJ::\\Xf&;g@@NOBY.ef\7/U^NcTU_7F;2^g#5?f&M<WIMF?
[>3(F:R39O2PRRC>18>GK=U22C518F[+@60SL8,K9[[QWHZ>C/g?_8+Wd_Wd;e7S
#1Ygc@+HKEU;&1B2aEWD2RYK_b[a+c[bE7<M.bL@>.JH+\JMYUcQV\7SR_cd+c[B
727AT@K1Z:2RfU6JS]ANZ]QMJ+SJP#/-R?;PRNBY(U7Z1QKQ0Q,cO&2\+&0U[P&M
(4LZAdB\N]LXD^g&eD.X,B&S&YG/4LFI]M)M_[C6^N2;RcUSVR,d2Z,bA7J]DQS@
e3??W&3?F+Y3HHX.aX_DL&(Y_@I1[OBX1./g[A?,[7N@(:/&>>)D6@/KcCD3Z2QQ
EFc-9?>Y6+Q&7D/U;O9(Q_]+APD/GFM_XB_4Sg]5K3,-/Z]\^C<B/aN_fBT9g3c\
;W?KXgPYYa1::):(MHWJ(]E#TcL^aC[_PRIKV?0=97?bIVQP>R(6EELU^LAJWBS:
G3[eSbKA:;]&O@_;V7J@&,5S+<@X9cR-42UFQYfdec)61L9c?1?V1?=U5KWHd+7g
V,S\_aXBTY.Y)\<N1YJ7&S6A46YR2BFUg_C0KRD>JCLSeQ1</4Z4&A^SgeONN?(^
BY4fIRXRDD@UBVe];-DO38?cdXO@50:)?DS.;L[H8?ARUQ60f<8X]WB1],_YB<<G
Q3&&OH)g_)e,-P7#eP7962/_CO(_;EKV;IC[F-N_?-IMeIX,0K&J@__Bf[8JL_VF
BPZD^Sc8R3-#Jd<M/0-8f]CG9aL?R:(&2cff@Ef21<CNaK5[>O(N0R7ZaK_\8V0a
:/OV\dF-&CFfHR\]5cJ@a<1c(IeIU=\XJ7L:9]K_cP(@2f,;W1YH2ZbXEDHN\=C^
K3-R^dP(Rf_\&[eDEcFgC+DE0EdO^ZX0:c]b62W2?]D05:,8d;)^)L:6ACZ3GL-Y
a^4&M(N=bP^bg[RJdWUE9SLC-T7?-#@8fS34U,gDg?8VG\9,3]+1QW64X\7=-O7]
GBJMTbATG8CM7BA.M]d+-PO?g2LXZf+YI6;Yf9ag@2BSN@CM0IgT0/0Q@=Cc;HQM
<;N^DI81>IO]U-I:@c8JAZ)3K>JCUO+?cF[21OLYR?Z5F6Z#3=Le51Y/H-10X,()
U7__J??L.H>(4Af91d(Lg3S:U(>CL+_WIM)\TE8SgB;>.J/FNc[J5DF5g]#Q.D&G
09VVgYV96T)#L3,Fb7X[OCS8XD>P4^:JCHV@4LZ4/-2)>eNOVQ#ac8<[S8Bg&ST.
HD/\K#P1V-eSKJaYU(P,.U)#T.D,cI&c2_3#_bXTF5@ED60QZZ[Uf_RS@g[EPUH<
aI3;G.[[M(=8A;:,;E_gMM#/7?FdB3:,#^MG;SH<\JE639EG=G@52;B[><H0O59L
ANEf+NdO;7b8Jc>D[RX>+PeJ1@WP<(+VaFFIg(S1&_5eb[T^84b.S1=L.X[ZO&,J
_4@/\Wc\9C[fN]A2[IB3Y1\T1H:W>@??)TfA_.e??93e)O4V7+#1FCP/MU29J&PZ
4#H_?2.XH:;ELULeNbW&>=X@C;0=GEJ_X+CJ<.\](HQ7&I)QRB^ZLDZM2+BFL?=-
EVMca1+SS7bOEBa=D(C\bW:N0b[Q_8;&UCIcP@FQ1e.,,e_?QecO\]]bg0Bbc^GU
[9A;&E5?P<b;L<#(5;R]=;fPP_RKM8a^b_\QM+#I8;GZMX:S5eF/VPA@W)NeM1<J
2OEQ364^4a&4R_b,KC2FB<4/?baG\(b;0+LWJ:H=0DI&]XZ#95[)\4U6BGW7ISF?
g&5@GQ8ZJ;@.9&;WIf[beS_#&XdE6W\Oag9)S\2_,#fHP9J.S&QO5:gQ@2XM&]P>
&3U2:-QJ6N-g<41:#?-/<)?+[-3FT[@cfHeb&Ecf^C/17f@Ub;A<N_<.^Aa:YYJc
-CRDFT7d0MV/+AeCA9C98YLZ)@8_F3[,@BdX1=R66d)CcMf2CEE5/,Y\cY[1[.I:
bfeKZK646B40Va2:If7\?a#,=5CPBH&-<eBOTbGGG\fY#DY@>?I1+@-VVCCD?Gd?
^Q6I-5CPS:?BB@f56-AY3@V0.0M@(PM]aJDO1WN_aY70POa9E[e@&=VEVM]6OT,.
0Z6d_IPK,[C#WIR6=AK&(XSEA2B[^SB+4I7+<?9[\6e)@?AE^C+B8YQV(#WbPPcX
)a\bgQSU^c58@7b^bc0W\1Bd7c1EeMd?C)a1>V:\Z&,B&[4]8]9P-;KeAA+3^/;E
,d+f_aSA)EF&e>#5)4bJb8I8ZRf<&@MQb0X1/<c,><Xe#GMS0/IdFc&?4#S5geI.
(E6.06K4G8-#LVB(EH0<W.1g_e]W3Ta37-/Rc33Ra;^3RU5\T5:AQJffF3D9VB_Z
G4JXH2E#:1ZH.EUHgbV1A,&=F_Nb-S7b/RXC<)abZHRQIJ?/N(I&S(AJ=9LV^?)9
PTUNQ@YYT8Va0NVJeL67/Gg1fU9OIG8cEZ4geJD5IFMg-YDJ5R[&PLH+R]=UA?UO
=+,#J2f9Xa]:#Z)<<;.8G1R?/]VWEPf8]#B\3^6)V57]1DUT@fcDU:CXOa)5<J\I
FBgC\\c4N+ZGDI.:SLWESJ)]<P^)FV):21-eG,6^;@IXV>DB;2;K]Hd6YWf-2-=-
Ie;&P1=[<IeZG:F:fPC<@=(9_FdN.0T#AI&ReMLQdf>UEg>Y3)]4f5[/L5.Df-Ya
H:&K#<1R=dC?Y(@D-cHD4SX]]HMPY_ZgTP[eVB,2RN);]c8ZHE@=NL8K,RHT>>K1
6]U2L^2f_;<65_M_?&DaUAND(Qg:S3Y&<U:JadDAT;J5J]E_+b3R<:0Ad?4:2JFR
2-:?FLH<=fCQ98]Ja\+C_@>,adNMS(DOWU_QA/0-Vf<fHAf9f^3I\6L8gVR//EN@
dT3\.FB70>PT?PKA=LFA3O>PA^9:_K\L<gAC#Q;aEJ)[SS9&)JQd=>5ZXb7][_8G
eGIdI;OR;/=M9)ZS9FH>cEBX9ZZ:H@,Yc=):<V+afe^4)8B][NaT)7OJD&b/KaK0
U];)ReP[1-CJVVF_-.#UXZK9W#,-96P2:aZ:X0_.6f\661DR_,SS..2U=4Q78\+H
SBXZeT=9Tb9AY<T\Kg-U^PJTY<:M<gRPIDSQTQeU6?FX6MbeI1BZ]B&<@M2O#1N7
&f6^+Jf@Q-QGOWZ9QaB;Gf4#,00VdH]GEHOU1:b^__J<fU:UJ8fIRe3CPX66WR+Q
=Og5:Tg?e[;KO];GUAX8Hg[<W6D.bK1@^_G)fB:4-8L<ADIAH?-R(a-G.<VA7Y\V
?L.>gU>XbZ2g2=4@J(Z5RRODG7NK,?,4)Zc?6CC\ZA-5U;C)@L8C&K8Z8\3M2(\E
13U6;75Q\<6W]\E>]??ba.E^F7gPP>DXGDd0,9^;F+R5<fTK4ZIA2J=/1]7QcV<S
^8#V@[8S6;eYe6HbN+T#RT39PGQeaQ?0BX)?:?Z05HL,62AEI^1C5VIA<.@GVb>A
8FD>XY>EK\8AYH4+W.)7ZF0X9.]8TZWB1>6UTD:^,.,AQf-/EaBPDY22+V.8:Vc=
P-bV;058LU]Q632]#,Pa<@c[/SZCbQ2B9E-V+<TW-1&9Q?6.W;BQ&@#J8-/_/(e3
2/:/&bdRGSW@NGN)Y64\O,L9)-&HKPWJd0H3BG6c?D09<^cN9UANK?.&]?;U\d,_
+VA-I>eGI&8W[@Y.?=)ZWM17I7XM[7)5d,<YM)^c<=SC;JGWAQ:GN\]((T/WQc@\
59-8a1LEK-DXNbg^W-^3>P&NF\LU893ca]7-=E#MDV<5N4Dd2IV_Xa;Q8:<=ENI[
0<3Z>Q9A1US)T_4+@eI?9KI@5a?KfC4,bEgS.MZ<QS9J.NW:/.0H:#BM;fLZ112G
a>[&A\OfEAfY4E-387#aD09PTJ>]LOR\9D@Z@g[TZDM:4PUePgX#])R4QZgZ^NBK
e4A,:SS^UM<g[?-YR#BJ,bBT[Yf:(;Y[++VILEA+5<+#3?Y)6cUb)C;U^=eSZ0K.
gP^:2O+H))TDO3KFOJZXL+>.>,T?^#7/Ifefd7VW<0LL.g)P:d22/fD9d5CRHO.:
>-F.a,#+R-O:J9f(&]Q(SD0OQWK@&BZI_M]KIA<eMLfF=Sb=GLC+VVL6@HP,,gaT
3?:<UFgPOOKD+J[d<T_?(\ZEfXC1#:2?EZ[T3J_-@\_V,a(Rd5Q7(&D;R]eFA1&U
F-bZ>#[ZcL57T02BD4JG=V6+>-\)I7D_aN953&:HX><Hbf@+\=V=8M=Vb:0a:&TB
Q8+_#3TC^O(U#A:BgcSbaMf/1+>0FY)TBgbGXfA?WXC#ND_=?HYO@<4-aYLD\I?-
d]K/b-d1)Ggg#4#fQ4QN+Gd56ANB]/T[>^T8?^Vb,RcRDfeUMaHC3L4>-Z.\I)#V
fM-7L5SgIN),3I-PC^8@@4HSQ.6L_RIL0#12\&3dAbfV2b-<;E[W2T\XLWM8a<SA
)IbaM<6<^-a]Rf?SH26Zc4S@^PZbZCC(2@?VML[JZ->O^<b?FH?P^2ICT-MZT@Wf
&:6NDFVQ=TX11>(KR&Q_ZMC&DEe@Y2C2;]J4BF/)V4.g.5M&B95(b,V/I)TX8Ze[
Xc58Ld<@O03I,&4@GL,f2GOV;WJC7?>Xe(I48Jbe\::7BH<\X(3]JW7>(Qf(11<U
+6I,f6YQ+b;cfXDe]0YJE3S,DUN0>E(@HZV]?^H^[GD+bBcN?d=@0,0fV?Z5]P-/
NBdF&D656<-/KWY&.YdPY=2HTE4L9MaV&BQQ(A07f:8ScP@=08C4e5(b@6\QPd^4
cA(:0>4PAZ=3P#(^\1)[W41]AYKRUJO9[Jf_9B8D)T:QZBR.a8B\d=Vge]B+:<ge
JAORUa4CFB5Z:5<B\IE6A69P@GZe_SAKV@CaffZ>CSW^):8O1\0UHa#=fJ5Ob1U2
U_^K^G^H(O:FJcb4bP7eEOA^AX5H9aFYYDg0)[X)FVMG):PC,f0?f)G>RTF;V=)7
3.(PW#ga[TO/<ad@@XLAXVYW.#/@&e2\@/?5GZ7^,,PJC^;K+1SW6L,c/@(.6>W<
gEIPBJ^S0R@]77G-cR]SL+RHPJ>6C21,.L8&Ge_4eACT-?+-8J3UW\U4:eC^;HNB
\2;L,P/@VVD-O9S_BNgWeNd,ZfZ=f1dT=.bZ7E7A44J\+XfU1f)/QP3.&/Z0=;.F
X@].2KP.-1><a@/T6[:DEM8AN>MMK0+fDF]Md[NKCJF18;E,H&Ge;ELa[e,=^O]Y
e4Y1XVI(D<AU-g42SMZ_>F4W;>T)=c=F<<cG3-.YD(4Z&gdXP)6J2&NR4bgG;NDQ
2X&PM:II2Z_\D0dcC6GU#SdAe#X]48J2=[C7YJcC:\+DV\QJ=[,M()L[/8e+B^#)
30NF2MVSSHG2A7IJAT-O^<39]&9fH5D,[_gV^+I+W.O]73@0-/K@3d<e#Z4DdKa(
(db<)X_Qa4BMaN?VV1V-<PJB8SP^5\XC@aMRJ;/UIA+WXIb/DIa^^8@K;H7^U<[F
Me#XIBMV0IW0HAFR3#DR\#O:MU2c\7bL5XdTb=^.S+(+K#@JJ:D]3UI>E+<N#[?3
GW&C9b\_:O2<>LW/Y.NC)A+<H.F++)A9;,#)TgG^;[&UF@+#O-_cB9.A/Q\?):.Y
2+F()f73<(>CCMQ?ABEG?7J6\42J)CMM,gg\G[caab(6#.)a8VQQI@&,8XX/H<?8
U\#00a3#K83;L#^3Q#DZ^XW>YRBf+C8/JeEeGO2S5&EHCRf13R^PIAUCCPXFA2R5
[AFZ-e,Cd9\1>e<DT:I?a+RDTNCG<ZLeNL3GV:)&QP:Xe@GFOe/7(RaM5.2#JNI?
YFJ5F3,K>1HDc?O2<GTK9V-QOHac+FZPL5AX<NR><(KNSfS4R7=#NL,CHFG(e6^U
17&Re,Z.]&G+KAYgM4M^Pf)RX?G5P5>g^MVc,b0@F9;AaT-IM==/BXTb+Tc)8f)1
7df7g<Z#@VW[2>SBBK4H7I[PIb7a<8OcZ3SS0K^G[0_g/F<2ZGf5eM3T,P;P]Z@T
UYRe)BgbX&Lc,JHP&J7B2C<7G>)3QGX2^&XbOT)Rd<]M8M>WE/QX,=.cgL(PKX/a
\,QeA.GQNXZS^=9Re1aR)JG&HN+.W__2ROAN9/TW1;E0N;UGK,=1Bf/56BgZ6\a/
V<5R?G&5cM1BLDeI.4RSBF&67O]Q,9CK;[#e;N+/?)A[(D/X+Wf\D9Y_D9,egJEF
6eO9GDPe/XX/OR#]1LbQ_)f:KG.7:TJRFB=IAI^:cZ]=a[]AB>,:IJ?2;-2/R>QW
d0L\9]Ld7aZ7eF.FeQ>@L]T:Q@PB,;#>K0/LG_\ADcGf\BUG.:PK=)@\D&@.T^:N
:<61UU#EEffN_H;1A-TX>/1]=_^T<;UQV-]^-:L5485][=<F9?#c4(00cL7;X9ZW
P358J0E^Aad/Z=W(B:/HD;Qe\gbe>[\@UgGM2@c_<MZ-W+NaO>ff;(Z+;1[<GS:@
&^[=e31+ggB2g[,)d&Z)7+@T@]W=VeN_0G\Hc?CU1N[3VD-OO)5NEg>NdS-b,d(;
,42\>:eY<DU9\T6[O5\RfCdXLb;]+3[[2Ab?MY&BAIUO.6=IXJceQHF_:UPL:Y=G
Nd>9T]a<4+,[.227]&V(V2cP:Q.2=,8BBEB5JCgaJY&:B<O,[I3>9F0K)@\0e=gL
P/]dPHIU.<:\G<PeMbD_Q-Rd6-^[dHH#@2GABDBe-gIJ2@dA]P3##:gQd:UO5BSD
^a/#O97AV_&2&#_U-8^P6&V\))D5APK;99SJ4Wd?;LB6b/<^+?I\0Gf?\#^BR+TW
WNJS(?/L0;[L]?cD42V.?OdT.[S7E0=ROa.OS05?1H).=AS1MFS,X8_D<QOHL203
T[]._Z<_39YF33d0V&M2aFN:T42<d,3Yb@.M_7),RRM^CT4U07<76;e]4PN5DK[<
eLJH_X&\gF;ATO,O+,XN4.Q=_gCYFU0/\/R?[@c4\@Y2HMa?@#?=fA^/1gM(3d4=
>H82&QXMIU8.fI7852L&;XVUfdGSU\bF.?>YUb&]egaULG0f_>01OJ<#M1RN5Wc^
_IR3XW7>MEZMgGZ?P2eXA7ZX0;ZEEgFEXN_:-De31Z#/]RN&1eX93:/H5-QETd/e
BHJacB_+b;[LP;c(c>1?/WOSU5H,2)4eaD[,/4NaF<(Q1(9BB\,8gR>gfI4R.6\>
?A\>W<6\DIIG.Nf;4:f/5<Q,E)Y6aEY<aO/\]]2&J[N5cM5WJN/>ISC4c+9GY[(B
&U42UXD,@04;3@AFeB;A.3KJR5/[_,=Mb5447RM8<SSRf6(W_Zc5/?8DX2:O^</W
Gd11EW?HM_7Q@-?-@Q7M5J1WBaU:B[=-U^)&_cfX=W-1Bg^8?J?HQT.VV&OMG+E:
5->A&[5JQb>47]/b[,JRB3T1eMNFOXD8ZCb..dZLACT2B>Ue6N8>P3O-\7Ie@O92
_Q@4=CE\CQK]>L?7GGI5f4V^@=]5?b63,]NG:a:#,5]PDaSUI+?L7.LL]Z,=f;3F
A\Gb.#XD2LD<2c:QZ&TV2@U7NTA6<)>dY).\C,P\c&Z(dET^AWaTbe1+LM3+F,)P
.YM1f;UbL>&/G;WHfa8BVWM>3OVA#.0gf;1;:EX,]),&E-<T:S&#dM7TdNYY=_Va
4594;@R:^<K9B0c],:Uf&2EJ\a<M+1W^B8f=Cf:T#0+N;E(-R[SR=gU-4+ZY<d)>
R1Ha8?.[O-DN@fF3WdU?dKJ>\>@R/V)_[9g<B>a=6=f,SNCCL+]WSY([]d?)EVL,
cGMK,9-M5WY6]H+YQ3?T7gFbd_S?a[3-bHOfd?GM5g4?;W+?TRR):gTDcJI5WDY6
[&1,>/1#1FZGb3:I@gH<KOb.KO+TU2921+3G:LFd88T@3O2gSJ5UTJ<f[]]4MV/P
.X?U8D0KQ,=/[ML/6_1PI_431:I9C4>bLECLBA9&ZS8]JH&PLYH2LK9.<1cG8F,:
B>D<3Z8I;+9?Hd>?0/-0H3edN<H5.1NP3#/fbU48KSP534T=6]S,(?.a6gb(?b8:
<dL+XRBY00?Z&<9+U+\WAUF[0a:-g#Z,JT]&-\AadX-#5&=;7a[Hf]>LRAWD;(6-
2gddRI9T(@=f7OI-.<;8.=fbH1^J0bJWDR]#f6?J<2[_ROc5YE&\;2-SbKWYPd5)
^L36S):,M7gV4+O\UHVEa2G\DAdIXA-W@SU067?6+@8[^cL;SG7;\(c,BCX4:D6Z
96)BEHR)GSNOgae\CFW21@^bV7HSbI:K1>4>[1D.2U,U>Qe5\B9Tg0R2<0,JJI6O
gaIO/KC[HBfXP8?7])d/_@)/XfZ=M/O+X_O3?T>YKJ/@^;FPS#LV)@G&2g(7T?VI
Q5K9+OUHaD:gfV3:e=GS3>&)KQZ-f??H,N5aQ_T]c5INMZ.&8B1KEf]Jgb6aEdF<
Rc&,/gHeZ\8X?AAKC3V41F?ORZZeOTg8R+M/Zf^O.M?]Vb,H---6PFFT\LA:/8M1
RF]abgUNF]-eQJ-gBf+2.B;VL\gRRV_LN,1E0=/^H-:G:F/W0ce]W32+cNO/+fd/
L-?a9-]->aG#G.FeE[WDLVAH@@;C-8cW#e79KE^e,?M=W\fI#Mc?AcK^#(BSM][9
=G>X-a)6?=9PTOZ=ATAAX:](0O_aa4)3860<X._a-QE<\eTH[]07MSH(W^8VOD=Q
JXMY?B;c?J<#WOTB7D,52FQY(/]U-MQD7>)BXNP,\>(Z#_QDTR66gKabaI)e\PAR
gV>[KAJ/0W3\M27cZ,6a_M+g(QE&^7AOI6Ef,Q?K#4ZRWU1A3@PIc^=?LeH[Bb=e
g5Y?M/.cGO&/N(OT8N-(,.a(Y&Tf5[1SP#1W7XbPf?8-[)g1F30LZ+M.dXbE@HcZ
Ba,/?(_dCX52]1V-TU;fcUKLOdgLfJ^RNZeWM_Z/9:/QZ;;]LS+00)PUYQLbFQU6
X6D:B[9#Ka8BbHdZ(ca)<VTSfaebaTZT<1)9N:JP(ON4/3?dR]A_e9d&Z(I@J?3A
8Id_cP@g[2NB(<,5COTAF[K)=b=X:;OAOI4DUI06C.@ZS#MMPN#E_JU2[a7K@G8\
7bUM:6gST-=4YI)XDF@V)NP&IV1-HNO9O0=BK(Ba^I9@PV7/(B(Xf0Hd;<+@4X9)
]Z1g]RXJf<e5Z[B]+&ffT=8K.4f.OUcSA3/cQD#?#RFRWU#PF#8O&P1A(0\Kf.T4
.Rg@;9S;R2;\Q1[L#bD9f\5BaAGE]BadQ5e3:/Z+#W8K\E\STbLK)W@HA1,B@]A(
Oe=JWcN@R4b2b3P&\ZPg;AI0-X(bX4.C5-B><TeQ/;W^HAPda^Qd4\^;;Ie?/Oc/
5[9IA-O(AM<\[<-PaTAO]=6W7F7U7cg;0NP29ARaP-.V1Z[GEO;TN.3B.H7bGY(E
H8UeSZY<.@..SgC]EB,_Y:+.7[-cEcH+>T-<F/I1/M,?#=KW6S\2CUcE]LG6(7Ld
W0&6KNQ7/O7CbK/>8+f_cA=bQVEO0TcGAZ4,dEK192:T)A<d,MV/K6_d6NdL#GJC
];94a>](f@[W61),F;a&X5Z?NRaFCgPJ9\Xe(;BMcX\Eg3LF;:;-4A[>K:)1X:?3
;O4Xf?O([+9f4QM/MSN-cCTTZfPE1e@IdX7:)J+EOV2I34@GZ_.Y5P7f^2QNdTHA
:VTdRB_7^FFeW],S+:ND7X.gG[I(SHMWN7PC7;0S]=<a:C6:PaFFDZ6A4aAaU#+K
I8_.4Df5VCL[B_CeaK4/O6[EC_Y\.T^_a:4YS+#^#>4]/?<+AKI\9X5a-=>5D\O2
B<8d9.L;XAcP1BJGEb-(3MHULPcPI:N&4?3dNbJ\W[TU9R3\X])g&Z\B(#TS)dEV
.g6P6.XV-@?TU]950L<L;6;@5W<>^T3O.KHQN1;7>_.C)g<f-4;TeHc\<=5=gV)9
>LS49,?c_7LF]@O25J4DWISE)gO\]V^1Gc4Pc)HPZ_+fPKgdbDTW92Cg#aV4W&DA
K+<OZ@?1d_SR[(O,J,IZ<]+Ac6W/1I6eXJ0Zaf?eH0c##=1@RR>X23=bB8L4<[L+
/+P6aIdJb-Fa;d8OBOgRe/O#.(=+bcCbNbCER8>.Hg4MV(/gcecQNUUg^\TSM,C_
0[d^0G5-MM1aaMdRZ2]eS(0-IWR6QDJJd#FB\[3H9+W(.KWS3MALa5)_+cHHX+Y5
c:B_CCNH;YRf0U2S@Rb_=bL#5V63I:/>K3-.=])R04QfFR<,+U:&?0d[H32H8]Xg
&&;F&]R.5-]a/8X?>^9)0#2]4^3-MXS72=I=VTHB>H5JNQ16CJOcbD[B#20WU^4]
<]8?#L_C9GLc;M<Mb:G.+cA1H=^OY7SY16bV2]K^>]TaO3SZ)[R?@b5U8_7fC.76
VL\[GeT.&cFLM88,L<V(<M#1NJ3APMd1QAROO<,>aDC7)QCe+E(26A1S?B]JW^=?
&Z&)DPR3N<<):Kbg5Q1Ff=SWI6K>6]_X;_4H4dC)+UCaGN6+deWW.-@#ACQY7>?^
>ACT@6[@UDdYQL=IZYFSbS:,;2e[MPe],O_(AS<e(VFR/DE_3/U84_&\J,B(:.[.
6)^IN:TC(-[=<=BU/YO58_;gOE&MV8HAJ/YU5;BX#7A9X67JYHMMQ4&,0JCF\@-W
?SgCg.6SQ^(McV=W,K5GX3\_&CgLIVX6+O#;]QTK@+GMF/OSOBDfX>(.34E<XE,=
N3E5)Fd1EX@,?,@(BTI86\^e@fY@.KT,TRN/-faB(QOMK<B9O0JEVTdWYZM(OK\&
^@)EEKK:W7@6SFNN=#+>,-M[/E/2OD?(.Pd:ON&4N1CCT2.O,#_)-Va6(99Q9S9X
N(53Ga\XcFd7^GS;M(,2+g6_ab,SF8XG^.MPN9/0J2\#WQ.Bg\Q4#(7:0B.^9-1V
/D+f2<N)fa=RCfZf1+:c318#RY^@7@K?/,>U6-[4;d_bR8&\10^MF7bAF;(^J#:&
X8R+YRb5Mc20?ddJV)ERDW8gPE6HdgQe]7:X14].H?N0=>-1g(=1_gW-2VRXab#L
Q\+59?K]>J4SJM4^c2@JaJ7PQOHE:LE8POHD400T7:9K>/#U]30S>gYf]Sg^Tg_K
\<&OGBA;I<S&N736K.W^gAV>M#E9]I4X\@2g^28T:D[PEMOc;NZBA_BE[7,CVB(1
bA((gTBD>ECB)Sa5MVJ>aMU\.A8ND2e,<X<)P[]-3=Vc5[>ZH3G-&Fb28OVJe7JL
>DfU2Xd\.I_S(MJPcN&N9DE>-<cA/&<<D<.EeM4]Db=;[-Y1B?S,eL1dWAK&/&.e
=^G-,V4=;MJ60\5>G=TF7^K.>cMaaKF<_#]9-X5&HB-=c=39eF67A#cR]K)MGS;Y
FF;8X)3^eH0&);,,g6N7;9bY6Xf6Ye31Kf#];_)dK_SEV#RC<<9?PG#HHV#c7af^
QROY.\3KXJ-cSHg17CF=W5STK3GB8RKU[;>g3R^O)R#R_+IPO.D6:LV7b8>30-FB
Y5YEf2cC/XX3O^;YY\L/V\5S2GgWJAVB1Q=T5]44UQ761AW]/7H0D^X.,aDeJD+6
@=[)E1VR[<]T3.P5.=c2a.PDe?Q4F@5;+<LX)WHM6X)GD)8YcDR]OEf0TD.5DN]K
>J4AOBVVb?70O(92V#.;b/346(02ZZ6GYS;DV[.:&(^8cCf=VOTEEHQRQD=_geNJ
+8U:.#abTJF_HZI+PH+IDN;_V0\0&9Ada88gTS&7UP:WJVdTF#D5.,<=>Na?VB-G
K@IAfO#-2MUM:VI?e[e/[TUP_Y5Jg[e^=DRc:AZ9MA[6Q1PYQ;I6.K#(#&Z?UR:b
XANABGL-E;X>EKS4\=8d.a/,=C-KG>XBRF6[M8O4,b,PR/?02F&O7_IM=Bf-ZH22
DY1&[Jd:(gDLDBZ0OaB-d1O-9ESLEJV4VBSGV]1A:>R?ga.<,H??X]=,-Wg_f<10
R?Z5[,I6>?<QC2F,EC6RMaTQ;-\IAM&W/L\b#1bPdU&T(0;aJ_JF&d:WVL<?V&Z0
dB5YLgJX;.1cLcWL8CgYH,;JJ.0++NTc5QX#/VPVB7+WJFacH=B5\c:a<T&GHLNK
#.<B2=F=;4XP/\(<.#C],#QL735g(=\7G(F5\Q\)#6WHK:MDe+?b]dS2Y[P^U/N(
IQ^18U@[Xf1:b:0N:3/LZX08aO6(&ZReYIO4N4SL\5W/QH_6f0FR&e#&H43:DAf>
9)C/H&.eB-V/-.:2.7BZCMXBdW\WOH4f.)&D0(/FZS7/5E#?HL48a_N+2c)3:WO6
?>&9DA8^:6D[f87(8/)-UC#SG+Ne/3c&:+A-T7.&;0;]=+4a?K/O+8\fC,D66>&?
T=2UOD)6Gc?f2b?=#<G\M=59V(8T^:I@@1BQg5=U3Q6L(D\6CA1/()OI.d1GBJF@
;WSS-1H^&IBDKWB5)8\1)P@OGL<^3EJ8eKB48X3PME(W+d0P]):\W6QbUZ.6<2:T
b/DU?.N#3I.4)=bW9OK:.dPXZC(+;LINId9C[JX3eJ6C:>Z;5SB&9L+8:]Y(+;,>
5.EI]aQJ4L0>XeVB-AV<f?92,0)#aa,@Raf?BB.d(/0/7b8:6;[E7:YO7eT_<W0+
))27F?QKZJX..gT\C)_VEW3Gd1I<2cQ<e,=g.?+C-#0N__,2.MGSOF)Ff8@aY-)F
27c/O;WU0;_cLeR7=-KDR]dL=Mbb@@W5;BfF96HMIWR]Jf(_+[AO41-E;+QTaBY5
d-[9Y<BdObZKBQH4#e;Y?Wg;+aZL+HaM+QJf;VX_+eFHCW\]@_H9#[6LSBK.b-Yg
gVag4YV^2e;#g/##,G7>e?EWR-_Xdf>+/MO2X)>gacUS->YPM-;U3)?,XM[aBRbZ
.WU([?@7^]JV;=7[;I#M/H_HN/<^e/810WcIKVWPB4^JAFY2DKg[M[;S/#]GP<?>
5dA,cKMf7=/)aO:gSdCfKXV@#&-2>DE)6D#g<?TgQ]2d^MYKeb,^2N?I+U-Xce>A
-,&<dWOR0.G^+#:B4VZYc_(fP3+0Z@(__X[c13.8<10-M\7<=M-OBI9f(c>a-]H&
V3H_C9R3.6dGVWI6]R8g>(SfY6HbTNX<GEZcVF/cWe5PGNI)ENOXg@M4]Kb3LHU=
SG&^:^V?EZ);:-B)+gO.bAQbJfc7D_f^2+g7)@PBHK:c2R(f5edLZfbccU?JecBJ
1#3C#)D>3Q\EGg2V5:N1Z+>-FcWGHNJRgO8;5EY-5?N1DY5)\1B=G]\/T=S5VZR@
U3]/6S\H-fW<,BA^<U0Q-O0_WUXUUJ0-5Ccg9e\J+?3V\b_g-beRPEHGBBPNf[\A
MNIK#(Y2]4LZ16#M:FOd289XAc<6_^=R_W1YfaJ;YJJBf&9\b<3#DNQ&M[))3(/I
f[CbP5aLE_][6,@A&ad/:S1DZ,>a:=^PK:c+HV&-TZ:aUDH<634A;DJd6N:H]NAS
dVRL(^HE9+U)=7^f=4d=]M2(+AJ;=]>2.&5b94f#OP3EF>D:aEd)&PRNGYc-[43e
aYeLg#bOBJK+2DILc<R-O+)@D0X]GP+f&=a+FEd<_CIRG0gBC)5gWF+2c94FeaJe
0:)V=_?HeCKTP,J&<D,VVHE.<Tff#YYV_OT)#M7^WgRV.?MIG7L;7aRa\6,YTJbE
1)\0A.O69-cQ)9DVP/OPW4C7D/F<Z0W+L4?\QVLZ\1QZ:?I#gdQ@,U--PbW=P^4(
.H199>7;)X+agEecLK>G13Oe:>8RA>2]f2dD#K#XE1XSUMeS1[9C/dYe&e.TYCd-
[Ag7F.S5Q94>5JQVQ^9ZD:G7/QW9&#dR#Xf\FSgO4IJMR-FUP:Mfb29YYH1-<S/^
[Wf7RKbGL@MP&)O3.b@EgAR?>R8WZ4Ec&S0]0TQB753U?E>_5[<5\6BOJWZ0^_gM
(86,6Pb4[/H4_b]g9AH6N1MTWTgF;,?e:,?V\g]O(CbO[<T./WMHZAfcQdK6L>._
g=M(<;-?4,CE<f=g7UO)U=[J1Z^^=3L_:\J^.YJbDC#^F>g_CA/L4,16GQGK)#J9
P<B]]3=3U/dGIgC<QUe-.]_1I9U=LQ7@R7R;_+.BINFUTW+DMF9?J3NU(L/76J[c
((1b4L5RDNc\ZDg?#9+b3]592ad&;L;Cf0+@6abR#>BSf1EGCAWe<(_Y1=?R\;1G
[1_CEF,0)DLK>&OIWeF9L.,)+@G6T:3Pf)b9+(00MG;>bP;GdaO=F4A+/MY8P1#M
C)DC&.<2A])LY]>1C2YXBHY+P^U8V0f/AS.\9b[TA7/)4V5dII=1Jd[HdfQN8..^
d^Z^<5\,&WdcUY:3&N967^4N)A&Q&37T\3cb.443MLa+?3ZKX<^Q04.b79,2aFDF
2HO?Dg<6e\d8dF0]U_H=0:>ENECE;Y2;1BG]?V=TL7AaOY\UF^d^1f:9P)CBAE2>
#J0BfA\NS[A)/Wg>.eZ2g71JSf//S8Kd8c]DaH^Q?d?RV+_L0M=+8.J0I0FMUaQ&
F=/>bIB6\/-E_>^ARHBU>6(PLNV]g<=f#KdHeQA3gON<_#>:>MD<6<_RVAK&,+6G
>I.#_gU6V#NcYQ?_^eO6#LA9,P8aS?>V/U]S2ac0B(YK12e7X,CVdRSZSH:L^C:9
A^L1N4E^IBB@<[SPDR=b;3+W\C_B(R3^4bZ^_JSE6.HfC<C<BXX+&1A_J]V)I^_B
?,@E6TXa0JDgP4(e91I_C\2>-=KPD_TV)U17)\\OY.[.P+ECe]NX6^Be]BE(9BLc
J2?)+0E69:(Cd&;^+X@4)11R]a3TM&<PT:dFZQ9KfNC9H1:.A.038FTc3g]1W]Q_
R1UHc>YZ/I0Q&DgWPD)Q5gH?7R?Y8EYZ_;MW5d^>EGG1?I#72ZaUL+KOS:c;_?6Q
,@+g3I?>@(1&KOY>\)c@4HVdg:23V(4L_H94e)IcNAH3.K?.cA(;@HM0:9Z6?P<K
G0/;=NOJEOE0MEAK<a<C:eg__9fT)A:U-0R#RLA=KaebWP/L2OY8\I4^(WEf\@,Y
fRWfM)1+DC#JWdbef\Hef=K(B?#ba;e/)e2YSg05GOI1c5_RVG^LN[H+07a>=51<
>WG#B1<<D;eSX3<+=bK)8Y,dcX.>F0Bd;F+P<&W@B_9Y(S(8);)YL<,YST:JH\2-
C?)1EMI<9DJ,c5Tb+VW+LGMdM)-FFMYWFH>cVZ5758O^;O=XP6N<21I:F<GUUIP8
.8(SgW;HN=MC=@JeJ2YD4QCC6P5:c#&0_<1B62#a<L)aeJ<gTF.;@fWJ\&[K87,G
1?2a7Z18C8=(]]I#3F75T.d.R^;bH/?c7b:170OLWI4/(0a>O0d/U;C^]&;WYW+a
U>E905.AYE.^BP06RcDY\I,.Cb7/2c]7>[?c_c1^8-NNWH2.PTOA27J?]<A>I<J9
be&cP.#4<JRVB]H89QAHdD5ED/+O^=PVZA_US5I#4gA\-1;::Cbaae6;G[-]JV9M
IdWb3fK@?ZY9cSF9AcY<@^bKGgf9<Kbb-Y[/#J-3)^^)0=C54g?.4B+EQ<N[O&?N
Q6gU#@LXY&,PY-_(#dTZPE:GM2^6[702VTFP]0&c>];3BS@D[,BYYH.\[?acQ,fG
4[T23O8R>AZA1X@IbN;D(BG6>_;6.B\ac7g&bF8?J-4TFe=FWd:ECc48HEHV/2B_
AD2Dd>Y.SM+-dce>;S>c;G4S[V\5aB+[+/X6(1DSIQIYa5<fC?9()FP2Z62N80Q+
0BSQM#e-,?,[@5&19-K0Rf<V8N,TfPYXUDF.CT=gfRO5bC4IH>8^#PJJU1N5f8Ce
1_8cK)#]#W4OK88eReZ9V8g2;L;M?FWX.e4b(T-501#@>A,_4<AbTe285GGf-2C4
\I?90UWX@e?Pd)1]F;737>(KfW_3gT9c<(g2bT13<QN(P&E>Z0NM0F70KU7DB@6D
)Qa]JJaY4&=W<Ga3THf_L^XJO<1<8TJbEPbeJbA2bXXBPIK#8g,M#\TI>#:U(8cf
N:XTZg+ZV)NR05>&=<VfaeF+(_WM>TE/BC#;S[JJS<O9W#>Ccd+=OV\+4N[?EPg,
3[5Bc^,^2KKU]CbWQ0RNU(A(a-V7)._H135)MZ_6Hb+O5>8Ta[07g<JadMF0g-NL
RL)/Ccg/acQE-2e2#AaTPYOXZT]KK8WNHc4O0Y6\D:JBQ2IMOZ2)Wf\T9JRNOX:3
C)]=@B>2g;>)8A_6+EU4,F?3?3/S:?KFFLMbP+8@M]cWL?ZSEe59P#Z3QSafe&gc
MQH.#<^/E-3M:O0A&&S2#H(-7REJTNf/e<,<2-eaFC+JBP;4ggfX73]@]A\92[Zb
4@JJISM7b-@:1K?[<.WdLO):98S.:8B]F7K/fN,E;X,,=D0Ld<5cH50a_WBXDEG1
fRc]48,e6,cFP0N1#1T_+gQI67,-?2Z<I?d#d7=WCB6(=?#1H9[DMQY2N1g89^RQ
J#/6,/7&M?f>Y/f@f@#42<8Og?I4^^Bf#R#;)CO4@dgK5=a[;KW]X69_:,^O?T;=
JV@WZU_,TV-.Q?KTfQWOMA\1/TE:O+,fGP1BUGbGa#M;+L=HOU32:>bF>8d.a\AG
.W7S#0\VI<QI<7fQ:^@(.4aFYI05]F9C@QgKS)d,W3Ia,a1EF](RUE#&4ZZd,]0+
NGBU?@V?+>]fJ+^KdI,d<eQ([P+L4LV:J.8M:7_-\4f[ST=QTTDWf^8/c<JIc@<4
LLGU^Z(RY#^BN0=.ce(GNB^EDNZ0]b:Ca)2N](X#DAK,98HVEDSJC=\IP/FdY7GA
4;Z/&I[RT-.gLaI,AR3a^V:)d/-.1T#7).#/]?c)J0a]07fEb)5KK77L\OVBO9LT
C4@U\Dd,9XW8(eOY2TEVEAL+.cge&aT/[^OL:D.aSY4WEVG390ZeLUZD<2G]Qc69
9^fg[fKL.6Y@=g4JPX?NCD[F^K-73&+ME#[9N7YLPf_[3???7>_EVZMV;fgWXA68
+WYE90be\)QSg_AE9D,@:EO#f/FZ9.#D9)ReSJX#TE^_[,RGacPO5_K_L8D-YPV0
ebRfb0a):ZW=d0,COCfD?eTRE/aOg6?_T]0HQYBWP;Q5A57F9(,K>+(U85fH32F)
2fJ9>YXeVTF492Eg<,E[g\8#&X@8)QST98I(5SOM).gbZJ_Cg9.^aa-,1F^D7Q<#
\T6(#=S.&VQD^dVGbf0MP+A^aegH,NX5E,_0Dc0=+c5+AOf7?[G4DQYRA3I.>7U#
=B+Z\7gPF1.>P8-XCIVD[[2dbQ:;ZMS<2Z@(1CC\JI.SM5BO_#>0.Qb2(&0>e1b)
-]L:[6KgPRP#d)O)ZB@/fUdFFA4gE7YP@82dFNg7=#W04UII,UYMKEJ@cC,Z#U#,
b:E5B@YC1I@U,+SW+)+\IE_A9\Z7fdJVY>BA,JCTAcI6R4G\VH<M&7P>N[fG)bTT
M:aX;ODaf72F:4M63;ZBC]L]SaYdI--N[<14:(35.KUA^DCGGQ<SYM_6.Kb+DGg>
W=Y4,]be/BFELQ+-#dX:(0MdY-+NX#a4T#7,X]VO(a_UG2(@VfX>7+XKH#>OXZDL
B/SF6@\2Tf5]8-Jba:;VNID^\)cZREa_(/bQ-ORD/LXbCI=<YQ4,IHL=.e=bGCTW
>+01_^L2^^:+65HZ0F/I9ZP[=KJ8FbK.F4gd#\:2?LJb>aPVf+5.BY-_#:TYUTV8
=<Y/33+.BC.+/$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_N25Q_SDR_AC_CONFIGURATION_SV
