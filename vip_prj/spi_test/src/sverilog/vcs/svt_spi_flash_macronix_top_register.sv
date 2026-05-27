`ifndef GUARD_SVT_SPI_FLASH_MACRONIX_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_MACRONIX_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP 'Macronix NOR Flash' Top Register class.
 */
class svt_spi_flash_macronix_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Status Register. */
  bit status_write_disable = 1'b0;

  bit quad_enable = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit write_enable_latch = 1'b0;

  bit write_in_progress = 1'b0;  

  /** Configuration Register-1. */
  bit enable_preamble = 1'b0;

  bit top_bottom = 1'b0;

  bit [2:0] output_driver_strength = 3'b0;

  /** Configuration Register-2. */
  bit enable_dtr_opi = 1'b0;

  bit enable_str_opi = 1'b0;

  bit enable_dqs_on_str = 1'b0;
  
  bit dtr_dqs_precycle = 1'b0;

  bit [2:0] dummy_cycles = 3'b0;

  bit [1:0] enable_ecs = 2'b0;

  bit [1:0] crc_chunk_size_config = 2'b0;

  bit crc_n_output_enable = 1'b0;

  bit preamble_pattern_sel = 1'b0;
 
  bit ecc_fail_address_valid = 1'b0;

  bit [2:0] ecc_fail_status = 3'b0;

  bit [3:0] ecc_failure_chunk_counter = 0;

  bit [25:0] ecc_failure_chunk_address = 0;

  bit enable_crc_n = 1'b1;

  bit enable_dopi_at_por_n = 1'b1;

  bit enable_sopi_at_por_n = 1'b1;

  bit crc_error = 1'b0;

  bit high_performance_mode = 1'b0;

  /** Security Register. */
  bit enable_advance_sector_protection = 1'b0; 

  bit erase_error = 1'b0;

  bit program_error = 1'b0;

  /** Configures Feature Continuous Program Mode. */
  bit enable_continuous_program_mode = 1'b0;

  bit erase_suspend_status = 1'b0;

  bit program_suspend_status = 1'b0;

  bit otp_space_locked = 1'b0;

  bit factory_lock = 1'b0;

  /** Fast Boot Register. */
  bit [31:0] fastboot_start_addr = 32'hFF_FF_FF_FF;

  bit [1:0] fastboot_start_delay_cycle = 2'b11;

  bit enable_fastboot_n = 1'b1;

  /** Lock Register */

  bit SPB_lockdown_n = 1'b1;

  /** Solid Protection Mode Lock Bit */
  bit enable_solid_protection_mode_n = 1'b1;  

  /** Password Protection Mode Lock Bit */
  bit enable_password_protection_mode_n = 1'b1;  

  /** Solid Protection Bit */
  bit [7:0] SPB[];

  /** Dynamic/Single Block Protected Bit. */
  bit [7:0] DPB[];

  /** SPI Password Register. */
  bit [63:0] hidden_password = 64'hFFFF_FFFF_FFFF_FFFF;

  /** Parallel Mode Access . */
  bit enable_parallel_mode_access = 1'b0;
 
  bit four_byte_indicator_bit = 1'b0;

  bit address_segment = 1'b0;
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
  `svt_vmm_data_new(svt_spi_flash_macronix_top_register)
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
  extern function new(string name = "svt_spi_flash_macronix_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_macronix_top_register)
  `svt_data_member_end(svt_spi_flash_macronix_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_macronix_top_register.
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
  `vmm_typename(svt_spi_flash_macronix_top_register)
  `vmm_class_factory(svt_spi_flash_macronix_top_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   * Register Accessing methods
   */
  extern virtual function bit [7:0]  get_macronix_status_register();
  extern virtual function bit [7:0]  get_macronix_configuration_register_1();
  extern virtual function bit [7:0]  get_macronix_configuration_register_2(bit [31:0] addr = 32'h0);
  extern virtual function bit [7:0]  get_macronix_security_register();
  extern virtual function bit [31:0] get_macronix_fast_boot_register();
  extern virtual function bit [7:0]  get_macronix_lock_register();
  extern virtual function bit [7:0]  get_macronix_spb_lock_bit_register();
  extern virtual function bit [7:0]  get_macronix_SPB(int sector_count);
  extern virtual function bit [7:0]  get_macronix_DPB(int sector_count);
  extern virtual function bit [63:0] get_macronix_password_register();
  extern virtual function bit [7:0]  get_macronix_extended_address_register();
  extern virtual function bit [7:0]  get_reg_field(string prop_name_field);

  extern virtual function void set_reg_field(string prop_name_field, bit[63:0] prop_value_field);
  extern virtual function void set_macronix_status_register(bit [7:0] reg_val);
  extern virtual function void set_macronix_configuration_register_1(bit [7:0] reg_val);
  extern virtual function void set_macronix_configuration_register_2(bit [7:0] reg_val = 8'h0,bit [31:0] addr = 32'h0);
  extern virtual function void set_macronix_security_register(bit [7:0] reg_val);
  extern virtual function void set_macronix_fast_boot_register(bit [31:0] reg_val);
  extern virtual function void set_macronix_lock_register(bit [7:0] reg_val);
  extern virtual function void set_macronix_SPB(int array_index, bit[7:0] reg_val);
  extern virtual function void set_macronix_DPB(int array_index, bit[7:0] reg_val);
  extern virtual function void set_macronix_password_register( bit [63:0] reg_val);
  extern virtual function void set_cfg(svt_configuration cfg);

endclass

// =============================================================================

`protected
g=MAO#E)&<9KO36UIf\,46(HOCZfC;H0LANR=#OQV94gaNg#A@OP3)/Gf6-;-;;<
)I.>OIA)-6LM9H_LQT\D?8)\Kd&U&JM_b/B-eVJ\DU<DFgbR)_=;cZ\KD:#De7+[
3?K/+4O+TB7:2D9AK;8cf:@<RD@6-GBfA=2/.FM9;Q4FbeXUO&X)8,SM[924T@3B
(?T<1&\J[<P<U@JPBXQG#V<;E9H^HQ6:Y@gOTH;&ROER+Ed&G):KaO^,V@0#2\O[
,;D?6MBIR-S,LQ(c_]0_MZg\eBJ?.IM#I[9VYKHGY3>KC0(GCSBFIS27OUY2I+U+
e?Gg5UFZ3aQ]I8DI]DYG,?@1YN2YSKVf?>Pe-=,e,()K^]g?<]7(T7;-;6=QL04Y
^P=&)&7M(LP+E,a7/A4&:T_EV_GCA_BL.\=V9CHH9M/4O5^eU\ZW8)1GN43Q^:9O
g9T?U7BN98?\:0_+?Mdc::(A.&WY1J/eWG^7<ZVV;>H^03]?cT0SeV^ca3+EW2P@
U-Y<[eLMBJ>]KCCP]P5N1E\YUdA4/;L4_RaaWaXA;U98TdD1JRFMKQb,,SDTCW;(
7M0M+eA_(8YWO9;+Wf-M.22P,JQIX0(89CT>gSDZ+-eBK9c>^bB@1K)470KBMK<E
47)RL,2A6\TNV7_dV[gQa8N-UM?2_5;OfS=0.E(R.PH6c1/<J+/0QC)4O$
`endprotected

   
//vcs_vip_protect
`protected
Rc?@fS^dM-02VI9X-2J6C3AD7I?AQZ#H0:/MQMA#[#&S2g.JaP4c+(:8RBBZ=OM4
Q8e&0HE+:E/5[5Lb+41NXX0I5)\HH:gd2c&O,/R#J9c/-CPOTO^1(KM(Q#TH?5P6
\UNEE2Y(1FU,Z6MPEMN5CB)(QJX&L16+9>[KfM2:MC20&,?J_a,G]T)V5X\1E,GS
&[^.1;(e_I5P]2H=:f:2dD)N5WD@SE>51/6F?<A@f2JQJJ0C.+B&F]&4A0DQ[/UK
YL\Gee7(;_e.[S2:2c=H&0:QN>ZHOD3da>5-V\O<3M,]3F:1.M9]^N<1aN=/.NGU
77-AeEO_\eXR=_^McF?M:)6<dQf-FT0H0c]42E7(O#f(Q[?@([&GdfO^S4XdWH_U
;OFRA<B:\/9dfQ\V[/CK:-Sg4H@ZZVOdGb;;gIS0/D\CEO@8PX+;\?H13:Q45]FD
:&5^=/S_HfD,PLMBbWXAY<FeVI^cO[6e]18^V-#7H304HFHTfUQT<^LabM50Y<TQ
(ENeEW?8L11RC=_(,I72H/1fZbQTKN\HHR,2JF+T_G>019(>bC/5OcM-G40\)+f,
7N\L(B>10c88]Vc<\@8)QK/3-]U2V.ZgaV9<]GRC(?8LE0#2O5:&VZI-&TP[_H2X
S7F59U>V,^:/c5Z[5+W259Ka?0@PQ=55G#f)4>FBOEZPK/e)B]DLSeN[G2W8HE<_
2^KML0[\TWB6a8\^(fN6Tb\bUJN#8:NP8]+d^AA#WU^Me]):Z^<FB-(CW9@7UX]6
0B;_8/=,]ZL]DEL0Dab=\-F.\K.>LR3QFO-<PZ.]CfXPbXG\:TG>EO;+Lb58dORR
MBX-&,f_(J<#TI6;A_A#4W2E7)X(?0<eX[B:1@Gg?Q/_6MQ[&T+,^TdKeDQ;TG(#
ZE7?Fg2U_;&#a<88XLd<b;\&MI1OO:#?4D)Te].1SZMX6E.eUIFMcP+I/2cL-7cd
50Z2&HCOC<R9._2;b)\Q(TI[F(8.AX),@@(L;EP.,d)eggePT?7>C0WBRT@PQP[-
>KO:PL-]4[FS1H<<:,TR0QVQ>N50RfQVZb45D7M/I^956UNabFQC?6_#[b?]H]E]
T\4PNd2=R;?;e,fKDY&BGOJWM2:,7YQ[CdbX5<(Y36\#T:VC>1+7M/cDWERZQMR<
@TM.<)J3H6IG-)U:(J@@B@JZB9a&8&b;0ZUa]3gMg)Ta/>EK>H=-\=DHNa_(2=&R
6gE/N,L00ac^,bb7LJ&5KUbZ5/)/(\/2,b^C@Ye=P-KU[QKU;07-_g<,XZ-\_D(D
]ZE]:@I;]JZG/KU?+ET&I?N1>MEPGVJ=1c+G5f-5D=f2)G>K_5d7YFOJVHK_VS):
gEM6+]5XacVbL)O(+G^&]0?4e.Ce7SA5B7_d]=P7^X6Q-=a7SUd:Y)E3DHCf?Ic3
T1U.>QC-IKPd=bN?\<1H9(LGELTgN<G_CJ-+S?&0;8b_U)XYF7:O(S85B<]TWP]B
6cd[3S;=cdaSX<#M_T8AYMP30IY,IRK4)UT-PG]\^c7e32V@&_R\b-b6\&,A_c@P
/)QcNB0M-b>Rc+a:04T:\+H[?PI;<-::ULAb9>ef2;=P<1bSIbeE27E2a-R;PYB<
@/^)25<(18?J#8G2K^Id]^Ig#CbEKO859D##\d4U/5S[?5G3-E7:8.>#Hg&1KdK8
D5ZXQ-T6EIQUK#KV([9?2/0-FN,PA@),LaH4DI5T;g&IJ1N&GINg#R(0IQ5e-9SW
7MC(PGO/+?G>42c+W>WQRO/_HC3^PH.[N:#OV?e,D[..I80]&RLN5Rb#DFL#GL30
TS30I46Q.J>(JHB7e1KI2CCcI\:@113MdW:HRfc3:3<:Z+NFC,NJR&A-&HP1,H8A
Ge2c+#GJ_C\YVMgc2<IEadXEbXYE9:74X0;c4/gUL/Z67AK94?gH&8Lb=\_]2F#c
KD;9=]Fg)C\&CU>ZS3Y/JGJ-V1&B#\/N[#K+_aS72[gZ]JOI<(aSDUPb.#GGF,L[
8\&<YRe_.D;NCNYS/DQ6V:(dXUM\L4J56a&H#_@^SSIf<e[?6O9[@NR\ZeO?];0C
#c95Gb[L;=3\T#LE]OZDZCgdT6\g[7[S[GV2Uf=,R_WGFbFU;Tc)Q&+F7Q7_@6<=
J@AHU4a>90GT&@7.I6C,_cgZ:9RcY?(A^)#?OQ^WdHTd<:/(V+(gb/\^c2.N&_]6
-59RB0Z]^CB9AHHAW1\Waa1f]7[H^M0ZW<f^GG(0,(abOJIX+C:6..8N;CH,HGSD
a4A0Z&_SN(PX^ZVc[Ge7[I</GOI<Y?KA<5(BgN3f(bEW[\1@3WR7V^(@RRHBPe1L
L[P9C+&;813;^?JC#&&//L)Z=e^Z@=<#WN,(:G>&Xd,gDEIX3T71)O<@0IN.QeHB
&9F>N82./Ie-M/]O9eRaU:dNZ-D9gV:W.Qg,LbE/bTY/ME52.[:a]=c7YJ&X:A1L
UR4Ud/55VdCE-XO0;f7b-KC5b(\N+b<P08:2UF,VT49PTA:F[2E]Y+TA@S#O\O+=
7b5MB-/D)eV@X=]?5:?E).74M0Z<B[EEa]aeX3@8e,VS0f2C,^>gR/+6?4X?S1ba
Ff]RR\bUIQEFPKePUTGIbMVA0#,e)BRR7/D^B(;RB3G9FLNW=fJ4\g;MHY?,N00,
^7A1dR=RGdEX1g/332O@+]>+5+[#(BJ;T2#fHG?8\7#BKD]PSS,X;dRUQ;=FB4#?
Ja^DO8NN=^:g\#(NR.QNa4,b1MI=\CRd1[/Y(PE1_&6TQIMXX\]:Oc,/4-H&8\,6
I@&a.).DFKZZ4?,[?;E@NCJ)5A>g74X9ecMV#6128_:IS>),K,U1>PUGO)(L88[c
0A;d>).g0ZNdRRH(<c:?eD3=LaX\>[&Q&<eIfJN<Z@Q).BTdEA6-S2_X@<VFD=MV
_AfIVc:6>2B-TVTQ-N>U0H:Ed/Bab-3Af(@31>+AGc.;EG#/(XE.d/N+eBGfP3;-
RNA02ZRT?cFFS+.ac,fS2]I[a][#0\,<WB[I:[4K<#P#=YWP\aP+8:-7C]PZL<_g
0g^E8-[.-),[BDE>34@PX_FO=U<T2P;FTYcD(aHfB^(N-d0:WM\7X77MJRd:TUVD
@F0gQXR[cQK]VfHLe-LV[.DR?]e.B06-NG^-MAR.A>eYeO(b,9O4^@TEVe+g3HIC
9ORWa;-Y(4,DNTT?[U_X?5;?>d8=7^F_.W-acY&+W-UCc49&1)M9T7,RgQ=d_Y)+
V7HV]]2g?MGY2H8#C+WK7+U;;S?M()\SW#B5)_RcIHHd?#;Q\_-Pd\U>]@&g_^Q8
dJ./PSWVbUg85/I@BSM-U\G?CHJTOK]G8HO#1AOb7\JegLUXSIN9&IZ1/NS=NIW(
aM1eIRY(^O)//7ZAf\NX.NeJ;OPgG>/>Ka^P632=GY#IU[M@/aVTP9><=@gDQ(b(
bdA]F:/C1Qe_6)f/9OX3+5g/1B0Ma?6^H8>f)YPE;V3SN]T_?9<==Oad#QG_NT;B
NQSO:_89.6aQQ5O^DS;M.OQ7X=RQ:JM(?L0d1K5Agd?S)P5<L0^dUPUEPTU>>3NQ
C[_bI&:^&VA^]Y>:fMf_3<LFV+5d.?409EJ9R5;U]6#L3\)<S,1S0\[BdbXH6JV6
//a\G7N_3QANT^F2>W4=CIf#a[<ZbIG?HE:B29gXZ9.2RJ&?13IS,_6f1/W(9H+3
.1:JQ1]#(7L#UW4<IDD];LN6/cGPe/HJ(V(Yd353a9)ZMRZ1YEMRM99]NR^dgJ(5
ZE#)+<T-ZE6BIV]2OC?d(gF6NJ,B9&OF:5@_PZ6)CNGGUf?JRICYWHY-DYa127gM
9R7F[8Z(aZK=?-=Mg:?8RW4P0^fE<JPc]WWGCNN#Y2EP_O>_)g@Ag^X)H76VTHEP
QDSOU.Dbc^-G]AQb.bd=V<ccOVZHNS\NI\L1?AVfD.+>bNb,Mgc;9^9HXcd<DV#K
b)WQfA#-3K053EYbY+VFI#G&K5VQ)NX;([=0A)J&R1B2+07V=20O<-1=9^W\D=LM
D+Fd-5U=F49UDVD3TZZLS+3;_-M@)-(F&84E(a>Q=_9Q,K9T;9@+21c_309U[OeG
[[7TR;F^b?9ES@/6.?W0<VeUJ;@I3=G0E[T7M<1HD=Ye+KXGWd<5>ESKK>902UK#
&ag1RfJF8:.?;g;(;:Hd,<,GY<I1W5GLf#eQR5@Cb5ER^NagKW/T=GaU\A;f;^BZ
(_^ZE#S0_7Y5-b;K.S/WP+TJf@gSa6@(JATA@AdQ<d?OL);CG[N:(Z)4XYB(g]XM
Za3^<-6dOMSR;YP2>1AG:/BBc)7B+0,S#>B>6gU5f@)<&8cZOWB,KK-6I.=D,L<6
+3MW[C<V[+LQ3C3eL9E_E,4<65:@TL#ZUV1CgGN7(afP.UNO?XdPZGd<;3Oe](<R
SgUDQ9<U1LB5FN3:1Z)dQSd0>3.[7W?Dge).Vg/Xf&?0Eb=H(T_G#B<O&]OG<Yd4
UKAYA8\e0c+8c[&#DIgJ&^(]e@.QPQ7.Ia=,YZ(RCV:=7[_#f8U73[7TN5A8,XZe
)f&;[N0=G8_E_<Kg_Y2VPc._Z4,g1F3/7[MJ1gF[=6/R/QZ\JLS=[LgfP4EfROFC
7VV01d2b-8(D^.54Md-J>dU\0\B6^CZ1D\/J-a626\&L+X_.6/b51Z^Be6=+L;gI
:a:N[_Jb(X3<X8>AWDXAc8(SIW@NM-8a=@G7e^460>@0bfF\@+08V83G;YACPO<(
^?c1.dC,UYH>W#=J/Z73M51U_]L:/1+/ES<O,XK>BF>68BN_)K7]9dG22,Z3OKI^
^EDH-]N52+bf3_5&\Qa]N63Uc?d63&Ff\(LS_?ABM6b7KJX]:R<b:W^60A;G7(57
RFD#;5(HX=gZ<H>d6TR6;W-Wd;06_KNHM)]WEOFCW7f<BJRXgT0,JZA?U;KUa&OY
UBH[Z?<=LedfDF?^7F_[IGM>dP:K+@<a?08(P0<g4/(V6/[ZGER-cQ2@]#02Z?0@
,[4JM0C<<[>7E)O?M_]@B4Ed94(@O=3EYaf#H+_Cg1_bD]=a^5;[ZfR2E;OX;+Y\
9MQ5^/.YGLfD0cJ@IcCFdCecSJ##]B9I.#_I6e=)1P)4;fQ08P-SLXBXf+DN)#W/
&64g3VFFPbc(J)gXMfb2;(UEK<C9@U]5#I547/JC_=Pb?\;FTB_D:&1F0U-6K5WT
VF@2IS1WN6XC[QY1LPR1G3,J@-gLPQEgG1/?[NF/,aP4I^G9.C4B1WD[J]I&)eUC
=[ZI3=T=MJA^a65FS>.V>Y1b(V:_.?SY351FO,TODfJ)ad]X<KfH^N\1V>,Pe@C_
-Q&VI^+PN6L_bH6T2DNXd.S.(3IRE.D)/D=GV8^^MKaa05-EP@6(GgTC\7@[F2\O
_CIK,A<X=;&P_bc7/&[B<(U<cTdF.G[[b+LY>&(aJ8UbRA-f,fFT.g74Z++a(3@T
dTBcTVBGC.?bbN@M^=0KeZP+L^28F40dO]NYLAWM]R5bS;82?CGD6+HK4I0CF)9N
02Q<fV_Q.H>76M#QALbXAAd(^23,DTQgUe@KGHeFE(D2>]NG&f2XXQ\3WSgA+<,c
@OK/(HXB>agC7=,P]:0T-?4ZgX3:]OTI=5(A[#2+9/#P2ZHBB<&?f790Eg6-B#QH
bBMbN8#?9FdJaVD4f(16YYA8ID(8Yfgb5I=IWD0QR[7/.L-e9ZATN\ge==d>V^Ld
VN_ca43XAM]O-6TE&c\49eQH5+J:_Z][JgZ9+BBdQ1/I<X&G,DE(B8;d&;GAH_?E
1C:F4IdM,,Z_NG^XVf8/UNd^&][9ZWTJ>8Lc[YcJe85[>XN,]6:gE-UKdA;F72<-
NH\=>]feG&T#4YbRMaEc<<f<5G0d9&>HKY#c0.4,6EBN73cW6+RF?[bO#0M/U,RF
PGWXJG.^Pf)L(_QTT__gTTfaHC>=[=8]A8+78WUfAOIV-_F)0=H[JS>(E_a^4].W
RKU&D1=RR/APEcOO2<NgN?H31S^#b3^-F->BJ@)7ef^E:NfCB@>7F)8f?HTH#[0G
6CYEY3PQZN2MVV_7)G21OZ4_DC^FC^gG5AO0LDA6:YMV_:Eeb1G.+fTCgEe5VPEB
0aNF_ebePK-=V84HWf?e4UNABJD,_)C_G0WfW-W\3fe):B)T/>>6D&)#8eL5DK[9
5S>.J2RI88?Wb^.cSWA]a&-_)IFZe#U/74HfMLYBOC;&@e/E#CdDXI;\@K#Z70=2
.eCW0MSEf#]W;?A:-KB)=eZ[T?3-gR+=FNe.8P/WTW3?Y4.+&3Z?-S8?L:]542]Y
dSF\c45R6fQbecg&JRg5N1.(WK[8bS#N8c=PeCD1VSC;LD3^E]Q0V.a4>F#3UV4Q
+Z6D?]0PRKSH:00OM/LS:7]=fReN)=N10[@J<4MOYLY;2WRXJOa3+f@K/.GVO6eR
GZedGS9(S^?E<6b@e.4-#9+;#SYQ-/#-NEcNAK.ccXU<=>TGYYZ_HJ7&I1NL7G)@
5YL<WI+3:Y7VdS1b>P1A,E8e_#>e##]b->_D6Z3:\GF-5<02=QPZY#+F1DVA=ac^
A.dIU>b+5V]E/a4:X&N_,U8,+6/@H,K1e?=QV+38@aHX7KU6_6caOXK8.=#\8<6+
eJW)4A+KPX0<],6)-d\5D3P>#&=_R(3DZcf#?1C#b96be>/F\-./IP+/@dKZQW)W
/KUXS##Oe0Z2f;SUX85U/YDTGK?FMR?,@dR^ANc>&N)WXeL6?,.Y),<B9YaI8,HP
,;O;6H&H8\RJBCD3).UY7g5O]b4V;Y2J<4F4,0>Oa^f7[KdGEBf>[b0M/5F.2-c@
S-S<T/(TTX6N3BOEB^)^]-(GD5A.A7a,&g:d]fXV)A=C.KE7CEgOW6T#?NW/>+MV
OX&S8J5fd1(d&<82V-\5DAL1DN59FYM96<1f)O,3b,B1RL:)b2a>?:Lb9SAN9GU(
c?dBJQ8Uf\Y_YCX,\e#OFH(BI0+3#\N<PfVOc<CGg@c55Lf-P4B?I]J?d#&XE4g\
DF>JP-PNaQ:K#11>\&<OOSe(<c/NYg-BU11<]Ea-U;G]@P40FgB^4L9SXY-/3-T&
BI6R<1[W\QZ=-OQ0R0.5b[H18.KBF^@IUV;UGCC8W#9/44a>EZG;gQDS-U-@fS/)
G@0M.@:VY3.fBc<EGBGbMIa0bE^:Zg;ebeO-=R;Q;G=#W:>fTBMB)bT=]fb^BVM4
-X<ZX@4>GT8ESZ);LQ6&4E:UMBfMD?fe/0DV&=_#0e]5F=N:g[XHg<LeNT.DbcXV
XJ^8IY&P7/>aM>1#]gM)4^8c.>^L8M&?3+DfecQdZYS&/YH5&,c#2>ffbQGe&T=7
YKVfWD]8-,WZ=Q7(K/.:Y;F3M7Oa6d+X=M#2+>>&4)\.,.:#D:B,HN4cCgE>Cd\R
BVRXf:,\3?a6RRP;IL39Ze<:f=\9:_>YYO1\JWHRMe6:DGSNX<^][6H8\3M(Y?)f
T);Nf6-V#<fRT=1^G0:_5K#CHKS4Q5fgRgF=:AcCD23<]_ZASg=+aX/0D&EW8L?^
.:f#D(QG#c)R=L[[&Ng5K9\9\(-(8ZNT)(>Z=+W>DQgYALZWI/=M[)FQ4(IS.@S3
QYJYLdb60L^GL>_fH<Od?^-GI#?IfI/]1R\\>>b1JGF3aac,_&L_CPD;dNdW@L:1
>2_\0b2Z.DIODb9@[cAT?],S-X)AAY2.IAE[A^a?1PbSR]fKZOe.K2IfUJZ\;[K^
fa5H^dX8GPcLZ:<G=&0I:a?ZI[PI7FFd68J@QU:QDUS^9=\Tb_9S9M?V9^3=VMOI
&NW919FHY;FFN\eW?U5KC5AONVWZEIS;adDa8NXI5Vc?)QPHWUUD[;CP9JHH5O8f
4c?CGS&Ua8KVCU7C7/G-Z&Z/;MZ6gJCC09&Gc=Z=EU05Ng[E?MEEV;3[]cSW/W]W
P_KYN,_/40FG&b\.[Kg-F-+V8Cf,4,TM^4-eZ9^fB14T)D>UW0Hg[SF-#9#A<+5#
=VdC;>[>/6CX,89Lc@8O@19N\J[=(UI<OPS#U+\43,#J\VN6MgP0C,2_YBU2[&V=
\Y#:Y7U)&P1_(@HGJ3I(R0:.<e,3WW^^S2E+=Gg2[9Qc:E0_>d)76;1#Q+JQA.2Z
.c]B,f.gf(3HfG/1+A,9ME>]-TX9V-]@C[g-Id8:H)Y4f8#@:ed@5#;&IgCa9-O:
]8a8=()<4L>H,M(#&RWBVe_3L1E3,A=dQ4FA@>RX48\C72g>Y)Z6DgHR2N:3,fZ1
Y-N08D;TYQA?7/]/2VYcRAK]S\77[L[&9aB4\V_bb>;bC<)e<MGO8@0EOEcI>b2.
OUXOP8bPM@[]U(OS[)DZT@be3@^JK,6L0bIQCSN=:D=1BcM),)M&,P/8d.6:IdWO
QX]]J;<_O8f249XE3KJc&VPfgVA44KTBH._,48RE[;PO5BJ1S5GU_9PF\0(,T1_G
D.\Y]3b@c5V_4LLKBH-bb;RHaM)U/JVG?c8+a8=7dLZeU(@,J9(#.g6QTWUIeG^+
TGY[\A#2Q<3L0_VJJC7371_>ea_9W;:aUBT#D[SI1HB0Z^:eXYFd3[d)4[d8LE&A
J>E3WAVg;HF=W]_Ab8:7G4Q-R(G,a#cEdPA@a?A<1<BcZ[34)9]?aQN3)&BfWc=a
UH=MTT-(6E]1&(PKGf094:TI#EMcS[7;VJ?#0Hb+;B#cEY#,fK<Me0AE8@^[g2]&
;J:1f+G7U[WO?##VALI&:GAQFLf>QZP&AX@5Ve6,dSI=M#H(LBFBM_:a6.=2(Vfd
T-?eS+WKfKUOeT,@M2,2V\E>E6]c(9)0Z(<#V#T-AZ;XDGUU[IX0<9f1:b7DN36:
@#KAT23H&8D,^&#Y/-DN#^C>FRM=^O)CK]6AS[eGG3[a]I0;NHYOVC6T\P<1J[\d
cW.bS__=;?3,]VLL;MVX&\RL96YB)(Jd4?g^PfMR(]7YQ2NJD.F9X8_ReP)@7#N8
V[[6c-NF;3@gFPJNAOM13NJ#Q6_O>1>g\8\+e(_1JV&<1OR27,JS2@)52K&f=)X&
gQIYEBa3T#]g.8WTFW)+^FaY\4Q>@=]/1DJY8?;1P&=b_+95O/IKU+H?<_J-U4:D
[3ROHWJ#PK/)M7?@H5[].06M@2eHCdND(TW^<Y),G#W3X7Z;[+QL-fA)1[@OL@YL
L6H\8cTQ/L_GQW6B+T8^VUX_(,-@>8R#dH8eS9_OTX0/.a2[.dR,VNacfYQ@EQ@_
aX<c9Z+Yf6)/J(eQCP=)\HRPG>gBRLf9K/QFJ^C6Z.\F67c#)CfeK\<KPa5O@6,=
D>1,GPQGS6,G_NK&b5U=1:a^F>>dK,6eWaAGLAR<&<4R()BL#eV,./BJTXSV1+3f
#^H\9aDC(O[cO)Y7AF?R2DW8<D>A1We^.2_/<JZP8e<T@.9dGN-:PK]f>c)_-C)\
QC,&Z&O[UQF:HN,(2X^U>(\b6RV;U,B\XfBU>NeO+eYZ1Ob&R03C(gDFa/@49Y>U
3+e;(5BT#-UDIBRSX]B;0S2CZ7C7M_Y=1K2>B-YeNZ[#JU)FSF#Z;_0UP#^>B@?Y
N.X;?+^]PX5OR]&_CK[dR_Ba5RUJ)QGeSCM-;+[I.U,^0gE;ZKED._?]PPc>EAS-
WFc9Z^fL1:;cI\JfJ_7:B7]335DCgeI]#aDK9\5SWc^c4+C(YQD4O]_&@\7X^#Se
IVT&K?ff-gb#eFR9b)==N1f+22Y0(\F]O(I4ZTH]]=3NCVF;4(CWLFGgO64a#[Ef
a4>+#AY?:3BFU;CgB+E[.VBLO\ZIP#VBPC:_[6K&T0dK\b@^Ogd8>#+RN?8<JL.5
-<GH-^Xbb+&UE/_-=(<PA/P#?RAG-0T;5gL.XQT,bE]WeIaEVOf6SP7XM_ab_2aR
,1/dcA)X0>0C?gIHQI7<bDOLc>Fc7?+ff@.Se_7V,S7<R#0^7fGKA2WZU(L)&=,?
X8\ZaKd50FUf>A],EN,Ve/(MI4bH?X9_X#&W73^)7?Cd<6M/Q1B^AaTVDLFVYgCN
(^XC#a#(23GVR,YcL_A^+g52ZJ.;,31\.8N7b:OKR4J1UXM_);6=U]S)cX;SSBfQ
W(S&Jc-/C:9ba)FRZV60]49T_14>1QQRMe,/N;U,&<5fXK@+H[Q[Q5M-#D+Q+_<P
()JeM[L=^]BQGI^SH[@OBM&1^DTA8GTW:62GgFGLB_H^@\QIgGV8Y<g2E1Ia\/6<
AV4U:#\\fa.Re6#Rg2XdPT:.QIC_@=GBU\LVB?PbV62Cd5;=SD4AG)SW+ZEb8X?#
XP]JWY[T^Y+.LQ8-(H^)UN=U_>F\8M?KX5X>#cB8>&5dUIM#H-@3Y,Z5Y64RTTWc
fN63g^@SOg+(9;06#^&QK/N>b6MA;.+/L8f:+^SW1eY88?Hf=g,3ER,-78_@g1NX
Mf#a]c\DY.8e+C3N:5/5ADfY+gg]176O;8aL1MKTb@T-F27O;g^WW/WBWT\8<.N7
Ef&9/@253RF8Z.&X-W)(S&U<1B;_\31;EgV2.-0Z@7P-]U>O7U;4.SbWP98.X68;
(YNHOPd;BLW@.YK[WL7SWO3b8J#1(?gLG\?:U^^S#+2@?9XWOH7P8(^7cV-8+,PW
Q<L.2[Q5MX208Gb[YYWUc6LF::QH(-RcBQ3e2GMI;?IWg6&/FA+N13\0V3MPV--.
I(d7?_\F-fEKR+bB#cNf<X3ae50^4f&)/:UDQ15-77/ERfe6gTVN48LK,7Q7IKBR
HED+6-5_?:URK9M\#.:;J-C^^CS^gA>3&3HK7(^]e(,^#ZD)TDG:Y7JK]?7S(\=+
[Jf#=0F5Q]I+?2W^21#]c(&O3#H,RN)PTK)4d>W2N+83aU=b^b0X5WQJ13V-6=.N
=L&N-(G?D51RdVDPE\CN]O,fef&WB1Me/CF0IR/-#70AC4NY\TS[4R\JQ^gJM@?0
[#1KgPTKbD3./\c\dO^3DMKNf(IH>-W91d&g)-QVFTD&@<C/Tab4_>#W-JT>8]-O
\ZE?HECE+,=1\0A;FEOZH[Vb.85G-GaUS#N[OT^DU\5fQZ>.X&Pa6]PC39AOA6gH
&\[[M30N8?2?:+F<;=\e4AbQ?)8]4e^41AR7d>1;1WBREfUL3O+MON-Z.aSQ4+I.
7AU_fRJc/EY)C0TVSgT>HMaE=><?1aI[VWBU)NDZ0AO.:FIa(57T]WO6A<e8N.WD
I6-;[Q\:5MS>4bZC+Mbg-M7Q+QN(<I2[&I80P>J(.OA6X@C-c.\DUgJ#/ID><J[L
:1B31K;?+,;72:#D0d?GQ^O9)C1Z=U9g5b=1eMU;e2[P>MagEG>UG?JfGWbceCgc
+]8>b(D4(8?1,9]=b=ba(J03P11L=15<I\]F[^BY;Y>Ob(,#&/ADE.0,5&EDVPK=
AI2gZU,_[7d0ed(^eM+#+VLPEZ<FSN1LMA2V@.<[Q-eC;K&K8YQ5W\a:Ga-b49LC
P6);G9BM;ZW7Xc6TcPeJGLb<F83,)(\5H0ZGK9d3_1+XUP/HXTaY5UdRS_20EE7W
DdG0HPE@)GC)O9]\MN[.7HeHG2=c^BN:U@ZEE)RFa:?FFY_V:H@N^ceH2R>J;9d:
6Ad;eXQ:^43K.d0_@&PDY?B4@O951]-LT?edYZW@_9?cVXF6M4_1]@7[>bA5>QOG
DO+REW.55B+OE/&J\g5CW-.?fU[0/]bDP(YSBU]&)SOKC+N1c[&35Ag<\_N-NPY^
SRI7BWCSN\>K5Z]HYf/SAUHH)agXB3A]-bL(#/c5;679FCDa,5XRPRA>H#[/#Sd=
_-dS<eW5>c&CC/P]ISNJM@GIYeBGQSKN/J&2cfT3&XXHU+HS+;H(3X.P0K1HX2KM
7HB8T4E0/.3cNgeSU76OFZ:G)GeNKgXWX>J;A80RMaOZL>(L1a])c=<SdGgWZL_.
X[:.2Z51CaR?[FafDD7bW15f:E67DaX+M_V8XR5HIe_KBKT:H]>6CIaH;cGXF_5Y
B_)QfG/GLO^C<FUDdK0=CV]=2eDQa.+ZL25e^KMR1Kb2-(.C8DFP><VTa3OSc1)8
.9BGZ^6=R/)ZI:Oab4.aGKa(\Q\ARQ,:fD3F0gZVGR)B>b4-\Sa1TC8\Ke+<gP42
M9&2L?[]D>#0WO^XZ=,?C&)HGZ&I>L03@VCBBJ<<=b5?SdW+7:+[[D<AQW([+[RA
8cOe.ZSN_d6/9Z_8a4Y@](&2MX0Z]SIBH52I,MX@QIV24:F?9cA]gALbC?#)TaXO
OY1@bBXT35dIK?98K;]>Eb?72&=N^aLE5USB]<(MHOeTeOeT;4;-U(/T7(]BB4MA
][<eK:(KYeg.4g=K4:O=+<R40TV/Q2M7g[9^JT3F-61T>SUf8IA:KS?FJG3\D5.&
^Y]SWH:cg6e^G5QGT=>D04A9fZ3/RUQ1_E<6@C=I_0_R=fUC?#Td98<2QgcGM<(G
.4Lg(C:-A_H1c?KK1KW#QO@M&LIF)XddK<+G^W(Nb[9W,5^^;P=0RPdDd-C<N8?<
0bcV@&H+XAAc-CA2LJ?Q.OgO]__M6N#e4==bTg<B(Q5,c[9_Q;b]2T2;=LW79Xd3
N^dDa+ZU:KDS(#U0HVIW],CC7AY(TdQ.DXHg_[@_4N,H0c2]^f?Jb:5T0H^2LX<Y
bC,W#._S^VYf)F]K/[]P],dbd,-JOL8-WB]J47P5=cR8e-gVPf,f^ICf8f)fW250
e<3H+@[HfHaE>QVMd-;Z[aA20(3G-/c.B@/8NR[6&VFb.)F1[07Taf\#=R:BdT#e
-II>22-bEX-Z.9N_@2,?/Y@9a8)LT(@[6:FAT[J85Mb&7Q@ecM_6-W2R[PR(U8Xa
D\37S:ZI+Z3+Yb4NJ456c?[gU:LN=<-]?;22<JP/P.&?&PcVVFO/JfNIIJ-:bM@G
_9,/N1\HCSFb0CfKA)VHJY?._9dB(_X;ENJS2??)(=eYS0<S0T17R^T-TdQL=G^I
>=9/GA,MYID8F9Zc^BXPD?^-HY&J\bdKEFI_7e>#,E@SF66F5NQJ[M5A/O/>e(,b
F-\;.D]H4F624J@ffQ\2e(]YB\+<0#-GXS:a0^3ZTcc,fTg30c26WfNU4b+E=Pa+
#.3@AY1A62>gD=K7c=KaMBD6D9#:^U,CNVcJM>SRGbTPcLEKYU/HMAXL1/4@_((V
&QgV=L.eeD\<Y.MGJ(N#OF0QVJC5\-@_=QI[^bDM+8T&W4^.80K4TY13O#If7-T:
PLRD-,>4Z2^73c7eID3B\aB3=GAg0E2Y(RfF#JV5@=R,LJORD6X/11Z5?PG3WNgC
O4G1gUZ1eD8@1@F\F]P]W0H9TRBF;6E12C@1P;-ZFd;DMO5HRY3eX9>R?>KXK)KS
6b8V]^3+@,XN_U[288ZP&M<1-&9ReU5^K26_GQ#MF/7(82G>2cNSRZ,JTBQ:;B#;
[H)7d3;JF3Hcc[cA46,BVJg)]a>EHS;87Rf<1cf<I:KQ3fC_MT.F^fULcZOL&da\
K:=19F).L8A>:gLV?-X9aUTRN^T,1g.,A7F08<A3G3JX/_L#gKPKWAW8T,.c)O][
S7)27]cR#[b<\3^OcRH7P?RU/AGLO;<]5H8;U+@.M(/QYA[:DQ]QJWE(:^&(_Q1_
dN&DGRNH_)dMb.M)<+/d8DZ?a+-8,56g#)W?,Zc^3;I3/D3XAa:f6;eJLEUOZe+O
5L@)^66f.]?XZAbEH<IPC^O)2LK[;Bd5UQ-64]g+:F.J7=?00REPKZ49P/BE)T/>
D9(79KDI00_0^--=<CX8(7MF>\>&F1[+_.LHMQC8g3H.+g\_<a\J#426.Yc,@NFV
12><34H_-0ZB62[7CX6MXDQ_<G41>.]H8VT@MP=5Y^;,T+[;H5^M)<Z^.30c)gQ6
D3N:^5_0T0(dH:WS>FH<U.M-/4F&NGY[1C87PA:6[g8:\eD.NI+^@RNK9C=b+HRT
/8DfJ19b^H_\fPEaU\8=b(-^>0FNe+MD.AOC>f?/OR4?&cZEG-QbWW00=X()6>Pg
Z-\Db1//_&>\:.--8CJ0deKb?7C6=GNX).Z,>QJUUSOdc8P(5)6<R6&b)T@bLTR-
cGB_5O5b361K@=&VHV&KA]A+?UP#JXV?BP/(aALbbe#a-,5CKO:K@>]N;2.0N>-c
@a7W9,PB\gHfWMML8P/.-/34gge3c.S(FI_CR&,S:;9&>JeOM1&-FT.O2KZK)NIT
TZI554fPbgGQ&b@U]Z):G^M7\HCW[_3A_>LJg0BEF?PSJ.(I0#<>]:3cH^@e=fB:
64=&7f<c[>RPM8H=6^cdAL#C?:.5SCA<@FT=8TG]/CIB&IHS8._D3YNNCZ,E^U-I
8PgJ+>;,+6Y=U?(A6CD_2?:2VPM+8,eF.,QcE9#+)KSJRA-0P[&><(:dL/<bf75J
-VPaY(1f^1F0K/3ZTQUD.Y-#4TWC61(.Sbg4#@VORMW91>R-FX:L)P13+KV/<.6F
f=T+2T+2G4O&BT._f2>IaK&]S#b4QD2AMfFPL\/\--+(WX//7=C8W#].8eb14.RM
JD8De)O;e@PVg4KXLXc^KE\2N:[L=D3,R]&E:gC(7:FX])^5RMa&<<^H2?]aEf=\
=M1ITb[f@W-ITDTX007_M3TK]UT(2GOL[f3P:EGQ^]eA)dI\K]7B5EH/:c]:EWW&
f>++-G7K0;(^^_,f<L;_a-8:eTCEGW5DVRC)R:<</Dd?U_VK7fHS5c2^O/-3<OI-
X4Z-PT?N9ZKA:;RK,2fX,=Dc-1,GUagLS9c1-HUX+K#aIVMC+H38/JBZ]H9-SgTJ
)?&N5HN42/ed4.Wf0)TOJ[8gcM1@C8RfU6+Df39@f+1:&XI^f=c^DZ4.cfV,5())
7P-4UZ@EZ.fIRedfc,gC]eb:&B]OKRLQQX7@7V&:#U.a.;/T2X0bSLD.Y--;e)37
UB48\5WeLB661)81Z+J^D)[XWF1TfHXOaFB9VEN1FRR@1YdfCA[+Z&;8d;,M>+3A
WOdNC.4GDcR+E&<d4<HZIPRd+HZ7?E69CFVGT+Q_34P+<TC/Ke?Rb.U13:&fE6(6
W/87P:)U&]H8H)0VT5^[K_?_A;TPOQSML^;<P;R01cV7\5^Qe+^;XV\T.Ke53/@S
fO0P;e)K3JbH^-7.=(<BOf5NW;4&aO7MTfT[7T\g#6/)6DO)_Z/Ee=4F(8S?U^M.
aC7IZ_L+]e#227UU0+37aeJ,/Y+b]/L4bV/G0I,93A5J25F:GVT003NaK\9RU>T\
QBL?/)[F9fVYa_8O;H[@B\a/33W(Q7<:^bJFeN7QB/UGLD6AM469N:=;+#P0D1-M
X+LY]0daY,)5-GgIG-N-]Hg:KW,WO/&IaL(^VeFb:_\I/WG?J+Hf8BT3)IIbP\E^
L-\MJ])Y07Y.RTHf_#baQ;dVG>2EL[);g\,NQ4._9VVM7Q;]PRLMUXRG,EJ@?.Q?
;:;f6Q@,-)ZJL:QU3F=YYZcYf3;+\^C\J:S>05eP9Y0D<)_bX)eD=aUQYG_1\X)8
S^MMC?-IP3N=c=NWSE3Ra2QBY5Eg7:Dd@gZ/:feW(3CT+eaYIHdJ?KIRY1_AN_C?
f^dO=P:Oe1MW#)8B;T-.72DGa?AD0^c4Uc;05NLOHca@5bC]B#B]ZY>7d&B1)d/E
5VURXXQ.:fB_D0f</SFTICaR&,BKA?HS#^^g&ZG68e;E8\/H^,.K+B9+d&9-fJ=L
@De+_;#KCbZ3]dbMHR&X6fLC6PJb06ZC+WLbEI3[5T[BAc/KRAY_J/I)HY1ZSVP&
I/d2EIg;D65_GAa-b6J7L,a[dJR0SfY2]8^8_FfZaS7TZ@NJN/)GA<f(^4U22f/X
0R[MZ=S]7T/EPX-_Z?UI55(@^:.430QC1E.\)B,TLGYWe?A7C.Yc=FK4dR)-\NN]
2-bTI?JfZ^_.-)I9KF]b;:1-Zc?9Q9D.H_#R&7dIE9EbTMRAUF,fXb5Bg,97f5FB
B7GMRYLQ=E@fC&aAOcJ[+,AEbX1G(A@K?ag+e-?:A&BJZV813dP1bA=XGK#X,P>7
#Pd\#@-9]HDI^;)=7FI.g[0KZaZML&&ME)JSeJ1M0=ORF^P2H=],CKE&g<>\3Gf/
20P14P^<?U-aU4a5e4V]54X+D#JL:^cf/M-3/^RG,><97^4GD=:5bd@?+A?UK)#2
LXHTIbAga99,dBPKbG4_]6).,YJb9#Ae_I(<?S;@982(ZVA1[2.)),(2TA>GRWaJ
Z,gK-e<0H>]L8Y(VAAX8&5]Z@YB:e?bR-B&Yc&PZ;C3gJd^2AOWLMZ[1bZ><d3/G
FJJ/>09\#3RSX[Sc)QP4gU?9.G<?RT8/]O\_ND:CM@6((IT]TKAS/SfOg<@XAVQE
#4bVVT>(fd=>>6b=,\e=W3c?2AK;8&Ie/IZBK7fDRW>YAO]Rd_eg\C^b1\O25aHT
HZWFFBO>fVCJB9V;_,5J;>/@K/9&9@/JE.RaKC&+J8##/gXg(_AVgQLHMUK\De?&
-.2g7/gf/?bg@f7@JVY6_Q.GJ0N2ROYJNT4BN_4\3Z0A>PXD<];2SL/=KFR+[:]=
=3)GO.+CdXXQM#\(F&RHNbXV;/JMBWg?)H&\S<<9,SWE7L7->/50@N.&_+69^8FJ
25OAL+Z77c;JF6V5.b<1M_@+faG3Q@/S]U/U:8d]<g,gNO+ZKSLU#g4d(g\,]&_O
AdV,75-XfI->?Q#[NFTe?XL<Ua:dV-);,cOcZ=#)J<AO1GA7QMc0FH6&ZL.]cP74
:1D^OOeG0\\]AJI,F^6Q+D8?B#WK#7\Y/1M8,d+Z(H97Y)2CVb1)P26P0RQC?<Q;
dEAge#@d4SS0Z-,IWQN6E4WOJ&[YT&c.25_:CMD([M>(Y6#)52X(Y(&JFJE;GG\0
V0>XW3EZGPK2Q;G2-V0,WZaOdVK&G:S[Z9R7SPQZbQK0ZONI^17a?R)D:\A9aF1B
ZI&aaG#:Sc&T:GBIYZ;2Nd/YWS1:?G.\Q/UJISQ4.gY:J-4?H(BBOe)g-RaXFFBB
8c_g\@::,L?7[e\[YJFTA:+M3fXNTEXM2OP^]KM^679c?0eX#KCKJXVM10+9</DZ
.U##dgT3.FPgLIU)\VS4TKeEJ8&0^XgC7\9,_G&6S]IFGL3D=WTIeL/]/-IM)a1B
L#Af46UcDL.87UJ^@#K<4<7Jb,E-3,[-NW4>1]4J\OMeWb2aDe[FXP_MUE+@E#bQ
V]])HI(eN?;G3V=C.SY#J=2,gT)ZYYR?7PAGW=SHN9[b^FIO]NR8_5B@a5=:1^\^
99cUK=RNX:)GK6XY;QIZ@_X;0bECIKb1.E_Sg4TfdV1QQ)KO6d<2.fZE5b,N<?U\
@J(.&F9<\-ER^W;@+B_BYEJ_#FU&CW+,[;R@RVG<<V:6P7(&Q8E,]?B8JKd#Y@)f
S>+YL6<c9H=CNdQ&dC0Y(X<fAQ3MOPSZ,YNfIcSP\64E#6-GKJOWKN.-a/\KM?Cf
)4fWId2<b9LS0OECF1I4M6a,V2P;[a(3S<HQcB;9@PAd-)-_7Y5=ZC/EAV+6JBR;
+Gg&e-(0c6)P82<TQX#Q/1^C,FcUa9+^D/\/>E/D5].GBff9aOGc0E.L@Vc[I:NO
F942N)0#=;.QVcDN;R5O:fV4GBJ/-NX3\c\,F1VaJ\)3X.Ce\P#-0;T-Afg93RGY
I\ER\18ETA,X_>EXH@BA8HN[ceYM+73JSFI/gJY,a#e?7/?b7ALaK&fUO9CEbYge
ERRdPTHKHgSd;/=f3N7M+U]/<Ig7;/fRJc22>:-/IYea5,_I#57dSYRG#764Z=Z2
;RC_:<bS5#cK6B4Y^A\b;bP0WB0T:dVKMF#X<=a=I-7_g^(\6DN])F;(N+#>L3-G
.N-OV8:-09[B>X62;c7EU#2[/Y/M&[@^P8aacS?I)0dV97-&H6Z/LMQ9A=aW62e2
g>7]<\JS\;(O@8()LfAB7ZD@:T)5Ob9:D-JZ7HN0#TFGJ8KA-/6g[fDOR^#aS];A
U0T[MEW-eK(CL:]/(7^>5AZ(:#NfO?>WK_Z0.2^#S<7/Z5+V?L=B1K-I@2ESD_,f
6f3WWMTMXP2\4Qg&0aZ)\?dD#7WI)ZKNQSL([B4KO_c6=MdK@9S&<?A4.?Kb4=.)
=1TGM9MG?-e0@T.H\32V^fO6e=6.bZ@-S9-CaYKO#Xc2NL1#<aIg)=_?_-4:(S78
URa/4.@bdacJ#SFg0B+KD4a\Y:Ye+_Tc;&-e63&Z\gXO(UPJYKPa;<&Zec^LSQ@)
,2PT-NYZ5.f_?e7HNR)[RD[3fYM9RHVJS2^RJ,GLO#=GdG+7Pa_[GA3#-cXSVg>f
-C#gHb<?/EdDOBXP;fd.<MRI25cJ#3#0T^8.c+V<PW+H)#\<VAJI#T(:WAdCDH0A
Y(O=C3;eH)@ca8aUL.VUUN56)c/AUUPaG:c9F-XA4Z]RdG+G.8)TW^/UVVa(S?9/
Ic_P38U9[WXD1HFXDXX@D(/QB8G?[5\Y-3b&V\K13\@CeJXGN_^D5.H-2QPZUH1b
W,9GbZdXUg(6A/&>#Y5DHbM\#g0W0e7R>3U5f7P2ZX19gUVf0D\<8U-CILLMCIgY
W5;HBL7P;[JG5PCE@U0#87)[.ScafA[-3O^gU)f4ReD.<R0^+fMPdUe0R:L=FJP8
YF>(\+2/XSG>;Xa\gYE:A?@Re;[]O.R1<[\3S=-FWa]5]dd6WT_]_C;EJQN^<83,
WST_=IRDRITEC5C=_2]RCca+5_HJE4c-V?Q#?6X;KJ>b1DK(83a,4?BeRfa0WcK:
_\KfT..(56f(]ZJQ&)G_UUf:2()(cTA>c2^2dL@eT62\\7>+.&dAaV-^4W]MB(2;
Z9H+_I9D-a<2LC:fUV4O)KA\fZ5Md?<cJ,;f:EAUD9K[2L4(QMK)Q/01aJ[c.;[D
J_\:C/V&,--&?LSR9#;O<a:F^_fcKSYQ[9eW:P+?2(BEHXLW<H\G8Z9_C@dQ\C\,
9?/->U5_c<N6;65@57+5Z5#^27A\d[L/U\D3WcCPOU^(DBPE8DNI0@a(P:D<.C+<
bHC[Q.N0gPUBJKJ8:W#:^0CVU#1A[)(7WJ&)=cAcf_F\Z(8MG1(+O@/R[ZN6CeFV
ga+G2WbT2?#&=1<#d8Y1<M2=JINKgBD2]U6[L2..3IPEBB^VPC0VE,JB8F#X:g[)
UTF83MJ[<+/d6_.Y=#MM,.N<O5_=g_eH0AX/DdDQcT5KZ^(NL@eN36LB[O4&S^(D
BeF8VafX\S];]<(OfVfESAbScdS_B#@G6Ha]JAU35^/R@WN4dJ+@(M=dN&BaD>\)
+gNC,K[bV&PO]BB3/b?Fba?I#PSJREa\)Xc35B<]egN,8H8S1CNB_ab4QHV?;NgD
eSE:[,9/;10GEY=b:F0eKWe:Tb?+=5S(ZA>.6/I3A=UdIU0#S1:;/VgDF@UIN1K(
(<)/>/,Q/6&#=\U5>e65>S6-=5HM.(X)[MB#^/,W?Da&6BPF<2B&BBdXbe6>W)b:
[HZGORgH^T]7g&7bF0,dU@fTLTWT^I+4CU0DL,+IaH/b<eTUKc@]Gf9MC@SBW^8+
2cMP.+#UaU>B,\/J0\&QYY/#B2UXZC#-\YbK()/\;&B_NOF9E1badIgP;OKHBH&6
?@+6>\0PQZe\FcBO(c=YOU9]If,]:AcWI&8DS+<AeE2W;S5@.OEL.A7SWGJFg4d<
6@RU3?.Kg6>RU,EIGUT,a:Y);T08W--bG<0]f/.;@\1?>J[0J7T=eZ+F6O;0N<=2
PLD^c:KKO\BcY:44dN/WcfAbf9>/@aOQDG5]]>[2=X#&4#IVXT;1]cB@O@Q#LMQZ
K6=++TN_,:PCD7RWQ>=/G-HZ(V_M48^TPTged.3_?5Rc@15(,B?];KD]_YJ,EIaT
7HRA48Kb/eY-2Mff+[IEBb8aMN&U3V_][KOSde>-<DH(WbQF=6e(G]6c4PGJFMV)
<]GaO5?-R>8+60E(#dfc5S^BGbIa2e&A>T_IFN..;c)RCE]5C0(:UP+M:+^GQIJW
50F6;4]+3<,>W)aK&6SHLAZ4_c/D9:TH)G0&QM+JP9_Kg(OQ&SfcZ=UUcIHP&+;W
#2B\3e855Z.)Jf7XZ#LHd-3,EE4WSA4&-@3?DH3f;)fb=SD]GHD_?Y[]7TH&(#b2
8H#8F:6Y:RIf;@/1TX2a>T=#]V,YQ>PSE0O^X]g=O,.U-cDV5ZN_+\ZAWGWOIPIR
1^D/D\>(dYa[^/U<aND)];&9Vf/gY2/.47]YD5(I8;G;EEf\B,<X^6>X&G+[_P\^
NS/;M<[O=Y&8KR?Pe7F67JgD:GLcK]0?(G(BU16caHg.2BV[UYd,MQM8P\[2?654
^#W?_5+5BD->HE<;5Xg).WIS1FZV4U#YI73/7C:_1OF7>IEB.g/BUE2)VT()D+2#
F-aD7-JaX7d/1PC+2[:cVPdTGb1S_M>D2UFX8I[:=D4feQ4A_@V,CZ4(E1I:90J@
I>D1O\@[<,C;d1cC^<XCNe5X<-Q?[;VVVb0f>/),VGPDFK@++gR;I?=JDDMI,g9g
dPL_OcY\?&.GDdRTZ)@8(\d):T5X9B_-b5#C(^I2S0I>_]\3aKAE0&02/-S6@L2[
T:J/f(><Z6S6)a=QD8E+3_1Y0[CK:9)Wg@D+A8^OM/L=YX@3PIR7OfV\(f2R6FMI
E)MN#XfU_@N(Z&Y80YBO[.JT;cefF1+J\]&:>eNEG5c0J15MR]9PK.Q;0WS<a4UJ
SUS+gWD7=G9bNGb/A+++.@&@6Y1CJC_?6YJG,7W<A.JB(FO;]5bMV5BL=>8gG2Xa
I0gbF,^17AU6?<NM[/[8/@E;_T^aS;64b[WbC.)J5\HbWW\L8Z.LY2Og)\.-U<KV
?f=_/I]Y[[I]K2N9KQAFNNQ4&^J.#M7c8)0A1f57SLQH91&]SV_14>G#,D0<2W+R
[<Q9]\178+,-M,SO9EUg[:(G:RK)g19BS_dDL-B^)4c9WU<3R9JR=):W+VYI-EZH
L:&_eE93HMPW;62=ScPG#-e2:1EcEPg;P^A4T:f),/=1d86e0CC^,QQ:(WC<gdP5
QTR?b\U6R2CX#:R1^39&;^:-g?3?HYYMc2.V2#=69c(\5faSWL\OQ3f960ZZQcKN
P^-@8gE(5-49gL[14];,R4b>J5;9YL5D61-e6Ac[UPA9[-gQIRRZ;Y]gRcCV.D&E
4Rd^2-7LM5#YGNM5Ve,@NGVU0B(YfKDb?.+<36I)gA4,><Hd_A04]6?\7[GQMKE1
U<^<Y(b5f+KaW>gG^d\MML5Pe+1ZK&DS<a[Sa9-JA+[a0DJ>D=SF>F\W_e[g^QU)
c:eI/YD+6BODcd8efSD4D._O6/ZGN>/VRRDgQBS5f0AE65.8cI[T0O:UV.HA.JNd
(CaS)0,40R7OB2_Hb/,K-.0W\M^41[Dd)JM5?^M[3]E@,[Lb07FCQ(@Z8#IQJfI(
\SH0d#8UH&QY)WU1=7,>\ON-@)D4&5V4,VGfObA3S>8=0GaE.[K#e=gX;T57gH^a
:>K9gd@8^g_8PH-D2F4IQ_OA?1@+eN7+6PDYTTeQf1&3N(0b7Z&+Z.OSdKN^X&S>
I;XG.&887A9(,PN^,Q2<;bG3c__CD#<6-:Nf.-W1\KbbbeG_gBQ(\(V4AQRa^B]a
9X5D4&08@@\DcQcdgd_#fD8ZON._d2:OD+HB+LaP]LR_aRXdHGB?Y:9,W[C4S9_Y
<2VD8;&A^V[F=JRX@cV7?bO849_,>PGWNX]EA3G2c?0^JVCFGAf=).+SR1c@b5,(
T=,Tf/:BbZe;4E7(/aP9g<-5IfK;@XD5:9@+FUb::RdaIHaDY##4#.,4;dHaOBTF
E2)WC0)^ZV^eS>=1]<4WH8GVYeNI/EOE&RAeW@TT6\L8@,(+(^M,3@]C)8TY>[)4
T@K85S,gM)@\90=47]>^>TAT._e+fCGQDPLLdZ?@87ON)9^JecESf,cWP90gb&)N
:Te_)BWFeAK_+UEMCTQN+2G8JYB)NbE17BWAEeE=b:WfYWdARb?1MgBYU_BEW52\
5@MS&H-P6C]AO[gALCGFY,#)B?@5&<3bEH:VUWV,fDS#;T\MCc=63_1@C+9)F:(R
0,aQ.\4Q)5A9+JB)9c6Z3-6#(+J4W9@-P>K5RU8=FJQ(<YX\baE@N-\E-MD/@^.2
-^75)RWOQad]5-M9F&-Yb9A6<01fN=SS]0=AFDc0\,/6LdR<9)?F?aaYU1H8;NBD
ed2<c.:8V6EMK2;J:)H7]3@H^&K7,&Lg@@9J&96X4eZ;^9I\W4O4f5CHUPdF1e^>
G>?\KTOK-^2==39aZdI5aFF4fUSHO11>8/O_RaJG-)f?2]0USE6\8gCNb)c.e,ba
=BYW,]FcJ1BOYYcH?C<c5CO,aFcWgUd<c&;-Dc_[4MKE8)gT-/T+QVa&aQc>+A.0
K/feGOTg^AAFf@S#Q;K/8#\N]VXT##G7Oc)WM\e5aRU,^V(e9(+3-fLb\)=OWX=A
8&7[P:?EER=)R?H]OQC9R,CG],+0[Kd)dEOSLM@;EYZOCY(MU:GBcUf^c;-S2-1O
EB7CQF5OB=eA8/aBZUff7Q/4GWU)WG>JSV_F^ZEH,:(&-AL92+YJ?=B)+-BA7Pcf
=U<9E/0-B[#MRVcKQ-KAH<C0EL#M+ALQbc8OTZ]K=7N5VI[6:^(1GWdJ,XPL?KWA
TNH?ONJg^Ae/M=PZ3dg167e+F#J59?.]P1VgbBS4@I3\V0/Ia/3:(Hcfa0??^WA&
MGbW\WcS5L#K4.4F=M<3:1TQ5XEUR?>C5K9-C\,FW65_Ed^[.?_-<K1<P+-RG]14
Q.YOA#eZKc<0L)^A?,f:fOg=4SNCBLGD\MObJKCdM#Ve(K&)XCU4c:M<E_WQ/6I=
PA/G6Wd+R#:D.?Z:],gIcDXYYY8WFA#BL)P-4]2U,L]2^4&)V)RfRM:^RDQB_T[B
7D4V8GGf.)IA7^TU6EE4/+[-;4H^I1.Z.](Z>RX4@XSdR<^@22.039?_^HN0R]aN
3E+L?QZ7_<SP\I?X10Y_2Z>@A_U_;DQ>NdDE;^Id;+Rc5L28^[#d^a,U\&)0A1CV
(^<J&[&C.>=CE#?>:,Y8]a;a/(g@:\\R8f[YBIe\7gaYZ__]4.7^6.d@]74L4ZB,
3NT3KHR.)Od?+]Rg\4W=ZIa]DGZ8U_Le?REM5R@JXIWEL-V8D6P/K:E],#SR-?4>
ETN@Ka,3K9&a.?W?@c+>OF7T^,8Cb^@_=LC8?1f:?\=+T7;?a>N-_AX\))P0B[9a
+B4P)22dC26L?CHJWGI]Aa2_d0)a[Ff[Gf,26GUVGE0:O5(,RHcb;&(7/5#B-8Rd
6BaQeW@-QAGM/_b-9F,d15OLT-QGQH_:4RZBV46NbF\SP<D0g6:==?>T;a,)]))8
fTHR6TTa>TH>SfPQdHab,HB>)@-GHXUC91?U2He3FR-dYK[;I<[7-E\ag(U_4N5O
DM73TUJKQ9bG0S>LA)bL[AQ<RY#3EE]YEDH,&61d-8<^1;+D+FCYcCA)M;8[<>MO
EUMPD_B9:?aeZ7aY-7>9V[X+[)R9R9U#cV<&@/#^dJ3T2@L_YABOd>OI\S<5=@=a
32PW?(f(Z:&@dg3dGZ>[LU2g>JGQXHR8V1E^_D6fT>YEX?Ce@eML\,<=GI+Y,5O9
#0KM93:[L-LeaY.?<RALSbHEQ^V688e:[L9@XL?Z&]^#C_c&I[I^&5[7<IN^cAO&
;gfa[4P;..6F)@P/f;#<,3]L&[_#[4.13F=U9T;bQAADaF93T:fH\WEcD+W@)ON=
5Q[M-/c^I2[G&L\+1<;Z;^1WV_9_L+gL;3RdCP&,M.PW&KQ>F^D-eP?]IEgb=PVf
(a?,>FQCGWTfF7_#@99YYUg<[.,N^J45)-9aI12Y)Fe0aN71&a0Q6&XKW8??UVdP
TA<[-<Q6@YJ7(S93(A@IQ588[D,7BJ(W4#?#DNUc88U6#TR+?[B7,QHJ#0/A)gP_
VOHfMd=K-;Z3]9A@_VQWVe:dJDPb40J8-5_YJP92H<f14([-FE)1S\/c=0;J70fW
.)^D\B(44&^<6,1A1CU7_)E-a.\2@Se,V5Jc;[1NO12_f:&V:.&73Td-B)XC3:Wa
Cg(?]cW&->#,Ia0.#E_M06_00K(FQ2Q)WSZeZ^6Q(8T_,3._GDR5TLD[Q)T9+O:)
Y>&DSdfGb3)-P@X8F^1[@^^8\]HDJJ>2<SV_-DAN/\(HEdQZEFYdU<Age+aCgYTJ
7QB(JC0@QN]2bM@)^:_49-:IH)M7<8?a/<2gb2U-@ZM/>)J0<O0fa2)0e53I#UA6
3U#>F^dNOB1g0_+f?M.0S4)ASJK\FKA\=89=(C.)F)(2]CZ?=2#9&3^B&/Qcfba7
3@DYQR(APa6()O_\B_D+P5]FB#8@]gV&>STVOPaQ,B,Zg4OZV5]UZE6ZUc<ITSO>
R=9Q&(T.?+F@XMT[Hf,(bb=:K[]-<.JGM=.c6(a]2Ig7SLV-gK8CUXZZ3:^BH@HI
LRO;O1=9B6Tf&^9H5UB@Z8TYY_+/cS<86^fJZd9LM738G&(E&/5dH?@gTf57W>Sd
<[N29\&\>K6Cc;LHOd>c=WI=:]T@05T(0/S0C7N(W,-X;_Q<))NG>JGTQ.N3O_O]
cOP_RXK4d^1.9D=X;9U7X<==B&FfO1P&E[68JfaAWEB0T9PNg[ANA^R:DIH.M@H(
T_?MQ)8+cV2g7.g>L5HA9#c&cN@Ge_DeVE>8dac)\S<@K&2Y@Y+/f@VET)^AQUSP
J^ff_G2/@>7:L^/^O++EG.f&-)d:OI8M)-V+F(e3e^)J7MC3:]Pbf67/?B]_#5OS
MLR4,bB3V7>_eE3J.NL\AGGZ-d,VR)dFB4YZ5_5PK^=aR:)RQeENQ0AVYCO7#41Z
C&F:K<^)3]2.^HYbFWL@b<ZQ.-&b#f<KMS9HeW?.(ZDE2g<GJBGKac_QHWK5PObK
(N.UTTM\;=BLZ/264_<[P.4QD5YD2Rdc+a#NXU<N3VUB;.MBX(YR\D_QPDO:PdD-
[<PTZ3T._gNL>5(Vd[,f)g;KV-@&_17.Y>e@232]4B=@S@5+>>I#37<IM+9FDDfD
91f;(-[;X532V,2,<3\_+3\0/c,6P9UW0K.#3Kc>J\JY9e,E[P/A0.3CSbCFbH?Z
ad+eCHdS??>PSU;4(C;@:F2:FP(YcKQBdb^SAga/-6]+]D6EfI<[Dc?K[P@>bbQ2
L]ec/2L2fV[e9;:E@ZLZU/@6D?:K2#1J6<P<9@^R.fW:0ZVMZ/G_NXD+X#?BW@5Z
0gVRA&cCc9-4GY^-TQF0MQC).I2/22&B\^XgSa:8-e06B-3#;0<;TZ#F-BET_ZU3
9aL^g4b0T:gFOL9K?ea@6<KS>7:NB:af6EJ8N8Gf=GdS:+7VKdZA;3#Fd\effO-,
LFOE^[<7B7\.)JTF(@4PC&M9TQ@:.[P,TR9OUIS#?O83^&F2eb]T/7d[&FF>4Ka)
(<@K^\-+8d)3+H-]YKY6U&REUf[+H)bY6SF,3IFFK4DC:Z&(ZJP(d3ZIGB4&D\PF
X5F&#Ub1-Z#LJF,Y);g<E]M4H\:R#,63?U(A-+/92eXK]W^=-AJODPbUR]R.SKgU
DfZ0cI1R=6,@<M+R2MaHPad(CL=C7\@AS:/D#+bP<39=7,AC[VI@\GBOd562c#1[
Ue?A0<2COG1BC,A4Rg/GaGI8dM#0(<3>BB:I>]f3]YBJ]H/Y=a\#7LS_VK.(#H9&
&PeO46deP>f)OgG>V]5_f.8R,MCU#::H\=+=)eDdI049^WXJ)O&#[BAWX(N+@2G#
-@T>OT,U+fL6eZ/C@VL8LUaN:]8FgW?LXS6^01(+I=&Sbc#_BaA&;2?JEaEb1Ja5
e&-Fe\eQJRaafKf#bMVL@&30-=NbCSQ8HKR#(T\gCXZ8f>GDG:;#fcHc+\]2L^51
E:7gS0RXG<:=WZ#8K(e13LJ-+gT:W?RB[+X\dS260>W5;7>6+NZLXGMZH^R)DF9,
NZgOgEM\&#G4&^S.F^OAU3YY.c-]TPCV-R8MVg75d:/(N,D=^eFO(/<8>f&A:>ZG
</?bF8aDJKYQRYg5fU5=HRMZ;3E5Z@2A)&AQ\X>16ED.,&[&9H2VdgTG,9PB]eH<
S99b5PeHf+_Lb+3A82R]R/(Q@f9_B)g9.6:X:?=I\(ZDR2W5;)TV:,0>A8&?Q;#,
0D15Ic=g:ccKK,Q#^7A(8BB\R<b?A@^VfX:6X90SM_)\C]Z2[Zg+5fdNG\#9a]J^
CMa1SfXERN6X/]R\g26YX=b70C.1_UFJD0J?b+2Ze@.W@WAJ6d[#7]NG?RIN3\:.
-TfQXC_?9UIF/N:-BW1;3dcMZ#-#X?]cVLY1?HA#&F<WgK3LQEV#7SYJ@;)WfK&6
<GDT:^6AECBPg7DH)#fI+[O?-Id=YPQ2SAUG50#+F6Zd>:K1cc+<J/U?_S6\dQO8
_d#5/AFJC4R_1d.CG9X6)6YNX9Ag#SA5Q9SSQgg54/\JWJcAWUG[Q<N,gOd?8+6X
V+5aH(9OCIU38\cD]LZ\XZ(V;^J8X/Ta[2T]VT8W/9(ReI5ceIQ)JX0F;&2POF(c
Bb/QM=d7g9DB#]G)T402OEbM&FPPg\Ob^8+<G1LFcIeK7f6T-)&Qbe,CWW.ROJX:
KQD:]5B[@/X)GC+6G:&bVPJP\DaH<>X,g(.Q8>c(2Fb5CI7HR1DS<JAN6);6W;E<
7C/U32DYB?])#AQ;;JdL_Vd1LK?fbcYP5-9g,[PH?S0JH\<S)A?W)5<ZY_7Oe1>B
-TaDX;H_MGF8;3@0.]0S)575;-[fgPCbXULG7/1>YJ4XfV>QMIRMaKfGdCF=Y1W?
0G=.egR+<d1-/e,7BS9-XAY].2>/O<@HEKE)JdaOa<egXbH;b-_[EBBW(aPA=K@3
6?#1BKELU:R+\1WSX+d.Z09c1:_V0[L.>,HHPN47><V27B6Y#&1HeVCB3Ad@^#T^
cUdWbSB+9BRZ/@Ab;2[c(Q3&/GD1,EcNZ;;L&?H:[:7MW>5O,e+]PV&K03F>R0VA
,/R3N/-,U+J-RB=BD_G4MJQ4b05,>LXAH4Jf\ILWKKAFI-7SE0V7HO47[\@PHAKR
P..X)U1TP/@8Z@K^&X0g3-^_FZE[a5@]6E8<E&F:8e,a@])NM1a,gf_5/9H^,d(;
(TB#[c,?+V;LKWQEY.NJ-d\Xd?0DDVUg8e2&#_4@&1/&Z?6ZPOWJUB==c<f^S2<=
AFV<b;\FeC+e2(_-NaV6\Z0WH-B(<Y1&^UTPKRJQfc^^a-,0.Na]c[@Y6g#+:UJ4
cS.QL-E0^;2UA.N_+JRG]X:@HW(LD6a0->,KMZ(YM4^b+H[=gWNJ]KSAP2IAbcCa
?eLH\XZX.+dK:.Y,[=;cKR]9=PD-Z<,=P.\([#8c8E5BY-3:JUFP-c)XISc.SKaR
.L>e\\JYaCfIMLL+56BEW[e8#_E,RC[EGC[K@.@2ZBcW\FEBGT4;2b@WA?+gS0D^
P1a[M\Z#g-AB92aQ0N49;IWa]GBRS;cfJgOUe\B864#Gc>BaY\GVN)W^DP=2bD[[
OCLO&1@8UQ\ERHeE_<9O3J->XOAG]e>g-5f\:G@F;N7@0;FO#9V>(fF&DLDC5(S9
L&X2Y-G?[DHVU721B-VYX/XLd>^/bW8T;cEGOU(>^C&b2/eQ_T-b;VZf0a6#B/V+
ObQX0B>N/d=dO6BCJDP2+QbBTEf)]3#]>/J9>F98JR(#Oe^B#33I[S/U08]?c.&<
b/g7Z1?6P(3-@G8NMF-.VF^/?-a)<461A-/^1C5FJ?9a.Q.f24^SCI9&S4,2[8@Z
R[PH(Vd0Z@C,9+;JO;SKWD3U=Z&G)-?-DV79</54#CQ+TCP&5>ZMP&YQJX8EED)H
B,HB:ZMF<QU.5L0:(]X[VVT6[aJ0RL\D7[J>^Eb\L_SDgT+9H>P8ADe8G95fCJ_5
@SAb8\7XWRI1BS7:Y;^Y6;G7>L&,&cH[Kd3Z)#ZbMO,JADPH/\&K#C.JD<[/Xg]U
1AFZ)6)3,b+A0cY8UWZ()#NTRQV((_AeD21RQT.?6Nd@N;?IPJIebcbZYZd&?Q7,
D41L&a8@V-NBONc2;SNJee:FH(/:f&CI4fN1DZOT&RSF+N/?L36/CQ9cRB5g98MQ
g)RD9Zg6gD#bAD=O,8DPV1MZ<6bQcNV@/@I)B^JSO&[HOG^ABLOabOWKM6^B+N@.
-Eg_#eODaf?I&@GAE:4P;3^bgC)^YJeHOcORK4d_aU&H9aVR-MHFH3^)0.ARe=-Z
.&aIKA_CaS13X5U2^UW<D9>)DG@1R0-e)NOZ<2)Lfb^A(=(0A;IQZI8eeU;WBW(B
GT>WZ\QKI\H=>Y(F#2B\#.d0,>>A,VJP2e[#:W:Ha(^JA+H2^3NJ,YU.H(\g6:R\
6E(,^TL+T[YS)c@6NRIK)X\B97EK<<M)BfNK].48?B.@,QaC_EJQ,UN;@(2T]HR#
52VbA@,EW);?O=,J,V.7ZO)PF\/:Ze#VUPC,T9d?F+BA;30HO8ObL=I2617@A?f:
0eV,?U3/@+B<.SM@_/#(#@P3SeMGK#[+U:9_#8MA4LY1V=6+dfQe[4-1(;[FX(9(
2M:KPDB50dGcW&LL6P?7d/+OeH:@S0D@)dg>(+H]SKQN@^R0&6dGHeA^M7OR&91D
5baZDc6]<+6TKVH4e&:/PP2Ea/JJ6]]M:=JSE)]?fE]LH7Dg2YMNeV6eFa6^?W_O
@_OYSD;NH^>O(g,;[;afLX,VH5Xag^C?IOc3cWM<]6<1F-VX2e2Q3Y-/IT^OOCHA
O_g)\75W5cC(WZN9f.P0XTH^X)c4^JO-M]7^#.AD:aLF)M5X31/_]/GD[G^6ZdcV
8J_->e..d&S-^-]S\>D+6Td]gZ_JLZKBLCN;93TX/Bg2:SW?_E:F=FM0]eT.HK^I
RQ(,);eb4>\\=T#<@5<62N--O.<:FBJ9:5NGDcdWKIeeTH.AR-_g]6QcQbI=cXQU
ffFFaD\+HD.OTX6>DJ[;714F@KH-gY9,]Uf#@g9C6ga^5Eg9bX9R;NO&Q,F6S?.E
Q@37G71J,X4<OV1Va@\_fZ<_3?D[VR#V96JWfBN+0(O@&EJB1Y3(4(=g#^]>7?.Z
JJa+E5cMUZZcgf9N<#bB=1U[155-)XGD));J_W.d&RW)D@4)M;ESB92>F_-(0;]/
=,E<I0S25F/0^RH8<fUP7=KQY&R3&Y<7ER<,C&dEU>>8b1H6HKL61G\S)GK8)f1C
E)/A4]CPA?.QY,-/6Hc#N_9E;E=W8fEK:]S#W+Y+aON9>LP@WCQa-4@6K?FD:gK4
fc;V.L#E2W+.U=fO3/eOK;/WgY3gXTIY\bJe<,\d1&BU/##9/NPW<;#BY[UF[4F>
+Y];BVL@G^@d1O=1GE0\E,S@WUQM-.2CRBZQ)?NZ8d<@;X_TASFL8XcZ&UeVQ:0K
KVW[6X(@6c5e91Y616UA73+],SP\a\3TdOR>d;?,)>@d+XYSLS6D&S=R4a2QU0\[
6_7Xd>/8RS/Z-@Y#7T3L[_7T,DC[;Q=2^=@DB6e#AKc;O+gX41MF#16Y^VCS4?_H
?@b)0?[C+&&dYFFeIBH:d&^12K12[>)D?VD)NH5Z(C-BEXeUI5_U]EDC8Z:>[f8>
H@V<7]bgFCAa,8=@M_fB_cVbCR:aW6^YA=#LK^N,-IN\I0WB?&QQbH)+(^_3]1Og
<TDT5B2^HCg#MB=V+1EDU/JYW^77LG@HgfHIbfQ#([O^gQUTW426^5)XS6SU)GYE
[/D]5(H457PM3-:ae.EW)P4^,)?9P#UgVY&g7;AZP,?:O:XZ\-2^b\(c1>^<ZW\c
J:QOJV_;>?\(gSWR)0,,dA5Bf=EC2.LCHOXB#UNYYYEI7WUPQR_9&&<<LK>=/cG/
V3GbT6B3>/2?NaaP80NVLPVCe_Q&Z/-(d].@:1dA/(e3YdfE/N-E+RJT7</03:F#
5(:9GZHD61:BJ4C4(3,EA@(:Cg7C(55K],\N_<.Jg;FG>5MZ\<<KL+X>c8K7bAgU
6K14:FHe7OVHJd8Y.6Aeg#[I:bR[XPJ.S1U@\C?Kg749]6C:=8Z/@>4)V/OV>:T]
@)=GCL=a?Q.+S;.9+I8VB?FH?1J-VHN>g<MM.>#8;DOSI5Z<J[Ce/2RPQ_(Q8a#d
A<-8[0>gcSG?XETO^\QQ7/;=3AO2Z3/aH(O.@c<_?V6+e^C=dQLZ<FD:NERJ6[;Q
S87Kd569G8FP1D)9:W23[d\(bJ>9&>3:2P_&XX3Tc@@:b22^SD1fgWR:>/CE]XL9
GGaM=V]6^?XgGG014]?SIHLOS76H,BPdX<\>D^>;AZ9#)b,(>;8+\3K;3H4F0e?2
PYYOE0c/-6M_5BeKAG4LH?8,M>f&\]f_UbfT?>D,9Xc-UO]Z&S3V?=<N@=eZ&;]G
)+.1-_2E4e=D<=3ZZ._e]N=]>6,/eI\b(_:LSaU?WQPC4RAeIO,(OXXZ@Ff2+#XI
?+\g^c<C;JKM[]AS/O0)T+0Hf+NG)C(JJLV;CL8+ZA/,JX^PM:7_Ya_BP>0T^:/;
,CUF5I+eMV&=HL;/Rc165+)7.+5O=Q#H;]S2_8MQ19QA1T&CJG9aQC;=3=BKCFFd
&(FQf7Jf#0=G3N_#4PKU@M=1b)Ca8#L&CVBd:8MBV.e.&:O.c]d(+bTP;R(2;b:S
D<)K]4=4V/Ng5P?&_9\CDFWc168R0@bEC@F@_#1JVY7Nf1JJBTT78U+:+ZWSB9QF
2S:=eOG?VR-)@W>a.,7#AAYbf@Z45([C)N17X_&0^JEVac-gP2NH>C:S)@M7]628
[d]MeGN>[;..@9;.SMT4@<aWG7__?RM+bCB#?]I&7bE<fJT[;bL-=J6\dV>W+0LQ
VFA1Q&A.b.,9T_X/6e9.d+3_;=Cc]#C_&(;8=4&Z&PZ7\3b.7cO\2:0HUV8@;f[\
-F&RfH[MgDXG5]d;UF.=[bP#P0GAM2K12R?>9=786?CAB=5[VCbG^T)U-C;,\MaP
VI4Laf48G=JIW_BFM>0.;>U+=A,T\K7dVd+6F<,dH\g-W/)a2(Qg+:[2e^TV]FHQ
V@]_=bRYQW,6F/?1&&PC&fY(:6Q?,5c8FOR3R6.VLQYN4B,:6cD+.\?5eAQZR>-c
C&MO+JeZP0J0B-,5[16c?YFE^EgY(.>I(a3A@@RB5_I^CQL#LY3bH=>(aU+V31<H
HQc5E^Tg_FK<BZI_,PO@N#9@7b==X\6+9GF^\dSAW11-#J.bDK.E6e<[Uc,eGCIR
DFGO0MR(/#0W:#;Nd27MeH)/B(63:cX5B]#>U2074.7&O6;-S(2ZZ0F6EW+D+eMR
?f^XGB&#=K,NG(dUE+&K59[RZYD^T(4.5EEPVd].>V-0Q@EGVVM[X.F?e]C<H0]-
+3,X>:^4<ZD2WU@H#F7PF3U,F-,EQ/G_80:^/cI-BA2bIc+E,9SI4CS6XM_W_5@[
Y9[6FfKW+,4J4OHSIe.dM;>b7>#,\;Rg[I5+]Y+IP@2Q49#Zc#I/054I2+,dSZ_b
PfPCNL_:QCWe#LFg_H?BGL@GU;aAe4^,/@:g;1,c@Wg;/3_M<DGe70LZ7LHLPa=;
)2[,R_Q;U\];Y)ENM7?LD7bV0g&N@M6UaS4YHYe+S[SJLAC6TK-JO(6GV<L>@QcQ
I0#CGb]E4:g]g41A3#G+P@U8DTFZ\[IQOU8@3EXcdQ/^.ATD+P[]KB>(GU_G.7g8
#c&ET9V_GA&S+<-+a?M-MdY.CScPb#MH]ac=JRL.=4^AGY0_#?ZW=))W>ZfMeNSU
1ZDYBXEg)+Vd)Y#+]18V[1-J^=8(7?bFMb),L@8D4P6[:.,f+R/f@e@Bb6:N<Hc1
RDEUGC/Q@]T87>X(aM8d+L(]a:K\2V(-^C7^VHQLM)43_J[04,K<XEB1OQ-_ScZ.
MD?X/99JaVPdZE_/[ZIM[@G8NI?D&BJ_BG-,1L-.25F&e=&3#+\C7A&#[b)W1Me.
M@>89,+=\b<F];>?4Id==/gCA/KeQL3?BQ21-.D<dRKb=@K-UXeCOTKQ#<\_0aP<
J#\H]:JP&XG2)^aO2b86gf]B=FG0&[2;AGJV+_CKN,6eTO/LF-Z7Z]V8Q<&cY7G>
W7L8QF:44U]U7(HXL_4RAc&9OJTIXea-YF01b1;4XYATCSNac4YU)a,86Y4DBSd-
/c<aZ8Nc>N3OHD1cNQQMbJQK^KF8ZCFHbI=Pe0BZ]<_^a0La_(R1R6S#<geU)aUd
5J0TIKgB]+C^9E0OBRc:4)Z&&AXT_K-2.<90UOP@.P2E.)Hg9XW#5OD+P7?06I9S
fI7aIG_gKYLdPH+fJ[N<c]UUfZ1/:QCDHEAOc\RdQ640UJ>--L#bRC0AbJ&Gb+CF
CDQJOI699=:>-ZKG5e98?#.L__#/KgK[)C/5)X?B4T]3(0HM]Gb33L@0(BX1bcG@
Of_P;gKb)C4CQCf0WAK-VD7+H(dP#SI)8S3H29d0.(TA/UL+CLEBYW>][CK#=+Qa
I3&+Gb+eDa>8._#?Z-L:&:eX[IP#H\)O#K2,G35.05;];WWN:1Gg;IOd?2HO1SC]
K45\K^LZZ.()J5aT=[]aA-I@6KGfJTId_4-?XH0BP).C2_POC+(^)AEJcEEWX2Ua
4C]/CJe,RN<=M60M<)PaMLB?WW/RAAHBHC]=E03#=/<0c:.E\LBQ0DYQG&b58G7F
bd4aFI)KXTD9&][3&0THT.E3bB[=>Ve\@I6g>RPQ;Ka+L]Oe6RN.(@--+I?3(3IS
c+D<?/b#^H?LbQ+XffVY.3@IZ0.>EF5AZ4[39SU?O6OWSYN&L=[DCFL-;(-S.4I2
)YC?cEH=]g#5:URK.BfdWK??C\]85SA&F:;B]f)>/(&8Kb)].F+FO_6BA#MGFT#K
&H2V+R/B+26>&]C929c8:VAKB>)UA<6/,FWHGD11EgRY5TTX8YG-(@XefG2R.:#3
FdMbVaN:1B.MMR>ff_JMTf:7#]V=ag@A.NBP;R>#NC?1G09HD,[X5Z;BN[d&e2IJ
.M&-@Y7d-+d2+YRgN0LF.-K<We+gPI78&Y;=Q.&b:KI_K_288,)?LDI4B8D6[T3U
:8H&fXU+W+g\\4VIGf-1@V/,GMVN?NbNA1?c].OFAI=>,^cF30HGY8\,Q,D^F^R=
O[CA(T)TD,D3[aG(3<T8E_#GRG:;8:;-BJb=Hga4_1CF+KCg,[E7/XS\>)(GKR<;
\((^A(D\&DRdY=15T4PLAID-(]Ud>29P7X?4MG@dcaGA2]MB)HH530>e;A4/IW_J
(R+>8>@a)=#-FdeLAV5K@]/L=J[Z](#FL^1eXR8aY(T&?U]JG0,E16(+bbE<<NM_
fcEDM9+XA#:/8B,RLe1WU;\@c\_QY=X<EUST]a;<Zf6(9P6A6L:HMV&g5^JcQBJ7
4^)cfd^T9]dSH/Va:<\A87P-dP&AS]76N3:WU8&BOPNP.C;ea(&R+ZbGCQ_NLT(F
F1B[)g^F]0E?Cb45H^YZc5,D4F9WY\#=0J\NR=;-cGLXYc-UcGX;U-4I:/IQJg(0
^)b@>0Q._>b,VYR/GK#GEa)VT:Cfd\Qb<[R?E<_JS1M:1WL+5<O]P7faREWO(9UU
LJ0b6WN55K(a:^M;e0RKAN=aQ?\f1aXOKE09:WMLU0W7GH)<GOQT#YQ9;\<ZI_XG
I<dRfXJ<0M?<ECMd(8@c:ZWZe5D4fSE^D36<OP=f:5S@;)@E2I-6Mb^:c=)B-RZ3
HRG^Hfc\ZV,TPX+d)B2R#[>T2.WG/d07<^de;f,3c&]IO/K7XMeTO^Z5#H7c8@dC
SFK=9=f<8>5RRABCdG6;5-G-fNUCd3F410CBb?3KGWO8-bB5]e(H7G;aERE)=Ca)
I@1OG3K+JVd3YHYeT3UTN(;D.KU[Y/+[439L-FDYRQEW+58gRf=81CMgZWb9&];-
>L7P;GL8+I9K,d./:/S#A]fACEM+()ZK_JaE58G/-_38/#Z:/O#<f<AQF6#4098K
[I1D(]b4PT5+^ZFUb?a]5)W],I5Qb0b84=3:P-?FRX=_2>1HB:<]W/d/U+cL/VF[
3JV.6&CR-TAKP>AMHJUdULe^^30#O5?<4N43[7f?EJdWG>S?^IBB#eaD_eW1M^MQ
#f@;NBfWMC,F4U9H9b;V^#G9Y1L^(N8DBIOOCd3BXVM6<B)(+,J&1X\#+NL[<HEK
?\B9MI(&_K4Cb^,,3)-ST?X<cdJ#V,-G&;4/H&8/FN\GLT+PbOX]].+/;J043/>Y
J,1+WLIWZ>X.E):-4^BEb1:fP>3-_0T^@,8;JJ0cOR+T=6II.-<X__]P_UY,(U#6
N1E3;9?GJP^6W6R6g#gI1ED79AgY(>#KG&EB<2:E.KbWDcVWX_2Re_=TB?:RRP/]
Q#f=XXX9gVKbB#7HJIeHag([R9L-EZZQF<JI5XIZLO[[M;>W.IUP]\/?T2OV[4_Q
UI)&(EJJ\9[^UV/F35WE0A_>L;(@B<+AI.c)DU_+L#KZH+)f3I@d&25)VG=O)Bcg
44NNFC#5[=Bc41[XSKf;Z71B_ZF@I^[9_ZYD&V]+,L[9cPb1N<5&2>]T7,MUVWB]
cMM(@8T6364.V0&9Bb(Y>CX_;N.)cT#<e;gO/5QFN3M8L;LaP7F&8eEMTW3N(;ae
Q=RVd3,f>]=A_0S/4egVA/WT1;I.(:LZX2BEbeP4N<IM=gA][1(=b[A0E+ODLIb;
P3G(:8FDKZJ<\Z80S]3e9c:.OF(FFJDV=,UKE5RT4eR=B;9F<[)77;Ye2F;2@/cZ
QM/Lb(\MWVD@PaO\bQ=JeC]F,/4g#.9I3_a&+6d^c:\:g+Ia>eA,E(H(Q?K&d<@X
Q97C^Md.2(PG[;\aYBD.][6Z&(c?IPG0B2R-HfX>;K(+_N<RF8#VVFV(Pg702e>9
U)WZ2+Y?M5eHAQJG(Db-=@9WaA81,>,U[J0AC/?C2#+g5L2\-PfY(S?<>->CdLFR
8RF99KDI<bZa)?:Jc@W7:H;4Y)P20#4,?(?#RK)0VVc-4\\DJ>:(D1#\gR3W\7U5
/R?0bXfDNg_YI+0=EBU/X_@@IBLM^O7A#MGDV.ENGRF&XAQUX9GP[/<,QMZ[SaM4
:H:BEc]3W,&P-AWXIU3bA&46)RB=A[WYG\cNV2[b/V3YM13)J>U(GR^+90D8ED/E
H+dDLd7<_SPMVACIVd(b9_@J:3US-YfOfPDeJ>Z7g/W]>G,eVJYJ^g^A5KA[1S&9
[0>LN&>DgAPdVVA5Q-:g<G.&BLcb\ZU0D>>HZBF=F13)V#SPTD7c0KK<AW65gMJ8
Z^-,a88R>eA8[]E.g_DV7M\/MYYXcVD-Wc)<Ld3BI7d\[Bd6(G4=^24_W>_gc\2f
HAMVVBV3#F.0#COf<V()Y-)KJWV>+F#U0B@OefIg8-0C73://\#(QSLG,(-[Qb46
Y,DP81P0PO3GCQ44AXAH8aRUQ1/dCaS3TM3JU\d]8O=1_.)4XIFA,D8:Pb7A<P#2
17#4^ad05dBM_Z(SCcXWKZ1&+0Z5dC1_@_PF7g14X+0ILTb?-KI<4gFQ5<(#.a8b
&4Q]BgVb=2c?IFEg5#b8^V3:XdCYDG.beTI6X-B:EQ/)fB=)b?#?.OSDUKD[ScD5
>D3__aKMd(IV/51++JG-[33,R+;:D^[Zc6a7<AP,,3c<(JBG-N.5C/PQTR;(c#?9
Fc6K2faCT\L/>[_d+EQ/TK/\7/@[M[7:6g]V-:>?HP[)ADf^:WWgdRTQUa&HcB?4
e+PG6S\fM1B@fPCWNJWf-8R=N^]FN&UdQM+Y\Uf^HVbHGD/I9VD>/_>K=QA@5W6S
>f].?(3e7>Q5d,4J]\(H,b00a[6E63O,7(Q,V3EP#R[)R4EA4N9:EBB>5-FM/f_Y
V52Z4?>KW_DfU5b0=7C^aSB5I4)AaG#FaS^ZW7Ge=df^:d1CV&HL.=-5V_[XfZ9N
TAWGX-SBQ:dKW9K=3G3,9T82_QYZbRS0OE>cCVM[R1_FgBFSXT=HSF.<_H(+#5\K
5#YI\F11#1CUO;4-&R^/?<WG(]3(]SDe&7[-AVFG5[,0E<Cabe5LcL#8]I>3]#F&
UR\/VSLXJA&O[_C_=Cd/+1-M@Vb\29@a:\.bR86ZM6)3V>+UR6(3)aLWVI<HRL^H
+[32KMN+,)]J=eOY@09A6D.9OW^HX6Q;;#QgX?:UeKN1-=g02bZ#6c.KO8C[3@fY
N,;R++R5JO]FLEd+N?FfGPUU#OVgb:Kd.QZCYa66/cP3I#[NDeAZ/(TW8E?FXFBZ
=#IVb<Ef>(JM+.F2_&Q^[86X6UXWfe4g0Rda89[JMM9K+47.;DJ4.5Bb8aHAF7Kf
fTP2CB=g/I(fcQH7,KPD4E/,F<N96ac51g9=aJD[BAPZY65?IT_/F_\#.\Q;E_^2
5F:S&@L760Ua^WO9>@14Cb.J^?A^R1C+C\25]6ITN/N9,5Id^:1b4M,faD&0#E7&
c0GfAI43A,QXS)Qc[)BDG3W]W=b?JP5Z#KNBI][I0TgI_G;QX5e5gS4]&-/WQMLg
W;UU:eP/0Da.)ICA61bQC,>@g:.>]1LG(T1d=/]CVI=8c<CKY84^T,X<1GI2))K]
KWK[,Z8.FZQ5/6OUTL<7?MDD4gg2A37:g1#[gPLNFWEgO<Z[UYKQXYB0_:&KB>T)
bXLJ7DYfgYgK)/>S1[Y#8E-X<8_)XP+0S6\-C3]+^Z-(K2c>[I3U#NHU20>-aGOT
3?Q86g/=Ac)fQ2S8NWWe35TUf6/<&S<?OAgG,M15;fHN(6CXZ#W1Q1gc6?106>Y7
FbgUF+:A]87dBaVfOVM=]]3]^0T)FE2,_T/bG5I1eMbAZVRS-2R,bOW>LT&-D@A<
_8aLQf=]1:0S/#c]Q<OH82U?3ZRGGDKL^]73+:4CFSNDg1HIdJJ9^J@V-2<e4/[(
#Fe0EG,FJ\F><cf-9ERF=QUa?7HA]Y\AJP^-EP(d2dG(&9MPY[B@K+WW[N^H+L<2
QZN-EOPUb<@]Y)D>0<;FT.WLdGY8O(=g3KXDWSCT1LJ8c:+ZL#GHFg;#CZP7CQRB
B8W5A5/fBTgdODLM_X0-;/Ag-K7O#c\6YU]f^&:ZgVY42),aE)(SeF^R&M?=#/:V
+I0N]><S4RX_>,9-N0\47Qb>bO1MA>PU7.<eDW.B67O)H<^?QOQ-#eKa+7F)3(GY
K>6C-:BRV.-2QR7Q3(JN=2#=f=S9eAYd=?[YAI.-7)adEW)S:)J]Z,<5@e5C4NLY
@&B,@O#W@d?f1H9Dfa.dWS1+E\SU1.RRO:K.1#>O;e9=53W.UAT&5_:NUS6+C@MD
^#4e;_:YKe,MBeOM#/@JG9a7>PEHP=_=Gd_Z)#ADNEH&C:)c3+]Ef2H@R8U0ZH&V
-9EaNF?6N9#fB//E5T>Z)VB1PHgef40YVL5B7X7DR:JFH.gfCLaYBD@21/.ZB6B/
P3]??Ua1.f?-OQ(:<0?-U]RAa<Sa+e_V?C5@L./cEW:92(4RSXTFJbf:3^MLT7(J
b8[_D)Y=@Oa,OHBN-g4^?Z\:@&&0V]<SD?N.aCHFD\.VB8[d_9CO:e_@RSHGTH.I
9?IG#\\eEgRN6=M_>3E<A=AI^R1Q?G/_JF&ZGAYaBF(0e1JGVPa<)]VTCQGNG;>3
YYPc>BI4]+EKP6[f-JB1],0HRdIY@eY?dbd&O:?7K(?9_<Z+MW#B=cYO^2JI:>9P
<141>KXLX[e&5Z]9?Y8[5.W_[YTY2d8DHB-7WP@=3ITB0H^<dW&XIE0:ReQWWHL?
Z:e-I&ReVUeJ#7VS@3L).3ZOP>20c95]\Lc)L\T&c^#N7+L^>eNJ9IK((IJW:FbP
^gXY->UWYD]2gSae;&Xd0+g96f3];BQGXY\:]PR25b=B;R;-@VZ>)D>^bC^DVLcX
_(XDOdZ8)FD7L_C4YJ_FO-N#T.IN/YZRGZNT^K\C?8>D3XX<7#/d5YD(W5^-b8#Y
DZ+1be@aTd>_TfX496LH;c\RE=]DKJ3K]1ZA#a#/&)DR.,DU\b71.Z&99M)dPeJ8
M_>W0e2^-/,LZ.&aDC[ST&DNMNT>0&FBD+(IWS>8PD)WIRH_bC)T0A82A@AJ7PAU
^\9#MSJXU7Q\@NAB/BOYHVYF+,UVZZR173I:O-;Gd\aV-cW6S[92^Jabc[W@V_UX
]H+_eVZI4S-0T064R5PE0f>T5d]FQC)CcS[+9dAEG>f543_H#WTQ)I9JM2>89RgG
&A]P[gA,RCWRM.V@_e,?L6F6=d<6<WQe[f]6^YD6NFbfR+9>KeEH=K7=17-(ST/I
^1PGG@SX4WF=&8THf]RA::Cb-T?<&1fX]La3)1U5>_--]Xg+EOZLgOAC[51K?T=?
MPSDO;b]F,[fd:bf[bY_e-)6@@W&N])UcQ&+fRV.KeC[-X:1],LARZ,<TC(7Z7Ba
?NKA-ZY/)/?a5LC<H#V3]V2VgNGL@:-K.67<FOHDK#G#/Z0gI@e#,]-Hc3S<g0Q<
GYB]JfST=?YLS3^Uf7;6&SUJ,UOP&Z(Ng?73E)_U_RcJN?(?cWPWV497[<5PSTO,
5GDO[L>fc&A^>&g22e_NG@QB;AG_0/4>C,1(A&M66.g8D)XO&DP][OZd78LP68&#
]U?185&F]aId7dC8JBR=Q/9<e4Re9YW6=)e?W<80.#e+-DYK:#MB:&1Md#B/;d)J
F3SQb81HfJ1@^-12d0aeOc(#V3d0WKF=L<5-K1GbLU7W9edbD4;\H\/Oa9;S[7LD
d<cUFK.QCN_Db[&[F6&)5DG+\7dc81]GZgEg>1AX7;PLd.^/+Lea\6MLaP-1@Ac[
+f81?O3^Lc7,TW:=X,S_),d#KecQE3U-TMeaIO[PQ@\SZ5[186_g_1^5OUScA6&&
0KDL-::X-fBD8)RQTb#O]+IFV#@.X.MXZOB[X9WJZPa_ZCEB[S3bEFDQ89g)2148
:;QS/L8V1]/PgY<^EY9=X;+,3I2]&e@[+JQFNEF+a0Q/]LSdQ0B86b?=+aeM3F78
ZOQd+V22G4V@WQIB;PUEE,6>AOS4,I(5\2Ye-IAB\Ig8f\4BL19LC;7>d\b<ZWg\
3&Q&TfRW+aO:M:].bC<:,O[-4g+?T1dK15&-=N3-BWESZ,]\ERJG7]A?Z3Y?5Z7M
LI_OKNLa44c^0B?=2d#39YX[0^g5.0C/PK+?&QFT5Wga]&/61K<.:[VANDXTCe+1
//><KVVQ1H-RI+YZBG,<K[>AQTK-ISZ?@^+1c7@C/X?V4c]KYQM#SL6fD=-(9D-U
V#J7:e)IXXKE-,PD39g@S7?OWbS<D?-2L\[]@/W#TC+8U<T_9#>9UHV8.EHTJ#G1
5[Y<R=1[P^c]Ca33c^::?ELAGFZNT\OCOWW::R&KG7Q>RC45e0f6[6Ra8>WNA8(T
9J?b5C,,QEI>+BROT&QJ76?:#fA<5P_E6^Y_]=Xd_A^_ecF6Yc_Sa/&^MZ?O[130
b):7Ga^fb8MBaAb-C+-):G=,(^#9C[S[6)]GcF<7HBYACX5L#Q>TcY1GO#eP-NaE
^R;dF@8FNf4Yd6:X+)&VEd^/2=2eW(=N9_L4R)[7C^2P6c:/=W6<(P>.A4cQ88\e
]eK/_0U_DEFQTXY,gaM\R2#(bgEG@L?fXf=OD=]:^@_]V#V7g)YXTELc3CJKKe@8
T&I1K4G75AYOO;2/5+,]4X8;a#B.5^^=2CR2dH@#NeS7MPdJ(5XNM;#_aS4:bG>H
V]B,d:YbfRW_W3(4I&R72;KdVUf8g:+W2GB4P:HI75aRJ0(MFcb,^D_FG3VJ__(S
PMc[+;U)P\VCXCf6dYJgAE(1TBP\+(_AT9_=e7C@]T#48A?UN[C^?Z^+ZJEMOEZ\
aTa:a65/X<;OC=;(c1QgHg8(dI/(@Q9N/a<1>XE5FIR79?]Y\&MgXe6S7;a)LD85
3L9)#_LN2+C>I91faTaPBH\g-X3-5TOBU:eHB^K/W5GR\-V=B4I:45LO+&0U__2&
;d-#-RS-[e:c+UMG&=gG(Idd69SA>aVNI2@&>ND(/1f6\:#-GKceYUL\^AFE@>[#
f&Z@cU^dFB.dc>:>+-L4YZ5JGY:9:>;3R<,DH\bJV4C).-+#TRY_U:NWIHY)FTg\
F)]MHJ;MdT<;B7EN9?Xa^CS8A=DaQ,4G9OUgKWUI,WF[+VY0f=O^2Q<1]^fe+/G0
W1C809RVILN(IJLV^(K#@GGcJbaeJ3]>^1(^0JBB)XDY;#&PRc)&[gW@,9P>YF8F
5[@9d/Z43H+b,X=eFg=9b[P_56AUIQCc+f7UT.\P_ac8FBcM8FN9\^IWY10Lb>5P
d4NO.9T>&,e,>5P5^F5WgG=;)73;>25+XM08;JNY>PL])97;02>1;:3F@HOT3e[U
81>3;cH-I[3+-a.D-^g&&g@QIgHDTF==NC?gHE:VIaY+)<U2N)UZS3+35]QFI6g+
B+gR@1#E9B2c?cV+HZ-(N+A3\1ALg3LBU^+FO<4>)<DN#D;A2d/8;CLE/c<B<?gH
\7;_ROVf_eL+d&V?c@g<=G1@K523TH&W@FTALK(FL1Y1]1F4C_)5V6Mdde18G.+#
]6I/.Og<H-8(K:GH(_UT)#)N244_\HQE90@0PR2E/8BgCP5VX=HeX_[UaR\S:][>
&/e:85I^Y?HOb?LGGSPNFX9\ZacQWgT72P8:<bTIS2BUd6GPC5WE2#>XU(YP(4=9
>FdZU&(Z8a#LXCg(P=-9^NeO.5^>@g&\TXY;PJNA;(OI=L+<TR^_O8D#S[Hb5R-0
@gV-@:\Y;:&MN2:(Xb6eY?1\.GAH98@XHd]dCFGGMCD5VfA&\K/>SR)+9#X\:3XD
K?4;Z=]b:b+UX]f<(GSZbVRLe@PE#YVd>]7C=)_)cC,6#V9B^BCK7bdA;5C:JZ,F
QEBM#^XZK9LX_H&]J7MRKN,fSKMSC.OMT[.baT4G>7YJ29;=d#TCP8/H]b;:@J55
+@>a2]TJ]:CbN1/N-^;Z@4<>TA6a]f[QV35^ZBUMP7NBc(ZSPcbb42<SAW2VIY@2
H5EQFR:LDK&SGOTQ9c0]=fFbYF+Z[V=6ZFOGgaX:E&BgB5>CGIM/NgM_1O(gfW1\
VPdS7T^6QXb>\+8^Cg,@TQXIK/HTQ]-MLYDB3]:UEF[V^VF8,YX#9e,73\c95-P8
L9AQg<7>JCO9)c0_M]Xb18KKD],=+D:b7;]4M5KJW\TKOXJ@T0E6_KCE2&G<5Mdb
#ZN5>S=.<Z-F^?RdS^_F^c9+9c.9Sa#6NPP@?^?#;++QV2HDI5V2KGS=J]U:X+#X
d\BHX^9>J^4]Y9M@_GTg5&S7KWK9=]0Q^WX:1&=-f,CFSDA)9D/1PQ2+,LZFa=7R
ZJ]]aA,Udf>DbB)54gW/UF/>19U4:.QM+)Y)A_S.T2<2/HN6.C#&,=<&<PIaBgNO
Y20Xe=?D9U(._D@OI0)W=VY:TK&?IeEKDDZT(\YG<Y)/AV8T@,R58_2Z\c_UeXP2
afY?4??B:Wb]4+3gPN?(Y&A^\?R(?-Ba6>-;e@Gg-8dDaOQWBZ?M+O[Y29NS.N+G
eWQSK@]5LW<G-;=;_)C1]KR6=1BQ_J@BGLf/[R51@T7;P3B.;bE-7We)=>7a-_,+
NYe,&2CcJ;(\=L@TaKGb_b4A_e9X,IQHJfBF4B&MOZLg(35QU4J^T&]JAQH8IODb
GdJ7A6AVNaL9U<?YX?E:g[d1)C?,Me?b3UNNSR_]eN]@fE#=Q]^KL277/9UKb+@2
+dYcFG[#f#)8,fBBJDQ1GF#Y7)9WCOB<\Hgg:\ARa+#2Aa4RC7GR)B[,d[S#^),b
N7d\FR/]X=B1fW#E6@XIdd:<I-d/#f+CccI1W/5)WBa?2#XQ,UHYL,Z(-AW8&fX/
3_P4Ue4P7Xe\6<dB-QB;PM&gU\KgQU#:]e?T<QXJ?)C3<,SeUCdYO3SH6HPLKf3F
&5L.EV7X07E)R),6BeMdTP5a3L6FfD\OSBY4Ce()W\KU5H_PEWJJG&SO0e<=D8^^
M#He0P93A[#.NU@?a;1aDb@T4]g((JX\.LS84DB\6/cafGFf98Xb:AAZGg9@Wb?M
ZZ>gD50b-X9.FBQ_3I03gOUfRaYJ(.4)g@Uf0/DLBYcRWG2RLHUU&>(14-QZEJCR
Of9\^==L_b+dF\Q5B<A4fC^a3gaaH69+dU,?G,GV_+]T.&617;29K<(0f[Cb,2^0
8GSBVDWS4S6TP(Eb.Pd0eY-ER<I/SLF,;<K83.FfZ@@_[1R/3_SJYY2P#@4^(_cO
eN@+G7?R8WaF8B99G_FPMZ(0W\[^Hgc:=NBVVgb>N37:A](RH1/0NL[G@CLZ(F7L
G/&XF2gBI9.&;A(WC:?&(63U4A[AW1AZb3GT0[]6/Q3:WP3.?&R<2+ADPAR)LHY+
FZ(fSLe)2<)MLb[IbUH=OH4]Q<?L,0P(dL>Q[Ufa8]eded)((K9P^)?L7\(I&9=K
?W-f)O,))0QHETB&L,^XAO-U.,aJU3.N\2TdO-T(?THKR?b3&QD[/^QX]TgO3M,F
Q;N+(YURd@N<A)^U09?@?PG98]T^aZO+W@,U^GF=ZW/>aC30RdK6b=GKW]U&c757
9E>&X^-)5<1QH(AeAE6SNbT.XU)S]GWI;#1=EE[eK[=EAW^A>E/(Ob5@K=C2V-.c
6U@;HgNN3?5:89CVdK@,eKf#aQN;K2Nd5PQ=]G;?2]+=MDM#P10D4XVRa@Y2bHL3
Q_;)^<R5d3.>ZPY(PDdHWE@G1XI6OAg73>b@V5]\^D]C@gN.OYWF:/6O/V4R]1/<
?BFZ-08YFXC64:9N:f&KCLN5#NcGfg-#+g-#-M5JI8;XI9c]5YG>@BKQRBJGM3(M
&LZ8Sa[G2<4ZF4f4&]:&CYLQM=bLKP/;\ag:f(EJ(c9.(-9-Ua1L_HOM4L1@PV?d
dD^@Z8?X1DI8BM3O?V2He+K08d<1]TU1S]_Q/Q#PRPQf>BJ/NY#a;L_7^ET/[G<g
O?W/=&T4D:]bXZ>CLY;\-)(EUN0&TSL,^)(=GZa]O#VHbIJ&e:0@4FWD+D>^K=[G
S3)+.^J?SZJ[^))f=<G8&g:GN^EB30P.W_a9DE,Zg\I)(a:HE:6ba.EHU=fA-I9=
Ja)Y_TcY7::35DdHXLV.Da&;^QTK[9F^a2_3R1dDgTB,8Y3N@,4DJa<VXJ:g/I3O
V+9A\CGJX3H;K5&\+g<,N?DT[&[3W.X3OEV>M0)+Ea7R&5+<=XX9c0d_dgef5<b-
;=#O.Ef7=@[BZ7-4Mg?#5T&cBV,\0M0P(J)UFV;V)F+9+Ib=-G][3-@[4G]XJT7<
1Ra.)1DcI9+.W/)]g3/bYK+NI]EfZZ67]Nb7:=L/+e63ZC)F_1LSYP<?2CBY:,=S
g?fg1_1[bDc9FNXQV.[46gRAD&^P7C8WR&gRW&N4H2,eEIE:NDd)TCeb#GS_RGJ6
548d-_JZ-0NJF,WL9g3_E)BCGA?,2Gc+KJJVAb#SPMO?e+@JCS&WTT@OR-cS3@TK
(9O,AA1f^A27?O^8@:(&S830P8,/KAWP=KVHL\IGROaVg(6U7IAW8bFI7&ab+>cb
2SOI04U_C&1;^R87Q4K3]0O2UA<3FY+e&R=,/5BF)<Q1VJd[Fg2##(]GJ3MCD=.g
Tf?O/<g2J[KAAe;+]c#;^3_FE1c7SQ5,^,dMUaA5Nc3@g^1+JK.-=+)PO4:U@;WH
\TK)Vb.5\gc1B+BLfS(6WX@\2<N+FE>XEcdJI+g]2=I6^4CK\(ERZ</(ALf-A])3
cZ<04R8I_@3?RZJ_X;\\LVS-cRZc71Q,TP@Y6/=S\ZCdT8CcB/[<-dLZ/5HbST&5
:\33/:Pb(aH;\?g7(LUdM@QPcdSDOgMYbL@\a?C=([(fCE692EV@6e_DMXJDUZdb
7f(W&d=&]bGV:fA+&Q:U?Q,[M.a7f]YAMfSfdJX._7;E+&A-=ZB^P86eZ+KJP&LR
94ZbM1)E)#R9)e<a0W6TLEdYZ+1WU/-V=g(&:6=fCRd-YG]E?-d?>+ZbLbK]_#aZ
K98L=&>?f8^)IX7?c6#TMIdDPE<gC5a&^I1>-g=&HLCWEIa(6.5L9K=YFW#fY,XP
NOg367O4IT;H#e6;WM0B94=W8EFBOX(T1J1440;^V_.J:D>L;b^IHIR=3K[3d-/V
c-2ZTJL=A^BN[8LYQ-RXGK1X^SNgMc.EDWS\6g&+/RI,Y?A^6),cDd2\cM]1^;X\
D2f\R:X,9\FV7NV.:J81c^f?7/F-MEg#9\A+)4c5O32Q6NFFX&7P-(OMFG.E)N8/
8<(\?P=0-Z10,>,(W01J<A^]aFISIg>Hd[N>7V0H40e0^dE4H@WL7^Ra@PRDASMT
=2f;]SA.ET+V9-&#0G95+1d.-5TPb,aN6T.(&.DC)_(W5<=ae3(F?0c<V/aTDd#V
DYIG:/4/T7D<L>@WXBc<K2+cDV12+]N/>#5:Fb,,?@K\bT\(@;1KM7X8I0_NNN+:
[0&&d,^:_e^#<)N:H_^P0Ob0_.B;XRLSHNQU;FP6@87<\ZV&C-EEZ2Ug?+,=<580
?[W:F((KI1QK;SVEFLWOR7T.f0(b-C^LP1dDARZ#+Z^3DU[WBPQ\?V3JN&)2O;6Z
7J-bU@RFZP)HQJZ+2R]KG\H((;g2bXDMdOICY/W1Eb5;9+5ARc<Da>KDT4M:,>O_
f9+dQ5:NXf_LVEe)NI,NRD0WXEd+YENHY&273#>9G]Q\<<EbM&6J05eGgB4#(7ZL
Y3?C1EAV;7E&WACg[C2+f7PY5;UfaL&8IT:/1O+;AX3RI:[8HaePfKRR:J<E9F9Y
\[#3UK1U9>(D.?;;>OX[=D+<9a5BBDSJ\@^C5U1f9606EKbQDO[[:a)QE0-57C-?
G\S(>+#:@W9A^,dc/UEG5e8/ZYdI[>;L4=WTPe.H@cU8aLB/1V_ZA(+JU5aJ3.1-
4?gYIUWdMF_bEYHLWJW[(;<P\,g+&PQA]D4NJ0S4FFCG,B72X6_AJ8H/Z_9BZ/YV
A,JfV3dfd&L]?H?HRd4C\:3cE;5M26AMO98#.U2/\LY,4Q8:U/V?aG3HV4^g;=4I
M,U3W>^Jf]=2eX=J)45dQ+JOTX66[(1S1004&;4_<@-^H7eGfUHI,X^C;3AK4?^<
LB_dCg]L3a\<OYY.G-5P9AYM_Q:(CI@3fOdLOUBgZF.KcZ3=fX[=N1(;=e<TUJB6
G-CUI0Zg>DE_J7<@\-I5,P<@20[f@H4C7X6UDd3/76fCLc_C)2I7B,/1\0KY::.B
aD#,J>R1Y5PMV;MZAW+[34/U#G&V_H=>@Za9(-;5OIb(E@0Y(-4N9.\E2dO^>=XG
d,e\D1+200VU5S3A-dG[E>=Z6)bC7WQb=3BZ68^e,0(g;1c&Y0Wg;[4>>,HZH8S@
ZSMa:91>c6.),M-7:YU9GGA3U&8f)=)0\^efL3D>Sb&5gDZQgTPd]<)L^7#<QR+1
T-+R4JFWMM#7J<#PE^NL)-A3_5GR@a7ML28UQ]LZ89.WL:X#C7dL3=g)fSfYC[50
0J63Y)&f):_Gd6)F3KEU-&.C06GSW(4<b)b,AC@^)bfdMK>&dTJg<0JXK)E8IC]8
E^YF;e<03YGPZG1-AKR&dfgB,/gUYE&R>Y1C@]\OYTG8XTfd2#C<#A(:KV4\g/B,
Q6CeJH+OWL7H+f.]F4d91Q2b,:(\4#fW=gBR,DJ&cQ_g:2ebIUe/0ZJW).-^-E\)
(RPC=->KX1X2:]Ta]c@O:d)L9>_G5.fLCK4K,+(384X:LU4L@;I?ELgON/S+<>Ed
XQY[CU3g3#fIWTRGJ20d2ZT#68fV_be1F@]1\LKTSRJ8bc;TX:69\_>U;cI-1^V&
+2d;NgU)@E83CF-=TPK[S(>QDU8?=10?TI)L]gYd9.DNAcHJ(-Fbb9AD55\XNZ?3
UN_?_83gAW.+;7A[\KW#IPbBdZfW43UCD>;_TbE>?HQO/ZKJbd9eJ+6)4L]&LI9J
L;&^QeCS0(F;2aP25e&)V=:@_)N@e<2K9#/PfV1R<D12AcHZ3UT;B;20MOD]6C/H
<H60CY+O(UK(eD9]K?1?e:[a1f>ge]b@;K<2>=&VMA9OKB[@?LQ6)L].(#.fE?]2
/+cX3,=0Mg-UI0^7\NB1N]90OIcdX6TRUUAGX57TQRC4daDS,#[.U+XR=LIcfQXN
#P21+WU<&;TC>)&<^M-ST1@I-WIH#HQ6eNMaHFZ[TcBD@Lb@T+-4bLPCXP,0Le5F
#C:K(;IHU3,P)D^7a@A/[0;b:e6BU29?GNCVeCX65U@>a+@L&Q<a^+#QTL:@b2ON
E-fU@S:B:_B\F-+C^HJFPfX\C3N>,DaZOKa;c-C#5c7ea\B?U?:fd,Bf1aEVX;8[
D(2+RdG\1/S;3GV+EY=;NcU:>ZY2a0c,3EKKcSgR>=BY-IVA9N0a<I:G>_3/5=&;
YaK=DA],_)1B)[B-fZ<bK,>d9#D1A/+ETRCH,\+W25c6ffX3e2J4#cP>=dG=A-DZ
<I_,;g>fJg]Mb#:59@]HDY>/Z#fYQFFJ.D&Sc^O5&:O)C3B@;d>T?JBR6aQ;CU2E
\&,LMS[/S#]G^Cef\/Z3a9C)DIa0X]E3L0\f(9U4?V^U4OGDbRSDT\eYFF6c3Web
^g-I3,+=(UD5\SS,.(P?2=LVU8ee(HX4_^\0(\SHEC=1F8e\WDEBWe4)EGKEO.4-
>^F4>WT>ZLR0Ne?TAUIUJ&,c4cZ7.4e4CQ5SSK\YK/3C\HgF,1P(80]J0gZ(3.gN
L09E,+[(WV_?Ef,J>d1F5OG?(DC.96?W6IC,bE3KU3f16UZHWa4P9-.?=W=Hb)f?
4:/.CfW7d@@3>]&:O2#;?<IP]f9I^/P+:))RXgL5PM_.a7(6>U&-NUR1QBg42F#7
,V0\F86?ZO,fa1<AYJ&9:NRGB[3E7=OZb27,?-\;I2])=QcQ6C</6?#@E5D>DLWU
FU4a8A#J[be=.I^2g5c8_M]R@O)<ebK&T@(2G7PB-G9F5Q:32D#DO5;fH8\-V+88
<JAS\V8ZRN6fV0;0^1CCd/:]0>F2a#WU6UR=a.Q^bT]Zc6(ae5>6eP55/Fd_^L&L
>>.;DJbB[UQ13=Q4A4;:4),-+7>9O<C6eT=H)JWJd06(b_+F#,;Z9KA[^f<D896V
[K[YF5:,F7]H6M<.<Y:Mc<4L[HSV2LFBKWO74?>aDd=gQ[W_T(-);H+BQP(OJT1F
UZHebXJbR5B>E_U^X4:\0VR[&:G94G7\QOT&fUT/4\9K-+?75&M3NSNJNc5J;2Of
<57HS;WWDID]74OM]/\L7g_P+I:ZcKO[(Jb6=Mf?5.DPe?;gLKIc@^)TH?K#U(.A
XgS-/E)f#-#MO]]OdT5_8?S1&RWK8H:BB-YA4=4-O8^B4eb04O5<5QOCMF?3VUUf
g/.-F;,^cW/.#3Ob/A97ga]faf0]88D9T\21D+3/YXU)^USH0cf,EYF6X=&RZHT)
-N0M.:#[996B^Hg3,)]6.U4<?KL4LG&OL(-.bbMB(1<NIP=9P],080=R[P7T#U[U
gV7(?#Q#21@]UFG9>59?;DZXEM&QL[X9TBe-:D#>JV)AC8fQWD8K0K>[RYc<eI,f
=\6+e2Q6.JVKGD2JTDB3<OWQ81<2bgY0gc79W+O4P+5KA#Y8c&(>3,S?AED&K]/W
e,67\_;-geDI3RV4#OEZT\)-^^3)2>,Xb3_U0J[+R<\CWLJTDDe\OL;Wb8XM+[>A
UGc/6aHDW+XRA7@N6PDVX8#75J5FO6Dg]>CR?T#WLRa5\;NDM0E3V7+Dgc/?&4D(
+\(P0FH8RbY4I@a=G2A=K/\VEdPJF;f.DQ,a@8,JeXdW;AV<U@ZXF9,:YY)ROEH,
:FP-OMe=-NG9-8CGMZ69VBDQKNS2Z]G&O;Lg>@IPd<E]7O9b>FM/+M<Rf7#K4SCe
EON]7dc@2XWdT+SUQEUD=MHTR0T7V8QC-3fK9U[&LT#<T=][-8]VZG\/c<G1FcRR
A<;@c,]L^9<3SNIKdH=L.8KUB;N?RVP],b]O.cX#<]fK+SOAM-]SdXb+=aIdTQ&Z
XY?5HZLWP28GLRT]Z\VQbF78^c].L<cC/Hg<5MSKWV>dK)H(bfaB<(@L0;:U+CN^
\G??/+Z]b<&Y2IXZO;MB]IG2Qe-7Fbd645QBD9A(N)RHTNIBJ-9T@cF(#G>5a9fA
4W:_fE4C[)/Qg&9\NFB:08&a8-Y)JbQbA,:]@b?FO-Ee.ef]@OXN)^^L3X_3O+XH
4gcC.<O[O0V-CZ.UDgVK5E5=_@)9BMU3,^)E#4_FZ=gO\)F4;.)6NHW55JgF8E9/
S=5_&]FL_Z?5J>5#JD-Q5)Y59VJ&Q76N70d=F)\K(J7Q5ROD2-b3F=ZDYSNHJ.#&
5a=>L/;.:XPQ]X&09SOW@Uf5e?/I0.U2G7-[/]F2?cS9DC/A=eK2Q/\.-:Gd;gPW
X-S8G1JQZ4GbEHN[SSc_GgUTB]D/6.fBNfSb2YX8-g#_?B670/VEU@QWX;WV+Y@P
846^/=#I:\bLHV?6dAWD70Bf-,;)5GT&g;7a:bVNDb9\;E84GH?98e7@ET>_DQ5P
+)R>MS^J?BgcH,=.+J+GIEDZBa)06,VZFFDP:FTC.&Cb0Q:X^FVYff2[)E72J==H
.f^M1Q)gP:B]^<0QbgW3O^cAC\P8+2^\&6@B]?ZM?40H<&W<CW_@GgJTcQ/YaLIE
WCG[EgGLL<O0-+FL&YGB7&[]Da3dE0,MUCOMOWKF7^I^A.U-VJb>0.ZEW&FJQXP?
-D^fV2bA;(&EO?D<3bQU68H5R+6W97Ka],e_G9^?J+Y_G+?GA2<2L8CF2>C:ICd#
A^Q2dE[X>S=Sc&\OP#WdK\>T[75_:T=Z7B(#K^#8F)08COWKYH(K)N9cJgfRDW^^
S;g<=.?K]62e9QS(.4#K1V9/Fbf[2@\W?&f1[fHYOLPcE9W.V?&[<e>8\e4YVJb3
1KU_0g]=ZBQ+FDa8\Y4JR#UV8eKe@</@(7M9+Yd7L&g7D,C#^48WH8NPL]8CW2_2
3WO>OeC#a_Y&(F,4HMcOMgZ,F9RS=-DIQFU9a6:))5PaE.(+NZZ?e/#-1#VJbSUH
VH9ZSR9ebUZ)B1AdCP>9e8:&9PHQIgD[X_)=K9/4EfD_a+28,E.gHZ&.@0?a3&,O
UL9(@7L^e)HdYAYHYSYCD><_@E&TEGC,K/)26&V&<KgBH&-dWa[dOH]((a[OX<^N
2U=g\JHMUfBW3FB>40eQ,1>BY9+KP?F.#@HE[EPGJ1_c(3^H\\<f1bH36J<HM_:T
DW8W_(>d3QZ#R6O8Z<?<3+E:e8-G,H3)\gY;@_]\&TE=(/UeS?8ff&S3S\/#XPQQ
#YVDMIZ@@1HV:66g/+U83.;S2cI(W(Jg)E@<bB45O.[XF?8g<M.S?0#0LVA@]<Ea
f6GG#L6<eT\I.+),U-@Ec7O27@_.L#)8<PCPBE3c\EQ:0UM:?2X7Y)WA#Z^e_B]8
WGZ0SRRTDYGL:OI0?>CX-P7JOa5E?Gcb2UQ2Bc32@V78>P]83_,aJI6:]D4IbX33
Ae+#LP\<cAPZ[JNFL#[\6#IDMT&bfOGe=&4b(=<>b9@&@6P,I=;WPBG\Bag-7X]U
,D#:/U+8DFAg2Ba0Rd34TV-8>8:cBc>UZVc<a<H[Z]B7XeM:X_+.OR-NXSB7B+^_
KTZHea:6+]FO\4=[@MHJNEb?=:J-&b?R].b0dWdSHUSX&9ORDP8IQZC9[-&7Z?T9
cF&a+>A4Z(/L=VIHc1,DL/)@=R>d-,57HgIV^\JOTf&=G-af,AT8YW.>D5R-.A6F
Ed&eGJ1gEe-CNaf?6./8F\N\W-+_P\g9)VIYLM/c)YQ<C@8[:;&L7DD5BVeT?&L4
4,eU#1Qg;>b/.[>Z-XX9bS+PdO_P4@5DB-F:KGH&Q-dHd49W-:G_C(&geI2AK4^^
ZgI^G6=&EACDD,M3<Y>G,/:FKI:G@O\,YX&;eJ?;0?YUJTF+/0<1,>[F&P,TTN-#
1FWAbb,WREa>5g^?+ceI&gc(2QV(0(FdH>2JFK1V(ZP)U#@K4b.@2]7DY#-\UC=O
Dgb28(B2cP;+<9_@@S2C[S.@<G\^8F^4CV&&Xe4HFM?aI=:R=OF4P3^,+_OKF)AJ
K)>32]-Te041PG9bS9R(5@<ecE[,DgMc_gY[@fFgZ/G<B27a(U/T]4L7-J[I;fDZ
VK_8^B:RI^7:bAS25Q2/KI.Y2>a5,,/Ye;YKBFG8]@VfI[N,1O[B0NJR/DY5VNZ=
/SWfgb[FJ5VTgQ7G50/5cPbGCMFX1WK3VMNg@I&bgB,N)ZAUTIffTE;(</7#R0NA
Qe<,]3IcIg,)>5M<LBR[C:#OL31)J5>8JL.+^a8;IFa]#CQ^Z#E:JKe1Qe]_:K+)
OHR#R-\#cA?[]Y?XH;GcUCf^;O9-IM65Qb]Cc9C+^,VEZ01B]RO-3[J3U,#(&RJK
VS)2FZA4<Q7N^bgI0aX&)cEC<B+M^BH\@bFb?]9ZI?,87-U&N7:V<Y@YJ,P<(&,H
71b9Zc.YdKKDD@P.@&7c,aAA>3R]F4)O?FMT]#\.D0Y^cfL.@@X0U=_SEZ5=beg3
0aN^^OB/;?WLfP/4E#5>dTVSPIQV\^;.>Z#JK;;DeD;&)83WIO+]+CH<1RAd+=S=
27GBYL/3CJ#,PHTK,>>A<K5A=@CA)_KDbBA76&GG?KaV]0aS=5ES6a;ZGeKM.@]b
Od.WIQE_[47#C/##LaW-/1LED547^DVG/a[)+dU1^S,&\=O.^A^YgBg9Qe\@^Q1]
ITX3WSX(ECggb,R&gI48B.6&f=c122_e#=NF:&QAb>D=HT:2[,8g61NCFZJg];QS
(WF(+8bd:[6:+)OS0S/UHTJ1IDV,OM>+9=\=E@4+8.F&\KN1HL=I.+P1WIYZV633
0VTC)M4SWWaJMO\G;+W&)#;R_J48F-5ZC4LYS,/UD3<c(ISUE1Td4NN>8b115N<e
,UC.02AG:TT(8U;RfWc9^DCY0bH4=NUU@/VV)B).ZUH_3RUDb#acZP#\P#J5BT^I
#TX-2UY,<_g4?U)F.H6NO.f@:B2@SJb,_HE>I:L&ESV4fR4#R1B.RefA2POAaCV(
a]+eGTXF__E8UJ(/X;CZeHX2>DDH,^_3<6MY#/TdRR5c_4:7c9QH4[,AbZa+,,C#
f7BU7L<RdY\S]48LLBU^_3c#T]IfMR)0?ICPa:4RY0]0#gX(BUI9PXFDB&OA+CeF
+HO#VFJM6I=3#D1I.FgX,[RG/&C,Dd(8MIK\8ALT7fXJ-IH8K#A?Gb,[I6<<<N0O
IK6H4]@721E0UF3gBNY,80_UY5ES(+dD,9A4/a5Zc,,-<1JH=Q#cV]2+.X<8^SJ4
VUFMX>Cc8&-J#Y7BSFdF)F@2e6,ZT)9YDKXH<@3>))\c)LYFQWW(]IdQLcX@\A[3
d<+P>Xa@D371H85=--:>Y9<+1>MeK6,XJY7&&OWO?8)M_QANd\8AYM7&745AK>GN
fL^,A4[-<be/2=YJD96NWWW0[(+OVB7T,_2dfH-I/EHD0FYV@-_>WN.J>)];X8\5
AB]OUQZ^a94;J2E724BIPHY,ME6EC(BJ/>N)bQM(/:3&F/;Yge+43>?gBN-FHF9B
PUT=-_-\g#+)QgHFKF]d8,@3d)4RY6[V<C.Y_#f72^<4D9gW#bW0K&;F/fRYf=.c
4#Vc;0f-\_Mc<[LSFb=A<gYPb4=UO<>:9JFQPQ->7@WK#Y,&S9MgCKLNa)<O5YFM
1:5O<f0EL(U+2S-S-^<#\E8+WJV?WWEXbX/8:U\.0<M@(gK\4Y+ML5A.FPUST]gP
&d([]6@FX53^:+OHS9=c_1e<S,9[Y:c9L;8I=2^F#?d8#H4)=-X39Ucca,-?,^/)
C3<CNX3UGK,\fB<:bc@c<66]UN3[,8E=-KGW.4fcAZ8Oc<X>:K>ACGJ(\P3QN(2#
T.^1[e-bcDb4G,-DJ@4W@P[?dD89Q+a/PCd.;AO9Q58TLJGGT6^OU6K8e1PNAgfa
V6^+L]Q,<&3/S59_4CBP^72JR\=8g2HF9e5;=Z17&B>?Ma4^(c_M1Q:O=PG^<QR8
B6ZRaG3,R/]STY3G,f+B?eT7I_4IK.E(c^2KH6X5bZE)U_@KY9e02@\JV>NDWM8R
=e0U+#@F:7:XI=dAgbXc;7J-GTaTea]4Id=18[_,?Bb@K(/7&Ja,<&#fU]?<V_C3
D]9BZ=33QM#g0gZf0Q?7<)#+/&8+bX?dH?45)XK=P0M:&O-(:_1H>-;V:U;e1,d4
2KS8G\J@8IPbdfPH=JUdeB?]V7?B,XdE-S8JF[EAC04>NC6FTfFF(QP>+BB#e]fY
OSBHd-a>8X6^B@_#gg&#[.eabCD7bR5Mg-1DgN^ba=P@QTKO\]]KYMV/LAT6+_-_
Y\/K/<egQD]#0X:B16]FTZ;8_KJ]>1\QUN:@HL.==gF2<]MN?c>I9VV/P$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MACRONIX_TOP_REGISTER_SV

