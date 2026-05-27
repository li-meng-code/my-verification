
`ifndef GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25R device family in High Performance mode.
 */
class svt_spi_flash_mx25r_high_performance_ac_configuration extends svt_configuration;

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
  `svt_vmm_data_new(svt_spi_flash_mx25r_high_performance_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25r_high_performance_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25r_high_performance_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25r_high_performance_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25r_high_performance_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25r_high_performance_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25r_high_performance_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
<H3SITfV6ab/Z=TKK(O;HaOff=5aL34U;GY-5RUS<Fb-X8T+_N793)dQb#c8^4]^
?M&4-T;MG@;1B+82Pa:(SWV=DFHD1(V]IgGdM[)1\W+c@E\eXgYE&8cF87]-aINg
eAIZY=+YU8Ja4)I-L4M1L&RP:I8]d#ZCF6B[]3a\#:JH/Ce+L^JLVU#@/F[N_KD+
Nf@b=,QDHf_[08XY]\?TXPS&@C8eg5D;&c&W[3,f7?O=Q14bf^X&LAe;)fEG--DU
<B9GHCJNXNf__0BPI&Q<OJ\c:)CY7d@N:<QV@P8G/7UK#/+QMLeI;\fKf,_#b1]e
/2dEaORDQL]eLPBQTcc#d7GD1.GVb?83U+3f.4X)dZ\XS=AJR[&B^WLA>PBYd-ZG
C]K(8^D^CdKd&/QL\KNZTZ80e);:/Z8&B_9^;?S@@V-7W>C5>Q/ZB3_fdX-&3;3F
:U(d9R\&50&ECIG;1^fLD4,^X/.A&W\237KgZ&,(YQK^QXfMLONbfZN[cKC<PWR2
>\DJf[OG(cQb#8c0cZ(55H(Fe13/QSWT7YHH31#3V0P5C[D(Z;C?f=:_GAR<M[fQ
aLX.Y;Yfb#^aL\b5\;;g.>\.HLHT-)7[P/HBHDYeFJ]P](HF01WG0?H_^Q=X#fQL
<I.85Ga1O\NMH>6+)_X3e5HHfF+0T2M30GFWUK_a1@;-[D5&Q/5QeQ4OEA0BSA8c
Gc/^FIY6/DO0XESLNbQb57M>_,OMETP#(R(eL94I?OZ_,0WU+HNARDG#B(ND0AZJ
#?dC(F@B]d5gX\@EEUW8aK,]O49:aC#]Pb4[-&c7<[V\=<8T]W)\f0RgT-<H=N;4
B0R-5B-A_.eT.2M=_,Gd#I#=IN]cE\BQ9$
`endprotected


//vcs_vip_protect
`protected
MEZQS56IN_a(5\DVIGbg08(HdA7/I@M&))FeM9QYC/9)9Yg\AK=d4(>EO0]>I.->
R-.?FgRBRY7IB5V)OQ6W65\N_>MaJDC(QaYNPf,B?JT#gdF3DLC^O+R3:WN)C/_J
\UB_4X0]RP3(g)ZU)P8.MOJe;+PH4DZ78Q5YRZ==3894,H5@aC,4<-@8]7@:EPN^
J957P/I.0EWPY@aSc#UEJ6MT[;d^<D1T+1.dT4&3](_\6><LX-,Qfe.A)VEG2:KQ
QDR89]+&>&0fFMEZUf,;C&EI7I\+GG1H/.V.K[>_<aR:@gSK<M73EK5a[,<?:.IA
dg-.Q1JHYa9aAEZ3&4-1-XQ@e;]TS]\M=TDW2VL0E\/+aY+Q\940(2OT;PMTARC2
_LJYPA^eUcaDLR_[c6\U6@I/2Dc>JdWD)ff(gd3L:0NdY8Od4XRZQ_.L&HSbgR1N
eSGWF-Qd<<Q#=7a1_I[F>6H86&#M?5:L.T1(3_D=ffL.>&;9Z/T-B\ZT3OF<.C_.
24&77e:J^Z0T(F#[QAfO\5^_A4C6>5EUc3;<CP=B9>8H+XGb].LHT0H&QKRHH4&+
8#;M]ZXeGEfE:@#8Z#c\@cPT3E1^U7AD@.0-:J055W&(GVF:a\+Ga1]@12EMeSXB
N]EZY+WH.0VCJ/X9VZVc;Ug^D/TgR[LL,15NRODF)8g896JaUH9QO=/.<,B-=]5S
NE/<>V1XdccINAcd8(5-[\?C/G,\KadJ)+Z=FgFN9fY8?G@a,G3#Nd]O1cMRSUUQ
CG7KW>g3,)E=YLg0BAA8I,gA&>]Cc[;>&5bdFdFaC)[D>=P5.>A1<DABUdT6Wf&-
D3Rf1)+#g]R;;c1],a>_=94B\,-NdH0PV2X.Z^&@[LJ\4_50X#SF,?3GVMGE:6bf
0[ea4D0IE^I]]0)G+/H97dc0dRV67g1]ERK(4YI/O.:=BE72DREU@f5(eR-_NQPZ
)6PJ;CAPgO,b#=.E(0X15DRIUfHX1ID@A-b-^.cY]&^d/DX.,cSC#OX<L?Nab@CR
bW/b6?NU47CDZ+BB#G^D:US^:=?PfLbbRb4d[+XP<5_,MYGC9W-9V?a[D4AMWc9F
KARQ4aAEL+A/&H\J)]#5a7(M4-RaU2OU^+La>ZSU,Nd91eS#Y7dN+6[PMFbbDb:+
5cYENM(3?_S6Cg<9SJ9=KG4OY/1ga4Lg-;MU\M,[9,KT^3LTP+K6P_47e=[0_(?N
\5c#\4H1gX>QRYUSHE1T^J;UY(8NaWQI0Q\0V+N,DbHC3c9=dYJ@-O7(??b#\6NX
BgZ(A/XD:H]_.eWOe7[]]EFGMLG+-5Wb_IG/_CYTX/\c/cfGQ\3O)1?5#G=A;@eS
&>8dgL7L7X]V<_;?692H<HbKG=.0bPaIbXZA^?ZS=ca>4g]:&;f(f2@6g?H=21c<
d-<3FBSA3VV^VAKN)D?YKL)C0E[8gZ2(CA-D,=)fI7S3+J6G87?c7P9:EO#B0;RF
b##JCJg&cC\<_DIcPBJ#b8F>36dXXfHAN.-/g@>G_H6/g4T(d#_,V^<Y4)HLWLME
Hf/ARPaT=^\]>TO40([?D9EDG@(2#a9&b&#MLO]2E2\9QG8f262e^d=7\UTK,b,=
2:ZgY?JfDO2#L+D4VbC,87:R\BYPX\V8@BL5W/f<1gTd>[,PZHF+P2e,A^2Rb<_=
H\/1b9&=J)(Raf6a=C+4fJ,Je9VJL5Y2TWHW5YUFfcPE=Jf)g&PUL7e/QC]A9IYG
&Q(Q,,M#5GfRH0e;@;(1063R5fN/?NU?d)@0GYLRFP<<==H5Z658d#@8C8aVTg1Z
#AVfB.UdL^G(3+[<EFd5\L)Y@B6d./Ob^CC7<\W0CB<@OA-?7L@FP&8c<(XR/bT&
?_.+5T=ZaAf[;bU.cI+EG3D_0ceQ(BZ4#7YbU]_Id_?2U(Y[QCGfKg_KUM;@\/a0
]5Cc[R(Dg8JAgQS/9;g1P;X1DTa5&S.E<.\c30:E]T+cfZTf6afgR=)AH#[:LVTb
VA&0VAdMKJ+GHT=E&aA@]J]V(4VOW>E[[aWL1e4].^FL[bU&Z]C;5/&DP[0>G^@;
^\V>:MR4dX-=H^U?]3T;Q4^Z2bK26[eR9<>>WR2bXP3I+]\-UI(_6AI@6<def_Ea
59>8B+^P7eZD0E@aN9YQ06>8/2TZgWO(2((_O\EZE)DC#g.gQ))^d):WLde5W<H_
M@9d,\B]\@HYfN5<V:T^9(,Pb3A<4:>>g6d23=Ze>0X_.,D[JU\GUN#+a20O^0_Y
=@\R#@21=0^BgM;&LER2G3?)60=6\:M^MK(g1])fA,QMaZAC)0#/F5P<GfWc?1Y3
J&;bQ\,^.NP&6S0LFOZ?JOH/8RH\M)CN.bd^)ga7#G3MHWC98ZUK6FV3O9]Cd(<a
@;QV+cNB6#O<NR;C&_<#Pc0aK(3ZGU>=&E9dMbGQc^H8S:=acfWH1?f[&dF_QENd
B.b_H<^,+,^D7L;<U3g;Qe4e[Saf9(dM>Ag=dM_Y7(@P86M40OJaOQ7HW5,(UZXC
LCB],9GU-<0@<@W8/fR=g;O;C\,&66IbLeb+f,b0&@T99ET=5MgAc@gSY2+WV^8X
Uf3CGZDJ;aML;7,KB6._07#e_4S9Je72?3X8H:6B?MRK+2g_=]e3N9f2ZRdH.\QX
R)SfJf,K4UeGaU[R)?91-91\P)H]#\1R5fK#^3YG/Z:DdbJb_Hc1\^ce.T)d&+If
C0Y1Q\E>#Z>3(5W2;@(LHW9<dP8e5_SI)4HVHR23.[89YR0=<?593>C\YGX@Z-FT
1J;+V15UZDg]cN-T9:@bafM:)aW@NP]0fUBQ?XUV5f[=S?-TWK^C9.R+^9FFW)>E
TIP.9N\d[MJ[3R6-^?:ZMgAT26e459/6PN#N2/d864VA:c,GUQ1+QIA&.bPV8IS.
-W^1c[8L.:C>W(&\9\2SR5\be2LPM+5:Lb5IeVMR67e\dHE8C)?S+(Y-/K]NT@)[
/,RS4g?]f/,b?bUJXP:UOA?\>4b?N-Z@>1Lae2J;c,PN:,5f&5\I:U9C^[f?3HVc
ba97,4&/M,/Ad06AX/,@#.G(YN,UHafJa(E#,b=[Z.g]_Lg7eYb?#E>f2L)[\6WN
f+&8V2>XFG_B>M@H#(,,XeU)T-H?&>TH/.cARF8=>_5U+VLB@^\R\/a>bHVA\+/a
\G@,[c?/>Ae.B<BO+?<5D\WOAI0NN&gd^3_[[,R1PRUNA^3G?Z_5DNTYMU;&G[Bb
\SPEdV/0A7e_5_=g2)W<C18+\gLd6f/&4b?CK?>QHT52ab9:K_66GI@A(()cW4f0
^O27Zb_>(4bgQPec&YW5K9?DI9Fd:A76eU#H8<(b1SMB5Q\^;KF<dX24HgO5bd3F
dEH^NdF-G3S[>cR8Oe8G_D5L70W]dJ),:L7O3T@F?&QU]KQVAKT:]:SP&g[^2<3b
<\G?C@4J##<<83IcYZR4[)=M98QUG+:VIg-JYY+]&VCcA;_=RA(;9bW(J6O8&dg8
W_0L#,.Z_#D_),D+#I+L_G](+\I6_;:fgT)NPOeB3:Z9b14/1.I)[Ua\Bc^5KF4M
4-/M:X+1V2A[YSZAKOcA8QS9P70_2bKR@RGLQ[K2A=/X2T9He]&.ORO9AXM+IB/5
42a=;<N=JZJW+6V3X&+TK,?D_fQ<E],\5/OMNSMf\[D)?<gJF_C^VUaY;MFg_DD\
-BI]&b:X98e[eQ\+\KTB0=+4Y:S[HRV^V;GL&2/U<(TYY:L>\;Sb+&\f<MA=N:20
RI13042aQ8(+9N2Ef4E9a?J,FGG^8(5]W.8AO^16B<]ff@K5Y1e3S)b?,-EVG]&M
Y@f8OX0SY7\;VW=^B6f50:-YG6[C8:-BdH4LXeEdDZJ5RO&>7Z]XRDX(2PI<:+0;
(GNJ\56?(+,9F&@4:M0Y:2&0#1g;UfOfTTZ7Q7=P5DQ1Tf8TI\Zd7cIL.+)07#AG
?E^#Y>//RRaP2e2HP7T<6#90@E4-1C4>f/JGFK8/ff29f)SB=@44R]1ZaX?H;NOL
#6^XKD;dC8K@2ZLS2dIbDSgJA9ffO4LHL.@RU+=1S8L>INNTEGafB19T^DY)5gb_
+Gd52M&/[JA0.SA0+F?CY@U62S:=6?[3@JP64=a,Zf#Y7gF<U)\7BY7/LC7dT64S
IJ^\Bee\Q[;3\:@ZPg#N;JIU2Q/?8^H3ULB#PY>2E-U5A5;(BGBg?RBD@F9R<OII
(XUA:10;]=a>,ZLOf4dF@K6\PL3gE>Ug/25(<N^.<C9LAF9T=Y+5687:XN<:&XB4
U??_]_XK3KDCD[Xa8Q@LFOF<XgIJ9<@+Z;6>)EXbaD.>5S+F#MbS:NK)00(AbID<
IU.68)Se<[.]?M9P3J?4(fG(=,>4AfV)7[2JT<AH@H[W:7W_&Q=IE<[Q@R:\[A;5
ZR,?YA6_b0.GN+LdVG;3FgMcYE(>3G(XY93&024V^dYT2-H/[C32IK<?JO;Nea_P
-F&bVYPYA.CZ5DgGA[R+)2:WD2P783_8HZ\#WAI_M<NMf]H=,BB64be/FcQ)b6X9
8,8J-V7L&&>XM1?gH_eYJ(BeT[I4<O;AP.)R/:^XO/ce40eV/>f0ES,#3B,:4YPO
-+bC@WJ4Q;eJ_7OTOZKMXQe+O8KBS[[IP9Fdg5W\IOD.Q/)#I\R+E([?\O8[df?g
Q1NLVg^<QO/6+a?@M;/0b<GDJSCL#@H\^)[8:g\#6&D-51/7>PeQ]@XM1[=b?>&?
4cdUT0K;g3UR\NN..)7/)U,W.1gP8W(RKCZL@P1:WaUD,J94PK^HK6:,=4FfTNJ_
5:=6XP7B0X=XAXR45L^[gMMg@6QMEfXRf0FD3&eSN&CcWb#f&5NDSK:8.Y5K>VPO
QB^/=WMQKR.^V@Dg:FAgb\8^S3#EaN<06CXM,AcR8ZPM9c2OG?01NIGV(9gg3A=>
-K^X/XB=(aKF1DH\4A3B>V@cDc^bFU>[_A;LPSIOK<7Yb<Y8R3Q.A85:F1fHI-IB
AA^,UHB>7-?KJDgDe#d-#)7JFUB36)4(;JX(:&P;:82NGPg[G2HAU38cPfd1P5QS
4:IUggL>@+AA:6)<aAUO<[WC@D50AV<Q3:?QA4HZ\cOT1BF>O^1b/[(ag)b3b,3O
V1E9K:a]g\PDO+ISe1VO+2.Og=D0b]>B?&]+LI-8L_;@[IE&<R)EZR.a/fITJ^I4
/0.U8Z/<=SXV)H3RHK^7cZ<e,+\Z2_].^,E5<R4+MA\YL&BGN=&g5-0;>4e+_UMX
+Vg9@(7(M_c<a3Td)Ned/aGGHT7KZJ8VD=))Wa7(0DH&a\adS7F]\;O.cWd;+ge(
ZeHaDEB<J9(K^6QG6)QOOZ=4ddU7e1g#2P)M[?c@F#,=JT;1._O6_KD9g39.DITC
FNc(4M6MV>:9,;P&gJX;[DZ&1P9@WPYTL\,F)CI2P4YE]YO?EGVF:N1e7A/9ZM(b
I/Lc\F<g?PUHb3c\ULD+ZORLH_+MS[SZA]U1KaAK91P[986#Z@F1eMGfIfg.,6JZ
(0(4MLDM+LfLWW^)7?=52^FS=)Z@@BNPY_:RC^\KV/^)Z+__@R;9+BV0\#_bBUVF
dN)2aD-?M_K&EBe(@L3M3eZ^;7<<1E&F4WGZ#C\ITgeDHN<T-ZcH2X+RDSf33))4
D65#<b#fH(7d,:b>ISGB\+9Q+0NJDX@^WOJ?cA.2[9d^4<RL5?W+Xg@9DDYY?FaW
;cHg<.-O=;b=^#d^TZS,:TWXJ/?:IRS<DKM(^0M(0bIg6eef0BWP@16I>TZg-EbC
LL#JEPe0SEZ>.QV4.\N5@8<?GU1DEdKA0C9.Eb65BNWNW@QP9g,,T5\+EC0Te>bO
G^a0b./V8O--G1)&J+0Q-bDQL+B6)Q(#N&.@DC5;:W]-=\:Q8VV(f[7RX2-/=^G;
0SUR_XAgS-RHN+3]&.-FeL+5VL=VB0(C\bT)4.8)\eYfS]S7aQAb.MS,:F]B_?@S
Y.9,d):(_HbcKW/K5eb/aLPIZa473caVfSK_GaC][\=J@g[G:e4M9\>f93WC>(<D
IM)H21P79E#4,bR#M6aWFO#I,cD008N8(FZV(HJ8/A1^>aCH([8f7+<Q\@\8QL>G
^.PL:c_?aG7PC&SB#QS/_LDeg6&)E=\,TJ^<M6c.RHG#OMgKbTS1>54/433<O;H=
0W/<C4W(9L9WZaS<YP&/H-<0_NRQA1)XYS]?[Q2[=LTAR]5IVSLQMbR_JSGc=2?8
U;]9(#bFBe-+O@\dH\+dd-+c0BIK83Y^2UeZMebBdQKU:GA/@++UIF8<EcHgc<;\
N5(,A-3\<\)?.#QdfZ(Ae:f0J8@/M@9b\(bFQG89T;)QQ49N5D3SRBMA4(K2KR=Y
29V8VXa;ZR&BbPE[G_^<2?Q&(<c(;P/egTQf2b.@Ng6P>M;gCL52]f&J83NE432&
aBcaVe8U@,3+cR8IFc1/6)AYTI<Fb\H^?&7#WeAX;3QV\8FIDQ[W,T?XbW+)##gJ
gAKfBX(dQ+)(]a6?>CgZL-=W\>](&(WA89dN5.R<W1:\<a>U:Ig8(e>+LJLZfCb@
e+M#N\Vbc39?DRD4[2H.#I7XY:].&8&NGfA]7ZDc>GB5:WLMIX/4#Gg<Z(D0^]+a
YSQ<f-3,HQHM.=?(9_RceI_JN#M2_4);XO.7feeF^YUA#G<5BXZUWKR[=,F/#9V8
;/B8:OMb-@3<0cL3<=:I_gP7_6&K1#B0,+]PBC+)YO][b&S5Q]I7GZ8:N006IT(H
TZNPR;+JZ)(\<,JB..^b02P/eT_I(E2^6RXbO#^7+(&=5SXd[-3Z\:XWb:8+a/2+
<^QFMag9;0)0Fcg[@.R;._0B&^_ZBN:6#U7MRR#,<[J.F3f1)e4#eg;79YP=R<^N
\c?(?[6]G_/O<OG1f7cd47J)f:LPIcH(eL/.94E+L\JP;0CQ+M0/AG2^KA1[K-;@
g.e<Ae6)aKUg1/\JX,TL5K4HY<Y+PGK\O)R&TP.:VOQ(7GP4Q&TIJ#]1X92,+2P=
<X)LCCCN:<\LO8<)PHcTVTZ4#EKMC8-7bdQ/WIRUNWR)3#bgQf[>;E2L5^Yg^M^M
2M=cab(JJ&-D::;[#<RL2=#S=EJ)6=X\gDB0:WH33;)YXRMT1D7fR-I-GH35BReY
:Q^&+],\YHZI:\XSS/F)RR2(-YGcMPOO3=Tg<-gQ5-+]a,[2-#aWCLMQ7?FU7<#0
bfHb\c([RWU:U9)3T0S^89>]M1a0a<W[FJ.;HT\IYNZd#^DB\3)RIQY+PQ<Mg\fR
(]=cE#;BW;W>Z@N<be?b?S]g?LBM1Gfa;[d,2[GW9CO_=P9-0O3_J]g57eF<ZMWY
:17HMbT0DAf?]5.E@I_LdX6U\Be5+>L/1[,7=bQ7]OE<LCBI@LMSPQPRVE(=LM]>
<J&T(deB[C3?UW4:-=d<V/AFJW3^0+PIGgg+)?NB3@bECS?\UYJ5+]ZDRRf&SdVZ
I76.)=U3U.^DEW[V742baI4H7WWY:#PTJ+Y:.:2J.,QY8,:0f/MKdUd7Oa_VBX1d
-=8Q1bf[ePFg+BLQQKSDQ,7WB75bG-ga?L(.OL3;YGN+<ZLBIX73^&_.SCEPM_Q2
H50aQ]O262RI?CI)fg?NAODaLD<^64=E7-D&_==YM.^U2:\SHSI)T+MZc.RHWKSV
/abGg1baX<?;IO3>/g?g]1[:KK7T6FI>cRSg]9STK.d2_]?3A=H?W#8(2:Me,/XA
8HB<:;dZ7d?.OYA@^>J4,.JD\&FKfK(W2aJ21^&--Uff4MaRQUM4++[ZONDFKT<c
=1BXQ6W=2BM0?=dOA&EB@7DQHK+YMA,+()Y[/Q#V3FV[@WfgC6ZaNbaEA@_9S-SF
ecOL_e)6MW4MQO_^3a<FRY:?d\Uf,Pf\:KHJA<8:UE<RC<+_3U97b>?E&B^KNJcG
MOPe8J75S^)3.OK(fKH-@HL&_-@JWZHYAUH_E[7W+NeIXQ&))R-CP0+QPFRZA+S+
FR.[]:17.[QG0]44;?8aVZR4;F-X33]N;+,##4gM#;WKTE6dDWU>6C1^H(\C7W76
DX_L2:K)3bJbL/ML0<:)/^?/.Pg(\Q4cE8=\S\VQC3cQMI+8P+Z1,d,X7:[4:1XG
ae_U94WSK]KB_]=0SXG>R4[b33M7g(2@C.[F7A@&^bBFdR;/6Ld@S;]/dVDQ75GF
b2)INa;X-OK:b&&<:e0O80K/4]F<8EUNdGRYONgYO]Z-+XbJBSW<0)R?BIX@&^A.
#[TK&CCd?X5]Y[5;LW.]^@KAJB.4.6BFF70IC5/:XX,Q^&DP,^Y?54HCYFcS]PH2
1MZF8d]9D,\Y>REP8KM6S/?#/R.0gU(:__:a;Q?LER_PS@cd0>S=M/&/\>URc<.4
:=:FH2_L59?:Z_Q)ODKVIP+]PIVJCU84<B/JLS[beb&G53(GWggS^L6##U5=+I@K
ZYV&>S;J,gXAd<)5K=c/gQRHV,[ebH3HN+_0T43NEUY,(XGR:J^M2A5<)X<LSO@C
P+a->9NKZB>a>GMN-BGWb9PIV148_WcG/S,PS<WXf8Re=_O0VEZ583d5>D/OL,eZ
W3S_^2.C?^8e&>(&df;<dO_-4IE7(S]dD-M<1]B:M-&/Ga@PT)94;19@8&)H<cRc
QU0F#Z=IT)?L@bf;(0^A<,;[B&G9==[LJB/;6[A4deZ9a.K9@]_gKW/D><<Gg<41
87EO=Y23@GC:<L_/Z;085E6(HB823KYC)Q8SHN.<6^bVK=CH4U7.FVQ77JE>I_1D
P8>18@?(3L6DP>8[J]cdCTF7Ze?<6)B_?9KK_ZQAKO#U/4XUB9^&g3)?d;g&gO\)
fddC-(.O>/2W8\.HE#&UHXdUc\9UO?[[:L,W#Q1A:bA;43GZI=L0HV^eP23=0MM:
445W;[3MLIOZ)G)VXVEW8KeL)((C=4XM&3GK7&DH.+YCXIf.A_30D:\-@K[N=Q0?
2RLV,VP+E.:8e+=CI/G(5@IH\WM2-EK1G=#_.B=2),<N@P2QeU\.5+KR^Oc2e+.E
X8]ddJB6SdPUYI_?-VAT4>cY3<9?4@5Vg2=9Y_APD35[FH;0EN&_+a2/QG\f^.\?
C=3^O,a#U20:L]0&LJQ;Y(&HF,@1I.C1HBF_/VF4+:MAI&JHB\H\GS::7HdM55[2
]B^?,E1eJV2TD>#ZKD[71WJ;:X_-O<<7&C?/54I/4^_56:e3e/?;5f;E_IBPL:+Z
Q.e>IM3_>eON9N7V>#JHCB-8K65O+LM<Pc2CKdUR6.bALR=&\M7<\.[JSeBc7Sa?
)L8gb):adB7C[N@+-CfASde&@Y6fW(;O/L/A:F,FSYBH;<S5,?<:;TZCVgQ+P.HI
\TJ\fEKF2>@fW(+XH-0OTYL?RNXE=CVHNCC[Vb?7]ODX<I>N.6e8.\H_IEeNK-a5
8C#-#(gDN.EBQLP;8+;[^W3\70]c3EZ5f&Ec6g]].EdGa0^U#_6>^R,T7J-J5)E0
EJFFHYYP)aB2<.R]fQ_gNgHH3d:2&V:a^)d_ULJ1&<9NN\&Ef,6;?R75K.TM=[D1
DV4K2(UUR>V\TddQ<KXK0cb5SP>Q&.g_IY@^DAT_RY5(:X\JG+X(EfaA4GLM&\/E
]=c^S04g\\X\28LB[9K?]@[T3_E9^14F\2\II0)C,/T^^7G=/9c8?AKRQK;(#VU:
MUPRT-.d6JN;@GG/dNS5BN^=X_V4W8HW-468@RE.f)d\a+X2N48DXV)&S@#=B08Q
A9_f2&C9Td=g\WN4d&:b>,?M=?#CC.6YW0Ne34M_4d#BCCD,V_b[?Z4fRO2:KB+?
AR6#>@6@\(4/0W7DJ8M]P+7+Q4]ZXbF-W]=#5?&c:5;eL]6XK](g(cS1HML-+&_D
U\QDD]DJ16EB21W],3-bKNBAZ(ddT)2MKbKI(2d(462\KG,]fff.c)A?H<EK/Z9+
c:E;@:79Sbf2IQ7=B4;4Q?0e5J_^YSH7#^V][a6#>K&/RWb_2XaB^J2/G\DS&2fD
<PCQ)]DM5,Y<a-C\Yge,X?GL7gLcNVU;+UL4[ZdXO&?Q<cgf.cPC4#e[A9/fD[MQ
UNVWY@I#MAL>#6b8gGVR<.6X_])4+PQ&XE+M?Fb-2Ha<SWKd).H?IFY8c7[B8I(H
@a:)AWVT(1Y:&/bF4-@\9gYI)2&8P,1>g0a<B@d1N/VKL5L&=Ic[RXaT:d0D)/d#
__OD=8STP:GAFffT0c^RbDKVcC_1Yef7?UfXJA]6,S)9O<2eEK\MB@;ZT]#CUU8R
,:VLIN@G#d-JV3^+5/6<1UUdFecI[2XT2PG-SZgUH4]KK_^TO8K74K+d[bKU#^_7
ABZ<[]e,/#UVM>4F>K_J59GGLKBNFV44[8+E.R^[gU;[KF?,@[#3O;LD@[GK,U8@
TfCLg>P7>bK)(FA=R]0A+:\\#@P=8[-I(RK,OYG01+8;KM-+/X?R+-4(e^I3bc\H
\VS=,?>f:TJ73HMCbK:dA-bW+[Zb;34KO8<8g+?V]RWU4G9LQeVcV/8X-4)f#99)
M0-\D/;)ZGNMV2#UV<7T3@]G6<S2AL56f+V(@CEb_5<P\RcWR#J).[][?C1HQA0I
eWE?;/RTLBg4AK&1J@b[2XO4B#1b4^\G6FK;F=O>SbD0D_&E6Z/GC<R#1F;<HFS&
NgU4Y\>\TERbNL-))9\Za.YKS:f=4Q<-R;/L\(0QD3ReP_/aD#<gg]F5CZH)LDcW
<@WWUH8^J&J)c?V</I#1G^FXQU7=:R2gbZ>WP&=-]b[MM4EWHFb_0[=W^JfE7-6)
[/ZK:\c=]cM#+/E^OK=9>:VWIB?1=LFP,b1Gf=[CN#3AI=SHVHIVSTOa6<fHP]H>
C)>,geV90_UP.+_IT2[G=^F9I9Ab?E:06NV.[1Z,#QEY4_6cfWf7@>#aMI7,KKFZ
/f0G]E=B<-F9A.>dUM?29BZUS?RHPBW5@6A#;9WYBV1eJ=Q&#V#R]b;FQHTJKG)^
_Yde8.3TKbc^g=X\Mg#FH[012S65gI&/1[Q@@L;Jg/:+^NG[f(Bf>5c)B+E<f>d6
CKW&)98MR\3YHF]69SI8Bc=@-7H^SR7Q(eM(FbQ=OKW3G=MD.E:LKWRTR(_W0.06
BbBBf&dD;ANO&^e2M#A[IS-;eaZ>T)H1&9LbU[a-@RL)E=FS#DebVTbZT4#=:;5b
KE3(.WJN+Z[5T^V/=ZO3#H9Z\^V-[(TE#4WQM:,\-[H/<d3<AG[9VeZ[5[LQS)Qa
M,JJc[UGD(R]5\0b<S&dXR()+X+X5J/^AX.;+YS8K8?[DaM6RVaA22.Bc(F.2\De
&\Kg/P:60E<^KU:6GZ.L#::C99UE?(WC@U\9T5;;W7>(^),)f(N:?#-EHeB,G&D^
F0]DXGKMFg):/(=MeG4L(ZVHIPA<e\E#<-XZ6W]bT\T-+b:M_=2T<.[H=M^XA1<.
4#AEfYOVILPSS=H.d/=?][50\^GN?9J)X_3b+bcQ>K><(,E)@8XX##c:g7EQ-GBb
eTFT.;Xe.^Z1XM]YER,aWfbDIP&RMGKRcVUX&b=c4JUHT,(M?\_CNHc&5ecbCLC#
5-4IcgG)X4T_5DfF,-V5MTR+5dJ[3[^++T;9P8#7>XZLPK8VI9I.33P]@+cB)9#&
\@<ZaWYQXS/#>C>0gI8>J&C9#SbG=XOgAY>&TBfTF66g_b+VP4CJ)g=OG,A4I7(8
T0>A;[U(B,F]8>I@?dZ63)PKE0QW6DYfVU<00BHM^&^=CQSPN.I:+=6P2P8?1cZ@
X6)e)gGD_BeFZ/_-e#MO+(.&dH1T8&Q[Za6e6N3+(GJfd]X[aHA55Z]GF:gc\We7
NYFK?SH9f+Cbg3:.XNTKYcOTa(6_P#a39H&c<SdV,d78@]1>9V4I8RP</Ae@6XK:
[;T>Fc9dCGV;9dHG3P2MI<OdMC@g]AIU[GD)Mg(cXQTH+M0T(9J1=WT/C6\c70U6
DFPg.eN]9QZ#3Gc(5--2dQF8\+7HAV93?Z.B+&N\Z_>R_Vgg;S^P@U05@[+/e(W&
e]#K7P?7HB]a+bFNY^DL<.,29f;B+cR35>cEP9;9CK_f\?:D4_KF1#d<ea3S-@/1
b+8=2&=Q)1OT7,97dC,;4H(D<VR,3&_859YGBPT\Ia3#4NY+T6;f>,fV<J:E\,9C
TZ=d/N7JJB:T>59CbV[bH8VB@O^2,@9GT9eP-SK_RTZMD2_g;-eF?K]6:g_:6172
I;;O:,@8<7?FXcO8RB9M8+f+)N2.KZ1TH;T185F>(a=\(aWbT,If^0.H9\?65T#c
C#YZM&:9,,[+5.1&f:/cZPZK&>PFLN93@D;A\5U4b4WcXZa&<b5cC;F[+_E?C#\-
1fJGV6XAgRVa-&8-(LZJG,Y3&M1Gf3WD(c+c_)?)(Xc_D[PN,?b>I_O@].cd)PF)
Z4aeYaR-9@#<>]I\H;ZC&,P\^0Q5Q2b[C#&+ab/c_1g:Y::6cWJcf(7E#6P&,BV?
f/#5)6e;AY;T;2:,QQ++DNBJBAgSVb>=f;&c-2^fJ?IJMPN/<=Z9eO]DO)4ICgbG
P5&O&G;RdM_JI4YFdIR_KM_K^/YI)[8bYbI4F-SPC(=-71W:-b^JD?^4#2ZQA62C
OEA98/<+eM:#;#L/<Pea7YT9baYI?0U]L^C)\PD;Y?@,bBB5R^WBVb9MIW9KfW;9
#>CcV.SDOLeVJ:2?78\IZA+a.MQ].LXg8Q:dfHZ[a#,Q=OS?52dJA62fZ&VB3,I8
R7-eKJH2NecK,AAa,4d=@=T?Y<H5c+MT7Y<SNZgQ&F]^gJQHb:g/\Y?dgR6;(;4?
<<]B4JeO3C+fJ9DePYNA66TU8#Hb6I9Ce4&-8U.=._U+-^R(-PZdII98Y_3A<7[F
=Jg_C:A[DeI[IR)[c>dcdG8A&c+CKNc3Qg1]4WVCZV<_-\fg3WU&ZEW(#DU0VK&N
7:N0S14bX1=)b;W8.FDBQ\T&]dRf/.QKc^1G9<W1WgV9#NWfMRH.&A&De8;&1<fb
F9d8EON.Q4A>C]N4FP0-:>&Y:FAeYOe@C\52cAZTHIO6U.Ng5G@RVL[(@K)L(T(<
(VQ6Sb7a4B[9#P=.]HN+#WEK&XFYOaB+LQ9996DLGIeU;@TO4OC&/[U]?gO=)?8W
\6>YgQOWWHQG7TYCKNaI65bL7:I=I9Q[D74c,7?,cWG@CVBJc]AP0eD\7S7<eW2R
0;dO(904\d<QK]M->aR(?5S:=Y?E/1GeM[PUXZ).N>P5e)I[eUDeMQb37\c\,<01
L35:ID(=Q:2_Q-H]P0eNKRg9UBV)bLUQFLFKc049)6eKO;W?Y3A7M7T;03g/:I-g
4e0cG8eVG0AIGW-9b^#+1&P0;RV]30E@#9@\<]G@(DSP,P(ga62(JJ9JLaO6ec;:
S4fB@8(gT>_B(EJ^=CTd4B0Q&2KPUW+VS2Pa&&LJdNcF@/=:cTLYMGXK+Xg[NXZ8
Z3LS8Cf;(]Dca[be3dYF<:SR85YT?N3ZN@SRK47CQQ#+?V[(#Mb(67.+Ga-c[X\=
P9#M_gVB+G^[LIBR1R_Q\EPZfI(<-c4b\.9VC0a#F0RCGW3.@KF#&1DZ2C<^4FZ#
4:OEUK]=X-dM]?-f(4T@5.9A3820eT;,2/@[.H[J1^N,L_Z\IM#S@MV_Ocg1DXEU
GB(gc)/6b(HgaNAG>54b3e8)BZJR-K0B+YGAdFH4Z.^UKZL]7L--fNf2+T4OC20=
6N8<b.3-=VWf,-TE5^#dDXATZ.&4[B:MCB_bR.G,PALa:1MF.3XZT7W@EC1/TBcU
-GT,cJNffFXO__FfbSVRJdS8UCUaK9+/BdBCU_+D6PZf+C\I#eN:HP32d<0aP>D[
0GTNUEL#,JG&V::=+O>P?X--O-U4JN)L(-J#eEE?#0AdFg;Fg;JRV[32_O0@LWHO
C1:G/).OWA;>J>@7-SF#5(R0WYId,@4UPZP).)VKVSOc1fB2gQ+CF-]L&AX;ZNC+
Y9RCW@0,aK_U]7B[RgX:>;1VH-d[TC7_1+#OCH6V7DH#\[;8X:+?-KB>P9-QbMU4
0@?;U(9:UD=B#89I6Mf(#?WN\\&P#a-dF1FU;ZfE)B^O/)0\/G9=&=HWH&7U1@Q<
[(I^_O&88]@>JJdgKEHL?Q-)Va[[^4I:9<<HGQ9fPOEA@;<<L2I8M+DLH.9B.CP4
a270O5g&g3#]&A)\^RJ<f-<,/6R@IcHO]6.e4=A)AgTgDG5:4c+4gACPgX12B4M[
,&Z&A1Y,;E;R.)^O+=bO:4ga/9N-0^<Zc5eUNdVPFaVYB@edaK64DUQP+e\NKcQZ
9-5(Le;BCB<X(179f6VUF/PT?C,]6,ONJEAFC+70VD1)M>HH:C(A5>VdT:2/=cEI
ZDI5GH/fCAH87&[(EWHGEHV6JP9PYHH8,d#_PS<+L(R]9W5IO&FD:2+e&?C5IO0^
Ib^0XLT=,c93[dFCXfdX@N);L3_?J4H5J<c:WY@BSUCZ;XJG(:#aL1_(N2H3.5??
)3bOGVgFWg\[/?4XWI;PS]JGMd<06<0(D;^.JNcEU5#)YZMWM]\A&.g(<IFZ+#P0
UOL.:0ZaKf)W_H)9Q54V<#;gC17c\^>6(;bWBE?+Z_PcCZ\@PTV).<1->9[T_ZP=
a68<J#8N2-TgI,D+B,#PMV5e+[IGG:b2J:AN:J@fGU[-\>gI(CB>&eK6g.RWL7-d
Y==f.G<LU[H_QT(Z<4g7D<Ug:+7g)\)K9YUI:MgPVX9E0O&X,O=3F5LaVL?ePTM8
J\WN1SNXC]WR39ZR2)]H2G&Qd5UJ^0P(,UTS]ZBgecZ@XOb:Q;\3ObbNUg5NRY]P
[RJQY?GE7ZHe)?@=YX6Y><dVW3B^,42QQf@A+]FR22IV4N<^0-O.0/6]4<<W>882
HJbD4EW]B6#1RL66f78-PeI-U^/@&854;_,gE(?J0=C=+B-UG,[Ta007_OTB_Ye)
Y9FMEZg.HMV?HZbbYE&0g3]g#1b6U4eB:d6e1E9?e8PM5bD10gHf)Rc>2b,]?1&K
TR[].\P;c)8QFA/PABHQRf?7D4V9^:ZcQdBCJSf7B==daEMPWPF718TI,^[a[(1P
8).J)<TJZ-I:31K0+B(PPZJgD2-c>H-XaRVHQ1-FU^D@b7+C8d7U7I8,=8#;&:6Y
DAcC(/,#=>WU4f\6?;(C83ca+(=PEQNCaa#(ggR-6a5E,:&JKL;AR3-N/L(I^H6Y
1RLAMWHB.Lcd+5bI=)c>g+IG_f3BNbB/dJ)(F?N94M.FFd0H1eNS&7&IG]8e,FZM
fD+R]I_W;7D7[GfA3\(TVT_P/)+();#FV+D.R=)C5SW58UZCOZ#Z9JI=g).G@ULX
g_KM#O0/LL?LX\REBEeC(F;U/e_gC#1;=F/XcY=67f(d3_@65g>[BY-=@B^[-)7d
D#)Y?YM29a8@aH5L7e&2TAOU?XOO?EU9XQB@23<U2A/+,W]2Q-21_TVOJT\T[F\<
/RTB_RY.[)1O<dB1+,08O8-?e-<O<KdO>>NY.:^&[KLO)fGO2\M43GK:FPBR5\J]
cDWN4JKDLFeM0eZ3-9:d20aR#3NG_ZGeFLd5-fS?)f-NK(SUS#TWF7-NV59+XP<I
B015F^Y6^\F_9MM\BP,9825==,QH_:d</FUMTA9I-;ceQ9_,?:(6<O]I#FWU_2H0
O-Yc65;T7>_6fdP2.9eZ#Z-KcQC;)\(S?/6S3P43L9.TV>]QZN&CI8:bC7IEG,FH
H@+[PB10:R2d:UU42@\f[7c:_^]:f5)85+#@[J@c&/W5PWeCPVRMa[@/36R[[g8\
,=D<10V;^,C-6OW8gY_DI<B)+?b.?24@/.Z/M]H_LZ15/e0N,a+WO\OUXOJ.O,Xd
)+?AQ-J1M257KU&E\3/Y1=^[2H=P_PV\)PQ/H(SL&T<fUN/Q8eB__]UCHg@eOEW/
I_1[(5MX#R?7D;1Kg?CAL5gCN\1,<GI&C2D#@LJa>CA6;?DX/7@?EA,NFKUX=)P0
JQL\ZP0:d_CQ>JWZNHSJ:-R--N)MUTD7QW1(e/M<<dY<&S=^L0&d.9)c0LB?]6cb
#2Y5V&<dI;e5^@[[+[/fGOJ-^.M&+TbB-8>ccQfc&MGB/MSX7YFFcED,G?b.35X9
_^ZC]HP_J[de_TgI6;WA&Z&^Y_fb8WDg)I<2NMXK09@?AIN#28a)g:BK_^_c6INU
dY:@Da:=a20O/N&-G+feedQ:#f#/][:?6(S3C[0Ja+XcIg>bYDP;gD4N/.?U+2#e
ZIX3&95S6\WST-cVAP(dgC9(F1YgW;QN1A06cEO@XHeJ;<BX#IG>e8CI0UPIffSV
@YMEWJUPD/2dSLZE=QVAbJbP8GD)0-3JN93Z?X[3R9.aQABfcWbHd\=@R1Z=5MGJ
Q1U#g2^U8?>>RU_e?2V+QX8ZHbWdK6L?1TDX&JK]W+^C5JHJ6]85@]2NJ]#]C96L
QCYKZN\&SW,+a(XOTRT18F>T=L7/K#gC0>3f;HYMT3H-8M#Yd<Q,<C8GH^La3C?2
\)UbR?FJX=deee?0]SZS)&F#XaV60Da,O_)@WUIa]/<^fgO=[?2V_c#RS2V9.WEX
=gZCNKB/Rf7CBR,,H\S7.Q3J;T1CP0A5L3:[W7QcP^+F:]5OQ>e?[OVG_[X7\D^Q
LQZaE,Z5Xa>5W9LYCFEID,K_0&3+7U-.;78KB3:7:?K/8VUfWM-SFVd[3FQ6dJ>N
9:=0Q263fBCT(__FSM5;EE1<TK&>OL1S<>:89<D?T3ZG@RXMHF^E>60UgWOO.@=K
30L#&&ZP.@)D5G47VVgY<7g#\6_<XHBIGIPMcNMb<(X11<2K78GMZFE0IaF<Ta)G
103:YI]JN24XT>PG._8:2,71#,3Xdb,T?7Hab<2g6ZB&KV^d?IFcJ.=])?UXQ\?4
X^8f0IRH/<=Z[b[,JOg\Qb5Q=7+G1+O>dJ[Y5G.6H_:5?aI3EeN#AYTU=H;)L:4+
>3PCGN6_L6T0_9<-bbQG1N.4XFZ_?6b#?KAaT&ZB.P&CaWFf.T2D4Pgaa9Xd?9ge
Wf3Y8L3a3;I2\>28,=bP__f?@),-R;OG:I4X)SFNP#F?+-;VeKJ/3CgLdE[=8P,N
aJ@TdCcWO(_LP=Ia?&5U^XV9NSUL,fYeUVZ:?NM2_-a^b#M.G)6E/2Ea=<I:,/4T
MR4^#OUPV?KKF=S9X9\A#9J87Bb08.:9SLF81J^cG=Rg^-ZYQ-\<4P0Y;J-b_1e1
cT=P1T]CDL#B691@OZH023DQ/J90fCORYS;DJ,G4FR2^R)ZPJ5YCKD3X,,F.+^>;
BIQTG:NGAK=D\A3-7U:c[>:5DJ18,9LOe433A^^7VIb+7[X6F8/A,0.Dd/[OT6M8
BK4^N(-+KE<b-_bTVPT8,Fe0]\TRHYHBKI_L9SJ&POD\8:Q)=J;Za#\&/=M?<(@a
VP8dV>0YfLfD,0^:gR=HMG^^G-d<;64(-K0aI.35NA1[4CW-[.2GKe462\:9X9>Y
9TdER;NPGU/LR/bCQ5BI&6=PLK1_GYXQO..1DOGT/+UKB8B;a+<1U=\UX.2#8OH&
MgcN-7<[?ST0A-6XF)&=ELZ:cH)8P2_+1QQVU04c?;R_EO@#0Y)J:J5HCcG&MNQW
,LCHcaGR>J=XZ2c+d@/KAggVVW?9ZTKeU/31&)&EH;LT.O7J:IRQZSd9K.3b-T1T
5;a;c7NXeB_4]KL2<XPg9_S;;5\OeC#2DBb8NM9A@:c(O_[TWL.JPb_)T]T?:@J&
G4]bGA_bC=S;dX#9J,.gW]5(-ME((aJO5)9TA3#V3Vff&]gS,8CDdR-5@1e)BW;:
c()9c-,RGVe]@[aK646gJ0E6IV6UPEc7ad6W&WV[15NK<J9<G2TP0M9LVGV[>\C2
M(O,O>]H&Z2;,F2Q4QQ[B-(=eH3PXPQU_T5LbNB>/XI4;?UK;,QZNX>&AP4;,@\f
IBgbO]_cOa,.8C3N5Sdcg@4F9VU#1P^W\[WfeO_F<H#<.b?H]X+6(KM1RIC:IVDK
4Q=,S.ENb/cQ^VEfV(6&E1SMX9CQ9QfEf)/5S9<Za3DZ/^5&^bC[;>]>daK<f-C\
7VDLe4HX4NccQ<H>d8HeZ6Z,Z,aJ05(MCCO/[LGDFY;B)/IaF=VF,.9><Eb1TMK_
M998^Ge^4J[c07INI63YO)g9,.;34HUF2H\<PD.6/GV?[,C7+MS]W7WR;@Lc+@K9
Y#ZP4,NE473Ve[I(5OgVA2HMT-ZGUF0)7/?7I6NM)8ZO6S+eK+;J\2VWB&e1NK-E
T^EE>:Z4JIQ?K5+5eg(A[1^IOb,XXY\-A8#-Tg;f:&eZf>eB591V7&dZ;)fLD-JU
.G/^e7_IHUc7:9eL#gO(Y,,d7NV:>/3LJ2g7=E-g7KU8@LI7daNJS+QbM#^WGJdN
T68Ib#DE\)39#</f_>=e<__2@956NGPeUaY#D2^5X4/I7=8Y&]PN9:^TQgEfVd=7
[+7CTKZGU,J.Wdc<XA)=B_,40L#]GQ82ZLY(6V3&JQS^ZA9H#R@b0_edXG<@;<8=
(2eO5XNg^85_;A.gd(HM+(;+;FO3+5V;f?.0>@SC\<bLXcaT)7#3]4\IC6a=/;>g
8PT)VI-8.Pab/<fFIFaV:5fP=@=LBD1\9^DVX9C=b\9]-_K&C+0SOTFIb\#&^M_b
.bB)-\_)?AK&D6]BAPZcI)(,b?>b-917fH]@#/_6&_9gR-M(>]_)WXC&M=I7-bI<
&?V:&]fDY8-HdD)7\H#H_,TKL.5P7R9MI#.b::P>Vf+gX4[;fTM84P,(;):(\,eD
I5V2=VZE+,QN0OS,RD)>a2aS#+gAef(?0Wf[g+7BPVL0)>VFUSS20P6OLH2b67>H
1:cTLKfa^&,L_P^J)Z[+Y^8FVR(]\1Z;f,1aa88^V5UG<0/\S[WI33,/2X+H8Yd0
=eUV#3#IcY&>.5YG8KQ/-+<c&&YDf:Q\)<\Z@KJ8QRU-+(\JF2aBF[e)eXWJ;VVL
D91=_.bZO(WLKIQ)Y9F+e9b>;R(^Ze4E<V8(1@7I05TV;Z^:PT#BO>88fP/(25FD
[f?8LE]F(+?+SU7\4XORK#RAd/KK)&O9XVVX<7#+a<AY0IE99K(8FQg3HaDPeGC4
7D]1>afYWR<8UJP/AQ[GIJX4(&8_TK^PTYAVdKQTD5gFDfVE7W.2>gZ<Xd0J?)C(
,?GVMQae3[&7#1U]dM4e9.LR=0J#DHONH(W.^H[T4U=g+&QIUP.UP:P>WaV@Xa2>
+geF]_a(E7fZL(#O7E=LbQ#W[X<A#Uag_Z+?^(;^LFK++XTX@0#bA2X>0d9BDQc,
1;#]-[c3+LF-:U\9E_TU:V>0(S6K8:eQ^#/Vc3HTM;=dZWaZc&L(^<?6RE^5QXR.
(UQdAH(@G\cOE_F+ZJ^[#7g\7^.5P3UgMbba#WIV/?E,,d5B^8E>F-J-N@OL=2HR
L6DO\VZ)Y]&BI#/CR5I#7gQ<ETP6I\Q7?[:_(VW\d_Y9C<GdUBcb<,#U3+G/J+(W
cZYTD)#;FZN7^>D,G5dWW@.?CTSd].#&gJD(GWF3_c7bM8)?fb@JAOAOOTf+CI4M
a]E1EWKJ70],7N3WYc.XT/?b(>;T6d;f++?G@HTV+EO6_@7=S?4+CT<=HeXK>AZd
Fa01bOOV]-QM_JWJ6(V:9P,c/EXQ(84@QB812K?ZC_a+M>&R7_6@b<STR)#@Yc1X
U1R/QB3?&b;55Gf]bTDV?fB78.SKOO6H8]D7<_P?B9beEZA,IK]P:Z#)cZZ>I<3U
;_0)2NLa9cCaaZSc:35C5&S[]=dYL+]O:HY9I@^4AC=8&NJ@@(K7S?bfG33RfbWZ
57_&V>0P/0aE9U@X-^W3a.N()<I-LQGN+D&<4XZ;cN2N7bbE3&ZNX-W)NWSE.:QL
gg?J/G#6D;egY;c(bgY1[@LTOUODc6b1H@R/D[gN&e#LCEH:?4#Z44gBD9JeG([\
F=G)D:I?3F-Y9)bKA?&:JBI#Y.M^ANMXZ>L2HB&-.+=UD9[#EgW/])A@0SWM?/EV
Hb-B9HDA/.9J_:Y[Z76=INQ<fNXa?L+WGb@Y(P_6BRge0,1_,+VF@6QEM&N?[#=E
;gd@,cSg0]0@KIB8O,-XT6KcB;bQVN[NQ]52F>&8;QHf?Z^-VE4:8Y5_BA)F+>c)
H@J#7>TdU<AV5Y?5#5<+Iac.Cd3?+T[PY3_:&V?@CgWYDHXgg1a6,</UUK_4(0\a
]E&<TS1gR:d@;>RI4?b?FdLXWXP>WM))JB+[QQbCS<b,gg\>BM#J=XNK4a_,/;I^
P;;OV0cGV#;<HWg3SO_9_C;^J@^,B+C/<HBga859QX\F+OG5:[B5.6K94.-]=NS:
@(=PX@c++9Z04<U-bMUI9S,?^MK_^Z/d#+F#S)1&]2^3LQA8B&I3.C>3B+&)]d(H
L)EYJ/@0&A:ZH_-GTY#/0ba)MWOKL8Z&6;3:Q/HZL:WO#Q<fdR\\)+Z(-c.=cA>Q
H,3^:\Z&/TDc5@[:9-UKg/86Y)R=C@D(V]K\#d(1dKgK(PF06E-#),U?X]_?UBPd
ATc&(G?O[B)?B7Fe8P>-&QYc3FXdd^X#/H=>>g9R\/<V])Gb&H<96CM1_\:a\.bM
JQ.b>>PUCAb#/U[@L/<(g207IJMbQ_RTM0+/5XHU82Y:P.[G-E6V,G5K2ZKBZXf/
=2>Y[f/&@1MARP0R9TBGcg^FB>3M7.d-LOZc^H704QIa_f/IWNea#:>2TP:NX&0T
4NbQ7cQCa.b>&0#<b<L9?@e1IcXXN\/)dd(Z76.IIbFW6OcHLH8#UM1C=:8:.L#O
NMd.RCH(d[T2A3V04ab6/#W&SKU&0gT#\7L>7Q+L:QYBM#e:0ga3_=K>5J&R__eD
OD3NIKY81fN7LeOOJFFA]6.TY=N(M2/#VYb+d495D.&>5FRNbDZ_5[D@/.Ne=>\)
GAJ3E)AFZcS3:VbP:E9f^VYYP4d2G(+;f0R>fEbF#IISF)U/K.N^I+)1WUgWH?UA
W9\45:(-HN<+@2M1eX&B&bF:gffe9&@PU^);1CJ+,290WZ1(cdH,E<6HbXKaL(-_
EDb&eFR4QBb71e4IWS^D7bC+1-c(RRI\<[bNW?Z<N^AfAZ)8<VKdcVHZ&EWe^IS]
:=^-_98[;0Me)Jg[>c=AR]BV_=].cUTZY+_bZKFc10gO\;W7dH;,0N0b-:B_UR^S
fT(e)S4+cdWT9L^#dLZL2J[+RQ][5Bd&X0,ZZS@Y+Y)CRTQIK6:;VBF&cHJeXV;)
O-/97I,8W0.ML2D+K\SWJ5#W,Gc_I;U&RGIeE0G45K&4d2Nd9(=B#P&B.J^Q&KS4
J+faLV1+QC@Reb80/bT74W/_YR?&+O4d,I:FY),V?DLH8;8<FLf6\b-[=?6:K@C>
\#4PZDII@7,/2G/3)gOYDY<VbHgPcZTJ.AYd<@(PBP]C293YG+(U/dJS=eXdSL41
K2A[Va7GY^W-gM:Da9-GA;G\Yb8Z.)1/DcO^]f95TVDeaa+2(MIT=.9He@:J6TNG
FC/16@b:<UWg5LR[M05Q_(D\(fP)R#M.a:@aMU>VZWP3)/#Y4U\J09)c;1JADE2\
:/1[6JY&_U0/F=XgAO)VHS35,eEQf<D;):,>KCZ<)J9YL96QY4KQ.:C/]_KNB_:0
e,5B8O9XE^6#)[-gYXM_);=@_V8N/MDdM;W+(KR;@,g<;SVTSeYB2[P9C&M(be>:
@@8SK)a3Zf]dBHNO/T#.OEbU)JeERK@ERC@GPS^^+#f([VP0+;a52J9aBYZV6DWH
YGd\C1RL8baSZ@(7?DHPR_,eY<7d]gNTOJ5#,VeRE65]?a3S@2CX)-a>YO\-8dJ&
S#KOF;[8,3fZ8LU_6)HMF[AV^X4=bSKB4_Q_WD[,BaN0JHfaA]Q1Q8-QB#XU>X89
eV,L6Mc.-Ca6:KVTJZV8=@b@DaN6VE:O^D_aESZNPR,Gf#b3]Bd?b,3SRKMLf<)C
A>Hg-^+2@]-=-4WC:PE\PZ4H:dX)_4.#aI[g:NeK<XUK7Z;2D#]eYA\>?;U@4\?G
dY&PT81\UM_REN7eAVI#3M4a[HP64.;-LGGB&1+:&KA<)-<Q+F6[cTcbeDa<P+,V
4SYZ@+:g1MR[?;2YC+/;8XEY3H]c2W)2[,c@S/2@Q8)OP_5cC>^\7X-]]FfafM1e
?@&+8LGe772NARZZ;Gc&V28f8f(1UI59>]XT&cBAadBAK#8<OJAHYFf3\GG>;Dbf
DKa/TF8FFOAJ6^AMd4,J_C:NH-ML9)bG(KCd5PSd971E3C-;Pd=d#P:/)DS(b<GA
Hg-?/J:#2+G<NU3LCVNC>\.2L@7SBG-0@,44I=E7D&.B/ec73-AP19SIE+gL]Q?S
[;6]6>=6,)-f)7CDW0YH:=)e[<64<XQbX,BKZH-BQVBe=F+/6U,fY^_9#cSM6.P]
E,BQX2H79N;(#a9?P[:@GBMLKAVOT,B.Q3C?c3-FXefTVQ.e4FdD-]dR8g0/Z)<2
P-M+8D1[;>:8>SXM<DVA37)I13.VY:=#e??,IBF/CfdW;Y?;#F?JN@CL-?A/^AZ,
U[;^d-N2WP&:Md>-:W23J5F@c(U+P-1.LEbCI-718XZ6JM:[2R40,0AeV8/U52R6
N/.\9+(8M#X4HU;f1)2DYe2V@:IG:NIFM.3U..fHWZ]=V;1T2:ML+6?>7a?KQEDH
J-?7TKSAC/>:D,dWH6d#HO^D(WIG+F[O.JG5D+O_RSC<^]bX_Ef=4Q<-+.FE3)O+
5^OX#2eL#(HYd31?_g_NQN_44;+/&?5N&4e8ZbP/7bBW>O,W9?PF[(Cbf9^eBWP)
(:fc=TJP[c+0Y5A4aYCX)=05U1F:9+cQ,<1W<b@Pfg>\B:3c3=,MP5&4SIFb=@[R
7@AMUH.58O<gGc(V,4Z7?ITRF+9&d\e3g>5&BX9YNdYXYLCKOZHNa4/,8H.YbAAZ
1:U\X=7X1NS2MNZ[5=_M.&TR;73RDWfO3=R&aC;@A@<?(5ID_&+EKF#gaXg&aQ5A
<Z_cAe[bgE@c;d<5C)92]=:#dYf#/J>&3>J@I=[EKNbfGF+GT6\Q+?LHO[A8gY2R
0V/3O[aAfZYK6Fa^YeH6^)LPLI4S&#S5PT\9HTE[TL1K7We>A1Eef7d]0<0)+Z._
8020_::<9:G[RWZ,fO(E#Z1ML8@E6@=,@DKa^KWS27I1R?5NP>ba0#WZ+_&2IEHL
,U3Q)9DX4(<L0e4S.G(IZY&FECS@Yc(PQ<H+HQb]Zg1UQ6+-+(Pfe##U<5=+U,L^
:HA+IU^(ESBe/3-e_:#0<f&1bQ+AbW&O4TXd]:GeWF8Fb?D,;-MAD9N2=731=TSX
cR_fEb,PaF#?c+PJ+@_QN=(V30#(Mb935aL--3Mg(@gZed#;D32d;91GNIAKSE-.
Cb]&5GCVVf8fX(O>g4^TD-@[-:1eEN;D(GNNRX193bCa30+1.U;bEP7J:3NF1E2\
NH]K:_^,5E/@>GHJOCaEb(K38-W_NAZ&bR-a@GP]?d>S&^EcV3B)b1I63XI1:3BE
N..-HD)?(dY53Y;JL2Vg]81WC0HA7A-LN40J&,#-SeN+JF<O5X[/:_0MJJ::7Q?#
W3LBCQF2G03,MAL?@gY7^+B-6(e\X<;=81(+JD-_:00KXP9d5[6g/37<9&(CG<&D
V:E&NE63fgdb:KD[4FZ:D0),2YMfQ?9I^\YKHPAI9=?+NTO^\=f6?fRF+JC?^8@S
IAJd=0SD@=[V+G))#O4TAGC,].Y8^-1XQEa2MFZ@25GJEY6EUU43M>9DA&[?CMHa
#K(;Ec>NW4GZeX.FX>4H7)f;M)9beCBJ<A7[0HSbZOOF+V>[bJXSZ1VB.\.+^P=[
?[6YY]6eDSNO4-LHNdE5f6+C2-Q]^AS@f<SW&YQRb,^]6OLeER4VY]PNYBNCDA]@
cL,\0J;54]8P[/@bAA8GS,FH<CVbL7_#_60_5OATRH_@SdS(fQGRXZ2?U#N#^966
F;QK5T1T40A8MR^f@PZOe/=Qb^4GXV.]c1#_WDgJ5FFPU4e=CAFEK)OgK6gEN08W
G(a,0]W;=G,(I(e;6Fb;:UN1L;VTB&)KRXNcF=e&LP=/_7IC08R>88R-,b<_fVV[
#2,/E,1W3(I6LTF#KLe;]];-9JR9P0<#TS)5bb/SUDC8B=P2XD9VU;TZ<CKgN]JZ
X.?<dHNd;?9F4@ME5>f<+NDA;d;C^EPPeC;,eRU8-19(;/b8+aF4_^/9)&:5D&,f
.bSO+_@25K5^H0+PBaH?9PfPD>ECGM#/fa4=-0=OMJ/DI_3:]6f&,8K3&^/GF#a6
)LH>S#c7B,f<_J[^4)A7F9I9+X#>0ML(ZdQ5=PeA&T</&#NQ^^1HS,@FB9(\de+O
g63dJFMUTYO-//NT,ZcA/3JLF+:I-B)#70/5P5S<AAOMC1eT]gD97RGZZbac2,CG
Mcd-]8g^Ha3O)G?)7T9SUNBY0)dJ-=E\K)VJ:a/@bC?H-Ga=>/JV8_TCV)QVZQO]
#2)N10V)A.;[^B4CHIA,-#._U=BBFU@S4.DO2f,?SLOQAD]OefQ-E[8eNQ8.)^gT
01;7f\1E71N@RC(C-:16DV=Q&J7[O+#E/BB3,SNSYES8/-;1H+IGS9f,0_0OI@2V
Ua>&3.E-LG.+/]0=B=71aPX4M6O2S3EfcO/ZDHO[J/.?\<7/Tf^f7#EY0I1<_d?G
](.C79I+_\Z(;d/b<338G+Icg&>AH1B+PbfBYd&_Le8IQ>)\aN)KI/N=9MI,(5a=
E;VZKJGOd&\/H@S?.>e0XB83:RS?]>eIG(=3V/]T;JIEdcbJ&8]+D@M,\S,GN\)G
-I87TF,:-HI]ZQ7#W]<_TGM/=#&\W&0DeGOYYB6d1[N:6:J?RYMQ9956fbFbR4T5
GOeQ9Rb4Vg;X^\Q>Q@-H&e90F]a&X6&;EQ4fgE?MLgM><?bHI.(bAQW9HeE3)G[D
=59#.b1a;:.9[?0+H58ZC]2g_;Ua>TI]6Y:58_cSU/ggHVU[EZFCf+C+H/)aE0@Z
::U8[EJQ_^M93_-3GX;F.:S3_GZ=f?&DV<bgLT=-4^;41M#0EK/OTOfO5]_JU4g&
;DBC3]?&ZKCbRb_N0cfG;U<WD+(@@NK((5c7dOIM\DLEG3R+(7^Xd]4F)OI7.=Ib
K-9aHQ&J\YRF8OZDdP\cR@Q:U_5<_4]K;SAYDCGU(2[#4?2203V\,:27&6UD[dD8
TM_>^JQ]c>K53.R+NQ@GSUQ98U]FAJ1R6>&MNaL.J^2FfT^P;TTXe)2,97g;V>6F
9[GB?BZ^DAbCV^+aL_=&332+ENKfbV^E3-IZE(ZV4>1A#8=<7&2=>fKE+U+BB&X9
>ME/TP]W(b3EG]4e[C=3e,e9V@b2@D\FKXGJXH5J&.bS1P=776[MYS&J.fGHTMH+
H9CG>EQa4MVR^6@[KE.B5ECf;Pag8UCKgJ6:FZAX)eIY5U]:8U.97G@GQ[2&?b=P
ERfIA+FSLL1YS=TWN^9S_g,&1bM<Hb-/XZP7E[[S.N\IM5Ge:@1QB-#2E+D7CeIJ
cG3&7=F43\LY1Hd^M[;;.(bVWDZYK>/Q<C//K_<M@Y(NK8K6=2N^?]6K9=2LFE6L
fL6H;-W@_e7(,CUe_;TbG4H:,9fP9RE>IBDH:Za7?0WAR4\O^1OIYMVB5MHY(=Vb
eN.TL_bc(T,IgQ2B+/)RLY@7C3]IYb@+/YefH0R]<>.((LXe&NT1E/b=b;6^1L=Y
,>Y(;H>c_,QT\:g.+.RXUcPT+-_e?O4Ve3I7G\H>[\T9)X-Z7/T@d,b3cWFZ4_[c
CX3YFcU&,)TI2B;Pb)(7IP@@dEZEeSE-I+#^EL.(>MP#2d&^DB@RP6S&4,J\V.Y\
^>Ud8GDK@MM:CUG]ARSfD1/NR05<LO-]M;a+5QE7.LcF<(C29CYK/aY](dATAX]e
]T2R4XE6J8W\??N5d@-_g.GOL6YIP(FY1bZ9+93OeMLd\gMYcBIC9F[;)@1#(M9]
)aC6R3D(,e2bN=.,8/QE6(I]MbX7,./I:LdT+(d[U.O<KgDK:)fR=A#I]I\JMZb6
[NfAU7&;W]BATPb<<;dAf\YPH0:5:A[ScM=C05_<>c<M#650L&9(WD4SXD-T<KD8
,5X:QCV:96DDAR5IPeg&Z@@_[&F)OFZ#MY:RC6FX@\U9/?[5+D+_2<&MYg><1W[1
\MGbedY&gZTH[c75cHd&Z<bC:f0?U.N48N-\GYBL)6U,U:,0-4PPPX:)WC/2+YAe
<S\C@^L&C)(Sd3YeRa3MX@/#U<e+dKNBP</R?SgG&03@L&G7g4aZ;]NC5>)]ICD?
K^\/[c#;a)Z3PFb<4,@/X(0@MF.K)6U1]4\5,[E#[GbDJ]BG-g?56+W68PQ.)MQO
X?X,MW_94>c<=_1daLM&IVS/\7ZT\\T?e7_6^eYUMWgS1SBA.59IUJ(XJgO8dW#U
B4NJYH.aB,ID.X(PU,5V)O\UaLBJ;C@>CaK8?T79^O@dYG]F(.:HN/0AOF\9Y],-
7-Yb2)c=U=UZ/LJ#aA2DAWL-P/Y)YJ)7@HH8dN5CE]Td62DfGe)bWGH^1[ZgI(bK
G:&L7\GVE&4+@V/&g]KQ+AP;QK:(/LLc1/I^c5YP,R,:.cRXQCIUag(_RQ:(WSCf
P0JILGLW)ccU4(N48?X@P#d0(F3.\PG5=C6I3GRaQJ7g6[G4dAWKLf8PPW<V4N:M
/-<PNF,HB0(Yb2a0_ZZF@&QFcAYF&LYLI>DU?I/XQTTANHUcYe_8LY0M92X^=b9R
7TW2U?9E?I/UA(a4:c83C=Yf#IMbR?eOR?TM=MF(;C261Zc/^\?(-CZYP,3^S>0a
&C/UYL9c<a;1[_-,B.48MG]c6d>G6:@)HUc._R^1)XPWfQaKcIX6(\<^B.^F@55C
#)-PbPb+SG7.+)aNNZQO<(b@]>eXa=UH3&eKT9FVg98ZK<-:U=BN,IV41MM#9-=9
=G6C7?_4X#3V95A0]eAd8G7\Wg_5=&.ca-_[^BX@GLHR^NS6Y@OefYX,3eV(<KgH
MeASR^AA])<T9PCZ12:9TO\R#D]\g>\a@SMIA5NKHP/GCI2@MOAaCXWW?CaSB8E-
($
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MX25R_HIGH_PERFORMANCE_AC_CONFIGURATION_SV
