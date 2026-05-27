
`ifndef GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25U device family.
 */
class svt_spi_flash_mx25u_ac_configuration extends svt_configuration;

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
   * Minimum Clock High pulse width duration.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock period/Highest Freq support.
   */ 
  real tCLK_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ Dual IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD Output command 
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Clock period/Highest Freq support for Fast READ QUAD IO DTR command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_DTR_ns[];

  /**
   * Minimum Clock period/Highest Freq support for AUTOBOOT 
   */ 
  real tCLK_AutoBoot_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mx25u_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25u_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25u_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25u_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25u_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25u_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25u_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
O_(>[EZJ;VHL>5(<IT_ATaS\PCF8d^7N?&]W=?+OH<LTZG[26ROS3)L8VR7/3,1Z
/TAV(]b=/.^#8B@09M0Dc6=,3XU@;:A\Z05<I]T:cY(5H8R9^OWOXOI5(C\>37fN
[EgI2fT#-E,NBI7b5ZgJ&QaN/)YT6]1E0(^;>ZV33QQ3(,EZLC-BDGHQYdW=Ye-g
-]/WAO]7<[Q(4e=d&=3AJNPZ)VCdKEb\0P]1V,.95O1_,:/E/^I/+Ic?)ee@.(3^
O\B+[;O2HaZ]58<dI45,H#CV#XP/gX9+(K4gV)EVJbLGea,CVZH[<&?_TM:(@5^6
:ZPUEPVd\J:)c=7RF>K\f6\0&WJ>=A,0EBWd5J6fUR8M#2D^V&a[I4#<[84NB4UI
TU?GOd\GQ8M,)9.[[BP&#V?85XH)&N]=8:P6?4f@N#J(A\T\a0)#c@P0_#-RBIR)
614]HLbGAe8g1<SNLX[eBcE\5AQb8a-^7&8#[-)>/,c,F#VfK@LLT,=AWSP?f#6T
U@^ND?bYRNe(@1;)g(+)]GW#e9W?_bA6_?A@J?V9LU8@+#VWW]T+5C4LME21-NM6
g=3Jb^2FVJ[C1/JBd.N<?K:J/.b\WDYY;+,T2&/S_&N\:1,P&L/S]+#UfY:DV<U\
?T7DNR9<EDH(H?0Ae6G=FQ--Ic1MU-X]Q?NU-d,594-#L.;.d>ZTQPYP/.NJ/2ZW
D/84aebd]]#Q\K]:STOZBfGM\=7I-.6FC3WgX</G0#c=RW;dbQ3d#2#)d=1-A88JU$
`endprotected


//vcs_vip_protect
`protected
?8PA\E]#MT6=#CZ@F&-,&Q6_Le(7<5>Z0F(&(M+2)?D#ZL/M?(e=/(-9bZ.?@_VL
SS1RFa,f^gG5QZHQ^1ZfLK.a547<d27c@d^eKJ=2AJ#1dQNKbHT:,G8KS@eL(UaT
f:R;P>FC1/HSM8BU<6UV0L8H8e&@7J/S&=:cJ3Y:>LGC69_>+?;\/R4Rd;-KX7cO
(JCM)L1(D.,;,2@f/S?c@f2YeX5VI2\QDJ(XEg+dUE955a^NRdIeJU=G\T[UK:/,
YW6c&SMe>?c-D2PG1&XZ2dX5+AdTd_Q(LLPV]W9dK[5cWg^Yef]X#^?=F3+U1+^-
&c:3Hc3g+K5]5TF22Sb^?1N,/,f)U-A2G5H=C>gYMP=>)KH8^XTO/^cfY)5(G9BV
0Jc5gHa-E?+-O\-N6V65192JIT,WN9>:SGDeK,@K(7A5E[1@-@fKN]9Q8XD(L2KB
R/d=<d\I]<4^E)6+Q?5;<ZgFf35FaCf36b2X-N<BDY+Y3P5@O<aXX)<\)OQF<8E4
((&6L1:f8W3H//INVEa@K(Aa+5=\0UI,&64&P6e4ceIF.;F_4IRT&5dV.f?(GX)E
T0R(#gR=_fNHN)dPOYaR(.KZOU(YG(AWTO:SgIHRa-,X@X<bR09U[2]7T1)?Y(?C
K(\^GGFSL8W6VQTP35(,aE[a3)=TfMRSZd72UH90KBac7SYDRbPB#g7E+YPX#B1I
U9Ae,SYUM#>D?69Q:HEXg)KK?.4E)P@DGe>b:J[1AC5I@ZN<&OW454E^5K1dC3ge
X447fQZ^6M4FIY()HMN>gQZM4CP@KO/&2I\19O/g3\^e9bfZ4#>T#G.A45[2U8.6
#CDNMU3KQI7;_7d#^]G:b..J->a&Ld>IK;A5L-Y=T1[]6D\)^NYZ7&b1;(DV/dX>
Hg8WTKF:(T\5Of.\ceK;@IZ9I?J+GG3>AD);#e?QQ6YZ6B(TM\;>SV,TM([;/aeJ
:2\@FI-GV\M7]3TRK(V+9d3bDdR4S(C^28OgKP69\bgd,MNgG92VUIHOUQ8_cMeC
3T?-@YB1ScXEf@MH(:f[9)(#9cePLI.@F(<)RUODH_=2TL7TPKE^J\NR2GZPI];1
TAdHO,5-X5[IJc)J;gEdT@WZ+SPO0fMVdP5.,c,_HB3?4T)Z5cKcBOZC)P\>(S)4
EVZUQe:V]H^=:A.C7G-PO<4HA>FG20:8=R3g^P/V7.W8U>EHNC72F1-),W^5NZ>@
L4e(TBg&V8CSEK;3Z9Z;(Cb6=Gd9.2&C=E+?L==26>D1=e1OfVeNZ#:ILHVP?_M5
D_L-47,KB7S[W+]P,3(;>;&B99PRZ0-d&g.EgP,5K[LH#CM:IXdV85)D[3-=)VPC
#T4R^]#;CDQZgHV0RDX0>&7f6dJCFKWSY+,,+D]491^5ceUO-A7R[0_1YOHF/7Yc
J/_ZW?+)2SS6,=Q_1f6>](X_-&>N,]^]BF7cQRgTD,_^6HP4Y39C@QK-f[WI<W8.
81+M&Wb3+=,8fZQD:]+<gcJ5:1Y7^A9HDVX\1D[R(c46CMRXG>IL58XL53YBHZ+&
)GN/4SVZYL-S=GdPMA8^Dd.>4d)Z@T]XK@aE.BV(U(3B>H:=VMb@I]3J_6F6>EgA
46+@0:[.Ua7VV-GG1[H(C@<KaY.2OUbN;X<Y[W(>F<&Af=aI8HSJdO<)Y0>TLM?M
=.MI@dKA^b2cSbI2;[]T=-VQ,(d6W83<)CX#\U\^CgXc6_-CU(P+NLeQf<QUBS0Q
2W64H\I_TRa[-0C2H_e^M=/_B,QMSXBIQ6NA7#cXXH<,Y/]WIbYCN\<,YH_Ea0G2
+<LY\@>S:61/V]^T>\3cD)e&1_@,V>fDHLXDP7ddBPED4-@5_R&JJW0B_]]E?g,S
7R8_UH#0\GE=2aB2Pd9eP/WVECM2YaU-V;FM1G)8:6LY:,#^4@FC]c;J3I:Y)H7Q
9SG,&C/Q2H.A^DL.Q_9LV+/P]FOAaOTg(Rc)\BZd).72?<VCPE:WaXW1.GgH1HbW
239Pge:0+TNfT-UF)XNUF]F9I^52HXV,+68F6=DYFUG5AJR09<D=bL=e+)^[\f/U
O91<4N3RQR4.GM/0_4AO+.<[14A5_7HGUB]eDbFY@R:UZ^H^+4:2ODE)#3e/SdU#
+GcR82g^G;:A#1(4/\BDEDP_JdZeTfUdAUSBe=CO<_M1T<Y_UgR]eWSb(c4O[6YI
BSM=Q]F2d[;QHZ^<.;.S+[ZcaCVYgS>JG[M]\6^@:bK_86A?V[&58C_^;KS1X,SZ
8\^[3MN+)4dY;6MWEg]\\H6gR7)2[YH6C:(6)\7K.UO]<MB-<e;_JVbN6ZNIN73c
_IDW7[/]#^OOJYVSaAYK7W<9]R&_A8Hb0/DE^6,)+P4^\T8aC[&N.3d1c+CF8L4(
RNaZP?=<dUTE;X+B(<.^&94YQ_NaW6E)=aKHa(f5BVME=E6U#)R=c&K+K02WR;9H
&.g5(TDY40UfGD-7I()IBAe9Ze,XfH6Y);<:F>F1C<R+0C]^X;H?BA^7X-5XJG,O
FZ#]IV<Z-EW9b@-5N+66F6:B736]HJV1KReDdeb\b3d#C+Z_b]]F9OZ;[DFRVD84
A]cg_@C[dWUUQK6cYN;\>G+7R)761T;N9?#EWX&J<0^MMVVKd&<VDPH<0d_:Z+K.
JI8X\YUAB.XTND@/RQ9KZL#)P4e(=dSVV#Ya68>AC\9Z90M;(L_Oc>GSC=LCeP2D
#V49KJ;Y]Xb.6B<_P0d]8>==10;GB<+EAd\>&L0Hb?_=.#BfKbHHdSf9TH(UKIfB
d3&V2(C#1PW&;B@5P[d_,L5U,=VAWX7@2aG[1DP^3Y2952MMfN)>U8Y.DM[?(0Z,
>WT.FbQYYH)cRGU[KTO[dN^HOEJFM9aOUIR2.8VU3K5ecLF:CC3X5AMDbcM_,-U@
c@Z^39J&KKL6TQ=+L(2BY^3T<NWS>PM_#=-=ee3OPVPK://Ab)c4__#.4Q16VN_9
Sf1(<I@O:P-[NYR\^;gAFgTW\A^:f8:ZB&7<UB^TIW0[FIL8dBA[Ef/_cc^O(:#3
a3PH6?D]RR;P<YUOgZff136O;R\?>>J.#U&Kc]a<2?.4_B(LS3W0);^.U#\QJ>PK
P:BV5W@=f;(9g=U=XCPY@E:_+^^.UHIdfL3#;UP;Nc#a9WSI.0=/2A[47Y2@3cJ(
@O4MbQJ2=/I.FD(#/T.(^;?8W5JWE1<Z#E\M/M2(N@e5QSTO^N@69RGI>-5UDC:1
->:S6YZNf5egA@dR04g.LLgVQV\#:0=:(Y>)1O^2e9]UAfDa@\)C>>A2e0OR89<c
040X0bJL12V?e3-P0;cRGP^17X>/;I:g\A@09_#3))d731<EW2?3]C[E;D1)QN47
gJ2#BTBA4c0[JUEX7dc_+e-(59YE85>:B;FR]RIR];G[CS.F#^OZgc/Z(30&f4=E
/Q40BfR.J]VEe[J8F>g0edHEWPS_W2L@.CA@8W:G,+ZBe]]F,363R2;0AaO(f_0R
3X^_A225^@(1K/44))aHHLTW5728>77O-E4B&#SO\2.]bOCd)JdXK8>+ZC]deE.d
JCbC[&M3FW]C9,(,aN<RM2FPFEL0<gLf1>8b-caN&;?G4C8OD0(7RGJ<WZ=WJ_\_
W=U\S&6&1FY.DJg#F\bF5LFU\[]Me1HBEGbJ,06=4#e]E)PaEMLbPa>O,:O1UD/@
)YM-\W,HZ(^X(P(gD[4.JK-9)g4=782?+Ea?AbAT@8V>TP=VJ(>_8b7DKJ\gWG+2
_AYIG,ET@M[?fEV?<I(;2acgBc=)g.,G[UO9/(,@-JC(^e8NaTbCXgL)?R_0<(5X
E<:\CXCKLF-QbRRT=3:P)><6VSM:.A2LLHN>a=U6H74XUCAM6W[M+&]74]^=0LPQ
PS>F.UTa,UICOPBebFUY)(cgb@D=DMCZ]D:H3)/PNc34U_SZ+Q@R4\056^@UgK@<
06?P;OIb^6B0/##:7=O&9\MI-)+WgAV((@2G4@A_\8?GbJ&@)/\D5VSX:)=?DI_0
78G.O4:H+16CdW_HeT4XQ[_=^S-X3R_6HRT4RZb?/R9R_>[_2M:c#7I^4fea0)1,
,KGdFIV91,T^R3bcSAZ9V;[-.aE0(R/@J/WIYb#);6_M8]=#WPXR\CO12=Vca&C0
b2=4K35O6)fR2:;/><T/Ob3\/<3@gLgPEO&ODNL)BZM67@Yg?d.:fXSK&/EW]@_Y
Nf)X)THZb^I)M_&U7OWR2W4UgDM9U_K^KTgRPb75)XFg9,[ZEdCe91OP\2dHUG@e
25I>S:XRU=[6K9SQ>]FIGK&)=2c8F&NIJJ(MXFKLLB^T8DLZ>J7#KC<G.d>d5UN,
8:U;W5C:RbC&Pa--+<L=C[7afd:.R0Y4YXcHG2HRf#?7;S2Fb\GC9?:^L7?.F]_N
)[JcRbO/LEX8(F,a<@U+?-bgGV,M6c&/^?B^55I4g.L9&PNGBeGd9GOVfS4YDM^A
=c;YF7>/2->PUOaZZQYAO-6DO.PbgCMR/5Me-]B.0/C,Y6NWb^X5P\WA7:DG1X]&
/7([#61NBVb49PJaELPNSE)>b8RK<25>)+WIf]44@1VZ>gYQQ#M2F?2BVT&g5ZCU
^2L)@8PgEPJ43SGI30>OU3GfCK1,6IMfPHC/We^82U+R+-cY\aJNM+5?)Ig]42.A
HD\F/8C128c1B0S#,P/IJJ0FEdWfM,e0RX+GU8[7B1KUTa/-[QD_F6+#bOA0IE#3
V2VF:-]@/S53TRI(^&O=EN;a0X_??3Ad)bN;4b#8(@J<g9e+W;YAbNOE3)?&2gB#
H#K#<>gB@R-LcNd^aBbS5]c:OT.J-b16,;aSf5),PXe,O)SWJ+dZ\W/YWC)aJ36S
609#_Qde&6#2BaJLP4K23d/&OIUcd[\3O5eC^M2<gT58d;[P\,\.[O7V5]4)/4S4
)ZM:;ARRgd^L#BXP<7.I\4V&5U363;IN88K8]a)2&UAB?Q8cN3.+Y+g_M9&>5B7S
f]1<WJ3P2_),&NGa=O[)dK;;BcIMf&=UcP\QH_e)U^-L<5+BQ(/GD,;SI&EDAY&U
&#J3X4L9-F/:Z#G5=FS;G:&PUIZ-DPW>WaY\]/3RfH83(,6Z\0\X[b#Y5fARSXb_
:7TDZcGIO4\,I^7<d.00,5#P)&W))THRPa9Q@eK>A16eW8CWf;-K,[>I\#,@J>1\
UG&UPcg7Z,aEBUSCK?+KAD=EU[e;-_/TLC+U]A]bf1aV^W@_9FHM)OgR+P&JHQWC
@:0>S2K@fLBY0RN=GC_LPPLa)XaE\,Wa6L)0#,<H6\X[6<Z<T\@8RC&0fc9NQ@L:
I-GR<&>PD6[4WCM:#45,6Q[Na]1?N+4SV2>f9?[;4BRHF_S=f33N.(G<;Og&1O6b
NBe42T09_URTM454Y.c=c=e5B19^cB,FWVW5G#G=XQdD1VP&a>19RL222)4#E5#7
8W:K50?:eL<[]+T4HCd&/OeP[/bb,DN_/Wf[ESfR</Y-2:eWD&[5JFI[_Qed#Z2@
B0U71-SMQN@8BVJDG/]UUFJZU&7YPH(-6BT,_?4g<I\&)SHb#eFQST/.)9R\MBN0
bFS;M47B4DR\CaM?7_bF-DVOSeCEJ@91[Z.R#\B,T:T1-8_[>8Gg8X2GSOCcDW/&
44VK28M^VPbef00,5YE;IS@;OSDe>FUKLV/LY24,#-<1b@Of)D2BX;Ff0LTc(g.\
<YG#@W.ggP\V9QbP^GfFR5g1XT/M&QF>[#1EA;Q3E>EIZ(7aTVADOQf.40ELX9R(
S?LFGf:_,g>)SFBR7NCAe2F-P\^F68\0>Lb+=>eC6X0)661[eVc99de:7Yga14)#
Y_02:,+(Nc.eAF?GF]6aX:4/eb>e?SAWEM@AWXT546),Tb[dTH2/U@O)>6=aY<8U
X&\DP:\)S;H]e\fQ.MQMWa#,SIf<A;:O],VXDV1b=V54@06YNge)0E/G90?PBB=I
G[^A?HQQ<;<W2S^\NK1S<82=#HNF?\]Z^U-X5MM,;3E_e7R0F<>\+5A+FX5:(IVE
)I)>U7MMC#_G&P+2B)@bK]LFR=IIa#d2dc]d;)K#:M=;]@4H;1gT(?DES,7g(L#9
VBXUgKJ]L97H>&9b^4CCa2A\RO(CP:EEKPBG2Z3XCZ-\0RVfT4Z?X&0:HJSd4CY8
F0L5e(FU<#[8UZ1/-Kd6C:C[6ILO&Y,RbRT\c6fW[+C1\QC^Ie+(dW4DK:D^c,&<
>eR3X@dA.d&]WWLA0;7IH#Y?Cc)/)MI#M)VHb-G78Q,F\&2SNE2@fG]:J)]U.^<]
]D#V:K0..1.-7@aD[\[A:aeP9:d0Hf<g?^))g@,g)HPCTVY7FFc#\-;g,WW2],[F
KcVdSNG>+4:F>X[7?]&2.\4@\#gA;/\G2QP0N[.a3@T0HJR2II/.&+P=9OSI_BGA
6eQed;a<B7,82RLd<=]=EHY=I7,:DD,=#FH?^b=0];QIT.C#/XL,LK&&OTZKR@S\
UHY7?:,6B9#:0,@\-W3IfY-E]@?R]\JM/[T]M,A=Pa+NfJPea95#_3LKDg+BRCae
NZQO>geN6:\[ed_S?8390@I;F/;O?=(eK\-^)O8B_?1I)-B2W<&(>[Pa#EP[(;RE
W^-5W-ZRXD@5MX;[D<1aWG/Z+&X2caY]9SN:6_&3eJIDb2EB;QN\9OH3M?R&IaWL
\B85U,I3eLDId:3<D(K\,\<&;9D.U)E^62WHZYE[H8=eCOEF^T)<<J/PU12,:\gO
EfOb,:O8?Ge/LMZD65+[+PXFNJ1^/2&<-UOL-,K/S_\)@KJb)(8SROePgaT^G_FT
BE=bK^])>g##+XV9N8_c<2.<0G,g2R\e>.aM;[gbRc31V4SfDc]O]dU?USa5c=\U
,gfbJG5VG1S_L:BQV<MBJ1L?YEY8Q5<XJ@HbKMe6TZEHRg@dD=MKQV6.->XXYS?I
,a\ETVRcXUc-0HE7CJ/2<Q]A?K7&dN&H-PP51e;09-G>96##:b-XFXb#X>HMME]Z
<a+L^/SG8E@c:0&c72>)AHO.W2/F?>.I>+L:6)b,8^g<12c-\59LQWe3C;[+M,a=
JW8Bg<R<,,b(:fc<[<]W2f,?:fSF(c7])P&b^S-#]Y&QZ,Q[CB9?&G^UV5I8OUZ.
1=&>DT;RBc+>YQYP.I5>GMUG):dS8OaO;Xc^-^c.8EVI]4\(K_5_<Bd^T18X>08C
MDIO&T801Q0&;_HD>#T+_GF/Ed6G4c@H+0c.TDgb?bd:eCGYNc1/\-[^75gFXUL.
#_bMHEgE=^<<6R2eR+Ug0f[27FH(9^ZA@D^R67W5)U?YcOaL#QG=D5QO[CXEcC\)
<ETf0,.)^fU6)^\2eN0SbA27Z/V-YXU7CbL2=&^\+[5A4CD4&fJCE=:;S]\O_\UH
=BW,-2:dCgK8>4IReY9EI5@NU\EWHL=64I-CY4#OJ&E.<9f_VE(C:c+Q:E)^/W;C
T6f6Q=c5Lf\_,\/)YJ;^Jb^A?P4W+U><8QJNdD1ca7FeCfb(L9Z7)Z&N&R.OCBGI
g+)CaC4DRR_Na#&D-X1^E=RQN);<YQR=+AV/(0a7//-5\=>J5b;@Z/VCIPQ@1[/&
PUO/<UV7Q]RX=M1(ZOJI8Y+:9IgOgQ@5DH?6.e,.IeH<c;G18=O1d=:Q5GVL3&G6
)//.+;OQ[_/P8XYP+VD)^/QZ.)Wd]OY3TgA8f=,g5#Gdb/N9,0UAQN5HSNU4D(c)
LKe^<-THUI1[V]aD+7EAd1ZKRB?>9XK?DAK-DG^Y=S^0b&2D@W?X]Sg.Lc7S.7Se
1]Hg.W?;3XFc@D3MH?16\2@1BCfX/a]_[2:=8334Y&X8R,NRB\3XP#]IYabMH4aM
#VNMLQ.E7=HO[@EIEVJ3GY6XUH_V2K8RPg:TXb,e]7T#/+9;8=,YRXRE>>)>R>JK
[1Ue^e]NAV\eXfG]/J_[Gg]#@2\>b\^?<7])&RbaH?HP7a8O_RS8.&gIa,KJT6M8
=<f9=fa>H4EZJ(&WbWL@1b<83P3c^>_JRJ)3[ZO5#OKNO84g[5JA1@P3_Z?EJ6/5
eUeQ?X]0L,RO[dFQ3F^O<A^W[T1[SK]S14WITE&OOdU3>830=?4@C.R-8H=2XV[>
e^QH?>IY]Y=.3X3H&IeUg,G55fQO+/J<,U;(=-RdZKR(J=eW+CfQV:7]B,ETDa5I
8.XB9TZI6eO[bfN&Ca2E\+,3,gS&,+\T]WDEcOWBIMD#4b35\RWF\I1.9Y<1>)F&
X(RY2^MeE9#7\T]=N>>NNX?=4Q6UaBD)9_3c8_2E.^Nf?QR3O8e-RdX&UHW-aeAb
NLUFfMJMRT3=.H9/LG]HLI9>e,ZMZ4_EY\^C#])[QIJ&#1(5H5/f+4F--G-[b,S@
PF]gc[dO6aRI8G)d/+5BQ,^+]^F[K]OH5,bW0b[5<PE-ZeWVdd4@K;:Z]MU31f,;
[4fBXB_LGG_bTQ6Q-)3,PS?-+S@?87PSe=F?6fSK,JR?40(\bb[dPf1S4?b]Uc+W
6ZCT^?0\VD[Q9;(=<e_EINWC&_<ca74eSHCE.5)U,#^AK0=?1OA7F,R>SL=92UXL
M4--553UK@gMK(P,?^Ab#+?=cXJ014]F>]\@Y+-e?[.fEZK]d#\_US;cG&GPML#:
FGTLeLAK?X>UP706WNbgKO]AA+.D9:W1[40?[X.\J8#I2D\L@L<B/X+V?8f]TJTf
5@^f^QN>>I3&-U(_0Sa+@O--XN_<=3>GJ]cWaYUI9)S)3J)60e6<X.#=_8dD9>40
W]E78bKELR5#:dK\::RV?7[C83^7BKfe4WW7V&2?=1XXR-?MFCJfe/I79[L)+)G?
=RAAU\DV9W#IMK(E/1)H+ZA5fA?;\7J+M7JCa?XQ(.<\NSY2WYQZ0:2QO<gXDUE(
TVfUK#C/#9NP\;]86E@O><CQ>-[Lgb5:YB]AM[ZFF<TJ.8B]BV+GFH4?WeW(dcEI
@D=PMa(J7De8-SdcIVQ/I7f-[;Vag-70YZf-/SY)V_Tc#U(=Zf-MgD06+NO[7Y8#
JBQ_U4H946O<8L>KO?0]F))]R]0>Q]Z7<_aV[(IG[^8+O_??JKC=cS-<AdLU6)D/
L=LVa_6EAIGT[>QTS\2.UI;-1Vc?]1SX/QU3[9&Q&A^ORRc=?EKOKO7](1OB]JU_
_),ID_VfPM&2;?F7eUY#S>QL>):W[P@)d1ZMOI?]P_\31-MT.^^[F5=/&Y#(M?YH
dAfUQa8UPIF/1VEFGgFMJ@<M,HPC4a;YGbBcU,_QE&EcOUO<ST3dWd>=Xc+O&734
FAT8I@.dHD/K\3Z]0T-HO\B3]^XLBV?dD>VN9/][\F(+\/R<<-V,U1AZOA)VVX,N
J6\a[HNB?6\P,F91:^>7CV1L=d44-9:R?XDDP5.BTL;,SE>0N4+]ET5&35E4>118
Wd<b>.O+/Z+X,CWL/-fTT-V88WRJ+Q)9CA]=g6Y3+bTd]#RDE&G(=\/.@[LZg9g-
-F7^<<S[N?0/Kd<ea8\a<a8Z\35YK0BbZI?/FFbID1d\I0ZHXg))8YI<G0cZ0[Te
@C?)_VfNGW.9LC859aE[D.8A5:GRC(-\MI&VcU[cS-.#9?g7FRCTNIC/_fCc\.aT
Sg_..RMYFIOKUe?R+?OKYJZPQ:0<6Tf)I4K?(V2^+<[E6b@1aRYfN,KcL^^.a];^
;-,7GK5DMO]20HMFM)<Tg_:ff5d=g[ca0;#Y+7YLM]3IYce7e=WM(fNQVGH\\;VS
9T)B.YD4&RdEOJbN?A\R6ZH8HNaQ#8g=:IMW_9/XM-M3HC>\=K:\-]8S3XgQ320D
[ZQ>30V)_>^Kb>F,B4<LCUU577QQAX[0Y5488<:S9aTgY-:cA8_T8XGg6bY].P5:
;@SGI&8^@^=:5HWGPSbgU1C_X3Y5-TQ8>AHOe==8Y8-,cH16Aa[>-?QZL+e@?.VE
-X.(.Lf7I(^IZY<#=VEZI.7DTG+R@@GP_3cOO_-D_],E]-a,IZ5gGD/KLH2O@#SC
RIA3NN#a]>Y]1C,fb5?)Q,T1NSH(J]K^K?4/,]Z9?Q(A.DCH9Vd3RYF0\?2/XF(;
U4;VLg.S3dZ3dHa\IUBI3.50Ae/-ZA184X5-gc=J-9/AC#Gc9H.+19T+Q&TGZ.WS
FV>35+3)6/5D]PeS)X-b5J@aX((72=,C1<d,9XVc#T7KZKb<f(Q,BXZ?fVQP(;W#
OR:f(&a3GYPGA^M,C8>[]g<UNEba?.@+cEe1.(KGfDU<EHC(:TR],-MJ;QT(KR93
Y>b(Pd\VD\5IKRQ-5IBC)RM#F;CN1@V1_cQ04E>T7.X3)0)APHVB\&?EWIXLG37P
B3Qa<Vd5H4BI?J1OLR_6]/Of1_>ZX-3J\^\M#3XY(Q/Af;JHT-/^N>Q56IP.7bHK
6eW9]0_Z@/SH)NT+\,_?eXGb>7GaJ:L^cI(WT4YK(M(&_I:TW0_&^E(2YbeUZ&GL
;<cETHQ5HOOCH0IdUEZC&ca?YWNL-[WDM.Fg4eTFa#^\R(P0QZ_5#fTE>TJ-Da(g
0Mg8BUgK.(.[0[;RbO:&+/:F7CT9LX:XY64-+,EDH--g6@g2b9967>FFD:=ScS1Z
g:dZRbML]95)KV7E:XE8),+Z,=3R8>LB;,]@_#;M70EII\\4XMDRF_c.b;>_dA#T
E)LbJ#[2#L70@JX7,,>e9P)dVQKRbL2?K[a_YdUXBAfX/010[4]ZRdSgUPKA/8X)
@9Ia7,+:_\@Q?6?_KJ-eaaDSPA8(0/\ILQJAC[,CBVL1LeC&(dGX].C75-bSG20M
=8+S3/2eU]-\gY^^^[-GTO/BfR5(@@,#Ab2CHA1Z(=<e-7P:^:Y;L9>[3UR69a/#
cT7?L=?Aa5)WJ-5=8,7\+^65_4>c^gN<e7UYJcX37M7?_[Gb@U@#]^f)B3+LYR53
;,MWO#G@bg.+LZc;dA?8/-8FcN;BN)(dgF5.]=0=ecdOb70ec2MT+d_b6S?;IBgT
22=2&^8W3;GQL#-]-QM.\U?]F,Qa)L0?LaBEL]2\dFfQ4Ka@8G&>AOKQ\0[N-&L7
ab.]:3^E1>L7TL=[LXM,Kc+c3-303G^eTY/fWbZKc@H\/D8EgMRU#8;@Q9;f@Y11
DR>:5#D)4&5cfN5+&+Tb1_LDWcH67[GFXRU-W&YaR:G\E(Z3c6PI/1(W2PQFDNP\
U96(BLGcSH\JW86VR?6fG97O+UU(R\^2?RPFU+Y<Z.LaSP3C&HH@L5D)25dSB2AF
YU;0Md-;E[M[1c]38/Ca4E0I#;F;P?Kg),cfEZ3QD_ZIJKK3GTHL4/KQMBQ<;XaC
7a5-#K/;DN<-#]:V@eB<<c3QKO4.;5bN7IKX3ZG-e4;\\IS^H0T&#F,L(5@K).9P
b(R)>NAPYEGaH:,;OK+38f.^3bC[EgL.T>?:&<UND)f;aQPZN8GY#gB)HOe.RLQL
5R?57Q015A657]I\3TL((S3D#,_D.;[EP)(LXOFeH)He4BH]@M>5E@>M9,-QDdfI
.1_K5L)OF4/cd5.NY.<f+E8290EC)<@OM61JdHOEV3Q/dgZa.5f&-IW<V7#3I;Ad
D?-5a,932R>/NN8-:VB;>3PRDY_-b&DBD]7@;=<E/eX<d\dY#NB3D.>Y2MN+[<gH
,WPR]H,<ZIS/X87Be:SHXTEgKS);Y<5GQB7NJBM0&^Q:2:?aH;fK8]#(_OZ[+e61
R:Bb4.[.R-D2gFY3B>J[A(B2&OGEA^,<UE-3+;Aa9eHHaC11.6KSWH[Q=gS#9#L:
2&Z_1VO^GFKAG17E=C8[c-)Z>63RKM>Y:O3EJbKO<C(GLT7J:34,>IfP#_M(2_;2
M_48B1eYDaA;@6^H3NT/3<Q3/Q_U\018Rde.2O.c(DRM+#e+-K/PZZUGd^AM?95@
_WSFeKQ60Q7XHc6T8_24<Q#@#JZ;)Y?>c3VeNaU^Y[4PJ>B3Id-^AGH7cZ?<E,A7
gUGXR<4>/>dVJ]/RI6<&M?e27+OGb1SDBC(>@=f6VfY0B>]_75G,^BN>Cc>(1fOC
[-e:TBX74^#2b<\N_3:Wa-gBZ3Zg,X:MDA6;8OO]=W-.C4d_4XFUL&8C;E37<#c>
_-DN\:GKJ(V9,28g\a4D,>54;S<_LI1K+@5[HdO/<6S+<IZdYf0\JJCR_g6&[TLV
DZ0H(KR#:b3c/C.&1NTeR_f/c,[JEYVAcCNC32JZTK/ND^T)^V8cNad+V;LM[(S5
=_-H\TM3DGd0SA_PC0TG41Q&FS=+YEHTMG<)(T2\c&?b46;2.d@+K27.\ZD&fL<P
A#REXD3BJ1E^P+K>-D0\8@)dX;Q)&N>\J3.MfDV#^baO-[Y4R@]c._(Z0;06IEQI
2D+M0K,d3f+L0L&W7?(_GZC<^IU1R[Ua(JZ&ga-6AAQQ6aSQ,W=BYGW086]:OBTC
&D#>Rf@2[:9>&QHO;E#QF3S1#LE=N5-9Q9S[2W/()6eGebbeGMEI.IIBB>\/+PGJ
FBR&RSgHIB8_>@9/7Y54ZXfXLX.Y8d?7#XK]Ra34YZO<ZZ+ZFI+1IgPM#T<JgC14
),ZEMB(MC&7LgRGA7M9NJC1(6(DaM:\S)HKD>+d)cST2Y7M]=AGf:7;3)afN_R[,
7=a^_1SU4c,L6<AA;_K]R27V\^]@aQZ\ENRb@c=09HTd>^9E=9DcE>:&S+b.dZN@
61KY=B-.#e\QX]OW=fPI962(#J+^Y0#e),:7B3-d?J](FTL(_a?-@ZIUXT4@HV<T
;;^=[=.(dAGCacC2@.f\586M]6^bP=bK00G/M/S)SMAL)B_0W)<?[.L8?T&WTgP?
;E>PV=g8>d<^eBcg=BV2&da<F7==]@&MBWNT6:+MU6C\aZVUX\4VG&M6Ec<EfY[W
Wg6@YJ\9?.F^&:5GP5J\Xbf7]L&9b\bb]=()a(U:+,@,U\]V-\HLU4ee6013F9P6
g96a7-XYga74GH;R++^-I],C74SM3Y.Y+9^NYU+^SIeVZSL6Z@+#e^P7BXT50gW_
RRK7^K^+4,f\F9^N)bQV3(._4&+d^2>JBcFU0J3+8fXd,^8].UBQK_GXIW_S^8(9
,O(=>4MZ8\2&,?PTGVfATBP^b<8P0F7&\L?02bcNg>_;24.1KQ-.GcJDb3&FHSd(
ID0IFg@ZfP8U@]RYM(aR3CfF\g@b=>cD=C86bf;,0TK#\8[9IQ<gSHfX-]-L-S^@
1<-DCe(dPMc?IK]?O[XV5KD4T+YW[<e<K\g&/8c2SZ,<.\)LfK(a7.<18=?&OfKU
675WU2205<A=GK(]I[6>fC@5>M]4_XO,,@a8QMSZ6OIK&01F5af@;I[.2&g@@HZW
ZM)9<RXEB71>AZ-YYNJ#=,Tg;OdP2H/N4?E\d?56XFUII9FA\U4&ADYS(<Z<H;ST
P\MS,V=Xd=g5R<6g4FRBF/XWT[?KgX>6JeL7TNIAW0JC#@aMFG/6gcEBOQNf\N)3
:7)M7[DTaPJd7c_6G/J/BdN.,ASFKHd:+N8/.UgVQ;4+_,C91;]SB5,CL:M6#OBX
)CXP6VRN>Obg[HWC1S.C:PY[<YQ^WZaCMf1geK.-WZbR?E_g+P(8g&g?58.+<cUf
>)9P&O8bVg2.HK0706Qf+<?0/gWXg6Ie?/B9(?\.8L?4Od?Z@D?XNe@R09Zd=93U
D\1.C@/3[?0C.?^[Y_Q;G=UHAAP>,IJCQX.2&6LOafNR?+OOQSbb,HQ3Ja[5<7:0
_^X\O]HF+0)X6b4PMV7IJEeUZ,PE@Y781OXLM9Tf[8aeTVXK0G7DeRc=E5B8N1dM
QZSbYEVH_=b4,MbTL6\QH7[&X2[b)8gH&ZV\f6^BfIV16Le#3_b3#UH&U,)cWSe,
3+JX<@M\,HgX[#(58A4E8>aA8)]bHaF:^=d:b:Ge:.,I2fT/.&.@6^6^+U+AA7/a
&2b>27FG+AC-+7S8/T>DU3Y5^36AXF/Y.T_Z4R#K4/+ce)Y+_5G/a,5?HX5/52EZ
V+GZ54.eYQOAW26aKPEOdCV\5BFg^#IGG^dW<@QbO_SeE(CLL/=4ZaXb(TQQ_@KM
a_8X++g@V#@@/_;@=<-VIJ)\_H(C4ZU1)V\FD)EHN<QD\QB<4L2T\/B&<N-=T3Z3
<<1QfM.Y61Y01:_X-492_F^,eCM&@C/VbI-8)ERL?(gFF^9C3IP\C_W?Vf=/E-H,
LD2g,)XN-HQCZ4^,PQLBaR5gJS<0>&&Q.;EWINgOTQB:L#&T^MOAI05LFaJDBe4>
P:W(R64^FAY2TI0,IK(2,RR5?>U1)KFBFIIA\g0Z38GNYOW69BJWcRMW(L<KIfdY
ATFC6=-JZZ0)4[(AT>aX1F4V#R_F\gTH<3RD\O^T[g(D+VR]@P#28=>Q?X.G64KK
g>NfEI30Se4A3?C=>?^7)YFXJg4dJ[5G]fTY?;eT+Oa;9US6/,H1;P1U&V-Na&ae
JE\=C00-cUc+G7c3_?_5g9WI_g(Y;[6\U>P26K1/Lf67c7[TA=T#X8^/b+Y9[U[S
>G-<:@LT1_A1AU_??c(_DMe);ac3AL&X0?AfN2]@57;[V[,J7U6I\?>9c<0ILXVS
PVaJXaR&J_cc/J?.4J<&K2_9.59J@E.F0T?gEc#(C3@D:DX4]>QgOKZCG@8:-IZX
bb#]2UOUZ>[P4H;=+g:SC(cRb^C-Gaa/;7e5_Z3W0V1)UL(DZMMFAI=IENbV\E&@
^b^KEW(-1GOL7+^b.;BW[P3\Z#JdD7B0a-=Q=>[2WUT0HT,PB(TGM[ZUSefB<>&Q
S22L6+e4LVON68PO.VI:27QOe2H2Y9W9->JAC^T,1E:_36IBIYA]XF7BDd[5]/=8
XXBWY8b?]VTCccf3;X9XdcT6TUW/?b>.AX)gC+[1/^R0-[<HJ<LJE2BD;cS,>=AE
B+D96,#&[DJR0ER>3?8g9HMeY?W;N8e?IRId0>Ygg23UF2CV>U^RZa>24>8dNeC,
[VCK#-2\fIHIH9;O).^VQ2]G_WDQWM,aR)D4IZW:DS::eI^&0)Y==aO3QK[[\M\T
#55ON=UUMb,UB)4B9-TB^<BJC[&N:G-RZ8-\0GE2gE(Q,/Q\CN0N<F9VWFYYTY0=
JTU^A=g8@gV8:+Ae_Xa@AT5\:ZaZADOga-A7M^U241IXF>0?1/_R62H7e^?.X-A3
Sc3HWWWSZcVDFYOGTB>IdcC4D9,<CD7=D<.VaV8VA@aKd?HSLC)Z<aL>#?B)JRL+
:A.0:#)<Y18CY9Lcb-HI[15.IAG1)db<]8]1d6MZc//f5fg@3E)CUUMRF(;A\@NW
M<<1(JZIKVMDd:AV9TT0.PK@NcP6V1+J05#CQT+WBU,cD;WY,1KK8H1^@EFC[SHJ
NTUC[TK3ZK?=[./A^W7)W3F5X[?XAV=<>ef(55MSQ=WE65dYY@<T,1[dZb;]d7FM
=LK5DRV+Z)KSF9BLPKL=)?<T+W=--.?.J,O+G:YCZC63B1N(>X.&JC?[SC5TL.4@
@BG4S74CX1,#<&CYV749]ZK6,OF]gD&:H3_b\H-HdVI3DH,9K5aV@6-dAO[5WUQ,
[>UbS->;(_M>bQ;PQ1#=6YMC-EQEDWZ^aD4a+1K<[9>6ITQ/CPE2K+gGag^GA1b4
^=#3aOLS[;,S;DAL/&d_4TL@+[L4S5HG97fDGCI@1XRCH6]f0CZC-c?M:09N019?
g1Q,6Z]C1-+3,,DWbbC:DJ(K8(3,KO+ESG(XRR:[2I/D^D;KXQ[/dD#TL#DUJP(5
)2IAcD6WJQS<dF0_OZW59V:(@HN@DT]SaJVNVg,^\]UB0@fS;Q[E./A,U(40B5C9
Q;XOU+2://(P1GTTX.LSB8bYdPcS+WJS)+HIa24=VPaebMH(<d]5F.CZ@Zdd7.a:
d2g;ZUbZZ94e6NfSM\1P:3-(4NIQHNND:FWAMI<A5@abCS\dR>)L2;P.]/J9G-aM
[,TYfA0R@c^BSNM^KHCOEf+M@<E_<7#KH^Y1U1&@3?MbNRBXH?[M5<#[Ce)EaP8E
SXUf9]Y65EILc^+a,46Ia437,G#P_.bUQbXR./(fJP&BP?;9\6HX\SXF5=?fYf8;
Ea:XM;W-NI<DN#ZOEGQ2H\5CK.ae62gLEND,:AOZ7U6g=:H^M#I3gfIT[Ee)0&J3
3;\3&I:^Bee]-:K;bAX3ETN-<XC:A+)eQ\=g1A],^;a:YFbEFNJ/]2+7@/1g+5/(
>Y9DLE-<_:LXeA4V4E\@I]?+,.K\S;A4N:5WP+CW\a-gP>_Ue(@G4HC:9dVY[W:b
(SeQbf0C[0)cZVa+U?fC@WOPJcOQBgT@R@d,PJ&==L93X@d?<;=5a[<c_4UcZH[d
5KdZC[)8DK370A.V(ab)ac[2,,7N6-0g_4G923,SV0Ic,9O\QAV@JN4]SEOe:1\b
c-M@fOAI:</aSVT6QY)?g3[gHVf7-=Y.1=8XM#(:NUQ\YB;ORfGdTb2+(;=?gG.L
+.CWcPM(),]e>?dM<6bISUM+>TS<E8P..IZTFLXKEO;.9g#,G?]NCYZJFLU_?ZWQ
Y_<;A2U@96bZ41F[N(acA1305#=\RESN>>SRJdH3;_60+9@EMdd.Y#>D7I<64TS<
Q12HW-c&].fR#-9&@d;CWf8N;-FH2BIC^RJ@Z.L_W046XN3@VI)YZ<(GOE^>@&dJ
LBG89d6BR,+4VBGEZ=EEG,K0a?gXKF_EYG6BMMS.AL9-a=UDg\+O]:aPDa0YLQ?O
66VEP)^]PZ+_:G5<Yd<33VBK>C,=C:9IG861acWaI3FfM)ZV/G8D17B.Z&XWSa#D
<-9ST]GN[[DAR1H.S91C4?a\/7-7IQ1#XP=@LS?E9#b&,c\_Ib5IZ<O6.15XR7+^
1IR1SIN&ST&gP1Tc&O+bcR=0K7)2F)KC@7AOP#)=UTND3g://5M?9g_H;eHO49NP
]:Z(#^L2WJ3#VM/QNH5BX.ZS#@T.be6@77?,CSJ.&BK;TEUWE9Hg+U]4.=G0L:@R
-B,NaLc17Q9ID7]TSYEI960S@d,V3c,E,RaBZ23<K<R6^7RLG9V1WKUZ.Y;L)IR.
N4b.CJdQNTVU\BZ&;C+/[XJA].9J9MdAD/0;N=.aDG:7f39/@;TZYfA;JD7Y_@cV
7WcFI0/:^RYM3+;f7\c3=L7G4:IgHfU5?I#f-fH1eLRPG5D;J20/3@7Q7cP<MTR/
Y6N8_,S;,.9:5G6-3.7EEL:TO\X34Me>FB4@2XWAW)_JP:QA,1Xa&a,M9[PdQ#0V
RK#T)32>LV=YDY]^^PNQ;=4U(=0UUG3-J@c9F<Q+&:B17]\f35+=McK+9;?+0a[)
FUbW(daN<O:TX.V(IDYZc-D/H1JKP/e<.LUPK1PW@OB(<H@WTM3Q)/bC><JaZ-3B
P6WaZTgP#;Y_^6#OS<^\dZ\KFUKR>A&19[)b.X,D/7de2?b=-&Mfb@5_&A=_A:NF
N<^d^/g_cIA=I89H,8HADQZL=3;?Kf^V)\(BHWO9^g1DRL^>O6gXg].<+B#eSgaH
JRSd6F],DfPNd-N=cEP1:X77?\VCCg55&gD=2F#/C6[f4-[X:34d64IWaUTLVfY^
f-)>O,E9Me;J)e=_M504:K-7DEXG@\5CPWF>Ra:>EBCBg>5MB#0GOdebS_Y]GAI5
ON.RGcVJHg88?#</MQ^Ld?HGda9M&U6AXPMB?,:7P1R1(,)7?43;=AeE4ZeJ1EKb
)S<cG8,1S5e/1:e.bZ&KKbY+2.gALXKU?0S6-YS8b)97ZGTSU=TEKLS)B8B=:S73
8FZ?([Z^4PQb(@e^)^SGd7WM-L6NR5fLZAMNC:c<K-=9U_ZZb().U79&c?ZgG[O=
;N9R@2If-SJ<^D?T<MZ\)QI[[+Sa8f,Y]Zd.Y,Pg553baMfVP[e6>gW.XAQgSa9>
2MEd&Rba07QQ+UIU-fQEM(_=R?7b<Pc[L?_5&6+C4c)-F5^)g_Aa;S-c_Rc[A_gH
Wa;O.N?E.T&A^P0WVC()9+J9<R7R]HCSX/#GMA<H:VNQ1RFPCO_[bG9&J8VVHV[]
a[Q)0&@_0K[K1R<aXg3833b;b:7RP=E)1I/).HPCEE]V34;W(Gb#2J3eY/3:AJ/,
gFALBfUQA7@C=Y]G\Y(&OBS]//\]#QW+dgdId,V^J1XY\=O\P:S\JHCT6<a^WSWW
9\_aQ0,_>9AC7V^?b[90Y^GHUJ(W3N#&Q]@gXCA3Z:_4Z82NF=VP>]H&KE;d;G3[
RY4]-S^?RZH0>52,;)eO65[?cFA-b;NO.f=4;\Ec&<),Q9C4&\V.6a-dK+25gW?9
2,T^X.6]XECM::@R1]T#fb]<2C019WM\YBV<DB6YA\?111-eQB4d\5H6?bbb^5B1
6UI=Y75@@ER493-<[V2;@_1?cEe5:YIK@/I&b6[K@^WS6@IOS>@+S@LM4:TOfdL)
_BHO2<]R/3D=L#3.b-P;RC=F5?,M3Ac,L&5&<J-Ne24PeI+ZeHFPd]cHS]g?[[81
Z=_DQ)J,QcN=fSWYYGKX_5<2?bE<M,C5OYHb(5@+b9SW:OD0)aa3/^R6S_BO45Ed
)RDcBW;Kg<eK=5[>e19KR_3\=G>-\:V9TUTa/fK+B/a:Zba)3XFcD@9KfFEWOTdH
;d;1X&R;Y>Fb/,1VK?<LK\g,d4.GEL&.###A)T;Y+NOE<@=?gVTHG\SV:O2bcd(_
L(N0AW.\>@V?e6FWd>WAfOW5f/6(5e]@<F1VKYM=]QKHG8W>bR3b\LOYDRTO5GW.
@Xb0NVMBYUeDPXA,CV?YT8S-L7;JRd56E]c-e[A7=gV4eQSEK+P<P1NX,;-fcNZU
cJS79]2K#/07#55].QQ0CPa3;@g]I6eC4SVUE:5^M^(B=2Q1;WI,1=1?=+SC[[/C
6NFM951-AO7fQ:f+FM(#FA_W)5Dee5Q+;Rg@:CXG;7E].^2aW\[BE[7CbBP#b+(4
5/;MS<T9]?,BK0S9BgJ1,U6=Jg3&=N#/0X[94L/DHMF][LOGH=80;EMGZ9[c5;eH
Y&B[5d#/>-[/T&VT)7PCP7B.fK88R973da3_KD/fDQR_[YL2c))?RW[e.AHEcGQ:
DISUW4M@K]5g0JS^dH[.:-c8M7S(7G:QU,,IALL#eZR.G<K0,H=MS2aVRVcNSTbO
J]b(gQP>/BHNecA;LA_SU7=R(DH1e:HfP,DfYXb@W-(S>6]P]RgW2;6O+ZODB)b-
54-^@gcYg_N&B7J9[D>V/UC=487/-g+S>14g2C_Q79Y7IXF<[8KU_PD)-TD,KW6+
P;B4L&1&fVE+Y98b#VA1Z=P=Y\17b&\IHc;WQ3:R_De:HO<U08XTc@R;)\EdB[-_
.0egg</fI\IUN^dND&&M6b1FBHM#+&UK\E=EC5JQ@7EP3Jc^/(4L>V9IY-98]0e\
/<:b/42<BK8gNOH;-))N<A_4^7=^(TN7\g.Q)<IKUJ.a6#TN0(a3f+b-QUOSW1@H
<I8Z,=-M6L:Q+Y;(_B>:aC90AZP^0E-A-L[RZ5.F?f==#L.=HSS<2SaA;T8P1cWV
&L<>WOCD:GC5H\0<^10WR[\(&U+)dbA=1CR,U1bf.&#+.K2,dB)e7RfMTCMOe2bD
3H52YK[I<bbG(A&f-PcVRFWMI4(0RAYQ&XHPY3,H?4E<K_?=;MHKW?@fA=1O.6Z-
2^B>d+\BG+/:#M;F0;M)JK&(QZ6fYP=.Y:c\]2(SG8RT<ENW0?BQYFAH)M3<4,#S
\2Ue/RUJ,TZ,eeGB.,_=\J3-7/N;9]Q@7MN9AG&+KSW=SLDCYc\DS_K6RM^7YIdY
D[\,Z^C/)0BS9II;Kd5b,\MWI/6T:5eL>D;a=Zg-/PVFXEC>P\[7WgFTDc#5cKb(
&OGbL^^4^(](g/#a,<>T7:-32;-^?_M/OMKV7YNc(S@P=HaXX#c#\dZcb5[:0<g1
JcQ,0HD,GQ[;+S:08DC-X[+CU4_O\DXPSEZEZ?&A92:NU2\c.T:1JCI8D95UDW@a
V]^Bce&<XdRPYXIf\0a0[F55O#FbKb_(&(<(^4HWSIE8&,.[36KN#2(ATc?5(AJg
[Y@A^I,-J>RM_X@ZcKYc-1F9eeW<[G/&gOVFG7[We612bZS/:4<8:/g.Q_A&&:7<
^Y5O3A6XfL)@9&O0;d_E_M+gbA@MK+H#38Y2\H11N3NPcbP<bfC,4N,D4FeJ_K.L
SFA&KO[JNFd-g^g6;d0dd_04H9;&.V&:Fc?8=AaB:E<]R6[8b@Y6MZV.cd,eS^-V
?Abab@MC:d;:JY0:/?3SIaQdAbE-.>4V;-#Y3._O&8.2((+HMDgN;,ZIV+(C<V1d
LaO8:ZZG#[]EFGV\EbRYM3#gV-M4VII^O,RMXO:+;DaJSF,Ed)=5fQUIcX7\N<5@
92+0Tc,;9X5QVf];67^?-5>/RU^W:XcfX[^M]\B;;K.fZM0U/-9f&DW#\8C1WTNR
^(gYV/W:;=E]:>+6;Jfc>8;(b-;B128.10GK<,<DH?#/JOGbgJV)7<[0XKM&gL>W
_QV\.PR[,3<;4:O[bL9,@;Nb@NG4L.gVIXCD7R;_R)g8T,4MSe2HBYSY_XJP1MY;
BH;9R3-Z3fKA4bZ5YGOG=3T&;(I7BPe#>TI+;K&R6(T;;0)O^L]7DgNP3YSJF@-e
[Ag4gRTT^Y)A(K;M_b@Y8EMg<I+?65bgVFTQQ<.[.<<\<f3;;C6=^T36CWTGFdRX
:6)bG<,7/ZA+]\EOHEIL[W+JM&?BdE,LC1b78T8a;#VPHffE0eC3<:GfIQ;SPD:N
^>J5J8)>B==:5PcA,LTcGgP3I+)@IX.IK4E9Pe+9]Y4g5RV3XA[2=Y2AU3_V0[L[
&ce19.CJUHR8AYgT9CcN)bdRHc6@Td&#FN;RVDEdWFLXeMM4<M(>/=#EY_8Y4cOT
L^9.Xg,GWZG:QcOEc=,H,6?:@G88RURHE(#a-JSWQ_=P04[DFY@N>fJ/KdFB?EE-
dL]UAdAB6D@H[90\7ZNI,S@AV7CdZCX-6[8^[KHM7HN,G)4S#]E9OLg]4:>WRZV]
X]KFE/4J[IT,-MDeFJ/);4HKE(<fd9&\,98,Ua4_[(]-Qbc[4NeJKZ5O8cL\\M\.
-\gB_3K>Pc\[Q#0)bM(7J.PD@Oa5N0#dX1N2Z.:LS4()N#16(Q^-YU(W)X-eaAN?
>./&f_3LEf)Yf=2d^-&ZXK7HU^aCY=Td/5@&ION[&S5A1V[I6=ZT7]C]]K<1,OV5
/Z^BZ_(g@KN290+3N<<LVVI]^c6fB,eQK;[_V6?-U[=?54)K<KLUbU?;g5HAJ5QK
\TbY/Y(??[II-ZOVZ.F+A6c5R1RAZ30R0b7D(fD2,[7ITBX(^.C]BS#J__/HYVZd
>Rg3Z_?g;5d2O,@T@E/6SQKcJNWFNbf@QJX9V>&W#2&>WP/Gd.<Q1X2HbM&\Q\f\
/J>YKNGS-9[\dHZ;4(Y7;?F&:@+\,P1:J/I4P3J-=TFXa0D7eV:/?X]&3WN1?\H[
G^CY1ZXJ1.61;e1L\VKcc[B9<UKa8;-^A;(/FcJ3SE]F^HJ^8/&K:Z9BQOPWG+gg
.IU7fV882RRa9BOX[P7I8KH@\3RAJN[/Q[3/K+K-D+XPB+gd6e]e3KU8H4[Y&b<B
G.#.=D>#+_^BMc_?8f4fe>4Y5_PM[&EY>XA0g@SFgXN#;W>2W^VEg-<#89B)\aK;
UNSa=4+66#cR=E^2YMNOF#E\,AT+NR<2<Pc7(eQY&R6Y]83F6YeLDSFC@(EcAMc9
E-c0M973.+U]P)-eN209QK]/E@)?UAFN_2FIQUH7ScUL^1@+eK&d2:HZ-G)b[@3T
L6/G)#W3S.c&SOd8/D[4TV^UB+@f2142/FRf>d#C>79@ZK4,@SPB,:W:)@8/?dU7
.N<,Y>e(KJ-OI#BEH(VRc9KT<#[=b:X#Qe(,.>eJHMT\(5WNATD4ZF8db/<?4@WL
:3N<)Yd&-XaLK5E23^b^O//L=a@J[DM:WP?Q>bd;\VKTOANH(2TbQ95]0A,EQ@Ne
=&5K;5L?3f.W_)D_FG9SH8/,KV=<NJ/aN5Mf(@8GMXM(H9?S+[?ISRWF16CbHd#M
97dEM4>.:87JW&f#\Y6T?46//GE?PKbU-20ZObH,b]:J8R1-,We@P-DWaH\:?0->
H2C#RfF<f6H;&FgHI81_FWAE)MJaX)NY/F(776?=9+ND1QI528WU1:<V(J?SJS@L
C7ce..<H1.RGF#XM/e(bT/WGYA9aRA,2&WF8IKPR[+0g?9@\<+3U^Pa#Ha493Q6W
X,:=<UO=T48>I:S4TR?)\VcX(=9Uaf-e#W-:@46KVJ#a]D2+DS4WW-C>b(S?R7N3
AJOJ3c(<[/D]4Ig0)#Gf9UFQBegNEaAf10c3b=\;TA7YU<3X[E=)_A,ZW>7=>V)#
:2<H^e-GX2Y+>O&+A0f:&C45&43&A)W66AW3Bd)7B.)I2^B0?c?I6JFXB(EBcI(>
;M.NfgMUB.O5LF<M/9&(+[UH<:B(^dC^HKEIN.I:.X5e2[C\1F[1L0Z?G#AfSFGD
TUC;VQ3[VIcF=GdTc#8cR=><5?V5,4V;b5^03<Y0]g^U=6A?=E5:+e:ZDRT468V0
.]fF-GMc:HCg1Qf2b+g,-P(&+TL6b3S>##4<cIb=/^5TQ&L(DTZ=L>RAb?Q-K[>C
0N\EL;2_YFIF[df27<T[fZ^CLfV,N^/NQ03^?\a2bEU/7;UB[]MHg]fKSDREN1.=
)7g@S@RH4^ACM]2=;#;dXR6E+bMM?6EbBR>I66>\]c?8NP530bPUK\B.3MIO7X=f
Jg<.CO?5K_#(7OQ.6AD<.6-92G)=@F^Q.O^WU]/6G/-RR7./8RHC@I&GD&:I2c4I
YWddKF_Bb9V.Y<UcQ1:&3Z3gcJbc(+gdF8f?fF(439aY#FPc=\21JGMT<2JSU^1:
\Zb.RX1#8Q_1GX9/4YN>MaHPa4/R;M]E&B)I;;>W<8?W-I/1;Y.#+5M2E=7aEa35
O+Q.D;P^MBa-;YAUa>UY.SB:0g+eVOK:d(<2^V7L_eUR4F>XQ6bb6ScJ^;gaK7Dc
+TK;[Zf8VHSb8X.YU7#AW\V3/=@@,^COJ+K:Le:V,>12I3,FVWAf9fCS-?4&3PQF
]AF7QJE<0/WbI-5>#,fBD3-;EG7B_-WYa+T2a</e_DgAQKR;AEZZE(LaYF@]&MO&
S0VJ08<>f7LGUXa8W=1:[QK-dF+O=0S=;3YN)KXfZ?1#^3-^b9W;L9GI_QdQ;fL=
]X<HI=#QF-]1ROaC:=Z8IJ<M71eHgPI>b.14:95a+:#e:(L9EF03ZTL=?2<<:EWP
BN5dI/9V.FP.b]bXTVU_[Ea[;R4>@V;c<@?Mb<3,Q#g_D=JEeMKVSN>G:TSZH:FD
-a,IQKR0-\[]G#HYB<ZOGEMfYJPIK24/]b3eHA;XFG]J(215=4G4M[\=)gH[D?6I
2bXU2dQ7<;YSa#W71E;D;J9[FK@Q3\Ma<(Y)5D=3KdaZE[2dJVSMJ,XN\QG;P)CR
d]0P8-/X<TKH>b?RYc:@>OPI3]@K_FP=J^1-1+#CV]I)=^7?D>W/BGD-&CHdX@C)
UGYVV/>SV2d\,1&J\F9#Y0111O7/@HQ,5Z@U\O)G.d@WLI&K7[):KKaZBf9@Kd_e
YV>F#^HZ:X6^A]g9UHN/-C<ce,;9?66)ZGXc&57WAc=D)Eb(UD\e^J=SS]1V;\G9
aWT_T<I]FgREVQAD:g@.7Ng+f_)P;Y4N<-U,-S,?ZH7Z^#/4@R;RUaWH0OT;fH8W
Gf<U^g\-6#;SB]dZbHR\ECV[dX.SH2XD;H^J1030AV]O#PLKGF,OWZI0<5X+=H05
GLaO9L4B[]RX4AS>&GUcLa=0UV:J/HRd9-.J+TOI(]NOU)bF:YeL_Z:_VVAQYbdg
AHQKgU^NE-SadZ;T>XH_;RC&UIEOX+NF]g>3KO?;OCEg8-D;Od>ZNTIS0F##,0&:
;5Y#U&_eB-=&eCK?cG,Qc6751afa9YO)b)\)0.MNE#IQ\]J)V-KUB3^b>KXAT/<5
L[#0TIAcTC_A:M(PeY1Y1/,W?[QdH-EQU/=&Cb;Z_L6[S#/6@)<3AM4EF?:BHd<<
9T,0g>g4DEM)<K58?(L_:F1bZZ)2^:<^Y<>GCNd<>.3?V#>^E9&E)3-3\3G]f.;6
E;YVa4UV<)32GQC0=8BGG,&:E-f1^-\7eOba<NDZWNAPDG]21A&M?f>,=#Rg4E[P
YGP/g:7^E7]MK4X5(VAVST_fAR)dR(]F4&IdV5Q+X9g\eIaB,T.DVR]0SI,>bd,5
+(E4US64]c?^f#dRNe8^R@fZXIZ&(7ULf+M2^aSg0S4<a(Q=:V7:8.a:922&[f48
2Q;TH2A)fBHDdc7&ZE>BM?Je&(MY;-YI]Ke,NXeV>#:75;<VQGc6WRX.GO]#SOF/
9b;WUI_OL\<6LHb/C#F8Ef#[WZ,&cX4>S#6:.^/+98NbR#_MJYPX?SQ3ZXSGTg=V
#9^Wf;4B]NO/#2R<[;;\CSMTC2e=PM=(FEMddT(7FZ5W0GeOEVfJ\6gC+c5S<Se[
NeW4a5OM?CQe+:Je>bFW6_@3(\T-=-A8R_Z5G_]T\8PZ1<]DcP4005Jf>#g:J]>V
D>KPZgL>0EX7-ON&M^2LAY5&;7,X+UA0Q=#44;F,eH]BR?:A-B+a&bdffR19O5+&
;f1-[\5PFG.M0aC]=?)IbZ+4CdNbXBXAM15:[>.LU3G1&?)[C)OdWT#;4H8U55LR
)23X:J(f62LHO3T&45AYQ.YEB@fdRO0F\9#LI3XQ7NKeP&JCJ)2/8f,b:EF_#IB_
S[;>KU94\gSbS=1f+7DA..64d9L4#1+,Z)Of<;CEe..(<@4&5gV<QPPQ[KT,FQ6F
8]M&VQD\a4E)1:&N-2df23g2J&A1[S;1&BRbdEYN#6S8-/R#9SG>1+=H12C2e#Rb
S6&a;dD[L]#P:JG&+C:JXER.b+FCC\,RaX)7C4^^Fe^</QHb@+6;Ve7]eT7+F4Yb
VS1+?KALb+6Q)N-)V(8,88R-:NH_S:W)A\R&+1Z0\Wg@AgGPJ-^X+<g8L8VRZ7T2
GeL@PRCYI3)?>RENg;;/?@B;1CJ1ZJA:II5H9cU:^6__]LDZN\9_=aI]^+-S=8T?
H]_gd\(X6M]+EA<9A&=4:b^9\aa/4O4W9/M>489ZD\dQ(FPO2LDAMG0RO?1Z,_.W
b9&#b2E>MC@L2MJU6W&Sg(H,GO]CAV?.2[+ef;KI;=S9.Z4L/H2PE-Y0YZa;R^&L
U+Q-@@aHaR.@#_Hc=FG@QW3Eff0>8GUEHc]]b:DT4GCBf?8aBE6EW(CPb9Ec[;#]
T2L6&B)WT2:48K9S)INNKF?QNc7ZE^\@79#H>1.RYdMc:&4N((BIcC8c,6LBVb[4
=KEZBRLUJ\+N@#;\]+R;:Y)T[PY.\Y-_:,C<c4/[TYGZ;:bS(\D<K)KAae(HAR]0
,Z^)^50MP-I-.gP+S<Hc?R#T@B::J\XU0L<eNb-2LLd(HYZKX66P0acX-;>@:Ggb
1RNL-gI-8>7L42PAW-V\(<KX3&W6&SXI+JfNGdY95FaMQ8fHY<VcTB;c3LD\_DA)
Yg88acbN8;P9F:S:UScX3D_D(HYa+8EZ4+fU,^+RB?S.OH,)eA39ObT8:Db]L.&(
WMX9.>+;/3?@.\?6?:O?TKII]+X7<2OW/f1@a(A]]PM-+eANa2M7=c[I-XQV8MVa
KB5ECCJ=?79_J.:VP]9C+FFJSVEJc0^M^8\HSBESD<bgVN/+C,>3/Y;R)H7[-MI#
JGLFQU+d/_8b7.\6B^2&<TRF_3E7-:bGNDf?44X@1UMJ5F-7Z+EAS6<@7Q5GX[KZ
(^QYFE2<eR4J^]Ae[:V.dI#)4T,,BP=0Q(Q4J@A-0;E[&8N1K)S@@&eVS+L?7V-#
(c>5-:\eI34RBPXO&fP-^SKB+[OCKIB1\R<RJRI/[8)Zd+JCJ+^L.4gK]?[7CFPC
=1Jfb0e\&.][Ub1:P/PC(5_7)/)e60FYQ38?2+]4L=H-cf+S#bHHD4=:MY<_;&#C
0=4>7X<Yc630=T:4;ZfLZdAd&L?SI@IZ#M:.a4S#361V.?@d0Q6:\0NEc[TBa9/Z
/X<AG7[)fV>0Eb/C1#FA/CC7bd5ILG76g?VQ^LD1_gRY(,-W<A(WH)5?[+(M)#3]
?G],MWEa8))SLR-PB[2]f3.VAOgC2a(#^;YX(GA1MEg0@&4:d.3A++C[[PU[?VUF
F&4S?g/J;@UYJ0@b9fg9737?agCMNRG(cZ=QL31bMIQJO#V.=\<UNMS3Q?4WQ:&&
9IMY,3<RC,Jf7-ZYU_?WVa[B)IdR9)?E;.JOdgcgNFBA@O8SJIR:+FPDf+E-?BRg
^#A&)P3A7&&\6BBOV_TNT3eGS&a;9G]b7Y,VO&[QJ(PB:6dQ)G3BHAg5)@MRS9Z1
ggT]#0)L,&NPPg/<0a_1c@CX_\UJ.I57/d6Wg)BDV@SFS-]R3D80PN4gB166;B[^
@Ta7?JO)Hb0dcY864\=A03)=4UM8DQKJ<[-QNS2EECUdaX_9Je2a/Y+-6,:d2LZ^
VB#Y]#,60YKE7X0<#UJ#-&;=IDK6UQF>7/S/(S20M?S7]]XF;-TW9UdYbS&:?)Q4
2&1\ECI&SVEET[+UH0HAM]S).M^0#8#cbLRE6,Ld&23bVR0&?&PS]#3M=>c]g,1S
MB/PA_dOJ/_+1eFdJ<2M-MGK;c,N_5dZ-6JH1TZ=_K[IL_Q=+RcK;T6465AIGBe:
[R^\(Q]=S9M>2H&9;HVZ?a7-5P][C=[RXMOf:,6BEc#T@E988=Y&\,+Q;7=H>H>(
86c&]3NBWJG0F35_IGTP+N20#bR1K0?<S_e<eQLKH(e:Ec.M-Y:>H=eg-PIZ4Fe#
=4+#^VEOaUN7&AcV&=4d#+f3B+L3+L293B,@/f_OI(<IP.D3b7E+NV/UC1YR6d[:
X/e356^YN^J9S)W<K-;#WLM(@Cd^C^Md&\OcAWS@<[MQ]EE?eSf:1C119(Z>a.SW
M7Y_QALQR44SNRaGV<5J@/YP7]&RUUbAPf52;KV>=1eBbd^RM?DW3M=K0\fE+>Dg
\VT34\](=VYCM5PB>OXRK;bL-&\AW)?b.?YS-WBEaUPM]E,LDT\\#U:7eT;=BJP6
I>.::8RP5#)a#M6+dB@^61X5VU0XEA:E/1ABUEFSW;dY-/1\b84F@=:f9<W:]6O_
bPg5SCCUL5VALd;STTD^H>6)/bb<=DYF.OTZ#\LO[)AD9P7-EUGRdBM3#+a-1,Q;
-WdI9G5RZeI/_5J\ad=10D8R]E2UPJ]G<=5S=VADOCg<dJR;P1LB04^188>2bAS2
DUQ(ge7c==NRJc\+T=O&OPPe^GfgKb1>X?UL1F[B_H^4/YO<OQ]PA3a\VRXXecW7
fA([#aXcNH1d?0XbX0&A<gT#;bZH^VN,S@aZNSbfaQ14MY_#:5A[4dD5_L(?,?ZY
]?UbF\Q1/cdAM1g5+d_:4OA#DS2@(?7cH\1VZ)6/3I+8d.<[1Cg)U#X66JC+(EfF
[YF3G5D0#c4ASUIB^=?7(6Q1#<1\6WKf^JC]1#eM.H[3-.QC_#]0C8/;:KOP].0e
ESTbe)Ia_F0+Fb>]#-P;a;4H>=GDMLMfF8?&.?R(;YZXGD4\5#&b;P9(:C#d9H>H
J5LN5B5_4f@WA,L-W&D;Cb?RIg=Xc6_HF4A,Y(G^.)CBJHVL^&-7:aQAIU[SFHFP
V?[4CE,HT+[fBeZL8DSb=/PN/LdXc/f6(Q#N66KC7W_f]eGJ>#OcbW(+3T6L1GgT
:NdD9:[GgKI?9_<L?(H7#ELYLA:9\V8,JW^^UTc@)?M;V.#^[LVNV#[RM<]Q8D3U
)PD((_d?Y43QDR2:DWIIb_[#2^6FV9@@T7&CCB:Sf3eJ-A01B1-bSX.ac]UPRZ=b
-T,YL+fG1R/0X</ZP&OUE0\94(TD]f0D1O#SE4D_[N7ZM>gG?_8.PNV3W,NBTJ#W
X)A,_-,05aG-5UX-4>QP(Y]9XTVVf_3XeIFU5BIV3S00;S(A/\(VL#3,NPHCE_?I
:O8>P<N[4<>/)=B#0H8T9WJ,3GKd:4(8G2J.3S4#0-ZQ</POf:TEJQK=+^0ZX1Wc
7NfG_I+VZ#&_-+PXO/4gZGMa/)/e>LL_5G.SI=6GU,d<GQ)7VEYVB88Tf1K+@7\b
\M?faF1dSFgK-(Wdg@]N7T?U).S]d_CU)A7QN,)VVWAeF0B5g=2YN_650eEP=7#7
6DXIU8_8&S+R#b/Wf0:_e79-aEO2[&Y.6B01P.C;&?Ta^VHZ@5fK.?f[EDVRHLOP
XC1f7Fa<9[6;#32(4:0R4>\EV6YMa4OcFF9EO\c](V6#\Sg>.cSIF010:J@c5F<K
LLR1LH[?UW>HfZ>6KMC^V[N=>MK\P[TTCB@YVX2PQ\9<[?;[,ZHUW?e.M:80/(97
bAL7@3^_EXP.-CV+&^f\)SLE)8QV::-C;S-9)T8@(97,2+]C_.DZ5P]6,\=X?RRO
:8@Tf;)R^^12B7<a^8gC:S,20cLfG>N<9a9#S&Z9UYeOV[08;&d4,bZN]2?0/#,R
4,gV9L0bW)<4L8/cc-/e:RP<b.GINN74HU.-HfF(Sg-8&=eY>^E&NFVT^0_Y3,H9
d7HfL1F[9&HY8egREeSHe8+WYe62G?NKOMCCQdfAa3&H5>1RH?YUN^;0a_RHKHW6
JHNF#VT-aLMB_#VM5UXdS-I(9K]M:KC4F3+=aQZOTL@0K>fQWc2Y^ZR[9V5.fIOZ
.1MW788X?57-,gJCLGJ\Q,&O-2VAIUJ_H>(fS;99ZMMA?OcP4TM8>,6eO7?a_A&X
?TR(OZBEB0;4=2.;E5FI0=]:6J#/E.D+<(Hc\[Y27G/=MUTIM3K#05V+Gf0S@]e\
Z&bH@g.g4R=eU/AZZ7I7_gb9O/L@;];EIWM1IBe(dO]M/cT)1#T^#4g3D0eGD:C4
.6BWK=5H_gEc^._4-g4ZQ45NS,-E9MW<JA#->5AME.HAaZEM6I0#??A3#ePJ(+SO
9#^-QL]<T)bc&e7]C4BQ(Z]E.-,NM/fOV+H#ILe2XA&1bGCDH>ZX2MeJM[[CI0M7
H[.UZfPWR7E.[F9A_@/PW,/XTHV6T16XaSFJOETbJZLKRd:[8,^.,JM_06Ee0(A7
QBcPL\A2b6cL@J-D#6[NG[KKCWOE>aL94;EB?QS#B@(cbNa@Q2Ze_>K)7GB[ET42
CC>I,d5S[=JF2=;X\V/A@TL[#0._EIP(MH9-R3\f/VB40C<W\TT3FTX@I&YF:b64
XXg7RS:#+c1=OQQKcJWBaA^c#01VOB:=X@)0MVQ0-3VQ5[OF3W8BD,8?dNLeAO7M
d3d1[F.<\+UU09@YDZZUcN6CbKF\8UC24[A-ER6^5:8BQUaYd#;9KD1U0FAMLC;J
TX3Yd8dLG-W0#aeY^S8?S;\+G0+]XKK6\M9H4b?)E8aN-P_;GD+K-?I2JA7=22#A
^g/Y^Cg+fQ5FP[APEONf/f5XO.GFd&9KaYN(JMaaC_HgU(9[Fd\S1[QPF6:4gH5X
VbI<cH3gL);SgI7]3G9&Y(?56C:CU&RWZ>SY:c/FUGW2MKGWIIH)AOEfA<A]>14)
@[Gb+(C@E)3.:GL811gW-GI/AY20U7Kbb3<a/H@8_X.Ne/f\;HC_9\3cI-7+IfUa
M/F@8FVHHd))a54W=G0G7@@f#2)4:4Td\cC8V2[)QLZXE.23DC9MZ;6Z6]3ZEY4g
[?\U^:6;/bd>K]gWM=Z#DC(_&8UcE\C:^AR5b3OPcIa:Z4+^#bZ>6Jg^4:d@S6AG
>^O=<d6;X55L;)7E+P,N&B0aEc1.H:9>V3VE6VU3Fd/KE?0UGRPX38gc=aH?cR5J
GJRW6H[Y;f;F^>;ceTC(gGCH1ZgG6B?M.6E^6#@C<B2;F>.;-LZ/CVWCF0PPZB.U
G1^?XUd:.DIcUdeD]SP09,++_R^.gcCH+M&HUK-+^fFc4:H+N^=d;\HLP\Z6aKCK
a1:QE86@]IdJ4FgVIMD;9TUJ\8UD?DgH)c)C9e<8>FA^@aLZe>bWTGXQ^#FOVTD2
5[/U^8bLFfS#VNb7)>dYf57LFG9H.HT7]K&b)Q^ASg>Z7]K?2Ng;f9?]>K2X)SLS
S(4b].LP&N\6VbJYVA2Z@<EL<KR9Mb,&/77@[ZX:?^2I:J=C4/=K@dY#XYX:2QR;
H:V0b/:OTUKUZ?XY+1Re+^C_I?XEFJT6#^a^=d_7ZOB]BZCLe]4#4;9,]AbcR&6D
VQ@M/[5^XdSBDWGg4[@[BM(MO-ZC;c4/QEA44?4UW-ULab\_7HALTc0AI,eAMUDP
EeQ4=H+IdGLF9?.]ZLg-82AVN,)U)O^0O:C8IW=0\X8OO_C:.bC2ZLPI7RY5;Qgb
PYTe7M8d^Z/,[1,@:c:Z@9#f<T:VCe2O2^-_;6G?>TFR9/(ca9/g/g3()E]SELM,
/TJ,A5+dRZaCGGI]KN^J#<YH_fF[fBWf@?P)HMK)8BV96e]@QFAXQZM@0KGK\Z77
S1)_Q[XG@F/87YLME^dIDd0aK+I+UeQXD=>OPNCP>[cM:+K/G3+MGB]B<b67H][:
.1L=#7+a^C5=4JQN(6HIA2=[J--T,GbO;UMLM^-]1HA6>C]<ba-b+UW4OTZF?0.9
,[ZdMFMFG@I@D:T_Q2M=2?+BRAf-.AE0eXPZP0R3_K7eb=\aV7?fD7&:J&K.;5Z4
SG594<^G-7<9_D#DLBHIBTG7H,<3C#Yd0JD:Z#:908UZc@FWV.9_KE0](([XVYTg
0FB]V^8NgMA+KHPLeGb2aK/0L3QYdVaD&M8W>G8I7Y(^W6_.\CWVP<VT4UQ_18(X
dT:R@Cc\PGFD^AG14+Q_39RS;@gF/509[]1^62J_7Z7QDSOR/]+@=4S>9F1W6R2?
WB,D0OFC^[H\)+<_8+J-?6Y@HeD3Dd(=DVE_?W_SgDgVR_fSWKQ<+R-;Z:#EY?Q<
-@FX_151cZCdQ4bBJ+6VR4GI58gG_NY,815B;UD:Q1J7.Q9@B=V3O:)YebJfE?e_
342=O^Y_+AOPSG.H3\fG1,H/JC3e3WH&[(daE:&T(_KCd_Se1RE9b\1>CbAd520)
^I:T+Y>c]0H<1_53f/KG3WBL5C13IZ\fV/ZJZ5B27B<@S)H85H1EV-.&^;ON[[F5
/61WI^C:F_XWA1d-W&ER?dgO>/NaGSO+POXX6:&:#[/=M49aT-6Dc-7KUZ)HU(4.
bD831[_UB,BfQAH/1H1g(AFe>A9C0T+-PQG8[C9aM1)+OgVV/YC?E2fRYT#:Uf].
JHZW1.D)c@4bY<5RPdL8Fgae^R<.K^FJZS57D>Z\IMYRC(=ebDO@82e5F1^8=9QF
:Xdd<6cY?B]?1>cMW>6/51?7G.aWBWgDU)W^O03PW/)LHXCZ&g.16#2d?8PT\D.B
,4L?//]Q]dZ5V),W+8]_1J=JY;0#M\A^,Q1KZETTUd+Y5UY[0OKQM58Sf1Q&HUXa
0,1gf:.5UCII8GEZV#4?-YW[)g.f4@N2/H3AO2ZADK8APe)>Z;K631CC,QZGgb#e
aY[UE>W,)^1<YgGR(b3_9T<GX7Jb(FFTR]cI)5b^;bbRYgcA2H:K_.(;e][Pg15O
L?J\)#;(RRd#6:+209X?F:EPg^U[9QRUJIgGRI>aC&=3-<gJQU<B6#U\AeO^&,RC
^U&Ia]L?PW-ELOJ[F)LE-CQ5gW5;)_(0<V(Q,_(+8:-UBf2MH&I[a,^H+UC>?C8#
bC_?OHg\RVD)0K<<WI4V,BHULg+-Ab5:MNbT]=X\[a;c>[1aMP13E@CR-@>f9cY=
BX\?1.\7]Za,@fCDR;X/=Y7NfGFFH0C9c]BT&MG@LXd:<Va;+:]F_0g[0A6&_3Q8
?eLbET2f:g1462H=C679bU-.gHO^46=/5D5KeTAA6&W2#]VK\PNM,cK5HfW/:;aZ
ba.g1G0^MSQIFIU7(&8d=FX+e/8a()&bZD;c--(?/2UV<JJ)LWYa>6.K3Jeb1ZBD
.[a?-V=3H3=FNMTQ,J\I:b,+Y[D==QC5YLDN9(fNB55MW838Q74M>R/RK5e7^;[K
J9(T>7;K(R.TJ<cIA8e.81N.?2V(f5;>AFE8&Z1?&#5B:\,BTLHL8O+J2SZ(4<fZ
.VD\Y_IgFTd2:=[TBB0UbO?CO?d-cUbZZVJ;@Aa6GOF3YX3(8G?&#Y6M]:f/5)^G
)GdL0C>-<S-[HE^g,0<^^C:/>@Ef8JZ/[WV@H8@(E3#C1cb-B<?ZW+fXGC?\_JZO
fb9DR)<+3[^-WT.)1O19^<#g8FA#\9RIA2ZZAfB\fR00QMGIYX/\S#O6[2@f]</>
(]N6\B9Wa&@E^aT+>D_a=[b0FMBbCZB+HDO)3K8@D5M=6]LWF2QH/BIF(C#ZL1+Q
+FVgb?DSC(eZaU&]W0G.JAggOeTe66TZCdBfW7+]+_=dLQ-ZAQDXd&MfXC;>E^V&
OW@K&:#Q;70cf3PVFR^8JY,K</FE(K,#,QS:4<f:Z-](X\,MCdI.g9?_KOaC03]a
9E2F[<S[9^P7M5IGK<]=F/2cJd4(GT3[A08DMdYVeGW/a1V:c+8MEdUe3T->TD7_
_=JGJb^S<OXKR]?MBNf-DVEG6&Og)TT;WKd3Be_Y9?(9e8S&/d[;WF^;E<cXdbJ:
+Ne<HC71RGJS2BO1EW\(NP:@aOG.DJPC7Q<@FRX\;2Z2QbXecf:X2HaBC&0?1BR<
=8UQ^Zg1#QL]BM?R-]/W&,Y8M,[YOY(:N,GMCU&Q04U2U;edO[OaM4EIP&:=fWdW
20a<7O(NXV+17HB:P9D&-fLI[3@.+5(.<IB[VLg2[6O6F7gD2V@W_Ef#@I8\EK5b
#YT6e[<aN:V4d@VV&ET3=SD,(,S9<\HE,JPY^FQF28Lc=?6R]S]S/&QMWcS5YU#W
EO^L:>MQ2+1+Y4J6[-S?^FAF:M);YCLe#PR:b2S9G=0KaW^+=Q.@0QS;_,3MgZ&X
>RbI?:-Pa6TTZM47U1:8H+bc=@cdX9[C\:ZXV=KACgdKU\AWH<?_.0XWb;dQQ92K
)-CL-7b;L]f#Y_9?@U/5@I>dg<OF:2@c5ON/QU#OJ<WXfLRd,dJI?CKDG-f2X?&+
#[#g27]?79_Q;Ye8)[@RMU_6\4FT;[eP_24)(M/A]I>(M(:]eQ#6)cIG3#@7^2N4
1T(YF[KYQY:PUf(;a4P3f=.9,8QDL>_S<AdI+5;J.\Af)+S0MH>=g17c0WF]YEPN
SI1<bT;Kd,W>9D/3Se/?P7]GaA>B3+:=1U^CT)DWE9U9CCKV&.E_)eVXcYPH6d0]
R6T\CSRABBBg],H&QY)Q.1?ff1_ZVVI_g[gb2&[I+(aabFPfdT597gDR7HQaHF:,
Ia:UcO]9_F=V9ZKU?e073:\Z]Y.GL[<(?Y+SLT+):fUAS9J]+WCKW9==;SGe1D8J
;Qb4MEBEO:@g:P/0UA=FW.@V=UDV^PC<KJZ?C<TKL(3S8R/AV]&Rg=eRW8H]=c=\
UC4_[J;/PUAB2?.#d=ggTJ(WaY4=6@:3EP;a/1)5^O\GNN9]G(_H<1N_8?aE;Cd^
f<RO:721+WCe=J?H04Y4-OF9DAbLITg9:32-f&:(I&+OHFR@X]<0U3N)N\<V-+73
7]Mf<:3C2_/dE9D>L10Y53fa3YF,#/e3.P&?b2Q[_O<UL&BM(MPFL:c,X>285D,)
Y)dNL(<>(:UAYccb-4aIJV>E3F\3-@S3eA3cY-<(WbW:&J030ZdIZDGCA0ZJ7M1O
^0g8CU3\]+LU0A?T+Y\^^+?+:(d+HAYM1TSU4P#5CQI5cEeN#:<1[^+gPT:<Hb[9
4@8A-fRN/56CO+)QcF1(<YK8YATF9M&^?K#>?/B3CAOI(]M.(Y(d9,M)@aPcLeWB
INIF]&4GYQQCBcG[#fPA#6^TdW&[IQM-faQf[cM6RZ>=d;bZ3=:YGFE##9KaXB.D
YZR>1MN/)Q>MC-M\f&DWg+WU;4EK?1<-,+7)^BQXaGFX2NPg[)gG80?fL\Keb4V5
cX/AB[U]63=UTYZAK7JaC]L[E.+6e]-S)/DUE+\V[(II5L<6>7+Xf-KWJ]?,FHF_
6F[E2BMFfFR\ObV#:7\L..]I)OME=&#-L&[ZKd?\3R^c.W=6F0;bI-KV9K1KS<de
+g=f-MRIDHGV1G?_/=RY(LRTG(^=g=7@[SOT[N26NIO]#:g:RLgOE3:Ye;Q#_S:M
/2VC2fKJ[4de9#AgD[NDUFb/)RUcJa)K59/WbY,<2KR(<Gf<f#R:MD7W@[Q>?0>[
CC_BbaW&?TW=gd)PRQVX)O3^cUE_+6>7B@-Ze^&1Gb8I4@:;^QcCL_Z[/?&=C_F1
#fJR05&MYP(X;6F\fPf715L/94CYLU7C&G0BSU4\@c[.34C)LM0F5D_&I>W6?PcU
AefN]L0>_^ER6>&eB?18&#AQ9:_gARFPPV1(=L[&_,RJ7?&Y[6@a,N)+AT282XNR
.Ad0_RXCN&Y&:/8aOALPY_](IXc]>g?3/GSZK0RB-9.WFNUR23=M@T7>EBBO/&RH
9UgZ+23]4cFc<YZa[#Jf.@47eX+U-b_bdEfJcf\acG7Z69BPDB5d[K?e\NA9[(aO
FDgEaZXL_X[K2Udd87/^(@7.>c8Pb/>eN>:;XK4DTA9Pg399O6PEYN<gTaS-O@+U
3#H22>M?6T>K[(:-b0BfS\BG3]MJJDX1E/e)YK4ca4EETdW9;R8SN0+<O8W?8:<M
)S5gXgd;\f,3LELQD/L6e0Q8^&BHV,]JX5J_/#)T##YD6+(SCFOL@fGL#Y(U_W_E
(DKSKKRX=b,[^(:<c/f[g_aEKde>#c3fgY(LY;Z^0(JfAVO/>5)+->E@@BM88O?3
O6;QB]F;\U,GJ-:5@bb26?_]:W:+_X/DL::_Bf>[JK,@Bg?aFVF[--2D[@(;?Da#
TbXN5@IS+?LTZfD6bFNI;PMY0B0__3T.MI+S/eX]=S>;Ff/=>6JSeZEIC&gEP#PS
#^AGE?2/[FE<TJ)T7b4[Y,N;>SPGIT--cE_9cLQ20D^a)6K>[EZ?9V2^d<[]2G\Q
S4_24PdWM8PHUUW5R#NPN/e^9HTB+(fB0..,.&J1EI:5BTS^EP@+be[?>eWU\/-d
aFRE0W/6I).)C3DHYY[c^A<]Og;)I:WI=,g:fe:</HHaP;BRYIZ<7dV\d5Q_7L;Q
]U]bPXN>.OWG;-7]H;2S0_/A7gB9RETB[=M>a_9-^FPLKOKX)D?#=gT384_8@:4]
81<fgSLPbGQ(6Z<B@,^94=IC@)0D8I>A.)KGF,MCd<SHWQ,fFI3MbI^VI>d-#^ac
d)?,HH5C5.CYaI>c30;g5HaD+(LR5S^6&4O5@1,\PJR6-P[N[#XZU:.6aDJf\8[+
KeF8Qdf(O,XDEBE^HA;NXN:LPYMeDQM4-5)][<2P.2YY0&#gAO=-1eQJdcEM5[C?
T[\Ic2fED0=.G#PBOQ2]+a^<ZE.g[]WPX6?EIC4K=<a>\NAP_17W6aVY9/)Z]5Z1
THS_(cM);FQ5TT]=GUcJP9CDN1g<[G3Y4YfIBNN?YF>4ca1#K:Ga^4BUM)Q?PWFV
c@9f,OZKA1Ce^;]bO.@8DU>(0,MK@[S-]]g.##-1J\-G+ag-<+/M6YEG#QAXA3N^
a9aHQ,H/9)/[HYE\]YZW7?7B#f21ATP^[&M?Z/1,3>PgdVc>C/7Z-NR_4/f(8Y&g
+We@37eM+>MTJ]TBFGW=6SV_F;6M7BdSf^9O/fBF:Y[=.6X\V?Z>AWS=Zb:T4+@8
db^b/R1+B-B.5(LZ1e.:6<V_8$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MX25U_AC_CONFIGURATION_SV
