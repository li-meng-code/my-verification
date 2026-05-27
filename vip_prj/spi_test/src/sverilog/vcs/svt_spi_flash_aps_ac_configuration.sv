
`ifndef GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * APMEMORY APS/APS_OB device family in DDR mode.
 */
class svt_spi_flash_aps_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width duration.  */ 
  real tCL_ns[];

  /** Maximum Clock high pulse width duration. */ 
  real tCH_max_ns[];

  /** Maximum Clock Low pulse width duration. */ 
  real tCL_max_ns[];

  /** Minimum Clock period/Highest Freq support.  */ 
  real tCLK_ns[];

  /** Minimum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_min_duty_cycle = initial_time;

  /** Maximum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_max_duty_cycle = initial_time;

  /** Minimum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_min_duty_cycle = initial_time;

  /** Maximum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_max_duty_cycle = initial_time;

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */
  real tCPH_ns = initial_time;

  /** Minimum CE# Low pulse width */ 
  real tCEM_min_sclk = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCEM_max_ns[];

  /** CE# Active Setup time */ 
  real tCSP_ns = initial_time;

  /** CE# Active Hold time  */ 
  real tCHD_ns = initial_time;

  /** CE# Active Hold time for Enter Half Sleep command */ 
  real tCHD_HS_ns = initial_time;

  /** Data in Setup time. */
  real tSP_ns = initial_time;

  /** Data in Hold time  */ 
  real tHD_ns = initial_time;

  /** Chip disable to DQ/DQS output high‐Z */ 
  real tHZ_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** Minimum Read Cycle */
  real tReadCycle_ns = initial_time;

  /** Minimum Write Cycle */
  real tWriteCycle_ns = initial_time;

  /** Minimum Half Sleep Power Up Duration */
  real tHSPU_us = initial_time;

  /** Minimum Half Sleep Duration */
  real tHS_us = initial_time;

  /** Half Sleep Exit CE# low set up time  */
  real tXHS_us = initial_time;

  /** Half Sleep Exit CE# low pulsewidth */
  real tXPHS_ns[] ;

  /** Minimum Half Sleep Exit CE# low pulsewidth */
  real tXPHS_min_ns[] ;

  /** Maximum Half Sleep Exit CE# low pulsewidth */
  real tXPHS_max_ns[];

  /** Minimum Deep Power Power Up Duration */
  real tDPDp_us = initial_time;

  /** Minimum Deep Power Duration */
  real tDPD_us = initial_time;

  /** Deep Power Exit CE# low set up time  */
  real tXDPD_us = initial_time;

  /** Deep Power Exit CE# low pulsewidth */
  real tXPDPD_ns = initial_time;

  /** Minimum Row Boundary Crossing Wait Time */
  real tRBXwait_min_ns = initial_time;

  /** Maximum Row Boundary Crossing Wait Time */
  real tRBXwait_max_ns = initial_time;

  /** Row Boundary Crossing Wait Time */
  real tRBXwait_ns = initial_time;

  /** DQS output access time from CLK */
  real tDQSCK_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

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

  /** Randomize tRBXwait timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

  /** Randomize tXPS timing parameter in between declared range*/
  extern virtual function void randomize_tXPHS_ns();

  /** Randomize tRBXwait timing parameter in between declared range*/
  extern virtual function void randomize_tRBXwait_ns();

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
  `svt_vmm_data_new(svt_spi_flash_aps_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_aps_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_aps_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_aps_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_aps_ac_configuration.
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
  `vmm_typename(svt_spi_flash_aps_ac_configuration)
  `vmm_class_factory(svt_spi_flash_aps_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
(Ca3L(Q2U/14+L^?cbd99>-5URSG-?,?]K_=f0HD[WY\O\Q0E_RP-)>ZD]8V8/O[
3+A&C6.WRd8fUB-851>FRc?\G2+b_+@8#AMMYU)-V=(,>g=/9,07.=Bc8aXG5:>W
@:)@8^O0@1ccC)^-f>);b02VIS0G;GOY(<<1(RFT7bc4EE5I#Ia<7c1e)fEfAabH
&.7gf<K93^.-TN7_:D<>HEP:&/GU#g]N(=DL@a&-J5?I;?cUMV81I+Qe<7T/OS;A
L.MTGAUd#XC..<B6LDd0-7_L#T]4LRJ=e;#P^/V_YCcMX2g__Q9?TH]V4@(/I5J&
4Ld3+O+cRb[GD#.;4K\ID#BQRQ7V61K/3,=XfLG.@O\.3R2K:gDAMV,fPU#93d1(
<47UPcBd8G9A/D@P:BN.:KH7DQ]#MFZgB5a)LK<HA_ED?6WN3b&F/;^A1LK8^556
HNb=Q&R^FAKF@(C)R]1K-3THHcdYC;f&90>1X:B07S#XXeU^1(XW#GNe._Y2R:VV
KA(:OR\24cDFR=I;U\O/eRSH(EV8:?^H0ECc7>V.ORf,-QK6OO(/PD^L5I-,M4I<
S9_/.[1G2@d59NMH/Rf:@3S=SeX<4W44N@1F;7RPK#cb3.2QO2,)a2GbU&FVc=5&
?(DAM&#7f5MG4bB:^=6F;YG+QYAQURKY,:=];+P2S:bPS(d8H\BX7H@2<<_[5307
09_?8WZI864X@]bHJVK.;/2WCJffA]f1D;:aQX,dRc]@c3aZa&Q=W=@2M$
`endprotected


//vcs_vip_protect
`protected
8Ja_a3c?]4I@&E:#Q#)-Ee(-K1;_C.X5J_NEGMS,/?X\X5KH1XAB7(<=IL5>BP1>
U,O:MX?#>=]:a46=(;][TE&ScV<L3XZGH^ZFbZf4Dc7NEIW35f.(((BXE4VQPFe]
7?:-0]H\M227eY9/1L9T<d08&1(LY..^?BX2e#<_XV7:5QfPLe7=dT(G9N&@,\K+
-ZSGLZ@.ZBAIWI]IIPCXVB^2ac@92MKL/d[/_]B5P<V@,JEUgVNDKOdBVWP>1;EL
SX4_>J[/G\>a[5d@?\(fHA6.#/eZX>#\M<<9),-,O;]?]ccSC@6=^9NM;T:+e98P
@NUP]f8PT7WJbNHFB&^W5IgTBS]PT-5+eC,6&)Fb@64:3A7AEM_,g9]Z#S?PL.JI
\,5Z].1:R.QYf-3_95O.)7fQ^:Mb8;J=2Z(CKgXL19Y_W\[:;D?5VWFMERFG?77c
V][]RHCDG5Q-F#ACE_E&A_S3/?DGWfgQ2gVe>5TGdRUT:G_/QD(C0E(X>ZbU6?I)
[eH?>PO\;GP=d#O:46H4M?f.(9(JQcGU\4XG)X4JG#,?Y=EE4d=NM+1c6/B;D^<\
^3VPGa8;_S67e(&5#:F[J6ZZP1>U?YJ,b5DT@I#Kf-4ETcgQ/gS-2Y?:@[6EVe=B
9],,f,I\B/#O9c(-HP/P7bQVI8[Z^28d22R(_[UK]/W/6_DCQFXE.9;ZGdXe:HLD
dSMTJDFW&D;]F??HB_#>?EIb^6N#+7R7__PX<<G@JDc:/TL=>=Ef:P^GO<LGJVb/
JYJ)8[]9_.CZ,RFe93ELO1/@7+I[Xf:g^9H]d?[KB;R7MYf84fBBQf2T\MI[(1(b
+/V+4N2ZAcb.H556FJDG=YSS;RcV@+88;SQA_#_5aa<TC3d3HWMA##BcFPU<8@NF
c0:V^K>(=@b9RY,E?9YSUYJPHHX[\U<)-A#A>b=I]IOcMC+3H1R-?)1(g5(7K=<P
@D2AGVSa:_S?IJb88[AGD9G3F?00,SaOKb@R:0J.7P.K+4a[N4V]OEa5:\d\<^-U
:@?FbgHF<AEb.P3I81&D\73c:Z6:EU+E8aAcDXX+.,.P9XN)YBRE\/g,LTYF;4)O
;QVa=SL55(>_Rf?QG1.;;,7.-\VgEUT^=U9fLQEDYae3@RF/\#I.\CbgbK/cb4^e
.A8Rff4Od&#V4L,e3TV>3cI35QFU)[bB[-;K9W8@N8gcg-g+SXc@J@\EB\RfR@UR
V5E9A-C63g7;NDb2US(Vd#?fP&A4LX4UNECCSbPfEfL)NT466DO;/,cTB6QS&ESX
M<,V76#Y;0FY\/BZKTD8C^e^Q=Q=4?G?EXQfHZ]>=g#;.+6eAFU\dXZ-RJ)CKH7Z
1MP-d1C<bA]O6;aCV#>c&W)0eZ7[QUMFf?b4X-_bQACFM35-U+_bH(-@VU+d(U)R
ZNeI^Z<Oa)[OE,?)aG)[?]gW:Z/TYVJ7W[HJC+,<=_H#ON7?Ad/1#IECdM3#VTH?
Z70];[]ZNJaQ:da6S#I]+;(CDA?Cb8Q4=XKOW(;^<KcH6-]JQ?>gWX_Sg5O43L(F
>6FMW],4,bJV4H36?F53:/M3<dVdgP_5PQ-\):37Rb0J,DDAeH6S]dV/,9KAWg+I
YH2^c7O)P;:WO2T.;<[Vb)fBN]K)b>:>DRZRcS,462V:dN97+DH(GdM/;YO@DM#N
e+UXK[HIA?9,6YFLVUTICORKL5aO3XO79>0b.NC9MbKD/GWZ9A&b[R:6:UEY5;S\
XQ-,E,X^V8N>5-RR5<798)&,RfD@A17R6\3>D\]&#Q>f3#_4Df)]WB.?5<YN]d91
\W?(03AKd6BI(<BL:&RGX((CE;?]:b?dDF5SQ]cO8//Z]dS@O^Qg\QFDJ?b(O#43
+UdRRO-:DB/AA6^T1N--ET2@ZGBFKB-X&\eb&XRNL),.]Eg?T]6O,Y/+aG;O1R&b
fIN9S\<g[=1B_:g^DCNA48B^XN:A,+QW0]K)8&N+C#TaY?WA>a_0U7cO2bB56Y,&
O&P(TR\dBafB:ZE;]RdbRBa1/J/:33CVN/WU^9<<]ZSZ(RL/Y=.AD7R&2B^_O/g.
aZ78eSFP4.-829[X4AEL5SIT;PI\@Zb_:O^GN/)C[\PT/^10HJ,0MBTJZ\;78+K#
H8+dc2ZBM??6PWTaI/V?=Tb7F.fJ<--9=XW8\-20^EI/<F3@ebAYdY0:&P3\RKbd
eR=8?-L]@QA#KW8b/2;b/GH=V_aC)_H8+d#NeIKJ-[JT\15MX^4FcC)1fP-).E2Y
]L<YDM4_g9=J9(TOFAHSaG0d5B6TK;EC(VC58KM8BM#VN;>ZH>ZO9S-FZc,aTJ(e
geNRYQLEJ4.b5TJ1PT(OYQ?78GA45WgF1a^R@XX=/CKc09X29bAQULZ?d&#BZP36
3S=_=f#+,UMWb1N20M,cQQaMRKS6AD1?Wb?(P)H,g6[5fb,I-I3S2RdO;#Q:/(X<
Xc,4S-#IWIWKB]PaYB>D,\)\T0[d^d^MP#V,Eb:dfd902SHNdY+ESf]S=cg,(EJ@
FMRN7M(0],0g?]#-X1?:<[?F,P?9f=8BbNaCWN5P(ZC>RQV^E0U3#7HZ#2@5?S]b
N5#TR:S)T)[>-;V[GMRPg^>IEV.H4I&\;^OgM;-4;CJ<GBc]CN7BGZV82P#01Mc?
4W)5HD[2K?Je8]J)FZX6TTW/^e?5YA&a:PPeSJ^:ReJ7(DSaE3dB\d^;;88LVJRE
2W=cf,;/@7&1d;)Rb\eUTgP&c#20^T3A_(<I5Q:9MeI#^_B;:,RESdAe@G\[-5AW
0[)S/#>f.F9.FOI,H3f;5BXQCPA/LNUG+_3QZ-=fL7D^D/YB:WdC6?QWGD=W9ZSX
6;Y5>?(T@7;cGDX-a5,40743HEL,]EOTg_R>[4SE&8_;Tc44,HDS_B?2:85[P,@]
bSD_^0e_5XI@A^1&-e&e2U6XWGPg:@#L6-;NNe(=,Z;7eef,XB+e[VH?Cf^I1LF:
eKD.Q8PMbM<Ga4;F,88A0JP?>cT#Dd0<>Y<W?AD[?1]a@d]E@ZCSU/)@MFPfIP<^
@ID^&,fFGS/1U1;e56SY=&+\1V8RJS+P(YGcZSDUcTgZf:N&B3aR=Z2EN2E:\WBf
CcdA#aHJ\X<?]g?>S56R&XMg3Z:]+9I<#Je;=)Y8GI=]4bIQ^0cU?cb6OXZO@67;
)Ya4JJ>&W&P.&3f/87J3B)Hc/;b&(FJ.d>Z/:=2Ce3F])2aZ)94eRC3QaVT?[Q.-
SGb7_IeBZVF]6<WJ/:5Z+92.MV+TBDbTc/PeU#,SPb5MH<f]]<R-Y7+b4,:MWV^@
]^LZf..JK(\Pb++25#()R.FK(b4dL]BP+J.A<>6PCR.L^<VE=EF<WBB2N<8U]^AK
&3T#^XG5N4eBQFFN)H)=#WV?\J>SJTfA;LS9-TZ?C0,L#3ff(B)9<?SX#?V=CS?P
M;L3Q;]@T=E:/^@8PQ)&@\NJ:fJ58K-6_ETKYZ:.3:1RGTM6gW&].@,U-<N,GQV:
P7=<5:K;daU=9PI]84U(N7O:DSc-b3B.BX7,__YI+F4P9;A@3U-[C)NEg3gJE.E9
BAL<GK5#d4PZVR_dZA1Y6ZL=VF;WUe&5.ZD@efcgGM_QfM76;]O1>KS>[L8]7I,f
V/8Z,.Eb-/[EC)B)=0JAE>f&AZLM;#WX16Q@ANS19cUTU1L38Yd:Z\]D9DBK(2L-
JJBY/cWWDSU@::ZMIDLU@F\M>2O&VR.:9J&V<PXZ+5<RGM,DH9<O[63NNCJLa)&M
61a35e=C&D//E5FbIgF(ZF(U0S78@c,/.GV3V[LTEFW(B6\XgFH(III=e],Hg9Y_
]ad@P\^[YXXQ[J/^U=TH66]JYV4<2ZH7c903YA+HVSA/HHc8QP38+KB+WOGGL#HB
MgESE.+V3=-Re)1AZA8_LUN69aGG+7/IEOM&AH]G-\CHU18LSbW1d.Q#gg2M>IZa
:^@BR=P0_J=B0R2a<<:<@141P0B3e:@J/HC;Zb)]Og4,+b2FGUH;ETb\CKg#.L/A
D7^^R#J#TT(7D.[<,e0/FYDBA<O?.:bHO4L@-F#gfOUe,RKdT#:I@<RCZR5EE2#X
:;c.\(3EYE;=L[F]_Ob8ON8\YCd@9M,[WY>/ULCVPcHU#HVX0B]XG7dA=M?+/KY_
[8?L7eYALG8RN6d,#B7HQ53Ie>F]d0G7R.)YY\9U>R?cO.E@D@6#H(ZNQe<]1#c9
Mc7RFG;,7W.e?2EAK]1V#EW[Hc),,JeY[7JV#^cIRca@;>Oe,PdNF/)6AA>9cSOC
L>dTY=UPK9>]X)^,Ke^dY9Ob5eZPYK/DYW9MW;18_M[X-\[])9G\BAX58L?b9>FA
H?2N\JA4R-NP(D=+;_IbCTX>Q[gZ90\V6L,b3[)LT@-M8.\GZMOR+_3JY<V(6\JR
9S9FRM[#5<6Vc)\f?cVc.)#CIFBOMQ_IIS])@UOKe/\dDDE=cU^D112(1Mb7[_<Q
521d(H36G\K5B><\O3C5&VgG5U\E0AW2X3VB4:5/5bMJeD>:VIV,YX[a(R&MZ=_^
M=>H8HZR#I)7V&<L)U>d?S]aaWX8MZ.M^39)Q+U<2.VPCH96/.2)R.14cD;a5T#\
S@G4X@=f<X#CC9X33T2\S7Me:2QeG1D,=Ye8;VEV[G0)98\6:OSM)=@bbP2AV^3c
<(&5IPS5D^<?&UJR<g;P_>20+-aF?@W+5RP+2I9/G.Mc]M@ZU?CA7J04/6-2fJBe
Z2811cb(K).7:28SgB1MfK2GEX@ZW8X@/?gQe>Pd14g4ae7_7CZI4(d[f;dOf4:+
XMD1.SJ62b1(e=?5]KZ2+(MSeD&#JNW-0[+I@K&Z,8>b(BBBQ?X:A@\92-YH,/34
12:J2<;Pe1a-2+cddEGMYY#52#_QYLb7K9?,b&6FeR7HE7VMbA-A<4aEHVOS0\@\
,cKa6:?1DK@d[:G>,6.-1&,4KDZc5)(gSU1CcL?;\&(@DL1[g@fC=/A^HfD,gVaS
8?/K8OKL9YJ6.Lg0@\RYIS_W4[V)N\X&?#?=D(SDR4QZU^A1I7gc6cf>:/+2I5UA
b=Mg^N>8I2DZT/1IE&VTc<fGN6N=Y;6;>WA2YWTK(a_W8/H_+TV3QI^ZX^1BU.g4
?6&4__SZX+3)4F1BL.NR(d@NGS)R[/=)aL[3<^U16RP1HdeI@K.LZ@Q&H@E8N?S.
.Ld+PW==3.DaRB@;TFB87A2e0LU(E/(=Z&McB[6CY]].f5S^UG(W^c&+7J0?g)F6
T4TQ;WSSR9MNFK2&cAc9#W_OE=<\I_WP:0&L25##0L0#8:TSU&CL9I0@A#0N?QbX
58a=BIMeV=LJ2)F4EG#\1,R+<&-^)C/[@[f&Pg,9,+g\=;4==GdE03:?E+/CR74R
\HC#3E2L6,L/\+K8#TCKVE(UF.f;OW/BY>(/)^Y337cM#@(.f\[@BMI+M&&\A#b8
/LJ4-\.EK2G#a:S^Q8@L[fe3RC8<3?E_+2<MYN^]MK8+ef+\GLQ#FfWY5_X<\22=
]T5K9BCD77@NfbeYXO^,??Fd;I&KJS@7,6T=#75f_V9eAD,[(^\fIJR@V]D>5f#O
a2<R#\f^L)5.gZVK_X-9MI@J_g@TLe5Y270H>^V[0,9aH=+f.db3?VZA+C;VN)KX
ABX[Ngg[D1>Ca#UCc.Z3M\#b7PWQ\[0QLS:_CC>Q.X[.BPN0fHQHS58OcNK9+SX[
@BX\Q0T.AU(RIbBOS0:[70BAE<5@YKeXJ9JC?2,S5)d]]McJY[(TNg_9R_\0Re[b
_G>]X7SBM^I;_C:BH8Z3-N<^^#?M=D-_1KD&?3LI9Y\U=GdePU>C,Z,Ra,50Z^>N
/R/=3gb+I#8TI907\4Q_1RBR@XH0dcgFd]YcX]0XeePDcB,Qb(]:+V/5/6C0Y\>\
DF5#f98&-a?K7#JT+[E>,63DW+6UTcSd[NTWQc1:D)0@K9dE1;9)#NNV_M;03CIX
g=^\YgJ:QH62X#BIDI]gbZ:?ZHV1KLge?2=ES&XW9g;QeO19#La4cRM<3K#7JH=8
XdJd=-;Y;#RE9KdL7#(M:gO]D688KbgYHb8U-T1;FdD;/]<8:>TQ1FR#LICTPC0H
9BNaTD,;FEVF5TMUPaTJ[EHAe_#0#;V03/&+F[TJI3A-O^R6aYGQUbI6OA1VdYP^
Q\;_F&&+:C?]M@e5c/eC1JD-^.456VCd_N.\G<-_IM]f@Y2S+N3AXG+O_,6LG+0-
d6]HAO/#__&O3fV7L,B>LUb,QI/R)K:dG7[;D::cZ\70Z<D]eA#\B#U_bH2&R1<S
W6g:,B4)/D2YcO;R-,2e]_E2d1(C7/_+7bE[>1+:J55S15I-&9bY?41RZGC,6f_0
_5fe2,]]]b72H4&:@.]3g5;G&H7a0L:YH3a(1&df+KFF1_GB#N@K,AOMMc_\WJ4M
eHV06g8#f]]6bZVT5ANN5^?],,WADP3c7J;49CS+6PYC6\3-U;O7fQ3e/OP=DC6:
FIQfJ\eYBE/\<N1+NDR;g@#8gc]R&[+HOGM[]cHNI;E,Gga6e@VR(R8S?[OOWUgO
#.eFAfcgb;b-a+4\:U;Zg8eFPS/e.A&f_TFXgW.K_aJf]cT7_/M1ZYGXZd&O4QG@
-883#cPS##c>#PFIKZ7Q__JF=A^dD+2\?G\UVE@d&&2[f.6_WU2]PMSZcRHC(agT
7D)g>S@]F_62c,_/Wf_9aONZWCL,fS4>g?[ee8^5TI>N1RA^9Q0SW@/QV-]+)C6G
,8U@,2H,cY6+/#-7f2,JObQLN1;2I08N<gD)NVc2YeYc5;#+GY#],.87XgE>\V])
G[UC&=EN.dT#6PRX;/GTYS_eP>Z8OTRTMQ@>2E#Uf9@2>#X]^,ZQOUJ52;QAG>2#
0\;M5/7C@,R0a:ZMcS\5F,6b1ab14^6U_#V5=@.,JC@UJT+GE+OLd7<Z)V9Qf\(V
)]VOgM)?SJR?KX4bLON;f<>H</#-#^?^\,(CGc7gBOSd;D:+0:e2^HE<b?4.:>N+
6/@Uga3^Zb#[]ePLP4eT)+U9GFMZd<+KJb&ecRURTV5/)_ABf.OTeaf@Zf+X4S^K
7?+/:A-^Ka_V[LK94?IW3HTCV(OL7^6gHgSD64#FW3RVVIgN)2.V0X.7&@EL.c>X
GO9IWTE/2+3)73675<Gg-bg\B1@_OcbP-2d?4+0.3f7O(7ZYOHcN=W#a\==JETS(
\Sd&W)C0GF?J(;J/P6_V,7Q1e^96cDWOeAG3B_[/7]Pdf2dD[S#N&Z@XedJ5TC8U
JOgIL(gV8GNO.18<\6S+cK,I[P9FB1-gR:.^7H^UcZ#YbZT;c6gG(9);cELYH>TY
.gfZL^Rb(AP2N&WBc@fbUfL\L=Jag?RMXN1-1aZZMZV]e@#+(6BQRK@X,\+a(>Q5
D(,,^I6b=db7=IB[A#<F(5VNURIXN//K>=7-EDI#NCJ?]Gb7:U](bDK:\g<Eb.cW
a^2-FT\dFfU&F9Zd\e95NfVQV\2O/AP5?G&6)\@TV=4_e&6<,a1)L+d_B?B3N7&6
?#gK9.GL1;)6]<(+HaFBCBA/Q-b90KfMQ&LK0J5T0<<)7XL;&FX/[c7?X7NB_VO5
Bc?@AN483SQZG<47CW/:/e]03U]8_f)2LC5>0:+YOQB&UZBLH6)#XeQU#1Rg_7>4
(TL>Eca<UGDB3RV/YN:S-@F/)MURDLVOg<7;UMRKMHJ,#B?52Q4d>/2+YBf<6[_e
TOe@28=_<&XO)MVf)FWeE,,0aHUg\#GKIZ]82ZBRE+g#,VXQ#4<7(Y)X.XDF+NOE
RE00D8U:9O^),7_[A,c3(]QA]>WDY)@\RgO#@/=e0d&27[I0V=W,>Gg/I4PO:45f
&JQH^:-&V>M-=JN23A,:W7O=,U:LDW8BL)XZG8X)8=g1d@7XA,K2A&67EB-]B@<+
^+?51dDWd<BI0XB_d^UfKKS6e4Z@)RF,6^>c&1?aW7c13Hd8&DZ?/V[0.S0EJDbG
?VHZ:eC7MDDN1POG__R8T_d6:G(V3Cc=I_Kg[H&WR]^9=>4Z@]2Sg6TC;E4ZCU_)
QISR;TQbfe>D=8V=0VMcI[<&WKfXM3GY[:F@^]_?\9#48F>N779Q?ffG/)Zd@_[D
R=LKdI;F1LNN:#T08TgdQ:DM[(gM6/8@9;^OCCZ[D=UH++dU2_8]NDQU)X5PG:9J
<P:Q58+Mb1<UOaC38LZ3gF&eD^DHE#(CS_JCAEFef^H>793K^9DS;MWHVN(fTZ]H
[)W3^7cGX[;\-BdL0C#cT(MX^caD0:a@8&59d^+_eD>I4FCS03W:,(3/)#@\aRY1
[0cOPL>Z?<AU+Rc[[<O^Q_/T-VKPTU:eQR8-F/+A1.4&-INKG,9J=ed2L0@=G&I5
Y/;+1HeNZR>)UK>PGW69ZOOdBd+YQY:[e93](HFQSg)0N&O-@a0/?4fbHfFgeg@R
N_[\)J36<&<)B5RLJB=.)g8YbR:E\G:PQ@ASdfGFJIV=ecF\_^PUJL6ZU90;Z[aG
)fGQ=F6T>E@IbSgUSBIPA)^f0KO-3Wade:d:^<ER6.,2N=eAC\2ZI3Dc9P<8I+DO
WFZ7K+?9f,7BeYRCPB0<FL/JNQO2I<IQ+EI2a7S^M&cBT9ee\380S>?B^fA:GD+<
TGfJ)f9N<&<gXRJ[W4]+4W#WRGFTM]._F.7fAWOW@(DD;W^a#_<0JL&?Z/_BH2WP
#\fEPE)VTbfP_>H79dK3]^aP3&DG)E.@(J1E6[N0gV&[N+]=eQRa\Gg,I1+,(D)B
C9\QUD&W36JMFU0\&b=^#/eEaY)#(RZ:\4VUNKSVab9:bO2;bKYf+MAE8b(V#PCM
[]9>NY:HWPT4;OW)aKUK/)beY1.45QbgZUJ5I4PN3:,D<+N3gO<IU#g5ECe<aZC:
(LLU@GLJ^,/g>;XTe4/O^I@YBBU\\1PJb5(@[-+.0[1JC@ABLA^0=;D4S5:I2KNG
7E^OY&O[(JZN9T]1Y,fHT>aWL-&Kc(,CBE/=)=c5c[V4-#//+d:I5M^.e1);<Ne)
2ETdNG_,\?.FCOaL/<^Y/6:SX-5AM6#_BgCgR,)<EIa+Q2,C4Vd(U\=CKIR1b;:=
N?dXGe;4cKSfNc>ZG,-9cT(W.2(VQ\&c+=cGDd+^b#I?)TC^JHL4(HRIH]7\\+JS
9/F@FTPSd@VaL22(?4K++#fP3KV<OW/W^9EY,J=UNMXEUHda1B^N.C@bOGIQ9-Za
:g)^:S(HOLOF-WJ#.,>H=cWH2MM+b1DMS(Ig9fGT7O3-B^bLA)O@Na?895PEAb67
@WC(341LQa.PG\FAG6cDV[[^1]ed:C<^DLYcTcK#X_-c@B\J+.J/>]c7P?fG;Y:3
MEAd/Qe2Oe86EZIAPXI8C(BAaKH(827L6.K?YeeL7LNe^-(FJL0F2a5dZ2T:,aVO
fG+].LJ>TO.UaIYBTW53aNbgBW@?#GW.<][75S?(11><;],]2P>g9HZ.N1Td\A]a
Hb<G_0HI&)?\0c&b-G:Pg;=_?TO)B+2X[NcW[BCHC.[Gd9@#+cY<;))e;dKTXZ#G
,NF_0KZfBDfGLRDUGA\c9?O5O,Y?X/:7W6Gg2c[7,<-_EF^7@X5DdU+AK.g,Y@NF
TD52I9K;UdVNVbgf.0[7(g=<+JYVNWW@4Y7E]EB@@]34TRa^bT[8f5VHM3cN0.:<
+,X)1Y7U-96e(E6cAeKZ1\ON_efgY0J\.H=eO9C;K18H9]+5?[+^gReBZX6-ZQ(E
-.L@d:)4Sa]c7J-<7WCV-83.g\RRHNU3MSI9S4M_5W(E)>2bS1S;K\/\Q.MI6[B-
/?,,##D-&K5Z]=,T?CHd6K[YHE\@c][3N^#IC<_D=A+Z.bT0,QEd3[5c;L;Y&E>J
,(2cL>N)7?AGNRY[(8g-^FST_6;KSFBF0PM/_V.7G@L=_\BG7KY12O6:dT.C>BI9
=R\/afUHNU8^[VbT9F&KVaG=C35(+C:L2GG@DNdLA>LYc6(H+S>a[#f8?==^=#E9
O<3VIP:],R:Q3#9dVf8N,@;R(X/P=O_+^6K5T/[IHgd5@;Y#US:cRLG?G1W_E&ZP
#.LG7^Ad[ZTMH-8WR(0L3/(XbZ:SP_L&SJb)b4<F5)TOeNa03e]gb=a0f2P[8[(+
I?Nb2BD-B/K7KFJPAd&&U1W;).T1)@Kge\SL@c7eHfb]>,,-Q+_==9;LIbDY048.
U])(fAC.cdOQ;9W.5YUZQ=-IXJQLCZMa:LZS[<Y1cNU0GU-5HcW2+V,ZEO1_L/WF
,D==&;4XFTfBOAI+R)eK.RXYIFVHL5VHMQP?/;2a862e63F8W/L0)J;#]?2)IG07
.Y39eALJIZD+4GI-@.M55NKK3dH;VT=)?+=M/?AJZBPG3Q[3)5>.BOg.,JFccb0^
RV181E2f[S[+23O[0G;20;-[.eQP??E?F?H:5+7I]Z>EPbBGR@bP^]E-AZA7/D^6
_7BEf-TEN\aZ\NR)JOG9PRg,0?GX.NPA#4,LEa?@SU@KU?]J9?5_0+;85/52]\0J
.UV6GC&=6E1,QZYPJP3E&E@MOUd+T,gBLI9T4C=aLUSXY/@Pd=e1Y6W<W6A&0C31
2^DKV5Da.E=C>JQKBZ1#GWZF2-34IK/F9+XH^>A^O+NAFKSb,)7?0c3MeF/?]OKa
VMDFRI&S[&+89+\7S)O#G_#F1O(81[?D)8<\R(J:@X?PPEIM^eYI-&adUCZ5U\YY
GCfQSggDR@.7fO3W6)Z8RQ,4e>-FMR.8J\DN3)3Mf88BeSQD<OLU>-QLg1E>1N=E
_85P3\ZZ=\&[gQc;H,b;W=3fBOZ)/IGDRQS+R0QPR;-#eX)AP8FYFSNW,9P.FWZ\
Pe?X#C+)6(Yf?6I+MLIV)fF\QIe=17CKJa.,4CK>]2JX?MgfUWT1^.HV<_58LXZf
(>FHS5D=RgQaVZI7LE<?6_CR#I8ALG33AA1>WeI5a)^@D^.IJ[?/35WC^/KN+-A9
VfY7R+QZ#5JA^a\18OLHE3)g+XBR[FOY)X,,F:3L&CI0[#-1egg53[VSaAX-c_?c
e5O4]XZCC?H>KfXa1BB,8Y,T-F\LWFIZDd@JH6J6IC6KN.?BK085PLO?<.(ADBQ0
7W=;dOW51B@>;(VAXDPK)fg?Y)GB[fb<)5(>7Vb^?)=F9>Jd]eN56QSb09Bg\.>:
YG1\5^Q9.@@=Xc0^L)]7b)E14,2>[Q:H;6;GS3(Q\LAI5DeP&I:AJ3Q01dY.@Q/F
+MP2^U]TFCYT@e5dZ1c-5,4\>#1bgG;&J173[LKEV]GH8YF>600)K(6:6PPAHKdH
f-.cX]3e]Z7AQIKbcYHe1?AG7V#5-4Q2R717bL]ggC:O[U(Fg4;[(PJ0?SATLX:H
^bLcPgZY2O6(H;W?O;OGK8R\##<dg?V^;Z.5L6OabHG5[@,VVHBM8Q5U9,MDXUaQ
#\=V?XdYT8>9>/T1eB\HU(S)PQ<A.[[]&7XdB;DXVf=JLKDDgcBXeY--,A(-7P;8
?E:a#7,ZIG5[_Ce,7.7ZgCJ]DF,cE8RXL:#E/M<OU:8TeW(_17:e331UBIFXQ)74
Sa+\(=RE;g#B/@#OA_A5>bJ,SL<MN6T,(B/a4NWR9@d;HbHd7W.LaX[0X)5H15Ec
M19[XAf:HIVJ_c.^JNM>;f(JC^TG/^e+QT/?HGXc:aWFEP(6G?F@IB)UL-(c(HNE
Ib;b?C:(V6,W4a(PNZJJ>V348_(e0PD&P=8^gfa1d&\U_C>YUB:E6I3&I<9<(FFJ
3IIeR:9X-V/R0GUQJK+HfU5/fL8<<MC#A@BQKb,?ce)Y0SQbJ[/T:d;b.-\RFDgc
#]JPWW?(#N./HKS_1].RH#5^[X:\617[UdWa#>(/BbF/@+]GE&6[@J:23GbXO;LR
#(T)_Y(dW\?]eQ3R((PXG0g/a6?1Tdb))FUAH8g^[OL++\5_A(bXdYJP#Kf+CVSZ
F^@80KCO(AdfX<1@@L?8@.,+K&LE8Ud#<3^Sa96ICKFU/B=X-eaT77JUD;T^PgVf
Jg5&-^G_T3J^:HPF=f\HV^?0)ZQVb/3eY@5eG/MLF>D:7_^5R=?G6VG^)5b)ZJ6.
-D5egS[@H-Y1&F-DHX=Nd<X\f^MX)WGB=JG]e,AB#3^^EHO6Ed4,d=2T;PB+TY0O
R+f58e7KF&f._8_1JJ,YZLH(-UIW;].X,+]3(A,386LI>G:b<#ZEPZO)=?QWH9dE
1#R0U[=fY=TgD6<Y(L;PXaF/@dWN-?dR9b_#Ig.T0gaMV?T\Z=N)RCKSRa?f_U(>
1_.)b<.6573]:2?a,[_T4Y3X&>8G=J;f4/G(K6;9U38RDfd29-3+/)G=6G>ZR.K^
:PWR-LD#fXXN\ZZ6(6\_:I><-&M[Q_QJ7P,SYc226H>[+^^1E9T7&YbNYIbC56)V
ZF+^aS.WOU)A_b64H&0eSHK8WMHSXcCV@cZ9_]]4e>6KOC;Sg:76)-ZM#7(;,[9d
bKNff2@L\7IOd(I\_P-@N:CXD3REM+^AM/FNR7#1XB3KK_#_Z>8gUY>VYPI#OUE6
+D:E7Y9f?O,&K6@G:6]KK\OL(]fURg+NE7aWS/J;\EP8M0b#T[?[]cIXBUD=d0b2
/U<N38S:IU]]Y#HKf45YSSV)cS9C(TdcQ6eHT_LVQN/6J6dMH/Z+B7?CZY[20:<M
XQfC@FOUZ;-Q;9&a2C1-5P=AHd\#?)ER?5g:d/a//Gc^^O;OS9R/Z-\2_LY##U^Z
QIEG3&&8bBg]0?eHZ7\>ID1?c(I&1:Pc,B115?a@T?4-#(WIc.4()H/7a(c557GJ
ZgHGR_/O?;(B#\H:BM?7^?6JX7c.1TX+U+2cL_=KLfSUP,=gTVP9BefUF_0\61fg
KW:#ECLX+N:eL@)>B(,X^)[RSA6]#G0\M[PcM2B]cIW1gO@4OJ:-&?SRg4aF#]@R
LFCU,[dSNJ9UI<[A,K-_BaNRdWVfPZF#,adD8W[N_D(\<KdV]9GX]=UB<[TaKg2.
PV6d7?R;XO\0Ma\^<KGV18K;g5=4=^=IgHU0G&b[;4:M7/#&<^f<6)Y1GMB;3)7:
PHD#5OW3:UXNR^A],c+6gK&[#+UM0DZ[fF]UADd3bVCNNWJ8V34D9@Q;/OeCg[(_
=bdC^K62,WfVbHW;33P-dA:DOO@]#0U9#CBGU.I,G3c(&4fIgN1,fWM=L8;1WR52
:VbP9WJ#/=/7(<O^V1./6]C#D.X?,IZ+UZW-=W&@9..RQEa)=+#;J0Z[6R@;);(6
g7OB]#)]7&a4A?Ta-_a+e&2N_N@_DZIJSINK,FF8#MP4L2Yb\M94I<<f(\&^\Z0[
R(CI7T5e;RI6:,[LKBJ)SZ,?30K:a[MM[(6a5WSe9O4L5IXJJH8eY^[N4AXI#>1C
]GW)Y/7d(I.T\;[Z)A&W7>SD+Qc^d.D7;fCX5ZKUH#NYW>A<.C6I#Y3bKF7+I],X
a.WQKN9H:26EBUB<(Jc/K1^[00QVG]+X]8E2\KgM1,b0HY\)((5Ofagb?Kb.#V:2
.0a/Mf&(M_UNV+9#@bgAKfF6bfcZ_7>^XASAEaY_/835JW<;7#_J?DI]BR2g/2(.
&Ueg3L[>cdGa7bb(+/4?N,[d;QMR;?5]7E]C<^KdbW5P0)&./cV\(.ea6Ia,DZ.^
;QA,VJR./03M92-29.U<;6&dN2+cGDRb+EA-&=#L#-2WGPWBcb0M25&[c3+N26Hg
ZF8=GU3&JaQJCQ^3>V(M)7[A_f.U<>@F6YD)@CP3?f&57K^.:\AK_I?J;SNA-+A0
.\4NH)@5O_Q+E?\c7P.NSYa4cXU19c6_.VEXL8>Z\SK>88aKQRM.O;:?1YDP?(,<
G8]YQMKf?YOW3@U0^]TcJ/=YCAAYa(5[K=A7YKeRTBT:9?W0<TU-7,ZWJ(BH(7LS
\Wf&R(f5d(E]Nd8\bG=.e[dN.a\Z),:A9#gSIS9J1XW[?a>F=X/d#)\U+d[&CRX9
3eM<),F(OKe4OB(LFeOYY,[^Q/DSeZUW(+>QZO8bDE)M]F]O68>(WegSN&2V.4?a
:bFAd-3Q[_E68M<1+8RVV<AI/PFD>-Q#B-+f&Gd+_&R2QHS>-(dJVfF4GGKPNL\I
LBYJe()KKJg9c/(+XB;f)TV]8a,/f,6V\6=M/BX/.?;.S@a4JS]A1JY]6Of(DSA>
N3?JD6<[P@@IK@U/UUY>N(W@J/E@YT>MA&CG\\,KK8GRJAJ[36f)5)NQ4D5ge?B#
HF7\J8\K,Q_XKTd9LB()^[^H&G76R=V(V8O&@_<9T,85(>79eeRVe)L>[Q^DFK5H
&01/EI<]UURfK?KNTXK.#8IA&Y)V#&2JJe??V-;BFgc6dZZ;Sc[MOE.A&gTO=&D_
UNW?f298PC]C5.>Z?cTO0KOCdd3ZaOa2CWeeV(5Ug5TTfEHdOVDV>;9cGa=LZY]O
&79Y^([@eP,?T/TPQUff=3L;.6VH-eJ1WP?\UbXDJTJO?#JSIN1(XRf#15F&WZXH
P/^QSQUAXV)3,AC=<?4QO4)##QXd.>DcXbG_F5X9DNRV[DRQ#IT:0UaM>98e9aHJ
XRRKHRb@=XLQ4CL?C/WeL9TAV10_gWPOeS3VP;NT@[AWa(f-E<S/6fcb>/]2LYA9
T?JSY11:;8dJa<,G1I0aKL_[@)N(VZ8eV\\PaaeZKa8)cE\9H1_dBAb6(27c]0_>
0SD3#?\24]I\^BM-;a7-KVV.-:b<UIf^7JUMfcH;UMDAA;0\L8DZ/6/MH8DN1=#-
[:dDR#DD7(=a279N#[>UKU)@3R<,+];5_E6C:__UFaFV(7/IP,[-efPH3E.2(D=H
0M<W+NT<?X>+?:+#Y<NZ?<P(9<MJITYV<)M7/IeGNSZNRLGPE)^\\U@fIX8WK=EU
79[cRMIg_?+6a)cW8M.:M(K&E7U]GF9dCU_Z[JHD4QCH.S@PF0WR)I4@a8L8JS-E
/,A:3(ZD_g8#gOaIII)21[H@?b8+(b,53S\(A,c2VDNWJEEVT;=4.&(c^[c;?G@U
.=6RL7.Le0=--<[EPI+:IC_[E]&2,[<3+O,K5==Rc4YO[@cfJYH.64<_(=+]KX;7
TFX^)A3A_O+GSgAR#BIV[18V/,]4UQf)-gXL>A+,2N2<^N.XKg;bU\a8+B(:3/S\
61^GWac5+4H6]KG_\aN1GR;Gb\KSJYTgbJdG_A&0]Dde526N888-&>7Mb#+[.NQZ
7Y(CU^<OH5;--\6PdCdg>IF8_d6WdN@28=d?;+7^C9:d_5Qd8H/F3ZV/2>/BHgIH
^H>.R9<4)L;GP.]+9>JO(CbdZ>BOQ6NN]_K(f[3\b(cJO9,+L>GB4V/_\>:Pc<G=
O7Ubc3W73?39AUMXB\IW=WIf:f//._.aS=fKMS\38^H]aK/6^_VA1gIG.&.aEW,#
.8.&&3W_NC)5TZX9N)D9M@ZF_D#3Z&T[7Z6NVH;),D@@g<+92?=[;:b+Te/P(Ma:
I_6:3,86PR)(.F:&0Cg2J2.U/)P;[dQ_7ReKBIA859H2>9aN86J)g+1-SHef#QG#
X?BWOaX,2Y.O_QUQ?.fL1D.GIRP,(cgfC9a)U5BLU?HgRH3=I>fTRZB+e[>c#:gb
]<D=LFS,@a:fJA@7\7)R+JfCaWTTN3&6^6e?@V)JH9Ib4Z38;CFcHZ>T383,U=AT
<I,T\B3Z]@g[^aT;XVH)\[EaN(HEggO?XUD[g^3Z3E(C4\QB>Te)(+?(</GBCgWf
d9T0[E)@BUfa];Wb9)d1J-ec2@3)]f8]P1I##Z5P6Da-O\,ZM)#O@PY>RAKQ]L4e
6Kc/]B<J,16c@+#_ZScU)C@)X\:HU[AWNWO\>>\bC/(+V;c_7YeEO^N.E6E91dVe
IKG,L+OMH[:L3X(e<;)?eYY;_U-I6a6I1;HaMJL:_#+7Q1_IA7&-_)C-C;cgMG>0
Q(6(>;1>3QgGDg+S6U1?^N(<:e4U\M4+;OBa&ARU:N&f9+@+Mg+Dc3<\AQef^QPV
FeWU)CWUC;0N83=&C2A]Pe4U0.g\KW5d:WIK]Yaa4YeZ-9Ye/0G-7c>VXWPbF;cL
8_@CBXa3^0?#CH])NgcA2>P-=/P;D=eU[KAW6<f:EIXaMeeR>O8CC7I17/H1;.,b
B3B+ZcN\^3bJC59._O?>e.7Wc416?FBD[BH?PLZFQa;,KL/M#M,T16E5&_Ia#IQ&
5d<B3:.XEHKZCR&0aDe50X(E:d@A+Q5_MR(;?)C^]V0A452-agL)]HV1,/^S>K(#
BPA]WRgCQQB2F\+IY2#7TS(GX&8-BI^G,(7,d1(9d0Dbe(M9g0:DBT1IYTZYaJO5
dLf/\#KQG[5IF>d.?]27ML\E_A<3:&)0Hc#aD9A=NFfa>TO@>ZHS976\^O)a53b4
YZ/JGdYa@.=G4E24LIHEYRVXI7bIA\(2A,3F&FS9^9cEG0c;:a7[VSKV+E#&-X[R
R87Hbfg.36VDD2YC]7?TTZ<=e6;#;aV>U>\d0#]J,-JXQ#BE0>7R7<=bbaE<+RGB
T4&dc,0EJ.&0JZAGU>f=/^g+e4FD/HWW/c<B2^;A9Q>.XK=J81ZT86;@H(6W=A<Q
WKdM02d8?#P?0I=QWBe\N/^6\e0NA86,IXZ4M\RPN2>D&-:B+Wa_^Pd=C7cQZ#[5
\e?+.:G-eEY(a@J[L=R<O(a90;1WbQ-?-(V,O@EN,UXNK+EfU4.^c#e=?K0b>XCU
A+ca/,M>KIPP[+P0I<GecYe5a[M\Ag3W/PE(Vg9f/gX_[0[?FA8#28#b=>B2bgS=
H\g034L@?K01I?HLL8b,Kc/7afOE6CHK<VJ:\^YWZCFUP;7WO)NUSNc)=P_)OQ9Z
f4K.N^GIM/A\VV4fYfL\Jed)=.=aB&QW4VSEE(MV.9BPZfX?9UCdNC&4^)Q=92EM
^S2<UQ:FM\AZ,JTdQTJ[[a8=?R_/[RU;H(5=#+ORV7Dd[J0,5=;ZXW-.QE@V,Vc<
@K+P6Nb37UBL[&U(OEOI/#56b\d?g>-2LZ4\..RB,6fcBUg6S49T((f_\NNB.(0#
XcRUNKA-O>N^Rb(QJL.89@EWGgVF#Xa::JVZ)_e\_);34cGKU?caW@cAJN)TVY\.
b0:&.G?(bX/#MKdF-9+c/-S8L7VYHbaA?R&dIYQJB.G;#=OU:I)gc@d;d1[a<6bR
WIS]eH2KLB^D]3PSF^3?ZbI[ESGSX6d1S@3DK<#^c\KB;5CC89[DL-b.+UX&ND?9
^OD,JK[1PKEVZ(]WF/bJUZ7=0K#LU/^,U2Q,\fdIH23&_9NUA55M31J3?>3f]WB3
;g0B79b@DCXZ(fP^E+8:SML3-A)5UG3TT?d@U9-;NDY=^XM#Ad<bLJQ?E_+MZdB@
M6K[DK:1eQ_5NMe9:?(H;)]UXaVKe;T:Ua42b&-b_?C+_-]G();@,J(0A6Y&&b7?
J\;27UVK2OY#MG@9gK1K89]79&+W+T2+7RPL.3eZ7_MKT2?C[<<&=2&D7G-KCNOM
@7_>8c8?GQ2317?&)+U.WT?F4D0](2V<DdLgDH?bWe,B_C4\=A2cN/GgON_9ZB_N
[fgED@S(I.=W]YD6Vge@&UXL_4RT)]8ab=cD]A+MZ39WZI7-V2^PR#gG86KC?=+;
0-.4Xd0UbQI>)G(6U/#&HAWS7&3O?^+S[gW/&9c0IH:?P:-&f.afQI.JA40RFQDY
0)e(??H<e76-(ND+f7RBGLYPZTLI/N,@5DXVC;4XS(=IC;+J]c>(@ePdA64ce]&]
U&/EZVddRfLI-,6H-THfX)0XWd_R95g^\S?6E1OA_7@13W_0f=-f>[KEL(]W/QX?
9RHKe2fC>D=(Xb8&?BT#.eYA^+Df1fYa_D]D,JP-A&-6W&(AH=K2E;OJ=\77dRLb
_O1ZBa^,W-bVPE>4TJFcUE)62/&g[V+S6A@+0a=ZLYO>I2@Y]fHB#bC_FgUPY)VR
gACJ3OB/(]8b6=+YL=V&^Z\ZBB5L=R;1;T=a+83^/FI&E3FE;]K^cg912(PU3DaF
X3:E7b#=d7]1YJ\/1,))GG,.S3UOBI74;1MT-W0Ea<.A\I?-^5BJb^gTZ]IC8E<A
/7Fddg@_P:<A^PUO\\=ZQc;Y54A1-CLA_A:+27Wf=#X6VB8C_/a4@61A&YGHbOHd
KC\S&,#cR-6U0/eQe>gKY5P+(P/@5GEE&?+&]0B149KYE=W@J#-+Kcg=(L[H=]eg
,/L&bgfBO_-GKb9S165c\LRG;6&0RCId?\LfgO#S;RN0d81.EC^O;1Y1>2>>3;Q[
:=8C9b2/-IQ_J&?5^,12eb<</gf5;g)JZ-,7XbeJ<.--]RU6F+_K54+74]8U1?N:
)XI[Y+_U5Jb=f:cB<=O:XDg).K0d(8T6W4.Cc04-WGY3+XEe@#[g.;)cW9)Ff=;R
3d@]K3<B6g\dV+Q04ca<R65RTS-V=UV+>WI7ERQQI<(]g]<EbF_GQ[CLgg(6\6.d
\@[,T0XV4aM)\#5^M&_P)^Qf9,0U/[?MN<U=R97]8^fX-L7+^\ZUG)<.B5S#dBga
#\(eKbe2c]7f3CE):/>=#A>_65FOa#VXOU>NT26L_&/3PQDX[9G44d1(XEb9af/O
fM>G8bUQHgY.eE7A:-0T9T,C,/]Hbg[K5eNLHK<D43)N5Cc-DVdLf9SW?,(FUT;T
Z&a3D1O2S8HT\-5EgA-I\I9TH3dKNJA/U?AcN#CdGTf@)#EU&N/[;A)MZOcS8_O9
,#-LJV)^MIRbgA<dDD9YA/OcKN9_fV&5/&+WggVeYZ[\DVgP70D\6W<+1Ib<+_6A
UDEE0H(YFg&;FT/:&M8,P9OF;a0dEHg&<KSLNRP3LQ52,daLM>\<C2g(4E(:TW7T
,[A_CKN\PK+Ea#b?<Haf9cY9fCSA#(\WTcDU1VNB(R-KP:VP@L&[b/696U9UKf:Y
T9,DF8Rc#.==S&DfBF138\g]W4Y7;X,@4,G@=g</:CU;[GZNN2_FAfC8.C.A7/>,
C129^IX<04?R9+E;(EL^e)FCg8TPa?2P4eVDOA5Kd:Z1_3&YVgDTP6JA@(0GCIb5
aceSXS79C0N7g)cVEU0Q+.NJ[VRFA[+,3&Df40._;d_S+P,J-)+>&_[ER=He#aP^
,F7[B1#.L[<c5@;FaTP.QdBGI6=8I3J7B,6HBC6#>>./dSBg);6NU=X#g>Ka<K_.
-W5B^JY94.3,+5Y^=^0LgX+5+:GMBe78(8fg,HKLaWI>e6UPG(QB2U>^5AWJ@Z^g
<S:CJNS,./W;2>\/#](FP9JGGW2e7)/NIO(=Y#73:Ga:\,F6Ob^F7f7UY2E&4TEd
U7DMLg426:#0_gL/X:[H>;[QX_:T^Bc#QXS:HEG>cO&/^eRJ2Z;9\CU:dBdMg,SI
HS1;-f\g6(<3:@<]G;<b_2W98A+6G:Fg(?e(99_GQ(:3.aRK4O<J-W@QXR5G2)^-
+H@,ZeQee;NF/0]\B0=;+=c/J0<.dGEZ,:?Q-dN3X[/0]^-V(81]V<I7c(bVYVfS
GDa6K9?DNFUMd+P@Y];0e,aKW:2C/0F^I(\:)IP)&ZTP^K4Y1S+C=]39dEO9,I0d
PE#4FJ(Oe,>G=LJNR[)W?G+X]cG>LB\_D-P>=/2<9(;QA9BRS?0]E63X7dC1&SeC
=.X4_LUL@WA32E,<3]YeX_X\-AU4+QefV>#B@?,^2@OYWaB[fQT,GJ1]OD7E<ZA3
(][-YMLZK5R67DQ==-XU7\QT^QT=0W1eH)PQdHNBPV405D70@<)6@AJRaRH:ES@M
3\OM-g38P,?SH7TS_D8]5Y.abMGTKH<&JU2)X]LbY?PR^C#^<F_A8&B[ML&7Z7FQ
c4VXF:MHf+B_9[CCWd:QdS&^A<\?G.)B]2G@QS:ZS052cI[[5T8[FGR5N]-C37\6
?#(bKcT[B#:TQ5DG.JeHXZ(C2eR=caGa9A0K;Vd(dXL[O-^6[32CG,TbA,>fZGg+
Q^eWBMF;3.)eB,>11O8<MLgGO_)?fS(@_]Y.d1ICA#,3VPO(W)eY1f]ffFga+_N&
(fbQ7=\-BQ>L,d\KRW5EP_639;?3;GC9L6S^@G,fZW_=LbJSWO97@E6V5Z;Y:,bJ
;OKGS]NcK,<H/UY)P>?KW?=0ROX?9Dea(G?GJ,,@==fgUX<4._:&3W<M]f.Q&LYX
1_,\9(JXM#/B3J/@cAKf:7@+2W(79[egb]WRQ.KI/G1,P=GC3HXSQ,N))B\CMOQZ
CZcCJ])]Y>+AG2N\^>Q6;@FNNK^=<>_8)V6,=/4gB:aeS<(4+3MKR.7EIOb4T,+.
RIH;0Sfd+IQ):2BCa]B]1<R:;?7#b_[=SB+f)bQaH.@7A3VDR,e@(A<L>?KM6BR.
(F13eWL_():3XA]IUTgT.0O>A>7[B67)00_5,,X:8^&MBHAgOX?;L^Iac<H2MePL
f<8I/5TB)c.8U8/fQ^Da&F_:/a[0ATI:g[f5b(G^CWL=ETSAb=1+fVN.6]U2QX+A
f7MO9/]K@RQ#d+YXXR[:0T7OJ3;>f[1Q:87]^\;1WA8GA[PX.VME8>eFX]]1W[^7
QC3WRPGTE.]HQ_?(?._1,bRLAT[6IHBfgOS>#I)0,0LQ#^CFV@Q]6IFPH4/3L]V4
XR-.>&J(],(.)R:.CE6d#Pf=@8I+dg91H5[Y2.5\9(F;HQd9FHA+7H+2XNgUBb5W
LWJLd]YG>V,580b7?JX8A80VR_^#-1KcL@WQ=U?1L[GVPM:O?:/UcV2acaf9/8^6
4/T><9SGP58AVd/MB/XQ2(Zf#-O\0DUMIg>HT;d\^#R8>Z;2O_Q:dJJ)S8]W(\K:
O4,-^OGW+S\>XfQHe>W03b++7Q#T-b.1MO(8Q6XDb&[HDe<fV52[JA1KS/DL7X-7
eWSLL+ULP?XTIG/V_T)a#PY8)0\@?XEIGY6QX25CZOUA@#eHB/>Ie4_f,7N&2XP1
X\PR5JJQY7JNIfO6ENaEMgH>;IG_Rd3YgEGMQfe0b+^gdV4]Y52XB:E&6+/EWa[_
1V_5ZC?]#.HZ/Q;1J9:+b\GTR&b6;I=J<MP1P\g57_<42?1XE6_M>(ZXWRFL9a<9
66FI)fPP>5S_ff=O6C(gW]E))=>ga0P:@A?<[.)[K<\Y)58PEOFb[UIg.6W:X>4F
fE.SFbe^TG2Yf;B)=Qf@bR93O\\<,J3>N-OH5+V\I-a?e\^U5aE/ST0-g87-@5CP
G7K?L],#I7A4)NU25N2S^GHRKdNGVI^P;JI)d2ScZFN=DVUCdWX0XYZL<YCMc9EN
;(I?(@/P8ND.2(TZ6(.-g];Sc6W2AKI+JgQZ>+JK=XAX4X0f.E^^-EPU.Lc&6XOR
(dI&R/d4MgCYIQVD)@Y=ALLH:b]9&ZeD6gZ+Z_5Z4;@IADA;3de_Pag@\H3[6OID
??9__2FM@VRIU,IUAKBcM@]>)LF:^213IY:[B_c&U-OWQ=;=d=d[3P-4/c4\deX9
g[(<1[2D@?[[2D_I45)fG[7@]9gHTJgWHC/GAPE]K^+KQ9bG8=R5eYS3gS;M=2?L
\[S4L8XXA9;bZ^)b/3f)T_&J9?g)+aS1:NIL.N^5,9?I-.8EP,@@F:;+dNNR#A\@
/7;Q]M-H=V+ZSI43]GB9EW3RY#DSPGZ2>VU[>fOFRH<HSFR1N(]14]JZ1]-^YY0e
^&;K^EVgfe/<Z1A.ELNN16F6[,Q]EA5P^.&8M7KMZD:Yb<_-C]+\</3I>_=#L/PA
K5PJC8)AacWL#>IgfRa0DENCO[^0+Z:GB:8J65L.Q#N^NCQ0L5.?2=T8RAbN(N(M
a.K5<&SCZ\R6IH7KTTY(c&g,IR8d.f18@)=EFEO)E/WcVC5>WHfM26Z&PPK,gEEY
]3+McT,^#R7ATR^JM#.U4CJ,]6?d32FE0/T=DQ(@OBC:#RG\?Q>D&SgGKV?Jf#1Z
#8eQQ];eL<Y6XgAJQ8+\Q@9OL5NV9X1MP-GQ;=M=GF82#bWc7[H?AaII4E@\\/F/
E9-<c30gUd2:+?BY3-[#-gN-J/HFO2#M]ZbDNM3O.+-ea+?fKLb5OBFAa7_9MU,^
JT;747AbWI6L:+:.H)UB(Me>86=[YNc9CQ0<<7+;J[Zec-6M#6FF[+]<4cX@H7);
e;[0d038[Se^6X9gE@cEV:C7VIAGT9=0aUUF_GL@F@Q)4.8^ZaUTUb?S30QULFf0
R1L+,7<4O7bHPc5+d(IQ)+M&0:61R_(^U7_4VP3G.-W(1N6.N.4<dI#0XUbT3NHP
,c-9T&>G>?>G8cQQFf+CYLQX\E::MMGQ2g2QP1>76C0ZO,=R0Ec<6AX2B#2;Yf9d
cSQRGbJ6-/J<QgHI0TKae?I..R[/6TdTD#2LX#a]((,PcfZZCZ33dHc^X?9S<@IF
#8g:K)Ta?GT1Tb=+?7XLXU9dLT,e4X_B<5F0e:]cSGN;6#Mbgb:2[Be[cZ651CNB
5[eU>^eCgL]_e#8+PIB?V1BSd3SIB.G8O3eGS<c??8VJ(-LAfY2)?&T_JZJ@F_Y?
A2GPe,P,R&_8Y#&.-ad,Q-;=YNNd;L(5E2E2D(BHB2WBeN>BU/Z<UIIQ7(>K4NBK
1aJH\K#T.V.^W)3,I.@BbEeCLaC#02[65QF?f3W@7)B#5T\QU&()?IHYfJ@ANKIO
N\\9++Id=TG_CS#L.]Q_;;^]4XXgF)KfW4Q5.(W@0B\SHB(4+N/-05[Q@)==aYbY
eEKRW5HCV6NY_5G/gee<]G;[;X07LdG=,b:9#6(RQ6EQ_b#BVJT+P/EXMO^.??aM
WK;HeOeY3RA2I_2QNYJ9QTV.93\_ORB)-7IFgd2]NMU[)I[ZM5cb[86d^S7-J^&R
O#a]B4:60?IcH[(QPb/Y/HMVK[@_Q[d1eSPJ4JH5]\WV9NO_/K1#^@\;fO=aZRVJ
),_8F)ge1]^B&A50g\[?5,^#CP:&@6Xa/faa9Z3YbVBZE[a(MGeS:<@6#R&0X[YJ
&J4Ge_0W1FK5GBME]dZ;OM3fW271G59HUCHPZd@/b;<0\.7;&49Z&fc&VFHE/@>W
?ZR]9)JcF6?J\_6Td9FUVVF@I9Q?#d]6U0_YRYQ1.6A?THN]9)Qf\5G&H23>Vb_K
dZg;Mf4;16[.X@YMK(=UFTId)?O2FG.fJf]++_J###CS3BPTgGIIW_09@dR;US2E
<TO95c#;RQO[H=3P3-6C4_7LfP=9bKG&7MUL#OcFWP&84?QKS3=/;^H3649N0J<M
^R1[FGf>aM20_,]^,11e6(f=\8H8&#K1A=UZd5T=BA#RRB0@S:\aA=KRQ(XN;76\
?<PJB]1K>_bO_PED;7Z<>QU.7c#,\7.Zd[BGBd\4NfOFJ_>Q6+:OVgdP\@8HbOaG
JX/EY63EYWGE4[1Z03MNGZQfIb.Sb?a:T_V7+D[_fPW9bS;9YZZHfUdE6bS7,,DH
3d7EJ4R^3N1<#RQ77R(CY4<FHXQHV)R<F?9S1HY(>G@c0C0g@A&Z_H<\7MUQTTWQ
@8CC>WJR<fI1E/3\J^;>K:BHJHfM]cc,Z(B3gf^?<IOYJ_d:,caeP1fa/N0CcI1,
O=#[BB&GL/C=B?H,Ne6^AYc.3aAAI[F4NCS.U^?eT?S;]7E988Ic,)Id5VC6>^RT
P2g@<_=g]_2bAK^,?SLOVe:CGK/EQR?J6)8L)feK&.9-E2-FD_1O>N@2bCKBZe@J
-3-IGdGDF&e4GRb:S==)]D.N9Of2NRX^dME/)#/CX/51D.Z\:\BIKL]bP=?:GB>S
e:)TgT.GEM^,bL]^Xa29[-B2WG4UP1T-&cbB4P8&\IB320W8-5Dc_@F,3BQU][Pb
3^BSI,b,]O^\ZXB8<^BHNGJ]d+MZbHQ^IFgP>GQcU/OAM=7[Sg_@I>E\ID8ZOEI+
?:\g-#.<7(GFPW<N&C=46RfEFN,M-_FD][QMS51X)S0AG@M2RP<e461>,GXbH=9&
^2,N2;)N^8+:1L/IMGgYN6cZ,.CH2/UO[=EN[8]&;>X7@TLB6Kf(/ad1.bTV-9/f
E8FUFfe\fU<QMCX9)^,C7P?&bVS]EYXP@_<5c)1?MLed7#Xg0\AaZRFe3;ALO.YW
fc/I7U_P^e8TVW;V>5YLe&6f&Q/:4)T;Uea,RJbe94a:^@0G+;W;W8PI1_QQIfKf
f@&^YB3.eK_d::d&)/PNZ<?(f6^b@[]&YTe^CSgM\FZ=8?JRZZ/9O.A-;aU2e\Y1
+035#(dAIHF3IRXXQFI;VF00cbE@[G@d5+V3,NIX.WA>2ZGc=(27G:-(7(J/B>c/
Z\fdO<-(BB3g^E]d2QL[[ZbX[I\(F<_3AMfPBEOg+RH;e\&7NdOJXe[(D,/fUQH\
&9);ZNNGS>Q_9AP+]cMP&5M@\Q;/e^cIQ,HX=aeAHeJW6L>D5D@Q+>aH:>VH)\56
]+Ac/_]97g:L(S@84YeC\ZJJ5\XL\I.\0SB[b?)M\?H8J3&fYcE<#B/eNRETSFM0
Fb=)YA<IH9]B,3?M?eLUX+(.P(PST@S)XU^UYQ#dd5U6f;-2E/2)[.>=+,_eY&E;
H:K_E8Zb#T=bWd2ZGUF;;Cf=5X2&b&FSI[8Y)JfE[0#D,;AY.64ZOU^N+^=P19QN
-fOS@:d4L?E#=>=P@^#TS2(O+L+\U:dWM?b8CeV9XE2bS/>?3dVT);)Y[)daT.UA
RI6=9b54U2?S7K(fgeDL.7:V<ffF9+)@AP?3U3AMeO5PJG2YV>(E@K\=:&BA(4Q1
EO+,W31Ve#]6gga5J]TFOTEE#0L94UR4bQYXUaDE3,6O9W0.JV6N7H/Z\@]=8)R3
,&08FC1\bX/(YeF\f/Q[TWKAVIKRUC\I/,A5Pf>EddNU-SM3UPFJf:)O[YYTP1B;
@G2ZXICU]>GKJI,-[(QF-]Y@fd;d=f_<ADgC^8YRYgI8_LUYCgV<](;9b<e^2aCX
cX8XI9B+^P5KU@R1AR5d_[g\cZY56ROP5]UI(YMP;XL0C=f+Q0.3(IBc,4I@XYY4
,4.WZNa[6I5I<SB^H@c[RO]:6fMT><A3T8f??.+d?2UDV2?&UD<K(F>+]X@C@/gO
74;H&_ga9>9+d2eXPaH-_XQ>K,4VN^;c^0dW]:SS8KXVH2^K:<GP90CU.gQ\cg\@
JAH,:83\[:C=12N7PJ2N>D=G8-YVaGPP^e/&-.GG:?K:/941KCg/:#F#G;d0(WJJ
TF^e_\=?FY\eCBUDD,=C4#8Va98TYCRbPMIS&Q7[JH4\TAL1>Q:\(ZcPS+e)=:>0
<D\V>^T0)C<9<;@@cSe\[&TI\,f2?E24,/.AOXZcC@:Dbd+KXEWH5M?AfbSSZ_&M
E<60Gg]Q,^/SC.Ye3^2GV;VP@R>SPcg8Y3Yd7>^eXOVE;VP7c#L6@SH-3):EADfT
9?>BPQN]91M5A/g[4#Yd.8XNY:-YAYc[0:S]d\B8FBBR\_Y21M2>UREG)W0<?_R[
6aQ]7M/7,YY]3XdKYOZ>#M1f3;2V#UN3HHN^46@Z&N@+#2A[CYL]&R2g;S/f19b_
@B[/2@Pg]T9M5ZOebJPEPg?>&eIOKc_g:92dHVe?+-4GF-(+=_gDSOJ2UcBB7gDg
O#XC:S74_VBaKA3aBKI;#TGD?;[7-CA<Gf.DgF>8D2J+LBaO.K3#>d7>@C>]d+CJ
>g8I1#FeRS_U<)>1eT5Y]a:c@M-A-5+F5+HA<6IL6RGfO8U)Y?#S7@eJ^Q,,cbM\
R5:gUdE;cN:8e>@(fHM7cY<MJ&L#/@>9[4KebIdcU3]d7TSBB_KTRGH38gf=7@>(
Q/-0@B#4N6eHKVb0(U,A?]W^3FQX7MNI72V:gDXS]V4NKWeBOX?@\Xc]OJ1:MO?R
/BXW6aNIcC9LGG.NMUH2-=1cJI<#[#,[_AH#a6/AFPV4L6.&F=G4&_TSPD#X@]DR
CNeTA@.[4F]O>BH/<N6:_;MaY5VV;aHIZTbAC9G]?3:L>D4c9=Va(5g_9UI&fa#2
4RCPNLIfbM\6?R#]J6&cBaM6.1dg5M>f_X0@/=E&8LXOEeFK=-1f1fSc8DEI-/Z]
[=E9:U^M6@>+ca;_V>S,cDEg_B?<&NM@6N?MA^N,<eD6/#22TFVQg4Q0R=M3S-Qa
a.YAW,\RF=9eZO_]]?4^^O1&JLC8cXO?]c1;YP3P+2I)>O2V=-&DE1Vb\NB69@KH
<//KPS<eDH2]BbV6,(Z__1WI72VfRG:31PeI:A)T\OQBd]V)\/aV&WG=_@L]S5_E
F;@SD5(9EbX]8V=5-CLGA7@MG0V4S6A^a>V07=QbKW9(HK\0d3Mc?^Q[C[.7<4MD
>T+=4VU]Q.S79#.KL:V[bE9(Za=N:Y<[NV?adFH;((ZG537(QE>dTL+X[aJTKUSC
.+URRJgdc_bXS3D=b/PR9&(Z;a&LU9A);Zc&LgT<0LZ=C+@2.>C?SYNSU+5Q5/:.
UW^[e<X7cEM56+70.b(LX\@9EC=XfFfH1AAE2.f<fNb6N/?60?T-\T^;?]4cK,:7
SUF)MDISJe6:@@7AQ=(:PgKET],=BfT>78Vb?ENe?X[F])X3455<ONe2;ZVCcQR-
DHIT_Y0X)cA>-/-H^76YQWTHR[G55=ABSSO^^e(Ycc28TTMH^<,(BRO@CZ\HMZWN
_-Qg00D()I-b=^TD]G^WG2N+WKS]A\;ZT4#5?HUMTWZXd7,PT^LF[N#=D<7)c?cU
AP8(GHD=V1T6H_GOQ=S2G3ROVc5>+F80)=6aYQO2,2O-\(?921:S2b4=UA#)d#-_
]Q6;0<;5Xf81^3,);3AF,8fV#D+[&],+2POEcAe&6D#B,0&b3)Af3Ug9#,QTB1LT
c7#DG+FGI79-eX\Q-aFZ,73>f9>12W?4c\:Y]fP:BHZ<)E3>VNN>HUF-f@3;/TCQ
1^cH>KbdK4U>DJ78.KLY_9&ga)=;98EMB+]+E:2-#.:C;Q\YEHeM@T_f=H?@ZQf<
Q\B.>g+H?56Q+)3G872V5ZHJE;^OW/DWM\Y2#W>=7dI-KB_2C,eQ,/TS7^Lf_&f<
.ZW=Cc_PALXF\\JHI9-,=^f,QHFAMd@]8OXgb7=NRFPI0-TH9ZDW.LKIHA6a.F1O
cN7<,>QZ_(O@@S-O,bSNcQ/Z+3P^)O6<W^g)^A7M7,b?P#YZO/]7Q]0Q?3SLBFS3
KRSA?P<efQ89)CgR&X=3<MX94cW]3?OU4c\GH\Z<BFFae7M++;8MHAeG&<.:6&K[
a;G/V60U7b9,aL#)K=CXd/\dDMZ;9=&5G_-bVUW8?#H_M+N<,f#)>5C)aH-](_G=
bL_Xb1BW;0+dDAHS.UG03^8BX1+(U)MFRY#5TC,C.;,2@+eD(c;fD/cM?Wa(=EK:
5_bD(bO6SO/]Y=NAe^f;;gXGXNP2-50:R+9#8&(YAQ-?#[<H)^+_4WN.=5(LI_2Z
XH@]2bJ6B__dScF)P(/P1KZTC^9NO/(PR-YO+&@_4=#8d;NZXNZ127bU7WD&,)2(
3.7<<B@cRM^A,\OR\2,3ODU&P)SF]fG)V7R6EbCG32-2S+-<IZ=[de+QHMCaF2W_
C=M?HNbbU1Ob;KX&6XK+88HZ&]<6URIT=,dHU+d.+bb_O72TF5/_-:F4TPKBf2CA
eC5H-T=6I@gaDI-Cb\&6XM38V\.UWQ81e^ZYH/L_@Z-,S4JQH8&>CP85(T5\U+HR
_:AL99[9(ZB;\2QM@AGP3+_AMf[RbK1#NAJ#BIg)O>@)?TGQ_S^44<^415cX()(8
R_A1;Tg#N+:AK^>?>c]N@3724eX=)1A+XKJ3dWTDS@CV<XF-a_OA[g8L];gB/[)E
8d>c(Q)?/NRW/YK\YLT6fK>@f#8e;CXRBgEW_T#R3:8J+F4Y^01I=HAXc</;]95R
5(G4d4#ISB^XNK_H^[Eg&a(6V4f4(SMR+TV>GgM/g8202H#B4DM=#T+aRM&\N)Wd
aBSJQRRSF\:SX:4<_1IAH)0<E6_B:RM?/5RU4bDN@FG^ME#AdS,)g)Q#60,0)@DN
#78\UBQ)B#:)UC,aN#6PX6B@^gf1-2BGJDeD./UCM4Aea0>;S/+]2\NT_P=VOUPA
5C;KN5WFJ)D+\aHPD+5O-3N^/=WK=a&4dQ)-1(\SC);-e_7YI,BaWe=;/D7VNR)\
OOVTET@R7JI,e?+PI\=C\HB[VMKLQXYU-K,,:W+Cd6.ZVCM&GD9&@<VP:>bc:?HS
/eP>TZZ.&Jd?N:APR_]Q6Rd9K;B5FK;)67,T=BH&BOS\.C@0QNE4B4>)UIH3N&+[
^3QdA8Z<5IBYX##ggMNIG5D?H?9OU7UINPE.=Q9>MX?c(8GAI<KEH[9c=;LP?_:B
/@XBR?E/C(JP0E)XD5IcI.Z[8XcVG<5X=ST\5T;>8G&SDIO1)7a0QO,dJZKb5G(]
3ebO)BR5bW,Y)OZHaYQ1<dB]5>g/U_BO7I9#9-f2+LB^#+NVV-W?&Gg8?d[/:Z-)
7[2b?Fd>@gC1&094e7N^3_TVe]R9e:ZT=g385L3;.)[Dc=0//eQ)=\B&7/P_G];G
^^c,I,<Z(#@<A2LdTZ,P[/QOPM&+a1SA5[:dW@eZPQd<[IU;&6Ec(P[<O7C]^?2-
gS:P-[JGE_V6/YI]f7:YJBU=Y+fP5;JVQ3.c:H4&3,=<Y362D,GAR2^@GJff_L0V
X)0H_eF[?\b?]gUC95;T0,<==.A?P:;]9?@Z>GXVDOSQ-GLea_ANd9:@&QG3?d-S
S^G3cdW+=1BR)321BGZ<#GS7E^^?;XfFJeNMTP@&A#9L,;bDHfXHV=K@VAIG1M7b
N]O@b(^<QIE8TF,>/<_>bDEYO5?ReS<?Sg>d=?H@^cZ)eEYZOHQ<6[4-dZ/#0164
7GKV-QZ.-@OZPNC:fgeSW/S2H8AAcZ:P+?3ZJ]7RYfXA@4R575aFGV>3B=\08C7O
PU_)Jb)=0:/HII2BR:;1R-c=g>^[g;)\0)8J(N7@C1JBg3ZD@)4UFd.IJ22B:(EW
faB#;3IYeUW,O8LMPM.L&IF>,,>>SIEUZ(WMTHOF0>29^0_.:2:?#Q1e=Fd86ASZ
/+DY6([#C>]_bBX?]/9VCOWBUY.3/+g9bd@J[D=S:MFbPX-:]DHC_W;KcR+b&eY#
Q)0g2\^C&.5JJ,f:\L&D#@^\DeSaLK:a_;/76BG7^Y?V-Rb^a+17#cZQ4<@8FLC\
4_Q/D(;eJPC1b2HfGL90Y6=)5]d-GBf=Dbb5+Q:E8a02-g4[8b6[RKLK>(QOEWQ^
XY/?;PFb^?@<79:HCX#,3_a(((Xaf@\6^1fJ7W?1HGI.>M)eNP4M@fIU69\VZ,&S
.;STH?^LD@/[4=GQb]-Rd4RB8)B:3M88BBcKX9BX;OHaD-IWBV.[B?X:)cC3XJ_W
fK6XUXQ4R=^Z\V\/^d.YR\;1d]c)HU0(A_g@dKI)+U#ON:#K?S/R^)E5Ib4b;REZ
[V_[6Q[R_V^_5A4QJZ-ZOAddS:1La3JEARSFE<T9F)HO8a61:YR+\M>8E,T#<5f?
R:Q(NWD?:=7/E:bcI8PUW8Q_A1[FH?+aHAf_;.)63,ALE?LS14@^LGXJDI+?>Fc_
a6cAHN0CHAT<F/f3DAfCO;@eIg@[6.TUQ3?,\T&aI:Vd1BGb+^1JTU9-E<b]Tg3X
ZHPYaT[?-X:N]_07^O650JBdeI?_^U#WQfG=+Y#RJOeFc[8g)KR<&15H@22CH(RK
0Aa&YX/JD-G4PB?fZZ33eE&((f4GV+d7#1E@B>4MQ)+OJE(6.LU6@\,73gVcX9)7
8EEV_4/>AfU?NID-DB0H/@F0VBd(E(SFQ:a-aaaJN/C#Q4;bO]cNEGI,@81[ZBZ?
?JC_XgC-BUQY##.1cJV<7g\<J3KfTU(A9DUd6,KP3F+HU7XR2Of36[)L]2L[bB+\
d@I/)4M)-:@;=[\EZ_[1QbS0<]W@Z,LBNJ@97,SP(EQ9=^-AW<.2I-O(T]Nf-AD\
VZ:P-,d4WR9ZZdXB>E\>=T^B]:RBIB,6LATOV(g.e>8.2&=]cR6I+09_S67:7K=b
EbC@e&aR;ZXb17XCbT&W,#2J<3PQ?_TJU+&e0H#6-,N+GUf;#YVOLR^9?0;0[f4c
VD1(E/g:+R9DYT>=8,EUacUAe>QR=DU^2f:[/_4b)B>-32=K>;@H_aG(4P53E#<:
H-__+(J7?>:daT;@1@A(-,QY_.cTb#G;SH/bT5L-26Rf4]a_/M;#^X0T)9(V22N\
8_#Xd)g>/>+,/GB3/9=C[aJ+UWJ=c1BQSU5]H5:Ua]GeD?FGOS88#+04GX+O5=39
RI<1g0D-ZJ#4(dAKXdA_/,0EH+UBdL^bP?=4Y_<N1-D>C7P0?5>;VZQR8db2Z6eO
\KeLO?75LZVRZK6[X&Z46JU9F:?N/Y=BMC+ZW(0OeWY_RZ:GdL7-bA]M=e,CB7?C
=fHg9)B96=e8)3&K&]@)O&DK39D[^2N[SP:A#&CR^7ddH=HYc)\A^T?O61M<J;&4
)3]]^H^(J#:6\JT-9?dbN)VMO<B,&\GWAYNJb.]>IJ2S(B?T4K(dJ>;I@.;2I-K=
>fFd,O:,-+c3KJOPNC\LDE9S:5G3GYMZ545F)2N+KXJI>UVTWCb?^PegLONB?I]]
GSaB8T7C9XH]B?1,e,VNYe8DWR3,&VL^Qa2^4[BF9QRL.KW_EOF9@7V4GIa-D0@a
.6VPK4bB3/\J[<?&A_c76U0_Pae<R<cZe_O;WN;/N+JI1aF1&CTWYO@YY1BI5F90
1,&>8a7-JfW#F15dCB^^Y@\5<S&QS6R2C?JXZDf-PSED^2;4c^<2<Xe3SJ]3)O;D
?BJ=d=-+;RL2M>:7CUNF(2D.^TL8)(dO<X2.U&2d&e,8JX1_DaEg>,&a6W,aIYDe
Z074&<b+T(/<cf.MZ^MdC9CZLG=[CU6B0:1e]g55.-9F,VXRM>LgX1>T1KBZO.+N
+>cE&Xd6e?GE>FgIXP0bM8gMYNSB<Sb<L:g(^8U57E\W?81b6U<HJ)D1E^(RK++I
IB3O<(6PJDdgM24,;<LYVgB?.cTVLbL3EMJKFb:O.4S31.A_a\Q>Wf1-[32>cSG/
-;Yf.\)-b=A3LfP\4gV_a?<[QPN9I@a]/AdL8UK6AI7G>:_W/DA?EC.X:4eH]X,&
\_f@/EIeFRI0M6/TZ]:-WQ.U<JP<])J@6OC()fX&&cH#.<@3.=_[KC,g);:BW@dG
@-V@=>aJ+Qd5LR)E_9RA2Qg0e,?bdf^<;&FCGETTA(IMe:5d52YK#FQ:L)@VBb\I
@ZSI1RZH3)NdCSRFF\JK4-6b)8H;=41ec,BU@1Cg/#\7[92P;53?_J(8/8752?Sd
gP>bCO.R9J\+JOIV(g3KZTQ+Z,^eQW6Z13@ed,b2/[7ZYGUD49WY/,XJYfB3RD&P
VTNC481aW>f34PfSVJ5>]7J<dS)EH,?TE\_[3-f;PI+])8S\DM1?Gc#X[T=N=NZg
12ZBTdQ/VO?E4bS;-1S/^FW7T2,9aB;4QU&be69#L[]aQ<96age3-V31.V235/3O
.PCd8d=B;K>B/:AEaa)&1EA=EXef>9g1Ig4R>)+57FI6)cV>]2Xe6_Qe\Q[P10,,
CAZ468@9X+5]cJ4.;CIJdA&]7@1c].SE^3a((G6+cVOH0=)bcB772JZPWH\B^Z._
VVR\2BBLd2f3UbMV[fDXL]SHUPJFU@^Rf&FHDUR;MNDMZ:[HL(.W;8O4G[G5R]OX
UQ)_>N>JfR-\,T7cZf2K?]PUeD)?N7;1-+_0?EXI#.@VGbPAT.ZNNV4.&G&/K0?:
;:&B0c,ZeOZ,?0M_]DA;b?JK_EACDQTQ+S<MCO><\4GP/?E2=eL?;F:Tf(X:gDZ#
^D5W(A\^))>g/b,U5_+(>6)@IGQOA+)&H<KWL=UL1\,D9IM:2ORP^?^X8TBcK,d:
g7)UY)_4BY?GK^M@VX67R_^75=W=V@O?d?#;;=4^JQ0b08I75.bd7@\+6WgM@^H(
JbB>1:[6+KO/42d1#:Q-:EH-G3N00F:UX_X7Q.\6QU)A=>AV:10AS7+;@K=L#U=\
gZS-N5NE&+>Pd\O38>U5(>Y8AcQ)VV+6EF]5(C1f;7bFN?3eXDW7+?FX9CXOb38g
b5&LQYIDa8c)>cXf(VJ9bOT?7Dg@-@V43GVWg;J,3f^#OS:=\\3TcZ8O7^,),D5+
>D_d=^6bHY.F14&Y3APW]=F0&CRP=:D;cMfH,a@B>_+#0&LRP)U\UAMV8,GafDXP
9a.31]4^_Ab^BRU_:(Y4]ND61cGX>=?5dE(Z4&+BRJVP([<2,7N6ID;GGOedc&c3
a0PK#0L/[E@E7(=c2ZdE[IFWC/6/Q+8aNDM@+0[GZ<b1AM/<dM.0D[HQUc<DCEC)
(8<^e>[<Y=OI=J]VQK@HU7\d2g>F_V@(@D9)]aA:cC5W(=abU_0?c1A5AKOF4_8G
LfT)8Bc),_HBJUV<QKAU8S^J9/b&4LC@INZb\TCF]L6B9g;:QWbf;WZU5Ng&N+HQ
C0YRJ@44J:TPg425]DI,G>)B?b-FAf;,PAgdF3,^IAd2;M1FM5CV#X)?]T6dVW)]
LVdS^HPFA&^Ua&)=SL,LWK.O>:6JV_9,=Jb:]6]MGO]8N;9KG[NEQA)A:c<.PX79
d\8C,P0-@RYFaK4\#N+6[:>]>fG.GTH(=INI[c(?gc79<BROAIK4;EJJYES-<_3R
:g&f?DP&0g?B8RB#Pe;GaV[+Y8J5+P\5M&.NNN=Yg:)AHSZ=;5:3F3GXYBc@HceU
(=QA6e,gK2B(OXYT\bS)4;=M\XGU=;T&P-GJ:K<&^D11g7aCF2bO9)ZAd2X=A\cL
X@-)<HIKFA]?DPA:Zd@F8>7_7UCKC&K-^P6_;_R->YJ-\+5WUGPQ1?LP]gTE55cU
D?;-,UJ^-^LVd@K>5D(2#f#?WBfO3@@J\1)4BV+dFEKeOX4NfGBYK4:R=IQbFHB.
e\3.[7-<X?E<5.G+(@A[MX]G?Z+FLb,TK2.)>/#RYg;NAR(\_,@J030d^4S4\+c1
a<(B<F_A&45EV8BO3WUMcGB>c0d7&VD(KD9d7Eg@.FZEYXfDW\Y)UN0<>;X248D\
ARF&12.,C@\cYYAW-f:@WZI7)D>e63c^V+D.HS#+gcN@-CM=HU1+YcCOQQMUMJF&
G;=EZOK+8LB2bLS8^gALA+\>,+/\Y5PcCR_PJ++4&;AN&.[U1UH?0\0VZ_3Lb5Ea
W,O0M)C6@3N\eA4,eHc)1>)N]P<>:\IfCNE81MNC4LAHV5-6@&>Z13_[<7\_F/#&
?>5MQU2EMRMV:+O+)+52dQ_?8@A-ZM+:B;SQ-_G3PH&>),@TPcSZfX@7H\?eSBg-
.L(KN[=M9K;5A7HeeVRAD/UC62ZC^V04..dVB;QL3Z^[f5=0<-7=,g6W9gGcW[Y(
=FG)b)aODCdZ;?-aA99]OJQXeNH#IRW]&Hd1+ZX,TENLO6.)&A(RF;M<CMSHeHR(
3-dc>=@F/S4)KYGH=..&SPA@7M#2W]F2RQ9[48G?;K:YK6cIgXO)D,0gQ;<@b0#>
O1-DH6faA,XUX+<d5.]:PcI<N.Ac2MGFM7++>9fb&4->AZ+I#dGfK&1>#f,cQc.6
TRCB@^+(Hgf-Mf)dN:3>;T;7A9KBfB;]L=8>>GHbY:M^,gOH8XZ)M#.Pd6.D3>c2
YCL\R.8GW]-Sc^1b^Q1-cgG>LNZ(>IF2#G&1-)Z--g\?;)8VMOaZSd=UF7,P(BVE
dZ1\eTe(O=5OLW^6W48VbU]-T<,P\PaTQRPc)f1Lg><\9P=0:DLG_c/g\<d_),D(
(4UcG:.&9:fMY,G:&?,V5+D?)EVM#bT778?P8-2C>C,Bc@aW&8_-@4SH2F-_@Uf?
?\.bM)-IITDV>8edX(#](:AZf59]?EL.=N:<3fa[.TCDgK+G^6KQ-X+AXd#,TEge
9QKaLQ1dXaHBW06ff7(5<7C-=8^=\Z0b]VAWUb-V(JZR[BW0:=THQ2f>([V4Nb?Z
;&IVNHZ.@QCJM&Nf3PUV,J)7=2c\D_^NA?+=?@EeL/Pga1b54MFc31/QgH48-K\]
4ZdUXMUC\TcUKH[A&6GGd2J0,FXKKTS]aMNRe1b.9bMOdaQ)bCUJJQae[BU)fSKQ
,?M^DU)L:fAc+@&eT0BB<7G>2U[0P]gQR(]@A1\AYOD-1).1TQ+cH:d7E4aVPI05
(()0_dB)L^-049GTSf3:2E^]2#=N_@ODW+ceVTQ6PFE?O0FB&9X]?M=B=bI/M&4)
G=]Y;d9gf)?3YP]TU_PTIO(V(6>+bHH18V5c8<LD;fJL_^J\B.770@ZVRWd.^\O&
IBdXQGY0SD@A_]</O,KR=UC5/D(/N4;KPQ4]eef>):O5eeGaBL],VS092N>?/bc2
^7/PB4)Aa_J/ZM^JF4F+S5=\P?@47D52L_30XP/R<?]^2-6[eNUG#@&4;PM]g.@c
.[WQg\J8:NOb@\^#TQEeWZ&XH9._#c\W#W9MP:H[@;_K<J26^a[[V^L:/c_dcDfR
R0\/9CaVX97bHbTWVfIT,WE-g:V+[c-+OBELgSWMRf4?O0D4YaQ04W_BbKEQ[DJA
G8Y&ESVd1Z]0HA:3I)^D8A,_U&_S6/DX+J?@XHcJeBT3(8&BbD/CW)(\_9SC45(^
bRYf+0Q1-J(\GY//+&0bc[F-E=5>^[HFdB[JSe?_Ueac2H5?B^ffdIJY@3(eYEE<
BRceaZ<J1S2])J2,DMFL.>V6L-):EXEXNQ=90;H<+VDT;:I>@/XO\B_4L4Rb9Xb\
2B]RgA?.Dc&:L4R_JGFd+U?4HM^G^?2NdcBL]a-VegO1[P>G+&G/?M#a1]8W(NeR
]=--@F<9SE7(CZRFAHeC2^A6&fL,d\&^fS8Q;5:Mb-HLDCd,WQ&3Na?X)9eEO64D
HZ2K\@;:RfSd673dZ9RgJRgcedY@c](.cb0\&E2HCH4I7ca:,K_DAP.=(;dB+V74
<Z<Q>)(g316?HS61H;FVecT;;\gA1;B,O+O.3G.Y7\DYg-JcgJZ\9BG<3.<L@8_4
0[P=E0)4b2@S^D]f_W5\AB&IJ/WFA4ZH;.)Z+Lb]H31U9Q#,Vb-Z)(PNd&QIC;?;
]AGN1;\W0daA/N^1b0MS)bf3I952QT]@.^DK<;@<>)\gT02HJM)K@12@Oc6\3OIY
0_(5.OI[:f.ANS0/)?A4cebLR>5;[-dXcQL=e3;,<&XY;7Sa#8a(9\&+[&VR.)8Q
#,fWFD8+_AZTC=@DcK/V:NQHUaa--DZaR@RU#Jd3H]CQ@1#gfVWC-Z1[)-(FReU]
CU(-Y1K12fEYT/5a+\gKafg0cSG)IATKW9Qd^V3f2J()B.GZ)fF(BY[+TfCG3&J6
0+#K=2a)4Wf150Z>\7\TN.>gSeR9M?7B-#&IS/B8X->5+0bM3)+G+<3LP5(aWXSO
+86#D3\e7.&R_?X<[]\&?<E+I7_YA>a8E,]dfJ9.E2cQWc+g_/._UfM?P0#SPMY^
C;eRWP;Da9V)922X:>YH/X.Af^8T1NQeU8BQbF,9XFgaV0#9)(ZBLE+\]W=V0R;d
]T^RA:aJEQH0Me>>&LBONFUe0\\7G[g.\+e=OI]A[/BQY<eU@,^XD,Q5CMJU)@N7
TH@A^)6_Y44AES+CGg#M1DD1B/V+bW,ga)LD6\9(WNTc4Idb0dIOd?@aUJ]\10V_
(d=1V-g.&F[K?W\?cHSU66YdgGCH?O\SH<f2QB45c(FWbG;@\a&5HPIBJ&9b.=2c
(NQZ(K-Gd91EH0=,,<Y4EbMH/D=M4)EfCdGg8EJOD@c--.G<XQ2IHAcNb5e.+O>T
0WV;W&.ZSA,RfB7?<gE10I8b0gK[S1_5\(3X#5^24Fae.J)Bed4L)RTf4cX/@8[/
J>;UJ/:OdTbQP9(XJ>&AZ@FIK6&,(^0KNdgZJAF@82H355YEcD_O>;<QV/bRE)g0
T_?9c.9]W&dV(c\_MR.)</bV)[^O<[,<4WfL@-]a:c+FU3^FUL&YX@2]^aX2[I#-
=/3\#UJ-P(64C7\;\I,AEO59X][&KGYg]9KOf;994-7G,@0O)XHc2ffc1gYR,W[=
/d(]-7A94,O/I#VfN2&&?/X0^JX@d@K3/53PHK+2W2TEd8^[+:\WM\&_Y?#VYWB5
X2FKDT2K--2e.9P>@[LSH+)USBKXA4=6N#2X73bJOV@eXFTG<f72><^7&a;@D=X?
fTg[&ZB@Q?gcY_&[9XS::^WT1Z7QcU67@03?D_<]NCW6KZf,FSO7BX=\WSYNPD7d
S0,J7O<b0\YH?b&/#.K=]70f69?1DG((dV(4gg^UHP32]d28RX,JcGN;^Z;:dF\S
PgOK#cRB#]#0#NWHY:fGa..O6UK7N.7#^I(IBDICdW>1_M5/48\>AU>[)P(ZXVgg
1D2Qdbb7-IC<8dH<<#ZBTBGMC,&,=K@Nd>/?b8KDa4Y8bJKG1/WgLe0LLHf8+_@A
T6aPIF8R._?AG#e16g1-1;LCHb?0WUG^4JJ_>^PCaa]+WD&ZCO;Z3eJGT+9SHg&O
SeV]QaG<@H/9IfYDf1ZQ4I25ULA]8KCg-,N3BX<)AAFA7;KfPa^YL=:9+ES10.&4
bC9[b8aRX\#ZH;C+(I)QWF\8R2#Z;<:K_G(>N.[PD3:JMb[)cMb[9HU#If76g.63
eCPP:-G^0gG4L^]=^C3]1aVJXQFfXM<<8S+Fe8dPe>KQI(XCBYe,;fMEa:<ZC\JA
(@aN5;W<gH1:7YA0[B5#?Ke2^<O5?LFU.UP;LbU0Y48L#dGa.7^=Q@8I,QSb9_7T
G03>#M1Tg15L1:e2OJZe]-<Dg^0A)Sg3c2:OJZE0;&&gCMP5-#Z=XZ>&]1@-;e_P
UO38aN,/WO.J\5Z>^JAO[:45NEL43OA1D,XGQ8]L=b2O757#g-cdL+/:/EcL9\]\
(XSX6JA9[5U-52g2d:XaeL)=^B<P&#C0DC^9[ISe+JU22&N.4?P0AOJ)8;LJP-Y^
5XHQ:1)^>>?#UXCYEQ;eVL#3RM\<1O<2eVd(I[g8ea-F0R@7f7Z(Y.-?0a\HT:g>
;6=aLLPg4FH-N<U_#c/]<=)C+/gAc)DQ,21QX@IB1BC?[Zb);fGY^,7)481,L7.Q
@R+\a_^MS:dX#04\c3<C.MW2cH<Q1DF=.F-M8M+Tg+9LNPO7IEIG.VP]\?.Df=PW
Ee)JcVXKg@;87_B78g&3:<3WR26g>WPO^\5DU+R+WA42-F4Z(S6,Y,^2R/N9\a^R
-dC32.57\gZH7ZSVP>E_bc5=\,TBZLTbNWFO2<?^?@M92O#;#7S-KFZV07SX.>=V
/,f7N#GH(R+cTg0X2](W/@9c)_2?dWg6@aUASHPOR6^NB&.fH7/WaG6F+e/]#//C
GJ/EP1LaRG[T+0+1T#-7V9Y]Z-ZZJW^L;[6K#9Y&O)=-V[]D_d/XWSM/D&RLZ0.E
&b=X_TF:>Q05bR/37Wg=GcAQ#DDNQ,0ZUEPTJXbMVF>(ME_9JaNYYS1):<=]9O#/
8N,=9aL9cN;+R4CQ<Y/bG-/ZH2GKBE]M:>GBTZP\TL^8VaOgO57;c03&H\DMRHRg
QF.64aD]D3-MB_YYd/Cf1QW1T)MTMC=TFC-N3WI0]Y&fLb;U;Y4<DHZ>11FW@_R6
A<#@d>#Q]WY(d2W84JE?8\A>R<7U/L?0IQC>^?>M/_<HP&GOYfKEG3\[>ZgEG5LM
^Q;^8G9S4^\A9LH(J3Ab^E6E7L8YHQf0dO\T05[aC&OH>+QH1_TF;/)0[EG\d3T?
MA+&QA](^Qe.Zb9864ZYYN2M8+(=M>@7^,HH@[HUG?RHeNGMX+U(.K3BV?,^](8#
_JF?3_18aZ@3Aa+\dA_V5^&[.D:cE0O>@/X191>S:#fI6+eY4>daf_dKTUKVF1V]
aM#]C>eSF(NP8CN[4dF:_bU[b1O>4I4U7DJLI&a;K9G_B)5f1=Kb0OWgEY3JB<8I
T[e8T3;=/2B@GPBRN^DLAL8:B&K=R^X>\Y>B]c/6c/-2HfKW71#85-)\D9FYG&?U
@;8PS652Y017&Z92R,+4baE\^GdBQ10>)6eO0QE@081/TNbB7LNcQ_9XI(9aVAc9
)+>A]T4G\Cc01/8>#EeP9Y]S?:]^=TAa3F72QL#Z(A[<@QgLC?<DC[I7eHFBf^d#
XC@2X5H8M;QPT9_M5.\B>2d=;d-8SH,]F=4a);Q](\\X#KJX4B0CID)(0-#KG7EI
dBE+8Y+g?ZTSFe#fVf=TTA55:GDHeg;^RE.55PRL1S-6Fg-FCGRPIXP6:<VGA;)E
Q9SC4P;(3J,1G2>gLXP2aZZK:HC0d-2K)R>T(E#3=Q?VKC,bC>PNE<5E_)6M(TgE
=J8\Jcbb6_>0gSU@ea^SJY1DNQ&Ea<f<UOIZb;/;W=4G5D.6Z)&X_Y\..M&0\1;a
I,HU)_24FdLUJcV]15G0#2;b&LC#fA6:dd87OX&W@E94L&YJYJJ\I2TaG(f>G;9;
/OWYRD9@LE.+?AUNHZ;J5/P2(J9/C85Y&Y>Qa5AYME,&Rd)E<;OHX+G[c(>dO.4H
+@FZ^\GK@[5#MUA0c^UXcG&3QR(d3M]V2^Pf^AZ^THF()BK4O6Y_3E#=JO@C1?L=
]2+=+W##1P&T[]TQQ&847_0J?c.BFXb;.Ff(;.X)ga4MYUKAW+/QC0&##c5C?\Gb
DeSQA+Y<PX9XF#T8b7;P,.AF=CT/YFbCT9bHQ;0(g]>U-TOe7#e@Q&^WY.S7],ZW
NJ3[S_=OA(>MT]IKO?MEbZ14&N_fVf49HbE3\E[BcBcR5G(M>-+GP=7HXT04\Q2@
(R31ZO87UD#-IQ&X@Tg\)2F^UR=HdE)-Q0f,@5<R<^V2QAQVOa8I0&R5IBARKcZa
@?;:=_4X5ec<bMF0.WVU@H/=1\fFZ\8)Hc,XDV&AW+[X=SdI[_Wg[[:Ic9Z=[Y#X
fCZ9<;\,1(:7XN&4H+SdU#UNS+4\U]3JR4TQU7&UaHDb/8S&LY./\[12HfYT1_Wf
:J\b5_TNEKMSMQ;6K)5g(U&/./R^>X<.-@)#eW2=[d6)=\/M?7<PXKL&<@(@)D:S
X;4?)c46R6H][<FAG,Y^^_aKT\OeVI\R/#XcQBSKd:;SA2d2a@UK4<-:#Q12B5)F
6YN#7+SHd5RQ^-TZ>=-f5]J=IX5@L\@?E#H+c3<7:>X7W.=J=SV+<e/O6\E-5>7>
0N=A3O<CI^dbcS4e8LNO,f/+d\.a&;F&8R0I>(Q6]E,#<6UNT\Sd4#dT/aW+1G<8
3HD\,>f/[-^[cIbLFTLR)0D7Y-aeGZTU/UgOU.IK9(RBd-YD.,).M\b,UX&,5YIe
@?X]).DNN<J^\d/I.0XRGUL1F7KCE&O@e_/+P13])OFCbCa\<d;#gS;KY?HKU1U)
^]c0+9_LB-?F\;1[]V4JAF7&EO[(8)=OW<8\;<,>0@W.@Jg?bPGWNI=[S[_S6d0T
??1>Y5L1E63YaKV/(;\#fOQ2]=-e6A;H[G_.2N&[E+Q>E67bRG3L-aWQ(/Z-a-b?
f\P,=.W-3;]=K,_HYVW8cTOU3Y<G98FL4c+;/LE:3E/O)\f\J2g5,B9cFTSE2.FD
&[<6:&FCb^Ed>9Z.QVbK=]EO;._:+(.fbJ\IY2:P#b=DKL^7E/.[6&]UTT^cGUIQ
NEGJ<(W@AdIdYM7W/AVGQY]Z;]R0c)-ALa6S_c0a@g#1-1VT&5Mg1b=R>:_>\VYG
Ue:;;f6NJ3)SE>;V]RCO?DUTQ6H5a-FYPJ/HH[_Pc.1AS1.L9MM-LXRLAW4T-E]Q
Z6>\[]T?/E4[H212gBfE^+I4ZMbQfcb&2E@M@>L.?B);Jc](3CJPd7\XJ,<E?Y.-
.e3CJ4Ra?5P=8MTLPRTfM^J(aS;AS&-3H&HO8<&=N4_Ca.I1#>Ib9@6g,&;Kg_6/
56,IfFLa1AXPDQB=WWAeQ93]PXBY?_MG:TVY4+(<T?P6.OH5N2&IJ>SJC=AYdQHW
W.6)VD5].C:b##S<?E&87=]ADX-O)S32d2-U##Y7_(7D\B^OE5gab/FTB>M1#2>a
?.,U6_0Le8eA5,IGcZ1I:O89C(#J[MK>#@6PZ:/[@/&GG;\e[HBNYBK@,(F&TbQ@
]1Ha1WMBLYf3Z>GV1G0Qc1=MF<^AXOg>ASJWJW-.6:<D8EL+@&[<eBTG8g\#c@QP
b[:((LcF\);-61]4M8SNB\I-@(bTUCO9WWVL_bgRB^]W@ULUg/]M0(S,eB>41YJY
V6.<YK[_QV]=K-A00X=fYOY[aeG^dSZ41:d;)BRJ]QV--C/f-@Ib]\eI]7=]+UMG
^5()E8E7,4:J24759/?g0LH,\P(0=Va3\L/#bB.F\O?;O4e-.aTg^<MEOA-/\H89
;\^L[BTN1f?JL[bJT&f34HH77:VRB=4K2TcH&LAYEB0KMg_68L_cT?#D)ac7LHeI
G(-NOSM(C2E[&&PANTeCECO-471T#I-YA:Xc_<V0>8YY,:bBWATAfLc4X66eFb:S
,)?(A)R^D_JK=:(;B-\NgAKQ&1afV_&E+VN&:VIVN1eggd^:=5d@-gDF4Ocb\e\M
U#gGDcY;]T]I.^MSX,51+C+:X0,[LH=FIZ:8b[>S)aC6GF\)fZ[D^I3a6R#QFKCb
C.c>6NJQQRH[/XCCA#+@fAP(@dZVcd412TG>,-?+I=F[+>OC_]Y=fH<Q\(I=>T(f
3DMf5;F7:8W_B68RROGR1KFeSQ:1S+RC-XD\H81R<D,K[,G79L;B1a26SeZWMWW)
#SH?3OGaEVDWP=]KD9+C^N<IBPZ??/#(0DK>V>W;ZBXRF[,OdfN0<YS>SLO,34@@
c;JYBF@5V?2A<:+JF//e.<c+E_W>.S]HFd@?S)H<[5T;#NVLU[9U3VJcOFf(I/P\
@8-,6LcZB)_Dd:X=g8)aE5fP\#6B85J@,N2c>e38(DAQL=I::f?#d?gBgJJ93+2?
XXOTO_5C[J4J,PO^[,g(-Z)WG>8,ROB?dXD.3#GYSRU<K6A@MVX)D+RF)304?)Lc
C@40T-@)(0Ud+IO_.<3^b.RHP9^BMBfA4\:8HLHO2)QIHcg.IA)f.Q_C;R_N\:31
G55FGHKe^?8:LU3[PE,/E]#:\/<D7C1YHJ3KWd6HI&]8BD]=^@QHL19.CfgaGE;P
X-IGTKd9&/<1@g\M&3ZP#9O2G#@84N<+?3/;c,_HaOO.H8;7JZ2;d->cZJc33K3>
NMS.:;G1@>HIPc-4ZQ9.7SR1C[gX6S3XGLKMN[-+bO-;<29P<R40f42D,GUI>,_,
8EFf-FT4_1;H_?C;8&_:H7O6U]VUV2H-BHeH+X1OB9:NL)I[:eUD0@_)N?(M)W5E
c9_5Q0:,V(Q&+\dRcV=M[-TJZU;?0;OSZB1YIK.:5fCb&e4WTHe9]JeZg=\3A2&^
dGYO??L[@JAJY<#ZQH8[[&-LQ5g+)C<\,VY79HbcR(^V6-[HW420BC5;HT<GI,G6
?AN>Sd\XSaS&?/fI]4N^a:::6F^:(ERaOM<P46W,CZ-)HIeU-.&4<8OQ&9MJW[7W
\aQ(>Y?fPFaNQ#ML::8T./;dOdL0_S/M?=OQdI@4KSND\JH,C\\ga2Eb?^C/H,IQ
^JZP3;&O4(8W(1CG9(8Y(.#D?>?VBAJAR]g&L=:42Q;XbeZaMJ43R\8\2+dV@=Va
ZPW(C78dJA,U8Z_[dJJF(F,0)/CEf3AJX?E]7@ONQb.X:R7ACP@-FZN77&N()UI#
^b0@#dAQR,&WPe,R>Tf;H)PMEaDaO-UZZ>_/MSd8f#aA=WA[a?2d=2YU7P)-E\>.
/M09@K7f(\P_,CgTL8#-0,a56#7BCQCeBK,3/EW:Nd28<#V2UWP&JFZ;M>ff9gGJ
L4PEF)[aeW=^JZD&TMNb,XBVafH<L_AUUEF2g;4Se7cbKZWY\/1FA]R63)cB\W2Z
_DD\cKV;.g&L_/R@,Z[cQP_DIaLPL1?X[e(/K96BT9[eX/=;Qf3&?H>d,U^(^@2f
I;05-D4FL4ID4#Q-dg3J=cEQ/,S,9X;N(3QV@?@9e4g]53_/9;]e6W7NLFD)Vf[M
I3]T]6cDUdX8[(VZ[Z#X[Ca/HgCB5?U>Zeb4;/c#9?6dF0B-[<+XafH,<D8].CdF
#K-DE7^7V_2W3AE063,9BL@N,dQBQ;_[>$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV
