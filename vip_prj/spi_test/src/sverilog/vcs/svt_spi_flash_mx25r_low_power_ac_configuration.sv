
`ifndef GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25R device family in Low Power mode.
 */
class svt_spi_flash_mx25r_low_power_ac_configuration extends svt_configuration;

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
  `svt_vmm_data_new(svt_spi_flash_mx25r_low_power_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25r_low_power_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25r_low_power_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25r_low_power_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25r_low_power_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25r_low_power_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25r_low_power_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
Z?DWf/PJFg+\9POaWO_&d#Y9&IEeL)=dBU2KUScfOU310)I@;7D3+)_deUE[WW>K
H^7ge5:OD.P&L?^)QU7ZWI#W;D<KU.AL@V\-Q02_/]dcQKVB23(9^QAIIcdD[\dW
ZW/JK_2TTTR7NX21,@0RY-AD\2CAH?EKDW430LTIWDJf&=/@L_D_e9RW#L[Z1LNU
:O=L/ZNM?:=E1NaS.0I?9QI/6Zf)U/)O&f91OZD?0f5F]7cYLK88^1[\M+cMOL/c
gY2F)<GIQgD@K@HW:RUg_CGb_O+^[<>6c(<.XDSMd6dFQ.AN015-SHTf,=DcCA90
DLB;:XXFCG3f40NH3LKd@U3K,_?U?^?HJg7Q+b9L,=W&?BHCY?>SI0Q#R;cO<V4#
-W,S6Qc\</X4^7.1I?B=R4TO,K,,^1IOXDK-0KX0\)?&[5]XT9c[L5SEU6>Z1Dc=
_-g\4Eg(aX79LB6<TQ._<&ac+L+44F9U+dY]TOdcG/=+3+d^bWecA),C-T-GQ>D+
M7g0N;=BC?.;0Hb4b)AA-WX#YK.MPV)/P?_:.I^MAWTP^E.NI,8G^McN)Wa&]2]]
,-=9=4A4HN5S\/4=TP=B>+K-TL7WI]59F9\F&6F#BdR@:<8#UILMFG8.C^(5,:[P
[H\dJ;\_T]:\8bfU,FT(_XH+I)P(3PBNI)1OL9O2NBN@ZBK2]LI<DVe[aT6LVSfP
@S?S^&SdM[G-]&JR9^GT?V14HE>0CDf5<:;PPbe0CK&/2V7#E6Y6RJg]7MRS^g,A
O59Y/>IU3?9;+M4OfD-4A;JZd31+H:b2V+QPFJ&3/MdFAPge8HW:2fg]M$
`endprotected


//vcs_vip_protect
`protected
6^A)e6D0ET9FYD7BYAc,/T]I#;]XQQQO1N>,N@-A<cSIAF@D&NS()(>#V.W[Z2DO
NL6RVRCd?F9V,VR.f8E;75KHY^A[9O]5EVM[aA1bZR,KX,c;BeM]IBO3=^9#J<I5
K]e\4P>NN(4\)P)dI[;,O#<N:)8&P&Wf0Ic0a7LXfDKb&S\PSeJE)TC@R]G>T_I^
TFX\P?Y[A7ULPdb2M:RI11TV-=<^=)I>eTbX8&9U2Zgc^Fb#E]GN9?T<@fTXV:#[
=:f]X/FO:FW1+N\c)[HP,CW(0_M.cgd9E.STB;H.?W3?)8+HMV2&FHS1abd/O>Q7
+/E&SN+T#T#=Z^+P<J._;SL,[VGS=1X=LfL(\[]-?>Tg3J@C(QQ-6dfH6KO,ITdQ
O[_[R0WEOPTW74_@.JeP;Q0F>5T5;)DJ^LJO.N;=-B]#I)T.NIg&U@VAdE?E:M=Q
;2^D_ga01WJB&Nd)b_JYf_?G?@ZU:JS=bDIS4MF62#G=BE]0M+ZZ2&dGY?+X=BQd
-a/7GdQ7<M,YSU^=LYM0=\W26c0<I=gVAdM>_6-;@XLG<-2DC90+@5B<MSMY_;PJ
#.LZ;MBc?./TOJTXPD,.R4&S\dVY:H4&b<gaVcNYMA=WBH?\=5]U8B:C;N[[#e0D
/eId0>Xb3Q_bNTab+UH192?V&<#;48:QSdQ(eda4EU0Ug@?6@P:0=a0Q+Ne/SbgR
5[CD4c?^O\4HS6+T1_OZ\.&cG]OUN(Qe-4SI0]00&\S8LK4.XI4RA9+6([aQKEEY
WGN9SM+_+(ZXWST_LH_IJ/?M_7L>.N[_I?D(?2We.^;+Q;P=EAWV;a)/6)b^5Y8?
R:7A[CWZ0)]XO\9ULBVR99g:#^SaA+12D5P0G@AQ(3DR&4E&DAX-Z3\SbW8(A4;E
[BPQ9((gX,@a0XcGA8COS6/[3a&d74_+XU_(LWYY4Y8A+gNGU:5JG&NA4c+cLb7)
]^HgAWX<KJ9(f/(+>I#P&9K5FL_g,S8:SAXd^9HVbcQEKI7WaRd_EI6:W?NJ=f2T
K39N.]=7J)D(a6:MLL>G]QS^P.W,W#LNQ5[)b0J+J1^eO5^2S;]Z_RX?&=V;<cB6
KX:Z_48MgaHZ&Z(1eNQ_NSa6-H[g3Sg=-,MV8N<0UIED&C)<>=9=L>ZUPQ@>+72K
&@F0AJW.K6>&[K.Y@\-BO>LUGWHL:&b+IH/]_QJ&>EL@GWX-?JX64Je3M)#.WTZM
a,97Qf2Z.</<YcN#-P.V<RZ]Mc^FI5b-U,C:@#&7B:\>TN>Q5(?bE\8_C6g#R,[4
BNOG:9CE_=L.).=;.HV]U&cA?RA3:?KGV##7>[.YCg&#6H)5QGE[U?:6[]?/PC()
4:.3ALYCU<WDgCFf6W@:1U^4LBW\EB=78W]ZR;^W0IcPaX?eOYN[J:ROc4/S.:Sb
Ra5.;&KKPQ8df9cLB??0?B8f2/Z]gD&QUfKFG8N&0KAXdaMbaT&SFEIOHbCP8O1S
aAfc-7ZKOUL+TME_OI(e4)Pf5?&7]R\6F[aB=32BB>F/[>>ESA0MX[0WMN7fS54G
93VDGba.U_E8/)L@?U<@8d4QY06E?#d0D[)-EGb6E86XJPNMAAdbH-<U73^-S39C
=0.g?\EFWDJWO/?6fSd),[aX)b2cORV;_94dT2TD.d?5=UM+#HKZ4B#[NBSUf22P
eLe(f27_S:C1T?d:4ZfBYg?(ff>W:UC=EI&F\B.>J7F+bG^QBeZBe#+DVF[TE,KT
^4fW@?cVK,/D,)]1bW4PVG7IB;HW9,\XL><_YV2OEM)Rb?TTRG5fOVb.)M-I<-GM
dAO;(.?Rb]ZVA107#b(+]9GeQSND\gR2X44=-_7gd>KC\cfdb:(WITYMDeNI4=1>
d92VO)ETR3@Ld4K@R9]D.18V:I?#8/ZQ;Ce.1@MdK?XK==:(I:/#9^NCZ5OeB9F;
\6aF1_W@DJ262=0]78Nd?E=71dQDGO[HeL@^7^-R.g/NSS,+P\Z#T=5Nc3N+,[eR
]S9O4::W6.;./#KW[I,DR]3YNKCD@1UgB^US2((.Lc(BHM,HMMOH<6_(e7GUJ_(M
RA3@gUaVbFV\QXHaK:#KX/f@9F_=f]6Y<+1F2625M@TGP-5QaYG85eJ.7aaKVf3Q
gUbeeSCAHV8)NaKVg5ZL&-ZZT135([&-#a=;Ne<OECS1GRYRV>@F7,ZVKET#6aL\
<T37Q>K)857\..IL]4S-F[/>;EN:]NAd1<X[&)E7JIfc-V.Q#>10>U>KF^]N;U-A
,H1KV,5L;0b2c/dVA;,g[@DdG(SCF(b/G.YJ8A+G2+E)Q<(8E.I[>fg3R@,e;;KA
<[^[-.F_Q9<:)UW#g_#&_-bZ[J)6ANeP(Hg;=/#4(<@YUS5H>X<1[[\)W#MIIb]>
ZK2JG9bd&V2V:QYJ&I-gNX?9#9XB_cU[+(a.Rd&S]ORV4)[&-GM5W3V==dBZVaD(
bJVFAaU<g.)P5VV0T(98P@>9_d9Z.df8^LW^]UMe[@GO]0g.8\\f]?XfcJ10.EdQ
NTGEJ)3VG/U\?Ha?)H=CXRC,S60I\(#Y-b@X0[_Q7F,eII8MM\(RFcG7<MBRgC)/
>IcVI&La7T+KJ^.?4c?B<N=;Kd3MQ&gI]/Y&SX.W+a7#M=[__5Y(-6FPD2P2a5VZ
QK5.59XR=UFC(>.6>2I[15SX)O_2[PU[CBC0=fV.09FHd2D^0P-@Z?d112/=E2>L
>-M[0SJ2BeYA:FSea<:Y0;2(KT/1]#B07@,I3BJ03FK4<C4-6=36RPGBd])e8.:8
E]-7Je.KO?c+Y<QW,bI(#K+\O\[M8:QRca&X7b/P++]0.7PH(>_f@+R6_Kc:&<B]
OcG8K2<-0A<OG-@F]O7S=A=ecGGaPXCf;[HNWUR\HXKU#SIC1&)+(6D8/M<)-C+:
Y)=[Q)^:U]N:DfHD,[G_ge7e9B_S=,CR_^@aEEU0FCDFC:FRRcF5\7Kd?C=@_,&1
J5T#ML:ZNeJLI\@+#);?cCB58aA:]XE5S=W9Y)B2_@/ZKEK342H5#^:L6=efENJY
9KAD=&V@QH_2ANNW2dSMb2[R@8)ga65RNL<28<[QOUE-(UN8^1J)G9cHd:+N+C9I
89TH#&fCfa(J<_a<N_#Q/D3;^_NMc__/1A+RPe@\6/JcC973_2@=aeQ89@;7I&/E
^-7@d:H8]>+PMQ]\0H2MWKe2.&T=gbbg.,?Bc\LU@P8V,N:T/6\+>X@4+3&]2&Q6
EVFO46@34Cg5[L=HgZQPY_/ERfU=Uc9TOg076.FR?SGO(-?;31KYEgZFgV7G)(A2
)OZ703PT?^C-E]EP(bgIE5GLH@Q3;;/fM[9ZLdP3cN7LBZ:6.Y[11fb;d.g=YBc/
aB&HO75)eXe7H_^@-eE&4S4&0G9_E)Q#W;>,JNgNF#C4#Q&MKGZ50C/3?)D5FZY/
DKXBA;VA^<ICSSgQMZbK)Eb;6#TF.H/KId-2V4\LMe9H;IGeIa^Y93<YM<\>IfKL
W#)4Sg+ED4:/Xc6J5^^Y//)c&<<.a:f&[3I;)_a2A46.0<Q7WfG8V\__g@c_]DMD
AgYL3ZSb4/5#d]-@;VD6L+EgPe<E<g@).7>VJbb<N>502.S6S5\9a9MU<\Z2(fZQ
HY)D\QJB[&A9OOcb+MKCQH.X\HIAWZ&KN;M050I]9;HC[N\R^.E-.UAc1MgMG</4
/N0-9V;XgP=Q#ZYCgNfZ_de=dUF&\UG6=[,ES/K]<>J07?(K8IQ[]ZD5FF#RYW4U
&JXM#L[6Z-_:71Bb=DV5&Q.^_F5fB+U:D6CW=<NMVBI[/UaCd/4P4Zc58;:+\D\X
RU>=5AL<TVX,2g1CRX+=4&)C7a=[HT;<U(4=9:GPbU75O0V\3cVAY-41#g>Wg3(T
7]_VN81T)7J2_be;K5Rd,X@C.=KET5Q+=KDZ3DQU6+ObSf=(^-BU)bd4<Ib<[U+e
&7+]fW3WY48FP3bD5VT)cc7==_ADdERB7#YZaU4B)L^-,XfJbV&_GB2fe_FX#=e7
/S\D22gdHN-I,0IN)\0N:OFQa,Ld)8VPFXD9:SbNM#JW<PVCScL&[OFPE#;3J?K6
;02Y6eFWGV>A16@/=+]P)_CeXMDNT+BB^\f.2UGfLBe^0Wa6)L0B?H85EA(&.Z^?
B-f#<VZ?aEBQ0)4]W,b,C1CUI5eNcbBZ8=d_eKa<_AeR5<L8;@5MA-YEN,)/0&W#
W/UNJ9YQb\CS,M&7:&J\8]&JV0H>5X7X;T&1b#1@L0(F28KZ^^KCf>(>5JW;8WM)
3R/:28aa(X_Aae)]>HH<659+HQ98^)Q8CG2ccZUQB@P8ZY(7NFe8\e12La/21?98
0.c?-\9K>018RdO+4<O/;<DPJ8NV_\a#=dFU:bHTNefV##IV#;@L]Lf.fL5-cfD]
bC&P30[19@OPHAXb>AR7NR,Wd0#4+T]V,:XZ];\9K@4_7E]]G5;:0e,?CRE.:^6:
O7YK+ALQ1I@.>fH8fS#cJGb/^H@9&2;.VAXG6?Db0GU]fd,f@C#S9O&@?<+S[cE6
P0RA?P-NE5IDTBY+g]J3CBfB1WfZ-(dSYT&(9EWI/2PO1,eL0QU=.&Y?=N^XDP-,
K/^GIOT&X@(6.V+,L>NP-OW3<c]Mg_ZG5EP[e2\J2U_1-QGIPEE/f/FfF\dd&bDI
^7,&9;<eB@E:7#OS60Gd/QK/5,\2JBBWW#40(cM8/6T]MVgD^^cOQg[gG_)BIT\;
(dN/fG;2[9:/,4>L2(MI62?5]0bS(PA>SB>H=PQfN#B-C=.KSR?CT1fS]GHR0fD1
_afU),V\@be9]?eCe\bUP=P5cDP:TDBQgW&9)._S[af1\E<bN0^C:9#2W>=6#DGP
cS>FEZdMOKC0#ef2-b?T-;O9/.:.T0MNeHAUK=\25e#HU>bMPG?[J=f7:<A:b9.N
QDfFf#VH3[,J(OVaSFcgb^,2J1,4OGWZ<fMbE+7b8aRCA-4TB2FZSSGIJSE->#;R
BS)NY=5R.<2].JX4dYD.J\XbR^.J0>+PS#-&#;?c9;@UCS#SL0V9564aH<MaPJ,\
O#T6(58S[).(C0:,-TZPgbA.LBX?)GN_V-VO90F)d/XDHN\XLMKe(N)dH5:Rb8?-
<2TeggZXNWD?Tb^/0-2HB0RV@=,\U:J6P#GdW(-.FJW.IH,PL@))S](54&6.T+-c
6bNfWdIY<6gI(M>bSI92B1HAC3HF,+_dTeV1:1/]8_EWaO(I3(F.C_>_DH<1:E8B
XJHeIE[+Adb_?H967#Q3WV#/,YD:82DI6:SA5U@_JNdgE_B6GH84RHDLC-8,W(]T
=NWY<UJbF58^T>JW.0V21d)#H\1C9W_AJ7Z@;[J5RT1\0cN;HK.CgE<:\(@2KFPX
YA?34D#ZJ3C2;KIbMg+I[0gH.DQ\<IdBJ^=5Rb2?2S,>/3K+Jg+658FaZYZ?=X=S
MYVBeNK@G/M<E+TfA#T_F5QU5--?-DCLBB7@[3^G3&/I^K==0;7P<5_e:>+KZ^Z3
-C>T?E<Q(EG3+)?<_=HGWd7[0ANK_=<Y#VCgY<_^f/I]ZOL>_>^8F:.-5T:Q+/e5
Tf]1=YD&_[2.#5gFbPK)IZ:(OO1QH8Y_Y+9X##:D3=6VY(Ad6P56&G:9,fM(:5(3
eYQ[_.;ZPG5,JK@/<P57OCLAKd6Jg,K?4cgd-H/FB[?^HAK:3;F\RbEV=VB82(bD
-&]?^K7f>/&b6Y2T#H>_-UYG#32GT/^dMJLWK2<d[YDG,,6:@[>;b(Q]PYL]La?6
XN=ZM^]f;TS)bPY(X09aGI.21+#4AN2K^d>e-Z&J_;_dcPM6W>^#9)01L7XGOc+9
WTI<B;B^4\M.K(Ge_W53/L=[WX[(2K4SO3ZeTcJ6a&FWb.X\#6]?N^Y&=05#U9K:
a8&^3Q.7]+-O)O.:bG/U@2g)eG^;:T0;=LYOX+10K0>RU7#\E=c/A[6YN>f-Z9L/
X_d:W,&+.Z87;LbUS,8e\,d[YDaDaaA&Z:U0]AXB[UFRPa]#)^Na4Y(N:cNU./=8
,[ZD\\TUE+@2<2GV?@OYP6EeXa795J^ETI1-K=MG?RHgGef.J[<],RU6^NO2PWWG
REVB@[6d<J8FSfd31QS4TGcG+:+BWYX@:[,cb2[>#S5J^JC(KI>Y2N6CC3&c=2C;
f3K9bM;,H\E/f\+g9IfYC/Pb>Y[\<+[d_dZ\0/\EXH_-^O&2YY+V0BLX](Q,OG=@
P()=2RF/9H-=Fb#(A6dTB]>1-)-R@3?G93L&K@a5.[Z:J(Kb@K?W@HH+A),/O13C
[d7^We-/SR6:/[L+6MIC1>1dVX<-4R0/IB_gb88O&R/K?N)VZ,_OP06,E7g/29)#
_A2g?f8JR:d45c;]Ia>EK3RGZJ4b1-GAb<Y)AHf-&>de\#Z\FSZ?9TgXdLR:MFF(
@/0]V6L\]IW4QW-9_TaCgK,CfDPY(B#dBQcVR8(9;E0SObGT4Eg3J&L,-/LL5C+<
CE0B-NBZ//8\E&ce^N^MR02JI+XF6F#I;-.I/)50WWed33(:.;7Bc)-[CBRYHHf>
3?&FXSf6-9/:WY-OB4]:8f04dA_)M9V(UKWYTD1-U@U-6VFP_De_T&&DbU<7A[P0
Bg2C<(X2E1W=5MgD]5B?=L-cD4;I,#gg+EA;L6B#L9g#e7bK.F.?XHUZ?Y5+cO0(
O>U92Q<:HS+R1]O[f9#JU#S2+4ab/7P/FXc[@eCT\GfK-;Y&(IEE;^@K/aXV3.(7
7BfG)6+;J3H(D6aSBP^aS:?a;V9PT/G)(7Y7BSLaZVRQ=WN48UO88[(@f)fIKc3(
A.M[Q.OfJ[S1##/[S]5C:Db+SC+G#Z>gJ>\E.P@RNFP]c3Dcd?CeI:RRQ^9BZUV2
EI.YHYDV>;-((>.[J87b1ER7TS;_:@e3<A4?HHMR.<N@H0N8QU[X#0#EE[XIU3cL
;SQA-0>:A;XFNb,dWD=N;(X\O&16<HRM.2C90>,0H0D4M&R&>(LMcAGTSU1J-QXP
6@ZW3.[1F)IK9dP[2&2LJ^.N50_GgTV9ZSNE6fR&G^f38\R4(WTT<:K8_bY<O29I
3Y2VE42-S?)6^/#N?SCY9a6D;?1e8-,DD]#QUb[<bI#<O,Q@])Y[Tc<E?T16:E+=
Z3AV)AVObO?d^DK4@7M),8MJc<[]S[3.O>M2c@.dgW:-eg#,@dK\VMLS:#OJd160
N),g16)W,\g>JT-;WTe<[g]T:@L6B]O/#,/5G[?ObF;:EVY#Z^@BIP<OF\3;\.IB
^B7XQbc3\@7A1A@P2&YE7RM0F6M1.X#PGEeJ0:#G+:BdGJ^7TWP/^VaU?E\fE03b
GTAcb=&5M/+=FJ)>QGQ_#UWMIWR&R<O(ZO].P+)/b[\NH:VDbNaG(Fgc(VNH2RO@
Xb>G0bgQe5f8N[VHNGbV<63LO2D2XM-Og>4==eH8&cXEc[(EJAH)I)N6MUaI<.LO
JO4V1,B7P+;W>&R4>;.LgQJK)ZD0M42^A&E8B4I(TC,9:D2_=4MB6#c[I?gY_,J)
RU0g17e45[&@&OO4J]R9+\=c:2[Ib]62Ra/W95a.4LRR7B<N5:1=:)Y^=O(PSSG6
eY8+?FI<UaR6A.5Z^0>^I/E4>Ta<C5E)[S_[Qd.8c?G0d=TE1T-V;[OUS>cW1CU)
S/d#-2+VH-GQY;<Pad3UD[7D\17Ef@Y8E7cV5T8Y>[+6N#b2RHL37YfX4/T2AWg7
Y2a=^TQ2Sc6[#HdQ4]B+:)1Y(-9VbNI0f+,](GKEE79VM4Ie#g]G8.)[^6MBdO\Y
dYP@Ud4f?ZaC3-NFCfZT]3LP]?f18g5+8&=I_CC121B?TN;Ga5;#b;We\)I_FXg7
-8P](UWCT26#C-G^c#/DIF._b+N/W[/AE&;TX+I\B@TKMM&\&I-T@&ge-XI#2O?^
\B2[><I@F9VIRDW>JIa4=d]6@HB^<=ES@:.WZ,,46Q0c3KB/>=L6db^ffU8/2O39
#N/CK.Zd(FMac.Y85>ED<G=D#?I3L]:Kf5;LM=JZ9ZDMW8^=_Z.@;Vb<PVP@CdA[
1U.4;.?Y];@Q(GA.cN?f.d^2gbT@VPHGSR7[V12P^^G3B5=^_^4Zg.aR?VY#_^YA
-]C#66#0XT#>F>&Y\L;770ENeAX+LDS@X_,@.V::)RLQ=,Zg&^[VJ&;+9(K43H]2
g2YQ0C:-F2WYQU1T<Z6#:,G2MJ7cb\#BIMD46I4L\Q-V3C-YKc0H[Q3&#CY67@f]
Rc=(L[e8>1CP]8O8@gE.[fAeCFA;<AEV_f#g=?9^@Sg))+a5@S]5??=)#7BPL3<7
OdQR?SW7A2ZeLf@^3/HJ)Z\GVY))L2,3W5</N0I])N6Z2Bd=@a;M1T-QFMY(NI[)
UNJAO[4eBQTRD<DMF[8c(X\7ANJWfKE&][)S0YT&#OKbC,a:X6T_/0MR&7BJdGIe
e+K9V(g)8,6_-YJDN5B5O^,2/;@QL]WLBJ;O29WVf8O-CAJR(]I+B5HS/eBU4XQ/
U5BY6ATc63=fE3PD5TF54NFegYfA&)=Z,WW7K7eTRa[.BSD].eM3.5;M?g\]F7EN
99R)8[e1,=-TECIVg6H6F=UP:g)<MbT1&1CK14#]@eA;b=_GUHM#Y6T5N5a][YSH
c[E0RaA.[&:^]F9;GMLfA1d0)N.#A5VPQ+Y@>_fEbV[)T+A9?8MZ;E(HeHKN,aN@
MYbaTCR(=RW3\E+O\LUDXESSQbaX6KASE5?f6/_A3N#N58(B?Qc1FA81TRCT/:[@
F5SBLHN^E>ND.DAT6=96ML&)QA1_MH;K10)_f)W=+eC,Y&(aZ:.A?>\<(G&O0aCA
(;4NPX-e-.Aa6(.F(Z\AVg;/J<FVECWfWUZ.+BIT><CN@0g9e8PP2L\4?@fZ+,0<
(8]6fK\&eO&N:IJ>3)^g,T#)=QN_0NIc/\7(Q@^35V.86DP8cQDP6V9aTa(RfTL3
JRE4W(b40F+dXDWbE^#-90NId:CH:JP2d25UVdU/C9CIATab8Wd1(He[Ufc6.([V
,N#f7E\9&;0,aN:6V7.W)cV]0=X(DIO8PJFOKLA\X)8L=2aS;D,bdA[2^7PC+.>X
ZUg?HbYDeC,=3=V\CS]&>fdUC/B\(6+eRTZC8cdQF>/U0EH8e3)_>&C(Q&d(]D@M
G6X=cIM=<UbF9:-#+P?=@]7]^LY3Ug(SLP-V2A@DeI3HC[\_53UF@NRNWT-H]b0M
;_G[]b_@dg,5cf?Q^XB)[aNOX^SE>6ZIM#V;U^d5S,BQC5Q4VS<N[ERVC-bFf=U>
.c0@ME7,FQ.C0,2,^2#3F7eG,V;986.&,;)32M=daDBS\DN0deIX+c(#4]04;A7^
WeG:NDL:KcH^SE8#RJT)gcO;aJ;/28EeRIETA(]Va;c[33HGf17<7U]d\g6>Y2GP
E;^]CUC9MaE&@9FI5Z^6bYWNC\f<Q:Z>QWeT8[A<HR,bE/7<J7Ie^;8J?LS0@L89
?0<^-eO6U5(FY)3JW_Y4-@.>fU4#gL89.,T9dNWX+&[.6K)H-5DIefXO;^0W4<,K
=/9U6A3Z4V^#;I9ZL&6B9KIO[FB45dI@:#?(V-=]?YDFD;82-=Jc#1Q3#ZOQ1UES
^_?dd7NH-ETW+.5R6(:Y1].;a1LBeR7c7FU]@)aVf,+eG@NFGd7Za15H4=7g-3-K
2bSPd,C[<>FVW7ePXb\@R()U1NQT:#A&X0a>c(4&8/=6<<Da3d7=BZ_UBHXR+;(g
(aWHI_(eU)fd6B1f(:6,C;+[>A?#SBaWUIU<VbY?Z_FFZMV>CL\N8Q3+(g_0@LC_
:H4fE^5Sf<J[d7@:X/#RScH\AF0A;[[g_.21OU5G]_&)SWEG@],9g#NGD7N-dA1H
Gg=9OU-a44,gdU?0d+PX\Jg9/D6Vg-.MT9F^W+AKfDJfKLQ?dTTKcHcXU4U/C6_J
H:EQ3Bf_GR)_+1QTA>L/eS(.CS.IaL]g;6NT5[VBXRIM-,U/4c<3HM811g.561dQ
9IaY.+BdJg9E-ec#,bdg0P:DZ4,c;>USIa#7<HCTf&WYc;abSbQ[8T5_>#-0C2YS
U@(JLcJ9GebVL<X4DNZ7Za[ZU#d5V1f()8A6#f9dNa/6WVeR)<Z.669Y]4a:f=W1
R:=e?G0PABH(R#JO6(;<DH_,dHGRJ9(fI;=PS3:;V4=e<G^fga/Ne@,<ZXU]R5[H
(Y>Z73=9R0X_cVN)+[>,#gdA#YSWE(IY5K.\(9_a^DJY@XJE;C]H13V8?gab24<)
fe77YP.UN)H?M<;cX6a5MW8;8U>:.UcYF3[@9BFd>ea,YTBd4ZaMM?0:][_&EXdI
QTE+<N?FQ1_DC-L0XP8L&#^7aD\#1GaCL]WW>5S]f0a,\XHAYI)Gb32-aZ2J7d1-
ScB]^^#9GR=03ARN5K/M-D1AE37Lc+26WVb.XQe1NGP?#(Y7D<F&7:8^X<P3_BfD
0#C(_E[7&[VVbI&=#:N[ML11P5AI^L5\Q#PM09.<WV1I0Z4;^VMT0(eLNQM(2a<Q
E.SC\[.#cX[[N&UOQ.R4b#7WB+AK]ag]LZ4:0&3Gd;TgXTWdNAGU9\+=1OZbVNd:
gVdD2YH4L8/CJ/OSP:H:VXNJB;P2\(dE2+L(D:AGU4cT;=QE9VW0F9[U/6UEV5YO
@;2BZW;BfNFD[88,ZYEHU5XdT-]O-6cQPJE>4U?+/6-]b6>+\a8eAIT9bZE3/&TP
;e)H_BOH9+M8Acd9[(f:J6+KT(N,M4GNR7OW_K,V[&IJGc.4;Q2YgEYAfG3YY)1Z
&f2SdKF5RRH21#CF7>20(f#TabX98)E_\C[KJ4eB<4\2M_T\Mf5<X^UA&cGKK+@2
PBaLA2MX5L:/XV57PFNZgBXI[3L(3+.YV0&,Uf0ag39Rg(0.cXZgA:A?AB70fT^P
d,[;Q]e#Mc_ZIafYJdbEQTbeQ5=EMX@7[W&P@@J>@Hb,ES>X5S4N4@a;PP\62MUH
b0BIJ3?/Y>T<5<<aT3P+<M@4=X<?5:)c7<.@_FWK;)?=#MT9]Q+8EX5,Y9+GC-2(
]Z]aCQ+^J,5g4:TZRHHg__baC+<OX#62M6N#3Y9;7?7M;-NIVJa?fZ4XIFU^+_)7
=dF7E0=1.bagX+FUBGHC6KXP_b+JP,8X4M)#B[UICS/IEdUT8bSdG@2Dg;/NN514
DGC=^]Y#B[<IT<ObMGfF)TA#><Jab=[L0^Q/@^U@N^KKEP(I.MO#<g^a1=24RX_T
JcDc_N0HS@NQ8(g^P)F+PS-BP5#GeB<P/,-/P]DIUYPg8L>.RD790)KTe&97Wc;I
B\Z17&5VE#-Yag7JN,\\VNYH3VP>/VH7+aD8A;6PM7UW67DDC,5;F(?IY2;SALbB
URLU>1KA5X_+b?Q;fZS,[(G<(ACL=8Ud#LAJ+<-QbcG,aVEXQ?+UV+B&E-WP2M5g
cIU+#cOWPI\C/L749<_d2ERQZ>6@1T[SQHfTCL/+0)<ZPYSL81b7?I.LbX#AKOR.
F<c4>[N<+b+c;c&NEU4YKIWgTI7@gPEOdIcB=WfR]ATOPYFeR@+^be3.@]gSU=ET
9.&?c+Tc5T6LB(FGB\STfI8Zc+fIfDIW3(8FLF<)bMVb(-aPQX8F\_?A=B-8;e5,
[==>CEb]ZY3JIE[J5OKbDE#DP>53,PYg\MXYO/,3UXIa;NFMSH;J=W@41c@YN.CZ
+Bg[A4#CRBE26J=::S/-GX<dUZ^E?L/?,R>K.)=0-F5FY2?:?B[#B7IYaeJg=G;>
KMOHgF:&_95EPa&T.?X?FTXZS\MHM26Bb0U2.L#@c=FZ&\:VBN_76QIGGR<[(91A
10<7COJU37E4GXfS;,3TKb75?JMdS-D,#FP<LOE\-Qd\MOHBF3PFH=6(9S1I+eUV
,bU[W.+C[>[X?K-c8A-8=7#bNSE6A#V@ZAET0;5^4Fg?ZD8C,-M@1NF6TAF8)4g#
F,J,1^RfW[P.FZJcY0&d;McOB;ZQQJBFH1Lf_70254C4fe=7Q\1W.0?4KHJY+(g\
R>Gaa^F<GY_:=7DF/0;VP(a:1(e(4&M<gQb]Y,X]6]:-a)a#g@2]AYdH^,fHDA4d
@//YNXg[K_P[@:3d10GeKIcCM1PIIDF/CQ2:WfXa;#P86f^5WS+BZNG5SF(d(;GV
d)KK8)>4PeT716,@,(BP=;(=KK8;W4GX]LJR93Y+R>5C)W9@SXM[+b5f<b\@A+?F
d7Y1?2-R2==K\I]A?\=&P?=;<H/4a-7.FWJ^SZdgQ+_V@YC@P2W9I@+NS?0-\N5D
.TUgQR\3WZT[M^3-C?B\c]#K?\ZDYP1A#3/ZSQKD\ZOP2aZR18J7cJXUUX[&XBg.
-4-G_815O04AMPW^BM#=DU<gT>Kb\RP3:X67SOCBBMdO#+FW8(_b\4D=@/[[<=H+
UX=#0gcU=W3aZ4+44_/O6?JXKRG/Y&BR20e@ecX&)F,_S(R)&1fWVYCU^3a;>g[L
f)b:J8(fb4U;7b6G3M\;#PE>;BXa8Ob8&C6FU(T>-66GE>CKUJ::<<&]T^OD-8aT
@7H#FF]6T^N?K?[7I>Y4e.dY;b3<;8OedNBOb,,:-#Y,BZ@W#Y:0^KP1W+eJ>7?<
:R^;PW1(/e31g[L-0POXc^R(@HY0YH94;OY-?/DJ>K7GLfIV3E>CK<3KXDV=f(2;
7-(H64c\Q.-9\.>))J(6S;a8YWXQW#6T<V#<^1Uf&Uc)b4E8;5g#c1;)6bNV?9YW
J:=4]5geRS<W23QL9&.AZg2#H(8^]I.?6#D.Y(;[f9NS9QF=<825]Y>Y.1)?)B@<
F8WaE2YFREOB>W8RNF2]&a,Cd/PfE]YW-_)e>\O-N1VT)@,(E=fb&XX]7+A03d/5
/EM)590)5Z]LXE,8MUZ>:bd9PB\<7^4P<^9.Uc=?,Q=G6:Q;O5ZV)Y7ISMQ07-8,
KL_Hed.B:W(Q..FF:U3<_W2,++48XBMDDDFdQfN[NRU=g@g8[2/A]]L(/NR+ICG7
/JKSB:aI0N98Z@K5-VNda[:];91/J2EPJ?g_]&dF1FCWb&0#K[V-NI>5](VdYUP&
H\G_Iaag>K/P97O:U)]KZXMTKDISS#d1+.Y-U6@\6ca?[/Eb.UYXR\35#abPJP>[
P\d07.M,<7IT23@MJ/^bQ^D8]J/D_JTOQOX?PW(4>L=Z.3(,[9UfP]a:7=bC[A7>
UK>^MJX^ESJ<F6b01)#.XL^IZ?,,B&O:OC=MJ/O6F8d7&2X?B8aMWg7Wg2>CV0[=
#CE7e7N+1R\b[G;3+VMbJ84\d6D6GcII-P:3KG;GfdSI^.9I/9f_SO9#0BIg8M\5
[7HQFf.3KU7T8X977JF1e.HZ2([b68UM3C=F2[P@CAY71R)Nd\2V<F[]R,.[9FJ6
O2g8:N3D&X2J80[>BFbS[VS-2/Gf674MdF)bB:)fA]HGS_Z=@NI6S/I3K,5&](?c
SBK+#O;[)fM+#OJe8e+7g/gI&:P75T,5_SdIG2_=C)9N@Q?2Ng;gb^1;IYQd59X3
e^OTMD(@7T\fV&_EMKC^aVb;V0;QM@^Vg7T(bI,)8I]RQ=-70R8S&<CA-HV>:Ifa
NJ^.6FDG35+ZbN.fX9BZ:#:1IadK46gH,AH&MV88P;,Aa2+9]a_#Y_L\0\#AeA;Q
1,SI97cRV)ZFP>CKG9+&=?Z-,ZWW@?4^DgR&;XK>6><D@INM>.JKN>AO102XDg\M
2RaLGb6FX:DMWT+=b1Z/5W6K<T+D=Bf/U46/EYO>A##<cd(#)E5dW_S+fLN5a]S6
UJXLFa=A4]@:BC),bF<I6/1&[NBfgSH;JWIQ(Rc=?cEAdE<#,1,))@N9_SQ0;)XC
Z6/P@[#S,(.?JEd>cV-NM+aLS2ZNAfd[SMa^89XbD2-B@E.IGF&XcX3Pc7J&;^Ef
W(F5#VM?aUdL2FJd)6[0Ke;L,2acfV>YN\W+(4OU6L&(@CRKS@L4UB,5UP:D0L/B
AJ,Pb9U/1)@/A1:g4D>5;)?B>EGf<e1EYf_cNZX4:(Lb\TDL?K2\[&)O01X6?C>2
<N0G8<NeYJAb[N@USZ9F)3UHNFOWMVO#=b67RX)ALJ[OZS.4A@a/Sdf)/6\A:.XS
UP?bH_R)U_&DQL,,7L+Z0#_A6Df=5>1SRI<>&,X.]L-A^(L##C5&)_<I)E2f4SYR
>gYB1f4Dg>#XH21:J?M6K\P^:I(S?>-e8NcJ-HPJ4Tf2H(3/F#6,7B?KTI]#05RA
,fd:e&PNST@?88&5#2E);5W>DXOL\+,>X3-LWRaA&?HB:Z:8JM-FSZcZ1b+ES^5?
bc:RO4UKM2#b#^/]A5],5PDE.VOR9_T7N/P8]K0#[RY&_>E;[0MfK?R(U?F9XFGb
KXBBAJTX:6HXJfBNF6Y,L>_1R@JWL(5Z9POR>KRZ7Yd(KH<cWVYKNN?2eOYgQC&e
+4HB27BX.0N.C:0bI@)FS(XMfXVgUW]JR6e37@QZK#=)BS[ZFBV8QILMPHOR)L-a
[)11GKLCbe2DDZ8N<\I<)#]A0=T[\cEaC+=JZ6^+=M-c-U7,63a,U#fC<PHUbbX=
g9fMD8-dE&g&PIQX@b^+JGBD0^:6[IS57M>+HD^LGX:;HcL=+Mb(IgBP>cF](EEN
>-)YHZ.b.B:GUgD>,3X5UO5IBZ3^O1>c@7U<_\Eea6c6.()2_1cd@UUD]e,#YA4d
O6=^d1d8cYXW.S]Ca&=6&^8OTED?:1CE=e+SLgK/\FBD[K_I=]W9L^2UAKZTTX&F
]J]V_dZX::@]RU2&M:/(#?N5B>&UC2>+TL+V=42:F2[Y8g[YEV9W./:5ZM)/D3JG
PJQ?WKFH6:Z+D-^IDJF?28)P2cHBDFR_>a(:N0>SZLf7VXX3SJWXJ/+a/WO(#J-9
>2d93D.Ja^G]@_6BBCSZf>V=5B;675P1)P_J:U_C]Le[R-&A&/Y6a[8PAS6-b+.=
;Wd_QUbB)0?:U?V5CccGb-/LIGTPRWd3N6<WX]I^K=9#+ZV#b7JbA@,L\3JG=<78
0]7aW.3b3>D(93V)Pb5OT[M/c7_#Y)33Z0XJDL<^V#G7Ue=g8.0L-<f#GWW7,ba&
a5[e2(cQ2f9M>&@KS\69dZ]deLZ4?[Yacg^LJDBK2@=G-;IdZ)\e][f,cBB=)J_5
:c/ffe;IP2.YCd<XR;3cJR7BB8@fT+Ze#]X[gRdE]RLd\1D,da3dY=ZZT>S9Zbc5
4d#CaJ\dcW--d_H6&aUWL]):)/)(+U.V4E^X]b1M.5\5eMG?Yd+\@[[XNST3.TO:
-)9.^(2HCA4A>.Ab[1)G\F=0961,U.fJN([b9&aBWYFFWL@IXAT&KUNT:0^C0W^N
PRNe@:3HR]O\7(?3d<FA-GCMb=#(\92.]ALL-8RMMM;9\JR59=1638b;XS(IA?K=
R9XVOTA2E8+ET2,6b]E[-&gGf<S4]e\c3710&/EN6#Va[Q@W-b,;4G/P.A--CBWg
>gT1J8f[//+75,ZB[@9bT;a6=?(7_7Wg5I1a9C<bagAYO?L3RX4>^ZA,2S(CgHd7
HJ+S,/Te=KT7]#3PMESeS#dJcQ^b&.>94b=@g0E9a\f25f;KO9RU#<SJBXD;Y/W=
2Q.V^)a@AT:fGAGeI-^;ZP]4/C6]IX02bVcP&aJcQX7/:ZeG\896?;(g+L9IX,XH
)L/5Q<L=2J5QeDL9NF>YM.?:M7C,LVLFYGJe)BU,+Re90&RB;ZgNWdQ2O9_R+WPb
UCN13ZYgA4Q.+##._ZMD/edHBG@R)cX0[E,W&J^QPW5XS/7b^7,.>+<f3H4C(Na6
@J@-Je9a?c^+;:S,#AMF^;TAN[a4@<Y20Xg^4NCW3&f;K)5[Ge6N.2J2##L5H@DX
-g=AXYU&@\K,JX+F^C(dWXCOF5McW[UZQE([aZ2Sb5MI5:dcIQ)7JA#@QI^7Y@7X
?aP\KLE+K=.20P1<_;7@F8-)LF0UBDX5agc(7OGB^[MCJ8V#BdeAZN==KL15@HC6
[J]IQ?645#@R0E,M>UWL4(>MOV_41A5XM]gV7-fY[L36_,KV?EDLO2NUD(++5I1N
eF)Yee+8YW>=Od8,9;K,dQ/)MRFJ=f-GeLb9@5+)@;,\(S/>,\R0Z)]4KD(;U/?[
TG?PX@@ED:;B)15&;^L2P2V4JZ=-W0NE^:[gV3]H_Z,JMG=bZ]BRcf)<-&M4,/_4
Af/G]+K:Q/6.f2F<0SEX&gE(9RCTZ</KZ&[=KQK.KK.f[++?c0B>D7W4KJE8V+9V
eNV.(9NV]g6_9(N4A8BWZdce=DD4[:#:(PY,NWSVM.)a#,#>]dSU.R1>Ab_R)W,?
Z(OLd#Wab(TK./,/6&HA-AJ=+KIQR,;6)HS;--4<S)G>8ECOT,Jc<\Xf<6B<:M_[
ZC)-eg([,G2MM?(J:ZfFB/+d(Zea]>e<OG0eaGRC8WAfX]DYN&FF[+a\>;[UdFE_
\3:2M<I>J(_3K@.\GC_(Vd?EFUL-Mg^7dF,eNa9,XaU#<1geE>+K@IPF08T)>/UG
>)D^6WXaE0^RK@V1^bO#M4R[S75+.)Og,C(S//0cB]2.Ag\NOHFS+)23e=J4\0_=
36L7^9f&^XGPcW-M1KQ.TQ./5e:UMFQ:09;DNBQBb3g<\cY/WAYCPYE3PHg@P@-3
Q^?LYB.7<<1,6eBbe><2aZEU.U?JXRBH5DNILJ6CK2-U6I.BCZ&OK.F3V1240=aL
MIM84^+9_JC?d86_:XNXYZeBE[C:^[_MN47_<<7;gU_:_3MD31gC.Re&TI9Vf56D
,33(R_#M=SWOYe_(]9BcCg<P]Vb<e8;4IW)W#AUD>L_S/S6LO5Nf4TbE8-6g5G-M
J<OOP8M=1?1YFR)]:MXI]FHD;S?7XSE\(cY:Y\(@+JCSI=#0/e,4E_+]D43XF(-M
2:6DQcS3SLc-7]3Vb<774T4245e6a)LS68][MT).XOb7+USf^g8V),N#MQ3e25<;
M0F_R,[R2NS(;e+P7V6CaLSeQeYY3H?8T,S[5L)YK]GgU63ZdK]<(Q79e6J8MdFE
^0I_g7>f\T<Ff).V-6:XHZ0d61.cTCZ6e?4/:RAHaX(bS3eQ\WP50DJ&7BAOG81E
aG<a447f^c>Sf1[Q]L<,cT9H(SFPQ:->O-aBD+I8J6+BEYJK(gUEbd_1c9L-^-b4
I;]:6TR3fQ=RXU_7OO]-T8UJJ\OdOE4HdU@X&,If+NVX:A&UVPb=Q.G5-@]VV\+e
D)O/:Kaa=QefX/L<IcY/^R[6Q3RW(QI<ON)&])RNT3Q68fGF6H6Q_TE6TW/VW<bG
276SY8&N,2f.Yb&X7fbN=JR/Q37(G4K6ZT?,[B7);R)@F9C@6CB\bPEKU<KQ@_,a
P39KUWQ40]6;I]A-T7cUC\Y70#^E/DUdQB^Y>5&a1ZVTUYC#c(Q[[CeNX#QaVIaW
Ug>9W6?\=HL:c#FVJBN8A(dXK+@P7C_.7=SgMBARV=ObS-a1@6_.HcO.N[\&Z6=g
X1bcQW<)e=;(VW]O,@N?a_G9;SX@NZ(X3fPBI?VVOP0Le<RGMVe.,1GS#S6WR+\\
:#D)\-##f8=AA#VD;20HO[<-@_,c;?K#B3:3+e]>Ee6GFH9:Q9BT:>SSDgQ7NWce
3I&:9MW-W6+I1Z<0CXJ0PaZ[E_D;FfZ,_@OM=;PS1=K@0<=e6L@U;G>8+<RO6?EH
]E:YFR[W.GPY#WN09?R:0&(d=g-\?0<S=1@/g+E9U7O-0ZXXTbOI>-9-2SbaQaV6
&:V7FAYdHg7<<(4_b\9[/()Z3J4gbN:0WU<aH6))bU^bb7JN&Z8H>cA-YPHa]V=A
,<1(I>faVNSOH/LeU;-G-SK@B:3/7J->N_Ae-/#]&BON?FEf6Pf\2>5SQaNM4Oe+
/N<=&GG@aAF?MST@R0+U#T?EMYVeOR#M_/ODYRH+eSFCTbY3DA2=D]HDG8:ZLYRO
N63&3_L2V(4RE=PaeVc26-(9)BEf2LMTX,7U&K@bN5Uf^=@?+O]7MEd@&H]1Ie_M
8)I?H.fI7-SSB3M6_Xd4\M+AaQJ)8B9HR^AS@F&+UK\@?R#/Bb1E=b/&OI3bBJ98
/B1\/R3a(a9+(.AJ+B)cSf=&KLT5N\ZbW[?=\/CcSW_-W)McK6HcV&&G]V(<E>IU
)KCQ^]<R;)?ZDRN=;(@:LRYJB<BN6A-Mg_<#Tb#,)71D-^?_#1/;KFG7Z=GL+^_Z
+AO^+De3DX[dCQ2a(eW2)>C/.JI9&D1eRAF1OcPASfC1=fE-T:2H7]gJ\R,IaN,H
E4VC23:\2-C)ZZ_VD:bGWT;PB1e;A0a\aAVJ[IU6IS&ZOR0=[W,FKEa/,Rb=I7Sd
&Ba9I.2#D.FTfCg1ZDb&aA:641c<K-37b8481;+@J&Y9cYG8U/\W[U_@U[SH??_^
L52]/.a(&V^?\gK[[=<XbK^V(Q3Bg\g9A[:(g=f28QL\5c,AGb1bF/?58.S@I3e0
3^AH;JWWWgbb8DAY^?)F-K&/IHWW+\-;7[7E^c_^JVf92T>ffa/dXGMaND8LL1IS
FMdD9R8_#G2e49/fF_CM?c#U=_6bGYX#P1[6U-f/ISY5ULfKN-6Q38gK1#_+-0-V
UJ[/RdEHJAMR;6;[6JCE/AC6.A9)#]EbRUaQDAAHC=+R;U;/R;EMLaGR^TMJACH^
;T5[-+;\fPLMgJ5,V2;-@LCJ=9Xb0;?0^:aTO(>0a>JgYV([=[?#UTegSU.+Gb(g
EeA>1R1ZPTUTZ@fZ7(E=:KPeQ)=C21d2^eX\BgAY=OEV9f3aOZE90R.KR;Ce=;J.
QDOdd&[OHG<<3U\5_Ga/[IGKfJ592;/aaGF0YJSScG2ad/dWI@2=@?XLQD45Ia\,
Q@JZX>.<>cV]Q-M;Xe1&6/VAR0(TC.VW?4@V\e?RH15D1GI61ED/4F/YcMQ/\9EL
TKaN.^ZXN8U@:BLP\0<:YX<FNNd#5b.dg:Y-1N7LK_^Lc3&)6H+=.#bV;\GH_M3?
LR:>7\[JL9E3e\U]T/M-43^a#=Q&B@+a8I@-NQ3TQ;B&=)P4^Y<DSJc_@POMNB_7
2caQ=^Y2B_,:d-+&TPF+a2<)/fRYE?JXJ=7CI;1\115JTN&O0<)IAb?RRO=Q2R[U
FLL&8]\NGSEK8+.W.I[1C]5L5U?K9?EYILU)?R\ZUY8^\W@&fbK6,>BW):dEY9J&
[CX,I6\9DR&Y1K,9))0QTR5A\FVX8J(9.XgUJ_U?KIJ.d6S_=Tb#,(1[F3LBL,-6
_+;[:T?I[DP1dQ:R)VS>=;8SPab_bgTfbX5?YXD8^GN]RISF&&CZP[aa,\@C6AF>
UR2EC,(eF4]6gR@>ZQ]6AM80K8IL&d3SO5.J6YBM=(Y?Uc]g6ZECQH?K51QeAb1Y
GMXK0+E^K;Qb:b@Q9+ING7PEcK2U;_7D6([+e+;b>c:\]K(AYSK9Q9/?G:3^-+&,
^d63V:?2YVK^:4W(2U39/,&>RBQ=gYXBNI1GgE5e]K]g7OS:F^/HdDVUa5dNU,dJ
a1X?<0@eGM,[+?<ed]JPPEHL6B=QEa.4.L>4fGC:R(O#\R5@9942(ZWF(0X1;[;b
&dZ&7#X7dH7GaRe^3\(e#]\T:<,]N[Z#)F^MS\)\O(ea9&KFSe/;W1gAJ;>5BN_#
+AT#2-TMb3W2;gfO<QaTSSZ3Y.FKF5?F68^?[24V4T33MAIN72GXGf?dT)_BCA<7
g4\BSY6N^MZ(PY.TG+\Z/7E5>Tb+E#eRA#6]7DB=@U;NK#U/1a3-:^(1Za.HD&?1
2D):OE08]]Se32[aRF0.@7d3EVa3Z_Q0g@5:VY#NT2.4&eFS0B</IC8<&_VO\QE7
UEcf;C_OR=fBJ])1#=U9@=Tg8V&;CN(/??8Me>9Q\cEG4U@a-bM]^]?_a\WS>e]_
Z;dBBB\[7L<LN2e1FARMaKN0S>TXc)_SXf-E=aBD4[>7@dQ2g,Y.,8CK?Z06:Z/>
(=<V;b9D_W8.S7?E<R-eE^9==-^gV>LBC^=CA/3EEOOBSd/1c.NAV<QH@G?/0^66
XLD)Bf_<W:+(U><B]8f<_BWA<)fYAb)LT&RJ,FEJQ\Sd/9]QPe[D8:.6ZZJLG1_)
Q\N_N=CZ9^D+D/,V6FB>->e#&[A:0SP=-&IRZ(&e\/<2]D:UD5BQ4JWLY>bNeg4B
KS:OT[:60:BcT3S[-M-O#8Q@UX5]<UHU,O-B6O:<RMJ\Se//5Z>G,@S)UE--/QK1
\bB1HOKZPSI\VN5e\;DW++f1\X;8BKKT9HS7URcCU#,-5_BG/-G7@O3S/E9[;+<Z
[].^3-PfX)\)d/#9Ec>(3b)@?a->Z2:eI]J6UP=)1H83=OQ-S+QAPKC;(Y/gQ]0)
3ZJ1_PeL(4#3.3?EfFW?Ee>/TS[2cbMV1Y8E:<6gKHQ-3LV5cQ6?KZ0#TZKMJ8.5
fFMOB\?0SN@X/03<T61eE^6)XTIR>_J>/4&M>;@2PLeS]4IMcX#-L4Gea3=PSH3J
(B?]M:^E2_J2>V,<^eZF1d\#dab<T=?9>a#-e=@a<(H6I5@D/NM))1_f.6U]?8W3
OWK@=LV9aa&GQ8:X^,Se1]^&2\H/PP/6]g?+VA?Mc^Z2&Q2c#:#6bZME/b0?66H;
(76aBGa;JcDR@McIW([S6&UQDUA60,5+f+]b38b2R<7YEH\=c\b#R)gQ2F<;+>9Y
5#_(6I4#&HKCHB#C>Y:G-83\f7(C^-&V398Pc7<QGfgDDg[2Z[(T4cZF=R=S8&Wf
LEVXe-FW?LP\U^YJCBR93eC05VUd5de0;]^ZbHed?Q4bC_=&f.c/RP<:A?]1)#BF
IaBI8,ZD6DKQ.-BOcUIc3Y;-cGQXP>R>a](S-G.^R_:5ac&-KfFgZ_#00[0#2DKI
<_Q25CF35a];1Z(UeP((08<V#T<;2.fg2A:#PXWQYg>C+WTOWB:R->V<NAPg4,5X
#@3gZ3b59f=Z;Y?A1T[5COE96NM4W8+Q1P^3([(2G-#GYJSHHH=74ZfeO<d<(_g@
2^+NGS8-4dX-:]5f#JaU:5,a>Z.eB>\8_L=K5F+IbY9/H7RG3Db&T3BdZE>#>Qgf
f7\BgX_RFL8=US+30I;88WcXa0;M6W7:+,.)fJd<2.#SW(;QT2^^U:BL7c)\@dGC
M@/..U\N-=[d77<;=48HG=:F<]eI<K?EWCET0B>/^37:6Fb(LL:1(>/^N,e<@&99
?PSHW]SB/=^\BaTL]XUY1XUO?3XHH569K_V=N)?^^-HH&@a.J+:Bdd;]-CaCB@YI
?RJWOWII9JHS34Dc=SJc(5FEE,\AbG59E>0P:;E7@FYfI:#0OPB[XVEZeNQG.fg+
PeN0LW:.9=#-I\_9,@9,cQ7=J-[2.ZV4J6LR,DUKR?7a/2U.9B[F2V:T7F8X2a&.
7<>B\5=0[8/?@B&[eO@TJWD-BMJ.X3B]9@aP_YaS-BK(T_)7HT6^;:,dbEZ+S_XJ
;J+<QSEO9+cL.^GA^,5?H/7#LS&bg0#<G3fC7/;J/5ac]/Y&-F9]JJ._@@\((E=J
QBXU(0GH:1a##,-Sb<894fgOVaF[Y6GCR9SOdQf]#R5[EcMHbCEEW2B\RBX[03OZ
\-Z#Q46TOCTQ[:-R&TE#NOH=6?TM8+OXYW=677<XcVDHG,.6+-<C716]Z:\JFXO?
4e:CE:RQc9#=Ka[\(MZ)&60R=#E5#F.G6F0TP5I=,](/?XAfKE_R#8e(W6J3LQ?<
G(GW-=-2?D01IOF0H-:<_2E.\DVS_Ad\.9M7TR>6J+6YKH]AX;GNB<aRD3NbcUf(
<>3Rb_[aF&VJ[I)E4FYUF#I\/P\11Sd5a<N9dGf+KDN:78OX26MfPZff_1/[Q8/J
L:N^D0QPI^-@0\AQK-A&6_/>S:Y=/OZ]P.Z^NRT.=0fZG]FaV9<Gad7-/>Mc;WJ\
9)Y<:X^7K-7bPb[CO:#=fD\ON<g7H[[BZ5A2U<O:2L=gg<=RKZeQ\AYM\=I&eCSF
K4S3]MYOJaC;cJ9P.A-d:19.&c=AAX4YOAF1X>]VOWTV5F_47FU@/MBc:aId8Oce
Pcd:FVK\M;K>2Y=.9)H/G(?U^.2V@\FfZ0W]?I6]M5K&W;OE4NeV-X0>VA_gC1:b
SBXgK6<L_BG/WEA0=R82K?eQc<Yb.&RVLGa7>SfOEM11.7JMVR&YPH+I1[60RGLS
H00&1[U8T;=5B;29Pe,XUF7H5GK/W#A-b?c5S9=1G-TSFK>@eB>G/TBWG<AdF/]\
43fV0PA&Md]&XD=E_d](g]DYL?aI13IAVI9>Jc)f][d_G+_0OJ(ZQPQ5dAA.84Yg
2^E6T#KcFK,adIFICGcUJ\\G:Y,gS5HO_4476-NaS>SFG@Ja>[D5cUL01)Ra-=,R
/2F?;1,).@LINag0eJ5KLU;5(;B3:CD?.:<>;8f>Kc1,<1KH5&c<,:d[&P(DQe>=
<9T1/97RbF_Z,&UCXF;f_@83Y^CZH]\fdd(V,ZgM_AH10gI&HcU&N,Zbf&JX^W&J
V11EdW&_=4XFeEW=?\&bN):(:5c)9;MBOead5#1X9@3SPCG]O;:^RZ>RU09=Z;g^
cXaZBL0&M?#3D<T/K/?29?Y?@N]9dX@fA47V=I-T-N+10.C@HD(VI:L2<cT60-U:
;OM9:XRgRdU=Z\Df3ge\<.AYeO<?P&HZ)Qf=eEO9.VA/+()?a,KV7SS(I14R@Z(3
Z(M4C8@e+1@.[5Q><6-QKM:BQfPN&K)]@K/\84Sd6^X-]dbbbYGMgX=SL2W;)K[W
:Y2NG1@,#\)RHXQU:W#Q,-;-HX=G2P#V-Ve.cL2K=>,OG<,<<FbF9@2b)TRKSY:&
]JO_4.?[N76cRNcY.WTBHafJD#=dRZV,5^3MFX],b/&GT=E:_5Lb?)+9QJB1I7@A
TK/^G(b0_TVWU)Vd4,WaPN_.>_=b#Z^2Eaf]V25T3O>e)?@#NRB3DSTTFI]Z#_f-
F&[.FY.H0>QWNY?dF344D1\;4+L?^Fb,50N(>((7NX^35L_e1X;Dc9^8Q.P?09VM
H7MD(8J9KR_VJ0\cUXX3Mc&@^8/_G^8?fWF_0EAcg5>6J<^EWTQQ5,A/?W5K]K:0
.J9X-L_IV[3N99.^LG78Y+g8^T&.4=[W8XQ94Je5c/]LDP_V=:83=f@<_S+K&cFV
B/gU6[>W;I:4>7R98,YFW:-\EgbZad2_F,G8XA@E+P5E=5..C?eLCP+fca/^g=E=
=a34X-PZ)6BEXgUfcWTTR--<GEZ=L)8N+;Z)_Of4JOR,F&.VdZ7U@LSX([S5I^74
c=TQ3(RB2[97KRd_dQ]G^M80<fYT[;(^1]9VfSVd3@Zf(1.Q-bA4L)RPP_42Me=C
a<CaD&NR<KRcO5ZZW.P6M_F8#)7X+dA9e_IGMA5,MAU?/[MM-dbe,9LG>94W:O5K
X=[:R=:\NLXWVN:F5A\HLaF6+XQ\G^BN<??KXM5V@A)W]F)YA6^0A,08aN839HGH
>=@51[A(:NeNbB-+GW&,5:da5@P=K_TO5Z?TZCQ-Q_G@OaTFTZX</bM,P_EAMac1
[3Pb-I>fKL^MBa^ME64gG8D2VB.-(QV9_.<R<7Uf<J4.//;+3RZ8EFN5#P?I+(&=
#XZ>eL\NdLb-+71@bGb(^Z:LTL-A5K(5O>NB0W[1C/KRC_5Rac#>HS,+,XUe#RV[
2L#0f[T0;)RX)]GR,^^Z[YYPC@I=;[.#1HSZ+9:9WS^g6IfBLP+;<cRC]IgIfN31
0b0&#?+]cLc7^5b4Q9<Q;K]W.RLAO^.U,L\F#TM^^XGbJSUG]WWF-/b@-9E_Sd)9
RNCYN2^W,L-]L<346N#-G.Y;<RF<?L;3FCV#COCKAACBPABg.-Nf55ABHRXVc=G?
U2L=1fF?CC]G@==&0:fJ=?ROb=X>+9;IaH=].A493=7>FH5+LG.E:QKacfNQ#)2>
]U._(OW\D4dPVMB2WG5BN30L^a^Lc6R.#Y\^]K#(_3(69Cg&:AP]M/2fH1)KEQR.
6ENF3NESg3(^dfR)P55f#F5ONaL_d?dE&/DOYH\e6_VT]I[9&EHB4:QgXXYdM=Ta
Z)C<W]8=6J2OW67>V01.-ECP90:-e=O93+[e/WL8,BfFMUe&;ZF+SB&3FN=&.RbD
]2b[=FDV\a4@BWdeW;;_PWaU^a27^6_0:9QgO=&:.NNS<IOK#gd&#T3]??D)?&)O
E7A9T\E&1ODXbcIdX]K,Y4I0K;_LVg\+5bH=_/PQ[GOf4\IYA.(<+3X#cQ,^>W(^
2:_-a(9gE2ANPc3VOf&2ESa[7[CGaBNIagQ[D9_OeX_RKT\)YX\A@0KNAcUU>8BC
_c-2;P0WXZ?ceL6b>&7,IBd&0EE_^ZCW?C4.\&deN6d^Jf5L5LG;9)@_\4BX5:W)
TLfB_V<J#XQP#2T\,LU#C-]L4))DSO9<,Y&?<^FLP&&Z6_F=V-)Rb_2>XD39c(SE
XeEU_6Rb6?Q7O&YAC,@WH9Zg&LMNI,^HE4A2+F38[S[4bX#6=(QND=TSX3e-Ma03
4-.].fV#=H47A4GRPO3b]@ATN:WOS/4c-]be9a(.N3&99.If3L0YJ7BF>S1BW]GA
?]@/L.+Z:XWLH&_14/N6T,JIQb^6/=B@\M??1\ITXC[=RJL0@:\Z7TQQH+>=5.\5
AgB^0L[0/9V]2J3\2&_SA8)d=+N>JPG8X=Y_YMe@ERTCR+QPR6Z.MQ9<D(F?N>7[
7bUB<e7I9f.O,@ELE=LC_g<DSYV3S[Nc4[8V+U&Z;M:YLR_^gb_ed3@JYW#TR+_:
[>7(<ReDL87=c]@KW_WZ>.86(eK]PQ?JD\VgVS;:OKJS+e+B32YUAf:;#:\B+PHV
cBO0-0(M=R8d1OPUOU5OST.RVAV>J<d0J-@@-;f[4K(QB3S9TI4)Y(+53d2HK/N)
,0V.(J2(9+^0Q4.0>PVX?OTUg4_Ta]S)^Qg0;0JVVV6-0eU9L=+^U[?D)+?Y9,R/
6NY^+.&-f:=0HNgKNe+(-I8MIGPM4F)C9[WeZ2;JI/Aa0Y2/5AQ;X?Sa;)NgGK#3
M;ZNFf>:(DB+GK6IC?<0DSI;#?CN37/K;SKCFJ0e60+ZD,#Y)V:5d6.1Og&P+=_@
7(6EZO?/76K.e?F@@CKgaX>QV#S)Lcf=\aRKb,#&9&g8_)+;:B,<LC0fV)b;_0-,
bJC>@=4Kb:K^X1B2Kb2R<eBE=J^R#+65>M&-P=400369&UaZ0).IMB\d=0F^UVSK
aTGK3?.?,OUO25S0;:F7Z,AD4<+;JF9(bA.Q?5A8=d3.M/cVGaR@GLF8Ta<Q92,+
MMa[KT9FMIK1]ZdDc;TTW-5\daD^46KRfP^.?5F[]/_^gZb/cPd6d)Jb79=K>9EA
Da@K],9D,;f9.JY+X(\U9=:RO/I&(gN;EfQ2R\P_<V&\KP/@T_3I<T,K4SCJ8G)a
TfSLeVSIBgO)G,&)K[-K3Ka7:B28?FF+>K[b4E3#61P(62[V(]VKb\V4c3C?gWg>
EN0J4[X:Wg.D8>7YE##Mb5U4T9DL;.P]_>M_WFJX=P?[_7N6P4.@=R0=aN</^C0G
S=[9Eb9]Dg()B5EGfUNDaH==B+03RW;F0JB]QMA7;cI_:#AK5F@3@cVYgHH_C\9+
1,RH#VBVX80VbWeDY#eS6?S;?^X+@(D5U>[NX3=V;>[50Ee=bQDUIL/=ICAddQ6Y
#=8T+-,-b6N&cW57Sb6.D86M/N^0>M)X(L[.AQBB;^8dQ^e3ECCPfCPU&QgM09a.
1aM@_Fb/?MZbEVUMEU75<T8=>^:0#J)QTT:)-OM2Fd695/ZS[D>D/S6+R>5&>R&@
C+23#H<e8DF.N]I-S^,]Me/;f@RC#eWA_V4=_#UF>6R=8>@/#Q-b?8cf\<.f&NG]
INGJ.82SPIAIWGALMJ/3_P8DX6D]#WQdZM?fW1YP1]P4J];E_N?&\c;]I0YT-<N-
U#,V[RC]agPNQ4F7Pc8.Ig\E9^SY8NA&?[Kf]cLHFCd@MLd05I=?:.HBeaJ?Y@RZ
55R5UbacBBMW]\g\O)Y5):SGH1a1J0=g;1\b&7cO4-W/TMPO.O?H60D6RR;Y^;;W
IZ^=OW=?.8RSQ[,),cB807&,IT4>KW)CQ4,AGd)(?(MdEe=;LOfWMTef,/)J0R3B
6,ALf/K&fNO/+L6#E_.eB>P<O58.3-0XRHF8@cX#d=BeM,U,A2#;9IH1\Eb3T.fH
cYWb82^99JSQNPH@W=@W6VWc[P:Q;=R/I9D(8GOPT4gO=]]RYP92ge\Ne<fK,\G4
^L/TO(cH49<C2U.gM7^7,aU7B/.Y0?.A>[8O8#&YLEWY=<&PPaU0P_N;H^-bJ).e
VBH7-<WB6L1W2\[P,Mc7e-VZALf/,@WU(-]>,<a+R]_L8d5A[-?V+T5J>U+H\8-B
3DF\^][UWJ],G.W=bd,]=&\AFSJ,aD,#4X).^KGA\?3(QQDU9VY&Y>K1FST2@&PZ
/TP@I;27K,:[I)Ga/?7EVbOQ58_W/?&:9:)FP<a,g20+\^JfKY>d=T)3JUOPIXd=
HYKM6aL\ZTDXJ-N03E2R)&9L.-g@McE&2K7>L(6ScX)K:f7CW7-]47]QS-JRSD2Y
J7.D[\^1C1/G2?>VM_MLaV=<3R[V7<_OK&.\6ZG5)f,QHR3OT/I]Y:D(2TA.7^QV
-A0X0K-AdVED\WQ/a:P:M(ga3Of+Vg)^cLLN-ZPIHgPKLP9gD7M4dWDP9CC6f^RJ
/:f^R1JXEXPHXa&<5.=C?BKEG3X;9;B#.4M1K3f(@07^X:UZZUCE3^W4X#_S:Y?]
9,DSI[2\(/>G&X61I--U88c+_\ATUXFHF(e]+d<N)VY4IgG8P4(\c,W4M$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MX25R_LOW_POWER_AC_CONFIGURATION_SV
