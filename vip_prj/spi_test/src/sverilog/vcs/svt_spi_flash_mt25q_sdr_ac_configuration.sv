
`ifndef GUARD_SVT_SPI_FLASH_MT25Q_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT25Q_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT25Q device family in SDR mode.
 */
class svt_spi_flash_mt25q_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt25q_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt25q_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt25q_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt25q_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt25q_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt25q_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt25q_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
TGR:&8OB]RfGNL;HMFOCVb3)\g0;0S/>EGgW@H2f1]4+[85BES<V1)O]UY-CL4gO
^bW<?GPX4@4<9AIWQX1Rc^-9;7]U)]BJWXL2UZ&WO_)<0d&TLgJNWR4(]1U[:J,/
J24O5D]UKWG5HDX__/3b0+WUI47#OP1DWSEg9G_D)YQ1:[=BT2[_;TT9,aeeO).R
3?dIY:PO6O/WfP_-_,8>_(5B&aBNHf=G/XgM,B=\[(B)VLB+<,/UE&S?bZ2_1_(\
A:VY-A@K68HK6I-L5A9dHgXC,]_bb),X3a&M>2O)EFGEB&DS[5^Bd<]?I4KFVFZ0
_L4@^SCY_X\)#f@[OI;fc#Pc,9I>&Y<UWK8S7I(@_Td-&QV[[_P\K,T@TNCQ8\D<
_^gcBVQD-OPQd9W3CA0N8_T8Q7#aHgDf9.BB1G?-aRd@32,?[#9(+<6cF;7NY&HL
\790S1@K:02(e?cd.OC(>>YJg2/G?W&2[dV7N8/fa3P&dQC/gd;AZ<37Qf;]=b8a
LMb:-Y/#<(TEPSSO2N]53XbBWgVEe@@?/T?[ECK@+U?Y?YFT0VQ1>[D=dEX1;PfI
HG.(BWKe#+LbIa0-^P@TI9=H#5VVKPYa48Hg:/1[VeL5R;]#5SXAc]1S<f-YP\4M
Jg\,d_E_KWafcQ8E+#;1F4Q\\F^;9g+VRN2Af\MTf6.;1^TGQQ8[YX.eKG>TS@><
11[91>\#K.\IcA+X?OD-[68aRXU]UZ2W@UH?:QN;eD+E<[N@;@K]&838E14?>XeD
ASBJ0\M0VL25/](<9=M(+J8a5$
`endprotected


//vcs_vip_protect
`protected
899K&+P:9GO]-LPfBJE7P=\,LRN/\5^VA+NZ1FYY9,Wb3XEC3;^a&(^0J?@LKNU@
U=955?U[@XL/D(,3V1aaa6X#K>0-a8/E)^XM/S0[ZRd;KGcV#3_2JE2HO?7SW#A4
g&D+GO-E&a?00OOA0OJJ8S-_W=HW[N:)eRCK:eW+T:;GeB9Wb&K9d@)8I],@HHaQ
6D&Z57&S)5):5XS0e4CEZYN0VBN[_a:.\4YNP@2>Y@(:M.G1P((?M,F>U,W@6X5C
b&eI7-;ec@U@,\BO3@d;UT61bPM)<aL&CWc0&4[:.F/PUMSBK<TI+?/H(/S<0T_S
bYcQX_1:cK62,?[_IaGS?/[C#JJ79#)cH,/eD6=OCJN1FVf5WbbHREC2C?^0BXb9
\D=)?:)\6,8F37+bT:G(c=J)TQO(c]R>QHO_eG_E3>]g3]4-)7PW1Ta>aT@8a3M[
LXI-ZMWc8bW7NS:d<3TVR)W<dZRH]5RHbK(PW/fC.073.M#?)V7NM#\g@H^d_8>#
P.;6LH+#S03VU&IC3eG=.;>.WLQ6<cWN4/Q;YHPaeV&\.aca,38QNKcE][^TN#U:
5G&8>PYgJI\SZ=)f9<=bD#:cg<cWb(C\5ZD>YB>VfSEZV\FFCB:^VU?&=4CI)Y^K
#HNQ)MR/7-Ba/[>G/J->9-fO@deJ2#B63NRF50FDMSP8Df\@bQ^THDA4_ZZ>]GKY
OX,?7[dUVC2g4KFb38#V=2P.c.a]J?(>7H_M4=5-S#V]OR]L3(A?CF8J7WG4.3RF
IT.L78-8\D:RQNP_]F272/VXe^J:L5d#4JAGS9,NMF7G)X,?6R@0BC;)5E]7Rf:V
,7Ugg>+]>WR.TH@-94\#SAP[<BHcOCZ<3^#/:1<CWZF,J;RdK?UJ^PY?,X=QMDB#
@D>X64X#-Z0NI\9VO7e-;He3U&PfT7Y>7P>eBUB]:Xf4CDIK8-T[,QN/f3fW4\D0
&&0T<JKW-+33c9c_9IO8b-0Q;e<&EEI>38&V(6]2TLDK[&#;D1KQHTAV4V62-.Zd
+@d,HYPf:K_W(UYIPXZ4LFW9\>U6&MV;VecOB@]W_4FB9gX057,5e-a(&GIW),CS
&.d:(5<?c4S<VaZ8QO)U7BI0.^C1Hg<3)fXa5HK-,6/X[d.[KOI5OLd;#_I@AH=V
.6HMOO>3bNN^aE6I:RO8EZ-M6IU=\@@UFW[710U==ba0cR\0C]D93LE#S/\2AP[H
HL@&M(?EJ8UUO[)L\T17=;;J8#6<9QV(<Q2&f/^[_0TNS&L3J_N..g[bTE08&AE=
f,?16M0KbD8EV;bV)?[8;1Cg<D?@@P[G8HYT7>WU+-/OGKQY,^;</GO&<CFFRIF@
MQa>]aeQaaJ0I3aENPcPZ7WE&N0?5&<H6Q+BgZF,b.bGBCNJ=4b2&_D(a_X+VMb2
NX=CQ4f+H4bBN_LPYI&F9RDce@H8&;G)IC;3MG^d632BZHI\PJ^>F831P?23&.5<
Rde^bEa2N+4+UQ&\??)2I&dL?M4_+AZT:f,1KB5-:=;[51Dc7^cE<c=gBPWLb@eQ
g=JJ</DNZ/-I9A[\39.dWU=-^88_d[)cB5RHUD#:=2S-D>4U/PB:7Y[RI1fe(#HU
O+2551T[c^H72TQ_2VV;(g97O3<(]<9OC:Y[SE7XP>2-b:8=bWGADZSW2Z-(LP9e
L;04&2L7cD/?E1CTT&8U]\U>[?H,#SH6aO6Jg6b5]8I5\aB-=PW<S9N+d::&X0TN
(Q.^LR4dMQe9E\:AUB4I3=?YgOc_>.T_E\(b,]Z1Q]U^]ObTbMNPN.4PP?3TMfN>
PFX#R5a,_E^I^LAE\Y8N.DYaEe7,ea(?O=(./J^EA\Td_DRgfQB0eNE_K0Qg-[c[
]?;b[7L[M[4\5JR(;?PWAC6N9BJCJMJ0;^=9GR#[T4EF#B4&aVRg=QG4b=SbNO,A
QYH5ADUYA-GKNPb=5b65UG/?6Cfd\G[T&@<fI4SC>FL5];K9_VW.LP(-S[KEd2D3
M4Rfg#YBFG6>M==2NJ1_E70I,e?93<[5O@-&&\XJ5/OVJR=X@a9PHIS23WCg/H32
NA-L8B=<JW,.O[U632J4GeJ(LW/AGJ1:>?@I-P-+T-5JHQ3b_)W7cD1I[O5.4U?&
+eE42\N#c7?b?8MTP/AbJ7^:DgAXU.cSF)P-U1NJ(Z0][,[>3X51;AdSP=LPeJ/Z
.=V\UJCM?#dJBKK@O61BXPR(G?H=L])I@McP,TG_E;\_eI>),Q2VH&?1,++4Ud1_
?c(HSA#Q#W0F2D@YC=fbKd(L[13I+6J^f.Gc0SOG[HN=,J1^RQ(_R1&-;4<MKQ)L
=#W7UP@0IY=#>HHBB_YY)]U_CfNSUE1R^GAIYK4ZgQS^V]^NQH(:cYcPKWK7:ATZ
L^704XWH=0/UZ+.7HP>RWJ/(.7^#aH9aE&;R>5RS:<P>;<8C7W2d0BUd?0QfPLCY
C^[aQ#N&[ZS141?DW@YGX^1,L#Fc3DCR^\<F9H#eS?@/KV/KJOVK,/WUC93bMe6>
9RcdM=0A_=WJC+82EXc>O>BJAYQ&8Xf5#]M86[e<3_(R6Kb?8=[H^?160E<LHH\2
8NTHD/,H&O@fT#ZY_<ZDX2RF,e+;;SV/9(PEE,:)e>8<RF_QaN/X2g.GE8B+0Y0Q
YDeQ(;SXMAHBaJ<Q&6[MN_SgWbAe/3?a0@db3/J1TF/K_dIcR7]>-&\,B\NN(RZP
(K-G&@_JGMdeeWTb]^^&>?Gd],W_cNH6V3>d?&9\X=V(<5NQTA,@TFN6-/RTH(C<
<.de9:Z,L&<:W#CLDNGHPdWVJCRCg2T;;J(>4/]5EM59Xc/89QQBLZ=O;T]P8UB:
AK5)fO]E&J0AKe+8.1dMPSH#;]G47b3O1>5D&T(H#QFI07f=JMZG7.802^W.1^JT
J.eZ(1@]cU0ZSOOE[7fI9R_#Mag7>ER1f6JNdU;KOJQEP^Xd#5E&HQ29ZAN8[O-\
MfF>(W+.1AFQ.[3M<cOL-,H+S5C1_MZQWc:KP#ZP+aJGL9HbFg\@<:&fAe[&-3<U
NSDW)\;N9)R(Pa/5U9Tg6(U3CDWfJNL^AIMgfZAR/&\O)]1aD3]e[>;?9SPUC86U
B064ZE&2E^d=RAcH,XD84HD_EgVN4HD>#Me\f3=(Xf?2ARMbe_4G>/)LI568S,@B
X[aMS>B&KXd>D0c9bF9CR?g:FZH2P&IL61QDBYK10QJ)FaHEL6c27Jf9#SJ&)(Y=
[XHFXD<g+>::JVUOZ3OO3AXGdVe@Z:1#G[/E.=4BUP-LJ-M[c:7JNeaOB&XE(94]
/?&LF]3E;\H1KOg:(E;[O.K^[:3.1OgO14;VZdL;E=JJ(bXYLVH(MdT4YT8B(:/)
]R#)Y-@a+4Z,.=R8?LYY)IF#+bDPZP&Z..SAM)FFJD6f6MV)5a(PfKDBC1TcYO<O
M9eeVgZHDZ?7XA&105[#P<#b]\4P7c?f;_?__>;0F8gI/OLLKZF(2RQJd7F3UH5J
/S=0HHCN(_@/+HZ72J5FFJ;X_]_KD2Pga8W@e+@=><E(D=X8YMA3+W.[Y:?GO[.<
M-.U(MRd-T..AF()bW:^14_X0dBa><?2,TX.DYF^5^GX/1gS(/1?MM_fC]/)^B?/
f&]6S6-1OE4IV.LMe&gC\)_4QTTP#]<#6fAQAa5?0(16(3]2DT4H3E)FJ8:TRVVc
-JH9^5\RUdG<D-1S<ATXG4ZfL&B#IE#RQNR>2T_^]JD13)L]4_639WZ]?E+[LgO)
5YF+NVK+SRW^@(^OdFT7f7(PZ[-P_-58=@4:_F2MRgdQg@?.MILN(5-,17M)+QZA
HA[23a19;L313C8L2Qe.0<@=,^H=24efZU&5_BdJd^ZaTIV(M[]1.;N<EJI+4f2G
)3_L]5GIY6GG#P7/_GAR46?#:JM#eC:+>BZ_bC>a7f>-#/d7PHeN+1Y-3RcR;e-R
R0?+ABWH\U&M@:/[>\X9.-&:J<V4K@L6HC;;J.]M3+PL(.>f8g:R5EF]QS8(77@0
cAD,E,J,BW\8^N+@dK;)A]@?E4-/LW#VO[UcA-3b&/,X8D[PQJW&9fcAa87HW]Y@
fG=-RGV(WJZFZI.W8=4gdg+H72C+A&P&Cf>Z9+BK.O)YH1F1(f:<Xf<IHA;3RfP4
[Dg7f5eLaYA<=K)ZbI0QWY5cfHGWRNL:V4\5J.ZQHOT:]H?PJ5CS&,2WFB:S=g&-
S57Q+,FRF0(+c^:@3<JCEWU9@S<CEUB518dOcbKSIMJ0[/\^6?L/X^&&A58#eDFN
D<Y3EDRTD-N:49)K9C1>ZTJ_5_?_Mb#8G_g67:=TM6C),,KCe?^_PB@0?R3e]0&D
XX.QJ7OcKARdX)dJ0TD.5/HG-eF<U,37a,M;3EgHc@9-0e(/4dW9L/(^,[b._DgJ
Q,MgUVBVQN3d6ag&43APbe@SIS5C1EVPP?YT]?[;2D8F3:NT0/G.e;bV?M6eP1[?
C,6L,W.]YZb@TWgB5C0>;@-IW656W7LBTUEGKTZJEeN3ASf-GL39#-HCOB3M;TT&
?;A-=<J0N?Mf3H^;aAdKaa9>#@5KJ2RB10?O=<+C4Ja9;^YUdGD(d,3.60=Jc^F?
_VFX0UMGDcfN?@?^(Gd_::M3Q0bg:Qf5[f^4,>8=G]FfJ3<:S>C#X(L8Z-Q,;/Y6
-^d->T9JF^N:g=KIOH]BX#2>17TcK44=&BY45cO:)dZ8IB1JN;YC4@AEV4?g@F)L
CK=8,T/Y:_M)I>D.4FKS8;3MBOObK\^4A,);I-b1Y-9Y(U?-?7c(6JK63@RGWXH1
[M\#)P(^RK+^YW.CAI<S]Z?W_#;/@R]]J^.G987C;ZZ,CQCM,HHc3fV67&@WdZM#
H48Z<L_-VUO2^VW^K)A@RY:0.+KSD<&[5UgTE7;N.OLDEM2WdIc<0^f[\2_+U-4U
<Qf>(<+?G>T\-2R,CI[;3&Cc&:T9?A.#XHS0eR>^EOa/aHRf@?,?;59=7&J8YXT@
UEg_T)=M<N?:NQ#7&J^a]HU;Eb@+R-(_L>D>D+DDMK]9G5;dfS]^dF#;L:?V/@8K
8<bQ\4,eE1F1@Gd?)IIZ.XBNQB]44Y^X.ERO(H71B&@SQ3C:BKAEF[?N8HM.1S:3
LK7_=&(2SPL@c4O;UD1+5:S3;Tg[K4>8V/&>>T#SUESH,\Gf:MU&ANY&f)+<,ZRU
]INNY1+^FMVa;?XfM\+:>=+6_f@4&O;8)c=;S=gQ_ZTYSB4E2fSB9DGM>fd:O>NV
#-CYHf4F_SV(J,S)A0>Ce^c1\5HDZ&a3_M2,D[Y8:>B5g?8&g&R[fTXGYb]^bV=.
J4>Pg<4IY/2&XN5)Bf^7N-,IPBT2\<fRKJF?\(.A#O<Z\]]g7IBVK<GK&1LB_V.e
N2R-f=Q/af=c6D,DR=ePY;B#]39NcU50\X<]bfX5;R?2U0PLHGbOTFVPg<<MbbE3
9=7/KREECCQ6eO?430PYYg)#M^-DTAA0\geMdB\.TTC[>P,QL@RIC[GT<UaWT+_9
BNEC3W5E(B8-5YVGMK.@:8V)A]gV9OS6QDYf?BXHQLS(6+[B=g8U<T[1<X2e2&4(
Y?QeC@fF6(FgI9QBb5M/;_7-U2MG+)KZ36#:#B(#JcY0dH0/Q9+bQJMGD^ZD4?A_
7;<bMfP3d)gGC^#ATGLQXRIS(3[D6>,Z+Jf[-0Kc7-_BPM[R7M,fK[eXdd36gD@(
U,fJWA1+/<+LP0()BbXL-5VW?+:L_)@R3EW<.>X9^5V;Od:TV;:;Bg8DLf).F.),
F4JOe8GIV-YESLO-,?Qe@HW4WGa&5MF38@f7#WEfMJNB4;^G87^(5_99/&873F8:
Ed?CY1\c?&U?\:^e/P8O+:K2-2Jc[-:/b-6dDd,Y,Vd]F\Adg<.I;6g3XK67g_X4
7?&@TPXBL&6W#a.4^+6LKY/1?e6,/QW3RW6-@(IbG4:O@+8fXMAG++G+Od-YMbAI
LM--Q]0c?]<&]gNWJ=)U=T;d[#0;L8?eUOW,U+CZ3-;&.Q:?c-0EgA0g>(eS(+H(
8fMTG98#2+);5@=IeV.TFO044f)eL]fdJ<LH>,/c:LY[QO)fWU^;-,f7BAW4[^GI
V,fO-IaJ3cXX=>FNJ]6IEV2VJ^IR=VAL/Tb009RW9YC3C.M;eTe),TNUIGPJ#LdD
DO\gDWF+4_4N6Wg&-GVaOT]-fgeFO=PNE\cQS(cUPZ+WaZc]Pb+MF92[358P6(2G
HR:H2U[I+1X3HLeDV_2<6U^R\fQTH;X)b)+\:]VXJA;CAdd3J=cA:WQJ@#MFV1])
7KVLC<H?\<6BGDLG3?(NAa&c(gZ@a#UKe;;I[WAI=:AXMKY,gAEPf80FIa31gM@[
A#VJB9=a\8b[:7HFa8[7W+:#9P;E+==SgCT5OH<N6#[I]3W8J9^791&8A>J1^OOL
a,85[c8HF)d=UN92cPQM7gFdUV_FbL2<>2/Q.-CJa;^C]OYcHV/<HKa]\C3cee0/
FZ.fO<VbW6WRC(bY\_ND1H+?8O]JX\)/.=-EI4a?F78UTB;)_cSJ&+fC?PV_Oc<E
;LU/MTL^9ZBA1E0ED&JV7)-9;N(>L,63D1?W:E^@V+)J0dFZ2A^bAb3W12T?[2O7
ef/JFE5,LA=]cPR:\9,/6?Lbe3b]]1HEFTVB25e@8a-A(7(\O19=XJ=G2.RIOMW?
fb1Z\L(9U;E\WZZR:>W>_>.TE:+^D^-,:S=4\J:1a7?.\K7^6fc@,JJ@,18]^X:4
NOECL,I:GIE26K/8_O)S0JcMC+d=c#3.U2&9)\0.RH_7d?bOEG1]81-K3,f7cfDf
dE^W/2J/fU&U\KWdK4T2eMBQNYa]2-(#&?a]VP7SPH-af/,=.QbV(W-\=E=,gH0M
6)=.5N>caR&>.@)POV68:g(e66]XRS2V^FX-])S-ZaPKN65,OOd][3fP1[4PGU<H
Ta.&<L3M[<fBG&;Y:4,2M_SFg2GDbF:T_(\SPI]adFL+5F]#^[]3dcd[.N#S(WLf
8PJU1#6FCPIK\7O/?:K;bF1UF7>R@bWaY12R3BI<E1dW>_VZ[gd1)5gK)>@6988:
:GNR+&:@UcQYbFcF&-YP2ZPRD<GOQJZWa0IRYe=/_&HE^6c,6/N5aWB?[c7GV:)=
X]?P44.G_NOS-(5O-9@f-R4K3ZRFAdX:IAL0?-M71F_II2>_PI8dDMQ)Q,[_Ge^[
dUV\.e?VC#U56;S60MHINJIA601YcAR7#D_e\7fLQdXKV7R@F&SXE=5L#A?DaHE8
-L5T3#VYP;XW>d1.VX/Z_3)F0+Y8g2fG3#_[G,)63AL(<3#[E<:3_M=0=4;:VNEI
c9.[fE\SOWe]PgAFV-HEJ#-1G3L4XHG:=4F)&2+P-OHO&U>??V/L+I#cEG;/>OP7
a^5/1bF675L7EB\dOffTSBbSaH)/?cCJ[3GK;J?-d99ZX6fIZe-\/RF^K6J:_OH9
]W5H5.B;cU/\D3\JMBYgCdP?:K1[6B(GK.D<T./YR>5d=O?/bcQP1>0\U+B88Z1X
,_M24Q)4I,<B6OD912_8,TLBGX6bC?-C180:GK/?;>5>cT&<;GJ_7;QC,g8B+9VU
B0./SHGP-4=#YIVIW\=DC09<RE3GZFN]1YYg?)GP#0B^&LLZ(TXLH[+8aQH4:[a1
K&57^P6<d@U/7YPdbQdR6VZ0CD1e8e?P3_D_30,gXGge;a0(G(cFM+T>5\PU5PH,
[DLd[1c0VOL6=67+#>J6+6?dF[6;;T>XFR/8deTXWMI\Q3[Se7=ScSZfg8U<1K::
561=\8VfZbP;3W[:aD,=[QgU=1/3e)W#-d[Q=+f7>U=EYPHGK24_.C3\8<:[Yda]
SX\T@<4c72IU+&aD?9g][V0HIY-(FQfNRa7Z:R:JHS#KS=O7EOU7GKB6W8>GH2FY
85:D8C(f:=6QIRZ@/g/MV2^8I^#OLVa/PE/<C@f/[UVYTFbc6W2-A0Ta^<WY8\Y=
VAa#P)-OgX1I>@ZRJ)S?gAbcL&3>#?IDK=fdRUH+dV^_McfH[=P6[W3d),LCI4Nd
[\3MP=f<7cWA;12cG[9JPT[YV4OU.dc0MS@T.a<0a(3;0=ED1@GK7.&a1]N/,>L]
6@T5Iee_bKB00,>8_fbR5;JZGg72_ZC5cB0MOb[7^,O@_dAYL#/RJBF#O]Nfg80C
@=_;0^T/7OIM&>6+(+QBES6.)HabQ4RK4J)QXQe_?SC&#c-a;4G;[C7dB/;P47U7
P.5,[N1G>TMDXC6Ufd.BE>GY\N>I\1TMC1f16a6HS5\?DF1c-U(S7S9cgM2@V;B7
[9a=EF;<U5Ug>0Se]:&7;H1eff8R19a1I-J:K91-f2I(:5eGgW,@M@P2=H.Rd,[J
3Qd2AW]NCK@7?_FUbT@R9P8_.CKEQ6&eO^R6F@Y7T>9O..b?3P&Xg&_b13690fG?
/VGVHQVgY#Nc[P?4IAcG3LX8\-@I2P(/YATc81=REf)K7PXJ?Bd-(]?S<B.KgOFK
XOfZf[eRe9b_?=X1B>&AVbQaH#5-+V]+9UYgW,4?3cG&7PHW9[db/SC@a\XBJae/
e8SWF6^4eKZA_VFJI&Q/FC\MBdZ3(#DaKOKFL)&<Te2R-K/[EGG>AgUE_@CP.O28
7:I1QAEH@/\7a=@S(<RKTRIg2_c5Re[:aU-1^4Gd:NY0BR?#7;R._ECB>/XNbbL#
9U5HWb[4\37SIQBA=b,V8.M>AYV:J05SZV95\VZB-@QTSd/)dZA&^aD[8L@#:FIT
+Q:8(:IG&FT9L;-\YeSWWPA:dI[)Y5G2)#?gUfR^8FC[5?Fc8J1K.JKY^CL9:2Y]
a?Od)=+d&GR2NVP3[^U;>Fb6VX<9_:;\AIFQ1R/M^\eMW+E-@9E-OY&&1B3gLWWe
KUFSVPRQbT51#\6Pf0M1N8]@[I,I@?RH1YQAS9_8F6Q79&Kd3a)W+9eN&ZZE:HOA
;E/6]WEK(>6^:VaVSLBZ1I-HY\O:4N[&JJ_CS/\4G;_S+_R>>TgRDAM<HFb,adWJ
(:b;87Gd&V(K</VSQc8WeG1\eN)H9E:AgQZfJ+\^97Z?I]&<GL>DPSWSf5P-O.]E
7cJK>TQ\H]]WXOZDT8#@6)XE/d&(ZaWBH5cJJGJ24[.-FO[XTBF^/T2A2DA6_a)+
F1>[Bc7J&JC>JUD,][;5OFSe5+1J^8_e^a8B6.gVK<<RHP7?N8Q29N,;gfUY52<;
_Gc1bU+cb5aM(#0MV7]2WO273(K)CdL+S[<:Cd8gc.RDM\P=V;@NWTY8aR()P2,<
C_O>&d2#)b1GP;;,D<6g:V2dZLBGbU1\R#)8(FJCL#O^K7]gKa353eU)XK_]3,Zf
HGTCDIS6K2]M-BYT=^[;BL_19g)@2:V/6I=3-,c(4N67A;L3=1>-&g/3H4^Q>MP9
CZ50CQfT7V?,8@B-KQE8I1UPFA@?HJ97L8R)fee.fQ^+A^bJ9@5CZK0[55EQSUJF
QWgMI168eN(^_:a6IeEKJ]K5Zbd6K?6;^GSV)/@RBTGOHcN9CA6e81P4g:?+E+@N
WL(cX;(?2L_)FY/DO\XgAU;=g:H-OPg^=6D92fP+D3fQ_bU[5QT(3fCb(\::U08@
9PI4H^I]af9HI)2HEd0Hd);a>g-f(N@2:P;WA8(Xa,US4N)Ig)?gJ.:b.fVOI3Zc
UY8>AK(:4Q=0/5U?[]0N9T/Bg+K5]-&ZL-fQPLffO>5JT,^>_eaM=0=_B8@J)-;J
5MJR/F)8:OZ/E7f5<)1L,,#7[gX+e]B#aR9AX>)8;5F/5H0;X^,eR:73[<ZEV6F_
QcCK-N0XMW8#.[:;=?DET8BKYV,[C7/aIVNA2RCOfe0CUf+3IM76AfW4TDA^_]U]
X<\#5S(4bO,K9?Q1UH>a?FH+PKbO(X.RfGUd@W;^J<=+]2^@#B\Faf;dRU0?RSHA
cM=AJB)M.gKZ7>_R&RRce]WbWBLHfOY8?S6fPdS]-+cc#2K7P5X+Z9LRT/b-W#6C
d[PGQd:;I8A8;C.5]8.e][R#BDc,FU-dNABJMScF;2U#@]Ad\2f3YP_#]8O?YYK,
SZfZX<FDb\.&GWO?QfAX+=QINMWGM->fVAFFC\0fH+K#bd+N2OVW/>JacYcML;.B
TEED0<(A#cZ8SD9P=cb,3XTJ&<BQDH5NAK(_0)/34J116Td9a7<eD#GH&[E(:;1E
)[N61E.SbVc\e0eT+Z=1A<>YWE=^77Yf/CAXIc:ZBN2\?+^3IAc>(WU,52Zd=GZV
EDN@6)Yd9]W,LL037U1LA+]f=0I9cc1G6Ub+7Q9_=UfcHZ-/<YU5_ae#@904g<IS
-b6g;T?6&N#S^O_0P328Q>\;SV0;.fG#3].GeNCe8@;C0b0Vf-J[)DN@7MEDacCO
=&YLb8HN,83T=1KdA^JP9G+CdJeN&#eN.,(UNdKU-E&W/&Y_N+M1OI)29dZFcZFf
46U3KU?]&(./-22-L[&JA7+;6-IT>P]JSa4S=#1b,Y;=-EE;^[VPU&HDUd6Gc_=Y
NTT/FWB@CI:D2]d1QK2;3Vfe&P&8LbbY/&]GH6]003Vc;fP#H.BdO4IKY318,f(7
9#7I_cfXGMHKX.\HNG)1.cfHQNCKa@eP<A6gd6-?9CIM+d08L@N^He,9X-DBc<gg
BQ2aVQFH_:#L(_Reg>JDB2TgI;@e,CX)1JI0\9\.MQOB-L@SS4^N6(aS(-)NSUf0
39gQ)445eDL:IKHG=#1g2b6>9D09,VBR?LfLAW5YIL&]S:g3YaNb=<9KB;OgJQ4e
E;44S=7Q7&:[8JY_^M:fd18=f+>7/f#Z6B8e.^:.)F>55W\?KVaOJ=MQBBRLRG1R
N]0:eaGZD0d60ZPW.)2fHU9J9X+4D6WMa5OQ/8#9NHQ;F:QE1;\;c8;T)]eNWV4;
1VGV)O-WMb2UA#A(S5M3aaC#N@g@:>JMV,M&cHEaHAMEOd0IN]C>cWI\1Z84SbII
76-7IV,837G_+B,__CU9\f13[bU98#M([DEA?@V(5:N7/aE&,J3QTD>#de.:K5Nc
#;e_dO0Da,]PaeH-PJ3](d07:.ZSN)@b7XP13^4&2J<8)YK,RgVH484U-/F44I(7
Z+?fN(6Q,@>/O?J_J[UA0<I=O-a?AT=SA(:IQCbT1g9f?SE&gW2?4VBB:6>=0Wad
L?J.b6=@=cFSPRSC<1HGD_3/9Z7H5HH>#XgF?.HS3KIV0gWN\0MSg:ILD+.[1^]@
GIS4X:8(gB14AQLX6S<1E?J++g_Dg1dZUL(M]H<>]Sffg.aC-e--SN9V&e)9;-U;
c(>^cF:MN,O)<MCQUHQ<DN\Kf/>b\e[>C:0Z,g]g+;03NB@/)G6U3VZ88^gMDE3b
Xc3\Hb0?L-WR=44:C\<7L(66]QcG>5@_8@F(Yd<fS=V=>Hb4WIZ]N,6.@PUXYXL7
@2#b[SIeD<LD+;6/#NLE/b\K//W@f#4&<e4Ld[?+XN@&Ja)TR2I>3G47b+4[;YUO
)^L6^MaLA3I-=392eZ^g)JaCP#\5SD]IeKQ;6PS]Va2,L.Ed8+,1/LOT3_EVY(X=
(A[-J2A51<1::\2bAS1;43^eYJL)N^8J9^PE5YNP;ZK+&bO=K0(g^KRbd>-73f;#
VF3P/Eg#>d:SeK6V73)YJ22+HZL;00,;9L_YSA5#2]QUfFA^Z89,UQB&_[f4;cR>
c&X0-?c.HeAZ,S=)D[W^ENHcZ:aKAB]D<5W6bUJ)MQBZG-UT^UXH]RWdMB](QI#f
?:/A<5XcLYM31/.FRR+RCEHVG&b@7\00NAcb:6&c4D6ID:T(5Q]_L)N(<IT?e-7H
-d,LBfG8NSc?;a;Z1P2/5b75<J6OQO\L&EG9=LLY;bQVgIY5W0dZaIQe(IDY<OF3
MH\C1a4GSR.U@+SWXL-8?f>KdN&/dIS-:f+ANPLMf?J6<e@4LQH7a-5YJ#Z8^8J(
KDWf]8\dB;-8QG8bB+DH>,W(;;\WDbY/dY@TA:+H5beTgf;C=Zg\c_V6_V=K(-6#
<BIB)>[Eb_6+:/T/L,3IP1PMe\O#D#Ae+\N?_RTKH6\W13(IPX9b5_:[eB@/LaKR
QPQD3L/+7]&Y7O>DX;L\8P?L\(J>T9QQAXZ/Te;7J][UDJ#>A=J2M2RDXc419aCe
77(e&QR;SHQ9)58E9D;3a8##VC1Q7CNE7ge:D8Q,gJ/Te?_L))Wb/@5fA=/IY<_W
@VV0dcI_XgHGFJ,1M2O&8FINK087b/STCEYIcY#O[N.^^<6RO#dTW5&ON?2AQ<WH
>SU-Z^T/TBNSKCKee0#,.M90>B_@/g]UM^A5/_O<^W/1@I#>YN3<>\)#S(YDR+-c
4=OMB<1N^Xa:ZUfT62<NKd++87&UT,#U#<2>2YT3EG+G^e8ece\YKSAE_UV^gYB(
IA[]0.1Te_+-gC_&B+>F@Wg]@G24S_NF9FOG/H6;VRJRK,&_6&MY1?fJ;=)Pbf/Y
[U=>F\UDaII#8^IbYY@S91@b-L/KL\1Af2dBPG=g./L<cY;H[X6]EUW_XI-+bTdJ
EYJC&)<N=V2I?(A[29YLLgJM<_5R.7H9Q5T(AOK?OSDHJYg0c1KY8XW2d9#8>?FG
dIXNd]IS8FO1BJ\50&9P[ZN-B5ITgH2J:[[S-AaHA3@H?#X(e<L2C#7JS^/C<@;T
?IcF=60JFF-K^6,_Yb+a?Y2gO)0.APPUV+YFULG70WNS^+#GXQbZUY60OCaM6SRE
:&#2c+NI9R&EY[2#3<,#<-D;REA:I2^/e_OTY[0+aQJN6RdDGbTcdCM=d,F>OTTR
7fX?ZJE3<46NP+O8-U/7#c6eIfA@3HGK#O0^-83.V,:XT7)^+W=KYLV4<HdU)d)T
U>BWZ^gMNXb/3[B9?@NA.BS@R=K--Y/#L\L/]+d_U25dOa(aE:NCR6:d5K\Y&8eY
&YJ,>TgEJ5#3<]R_YKfYS80?P-QgE&SY:_VC5Yc(S7.)Y)36+))2)c]YRAfY_5VH
Q(;LK1c0W;TAJbD@TQ+K@]a06)UQ\Z9L\fV\a6D(.eNXJ(J/7>\U?bK0LQU7?G^N
N.2#(;3g/81XEZ:L6)-+c7#=JTY.X0:eQS4..NCcP@AB0De9LP60SMO_4&E)?HY6
V_AN]Z;5SHH)Zf+=O(b4BLXT7,aGPgJeeC:d/G5U?^e4[PfRO-.D8b#N(Ad2W37J
3>X;SF<dd]79+6V&6[Ae;FdJ9+GQ,=1=YdJ-BEZW87<3-9M.@IXKJP7O&-W+XLK+
OQ=M_L0bb]QUgW@=#>Q>B=Q^1[1QO++8#6QQB;V0dd3<;YDYd:8KG/GSXT9J\T-=
I-_<9RJbQ\^R37DZ[Z>-QOOC7,-AY/P.NRYQHATZY7=M16/S#&[C&PVe0_2#[>8^
P^0PgVWH-[905-AFM5[e7WRfge#2AdAZ3LgUGNE)C>+GKY5Uf<C[#_T=;LZ0Rd2&
6<UD]JI\Uc9W0AVRaH8E643OGOLMdFX0ETE1-8c#5,8A5\1Ze_K?J//-&#2:WV1I
NdPVb\gfd/V,Y?,2_WCG4\aa(+FGT,0>C9>=\+I8G+YW;3=3VBCd)D)-F?dNA;N0
\=<<B47,,d+J^H-aZH8]P]V\PD2J(VU6YWA=YH?cGZ8+?Ca#g&@^,WRR_-B&3>IJ
/U0S-e+HDY)/f[DHZW3=-U.a9KV/b]ER@Y.gIIF8?I_S>53e\ODGXT_RG,D0d=2U
(NggbSJS,ZW,(YWP&?0^(f3B^X17E_-\\30[T6C52;NU,gVgbHcX@ZZ[=9+G((8@
&a6N2)T-b_1O&-E@GN9J3[K73ZB;2AdDaA#UXNPfHZceMf8L31C5>8IFFI1&2_fK
D.gGUMPP^^9O-;Td-c>G\EA&+WbHQ2V9b=H9b;KKg-9,+>6Hc4?HOgI]dEg-eGX_
?TS]9DJJO0Z(Qf_/2dK\UcTA42NdZ04(-Za45V>J>F@2SeD049RDH4^L(4T9>Z-(
]#.:D[&Hec1X;cfY<a_J:W7C)NaCT=@^aI8G.W#:PXN<G_I\]g\dE74)420]OS-)
@-Ud#^VcK8-MCG7LE1?WWW7B_86S^L\3f;66B@Z/=SAQVg/E1f@J^eHeSH3;IV3B
L-bJeL2,H=[PA>6=G?YT7=dJ,Vd8E,)WI,_&B+f<<Qdd?e6BfGBSMV58b7@@H:aC
@;1==Dg?=)\CZG,GQ9bIGT&ZN9AD]I3A4LT]VQ#1_@=e#<31DJJ_O@+U]X287cU9
O)35UPKABIY^gUeR]C-73(WM)aVR+f?B1XQ(gPWN<RPI4O[^2XR&6A1I@HPUYTU@
,=4SB5<)d7Q(7/L456dB0RF;,[&)ZLJdOUAW=TDKKH/g;b_e[Z90aX6.A+_UR]D5
P&L#@X:),/eS[=->6a#c)b\QE>Ue(KF9F8,ddG+V=-U2G:G3T[3Y1)5G@a>Q-=25
0ON[Re?a9c7[E8_TZC)[7;FaN,XH9:^XNQ_cI_AQ^IDKALW5/>84IfaD#5?-40@+
?GJZcS,>)b6;>SLIYP8][d=baWK9489SFO(10OE,>LV;V&(gfT;84<R?LC@P.?f8
L\bI)M,4LV4Fb&Z;<DXCAGCL0#6XX2+8EDJ8Nc-P>3L:JC;+d3CR=F,90faG2CPA
73/_X,5#TV_2BCX(H.N;(J]Q0X47HBTdGVQbXS]aaQOF7NX#QK7^cWGMM2JL^cXd
0g5b/b,L6,bCcB47\#(;C,QFR)U/c+?LK/Q90SD)E:^@O+[7cWAT_fR3L0MTP9f1
\3X+gF@^FC;fMa(N<\Y#]S4ce]KK>2+L)5cbHLAHB<d:<NE-WH>eI]1#]^W1UESP
>A?9c>5O&Vdbe;K[.D[.@V^+&6_.05)g3daR/Y;>YFW=a\+5R&](b^5,#bGfCdG(
,)S/B;V3P.JeeZW(\]f[eNEZ5BMg;S)7+>MKRR[1B@ddKODO0?P)95O^(IHDYHS-
KPb:bT=7NE;+A5bC(:Vc5,1@8[60]09H=760<9FZ#9:7C[,JA)9#g-GL5:E5SA,)
D)0Fc)F<+86&0cYDROEd>0RT>T<E+#1II)LU_MB/\=TBX3dZ.)>M81Mg^8Ca/3KY
&9(5]<YMQ\]g<XJ1T(PU60ea+[3/0XZ8aab8&a3f<QCET5@9BU2D_gP#@S,KSD.?
\CXSR,#G2&\@[O67W()A_N43E5/HBac1_OK#OQ?MGH.1[8g,TT<T;#bYQ=G1@-[3
TVI4/L]Y,(FOW.g/Td-9d,P\MCZ1302NM506fd,9Tb4KW(/S9;#1V3:f-Y45PAC9
gL5S//Z9>fe@)f_0:T]e9ACW1,<Bb/@bcF)Y4c=gK2LDAV-1KVVN0WFU+a/590d&
^VI)SIY=OON](<4]I>>4CMHO=-XY@R+)gL(Q>W57Z#e/e;K?^<]Te@G]H#)=2:S@
:PI:,b;f_W)V-5YU4(b&R?3abFUL3WDAV=DHa=.51W])If6_=QI_Ye.&cXKbdT>Z
/:?XN:Lg8^d8.O9&gaM(:8La,(7([7]gSF[1eEbL>[VIeKKT,^e>WMgP9[(#O8BV
H;O+/_JAUY8/,2Cc?[_HCb@AT\TOV\IA<3SHXIegRI[^O]Y#WBQVggeUeEG#Kd.[
NNQ[L+gcKEZE?S70R2R;BQ5afTHU@8IA8-82@Wb6A46:5IYceI4AGBDF>_?PZI\&
Bg?TM7CO]##bJIZ-)6:)(ZTV33+;H?&L[KR-X0OCGBWXF.KH;C6\4RW70KBPe\Lf
^OPdJ^Yf3(4+))?J[M<9OcgEL^^)Ufe+AI5fD/A^J+2H#EU;2e#=,T[\J;I+JGc[
15DCZ]G<\@OV5N44FXSL<-BXQOT?=O1_1W/ATA=H8]cG34H2<@U=343-_Xfe,WE.
+_f11#]S=+1,f[Q^;J?/1NKU@80\e:57^F+KgKYVJQ9.ObE\]VW8A2&EE7T&d<R)
&XdU<f<).,99?4PI\YJFL/L[.Ka>N=XCVN[G:;We)WW1H8BEYL\,U;FFQFJY#R2@
8+X&K@L08Ca69^[;<9BHFTVa;BOJFegd+]E@<-@<GRH8@S5-\EKbZ@,=Z2Nf5@TF
DN]?c^&&P?ZW8)C-[W/L@WB103Zb74)Oc[>EBYDO]Q+N_++H9@e:E?Ra=KX(OD62
?Z@RYc9I6VA>Z)Sab@8<K9d[.RXM4E#9,IUgCIODc:0@N\1A0ODJ;RPKeE:IHg/.
R7e2_U]^.U9;X4SSB_G(9c-.A,Hc5aEH+\]UM\(KQZQ^3+B8CfW<6;.Ld.3Y+/FU
BXCb<<Y8S+L(#X9]S[d1UeU&@DgS<9G>&LKQQ4UFKZI\/W;,:QVg#TT8a4T?;Dd&
KE:dcN.NV=5R2U3@3--EP]=>Oe/2\=MRBcV2[494\Jd;=Z=\5MN5<P77]Kb_<21Z
KbBAf=VX[,[K5f6@EBA@1/)g),P+B7@O_4_4Uf@I6a@9R@RC+HRZ?Ag+(?=[+OW3
UXcUXFP##4K3#:K@LP9&WZE,;?<fCMCR?-AD1J.OM#cYgQgOKc>JRY0eI#_f=RdQ
7#D.;QZ\ZS7bN8IdM:4JC9@6(,773EZLTP#79W?eP:U[c8)S1NHRTGdJcE&\.5=;
?O4G1HRY(7&6aJLJ&,:#V[JJ(XJEXA^,Q_+81)Rg:4X1H=-cU60>IP><NT3)29RB
cN_PJU5@<?8/Pg;\?EF+X-dMYD@3?#[ag2/MMN;W06P;ee,b+gE.+HOGW@2d)A3d
\,4Yc0V_9@IF=:>5;5^aEHZ[L-E)Ta:HXLNLS>VLc>6-9gV)ZKX>ZZ1+1Z_ST38=
#SJLE\8<#)<3<85e&J&XC8E1.eBS.ELX-gKI&LR>JE/-WE9DX\@5NC1/gD6B9;g+
f;[4WJEfC1H-dc,gS11_g6TUW\F6H&g6Q3GaNRXD1Y06/@6PM1PWaO19+XPV8HR:
,]d8d^].I6A8PLe^>OSBVN8DUQUGQJ:_E@8e&[QE\/CdWL[TQWJc<U?.YEX;N58^
_N7BS3(-<;?]M&MQ:)1WT6G]Mg),<ba1Vc-)^[=\=JR]11F-RS7ZKWe(DM89.=ED
Bf.3>8?5(YN&L[VKRXK3/OYf4K@A.>&cJ(RK#\C9/#CaS0cVPYQ17CUNAUTTZP\c
QD_5[9;XdH@W&SNb)JVDOH[)2X-HT&gO&1:E&?:,#7g-VZ-Eb5L(@T0_ge,K=BZI
Wb2b2Va4DJY9#=F>CR8WKROG;70)8Cg#NB[\f#dW>WPS#7)DD-;HeUDgNL(3H^KN
3LDPaB,E1ST6B/@.]+O[U)eaA93A,FTC>GTV:;O;eHS>X5U?fTFa.++C1cJf@^:e
QNO/T:]D0&4J_3Gg>TKR&HAPR^J;=MK+QD#R1<b=V,81Ea7Ag[+-Ug]XC\/P/BTS
>8+7BX6gbc1,fI\OFK-f79-[6fV(b&0g?JebO;(/245VN+<-H.3J=aJ9MfL>O:BU
^S>\NS#&e[1WeHY<^=dV.(Db5feLHg=A[9De\HL::QKEQb+-7)]TI\K3):C5F[9]
>CbLS74H#NG5TaS=7Z=8.VbWd(UT\5F^]eg&KVPE2].K.Dc^g1O(aY&OP7Y8.TS8
[ZSZdffP-g,LL++:>;ffPNM+=]V\9^gP.J0Jge;e3Q1[<51fY:W4.N(UfgeKX<@R
PCL#<EeW+CQ:AYJT0@dGZ[48\8c9NHQWLJ/:2#;SU][LT?C:67&g,@5f2H?e?9Ib
FZV9WLNX5+&Aa@URL;<S:Q\GRI_G[)5_B8LPc0WCf^Ied3.e61+@&0,>RC3e0V3;
2f9=4H9&R+2#?#O/Xd++<^9#3^Y:R<eNFbI+N(aO6P(@gEK7Z2DXK8T4R64Gg(+_
TbBS+\3?GYPNe:J/D/=IOG:g&56>:0?Y/(Qa<Uf5b,KA4LR]#b?+8Lef?@;/M4+A
aM^01ZRQAE6P@FdH@FcP1aBdEPZW85:-SI(]dNbV7Q)f2b1fFR5bQNS3;^8(<a,]
2RVXgTUa6H,cOcLWB^21^g01;;dV@76&E(8MW,C-^(>1I^&Z4XB][T[B8O(6SFaL
)M0VSNV/VP92(ERQOJXdGeW&;7B@4f-U;Y^8YU&WXY:88/;ZUKcI=68-UT^7L\#d
UW&[\?JN3]0I_E^EG<Z1.HG,eSJD,-&K9^6&)73#->C9LI^]6HeaO7Q/FDWI>cH_
L.2>HcI6LReWN9GO^UU0K\=(((4(N4;##=N,X;IN=#Q,+->eHb_MP,(a.-C+HacL
f2VP8&1=A2Ac24a,5J]E2IU#U.BP[YJ?eP>^97M0_1F1\D2//+PVea&/[K31<Yf/
(\9.GN4/Z7TI91RH?Gb.BcKg.[)^d\^f8/#UNF],]g[[\L>^?:g[N^ZJ]HgUcK<_
0MU9YZ&.Hac?N<YV;)7]@3N+KG)R)LYbMP&7NM#BgR)bNY5de5I0d.a<&QFB\8Kb
=DLW/O;:WLXRE@YaWK<V2,Y=\\8_=QV#A>+)ce?dAb\A?Id0&\,1PgI48<CZISUN
;A((S<=[Zf]\(f@7<7/>U^2a>fL8^IIaHL2;Ka2W?QUC#4YCKJ_D?1/ecACC&AdH
^?2<)FEIUI.T)M+Q(>Y;,(F1B8Ad?NOKRC#^.#^FSUN.gZ9dPcWc\S4OSAbWSL;S
:RS_]4g4[\c2@^-dN)-7@M^6e=S-eA)2@2Z)R4#296.S8OEDE&7DB4<HfPBbfG1+
BFb9SO/TWK#Qcb=P9[#>T]f((Rg,g1(2J.3QaX5FT,/BPRJCIZ?BBfKE953AORT0
Q5G]BD5;1KLRS@LYE85g<1EC.3/egcA#2;ZKC?3aYC2U@,F2bJFR]PRLHd^VUQ>L
7/bLT27A1L+Vb;L9KO\8-08bHE+69G#g=QNJ[]O.N&F^?)AR-ECR:W6.XVI4/0^]
dI<J)T[Y4GIYCgT-QT7M[e6NTf4HQbf3_.G)QR@XLCd+eBJ,^YY@N9F;<ef5#&a(
#T+EZ3((CU<.ODB[Y3(Fc\(F#BJZXNRaZ^^QGS:H/751,eD?HIFU-?V@6H)WS?[2
B9Fc:#Q2-?8SfRLe0LM=D5^\AH3BEZ<[2BY+8EO4H3T,=:ZC5&,Y^>A0eg2#>@>6
Y4AU&_HL\EFUA86HacPaBVOUaM<8WN1T#3,V7@RFC-V^@0KN_.9A=_N\J\IP)dR3
K^(VTR8ZO1c8g)c5KM-cS4.>D/:dQT:a:02fdR(X]:?d1dT4^]Y==QH_0a&1.#FH
70T=baF56.NVKD.6[@N<84BXR_75;.R?ZM/Q2R0Y7XKbeEPG_<11WaD=YPGYA(Q2
)Gga0(@NKcKG<C@:dLNEEO(RK<P)gP##AO7V5.01gG#<:N4G?O5WeMfMcdJ@_05M
)L=ZaB20&gSfa1XR+c2?3W67]^S#6_USXTS@V9H37MPb.5<_7g.A,EAfHJ1:C@JB
gd4/4+<X/a1]1,Kd65>>OHM4.F4YAeTUC<;Z+a6YeISK?DH:RF2+8Z\:S38.3WUN
d64LJ[?=M(_/C#;&,YEFK.JH9/G?:?bQ(Y,3RZC8L5^HYV+VG_MI9g9JUK,\eSVf
Z\G8.EJNO&&dMdL^/DLDOQA+HeH348.8OG7I1F)aPG2;5/H/cBDIIfbf2O>//-;e
]DYS3&\0]P.+4.7<WC5Z4/MR=<YME42I0/TL.eOXB,WcH(<9O5UA@:PF2);,[/D:
UKK1gc6V1g#=<,=4(]f<:,A29D6b:MGH/<<Y(CTF5A4HMQXZbAHTFF0(F/?P^L&0
g\<>DI1)IA1;STdJ?a/W.(B;MUM>gbHEHMT>9Ba5eJCQ+@McY._@\ASR\2[4]_If
Y2M.<4/)</\Sg=FU3_.>gMVS#g_TMIXY>(dEQFDG[/I#]GW61T5BR3eW53a?&g4P
e2#@P2Xa)6,bS-/1)1M<A[)#^?44MB=\F;9S\WbX,#Q.?A0]\9>54>U1+[6(SVY)
3\.A-b.P)@MQ[NVg@8SRM&^VKdHQ8D3bed#U.8B360T(?07K.\1fQ_@X_9K7NY_^
fZM;;?(<RV7:6P:THfTSHb05##:EeTX>9dM&1\\fc3L4ETYIB(:Sf52JF^LSIXd#
\K]I0b?(,@SZ-0DDcOUF_9gU>PPEb+6:\)(+\=P(QZ#9f3U5&3M1][L9K2gc)Ha_
L41A?@2BY,2:/bgC4@B+S[UT6Q];Z+D9?D0>a;C>cVP[A_,M,\V_1VOT^a+M\LPH
HB2Y2EMRO(V+(eGRfDYMP\A8T14Q3MK&)FPKW.U\@;_f/(FX7K^,6^3\IWM_;0@(
JJ0dVJT8;XP&+I]&e#WPbgH/bMD&-ICJ^@0(KYEI2^M(3fE5[FQY+OX7RV;cI/PH
+U15Of6]JU>E(e]fUf1DOQ#^IZ.7^bf5O)CWfe&bcDO&fMFV&W0UL6eP)7540)0V
JBSS#I?ITUK2ZD>(Fa7d/?I78C_eC(O\0NL:]X<0]ec6\4H6@X7c@/g]Y:)42F@2
90_QeabZ^f:-=X]ER#<@:,CF(RE?[//(OQPU)=Ua5:R=&R8>aL7Kd3=O3N]:&c;]
SZd0/W^\RU[gW/1.=IV+OZ5\23NM(+g0AR<C.2@8>XPK1eT=;cZe54c=L@@>?N-N
c0UZac59I42EKXfHS.R.TI(N(:-8W[JN[;L;=+A68cEH62+b8fa=),Fd&>O@4]@\
DKdBEPDdCQ\[0ZG,#=:GR]>A4]&U5(=,7AN&Y>GPM+555\\U;N2GL1=D8?A3>L&1
NR-f:@)-0<3/MB@?cIY#e&4-22+F0HTHYZG<DB;bI>NPR:)6^-7ULfSJ[LJ/E=(F
#&,cL(NV;R2,@5OBHRY63>)N^/1?H8Xef&[+)4WdY^NVU-fOO8S@[Z,Kg6?ga-g\
RW^9f](E+&,<Q^(_4-608.X[])V@,YI\F6Ld;U=]JN0ME1J1fL?EF?TWe[S#I8LZ
=ZBfJ4;S/6e+1_/WI2HF)1MG]E6Beda.T#86/c(,A2+7:=H..]/-4ARF8[EHcI1d
+J)L,Y6UF?U?,G>V3V5-4-T]AK6?T>Z>a?77J9Y[+aTI-:R9D2.Rc\bO+45e1-^[
>_f)]FSG]bY^(Q]2OJ_//AT5-G8URIRB:?9X^HSF9KP_QWc5-f/U^9OEXQM/gERK
OX-g]FE#0J[78>a\B&V0OM?;6[-68\0+]VR0[TMFMaT.8-dTY[?WIEV><4#99<+U
/V97RJU4\[A,8#6C.FEcMP&CE#1d>YL#H1?HIC4B760A43PNgCCe#.#?FS-=_8Nd
LKQ=@;1I3B_EP5g#4=gaB=B>+UFLFG2=^PbAO852RJ2c#H;7/(1baIO\GDR\-4M;
@P\a:0ZT--&)0+_KX\gB(/TOSb#\IO@3b47O(3dg#+;ZCGYK>.8^Aa.R6(QeNgD\
?>\YAdWP1gG7&AdR+g##0Ng5M^Lb,RcdNR4]fTMcZG-XQ7BEMceGQZ7#Oe]fM7Zd
fIUH&Y+&IE\cZ0[S3d-4L1H)D7::B>Y#1-0N7#V9N7L@7&g>18UA:T35&4O4J.-a
Y<LPWCeKg4->+X.U<(;,=ELO-_MRQP/S^NA2JL;XH<N;dZ\M(@S?T/VVfdS=9d3O
GAK_0SB^A&<QAQN<1\#:>af^#0gWWL^H<^N6Y[a>PcMbF5O>dO1DQH/Z\.g[df6G
FNT@.FJKP]a[aF6-+NM;QfJE,_.77[)L_:Z.X:KV1E1\SAaV\_,NHN]b1&(:YK:&
a)M0P<KN.-PCd0QTTL.;CD/TSP+CG.a<M];X#NaO+NX;54236Da8#)W4Q@g68;?/
@AdS;2L?0d+@ec;MbfZKE;4BDU</K;5,gcA?KZH8#3600BTMGcOXLGF6YHV@Q9A@
e[f15?5=GGb@T.:,][bL5XVWf^XDKN(Eb58=9Z2J?\eDQY#WP)U^H>PR,VL]M]5]
aR\(=2MQ)_A9E9B=f8PB:B^5a#e)cc.HSc[]g;8_JH2OKDGLGGH.3_?@-MS.G;<_
[<)RCW/.^0c6R(>SSEKg\fDV@YbE2-@E=YL=b<KB+Z:P3Ea?9_R8\F<Z45J[5Dbb
fZ)g50Pc59)SU:HY0_QFH)K5Ved#SQT(.=MHfWY^NE6/=)Cf3X#cE-bP[_d-4@ID
\4.b93f=f,N5BRGUE15_gND\[(;=Df/Ed>fd1AMC[ODO(0=.K=C=>->&5^<&-HUM
/_2XPF)8XT?,>Td(bI:PIO:3-+\M3?DV2.:4P@<Y,<[[56&[T6,](N5e@a2^\&>A
,<XGW,2(#37=KLJTf6;-W&QZ?8c)[<.DRZ2S?Z\)52Cd2d)TE2f6SbP)_-9=7F,]
U&VPPVV>c@[c<<#Qc3C=T=aV_XadU:e?IB1P>#=caO>^_A^__/<QbRCT-<<.d)JQ
g#B@-3\;\;;(X+EK61+2XZc^OZ3\2dTb9U#P@&3WdI8D>&0P&QVFMF1aL0dQO[U8
(F&P3Z9X&ZO,UJEDX-]--_[1[>f<S?P#&W_JXD;BO7328_IHT5?8FC1N(Hc,^;UB
^1Z:TSC9-Z(aNAE#4HfAN_R)4aE)UOVf=\G<)M.,)@7/:B#B14\0RR:2#A4Ia;3g
>(Vf),baU-.g6#<O\B([f[cU,cR?Cc,.6S5a);)5ff7QH(fFA,^FJ3UcX8R++&M?
BbJQDH\?A80:KBKNZO.:+2W,4gWZY.TgB)OKA,9LSYO.cT1ZZE#.[TG^[c4[(SG6
:Z11:A-[&U,CZRaLX?O5dfc\>dR9LLG6TP=<aIZ/#6^?0TNbG[cJe\MX?0909@[L
.0\W3cGg#3LIT+?7S=@Q)8QM)E.Z/_W9?(E3cAO&Fd.CXTa&SE1&#d7IGff9=cZ,
/1+ARK,=DaPP0dC=4N0)YF\CK^dH/SP-Z+)YU?dL_\E(MCY^dD:74EL#H?27(3<]
80:O^&2I_8F,.3+71?#c/1b0_JVMX\#EK1[\d5P)EG].D5W_AgL2X9\TIcW?7:RI
IX43I(D]7)0Q:H]UJ&(9S,gPVHBX]036H#,S-(bR6XH]46PI&a9#BZ^68g;6PU/4
Q@dE]:F572(7Ug>K\H=_U<YD7CO2e)_,SV1.ga[SI=-GSDR@Y87HI(WZ65.34:0&
9Q+G-2D22<H7F6\)OR^+^E3fS1IcPM8cS-#<aVMPdOO.0#JN01<PH6<_>dNRD@I:
DAgG^QJ[bKH(@CZWHfB5V5?5,E8X_Pb,58M2FYO1)_7E]V4PeL3bGB/U57a-NR2/
^--UcQH=:9S1cXfTA3YGW;\1)P?+5MA.7bHDL()7dKSA+O[78GcIUY-4#6^KQP2b
Zcd<GGU__[eI_W@#:U#eHF0^\(4.O/<G2UUNX9gSSIV_D27=&FU??W?G7)3OT_]V
>V2VM,9bN?OdNI7O+]>.&K-H+fGZ<EcH0BTY[RfGS53X3f2g<]H#_\,C=PPG#21-
;/,dD[:72/0L<J6aMb[M8H0Ff-^X6ELfB,7(.]HZ#c3g<0KJ0c&e[6,e^b2#Ja+I
W_Df.C7#445cH-7g4Y3BQKfZe&\#,9>[8S=9/eZDWN62OaeE;2.#/a5(9GMMX5Hg
4gY(TbN9HX2VWN(J-K5TeWe?-3e(T,KGJEJ&P>@,DS53XF)&B3T2Ya@(<0V/K5V[
W6AQAFdaKeWZ\/OH(H#2CCbcX/;_<L?S]#0;1V]B8;PT(2;S:IK#M3aC4U\^39E-
aeK<=^)8?M(1NF.TMV-CVLPDM36=NJND^D9d_dUTdKBMDNE.(G6X5#MaNENZ[KYH
.-M6>?LL?HP\)-5R)DF.XTDLS-<Zb?F:?e^VVN2V9P?Z()23V?B/&H8B-0BC]6.R
0MCK&.M?[B_/GF^bOgf3?A/O3L8]THT_I=>?F-@];Zg:,G,gZ4(.H>V&Z3MTfAKR
\VOZXSJ-][Y4PBKST+G2FKL93QR7<\6.O1]3Y[DWKZ948/6_9;SO5N:U<0(Lf6?0
Q7@2>G_9[S8@SO-,^DKHMg>]Y/JKXY?ENP[40,a4A5[_J74<+:DMU&1ZGV84F-fE
f<0#1\4::Z]4,#@;#(NL)DA;[1ABSO<EYFc3WEd\I8P8^-.,TE_J-X>FNF)a\4O9
gKFEX6b]+.H_c/,4FYX+f.GC:]VgJ?<7WG:fY9>\M7I.TOb-.G>5XeKTLX[dM,c)
ceZF8dN,Q0P^cES(7g#W_EH&M+KCU<V1I([)_4)0O@3eN\<N=e7<-,L\64U,@SQ3
_cO:JBEdM2fe)gKGP/PN2/+KZ8I9&bVQCC6dF[>>7#1R#(>2d(H.D)4YNf#4653I
^>c0;g/R(^B&SF,7>2TY8;KO_1:HeOb@Tc^8JUQI(;#U0QNGO&@<];I4E&SO;7+Y
\Be(G23R>_GT3-TeWW@.66:PQ\46c(@_-S=/T\[DJTGFf8JO7@LJ;C2UdC,()&:V
4RIWAZE7CX+2370,g,<0TA3(0.Qa<<P@baN@#<C4H.M+0M4fV;?=@e_JKQ0QRHWF
S;?RJNgg)@@I=K3;O3&I?P0:XR3c_EF98,L&f)d/]/:5f<&GY-:=6_V>O[F<)P)6
=3:<g7YFS4P,=VTeL_T&>52S8[LZH8X-JG&0g2XOM60K&R0AH7-&PI:a8V3)<d:)
WZA+K2HgWAMHYA>?-61H@:PQJfcLT=Y..3S&M/P&FcHZKORaH>>-c+]G6)^SCIb@
XTA5)@99b]QR2G8KAf]Y03)+;=^3#VWN9@Y_QA>/S(.5.V2_9YRcTLe-J;I-B0L]
H,9Dg#Z@f9@fMD#0a58P]G,d7JP#U.DNN5fg9NODf0,QA#:d=c?/)E.6GX33&Z+4
)O9F7W,)6a6_77dCPR#Z?4B-E9F/#LWC7PX^X;#^.1MN36-c9D5KNB9Za:bMHKDc
cC&EDIab<:Z5+VDQ.IV,=)4f#Yc/#P:K=b]J5CXT-.VfG\87YZ&eW2RRXeKX/<&:
b/D1aS3VLF(N/MJ9C.Kb&cg>g/MN)]5HO..4^5I&KeUe<a@e].GGM<5:(aQRC&g^
,,@1CY6T[,c2^;0G]&Kd6@_NcTW/AU^Y.WSdET=/4,]V2P12-E03@_LJ+_YPc8F)
71;3O0(D@N;K8KbB/NWYObM,9@^W+MIeOET/g:Yfb6.MHTMTPd;;?Cf+NY1^<R>G
9K(SEG38dXM5J0/PP._H2G8RCbI5PY-KI80d_[N&3M]dL]d8WG4Vg)D_,;5YQZ_Q
M[:/4d8P+E:\OIV+JdK20ATH5SLV;K\S&g)Tg(465f4KN-[:R-_QL6-3/V>3UHcV
L@ZV3.fR^HTfQNfVf^LEPgfOKDSP_57J(>58M&;6JXRETa-fT0[ARa)LE\R)O3N.
_8a^XcA=HG@KI//(fS\_2e=TA>_KE,]HfgXRP.[5=8MHX>2C=g67CI\Y[QDWY>@8
HVL7\]eN;,b3<G(aK6]b]8_S[.3R;^[_F,4eNH<[S:Z.]X<_c^0WK0M7EL<O+(Oe
.4e-Xf@E=EC>KMGTfVIa#0VV=<;=X)Z^58CNb@4,8Q].WdbR3&_gOT0[7ed[(&6G
M5-)X(F=ACg2=ALcU:6._gYXHJdC0]_#8aE/1e9>EF3^VY(1<-^cJQY-X(B4@a]2
#AbR/:fWC@dV9R-5MW^7ZC0>GOSb5?#Q/BD_T>:\70#\F67WUJ+XW77K8e^3Hb:-
OC&(<K-255TVF/e(R_(&D.J6-KXY&<MP+Dg8U:49T]g&;(LB98586./BK7&[TS>8
_a/fcIfKE;.R8UW6a/cU+PWB+LH7HG8RF.\YF5H&Z2EF7bgC9?DQ/f(B=?^BKY3J
()/L]+d5&_TeM2=V35LQ9[JQZ@5Z&NE+<+?\f/:#(FEa:F>M1,SW_5d#O[ENX#/#
?)(M^@HHY9W##WdbY/a-\P[4C-fVe/SfQO:GBVXE;a[EVOaV4]a;g:bFUPJ6B.]/
M+a1=]SQEG[<bZ66IFe;fJWZF,F@ESN]Y4&IQE>-)c]/GDW_M9F46YE#J).Q&cSS
g8L76Y,]5F\Zg\e1N)[/gOd<.V)]7+./L-.X1-e;X5-6F&RXa_.,^=:\V\1CM)V0
K(1U62A&&E66I37B1B(4.B[2MWbMd_>0<E/;>Y&;U];JK3eT.LYQ@V^I:U9^^2NO
SVU5C+[^TZ>8,4L9\?fXIJET83)fJ6eRf3cK(S(gIeaBN+M?=SJQ;fJ^O.Z#MT&d
VD-3Bcb6UU+R,,32F_VU(;#)U[Q^+TC[^_TgG6X<4R;.U9(cZ#+&2E@2a,E,BCA@
=[>;A_c<gUJSO&6;]\6+0dN)WgQAXH^W=(0Mg3+83R]_c;_E/<#M[e)_)1?1g1AS
VeWX63,VA+WWF]>O?4d)MOaAfa1#E]YYe,T7cTMC@&cFb[=Y]1Wb//3.b]Z[PD/G
K(99Ge#2O;-MdOZ)1(?VV-1#1N8e?,c492U<e/Z>W/>3fZ\\<HQ>2SA2T1_R[O2C
5PfAQS0;Nb+EA-LED?V29c7_OU86EG7cF[+KCDNBLO:3:YM+d\7=0;g\\f?0Nc3X
Eb:JQ?5C6:VB38N@b^P+/GENNZ>bR=D0)4]CcE[HLK,]3EW=L]LFA@(W;-LW?3cd
_;::cN8f-]]6SG],]S7RVeR\Q\[]aT2/e=T)16W?2:9aLb+1+H98@8WE)(--/RMJ
C:SM>9A4;?XFGaXP@;BQKDaY55I^-S)D7e>?R5bTTJb29+T^M>#gYS_9JDIaH]6f
LWL9ReGJKPF354[eB.FD;83.[RSZK4dLXDQV?f:F_U2>Z@EG^G8+&)P3^6a<BX3Q
b_e]64;UWX52HEb3;T;5(EJEU0EF8S#YBEYdE_P8[f)LZI[M157LI_A?#_F.V/Yc
TK..bW-H@OE.QN]g8;IMQ=_VSDMP(,R,EM-V)+1:Y,CVP?g]UDRH5@N)+aU:F5&,
HY[dXRUNH#@g\KcGB_,X#87(d91:=39)T0=^LCC.D?G\T0I,c_(-cPIT?QC#+0R]
YZU?-;=A>?UM5;g2K0+9PDe<DY7C4[C(DI=\A^9b5R?^R?9.)[S/&;R/8^A/A&]0
QXDBE<+E?5=R0SNd==07&DDe+11.\KdXZ_e0L-fX,c_F_?78726Ld2OM-eZcE7#\
-B3T7;?;eZ37V@NCS5[/F#<5\Ng[f#E3KYQ&E08_WcW+76VA>/A?BCNN]NJW-@HI
61D)7UY#.01/9N#CWP?YRLXX52+IRQ_XB#f-MP>0Bf8L?S/JA;,G0afZ&KPaBMK>
:_G#KZ(F>HTfgI92:1D(gPNS@68ML-+J6LM_gS:3^a;:4d=_=V&1LLX,Q,EDY#L?
bIdH[dO=e8&22X&CT:E?;3/4#=:eSH+^J=E.JTR2EQ9O7KUVSS2gC()O:EGHgA/<
Wa:TO#YQO26c#L]\Mf84.:4^86SeND7?SWNM?X4EKPD-2G&?V[3YWOJPbHPI[KC<
T?LNS;,IX>>V9?cV(d7C(2@=D9c[^,/K1M44>CRQ5EZ[^c0eSfHWWHB.JNO/9&)P
4=U4NA)#;V2FL@TJXF-NR2Z9[f7(f0O].O<NAb7a,+]::[W7)<UQPWK[?LNdQZR+
HU3@eRT55G5,DC9B:94E8@5f<.I930#J<4V..)G)c3Mc1THJC<?-0LH?&001JKLX
RKS-I]TBba.)25YL,4@4V3af)O+))Kb:YCS<e<N9gK5N?O)O_&(AdFPUUH[Dg1X?
9V1/+H5L-N8R]2JQ&PJZfCX0(1<La3IF]T9IM8b>3P2IW+))A0gd]#H6@cB[?VbI
+e]A_d+dSGD[?Gaa9)d[7:-d@[C[=;aP[K&&X[7>37,))NJaKR4<,bdUXUWA?PPE
a4,DTF:cMdJK[J_R6UFHfN9&_-24;OL9-N@86c__=26.L/KAQ]TSM_281NY9DFX+
60[..Ab2C;,/9WAP>F+6\RYa2@D5=_5,?O7NGO,00>c]Eg\4bN.G_D;I^CNG&RWM
>G<SW3UI=;dI4(b3Z,LD:_P.cP3A-DT<JGcDX#:Ta?>A[a=FcSc3AYD2P>07c^Z9
Wg:L_N7b(.0Oa\03_f.RDX/-1MMB2_Q?4dXPcH^:F;&8^[3/Red)CNX;XVUUI42Y
7&K5f&5/)FU@>[KeLR5OX=H]7IG-b)+JW&OO3GEe)JP:4J4fe4JcU,.=&2-f>U-F
D222U4^&?-[@:8D-X\C?S<=K+<1(W-F)OAcg#O8I/6fK.[5ff#Z^[Ad7#^)>?V=A
/0DK7]VI>4a>Of?L@RQ<>GA5=YU?e\<1@C3,IVC/.6]?N8^HK6_>,d10VV1S<-#A
>67Xa:Q<]<S&@7R[g#,#:RXU321/^A+b#_e3[88=[M4.&&)0T(+=3)[1VLDJIRNC
^.5LEO3Jg(I1N6#ON(+1TB2)-P66MZ_<O3J=f=;-B#QQ<6D+eQ2Hd/g+^gA;S#0;
\L0,9;I]O,Og1afB+Yge;26;RK^6(G6AGX]&9;>MA5a35]]B3X8fOfGU1,1-WdO3
.H5VE92MC:6QBCN>9:Yc5IJ+S=?Q:5:S1Re3=B):cJVdF<]-.a1<9@\cfAZ4g:>e
4O4B2d1\UQN8D1;J6DFe)P&D&2=N<9g,C9N</Vef_OeCZ#K66;fL)AKE6SVdUX(Z
>P_/4dH74HScJ,5E:]?3=35\(3YN:+A:KWa5Fc^ZEB:dZ>K18_.f,2Y;F&=59R&;
gX\YCQ,./Q(0cf&,PD(<I#Aae^IU-QC;BC:2:PI&94+G=aS])7I907/C90S<#K\6
#8[EaRf?#Q,Y;6.79M,a0T5A39@bdDB;WMg[,2[<&@8(G.8Ic6\N:,+(#8Ma/NVY
K?1=g.T+4HZdX>bBZBXN5Y:aN0dN=Lgb]?E<#7CNI<BL^.]\<)JK\GJ-6KV60NNa
36[AV/T3=Y9C3HNEWcS#KGS+Z7#J2/Y8aCec=ME-[D^aS&b]9@.TAW6MF89M[XBN
JC4g<:[#\YRPg)41GV]dXe_R3g@0S@VfD73<\>OU.a&@=gEbHV/96&/fPLS()<\H
M-1+.\5gY-a]g0C@Na=>?RC:<EU6AIEE3N,1LbgP(PEc5M8Q]f(?SS8@&&3VP=e]
IEVa9e;;f.bf\1F@@SVQ33(/]RDF0-]X.fGZ-(PD61OD;N=@AU-K:/CLPM7Z)#TS
T/&)XeF0_HNT-M6PZfD_&^@(+8#c/IgA\PETfW5KTX5N3;)#DC(g^WIb<I/]_8,=
M7Y.4dCaP(JMT&.b4T.D_6BbNFW(Jd;GP6-M(QG?G#Z0PH0B.Z+SWSVQVSOL(8LU
c<-PQE9QHI,\Y6MXB@M0,aagZSRcIaRF>D8^6.VSIH1:Q2A8,FaI97+H5_2A,0MB
E+.e>K;R9Gf&G&bPZJ.0\g\6W1-D\=\QB)+P;L6#f@S[gAXeB(,dJZO/9[U.J<P,
N_e)+eg;&ZAa2ReI2PBR2AfB;3=HBC)4W,1,)KJfY/O)5B?,H)XV_Wa@WbFe19:3
9Gd<VUXX)#PS?3cS#Q@[4;L70GGIc,F]@3/&\1O^(=@BfM6:SIFL\0FU)R>9K(:-
_J5V/6[]H1;ZT\b<,,fITa-U#B:M.0J=&L6K<.G(3L560J(91Y52+R1G=.]:DRQ(
I?g6L^;fLZ@PT\YcC60gFNfN9K@0U1+ZIc)/G]4T78W)VV0&.A/\:;a-7VX-XeAC
DK_>\;Ee-[._=84<RE>B;.e9d_HNfVfX]6J&0c;F,[XcWgI2@;2M/8E9FG3Q#>e7
1XJ5)L=3Q.WJSORN=&--P,/MaU^CB.O3Eb1?X.\V>W@eH9eL^e<C-O>]GcL#e]A_
5?Lg<M]6VISb.1:HZNEYH/X1^[E_A73Y(:HUcBIUR#)EYPT>CT1^<RPVXQ3)@D(A
_Ve8U3[)16_5GR)A=-Y5MSIb;926^G^+,O0T>2J^-e?EL:?@S4R41&f_NT5F-2eL
eVZP6<Ieg3-7M@/F5<4.R.=H=BA8RA^7BZ3[fC:TF]_3a\@;<7eN@6L])c]?PT;U
YG3,W-d1;(ZEW96DFdYDI&]e,;7P_125c5\ea&Z^T;O\SSZ8FD],IY]cH=EHVBE8
Ya.\NR#S3L=(S>DF<>gOI=V(8T^U._:QNa^VA-93?0WHI+-)00^)<Qb.U@(T81/X
Qe15TfKYQCY1f8?GP;2>,Y+g;&2RZ_JX7_\#A3@e66&g(.YePF9[<EG&4R+E@Z@(
f+Q+5Q6[._gGeIYKecX7[dRBL41>B#IV\e]g(G/SaJ9KU1TGG5L8&K[ZAE>K&&&)
OH+&JLYWJ7FNGaLD],BN=2EN7AfK13;(,U:9_E8?HHG40Z.)4ZN[Q0DM@^#4P5#O
J+dI4ZB9Z_S<]+Q6./UZNS2d\)[N;<,?#baF&Q2-eB<?/[Ra]9],?473-K7@_f/)
WD=+7=9E>M21;;\TZXceUAQ_IV@79Y16ZRRDPE32.B@K(HMJI4WgN)Id_,N_6Q8]
<NUfKHdN#EU5a83C0V^F,<2I<Q.-SHD47aX7#BZUR<d9TJW_VGWA]-3d#[Pd)^a>
,WVa.\(,F746&F2f<B4\^A(ZgbTfNY3J3)D]UaZd]\[3^T01^BTa^GJWT[1EVa4b
.YN?KF#+[3d01708J\)5_4gQ>:3MF7C3G;WTM,(P6S7<2/^#+C.FFXgHW4+A&=F?
OVA4BE-PVM&K#fA@E[V;?&1(M0e,cST1c4+YWCZ3bYA^g722SOcDV#d2H2OYYT9;
+4;PIC,#d;Q^JRbKEM#_[KFK>/CE^-_>T_,Ag\_7P<IGV&)Ee.6L3U30I8OU[cZ6
]cSE=:UNE_cK7]5&IgA+]O_P;?8WI@\SK>cC_WK@CTVZA&+eU0P6#/?eT<10)6B;
aeG4>M^#LC745ME-,-/AQJEG&@XCK3a-M_[e0.BUW\<aU8(K(Mb(b]:W;Ec/VW0^
.Z.g)NRUc9/#=Kg\KWdd8eS]+5#SVe]7YQ8FJMBVICZ-70S(7/9?<@dNUKg09JgF
=]_VUGQY)MJFaG-95_X\@-->9ONg7^d[?SI:#513Z)RC=?GX[=BX=.K5F:?aKQa=
[MJNHGR=a]X19Z.ZEOQJ#L4-ZgC:RJ]O)3/:X.cc1>,>d[_DgC/Q3#,LQWA9gGf\
_JCU6U01L]8/AR4];@/KLa#faRLPH\^=f2M&@^C]N1\K_>]1QVTHRHcSNVX901,;
N/XI1TNJ8L^@YdHUKZ/H0b>B_,bLf/G)0KgC0MYNHKf7F=+7VV(=STK-JU?1<A=4
N7Q.fSR^>UAV5+e6XV^D?WJZ:2MM/RR:@C1ZG<gF2=GOV>2QC+5HX3K0GV3VFNIJ
I_T1HFDHCU4-O6YP\4ML-4S=Kc[[F(WE0,R1&^3+,0DYQ)gWIfZ\5Rb[V_4DKA\X
K6WCX4(B.c8/.e-?BQ83V,4N5?0/dF(4d3^Z_;KJ3LARc,@-5;M_GVZ>CS_G]5L5
d<e.fUSD>#X[>);6O\G/W/KNdYIDUP?VIeK-]X</Ca#WeFR+b^G<S7a>U,C]H;N7
XEPMX<Zf1HGgUC[T2/Q/aI2:5I0V._c/Nf6D]#=:S(TPg<MNa@;OYfCHK<6f[=<V
9IDJZ1O_B[V/3]XKMMPMB]V@-@[M9+A7CH1W@geP:b<V.^Q[C3;]W>PL9SY0D<Ad
(CG,U(^G51RIO)]27&NeT_YF5DIfQ[aae[N,;:?[JWGHAGB6KP0:;;;DK/e;;04D
+VSg2V.]AZ?bTQZY;?9N9T^M96@+M6,bK10(ZV9X.3e(#1gFLP)IFV,3I]0BT;D-
d7XO@e<S?/C<b@e62dA#@FD;6M&O:VT]I[gHRaH)\6N>e^_+D3IGUCPTXJ190H53
+eH8,P#WY^OU,MWK1C?KG+<)34Y]7ET?gT9KF_#CJ_21YGQ^V1<A[VO5?N0I.\KL
b0DEd[)>USWf1aR?M.MOFD7&<DX>/^bPb:F<59_H+/,YO+UOBR]]Mc3</IAA44<,
aV/E7Q-dZID&IB4A(?a,#-d8g>#A=.UYI7_J@;OSa9O^H>)D,f?SV5;O^#@-BJ-K
>Z1F=M<&I]K)f_J#,:(1&:\PBR^b5OgDZ59LM)^9&:P<PfPFbEEd_6DF888+3XCU
Wc]/JZ_HM_L&fFCP6NZC+UT[d.SVQc7]YOHTJ@94?RT-Y-VO5Jg9;KgT87Z>1^2(
CKY.)(?4NfD5f71;cdO4/fS7X3H(F/QE[:PY2fY8gH-SD88&>2AbZb^dc2-W#R-T
]]ZYJ?1&-,YFQ48&I&C5(Z7dVS/2D]&F/]#BK<P8X<+U<_=T09([=<NB-,cdH+(4
E]>O7_UQE<DHI8RY(>;N@1Na;,?ZeZf27\I0G8=d/SJJ97Idd=#)T.Q<a>H^6NFP
bGXTf4=@R4LZAYXg4,)M]YC_5G7I7gN(.(_8W9S>G.A_V?2@,9X/B\(?Vc7._^JP
3YD2PLA.\,K3\9Tb+9b^S\<R\M>.E6ZC<)QeUWI)T\gPL=<=0G]g/FYJ_#b_\=,4
_-gSKM;SALEO<HRRaCKAOE7=1Y7W5&KG?)eJV5J(S9H5YFV@f_Y7X4]LeHVLEPA?
QKRdZ6C(LE]Kd471\UX4a01:(:N^/_W81\&U[BMYPP12<[Q\C;EW5FeDc<NbG\H;
WfMJbQ=4_>CgDG.H?c6^<<_Q8>5e;-CRc4)>@b1X013>f[&d)<be2_XaCbXGF1[[
b/fLc/N+d,O(=BL#^I,A@bg<P/9EfWe#RP)[:@87#5U5Y^B>3OXb)6?HC52??dK,
(Ka6g]C8/3\OR#A)e^<:>-dEM/B>ddC8&N>[@:P-KVCZOfTY?<U26=aZ[T^@db]\
O&0(Og4<1e1S0)gLLS_:>7>fR^=,8B[283>CD1cI(#UIe2;a1J@EQdSF>9G+G&NO
+K_)_(K3e>Nd?/&.U&(4:VeaVeCIdR(=-8FX.H,M7]OH:;5P6<g4<<+e/T^\WBY?
SKg>@/ObL?X&EH3bcWG>@6D]L]2\4;E>C1V;LU<-:+&2K0e3dVb(J=IV2c9;X=EG
2,/YBc#+PKVI1UbW9<DDI(-?Z^RXM9V>]ba:\d6IDPYROH4N\^cJB/?f/N+0I9Q;
2Dcb(5Lc&,>SZ<I_ABcc,?SP0c1U7>>B0JOPAVeGN5FNR/]R28?\=AYg5Y1^,URY
eX6eeYJ/,Of[E\0+L])c[W_g;#,2T\OXE[EVFeM\;]^GR[8#a8U9K<)WCL14f/R5
e(#KBW:W_LQS&I<L5ZMKCSV64Z&289G0c(b9?#?Q;/&CKPWMI4<U:,VI<7GQH/NN
]9&=\d80/^&09#E(PK1/9+;E7aA==5F)+I1+2CcEPRb#f4KP8HDKP3,Z(]5>:Z)/
8T.N4=<b[)EQO>[_A(;,:V,N\[SK.>(8bU[=2G[TX5\W@[B4R6RHC\AK0=IBYQLU
YL10P(^#H5H^92)[3^6K,-/FGK3+Z6e)U?P8P@2[IQO64JVTZEa,D:W7EB(U)\Ve
V5g5G;,D.?03-(-[CfdF-fPJ4-Cge5^>?3-Q+>EcM-/>5C:ZY.;YU6LS@0g5I\4[
&PR7C5a3LNT9-X:(XF)e@F7T,8G.0)bL8AbF_JdM5JBS.Z3,6:33,Q9LL4b/@J1A
d?[-fCCTNdEPC@6#T^EU>a(#f##V7ee=UU=LU8KA-<4&0#7#Pg\C?&b;AH8LTNdO
I@L1<SSSI1XY.4[SL,0WgEcYV9e0/,dY0VeE/Z>;G<ae\,NJ9-R?eCB7X87JQ\JV
A,Aa=Lf8@3+WIJF\6,N-VF?=UG)&ZB^a?ec^8:#24N,M.?0W[cMM=VI0GJ?VLFT.
PgAHaD&IP.EOO=-/TYBBID4?Z0(NgR[G0/3L.?+2JN)0;FM/H&)b0^#YQ-]1OV>]
TDU/0GVU1,HL.-+?@DMV7b^Q?R:XC+>CD,0aI=5aMGL?3Y.8]BbU\LaaA,1NFb]/
,:TD;e):.Q)L)92PSL_>U(b4:O@2B7&(6;#;5c,;(QO7R4+.QBc7FGLPYPe[1_@N
XLZDR;R]d2WTIR2MPF>=&gTd(1U:HBM@1IE>D>MRP92K:ERDb/RCfZVTaY^5:4Q:
T>\c6L+a]fK0M<B3@=N6@^+Q8)(R5ENEg<.SST-=Ud,+<_05L3Y1/1]S_?_OR1@@
TV+4=a6Va6HC/C,YRG#U&e,3G-W?9E22H9_R(>DLdQ<g#LdU]8&1RE6fU\E.-Uc/
Xa-d<:-)VR8?aFY\D>1_g&-O?CIbef]KZX;5P2B9R3/5:;CG\K\(U3e.e9a5PeXc
&M7]>UK7[.eQ]-3:T2WLP,;DeZT,OaF_U-9c4M4^Z:ET0)JKeQ&66^0L86_JGUdZ
a:[LeKGXRLD]E?[244c<W@GINLaE8bAW+>#CT_H.;a;^K1,J0.Oeb\T5e1+B@E3/
.YB840]FEZ?[GH>(7386C[c[0@cEaV13Fa7;5+KD@+^C2)/4F/C:[-0R9=D#A91J
VZ1LaYEXB86^M?0<TRR]EX/<C)<<X(V-;E(_H?IN9AD[405XU7<(O-=M?e,WWK<-
YYMM0WZ:^+&&d.7=f++H+/LOVJ_N=^ffI8[0#?LG;TT?=R5cVPXd_Z<DZU>-?5dg
)/W#c>L/3\?2a)G?32^@6PD^IJ#/=8PYS)cfafEVd87^Xd04L6cA4MfV7XDS3)0D
>WX^d,9T=(V8.NIf@NSdGR\KDD&bfM)[aO#gK5ZgV&[EP=QAC4<_e\Ge&(_d=>6]
3N;Df)LV102(X.,(K1F7,NLgX^PQ=N_]g&76IKYXOAbCQe0?^UV)6fP^QQ=@LIPf
-g)#LGLQ/GF2LCX^&A3:KRbgE1M4;WEL4:20H+_LMCKF--@dEZ@87P8_#-TH0QCI
CHXMdUIN=g307^^Cf^?39DZ:8S@fO=4=Wf=K:/S(<Gg)(TXQH#7E5R12@-gZ/^4A
,0))[eb>8Z68V23HW_c&bd<K_c:+>26Cf6M_4ILJH10SXBI&?)XR(&c-HAg:],BK
RRSaf>a8CS#0fJB2ZH,;H-O]WM:46c(&6SF(2eb<O_GJ-cU\fa:b80P^#[;9=B?e
<-BQ5LEO5b3@Jg+-=N)+S7\YgWR<HPE(;1RE-:F(:Wf,Fa-R3NK,B2XD\;gMAU9Z
9e1J6.689).N3Y]dU(O6Y6T4Lc6W/d:4+(Fe4&2ZTf7J-F<a;<ea#P+\YQ#BB1(4
e7,FD)HdQZ>7]b2&)(3>Q)/?6f[+Y)WPPIf#d8:R]1d9-dcB@H1ZLVFKE.^VD;[A
&7O[d_JADRD6Q^M#8JPKeEc^fR4UL3Y=IK3)e^96VA>61N8\?K\Wd[WJA<.TB:Y=
G/QYbeDHW,A,_O#Vd[KOCJ3[I6>d-T=ZdK7S6\]e=K2;OHQP;?YN,QYY^(AAMDU^
.J&\W:+^,G=7Kc6;=2gBXS;b?:+4#<IA0OYOAYJ16,g9=a8[UGF9]6H:UeAZ.0_0
54#TN4WXK7,A(^B^I))#+@DQM6D<dX8;8MfJ3[ed-)(CMdOHg#@X2J&OG0H?)Ja[
_b+/<P,LWa-CR.BaFbEeOJUSDNd2=+d#fLd<cNXC,<_]IV/J_TfGL;^?bLBX5/f<
[GZ,F,_BB_)M+Q9#S1&7PPLL,#18F@>,_SR^LV@Xd2D4@12bS5H<,V_]?B83F+A<
G720N<7<bOI-a,OG89E5#gY18Eb2e?O./[aE1[:D^LZU;Z17)HR=d_P?V=0LCVJ+
3g@B5I2MW4ZER7FH6aY(0+6IF;0.d.QLA)/LL-IH62e_GS>+-M/Z?]SXFM3RE2S)
ISIR[HZ0UFOg3-(WIWZ-#]+L5.@NNPE+8PAGffDg#BAJ8\,H+gb:+bcZGd0M63e@
Y#B+V,T&^/RJf39JMg3AXFd::Y-.&U5=T<P/6]1-d5ab[F:A3WX0JYa6)>-2a8GH
gY3>TF9Ra&11XgAL:SX=J^Tf5S[@MZ^[fQVV&&9_Rc5^=@OWC[X]A3e>(AT\G]#H
]29)J8g?_R30G^YDL_6DC3S97+AJB]TD,.)\0</NPH?5FHZ9/@KgScD_(+H&gE(c
>e5PVEQ2>-QD:e342>d[NY]aga\9]Y9S#_E0UL<#&P^(04H/6<#R5aU8-9^TK)Q,
-NY:M7,LUXLX=?_ea7^RT#7&Xf8/Y2DQW+&QD<+>0I#-f:4NK+IVL7H1fKQ-9H]e
M[Dg?35.T0PG\fU>QdNY3Ic@2Q=SH(I,-,=Oe);S#CL+(,fB)X+;=f77RZ.DFFE0
#T(N0T3@)),-;Fb#V+cKH)^R3;EeE\d]@4;FV594NOb84fOa^1-H&VVB7(-)F0)#
ELTV:+M&bE:(M9\(BS5\UHU?BHUY>45HX=O,,2=U(ga5&YG4DB+<c;fKDK+A)GaW
9RS?=:IW8PD^89VC:+14_cd@WSBF8Qf;NEM[/1J+G2g31NQAb>^3.d^PFANFIUJ:
;\,3Q^.@Q]J(ME5L>La\G.d4cWZ-9D<^.0BDeF)]\2=INAe@8a_+V\ZO-8(BW/fN
M]Ta@31GO,YMID//G+:JVL,1bIEf]4[P>XZ4:EgIV=_K,M=S88&GJ3\F;CXc0U=3
<[-:AHK&K0c,VC0N5eS6>8dbD7>Z]WWX0>]f\a._PeU=Db\=02CNc?U3<Oaeg&--
(L;6^:&/CGX\bP4BFE.#:cT:S_=>f3VSRW=WCR1WeB8f60XPN+<V/SAc:a+CB4=W
]1SCXO)11L4,4/UI8.M6bY\IVI.Y4GDX.#-EMH8Hg,P<&=8cXP?RV?\fESS--4=e
9AW#<70+P).^L:KE9D;)Y[=W/0N=b]6AEPGB_KJ4G]@.>BDK->c&KK5>YcDU<+@S
_@KTMRe@9;0KKd/,/g_4/)g.?_aVKS+BKR(3WG/_)IR+\TZ?.PT-NX64XZ_2.\U@
5?HB=N:6gY&aW^.JM@08+BH,5J\/GYbA,@G9,aO[ZIN)9G0-9dA&>+-(M]4U?/#f
NOEFX2H\-3&CV#^HZT=f/.(>W+D&()X-=9GVRKPJU=_[VP9UNZN\bcd;NCM^bZ3R
[Sf2UFLDe)BVEbNYFSK/R<YA)C\Pd50H87D;BYAWX/ZJ(/:c6f9\=UeDb&+#?@+a
TXgUK.gM@PB-]YcIaBd#0.RD:6KLIDa^a)_4f;dOE\IP6f^9YZcT]NIRbNYNACDQ
@Yb#<Eb3PWI?9LGG3\/2g##;<&&CT[FF\@(^6:#\/L^]F_)Vf;@VD6]8I6ZBD:/-
&c]-Tf<Z,/[]]f@[:SAU6SBX4@VNgYA;<SN.5aQC^--]<JcV_PJM1J[E58PMYO2K
IH=.BA</K6b>^d1&CbV;0J=,[V>40((PEDc9YM#+\&Y/ae_<,/O#OD0]Bd0DZE7<
(&><1QA91524?)RHE=];6CID8+Nf@[Q_ARY4_,3\L5FU4FE^cAC.L705<1R=(+ZH
Y#b1fIGE\@V\/[dI&W95RJ@&,/bX97QV4Q)CEG6J7;CL/,^V4F8Z:g09,aGMKLa5
=UYY0],\cB9U/,gYcdS+gZT]@8\=c,Tc-ML5_7EDY]6#Z-GDPcg5/ALg?<#+&-.\
YJ,)NTeNd2A(4XfAK#K:2->X.fecHD]dSEB)<IS1R65PMQ7\)KX6)fKMXa0LWYW<
dGPIf6IYA,PG?AJ9EUC]Z+d5<WaN_UYg-KYS@EAc3Jf0NV-\Z8b)=a?_e(\@?_?@
:F@Z23cUBOIIS94T-)E+_K+a?-a02HXa6?;<9;CYR6dB.AUC:SRK02-^=(e-;F4)
VdN/G[H>d&6:F_TM+2FE@c7-]6b>DUg@K6?OL+7EeEQ0V]b/T4@85F(7GY3g4&<-
eQ?9RcS,3I-Fd\4\YCGYa#TK:T[MYG7VR_WE5#M1f9,<C:H/.gBD&b)C:^:]cSb4
KGNe?U#K+Pc\;V^;[;eN@F+-O+cJ6LDOUdEM;?]Gd@g4HK=JO9CV+]cE5K^Wg0DK
;9#SIG0:22b(<:,0DaJ.9)+G#-4]a/-:b&NI4?,bIQ>4EOcO[KTT@,d0c70]2T@R
4H78,DKL5VG5N<A\5G/A8;NVCGKU[gPHX;b/_N\#[9/fJ#QH,;-/g(NS23+=2W61
#&TXK,<cFG(7^?@Y3,OdJbcQ&+edSVGFGbW8V]-C)?<<V(2[]G-79ab?/e7:23XJ
b.P;dRf3/)bV&RDJ0DW<JN55<;O#WI@UFNF7\>UO(=8H34PO]C_06&E#4\b-Tc/Q
,.SC-U+LILbXY5^];L(A.a8OT.4c6YA;M)4L);.GVD07M#J\g)4C^./3+6#@Cg^b
BYDUMFF>D]::D;&-bc)e\JaHB5bUC:13F+&d?O_\:bRQgfJcR=VJ,4Ja,)DZcQDL
K1BOd#WQ/>Y8MB_0860#BfXITObTJaGdS>dX@OgWG>74\&U<3a=4YEFST0PUR]QW
Q\R)G_JD@Z7B3GL?9MA])]:6M43H_BFQHfA&;;EUE[=ObdB;H>3R1)N6G@FTfeHc
NI(@EH>e:_INg<J4U3[I5K9<(P&[1AFS]92/(D62Ae\31.cfP^JWd,X\CFR,Ad=[
9cdF70_E4@0F[&DdWVA@P8L.[C8A#-M72SO[/X&2_5fF]]:=)AOd\^;[fD@@E2MG
8^VB46OBgP(+.L8:8dFRUY[/A6TIT.\+&e,,L7U&<E8B-1]3>7.g5]Nd1Y#<QBfX
AR>(C3fL/03e4].)YA1R\69QZP4]H4;[P=41]P3L,#,P,:7OAIS[A;KM_53[UXRB
+fJ)[W?0GN?IS?1\WEJ4AJVba<QO)JaJ>I21^\UA#,UF6VA;eF3;UeZ<5eIPUEH0
M>A301(W(1,19Ugc0M95NDAWV[B:ZP[9?JG-9X3baV&\P/#2\A)D9f(eP]#MC:6f
d>5X\gf291JD6#cQXZHL#C&GH+KB1SS19bSd[c23=YZ5d;\\0_JaQ8/\+bQ=14<6
>_<#OTD5R12+(Oc>aOK3MD_FTGHe36A/.CCUZH(/[,/^1gZ^LNJBE9DGV5J<RQ,H
:gSEb/O=;DDDDW89?@/T/Ua:F/P1R0-M\<46UdWR)DJL;a5GN.@XP+d-\&0W;Y,4
9a9DE;\\)]CW+P^Y<6G>ZY/D9>cV?b3K&D\K[Mge1;FI(GS@?C3H+bG9JVV,Q_CL
:UA7GY_6IW5[LA/g4FU+>VD3,AQ[&:Y)X[XOHc@S-#:[+bWCMCd5[1YO&C+<,&_S
,NOS:QGR)Y+;&UAe5;3eC8LJ?FW2Z\CM_Kfb2GXW/.Hg/G(D)8PG@(:D;Q3B5-Ad
V7V=MT4#<NPGQA-B^[V=-Bb_P=QI6M+)E(-SZ<0&V_d&=:W9TPce#/Y&Z4f)EB?H
aHRb6Jf+\5AA,L3G8S@MTY1,PL@COg>[1]g-@YGY6>_V+]=dCB4^?W:/HAZ_F<&D
#-O=KZO_Q2@b(0_^673<BA@4:b]#-H+(MgH_)P_L05C:c^XILI+f)gF:B8D-9FEg
9WAc;@\-EF1,ca+^d@J-T3fQ+Y&^53e1E[-L8?LSAYe1b5U;3H#78d=KRNfUSg55
8H8LX8K\H&;XQ&S<(][EM#CY1>0RBO=OJ6)0\MbZSV1b0IM?USBEU4X[NO6N?O:8
^+5088&69g/\f-,6U-83SDgE2FY+A;>AOG;^A=G7GP@IJb1WG^=d,:?],deXEG^^
GX,U<RSg)[2^Y1>OUEJXf5Z/+;ISbUOOQJe(JPB8P+C1K54K_Cc.6<bS^I6\26ff
cS4[K#&B(<g6N#?0?f2>08TV3.(cg&=T?(XGDN9?QX,OUE+4HH6SK+gDb.77G/\)
4^.,-]V)U(P]ZG\e1-HK9TV&H\^DRSJ<FA0J[fG[C4L1ACV9G^#SBP6VHF6b3B^4
V31L-cSAdc<TZa-:51SGabBRg[MGfBJ;?$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MT25Q_SDR_AC_CONFIGURATION_SV
