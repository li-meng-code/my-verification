
`ifndef GUARD_SVT_SPI_FLASH_IS25_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_IS25_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * ISSI IS25 device family in SDR/DDR mode.
 */
class svt_spi_flash_is25_ac_configuration extends svt_configuration;

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
  real tCKH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCKL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCKH_Fast_Read_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QPI) command
   */ 
  real tCKH_Fast_Read_QPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Dual Output command 
   */ 
  real tCKH_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Dual IO command 
   */ 
  real tCKH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ QUAD Output command 
   */ 
  real tCKH_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ QUAD IO command 
   */ 
  real tCKH_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ DTR (SPI) command 
   */ 
  real tCKH_Fast_Read_DTR_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ DTR (QPI) command 
   */ 
  real tCKH_Fast_Read_DTR_QPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ DUAL IO DTR command 
   */ 
  real tCKH_Fast_Read_DUAL_IO_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ QUAD IO DTR command 
   */ 
  real tCKH_Fast_Read_QUAD_IO_DTR_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCEH_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tCS_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCH_ns = initial_time;

  /**
   * CS# Active Maximum Hold time
   */ 
  real tCH_max_ns[];

  /**
   * Data in Setup time
   */
  real tDS_ns[] ;

  /**
   * Data in Hold time
   */
  real tDH_ns[];

  /**
   * Clock low to Output Valid.
   */
  real tV_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns = initial_time;

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

  /** Assign refernce of spi_mem_configuration object */
  extern virtual function void set_timing_cfg(svt_spi_mem_configuration cfg);

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
  `svt_vmm_data_new(svt_spi_flash_is25_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_is25_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_is25_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_is25_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_is25_ac_configuration.
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
  //extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_is25_ac_configuration)
  `vmm_class_factory(svt_spi_flash_is25_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
P.DQEdE#:P8E&F31\R&JKbd<RbUfcF+H]g>PA7&BO+A=P-fYe_6X3)5Wdd_Y3FYS
Q7@?dVW,Z478aQ\UV,A#gFBgIWJ8+#A;Y36c8f;29:bQXU9:Q(IVCA383\)P_;Yb
^B+361F-G/(9(I>1D8__WAL,c_.[0MAC/b<H)HEZ,4N<4RIdd]:59UG907-aCMGP
Z2=Uf7PAQ#)NQaaYK-<d;+MP(I0OLKQe.-H@4&.UL8;69=,5(<Mcg^/dbFXB5a,)
.H>-:\MXQ@C0aXI#/8F6.>09IIc\T>.AM4:C+FD_5cDb(9E4Fd>McA6d0Y6Z2a0.
c[;0#+WI2;fJA4IbBf&Mg4N86AK_.76QKJ^-A>^D[FCfB@-&f--[gJHP;NO5@PO/
N-XGFUcZ:Z&Z+V043[FY2?8T-4ba+>R?e^-g+/@G;W<c(8_F-Z1#a\)YW41cYTE#
T5USF6P]&b/R.O(BY3^4ET>f?-Q2?4>XJ(LHb\O;>;K2G<JUSeDZ.L@I&M5D1aQJ
a\K]_F#RJfFTL(Rf1Qb0#S(<UY@.716^G[8JTGC#\XAE3VV<NaI-,c4g1N-(B&.-
cB_UT3UdUO@1TK@_b6c]\TWW5XY#e]/NWBT_ASX-[)1?D_F^Z/;B1[KH=,FY.G&_
cC/IX#FN,gO:XU&9HT=KdJRBQ,cS=++<+R.J95R4792_DH6KT(&._[G/_YD4gO67
=85\^)(IV^F_ML5>TZW^JebV.2c^Y@Z@&DVKa-Y1<dWN.H:(Oe)-eQ:;Z:Cd;)T]Q$
`endprotected


//vcs_vip_protect
`protected
7V67=<?<IW:Za_?[::C(<J_A4<50<#(<8Od36@@d/,.JBB&U.M=1)():7D9SIC\J
b<^FTK:b9JE#>\AKSI?=.Y5X#KV,LXB\dR33&^ENZ6^Y:1e.3/gV6A^FH)B4V]3]
3IS7(f#L,MMd6[aK]G)AF8>,,QUOV;DKITEgMdd??^+X5^.2YB0(d^F&/V4g@<70
?<VYg]eag(\;[6YFMHeMG7)JLGeP-gaG#W_8Ec-ed;eVD&?^78JM_#8VU]f5+9^9
Z57();]A+DUFP>NI(GV:Z:J&@[;+dRZ34P[J-8S2GGX<&8JR1(]5SLJBUMMX9Sb7
=f+CCaRD<W\ZOFP62JdGA6N9GAUSTS4&__TIf#EI=g+)50&MZTJ#cFMa<&(/cOWJ
6R[a3e0:Q<:QO8A(>HHbcN?][OA<)M0R=)@5Y07g8.cI3]#BY1#6QWHf=C6f\6c5
.c-cE-O@]YN1aEe;\U<HO&5N]7<,_,H,#f)/a(Q6OW:38@&J76SFMPGBH@gb3I2H
XR_86_I3Mb#ee4b/c?)DWJ>);8[\7-=_C5L_?CQ\/><79)YS1+CM=AL1.gT-Y9cT
K<&>888CO;J])gC,E];9ASM&D+bL5d-P<M8=bG.f<0.J?OO:R&UM=aA>=4DcGc5G
a=bca7&OcXA,dKX0>fF[/G[aBB/6JT+&JKZfQ,LB0bD8B]&UZT##&;KTf/&09_Ra
GJ#8<&[I8:MYI4UL3dM6./46b/U(7gH8U,K<VS2.I]+E59,.a<9[:fa(CJA^.STW
c&J9A=Na^C]1gX#\eI.4YRbcX2BQ)&868/RT0@D7C=-+ZZ3O,TC@5eI#.=EA).4N
+?\c/d,G_J>da2-NQ-K.)c<0L(YJcCLZ\B5FCd:A3<CI@bb1[K0#e;0>+N@.7R7M
&>gEa2-T+0CQ__QN)3WRcNV]DM4KAJ5KI9^6\7L86f&>(AKC/9YGJM2(d4(6&QD2
^VEI,_::OJ?Se^U&#WFIa,b2?:e?IC7(MPSa4e2C-\TYf8@4#A<\?<4?7,9eNJY4
LF0BFU6BPF-WKa(Q7#a.H2#CBURDE+^8AJf#Y=MLK0-NMb0G6cZ\;Fa.D,+1=I/E
Md5dZZ@OUEB>@LU4.cE>.]VIU&1V;<9d+F]aIX9ITJ3[AOFZLH]&=Q_=DRKe[1Ld
&)T2VMC,f22-c,YHgJg[T+A@IDd+I+1bVXI^U[(HQ<1<9\HN+@,dMOOd?5E+)#@/
>@@1>)V4@]C:HSZA<[UEZ+/C-]]+=^6&H/<TKe-3=6M.^IW_]R1.Z/4YD0W;63,e
QG06d=>I+Uc+JGb=TOXCLeRJ\W44=\#N?;IPL2N5T2L5R6Tc.SSb\MNFW7X7UW>B
Q3]dg);T0[#EOga02eIL[Z9:0b3ce.Da5<OMB6Df\8DHR&H?3KTT,>cg?8Z@G7e.
L^)Q28]I\L][>.:cL7PLHeC<)IRF6W_GdD.bFT3,1HOU8I(3Hb;)3dVDN@<;F2=R
YLU(+HLS6c/bW4.^8dMcNeT\W9K>a6_<^9[)dCHV/9H0C4G66Z\)]GZF=K?OR[NZ
14Z,gFO/FW=Sa,)cB6KI3D^>@-/\PV=>I@57bEC_d25>7WN(UV(Q7D/e[VQfIS<E
)1)ZBd52T#-YV&1+Md4N5PRB^L,>6-HCR9TZHKY0UL4bS,T8Nf:^+;_9HPAJ-]VM
a^CL<QO01gR(<UB6MT=6ANHC)Va7>;R-_RR6NS1OCL[H]:MNWK2LNTdIUEQ/;bcC
VXcaXAWKCcA-OHfE_\-dfF1(S[0X_d?bB-bD>1ec5g[/<,cZ>)AIa4O#+MFf>(<d
^Y>LA6ZUaFKZ[eN)3f:DU9EC\ULcS&cce3Ad5BS+Q0G)F/61640K-XfbYN1HWC&T
862#[8SJ&@CVZ<,.^QTJebKF0+ZV&UA^>:\f9Sg8Bf9IW7LO])f(c)6HG:?#@8Rc
&BG7NAae.M.C\/4,bEGcIKUgT_Oe9;REH-5EF<7M9.QWb1([=V]b#=]GdQM0Y\P[
c/bJQf.I6RCM#-UJ8XB@+7E/9&W1J.g7U\(Y,CD)@1:c7H_b]ZX1AM<&P4gQ0c@4
0?5A;d92_>E@NVI5/<LM78EYIK++_Q.9e-76Z(&&Pd.5VE<NMgL>9Zfa4<_BD<gF
1:.4I/78RU4<S5]3BdQc0:NC0X<_]YBGO>[X43RgJ>LXXYE7>?G2(4CabOAdZJKH
Y7V<ad::5JHC_?)4_/TEH0Q5C9EZf;]C4,gC@9^H:&QC0H8FW;J85Se=EEV19:8g
94E3F.,a>FGd_Z2XAHO,/=\?2K.Ga3UKF+N@1-WVLPA<Q;T969)QIXc6a780g/28
3/^0\C8PY>B?PCI#_(^XC8BR6bPM0S5J(5]S>N;EF]CT\_UQ:CX_FQ?8;W(ZK#+A
E)1)f<^:9Gg25Hg[0+I4=(][E4<L\02[G:VPDAMD^IS]L.=\a.BD-WLIc\6^@[#3
acc.;0M3Y@]469E38^SI\5Y(F]T9V:@T6XP@2W9ND+:(Y1,NBRIA&Le(Pf_8;ed.
=]USPXV=gdg6C_WD_>TGg+SC_I]VcGb0_0#SR3_D1=#8P.aU_:#T?AcN;:;:S.[F
=_f4#BD?<bP7UNO6bd,/?[.C82:>Y5M+EFTFDF2fO(5+\KI<ZLCT7OS;/_Xc64^H
\9K7<+V?/fM1Ma8R5[:&FJ1H8>L;PBD>Y&GOa@dM9M@SPT?GcB#4DP6(SHeeS.^A
(c#^8Y1_/FDKJfWEH_eFR=6IU+UaE@N/T\Tbc+DWQGU7YD?]AU3WEG7&QNB/0\gX
H?K#LHUbGEdeY9YDc-=-dJ(2A@<d=#MMb<62#g<-I8SAaa,33e&_A-#f2gE=67I=
9NfM.I\+&)dKP07U,(NaLER0DP@<9_YV7?-SbOV^/#PeA12+V1bV,6P_>fAQ]3SI
2+eYXA/=)[7MAPXf],a^HLBVAeYYV45,75G\GA^Z18EFWT<=.\/M>HgF;XQ)Q+M<
J4cN?P#9+5ZH8FS@,39=Q#6-Xc^PRba]0^&SL5(Jf[/^eOJ\HKN)\2V5aY3(_9R.
5VRA]J&W<F[)^L->Yb_M<]<c>Oe<,M0d3eC37G7Z_3.T9[23G^HQ_:@9>_:(+dV5
\:F/7NQVfa=JZPLQKEbPTX\<O=DAD)7CdM;&5#E[)-JcWDOfW=:\fO+A6Qc_fFfU
O-UAW[N6Z+8^c@S@Q;=2&e1N.+ed)Ng/TQ@F/>>ECMKg5.)efZ]/#VH,(:FXGgIG
b61T>NU&)C\AJHU)NdOIQ\\C/WU#:1D^2WWY]#D5)0.=F7PXH]LfF&V7FJK<[1_\
a8#;M-A8O@(bXK.E6R0SZ@-S.[P(+..L8\EQeYTeN;HJJF&46>IR\(8VBE_Sb<)R
-^Q@c6gQRIS[J:YeYFS?7UVX.V^D5R)329e:\d8aF+-fK>&E;QC3Q^PbdN)>B.R:
Ke.K@NVJ?1,MFd]>Xe(H\da753Y34],90c..\6PecDS5_PKe?OebZX@_.=ZVA>CG
[_=Nc>a[5OYAdTK0dQe2Zg]C:;_@LQC\Sg=Hb#gaT_cN76#/>;GHG<AZP+X#4\a[
?MRI7+AKFYJ,R#=20XI>C/Sa8.\O^UQ;JFA=L;BX0Fba^MKZ^28OIWagJe#Z:=AQ
WE)#MAB^D1XKOUGDEN<T6.ZgFa#V6U5ZI<3Z_MG)ZMKH;]0?)I4C>=Oa39T><7TE
_/A9]_2XRB2=Z8T<8MLB8<&.^;gH]7V1J1RFdJPGR?\N]FK.H5DM]#3fV:e:d-bI
_\R4b8<W]HNA<&D9X)F]NFg/e3NcS#8D3(ZO[A,\LO/Ue5QF\O-^0TW<_77R8.PZ
C0c.N:H=TW?9DdIU2:)/)Bb5&2X[(59R;S035c4cQ2Ig;2+9>.CKK9V^VK.g.HdI
8B+:&dZSR1gBL->(K7;b:e5RA50e,dd<3WPB8=W,FM&CP8&QfWFDFXYSANbVP1+J
;[_8(W;aN5e[3_&<32711d6)eag9>./Sb9/5]91DEFUR/c5-K_7KX13Q9ASSR#<c
PWKC;GZ\/7+U8\f3J[]5@M=+GK5Fg#e0\1@QS&Pf6#=9eXQB5\;c-J0X45B/@D<P
9GWC/CZ3G22UcG#Gc;Ebcb;_6)=U8]VP>71V6GWAAgU)eIBQ[)]].XgZIETe9g2[
FM&<.VRX/LcVH/_:ZVR,._NS0(Yg]V.X;Tg33df5ef#W[A8Z9LRS\fa:J9,PTVJ-
?P^T82<cA@AJge)df/7R(\(g9bV5dSR+aM76Ha49GO<f2+[D36e#e:]b/U#/B;OP
V#VYcg[Q.4OMLXaT]Pb5bTaTPa)eefA6g@I-f7KaP<Y#YTK)<4?[UX7c&HPc@N30
HU\+15aVBaTT=f&8,F4gOJdXbdI2If@U4cEY>I#a\b(H,P)=/g[=WXacc?,.NHM,
_HF+_[eK1E1.0LB9\G2_ZUg<0)(T3#QH?9M?=gG>G#8CBbT>JLW]NIe:C12TdW,(
Y:#X2d_S.]H/P<fL68J&)CE8+<Be\5fW;)SdLf=<VVX&_H5&SF@(^WM0P-(OaP[b
aeI]f+L/I[WHd@EH.K;6&C(^L96:HGYU.I_A09.L&W[;][D@JX,f6d__dX>?+?:f
CRI1#/7@KFQT#beb]^QG(XVX0TdZ6?Y#_gdQ=V[J+c9)g:ETC,ETadKKU\5B#/,:
<Rd(&><6E2e<eQ9K>.d#+)/4FOb@(]IT>VR-g81XgDWOR\TN^PZKB-O0FLT\dc2<
H.c.6g+YcZJ39&0)g66@)G7G.3Y[Z43H3MYcdZa7?bfV>CNL>JB7#c<.RFC+H>XP
TU/fZb&]JN<@Sad3Ze:-#b[G7EK)O9-\H(M<7MYDdIIG+>_E?P>@)]\]:RF9F0CQ
#cIY9,c2a,N[XT2A[UG[=Za?2_XM=FFaE/J7/U.57^QPb/OL--X0_(Sc@OGJ<MVQ
(dJP]A;:YZG#9L_O/H.0f^OPHQ9MMEVeNFfC_[NIL]F^fGCWK_:EW,aP/MI1Ja;X
1d.cF1@WVFd<VH^d)=@MA1H./_RCTTZE<8g\1)#AH^.LJ/Gd(@WNbSYZ;AEPeP18
?@L(76O4XR)R(-Rc]AcDXXPKd/\VJ]IQ^g>ZENFAJe:+C;bEFM])aYJI3LMRH2?O
Q0<:Ig\LA4.G7BbR&fJ26e8e#bO\SHEVXc=(FKb[_0QC=(e\MN:SN9TG+CI>^+1M
eE@&[aL_&@R(/]Z+L6^fYG\.\JEbA.A];<@A4dGgHDFb?;K.N>U7KU4EUZ;E?9QO
OUDfY@4F7F2f./Meb5.La>&Z(E98cWW1P=7^&2)aDE)LSSQ<=Se0UO0[?cM3(2gI
IF7ege2X7)TI<D8_AL9/g_B.N,GKcF\Rb^:8GFPG@,94<>-fT#G9CH7)#aRXf2Mg
ET;1g-N^WD4>EQ+>C6AM>FIZ25c-1PQ:TS3g0VKCg_EG>Re+NM+IKO?Ab;^9>Vd)
.\6b<=DPPbTcOaV2(BTE@VTJe].2K13dgRW?<PO8F_HEETMAbDBLUBVI-2LXJ3VT
:)BQVNUC3W_YW\Y2C5KK7e#^[TE+@F9Qg[];(]B+#^/_YP^0RO[P^Pe2^2b5H:<X
-NDdJO1Y79@DJE&UX35Lde_1HG>SW29@Q?Sg8;J,aMIcP=:.UI1QQTW?c26D]2<a
W6]4?./;NSNSPB6LNAA\#WSP)VW@(]9_G0\_980R]H7#H8ZIQb@@LBUPHLJ:F^5B
2dWf8S82F(4MCTQ;:c0-H3e145GLB)Ea:EE)MD9]5eN<,RM&Ic^G4.7+TeLe76,[
N5ObfbcDR_;EC(#V7KX^c>eDa5?]C6Je/H\^6aHBTE[WbCNLPM,O>.>a&FW-NgDK
Y#cE-KT96+=NC68#I1#S/X@J?UGaYXC1Za<M7&V,7ATB8WU6NBT\#b\Q^I118C&Y
;4<VT,;&gJ0PAARAK4L#9Pd[bQW\gY\CceDYMNYC;9?e78)7<,cZQPM+BGB-Jc?S
b^@];[/K3gKV89#d#H[9XY4HC)47R\,TZK6V\:M]J<U85geB;9M_ecZC##S(J&7T
X4Y>P]\cHZLa;C6JZTR=HO].DKAI?\a_1;2D^Ma&JQZC9/_L.25G?K97XVRNUG\:
U]PH./_b;X#INAeNge^R=M05Ka\<\7YeO8gVP??C7d4R0CQId36+H736>f\[ZFPT
VBBQF,;eWGgU-)aXVSL:+R0<AKa?NO.@de3DC=NRFEgA]W/5g<VMD=WKF+;8[+dK
b6P2#^>]7O0AK-gI5HO0&4a)K.Q8NAZ7f0[[:0PDFW,K+76KM@.9T.0_6])?;FW>
>TV8<TRG_S4B8@8d/KA-[;<K=I^RIETX=HbD)PgE/b69L(\=#W,(C4&G5W((+=MY
c090EB3+aW:eI5aT.=@e7E,_\]4@QQ9&T(;Z?d6JT^e@f@:SF1PIQcBeOdC.@FA/
:)=\R-aY+J8]>7TgL78JEU4@IY4Ya<;7[(aB?&D6)YH>X&A3,a?00C=4WG2dG#)3
HAA2gPYWQFaGf=D:OgK-X?O,F-ed]#Sc[G2Jg1d=/J3HE<Ca^M>.Y#:OZ;Z-\K3=
5X5HA7[.-ECPD]+^8W9S^(QLMWXC7ObB9e4.g=X:?#5dDMQMK=7APD&OL^&[Z+0.
)/0./84]BSNa;)ea46-gQ5[>5RB<@.-&R+[B6_c?@^WI@B,e5LCJERXP#ES(D/&0
Z37(U;3F8)4,gF6,1deVKfH:XO\JZd/:6]<Db:]<9d)Vg,F?))TOJ6Q.cVTUfWSP
&:5S96gW/,;WYHL7F)]_\gaH;JJSYKN56[+Ad9QU<S^Q>=#.W>.b:G[:8_Qfg^.d
0LH:Y\DXZ[-G_bJYS,9.=>JTIF<P??&-bN>5g3gVEZ7DS#?NaEL&EaX]5OG+],N?
UJ#MES53MW:5_2)F]W>]AEDG(:H.Bb4;>g##FSI^]\)8J-_AB?]gG&d.3L4U^NRg
bQQ:PbP7H9KT4.+ZCC5Oc[-.(YO(M\76SY(KSLL<YYeQ5[;#EN9WF-<2L@46#@B6
Mdagba(/K:_H\])Q3SXW^Ya(L^TT5c2f5FJGF9f&ZBJ;#@:=O41IZH<9\I&8^S1Y
8PS=,^5U\PL[=<0+>G5aP+d+3>O0fW86]6;TKc[_Q3Af7@9/AW#:KHRX)8-52=#c
I483>[C;cF54]@5HA.1WXL+^FB+F79P+8<Y\INXf0F]AF_g+]_F_Z7TFG5>\1&Z=
[2XQ];QE:XaD,cU9@>YF[KVN1HA5GdFG4UdIRRHA[1[??/([eGSGWK27D6X#9Z1I
N)?YM:Z;C4-XRc7PN]]4P72342Y.A=J_>6Eb)MCfAg+EbQ&-9_VEd64QYeF)786V
I]QR6DVY&+I/]E@O;O1)ZR:NG@^QKVe?K48LBM7>Fa@LF<6JTO@/H.-Fe9(<H8HC
W&;G@A#94\/cA_89L0Jg9DK-]4G8W4V#<:b,/&Q2:VYfdDO^0V7=AeRUIAbbDAg>
3+T10/a4QM<+E(DdW18>=);b(dJEA;7\I\>.EB^\XP^_(&1Md>e0IHVJ]dgR6;G3
3[/\Nd_Rd7b@YbQ\>T:MUa3/7,dM./<K/B8X7b)>()E4L=XRG811MWT&a\,MH8B8
769bRZMOUKc3BCFPRaf2bca@+>#E=^K[;)gXPJ;P(>0QI3B^X<2P7V6:a/>4V4H<
VKd>YS\B,dDCEVU[NJf+U.<JW2fU(f7+XUYN_U)DHRIfW&)@_edP;4N@K7I[]]:d
JQ;:N;6L,_33&YKcW[A[Kb^8<82FNcE)]+[Q]/T.4aD1.D=/NTBP:9Ud^V)80=>/
+Q8QHOMGfM6;,MYKY>fg5Id1ZcF#/]2X,SG)9ggCW>6/<IEIQ+UL(/cAN\.CU:b1
Z\)<R:SP+YGFWHG)fN#S=MCc1AdU?#7:@@0:Q^<>\7^]N)W@;\FA71cV==)2SQ&[
gF]AI7EL0-447^</];RTf]:3SU.SVe<[+.#dd(BbII^1)E\J;L,=/(CP:)bQ_P1e
R3G91aUARA.RgIUCS5)D]EF=8U5RX3C8?VC5<R.VX>988V8#N;d?]T5aGNWTdP9g
&T<)XJA#4J64[LP,&&bc:G)4.RaP9>6[gU0#SAL<ZFFYG_V5+#15>MfX\#Q_b,8/
XH2+=2V?AFRJ@35#=P9eYC[6dY/IV?;->Q6^+7Wb>O6QHZDf;aX,NO=a]AJ20fJ2
bRR\YI4U5QSB8]PM^3;fYDfBX0-N2JDFHU0?@K6BJ3Z?23ddbdM7bK6K;O0BAJMY
&X#eR-DOa(/68dFU&f^(4W22d+[-N&I0.S>X0)W)FIS4bg@)H3C(Vg+1ML4NG:GV
CNAZc12ATQV+5.B:.^K@IR89#FW^B_a.C;7(\<[._7IQeZJ_0VN3]g@@X[F/))7a
c@2\VC^3gH0R1Q5-EDL6AWK95-QK,&D.(I.2W[S7_dB&<fdbUU:#0IK_,a([VC83
PT(I_-a>&C<\O([Ca\&;&A[V>FLR4(CJ9+AMNb?&_1:9)B>d1&JW<#aTHdeSYfe]
WL]SHM9GVW?c@POF)>Q(>Y&+/<eWb6aCEKU&)379#9]_M\#,4R@R?2:gbVGKNIF&
YB8-HLd)O3/9(R=KIg8J23IEL6b##T91aY:N39ePW0eU^N1G=?g:7cRXF9^#DO(/
f0^YS6=MN)W7/[;NW<KPgYBGVRa<a>FPZa[52GfI,4IdIVf<=(9;Kd(E3@)cWIN-
U3>OHAS\]1YaH?U/6W#@T?#G<OAEN#PC+@EL@)0C/UKVH2NLJ7SQd#aMG+H&@Y5?
Gf=[G0g34c9P2Y@P-@GaX+1\:?gUdZH)7Z+b:7cHA&D?E41<T89H(0+L,Y.Pa9=e
X;9)&3K?_[DZ/RV6_L(O^eFTL)#3?Y]).eP6IA#b:J9K8_FT@8-3F&0MWfg5-=eD
-IU5e>XZ0BGWQML5^?QMX1(S4X#,^OO1D-eE/7g:L4OMX6.\:ZFW6(c_QE6_-O@G
,1I4QUD>#NdAcKDN],7GZ10&a74GZ0U,(1A0IGGVPKUN_P2:QY86^A,7H6(]J?Zb
,HXfJKA\^SHF.<L&L0W5C1(ZVU@GD\,dUO,DBE(;E:D@Z86dSO&^-LBDVUXY;bZ@
\^TU]_35<BV^f0/A9)W\QDBCZd6SS.N=7_]U6TP^I=GQDL+P-aOU\/?+RSF#4C0L
Q3eUa:LYZHE.eWSS.b(()C;&>cG?(GNaFZf@9De.)#e#F:b6QJ0+;g&?SID>LMXD
(Re5TbMQ,c6FHNe8GCL7ZTc1XENdT,#-H?M.2:F?R4+C+:(=#P)SIJA)80K4AG::
^4NF634:<.V8.LY8X58X/T3cNEZ81.3g969c:-[e8Q[781W->0XdfK7C(bW3)&N;
XL1>U0LCG1JU/GO^+&5W?>[B?S:7#)d+ac7/=IM==P-[b=>=U6OY]Q85\4#?8BMb
^T/=25;[c5L^Hc<PH/3R&-#YP:\.81<^]f#V7a&JOOJ:8?U+OGK=0=^TT_\\;FCZ
@QH\IMdR?4O#2d:0IL/INZeKWc6077;/d)S?J5a6@cGQ<bGd)VJKWbB>)eaRD]9E
EcgFbbFADWF#;#4DUO-CI,PO;HLadYOH,[@+WIO/&=+S&d]J&[:#3EV3:bEI\Ad,
581Vd=bU.LS<(f#XWFNE#NKF@2LeD++:.eUIM\d5-EDf.R/M)[K@FdQE,BCe:UR)
I[NF2-gKEaCDC]EY#S_,^#O:.-Y&>-1^JdM#8?MSfLDge_\-@O&MJ59I^B/EF>Pg
g:7KLZ0PTGD+X0M+[.W2)KA.a^Z&_02DLS((16\<],(>(OX_Df85_cY+eB64Oa94
)]+ZSd5@A+MQ(<0c5]@3UPE5dZQ)D-3dXGBcA95g:eJ-R@PgP#Jd-I;:QJ7[<M#T
LJL.aB9IXMb_<1Ee9<egeR.WcPA1#RBaVVDT\)Mf-Xg19D?GH7e1N=Z_I^DX5P+.
2B93.S&,YT(-.Q4@I7:#3gVeP=cc2TO(H-[2ZNW</Nb&<>W4^\K1,5J[ZM/f5&BH
4\XC,+A(4;OWUR=f8cM=a_gY=35e+OPQGD/X+708D@bZ>=)Y0//>XI_W1:9CI18L
#<:3X@<KP\)>ZSee7ab1A94&U#2/#H:,IaRfLOQO,YY[_NJ.&g:cC9TdAW0b5=W_
R>U[NDCg7??:,F5Ug5I&ZPNT=S7IMP@&YRA4MNNaFM[>Q.88#P/:][K_(@R4YYC>
305?&UQJ[-Z/OQ@GDN4)e?_];GUUC2a0H1Q2LcfU2,<3NTcKL?1<&/RZDRZ4RVW>
1PY<:W[LHgVEd.;VVB-X2Y#O?OC<<A1e_]a?<Ef-,T+TF6QB@Ac8\gb^fI+/:gV3
QEQ6PHMN(D;?[PScg\?dbUC7>MffE^5;X<cd^NJ4DLF;:fdWMV]-+OKe37=R,_V8
^COE5E2gD2II4BY413f=\J#_CUa@E>]&G/S>d/94eGdQ9:e/N/TU;+2.\]bbX9B-
B.9Ia@HDU)NY?F.D4SI_R>PV>^83cH]egcRG;OHE>ZX>T>9>0_4RaK+V7P#e3-=2
YUIfP12HGMFO3<Hg&TZ[39VJGC<8#4HQ7+OCgYL9d5QTMFV6R_F+317,X5R+Ag\^
:65W[7IRU,4S/eNaK,BZUaRMJ?1EO)cXI42_-@K7WE]>PEERT[AT3((C/+I#,@T3
62PR3S8+[,g0IA/YTNYQb2Z>@I^XN>4D1HUHWWY=7KO_G,>KM5<6_]DO:UNX;W_0
aY.dHVZ=M4+&M#;QL[?Bg-BUW0e244VPfDb?;AFQf^P=&MLBU=<KSR4[X5KXT/IX
R62VeKfKf[Eb[2,fL=d9O\&XWXJeCG:=a+FeK_JXbBEBg\WB6BWK3@958?+Ge_b#
^aQJ4K4:dY(G@:4#;<1__[K-H5/6Yc&P99P,J]1NE.S5SQ<;/5+edca9RZ]<0<P<
;eD-0[c.7?;1&Ad6(JRd/15;^(#a7QbK</4?1QLP&.gEBR2OQ1-&MT>/@P=D/JH(
HWg=2;2e)MGYKP]BB_bZ<OK6#@CE8O[)+GWWO8>5.-Y-O]J>?LgcK5JI,a_32K_2
,C.CdBKM-.&fCS-N831U4HbFLa,_.ZbJ;W4TSH4-E).D#Ze+<OPRaO2_Xb1UM;3c
F5Z;R:919^e1YS7PJ24JBXX:_\9/<TPBWYa7[d(Ig?E#_V?BRSMg6#[9aNAN)0P<
8&@;KC0)OV0\<LLLB;M9f7X^eX36(JKUC[4]N6XeCJK7>C4Ha=>E(;7d8UL\O:S?
K8/S6@IgBPOd6:A.,c5cP:]L].OaE,/b837(,7c)CN=D<eLW;d3]B>EJ#[D7ee:E
SO#5g:.IN4]c=Q/1CD^6E6,FO<N1DV(@:C:1;G3DGWdfWEeZZ3L,5TX(BABf_Z0L
V,eaV9be>A_EUK8QU=WH7-FF#f@D[I)dDgM=J9Z/JYY#<95](N[X6:cODATPfUO9
B&aEWVJLR5O#N7)Jb[1_+FJg:4W8eNWO/SS;9MX:eD7\B83UZ41=PJR)>#>MK?=7
bTLaJ>SGU>:?f1<J=G?Y#b@(4[88L1SC@.CFW^cB+0dE3&/-Z:3>4(bSUO,<D-Vg
<@K_GH@>MAY3I[#[YaO>9I45X#)9#a9DKL2O17bBC62ATT98+8cNL89M3gaX@dbQ
HW<Q.-8&(W=4CC5ISZ/_[:gWTG/TTRJ:U@Nf#W#QEAAO=0Q^cg?KF[GV9C64)IX;
e7KMFaDZ5I]^6G[4+9R4WS_>);9,SPZ@F:QG_ff/RI^6A.[&c&e3)W/UCK8Tg>Z6
MZR;O(VRX8G1S.<A)L?;660d6:[[8PNI5=KW)57\JH3ZMRJ&L^BXR96QK/9KJ6C1
ae_?&\PR,Ab>.D0W_NK5cM>7?R3O8-L39^?XMgRT:78T/@g90F621a/CRYg/ZB,e
,d:J9IM)aMLV:EG6.RWOR^Ab185aZ62SZd<N@R8L.Fd9ZI1REV^CS6f6N637Q_gL
FEW2;ZT;W\D2dFSM-?B+-3]:);Q]c5J/[9=?KZ/9GK6f)gI4DI&2>X;AG)+SMZUX
N(e8Q0N:&7M]@P(V6-gUEYX=DFbD6DH\f(VGVKIZ8S.?CCEW&a(<5df#TWNB^0HS
QX)&TfF&4W,D>CbWf8Y[2(ONS83eYP1IgLT9[#Hf#dVVJ0YE69<dL+JMGSCK#0@9
XKTU.+763]U5O#LeSS4a//>4RA3d_8/\cTb;2L_Ef+KFYW6([9KWZOL=-4&>:N8R
;R[DIV=X&/0]5cK62O;\gK9+QEf,3#ZY+7RA7ZMLgE)3<3;FUCV3eJeC=HPEF6R>
]_QOME]1dbfgO3&OTgd/_2V43GB88R;X[SbE?fEN<;V[2c2-7>gHJAddc]WTRJ:T
#S-[R8>fXUKC-/<QS]U9N.7JNd81a;I7g<C44H<&I+IH7PRaF@d;=,W;.)[JN+.T
e-:I,(1^fcb(Kd6SOTXXG^9,[+&(+2CI2^)#^Z2:KEE6AW)M7N6[A(^9]U-5GR=N
@E^3J/R724c#Ya&@<-L)cJMC6<T^6g7TR>IQcSDQfHgeRPFPX1&J?8,cVdA(0MG9
/eKG)4(S1/X1KWUO^4C=)Y4EFR5ZP[0cS2+4IJ=d4cVScbJ?(/6;fb@cAW37U51W
]DV3a:C?V<B#FF&_L:-)WeTg=[ZV&g,6?^VKK.6-I9>bH1EdP:X:2LN7W+gbX=4S
R/03PH_Z/61d1?H=K[B3:/QMB80>WYG_TeeBQ2AXf.-7UX=:^GMMb<CGKS#aB9Md
)[Vg:IB#6YBc,9[F84\>7IU@-T4Q3\:13^F[8^OL-(dF4/3-9Z/#I_SO601=AHc[
E[VeU,Y0JBDR+#++H7B.\5;S&[_8.acK=(DD?<aU,SBB>_\L&@dK58S12@-@:fQe
<bK8;DTA=ccN&B\E)AD&(38beGfTN>Of@JX+6(]2.>DbY361g[c;[+/T\<Vg[UD]
Z5g\0-d&O^_4FY,,8?&8(cJ3QM[)fYBK-BbS>75P;RM@Wf]@7HHGMaRX_FJFTOV4
Z#feYZF0f^:JQ2/K#P@<)fUU>(+7[]>>TO6BC+gMeIY30f/SNCU2YQ;dg(AL,.]+
>&I]UWTgCaM@@6YP6f/O.<P?;CbP-RU1;@[1O6+#W7(DI=2eWBa[\cZGW.=)MVVS
gF;f8K]L4\4WgWQI);TROJ(eQQ8?/_+]0CT:J-4XQ&V[#)<OZVQRWGa:E/NFRB\I
]gZMW59)JdH;O=RaEZ;J@4?_P-A2YcKPO[QB@ERQdRREW]).B+]9&(PK(WXGd_=0
0T>J<g#(WeXO0b?3I7D8CD/NPLNKNQbQWccI&QPAVQK54X-O2-Z=4ZZ?<a+JZ]JB
)]gLR0I4c#9H]N7::M#&BBfH/UTP>HfFOeKT<[8VQaK4LD03]a5;0LO>/9_X_8b9
V=80PgY5AYg?18;^fOH#=4T;K(,/-6b8R);O\]#8b40G-EK-0KHP1FId1QC\UWT9
-DNcIPH2Ig+>eF,T2X806R2&)XcWSV;^K#e:@AF1;?G.g05@KU<e/fJ\aLPW/T:#
:OfPT98T1O-dWW=6DR6L-7/[NG(5F-?@Y5T>R(=5c./83,g<dGA5gPB^Y7-\g88f
0cG&V\M^V/U1c5[E#Pc?bM9>\@)J\W7R-8\&?,57H]FU;e=3VP&2/-?2dMMS6AIX
0#D(aa9#O:1HROeL@2RR#4&FMIbG(/]Z3@=8K?DfU=MA]@X2=_[K?(FYW9AA2+QA
W6#230]Df>E]UT0V>L;#<8N+W]/f?Y@HZFN=./4SM1TgL40:)N1-J1@E>@A/:DJH
1Y1^<IXdCAWFH[\Y?FgUgL/IB>1FYK?F)42,@ec#f:?12H&gB-QP;[YefTBU1RB/
]SGU6L=27fR.=bO#<EL\8HIR5/XU3?\W#GQIgROV<9/Z1cVW,+^1<eNXM2C^=cc:
^Bd<7K)IOf#gKR+54U^),LGGM9H.bC(N0F4C#P^C?&UZ19MMfIaHTG:e-62J7c+a
0-F6HE/O[E5d26>8#VPDAXd]aW+42Af2OL<]];I8IJ<_ZV?UHBOY)T3^&)MO\EF3
F\7>cVec=4Ad<EcVYOAN24R8&H&\eXI?T#acG-6e(dO7.IH]=gNUEKYVaF,H&;S4
?JRW7IX-[3@[>L?Y,b3)&^3E->H3TOZa>EX+WgM5FZJ2;)d_2H^4]YZHFUa//<H+
#1Vc<BXDR/@OS&-O9[:eF0#M_=9+W@eR5()<0=Q@][:RIF3O0.+CKF#&SaOS=[_-
AM179O[LgaFTW^g]8:E==EF;3]1?f]MbC4QILPHP=S_&>3Y4b[(aIB)Md8DQ1(-S
J5)AY6-=-MAbTV8L,O56;LZ\e,3=MF1E0Jb00F>[A,\:57C^U>Rc/W,+Xa:;K2]1
Rb,5X3@#>GT3FKCGL#HNcAZ9Sc,[-E@LQ)9=5AKX8NF,9),dIU.@,Kg9Dfg](T2H
DYe\fbV.F:PT17AfUQW+.;cD>]1-#VcS=;JWX;:/(8YfRf4A?<LT/(9>KKX-Tb#]
.FC#>MEc<LQ+T1T:(2ND=<._,gA8=2&LR3ae@\RX#]O_>(TYP<&<&H^.a1(I:24;
XNKP4\E]e;S69Q(beXSEC@+VGWO-HDKeF9Pb<ZPA);OEYP;Na(@^29?Ib03GYf_<
)9A.>G+T3XA3fP@;H[;:&@/-eR)=O9aEV_T3/-c\f\Td0#Qc1R=)\0V6bVVaBV:Z
C2Fd<D1B&FaTYSLgD(\&G5HP])2YPb(>OGLMO6_Q>+N0T4WX;<>dDRKfQ7W]K1#S
gBDI5(5ZegJ,.\[+AfB9<d7TV.gPCa1(GD]LQgEF/KW0N6Mb3Q[1JQWR7-:b7GHZ
6Q=;Z]U2C+BPcaW6@BMVD5R=X2<d(T<S:\UL-3X(g8N^1O:#>,8:IK,>_SZ\PgC[
-.02GQA&6_5MS9\eC/PGI,MT1a7J]=8V^)f?E3(>W@3Mf?>+_8NWPT(3^PEDX/59
7)53+G02C9ENDX?(OO\]IT9a:e(6A;).W736[R;?46>.4=94S+U1fM2R(HUOB7D_
R@#267g?;^IQIC-g7HOM?(E@^G0#(T04^HN8]Lf_RB^F.[6>X&6[d)d6WQKQ9_e[
O17Mg2EE7#,a9,9/Mc:A/.?LUC#;.]6ZXNY/IHF?S#W;Q_2\U\eQXaU0O.7:Ta3_
9[/82B9fH8XY\>ZWc:G09JIA(-Q33H8:&bT15.N-6b^8B,.Y/0)#]E/dG,KC^]^(
8[TS1UD(==0CeV6XU&+U,Ka9R+OEZ9MQBU[CH>V?E)@.f+T0,6P>H?>XP)\YcODN
C<JJN\b1L61R]HN]YI9U0,W-b=;VZI?<SA0(3>R0a5YC1Y<PY2>PC1[@+OR?@Q_O
?,4?E)/\KaAF&_49E[bKY5M45>JY?_@OQRe+M5ENfZ^VC+U&Gb-@-<<;X-+R7UZX
V+DdHBWE?K^P.ZNY.09IQ+](N][cUE?Uba9@?0Z:K>b^0BNLV+1Q.B2PJ2CKR5Qg
)ce1Ce^L\/E:9)68ZQ+b:WA2;O;Ic#bId?^a4I;0;FSNU>(Z^HNMRA5-PJEK^+QV
WY_:R#?T^OgACP&8@a_]>0R..K<1A4(&?b#e:^3&PcgfQa]Y174_dDc@Ef]DDP#L
(C^F1fJ)ZM0?Qb>;cY8-GHKLDLD&c&Z2\a#(&6@5N/Efd,-KP6@fU;G09O7+KWYY
9/B^LQ,?.P=Zb_ZbM@^G([?dWZXcSTcZWZ&DS#];,LC9Z>#I-Z+:7LC>][#K50++
V;]TJ&T4bA.99RR[K=O.OL/5\K7g<.5Qa_TINbTa@+8e+eEN&U5D&S)]HCMe(^B[
^FMA3RS0CgWM[(:]^1^P_6AeN;#AWg)1O1/A:XN7?Z,f4XYDH[_31:=XXfU&WGP3
/,3K.LW&8F2ebT8Ec,I9SLQDXc=^/]g&C>B9E^D=Uf^W:dUT]-?)@a?&8J\d(Z7:
IWdO-6/&<Q0&),;_Hd:JDBYfaeONaDeW](NWc4#S;\A)E9Z9TFc<R2I&8TH-G/KF
YcD68)W9>(UR<VF#2+:J27NF:]8-MF^TX)VC<9]75+)BLaF;a,aaGFEgJ_^DF@bW
3J.@b>,g][OV@(Y9<.<-EJUX,Q/@E7F9#?S(?57EW:#HK\95YGaL)FC>gGJa\E^4
^)X=/XL[5<e7b7/PT<RbN75:,YK]D0WE3RDCY^A\M=Le]^#L:U+\1X[]_I=M-^VJ
9>EBCVPG,1H;b/1P_O>#32RK)E8^5OcgS(N[6/Yf(N?NLaC#Qb?)A7A\0@\^eaFD
<D&7,8>@a_DE605:&e0S\9g+9V5EZWI?._f^Ab_6DeII7]K:[?:1K9:F-X+YZUc4
]WWI07Z7>?R?]FE+/WWe.Y1&3T.3R&.,cR2FdZM]#&C#<U,JXcDS]Y#3[T:E5Q]4
-aDOZ#938U:UaZX3gB?)]1]33aW1QadVQYgXG/YL)bF;,-76N;cba6G9ZGM+)2BK
@RYRZbZ5GLU577=9S7[,))[_GDOTT&N@V0C2(K:\?W8C(EYI^4WgQ&?<A8^<PA32
\.GJ35+TT^9.)=I,N:AO,9g/)278C0EOHfTYf?aJ18VfXdCNbTc?#F5C-fB(N;Pg
27-H+8VfU-NedU@KRE@KO3-F,@5dO05W=Ug<MREQ926a?>e33+WVe=+bS2QJX8?,
S=O@9E6W-]8,VA5OJb&YJS,[QRXb-RN<6V?e^]9SKJ02fBRW8f/\(4II[;G+fU,:
eg>b0T1\D#=CN(V_>0=gEHaEdRTc)B#28:0[b;E)>&ARKNQNM5L=J^GQMJ/LFaDG
ED?#a>?2^dL>.Y0@8X(^76J30O>d^9K1YF_XRZG3[U;@JONY_(276D/B+P[+72OH
6M#?UQ(K4^[[_b=>#.YJU6V:.d#)FSB3.N6.1>dF<=Ub&27F?UVH;VKA,f:GAL0\
IN@IHFWCER?TaK;0TVNP(QN<U_<1HcGPG>MeT=e@^+]T9J^^_SS=G<:SC>T,dL<3
MQ[0#450/XF-b,cZ[;e3]<_E:8(aOSFD<5#aF3..>/(X1QbaM3g:a;0CeJB70E8E
.\=[6O_ELc(-0.95\+IZ5AORUeIg5f+B8_L?,AdPa9^,#TODf^-H1HU:-YdZ#8_J
Ac5[f7DRTOHW#F\KI1bBGg][&/KG(ZR<YJ?5SUO_<(Z-F_?;6]BYdB;\d???LJFP
A-M^AKf?X:eF8Tb=4(AAeR07e<FDFf]F5>4<ZQVU9-G?+549F\8)G85(6=CV;V8T
VR<Z=ACMJg[fPeHC:WMJ:92N9=IP[U7NMXHa-[?>B.Ib^9]CIHV0BX,[\f5=I2bH
\+\HOD?(3)60]/ZGS_5_7Hd/F(3gd/e/]H?0LF=2Dd7MgRA5g-8.JM3O<I//8(O&
U;SD7KX;#\XM-ZJS[#f0d3_>W,Na[P]Rc(NaD_WNUdbd64+g3QIU2a>(ePb)();U
a5FCF:)gC)=UAC)W,f6>L)?GSJ#a148e_E^,bM5d=-86=eSVS)AGdTKU7FK10\M0
1f+D(+:#4Z6,S0dQbV+DT4g0OJ<O@=<[.K6#H@T\(]/1O&:3(c>)&M<M0?c7/,,f
UXJL)d/S@G((Y<RbDV#?)67Ig0.E8b9X+EV5E/8//V67c;_??eB]A^O?B7Q)B#P#
aHQDK4FR,Wa9dfcd=a.,PP71.)D)(C2YI-JXLf1cVG)KWaZg+g.Yg[B0ef<eF?J=
<:-3UX<BYRI8#W&D(0OZ-ALV8.1cWS0[KEdH8^\?64686G.cNMFEN[a]AU5C^7LM
=7:C8&dYbIFO<NDE?JF=&QX,##9(84Jb-86cIX.9^>G?c4ZJQ48:B<Ad\4>&B:.4
/>NDY_NFb6LM-.dIMJg8\b]Pbg\b8X..2GD59A(WJRE.,JH>N&;UDMH)5f2VC0W5
T_>VbG:=]626S-^?;2[6U^QQ\GA:L>B53L+2;dc@JQBSd=GDVfN]3C9HDKRU_MSI
^[(<W\687COCOVEU=]((=Y_^6=ZP3f.<1YDIf>&M7YBVS#Lc#@::eIYT)0SSXBJ0
P:32/Fa0&Qc19JO>1(8;YAV4.5]>>^\ZAT6DAGgVS/59K&DZBCGRSX<W>?K7CJ;H
63Q;_.V>(J+eM(b-(KTL:QAUf#O5CSI[2]Qg6CbMSS<Q2SO58),ZJ&NOfB],OIcH
@-,AJM^8aS.98ga7FME#(eJR[2//Z>CO+;14.J^T5GCOKMcc?M8)Lg6-OAZJ.&ND
M++gDQN,0Q-H08[OfY+(_E1FB)/XL.O\d8C;IU&5?B#[cXWWS/>gBL5AA4W&ff71
K^.eOcWPXZM12P<@R<9(5?3ET^ZZ=K&WeUN.&.OHK:+I+cL].a8TZ=<14SD2)VIX
U.@cNE:\N>07LD5-_O5e<R=_Y)ccUHQg-Z(=MHC.8a[07EQ^b?>cIU3Z#_XIR/4a
QN+&L9C>ZE13I.R0_^P7@<[M4T[;VV=(JUR3S@>9+^cSgE&:3#6OQ9b)Pd2=Y@g[
d)VP1SZW(.0KdFb[44#N5TT?O,MW(Z[/FB([))^J>A)WK2:O00gF<JQ=[S2MGB:-
BW&/\=\ad.??^Hf&+28?ADYd<a8^7DCR8F]c^9I=VaXL_360_&?eCR8Z4#c\721T
_XI79aM2XeOXQOdH:1\6&dN<If\F[Fe#;_R@II7]MX0;LeJE,dd&=N10QE.Pc1<)
2FR,K)6Y42cA0Rf\U/aN4QX72B8L[TRcPS2V5Q^eQ[Hf-Q53^DCLWc@[CaV-P@4W
O5X9)#F4E(/X)<8U>/(KLF0dT\La6^FH;?/9.=Q7-3]g[5)_LP9@-K,MB>]2HSGP
adDQP3T81N=4(UBD:Z_a+6>^UE8RSPX\/M#KC?(9eV:/7]T@d?5bP=LD+f_c)PF@
RGF@MFY^V81>DZ)EA6BYZaKT0?AR[#BGg_0IXA#?bIf9Q=/[B]_8TQ\)f(@+&#c4
9&&.MS5ED.#GacP21#-Oc6+9+g1aa.&d\,f</NNOg?P_Z:CP^/KUEe(ECa^IL?<]
ET3S5=77+7FN/QD+F70S(OYCbI;^?B:]c1E[(Rb?#OHFf]5_-W:4c:VBdP=GBIf1
26^3&gW6EI;LBIMT#&cf#;d@W<a<EZJ&B](Z)DB\>N)XRMGUaS7Y\E(M3C:GMREH
e//IGA@<A,d<L2e^B5T@LSf3<+;V&^VLIT_(ZX18+WF0C37//be?&f<La,JUEb[H
PO,C3#HP+f^HIUA?4EbZd:SXUOBQT[Q&<VY_ZgV;/HZ1#/.)E?U,PYQ;+G<N?N3&
^2W^@EMFDJAAN1U;CQYGGQ<M4?#cD6OY5.+I/[Ra:(-P+9UOV\.PZ5?YO:^f0BeI
/(I:_LQ/e:V0EXVa3PKP&0+MUA0#:53]7.4fTM_/GF4XDFOEa+1UQ^a-58+YaZA/
T^+fV(S76-94J1bKW_Jb\b412Nc5g&@:b;9Y#cE3/5LVP8JX[7?IT,3e,LM0/J\Z
8(XXHD4SVF;>D:H^[G,K7F^cFUa.-1L2g1+Y:A;Y#4LY#PGd^M;&U<cYHXe/-fLP
UCIeNTg<g4M#81AN.N^W[JOK0#@#9KW(#F_&e=FJGO=H#SQ:7>345DC29aaO-Ee#
K#6VJ&7BP<KMR:.(J@#d4>@;:G)SO?@B=X6RK](7RI\&KZEedWN)[K(77O2,4cIT
<9A#\_->VEO//@+700g\1H_Cb?.&7;eSNgUI^AcV\5bB+aCCG#=&a9U(ga?:@G.6
R4e.K6:K^=XZU>OSTWMd-=\5dOTdDKfL+4S1DZe=<0X_:&C&+4@WfDg2NdWfg=^d
=Md^A89LEaHb7cLadH5+g9d)XHbY8[Zb:g]IFXcg1DN,-IV64DQg?1II&&bKPC0>
fS6Z]DPU[8_A9A?0&T0Af<KU5?fYLXFb5Sd(?a+609AdJZ9Je]H<&3C3Y<H@eV@H
dVOa-b:#/-A)O5WXe2V\?#+Fdg;5>0AVZ>a.2M33W_Gf^Z[(9BTL99]856JLbT>X
3X//^Fc)PJ2DB&Ig&0=4XM(F_Hg/g;LN4SUWRDWe-)KZ..M[XOVWD6GDb>ILD-E]
OF)J/K0eaPKTPNS8K]JTR\9/dP&<5.(;O>LSgdbBbW7b0,b]ZOX,)QgKKfP)08YJ
FW.Z&0=EJ(SD=/#VTaLaTA&VQ8)e0c)9dE;&bLc^HS,(@^KCcN<@VJaXC2MR47CV
EA)ec(U+Pd#7]:X@5ZdVQ#cWPTVJ01;I7H>;Qd+cE@fYOIbEM_00BBUfSW2]<C@F
8@O9PMDPYRfQ[<Ba]2b&SMI)g5?P.W5c3_N^&c8+Q:5QP(Q/09XYEME_@C>NP(88
a\TbV:1#HP.E3:AaaI+ZN>?G0IA#85L__AS5Z>Yc;UQ^KX>5;8K?L2X1d_O(f6WG
#F]ZT@a<2BY3e1YDQM7(RYK1XQQXfE0T;ge^Aed&,Dg&bf-.]^DCX542070ZO61@
gg(RG(D21EO<1MKWE8H/@UHb9_c)-H.8d:/7-dYP^GVDH>G[PNXGQWG1H/Q63I<E
ZERCC_dY3dQXbV^5].F#&(KER<f,1fg[8<?H@bV9KOA8:3-[aKS7T<Q0RWMC[98I
,AD7=Ge/8&.&_?\ScT\))T6=A@>\+H6:=fRa:#B_=L\K_?]^GUUD_-\5/S/+F3Ib
LPQ4GTO76=BU&RLS#7?0e.?#;3c-K,4KeTP-VG5/UL9ef&[XcabeU#DN-@aV;6;C
bfaQ_,=BV/)_e_V<5#g8XQRYZ^K+ZdRc2&)FUBe[[bBCb-J\0b;\,]^7(L&_(->P
c5e:><H_1]?MbgfX&Cg0+/\b?+E?bU@3>cM)PJOVSPPP()XC<WKf-,SGaX+FIf]_
(Q^6S#Y+/MXLQScEEbd6_.L.YIf-R#fL1R(01Z6QPcP<=;7P/g:@gW@JD9Ee\IA/
^g(ZRCYG2/L\;O4cY.GG_&6^/T5G@aPN70W002a(U,E-I,BB7URQ^g^f\7.,[Q.J
gGc\@KJ<\&8?UI3ZK-D49&V=@@>16+PG-TK]UTYK2+<5HREX]EaK^X#CN0-9Je>5
_b/LNH(J?9Of8@QW=)Ua]DB0I\1<>(#;FT]()_?V_,B0)9WI#F]HWIaKO[V3E(F(
VWN?IcT1+e#6S9EHQUYK0cd^)YeR0cY9++C>Q+P>e+96F1S+TWF:4>d>]73,b?]8
./V2,3_;Ug4_^X+.FN?GV-2.B@97XcE&;:)SU>[=dEA9UN&AVeT2e3/3S_N@TFf9
S^\Q#8U\:NX#47SaHOIbgEMN]2F]VNeVP=]>E0U<HAE9A-.]X#C^1E4TB1&^ed6E
[+=<R?+GZ&:\23^E)DL=U.FGC=Z9@00FHA<F#5]Ca5[#_V2^?Gde_I2,V+A,@O=J
#3EK4N[LP:76cUg^N5HJZ44g8Ba77O<3\POC6.VNTSS^I[AW04IJR/(KcKE1g>80
J8V\XXKN_#GINFF[1+Xf\A]dLZBgM0Q0Bd<80NRGEZW@c^,MPc_5T_(EDA:Z/(Ig
D9N,ffU4>;E6-S^9.\B4c:/B7C>C9&F)bd39c0>QM&+]JSJJG:_9BfSLf;cJ1Z2F
1]TMa0TN9F;TB#F:0:IM(aD,c=OGA-e]d#/[Q5T(W<RZLU(QbeA^B@eP0=>2<K)]
@@\^[X42ab2QTXHK5_FAV6YW2F0M():@]KQ&DdfB@&U_/6=Ab\.,4[fS[Y31;)f#
<#^31#-#CBMcCCgH+#WYNeTELe>?XcY,Wf<U6JE;Y)SFN9aS(HOUXY:P\GfFX+Yg
1X=:b@f(KRY0:XB?AI04=+6F</L2T0V^8#/U=.,5,SEcB2+e5QYHaW+O8IbT\Bc]
aM;\5cJ>E)ALQ>fNaA>5AfXBV60b#R:_GTdHG2T20;HKN0U/)X#5c.O5P(87J/FA
HbGUBE_S5810;T[&MNc8PQP0(&DCPRg>LAc59NZa^0>0+Z7cD_d<<f)R-01O;6<9
>)0EaJOcM_/BZ?KK;<fU[X9?KQbU\A@(&>#(dAJ1RN@]6CU<J.=DZ/T;#4;eL39O
]Z<aF\&&5YL(1OLTZDN/HILCQ5[R^;)826Ufe[e\bJAV;<P_V,RJOJKL3eO3P/7[
bG5L@M@+IAC)>&9P](cYYA41I0,##@JKAR-aG&b7-O_bJ.BeW;L?(K2CX@1X.f@M
OG#Z45TfB@NaRASC3QP/65fOY,SI5WcD=Ha2W6L^/+1UD#AHV@8KdD0V.?+B#H1_
WX\.UW=J\e97eaX7K6+(ba;_S??e]b+[f]+-H]S)\HF@]-4gAa(NR8f17E2ZJJZA
eDG6KR@AW@K.SI.YU5ZY6W#LM0(BeUd-De]+^]_]38Z5BTAV?)AfDEQKVVf-#XC[
MWF\S^gQM/0E__;I@GX=ZZ9H=Pf@;ecZ8[1AP&M=PY3#\F&_DP\gKAS7)/I-_BAB
.#;M^J]1)GR>>,[[cR7IXXP+_f&Rc)]>6#(/:A#N.aUeaV65#5S.7KV5?R4BAW0-
DEcAP_IQWE1G2-<JV-R),Q^=d>d;58e&#DCI)[TSbAT=7=@D7]QBeObUc-\8d,cL
&_H?e74#J9e#R;A,G;NT,GNBa+/=P>8C2Ha)3aO]YGHIG5<8HaU5f6^3f?7AH]OX
]DL&9dCN@F:]]7[U-JYJMEJQ8EPQ5Z?\;TPJ8ZJFM>PGdg(CJA<W2<\R-^C5(RgY
4&@:c9SZY^B]g>ABQJ8CSC_D/[M>QYHIRE.D8039)b)O(bTS\FF>^MV_^LZ^JgIS
M@-SQ+BT8K6OWXfI@)MBbJb@gV>OT/4F>ZRXNAC1(A2SOU_=T1,4.LfGGcH(4><)
c-d1;M2Q#ZC=c>&=).UfP2Oaa_M^&A,7T_/IKb<\96ST&6LB&MeZG00eI1PUTN/I
cQQdd(=ZfDg-(MP[J=02;M0B48dVB://^F\2+;NHILMX+gGX,7KZ4T^Zc:A:]Y)\
/We5cSR](R:N<D&9RF_E3--7<b^FM>MH^TA<J&;Nb]RHIO\DE_-6G2,_;S+>?E.>
I5Y][Q0(8J@V+OSFH=K]GKNXSJ;.4&[f6caJR+2+DG_42Jb.cJO3-_MM><QZ@/Ug
2MC7Z)T.79J9/b.\&Z+&.R0CHMZGNN]7/5aQ8VE=58gT>4:W4#M#.B+OT2+44#?/
U7<1eJGIc-]NNfZfZb->RF2PQHH>e=^@O]Z]/BIb5aEKdQcf?_?5]9,;8LQF(:I8
X7M0-M@9g8C0e7:21IQJX))W5?]b./)73QfMWRW&ccQ<MNW^ZW@0.g-5-V5gM<[D
SO+T?[#K]Z:B2Pb;/3;V?EXF0D=[E@U=f_A=c]M4RZ3]_I-c&>1Dc1?\=UU>5IOA
G#-.&)b7D/RKWPL7Q-7(EF.daBb(-dMF[HOUSWB]Y-6JLB?3Q=HP^\Q.ICbLZ?&\
=RH<&+c)^D6RM:MKTK[+^;MD[G1Uc0(BL3B6K)ZLCa@\ESWU/\1)Og&/+_S&WRU&
53WWWSbb0IacJ^<fJP?AKGH=BV+YK+1(/&K/(K6CFgY_1LfZ#].0G@?O9BAgb4UI
)M&e=A+<FaLAb\I50Sgd=V?e_S&3fTgKf(,B@#\?QJ4X7A0[=1./IdNf=-P64X09
1>1a]E)H(00E:OMOc__GFO6S-OKSX)<M3I+,Q)-^FQA@WF]D5:(1;(,bRQ,8=YCK
^Va]Y57P]9]9f6^[aM@=9[#K32P4USRc^).8?2V1X.EEEP1TM_GKX\CF+2)-UZZ;
fYAeVa2BBE>99CF&aSLacCdfZV:d302cC(9EKdUg>TKY<628N7R<3=-+dA.3[DUR
=Rcg:@)a-)>36^@1/+Y4gc(B\:B+D5+KQO[?9)VdcPK0ZL_NRE)(/31+g;K3.?b/
L^M_LO&U<G_)-(-=0O,)Yd>P<g^QG^4IVKQ<TRQe@S-g=8^C6[U0AIdAPC5KIM?G
g(Ge)f>Va,c56;?7>IPZ>LBN4QA=0VN2cK_dUTf(&N6BL<0fFHQ[<CN;FV-BQ?aE
:VCKF4D0a&&Q5H1dg=BMX(5Vd0BDUCc==)T;b-[#))650,04:B,G_caZa<BG:c#[
dP9WPcP>6VC[-US[?(QLb-eO1GD0VYV,(RS6(e/;<XU?D8KcC8&TCb&<L=Uf6JCR
H>e.[]283[-H?2+:dM53>@/)X^6GCLQI++aBB##BTW@@UFD1<NMV,HXgR2:X59W?
10AK#I.BNf(;Y?EL-P5OO3V4QREZUDVfN9)e\>,RcR-_c>WGR]C#P_QXUO#W(1Jg
g6+DcYTMWeS75O_N39RY(2Y9)5f]@M9I?GCdT5a08CLMYfIa47g_U[P<g[)c\CPP
V#2)5Y-VZfQU&)?;Y0>MP>EJHfb4F)\IL>OT-gK)@:ZB;V.1)6eAN<^&9-;1V+3c
GDPP=Z[+\-X1dC7=E02<aDVJ??K^D78#VVf25AG-N3M:gDEb75/>:]HGPfDT_G)9
\eG>+,>LBPZ&cRDV-[5F5R2FFZ7cg9O7N^(;ENN;dVNVc;F410EMcO6;FKa;+88&
O5WfPG>3^g>1;K8<&HG:bKM]YB:J<TIgbc@=O9fIQY&1B4)M9Y(S_E(20)3A1JU5
CR]]E</fR::(d:2+M8DPP^f4e2W5(R<)4+52W,bd)6D07XE[RbUARF6&G)C8JFfQ
RK77/bI=,65fO-e4)64]g-T7W#.5SA0>E&:>PX)8L,fWMSe^Y51gfeHVW2XTDK?8
Q6<#Ff6L3KU+QNe7b=_DF9S5QF\15F)1+7Hd14HJ/R>DQI/5HK1]MaGd?g9B&6,@
a33a;M^IT(a8Y<bV>8U[OXSaMCcXcbPU/5BfePARGR1Y.>?VMAY(dJ5@/;N#F(+&
G-N8B5:3#e7_\5[Fd?APD3bY46C/.PS@=TRP??B-^&LZIO7^+HT#D?YKb\N07:7B
Ye=M]01EGQ(?A&_:FSH&071G-\Cf?fZ#b\B[e9b<=3Y=07c;cO(T6&bO)<E/G]8d
U84[TK5>LO3N/#SR)K^g=O@6?46bX<B&4\Nc:W2\M._\cCM1GT9T-RV&O:[[KY,.
))XWAFKGB_..R=0Q_#-.&DEIfDIN@)9U+IB27;H+@LIAfC@9MQL8eaG5_34VS?GM
E&;)2Q[8;;,gGNJ2@E8OP/,-().#LGd#Z9LU9g8]D.0J\d]QA;^^@BWIS,Vc66=e
FWSKf:H7XYL+e2+1@;bafG=J\_ZALT3d[S,Kf)FDQ&\?DSfb)I>3c]FXGUG.IZXA
8Y,B(\LCR76KE)V9CD_H&2]?0[:<<;J9M<A2/WNZH:D:??40cDFe3DXN@8,EJ3:Y
&6cPa4OUXBF]4R,+>5c6&HZf?1F,(@N;G+^A#(EGa^X4.U9@O?IKPBDF1C4eCZKY
YFf[O4FYW=Ldb:LO0D5TTU9YJ?_HBC>PTW6+?Tfa)D3.]#WQ/fCZZ6X#^(\Z-#]H
.:(b/Yd9>V)N0?HY2=;KF9eJNG+Df(RKUG\&W)]4=@]0V]SKU]P?[5U>-#A,/;\@
R>)ZZ^N5RFQ-We3e;W;IIdSA)1c_6(WIN5&IfQPWXgZ_bWR1aZ9X]M:0dTAMFIW=
:gUfY;a/TP?M--D-D-L)>@HR;/VG2AVfSa60S^0PPRB]5CK=FKV7G^YR\.GR+cGU
e?/RY48OTD_)U]W&6BX5Q3_:G1=LT-3YQ:3KeS^>JU2RfW[RaP2CgP^.9KU5eUDF
?BBJ>>c\1f7@21>K]P\,0P(LK#3D5QF#db6AP&V.KRWHM&LPMaE6/2(1#_]VL,))
2<\Tg^25+#WadZ[,1b6+b:Z/;_PfFP4/&-X2[8/Q;WVGM.>VE^Z4U,U&K0).O)]0
6/R+;NYC,B<XL7]D0<)Ze>TOTRZ.C8@Cf4ODJ\DAK2D=fEKb?f_05IQ8CT1CP,[6
[=Y[OZ&75&7B7/0M.RLYEF&>bP8H?J=M61@gL>\fMVgP,a,.b?M&R):)C&&B6H;Z
TeYFCXG]D>?@+4d;c593K(+<ZF?^P]CQXb5:Z\YGMF7;POP-](:@E:4+JLC^7-AB
/Z]>c]Q1]0T&Gc)3=^5(TK7[f:@+>A,NZ+&d<6\P9J8]aa,\YM(QZZfN+VI^NIX=
2;IA-O6^6#+N<0AVMN)(aVL(&&4b.Y6SdS+,SU6ATW&(L9A77P#7189CDNaM)Q3.
<VMO6<F)cBX8W32:44VaA(gU_eZdZFKXTAL?8#-1?I<+,QP<FJDX(T(?ID3#ZQYV
=MO11\]D-;MT7dQGfC:;Ie:3B>/X<#ETE+@Ig4H7):?8O.N5Z3TBa8DF:4_3.CdK
(YIER:4Vaa292N>g_ZN/]GG;MD^6WL3?V>0?#C/:8B+7Y41D,dT#&d?eDTT]8Oa(
4V3g<SVN)K5L8?ge:DZPG\6];Z7GJU@D1VcabTbf>>:JZR8(\+.GFX;H.1KG?51#
MVd0@WY(]^a]a[2^RUP?ZT+S+58CLN?W)2KV;)Q7X3d<)G^2L:+&0KD.\W(@NR)G
-@01QD+-=M@3cCW&DG+88]?RWM1Q:=NXU270KT+KMa&ISaLNFM0S([FA6J=7&D/;
HLdaXcD&>0DWD>J8[J8/EOgUO7c;1/RPBa5CC+=RS<OH=D1.[+V<KHN/=@R,BJ4<
AULK>g8DFDc_I.9#SeG]e=C\K6M&/GQ(ec37P_A?13YD5#YfBB26JE9A(I[+OZUQ
;HFZ@Se26QX&?I^-](.H1_,B=aC5-e=E04EO0?@I#X-c-(6D.K,NG2I2d12F?QHa
J]Dd[#5U][^dFZU7^Q4VB8c[B-)cfb_3,,)<VFY48Wd5LX0;:4F\^SC9F-OTQ[e@
KaO3OOY<863P5^gG6^1WP:@<eQ0XG]IeNIA?CT+WJg(__]SJJ3\afTY(A+5P.;<2
I\WVgA,G=#d:g,?;&PD,/E5?>;dL<)Jf07QASfc0L3<NT,U(_dJ),(]TMb3E7gbG
)26X2?aE-ANHgO<UR+-F.J;CAWN4JKa[7-F,d:SeD[5e<YR^b@aDg#&CJ;bSO7AF
07&2e;7g<OKS3]C^6YaIB48^K94B:BBO.=B?7ZT-YB7eWTX0g4R6E)@KM]00.f37
5.I1D?]_DBTS[:X+bd\35>C@[#GD;@4eOT>YL,QNWg94]EI)7Jd_P\b-Id.(4R5S
[42fL+4[VaRM;g-F&4PIdH6Z,U[cRDF.2PKS,A,=GB;[cc+-_a_S8J8[P789##Qe
+FUE\=Y/GX>(?3_4dOHYTM7/8+6V9g[efP-#0TbU4))5-KcI)N/5b/K\2dNNN3+5
9Gg?&G]K6;B3)0[?9eXIRB1E?b?;-0](CI:.HLQZ\KVH?>W-c,U/&?Mc]Ee94:bX
[N>OUGZ&3EEG:JX0=Z1NIPJNGMR<+5c_0DES.gG0fM8;PB9&LM35.ad99F>UJPfF
5V<?TSHZcDU8X/6JVR9HbFb.(DX2++8/:O[A-A2F2_f&/a>XT[>P_35LI^X+E\,9
?]b2)?ENW.XE1ZNUfM<GePY.NW+31G@.6MPX=f:AD^ARWgHfX885G;(@0/VCI-aZ
,dD_WA[MS]TWeX2^OJTQX=^=T]M)JB+0C+7M7I4#<HRI;^_AL<MbFQg>470NSCE@
3I./Qe;H-H^;YG#8WJ;bQLbNB/&T,gfJZ\7MC2(0@DdJfbNdC2?2\b6fSUG5^AMg
NJQK/T5;MC6U3<;OUXbTbLCb;\K95?8=g0UXYBMBIPM&X]3,E#>>I[OM9MFFg_:(
=7RYe;4@Qc5;g:F4]Le7[WR^KFAdFK?dNKa2_R>?51TZ9\^O9Z7Pe4_UJU\=#5c<
Z7Rf(DIO#H53)1TJ2<8=NZ_Q,bIDG<XXZL)XCUbM?Oe-P;XU@/F[OHZf\./\a>^8
J2M^SZD,AcENZbdB2C>M+9U(DROHP<N5,][84eN:PbfPYF;d=C=];I_\S0[<7:BB
>S?^9F8#::5BWV).PY)I\4)1VZ+A+_\S]dDe@KPO^_/1/:.Fa7F458[KVH?]HYWZ
f;cd-2/6b>S^3BRY]<4G5;=Y+:QNQT.38fQNV2>61MYZ5_WfY(J#dJ_OcaYVW+]S
V<8FLac@-83<MI.&(NH;b4?&#PT9#X7[(U?:Kd/>5d09[1b6^_1A.UaHFa<9\MRU
b=8NT)[4G3=ee9Rg8cB/S2G5651-,4<C)03U==QFFc&Y-c,U^^ZJQ44M74GEFEfT
#f,+;GK1#-9)_6RU<^>V;[MHO,X^b_dC<2R-ecY[HITJ(J92C=/+d&Ue3/ZIX-Ke
8?LU.,MPC_0XLfS9g694(6#a)gU7711^OY13/M6L5^F(Af-EHR7YaI]baE,AA@.B
WN-R8L=QN2=RGMDG57SUVDfbB>^+H(?OK,RFN+X@,)]Db&2=Jc8VSK6Q?/8EZ@4a
e8/Z98FcKLHLYJUfF:a@;2132+e4bCEcL2NgWX91,1-\N8Z#=V#.-gS_5Y@0ETO#
Td(<[WIFMQN:/IaIF[Z]QcCGe2R(2RU4_WgG1DYa&TTg1=C\KK8L05d1?06R4gfN
;Q#)PV]]@La[eS^>8e[L[[Q\M(8B#8S_TZ@M\+/5ZM\?B+EC49N+WO6]ESUAHO;g
PK>@.X_Zf.,<H70faG+1IT.PO[?4(a2aO/S/+,(RNSR(D-7]W.?bC#B(+\7I;R:I
\>_GE#ED+WLEJBcF<P=B^P0W3RaVd58)1:I,2-Y6[TPR=,2MV4eXQGA3.a&TOUaT
M[D2bJdE>D33:XW6=dY[EL:;@Z/+],&J>;fA)G+dZ5+#QHQ3L@KY9S5c)[^dFZ>1
+aX8X:Z)W]/AZK5e6I-^.D67A6KVM?D(3+b;\XWbQ&g97UD@,I),UOH2-VPNV?aB
:UEJ#aJ75U^I@#:]+#RGO1f7<SP99<=-B5V3.-VC4?VNd++9f)L[a8d.O-d=K?C[
(aQ3JIX]9>2MbgM&3_5AR6S>P1#L)G)6(O=eW3;G.=LV&JWDRE@L5&EV:_-X#Y0L
9JVXeJX0E->W&W(Gd&F2WcZeE8?IAC#:54VRGEH)[9g,-7G\POfT.5B+#N^Y8>I[
eK]Pc<7^9P:FP8@F/<dQ6/a/)PFF<Z/?I^9SHb?Nb&Te(7#;,5T?d3RfTP1SDQ]C
^S\f/2fU<Y1V@8E4J4_.8EY=0MG8U559Qf(GP:BcJ&CI5Hg@,G=PP,6ETSUZ8?CI
<TR8[NG:U_LJ(]R2\;GHgEPM,D>Q3KN&+g8P>>PE_W=.,8YP2MaAQYIg<#YI6?X)
],5&8];@/DMKJ&\+LMT3=/I+&4<RFZE#+&J975f4Me.H[^(\TV7[UgO1WgNM#1Rc
+7>=EC-b?=4X/MYF@B67G,6]B1084L4FNW>]&2[O.PfWTYMbWc6^:LH7E20;T\0/
?&ef+ANd+2P:IF\3X_J4VJ-K0g+)OE^C0e^d15I(N7c98MWfC5O@:44,1UC<BSa_
W[CBg^0O39HXP6CNIb+.SVMY-WR=H-Z4I=)-aY2UQJ(+)SL,HdY,&,/R=X8^9VDU
MF5,O.<@Qae1<W0VYPV,.HJ]0>YbTbe2U0N7=?7;N>]f;9/V4,e3=X0CD2Ec_c(K
8)+W-+??ZF=a0QE?8QWG64F-Q>=]=J9bB)Ced3W^,Y:eQFFcH7E,V]Fa2J5/B36?
Ba--_FQZHIGDK1.BQNc^&EaN.cQ-@a)KRdfR\DTU>?NCZ[1RK7a5-+HN@L@G[eMA
XCVEAWQ[JMc?MG[8)B:D4358O-1dcD?g-(H]WGP5Z5FWD0dD7Re^(e:0[[8?/I@\
c^Z>[[PJN.=YJ/[+Z@>Bcd)FUUE&<fCS<YS,f(-(c&:IWK)=dK.6U1?a,DDC2G>1
4VPO.XPWQ)+=I>6dET^+1/QDI.GZ<@:ZSIRac)DKf;QR#3gFO.Wa,eY,XM-e+J:U
KIg/4UI8_L>;#RD/GO,#E?J3EQS0H)F]N(.>gH=MYgBNSb+QQ^@)91G7313(LM^Y
WEMXFL=.P9ZVHULE//]40;KS/FIZXSZE9f#I=[?\TgUT3Q5]3YYHI:\L)8Gg9eCB
U7#df@M[+,4=#\:PH1Lb^9b1/A2)5Z-cC>Sd,6VCWJg](ZST(?RRE;R]+78&N6f;
>7OEM78]QF^_=#NP@=b0CR24NJ-GZO,,S&RSE2?(7.SH.)&\BXE5P.49;)MNMH&+
2=UH5P3);4-?LDCVF:B7bK^cEgYVZ@)1D(Jec^>AbYTIC@EgG9D9;;N(&f(RVOg9
YFET[GU35E^&L52cMPU1aQENgW?)-K)\HU?eOPMa,]HbFYP0a/\8OeU4U/+H#3N:
;3>@@W4UI[K;TZ&K+,=/eK@M2C(-ZaHLP[0F\H9[?7;[]D/dEW(->E1ZF-Y^LK&6
ga03UL(ec-EN5=e6N7>KRf(H07=V9+<Ofc5/#0TgV_3@RM).()V^@1UaN2DKF809
X?@6D+@,ITL+Cc/7=::Xc&C53\ANMS/5]1#KTU25fC\3E?ST^S]0B-APFMI>+N<S
He)C:d&2=N:Sc)8cI^SINJT^67g-3H]CC9#ZFL,/EPd9T#>HIT0,XY:U]:H25g=J
\2<5MgYKUb9@)>MNQR1VO,dW@bB1,R4+=38HGMP1WVACVP,,=.VZCUf8.QSQcD8g
G0OO_N\_?4,W@#P6ObbcJ\aWV0a-VR2SV:(,V@&,B4=)VRCeO8\3ZHe+?+c<Zeeb
[N+08d#-;M]aN?Uc^8W>FT+]fG0LZ#>W;TZ=4_U@gW#+J(+e_0HI^F:;?)\>.-HK
M7@&(.1G?JP)D]RaAP1N3TXRKD?+.?LEd\4eO[+:,.CR_=F#1>N<XY1/UHNOV6AB
c_NZ7-A3M<Z?]:>B<PS(M^_,b&6Y2=.-32XBC_U+IMC-F=J./dD9]QfR@EV1,,1T
.L8d1]\/^M+PNAg\I8IV>G<&BIf.F;>SK=X0b0ZbA0S#GP.Y#PYVcFMf2)-ACPD.
+NH)?&QeYVZO+2N6,.bN&&J,_80FFX<(E:JS/e6;BdA<SZf1eV9@S#RU-CA&3.3S
[g?^MdcP/7(>?g^1.MLYYF1:a_9M:PW7Sa@,M\-c<#U>J:\)WP,b^g/f[.I5;.Y1
W1\+eIgbI&^bGZC#[HN^41J0>eeJCQLW])IbMULSI6):P\PPd1e.Y5[#@<]3\[NK
_/.XKO6CM&I?<46.H:#S51e#O/]AE-RL6QeA/;X^NSH839:WVeOb5\[9[.2,1:M=
J5c3b?_V>.Q3Ad4;KXf1#VX=AD<AP\fR(,&C:@/@,P>Gc]QL+D.0f&P>VCPG0@]]
FU<.0:DB=4c;Mb+S?6P6I6V&U1)12EJ^JDP_@5Q3aXA-0/+KVf]YMV@/,a+^(M(f
8)(M<Og3aYKWUX3>+J)DEGHb#BQ1X^Z&f+MS+5bV6fABd1?R@JG@?b[R6N-HX[1-
Wg=3IG6/>N)#,J2gW4JU/+<O,2AMURL^?f5BU]\Re84eW+3B^/3IL,P>#]eR<3N1
K&KI&]<I0OK3fP^IN1GNa2=(6MD_]4,;a<8.O@=;1E<^Z/FM<Hce78-V4?+_9K+Q
gaBLa]>D;1:VAA;W.ebB]6;>]=6>[Sd[U>/.VT/OfWQMbWX=:AOG<-UCPL89dO(O
XYg9SX-2KPbZca5-8#&C_F)B+AP.)XcXH0,:]d]VO,.O<D91J=6D[2Y=R\TY+e9#
>E#)T#R(_-Y31MD.cU>^G,EP(:C3/Je8NVbIW\;-J,^9;f;U^9HVX#FJ/<B;IN?5
Z\YM7Y1EZ[MO4,,5?R^GT3H9@2.2K\/6JdVEABCHR2Be#5;?9:,?Z<HbN\<JMVdB
,HQH293OJQHGZ5P#IaQ/UeE-gWE1(:72#[UU\)L6:Cb,55+SZ8=4cAGQ+/Fb4B#>
)6MYg6/,_RGREWZ;@1.Eb3e(8.[E-@F,RR+<4IBPU/5Y?_3c=NVJf3+D+(VKg&0G
#FdTK=f\J17>77[8<7>;]ZdB6[#96-+6X,7eV;X(#c0XPW/3:JV87(AJ@,>2?8#&
@XD,UQQN#_\WN9[S+(BK)=MK5HHT)e,]IX)ACEUBDKN]17;==>D20V_.&C-)ce/U
55PG?_X@0=KOTCX7Tb4)d2J73)EW1=]#.Bb0&E-8:/AO\a4.b@P)B&H:4.P9N@V=
Q_;2Nf]4XG_?NQLVHG2QFUC[0:_XJ)/>[NAf3(+.Q<a-Wf7a2]J/Wd3QVN^+<B/B
8<=E/LP0?0JJ,5+I[9_F#YIFR+ee9NO@Y@B92W1+GE.c\_Q,<7dc[Zg5P)J6bW#d
\c1,?QK^]+8&eSfD2f=\05ED.88)GDIA&G>QXf&]LWG[g5e-Kg1eRAdLeSfCfd/K
8PVeUMYKKaR9]Ie#:JfSNV;F?ZU\cRQDHH^ff&GD]W@TL>Y=6UNEd[B<d7BPL[5K
U_[fCgD>a;PY6=,:9ICRIEdBMa-2/#694gPRDOHKL#DYA7H:gXQ_/K_H<e.YAVT^
L5,Jg6(D1.T]\LREfM[1<6M]K98dPBO9(KX>[O;<9DE\K^K\2GSUUZ3D,]HeEQXT
0O\NO7aU);H_Ne>Hde:d>^&.^&A&,,I;)V<^ZXUE1[Ca&dd\#/Uc/deA(^(ZWT+/
CSR7cG.5^LaE/+XeL-])U5K)U--KG>@,ME2FI&]^cV(d,TPgA=)69f1/f6XPP5VR
8T1fYcM3)OU<?Xc+dP8KF9U6M;+M(.2\HA[e,LJ[K,6-Mc;B)RF1T8&=?b:&NPfU
,^G)AZ\>-AUQ&2Pa;HT?)e8Ce1A--PY-Lf.XLVK_]-H.g:f/bI=NF84f1A8(8FJ=
/a@Y:b;Q-8]_1^B;-=9V&ea@c;N49[&)Wb>PH:LE.S:WE?)<f6eT5^.;(-I@B9\?
.?KbHbNRLL(QCg0FSJF=],<##_IS3BH;F<MEa\;;&2fLd@<0ADeII@c=EX7JLfE\
.B.d;([XG4DC1,RKUQ<f3WESf-+@.O@\c5RD@<+X?d:Xaf16=0Z2<SBFZ#8C4J>_
G9bR1K_\WcC_2=1Q#=(Y3[6Y.5KZ6_V)]:a?[<;L3]Q_ANTaP&4],MYUO];W_1DA
N)LV63?-J;S8AQcS0N)Zfd];7PE.G6O\Q_)S,1e2W)/<?(YOD1A\VEF0;;L=)6QR
31AHc46LXM/C.J-@0f+9fcZ[caOM6?RCZ]H2IAC-:K.OU--<;[I2YVe(b#S[;F4L
..L:9DY^4,f<Q<F]:EHSA<9-9Te2g-CZ9M]8+_d#S[;#_]MQ#)C]a)W+eVUcWgSK
OU_B3<]TA\V&0G<.C5-_1H@ELR+?.W3PJ2/cd5UKWa++9:]@2aT>^]OUL3)L8cJT
.2Y0G;0V68FD7]8>G+,Y\X^:=\1EC2D&7^Qa&UNc,IJ8P:6XDC#?T3#;3_?K7N)T
J1CfYTK(C]-Zbf\DKC9cBd,0YKW7CZ=Y\UNL03I+BN+O=3c.K[H?AR?,[QIRb,Z8
W^R\0;\#0bXX(&+Rc:=4Qe_B?^>T=Z(bI48:;S>X#&VM0BB=D<8I1+,PHG=A1P@9
-dW^X)&8U87TLA^HV&c^c#8b402-,?=_E6WTYHQ<RE\,9C92MRN>ccQ>UOGBT_FC
ZdJB=1FD#0LV)SDgI5PPWP#_W47HTR5fVa[8Y]I93P<94Ccd]K)/J-\cZ\.&Y&,^
PH(_L_N[fB0Y6<[+?Yg>DX3feVY;MD0BPbL;3RCfYE?E;^]@AW?,,Rg#\662Y^A\
]bN,>/ZNWf_cB-,Ga]ESb:^XNdA:HQL<231TY9X)d:C5B9(E.]1O\,2Z+EeU(GR<
\1B96>@eg/46dQ3_.+/\)@KI<Pf^ORd^UGFSM^3/P_I.eC;[T:)dACZ=;gV45YVQ
W?FE)VV&W/-X+9>M7<R2ES0e&a[]-M0;O<1-gf+]?)-gENNDSfL+YVaG)eETbc)U
\ag>/e#CFg58FJX(8AMYQSUZ+WHd[QH3b^]X76(=QW(37J5O6-Z)LKNSXOE/)<-^
B68b]0UECCG4FCaC7=]PJ/KE[CgTZ>2C22>:FU:(5b-KNR,W3X]fS-\U>)^<\QW_
0K#F#(/V;GGND<]99HSN2WQOCgID&C9&NH2e^5RE?ace(JK5E/GHdgdfCPUE7U?G
>8Z>(HB+/6B]1LAF8>]<,b1UX<&M7G\/\E/CK31.J:ceb2X7T?ebN(5M>TR3;W>\
d6F]&eKI@P?]\L[6L:.+VE#)TZ[RP;,P\0+>^+?[WY-:>9?JQ7e1-&IOR5R9+QZ:
4-T5]+)4=]L=\J69^B^J3RXZgUINeM^Kfa3Td@IJd^U=104_14Ra4T8BFCS05+4P
&PE^4;]76Ca9f01Q9f1K?.S;JZU)5eNAeJ28?EH)@d24>.A#EATe9/9A[.Ud7:a,
^O^1N(1J+S=2:_.6=ZXF&8dd7cHT9I>6NZM;fFbe_KXTHS5KPW2Y.L.S@/]+H<\Y
?Z0+;8E>LW=YS[L)V,CKIKY(/4Hf=-ZTDbNW@;Ag8cSZ#VeB;)_@VG^fgf_R3UIQ
,84]eE2JSeYc56YSW6?WZR9XQK_g5&ZX+eQR]O?S>]Q&7D6_ZG>>.XR548/L.,8Q
HT-T1CdBgYLB+6:5T)XeKF5)X^5^;FJ5Ef]PF,34EY2<SGgWIGNGgdfT4XPL<_>J
YRB[d_5(@KB75GOd6X9?&(H(4<F\3@HSKO46D>+X=G0cM2H]c6:\.b7SM?5,K1H7
/JZEDa)J4;3X@GC>DX/X8M3O]2CbFGZ\6=DL-/.gdcGI[X&;c.EK=3Jb32W@@E<-
/#F+WXM?OF#4<WO]?95f[;<1Xd.;\8I5.:DC@3>e7)+SJZBaSO?gR9B3dcgV6GZ4
8@\P:C_a3HaP32XdJHf2Rb-7d5:89)=TTLR:(0T6SUgA-3+_;><=A_NFKHXJQ1>C
4#^-M-@M;_,+M?ZN9^6R)c);PX=_>;I6g?>-#JMMRS@03K.]fF,LbS[)AP>(Wfbf
GOI1M^WCLY)TH__fN?N.H)0,-<90#0bMO-g]B5HGf3.XaV5G2B)PAV(FLc0=LLW-
XJW9G1PDeBH[A_VcUXB:AfE#<#M/4+bZd6c^2G=_J7cY/c_Nf1D;)\c)V]4dL?fB
=A6+JG47(g[4HcNG>SX6>)EE4,(^;:R,5QDY-QcaIFJS=MT_&;.A/,014-#[EHb5
.8L]BbFTT,EaO,KD7G4[A?@BV#=_O??W];:(#6?=0dTdZQQ2NB_.7cJU@gL^X7K>
<Q]3G>=B-g:D6M?-[5:UWC9cWD=(;#2Ge@Hd:KVXeN>dbPUEV1#f:0eX2Z8JY&;M
eYIJ5]SXac4ddfK0//==]+^#\aGe,&XcCL1+gU0_86M(PgVeXC/+(]b;C4I]_@a+
O0L?K>16J>VQ<??4<Wb3<M>>g42(J0SIE_3^cQT0d-A99eY33I@?DSA;AOYDEM<R
O]JDW?/_I.;_N;J:Ea>b6U+fV]::G_V+Xd5104018L05f&9,F2VSNc=><0P]IQ8S
5R/67WE#e319RID(TGWd2TB[0L60,1dQWK7^^1H-.>c6\d^FOg+Y4?T\-#5aIS+G
aSPH;LQd-eP/4G@4<(^KN:R72f?QK+\G7@EX&CN3@WPLRN[FZ:c7/>c#gN1Tf,Y7
#cZY.]5@ATWTf+Z\Dc<Zg;>NF,-@X9OU.#gUb0PIIdL@H,J2);[J0S[II-S9LEg3
F9Z<;YE7c.LPJaH&]a5\+ff[[eSE?<AV+3DF89d=0+V3UZRLfPJ-\0#K;cd;BY^^
;0MFG1NR:O7-.YI^O):;/?5-Xd,V(e(-MWH5,8B/FG;DL=65FYS4_U9cCc=[@_7B
5QW0g?=e2TZN-\T?X^-71g(A+W5LgFNWR28C0L=-E>b3,J.M6I>;_;+)K]M.-F@Z
757706-^4Q7B[cMJ/(;=_88Kc2e]c)@Qb&#<c(3dgKQ4,Cd2KbSdEV1&P4^19\]<
g.Q-d.FN(NI=2:_LVdG8R[?.ID(LBSZga[Lf>Y57BFe^AP:V2WE<dBL?(N2;cS:&
QV&=_K@0Q+>W2M-,4@DW,QN,W?(9YAR_ASOggST&QA,A.9D]I)Ee;SHM[:T]1VK,
3:^[XDU:^O=>b-0ZR(5bS;A(M0a6#30bdBg&7Y85QU06.]^TBFE//,4(3D(:T+8P
U&R107(FC^cH6Sa>#S/gP,f5.HV>LN:dC(OM-:<a-/W8D8(g24N825QTOdXMI2(\
RV>^F_)f;HC>[WC_ad@SY?\(g0c3]U2QV\U7=>IVNLYMJf+D2ASU5gbeSQHac=;)
f9=7/-+Y&?3Yec@OC@L6NJ(@[e8LAOCXV9.622E:L=7[^;&V2RON2K3fKY4bdMCL
,MC5L8A3AC]2>,,<>CD#5F:C+VJR>42<c>1YPYS38](RPIYIKFZ.LUZ12XWZVJ.N
cDMT^A5]3D#(5W_f/(U?]M5/VMOHT>U)dY#<I/4E&Kf3B?-\2RO]CT);Hc;1MDa\
3Ug#TJ-Tbd-9OAR,QI#@_b^][->DAIJ#<G(=RMCGX\YRT_DS\ENc<3QB_=a)JM=9
^PE.aDQA]9\@U8)?(RPc^b9EE_Y9Le8E?gB:)0I=0H]LCIE.&fC99:+-;R8KTQ70
)\;^/[=DgN&e.fQ3THedR=(>bS98Q0M9V8dfX,>MX&2b3/479^);d9@0NQY>11&^
K#RWTd(F_BZ)HKH(>I7FWZ(HRT=419H?8K+\H1+C2(QN9<(C;P7a90&/H1ZDONEb
4Cc9X+.N_1LZ(V_]X3cN<ZQacc^4[P<Yd3@eVFL[,GA2(#ET00A\9/.A2^?P05?N
5,R?Y:Rf8\4@JGB_DH2^#Q7\A//ZN#LVDMYR&OBf&XDd2U:\<JN(R;:XS_gc(IHT
2[8R8I7BN3#.1RIXIb(Q;\&ZaXFa>UK?]Y?]3[N4#W2/@IDJO@J.RaI9X4Je@g:W
_ge0f\)BVRd,W[9(fa)^4+O0+:K1@];RX5FceJ73/<8gR4eFa/g0f@^=.MeK+GQ]
8G^Ba2]b)WPfC7#CcQ.DEMFN[bKb&P^,+FX)@F1.GMfD_QB?\YQE?BX<XF94OWb4
6_MM3IfZ/WNU8I9NbYB?^I/#H4;16I9@N[I[7K)8Dc/.gOI?0+#J8a<2&X)LK>SN
,&d:?Q1GZ4QY[]6?)J[+S@TgBY&N,UP27_3cF2-XDcPWWR8Xa,T2Q4KUAKFLF32\
e^P[OV<Z5bUJ142O^;D[7HA8\[-=SP[Cc)\SR;G2E-1#M[4J&RUQH7gINK+#:#F8
]OebJXAS[Y@#UAPW92\+EJZ+I+]>P7T/UEWV6L(>1G?c08K6b;,IC[5fNAe-0+[I
7TSG4<daKB?ZXZBf?:edgD/=B\^eKW>,JZDRS?S4@,8,2FRTB41Ta+adX,J(N-/G
I.695Kc=L>Y<S2R37MT#._F#A?V\B32B(f4R7-d<&d#7f<@]FC[EPFD3FUK(UKSE
?S<TCII1RM.=XIWVB\^-P@Y1Cb\^0?JQJ@88f/J.5K/>eHMI<bF;M#Z\E=KXJ5?(
C=Bg,4#IURQJRU)aP4=gO9HDYcA1Y#)+#(=C?)P8Y2)<,?N</FPYONAYSOR7OOB<
9P_0JFDUX-3ef9#02MD5RTUXK_c9IdR6@Z,PC7fUT?\G/eN^;f^J9RcN#(beO.T^
:2K8OgcfK(-ca70.0da#H>TGN7(7:(YLE+>-@UF^<cYNLBCJ3DKdZE2CIQ_FEYGG
Z+^bcA:Fe?Kb^HD0DWBW-;S,&HNf,K_&?MY\N&9)@R.D1,3_^AGaJ>SQGa8b[I6;
V59#NGOH(L.a85M\Rda5Z)N7b\(,@U4b)2PJBVY<3@I&.9S7+gI1De_Z>)R?cc+0
Z;O6[<,V_<J&LO7?[_9X22BXSH\O<7d7X(^NQBG#Z1@8J5M:FIJRe.14+\^gLWLY
0/GT1<(6(bJ,&ZUSBXe]3@dQNd6g;ETY#QDJ-\gQ^-R8]e8RLCgBCcZNIYG>M@TB
Y+Dc&&T]Mgb>7d9TO^.T-YPR6GIYc;L8;Q](YS&4O]WOOCbNF&d9>1?@+2ZX)E8:
:[c2:Ke&&UGUD^Q+#a,R,6=8#DOH&T7b7P+8R5GaKL?V089#,&-HD:_,GE[/&ETd
V#)EbF3WN>4b2C5-GD>X1]b0<V?DXJU45_7fSU]?#-)JNXGNOM.+ZK<Q/>Ia8Q^a
IY<RIL;D,UXZd_a^CQ[Fg=@7_293WE==-9dHI]C^ANOAb1f#c)XW;<@,GA[b[5U7
+c5@8WWL4014cAJ8FLLWKD>YS,SN=Y48eU2J>G?cf4(d(6#L,^NHKZc=[&O^7AOE
^:EIa+(Q^#1W@[YdX6_QQ?bSG=?9<3b)DP)b@02YbQ5>\Zb@ADF]^dV,ad9Y)bP;
TT+[d5&C^TL?P\5d++5)M&:UW5?KGRWc]-59B>&4;&\&V:=R5<C/2EgO.@.);WU&
+ObS-Q>bJ4&,3g^Z0d:[6>2GD-IKZ.;8[]4&:7d<@BWR7:gcG&)8J3g<?(D<eEUB
KHUgbJFa@?;fda56U5^BB7b=FF=JT0P?9SYFG66+;.eE/_[=?L@GJ7F+:S,UFDGJ
H7Ff=655)@.B.[/DPX(NVU(<H-0&Y3dH3,bR-a[<^C?+4:8H1gT;RX^I-MU4.UGV
\O+>W(>:JX[Of78AV?/774cdF?MXAT;Y7O^b1QBR0G@[<,[\51]I6CS?GcReb/2C
J1YdH&@E3<(JIPL:bd9/9II9\>T(4<c.FO0:gVeO2NdcI<?-9S7Q\I-MCK)WORa(
b#d)8^LSb\6V]e\MBB(RT-1T@9LcQ:7aJ>:8/8=Y8U&@A>PTN0.XES0HJV9@W:VC
Z+CBGb50cY,W+.1FP[90FCPJ@3Q+>I7AP]7L_@2_-bId51-Y99]#9D3_,^6W<.[L
fLJK;:QSV;\-1;g>JZN[Q.CXU&W3Ic,CNad#PY6d6E;g.0-U&cFQ\;d3X[5+\3b&
#28(NMIDdJZ8<[><KVf^-T(\6^?[]M0[#+d]\f/YM798)@Ef/J-fC>3Y7;+Yc7Y-
Z8?4]OP<bMafT3:@QULLABG)g6LHY+CH/CO0F-f(Td.X4DY]0-4)+Y6WT9PHRMLT
>=EMQ+.NUcY+Z3MPJ_2bA2W85dEA^(O9M-C_cSIQ_bc1?E[JZ=JTL(Q4L/HRcY;;
7@?)>4D2GD=SEUA5g#CDB089/[S@G1-U5V7)J_).-=XRT)bF,[)C0J6?ddg>6K6+
=QgKF[Z2&P&A+fdEN((##F7&^1+IY54OI]1T+D#Y&eR4CTE3\B3JPK9XGCKEdJWE
R<MEKU7\-VX^F\?MSg#[a:bXOVJ1U4]I=M]@AH2aVB2-2g?9G2K:cLJ,cN&<;4NS
7YE:@QJ#^P]?:R64K9Fa4,:/B26;OA)M-C66A0b/(YGY+=B49Z[I2\afCeINfI:c
NHNQ/X=?d5>^QBBNfS@eC([@&0S4BD^#TG;WU?.c]@YCB^T-/F,?8P0R,)WgUf6(
Ye3<OR&W(1>,d8QS35-d]d?Ub-9PVM)R<\A;Z<\]^CbT\C2BH97faR+^<?6NLa64
0^ZLXG?dA=C##d[P59Cc(+T9PCD[&eE.&.G(6O#Z>gg,,IU]UE=BYNGBCW#C6,ed
[D:A3IfQFB#E+L;fO83M>TbI&e,4RgOQc@(6:UdXF&Y98>f4)4XBEGda,A=6dI6C
VUeJG)#^8D)WBa(<1>1E15EFYG.&E44)8McVM5VJ,CZ#Z6;K7&de2+:IAA&>cS_B
LcN.J>WS?\5^+ESNdQ:0M0T+&df.DWd-E.\:/HN-K;3CK0Zdd/97TY\PcR0XNL;0
0A^T)C4EQ2K-F3e.AM:cgE6&6F<EPPTVFO^G(RV(bXM]M;M--#&B)S<]8RYTg[0@
a2N89gKQVc@OZQ#05D[JeX&HQe=XF(dNEc1R8^J:,8C\X+^4A\5QQZ4eP>W(?W#6
/6H[7F)cDG70VD,^Db4T:M3L?eBc<)U?bS=)AcF.BL88SD14)&(@RdV-&6OPe@g.
bcb#4cRJdJG)V;+EP9PM5R9TC+7>#<8.SVZQ]S9eXd90Y=RXG8\cAU>:1Og@Z@cG
;Zg&b/\d@MCB#F+-9,-0>U1-MgM5,G#Z>.&=,-TT9>=4[(OTO+_(5@3e9.#/Y6/L
]B+8a50_fAM7)\M1/L=(XC9G([G/ZFKF:9J57:W.\e]0#g0Kb:2(Q/^DLXH2K9b-
[9&KeS;[04GA=QQ&+O#_XBF?@DWP_&NRD8I0>WE2AHM&b8I0+R6<81E\0W2&UWBg
18T5TcV=K^?L)F=Wcf]PK03R3LZ_A#aM/V;:EXUbW^7D,F\&[PRV<PI5BY^&L+MU
5A/805L-C^.SMB:g<dC_dAWEIFY/WDEe;4)A<]eG;G0KD:5?<Jf9;>/G[7#9:CR2
]@E,d<Z+?70,FBNC4JYX6S22DS9ZgZC2Re=_<9M<5FGZ_4NPL&:]f_cL8S&28ecL
6]]_91Y#W=U>3T5(JMGV@Xe172L]Q84E48b@ZP[I>8;ILZ^,+7EE=C-DR6V-5a/P
aRLJZ<>M=I&2N20C]R-B]7fSR190]AC+]44;H2ZYSHb46?,372OB5^X21?)=Q]]6
6/GV3f8B:M&f8OHVGN-1W5@]d,X<SBX>MCd9_A+(I^IEM^^c;BPA,/J\WVGN]A8.
eUfRgNS)^EgDHVEI??W[f6:^Q+bOe^?cRNP1>S_I;9G[-5TN\g)@T<c4#D]aL#IN
HW</H@A-8D<A9M(^<9#MTL:HMR)M,b-IEH,0&R>>J=O,FRQIL:eQ<]VG1\NZS?c/
.95L;EUeOJXcH[LFZD0^Sg<85)L\)g<OL/g7?d+b+@\4QfS\(=Ra8f05/AFaJ)BD
41.?e@?XKd/EBH.XX&Da+<1F]L\1gUUV7-Cd&@A0#@VI^EHE+E0SLJb0Ga/R#)\,
0-9FJCKeSb1F;6IURGHS(YGPQ3[.;\WcF7gF3E^3c^H1N,ggBBf][Y4B3I([7SeY
&dg@0_b=Y4._CS7UL58eU.M9W:>+--da_P>JIa7b^fSeC),(GF7(^K:)?SJECK7/
0)cB(?a4;9Lb;AM\/.UYgd1B)YAJ\+A#6GcZD3[^PP,_:c)H<MQIdgN(,E^E^RR.
@]IMU0e3=)b4(@^;Q=IX2\RD#1\TAU>>-BNa\M4QXSPFg&V^.>=6^3fTWP.?:P:b
X+PI137\X?:5CV8=@4#RH/Ga8d=#Q:81dSAe:QT8>#=b@@^4P^eMI@\]JZDQIE#\
9@6]JB8/@4=O^:_SO6fNE)-[,S\-DbKba7^gcYUI2[Y#N9N+Kf)3K(Y[(<JI->3N
O^cH;P57>_US=bKc^Ja@]d/VUJL.&Be??V6Og7J;MDBJ0X9,]1>^Ed_Gd<6HEK8&
(2.(be=24SKF\CeGEI(.3ECeBF4Y6++]6PKJN<dY;Yf)SP&.RD8(G9NREaJ#3UJ&
]JQR/6Kb/0\9X[Q16ZE?,:Q7_.]EXd2W=_5-+YX47X9BOf.U)_<=g07Z)WQa&aN3
SR<f/eSMc<XSA7XWNV(/-:6F@N49Y1Z<)9:3YQZZ6MebfSW9-\75N7T(<KXS8Mdc
HGU>&.N;</?0HRITFPJOXI:9dQZ&@c_]R3c2^&A,IaML?P@a0g]&(geSO2Q.W<J9
)7@@):E#]QZ?Y3S1_..@5D8@1KcVHU5K:5e:N,QI^g)=b#.(EeF(>We65d.:bJ;2
6fN&T+49T704Y3VFO)DOT8F_c+WP@D74^VC:-TN\a>1Dac7JYbc&+B5J+)ONeUC:
RSRYReZ\0E8#;NW)Y,LeA3(1^bV6BX@0=g^IM4gD+9+L[FS((2II]WBT2cWM)>#-
aZaAM(9)+)9PWEec-0E]WPaD,X;=8_7#[LJ3+8K5PM068)-Jd-.FXC8^N+4g_5>B
K+F-_\eO8?ZU4HD:[@b+\a@dIJ;.P)<^HL_AM[[26+J8E438V_W\20=AEaI#M-[#
b.Qcc1AZI:O48K?+IY<>6@]dU,g-@fEHP@-1#\\V^+F<O7N+/>4RD8H^#TR(:W(L
<ZS0(U.=gQ/>N?b,+L<>XHOCNT0Y/V?H+R#M((S:?c5:d;INPG]&Rg4-.5[_Pa=d
U20@B>CK5O_[T\N;=K?RFgFN3@\L+?&/D:#6ET7EZN:Yc)6W+KLTbb3?Q#ESAO<I
/)2\_/dMAaMV@,70@(W+:Q7FOID]<N(PZ&KO^-gPPgE<5;G:J/d8)cPY(NcO#@,>
#g5FU1[D]LMa6(Wb^>).AEPZc=#<A(36fC7BC.HD#)MU^H3^;<\?RU#:NT7:HeZ)
>S-3)[1R=[8YK?W,O=1KM?5/-785)=YFH\<P>3b5QMFSRN:MD&1:W]ZYDZg-CK+@
#9Bb_MP_+M+[<81[:XYBMLSd.2@<86(_9+5-SdR@[#OU3SJ8G;>BB.gZZb&NHS77
U/bd5fS4G,]Ce?ZH9DV?74A#[b78dC+9;dP\OE=WL55E+N20UDQ<5>?E:OV-.ReS
1OI[7(C2A,\NX\+KE5N9=8?XO?UBYJBeAT[LQ[NPFST^#-9(2\>,a+RKeM&3c=D2
(?a@6Ga1dV4b4=7eWFZ+ZE#G^R^IJaWDe:1ANGO[NZ-S88?IRSZd[QdY]+#)K=DR
A,OJOf:N;8#+@b^KZI]AJ5R/RQ0JfG-2a_]RIGPEE2(ZL5/101fZC=+eY9[?URR#
(cIg+d-<PC-d;)=Kd75O2L0P-C_S^[5T1/#g\>;?]YLL<ZD9>P4)<KL1;@_^UP^N
L?G690R0NPbOX]9)6UY@5^-/YM:2[&8E+\Q7Q3fK8YVccXCMe;#gW0CS0;CY]9(C
\E-P8&J\A@A3LRfBc@6a(XO3[]]LDI\eIGa2FLSfcRe<AR>;-/L]80\dH2[AgDbC
=a)I(]BN6E++?c,&J,6P^J,9;T-L<C4\>)F08>?S-J;RHE_/\JHJ2](\9,gfF_F=
G?U:)9FIC/J)VCTHBZ6^(NOQaFT;:N5(/4(TQI>V1V_200K\)eO6^C&W2M-&#M(E
RGg]VOTM@</BPa40PU59Rd\YAQ-DRbN8d+QPI1Y65-&dG>[cZI\-X<a:\7(6If)C
RXT:F)4@GWD^C\9HERQESU9fPYU,XETJa1=V?AgI=_854HGdOfJH(<5c+4AY-4<T
ba)-0)PML/:,:\9aTK5UHfFLAZ_L&FH@V66A_/A9LH?IeI]Mf]122:KZLP[?fNfB
D^0YLM@gX1BI0.2^aBb]ZFTOQ<T3DK6+L\dOIX@#5+f](2<D2b2SM5IaCF6FUC\F
.X-F.(M[cY;4(a;+=:c.DL41ZJ21e:NNF]^3;?TAbaQ\PBKFd3]MJ09M=_gR)SDH
N__0cHI=3deY9Q6>]RU@9K:gKBR>TQ9BX97YTeZ=E,G9P\d,E;]fA3LYU7G.2\YV
[W.GH:8XaK25C]c9F@9]U9XU?cc05]KDSb&V/:]7U9&A;G35P25SJV1dRBcAfQ<L
E2T0N1W.8PM=eUF@9P&gB+8A1R_\RXINfP=<=Z<ab=0We&\:8c#4V@=^-()<QB,F
6]4V=:JL(Eb_Pd-.E>_RB6>4;+7)BZF?MQZ9VEL=,0^9+a36&CX#=1R\IT,3f3UU
Y5B(1@7@Y1LFLM3M6D&K]e:f0IE(Z?Jf+\-.U?]0^ScSL>DN#S/?#0A3M\7g7(R;
FY\L3^3fe(3/BX38d/K;W@KN^Nd1SVDd.G^/:&bEK?^36:4Y88BCEVUe@4H5,dgH
[\b16H\#\::_XGKC?AP;SdI7^G=>EA:EM-HX6_O+153#CQ2[@YgGQ>8&>EI[]Z2R
<@A?.OeQ,84DILEe99>]7e@^8[<-O#^:&eaUSBaRG+@a3c6(/76fGI0PTd5]:P-W
[BRTL=[>9>B1EdI5Z#bdDJ_?adg8)21>&,f<?UW&F[O8IcRUP;9P_/B;Z<6)_(W5
^O/T1d0L9^,E)=OfEKTH/1F[,?aYdY4L\W:LRIE3RdZ/\?b,2ND@?W77-21UZ_X4
4@ZfG3W?<JdT8]ZDB)GK?M5D_?RAMK4HS42cX29\@eM-I(NC<8(\#+\071+WOT7B
8(+^I)[W(AAX@;JZAJ2CNJ:<,)2SD(AUWI9W9g#>-/Y-/E=7gWII]^(UdT2_]f20
8#57>bN13J85@M2RLS)#[.^c+7@_fL&_3ARENZ5N4WO;66BcCbbF0_W6aHR7R;4M
3H<c#X3MdHYXCM/<4;MT[1[GW/?N)919_Q7G=f?=34F2T>&:Lb.#T@UA9-46VZMg
UZ&0__D?\N@g/^66Uf1^?R&PHeK-eL\^Qe#9STbY4g>-&E?Wa[9F.9eT:2F@=3Bb
@IeY2cGA0U5C/OSKK4=fV4JVDD.bM#7//-_dI?I1D_C(8=7.FOMC&^&])cQZ8eV=
5NCP;WRHLA23]c>UdX2_@)OgPP9\#GMJ;>@>,?[0KI/#@G#-VRU9ID<]7M_<2aB;
,g/aLX>b)B1?A]EC<aM1>GUdVSP/?9U^^TEFa1^WSe3YMcCI/62WB^B55ecVULAH
\_I7Mg8d\1&Q@.QK/8W2>:)8@VF^e[L.[c/??9?-BYWA8AU@X^.NNLRg9ebGTAL[
YMabDYD@c5?F_gN,Rg>/8U6)F#IXg&=N@N?gRJ#cG1YeVDYA?TY3X-dPXgEJ]]50
5AZIP;^7]\(:TFbUDV3>>N0B.CM^0b;?/ST>fZaO5P<_=570H:.3^TGGJd8DY9+5
d^OPZ_(^#UWVDG/4g]PM2V>bGYd=eE(SJWEEbL3@3\ZLfAI51:d+ZBcL+8;IDR.N
PWW7R^=;X5IQL;W1c5Ua85dc(M_WH(8B9&E,JKPS)\V/a^6AVJ\5&O.34/4S:G)G
g_5@@&ESbNAV\IXG;T.KB5Q[EX102H;8eD_+[ZBWW+Y)Z?C@Y.PO6;Y-7(J?KV8I
46_I_T)W-2&[35DMff_QLD^2@I-VgBB&O(>]A6OL#:Og6@HG<KE&KIRDD#HL5_O6
f9P6ZTg2-e?IVZ;@:dW:Z(SWBAd<5424:NW<R3T3bHJgTOg#J^#:.WN5X1TR=LO/
\b=@UO]M6&=2^BNcYX(?b@_bec>9&0A-1E,GHI[f/A6ET^1gXC)^(+-Te[8CJ)=5
AC<PDJ,e@1Wa7N;>U=O=.9@Q05<X),_eKdBG>IO(E6<XaANI.K#LMUN0@e6J4e\a
&<fabQf#S:^)c.^H;99EE)&U=;[Q(M3Ga1C/Jc0@<[eRXN+@Z;<Z/QbB3A3Q\fdI
ALJD)</WY?KKgZWGDCIGM7L+Tca<a7T,P)g#VZf,ef+LKXAeZNJ5V/d&D<+@N>Ye
&V<?YaOSPH1DW>3YDVfZ4E-)Ba4JV/[DZc(+^Q9OJNX/T)b&VHQPX40/GX&M5?KV
_<Q#0;GQX_C);PL4UUEJMeP_?W#@6;KW5+0U/7affCP:]Q6.]^KZ/1e.NQ:NI4D)
9JNDCOdK]dZG-WAD\7R<3:;)1G?ZP_=HNW]8JKcaE-\,13L;V<GC4Z5Qcfb2MVf]
(_0[M&[)9SV<7?#-NbfN.c(D)>3dfR1#F3.Tb\(R^_^?]8,bY==M)?LJTQ?_H]0c
#eC]KLg&3V4PM29OFVQAC//-20]SFA\S=4_;K[CH#3=KRLFL6G9FOAHg]d2@<I8/
_KHJf?E545D7W^8fBT+=Z.FbUYFe239g@301QL6XA9>4X;+35G7[.#==&R5.Y?^N
C,7M8PIJ1b/V>-;Ug02>(Kb&XV?KB]-<Cg3N=5DGG&:/)N;A)9,5[IPE.c2E.DM?
:cWGO:0EJW/N?Qd.70Vd<,H^59UQPf-X-WMT6;,]LCJV-(FQXI2M;G&?]>BbKJRb
.EJ;/\WJdR\(\TQLOW=N8=M:D1V5E6X.3JE85PM5(UI\dd\--(QE/Q]d1:=Ca(R,
8Y?<5,eSfWU/.A#2T6J/cOGRT/)f1W:S2/39]4d[b2Y09@I,\P4H/RYW6/(X(N50
Ja?O\U2\3aFU10?\9g:(3M,bDSXI+(=(A^P\6(4M[AYe[,3_CUR9-K-G.B.=gbAR
1&&9BKMHfT\Q.8?D#KYT0-K8b(gb85/V/S7Md+YHBPOGNIOc1MXb##EXDV14A=-&
=ET=#?G&2HeAGO[aA0\8H(;6-Nf>7CK4Lc2L^(6^7,X:g9,_ge?TR2)/](=/,JP#
KVUFd;#T,Q0a_V3.eaR&;#:KIP2<S[.;Y?TZ=?CDC)RC^Ea)8Od+R=;69=Z_B)G0
C0H(bT7O^DdYDR@5gX4Ef?5C6]cHPD1,;0][V7G5]()-.eFfbHYAP:1M]1bbPZL[
42N=c0MD0A>]6NS=]).9BJg3e(;GS32A]3+AbSH3_CfU2XadDf=O).b_A9Ne4--[
@-R8C_?PRI6Y.E-JB8\cQa(RS+c.?X.M2IVg(EE?^aB5I.(T:E@MDa8W6Kgb^ZE,
[NDgA4E2Gd^186RN3P0?P380?g3J=D.&=,-@]?\>AU2f(/Of#Fd)5&bE&.Y,WTUN
CdMT6<8=:\<4A@I4TN0?:0>VcKQB^IM-S-eR09[M2VEV/Jb9?78R#@S0;@,JAI)]
:\O5d_>&)]WEK\6KX@D+2HCSa1#DW#;X^C]W_1SVIH=A)GbW:LLU/WJNOR.;18e_
SgWJUgT7@#b:,&JfP=_d\6Ab])P.9c&KHMJGT9Z5cc_I4-M[C]GYbadO8^aOCBCF
UALg##D>O4F^3,a/?ES=E+e&_AJG8#H/X>N4B3Y/TP+/PP9&fa<<-OQL]ZUXRYAP
5bG3/S:JaM^1#H;^U:7g^C;fCIf-H(gA_AGa7Xg[=-_Y6/TfQH;J??&+^L-KU9;&
2W=S.;G=]2]f-NaQaFX;cEO/dMc48)O?-S4>)[B0?<d\0<#C/7>HB04G9OTOC\Q[
&).8_L)0;RH-D&CgbJ79T57N6;;J^&2Y&:#JC92MSf7IQ+&HUR\g9<;S^6CNMTa0
[UDD\[DFD@FKeXGTd_IK&ITVPP1KTSdYT_Kd@<4(aC8-Ua]/@U<cMZQEBGTR??N1
_aTAB9]B7:XD&bY4434]cbI^K:,-8J?05R4cQa3O=&U+ADfGK\S-JaSFJY5a\<Ob
MeEaR\VID8Y?/P=8O<N.9(&bd>W1?;8=]QPZ0J?,90CSF4<bLE+(GKESe=/L.A,@
dB\CTAaNB.6H2fL2_S[\FUBE(/eZGXf_UE(=M_]S63#Cd=<V<WBT01>B5ba+:\=\
FNGe@[6&Mc[Ab[O?6a,EVfB\e<UWD2=A_Bd9@C9g54fYGd=OJ(QQ_>PM[WA/V=>B
[H]RN;]R(DQZ+\O\2_,L9@2@.YRd)G/BK3M[CLB@93UKNN1X)O4V&W6-(7W8L-ON
AZ=@9DC7<?M5:B@::1)9@T,IW#6\1XHP_3KPNf7-TP>--/baU5aF_J^HWO4W[XW8
D.P@0N\WF>EACa<fWA4\Zc34N/+)L7AO<_1YUc2UNBJNJVH9OZ:RW00,[/#6SG-I
\>OFD\F=e_/6KO9)6K#_3@RV^(3fcG?:DA\YBaG4<:REHV8O[+&J=6^+04d&Q7MT
Zg/.5]=?5]f9D^A9]HO^,8Ff-R1.DeJ?PY/8D[U6TbAXgcaD?fV@J/a3F^G\BDOB
@XT(0:ScUg^>K4+\;c8Y8YTJDUf8=#XUQ7Q)3g2,R+R)c3a_RBWZ-R(+Z+QFbc]G
Z4WEJ)]/IMc3Rc,.JU[P-T<Q<eA=V8+8-).50<_9JP[abH99L#cX]6LXP^K[;36]
2L?5C3FgED..OFfPX](BNf.UC-7CK^HCX&-MQ0eKG2TI[]T#=Q/1eOB\MF:]UW8U
a1&Ocf>^HRg+B9G0\\)W=G)]7#U9AFcA8)P^A0\:7C7f+E8Q/,^D?3:]>Q[Z3@gT
SX:HNef[D.L0CM(g,EAP:XG5.D>UKQ/R-bQQLM<CH]+fMc.#4Sbf4P#V0f1Z6WO5
C#ec1NWFK#3H(8N(EHU]GE#Y&?=32H_g[fU8a^FA:.3/W)<c9IHU?eQ+1AU]/@ZF
\)8P:1Q<-]I(O<.K6aHgB2ZdF-4)NP,)44+WDKdHfE1\)/EP@dAGLcSOVce0_P>K
cf@P<UGQXWIB4f&]57b(I(PE@<[dCDXM#N&A9);NGBF;^fBIDWV50Q49Cc1:O(.\
);9T;ZO=aJ,&-^17_,+HR+K0YG@cARL3X<Z&IV;PSJ1fN2Q^@MbJ=KG>.HcUAWEI
8JAW-E42I3D,CaCL:AA+--&GAgV6(.5Mg++1MFL#)4K>YeGGM\M02V:.8g(X.952
8<E^bg2;b\_MgJG,/JB493YX4db.B?3\fA?UU.3VgV<4=:FbcH\1;N64-1f3]LD1
K#KXdbLSX.39D6M>Gc16XO0bL1g)XR8e6B3+Q;F]V?0KW=@SKY/WB^SYQ<gb_M+O
E^g89^W,=<[/QNU)N<EUB.;+Z),JRW?1:7+?f04(PdUHL(+MId2+N\ZZJYP>:+[5
=ZVN,(g<G]YFBTVfHY6W]b2-7dbgIZaDgP&fE-FG9];+(1O?#(9,EHUZF=?_CC:(
#>\PC:G4fXZf\EO_DM>e>dMPdaZF(G<QN>IYKA])1?HX\-/gZaFK^\>QV2-5UK94
]#@UeH7X+Hg;<L]Pc?V[N.MP7$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_IS25_AC_CONFIGURATION_SV
