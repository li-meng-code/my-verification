
`ifndef GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto ATXP device family in SDR mode.
 */
class svt_spi_flash_atxp_xSPI_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command in Extended SPI Mode
   */ 
  real tPeriod_Fast_Read_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Quad Protocol
   */ 
  real tPeriod_Fast_Read_QUAD_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Octal Protocol
   */ 
  real tPeriod_Fast_Read_OCTAL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Quad Protocol
   */ 
  real tPeriod_Burst_Read_QUAD_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Octal Protocol
   */ 
  real tPeriod_Burst_Read_OCTAL_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tPeriod_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCSH_ns[];

  /**
   * CS# Low Active Setup time
   */ 
  real tCSLS_ns[];

  /**
   * CS# High Non Active Hold time
   */ 
  real tCSHS_ns[];

  /**
   * CS# Low Active Hold time
   */ 
  real tCSLH_ns[];

  /**
   * CS# High Not Active Setup time
   */ 
  real tCSh_ns[];

  /**
   * Data in Setup time
   */
  real tDS_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tDH_ns = initial_time;

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

  /** DS output active time from CLK */
  real tCSLDS_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tRPRE_ns = initial_time;

  /**
   * DQS Pulse Width 
   */
  real tDSMPW_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_atxp_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_atxp_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
@\<;WB4T?O<M4^3L&JB#(3DS3A0E36eRCNg>7BW9&4ePQ;^b4<Q-7)PAKB2Z@:<7
>fJf,=PQUJA2VacF;9QQ?Ye2Q^Qb<\e9R/C^.Y5&OCL\F5AVL@;XgH6E><68+10(
V_Rf0W\Q@\Z=1(F6_XVd/)KSDcE2Z:GY5Q54;90Q-;;e3OX-+]AdF>K=Lb><#Z&D
eW24=CX[,gUVRDc<R@[+b=+M&;&45CGD;DO\^WU(/_VVM<HP0EMDP-8+#E^T>cT5
9=+^,]Wf?X59N<;_T(G6XgXW?ge/X4&D=I],8dYY7f[I5WeEBF?fTN9A@f&ad[J&
?@<&JQa2HYI9-&dKD?Ife7EVc>E(Ke?/YMB:gY9E,gHeH+02.eYXY_YX^=+dO)=Z
O\KPRT-;51FcZA0J(,Y>)J#_WD)F9WdR^EUN,1fPWdVW)ggLHL5EgIQOZZ]AI@9A
fTg;)L&W7W,5NH(V,/g:,9-FB&N\XBH+\[N_?^\;]>d_gB2Jc7#)>TeZD16_MK\6
.B;-,eP78>X4(/L1UNPC6D#9T&,_PGd-IR[5b9CL4G7GM)eegH,1BTcY[#_:)D1B
Bd#Z:HXFcPZQ>^8FaY8&9GLf)).6LSM=16=e#OYB12bITI2<5#VLg&(>:c>BT)3H
[P=aC^IT<;]+3AJNMFLT2OdGFeM:eQLQYPM&T+?Q&(d..&G9\7PH=G7(DdgG,)b+
@>R@L:KgE2bVI&/:9DN/8a6S[J(#[QKC-23PPF+R1SCU]5dHL,<IXX+HF3&7^\=U
F@37#(/;4.R@S@8X0RC]=)H\U#;&M>^RM^&[3:AR9G&UE$
`endprotected


//vcs_vip_protect
`protected
^_)#ZKBSTNO:2Ca)=S-_1+1NZYBAZg9&#AS3\4eGFCN;7JV5VJM(1(YEb?DIb5FR
DNU]VKO8S&13dO8]))-6ICd>Ef3ZGV9\He/MFd8;5R-\g^DVR@9_DN+=>J/6.K/U
bLf?R?E,9gNT-B9aEP:L)_\<Af1+MU:(.c01Y..bB+92AXf8C&_9I.5KKZ-bGL-=
L1CfF:P9b-1CTd[ED7.82eIP7EK#KBSaZ=-V3=#FQ^HKX7<QWd3d+9OQT7;FOPO-
)VbT/L2TDYCNE>1N1#@;+=<bWG&EJ?.&,1DX])^\9^[9[_E?ac#7.QU[e=?HV?c3
=AK3OU1M:5/U;G[J_^ZWJa>H.(L>+cL8S6+/9KY=3a<>HO#GaS=1:3+?2;#BMAB=
-E-4T&Gf,gH5W?PLcR7I;f^L)K+&=C@KT^TE=)]KO>-_SXdOeBL/32^YV5=&^2Z#
F;\\FJe9_<c.U5W>bDgZ_9LKgTfJObS)b<#1fD?1&gY97O&>Rb3eP,LdX0)?P1#c
7EKKR.A\fW1]2d\Y1<f4IO^[(R^N/7BG1===H_L34KGCa23ZS8e3N6)(eAGBH3QM
G+[K6Y>WDG]SBQ3,K:BF(:YIb<P6_aA0_(OO3]-Idb[L905YgY(Xf+M>MH.5??1&
,dU8>>R4F0_B&Y-63QW_P/>\KM3]MP,DG<W@.g&D+?ALZTRPb^C_8E[f)58L:_2W
YQ/RZE\UN>OR&9#Z79Nd?Egf:83>80\aN;^CDGH)W0I22R_LN)U/8aLZa--ZKZBb
;EJSAKR]P?+SAC#1fZQ<_4RBH1#FN>D^aWEE3<[bDI<1NbFcDMLTM5dKGAf/,DN7
CYK\<dG-;Y5B(gQJaEH4\Z3IPSU3ZcU#;6URPW7UNJ0RQCII<G3&G[7UB4@gX(4Q
@7RLf8E5)EV7Y@])5J<F0FE6&,I6+R++3K;J\AMADQ9IJf,9PJb]Ab]7eD(/NR-V
LQNBE-YXLYZVS=\Y4F_V?;3O\d4=ID?aHC<.:)5CL@fe\G6X);LfXO3:QWE?30R,
3C\Ya;dAJ7[5JTbd8S&O0\[[W9Qe)RNfA7>WH8DKGE5GXD^Z6;X:f;D-d;]gMAQ)
gGYFU_V[+_3NZ:6N&Y/Ubf,A\].(JR8[I/NQf?S_>W01@C(_>W;[MTH-BZ+35^&.
[@/AUAg:J^>6<=V@aZIO_b[:OH(_Lb8S2ERQW>KeM3)Z3B\B8Sc/X95\6Pb&U/bB
28O].A]DN9SWBN?L_1/bQ<FNGGJCTeH?HgRaRb/HMZ(d:\a=b2\_Z[R.B7@Gb=B6
A):@<>7;8T^VS>C0KYW<WFZ=8Z5dD0NO4]RU)F<56PN^X2T^C<Ya67UfRU,&UF_M
F=SM()N6_;d<cRAMNOggF2C)OG(Jc:9[R+e]UPV=C:OW\[;AX6Y@JKG[LAC?0e>A
O85GS=(#bWbMK,b.1GHCPD1)W5@371309-T5AH)B5IbBb-0LS1U;>4O.PJ,b-9^>
e,=S):7++LR>QJX2^;OAAVe?ELA>IKCU0I3=bW./KXf\RH-0)?7)RRHS=^W>?3Fd
af?\.H-J+K6@@Y,HDNE]@UaCEN\B-Af(Zf@KP<KV@bTAXJY&9COIAgB7ZAC:dKG)
<)>;WMZU+^\ZN,8Ca2DI-L(2<HS+)H8g.AUYIC0@GA742I/+d=S2HOgXeMR7=Y3J
?];7UJJ7g#ZGM9CP;E&L;7[5],.S(4E+W^?P1Xf;\O4Hc]M&9YW&JUC]DMNV),gQ
68\VOPDG8[=FUJ=+-&CYXZdX@YXd?QdSeCCYRJC\C#1,DQ)Ocg>5b,Z.Ra5S1dJ5
FZbIe&AI9d]0WQ0WIE,X464&#3V]WRKYZ9KgG@]W2TZ[A39V1\[HVBc6E@A+Wb7b
SY@U+&4N11#]/dLH.TQ8KJ9d81JVbZZ=eS8XeLKB,+)Qa2CE2?6?+(ZPX1+F9WS_
(7A94V0XFbU0RWC9.8RHDBa6S5c/W_D(FKc2O>^N4a\59P)^7JE[A-0[fZO8SUSS
P^Z(e@RL@KP.FJQGK.<0IKgY.W@f8HPd>>#aXK,fcGG<(,OfSd8U9e;180FC7[8:
QJ_:IN9afMEK;+=+f8IS-S(f^[EdZ:D(>K=#@cGV;Rg&a#ba9-5V).LQQPb8<2-)
OICD6Kf@7Da-O1^ARNBLe@>>CVd<NV;Uc=:gRYQB0TC;S&;+X6RWJG)U3Sb/\LIH
cW^<>MI-N(0?-OD9DI^=WDYB=08:N&Vf+CT9aVaLT@4X&(04PbU8.[V(ZDV_GR_B
KaY3M.UFc]J_WB85.d98#3GDYeQ;.LDR_e,:2G.HNXFL)6@?U0C>V)YK44G_2\7M
(MfT\O=@7>W]3@1-_/U4Td(.AV1OZIY_DI?_^:5fb6>Ee^KW/OgZSU0A.5McXb2C
HF9JEF1FD5>+V(?2QN5UT>XV0PRRBNe/&ZIBS;UI\gMR&J9H.L[>N)^ePB&<OA3g
5NFg-,N0RLIW1M,@@DMH&)4U?26&T9,L+ITAf(>@/NJ?U]77:3HYZOEHPLQ:GCdV
8<E7-;=].@.+O7;E=M-dV19XBDS2REacYB6(+<QA(JXZ^D;ea9b8)CZM?B<B:#?4
@X<JAI6/eVO8)U6WaI^5?AF+C)7<7^ZI&Z)G;+?LUU9C5[(RTeGO?D6Nc#b2Q(2?
0.?A;K^JRKE<\4I9L/0AO_]USE,:4EeIA>W-_.(4eK<U5b,^6&?OJ>?8Z_0,4]+8
Cc3J/0ce28B=XC\2F=G51OM7?(,[f-IR^(B@AGZb8O76COTI,3T;VGU&R1J(ZHGG
+D/TFFQdO<CN<74c;afUHf]E.<;UW&F?=1(J2^CW^N0\L/PF&\3L8VU8W.]g@3eL
)@G2+=1589&D1UDEV1@>5-PQLV([@X/+8QG,0UJ892a7W/U;6SWRK=^A#6=U2\19
Fe[0I(,K+g2J<@cK.;?R]9,dD8M#;3/F=CF.CIZJ:OJWXe8B0CC><T6C7B6;R3?E
L;>POP_\;JbbXG[5/a:XYO?52=HUgW5BH>gYD::V[7\>[(>>bMe\OJg<^I]AR^]+
,7=LZTRVB[#=<1\U0NVO?EVLC4P_dg4[?Odd6EZK:1DfE^B8/\L0DM(8=&Id9Yg\
J>:McE<+aeD,+B[9A@CPN2GN8S;c=77ZCAUA_[N=+[eFb=SD4_ND71/@Z[g(g^G3
-C<KWSGV+8MJWVbJ&6a@L:B>.@QKD.O@/QW>,^1FH8e-_K4UGd^IE?^Labf?W;,/
gdRb2&[VYa)fM3SdWSB<;/F(bH:.4R^BA973/T4TQ.U#/2OB9O(L>.KR8:#B1/2R
4P?Z7.C<&PB:Fg^B^6@@\Y72)AF)G+6e&P_;gAA#S)[;WZ&.H0:bDO3Pa.;2AUR<
UO,b2LSFUUMHS3>/TTe(C#./J8bMc1R(]ab@42Gf(-?;G;L@=<]&U?T[.7:6C?YR
91;3K>ET__ObOb,Kc#W^=#VgT0fV^&\ID-aN=3H;J24#/EV=T@=NMJ>G9KC>7<U.
GARZ7NLJE8;IgBN.fYDb&(P+#;.G_5O@Gg,G:gT?@Cd(RHe&XO,STdAN27XX1bKN
>-b\Z&J2d+;U_g--5K:aQY14HC6d8[?9Ag]:AX+IF5+M8[).1K/Iee\GgF19J(?@
+D^aM-GX;VYNfO6@MGc]FW>c?/4NN8SE\Q9^)C<-fg[_&aab&>(OCR6;)Ce,S7IO
WI&.<J->[e<@R_a?fZ^EO:&=V?XIN9QGW1LKbdQ0[IOBS>bG24ZS0?]+II^c_&/>
8DLIZf0;6A#U#:.++G3X)0G,D\[[T\eX(29Tf?6:4ODI[8;g?7d=GEY)C2g_24B,
3U;SfCaf5P_Ha2.fY+L>]G?D2J#g?IQ1^e@.ZM4EF/Pb97XdbM/dDNDX(g4\X6^9
3be.()3ZU;7.X81<;Zb:@_e?=88@1c&NDG]Q^9#9OS=LG.3g,2f]?V2P)<V3#gTZ
Q?;78,fG43\2:C)0)4YA0O-e8V7</W?8aTN31A(Vb25R_,QOBR4,U;O6&Y[(AJ:1
d6R\-7FF.@090c_X&E1JBc8,_V?ZPO0TNA0V+g=ESbbFM9C)22PU_4WR<3f:K?UB
g^9K(c4&;9I?&FFBM69DG6^.D1b,ZGS/?HUN.ZQXB8TN--Z3Y(_aFeU]d+AE^f6e
PX5:I)Ued70;caC2LD<.:@LJ4bJ4/)[I@LY\2\daQZT]f2?4\EKeIX=P9>GX2PDG
WDO]3#LJce_Jf.;@T222I1DQ-\Wf,&,7+F@;>J9@]EQg9P0K</M9?0F:-gZ?FfNH
36GH1TTLPSO8YeT_:BV[aV-5@?;SeRbNM<HE[CVJH.56K2BS8XgV5+ceV_Nb3:7X
55\8c+NN\_XQDC3/#HdLJGReVA8)^\CTC4CI>PC8@XK-Af3RaB1J+e#].K29[Z.3
[0OJOD[W--?V]4^:F]/.#YX;g#c>&ZGVQTJ@0T]+A&HVEQ;3\<:)7?73L()],X@@
5L8G(X/1K-E5&NH9=7G+0-7P<GV<L]Ue=,I\FaOPOZ4.X).JVQ]K8f&/\+#Rb&-T
@YCO0L@LfNA/#QWcZ8Z,E.H:G:U&GbL;0C,C4L35<)KN#WW4B_-N@ITU:,WS)7Gb
=KJS]-2(#FE#8M_P+)PLgY[U<-O@7V>2-74PI-3\Q+<:3E+1/T1S3S^MV;[S>J-Y
NVUH,\[7K(0Fb]MGZV)J\I5edS7f2M1S=CZPgDYY7B2.O:dJ[0+;7eOA;UQ+S^AT
/=O2P@+7[&6A/XfR/_<1Q#5,H>[7XF[3UffM0K1&O4-PKTJ9#>.0YQ.64fc?;JbY
#98:X:OgdF?U:NLfI^fT/IW@a8^;LR_O2HJ.a?DN5OJg3&X:K<5NN<&\(V6D-+ZQ
OdRL#0M.G+B5.KJ7LC_NF41_0&K1N?B)Of()?E\_,g0)M[D2?#N#E+2[R#&\2cB9
I6R0P^D_F<].MB<GPI2]+bf08NHD1EV^81[</+_Z;3>1_>O#FG3,_aTFK]JR9].d
.JWWE^GRSFS7+8J=-+71QdXAeO3C8BVa:0Q4I[3AW([0f?1^;@]gNg>S.C(@)bbV
)]UB-3d^deE[3Kb1F_/+Vc^fFX.OO,KQ9<-A1K)(XF-GANLfW^Kf@2;IRP0WfLDK
cVBLb24,bW[ACJR-abb=#\PZ#DPS2]ObJAec.O-DB90:KYG;C=6N9A22D(/B]SOH
7I;D\<Y:Q8NOAK(#^&W+,4:U-A/&(?Z0F]9OPWd(LWA75Of82Fa>:F/bFV9e&]d(
g;\#X_:VG_W6O<d3/&JA5H&d(gI:ffc_REYPKEB&22F-@^[<6(aSV:Lf?N-c.)AN
7WI/[W:1Nf(E@1P]EIJWPDO(O\#[1+[/1aK\Sc3PeR6K2;8O\+@e8CZe5/IIG>28
3;;R_DOKaLH^0/OFVRc86()CF#HUIT1XWZ5SaHC:_[]KMW7)>33,gYZ^fT8_ZCd(
);3Q0T(63&/2gW+T,&//:+VAO4N5R[XJ#9U&VN1NZC:GV[XXO1eeScW3+M(+YKbI
bC)L8W172Y94DFLNdQ-&>?AI/SX7;#UCfNg/TbSKSGR?4-X9\YZ<+X8dS/SbL,,4
J]\;4=?6aC2J5<P>RB<C^;+-0TD6gGdPJ4?(ZU:8.X;Cb]MJ6O]D,_(X7Ae0aBNA
CC+(5J(Ra?Ve_48F^JC-8Ha,79T]K-A8PS;.(>5_^=]3SFI1RN^LPSHGOE_AOY5:
:dTO29J\=Lab0ODf-FXddVfZZQY#-#IR@6\N1V?SdcDVbHCOc<)RAgc&LEO]57?;
L=.9)S10LDIL-f29e<H@ce#)7d09JL[-86)9:SRSBUF^.V1-TeG](&6,)&@>?#I,
C3\Td3&/3VM0(47L.^N@1)?C,XIWA=8dYU>OE3+V^.@L,Q0W+C,P.SSA\b<d.Q1J
AE?^4<5#^[1RIJXa:(3Q=WWZP,)Ed6RX=Za95#/S77LX)113VP&8CRg6N18V+fE:
YWFN#KT,IT),FT-B2@X/>>+UW6H=/WLKJ>OO--d[M5DTc?Ma,Y?Ta1^;[TB;NQCS
7\b?-N\aJ/(>I=eG8\?#[WP1YI+)D2YZa.SF99/T^&5P@M<X[=CE<6SNR;:9378J
S_^I(]e7>46>I-SCeXP1<8>d1b>7/+7BO/AAOG_16)@XV[A.GXSB\C/a?aS1YGT#
++Hbfdd\1&f&-BZB_U,g@ZMPfX?,[g4&#e;:@>U<CVPgS@A/#_\(g#8e<WTG=f0I
b+2<Nd67<;^R.^K8G<eID.C9N[fR9DE8gaEBUeDA0^DQS(J@VERML;@MQ\/N<-RK
#HOXbND(<-U]MTX5M_Y.<4cdUe,I/+=\4F=LKd7MO]LA18KaMU2&b6PQGMeK7dI?
]731@,R>fC_[79bDbKJAY1E8A1[X5-YA:?_-T/#cf-\=UH=HO:-7RZMK\KZ=f2H+
^f/a^NW#X#R#3\4MN9NDT@Y;,]fg2E)5)Bb8Z#N)L)GJ-aL@/;ZZe+^]P+#ZFFbb
WT>7:cAF#@2QF3M7ScZIK</56CG=<WdU/:TC/\^X&#S.+UA)=3Z==WI&O[e@1=:7
(QgKS^2U6@T6fba+J=TgCMCL1e:3&<9gdOd9C5PZY?TW4Vf(@UN/9B^-Y5WHA0?F
R.@:5Eg\1#0=G>BK?W8=E>?PQ,(4Q)T#52ALNNHeS&/]d3.;g88U..YaKX)2:bU-
1?;F=?>-4EAR_B@>I+@D&,(WR0F#EMQ?8XQ;&e;d9XKLJIUN5A-=3d05fQ1c-Q&=
Q4caCR187a@[5CdU;V-K()F;1F0188B<bUe?PDC?e-M5##83bCf@dSeK-S2a+cf6
-NCWN?(TVU2^#e@8/B&aY@&e-78gEIgQU5gBTHU/KTPS#eU:b&(#.SPcC2b@?#Ib
(KUaSMgD#\dd#R\3CJMf0Ib@HaO#Y?T.f7b8(cF2@HFI5/()+@7?SM#]>X,95A]C
FB3d3M>[4:EgE]f)<NI?8LRWBM;K3Tec0A6?b=:^Ia(#\IC/.=)Q&0\+F^;G,1KZ
VI<2Q:]Y>STc-QLHJRD:-QFCI-^C0HL_:9JA3M[-;CYQ\@(5cK[DSOL_B=8O6[,C
Q9UOIc,7YZf+@H6[K12)S;:f]D<+OE^U]51])[?G@+EaRPAAZ7VbJ(ZGL]Z&ZL&\
JW3U0D4/BL^6R#C-ADQXHLOa4+dL++OWSC)7]\#XbE=e=P/dYSGFS0,7ALNfAR@Z
6S\JUfQ.T&-9Ga[e)d]bG#Gcb3:H5\L3;aNSUX6_ee2_V+R/[<]?,cZbM@eY,8HX
KJU>b+5,HX-M9>_HB+;EDFKD5BS@RMQ(gb[^V3Z.QP7KH6a0UQV+E1D#LcL5<26_
LbANOb0UGB>I7UaR+dK)YM+V)@bB=c=28VbC3>(LA0SL+D#29BVKR.6SE7N8?L@3
9\ZG9,/4&^KDFcQ=FTUEKE)(630,IWe^2WFLPZ/Q.LT_e,9_TcQVMc3,XJSS;4>6
J@[c46NB)8++#=g:6P-/F.8T),Xc?<NQb^]7S(68X#93&>ad#VUJUUBOS:3Ob@/#
)YcA^_&5a[M85:6@9:d35]BeA2PFG_4LO[7W^=UM[H.O2XL;60K=e7=#KBBbST-R
cP85WaQM;:KIQ3:Wc#BPg2X0RO@g3?2-<EC[;YNNS4[eY177(I\f,\OU97HN180W
]KB=;eeUJ/FZD[#g)JHP:NVQ^U2IUL\gN@J:6/8_I036G<=9_Pdb?f(eS9+SYE3C
T8(3B>@9?]]44<<Qb?T>2)F7<f]I3)TA>dZ457_abG+6ADI_aHY@CXePPeLS.4/<
IXg<M;B-025Ha-V8Re#2dHR]+VGa7^4LfXKII4>0_T;cLRTUA[2g;Z7NU^=_I(9Q
AQ0&,X&ASJ6MS<B+33]b3CeZ,H>[]&8J+2eK)]8[>C<=UGE[WeYW2<ZM;&MIAQZ?
V+DL(G?R+Uc9#QG2N^PNWBDIPY/-G7[23#]L=\S=(>]FOS/]061eZ;;R<Cf:I\Ab
fR+6#;J]?7PfU,Z905GY/G@1)VF_eNNO(<-#7Jbb+FD01MYO>C.A.+;4#7)L:@[3
a,[967)-_Y;&;/HL&6A0TNBO+4NO[PeS5:VE.PU#V579?04S;EE1[faf<[][U71U
N=XOCM&@7T9.J8_Z;.I3@(eH5Hf6bBY:;+F)/,#N23?M7NM5]=H&Z4(7UW@3P.>[
=\g/1>d8^<EL9V^G:5:IDAZRD_WDN^QI9dL\6C1M9XgS]8bY2P.e<6EJKWV])]SD
=PeVK7d_:U+ZSTTac\Z,-bJ55+\/1+e(Bb@27@66d+F1:=XO2(cT003bPWPd=PZ=
S:J7FG?@B4P(;,>\UA85(V,I/NYD\<A=JDB<AU1R,-FYY?X&LWD#KWR_YL0EG@.D
gN,:7RSXXB[#)LPM-?ZP4bb[ECM]WDGF3UDL741D]^BS.G0O36=:c-3CZ2=1U>dD
BL3[0VSAP5YN9B>N8W,UM-KUI/;==>\B&:];-L+6cEbHOY3_RE_Y2]D.E0\LHe?3
&5V<G-9NWK+\I6Z7M&<aAGH@7-L-MNMJ8K5QLdIWM826\^SRJW.K/DTI56;gAYYT
:1=W-EHOEQN7V&P=LK?STZ,Q4^OEY\H]#WaR6CN7fbe;PKFVb@6\[7T<WeI&D@HS
)>eeId\\B9&+6YT=H]XO1Me&9Ad@T;L=CNWb8d<EHG@IS^KDD]WS_df,QD.I:gSd
);ZPaF:(4VI[5gND\b-fNFX291>&ZR-Z6.?S=;Y=0:5?QCG,_/91ZK/I,#6YZbBf
]2F:;-aM<GG/#\#UeEX6IKRS^G042Kd17^O32PQJDb,MM:2AH.1G=\-e12)E8@fP
\Y[G)V/eP=8CC@+JSR,QZ+W2/C+N-[cBNG1E#W/P^c6L4BV0^NN,C&3^a(-WZ19X
+8);L=S5DP(_)@db(OGXU6XOPXHP+QNFKMGT?]G?0DTa/5&OEa1=f_H&(df3C-d<
.dfe(X^=4-1bQeZ9#.T:GVDKAVG,,>O_LY1Z1@K.Jcf\5>aNEPJR]TJ-(O[Je(E3
f&Z0gM93X>ULRB(d6]LQG6I]e^dGc5M3^H/E8=;7g[N&ZIf0_Q><FP2GRLFg:O5d
ZK8AGggB8P6:?,da+6dN0&LYYa&D:FfA+eJN[?F=gA;,:XJH6]UU?,d@VEI2T,<N
T4fGUDI+TE;2^0GFAaL+K5VPC1GI\DY:M:PM=cH#[R8#9H]/+3_(-Lf\:=)P^Na[
PQU#?\#eKN(fWKONZB:].08)D6=CeQ>P4Z1^-6L_G@b<&:R9JT[79Q=c&7=Y:MA/
-6@&:MO5Zf[9OGPfQgIU9He[JM=&5PN907dNP75XN1AC1+L&D?QC0=7J^>-f59A:
U/G0VEa2VG#LFQKC8_L8M?E+&\=+@N#4IE4X>@g1?bA_.+A#8ScFPCeG\W&5Wd+.
P(3,O,0QB[FD(T=L&RQ7BP)@e845C/IWUQO-HEUXDWM8?1VG9.MB^>H,ZOaDNE^N
TS5B\e6?c=X,U^:+S:?^>BVDgF9Mdd8I-FA4>1cKDLABVGB>B>,OaTdfMIF9,d]N
dV.C#7UgDbeU_AeAdHeg=gPK^[=<[2H;CU>V/[>[[CK&B&T:b?IZc5T=K&)^M334
PM3e&?2C=YFRd1=7<A<>H/K-O5D+P.d;1)7D&IM<-MGAH290-S05PMBXUR-^<5P5
BP3ceED^?5FbED2CbcQ@(e<]Y)<IXWCc2Pf1Ve0N7G-?gc<:e9=,F@d2X2+_4bUX
/48C<^\LZ>SSW)(d5LUHKRY:J>\^>L0F/IFT=FUae<EG^/fYL<ALcg)4_2>OF7LH
\QQ95AZ>K#5]/H(L#7ABQ#OP3dfNB+-9^&MZ?P\dEV<@bZLgBQ^MHDE7T7@@(HLL
9A0d.)W#WIbIW[PC8Z49(@<\L7HL/HW;He?a/Q9BLXKD;5aQcdXE0]ECTCA\#XKE
G<S)SBb9Xc(.P=G0IT7IG_,-QR(#R@=HV83O3TJB#++;7[PAKR?P>[7e<gX7e([S
XDMK(PESS<1V+bfb:ONN2ZO(I)2;,3BMRdDFb+>8aO6;d#B(^b;L^PRM)E@H0RDc
)GTV36;<f-7>KLPgbb8=CTMOD^I8B;<(bWVR76Y.-H9T[#R4,M^0cT&W(QEb,ZB(
R3+FB5:(0X@FHL[1da4UEGN,7IMAY[Z1@RU_UT)aB4Mb?Q_B_aW-b=[98IY4W.?6
L_e3PF9ZG8Q6;P@TZF>;F9D@EUF6[I#9IGE#F1425HG&R?<Z]+]X0HRea&#&/KWf
MT.6QQ]WaeG(SFSV1c8c<8&C>;@c\9_D1V,DMS7:#EBeXfBdBa.;c=HBJVH?OG^0
[).BI>;-PC\W[4UJN#Zd<[faS(9ZL:VM2._e,=P-ONd:&VJ;4,ZA2caYcfLCRK=,
<O-5&9;ab>RL&T4ZXPE,_TGNW.E,[EKQFaHaGA.B\2Y;\Ifb?_5b#2+:/.X;:NOP
V7PefKFbYYZ)-^,^MP@F5dJ=Q-,E>)0O?Tc4>_&4-]RTA?2N6/XB,g<S=#F#@CFV
T44+X:OHgK;7ZDJ@b[0]5+Q1Tgb7U2013SQY7E0JOLSdQd90.6UEAWENJ/A3g?^C
ebQ3.ZbVMB&aV-1GSDQ\WA@FVD6-:d#-5HWRc>dcR<-UCJF];TYSUL0fP1&BAD1^
>gcNSPBWe_R3-IFc77)+?L_+5VLFLKX_Q4ae-/\S3B;9cLUOMY1Y3#c\e\GJ,b)d
;>M5.IX93[O:PWZP_c;88;BAd03LF8?1N.1C<\ANV-QH_Le/JO<2S^^/\aPR8/53
J@8.Bc?JcQc549RXX(6131R\>AY&.EN0H;+b#DeW^F-Q6QGCC?(6J664[RNGbDI9
/Y@E)O/,Ze:OKL(?a&/R^93F\2;&&=;eaWJ;JbWX<D>CfW0dA&<:YVdJf@cMe0cb
/dc5F;\b<RS<DSHZE@OYeY-FC62>gPb7,(.(,&1:M\BD&3>=[2aF\Raa)ZI<#K>H
HQB4&0Y6<9PAIQ0A.c\QHgUL1^I9aOEb]?FS@-_cZe\JFH^;bI#J_>a?4A)Y1KW:
_7+CXPVN)KGe>4F=Hb6;U\LWf2R8d+aY]:>5F&YQI];J0P^]5Q<@W\WS?c/RYACR
GcX49+?SNEg^S<R;D8TH7R)Cf(P4/VWT8E=.]UWU--J]85@.YMJ0_R7VAU1)MM(N
_8IfIc&DHa=V1;W]V;Kb]UI8/.&KQ.4gg-RZGMAE;5H/5Y@T5ZW_?eO.S>DcO(K0
SV=O>0/a_IB;S8V#QFReLO/V]_Wb]G0Nb]WO[=P42(J11d=65I\YMdIBD.O2H19]
E^#0+1#\KLY?1,&_+29D)8MWHJXQ)8XJ4+R#e68+[K>eQBLY,@>8fSDYPXfeY9-b
-H7H?<#]XZ54[69@3T7OaE?EWZC(19-7b&V@EANH?OL2cIS)YX)fNS.&0b5SAAB;
F<fWMed+-/HW[C9OD;2JY<&GDI^&^Q3Z=#[f5E1K@d@86DG(S8V&Z#41VAMB]1B5
IU7cJH8P+8+-WX&^,/e]G^3KZS^0Tc1ESgLOD7Z88PbQI#7Y>]]:d]a7B2))@.>g
#__D7?&Q\J[9e(0@9<=_dRcX9Qd=McUJ1KU:7@I2<HS/=8Ha?1-.UZZa&TD7e6/<
[<R\QN:??G^bRCBfF8Y24cU,3N[95W5P->#FT4Ldea@84fZ61?#O1Y&+.?P0P^ZG
Q8.e.H?#74BDH,8G./HaIEcQ0X^5IGI;J78)1TZD3++eZPb#ONS>_fdXUNO-eY&c
(;J\I.Q@9bN.Qe=1,5P<6[/>Uf-3.&)H(3SQLOR[,3V#L6QI)WZ<,6,\a<-B)-c,
]O^Kb>cE<bcYN8(^0UFQJMZf7@W3b#2C?J\BT<Y\)6M@b65#HI#HCSV>LS,X8J@>
LKXYLF,JCdTHc=c@T1T6cZ3QJ)\+3[H]A.Q\JfFW@2@F:>D,S#5\eKYC81+\10@a
YJTEB1HJ>cK.HNg8-PV,?IFV#;V(?(GV#^C3<:NN/ZT@XWAJ:F>d?_YcQSNcM:MU
aX)3_4ae,_VF+JC/T[&B7(b-3M[2ER4=QR[(L+LBGePAeWMV<M^K3K_[,::-GB,O
P>;5R#70N<X>CP,gO+/2:F3V0<.U]Ea&@Q5cF,+I4@@JPV2DJXGIfP4F((K5JK-C
SL&+aCaS:g4K;W=EcQ.M8/@@LTA/=X:eTaDPE8\b#4VKHMMSG3-(^0EVM&,9N[g4
aAUBSe8_7#G83+Y+>0G<@6be.FUQcb])D\ME+QN\-W_b1TJ<8FC/7fM8R/N_3L(F
^FDP@54(>_2:P)6][KdRA&7:V&XXWO/:,W>B(QC9gMUe>3JdORS?+W<DR87cJLRg
=Xe)eS;9=+<6&C3]O#34=/OM1I<K;=CYdJ<WS7G3f^Id[WV2.[F46+GMC#9>gE)Z
H+LIL-@84NaHU#P8T&(7+fJb\^2[>/_/E0_5;WebKC/F&X8A83_a<GYS?#&QgWg2
ER]#92&L=I3T^4&;gXZcOe-d.0PUbbd2P#NPL0V@ScA6ZIYYTAI)B48&O_AU(G,e
HYJ.:@g0[9dd]U.a00;DX[U=@[.U8Cb;bc0,OG52Z.]ITd>aLRbfHCOY.@IKHFQL
YFM[<:GLFd94VNR7<g7d7>IOaV2f22G\df=C=Y2L7@>UcFEMg#L1CX/E<<5+Y,/^
G0O&5b:F2O.,daU(OSb#C(ca&]/\2)#EWZ(CZJ9c9B:7]P57\R#L1[>/,eVW=:1D
T_,-d[WQ:Q&Od41/eN:=S#P]dU/C^\E.)SWHY7RaE]748T:+YL/QZ)2:&GS12R6,
Rb[+1Hb7#\Z8(f@S.eJDV9Gfe/7bg57VIb1#3]I4U\&I65NSJ\)C\6DGJ(8TdDCe
)W)SQ=:_+O\d<)HZe6(b.B(P_]76226e5VY923A.8/OIQJeK0U1\C9P@GOV&[B+@
;G-\](#8L8A^EL)(X+RFYa-13fZ_0@6J;cA8ATc)TAfL+MfS#MUbXYPc(e\Ag9EA
6;,/6fP24<b&P_-(K1W/X1.(cWK3XV7>g1D17ZWF+&L.Y4VN(.(.@4HCf:Vg;FJ/
Q>-9<g[M3U]Z+7FTVSZ>>a2+A,ZD^6^QXgGXU+Y-[&Q?>DPU?4CF&^5-JR^V^[R?
<&,5K_fE9=f0R,@U4+,3>)dC>g6SA-/(0UGU#LANM99Ie2]G,C):)/ZGD.>,9SSP
6VcVLW\T&AcAGa<=BFW#\b54FfC@RfS;LZ)?5aYZMW122011VD_4_SKHZ682JF:F
HNO3X.&1<;:5LVF5K#@TeJ=QV+1OQR[;:dZ,Ze)K],(\@aEeS13fD^c)N?31b^0>
=O]([#&-gBZ:[N^gX2,<R0ZN&FGe9Y73KG.XH=-I+YCJB8aMS#c)2\UQeV1&(B=1
O-&BS&X(TgPQ_bE:U/TSPTU(YDP(=CS\^R_E7C?<Hf>GR]821Y<.?+2QR6KDEd9U
(O@D0fM:-8e^9AZ6B6-TOW7d_1IT<I^U0Cg2bJ5bAQe0<Z4&L]4f&E9f]ZTV,_MI
FKZ]+85a,UBfeQ^29R?L@3Q]H8[ER7,@H^f8YM=AK\LLE:BA6CQ-G]88&J:VOQ+Y
<YHFb(UQMgb/E+4.NTXO^8<WJ1g]J[@BEgIP:eGfDT>YYE61fR1-O(Fda6/GT1e2
N3ONKTY&THKXTf)E4_2;8W5XdJI]U2OMIHHTF/NeXRDBCe1/9S\e^X9?(WA2\,^X
(FF3D_-ES[)3LBUaKd&4/FC<c3+.bdXIfQ05NNRAL_?LAP1I(NfH7E+LeeTRaF-=
/6Qa1g,)LGR4=WH-E15a98KQ:UaXX_X]E1(:@AG#9Q_/eAO^cOEC4E#/_KQY+&\0
FNYC=fXA?2VF#DJgeE:K;.?,_6S6cd<Ee=;M2@]=f53gML:TPU&\04)93W4BLYCG
;@7RA<5K:7]TDc==#W+;g?E+A5[#+.VK.,DF]SR>_Q\dC\87CH\eE00K].HE.E9:
?N0<f3R=1=UK(=da#b7D#U?EVH5KU(8FVA]Q)\O1VKB#(,P+CBLI7-]U<TS<&+GA
DMVQO0<I:3S[]9&M,V5Z<,DJJAIV&?A#L?URfa^C2R6Df5]K4D:,>5DE]\bHZ,+.
(Z-&V\+cVB9<XYI;eN>Eb?beZPYEOVbPUX7=0KGFS6U0)&TIG2KDgF4DY;d6gI_5
:cfHV@d5@G>d53FD;dH)+P@T/&7?L3130;E-_g[cMGTWb#M=?WL1fW7b62T)PH7R
][4QGF/9ZXZA7[;b)?;[KWPPWUSXM5]4M@32BZg7[0:e:PI87g=2af2;AD@>1T2N
XEM-0ZOSAIEAMGeOf7[W_HU9^L889g6@PX5=c#aO)@S,3@,fcb8W--PY7+/X@1?R
D^bcRHHWaI@@)bgPG3BB_FA]>:=.W]T_/eON>+^M(C4T[:Ec,YOHM#7AcK6[e/ZN
SNIR.)K8QM.cM,ZM)#>8R.b_N-QO=K:?NJH;cUW\9(-g@LIgND]c,>2EBGHY6;ce
6/I2H74C[M2&-d.eXT]gZ?2^fMH^VB7?#LTJD;/.4B4D#7T0P(AY?b2KY4@X^PA7
1#,+P/2K5dR7O.gFa>-WL+[NW@YD_ZdKBQJI@6HDW7g8?9+R+/:V0-1D^A_c)2;a
2@EV4a92:f=dE1=:DWNcMg22(cXKX+ERH&eS\&;]\gLVB&#e1&d[Sc2)1A(=J4@_
OM6ISIc.(b=+RH-#;@QNE0S=#&T+#1V6WLfC]L0\L091;EV)H.SZa-+LE59]_^.^
PEZVd1MO\\#:ZP&2Y,R=Na=AN+BFM//7O\LG&G(NB:&X;XEQFI5P^Ma-VHdL+&7K
[5_d5UTTLHg9D;K;e4P/(GQY3)2U#TV\-]HMPRg/?G&2_M-f.gMUQ9QP:cH_##3b
b@XLYRIR#.g>:])T3+_7L.EE]D]Hd8gV.?AL\J.YS9)2VN9W3gbf2H).]0=\C&d2
90]HPVgd^]J3/OfKEK@WUUDH)YZQ3&0;bMg(bV<VFCYN\PcFW-8(bR7M_+LY[^J@
>]:e[b-K:?BI#3KP.OD<1Y8bKJdNVQDEXf:Wc1cU#8FSd0X?G_@(0B-&YADHgE[L
)8HPKW+UM2-3AYM#@RIY7HfP@B]:UUA::5A.81H&(&=3Y=12+HET]a^N=^0_6Uce
L3@ERRd6DW(b0E?0?>XA9PQ;47BSOMG#R^LY-S=AMg^X:J__CC6&((f>bN7>V52M
4A1#7P7>gF[5b/3c_8+];R]_0J,Q<fb4N?(A2HT]8ZN\)&E^W<NMC>fdb@23J/<e
Ta/R=4?B?+<MP@VIb.7NP:Z<X>QHW3WfgP=A]Zd\[V589;1e1#;cTMQ;Sb-561[:
bAc=(9O8TL>4W\Y4K,&,;^?&0R3M&QJC4:F,:>P^f;/B@^/AeM]3HV;&AYOe@d7I
C8RV[_-c=((0Y6:0-TUN1b.V>]8a.T>bK]6F]H[99@aO6II7H.\OB]B(C<_,1@Z8
NL3>04S3D#FgX3FcbR]J+U(XZ7-Q2&BLb(?P&7+gM:C_-FbNb5HP7#PF]MKg;D\S
(:9U>(+B&->c+GBYG\112:HbZQgYYEe^K7TZa[&7,0dBE0H?4=Q5>NQX1)3fb:gZ
WOH;\VZ@Z2G#5eCA1@BcWU2C.V7f.C@>?.[<>\-P\F3/A?B&.I)IOKYLfIQgP0^Z
VZ?UbK9bbY4@BR\)a[PFa;(@.23,H2QLO],VGJ3ECU:EaFV&[\8G3-]gSDO?72ae
LQeS\a@2UcbIG3-7^C=-Y73\<<8c\X-A^MP@3fDNO(6LS9?WU:_Z:J[UeN)/685G
WDRFb5RR2,135)1;2BFc;a5eAYTROUTOTPfQ#FG<gC1M=ED1]V]A&_34TJ-@Jb_\
=d6fN31#QEUD@F1ZLG@FAe<[\5I]@./(>?e#>_WW[D##ceZ^6._87++\K97WMDNT
UMS8LVYAK5W;@34d:I.c=_VA5T5^ZX@<BR2S((D&^2-bDTS7J>4;QP/bd5]XLHV?
&TC/^4b@_^H@0>-Oc_\Kf]T97&RJ\eI2+])Ec.4>Z#W\1Y)&3bc-AUW@eKc\)TYF
2Jea<U>8+)g,_8KfXP^)C>=5R#g/[Vg5EUf@PcWJ^S2ddK\2]RD;7^;OX&NdK^0.
)/S+fO(#9?8U+K1Q/LBJf6B7)@IQdTSW[OB2-U(KHSSb51#Q&:7UeU><5eaMK;^J
>,Y?YBe]7RY?S-+AYc:KSgPP\)e]W9E8R\9>:@CHe+>W=g8Fg3:]2a/aDLU>YO0S
>/U)G<f4CAN\(-?;KU9adK:;)^[]&5I)[[W?[/,PB>OO6D1,g?Y_0XL7V=b[3A?f
\XZIW?^_4B2gYF(>)AZ]:2&VPHVQC7G8);#b+)>CIU9f2Z0d^\d#VSUCP0,5LKAV
V-[GbYS&_5NgJ_c&=FD77RMIfUTQd(+G)V.(5R.H56ce4&A&/AGOS.;A3S/<)6>V
&Y^JL:ZTQ.bLXOec-_d+F5L6Q>3;X]U:eRP)dHP]Aa@^BZ=<T:QV8eK)BCCf)geY
c]5S(\4+U2cPK16E<b1V#:EDcg_YK@QU0<SO^bV42Ya?U\f-B=V<?8a<X2WMIU04
CGH<>U#aCgaH07X6LS]=/-g3C5dM7<,E_)4+S=#6K6X=Y.?<K+J=BF7^)_;(5FUg
O01CMRE&NLDAa/^OLSJP,H;A+O<NV]:\f-=U<>-8O>RZ(]#JA43K\;3d5OM4BATd
UYb#3C1Q->d.5KM60L-D[\Ia8[a->&(fLAL8I-N<DEL(7;J;XU,[aHS3T>eRP49O
A.+C1b)?+dJ(EM6P^[)cFK2\gV+<fc3I<Q8^A8Q2fO,984eA5?N1Ggb)bCL]\OE:
VeZ311ZZS/@(NK(I8)JU6&62aX:L4ND)WPS>N7DL.1=]XPIB=2;L[>@H-OMKeCNA
=TC#7d-C1(U1C=Q>=;fM)N8RXbWOf6O(E?6X,L(Xf3=038B#9B5@Q@CM^?X[U=,H
,GVc41>#D;X3S<2[:3<H3YB]dCQ-417C?,1cT+\;1F+;dGXTIeVfT(L/P+B)JW1H
Sb;2@UTC.:YWfgHC[R9(TO(S/MHW(,[7[K@=,,T69?G]7Ua_3/J.564d3R0(HeY:
QV&+A@VZPX)XeW02B@;A.)2F8KF-GX-+--b/IW?((T58VI:#8#;<@\&_250\77<-
Hg9LK2\+:;^\7RgC3g9@Sa;bF&b&B9IUH-,_?4B7;3T).MHAb.EC>#WWSJZ?S0MV
S+EF+9J:#CNXRU<4_6I07cMd/0]@b&E:Tb9\cO3UM(2_]T:]5,+/R\<,WE?KGd2Z
MM5/HW3EYL^V&1cP_&X780[HJG)&Ld>0>+eBFJ.RR#160eU?\5(7eafCOTLgI,Ya
ZN@6@R#^4H[JQE>-G7/?F1:DbgURAND3E./[TeZ6.>R[&NQ/@4O0=OE5N9WS>7MI
-fH^d^H+.OF0c/g+[60aIYc6adR)12@OD<AW:0bgT8NZZWb\1>P77-:KM8<6X0J6
4:W_?PDLbS/<7-HVO\fFBCR7.Xb^/2SA27d?J6b3O:c5L?BJ](5M<WWCFJ:A;>R>
\?\><+2C[/G2JVQ(2JG+XVUaZSITG\,PH@W?c@H,1SP59\]DBfE0Hc4W1KLQScB4
.T_551LV@EEf7aeX>TJBb]J/Y+F[(8J5[_/0([SMC3@9F&E>N-,^bFaHA9bJ+T=g
DA9&CbM,]DI3I\a^RE:K3cO)6LHdRDK(QHN&>/:d_5F<M7AUadKMd.8D,P\T-;RQ
QO6>1JKO86Je=.+4+fg6KM31T)8>1-G-]:7\gPV7).F#dX?7XG)KDX03aJJ^O;_S
)X2<.-:b9Z+-9#a6@GdM7f9(.1?;U8_VDb;4IdN08X-JN+Y_ddI@?bZP,g/YgO4_
>0e=aSTfT0#JX;OY[XeRFU/<PeL?8YKHG\Ye)-<7G+UVK]<IU3#>aK1OU-(<AX?6
--_F#R2;5_\IUMcBfLSIU@VQ:;,eZ<J(<.:><3)E<V:K0bS+L#\TM1MegBTW:QD,
(a2JR_OZT3)GLEK8Z4b)N(QBDZR.XV0;JS?IC5A:P-Z6T<L,PE8^^?&2C^EM3DS[
)UG9M<MO#:e<H/Q_+Fe<4OB1YVY7<dC1T+K.1a3W&D>Ne^A3g-3+TeTcDEUc].J>
ISK1MYG3FgF>(>YZ9>9F8FT:=8_E#OV2MQ>+/@E6([#,;ca[)UQ(H<S<3<a682-=
KJD+KSS:6>19@e50B1?Q.M_:1<L]WK]BL3=30.LdSI3a<eTZQC-L5LXP1Je:ZB70
\TA6YYMDD@HO\5,(@e+OZUF9d<3.TNZ59X@CE<Gg9B_TWUU;ZR<(_@F&TV0N)f_&
NYF[;__/N173QA\aQF_YNMCXU#_;S;.IQN-U#[<=XaHbO-AKc8=dB3^OE&Q=J#C7
11JE;)U/4:_-6)SRW[@I5N(0f8NbDH\L_2S=Oc;&F=>E8>;&=XM9;XVQ4YZTegQ9
=NDA,K1,NQ,f96_-R9&(8BZB??6M&7#fJ7f9)&f\37\9Y5e9caDZ8PLX^#-DW0,[
#BY\#aa#>^5e)gNC2@TeUaCKg:;eF&]VX3C3]ZO[<O^<Ig@UIGJFf)I^<#_@;Tg/
XXC.aIQ2=;YC)-?cVI[RaF>gfQaR=1TALUS;>>M4PfEEJDPdMHKUPI+@16K62IB-
)<ZE>ePeAOEEQaa.T_@)O-EA&#^aRP#<9^c,dYV^O<=6.)4<C?IB(V@ZMP;[4\R]
4:7&PJcK;e=2[TeZ]32.:30RFU>=JI_@BKY;<GEMV\BYH4c=.,bJ#X.XSI7;31(6
g,J<g).afPd8_GJd:K/RC6BJaDBD,>6F73@4g.:[]07NQa4HdII-#O2FC/C:?4QB
GAB2A=IgPbB1YgH40#A5_/DB)PZ@[B@B+O5=<\eYPE^)9TU\V#,B-HE;3JYbc7J7
0)Q&&/TYC>.TJYM^?YbPf3JBD<6=OI]TXRTgMf[EIO@OSQN+;\>QL<L1G8fM&D#c
eH>]gG@/Sc?Ia+3B(-#,@LdKb(Ge.I[+B[#<6ee/7e#:gede)AP7#6)Mc/U)J?)7
.XFG3EP<0A1_PB\HU9T2bSU0Q?G86JeOcH08FRgBK]1Xb3B:a/YOUC2,HKI-&5?X
<+LD]_,OWCb1-3ONJT07S@FH(18d>Qa]=eaeGIaU\S?>AAOVLQZ&1JEWTg7\TA/-
d/]_?/578>S?B.OJ/QG#65XA\^XTM[ZXW/G6BQ^/EJG]TC/5X=\K.H3/)#V793]f
/b4YW5X&4cQaJf^I0JN#JR+:\I<aa?bKdAJK9AFUSF75B20c[)Md(I2EDAUYdJd+
<DH8[SB>36A2afeeG5eR<80/[=>&,KI7_7L,=dG;#9N<g8WV-)\N)7W0Z@C^U.^5
_R6)JOWWaR=BJ4,3A7F=3c-TK7<OX:71eVaXAZD9R>0@JOJL2FDQ2<+/6V@IZ3-;
7e-&;C8N8E#W)O@U(ZUeSH]^;B)HSYN_LF=:9X<F>O-<>26\e5a]W<?ML3PU;B&K
[BD7c3#41:0#6F1,5=PN?IXZ\1/<7Q:25Q]_T#0_.XN;>]6\UOHVc3ePN0Z_;Qf@
B?P8eYHU=.?[]NfP,G\<6F8Q8\Y0a9HT3Re8>E9N.FO[/<HN>63gVR6F&YEGZIPX
EAdPU4Jd1QF.1,)@Q7WC6JUfN9@6^AS>SRHEb7E[X>D-,dG0/>Y/Q>@A-Vb@6X>D
F<66F_KTG@=THJL:V.2:DdR#7C=+/2:EZ4I>M13f2)<N&AC\/0HeG<H0SQaIWK7G
;^;;GVg9]@41,]C+2F-INMH)^3A>=BH]WL6??R??B</GN[/#?^[R07Q09Xb_#2SN
SIM39bTQLEe8dg@Z+gZEAVM).@>VX:7.LfJU8OU6)aBc:?RI+BcbA0O]KTC_?K^O
NKUQ@ZBY7bf(:PKOd_FW-[B.Hf1M+HfYfT)VSS(+V(D-2,9<I2dLVZLA_OCD)(cA
fCF9&Y]X+9>a,eVR=YdKF9Y,=f87EE]8f_&(LF+WPaeC7A38T-KG3,BUA/:Rd.Lb
^R@)F8]^[T6f2+N]/]Q.5_R0LYTEe0.ZJQY9F(<P/U<C5NOMR.Q;#QEI<(??=bTQ
9UY=[4]^E,@1ZGH(+;315I5DN0/#.#RSCOR=/@?>4SNM:I]X[_;-#AZ087:JV@OF
^:ORC-=Y#g4SJ9HB:XAIP@/W4bgQSH?7]c^V^>4W_6D)]e.OdT;e&]b<<WM8eZA8
.?,FdUd;Pce>L^<e)/\5;@NZ:86NgMF67?+MX9(1Xa\J.a-:8)ARGbI3.TJdTKeW
=2H^.d<<L>N/80SPV[f#4Ze.959AN(#P64U)EH#M#VB?I]@0QV&.=Q[;QWJA1Y+d
]O1TFf1d:cU@a[&[ID5I_K-XU8E(g>L;(9.TM2Da3FD-dQS+eFYS\AVEEc8++=R_
W7Ia1\>EO4[IdJ&HN<C-gg<TI\PC#HNaU=FZ#^6,T1f<-I:EI#3?_]34E[KCDFOV
WG[KX,cJaE3OQ7?_N1/UQ\FX(>L0J9DS,(D3ZQZ-M7OUF5-gI@b1&SW.e\daAdJ)
28Z)L.3MP,=VgLFFfH)Z_IR:b,:HHLcP67;BSM8JIA&,9:,I78&PafY;S+QJ_\@g
\RS<&[5\6c4+OGN1,bU>-SL&EbB;b=D95A]KDW000Y(_;Q717K/<fA=B,4-EN.>_
,35G1?EY5,ZWUXR\@f41L.9+K=)^:W:DVVDW,AaOJB8c(T\XA/K=N@-C==<50c##
#HgO<_LPBe-#2(:^cU9W&V\&1ID9FOGC_Vg=/@f8c/<Ec6^ZTe134<>IWf#61@Cd
T5c55W+2>.[LN)/PacN1N?KGZ5;)9C?,?aT1._]\[L=O(&?bE0-<>[6Wg=T),\=U
ZCTY0N\T0FC1CCHe&A;K[N61QU+3IMQYHZI[?DLWKH0f^QfgP;9P)PYC<]==CCK)
#UKZ9]2Cd-fDeXA-9_/@e]P\H=YPg=C2P>^Ofb^D@\d&b5Pg6Q:(CLA;L0:F[E=,
7c7#c:T8LI+P.S[gf,+Z1?^A+1C_X0K6W/(LE=B;&:)/E?eHWOfec_McN5V#D6fc
?(P>4_/OX>+:F5;CDT0ebTA[XgB)RUEdJL9,DPcDa()L/:.TQ=+@1EBaSbAR1a9L
1KG5).>;S;#WM-_;f=X_2LXF.2A7;+DaRA/Ye61cGPHSPV;>#@5YGdHWX&f@[H/7
^EGT36=/bJ2?4S-1NRaa<>L0G3Z6J#DZT?<J\NI:HaKY0T(@,W1AI4fb9WNXJe^_
4C1,8H,XJdYBEQ_W57H^.D4N+57Z>G?Q1EHB\bVPW:NU3)Bf9H__#(I00_(UfEV\
R9=7R\1/+a+Ac[-Sb@:QV&(;JRXAFKMN/\Vd7+bR@PHLgLZ\9eXb-SW3L4-^FCIa
b:a.5-Q2<UT-H=@V5B]DU]]6ga)ce)L\5.bQUPUS&=0P0beB_60e#2<@TL4X3PWS
VLV3D,GA]bH9@)\98(:<=7^X<=\?Z/a52W/TUBW6+Wd82]JW6c9\U4MAbPBK?1,H
8dN12MHdc?#e\6NXTKg0ROI-#fB5e.9Z)\G2DMFU8GG;2DcHZIOW@SPMXW<g#9a8
6SW0)D7;6gR7(<&97K-L,Xce]48H99_6Ag@O0M/N[gUD8]]6]7J(<;N0\cF@@<[S
.#?U(;<O;QH?=2,L9gKb8)LK<GP,@N5Ug+>;S+SKG-.T:WeefV^f??2#IY][02g_
dH-MT\MR3JX@U]fWOTNY:/d.b<BcA-.U=ga#Od+C<[(]f;9Q=[G(2))9]Y0fK^Hg
DZ_>?QdP.=T)Q&gXb]CSY[e-QDc?J4.6A(fYdFP/JRC,.+\44CM>OgE&V>[2_f\3
G:47^(]8&C78+FW@.TO-_4YFR55O^M@[AE8Ta&/MO/TN2/1&R>gD;,T?XTW]BCT=
#IX9BVL5>P/CILKTI^)273=:76LWf2#]fTFfJ^N(/J3X+b-LVg[EcSCUZCGE:HHD
d]F_H1ISYfQ\Y=aKaRM#^5cWDcHG>K2Y;RI<JGUHfR96SU(H0V\&e82.49^F3)Q?
#BA;QcTe9#E5A\b8NL955<_BXI@D5dVJ5@?D=QT)NT7LFHg3Wf9eeN>:TC+(1[M/
<=5]Y2WLZL?LO3fZ\5_^O7QOU3gQP^&S2E5O.<_6&e5GG#N>0e4N>-QaRWQT8L/(
:)X&L1:5G<OR(b@R]S;Q83&@V:(PUHF[A]9=6[<__D;,=OO9K3^;d/\I5X)3bAE\
WgD_5MQEW0,NU)(/63U@Xe?@S#OEe[&f[f0\ME@HFdeXD7Z?EQ)?F1J<&aQgZJ&@
J3UWH5N=0(CNgPI-VW1/]<\PK\eTeZN=d@4^&U5^c90.>RZc7AZb83?IRC#9C)>1
[e@J8fEe88b9&:XKfU@AF]f<LY8@gD7YaY-cc)E@,FH:=E&^4V2[DT)e##8?+N>?
Y]TLfI8./473=(,8?fd8:-8QbLO^dd_S-IM=-UI?.O4\P_&TQT@A:<#:@;W0Q[Z.
:6YY-@PD[Z>QA@H;7:,AF,V/cJNYFCFaTf7BF>[PPB#O9U)]H>]QJF0+SS=E5)6/
g757Kde=_:6#AH8J=OL.0,;>H38Wd.33_(e)LB)M8[FHG6UK#=6QQJY9e>H_HH#E
&g.Y&MDL.@GI6+>.Og,COIG;P[Q)[69a@eAKQOC;_b7SK#ZF3D8=<<.=H+JBPGZ,
Z<R>(?DYVLB9SO:]POH/+NbSf^9@IRZ^AH^YBc2][;ZYBg,2g04^8-X0HKV<55&&
J-A.B=JT,MT5LR8KJY5A+e+g:XXPI/+):E8F&?0(\fK7:IG+-;aaQ:gK-bc[24g]
[^^H&K7RUX(:gWY5=Z#AZ&CL[b;(#.UAMd1N<MKQIJ]QdVJF(X([23UW[BO4LI&0
G=Y=77[32>E#IR,c<_A,#U>Z\:Q;_QLYCR49ceT)A33>K_\Q4#)c_13(X8V\&1TL
\FPD_,+D9;JFfDa63,<Y?#XT>P+^DZ^>]>;L<?2f3\VMb5[QZ8WLZ(QPA-YA0@/a
E_BVS6fd7X[6bc43B]9<)TGg;^gaJ),T_HK^^_U5N\<#Z3S]WQ)N/]b8N?<P[4V_
2ZVCWE7fLf<X.U-9/8QWCe2PLH;=Z#c4J.&KcKY/[R]SF71?PP=?FB[WSO5263UH
6Q@4-R_5Fee@)>a\^T+VS5E=U9EeZO#5H]8EIR_cZERE;3\?b\OFcWf;Z0:AD_5A
O0]B6\SGe/^fNZXBaC5Q,+,\)Q9I_&7TCL.:P6d=@eZCcGM[U[F]fb6:3407+1Z3
?967_SH&9=Tb4^9N5[S>MJ#3>U&E&c-e_b0[G07cg,;-Q<;\?4PA.5C56I+MX8@P
cNA0+,C_>98T+-_C8&&,T)\-N/e5&3f04TR(g=c/[T&>QJ>>b^^dX7g^7KX2,d&H
&c^X,76b>X(H:J@4bC8YKE8,MZ3b]-=H,/Wda,We#_I>VKYb-T1\][dfX>[g)Q?8
Q>]g7Q=G0BH&<9fa@^/I[?8C]<3N6<BU.Jc8K6;5FH980Fg9+Ra&gU.LSXH8eM7;
8>M/RF5Ug0B0_LG(TWN>\N\,b?=1JFD]]T/fNOG]/V]WQ150[/=/8g^EAN?XDQ-3
gbMF2)eZ7;S_L<[NFP@AHC\AT=]V&XeY,;\2<HdAe&@Lb2UGbdSA_TaBUIgJdGVb
T&.G?)aOT?9gTa@\g^E;#CIT-KMTN@HICH[YEbPQIB7](]-Df.gZ@\L:-FJ?:&[B
&WI<9L)S[7aI7Y896/\g:OIPeKb0J@&,gK>98NZQ-^UQfG4eA884Q=)BC(C2JQ4L
4f-K=(fXH;P^W<XNT(#2Yf_).N,VT8I+87Uge>ZJK7cPOR=A]P>YS8IC8S=@,CQO
f4^[+AOJ8A_gDg:4AaIL7_1d6G[Y[EeG&ZB.?R^e>)Y-U4>:L?_MRB1^0&gBNX_e
Xca.UAe/af<g)QR.&8cKP2A6\?d3I<CE3<M2>=VMEJN4O^[@_@QcCVNF=0;@-Wb4
1aK0+LA0Jfcd-CE),4d>4MQM5MC.T^f\SYVP9BGYB7@N#,bGG1_@32LeJA;)cbQ:
U-ZT@7M[8Pc;V;JH[]0FHWIT?SS[MB^6O,>R7?P?V_@)bc:+cR^2T/9KRORR[EBY
J?d(.^Ha/YIKS.F+^2U2#TGK61B43?8^DD&Y/N:@;_d8HG9W2_^58MR)H1K#2/VQ
?cbeH<?C)DQPOfUP0U1I4:d-dS>O<_g>_M,(IT;6)fS:54B>T<0+?GfUIPPc/@5B
BWFQA/OLS+<Q>\<c)Lb]g,8.f3\8VN5Sa###SH^#@MXAE.[MSE;<;L&TA8W3aV8_
<EC,bJ)8U;B\8d.A1c)O10A5IfF2[7BPG5FD>(e/,ePQ,DbXU<_7,B]d@=fd\dT:
,?dK5&06e\#@9CCQDT#aBXgbC@NCEg=be;0)eN9CK7OR5c@AQEDDC2;W(^@+W5FL
dX.BSU_6)W2PbO]H<T2:F_/NF_((0K]LBdL?fefdEQ5?1A=5ae_-Ae^M)_LC@^AN
,=#SD<SO#d\F]BfO9B91(XP=cZ:O?>T931<ag:N,<Z6a>7.A)O07dc=[JL<CPZ=f
NB5e.AYMYM#E,:<VT2CG&VK(Q,U,DEV#7/PAQ]KPQ+(7d#K;&.2LJMS-A:?C50#_
9Tc0R7]84_b7A(<US0.gITQX([gJ4F3H3NA)9W5CVJ<>e1f&@>&4N</BO24Y:,Rc
deb.ga?SU:BWM+8M/P]/G6<,eE6?LU_U0(.367\T8FdN?ETWG7XAM9c,f26JgPE=
A11R(+6G&ZU^KACB+,P1cU3/HZS0#[T6ZY:WGV?640f;][YX]4CKA3F?REUZ:<af
-?WOde:Ne8affJH;(e3O2<R26\UB6^2G,Z&GNWNSN_M3L&:]G]2f>AG0>8T5C<.W
W>Z&_O^=>KL@IKI_3.R-CO(7cU<AF&@4,6C/ZaaM1G#7Q:PLC4dI)X7d0)5;4[4T
@/d.YA[<.^KWD&SEa:.(2])YOBW[K7?].#0UJ_.;F9>752ZRJR-JYd.WLXAL1-:)
;-YgG1TcSCO.W3Afd_McfI]3TO/XSX&eP0?7.J\(-XC,I.VQ2+=[M8V9X,d^1IGb
Bb;42LaD/QF0cBJFP9c:_A1VbXL3P>W:d[V3bAT2B;MY#+>^Pg5=VZLR^?c<1Z?L
+ZMc-V^fLDD.6&<+53ANba91\0CC(9<gB0(#_Q7C@.6(,b)4[MJH845-/+5L=B0g
<N5#FYYX70@2Jd?U\D<Cg8TLfK<ge/gJW0BLJ#/J8&bCgD>9O&Y_GGY4NI>:F5Xf
Q<?4?2]A(J]D^M&?Mee<]]Z#>SX@[0JUH0NW4&,1OgVMA[^0XbOJ1-K4LO+3g)UI
=0J,0eP\AVY=acT3I\PC:e4OO>5^J1.>-6=9;ZXaGd40F@b40(A4g>PAH<^MZ(]J
XdWbZ_fQUX[C2e8J,4O;g8PA4:GL\TENA?eZ/H94ZLCF;7caJe6?,_/<4dRcJHdF
1cR9f9N7JY>Y&Sa(0C(\(YY)MNRF:P9_OF\;T.&+5K[4L+B24EfCUF#<;Q=1GYVU
[O8_&0eKU:\9-<6<>)I7ecDW=8)V;M]I(f8/J09A6J-6U=E;Dd<8.XI/W3GZ&EX+
=J01af3be7?)Y\EENf)G44V8NY>1F,&cZAF[g;DL+.cSURf^.;fI&ELTS1f@V:H]
fC69g1A:(5&ZVIB/@LO5BC7E[,Z:)47/KJ78VT>RPEL0W\SDZ37QM8>#7c82^a[R
]cbGGH];T77,gS/M4ZL6ORDHe/7X;I#JQ8N^/QDd09:;14;3Y0=_===e?4/b4a>W
#7>aaeUW,+^BXN6?I@AGdAA^B>DF2:-&dLgA#31CT;@19450#SQ[6H9ZXg(:ZBF7
)ag)XG(87HX^gQ;WE)4V#L5U>85BYd[ObM)(7JH+(NRPCCGR:XUHY>bPA)/9AN+1
/=_GHG^BUcA0H4,YMeO.@/c1a>:HC9&5>DH5E(aV&Cc@4[:g9E+c.gJ0.fN2DI>]
?e-a]/W6JC:F5Y3+/)ZH<X<@1g_YDI/A9/aMSHgRK2;/,+X7;aNXA=-6I<6QGNT/
7<f#-\E(Z6<T<(\P6cG/@&0-&4O7bD;IeM8_BNB7e.9OT0#BA)3LBMY,O\FI0G7O
a/<=e>^&3HVL+00\IH262)PD\4=_QD\\88WD&C]588E.>fB@)-35aYY0LRc@@5^E
VFKdd,1G26(?.<bC318;4NWb&c:7Ge)?CEKFH)ZKg9c_ER(>=FO;&BdV?_04SgP(
bIJ-^=;PNWQ[O7I64L>Z.,]PF9IHFB[NPSPS?,ZUEgf<(:VUeQ&/aXHP/Z:)e=FA
/Y<B:<LIa[FQOPAMD0S?XM2KLC50ZWbON[PG-WIEYA\ZM[;Q0)C\g(5^HR)Zb83@
13E>g)V2/S8>;&E>Qg+0CRg?T7.1f3AU+MH.[/#GACWU\Ba#:A+GAR)]7f7;U6,=
QCcHV.H88+?J3>?43AH9b3X-@bV>PbZJ2H84JG(SUJZ;YOg+ec6FKa9K+>LPS5J[
V)V:\-P>8BLGdLNd5LC#[P;LdYQ?)56-Z19?.IgUN-?ODSb<9Y24Y?X#@]eD<VTV
#>VNX@HNT=C-Y^T64FGEK\52TXH.M6JN73W6d#R3<0^SaT6DH^=DK<:Ed_2L(Y,f
?MH.?1.Z?44\3.C>?DD4GdNT[6a?OP7dL&>d<eUfb<T4QBeV:8b7KdTO5QO/ZC19
cBS5d<:faOZ0+8PRV]P5VRB)Z;PJa-=AceG,/ZUJ?HA;FX3SQJ(^,OO3O@YL906,
1?W1V0Y(<5;=@#S-B@8KQ@>F.,+ZWEG:IPM-JOfT5]?;KQdd6STXI/9:WGMKEPPO
XL]&eE4d&g@IZc+f+G\ND=EI^IA&6Y&3HD@OV\QVH3Ic8Yc0R;9(<Tc\>9=+M;5e
G0S,27cbHKOGgI:/X^POB28+BDUPPb28@+/JLLW?D30,IZMK#J+1MW^H3.T.;4Jg
C69ObU#@2Pg&L&7@P7RO.dQQ^1+dB_gb8XXRL=44DeaZZe_R_G_==+?@a(P_1HSX
U(R<@_C()10Y+aR(d3PZe=&#B@UGI0=;:VJ_GIM4ZXAJ8NAHMFNR;6efQGRgONR.
a^df4a/I,aD<]QJbY7-_4/Y?YRN[<BWd:/^E-XYY/[5EF?(]d@TTGNaKG(,ffF)X
D[DV^c?_R<J0?;3W7eb1Q6VBf[c,63a>W(ZKP@J&_4.Q84;@_?QVPVUJ9YVUH\EJ
IWC.RT-N+C+&+2Wb^NRH#,PA[JJPQ#;Aa-T+>)Z@;QY7E2YMe,#8/d8<><5;?f+F
_X:]RS?Gc[^,=X3UGc@260&BCf,S:<#PF1E>eG3VV^HgTC:7fV#+?/NLQ9fU9A)/
F<)LW/-0QWB2=V5gI]70I/ZbWUebBBPB>H3Dd/?-JE-#C6c[QVQ4b(df#d4WX.RG
g9W-_VSFK9.b80X2dKa&a=^[PTNYG\a1Y[^=XUSI\MQD<GgH?4M[?a,]JXfLS1AV
Y,#OLFD3-,Ab<8c]8Z]\#K<MJAGIW\CD.KZ_cX2B?#,S^US+QSeAUN,9)USD2Q]@
@g\-fZ50.@S)eeAQH551>d3+<X+[-\=@^GM.e18JE\_UUfM00R1+K-EH\MZ@CC[\
^F3eNU5b:_J]<_aaW3AP-YLR0bW9]32+[W(1_)/5Z=1cc\AHRR@H03\fZ_?-AaA-
\(T51NXS5F(Fb#E<1YY05WD5P&D3I>=6&TE5dX\:fMEd3;<:.WMU#ZUO)88,;3VH
c6@Ka14Rf-Q,K_?G((_5d:D-AXH&C5A7g,34&=B(U(=0T<a\F?QXHHd2C+HXeW@7
T?1<Yd/c_P5Tc#W6L15WD>e?X98fCEN3c7+[:K+dV9DOM;fJ:HTcgO\4>(_2</Hc
OJ&RAE(Rd:_^EF1eO]2FX@MAfI([S>I6,#8g=<L@R31d@:X.][(9L<UgcS1fgD0+
BBf4a8aXb@3XQOK;<J;8V[DN5C/RN)Ya^?JE.AR+-EYH;7<2Q?^6D2VP1SK6/]@W
7UJCf?#Z&RMc(#T[]64fN4+6dM^UA<+0d&OC4L36VSTG:g&)(]IKQ0f;4ON<4?U;
1gS_Xa>]U1A^J9e,51FE1QTMWZ.Pf5)ZQ??G6e+eCa1B/;8>I5XSd+@K1a#NHPAc
SbJZHA@1#gV;9N-<KU7@6.g=[E?]XC]-)=,H413,0.2EIRL52Z)LG1dA2_S_6;]:
VN5^?NEF+DOB4\cbeEd>?RHMO5RT1=W6d5b&]QOb9:e\U)5:)D\[c6A8@fc_7+eM
\IHa_K[=6(/TbSABJ.)9,^/CGN#d\)-a<@Ve)b(>.E^.WHdd/3eJdf&+M=ILd-A=
,S3M/+^d4SRJ+UUPCO-U1;9Z;KX2GYJO=R.CIGC6b/&c\gTA+LV;DPd95X3)=W:f
:--+Z0@\N<9bX7D._,eC.D,SXN0X^V;5B7bM5^aZ\99gd[C4KDV\#RJXc^-+AF90
8<b2#0R8+=4c,6PC-eK;F3+@P224G#[R9EQQT;>4-#TV@BGT#?GT2+G4+=LP&=L&
&R\WW@JN#I8H>3VMVUY6__T?)a>dg78YQF&LEDH(6Ie\=0?MAS[=[2A_,2dMe^MW
6_LT/6gFBKaH]INSe8agWNA75G^B(cEd<MNH+?_X\.d\//3Y:eDQUR2_SECVPYf:
TPO_XPaZ.(O&TcIFaH&e6(:55GaJB5NH>eKM0-,EfY]-3)Z4YLL7.XNf[8IZ\e7N
dD6BDCd#/3NKfT2EDH6PK3[WeP^g:fZ8OC-TPT/L>W/:D:Z#[g<+63d>6O_<S<[+
[F<JK/g4b=2Z1C<\IC&S^Q7B:gV0@X03(SX@:3P:5Og?VM[VA66]-4\H&6A,I,8:
W\K-3K]WO3O<56^d?:g/L2f_M-#32@CWO1=EBM4+4PB#b0BN:LY/EcC;79?A_cI7
-2[;O,GFJRYfPLS&E:4c\#Aa2dC17>E\)cS<:?GZ3LN[f_@fY#_IYM=CQ_MdLCY/
<@M&5D[.P;fbA>26J__Xf:5#\@2KB2]f+?U#V4aF98PU<[/0fRgSM2[8<8X^c)N&
6[Q>F^UF3(59Q-N8=,>2eg6f?RUe187UD[_JLP)RZ^:-X@F/2D=8&9E>I,:J;=O@
J>dbL::FP@Re3QZ2B#^L_G:c9eM+BAEdE_KIf?LRZ0[N<8fe93XYDM/>GJ+)4?X2
Q/+1[WW[(UH;a@f;B83L:S1L9O#@g&DGK&M0?EbV0,dIYON>,J<KS>OC[FMS>,:\
Gf_FT;F\9X;24SdMHN-XM<OPe)#cXAIB^c=8f]?D-7adZN9]A36&^5KU@8gA8I+]
9Fd/S@S0T^RGB&aIX+CZBBJ1-Ke?8S1,AQ6UCIU0?+X[V3]H15P0/dQHM7JPQ#3F
fZBR7VS-<UHA:W[)1]S80-0g&e=4Q/eQ(b[QH059]JPVSE[b6@9U&1LSJ&(a2)FR
1;BKEe52R0X5G+W^Z(+G1PX2J8E\=<;J_6F9PPV9QHES]eP):XMb[D)0bW&Cd^0#
7T3NY[N=DSKL[O\TeA@Y/OY5<?W?IgMa0T?b^0Z1OcU^\<-I^MY<0H0:NM72PSJ^
@I#<a=9a?>M54SOU?f@4.CAQZ#D;V^R,3]#??=X62#,G_FQGVIK_aLD-/]c2(C34
:XO@+;@;#We\-H.O6HM9R.f^3CR+:.;83.7ab/a>#UA_QKV_B>:b=Rd6:GfgEG?e
B9TC.IIRa=FFY?>.gN&4\Y=cBPN1;&A^bB?ECZZFAf;-I3#-9OTZP\?-AB<9W/=:
R,Q#H<C++K<;?FQdOV\BcKWBS?;PC56a<.U^&b_d:UQaVc>9G;,+b/J7^I1d@cb/
^eGZ#X&c(eNafPI,:dPTT[ZVB<F5,ae/1W^?f;<=TeIg18A7=.a/>+>KTO5b);c-
U#QKM40)b&\(8NE.b-(e3gB:8+_[?L5Kg#J&RY<e[?]J,=WN+[R5a5aGGdWEJK<?
7[5,-Mb.bT=PN6N(PTG#]N>GbJ_QY?NL4R1U=LaUJ\+faK]/(^FY=-QXFfZ[#Z]c
2\^GJR071B.[3;12PCDF&8Q0La:S8/Z_++cOK;5UA(O&HYA04>\-a:cUIIYb::@N
fd(ENXd8gg<VD6f71TUc:aP<02fPJLfODS;HYK[Rd.E:a5b/5H:_N0MISVebM<M-
LM)7W0eQ^VAcP29T9?4JT.(GBIMQ(\[2#-bfdU^4?+?Z>f-O:S]dadM4UHd#OH:+
D5MOG&]RI<gATR_JI?0,H&4I5L0ObEfS(bNN#VCU#Z#dJe0[<f>?M-Nf6Gd\\8g@
gL+]J(1([6Dc&>C^D#PINI9O)QNM4V\HL0#O)_XHfa5E/15:<gFGHGDJH6QRg\bI
#+9#H>KX?Q;:AAD>Wa[4/ff?JOQWQIE)EXXYD69g0d.KB/Ab.?G/XWA@5#7;X)HX
AS3Z:1URfeF:51a0^F?FIUf._b5K?:+GTF46I8O=LQFTaaI(,6<)NWB3HHND,7Je
&Mg:]:ALY45B\dDb-U65JC>WVIT+Q#.YdEUIc-D_WJffbgK\-(7DgL-,<Q(G5S+^
]b#WgTIW^(3AX>^^[^fHFSJ]C\<Q8-/Y@Q0:<+#2>/0CaIH,HH_N8c8g7EN7Oc&H
&d]AKM0S3E8(./#[8UFf3Aa/]IQPJbD,>]JBK#aUF>g)8T:QHeL>KF#=I+_F>K?;
#66=LKE,a^[&/JC>9JQQMZ,DN6^:\TPS1N7QP#Y-P@R_8@2NB[E&#5JUMH2.[XY(
/_Te<fJBL62>L<g@fOe_LNa0)4_6]S;^^;TXIbRN(Y^#NPVQaA]P>P-.2HZ-3feB
X3E#FV37Y:4BGB303F.gKFUCJQA#XOYV_-eK.:g&>)Y\(L5U6^_0_Dg#8LacT&aM
YQU9&3<#.>a^(C:D5NaQ?SgZdSWdd+0f\bb890RQ_IU1+#?=@<,J&=7<B&b]E@<0
ZA(g>5[K+)-X\)d63GUEQb<.1<+GA8TR,d)[F?X7/G.18?^Z0.A0L+DW&/ge<BS_
5)^]=FcKPD=AT]@K?8&TR0:S=8#:ZRe2<6(K-5&ZAM;S>A1X]Y1-Q]X0GR<\&#[#
cOMZZ_1=Y9(/3AIgT<deBVD2MY6DV186TfG=,2DX4.6H/18VN6LMFfc/;Q.S065#
F41[QgKEYGI0<#)YH_ONbKT\/F1??U::]c1Mb<3F0,(6V)b<=^+eR07=R\;)@8<>
L.Le2;Zd?GVa\&5_6YA_=FNOaP^LU3/,J<A.E+LdBQeQ.d;+(S7e[d+ZP68cf78D
RbNV5QO4X:?1XBBGS&ZWEHcDHZ_VRONMdZ,)8NeC[c9P-Hf&D1)O)GeQ=+??]3DE
&F(,P<_)01WZfE@MN;=&Zc?38<:HgGTc6,5V/JRYM2KBOZ)(C23_B0C,#U5==#:\
,#PIC8L;&/<)6EdCgSM@b;6&MBE?eBeRd:H8HfKe=;(M6#Q,=@W4J82NLP/.I=-/
HJP5^c0Ube06)e?;:VA6R2;fL3f#S0)C]-E0L7/9JFe2a49VgIK[DI;&bgT=&C95
=:0ZCK/@D0BZ/EVU\3ZSM]MT+ePF=3FINebEP)(2W;[]:DL@)+fg\af_#RfWc?5(
I6M9cCfSW_Sd.>.TEBZ8FX;3Z=>Q<f439J7566[=T#?Z)8]E_D3;)A/LOB(4#J2X
&_O;]=F;?U1]e)#393b=MNe\:@+Jg-J?]NE[BN[K1KXaB;NS3JCg+3EQ(:+Yc?EY
SS+>?1+>A8eX/U&@gd9SL7APFYB_Z>2WH/1\FV9+V[I]1eMH3S,c,Yg7[KX@M.3c
f4^?HedHF^B0UP-PB6&5e7;fU^O)T20fRe.F+07<e3&C&YDN\4+T/fF2#4(g461c
F=M9,Q8.5)#dTWL\-UPB[BY()Pf.ZPI(\91NFZc.-=B7MWeDAL[>UNX-C;LId(dE
]d^X]e[;S:b^G;c,dIDa?U9I\(fa5([G:ZQ_Yc)P&f/eLg#4g?GB>@H?)eWYf>]g
CD3IW<;e0-LeMX#ePGBBE50eA41?JfXRZIgFQ:_VD^2-,/;XOSOUefc;b_R255,O
7J_F&3\7\F4LE+X@&-F^8&-2S)5+N6+2_D.AN@N6/ggZ1VDV?eEXLeC3^38cL9XC
G5gJL/)a6Yd(MW_GPR)D6Q[]++5RRa.ZAT#0/1EHE+1AUN;X,g?LGP3>-=H+#:TP
dZFLY4Mb[fF+.7G>9eeS8HPQ1PLIS^M0Q+>bM/AJ\2)3>5W/7/UM^5>V.DfJcU,>
ce&-+/VXO0>.]1JEF^QTG+:dI7G.07@aSV]L\Zb+QWRQA7C.(UE^<gC3+[g+5EJa
eAN+9b\<GAK,FUC)M0&1?#f461G_I46F54,^fR,A_-]2.d;eRLO\<0KfET4DZCQS
S(VgZ9NG920fgId#&(X8JBO>AgIKfS8+Z?7:WI5D8gV<^1>[Vgg-e:]#0XZU785E
GC4/VfN6LYHJcPU9/WMd^b^YW(/#2f//]K=TXf#<JS93D9;;1cF72?cX.G5K9>Q#
EYYf@KMZ@WO9</D1CKM3PA0E?F:gbNLbfZIK6<#>c<@W\WAZ2[1e:E>P:.<W.eND
\d>XE(=eE9DSB;.3)CJ<8bN@T>1cM9P2S#=R-WFBTH3YeY-e^;@78V]LT_YN(aeK
BEEAL;fg&6/;4.2R/3\Se(RaJ?/THZMC:,N0T<c13_+H0=V1G#IHIUfFd(cN)/Q@
29OG4fWVB6&4QaB_HX.W:SF]?5J\Rc:<fS7W4/14666Zfg,?_W-JGT&4H(K=f@@(
RWO,3f,YH#P_)Xg\I<72b4A)7<2T:FP&85Kb/M)>B#]TSM&6(PK#g#_,La\2I>/c
LTV=D+Hd_f=YNfbQQJ((MB?(DK:Q[4@G;O_:1F<3RWSO0@YK\AZVP/^gc_X3Ub5+
HJJOC]JG0/N3&H7U\4>\7GN(QBf,\BA33XR0b/V(=IUSTT=F,?52HW0M0K(#7XFZ
O(ZfH+;GIfY5NJCHY/d<]#W:W5dSN/H;+C2YB\ATLcO;VH/ZG0?S+AX-Gc=05PX/
BO_O]fd2)b=(7N;PF]P:18XHH^[K+L/N40,K(FB=fW/YL)5d>SO#Zb9?E3.2#YFJ
P_US6]3b:>.[70LDHTMQ;;.Pb?\OeEa:c\S8#4PF@[Q/b4fECbG2d:7JOR-GHdg?
+FFPV=BQ.SZ.X,76)0?X@0H((VL\QC>J33e&?W)X<=+)2eEM(>9EATW9M[2O<OP9
LNfJFYW3bE-_Agb9KgO<^fFSPD^]Da?1_DAVW]6:G3_d/:,@1N8-CK;<[:e8Z6@c
3TUEFDH@UaG:9^I=B6,SZL]32]FB+<+3](;1G7U^2b&G-/KO#V(A;T-\[RO1+V-S
EaPW?]#aX_=H_^aVG<P=-BTWGGb/>;U_N[L.Q(eFHL(JYR7&_2T<?@YAZ36G(cd_
aK])=dF?RB-J4YA3HT]LJadO_)GPM)P(SEGUCQ@WZCH/^1FM>?aH1BXU+Y1B7@C1
H@64ITPf_ef\0.>7G]7&cT6/-M<34NJ+I5K/_CJ2@>3L)g?0/d5&ZANIBFP)E9S8
;a(0SK4?Fb+#0B)GP6EXg4IYN[[VHbd.U)O7?f(8d<PU7<C#gTP9SeQ\d@\5]IaI
/2,<#:<-&>K[Q\:/DCN,933,M8FYT_HEA;Qbed??)G;+dUY;;d<V&N4TU[5[_,GD
.1I<@?K#E6A.T:.]RCMHR=+KTcI:AMQA/S7=L9gY?LR;_=_I#IFb)DTPYYMVCV=_
,12C<20587We3g2]2CKZ1ZG9W9:4-W@)F]?[AEb#ZEL_Hc4:<(Ef(4N?5:,[;;cI
>P[GDfVLB5Jdg>A1P_A2^O]<S?I&BAd,)NCR4,:7V@fBV#7fB:3JC&]=1d.G\EH[
<RgBBR;CS[^3d<8;g;^G\bbONTeD)S&a)>KUI8SPa)/QMQbe#DEA\R[.[ACS2[,b
L5F6MB\,XW.1RDg]SP0C34,\B+L<gg\-BEGN#M?fJH7d3Q4e5YcYL19X)aU9^1ZU
=>0S_2,LeVP3+eg0EGFF6]SD>,RM2]@QO6H/gYa=^Q_bO5/A#eM755PeRRZ&_5VX
:+ZMf28]gM&Sa;B-Q+cSI.2cb3Z.P[H:PFW^b4V,6R-64NL>5\.(>8<T^8:(Ge<a
LJO@J:Ef(e;,SVWH3];STWNeb?K^[8_0)O-6]QA_V+7]>>CCEEA(.]@))e;g.#1#
4Od-+]ROd4D0a[LM7FT:CA]/Ec4/(0I?5JBPE_U(#^VC1f=9ZU2H.#RL01V>L:Pc
c=[f3,NBTX\@eH4P\1KG^(P6MaJcQ;Y@-#g2.]0)BcLI3-=;RG=&39T=]W_NJ^A8
bK>+ObD_W]Y#ETO(.&ZBZGB^F3[f65Z.gIW9:8Mg5:/?cHC4PSYQ,\>0@+<FV-CR
:EWIcgbDc1P1-U/Z.bUQE71JR/K(UK7_65M]fafEM:?D+fU5_GW=NJ8^Bf2O7B-@
dJ5)UC>gS8\Nb3>]ZcbeH\XV-H[I2O=0SZS;1C&&&_3#R)?W907d-)Wb=0Dg/@F0
2U<(fe:,VTg?@.=TLMW69RUB_eA>8OQ+H+UEE\bU?_c6VU1ZYc_5K^CfEK-HA9Lc
)#CFP\9Eg2+T-Rdf0KNC,Z,<7/Ua2Z;49D+CeSL@=(,bL.=ec0B,H+ED+8V#AT<R
UcVE]-J(PbS(K]^NFg,B@@2K^Me&QY(SLD8c)g>?SU=Z2\C(Qd^C@16fU/XfWY\Y
;=B&ZJXYG+TUb:e:IU3XIPW85Ef6dL)RbQ3>95ZNBQ<MG66T)7\18^CI#W)eb)cM
,TN[#R^dR7N&DKHF)]EgD\.aL/g0.+I9_KD7)JWAH_]cL,PE#&<Df/71?QS09_8W
M9@4QXK<?_N-.MdSJaM1E(=c4Jc/dI+,2b68eC+J#6W_W>.aQV]E?RcVN0V&a++Z
1Y7ZODI8aP:V+#gUbOD[FRTK:g>)ZfXM5cEXDecNS:;)U+>#W,9=@gdf90^Ng,.1
fF8K_T3Sf4\,FcQKf[KLDaS5_RbGD--N&\3\CJ48T4Y=#8X4.8I_Z]C=,3#\@d8X
\d1U&A@L>IJeLY4++eN=.Va.M2R0@W3S:(NCV/&H6OOQa\?B3>B&)S8N]J>TAP>d
3C_MP2YW#d?aEYEfMeL#\a2H1GC#YJ950.G7B;]Bf.=_[?NWgHF\,-OV::>]c:4:
VZT@dc_a4QNM8#\H+3-Q/-C\F9NOYA<)3Y\VVWY24^?4>JPCRg+4:7XAO0X.dLRH
);3KY/M=CIS-AOL)Q6#.?FL9bS@W7A&/CT\U/Dd_X)4<#f\<fNJ58?P:R/Tb\US9
1/;cJ7[KI.S4[e6,&9PY_QEFXO>\M1:1)IaS/&.CKC_^ENY>[R:8+IO/VZPRD9B[
-eYf29(,b[.(,75<.V\Y9.]P9P+ZX62YS8>&a5K4daA2>7:#bFP0+M_:5#\K<G]O
SUd<X+DJ2OOSU@W0R&<?Y)faNX.X<[H_&^<S.EM/L?5GJe.9[/FOWBICER]JYQO&
bZR3_GX,47\]V+E+PZFV+&[&/;S[+)Qa33GDKG,W1fC)>P+/Y&C[RJ:2TZ0.f<_:
C+Q(:bRLT>Ng/K&_APLMDHB2MN)K4R=W9POdU3Ofe5A#UQ-L0IOW:BEHJd<.e2;L
W&eaa\?Ye<X7QV\e&E7a=\2\SO>.6cO#RWTeG1X[cb_d)V1[IY^YTb(^VW/YOdW)
=Z=.QVbb/f_UC2YB34+N-L6>/b;93&\8,#[AgN)Xa&aR6YcB5+]]BO&IGE)S6].:
_9Z3.Q_3PID&VX;3d#_W^>(/?YZ2O9\CPI#eT@5a&9]=.0dAb0cbd&^P[2R=W8Q9
,))N&V>R0d)95DbR(=A#IH]TQ_8QGQLc3B]3?[Gd5PVQOV=COUE/&0:-K^4d^+L8
K1ab6^@8^W(d#:&eYW=-H/_47,)UI2>.OD=<bH_S@5G3VALAeL-NRQ9M4IT@]V\[
5P2@NdJa+D_JCUdgafO[T>;IDa@UZ6S-SGSXUa?1:VTB:.J#-LVS44:_)9-<#;ZJ
=MERZA4E1J7Ca,/b6bUV3COBBQ0dOK97g;eJ\KX+AdSLbXMZ>X>Q10fZS@K0Q9P:
6YQ0OWLV_4+:RT5/_@()aefN7Qa5,>]YB#MJV/,ef+LD)2GKV36EE#A^[(L8KGff
bUI^Z:-93)=&A;bFK+1]3Xc?DbBU(e[1W[:=-cAN?XA1F07M6^MU8T<SO97\<+28
9b#GP#DfWgP,1(2\4..4I4AX_JXAKP&I&9=?V_25cIIbW9FA:U<?GU9MCOVf5Qe6
U3_?I8_Y(WWMUdbFI)&D:40K+6?,+<VFG.9c1H?f(J\^UMX_A1(23e&:B5@KIaS>
D_+P2^2M^F4\\+G+PM\D#P5EfG)B#[LM02edEMd:d&1]B6d?4,0-0_f[dd^0EH)e
RaZ^Uf/=^N:E_<SSJ=+b7\Ad2+c^PYNP^A]PDG7(GWU0W&\J?BI3Ea&#]:>_,W)U
);DK613D+F6NE]T&[Y&\:)+e;^MCXLNAK,YeXF0AYF/TcRZNRJ?E_dLfJS&X0#V1
@.b<HffBFM[IVD2e?3DD],4^f+&CQ<OG7RGC_Jc43M)bX#McSc&N7ebY@Ca\PIEE
VVF@[E2[5X&R84Z_6)09D?+HU,eKGY]cBPX6Bf8=C)E6<@@_#5J3063CO2,dT#Vf
U:R\[:W:]R-]:g\3/73AC>^S-T=#34bK#cBef?,46E;;Q?M?3#9ZI#PPHdE+&IH7
.L]>Y2=-=C/W&K(_b#_bILbI0cJUWJM4:)1^=Y4aYQ=.4cH-ZI^AM]WCId2<Q<GE
^0e(KN&D[:GK0.,[?.GUab,3B]0[f1;AX5X;UV0fGgFAcM4^5>&;9U?E)4-QST+U
72E;V?(/_dP[NYNFXX;^7V+SU^,I>-SF0f.(K^_T#_&#Q@#OOTQV(E-]?HDF83Y?
e<=R9\6?X:YY[-7M[J[[0BJ,DC/ORD9;H04S_XU84[V1Y+(d@.-ZI4bX8MS2XcXE
:83\4NR/A\3@ZBF6TXH0+2I_4EgYQ;-_dB2^Q=:9>JB,C.)1U1]GdU)D9_/IB.3>
T^;\,+bAJEDD_-^SJ2E/KALK+-HGWIK9A8,>1(+eO;V9F>(KTM#D-8d8FV=1eF)[
(<6LCf1S8a:85G=?W6FEggD3HN7YBF@I?#.;OdaWa+IDM9OA;Xe+7.(/c?(2,\Z<
,bM.eb\AX\7a_c/JNHKEFL#PdM8K36UVe^3_&H12<#a(D9[b=:[QYbGW(R5?deQ1
F-@EJH.-.0_S98-Qc_/&IYIe95ME(fHCc2G4a-MKZLg)H/@g2[e.Fff._YA<0IcW
A.;=D8.ff&Y>.bR+g,Q-SRP7#FZ0^L6K]cTRe[_X\6WbPV:RFUD.&,FI;9X96dLf
_VU2)(T[L8T\^;+]C(1LDG5@e3QN]L,^?DXfcNSYFCfbR]S778INT,DZY.H)3b1,
N:H+SE>OU@b_M[I+c?\G7UX]9;=AgLMe7MIMgXSLD^XfdNTNN#3bA&[6ABFR@^F.
_\FE^CEJSUC-86#fT[17N3B.beZWO&ZMZ)_/0.DMH7?V<3)=4BQ)1.+^BV3bE6>)
I[MKSWJ/a&2>,ee6?8-+^(+WQE-=XF@LNc=:2PdO+XAFK70)Z)gWd/M5UKZ<3PX7
S8X[eE-7JQQ#\];d/O]>(EYc[DB92\TAX?FSV);.cOg_O1^JBc01U8L<C+GTLLeI
aNbYDA8_3O\&;g03[G4f<.[:P\<LU+FQc3_Tf4PKDCf)CR^)P(&J<:T_Q38^f]E.
KY;XAbSIeG?QIW?OeM@gBLgA+S46TP.d<77XGe4Id=TM/2^QLgV>gZ0-9b5NEYA^
:QM]=SKJCXPJ?)\HLYEM767,8E(WgF<G6CZNE#AE9QaOEINd41<6##>&XE)L-D#2
&=OC-?I@\HYJeF4DVXIG(/;L:SHW/52b^8+Dg2Gg4=@S1:K\2;1Dg#U=VF.PM1.V
AN3>-=YgA?Qe:<gYDFT.RI&HC4JIZW[K.ZNe[cKYA.O8SCJETQ,0OJ\Y9<:Fd3Q-
Q^?_VY-2_R=PD0a5g0&PYLH,V2Cb?C=;Z0#3dcS?Y.ZgH+X&O7aCT42L+V=I=DbZ
S:38;_;WAEE616eeYbURbcX^+OY4XH0G9B^2N523LHVWQeEX]QA(GRT0c/<NA10a
?0EXc=?Y+?1a0]Z7HZ?S+0[I2ATZB3L2H+5D&.#:1O&>-RdMG_J?/Z&f[I/KTb-]
+@VaW:#8D=ET#>U[&LZ0:B2#1ECHOV]A0AET1IKg<eH/;_AD-5fb@=Pee(IFK(0I
#A2:R(]QUSRV+S?T1VI7GP)QD5L]#:+L;$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV
