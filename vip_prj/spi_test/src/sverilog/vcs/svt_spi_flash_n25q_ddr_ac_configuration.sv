
`ifndef GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron n25q device family in DDR mode.
 */
class svt_spi_flash_n25q_ddr_ac_configuration extends svt_configuration;

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

  real tCLK_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_n25q_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_n25q_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_n25q_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_n25q_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_n25q_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_n25q_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_n25q_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
J=eTO9G40/RaM^NO@XJd>9fQKSFFEY1FV<^X5]#1,X3+f4bS4CNf1)7(UAfI_<7G
BgW31R#/B?CKE>D3SP&J2DBPO5Y9<@Z4E;0/3c<VQ>[C2@[_L59L,bf(NbB[4XH_
##5dO,GcC#1XBIW=C58?(P&<PR[(H:e?T]L+N#YaR#)JHJc=RHWY+[Y^45W@4H6I
=^2N>>JXD<HAf:f50A+[-PY7<KHYP#6:?bE@5IW/)a6bAKIXC<9Se&gCB^aaBXYJ
&7CW/OT>CDAY=@+8:NgV#5cB](AeZ+DAG@T@)bOb2\EIBV)DVK3+aF1ee5V4[/XY
<>f(J+&;^cbIH.GHN57c;3]9T<8L)X6c\0Q3+3+fg6)U0PMK0^DTA-TW@I5aM/[<
YH-_a0P>Mf2_U)RU^>?)E[Z-&RFU#cVZaa^?0C\Xf2^&LgWVcKMA?+f+_dc]IGFS
:Eg5)(@Lae:c0e&OEMfJ\f>bZd3(3_\I7><6/)7(eLC.3aNU71>gd#6V-RPb9,OQ
?A+,-HLR^^^=>bW<XJC1)68b?H,)a<?.<c7-48K^8WB..DD+eQ0ZS7XDg@?</7WV
c-^I&ZD3TBbbA^cWM=\3W:KA^X]&4&YO45WZ@X^<H6>a+@+2+d8a#?O9^A#&ZeZF
(.H^)Z9GYdUP54X;edB\GVJI#\4ZV9;KLR@Ne^XbaW2P@_;[,Q#--EQMfI7Ye#BG
,E<(-/,&48@[Q#S\cMc<Ma8VAX:f\\]DGV#O(@PPZ.gDRYSQ?&WH.&F,B<WHMae>
]g_WRL67RMHVU(:14>[R-,8V1$
`endprotected


//vcs_vip_protect
`protected
J\KS)/VN#aBcXP[\/YK=XbG0I@@I?Z1W7YJUJ:_d<Y)>/M8N[8VZ)(Z;THJ]e\E;
Q-EM/@1_a]8M)O<>D9^I_Kc]\#UPTYKPQJ1,7Q>H.>)GbLGPAREeMJ&Q]@CSLG+e
H-VdC[#2BMXZBVU\>aaD[Udc3dZ:\f+O67BYPPFfY_f(.b)@QLGT;Z7>?+>f[F#>
E+)=DQ_a<Bd9ES::LCZ(\=?^8&]@C[N)\F0BBB_,6bJD/gH1T+[4EJCJ/)A?MR@Q
\_ZMWX8?#K>bWA3JgY.]WdUKL,7[fPfSFJ._Kdd.Bcb=6=XX;2O/ZMg4TB1HA6TM
ceCDMJc_X3^,d+OCWCf.^^&N;ORCgedFE7MEOOKU>Z_(1Ag)F.Ge(O;Qa7TGa.BG
B@aQa05Z6\^)@.VMe/-,2)Y&963))\;#:5ZZ9(eJ5SW\_[DbH4HCX1fFSMggE]P1
4bL<GK(;f#YU_2VYd&g?C0M7Z)P/O,1,7U(K]D:ec6SF<PKIEF6@d4]VMX^)CO-S
G1XH;OO8@J3S4#VOV0WBBWc=/PS7M]OOE=d3WN=e5O_WIV9R2c+ff09I0T+EQK+b
Wg_gR8-(23,0,77MH0Ma[HO0Xf(AY9#,C=.#&(\5XRL^Q9/=S,S-f5N<NHM0aU1&
9.8a_<V20;5>Na(_K5=cFffR^#RcO1[XDOH)M0;>(f+KeO4XROa9-C]OB>#X)CFR
e>?Y7f^?+>NTEa\<.Y[-+5R3KDQK02DDPT?dJNfdS+g^[\d</>26L:d?;&TX4+7#
O]E>R(&c\@@GFJCZ3f@OZ]Y)JAH14-;831Y@2/WfTP5eM08T42QaLa]N#(bPaRF1
Jf2YGZ#9>0#&f^PE/M290aDS[0VJ3QA&7Ue8VTcM6(H)9@SQ_EbGUAMf&4T7Y3>7
K)0Z8],#NHF=L7bJ#^X,]W+Qb\8C=+]?gMN(_1P-<BCMV\TQ=3.1]7&..O7_IJ7C
]1ce)U?H18RRZOUM)=cddQH?d@>L(WZg]M[6C/)3fJ_6NY.LL;V87Y1+^=TD@U,A
.?ZK4V.][Ob,CH]cP&6.YZ\0Uc6aR.^L3[gfY-+GB&>(_M6>^cKQB4;7ZEAZ,c+d
fWU<5+a<LXFJ2=^^F5UUZ2aEQ(1+;,,UU5J;)=8T<5SS9W1.JSCSeUc_/F#):38^
.g@T[,)?CC2c>c)<OT&?N@W9Hb#2WQ]U\I0F5MR(D]]GV3>:F]U89EPX)bO22?fP
<IY=CbL7HI(,0A02][eF-XW.#A02dCf2X[R45aEZWUQ#X<EH16#U=IA-1,\?SORd
A,Pb@:#NZ\JVE=C7-LK\ae9XLF88-_KVZOZX5.Q848ef-\ER=QPG\[F:EP7>)CQ,
CNX&73ZNKZS421ODK^Hd-#T-XUA\cV2\CR?_9eKY+7P_]N6#-)1_#4Vd>F&H7W?#
[#,B_F2SK[[I?W[d\^VdBU/(I#:T;f,4Fb_;dIU?DaLTKOTX94&[)@?S-S#;LI<(
&4NYZWEPX+D^D7&e^d(6VID[2L1.dOWgP?N6eNEEWVP7?+J0RX_,][LO[V;aG7Fe
\BQ-KI]4JF^RV8Z]X[F?\9[90(Xa[eZI[UG.:5F,W/U/YCTT9/Neb#ED,M3E-Q32
>g#d?,@8HQ\ZG>];ICV2LMRR=MJ-8]W3Z/bgYHU]&H45)Ce]^G.;C<[V\=,H7U7W
QOICN<#VE1#g9MU1S?bE;N(0A#8b,[:TRNKH]U@,7ROZgUYg3&::2]1gUD_Vb91H
G4TUS,P@>fG84:TMdFY(CQ=-<RO()(V+.2FEW0QS3Z,YU7Pg64#YV\&MDMJK]2?=
?JVY;,)ZfK1PVFXbeH4U<VI^GU;GE4B6A0+M_#LU1>.]^Qc;9+=;-?)5g6gcMLXI
5=(C.--)G1ZMR#4G1E:.bJUf#DHb2;caOAa?.FH;M7VP3WG@:Hc.UQ]9@664KK#4
[5?QBe6c5ZM[48XaH<N<APDKg.?V9^-E@:P,Y6baPe#XPaY\O6H:80QR>NES/T&J
gga=LAJ@EeDH_>aU(ggfR\[OIPAGeN_ddCcB3U]eVRT0cW#?M:HR=CR/I\7[-SIP
1YRST+1#FDdDd[@?4d.e?E1a]H^bNKE&ZVT:fI-Wed)bbdD0Me3f@T2RaOff<+/B
eA4N&+K=3&/=B?&/Y/>D(54aE=([TG^ZS,1U..SYW,F+8.)E,7\R<Z852#,fL-\<
/>CfGMJaBR1&[Zf2VNaFfbDgZ7eBURKcL>]GH4M;L<-<B4=9/_Y788a]-9ZO?:LG
,d#41[2SEK8V-L^O\4Q-V)1;UNZDMD?7RG2#<,EI&SZ>1LA4g5,.SJ:X?A&ESUVa
QM0=bGD4Z;-ENdXJc1H.DeZG=b6[S];/LL?DT>E]a]T<DXb3,Z^67HAAC.W-ZW,4
#X&,S4K9)Dd9<.I10J3>GE\(8@Y8((E_0ZV?CN/N-K1&TCX6E0dJ]F.6g72-PU8G
Y\[=]cG>>IT>b(=5?^_5ZX.45I)0I&=U,4I+N<_0/#O@=19J0:5J@;ULB.IB3gO[
2aAHL&<Ucf]0X9CGQeULB)\0X=BO:_&[-]g[-(RJ]ON;.?aV_:bBZM&F\eS,K_JX
,YA0S431LW0RBcK-?.aF)L7Z5f0&b=385,fUU^DUAJN=)=RdEIS2@YYebSWeNJ-P
XAa0d/THFcI:aE&/,K>\1gCQ6A4V-PCaED\e;1NWT:g7E1=Q-[5Rf5OA4fMTeMb[
gBVG(Y&XQYML-b3U^BO@DRC_I0M<gE6>+Fd_b&gU,gH9GTaUHP1VW2f<T[?g9+K\
S8:,H[,B@MD(bHbO\,1N_CeO-RO8TL#Y3^^,28?PO(_A2-NUC=,8#E-cS7X.F(_Z
KFA8^f-YB.]a<#E0W?DX.)Q\4>J+]3=Q&e;S9ggga#F>QU0S2f7@L>11<bTB+:aQ
A&B4?fb1)#RA@16^2L]I:;H?ab@P[&][\?5R/0^O1XEUC5/4B[UUecL-fU)gXHT@
R9R[?=?9@1b:@Fec=caRJZFI6+9Z]OM5eA@16@+RIB0FS,GIe7F-=>N([ZC+=VFJ
66T>HWQ#3X:7_[RBPWOLR[YIJc5B.R5dW@1^1=f&Ba2A\V4Q-g-e5]cf06MH:5bI
Ocg[/+9R4OEUAXgMdbQ3,=@eA3aZ[6L1-7ZPPQS)WcV(>VUa0JCc.5RXQP_S3((9
C0L0(A5cCN_aD]f2,?+M0?:CRP:>_Q:.HIcbd\>9RF(?MaC_EKc2R9[-AF]+bZKW
)P6#&CO:[>J9J>N>#.W:LQ6TAN^DI0d&4Og^>RXaRU-HWEE\+KAW/G>=)ZT(Wg[H
\e+eL.efM#<N+.3I?.gL);M]?+aZSJ90T?Z#aUR&[E>/.YFb+0#SHL230Vg1DUEL
-/(_)<T<<IHc7U;>0:O9#[<egH>X/ZRH_MZ^EQF1=-<63SXd<J;aM7@VedOB391P
KB&1NU\23[4N9M7N]E=:9XZF_c)H+/C/MBJSYG=4-4-[:,O@X6QZ-.G7E,dXL.0X
Z^Mf_V=@a5eTe(YBR6c<SN=P^8.55\L/d/e@LP=EBBJ0bHU_PcMF=>TK^cT=f=D^
GIE;L[E5/Bc4EBC_XSJQMW4;aZ#[AGW-/-T^),d[fUW#+WL@^I\.:N(+F>e<UgQN
L^04#B:,Z_VCU8DaSa(N02DPceEY_@7/WVHec5J)01aIHGN#Rg3gGCZZO2PQ@09P
U3(-6DQJ\HgN(+OD2A@I97H6V[\[GOC2d5G-7H/LG61@O_Gfc.>KA4<SV)H\)[9&
/QD\FOb)OARa4G-PA6#3(FA@?RMGFG4[#.Ha,)+^YFYd3B:.033B[^&0-&e+C9Yd
I>K4DX/W>gC;)=Sc(3L+cC1TBdA>/2U&cIc^XVN/;6<8#TYQOR-RDC0[6:_CFH82
EG5TB]7E+X^.1.6;4^:^JC<6b8#\W=WIQJZ6W.;e?GR7Y/aeG^D(KZI1J]U0f6&]
:E(c>9>#dQ65LaLI80KU>GM3VN;6eO39\P7O^U&:g>caG^T1Ec&P<(gJa5G7XNW&
U?c#]+g\\UR^gNTC&:=[DGS+P.[#S2b3XF?7K,[8F7C=a^O(VcP@=F#fW>V(Y4^b
1DY0Q\TCI8K>W9_>QQ,9[5VM75:-,D6W&f@[;)+<+bNVdF>\?=OMfRM1fHF^GSf#
939fC@YbRQ>gQO9c5Z2.>/0^MQFL)DS&Jc)K=T6_Jfg>9Z<KZ:DQQ_&cUOGPR:O/
EDQTfR^?1LK\[PK-FLA;XS,QUPaPPXeS8/B]Q>]fU3c9IG6V:=D(N7e>S4TaNM3b
^E=8Ndf+QP;-FRb]KcTb(NePf5<N&,-3]NI<B+LUXHIY+RY=K4DbC@UUR=PJR:GW
K_Ne<e0BTeWA=:H.HaK_NH/-F0[<C]6?6;Fg.@OeKP6W^?<+(\Ne5LZ#(R2V9NSO
X7C68d<;;9MM;XBW-a6^fC^/1PC.DC061>dFHJR71^(c5f0SJX#I[FGeL5+d2.@_
)GQ[GXLA>)/g&DWLBP1R/@Z2(B&=d&@TBgQ8)eFN8AD^UP>FRJR__4(:^[=K\ZM(
<=&/Q1P<D.(MG5)Fa_\MgRO:7V17d]W3c<+E_&ZL\@Pc_gaYeDN4ED6[7YDg5^&Q
6X<#dgdLfHYI8e/W?7a9PM6BGAQ7Na-0,U8^eQJGQKAK9-7gQKX;=1V:.4\[I-C0
4B<Za\98&Jb+SS)L87FJJ6OSMM74dLIKD\#H>N&e[d(@9;09[?NFUK3D;).KT;R@
JM-32a\U>#Y1JgL/<BV_?/[T1:g34fd\GfW\a5.a:IWQ[bJUSC&\FeW-[eb;(Zag
7ZM2=cQ,Hf(FR\:59NZTbN+TPS8-L]A;1d9[+MY#4&19:J:(d8bNg_R_X8Hf<:OE
7Q)3C-,)Lb33\A>e6=@De,?D,Yd6T0XO_NAYYc5V#4egA>f]N6]JF@T9S.??P_d6
U.BR(Z)=X1>AGAIffg_cM3C965UN2;aO9,aP)7YKO4(?NJf<Yc;I-Z[VOd&\.dO[
D<Dc0C#>,Q0a_]P.O6V&OdS?dfF00QU./f1?]1@T,VFX&8CVFCE5)K+bcS:N<[7&
16]cIBUaT.E+OWU2E@6LaAEO#)SXRRL,gKY)MJJYWOGMT9-.aY57C4RRKd^73PJI
;<MANXAJ^?Q.>;[6,NRX5RJ)MeEUdYCW>GVE3T#^R_UT:LU@PIVSKdZZTS>+Qe?O
gg7ZIG^@bW@J=1[^YV=\gT@,#FKP.CRRAOaHUHW)>ZNc.1V]/d64L/W+_GLA@+Wf
XSD<g&KDM+@O318Y/U+RPWAGF6&2DZ3CB)gd_;3HYA<07N74@GDH0g-](H86VBW/
AB)U<.JfgMCGM5J;BY:>=Y>L]@Of@C14K-f,9CJ+@)F(PTQaWQOT_QQ2Z^5L[</<
8X?Sa)?E:_TWd#:)W^_PN\G:Kc@NfMU))<.Q9XN1cBM,6J\JG#,/]3L]@]JC1D:+
f&H\(Db\ZSM;\f-O3#gT-Y&W_C:V>Q>#5GIQC4fU=X;DN8_FGWHZT@-6DFcDJ;4E
S\LHVZLJFdU3KOGE>H7P(6ZCSMV_ZeH2UEO_]/U^,U+G_4=^@OH.\gO^<R+.V_?\
-eY-1RD8Cf</O7HHWb:,AbB-+;HHfB6W^QQ3PQfG5WHX.I(HJK@d[7:8,1>45COO
ZcfAF25#cX:-,bGVObY_E?<VF1@LMB<bGBI8b4W[\a?IHfIXF7f,L\(PB.-Z/[0e
[f6660_J[F3S-+c9A_LbC5_6F:cV7_PC?dKaMA&_EK..?)0X/OI55VC#8W2S.^BI
&R6T>RO/_0.6ZK<8Xf#N:@6S0;7@,K7VJE1@S+CF@c#XM[Jg+f;MDU-dL^_<daLB
3#&^,;Da:BVI2+-^Zg-Hg)^]/[-9RJW79C#0[UM>+WP4GN)1.T-fP\9:&d1OT4gY
gX(d:@#,[IQTHDf>#6=M/(U0NQI@L)P,]DVHS-dKY]/;\O7ffE[N=C?7.SB[TNLI
/E<P3#FOW?D)=[)f5=1+W(K86D#U1@9=,Y5SQ:-7^J@e/g]\0TD:QC6C(O]=NCB[
/FC/(P8).<E&F#dP>(-b5a]N-fXNQZPKYH6AGWVZ?T,b)<IA59G(c1TWSF8O7KYG
Cc\_?aPUZG:aPg9]:5AHa]CL=3,.C+aDJ5IYR6V4c5(O>V3=J;10V1ZY\_d^_]7N
&C0(HBLPC#Z80#CSHTE#L+O)A[7JT/F4>I0^DL=XM@JA&SQa(U+T<#-3^1X[]@SK
TD:,C8c/6QMV6O+^-#W9=63V@N2CAa7PY48T3FNCE,,K-)0+7=\48f;K+E(c#BR[
/<[B\CWA]+H:G+42@/9@E2K8WR/O0TC7R<.dAG150IcZaX;NGRfHcA4]=)\6aQ08
G/&d4V?.+MGUNXe]U&\SCX;@S9Y_Y]R<S95^9Nf[WOL3Z^d;K>K9.&U=fYgP1_K.
#cL1g\8T+=cGZ(K[O:4(;#KA+4g&@c]YR692dUG_NQR:]T6?V0UCX&J5Cb&.F#/#
aG;7TB8+agdcK6VGA.XFNZCQK7YE1aS?c6bb7VJ,-K#7AW:+^BC)LD[S1/BZ_R#+
89-/9T5f&U2:71bacPSLc/#VW2BGH4^&1#eP^We<bCZV7eJHC9J9+TMPM.bRA0L0
<:a7VJcZ8TRN\1J/H;LJO>OJ;2O56[Z0@6b5_NcR9_4U]Ca?9GIg1gaQeYZ>MGD.
f?LGKIe?4@D=U;GH<G[^<3-X4Ye5J/OFHVMX1d8fG/19c]:+:Re._L\3Y[AdY,-7
,HEL>X-=N?)M407Q#eGYS902DQ6-+K?:Y&_(,PRfeQ8&@4fXG<ZTcQR.[/.gJA8b
Z_=WW.CbKT7)VH\/,)PT1-C/[@<g8MHg/>=S;5[B#eccKTR:GAQGFEJ<NNXKXbdg
>SEg=-9IW&AfR=O(S#V^S?LXEBLHZ=AcN\EYN,c6eX9SYSB2WGF0>XQ)aG\SUB#C
BT?:GTT.RWQdIcBeB;(8]6D1g;K7f#eU;A/KJd9P-35LS31PE[7Cbc@7V&K-d1+5
Cg(V\6SP?UWRc.\K,IK;a<)aNB)[LSUe5_CHERaM4KD+Ya54)Lcg@@d,([&ZWYKe
FV?&L]Rg]GJ#e(9T,+dSI4<U]C?a2>&#B98&->L/g.HO(0+CWED_9(cB]6?1>+8+
DKgI3#c>PM8Qf2PcPEV?BF#:57:SbD<(M12c@VC?]ZPSB6A9C)N.]<O_\M=Jc4WJ
H2K&K&=4b2.3T#,5aNd5\LZ:YT?BeRZ+=BF^XA[EfCQHFA,6M?::,,(3&JE>06(_
.IM@,eGB6H&P>H5Y?4N)0bYX1WJ44Me-KB92I59B>2)/IJ=Xb5FR<CQeg:#?-N26
X1;b_&D3W,Ad-8^4GKQ,cRaTY?VVR2^S,TB9[@\EH-b?.]AcLFT9U.87Mc^9?=X4
e=a,^CD]RHea;RgQLR>?(&Vgc1d0If[FR6M;FS&afdPHM9D6:-8-DCcHGf:YZ6\F
)5#D=>.(_Zg3C,Y[&&VS/&=#5(P<8[W(.?1=9^/e,&Kb\X<gG^V4-(WHP5UQW>HA
7=3f3O[fa1.L&?56@,U#/B53C2.TV;-Z<\U57W4,^:-=&8eQY0GNMF[6KL#Q2(;P
TGDK#73.=dQV=P1(H/;&:9&E]I^U/8)W3\]Q=\(]D\3#U]AN,=)6UXU8L8Z51g#R
DQ\(Z4B9_^IF(/#=a)g,d&TB(]C8S4)8K#^]^(]U@95gDSGI+c8?GD>HS^TS8FW#
J<NT]>&;F(W;63<?+B]<4SP@ICZ=,<@22S(&J=H,]@a6953:Md;J^aV4<JBAUO\T
TFLJef;aDdN[4M>dJfK?O_H..fCYQT.[eb#)0?^aW2@e#-(QUK&GU_A;Y7a6T?EC
1;=<Id-W\J@KQ-V(5\?7K&>ZVZba1IC3[CP)b/?U10fcUC)ZK^:dP75RE:3)Z,K-
9C2C,MX5CGKK@LL,BNS4RDT_;48b7[bE9@/3LVFT#Z7]C@76ESb^2f_\_gaK37c[
7L>_Jf)]+>1]Mb+8GZTCb<6<9E)W7M_Q,:/C[P>4_+@;XJg5GJK.H?]AUZ>a8+d\
QUHN8QK1<9\f5PaGcS:^+TdRIb,gZI&ZBe(SXa6(;@^;A6P3VYA7e3]Q=T;T@Mdb
:^LKD>],DMH(KYBfS^G[bE72UAdFd7]1UJ[UK7,Y-]dRfM\B\EYKYU?8J3BEOd\D
_5G?-)WO->bF?P89JF9e8Og,A>bYePRZ#Ica(-J\&25,VR.e?;RSI8>KM,-S,g8f
+7\3U\fcINV(-e&J5WcOVNgZO6?_RO&QCgPeXFVR?,HIR^5Ba/3fa&-@b95(BQP(
)C_:f\bZW@eO<2>/JG5X_-;XD;fAe[O837d7201;)72-]/FR>bU,8..H/gdK;.AV
IDA<-Z@XC.0G>TGTO=\(<&YO4YVQK_SI<Gc4f>Q?WB([U[D.gCdf2902,3N=NEc(
(IB:@SUd(,VCKF<,[Q@e5dZQ2f2Wad^Pa-#\RTGJb-RTaY[\P<?\F>,S8Wc\+_1J
TAYRGS.0M-JLCWIFQE03e].-)/b_X?4^?1[c70XXK+LJ+KZXLQd?1FX#1<S\?B3=
cfE\Mc-;fH1NRUG(^XCZM=:cNEVWPF;Y_#;[1-<d2;LI;Af6;[^O/<ee.7FYgDCX
A9g;15APcGD8IKM)9HXdZSI+<T.HfCgE_M[&.5GH62M2/\]6BM+;,&)_E_IT_7?W
TPC#Ja]V8A2V?;P)b]H-#E4DU3f([&2<1\_#W[SAL>3J_K^F/8dReIEM:1F6_0?O
7R6c+GSd0Y4;DI<B7UP>?[]Bf,GIHQ;:P1]FK7?.A1BSZJc,?8^)\e@U>bN7OUJG
[?HFfD]a6.fgK6\=&<.\b9&?KLF).V5U6ND=Eg:LIfP-T9#+YBb-RYUOX23H23#5
0@)0+?XHIWAXM8LW1U\ZQ\1N\:QfZ<KNd\.Z+EbbW-ZBU7MF-._8Mb>(;U9]4BMW
QcF+:d].NS9c2NC>e,6XA;0gWA:g;LFEGXQVR&#8C<P@[>E13V8(\FW>Cc]I\,Xf
K[1CB(VU5-T.N^aAC-;]&W^9SZ7a8P)bQK<a;518aR\WP,bHM>SJ5[;SeD?M=-@6
Q-=bSbRWJQQ5BI<>F8@^C>PI54BGE3(UdeEGJ5aHM?\,0g<NHgO8F[b4e@IQ.2-S
aC#WNV&UNNG:@M6Zc@aEPIV/1\a>]R+M,9,C=SeRHW4Rc@B(1Da9V=/;9?.DCJ;)
A8PU#7ZA_IH=U+,fdKVX1Gdd#/>&P:N/a9a#T]256Ng)K_05S>Y.bBJOU8fNa//M
J_gY5J-C@HX#F_I+@AU<0Ub<TNAID@;&L<:7+Lc@<PT,W\&[#=b=/NLbf@JY=fGG
eFbY9c6\dRNg+ed^da>/C(1afH[LM\<@Y1Xa8K:-]?;UPK,OFB?UUIX&=ITR_2Bc
H@UG_[K&S1&NFS(6D&3QTC#Ec#K_9d::?_<e2GG9=6LZ;Y=UQ,D-:)R4E,dK&-&C
D(?ZdOQ6M.[+1agMYS6&+cFAaN(_5CFDgg.U#a\20>@Q=?d\NVXRg1Pb_HDb3c\;
PRL0=a(03),+EE;XD=YBe3]QZAE@fXACXXI>eWCE,SHALZ4&/Wf-0\M7V]4<N2CF
+(bEC,(ReW4/aeQWR85)<]?12S&-Q/82@7V-[72F]U-18#_;(BCQ8:<Ug/?[.H;9
Wc/K&&FL>1eE45UT-&g(d)4HgMJUK9S-9Y?9(S<Og_Ed9#Ubf>2=+D^EJ9(84_RR
9G<GN11-Ib7ZG\4dL4B=ZVXf)Y),RH/.][6SUg\>3N2D-MZ5HcW)_Y<fZB-G8d8^
#X6L9#<Af;@_/^#.O;JSOWX3>24Cg3?ba(:#4PBd@?UYX;VUgK,=>&0(ETb.MPKU
ELfUY&\WBV=L.-GegNOa@bZ+.SB^MLPM.0L>bb5)8PQ4&,#EH?Y#Oe^DGJI9D(<M
eA=<4HAD\LHI)VN5g5Q]QH0WD>:,:JG./S8[<:(TK/X8AXTf&W16?&VVQUg\;)HO
1Ugf8\-EQ]JBGD:6TK?O;42_NCHf7NQO+(.^XCG-^-+IMZVId7:M9O/a?B5Ob/(Y
F:.Y?U#3LCN5A7VY@]B0]Of0ZK;Udc;<<0ZbHR2^W\HI5(E,N6/=^Ha.>\4T]O[4
dS:B2/82f):WaN:W+^K\5Va=g-TQ^R86J+2S7^GcA49O1;c\=#)F+2KJPc4M4b/<
2M87.UOVK&KT=E@FG^9_8-[6Q1_A(0[1N6/,[YU>:b&7&_Jb5BH-fAd:18/.Y@K5
C=PFdM5UQNWFA]IR[QfU<e/.FIG#.b083gSfE:?4M7<O-F?(F4P1P2+^?c;_&>CO
5YFO;.-N.JIb<6-[)N@^g?:#.))9AeVD18\/G,D+2QCK&>]eOEY8)D=4cde3BSQc
T.5H,H:\a]H_JE@2Z:NN+WK?FO]Y>=Bb6\>I)cA)YJR[&^5K<[8Og7ND-,[dSf=H
H(W.d^ZdP_dIe:F87_/)RD8W/LIVA7J+/1Dc9QP74Eaa@c_\7&]F=6^=/N(b8&L2
W,QWM(>UN[[OJ:HM=I<IJd1XG+U7#LE=&;O;#[+MVa@RLG@E;#Z1ZRDPLJ]0T6MA
_-^CNF75OX_b7LN_;F4[K8B\7[:aI@D9(#(K-bL[WV.QcN[Z4NM8U-ZMgDZ..T_,
8WJ+OT\8Sd>[]@3ff;(dT.\0C:0AG^F]dU]F67H6A<\f#VY\,OLX;]-TT\]9e\Nb
Wc?=GA:S&H6#9&&1-[C_VS3;/O&@f+d_7If@4BOCB#O:?TB8\.fZ<R/g<^78)?BI
\N::BKOK=Qf@R7bY,W[N6Y_,e2.SCE=@Q+S]f7>P[/9Y20]bL]&ZB\&C)Va?1_eV
d-fY(@A>S9>ZP+cALBJ#1]gL#S;)S;SXH>Qg_;=e^I;_Y#_-R6>;H7#<MP><f5.6
N[PcFQTF8/1G30gCO6geQb&)/P)aE?d8EKE[#\:Z8J0a/3P+)=A]TQSeGcZ3L?\#
RMYQP=_=3#DDMMWQ[H0,PM&TXC+dNE0F>UBV7#(<?eC[cbLO-HX&AadRNB;DP\2G
&0<GWZ2B+4]=XP1^g,P.39FW@;=c1#JLR-0T&VWO2K,WERF>5B./E0#Q2WCb+Y/d
+3-d\6/7WX+P<L6_#aO+A\g,\9G.>c0P,-^f<&0F9A+RZKO?1c[)\)D-4LA,#B3\
d8&)^b(M>cCGfaZf=#Wge2MI03>e&64V)++B;eLBY04OJb3\ND1<f1B\2:NR7Y-O
EGg8g0)H9=:XE@,gU[-[Y&X8D_O/_=E)H?6+E_\C?.d;D5(1H;^_7cD^#XI64YK;
=RF][++S3[;3E]e(;7517L7g[CO<YfT2R^a06J28PP\\X\=NDZ[[?;\T/FKN2MC]
Z,+]e9\KR><B>&W>,VdEE\Oea)KWgI;\H7H/dd?.KBS6OT]K/HZ-Q@4b;CC]./LB
P#@4@RL8:Z3G5(IeYcT/-&2Ie7WSAS#W_fI6>A)R--YXaXcd>5aE+<;&4Gbg<0U5
9=2;[ZDcJBgNDeG@ANNg7?&_GPGETRQ1NgRf6cQP;gH<RF0TgX6(1b4&@c0\2U\R
eHf90V;=)G>[E7Qfd^NL#-XR+;&=Z--,F[[1/+G2?0PEJ-M(D[@C/H@e]^)/HEDa
KM1QaYf^d.(3Y.2)(4CR#.G\\-T_3_5L2KTRI]F4\gR9M)R[fL,G@)]AC:0?XN,G
>&Qd2E&,gP=N?S(^[61fC695@Q;D@6UK#V#,]D#/->JQE2JZaD8Obb\FPJH6#-A2
+NF7+W,MURe1R+&#S]L<g;9E=0Mb(TA9[QDXGg)5:H_H-UcK\\:&+?W=W(6;KF8D
5<0YX&Yg>BKeg>&O(TJS61e81eJ2SMAO87<38RIf&UB5H#(MQe(0EKDF#d7VHI]b
\N7D->6V0aPO2^2d5ef-ANTFUca]+EE4GP8()5eI^]_QM(=O5(bII1AOJC5dfYc-
?]]E6SfB;FB+=28@BB[cP)5]/fNHHTQ3Z??\>K.W2]C5TPTPcIXUU:e-\H_.0cY-
.Z703U++_9PUg9+f3Egb]BLFBQ[5:#cQ6Oc0O2/0fE?)=H@LU&^J(MbV7><G]O?V
;#gKad1(VT+a^>U:?Va+56HPH[b;8>gJd+?8_[)DLd,K<,FKP;),FXH4Ee>Reb79
OaB@U,&R(]Va&T0J#;\CdI#bII0B>TCY^]S61;=I@OIdX.G.:=SSFWPS1,U&M/=T
MV&M(\4d&QEC,L.KDJGFC_I9Fb;44+J+e@<8KP9.d&.cX(Hee9#=TAC^/VQB?/-L
_QMM)4KU39FUeMK8:FP=-LSfINMDZ]e)b@A<,JE/aF]]\@Y+&(#==]-(;=c2d-c:
;URZL6aPCJ8=24\OET&.=GfN#YT0K5g;\XV9P_VbdQV&_FMU)5<;N(2G.g/]F;fW
Y3HH<(6.NGZ:-EEV&8e_(aIHa5TLB?/aX]I@c>6FV@(^K..3@6?3Z0EgZEYgaeLT
c+X\TV>&UI>&&8<JH_S^I6fASZ(JbDU.SZXIU;eJ1]OOZRO-@2/<KN71XgT?F7UM
N]W-\Z3=LXJeCHJJF:0-4_VMOF@PPeJ&0J([ARb/IAg.,gAYX<NG^<c70-R<)\(1
(Q6>>\CeBB+</NE-E-EXXV(;]@9]S^E=S/HGd^@6L#9X89XN>]J9/A<fG3SQN>c1
ZEP#DCaW\c7.OS]M5(>?bKD4SX#NTXWYJ#eL6P5&BAS?[6Cb_cdIa6^<0.]eEG2M
Y0([UfdO7#LC]X>8R7Od/1a@;;>gfPR7EaDQ3[<0d;#fE^;L&g-@9Z+>O2ebFg@Y
EO1_c5fR=.CKgB^Z\,a<NUT>T[[Ncb@L4cc3\#NE18;9U3e52P:XZ0@;,,.RAB[e
2c<<<=K.?=WV/BMAPg1A_<Dc+[_&g8AT2>T4bBE31?Q?d7Yd#AGQ-dA[83&X,(aZ
/BbfF3fd]OQe5@8@UFFZ9VWFa&TGOd[8]\8<37L?SM<:=VQ^0Q#<_8gJ9@gDLG@R
2f4g=.0@0=gg./cabZW<65LSCPMB&,dRbV(UB[Z,:KCLD)REVWB<\G_RN<]+/EM)
1R=Pg[d<b[93BXC2Ba>)VaX#<aI9_GFQKH<+/6_EF?T?+]O66G&QQ5Ffa(FVFMNI
gA@JLEG:S_7;.5Z,&1;eTdGHRT3D-ABF+U[GRC3,<O.XY,?YgIf(T6Q,NCg2W[Xa
-2.Ke->ENE1]cDRc-LP3;;D7M.gY4B8>85^</SX5JSd/A(.(CXbf3fMGTGScX:6A
0GSAL^R1#bK>#cd/Bc)@@G]IFBUD/ZAFH4c<]a=U3O)J;KEYTc^J,W+T>KO5b7_[
<#e>1.A#(_JCC22B(8_R;FN4Hb#.a)>@(g/;:/c?E.Bg5[G]8O#1I,>R?F\\gZFF
=IL1++aA:(F_#+DI[93YBebO\1#L@5Kb4bUf43&&Df@HB_G.^DV-Ua.L99Q/]L[C
0NI:?B>6(A)2?7B-#N?DKH:eF1]5,eD96)7E4XQ=38-Y<(d\)fN8V_/I_^?XL6Cd
R32IJP7[2P&>ZOGa0PM<0MHgFBY9POb_FE6CF\&_DOa^#_^b7R](=6HOY<4^>R^:
@6bNa@fNTRO>a29L?3LBc-HD6b)cOE_dD&VE.+\.K+-WH@U26g4bb:7EP43YULMF
K=(A=MU8?E6EYfKf8OGU8=?Q[WUJN-+&?6-VWUMCGJD^U\eKD>IAFDL19S=9,g#=
eI_bQ#(XR@b-MJ9QI:G(>[]I=H3=/XefU5R8?<[IBU1)37dQ\TOcK^A6=Z:+A6C_
=_IZ8^^9N)7<?5.g4-MLD+QXB/;TT[WB?.6cWC^H)232[H>L3>MXLgXFRTM]ZfF7
7I34PfN?fD,I=d-WL5FTLUBR79TYP)A\SE7E]SM/2H4X44.6>SW49=T.DfC5FMUd
=O:R:Eg_@4Oa@46&0()gHeQW0B_\a<&6UbX(07X76;.=?EY?OgZ,4W+A];6FH36/
P4)(>65,GYg=XJDT=g5c:1Gg;/Rd^BVO^LU@bQUTYZ>cee[]gELHR?-bH9CO[JO8
/4Za7-B6UDIc^b2bSfD+a;GEb:JDW19[YaG68,3P^NI-<fSI2H7;]a8b69=;_<IK
4)e.1[KO[09TOG]W\NP:/cNN;1BVJ4:VN7KVBWff5_F=g\4K=Y2ABf4/QZQ(88]\
NL)IVVWB3I8#^U>OZ,V9[?@,S[)NLTJcJ7dKZ)1)7^IEJcfG6Qe961?X3A9G=RJ)
(DP^<^.@cf/8)[=W]P:.[c\Mg7C:OJ./Jg1W@P]]S@P;Y@a5ZP:[/]9Fac6ZOZFR
379[D6MaU/eTT7HdcGY&J0),b[-AeR@][]&<HfLJ4+gN03\D1Zg&aOT&7R5YJVZY
N66.[>@\^&5Q&LFC2>bTG-_]^=3==[:&<P@[ZGRM3>J53)E(<D^NTgT=CKUQGAPB
d>J]&X]#_3^/NfZ/UF3EKV)GSAaG)Q@,SWP:4@Xa1U6SH@@1RH=0K<5;6_;8DI,G
55M=&HB-H6K38DVK\4N(Q4?fgHE,6,\Z2e.V]7;?<S9&1E_&T),1S[<MOdB9gWHf
\-UC(>g83L7R4^a.-<A9bK[^8,F@7V=)dHB;NPAV]@bRX[C-=1,>(PYf4I@e8XG<
8NX(b\XT],CI/@I1W7I:O5[,gA(Q6_&J?dXX#^=Z+T=@BY=04TC@VR13,7/A7cY.
..OI9b@H?/Sb,_BA&gF3K6SI[6[/@Cf@dEW5.7B26&a]8\fIU0B-4-GN<HHQW=?W
U<^H>7<&P>@==CPFMJeRR<8LYg>-#@b>Z5ZRWKZ+\,U/-69EHAe8-7]0c@COJ0a?
Re1#E_5-CD=0HeV#^2d+DK/TVe_4;B&M3dFKMacZT=Z6b-X&^gX93+(PX1-[\_NH
bNO;P+ZJX?VFPg+5#M>Z3SI,d@_4>dS\].#=F-)9?S@M3@V+S(8dC3-@J;:R7C)b
)9:][c#JORMTM[JY1?A5Ce_>8-K9Y&D-(L@3f[,#C>P32?Y#_NJ&.C#cS-=H^C68
b,6O&ESO5?Z<C77GNKb9W<<=9RUEcJ(XX4&Pe.>9)//Oa^Nd?(C4DRJ.;&RaOE#,
aYS?(9QC3S<N_=?PH#TT]4eE(@V2+b^1^8Z_aY&D]9FD&]3/;O^^g,QC;G]Ee+bU
+)A5AHS3?B2[8-Y/X47F]EXG@9[e9RK#_eN<L82U]LO1ZO=Z<1e^^dDM2?8e:BBd
=UG9#V5JReFCe\c+#PQS0fQ<f[JeRR.>=X&c5cK>D-2(;)I\(&CQ:1MFE=:;BR0.
(YHZ8O^Me)SQeK]NVHX1U/BU5cdbeNZ1/8MY_ZLK)#e,&\C9_dPG.+D?@IU4_2I2
1c.c/f.-KOL#I9RW4@?<(O(eW.9f6UE5I.?G@Zf&1(==H[^]&PIP]2;B<cS2XH0V
-H1)I>CPKKL_a0M1R&2?+-5[1)?X?^T3aV6@a@YX>ZX#KFL5#)GP)AQdUVdfZGZ6
^U>>9^N_c#&Q6<9C<XTTXV50N.DLcM#D@RgXeFgD<c7_Ve#>NcgY0;ZY6=;O>#b<
ML&TK6V[0.[_R+6C-.B58)b?O87G,44@a)WWOfb<)6R_1-@=8+aG/K\[UO_<P/6a
6?R<)_^)1P(]-+U75M(d+ZUHM7Q<cTGb49DRDb@6#bU+(KW\.f&WD#f]eFI;dG81
R;7cUP7;17Q4^K,1W@ZK[CT-??I5&G<0)S@FY3AJ5CLYKO0cVPM/c,AgNHN1.c12
R&.^<(:g+T95X(W;#dCYS^BQL_?/II+X)A+eSL8_8CW^J2&R.#.QK;GOFd)8U>IY
fI?Z@/93XgcK(,SD8]>GQD99V6/4ggc,Z&0ADK>/[T#>C;g@BO4RSPfGV6#]OWVW
3&I+R-NcTcdGP3PY6_(9M)6SS(a]1<\2M&(WDQF5^#.MeY5E/])a1;U9<gf,6^F0
,<?aT]gPJ@1XE2JI#La3X/]T6X+]2/fHL7+><LE#:Y>3GRGA2CIa+g7QF:9@7K<]
ZA:OP<]4&X67d/0\DF3,QI,5P^6=>=(FcaDUO:U^=WHKTWBXS#K(TB?IOf0L,#:/
U1U#@S34T]ZgQf\H3<AIV\[QP=2]EDS..D4d[GR7;2ZR.,=#DP+N^FY#Ig^UG]IK
Q=_1ae1#>EJ-g?ZW<[-R;c<Q=5:B=cf-WC18+V;1GU^9KO24B>2@TB\_RH,@6M=Q
fMSV>+\).9/G4TNaV^L=P;cIAM9F:]-/Q8ON.L?LdGKOO5eFg6d&SSAH<cAa_CU:
8_6C7,Xf;Vb,;/CKE[+>M[>aG=,OU<7VM>Y/>ZFPH?O6g]/>#daE=@)g[T4JH,c,
4DX/cJZA?G07Q8M6J^-[DIC6>CHN8L.b)/5AAS61?)<LQaRB_HR;F]d=[c;TE@Q8
2B9GWI/HEfUY.R);d(VD1XR79?8gg_B^K=eDN(/1:a+]K-VG6_(McHbFYc7>Ca/7
N@?KG6aL_X65_c]eaGG,US]>G:WL-.,g&X#aU++0>fK(2beXBg1#27&L/e7-Ie,)
8#OKHW8AG5E3CJC(B-;(V9S-XVIL9HfaK3c6[XJPD@&^(I,^Jb/?W,O[Q30^EbcV
(7Fb;:6,>[[B&)XPP[J,&5U5:aJA(BgXGQY]HJF:8cR+0\[^UaA0SeS(#62N:\Ma
<][7e]GL_>,#<fUUO.KH.G@A##4UXfTJcI\\?fGZ[^UdMF7Gf^?c7>.P/TLTBW,f
=E:WCOK#3+Cf1X>A&8+(F=->fRROZ=c_(K=:W#V0DS58,B+Ge-D@(ZJB>:IIa(;R
\Hb#4E9Q+B6#8(Og4C.Y[>Y^T)UTW)gX?\]=@M]J;.;4@_;@F>80CMIA8/LG9d#=
J-(Dd#C7U:e=PW^):XQ,/7?2KW(SD<&W#Sd?W5CR7/cHNP0@F-PeA(4]RaJZ6O?S
fZ78?J-+JO+3PD)KcGD)cWZX#>1KMd(e_3(Ef\_FRC4O]\K/)T-=ZX:#3gT-?Yea
DX)VG<X@eJSU[gg(1)B14R=\Ub,D\Eg3Rf&,:.L:(6FS._Y/09a^fEcW#bMGMR\J
S8MZR[2e@bI+f-T3>,<@\YJ,+T&7LYVENC/A;G#aQ]&;R84R7NR50>a7<P9>;^,3
D:[YLMcaTU8KUb/;Y2TV.)#g)Yg;?=?ERJTDg:;#K4@.\(b5E3B31XebbLY;\4gV
204_09XKGQ/F_IT.#VG8Z#Z;NK[ca+^L@^IEK;[BU4\ef+&5:O&OV;3#)[UT#FWg
\)Te-J7PTX=:Kc)(CfD04/&_Zc(Q@?8G=.gdV7CAOe\OgR_e;1P?6?)dAbgT2gM0
RC[Uc:;c;;9(Q;8#dC<R&58RPL.WK\d[J9Z4X9MTb4NBOFJ;47<F5?eF4\OY,.?]
K(-EMVK6KfgHJ2_L\B:GLIRRg43^V3RdB.Y@5.O][G4-V7,D,M-^52W>E13RB8eH
aMLHZ#a5X?,A^eH?3_GaPVgg^^W=]gJ1e.a)+;gK?OOg7X#fK)(Me-D_##)VRcP>
b8\U2](/7^fQJ672XbDP2&_a?SD;CDM,+acYXDE5LQMS)f4RAHE#;ZZM2?D[eMG<
85>WFZ5]aMNOA#aD_J\3gOaHLL)[Z1-fYF<fWT>==_R/P-Fe<f3B-P)RD:BMRb3;
1-Y(dgXLcYG992aeJ0.XK)Z@4;YX6D;\=+F/1<dTc8L&d6eFZd8CVRZNa03X&TPG
20[\&-^E^C-:D++6]64E<B>6>E&&^K35T=^[K6>L=dF\,W+JE15N=DJ\#eTNY+:4
@_LJJ_G9#2(W6)MWHBT.=?&][[W(=V+OOZA6R<e&^MGCD^&@gLP6RIMXYZ;\H4)d
J.6,#5(,WUM:SG&45Qb</,2D&;RN5MGIOK]K7(7@53&K1&RM&Q=a^aP8d7>/-_,T
X2+>8a\W_4JB9IX[-#I>Q26OA--dRP3R^gO&^6E:88@(fcP0QF=W_++^@cHA]&V3
(H002UOA:[YABM;@DUH.e1GMBTT^:ZgaDJ=^2.2aJ=H-@c7E8H&<fZ&<BHMdCH_C
#V9Xf3;229Q9:]._GfE;@>Zf==Dg<SZ<.X0IgKDU5b7D=0c_)K9.A<FJ&/Yd\#6)
RW:Q77)^/)=Oeb/KKNT.:+_c)eEgG9?]AQ/+H<]080bQK_g=c):D/PS/N[H1.:CS
NW)3W#4EY@a[?aLC47=9e5Lcf-K_E5TI2;=HTC1[:TI2OA;^b#5_<>g#E1V@bJ<]
D7BaAaQU=^R=f12a1K-@^,AN^C1&Y@O-1>M.6IEdZQ=V4X>()-03U[_ZQP^&8dbU
7W=)1_9I8_-@I63FMKTeZVfE-(Q=WJbY1TIFA5OXUc7N^aDW>YTgPbI+,.3J5b5Q
<];U@XBM[)9XYSdW=BARB_K/SM[>9G6RZFMDQ.\_<gD7O6gePH;L8@K66?/EcBAF
;:I(X-#[?^W;79\.R[VD.M;5bZ=gb9P8\3FPg_@@If;Za4D\4)c8Q_N5KJ#EecTR
g9B678D.TIJOS/JaZQN_QPf#(Eaa64Xe(4KXW&V,0cJ5-#TOH?I#-DZ#>09AK+0.
dCDK5K+IX)UX3)Y<:@a,P6fN<^VH/YNa7AA_S>W<d_RL)->=H6P4N4Y48X-,<8aC
3VU.eB=;S1>:XA&T2Q2]e](&#Q2(?2F0VI<AZYW3).TR0LeFU_FLR[BYeaBX,fK+
X\8A+(N-N&&/g017Z?+Y=7&EIWLSRNI<<82>2O>&?_K+RRO+]@[(>@AQ9\\OMcO=
1gT8.YYCJ^(6WZY^A&GY(AZ8J-aT2L^H]/)fS]D9R<>C\K#0N5?N8Z7g7&#/e5-@
6]..#gWL0FO>YF>;FA<0:;9_WM<&d]@W@W]/TdF]([./4?c+VU<5K]^HD/0T_cY5
XHUM\O[MFbWNOKTDRW>IPEIgLX4e<.#F_MYI[CHM_RPEY\OB(aS0>X0(RPGBU,&R
VgAe93228#?YF9U0M,ce<dA<E]Ie<L_>&\0#5YRG7\F9F12BN0JNN^^f)RE<f5KV
:M2FNe--<-:Z,?C+6]S)-^Z\N40)7DXK,GQ<HOYcbc0+):gf5;7Y5LU8ZRD.VDR7
a_@TEAdUbHLfP][)2>+0]I<MQ#>^3<SX^Z5B3d19>\fdIQUZY6<Rgb=M2g,_e,JG
)N5F&)MCYYRbE6YM85V;a^-W,3-b0G10+]C0cG39c_B<R-UCcbZ1TX/WMAgG2^ZC
I-Gg&+[R#7BN:?OB0P7ICRB@H>^4#BA]Ad/+BEg/[8AJ+@@^OH)#0C5/WK(P0,e.
Y,_deI9;RPegL\aH<4)_/(XS98]&JRK,2/Z6I,eP5Nc-J4CY;Ig.;:5b8.1;N6GR
\00_+0LeT0?5G/\7K&14(Bc/L[I.f&b6)STY=PR\+Se4P++gUXBUS9SY@75XVMFP
HTV],+SfV-#P3[XAG#f?^3+ea[8WC)R1NY5:Zf9D2XH.VM\KW1^.S.g7gTOaH0eZ
<W^NIYeTP-6\GE<8R=AWH6@6E:cM1?X3G-0<R/_M0a_@J7bc_,#VY#gc^I;^?Y3W
MI1>@;F5/LW@;FMdgLB5SM6IbTcK1FT?U(DEGYbRQ,T)LS#,bX8)\5@@(\?L_V=_
4<9<dJIg);H^W0Ne);-FW.eHQ^I6I^LAJa=.V>NU8)c>86LX?^N3>4_D=XcZD6/?
K+D\>[_/5NW2/.1VM43Z1&baceSNN-YW+bE?1L?M/(#/2&e8RK[GX848>MD&]e81
3Z16bO84cVade@a?.TJd.d6)6HY<dcYKQ-;Q3f>Q1REO(S-aQYG<=VfAL,_dA[^T
.a^]C-Z)^BcZd58dTL1K6-c:YdYZaSQX\CHX;K\<g_(8e>I#?H.>P+CPTfIdf59Z
Z0EQ8G#C;-5a[5<8BV\YYAdgH+QXJ2]LeD/(>GF7Q>8>GFQ.\3.3EAAI^362^[8L
_V=S.U#W&f#JY.I>g2f<A#_AUV4@cB_41KXO4@<>ZXf?^-7#V-V-R@c#7?Z^[N?F
M&/.JNJ[8c=>ZS0Ga^HT0(5A[M1YCaV:KQ7T)7-PFEeac.>QNg.=/^B1:?^WHZgQ
,4E5+C:01UP><dWG?XAf<<H#Y-M8EJ^;2RIg:[A-<[Rg?_Q1KD7=:5I+P+=P_KV/
#KP&8CZW>2GC4[Y6W).3)dY:\[6ZY2A/K^V;9WC(U:-a>QZaaW#QFJ1T]>Q6OIg>
:R=fC=A)]M,\VF+J_-aP<)+LG7.8,_7<7PCJQ\:Z#Rb]g_/U,&9;PfHf),CT]-b#
YQAL;(&C^9R0QV8U-1dMZW2L9F]a><UZ[#,<;?VD0Mc40&N#Z[a32,,=F-ENL\Y4
A?;H82>B60/Zd_a@+?331YdZY=V7:Y&:Q[fX(]B-:,:SbD4QR27;#>04]E;Z47&<
[--J3&VNPXI&+MQ4SA?)G[.g>d9BaG7@NZ@Rg=;aU,;A8AOQ8g_PVWbdYFJGPN]:
eQd-KRL]&YZP9:b+gO[6VgD?[I]B..P:CAbJf96B,.a[C)b)(ZO<,BY1#.IEAHV4
VB;cN3TV@?&APPG;4Zc[V5^(AMJ^RXL7HK=5_Ae\d@\V?WU;ZC=7(N+&>FJ)?+RT
X1YBEA5A.:c+7IgA?&aR#VGU)C97Z<H9PJV&\];8SUH;;N[Q/HSE<^e_4N_F7O8R
=YD)YESc/)50-.IQN;G(@9]P)dWU-?UfS)MTgM&fH9VgX3R9CHa#f_fVcD:O8A5H
dePTR<<-WAQ&,c?gO@XN668SN84[Y\.g@aNEN8-3NRCL><])c4ST(MAebJ]\D]SH
T/7Q]ea)f>54e#V]-I^ZDWJEVQYaL][L>c&X>,e+_X;,Q,S:\9YUU3GC^a7T6I2C
D9JUS_c#.0E=Xa_27/#.fNbGTfd^;(WN9NK:c#FO8N4)K-WFM1]\A6<1^-W3ce;3
66@<JV&9@601We&=)ab:BF:T)GV40bEc@G1gIAUWH#2/[Fa;AU.ULg:PUTScHG\U
6ZZ1.FLV[4acTcJA_#2TV=RVOaH<8BRT)19A;JS-W1)Z0H/EPO#I1Xa@Na^UddUX
B8D]dDIQW/<UNf5,^AdPPUaHISK7ARUMRKEdNZT_GUfg:22V@&<I7R]U0M4e=U9Q
cB>=11(e32F[&G1FGC9DdNR7N5K204>ZD=6f2=5NQe&IHNcbB:)aH9a355N-3AT9
[B_8@)J#a>LZ40HM@FDE(;0;bRPC3V=Z7b>gU7MCbE1,cXXC^Y1HPQSA/]DI5F6P
JbK)cf@SA4]=L#K-U1<0&cV(KKdX)+B87GL@Y^5>R/[]N,/]5T=2bX0(.BfI[\e[
N>S3YQ_-.[.Ac16B_\Zge<9&HXJ>>,-4dFOS&7^8a+#WNH[g?8FDgD]>cfb?P#aS
).T\Fg]Ha^;K1B#>ML8.BY.W=_We\G^Cfea@Bd499VT9#J7N@ZR1F30UF/.#2,OJ
U6(]a?HbJX2BcSU(1.eI&B226@I7bf#g&M^_.GT\:C)3c8:5SM/GSc]PY3AX=Oe.
0f>^c2(O=9Q(H>:[Kd?5\\:3RXMY:<0EKedB(CAeM#^^/1Y<[2\:Fgg25[WY@<99
a6P;2F/(-^\AZcc:Wa[gT:gY7_3=-=G@cY4<Z#QD1:/b@+B3>086,UMSd2.XXB@E
45V??Ig71[+YV=>1X^=DO]4C5G@P9:P^5.b#K<C@#adJb.<4>D0_KKeFP?D:KTMH
7+?BZ.11\9<ZT6;OZVf^DUT2\]^W4W4Y?b=-ZQ22[17Ia.9AX&BJ<_MC1.FE,L;H
aLFBdJ]\dc73_1b<5K(\F]I=_3La\Ke+76cM6Ube0BBV&D-I^?K_fdg=/RWS,Z7M
2\Za?6b56TR5dW52AWe(7>K;Y@WTX?d<g#R-I&Y?5CSP)(,V+5gI5/<+8[:[)F^R
:2]A]F1]Y9\OQAeG.BRb\=:32e7-=:X9=?V3?c_O+LL7OCX2;J1[.IV0-;W(@AF8
+Wg.SLb=S;7@8>#)TL1WB/=M]WM/V<aER:E^K?O?^MgPZWQ>CGeP6TZN^86:bdF6
8.a]<P/^^2C+MCSG0eI/3NH6c>afQ,LIcbZWJ;=\H]GJ5CbQS(PQ>,ga+P;a#O.X
e.cHNTR,(4<2bBKa;6Z\+K0W:1F18H0a9]^S):FVX]@Cb[4[C<.MTE-XCWC4CCW=
CU@)V1g3OcC=>c:dTc]e-GG8R#()0Gg1;8]SSEIcPTSa>dTLHb.>ZS\d1Ue,4QGC
HF7<2D5=@b7UD=\>Od;@\R[.>RUd4CVU(7RJINb+&,\+X8fEY7db3K]SX64)Q3Uc
.R&5:@W^]SSCEDG:0e=/K;O<FbN:EcHVCB?BMdV:(?NGDASN;IK];cBa3[cW@+_d
.W[B,FR;f+-edV?I5?(F>G0RNL.)?.N2.5V\gS)XK=,WH74]L/+-=P4IM;O[(WJ/
&&80:g8MU<^06cVN)?CB,;CD\0G/ZQKOec-Yb1(A70AO2.Q@03^OPH\5CM[F>Eb,
0Sf.O&S.(Y6UcT6H_g)#H,aZbGL@-[?LDYGcRBg)W+D@ZHJ^2ObO[H/Z;fg[DB<=
FNB3VXeGaPC67JSHM8M-CfHOXF@ZN6#P#QFf_>KC>Z@>Ie+G\+cK[Z=+9^+Y@?9>
8+F8VHARH.fYG40N_3@c2_4b84:e=>g-Aa;7Pf>]FQHA>S:.?6Bcfa&K;PJCc._B
5H\:WZJQ.:-F>-?3Ic>OPFS([03>5S7#=K&gdEd#[DI&b<QK&.3Ye=J7gQOI@X8_
>b)(f4Z=E>\=^[F@&6)9=M/L6^V<CLOY]>FZ6G780TGaV<MIeb,W3[cZ_3^)Y.-g
dIK@\1Ja>f+A=1R756AGJBBHRKR1LO^Ee=]5VQ0/>:b4d.9d)GNQ\/#31WC7#O6N
D6aY,T3)/V47R7YYV9ONWWZCIf))KK9(3V;e&C=>NEN3U\NG[T8-RaJAU)0J-P&R
=dG5^U-cF_5>ZV4YF11.K_.??]Z6@^45G)e60eXgDB=Fb+L7#W45=2a+,0ZAV:CE
T=^6JBg@),6YV:e@-:U/a\FW.3JBcd&#9Jaa7SWXQ\0eRV[TWfO:HR0M>>bIP8(U
UFXZI?gJI[ZbN2XX^7RPE#.9UK)=0CHI;(f4\^+UT428:7850F0JY-Y&@[A+eQO[
OXBGc<O2JO>-B\K:&BMfQ>Y3Z6N+CR,-@gV4/,KbR]L9WSG\RTL0HN.JEW5GgK:I
^H0K=,M;LW0[P[eXNH&C?Re2CfN\GRVZf(##[(IZ=D&/7bL1CGc3=]@/P(0d94)+
YPIVT,eTQGcYGGc>f?^L#:^YGfDVX/U5R-[0W#a_JLUXH,IK]U/T9T;Ab-,WNL/L
O.-)GdWWN1,U_^a>L&:+?-=@4:JY,fWP0<[+EPf-/751#Wc;P[eO@S8-HQYEC;[g
ED?fN2K>#Y-<[YI+QIZJD]KQ.47^gaQA05TK+Z3cgS<H8^XE:\ddF5#81cBQ^Y)<
3/Xe[^=Q2VR^R(WK6(M;(J)LDcX/.e@-TS&DZXb#]V96/c><4(-C2KbGeYII5T:1
NTT;A,&<W3@b:1J0bW3C:M<@0\[J]V1F.J6cQLNFR41=0-DJH&_8N2=2VI#Ub4B4
BZ<A)\A&<BcJ?F.9d3&e5_2/&Haf2:?)-GU\&[gRF&Yf\c?(,1+.LAJHg01I5ZEW
/@#f&MSXBIJ<A=S(A]UMW/\I::?9]BIVT7Lc[aRNLPa8W^YSKQDe2.dL7DR]9eRT
:@b7^6,O_@(g)G\O=g:SLgX6777_VJC8]7[eC4IcOYUUdK_?c#Vf2:TI(fI+L#R0
/C,-1:STbMOOC9=NPQ8)d3eCD9a0D7B#>9aZ9bf1+@([Z[cO=0;b-UFc-AR?/VCQ
D;g.F6>ba3f\b\6S>^[O=539&C)[^Qf5OgI&&CKWa.SF?VeKe_YB+5R7b-:]Y.VK
>&)OE\HNG&N&UY?CfVDSTX=deM558FcSDJHE6YbZ9G-=.ZTO)g[ZfYV9NOYRAY2G
X?>CP&/RZ.>C=6(g19P79YI\;<1.A)Z^=eNSF_:Y,AQ\ZU]88]:09_Me^BMF=G@X
e6T86NeKZ2=#@G9YN-=(>:0ZX1#5JK,=1b\?Cb,eK&b:D-FY_5-V-:eS4QU,R3DJ
=Y\EKIH;gL0AEF.YXf+O[F]^>V[(#O0R&7E_-&JT6@e8X/+XRVBARa=8\WWdB,.f
dLMRXWGV_L<\?7CFMdK#Ee]QUU?6)&RGYKWK;dENK74SgWJSKgXA^XFZ1b-1R/HX
\]6UTTC\cV&XaS8#XDdeYbZWQ<\g#PVCSdT\e7&:J-2C;W6_[43J/T9>PE^5130g
0bMVU7B)S&VY7bAZRgX7Q].IAV;<]?0]IHVaQ,=S,HQ<-W8POf\VS?WD>+<OQ/8#
?d;Q(9aQ/VZ1AUg::9.;JKF8#@MIW-de5RMU=FG1fQ8T(T&Q9dAR,=e,-@.e:?=#
ETcKOgSf1Af2?Z2[,(81<#QWHP3FKO@2)Y>_HG/)[1g1[ZPcFY4E?_/7&f?8W;\N
KS2B65HDLe&-1;WC\&/-TU3gB+9Q(3[8^=@-f\[J/fQ;D=OOU9)LR(cM8)a(L&.^
Nd]d/&Q:&8aBd9YR^V4c9SVL[K?UM?J#RR1RR-.:9P[+O3dX8K4]<#gZGcMD[6G^
f(Y@JQ&LGZ](e@B8ZTCE2[:FK?[6FCS(FcMW_>8.##0JW5T:b\).&1b0\+;DDU5J
.&4,N:V#)eX?8(L1++e\=2^GGWT9:_5dJ(L3,OS5Qa6#f?578UgV<S)b-QQ[Z;6.
XB0<ZE2aC8J&#QE>9,X?1gTJ;M+G.Oce@/555RVdX<=C-#E3M9-&(bd?>59\&UFL
SU&GT=Y?((\F?^VbaF^=YS0/QC6D9A^?&\-eMG1\AbV(IC0FW,)2]CKO^Z0_FMYH
BVCZ9Wb=LRP0;@O=KR#-)VUD?R1,X8R3EHG:[XDVU4S_+NfBNCaU3:/#:b_-D>B<
)/[6-1I^NGQ?4X@T9F5#\dLJO4/,846O/)Q&WVG?SaL;@AdQ/M,9SZ08PP1/8H\L
Y4.^K]GLfNKJcc>79JcB:J61TH@,.MY965B/gH3ef/0Q&MKe_AYA.9712b[1O8=f
S/:UdX+gS5[<I;4.4AbKZ>0GZc>K9gKYTYV>TPba<dBRZ;ASZ)S^#dG]ZF[2687D
CPT9Q-]W-Y0]DM^JFg]K+]Q\2E()C;ESE0]<CCPcJ_^d5399+)P)9,:D-7ASaZ)P
F7)_7T.T76WU?XeBc:c+0NFA7;4-M^JN/-Nc6aU3gZT24.Y-UP51L-C3C-1Bb2fB
KTF_/X?g=d<68HX3NZb&R#4U16Q/853R]QJ^EeFgFO?NYP9Ffb+AVAGMR_6B#H.N
EFb@G72OaPMST^9bdb>#8@8O0fU/=S9Q)a+6eaM+fBJ\\g>,,e(7e>.9/&RO,;LI
?4GIHD9YHIHE..J>F/GXN4P[A32_TQRfD1bT3X88G@6I25(SQ2H6JZJ]A)624.c5
e5_.AYZA;a?d>),>>NW,UAA)R94(O-T/3LTMW22Bbgb/d#HB8DYZ-IA<::4O]<AB
;6;/CEJ/6)2e(+I#2@L7fYDb+.I^^eg_<D[D^#EN9WS6-0CFcb[P;8ZF1MK<O:M)
bO4N<16VJa_g_Dde,HD(.W06K[YGJ&Je&A;Oa9ZIdJ0[E/GH?]d#[32^a_8YBff<
T+<V>CIN3MTb3AUcU(31AgI&QE)+_A#&2U>_+dY<>\6Q)H2_/\fR\JgN)bQ][IV:
G,>7SN,AI0dB>d7e3)V_QG4>a<O.487]NdY><d0QJOEM7Y47I-TZ8#K3.0+5/><M
bN:@Y<B&e?3]+DaAU>BTB&4UZO4PC1b5AN@IaL1))HeST2,M,)>M433])?YSN62&
+L4b66cA9]Q2@6M<WSFb1X^4A55BOD2c0BNGEL_gZSX3e2&Q]?8#L;-MIRGT3&^K
823HA6E-9>C^Y-OY4]d7PEX;9^cT+bS=EO>?FOc-SX@XQYXYRI8UL[T\M))T;(Dg
8Z,2[H6O-O)Ice,7BV=WdWCR2T#3:VS=H):3Xa6<gQ?N)f<7H9=eYb-9<#HDd]Je
RBG#;Sc38T1=S5@+f58E(/+1K+Nc3PK<>]ZJ=9^91T?ML4aB(gCT\FH@O=VOV^F0
+CJ&dP^FEW2HT#.<@G87D.WBTNeY@b@)39LMfK(.#[b_JQ20B/e[IWP@:;F.?A7X
Q<EW4<H2ZE]ed:2V68e6WeBK.d14F]LG_U2e9F6,EO(CfZ<Nga[DRb]7KHE3:EVG
dH5OKN]b6EECC]V6FH9IfR@GTEX5edU(aPYdDHVY?12#(#;.&d3?V.9_)-M/dMF+
)PfA0;bKA\QPgGGZ\L?#N./YFKfS?RUL)9B1FJ\UdHIaSSdW1c7-b[Q(_&a^L1-]
.J[-(If)-I:26(,??(b=a_7AW12bdP1OS5=8YNCY3ID;e5(8fP.O1C;b1S)B=d/I
#/&ccBJGF;+=\ET3Q7@PSc^/XZ0g0f_[.BM[=:3-&Cb<7>6T_SG^#MMeL9PK6KN\
W=JIQ9ObfPD)MIX@O;K2+Q.8>#G_84DY-WKd47d<S8E0M4_9VNHC5,+4d^-N,771
\?8K[VP=aPV:J/X9TB/B<\8S2X-K-2P0J.\I6=8d#]9CHXd1I5A,P9,MP91ML@B=
AK8@OB:OX.-LO&M;KYE;.Sc@F9?V9P7gB(fXQ>Q6c./L3@aT8()?)JE^X-QF-d)O
c?=MXeG(bR#UTRC-OQb>-aKb0@0P6U<4_a_AGW,f-JS&L@KT3-I<S-64f(=].^Q^
D]<b1/0egb=V#8+7[76#C/K)?[O23e-=5#WT<2(64J#c&>A=NCE__,GV]CUa).VB
B+TPK4S4:/RPH>Q_:0I5SLa/.LQd^P(1/0QIXYT=JQSN/6>FHd-9#C,4Be[bIIa5
NF(TGZB?FZUM)((Tef=N-d]0>;RSe\P</&W>?/R+GB(=(:M,:V#AZN@=8^Y505OS
6UY?DEN7?B.7(VI9.J97.OT46B?IG_4fH\[>NE4H+aI@b=a_G+E^ZVK;30\E0[K#
Q_fUYQHcCG7F,U;F)(15,@<,3CG@-28fI5KYLP;XGRD?HBgCda_Kbf8;05fPG74&
N?)[@)-)&b4ICRWZ0T05+Q[GF_aL5@,ML^FHF\WCF)^I16fU2#ZbIb:g^W,b31NU
6/\4\_,/J:&L^NB>:IC;=97?Y7+,TTGC2L]5I3MI0XBa,81/H5J2G4a_c?QK;XRI
Uc5>[NESF,==G<Y2W\(_3ODeG&AfPUM@a#Z>296[5GP_]2NX=<5JJ7^K/E1g>.DM
0P4J+LAGPJQWbIE6V[>&F_e4+T@N0-/Ma4PeAK7;QE?_+S\98X[5AfS\E+UZ.;ID
R\;;@f-eI&JYQ(#]S9[fJ6NPT2ELbGU1,eIb074^V_a]G[12H7>e/&?KJ@=+fb=Q
W0,7LP0\cZffGO[_TK-L::-<BH<_).E;(f:/SK@=3_=(/LK)Z<,:6<=\e=Oa)^X[
E[1\VVXS^L43Z(O5>XY-HSYFf4/V-JgRUU?@[cOJRXJYI4LTd.F_N\J>L(C&+77@
aZC6NcBGKN;:G-_^c/d6BG1BI]A:FDdbHNJR&D0@61b9U=;U[c5AG>05(,e;1&R+
#gC\IW+Z@[V(0+-^F,2:;M_>M@F)W?T<6Q:T=1.BXHCK=g<==KS.=f:QAH7X?YI=
;Y?:4.5YAIcDP=MJ,+33b/J#<SL-6L;\N6-K6^O2d1\-4-5dJGV,b@gN9<<?gWW?
gf3Ed3eV(G/XQ?7-CH[^5T0e3UfKCB2:24df9MOC@UUJcM71PG8OY\f>A]I(D[W_
.N+,F(0O+<<8)SAVfEeS1V1=KNAN]:/T=JK_f44K+Ae>CQS#1D^C9.G431[1(X.3
1a^AFOPf[I#J8F>S#6K0O(DWHU[C[3c\,V;AV:f?5RMAOK1MeJ:AQ97)LY,BBV<H
([M_P&6=QO1)dAXNLF[FKW)(IW-)cVEW@_>>PTJY42K:LNb:gH+L>b#GgWQ((2)a
@J1)_K+3NMYe21dFP,b8;P+90XN<a9#cIH_XQB&BG4L&4]DD1_YLNbOG9S[G,Rg1
0KN60JUXCXX0V=f/:gdFU8FA:7LC_/18A)ZMN7bB4U>05U7bNP]Y9CV(=VNITGY/
INB;-L4SA(#cZ--?S8(HV:9NU?R/SIDD=N<2)(Z]eKF]faf-C_d/H9Q6-EK)LJYV
&U.7);&_E8K<L[#,D>3MU/<\AeLX=b57?D\9\JHd[/YBeLCU51f.gf#N>Y/4Y;GY
e(_A93247Q=_2Y]c\9.[)#B>PTFC\-X]VB;;;WN&g@)P;B7V@bdc/-VcH,_3gGVE
eTC-E//-cAMa:ea(G;I>KB;T]7WRX>[b2fdK,R4]3^g0PU\+WMbB1TU=PG9g2dXU
Z_FB,&/CIV<efcG,^cWR8U69/.W.,,0AZ_VCK2RfR;SQ)A0)Z?b&Gc);\,YULK1=
(2>3\g]SSVa_:^_.]3G<AV2@:[>^_AScV91\8_)BK#6L0=2<\PKV5P2D<P)IE[Ja
<;Q7I5^^CYJI.(H[]\S(]8070#S9.6<_G^/>gUH(TVK\Vf?#,#&]e3/YU1D6]@F#
F.UB]JF=g?/CHML4fb0FEP=)dV0+\JCXJ:ObY_JTRbP:_a#NYFedE0g#g@<D^1=D
?7KI^]E#MSXRgReWa8I#;\KR)GI#@9J6cDN[/RfR.c?5Ze-TC1OU<[5V[RVKC\@B
C?)<0c/XFNJ=ZG<.E#Z7af&,e9(0XQc^a(Qg#B8VBeDY\1WHYT&ZL;9=<e8?O1Yb
7#_4CJA\XUDM8gab1F)QbJANS:[_7YGWd(7^,P4HP)W_-+HLOOcfZ>=IdE)0Z6&9
W,aa^@Ba7a#&e)XMb>H&E\YYZ\KBSS:B_VX0(V^;WH-JYX8H85.2G?.\1)A(b<]R
f^^M;?1cd<3eg8/A2P;#Q#KR]LL=B\0B.D5c(B#N)BXDE<0+UR7>?N)KUU53XI8<
Lab;TIcB35R37VdI.ZN);6TCbF.Sb7IacN\LS_]ME@-6ff/>U3bf7HP5,Tf:@@#>
VgW==_c6FW8<Q?D-gK_2F:_<gX]_+g9fTU?60DK,T<21_PH3R6R\T;K@054a>JV+
1Wb/L03Q=?_RO&X19AREcMK1[a\9Tf-MPK4>D\PXBg;:BMH,>M-N_BLO7<FE/D]:
e,7AWa)IaUfB,.IHJPRG-0&.1a@S[D(V.e;#WIBbbcHd:VQE(Be2]O\Z=\L)9-/1
Fg9/<RVgGOFf))Y\0Q7^A7MO?Q8]X8[1B+.]3?8>P@/Vb__GTF2/YB^KTV75-72\
VC.W_@)?)]Mf+YVcJa9Fc9gLO/GOH.F&SK5(f=bB2_P7b]S]KCEOZV]=RKdOb2fQ
fBY^I-S[V7]WXa(c@d@a>e)+D89/(?Ja]H&P+83B5TH@cH_?RN&AD9c2=He.a/>2
3Y?_S93(80V@@fWPbKJ-?/d9;W3.N24VU\V\[,C@f>SMJ;Vb0+@Z5WY<e+8;+.\W
YAKMJR6_E3PGINUJ+d>a6Y;-0OM_A5V@4QS@7,?NXF,P9DHE2+8-0bJN.8=(SF2a
#L[B[+f1P9WID.7XbM])&RI56((W<A#gNB9#>>6Y6II@;3LN;[M+&bV&Ue\@^Z6S
RceCP?6;1bc^]BI?99Z4G\KP(KPL>:YT;HLJLa(VM3;EY9DCX2=V+?SIf)L:e;?B
BD&F7\,4+D,ZPTN0ReRK6^;WSW3a#b/0D<;G5PdPag-O)E?7\2VCR@KbJ4P1H(eP
C3d/KC(ae]_QD[F6;M8HTIQPW^ZM5YGG@-;;\3:=KL]T&NQL.W]d]@9eNd#5-^DU
,KZUa4N[&NdA]EbDEUFD7P-)4Gb\3F/6)_>\+]P\e-5^)F4^H;e.O16G3_7R1;Ya
>A)(V/@1/&HeH8X;HRIFKR5JOV=Mcc2N@A,\^d>COS0-F.bcOXR2A.J=8BF,-D6(
&^Y,OC^BSP)Y3T;KaQ[EcNBG?X7eVTc^Z3#O>8Zf9GZ#fe[-U0d>MR-Db(@>C;Y9
Nc9[+8)fKJ/\,H49,ge/F&]IBf<1[D@:dTC;:Qe_6(9BWI/BJ)1bKC2@;FF)Y)f/
UYY\0A20eQMQN9bC?#._)5\SPc#eM/\GZH@E/ZSEe?3&#347d@/+1BEL,RSRA3NH
CH9^)4IT(^9c4JaA@I/MX3b(YR>)/5Z4bIfXR#):<FXca__RaXE#PB=9M#DJRT2^
fgY)b=aICfE-a2.SNS-.8O?ILJO\DCE3,CAN9:,Z?LO1a,GOCRcRWAEg,&T]]9A^
=F.W.c4U+7#F=7@f907\.?Z1[(_cLZ=2?g1WNS+[fCK&GgGIM)9BS)?W2=U:#Qd.
V0#^H_f#EVTEG5X)BM&D,\==aIEQDD\RbV9#@6AQ@6I5S:N@I>H.IYEf9D74>@,#
O3C.G[6J&ZI/@cDZ+A8_]K?&4PAX?_34:7\gLWIS3(8,G=HVFF;C4>V>4<#;B4/1
A.(002E[.e=YOGgf_X@?PW([1L2[-NGSdNM8F@d+RU1Jaa^2,C?f;gYHe5B;K2ME
7d.-;e=6Z;[Q9JS21;H-g>FZU]EVQ)LF0E;7S5M[e8L^cPeggdeWfS,WgVdPF_]6
D2?LDe3O.US)W6CeXc4K5aT521&Q)_TdXH<-3QPH:QZS?U>?La#IJW/;KM_O;OV(
1H\:#dcd@A()JdB^g_?QS;CfN1]L3M7G9EM#U6>b\9]1P)7\7<FD=R\5ZN.AQFD9
c;R3KRMZ1=7C-D[&,(.bL-b2Qg6E,[1UO>:DN5AM0+^ZJ0&))-7M8dSPd=E7AQ+M
bMH0DGf)6Sc6:cSV&=&K-7aTeC>UcI;Cb?J/MUIe.]a]J]NYBQY4B.N(N:=DTUV=
Fd/DOZ.6@O-RSL5=KHF-MRg@e(T4(F[W^052ePUPK<WW\J:XKH2eABVH6b1K2\,<
B2=e3RTb_Fa00(H#MU]M<BOf49IML9)_7M/VA>?92E)91M>:U.QO18D]D#[#eS)M
.ZQ+2##\21).0ICgFR5O:&L9SPb;f(9FB@N[96V_T=4Q;<P5Of,L,(XBT1.ON..(
)5D;M]C>-,Wf&f?1DeWKU)O?VUe@U]-4.J/b[7K(O=<)\/[]T8>)\1^Gg4>(HY@g
@AG5YbL#Z(U6V:>R_1BM9=L]KBT1QBXN/:7(^\(GfV(ee[UYIg>+:NAYdH(fWTeX
\QGW2MK@],a0Y[M(&fU=^>L/TecX;e@eMeJZ2EL^W14M.Vg=/TNbdHMa=V)S.1/<
B3#QU0\FF8^U.c+@I1<DW7e,.e;G?TR7^b\<+UC9FV][^TQ5af>MD<6A]OPIY=/;
]L<2RG9d^/1Yb;(5[ZLU2O84I3>e>TcYaY;=,aPe?V0B_YU17P]>>P<0EUYU]@&b
5H_H?REdU=WO<La1(OB&KU;]e1XO#VCNAbC7cPZ#&\^(R8,]3SU)Q9=Y4:g-@<<4
9E#<KaC]^/8#+->R,4BSM^<S1(NS0)?+W>(]VX_RXPNDYfAf.IcTR6a=BOQRZ4I9
O\)1O;ZG=2ER(CU[VR22+\4f7d_JN=+FEZ=/8(/cJ^@\.[]<0JI+09MGV-X(NZe>
U:SO80/W859R#&aH&2DHF]Me#TKZdIa]0ZX=d]G7UW\@E_58Gb1(6<BW(R5eg]QV
L4D6b-]V^]bBF(&).N=8KX@Y?N4Cf3[[4Y@-S<d/N2Vd7CN&/5E-.L@&Z6QME617
2ZY/Rf@g,=\YP]d?5?KbGLE]EROR;QJc^MPZWa:]&<T,AYbdRgZ:NV8eE<5CEF39
gK/;PM0IRWQX;WG3<cDTD#V\Q2TRL&4)R,0I^F_B,T34V=7L\EE9=]7]0^c?,0a7
0LCHKGPO3SMB(e<S^W)B(1B46VP/4M\?)01g&IC;/8(Nfa7-7+M1<X(6^:NNYQbP
G<=c.QKP5]MXA,A+&,I<:</5RA,e/3-(<PfE_>H-ZAI[AaP@d\Y-NPBB]U1(dD_F
GZM?72gBEBG@e@#BL7LOZJ;dP;Nf+,-^g.UZM0;;X]7:(;Z/MEBdZUU+CNKeJc[B
eg@LKUW6.JGKY0@Y-K(0F&I<Ab;a.JgAAV#KS4gKU1,cKCWXO=I/OL4<=#3DYP+1
O2aR15a#bS\<)/AUE?AKC]7TE2_#LRMMV[DT2545:7cO8N0O7U]-eI]KDf<^Y3ZF
FB\U+EgCNHKA(,YCd]/2K.C>QF=R,<g#WH/WD-^AHG?7B)e/0g]1\)R]WgJ:L2V-
VL7ME+08781I.be@K5EYZR?CB^)U8UX:11J49_7:MCE[Fg+c_I1I:>K\&,->-d)3
UE>4WaTP;((LJAJQ#>7.D7F\QOaIOCOCNR(2)9RM4;CHd]CKU(KTK_M6/3,11.5H
_#)IN5@ATaT].Z#AeQ9,FC&W&;9g)R=39J[&?,#f._)+Yf#3(#Ta2SDgJZ2;-9,#
]4Vg)N\_5e]M9.4BRCRb_g0M83OMR1gYB?X<#BS++P^7&KP/HK@c<-D@3U(Q-[c1
gXbV55#eO96QHeE/A\Z>Bgg\9dJ+^YJIdcA^./MPO<5A#412NO-V04+6d4DJDX&2
5^b9bDAE4.AP3TT;W8a-;[D?T&0e);>LIEbMcQSS0ER6=@V:If2dZ&XA&LX8^0/?
?XE_]E+7@PHQ:@2</&-<=d/E[?A/9[YYT2fUFUB6]Bc,<Q&)E8b+5RZX4bJ8#0@C
>Uc_9LcD#G_;FL)ae_8PY6X_+G^[3-#O08LB;=OQF.X;IQYOHWD0)UPBR-&S;+^L
NN6J,Be4HL#G?9?:^2K]8-[.VU9D2(/,V0AA[2C8UW[)MT:V[4OZBf5]Z^^CTIL\
UXGO3A(cbVE0\N,NWaUMU97@4+O^OEgV&EZGDcW9WUU_TPZ:B[d,_V\[[B@dR\DK
gJ3F7a_GDYU/Y;;G0M#-M5b&6;;,W<,Z1@Z#Nb-CdTE:+Z+K_\PKfY<.J6HXa:WG
A8J1X9#A5AYc9gG?]QZ4)P#>-O/4XHHVgWPNBYeHcW+<f4TIQI]:#&6&7bGKP[SS
-J^Vg0M[6TUTIKL6R/2O,8,KATU>?IJcQU_e<WF<S#)+RYcWY^H4])2Q.WBCVM2<
Y#f-44)X1-9(4MO97S9K)D:>B<b?:XF7E0Q<M7+DJS\aM4ZU7WB88f\?a0/b@6R\
.,#:F_^B8(S+7(Ec-/PTB6(&7Ng^PAQ(e[44Q5KL[+X4/4f:PbP)=DEJM5J&NfUU
F.:9#Gc^OH]^5OADU0B04E7CA_IO1]=A.0W(Q#>QA2d]T.3-#KC;J99D7X7\O05]
g_@_59N&D&<]W:.H;[_Y-Jc@;DS@^]\J?J3C7c9,4N4^J(2ZA:L>7T>M-,=0JHDH
3><JgbBSE>:<e0YV:D_XVK1:S)a8&48=[[Wa,IdaOFV?dMM1&[_@TF;PB#KL?CZT
f]X:5^64SUbRG<b<2^(N<@7H>g7DCRdAQSfFO&Nf+.b2Wa/:U/DDfJD,6X+[WR45
1-d5:X[ccX?g6dQN,<1)<=54+>Y&a+Q;-;1(LG8MJ-@&=7HLP,1=@J#)B1HT/KS>
g65LN/+=J<Wa08STTTU?2bS+^FR1Z7-G=69Z,;A&M_NE3J>aZ0KW7/[_E3M=S=T[
f,0/?4@SK[F=R)C(/_O8aVe>4DaX4V^6KQ-W4)cFAZR9TEWD/_HM8A#](]=1_QP<
2b660SI9X8L=S1Jba=_L9)5M5L.G6a4cfeP69^2[Gg_d+^2+P0Ed>XI8=4Z-6cE-
(a37RD=7,aG533>U7d]89>F3=b4><\AQY9+Ta4OPE)B#(d]c-Y3?.^a-_[@.]RS-
?OJF_f^cN#=>cPd^fG4WC@_UV-g[&He7OV3d=5OHBd3I/WUUDfeP8MR0gMX[=9KV
bU#@f645V++eT5(9W]/Mc1_U5$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV
