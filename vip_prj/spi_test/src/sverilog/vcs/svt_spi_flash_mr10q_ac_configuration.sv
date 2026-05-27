
`ifndef GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Everspin MR10Q family in SDR mode.
 */
class svt_spi_flash_mr10q_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width durtaion.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width durtaion.   */ 
  real tCL_ns[];

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */ 
  real tCS_ns[];

  /** Minimum Clock Low pulse width duration. */
  real tPeriod_ns[];

  /** CS# Active Setup time  */ 
  real tCSS_ns = initial_time;

  /** CS# Active Hold time   */ 
  real tCSH_ns = initial_time;

  /** Data in Setup time   */
  real tSU_ns = initial_time;

  /** Data in Hold time   */
  real tH_ns = initial_time;

  /** Output Disable time   */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time   */
  real tWPS_ns = initial_time;

  /** WP# Hold time   */ 
  real tWPH_ns = initial_time;

  /** HOLD Active/Non Active Setup time   */
  real tHD_ns = initial_time;

  /** HOLD Active/Non Active Hold time   */
  real tCD_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_max_ns = initial_time;

  /** Minimum delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_min_ns = initial_time;

  /** Maximum delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_max_ns = initial_time;

  /** Delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_ns = initial_time;

  /** Minimum delay between Hold de-assert to Output Valid   */ 
  real hold_deassert_to_output_valid_min_ns = initial_time;

  /** Maximum delay between Hold de-assert to Output Valid   */ 
  real hold_deassert_to_output_valid_max_ns = initial_time;
  
  /** Delay between Hold de-assert to Output Valid   */ 
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
  `svt_vmm_data_new(svt_spi_flash_mr10q_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mr10q_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mr10q_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mr10q_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mr10q_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mr10q_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mr10q_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
:[)?Pb/5,fJHEM[:2cfd=AK\AB:9(ZeHLF2ga:=b,/ZfEW/WU?FZ-)&KTAdJ>=>-
7U8-5&1,D,X^\E_;AbYf47O[/Ed4\:(UdTBg2\aC+IHD-4CgSO6gD/cVRP-EYeCZ
L.XP0]H:/(/PZHF9&V4gN:OLM4]geC<<<IC[WVL45>_UKWU6f9(W:>A_H_7RNf3a
SBI\dWKJb4NV:6L^K2\I,@SSIG1AcRJ,NQ)LWN?#c^36MS]Q?[A95^\Q/.C>O9ZK
,QT(c27(1/_821aXWM(-SNR[&M-GF6EA[S8/J7O5__H5.4+6N4:E>WAUW8TAR,.>
2EF.&](?:ZZX6D:TR3:JeQ:fI>CFG9Sdc79;AXG-]P?[4G/e60g;F#QIC^4TQXGF
e;C/bc5V\V1NU-2#K)_CYUT3P<Y6#KET,+T9U7-N-NfOI#GcI@-R5S#DH=gU71C_
7MJVU81d61_2c,5B21gV[g^9),aQZ#NWbH\U,LV<9R8]U-cDd&&41C4YVV6#0?\#
Yc\W-46)KL37D>2Y;0BZI\HON,ABS^+a42>KNdIWK#Sc22/,+>G[LJBC/:MMfSZ<
MbTbVgJYe,,?3EeET.#IXQRM.CFAA06@a,D^;6KFE#5aM9IMQA(c,:^1aXHBSX.^
[V;-HOTV+WJV@^4BccB_,P?:>N:5@F8VJe_/7O5H^EN]C^.e87BO1OU(.IHV+NV2
+g9VPL:/K<R;LdT(/X9J/NeP6NMK3@R8=#9YZ.Q(+CS;#43YM]:5#P@e?dK9ef=SU$
`endprotected


//vcs_vip_protect
`protected
]S6)OL92&caDd^8ZgX>eWa5.L]^L+MfMO0?JJQS_RV/C<+_>?<VL&(b<;NRR<LK#
^7T(MgW9egC\7Zfb9B9A;I4:Y8EJf+BOIKfFGaRI[M@P-S3SBLDVO?ObaW:B?6<&
ZNA<Ya/30:Z<QZXgB?([XA@3^&(]3<5L5HR5\b0bfYYR[3-(Bf))_A9,5?>5T_b6
>47KUY>)21H?L1DV/FQRg/]79f+2LGQP5);;EH0W^#YS2+Hg&a/^8@Wdb7L]a9HG
,E/]^4OdK&4_XZ>,/6I9b^75+2??G1/FTUKM1K3#cggCbOH?,44+#TE=Qg5-NcBX
/a=3&CR#MF#Id2[;=RR\A_aLUINY;WR#)P#TC?NVL79[+KV#F[T=\78T7DaB][F&
;CI8[V/\bODS+8LYXb\_H=]13]?c_Q)U+0GHNg2JdbA,9<<=?J70TFZ&E<VYaHI)
K=2]2fR-dYH8_9<.,4E40-;a#KX,VC&7Cf)^GS@3P\=16^S7f?ed#:V&DGHZ:<D6
5.84E&IM8D]EW0P-28^/T.Kee@#@4.?X/a1Y:P4O8WFe0_B@F=C(YKD^Y^)+]DWe
J^0T0/?/Rg6?bg(G8FO[B9@T,?9SX&=Q>MbDd_LCb>_VcfC31fT,fEe/W34[C:,1
PI^.SF&/=9GeFDL<I_?:Q#>IPG^A8YHRW?.U,F#YJ8(@W1Ra^Y+1D]B7^AFG+;_g
XN[Y+LZ#HGG67f,C_8-1[=_^dW.Dd)B-aKObHW@.Jc4>YgA)U[OSV57FK32Q]ZgS
ZZK,6(;KHbL0NNF=b16(?0WQA+TMfX</,RNgM;e/V^?<HFFD0,L4CBFP589:@N2=
@bO\W)9c.6FdPK\L>A:EOJ9(9TZZ0@@JNI3>gPCM2;W[8B>).MGdfKNPM<>#IZH6
.FMG81=>;6c/+N=+MCdK)U#(Q1.eI9Y_TFAP]P;D?-<6WZZ)\aU=[M\\8aG3d\-O
Z;T@&:NC>2_DgQD>a&]3=C[.(-Ed_bQ>_6XA/88ZWBR2-:<fEU=)a]fV4C2]+]88
G1&4?W(gK]+FI#J((a&38[<4S?GN4YaWO1Vb49C;2ZF=@KcLD9^RY^dL@N2OO_12
V#DZ6aLBFO[g1LB]]ZN[T8Y//M5A(cNI.]5(4G?;3GO5;O1g9d8[ZCE>#(70=H9V
e(311(5T.-(cUd4,TMUJ46]g-b#/:80N\gMC-Y.>AA>f)3Ca9Yc1N@QWC8R8:)K5
Bf1]Jd3JH9J(DE;@X9IN<R@dFI#KC]=B8=?T#dMBI3aR?7G+>KfTF>BVI\Q7[PR7
/U>NB93<+:fJaI)\ESd>X(92G>3@Q5P7S>9d<HX6;-:F\)SSb1L0O2cJba5?O3XS
G1RXbHBF7=[)DA-d_JGC\RN2V3-Qb.U)M<QMQ_H?[]BE5>./_Md/])(A\P]IV&2K
/;a]f3(586:La\UBM]U8F6JSD+.Q?]#,K6g3-RKN(Td_PO#K71:]a@-a)B3gSC<\
9:YW@gRGL5d,0<>:[6/=23CEE/@I+=NYMAF7Q^K@O>GAGMA2D7gaXQea?GdC@CM/
aba+;[YdX5PUHZ@]<[I=bO0HU+9M<\3LPEG;(?FHeZ3]N\1Q\/8\fM=&S5+0=N&V
ZJ<bf^=Q6[[FR.e2J@[95J\MB8d2I-gAR[][bJJQ&]C:E\:N&X3;-44Id.;Pa6S7
bEB@OWJYQNK)V0H]]c.W5e^1B?>VUD=ecJL\<Z38Nb]AL.ga2BdM^J;b:H&AC7N:
=<_&6c5Z5?3+9^C8M^@B5\A&98C0:cNA9b2\fVM(L+CURYS04>U64QfC;P?IfD^c
#/D81Nc5N]C4-1@DIJORW^?KJbK<0:4PZ#QAb_.)W]L?)6bR#5Z)#N(OaRY[+_<;
I-[+F#TX\afM1QA48GeKW@C+g5UCgFV9E6>4AIU8(M^\dZK:O1[5<g[<L+fM-c(?
<YMY941J2TVWaW=TRI<4^g>2OIE&(FTG:c8g=ON3g7,0_gg9]TeJ+cdcIO43G68a
1C5\]FF?Sc33AB[HMEW@a(=@;3IRgY>NE9:22D1/E.=C<G9=Q/@[6@fG/8J40Rg;
7b,@3J1O5QF;d<4OKUbWU<S&g7OY@.ELSd5#/+?QeK^-9CCVNM@)CFI:@F.&X]Ud
fb@YQbF]PRHg@+efF/]8#FD\XSee)\1]A,8cU370Hg7Ld-.?S[.H:+#^2TeGUEU[
ebfUV5#N0/?T61ML3>+aE>6GIX_A2P#^W(6MU[\eM,6;IJHX9)-:G)=5U5/]Z=a&
5[]18b_J?-K0L0K\RKb37^X5--3[G+;fJ\aI+cBE4;U]b]#2NB/>K7>2?S+004ZL
Ia)GCCfdgT^.5bELa.(Vg[g4<=6^C^ePWE5b2a^6MH\?/M);P7F?N(FA4(\MeQDO
bd)RaVC);[SEEWA=)5H>d2NIEIL:YH4E>)<_S5]6<b9[IJ/4(9g?7>0ARBYW=8<\
67f>HN=,01<;I5U2^^/E8T[WE>QX7TB>I6<XMTXcU#a^S5N.-&T?c07P9dV[9I^K
>11:\JbK/L]7R<&E8\90Dg69aV(T,KW^P,_@acO^b3eF]b[;3<X/]\DbTF>HCLW-
.2c#^cZY(#Q6--1J;XWW<+g2.b+(6Vf,,Q\Z-Da[,Q]fG-G_/PKMX_?D_Z@(:aF]
C5T2>C->WFL<6cS.e0AP>,EaJ)M,C??J36G+/FQTCK\Z(7?;ZJW)HL=DcII_(SP=
-GZ8&-A#=dgLJE#WA(ZKN,9]@YcP:1[0<U),[T42Sa0.=0]<(:/X7/^]aO(6GF)&
^/C&^NH0>1ZH;9GLd6+C5WN9cFc7LP7GF0IgJ0O<Ha_gV5<HB.Y3&][Y6CGD4J=@
6&/2),1d.JVRDIe?f^+>1\d]0XDEM?]8X-4,)g.+3B@<b(YSR&+NV:5cIV?a5@VU
V^ZAD[&N,.TMa_AVU-TU;7e6MUU1W?L9,_WEf@<K3K/O;KZ98D7J14AGK]D[E&=[
OL@39a>>NG.A<8Mb/^+c;g3dMVg4\b@8T@E8)/LDMQBXXaY/P_Q2M<gB\+Q5C3/I
.4WeY7BKW+3+/g),I>=.<]O^9:VE1OWL#?c8-ba7A;g9(&QfI1-X+7HaID60:\O4
4.Q>caFSf.d8@6K+557@4ZSBe2a^7J8.NU<)a?CN.8B,J;JZ\1LJPb9(.XX1Q)5_
<5SJ<2<3;;T\c:G-7U^P,=2<V1KJ#NG7[[[VJd_E2B2G:?^<JMF;T)#LJ#^a]D3Q
,(IP(S5Z<-fW2CBSe6B?^S;H09dI:YVMNb/#4TQg+Q/BWL0/=__d\2:A948IGcg&
<<,\_#g5O)\-1dN^Z[)/RfO9LP0;V.2;YV230dCH=PFSe\W8.;PI>5Q:6F8=-)ML
U]^0ESQHDYPZ+DU#9@1V,Y2>WeFO@6gH&0_ZO.</c),A:LY,180#\Y.OLX0K4>@g
N0VbJ&]\_(Lb+E:(8MAJbJP4P(1<fS7<GQSTU1#S@^.LNf<>I=2RTZa_L6g@MX=E
T?6N.+S#3KK]GBSQ)cDQP[N1:S1@58H87e1/B0_40aU@00Lfg9ZNEX#KbWEALX/O
OPeW:=\cRBM5;.\;[\_AB7]ABgg1R0KP\63@;-C/;LQ3?fRVe7Q?f+\\c4,?Rc50
8GF(Bc_ELN5E#2(R>d^f\_DXFKTIgcE3aeX]?b4.TD0Ef:RI(^IG]LdOQHDe#0?2
QU2.X?1S6#\-KYN6VS3B.LH6&^@N++V>?Q5GeA<Q<BIGb6d>+\b2FO\#2C1M,bB)
26Da5:fB0.5+A[-.BE&d,(4@BM5aGSf=NQ[?<Je3D8V7:bSYBHe>gG\\C<9JF5FY
bTX;EVRJA6(@I\fU,dOGb<5Y(X3:fJPdf,GSA.Td[dCUWH3).I-;g,5WRN/;Ff#N
J^>D#Y+7Fd\[@/OUROY==>eYFJH:3W)\W=;@8.^6O<@3GfZ?5(C](6X9\5VH82)&
X7K/8;X.S;V5RKO./VTG3cSL3=X6=S/W,\R2K_N/L:6(6JT_1A4_7^/>W#X:=[K0
ba9HWP(fRKTM1B-6P])PV:)T\G85N>aDICK2?.WM=d8(W:[=@:SEA7Bf7\#NT4f8
JR;V/^eKZLY2?.VC_TWM5<7;50\IL_OeWQ4\V2-5.=J,&AKcc(CA\^7G&/:WF41I
TV@X1aG&,25?G4K+cd-T8UQ)YZV0:(OLH3WL2RLb0(10+G^7PMRQK@b9Q;1[fQDS
f.VFU.<<FI9e,&/<4fc5R)_V2c^<5XL2^2S7Y0#]5gX:(;cE;f+(VEeR(8XPSQEN
4Fc?_b#,U>G?QH>Kd+&E2;[UBI=@&IEg>ScKX/a8U]7\aF>2JPYL(ZC@3E;9^=W4
WRG.(8GHB.X.Je4g&2.#eIAd0].1b;dcbV=^MfSO/b5R?f\,bdKHH(E,;LQ(Q^(<
d>&M)Z\Y:G)P11=)PTFORPACJ29LJE_VIObR\01F^3N-H#\>ZMMYS(&[UM[2.:E]
]6([A9A]LbILaC<aEe(B]BDfA\EDY@Ac:KF\:g;D(@_WW.Q81D>M-\1GBf^W33g;
dZT.,U6I8&V8eMYfb,]0dbBbbK3_UT+WY@TM\?b;QGf=\Xcf-eP58ORB_3#5gVSa
.Rgd\>8&_+eFL6gSc0dXI(N8@+#e0NNQ^+F=+J1Q,/S.GL1KUNReU]cR(H,DC,6H
&##KE+S:Q>]J^RI2\PNdR5Y]#e<(Oc5JF3BVQ7>.-B98)H/2AHDQ2X.FF]_BSg6-
&10=Q36K65JQFFa?8-EHdFd0+01I(1UW1KaJ+A?X4C.#BIeFM+YVeY@\25U-FDCX
B\3eK:9:@RGg=DVT/,@?Ve-Kf9dGeH>eC.@<d;M&ROKGH6+D)W,S)6D-V,,)<)Ec
/3QJ4S4cE361=^=C]]Ig/.2baL8e/XU&Ef&@2A-8OgR:Q).BS22P;8_M94ecL/5#
NXC@88UVJC<Xb#K0?:@/dD0XF:gD_-QL>5#PbIfH]?:)#TIa#+O1XbO1EDP(6RX^
RbS,<O)#I6Q-+4X#bHI@X))FSF<\8&LQc)f-@Z+@;[bcWH_HLTHdNe4KFYGcJ\VO
JI#6dQN)Y/0&e;bd-(BYAYG1OII5IfTWT&=38,aB3J&9A<Rg5C//B[TC/JI4LT/D
1?5O\=X0@bX)AT)AJGc].KV:&TB\(:B\C-6cMd6-QNFY_]8?ZLHI69VM<.C2E,GR
FC>KSVe2-UN<fdH^/POSF1((/8YIH1YDW\QAK)^eGI&\LU<D_7C9<VV5Sb7E<bI_
RJ4=YUJO_P8]Q&Z]57?T,E^B16L3MbG+7.^QU0O4)PHM,1&W;BgT=[XA3L6/D8EX
8#3bbG;59@#8S]:c[1CRO@P:dWPMGI:BKL2VMNK81/(@4]MNd.((0WRS\RYJa(,Q
=)59.Q[[D(Sfe6FANbOOa;.Of/Sdf^)NM8AQL#J2=9?U;?fE+PYdE09dR#Bc7JGV
0c?>9<(&@\C>V]T\CM-=e.3:@R#\[DP^A24-@3?9b19c)--OFFXJRVAV/TF-MNQU
?:Z(3S8_5,30,N9[+Y+V1N=_HE14=24<4_>[?R&+aD.9?2@7<-F?9SO8Z30<\,&;
MEIN_BOG&PT2V@E;ef,LBOP;(&J(N]T2/A46BObU)5V;ZdNB>SH_:edTGGGQH)N1
/=5R8J<GUgOUPD+R3ICNEOSD19U5dPG2HATS-3:/U[\bIV=.6N.:_cLC3BSS--]>
E;QN15)\V-\(6,e7_6DdEc9Q66)#T@\\a\<HP/LgVW3N46G-5NU]cb^?YI8cYa_7
WQWOdY+O]W6RNaA:>V392D5F@8_DT2d;Td2d#:#PZ/9.4AV&CPRSF(^Eab?=XW^0
+M5)?[M3a+1D4/DTGd\f2Y+_GT+d(DZXR5g@&d6?,&?R,\O:a0/)-&YLC7=Q-O#a
GKBZ1D^:+-JGPL[AD2.&;QU\J7AMJAI(_K:(C,Y4EF]3326NbTLVY4YU):S\6EFH
bD49d3b&RV7DEG3C:)P5Uf,1<BZH^AA?Q[.7<YJaLXC/gHe-1edVH7Z7)N:I_ZBR
[<aC;#UBF2KACUDUbfdMIG37#]^eZ;9G]ZODDHF&-Cf?W5T4Z;S/\Q\GDG<81._A
RJ]g-HG.:JFC+KV;]&SXNbRg]-EP4cbAfE_719B&NCeN?ZY\-TIcA0PKD6159A>/
QR;WTIGI0?+65)T9^I1EZX^AW[U?Wc=]0a6Y>P?2\2fYJNC7Z(dW1dF2XNc]3)9N
.DT6;;=>H+O87]>,;>ZWIMUde=e+Ad5Q75SdCLYa0baH+b>MKZV(c?A@2ea5M62,
,^_TW5-N)T\_6#dQU6Z(4?_g>cOLK\?4<SSdH8@cM-Hb47&?1a:X=P>=-5)VfYE?
UB]PE&;1[5d&aB.G@eH1-P5K#:Q(2K7&P17U1cE/KS];M;S(bW6GBbP7.9E-X^7]
OHE])/SD81R;DH4ZaEYf-_G4&)S-Cf6Xc;H6>KWD/L4>FFRgVR.aXRUSS,OYX3RN
Z_:Ub?_7K<;T&=V_M\=V[LFWD13T#F1LXI83c2#Pc.<YeBa9/26f(eYKV;3,BTa+
ZBfgA4g5)SL9.AP^W<4ABD;=Y2Zf2.KRHgR/-_.KBBDaJK[]R\,FS>1=;^RH564:
UVf9D1_ERT(L5eF/XZMC)KC@CGG4+Q.S;FC8+:U#Z]aDGL;cYYZ/@\A^(O<.e0(<
0F/7:d4@C8f=[29]egCJI6=.<FS(J.LS?O^Mf&H6N)>[7-H=;L<?YLIZSVX7VXAT
]NZ5)(a(Z==IK=YB:AY7f1HgRgb:#(gaUH/84B@&\>/L9A79/@[((V65V(Yb<(dO
_)44fI83JgZKBPP<6+?M6M(BQg<=bU2J>?9,#@J@1(R9)HII.8IFYCE1E5?1f[d;
Y>4AS[:G1gD\J(T_6X[(6eON:VM,ZP]\[/]N/LOX9e&E_+5G;FB?61P[2;-/<a5X
E]@R)JH(c7QT5(:/ZH=4S=@P0W_<[6&0+=4HHf5KXKVH-\,C05IX-F/]VO;#9]@#
5=eX--B7-??#:fX4]WM9_BgW.dOX3/bg</F@-_d4_B^6NNdfVc]NbI/^KgHgbS.C
:.NAd]1b\-C@b#-T.eLF?J)-I(ZUgIYD_-_bN/YaNfZ#>=ET^4?ZcgDA_FI,R6P-
XcODG[>J2Xda?Vf#JSa#da4\LUIA5X\GdYYa&;_#X/L)ATJLE=/&\@>LFc6(cA:d
)0W<BDe4O^-(a2-(<c(c/HT[T7Aea#93/&^DWX.d+B-+T<]5]]=A4F(E8W=731=E
ER\]U]([M)<d+ZK+@B2V7DY6Z[d2JZAeKI_1YBLdf\6AaC=ZbdfdI[/NF?/#F#(5
C7\H\[VQ1SaR+\fNJ3WR#V<=I?2@T=<90;0V\Y5(dTCD_<QC[S);X>F[f^g?MFG)
N#LVIK;Y)/bGe4gX;IZ@\V1?(_\2/WJ)R^HN/M(R:>X/S9.MYR7b>LNQR_-S)&42
gZ^fRA?R=MgYY&0JIK.Y.2Yg9(\[0Z,1F:TWcH:F7]5aRcA+&TB8,@/f4#N5SC))
55g-.b1e;CD\@(6_=/&@GJNVEd-WNRJX7W47OG6J/:\a3SI9[FQRE2<7F^I2fMPe
(]/=:,>^40JccR/#QI/LbIQ_+M8e]:5KF>egL=0ZYDU]A9H(UJ4?,:YcQ;F8(G0G
OJQM\1JJ9W-)@P;,d5(aKI-1SKZ@14c?6&Mg42bdAf9QI9N)X:NP/1QE4T8[BBbX
TB4Y4FD\b:O7D4Z[Z1@I95#Z]W;ReA(0E@&IF]<T74,#B#0a:A\L6P(RNJJ\d5Gf
_aNB78IB>KAR?QO2H(@XIaGU>?NN8DS[2IR;UOZ7.[8fSe[(81c^a7]c^T+bKUC1
F-(QI?K_@CM,\8:TcUM5N3+NNQ-XM+G9[>P^f0Pg:D<X=V<I8IA\G7?@[WUH@G5L
PR8W==P=2G8S@O9:81#>]SeQeK3\_I3Rg?&<=U&)W(/P)V5&^J:W6AU\H]XEE5b]
//AGZY:]6CV7@Fe0DNOQe(QZeO;Wc3W@SSTVV>:^4L7N;]aT>9.#>b;4(DZ0X?9g
_@DcY6EAae.DT@^A^:0f2B3XU[Q[Eg0WGC95[8.D=O+9/6RWe^8EB30<BT<ZWQ/4
+AC0=0=41A1OH&Rf-/.LTT?@/T3R=?gQN(]>/.AF>C9\)1LPZ<dS<]RX_3:]GT&2
dgQ_Df/Ta#&PJW?<DH4;f4MfKU?e.cGf>_&:6YFZJA.d895<)BBb1e91E4_WDMZ4
fN)RZ:(>+NGHW(.6:?HW@W/[0YKQ3&e(NJ:]O&-0V@\a0,IV)Ba;5H;#?#3@Og@.
OT@RTEY<^;8/MA0=1c-<f;:SZ07?93Z@GU[8=S6:+c9N[\Pc471:0XEGS@\023L4
5?K^/^\?D#[6#FNE0a:F=OYgCccSa@,4SM+;AW^e+9A,RM-:3K;aEVS0W8^6abS5
ZI>>aBQJG5;229>Q-\5I+?]Ec6[bZb&6)]gf_,GE)5D:>CT88_g21@>0<8ROYO\=
WV\f37](=2QSJV[IPafM^7BgHG0&N06F8._U9>1JWTK(II\+3OCBO]MbT:N[C/Be
-,\VJ4Id5J,80BI61?[8-7-QcYI@fW-C\3T41I/[]b83^ZGZB1_0LO-H4M3e-RK]
(LS](cQS)4>g_&a)9UL\G,@-E>I1II4(a\;&+_R&0>;dLNVPE1^]RQB4OWAZ0DF>
9G&>fY&\8R(;<9CLG_R^VU<1TJ>XMUJ\Q9NG:W-g(b)J[J9E9be0]/DO@:3Ea?e?
U212UbDIg)-#HZcP0[-JaDM38.)g=(;5C8_,U6>_6A.5D2<_L;[NRE+X6SF3UUSW
b;>79g.fVK<Gf+fgQJPgFcB4QZ,fa-MOUQFNGf_D_;>cAUVc]A7c7U@eGOe[>RcU
<Wc#W79@0#L3Xg2\77JMO,XgFF8IR>;KLK1G6Z5F,&?X\Ia2e&Z]8d1Z8HPU[>ga
A.g94BP<GVZb@ZK+A1R>I/U>J9=E:0(gfL(JP1>70XBg9@B-QSX>FZ+;,>T<D2-#
<B32Aeg9GH[2;XR8?^Q5Y?[OB>,cFZ:aa:R,MS10.Fa?\<BH+P:9E^H0=/eJ,C\@
]ISJJc)_2:G;aO3X3C1?7,+3;3#6Ad43N)9TG;JQ9BF.VV6\g7.?<DbAP^G5^:+2
abT4]F]bTLQUT+_S15:c8\#)U;LOad7;J79=;:0/=V+/0f]^&;1G;;IYFJTe7(Uf
#[W3/_62:e;Z5GE:1Q&M+)?-G>P1<LH^.S78b#LWBZ5<Q/Db&>/(+cJb0AMgX+Ng
C<KZFOUfBT-,e.ZbdP=[[ZE1=V7&,e(HK1/PB:OF)8Ig3IULE_61T[P/56;_@SNB
F4\DXCcJ9e6R2N.K4\BZ.?D_C/dJZX[IS5VI(](-[Q:;M@HKBCM5O7?fS/Q.3)D_
RMXQR<[eLe+S:/a4#2+YU:7@DO(Q[EVQMb,XHUcISZ<?A6[b/CHCHM;>f.V:I@FI
V_M9@Z.eM36CLR\P9<-J4<-VEZ1BWSC7/eE3X.6a44]^&G5@=9&E.e&SY0]/_[c2
-0V>,/P.:.I?(>U<VP(V,D/(@B+-OOV1IWJPUB@PdW4cLX,#fAHT\7ec:\KW\)9E
4Ha16,1bc_&CCTR15C#S71/aJPZE(P>9V8G9LZSGSC;:TUYJI6P&,CFY(_8)HL15
T6cLO)9P)WPV)6dR_\XcYfbP<,0_1d/\X7]+3b\_L:>2O]OMN)&BfeXHRfJ<]N2O
&Q-OY>14/8a8D<7I/,ALaRMEH5X@&a>L4#A7ZEgcN>\g1beJ&3b_<+UcA^Z\.G<S
<&b>4=QPS#+@RI-gE(T?4<<N9Fg1RI?_8_YJM0O0ef08]F:-)+5AYbgIGb:EYP68
1OQc1?5)@C==L[TODK6d\46H2?M4#&.LXEIQ6.e=DL^J7NRJ[./QR[]NQ;@&D_J,
PI(QRgL:&4UIQJ6Z28VXV1:5QN0[7--/;Z#<JcP4c\+gFe?XR@RIfLLEW6QA&L:C
V=<0&c[++?Sc\d,L/[D4)3B)9T8\J;>USVEHPP>fgD<?B&K34/D^AX9O9NKKFf)b
><3S\Kc(EH/YS]@^Wb(H##d<D5eg3dfE<.I91cGe#^./)NXDS])>5g(Og9D5+Xcd
c<:YfXeYH@H:YX.);CM6,fSH3/8;JJ^.2).\NA4Z\=TU@:=,Y0QCRf:UO2g\>cLL
5<NFY3f/^M)H/DeI?^DZI0H#ddLQQ<(@ITRMJB+IV=#_eDXc5EIB>^\WN;NYX0N0
-.I7D?#T?bHfA]b/e69(\UW;0T1KN?#1&7:2^Td/e40V]:D14KI&Z<He?(0W]72a
1.EBB.W2AJZ\3R<SV3FZ?bdB1R__a=[[C8>(;Y>:<HJKAXG/3QZ;BFNJK2O4:HJ=
;__5b\//?EYb7ZLO<W2Q8fS.0A2O(OJF-X,YQK?VAD]F5d8@I@I>M];VP+/Yc(6M
[Y2bI[;>CN;A[\6dW]:c5E91[N^-U,B&-;01gK2C;+cc0?RQ,.CH_Z:V6Y?cK[Y+
KRN?-/1-4^1DW+=2FC/##^f0=6=WGb[#J:9\7;/6f9#c[L&[15+b(>bTM&AA8U1W
;M2+,L->N^LNQ9+=Ya0(&U?fKdbGI,DS0\Sd5_6c2_DRdJF<Id=[+.FeKA?\6d[F
G.CBT&:;H9O5YEF.XNKaQ[)cg97e/>;;[X\3PCOOdY2^)8a7V-)I3>?d:f&9C&DW
e][DKb7IS<bbZQID=KfZ[2A/eS50-_.,N5b&8SB#>(<IeL)9/E+>1[7[gfV:/R1T
J^9[VH>dH/Y(X@9W?^/W^BCW=RJMC?\@>Z]9A3Fba8,d[M0W@S99-]F)F(@#6P53
O&<X/2DGg@R-\YI/W]7J6f]/eA1A0OI4Wc99YP^BOdV)_FUQRS]8DFXPJJ7bT.RD
6Zb<=)N,d_La(^ZWM._+X?YO+7I<JJA9aA@X[eV&)B2VF(RFXUg<2fF2X\GHcFV.
ZE]#J;TI..(G\H-([._^12-=(>6UV#JK#8PVRM_\8\K<4.(83E,W,aZIL<#DK1\f
+2U(Y6;PgIVV2B1Og_6U73QA[ceQE6VO<S:eRY\ON=OU8P<T26_-V&T=5:/H_R/Z
C+7,2[YHG9P+d\I4ZYSc;ZJ>2UPM<XCOVB\=^G7XRGda6MR\A1@HBPG74#VaG;JI
Q@f+FcC)TIU5PH3I@@(I5AU=;71./6XXQgADY)3:NI.bM_a>/R]T&LLbU>OCV12N
D6S[M:&FgA)Q,/(0,eU1=A@8(+:HL3I-Z.>-D0WI8SdPFc^fg]B.#5,;MHf>cgBI
\8?.D>J[+=T4.>/1_c48JBH6[aQ]QAe\.V8197VKdDN>KB#=-9T0&a3fH;Y@D2(K
.U=@.M:@G7V=,\8JZ,AOF68d<K8_[A24DLaV,_VZGS+2TQ\]PK-aWOD8M:)?0^;O
4Q.QP8.Q[)P+7[K7NLIf^8T(/WH6LD=+IG_\0=(BI9BQ9_T-14YLTVU4.91bdE3S
#EJ^dUC5G:FT6ag-;@.5g<AOa1)[RgT^@c2g3+_A,P^&JGCQ(U;M=)IH04L&:JOE
Sg(K\g@?X]gFS^-#+_5W.dde4F:_Z1(^\@4R@(GNZSK>RX)N3TPA-K6L/>BT[N)g
:7V5NL.aY]_;.d;QNH(11W5(Q-0.?/=Q85_DYM4R+L(IYc&If>adVPUVD.LT)0b4
;Ra@3.5STTT44RUF3OOH30cFOJ,5^PfG^K]#b]C_/,4/=E=?GMJ\gSg5L.(-4B,^
_U)W/<OeB08Ag+70Xa+#a\0,/G)f?=U;LWETS/S(7d(WA0-#V8ZH12dU=@(<E:0c
Dc<^&OD3Sf#[IeF/=fC7LI]0V(F/K#4Mf_^6@(A:SEacK<_U6:^_DFC8cFaPfJER
1FRF_J:>B8[cUW=[2371EIPFM;eX4HLa5f_QAg\8@;[T40KeS-S<[G:(aQ0(D2JZ
=KQ<I?X.Y:)LD#/9&1OK<W^0:5QbD1MZOY_HN_]+NeQAO:-D=b:=CT::B=K_J(_7
^735e_Qa>6c(9P19FQTLg20CF1UO0a5)c]DRZ_d5J-1fH+L04GN[^6&_CecW>_+;
SLVI#OXYQHD5(e,OX?()H:#9SMG/6gIAP^KFYOeg_c.DPId>DC^e2F^.2,aP<_GS
Y8QRPd_;C4MfL8_>TDa,>.@9a+:]N?g_bX0N)1G_fBR,cGDK32<?_DOGRJ[]c0^]
](7=,DDZW;?U2_4XZQV#,L0NUGBF?EYGH.LgJULM)Rc:1;SD#;[2Oa.FV=__L7Y_
?X:4g,dLSYTO_9)aKGS9(KJd<??CNM3-3T_8)DC/2&A9J9IPA\5B\Q[.W>g9FTQ2
/Z-g7\)7Q#.?CTM,Xe4gI]F?[9g^DOYMO#a4-3^+RO53OPe&_LdG)^69,S5@/:@)
A:WMaGI^VdM2c69B9LT_6.fg-K:QZ_YPAFKVDP@EF;OC/^\a[^7\B&@JN8/^RC;G
\;0L1QL7KO^\L5Q&+&:?W=@c60OI4feZGVVbW=T\>W/;?-\Kce4bHLE=N.fa>,KA
Y3JX][DQbUOTZ+L<f73Tg22,Kg&fD6D_RJIT8dAK@?E>CQP_E+Q?/R-f1.G&K6RQ
<FBTJHW[;d6.>AcK4Q^A\4821eECER7RKA;6eNPdfP=X4AXVI9L04I:KMN_J-MPR
dMC.M.:SHRQWE&H5_.E^6e)0dIRc/e<;2e6=?2P\/JfCH?PQgfQAM;T/R<8JF&g8
OU-b/9c^TDTW0#)2g[Fg(K;(33(\fN0>KeHP>1=6>/2QI:3g2/+GB/9KPdb1G28?
R2Y<.;-?[.)+XL:-3DK8LU92M/2&G<T,(Y\=fJXP5^IPCA43KDS8PJ_I#c:_bAMF
M8?@192R)DfCC#)]DTf8E,]M^WLS,gb:C;3dXHgJ^^4bI6AK[;b&DYcF5Kd7FYZg
Tc[O>+_Z5Pe@VML6A#bb\#e5;USSeO+;OD55J89CSWL>Rd]TM;@cTFLR-B)QZ,K:
9AS#R]1QA;cRbL.3E4@bV[JBAFAfLBdSMA\IP\G7PP3=\A<1PON\gaT;=b@<VV5^
04Y#A;XVXNAIXcE@GYY)6C#=aL?9V3I#,AfHTZOD&8NA60PaGQe_Jc?f8W_K<cad
Q#?>FQC_>\@8bIXR7##g3:eb<2IZ(0cc:T]VJM77f1VW8Q^(U)Ia>NRD&,+]#E36
,DFU3A=Y+]ZXY@ZF8I<3S/=E[<aKfePZN/X,@RaD.=2F<>e#M,?HC<6dWX+,LA>H
:).g[ZJ-GS+X3_R]4FD+]c[b,2R0/8,#U_-IH>[WaUMYB\gHZb3?RR-D+(@5c@Q0
I;aE>I_e/^)GF0.^;:S4_=J?PU_L3#fdZI#;X?dO(-\YIJ19PeS5+V<fM2SKA>L^
353-fWIZ^T69E[VF9b):B7U,cd,\GB8E)C7[0:g1Yfg;?\7S?[Q61LA#cJJ#57YE
^BP#-TM77PZOD7BC(66#Q1@EBHF<<,#>=0F/4TUJT;24=X0cOQWAB.P9VB,JK670
VGV/(U<OLfM&1J?6PY>XRMU;_f2G>gAFR6(UZORP39;<]&>a6\D>3/>_QG#?@Gg:
.+Lg9Z<G5aBP/#g=Ra?Z>7(NDGN>gUcVZg3S5\PKe,#@8&8HS5Fd>I9Fg+JV&0P:
8,Db>Gb5.QePd.dPT-I=PaeZRQOF),0/fP&f#>\2b3R[[3\[,3098DbgOCEeX81_
df=5[5V#3J+7DJ.>7U,<RE&6AEPKeYC4)cFMH_2Q73MOXSVW2PLbBW53KCN&&b?N
Z9I2&V[,:3\B^/<??AQR0QJ8gHAP\5AaHUP70^fDLUOP(R4-];9fMVT+R]^BP,?c
3/[&dY7)f9N.:CS+@Jd[5e#d];MRPI7cZN-\VC?(EWGRe>3G]IbJ<[#c?#06/IS4
C[,-F]21baN9c6+F87RY0^IPSMS(VD4L](fBF)H[(]POU?OZ/.N@U@INYb:RUI5(
O25c4bU>SX=EM,JGI=aJGR_IMMKQODc?ZLFYUWEOB9E3cb<a)WL:J3S4.\BC=-?=
KM.D&1]:2-89M)-?Z>-K[)/,G-b#@aa(],6(_7KU]PBC]b68Q5\G\,G9&:\EOG5-
9]S^PD01,a]]YY.Z2aIQHWL&2HY3+5Ea,^R27]7eR7Z20=C^+KHRM+2+GQ?]M&L8
I:a8G=1R7.[IVdDA_\&6Ud@6>5K8KE(P9/gS_MbQ05Y&\g7b/7PQ7g&WIJZeH)6W
X\S)30ZeG8EOK=/eDWB;8URGWZ4T4Q.g2.=AYfLL)feS8TKO;?gS3NN]N:d/J>QB
bH+dX7>8H[=014AZ32T1.H&A0N690OUI2;;#M;@ZR/a<K9/.4aM#PG?_GR8-[DPT
==0#8U_7,^-V#[fWK8<__6TT<_,N(SWadT1&]2__bYD0]MY#fbc&b[2aKFag8UM/
5G-VDcB2Y+L<Y9e_EbR<eMS:\RdAb^NZ_,HD@b:gZ/@1[;<5/A0KZI@XRQ_0R06d
g7UQ#S]#]^B@K0U;((>C^F#KD07_fCfBg+11]VT+Q72E&--N2V+\(Q>)gdMX1SWI
(3a/c2#Gg]=0K:,Y2/U;=QGgG_/7R5B=,FM+@,I_>_.1X03:(LIKQ&B-MI>-[Jcc
aM^((-cAQ.ELJV=)B+9dg0>;2[Q9AOS?;1S?PMAFXI>B:+EbL6^@^EFH/B^0.4Q;
(ed6FLcZfS:82O?L./BPX7YGJ/gSC,Rg^(YD^<LL]+MJ7>J]VA)QVZM6GZZZ(,a>
C\/@++K<JQ6bP)9&7b0,6f.8XA;I]F8b<W4N]a2FL5A:36U#.&6/ZQNBOZRE6.a)
/E\9dbE/\<:23<JERZ1&9P7PRL99:9#V/>WLeAeZ39=RIaa](6FF^G=4AU)I568e
cF(dY?GX@44\5_Y1gN?GC==WJ&&WPGRSZB\6>H[#FA3)cC3KXMb/S=;gU-H;&g]a
P\;6^G<@TML)6V\gE8,#+?;#6U+/f:-#5.O6E=VUE[_7-K0S_PYV5[5?3@90b7W>
d(-b_/(4[MW;:PHgO+849.;_[PU^L;)U:G396bd?bC_^178-9([M.FMdDD>#5:V?
ebf&eP>0=8fRLSGVQZJ>e?CBM65ORQDE50=V;UXY3#[7ZSS8&=S#/e))81@f)GH3
[Xee.[PD;RV^M&UA:@VLD3N]:0H[0@(.QC/@4E(VG-M+7\>d^C^P00Q+:Hdd:T4;
F^2PacP-+9>Q:aQCZ[6.)WZ7)C,d/,?6<J)eYMVD.6KQ=GP_TaO6)T(5C2]&<dMW
c=-OB)>acgIJA5Ige/:V>1X-B7TG&Z?f=f>B_/_N4V16^U3Ye_(II-c?/;)cWdSI
S_+>JCBLI<c8KOL&N?@E\WUe)MS<;4>S=IJ&1H7T^MF1..c6@4f[HK5)dIICLXF7
]+BX)Q[^R,>(:b_WS>UC@ZfR.^eMC?bFU]a0F(FPYKA&0eDUDZS4X-MW45_5W<F&
7CH?6+gNAfgY@C8X@d.>4d<#88ca0\;.OEB1TE-.8;OMG0Y=LALe6PYPI;-MFOKf
XK^4P\;>F?#(1\<Q>3S\\f=f10W1+8(c4O)_L_ML,(KS4[N9^HWE[@:H:Z=<>BCA
T4FK:9af(e9I0#7N^)-^DUHBMVdLJXCL]R\S04NfOQBBE2d[XRa[]8:A9DCgWGfd
C>BWa:<H2>?ZWSGYS/#.0)BLIJ,3NC-F=KD_C<aVBB;1)7[?MFOAEWPQL,<QV>JJ
74XWI1U8EUHDdHZ&UW/BK7-g(6TBUNP.C6ZcK.QR]LU4VR4DTR>M?T;2D]FF,[AQ
_&T_BAb-9[6+1WIWNIb[aEMBbcN/@?Y\C=S6;?;NBG0/Uf4?Y,2YQWH3#9-8EGES
1d+e-?cQCO>MH;=WI6b;d.<\gN58TX#c@AP/DRCZ3D@H4E0F2f&b2We:M>eMJb#P
45TC;O\S_HLFd7Y#J=7g83=ZMZ2=R/cF5cFUB]&FL<U[E32.43\BcL_c[<#cU/Z[
EI#GITC.P-GRN]=^FQ@;LMM+(&_-_;Pc),^<?:adE6LS-F#YVe#6AdK@HIb1VaH(
ZO8cSXdbVdX;_+bH=X/7#RK72WW0L&]9]F0D?SG4a27DZGJ9380CNF2.UD8EA5^<
L(&[EMX&XKUdOS:[-b0+J,2b9R(.5J+4b)=3\1/EC,dN8?<_2\=EZ)f.3gU^MG_g
#6ZWBB\49Y\=#@X_2K[Y-YXbZN&17[OA9d-cL;Q,F\8ZV^-55KQUN6LX\3.LYTHS
:(ND_>IOOQYOaLDM4;)1&K5AMVU_dY]A0[N8MFZf^CK\MHIS]#\E5IA+SB?U/c5U
(#K+JSOEAS9BIa)PJ0f[)5)D7RdELRT[AS=.K+&f[P2C6fJ5bgO/Vb370X&NW6ZX
;.AVP?M6EJ;YU#cJBED(@N&5@PMa@K_>dH)]#LI92(ATOb95<bg(cd@TRK9A0X4D
4daT#Z2UAT_bH(5>YY@ZY/TRQX7=XHWQ\PA/R76Xg=8D(S@LTG@GbA5.RZXFUWPT
J+V+GHCYRFA4-W013]P(V(e<4]7]A8-3@WX]SW?TEA0D?@56AYA1SN:MN?GFK.d,
/.^Kd?2)>#-c))0+G;KC946c9I-(,dYFH-=\/Se+IVPRfD;+&#@\NQ]94cC7Lb,.
B92K9>NX):?TH3X+;g?##g=YZ<?2ag2@fROO2MU^DO7P7fg3+C]8]cSJ\IT_[U>Y
CSC3?@e\J+65J:A-^7gbU]&RBRG<JE^RWQ[3U71BR7V=UA@dM.-D\K>BT91SL9E:
GVV:+P<>RM#ID@:g(ZOL);&7gI#DBN;.Ee41b&O\8BWXZ0Kf2aI;9LUL#0/g\H6Q
?2OVL7W4GZ[\T?Q7&[ZdQH96BD\D9LRCH&HJe7^]?,f[bQ@IU,TgY-A)=WWOWU/6
]e+]=[8g45,5KMd(RaS)-UUFIfdfMbM=9GY8:O/SZ]0((HRYF13K3IZ7N:@<Xa8P
^Td+H/b.MEf3D709&4VV?.?\.\VKZF[e7c#J.NJfBb9MZ@f3C:DBXU8EAYY9:9(I
;5Z90M?BR[:\cMX7C=+a>]fXK(_DZZKd.RAUS2>>5_>7BgY<5a#AY@K2L2P?5<MV
X&=IZ#T=BO-HQ(dO\_b82=_??aXE4QA5NC1AXB(:bMGC/U@O,(Pd<62H\EB:J;I#
_:)UXG<fAWgYH5;#@XV_PL6;SPZ+[9\Y@Ybd@XQW@4X^5F=L:9\8=^8E0W#U2bEA
:@V+2#_23.b#NW2F:Ze4>;6(?ef5X@a:XV=,4a,N4g2dJJV4]XOFFUQHWR?IM0Ke
PBHT=+WVS61<gEVaSK8IcfCN/a(JZ6[&58A9H[>;:R4+W3TYD@M;E.I)FU>e<Zb-
/I=E59\A2Y393S0C.WRb&XQ/Vd8+XdFHa40.=6WF4Y)_X>-a;1I<(89U=\2O,#P)
NJJfYAUR<R9S6E+D=P+[@F,(7UHZgJ0K\G\IUUa\NK.#]6FFe^AS;cS^,F8Ve8BL
F<V+A[)B(Y>WED)]M_C9EQ?fNEbG_:-/GU9VU)].I[)e-cA2R(F[#cY<T6C<5A=F
38)7Xg6&]SR#C6NGR(KaM/0J+7W(OgVK=1\P86:V,/(_9/5.-A@CT?Zc/^NW-LI8
c5M7DXMOBSO[H67W-R6PYZ:.15D7L^Q/S,8P9&EA1A/a,6>8&O@G611F]()cN3Y)
,):E0N;3[S2M..HKf^fN=e?a4C?9&9He2b4&<UV,f;3>VN=6M09=6E]K@f7W5>gP
5CU+TEg9\L8KLUT/KC?8#S^aHT)5M0VD=L\]-K06]:e.J5)3#]a9IXWZ.gJ>>@@D
4].E:N.Dcd/B5+a&B8(EPL;<\Y]:=ROQYe5;KcEb<#P?@Y]WR74:^]>0D\EQAV@<
FIe5eeDd?gL.2Ic\(c36YL+>J]@\9A7SV@[7J7\?_V7A3eaY;.,;LQf.KFd8G6XF
J@_RVSRH+A-(X;N]dG.[e?dI-U6J#AN(W>Ua[W]f>>Q.P7Db/CgU9ECe50\OY#I1
>9Lb><3.2c_KcI.cIS#:O8>=YFT\2bA48aTe0XM.3fRRZ@Y\AQDP5/9,\>^4XH=S
e@[P&Q):D;d&R;K^?0P[3##Z/Y[g;[fO<<X8ZU(gcG^PIO1:[f@4J51S/RUF^)e#
[4FS(-d;3O/PP4+P@P=_SfI67.5W3</,(\)[b.1gDF2_ZOPAdY2f;Z:3Q>9QB1JX
S.d6=N>[#I.X/&GbG8B3ESE\gMGWd=U-eC4F6B3R/>1Y_2.&=8#K-V,\E5=:T=&6
EV8a1@Zd?..T+4Jaf52T399S@A+A;TcHNf1TFPScb=e=96^,:2#+]TR-&J6H\2c>
XaJNb06GNca@#Y2P(E3036)f0^TG9@f@(<NcIHK_C5RUE7NV#?G>93HJgdeG.ZR.
#XgGg+XZM9:BOT5LA:78Od64Of4N-;7^3#[2#19X[ScF0EZ+?L&eGNc@Z=MVM>^]
BC>K5K]A.g)SQ[a=7VdEF-817Od+^S\(b-)fE(9/0&fAfMI6#L<FK]#LDXO6=-@6
S\LOGa491=F:[_.e]W/.M3M;VP9:54Mdb[2&6:,M&B+#PB[VU2/;e^D?&1;GS>I^
&4(8[F_b-[=^H6aA+(Ec]-P^.9#bgV0e&1a[IN/<=&?eZ-+SRYX4]U>G=;[Q/0gF
<5g<F1TB^)Rc0^K\2/VCI9;-X;=aWGP2=]#,L\f=d<=#cAI2<,a3&RHYRIe&NQ&)
]TK:QJ4-PHT5J[N.W>^SD8B)F1fGX3Z7@c_aHCZ35#0M1=94bFTL=DS18K/J7I@O
KeCf1(Y&2PRH0aC3_d@Mf8D9?^f\BIL1VG553G+@8Y)TSQOL&^D+b5V//6<&&\6.
Sfb)4NYVFI-_\;@bCOP#S6HFXDU]DKNceIdP7WDC(Y3>4E4e>+g;fFdf(X(bV#eU
2Z\N:K3&8[E00N6<C_GFPE&&d?[^XbM]RVfe4;Bf37c)K;3CeO0S5)>?#C_A(UbR
[6=L4HO/QfWge?Oe^N9.I\8Q>V)]3PJN(Q6X-948e^db.#[?Mc0F3&N/-[9S&=e>
3Lg_1?f:W#RSDZ(8bP2[:fL7M4/EO]ETW]:34/RID8dVL3)X@^0>LG+A/R#YWV7E
eOZ#&[d+?.BBYG>a3>E@;&,>3S+>6#Jg7@<NePa53/TE-Fc<6(?D,g4P9<V&ZW+b
/,Z(B_,POW?,U7\G9D1@OF.N#=[d6\#SS<\ZVP)C\NK<F##fY)_VD,fZ1SLSS<?<
=1_<7W[Q[^T^PT9(8+:6#R-1Pec(1>/P;9=HQ6[]YS+(fJ]&g]9#ZRgcGDUWEGQ2
Q(R#fc==FeRC55HIbb^,=)VC[R\>?4CH[(6>,WC:Ec4P^4de(EJ7Gf4\:^4CeR-C
fd5OKX_YD?<,=+.]6H-RRa=D_GLbA?R1(DNL13LZMe3:>)[;(,,WD][C/B_a5S+P
Lb6.dA6P1ebI@X6VH?I^]9RdAJI@SOP[,BfbS@5#I+F(Rf#ZN/Qe@N+6M\A)UX,?
R/D9H=bKCc_^KK(b/LgOM=X)X/a+#K:R-_@)5H9F(\B/0^A_?OW2[WTAa,T/5])g
WN&Qga>M@FZa8a/g#X;),SR\;RUWd6=3Rf[fB7Jb1O(YEe6DW^3A#:]TRdbggW\\
?N&=WE=QO2GS1Y]B1SXCQcd,>13/&F3?KSJNAE+0>4-],:)H6F@>TV;X1.)IKc9V
ECEf=W]WUc:G\4Ue0GIW/8eMcWQ#DC:-/YKbHfTI)Tb]RfXeT(P]98B_M-O:R^A+
2adBWHHL\^HO3dY-a08f-&2PGZ;d0(bYd])GJXOE)b3-@>Vb8[.M+e]Y<0GL=^+8
M;7PTTL@4R_gQaXf7W1__1-D9^7cBA+Z2-2g#d?b^51/WQ8_FWGecZ8/:X7X/e(-
W)6D#C6)R0?]a1dd#VJ=H&f6+NC6J8P;COdC9D9.<<T.I(-R[,&Nd:Ua9Z_74(f<
LCS0)[^^4(4aaM7;b=-,FQ#1FJe.1F67E0gWIaCS54N5dCHCH.Ug\-O,V)bAUfE?
W0)gfDM#+=FTSP=]3(A-.<1@P.;.TSPI)E551S&0TWeR5E1/d<.\G^a)=0Fb3.3&
4aT:L(,fGA>0BIO<0^EE:=.Q3(W,QJ1&4#W/MN0>,L5UYD7;^F?(.HbHF9c#ff^X
G34AA+/#/RD&@8?e5:?5#.XK&LKN9E>#DUDV^eId]]^JE;C+ZBVX[,L8KU,]:FaD
+\QQ6HPbaM6]b0?J.1>@[XJ1:,H72(1\33D,I&e#^5]O(/4MIKC^+8_UJ0SV37c@
^L5O)d<=0CH8I\e;QZZS)43WRJT.O)2D)GG?+GTP[AF=)?LLOCa8V6/Qf-3<6@HH
OHL-YF2J747Z0_Y--3@bCDBW>C7I;86+;RN^gCe@@EY(P.BBLGQRZVFe:GKH7;DE
AAT\INX<eA.HBF6dA.]3&XI-[2-M[>HCLQP.1URKE3c6C/YB=a#RHTcW(4]d8OTQ
R_bfP?X^#T-)M.:B_a6\^=GbYgX3NQ(+31g7)\a<<(=)A<.9>ZcWVGZfMJ@bEWgN
aX2_7J._cEWEMF[/:LQD9HY2JM&]B-=4dL3)/&/D,a9Ke[Y_&?MN2#&56)4-I(SI
?\.6II@0R4d631R+7]g:RE7];68@O8?,96HA)K>SC56AX./[A5;8KAWD,?YU?/T7
5&NV\WJCKFD^YAD=LYH4FSJ<#PFgGd^N)d81;30Fe2aWL+E8I\g,LKXG_I:IZEIA
;#43/bTfW:&+8bDJ(VLf6Q.AUQTO5_<UU?aNW8?b_=-W_MAMf#56/_(:,0Qbd)A1
4K[F]XP^KZ];@dFQ\=#Dc;X1B-BL39E8HeG06)#P,-#0\^4J[.eB,VC43f-74Q5I
&cTY?[I,\M&<ZRU3Za0XZ]BV7>7dc1#Y^]<:gO5WMK+A6)9NE<92WZRa(PH]N:,Y
3MCed,CI[4JI2<GNQd5T,Q5J54B4.9HbH.B5,64;WJAEZN^CF.NO-HdV_#BXC?(d
>VADP?_;9_/[((.:4bCYCWN1&WO#L9fRd27a>Ca651B47dE<82+Uf@#OW4/<J9U,
#dg@^^4&@,@/0B^EZQ>X_WDIJ^aGcV;5,BQgZKaL#GQHPHL3?3e-JJA7gPeJI#cd
+^Z,;^1,;.RI+CS(,T5Z9Ya>_#D2J:e&@LGQ/@D#SRV&+dG40HH+>MR+>dV65U:<
b_fX-[#CSc_Z?a+b_?f12+A+TNH_=[LG#C+9XFG>g=C@#&6aV@eUc]]/#(X=g6a2
HP7&.^-Cc([a>KUE039&MFDZdZQEfWMM@>/\@O0+gf/53eD9V/B]@Hd3X#EXWAVG
2Zg:)OBgdeXAAa)dfV3ML1];3H4MRa^H[ZgRBKDHRgR?7YP7g&b3JH1[NPY1)WTg
S[d>C0V:2aNP#?Q5<N-(@+>[?N^g2_,RTgYH+ML+3KX-@O0@5HTBD#SI+&2J;DY@
,V);.(b.0N9g7a8^3B7UN@INe1N-#g^-:V7:)Z\YcDe-0\F7YUAfQYb.CDEgI@-U
H],Nd=BC9;CEMZGVfK7>W,Y8]15;:R0EXJF@PF6gHgcP-LV.G-:Q,/Ab,4[I;4dM
79/5Pe&=-B\\b=6KNgFLSNW_g4__@M83S,>JF1J\UMIG(M/_RYYUMC>SD=Kcbf.9
SB=:Y^+>?;RR(P:d8@DRN=-<9,@-UaIbT#^Q54bf3gM:NOUF0NNX0[8E>3:ZN.)=
_:1+ge,21Ve,PQY8f9P48,fM7be4gObIDIKfRC][UOfZ\C:O3(J_-7]99F9)NL78
]HQ+HC:&7Se^L/dV9;=B&H:KQ&ODX2db.UUef0V?RI5Odca<<(J<gF6gV=9I)-)5
CB\[2<:O8WIbA@-QE[43>8S;4_(>SK^9a5&V5JeE16?DXgRe?7Q\;9;gIb+BUYV\
aZF&.HWfTc2ab7\RRT7N#E?;MBda:5/(Qd)\ab>L/Ae^gQO7VJeS9215#Q/RQ?IG
@b[aS7RDfY7?#8[E:AON@4JDR;-TCD#H,\0J2&6+_BKS:0L_d8KMBXB[5E]Q^(E[
Zf^Uf]+\7D@8CeGOE&)d#QYK>FJ=PR?Z,LJd7T\]c(1C7?:Y?L<3:MA-/NA1WD\V
RP5BLDGIL0L>=Na9YN9bUC[S.0].@fTMZG06C9bc+eOID<3f,][Z@-DTe1,A^/=J
ca]UT#UHf,I1Qa,EUWVDff]JOY=+RA0Q<ScW(:>[.J7+[:T\;d-\>D;22#UZ=#YS
M803.=X=RBR@<U#0\IUU7((g=9A5.@ND6aP0=YJ;^HEUL5/GQAGGDNLSRWDQ.3\b
6#1OeR2T0Oe5>TN]bFYVYdM_JDbMU2J6HZUJ=BBT/Y].7^G3]D,SXeFRG;&1PX5A
#UFED.(:T+ea7:DE2#/1NNg00ZgZ^2=]H88QEPW/-0FN2W(##a)I\AZMTX6IA:#Q
&V=4^9&&^7RAa?dFI2^O3\T))/L?38DP,Ac+D^FJc/d;4BTb&0YQ)56eXRF/cg.@
EC]BTF/]cV#ag&aA;(aY\]:Bg\VTf&&e.L:O,aPSYXWIO/+>(:M:EUHc0R+8?@e>
d4XQV-dC5V7?UU#Ag^[gY[I.P-5.JMES)8Q8&B=XcVC60N6UIWY6SFA-D3+M/ZKX
K=O-S^MfG-aeK:X5HG,/&b8,LDR0DQ8cNU/RBfX2^(97>\B(?8>XRa-J;C3E\;Fc
Z:^&MV^.G7E4VH1D&TfK_/[d@]dd^+/6XL9;=2OQ5H:HceTfSJ[eS4H.V.Z-BJ@?
b2D_&)9Be/Ya/;F+AQ/BKY0f0()(+d,>20L,a([60/04PLI(g5gL^VP-Wb7BP0M2
LU3O.2TQ:@:P5.cdAGUYAHCTM_d3?E/8,+,/5P2O56TP5&N4QKdQ(A#1fKe59cX4
&\PQc[.K,0UOR<U=-4=+J386;c9U-WaBX]a<#I)\A7bC.U0.UL^EOcVfL0)E><Mb
MXb:EFJ1H>QUTQRDGfD/3^3E+2T,=4SQ]+0D@&g#^[@Gd_M+EfSS;<H9&H>1X9(P
.I87)MB.BT\3Cbg<MY3LXdFWM<&XK#V7O(WW[BUdE=J=4dEZA@-,D(F7a-VQB&S\
QNJ?5.e^eX9S(AR;79+NRENY>JY@RE-4ITRJ<\]@VgTJ_[\FWUgQ-QU4<W>EW-)S
Cc0L5[(,f(\-U6UKNOW[Tc>X?4e8E.5YV2;,f5#A(+5@D-f?X:&JJE2b)_M-OF=+
7<1W1IHVK.4TH2gW\gA&A@Cd\<W40GNY)&HE[>e[=+C@+IE8bAg]gDK&383^201/
07,&/aCC8Q2_2_78<Q+_AM_e#SfLF\a&N>aG#X?c]TI7&c=C864(12f?Q#L+&SQ.
LH_5;Ge\Z>W3B&cdZ.TCeKXVb5YM=[Z2KbF/O]e,]W-bYD40FHR7_>?J9TZUbAE2
6QD/7?FW7OA<9XW.+\5C1da5^@e0O,ZUZ:EW)9X._T4Y+>b5g<[_3M1d6KL,;e3Z
6@BN?M-1<S;b8E-35L7d-^E#:>AKYLF(?GgGH@)U[df2M+BHR)#\b3K7E:Zfg=#P
:L+0M\e[O#E(E@g@Z0@I#efE2^@@HX]DW.g?&Ae7;ba-bCY0AS3D]J;+,6IO[(4e
>SA78F^cdNC\(Y4A:5Hg@GL2L.UfD9bg\624g#/C9TEA^^-?[c-2)#aP+c+bCEB9
R+c_7D2+O:M)=<Ua#IReKZ8>7Le.HdDAdGR@e<0^\@KNP##.BWJ,4J<O[5+8HR5Z
:J,4K74Ce<UX<47888K4PDBgFTR8\C@19NXN91,^R.NG+f>D(3V4=3#A9MeW03_U
;.X&+@M[OcGWM<:]&_V@ObJg4Q,XTfb8g)a2-cG>>a9P^Geb@4Q<9g19H8>Ab:CR
9//.aDP.W3e+1F3)N0,0YEd]<ZcfC/]Q)EI8gO:aO\MeDXOaa_^73W2:MGXEE7>3
cfSa4>Q^9Y[dNF\(e7J6JKV_^>De,RdP7,d\Q8<3G;DLb7]S.Y+O49,1NW0ZM(a&
fYDB<L^gO_[EDC2_TB.1[I&gdeL<K:If8a_BY:<,EG3)cAH)Y7PaYZJ#5YY2_O0R
5K:4?I=M.3KUM9C,Q(cKB:B2[fJbcU[^L)_N]CAB)Z?>Zce_1;<WM8LbQJ?_<?W4
)g]gVJQM7JOHOZOFPP@(?(f[aQdc=J62gW)NOOdHcJ<[gIE@LV7\&6_ZD@9VH9O4
.+,QeO.gO7f-G\OI-ddeKE#gYZB_EY+^KHg7a?-TV:(:F/9K(Q4SV&B^@;A5#7(#
dL[(ZG3):JY]&gMTU](>5/JJ5H+OVBHXF_][<ObA,O6X58\?O7XI/_[)c4KSDX4<
E0>B9[HHGVW^Z4,2TS\]OGO8&TK1bKJ.2J9dJ6XA-4KEe[G5LUObdH#8@\^949_6
8+ZFa8P]-X0@QdeR9J9YVPMNJ),f:AYOAPDWE-Vg_B\D@a_?]81D:a<3SC6D5W\T
([/bH8C5ZT^=AZ=W#K-P]Sc7+gL;=2,g;E&ff^SFEFZF9Zg_=a2#?HLPeCO]:NKY
XNW+U4(>)QR)>T^.(H\gXD^4,,8T[B)52B\-@6868(GZ>_/Y=>G7D4RS?@Ue<SHW
[U=:,Ec_WC_B:aA>(e)4S4X&H:4>NfJ<HII)^Secf<5/G-QcV_?S+WKSc1Ub_U^#
-bENa2>?db6dV6#X?DY3bU?,:g?^A@&a8YW0\_(AT.bTFg&THbHV0YQ+b)4QaNN&
Q\KG2S>R06+<COR1(6A3a]HdR7Wb9FBJNbbY(H4.fa--@3;@CbC2f&#LH(>8;PJB
a:Mc..4_90X@S@gbZH\?:UG@AM8,X@1#5e;:>J>K-,cbELfEI&T)5=T+1Z9aWE5O
&@KA\>NfW1]W_Q,FL>&PVLAA43Ac/Q5IH@9O[6#ZZ:G.a)5H#SZ@BY+db3)6Yd=?
Z,+LA]Ia9QX+b,7M::AACP>b:9;.2F<g6\A3XKAfTb#,@4,BLV9Pb/g+@WWXU725
dYcW5B]c_,1B.fO1H92VaGMD+9c@)&F;XPM\FHcTCgR7K\a/)3cF?9e/2e0C?A,=
6OZE_YeGNHgK94ZPZH<XD7DGQ;-\NED)--9VE75MH.\XgYcNNJKLSc@d;J4dB/>@
+ON23cUTc1gf@LV5XT&937@6NA\)c>&/X/#^=_UJBBHV[)dO@=)7CH0a/]R0:fBZ
-=9^[fVT(\VY2+:dG^]SENH9[Z/#R_AgZ(@B4>J3G5@+:98>M<3O2=B90IT0:KNH
<#[1D(J>D?@GKOP1SNCg,IT)]\Gf(I=,=3g.GYX)SU91.N96A//PSe=PS5RLPO5+
/H_>/AC/4R0DAPd#(C6U6aO+-gJ3^3WU\I33E+=&X^@08_f^1.ER,9VeU441bc=H
&[d[abSg>GN7.VM[[+-N;VGE>.LZSI/K&9W=Fff8G9Q+4a;/G]?g(RQAY(fa+OXX
R;HEH\XdO;VEHF[N1^a^@2[].7#Tc\2NU+P148OEb6O.+W6dEMULR^KEJ=\db]HA
^/@Sa:F/a01QGTF9X.NJOZfWL=U#3?E7LA&L=SK?E3@8=8_/dT>>4GPTg2(:W,E&
KMc/5dYc<#X9M8+f.?\ZT.fB&\Xb,eP#,DB7)4U>K=@T+@c[8/C77N]TdedD#K=B
Y[Ie7D?<[<Q9eaCLW=UXDR>]TLbQ)T3BQcM1eGDG#NJ^G)4FEDFN)^:>9@0?cR-L
S4</^KFR/e7ZHUF,TKYV_2TLcYZBJCR6+2OP<G0->T7(Wg54V]91AF2;9^93./O\
W9@A]D+4@A>?E35A6,+1HNeHH[J71c)f-XfWU]/2,+NE,>)IZ.[=(02^4MWBL6(8
JMM-YGGg.1.3K)(J=_,M]X82C-I;ee^gZ;#80<Q/cAb0OY9NKa][VR;;>3]-J@C-
=VdT=04VcX:L#c]1\@4Tb_A0Y<(\AYR5AF/F8C\0ESGD^?I+>L]HfQA^f5aHU>DF
K3NT;GbeYe&@E\Y(ZaED+G<K2\H9IR53HbW(\1CG7aScgeG28NHW<gZ,--Z+Fae=
:g:U>9II/&<AE#O+e]PW@6@XHURS:]Q8-S7eFM8VE_]43BP&?R/0JFBdAe;)J8_L
981(2YG[,O17]GGKeB+O\c00FFf#O];SR<fT4Y+SCeA4Kd]#:-KT7=E-LE>4\bYb
T?Y/LWd4fLWH(5>R4cb(Q<-]RFC;M;+LXYJ[,OGYU0(22NfbVVEY_DK2BNU-7f,?
KDd&6O3,F6)GQ&6eAIMbb/4D/S_dW^)BMKN6YUT+(/>/Yb]E9Q&Na6(UYcf<^;[6
\1KFHA,1^LcAM[^W0&d]5.FaG>C4\,R;]cFM\RVg]JMXf^KGV_UdJ?=,HXGD,4f-
E@)Q8S@53BF:Q>0&RTG@(fN1fd73BXA_HYE9D&RR9V1QWF7?1cD)dAXP2^Wa#V]@
-YaRQ)6?K@8O/D^XHA)PYSQ8)74L#)8CS-15DH:H:FQO7GX5,&([/+a?>&f(D3CV
-K@g@JGD0=1R=:(N#BaZ^BRU;[8SJLE)2D-[2_ZDb>98dFd-<N6Ig=1CbDeU)PCe
VC3^/2LSAO?-CG+a[10J_gC6dd<=BcWV3Y:IH@&<@#K#,7.]R\b+[(cA(:f7BE4Q
gAQ,#]4V93P7#6eV3)MafE?J1WM0=?P8SSf./6?]A4G@H86d2;/R-_<R@#EcA1c#
\N9VG/F_J:]ZcFP-1B]^3NM;T1bV>&\0\1NL=9Hf-HSbe#5(Zd3:B&R)BE1]ZePV
a-TBK&e90Q^Q[4T\c,J6\[.J_]2(,>fY-/0IHYc0(J^G69dQ@g<;;VDI2:8N=K<M
9C&3BY?-37eOD)f3@0/>1T@X2(PJ\W]UEA,4.FD,ISEB7#ESM4?B@--Jga#337,K
]YGC?Y4T>\6XHFB(ET7\)3.=AXeKLdf\cE)LWW3cXfJXXERYDJ#,)6LP8BMG0BAQ
8=ge^P:F_7/8^aDM[.S8>Qgd(0>TUN>5aJUYg6I^Z6P)[V.afX<W\N.(O:^;M[Hd
N&/G7DE51bF\/G\ZG]eVK?5.c\D3/NVC\47&\]O@_TGBe]^<=:fOV<0RHQY4;YYM
)DZZ/AKVQS_\E=TL//[Uf0D]<CB_Bc_1Q<R_PdP_^K40=7OOK745J=WKYW51BQCc
G(4=0[2==02_;?V99HL7[d85AT7-K<.MR3cCg(/?_@BCS)90+(2]W:UHVPgGFK<O
96fOTM7J@=eS&7QZa)JSgHXV[KOPcCBcNY3@d[LWW_?TgM4N0R\[P5WB(DYG4V6[
75@9)a\ENS/.eY6_Y;YNP1A_C]KLf3&;B/MF4c4EV,BY)W6f^26?8a-d#2e<-;.W
/ed[I]^2P?N)-1EA-N49Z=6C&MJVI1-0L1_C@e09ANN/;JNZPSX;4M4C?>e6(HP+
)cY-ZY[ME-J^cDJ7O1Wb3gWU8WX?,)U4ZWaE2(&bN1P66#Y=gW5FR#/c26V4XUc\
]bK4F<?L=+e+0&>SKOBMH2+W:M@TSAO\c(\7X8&UI):1XM;A).UG0K59VY@+dNQ]
B<dJ&KaDDeB#LZ_L7Z+0ZR<A0JXSC:;ZO?cV?]V6-,9J&XW7MHE9F-37FNT5c7K<
^>\c1:79YR/BSM&b_(;CQ\f0-\dCW[QBQZg412d4KcI,&L__I[U^NEfF7(CXQ:#:
FEU^5&3URCcXR50MEaVZWQY1c,Rg\@)>T0CN:O/1XCcVXU6;/-+b1YYc&;?DTD)P
B<.F\\>aLRNeZ+WCQ/K8E4:c6OUIe@25EIg-&d,WMOP-#b5]^ZaE1+?Rb2ZEU<&c
[PXZ?)AZ=cB#RG6FYcA;Ke_1dRX.MA/7E,]>C8(IAVH(?e5DcO4IH/:M;7cH@)6W
>VOWgUf=;24Q5V0/U??]@>C5AbOH9:Pg=.VYS[,_<&/Vb2d(B74KZO21X4?3)^]T
FDZacK.FTMQ((eGH4#]YR4KG,]gBX:E[PVEC2)A=KA@DM37F6M.HGO5KSXZWedTG
eV:(Z)WUCgF7I1e6H-dFI4.U+ULMKO6JB2d^XYHM@K0CJ0^M&9NBI(SY^QceVa+#
LbF(9YT062Ve;IdKZ6a#:0=5,(VFK&&W#X4FdFV@>D7,0<M+dg[:>97;5RDVeXLW
D.)Yge+]^R8Y4,AFTcUQ<8=fK>YL4.7XeZ>2YK)QZZNC>>&&f?a;VOCbg./eS]fR
:?[-8Nef<H43R]GF2561HJ/AY>_-CTA36.Gfd>)MU5BLQPI+5Ef5/Q#8?\<BVEaC
]-+e),c(A=1_S@ffOB-V=]GMXI[0N_PN(VNeXbLVfR:GMaJPRaL1\,=5ZJ;e0^9F
bd2a:HL^IeX-R5TReX8.f9-/^X@_F4H)Z_cH52=6;QC0fX-@W&)._NG^P>+HJ2O.
_g.8G?O^M>I3/E^<UfK)PT]aCd#RJc7Y;PAUOX=PU_S5_MLW.1cg1>cG&ZE?-[N3
24W,f<0WD#@Za=K#=/G6dL&A]O4YU.7Q94\;cg6/CM.)I4(:bfCG.NKaE31=@IaM
YAU-WK16-_b@VUKJbGbP^Gd1ecPZ-HQ2Pa6?QT&Xb81-,4QME\9C;U6Nd?Eg^_(M
KM^8JA.QPf;M=fX;GJBFOZ>D[L>Y_2_LV<4?fc0DG<=LBTA;(e7Ufb?]ceJ&/SHZ
&<WMWCD@CK013eda^7f,<cDd#f/?]Z2S6@#]+H;a\AC]D]&&##d4Ke)E1(@N<_]Y
&46BQ=7PZHH?caUGRKGGf6]+PZO(SY5X):g+1D6NDd80_:YDCddYf^/_8-9.86\K
e\Je[^ee=<C+bCaI3UW54(SRA\T<(JAfI7@#aB8Q=3-?0M>\6MLX_g;U)f,6P8\I
[YM<Gafe4+Se69^0N_.@W7>P3)bA,-=H7/FNRfRELZ>733DU[>M^?Hbe@<2e.+f=
BSF-1TY=0G71&3F1[0=QVHbKd3WQQ>>NSOV.KYT9XZaA5=U(0T^KN:0e8_JbbaQ]
^6O6&X^96O1N]QG8>Jg@.=RA<[X9YGJfgV3aHaF<SP5:gF\U#Y@TN^JgSH]RXGDf
&0O02ac2??/;F9;N=RL,LGE1JB=1]H6]@9R[_E2Rg^+g](AEK;CC25WW=Hg<7]M+
AD,BM<&.F9?f\)c;?_++[U,f\08C=+QgM\1)<OS:WG(?HS^#-7B7)2KP1dN=O=Y+
;f^b?T-^,Q:.G9<N?(B;XP=QReL6FJE86WM_AdE71gL6#CBS((D^OU,RX4(3RHfD
K.DbXHaH&QYZ=3a.aaf[S&g[06)UVDd9Oa\_VQa6U0Ig3DK?.YKWR)XI/c9//KTE
)EIf9)XO530&OXG77+685#&7deD/I-[6YY_N=?JB<)5I>e7X6CNe&<[BK[D]\8L.
cIK^@])0INH@W-)c2I2L,>/ATaA?2,0K-&@gS/-M@FefAN8a#Q9aRUS)]9+DHYDR
8I7\c>G&b&BIJ.4[QB1=fZ6N[<c)=fD:W3bN,@AH@a[XG8f3+>YGT:QU:,0.\M\6
[_:=/L2Tb85PQO.02C6cVQ,H+V9>FHF<=T0SFZ(bg5:b4)O-=b#E\H/T=H+=_MRL
=DHU/(U6U3PT8X#(:9_g^1>^8-gdVe@HI#X)FJ00d..a@AE[K+J>7#?Ce<XQ3P_g
:D01F=0b;XaP;?-.GX2ca/L4@?R.>N0MI[]#N+K1)R3d>\@0::,I:AQO.<bP2f3T
:TJ:U4FBF+J6,?FOWO&6^7,PD3]@0Y,9#d2PPcO1>]M#\=]RK6VMbZ/,4bUfXfc[
HgPE?-.8E>()ee:eOf.K2G5.Led#_IO^2b15L@GK\_QMfZ;@JC02IXeBVcbYEVM.
15CaM4L/[D>aSd]#-_;@S:)c1FDQJg,Q@X[[.c]a3.=1Wb[[.UTL;R#\;K3b4#g/
^XL[_;9Gbg>a:(0Z(07^A+/]/@^d^F0J&2<c;2[1VNYUUc))@(eM,[KX2>:VVD4g
=\\59)e1XWg,0<S/.6X^?GRSL6-H/H+XV4_C]P#V@B=>U=USUHB[e>+NS8:+5aXA
U)3E,,62KF#;4AB>\QJaV0M53:[LF<0]/-de4_A(-384882C(B=(L/=27?PdALB7
YM^&I?cO(9A6IVVd)/GR2=1=\HRfg)G\B8;(f#8b/HRDA\:[C?0.2]L3(K6f-4PP
:^@0:_)de)QM>NI^MUVC3D:>,cW69WUaMO0ae>8fg19,F(ZCNKPb2I8W4CX_T9:;
#/7F6ASCW-#HF3aSdc?08a)gU<ZOT;ZL<]RNa/:J+eUR632J>&(;[VC9)6T<dNX2
PYEABZ_>K>T9G<5ReNe;?;T>KDWP(cgbS[<FE6^MBVe0f8-dDX)W=Z8S5OTaJeDF
BD-.P\.;cQ?G4JDb>[P#5gUVJ/.?=+R.FKXcCTg;dX?H3:B@>,T)7SR8BWYFd,cb
+R(#X)]4dGHL@QC@Q2C:R/;=K>K\_2Z9C>N\(fHX:B)cNUZO5]4@Y6eZZb,S^T_.
_Y[QY02<KeY]J6JbSH5=;<F?H\.GQXPJG0E7-;7Fg7@;MPJ=18IH<AC#H-=,O/D3
W2+_BF8:N_5H9R<-?#E=&EJ(?2dd<1>5ER>#G/S5/K@P2>>7=f.a,(J6>GbC3;=?
W>=5^29)&&2=2R:QKLMc\,U/9AaQZL<-ER]4]gLB;KDWTT#A)/KaOEg@2bB\MCF@
&=aE6fRITa^T4V>cG+9QZg]=\#0gYEd2I+D@b?<Je?CS)9\-FKQBUY_(#42eVUBR
+ZX9P+:ENIN7Z2>ZcH@aBKd,\-A/Q;?-Y&H,:QW(Y3/&H(?c?W>LS[H<8CGf(Y=0
Ye>2XB9>M-T+KY24V_EK+\,K@XWJ>AFcIVJec-UD\+X^bRV[M:=G]PO3-S^H;9NR
@MX?Cc11T?RNC(VR>C984eb[f>E<(#,(cK_+gXUfM=b7G=15EB6d1DK#=-629@37
[9,OR3;5@HH4B>YLdIUW.V/N<bKU-+A=-C/A5)F[@+)93Y]4b:gXI90KCS&JRgCC
K(U=[KV2<#Lf^MbE;V=fNTAEQ44IcI]6Aa[E>IU\,V_-]^Fb)\gQ[34I(e/&B,C^
7:A6OVS<=GTY\KPLQKb71#^05Qg[M_][QKgV3,fgHA+&:FB^J#\D>B)ae;?#^X8K
CVPC(gA#c@/a4Yg7RF7&S7PG:19>aA)(QJVM_AC6aeJCT6Wc\).SW5?&@FGLfGH?
C6J0P4F\Cg]MN5;QeTT^4<B-:[5UC+FZGU27Idcc^&.=5H#U#dL#R7WEKYR/X&-A
10KS^=4Yf>0a1W,XggP)59\D6-[I/XM01Z+,5)7cI:ZB5M3c4-+:QJ@#e=_Jg&]&
)PMdE?7?66A]:M(S,/;7,V.=)>:B3Y_#eg,]D0aJ+ge)cQP?YDg]74&;20[0FM#&
D;H50d2.]25ZK<;-O_.W\cEJ#8gCbO>OD\.G4#f(Z61>;X_LcMfE,G?.eDdYM8D(
G2SQa3PT+B6g9.6T7FCSPd4dO&AVJ@/CU7[VMRM7)H2OP^8)c+=-Da=1DD]47#<(
#GFPH.5&5?EO0:e3SFZ.&J_?OIHGGQW0;C_YCFU#1O+3gO2-9a^=_B:HfI8Y<1D[
W<L2/?^JeD\2<fW+JV;S>VDPGEPELL-8HB+;^b#8B>cfRaI#=8NW1COUO/U_dT1=
FB5S6KB/FCX](6Hc:);WMB_F>#]e]PIReZ:MJ,>CFB)BPafK--#-.7&OC59E\b)P
?;UfUXP)e3(E:9PZ8a<71:7SB4F^eHW1e8=0V9MZ#\<.PJ3aW:AZMQ&SSFaQO&3\
_g&ZPANG&/\#&a7_aaMa1>Y#,)M.f<ZE:9N]XU8.a3E&UBI^:S14\fbBE#5.R::U
>fSTTSb:.bO[\<G+4A/&K++)1g-W/1Z(UGXdT&bC<Y)RgMV]L&LU:>WN^eY]6KW(
=B,g9+b(SY(Qe&SC;08WR)Y8f\[P[_KXbNJ1<8g;\HD@GS5cb2V70<R@PSJS;&Xa
C5c5T<=Z<bG[)M/T=bebfR,=dfE+fW0<-NYNW45II\3g=L:[NABWdVLXI1_5_+:V
+:LBJ=T@f(H35JdFKLTf\_cMd/C/YRQ^#/N==L+L.&e&PT[65#Q1W]=aPFQNI\Jb
AYR732HaQ.X[A??cA?SNIX;.^3U.X4KQCe_C>:IH>]AO8d).LeBW9VZLP<B>g(=Q
#2\M(;a5@48PJ^)<JV,8#ad/Rbf8>TTJc79R\cD+\I&0-fHCWg.UKa/4K]YW?GZa
>^507B-K9M9>(/Y8^&2RSK7_O<KUeFR3=@I9&HWW-UDMF?ITRZ5\,f2</(acYRFN
WZ7HT(G@7/@U:S,K9W9?[4BR1_E9K.5#7E+BKf?,4CFX\;f10a<<U#UaO0Q6</#C
b?#SA]-U1N7d:W;+J0@:&OVVKB\JgK\J41/4#-G(f_7EN6aH37B2Xd]M_.g<1<&;
C(+e_XI,[;2d4D&(=]cP2XG.D1WUAEe>.-]T-<1e]L2]Y@G+^cWE40deK8GW7W+5
WT9N:-QZP31FMR9(V_Y2BgQ7>+3<EfDIG;9:-A;(^RNRe<)@]5M&8aOdTWEIZ087
?EPOd4QAA4aPN2M/dg91HR8b+7eE>^A,/B-NQ+5E[C4K8],7CP7aTNHd[(//<U)6
W:E4EB\H):.O3+a<@604W:.4RUIdXD3gbPV90CMMI_^CNe@N?-:=LE11<[^::^_f
^JDG];b:26Q1+,#?0DJV)D_2aQ\9BZE5GabfP##/)@K,L-c&GH^M/5^.8EPYM]96
OZ0e42>>UEe.>AL/YY4?H2gSKg<_[d4.7C+U;GZ5<9MDD1S=^1Jfc/G,?]?FeNEe
0(#OPEX9[^QI#)XSJM<=\X>7KgBT^]R42bF08Fef7T.a3;17ZEZ&>Z)gJ=2381;A
DJg27H_FO2&UR(Z=EF:H)Z)K,H@W0:5]W?0EDPHDa_]ccf.-4RGX3O>X5B7LfWR_
;ebWLF#-OH+_-&BUCUB5b?OSJUU_;RHbA,,U/W#+MH?Z0</[4=6d@A/T\dJ_5?42
=Y8RYBKgXM+Y9#1[-Ng\Ib@W+dGRN=:R.4]=&66DTL1I:(;NM/?2.e9(@GgIZ7#]
S,(_AaPXTD<RSTY]((b+V:JU4YZDNAag7C71RJd)fYXHD85UHdWM\_Q]>I,0>#;f
@X+IT1+B^V>E7+SW88X@DPN3Z^-LU)ZMD.,3K(4H2@3,7G:.Z(g?ZCFfcI(]<F\P
]e#U6,A7>:=FKX)#L6:ABG[cfJ:TG@U6-,a]YdAc98+,WRRL\7>c&3)d23:X^U]G
^J<cWP./T/WRJ+>Zg6YPC5I\+D_RD065QAfObO0UedKEBRKGSJ@J.,L-)38(+ef?
/2/HP:X-27QZGC7K[D(.PE5?)._=>-]PU=7)^4U2V&bV_a@K;XK8e2dY.+9I2-?Q
^g[9))SCZ=Ga\8@<XOOHKMa>=KO7>KE79[LNVC@UW47S4<Efe/:b?GO(JN<=E35R
?.YA\+BSRIHQ4[[5g4IGP<OI^b=;82Kd,CfH&FbcPS+EPbg&eb6I1^;&ZW?+#S_P
MPe-3gSgTfB6H\)@>LZ((g9?+LNUd52)e</bg:@,PGM64&\4/TR=8YfJ5QI39Ae[
(:d^K@0WBI^MF1L@+ef..+=SR]&3[0>.S2:^W1b=AI^-3#15c.&U84#RAVJL;N9Z
1&STL5P@RN]2c\9<N^K/A&O8=J,I)L#Y&JRC_I2VQ;,TPbRH[XV=RUH(V7-K&T<=
^/gGQ4I<O>e<6g+<WY=af/J^J[O74:)g8EWOW^dGIXGbLEa>X\=>&2Y7RaCLBdA^
JO+NU6DX\?[9O2T(^KX7a^,I4HVY?f7_c2ce)E8?<&]eVNS_eNLM7-??K@>7d]=)
YS#AeAU7Sa7=7fZbK(3X>.,FR[NLP\-Cg9g]=c#(Q/Z7QV3F:L(HQD(;/,ICaJ]c
0X_-AESLSX&LRW:=H&P7+V9ee_/4cM23\\9R2/G8S3,](#RES)VRI\S?HDXdVK5C
B,HT@\HT)-?5\6Q9&N>I2\HX,:8<FL7AY+bQFY0E@Y62D]M-=HF>gL>]6=/)CO3M
E:A/H+N2fL:K+c&EXK?+\G5E<.Dd>U/.PX-\D0D?V86VE/>9PcUW,&VHJL;,CAEO
gC=0b=/]?^Z:5]NT^SS9bd8Md0VIa..2B4PZ;=9+6g#Y61a\:\NbNK4(BR/F8?JC
<U1cODcIE.([(^[;2>79#?HH8G[OXJ5e0]4&NO>VWHTI#FERC/NE:(fGUW?G?BWB
0=+.#D:A&)g)7#YW65^b+IcU]T)\N\XU.^+fS6_)((XE&]1V\N_T/J@@Y?c88:E7
AR^.f)6#-;4G=0CV:8PB,LOSD29_/1\e70XO=;a^.^b=W?2D;J=);QI,G7UE,d6b
#5b-CZ#fV\UGU/3<UM:JCS;L(bU]W[M\F^40=T?L:5W&ff@_G?@ZCeZQ8f[P]b2_
><,D\<)]8NU(FacJdFGZ&P??IU+AdMa?6c)M7d>3^+ZT,)eE:X+d2gA=,Ae-CRFV
@OR^<:563ELY-K\CCZ,0K6F-=+WW>N/U2;0[,8MSLQ4MXXUZ(3JBA):25GK[7+M(
2Q8@:eB9#>=UZb5ONNK34-4@/A3]T\F^=YeS;?c344fU-IA?MQ(2Kg/)dGN]F)];
YD)O1T3PW_7,4Hf8T9T+VZK;I9--;?<]F<SE68?[B@d?=:YUb=9[UFg.[dMF,:X=
K1)ASfN:5]X+[E6&aT8XU6STR-FXL\2NdS4OH0EZO<P(VTBCM6,a?)aKNGV&0aTO
UfD,,+6c5LL&f[.<;2MRKLSbC>TDfMUP&.2IJbYXaHGPbNK1XYF7,DY,^CT/[Y]:
;+]cX.BTd6Q7)[J\PIQ(UUG.(IKW0:?==(H:X(F;LGJ#F<)TMU,+ITS(L>#Ia_R6
C@.GFW/NNQg==^cJ91[S2MD^8CfELKYK7edKT\F)>.65RG)_ce8WV\.9SRe)>DL[
@cQ?VFN?5JQAC0dM<O_GaMXM#8fS7CY,]:;GFD\9=Y4[UNP<UGcaC-_6PC,ETdY@
W.eHFR\VRXgW+88RPg>0(Ud,K/I&.[6+G^gJbDJZe9=(/\0LO@-LGV2fQVb?f;>=
g)KVgUVTNE0(,D@@d==[Q;#V(F3[;K(a)MX7&>W\@7T-_<JA9+bEEg)AG/().gGQ
aGEfgEbC-J/Yg,U@(YTYE+EEAGCDcbaS7VK[(g9HfNgI?X]0ea<-dcb3LdcKS<a.
bJf<7+6I-YH]0<N,g2Y..:80DF1YD[ae1_)DM36:3/D,ff5Q4f=HV4)<&]If[8<<
\&1;K_KKTR4@Zaa6-U6d,H)&?g98aa5YgB/MG4JK0Hca&4V^1K#?>A,P]T1Lf>K.
\3BB(3Y(MHGaFddDf)@d(A>XbR_Lc[X;=HcPYa.dFY+;_-b]EO;@XIS]-N8WdF48
@0+/IQZMeWg7g:]5^Od9,<c:=8a8EcdWU5c^\3<MOD#a4NUI<6F9C[X<)K-dD4b.
Ac/]+M<,(]Q8][7?(F07L[M=VB.^OD7V?G<1OO7B^eMgO]CN9NP/&KM+5+?8UV<6
d3X;NHVCY[;>0a==P1cZ[]YQ.&R(Nf]J?UD99W3.X<ERKR+c^>P69>R\.)Z\+.W0
b5dOX@LIN#5QB]^LVM3UB]-1SZ@^XJSDHb?U/MM,Sc\YA05@G#33#>S=?2SVISM7
H7bd\?@QAcU(M=N1A_9J+F2HTK;5a;Ia5AH+IRb[54/2G&)O8]T>VQBaAd)c.A&4
bX;XB(L[1-cYQ.8T3<XTJ^R;[G2]ZII@_O>Y_Y[:J6PVCf<3,@Gc(gK\\-MUAgbB
;BV([)\aLU::c]]+(TO8(YR&EYc7/+;#-H])(FK@[&A/E>KgDJS5QQ5._#9?(FR[
>V<64X&;Q.Y;,e3<Da-[GI+d/)NT4,2#&JQXYb&E37f@D9a73ZK(J#\(I^C1-/11
(D5OBF^ID]>3W#4ZE:UX2LG>\#GgLec/(T]V9<-@+A?,7^H9CT/C@M=B,+fV,dQ5
e_OB7WQ.d1YfaU99Lf5.B-&6@eXC+W25g:U?I8N?X.Ae:Ic#UeU:g?S,S5C4O83g
edGOX&,^+]DgXT_:T_-?W#Z9Qa)G#QZ(0++BZ.[.]Y<B025<.EXX02Bf+L/eAaYE
QUEcUQCOTaTbOcQCUEeC#U#@]QeQ&KEZPF.:W#IaF<Xa#:@S@cA[&d:I5bO@T;cZ
7D;A[7P0V>1:5MbEEQ^2ACeSg9eI?(&+g<EJ&G-N^SdKcaEa8P^]b2e,U-7=.,a6
:Ja>8@C12QG8\5g96].OTbbbJ#^d9/FV+TaQHPA-(V;<,KC9ISeDcBBSXS>[21LI
Z0#Zf5>]C@A\bP&/:4T.C]67FPa>S/&LBB:aI@AMb&]Y\DD1&Z@A]@JH82_+;=BW
1JK@NYb@HC4>U\B=?+3DA-@H84[4b_\a&>HD=IJ^a0J>;Y.9]Y1(,fd/B9T3LVPG
Ge/?^\fgJb,.BF9HWOC\/-IBe?cF>[b;B^5Q^PN?SRKOR/-TZ-N3I)TD8-E493[T
E3B>NE)g@U.N4R0g^90Ed=L3R<6K+FXbaR+Z@c(ES,c(O3UYO144([]fSFOc7/K)
UbRcc\=cM1HDdaV#80X^:P(3[C=PHWXKWEK-?:0.=-+,5?6FW9eaD]3?;/FF28#F
aIWO(6,1V7=R98R)bHGIa_#)=?ObA9d;>S7Wc?28c>_>,_DUHOgaPLC\HF715=?5
M9_I7#R9V0=H2INQ>ac7(2<GTJb/e8bXR7=1.#_VO=JLZfACP9F6()6Z+5G<e\Ag
7;)PI32P/XMf&L&4S62+KbbFSSG4)_T-8agWU_/H1=)N_I+^&9H4QT<KHadSf.dM
SRQ,;_gN9(KD+N;O_d+E\RC_EV.TE,fK/c,^\@>Q?HYQ8/(D+IK=cd1O=V?d:A9e
+-DR?Z=-aJc&TO,JcD3#F6AP:P7:,:B^HLe:(&DR<IJg]U_O7.[J[Ib-_7dH(I5L
N#@NL0CW4^eBgdaEgS5XCPJ\S>GGRJA@1_1KES(a4e1f9f-bTOZF,<c/I56,e5]Y
5Y>PEc_A^TYaZ@bX;g2IK(R=YgYP)UK72VXHWDB44+ZC^H3J,JV6&7WS&aM]>Gb-
2bGNN?d8=K1eSdW\KP4>&.L/(#(#egeHUP<[--eAaI2O]4&XTPMGCcDD-\?Z@d##
(ZC,RV(=4(>ERVe=>M)317dHKKFK42D24aP1DB5CfA\NMJ8Se;,b/T.R@A2R&\7M
-[Y^RU-)5/LX.+E0KeFEdO:6OMFQ2]4L8<SV/83g<+,Oa#WdUK<:]F^FfW5T[12.
XH>7/OcQ=RCXg<2I=:1D&Y:(BQ6;R<Z+4ZNMbLVCUJBg^d4-NRD_=HaZ\=JVULg0
F?eOMeQ+>Sb=b[[_AH&5]W/Lg,,-UdY98U6@>-6C(fgbcf0-92:G+b2,-Na_;7XI
1geEVV)P=LaWU6RQ/DMA;4K=G&VOIba-#;-XDR=IOFDH(fNLJG^@1XP2EJB26XI3
)_a:?\9cZC-@PCGfZVGW+Z<0QY=&X9SLRY8&),E=NfC_.fL8HF=F@CC&AA)XM<LI
&F7C645#;e^gZ_07fP6d.4MD:(#KCI>b\=]d6JBTX7FS?be-\RJaTXG;Z,G1Z@?V
,@+9)3:4\W\MZ.[R<;LCUc:#_C]f9Jf_0IT>IIg)6_8]6M=WG8A>5PSJY^XV.;c4
52FA>Qc0W8gH=02B5Z)Cb@9R^;[OUUE=cgFGATEaE[-];3[Z+HFOT)/>=e;CW<42
R8/EO5-B1N/K5N-_@Ege3BVAYU@F.ICJc.\8;9[:e58eV.TCL@3-Ob.I5/^ZEO4O
.39W/KbVP87+gB+XC66Mf:MfcL:FF[/HbBJ3cZ@/e&DUDHU)O:BCNM4/We>;GF+3
C0dd5J,4=,RJaeUZE]fKC=+&V6,bX7(#OK_<6+Nf7&1C?81W4UKI3155^WZ?4O<P
_==M[3GAPL1#,_(6(##.013+=HYF[E8BZ@]d)KOd)aL<PN4-9Z6CdB&O;_O&XK=G
NX//(L#@QAB]Z3+W^d@2aEW/UCS\R6(6-/<Z2P>G<JAaB5Y/,)S?_aD+AQ71^c+.
;,HWcDaTGO]3/(1ETGL@5?4S]6--UJ[0\Gc3]Y>)[Ic2:>SOWSa=+:M0B;E]&H_R
+0FT03g\FHNEOBNaR.,aQ\C1H3.]R2+Z\RY^I&U<U^e6e4D=.eIEFJ&[J0.EaP>G
#39eb8QOZW>-9OO9H^d)W.9JG)<VeKY9Y^cHF&fZI(#YM)e118:0D&-280:8SPP2
N;GYBAGS]RFP6LU3>1E2d_&BPP<C?bc\f.BRDSOY[agMR6<Af8@2]S4P6Q-ZM:=\
-AS-8F1?GB2&2#Y]EH0N^9/71X@dd(=bOM[OHG(A-Da2=W?NY8ZP5OZKdK<.LVXA
-a]<U255)d),)D.2X-dN;6_=:54d[<+9gd^AL?<B=cTJ?R#NOK]W-(eSH>b)[(Y]
65?PdKT1M1MI;]?)]a+,<DT3BZK7&8@&-=.3aG.,A6?VVa86Wb>)P3,Z)279A[8.
_[EQ^0)WJPK+,>QK?fNVL\_=)JSD(-?.:UE:/GQ:T>LWg<D;.=Q(RAVO6]6.Y;gJ
WJO\GHS?W\f7eTQCNG@@DVXD1#H+c=^0#N-^Ef/P/WRN#>3U;,XVcR&Kbb\/(\R-
8^9^a@e-NY:JQd,f6R#;H>+9/J2+-@a]Q7:R?IA_SL^<3(9XNeDCA1,f=cOg:U<.
/7,WE+O3g=c_g=\MZ1Qd7gL:PT7HS_:AQ5:T#Q8Ud#3R:Q(:GMN:?>62-Lb2DHBb
56D3FSI;)R\>JOL/AcXL].()-1d;/O=-OB\.N,2U.JJ];(1.@dUFAUU^+#eb(<F1
b9;/d@gO[29[Z)<9<3<VDJ]YGQJ=Fb7>\&/3=[c.MG3)D:LC0P>K3;3G)^bT:+@;
M,G=MN;3#e]+GP+H-U/8X,b81O<;_7Y6H/=_D]J[QMF7&0a:f1&?-H4S6D57>POQ
Fa-MC6OV5&HOBTENI,(,VP23^Y<<RAZ,adRJTIWW9OYR,M+O#)/^CEe?;\c#bEP?
(bTQA\&e.(3b7T:A8Z1L1/fWO#I311#,1eFb24-_c.f7R(,G<3f7E^:]06.LPC?d
b5Y[E7Q_Z;+P;Y1=HA>=0];PEdgGF<YMK)7^1UX^IU^DS?eS+&&7b3D>RX3=A6-T
cOJ/).DDL\6,1<GY+cN\>0(c+/FSSXVKIV4gK(L^B9R>,87,]V#FS5Z#8I_ISF+g
WB[HS6@W=&:#0CA<70?/b/M^KIQ)K9=gIg/<TaF;gYACbd2ZIE#&ScUK7_NG9Kb_
JS8C@TdI:@_IEe1/4N1D;aTQ9AU?,BP:-WbdM[fbK:[1M_A790=H(/3->;4@4T_6
7K@D2V8+)JM?CI6CR>0:3JDe()^ZO-+UZ7H@/Ag=BaC??<^M/Nb,Y]([e1C-e@cT
geYfEL&aO]c=X)JQ7+^FbgW9]ScefACS^deTa75O0<?X2.&3UKgd0:VL],/Yc:>B
6fG,[_58PC]D1<,aDH0?bE]^@I]=_f4ZD[CHCdaFA9.09b-b36^,2GE29>P-N);2
64>fbB4_GAAQ(BeI)D#(WPb(ZXYdd5bA;&;UZ->9CR&gb@g&+OQJb@A>9=\]?T25
EZcE7W]9H7WE^CTTaWDaQ0=RKR_;)=NBKWLG<Y6MS(VbCMSG\NL3^K<e[4:3P4\g
&G@_^fXXB6U=5R7)Fd8e>@c#7Fb)LX@2A=f+B8ceGD07X^Y#TU](A+[C_F>d6.f\
W5[6?=RM[8V(LEc3QA1e)#Q(_/75.gH/Y?TOb(NUN(BUDe0b7F>_1;C6U[PD1#(J
O,^(3YQ#\>>;W68&dQ86&5Ggg;Q40/)#OMKGADI4R8_^;<P@:B_Jbb2=:47H)ac(
\:F29+-IOe>WC1#HV_[&AV5+\-)8V7C/,#@O@^KWITD,+]1FggF<HNEPW)W?8JN#
4@1P240Q#I)0]1NL]?]-^ZUKg/9,6+2M;IEZ^4b)U-V&^U@2N.=&b;)Te6F)V9S&
:CgO8cM5E[VBTLB33OIGHO>QNSdLVRDM2J7=_\GFP)e1T6?OHd9K/,>]C]]FF4AL
I)gZdU\YY=OK+51e+/D]b9ADSZT(9D3.b9GLD)8U<a+:61b<F_D?QF;MESN2,>La
&:8&5g;gS5F-:411E,U6=YD2#X(G^X.HCILQLF9fQVdN#_L,OO4Zc>R;UQ4L^:Rd
S\BS7SgR)FMe;RDZQCP0AT;#\E_.JU=>5?>A4LX[VC.(f=44@f?+[GX?]e^_JAa=
)gP83@#4?XFK4I0>&SJ8?T+L:M^N(YIEW6^f+G@99TT/.Ub#EH@f1\fc4gP1=]^1
>9T?7b9F:=_RD=SZ:I/C,Ya;FLc-GRf^/GOB#_.^>6D]AZR@<c2,;,EA0VNedR:U
N/0f.+EJ=^17W,0Y#6ZY_.KOQC5Bcg5F.YCPN??TAJ/d,=X6@<QZLCX1IgOAIddc
L=[KRL?-T62c0XR)gMWd_3IE;:YWZHSfKB^]H;b.@])T?B[KHMF[EK@/1=/XJ+6Z
]0H8>VGZ++>+D+WN:_FB3ae)]XR1H[5Rb-9B]IP:@fUW9?\VDLXT&gEX<PL.dJA&
5<7FWeF[.Ee-)]-&4&9N+J;e]EC5+H68G7OP4X?NHU]f1WD-g&fQ&I3:M>=/^WT)
eD,@U2M]#g1VRI:?0@X6;4=RMScR563+50O6LX0V>3@X?W4EK1.^7I5H/bgMa?FN
61Z#U+^+17fP,3C6QdV;S5^d2eAHc=L3[VK(a>Fb5>aE2MI61db6]VZJ_)KLf+EB
EOgT0HE;@PB)GFcLDK1[U3=ORW:^/a0IX^&_38N]A5774[>W4U7EDFGPBGH8=Z9=
bO.70b82d+1>accTFMS_5d=O1$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV
