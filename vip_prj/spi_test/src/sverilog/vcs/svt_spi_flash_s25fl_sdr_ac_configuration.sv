
`ifndef GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FL family in SDR mode.
 */
class svt_spi_flash_s25fl_sdr_ac_configuration extends svt_configuration;

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
   * WP# Setup time
   */
  real tWPS_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tWPH_ns = initial_time;

  /**
   * HOLD Active Setup time
   */
  real tHLCH_ns = initial_time;

  /**
   * HOLD Active Hold time
   */
  real tCHHH_ns = initial_time;

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

  ///** Assign refernce of svt_spi_mem_mode_register_configuration object */
  //extern virtual function void set_timing_mr_cfg(svt_spi_mem_mode_register_configuration mr_cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Calculates Random Timing Parameter value for #hold_assert_to_output_invalid_ns */
  extern virtual function void randomize_hold_assert_to_output_invalid_ns();

  /** Calculates Random Timing Parameter value for #hold_deassert_to_output_valid_ns */
  extern virtual function void randomize_hold_deassert_to_output_valid_ns();

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
  `svt_vmm_data_new(svt_spi_flash_s25fl_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fl_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fl_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fl_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fl_sdr_ac_configuration.
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
  extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_s25fl_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fl_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
/-T-5IFaa_QCG2&/.Q-#]/O&aXK3.Z>?8HOJ&YU)UUF+eJY+5D<_))[1,;C5a3J\
90^,<19Zd]9;/+@e[c[MN/.M?UG;ZC:\8Q?=)[Z7SS(5<9KP[@a([_X0-MGRW\)>
)F9I,SWXJ@>7,1>R_+QGLDDIWNU5e8L;Z5WBZJc-#Q>MNf0g#XM?DZ-;W468c8HK
<bWObTd@c8];4Q<DE(D&O2BL12I23=N&2C#B&3e<]M2?fFOQbR.ZE6P-QKf?&<cD
;+YB]5M3;TU^07G^T73Y:48&-54I\1ZQRW(<bB5+)5#G)3L)]JTKT:ZDJSa3D/[Q
,aSB40<8O]aB\,Z):;@X:)[Kb:@J0V+_^,A,(S_71JS@a[AWd97T&=#:?H\EJ<FB
,@SCJ,225R<-FDLgT>@]D9^=2I3MBdW58W_4TWWHJE1?)UT01C\\UKHL@4\<@;V>
)XU9XL4S5[C=T:V576CU7F?U[^JOR:T9PSfP<e[@FL^S^6Z^[@UJX=0YYY53:K9X
d.J=623@R:g>>X;UWdLM(F?96N5_M@S0Y&d=e5U6K/3&FY9ZBZSa.#eLWT0@f.UO
?S-6E8[/ML=V9Z/+@.+<A@_P:-7;aN8T0V),[>4XgJXX&6ee>QI?8(ERP9(L5U82
XY]c@dbfD_^[DFf<:.,4KI^J5UE?:9f&MTCWgDPXS[62)ULK&9/&NK6YcC/NYga/
[eYKceY5:B;<aL[?7U&9CdARb\0#bAWPLN\R@fWE_;@8)0RQ0F)a]8/\+#OS@(((
?TNUPSeg.TUgfZ&]D+5B3OAR5$
`endprotected


//vcs_vip_protect
`protected
5H3Cb3Ma<1):T7;gJ7)Z&]^D(\P-4a[_P&.:668[4)(JSDAMU>+<+(Xga9gg.,\]
:PPIcg)@,#S2G.2Y[PeHS0D0:TS3eK;TJ^2IPV@cK=,A&RB5Ed]U2XTZ<+IKZ659
Gc0V]+NWP^YW/OIY^\D+HJVSJ\?e+C).8H)JA\TBBN+\)+>/FLRg[aG8@cceK./_
>G\7#7T0Rb2Y3#I8H\(CI+8(EPLI:8&M,[R[TMB/g[e-FTd5)ZMF>BIcWc\N.7JV
(LN]H<6?AJWg]>ebMZ>#f,@a?4?d[>&F<U[0B<@B?R[0NLJfW:AIN=EG+25[(>e?
@1d7OB=:bVf[XcJ^Zb)\YY_H8WX<J68gZ?LF5M2b8F9:OKL3.3GX]Z[3gaC3Y]d)
V=)5cW#E(,];g1C)6=A4dMfHE:c@+^-1e-=15&4^B8B29gY_8O^G.MNCNGD1Me0.
WWNHS@TAcP7g3VY6HE#dD43,UU9+9\]#J5SYdUE,A6e@&S57)XY]@.^1<S\a1<&1
J^9e,F6YAJ(JeW)1Rf<P-3TE-C2Y(bS0gBEBLQE.=Wb4F/eAYR69#\<N;LgUIbdJ
>,;3D>6[PTMDGK:1f,D/c>=)CP\&.W6LKO2XHccYaSMO3^TUHE#7&+CZ)B6c3A00
HUdIfO,]SaZg<7e/HZ)B;/UgMS>51+)2UeF3Q1&]4I+.;CgTXc_L2XEIZRaa8HFb
@V);3Ce]]>&?KOY-O[8:9,>X-XQ_&gg)g1))>U+Q+MPD6P=<XUH16P,H#(8]Q5dK
ONV(c@;OP7HU/VfO0;]KFB,gX;BEM,NC+2+.\a)6^.0\ULZB3(2/EA:NV#V_<JX?
3+3<UQ+0aeV/&IS\d@#4f;K3P>M6Q2AJL8YJT:REd&?SQR6J5Y(1]HE3?3E\#e26
,T#aC&V=_[I02(ECW.ae:X&=SSEW/9R54.IL(X[fJ2A\+b620dT?@^@LH52<119b
>3geZYI:XD=2U#<37>R5T];M])eNRf[e@WUdbI&BVT-C_KY8_e2)^10:=HSH1\D6
8]Pa2c6+Q+GE+?0SK]W6+,P-M^5,g,)X[HUd4S6YW+;e_XR2#5EUF_G\/K,cMa[>
A0KM&A&=[bcP+<M<[<?AO+90<dC@#T[Y8Z,Gf5gS>Ec[)>ZUbJ\U[?MS/M60bGFJ
3e/^+>TZ9)B8;^g:4@RN&,8cJ_fKaRDecC5KJ\ZE67\]&3:7Z6H8GgGYaXR,#F,)
4Lf,+((^Y+<5,F_aKa)90+8X)BIU^RC8O#J@_8FWg,[()7#5Q+W5E#^)cTM.=)C<
[(>J].^&16AHOD<HR\,6^7.e(FKe-eB?2_L1O7UC>b3F+.&]H&2M8WGbHVgYKNBC
Uc:MAf17b?S>a\C3_8b3-,IeAG[b&a0^/73d\SQeS_=S<(-+9G)0T;U0TRcY+JD0
gbCNeG1?-5Y^WNgObY,Y/KC=I-]/<><JE#aVVQ(@aR8fI5eEIf0]QbR,eb@cb1A@
P\>gA:@W0(_=1@dXd7_KB4,50P:RAfXbFSNcO0abc,Jf(^EJMfP8#T#^HOS4f5S,
VZ4.\2#^ELcS_H[Cd[W/55P,;3(I3MVDQ7[K;;NSE?g#aSKTSER\g\[\VA9AS970
ZBVa,14]3UR)]H0^@YcAg,+RS+YGK.OB?UBC1Z.Z1:V<B]]LcN0WWS./&.f;C?MR
cfa66]/:+H4[^ZcRT:M-f\O]Rb,,N,SPY,2J>ZRBE+IIM59JI)HL[75V^Q>)I:JJ
AQ#eC,gB=F8Y+14E[SefB3OO\KBJYN2E);OL4PHT[2H@BABZR4-FWYf)BU/ONfNW
8R\5c&GaKF9QDM,4W8B4DGL_)c=[L;f.>QcD&<W71?Z:MT3(ED_B+8VeQ?8c(W4Z
3T[U2Z-I/Z&8cOa9\1GL)/8.U5cbcdGUMfF5Jd+#+MF<D,8[bWTK/JA]Y5N=-5<8
TcR?)X3fS1Scf2&bO0Fc)IO[9Y,1:[LT-6?G]W/e0(K0N;P)Of@X/1E9P7PH^,8\
-c\2:3fIX)/9QXcY7<dO,[.=G-BESWRA^:GH]729;:M39#]Lb8\:LU/JZ>JO]O-4
&+ETVJc20.HG8U^]#UVE@D?95/\3/T?SXTE,])<(0#E-[IQ0IZ[Y[1VHg7[Eg_.L
QAN5.\0:IUF#dJ?98\3N-ZDH((cE;5fJ_/1R-9R6JV7A]e/P>fM,RBgOG/IE/YN&
GU5H53eJ?861?BUV\ZO5<\#.AR&\BE\U>K4-V>GbL#L3=@DO2Z1)Z+LTO>eD^=gM
HfK4eN5L;Ed0VL?:0L,@Vd9BdA#NC[?31I>\J[Ub0<GT&JOHa9VYS^0]OXFCcN8G
bH?We;:MfAceANb-(b==#g)6O1^Q:]MXJBgW:>f^=F?g;=Sa=Re[H<PS9^4.Y2K2
FV+^#-6(>>_7F8L_a=+L3Cf;]-;+7IIAI?0\[R5LC[&P(_.OdCEA4)9e_>MZ;ZAA
I,>f\:EDC]&RPB^6g3J8X,[#bI/FP-VQ4_gg/:.I+Z\>:MIE0d4ba:,FVP15<0Ob
8DQMM&KL3cT>DB9-2ZJ?+L2GI(#8&;@U\+/P>cLd2b#.Y@,Tb/c_;8.MfG<#@)ca
3agZ54#WZ356E7=QK@J]T?M/+852c\68S1CL]Oa84D1H0VR6Z7C4QX<_QI09A8J[
Z^+c^HS(<)BS4C9V3WB#4HJ(U8)\&T4A_:SJg>fX/GaeX\F8\176THc^eWQ6c@/-
X7GN:SC8#?-G1;Z_Ja\6<0g<-QL-)G(8C(8Z^^:PV@CS/NEVNg,>H+,7L<4&YMNd
XN?^)N5)3[VZFf,],62=WA/\B2N.CLg<=Dg5aFDP25Z2)P58E>g]aSG#=6-D>7<Q
SgQdFN/_UW[9\@TPd\P33-bTHbU]4M#]b+0D?S.>:L1^(fU.a\I&]T\O=PI?f3Jb
QFD/JBKOM,O@389?K7N9=<6A48fA86dBT4ddXcXK)1T7NL^VdfTWTVV9Le9VcMA[
WIKaBSBZ307GU8;2&+3]>aNS:(HAY,0<M<V4^dR.98,A9VQ&L)Q6I7CaD_LT/+S7
S=9P^V6SB3&UN7L.X=/5URW/;W/@,2#0)HBW/b;^&JO01IAMQ8QNDW4g_&2)#d)[
W/I4Q>BL,<3LJ+(8f>];X8C0:HTE_/_5DG,Z>-JcV(0\JFeJN^,7GKNZ;63RZEP[
TA[#<gPCC7;cKZ9g&T/6Q?-][/RCf@.4O97,]@=#:IC\c>^F8(eVbD,NK>YLC,P9
_.I75;?KK0R^@S3-Qc8L?5S4QY_\gR2C)KSYaYK^JWZN):,M5Z^N61ISK5FFUW#J
K3LP4,MN</QSd[3dN.b_e.B@LeY2]4F\K&X<@0#e42TeLQdAN5b3\5LEe<2d-(Q6
I8B1J^GZ9M4geH\=,<X..A;-4^IN<M>GYcQ+SFZYR8(SM+/LQNVf<T/3_-T])&W.
(T12bUOdc33YKC4&Cb39C4([X(MM=b&@:9eK3M/\+I?[B,:b3LeGSJ&9@:X.TD&:
E]V@+2OW+c77O,D53_eXR##Q2JU[EaD[SIe>NZX61/Y6E/N:Q@YWG8J(<0UR9F\U
+1-&PTPRY.BM^A3>5e(,VB[KBK/X9a]M]X<&-FV_./,#.aGYCb1IHJN\6GObX^_f
#]50A0g+Z@KG5/Ue81]T#7_\@N6#LGSd]CILMaIBN<G?UX_?dS@-a+Eg]c@?--,,
@RG2]?=W]Q,XGOHg=]A+]aSAQ0LD8:NG/Mf.+::[+]NFB>g&L?e3OEH6XMC@D)8c
F2L@Y[GQ4;Y4&4WRR27Q(<Z(eUQTPYaH<H_eKU43-d]?O;WfRVb_)ZF-P[Y4:G\g
Y<&3ZJ@<-,QLfYAV=[\R@a#AS>Cg5Mc_e0:Z0&OE<-G#=.24EGB/U;6QD.K.Z_M/
+7X:0(c@e+^eG7OM:6f<7g;)L4_McP3@2:,a7&c.ccBBTR6(4FC695Bc[FJ1FPU/
9>#7-Nf/9NUMJfa6g1&>:CKK?8M)1)_B)1FI1/YeCPJW[RMfTTb&D?a95OXT\8>3
fRcGY/4;8egW5F4gRdW@H5&HR^bR#+PgE4fa<7R(,NTJ/IY/5V]K?&CEAO8+EU94
WX[Ee>4:L.Q6<RTbHOWa2?f2W#M:T[([ORM#^eRI9SP^Z#gY6J,A82S;A0cZL/;D
J/9AIAZH:<B=Y^^d:WU0V&Wa@PI&\49VIBMag2<JC/D;<8M;,G#X[MTF[([CJ<e8
;D/(aNCJ/,7S-g-e)1d=YI\+8a:=R3cc\S,.Z6(a=9C11EEUS=[X9.UGcAgfffBQ
c2<_\?]H:@TMGTAfN7)?^<GTZ_RAJ;3OOEf(SVS=5(f5?W;ZVA6BaJ+-)77X2O]2
6Dg/)H0C9S<NT55H[53^#/I(&0[3.N(,f(S6VI/&+KEZ+a^b.H+Y)P&L7+H;PEM9
?.dAf4-]U]S#Q]1eLNLgbA+?Pd@2)U)ZeN=g[&0;7&4MgY9,[&6SbJ;<X5Wa+T.L
-^RN,]9;ARdGbNAeZc1>5(:/bgMJd_RZLdA)?\>#aG?)3R71OTE>_\I^_>J:;We1
+7fC032D:b9AWdIbZ7/c&DK-6E(T56<d.Y?77YF79GZ>D_:5fSK77=Pg.@)WMO_e
H5528#AWQ3b47#3/FZc4,&B]D3U;d)DM)@22[1;4YO_Q6;2+19_eUF3)>G6&9BO9
gF<F>^0GFYYOf^F#VX]K3>RLS:_g+GKf2c;5CgD\>9QWXO/eNNRf6&=\ZM)Z>Hg2
f)5gc]Q<WWPJ)=(_fS@#RJ;/4FY;.P85/_:E_)_W\DSD4ZAE71@=f#>;bAg;bS/U
L.5R^+-)#<VaZ&5XJ]BHSfJKJPF<SVSI+DeU9@-b(Y++VB(2;:\<ITH.e)WPJTb/
J/0-8>aY3M5_K3C87Q/?/R_[>/&IL0G8MfGOe3cDRE>dWa0T02g5/8.EQ7>KeNA4
+/KA>D3;TN,U&.#Dad@cdR76HfM0e#6^MNI5gMc1Dc^ba&]+<7/VfG0JBY0P.+A>
-?1&JQ,:gS3+(P73)^bI[X_Qc;\<LC@Obf^I/Q.(Z[H<@bI.^e4aLXU&7AU6b4LW
_>H.N\6b3GSHV,YIeHOL+BKXL:5#O:/3#I2JX3]G7P<FZY&P-I.;=C)W\UC6<+8[
>eJAaAYJ[B6><F=WDBY]9#</E<84T.=Of/W/eF9&bZR:UdHZYKPP@;DGPO_N:IU7
;N82[PVB?^fV<G2\E&XEB/OHQgDW.BY[P+NW)RS2&WBJB#eE>[/S;Zda2)<@EYc[
/T^8J]H^R@1QSX?GaR^8\FVg;0TdJ#YK8K7X]VWb/+aPg=,K9D27[__eZ?Za:Z1C
L4)5O:C@19-U2+,KTgeg45^SOB6<J&Z2GR@(66.[9F8+,B?O[EX7KA>L;b@[Z9fK
LCb]6M+S\>TT(PW3DKGK:CNUI#/GYe;FY)N9+C7\\K+>RHCDb:Qg&Z1&gPEFP0Z6
#9L7X(13:fX7C,f+5QTVJ<3P>?]]37b]ab8fb1T2.\\ZCRINQM3c-Y@O)N9[T,(G
>74W/d&fF0JD>Jc;5d@YB&#J_OV.QIe+G;P,2e>+LG\fZ-,6]&/9@EIJCHT;E1DJ
15=\1CNS49(.QZg-Y:[9]=,b7#_fbTZ[+67IN<2DVQ=:-B9EeFa<aJKcdD1ZZKbS
=QGYUB0\:A^W[@G&8R0@0U/29_M?a;IQFa]UXeG[N+NfGJ&Ge@e&#];_Y2D48,O9
Xd^6]K3GDO1XB[GN7<)QI[KbBZ]G;>a-\3[BSXW?^gN>aZ=AJWHb+K<<RJUP>2cM
99=8;_@=WD&##;O#gdLb<)E#Mc)P8)5W2c7e782I/R>S\PP6L[5KF7-UeQ7R)H]c
=^K6aU3,C&\FVe?2_^QPS[40Vd-1/M96eE=S1LL.c+6eV33He4cQ6/#6S>Q;(AHM
E,D@YGR&5[+1/Se)8S(?\1>-\UcU8[65QUa>IBBGT7edZPcW5>&[(F?B35bH^Zgb
<9MF=XLbIa73Uc1J#P3a;X>bM</V.)adeJ>UcaMT.MWb#BEFB74N9(AORB0/_<S@
<X>gJ&UfGC[b#UEeL35]#e8&;OW@/\G/6RYf0BK4J:gcZER6J[O-AM[BU6FPGY0E
[IUc3+Q+8YZLf3IO;\,L67-)ePA1@CM5F#eRN,J06<4b8D1\4\UY-G:55?<[IP+#
1AJ3W9e+C^4c[0.?NB/A@\BeO@8[@#]KYE[>1^V_14V+bG=V;MPWT2O[ZI),>aVX
I12,>W6MccTA[cH#TCT56U:fc8a]J7U3?A&a\;;^0D=A[;XJPN02HY1K0-91VJMb
2(1Cb0.dQMVbB=ZH]R+&gR).bH)Q9;5_^7F>1<LU(3E#;1#/d(feC_&0@&Agc[N^
05Ae,c3O#a#;GRecK2&G+I4,O\,YQTaf22G_7R?DNb+^?<G1QNBQ((N,AMSe76,g
Qec+P\[0BDO^X^W2]d7=8O<cNHgdDDLP&X,C+E?fPFJa)c8-M1WAa@P/55dO:RG<
N4I.^I,;U(OTeT_VJ2A;E(FT0[>KUaLN[WMTFI[g^&^94M\9;W_7^OA;6?SKUOa&
BJWXK(CWR09R,C5VINa;DCGZPEd0+WJ&-+_FM]2AFH4ICX57=f9_>DA(_[cAEG7E
R=5RBS5GO=V-fA\TESO]_GV..&9,9H[_aMaf-BAP^5IA_Sa,H#RXZWNGQ,>TFGE.
cg,-J=b1JYP]J1Q<U(0W-3P9DZVG-96(Sf6>.4:GL[fQ.beQ8K^[EQ(a5P<bDccZ
9fM3[+J90Qg9O#);SO3/X3IS<M)a<&#,0(W-_:V=.)J]P[1)ZPV,?ZbTFFL[RA.X
Sd8Q;9N=P\,eK/:6GcYPPNDHKJIX\Dea7>0KUcC0WfFAdGE5&2Ea1B>T9B.[VOc;
XG,b+=N^HM;f]R(?T1bCA7[[L9PDZ5_?#.EZ[857I4DK1defM-VAMD2+<0IV:X^+
?2KeV7b3LF(7B=ZHc<(#3GcXQUSa&6N&f/@)+@I@/MJV+LN[b2^X/&cf,1VcM-M[
WY783/?a^X4N,X^I-\1),0CQEWOZ]#_&#[e4]a6OKI:Yde#=?>fFI;NG#&XZT(OO
Pa>e29O6T[fT-&bDdN2\g_ZSOe7b^]&FBEU)QLb>E25R,&c>=@98]6beSVefXYgQ
(HN2;@32S6dF/.3VMPVCZOR)NRP7JBTM.QN\R#@H_XE]])NKdW:e@8;46c\,-M45
WWJH&7\.]LRX@7F<PZE3C#+.d;,A9.fUE).c6L/?=H@32=K?>JD1(HAW(^-4(\7I
KXZ)B[>65Se/:g5d](ZUd1B44T/a6=LdBROgW&[eZHH38gK@P:WQH3<7XfAbJ7;[
[.I?^T=Za=9TTQW4S0Fd+;1U)=]_[,TV_5VZ;bV4Y32g=]eSCQ=DX82W]T?ZELe_
N.0Cg\](GHWW\eO\0;)dRg><0NS@;]J&<1I9?@U]PH(MUdNL6J0-J<J8.&dZKfc\
\E-HJM56GPSPDU&ZBe_0676/[TU4\F,Hd5ec/UfK0TWeLF9AIX\>@BaHXe/&>bgD
S\5EJ^^/QJS,Sb4<.:F+&Z7c<@)a+.cQ+>,TGY:Y;A(-;=P0-O)=PQIFSK4);c1c
X3I_bY1/;U>C64-418agVfC\[NV^M3+L7aE8XfNT9ab<L2J-QYNZag&T&R5<YW-&
]&7OHGaWNE&=WME+8)AHV0H6]H(FS\E7^gKgW:ZBD-bR,caBQ(8,(8,b[++&da97
>J@98A5R13d>-V_7H.:.W\-\L1;6/@@TN&2cRU\aK/0LR:K?7-+fB:ML0a]L<Og4
/D;4YUD-.]:I)KK+-a9PR\HDR\+[fV05[..UYZPcbb\dO,CeSBWD_#FT]LM[6QE,
5HB)H2Q^-S4AM>+XLN(8HO^EW-.QIW9JN)+ZMP\F2G@+/21UMGISaS-c^;7K?O/[
Vd#V0OQL5F7YO5g>Rc<_a>6\e6DJ>61HEg>=W.[:0N<[\a)GQHI(/<P>/QZO^=>/
OI(<C1V+5cUK&;FOJ(LcFQB=;D0XJ8@7^=IbbcKSN7N;a/L6).@@\^\-VZ1OTU)b
8?9L(N(,a8LXVF@L0+M8b</R4HTGL\ME8YZ(/8X7HD_I+JA\FPAAN\?:Ue-4eR,S
8K#GD]-1,/)8Ne>C29]E+AG#00e2S9bAe5:LP4aI;NGGO,1JUJA7O3]Se_Qc+W5=
MQRG4HN^6VDfUN(g23^>1VPA&(X<@4/XB]@)#1K;f0.1gR.<DC4-<7FB&23TFeJ5
DIHgYRJ[]^;U+T.Y-_Q/JX#2.6SeW2F]A]:eRSg>04U__]I640+7JC2?]^K-dY2;
O4@_@.S_BP[LaX(Pg2_)_(fVAM:c^a(K6/[3CRd3H-,KNH=R026(-PTDOVT/WV>)
2V6T8BFWaD+_W7T_JL#(\Cb</29E6bPS=>g.?HGBa\39dKHA18SNDA((RO&<RG\9
=F=EagfQ(O9c,P(>BB:@04H?fac&GG@A)[E84?M#d\L,bSWB](XX>+@0<,-YD61P
:M8/\94/Ud(&]CMH\<#>1<I01XCQ9X3/H^VYU,.Y_++>Vb\JSH-VFFPg(e(2a,M)
U@KZ3H;9BV1@9>[UQGGKeb6><9b@[8>R^.@]JRZ-^=LeYCVI#dDbJTAe;U[EaKFc
0NM@adBbe+-A]ff[K^KNKf6GP7XQXfGgGDWEBf=;MN/f4X;QfWd>_+Be^(#R]R]6
3Y.K3=?g,6905c<aYQKB+4AaGMB-PL.YX(=2\MSA^8K-E4RDCacV5:^0XS[TZY86
7W6UK0DMU0g,XC;OLY:VC@<XYUe2dL#)e(KcMX]dX\<AaN63+(Ad5@FLBR,a=FWJ
D,F#bZ),3/@1U93[\M0O8>bZ6-fZL5F^XQ;?IU_8Pag9#?4VcKdTO^&<T(bPfG_M
f[<;XAR5ReCPLFe8)U,;05d4H+_B@(<JbR7OZF5#9ZGd]XaW+EC<W:.fPF7M#]KO
)Y2^9KccJU>B?QYWE[ZBdW[JKA+\UU@&^Z9G624/+&=F),CY8_@EPQ4RDA(bERMV
V1_gUJ5:>GP[+UP43VPS,H5K6&F)ECb,C<1[(W:CQdT1<XJQc0bNC&1GY.0;45(Y
aR3Y)-^=P0eV/W[MBRDUHL&9:@P.>Xb<d25P-A2LD]ZT7^-cBPIfHH.IHAO>,?K7
J74OCM(;EZ8VNY]I&I70Q+MbVYVX.WN]?bMJYY4dKdU\Z<GEZI4S/EbB+&RW&HCD
&Se3ba.^:fPV_Yd,X0K-FgST^R,>/KL1<+^69NHJ.;N0[OZfBR7NRNKgHafO.1eJ
&QGcdT_OIEP<VbF.F0aV])<e=[)b+CcK-c9AMHT_ScfUQ//-5/J1d\M\XLG,&JC&
ED?=HI_Q.O:Ra,E:S109fSP8+]d4ed;N(IXZN@J(;=d+4:<L]4O?aDOOZ=YQ\gX:
J]^0\N)?c/4Bg4aSgN^7.9OKWB7a(fJ],8:.8d<N1Id=;9aL9#g3?3:&0;^_#4[R
LO[c#dXW&E1[A4GLW8>;Y40BIQT@.4WUPV43ECW-CA=d:GdO62FC_J60e_L[JU9]
\U.aK;7I:_)R\Ve1A@W@.UX4-\G9g_<B\IZ2f>97J.^]]S&g5f7L0GC.:GPJ.OT&
X_V1OHKe+CaJc;;:OZD.;ANMPBfCB)C5@&RT(-/OF&c+7/Y0@fG0_(7_fC5+S0f+
MS]HRH1Yg8e^^Q6-/@-?bSUWUcf[H6Je]4,CS&@eaE<BQ-M[97@J\M]#?LI^@5QO
J2Ca]F@b2&H;gYKOI<Vd=]Lfa>K_Uc@Y5Wg]<;[/.;I5(:VPc7e<TNQ\5&/FM:Nd
6dPMM7U8DdW-2F:UDcX71I(DbGK.bF-:>M([fH?_]=9aXaCbV\KAKMf43MCf&b=(
4E8P([@JTR_)bH&&U&K-XHbK;bX3U=f1FV0Ba30bE+4\Id\,EH?9YBU&,8I>^;@Z
)Z#0/H#HTY#&X]-fD1GRbJV6;6:N]TU1E-+eDVUCbW@-)f(IcS3N-#02adgAR2:f
_O#9L+E,ReTPINdgP)Q4f222=2OTZ1;.;Nf.?[e^BJ/eX3U<V>eLLJ\S,+OFI,RP
_<e(dHb4dK:VfZYPJb(J7K/+W,L:Z7J>OL^0I<R]eF(THbD\?1Bc&]#cg2,E]eKV
JWCe84GTYC:S+JPY8f2D?AB>TD61\-.gFIUIW?DMEeG9GG0GK+_+JZW1cF^8EF1X
,SBW_Q.HEPAD+Ia#e[][+3_]#XMEWf=aaTHBK]-L)ddNGU^D6MW4FCN7A3&T,H6>
J1fCa8S=GBYc7BI>ERL)1(R=(Y#O4f3.?g^:J]^3b,4#]#S=IPFZ<X2NUa\/C[1O
ZPgRX^6JQ7?+ZN6R,1LDe:2FF<eGU9Ha@\^JH2YQ@9X&Kc9RPf8JMYUd.F;&95P]
3&MR4F=@J-6:E(&P&E)CRM;A2YVVJM>T,@E09EZK-f&4BRc(=8;_9[PNCK@-(a#S
E0;T>+bZ)c6F6Je#15bU&=#7K6B<aZ)Sg#@?5UNT7U:+@FWPd\Bb-5V9?[B6dT4Y
(5fTg@?WHa\-N8X[I7bA9JCJe[a0,2]4N[^L,U7OMQR.a:;&=<\>-&2J(U2N3/?T
-3S]SE8XcU)DZB;\G(=.d@gQMYJ#W3)>b&;ge0?-W]&6dK1)XZ#bc,/X[B:0Z;I5
_2B[4WF@C=AWHE2Sb2(Fd>D)3NU97CSG0b3@W3fE.2L8;#/QGScT\Y;C.)<1V\6O
)b7X[<CWA34;>a(M@.g0]PYJ:R_75L-)-5PJ?33Bcg<cOE((/\(V3[S=?d7#+E_#
U48VR1f-ACQ=<Y_XD)a02@e)WK&1DJ?8=PP0?V;0:+H]]Ld<Z)3^?V[b6-S2W18b
W9NIPG3B+901ML>7f1+^;^R<aWBX+4T-R6a/HS/?-BZ1_0BN1T7G6cSH=ZY3JF(]
D/&[M>OT?YD9fW>)a&QG3G#=1;Y\[.Aeg970LVZU+H4N@Y<0/41DI^/g5)PX7S,g
NK<OW=O.\Z,CE4Zd9eTMgc5WS-18G?4G&J2XcCd>Y\MEXXNA#3fb=JR8f3)6]4-N
Q4c(XT1eAODLd<^H(9ebe?U,2H6gNeD0gY2XVT6GTTPLHL05NL#YV/aE&4(e[]7e
2Y?XM];CNdH1g5eC.4JQ>dW2[T29N3#GW\Pd>FC830(=Mf/gGV5aN/L53J-E=];Y
#[Dd@Z8Z6aU]00CUPNT(gM>OFa[d=?5dKc,4Z[IMJ-.ZFRH\81MWG&23AK=U.?f4
>-.MV@UZ_&KgUG(8_PH=CG(L^:RO8KLd.2bc>.GC[\-XT1=LKBYa)75DN5_,I7J;
Y3[:\4b#7XaBFL]BcZ_+/BaW8#\9XA8P@TX,NeJ1X=Bd_1J)\;NK<CBEA9,OQ,Fg
R[WG#T_,1F^Q0SYgVQQ,H5:(GFRBU1X7\[IOZ_S,bWDN_WEbIg]J_E9+?Ed>L&>P
13=;)d=_6L6&3H19AXI8\O3^K65[+A3GGFDEd:GDIDaOa&Ybe;ZBg=T?8Ke8)NH@
PYUe\LZF1Cg;b81+N6+7O_aFK@H[I_Z>?+3(J,2PID(f+ZV:SbdK>N.7N88S[DZ6
XL92F:@g:JW6:8]F_;1S]N2P8Lg+-LY)<.@]D41:UIadAU0/(D60OV&D)-GK4Re1
W^C9I^CKV?+dXRI1=:JFRSc_1KFKD+gX./SWf)/dHG,5[VV8PR=17]OPW4Y=]N?1
14_+dgQ0Z.TUOB;448:;A4NF=bNQ//5W]-3F(S)dFE4SH.<feX<H)gffKLY,0ZT8
LR(R;[:91_G:BP_C2&S-5HL738Z+4X/aUK67;Wc5fOBV:P[0R8)CFdT\8L,^R\cH
QF56>F_bUT8aR;T=E9K[cfa@A^;=a;SV_DKFW:^a4E?-bI/MYHfYKGTE+V_#fXY>
)5_4BZ/7@<M;,R<,2[QWYS-=?8EGL])G>),JE>41R>H:0_FJ@CeQEVQ##gKKa@R>
VOQA5Xc99VVHU,Z&;\&FJXASH2D1U>d9HT7(]GD+IgJ=L]PFa>c[[:[Y&MT=H^;#
\=-1S4Q@09X<A7XRZF\8(>1#@F7gb4=PUHHM>47J41,RF@c08g;T:dCMF8^0&-M)
;FEcg3e2B\DZG#8TH?H8\b\F2M,)0EVMV\NPIeX2a1K5FWaa_QZKa@b9,]7>FAIB
)Z3]gf3I(9bDZ-,V8K,dH(D:5&=.Y_(YE@QYR(&cZ+XF@V&ba1gG^eH7:W/;He;I
^\,9QCG(.DK(09RNb<3A6VXMB@Ab,PC^.R5)>BZD_4::627CH/RcVW=,4W4X^DMI
2UQG,WR7_@-YWIZEO07VL<E=d975/HWZXaKI\#;1LR@YS0NFR60:B3GI(7A3VTFS
6Q10bg:X3A3ddTLCCH9R_3@<<I]1+\[_M2Y4+DbW2V#LGSV8(X5OH\3MT\M<J\\)
;F6A;CN.ED-Y080:gJ]#W[E^9(VccY5Ne(<L)?VJB2WefB+VY.DAN/N_KS<dT5_L
3cIW\_/#4]3gS7_,=B=^5b(GRGOXQMPbT/c@[:D),_Zf\+_+4<B6EQ?\\Z>)6-@d
=TV;LVUa25(Mg-[U>\J_XK2fNg]^,J7_@,,,d==]bgEAN>,]_O2e)I6a3JPPXL72
KK2F&K,2bS5c0UTCL39cM4<(++/&#&N=V&&be>V##Of>A6B&Ga<.;+FBA/<[DA0L
\TfY\fEN7<<^/H0<:ea#Jd,^XGE0L.g;b.HB?[R1c^7<_LPOUbNbd0.>8\)DL(#A
4MG<aJ-5Dg1N#g;:QJ:dQ:,2M3D@:gdfP3-:UO<+[eX;CR4bW,8,2-ZF&W2<e6M1
(F_.=+KEA(7F4(6=A5J8Se)UWaK&bVJYKbH&>8/(+a&)6K:,JL__UUfGSd_UT,\R
TF+4K+1)=8+;fb&](4g?F<BMd^&.=ReMXa/?:\R1V44\ZZ3GJ[F6gc@bWJX8#E7I
MXB.J?^YZ@R8d;#;BV(_IX-1Y&\SDbOSf_N517(aYY:0bJ=19XVE@].4aaK]E+I7
Z2P(ULc:NV>?_9<E<;?FB-VBZU1<X#]2K4K[7,NRMH_\..GLd]cX8]8PNE30A1ZP
f;ELT>CVWaEcf;5E^Y[G>b(@>Wf5#9^;LW])]#afATO)GfK&1.P20F(J9:V0SfgH
FAaG5T-9[_S:5EK9VEPb^.>TV8\,6eS(?/]KNS(aED-PV)aCeU&C6V0SIX65](<;
Y9(OC:;/#Q..+MN;7@G+_cC[K_/a76\OQ;A3@RBM8^GHO>N@+H[>g7bP:.?WN7@@
I-dE:#8R?,>,2F=N[]Q[NYTKVT.FWaIGXP+IdHWaJ+L?LdC_VZLS3IQTSad&CMMd
Sc;KE(J<P=ZUOGQ,7R7_9R:MGKTH1Q85),6-de(RP)YF.1;ffB6B8CR(d-S?eG9W
=/E.4Wc@[_QJ8@0P11Z(f>HL+g4DfV\aXC6&bN[GSWf4T03Z\QHANJ9>7e\FQTU7
g08[3K5AMW0M1b54)K@,e)SS[:5a-UBH#_I^e@Hc>F=Jb5N>XgVPP[]P7Q_LHB.+
DUS46&D:U2=ZK_0#]RKALK^8,Dc\B=\eM8ATDRI1]eTU[SEC>6(;JFQ:2^0)\2Xe
S5B#F&[Hd,f(Pe@MF>U;7Fd0bCNJHTDQeNXX2;CZdZgBARV0SC](d2FQbYN6/\9e
_=\c2G7.\ER]egF+YG,5Wc^[5F(=ITM(;;MV(8_YeQ1\eI3F_,?##Kf50MegHI/<
PKUSIfAJU5-.SBN)QK>V=W-_&Ief[KT8H)KTUc6W,6RG#(5Gb&S>WWFY+J<,5=2+
c_=58<?1#)45a0Z+?AP-J8IZ_D<bbb<1KUV>3OGb&52QNa<QE(?C::4BMRSZaN4a
CRS<>@SLfff:X)CM^&6ETZAI4U(J0gEFUL=-)IgQ,fH+(FP62/+0T4J0>9.74OGa
\Ie8YS12RQ?6(&4]c1)PNZ/=@4T55CW3E?&C.#,344edc,]@[L<gL80Ycd(Z7.\)
(@?LWX0a+gUVQTJ^cO)fJ@Vc541Pa7=b;LB;2+]#RZd30;6X+-BYA(4#DL;d8]0V
O&e\3DfKX25?8I=NY-J<2]O@P^P,d[TV4^a]D<+c47[3dQQHV3#Y)[J3:-OISF0<
D2SE_K-C\Z5K<K&)e_<d:_S?C<C_I3MZ,IX:6gd8@UB^9/64T7V\@>3a7fFB/\WI
Ra[;+MN?7=WA3.X[/S@3e7dQFN.LN///1/B/+DN6cDMD=&>f[Vf4X>F3/S;Ie1a&
-0_(P+,fOCR7-OeeRa.d<DX-KGZW85MRR]@8^L5Z^U?0,#II0?5aEaPTPf5/LFR/
&KDPTOJ3V>MXKWgS4>MNZ8O,RY-BH[F93=3-M.E5X^4(XV:M(S43X]bA@HF_G<MV
2XR[a:HRdTO99N^+NB<>U#H]LT<02d)MLMFV70Vf^M_b1L;OB\).F(bb(7gG2_CY
+eDg)U0;T#5<&-Od<H=U5c2OdC2JJOAARVQBfa^#H?dY3(E(]4U]<8A98^GOO57Y
@@U;UR:T;YLPYg4J]e9a[M9MX&7((1\a7;(c]QY>)?5&U0D;eVQ:H2f6C/G;]D[K
Gg<?d#X&J\R#)I&.UJaT4Mf6NLV-\P57XHRCZPRJ@>.Mgfa3+GgJ<0=#U:(X4](F
P)FAGdgW6A0?Zb[JXQ.cg/cEZ)fK:aD17);dF0b)G\bS)^8[23\]F7B;53)A,:?9
KW=6LeX.g.4FXNUTf.J=_af6W.bA)#c8ZIAFL1U?/Nf)f<g46=M;Y#H:g<.A179T
P;(eX7AR?/VH&[IdSEcW25J@ADMD[8/MYOSG:&VTP]aDU#,N:&bEZ[Z4[?ZT4,0?
<d4N)KI/M:f[\AR^e4NMO[+-\g1R]&V.=+/DAC\9Hd:OU]V<\e]50d4L]Pg02AK3
<I?/_]BPeHN&#0aE7SQD_YadbF/KF/TdA\[B:&06b/OAfZ^:4EHS;AG6UeeMVQ,L
O43WZ0I\7Qc8;5^--0CaG_B@gDZ).8V,bO4d7=NBd3BP75[>5#\?gK3eO)B76-8:
g&/dKYSUW;cQ]0M_c=?5VYL4Z4Y3Q)^=FD/DRTO#:=J;MBPV^M@.3(ZcX[@c#S96
<Y+b>RN-8J]ed/L<.fAOU8V0OSQQIE];=^eRWI9U297VVVQf.MdUN:B61cZ+U^.T
5/&Q8>B;<5;BXM,6ReX8M.Zf@EV0#@0Y,A/W/;[TBd(PTgW@(JX7E;JX.T+GC]NO
OV:(bR,@K0UD#\X1^e)[MAe;JcJ<5A4A?^a@]14K6X?_.&RCI/b;(P,51d>dME<I
^QBCGdc5O+S01O2P46/QMR;2RNe5b;0:8547<ZGF.[WdI]4aP6(I4/8dA^[CCJ12
eRIPGGKGOJYT^8c[02#UfD]:J@)Pc]&O.DZEdUWMb-X<M#R]ENL1ICPDbd]f^HLP
;\bUQ\QHE7B[1QN476K+<@UN]a4UZ#<-IGB?O-WeSX-07(YE^agN2g8QU?@2d3:0
^ZAG3^/Qb;]?:ZeDBZ&6.5M+BL/[2R7^J4E,VZCd,8Z#WM;EK#Z5P;-Y8:-TOE=)
=QJ1U]-:Ce<1>2BfcT.3_&Ma;F1bYAaOTNS,TBX,6K68EWcW>IcE/dG1>(\#8c#M
(K-4S\]/K)5H]aN]\Q\ON.NI9UJ?W@>VC[F>Oae+.>KHTBFZF#gHNd)5,_6-[+39
<Na_>RNV]B_=2]-Y)6MFSeKfL)CV)9++0U_2c<A:J];cN;G_bY?1[&5Hd[+-fIZU
KHYcI5R_K/7GXV.^UDI1:G=6ba?,8-ZPQ&X8JDU4SP32OYXdPKd>5+WP?EHFF]R0
6(N[/TOc_HVM(@X)(&AF&T#87/4^176\Xe)XeS:@G.++F])^7.6=OR[>=<7P@K/c
&K3N;Af;PS\^eaMBCK^AJCRfeKVV5JLb-LG2MIdfSJaES4AeC/3#7]/NRV8Y+#?e
6,1Bde@AVU=TGDP0X+,Z>:,b@1gH)_-GJ6D\\48Y3.]@[HQ[F]LAQd6[AR@EPZ?,
[BS4IIP_EgcSF0[2G,QIHHTbBZT-Kc[L]RBU=\6db@e.J1U9>Z;A3FB=b58FfS:&
</IK;?SJ9@H7YdR8egHY;CSUG/aG.d?0VNDeRAUU4-@FF7)N-<_SQ+I=#Y,eRHEE
^\NP+c@.V0]g)#eQ8W[^[.3UYgHU0@^#TP<f&DBXQfddbLQA,K[E&VS2ZRfO7?S.
)+@M2G^S>gF3::=NM@6KOQ02UNEADa,,5.CN(T4_c/&&FCF>>?RTH9NL(Nc15_82
]HX&1/VGS2/+Q9#JTcZ=6#IF(,XfPE\^&fK.PO2,SA)IV]#1XYQYEX^,\T&:V+7G
L3[G(8?<.:AU/>]-9<24T;Z6?SB#=]SUdB:.cKZ]KS[<3f\4\_I_ZRCRdP9/.]E8
&,<:+4Y7]B0(CDQLP_51DFF]KPHIELJC9DQJ\5R4Q7-&X)#)O?Je7LD9(/A1d:]E
E.^Va?VN90[LOb#9bbgXLSY<W&f.:,-_&],G)FR82G[XKQ6:<_J]@,=O^?1NX^H6
05Z9dc0aQ@V#JTI[-:3+(#YQg.I^JPU<cHI?T#@aMHY)cMZUIV_E<WFa(2T+<S,F
/cH\^59[/_c>Y6VY/:[3\D+]_U3ff@PbD\(E)<CcOJ)6&0D;,7;1.><ELYS\8IH]
?4Z[2?.Q-[ULN3aANd>bR730aOA3XfCd6>^@2[cQRGCV3)+BSb2ZAHa0e]B^a#7d
?.O#/>VZ<5cf1:a&[=DV6]+5ADKML2f3Y.c+@0^C.25cE@JO&<LbYQI7(I&Xb1CV
df(g=0U&bW_^F.X5:#._]IEW^SYMC&d[6.MM=#3+EI1d#eJ>;^(+fRGAQ.QJ#F0)
Y#Z,N;DY@[C([aWHLAaIVQaHf?YZ6QR7\/58e&,^QZ(gY-Vd50D[08dKdN1fH:7T
R]YUCJ]E>&)OE:;:7RXC1)OD;Y_?ZTMD]TT&a[SBffM[S2-5M01<L8@?..Q_RAP6
MQ+NIU#LV4/ULY1YWeF#;\R/B<Y/:\I\WCRKOXEN(#9+OH.S+LB&P.>bCd-eTTCK
X9Cf316A#dO2;TaO_SKIdd<Cb#/+J[XCCT<g(g[be1CKgC@?VR&)Z-V\WfSHU>&9
)@@JgA&eCOa&#F(#VQC6?HJKVXX[9XW11A4?P3>1EJ^6(.NOC,SLQDMcRGgXWf0R
9X;?C1+&.MdcI9FW.B/25N\(=-(e04L1aa==23->S5cA&Kc8LA8;F?.?9Y.8/VC5
27+f/7#[.4ZZ.f_(\GCV6Lg]B(c]VMJF6e2WK?NUM]fU.fXIQFF<?N>E+@,5,OGK
48H]d-XM;59./.EDg0\@Z=EYXBW;#/a63afV<(AK,9]I+,2bX,=;C_W]c#==V_(>
;P0\F6<ZZQF;O)&DQ?R(aUTP3+9(&,6S#K=4/KO=HH@H\?U:2V0fYW35dY1[[SV+
a_Z,;00[Pe+A#F/94^b-e>aEB4U<)G/;4,6S@f;M89e<cCK>Q([6cA+(OS[T+,@e
\Q)8\-bC?:Db5VUZ0\_6724,b)L]-<=&5A&ZdGM@>152e8QI-G(gW]UZM<S</2]>
X3/9I]:AJ^RU9DDC.J^aZDf/WQ_.7D.6XL5Aa),6R=W9@P=,9<>\TYg9,aZMYZ,a
EW]392bHX[;.(4Z0/Z\-:-<T282Q0(#cb@#DHW=Q<+-D)KW>-,#>F6IWAfTHX#XV
@@#af8NH(<5P&XD7Sc;8YYLb/Y7OTfEPc5c6H2QU05D7[^/NF>K7:\^(e7U;FGEQ
^23&I)P)dXXY1PY#L[9FgT0=>_Ucc&b69R3(.Kf7N92H1e49d?,JbcA@:,cJ&Nd,
ZP5?ga6J=#[5^(gdV>]E)-_e,.;WT\_;\e8]UEBd-cIZ.M5GWRYOf5>,#XLG7@FY
MI_3U92eI(=efRW>(+XcU[2f0HMOcJB((K5cHU,M7F\.:bDOR(Z04U.0XSZ5SH&:
5V3fW+T@3-;Z.CO.]:a13e1(&@]d;ASBg=E,Y7YH;edVGd:]8PMTD2EX>JK]&.(K
a_MgFLF#;a8g8=HLeCeV5OH&AND3&d547(Bd)<XM)0(=L;V#fO>)dGKeCCD3af>K
5aZc__bBWC?Ag;:2aC/TT?7;Id>B<@N1A7fY(PGCb+\IEVZ(8[2T_)+[L4fP\88T
9fPg@Z3_W6eG13;?c?)2f)8Hg3K8YX0daR:HKP\@9#<^-+DP+O+\fc)JH(0&QAH@
aO1b3Cg]]+D8GM)gQc9GJF<O>;NYCccYHKZR(0ZC9@95VLcT6#>:-XfbAOdD&N]e
#>^LQf)RP>T\b+0:MXXGD^B(=Bf/TEf0gJ2bGZU9&C#2S(DS#Yg>J:S]^BfTU0;&
LU78C(0#9BMEf)@MV_=KFK4/19d+T7VF=Q>)B\9EGZZ=B=<23=6DZ^adU=+8;GV>
=-(4TadW1I31.S0]\2ZfGHLDPVGbQHB\;(.1AJa^)7M)2KQ)08H<7;];;?2?2NF[
4Yf^#-9g33^EDXX/MZO06,B98O8&K+BUK9Mg=^U.7<@K^;V&?=UG3,&;P@-#I@fT
TXfK?3eccV/B-6OC).UDaXX7XXfZdM/Pb[2\P(^IDg5:_=gP?6N&A=0eQ[:>Jf-]
NY@\4:aGc>Y:O2FE_WZ.^U\9b8LO_N(9[M1V@\>T0+]A:?C..ePcR5[6H2)f(CNb
4;//2[=WNU=&G\,&V<,)0:3fd?1&\D^RfPFM1K8b+0>1BX.7[7&[.H9T[\^d19YW
X#+:2O_]F1\[;;Bf_XJ+16]):00YQ.&aD3EIB?@PcC-JQOe<eFXV:4<B;3?Kf-6O
.B((d6K,<>35@43+\V7?YR#4_+P^X@N(dIIN.c#+;7DVR=6]>KH#;\,0J(GeSQ&3
.6CeT(WESe/6IeeK\@0JPc0.B/cZG];ePN.TeKJN\>a,?O\_9f5/=JSfgRE1.7G<
Lc41=D/7VX5BX)=e0#3XBE2S]JKDdS+@C,:.>#MJV)H:_Z4_J:ND(gW8:3eTORKJ
=V#IV:gUMfcZD@EcT^B<^;L1I[cYae3I_1-3K0#)900)ZR.[&N?ZT-&_FQg@:OD:
a49I@V+U(\eg8>fAcOIFC)&B7B^e:SfHG\M.<YR27)@A\J3M_2--QX6FN^\PAc0B
;IRcB+#:S7O-ffHN&^)R)1T8<a/HH2F.C.\c<WN4CLVX0EN6[:,&EY9cE;d[1gWS
^2^])06L6AC5WT4Q7L_5^:L=2(9(=Y.:_0J@C1VK&AbT7:LY[EK8<5X6FCEU.Yb9
[0?c<3L5SZ(D=O^O92H1aP6)Z/1BP2K#<gY-0Pc><V.Q19QBOHGg2/^f;@9/J81,
ZKNQ9A9N23-].K/^R9078>WKOA6[IU]-\UW)Kfa_<O17bDgW,>a]WKC:(N8P]0Z&
gT4ef-^7aR,S:[9Kc-BdCR:L^:=)QK>M8-b>SfBgRb0(LB?K0Q3Ke-;B=aCbW[_d
&[ERcC:^0PCC([4[]2e=PK?9OR?]H[ge&SDJ1,PV)adb1HS+cL:cKCU-E.a=]B&J
^SQ/8],?4E;X,+AXO>:Q7F(A^fT7Z?9VR9AZ?,?53EBOcTQD+Z07Z3@Z_&[^WZ38
S&7@6,+?C+IOU@<IIDa(UdM([FYNP=3WUaFZ5<fN2);#1A49LbISX<]KT=P8\CHB
;7B;b?9J>-.3G-LIUATf#0MN4ccUF#0=]/2-AdSVR4g.RD98TeZV0U3+D,6^AacG
)E25:,5[7,I0FGL_EI/&MUEP0JA_W^@)6Lf3f;1ML0N#)QA^32Ugbe#Q=85V4H;G
bBIH,]@3C82LEUSH25a<2HJ1=B_+6ggbg,>X/FD+FVec0&D9E\=886IMb0OTAHU[
\U^N-(KU?0\cFc7:([SFK:5?]S#XBg]O_:;,[;bC6b8ZV.XRdBE^YUGE3JbC92B1
I)QJ-UKYZfZ62d3M:/c9T1/W]M9<C:^<WJK>VW(6cZD=KE#I1E+X+INb/fXN3R#[
35cXdLOaIa-98_65>O[UNc6?]<-FAUMAT57H5:c#\5_(e\.@M&2?4c.A,LO<fQG(
,#?4D4>,33B87TVKH^KP&QDQ=/=?N1,MB6E=Hg#AE5FRW5YgOL+O02gR\D;?UP?T
A3D=TO/=Q3)T>KQ8X^bY?2A7RB2g66TZP]YW.[\]C;N0\7V@RVcb@HY+7;R.3dXV
Z5-B+Xg(?]4/P,2MGV2&Bd/E>P.7dN<4@/((FKWa@8_)BMZ;Y0U]RIK#KKB>+MT<
OCXDXZ55^[C0@7P>TbED4fD#?R7;&[L_9>&=-gECNKO@d^G8(3@-=/HJH^K8/=EM
K<&1b[.;J]aRb-@[+0a+&@-NXOe55f7YG+8RFX=BBEa2D3OgCHfedQcb_X^g>?91
QQUZQUEa)d\N<aBTAWdJ@)(DW4_<B4A#5\&-UZaSQ)/G\/>a:PK/CGOOH]S,:JGf
4US7g>b8O5NPGgGWW6I,fI.[H\a#N]:.EQ@]@CE_g?g434G:OeQI@Pg(Y=F-^YeZ
#WYH5LUc-\11YFY.S1X+/B<K5d_fW=7#)#SZ_&XU&K6/O/]]EcHG[=N;?&([=WMg
UD1KGA_E@#IA1V1W]fGPBT?SMG.5:c_<PKO80\37^ae=MYDgL.>O_L6-:V9&I+DV
I<=H^L=aP\5bK#(=_Se6(T6-LaL@R,D.1gBK##8;ECa/1BDW=Y77&JO6_>^X1>a7
\F-#C)CF/+-;(368BHf?Nd@G[(g?H8GM/CgY3[JVRZA1CLL.Z@R1-QCJU_23f#5>
S.X:=W^9.bY6^A:/.3U2J>&)If.G_[>cTLgULUX+DebRGX2W/8cE4XP+?9&M4Y8\
.(dVZ/Jg;^TX.UG=&Rb.5\C,\MEK36LGb/A_^EW)I=_2M.@\B4JSIHZE+W7OJ<.1
G.04E9=XLZ#EMQTfAf-PG<G+_]F8fb?2.FPVMJ[X<P(32SQ;dRKNb&GW?cUXP@;d
(e2I#N7_#W]Q?2MGCCQ&4bZ,K(4>9<_^FJaDMLPb-L56:7Xfg^fK5SATX?OKK.;N
:Ibb4&:SN@&=<?(^QC:3,4DV:J,N1S(f#WY<>)1BbOWfFb,B\J(C9bFJ4HVe.<IE
/IEgG8;TE:\](6,5LZ#bIVN#^F:0N;9b+>B:@d71a<@UO?HWQ1Y,<&VM5;,B=Pf(
GXIYVDHA(]R>AEQ,,DLcgcEPB/6ZP214Q,:7C]dYA=RO.?(9e108/\I\)If142+b
P]TTf7<J8]4S:[&>H<A_d_]d+Q<g[V]7LW<S\N:7b28^(#7ELQEWLG/?I0:,GD;D
eQQBV+BZ09SFA>YP/eK/ER4e:)[IL2VTN+EP_\[]NY....@D1[,THaT+b-<G_+T2
^TU#TEbCV7dTE6JL),?]4/H:SfXOQ0F,CPBf_;Q(2L4CggLZUK?5EE<K_ABdeAAC
/>71S<VD@5KH@]#e4M7D<;?.=^?K[)c]YQZc2W5U0KP^.2&KB3M_^Q3d:S5f@:C5
_H\FfK[/CV_cBEXFS[/^E)V.I9CcXgR3fQ&fM;>:FHA]9?TPFLaA)g:)H,ggCF_N
#ZO-LD1I;^,3M42][gB@#-AcNAfBJ^WR9HGL]]&2ZaK1I?4#FC-A_F=WL3c#B@2C
_@X[+#4?/4;DU<D]SR5F#N9XGJ0Z=(M@7;3+LGPJ/Q8MF\@<KBHFTM]MA.-0&P)U
=+7FQ))<:GbQS#<49NRF;WXBOa)b=#A8d#>Bd_G[G.C1&CJD8;]3D[K#&CGaTS<;
/Yf=F2faS>+e;^eE?+Kc1+Q^(ZGQS>G=QWCE]O_+<U<Z(5H?XW-dbMBBfI_>PcIR
T.R]8PDfLbPe[=HY@F=B@W@]b-_7CL0Y)cROAD>-d1;29QV/SIWUWe<IIC:50UZ-
B]\O\/.NM7MLG(8]b:H;4K=1:C-bROX#2DT?:.?0Q0M9d2c/a#:5-1_24[>=IfG=
8a>+EN]-F775^CJDXND\YOF>N[_>.Z+dJM/Y0AJS+fMI23S/Wc)TVU2?0<0b689I
JCC4H&JDPM.f[Qf:QdRH1,;Xe,;JV9.R;I8;VL+Ne8WGD5@Gb[4cc<b,0^>+??V&
dH(O5JcQE5)0g&SLBaWUeHQO_L9&R4=b>//Q_#T0gL-HX7//D]8feU4\<]N=c)a]
78OcUXVW4/YCVIL2N;LLg,U=H^;&R7-Wd;QH.LX:ecC07-T^Yf20,gAFg[6]KX:(
)KCVTFY\-+,a(0WP0B/Jd6=P>P,/2\C=f212=1>[C1E_):89J4,-DL<f_>bUS+fP
@2aC/LJJGRY.fM[X?@SDYR8ZTP^Id+TZg=;f:&T\93.(IfY0TI(f8Y:e=e4B37NX
4fQe&ROKaS7f2M(P]QcLEAN>8T=^8L2MB8H[F>)K&,CEOTNgb&a?(?#=YY/]&^a_
+UbPYW:eFM[DaR];E-@-L\Mb&8#99e5N,S7/6KU(#FRgU5M0.,(Wdb@3/,a+=3a+
-+V[HJabgXF.XS<c,D02D\H\LOUF=UPY_&99@IT0N.J(PbX3TP<\4LUMD:0LeI)f
QPNHZa6FY<gMRf;A;d_WB<XR.a9LR)Z>-eSQf9Z-X>W]c\;_?/7J#NS5AQUIZ+b&
=E=4\NHa(@fNaH+-C;<;R_3+-NY8H-4?.@+F[/YHA@Na,>=Ne3+,B,.CK=[@LLe^
=8-WHXE8f49N:&41&ND/9JN9P.E0:H7@(R74<-=Q2I3PBL[?1ZU#8)adF]d8Cb#G
EA=5R]e5([3?A;C8<:1GW,F4@=OLa_J5J@H]0gC/NM\^L82N8@V)dC75\:,[?QV2
#I1/YDWHP5dX5E(#,XKY=N=2P\2]_HD+a/g>2>/^.8R,>G#H(GHY793Pe0/HNRY#
Vg1E:HB7YY;,BD031H\72)4S0FH]]gIZU;@LRL&#U:4APM,SYBJ#PF1I[Z]?0^84
7AA;82DON)TPbAa(&8IIKcJeT4>V./<+Q7VR;1#+(c:=BDQ9^.KFJ:9>5E,<37#4
?aLc:MdLHU>N&S&QHgbB>BDU6-E0V].94eS<>/Xg\_@LHgDbTRHb^cg6CdQ=5bWe
URfAWAAeYC0]:5F^W)63Z[82J5-/5Z[;eX>bc[FbI6bb)WYJU5G#fPJ)b@bcRQ+@
eHGA[TI)gEfM;/Hb?<3IKK.Fg35.\U,,?E1\MA[IcXQ3CdR4fAR-DN_;U-_d[H3/
ZZ<IV>AbJe-8^]Xf6WefB[0H]/S[f?(YdL,52?42-74S-0-a42cWQ+b:)=bG:.>]
IE9A)d;_,G-IN.DYXI=^+N.M[@L.(Z43WER8FU&Q3f@A3DG/BeN,P9b6O9_&S@?H
@ML@Vf2/+/cV)(,ICMV@D/]EEY(E@N+?.YR#af,U5VJU@#U-IDeHfW-.VQ1J/NXW
]c]S<.U5#=J_SEf8ffeGf5=)J=C@6b:AM_2[Y:X6?GUc[DJHX-SIcBde;7_4129V
fa+Wc6P&93#116WG7#QZSg4a#a\KMJCdUF+UNbV=1=HXPST(EC>IS>]/f\R^YWd=
]gCcUZPXQ--?#E+M<(?JIa6gRDDLYW1WRcPQb2/KV+GD/Y)-6I=K+@],S@\Mg\EP
]EfOb1XaC43Y6<@2,\47W;dN_UaTJ<cX[FTTLEe6d)MX&D4O5Q6f>cfUHT<3)WI,
X7[17eeR\g.D^JCH:/U=3R0DR,[6d7@/2aBHP9+b1C0&[b,eaM9eF[.QT:DdJWac
:D6JVgN<2Y1)<<30SQ4-#R#5)&X(\U.S\,E:X0Y.11A,Tf;&F<HNGWCd3SdI7W5M
V&K\da@F#e&4V:_.13:4+4QGA=OX;d0:Ia3f/[da&MP.6^P:XA\(?e=eYY_aTHad
8b9JCUgK0=^B>KKbK;(SMZ(SNU=d)K:DcI.)S_G95>Z=IVV=O6,gT>@f4^NB/J:N
;?d1&/28MGU.N]92d.^-L6<6G)3fWA6/>CG\0C&Uc=6AY&BDcA,M]GFRQI,[FSA6
F<g-dQbX-4VEWQ3?47MM8+c32:TJD97=IP/<8QH/K+&JB-dJ3#624IE=4;T.&B(J
O>/Zg1\6?gdO]gde+S(LVB7IG2S(8VXR3c5?8YQ#+&MO1_DS(YWT3g=PO_PLY54)
<eP2H6:?X(JF3T__TdK<6#8(?6V/D_<U,@;53D_\.6D+3eI@UH=5+8A]SMZS&VD3
&g?bS=7]132K#6\L3##8[1AE]/4:HS(O@^,a4Je9[GVJ^[5,A/TZ.?c,FG0#E]TM
WFND/)Tgg2]faO5(L=KB\3AQO/1g@A^&XIW-UEeQe,SK7GJ+7D0B;VgH/0IIYRBE
1gY&+aC(()VT=6;X/d&R#\E[(Xb7]2&N<a]22MP;Y_d>M<MT#VPe-A\/))@&E;O=
N5.Q;WHaOZQ@NbIC@;28KC7X.,V4E([1ASc7XF2B1R-+LNb+TE,fRdU:?^)YS-OS
WA^BbA\X<#g61^]G<B1-==BV]9(V3JdZ[P6Q8CKc9U;TMb@f2_b.eKI\T>YOV_.f
Q5T9a)9TB<9WT0#0F)QPJMQUQ&Q=aJ]QYETf=c/=&#[ZPQYfX?_f.AVNO06d74N#
XF?]:N1d?I(TLFFCA2Z4=XP.aV/SBH7f8WD@Vg-b:L.-=K,RfScCF>I9AN8MXXQ^
T:D87?\F@BD(.b>8C6ZFN-_R.C=Y4:I@Cf;#)C4(KJ+57&?;aZ9(<)4593.+d-_?
B,Sd.Y6@EDEJBOdH?e?De4EGV#_aU+B\<B+cg01M@RWSD;]IH5>KZF[eH_d^5/)7
EKR/b+:1NadO4-S-E,T4?Pc]5^X)ANDf;8[/2If:6M[LX5ZAB[TF)F-M/[(fJGH=
b+G_8[\/AB?W,4JG=FbY[HT:<:03RN\GXGe.WF>352efK;A(H2F_]^EQ^N.YOYL/
6TgQCN8T9(#_AMF/CbB+F0_DET]WZ20GJ]L^I1-\<TPg&3T_cZDK>UXH[^]3M\4_
P,,e6)4:N_@BDT#I]2-5MTc5a[CZQ?O+f(&U];<OL#:&L@?0U)eUJM]H52?T[H[a
;c#A&K7/K+EHf/V/0<a77,D+/:dW2\3EcYCLEI0\b=?X<2U.YX_UG6KYH+9:&bPD
4374J5+IHUC[b_1:M]R/K^@)(N71&@X[2YZB+5PD8C9[)P_<8P-F-&@e[=;-1K3@
W7B4>C\b;G?\:aeI_967H.>:SgL-aQX3f>^HNW1]A5#BGReK6fUML.ePedM)F3,\
ZUX3Wc>a@e0/6^Je=gP4>>cR7>+S)_e@[TSJ2bY&K2^KT;6L+1)(]UMPB&OMANZI
F(K\X^dNPd8#-V6Z\.#_U<@QD\a/7/c6aMDg7f3E[b<076QB9dS\.;F0g+V,O?IO
-)>ZN1\;_g2Xb:2N#e12@<;(We)6Q<Xb@\+6:a9N,L8IWR9R_C7#d#<REK#.8Q&\
(#7eK)NVF&@cWQ-4IYT-.@J_:0?YUZdY-NG(3d&,:LL<22W9DA8VaLf=4PW;V+48
KC3R[)#HaP5M2PUBgF()R5I+b7SC6V=Kb-\QeeeM,=:[@_?6933;F&&PB)75N2W=
=-)^aN<:e&BX19-F.GTBVJ>Ef#,I:gN8CgN/FF>8<MT6P(<E&M^@cc?-QKL^<a?O
-,3HXXU]GMd,U/=Z@XNY8W[DXKe<BX)T_,?WJbEQT+g_5VVG/f=0B5=R>Q?P]@Ye
e(X,#O[RL0(g\,MI&e,8/AecW(YacZM@=HN,eKD(9NP73=25QMG>\,68T(E3LK<>
8I]4XA6b_@+-_ee_9T<JKCV5MD,RNRB1ZU+/_7\6a]0g,_;cd,VdI1.&W2f-V?Yc
52^8V>W]Y+XT_,U#8632I[:?Sd#BGR.,GT6gU_93.WabHB(Ab@)EQ4H[/0QX69=O
>1XB,T4S6_2DCN8-NcS3G+Zd;fQdX2+[=3(b]W,EIUb,UD_#B()WOTR#f]0@/(=.
I]TSTRD_[#J=T9FSV-FGaX(Fg;\\/4,R9F6Gg2LgWZTR1BFE128E5^M@6-?;f5f#
:NUA>=)d84+QJa5KeA=/XdXA<-1=8aB[BaF#VUIUZK>S<O+A1Q=/,^E^geU:PE+b
M3U.KUAG5/\d](\Hb7ZBF/S8QFO8Qg.83XOd6H;We5g,;5+2TA@^-PJVPH;/_\PB
VFKabI60D?eB[AJUIB4@^^4K()8^S.,P/(#0/GbW#I83TM4IY=#PMbfJ0I63J8;e
D?^Z+H\F5S-Z>9Vf]<JK1ZS-,.+0c^?VC8E/e/;@&<MdY0Ed&\K3:;CQB1gIU[4A
[P,;0NSUeJ>RN]?5F:ffL8WNOPLCcT@RL(e?I4bYfX^I5UbHFMAC);VJeCX6.Bf&
EP:Hc))GOTTDdKA(3,5V2K.&MbZXcOg()&<E\^?a;-NbcS0eRMdJWOaD@3=UBNI3
f&UFR6QB+1HBTJ]O8>dHY=5)=KQFBBYWAC7e7Bf,DS\-0C](\Ha/#C@-38<59O>P
=.+7=V<FW1Q;4JG#YC,9J-HY)JN:FVQ=Ub_+8\(Jc^?Tf?&>.7MTH1_V2c_5BQ6A
98LU#/6@(@G[L-5:bcHIKOW&XEIADP[?U_9:b:9DFfG#?H)(^ge4MLMbO>\FDCVC
<>QVTU)GW(7Vf13:]Y#HOT5]X7G&g+IHg\FKUg+f28V)cS(g9.b(+dM#1Q/-b5[I
>SUIGaB3F&YPg:&F;E]61X,ND-KPaYTdLAZ&6M;:/H]65JDLf)Tb&#Q[HN>9YZ.(
BMfR3NV6932e[>/>HfR+1_[OXYNDH>MbW2H>-(HX6O\SBAPW@Ba_@&7cL,CQ#?RN
&ASe5KfH-gLTH4IUIe&D[fM]]T0Z/bN,CTN^0EWQ:.BRMTbH]=Ce?2>H]ELd+LO7
CUcOS<dN9P5CA@QNMJ_/]]1ff?9:R2^_?D59b)?T#1AV@45=^EOUFOI/P3\^]BJ.
1&:@?+=-(P&/g_:-[g#DAcP&+P+\SW6^ENU7[H4Xd)OeH<HI<972SH/?EB1@VD6/
M)e?a5#cD4XBNN0R=@J8ZXS]f^DL^<_B\+=<Q<EBeRSb3VK=/+KBag_ITA&&EP_^
=-8+&QZAHgQ^:f#A92M5+G,Z+@eZe?TP6[RI.e7,?)LQbKc7B]Eb(U1]ZXLVa5a0
a<PdJ9Wf\1YL&KfPa0JYJ?W)BA>HV_KC?+J.:I^Y>O;82g;DAGg_.1?&45-GK2CY
CZfXI7QG8bVXRA9M:JUe4dTV3>.TgQ24#V;<5FTcVD<gIIa>QEAB_9]<Q_)GOB_V
OQbb,1Z)5HX\JdJI2UG>3OT,UB#2C-_1^[JAL.f<POSd3bI.AdcR44#EBeHB-_KP
/b3XQM7&b=<_5:-C.\@#,;9\L)/V7J-5K,bWAJe(-)cW38^,(RNG24CMJ)RQDLE5
O+OM1>Ec3;LILE1,,.>D?)_9HP(E,gR82&f4TEa^^#C8UGWa;0:;N5J?)[[TW[W/
.\HS01IeYY(I<_YWe#/]RF^:#T.4)/U.0\gD?<CD<]A:O<5V)aZb[K>>VW9UL<QT
Waa>f0Y?3)Wb+<U.fEV0GgTA\7YYAR@d;S]7Gg>A./8c\NNQg/N-HW,U;O6(SU=#
1KJ<DK/=J?M=XD1Z0-b3(3>-^Y:&:[/74IR<aWOY_a/f9?c0)IUG.SU,6W].a_II
L5K;KUG>6daP7;?UU\1)B&G24N/O9I,;9#cG#^@U7;Q(A83)>=.5Q8-.^VLIE=>M
d9P#=#_Q<a?=5G3_XUWPV1f#McD@2/&C;4F]G?IaCS9:5.GD(-XB:H[K+;&.LDa9
L5eI>IBO3^Nb[EIS1J7QL3S0;4;MN^fdRN(>&J]XQ77<GYQ?0HS?X:3,EcB5FE&9
fV6^NMJED5eP,eIVB^@eT0S_?)Yec<12]\SM@:HCO2]3]OM[N,^Y]g-7IG8I+8ZX
0e2)_W(OQI3C=XM0KK-E/8eO3b/(O7e.-9M[;Z0@.,^M&\[IYI_eT>?HeCXB&_WJ
Z#>^WYc&)^;;5,.Ug^dg+9d5A:bY@&cU/F:[6Y.Ha229bBfTTc.,c:V8K7c?)M@4
HNV.Xg[#SI^X@SX6JZ(Ga;L&AS9(@,&g6,F<;,KPZ-bbEI-2B+b@[&&;-bA+5-;c
==]#fSbgEK5NcREHB-X8gM-T#)&&8CWPB,ULdgY@4N&>DG4:T1=^:^<F:(M0.)(I
RW\g;#C\;BTWP?LXcH#\3J^0.@c4S/2J(N0\gIcD:2V6C:B:7_&TMcbR0Q0HG9OS
b2Ic#Pd=6>PAB/_Pf4L=5R7e_3(UZ:\PP>M=Vg6C[D4971a;?]aLI5Ef=6SCXc_D
A##ENNeR1:S.TZF@JHg>C+:W@QJR-2_BQF-Y\KDV.:^g\cDC^2DF:06T:0;Y;PFN
)A]5_PH-6C9Tb\[HdJc&^bTbgFdBdX9FO8UJ22U.>A7R4XAB-[SOUU)A#>R?<,b7
XbHceUe&bZS4+1QYUYF;EP>Z6efg1F5e&aX^]C?&_:VH27IW0DK8=6^7_1,0HL,B
-X.PKAOE<Fe?56D0J;D0G7>?;?HN@L10L45EXVNKcCCZ#4QT5DV3+75WPBaV2:gQ
<Ce&.+SG8QOdP]_R#SR,2OCC2YI^?)]4Ed1(WHGIc4VB:F-Td_(/0R_;f[46e1WC
#5=gG3XPNL>])Y[aD#/7JY?(4C/#QXcY6[2YH)4K<&Y.&)73:f.[A=<7DCS8))FV
H>QOe6QdB&gU0Q[;9\Zb;2+aPL)?T]>2RX-6aAA]D,\O:=dDUf+@MRg<e]E\RMM/
7W76(FNa^,_eC]JJAg1=AGgIQ=g\WQHAe:[I>CZ+49\X^MeUC8X21GH_>K#YCSBE
-DgV@&fF<N4Z)#:_J<JL]1Zg>DQNJ#g<?9/XfU4IF)JD\^3AO;-4)f9E/c0CROFD
55:J?5B65Qg9V/]c3gfZ-6cYbV(=L=^]d#:13+B;3L+Q>OBZV]&BVSf.I=e)U^f=
-g^VS66H):?TJ0E,W\TP^+YMILN3-BBVObI=GM8<Ke&V:2GGV)PZ4#7=1c=MYd+W
>&=?Q+b\-GX7DGZ3/X:bK/0/f].YGR(M5Ja@+M^GJ>d3M/:&),68/<OA8WKB,:-V
60PZ8?,0OT6PSI9(_S:0#<3e,;DKFgW>SNE2b(N]Z4(4Z+,-4dJ:a@MB0GF#(HDd
E[c;;VK+U8e2RYZA&(d.[d&S6X.M?TO_E+cW:]J?GRDCS^ID#Y@#\II]T+93TbBG
DH]G57d.GCM&0P?,g[bd3d[\FSaB1E:O@)H27&2M6\YWAN00E,4\U;Y2FJX9EG.;
:8Z9<I8AD@UF(:P5,JM8dHc/RKTObX=OV^(7R)V50XcI\N]X9=;A<V@)M3O_fdXg
gZ(T9KV1@I)K62:<#L6We9#DcAFXU62]XPf,VOg1fYM-VOON1V0e?L(477(P^MC(
FWc^b.S+PXdW8F2+?0;D5\S3UD0RT./TfBgWgfWXE>HZ\N.]AKIdS@^V+#,UY1NI
K:UUHV.<9-92I2-_Zg;6M(gR3JP\9_:>?1O-\[BUXgIJF)Td5UgV^g;AFT4:E/NL
>FY,AP?CE>CB2b-aJbf.2M[HCG?(1\1LX(WTZW<cTH(E4+49N:H+[S5II&aP0gOI
2#VgeZFOaKbBY2Z=<6]5@>WI5]C9eUX<eC/[K(.6=HCd0Q9/IKF,9,YN)LGI-R7F
Y84dIb;a@)9,G8ba4DA8Q#,Q&d</9E&LgXgFXJ2GcN9F<:SJ;/&H:FSWN]f#V(V>
Q0AINPFVgU<?WFO?L4[fQgTEc2BT?c5.6J7g/>d)2dPfTB=1VCg.8[R=SBebS8f6
7JO2=K->>AACBc\.7=?E_DXc5[MBRU-,T11LG3H)_F78I]fU:-]60c2@.b4B@BbT
G[e#K47?@6Md4KZ#:Y_&aCU>:.2gF^.]FP]#c&4V,ZR[&F__B+]d3M>e(\J>;<6:
VVQR_L)FH6-SZ)1g>7a>M?JH9d-&LKR>/WbI[:E@&2B/a2^MaE,WefFe:N[17</(
FZd/9E5,(J4VQF3_?G.&72Ge_H15)@THAAf9_5-9:eWIcV5P>D6E9[7?+J+d5Ze#
?fUF6NLYVcM4,P&b(@,2G.;aE^e6IL5V9dDTf3@+<XUX&EFAMM)PI\>KFOB1Nb:A
_C2N7cW5;YeHSUG&Q@2_R8aTe;Q_&bCXd-8+>\SA:8TN?<=dWNCI2?NPXW3>gA[I
IL9:Lb;c7U_f+/^/,QV:F_(cJg[2XQeISb[=[:\,;BF\NWXbKc(&EfO(;:8_LR]H
74SbLC#WDB@;Q,L_;T9e]WGA]W:LCC]e:eM_BAJ9?C>8&_B[[c+dN5<?ZZ0-[aS2
0DBJC:@B(GYI3gF3>fDe5^9bZ?;>6178+Y0S=Y_F9SKF9bFUY5#f+9(DVgIL<-GY
@GfJ.3@/NBJFSZ68.S.T;Ua5P=T(/a69_eBc_Tce35>P7O,;OF=5dR,Z,@78gf2H
GI/3,/TH6S=ID..&Y9dYg@@cd1<J#5_ffIKE@61B?F>DC\Gg^7-cUOJ()((PfB<I
:P=\M\VNT9HV?_g\Ka<VH?(_]^29XJ5dGAXW-@1L?JTS1/Ybae?O[\;_d>gL49GV
RIWEB5RS=1gDJ3b\BLgBZd@^U_/WeW_+ULREFd[KK+YD(bOX:ZJ:.;JN02S.cCH^
OUf7)KT=NYDYVa4fIN27C<C0RJ:(:AJ^F;BWe[4]<2-NgG4DLAU1P?9BACQ_]P>F
Y;[X1?F3cDR2^0ED:)[+/0Ua.FfLFg:(&NR#JegLRdMZTCgE31)A6W\0g]+gAY-K
aP&cg,GOgW\O87@-Q:D#+02O@.D->EDUE(bU_>9L2X)H\-260IYQa;_Y4]-d;VB&
A7\;XE0J/PU7E3S=F6J#I+<_ecTSK<V)Rd59_OY)BK,YQ4&)LbYP,8_E^2VOQ196
;YMf0#]T&a@J,&QQG.cG0+PP7()4/Bc)/,e/8>2Y(I(SJG-]MP.;cM1f?A&g3+C+
]M&1JUITRQ\dE^,T6=E\95G-ce#70MWQ,O.e(eN7.QcYU[-Sb5NCg:QHdc>K#Y47
gLW#R+UcRWIG2A-Y5GE8R/6S:GV3D:XYTCS3DFUg.[N@]E8aO;,^JE:b(R/>ZP^D
J=[g?g1a+?T2eA3<V0/5.D.HE#g7KI.,L]d4FX6CT/]fL[0Ebde2N#bG@5,FL.SU
S31)-#Y5V^fRF@GbZda,SFA1,)8J;85/>W42cNE\<a8PI(3d0cZJ2abaUae^-0@g
Q(I;NZ-=7L?)2^/VZ2?_ae3E78#d08/59)@?=eB+;1g#7288)O3?ERI;1[2QT0bb
S/IaP.W6P3@dWb+<0Qb>T0TL13HPdU3V]/.JGbBMNG2c4)W16Q<[N=R)a_M1<CBI
=34f3WUS8FMRZWZOHRV)\4?J4QN@FM=[,O/,c/>1X3:]ZGREZURIVZ?@MK--UG4-
b]RP\VM^Z(b/&Q\.#W;Pc;8Y2Z?a7dAbP&V1NQ15.bc9E=JJJQNbc_+K&YNH+#cQ
T52gN^RWOLdVaJBAa^96e3SPa[\C<<^+dU7#b2)4N?L5T9@8YgSD:6K?./M16JD.
O_P;g1;.9YJ#O11g=26W_9^\9A66YED^5LA?Y7gX<Gd#eZ-]7F<+OS/[\@M<+1;B
>JJ]@-Q/JJ#:IWR=^3:R@>OUA-.[8f=8]-#D#>5FB5PMTYW\(B+G80C>NI=53<0O
FA(eV&gGYW[aTgC.-]39c2(29N=QV9DHI,P;ba3e.BG2A@]\ERPPP7TdC[>aF15V
+SZC-\[bJ;<F4TPgNV8(N&1M<,43D#>g@fOOTZHK;SC?SF\U&bT&;5XOdH,_,[;8
WCdXcVC0DAHa39<RBRaO;R.WeX]9ZQ+BGDF5Y)KCZb6]&-MX+#ga9H6W[E:&Be?&
R?1O#<;(057S>D;6)O)[=e4fgg^c;)_N\>)Ee;[JC6G>8e9a,9:c5]8QCI7273cB
SYd1:ZD8KRXC_E5g28K\J?Q4PXL>D[VbXLb>-NT79+O83N?0A93,8c8G>\7EO5>Z
R_:g9G2?5BX\LKCHT4Q(d&;Sd9,GD9Y>d01>0)9O1<@eCW0N/4A;c,?5VW/02Zg8
aLeTXS._S4H-8>FR5X-S3ePd/;P]=aI>cf56399@:_S?PfaRK:-UR801PZ+ZcZQ[
)N4[H\59BQI6[c1[6R+NYNN7Y[1f>A;E@FJC2=2M25Y)GE>#f3-f?S.dPMPgTef[
)N@\5&+c1>PQ8g8(dA[;&)NZ\004)M,>4/J)G:OdT^98Mf_)eF+<4QMDWV>2a^56
IM?3/&QTP-a\LQ49Zg75U:Zg<Mf_EWA>&G]I12/@_0VF8^,R)=SScR1MLYbR[<-T
&\SOSFS.<Y&3P:T(>YQ-4>A=eWf+9SG/,;M_<cZNbVFH^YQafaFC2,\\(Rcc3#bg
#3Q2OH.(U/3-,;a)8[5K4.eEC0C&OOODg)5Wd&Sc_d_fC<<4L?KMf(V^]LJ,_QA\
&539f/DSUS=(a#bT_GARP)b:_<_bVYUSC38\@A3.;AV+L(5;,[PQ@BM?0]+a-E_T
.]L6fD0+_YYS+d9a8gb&I8F_T90S[8Z^SHEFf6I#:I0O4N4VGf45BKB9,@dFcHC0
#f\2-:Q4?).[:LDC)#HGG0S]?2L:VeEOdba\c4#UB/,9)7\#PG\\>D=-R&aX?W-^
d^FVagYaU-YQa&eb36_Ag\L2YU+HDLMCDYTg3.c_R>#HY282H.EgdF;<H80B4DZ\
QFHLM/P:LNP&[X.O[R&,)(M]:+S)>O60cE0,Z5PK<@[d:]ET?+_5R3->R5[<)1/P
V\&A[ebd<Qgcc?N60X-9]MddfMOX(,H]AC)b+Q^/)bG[,A]Vc>^<De60;J.6O&XW
T9VM+\\-0-:6Y8BY-8QE6C:g)6^(/_dI\]3McWN>cV6TV80@\9XN.(1WTE.aJ\e7
?:@2]DCb@1&:BI=B3.@YaQ=S</;0[W65^\Q?dg;]JBESLW3bIHbC8)CU.fd]B=5(
]:>XUL7::]=8Y(,]6B#^QNW9O?N)ZD^3#1#d0UT)HW4MLf5Z877QL8JF6F(ZW#eR
Q3LMa9f=2.N=&VB.[c#O@5UPUMIT@f0[,,Z4Oe^5Q9(fd;RQ#WMcaf9G58)GV@[)
^8LJUMWX.5;SX4M3[[&,H,>&:^4[f_?4Z]00Q9fNGG963N3#;:#4QYg[Y.3<-:MA
Ye_[XbF[NRJGLJdARU,PM/&8CfK0M@gP0cYbU.HA/)+#FF6G>ZcF-&\/I@?)CIXI
7WBUFcfRV#T[_aT^AddJg5?&>:2DC<G/RM5HQ:-R=bZ676fLG8^6P50<K:d:JT?P
P2&LP0EK4SA>))NGL>2b9_]/==P9#&3N[RRC#0@E.aRBM]GNNMK8KQ[))CO;eIPZ
g_R+44cXc=BGX]4N@K5,8@U?@8T0U9QW&UELL:0#ADL&L0cd;39eH@&E[^>\AR]5
S(:9LGB^Z3C];K08G3cgJbY<D=RP(Hd_@HcB>DL.Je.ZO\DNWeO6afOR^W0c?gY7
=K)[NOCBDAD1U/1eFbS+]g/,0fG9,bV;<S=cX>.A#8E)SeE40GR]_I#a27#2:]?d
;f2T#R:19/_\+UgZIK#fW+8acM>b;H9M>.:Z/Y4T+9J-cVGC]R[/RG@PfI8E?cY>
].AOX&g9Dg.K@W;8XZ]N.SM7=P0<WE6,0gLF-IX/BKMHZXO,-)V9)<eX^:RI?4M)
,UaZ;V7,OTe:Y>J[eHGM1?TWe[^aXT5IS[:MOW>U?QK-\PeBD]XO_ZNN[9Bg#d=1
)ed)Q=]VH+d[(NW)1#5#3:RVSZbfME,IC#Ue1SIEELBW=(]J4]JV>C95f9M&/6aQ
HLaS<C;-UBD:C0#32TFH.F47=1B@?Tb?\&EOWfIG2.&:/2CWB=MNABbW:7?NO4.K
(MKKO?F4(_S<;.]GM#Z6R&U]_Z-92=VLdA;P_4.D=VgL:f.NXB.e/\:D1H<U_d<C
a(6S>TRf#1>84YeYb)MKD+EW>I6<B7#[EO:/8>B&(#S;b7P-E)7MN,&_K+YH)<M^
SNF4@]9F+?3U1BOD<(#g7N3O6,WW+M2M;CJ@5c(A2Q:-0>:N-F/0OWGC9-=FB<cM
1F[W7RG\NMJ8K[6HQMDUG?>=R8NX1YICBaOT.@G7@2,=ce4b?K8?E)/_PNRV.A<F
5^D8]g-12K7gM+X8GU^=(C9UeY1eV&YR.VD:fH=CZ>DS5.GG9]JZYR_3SX(.<_T=
K@0YYOI<T2<aO[J.&=d>;&G]AfUfJb4P?O+9>^^?#+badWLP-Vb0(_:.1[X2Z7<@
_NNf[gNb]2,#0<1^/INR3/\G-C8e<MDO9/[ASE>\2,RAL3;IYLCD@a;f:>/FAEM8
,E]Q+d<I.1]Y;H[;Wgd8SO:6.fRDGc;a^<0TgN.EYdV5,FX=<e^YOLD3d;TZ_bD4
A_)+KZOP7;>B&D5&I6HF8)CG,+8L9R^@BUI0[5W:JLdI+Eg89K/0_FL9G06e&J5W
9N+LJ6EUAP_We3<39S>32gU#R?73F@V=XJbW<^?@VS/(4LAC?fU7Jf<&W,BE<;Jd
c1_S.-<Z4Q;Y5-Y]K_JbTK1R0)c#D^Rg5U,gVJb()VU9Fff3a3]6@0/Kb\FE0QEf
@dbXRLXf,_c-()fUE(fgBBG_5DfZcH(KB&PPW(;;73H=Z9C8BcJNSXD@L>>VZN)<
F&df22)IJf+<)D_Cc^G..-dL<V@Te4IGPLR;X?af9QJg^PJ1CW9HbX)2C)H^QfbV
=D[Ba;M>e<[74GLL9>F\->YgSRI,G3ZbK15G3T_EY12X;gYQYAC-5^C.T(..KbYV
F,LT?9,QZQ[:Y1M,d],RF,21JAZ\>M/\;AATYUN[b((:Jd74LV]9>;8,<-.W^\GR
@-dU_e4_ILG@B7__S18PU>/=eK1:&]UFIZdB;>>39RE7WQB-HN8?+NZPXM)KM^OE
#T-\9\=cPR&gfKCA3T)f4H#18R.U&4O;8.VB7C\ZA9+9.#2UgWeO?>+6O[T;]g/8
aD=).NHaQW:D4.8f-8(A>/6FFca.Eb:@?JE3[89:92Fbf5bc^I9LBW0H)N&G2[FU
ALJd8E(W,dQ1Of,&5Og7G@dS69ZJN)SR-VfA_9Y#:J>4\<?I(1=e]6^U;I:REgP0
Q0U?TB@1ZEf)5G:?>W@]]+;XR2:2HEHB4=d3Tg8;J0VS4BDHUWSg(8Be9@3U.e,d
6,GcB&gbA1>[:SLgW&)>[8;&<0cU0c)92RNU3D/8O1XJcfT97K6NCgP#GH=SJ8V.
O[1b#GCV5LV,6bg&C>M9-(F.^W_?E)>&RMZ,;.\[Q3-YV3)dHC]KTG1EH=2&)Y/7
CfQ@aY7Q]Q^EAV4H;>2/4-+S)?<?1H+QR^MJ^fE_=P:/LadUUH^V]FQegA4<3:I(
(SI4WO6YT75GLP/E+@#b4TbKf;1HK]PdPW\^Le-R.-Lbc.fJ_E>(K#<8;HAXL33N
D3KY1+1=g68Fd&cO>QeB.U<_a?PV\-6#SdWfcg#N+/41:c<;1-6WF37dRY+#Vae]
6WK<5RQZN9+Q/:5da?RRM,AY^S_==bWQ:Va+b(,D/7DU?OdM+eMG0I4-OXX;_gGe
/?>_FA8MWgb(bgITCV@_)a)0<3),)Q]PHM?HU;(E1>.(E?;\;OPCB4g<\Lb<7N#&
cd&1WD+V0ga#5f7[BI-bSK/;O#+TCM.X3UR(6^a3K[ADBbBO>M.J>FeSAIWHEYaY
V>J0[:TM3:6;6C4?]QA#_-TFIN_CHT9PE<^]g)CL7Z]V.J(JYX>>5==RCO>OY8@7
O)E#U@a7CZ3\SOd>_.&^(HY89?1\gAWA^Q0;?Jcg=;2J37;(]:GB\4QB2QX_2?1.
;Z7<(B.^L@>TI2)R+F8:,bTQ7E2X25EJacF8V23?f]dA)SRL@1],e153?^<TSYD(
Ba?f?8c^51/dW;RNGH1_]KcaF7egMO<1^K,,(X6adI?\-_0gU1?PH-4VIP2J<>&T
e4?NSDX:O@?DF;(2WNGR&eWdLGAPH(Q.(1&e._Ug:-eE&\OPYKdU?bZg0Y>U;T:=
KLHIVWSDG1#<A23]7D?YIPUL5.8_I<9&07Q)8K=Z(Z]G4I2U#K,VM@8TQ/JCMCI(
OOE.7MaW7gAP7;a6QFJC@c6Y9g(&ad[8L3[>S>@F/Jd/C^:(?]95cI/HHEK.WcLD
C61LV0](,+A5ADTM8JY[g5X4RcMHHKXa<XN<N4_;PRG6g,8>2)=_&IQ27BI?S>+Y
NB&TBW#U,d6OdXW]4WS^(&7XA.CbWbK&OW<<_R88,d&XP>L9;5IGN1R[[S)\d&ML
J.@:JI:<7(E.;_+HK,^1VUeXVA.M9Q;79C>e+F;2=?K[?4^b6AZ,0Z=VWWfOCI0:
Ua@KAGHF\G=g<e)?\M7POJRY4aXJJ(g),4gIY[E?C?P&<?HKTMGE^gOfB)AcU)PO
J2@P96V^OL11B(241Ec+cT,D(B#3+.g9(_+4(B37-Ga+O^L#6PW-]/O<P3NUQ6C@
#I^CUYdM7A^^-GZWDIB/;NbFO/:C:@gbSKHcF^)-:Y9UK+K@R,^Na4Q)cL.8/O9Q
g4PYG_\,/#F-#KaOEVae3K-9T,f1OWE_1VeY4GL=U\4)X-AW^MJ(SDc)UL/.]\RT
-7=)ZJ^d^P1Lcb,M/#NF_5FWcOd0M/OJL+5#RIMWB=ZMf0dfS1NCKbK5AcBbQOKN
bEED6E8gJA_Y3f_1\LLWY[UfC730.;3GV4[FQ[??K9fEY;66P7KPGD\.IP9D<5Z,
Ya+-[7M.DW@=@9IJ\LVSJ6:BEL4T()ZL[7>ND^Q[[/A#.6Ie^HL?P7=Sf[dG5BAU
^#A50B]fESJR=DSJYI1)M]VM7^X1I#W#0GW@_D4/9_:0DB0;9<]-,O18FH,Peecg
HCRS_SVAd_X42&0U@<2QT;4JYQ^b4B8X)]=@(\N4R:NDQ0CCVH5:#@TIVT1?I(I6
[>\#J2WP54YM:C&5E,HWGS.Z9[O9G6:893(&&J9O)/dR^45-0/&OBdDZeg:g^7J1
9dU-GKE)V&IM_cK2>4>(CYVE(;O#&6f+7IYQ/W2-@g9_Icd]P7fb306)?==SDH;g
VZfKK=2KdNXK4S\4A^_.8)SX6-O5Y.+&Nc)R_^)AaOPIT-b?7TYET,@XCSA0QJ:1
U7B2e.IW]0_-7O[J7(=ca^>M).X?bBFEgg=>6fcVU;5?;G>Yc9\T&>#+TEXe-D;#
-/,Sf10(B_]N:Q#W(HY^UOE-Ke/NM#&=Q??gddFAV?\OWG6)XY]6^5JO.aP\R?D@
d&@g_LY@=&X63XST55W347Q>J)bV1=,FBfc^@+\H)9&#0DN8.@8_&[OPgAd]WC:_
-g224.05/BJ&2V)4fNbQIa6Ba?;EUGO&N_7MP=9S17LLLM]<S/^&&Y-,W+HY[c49
3Y=;FZJe7N^aY4\P]:[(W4;-b>J#NGcLS:.+MI4#&.O:C4Q-;A.99[4@SJ9Z&)#/
.SLf#N[2;]C\#51J+cM^?&?e?+4d60@)cL7_],LTF@&1645CTb3X)#g-H;8?)/F+
:Dbf;AQZ3/b1Nd19cG\(OSSN6T^JQLW,.ZL7BCRBg>1Q:9L],2:9+VIa32FDCZ^R
>3Hb6\I@&<]J@22c/[K2@B[;8[K=(K\DYON)ZP1]Q:9E),&_ZMdH9T(>1JG?#H,H
<AZ#XY)R:cH)M14[]+.D1U1=]2]OYXS1F8P:SMULdfYe5SO1?GSVTV-C<_\O)fD>
#F<R5_A_52JO75KI:B-OO,+EfU-=1V-^cX#71//5d9JT>Jdg&MQ[)[:fI&2E=1_M
1S1_37B)=X_S72VCHWS^,ON^UN&5WS^Z?JPLf8Q8eD0F-Sg?\/[B+T&R/_a?[5a1
D@@B.LZa8(L1\#G2T[(O;g_Z#g[LM]R/<5,K-gTW[F\1J=-a60CD6,BXU6^bc;c9
_XNKX<3/#NLL:^G1S3AGUV[8ASDG^c1BD0ed_<aH@,ZWG]YWN.#]JKS?)10+Cf?b
=aVF.N2Vf+YLI@KUTb12dC=/V:DN=5HCS8B0Y#?,eL-S(<)=0)=#eWD(FDRW1;cb
Jg,<FY9&>aO/_?5(0_FE59_U(WQV]6/eD#c=2(H>F7I^58>VPW0R-<U&b2@=29#=
<7IHN9Be,(V0Z,^Z.+2^WgNa:6]9<^)P_>16-RJ]@5G8Tg2&cWKR-f)S&5gME:2U
?T>KO@?1IVAA3@IIV3\OZ-f9BV2d]/QBa603;+IMI7-S(HR54:=.SE2J/8f=VTAR
<E,IM0Z(YHWM_,Cc@[N]#&8E[fKg5HHJ1SX6_/B[@/2^->RR-4S4S7(]5\]@S6QS
^@\DGDWO0+_CLC]8LGY&YYd<d8J:?,SV-/PUgX]=T\S#63Z\f^;R]55,Q6S9a1dR
,W4H=Gc=UcJPEGR5d8O68C\Le36e5[A4R.bFfY[\bc6,H:+IXY]9#;.UEJ??64;A
.&GQ]<8+XP;>\_0.1+UXMgGQTD&Z=&3@FdQRf+_)#,^60(C@Z>&YBS(XaAePd#H/
@NDRR<()1^+CJO\gY2\/;DOD#US:e[f]CNeXW3C9@c0/@e9dZ>WMY\&=GbJ??\3N
T.?X&dgLHJ&#\AWOO41YXQ/<#&Mc+D+2K_FTZ];1f#W0M&Z_3gEfWcGa>[NWO3IF
:ISeS\HO>YJK<IJH>IGCHOV1JN5:d3)O-5H3_R&9QG<#QDb3<>W(2V.2>:(YOL/O
g@?5-W6BQ936&cY/c0g]J,A/1,&-I+RNE4P[@W:]MHG51;Z0W?6;^.g);(f^2XRB
M<-^\WW5:.<:DR&/Q)U:1E>&/\V\B-g\?.RS0GJgf3)VX8Z#OR8gT)K-5DI0\J+C
._-WUJ)0[G=X<V?M.HDEMIB-_@5X._CF^5Ze&g5G38H@UI,UCHLdVbB&JREe^#cG
M26AJ?d0&&E9(]7ceQd2RY[/_X9bC3fC7E_O2ILg)N2fV>696_PEMZJ]Z:a@QM\Q
[e\6\9M)N4Kc.N[-#6@?d7c:H9Gd>@DB8\-IF?..Y;D62K=SO,d_NSDFdgV;:gFA
@28&:g;L??MBQLTDGa##K^JWI[1#a/AY7FbAD=A)F#.,c?[5F<&H=.RKH)<N[@U9
?0Ya9[<<g2)8RXE:=/C&L1WS[(AT_I;NJG]A-&V)=XWY51()dV-EcNaeeVJ.D@KP
<,:9+W4D5Z=/C@^^fD0V2f+TV^7SYHB_KI8]RfVHKDL<F.::W>^+D8QWS^8\OC=K
61bSVDKQW=KW@VXC-=W\Ec:K(2C9/1dX+W=eRS1>X&eRQM4g3M2d=X))^>)919LC
>6aF4(373-dg?])fca3[0aX@0ZU>3Ea6@9[&M^[)SE]B&1R_3>/>dD]dK8HeL>0[
L3=&>;W:PDZ)3)N]g[dUe\9c(<3^PDMa95O:\AA,Gb^68?@:Y)GZd[fQ[&S=+0MY
\7^V7AF#5>e@@5S=71&(6CBA<\[W=TN=f-bJ8?TDNaA-0Q<44563LRQ5/LI>9,MX
+VFI_T>ET)P][L+Fa;99MD0,7U^Xb9#XF5da@<-1=VOLIPcKV0PaA&=gDVU\]LQA
CVD#g?^GH\_,(Y?]J4OeZD8VSHB@==6f?0Z46(ee#9aDK,4S6<=g4WNDWXI-+M/,
ce8NJJ)E+1,97#?Yf96TLF&#<L7?12<&eEbV<cc1KcWVC<a\&EP(fdPRb9D[GI#P
A7Qf^2RH?FY;;+d35QI9S)7E\Y^>JK,M@IOAO,Z/VP;&PO>SGJ?)+GKB^f8=1,4[
PE5BDa->S(1+]<PHaFR^gY@E&F1DP+UK^AM:KPNA<7MF#X]^g4@F02X9fc<bc=37
7J60a^AR&7Ie0bVdX?b(LC\(0e-O6>L:JOBT9_-?Z^OQWGdXg;fXU.P8\.<Nd]+;
V^PZ^)IOY(N,K>JO)Ha=5FZ:5(W0dM23K4MC@RH\L/+WT?WR:bH)Z1:JG7g70-_.
FSB9\e4[T#NL=1LAcUPDLEbd__b+Da&H_76YCE[Z9J(#a&(IeT(]dGT7>g2F1g6.
5\E[bTbc2.ae<HWRW&W5K1)2VAM)E>O58Yb=J3;PR#B]+=BK8,/LM0O487?64K/N
EQ&M-JC]f4ID1,DcZU\GXQabAM9OFNT91Oe,gW9<+_4<@g](YXfd-aJ9[998+>UJ
e?e0gHG>9OS8(#7=JLIH7:^.>_LG<^]]RKIBI<0B4<Lc,6Z-0L:&+gGC2?H5bA&_
X2DFC-P3P,T..Y\Ba=>/0Z.(@S_\#VaI]MA0fX1?e+4+^4/bHQ+9[1/K6#SG[=c_
KJM?9;c?V@CGRFZcDYI+13#TEPGY0BYJb0^?R79O[b;0C;:-eeXUb&1\-7Deb[KK
L_(K9NUR3a+L=eg8O\5^@>[7dF?_H/[a9gQ&7^@FA7X-S97a-;O86_U>BGcG6:MN
@A[(9E9U8a.,d]T7IWa4:XD&1B,S/2(EB^P\MJ?HT)16RZ^TC#cW:T1NfXZGY5W1
\@BIeW;cQNEJR,]CDf;G2]d9c1VOR2,L8HUXURC)aC3UC<)N)b98cT^IF9)989a;
94;9C;6gL6_=Veg6^E6\e7TT,F,e-YEM(:>CX86U(R-9-G<K8@1C00[fMN6,;V./
B)M?2>CNS1@&OWaSD70D#&gP)[O>2bRbJGIW[&92WIXOXUE;?+5a_A_UD:8Zd^5?
\VB>_6U>+TP[B=7(./J.eL/N-YW:QN,T5;KT@#,D+I6L50FOEg-M^1VUV0F8Y]1O
F\a3/EAT]][OH6[3f\+U7D/W_E834\3)5#+&AgJXB.Oa4PM4+)<KG=AR2G0JHZ&e
:KU=)Q7K/cVI8QJF\KgRY6:8Z1_W_-b\XcKYHR7MRDbfJ7(@EXDc9NU6BdWbYI#W
[L>5YD;0aH+Z8cT13UeZc>BJ5A3[Q1UdV5LIXFeGVef>gbEDE:eTIFC#6g_,/ZbS
@OI;=487EV^d5GD^U@^#E?S(W+8dBP@UD+A\]T(WC2J5A1_e^PFX,\SFScAGAc&Q
D?fYS.Z-DGXL,eAY1HJ+QW,&PXBO3?NZ#aX[&PH/dHJ>SA(?aEMH.8_7S56F[c,>
ZX/PT1+HD_(?<4BE=-3U>6gR;TK6M.T45NDAdYWF+7MPI91IVBNRf.L0dR.OVUM=
G96TES0BO&dAJ1e>H+BA3<V&)O=b+X-4Pc]7WabGQKg4>gVXg6J8EB.=X1V@=:f^
\gOZBM.)L;Z5d@]I774QdU/:e_J(F&VB2JJO1f>8Q2^-8@9Ca9W)Od0/(M:JP,\(
aZ;MY/U+Z2VE_LGQFXH1#L^d0Kg1-(e+dIc]42KZfedGV88fY1^[5[HET1gR)2U5
#[74(Y.>(BYT1_X,>/:2U#?#4\TT2f8H76?ZHgbMeC[:VNI?=JEIbRI@QU14#N=^
?9WR?JbQ6#.Z^e#GMC;d@[,4;0CdR0Jb=_cY)[c8B)3KWLQVWe1A\E:=Sa9UZCR7
63ba?NHNPC>\b.c]YD_5V_GG,:?8/(.8&,J-Q>_.WF-\G@?6<9V(#0NMFg;?330<
-^g+5H\;R<RC.+APJTVGZe7Pa\NI?><]fVfGa5a,LfI9IeHd=VX3gA.WaVI7_/C1
=.N.8);N&5\TR>XUfZQ=4V/gA4J+YTUKY-A.Y>+&1+91WF?BccBCDX?b(7M,F.;,
_a8.;)14MFK(8?CJ7eB[:DG^4OQBcSG2E6g+(I>SCX\XL6RU@_TdUaC8;?-N]e2A
-X-0+@(L:2)f>9^g#[E1H(07V57B83O5@./bTgP5Z>Q;VRTE,bWC?1<3eJHGc4a&
4AGE,cY<EV],I#aE#9^I7AJB>K84cJ<YG+F53N8/M8F=]3=#c2I^6Md2g)WYBAOV
P7;@R7CK?=F_f2-KbNXfV0ScMKIN(ER]b\eIb_A\=McQQL&J\L)7B7&MDN8,C.4=
XSCbfCL--0S_ffg.ZgTL:0+A+(ZZ-T]?gYE-+cXG,1&?ad\SH>PFd/9N-+(QIT_>
bG7]3DYK6\1-a34&f:T_6_N,,6@Nb>A-:X,IR(7cR?8,4)bNM>C:VZ0DJXM9FKW,
J5>&TVCY/Q#NB[BV,JfT]MGRTJ[L##>bMY,3:=I2+5H)?S.^5[BdE#20@>4A^bUA
T/>G-\VL8])EX4_+edS[.#[HDEa]\O(GAS>W[D7cDJQ.L?H_XNV^(N;?Tc14G+bY
D6Q-eQGI,(6RU5FYF)S[?Af)4PA684.)O>ZFUCS3\6eY.?a5/F)#DBfbA[]SL(\B
HFW6FdJIX7^&P_]L5BZMV/MIT21d7a@QdMW//C30[^Va:/6TLgM@:fM3FNZ-8dWe
7,PL[)AP^R@R+E5,GM0</BJ031e\cZ47ebXd-X-<@-7:ZZLI([BdbZZ>.Uaf8C\C
QBH.1G#FP\Bc3Qa>f,#PR-SD)Ba_[=^L/T_S)VF7_.=f<^K3XE[RI08?F+]H]B5W
G[N#1-<6a=PA_[.,4(5LLfA;-Y8QVGU+,aY?T[IHeJ<d-;SV@3LLWaW@E/\T&^FQ
6(^NKS<Zf==_+XH08[5Y?=Q[8U^8^P3]7bTb3+P>TC)M5LV/(&>c;AQa+5DB1e0V
@g7+:U-6<+EI0;RU=C_M<)@e1,(JXFDcPGf5FTEQ\LJOP.-FJ,9/GTOIYVW7[6,\
<d&UabA85S;XXEd=##c\K,.27F1>K-=FU_HFNU_(M6=_/JB#.Eg,8<\<KE6O9N-0
ePT038N9,4E=-f=7]R\FO5.F2^CIQVJ24B>\U<ZGQd]G90T0GA-)JVYU&F93O#b\
\dOM9g2XJPDYXaUf>#(U0cH=KeVdRfc@\W2c).Q@S:R/Yf1M138Y^R#EUaP<O)W[
)4RL_LS96BS(^ZFXYWP^g\1FKUDY.Bc>R;ec?e5SDV/5c_>QAd<@F\I\]27D]e.3
JZ=T?:.496][X4?N^]U@D#7>W\\[ddKPbF=<O[0^2&?\U]SQ7+<_?QWXTY,F<EW/
A^5:9M6YeG(KI:HF;N?T@<@G0?&-ec(M+X73&VWK>RMVM-QO9f:VP=c+d;S.Z\W[
B9)KALg--FG98&>XQYPa--8cN>&2XKI)N/&S8_2<9-CNW5^-G,#_#34-XL9_\]50
dRd216VKf2Z2Q^/,<5(-\K^(0\]fSeY144Q,KH<7V?-c_M>SSM[)BcDZ&A(7\.N3
<.AgSN:JgH]I#-(2GD;5d0aS>T]_,)RMK0cE07K6Q+VP4N7;^;L=G\;21BVG4M#)
T;?H@>?U&P:X49Y-TX#BTAaS2$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_S25FL_SDR_AC_CONFIGURATION_SV
