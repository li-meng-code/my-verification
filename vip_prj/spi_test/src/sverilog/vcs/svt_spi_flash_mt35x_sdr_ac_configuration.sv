
`ifndef GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT35X device family in SDR mode.
 */
class svt_spi_flash_mt35x_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_OCTAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_4byte_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_4byte_Fast_Read_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal IO command 
   */ 
  real tCH_4byte_Fast_Read_OCTAL_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt35x_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt35x_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt35x_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt35x_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt35x_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt35x_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt35x_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
BB-,83^>(QV->gOQRJ9B2LV5e4)?.J-Xb?B6K-+(Y\5fW2,1R40)5)G/a7)@XPM.
AK-4b52_KF\;X9^N3D<),\WS&Kc?:@8UH?Lf/^TRRc9V,[&\1;P40FHUg1E(5]5)
??OCcPOJ:-9S>N.e<L/4Vbb[8D=K64,H4S2(dG5#K3cD9;#92HS_eC:L-TegM<K_
23?J=)C68<]=X+ZO.G3KPC&;;3aNf8KT]caL10A2C-Bfb(A/Y5V?#QL0/-ON1(<9
,@ecA41LYLCZBdRS6ZA_;#7#9Ha+b@/36.VaP75<Q]-c3W2PbJCT_40A1.?7:5.[
g0ePPXg:HAB)XM-5\;]M5M1)OG(N1eDBd7I;,9fJ5OId+&;IfB667>eO8HA/EDaf
Pc:_G=&1]DX]^D@_cdf,?DFQ&DEcL]RgAQSGe60A4NRbQ6#O[<X\&c,J3ga91G;C
D>S08&,dVT]RGE[V7Jb3=?7LNZJBOKP+fN@^Pd9d<UAZQE1+Vga+:C_8S_.Zg9Yc
XL;^6[)FO9[Z=7P74:b8UELf^e>?R=(Ddd5F@[&UB4=PKP5JP\Z<@8(WM2J_,BD,
B7)77/#+\PFABBN3d,?:>6O#9)PGE<eRDS@Y.)f+N[ce,e-P.?A#dY=.7[FOJ=H3
A&^HZZ]cS8T-9:4Oge7#^g8&JJ/:9/WLRLB9-7II43V,PZdEg:FT_;\M2c_KXf;K
?MMERad#cJ-6/;&WVa;B\ebR=^W8DWCLPWAAI>C,@V2J[WM<^;N2Y>DW2@[b0WI7
@E)becac#L&8^+XDW,E?,YbR5$
`endprotected


//vcs_vip_protect
`protected
Bd\Ng(H;d:2MN1UOf1I4?-e88VGY<6,8P=:9^Tb\:YRVHU(cTT6E((g336/S7A4O
M9XAg#9XD(SCK8MYQ,O\Mc\9HbSC/MJdc^8\FBU&B]V+1]\U:51^\8Ab-4(>5-^f
f:DfGT=PZ?HM2>\V>8JD>5YA(]OTO+;(VSNI_(C)7(NbADd>.[c=8T&2288aJ.8:
g4]Q@GM8:I?H:2LUW4bO84^^^gZ3cHUACN/b5W&0<.V?(OTZ26.d+,4#IX\JM3<6
DG<S&2B+@D1;gOc)0&,RU6V[XTOY,D6#fY,@O]Be,Y\,_Of,OA5BI@M<98<2-1(Z
64H>QGQRC1acaaV8^\>F-F_#D<]H<>dWC3XKe],IHCFO>;EWH/;DT=<ZVB-G@NW6
#61_-CSVAM)^@=.)<fBZ8U&W:5(1BG?&5@S79Md/=d=LS6+RFXP-&159fXS:K9=Q
IP?C/Bd:7\^e-O>eIM)]fb&H5G4O@98<1ZHJ^CHN_HEc5T7&,_cfQe2;&4E=[[AB
;6;@HAB(6K>@d7DWS\RLfQCL<FX\-aAJ1[fMMP3B6f-cU>0S@M/JSa@(X4PHH3]A
f>(+#dT-ZNH/PQPKDd?8I?_IVS>.Z@U3I]_YX9S#@RUUA)<+LOcLP;SUcc5K0A-)
:3aU(-91(RDVH.XU7G;LPVg-U,5T+TPS,2=SLHT>LFYbLBBU5]S_PP=1g^3#.2UN
>J+7J4L<7ebSIQbDV=5b9L,Fc7?ASE;(^Z;U+c6CT-<V=96afZ3-@=?&2KP#1)I]
EHJ3(b./]VNZ3\9W0,B1NF]FW@9+G0LW@aR1VDO^UM:IO_K>d7+O]8WLV;)7cEb2
WR#7.GaeHQ3gD(C<K7U7.GD6,=&-2GF14.Vg;@gRWYIQ=IFM^>)93;bJT;1_FRb6
Da>QP#(,Q3YGfS7PXf.;7Y)949Wd497GNZ=E.3;T=.656\K<A5T2WOTA3?,T8@fC
5.@D_eN[>cJ<+N1,Q@JcY:DSYa(#S&/B(<a<d-1X[gS+D-&R_bU>DKg(T3K<-?\D
-X.;MD=e^_J<C]9>J>52FfdDY0)f^CcEIJ9FHfb.S).@UWP#fHCbLeB?PbCYBXd>
G<HcdDWFU/eaZaJ[Ma5.TBP.IV_67&Wgf<<#@T03aGHHY&]FcLa?(U.FEK=gb4b/
(6<;c2<BdX0)F[I9M&.E(Q33A4bcHHGJHW11?-df#d:7]0Qf?=X@=Y:;gB=89M#5
]:\0g7[bH7@C3_gJ[7M0dH8+FGM)+cX.[@.NAF5I-]V=Y9M[:HdJgCeW;d?J/>Q/
(5\Y1QV5TPR>e&NCC<1WgY:W>/X>+#f1<BI50gHe7^Yd7F2Jg-VHF7JI0J.W29)-
MUb:G[e\-X5ac(aU31d70J4A(gMHY<R<IfC:/I&aGO6cOT^_;I5A+cLUEC/Wb10)
X4Tg>94.g\8DaI8O52NKGc,YC&C91?H3L/JT+MNgZ.&UKdV=gB.Le^X.ET,dPBEE
GeAL.#C<A/J#bMC>&eS;5OX,g>?SGIG);3XT4@5/70:0G6))ddO\GG]\cUDgU(K)
DP.49@F<AN?QXI)&BSPccE22Q^fSVDBHOD+.4J#TZJRTQC,ROO7IX9ST]#Z6X.MD
G=8NgJKd7(1LC-9A:W1U[c\@6V?U=ZT)5L+d9^@8dPbX41Xdc;M,4+[#a,;g:;S?
V;@Z#VC9K\7:AMAe?L86OJ?;0IXV4K&(L/GN.-FP,5R=4<,\O^&ZC6bb9:RaL8?C
gW/D;=Vd,RFA9^P-DGaH\G6<E+^(X761TWTdY&KEU87,@J;.P<D(\N(T5cF<eR>X
YfHP5N>d=V2_[\EMX,Z:dA\@)-2>Oe3]QN<3aHK[T_5fS=Xa><9>CbgaWAeX;/1N
LZ,gP4T2=?\/P<;2;M7I8,fLBM0b#bI][d<L(-?3A3e=94&(5QDec9_LMa&,:#ca
?&WfSf0bQFM[U1]=>.gH^QCDK]5T=<b/f1NK82(E)6X_MIPL<G>5#42UH8QQ-g>U
;GVQ>f@IC,GJL_+Lf]7]Uf[5cNWWQWMg#cW#D(:Q?KB]_YB-91aAPf:A^^/&&gBV
FUBJ>2T^Q/U.S0XO,)Z@9,6P__K;G]B&-6GO[&DO6@8bSdD-8&8FJ:1@M)1?9EgU
2M2GgD>@e)G\.(@LDI+8K5@,T@/LI,GQIP>:<Zf,TdO\-@cPO8S/>K9<MT,KTVYC
,N3K9U+,(79+NMUO;4KD/TT;KKRJ@&JHJ^JS+V(,0J;MZFBe+Z=2;a.H(gbBX/&9
VY#ZIUadgD,(LU:ZV>.P+cWR_4H5M1UX)OF:_J?2>.b)_a)_5:VP-5dFD:.JE-0B
PTTXLc@If.I;.AgdCY9I>d]D&-fH03QM+;)f+f0?:2XLKI3FK>B8RM0?aDOfNc_)
G](Oa(.R;69U:1,cFS,Jg9H.WJ+fDMTB9fZA6G:6aZcB9)_U#9CFW?LW<eYe-\/J
Y82SD7g?]Ze8VZY\1;3)Zb?#]?;@5LX&LFD7230N2VK)&;@4=geO-2YK>1+<>TT;
@;<[[eK,#RU/QUb_EH+279L&?0@NVMKd-GPWL9#8K;Y:/WKT.a>RAgaA0ce7;1@:
[\aRc\EI@+bY6d5?8M(ZdE16c33\./P#?>:+6(/e;P=J3AT/b]5W?g[AaM:Jc95P
g&;49?6.L.176E&I32(7L<<AN]HU>56SB=?^P2NAJ2@EHOC-GgPVPDHg9K)dE5g2
dDaG)K^C:[;U(MLT,]/U&=PKfSC]aLJB;EYWG8S[B4GR^?SLTET5cPgb7]N[6CB4
GIe2de;c5aN-:XCFN#MR#1W9I8gM=V,fC/8N?F^H;7F)8F3=O-Xg8bL0L(HA>0TG
(bgMF21=C=85:<\/\_GVY57+<DL;C#4BOHI.8[>P7<[R1N4fRRB(&#47dTH[.db&
3ALWN5RgEE+U[6A>ZM\W(/CPe/2b.IOb])KEBXZ)WAe1f2<3#TWLXL4#9&f_..ZD
;37(^CJ:-cLFDU:/FZ)Nb;<[YVd#=[LfLF;<63NdSQ6ULS5b.Ee7FA;GM@5#.LV[
,[I3YAZ4EF0:LSES&,AG6\C,aE&(bfK7f:\eM@]Ea.:^L]:HW_\(\JbUZS,<P@AZ
N/Q++]K-Rc5DY>dN/62QAa+1R/F#RRG]_D[gX,G/Y^LL5@1WafKPg<D[8\e^72V5
\+NCM;0?MZWPD2e5;S3Q-[eF4ddLBQC6\&K[A>Y5_LC:<@TQ@-<&H@/-)f4)V1ae
53=Q@aJ8KIM#H)]SC1I0V_V]19I#FT3\DHBB;DRd5JIeVR6=8:VS(e64BQX1RMRe
0#;MU:^R#)QDAH(G;8S:@Zdac5S4/f7RXD;8MA,IO1a2HMFFaCa_,.-48;ZeT3OW
S2N5a7=BD20TcDX=8PA#7H:3EKL<ZD_f:R=5]+;\f3MNBL]4M-cIKfCQO9:M2EZN
CHKU_W=B+X;6+A1dP_Yce[Y#:5@e[K&^@H#I)VJ,/AVE[W><fTHLRZWBVYe:G:U;
IfUaVA5Pc\)gVQ@/U4P,8Y5<-a@M(FaRLe)#>4@<.Ib\b1M4U>;&gZE;gV,C\YI-
#RRcZRBUF@Fd##+=dNAd&@?)=^VH<4O&f1_I2RME\DNH#dg\AV(]bP(4_KOaR1?D
(ZH]&ceJ^&G1c9.UV_3-\G0WWX472bPCKWO&cX,2:g\4Y,J^g7:[20<1<ZZ/2&+-
.,f-SF/SLI0Ig9&NBOQA@H#aKRHTQ7?=71G<@6B-J<\&U2:S[>b55^fC6:e9,2XN
8PZI5CZY?XC#QB5BaF8;IbM@Z#P5]CfGcRZ,1LDC^5A3V,(L.E;,1E7@Cc9G,+20
1-]Y1f+aT+f^G,VOOaf,eE7X89CXMVMWY#_#.LSbf\gg^=74,-0WI8WX#:UI3:J3
;TTEVE(Z@70BDL9-f3J[/Kf^a?#2]#c4O8=]QE,DBdL87H(53D/,(PLVV8LZeV@V
C:CDPR&8\[R5D/NR?6OGYeT35S#+JB-VdeP[XJQPSH0,/AIfTa91FaF1g1YRNVV@
NSY3GQB<HW<VA?cX6(^EdFP5<?_PX&WT/T,6+D=UH1N67/.7JK?PG5#a>QP<H8L9
1b_24]:F#,_e=J.ZL)VU)VUcXgIb,\O[&>3OEI]Mf==HLEF6S&Yc-E1H_I5]CPJ;
^>_?M9JYZ,9P3c0<0a4O1V,3aU-IA^P--L@FJ=E0FVEIF&=V[>M-=.X0+3\4:=46
_YBa(J:G2^Y#f7/U3[_TNDS(@6_8fL;e94MS3M.Q+N28F-7I5=6PK0ScP+(K]<>g
>^CY=9dN99SPbK/I)a4a;Y](fLWd5E53.c7K@J;M51AXfOUd2B9:293R^1a-T<LH
TfX9Q#CVgU54[A&FOC/BYEgC[Z-J):&J9=WM#.[TXDFC0;,8IY,4\>NVg:]J,)A>
>OF;.VRH_>[[&\cDAIBX:@UU4RXHY/K+gF@U,RWES9)7&G)<2]g1FHPT_C-:--ad
d;^OSRZQFX5[;eLH5gcSb1b0g4AbHJXOJ6;AU.V9N4.F(bRTP(PZ/gEML@9;NXU#
YcfCFf&4E:<7U,MXN,)1&?76abegQXC5IHK)[DVYTB-4V,cH?#&<f^^4?XRLcKSf
g0<Ue3@O.SSXL9.L)SOT8[D0W(N#+Od/.VO@<(K)C7M/7:3PFKfW6DH8_b_2T,aC
RB3bY98OO#[P5fG?,P65L&I:-g(:TOIReF_A=F/)NDY8,1:8T(R.eSWD_g07&f<2
3&_g)J@LWO#F1(B2\14P.I9BEb<_:\b:==+:3D>:BZ[aGO8Z+BH3(F+U)GU3)?5+
Me0]FAC]7;Kf2KV=P;JB(0+>8+ANMQ-&2</?5UacIN<ScKca_\D,VMRdAM>b#B5;
(_D)0ba:570AUaP\Xa)[a?bY[P46dL:4&T?#=V+&R&=b4RW4P]-f?;\=Qg?_eTBA
LUK(,fVY-,gS&[&[J#6;-X5WcQJ_Z4LC2&@+V;8(05\A5GPZJ3,>]3MUL+^c:U.A
X_CXHV_XbD#P1BR>G9^=1QCVSYLUARFgOY#MaM>2O<DT#(L<FNT5R^Q;)G=1.TPJ
46f1)cX<_[J)>&#F;JO^Z)&(;\+Y8HRJ7IFO,WZZG285/]eVF=_D7<(>ZSN<]4<5
=V)J1A_]LPf9</;)Ae1Z>;d&F)]IWW,O=c)8cVK<\e6=/(<7=W_)OCGE<7g6RA;E
88&Q@RbEa;:9=0]gCgZS2XKc-30cTX(c?1#;.X[-C>H.>U>,[O1H8QSI)_&>X;Kb
<R2>EB;+5e2Kc1cVK^6&Ne@I69AdNZMDL?^_C1c,1ecb8HeE1WX/e^X(2;A^=N:>
fMEE,V#P9\c51a]0?+.f>M>.#788-&UVZ.Q<#0-X1J\d:ZYVQ<=D]S=O@THKD6O;
[_J&Ad2M/ZbD2+;)51@e(>]]J0CGN=HJXAIJ^4C[RE.8gP3eF.1dA8>^/a/V<.0(
.5#fXZ+.M3>:0.Z),R5CX.XG\;J#:R8><LTb4Y4[,80#:,&EPAC;b>^aY5/9[N89
P.^XCG?1=UI.fY^eGHM76YL7QaDCW@+PLW&T);T.)BXC(BbfOI=,25bLW_g01F-J
[HaaHV+G#Z<+1L181BD\1G?W(P4[S2&Da=2=E\F;6W)I7ZK0Q7K2R8M0MTDY6:f&
M<aDe>M\J[1<_S+1@S<5MT<3W73(bb8H=&3M2W^/V&HQI^3cG<2g?G<G=GVV>O))
TGT[Y0CN6@7D74&CZNB]EScDEN+\_]BSMZA?^:X3P@#^H^X\L]381UaKf\Kb^35X
&CU,1ZN7;0+I/ZN_bVXAG]VRNa+:K5B]_9J],IIMY)5@?XY0A95d]ISc:YBaW)\g
R=g0PND37cX9f_R&62>OST5\8dW:-KBQH(1bbfRS<Na[F(0/N0.Q[2\6VWg<ZcEQ
TRfdc-Z#cb)O_S3H(5).T-\\]<[;79YC\=e<JD=b\_IV63:UIR-;c;E4_0[9\HN@
H>9cV)@6J\W=JB8R?c#YeA46](b7Eg^=7/=OALdQ</,6CK,)Z>S80?)S>VPM[NG6
YX7bI2-FLXd6H,;(L241:SFAG-L)>gC?91BW2:V08\.M>JQ2,7](/@22;&8;\AT6
W4Z1)(GKJ-S)RQGcT_VU7[9+,9<a_O>D;\>XTBE\EDZe_,dcJ(:Va_D@C[g-ZNOg
P?3BOWZ?d\GGW9HW.5e,3dOLG6\IF_QR/0HX_9O_I\POYLG[.CMK^^N1DK:U^&#;
K@0<SP4OH-H4fa_@2\D#7JdX,1@XFNfNZ[#_]?X]BZDc.JZ((VG0b&T4Wg8YY9N2
MCW#6?)[C[a/=V\=6L&4RG<J8aV9egIgN&N2_Te][Yc7d:FZ#eG_95Wec9].6>A)
>_e9IgJ)>;fD#WeEUS46PQG(:O)g?,3UK3EO_#c>SNKc2S9Z9M[1\2&ET6&1g6SH
;-.dYX5f(,DH9X0USY3dYM;?A9U.]:5F^B39\U1Z3&IOMOgZ20WKE)BCZ])=PO4\
NU4BA5bdD?9DIU^REf4^aM,Gf950&7^JE.<BRU\TSOO5RLTRZ1#AbKX)f,_C/ed:
I]TW5??:-YL5HRE;53cb4;TOT=dgF+MP<Qb>1C/^5Q&L^g,6FY][-a(d>/G+Oeeb
EEV#<-4,d0]f=Sfe5f&DQaM8.TWD[Nf@Q1CITNF1-WD2^9(@(4UBeQIZ(7Z,XMZO
c(=cD=(g].N\/A<bPH9[H-98[#>55&0=G]BId+b>>=3P7Y4,F:b5:GbWU(PQ[T1E
-f?+I:b=<DU?Q)&bO@]F_4-9Z38^H;WA4;AB?AP<\;CLcS0_B]C.=L<H=6QNY4[O
T:=Z>@c[8g#-_30^c:]EFg#McRS/aJY;OVQg;9F.U/F9HPTc\4=9f01_GQ+\0f<J
O,Gd/2Q1T?8F,/),<R\R:G=+cM<gO1CHeP:X@2eH4<bEc4-_\2HO3P?YIB)AC])R
J(S00685R8)1NE,d2PXOTNM&g-LNYIMOMK\3WU:Z6.89G:IZLIK;=+d&0<0Fa2;,
4<@GgRO9eK3BW]KVBM\89]e5,OLMDVB_>S@3a@CgegO7_L_SR,aCDYSY^RS>+f93
M]2MPXg:]]FZL8Eg2g97Y6]DZY[EVPaD8cH:IBQ/YLO9BM?D/1U;(4O.FR+&P\DA
EKK(+\]d\M;<CC:K6Q_P6gYdBe5f2>X#M7_b8X]B&/a=FZCCY6BA:LW^)3-VD@_8
5J-S0Z0CCO+CTZY0P^T@#-3MHUS1H;@^8FOU?MZ\BGS(D@MfS4TH[F3?O#4SHQK0
K)..;KeL)X0cFJKLU2=6?].#/0W>CGT?QT)(OW_K)LJd^BCV>?MWNN1E6;F#fGbf
?ggHgM@E=^<\M]RP@<D=Ja_Ne1+_FQS-TA15-.FY21=^HF6b,V,3c2B/cAd+Y6gW
F3Q]MCYdY0^33(9OURW1^;BgIbLS=DZa)/e@O@A7Re-a15RD+29Tc_;C@O(XJLG#
g].ZWJ.K8^<TH>^e7\EGT<2WD6T^81We_^+:>c##=TK@5]OL[[VCR]HP7)6@0P+K
6X>JJ^<)UXd:QB9Ia=bD:@HD1LK@FX.>Y&\:A&KWH^0@&[J+E).88;&7+H6O0B)F
)Mf@V4CGVO4Xa8\SQK.a-U65N0]1>I5a,ID^@T_WRP=KMW<?DBU:;TU0Y]3SL8c6
0=.)GV]Q1Ue-U]&0<\T_22dO9W5F]6DD7Ae]XZ_F>XN=RD6ZD]WKRJb@/VVR3.A=
c58^:DBe;BF8LG#]^.edCGW)LO62242;75W)EGHNYM@3J@f;@(DU@7VPQG9Y8+UB
02?,>V(f]EdEI:/QecMYR=X#/9[F]S1V5@=J:;7:S:B\gG1?7[95ee:NZ>A<[=IK
@8]J_D6?.I&_3b9ZL2X)LZ@^_B@a47&W(dA)/<W?67fg>>6(&2?=5c/gC>20@0+c
1EcAH+[F,SAT,2<#;dY?&<\5\[A];J=J>8F#PLP_)Z-<+0W>a5_0H_Hf#>a.H:0G
LSJf/#^bK,H_GG4RM83a<S@@#H@2B^8UV479&d)@_fc#gKY3/F[.\[E/5&f<;VZ<
)7G-@97=4-c9fOX@QYTg&b,):9Y#JV:Z9,[U-I7ISJ)G\F?@H7+7)XU+a;ECD<<)
K51F.1[,S+EdP_GJUS/@e4NNc.FRd@66A1-\@A4()0=S_1-Jb;_&eQcW[,(3e;D<
eASP[]_PI))DNScFW93C+ANTGW6&PO@,+0S>(FdW)#K.X)E^Y(D?<#AR,SS<K@Y/
d-Z.P1Gf^93E25TOBf]&49b?Q=J2J[gf,cT<P=9T>cX:_9O#9;>MU@\-\cJPc,)B
J.A\)37G;;KTSZgJ\H/0@I\)J<K2Z&KCM29eX&;.^_\&YU&Vf+C[aN+4CV^;7(2b
;b3;U?RA?OdF2\T@VU4\b]:OOA/a3f1V+9R?a<&V=#VNA5Q]+3Vc,I6KZQR,HG+,
@9;],@)3KHO&Q\N3VIQH2c=79OI^C4VCMDe>2LUO,?5SL6Nf/=[;gQ.&P<G]D_Sd
M\fO>WLcB]V[f6,QM:d8]Z>dTEMY[<a=@&Wfg,S4,A6T;1/<<fUJ88[f>H00&B3/
<A0(NLKEY.#ed>[ILaLba].))F5fbI2^L&c7FH_f1&O0<E;_O8]CIE)dg:[42VJR
JS>W-d>Q;/Y,O/eJ,Vf8W2.5-&fgE<==SD^gY0R&>\V+NdQ/VTf7:#S_IcT+Z<Yg
G-5dc]I4bL1\08N=7YC4e3C4J3[&,^[b6YRaFY1cg:Z<MQg#&\e.ZQVE-\eZg(;0
NW9Lb?MWCP,Y0e0<^8g4gQ7&@3,D6Ve->g6[=>HJSD3ggGA3K=d4_3]Yb(3:]B&(
_2/]MKD-d:+)@f^ZTZNN,\6bZPOZX1[a6F(g&3A#(TK,F=O&Z45,=fG)#eH)Xd:-
a1[]5V+GG4+Yc\[^Uc-a2fcH[I<4A57597HSRE7#3Ac:=)19YV0[^;8]MOX)M[]W
bQ/?Q>,V^PL(PBcGCe^cA8#7ZW77G4f/4+5S<-\F<5B[XC//(/08YR:C4HI65\,D
HHcV3/g8]DbW-[gce,bGW)@N@:2\FQB791-6?PI1L<T[/?EEOF5_F-O;7T<E(&Ra
[fOB#J)1DPDFDON^8:M\A)ZZM2Wb3]0QAc6LY10L4EMO?fCQ,MSeMD@)Hc-H<ZMB
^HD^6CNKFX?X?OQA,Na,PW2,PTBS#fVMeIC@X0[Ae:^M],fXc97;\F>=:FM^PAYd
LOS]bJVC#gS0H<5+;0e];<V4H.=44P5-E#:@5T.B@&,+.8gU<F;>9P+?Hc<Pff@S
6cL0Q;+A/-aB<_=P7L^J;3#,?=Z?bg_B)eed)@>bX.=aBS<J]).F[7Tg#.gPEXH4
1_Gf\1M^]/8@_3ReN@BI4VcC[[U09WB8=Jc_HD/D4BK<fB_#FWSb//;X@5-0K7<Z
a.R:QNCRQ(P;]Wde=d>ZC9^(#Yf3dY9:3\#)[W\[A0X2cP3c(c&Q_RST7a]S1PfB
ObW,;+:2bO<&+0HgL3TN\\)cIK-_?_CN?e\)cJA#^N/+S:dOE.O6JJg2Ca&&CTM;
Z()3SG\O;1g5Y5AHPPMGTAQeI>.^eU6a6fee&bPgZaNN2N9,Cf-^5L.GIG]?<Q#(
M#f_Q9Y=]3UJ6W)Q0#>MH@afM+-4eDZdN_:dA10.>4UI<<eL]E>DF>.RIG=Lc?L-
)L^LBeNEO#d,;^<]d8X@H.1^NR7;Ze8J:P/>J\[g^J4BGM>+UY)F_dIH-&T:;GNL
J>.=M.II>a/B2V>_YP11I1K>YR5A]Qb&4XZOd/T.g3:7.@A::0<cgCTKJ@W?-(&a
[FLK))P]Wf1WbTd5IZH1/7JQPF)PHF/I4SHK7:=)J0YAT8]XQOV[DMMT/>?9O->E
Fb]_C0@4UEFVD^-+bSEZM45A(N=C#P4;408W:SL]S51#8TP/AaKON1RV@Q6IbSVa
Q2f.c1--?KAI3a^C\-Vg/2,8P^VN5(1;9E?V4.,9)&?K(KG28,CJFJ+0SFWJAK:<
A&.g\KQ(:LHY@<F;9W(72\E(=UB\.3Y\LH#FX55C@Fa<(WS4eF<]e4?_Y(]<c>::
DA<aSe915U=)];f?H=6CXf2).(;35H61b0CK][F>W=A326cGb;/f5G:ddF^O366D
-68JN;:L1K8.5?&LX721IG>_;0^Rb5f4[9f/8S?W[a14U38N9WQ#&Kd,21e=RS_6
#&V]Q/afH(X)4b@@9_X;C_P5fa9B4DAB(821CP^@IQD[>gBa[;CW)N-PY-bG4.V#
P-P4Z7>CPO-#&;J-3JPXF\6d]d-Cg#-0I5B)-\cT1f_S6]WN9Q,A1JU)=]&g6:DC
)M(7Xe?4HY_RNYR&8^21W./dO=ac1_BQb&HdWP43S&?^66\JI]_I>e\//SFU2Y^3
@,7^1Cg-AB#KBCdL(16)M^Z@KP,.^-g[D:X_XHBK;e5D:cNYY[\A8COSU9Qe)J=?
890F)5aKGHCd5Y;e:J)8&O3X;Z?G_O_Nae+_)@N+_3HQTUEAQT0:&(;626K5)S,:
XbG^NL7-)FR=UEPV?G3I-]CSZ0)3JS\f-N8+\0J<8TN42:(_D>bcaN7-H1b.5LC@
OdPP.ZUe]NS1D4MB2Vg.URD\X]L-ZVCd7&MH3cA9FP2)_N]7S)HTK;)Q6TL&Y3M#
_-[&1V+K9S@I]d_<ZSF_L0>ZO&@ddS?;.ZCg=HF?/a+Y([A;d_f&C\]5&B=aTOC1
;<be938\UHcY3UI_J<Q]Qd=?W^.N@J4IL?,QU=EC?XdOf[9LEF7;<R-2S(16)H,.
g]e2Q@U7@),aSPKO;N49EE),;FF<eN3UUE_&))dfQ@OF_J;C5+6QB;K7_&>&A66C
\]1=2D0;<:3./\aI#CQSLPeBY>d_[)COQ[/X]5fD@GGLa(];2\gKZKGNcTbg5J\3
3CFQ[VcIfJA[aBD<CbLcH/d^K@B+V=TSSKQNTEfe;936a/AI;,c4,dgM0F.9N>Gd
4U,KHd_NHd^K.]FcF.ZNQAG9)PT7<fR<,4f0a-Z/:<@b1RHb83MA[c:CW5OBf1V2
&@&:PN3R[bSO@E9LH+AfcfeC:LGFP0>^b+XO(2EdS;4Pd6#KI6?&)4#c5J0&NGB5
_>edQGfOR/WANR7M(I8UN,=-:<9D>96d/\/MG;4_&(_Y/b9@J&W:E\RWBQcO>&74
SV]>?2a>EY>+Y37QO0W&E=UA>ceZK8YJ1MaH_CU.HUXU(7/F=^=Z_YS1cDTP3aO3
V,/E[:18HB6JdJO^W+O3NPHRIWPbb?K[SJR0BO:9dU5F6f]IYN,CY)N0d9H&J3T3
(_8R#H-(BR3_S,4_E,=M/#PF-;7FF[/4M0f3B,^MCXS.][Ra85eBC>^^XLK5@D^[
^Y8bK?V76\5eY\DffKA(8(Z]7Lf.<>Cg62U@KK8?V0/LaA:57OWQ.:fYc5RIDc&T
T_a>K_1<-V8U4bG&T:Q4XGA?2S^8CK++@U4eTD^2C_Sa[/[;#b\-(OWF/C>L7<6L
?JQXbK;cNI4QbPLc(B+/OM9XQJIQ^[)B&<[E-0).5a6+-6KXI:@eKZ)H:I_TJG]:
+,e97:QHO>N/e:6bI9[L,_e&M/_LF^B#9XW#\HF6(/C8F\R<UWJR.;[CP=O)?R_;
g.#DB89aN;3;cgPASWP-6#V+JH^])@?57:\(6_IHe^dD+0,e_UFRGF8?c]/)#7dI
A<cP&90g7cACIf/S:a=#gEL,6M1\g?98++5Ya9]A7Z+f8VDA63[c/151cTSV[/@5
R)>@?]cgZKOB<e/SCSb^+V2f)-aA7;H<9Ee^YL<OM6C7/b/Y@A@+0-JRMQU]XRZM
@@7;J7eF]I^#<g8aB?OCV9]g3G3Hca5=.ERgfC?NNFJYQ>V)0<9_.NMId=K.30M]
,IP:WG&/8_+M6R)a3/P<g>C_,-a7[&#@C1(D3cMGJJV)e>W_P\I-,cV,7\H_C>-(
L40_(.:ZLC]d=2A5T&Wce;7LM3bV8Od4>\;e1(6c2(2\0@V3>,@9TXgPKR6WX52L
AOWS.)UB8]PX<FI#1XH[@-0/e^D<T+,_b>-M&CcdXFR39P#Be\GgEc\_I7B0a]FD
(;&C9^a;<]1>G)dbgCa;,&dQ+ML\[D/QZYCa6@L;JGGg>)HW/NNU)-Q,,L:R-Qb#
<9[-^>dWS(6O3Y]/1VR;^4FK6I[_Y_,#Z-+&V-D5Te<AXQ4J4X:KMWA2g.DE6]2X
N02&c(E[]82VQ@)Oc.\\TaK>G.?4B<-)b,e)QLP&_()d1K8BVB#F7<G9?@NP=QRJ
e.B9ZYTK1TBAD:2W,FV(E#aFEYN,AdG:+b#-&fDDQD6_a\R8M[@5=.&<ON5+ad.M
<Z45b=CV?U,]d(0UDgQ9-PbGU6(.=Q[R:&GccR32JKdONY\+U3NGRb6:NSgZNDZ[
(3Ce46?NUP-7aMS&ROAP.-_1K5.f/@Me^:P+&UK9KeZ@_2SgD,c[41(R83_,W=GD
+>8\#[(P>)AOPd3AZ93CCCRg/UP.2>6\:[;J<MQObZ_[A1:,KA3/bb7AL]-KQ;K5
HR.&K3PZeOG87I?@&?=0N)-#&9=2A?5;3YWZ_:d+7=]f:J6V)&Q#L]PAe21F3/WE
+/ODLeQSa[RE@],H,H8g4Y.LBI05S;:feX.F6SLDO3CI6(#299[g]])1QH7UI_T2
UA8^N&ZRWSc7)JZ)0=LY3.8GI(f-P:#b_DFS([\dD[J#;X;/T5847W?V]Q\@I@WL
SH;;X=g.&>#C&<8#FDIb&&V2S14HKT;g1SAgaSd2;PU@Y\7@QLUQ.8e7/<H=FB50
SPc&3cC^DG7<8UfaKWYX,,91CU#?_PTVOgg-@Ub;(S<9<-,GHW_X,dAAf0;8Z]<&
4g0/91fB]L;bH[?#Y3LB,>/H;OVB_I.-<RYA.#a;>BWg)SA>LN)+WD4)0IC7P)b3
:F8E2W^_=Id#O-I6Z]B.4&T0ga-?_FV@\a&B=<EM2HgS0e--bH7QTcc=UD>;):6>
52,agRXA]A5402TF(f786/WLN,L80eHg]9/)3YN))d(NaPZ-.CR:b&MJg#RFWXW@
0K4?6e?BXY5K^A_]W[K?JJJbg8NLS+gJPXA#A9M&8Z-J/\BPABV^TU<-V<KeW-+V
HC^feO&_fU1PAF(XP&AJ8N2CEJ^-YR\+8Ib[=A]&@7C:AUZ8I&.CbOd(\W?I3cXG
+(V+PcCO?/X^L:LVaB,1,0?E50RTV:>O+f_=g:U#X3DM>,C(Vd^g01^-E&,ML2H=
eac[OfCP,;.]@cIa_b3WeW6]CJ:0FXL?@2U\86?e[.NEQ]9.G>ESKc\OKFK56PY#
1ZCA384@ZKF&;TH>=eW#f)3S?e9f:1)SBHHK8EgRea.HCGT,3=]>dD]e-9aKZR#L
a@H[20\Sba?+Z<<\75?^T@=IRWQ,L<-?d@J^;\7@WK0+UMYO--O&YV6E]cHO3dV#
H6OR2Ye,^fS3G42].6V\A+?3M1Y:IJ9XK:4Fd<<NBfdO\_LWdaBV(K=BQV@?@_RW
IF?#ZFCY0ffeN(Bd3;X)F2-Pae;JTE:3cFd/JZM=I^;L2YWIdgOF,HD=>@I5UCG<
,e9gB2BYU^V/E11@J.Y5[5SHfZ170-d/H6=3A;MMRd0UCWG<#HR@S_C06,.2E425
DMAP@LHNKa-Sb;QRPD,\PPb.DWKC0HJU>0>2F.1?:6EGI4:CM(WDbSR-#GF#_@M]
@>RJA-&327bCYTK+[/gSb@g>cB/Y[+EBRQ40#]1_76I)3Y;TU\:?g<Ja(<S<_.f[
D\:;Pfe;6Q0.ePaRcN<H+6VU3(0O5^OA4Z7CA8)1W)R?9MDJ#:9SHNdR:+\fYG?N
eE02dA=;E#GI7\4]ca94,<T<AYG\M91Qfd_;L1ID>(GJ</;C\E5)1,R>#.HUNf+Y
/Jf\;0\]#C;9](9gFQU.Q3SB\9RTYLc9+8\9bHG5\];Z&W:)XNQ?@A-a_<@/+5GV
c;KcFFg3Y6RTB48cW\AEW:NBQc)C=0&/Y:/.aD8cLD^3VK0<PXKcV<eK>^@_XQ\S
>/E1>,ZB;Ve972R.@ZSf(a4J82R<ZHSD\\Q\JQB=83K@_c#6.C5fQbW#0f^5cCOC
^#;XP,/][]+/^EPX@P<N)W[-XKBc^_&]6+3Y_=;LGRG<:DcPV01_<^RV)AW?H:C<
0eNg4&I103Ag/cGLN&J(b0WNa=IB1)\4(NfR3>B.P2J<Q]JY4Z?7+Q,K]BY.G]T/
TcFW6Y<-)SBWI5B:f[>Ga=H<4]Q7QKdc2+Ea-\TCc@#>19_5:T7OVMESI,0P+9HS
OIBfdaX1B+A^:T<ZGF(0X[KYG\Z?e7\3?@Ugbb6V_:U>@c+NOT\M;b_ZP2deYbUO
BZ3LFC84d>9O2Tb=bDD<?b0_XX6_)X9)_7F1+4\S00(?R^.=G3<;O(QUVE\]G8U/
g+4/2(@@>)BbbE:5aP>79_UZf7048WSFJ8?88HV:cdCK8D0-7>4FGRT#1V+N++LG
,HIUE[AGb7=ZGQb0U7T_+O0_K4EUVBML(X0&C_Z8QB0Y+<2VfA/#-@F&FLQ;/S-[
d&-IDf9A_Q2UL@:)2.f=60WLPB8FF6AG?N2.5G?N0/aE@I[,;b]0KB(DI)>BU2]W
0V_fd0A)RMD0@E0JG;E([#^M04)OS[CY(J:-(;H0Ad@#4&11]2@b<e+C6G@^PdV8
E[AVCUSIfF6dJYC(e:e=08,?LeYgP4G^J6dDFccLdC+&H2R^^e8DG.3aB&I2^/<g
Aa_<6<#WfeZI)^J2aZF+,cZRGB1#EN&^KHWc#,.bffE?e=0C,C_9J37A#O^9B[.Y
++5gRTEW<1_;#S/R/FC&0PC6J[=;.f^_TgJO;-MCRDIZ^]#NRH0L/4;8>79J;4f<
)ET+NG,I0a?X2UHH)8bEG&J8YAUP1?_\]_beFAGD:J-LTRg6-J/I,[E1&H9\<Q+a
PDI0X8U@CSgId2(S;F^57[\=EKZA.CJAJPKeaB;NV&abSa#G(M0f6J?8+M]MG^K?
MP=UQ7S:#W[_>?e_9V^,HaGRO6&fZY9Q9,=X8)Ag3R.bA,D9N@bC2RL:>/YcSU#^
eG9[#U6K4;3E-AZJ4\gCg6\;G67HF\-&GDRD0BL21+SZAeSC1[eAU0PFU^/AFK15
A(^bed(5MSR_dR9^1=dfV.^Pf8Q+-&4PU9BLM_QP8GI8aNSAR0,R54;)[50Y5,/U
=]IM#JWg8,#M>-?+2D6-9N5dI--=We1R6[/?<5QeM46;EG?OZ0=U5H#ga_^_O<MW
WRHXD,EFOZaWMGJAFN\]&QgOP407^DGE4;>?ICYF^3)K/bN_&786E3J.WA6\E=1-
^Ha&Me-c9OUN<ENLU6K<#VTIdC@,8SQWTJ.)/@Lf=ZL?E4=0DOV6^CG<abNZ629K
d+4N4Q7<8]=aE)ffRL]_ab/M0:)I8_O18&)b-fPO_+-Q[+d;6NX?cA_-cfJ4V?[7
cX_J.Q<G)Z6,^8Q,&@f7(AE;51;@B[:g,DP?fgdBFX.2GJ^6&Sc:ZQ0dHa1-]BA+
>MA,.X?^HT-/Md)UDSHSC[G6GQI23D3.?.OT,,@##5K]X/ZAQdcCg51_O2Ab[+cR
5J0XTXH3W<)8RME-++0DU>>Md]L3H;\_d65W&9QBJSaYW497Lb.]EW/?=54U&OPK
eCX?aV3T:,/VP(C-]UX4U,E80+&6W&A6fRSHER]?SH[S_4UKfa_\1[JJ[\NUb>CQ
UBC_1:\O/V8.7H,Kg&C>^BbfgdE2X[J@GY,cJ\682XHL;&:Q[D6+U@3M8G50ODG(
B5;HD[S@&d)GQffeQ]OU?P7f[_8R_1O@J<->X?,g?16bSS<LIFBVM;SQGc0-dMQB
MR#Q=/>7CHE8,2:CU/NM<6/IHM9GY4VH:.?=47>::[L,H0g:U55eXF//LU7\bBWT
42A(_?&YV\=.9;5<K_a?PZB]FD#JM_K;?WZHWeg8La1;N4O,1=CSP.ZPe]OAEZ;7
^WGgV\bL/:gXYQ-#0/gbeNU0T(caVdO(]&B+Z[E4D)GBWL\8S_]:6DH:8(e+@;e^
CYN.W#V-]6HFUIT?2PU,6Z9Y,ac\Ub58>MAeZIJJGa@QgQK4:=7];<+JMG=#b.@U
MeI\MQc=SLW#OJ_<GN/dFV486Q;b(;DRB9dBQ9YN3:LK1PQ]YJ\b@/AI^bb\2;bA
GcUT&Z6^DLI7S/66=e]UTCCT@4E2@7a8L(5[EGAcPU2f0A,-@<+V(LdI#BW[2FS8
X;/Z[+#Y3;P&VW>EZ+^O(_;KdY2G+:=b4e,]YAE#2&:+ed)RU6MRDYa/>T@+XCM1
e??3RQL^0T1b&Gf75QBQ_FA2])Hg?)^;4M@NKKec548??&HSFYUaYdUW8\J3\8)\
Vd5YU+=QP#g_>6A[B?K\F#D_NBZ9/G[93C]=Q3W;6ESA.2WQX)H+V>OgD1\X(S:&
AM^d3B/[K_Q^8@Cf@#U>:BfZ]_f48&bIRG01>a#7DPD6g:K,GgJWOBVW:G[E<_Q7
;Gg647^^NI\YLff)94JRFFGb=T2Ye5fgYQ1NK2QG>))ES4=_AggB.B23BN[]I^e1
Qb3^e\T8E#H@=4YF=JL3)EL^U-Dg/f0P_c,2S+A@+/7&fb<Z-@BLZY2>^C?M9>W.
#PA/7)WSN7K)9,fHOXS@S))Hd&f,+4?f^U1CR:76K08-L^S#eN<7L\SA5X=&=,+a
8&[X&JT9ac]dKVN0.)I5:YB&O(0Z_)X@>Z#_U.\e\@D5OG38PSELNdP>FPd=+9O]
+3X>XCP=\=5=X0G2A:^SM,YE0e?KNCC=VQ&LO,Q(^;36CZE>=B/,KUe/9S>K#:E?
)54TE,cYQ4A@23?:Z\bRMEQWQ0L0=>@;L8-YL#AY>eDa6L6]PE7b.b?0Q25S5b/-
919TZ;.)F9I5VZ)0HKAEM_0AW]FIb:F]><V]Y@eNM6a^L(?VQHN#aSZW)BJ\Ke6]
3dM:[]FSUVT2W+7)K^MW5b)9B#64_+g.RCGKK6#66^>-:f(+_B&^&++A2E/I2C-:
M&]0V&O#Q36S>R9RIX<g5<\AV;E7L@\K-^7M)1DaQAY>H/3@,P&QA>F885<1K/IO
95gP)2Xa,(B;EB_/YQ;[.5?.=UM&gQEWSfDef=eR_+?Ag<O>X@P8PNJ8+1I=f<5F
MDc7J=:,V=5W@99,94DNRAgd9BRQWTC9&1924?,1+e@_\>RQTc35<#Q\T[Dg<6NJ
X0-]@70U/[c5>&K\-?H2B@2,A:_a.dHK.\EeJD8_C7.@7g6<P1Be(FBR.B>EO<>Y
S[OeCQd.N,JCY/FUJ&065MA,[[4BbF@-I-]HB9bOE[LUf1I]+5)dCccQW\Z^5I[5
/]VcH6\T@#AJKI\<UPBQYH)fQLce6e@L=?MZfXY+6Be.0+Q(65Vc1^=7a-YT8+8,
,9f1ZUg#,MMKB@L=g/:+1HXRXJVZN)Ud.O<F?XBA/B@R3NLd_e&d3JJ^T,bUVY@5
8SCXAUIL(QYVe^8+bR4H+NV\X@[>E(6aBDfI:/cUCKRL_9d,82B1#);:<SUc;?,A
&PB1R@QRK5<4G1aX+Db]ZIGV&QF:4(Z7?acSGM[bf3>cE0LZ#g8\b:T9aDLc175U
FMMEbT2ae<J>gG.#YXbDTT8F;BEW]5cccB:fK=eG]5+RSLR;f>)&.-GfWcIJ3KN)
-0bJFIOc?(XP7\,dVW#3K:V/O8Bc?1CM^DL2A8PK2E?591LbC=3ETRFX^5d9R#DI
E0\GYV@I[X1=e->;<aH.NLXC_@/F-S/P\(9Y8LTU4#TbYR3gb-HY^Z(5,1O.eQ=8
FcYX3529K\6.4J7;>]4)0fbCX))B98W=5-Sg4#/[Qg9ZdCHUCMA(XbZN?;&=,_V3
&QQASLFH4@)NS6\NJB47\gaASXRJH:0f7S/#2aaU_[HX2P;:T_T#Hd?a>]Ke1.E?
+EUD>5N?H0>31VKNB\JF5[L.d5NL7M7Y6)4efTceM&_]\BMO81#?;g0?Kc@UFe6+
3W7VIL2^B]3)-B7>T_U_Gc???W;3BcG&f:D4<FLY5KXPRe;+NHD.Q[@ZS7Af[SHT
X>7;a8U1_;-(WX^a.(#3_Gg:8+.XNB/M:Y2N((L949[/aS8JIMP2^G#&NOUbJ_G9
N1ZP@K03+6])Lca&V)J2[F^D++85W2ed>[1JGF^\HL4;/X4WR5dF;6Z?5RV,^X2,
]1=<4>3>#6Z8RTAV=T;3[:f>E(?YC.(G2F_KP01JJ;X20#I[TTd&4:b,@QPL0HDF
,0-7b(_A+_6Ib@.1-c^+D)R5JRDC,WT5XG17e.]U^5dER)(FaY(85VFaGHI\I#5C
CIe:=4c):PB0Kd-L-CD0.4\U=:<_bH,1?b8X8#EcdGf.9V5.VcNXBKC9/;f)5fGG
X5Y\-0fe,0\>4Q?e1EAE7c(&gMZ2@)fGD9ARTWZNFXg._U8aV;CNLE6VT05RYQ]R
g^fd8DC4RIN(+d>E@TMZ+9,:UC;B_&gRD/FO#SN\bN&Q=De<53gffLP=gW8]84A^
/28N>UHL9SW68OY/a-fJ3W[6](3>OOZ\IcQ9@V@cfb8^94[JfPTBc&YV16M5dU0D
48SRQ>@P7+D[/gHf1C4Rd9BMZfXR(P^XD?c4-V(P,+8W,JTC_g.0]_N-@KON.,SC
JP[daMR\a=I5W<47=Ib4=H:DD5PS(YaI5KP)e#[-B<16Z98T/3<?S[4+7ZN)?W_7
8A<79YY7UcGX7g9X:64+C1^:5HcE<+cDefM,NCe_CJ:=YKYA<;J7?RC:X]B1@MYI
;9=M+8Y;\E<bI:],A4TOTDH.d&4:J?)[RcAX,?cW\X89G>+aZ8,F;,S@Z^^5Vc+R
2W:CMJEGdJedd&MQKRcf;VZ=7X[)DW(#O&@EICY/#JM9F4LCbdF9cd7#FEW(fYgE
G,N^;PfA0XF/26OcI+HAA=BMa702gK=H4\^@-;PMMQG78bIKY7^MAF5H[c2f0#d-
Jfb1ZC;P)DI^IY)=ZB3ZcfLd=1<cDY=<c#TOLN0/3<;L>4\LTMf<afUG]:=g#E]T
ZD44(<RL^NXF3AbU#/e5E_/W:Ye:BIPMg)bWJ@N^K<<[M70/=MI)_\#Me0)B3OQH
_Z)-fI5b.H8G#6,WDD.D4eJOW;>0^b?/\RH]<>^O8^#6H/;[L5N9SHDc?28K.(./
6C:&L>+f^D]Q><dI_4/Fe.Q67A49]KG.YA4Z-93TV>ISG=e(X?,N=7<fIa?CaKF/
&<?TGA92dVg;P<5(,d.HYXO[;P0(?GHL=>XU.fZ&Q86TCJ1e1+N+>MOGEO>YE\D,
_PAUBA5FDD.L(>(K@AY213_V\^]?92#^_BH+ZMePg_Oa3^;ZM:>fH;<LeG:bb/)Y
3(J;31OadRJ;E^cU84G#E=LO@+@?[Z#<X;R,SE]:7-8D,c5A+M:bIA=e9E@Pd-?C
EeXQ1-:K5^.+U)Z#[-J_923)Y2NRHLHDG;HdU\7?G(1#BGR7Bd]a1FA12BSAC2[8
_a.O+L@Hg+-5#=6I)[28aH#dAM_HH1WHAMXV#:BK,]GJfC..a501ULNc8BJ,@KS9
ZH\ZS.@PX-JF-9Lf.cB7F>dF:dK3=WdKR__F/a#/?E3=O+C(]=b+fL]Lg^dc#&(H
:_IYNcKaB@6-^gEW>#.#4aW&7OLCd0--A34KV[6E@V+eGXN?a?X&eRAZA]d]HEN@
7c,RP)b2NafSN^U7XYW+@GP8+LS,d=)O&B,&fd2g>A95LH^?g_;fE[[fJfReKQRL
0T.JX9I-8\EN:B&8.Na<VPBOV<F[2A<bVS9C<a&>ZC[2]KJU^FKR^\-aOdd)\+\+
_8cAL(WSC6_fZ]:3\.L,I&cV=XA1^M:\/f_>KE(MD(^>QVI^Xd;Cd6<c<S5FD/TA
3JgGP@6H#KZKYUeOUD)^//WAP5\:Q6&J_=:&D<A;XgUL=5PI3adHWQbO(6GRR+b;
S4RGB,g(C]_4[#WPV9ESRL/9_dKL_F\F>Gd86NYfAD1#V\+BN_cT@bYg:+U+e<;Z
6\1;7NP>1O-;FOB:,3Ib[CJ\I3VN1JU_eC2[dTK04?I,JB].<FPS96S<6MbS7X_R
CaMdUb+6dHKV[\=F\2R^?DcF&D^QT=.6WDU;Icc\\7CN7_Q#=]LWfKA;+gU[+YXU
PZBH37BX0JHSfI?&N\.YVV<\+DMJIY(,DbecF(UY7OI+F7&<58N2=S\<-RII_/<a
FNSJ/b5TbFNQ_L4^(9JfP9c,P[KO,E=HD;7JJ_>,2SH8?#7)JTc+8THI?>=/[24-
W,He(gD[OQ&,[\M54/;/U(ATO6>f8f3?/2^^U7>&9S/ZP^MHBH_2>V,GEK9A\g-1
[B6[7,(>2@#SSBGWE.bb6&AM<KE\&=dAGG25[Je^P)5bf/YE)4W>;M>WV?BUG97b
,KgfaZXG4@ccaLSH.4YHQB=Vd+9^-Qda0.YPEG&9S@.cG\JN&:_H6ZRFU8+CK#B9
R>a.W77SX2fO.agI-1gLX[MSg-P7a0?SQT;<d422Df&#\3Y>C^Z@B[fdS,08),\]
YP#OS&2bA0;cW^CTePHE]aEcUC^f.I3;YVA.)?f?FXW4KDU.@(LV:gaB\4aa6)PO
fFHHb9+I]K3C#B:B_S]CT05CB0P6RDHIXZR?9V4dL3Y?[?AXf\@C<_a8VA8(+:6Q
b/X<.GB:MYU-3;\_ALIDFDGOYdUcO^4fQ:59#@S7b97&268V=E=P-<9K7WA.1DUa
b7L7]c+Vd^=67IW^,N+3Dg\3EaT8>B)I^+GTMI<cQ[9QHOE^?(2LURFUO@_B:>[_
<HgIX^.e/;SgDJ+QNUB;GfH<,44gbA9cDFI9?+:5^N?]V,Hf[LEcgb:PK)D,d\1e
gS&/PY.aPWLc7Y9C47GBBX/.K>=]c5,WSb8L+F8)eS0V))Ic0/5[R@)589/fW9,K
EUOPe9)UgcXaG55[=3OJ=aL3N,;<aR5#T<QEXc=?K.,I7?<:f+O]UD]3=\MZ;Q.^
Y<3B,5g,(f3W=X43SND+X3AK8)d)OD@._18g;;3PBI.Vf/@5ZSbAO7eM69fYJVed
1^1R:@=4=Z3L1E:8@b2VgQOf>URafS:gdXbCR6dQUbQ4<Z=-fQZV6;8?.XRb2PSW
Z:OPWgNG;[)_AFT[)cW)68ga9?<^)IG351QH<<GdGG=Yg<Yd/R+@K,Xe#-K5TG8S
,HINN3G,KK&d?c0O<Kd)aN=]5Fg9BX^PXB,d.BEI0N>GB@1;(I@(=>6B#R\:5dOQ
6FRG?d=Ld<D#U-QT::,e,6P&U]d@,S/6Ef,.c)/)2[Y9;4[PfV6PU80<AMRY0,V&
.;S/VcJ(K@<Y3Nb8S]a6b3A46I>cgE-8VXH.@P<O^BX@+gLRM\=/57U7eGP/W8FW
A9[<HXES=a8_YO=:.1/]^T:XP-4L(2TXOcce=]SWWD1NAfb_QU2-9KU+9E2R#b+2
+deNL)L3FN:<bSLF(GA2[a&W?bA1NC]SdbO&>+eK(EK8RI-]A(_PX&G43&X49\a+
&ZB?4]&Z9bY8A9A/d?S[3GXbR-66?YHNeXE\5@ZY;B^R8IBIG<6cXaG1JH?XJU&5
1:c:N&R77e>GB;Y]RR>#DIULJEaH)1,C]DB)O52PL[@g@\A^3?S8B2ddWH,\I7>[
d1I5)H\c/BU^^e]/MbDfNYIgHM02T/YdIB#8M)+:Ma20@d@(A+&(g+Q0C+L]EMUd
8,&4XQ;V:7/F(8,:07QN3<SOD=@8=)EK)WL),W6SV9cNAba)DA:VPe&)dMCc(A+#
+fLa:G-G-7U4H^S7NJ2QM)M(BX74TJ31HYQ,6Qe3@(:8I73RR(=_aMId?H?)>D&B
X([2(cO^B&(M_6DeMT02O@c:?U3P[.U=.XN9(Bd0R:RL22F51U2^_LMcQWgJE82D
\QX)9/92HKQWb761-[1X?RNHdM/FI4?4ZX24;L]TBF55[SV^=<GeLJf0ObO1gIMB
_-5>Sc]V6/Z/QO0cZBK/L0:5->YPT4HNPR&7.E.VOT57GH29A4#PaX^^GQ9&R:4<
b#/7.0VO?dD6ZaO#Be,7SdWVe+I^GE/TLT1>?TPO4?[&aaL<RD9ZBPPG[?ZA3LI7
ZU1+SE]8O?[A?^Xb-L(QOP\Kg+UKRHI-cMI2e7LG4?73/Nc@JQWWSNIHMfW4SYV8
E9Pg]dRO<-SQ1&I>f75PaOO9YAA=R^M<,KH=VD<9>_N<b3,XGMfZB4f]_EG65g5/
<B^84gSV7dPd2a>Tf?=+3HU/8/bUFb0><PM(&9DJdW+HXSBF<#GAc#?Sc7JcWELM
9V7/b_0(8HGG:TB&AQS87)>?^(>N=<ES-f2cZZ<3RAUWP.+,)bV)Z^TKLYPFEZOA
VVV9faH3a,Sd-Db]MHFec,<HKN8AW54.7+fYDKd9YX;<>F9L-;XSGO;7NOd/#g6.
Q-6EA?9+B#^)U^7<_:)1::=1E=GR>+GYC@1PC69G]_WSf):ERcb0f@c@,3^,?FMN
YPX0FW3[];[-9:+<^X9)PG6X0fIfFFUM]0;Y_W?<W,@T-.3:0-)7:5d;IVUV<6\<
dY[2_-d:FG&TWG@(<aSa52#J&JKV?(e\D,gJP)8QR(G-Q#3]Vf2(6>UcUM+N@5@+
9>4fJC0P\c&G,K(Z=1/W9DR)L1:.ZLT2F1D\9<&VL+/f]A+,e-P=1/JAU8I^ZPC1
2=E#61gSF4&;d+^+.I]NGIc(JPIbOe1J\SD.YEfb7a<J&D\Q4-2I5345:XRR-bZO
VG-.^2Sf+==6-Z9U\OJgaCA[9]JNVPAF[FffZ7e;1UTged2)P_6bM=gSg5&W756F
;B_TY7/S?.6+F?D)dY#Ef):.)bPMcYe1d.8M24B8C24SMXI=9>B&g(cg6cDa@7Y)
?E?K1U5]&3Q9F?G)2fJI/bb\U7JGeJ;Z@BY;8KZ_eP&-76)7=@)gV6NAGbA[,809
=4ZYNYcOLbN<g1;ZMggW-S8\<Bb&]IZ<4/<>=JF1S->08ME(=O7BdGPbOGGEEd/X
3N=A>a,LCEMQZS-J4eB0=b23=N^T1)f?]8e^4&8V>PJ?/(HPf7=@J:W<V5L]E/[^
(EgMN)]7f.V@&gJa.]KA/F4<Z-VS5g==[Q<(Ma@C/9PBJ?=AN[T#GL_TJ5334.8Q
ARKbg0(a]X5PNPFBZ[\XVd;d>Ae86A:2fB1L;H&Q+-Ag(S[L+?a:@Vgb3Z^H@0bT
;L9[:YAGJV(OMS1WgSa@eVePVU8/HH^dI]RKaUX_MJ_GS\WWY+.(Oc\_M4EfHN7D
@\>&(E&I9#a=3\GZdT,IS.V16<NU):9UIH]>4QB4JcD5-\L6bc@OU?7KY5)<MfE(
H;OT\SM6d?TCGC(K)E2QD7_W(GKd@(=HW:]02:)ZNaOVgB#@L]ZAb./RB)VYTW\S
FYTI1K/85U61+_WVO:cPW5HLD_e)0K#6?<?+<V@<^2ZZ6(3D9J,\XeKIS,4QYb5E
a>#NL8#AdW,N+_LU#Y+>HCgVH+MM1X&>U4T4&W^NV2W;RUZ#)XQd(0X283G/T3I)
>@E=caf;>UV:B8\0JcS^[;8/(3(MC<B)0KW4Z,eHWQ)65=1#D[abC7B13X,Jg7[E
82#>++>83X.,M1?49?MX([6^>)V:?EeTS&#Z6F)OCJ2/(NL9&RV48N.:^&f=5V/;
0O1.=<gab[:0]0TQJdOC90_]8<A(WARW>Fa?#IM,g<A1Q?WaUCH9GS@X\1(M-2@?
YIC\+bOYe2b)f]4,GfC.+F4I.:Z4=3ZCQ5KZXNg:.B@)AK,U7I2A3)>g>c)/_+GY
ET#24gfZ]LY])BVCJe\8DD2>S&&KRY)2+L#P6P#MYFTWJE=VCS;WE;[4ZBGWPF-L
VSbH1]a56,FTZ4E&07U-b:8<eX-M5a250:I^_2\+Y<dT>DDB)V^X3PR5H4d,\4_,
GVg.<MS:D4,UXcIa0=:1Yac_VR&@G6I7?ED><b2:^:Ob)IP(fLOEgT)?93#M#=fV
1:K\4;6^1W&@6J5-3GI5ee(^.]ebC9M?]9#BO/UAF+0).,KFgb9_G@_fAN,R9?18
_cW1RgB@2fb/VWE3.c=JMd]>cR;\+HABZPc&?AWBU)P2[Nb<G^M4YP+.N-4Ze2H^
Y9C6=3(CaNI<G.]M2:b85=^:;:FYdN+?C_4bd5@XQ(0<PBPUBRCKf;2J\/N@316Z
,MO:]R1;30&3M)>Rd,6L..#V^1=-.Z2V^5]^C6BF8?4E?BeRYDgPZfdNHH/JF>N_
89SP^C<;gcB<]SW=ga16U/8EX?2d)HWTIP^EMb8X\[W\-)8/#L(#_Ug4VLZ^L2[[
?<@5F532Ha.#/_9J44&X\^TYY[LfgA..g)9.-)EP2#2)(g62Lc1)bbGc._[#_A).
1\da[fSRR-[IHe>.Y4:f3.aT2@AHSe?@FVT2[:=N8/@H^2>F5#_^?1>BVPVcgFY>
0K=-(^HO@K<RNP;UL2TMXFJ/@U#<dc@([@5=^U,,e[].-ZT;K6:P(#=gY:@L>&GX
2e8L+a.69OOCDfUR,ab41WHW.\IM]bgUJ7X8\:/0=)PYFO1#-BU8;V;IA-ED_Bf-
R)?U8=CV.eSU8d3PW#5RW6N:B3(URI_GQZfe:BXb/eNO;U4LcH3Sa\e/Q5\=;H8R
WU:15g_Q=](<MGB?XM10E/A@@;XH1KF+0)=gAD5OBOLfeZ]K>Fd-(ZSHgY=&DZe>
^^ABN3K4#S4D8=C#WDLaBJ?0,FbYO:cR;F=DMH3e1=+T<e1^?e+,Q=86KL.CMV^B
\<C--M6Bf/]^_,70F#Q;d\DI8FZ4ON\BJ)&#GaU&YC2B;B5O5[5#0dgHVGQL>PM&
YW\[b_@/eD_<N4XQ^>);<7NMUX#VKLOf9,WY_gQKc[,-^U0VgBQfeD4P:PGQ#9#B
Z,1^<LI?8Hc^T3@P#L0N-Z5&\39;Y?15T#YF\&d[[<0AZYdU&T>caTR,D4<V4_<2
+e:c1N6;O^U8AaDOKXJ5_5P9#-g[D5V)&Q,f[:08_a=:5]B1_HZa]9@MFG<8;:c_
\c2[eM(+WYb9V#1RT#(C3+<<_MS-=@D>.EBAIBJC#@C(R7Q0S9b/=gFPM8@0fA2,
B=-4BQ9LgWgbBA6<OBDFQEKN2PA>LR(JeC0NH0AS7&9FP-4O9AIV5;,?T^<b^CP_
UI,=V=SU/I/_dc2>C4Mb>c74,/ETGK)AWPEfAe3H9/QJ\:4aEY3&,G9,RIJ488.O
^+7N=3?H=W_[b<-YGV3FcO.F)GANbeTMHbER7/IRS.Jb7RS/4/Y+JER0;A31Df#I
YK8Pf6IA_-0<Rd07E+YH5H^d_&?&?I=NBCLBSdT?WEd6T(0E:51Xf[5?<^;M(MFd
Z-^+#O2V6FFJdV:cC(HPP=MRGGRX=KSTJ40Q=bJ&RM&DUR^=UTGdMGP41K_WY)WO
A12=d3(3d,XH6HX)/&FNY_=0RTcXXHg)Pd3.e=fNaUB2DC/Y[9bdRAF^>b_UJ];T
@g.9FXC2Y(P<VN;)_,c6MFe0a.G9ZJSVd_6P72H1][TgL.=HB.NN9/BJXZ@RgD+Y
Wb&R^f<W5SX:@6;:C10T81Z@Q@-gRK_;T>gWU]eaKI;75N3ZUYTgA5fP\K+M.1cg
gE+f)DYAHMbQ&2X]eRMX>XNM#N2X5^VML71(EMRdD6Z/QAKK3P/ZJ]LC&OO^<QBc
:>-<C?J^O4-&8U\ZXZ5:D+SCUT<UQV^C;ab[b<7;M:[:^+YNR[<Zg._0UK.3@gN1
]G<U4&Y:/&-JP#>?fML<R#b^W)<&QI5ZPHB4-[[9]#_GdA,DH9Q)JCL1)J+V;,D\
Y)d)KIQ-==H=>V>E,E1:=VWIK5)A,.FA+54NgV_4GE7<Q1B(81@99[1][8JMX^b]
HdZ0;:H,2Kd:AG9.[\K\\b<=ed6FV1/S))0M3Id1P@DgZ0cEWd#FUTP[,KP-;(.4
S_8c+/;7U\5=7BX+1QX]Y\c3P:03G6S5@gO,Oc=:]P#KQLKHT#8SG0E>#M(H-GE(
^M3bbbP.;+&bWe/AEbJY7(eV<g.fE,AW.HP@2HVBc.>TDI^O;0.S>f(X8+Hd,Y;<
AI[g4=);SLK6E>>?A+dDU(W&GFU;-:HdEGUIa.LF4fPIZ:MQcJ\^S[RZ=6V8/V).
;43Wc.d7H3\#CHeE-^+/5.W-QJQg3TQg.&JH3X,WIBCRR;L4;N1>@TA_ED+R;RXf
g0C@PT?>_.1K1bB,Y]>0-6SbHY-8RYdbI<[0,g\THEbJ7&aWLC]2J2GS_<7(-d>1
@LBV+c[9?<_Q+^0K.94OD\XC_/S\;/QJT/Kc-\44^RA^V9PF&:MA6WB02Dg-ZQ-a
Y@O=JO85XOVWc@L84HCeH104C@M[MK[+aRY-VgTH0E38=&c/5HQ/CbaN4deRJV#c
/?HK;0L\@34;]TD&X]eI03_d=FcfG<PD@0fNW8429QRMKTSJecH<ADY\?bZMBg(J
7La^bED<-W@BfYPgQ;@a^P_B[G3b\UDT<PBcSJ8:B8V+9H4_JfF]F?.UaJT:<&#G
G,8CcFKU,Nf.6cSK__e(cb<=/3QY8+6&MJ@&8#3XLcK4We\W)?If5.)?[f.;])Y]
OE1:&7\/V3ee5XO,E[[S8VCSfH@gV;6b;ReE9b2^OLB#1eUS+:1:373P-X/J+^.)
D)b=K#9DQOM0dXg-B4SB4FL\,4^4_2eGFT9dBT.9&bb9ET6g,,#@a@)J@DHUP0+I
C];Fg=TMNN)Y0gYCfgMMJeS(W,VK\eB3O4Yb@M?+<F\If(CWPSSZK/#^?8@3dLAT
Q;Ra)I4cD[a[e)Z(\NLAZUgA1T_bV.g4F^KR.2S202GCfG-SM7NdbW(fX4NKL?8\
/HM&W]\JS1A.>B6+1_Af/Ff-M;P2G3U@_d&K^Oa]8K_<(ZU^QI1N1CeAQSQSZEfG
?6_LY9AK:0B2DaeU)S;ReOP<,8]DNT/1[F6ITH>C3E:Y=AON<fJ]=K1cb^VeG[V_
a]J65RFX:Of\TfY=R=#I6(,G-S03Fbd:F@?L>\LW&^WU^d]H=DW(OZfR_;IWI]1K
C)<dXdUQU;,FU78RDW9?DBd)SY7DR[4d)Z0+>,VMG?2YJW-7X\d18&/,,6G:?_,N
a-=eIXbT\E0)@_^:\5@a#>d>Z9SDCH>T8V:8b#UaG]K:8#RT(U^)PEH\@=IX6>L>
YBQHA0915S-YgX)8]P-LHX4YI1KeR,<:)e>GI-_Ed-8b0bgS4/[JMN0[C[[R\]G<
^PZ\KAgW,^1Ha&:7BcVVPB7L25^D<._,^E;70SDBY<54bJ9P6DRTE9NL8eU+2/GR
1/SF:#401?cC33d>1)KFP&11VAb2fKKQEMG6736WS\>e1S93Q[&D)b4GaOZ&2:>X
VZN7\:KPIK2_E3)B\fZ#21-#-AB8/d6fKJa(X6_95NJ2BT.0G&T48-\G]B?^^<_M
).0/SY(5:B:Y6EKN5#?58IaaTKEZ(5/O+1X8;^eRBL-BT.[_/PD&1_)P)U^.OOO#
-_?OS,a#1_Ed?L=R)D(cG&K2bA@LOJ:g8Bge2_E](EYF@7d90=4W^L\5]+D44gR<
CUU3^]R.O6b<f02TTP-Q+BGU62W\b#:]8&b_)\G^:Z1=SL?R2Bf261M\RIV4<Y8)
6&0X,[LaPZ-IHIaLB>&APHI7,ag(/Q:dAY:1L(L]]O=UN(_Y+>2PWD,98#3?JGRX
UI:C[5UR(a(Q,ZZ.0P5Xg(]><63(ZW=Y&ZLBL2b:P\^Z\aGT3\E5Z)_;WA2-N@)C
6W8gXMec&>0<O^f)2-KY@YDN@EV4O>0R6d.IQ(5^DVR5()P[HYWE)3QIFL_U\4\T
16JRI@,PKO9UQGVDcVIcD\\=<=_a0<((L@.M0AEV_CU8-K/_6KB)3:DIM92H?TTV
g4AJALTdc.2IPP8@EJ]0ba<E/4]@GFU?BG1ZT[H:^MWa\S]Q/OIL/DeDXGd(7J#E
1\MXS0#?(PdXEdGf+)>\J@GdFF#-gN7X3.dY.NRRIH&>90e:/CLMV3038J1]Mf\^
)Z4f3O1bYXZO-S)Y0S?FJHfMaE30^GQS\E9:0AS53C]SE8_@VY7dL;R@&EfSPH2M
UVZ,e2]Qc#?3CH@G>9(d8_\R^^IWSQVb1QO_Y^T3Y&2X?:VVg:;I^a:8bfNJdE(2
DZ+W>9V5.C#D0,:J(\H9&3SPg]#PeEX9\b+@PB6E/4Tf826#OS.-I+c]>c0LF7^:
B28(PG7dH\@?1E_)5ZSC^;Zb:bIZ7K@ZB4^__7<;-)VggCX?O36-Qg.CZ?39N_9D
&S&IQ<AFTVIBFM_<8;7DTI5&7E>74AXePfK[N0PG,3AIdg0W//XG_YgMP[1UGDg8
>HbF);ZdE37[LV5ZNG@e6;NW,B?6:b)D9G4K43HRd-R<bMBS&.^@]H&,dC2aKJb)
/W2(\7T\Sde-WD.MH_+8.<<+@0]C.NO]Nf4d7ZN;+2:UGF-+8@Cc(\KH/7b-M=12
24d.:C4b9J=;.<ac:^\O]AABCFFbdc[>2e.YfH_-GY2gX=Z,_JQ[?4,5I3]T2V4f
VdTB0U@DE1=8DFf@TZabDTFS&SFCC^NK,&d;;RMT=-Pcba#9\R7?&dB=Q,XdOW.M
HZ32>;1^827gSa1EGF-TCUW<773G<9f\EE7CIaDcYVcDPN2S.6B7ZHb.^=@?R0F=
IP3EZXR>5-Le_2a3RRd8FbL_3MXLX:2C\MJ_ELO9:@EC/]-@@1-TMI;X2+4GQK?c
T<;84EH4+R>C\=Za,?,g>HgW:9]cR:@H;(;gDYK+FWB]A[)JQOK>2WG#?VSZ0WI\
^1eBM7N^G0,8CBF)OE:IYB9<B@-/a?K#fQ]Pa=#WAaJXQWGI^[>JKE3C)^L7[g[C
5T#.V:V;KW^0V^D)NN]CN@Y#=JLO9/_OC6#\^CB_4/=&JDKf]I>D;^3\+)\Sga1&
:Pa8M]I51=Re]?CT>-ORgM&;<\;P#L-:WL4T:+<;<f;]Za/JT08/.WZ/P-OG#I:/
U44&(3EYEg_=<HYFdSf?EYeFIXD(&^+\gLRE+,F[ENHG:#N>,T^15Y>M_LN)/.CS
G7VcSY4@8d?ENMD]1K;1\4&P4+(VC0V];XF4EZ[Y.30O_K:[)?-#FIaSVC2;36#L
[;RX;ed7S5Ldc43T1MT8<<H.I;U?Z[]^P=\dA.8GE;_0N,gMEc+CE?#TZ=<>9-79
NDFDH43TV#XEI0^0>_IY+L>&&FD9bc@.3IcOg\O8PAT(A98fSUE5]I3JV>;,CB0T
Q-d.H\>UT+Y#FT@#\GP]([-IR/).7b3fLId78GK(3XG_0BL50F6B..0X+c/M((F6
YDU>;NfZBSV8H9Of=3d-DZ.M.J)U3Q/+&(_>d[)GgT8CCM^=g)Q_Q20/9VTE)S9R
[C^_=(HSXOV9I]TP+DK<2EODd8e02]+AT5?QQ+c,-QT)V:_(b+13c]+]:MERYJ^T
WQ=8f[:IVHF]>EeRg->/GM:QCZOO^Y<7R]0NG(2X;:.0d=\^eJ]X?F\;eEK[NS^<
V__adNc:H\PBQK;.7G(6HeDDd&HUbdUJXC.9R6B(F6UbM]a0EgVH1NS8d_E00LLA
I\P;KBAR0OdQ;SZ7b/(R59bJcFRd?L8P-M_2#?((U;47XdB75ZH>fdS^DG2W8Z++
&TRQUH6WAaV]\I)_54U9Y5&4Ggg.b/@2TGYPV;G8NBGHg[R0T+\THB9OCYS]SO,T
=BTYQe5H+5\+LBJ[@?8U6Sd@&<0EJW(ZK:OKM(cH\>&J07]S<4aG/5:WJgCA.13B
DI0@_FI9U8G81;B9d1FW9eA.[bWVHVO1\ga._MZT?G,>?F77[,f][8U5aXaa4I1D
9,I4@K.]bOA=J9\;fgX)ACF@G&[E#C+9O#=EbSG)/8O52ADDaK@e=,^If94IU[ca
\8SM1>I-RL\S3[KN++=Ja6L<]H-Wb3CfH29&ee&DH6Caa6C-f&O,RT.1[&)(fA/a
,P4_6Z).ZZ#R#4-L/b;@UPQTJQg89&_?_3D8XR(g,H2<@=K^dR+ETFVGE[X]?db8
M&#._MB(^5X/K+TXdIC02=B);MPEfLS1C<IX#M?]<:\g#e0(M#PKOL4SGSSOPAaY
+@LTX51Deb4KBP?4_B)Ua?KfAGGL>VQ2;BA]YAfI((LgHfD(SU)=PT,aR[8UMZ,(
&eb8WGcV&]@I53[ONNY>_K[79gYIf-<3WTg@;2L:M-.UP>G=//:8AIMKMe&L@IF2
)]>;g+I548B@6+,Y(V\Q6=1.^dAW5/EA5cFJKY&<Ub5g/>RG1FQgYJb4Q5RS.)CK
.5M\&^FdT^dKT-:K\YS,6/)_R;_D>EJ]L2T)->=1_bZ<VTWQ&1Wf=B7J8@-QF@]g
\<?gaLICJ?DZ;/386L?MT\Y^\)@Le9:S45;7J8PFCS4g(Q?^)0,+D_,99Ufg;NJQ
aZ-/1^5#2&4X<MTY33Z_S3?ME1VLQ-?4+OVU_Q#PYYNURcP6:_+,]N,=?^:[D+d0
f(#:CQJ\?\\#APPO1F@19QH3X0;O:PYbFVW[Oe.SH=WJ#-eR[S(D&ZL#5J4fUf,V
2;fQ.]=2f#g47eO9e@Ad8BABdI([e\QVf=90eR:TF@aWI\??RQb,2>-_9L(3D:Y4
2,2(Oea^]&&D<JNKV#[b8AdKU-@Kd?45C>&?We98&BCV,e+VT9M5^H[7=^#.M<GA
38&#>3HJB3QaeT>(Q_HS1(X\g=+=\1<BWQST6Z_\J[:[]2.HJR.b\QUWY#8bL?K.
(>?Ld=RR0Vf:CA>P_;R0R9BI;^f_?=1d#&R5>5)b^\NE3IB)&U+AZL=KB8]::,PG
F6@[+FN;I\Z?A3GJB#[/PYD.+cdW\c/Z\#LH0C6e5VFNc-5]]U];GEE=6BI&5-Ya
2J<8LWS7G#[,bE#cDgd)2cdaX59#[PUgHOKKH1E;T)?<:2(8(6-]LL4dWTJ^&7M2
/MAbI[1,+R(&K?HNV)aGLUCS.W\@:#FaOUUdU:S+3)T+@_WF>LS1P&,NI,cdDPYD
RG&,19=IS&[SLaB(>7g3Fc<UdJb\2Y9@=GLbY8GLG8cYc@4F/B=PS5Hf2Jg+aFW.
-VEeTH&;bF7gg+LMW:cDD4,X0:7E>[7R-?ed4e[6@@W6[O4O?Z.KeD.9^1;438Ea
3ad<ASf5]14B;FFHG804\K/410Ob?^NR>B8V27BA]Ye4[d2AFM^RBWF^Re(?T1VB
<ga?&GdD:(K+(gI^Q^#Y7cVc@+UC@VO6?X.2@WOY<:Z0]G)9Ca#9RW(<cYK6A2XH
dEaMDXa6I=+78A;HGUD:(5R0=32)3Y7_K\8^fW9Z(2QS\9^-<:(U#aLe^9S51a-&
aK+&#eZM070cSLH[VUT>4I5:8O\<#>3QVM=Q>U:R)<:T_7Z8^[G@d9cXTT5FgF#f
)?A3(G[^62VPeXE7C>Y(E9M?&FPRUN>>IFHaa8>1L9WY=&LL]^(P+#U8XOgeUOUA
(I/faQCL46:9b+#O:-0)W?KDZ#38A/G52e&\ZVOL8K_>0U-C?@SHM7>HbHf6:0A2
(/dJ1:6)6VNTFCM4L,D,Y8cF7T?6D-<_V5>gbP6R@HW#K^2Kg_T)5;a[T+\SV55d
O\?E3QEe5W0H^_(RC4VR1EO#\d]fg4_ba-d:Q=32gSJ[@W+X<fLFMV6-@c^7P8&a
eEO6#b?[>\Z,&U&W.ZYQGZW-C80(f(UL<6V:I=#)CE=NGfNDLHEM26683/01Y)d,
\e5HU5W8AfN:)_]WTg&A/&H6]LK6-7SC&M-.P6@cZKf=6WW6&&&GE?ZK,d(S4KV)
eR^T+5J6(XYL6K?5Le5^#c[L=@>AWR@P^Yd[aO\S8)ZJXV5&5BfQ3IW\MMF2#W2c
ON9g,g3gI4_#QSBQ;2;d]H0+OEM?1,9HB,9^AAP6dYf&=S2UT_1_>=SU#MZ>3S/9
BdLHVP5I#?c6\QYCb63H/b]fM(QVTJP8VT@MP1>LXH6GJRcUI(>7FS\2-0Sb?fVf
SbO/:7\UCY_cc^2/d@Z7@D7X?5I/(eLPE[:U/(::FB@AU=XW_/R2Y4>e2R>GV&[d
W+]<9[0a.Uaa9aK)+<-Q.&E@U;]2NEg)6<VQF[EOXVA@54S_(PX2J9QM@T.JRC(c
M0PE5R@C3CFb:2;<RA8FC.DVEDOeTU0e9Cc+MTW>+6.&99a2>Z;<0[dE>L]b\CH1
LB@,GR:IF#^,G\Rcf]-?,YD.+P?A0@9AXPN7&ER=GUQVZb,R=3&+?O;<I:.QE2+]
=R>#0K68M]P5BFCOBN]Y).3G5T&T+8ZYZ:JII/,adNL>U32JBN/Xc,BWR5;B5JQ+
#dTf_LLefKAKASOGaYTSE8[NdNG.BGb=>HbE.:3P?JIO^CZ1gJHSOfb_OGB7b5+J
Df@[CL3ZJ-^XBZ@a[B=JL]D,E3=RGGC[2>C(^QZHY<Q5WN#Pc_6B-H(7SeRQOG##
Z40F5aTY=E51XK/J&_>]C8MC9c_:OTB;eVSe/F/f@F3QL2)G,56#9#0bcWZ34FRb
R8d4QU7)/3L]PeJEGGR^bZQ[O-ab6PO4Qg6\W:+U+)5IW<YY7bUGfVYN>K2QY#3C
3PGc?4:BLdYe<[Y2VY_C3(WG]9<R]>,73eNH+gHKXQ;SA+F=W#_@[&3K0.gc?V/_
#L5^[PW:a,#1+2g5g9HP/G<0NB)7WRVJdT+1V54,G#EgPWa)gbLfb/A[.L-[BWEG
g:832V#&=geW.B+A8[:1\6PQIN^V(f&O6--G;bc<;^<C\C>._#Nc0^d1]85JPD^-
B(Web[03<gIW00-.4C:[]gOQ,IU6N/();LGbU#A.R.^+1H>Z5U_+:+96_?NeM\O7
7YWDf#0]fXH[O,+6IE+TOG@?9GEXNNCJO6AAgCCK)1[BJT/N.g3Y.)fT3.1E&c=1
>G#C,Y<1d3E4=I;0=^(XL:KRSNd=IP;OCL>]eaaL,-cMGTH:D[XUfObP&,&EZU#+
RY+FG[SegZ^(9W5<RISG-S&7[@f@U&dQWF(:K-YG.?=(Q[-)7-CLUI-;,ZAfXf)I
/8&F(HHbM7)d7>B_Z,+g7d)MX_4VVQW[OIZ<ObGII/Gd&TDX\BfJ,U=XX-0R[[GI
bdCA[UG[/1+d-6(6#33/@?<D)X+R]=B@ONC7Vg@>G@1I_O\]@Z/_Ng--0731LC3O
\E=<RRR1&C>SOa7X@UCe0TYSBJ=47/aa--;3P4E=.\/XST<>X/JDSe>809R_U^OH
:g;cLX<Uc_6KccAaRX/JVW2ZLK<fZT^UKE)]QReFe[41O\+BgZXH_:1S9IHS16\e
T4Z(&d#KQT.TJQ\=CNZ\KPES+E/dZ3=,,B[49(-6.SdX9aXLHdKDe((L)cNQ_9LU
7L:STL2XB/[(=LD?S5A9:7B/V/=f\^\-_7WN8RV=5@TR@@+>,QK8_CEX:00?H1f8
)_Y8fD^.2Z6\/DT4KeG^ZBXA>>e&W3-RWJ3GXQ[:1IPI,Y65S(<;;LgFJAYXa1+@
I]&c-D5FGHN6KfHG0b;\T:RI5G->C4D:A8)EPe9YWS--7;)@1UN8ORc->X<;UcN?
YNc0O<d6gC3R^UA^:@56#J5]G;)IUI6RH_7=3I^Qf_aZ)LBN-,H2DD8=<0QVD08F
ZK30&M:/_4:6,8^GT3G+?4/M))8a]9+dIY@#;90:A^#Pa3PG2C>J)Mf.gNSZ7>WA
=_I87f@V@(ALA)b(/?7IU?4C8b3??24AI2dU^?.FT1USO-OR//7V+K7>3Je&^cDP
E<-g&)]eSB3(9)V>Q&FK-#<<@X_A:Te;IW8JKb]Ge)(:0gO=,Ge849,W2)&gFM:3
/cC@SVJ5#)^b]<cDaICK2)Yf?b<2CJ>Af_Y=_&&.J=AG=8JSIY3CB:G9f)#LPM1X
38<#^NG6g#aN(L#BZ6I1Ua9XH5F@b>:(S/ENDM.Z+<5S0[(V6be4Rg+gEILG=TN+
SP.=DXUU39=Od@9c]4IY7[cO9C_SU;++:eCCQF-W:3PFC)bGf_:9]4[A92I+MFJ2
JB,+@Y7e@9X/<4\6(UMD(H:dF@G(9S\4RHH6([bBOAU-@.,24N+YRR.\:X-)P[Nf
GHcU:(L<_:H^T3:(-XGL;EINT6/(cF7S2E,IXcOX[/W;VM2Hd+U9FE;RTb18^4UN
L92HIEEC(@E6eO6.72?D>F^1G_E(Rc<XE//[#;8OY\fT6V&M3M0,@YcPY98ETgaQ
,>;NAZ;3>K/C9#SU\)U6,__=<G&.XRgD<=Q79T30#F)b#3b>5c.\OI)Ge,X8[>.J
2(:47B(g5b/N#Z[PB\JgeVYRO,@&^L-V\@>SbKa[/-&7AcHZVBJF=0A)TIQ3F87Q
H7V^V4GQ+_?-Ye]aTYCV:-V]bed>-EVNKcP;OM]TUW:^;VFa2+PdX7#D)96I626G
YCOP;Z0:fF1GN<D+B:d8;3[(DK/(G()EbKIH78FA5QJ+cW#=d;_Ta/J&3fN@:TNW
718K:0V5O0>.[J\aL6H&[J[(8$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MT35X_SDR_AC_CONFIGURATION_SV
