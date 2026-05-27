
`ifndef GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT35X device family in DDR mode.
 */
class svt_spi_flash_mt35x_ddr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_DDR_OCTAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_4byte_Fast_Read_DDR_OCTAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Protocol Mode "OCTAL_IO_DTR"
   */ 
  real tCH_OCTAL_DDR_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt35x_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt35x_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt35x_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt35x_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt35x_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt35x_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt35x_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
^##_O=_NJ;,ONR:7e&XRZ_BDTD:5]5_gYG>K2fYJJ#0_DKS;+e4Q2)D.UCF^,-=8
f/48]D?UQH2G3WS#5@:KRM9PU/YcA7O^O6<6b8\\18b;)W.]7=@80#Sb/W7fMf8d
gHS_N7Cc;U.d^@+,MBERdAG0Hb+2>a6Xbc<4.4]HZ#1@>2RA57ReGKb9^<f,W9a<
ABS1FB:8,Ub9Y-_#aG:)4SID=?KfMRSVVd<1P+)f#Ya]NQ7\B/PCPWF//OWQ+/K=
O+J;Sa[b\0_H>[PXeNb#I__R)2.Q0Z._LC@7R-ae.DZ[=ffMO<OL8K6L+(85;Ib5
bMEfKH(T#3GE7[-L^CV[3daV+7[H[T6DN&G<07ZU7I@\44+:\2f-X33ccXfa&S\@
>gOb[NaZ;)-9PW75dY&J\KIXLHDZ4O+PG#\>ED9+>81#5;(>:NU/L]\[0R-=V]]>
dbW\W1@MTGKe98a/VLP^(G[;_]b>;2SaHBf+4FXHA?7J[1aHAF\/T@)D7b:f2cCT
4UNFDG?WPQfT?HHPZ/)c1IQe9<H_F4?&-b.[U=XBgUgRC9<WH-^#J72\RK/2U85.
1YYR1DJ&Z1#_XAZ451F\HdFc44)Eb[=ef<)KF/BV.:-3RL@-a@C\-K5SL\A5(^UM
9T(1K[RgAad1NE^#/e]6&W<=/S=3f8A,EgK=:CRBA4dBT=VVYTg8-,\#70(cC9a^
=_+;XU&F.UK2#KO19>ecf_/a5_f0eMS4f<MC\a^<W46L+O<?7V+Z4fC+(@V-)H2,
;gI7_=X4H4O4R4F=Z>GeF</a5$
`endprotected


//vcs_vip_protect
`protected
b1\4g91(97]V47BH1Y:Ud=:B(E#4<9,Od?F-=5KBCE;;W=3df:;D7(Rf(NC9W:WJ
23&IDQ:,d3QLGECC^OF91Tg?,TOE3fc1JQ@#W0HTU@/dC-)DU95QN8#::2;OZPc6
?[SU;?e3NNFFN\))_><VZf#HJ1UCU:Re^HCLe#UAS<A)L+RQKQKDBgR-[=IAJ<98
aFM6GOO0fLH2[7KRD=AfH-WaC//0gaYK_99g@CGZ:IQYQO4F?)FB)e&g.LP.Gce>
O2IR8?E@fIHc(:APJ-OLK.WCKBM)TG)ENOZX=PX_CaIY5GOX[I]W?PWd.P2+BR2S
;e?W3ZVG,00d6Rb-B=Va46-(A&Pe1-4Ya3:O[EPDeZX+9U[S7XT<(/3cFcMCUVgR
8O1\,<E;YA&S8<[b>)J:,;.?e:AYEVL?OQ1+aAZN@YfCIbedQZV\3M=WbRbPXZbQ
KP[YQQb2QGL]B[K7\1R;@P&[]N76@e>>P@13W5&RG&CHO_MO;Tf<,3Q]R/44L<:@
cY_>XRI7)VW1?4HOBga)3;Me0+7S@RP&Z=D37MM\ZR+:CEPLI:XgQ,3Dc5g\8e0)
5-Kf[eX#57Z/4GI7HL_b-3(2LY.Y8>NCAC@&9AX48^UaFP[\1gXg3?\PRI/ZSgBX
+<3RN5SDDNZa@&5UAX#9E0WAV>MI/WDS<B2\dRUbZM+VJ^JX[-S9WUCM4WR;_CH,
-HH1D@A4BN\FTc;LSX?bcg@)R692LXg&Y/eeDKc<f2?<E((+/g0Q^3Wa>8UUCXCW
fET:SW3KbR0dJ<gT]O)WMQ[J328/CROJJ)1TVL^U]<Wd4NaaAc2[JF)JK2-_T#Qe
.BEO2.<E5/FPYKRW44;ZHTdbg7VJQXFdGfA2\a1U0eI_IY5G\FQ;G[TQ,WJFaEbP
W8ONfG]V3GXAgDF;CICIC6FI8b:TFOE=UY:#6R4N(Adb0:ReBWd)^NZf3-cd(egC
M-5W#Pf-Z51^UFNJ@#-B=R5@7Te_S6>K19K@<#,8WU8ON01E?T11Fa]-\@;@XWBQ
DIG-VEf7AS5\I+6a4YAA?W;NTHE:?E&;7O3[XCHC>Q5+NdEg?eeO5KLT@3<@I0aB
a)0a5C#PA^IX.d6(E2>/WYN:RcQWBfW/X-8342@:Re-/7MB80GbRP[N(I#fV=D.L
J0)L]0+U@5VMLJ9.1@IdDI@0cBaFd[#Cf^J:79b=:AE5>:(Yfa^MTd-5-C@@GKc1
\18O@6L3d/?GKgV_R-VY-dBX5K3(GZH6^Fgc),W4[bT2cD9B90Z&@E4b/^US=67R
OfQ)OJ/b;\7AYZ;@gR9;I;4]cZ:2EO\8.P;V#eN9dbMU;=1O17QZYH96C<bW2Y?T
K3MUW6V1-Q3_3#;LgH0c[Vb<b0GFLLgFR5]U7PCXJZ9<R?a9ZVa<F5/\[M.c79f1
MMT2/=8\(Y.W[-e2=cMUFf@0RcIaQ1C0^/&DIbWIHYBeLE>\EUD-3V3)4E5e]H(E
cC2X#GG@DE3b[IFCDgO?UDN^,F^S-b..WYD5ebfb)b_-[K7c(aB<G;?;A?QVMZY.
]/.1@?Q6]7Q0d0G-fbX1J[3e>FCc/;9,L1TD9Rg[e:1@G1(aP<W-LWZQCEAEC(PN
cN3C91<WY0JCJ>59&+V>=42/-e^T4F&:?ZWO5/(O660=gYbCW2eZ6-[Za<RRbYeY
-G&6E)=Ng[g?.-]W4.R:540MR7eJKHW>+RB5g0cgQd59U;+VE_]TVWHN(=fL53<:
2b=2B7YaPBIU[SXB08<dO)Eb5FM9.5V&:?O@4:N\J-]/-?6/J./;ER7g4=fd&6V&
B[JK0T#FUbRd]53=XI2+QY/YY#W)+A&DKVHB434\<+g(RYMc2V7^f-B-R+W,>C3Z
QFV\FC[8IYV9/D_ZOKcN.6E2USf@dN#2=,BJJ+e-^e#ESa\LOA#Xe5<M+KF<_D^W
0B(bT7+,27=5/D<,.C1.+568RG[,a^EE1)V==1CX7a^Vf5R=50L(\LaH0XUA:ZR>
?Ya19XURQ-3R:7E7&ULTR5cQLVY<aMRR+UR2N6>\IE<TD[0D:KA/Z=MAMc<BgD:@
?6=b4C;3]0XEa4.\.OZc[SS&2KE+M+cE@DfJGFQ+e_\&THL:Z5ISB2(@+-#I&<M4
C9;G)7A3&c79P-5:e^,ARF1Z/[UJQ)]b]>VOUfQC>-;_<PHG0..-_G[1Q4a(XcL3
26X3dABP[LcO-Vb]7VK+#>ZE;,d;cL#O9?W^X@P\=\1;)d&/[JE?.JM92YX<Q]0T
:B;5QIKcP.gdL3@EO8YQ.E^Ae?Q6U<EU);HB8>RRg-#>K_0[KdGa8OC,7U5B+aY,
60V#JWG/69;,?R_CXY47&@Yb_AVD<cTOedXbe6(>H)1aQWEEJYAW8;CKH-,5c>74
^6;GB9QA+B[>M:e#YAae-fS;764_I-5GGQ9^B3TLK1fUA/\41f_<G2>SW)9RU;&E
FPgX?6&J7Y?/4dI05\E8[#1e-LB3Decg^?eO?IKVJ_O#.WBVK&[3\16OCSMMA4Ga
a#Xeg<0X8#QG;3W8:Kd#B=?+Cd;B>M/.bQD>HPTR<6dCJf;6d,3?5G?PM+Z06OA<
9O:e^c5H>X+D167QC6LN9EX:OIBJ,&]Y>De5:NLVee&0,\Se?Q^J0?WN[T/:[<8X
7#f>7D&]U:1R-@6D4ZFCdF&(7LUTZFRgc_J3Y2<dgXeO^@IEG^f@\Q-L[9fFdT20
VE1:W4b?=@fLJQ+_HAH+<(SO@b,MeLZZ9W6[aG:bV[2DIAcI.?MVa&H2OYGW;ZHU
Z9GDLEAB)P#G-1MLX#I)TfA8\D\4@Rc)db(6,_ER@.F7fG4(1ER@.I0?b)HVXCRR
=&G-HGY/CK\)-QeKf-LSU4U5JQD.(8f<+&47ID[3e\USDDS\4UZCI5gHD6<AQUae
9CIC>Cc41;1.^E19Z=+Z.e)f[Gd9.@^(^_PXOL8?IOH3[&f:I8KE_,8X0;B]/\+U
5NJXb_,):;K8+7T9/?P0?aM,@-N<-dG14(5#>B-L=FSH3:9e?<\&VQ8+Tg6=J7Q#
MQ]F.X[gKF0JODaDS8?S5_faLGHSLE(<<CMbNE,HbDB_#0Qg-GH64f]E79OA]9O&
BXZc>J12YMA3@=>42?N1Wd1#Q5E=BQ_ZI1TcR)-L/>YJ+)B0HL4W:[I8D)CbPdX0
[H7].Ka>H;a#OM6BdcV+;(JX]#<Y)[<IWg@8WPeIZDF?LM938Y;>/FV32&g&69HL
J+f(^3LM(;&CRdDcSb^2.M[PWKIQ&<3[L1cSQ4Y3M8[]aTbWEP-RF5-D\+J:A6#:
7.;<9PYA+B1g.;B.:+]]D.ZM^+C#^ZQR?Y,-[+MT1K)(10PBV[66F)3_^.AaTHaL
dVf<^?RX2&UZG,aU6:5VJ.N[O[A=?84d;1I61.R)KIB<f5C#&A>XX)LMIB@I.1C9
71+0D5YV4J)F;6KIb4.U\cI\P[EFT:AK5QGC4W^3ROeMOSAZ7B\KV9KQJMbOUIM/
EC];P[\/A1V_aGReYXY-\ScSf\+L0Zd_G.FJWN6O627H0&]9Y@f=:OOR07g++X[V
3^72-5<d_C1bJbV8Vb/KJeT]#H]W29PJW)K.ac0Z1^;S/6N[JEF/B&\J8&d;@1K\
I.c/#FCP9dd8_N38,<)8+B4Q3DR0/(gX[eBY<2\,f6g:cR\P\RP_]E]LZ47E8KZ_
>3XYXBMDX8LbK@2-C4LHU(Z7NCe/8Q9d6W>H):&)AYGG(+bcKUW?+18YD\@/+\;O
S8M+L:7.@O58JNeO]0Ne?DL843C:=6>)6;;+/(=bKG:U#5WBL>/;LZ.G__V_&b@W
[A5,N[eF0EMVFa?Qa4,=/QJ<L@cQ:KLeJ76))XC8AfG+S<2:]5?C2DS.[]<RL:NR
Zd-0-I_@^<T<]A&V1b.&&7G[KAO)=bA.[1+=^Q[KK9T0B.Wdb-&2E;.e6Z_f8/X(
8MG,W2/cV3^<SV[&Y:b\N<ABY\,++-92C23E5#DTK-^:O&faFB3,\-Zc<bZ]KGHT
A@SA?::90.H50.S(S./PeG\K(J)V:)/b[]9^Sdg0AgGca4UA>CT1]6\:IL&=/H;E
64=_Fa1eD/I#Fc@JL#K&e&=./d86<:N&].0X/M-)Z7)Z7KdLQM0NI(&\fWOgVMV#
g=[WAfcDdbHgM1W?:d\&#^O5N&8J.:R+LXd36E\Ha86\EHDJSNa_[FB3]:SBW-d7
1\>2)JZK:[0PVO8XB5c9_H#RV\BS#JX=:^e/CMb_^0W<H>N?IE_MbXMZ:]_F)+d@
L66#.IeX>;L=)Mabe^1ET_4QH+/gU_C)Wf]f=LV[?HFaC3=/\^0V0a(;;Te-g6^J
b:SS7R^8(ODZ5b6[TL9-G86,,g(=8N15EY<GDQDK=,MQ)b?^NdKB9C?2(C3(?:&8
45#gH7JW/a-SLe0-H4b#ZDbIOCcbH]P=BJFDDU_\4JY?,bce5dO?.MGFYeeP^QW5
2,IcE.0c_1G1:75R6J_<=]MFEVU59RT@YNN#&9D4CI\\(D4+c<L0g1eSPfDA^C#X
XBX&EQ;J^.1/<Y)5=U4g52K0,,NYE&7Y0;<DXM8]SQ3CUO+=:&-_@;^cU.Bd6A#\
DG;N)/g8IafC<[W7GQ=Ua9SQcK2#cP/VbDC,^S.]\BS>FU(+0I;WK_^1J1S+b0@5
a0&FO71Z?L+5SX&HF/NV^.SFT40;d>\_Aca@TJ;#AJGc<d4L;M[f>7fL1-Q>K]S[
TM35IOOQN;8DdG7B)cSF2cC9Yd7KU>fBVBF694]=TN;-CdJ<5#_.Q@U<4L9LgI#/
LXT9_SeBD3X?CE-)><1+&,L+b)5.T7J<+E9+G2V\==RdS9[J7&d);P@c2AGVZ=WD
cPV5aYW@e5I1e6D-[R)]U&[2J=94b=;+&9gQKL/>+b???T<Cc+g<KaTP6YLf(:FG
VNR(GMFH.TL)0,=(K,BUA>,F;8PO<JQTgObOELPGDWNEZRD<(Ba[<+K4f0(]-;_Q
2Y#7WF1R;dMcd_0TU+:(,(G.2Df[=6V^b_S&36RG[(D><b>Og]=S&GXe8Q,aaW;^
5Q<O0]dWR2E&M2e=>aSa7.e#Y^4S?EFQ#7C5XJ/c4JG6,?J<+AW[-8c,3\J\S^RH
CbNH0NcF&(ZME.E2If22W5EU;4]?(ZS9_M96SYb+</[H.eS\Y7PM&#M>H8L^U,bd
@UV(Y0\82B)Y7D9]WJO3_2?YF?,BYa10XGKL.6?dAa[E:)7f6AS;3=^5WUV>FDU7
M5_(:)U246Rb5c7@@9DXb#@8^e46V/aI[^44VA.2VZ?a[ZIT>C7.)YG@,bWR5RJ?
=L#@UC_g<BSfaS-D/6F6AY^AS^J6;,.FQV2OA3:[@bAcd6L&Tb4f;=NQ8?T2WabU
<D(O1.F7+(HgP_O=BR66.^5&CY=,EVSOPC81f6>T?)9c66PB3EJ_&(FF3649UN/Q
(cJEF5/,U@^1+,B+KB<IU\(Q]KST;R-#K6IHTfQ:3\-615?<1/^@Y<X.a+[bd5FI
YMI2V=+>7-[:(P^CAJH<YC^,?1_]e>XCD3_aA++7#Eg97NIPg<?884g5_PGK+dEX
5;8H;I4D,bKGT)#KNM^JV^,:8Yb7PT_2X#g4[&21ZeQDOR2RZO@Ef-YGTF>T_<;f
ZeL2[P,\c@+ff>c3f?=0(-9[daKK):=g=QX\4\\>OO9G&BD&CU+W-<9?Z0e>8)b[
1F>\Ef__&7R-,V@@aPN7a@VdPVX8.K8DA:,]^)bBO5G?DFW4#Z.Q;0V__Z\#;[C\
d>CLEGAgM)]3&DXN<(L(a_Y3g\]_e#^bA@,[\MDW)6Z\3K6d.MYI08JE4#fYg?/<
a0^8E]YDJG./B4I-T^1>+IFI1f>GO+5#\DJZ^+.]VdUTP6U^R&A=&/@2U=6.U41E
-K)KCHVf;c)88I^J<]YWf>K4W0_,TE:H/ZU6U6#P&KMAYPSdLFF+Q<bWYGHLR#_K
G/ZC]3F1</X5YA?SO]?30WP:BJQ_<Z(V0(0LcOZ)/a.c]&a#->V+YQ^#fcd8>.SO
[HD+G,&WKU0DWQ#0:^LF8CF.N5[OYd>^5;H)3T+ORB()/\:VT-)C^0a/G.JMVXG8
d3DDJ]YEY@+K1]GP]S@X?UaNQY&+gYPETb];=+MY(T;N(;#2/F.GMQ4-[cVWU2P6
JAY-&,A:;\@Cee\Ra?I^92R?-B)BS-2FGUb3;O-RSL8/c(^5EKbEM[cZPBg+R,,N
U+f[B<E-)4c<)G:,_f8LN6g^ZC&NE_AdJ16BVILf2BECAeO9MBfU^UQK:]?KKSe?
M-\=Q;V:6.W0cg9JI22HF+84TEB+<IFLaA53M41:;Ne,DWQYHI]&2#c[3B(GaR6C
AKP1HG]UF<bUF0MVAD_\[#aUA/]2&Y+A/6[\P\dbP;Lb95O87BXZY_77O3WcYfG#
2EP\^()Y+g>W@X@&YGCHW)]_:aM8HJU]g(_V-BN\AG95AWDBa+2]P2ALeCDUZV19
^DE4DeMX8.XUKXGIMQMDH-<P._,M//<X](2fI\O9a,RR2C>EU?3@+3RL8+Ge17c_
#-Z6KN#?b[f+4Z:gaX7HU6&5<-@18P2V_VA2^NR0XFZd8Cb(VX+K##55E@JBNN-^
CR=JgVe;aJ#dJgXfTH](1)YU&CS<F<DQ4C9?I+_M=5d>=?=S<+d_=f?<-XXP2egE
cgM:A[e=d(MAC2/TZ@M-0^C4SEZ(=]?I-M>O6EbX_bLN=eR@K:X18<@;-gMB\6(O
GbPNZH+?9M\S:QgI0I)aNNfZ]P<d6M>#KTCU64//eDF,D#g0J:eNdI42;aU27KUZ
WQV?_>cQ3:B,6BG]A:ZV_6#I_.-BN(B#J_9V89ZK:FQTJ/c:0W@NdRb]/;CA_C]4
XVXCW#d7X08GZbb#EeZK<^FVb=_PJSS>2<9M3K#WZ\>(9VRT=P<JVT1F96[6C&PJ
BWSMefdYKBB-_=&3)3AL7(46:6QYfEV7cB3<g]W<5Se4^(#a#Ogc3DT>I+[0>XeV
U2@&\]FO-9\>DdYB(#E3#MTFD(L2<>G.J,;CB2L,=WXQ,IX(3(f:Z#LZ@PBL=T+/
N##HG:P88b+O6#RS>O=f7G,:6[L\7g8?LQ6[L@@M-8+)0N=3dV6Ia233afL=HG#d
0_D)A+,7(#P84dc\6Le)<b&1(97,^/C?AQ/d(LYgP+8/9V0@?0O:7=8P]3E,],L-
5Jd+@>J^5#5T_YI.SBW6<)@RI,QY2M[[H586)S83.(Z7D#BVKP+03>gb.Ee[M/10
6XN,4&_/TI=.a\NUONOXMQ:9,8RI1&&UL1+bE#HO)^/)#Rc^LU7&UVaO<04INCNU
3egJT3G(8Z>DMLX-QB&)QL[K^D<\/&KZa<6CaI&@<-XO=[E[6b45_9Zb5/;^\^@G
2]<9cOM3P.ae2[0fIK#]GB2<c-BGJgEQOZ4<\aPQc1I<VG#VcN.VQ+;)KZ@<7R7T
eaF^Zb\@+bXWU&>aV(:VLd#OW,L4:9IKM+SJEG8;1TU]U<PK-<:3;B84_A5HG\+&
M0#=@=cdGUV-?e+NRT-.b:/bJMZ#)HY#HgaHbDaW;J.J4G=W&J4f[\212PIJ_AN3
Z>cE>5;dc3Xed8CV=WS.17R]DHI5JY_.2D-^aWC;YU&&KQ<U]K?[g86#AOA>GNH(
AG(NBV&.1MT+Nc;;UU6)N.KA9cLKAL>f3.)RL94ELVRg:f<QITT>;(6PX/NJbeB4
/O&C;ReT51c6eD&4)S-9-2=gJd:W+\B[V-JL1a-7CJP23DOB>De><ABJ?3(RFO[-
Y67KWGOA)\UfI]gZ<>e:_GK^V]:T>TaWF<fQLC@9c_HP>:W&Z+W,NDI(L.I@9CNY
Vc@R=P84EEY^8a^f5;+^_g(5-fYHFfQ6)a[WcQ7aZSB\>Q7(dE)#/H;@>4)ML?cS
=HeWedcR>]?G7QEa+KQ2U/LN.:(cOZW@=S#UY>/#M5B;OS4M=,-BH/Og8#/CX;ES
-NK[PPHTAfWB4[eAUHPH?XQa.+;S.UYbT:)^^gg10R+8^<\S31HEEMBPH@=LY/A-
8.?DCXdN8#:EVX?,>^#H391SOP#J3]JNe.gFZ335DVZIUD5]:>1J8>If]]LZIEg6
;.6NSR]9eeA<T20VT2)eMS;ZMP_<9F;6V^OWf>5A66HU0U0.]>\Z>,[A<DfE>R;N
G4+<&RBG_<&&)K.G3B0YA?d,K[(KH,G=c0Y01KW1F.^gg(+YHGPD__=4:L&5\VU;
9M<,/^AbOV9.)8<OdF^HYSB9LbG;IH3\S/T;/5-_FLXT\^2]^&aY,d;fg:dXa(6a
6a\Q?PT)PA-SAY?YI,H5fa>?>R#0(6#:\9f@/BLQf/:@Ke[9L_C)V&51IH.4>J^;
b.],S>,Y=XC4KP,&OCEKWGN@U6KNF>9^F46GT/HJ.^A;ZHVL81JCWf1b:VO2@^8J
]&?V,T#/H#CG=g]<&5g79/41,5_KKCAMJAZHfVSVF2^g88eFV(Mea1MN@Qb^\?g2
6<BM6?7;T<58QARD27[JPTB;]dY./==030QZg&\g1LOU/aX<dAFbU&d57#c.bGLA
gH2U&H<9-#RM&dO,eDPf(6L\>Z4a+,)g;(H=ER4#F(0Te?R2+Of4HT]V8JQF2LLC
VbYBNQEfEA?V^JFH8N0=eQ:<3PQ-#3.fOg/NXK@1V<3V_Ke@NN\A\DdO8f4&g\8K
/A>HW4BO;Z5:>e:,J5c^OT/D+PSQc#NRYM=,:^+:&QV1.Pe-d3=\Ha[ebOGff:ND
MW@TQIRQFE1Dd7GTI>U4=OI)CaeZVA]fY/W><&#gd[SYgNDL,5LF85UE?]_>,#T:
Q,6.PG+.Hg4a1AOIJK-MOEc?5N5ASP(fK;&57-f1A&9YQ4bVE54(L,RHP[e^-ddX
bN1VEd3ZH4OgTVDAZ;0S_/I-CH583=\UM_196OX>5fbX))N^5SKI[9c6Ke/Gd>ZI
F_CUP-C(]NP&MP]3/:2+B?eFC/<1RYg&J_K/HIYW03f?WMU2]6[+@\K?e5:\7feP
19<@;;/OZG.U1R.ZHYQd#:TReO_Q5VfI@>:FW4Z4=b0e6U3+>8BBH#NP^f&\a,7Q
8P3FAI&a5ZgH:.;g[X:V7VX3HY_>LQ=9bP>&):X[566M.1,79-I+28G1Sfe(DO2(
f>V)0)3/:@VL,Ve#0ZG/Y5EC@-f6.;RTPTM-0[BTS&V40cI#KZVK0&UDdHD+=c[>
PFJ&[S]gFHNdIZc8=]4\3C,,X?,>Ga7bEVeXg)R^_N:[AQX(;1290KRY@<T4)CN+
\I?4QU?fF?G;4Z./fNE[M0VUOAO64[-48AW:+>NCOUTJ+894d#g-:ND^Y.;<D4<:
55(G(JEY/V^7&d,#:Q3Y[b_eW8+XO9U_3Ge8.#,88W8e[8g(-\/].a&ZC:D1.1J?
)2Z)1XHIK(]]8/KYS>B,GO5ON.5]Q(5R(CMH.5Ze]VcUV/.]O2&g,_A8Mb<XB_Z_
MT=E1&;[>>=N,VKDWW^L_C8B4Cg(,,A<>U.aKXM@AAOLR_<a+[NAXO\JC>J-LKP6
?23?7;Q[#<XU+T]H]84G\GeQ-M=3T1]0)@QC?A1@BeGU@UE#RRU01KF\8=/cd^O#
R;]^6HB#QG8a::(f6HKNA>]3=aM2(.Lc_EB;:MM4F?;YaU43_0b?6\+9ZbFg5C[J
AT22eJO<L#_;T=de/.(g)dP-_eFZ1S)dG/<^P?.?OOI4X,?d.C#/4\\:+TfD=Wd.
>QNf6d6G73f-=3B>+P):H>MBAe=^bEEU#-<Ye;\b#>3)[RNM+f)aX4>_@0dF^2BM
/=1-d64K2]VP,0A2CQI&>E5<(SU&8R#^4gd_c^2g3Xbd[2=<AbK:aM:QS-e?[4gP
3,b@/cbO3N)a5?_<._H<U(PeP:FRC5W__dX71Be_9dEbR9<5gH+ZNB<FF<\@/PC1
)/-:If@g4,;YfU6)b?8<2g,S8A],TU954Z;@_ZW<RNBI6Z.+]g-DCEXIaV&/+)g>
Z@#OPOZTW4G1(+5a=^&IBDC.3D6G6_[,aE\10OW@.-=MS@IQ)-A]=2Qc1bfFAD9^
QA3B2FR:299Z6aO)g_>G:YD/._4>&MVJ.@_e=,<)P2+I54M43X.\aGfa#[=FR7<S
5Nb:<_I4[6Nd07<55NZ2&F\@8Z0a_),0LL#\>ad;4@[W26f8?G[W=e&<O5EQ-E&E
gB)PeU^Ja94)R7Cf14R+7P_1_9Q_O-\EZE87MDM;G&DLOPVcD08-:Z34@NKT;]WO
[aE[eP^:+VJJJ.U3YA:0(ZEf]/1f;FS0-H]g(fDG(O56S35CHZUW66\FA6Vb8aBM
4SR(Z2CaNJ,&f5Q<O[H;2T^T@6bMcf]IdF5A\W?N?/SR\B\S\PJ.92>b2?1[X.37
NO1J@gQWaBd^YDXUHdI:O(XEBObQLO40W)g28B2ZaQMY5E(35c2WJ\=YVE,4>EQ(
2bBL)8CC,7Y&JaRIeW#KS)XR4DBJ=V.PD_A0@0g]#A[c27QI_=>Gfe=9_ceOD.d^
<cDW&25U9=NMbO546O=7NJ50e4e.RJg^T&21bI45?(=ALeI=)Sb17T04<S;Rg<a4
Cf)JLB1dNFSP:EYc9U_3HLc&7]SbD><b?CTUHa#g?/eb<E<X#-?/9#8R_36N/9;4
7;O]E-\[.NZ94UWWFBf;6:R/AeO\eMT14=1ZC4(#TRe5,+@LePP1<[R&>:-(baQ=
GCGZ(6TJ#(O0MUEdTT\]M1;Z8)ef16BD(M?2gUfI3B@&[3D\O.(fK][5M+M.>T4@
]Gb8d#DZP@]d??aS9P>^J(SYcdA]3(&J2ga(#FX<g?ZBgK7K+^QbN(D>fH8ICR\N
C9CQ4224_#OQ=/Bf/7NX=VA&ZgQdL@cQ3Ea9gFLV1/b;[<W^IU\0.YE@]?-YG?(2
?5[-_QY):--LOg_^GIGX#[4<W\L54=PU>(^.AFT+E>]>TffMJ\B)O9N8+cF9^@e]
R8;Va<B8UT2_+[aCP#..24GIHKX^&K8>O@JIZVXHRP+CaYLg(FC)4>?,CP]KZ&5?
,;N\BLdQa_P]aFH;NAIGf4P=VNOUK&Qg0I9Q41#>IL7T@AKY^g+)8024CNV,f],U
SS71ID2HNg=LMOdIBL.e3cU=>a#MaSLK69d#CZA>]H3QG#3GFXe[@E54;<\=X,CT
]Z8BX5_bB,L=g1B.Y1-3P4<L:6\]Y?XF.&<V#BS-HbK/eK&X91cI.\.Xef)3MP8I
3F:I.K\NEIHa0&9cXLK>9QN_-Y#.HY#=WdD-F3DG+#/&6FU1Vd+5M1<0:83V/>M0
0)U;[aYN-LL<H#@W/eO&YBg<HOC[+UeUUQPF.>5)4L[?_QMADeA&c>WWN]1M.YF&
WV,HB5C[dEeB)J]YJe3c##PFg:IB#;R8OPM?7DdB\^RL3C=N7<ND?Rf+bCPW.KX-
CHIGb0I3.#)884RP2dURI.1^dgEA,^,f6J<0g7@[g\<3<Yb<W&@R.2^e2Z/RZY/\
+U8Qd2cbN&E?JfXc3T^4G9GRUL-7QbBFTceJ<_Y,/7;4[.M+YR-3/]D>&>Z_D[,Y
:a61JL,^#&b33VPHX;]M)1E+QbK2+gP:83IJ^K].2^LAf.Z8J?&(P5_]+]^WZIR9
956>]WLT^=f+<D61:AeLCOCD62Id7-,6-g5fD2&907GQSZE<4GVJN6.-bZP0eA8^
7G-L1-#g&e/?#EIO<bQeSHCRd\\fSZ>&8&]=0dG;SAITGgFFS;#?)8_FS]OV&GW.
U,>)?0D=6X#ZDGOI^0]GEcg<H@()4)89]6#:,,W(Kc=IQ[Kg_N6a1,JS#RJ\9F?(
D[)@YCU4AJ\0>c:KH.-ZIZ);82,R1T/_K\J;1EbJV\NC([3KGQXD]6POYKPVc;f3
&FP0D>KDJ[c.7Hec1]X)a>eUJD).>+/)c752V)T.ZdA8UEC9UI_U7R+77R(U[V+6
O.L4M@\0J.M6_H#,./FDBf211+A,FC.Md,YW:YUT^bP1,-7N.GX/-4+HB.8B?Kb#
B\32f_W@,8XBG-U)I#EbBTdE4Zc=H<XV/F@Tc?fK71@KGLPL7M1?\-eHa+/3#X/@
I=Y1.aO_BcYbLG;dM]-YN-PcXZ>07E9PBMXc^8dPY@3#&cFJaRYg;Z7IXW+PCOI&
\HKCHFC;)(T<M]E&d<5,Yd,3-gPaU[NIaY0345;C2IGAA<T7:-=SO&#6CG=)NVD.
&JN;LcZ^85\;RREJ;0_S?H&E^S?XWV:K0Oc;L5+\.NfZ<NO-UP:-fN^591.)C,Fe
2cD@b]W(RK3ZLe8.WXeId1RQNLFV@A3=Vc<ga0JR5ZDQ[K:aYDeXO+33c82AR?(W
SZcY1DX@b2fbYJ#WFdN=[7FGJW@DZL@9Ab@9E-LK@^:@>L?ZV.4YKLc9X#ED?O=U
4Je@B[N(HecLXbLf<IU^J=5-bE++fVQ#2\QP\/.(V#C5K]P6\:0Y[dbKN-f+Y>c@
\Odc)I?KCa;8aANU=?U^fH^d_T3:Pb#W=G>=3=1ML5O79\SZ<IEZdbJ<4SJZJ(Ag
#2Db1<X(c8C0N0_FW[:<_]3NPa#=f?8XgH]#:ON40Z5M<KCX.g5)V[<L7UTT8b[f
0_BW@7e-L>[HVFE30I=3(;S@4_X.Z?9Qff?OW4EZ/IYO/G;=YRdbgZ;9eK4RO<\c
?^]E3^,LK&.]HdDN+#cP9>Bb7F._N\B4G)MSLf4UZ#.KJ?,H=_F<.0ML?Q@bI.\0
;LI1<.GSEV@^(E7NJe(;Y(O0M;gg=1fS-H/(#)ZP4b#;8W/87dEJN=\;[:>:NLUZ
AT+CcQS83KY#eaLHcD+8GG9:54H9-[>UI2[+AM>bLDKe)^TOSQS;U=4aDDZ=2T@M
1@CB7RbWYfPQD^D^GC[TAH:Eb>9K(deYV(Q(\IF:e?LdS<>5N)=cFa.8;a3?Q,^Z
Vc?P.b_TP<N+9]6BHFGE1,0(YQ?1UEF^/+Y8VU\^_1,R;/Ob+:[M:aF0f,f>LVZR
&)R3fHTA60a;_R&g.[KKVGL&e?)e]XN@WAR5Ocg3KFKB?gDZZ^4H#A_EOe7+OT0)
Scc(a_HQ^CVFd98W-84Y^bC+K(0\aF,D]7U>&5D4,<.acB8MK7,5UD[N[>AV(3f(
N+,ZFeLM<.3\]14&^&dP42cdgOVdf<T?Q>\3F&4,HVg<e17TE07#@6ODU/.Ie5_I
)U5/W6=T<=<G/ETT+:)7\0cEH]1FdV5[f2ec,CRK7&2;9Q_LbYa52cB<-]<]]5YS
S3DDf/?QCM(FK8S4a(II4,Wb17REVfP)UJWOfFc.O>ND_d_4;Z+YbR\+1FcCHdXd
ZFF4U]T&U&MOK5V_<e:/UZ71@LGI=d;g(&<5]PKZLfU6QET1gQ>Ab4\bX&)KS_K1
XRD.HF(C?g/c8Tc+&A6GKY;)=e>HR2a+#9C7+Y?/NW&e3^IAb,>eca.#.6A2T3<6
N66e23,(Bf\\24H7Na@8M5f492V6S2&F.;EA,Z=C@V.?e(,V^BPXB]SYYW;ba51T
RZf4E8>3;c;P8J@NMd40WX13[/V+</NF8&b-?O4<gf)T.YdCWC)IEOTd>,HI]0U5
G7IU2a9H1cWQ52KV@ZYC(9KN4L:4Lf>J-,RVNg,6C[(N39OZYL_<+R[cT/9JM=J(
N?bWYE4AV,:\LJ#PUN^[DDE\>R#G7BgeOF90QB<@FX))cX,8B?<#,D4A5FB?M^FZ
g;da]1>NA3JC>aM[0EOET7<9YRb0CV15JaMA(gfZ+bMS[N=DUG;(SN/GBaBTFMX=
-LT9_EDd+>Y7+,8VSJIX<ga.aA,>#f(g52UT+G;6.T;)5T5@[#gaa++QFG5?X-5A
93SJ@O#WTJ0D)83&-M7DQ>Lf>4L38<+&=a/cZ,P5gKaJ+d;Ve26/4OLGK;,P:&@)
5\d:,aK1GE8BD#(5;H4:X(CN8GT;6[R)^-8@Bbe,VKH-]Of(4M6]O@2WV]cQ^A/9
UTTY)TZ=,P(5].4#d/9K28V@R3X5T#dY,F_ceRW?gb\;;\=e=cN1gE#&_V_EAGYN
aIIW2/ORJQ&1,a^QBUXK,17L;UE+6ZGMYNBJQ)WUB<9I:bZ=JabHdVPR6<d6#NBV
2NM]L)W^:-^?EF,5g]X#;5YA>,3IC(US@ENQVfM:^)G^2G4?a.8/YP1FRf9U^SLG
704W32.KcN,Xe.A@PA,<C/K?;X<,=ceAIggZ&-=J#.FM.1RN+&PG=SF(1JC.1bAR
[#6OJTO6b4._ND61>4GZgL=#A</8D:.0<@T8S4c[cEM512NY^8(E)=:b2E1KK/MC
E]NUb=AOf^Q(?IV0,b,OS-[5E1]fS-.bDG9M0)b](SC592Jg12dH5>XHbVcQA3#@
?:O,/QCC/^eM#1\&_fbBI2(WgWWFBD0N;Y.)CP+MNG\/&DU@)/YBO1+8);6.<)9H
_TP@ce_NZ-OXd)M?=I2ADO[g-NHN9/I:dOI)ENH<ZNL,#-#MB#9-I.HOOS2Za]9F
D5E1Nc<2Ma]FL/VU_:E[ROZdUe).F]gR+)^bYLJO376d\UY-4ZfEg#F-2\I-d#JC
D\a?I#H0N?WNG-6dSCS,cB)51?W@Q2dRCf0&/bgc8#7fIEA86-1TU\ag4M>^?Q)L
I;;MM+e(LfdAA-/E6FHaYM2?WQ6d1c>PS/5Z1P8@W>_0MfC)P/(8aK+I<&2E444[
P6d2<1EO?A1[S7N6Sd-@:WD>L16)E7.>&S68Q;Wg0WBL=2U:ee)b_NQ3M18;SGXa
geCCA8@6c3FE2aU/J7^I_8L=g6E(Tg5WYbWPb-C8SX#5#Zd,3DXJOA2R&.5^-&cP
KdR\X#1YPF=LGTMaU+9,?e(M8A7D>(Y,^D5ed2N/D:41ZXU1F>>7OQ_),ZXF)HcU
/@GWKD#P]>JBP@VR-\DVSES/,ag:e(/F1W#dIUTQ\R69D+[KT;RWaV/f,>R6)5)+
IDg[2;eLMgUS7[D-U84:0STDK_L2Ye11+#cf&YX8A+)+J?.>.ZQE-C^=A<)a#?:F
>b3W05@G(\?_?E;THc/fPIc+([)D]:f]L84;]JT4LfDY16-SQDW4M2VNYMNG^LeP
TTCK:,&=OM^;QIH8DR#9_aT2A:S#J[GUd#T#1YTe)H/:e/JA#S)WeZ,7_2)2V1D9
c^4&?aJRU][?;CG3SH2(Pb7f16f^Z]YPe&&,-1<CXBgGDMJJ;d]K#Q_&[QZ6[H8Z
3OC5;8GT[XEeR:Yc#-81L(NT9b2/#-c=XaW5?fE)WQG0]-T@]BF46F=(Q6<D\EWE
E4;:e+;?3B_;7:^X5GTTPOM[8@^IY[9]/9=YYHQ.6QgO@g@FZ0<-IDf8/e@-8G.d
WR[f^-30D+\3HdTS_#\PX<6GOU@UON5>A1>V6O:E+WK5@&PNC8?OgD+Ve7LfB5;@
7\R3g]HG_5QEE&A0a+eGUFDXB=E.,d?I9;<)e?N,dg(c+1QKINJVaRc-IGB8U/XQ
.==0+#(]EVY^=Y?G2U#R+)9,EfM\-K^+Sg,_134H2Z-ZO2CU0511Yb+Q?(X]aH>b
(O:/aOUBF6//R?NY(KH#7TJ0R&Fe30F2LJ9O-;@g=CNSSW2(&e(/?J+3gM<NCaO[
eZEe>9QA9@MM>1?Gg0Z>cLE4eBD4R_EKM/7O#986;e<V:gE99)<+L.>N3S646=F;
+B?6N+5\cRHd,C+/,D-/,Y]37JUIA+5@=f6)ZF=6BQF#]AWH<bJ2b3MR?PZ,NGA,
,;&1Q.B/(accCFB@Z:FP#5<=IHd9Y-P/e0:&dAS41W?Z?A4G[L^V9:B,9FH/.;]V
?_A4,M=VULKD#?@4=\fB]+a^-3bJ[((_^_/M+cB[RX6WY[.W&AaO#9JbeDgf-+P+
8BKK8^,]9Ef)4bAf>\ZX^ZI/DIYS<WSb;e0\[6@1Ba2(/bS]GMV2.N#eK6:[+C+/
/bL?N#d08FSBVF+C@ZAA.YL5U7eZO_[E\Ydcb=6Td<_:V@82CZBG^VVaE.7]D+I9
AQ7_Lf)WEYDJQ[d<S<W^ZAVWYGaDZ^.)92c?1c\<U/g@7R/THYL?ZgR348DgR8c+
JX1LF0.,&S\LIgFFe.G/1Ta;#D^E@_c1=Oa5WZWGXV3bf7@-e1_044,d\+\/KGJD
6,?@WQ\We:+@J2EcT<[S^/8N/5&[Xb^@AI6B=B^TQU46D0YVUgD1SCFNB5T-^UYC
2>c4M-6CV[F,T2R:#[^;bb=bWUX77g27KG5f2D-^:7OZ<[7?/H_f\1+?f:SH(3^6
Q/OZ1^afbZaL:G)b)Zc;&-;R@6[\L/F^e)Eg:ET1+.IP8UMP-0e^98-?W6Kd[WL;
dJ4/F4^=>6fbe@[QE_+P-@VE2_A^;Rd5e].MU,1@PP^UDL\:JZ8LF8RJCdMX<8cc
8gWF>6;7b9D\F=,Wa;?YW0,PVJ@#+e&GJSYN)+]J<d1\e6NK(#6^Wb:63/=HSJ7E
17&ON61PDZ8:J;-KN1_V;f)2f9DX#4fc0e>]^-b),H(MF4GD/Na]EELH]IMJ)(JE
^ebA?<fV/8U;M(N^IeOKG,X]\)L>;.UTAA:c:MZ<cZbeLJ#,>?S-X]:9FKa^X,UZ
&(c-P<6AP^2KKA[3NKM+SSgEJQ&T5NB/S50A0.X\EdN6]gD;T+X5F_AG#RKb:67=
4=Pb9>-e[0#@-A+dUKZ>HSS>#fg/Zd]^O?K(b?ObRFD(F][TX(@58+84(_/f^8-_
>J5:a>9IFAS@2=eDBbdKXgD.=Y?)QfOQ9CS&+&R_P[9PTP>-)Z-Zf0DWa6UV3XZ(
ND-YgYcM/2#Z4ebacEe(_AC51E<(eg#?>Z#J=P;=)#_PJGGGXddVSM@Y.UC9;WTb
OX=/NX<HZI</8YJF6O/g]b9YEc:9#9JEPV.A(2bD2N/,e8MCXZRa#,4e>TTJEdAW
OLOY?2LG/;45K3FbbM&J(P=SD1FZaaF,&g(BNYNLE8=>=afM60J3:a[7_6<1]ZHK
-IS+S9DIPXAfF7+8OY<P7&8U&3WKMfaScX+\BPg)P6,W44(ZJAVWV4Qg?82;G55=
F@^@8e,P_6_:CG[WJ5f4:D9CT_NF3GKF.A9\A,8:X/TAS9>R,S?V?Oe-:[Dc)G7]
O5?;N#YfdQQUDV^I0fP]O6VI5KYCY,DOZ.dP\Db<,b3.+gG[Q=.6ERTS&XPG14VE
[#b8^IF<(a+PSKc?]R<5[4CUKLM940;8XbAQ)^D<e>EAd9]SL0g,D<6)?5dSR=N\
\7/06=SFA(6[#<4G#:4I:Ue.J7b<7PSOA<2WL]95KKPSM-DTDEK>E4^GHCMTV#A+
3M)5X#QJ6Y#IH#8gaZM^LZE]aT2-c,E?90_#Jg]TWIg_X51:X+/B(X]]/ac_b9N+
UGS^0Xb_].#N0<X23UH,Aadc->8V),?9L5I\7J83CcNKA)2M>D@E-PLHAaL)Gb@I
[b4bcd0M2\1F#&3NZ+-fAERE-26KLJ5g6.TO@E-8O)Q)a;)XZMdc,;)/^F40X.8g
P6I?MX#8QA[W)421Ye^AIY_TV?12M]28S98+4_Y^VBSG;RR;+/L8E_?,MaY@U\>\
D4W2?>Ke^f?_MLaY@F.e=C41U.00e)G9F=N9DTQfgGC)Q)PAYC9dSL::G-fQKO;^
>ZR),>14dfA/(3\E^4].VF[fD_U#Y4[M[H7Nb>04N/FWO<F&[PB;0cGI&@0(/5EL
G_IZ@bJ:d>cC/77I<FH2;ASQ@CC5C9<CTPT3F/e2H><-+E0dA26Y\?GM?JGEFNcG
Z@##.B0)6O/g[8R^4D&1^)[D7+U;P-afE#C,T9N5FaNb76/QDBMU](JD<,;66@fX
P-Pca[D>G]/XSWMRG;2.SGgH-g1R.ZgX3<];AZNgM++KR97GfW19X4R3d:Fc&Z;1
/P@5/CS/<Je4d)FFFZaLKEAV,UKXD@7U_?QMcQQ,gVM]Me9K/9:IC9Kga3(Y9a\9
MY+IcE<0];cWZAQ3FX-9<5Wg?=P/)P#NDYLBHZK6+_Sb0BAZ#L+Z(TQ)#_d@9YY;
a/aJ(bS+B:H[bbU9gQf4gA_P6Gc5@]]A>^HIcZALD->bFHHG(CL+ABIXM8,cVc+N
;(0S-IC[&_cLM+W29[TJ<FPTJ\^W^9X(VcWXNHPdU)Y<W.:g]B=_^;4\1Xfg@,2B
e_C,9QG^W<P;[NU,)R0g=YE)216RV\V?043X[--9ac8eJ9,bZZ0?cfdACDdRSc<_
Wc24=@ga6-1#).(E6.J[U+WJYV;Jb2:g/5dDHHS/dOIXGF\,2JAISUHF8E+Dfg48
Bdf8UQU=#6&8>B5fSfd4,)T=XadAQ?3:^EVOFeKRT(#:>+(Z./&,JFR>>1,.bg^3
-\@9?5P)SD)O3F-@Y:bd^4BN]M:Q\16?X_&WdV9P;4CHF&13FIOc.8^@@/=0QO?f
]&CW2Bc\D;:g5UOJ0cTS)/BNcgITEK)c80CYLD/:TV,ZXAF^J2TP]ePM]60b#35K
:W87PWe:I^2FOP_gfFD?#OZ;QQ[NIV;&^HY01)KJ8Uc;ZTK_QK+;OZ?;C5=TB1-c
.]PW5YR-WZT42eLZF1EN@FVIXf9A.4M/Y<L#edH,MDV_6APg[)7A9N030d150H@:
AHZO6(U/fD_B(-RS[6ea9>4^f6[15^&^T4YWV-_cL(33?faIY8GF3TL7VMDW)#&W
g=E?@4gIF994&SN<6IUJQ/2#/E?Gg]<Q\T\cP7P5T6eVF]Q/>Yc7HV@Y0@e]\E+[
(CXSa-Je@eC?G#[)9Z=U#NT:026FH2Y&^-_MJ&]c^7,c6>D-(ZYdRO8J1,P@/SD8
ZJ?-#<eHD]FAD0Z3KaIN]DD)Z,>N2NTgFeS;3Y9-N/3eeb;8+)5NYf8^Eb:B8Kd;
K&)DB;fC.RS-C),H7a5E8?(-dZ#7;Q7D/d>WBK8NFP(9#)]G5@Q>Ig8VAD4XS^B^
IO>M86cN2N]9Y\=#9WNgVSVEeObaL2ZgW/\NYb[b:&#JZ_=IK9aW,]XD^?62J>)X
(E3c4XKd@@Ld6O>H+<[2EUCFc>=YM67-KK=a(YH],eaeG&^]PCJ]bZdLL>IAQfG9
#ee90EfL>?^H,J(;He-?VDG.444Fd@V@=58O4V#2PJA9:B<1NMHW?EZ&HfM@cYQc
Kf>\Q/<=NX^NNCbU:LV2.P,4O(.[bXg><G?UL?gc&THI2S1C_gUNM&Sf_9N+J+V;
&]=,=KBE4J_&UOJN87eYC7\2(YC8IUEK]E1Ida=6FTEc@f=AA7SB5,_BYfFRKDP2
/H/N=UVSGKLW4U?<4/8A:E4DVcS[X3/bH<BLXb6Z=&cQegW69BSVGK9KPFa+T9+&
:?)++N?d;T\AP^J(H;2X1FdT?1Jgg<V0^L/:]AI#a5.SIa-7IQ\:R5B<?7H4[gW1
P<d:V/c6W<HYB20@RQIZ#DI)a^E=9,be&<:)VfagVDgOSI@BScF\@VK/75S<@D:&
16<QfQ/MecHDXKC/HT]H^;f,DKM_29?8D)]IT\NcNc>DfR>/VfU.&T:W(>cGEgA:
72+0]1\]R2Bb9]8,\VcRV[[eVDJAd3J;=8R,EKMNQ_3[ZWJJ5<E>6,B01/2,^]PZ
V2P9MgS_aN@,YKNB7TfNM9CbWQRQZ@9QW[#+_aa#_gSE)]QE1;eBVNNI9<I]:9:]
QWR4=eeN^O\P[L&e_2g5gQ+2>N?8/-9F<UE]]7Nd18TI?AEM#[W2be]8@F+;@[<P
KgX-CKdM22:ZVdJ^fg[(Icb8T#6I.cD#A.F+9=KJ-NS;@:8NQ+-e),f]\3YB8BMe
d62F_PdEK_X-O\e\(a>AVB2@#79\OJ6JA2fgZ98JXE0^M#GXLN-cLM.?4GVaUSQ]
\VKe+W<0&</f4JU=_.eC+I\W:]LLJ<T#U@6O:3N=dQPPbV/MP22=KcKL/-@\-?]0
S=OM&-aQ6&.>>OP=53.GK,_0=ZVWc7:3D<A<]De6EddNb:VbUCZOZ;?O=a8IUcMZ
/21S[/PLd3@d-ba,5d]c7L#&Y&a/f_&_C227W@_(E\#4MYXWRD[ZH.89\/#JaWOY
-@+FPKea?9<1EaXDf0SEId3(@KH+3^c^07P]@HM;B0UI](>b8&Y23;QL^((<XJN+
cDK+K1e:-@09J)1/69S?87eBF#:O:=R#(V)=9GbHe[6D.J\AbH<cA0W9TWD[-c[Q
IJX[f1JGEMNTKPU3<4HR9LXNXa57?UH>J=ICR>Eb81>91I-KLDN_9+[3Va].\:a?
aZ6S5+:A::3ERSQ)CPGU2RM(A,OU8d\--gR4e^g:1V<M:VE.:N01<EA1^_:9N#?B
D<F=6M#Z+:=F#G,;G42Y992INAOT9OfWdG?[JZ_++TETSQc;Q7]W>5OI1#Jc0daX
,dJ9BcC:N:EMMOMZ]^AKTZ9K3ca_3<bRgfKdU<Nc0PB6SXgJ+2,A16NX(SO9RH+]
VRMVG&KK_eSRU>eHZVD)(;=b].6g];G2aS8Z9WE9)aQ52^/>C9f_J).B,ZEWBUK[
@M-aL<3G]Y?T?8?f00Z&X)_HC8(HS;Gc\7ER;JIf#=NMK<UXOFg-R3-8c3W(@J_K
BD_/cW&[U#I7BSJ)9&XDCKW=Ic;[[>7dPISBAQ3+-#Z;>4)=f(UX<Q=MMFL_K;2M
3f>M^@KI3]UOY0N73(?:eY&<L9BJ,0LSL89UHB^@#0[?cd)>fIP)3K8FL8@:O<R+
f+2]<(+WGd=&^-.AFYK@_MG#<?g,@5?O7G,VD=_EFQKYS4I4+9P9Q7&3BRGQ8&Nc
EYSbf6]WUdR^)S\Q<G91NU@&4CX#ECa46e9,Z66N_F;>RQdV=2TF5=CgC1aV]NRI
\fT/1#>]DbP);bAf(NJF?P>>?,&KB+JOg_9:@JC>8)/P2c-S5aFEDG?FUe>1JMPR
5Q[cf^(_<+H.3?CX?C).Sc1Ng?b(_/5/]U93/MXgc;+(OOIeb,&0<XcKL>?Q]ee4
[:4e4E8ee1[Mc152#<KBgHU1.-:#OLfN^RF&?(^c#ETJ>_[6G/NI]8WF_Fgd:B4c
bS@3<HgT.Q9eeAHDMR^O(_Kg@7BbDIO.PQ9S?I,3VJ>/C\=F+VRG[(7\-O(LLZ>P
L&;8#8Ud3SMO(4dc;]BeR1)V5eGJLeH.>V/]&X6=@c]BfeMDfVf8_H=cd4M]UH5=
V1BgGKN.aLM6+ITG1(\O_e;8J^2eNOXE_BW;YB9,.>6Q:SIg=-a7[ObFSb#IaODA
O:5DQH@UVK--7>AbLD/e_ec&-NWgYZWVH0P^b=./:YRc:EOcNd.V8?FV>#_.8//Q
3_CeMC201A[QT1;AAF3O[0/fVCdO[[VLLdH2MM9Q+=AcgK\(.7Z+0W_6U9fNK>E(
Vf=ga=?+6]9EDUZK_;N0F_ffQ&R:QPca.d709I.>>=Z@]=5fW,_&X@=LcVe4[#P.
\[81==HH1I&HLG=VAQ?F-LHc^QRbe>9U/:VQBKbG8ZadI_C?>KB\C\?U)P;d9\M_
]g;?F1B;B5(&^I/+VEGf).Y^3R2_eB?<3THbbcTSH8I/->aYZQ<V6GXVK9+YDEI0
]<E7N682[F/\1:DC[/gPW;XLU632d);IWeGbUVPe9fIaV9CWLYZ]J7XbKgA9HO/P
Z&NS^8X4\ZQ<e9HSZ#@PU8XO=)_+.3]U=4@>ZX;@ILB#@IaW6e0cgG(ZO;2/9QQJ
ZVdHeJT]<LG@Ne#GaQEM9VI]O5G[/M(3@3&PJ8<1H)g:c<#&N:f:g/L^1QI<_f.U
HJL[&S3>XR+K5^B_Qb2Sa:-3+U-_U\Q^6#&#A<f_C^[CKPe9>0I.=IbY:0^S[YAY
LESfXS,/4PH3UF,\#5E.c96UBeZa?);QP&X4dCE=+3J8DU<&<=dc83a<O34OZ.H>
g,I21.EIH+5OH47Ec@[a>.P8VJ9B^1<9ETM9&NXL?U<2S_BN5J/.L(<Hg.0X[FD8
TVTPJ]M0-Q_/F#KeEZ9cLGJ&]-5&@O,K6/=\^@\Ra8cS3NX3&3:b1-4WgM+=LN&1
Pc<C-8FA7?g9BV@cV5S;2FO5X9FZZJ(Y&B1SZWA(RH,UabN@N3#Ab[_2MAO]#Ne^
J=fD=Jg6[)EGNA-?2DBSU4GCLSWIOg28HR2N2=)^CC>?]JO]I],gC[DILIOVg(A=
@;.0G9\FT(D6W+MZgB&?a.6E&^H:Be43O3WEF1Z+V8A91Y_:_-1_6?O2).6EL75:
EeJbB?DCSYO+/b9C.0^c>>.-[g(]fgU&=Lf.;:(dfDX_dFP8CTHQ8O<f;#@]30=&
aPNAN)db]W1VM^]&B9:UE^[TDLH?E]05,&HI3Z7?[b&R&.\UC.CB#6:A,V5M51N=
1Y?a6::VUd[#[+6TA#H,,aA(/O:[b]g4LQYF>9-]Q)AQKUf<Pd/]T-PL-4AWV8_Y
1?FKdLdU5^DL@Y9+F\UL\cSZacVM0d0HS44=8/:;2IX:-;N]]25B@ZDWaXUb39ZK
Y1LEEeZP6WFJ3L+;\JCT9I&5c+3UZD(>f<Q5LIUC+M^LYA)&H@GQZ__6<;Z][M_&
]aV5FS=KcSGJV7L78G<I\UFd</^b.SN\bJE4O(QF_A+)38LF4^d7.fZWWNgQ4DM1
;JGI4\]de6fL&fU7_WJ60CId17K7,/RY13e:Y;b26-)B83G+MP3;][?cU\g]^6bS
RLcL0[1+&]CcTZ270b>T,[&LaR4(194N_O-HP\BB_NKC[e0cYMCL:D(2F,BeR^U=
Q3KQYM81ZNWE.Y+8Z^4f:@gK2bN^+#;Yd)Z37Kb#8f._EH=M13(,DEG)(3-&-H,L
eX+?U^ZS-N5Tec?Re=IS^[gE^g=gA5<R/N5g49Q,FW;<g?B8Td,Q&_7A2LO^:^F.
Ad58N;BI,NeYUU5[2^QUJHKc7V>VWaOg5&1&/3=VE6D/76PUf)YUbf)8)e1T#-aB
^g>R00fFLE&VL;8W,K\U7b<U;G>d6X0K6D5?dH2/cM_)=.cdBL1T6[U[+]Ved]D#
/CFFc9H)F+9G3@H7#=349,X&fBDFe.c7NV;=<LIX>(<Y)3eaE<AdWaX5C?YJ#+T0
U+(IdUebaUHOgHI/#:S.19TR#;BDFTFg_cJ,6cb^=[4WZGFUG<B=+NQ>+8-aCT15
RQgDHWWBM\&;M<f?+,885bL[f2c>T^gOZQOA;Z6SATW(CdFCMa=22_C^8a6:fQIZ
HE@_81S9)S[5>c1P>UdC6(BE>EEOEFT7(3:^MYB1gE+HM/_[EeK.e)LDL6;gME&E
3ZDFI7a(eVg#?)GY[ONIOU_X92OI)W;B5.)^KYcJZ[6+LM8_Ce[Z^41If?F&8.7:
+0Z:OC/7J8d<RBZJ3\7D5:&C&)SE#_3>=4>O]<V)]N:FJ65b>O\>R\E:<8&R+Z1M
UN?ICb2<0F]>O(dJ2La9(..AJ5e?)OEMFI5,+@_.],S.3QX?NK1S[LR4:>P[5<^]
QQE3#@_56b5FdXEP;VbbN<dVdFJYTV+SVO=Iab\GZL?7BeN2C^HdDC7:QI;E]YOY
+A._+<&#[OAW#\_d]FITYNg3f,C,bfL<^I0?)g9D)?\)\XR(@J+??8UHJGPLb81I
<MJ<)dD<SAd#Hb7-BHPHBDWCTH9c3^4T4ODd^A55Z^_4fD5C3)B3Zg?XBAXM,C8:
fIJ>^S5]97cc3V2W]0JF)R(/O3CHcT06UBI/&8+Y+[IOa\^=Q(0(T)e54d>+@:bD
:abQWWVb6-\@S<1##4AS,5OS@#5F@)P(LGR+Y6[bLZRV.96ECR&:Q8WcN6K;7[eX
ZNHcE>0Nd=cM,7R@-6P)eBV]AaPI=.ddbW[,RSWI4[64KI3#_EU9=<HO9(bA5gF_
ER3P@_,R,.ACeR3_R.V-BFc)&;Q+>)RSL/Wd<O);5-:0_I.?VbVH?3#1Rb]TTE3]
1>JV=C+N478LeH(,JL^/dH5IIN:3KT(C;R#E18#OOGb)K2fE),DG1c9=A&LI()/a
N0=JASM.d0M^K>cL^.Vb0MX4XFOG+:YI3g9:4[5_K[.9\g?P>(FgHLR18Jb<SJ0,
YO-If8T@KW72EZ#eE\0REK75JW#N02BIIMC<BcZS8R(JU6Tb.G4W;^S-bP?d>6U>
^aR69.-&^.Y3QX>YN:,[.#T)eU8N:3LW5U6XWUI21Ea-IEDe;GN<?Y^LLS4&>.EE
S1CJ=7Q.ZDZ9J/9d8V.0aJI;-A<cN+T\9#[JEcK/Z9RJGLB/WL<VNFQKH&[NIdL_
_c)3IND\Ub&gN,Z+f0+.ELc,:aQ;^e,cLW:WZb[FMU8X/)FM(W3:C9Rc/RINb?99
/5<F)#(Y\6PdUU_C6]VcVEFIIL07R4.&L\ZA7MR>O>;R=aG0Rb3ME?[5D6;.X2_+
8HEBG^BNT+1PN8LN5gRL[^#M,2b+V_.2:4d&3W)ZI67?N>cU-@U(SbAFUQ^>V1#S
AV7Oe45H-M\FZ]U:[2T5091K5#,K1[d-1#8Z8N1M+];9,:-RK;&f[[H=5K6E44,\
<M+34[-dF027OKCE=;0A2WH>G0=eODCP[7TV>(<D9Hc@]He)LEJ74FQE]LD3G0H,
(cHaPN>\2NF2g^^8H(JG8K&fD+/K+PH@N6F-9TANf([3.1MUT53ACNYa_cEaAR].
3[+W&OR)9B#=#Ag6gFT^G:/HJ155LIJVUZ(6cWFKA0\,01bU?F_#2d/]+Mc<\aLJ
3cC[.U)M8,CW:8@6H=B:Xd>3Z#7a(OVO[J.GMUSIN..^e:<fSbaER[U?#-a9ZBO;
ED4ee2G15TB:KKMf14=(NRbf,cSD4,V-8EH39dcH]Fd=Sg;ZR)D]b1+F\D[N^-72
1Q<S5@KHAHJYVd4J]Be7=MTEJ:^M.b]AK+]PJ8\:2(X]aGK\XD69Q+:STXe]g3cQ
:(@T,Ne96_/RQ^UWFY9b(/956_Y.;@5b-LA7A?]Fa@G&(d^Ug/Oa]&C:fEdT@R):
ST3T0]F:\PQZdCWUE&)g(C)CeU9;?BR&3S5M3,^_d&SQC=K?bZT:)>>C;ZP+J/2S
:WD(eSWKDZ,RgW8T?Wa-H0PH-K1DG5XI?HNf&^V+A4+_b>NU8c_FPIAB&VG@]K8d
@F10g@ZVe7B<20R&R--66UL]7gO^A4+F5W_?_E3Y)dYXL9RW&V;FX,1=7K-[bBX@
[EC56cP5LCKI&0Tc=Y#2e.@9.V1d(]5KV98.T3]^V+9W?6dH#SZQ];(TFM6eDe9-
==W\<fPd#e9e;g8f9-QRJ0_TKD@:eO3g\L(EgQ9<Xa9YE6PEAWE92#6g==Kc<B5]
]BX68R2aA2IZ?6K)5#+AL]2I[>,/K.F\f._&V]H9e?IP;/FB#.XA<T]=2T00d=I:
HM\1Y&NP=R8+QR:?+eB:F&RJc(MRI0C?3<VVG9HJ4Og]^b-IUE0FCfEVM[C9PYUL
K)^V4]H\@9\1B<2@&0UbZ_H4C@:XTQ(=Wa^E3^=e6gO]a)Z/eGg.CC\O;\NN0MZ4
2:OENSeA6I^^;7#DI@B3dO&dbX=#Z?D82dMKP^e)g2QYd5,g/,JTD.6IWC8:UWXV
Q-ZEML@84R^L520^_Ee((.=8bN8>+g)gC_7-ef55.6C+RC/&M4?E^_Ad60A=F/4^
;(aAAV<_:H#_4FH5YS@U8TZ+XL:?:,06E#-U+_XQ/)-[[b2bEf[1><CF7HJ0:5H/
([\CY9Sa;UKAfV6RJgIeJQX?[EcY+b^6=0a-S+)Q=.>g^6B6^db1B\G@3_BS/V9(
#XT,/@0b+RAHW9P&5CcB#[AORS#>b0Oe1])6:K/.#KU@F0S7<,F7.G3d0>7PL&6J
?A&>0A@cdRgAE?;7@3G?_Wg-c]F)PK>84/&e>e>,QOVdJge0[_B2.[<42MQ]O.UQ
1]2LDK)G?TO9+87Y8N#;&/bG]S+c#DMNC)-K7fcGXA#5ZKM-X]&YdZM3/J[=Q^a0
9O/d(L0Q?A_ddEUB-g3JRQ;d(X&@d-7?&D:J&U=3\^[RfYY#aC3C[AeNcTP16?TG
(L2#Y3Zc4eO>7FL0aJT:9:3>S;MDOF.(7>?+ebDIPO@fP3K6VOD#CBHYeXfELP[S
K48]T4^?aU22b0^b8,AIaS0d54,E/R]f39^SE/8F164d::RA26a<-26^0K,U^9DN
>3X:GgTV^]ffgHG;.Y9f+L1HVA@a)K8#\e@OXeX<5?N=5bbTHNGZ1.EIIF:UE6C^
__R<NB-c_/1IGEM)<)/8S,WIFHd4J1?&/[-g,dZe6>SXITXU\2W_R7RJ:QNP[W-P
-c0+GaU>DB0c-V/_I0SOPf<=Fa\>XU1ATfb1gT?N=ZDfd5.1Ae\UNeYagad3V.#0
3a5M27G3bU6?/)::@d\RJF.@@JB)<<S1-NAe&879F#)Y[?VMQ@[VI36Za?MfN.4Y
.1>C7?)Q+]1XW<L5N#-A4;IJ0ZU[6H-+=8bH>)dAf]4:U\g7,c)aAFQJ7#H9(NZ=
+@a&4-cEcN^9c3K#baZ131-?\GF#g]9VCPFUTC^<Vf9;KB2c>[\05Q=M;;)E9345
64<:.3?Z(HD<N7R-b6ZY3g<;Aa(#.JdF[caPDTG\&SG@0e>^<SI.[EE5K^+9</O[
ZbDM@e9g2LPG^P.Q-9H.Z(YUeV)GG8BeKdg+B5<-(@2/9A_bF@NaQ.b(P7L+(#9&
S,KgOB5<^&D]?eS&4d8_KF==FB]Y_&5KaK=LL@gMSVC,,9AFRXgJJeeAM\EQc.de
NWd(E+/bRRC5BE),A(dIF8:NHOcN?9DV\_ac-BQ48OXc]@IL?>>-N?4UaS/)))F]
gHXJR;;d;HKP6PO_D/df_-WDXS\7UPVg+NcHQ;_G-WcE=X+gJPGJKdBfEac4^fV3
RHNKMILdSf,(7ZceaFHIF@>aU..=IR]<6NA&4L\:.#3GHQ[X_JJ><^.@4Sc^TWTE
8@3JTDQ/AVe)J(^4H^><L+Y7/=A?_4DQ2SgPdQIT38#8SPB(:U/gQYQTIK3AJ>5c
\P[b]&5QJWIF]#E/6G,Z]-P>.F,Ma:9?733G0g+VURVG9f;.=P?gVCY>=@93+4UV
WXO]8^0g<<(C88AZ?,^1GMMCc6d];\JQF_<Q,50VC&?caQTB7DMS=/GM6G7SaEL^
+:VfE-YJ+EV:.]QdOUR[OI\#LM@RHYf82K\b5?BT.VOGOWZf.=fQZ&?OC;V/#Xg:
AC=M[BA=aVf4gCWU:\Xg/?SHS8FCD(8;90/>IR=Y4,:fP2Y/9YM69f09J3<I32[0
E9W:+8?13ZdXDCYOEg^R)5QV>MIA3];F7+W)RA4DDC=G\[FK;33B(XD&.DP8GgOA
&HAOGfVCSN?]@a:f67aZeH#fDNLN86_4=;SENg_JQORBB2^0=4IQY.,V4<K:FNgF
XN[ED\+?IN36bUH#QE6A#9O-EdE4.UZ4,MJXD(]Y:&?SZ<=>NRRFBc6/6D&(BE<d
gL:.\W9)@AAH47VK4GFL<U_-R&,a2H&\C)fRIc&R@<eWd@_;(87<454])QK(AE_M
b(QK)=?_B@P/TU0MRMLdHO-;55a<gT<M<<B?b>C)Q55?L6SNH;Q\E=+3IbLZK2>8
^O92WAK##5IfO])e.4b]2N3R3\XA(2df,:70G^B2K[c@6ZgL]>+5@X9X_.Df_?Nf
))]K>=)]UZ#8[^0JZ.&KSKN]UT7W(AI1[MD#W)@LR.dB^[;J5R<1gcLP2C[RWUC3
;/Y9e+_J=M\<J=B=bTc@C7T:fE38#,#&dKO)ZRC716R^).Dg:SS:PA]<Fb(?4ZJ&
f<YH76#S0c^^Ta[@\A+X-#:I42)U<Te\bLB=:&@Y>^OGZf(?PHJ1(8U>[XC\fde(
F(GWB/V&AaTfM+G]e\N)1XQO?T=4_&=<>fM4]dcfO48TINJ?#)S@I6.gGNeE3e]>
TI0W[3D9\fbB;.7VeYVJb_0PIRCfL-e1NQ.0^JTUbb0;TU/IOB9>>Y?+7XL+@_:X
a@984X6DKJV95ad7-?g5)-ZJ\KB69Qg+fY+K@5e.L-<HQQ@P4:T.^A;?0(^-5D/)
^J]67KDHfC-UG95b\)5]eW2a(<>BYD>#&T7ffRE70Mf\Mc#)OW8Y6XWMMLaA#e1c
+-a&FQ,cgE=G-QeRT@]X+:IV()WB-DLXaKW=eZ&59<U,<^(UHeQLUSJEWHMc;T?R
-/fKPM1LWabJDO26S:cOPWfQ&5\AD7<aB9DBPF?b]U4d4a8Q.=?@WS>EVJT4MNK6
A/TAO?4Y78,^:QVE8DH?b7Q6HSU^B-K8&C[?2/G^[;b?C[>0b8+6>^WcQ7TC^#Ua
H9)&&?ZY?MA6C,=UA&e@101X2,.@RZ1(RH7HXB(\R9c^La=<(SgZE9O[;FX[CQ+W
@+[WagU(ANW58G1KA?:QZ);gK0U=gE>U-HD48(P]d>-3+BNAE,LgAfC]8;FK0LT+
,VC-)O_3cJ7f-UZVSYO<K6]6O5J,XKJYeIWQdEd#^3Sc)=dMSA8O683[;)3YQQ/Q
#c,LdDRfP#Lced^ZMeGbN.L\(I#b85e/_;]M&2Zge)>6HE(N_)8GYR71RbG2?H9e
+9cP&5Oe7+4#E17^7&YYW,3<E]0=DcR,#eKE+OY.>0KT/CTO&IaE]9]1Q446O:AJ
f>7+#OQ>7XI[L)5QWNXb0X87d3&6#SE^M:g6AK9T-(YZLI.eVP,O0):5.[UCXfDT
1d5:+fZ8P8e/0#_\P43CT/GL-4CK<VH8^1(#@FJ/V=N6LO=X&26Y.;7XH8E]A]ae
:Hc7bHPB41/<J=gDE[&1c=6bCS]=404(._/H#=d<FFQ5(:N)N;IWZ=[BQ,R:7GWe
[6Q4:E]7D3dW#g^TJL1Kg(M(0EXI](5JX&70;-VPTU#M\,K=2(OfJFQ+dG&N[b64
+NYCM/Pe,PS8.MPDRe84?#GEA)LZQYM4#0)5]Lg:]eKA7gUB5,\W[?D^:Q2VPN(a
&c1;]Z[I=\M3V(2]U2^&B=?>N/T3:4d4Y9D<N\/#8d1YV,G__+Z#f&7P7Lg4;[@.
:SO^749?\4BCZV,A=F7.\e\1O7dZb[JPQP<U)eC]5:,I\bSZ(4/(FQ&/Z[W=I[g^
A9@0RZ;W2>D(JAXa_=LZ.<3P6U_F42K?\d;_dGI&P@Ac.+2cQ?7eM[?/OVDQ6<XO
YKB<)NI)b-eWJ]fQQ#ZRg?TAd-:)=TVK4+d#g+,0fQ0NX1H&MK1#\,3FN6MZVf2#
\]L9P^GfH7LEf19YD;I>?(&PV@O9be+DABPc5:[W)a@&dbMP9\8>8IX=XV1gJBBe
K:FQX<@.@HKM4;73&7BFe=+#Q9>Yaf4KIX2@\9()S@@cE\8Z^2VQA-V\DF<Sc;\0
IR:XK&ZH3_g\dGI-S\,0f.#S6V2I7BU<YFNB49QN3D1<I&MO5VO.]ZGGRK3KV)DO
MZ<UHI.bESTa>2N2YVeC<[:SfPW:/P45)Q9>\=B7G;F^[U00FHAJ57F;.F\edQWP
?Q&VR(H5Sdd:X3=NfTaWf[25>OQeDYQ#gKA+c7RL6=6)9];GCJ^&#E=#g6Gf=fK(
W.+,0MLD83GEea\OQ]T\b8.<A5Ye^+J)WaP?B0c=F0d(Jf4a_?W\OfZ>NcK7V+Y7
bYC6Z)\(<WMdFGG07WDL36TQa@5S2f;^M0@Y/:R=3_c(1QPE=:S.GXZ=EI[WS4ZK
aADgW_K/N(fJJN6.](7]YG:L?M-T(ESW;$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MT35X_DDR_AC_CONFIGURATION_SV
