
`ifndef GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto s26kl_s26ks device family in DDR mode.
 */
class svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s26kl_s26ks_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
=d[E)K)V^2GNXO[7f&+:8>\-^)^+1@BALe(I@DW6ILZZ4DBN9=aa1);06Z<2:+Se
fNSI1[8]QPg1:((SAAI4T/f40WGGUH4?=GU[]S(57/9e7/,La.XDb[P8Xa^J^fBS
>QN6&WZ3XKRW.7fF:8?;_Tf(.aW#gJOCZBYNd@VKg>+6cU\2M@fXRGWg51_c9=NK
#JFJOS5P:VA9Ud./:L+@Qc[?H]&Y:T#6X@UJ-2HOYN=,DYT.;LR^H#I#K+#Y=LD1
J_()P@bC)6##Y#M_dWR0)c^GAd=3+,S.-EN:_-BgFS:C>&eaD#b]N7A?5S@B\S@]
#SV:FT#B<\5UU4N/C/-Q,c@V0VZRD8d5[X,2g9]GgAZ_9U>KXc;1[7@0D.1?2P1Y
b0LO2cGeTW]C8Zf,T2S-TY=F-.(70dWPYO&<@2e]WDf(G\G+d-=dSF0B[V69X4Q^
GaBB3@61b9^T?W+7f6ET&Ib8)YOKEbU:eMMB,H<-#CMZ2,HOBGdfF<QCI-S<-a@N
7X4d0fY,bX2f([O.7W;b/#WTd=#]+P@L3;J-PM/1V>3_cIeB.Ee^dGVA^.b\4@UB
J<@1CXZ&UCE;WPONNB:K[e(Fe^GWVOI2PD6]7SF\/3?7JUaC^=F/4T/9B35[a]b@
CK;2>NW708:]\PMDN.VDcJ3IPR[fG8[\9f,2&=0)#4?[@O3&GQ3.?<bJ)V1#&OJQ
TB;J54XX8;VWJZ>OcRL_/Y\.H92#?Rdf1DbcU]\/0/G1g)d,JTS.2:ZZ[5,V-4/_
8>5G>,a[eG+8;eZZS):(dJM\<W4DIB2Y,/V\W-B\2[829b8EbAHZL>>d>/T3B\bC
32d7/<-0,f@IZ)A>LKUKD[M\1$
`endprotected


//vcs_vip_protect
`protected
6P19XYXO(L(4:&Eb\7)Tb<@O9e=:+:_Lf@PaAKRL4HfH^SD^V?6;((FX?MTWN8(/
L^L/LTJKQ<L#H7dE=f(UBW:@GS?C]<=;(cU\\6]I>(OGd6:4PHD9HW+GTf<[PRLP
S@c19(^93;=e_b:Z=-N#A^D<:TD?0V45CL]/TK94-&M>Kg[D@+C4[[N(e]\14H=?
Wd<.fF7a:2487)e3>GUcbI&U.+H\TfQSe93[.(A[7GZTReG@B09?-cf).BAbIF]O
e.DF>3^,1BX?>M5VUB&VeWTPc[4/@MadK\18OUQ7;ID.B\(5#2QYUU7e<FACL5,]
,BY__c64dg\Id0[N^O@,(#)b#5D59::NLKbTKO1\Fa,V>K4-+dH2I9,@#g]O8P^[
07.][,\YX&-bLI[5?HL\fQ&PE=T(gf4?cM?<d+EE6@3DeAV<FTeLWd=9ID4AeGXd
Pd.cVLHBQ47eg:2KMd6/X=ER]GZ,3-aS@P[=Sb9b;_]#U.8:_eOH+^FL2T5&SLJ)
&dCTCIFU=4&Z5dB0fb=T=QdHWY\V&#LJ=-T?N+(gZ+&=bR;EWE\3#b=SQ(;PEK,1
YLL1:OYJLULSg9-8Qc1;,7G8+XGe4f+X9fOg.\RCX0?-45R94.S85\KZ#_;g4JZO
_7/YQJDXaP/I.0TLOa^f^gUJUC4b:D:6ca5RHF;f:U-\Ha;TF]KU-UZF?I_5Cd+6
8&B@Z+CT9dMdMV2.,a<;[T08KKa53BCLSEA_R[@WNBfCa@#,SV/R65J,6K[c&>40
[M@A=2K2)#=HIAL1?Q64\[#?\Y)Nf<Z-R;1JQJGN/X@45\G\Q#DHEPILBP^+VcLF
;Tf3DQI9Yb-D(G^2D/<c:179d_P727YbUDXRJd?II53MBC7[?U<<CM^g@I8Oe)cQ
3.^-@ccTeMb_7_(05b.J4PTLNe[&G4\.a:N)P//=E@ITa(Z7@X]@Q=X=\[CdeX_Y
Q7G5(Mf]-6>8XCAIX?DT1ZaWBcQfWCV[E]\1>c9VTD6e(5)]S\)[]g^VU8(&Q98P
@dMHT)0OG(:,VFU+KZ^fL[D[631FOac2C14N4#D(V5LJLTO+7gJC7OWa._;?f>(C
B[DP@[7e7SX89LA;P8d@#45<I-NF8X);Bd>7B1g#cDC_b6bA8B9UHfW)+dbDXJ<T
1LPV,=72a[J4R87cL,D-]LYCOP,^)TH-MZQY(.POe5CTUg_^WF0F)F#0--V2.@Q?
9^C>^[d-Fb[I57UEcf9<I)=6>&6KYMZ-eURI>Qa[JY8YWPO>T0YR(IX_IIZC_M\R
+,@Gd(2gD8g1Q>F#O:8Y[[FE=Df:#KdRM&#+^]46gOMK_Ba&a0:7^ELe0V]Vc679
S9f<_T8Z]>,#g;:eK)EY3ZS3/ENY^[,ZLOOC[L8V-,Neg#WP7RbN=ge[@7bD2H#2
C=+/V---N\76;)XSgZHLRd/1=eH):[(=dTe:_g7VRV96>QdVRIZOQcACW9<e4C4+
]/\aE49EB^P:B&<=N7Y)F.\\@XTF-&aN>fYSRC:S0JfOG50_(KGWONd8<MO(D&QW
KeV9:Ra^Af^,#Y_P@7<WSES9[H-E<]6K5#egWFW8I9E7Kdcg;S=>X=<&TJPWd?P6
HJYF<2^_5b,NRA.4I#/[PS\B;UQ-2.>@IFAZ4C,gI2[-<WH?TdU1Lb.Qe>PPX^21
fTbE2C\V?D4Cd5&FHH&)P0&\;Fd@eG[#BP0_CDA7-?WT\1B4a?]]J(38OaeF)VL@
6X1XKNb(/c8B=(8feT9Q[Lb#04F[]<K73.Q)@MdSW)#PPXg,277J0)7:P,6=[a7N
\L?D?Wd^bK(gMC/G-9R0UTSdb[8P7=<#(Je3[IBAa3O,Z,V2^FMK71R+3G6P;2J9
SNd>1g&BC@CPX4e6YgUd<eE]TV_g=B?)R)AKKaL;DIY1I7?3Z:7Q[?P+?Y>:dG4d
_5=X#=d3K5?2FG[(KLJZg-,eId[g4)1aVI8P52X1JG2YR8I;S,@CYLT<#K(0:A17
b==JWS:F2FCSSL#>2N99T8YRC(b>AY?Z5ZdZ4\gGRZQEaVf;TLI76g5?Q<]H_eT-
XXg:-S0-eW8gET,]8.dHR0Me1O5,4O=S=BL;6W/C5C:;G-V:-BUI&^?-/D#e\)d.
dRPBHd=/=Def/AAXCL^+g?eZ<1Y>IK<RJV_Ug]]WZ]2eVdL0A^B[L7J1K5eAYJ:^
4L/#[#Cacd1)5PT)[[.Q4UCGD7VgATZK0#YfaYU9<MR,&+b7gbR8;#:DR4eT5EPN
d-FW@K\)T6Q@A><RX#Q>QYF3O7.QTDOIFJ^bG^J[)MC-G)2Dc:HQ-INQX^1#@2_J
3OW\A\&O)((F4P-(:^_-URX)EJG5[e#L#(L1Nb-(6VE9,2:.-#YB-a5Z>)FQ6[(<
^?9DbGD[D>6K>B,@RBc@^f.B@>#YS?3-a0[g/:c@Fa0.GWU(3KH4UPZT0(K]Q4@-
:&f@VF.9K-DcVO#ZNH05Ybe2OH)WT4L\YF6-BAcA18&HK9IYT7;\C@Ad8Jc:FK3_
f@&9K2-NNe@PbHV&2A0KW99N]>2-8fVg,/V3BAS?:,#\B(L>dQ-US]a]4aAP]bZ]
g>bKNR5N-f?f@b[E]WAaZ;TWX0f->DA^+]\9Q>O;O=HONIEFK(Y1QO0A=P#Id0cO
/XP<YH#X)TR834W/X-YHTS05]^Q6W-7_[9T,+AGfKF;X7J6/5.1V2H4<R.\D&FBS
+O8>1BN:_E/4bW(W7L[?N+<F[O--f\e(g)EUZ-M.T8_2efe\dZS1BBV29-cceXD9
Z5.7^?=2)-FU351?;],:9^>),adI,B:MT_B9F6?@)J6]VV)@8edZ8M6a+26<g&O]
84c7]:?=T^A3QD1ZNQ>b:e_<Y?_6?QB<##@d+Ia32=RW@A?#,^\4f+[;2VCM^,GA
7C==d&4/+dPU>fb<?IL3eHeRBUZLL7T&S]2MFB(QOb.[2Rb_g&MRgO#SCU&E60]?
)M,0D.ZRG93BJ-daI00#DE@)B>ML:Oa/Y5Q8(M6R3V0CdeKeFAA44H+J\713DN]\
N6:FS)aT_+LZ6Y@G?&e6;?_P^dL]1;(XRCX2X?6SGZSU;B3,,8Z_J>^,EBZBBR^&
0cQ#HJ+,JSPC9YAI#9ac5Z?<E+X6aL1JgV[Gd8SV5NF&&MQ&P<F:Bd-L&/C5#7>I
3(3;2cNEYIS>743,2Y:^Y2=B&JS<HV(L<<2HI(f=@QS??E3[6KK&0Xa_V\GEYc9L
fS>Y\gQ^Q0Y6e\3g(<=M=80Bg7-g@H)-RFI(/+45-05&;;Of+NM:^g,V7AFAcf:]
39EXA(gK]F]Ac2OW#42/POI.<cfD45Y[<.CW6-\7a@##d,5DC>7eG.R+?US4Ab,e
0d8B.1E^4#PCE=,EP)MH:(ZF?=b#6=@F3\MIJ-d_D&=b\Z>Gf5QEPZgD9-WHL90Z
E^_eAbQ7a#3bVf3+2ENdZF&T&OOc2BPS+A/ZNQ0<bDH3[+Ne01Z9^+RBEI)\QHUT
Ffe9KYTY(=QQU\J,6gb_c?B]K1LEQNJbZX.bVcZJ)S5OV5BWX<g7P1.)9MGTN-c@
GV&W.dLCANT/VfUW\dK:8NMRYXGGg<ZG:F^c_C#cS]LKRg:F869OH0#+-4+BB4-W
8=fL>\<SJg]V<.Tb,GIN0=Y^>^=4FQ1&46YMKZc6fUN7>[EC,N@]fD=YPfMPBd2)
ORI=?A9U-(.VIAW4<^Ob(7^F;a<31K7a])1J(QOWSBbM,8LMB<02\?TEUZab2):3
40aY[,DS21X\gI6bd_CCZf(@Aeb<YFHUBN6EFLDLE.A;-LBQ60fFS9caD\,81HJ<
FW<+W))5N+@@A8\].b3L[/6@fX9-C&A#>+U[ac71cF?Dc<<Og.K7^]-DMb5K(D_^
P=.T[;4LU[6[R-L#O2K\8BSN>W[DL4RYaY;T)4U]BYS]Y:;69,:gM+cHDA(DOeZ6
:fI\<]M@_>E8[X:f,8L0L#.32>H26Xc5Ba1RIX3c++)MIJg\f@+8_H15^9PE;Hf_
O/cd]/BOVa=@BOg&g7OB_c:Hc.cP9eLLUR:U>Had<a(#6HO&2)_F):MZa8gVX3e\
,N/REOIbJ,\[A<L+^]SUAAL/>PJLMZ4J0eIT^0Ea/A:X/DLK;VgYO8A)O-]U3)3P
22f5(MD#&(B6-SfW4T_a[]4,G1MOZD;/4g3P&)\#O[6L?VcF<9D/B.E\RUaD_C^6
6a<<396P4P#2TLYeS3;.(\)2KG9_:A8TS+IUaKTEE.&)[Wb:b<I8ObHgSGfR^GR)
e[J7(<7\^0TXNVG#CSd,5b[(==:;1S_&FFaQR5:HJ1:)M#GEY-NQC>]PX[9fA1E2
?BSBLJJ-:ARQQD;L&8/>NPda>/g#MG_Z1JP.9\[X/00&9T-#1e;44DK2Z]4#6gE8
0Vd7OAPf;<O_ZQd(gX)a[@Q^.PGT+&:b=+/9b,/;DA-H1I0.<f6PE-I53V7PgM><
)e)V_5&e=c.R[RT6Ma>ZIOUW[N;6HbT6L?NLJdJ9+?gWQAFF,9(R1^+IfF:a]PAK
=A4SbRYJa(P-ZREE<c,)BAKGQVJ/@54H@R@C(>KFYcCEg1,5->3J.?SGKV-_-a<A
]#FL@Xb/):fAZJ<L:+dGN0;FLZgI+M4acLcC\&NPdHOe89Yfc7c[][d:U?-5]ZLO
)2@SE1<^dFMU^\\#)LJ7&aa4Q_P1PaK]AZDPZQII:eKSZD6;HPWK3=];TgQ:B0Y/
:2D[J=5\D<QDOSE/(cfg]gOaQYQFG/_BG^;(_GfYOgP7[.(B^LNfE[)L]8;2c^IY
7ZG5WC(cN5g@7,SLWJJ6CX),;eZ#dDKR)^Y7:JS<XAd6;Te,VcC\_Q^5-L#8T(JR
&eW96+08d.:cJ.-P7A>E8F^egY&N;Y>F5C]e:T1]GMc0)/+ZF@P1TY8?>P?XIZH)
6.3[(H6M5D/8G+8:EBXNS@:E2/W(8-4HWKBHagD<b)A.Uc;dfZJY/bg.PgYGZ+<a
&0:L(1eJ,?Xb#_?3&c->b&[f:)CQ]K30,2gFK<:#+e(K^6/@&<c>KKPE@AQ2(-cS
VO-:?7OJc:NIL[,5QYAFJPf6I&3RUM#H;KZ_I)4E\B]eU(a&ZDc;>-ALZO;#L(J]
UL9M8?c:=.SVTdMgO8]58_O:E7c[V7fATGg\K;54)&GZ)=DC77L^^(Fb6NW;NZKA
C4YCIgV&R_:Q-6DVTe?MWYI8JH2=PIK[MSaY8#-5cHEcB5_AS\g2[&@RfHEXA>T.
@ZIbHA>0QdBWRCBUe-4/QA)EdX;XAdD8-[cggW)37&d\K/caPUb9S?(6E(CFX7OS
9_.RV]TVM>>::^,f3G?7fAg\;)-R,WFdW(L;@5M\E34cV/(T7[\T1/[4AQSO\d=;
ZE5AU8^H(gc1)fO0FY,:Tf@A.FI2X#X2V=0YHA?78C&<-:a[gCJ.):c;MV;.^/_H
R/b6b?^SR8USB(g3^XM/JP2AN2e@_:G&fLc-Z?^e5\D0b946L5=5CBU3\^WV3R>(
HSP#gJ1BZbLFbKQBcQ18SU@BIIN37Q194Dd-&JDO5cF\]Ka@g-IfA#JF<B9@S^R.
..Y-MX2Ega=KB,:RgY3-71LQLN.0SD.)bZ_D)+bLLgBR0(B+eS,TZC;V77VcfVc<
9HfQF1]+Y.SJSUcMR/K;9aEf);_VGB@PUE00-DQG^\?=L<CA]2#;WFZ(9:gJf_9]
#<5,d>N1&W5]LK&K7GSEMN<@KS3X6]>7gSg?]JS9e4_^JE2_8PDLOG/6CO<S7?BD
X3Md6cDLF>X6\NIe#V173/a954Qe^^(=EP-,S#@Fa9Y<635XJ45YI<>&O8;;RBC&
OKg=Eg@85B/VIEOgY[6LN,P1d-)Pg:N)\,SZHad#NWE?C)gD\;2CB0MY>5JO1EQ_
8EF)8<WC1]=QZVF8)[eH\?L9<_Re1L\H<0Od>T;?-(QF2.KY315_\_W/WF4QQeg=
J3_FEfeg2L8?VX?KdVe>>+[TV=Kc1,DgURMGa?CVUB<-@Eg:DP(g.^0^QfBc(^_I
PJ_3=_&aYc6+9DHC[V0(3.G@B5VT:?[DM[WXU[TU,-aaVNX;@>X]2JC=#a5)d+-]
b@M]&&:)4EYa#<N&e@09[46.G5CL3/:e&&f[^1W2_2/b4;[a2#LYT3:FH:gK.AK]
S><&OY@X)X<J(TWZ0M@\II#Q;LDODW2K=VZaMEF\SXa@&1QD3N_:5dfB>P)(Xa6L
_KJIe9UFfS6>+Y]37D:FQQZ)&Oe\c8D3fO<)WLDNgfd5NUMD)83-AAZIZL_)<IY[
4?DWH61/4&P#86.@3DKQE,02X1698]LGe,cS,(X99+#Oe0HD59E,F:AQ91(.3g/_
d+CM)^&I^1E1Z7;84HgQI(1M>2dHScX;Mc4[.d-E\DG4_f?Y1^NFY]09=JVTX#Ne
7Q7T8YCW0SDc-9[V>M<R5Ye?-\Y3+6(MI\b6,P+S#d.N_eD?;M#&O[^-TUKQ6.;D
+Y&e6PZJ=+T0A6?@1FBb2OIgUgC]b5WZR_X.2fUF>,U].X\EIIg5C&Z2/>OJQ=Q9
Z?5J;[CU@I:@T9c)L-M,a9BN-Vb9EEC.:Oa?U:VC8&aO7-1IX,>/f5T0ef5@A2MM
<7+FG1K6R/?]7bSSIHe]7<N=R#0RI_K1@)_Q0DcIba][L6[g,:QB(BeDBPT>g[5>
7B[28/UC7=@BU^#S7DYLbNV=M.HM_#a\-SeEXLbTJ[E)WY8NYOd>(&@_U+MR&RcQ
[W/ccFNaIW(M>@JaJ[c:DIAcf,A@[2b90eT9+Z\a/,WaIZ(]b9)-0?G0T[c@1KQa
[^,(g4f)1<EMIST5K0(BaRdXH\=WEg;Y]5?2UV8#,_IYPd<eRHEFFD+[BDO3USHB
GQdF/8#8NcDa509C>TVG61=K]d@5:[LJa;8/&B6GNfDQD-DMI\DL9<,g-9]+eV&-
11bQ0c(3f(?W<PVLc,J&Lg35-O/\fM#fC1g70H\2.SC9W7<IUGT8#D7DGLXG]eb#
YGOUc;SbQ_2ZaAaH2>a=P0>)<Y8/2P/.1.7]WD&Y&^Ve/)LcH3KH,L,dYEJTL4Ca
5,QCH-@cV<D)Z)=Q6?.]58)1^,SP>Q-5cO7OWeTZd#3\=EQ<RG7GZS(bf\UCJTF6
=4gG)F>Sbe.D(fDB0+XaS0bcC:+Rf@g[,]5XTeB75F=@-VWDFWER)?d^IWA9/@Se
+=e+?#b7;C0^EW-A>g/^P7M,cMSJ/cOV0?Qc^SLf9NeSgTKQQ-0.;#LS9UXe\BTK
a;2FUS5SP@Xc9SEK]WL1HGZ(F9NQgb6;7JR7;L]-.?Z1=T&D-8Z0MZS5TLf_dM7U
M]885@4c[+A4g.FI,V9C=_O-.P(<b9+8_dAA^c&Yg-eW5NYL[/f:=XUgR&Y\bW63
2Pa/+#K71&S^dB2a&Le_[FSPN^YQTFBY,+dJ4,bL::fN15Y+fFbYQK^,_1#CCG&[
IZ-PZ(g^cLG\:,SVLTc@J.&17NP-RK\\5TX6S8Q@UafBfH73^EN[,.geO>SNRL=N
9HNUO?\/7[9M=D,VEe4PH-0V9&)TE:,7fPb/AXO+4Z[f-B?P^:TO+NeU]B]]P+5G
dc99OL,=>G@aSPNb)LFOeEQ<cGe9fcIbAP\-@ZOI2JF)8\dXGJ]Z5L00,3YU\-4G
=B\HX(d(eH8F4^b1AT:2^.C-\-(R]V=Q&470)BM0XS#D(72(OTSY0gIW+)9McdMc
Qc0KB)6:JdK=U@aE/RUedQP<b[D&K=7<FS@;D3)_\;I(-dNa?a9ef6Q>+^G793ZW
T?)dC?N<BB?^=G&;1]29^AD[c)GWBFFYW3,d/R=B;U^:Y)Sa+U??^6##07T.)8WZ
;+3=^8=QMN7?5>c>Y=WfU.HI_AcfM1S\D68EdVE41bO(,,9IH/1P/X^U2X>.SB:R
=-e1P_USBBCaMCWT#/O8__&geg:R6F&KQ?M2<R@ba\fS1a9:5+:]0\R5SE<EPWS^
;QJ/XXQDFHa[RRN\1J&E.55[9[)>b+AG0#TJ:GE:W40;?,g;#W+ZKa\V)+7P8CSf
f.9f-<^O/@CH.]Cg8N+NBP49,W6/fU77/Y[1?0IIR)@DGQPfTeQZbB)9F@+:9d^;
D,UO.VW)94(@I_H?BI;U/Dc3)(HCRT1#,0=4J+HW2O2CC^1<YK&.?AT=0&Z;.NQ/
M&fUg+6a8]0KN]4A/S-<>>,Cb>PE1bO596^1gJF6g:adW6cN^S(N^KC>0V@0]0K-
A0:SSE&8L6H]6NGHG8T0BZS?9[&671O1&VPO/D,:0/DHM3/1>f8d[(:WP+/8CEEH
H(GA(I7G922TO5\CB66Ge09YOA?GZW&9@_GWQU<=IQEYN3K;#d^5O=89GP8V#UYA
bCA8,\66W--5Td:27^Cg:^<9IcXAN<N3^U\)2=R<B/(^A:F;_O5,Z_]E&I7Z;,M)
^7Xa<FT):eabCO0c[V/g8J)I0R+1WINJ[V&5F7W1^C<L-#VMB]:2;G,K)O9OR#M/
b3\LYg4Q:(0B:I7,/TK#DAa=5J-6IPIa7G[g3IV(2R<^)>MATT7N_4N(dQHDR1SJ
Wf:V:=7Z@g+2QJ+?1L?dLb^_]P(/G6=_LQSCDCS_\f7)CL&N1+O^K3&cH-G9SdY8
@FC>VF-1@)#3,M@UaZ.Ga3H;CTE>fNMAMFR&Ce(W,=PMQ#R@^]AdDL(ML?UN>?1?
-&.U\ff?Wd_c;G5E64IX4_8.DZ@IdeIJGM0BO@fIaE#;NWIBV>W7)G,T,27BgQ5e
\9;a4WP_I3).N,L>RU1T.;Sd<_(&TTf?aC7-#U38+0\\9<gA2VZbM,)LO)e:PA\Q
b/&Y3O-aROLH3ZHcd-AO).Ee@H[EAV0\60]V0G1KLG;^)P)T<T5#_0K28#EJ5611
;7&U0HSJ8)CFD<MP8]+U_b=@-IBEE:GAW>_>25W8W,RSNTI)3gHfT:g4,?3&&X,c
\ZN]WG:]>ZV9CK3<6WY@<-/H1&GP\.eX<Cf+3#B7YfDL=U3Te_WdfJY62=_DV33f
/-;^UZZF+HcP)J-d);)V0[d^UZTZ)[[E9ReE4AHU@g&5<4;cg&D?@-Z5c(=bXQ8^
UJM4/+BSfS28AN35?+QAI1O48I#I1.a:F:TZ(R<3JAS_EQ3L_438/3TdG+d\_9V,
^WQDT/ea3K_gMEDWT.H5@(YLgPZ&345g/,F:Ca38=XZ+a0_CXKU-b/2K#RZ[]DeY
Q>TML_IS.bVTXJ];QbQN@C3WI2gfEU0K=[J#9T4,.VZQ+R3@EVX2B>H?LSY.SHG-
\C_#Xb3LVDZ@8\dNg\dcU&^C+<ZfQgU)52LGR55X54@YOV#[@_T8WB@+0PWg&bEP
aT;Hc)3&Q61L6SY<dM01B:\ASQ0bg:a-(:1OEUb/eYIW<QLd-LZANG+^44&.8;gO
AAXYbABO:MB,:a?7X</4MYW-eGJJ[d?4d&ZNAgDf+EG)3?C4=Z\X<WK<W7NbI>50
Sb@#?.)3NBdLUc7DU3Z(=V#eQSG:P&&=0PgWZ<V@f^BJYYG/&],f-I7SJ[&B[fB&
Y>9IZA>^+ONA2BS:cMMe4P[\OYY?Y4V4b,?_W&^T2Hc/.fGP=SMGb>]VSda?YC50
6Rf8@@)MbD@?XC7SaQIG4gM1G^FG-4VVI(fPX5<(A7GJ.e)S^=1KM<A=Dd><Sf54
/SJH<J-,\(.:+9F.e.NA_44DE4:Y;5Q5]KI9?,#,L9LD\Y<W,B?FaJM1,;LCS5YZ
W=8O-(P=1H@Z<F<QddS)8C]T.CS0a69,N7P93EVZ#AW]HA=R)26BRgQSY^\&BG#^
PVXM5F?,LX8d&0(P7_6RF1CFP.H>aZ,g@,&RHe;Y?&ZZ]MQJ<GM6V75PANUV]([I
>QM1Y&6T,NW&227?D\g2G0/[EHa.0[H63>e&c1HKT9a.+XbPYSQBBTH5Z0_NH[Zd
9CK@2[Hf9(,VM0P]^LZHMNaSRHgDIG,Q3<;->JfF;)&A;BLL?_aKS2>=e0a6YPWe
O#QLI0&S+M6C8V3.<XLGN=LN-\)<XS3ac(KZ1I9(5TK@[bbE175GPc\<_g2SVRGb
J7)VVWKdJMTcI6QN8K<22G-37HT7>Y(JeZ,6_/DH5@CA\/>g_+?Q73THL8PXd4O\
5>325Q<,..P?;6A]1]JS]<ZO\[.]1)7CE7RI/;?Q4GIRCaK08dC2a)+eT2(]O,f8
R&e5(<I1dJOUQ#9EI8LW017L.T[;^?J_G4Z-gdKg-;^d77&YZ]M48ELIXW/KYRG1
[-gN5G\(Y.^T-2MI>RKbLJD,+OLXT&X;QgWU6I@&2TOQT[SAA?Y:MIVC[\M7C/Bc
>3=K^g7O9G?Xd&O;6eR=ZN3&=69c;b;+Y-__]N9(e==&85MY[7e<A(ae;EaF8M9#
Hc+S;<e4c)Q2DUAEIS,eO5[2\Sd5Z^-TBX/1A<T;O:=D.IJ:_33EVP90:3@1=\.Y
,#Sf<XNY#>eY7O+e[)56K@ZT7f^L(AH]UbeP.SSb\JWd6&&M1==a+[?LVEaZJU#X
#B(M14db79IX8VZ(Z_CcA93Yb_:1f]]fI#-@WPL1&U@e:X;;KHU_cV?bLK<7N[EX
1(W3(UL,Q[=5:NWcL((Q)#LG[S:353X,0db^c(P]dE1g8D/QFM[T90HEI\<fDRD?
eYVcU0DZg,YdE+;M[J^6:2RC__WP39X&L&/T<A18(eR2+8UOX4R8#1M@YQ/Ag&\/
PMZ@F,/aU+@<Q.5DSIZfGKF,5..L(6H&?77DW4PcWBFE)09RC-34+8TI\0M2T?I-
]@N10VZ.<GZ2PZ-IP<Ce:PTJ@?MCRaT)e=a0X<Z,Z;0+4c;DN.5BI,CW/7g2NS?V
,M\NUHb)12EL7<OU2BDBW_NS7Q95S^;TXgRdZ=b)(?e_^Pb^05Y<_RRZD<7@]gBO
6M+g?Z<R.K.6d?)+:][Z=JMI;Xae#Kb<(7AIOJ6c307747AN.4J[(-\GTI6LbaQ;
LX;5>^Cg\1GVD\U[UV6d@YRO;QcB><NeHFK<QfK5:e4T@(<6BS#UUCS;FCO0?AE<
2eD^5aRG6(OH0\PcE:bZ,SF(b?E+J.\fW4ZgGQZgG]+]A&(>)/=fC\UPdKD)+E3U
g<Q.4@R&IRe1A\fE2T9K:\EJ#,0K5ATM>bB]N_@3NCdCUga#e67/T@Y3-FBbS\&/
FSHaO3E78WZ=;e>bP=W,3=N0,LF5CM/84S<fKL<D-+IO\1e^F[DK,4A=DQ48/=0_
LM,ELHdBOKN69J2BV,Of(9+02:>XeM-[gYA3=Y\Z#=-:cG&:1a(1L,gT_#ZPIEd_
K5]^^T1C+U7b.PgX1WHe8]3YU3L(E.Ca>H;_C>ZI@Z5=Z<BR@AS/J:X5:Na>HbT4
Q<a..:F=1MfZ?[b15:+O2A-<GLP?VNE#[O+gX<3Q+#V<Ab_f2;PCCb]O?0A#gXeC
3f?(</>Vd#BTNAbAaQR?W+/>+>0H9?4cY;2:YXff67MVQ(5UE1?\bS\5(1e.T2#9
37N&8Ng8V8ZX,:(\c+<6,<KEF+/^+J(A&?R?:7E<(@7VDU]b<0Q1S]MM]8N=CR()
P]G:XU4<\))QHaRG&1?@BSQ6^#G_ICdFe])f7KSSaXTVX)LUO[>Z[LU+;8+1V;,0
O84:C##N-Z3U,5fF^3SYGAO5Rg?Q;]B#UPT_Hc(5\>]C0-H@UId]F#a:QI[9UaE1
bZVA3(UTWKc56@F.JE+O/(A._eZ(68OIcZ_TF;#90B4c+4L&bZObFZMMC3KZOKW.
BdX0[&KL^9&DWP7ADM@e?IZP\7TQ,3S((6V6LQcCE:d^Y6Kc7X6K0KO(&a)+SE\T
GdA8SQ9-UQ@_@2aZV^6/2</.58Jd;YCJCE4>Q5dUGF#QO1T_U)cH)J^QfOOR\1F#
)[<a:3_+_dR@:P9+CBMAe_]NYPD#cKDGO9fYO?O2<AMa]EDeNV5CE-CH,a_E>@#Q
Af;GE)81O6M:.#15\1dV?832S9)9W&>[X-TY(1c]Jeb_f0#7626,BDN]80&]-(P8
V22ECV4T3->c=0Tf:]R)4_]I?UAd:&VCNc-R_]+\PH<gD0Ce>BS66BMZ(+9QM68V
-1.ML\f@Z<BFY(WaAZ=A.\dJfE9-J8KB\>5#([BR/6\6&I(7gSNU^b=]C<2+f7eW
.Q#Q0>3M2I@)I+N#fHRE34#FNdRS\:KeedXAZg7RK793-gZY2,(N<VMIQ-[^LZFN
MV9YAJLXMSaS8>IK<_Z)(Y\0;g-(=>CPbZN/:cBF#BJgG-fLW&2.^VXK&UCg>,65
QKF^R^5LW3)+;/e?T4EefL]7YGX/gcJU\;.WFYO/aS2Md\62B?a=:a6T>X.gUS[Y
)@,_Y(_6VbKdZ-1GSd4\:86M/Fd3FH\-UDWHDGDO0gLI.W^)@LWBOJ(gSgEA\eN,
gYDE.6(0OcL8Z-cEMg:3S)RM^7Ag-CbY9M:#?;XKaE)JAc@fd0AX\d)JcQb^LBU3
-]K6^)8IUG3--V\C^Bd@32D,+?JO86a_-_F8JGCR1^Lc=JRZ4eM.TWK,VH&BBTH9
G0T?)<P=2TF=Z[(=VC(^FVI2=c;DQUR>S_U-CKJP:?<,3QYNIO&d6I(R7B-7dGHK
W-#5^,BP&;;\6U[_Ce)dY2+;WXY[N3\db6+>0#TZ0#Z@)-5gNG0#H0_.BF]<,<O5
fP>^H]^Y>Ld@#?C)0A2ZTJD:ONGf3)-:g#c(U0YZ\1C(O,ZS-RFgL(,LN_a=ag@S
Ta-?<+@bSYcF5//W?g5XJ+C>L[fU-cZ5eQ/S=4>Y6)\9-,HDg_4EYF_&68GS4TEN
aWgfWXgLaC<I)Na=C2SN^\I0]bH44>d]^GEA8(DA;P8M8BY)TYZWVOT:d.5&(-T,
\B87XW1-)5@S1e<)]aPPS,9HD\aLc7_:I#2PAdHLfAOP4YO)&d/A]&T6_R6K6daA
\=6\[5(3-]\SE&ITbe_T)F8a-JF:f3D@?H7[Q_LC8VH9e8CW/3NS.b@M#f=gI-4=
U#8Q>+2Nc>,C?1S^K(\EDU4OR3gWO3;WXS(-NWMK\E)QALJ/#7VK(5<3=-]25=c-
^;?SbK<Z&FEb+55OL19c+O,NDecN=4cKHaIDS.G#HGE54gF(T9C41.GN3)<+GgK0
84eL]FX#0dUQB[LeRc+P0.:A3J:U-bQ=:UCC/CPTF=K)ORJ1:I==-?T=59:P]LMY
JZK7I:&R#_46U@0Yf-LK,F2=1(&D8#66,6Q\[2Hd8:Y)P116.VEKM>E,\>\c<a51
>42HYf/3+NMK3]V5Q9W8fW52M6<GX:79=<:T49[B0N]X=WK&#2,YPQ<.EO:WM+c/
eL6A1\3P8/X.eL/@SU)M-^H1f;DSHeB&H(ODX\B<dC.0EQ)aa810(D<:dcQ2Ec.;
eg<HO1S[)U&?I>N;,1V3dB5eXg&Pd(S,RLH(S6)#^A[?6?=[aP.O-H+O;XcST.U9
bg56))FED;4a4#(36TCfUMabMV:7E>:+@-Q\)XST/C<FagFR&>6F#+61I<\bXSfH
A_7b_ScS3T(QOHO9N)79<3I-/C-S^42HG6@3WTUE/+eAF7VaKCM[CBV.X4>PY/aP
@1JH(5A><AeD>,S9Q#R1Ic4=WfY0bH_J5D\;cY-1RZM:/G0[?OY1@>;g-b274+C3
\W5,.WI7Z@e;I:\aJ^+QU63UO.U.T?_&EC;]T#7Leg]-Y/+QR]]MY/X-[Y8I[J2K
(Cf&MB.8G4+dLN4/4/Y?bPA0QadASGV(^<bbU<#N^Ic[?F_SG<J.63cLR+[?YVAW
3bU_4ZV)eW4M5_1ZEI&7[<T>&59DG+MX?0@[;B7X69aR)aS<]6\MVA4A>&(=R3JA
3F8KdZf>6P(A=6EcGED0ZX^g>6HaV>=;JX&)Q7dQV+>)4)aE;^1HC=b_FYNO:^0(
^&;1[+6.g#a;=CJ])>\^-cE:2K[I:Y\QgCWWUM8WbeQCLOS?f5R1Hb2U(MC_\U6V
0&4Z,+-)JATWPJbE2gVbX;.d:7&IB?<(_Y=@aJTE#_@PFK]L.1:C4DDV?V\bIK#-
&c,TA_GYAF_g:4fY14\1<FHIF)?_eDgA)&.&RRc.gYJ^Nb_Y3;Re7EB;PI6V\0b8
1b6G+5M9,cPZVLTH>O<c+Y)f&YIZ+ZACX?->>6OQgcA&eUMg0a=<TE7S2J\)E3<F
d(540)C1dVf>Q[XBL_/8HJaf(Eff,)6ROF:aUG3f.:;1/N42BM<66/WYV;)BHPFP
aME&Ye;ZA:II8f_TIOM7OO69_=-fbPGQJc7eD=1>6&@.H>dZa,LFYHQ>_YET./;:
EV56:1(23FS#<FYY+US3bK-(FIfJ(J3ECdLJa+6.NLg:6FCGb1^Jd4>c_@PFAdWc
H0]2H:f9XCC9.XHXD&(5c&bDM]RfL(V+M]7#:@-R(X_8_GY63N41M;aLbE_RU[fK
FNH/AcR?9T^dJ75BM(YL[,gR#X8AU;aWX_E<P;>V-SV-DCVSXdUZ?(:5/-89Ib2:
eXA13PL?SVZ2gT9H>4A9=aG1,0YE&:\Yea+DNP6YXZE@eJ/+A4U)#+[dC9e<#5bL
-bMYOf5YL9RaF/3]0H@W3QN[4bCK#J5H^W>Fe3bW@@#W+GdR,;5c9DO=R-f95=<W
V,VA_X-Q=PZ9@I@GJFKF.-;^<GSZ:aQC/J_0(4R+)U60^d/47+aRT80&3D&\7PB_
95.-=-,I9CW[I#>@fUTV]&90^2O1;a>I&:f,0K&G3I#XPG],e&;YK-E?cfOSf,d5
_ZZ>WI-<A,d4:P2QCYW>,91(_G-A^+Q[.aW2BXHYRO3Od\U#MPeGg>@:98YX1gR5
cc?6QISdB[@V+CcM]N3J2#WZ<;#/I90bRXMYX8=Q-d3FML4M/YGgK-W81;TVDI9c
>UIB_KAE.NaO8<XJ(c#G?affV:VMcA//UFT@BD8Rb\;S(^NE):2a:E&C6,2M;BeA
Ed9,UL6Z5VE#^BJ+C/PA3MTP<cPR>b-L_?[D4LI:82Q6:0T(C[aBf<d\@+-:LCbP
G,SXL?d4S?aY8U0LgZ/@?]]=0Pb;<#^a#_,/;TU0MV;P[5F]#gQeR]Hc(@N=K;aI
7,98X6FS,^f]@JA3URPKM8F&8;NfRBS4]J[XX)+\N0;0bGQ^@/db#N?90L0McX]X
T-a9)cS4=>F;5XHAfN66EVMf8(g+/J,aY)::M2BSFNXd<WeV&,H/.4=X_ATdL1a-
5R]_8b<>8[IMBH<36@8c50b-K+3PY\.(ETa&2^D_UM@H1NEe1):+4W@5?)AKXJ[P
AF7cE=R(ET13=U4@PHOg&D[>?BWabe,&bIL/c=I1C7bL.#D/8WSDGB#D?>??2?5g
HP..4)[1Y3/I41Dd-a1(6EQ.4M8(aEb/9AQFb++K]3&d(H6C)843@fJHKe1?0M\T
;JW+RD6+;409V=^B[O#()VbLTJ;18]F[5#P(Sa6OPd[B[-ZFEP\aC87#@@fe0e2R
.EZJ[/c+ZQG]a#G9JUPF(T^22LAbP:gLJRB,A^P;dYBg2Jf+_#>MX^U5N2#90=.I
;9QE9<U\X.>Z906AW>B-WPFNI4_X-e.a6)cVJ=[\\(5ZgcNFUQ-(P<8MMXS3@N>/
]X2,5FbXOfIRRM076Ke>F1W3K\@PcWKd##GIQ#We[/fZSd^0?4-?&Q>?VE605<WU
H_CgI/\/Hc)+;?;gR]fQ_DWf+7/YBQ-5g>_=ced]-P)0ZJ14?@VCY2.)S&)]E<@9
E2)87_NJ1GLL/IB#dfRSRV&fE7S6W^/X:IL>MWRQ=eW(T<@dJ@B>M[[cLPHK)C3J
3@O=T8(17>&)>L_Q7Z_/_R?FF+<HdD;bA<M\372<H#WN:CfBT-MMaX:M8R8;Z/])
@+HMIf=+IDB(WN.V)X-d_FSMGKQO>Hc2OFE;cBc?#g9>2=2S72T7A.:U6_<5T9N]
TR1deXaKN8--79fPZ&?L(Lb&YfR=gJ]VA,c.:dI-f2.eVZc:ZdV0N/(eHV26c=XU
JQ=KX)X(3K6+gL8?J:W\X)C(d,+B5_BM+K-+Z31C+d9R_?(MA.MVI=H<<OY<RVW]
SIbFJSV<+F:=+&Y3X&NKEbIN]X^RA[\&OK5Zf]ZV+E:UDgVLb5[ZP[V.d_EYVG\N
?>fC=@F_[^61;5SA+EIM67OR3G<_@F>WR7-A:M[6&M:QUcC_d^D;_33>5GVEJ-&A
@.A6-TH;E\6Z8MU3>>01U<XU(QQN1FHTg3ca4R/6ObO=R+=4O0ggb1PLCZdX6c^I
5V;gEeU[3VGc;2V\/E5@Z9D1BRFbT4)bWVg-XI>b1Q:f[,/JYW30-YL)@EB;E\/5
9(GY/+>dD_KgK^V0VH;-C;&;?CRL?EbbT#^^6X^DNTfR.VaTdU=.&/E>N4e8S5&W
[I7fJBD@253N([#08Z@,XHM780[I@)ZagS>&J\/Z<1#4+(McLXOdgZURF8HH)C\)
,9JL2U@R:.K(A=ZKK2K?5C@D>UcW8X#5e:UD,D@8KC8M9+3PNGNC7\+J(6JQJ\[C
835ZKZS@4/17DdM9LH5#:]+9=LNU5)4U1_#R;0g7A>FdfQJ<?>(7Y7P_[=_:E_W]
b/3YW+MWKTg9L1=7LOL8QW.Gb,)\\M?Zb,g.ZF(1c>X6fT;R><WSFD4O#DIG>N6Y
eeM@G47B@YV(3M+6&608F2=e&?V]B\b)Z0@A(]G;QJX&<ca_WTf^?N8=AIB>RE4e
RJ-TE2FdaV9&8WH_KFT9=IOP5K13PAc/CAG]F>NSD&@ZFB8LfWJ@+Z]]Q;M-^^S<
>b3-Y>+5AA.e&A\,Z[7553-WL;M<S>2GgM],ZZT42.1;SIP..eIHZfW+QZ-K\EMH
39d_TF4TH>WZ9&7=0J^?FaS#K<2ODOOC#ARd>NF9.K@==Q.RY;P_K5UF]>-DW)UB
ZI:C?eM][E8Md]K#f-LQGYJN72YI._YOY8>BB#8U:RY43(6[(6KaZbXQ-FQS]b4-
W81)[K:1YW4^M13M7[=W7A1b4CM-U6.CBIf?]b-&]\Ja\(gZ+53eaT/G?<,AHDBf
R#6U657X-WA?VJ/AZ-V:<JLG==,>77/LfE\JWE_gW9,M.H([\FgC)KgZT+YVY1&2
I<C#P0#fU_@M@Ib2g#>9&[/,-0#78Q=^d_aJ0=edF=W0&=4&OVab[-8,6.2-.3;Z
c(H0D:6)M3RZV]K]a_Na:X[L2^cA]a2/)9NL-I8>P\EHF=Ng2O<[W4Z?e^&UOHb/
Od,VNZ&cDO<>,?O5S\R4@@Y+G1GbY\H-30.S.BJC]G1b;e)9\VbQ)=>MTF+b]BV0
e8X#0&:8/>U2<>B#33?<8.X[NNdY1:^YK-:8.DDdW8CGf\_<F]>@fOYTe+KNZ?/F
;+1VGC<DHgC;.FAS>[NLcFR]Z_\.Y;Lg[I8>MUL5EdRZ-\00/FG3[)gaR-aTEV8(
]6/6geaHBMY/?T:\.:b0+^^OVDNa=H<c5J/I<RPgAFI9#VDb\g;YgZAHWU\PNU1(
AVa##)FdbHeDGQFdQ/eG7G@ZcOd4[;K=B]@?O-1L<f2I@\X5Y8)58TUf^[2B>K3.
+JF^))&WYe]F83EcXa9757b_7T(>C]<HKe1F^L?/c259]#T&YeZ=/+cV7?M<-WCG
RC/5LbPf8E?ZQe#LALO_dc5OCY:cN_bc106X\,L5VeeJ,^:fCSZEYA#<S@^3T@SR
@CT8VK<Y2RF\/C-X^Y:M0Q1)H^?c@1TW(=P)@OGa[cX;8.[=QUO1b(FHTV3R^ENY
&LUaJI#7Xg=2:],eM\.G#:LaPQCA((I\B6=+WA146D74=YeWTfOJV>XZb_:b,<DR
-]ADYW\]M#T?a?IQ_Heg3<c4Pa.\Q8OF3V-gfd=3bF6;Y3BS0:^9J05?K,cDD3J1
O-816;@b&\FI#,Z<)<\4(cU[YM]B77RWH^43C^2/0SbX0E6@Kg[0SRS=60D<d9e^
F1<:.f(GLV#+0<M,MX7V8#VP0AH]I8D@0-a=<]##@,39LgX/PL3=+UJGM:@@46]a
.[,5Ke4F9BS#F.g6OIg:#3WcE8(4[/0\GB?J]g-@:fL)(#KP8?52YL1A,d9\,ZgV
YUb6af>+e?:)cJQ]KJT>E;gP<@Q\B.g@E=I?NUa07Ac[_YB=O>PAP@O8;?e-d-/a
N:&IFbX\22W(,,5\@IDB=3gF1[/e8eZUPI]0(eY,DcTK[ARN6ZF??Z(DWTb=J+30
=dZ:,/#AK[G9V&N;Z]O[&O3QgGR\1g(]72/SK>AbAYZ7ZB84:-H?,gZH>[Z5Rd/G
[R5ROL].V/0)NZ5^ZAP)MZ>>aU?V_B&^0\=T(NJeR.[_BSb_=UNCf+-b)Db/I8,0
O]f./0MD=Z96a6Z<SS?B(1XO;#Z\bSW<O?4E)Ye8<_TEP1c]C:<BSYf3ea1@@S?f
P=NF+O<J/V5-U4+-0cUTdCY=#(aJZGRMcODAVV)@G&_S#RR_>O_b.?@]S-SVcb\Q
Y&^4FM6Z8(aSJ6HY4]W+WP,#U#L(V54^0d)7K&QP9cJcS;:M?W[#QSR+22Y/69HT
M>D\d@/Q@:)a<=TAe87IK]DXR]<UR.ZJCC5KT]P._Q\1[1K/YJ7JO5^J>[E9SG^C
YDEOY;dZT]Bd;GOQIFIX7Z6GQXT)PAd^ACHDTT?1ac/D/U5GM=(T&\:>Of7TgEa9
3ce=L=IaL,<NVB13>EcUQNb+4BTdcBLc=\<#WG(W>f2ffYH>@<(N^\7e]+R^FBH4
S/C^R)T\A6f]2.[dKHAa/ee>BFXG-XP:=.88VD?d321.\6EW#:=V5?>BLYEJ#]97
KOeQ7)+e+W2,JRfD,ASOB@6d,(TKX<ZAgY=(.DM6\KO<@bYfgNW@?@;4#E88/.:Q
:2>>H,6eG-JJ?)]XKR4B^3#.4^5[1,01E=:#;eJWD90SW:?LXNKUZGF_<Z5L(a6U
Wf3:>?bMP@:fI/ZY3SJYP2Q2@E4ZFN6SC4L?,;;\V+^4XR)338^C7E&_)7;dB^QJ
M=WOTfMK+FU1dG&#U\bE[9-E,_E-+Fae68+GG=(ZNBf(\R8NdQ0VeSMPVJJHb[U]
^<cLPSN\Q_96,C^6>N_#HS_@Ue\Ff<9e6QWT1#=,)bgI&7PT60BQ<::=4,6>^]&7
P&_CT2gC://N,W_(:f_VRX,MdF4O<a86,-08&LAL?FJRf9;(\34<&0FfeCeC3[:[
H2O3&LY3E/E<4?87085?8.[M:242MH/F?(PAQ@NX9@fH?@SU/50[BQ@NE0BF)faB
P?09Nff.D\3]0TRfSReG^-.T4OZ<HP:)J1S1L;GZM,Yd<aH0XU)2-5@R\g?1#aFf
@AA^bLI-];eO5P4Ve]05Y2VEE=E=[+A&Q6,A75QAf.HNU>e8NAeeEdK.RAADIgAY
.OH51)5a6/U2-dL?e:S.21^BXM)1IV.N=7f#9+7^(@MF5M8QK_FJeabP5EYW@,JZ
ZQW>,\HZ4S(e165@f&#>Ee5/K4Ud=;8CS=6f8,CQKKc>c:&@,eI^&U:N1WZUBO&,
RbaQN,bI&X45>KTI02c1T3NbFA?ObcQbK__X>afNHTB59GF17,[6U7FgF(GBP^NP
PJ>A>Re2=AQA+Y\+K<FV3E5?X9CK7TL5V^fR@fD19;/[eVV?.I:8=\9#6-L\bQR1
FdHg(-_,V&U:./c+(:3R)L+XZ6Ic2#NK=.[6K)#5]c,MbKJ1MEfFb:J)Y^D]MaOC
L[aARY&I2L=W.(&B_/D-MH(Q,RV0/.La+dF[6E>g4#b>&LTSg?5>+?4_2TKRT5d&
<[PI[Z4@1&J94@--MaU-^H0BfgEFbSSg2L?]#=R)Eg/5c688@/2<bK1(d<EXM11;
J\NDTLOYgcXW_G.MI6AA.B\@OCZ2=+>aAK4d/WSF_K@:-M(M/>>N8?K=M7P(A=Z]
V-Nf)OY2fA7T#,WZH+#P@2dbQU,@_8F[7ZCb^_02YC]SIF;bAGcP=.]CEfCOQSb1
fNX5_4]>XdJ55I73cWQeBD-Ng>cG<7:9-aRS3FF3-.[N\g&:Ac#gS]7#-.B#_DO1
?L4TZSSfB#N?E.^B=^X^#I9S1+F3RU,P80MaQ]J[cWM9A[Y+IAd96+PVO^G9W@EZ
F;1#fNME]MX>HXAT@8U1Ad1P95JQS=UP;FE[3A+Q2#=#[:-VZ&d_7L:9fIUGLBcN
VQaeA8QY19T;A9M@(;O87Rc5/#LYK+^?<H7-2WLXKgJ+>#_=K\<S)F:](a)6T:(g
+K#882/I/Z]QB#&\<Va1CJ4W6M^/45#IL6-1,fa+(A@gZ;/QX?WVED0B42TOb>:5
3BQ5D5aUfgf)+.]Q9F<J0]X7J]XYVb)[N]S?Oc-,)7&E7=SE-8X];ZT\,/TAI,E7
8B5OT8bFaX+;5I1(Y8[LDZ&@Qb,-Ba-5UEEJ.:FIE0WCB:IeQFQNI&KWg:7QVH3=
c5:?A=Y&]^1L0^D.M^NR&(H8TPLd.>,bV=)26TbcB-NA3V39A&_cB?3_fIXR#G;1
+8DT)D1<>KS6H6U@SUYbL3(?6SR>ICGc8#)&G)aK&/0/A;LRTcLV=D9@#_PO>6CM
QI:QQXHEI5gP6)2Va@9CMO=F2.5XJe7>Be562-eH>B^bP/c-62R1Hcd;)\IL<eg7
;CN#ZFHUdB5-Y^/VJb?>;0;5SBQJed2O-O/gDU_(//bY+-5)D,J4QZ:=S#6N3+;,
#39RWRGB?JE@F\9G2F6d]O52bW(f2HAdWDAdZS-b,.dY+TO5e>MQ54J+]P1df4K=
M^\0JN)#[NQ7RO-W0B2-#A_[G_9O3/28gU,H\>]&Y/N-?=SP]</OA.J_2WbVb#S]
gQ+5_NddU0UH]U5-TF[.6I@#35_MW@_/425:CP-<a/-@EM4(I#)2a7F;3(g5Q34S
W[MWLJ)Y>03F_K3T&aDd>7+NK=SOJ2R,M\/AHG(VM^=A].:\ab_ace@IN_W?g;4X
-JJ.PP<>C&5?S,-a5)7SUTCdPFFYe6P:-f]1,;<]Ob&e=,Z+];PX.Z=Wg\WTWa?I
K]73N[#S5J,A0<EXcO6R1JdNL/L,(\,FY#28F?S<C5@V]V&R6[K<b>?N1FLM[fd.
:5(\RN=;d@SIgQPB,RA_I@]GPU&eTP+7##LF<4a,-.4\IJ97/Z:MgRH\Vf73:TW+
3?CUUJJZ,L@44RPAT:W-BQ8\Q1=e,LX3<VTV)X=\-_(BW5<88S4Mf4S]BMR4X:=/
E@JP[>>@+.]dO-)PJ(X33-,/fQ=KN,#S2+-756T;KJ.?f&KMG;[HZ,4;B#=aR8BP
4]5@ZAEIS(APTJ=TT<,b3\94UQ>IT/HP(\D.I)(Sb\,-eec6?IH/<Y^<WYV,-.Je
H8.2PaO.>>R12(M3XNL0BK:d9X^)E;7f+,17++0dMQFBa3+d_P1QEUOCA]9267?R
L]2PCb4b@^&PYPd4<AH:c5bHV&#gXT+D7(EXHEg;[T(@&C)S2<E1BH/E9g0&U,K?
-Q]Q:6AeNS2ZYEQGQQ\C<gT:?b=IW4BDTP)b:LO[YCZ2V->[G&4-.:.9=B2dSV)8
U=(_Ve@XGH;Ng1X?7SGF^?[2Q7eQDOD02BUa9JVIL;]WX#.Q6_eH86dJN6.2CHf]
WDJgRZJ[GdJ(QbIIV0^fH=UUeUQNXQ<]bBZ?.daNQXVc0YS^ZJeGfBe>JaWQ/XU0
<D19I7T40[\Y75J-0A4:9:BK=OIA6:TMH>8[MK4EFWQgc[Y3.Dec?((dY5(O0.K]
d7JPBg2DXLaXbD:,bP^BVE\T5<e?&.]_=;8(gdLX4FG[VABW:TaC>+-]CAUUXO=W
XT>+HH3N88DIDT#eE-9&e#..K+d).I>_\@3HT957;>TS/eEVGc_5_ZYJ<U,&MZR+
,D51AC,S1TX#g[.ed-]<<BB+Dg0eKD(cV6F.gO;\A8f4TfMD3W#2aQE+LY@b]O2P
@.KF]e0?6^3:?3=D:&/6[7T]Gb0:,ZQ@VLXQbDM0U7;)@_PJb=N&TD#D3b[(W54N
-^1XU.32X<B3)f1Ib5M]O6a[DP]Q_(&]J:M@\V3/01J/O+F#2GS>FK]1X)WO,FJH
3NO2N0NC@XaAGAA/3;PWbZ,Je+S(\)2ag#6+<_TWEHP^DBDFdPT@>?YPE?SW5Y[Q
\ag\YV:>?17,L@,5,@@P@TAOFLb5LEGI4&/dSUa]6bQ)-[+.^]9T#S.[(d=N^1_G
M;+,>=UcOP>11?bQ&U#Z,B<5L^Vf<CAd?Z.4,EOeQ<LN5/L#5X-C_3>g:S-^))E#
_D@Y:_TFAZdN25T_UU[L6A)>)[VWDRY7+2),JL</a9G;H[Lc:3,&gA<4Mg.109O5
)>PSYD:WZdfA2\QL)B8>+8_D/.VM1J4ZS(Y2Ab\VXTRE=9GYcV-U;2aMLDM+/:6F
#>RT#gc/-V^(-Rd]KN9#&YeLc]>\fA\b4E(>V&P7,D8QcbR5T^>+<[-\&V[S&\Jc
-ZBEJ2EXgM80e\bdD1XO#G8B9O2^bBU).L540(D7BSa#7E#P7[Yc8RMGcVS9Lc9D
:8W,0[I.R4B9#O>83+O#B\(9?Y.5Kd1ga2L7;:Kb,3#6U?D9H<<(McFJ/8K45KZD
@?@1.FS(L76;/d^<^MMb<G-EGV(1QO@_U99T<2S>/QU@@2C.Vf91@78+P_^c4I-0
2Cd@cGNN1KCGG68JJT+RT.,#JS)[@7VT#FD1S=#&/V/\G1>T[E\Lf>[,;);H?_/K
bS8JRVZ/X?8COd1,:_(T^:bAUN6JcP)C0b9#F7C@LaS/-b0cdCg7^2e6?Z/:3@Z,
R.8?fHadRR;OF6bacJ,(GFXH^eQC2[#g3bA(1P+=>8+L007eHH@LBf-Y?AG#4Q\>
Sb86F<=[JLE4-1,^SC<Z48-QT@\fP57RNCII[3I^5,Ja]VB?@K=P:fYFbT82e;4#
.H+J3a^5R/cd4?H=MNa,MN>dR[E5cF1SFA&.Ef.@_M\)9^4a;dc,C9FV5?+a-)FU
bN.S=;N\>_I_S;b_7a3.+5+:TfaVF?D[4)G3R=FEH7X#F@&;>RAa[+@?,O7(8gAT
=-SdK,eB;fe)W0YIAHdFLJ6Z_:75^+#Y,RG@J^67U\XF#6>^BKNQH\[@^[XW-A/5
D,K;>XUf7#VQ;.QIac=OR@@+QY#<TYae>N2Xd\>XM32[7^#dKN,\6]X-K+KBgPYX
#<a:3>GeSE/b]PQfa8LabT]bD>42AH;OR52PJ[>aa/?X7aVB8?6O)aFCK5(d0aVP
@V77^/5Ja7,3XJH##H3gEI=a5AXRVQ&>@->Se&0;abI4LSgWTO^Pb.N4(U,)8b1&
(K8PKc_Y[)FREL2K66c0O-b9+]7[+a[b9Z6g7YfT/47Q9-T9#-K53^We@d_S487I
<3P#-&d?S/5G0M>3<H@g7992b,3G#-&IL2cJ,a:S4J4[EE?&2;5R[)cgBHV>bK.N
aQ[d^SDcK.a+@DU\DB(TI8&.SY?)fPW+E&L&/QTCgS)S(X.LGMYeV/[bC2dgGI7U
X.Re2DM(W:P,fA0K80fT#GSVBKg&ZP^2V90WQ?gK>,.:L#3=DPZ?&CS-><4TF-Vc
;?X.EIO<A]&.5K]G+>3g<=[GNM,OX,fEY81?-P_0H^f<Y^[(fOaG5Q+TJ15@.2T1
X[]YAg^0J.ON:C_e?8cbdM94S2&9H(N7bB&CNBCD,CGEcR[<0L5)Q&=OQGHVaQI_
&YAQ=YU2,KZDc-XEOJ3C^HW<L^N[e3dO8W_ZMNZEfGOGg>C60T67Z3H\)1Z.+aV^
T1;8Q8E[W\[CI45</)\VSa@DL)Pc4MK@WNb8Lb8ZR_aBA9aCRA/_NA=W](YD6HUM
8V5AT#LPbFFOb^&&_UQ#W]:<V?d6EHQ@H:MFbGK#JL?)0_Ea-g4a]YY1W,Fg_+82
_(^e1=,W\?bf,Y<TUMLID&OWZNH_O64I[J(f:>./\a</_&@_[[(NL&R(1ZLKEQ#F
?>[.>JY5=O(Z1dL>d-1OTX\PY#V&J5P+E;C[PGG6I.H@63Je,=bSHMP&BLa3FW)J
O>LA:&-^+F#L&EFG/=SDVA3+G1:NCREQZ5^6@W+N=7[;:a>K]@?Tab61?7RT0F2e
82#<-B,AW_8UaF50gDFBH@-:fe;A&^eRZ.Y(SHVd01A;8_K=I,NB79=Z<>&c6VbE
RcK?d2HK/b;Z4.Ed2g:#U7FNP:?c@W&X9d;;8#OBI0(5=9aTW007.2A1.#g].;eN
VScCN@IEJ-XNB>WD<)C-A;_<<+KI#(TKUb#(NC,(4YW/4C,84fYSEB1<]^ECJ)+e
b#>_&)7#N17>JO[JaG,_FKV(25#,+OT7E@W9),fD/Q^U(<N/FLNG?JL\e;),T^W,
I=d,.g8dWf:XUOJ-@B2AB-R;J&;45-Pe774U^9ML8&6[330A-D;?AV=B#3aS@206
3)I<>a,4OU[#?Q^aSb84c-NHZU#f9I=Mff4<\UIFa>32&NeED9P?N3J:5+F7O<PJ
DdQd^0A:2eLDO;cgQTN>D9G29#/#C7Nde#[:JdfG#[ca__WEFeXR0JI-.J&fbWVc
I&4++1P5Vb(BOD4T?QC5I>_Z[<NKc-Cb(#+XFBV,;Xd\L/0(\M,Jb_+7N+>4X>#\
>7AA:=.c;KKA8bBaX:8(e8>__:HG2QLaHX:NeJ^]F1Hca\RM[EaQ=D]Y/Z[X7Q8J
CJ+77PHfSG(I5g;KZ9QZ3FgWd]YV,a_/NUZF\PK\=f\&F2FGf_8S/=3F4VN2-)]F
4dabR##E)O@Z_bC&\>Wg,P-\d]_XG1:+J]D=COY37,D@H]2TSacc.G1C0AcRcI39
I>LN>;MWg-/TffB\B+5e)aWIQ6G7TH/T1b3_A2[^&N+b;a-NJC+-7d5XH?)]_,?f
NE3&^Af:dJ+FKY9SN&2HFea-T/9[[3bEVAWQQ,<>)>RE5=gA0L:V&07O]U[[W:KY
-A:J08;5443JIRF.0IFR1DAf2E&]Q,g#Jc9g;13-EOM1)?@C?@28@<>4ZIX]HYYV
;REeB,0;&&4<Cf7YAB+\AB4--PB#UOZ8]X>=a&YR@Db-@<-g&[ZaR_D[U4G=V\UJ
:;L)L6W(=9?VW]\&bLBWE^.](RAdcPHR\cJ1PD;V9AYI0V;Y/L6?B<J^7TE4=FaD
@aeK-fM\MX3gY62:8W\>>d4Kg+Z;F-EF;#AW=Td2Z<6=A2?/LBb=RdLcQYME4:_(
]ge@.L?D_NK:\cSQg^SZbA8+4[,7P29DGIGX;):Vd3_V41#V:bBHW\3_KKJUf;ce
GDS,../Q/c/S>O;e1WC4Y95OH#U:QME:CaTGKXDA(:gAR#IWZS=D@2:P+@1X5=;e
(Q#bF6UJ=>L?JE=AA.2G;+Bd^=6ZYa^Jd<=#VN)8//[VRP,9;>aBNSG0NXR04(Ic
C)5V&Q1dg9I2cg2EF#ND^?;S6RJH03c/9a_E[K-Z:5JC<X>E;1<fT>KL_[/5LR:d
QfT6QYR&LgbZU).8UN-.2#MW7(.ObE=f#[^L-eQ2@2[/_9G\J5Z&;<Db^M9D-E@9
gJ4W+5ZC)#\_aN/R4Wf]PceW:(PPAP=MeN[bI6PcI:SR>PVPH1..6=F]&1K1c=@,
fAI03F+6L@#VLB<N2Z&I[EOJf1>:e[;>8,,^gXb#H6_T.[_KgK3@#JRJN-aZZ#IC
3AB?>BGa4^:LI418gdL&Z8-4a9LIDJES&W8CD?6OM>470S/T\2ANXgg&)=_=ATDJ
f?OM:.STM.63@@Jc+PU.^6D7ZEOWLE;DE/UQg71U+bV1YS&;F#_\0-;Rb8e>-=G=
+0@O-HXH?7Td7F<BVMa8d=AcR:XK4Q9S):,Y2BfPMQcCN7R@c\WeKD/cIS,9GLUZ
MU.[b/W;_BFNVCIOIE[bA6^J;4U8dQL+X_4e6-Z,,a:?2[[@>(e=/V;YaLXQ[)WZ
L,.GY+0/-c8#MK>a&/_cX2GVe9N,QHZ5(Fb)?<dI.+EfgHJ4GCD=,b[]L^X[4J)I
OAX93eB3b:^4BUX^>>CcgN)^bCb;H05#Q1&2?&333HJTMFQa/4XHSVX1C-_>eDD9
<Ld#XAa)&CQ=C4f9QIND#@28>G/U&FKfZ:MLc0bN8=V8He#afNHV:RWP^Z,T\HJ3
B9F9=RZVG(c@1c_KZ/QOW9Y:Z,BA93]YF/8GF4-Q4B24[)?9]8M7G[_YNcZM-S_)
a/-YKV2#d&b@5[a\4UP)[>&>ScZaHJTA>TR/3Qc2ZQ=IGS7[K+J;-Ig/b1O#;Nf)
Q[KWTUDK#TU.O,?Sc.DEV_E78a-LS=#b,.aS2#OeCMN,.=G4/?KGE9>;Wbd@]A.L
O;H<4^M[;c.+#G_:RHNg9=OB3=g/S)#[<CY?8/GEIRHNDfU-&^3d^5Yac?WTIa&I
=W\.H+3;S-+=L8>BYcK1T:c]4b,&\=67UH^(6eMZU)TKcTa..P#V_Q8JZ2((M>+B
KZ2J7fO]@E)BZ3X^>:]Q_I5Ld=4,R@(S+&N^&IM,OB5Q8^Hg[0(Sd^.cV84D?3>-
7eD=T2/&EcMe\0)g8<E@91b6/_Qb26^<S,g5eHNPXAWM2F,[)-<I4Q+E)1.(=@Bc
6:6)8,W,F[.ZP:HegL>HRM(/]+<?d4N&8gY6YG^f=NDC:UTIB4O91c58JYB3/P&U
OG]0Yf=+BWb^(ggM=5;Fb]^>[F;1?aY.ZWO:.>b/f3=+3_O]L[PfZLLQ^[#Sb5K/
,_X2G[<-IA>EXJVIN3PB:SgEVM_d0WdN?FO@RTXVOQb#\/F=LN2LX_(1IO7,gNH[
/>VZ.f)IPQ5R5LU-c&-JUB2:2=Z))5UFS7R7+;ZU#N+BbF-aZJJ>OAb-]AT:/:?W
MRVT\DS:H6<J^9A)5[G8gKa:Ia@afH4FeD=/(=)0#U)bV#UBWZXLYbMR&B=#KI?e
;39^HQO;WP8bWYFBg8BWB.T1(b9NGET-.Kc)B<N;&6fc=]G[CbZBV&9UcdB-(c+\
-bUB[d^1f1XP;>A][9F>Q@_Z3Nf7,J/\6Y9@P#E&S4+H).cLNc#9M(6/Q02=gTX^
6_aC;UIJ@<V=6BVfPcKPXNIg(cc+/&>fM^XM5CebUQe8He@S2[C(ad/R2aP4\PZT
6KX._cP_d@SF)D\W(\B8U,)IC?BV-9RV:BH1KVSa;aHA#AOV83SXVL+4-IgFW#.A
^DR/\G[OK\@-P/YcYJ(GB_LK>gF7K@7e:1BMBUa3TFVK:,214G1-G72G^?EXNW2G
8^R&^W>2.FD(^5ZSX?aa3=;-=(c0fcY;[Kd\C_VY8F6Z_07D]gEHSW>ff7K@&EJe
c9[f5Cf?WVS&A0_(<-GO(#D<M-;RU2M.=;Xc3c6>Y<<(MN,Q;:7_P=;DI?#QGA3K
<^5befC8+T=[@O32BSIFbc_.dKCM0(>E/SE/CD]/GVE4I4Zd]C<V]UB:=?Q)+=2Q
W-28PG/5;g7F2[54BC0HMKNTMB_VS@GFHN:SG9_6.7[T>A(&cg(73=\Wb1f:WJ-&
7)AM,TOSa_++U<83gEFg_?VbYRSF>#1WI;;LE]APGZ7TD&WfJ7B&]I>PcgFaeaP[
;]G[;TE_2)C6Ec3#g:/2&JbQN+LMK<BT(-.d9:;54,\6]Q9E\UEFMB9XJ5TKc[fV
D(>F?6fY]X3OK+I\^L56f;@NP7fTQ0PJ3LXd(AG3Pc5#97B0\#OW)@LXK[>#NeTZ
D1;S_\::EQ9PbG9cF>(O4&:J#\APKRP=B9Rc3(]7=gTAbH-@b;/ReLPf:aIC^]c)
.;)X\0,E^,8X<ZMC75JY&DE:/8+C23PSL)9T2N.+L25fSgVfB,LW)24+J1?0=P,.
)(cKQSf7][VA6<O^#9e@BSa]bK)JHRW4C1@8V3+?C5g(LO)_E.QRN1H_7_<d\4DD
T-I0[7NMDe;f+;fZ4<Y:>Vd\L9N?d0^Ib)]CdP?;G7/07V\_#c2;VAAH4b#FYcAe
WXE.LSP;A,>#QFI:J+HZH(O3:35dE,ET:58b[eT]#WeOD.f/35D=:eV8=H6Uf)DF
dKFa2,eH&c+8Cf:?eL#4-[MCKVIK5OXB>5,VTcYAfQI5];U[WC=;,O-BG_a65H@T
EHY#F\RHbR@AV1.I5UN5EU7698.7&C++fdM/U+^2(8YYRQd;<IBg@M6W<RTS(O[6
0d?(;6+.[DcC;>=VIdL+:=)e)2H)dPDY:G/BaL+cgOY>@dD;>CNFTEB<+^7eL48K
.VaHGd#7.XEWBYSOg^Hc--MSZ4UH0@21LO:^?-L4-BHdP)OUdJ=C5.<A[]XEOCg)
<PSG&O>C(_9W6&C6U[Q-AS4aQO\T5ZJdf[c_f.PcQ<U)e=SDAR;P)f&K^W,QbK?=
#SEGA8Y?&R/LS(91H-D6C0(EYOK#7SWO4:DYV[,&+KQW;34>?AHYA^>AQVC_HP71
K[f6/(F^gWOW-Kg;\#;YJQ/J1Bf]bH68EASPfZVI_<_UZ+Y8UE,L-TLXQ-4>)\LU
H5MQ_3Md=3>b51aX>7c82-YS3,<d=YHH@-3W6aQ6acD]T[=cb[Z+W6PIUS8JS>Ng
5USM[.>\G0T]IXKb+ZUF_7Qg8TW=6eJ01_Qe\P+U[:Qf4_W4TGg+?J7^+@Dcdd45
#P_-DSI:Ee9aFKK-:DUB>ROI)E0.b5/fKIAD30c(,F6<)Rc]B_1^.J3]C)cH?bJ1
N?>#.8Nf5X8dc_09gV&N4cf2222a.T7>>37/ACS6PQFb;L,+?0PB(:/=RX[>bTNg
R;1BY@4O4Ec5X(,9:,]((\[cML=QFc,=D.MV.GGaM+W\agMaX]?ZY)9cHHWCRa=C
EP@TL7<\V)XgJJdFA5WJ.L2\2TDJQJRJR0K-02O3SKYB]3e/<cR>W)PT@TKD.KYZ
O]cMR/O)/cA&F^b802FPOLC?Ged.NC\[9,:f?5b@.FbK>8cP@c\R0\K=)V6Y#W83
(PYab3T2,SJg?CZ8/\G\&a<DMH>e[fNd_INUXcOAH-34HVC^AZ,K2E(g2@H8]WgE
D2>+E&H)MB?5E&KdgUG(GOBZ251K;g\a?5c[Ee&\M36/>3>APKdF/&XFXaaeYPaQ
\];dJ+8O.82A3AA(f>JH4:3.9;C:S36@I[UC]\Xe]V,g^e0>0L8@Rf7)J2.3MJD9
GdD@NR:Q11U,8g]D4UYEUCE931845=Y[P)GRT&KG;URTYG=5+M5CD,4F2;F\6DD1
5JF^9S]XLZ17]_.ACbT.MXGZ:196-@5Kd.?R+:PS?RU,7PS;H_2#8a89)J;WU_cO
A;N2;TfZ:2R+YVWfP?B;@ZPeC@Q8LAPcJ2/;aUC_X3]d/[MUM&@+@V@V\-?c8bgP
-LQ(^?,=Bdd-=NRIb4bb)P,DDUHa@ATI>=XXcAE8_7J:9\_T1bSfe.dQ)0ba?<+?
;R=AOT,D+9.V:U5T<d&dP1ZX^KO[Y4;A_6M>c9Y&YZFN2?AX##\D>6YL)O,cY.NH
59MeW5bFg>B7U/:5ga_=7<e9Z06gCIR_fUHXbWc6e,9,??fVXKDaIDHH\.^((BNN
OeI]XD/L?N(MT0.YRKFNINGPaC.((O<B:e+NA8ETcMe=9H4HgI>F(F?^GCEe4@5^
Y^&#Eg@-,5MD20UP^>5AN1K]4gS8@+4#Sd/\3B2B<D:6c#5E09/LJC1a,@f,IYb^
@f6\3a[4+R#NeKVLIBD:(?8bgV-Rd)MDRM6]4.1V=Nc#fcT^A?7SfBE>Z(9I9;QP
LBG7DeYcI@d(BeHH-0\8fN>3^./P1TB5,G3\g[G?=Pf@6/KDQG_TEB5C6VQ;U]/5
-f049.YZ2aD#6aH6EADJ3I2bE<Zc?-#Pc>9W036Za@ENAE5&,bBOQ,d],FQ.CHeO
&/;OIWRc4BCb+JdOD4&^2Z;TAY/AE&YIO5MJCLBDPQV@gg.II1J&[ccg<.gAKfK_
E1^7I7GAOAKeD@VeFW_5b.gL6]#S)G<8bQ=@\bGY+X@beVP(8WG5YJdFK:-&?C5S
>^&SKEQ:K?5/_<-TDTISdSYQHD2[C+/8cOUHbF/+ZU1>6WF^Z,-0KfEWVad/YFN,
0GT[-9R_12WN.-_QP\_R6CBJX+@fY29=aMHYA[cFScVNNV&5Rg5]_dCL94[;9+&0
e#Ob[@#6-:+E/#ZD#J]\.?GW?-YUK1;ZCT]gfV(_f2>I]95YGC]65QM5SF?UB5Wf
3Sg8BSYc5[6NZLK3)MP36P6][e^O(GM.>EODWYcLgg2MN80.TN-A-=DIM[[PKXcU
cYfF\6/#@A4eHae,[J<TbP7WE(E^IPZ8b>D7C#<=g?78=A=PU?<F:B:6)9#TRUF<
C8AI3:CWQ\R2a90:)ITe+48DD9<,5bM3.,J50.WVXA.XD=f.(-^87=,9b[R\99J6
T4<Gd<aD?FI\\HXXZea]g+_[:586-0@:bX0V6EWT6V[;/,/FZP<UGC/<DS5^:M+9
_?M,fX=\?H?eTV<D?<[fKT30\Y6N^29aI6.E1)ace4]QTDF:_N26/5Y6(@Bg?ge[
)OOd+;Sb56#Xe.J8EBHJ>.61/fQ#&^TCdXHOWb(R#6]<>g5(cT<C;_N9#R]F60>2
?8)@9N<J7L#.&^\YcY\4\d=.JTD84(HM[_B4D6,36?N42B7)S^+F^Ze-3=D=/J/V
0I=LS2TGJ[YHdVCDC#1@12]B8\fA&G=S[fcFS4V1K84M_/7^eZIUNc_0>DB/C>Gg
DdB,Z\\1(-4[E/Y_]=aJ1W9V6\-6Z:(,C]OOFBc?aZ1W2JXC_cPP,Y-?X)b9.FE)
E0DV71W/Q[F+Qc@R50_e<H,JI0/(;;00U48WH_#A=5L=6Q_^H&<@WDT4e?)+f@_L
8cRF2QF@aXUEL(e:\+KL?FaGTL_b_X<d:2^Y-(^DMFdg-:cG7T-+4[.FQ5MIc6X4
)gP;8.IdZZXV&D;bLd:)?aaTc38)cV&[83RdgJ7cWf[F<\A_QQ<dE645QQSJ&N0W
O=HWac[?>\QSFd5OIbeJA@SI:NbY1\<4RA:GU54GZb6f6WH[-@f)CR#1,e+R(7N5
/6IdS#A?UIFK8.0<O@24[6U-J,b>]\?Q20+0ab?0(W<[@GCX]YA:^4Fc<0F]?@:6
b+6g18[X;0EB+Z(-IbFQ5UI7aX_QLf17fZ)WcbDF#KFdBZIcd:6SeF>-IH.0-d56
W?R)2UMbAfYI#_,+a/->00b,7>R#@,C<9IcTMWDJ^P@^4L-[N5<\DfUWb6c/1f_Y
[0YNV5Y5\[;EAc[JYgdLb#^.K9S9/<Y3Y7X8>ZgD&S1a]+ECbTCWf/AB+4?WE#U)
/MIA6?)XRQ+Jcd7<<NgcYKJG_H1H@VFgSN>^2_ecc]0,CO,2NEca^HYQIM3f0bAG
N4_&a0Z]a=8L3PS;HDc[3GYCPb#D93R,K5eN<Pd1:H5W\J^DVHE/K7ZE,aM)\=-X
@03Y=R,aKR9:b/?IQ^L2JIRNSQ6BddI:HR=9d0,KA8UP=K0&8R+?[B2f\ePHDO?f
8UUD]?YWZF3RU7FUC+EP9(DegZWPUPQf=<[P4/PFW@V)cISN\[P?/S>T-I@/ed6#
H/MJfU<^Q/BLI_E-A^\ZO0f2N\2LJ3NPC7aJEIaU;DaeAQYD/IBAB,^&ZcUZ^-OX
_.0[BIQK&PRf5Xf+Ra5L_d1bIM/,fTW=d21fT[K(,a[<:]4EfQ.VBgR>LM,YZcV1
>M;J989aK&f.EK4<=)+:b9V)U1++>[#Gc]YI-XXUVYfYT^:YOb]U)A7gfQ(-Q(JE
<\FPR9f6&ae89HE1c)^]//bF&\8^@?bB.^@FgXTH:cW?B+X+NWGQQ^C9>>8=,d:&
KN0>8LgQ>]R\RCT&R\5:fN=<cU<DG?=<-6/9&YT1:C@d,f&-CQEVEd=/2RHb-5OD
#M-VG4\-->G,HD313)<.#?SLRbeF\SK1J,?E[2.<-@30]RK0b/>1YTd2)LJDA@(]
BRA#A7#]Q14)[:-@&Q/Z&MV6E,F27_^>F\WG)2bfH8E[P3#^e_WKEa+-.PX#?ebf
9fVOd\Ee\U6PfJ]8)N).ISM:Gf/2Z9[R[0X4OaM-fY<UJaCWegD-4?,SfIg-<C_V
&OBKO@I10gC(-HKS.f.PXK?I7JcTWRA4-N57I19d]A_J;WTPF;EC-J[9:^Bg2)F#
^R.=feC?M@]=c=]N@D+4VU&1:C25RbGC=J\WDIXFVZW<XL6373_4WL=X60(4.6.+
c0C.\D:<4[IfXAg/)&):DY,.ebV,BB+eG;(bXXAFg<\52P^a#YY\Xe9PFL[(9>(C
?NSaWYTHW5R7cJ2YJF\[6/^LYaGPYX)B6QP#Uf.dg_K]XDQHPL/V#Xe_ag:TF^cI
Af1gWXG)AS5,g6Y/>BP4:O]:9T)R0<)6O,Je;8#HTd[d,8PVdW[A[^QNTCNN7Pf=
\RS<\VFJc0W&cVQAR)U,CKLJKDIJOK638?MLRS_>J][;5aUb:=fD;V<[dYVOLBgM
3f7a^Xf0V]6J:[LX(B]D[<.STJ_Y)6-gCB+0WVP:\ac6SVI+_G\P,NO95^\cC[5K
1QdFH5,B:L9.3dV&Y5RI&F^<FM\FJX;0GB1M=NG4e3H-\DBM;F-EBG<NAHRZ]W4;
U0L6@>H83;U<D9-=0c,7VI0,E-G<JD;cgQ0&26L^ePQR:>JN;PF7M;2.g1VHC1\/
YaQ7:Q4#;8Ga;cd:-56AdW1-]UAINg6<(f/a5C5EG8Md&[EcK[6CF;();(K<.UC<
9AQ>?/4<ZB@D(^H>]ZS9<e>g@3\_7S\O\72.9.SD1#+9XQL(eO&3(-Z4eUbd8a<.
X;D?:7+89/,\T]4I5Y6g[Y]AIc+S_J:LR3X;<b5S]N^ECQ&d5#,/4?]B;5CU=1,3
<B4V#&5V@0L0C^fMGQ+]6X@^\M?/+B]gD(RNDC5X-2XP_(&D[)9^E?X9K(I_T\UX
R=/]&.ZYE]]#f9I[We]93&VFE]b--8[aB_1H7?;<6/SO18X_-C(2E#?SK0aDd:P^
N,^]Y(\YK4IYNA9BL6^8cNH.[+2,G7#D51MJ:^^(QYAJ7dP)NY&P,5<L#?93X;HK
=5@;/GA@W&&Cbd?,LDQFS^BV=c?F[R(aHZ]81b.>AFNWZM9e+7#BMC)U7?:J&CD_
58g_I_CMO<CO/[U+&.U:()\^G+Id<12@&D96VS?FCGG,2KC8S./<4>/PaMfA&4WE
^B/O5)OKDY);>F_0#Y_K<=HP=A1CAF;ZPKF=#g54b8\+?Se@+g0NXAEL2Sa(K6MZ
J@=F5(DD@7L;_e55(eKRC5D96^X/6>VDgJLWdTOF<gcW_7TWUW2Y3OeEa;8@LCWR
.UfYcQ)?_:?IX-D5^/UVU,RUcbg,cXLUQBb7I<QPgg&T0]5b_f3O/.Q4@C:Y_EgN
]]6A_/VP-J3BJ<A.;eBD41Ld?U7D]2=27@7SbCT/D9T[9C\BW<fRTT3ORBXVOB@e
C#QMNJ6@\&ag2:Ge/>EY]_AO9E@E)3_\Oa&N7JG^H3ecH?gR=D>SF?S#HLSA7IEf
.7:gT&PO(>6JdL/7G\50I+9CZ.X7IJS.QW8Sg1fALQ8P4TWbNT5c2;bNgC4DV-Eb
eDA316Za:XR/<?U3[]#936cD[H-^1aM-F9=>>Y,EP&XQ5C&V)I-\D+AObDddb(#3
3X6J6?]HNQ&UYQ3I;4H+@2523e^?56\aU]@-_)?^f17#A\59-H+&aff-D@:bR<9N
7RMB-eHC_=]>Zb+XZ-<ebWW+e;V@)IAMTZ89]/_KFdBBG<DfFd=1&gMf9DYF#_Hc
,O@GdLeKA+bO/)]NI+Y.VN>S?HCdde3?J4^3<d6K9O#R[34OYU&COQZeSL>C8F87
ZgR@4bc>3,2-65?V\:1\[44\7K#/\CPKS+W&^XT<OI(YV#BF[#_9WG+7O[C.MH)7
6.6FX09a]fdECPP+#^,,dTM&_\a<-DH?cVMf]cD&>,T2J]<J2T_V9AJ>DN>Ta1YF
X8#C^5,B7<^R13SE5JMQHWNM1.eF,,.#T[?DS4Y6G+BH@O/S&)Z-FdIFK#.FSRAT
a)[,AHZ#K;>2EG/M#9.[1R2?ZAJY2K-@Ze@fX1ceWcW1A)Z0)f9)fa,@TCHBEZ=,
D#T@A2+a7-\DL]aa&4Y6FdZ24,F67\J?&108b#<gCQ.)Bb&8<>Xdb7T6=F6CHYa[
bVg;BQA74\0PcS3dSG4d.J54eOCDGMC(DZd51Z(1WE<XMT#6=0SFZDY-,PC2UGGA
a5&-3393M0CP4K\IDXPW1Z3\PP.g1^d@=b=NA^e1eGZ:+.\@:L@-+Ia>3DDFRBRO
EQWEX04H=8fY+aL#P>HXOJeAb&:B_e<fTfE:cFg<4<EE6E@ERJg<3^]:d&fEZ<gM
NAS.H0S<f?6YMZS:G3]^@Z]\+B3+1R1gc3[aGK<U@,X333\6.4&Y;8WJcY2ZI19Q
/M:OOR7S<&/C4@;I;ZK1)919[5Z5C&:F3I.J35+\HUTL/WNV6DE=GXLI;M<.cZeI
0VDPcE[ZII/+?I8c5LO],/F4VSL84_(Z9;0[KS]FFK\bb&c4^5L/bP_Q04RG\eHF
6--<DO2X[E[ePYRZ#f90Nde6,70Ncd_Jc72f^,=g>]F@GJ2GSEa1UX2[0:LRH#YF
75AedLX0?&/ESN@,>ba5de=\1@F1C<Q/E,3+0?CNe4CBDa0U.?c4P#5K5IM,BZ_(
4VLXGdI=92G;U?93f(.N30Z)544G8c>N5N=HcU06^d>U1J3Xf_8:C\RY_AD@d2SD
.AIDSKF2FFYJaIc_WgD-90DXBIa#Fa2+JMX=;MC7HcO/YN^AJWI4B#bDVD5^5Dc&
L-L1_&bQL&,cCS=a98E]F.f:a(]I,[9NK6fU\[[78b7RM#OHd+bWEe?3gZ)QES]Y
cVgP@5JNF8^,.^1bD=BS8ZefdDd6DO.5XdB@UW?HM)_4^MYRC/]V2:fA138\5JEN
D1>]dgQ(YB\RLG#9(7^J.TeB(P^UQZ7/:&WR-#9\D=2bRLPfPeJR&F3B<;IJ@?AB
)95C7M\7f^U^dcHcRIZc;3/ce8GFY^a)4T@gU.e>,EZG?aAD2P,_6Q,Y-e6:EHP\
=EF@K).I1:/2dID0?I^fRP;8dO@LUL)XWMD8^)K,C^HIaP]Ee(@ca0<UPeEf36UD
F\TYJTW>]gR+IfTAEWG)d]P<b1PMX:;9BR;Z0>9/c]TJ<G3APJT9.NK]8QL>.[9@
c+,0gH8HL0Ha^W&65RQ2J&L>P2W-RPEA-6>T9Z0P64-@#_ZG=[7M&3#=^]-E(2#:
gJAQ0X5.I]YJ;T)V,a0DY33?gZ(HV:=#3ebYRM2P4E9;N?0EFf#I7,=^9R88@ag=
E0]-E=bDdF0?U(:WgFbQW7PX],9;K^6C.=/P<dbO[3,=cM]3=3+^:d[I>?a_+/6X
70]NYMU?@7X>f=?NS4bD#0:6SC=79T+cT6.+?^U(c#cdF[A1\9WA7dCCS[C\^8c6
WN8PT#4UA^PNW78gEVT\TBK3S@?##^9f+7XS_R52.._OT;E2g^Zca?WHG<R0;fTe
E^:/H:XFX)1(\/0ORR,Q09X#D@52U>UfK]ESP&Va=LWBEYe5Q/ST_@\Y7AbDZH\g
.=>OGf-N9AXG=f7E;#U[bIDgFTOP_=.J=<##W;.&5RW<3EK>.Sd5/5d8]M3D6gW?
c&[59:7R6_b7Z,D-H(+X:@L?-E.JXE5-&UM&&GU9NU9?>&T5FP(5-/^^_+8)USdF
#?./^KU>,NJK5KF<^J,A=3X_,B9,gY-L.+V?1aN[c])gM-1eSW>)YUae[AI_N.R2
]a,YA0M[:Id2,Jf>IJ#Ye6B/U@8[.fR/#A,CI1N+P4@b++]XC\BFQ@3)VY2bc(@K
0f:/SOJMARgg=4Qc/)F>C0HD0<a0PSA,+W-#b+Qd?ZM)M\F-57/^7;<bUF;E3UL[
,+AH0M<\>Q+);@5405LC]6B>YO@9C2VR\=Kd3W^-?C,+Sb8Vb&WZVg>)9&0@D,=X
E7+)K3RT\:.G2dC1DBTDd.#:+@NYN&gU44d^C]_f.=EO9WaSDg25aQEB@@GHM<Wf
VNQG0d[NX?DELbFFBfK\,2YcbL-6,+c^@(W[F@U>,gXJV1=_J?AbgT>-X8bfY]52
&BIH^@?AX.#4aH-Cf)-G@?]4YPb#<6dL+da@6,]c(Ob4a57/O>2B,4d]HcSLZDB4
_+PLJ[4+32D\OA6Q6UY_Bff7&452-?Pe9U3a+W2Y6TW8-]L&U7S<f?)9ODWC.[O@
]BNKba83A#6.28,16>1_(KHQG[T69-B)cfY:#^Z3]<113I)d/[,+W/=PJF4W?:,g
O@BADK#f;fE,47G7^T<AHeBMHA\M)PQDgT[N\9Gf1J_Q2E6>HCH,R1V:fQg#MNbN
D0ODS:;0.6X)FR37E40BJ6LM#MC;HdDHSC1>4]H(>=dF\R&#\XB<[D(X,fNRbYX/
;)/g]B_S<,R5f_1TMNe>^#QU/U^7K63R+cg]V)\+)B;RR=>PB0Bf]B\c=58eUA<Y
.8)^Z1g;IdT&N1TI)ASUcR6Qff9e1=0U#&3O;,9LPF+b@OPg/?[JL4#[g;aRDY5E
8N-HWCB#I\R21WH2/@._T4+\&-eVCCYXfXP6^8)cWO,1_4KdcB;=G3-_,)UJ=9gU
P>EZA2E64V]BWF8_-O:cDB8b)6^#b,:fMIIEEbc4ZN-]WYFGA>LNG9_+1^^P)_(#
?1VI7)<DELc7(G02.#8:FO[Hb0G0O9YPI<^8&8>2f1E(ccZ0@I[Rca1+2B()c-H.
^F#_SK(bM5W#\?1a,+dRa;+XF08/)8KEE3LCS7cEOQ6/GOSNRE<(LXHCX9VH@4W8
?3C-V&-a\0X,+L=T+@>CF_YD:e0/eD^<3bOL1):A)A#+F,BK6?\_UdV2K(;KGN=S
F(.U@c8XYLe7FIe/2MT1#Ogd?If,+\46;:YRJCa/:[(,_@G2WUFN-P558RHg3XN9
HGcF)D=2XNXf1_2+EP(AGA#58[IJ,R:@b46H=;H#X50P>LF7Q<7?6c9F4aae.f^#
e6#bW,+CDVO]<M9IeCF3W?#56$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_DDR_AC_CONFIGURATION_SV
