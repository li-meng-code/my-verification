
`ifndef GUARD_SVT_SPI_FLASH_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP spansion Nonvolatile configuration register class.
 *  This maintains the copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_spansion_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  /** SPI Status Register 1. */
  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit status_write_disable = 1'b0;

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [2:0] block_protect = 3'b0;

  /** SPI Configuration Register 1. */
  /**  
   * Determines whether the protected memory area defined by the block protect <br/>
   * bits starts from the top or bottom of the memory array.
   */
  bit top_bottom_protection = 1'b0;

  /**  
   * Determines whether the BP bits defined in #block_protect are volatile or non volatile <br/>
   * 1 : Volatile   <br/>
   * 0 : Non Volatile
   */
  bit block_protect_non_volatile = 1'b0;

  /**  
   * Configures Parameter Sectors location <br/>
   * 1 = 4-kB physical sectors at top, (high address).
   * 0 = 4-kB physical sectors at bottom, (low address).
   */ 
  bit top_bottom_parameter_sector = 1'b0;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_data_width = 1'b0;

  /**  
   * Configures whether the 4 KB sectors are grouped together or evenly split between High and LOW address ranges. <br/>
   * 0 = 4 KB Sectors are grouped together                       <br/>
   * 1 = 4 KB Sectors are split between High and Low Addresses   <br/>
   */ 
  bit split_top_bottom_sector = 1'b0;

  /**  
   * Configures whether the BP bits and 4 KB sectors are permanently protected. <br/>
   * Note : PLPROT protects Block Prot[2:0], split TB, top_bottom protect and top_bottom_parameter_sector bits from program and erase. <br/>
   * 0 = Legacy Block Protection and 4 KB Sector Location are not protected  <br/>
   * 1 = Legacy Block Protection and 4 KB Sector Location are protected      <br/>
   */ 
  bit permanent_lock_protection = 1'b0;

  /** SPI Configuration Register 2. */
  /** 
   * Indicates whether 3-byte or 4-byte address mode is enabled <br/>
   * 1 : 4-byte (32-bits) addressing required from command. <br/>
   * 0 : 3-byte (24-bits) addressing from command + Bank Address <br/>
   * This also depicts address_length for S25FS_S device families.
   */
  bit extended_address_enable = 1'b0;

  /** Used to enable the QPI Feature  */
  bit qpi_enable = 1'b0;

  /** Used to enable Reset on IO3 Feature  */
  bit io3_reset = 1'b0;

  /** Used to configure the Read Latency values */
  bit [3:0] read_latency = 4'h8;

  /** SPI Configuration Register 3. */
  /** Control the read latency (dummy cycles) delay in all variable latency register read transactions. */
  bit [1:0] register_latency_code = 2'b0;

  /** Used to enable the Blank Check Feature  */
  bit blank_check_enable = 1'b0;

  /** 
   * Used to enable the Page Buffer Wrap <br/>
   * 0 : 256 Bytes Wrap <br/>
   * 1 : 512 Byte Wrap
   */
  bit page_buffer_wrap = 1'b0;

  /** 
   * Used to enable the Erase 4kB command. <br/>
   * 0 : 4-kB Erase enabled (Hybrid Sector Architecture). <br/>
   * 1 : 4-kB Erase disabled (Uniform Sector Architecture). <br/>
   */
  bit enable_hybrid_sector_arch_n = 1'b0;

  /** 
   * Used to Select 30h Opcode for eitjer CLSR or Resume command. <br/>
   * 0 : 30h is clear status command. <br/>
   * 1 : 30h is Erase or Program Resume command
   */
  bit enable_30h_as_resume_command = 1'b0;

  /** 
   * Used to configure Block Erase Size  
   * 0 : 64-kB Erase
   * 1 : 256-kB Erase
   * */
  bit block_erase_size = 1'b0;

  /** 
   * Used to Enable the Legacy Soft reset Command. <br/>
   * 0 : F0h Software Reset is disabled <br/>
   * 1 : F0h Software Reset is enabled
   */
  bit enable_legacy_software_reset = 1'b0;

  /** SPI Configuration Register 4. */
  /** Output Driver Strength */
  bit [2:0] output_impedence = 3'b0;
 
  /** Used to enable the Wrap Feature  */
  bit wrap_enable_n = 1'b0;

  /** Used to enable the Wrap Length <br/>
   * 00 = 8-byte wrap   <br/>
   * 01 = 16-byte wrap  <br/>
   * 10 = 32-byte wrap  <br/>
   * 11 = 64-byte wrap
   */
  bit [1:0] wrap_length = 2'b00;
  /**
   * Selects between 1-bit ECC error detection/correction or both 1-bit ECC error detection and correction and 2-bit ECC error detection. <br/>
   * 0 = 1-bit ECC Error Detection/Correction                                 <br/>
   * 1 = 1-bit ECC Error Detection/Correction and 2-bit ECC error detection   <br/>
   */
  bit ecc_select = 1'b0;

  /**
   * The DPDPOR bit selects if the device will be in either Deep Power Down (DPD) mode or the Standby mode after the completion of POR.
   * If enabled, DPDPOR configures the device to start in DPD mode to reduce
   * current consumption until the device is needed. If the device is in DPD, a
   * pulse on CS# or a Hardware reset will return the device to Standby mode.
   * 
   * 0 = Standby mode is entered upon the completion of POR
   * 1 = Deep Power Down Power mode is entered upon the completion of POR
  */
  bit enable_deep_power_down_upon_power_up = 1'b0;

  /** SPI Configuration Register 5. */
  bit ddr_mode_select = 0;
  bit octal_mode_enable = 0;

  /** SPI Agent configuration handle */
`ifdef SVT_VMM_TECHNOLOGY
  svt_spi_group_configuration spi_agent_cfg;
`else
  svt_spi_agent_configuration spi_agent_cfg;
`endif  

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_spansion_nonvolatile_configuration_register)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the status.
   */
  extern function new(string name = "svt_spi_flash_spansion_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_spansion_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_spansion_nonvolatile_configuration_register)

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_spansion_nonvolatile_configuration_register.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this status object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);


`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  // ---------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

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

  // ---------------------------------------------------------------------------
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

  // ---------------------------------------------------------------------------
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
  `vmm_typename(svt_spi_flash_spansion_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_spansion_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [1023:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Status Register */
  extern virtual function bit [7:0] get_spansion_status_register_1_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register */
  extern virtual function bit [7:0] get_spansion_configuration_register_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 2 */
  extern virtual function bit [7:0] get_spansion_configuration_register_2_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 3 */
  extern virtual function bit [7:0] get_spansion_configuration_register_3_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 4 */
  extern virtual function bit [7:0] get_spansion_configuration_register_4_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 5 */
  extern virtual function bit [7:0] get_spansion_configuration_register_5_non_volatile();
endclass

// =============================================================================

`protected
>1P2UL9&cV?,90133X-5S:FB5M/IV\a>+CY1CB3U>+?U+])Y@^4#7)bOa:QT&Gd2
a0ECM8-:)RKWFL.(57X5Z#.;AA]]#A(bM@DI)SIg-8KZI]LV-_WA?bTEP=QS=8M0
:Y5714g2+A-4=Fe7Q^M+aGX07W3KY>QIL=KU^^CYb+VgHP9:D(cGSC>?,Uc\78ZO
R=373-M^BS0:&2EFY:gQ>-J/AV\gIHHDM/CE^VS0?QI3#,#C97W0MM.A2SP^UDY8
@1=f)DcAPVFF&T]J&0&EaX-[Z3]1[YTXUZ^-C6=a1<2KG<J4N:@Y.QM/.28#&L#6
<8(JK&D@\=+<BRd->F9<a.XX4KJ\M<K0]10^49I1,IgG,Rg&D;eQ?T0K2SHB5bNC
).?<C],3=JA9UBUXBH<X?X?))WaS6ZUYW0CaFbEJ>EG[d10Q[Y=J?Z3KATT3@SKa
Q&U3b^NQaNVB#aF)_TRE;FV;21dM:&G((?SGT_8V#8>Q[T8LFGMV7:UcQ(FQ98&[
@[\5PE[@F4<Z[Md@3N5/R[H3KSZgS8PdH-3L08Jdc9F[5=P&bBfT/@bV4=&R<UUS
__K\I;R=YK(+fC:,Cg:a5c#UO87AaBJ\eSH@b@VM<\f7P=Ee8-URM):.a&Z4<;FV
/\Dg2e9H^X9]Q<GTQZG-\L?OXKc#N,\H6EgZ7_EFEOdWZT?]Y7g^cgIM1?GZ^7RN
):[[8XI2#M0H0_d_(1b.LVOSV:Y^>/Nd2Vbf2N[X_I:e>NWV7@)K:^Ne.X+=40&f
.G\FaFT]QZ+Ua)GF17?2[^cM=ZF\EE8;2AgPI7E=O7UeH$
`endprotected

   
//vcs_vip_protect
`protected
I0[RB?_/[TObR#/--N2FRCUJMdX<WC_6-+1_<VO[A#1TY1W:I]2,7(FAJ:,KAWF8
V-#XN\UAH]]UGN[c@4<^G5/?8AS]:dH#6gR]\&>ZbKOSd7N]Y]Y(?[3=We-CT;>\
X5B;1Jg=>a5b)NL2.D+X60a^+_ec=)2B\F+SYb9Z]:aNURZ4&ZVeLa,(.VUA4A-N
=K[-?cFBP3V4P<MbM+VI=RMZIOe(G542QL\;4SgS@B?+2e]A>-Ba7\AW_QFe>[43
VD3;6g;VM,OTL4Z/=,_,,PXE88>7^Xe6MbL^dW2MY_]#<,LDLc1=K+VZL@W&QOZT
2GS(HG:d:WJ0ELF_Z-YJ]<&O5e<@1,\+A6+?MDOC_,&@B_ANJ33,2#ZW:/2>Z&>Q
S@5V39cV@37Afa]/_FRbc3=:<XR-NT-YWR[5<OCRO)H7;..ANE1C>>_d&0(bUXfN
Q\:_YP)@R2^+2<2V\5DUU0acc3=8LWCT<DI4E7C>13aJ0dRK@F5RD>@7db??cM?<
b)\X9\+a@Z.R7V0SW&6>?-IM5[G7?4T[4eCN/I[_7QTVBc0:/f_B^EG?173V-b4N
TeP#=8)TO.F\L(a1Y9TUY.AJUe,X0?a(cGg3F3=fR+V]KM&NO]0gBP/_#P_Pg7a/
W:<-Z[EL+&GNOcY_X9PT/Y5LD1:CL68/Zc]L^C2MbJV-19_g@YW^dN+-++C:\,?)
eMgRa>>EN.\8g3Y?Z,g>RAd=A,+[_0A<7V:Ub9C?<F>Q=S^(;a5L7KRQ^WO2ZQOC
YGf@-]e>]@.M:2GVB0VPEJ([MUMXeaV,3-G4,UA1N,RL0>MXBGT@,Pa_.ZPeC/5c
XICc#ELFeVE.FccK&e-b_Q25Fb;X[WTc1BI5]Z_W36f_G,b5:d?0=ec7/4#GfC5=
f7T]aRY(/+F]d(c;Q-LU3JJB#gT.#B]cc2JJ3(Fg7;AfUfW82L3+(&QDX5P97,6R
JSSS.B&PB[>JD5T4_.)A-VIO^EMWEBg2bCEa+?O.4#DJ[b<6)1GC#WXV>K7S[M_&
g5^dTVQ09:S5_(b.<?Q:[)H/?d@e,P-A18FQ/N92fd_3H^[8Jb.G4=b3B5N+:&+1
10)Zef_06afYI8;(bIQ?_S.=S6EK7Wg@@Cb+e)ZeXR9#O#[+4.X@BFf\MgV-S<M?
CP/C<IY6+9Q)8g]CL+3#57AOWK/KZ_Z/fG>K1-Rb1RP^_G,KERURae5K?[,-IJ@_
Q+]Ub&-H<@5NGK,XUNaX^YC6bVR0@^aeL2_a;^K]O8O6^g5dCXVf53#;>9:>YYG=
JQScdPa[K/1aJF=fZ0^VI2.8;=-;?&GaSWDK>QFU)C:]K?c6@?[#?JcBN4F_]N]X
VV&Va2/8R?9OS<dG.aa\b^M@:_L9>[[fY@VPBQ(T9Xe;5?)_-WYP?O(8<[c_,P6G
eKV2)>a/K\P:>3.5HUY9M[F+^ZC>23QRNae5c.a\_\7/W8TKWIM+g&=(8A@Q&XZ?
OROMIDJeT;@+AG\a&L62;(cMOFNV/M(RMAdUO]MMF8d1BbRE.ZeCNB]:\HGb2cTV
S;gBJ6NR.Gg^HB-11/D+XN(UTQDU^SX4[BZD52&.Q?H[(ENN:-J?.4f=aJN..>KO
72E3;^\9X@735>06gXC1T1,^a[#@3ZL]QB\XC-[Ya4@_;RCW20S,;+1LNV&+R-V;
F]@B7&2O(-T3Aa.P?K9QS]bB@f>P:S5a6P?[-YAA4.-NJ].R5P-=DUbU5Pec&@2L
;2e/TO2Z=(4=PaQ7Ab#dI[HLGe+4?:1Z,;U\/IgJ:7-&Re7V8-7HYP#ZNd;4X7:)
^=7N_M9H)AZH1N:YfR&IL+I<=Uf52&ZGZ&L7YD&V&<+9&U]NdB]VD--WMA(gG[GW
TH#BeEU\PBH]8MOH#5VB3@D2/X8&4WfS13:>^)g_-Q@:3:-eY-)EZX[Z:fT(W4>5
P#WX7SOA+Z/78E]S3]^A.4;W[39F^V&_1_?fC-=S.NBTGGOY)44[#:UCb(,X9;e^
(aK8C0R_D7fB^H40+e(bGaJ;_3-VF-.-?F+6KQc^T_I61_Q2D74JNNfZG..H7<+1
62T?/AK_#YcCMe>&^4^-B6Z8@]#2(J1,LW0:T.[NKca-+3.9W(;Y/A=g4=/9DDD;
9[c-E9X2Ue/Sa>)W2(PUP6dQWb0::31R@<e2]=0.,_3gX2d5(7Re34-<,?S\@OF2
J]I<,-d/)YBXJBT);3NGE;QX^Q:f)KCZRWE?bT8Z5ZCJcE0?^U^IKZ),U9G5d3aY
F6N>#.#KBJ<Y(A6=_;BA[5eILX?MCecLQ>7#X1H\)8]Z)V;2c7b^/8M5],A2^\U@
V=5/7#QQK]G7&=B3c[DC)gJ7gM)@)+/1-WcR(;Q@C&\)bWI]+C2:.EOSS;;e1PJ)
T_TBVO0]V1SZ[G65FI6.^1BS3,X?[[@>=,]d7VPR^3PIA6cJUXMV>R.K<.[RYE?W
gRO.Q)VT[5&ede&DEA,1G@R.C+XNfKg-X2HJ.WWDDIWURH2@2EW(?9#EY^ICa95?
^BX=d??^Ma[72H4L,HfeUIEN8\VT_L()5)N0S,)E5^Q6UCX_DabH,NE?Dd8bBM<9
SJZZI]e>Q+822)7QUR7d1Y@521bOH-FV_4E:Z@QSACa8_DG(@&;8;He(D&7)[7Xg
/3/M150]fgZLPDCe?)1Gd2\_EO.>TY7UEG,9]GSf0^\>@NeWW3(8;D6?;H[a=7.S
;7>B\7E0AK.IRQP.fIT5S<U=P)XfYKTZ>52cNCE>9E@^(CA,#+TU(LUKE_>_MM6&
T]e5PbKPdUZ&S<LZNDfY(B=5NWE1(1;V)MW\FDRc=8c02,POZ#QVMYF#P@bJPI[P
a=b2;_ZWS.)(O9]BP\@R.0f602&:GHR[2QU3YM_GWDfOLP>4/.1&+O:cZPPB?]2Z
M+1@8_agC+-C61WMV]Hae<)AM6K.O+?\].P0gWCXKQ&EF:&IQ;c<F6=->RTJEX#F
E(544E2<#J3\eB7P[7e(bVa0K8RZSgSS[OQC>/+3LLLY5NG<Sd-7TeFN=5XV1)T=
@3@#VdGGfcB\?\cM6Wa8I++I91]4N79O.IPbIKNISGH\Z_MLAd]ZNKAPWJ6MI>K3
cgQ8[g&FdUU..<@B^ZMT/HaUYYg46_b^gYY:Q+7WBC>+g>:E-2X-##W+&9ge.C,-
K,b5@_dNF^RQ4TI=@e7Qg2X;(3\<F8GK91C;IPDK2W>>U^@&XFA:AG)Yd0C/GTY<
I.Z^MR>d)R(0GP7E+GSd8^N_#cH81IL-LBLGJgBMf#b_E&6IJ<18;S]=a(Md\H)(
P5c1e-DdHdWaI6LTe/\SK>&a4&c@Z-O#NGAbXCOL=b<5S1=XTL@d8DC<(G(KZX<f
BIR-03D\J35.CMb;gK7gg[:MO8P+@I/_\0aO^c[F2[CP:F<6JC\X9gN27<dLRY>L
1/b^DN.L<OPKVJ)V:4UY\-8:c&X_b<:(\Af)0;-/XJdJN7UGT=^eL9A&b90HJ=-]
eWT;.S(X:=0GJGGE]1]4e5;afGA8+;C<R.]&GcO;=#V3AO^Mg,eOGYP9-X[fLW]#
,eNXTUP.#KJEPRXeFGVf.[4^9BHWF^KGdH@S:=]=-2F2+eE06974A^R+C.0A8F3.
@B#^8P&T3+@5VWY?N>eTLHC=[dL8-SU8A;4?QNC&Z&C9K:PfH.KW+bdf+T7;FZ^X
-P3V.)/RVE@(1@1BSW;]C>(_-^eNL)4b1\B-8)22Sf,UGcRc0;dKa[F+UW\M,5S2
Y6bU;DY(PdGS35C@dI.VTc8&?ZQcZ,BL?\TG=MJ+-F(eE&6IPQ.\Q8LD-=_-75ga
MV?F&8:.U_DM5[F\?H3V>?+S&C]_S-&1BZA;JZSGQa6R[(\^:Ye_=&LS+YaOc[d6
W8+VX76IDQ&;5C0H0DKKbf7#<TL^>D[<1G?B6gQ&R3[UNG+Rd+RPSYJ]R7O&MIAI
KTA,RC@HeH+_bJcI;;J3TCEZ?KRdcA_@70?K&\^GDU^5TOe\,[3^[&3,&R5g\W5V
Z<&UDd\CV9@X2S?T6/#+CDda+Y\.)1^2g\a+Q)3=_Cfb5^^OcOf9c#1?:RccMN50
ZUN[8Z;AI.CgaE@EAa,Z5f,ATKK-,1:C5NJ/Cf=5Z:cN5T]f9:SEDOe?7<CC#IA\
C8g2IU&MA30+1B;^5WWE4E<[WZP6LF3WD,)]6Fdb6b,DEB?0a(:QRD@30M5R2OOd
.]_1B\c5:g5g<BRc7Z]8:YQgBYJR3I6V)I<X5>[b)F(@^MNRLQ#0NTcIZ&K/69,7
E/XGH;;6D3,;^(e33e4VM1SgW8IcE-0gZXEeJ=OK@4>E[LMV(H#UEN.(#62LEBe=
.OOMbX/#/W0=eC]D;[ZNHAK(dEE/ES5f>F0)Q=/a-f81bXPU54,g4L0?4Kg)ZZ:S
<bLf/.4^H>7CCN,?Rf+4Q6DL;@7Q(=]fKB;TEVcT3&1\)Y;(3A+O@<1OO30Vb,Q&
aIH&_WUT;QdQBKRJD;_H#ZgI@HH(=.Eg4S&Q0-2:-d&KJKVe2RO/#B1fXUW)_[4O
@LB4,@WAc.a935<DIFS#5:WH?;.A4/Hge@BY;#a85_=LO\O^-.5XKWb3U)[B[W-)
/ZSA1O=:,_70Wfag8P?6F++0P>5FX8VIHB_J>[4+S.=\cEA[258&O0X;>Ma8[8B<
B[<^bU@8,;A_\dG-M>4:OFKWa(8Yd(Hb0QaHf#=G(X:5\aJc:WIGI.0<Dc6O__8D
&K7,11EOA7:HSOcJRS_M5(f=O_J9@9CI-,S,-KHcWH>N,@_XX3U_SBM(#CPSbZI)
C3AIgF,41_<A?D?\4[=(Qa5&0SNAaf^03S#F@cCKC,CA;<I;-=C1L^H-=A3F_##8
a?5@78N+f52/U)^_G#QRe3DL1+CRLa4)K\[1=KT,W0N=U.U2K\NBAaL#^[4K90ZH
^.V63]gSdWZOPU7Z&YXW[MK.S?3Db)2HBZ,]gQ\,.@NgdAfFLT7<KA#AD5e<40Y)
=d8V?EfU6V(B.MVVI(86VC@TXT^ZR>:&0DIZ/f0Tc_3_/Vc4K_@UA7M2Q>_.6C<[
+@GPEME[X6OF_L(K)__8^<G;S.Z944;]3/WE8LM-44@#F1)E.KR7?<VZRC^>]@e4
aI,]1-N4G2&#eQ<)JT7>8EN\,aRHDH\&1Z51:[+Y9GUIbUd[.W68J67^bCf-I(:c
_;GV?,O_0:^])Y(5?YL_+YBKM-+C6Wf-c=\&#.-VYZcN-(cg7>T)3XJ0)B4=?7V3
7/W.d/73D>^KG(V&5g.d00=_)Y&0e8E?&eC)(1:]9+Ie[f^(1MLSB(X3XX@cCcTH
139b12P5T+RSQVUXBE6>1]1#HC,)a)_2VP[:=e>_B:9=A@0JC@TH0FNY5&P;(g<<
fG5.,geI&WFe2N2V8C_b)=P_:2,OM(IF=X@7&fVTK6AEMI,-DAZ??E6],PL-1?e8
[@L?93FWdB2IMK/3d:;QUDAL^aTA^H7T56Q1V<G,]Qbg)7<gb>.2D?.S5Cfg-)Y8
P@Z4RZ4YBVbgT5/@dM+,e@TgB(4=Q,2CB<CHbR=PSRN_@ga<.5@#K?E1bX+^A;7W
gRbX=EUB#7#8F\F[]0E0S-ZZ0,4Qc:E@Ne,EQ_O>g&2I-(cK37MSNKNe3=EL5>:?
]2&C_SGKe0bTNAXHX&AWYLCJ/XO^]U@P:)(@ZM+6]@9O?1f\6PFH1NKM\;S,#EV>
A[[RE.,:B_L@7aKWBa5H5WLbQb/dVI)/F&0Cf(U=[E0BKc2()/J?<A2Sa@U2N&;a
JK?@^<eSE;g9[JSBJR52THH<D?(VC1:AD.(H7EU4,eY:);IKVd[WT^AdVdH+DU:2
\/c]dHcEFffBX?4[PcFIGF3WU5dUE\#G4c=ga0ag0,52MT7.&ZY9)gY.S2N?fe<_
DT2Xe<@DP82Z](6-&BB&11H^9BBHE<cdeTEGM#?0Q^c5C.XYb-P\LR_62+MEYD.>
15a\ECH#[MAC?O[^26aXQUX]VC<5A+/\[>OA<9LQTTY@e?Td8C=I5^6WBRc)WLU1
(8dR#)AK>-?f:db_+eYSC>/<W@BXXIUcI/]>RPc;dGCe\6Yd;fP0R23ATI7[228<
OEY0b1@E\^11RV+IC)SD09=O]Td+?bV_.S?1fd3JQ(VY)=IeF]DL,D_YE.If673S
2JbH=Za(7cOKTJ0a9A6&NP[UE0/J9MbIM[8R4bG>U-Y4.^8D:#X55[#8d2>ISfU:
Tb,da264.CA<H@:^1;HSb-1PYGTYM8>O#N<1J&PYc0X:K<.Xe0/#?#MJ7JCWBY)d
U?;[H@1L4IddH6gUUL,ZJ86CK-T8;-0_W2W1?1I5VP6dcg_>+gR1#J.(E7:TeZ<=
&SW0YdAGe7WCgB<UZ84^a5G1f3NdBUZL&+V<:HH-PUGM@M35F8//7NFNFBT_35]M
8V847?^gZ9#:0-1R:#[O)bX=041aMJI(a<)(4-EfU7(G/EGW\=;Z/]@1J5HO.7Qb
89bD4S19N0)1MRaCTXP[5LeF]cL_P)9HPJfG,Ib;AI9KXH-:)Lg5K=QPZ<Q\(&P4
a&SET6=J5UMPCEW9>BCNDIN3?]9NO^G1GLJg=W2fDI9e8,;72Od=4b2^C>ffIY0R
)#H(64)fg=I4@d,,#F14]YWRW[GYIY=e@OZ(gQ8ELU7Z>6eJWe/DFfZ;@\-X]>-B
Z[\(Y?))8G.M,BC#[+DP7]dG7OH5b9CMX<<M(8A9GK:]>faeZ,acL5Q&V3/,B2dc
7Y3.-VZ_gD<:MZ<,#-9,TDGCGgQB>353DbM7LNBN/f2CO;)Jf8]/NPV?-&XT=Yd\
\#d=A5F=)2#>G5D)@HK?KWUc2:.CFV0I.LEdI@_]Z/BH?(K.T;g(Nfacg?e7Lc7)
6HVF/@-J__?(=(7Z<;a/J3<XP26&a+a[2@D=>.22V(5_9/HL-]18e77;PM?;1ZfP
6.NaR20^MCdRHYLH@?JO,<)Z/1N7SB]DFKb\.Z7[#0#Z;+)5I5FaggN;A:HGLAY8
]R_^c2\\NaF+#:TBIDGe]bHDEM[QD1_c.bB3g,4a42SZ2E_>5.aNO4^YWf_M>OPN
GNeK);(gcX#a=7F&gZc\W@MBD+G=9g8/:+c/)HU)&.<94MgY<#HAXb1F7)b#YHM)
#R31MOQ0]YNgG1^F24QO:(B<1.^UD[HF_BBTS5N^QOB6fKOLF\2c?Z\\[G#=E:4F
2/#XdP=a>Ya^U<KB5FIW,L_IWBKBXC30LBZU2)f=SV2\:3G8=1gF_7fCJU5.DHdF
O-1O]ccY;U,WF<&HEbg#)]4ASZK-GDU]O+QY8ZZAM[HOI8CHI3C>BD:7ZJHMNVZ/
Yg+M;W1aQ_;<,6A&&0F65>ME9OLK,cJHV?cR<-,DaX\c.K:G.43[De;c?FLHL7J0
J0D-QP+<H[dOO8g:+6_I_b;[>]I\/0Y0P+#OceCQc(1HZBc8?#Z4W.[_5]dSNQ60
\3L9PJT;afDV[CQa,:eMR(YH502551PZ:D0]&;Y0=K0.?/Y]=AMD(ED1VHC5.(b@
L3H@-X:H\TG)X=P4[R>;_#RBR#L;TLO_D@0ZMZC<Q>3f[9<F,-03eBf9V/e]O1K0
LC4JP=YIONf99=>_@a1I1>@U]feSMTLUeU]\a.N.FOfO\#XC5^W9bX@CGeS@ZK>+
Db)]:G#[MATA(+P\[gbMF&ZI1B&\cCU.99;]^F@65Z7?X#QHAbRQYcZ59Z6;.57]
C;VHQaC(TR,I,]+VYgU;-)Z016QDYH]25L6)K1b@@_\1K7fWZaZEXM/Q6&VAWYA]
34b@PGL#eC6cBfB@bOOeRR19(J[1R1MREf_]ZU7PMf/Kb-EL/AJ)Y][T,]GLV48&
fHc/2#eWCK7EH/e.Uf&+4O3/(]JS.@.JCNO7Lf1=AK+H_TK@YII73:)FTJ)YF(F:
?^Jg^(+00e:d=BbRZL:c5O-1OR>f\^#QE1X=&[2\@2b;N@@KH[C>+?=5L4IOF(S#
ZaY=H8YAWW7W(-dGTBN&>IX)8-<MQAa:[W[YPM5g^.O+/fQ3^J:DM+eDgD7P:=JO
ZMT&U&>]PT\?3[bO)c@CL\UIEa9X](_>_,@CI73M1A.aDP:P7T/>_]PNXcX@Q7e8
.ON[4XJX(Ie7/Y,YRg(d.Mac4Wg2=Wbb5/IgQOUPXJZMW2=ZQ5:^G]GHLN)\WYIe
RWf?9ZGD_@dWIa[&Sg86JK7^gRQQO+WQ@S8B45AW#a:>e,gR:^7J[X(fN#gJH2B#
_FG>VQR<YHgJITKYaC8EZ&00EK.204Oa28Vb4U_PRE8&MLC4DY:WH1GJ#_Ug6V6J
F=[J7#b&?CPSMFEUYgZd[A;60a]HSADD:2b=Z<G(JR,Le<86V##SGURDA<3D+E6U
+^C2f3g@(\Z8c\@D^CAXW6VS.GZZ)d/^=(M<ALf6]5YO3W:AD7?HcKUDW#>H;JV7
E+^F1)Z_b73VA5dY)67=I)QJddgLTE7YeZPDeVJ54,Va#->WI[8#Y>H12a<WA]T<
F/E7\4E32<_ETIN-:NZ./\\57e&2+/<d[88>..)=^^HAO:bZ&40R)A)T#R.UWJaK
GgNd1@&_f,be&B(AJN><GeF&;A:-&8QY60OOQ1ffcCD^XcF.X]WAW=(Z;/VOW=IX
L>@0bO06\;#ca>fZD.NJ=#>^I(HLYc)3;5T]f3D-J85A@<6Zg/:.W0PVE@#gbFX7
ef4+IaW>,8.+LO26(AI9TfCF5eUWJY_/>]IY&^[f2NT9\:SJ5a8PQUK#YDB^K>^H
^c12?4,&Q@_I,#-Cb6F&A#S5?_3<Eaa.044.GPfINRW4]Kd\CLCS@Z[#V.SBWfEe
[W\@)K6\6R6K5JH_:DG47&<3VH[_>PTZ^a58F=O>&V(J2P^(#IbdZ()FIWdBgO.J
H@02ES-2F/DbKC\).aEb.-W&fF=3b+@g<M2_LK1Z@UU<ge9OY+8.I:Og-A).YWee
Vc5)<:>-bEAR3g_P;d8.5@-#8LK#@G<M-]&N@Q4M7dg>fD8aB@WL9A^cR7Z8->fb
1Gg1DdQB4)PLZJb@_6dIFOecKUefBaLdNM,LcGU;bV&Z>^BKQ=MU-X,c(gOQe_G\
FWHXbPZ=XY233AS,=X)URd]KVg;Z_ENZg2.F8/8S^?8>31#dM@SWGY9)K/]-,C#=
OTRGc<.Q?KFU:GPY<deVADNa9R[W,C]8bfU?)W)\d::+\OMU?56-4031#RXI2ZK5
GEM#aJW:0I^=A=->T>-WF071+X@;#Y[LZ[b:+e].2C(/@@D7@X[a2Wc:b&#JUHS)
N]>^Z^36bYBT=ZF;5P(3QD/=T&)6C#RP];Cg2F2d()5g:98c3_aI//T6I@6VCfBV
<PG@^@ZT+&<=#PIDG\+gLUK\PHBU>H-b2.#f4O5LbgB:,YW,#4_F@LG@)EKBW3:0
)^WOE+g\NP-I.7JNfMTJIcSf\IbU_[66H:9GHJ]EL/_/AJK=acTQXI+RSO:6)+MN
.]UCbNRdc1\A]),5^F(#J[131(=TZ/+97T3MFD&861X0#cNb2Q?IZD4CJU+0C]dU
IP[F+DEAU(K0DJ9_NGN(,,67a9/PY1\B?1?L?QI_TD1L&G>_/B52[I]0:(?Ag)g&
Kb-CI8>EX^?bBA+LRNgF+6XPW/)PXBVR4N1SXReb9Ebb7cK;0[I^b6>5MB]GX<+7
#>1))\Y5GD>5-agK#K>GIe,;Z(f(FFeSK^O(<CdOSYJ4I+IVOW?.S,_(WF2,E+6Q
0[^2PGU^?G.\-ddT5H=R,A[YYFEPeXMIKg>JUfbS]?QUD\SJ7f7\J#WFS2@Cc&&Y
G:B_?B\R7Ld(eb0\MJ&\K.@PVAA2^&S=.b5W\#[R\KE2]Cg>7_@67TFQKOe779N=
6J)9:e./>2<7C/F;HJa),Z.0cV8[gR1N6#1WLT1GPf?--c1:[5+P6;4]47+I+e;V
/IN(AFTX^BO8>f0WBAa;HSfe:HL6VSJN@WVF6.LR^>ZWa,7Me--V=K#@&&MWCUV_
QAe&NLC?dSF+3e:&O99\5>GfT)/fe;d[<OeC+:>WXMDRONC2^NSFge5]Ccc:Od:1
LL38_INU.e<5bRRd@B]]X=<2,1_]1-[&+:GTQT]UGS+IE1XA_Y6W6\-X&3M6IcL7
,A6Hg#6RVT7Kc?c_KV.]S+c<IUK\)V(=&3PCPQBWAKK-g813dLQKK(WV;(.E>2G7
3#U^XWVgG\b(4FaV[fH=F8.2\G/YcFRd\R_B3J3SS5=R>-2+64E?/W)UQ=+gGbGc
ac030_3-O0B2Jd@MGL]J>R.PPb-J+MFS.#M[N+Pc+&@2e.C:6LVD2@=.),13ObM-
DbYKdI/)HG=efG-3;b:[^]5DaXa2C396UM8PD.-YYg:DH(a7T+M1gN;Te-0#5S^Z
c=R<F78?PO[Ja2>13\D,_9#3AcD,.eeHG6O4>>(<^,]HK7,G;S6.U@8@#eT8YX</
Rg9A^\D..R4g4aSEcWa2Jgc_GUTO5>).^+ZJ&XbS6==8HE7N\V=IJR:];)[J4ZIK
7<QWcA78HZQCe;Y@=8PT:W-GU+HH6#b:>E/;(+^VFR\c+T)L#/Be?KC5c5gd6B37
bg2e>U@;@Q+W0eCI^4H)bUI:gG:GV6gIW8BeC^YS-BM7JH<GgWeWBZY=P\&(1[K]
A[)IZD7TYTO8@L_T;^f?X)GQa_;=\N]c/[aS?L@>N(GSBeAO](_IR#BOT<?^b#=,
EX6)]Db6aJHB,\R)7#U_b1T<AS-HK@KSV[PG+g(Y[^/V,.M@>RVfX6X^,YX]ES=7
CR23+:)af8YV-&UT@Zg\4O@\0K:V?Tb]Q4:Q5(4f1R?I=aJW,LbZS0,=T7>245H5
CQF\4O:@_(SPeX<3[L)_TNR.QQ/gOJJ+dK/Ab_&.SNP[@<G=):<G#[>VR\RR==\/
Z+aF:gXDKL6cg+BS+g9eJ\L#fDK84>]S^&bHB_3R12E)MPA?S=/)DF=[>[5\SC:9
dK1[Ca,+]N@X81g[K<bfG[/VP4.N:&NIRBHND.L)YV-a]^Z(<#_^R/CFZ((?+]5_
5<f45MTGX4gc>Q;&S6F)&,;L_SJ+<DQ&K#>\E=&A#4,^(a6?K<=3JF7;][870CYX
?1EV0;7A59FKg-XYA,VH>;f@+(D2M9H)dTNfa99KDR6E^JB>?9g=I@/KNJ9/Pb<)
(O;V(8#,6Y1bYCM3[>Yb0bJ5dW_,U.U>:C1RJPRCELU>^g;?L-N&DSSWaDG/:Sb+
PLPCcM?_/VdOg2]ScSH7d,G\],;8FR>KfSY1:d?\45832(35K)/DK.JMX8;f,,2<
;1W0)ZELg7U+bb@8V1(/ZJd9feHN1WU6/RKeXT6caC-0/<A2aQ0UZ4=\g+g(7/-b
DZW-3N[NcH3K[>RNS#-NOA6DSa,4CX12=XFLC-(f)Q34]Q[Z838dO&=?\)^SM_>&
(V-P7U_U?BKfPJE662<<JY)Ff[4?=0W/7.BV@3+MG/:dgg_;a-JNgC=DL^T)1aPL
^JbTCW7(9MeP4CCTRbONY_V8:Z[C.=Z6^B(][5<eR<.L=,]fP_Y?bG^8F5YS(MfI
SHKT]OK_7(Dc)K+f,9)>_93fN_6fP6K2MX-4&@cD554X>/@H(5gHRN1[bI0SgW3D
K)I>SbcD_\_TO/C@8,1>7S_0PMF(I8O^5&f+1WBE:W(:U/,&CVW65-2OIaPg+C#f
gQ0Eb.B:,\Q7-@-+BU9RH9b<I9fKPZ1O.N[g/Q2[K<beMGbfHEZ>5LJA_L>UVVf8
&;L,Y:_:I_[^;JWW=SD:0cR94E36<+#)dc\V,WdE8Id+?AQ>9L]Te2[1@5_9Ig3&
,&DI?c)T,e?U,6\V+c?-@\c@T4USac.#3YM;MWePAUbcSX6GS8\ZR-M]S/BNDD45
?L7TA7R?0_b,AZ(O_f,CF29MNPV1;dbSSSEg(1C(3,RBS[ZX<b<_?/\c[S=2Y/5b
eY?/^bKF19>R)06g&(UWG9FfCT(LBHdKT6_]\;25Y63g:(Fed&:]eL7VX/(<cO5a
e0B:<dY4RN16Y=C=;ReU5c@^0(R+-1eVfZ<AdISc0DLOV/C9>7K3R1KPd?2#,_39
XgP57NTf=L\:d5I(0&O#H2-FM^<2+QFVb/O+-QSE?J(Dd&ef3KKGOIg2TV]-ZdKO
L6;>\a=aQ?ESWOK1bZbd^U/eA>B[=>0ZW7f.]K#\4YJdXc2W&)VKX;MK]W1b.YK\
3MD7C[g5ggJ)S0<W]_SI[&FY^D@P=H?<YI7OKdU\f.dXb>#X7ON^6eM5IE@_V\#H
[eIfeR&&+S&VFLF4_E0P(F;M[aRGK1S1geLg3@-CZcf#2cD)Iea:b)CJOOIX/DYO
.X]2(<[52>(XX(.JO:5)L3Xf([;PL(M3X+A.@&WCW]fF[Z_M1CWdC@&0W9eSWeB,
;5:Wd=&Hf^]49GLg^/:7A@YWc::^<]#MF+1<@(O0:\SV?&IO6FH4#bf4bfU+7H^g
/3W-@X:+WR(ITMJJ\Bf2A(#dB>CMKUad55CD]bbT0^8QW3C:&;c?^YZ[a>:cPWCa
24-;O[N?W7Bd3a:;0fXK86MEI8SPH/BS+T\NS0DT=3#CYY^bLP2<#:ILcR=92ZM+
=a]IY@(_J<O7A2E6#:91fZK+bd^Q5A:^e.L<<I)(2&X9^^@V)9];_JHT-&6Td],R
+^X4_:)=@L?N<M2IbE7FUa<fFgCMK6L#3<f,Q]IM(-\36ZX)K0N+MV((5cP>0Id@
4P2DZPD?Z4#_>d41NP#3/bT(>&ORP)I;;UT\EfUYBFD7&1(Ug+^d[Vc8??&I4/d)
]#892+#B-BZUA\CGG1U\+822e\71>M58U1U;SZf(Z/>Cb.^#00+VE84BR8KXZG8C
b]5JNWHa25?R+7TPSHT@UMf.<D/JSNG>M5SB_G@Y&5&MN[^f]<O\Q40fH^2F[R.V
e]SNCAS,BHf\Y0]]J2dE(1DN6+-\47XZ6>c,5&.K4BVId-BR#IF0EMe00NXEP;>)
=4Gc?AF57\8K?:<)=.@PdD=Y]J:VJ@84N@E1ULg0+J8-^_5CfP,YA[66fJHgQCTf
>:VK>>VZ](L_EcaMPCO5geYf63Z:6CTe03abDPBDX154S,C&-VD56DfCVf)Mb&IW
26VMR#a3AV>TWYeH97RR[OW+-b?[P-fVR9c6:e(R2cB^.Bf\L<XUI<S@^e4SP],^
Y(/\eBT7b@5f4Sf>.A-VM]GOA:CdGZC^L?+gD=U@2RUS^b3+g>DYA?_6:AUO78U,
L><42C6/XgRZcaF4C5D:@V:N18UCUPU()9O>X0SA2Y=KT1_e8b1XC>^?P#BBKN^V
>2?YcJYM^Mf@b#;5WIcXZ[#/fKc3-U2QN49/IFD^MA3e[:?dN]L-8S+YC:#O;Hb^
SAAYIcQ.\3R;.,=J==QRPX:dQd]Ea(-1(/#]P<]9[_cF90SM-XDa;.SL1QO6Zc6U
e1CPG263cGP_W;Z<b#UYY?3?SC>gCU2=1)3R<:RT-8H;5Nc291Db)WH<&5-ZHBbY
007OSHAO/I6U+LTFYCPbM5.-G>T0b(]#<;9X5NfA(bY@S]#Be-Q&9P^0L2IZ3Fe@
2[A-;<@+M#5M@JK5XWC5VE4/M7^08&7J4MfMU\#DAUEM(+^&)dV<(dC-J@JLeQ-9
OD>40V-2YJ[0BgF962K5&cT28La/(<-\ZQ_KEW=#&g?1W=TIH9;CM2L9,:9+<aF_
?.[.FWYF,@a=R0gCOJ=T,C-/TLgJ5PF=A7J&DC^T/+KcJ4c<0Y/Pa8-9=df_>\).
-bA<:b@EdIS(UQ\R^A_F[?:;fcXP=gTMB^;CEB@\;&d5BKS<^R7fS:49\Qgf&ADZ
>aFcHb+1]TQIO9.KUXcPg:,\5cDQ^.>&C:Y78EO^\BW8UF,.C:/LcV\C&)2&9DQO
/2FQVNaO7]_)2,2M_><4I+&YU8K[54C)[A5R.)TBc9H6Y@/3X8E??JD14<f9>JZ)
E7>OXVA6MJbY^IJdYO8ETPGA]JT9b-g-Q#.=,Z]E.-+[GUgb?_7e]^?(2S)3?-I/
4)a2O-L7&WJ7A@G:S)-WY@PZ0_X/4R_N@Na2BD67H=,J]35,AQ/eePY,+OV6&3dQ
MBDG[IBAE)AE.]0fS:2DM/V^[S<_:T7[(S55[ZeV:EZ2K_b(g9f-(6IVXH>\1b(6
4/#M>JY2H/d=IQ1IXe^T]@WcAPHHRReeQ8+bUQ9@P>/8,>K_HE;_^6/b9Vd(E\,#
^W?X/TdWUH8B0Z#8X?>.P+aQOQU]?3DQFMNeMNQGaX][X@JH<&6E,3(9W7J2.UBI
,e\0A3KABQ2I5XEV?B0BXMT1-d-Z6QBCc3f(CO8<.Y-0/U^L8+<TKD5ZcR/BP9KO
]4Y;[6QE>dA_@L704<[[]8L&Y[CYcM.TR=70_g]PB82SdWT4NRAdP2T7<NW>JNbH
N.:;gJ+-_N3dbOfQ@SeScBJ7Jbf@+[U-Va?IK^;F-WNW,#X=9/GZ>6MIa9D,+(>H
1#VTdVaX\B4H37^X0V8-f)8WWB7;X:eS(=,7H1eOAF>[9+\5f5F[7327R]C1@>Cb
GI&CFXZ.2(^LgLaWGS.\3A87ffZ)I5O0\8YAD@U=.6?:5e?/IA?Bf-gL&\BI94/?
=Z1&&/[Y?UDK7XAbB7MQ-1;eA2P(Z8#7b7GRYc1Pd/^<@QMOH.bR4/CZ/b?M9(DG
)_K=_.C.@?9(:474(TW,^bCRZ4[=\2Hff43::5W:+gb/g><U-eAPK>45He\K@^c,
CaT02^4C5N(FU6[LQ&7^_@;=RL#+Ff@<<,,e&+;eUW&+-O[18_OZ6^+N/YU;fR6G
U5OXbT1#KJ80LW^cK8F:(WfL7)3_Nf<=ER6K3fVK8V;eQLg.)(;f75?FLM?G<U2e
FQe>THd9-cCV[_T+GDZId\@[6FN;;M:9NKa\Ya(3#,NN15MGA6_G8IDaf7#+g>VO
FAN6X<-I5P#VN(O8)\B]4-..Z8.?[87cbK0(g+?<D5H0F+:KFG[-eSdgObc<GY[Y
YY8Ob;\:_7]#P)bI3AT;ST^OeL@C);:e/6_(;NETYa=Cd;YI=4)+ZU76?I^J^(E-
UX[>^3/);Z.g;MaB</eN/\>2de<d@-g_4EO(PeA(Tg=W>G0aS^^P78Z8AJc([AV1
GDNc(JX]_LT,UE/,&e;g9A7CYc=BdJ-B;X?6I9&56T)EHJ,I[/;6UE5Hg=G;9+EX
J]7O&#4^Q6W]QX_H\dVB>HfKaK<JL7c>?J.4.SG3]GU.=J-,FN_JUX=A?;\[EDcS
b;eQ1KRE>b;O.9Z_:/S6OY4#X7gPb_SX0)VcbO,0-=KbCCTaC7+Ab<MR1bAc4U:M
).b0R-WM.I^DXZ[/bBc[0E(H0=a+HYfT,B[WL4K2Zd&7_bEIK]&cWMMHaEOXJE4Z
7Q<>#:]C6?-;_g@Ng>FDf-9_.#B1EO]1#)g,,D\JIXJ-;^d@J)J1f-&]PQ.W3OAc
OY1g8753=@S9_ebRV5K4WJZI^QH7L/Q5Z8(G[8NVNY492^g;^?]B.6X5?_\VIT2B
7CH0,-/[Q5Uc/\cBRb_C#Z+d9:.62UGUa_3+[T#>a48fWF>-CGDd+cUH.H0Y8>a>
>I]W[3,^0AXNLUZOWLJ<;4ZRe^[NQ2,FcTYV/&[&E1BI80L/A^OBP(P;f4/0&KI<
B8U6,4KO-\;_.#YL?]/Ag1IeRd.DcQD4HC).U.FZ:XTMWX?QRV@LGeOT:d1RJ;5I
Wa1<6Zg+/PALL]/1#+4UaZdKEa?^[1P6V;S(7>W>T>.g54T&7cVS]ZOW=Wd09C(T
-3fgU<-PMH,JDBSZR/c^ULX41;X6[W#YRVC9:fIY5J8PFB7SdN0P.-S8F<H7L]f,
(PXK5A(N[/4a@X+aB/W0[]fT8[^VK&Ic,.8gLg8)>T7Nc##fa4aP12_[K>[bb@5U
P6_aTV^,PA6a^LfB<##3]DTYFO>XQ]G76[Z?604?U?Y2Ya-5@eOc)1X(a-<0\JA_
5(\:b<TG=4gd=NA/VU<R<QNPTfQGF8.LO?e=,6YA--IBA-M^39IGM]\&fZETK\CW
-\gFE=K7Ag;P6O6>W7f_HZY:ZD:?QgO9N#XCVb5;5]=ZJ8X=9#.ML1^A&13g2FUU
6VUd^KWQR6fB7+.@Z0Z5LcC.Q;].VI<F\P5PC^2)-;SN20<8-NCRg9S3e)\?AN@Y
LA\P#DXQ^MfNUfcSa\cFG53aCg2E.B7(aZV1AbG7YbO]G[BSMFbHS[H=Ye:/b(2(
JMDW^3)I,cP_1OcC=fa699&Kc(DXH0MXRP2HcCO6:HH3WE]Bbg,7+(@4;&Pf5B[O
)HX_[Ib(T8Y;KWIfUYCI<Q\)O;&W(K&1N,egYEJ#6<Eee7RHKR=c<6;XV7::/fc<
RRQ^;:357>W)?2/O<1I:GU9]3\ZD.\.HMb4Wfa@c6_L-S9_#T10)MO[1AFOTFOfX
fPS3:@E-SSJG0PR&V=RGe1ZDgG66g-)#ZG669_5ZDDIG6)GE&LRDOg,)b>8_QR4g
R>ML1B?=dLEMe[0VRB6E5J&HcRFBE)??P/Q=Ib<-@C[1U-9g&U[FVP3@V5g-&UK?
1O9@Tc>U[e0X9#fc7U:&HeL5GU/OAA]5K42:RS<[6Z+>ZJA)U&?^a_D9+A_Xe#Z7
?DVI[KVYE;c5K=@0_F#b)VFRLFBE<=GLDIKVF4,E+1?@M=4=.1Q9Q1Cf,WHW#[1<
>)S>O;NE:PSeB\K.XR.?D_1OVf59/.G,K7&_,\/]9=8?Q)+939D,E&/<IJ--Tb+Y
ZZ]Z4Cd1&/<@]88?3W2dZRXY)7&3R\2EI5?I7E]R[b/f8R>1+@P(Wd>Re3a69B.N
\;gJZUbDHXPB[CRAP7Q&E,((G_Y)<gPY^Q[QKP5HC/LTe)_P42OGPH]T>XDc77E6
6RJ[76K34MQK6O)3Z.M0egVfUKMDPJMdRWKZ3S@[\19b:E]CQSTD9Ya=K1@/.;>a
?E0Z+;MR06DK>Q<Yb8CWc^DA^T/??c1)?eQ7Hb8>7L-7\&(a@,2Xc^88_R4g=MHI
.a)S&f+G?7]=WZP;PB52ZC_gM7D(<82Y,a7>4S>=JcPPJ.g81.^0:>fR;_dFKaBR
_UG;^:>2]eRE^PFTE-#CZO]VE=-KXeWR1JZa3OZf9X#GX)K0Ob2>NgZ@,7C;PUHR
27VUD71)<_dI^@F+2IVb3U5Da74?,1.;a@7NZG]/Tg,\00=M[_KT9^C/1KG1W+SA
>I0E;cNYH1E-:.4Z[FA^g)WAWHJAa<G6ER4[_6+#MC-9I\<[7/+X,QE>aN<^Z_C,
T+S^]]9I(B\-N>PQ-gUNeKaA_JLI3H9B/J8gF]6-&Uc5ZOTYgLPA;QgNOXTWN<<3
>_O<XYZ>-(I44#3dGeeTO7:_T+BJ=;G#DN-:ERBd7fMe:C,8@4:I[De+3QE>2SJU
_L]EFZ-(Y8Sb1-.X6:>c=ga.&WD[@#]Y=I1ZR-+fM,]AY3d.a._V_LfUM2a8KI?=
6(cS=E\abD&Ybf4GGBb<A5:<ON4E;?+aA0ML6++@?Z&Y_4JfTOMIf3R^SV:^?,XV
&J._:a-Wc.4^TIJL_T]CA2:7+&cM_JH0[bM,T0O^.)HXdFFdJZ@^S37S_ZTIg&Z/
d\8\_BNU_75C37J#L0>1CW&;JV9DLa;8<QH_=2)MW-Y1GbJAA2A[HI-75HSTDBUK
>C/GE?E]N-=LB(T_GSRAL.a8V(?QS5XZ:GC#M&E(DICBGZO93PNG>K(0Y1a2M@,/
eJ5<f_98,ccE9\[FSa8<V=^\Y4=<YF^EQQ+A@[H-\W)J0/^>_7(>Q41YNPUO[O@2
1_SCQ<J,L_F19S;:>URF1_-3U^?)D2/bWDWgPL)<Re\Y^=3RZ#NEG?@53.WS&34L
28R;Nd-CPM(UL+I&baT2GQ+:dMJ9,=)PBD;LF@TEE+343g<O[\I\V0(]U7SG-Yge
57D=7(VZXWa9C>aT)cZHL+Gd=Ce>F-U3O1DYCTef[7H/)V6;RCg9Zab05C/bL.V4
>BGEZ):I][(]4gVV;@OZfAD47FU9RBI._(HQ[)AR7LR8UD#L6PM()EB9e-=9BbNZ
?([N7faJLYT4>\T5_ZNCS[QPcK4X&HFH^-/]I(N@P;@O8Nb-[_Ve):P<LEL9fCga
Z@+I71-]Y\]_T-4>FPDW2L5Bd<AKg]:AA5JeFeL-C(0+&Sf_.5d[KC3a5c>&1\b:
3BXB-GWODAdA+[fAN5L7YbfG73X#VOG6Z=/?TaED1;HgJ:M^CeT8#f)bR/8(1N][
C:#A4(bcH&gG66f,=N7@J;^>A?G(N4TbW73=;\cb4PK4/bN]+;fOY>_58J2cB=YY
:Lg69M2CY[(Z:KY9;W+SC3_)V4\ZF6<[G4-.YPR##2<bJa&XJPO4MOX?fSZ,X-Y-
Bg]aN/F)MA6+<Z-^A&M9YS6#Hg\1ZI);VYZ\JTX.<K#/V-WBC=QSc:9P;f#<XV_8
JB&c>gA))8<PgG4FA6F+=(D3BcY&(0M4BcP]L;gNRNS65)c8\-A]67;.:V](@=Zg
).A#,Z:H^VC.R-RF]3Dc57g\CM&_5#.-c:L(@SNfL,^B53QT]F;\&3>;(1@\?>e=
7FdUML,=U0(+Tf3g5U_4E4aD1]e[EY9c\68R9O2fNf8@ZP)8V>6cVWBAIHfD7HNY
Z/Y#aU86=S^^P@0<Y0Q-VaO;QHAZK.^g8fJ6AO(gR>9/Gb?=?<#C\ZPZQ(G>U2UX
Y_.U6SYS]bb7,08(0A+ZYJ<1Oe-(V-U3:TC/50U:4Q,6[AfI=3a;4E=1S8S1-J[3
S0\_2FZ&,=aLSGKf1_RUdeO3)B:d2MWM&bV8O_:94+]a>eRGc6T&@_H/?V;RZ5@W
,TK4J2K.@V=;Y^)@;&HOP8Y;e_P9+Ig?WL>#31f_QR\\e6<dEg?gQfL.PeJ#F1Y4
6S1Y<17-@(MY=NY@[g-/B7+BPgE-\K2;+9/V<6=4KFV)B:C,PIfW(-TWEX3G4IB1
FJ:;fS=)EaI+KecD=F-RKLM,EO:>96;>.6;)S8;([V?PLZ9;7XZIg&N7NeTd@M;N
bM3-IRUA3L>T;>0[WY]YU,^BV^FQ1U\EO^VELBE:SDBV+VZagDf91]W;G>\WF_RN
N?6W-7g0U\>?9,F.F#+aR4Uad@Kdb-4>d)7UCMT#WUfKD#+S?RH@2QP1g8=,H+&9
?AZd^W-3\X6DeD7ZHd-dEF^NRO4J^RHa7VR9H8=D7JNbS(4/P0K=]_aPE>IWCI]J
L++;NN(>C.c;<f_KLQ[&X_Mf+Xc.^6OBB9g(Db:<AYgaf>aY&&F8N?4&fGG/85RD
ZU9KX1]/5U^[7C7f#S0_[QBSL8-5QUKN7cT(.E9cDT52R7O5]M>/QI(?NfBXS5[I
F0.]A<BHM<,=Xg-/J)0QUTO&/]M^d.^:R_<4Z0?g^Y[=<<@L<7Za&WfS+Gf+PfBe
TH1aYI68;4BXJF6f0]9fTd5-^X0[0e+g\7W&(JZ)IB3V[S9_A@NRDBX/S0EFYF-^
c&LT:GcJ7LZ4ICF_E5+@:>Cga8EcO7:)d2UD=DDC]#K/^fWNDA.08(24;0OaS,PF
@Q,dHJFcgRX/M.dIQ1Z6?G4]8Ve)<>WKT0cG.AX->M]WAIO^?22977)]1Y2&aX=.
2E_N]S)_7/f)N^6;:G^8eg8FU5->WfO6(f@7GK#4^VIe_#?4.g@)/13AHUHZPIH;
GLO?L=R1264A<WIfKUc-I84MNRZE=gfYS9&@Ea9AO/Bd95E?.)Q,SdRLCEB/K39S
41<MfSG8D7(&BB2Q<4VMJ8P1CbOJBYXD(4^Z^P\W4WAUASN)8@<O\5L45TQWdQea
9_MJFC:NRL@.BTUKePPcBPHQ6Q9,A^Z7Jd8GFg88fe9f<MIS)2bYU<f>OS@NIWRF
]R1XWS7R1[#R50>eG;YY#f#P4&BGU>(SHe/4\@9-TB:WKPeHHMRRIbX@DGSaQ3,2
W=T@J#&@W2R&FE+CXdP8G73d^/G(B,GIH)+0&UPXYf5K0EE5\1+#(>A_M/C[?9EQ
U;GZCaK09AdK_e70#dF:S(JYD]^d&9IP;EQ2_6bSTE@9:5NEfI.UB/AL02B[S[]T
&XLP#FCED(GW:CY7HaO7cQ37R:6,_R8JO-);/+DWFdEZXM\=7:eW95NQaZ;]N2.N
VV6.PP^F;;5,_a6,c[^Y?Db,bdL8d+Dda=0D>cOfLcIK^>A,gBFTN\0^3+L?^H6B
Y(Xf<2f(P;=@c.cR0e3S;I6S<6EOTf;aL4UZ(T0Q?\Z7>0D549S_6O-P?RSSH[0c
RK=0g97R;)3GVG1ML52d\C?#O<AgKf1_Y_22gGYaL+eGYIE_:6;JODPZ\G:N<A15
[-HP,b#1\e5J/^L.:^OW1/6L8,bRZ(\Y;<>7(X_),]gd&eEX\OB5RRRbM9B)#N9=
73-0R6)d(#M>fg]N@3G@<Se8-NCTC&a45JXgOg5PX6-NERN^^^&d,]LX[TG,U?)W
,X4#.P/41]](LIF-HeQPUA/O;[8g9BW&ZV(ZRV+WE,aIQIdC&-_1F?98LU>U\BU^
&+=/F3(]X^<bDQ0Ca)QU2=ed-PM[8KB+WA0W_g+/FYVcDcWT@[17&_NO1ICJ.]eN
HH3d7)7^/[7#23TFH55]3BC#Qa^?B0H)&V[B1K;UVI)F:Z^#Y]6HN05.07U\B#AY
N/CB:75)IUKGLC7_D;cU27YV,eXHHB.Q(=eTK6[-JVCR_DCgHA2O?F)/_LQ9D6Ob
:-?]KY.V.TP>GMY]#HS1?^]9+6GS5PIQbGNB<N\Z-da[K?:;Gd1NX2ZbfN8?.S.J
=&-G&2B[9@1+bgC&TO=g_Za0-d.d<U/d69CDEcNIc_9_gRDF43X(DER7K_OUV,>)
-(C?7b;?B21,1)84S9fgXI/OX<:c#fB,DTV=W&/DG)SFKdA;d<#@B1?Q2RcfIg3/
.P8/[3R(O^DM:gM;_,F#K@#?0X]_#1]DX(N<6eZ=bRc>LO/L?Z/IQ843D<6FE0<D
ICSV@X.G5IU;4I@3]15XaAYGfG_=]D:KaATG,8EN,8W09.EWUU:&ZV(P>M-SZd]9
8783SFReW<):OdFX.g>5YOGZ#Y/]e2E_6F34SAV:WU0;P6QbMI/H5Z8<]@_\=\9W
gY4TEW:EI02<<]N,g2V<E#/5#DF7#(35Pg8V8XOMU-(+;;8.KMGV4AL-3--)Q.;W
P09)bd,=30@5U5fM;_0<YI)c59NH+W?QCD0UI-JWQ&P,HS#A_21d)7_[=U=U6M##
K18OGWA=(-:.I_^(\Ug+^.Lb(]0LU6<K(3D^=U-)X_dP0D)&b.TVKWM.?2BAEI>J
4(/:&Jb).E1PALJ1>\[ACZ5Y@^XL@]]O-egDEa/<]#Xbcf@c?N6Y0Kb5QAJbC</:
DJWE_C/cJPQDL?d<eS6YYI,+_LH:KZASOX#GV,.,X9/U8#+aNb:S:f)E7O(\f3-J
I>IL]a1;W1H/-36S6HW[b&_XI=):aY:d;:;?N3LL@-75:;2<;YKK9XMdE?V@bYK>
^3#^#T/XO-ML-2LE3)gVZV].R-a:W@=NED46V&T>@N?Ae<33UR/XG\SW98YP1(_P
FVOLJJgCN.#9^@MUOb]:bFeC)Q>FbCZcH)AEB4B-+B3#MUf4>F)DCI(&/-S-:#KO
^;2Y(Z9U1CKfWCTe?:PfKe0T>+X?>GX52_bEe?0-TNcUbF#7^8Q\\BT?19O3]^HT
X9<ePZdgX-Y_UcA2\QK9/:f&;+<V4&8^W7Q65=2]7\)GKA>9B12?P@A#I=,b-fJ?
a[5(BQMB>4c[2I>>^V8aM:65SD0PJI3CPHON,Z/\9#Z,@YXS]dE&U7/@,^<J[LYa
.01R73baS,H4;eY.TcL?V@GG._:61&9ZS.1C3<L\-<+9)#LY<V56/D5cgCc<@#_e
XRVZH9VQJHCPY2)YQ;,B\^-[V?W>gIA6]31&&)UEb00C&#O@>O\#8HS0DM>]V8fd
NMK9e_f/G/<b#ULT>4@5-(O5==YR.LP=9#KS7I0/N5:9eOc12G\4YEBRL>QY(g1E
)T1+;?_MN0]<aa^-]RF:\fQ/;V+R^4[gSJ-7H(NE3U:;C2-U.D2TKSb?.bO<7:_c
T/262AJScge73H@E[L&Y3ZPZbLO&27M498?@P?V8WDG75K(DF6RRAKH6MLFU)a:B
O//?T.ZWg4U@Z@]^]Z7\NJ2#Ib8DS/V^=G-Z4YORK#Z)5B0[(0?O6P)1Ug^[/1Q[
]C+@9_&0cIA#ZEF;?T4U(03;2[;e0CSFG[S,Bb[52T+NV1MYUJ::ad#+Ge)Ee1RL
Z7@K8B0-QL(SD.H7Z&,D;/LD)9d\8\X.:V2WA.&PS\SC.;F1(bM=58Y<_e^O&14J
=e_J2Q)XeBKIOL\OG_6A@R1]H2gGC80#IRdX89#E]AH5JT5M1B7&3]HX^[X1cK^A
IdZ:bd^6U7;SV8[3_,C+6\8XJ4E-0SPE3I@ODf3M8Q6,O&#2\\e-\?CZ1d@:=^X&
,HWCBE^X&AcRWE)Q,5Vc&TB>g/QSS\b+_D-?daWR3TEOFBP;2,ZK[.5(Q:,V80NB
a\T59X5?@XLgHY1;LTagH6cgdd8,M=@9d,EBe_EDE)ZQaZQA^/8(JYe+;0;:/DH]
(T]DAN:+^C]W#SJNMOXf_5d\<WED\Ua[C(+A(J]292[N1JHCP[5PaEERQ>9:LT.c
g+6+()5]5JOQT:20Q@UES1WM:UQF2E5?C^/a&W&-a@NT=6[b<QV/?<5]ecb8QZPf
LA4]UgK2(KZS>/EJBVG,BSGERc2Z+(W#46N8TYK_UB13#^@5ND<IM&??f<^O[KY>
\-6)aX81]?dG6aCTN8B\Oe89NJUP>2JM\gU=VX@N90V=D:(8T7#UR^)TgW:ACU3X
HB1EW5V_]M\E/2G4CLFAWN(Q^8A,@2M(^D03/[4H,2XW5C08J&+@_e(<N\3O/WMK
Fe[6ge;416+FG:9<I>-Me-L4/4C\6/C6W)8eLMPCSI>ga&Z^^/E7Jd:4.LO1+8-b
@e/D+bK;.6FWM&R<V3S0QH-EO-L]WJBJ@3-L.f\+45L54JH,[@[54K-deH[#/=)R
SQ?ZU231O7cDZG(48)4AQQXeK;#WfUPg&WQN0KTI\6:S3@1/cBPQ5=1GaJL8A73-
]b,S>XQ93MWS>R([M<FE;X<A]Rf<B4B>TXVCPA\?07aK1&47I&TA29aN=c)L=Q9N
]:IDaYJX96#=4ROaH#YcEa.)_;R20c4NF29X]</07>0^S)^B#QI1DB5\,+#5McB^
OKH0b+73(JH&D-HQL0R_HcO-&^XXZ5-61@TF_J88UL)#6BYB9^L.4<2(1SbMa7O<
]5^HE^&4[-Ia0[c0J:G6dg)]G/F2[&4g6HA7ERf\gP;^F6#@WJ3/<0AD3aeH;[1d
g&:=a\FX[BH-J+YB18d+Hg8?HXQd[K?2<fJAD5DDRM,W.=;RO#-)E43Y0>2J?Z7-
T:(<\HR:ZO.4PK6D/^X)5MAD&3Y)-;LT+[4(GYNa+#f-KD+(;e^eY0K0O(e4[?bV
MUde4F^Gd(f\1+DagFT^Y4GIJP^^KRVY73Z62+^dJbS/B9Qf>EcUfTGdB=IY-M&V
D#NXSN?TfIAMC4@@QVY5Ig6<ZV)Z#AHTe_B@L&+Q;:BL7,X+NRDF4AUC6;O?YUQ+
7=]FCc25T.W5D\T9R(3_7dPM[:fC@Z;f7N[L4+ZBU<^ZA6)GdKd3aEH)GD#=J4OL
BBRGWCMP6f@@_A#XbfJ=,H(U?0?c22C\SX,0-98[@TDEW;+]0[Z]U@2OdC<a-f(/
3L@b@FEe.WKCLefcdZVEY/ETPQ]B><bAU?(0:B#:M]f98_UNKe2FL.c61M]c]gH,
V5eH/->EPc\^[?T;,Pa)5&-1)>2ZNJU;KZ_cD94HbaA6-S.Z&53aV5D2QWP[f-41
@Q^9I-2QJ/3_?>))KAP63>^@P>N4dM^O&Re/W._^/Z5g&gg5Y;(<OYMH00>Wff[5
K:=B,aPY\ILg]65WX6H[0;3-+X>ZL5C3J:Ig58NNbdIS1.ME+<SPV&<PQ=[/fXX]
6VBRdSIAHB&EF7bN\3C?TK5(SF)cU)S4AR2&)FNf0JZ9+e/4@71XI)eYSSG^J24V
(Hd?,XC^c,[#=^J5/\G/DN?^:5dd3L3)=g]I<H-[aMT5R234\)G-CAc,8WSO=Q&a
I-Z8BI+A=.C4Q+\?#EYWJ(R79@L]?LHC+KL(Hb0K;d^c5e2SQDO5aV^bA7T0/c36
;MaXM&,]MMcba=#_J>B]Ja&[:KfGY<fVcgb^2Q85f7&F1WB:PI7AG(SJRXYOHFD,
#:?3Taf>5JU9(4f3a90575L6(;_I6#VOZZV,IITAg4[4Mc9ZJRb<F<TQ[\57d:Y?
S(TM>)\c]:2C/VRaG.-Ic825O699dX,3[3GgbI&4XMV0Z1]5Id4[W#-K\M;gHfA/
IG;<\9S:#F5S6Q)RefFV.C5[QbaK_&e3c@>f>O0K5GG+c)dAX2LL=dE?L^bET.?e
(CZ,(M;+:_e2,NME#&)9W&&GV(#b.T\Ee7<Z3^4XQ1g9H?K>U9ZLXACVcgdIc[15
=&U?Z-fHETY4M+AAPWgA&cTDJPIWgS^04f4f7B_4?,cgZ]aZ^43S/]W&G?>DRQZQ
<[8[RGRYGDf>@;BTAYfK/\O:9I2OYW;c?=MML+Y^e<&=VT9dHbEPf)L2gZXX<1_#
RcP+PVWJ#J:^ZYJ(FVZX[OUQc0>/+=JEA@XeX>/1L?VcAJb0O?+eFJ2Q_7^I=<K;
MU5]:d-D75d.J:84F.1(NO\ZHL>W^+If>UgM9WZ6XKWP6-M)=2P@Q4?)Cg=fUD8C
GZcbZa\H#=\(M9>dKe+]PS:0BfYdFJAH&5WB/E[T(@\7J08CJQDVIc64QR7PWQ=W
@LPF0EZ[0O5bAAe?&d/K-;g[5;\+WLf#)FR:gOSQd1WS^Q&]O9.;+4,U6R^bc6JF
0L3=J&35ae1P[_ZV(C/-YDC:L9[CK#]M@?\eUH/S+XYKK_dfQaO<A80/:ETdXa@R
E(LJ>^(_ZZP-C?HS&cL=#TA[)U&eAHFg<:#F.(e524WQeV.G1c#FZ>BK?\SCae7c
AKR))P:[b:RMeD;C62]=V\?D9+fJPQZNgfSNgRPY0a^<.bK6?MfC:ZT;e2ac<KU9
G&ZaGEf2[Hf.eaP:.PBA_Oa5A?FTI=.c6H,CDCZ2I+9a?])ZA,c4^QZJ0<N=>PRK
=FR#60T4B,8^)Wg0]Tg82S[O1)+A\K]6N<W-EQF452Z<(R^4@YaJe-U]N.47=1,5
)C_8e,cgZB1H/f7bR#DEX&839&FEGQ1-Y.g^.)1PWd_4d,]D#7TH34g[FC?THEQ2
]WfZX83aOgD(.MI#D9Xc>^#(IEf9_OWIe(ATaf>72ag#Wdd.8;PEUHBfYKZ.J@A,
;\&.,6T]97N<B,eR([4bD4WX(I88e?R&M.LLPT4b-L.^F2=Dg7Q_YT.d6X(ZIDgQ
&1SDSad,G3Z-/[HI[IC1Y1[.+Sf0)GHLX.P0EH63JUT5]XYW8&,2=0b,_<&Ca]>,
FXD0F0?dV)F)D&dPL6KYf@K+NYE_6>>RP/R0P(XX<c1bYSf)e=f+;,O,N<]J0UC:
]2&gW+@(\1@H-NU/-?a<&1IPTP)IQBG;Q9Hac8Ec.4aY1S&=RgD9g@I/NfAK+4FH
U.EY9P&[gZ\[@23AdQGD(\gOf,E\e;</C9<B?M:\Y>)8;F0:L(#c<I=:&NQV7#+#
?>WZ4_E7_M;4T=XO6Ud)7#.d4@@<Eg4f&U@E-K=0fa)^dOZ<6(Sd@#?0b15g[:XW
M96-S7IP42L)NB?X]^ZaICI^<]?JH>B8E\d)6D-@6f(\U[A^MTOY=DW:</)XO8Hb
D,G)\H4.:XL^MU1O6>H^:D3,26WA:6BJGRRKGf62SDC#JUCg+)Nc#J;-=JWY@1QR
VAV(LEbL3PZ(GF@PdUT:ZADP()VWZ>)Ng4<gK@1bK?\[XF#:8HN8\2aXM)3cJ(:J
&^BC?I-:R2N4:fd8B;(2FOEVEUWR&3#AIc7,;d\>2_<VG1-:@<e<R71B_(Wbc;c6
Ce:ZdZ9f@^W&LQ])-6-R_f?O[#EW2,8&I>Zg63Y8O)U>[ZbaB<>6WW?([TN,\Q?@
d-#4IK7K]fdI;NB@Y#Y^8WDU9[7#+BDGHEBXfSK.;SG)e-620b@QgP-@AE:(]7<5
g?[B0\R@4<JJbFWJ38e:GVZQgTBb6.SdeFCaFKS@6IVNBD6EIf.aAI-<P#=9?6U?
5-&e_9Bg_g(;0(<&dUK_O2?PPc^[J;g1Y&GT+Q1N=c#<O\:53fgTR./SV#YV38/[
WY_Q/g@e29K>gbBJE=?)K&GG8S71TVAA02=A3/_&SMUcVS+=A7K9[(T+,235HSE8
7G4@7d4)#d5T]G2R4.2_6\g[64>F21\<@,RYCFKDZ_Q<@FAb1;D4^dXSXHa<cW21
XWGGWIH^>40[:[)C2O/OfGE-/2Gc)^^f\gT_NQ/(F]H:&]eS]?;.^WI9:gH0bM#&
e@3&d4c)(dU@3-/P#2A4dT//:+LfVFDb4C&:0g_7R:&Y:YSKHAKQ+Y1d8A;V@f+W
=Y;P(4Y1Debb>#A][g6/0(DKSM00[)fZKD-[.>550A\PDW\[JKX)G1fVC#4Hf,9g
2;MF8,JeZ.Z64a0]a(P<34aPRQ<Q2@I7;9L;V1fF,Ec;FSd#5:1N=7([4[BKF:ag
Z5V[EXe;8Q>F247/3W66[.B(0\Z;B@e2[<=F8N0c7.TP@dR4.8eXAEDBN7E+-(N\
I60V#NO6\JM0I>]0;24J@;)(.Se6(9)E[8D\=KDMG4\>dJd5R;FXTP.L2JWbBMa+
=J@LSHWG@WYIB+f-A:\+3b1H9PK#9J/8e3I6&-\GS407NEJ(-7VVVM:V62ABWGT:
b>H(@dL87>D&S<YRR)b@4[K.Y6V)AX)Uf]L04#P3IC;A2_BE&SdP4]8Ub:c5IDbA
ag(<&1-ZA?bJX^UD[BD&(EK]T-d>4]:+8Ib-Cf]3)UQ_BK\R>;K.S/8>c(_bF:51
cK98Ab\gCZ1Ha6]P@U-(B_1OOWbL6T^(E+bB?DRY\c@&,N9YF#8IQJWdcXM.?IF5
G:)\6/-M.)]fGV#X<_YDg3cCW3Z#NW82,CeB>J7B<L_cCR4(,LLA4((V_>8+92f0
BcRF->e+QCgKBD^R38aG7QE(aScEM>(eB?ODI;/7I=aI+^OGP9c62FYXYST2:L+E
SEIb(9Q\P,.J>1<+?D:>S;Y:6Ze\>N?XAZe)PQ+TOEe/g?XWa6#I7-R)F,A(4(H]
2YH^P&+2ZYZ6a\X.9gOVe+IT@Db;OEFZTRd>9?SB;LUcSYPNS4NWN7gCGM;:W0Q)
\8AOBXa2Ra^b&B+?F2]Y+KdW-bPTdEPfS?7C7Ug,LM+W-:O@bYHD^bJDc322BB19
H-J6QJ)&^+6aI3[9MJXbc.,EMSN1cF84;@#aD5O>R.B@cB9.3JC9bB&P^K\a1>6:
3PY@4U#ZI=5I9=>6P&f-<BHaQ/4TUg^KP&4SSfK9-0=]L>KIL@MWI(_WD1]5BS,0
7@,2&0bEa]W>LRCG+@)86[O>3[[8^)X1\.0GZdT7c;;OF+Ta2dL#]P81c_L:,[\U
,41cAbBESO)fE3ZUfY@/#:8]GY[3:2)SXY6FL-EEWcE0_f<=Tg+C4Oc5gW22=2Cg
:<D<B0OCKI:Ya8#@Rf)J9Z^M@E1/_9EF1#K&>)RfQ(F//K]bROb>M8A1a>9?0SX4
.H<(N9W_-T72GXTLXgH0H#F:S/,9Y<F];0CNJP2NIEM?CK,@[U4RC#3&[bf-,&J2
:fQ1-NVD2Pc.7I@9T/3Y1;TT=\H2OHK;b&MX=/Ef=K,gW:S_de;6OcV4.abIR&RC
EMe/AZfFC//e+EOS<4I<GMbcSYbcg^CWUO0F73,C9FVKWBcc3KTK=TQWO^W12S1<
:07EL^?6[dIO?_5gD/V7e2\J\8-SDFROcO6_((MIe,4>CgW^:FQ4]4F#9Uf4:P,4
0QDZ?.1Z2_BV.R82Sb]^E4K>Dc#A:#_^+HQ1GgVL))9_R?I78[&&PWG7_C)X?.^6
VK(^N84(7;:CL]N9+R,Q2QK4cC4;@ZVa4IJL=,DN38;QE8)7Q^<2:3TRCN\@@7Y#
#<N2RN>9WIQ?KNO=YaB&RG(:(gAN?QEf+^YJM(2SBfO<Pe>QcKKe2;CIBP#OVd7S
@+TFH\L)[P\]A49/BXD(1XPFW=GNS7/DH59M+B/OAUd[PG8\EKSRQL^5PJ7,c2eL
)IPUP8X1deD>^@A8EaFc6c+J+]@1XG)e^&EQfX6_O(UT=Y&^MKE\NR7c8A2KC2-6
:.aRb)BYHPcR\5]Q;(OPW#L:,4ZPDe@410dD>aB1G3YO)/Df8^Xf5Q+CcOF.RSe0
K(H1#)R\DRR<(.@V5Z[/@a&L^NYSZg0PDAMNYad?1Ue#CVeB99P^Q6c#\4CV>Q73
V_],#[09:M]c>8S,__P-e9Z/N<2V^9O60d@g\XN9,FFC9KVYeS,N@G.UO^gLf6>D
1dHCUf=0fHgP>fBQT.D(1#SJbS6bI>efFMZ-9L&/2J(ZQ[7_4fAOK71071Q_0J?9
SJ]5cZ>aAcdXEG;L5QJ=EEaZ506g+N2b#E27A4NJGP?L>]VDX>6\)T:A+1c[=Y<G
M\G]H9PPZB(#00,=Y(Y]:U3S0b(?G)4PRZf85K993g>/JK#X9E4AdJE>KbcV0WZ7
:O_3EUB4FaI\E4:O:?T5)eQ+JQ4W&c8=B([CX<Q8ZK/W;]4VO^&H:Z3?H#cT1W/3
ea\67Qc;/Y.6)REZRB:1I<R/0bGENICSY9SZ,5M,C2GBJQO]N[I0GPSOE2ZAI?C2
?]ZW=05aN&B#&)\FX[V-8VHR+aPH0?BcbKN2g:8Rc1<E\()6:.KWE>U@92^@C(\,
FI46\NL4dE\R6>S>=M\8WM30D]fVE7;7Wg\dg<.>D/e]X>Taf<]_b_F[N4e2]_1H
LH/B#Pbg78A8D-f-D66U-1>_X&O69b,C3LadNF/(SJH##3VZ.VBZ_JDWOf^+AK:O
\A.f<572XR#ZYSeR5_OYX;b_YaEJ6?e3L=B=X3M<21FJ0(A6;Z5-&XgSK@1RH=X,
/>KdB=&cOaRSdW[FT<fIP0K-:LRJAE.(1PKAB=_)S0^\Bg6(1ZdT9@?GYI?;^c<,
HDG1.[8#5dD[_#J7S,a8Eb,A9]C@-DWSLLJ91Xg8T4bZU]]f?cMcDG[B9WTZN2f\
]^FEDMRG=CMeV:3Af<@>VE;fC]P<:D>6dDL8EJCD++<3Xf#0+P(GSLREXOV6bMd+
#7Q^=T<+\F-b]L,/eQ6T2+/J-2<bBd?06bG5<<>?W/4E)H=JI<BWEUITD>=)bOX\
NIMB2BP2W-,ca00dZd5&1cg#(ge8I>N:Tf5R>YRf&EN+TJKdbET:WdbSDQZCL&QU
8Q?9;.58ZL([;Q2a^YW->F8;_TAV-=>gQ_D6AXT0.IV2QV(:M72(f4IXZeZ.c)MD
@+\Ag1SUU8I4T.O#C\#IGbP1,UbcNGHYA=>H8E7d3T6acg24,c9f[@9&:L0YdE[,
&NRG-fXAD0d3?g[;?:AD<W+X>ZdH40HVJ8MN]J&&C84=DO\EJV<^gIU;5G>cC)/^
\4W.9=FOS6(]F>1D35L<,)g&;GbCJ?&DG4B;BD&_.cW4^R4JNU&EFf2O@)PDU1SL
D\(<&L=8Xd.8,c0W0\N3WB]J1-Tb2@XRE4Z+-K7DI?G].ee3@4D_A,_6V\f@Sf9Z
0&f:]0.MYI=Z^c[2\4ZC_ET?U<L6@P-T(U7OQeYX-A5^1==S,H[C7OC^D>([#)Ha
-#[Lc_5&<T5MWK885139YcVeG.bQ^&CU2a(=H.b07He;2AIUWP4L0M<Q@RA;O&d3
)f+@U5,1NQKa4-;T-&Y1ZZ0X-7Kc(TB8V=K^?fP-[WMc)\_Fb?ESC#5;\deX0?JT
M6Va0M>P[L/+[-c=/a(#^cfJd/RQTC=H1MC4VP2>bVHSUF3HIM_V&aAe3UG&WMWM
@cdf1e-D[-=I&cCL+RNWN[;J05f<27:2Y.G-?f:,AAB\-@NfH.:;)NC-=3MF?PP8
Ff_MA\gUQ9cD3-6YP.0fL4-Q=RQ?-D:<0LF<b><G)#8-,7>YOJ[R9.0=a,,M,.Q/
)I[7;YP(&3_0.bAZ-/A3@9]]&\(FJQUUK67]9K;^,)Uc^6OUL<T2+a/egN7BSgX\
a?I8GeASVL[0gD<V];>QRbD6;:HF_B#<RW5;O/0<a6IEE>6)_G1ZZ,KO1#^dGRDL
-JMK__5=:@G7UI].JU2@\g73G;RWEWDI(8DVE&GK]\d\L?XPSag44f+B[SW;#]#T
K=Ng[-P_:SeJCeb52\ag#bFR0S-?OM;GM?4_HUNJB_VeTd_#:HP^[g@B2#3C3)B9
e?>EWGP68D-(a@2>6UOAfEY<0;,g)WB0>JeDM[C)P9O\I?]41,ZE5(L&J0JJX?XC
>50++^.,3:3gDX?2O\A8P;G?=&:1cYAU_(I/-.&JKI0FJ=Oc_9g9c5HQ_?0d[LDJ
KHY+V-K0_+SVGTNHb=T>,Je,ISfK<Pe2@B;Y/TDBb,TR4X+^M?R836CEU25gM4O@
AdJa.:b=9R)JWQ\_FA3XV:?U_6L?/D/:36_MbdE]g7Q;+bYCU0O>c.E93D(]O?T<
;NAMPZ]dF8L5-dCXK78KPO4:PU0FFgWb]6F\BMW_SENSAC7PO_dS<?NJ_D):cR::T$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV

