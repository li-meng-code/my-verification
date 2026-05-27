
`ifndef GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * ISSI xSPI_IS66_67_WVO_M8D device family in DDR mode.
 */
class svt_spi_flash_issi_xSPI_ddr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_issi_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_issi_xSPI_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
VFXHOKd2O&V_]_<0B,A_e5[=J\Q;FW(SZDV/)+2NJ(d7NEJc[MS^/)CeJ4F?F,R2
AF3C(Xg_R_OQ2+KeI^\K1KKGSL,:S\K(<FBd?Y+(Y;OgbeKR^PX707@SQY?MCB]N
>Qg=8(([NW=NUCSQSB)NATN.dRS0C4,0ZD8JRMg:GD4e:HA5a\-H/G-,f90Df2S9
ea3SEA]D+OOHTGA;]g6P+DaJacP[bW&gV><UaT,<QUI(:^/]\+)c#1NcALA&-E-N
=M+LEVMfTM6IQ0OD:aEbeK?(c@Y-dFNV9dMFD1T[Y9UV&5]L:OCE&V&IVK8dS1[8
+_&T^.JC3b?C3FHXU:Q)I?D/>_+R&&SS<TfL+M,/YNRd1g.g>5AKQW3+?aZ4;15+
Jg=0N3.]38&b#@YSB2F_>eQ=R3aU8d138JB;O]E\@d00;.-dC(_A>\&VZ42>2b-a
aL_db2f0/Qf8;\eL^1RL+.Z,e^bR]9>,gYE+OPYLN^>;bdVJTQH2I]?KZBSg2cf4
BH^eR(d2HO59U&UZP7G[5&WR9RT33XQFM_VETRc?XVYIJ1gA+.T2F21=O8fZd-\I
-.#_YGfCeI=MERL:)SJbY/]7/9J;?#aGg7eaMV)C8a\:PBF&CfYHBC-Y?;]<M.#@
2Hb9:0Ub]W7:,.a=J>IPBQ^93_D0(R;CWX-O]eX&]SJ+Z?BRDEXZGX32G:9XJMf<
#9TW5IDe(a)c2N?^QZ+<^RMJTU26<_g-e?,E4?M&K9&28beK:MV4>gJUGES+VCA_
1YQQW8@K,KDd<Y[;Yg,YRY]d,d5U(YU4A-QYA=UC_>D2E$
`endprotected


//vcs_vip_protect
`protected
F1gCK0VYf?LH>ESRe+SWYEf2(H3U<27/\/CMXEF8ZO^=EV[aANJP((<7]>?aZ-\^
;SGFf^VG#<^F-+f(3MQG@EWV3N_.9Y;_V];4W9L0QWB]OB:@,KI#7)9UCKggX__Q
7WLOO\(2^;V/)gNVMJ@]8VQ)#P9QDJ-@X^19/J6(KFNE_c\U#dR&5005F?A9&(KT
+47UffLM^(BfG2C4R#F0#=c<2<-.=>K:=)/WdPWXE4GEU#]_cgVZgM?Q-H^_.XXW
c+;GZ:<d^\]DGML:bNBMB-(GUWZ]dT>a<=J4?DZU0eRTB\<1-+>:A&_adNf@S8BZ
B,@K9VKSc#>]1VRQTd;@7#eK.O=;7M5=UPH+Nd_\SbN8<LZ16#Q00?9KZ^cR-.@3
L&aeEV_\;]FA_7R33ebI5+Z1A>>B.,3fHO&U[OYQFT/KNORJP:K=Na]>YZRYC;VT
M(-E6e-J.7Z_92_:TJBY?Z]YGEMWeQKHO=Z/?f-X?R>)PB>Q),=3JM:8=aOL24[Z
UE-;>Q3:G,8:=HTF_SPWZ=E(:3M2+\/4K(FHJI1:Ng+[IY]=gdb/O0?:Ucf?@MC>
T3Ib<d2#M8RLIaTQQH[FM7,AQW?gDOb,d2FJAe?ae.KO8UBJ02d6c=OW8?O)]XE2
47:4UbP0C+O=NC3;eJQDK?^U\M<Ec5E04IE\H8#6eOEb022HANR7/87Zf],<=M:^
.V^<IaN<b##X8Kd?GcO3\c<9IVd5ad?WLTHeIR(4EgBEe@fBPHUB+Dg_MLF[/<c5
:f^T3S_4X7I/E4E6QH-DK29=8Y/0BXd^2@,Y?Gb0AEae-af<g4@R3Z(c@1S_f+Yd
E_g8IW[7&YGE]aQJNM3\R/9L<R&F#C)fSb7NRO<;\OX:7+d9OGE^2+9U0P7OX<IK
Q#N>[1U5=0RdWNd(&>d\CIIC(121P)L+RDQTM#)_e-A2eR:/U>;e\UWQBR5^8fX\
&6EBa8f@XeQQ&Vg_Mg3aRK]54K@/\FEC/fbE:e4NYL(+P-?-L-,2;QZT=P&+3+.:
]A[bWBaV::Z,L?D;[[5?Y-H/\P[/\f]N;??H#gW^&HFg>V1C(/M&+UT-FW>I0H5b
+^E:>/M&^X8V5ASYFW#CC]3HOfH3@If.;<A=WaV=5._-#,;0g@g5&g]0X?3,LE?H
V7V>L6#[&L:5&>GH1\QI-?-V_^4@13DM&R#I7Ugg(Md.FB.A(aY=4?bN3V?7-J-a
JGOV<33AW:=;:=1W+@LH,02/eF=3[I#H8[/.Oce&/bB4F6OOa]6W+<@.FK]6E&0#
E<<9/+Q&+.SGO2fT9f,2cLGEZPDDg(I+[=7>O.5[d0X#FPY4DR>,VWY6=OeD:>;:
ORJIf/2aC]+,3YfB0UPEIUENaM+]N&(>VdF:>E&8^b7J9<G;(MN[Q^EFL=?4YDL=
LJL642(3S/CdHZFGd(-aC_A(<X&dH@?F8X#U^fACC(YNIJ&d(E7LRC.AK5O^_@/U
K4&U&:^YN77+Ld8dBMS@6PEb;^b\E0O,aY;J3Q5OJ,HBV6]g#f[XQa5YD8[.22)e
g6U0UBC_2dX:;.6NXZDY]VSd44#eNfF1E)23/)a.0NVKOWd[B(R9[KD;ND.&_JL&
OUf2:\O#X0AID6;W/Ng6K8@g(BZe]N-//F@/0T1X#A#b+2>BYdfWSCXS(bK9LW9?
<NUNXV,[W7DaX?GNVV(#_\#,X[g0&FLHgFLZ)SHY8N?[<Y]KI2(=-H25W;\DJJ&d
)2b=A>2/_/b9YCg.X4bENP=K3BO-IG8/Z:>5RAW5^S1-IAcE@69&21Qd(0U=/8]Y
]c?(_Q\e3dV[1X6fJ_bCFC)4(^I;=<X8\I9>U^EK[:L8_I;^IQ8KEJ#OGK3JU@QH
(DDD40.U#O>VK6RK8_?QQ-geE>aI6M).I[HJC)B3>(RJNXC3//_<-XAe:&d,74^1
Z(:KU5):2Y)6/[/XL^:QH-N4,e61P:MO-BcXAOF5NNY,eIDN@:gE(3,C\6NSU=VD
6,S_5TW2;dHM0U:d[YKE+PYJOa5WeXUFb8f5]f1dCMOXBJ&ULZgaI]X59B0;X[06
_<4PD)^.9+AL1)+_LKb^bYSF+LfU=<3G0?-?-/?[5>GV;gPO:TRBY6eJRbWD(@-=
_>#/@[=G71CaaG\dN(J_1>2:7S[7BT+Fb9\#^Y]E-VRcEN?.E0Q06>7<R<PD1I(.
QS4B\I#DR0^U[B]7</JERIb>2H<LUZJ-7^?/OABdBAfc\#K)[\^-TO?LASGC+#Hf
8R3=-HH1&7_:a,^WbEZZ.Sc3)L[@5#(F#12KD=]\8G87>?1]EFR=A#5#3c>-)cL(
C+90&&L&)L#7<G+;?Y7,QR(@9X4cMH1eQXPdYc449Jea:,Og>N<NgXZWQ.DUKb1g
LTJH(++8YcOPLIS6Z4;8(V9?-EGa67KG2[(]O(K1]J;:b]FQ75L;?J8Qa,@UBdX3
b0b]Q]APaXD5Qec.HZM]&^dC6:gGGN1R;)e--]5V&]KgIU;^fd@MO-Y+eP2TTg2b
(I>/2-+NW_Q87;3_H;O?XW82]Q\@Cd;3f_I&?SF5Q#g#XKOM,U,MS2b?3.bg)V]/
SfFgN0R+:)Sfc5@bOa3?aV\\L.5de#DEG>DAW5YYWS;dSGPfB55=gRN+&cQWgf8<
.(bQ-@P/199-BS\8-K43aO6;4&H765-F>b@.[I?TbPL^K7.1CcIc[6(0G\)0QYL^
aTH+3PVAXH42\=D]Q[NQ^Zg=ZVZ->K+D1F9XK-#UKcee7BE(X6(C4\cD[&8GL=cE
(^WD(RU#+B0fJ\U5bJf5/F^IE,a3>FNLL4@]T1d4\Q(.S#?[fW5bZ-FW0b64ADV>
YI7@#F1PHHCAg16TTbXFVaIF1N2?Fb8]N<X&,La:>K-Fd_e?C:Jd4;V;BPEZcRNZ
g5fTgC3H:RF/?[+Y<(.OA4gV9d:e/NUF&&?&6FPS&\2M;@U-OP+;]SXVE[B.MPV]
DQWSd;S#8/\0T++V3>aX.9c>;U.SfV+f_NI\:NW\EP\1EL1O6#+)@(^VDUB.6FUO
H@C=B.bLRg&gb?;HAGRK-<O01L;H16bU_5TBH/:_BQ5\IJC@^HUR:&VE[D+Vb?dT
4Pb1<e588+M8=J#_SW>KONS[IQA>7X<g>3_&T08;+,WR2+;>\\7+2?NST3NERNbW
DL@/GbDdSO^,3gb[FI<EgNaE=f;L[SV8G(:0HT&K[d+T6M()Qb9B)1JbU1UeQ^6V
J-P1WZE#XQ5YT^@LfMd[?@^Wb=.FV7g\[Ub]2XdC:&ZP#ZE?RN8XZW+c]_J4[_/G
SFB765S->7H=RMf-/WZe<DOOI7L#YJ&H>YL40.5D][JOM<M)B.PTOfGAG,V:B)SB
(^5/75?Q:YYXLb^dQ:LK_dWe9ZUL2>R9P590)BF_2aN4G7;PXe[]gD@fN#RRTE5M
9AgH;>eCG-fd5\2fKWJ8UZJ;L&9ORA7N;XQ6V.DE0I)Xf5f^2gBI[b\0PILS+Hc?
Va?bgM&PT6U=MCH9GYF^fBgQgcF1D6;4;6;6N+ZMVP?N^+2;6aU7\?.AM5AOB3UA
,AN;c,A@6DL@)T6DdH(YE97TRJC:dO15371&7E^Q#:GW[8<Ng:FNT\K,#VAB3D,@
+E#.gW+2[&6.67\P2:Z+6^L^MK:GC+.O([5B9NX^:]<+MHE_R,[&_KUZRKMIUW5?
Pc)d;+G<dQND_KL+REaJ2YI-&+DQe,75=GJ4^^4GF0IHUb]C-+,IF?eZSK7&.@a0
G]&@[/_GI.AB76]D,B^32NU-DK,^LYJAU-Z9C.g\<]M)6LN3<4/]2-dIff9GI>(E
_dO,Y_/DHc_UHMU7ZW0KUSBSHKbG=[GUd.Y3WEC)[_f^9bZ_YQ-K[-QeK55a<8[U
W(VHK=cdbf2Y460,Lg>N\1CCI/TZFQO8-1/@RWed>N\R9([?1BG<A4U1E@#<8(-]
X4=PC7BUfC_M.-Ib,6bM?gc#+2\+>W_0>TGDe@J/-/\P/V=6:C\PfP5]05[[+7[:
J)ATEd4_]V[X4<?^W@E;J@3g9Ad__3gRF5G\4I0gK8W@XeUc&TB/CC>fRe(5H,0S
IUU;=[K]8A1CN[b#.448F)H85CB&e#&T,](Z^9(P76fBeEP4KQL4adPTKdADF.F_
V5PBXGWL+TGRS:A#R;I;ZQ[##4Q.J]aSG>45(-)AB)LZ.bA2W[[=F16N=MNf-[[:
eJX06PM]G#T.QEC^V&K;03e>0=\0&&a^8Eea(=M-,@-[bIHRd_<B+9DbN;YeE^_e
37Qa/<4<OR5RQH^L:\[O-]692IWF]4dDS8FJ?PJYN6E-QJMCDHKIOMRHD9cECa:#
-\ON0YGB?SU8^11^]RcY/g7c0=RY9_->[3;)@&;WEEC>::W8R,3g3&@:.dJZ@HH5
::Na(1g]E:H9CG?Wgd9O<&Ve1=UY94/^1&A@80G:,YA@3(-2_Ud(6F0DgQ/3A=b4
,YEGb=_(.3I0@Q+U#82/SaXQUTJeaRA=;MP:>gKJcKV5;9._XG&g:(W2UeU;L[9J
cY3N,IWeX.Q)>@P,gGaY?^;+906HKO_;SJ&VKV_N(b)A<<OHKDd0;#F=,@BF&ZLM
5c#fH\HEa(@&@+2FReR8(;3Pga#R-e>#Q#O@XJ/1O8<_>gQH]D/Q>CHE/eT[:#>A
\N\O(]P_-EPU/,@\[V:2Z;+;/&f8&&.\&T;7+fWH_CH=?/2e,J8X_XHT3]<NIOVY
ce@b-+e71SeQGP&5c:181@<CS63W5_QUWHc&P>A/)H+6WT0Y:D882L.,H>ZP_.Zf
_bL3@MdaWg]FB9?VA7gba],S/d0B7;4SZ[KCC..a^H^P3?>?&Qf<7_7OG1MI+B56
YG@G:1JS.d#FHWce\?X0Z<df(E4Q[e;B6>I(BPI,4bC?.QM9V.SCPVaZHTT^(\(6
TC-=B-J26c.?,ge&#9@MB;2L?O6LC:McF#5T<(O2W=5E9:dWG3\#Z3MF#]9SDMD5
L)I)F-/ZXY?,\QeK/Abd+0P][Z-@2bZcQ0SLE-EC^_S0=P^:JN9H70^Y+#8g#UK]
\7D4[NIAP,/Jfbc<AA;H)Q6^eXWF_W:8J]=#-GbVMI;X4VaT2^L0g,Y(8TVDHZPT
[[19=Z;B4a.2LI3TXMBS8RYf7N6/6>5T,bETC[/a>:G>.2040D<88Rd7#NaZU4g-
729R\BKB&?^/.#R+,#a4/(30;8Wge-ZNeZZAa1Z4#aF>5F<)^g5c;8KL.DG?3ZI4
UKdZVg8>_IH<c5c/GWU,L<S[<O2<?Z\DO3E;VfJ0ED(U<0c5[M5Sd@]?T0Gc_YQ?
]^VJ=<-+7F:^U_PfE83PX+)#0CJ#_<+6e>Vg/YgB=.WF_9JBEId_\Z-FJ31FYL2W
854e#=[&;#W^g.:64^M5I_\C+cC#JP]J/#g.JXXDP/KT;O\JD^]#GPa]MACT=eCg
BV+daV?#=41OSaZ0\\+\5AN?_BX0,#\SD6SKNbM>7K];?+_E7NX\9c4,2Db]BGB4
\(6(&@-5E]U4B\P45BF]W4Q,?87_/R?ZJK]#EfBDaA06,+V;a-JH:53>QHH2]7XJ
8MESC)BMW/PJHLL0,/fO)7dF[G)M(-@<;0bQ2H.6#ELV\ED^UX55TT]_HdVDA#1<
<Z@:5/c.A<]^<P+&51,@E:7eT+24MC/Kg]S;NC;]QSgcT2M0IPC>6adPa,e05D]b
+L7KLE8_BZZ)Z;e[fBPO]]AX>41YF]Y0L2Y#8SOZ:2O-9&Z]LCa#ZB8[\A^T^NJ(
DZ-T7JJ<F0-32g4[:6<Y;-d+f#1V>TG(Q?TTC(ZcYMT<@eJWfU11QKF9aWG1c?>N
_HX[L8a.]VK&)V#g1_&8F=;CEYP34RaFT8]F^7JM[=D[,I_G5,-)XPU[cE086;]:
]eXK<P9)FX.cTCNZ][)-V6NN7eI7P2ZV^M?9Rg].^5](bL@=VN#3ZFYBA3[5R,1F
87\T:]J(a1<M^00;KfDO2/(_Yb#)]7BBg)2=,FaNf(g[PD.>AW7Xa5.7+/V3\XQ-
I1T\(]6JWO^,-=DdABRDYH[W75d(C]81M9LU[WCeQC=a1G/A;9L:(@PE5)H)^fgF
0@-GfPM20Q@&FK[AXYG#D#ZOS=P&,7CM()d\FUC#KRF+>NQE_9273e8FZ0L>Dc[<
EfW+0\3Q+1Sb=aaUO58[TF)_fY,f\Kf>DE2U[0/OT0N:fR<WX0@H<JAK-#<TfPgV
eZ>eSR:R_#H4T2QIWYB<4g_faWVJR+B<Pa11;D,eTXA59@;#>MFH?XHUb^.>(D_4
dfWAM>NRX;2Q+73O:X^^QJfJTdPNR_Q\#>O,GY)<&/Z#U\#dd_D\0..e]ed@1[6a
H#)6@DWaVL0PU\CS5>#.2Bf<<bTZYZFA9eYB,;D\_YXTO.^M<)T3bS:AAO.J7@80
C;XVIC)#<EeWE>E,^0@+?D:T,E0Hc^a.LK@U6T050O9(RV_?T09,&R/I3BGY7^bU
DQa)4g4<K/H.:@f#a3d,dW_eH;&=5J?,YgPCJ]8c2\_(f#/#\T_AD9bL<=9^PPMN
+C81DKB#KaWVHE5_1HXXZ&8cC2)eXD6]G+T,&eE4XRVOP9DbW:YAZM>@6cAg9L(V
[./:2#eR_]GTbg_ec,2-P:IVd?P0HfQ>MDT><gD&/\<F/R98#@DF,7gge=5.^_E:
^9P#8H1C(?P4VAV>d)G89C;]M]CUO@aE4aWYI^A;BQ@H&ZAD0V4U90FNX_+,,-1#
Oc?:],@YcbJQH5G.YZ[QB+O<fJ6XED)&XM:_[fZXH-A:,cbd;D)WT874,E#[.\ZD
A-1M8WL4);<(41\<Dg2@&=4UQT4NS>M=ETaBU?H)(@N,LC/#HVP5?8T9)V?)J4B9
V<WO9,8@2bM:^#:4[aN2K^We5U(]W,H>TS8\74PaR]b=U5YKHU0aS,,_@@ZOgGSd
K];N^YfWJQ[H8F0[Q5_5ggK4cHXL6VdGUTV87V-8gePS&514>-V6R/AH\VC87\]5
U3+R\UI12UEDS46;c^AFcWWgO.-CNG=Z-UBF@;F>#KP-;H.#XeF7gC<bfH,efcF<
M.BRf&:9[VL+Q_43#5LUD=[26QHNAQ/J9_E3)&5cFU=F]Y&SF^&2JCAM,S9EBX&I
Ogb<;FQ?Hb\K:M+HgUgeVJfLO,O(9f2fAW;>(L@<J>1W-R\RJSF@YA,+_9VgJ^JR
Df=bW1E?:bNT0DL3cN0^IB)X]aC3V3dTU508PIBKQCcV]_J]IWL<-BBI],K1&<9K
W49+ZJb_FCA6LXDH3/;WYHY&2^YNa(M2:7#+CL6Id_T:&,7W+3ZXXFO+f@.Hcc#7
;=X9TPg]Q>KG[GIY,44f)dT3a3C]7CH/D0\aVCKWN)LQ4[eS1LeId7X3A7T_K)LW
?gVJX_=ada+W11A9YW_;76J3]H-P:7Ka\_^9FYa2MSN3Y[XUJ(T+9OA71HGQe2)E
U5YcM2.N@65LLeO/73-.67GG&=.aW+YD3&^LT]0_]cGE-861&YS)F87:1d0C(c0d
Ca>,C24DP0-SG?8,@W=Af1X&0:CBaI3<)&#18R461bMN9>&Sf;0\_2/Q\\H<eDJ#
g<,=AeBSbcH3/[0=+aGJY8bVFDgI7WY1KS:>B-B@Bb3c=2GTDf=YUF9^:V]B_7XQ
,c3W+6T@E4P@7)R#V7/;8)\=-27fCKADZVdV3F-?A?bg.SO3@J_)>H31X<<[NM8B
YXO&_VNGfSa4[.;@G/1/^VPfgU=KKQ[)(W3>32@;7cL0d1RTEGZH75BM8#+J4:=5
950gXe\XDAQQgV1S3b>(_,=B7;[Y,?aK2IY<1/KVR\Z<4f4aa&&03^IDQJ>:Pd+B
Ub.@c<BG\@[A@EA6IJ^D2X+NVAD@e=VN\5]K^NR&SEUUZ[YU0SA8RZN@S^c4O=8P
A+FfHO:2<a>>XRT_F8E)Ff?dEg^\G>W+M=LPWP@<4bO,aM425:-_05LfQ^[bD=dS
J(ODf08(FBN1<OLK_>QKSJPY=<1]+/>Ig6)[J(f+&7I]Z_ZG/=F9)Xd/&;d:;]A7
R3?IE[dZIU9))6cU;9B@3VM>;;Z)N;8O]2:a6LZgf?BC.;M?SMf^eTSe<X4e)/ON
)b4eVdb>,fEa1f9gc1WS,AQ\<0>,T;]U+S-CPCW,T4:.[Y<180N1[^eAH:5;aI#)
/L#<XZ:?a63,T_G3.[+C:7?E@B)+0,2&P9O(6fGOLWb],6YP/YbM[9ZVO?;fT\X7
,GUO_(I83R452AL2,J0H@NR.AcUX-]7]_9F-aeQO^W>1Y_\ER=DQPX^K;c@f>PXZ
7)&#.g+5UJ.?R9-.OJL:27c13RYD9J;8O9(DO=\1CER&4/C3ff?:?Y=Q(&L48-:1
:DCK840ZUKZR4-Y&ME);E#(TUVG.:cLN2@)[#QbddNP@,X4W4\8TJJDf@/A<E<,7
;OV,b1+)DIPdF[;]Wdg2b;;P^>069\4QLa-[_&YH3+,#)9+N:UQ5Tgbf8?B^3AKA
XJ7BA]2XTJE^5X=DK)NR?SZ#P#d-R.[Q18RecgT3+SKYW2K1@)A>_M.SXGDAb[3/
Gd\6/MBP66:)QY=.[[_b;S=P@X9&]WNf>T>G,+CEN<8RG1[RYDCYC2bgK<[S@]Nc
Eb^MI&-BVUNA5:5JEfN8/]+LeHT6?1eL)JI4E21H2WfNLNLa.X:cbf^C?SS1gSH8
(S)(?WH;3L)[:?cB&OAfRP#8QAOO<a)(&f]&UbD+:0JGJX(8f@&(7dUCQ(OMT0Yf
LN]K,cSAbTOFd6??2\E(8>O]\T?a9T+Tef^8YQZ);O[?5#RZD-a=\5f,F<N/-4]8
7BCg5]SBg1)<G8A&-PCZgDQY4NYUT8,+2HAQ-];d&YTOYHR,MgfR2\5O^+WGHB9?
5=_9T=5b621DG1F#3M;[S\E0F]+F:+_@OO@FeK45MQZ+Dc6EZg1a7US?M<KZDJ3)
8_M&7J[[cS581?&GbO[#&R.#FO^)]59//Z9>_7.g&_6C4E\LBdH>L\\^ZK#R-b03
1N]<0YP]1O]OVZK8@UgRG^CZdD-V?KI[\3@IQ4.V.-LLNRHB@I7,=CU25b-+DEY,
U.=)bdG&\T9VI\854I^9)a/N:OdXD#7FKC,P4:C&.<c@D+93UK&gZbF;33/^[:Z#
0]]7[RYJgP5Z_:ZY)PBZ?W?)c2#69AX+AB1,HZb3>,?D+A_@>,b82_I\W.CE^PDL
GR.eTNcT;K&KSH(,X):<e6b)>6(+)Qf:GB?8B\S+K(>Lg-?dNg5/YCX(dfe#.B9K
cbNHS0]M)/MY-fK4E>=/@f_@W-=0HZW/H,fL/F0D)YD#>4a84^H+)UdfK4b;2P.M
AM0?JDPTOSLQg<[>e/JAbLRN[_#\IW:G\5e(a@9<0Q/If9Ag<?FBK#KSQE7Y&[.5
bg=D_d[9/9P-ZL945NV67=78VR<dcCP?]-.B&C>C^]#TP.-M882312f:F,DZ):16
\+1R8EKAf4_EcN]#aa;c^O[WGB[+IX&EfXTKeI+Q=-;Y<-C_DYQ2eG;LL0gRM_@)
QD:b4HSV?WR2_O8NMMO&@H\S4?1#TM8>#[#PRH#FabT_5&N6Ba&T4E?B3/eEf2fZ
DI8NBLGG,GAM/Yb(A?>_&)>^&^(^?]F:bgO:gb8VAIJ]d#R7BQFG#bNS1>3JK.1&
b.?(_f]MdZL>W7\bEYK=-6X6X9?>OOZcY)>Ba>gUL47@+H:UGTUXRW+24R\9(_\,
BK0U,=X=VE?fc:.f=D4E1^cdeMdVbf;b_6gGVXHJASHd]TANHBW1)YY,T+)YGI30
fDYW)6MEcS9)^W>&/.g&A;.6E5D=BIU\e\^WUMR4_9U63fUK=(EaEIAO=T\TVbP.
YRe#I-NM>L\2)M,8M,4b>P:gHc;=C+6I03?>;RT\f8T[gVS:4.ZG<V;<[K<MIGZL
B1aU;I.G_EC2/eSUPA7VK5+(LBD[V]bbg8-2YK\QVL(RdJ\9&eGJE40LG5@_)_50
LA94+cJR2/Z=&64D0.ZICBQ4D1-a&dHK2WLfJXfdCE[)]d>RRH[V3K.M69J>U<\4
ff_Q<.NN:KcU=f_)1cY&O6T=a^-b63JUd0VF5<V_,_D=Z@af,R_(<;Q@5._,H.(]
N>I1X?VP/^U^bdZ.aFJaO:gCX2b9(bD3JRV_aPKQ:?QZNSW]+g3c47:,]8?<F,D2
5+d1E&Yc&/@?Q#00[TYfUK8X5&MJ,-64\]XT#.d3E\]-g7#S=dBI&WLMXWX#MR;R
BYaEREdd[2ZdVRK1)VZCaDQH^T\0Z0\f=</PU??8TQ@H]Y,T^>+d\522KTD.?C,3
)TCc&YT)H1_Wf>3S#aX?+6S-?NO3G0D\YN@^^EI5/QB<>-HXRe9&e:?,V-AHK=aE
bg,>5POaRDY^5MVHW?Y4E#-TQNR],:EG.<^<9=(f<I1<B?BRbb]a?>bd<SXDGa&d
HQ4XD^P+dVQUId7JdUGE?[-?W6>JVI(EYE6>9]&?8K6W6b=e@<g8W9bT=?J_La8M
0&\)f/dQOdVZ5<^D?9X#(]WS1+B>9[.:D.L5O9dD_9ZOKL.X7e]:4\)GWUN-W.O:
;[^UQ1T,I[J<FOR(+_cV3Re1f+>F8A&b3]<QHRR]VdX_).CR7-1<.NVWI6I-(5UY
6(XLOCR[85:GcgF1F_7\46SAK[F<&6g9a(B;\/>OF#^;]X?ML7b<G6?_RW.GI8b=
)TYVO,O>J)WVg9(,^=&&&11D.[.3L<dB<M^,(:.P<MO4BffdKE)Y<@5FFHZ3BRg2
&EL)VHEFYY;<W0dGCc[fCXD87^=J<S285e5gRDY,;8BWT7Y#a_Y02AN?;:E_0P&(
PBE#dA#>(AFBEEaV\a7@)[1a0?_V>M1I@+2M6cH7+=X^W:a[+Y7_e\B;4Q]WS6A@
54Pc#=;CL:B-/@)96Ud)W7#[cGPXe;;(fAWL:XNXffGV[U[T##6+>29aA^24bS?W
GHJ)I&1/9F,]#.SL,W@S_fc4^.[Rd0M:9\Y[N2;Cd5>,8],;D4145Ha/QR5=A9Da
N98M>JC^Y4eF[RBWH5EDB@\JaJ;1.WgU;<SBgMZ^;L;?^U,-JO@]L:ICT<SZ7&FW
K5[g>K5)e9DKRQT/L3N83VP_<1]1,K>Z[d=93f]\/?[bC0ED](^Q.QZ_F>/aBf<?
(\1c]:EL=[SF9C;MW<IV@OXODJ.)>Z^TCWcBWT_1)[aN\2KP;GFLD=KVPSBW->B7
G;S<42C57)?J[8[c?91fFe^62KY@_&35e+L/4NbG+XL^>7g<VQ#JA-f5ed=TP;:C
.1T)27<JXD8292YLR\cLD&gO)C/dC.P\STB#:-2IWYHG)4Wd4O8Md?<M4<V(d&5N
ZCK#/FXCR#QcFX?.>B_J2<6E<WSa=YF=CHaEeE2BgA-&gT<Ob7UF2,V,Z)P2a4UW
@PB-,W5,A6&<^G6PG&Nc_1CB>.LcdM#6Y/5:2.f7/FDX/AVS;Gc,bBYD=/9<7WGH
OG66M]]fDQQ,2OCYKLFWYE(;+)D>6fV[6L8bJVGVPeB9Q6dN]5M>)4K;\7U4b5[J
N5ZZRW=b.34>d1D\f<NN54P-O:GYf9H25+3b1-0?90N4[(Bdg#79=HK\4\^IIB6K
K:]2.dd&/@XIZE9T_@TFRZ5b_U&YYTT8JNCQe&E06+?bFd:(B^:#]IVC7(W>#:aB
E2^IDeZVS#]DHG[\CA)+01JC;7X;C&J3CVeFI0@UWV3ZNWG\L40XE0?<?e\SE;(\
c722U4V@Q>@(./cgF#NO^S/Yb@\OZ.1d.Pe9EH03O[MLYWeC05Sa_gT[EFXB:(2a
gR)cDW=XXSegVY#127be)(aVd[f+M]313Q<Q2ZS3VOVf2=JIfX_.COHBY5O)]&CX
;P@S8R2+[ON/TS:c]SKP=\IZP4)eg\\#V2TF=P7IDU=dJB.9.EW3L^[MfcBD,:V[
=T_???,Z8S:V/\7>H8PfTUQVad7XBfNR)U0/cN=/93[@&(6K7P37B73f]:RQId5P
2>Zf>SKR^;dID_d/aD]EQ4cb;(Mc=Q94JfRgX1.H.?K><P\</6\D>2),9K7;T>J1
Ub^+.g&9RUQP=aC9H2;,9E,NDX/8AcGg]T:f3W=Y3OWS6B6E/#PeVCKOBNIBPKb4
16O0QQ(cGeb#Y@.BY,Z;K@(f;/?30db@S9.WU^f[?@]aPX:>bb@A)@A,F?dLWMa<
[Ub/I8-:?0EV;N73E&Jc]^B9OWD\SVED]HfaHHD^&Q#+)@8S:O;2+]EagU;X?\c&
/7N^K>=V3cCEIOO.F?Lf]cVbL;fTd/P?,>Kc=5YYFBTJ^IIH0d@QI=3ZJb4JPV\5
IUWXc&PS0BCA+6P1aP?.IU-18IV6a@Q7gc+@TP@b89LK4RV(Cg5I6-8>WOPR/CAM
_\770;-SZ/C)b&Oe+Fd^dOWd:DOP.<<T#\(.LLEdP\B93DgPR-.Da/eQW]MWEFb[
79-YSMCKG5dPR0HOB_54QBK:O:EDD5S:S;f2d7:?#[DUa/FU;15Of;^df\dQO3<e
YGC.(=#U=UE9PA02FF4JGF)JM]7>,S24_L-b_-VO:-A5T:,ITRU7J;P.TIPA:&+Y
BKSO:d<Zb_-<&K,g]88D1dBDbJLGKTOd7P\0BTA=Y4LYN/W/T89+(ObUb]C&FY99
W+A-4Y?(R?\[6SGQNd]FRPc?+67g,NO[ZO=A4J_H3DFgff??6?#.[,=7Ec)C5\7,
5PZU(K0(;2VcfNI@_5R.&7dCPf.eYD15aKAUDC<<:<-P]S8dEaZK/W>6Sa3g8J^D
3KFY#0AD,5T=6+aMaL6#2W+3M&Kd#QbM^4_<?^L3Kg/P)PB&X)A\MUUgC.d/g9=b
.^7[9_09,2Q0BB-Pg9_1EH-d0<K3T3EJJ43_[;/J7Sb2;KW9209+[d0D>3[VMW?Y
e)I,]KF25CG)[e4=De>_EbTIBb+d_Ye.ZP3)?:OR9cMFL/FJ#VO[f+;.DN0[GE55
TfJGU:f:(<:#<MHg#:&cW=Z@EH,MQ:b/Y7]fE4,;&G<ZF\>>gF6A.],S,bTB\#M?
@U;Ha1Q/>)7;,DgU2/#:5[/W>+BTK[@GKV[:A4cV,^7?9HC/KZM=+8^):fc==X3<
\Be/#][..NM>=Z(ceAYEXWY3\S04>X&U[ZCD:,?K0^RP=+.1C_E++P7G7\U^a.5U
=>D^0>B(]62(Z616P\fAQBMdRJRB:6+Dg:5W4L1L)]Jb94RG\P^HE?UEZEUc[>CO
RIfcE=Ued&WPIRJ2(X#:=;a_+[2Vfc3:S9;(ISWA^AdLa#L#ZPCAWbNfGf:P]d?.
\=GM]C&IETb+50ZZ[LO-OD]Y>6c)F]8N^d+0gY/2+^,GZ43/8FG&&8HV#]PZ:4T;
5TPZ2OODXO>)>85G],X>K[#=XT.41+YH;<-Y@\QP4G)ZWTIPDd:<IDYIL6UX2F?@
Rc,#<.2)GH:#CYR?.N>]B?S4C4=cdO\9Y&aR)/7=.H(JNbLFT)e=B49:)K(RI:Q-
eSeJY/7Fc88b,gZYfZN,+7XXT>D,Ng)TPGIZ:HZ#&0+?G7XE7:6VJ]W9:T_<\M7:
,CQ3^E-(/O9ZE5(>=H,&0KYO4GK\]?EUTZ/)+VcgXC7^.g;?FF(R7_50B@d#+4X<
&]RQ8W_f<.Ra6[8\GH88&Y#.+ATZeHG=E,4(EaS9<G9:fQee?J(M:@5/LG8)05]+
.,8BR[E8^LK.YHALZ_=)&TW#^8Q)XOKgbZA68R&L^-Vb6/VaC+-Z98P_WX+8MS;^
E/3,\f44Z#5H-&6YRVfg#M[TaCC)63FEFT_N\g6U<;N//V#F?9CC+1Z^\b72KP#S
RQ1c@]#P<LUB/Xf7Hc0=-8:IU.2+?KMD8)MdDb^fg,e,7Z<L;?I-SWgGU?NI[K[P
S<@R5133/C#]U[V>DTc-=@f.>W7P7LT\0L8dICV)TgEO1<=@).gC1d,ND]cH+bd2
BD;.f^N]e32YGe+.2ZSSg-D#+dZAJVO_/UHIgO.7,N)N7N__NQ@;0dfLR#HAe@29
JR(HfZUKY><3>X?&F9g?APR^1OX.I5Q>)]fR&9T/DI_b5+S0]NFBGZ1P[5[,ORTB
)@GRFMXM3[BcNK]SF^22=&FIVe8HO@CP(I850+G\:Rg^PCeGAWX@@]=aA@6G=dB5
W&b_F?4L?J0QE(+aI-&a1fN-6KUL-9I,8)e._7(GKYGV8_-fPU9#)&2;,&928SOB
Ga7Z4KH<83N=#Q+;HIS=aBYYRF)TLY9@O=S37TP>.-ATF:CBe#-+9,5,>(ED#X>c
XHWdNLTeGB2O1NP6P2;<>&3TC1AeT_:;a/DFQJ1b(RJf4-8O_)4Be5CY+^Z>I2A>
5OZEeb;d4a7,c;aAYJ(b,ZTcOLF(gNS1.G5QfdA,I+/=LN@,N9Jf?gg=S?5\e5I/
aB,K8]a;U:=0[c?LaTc)SA<bUbVZ1T?T.5K)85e)3/BDSd]\cE)Y\X0UGMggUV-<
H/@3ObQ+ESLGR\0_KJ<40&N>0&,47R6F:d\[@DcP)18NQ&IXEX24LCc[?5Nd=]B.
_]SFUagPK2bS4EgO(af23@RdE@BPDXZQa@[?2VTbSfAJ)#L>;gGP9#ZUT.b/@5CB
T5MO:a\AQ;77(Df5@eY7cCDKJd@0]WbZR[\a@gTRKb<D.d40HY9-HY/2):]d^4AX
WX@@H<?B5<4@:H9YX9fe#Q)4D3fed0(A^&CI:@G4EWc&?[ff>M]PMbdfQ.\FC)JH
b)VBI2NIR#)&]CGW])Ye/NSTN[(Kb4B(,SL>X(NV;R6egUcaLPZ<_cIZPa^Q.T;b
fB3QJ+-^+>QO;_N]eHE40VG^G#)::QPa>EK/eO#[df8-7adF:Agg^^SgffSd1Y7=
>#Y=<_SM7Eb/]Z7QaB8Fc4\gaC>P1cW@H)T<:#_>E9ZcN19W]dC_G&QJeBbb043<
(YeeeHN^#:c_DK?K12<P_IbJR3@_cgX+]aC_OI+bYU:_R)J>/I5<YC9R]e?L0R-\
)Q6agd3K&eHQI/@M43=KQfS.-\QD7,dZ>N]<:UD\#)6JYF>KMd^HR6WC>8GM#NE.
d1<A<9I;QCA<,/Y])8_62Z7OaZVO#,_X4c-:H/F4_g\7Jc(<?52C8RD])WD:C#PV
[-T5e4F#Ka<?(>S_d)C1,09P._f=fZCHSCdNJD5<g6ZP<d1G<7Z4@a=1MO<@.WYX
?>GABT\7PP<(Q36P-K3RObb1Y?\^6Bd#g-=-:2\QHLWf+B+]AXXR?L-1^\+.13#,
Gf1>gDKd=QcTUfK_IZSdJ6:]FY(\6M;/d\(Db0c\Q[e>>/>2K_-Ag5(\IS@a:dVe
IN+e4J\>;dc:UU-Bc>>@5BNT,9V@e0GJSC0BXfG>4C@[:[/LR@QKc58N9^?0-,gN
,&=b]De6,a+4_9eecX8:@SCE^>]B2T#+H3CZ(V4L=(XYG8G-;:/^N1XdTOa5\KE7
)B3W6d&@\<J,Y+5<Og:VTD9;#PeA9^_T,]U4JfP>[C]D3,Q&CX=#NWRe#+@K0L^:
8M=P1;#DPcDCE-WB?WMP\+>8U+;E(9.\fBXbJYaTJ_YP0ZDZE.9_cS-W[I=I4;3[
B9#DHYX;4agFX-)E=2-fZ-d[gF(#BBQWP].VX0a/L_E+cb,>OWTC5aJD___fHP4#
<FaD9,+^c[BTP=WWIIJ-[V8.MAM3SD/F_].3Xd;9U&P4(H<Z(Va9-O;6Hf(37&:3
)7</_RKHRD[?^]0L[80^.DRFE+/b_@#K1E^)N.S)Y]T)CV;Ef--#=7O[gdEKD&:;
;bZWTc0AAML_(\#1O;?U5bdGZgZNKIQA/LH7ZccUT@99Ae,H98+J=-:H)FcYS^ZK
TP;//;g.6SVP+/:B_LZgI=F4H.ME^^E^6,_<VRe0Z^P[\G^/Y5[_Y&DF)J-a_WNb
f&Ie_#-,RH>e89KcdV=;)I(9F(CB)478c&E>Y#U;5MUOA5ce-C(7fMHJWH>L)-6a
B7L/B3e+?2(H7+#90@IF<g_5Ad81G#Za70D\3E.Y)A9M\\PR]KA:0=>;6^8fMJGa
E[8M.<G<4JIZdbc:&+HQcX,Cfa(B,Q,=L./6GbPaSH0XE316,G.W<2[>YQ(DXX-T
SgG;(S)gA_F.JTA]0D9Ke;3X8)]MT-\/-;6,1AO]G.B+^LWX7(M)?dO+Q#fT;CIF
=;;^3_W172GUCS/TV+7)70WN3GDUea,UaPJc69AXP&_aUJ8G-=K+&GH:WaL\-PZO
ggb+.174?7E)gP9W4ZI9Z53HaJLSII.ZIV=\-S,2L9I@5fX(NgKg9E0,gH5dCYOF
@\@D_38M:W=[L(.TDd=a+WdbJ.57E[=6d6dG0V]cKfXcFC[AI>#Yf-eRZR[/R::3
?Ua5JJfI<&8#TN;c>dD+]3Z_3F:/RTAX\8+Rg3MAe9>6KR_.L1W+Fd4Q^\B2G(9:
Z\YAOHQY\)<99VU(H1RS[Q;?OFKP[&_QU\^BT__\4++CgHTYdCLPda+HG@c9aafX
V8[;EW1AQZ-S,0ecb@9.T@U#eY7O)G-9X2Y2K+AKQ_gag&f2acYc[&N.&3FR67R?
@AAJfX_4J+@5=CeO2XD(cT9G?7X96;X6#MKa7S5[ZPM1=bTH.6(cLRP(++294T7G
?_Z(feX(F;0_A.bXed+MHc8(OO\F<SWGdb)0B#>:g)>6(aec&e#EED;&1(-b2_CR
8D)#<g0d#<-Ng8>Ob3U^<,^AcTZ(?KaX.8>,>2=gQcBYY0Z3gMI.MH4O?PO>1aXb
?c8[:II7-445MY,/6Jf9?Y\164;NJ+8QK/72UgH;H2]L+#DAcHWB8:+6c]GL0XHM
-;&(Nb0NI4O?&F:OM/+9@8;I1HL-=IN/GE_\E4&:<(RZU1S=>[F4@>Ed7&/OB?_0
<O>JM&^[XW+AU@L\X0BDY]VJ:f6eJd(9/W7/]@8Ec2&11=bKX4@1f6J2_TC)fg:R
]#?OLeE?(_(9X+>_PV(6P);CE=^&17KLSTf1,7&ZKF+.4(gPEgg=L:;cg9]2EZQ/
5M=5_4+eW>;]C@/gY^.8H4U3D>Ga0V5Bd/[CSE\Y5(bO\-fHNJL8.2Q&ID3#ZT[5
M/]g(>01c#)F^9-#S0TMHB]BI/VfVQB..T23]^fLK+.U?0\P3^g:S7(dSPR#c;VW
c1UdJ/Q-RU6g+2E+=5(,PK^Z<a585X?dFGEA=,2+4U^RgL,8.eXdHCL?9RA)^45C
;9W72J<6=58:aEZ;#DXMYB?Ug]_?bfCQ-&dIX<R.BWOW#M[Mc@aUB6^@a#3#8Q2O
/<O]fTcP]LbT@-&M6bS4S+@]cW37Z-?H,bJ<E:)5aU(50G/eC&#2405^->YA,:S4
g95&Y9MeQE5O;&O/,Oe3G++S#d8DS]d<_AAKD.B\a1F#9VR1B]J^9#=T?/N2CV<<
X3dRgG?;)S0UGT=Fd6);OBLG2PXNAfBI@.<L=6PQ\UN3/VE:[.<_8&b1V3;\T8<K
baM>JdV-5E2A(;XSG-]UKdYWc<Y1^>(2(&J49g26GdQ+7VWUG&JNKKC0RH0dM=Z8
/^UbJCd22A#?f@NX6^&T0Rd0(=3AC67S^#0[0B;\K)X)_)]&eN-3U6UN@-L]g[c/
H5C..^GbdcRF.a7^dcH.f9.9/a(-8@66XU\/QIfSZNWT,U0_QcfBJRXWL7UK;.=N
.Z;27e<ZV7[gXQ^ZI@K9CWZG)&a8Nd4?d]ME_&MV/<f#1D4=a?K-\>^^#[_T_E-K
-15875OI[FA,ea6>635K7f^T1c)A[UF+B\K2Of8->;;1.9K3K(5C[aEg1.UDP0&Y
Vd7MG?8ecS#H<Z=]^J\VHFbJK(f<+8-+J1)GMMa0g@OFL-VCEUC@V+O]dMQ1JVc@
<XZI>U,8B@Jc6JP8Q^Mbd(3ST:T-\:[f7YcXF^(gO_O<,0WL6#]dYe:)bR?0C\8R
L9H1[70R9K&5dO;9=-T[bFCML^GZ-@C@)72>-5VHEEg\<HD[7X?5@ANWPXY,J4<9
Q(,L?KW(D<bTN?PG@,5&8=(]KFW)J/H1^YX7LLGdNP/Lc7;O>91N15eIT.1c:W.>
bfA3BT&AA=J5?NA&Y:8dd;e)=W9\05U6+:RaMb2,\cD]dDaOGKUfaWNX[1]Q5-Ga
?QJ/H?5.?FM7,&DCcgg(<_(b=#WH8E7)O@e52K4^2//_XM2K#^L7G]<2)LMM;8b#
[]d5?_W,L<dPcDS;-^>TV-b]?X7TK#)BZaP[0DR.f.?#e#Bc[S@bB9>0]YBD5P#,
@8+QJdCVaa&WJdP1Z?KD#_+@#RHe:YS#)dY=3LCXa7B)^bR:Mdca.0,37YGA_g/N
\H0&KZ[OW?=:_.Z?][[QNUEW/2RZSH_\PLWc)eL/7R8M6&&Rf?Y;@fK<13X:-[f6
4],,>X@RIc#EQEZLL\Y[^[D7fZb4\F=OEe?UBK5+dIT8fN1f5L08<5VGOA(.SKB1
1MEaf<U#P5@P8MF\\[X/Q1&9:7e_+O?-J2VKG4T<+(3EKXFBS_,XQ:0EMZAHc-R=
>8,ZXPVVZSJ3))3CHBecgV&c3VM_QR^0?2Se05E[,D:;85WFFIVA#7a]F0.;6T-X
X[bXNee5\c;5gKg3;=(cUIM=)IZ(AfH\PSO,7H03W5P2;.b#dX\HB;Z+(69=53-6
K_S3MKC2PA;03gcFIB:X8T<Uc-C)7.4:;^Ma-G5S?8?8&I3SX+#-GN&,/5,dIG<8
L7E++(_?\Y<A8H]/@O&LV7aEX+.1F&Z@J?-I/=bVR3/A)+=9K#I2g5PgU6N?De@W
:01:?77e8:CHTZ(2062B_[,R)R#;N9ZID9CAF?QB)X&Z#U)ZI4MW#5VYaW,0?&GF
QLQLa4dR@ZVSC[Z7+&f[1]a#58=aCGPN39_>gXR<>DT;F5DP^E+C)6.?GcS^XF?)
U(^baH5LDI2)535S0VP4XEWPMQYL6d.:b.1GA74VGFO@G5HYG6#3;OQ6K,795Z]0
W=ZKGXF3BE0d/YW9g#LU#/K>Gg5>Yd_8aLQKeKUHAQ)[G+f[DBGWaV.UOffQ?-WG
,M,PLP3]F.QLOQ5_,10XA46@=T2C\K9O_E[F?Nf&49J,OEQR>Ya;/Ud,B[gbS?de
f/U]H.bY;1U#I^O=Ib/J+8;SAC8(D7ZcfBeI/1dL2E51bP:1C&DIb@&5af@e3Y(U
EK2I7f[+,(]+,g_0^RCb\#8[;gD@;aW(D?(I0WQcLeD9CX]:_QTJH+Kg+R0?Ca[Z
&-N;C-]64WT^[A2QMY?[ZOfVO&O/7O[>d]bT6]:BS0V?0S,G4?^b&;/@@W23NA,8
.?^EWHQQ\TUCJb@XD6fZ0+QZ49bSKfT3.+X/@9I4YIU2B8R^9^RU\VfNC>a:/92C
WNT\JG9D-,/WL0Y/S?,(,:@9Yg<16]IAUbB)@N;^QROW/P[8+=7WK#UdOZ#]L1Za
0bN-gS(&3^]UQ&W@@aTL>/MY2fWC<\XKf8DUc>AWQ7GFORWegH\2J7\S3O/OP(FV
,eA^dVTgg/I+<F]?SNI6a0^0fWe]D<aN51ZX\Y36_)WSTUbWJg+#Q\6?DBa(N<:P
>N-\VA-LX29Fff<ADQL&GdQW);W0b30XA2fCX44f4<gJ7QTOIf>)cE?C[DKbg^:0
3c86f8J1@3SO6H>FKe>&0M/ZJ]]dJF2&bODea5B0(aHEPWW&YCPb0,&Z(UB3-.Na
T0E#B<Je\T#HeG:U_CQ?PBQA>4PEJ:MMAL@/\_?BD@dO-VYC>[_KGRSZYfNa7\)5
Cd,N5-P2g0g^.WL:3UC?,C\0.L7_]+UMG<9,XG82Q;/?cE6\CEIN.<9Y8>QF?@^1
-/79Ke&b1e?;:^EKI;(P)1:d8DJdZY=<BfbD(9K1R#C5O4WG7.NX,IL5-f\D;E_(
:DDTK3N/9,e+:3aY8O<VHVD_G(;T>W+R4?SOaNJ&V0D0W/+dK<29?Q3]]Vc1@_4f
B6Q.OQ-9XA08^g^;b8UJ@^+Ia2S&SK>aLU.35Ed<MK9Z#M:<I/6MZe/(]gI)BVZ\
4WV_@a0f1[FM)EC:YU/,5=Rg[Q350b:2><#:6[0LOQAU8ARKD_X(H:?YK&:/8(9?
eQC^PO/QEaT8#G0N&UD]\F&+ea(TBXSQa91X)A0EaC?Q++8.XEV\]W5R/gZS#UX<
\GD4)d3#-5N>)KGC1c)_ffQSQIDUN9^:#,^>@TH_fDW:<ATVT=6Y8Y5K(O\]/5VN
d6CEdb]1?3R=1cWf,W/O8]0\HQ5DEOF#FN8(,ST@0ZTEPeKRFIV_XbC<4=?&603V
MV)BTe>+,PS,a>SI8VPS,PgBMbXU;YLdf]EMJaSX^QXSG1dC<-K7PRM.KB\dNI?c
(V_+7//&VHbcVg>P>I]FfDQ2A65R;FdU,<<Ud#PD586BRU9eBeEWSb-@B(H8>a+9
5TS3GZRU4D?ILBF5/JW)Hc?(6,50bF=_VgE1QQaK,,J9-G1WcFG@F:L/]:f35eLF
]g0HLOfNAT-Q\R9TS1/d]-<,>@_=N?3YF)gF530QC4<J2ONaQFQBZ@#;3@A7<3DF
Z6fM-<M(Ec],=2dTO8b,N4b?G3EZHGUd0[M(6-MaeKH-+AU/\_gI4b,Qd[?EYRR[
ZD-gE)V]RH3\0K]gX;UGWT1+b=79:W\+V-\gBE,fd05MTGY]55&/GSV#AH,G,3<b
7ca\F)LV@e+&U+Bg(R]6=2A.#):Yb:=P/[J^^:)_Y&JM:J&;M1MDg(E&.HT5O2e;
O@#+4?.,ZZ\5EXdb3.XHJN?K7C<^aT5Q8.U97B\]]4==7--#M\[E[Z3cF5GII835
-Mga(/?U)MJ0T1.FB+[SU98GTJCS#VK?@D,7CaTefaeQPEEE(/=,.M3#AUP50L8B
<&WVQPZ0961F4DQ4)YF:aRaSR8YW<K&a^,EHTOGQRP9_+c9H3^X1X,2gREd6B@B6
MfM=JVd2M6[TC,M_^P:cKK;>OO#Y_e2/M@Y2\9ag/3H+_30:Ue<,JVD>UaK@>@16
:LLGXN:^:gA.TDBL.]9ST29ARU]NbPF?gfX\^2)P-\MSP@0R)83@THFZCBF;#164
CIOO0bZ?L1ML-\P+f^<XYDb[/YB#RN9ZDZQ=X+=g7=DPE=NQ(;DD_[/#;P::G+#]
B\,HW,0GVM@Y-A^][66K,=<0bTeMS_27R9A/XRB\5P?[A,cA+7[.L3&Q#&613C8Z
-KCO]0/ea0^]<,++cQ:8K2+V<4=+3==NQEXM//:&KC/JgIZLZF2R(X+_#4+LUX7;
?CT0SZA><I\:6440+f3V=^EY=?EBLBN,172fNNG=_Ba#([Gd[^@dNZX4?c#Z#cgX
H]M3:]0O+Td(51=c,e?.56/:[IEXg2_gg_JE05@YR?N+S\Nf[db[#[(PQWHKc7b@
RFB[?O0,H5c3,_=_&^.EG:bU(AGa6W[aX,[[([I+1LeBMUC>I>d8Va8PSgfB=aRO
GcIQUNa1T2<4D2R8c?7@D0;g(75HP&G>N4++WOS/BP2U^bXf)#bFFCeMM3&1>0;C
;4.b-;RP9#>H[FdRS@]Z:/DUS3DfF1-Z)a:U\\<aNJFC1+^IPeb9)54^80CTBH>D
B5Z\[YX=,_U1=,ZUJGe@Y/P8_LYDA<IGBG^@BC>8-62feUR31-^B8.)eG-39AQfY
a1<c)]Z5&,c,F==O\1PUHg?B3MA:ZF-5eSLP5.,D\SNaUS3H2\2L@]aQWKa]UX4Q
OcdO[Yc<.\E2K4OUHPV-=OSBEP8BEO,IgeFZ5,YJ(=3a.MZ<<<9fa6L3^;3@,ECB
1<#C2Redb<(_BLZ2].fB_A8I735eM-3,4dgeQVc.dF\4M(HMOe>Y:/YF3bSfI:PQ
QV8K;^=M6ROM]DQCV:EEF6/_3:LM1e9>PQQgWI6-XB>\&.dV]RE+NHT&fcH4GZJ8
@(+KH-(Sc@QdDS\W,f[MNaC.:fUdfPFP?/M4OOGUc->/CQ#T.G<QWFdO_T&O#JMO
5PFPTb=eRRTV47.<.1aZP7Dbc6J2K7)C2eRRO3[X.6ed_Y@0e7EPf=5364;;<QY0
73Ng9OSd]egU=6/04-4?EGJ[<GLYN?0X[;C\=&C,-&\4QCe#;<I-=J8@V3:@WXU@
@g^-(00E#LYIGAET#IN/Y]ZeK-L]eC?TP)eI+1IND_FO##_B_)DLOg;7&CV_]C5:
PdPGD-O+#:b0UIYb\2HSC\;G^d^_G[J-?bOCQ5-V/3,:SL2C6ECaP&,,&SOC:L)[
c_@,0V:1/a\;:=0_@UPFLD+/E)RgVbg;EfB7WH,5[:FeE<>b#(?8_L.=TIf&CFXI
X<+<d]WaL&1VC,H/86a;H<^<@#?W4Yd[:fc7[c^SUK8A:ZE?cV#Y4(a9DO=X0QK?
N3E::14@:aaXc.7(KG1L<B_EJ=S.A&X6)I4#W]cN<YDEg.58489>aW)0a8>KaKBN
&/#JIRWe()KFM_[OEG+e.:/:0b_L<U::3<V&aB8-DJT:3AN-)S&Be?1>Z(Nf:W+S
B?:1SR5Z&?@^J2d8@67L_IS8L1bK\R22.\_CR#:7;(6.\7V0SeR[RgR972I@R7YB
S-8^.O<;(MR;>,E6]/+BQA-,<TM;eP/28O5&HLXVBFM5-+Wf,a[0==LM_GC;:S?H
XP]_;];##dg2BfM2<JNRQ0W0ONC+D^eZ,,:S\88[?\3+CQQfWgLb@)-R[Ha,fVER
6?M((DH0P[BI8+-LR0fO)[c:(c;+=W#7cYF,/MS&LC##e4CZG^1gOO#[e2e8K5^N
7I_77EU4+__Q265M34K4U492Z5a\>F33W]P>QA_Ob@G?M/;_5(d.)PPS5+,MVM=)
<68(4-bg=V(Kg#cD_(B,FEVNO<9XaX5@NIQNgF<><Y+TT4U&4UZNLAdVE3_Y1CTV
>Yc1(b(KL\)<d04R#+8Pb8XXAcYc)7KUgQc@A.dNTL&9.@[HLGM@D8IA?DMQ0OWG
;YfRS-SfNb@&eY+CXL]LNMQ?<Da>XOMfFSNY;2QcVH:-=<a#\)8VCCST^-+c(B_T
D+YCB?9EJ4Y]UOO8GM\=e3ObAeZ--QY_a&_5ae)d[><)+H9T;LSQ2#I3N[;/^YVZ
OX\(+bG_E_Ec=HJV:F@e<7:-/+VX?.Ke?4_)YYb_fYVb0)\]#YOB,?C8P1QRe?Kf
V^<G8J/V;9Ya;Md^Q=7OS=1V9T;/dU#0/IM4D+gPKf+MDL-LPc[T,V?M>cB326F,
(8OHbA8ca=gJZZeE+=T<OB]7,AeTaZeL:Oe02H:,W?-Wg-O:IW&Q(4>Nf1D1VdIM
B_MZR#N++WL[VR2(QO:)J#@MI?R.0#@P1MYK>bA?X)=g[RH3.F.Y7Uc6-6T:7EYf
HZY4SfYEHE>LfD2F_O@W<H<PX/D;FZY?IIFLegHCB,N.-EEW;+g65,C@]0VRL++0
X:J7IY:\3.EQI\F53=WEFfM?]:^/bJC)/6g4\?Hg\/5=LbZY\D:UGaa..9@2.L)c
,gX,.JGLVR.d^G7D>&I5@^:+9@H/5F;6O5^BICbSGg?VJML&:V#:5Dgb[N,:/?>4
A+P]P)U&1(F@/^0J-8(E9J8BG4#4YON#@OFE3NQIM&2G@A@AS)=GbM/SZWO7/HLS
=E]Yc3&O(G/F9^2]79e=b4/E7&0;0E_FfXT&SXb),TSS+5Wd_a[&BS/]Z:dcFZaX
bR_/(CXgV+bA#EQ)(K-c<.S3IN9].1g6dSNT+0U\d\-T^AAL90Ne+04MUf#S7E3(
<:d=G,81+YZ[T]]c/V[fEF<.HC.83K5f2bAd0/9/J-XXPX2N:D8@UL0.IT:[7Ff0
G^,0?S+PYf.7Q3/F_9M7KK5IMXc\PS[LEb<QDV^;8O>JX_DEg>A3c2N8e)7ObfB>
0LB@Z<+f3B9g]?//,B&&?>X-U[QYC&KMg#Q@.\c?U>ZagF)C2#2097d&=[WBcL#5
PaBRIGGK2ZL:3X.&:5R(:#B\SC]RNM2L-?<ZHJ^Gc]gUD<K,H74)d]dSIfPgfcP<
gBeHC&]XSOf&bCG]IbPBV42KU,4WZR/@:R395RC6f(FcKIFOG#\7D&1\I\8.e\4)
5B>I#5?;\f_E.O;\IS]EYe0PVHdE794S\IfaN[G,PgBUNO9L+/HaCEK&I)7Z21N-
B1E,B&a;8G04(U].]2/)/6.3D5CJ(@Q17\A8)6/:gO-Y#ZO2JD+M+gXLY@F_;FYQ
EBZ9EI,#]82D#L0@65W/EOe<0K4U:/fUfUVb^50.b<ZH)O:.6C(10JH?-Mde,::J
,F#_Jc8QbWC:L[^_-F1.W#6+@7L\^G\c64M[X^G@Y\-+5::8F->CINT^Gb,POZVV
;)D2MJ.@C8YV4PRNA_5R#I&Y;g&;_L812bZKNgbBQ=6ag3HIR=Q5edT@TOHA380=
Y]F<Ua.<3(F..5TAP9dd4O-g3=5ca[I;10fO3f+JY,g[GR8eS\7,W#R^ZENBEI/?
^7gXH#1F#A[SHT6=K0.J>(5fRW_-^@+K_APQ_^8TJ6d>OgF&HAaI._cGccc8O@<?
[4fTN-<9^&]F\R.[+@bR=f^<5(Tg-;>ELQg1DS:8T,gH:;>VZ0=(IP0@JN^Z0/Og
.^2aeO+4eabNOcS,FC&VdQ^B>CS^P736/#>IGFgTB6F&^Kc_(LG/+-U?gTYeO(L>
Qe]A+1ORZ4@WCUHG^;:W?NALRMP(;=]EbPY(3gOMFQX>dEE(-&M?/cOPV@.?+JcC
WQ<&RYS<-=f-OZ6@7<@(BF1AI5-L]]Z7d>>IKTQ)XF(0^>:SC(;40V7W:;/GHg(Y
N^AC(aYV38]b.<MFI6=&M[4PYXC]G&-J&6,2/[6AY6;X.bXec.He2c>SB-S4&=7B
@:E7cW;Q7Z5S,\PWGDaMRHI7FSE\XNBg,^HA8a9cb1H[E@A,_>[VId&?/RML=?WF
DS0C];#Z3V?c.]>ed]:QK<OYVeF1AR=RbV2aZOS.Edd)#]G<-+F3MV&(=.EW^DI;
8-[<EQ.aX1>V85QA+#a[:C)B+CBc\RdU0<fW((R,FOKbYPd,@ObLNE7T(N1,[<fX
IEH8R<PEJQ^^4Z4PP&+8,d8[X)M)L>]H3&-,@6Ga]G=_EaVb<.e][_]:bcEVULMM
EWMf(CC/\Hc8AVWTRK&<PNN+E6?]U.03?=E;17)Y2T^<4YOSCe)JF@d6K4KeM/Pc
&7\.+3X?4bPXLM@)TfI?I]I8L&32QgY\@IKXL[A=)F\c&Had]<3=X1P8NXIHO(6d
f>F;X7:E3d.V=&L=<RLX(R<>U]aDJ,Q&(&9TV,O;f_FH1C,cDS2cHQQVYdd26\Pc
S,\-]1@<_W\XFG]V#HE/-g=Qg7=bH=KHU<<c1OH;f<OK79Q]2N:_>6=<@O+/\?<G
W4(7+HXS7Ag@7YIX<74C?^aIS5:9cES.P9E8Mc#fDLJ6_CfHG,[NCC5(W2fdJ;+I
X0]eK;<QJ\45d#]XW5La\HG/YHGb2@WF@c+^6?^5G8&D.]\X<UX.dVafINCYGE[(
K1YW.6G#]S2.44.Ug?H,9LG(\Jd7+N0f]XU+/XfE>QQR\Q6UB8^dX/PCPHM&7>Tb
66>T=5&[^#D@@0dTZgObKUAUXW-:bd3eQ\-gF5CH(E6.2@AG_dN^4XL-+QcQ5T;T
(G?@E-+=HGO--#X:FEBW^dFA+G(4&cN?@)K^]cUEH2.gU2?A8MR?af+4^+DH,LO&
-#M1ATHdM4.7g@TcZ3Oe8?\RIG:H+501c.0.CeXCd.6e(50XV:I;2C&S5g]9JDQD
&OGOBfJBPH#S5S=JU9B=)R@fRJN)>X/O+FGZ3KL\,dT7A>cMYYL<Y]a/J8EB25Yf
:RW^:H.g?E>1/Q3S)+Q(<&.54\4M>C?1E5U0?fBJN81>0+T@5D11SS/_0,1E)McR
_[NLZ6feE).]O0H-SFT82-3<8_3]NYX,f8gWV>.&,Lc3QI3J:3c0Q8TDI_EL6C:-
.6-<Pe:B,c18fVJXFFNEE@Pa,,K-7GP?]ME<BMJ[9T(C.P&KcZ+f0OPG92X_#Ce>
CKa+,,L,D56K,I<a.X=8F^FL7#T:fLN:6Z4HYE8#,I<FTG&[[(D,dRdNF52[&2]0
06\d67eA7&<(_IB@ScfE&)f><>e>X:(XeG7JS,=-8A-(7)?]N(_)<d^F@Ja@3G[>
NRZ0/e7OKU_,1eD_V72,#=-^BfIJg/]=(.&V<\\@]YE@<-gHPgI#HN87UD2PUg8M
[1M0M>d\7?Z8N(R280g4gKe?eK,e&I>3N)>JO)81OF+AM6aV/VX(4,@[&2c6P]#M
,)g[DbZ<V(EMSCCEPSTC,J9E2_(OE-b;A]09Gg_@C<JI>dY7PLAC+f(EEF7G?(WY
&(_.^X^@S?d+RG5^<I/[J[75fN-G@Fcf7J5O\?NQMYB/a:gEfQT?[FM^Q^3COP24
_6F1)#Xd[&[:8C)AYZb^3310)d9C6?,OA06/U@MH7T#eJLZJJI-a\=&MR919=SFC
N[X;\^1C?L,IB((]JMMM\^#d.1\;?+e&=CGa=BFA1N2#Hb7Z2_=/Y_PVc=A@==dW
8.LNNOPgDU=+&=ZV@R_:EJTHWIE_+Cd&gO^?SS,#g+Sa4_/f;=B4KF]:G>WcJ,M\
D4a/2F)@-\3(aeV>E3cBcgD3M(1WWcMR8:SR1ANG6_\cQ-eEN8Q/;U^W?Y0I1/fA
T#SE&=ZDfP5W,1/#fN\7R[S<E1-f^gQ5O>CI[Z;TH=)&JWGGG-bO]VE.ae2.c>]e
3G0YE\()ZT+?V&IY3f:W<?-K.+F:4V9@SA>H1Y_DDS82,UT=+Sf2Z.P>D#b5[U:M
5,309_@aO8BVP8TXd&0ce)G:Q98=CQ1_,MY.)44T=2eI>IAIHae7-a8^TU&\dCgM
ZGZI-PV/?KO.bM;\g]XS=\/cJTO(#R]5ENNF-6FGe[E;=4=XaeGZdB57Re\7S[g_
;^XGWaUfRR3f8>_QH6S@LQX-_?fA5A6c^eOQ45S]V)WNQ>(LC8V#(5aMI,E9=YR<
U=;K59M/O[\#;;)WgV;\LZa@E^Z:HHWYbRLBL^AT@^L5VP4R+=Ga\1fD-d_c^(;5
OQ-5DW7XPAHBJXc,)3>\;3A7+QNfY)]-;&.f[(\-AP05(7.BW2;_9UB-D^4PHQ7f
/QV^]KFCFa?\8[DB]LZ@.I,CO8XIZ:575<9M=:&E[14YEZ[WCJQTL6;EPKMM-b\A
ebgH=@3^RLX=U4bH7V=V3[gAW8N8,N@K<)_B4<abPa<NY<)3]CD>H0JRbFW^c2_b
dO5e\FM>R[1/G#@>LHYf,#JEOggUWHY35[@3QQCK=8C4>B7S9MU[-+&14a:AeO]:
C-Q//68^0e@EG[HJ/Y;A[1HKL2W1=W:(?@)ZMb_,5=;Jb(JO[L]NO[,T[B?_6dTH
5)<2?)5,\\CEQ-_C):b2<NZ1^K-<FBK-7)QTc=5Z@JFd(cU)EYdSbJ77^Z5VO?_]
8EdQT;N/J2T0E<#@//<2(#A8A/=]4GQf)7DA0PUcUKA5::63B3d5#I3a8<_H:ZV(
P6I[FP-P5e-_=_+4M^NH[+6TO,?Wg7JFQ7=EX,G/]Q+EEZK45B;g9eZGd?U6TgI9
3^74TJ0F,4[K^1#4dVRQ>=\J;FF]9+[27QO<7EUPK[,>_+\@./LD\259PI@2EJD3
LdUf8SAQXaD?E/_J42HI0QMR29E/<fZ@GPe=AUDa.Q^0YVUZ?Z789e&fJ21&S5)M
FNA0Z54O\Eb]R+_=[GM/+RTK+MZegVYQ5SBCDgP?RROTY(>K\;+D3N8a@>)A>>XH
]J(_E69&e@2AP]6W4#/E8ME-]^?1bZYX60IOg#[BEe#>HNE1Q,6Z0aN1?,AHf&fE
>e7cAP+2]g?aQbDdJP+cJ.cbBQ6HVb3X8AC)+4?<_eZ.)--:)9&,RT,5<O9ba;7N
d@(aIXaG_,b200eC(>0fgfH0_+c58&dY#=e^[<WbOdM_(G.fIW94UMB3gaFUX+U3
Me0X&g8R42?X[@+eO(b5>1B:f#C=(44KGXR6F/O>#J7E@0=]?)90T6]6HM<.H8,G
8PPZ+?<>DS-M3FL3NdK;6R6<fTd&]5Ma]ggWYPNAD_&dTZaB;V&>:Z<BJdQ]M@P8
Z/#5LLB_C&8BT/A/)4Df\FA4#YFg6BBK3RVgbCO?c+T+,D;&[VIS=:??PdSP^e[=
WH)GII@LJdeMZ-UE7.c;Y6+K8OeeF9KcC4YK7Y6<J#IE6cf9NJ#+M-^^c24B,0YI
ST7d_=B/FT^Mg<:5[M.G,4^eRgO=&B2cSZU:R-e##b1+,e^g3+D.OFP;OG>A\.1J
[A9F#e?A&(+2QY?D8D1Wa18#9JKCK;1-EJQDE@4U._WN_KVCNC0ZMJ2W@LfE@X1)
5D0g9QYP?ROB<@C..;/L^BT=RQB4cCI06H)VG\BTWVV2CS>dO/G,D7X=>CNEB9/?
;WO@>eDObI<&?O^2MX==7LT]K[3SKNENKO#P6YB9U-=?aO4CHIS>]5.g8cg&5CMd
Og)PL3GRfQ0XX(<2/2H[K3PU#:L#A-+U.&dPf?TJZE@IN(7Cd_B;\>aJ;#P/--(2
G>O]<VKDf+:KN13#ZVWGN39-(4Y6H&7P4YAJ4/0&RDFf081T,97VHd@JC<adH&CW
@\[ZH/FAT3dFJW<VB-MO?D-XKHAba:1OL(aDFUCeHD=&1c;C/X?EBJg\2<S,]VB?
@8Od\7&ES;U(TG)ab7HN-:(TE,dJ(_PEb3+LWVS/I<YA.(]_-FG:fW.=0W[=2;WO
c:3SJbRH)0Sd>WQ@TI2>P56F]=>D-]7Mb</O,bEH7fZ^VJY^/5eAL^SDOVEP\930
BTY@,f(ICd?S#8->cVTf_8ZOCP=P1AV7C_F95,(9UOe&)8g#fG^TN_9V1GLNZ&]5
WG2UOIJa7O+&I3<^eeJLP)(73;f0FPM:2TO4_A7aRb?T8eDF..7-OA__9/1d.M)U
-GT^([UV()2Z5.g;(7ZAUcDbP?-b\[K5QcVf(DWJa]NS7Xa7;eZV7Ue.()X7V<98
G0YA-Z[FR-O\&0:6-EX<5._7f4WBIg:W-M(29g4>MOUegfW3-,+bQNR2TF8^(U^@
Y+4eWSNHD^FT1K_.-OT6B8c]R]PG#EJYWS>Za31UIF8>&)X<Oc>>J9</O(f)+4:]
YW=?N9=c-DK6S/Ke?XG;U12/Kf/KFCOQ_V=<7&B[adg;DN5cV38S_QC-bG3((DZf
Y&^I;=Af&LL^=(<J+8Ud,&E@aR,SPGQPHX;R2;c2_3H>Q6]?<(SQ9b2HcUEM0/M8
/:WS/@(+UCKMb-]?Xg8e8eD@\XMCR=S3XcNe82RAaaP8T_T1[OdScWcWCE\QI3.B
+deR_(f8fXI?Pg/MV1c66;MBc/]9fH@)T-GI/M,^;VRYYa(1+7aV1[8V3GFHL+K)
a1aM9:HJA9>X\F/Fbe5LOI2ND7B\a;,gQLOU#0T8LBVR80UFCOBP3+07)C/M/fIF
<]CE[-:_79FL43N:J^gDV-3<HGJVE5:Y_./5aE.EaI#>>dV:+CFL,+:[=5DGUQT3
D-/[DRSSS-(,7:1?;ecGAJd1<[a-DGM++CB;0Ya1<P]c57IM,B-62C^[60X)QFM8
4:.]5/M5SeX7QQL0b0>4aXEV<4Uc1V0#TQQDB7PcX6Q9.N\&EERH6+RZfYJUYC+5
-gXIP,\SRPJe;LbEDI9^\#/FDUGd]eEaOHBRNY>CC?;#FS=SA/A6e1);cLL#PD@]
aYG(4XQL0]CQG\44R1BdGCE#JCO97D,)e(ZX1J+N@)B3,DG37_0<A<7<SMdYO34M
aC?.(PPBH4NcFI-TED>3.S8Qa=aY)SBdR7:3)fQM;1+ILd:;/T2KK^&Z9880976<
85b;g6X]H(LdGN-8/f^;ZcWagL#Q(\A3aSE1Qg[(V[Y9<e=L:6XO2BK[f.eZYB-4
;4eP5=+a/>UdDJP)P3F0^5T/J+5X5d06IF8-7e&3-E.,MVX#OOSZ3_\3?.6;Tf@]
0O&.dgU/ONX7K/HB<Y.=AIMHX#C?ES(Ma8gL)a=Y\E:;>YP(6;(N@@N3JBAPB[8#
IFD?P?0ZBA3D@W4Q5Df>S9Y/eT/c_KTfbG@(]GaM6(84Y6<^5BOC37SUBUK;JIg(
:(^eZ;XES]Ve3JTC3c;[-9YFbg-UX;O>8GGZ>GSKS,RV6]X8a+fP?/8;7L[1=dDT
3>WaVD&&_@@O#f==HR&,CWZI112(D+e>M@)D6<]Q4BO<gH[RT.O^CV2[H(;c^ER7
=</DRN)&W[2+Z1E)QQX9V8?&I1NP4-Y?-U>gdX;/ece<69;VI-&Hd5FKf.e57=0G
66?dQHGZ=F,@@SfZP3VJN8?P?JH?\aL<5KH:&,;BYc;,]OY?9)B#JF>]WG@CUI\:
73dDW8ES]==1C;PCgd]5\EKC26,eTbR9fgW__-)9IPCTR_:baeZ)Y7;dG)FY[@2.
bGAD82_AK(:#@_ZI1cZE:41\7U.QeW4FdZ5Xc@V[?.DV^b>U5R:G\]G?^XH^K),5
D/>[>b0K3b,);cJ0M\1e<D/RREM[.&,c:eJ,)EZWT6,_?_bKHYW^+V,WLBT]M\\3
,F=ZAfGCg:C@WJ\gI38CC5Zd(<BBKG.2YKSESQY,\)FKVW12)(B3Y6J+JVdUeW9Y
O1&_EZUa.W:MS9J]QA0.(#<YYT:()]9S.-:<Xee,REJK\eTK=E-Oa7a<ZJ+ERY_S
[95Nc;JKD5/7YODa00+8d8aJ@YNd(2>cN:.f;@Yd3d\debgHgW..@DcCb8E_IdZZ
bBR33YgBHR)f&#.&EZ+)/IWM=bSeWaYaW5c-Y(H\7<NTT</3HGeZQ?S=7/:S);>A
IFcG@(U@7[YP6Na\)gW@48+EY3L=WDC),1Q.gBB+&&KP4,/>ecF9G:cYTNW0@fP-
1MR]]O(=N+N3F[bbDUgT2LR?3[RfX9e1M2ZBCB+(@4A13\2;<I5W\c\[-AZ^NOT2
cfaH@I\40+Xa22HV_?36OY/#12:_46B+F.@]W(JLfC\RYU_Va@BG/T97GKf/fWdR
/Y7J[H/SZ,82CTT<[SG>1[;TgF<:W6HLL6.]1O9TfC]4+D:BJVdXa0LcN(&5Z?MK
8K3OVW)#bdO+ZS70.Vf&Vc3#+AEO:NR.+bZ9KO<)A&:_8dVCf[cU>P@]bfEQTQ3L
AbVgAA0IeQ9\]6.(+^gK?WQ.^J:[85DY>L)F66D?S.faOVY@LO+<4BZ:,g/9?U:^
1?(BCAFOMWS;-:5>?E[?]RP].Pe2<)^-E)8f)LWU5OV<cTQN-PZ#>8]9476M,?KJ
BT5SP4Y@</RaR6?fRK=\Z_a-.0O58YQ#8+M[VX5>G4Ab4,GHaSOT\9]KVgb@US5?
WMZ5KHV:^QLITPcXD,-1Q&YHW/Ke<HO0+6H3aHSa7FWNe:N>FXP.N-=185\5^daE
72(TMGS\(>.M11U#Bc^,2-Y97dT-X/#Jf&:)]^B5YHcdH7UNgA;3a9ZD60.O[3)1
N?-=8->U7WbQ[\;QKN9-95R=bV-^\SS+V6FcZbb^bV3gZ&[&@U5cH40JC2]Q>ae]
-A72;?f\QOE[bPUcYd;M;:CA<B/T]daQ20SW&Lb^a_+NR9La;_PXbCEVZZ_;;BNZ
JS#\Q36DCP=&=W/+8NR7Y9UQH3bZ\?Q1]5.8M1[EN>^[NY:=FHWM-SS95J1R5O0/
BQT^N^6_+M(D-T(QW1[]=MTQ=^eX>WQN9cb[LBOYA3/XFS#+CMf2>FTR;;3KJEN^
aX2RBM9@-H2SRH(GJ,5#;J4JQ].)VNeD[gWC,FKM2fT2-Fg6BOW2CG)T:T1_INJd
IL44_NaW&4O2#cKfP/@7UL9&0GC\D(eZDO3&A?+[.GUWX0_]aUcBUBH[7+bD?DGP
Zg,ee/T@H.>a5.()bSOgB:N+YH(\2HM1G1e<Pb.TT0I:b/<32YS]T:#=#gVR090A
fX[OgJg8DZD=Q52#D4;[+;E1_]+:O3d^c6+0ee_Wd[]^\]H3;]]M_+8ZNZXX^SRQ
N,-_GP;c:@-Y9B<^0+6c[[f5.V4Kd6<4L]1PIT1=GFCPNQ_.D_a1RI(/f)/Fg+8?
SA[_/MIQHT,9TX=cX4b><V9d0J5,L5K@R3gJaAf6+&#CK5;C740GTCTS89a+1Q8f
89=QS,73P5CE0N=[I#^7,0)8ERD1\P0b2K/Gc^H=FP(6OEWF9_35d424gd2PWP5/
[XXP^MG(,bKT4\0R.0W@?H\WLKA:gH?@dXP94^&^7<1^f-TF6HO#T94<F@P/<U-g
#<RIf:JMMYOIHd:f6I8b>NdP^PXIXYEX-_<I8Lb07VQ>S(Z=gd=<O)]3b.OWV[]C
0FX0U\[88J+MUe.)4>fTcbEGO;a(IMe26AW/];:d&Y<#1FX[28#g5Tc-ONQb3W(8
<VB>O=XIHIAQ1]AY2\Q^Z^/9NSBeB[,D@E=Qd,[.BaYSSICLNac<]C_gRec7IFN<
B+Rg-bD8Gc<2ZJ;Zc9=Aa,_[Lf,HZ96;XNGCd,1LU9fSVdcC-&.N?bO?Ne)TRdP+
cCG=2>Ya)eA3&FYDO(\aF(MSA[-]ES8XG[dT[[9O>VA;QBODK[=RNRUOP(+GR_f:
f3W]E42TQ@,AV=^<I+?)a)P>B--d</Y)ASXH.]11a\Z@T,X55S,UTQB+H^OA_aC^
A4WXG2Q4HHX62dO\_EI)9F>c/F><47U<IBZ[8(>GEQ:<<W0/8F\#AW7U#TE0[f01
P3>+cO:UI]Vb0dDLS^>5)0<\RdEeUf4LA:L8P4&_c;SAcNIXYU)WA+,;);MR?N#1
76YP9M.KG0):1)[:C?_^Z/4,5d^4L341TDe/H+7[ST_+Y+A[0N8eO@[2LS??b7EP
\-;#.SgGa_BC^=R.I6a]ZQd1:^GTNGef\Y.F0df?H4bXBG<b=Df>>T#\F@c]X3FE
cUS,bS]Q4]SMQ0B/+fPH,XK11>F-J<RI-(E#D,165-UL[B7E5OH[G;VB,f>P@)IQ
EG<7d]\K&B;__W2c<[[b&\&Bb5NDFW[<5CADWXTKNc5HfG(Z?g^Fe=:aWGeXN?dU
_I3#NS#(UZ7SB<,S;9#,e.D?GZK:N+5fP:@-Z)bQ]S3G[J^4#I<3JCbHF\#7DGT;
QG-S8R#/a1/C#P+R/@>EBHI4d8eKA^3HV&_:5U1USQEDV+2fVL5FAMZ14:R9,PYK
TaDdX^e/cM,C16BR:&6Y@J]]-;MI8aLL]0@Mbc3THd7RS0_WgbE99KVQA#bP(JeJ
ZBV_:POKV<BC>A+C03-,A1d3fY]M=,_Y<22:I4L#Udg62(EM\:9_VV3O46Z:BG]M
FC]=_<IV=_.?g^P=UgT]N\CRcM-S.fYOW-J57BXN2b8VLecT+?eS-R7]eV#D#b-C
:?4E&IP].A_G7b9_da64BQYfXPVAWM[EN:b]?ddD0Y,b-3G5QI6/eFB;V_]4?_Jc
cDDI^/@-3H^F4>B@7V,982<Qd-c5[=L6(]?.bPJDK(=]ADU?6S.dF99@]/^GB#9E
FBagb.E,fFRC>J)8ASY7I1Oa.[Y7H9.db^<\/.JC-N?CU-:+(c4][SRfHH+UFN(F
\W^7Pf4J&VJ:bf21(EPISNI3=UMO6DdK?IG;b9g@93VRV:+&LV_AMA,]UR6CQ#_b
V_dC.7VF6+NRL66MgDAeC-[,,:b4+3?[caW@X-7//SgEP>C]&bSD,@Nd[?:0ZWf4
d4G/e&c8M@&aW@:TQ6-6?Pb9:\]c29F4cK)HgZQ6b=UWC=HWf_KQ26VL5Q3O6GB&
>.(O5WaY>6eOO^:eQU+f@1RT4g?&-N4/>XM?E6IfF[8Z(1ZVUa-1R?Y>H-1;@/S]
YGPa>\IL0dcQ4XgC#CDaP+PTSe[EEd[>AEC#ZHEf@&LAU^K)WYTg<#SbS3T#HgKU
fX;5cVT0JN.Ua5N//&^>cGZ6c/3f5F+(4ggFFU\Qf]3=>?=\.Ee5ROPMb1\-7cH-
(,<O#HB&9G&[#53KZeP#@DP)UI]?ZY_WD.?>Z4P2?M[[=;gQK6#f)afWM74Q;>]8
_)_^[,Z]ZNS5CFM8LUHUY+QRHHZVBC3W1V7VD^8,063gg0@&SOK_^C#;^2\OBC<<
T30dQKDa:SIIIMLY)7BTV7ZN&O58B2>/--<-FfV?Vd-9YA5IH2NZ&bdXEVe@:@bZ
SCe=X0<9?1J)K4<fY->Rb=];c?c4P0#)QXSS7>:b6VX5PeEG_HI8AJUcB57<6,>d
dM\P#G=#Be:/e,9/PLH-)Z/Pf0#,?#4YG@g.fF[ZN1WF0J/NC11:E-f4C+<.EDT]
NTDAV_3bfP[&g2/:a>:#2d2?g-g6I)T-/>MO:BYBdYMgH[?]\7]9OVA^>aLf&\0#
@811LHKJR<]6?65Y2;&#1T[VJQ(.Tb12N^J^[6OX;C7J6be[Zg50Ue7\_Z?-A]NG
O8DQMe??4^,e4Y?DXTaE1]RL-@FN,E)MJ+ZU_0Ub-Xa8Ua]2.-gEGcH\0QSX_6KQ
93g8_TR/)QQf16PJ)D,K]W[P[I7^AY1d7CgN=3[AZ9Q.LD(.D7N8;^(\O6<K?R[7
\Ed4(GGGXfeMJC:6)13Da+4-;5EZa&QO3c5a1N)_@<;9XT+NM]=9=6],DFIU^R33
Ne8&0U9f6R78DJO0D@Y;@):K,V-5[DXd<KH#P91>BVJb/AIB?R8<PW?LQ5@cR[.G
/PCK7gSVRQ_&)\X;C,dW[g89b)E3#RN+16VIfLcH&U&->G=B4RQZ4XE.[<cR7+1M
V=HZD,=^WEYg78V1EWV+)>7>&<N(?>((;RAP0A#(>g@4UaeVO5AgH=X_#1<TA1(f
UR1F/FFcECeXP#YR;c<AL7da:]UKHb34BPBDFHL6@.f_].5Xb&>,/gZGEPd)TJd<
U7/JP?[FT<>JCbK=JN.EM&+Sbc82bD_&gPZ0-HVa[EMU+f-?J>B]KRL5=.<9a4S7
]S9b@7A=IB#B=(T^GM[WOB[?+I]gRX#B&&]X#+cYcT)+R8:^G:3DR0)\\Y2?NHg>
8]b#]NXKb6-c1Y9E^;?)9<g/fd_R558UC<7^WQAS:0J6bfFUW]IC^O>X3[C0aHKD
H+Yg2JQWgTD.IHR-9,I1b2]cR7b;g@cB<1+WEUY0g1^9Q#3<aD(:2&dQT5#RVV7P
X62N95\;cB@/Q(6OfKE)e][KTZ?95g(TZ/ZM(102K&Eb\0VQc+->XB-:]E#3g([;
<T-LUL^^cD^R(KD^Cfg+,fc:[AJ;Q=N<]c_\93>M,T;4IIIdITR]?LGGQ3YY3[]f
,PXVZW6O<UCN7f:,K73-2Ta3CDA1RdfQLb.Sg6?2E642gJ8:[CN.,=O09CU\PN)V
dORAN6G4\U7=HO7T</<7OM_-<^If#\g[RW;]Bc+8=JcWBMI)R:1WBB\b0PfcdY7Q
_W<:_IG-W5_V([2ZR-B,N2P[BHXJ4HgR-)K&)A2EYc4ODRQ?_Sa-M;VX2We/5C2d
\gDD2S-#.6@d&VeHBC<OA(&:RMH.g\61e.&W89b.,NC-g0N_dW[J&K)4VaR^MO21
TdY&YTNMM]]7?95G=4H8]00BRI>A4QH;,;_&ND8X8Gf-KZLJF_0,]f\/gE?O[+P/
KAM<N,?aOZ)^BQPg1aC/XKZ6AZBd2:V+_?Z4_a;dSPCJK)00]6fR2@:Tc3R;^Ab5
[(R9(FF(<N682H]A@A<7&e;&N169eOT[+Ie-\961@HHbcgI]OC<@=N5_/aWNACf=
,>Y+PU0[a=S3(@DSM+P+f79X6He^N=\Uf?XVaBZV3+RKYUcXOLI<V_82.T<[:C0)
+:2#+e\.0LC@.]V#.RJ_P,0;5U+X>1<?>&7#b.W2]R09_EF(=C5_Y5:+aQ-OD/0?
&d4e5J)Qg;fK_\^0cSZ;W0CI4\OZU?.C:Q+)_d;HP^T1ZI7-;N3=9),Q@>17e08V
Z2__ee\^R>/&a:@S30E,5KQQ<+>&9a9=dL\G7IZe_2RFe=E35L\@)>]TD>f5&4+g
@A36Og1aQ9,C[RM1BA;B5dL2JY6C:BK_SPOMB5S0+&1^6XU)KO[;K7FL/ARUbZ@2
f<Z?.W<KAg#=G]8fE:L:[9P<>&:VZMHZ)DSFcYA;XMRX9B);.]_A]\M,D^ML,>eb
U2:5+C3&bbe\JeLe>N)b1B0GWH1ND_V)@H5_V,;8QJWU0c5GAY;L2M?^Q)&1.c\8
O3LAGaW0g(e.e;,Cbe,e:Y7\6-=a?^7dTd3X](=VF>LgWQe])b7H\^e)1@TG6><X
<L0_A3?#,T6.dL?7FHXD#>Q(?5/7#NY<IVP4e1LQD2Y(IK3U\@eKB3IgTfgSgMJf
dR,]B,A5H4ee79O.(O@/,\]b64)^CFT._@?>E6_6V(ga1A)G[CXe?EM2PNdH_(QO
D2+LH\.XGV-,bO,4J.Z(9HE7:F5IeU^U)[CLSM-M5a?gDR&LW,XZJ6M?]E[Rb\L7
]OT2#eWe5(329f1JUK120\Y&H9)2+]U^##SeA,&/A&<+ggTL/)1/A4+GP&P>MZSO
2<cC(&CEZK^A2.R@E5a>3MA1)eW8<K7;=(DCY-We84&,c<81_I3>;V,-\7U9fb6=
[:_I?/HM#@J(KU^A1[EWPU9<GTYeRf4b.#gc)#VSRF/2EUWD>(/+>UC.:1#K17MK
O.JJS&TJ.f^S3L:=>Q<E#UCa6]M@+_#4RL,Z6_I7=4(O@Pa8cbb+Gc[]SLMEJ;^A
RZHGbc&Y:PdS+$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV
