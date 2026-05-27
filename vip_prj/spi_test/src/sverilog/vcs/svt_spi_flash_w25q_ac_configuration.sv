
`ifndef GUARD_SVT_SPI_FLASH_W25Q_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_W25Q_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Winbond W25Q device family in SDR/DDR mode.
 */
class svt_spi_flash_w25q_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Quad IO Fast READ Command command
   */ 
  real tCH_Quad_IO_Fast_Read_ns[];

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
   * WP# Setup time
   */
  real tWHSL_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tSHWL_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_w25q_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_w25q_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_w25q_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_w25q_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_w25q_ac_configuration.
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
  `vmm_typename(svt_spi_flash_w25q_ac_configuration)
  `vmm_class_factory(svt_spi_flash_w25q_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
1c,\,]_4fRaC\V9WfGPUP)-@G<<@25:5?^I[8dECUD\Z=&F:LDX;&)BR>g#:.Ua?
gYZfd1G[+SMO/0g54[D)TV1^YKNa+V=RJ[^8@MH3d\7:GQ2X;fS?0)YOd,)#[7K]
OK6ed146(TBOfR49KRMQNPIA[8D0f:MMU@-V4:e<=U;dYA?AYLB7SI0QNB-.@IaC
6?VQD)G=>e?NYT_CY9?=e1a9#<[11(+TaUGAW^)CX0824RbR?NYO.58;)UWMK2ZT
=E)(B@>MJ#@I)O)DEZg)Ub-):AfS^^CQ&J\,=//eKG7A@(U9>aWV^)@E:;DSScdA
5Ac-aY[E5J1D9GI+<G=U2ZGX[E\)S[R\S47[(6#(<>?<UV;Z38KIIG#L-_VCD8J\
G6T6]<1^a^EVc^=OU:=cVT1>,FgF;LK.bf<NLB.Q;6KaQeV^TN6:]0DfOZM^:0A5
^dfZ3BI<<fLgEMXEQO^2_\&,9U,3F@-._>;#_\<QFPNGRF[7fRG.4</g3=7QfFG#
a=aY,LIQRM=a#Le91H&#f-_(b)YE[V0_OV9(AEZ&;&?@_SHK#Kg;8gD<5JO<SANf
?1dE<N(F1ScecDM5ecSP0Tg_)L?N7\deMX+2,YV?ZR5]DD6b))#9,fSWJg^C/+,b
(PEVVNH[=^VW-Z-W@50,THU#eX)]f/3O+,W:)_VK&NVcdf9=7OJ\T\T?0MVJM-;R
<E2169(DgQHe&_#4f,a,(N@c0[YEM3FJB3OEIUa3+a(=:^JT0S-X?a)-Q@XIJBKFQ$
`endprotected


//vcs_vip_protect
`protected
=:b(\-+3Eb)G5D3c4^O:8=B=M&8(CBHA+-G95>224U;QNX7LcU>P6(U1AXKXL)#2
YL;McEGF.@b)L+8^AL](O5TDY@Qc<=Z@79):[_JD(\Lg^O3+[>@IBR@QUFX5N1)9
QRVb/6e)BT@40<1a/a/6Ha7XAW1+IEc9C5N4?.]+/88D35K,X52ZG=Y-?_&E&2cA
.\9<H/K6<[9\a;B)Y8[JL46T/Rc^UI:#.2:6MeRBI1:aHDE17R&1Q1[g)W4:^Pa&
c#CN,H>4MfRNg9a]G3ZggONO^_X#T/_4(aF=DHS^K7AE#G]-]SWF_?R&AE<\&./O
IJg)a6K/cgW5)&<M8B=0^AG3P::A_V1SbW-HJ)fVP;\AX83^[;W+ga.P6MRV].)K
.=C;)8J<363R+[K17H[^UM@UM0D1\bF3+(.Y=R<]gfW?HH;>DE>-ac<\8R#c^;5Y
fJC[:HXIFAfEFE-IDEgP2=:,_\>O1.G66_/B/fC_f;6#O:@\]BD.EXKEZe.1a#c+
?I:F5TEI@8WLM32QHQ/,BYF1WdD/AB>>^Ra=;B@W^b0GWGE[U0a3TI?@@_&TJ_/G
.>6e<ga.c6./Xb([LL;O+=;a6)3K:ae]T\8<QU?2.HfeNCNbd=8OT8Vb)F>R)7RF
PcI,_0E-)UY)eMCKd2W3PHS1=0gG2dW(^^,aPL84Z9TM]cJ^dbI4aGTGCHAQ7SM,
+[WSW,SAQQ5.-\3A?2gL>9=TZ\)#@Q-aF?7<S3?;V\FV_<@NWZE]VTQTD3#4.@FD
Z^2(5^ASdR\.e5R:_2Cd>5[TEH/c8#2\Z.[QU.7W[Xa=EJ8M30adIP)a#-T(Q;5Z
-FV6(X__18Me;=a9>PW_3E8XU]@VRYDR#Fdab&7>._Rf0MLLZGY)fDJ^UU&S6\NJ
+Z:^Jg5MT&d(HK8]VSWFF3;fH34VC4_MSJ1DM4SEcc=..P@5XE/)3;-T8FPS]IF4
0?+5LOW0YRHF[T/G;bOfb@RH1H3LNL5,=(&:#@\G29<7:2=Ca8DZ5;GP#.AgW?_f
>C3#2&#2??Y]Q.DWB9[J(+Q/:&eGff]0N?TgPZ:_[IPT2LM/cHFNK&RCOQ_<5d5S
f&\K,]T@MdMI2I^G67CaSJ7MG)RB+F3Z7ON-/OaDC;1Q4>:c&A\8#U2574E^fJP?
05L^41KY9PHCbcbN?-c:K\^-(]@HO&+OW8,K+ePR+6^139F-:bQ/0<1aGXH97>7P
MDO(gfKdKU,YOB]C,52&7&.A=7VV9CcSR.BM^5#+38cZ+DefIC]]Z2LL5WD@;Y?L
L+]e>QW@-<N6I6JfJ&]D#CfV:+OR6&12VPVZ-=^JEf2\-ga(,X&>@fad>+Q,BLNE
OIf1#[1;C7bCe9]VA0;W]9DW84V3J3+FU[-W)BTV]?K=FOHeL)1-@WTVZ:G0A<(U
3)O\B4WFG2+XU5?-ZF5=,IAXeZDFbUR\6>DS<MD_RC_JQ@22?Z09-&JIO3F2XDAb
<410,J>AD+^=)-CSY::OV4)R5d2)CVaCNTc8[bgU5cJX?GT>=aVcJ_-Ve92N<-?A
F-Z,[VaV)Qf(=f,OW<^<&#.?g>24D\8ZB\EC(17aCV\0&(2XF^.9F+0@9FJKb:M6
>]4/3N[O9K(9YP^(8\M^0a_(SS<)2WU^C1e0@cb?@,QDYY?=W-[[N:\C.Z18V5T]
V1A..=IG.+GbZN]J-K>[)7#-2AKXKc@GAU2<EUCFAJIU+[858Q0O]86V=4&bM,J/
EKVWPc7ZNZA^9.fL=3#<D>c<dAURC_W/XR5LdNcKKgP)H_NLLJRV8TfI(:J7.DEd
NF4:Y./V<6),]P.)E9e1Q-#gaTXGBR,dU3RMgAH^0U[4LVGd;<Z/Q=;2U3b>SbN-
?JJ_Sb&MTP@7T(3&/FU-fY-V>9C_KgDE<PVNO&#DABM3^W2VJB+@_Z#?H.c<;PY,
BE1?4TV7]7B380Ye5I^/DNGYD/QTd<[D70Te.(:M5KZ:U3(S9)U85,IRYC(/>CYY
0KK)FS[?/,3#1I7TFT\;A1AgVDUeA<)/:&2d6;209OOdL-]E7;)f2EcSUfLL5]33
8\4WE,:N[6JYYO9#5B1\GF/Y.>\<_AT5TWbbf/dE]^AaYO.B]JK>4:@fL4)C48B>
#KD]NGGEXQNXg3W>NYcf[KS5K;-(E=ENS3Y&.9JfFY-JQ7HS?Fa2;g-X9PSPXG5:
f\7R>\NHe63T1R+.,IbMagRPJOR+CF9ZZYOdIGgEaT5R^(G/3ZRTQNM1SRVVP4Ga
7OJbIY?[2egV..L)Db?]OL_8_4CB+1eHgJd<NaEG-\UN+)9RM)F35K_BW6C>DGId
,BN[8SD5;DVPD7Se+cF+DB+-0GSC6(X?LK,&fYZO_.HaIc+6&EG;S9&7fK+BN,KB
L_D<b9#G8b)&5U(?)@,M.Yg#E[c\_R&OPIZ[H#A;HC;Dg?C\#<3UUgS+^R_./J(U
&OGScWK9aaR5gGCP&g=INQ]+g=0+2->,79VLK7@2e1@V[T=Q?UZY<E3Y??HI6B27
QO_\HFc3K#T\W81S6gL1I>N/[U&,Q#G1QXUN=2BR/?XYS_]<ABeg0RDDCYI_[):/
B;]IKV@7ET2LSe3=,/f6Z2?KI2(9^<JL5L(<<EZNJg=-L9[;T-I+>RMCR5g][?6f
@^<L9e)^05(,XUL_;-Y)/XXaP3a_Q0aWV_6<K,Z)-H@^)e42PZH80MG[HK6aMeD6
(PY]f/9.e:PO(;UTA;)J]2g>dPN;@9#??)bSJ@1;Z^&_;3(GJ4Q09E)IYPebc5<3
8DG?R_ZO9A;9]Y?,dD:P/fR:R=,CLW[a9OH<ML>BO7BLX=[-:U8SV=4QL0S_UQ=C
AB/](C]/8TQQ(BF(&6/JTf;9QC;YVfc^E4+<2LAN&<Vg@0#BZKUb#:LBF6(N_]B#
RQXS,fZeVS2N8cF&.]\6<U;T+#KMfKIY5P5aTPOc[?QC4U^MA3]S5bB<eG,XEcV(
W^/PO8U_^&@UT(NE=)7.INg/g<fGeOP:=CeUbY7f=RE0Lg)5422,B+H989(c-cH(
a1&P6,XB6Q#G7d^HF9-VeO_SMe2OG45=+]^(ZI#f<&g#R)ggE]=?A6L<,UFT1F[C
#TL=Q3#Ucc1G32P9PBcUJD>D>0)T=QGP>G4N#Wa1B5ZTW8H>SDAHGf-IM(<Q[M[A
E@@(YFH/a;[f4Hgf#-H_<g^T;9Q99XNX35SeDA#VU=:&Y)SU6gLU99UT<4JP6;5E
+0PE-7K^Id[8#C@3H\@[QK@[<JFQ2>F-P>CCY8)9[C9Qaae)=fW=Y<+CPc,-b>2C
^Pd?QXf-6TQ;Q13)b(C?aTM+U=^]WZ-a446(K35<#.;Ra2,^/[\PH58<TTG8Ff&O
a.MZXI\Fc:P579I7PS\H20)^+,#Eb+M4IR:f\eTK&C//g/e.8E]KD^1a:6JX7<X6
\CRJF@?\#R=4WeGAXO4M11Q)W>NHDe90g3BQ4[<=\,g?KP8,-1FFRN2Q-e4SKYc1
,7HHe4?,XOa5S9P5,cA#JN)CN5RgDL&F]_^c@T)=gRa_(bPS<1VF7@UNF5V3#=a_
Z9N+UT/-gMKeXO.NgIc,F=D[-4gf^gS5LBb=ITXL+-\+8/5Y-5TWgB?e@<+JfD6X
8W3Q,bHLb5^d?>4Gb#RRBW54a[YT\3,b)Y=VV8+F20XMf[.SS?4c;GeM<K6R@@]_
HFV\-,,;SIb7H.bLVFTf95_N#MU3-3=SRaUa<]\Q[I6g0D1[P;(cVgK2FB7\0Q/=
?ZJ=WGF)U)C)FDJSMKEROcVEDe1-.(d9b.J9-dQc46,@R7W4KIY,g\^(1+S,1L1N
Od73+G;/(U[-G][Ice[FE\^<gL74D0aN9CFP_UU:gP-;+Q:S832JaeY/e78JM>(S
SDXB1BN44_,aKKAO2OM/\0.R.eb87ba]-CU79/^AKJg9@I:G74OS,@/&Y@V:33eg
cD9B&)D&7ZM_#(J=S->#@YU^g+A2>0E29+McB]/A9a?6FL#e[WSA[8QQMbQ5H@]-
E[7P1C.D6d/X6<-2E5S@+bcKFW2-[;5R]B52bU,]Z>1ZDb&_K^ALGR_@.AE5A1<M
9d;M7VdJZ?KKW]9PR@OfQH\8PG?XW\D(FF^21fc<2OM=.D/XY/N_3TEgdC)+?J^J
_Bg>NX<ZG5:A<=NQ/dO(I9DSU):+7]d\^7Q3N,WH?V-7H7\:1WAg>BB00_63,\d7
E[XVWK3GAG3I)?3<TI2PcR^:8GTV3V0@0B_G?:5VHg@UCJK8Id>Z8S:[Mf#A^R.:
.?H:+gD@5X)8;(64;C]bSA]5bM60[8UQK]eK,G12Z]2&P3LOYWYU(YKfN\C[Ob[H
2T31X\PfG_M[Y,#>3PEYI)20-_]O+.&#TX;<=+(Pc43Hc\.>6R><FI[E,E)-LA>M
&=832@@>=:=aF/^eYg49@-0FWA1WQSMZE1=BF\(UZQ#]N57.g?+cPEOCLgX<B:CA
bg;>CO]9bCZCOaYIN)TH>g/QU/6-;73&<IW1U\3M0PB9R:G&C6_C.@X)Q;7VB@O;
=gXeWQSZE_T00IRF8FV:T+J@F3[A452I-UH-R\E@HT1Ee9PXS&a.2I(.HXLB/ddT
Z35&_75Xa1+2)TCI8=NJ-5Q;R<KdPF)\dU,,WGAY+/_=]/PgDKc[Q,MC5J_]Sd/_
G8PcR<d@JdaZB,fa-=E?5AY+30eRR+VYJT)]]Sb(Xe.8P5fLPV5OFLWH05#=>Jc+
E)HT+BAJ?016AOXdV?39:H0FWIB+&8-bIX.b<RV-]KODU+ZFgS_8TNS<9>)S:2T(
E?MaWSWMU],L3U-VSbb15D+2cJJf?=K9N)fe]4@)+9LfS3)F^^8@74Q-[T-G<fKT
:XV#JIGYE7]_<_C6@:C?89]WW52;<+8^#5^ag;Q2>:6PM?FV=,)QU\9ZbU@_ONTY
CCL)Cb<Z;AL5W3QLb9,#C+>c)K;W4WQeZR6_D^</6JAg+(1G&O&\?9=?PEJe4U53
KIWBdGN.>c9IGPMSaddIKB1eJ3(NeFbfD<.dN2bCW@Ua.0M?,0_TO.R\4VDHS@J<
#Q#1GLWUST2L;F0(G1DH/_Da])E2+NQFeDI(IL3g5>JNa<<g8N.dM\Kgd=#?7(NG
6G\Jg[6(dPWAP3e<JbB<.G7aHeCW00<<=[T7R;e^cPOZ#:b),LJVU1AcdW&CITT2
fZf9MU0;S+(L?D(/5@8PIC>#GK#FKGVCS<aX4Q1(SNc1V&IMHdH1e^-#ffeM],.I
VJ5=LgD&QCSHOQG[_BJ&ab?8=(NKUYYdR3P1,fJL?O_WFHCa-GUW5QJ&^=EecV0P
9d[;4dNgU0a9W:?#\F<8YB13JbW\M0&g8-:BE5_7TA^C1I\1F,fVQ7I+MeS^6bVe
]#EbC?W7:d\RAWOZ2O4?#W[fbWdcfY9QQ5MgJ2ILOUS]cOL1g;E0c8YN12gdb[_G
=0]>XJ&f3<M:aEUT_^5>V6;W11?UN?C.&KIb2D):-=TM@WB:8-&9@NeN(:8U?6:#
)V:E+6G4E60QA2_Y\EdU(+TMI6G&Z+GfVe\X#f?ZSRdYBK#0FD,d/9d06eJ,:5TF
BA_6P.(.V08C_L=XR?FOQ(b^AN3V5]=@SZ.6HW75&B?4_A?_1#OUS^&XQJfW;WgW
g&UL_d,T.HQCWREA-,f:/#a\>P7DY0fg(TMCRPCP=O7Ncd>;b(6ES]5@IEXLAO1;
/T9S&TRU&HJT4QV;//a\E7>2;@Z_fe0S?B[RMN<V]0SLYa]8>8FLO;TXFT=#.UMH
:d[D4QePe)9^DH^begFR?@S)&7XY&)5FMR[J@CD@<DC5]e1;Cc>2=(e;g33&6R^_
TEL[TS46ZfP/0?;\.5cdF\2:O0BN3:dFBNCPb\LX.\6gVCPZZE&T1O/f8AW-9a>U
cYEQ#_,1U0fC)cGZ@R]5K+fC82^LD669cT@3#LZ3RDf;Q2N>4,>d1((,Ma88J^W?
-QQg2M6C3O7,H#RA5UZ-RGg]04@?UVA(e1>7E7eEOOg;/?GWef/4F+/E91YQ6\P2
C2EG;/X#4C?7O[1]6F9.9?<L]J<:2aCS,[XA@KNST,YRD&H#(eQ\,+Be_R-Dd@CN
bcOUZ;155<Y-F(^KTH5B,ed697[.gG-;a_:M@U7[O?C5DBEQcPBTQPMgQ3N]4--7
b6/6RcV38A\)DVFFfCS+eZ;9d_M/C\GSUUe<?NJCCQSMSI=UQS++6<PLC[S0\VU+
XJdD]WX+agW94A>WUSSOg[J_HdS=;4+/RfM[@S[\(SQCD7X1ZA]?XWA/-)?0??+O
I2;4,4BdUd5]O<D)_b0Nc3\E>V.JdU4Vf-2\<NW6+P/>I/fGF)03d:^]f(g.-3+M
]XY5=HXYJ[B/SH),g[:.AO<f/>F4FVISRS\ZBVG.0Z]9;4S]MXSF[O0NHJ/Pd=8F
fSM8IJIfP>UbQa;ETCC_X[SA?<N<=\@00XBA=f\9gF6V3L2X\TU,7/<F#[)4/GY6
-a6^.5f<fH.6JJ<O)b/S(]9X@H2bS9eJLI8Z505REQ?==F7W,VVL)XVM7@0TX-[Q
eL<_b;/..e+5FJag5BX8#g:DZVLeRBg_--g0=))F.1YbV:1T7^@E<O6=GB9C_05X
D;VSMMacaJSK-.JJH(W_]5=#^Y0I;WY#@Nc3?KR23=a;7L?_C@R.DbH?I:3N-)^&
<=\@ZP_7X?dSN:<#,d=Z6#W7DI5eY^XL]J;34W^V/g:J)I3HWGB[40S3DB?J32Y@
Ia]V.G2FB+@?e0=6D#V5LK]8QB-A5U+YM/c64)ad1d2b<gE?NK\7JYR?I&dGR<&K
^#+4KS^80#MVM\B@[ed?<E:fLC+[+,gCfg\6b^3VY?-3_3b6c?TZbQ2[O.=U:bb+
FAKQ5?3JK)3Hf&9UCORO[_=f7XK;e?8F_@)AgS,GZfR8;6PI(#>fS(3g?fG-UVc0
HEJ;@;_BEd>BaC,H9RG>#G0UV-:0,/\-J=]Xa](\KUDL>&>7X?F?Z_UP^C2F0=A3
[C1U.61L27BM#gVOHJG/L_[KF].(K9PM#5(\6B,52KK>XLL#b7WZ;dgdH2^?a\8;
MQLS=+0@GKTg=Z782S4A\I_O#O4+AT>><?V9?f1bW4OfZ[\ZECf[H?OKK.6#FSN<
87B0P#HW6CYI/6_9&FUIYRPgf]:K3dO/)J@f+O<g=PH_^;\LA,ITe3.c+fF(/CRV
+d&/>5cT-<4AS8(1W(21X+M5/76QKaCL_DS-@:gA/Ne#Y5KdQd1X5G+Kb/RX5/6\
ce?I<&R\C8W5NHdGIR=.,:XLNZV\JUKOa^_V/&=&)UD-40?U6(IO.MIH1=Q6QGD6
-)T2M;8K\\EZG;6:(4EZZS]OMcHU#(7?F:g+@1E=9YV)0<gWe576V-6BYY-9>/Ad
<6UOT=[:2YCCPb#V\+XS,;a^<&U2Kc4=1U3K3T]LYXgLVHOgM:RN_:_3,2C?4Y/W
?CCgF<(G1NMP4>,TF#MW8Og_Pc\=O#@6EeB]4FNGCU9;C?=CC^>>V3;5EQ:U\B^_
[TL8_N>K3CZ:O^CUIK1-KbCbH3X2S?M[DOGaUGGc/OgS7Gf&I@VYIQ]aX:&A4G5H
()_+&IPEg2)PD+OS;OQDaB1SgdB@VK:LQJfE2AK5:Sec23.Yac6af4@.a6>Gb(/0
@8baER(&@AAB71]4T6N<2KcW4MAO2XO0[7Q)C-?cP574FO_]VC]6D]:K<d3:]b_>
6N]E:O)0D3\.]:RdLa-CBPKUFD-@+KQP92B]X.QKIUb\Z<HH2C:Aa2EPa;VT#=-6
.e3-H[fW<M&.<LEU>Z?a2X\7G:2[39>MLdS#<=UYW]gP7-/0=,K9e6=W08MHE6-A
@2\R_4A][(NfK&Eaf(@X--N#(89XK-G348KaY.a-[]BGI^f5HE^=.QPDbVR4]?9?
dE#:.B]N[O7OfBA_;b59ULCT;#aW90J)9]4V9K16^PJH[2AJ2L(\X;A?7(-Y_KIX
PEQATNS]?BaPYaQ9PddM2cORJY/GTA=^AA0J^NS6Z9T\GUfKKE;#]RD?X,J).TV>
])88W9d<&4?Y;X]7^],.dP:1P&;R@&SFL66:V0WY#J.=_cO]SC(RC:JKK<7U);QE
@H4(eA@:,B5.2aL.=Q8+KP_aC1=EGX?W:L[ZFIf^]<BAaA<,>4U;@N9-(<+]=H?&
^M:TAWZ-5d<_=M#P9\24\_TcS;#^LF\#ALb1A4gf>dY(P@eN?=PALLW78d)=V70X
#f>NMc;>]DZOH+^A:G,Q2Q7]gKM\?2:V>0YSUQGSO#Z#c,ZR=RWE8L.)f5dd.7(F
VLJc<8f(bZKXV#.WU,H?UbUf?cUQ::R3QeL\IFEH^d47S:cQ/#3Gb0.8?[(,M6J-
KT=,RU>TNE8-#I+Xd@&be@bY)QNPKMe@L^,=W=gXG_1e[2^C_;+B6WZC4&@\\,C&
:=dc]UJ)Nc]M32<-(K=HO0&\ea=]G7X0R?)HWJF___HH>Q=\.A80]QQ(SC]T)R[a
E2OPgU=3LK#M\,/aaeZ-^9/QJ(21.VUfaSUYJV2+0C7^,TPCg6#MeGGa_Pa:X&&H
bX3@<2TeT94V#+=WefDA5-G4?KeXX-0+AYdR8&[=M1NV3[Q.J>5,9/4,DWIW@,6)
ZU(M,FRPBC^##;1/>#bMDgB78^KDRKF#^C,9C=[,/DNE^F]#(.:HT#@A&II@gXEW
fIPe^WbaMN78XVcU1Y]]I/0WPG^FPM?b[_7)Pc?4/c+HGO//M_<W1Z#Y_WV2?3R>
@@D.La=XFb/F>AXM,AU(9IGV5396^F,Q)ea=/LH(7MZJ=e.AEI[.@(/:H=3GRb[N
O^XRDPUFFf&EdKee/#GWGJd_HX^ZIg(O=990AbKeGH;MWWYQJS&L=TIRfC\JK]Jg
/]\08NX&G^.3f>D-d#f.dMaG91=W35O:#5=A,@/@PGV-c?PJ]NF&Z&E)7B>f6;W-
bQJ50N)de52g8C0TA:.(B6@CCV1R>.(Aeb)5<?Yd_T4Y:AAWZG&5JXO9]DX^1I]A
[^_QA+e/GRfB0b2b978-J/)IU64[]d>^3V9[fGf=5#2K&D\Y1PN884^1[FAT1g^U
4K,HMV[FeXbBH;PbE+@Cd@[F:I^SC0)1(86IGRKA]WO11=fdf:ZSJ]P/YRbQM^Y1
AE9QY4:?)KI=D7Z/P#33I<RF;60K1^9]?U,2#8acJMBD#[O.TBgSVZJ0NDESG.DM
NYC<QN)6N0?F\aW=Ff.#GWZ<TF8U?g(2A#Y)gLZO-4LdQG@)f#;I2=7E5=27&V]4
C5W(dQK)E28\e(e#VdL<GGV7Ld?4Q+d3H[)?>_21(1+7,CD=TI]Eg,DPY9E)<XI5
B]2OLgFS(P_QV965ZK9XXD._]\,FO[5gP5]c<.X^4=VPLOJ5@1Q,:<:&547RJ&;R
;FP+-Z56+cF+Q\OC53dT49f^db;1:LLZ)9C[<(D8:-aTE:QPQ=ZX4#cd+3IRP,eS
=GQ4b>)c&WGHW5WSf,5JT1GSW#M66DI+Z=0J]1X.1Gg2fGL#58G:gOI]=dG&\e-&
/gcA1MNeMK9WO_]Y9cb?M-^^Q>Dg0Df1ZY>Kf(=J-Q+XT4GGOc/+TSe0(#a<Y0^b
8@S[9@/cPaHc)4_I]DDEZ,3RT(:^R#E?=^Y3?3f5\,K&ASRc2V80N@bQdAI+7=:^
4;6W_VcLOUYO>XgSN;QMB5^B/GaYQ=P>;;eEbg)RF8BH,Ca3FIR=ES5dL2>BV3ge
&:PA(=O=_T7S:BY6JHQ,fEFHE(B-#/-1<^NQ[I4HC3YZXc3_3O>Q)>#J1E/XedG;
I;0P42e.R/1Ac?0\cY9I1@AQE-8RdH(928ITA^OB6N8?V.c?6K3]X9-U&_F\[L6T
PfK2f_ZV+I)Q1\=T-W@8(gW300#9L&-,1g++eI^=[OJ3AD_3W;9N9cAPYL0O[0O:
X\8dALGNB70/>E+<M_QA@QD6+Le?R^>dVMe9JG6;U#L<PXA;0?QCL.2Z.eCH^@W/
\3]?ZHG,.a/59bHR9G=bWO^1Q<L\AU,2=5]FeMIWYX7Z#aY-Q_8De7gZ-7]5/>a8
H=N>+&.UeYI0-Gd/0HV)9F1#4)Y848/]23;1b?bKDN>Je1(4FdVYUcegFZ>,R^c;
^SW4J0/ICCI(6I(A9P?IT?T]88a:+[F,U819&]R4NOZ,M?.2:NKVJR&[E67GSg)/
T+E&:R4TL3^KZbQ1Q6Y:e4EEbRCSU=8_U:\@FgPVaIV4a;UNYC4_7O@+<_D3MSGT
2,E72,VF=gE,1d+8A[6a?f17HFS&-VK&KMI#WJ0A2BObdZ2FRESM07G7B9[+WBL2
4ca.:de6_UQFB;R//L>68)(@L=Q/+3Z:WcYVJaWIeUePI]J<E9A(Wf:1XMgeUE7Z
T(?;WdPX)+1f+aJ2)J7U/@d(FJF)QD=,8-I)aT_4NF,DEUIJ(#H)G2BY<XW.P.K,
@bEC32=[a>9CMe><&WAcJ=c6.N]\O.Y2c()?WH84XDaZ7GcUB0W77S:^QV_>EBcK
SPW5/:=#Q_HU>ZUO]Z21@N8ZMA2L/,26Jg+JKY4f;,3H53;^Z+PG+g^5ZY&H7U]+
1\acK\U6QgN#IBVaDF=/ge/ffH^/_\&#+DG@CfROaJ@BL2IN7Q4]VJRK81c=YfI0
:__-3&>=)Ig\eZ8?R:61#a3U(R0-E9>C5IEQQ06(0[AK)M#.\IeL)O.[WVZQ0)SD
.>O2199D^]cb&BFTR3Hg90QY(?SU6_7D2;;;6LgMgGL30@E8N=M?4Y(e:<13AXac
YGK)B.[_S6)bg^<f&Z]CMT?WeK7W6D@)\@,(+AN,;.KOfOB,S.(g)1;eVVb[BXIL
IL5:Q/<fe47A2ae?&V]3@f.9JP67a;N=S02T;fda1HK[(&Q(]9HI#\IJPHIU[^9/
X[Z3)K(S2C9C0[XE#dg5ADY2-5aa>8e?4U/CW\?)16JSS0G_H=6QgV8:H7bDQBXG
8eeD][_@aNa;PP@.f]Q]\:PRc3ZgR5RL#dHcF19Y&3:M5__KQA1<</2:JT[72cC0
[(&>PUMePAfU-0^>^3:1XUM0KDF4=@c;4@EPeU0[4H)\BXWSY(7B5/&_9NIUQEVK
^1ZBEOMC:KFH+RJ/T^EG944c>FGgI^LF(LA:If^HO&aBc1&8E8:)8^,Q;E\3&5KB
8;-7d/4J_[)^-YVIJ0^c(L_+ggXI?d>e\B8+BQgZ\/4TY5@CQfF37@RU8C_>P#90
J+MTG)#6F:MSIbD&e#E)4U<d=WX-dDPBYL+6#@&-bFH<57A+e:/1UKC0A+J\TZZH
T5@aST&--gKTFF1_/(#;#A5[.K7:=8eLRBd6b&>:^Y63MaOVfe+aWUHP[g2cNTQV
AUc\QE]+&6.)Kg=b;,=R+O[1IE9^11DF6=YcAUYHU1g2+.U#c-[WbRWKUZ4FNN:g
f3P=L3g,529O)Ba/f@12RLR]19-:->;b1JS=<^W,3<+FZEX8B#E.&>TO;W>7KS7@
USe?U&B+3AeCWTQYS3:9=0Y,La4MW:36X#N+bC9[R-6V&dYadK404S[8.D&.gHOB
Ldc5=:LW\gfL;9=A0S>BW^R)C=Ya++WP]e]A;b/=<1.,D_b.9P;95U[CgeB^^=0D
ISK/U>2Q#)[&6QQSXKUa-#,<AI;ggW(-?gPD\geO#M_C_KOg^,(b,-.-\01M3EZa
+N(F]-T70b)^TQLP.\)cXNA9_f=EaH;<HGBbdEQLGO\)(=(+=4@((EU_Gg;-[X9W
=Y-ZH:8KGZ_7M,Tc9UdP]C>AHg-da1492@/U8;JGM9=?&#-2&f&BHD7L789Y2WXI
K2+4Z@5SPM@//V;Tge;7L@I<H/)8eE?g9U#E,+b7>(fe:;[N(I@)SJ:34\49=GLM
I>M7+IWeO1,-D6c&ZXc7OTd2fVMUf8(9K8bZ#G_P;Kc_<K8SeF(:6<g1VH-gO>+I
&]X2\GY,HU^:U+KLS3&H_DPN\W_E-HU]R3bMa-]d_6DAH^6,(-#R1,ccIR.ZN86N
Cb&CSg93T@9cU<?8Z)R.LM=LRAb_fF932[9,X0Z1A_X;aC+9?d7EBY;#Wc)-#YKG
KU6.JRPGY479T.P<gcGEX@]=3;D_ObD+++&b=PZ<c.\-]CMXbX2XPbM//G=CN7]3
eF]R0J,X/ZD7;L?6<;;:=,L]S_J[fQ7cKX/e68+\S2H.CbI0&/8Kg7=_7\OI(WM?
G#5-<2+7_fT&^^^CaQ-dLTQCbOP<[/4fe8fI^772[&PIOVO?gLf2S>A+e;3Kf^6S
>VAD09VZ3C]H39S&BZTNM=4;P4\gREVB;AQ]JX>7b</G(Ye-Z)X>\OZJJbAE;De[
=R.8D_e(WP:YbQ-]:0#1MDbJ=OD1:f^6-d,fbR/-TS1<)MXG+<O(([d(X9X=.0\C
Vg(<E;S1aMA5=M88b_eX4KNJZ-\,1M5&\^PT8f[e,9c-<_+VTK+@\IT;258<EPFg
3R,MX:,WN0P^6L_+-,DUQf0e5(e5+SH;=dC=K\;)SM[W1^d9?Z\cP];;)4_+]bP&
Y/,CL(g,.C]:cXfX0+X9_0P^XVc8QC(R2N2,>(EaP-aA)FIZG/S2c4Tb<A^Z7(/A
cBGR&P]a7WDFJ0=?6\D;,,=44ZaTJ=0RB(?)7T_VO\<NP:QO_+a)-50G?KA5aAaK
A8M@N,^J^[ZW-V=Oe1deCC]@KN_(255ba(N9c[a@PKNZDO0,B#=C,]G8Gg-FI_/f
ARHB+GEU.L5:RIOPacUE<Yg\#JTGM?Qa8dY_a.a7433WG+1L+?b6E0af;=\&[>4Z
=M<-R^b[--79fX?.G-GNT_Me,ANL4)8R/1U04VB8:ZN)SP6a2RXa2cO72MW];C\Z
)I.Z7OD?gaAa^U_/,He4:G#J2KED8[20?WDR=VCAP67?=]gM4#)(Q@+9[?L.\?Z.
1;YeBI/1K33<Af=MQ/K<-PgLG(?CTHLPV/7]ANJ(:YRP=5TJ.GF/e308aeDI6BQJ
@&ZA,4W2N_5)H8#3Z07;[5A#^8fXb;S3:Y+3;]deMX4I(QZJT\.B7)TBT7#YP4+K
MK-bO58D2+ER7:O1^5C.K@M)><IaYa3:NKK@+Je.E3.WXa)e77>E:daV+.\E6_]-
AgM_,_X[=Xc#&\CME.UMHX4NXGCV7@,VD8OV9M.=Jc9S+2H8-[d+MD]EU:QM6g-(
?^(+3\E9de[A&QV=d_2>RaF+cbMHR,GP;T-=J?:K(IC?eMO<7G>5-ITJL^efUO02
641+74;(HKfE256&8&D<@(T)f:?+DR;4G]Y^fT)LTgA,+)9C.O8MMdMN(&Fc#@BW
Z4AY^&[[@dJ7MQ5JOa_QY\2+[b9LgO,MEAgHb9BfWE9?&3/cHT=dGQ\BHa;EHI>.
50-SI+<VU0NAE04A(E0F)F3D/62TO\F:FTO10C@6(c7V:EWRPR6<8Y:d)-+(Ig[P
dARF^E/.1@ME>D[Ne3R/^@WHea_FOg5;A>R&T:<>^4>=J3?SC4CI&@7MU0:HP3]E
4^b8K/cZ8#J,F-F8F1]8bN.H?Z9TE@&JNK.&-7eJV:7aVNJ5:]EB>1#P\=OVgQ=1
b5#?f#cBG7dJ#61]+SeDGZZ-aF2-gJ?U\6DE7JI9Ka,ZG2GZDS9K/A0b5HU;?R.O
fPY;44V+35,E@^W1GF<.YX@5M>g8GGF9/(e+XF#O^:gBJ:/V)T<U_,9QOc,7B_C<
L<45,A(N0)Rf)IKAe2gD1#b7(V\N-)>&a;#AQ85=+c^SD,(3V#9Q,fPN=[PC>/d1
9C#TZeNGJ:dKTFFP)]#,:,]@Q2N)74-#QDI:O_8WJ)3eL=(\aXHTF@VU5_+,X+=L
8af_JWJ0G7L9ScFYSADU,87^5GVX0S)LVa,<5gU63B)X,1P]e3GAgFI6g_:.Scg,
/0Zc[]HG28[c-F,G>[9d)[E>:KB<9#Je?BY-^^g&HdRK+T84/&,UB.@a849)3Y07
CVMNEV;70<e5)E=.BF[9&YH252e:\^XG&MR6_,[E;/ZcU0[=4AS=D9a>@H:N[PV[
?>5E96L,7/L?&_OB>7G=,XB/JN]@B[RUL\P(::SUd)<OBJXc)Vg15CXP7F.EEA,@
#4\(0X@1b)L^-IHWOWfL7BI6MZ/BIUP]5E@a:];F?G:,9)[NF&F2WW-IL?A5W0X8
W]eaR\2I#-I48CK=FC18[9N6BH]K1Wf/@?-YAV]HVQXf@(&gd=5QPgLH3^3RPT<b
88K)3TeG8eTR9[+7_@g./#;A#W:/aW@UcJ9S#+K;:1#&0C<H[g&=f;#.=3c3@e+C
NbTP9I]EUTZATX[\>F@-2G3GJAES<S-=BfNKO=;gXY6U2NK\OXa8D^5#CWS:EH\@
\DG<LBQT50RC^\E0^V_2YL6G9ZO\e3L2Yg5J605FTL]gNL#Y#F]Y?6_-T:HYL&<]
1#)c3]8WJ(V:PW6+C9[85H,BaM4@SJ@0Ma/CF-=b\D9;WTAaY)&C[1PY/cRW;?5B
Y;\e)S5I/G#Y2KA3]_:80YZA>fKJ3MK0?B/.CBX1O=)ADBYRDZ\[=ceEBAK2DFP0
^WfZBCHgB\F&SM>SQM2ICP6M+7Q?RV[+d_3T(7Y3FC+]RE@5+@IVPH1#S:0X@UU.
\^IVN83VZ-7ELPXN+-A3C#D7(6ZW\PQS1?OSe;3>5+J+ZJDb8/7dT<1(0B?TBB.7
J^EB7&fX^MG2FDUg=&Q9M^\V<Ef0d1-H;9KO#ac44EL_1Y.>+ZY;J,PUgV?NV+F7
:B&V@#<LIP3WVVR3VFR\X0@c_1Z+@RbQ,LJ^\7e-[WA(995+@E^5C)->4N:VT/@5
bRZ#OB-JIfOJ=JT)[2-W0P/aW7T[Nd)H-L73FB]B+=L3Ga<G#::;5-D>R[aVW;d7
O)/fTZYI[?Ua+=V_@V<].(T/<;8L#J)&HLd-\WACLd0>Wdf0_?2D=b4/R6e3#2D4
O?;6cN9L9)YJ&gbQWQf1c1b=U++<07;7g/_d/)O5^:TRQU/2Y_gY/a=AH6J^F)@2
0cM2fIbM.IC6#P;O4X9AfT357BU+/63BKV:O(Q#J\DHSDcg_,]dc\&UMC=WCDPT\
:H:ea,K?:S&a17J<0==RFGgZ+b#cI#FAL<P.+5#ZSW1W1?gSD#.;Z=??G]I3^41F
20c,,CKdSC8):cK+Ff=^(I+_TGD)<2=-9f]?G7XFWE^GA8GgO<)8Q_VS8BK0FJ5J
]BF[/5S]D:NY?b8V[/e+]MC0Z53\<(<1Nf@K4V?)0\RLX;_SPI1?,aZJZ&6D;,5Q
X.GZZ/(aA?W:EgO_]+R74,ef\&#RM=3g1(;^WPe[T@BI(fY/V+@&LCeUUf@<[N/:
TbR6BbJ,O><5]1U;.Ye.A\KU0,.gOL\-Ca9g:XV<@K04Te:-_bJf,>()]@G(WWFc
UcV<g-GFR1,(W?:NdG0W]VGgZXUXLfM=AbH+H@VV,8e0#OcI3/D/A3Y&=;O?]Y.^
[eKQ4N&fR.^+E<,RQbS)\:^8c<1,FF>f]VS(^Z(B2-3\E.fY3Z^3B-fHgM:]+aJQ
=UXV:b>0Ec0P^6L0M3DX7V]_49YJW_/5=g7,]_V04RBUM288XSO&CdPR^]eP3;e>
UNK@-N2,57aQRBRf^451-BQ&TANWPdHU\E90G+<:J;K6Jb)=4/OID0a54[AASFac
K7TREQ(9>P)W5df?^7A6>NO[c0@L?WF5>5_5=/IM#D7.(6#6P:P,K&aY,+1B2+:S
(TK:)^6493PUB11/_24&3gS-Y:/&H#EJ(VO/_W.b,=(@1P\5QYCULX874U_WS=@c
ASI23>MZc<PT=GZ#=-I\KH0TEH63&U#5XURZA.4-,:2]b]+@GcTAP;97^9M;NP:<
U;I@TXKd?IJ)=#+&+WaHVcHISZRJQ>T_=Y+\E8T0D.,,D+Le0B2a]:>6#&Q7(a5I
\]J5FPgV.f0&ZP@0JU-Q2>>?JVM)&+H#^+b2=0^(&8_=3,C3.C,P-&_Ub^a]ge_@
X0U9LRc1>>+NGEE7;K-UGS3..]8T4ME@IF[G)UWFg:__;EVT[>ROAJ29Q^M]ca.3
_e2^fJ#>&R2#T40#LW(R\65AcN=&JT^;3&??FA/=W4.[a<Z4AZf7e6YJ(?&CB<@:
2P:[L/d0S0RKd2fO@L1.MAG(A#YfSFE1?>)I:A?NGPZYXQ+LXA3#@K,:5U:@[a7M
FV8_[/2fTd7J[&G;f-7BQ;&E:?:J)9]ceK,()9F)fbFI3=_USI3-I:)]EECGJIVN
L221@L;2aK1^W2Q7N\7BN1(IIH&T]A[VDg1M(T6fd&7Gf#NOZI:V;U_I>YZ4?B?H
&,^17Hd#C[#8,bS@2fGX+#a=JA\PN1OQ)\4a:538UEIg(085T@QcMaKA7/NbaT9I
\F_JO;L8f^?0&T.BS8O2./K^/>8R_(MMJ+<=,A:5FZeE++[QSZ5:XbKF#dPB,<6a
&HTeTF?#YeR;gM@f^f:)Ve5g#>(@4>FHMI0YbfAC,5._H;=\[X?cHQY8C?/VY>4Z
6B<&AX7]W=JKaE(IRJT(JJP?TXfVPSP1DVH=aCcd4B?&=f?\O#G2#_d&OW3HA]E1
I#-;7Y[#/H-1)#d39078^agZ9J]IAIZH==@R6f,WBWBR1F.^fBeQIW0>^Q=/&;fg
+_[dfN9DNM+B=]+,a=Q+4g\[Md/AMf]K&NH.>GI@TY0\#Z-@)(]0D7=5N[8)-]O=
2_dG)^RBef5ge2Pe;10H\&^RNWUFRG>\Xf\G.aMHQ(GG#H6OY.ZWURR]PU235J:L
/A,EW<P<3=6\aK&@6:NPYaWY0M(K@\,\PPM9?e.GMf0f&06UV@ZUH(e/.O0U)JbT
b#dWcZgeF>;EH>T12ae)<B+gQd6d:HBE67=[TR<b_c^>Xaf2WbU11P.N2E2YA377
Gc_>E,FG)@feaOCg&M9#KK\DRJB5[CfQLC;+80;ac#/1bNf@GZ-abZDLAZAQM@ZI
bQO3YE)1BJL;UX_=L_e\PSB?KU^L;^S6TbF<5+bNV=3HdL]NGg(Y9K7B<&]4284@
6H;,a9LQ2f^>E[S51Y0H5ReI=E/>Gd]ZZ:6Ce;gVQ:I#dg^IPf@49K1BLY^F3<TM
VeI<8e,2#F4Y?)2M:N>GM?LI+cXBR.(?bRO\+@4T3:ACBff^=(VY?#U@J#^7+_+1
(VTc4N.7@MF^W2Rd&2E9:+:a.OGeYb;=(fCb75Q>T50[6@U#N2E?c0;@#40X3WO@
@=#CPH:JFB23PDfPHZ;1749K]7CQPX-6#Z?DdYaM3WYIH@)ag8Z,C5<+A7If[DN8
Z8LC3B4Cd4#K@d3#YMT^GP35;=G2(70T/,R;ZcST?G.J8)#[3@-@ADUfI\YFRN-.
HUd9;H:ES2X^L8,a=<S0;]/:+79TfJ=(V)a9I^I/BW7SIB9.VGb8OGH4:W]baZJg
Y4?;G+SNGBI->+#SGc\bXA#(IT61+JZTcIDEW:J5NETf;\-\T6EJQMRF<YS;Q\N)
E2edQ7=BN;<>[]R8X=6I6371@ZC&V>&>cZ]S&L?YdId.\SLS;Df1cI9G_/D1D0N1
QZ282P6F(>-2\g]U,AR8/SK2=2P9A_MLZJVI?HR(b,LR]35^T4_5@])Bb]d-/]G4
b6D1gL?)C]--&;2RER>8HTE/=dU;LaJ&86ON1W1E70<Mc>ZT:UR?TfcXd@;P+DRH
PH+.YfPS[?[DC8(/S-I9=QC3;,RIB7Qcg,A4=.=Gcb2g^J6N#bL(^O\.5FT8[JIC
]QgDNM5W4dHQ49:^-G5\1c:6(\c,PKg4NY#(;a)<>1DYH+05=,V)^A66:)2L1d=9
BD-_DRZ37#KB9P\[.I1O10IKR:5.6A2B;;Eg)K81?NHG_5E6W(AYJ\3JcV:.4+B7
JAAR\9KC_O9A0.4HJaKg2-RGTON]/JY?RHf2@4L:g_AS;<:]EdN.Kf3&a^@/I^Be
5)+B8V/E@P834K#WfdeBBMPUOYJQVN.W;O1\IF0<SV,GS;aET-(ZR1F,bPNBcA-(
_L6D6K]Z2b##R;E7@+P>Q5BXf=.,QL;@#8U)=e3eG;XBcIBEa93c_OgX4+=/]8ES
2F<KY_g.CYDP\B&Q9fgD,ALgQ,_/RNU_+OICO>O1=[+O2YIN9R3AW&Z\g_55/eLQ
PDB]#OW9QQ:bb^SO_H=#[I8Sd3Q3c^?f8(47B>K\<TF\B[eK1IaCRJ&f^.)GFW>?
Fb>B6HQ5-b8^Q/bZ0A8f50R_->:F<2gGK>f3f(];]^DMbU>BFKB.95GG8.Y0@/(_
2II\[dH^SK#J?N?\L,7(#7aD+LBFH-7#P7Z=P0_)56IUgUd+\WJ3O2cU^>bY9/QO
4FMC@@.d[6FE2NQOIYT.>eY+IAUe[>(F)RS_-:-_>0-\a:<d8IHPA@g534E/bK25
?Hd7JK_@:/?d#_5PSA/#.^)0E^6TT=c6>.W2:G19.Z1b>^HVPKQW#XE,0C<Q&4A.
V^d&I48XL6G)U[L,3c[)WB#;2La84^-eI;Z-T3^5O,.I+d_1PX/X/_7JO#\PDK\R
H_G^3dPT^URaLHK8gK[aBcdBb(>_T.N:bODg_Ae.;DOF).S_2?TE:W;Ic+;,-YcA
aS,+5UHg-02[.XV+\ML\Z;8Pc@bMDO,CB0?JSNHUPH\&B1\P=Q[@;[&G4Vf;&RDP
(<1P>X.XE.TVF8cRRaQXNcRV:3ZO.S_(T:?O08._6/a?/4@5RWM2.(#S&],_O>9e
WKU5W7=0^)F2P_@Y7C3_I<<;3c0gBA<PI.R#VfM<,N5,W)U8Z4U#C[9IZa,47Q#6
Taf@JP/YK+c#-/5=dc<:UK5UWXS&X5-8PX\QDZWG5cH\39PRL1aOYR0Pga(9#IB<
#2gBc[5/)>3-2AQU65)dXVWD\?\g\.J_)QK\0W>Wd976>J&(dPfL:WB66B+MJ?[4
C_@,H^KX?_6#5+X681TJ#<9d#M.;afOLAM;U9:f/STI+Y96_8H9YM)N>B_5CdXb=
Y80fdW#N9c\c@B0IOf7<KU]Nf487ccY@3U:V1U+&O<4<>#->,DULU-LGS[L6X:KT
d_:A312b-_JTRQ7Wg32#O)N>SNe2YP-+QPKMS>X=eY\V84fEf/^_KeL0I><bP[[a
?,7E=BSF_NU2fIOPJ)Y[9\PY)4Q4+e?:LF/32SJ=1JRXbQE3+7fQ;CVAbG9X[PQe
QP\)[MREXG2KCN@3O9d^e^@F2FS&1dE_)3.KF)X=b8/=/2>3+GACK>GbO=8:T#12
4F_)?>PgT2cL>6fX0O6CP@HIA5e7TRIX0@(.&?3Jfa+W>&BfVgVFXJU+^(]^>EQA
FSZ<^O5=T9^_a<cH2@J[E2Ia->.]E>DZLG4g+J:M1?[AId\3N++B-RV>a>2eK.#=
;OLeD6e(UN.D[@_O4(N?5gDg84FD-PdNGe9/^0KMR6L<K1A.?P0X5R?[WM;ebRd?
8=/]7cI?aH#\aD_,gWae&Ye#221VN/Q<Z\Za_K2]VUJT,;_g6\)3R@Z\=eRQK;VP
R7-GZ;QXW?,D43f+>QBO_)/J\L5+QC#99N50LfN:2DaY0CIA8?2+)L8.cUG<eOK/
S>HL;0f.V#&XIA?YCL.Nb8&4Y-QOL=Nf1g19a6Gb^dQ>3RC38K^1SMD7@R]ARg/H
DNNdXTGL?:U^3V9g;)RAf=ZcP<Y2&G=Y0V\12aNQagJGI,M^+fd-_[eU&+C,(c:X
U&N<+VbU5[9c=N?&fXH.OK5EP=\5<#B4bTI;Vg5(GCC(]f9ONO.8FW.9UR:g:4&;
?(-U\NW4MaF.a=4KKY>#Q<fUd+;TDWO/WKde8K#/bZ3[-82&X\/,SZ3H7([C0Tf/
<bU(T69=INJJY4)[1C/Ia\0><0)ULc31gA_P2#Cf?^@:f\DL\2M[L1Z=).)E,K7X
:1FL8gAWU(IfE4#A4[PSMPTI)DW?(dfAI-.E[1)dQ]]P(/].#)K6dPVZ2R?g5J&4
\<:1JCf4=2IP>Pc5T;V>TY[X_&,b26=-N)1fH[W@^WH@ZG0A1951W_HBQ/8.e<79
2P_a)Pc(PX0NO#fa8+=[DO,;agXU3dXPJ+.-E0,NJ9=5gfZ^NJA(Bec7Pe/2OC3N
N5aJCdGI2G9H/e8:DD&<98[3Kc/PS6IARL2)d^.,RN_b]2L[d?DO^W45,60YT>/S
W9>L#,3<?(1gUM/AA2<a<;XU+#0V2FP[aLF?aG4>Vg>>Q_f4<B7&QV>L3VO_1f7)
PYT/)66<-2C(3eHP/WbgD\-8IJJ&b,XbD2K3^c>)Sf<4fa?JCQL.BCA<:6<5FHWc
M9C-WM5#8dGaU2<,JF=YP;9E3SK4/Q/6W-&<SOf8VCA?(DY-CV[N;X+WIPG_N=Vb
O3#=UY.<OT3YM-=&g/.6(XT4BN7g[a3JB4]=:.W?-=BM&?RE>7/BK\]\N4<A5X1Y
4SI5fXeNC=^4+\+cOV];3,4Y(&X0WILK4TSX.3H;2OW/VgU+[F1<H9gGWQA9fQ\J
(KgR@cON/BF9+/^/>XCa((Wd=/JV_L81HS0MOdLW0X_J]Tb?J+&[AEE=:c.M.W\P
SK,48_=?^,YJ?<W+MJX4XQX1A6^3(CZD4W3XGE7R[VB=&O3\)W#TUCMfe+Fg0I3F
U[0a<T:Lg[=)cIUF;;EZ2eAE;(Q4AV@\c6L;\E=8L02<3#b<9@Y,U@?-?5g([DVg
/6PfK5E.<W6FBWbO7eLSY_IV9M2CJE16^-UEH_X7VI=RU&M.L:H\8B1+gZMcG8R&
+RBLJ5<@FP),50)&([X&J9De71d7;f5_R7(CM.fQ]L;Y0W[9a6VedcLd^Ag.-FXM
:^K#8dSWSGdZ^b@f#(R?@:R@YG;4aR8KJ^1Q^5\(35\.N,Ma[[^Se<\dUReSOPX<
^SAG1[?e(]a?G,JAT90D/H:P>1b[HD5[BFN_TWg1;H@bfD?#K?->b@[YF2HD,>JL
]C/EUS9L^P[<;c8K\Hg><#K8=BZMf^3=5b1DY>I&3=W3gUKFDZH0UT2ACV9Y?F=U
BVM2Q;\?R@gMK7GC/L0B=.cb+UFC?R.0L<L&L](Q5LIGB@IVD+(GIOF:?9YS01=3
)RWSM&bJZgUPAc6;b1C>UF=+bEG1W9cgA\V<S/5GEJK[)Sg3BO3E9f>\UY,+;F6\
g5L9Ia)54?5GLX0QISZ?0,YLMW_2EBMdH8ZfMKc[8Xb:ZDc?X30J&;M&4S6d)+];
_BV-a]]=4D;E&#;/7ceg\(8T;,.#XC]/J(1;F0@:Y/XeY3LU5A?6(7R47H1\XBbZ
[N@0AbeT<IT;9F>P6g;-,_]^]Z1QgXBPLMb8=A=54L-N/KGY:#ZfHO)8CW63_0Ec
^F[-KA]PB<=^;>[]H--637XA)8^S0?S^OZ/\gC@(?9=^\O,ESPfdN<M2Aa/8R<?#
^JL54E-5\0N;70MA/\24H=6Y?Sc7g];[RDG1bIRSW9FTQ7>TG/[)#)^Uc#4C1_NI
7FKgDMH\(QFO^OU^@P17IS[LI+MDE>c\2>ZBc\\8^#C,Ca6=HXO<4ac&>6Z^)B&9
/[MAa^LL#b=;UHXfGX)\e.IM_c^<))N_JSF3SGWWa=WYf8AC1HRCPU/AQ+Xc^eQ0
AXHIXS#QZgG0bfVIBO3HTO>2XBW;^BRQSbf(X<B5c)(a-RcMOGg:Z;gdP9V[G+(;
?5_+E_1EO[_eKQ(@Pc+O8:&VN<BMaONQeHQe<aFSP[>-4,\[#YFY6_@T)3b;T8>D
AD\I^C@4cJ47(117WRH4g_EM2IgQ&g<:&dfbaPL2OI_[0a(HJYL0a9NA6AP&&M<N
KKO2Ec>^WOEf;JJQKYLN51VHA;Gf@1HHfQL.8ZUL1cOCAT=?D2QXO,I]^#EG;ePN
#C2;4,9e6LLbO+XUSKe.8S]+=f1(AW#N3&6-:d@TI@O91f(Sb^FV7Y6bZPO.\\WB
6ag6#._F9.MC7SM#7(I.<;3Z=T@<6f99AG)<_eTO5H#gGB91&-X(0#=#ES2>/HGQ
fGT1Xca]+T-D1+:,<NO2CXR,M=>bX2b9L&ac>Y<]U:56+CZ9/W@FC<701FA>2EUc
@CM78>:(TBOE8CH.&N(7+]F2>1W9FF/GHF+][eO3835(,(U<B9b>g^Qg\TQOX.F\
OgLT[C9R45X;K?f\S79O>(1J9\Gc3&IeQX-0I\3[)dDF@LE&gfTJ@G-OR;#Y\YeW
Ea8g,DaS_OaZW.>W2VVS62-ACDN#Sf5]f()[+3RFBY[LS,W>=?T(;-S[&g:9fWT?
A#ALQ810]-.cQecgfP)H0(N<QN-<<Y48FOe@I2YA\.EC>YA.)(DM7]?EF+[DSG9:
P;^gS6?G-g;2e0/>+SH0ET=BcO<\gc?aA0+7:]60Z]@ZGacP^-<0N.78)+Qb/;A;
1Z]c9C+bHUM50;^+P5Ug8=Z7>C;Dfe47<c.J[RV;&)P9]_9<gd0HeTMA#6d>XBQ&
20AS@POBTg@;#&d^&PRH+f;D?+R7V>((9d2E>-KVT5=e#>OSc+/@ddPDCW.[N&I7
4<DH2?;C:YX?6+)\&V#51(ILE285BI:e0:B]fO:Q5&,S/@Qf&^>8N6V=D87+2B>e
1RB)A.O\7;5:>A^::=&N#=,K&#;4K+&T.,,<N:.&TZT?2[JfDJ^4-4K\aD5VTF#S
f;BR)+O@VTV(/D/5R<KOW#5UV-@[8ACFJ\1R&+3]_?c^HIK>^(#7X5-_862?f0LS
L:@PM+ZS^_KI7,C][:\U)(=PbeCTWF=5901@507,GR-,3E&4<)/:AIN)1#76DBON
d0U[5BXe<=NDHPP:L;1Z1WD5>c@7L0U-C7GbXYSH#)-WE>K/@e6CGV@LLJJe]M>D
-F\HTU<9C=QcG6WQPdF]<2-Q>06eA(f&T(8X6K4_VND\H(=ZfAgX6+cXgdZZ<B03
.<C7cCYEV)SgVg59/b8<cee4fE^:WaZ+Y=3=8@dJJ8(I</f48\]9]S2Bc/.M[Z[e
]3RJU?g_C:5JL98T0YI4_0@7&Z0=gAB_-3V5PN^-^^[1M_=FPJG&E5c(54D-:ROa
&OCDg(+&(G(>YX2UX\1W1RLQbE?_);D99ODVDf89IPeAOUK3&G@9V6<TBCVY;-3P
+Ec=.f.)1(NI#]Z,Y5[VQ,V.YIb+K4++I,OF6-U9aFZS7>ae6PZ?+^\dOfCUPXDO
DPZ(7Qe,(Z2&4T[^0;9.MR>HfC;4V#c9dXTP0->a90\<^C3g6B-/K1VVgHVS?IV]
D/6a]/<g.I,-:LQAQ8fWMKNM/C.H?#[+b2Bd]3.#Rf;f2L-;M)XR^EOef8>XK#6?
]V#)2AbHS-/EGX_S1\YU1^C<8Z,AO3fZC6=328B5[19G895<#AeGK+6XFGS-9(IO
ADR13=Qaa25)-/,(U+-895:bLJCBDNgff>P:>aJ9L&PeI2&Z5V&=]KM@E86L\Y.A
&-fSUW^\N@XENc]#+g\JS@ZDD.<U-^SP9:1EKL&-<=0NaZ1c2,B5^V<Zca;4K:+,
IKbb>]MU-WA#SLb0WU9P3[E6P9,8d><d7L8LfFLK&_-:D:7/a.[cVTNV(TNWgd)_
-2&P::D9ZV=I)g+ebG9E0Y+)(RBea2[<EM)(Fb\VEGN@ER2KS2^YEMTAU-Z4fc2D
.\JNg;)#Y<4?-?&;bH0K_Z&>\&W/=@EA3.RMA(<a+JON)e[g8I#+b@N(gW=]0aJO
YU72@-[P/,:TMD3]8[U2238S@<fR:A^75FB46Q3^0Y-Z0Vg>^31R/+VZ3D,dT-bI
NbUM2Z3X?f4d2AK-Ie:LY;G=AIGC?fPfHF.)/>D+WRQN(NBR7;B+Zd8FALKeNd,2
#EDNH5D#ZdRMb61^6eOB-/BITbMR+(5U&C2@<GL=WS\\<:FSW>@0X&\NTPcUKFZO
-A<c_E#Q)L9YD<f=&0ESaG+9Yce<Q[/2A[ZJ?/AHX4(33FV9Y9KG5.;FMLb@\3,_
XeA5cA@_SbF+;3e_D@\.\(SS(M].@L?ZJ,YH@+[dL)W=g-I83?E1JX[eE.=-0R?J
LOa.fUKKD:LBS0_;.JOLcTa2VQ#D30Oc2cBQ-.0a<OL/fc[91gb)R6Xe&e5gbW2#
?.ZB(S.?J^6(:Cgc^:=8N6A-G[+cPgId\__HVKWK)-FIWD5+YJD&4V][Qg:B.b^<
9gIF>g9X[MC#H\(/f>OCVN7)g??UX>0?:.eG<a]X,-5B#^TN9b>OTHe6[[_6D&H&
:Oa3gDX4W]1d4LS:09BXOP>1C81_P,OR3.;?0ZA8C)1OG6@;eUe0JSDR4OKG<5_M
].EB9=FffdbE@F^J4(25bSST+^#XGA/I:UCM\gSP0U#NdT;]+4S\+P8Og>Z:U[PX
bA>G&=bc7+0gQ[1PcB2BF0QZGB-4S7dAgILBTF@?X79.EQEL3/H1\+ODOQbeJcD1
JFGL,2gW]d:OJ=YFR-NQ6PBJ1?d.c8(N9MaNWGA4@ZX<:>TaK_9)Ida(X==6c@_Z
1;S@]43=;G<Nd.FNXJ\D]6A0NC7&B:.Ke]NTA2[K<1B@V_9EGaQMF0S+,N_\--:+
7e&eZ?aT,@VDF/X&d<DI4(e<Hg-[TYDXWQE:aHIMO&\F(fSdfX<)(6[)X:9T>W&3
E/58R_6G9XKNfN>g.I^cb4I9fV]:R)U7Y0C=7dHfKgbJ64DI&I1#:2RI9eER[WDO
c>/Sg&JK=C.-+IJEAO=X(P[9(\Lc&BG:^0I@I-MAMO@cT#9GAFP,RXbP?[HZGUb.
(eQeT8H\9RZ6(7a=MYFfK3F]5ISG4Ug8eRPZKL@<J4cPK>GE[gH4^T84S7I)W[;U
;T[2MLGX+5WUAD;:G,V3;(YUPD.]K)be5\&P;R>55P9D[AH)\Oe-[TA=T\(\]4cR
[@O4C?=-N\Qd:##cW(P@@K3B>Y=RT8:ZL_DQOJV6)X>/#E<@(41.f6^P@-38N(U)
TJA7W5c&e;@MVI.WcVU@FQW<AL(7<aU-Tg7_V(.@0c5N\7@f+:b/Ag8,e#3eg[:B
aK1GQf5QD,,8VC#c_@aX;E4V(fa@BFA)0,dHIeQ_11,D>^[.N=2C^X-J;2g;4bba
O6.W(?E2K1W1:7f+K40deR?6B3W2a-_=^HY2>@JG/]1QQ(S+=JRIW39RGU);.&5_
8\=^_(A+.c?gL5?=Z=cG@)L?_Y.(><A12gF[Y3N@NV6&5D[J&RFe9?5F9;I_<6bS
(;ZQ&S>EgO.EXBDJ9c4(NPJ:WGKQO)J17D3W=ec?YGDN^8V0.-GY3J\:<\SW=O@1
/fH)aD^]@^GfHe]ECfQ?EIKA7O/&27M+-M+<SY+;/L,=);/H))^&Z3]GG/793P_\
d_C@@(;TL:D^M:)<;-4?]TSNO>_f]Z7P\VA_:.S4f0)bdV2+U=3O2=@X0Ce-@Z_:
?.BLQWELPEK\9/8L5#\G=U&c@KUP-1?Zd(>09-N4\J21GO#TQV7NeZ.S9g;Xde=e
JFEO33NMY_?:7UMFbA=9e-\PB[e1Q^;N=.G/]cJ(Q0GP/<?.WC4FQ5(=G6,-8R#E
Q[[_50^8Q+/dC.04,EV@eR;EZ_)?b/&]bW#H?[cYae.Q8Q,&Bee-O@>NMcc\Bb@<
/7OX3H.cO/AJ2I#<82.[(;gaF60L:FOE.+8L/eTRB0+U[M7GFSIKXa-/e_L(@@JE
8VSEPV107X(Z)#[;,V<]e)a)&8SG#_gN8/EJGegbK)29YG,/McaHT@+<VWRW96Y^
+/7L@?0cec3Ff>T_Xa_0Q,)0_BRSO(GW^M+A3eeB6_(/]+HTLaXf4RH?AJ\e-.;b
MNb3(b,Q1;50K8PBbP^b/<P8gBVXCF3aPH>+@C>2J:\M&>BN63EGF1(]9SC/&5C.
G>R,bM8X;4fK\1&>e^#N:&=2W0UBeIZ8+X6SO0+QGaXE8#TQUFVH7N;WQ@WGRBKS
:T&NQ#d2M1B#&I:GfcP>Qf3OX,W7X)&4[&FXH.@HH?5DNU+NQA0[K]27XHF>a73-
&=RZR3?1aQSF2fdA#OURJ/.g:HJ,_DH=5@?FM-GK5Q\2)a/MS^I631W/E@8V]DAL
<M]5X5_-b4CEJ=_#[5.1\UO^.Q4H]LPC8BI6JG0E6O4J7?UQ0-EKHGT<)+>2ABg)
B6<W_d,(X&U),g(UN-6KD,@_CP,V/Q]\8@NY;#&^WUU2S>N;-N0S0=SgV3&.7c>d
1:XOGb&_Y]/SfH^RdZS.dd7.GC-QE:c)#A=<,EWXGeG7Oa^H/R@&Z&CH>S=HOF/5
@-fe^fZFAG-FT-9XX)]E3bF/^ORNc)\WEVf,?GOBQ<6]D.c^-A&YKP688&[_6NV3
?0DU6c9AK<G;d<\9Y(<T7bYL<:PF&.KgF.ZVI\6WGFK9X);Q=gBR/1K5(D5fQ-15
+;ZPSZb[U@HOTE.O>:.J5S^U=EOURCeT3CVZ3eBEBW,QTDd\I>#.Z<eAW_e[<_]\
BPd??O1gXcDCNa6E>8ObWY<9>7IaFSV1KKJL+1I8MHd@<AQgERBH0B#5R-RcVg)1
1Se[Y)?7XSA83bef(c=_b+Ma<Z=:F+gUX4BS14Z_:O5b<YXb_cVbP<0#?T81ZD,9
EDdP_@;R3/Q[YHWd=#-f5G-UT=P.J,8^#4V3VXJR<@RH96B.C&f?f.T\+KJ=)_2-
E/Z-<6eB.,.B#-YF?,VMK5BWHBd&c3=eM6DG]A5_Z6I5=XfG^>)_0^8O[I1Ob]H8
aYZ@J#S+#)<IH6.GKSTf6EY<HB]P&:4C0#..M3L>010DN3gD3B0<fA\@KK55\D8E
2A4>+([K[F[5a,d?+GUTNTI#dgX.48A608Vc#7?4=;]:c<E;70LAc0cTY7d;/RD+
4)(CQGQYBB/bW?U?33W,;K^TfR8,=O:T_Z.[(I69@-K6d;7,BJIZcK+3C@Y=Q1RB
JSaAVO+_:L-X(7<a77a1#LGSB_JU29-;UFVENXOVA3Peg7F14M7XJ&SA(T\Q.>#]
AC#D?G023[bXWR3Y3^(0M._;F/,1-Af]@DdHJ2PKZW7HZ)7(baEWC[;-fc^Ae]Rb
aLQZ;/LA8A?V5gCc725.S\UP;<bP+8W,6bXGgS6K(4I<0GMSRa,+R5(2(^VDMd28
R<W9fW8_?)L-/QVK<YTA_8ZZMH-PFUE_A7[ZFdKGYD(dXa>6C]/XPM,A6[\fXVcD
\e:7D:+TT11-dR3QW?95=ES<<^[ae-Oc[&=M1XO,4bG_d#1^g[\EE>VE^5#]98Qb
0A3#MM+6<YR=XfMQ1@cdZeZQ^.@BE>53AJ@X.08?4?aScgDUT[eLAN(^Q@6S)cYZ
f7185NO-^+6W\aOO\fUR:@DC^3P?1b9:LIIB=<MM#-O>#7PSBd2?8YB)IU4daE0K
=/PW6?Yd6\I2]32K.:UG4ZL^(c5b4Md@3\PYGdAW],D-:8QV72#TQI7?X39NBa(c
E4b>^3U97DR&0C@HU(5200#]6O0+Yg72#_P.MgZSf-CUL50>a;=_&IAOgBON,44f
cX5493D;d#[_8d[>=U]EI-/7[aa[18Y2,-K?-]F8=N\MPU^DE8]^)-_0dg/W&)/3
<-89:AGVbYWf&TXb-KFL8C]?9g03,a0&[M5Q3_#b+PGA=B>]N;-TE-FI@@I\J&b:
X/f:#5+?1]/CBXP-bADOLSYUW]WQGdOEI=39@3RZHd_?Q)H^79f)L?\PgZ/&8T9]
4c4@]9XUSMG3L>A9G4:NJSc]=.<Uf>[X[K89[7V\(/-OTUJIL6:/\.,>fA_1)aQ9
fGL7FONQ6c=Jc&#^M==0(>S;&f;c0GJ8_;^]eMJ;QacDOX+b4?:7=9(;\QL6:U;a
)^?ONGZcDC(Gb(fe,,#C1#b69gSO.K4NTfE4FT41:b_3D_A&Y::<)N)RBC;<SC9N
Te3E^aOJ;U+)B2W^8NN]P7EI5fJV<W)UP5FbgdXJ3UW4fd\?E6;?]BXI@[7OaG?L
deeL[+/TS()ffY/<0YGRXY:6A,6;1dXDRM=f>LNMeS[A+LWf9RE[)O[fVT@UdR(,
?>=+cgKVJ><P;2L33W0AC/YFP>GZ+D+ZZF;7A;ITg3/GC0SRP0F[8O_6Hb3&c-H1
&U@+VJ@G(;;gX\TLKU@R_bEOWIW,>[R(Y+_6:0#BAa74^7(4:7?J9c0IH)K4g^09
@ddJ^gL&\J[UG?46PA79K?d-F;c.G(+[:d#RAZ1F]/M0d92:GceRA8MUe6^QeGS]
>9Q72E8_G1##&:e+aJf(T_,\J2YW&^)\P[K1;0-K5e15KZ\9fRO..#IF:^:M^D9X
?EgDZ/L3/Sd=c,7(6KP>)5S>fgSgENa[-a_EM/:<^+?dHYY/G@TcWW=:.PX\F2NJ
D7WM+@3Y8)&1/?).cALFM&U,(;X&M\=FPTIIcCgO41WW<fO)R_e#R&c)fYS[XHU<
LBdOH2<1=W(^5N+\_d,I+:WI0aV4=c1[^KaA=VSDM8#.PWJD8>@adg-RN\5eG&][
T-fc@KSNHV&+bHBDdbT&N(6T(W6A?1(ffYcR8GFPUSGPS3dP3EKaHW-:H);,f[Wg
XNe_/-/ZO#M5-21/RZC_>9fNC_/=R41bCb_UbO//eWG[ISZW_K<N7.?+,gJBSc>J
X6DD;::LT(c22Ze2E4N94Ha^Ea0,W=R0X)Ue3BF5=BZAH?P<W.@:>FN6bdZ=\7#G
#2TV)^;^@aPe@.ME+CII]]WcX1G)?KT.2]1?S67=)W9;A(SOKS/c7@c_T8C)CN5R
ON?#=(<-+d-_d:@C@7f<XLb]Y[\KK>/.TY@=_LZ(F:LD:7-Q)-\M9Vd=W_#S1da]
)YK+94]]^/WG;SFfXI]>(;-;Y@]gA(K__XfA6EZe;QcSfKMS/)L,-99T4[TE-K96
:(I;#.9TC^>M\-RE-RB(f87A-[L.f8KW6LZ5G3>P3\GCRI;.473VP.?4FK4[P?e[
8=;g#<RCASc:]4(]]@__T22&T<4fGCEaR)/g]2>g1ER16FW,[0^OYA6<N8@V+]7&
?X>eK:&W9YFbE/K.X4MY5f@g97I-KW3N]fJ,[MfP_b]/B\OLYO)G82cE884/VIAU
b(AYfbG9L)YLHBGPV:0QXg9N:d?C]8(=<4PP>[0<VR.NU^\NIU+#8B,O+_C4(<BS
^0X:Q.DWT<W+f?:\F,^;=KIE>4/1C<,/IQ\6JGIO=20-PH.RZ2+A,VG&)KL8cT0+
,HKXRAJ/@J#IIN<9S+R:FF.6M3g>d.73O@8./e><1De5KPV0W_EJ-1<@)Ef6LCM6
:,QH,#R]a85)6U-D#WCR)P#d&F-G,-SQf6Y]B+Eee&Pf=;@\Z27FgE?RLW;#P#TU
7B_N<,G=e/BP[I4e[7a_Z;GI62M:<7a5YQae<@g3BYZWcVZdc#gg+g=QJ3B?f_:\
Y7:++3_:e9/>#/Bb-0S^AW3C5JY@9cZg,W+UL7,P3EI)IVI&Z5bYY7@V71GR0I>D
B\W\O6?\+CdS:UDH[C0RM\EC,Z.L+MJ<.F-F6Gc24EO,E+6b?.T7672.gT;.6K#3
44)T#[BOCN8^Qa3fa,fgZ8S\RC]b/3].LK_<U/V&ZGE1)B+<=JbN;J<-L6a<I6-Y
HJ])&C9d>b6-O=R5@JY)3I>J&Y3U-D5]L5ZM(aW1P6a+73_1SO^N:664&aU.4[Wc
g6ZD8d7W1NATE704P_-Mb/gBUNW9N^0H9>:da&\f7Wfb+6[J,KIQ./g745424>\f
GSFY.ML^N;&Le96,N033/B^Rb\g>bYKL/?#K@?I,5?1Af#bO@^MP>V;(DP_>J+_U
:#-aDQ;&&WSATT14.^,dHf)H0ZX]Z0&\NbCgdX,:7JaSE&\JL]9HO]LQ3-B(VLW0
82)O;>g^.LQI=Md,:1c=I28DJBO2dKeO99b7?b(W&@#8fUU@UF>ceA43I&2-\X+;
TW#afTb:ZD-&YBSTBM+SBc=#4fbHT7X).3XA8PO5]c-&OTd^H9,HH7f]FFK_UV1E
[>?UO?K9##[)ZJC_g5K?H\,I(B^+Z@gIcMT04[W,W29RJTAd2aAWW0VN#7A[<Z61
2867+9N(?XBKRG@=Z[HB2g3B5bFE9J@R<cD_0VJ:T?O.]39[YZLbJdB?-)+FQ&Wb
7#)@=_)G]<&032.DeJ8bCOC;a;K651(S8&?7+/E\.?[gG\.-55AFJIA3;H7.Lee2
(G_2AR8dG[#b,8Y/-SN.,32Og8+BgKYdS,BR;LT1Y<N(_9YM7P=/0\9&P,E<ePQ\
AG.G>3gLCXRdQ.S[JN(2US)A]U6J&dS5#5Z/<b?#X@]VAc:BVUADT>3\95UNf8aN
]YA68M0Y.]0#bDG:)?)TU_f])U[g6e?N=$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_W25Q_AC_CONFIGURATION_SV
