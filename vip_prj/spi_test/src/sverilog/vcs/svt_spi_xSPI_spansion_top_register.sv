
`ifndef GUARD_SVT_SPI_XSPI_SPANSION_TOP_REGISTER_SV
`define GUARD_SVT_SPI_XSPI_SPANSION_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP xSPI spansion top register class.
 */
class svt_spi_xSPI_spansion_top_register extends svt_status;

  /** SPI xSPI Flash SPANSION NonVolatile Configuration Register Class Handle. */
  svt_spi_xSPI_spansion_nonvolatile_configuration_register nonvolatile_cfg_register;
  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI ECC Status Register. */
  bit [7:0] ecc_status [];

  /**
   * Selects between 1-bit ECC error detection/correction or both 1-bit ECC error detection and correction and 2-bit ECC error detection. <br/>
   * 0 = 1-bit ECC Error Detection/Correction                                 <br/>
   * 1 = 1-bit ECC Error Detection/Correction and 2-bit ECC error detection   <br/>
   */
  bit ecc_select = 1'b0;

  /** ECC Status Register (ESCV) */
  bit ecc_2bit = 1'b0;
  bit ecc_1bit = 1'b0;

  /** ECC Address Trap Register (EATV) */
  bit [31:0] ecc_address_trap_register = 32'h0;

  /** ECC Error Detection Count Register (ECTV) */
  bit [15:0] ecc_error_count_register = 16'h0;

  /** Memory Array Data CRC Checksum Value */
  bit [31:0] crc_checksum_value = 32'h0;

   /** CRC Register to load start address for CRC calculation */
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] prfl_2_0_crc_load_start_addr_reg = 0;

  /** CRC Register to load end address for CRC calculation */
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] prfl_2_0_crc_load_end_addr_reg = 0;

  /** Interrupt Configuration Register (ICR) */
  bit prfl_2_0_one_bit_error_detect_ICR = 1;
  bit prfl_2_0_two_bit_error_detect_ICR = 1;
  bit prfl_2_0_ready_ICR = 1;
  bit prfl_2_0_INTR_output_enable_ICR = 1;

  /** Interrupt Status Register (ISR) */
  bit prfl_2_0_one_bit_error_detect_ISR = 1;
  bit prfl_2_0_two_bit_error_detect_ISR = 1;
  bit prfl_2_0_POR_Detect_ISR = 0;
  bit prfl_2_0_ready_ISR = 1;

  /** Event triggered when 2-bit ECC error is detected.  */
  event event_ecc_2bit_assert;

  /** Event triggered when 1-bit ECC error is detected and corrected. */
  event event_ecc_1bit_assert;

`protected
X=2CRF64N/#^?WXZ/#VPVeO<>YYESR6a^5#^07TC#]=Z2F(OB&?J5)75R?/cL(,J
^JT&&\VD@YMJ6,,;P]:O_Ugd82UHMQbD<@>Z+VQ2aCMY<)\R9/R(ZD30;Ca@Wg#\
##gfRT[(&(dZCZBGQL@EF9WD?4H+T@/P9\L4^AQL(eIJ_2Pg?f4D&M30P$
`endprotected


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
  `svt_vmm_data_new(svt_spi_xSPI_spansion_top_register)
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
  extern function new(string name = "svt_spi_xSPI_spansion_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_spansion_top_register)
`protected
3_2V3Z]V\H;AAHb,XaWe\U6)aPdI^-IW6:#]E4##9VZP.O=S3[]?/)-UXdfE1bSR
IQdKTZHcK/XP,NH,)V3<);G-:D)I[\N@<,RfaX^1:b0#XH0^&5e-I^6SZE5\^+O]
f9N#UI[53d,G<)OU],78bEbL6Tc\Y_W@N=R\HI@->0d7Tb?e^TB<1dY\-\>UG(^d
\RCSg,U5bZ0ea#K\2<V^c<V:)#+:?fcY+[-K6WW(fN^7A$
`endprotected

    `svt_field_object(nonvolatile_cfg_register, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)

  `svt_data_member_end(svt_spi_xSPI_spansion_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_spansion_top_register.
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

  //---------------------------------------------------------------------------
  /*
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
  `vmm_typename(svt_spi_xSPI_spansion_top_register)
  `vmm_class_factory(svt_spi_xSPI_spansion_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method creates SPANSION Nonvolatile cfg register */
  extern virtual function void create_xSPI_spansion_nonvolatile_cfg_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value of current ECC Status Register */
  extern virtual function bit [7:0] get_xSPI_spansion_ecc_status_register(int ecc_unit_count);

  // -----------------------------------------------------------------------------------
  /** This method returns the value to ECC Error Count Register */
  extern virtual function bit [15:0] get_xSPI_spansion_ecc_error_count_register();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to ECC Address Trap Register */
  extern virtual function bit [31:0] get_xSPI_spansion_ecc_address_trap_register();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to Memory Array CRC Checksum Value Register */
  extern virtual function bit [31:0] get_xSPI_spansion_memory_crc_register();

  // --------------------------------------------------------------------------                                        
  /**
   * This method is used to pack the register fileds into their corresponding
   * register using the bit location provided in register field class.
   *
   * @param reg_name specifies the name of the register.
   * @param reg_val_serial specifies the of register
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function void get_xSPI_generic_register(input string reg_name, output svt_spi_types::serial_queue reg_val_serial,input bit enable_profile_2_0_mode);

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [63:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  //----------------------------------------------------------------------------
  /**
   * This method initializes the register_pack objects with all the regsiter 
   * fields of the corresponding registers. It stores all the register fields 
   * along with register names in their respective register.
   */
  extern virtual function void create_register_pack();

  // ---------------------------------------------------------------------------
  /** This method sets the value of current ECC Status Register */
  extern virtual function void set_xSPI_spansion_ecc_status_register(int ecc_unit_count,bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  //extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

`protected
&c]1Q4>CZOE(Cf^_X^M&HJMf.T.K=GfO>5bM;Q[8f;PV))c2OLSK/)5EF^+&<#NN
2AXdVYIRM.IcLQQ.2^T^(UHLB:P,NWE2V0KU#@LGPH80@gf.U>D4d5TD=R]6L&WQ
KW:7c:Hb5fZ#<91C.00)dO:P9gRaFgFCcc>+W5CPf21A2VX6ODM9U:&GDF7NA[59
GQ<U\\=QK+2R#@ZdbZ8XcT9W\d54^SU+5NV=@?R,H[DF^KcBL9NI&6//?0b^Ag@D
P,,Gdb,d[UX?+&D78D>,g7OHWED3SOZKaF:8F7X,1K?PPD7GSOYVdN?)D>Y-82If
J9YPR;RRPfVF(JSZ,85;Y_48ZD4PA:0C9GHRQ2GTGd2bJb5Dd5PJ)bbCRRYJ,_X<
P@(;VB#2dTcIO^Q7O5S<(;Qd5YdS(T7eQ87+48RIe9=MWR=bK6(]P>G.2W.1&c<O
]I54aP9EK<Y<O>.OIS<^Va:<TfcUe8\6HKaTR&+9X;BKCLO/UD/>)_O+[Z\V<;A3
UAVF-3@H5E,>X->.2cc<=POeca4<eA-U173NF:FdPDcO;;VNK\(DVC=//L^._[B]
GcKSL4MS2+SLOB^T)YRVNTT1_9J89Y1CfcSZ2KW43U&RS^e7+JU^V3=/M$
`endprotected

   
//vcs_vip_protect
`protected
-UCAdTK4MT&JBKM=6\_)6?W/?;W=DaUK]>LN_?C3#d+Cb6-(+#R@((1U8.dLf.:;
GD&fY@>0&Ze[NQJRgN9&YI)fSGZ]6,JO0NbgK-J1Tc57N9T.O&AOU=9NWE;/d9Q7
I:=88MVH0UVD50:6Q@:UJ;1(6PK2H\<8g55W#8NL^T2VQNJKaA2E-#AM3(IU.F(=
/<?f@E7>3H:VJZ(4;A\(4883GF<7)1d:=aP(e^)T(K-Rg#4X22\E[E8#I/CR:M(c
COJCdd0N7ML-YCf6W_YLWAO&?f;/dP0P/6TDNb9P93P.P<cM)Q[GGB)X5&9Lb[=<
C.T[[F49(7J#NZK1<cIaURK.#B9(7,]11Q?\g5+YU,BWS>4?O@(YG-^:AH_F40V>
YT^g#M4@)&A\PI@U6)-CIAX&:LM)MZX79I/@fE9QdYBVB)]Ydg+#cZ#6X5d^H64T
D3>E7CDZLED5YVD+8?LSaL8)_#X)MPM&Y[&9Ic<R6EIC#^85)H&+4N&Y>@M_[7D9
@C8K&]NKYC?-Q(>0L(5TN<Z79JA]I9I3RAO;66R7<IG&OT5)().>U>?C#J#:M>_f
Of;_6Z9BZ(Y=A0H\4#IcVTG,[I_UV9e4)0]H1XG?7A)F:W1B#8,UYR[\O/=)E4B>
E>&aFI89TKU,+(H^/]QWeeI^WMA<e/XKV9;6)eHCcP.H)8c2^,B=<GNQG9416fa5
d7+FB^G=0gFF,0,GZc\[ePCE/RbBNT(.7F4^-S.>fcH#A7PY+9FG0ET>[V^EeTdd
51ObK/)0]g[XMX8/2.a+1/<XR?TL5G;cL4bRTX49^B(S(69Wb&EIVEML?/_6TdMc
EDMUKVaC@=^75ZM]8aFe\.XPf0O]MMA1OI4[&]<\NdJ+=U5PKB6aS]D1X,[\H2VK
^9@cPMb-Z)[C3e9#._)3QLU?Q&IZP#/^)ZTO#U6]^TK4Y3HSP\-^[.?&:)db5T:#
<4?[d5;ES_BV:d=OIX05)S^30CdJWO(dT&<3/QO&(1]C895\cPeag;2X6OUgaCW<
-SF=be)KERDB4Bd,KWR1ecgT?WAOeV(Fe&&W1>F2;MV2W)W^geb(..=T5&K>^.F@
2UVE,.47TL7<:X,4C,dAfE#cCV<GX72K-U(_CVcR3?K8X6\L=S,[ag5T#I4V>[[N
_HI;\/>_F?U4PN3e)f0_E50HbOB?C/,;,]gg.J(./S3e3ULZfHQV?/1\)PCKZHEU
G8ACcZEbd8I6)&,F784dR^UE1QEGS=R]2>e0MIYcP2+.AVQY2(S:Ff:P^+9]T,R<
-9_FUQ&/(ZVH#TF/:4D3)3c<C\gD[T&AIHb^-dMTU+764KFaH79HPf2W8KWQ0#HK
OFZcRZ51RLJ59f[Na1b,Y@5Z,O2<1)Ob3EP:]e^:XIH5eF3\0NN_fRP13/,d#16\
IR6BWQ9M@IMM_<<2-3<7-6fV@31S;.=(.G8Z#6O9>PJ?0/(dC9&e^NJ+YCN9:TTJ
fLEKGbBZWH5X#OHN8>Q/>W-ZP@CWa/3,Xb0W;B-f\FOKd=<8(-<We+:3Ue=[GJ[W
feMYI-]2SA\E83A[QDX<9=:5?:6>2[-#MVZWTUQFR;4,^c&03B)gPNJ6g##dRU)7
+UT(0)J[=gJ25BO0T2?[dMT_<>#1000abIQPa9ae<HIE@f>cdPF#<DHIQ9M(M5]_
fc4T782KO+3?[\@fTS<@9<Gd_H?=HS[-KUbOb><2(<a]\@.PSC]EX=gVV,-2A.^I
44cHB&<f\/-.V)]>1X:gGJdE<Eb6H[5=Zb_X<MU[NY8X[H+Ua-[X:5Y>?B_M4IZ?
X:3<>6S_MA<TSI[G(H^c.;<9b,U>60Y.T0b0aATP83R6OV7Kg1A=7I)]XLUgOF_Q
^aC-HFd]B^8/6;\78J&K65d-M1DDN4@>1A@#;f3(A<[6YY\L/2XQ3@_@_:&KH:NB
@W\0><c0c2,572E<T2]5+&/?fed>FBVX5MeAeA+/(B7,VaY(Ta^MY4KB72ES)Y_[
&a:(-[g0()NV>)2.B(G5I.;?<N+FF#:-dA&5W15=GF-ag(1F?:DK6CN.D1(Q/GMV
_XaOA47::SNDHcMKX;7QICT._VQA<KJ58A+K;#ZcZfD6-HEO+[4\]8OeUX3@O6(;
>JLCXf?A#f,OFV2@TdNJ,1=7(LO1W&T^DW+c7f.OfcRXTYbCE)-fTF4&9BbBKRM4
A&CR](c06O1/5)&-<350YM1)J3]T=3QM4;c>&CZ)&g+8O,<K,?B8Ca>>7+d:#T1@
KP=YX-@A/I:(aG.a5d=&agY..Fg9C,UY.Q5K;(NK2OVY;b?(:e<K7,bW44.3TY(6
-6B11gI<;NQ<XX6/3[9)_-Ba&W[?\ba&7:XRA064VG7K3J+eOWRa<XN[^;eEXX8,
a&Cb<,:5\15R?6E&=SXE2HFHDWI?JK=CXRcO\\+3E,2/CI=0(gd10Nb>@XA-Xe;(
\D^7aL3X@+VG-GUDS3&g^C=Q[XN@RJ@WKF5L;4.0NB20)K4DT>D_E;S5e@Jf-g(#
d(,ePM>>;J53aPY0E/^(/W&ZLI2CQg_^;e\;LAb/ZNJRY7)@J>\/5S/3bP;HU(T#
DTKdZbU^cXOLf;IaWW,[B3+b8>T?G&GA5E]_.>&4<Kc)gP,KbTUH4aF/B0&F7Qc8
F=>&@G:/2:9-BS8R;;YMAO2W0A:[g#b2;&7[OA#f#Q:5E<W.G.b8DXc5S8e_+/</
PT]ORQ^,2;<OTT2>X@2E=^R_445WbJ.(K]-5bG0b3aCVIgRMLg(.&DY7>OCZF-87
?f:U0:-E]gd;7W91bO>XH]ATYHO6O96C8KHN3/NgW&e.\2:;^EH&JB5I9+V,Q^50
0LJPaC9U@C=._4dHeA3B^T6b5>0d[[0..QIaGH/0;Wa#(5a>TbI-@&=@bIY7/Eg?
?aeA@=gJG.-OfS68aeeV55U06)P1T9E#)0L.bQcT(-><W\)E]81=H?KXPQ4J4M&Q
PU:#<H5<WHOT?g8]<e9=TBL+YVCeQ.bFK[]1,LL#7H+=QGe^IG_&1KZ/MN\UL4/,
,1;G1(Q/FCF8F^PccWPeF[c:U(1=Sgc]?;@JMM<XI6Z7+/e_6EA?G:<HB#O&0&-/
#/6^N,^FdGFT-9+96CT\_HUb5O;6UBB82NR^J,3b(J(8@L#1fRaM3>I5Cf,RHBBa
7:Y+4(DGe?Tb01#)QL.V[eUAO6=Q(f)daaSF+5G)L_#T&/G,]_FTgSIWT,][M39-
bMJ.>Zc<\+/+=)a<dfRVM4(PD^#>DIQ4Og628XCFWVQ7\W[>fH&\:/aI,@P2?P[[
8.;,RMB(1cE,#<]g)QA2X1FZc5;4TcK_FKe3Q;WS6-CSY6g75_4eMHR\5d:c02Gf
W;Ha=A2P8P0JF(B#UZ[g__/-e#C]L1DX]6XY]JP<HW09++_f)\UeV3a^fZ]<8\G9
_LP/V+/[Kd\4UcZ9;c7<3Q]FYcK&ac;=dK85L]N/(P?R,>.QC0:3SN8V@@X_P+^M
Qf[b9^><B30.8KVSZ(+<V=3I[;,;e,)EYZV(^<R46QH\Id@09g<E<f]c>XCR3-A5
a-F,[_6d1,GBWO+9g;-+Ab6?W>WSB^D]&F^Fe8f<=LgMFYD+ZJIOWW-(_@<W<HFd
>Y2LUgN:)&HH(CIXa1adL2E?S^I2^>eE5a5(G([_C[XW=2(O0HLgY0RNaZf>Sb_A
7Vg5,fQ,c+2DCAQ&U+bT2)AfFe=JW3gB9c=:d7=Mb7LG8?6YbW4<8@>ZYaDf[WO_
)b9cF23^^(SRT_.Q]JI<#23M_J3JLL(]9]FC.>K\]0Ic?SGDE)&.DU)-RW7>(P9a
LF<BK7BW9568JT9+?e0QGeDW4JICOT#7Z=Z/47(5c\85IdTgJ]7U5L+L_&[@YV-4
):fD_P&AUTb_ed]JINI0KD\]G61WS#<2>1R&C1VN2PM;RdeY]a07I-OE-Vf?_f=a
-V42B(Be3Wg)EJ9TddZ2D>@AM[Y/^RcfP.#K24/Y_R==/JN+@[IDDOZ]1WeaC5:;
Q>e=ce;]5>YO&@7YS3WL6TD\5N5VT,53[\W6Tb+P]TQ:[8)aQO)3_E\MDZ.MF4(.
UYFX+BM6VO3@FP)L.b=T_+AC@:R^\Z?M&R5V84Q2,fdNgb]B5=B<=a//^4;c#O>@
&d<I1LWQA/H>1TeC_L=G^A0N6cg:+J-.#Oe(^10I=78S8Z_50JT5VQR+E?Z@J8CH
0AJgWDJMHC_Q@,MFAQX>DI).Y>AXff-\;?36L)ZL8FRPU\E)0Ld+>)&SS1>/WUV=
IZB1ZfC910e@9#7ZKC]G^b22,SL\P?Z)LVB?+_F_QE\BA9;IBV_-ND(KJfGU/J5Q
,>@bYf)ccJfCTc-Y?g?,&BR-976-0Kbbb;5,eMLP7\08&eG]OC9@AN:\OO]Ug,N;
LLUM>(2IVUJ][)-8.))-faXCAMF<S15Y,Xg-N207ae8#<.9HIKaD5GbK7HcC?;f2
Q];FYEbNF\dY4VRd,9[+9b^WTQ<Y7#XNT]aA0HU\P=;-aC^P]9GBQT3#W<FcTX;[
VQD<X5P;cg<;W,/YR>Tf/&1/)5QM07.Y>CAg&.K#CD<<^5/WAMY:_II-G>2J>Og:
f7W>7a4,c0O0X774)a2MA9_ZSKH<B7]Z)I@83RcD<KY&LfD)[NN0U?O(O[]d:3b5
,eJ^^774]==;W;@@Ofc^aC,]9)(E&GW>G/\KJKHaG.&cD7SMUSRB>\b+7K--X<F9
,66#JK3-f1<(TNI0D.eY[f#5E?(I3G&VI2Nc>Ef(-^Gb&g80^3GL31ET+Bfb#^ZV
dOK,X]W9:,D.NH?FU;^c<I)(>03QGc>EMcAY;C=I6/bZ>U4O2)BC+_>9Q1aL\..;
3;;@#-&G4.fX(?A\=NaM;N;:ObQN(6+F(e5CE(0T7B)C_7JfNW=,?<a;.G^\S1HP
8R=fNg])^F-DX=#,ZFU?DYQT7M@gD92_P2fRSD3A=@FC_JZ)?<^T3L^BB=K8[GGS
)HLbJF/6#QN-bBC?PL+8PZfGU+?,ZATX[cT^J#CV<4#VeT?^:6,[:B-7E<3)R&Lc
_\M(=R=99:#+EJGGc5d^+Vgg((cXFD/NLOJdK-f?PSD_=W36MW4V:L0-+-)X6/\^
WBH0>JH+:?Z53=C-B[e.\c-MQE)fB/G;QVaGQM7+&?11LSe-dM<)>bQeb0FAf<VO
-C1SRQPK.<Vf;BFJ@bXWCOP1D6cT<aRFP2S[?IFd\^>>^V9X:ILFag/W9/GZD^<J
ZCHWeb@,b@F.dH<G]_2Z@G5G[G??Q/5?635.Dd\2GCe58FgU=3NEgP^0cOGId?De
G39B6Z2dA>S[Y,E)cFZ[R0D<bJFPd+RC8f^5A8aL&K/HA#4AVHJU=gGIdOOZg@U(
dUS4VJ)/;6^;#c6M8-S^:[3FfAY9Q8@^9C5RU4V]\U03MX/CVV@.^9d&We&8(1/C
B?Q3)GSZ77MSYSZMf\&KOG9CWa9f;#ML1=O:(H\^<Be&7=T[[E=gQ)@=YYAa&]E0
16eJHX&M.>T]WVC\^,V19AJ#,K+SDWMN;&;(=>R]D]),PQIT]P4J_QIgXaf0@G;d
J@+ag/D3,9H=P)Z/(bO4?/KJ[]C6/VU(ITJA?#I7[XH;L1R[9N(1R#G,N8CW;SHX
<f-d.:TA0UIE9)3B/bC(6O=Z0bU885Q?K3GIWE]JeOaf.N[#Y4<16W4ZREGXfJN>
GIBX100<-#2IQgCaI4&a^/B/0V]b4\TQZa9]GT5V]XEA26T.+=EK>3LA:L#\&UfH
b(+a)#GUX35#;<#UY#2;9H8TYHH4eHBCJY,P>^M#ZHb:>PI0^f8TXXafP?[O+=Q;
W3,SAO-?L16R3(_-=66^BCM+H1)D#Ld_:A=X:TYU3.8gH174.TH<gZ\dg-KO\^J^
]Ugef>W>.4.>d/6AQ:b/,48NT<NJKfa>Y<,Jb53,+BY=;4Y)YT90G0_[Dd2;.,b\
:5>ERO.4[+,R4gb.OPR<4;)9__Z^+AGT_K6CZKIR+4+K)6EdXOLCBO6:=/eWKWLU
W,a-?P3J::Y\[L?dR9IHML?A\HX:Qa(2((eL6CfND)eXD?G[4KRZTAFTVgG2af&_
@.0Nc:3&UQC8ga0R,U/1_Y(9COf+aX+::0^UM?&TGOS]a8]5]<cB_&X+Kf@V+&&_
g,XS>L&Md-6UK+=ZG1Pc4f^5).^X]D&e5:1>(P&\PY\8#B7PGLW2W[LO-T3(b>cg
1G3+GKZ.=F:B@B;36Q=;1TW3bI1.29QeG-)-5\U?0^H=D)C.aI-ZK64WDbVgcUTT
<[45>a):D[@#(D9UH>NL9JKQN;+4EFR&B+;I+^T-)W4CO_GA#L#TK=F:L7D)S]>4
=G_/aG6ZfD\0;b0)/04^F#5\R-T\D3_2TdV#34I7XTCZBJHP68#Y&G/KA-gCFL+,
.M_>L^Wb>D??PQG_b2^[>/64@C(M>Bd2@TQ>1NQBWRH@e+E)8NgeV4>YZKE>3EfN
B=H;Y(Q&E2SQB-F;YdVR]HWQcD2+P7],U&B=M+#cVF1H/=G-62<[Z:\YL>([H8f^
?HP:A18YOI[A5SASfbfOfYU4S(N?@=gb,f5&[F_]&2=H99=25bP0;;.L&]W4/gW,
&/C@DAJf?G0cCeST:eA]b7Y/AR=@(#+fBG1WD#1O6REZbNBR\4[/VC1=Ugg)_8#Y
-F#/Ob5adWAaKV+.Q4QS^aLfTJ0;DV])D6EaaPe:f]d4@c\,LEePc#_A;^-(QCaS
61fL^:_MAYSgT]F<Yf/2A>[Jb+YB?D/X=)?:A56WM?N0II8L?+<a:IY1L2a99dMb
2L[W-+D+f,RJ=fE5U?=:I#_Ab#101^TfN:\9BLY/3F)RfQYdeHKJKK0?^+ZQLRe1
EML-@L-Wd,7V_KcGR<L?dL>\0Sg.AeG&N<Z4X#J+:E#AF4=;)FR,d8g]72Qc=Ac6
32IY04BUR/@2+aN(:VIZ3:1U+1-#@5Y0,[?:,R(aX]_0F+)J?(:-Z]CXVaJ.;9-#
3-(Z3LK8H/&2?V<V+,1U4[M9.Rd[g68)<1MB[6F1(d)38LSR3GT1WG<CAc>4>^^U
BHMeb/7N=cYFVSMa(cEb\4<[:B[H4GN841(4W@QXU2C^A<I#7H;K.@<&f?][dP^>
E.]9D\,2;d.?;R02>^(X1X7B9W[0I?1=)2W53NF,89S9W@(]e\1A6Z1HVcbE5QU6
BeIIRa;H-KDSSOWR\98dO9;#1AKW^STJ?8f690dc9OV0Y&KWPAQ=A9ELFTEV>KSB
<Cg4D5(SQe.\GOD.0R?TH7^Z7aa4Rd+>eV5WLH8DgLCbDZbW_3f<>Y.F)?1(SPCT
bN&71L?-^KI4R#SE/UX879PFf3-\#W5=&e?80R(61Z/a292b65/OPYMIL)gL=W4N
]Bf=\M&WKeeg9#W<##gE-#EUH(=e]?S-UUL@(V)#-XX.E-U/L;aZ[FZ(=3dD1SA9
&UOZ;cN=c=c3\6+[0EY#OC._:M[H[JGNd4P+JWHVHC3eaOU0P(LYSSgEBPRDCP2B
0L]6NT@(+BV1DL1_TBK[M,e[(b=A.D]&\A6W.M,[:/[N?R4===UQJb)JNN61E4][
EPf+aKAPQ]0NdG6_&(W17MW\DXfCO7O.V4&A.PBL)e_6Z-eJ_M3_V0TE)#[O]?8(
MJW#RF/A?)MegaPe.:82gf_,Z2L5c<W^(]0:T)-NM)Fb_&/&;5JIMZ@4L+G/KFV[
\TWFO2,J0?beP\[1W]1b9d4(O1>[Q>M7JLKbY54V-Q/EXER7D1;?-6<=0BMX2/:P
^+-E7^eUG45#-b9^(+E/@7@2;9eU77M9J^2-<a0JACRE?c3f/d;Pc13G?Z81<I.d
ACIa=)bVDXCSGM2OId3d#;[X4;/I_]1^YHZ2.5>M@&agM./]VL+YO?agX22MLg+7
Pb&DBF982QU5B5dWY6U,=>10:UbS:IA5N_7S4L&1UY:=9U-^(;4AZ+KadCPCdVO:
/5&gS#aKL:/-c,:.RUfBM?&YBFF[GW(g^9/BGJSGTSF1HD)5HgD5#;G0PVdAeaK)
Z7:fX0-ZZg<05<f_e9ZST[_Z#KcO<E\<\X1K--0^L#[.UK<S<S3AfL20RbK2VPH;
33c4O&3R[aOGYY?gN,GA0BX&,Y22GK&AOW+(:&fAg=<D6[5.X.-BN/7R368;XL@F
A9&cC9V.RdB@-B_UT?Raf8BJf4)G4OXG&;,Wab_ZaJO>Lb.IB&(I95]Nf?0262?J
14cSf7=2>^>8SBEcX8POTVfcFNAc&N28ETC@6N]bP[&XUeZ>+:H?N/Q,g3YT)5Ia
+R<IZCXa9B3V:+8L)[L=2-e;+I78Q37f#Z8+(BPSKI=)Tc;U,\8Yc\Q+#fYM7Y4.
g1()+?b:-3F=N^,5R<)94XBDLgdX-0N^ee:I/g&eQRC)67YAV6K&PaDbP6<J;0R8
N-#8fMaaYJB_:L5>Ge-VO0a#4F4_^#[<Hb+8>Re-WV@UJ/3ee?GeZ0@Y47BR2Rc(
_JS(:8d1^B2G2.c@,B?Z]FdD>,PT;9Y7YOGO./0f:CI[K4afHYDa9>T9U_)I1ef_
dH5YN[+[MbY):5(CSQUgE27G.e/5WKR-[R<7]KbBTH/ORR82SLO<.VZ03U=AaI@9
I::])cfC5[94X&a@-C+ZM+:M\,O^H23:0&dVU=[8YDd>TP//D#4@-HSDA6Tg@Y,9
:aWP/=3gXA+Qg5=F#f-QcS#57?C])?bbR+_b:E.WWXG/(\Qb6S-Z[60MF.WfgI4=
Q;YC01D2=ZAGe5I:cE63^3I-LVaRcD_24)Y+PJF<]9^4R?&fI^94#FVU<X4b1AdL
BW748)U#c\OG6_P@0\XR@N+-5<@?_:\[BQA#GF-SB+71Z\^A65I0;2\Og4bUK>^P
4[;FI;AS3;XEZCeD4RVE^>B6a=d.,SC7.X?GJWS&TVZ/g:^F2]303]BYHK,?@32C
3SMX-,@6YV]XP_;bKbXB[]LC]U(g-V@aZeRA[agR)aEb-I[_JdKA5V/4[a1O,^D#
E^=-@U7e=D.2Q:>0[@BNGKWEgK:6I;MXb;f>]4g04H?FN7T_34;aZE+f^0Z9XE9&
5UFT8.[5b@PHM[/59&O\ME:cY2V;<W?b>[NT[Q5E9)Nf3>3NOD6:Fd\(Q1<N6?Pf
Z7c2WIWKQB>>11;+KL/e7\@aJ>.?OTZ.KFg.9.G8ed:dE07]^c(MXL2)bX1++VM2
]U+7FX)])CE9IE#FN?6OYRXW;G.c>[1A?M@1c-PBCc<.]AZ[-IKP>Me#<#N]ZDO=
+274d?O>42KF.C:RUET:beUE(6=&d;5_ff404OM#)>3HW;.FcY3T/HG[ORI>#+5I
[\IJE87MEMaKTRM2=b)gV)LMQ\)8W?Z6&B.g9D@?2_QZ=(dKI=-5EdD[;JEDZ6N&
0G9dJ4[0.YcI[W]<9,2OUS-)5,Z83_aM:P#B3DG@RM;8O3F\ZSCIK-&_1g[49KIN
g38CCIE7ad?U?SG7A#2^WReXK^J6R:NGZ-D8MC-=g4EVB)f0[KGXd[Y:g.T5=+S_
dXJOARKF._W9gU]e8MaX)\85bD+#K@QKK-AVeUg,W4Z^V,,>L1,,(LVfb3)=+3Jc
REEY#.R4,3HXT</fdPC.A70<:P19MX4G&&.eO3Yd+TWGL7^QH2EdGY6P14K^>RY:
G?]a2L8^I1@_IC;a2N:6UZ[]THM@7^[)=-7L4eM.DJP9f5N(@>OHf,fK.S>KEZVJ
>8V1W1G7O>gfccM0cI9J5V3W]R\OXffQ#KKIGGII+6?1=]V^6@=S9?Y8aHA>c>7Y
;0Ld=1\@/f)NFB@;e83d=.eHAc2K^8cMD?(a#/dUJ3F+EEUd2KZFK5:=(SH>a9Q<
\?D-#&eACO\5I)\LbfgH-:1A=]I2;HF?MY@7PeDN2M6T::_#_1.@@XRSJ#\[[7O;
^dQ4B5N?[_ZX[T,Md6Z:d)O;0Q:V_BcC25+fEfgU\b+SLf(=LLd@-86?fc)E&K6@
.g^g>H.Z\@+9@6T\0?KdeO)Q.)&ae+/4cU[E;aD)Y71HR&;RU._@S@DL,F[>++/I
B>&2T/VJ>MYR@:XVcU3OAWH;F3aVHD<Z__2AGS(cX?F,?)74L)>ALZ1OO:&/\AU8
2]R[<1E?I9LS_\cXW]IT74>1gIJa@Qd5;-5X76JJc]bZ-b=Wa&QSPJPV_VKK\:T[
4@E0R=I0VJ\cbUPEHJ<LC[4V^fWJ5IOBTR.<ed08W]LEFWQ]@&E8N/Qa7GK;cQ6e
ZB):Y](N?>[:Ab3&C@YGIU<>W-a\.+cRY3/NdVHKb^J6S.cR?Nc^2RBKGYH;C.FL
_FH#aHDT2)QO284dKLa<T&K3[dM50A_NYD2#O=]R3,0JC];d6Q1\O6E?2IAGb6g@
B90aHF1c.Z.3bILgIP&RB(EMID#1JTX=fH(^)cN2c+AGR/=6Y3E;@]OVH>6R>3-/
5e65Mb)9cN]S?VW8E65d>d^W=;T[\<O,c6E<SPA.OZ>V0W[)_a7BR7K6Oce)(#AP
DU?KDPJ@D-TeH^<G&aB\TKS;GZLA:468-(Rc:F7Y-Wc&.@Pd[AXGLD<EMcggaDCY
]&618dI3]1EORY;[\/09WR)<Q<H?^7U6a?e#];GHKbOQVDPV6HZOfY;TN<GM7>IB
fT19FVV4(:I<IE@A^6Z0DIP57^[=]:S\W>WI=7eZ(E6VUV+-WLd7OHR/G^e]3&10
,=;\6D6eCb@G:a\48(N8IIRU&KdN\C]1ZSUR+IZC]5W2EIMe;6.2:,:=TOXfWMDE
LMJ\I^8]T4Y.IV?;GPVZ4:dOb>NaJ/P5NXd.9:,ZF>U6[R2MIgJE;090AT5J\)gT
47U&A_]M;VZ(R9OQGc8Z.ZJ(B@R?N#]>)8dX@dNc6QHJJ@.#g=<OY<=cKVQa6+I]
O41/\BdbB6X1<#D#HId#FQ>XD4e55P;;5[J3cBaVB@(W6(P;F]+/B2_8IcT/P72@
:bLPBRa&W5AZYX[M[:BQ)^/fB9?)O;I7O9BXM)B,cJ(9@5J>8I/(,<1?XM,.-:7+
d]O)_3?c3c^=^Ebg\MYAg(K,66_DePBC2:9L<=R.&g5)#=7Y0.W#RMb7c^WX:SCg
G-1Y8<)DE19?A>0=MOD?;\/(_&31CC5TU(A<()da?/N\^KgUNP^VJ3A(=CYSAbSO
Rc3MYG4dTb)]R1YYQ?W]IAG\H_&^JG&g2N)/5/7)D406:[.eeTO#+eP4;)C1+1#T
3P+5Ne?-7X_[-/HMM]?ZGT&&8+5gX&BG/d?Pf0&^:J(S,KE_?PPYOU>cQTQ;,WV\
#KS(EY<U>(KME@]_+>\L=FDUDQPT:Cg6,Ub+aD@5K-cRcQI9RH57\:M3?UfdOT3_
BD;8SeN9@^-:FTR;\SIT_)/:5U^J,&ZH2\W^+b=[-\KQ_5/K0E43WBHad&O9,H^/
W=#-bNbfB6/8>7g=E>3aa?]1Q.[/U_Z[I-&CDR+N;6U9/_YV0F>2;(I=O64^;1UV
]>Je?f?,LBID)-GTfgJFNX9[I/EYL52Q008^YAC&KKd5XIVWe?U?gGY11Nf0D[aK
FO/Q(RDDZD>4SO5:0XaLCeR[C3;V?gZeA:YP=\JbgGL0\7gT\:2Ccc3e,-HRO5gT
gKLf)TAXSGRM(<+D9WPEfL\>f+\6-]AcT#LMCa/<F4O.]1b;ZN^LfB(;JCQ9GCf8
=K[TCCf4aE<43.I,;R^R#CMeC;ZFAXWP#SOF#\CAeJGaK^R))U1KN[N)6HQc&GUJ
g>XfVA=0dF<74g<BR_IY@,3>@Y2@EDY9Z^XXDOQFKa@7V24=H0^A6O81S&bRZ99H
6]eS>bT4Rb-I?_A1CPLe4\?cLd2N/KdQZPEG,;TS>8,Q((OIbKgW3\X>gEX&#G4A
FV1-=bBNQ^\B]UW(F#E?debV#1M83GK6;ba95-,&:IEg,eA.<UA.Pg\]MPd5T+Ea
C8T_EWT?3LXgX7;?90OH5.(C?R/[-ZCePY[P_9/ZY?,FW#EP+ACg_f#fDX]D<4TM
G3,3O_9=J<.GVNR/dX.L3C^O])#A@>B9C+]CXc\FV:ZO,[HN6e@WPBX/.ePS-VCJ
YHMUXAOC/E;?_cPDM6Z?3U62:GFF1URCCKXBR\f-XQG[/gdYR-a_1dMMYI5Y6SU\
#[:g:4EZ@:=+a8W:7K,R\KbB(9g]aYgeF(:5CQcGK96FR3<Ra7Sg5>ZXDIU-TS?G
ggF#<YBbC.JIZ:V-XZQI]]G=;\8T.f3GIF81L.DTEb>]Re(?:N/8g:KGA8J6[#BJ
cXOGA=?W(<g.e07WbP>]3g0=2:)&Y.X2-_?ZC07g_B1I2BUUWR3)c\6R/GO#D8XH
U1fKEg9MCPc4Nb8&6B#EMN._&-8?)9E9>8VAV^R2Y,2,d=9OSYCM28fHF;CS:>R@
gJJ0g>3>^+N/#WL@BOZ:1;c1=+XJ.?8.N./9aK?OPV4-^cE<^R@3>Qc,G:aV\QV,
,Q?FFe861\T.A<;3DVO?TD8=DWg/8Y)_N9_S>VO32V&J:48>g;[1aRL=\,7)QSFc
gVZ:VM1Y/[\5:a&<;20?5>G]#N8R\<UPMM=VN=U:&0C2F1ATHOHX:R]>)Z9V#OL8
8TE-\K3(L25f#<MQXO;5@EAVPVG2,8E]WHPLEG8(/BJ>@TH4F#N,I1L0Y0EMJ9Va
Uf=#JK1g?>&OS9GWO]T.:f\R+@K<BdaF#:@L:\JVOEX=(\_V&=Qc;]YID^/S5=0=
4+_[a.S8-b1D(HgT-0,SIfQ_+\7Z7b1ZWS7./51[C.d:OV?<G]#Me:91M=]EC2,\
aRK/P&GI=LGJZg-IAgPXCcNgX,bXL0W+;G@f8a=X-LbFK9KNHg_IM#EfE:g?VO96
@QR0&O5V+?);dd<fG.;J>X&TZXJD/]Q:=^C7>V5P\\0YbZ1OYIP<M/1J^K^7(e81
=.Bb_K[UE?2;(<Zc2SG@=fQ^U3B2a8<3aA+^E97O<0V..5SGX-Q_MOM&4<5=67+L
K(cOR[OV?BMW?:+QP-7g;F.Q-1(c]\0a,(I6Za)[0BUE/AA8I4FZ-(VX\_6ASg2T
QJB<56UfJgRE3S?K(SJT,^F).Q2O/7\Ec[E]fC4U[)&dE0[Ne^4LI]:b:_R)>GZZ
&,bWa1PFU9NAPY6^SNJ)<ZD8([UGe[6U)Nc1a/JDPA>Q_XL&fM2@gBRYUB0I5]g.
<)ZN^Y1,-;F^f7?f9.]<#M]3CP(]8[ZQcA:@CcAS1UeK-Dg[3bX#VQAXIK@dHAS4
:K@Q_L5O.3FFZ;4JN7_AA\/P4Q^)UT]=V(-cf4<RH?TI,HBcYD\NB</:Y#Z_J#>Z
:=O(_7V]YZ1/4:^c@H6ALdHDQPd\V4^BSQ#;J;03&b<NL()[+P\@;.C]B45,.,Z7
(F][+V^G\_-K@(I?&;V3f-D:E5Gc,]C6N5]O/FK+#P=:W>X-c^gXXR0(\eJA.3O7
.1fLHH7&g2;@gP5>]WgKEY8HH==WcfTE>F6GJ+)5JB16YIJ.MS/Ub]9GXOJ55-E=
TW6GW9>2W0^F<D3>7]G<0I_QCM<-0-AB.>721#<2beC=&\)d#S1QIAW1)Ia?-cR.
];7--F#S2@5(Z\.+@475]XKMK7b]bMBXgNKHMbS_B?PF;TCD=@7;@W\/2OY61-)3
OT1W+3UG,V8_EOH8<T)GZYNY+17V2HD:U1[OW9/^(OO#Cd:<VG[@=[+SZ)G0KCdJ
A=_5#fUI=bQT\,UWCU+;f8ULZBd:GY86<?9[L/00;_RE^RVcOF@EE<57W>KB+.=Z
dFBWAVW@(3:^f:=?bI,4(aI622(5I#L+[Rg@?S7RV.5>EZ^:4UceD_@@NSF(#>^e
H9aA\^+6S8.9UK0]DH-EgB&;]OV;S[NBKSK]SBNX_;R6GH_b;52;S2/5.\=C8)cG
N]SWEAY+[0G)LOe:4FNd/060Y7:M1ZJe\fKKR5=(,J0W\<.cHJ7MA)G7_48@@B\+
EGW?&a;)a-#J1X(c<c2CbDb(cKaSJ(9=2:ZQg1NW+6b.8U83(Pg,c66[.bUBeWP9
2cT>KB&d6O5dS=N@,I1^L(,N(cJ2T5ebDAc6K]S=cN+#&>fE8F6G<#G2P=B05Y]L
;-.INL^5a>50aWTDI\<UcX[X&b_b7=4FU+ZP.ZVP<ZPBU&?BPHSYPBA]Z]a#46Ta
TZ0FaQCf<e5FK_eP)#X]fK,&aHKRKMRI&U9e,?L\=YIZ6A13)&Y2T2WL(1\(HFC?
T8Ac_?PKET?If>2>@5)=K=L?[6a1)a[+2+0K8^aMTEegeWEe[C.&<6?U1N2?\_IZ
GK6:4QETNcOWX/J-6bYE))G2\&C?,T_V]?]5V<T\TQ#ZELB]1:.F=/]R2QV/<(OH
RT.&?9\#1KF/)-3f^G3<FFU;48MA-d.4XQ-J.L-Y8ID&4HcP/dQ@LQW02CV5#,?W
)SEH]IB#1R^C6?:8HI;gLdB.>L\;S+J=@-PCI+b1A)K[-G<dB=D8BT\5=<KWX19)
HK[V]S]?&b\U?E5<3?3bFYF&8-X#LR?=+CSadaQ?1HCMFFa#/EQ^3/(K#Ic4O.-,
/-b(I5^8bbO^MSZ9g<eS>=>=UIA-X,,\Q[cA8H?>WO?QO5P.=LW>3@X676f^2-2Z
:QV=M6R(aB/WE+DM17X<8+EW.:c#[9Id8-aITdPK?.EQ[QgYa9ODVFKT:Pc,@<6a
fDV^&IG7US>X^\URA?;D<#5P<UG-3-J8a^>HH>dXW7.RYIF4WdRQ8QVC0S0KQ5EF
YC<GDc@-L7NOA07H5PY#..LRc7^H-80SJI,=c5aA1560#c8Df];D))eaSf5),#@Z
Q^J\BF\6YC,)dPS:A//)^^J5Ya.G,JT;(3DB>HM@-/>=3U7V8Cd2PZb6API?CYOF
cHKS<FV#AQ7W)Z:W]aWO6fRBZ=X(YQ#L&<PC/AZ#1_KNY1YG.LBCDg@8gcOF7-89
cGD7X9FKYKKB-)/;/>Q/@3U0N;M[Z[KJ+3,JT<:)TS,E6S-^G&HfA.W;8H29J193
eSdX2-,UAA?U=.egb:B5[U.JG1P1fWS65WB<,CX;6P0KM5:SH>_GWBg.8C+49]:]
1f^FVf4.KF]1LJP\WX]0d4I)3H9\PWb(g[8KgV2QBCNPLaPP./NSgPRJL#4c=5Q<
fH^SQL:G?P-Qd-DJZg6QIJY,]8dOEf&?=6&?5\7Ab3_(.8O6__[R;DHfZMI#=4]R
AE96HS=Z+L82f@N\[TGAg\9g6>(VHc.?4E>23U.<PF2R.E]M)^A;Nc)(M_[EY.E&
?P?M92_ae7EV]L@J)9Z:AFJZH<V3g2.gYI64SW]6GRG;_S78)Qb<H@+GMQDQGC=Z
9S;(MH0+.5(QM9\7F_e31CZPTM\H[YE<=PV<>FEU/10^F;8X9^<MLACM?e@A0P(Z
-FI>?BUH9b=aSI&)Hf10[>8AH)IW=HO^-]13AOKU_2NE+L0_,T;H-@5_<FCYTMc<
e45:F^8+>e=;@C?/MOYXN(ERgJ@-Z;1EN?H+([9.3JVceW.b1^XdbW./gIBF;YP@
=<ZF9]F9DUZQ,KdPA3+a@b?Ia?Ud0e2RK+>SW8^=5:/Md&8+9K2)>CB=^G(aIQ_e
d3eE=7VI#64,0DJY[E@Qd\,5.36V_C63X#<d4[,0BDI3O#M:_:EYB5-^337<^K\#
.[6?&fUERL:gCa_:=+RVK,/:fX4-G,;K-2G/RV7J,d,IYC;3&JNbYg\F9=cYd6<:
D1B65,UR=)Q,5ZY\[fYWP42AXd@MQF71]G8S]57b#10RLfSFQ#T_f:X7\6PZXN8]
=H6\e>XAT@dPT_8#,ZS&5A(P/\UZOcWb7X1.M6ZAE]P)Ja11EB-K<TF2>B>GS0OZ
[4:TFZe<d@EOe=E6^16D5#?NHY0KaX5H1_3?a:P?)G[?/aZGgC,0)>Wc]2[,::BO
Y7P\D?A(YOTZM:NfA>Oa&3H:3?FUTe06^IeQ1;-C2e,N9gJbZ8Z9+N)V6fadKf^?
:0J<8U2aVD0_S&X-0,9V41Dc#W],/S[Vg-g,Y_LQV#b?G5L3c9;#a]<We-P?DUfT
>M@7/I.3gNeZG_/)NM^&0;KX1]<4#@(UY^3+)K34QNCN[fg4&RGRM?S-M)5CEb-M
a^eROWUM-EcI^X^@/dF7]^F0^.#R:XK921d^gEc1KAJG1LD,RN02,ZbBf7EfbORC
cM&Y<U0Q<a2F#+WH_bf+I4g7/e7U>,KM:+U8Xc0DG@e6+N^7A[D^KS<S.&-EXc?f
-OY]2e:Y6VV#2<e4FgT]]XM4?G(DS=MB+@(^,N097_0J[8gBEPg\1II803HCVW&4
H)(O.dFIV_#CP4DJVSLg9]cT>R#bR)S?H01UXSC)_&1BR4F,d4MG5KKZ4T(F9#,E
W+XfR@A#eUNZ=26_S)4N?_SgCFG6aJ\F+],1)C5O+84?7SX#_Z2BBFbbR#6Zbdd\
_>EO5AGPFSa^)9;F2]SadY0K0S\ZUc46RCR()575L@ZS\dN[^36V>LF<D4_@<D-B
fc_GFMJ3g5IYbP_X\K49N-Q.dU7=GV<>/_1:E\>G/2H736)UY]=]Z4Y33I4g8D9c
U>QMFYBC,-EW.4VV>C[BR/VeAD>2DS--5ObBF@[3.V==MRN,^=gI=LG[U1^130QT
NMWM?,S105A=GIGGG_/ZW:9-)f>IMR^e[=>^&S/(?aGAgFN7C-6ZfTcP96;A^=)b
Q4f;eERfBU+U.@Mg]N8NF-ccaecQT[Ie03M).?]=>USS5RJ:E:/>+I:L;Q1OR9d4
3C_R-?=;X=S9^U0e?^]/XUO\I8\Z^\MN;-+P0V2CY([-fc^9/.B)MJ)&;98TBG]C
17Q6(U4@4:acMZ[gIDd+ab16>.RPU/D2?f1R05T1J\gE<CK2F6V3HOdF8V^0B_:f
51?R?aWBQR\H.SHY6Q_8?0&PF:=T57:S/O,IVGWSf>JC-6,J+/.9#:23f&(.BCB[
gf_#R?3-2>WcWVHdLFJ).,JE&UF?P[33)21>_5Ha=8QfDOM/)/UEZ-[K8?a2?XbB
C]<.4DA_,7QdeRcd&1AW8&CA9O1LQ1AAefMSM?6b#A5W,aD=?d);V=62/KL^02,&
KJRd\W\@\XeB15NPM,Y8g+U):+g_P,R[FQ^I4GHLXfI+>eg(cgfWRJfLT<E(f)_R
O_9+PL:LX1>ZMRG1(0D1c7Yg;);eFCacOO6FUdX1/e)^3,Y^5>DK:d)TVeIU:0.9
XAc0YE^9AA;KPg1Z_W=__EDJ2Nf_Wd5Z_Ie5M]G9AQ932C]I^DDM;]JP0MA]VUHN
CUI=O885OgPT.DIG4d_VLO94K987dL],Q64:DF>gSL]OSMVfCN:^fH9EP@:5_IYU
-.84G[:-,132BH:?,L4b:/;>SRL<gQWG+We(E_PJ,?ESIQPHJZU,b-W5\H::)dXa
1T/8<USFI]O9B^fda_M[+?5:CL:/B8QU1MbPLIK72d?L8^\YHD#OWWFd,E:eJ]:F
-aPOe1RcIUbXa[F3M&YQ8<8T_UN;KZG6@-4gT7=Y5CS[FdQ(2e^e#1bIF_U\&6R#
OER^E)@W?MC/R@d6PHVYAEHacEf&G/Hdg8=<bK.8,bdGCX&[GIPQ2,>+-HM/B&:=
YceQcYT>-a1WM[0X+6?7<g;@EIe&HO3.e<:^EHA6QCY<),XTG9X9=FOPBc\/B4#9
65,^-;Q_gOCcJ)C9P[e2@?eR>/&S>T;)NN)]eO09U&8eX@Q^^WJU=.<57Q&5A(cX
X,E:Ca6Ig5ZRZB#3fPOb).UgMQ=.N^E09(NcBa4^QSI(3Cf-DRaQ(R\d8QQXT)98
3X;c=N/=;fUg3P&BC9@c6P<^-SRO(5]BO-3H[M<.7f:-L3+LEI7W+M+)WTU/I\GP
g&+IPT#Lb14^VSNULg(S/fJEOTKH<YaK/NZfdF3T-NBLKgWT?PB?>=IVP1aaZHFZ
g7]K10<bIQJ+_8(D@/3>c-e^RSS359CM++[9<JQg1_[c<F0DDdT]3GQFKRJ@c.:2
W[JP,J>^.,7U6H,7-.1I31a_SIOAHd<]>S.U/+(@g2<P+CU=gKL8#\Pf]gd\+9)b
Q#2WV?.&^DDV0ZT]aON(]aJ7SN#e-+N@9+de2:?#TO;4SZ/DJ/_(HT?F-?PK_K/]
;(,(7_N\2gR<8EZJ(PL?PU+EL\V-]JGO^MCMD,.5aZ1C3><#8-0cD(=S;9d&NafE
HURP+D@>-@NVW:9Y(gcFY8:1P<^PG&dOHO6/7gB<DX[d/Y[::6-:4<ET&7\P1LP.
2>6246@VgJ4Ld:=TV(Y0:;M=dGTY5Cd>E/(T3<?B6cYY)IZ98Bb5XM=FVV]_M+RN
A7EH;)4511bN]B^M)>:&c]EK4@;5P4S^56XC:6B&5L(PB^@2FO)\NOOdf1+MJ&cI
/^APCJXb2gPG,c7ffS7RG1T?.FO(P&TG>H8THUfc5C]f9K<D/=;bTC_(49P@6];L
>eQ(=,Wc5-FY0>[9KIG9)g4HZB[/N7>@2b\VC5)5_b9b>-8.AgO)Q:aKb7cE3&QF
(07UQZ21bdNFG#@-=417:8&4JK/86.NMG[Y/\LbX3b/EZNE10UH^=&,Z,05JWW/I
>M\K5;]JVJBBN>,/LUD>-RANPM,^ICZCbaV?PdG.9E)X/JFC^fL[9cb]526):>dY
#VYLS6c,Y\eD2CcXc/Z.N+)E+,#)RU(E60I2eM,c=I5P0F<-HA253<5\[-?4GXBJ
/XF,_B#S&U0DR:Sa1Y^Z>R3[P5)dJ?LB?,SAYSI]X2W7bKWXLKf8H2X^Z::7gHW(
&4W<IDIZZM1E?7ZHcb,bOHedLAJ#C^5MKc;EA&^:S;d3.6K>3Gd6A4BUeCP;F3[0
bJ0L6_+PW4&HOe0?\^a9Y1>AeV^R#(FUDN8K?]?[?R2W\WVQ4d71D8g&G1a\DW9K
:I.SLg/dbI-8,2:Y8c0K\88())U^H_e/;eZ3d1gA[Q(W=SM#@U0V6,2Y/;c8b\,;
R\HE7K,XVT_L5c-M^-U,DZ5@&[C&D@08<>T<5-,VM-:+L:7JZ]>d#GDUMB1O<D>D
MTN_@U.b]G&?+d.^&9S^5g33\4&1_ANR(;AR.#D5.(=IQ1dASR/I=5FM[^P9X0g9
-A26c8?^1X:/+f2Q)SI)?P+XLgNb\F;a+09WI,SGGF-^eCOB#EQ+^>,>d8:Ee\:E
;_2.=.?[#0H0&I^]c1#PYS/4FPe-L\[,XVN&dG#_B@.R&W.>(4<,W2+O9(_L^,]D
ZNJH_-3>UNU=>HZNc-?dLNLEOePI^d1(HT&#PT,RONc2L)<IVZ:<227Q=-&&=C/0
7R6=g@):(f8cJ6Wa6)ETN,YEQ^>\[b3LE8HF/&=K,7,W_G&XA=U1)@#C)b^<b+[3
6@M)5J8ZSUf<.bgW.\^;=R&KXQM[CNI5g35CV(,E.WSgUZD^SIOW7aEZd]WMeFV?
]IC8F&RKfK.aYWE6g7(#A7L.N28c.+VM&9^Z&-8.MN6b/GA@+W3.5AGW32.?T>_3
DBUX=eYI6B04\>Bca5^XKb39a)\2V@G8Z]02#XObdg^KHeF/cf<9_RH9OLH-S)&G
R9V?GM^V.V6BLY4[?(LZ/EG]1_;WP^G_S3PXH.&]F?.G5@840IM(_T:R7LZ<3Z@I
RQ+M3a1DaJH-C[Rb::80aJJ36S:\[U,C7M+@R]S=&1]SKL+6f]C^5K@RRf481&(O
T2=VXZWA74da8N0R,aQ;aJL+TBA,LMYe:46/5K&Xe.9PZFPTH3D19YWF(H#fd\:8
RM/=aN>G^Z_>QO9;YRIS.g>Ne7Tf)K#ZSGJWNYWOObJQWaB5M7fQ]XKLC#eRe&]_
9H3H,RdaRI6MK;-F;R#^97P\5FY=-1&bI<7;^TOY3_2S5Sb96/67-M)#(FS/GZMC
UdU8QE<K;HTFZQGQ:XS2,E=aB0B89M^FaZ4#>a</DS5&b,NT#+Zd49][C[&/cL-M
OMERP8BPg#-Df[JDc[f;9S#@>P]2[g(_]1W@(dNE3JEGMB:32cc>])1aAJNS,DD.
]74I<8Z)G.\[ggM,RYYDV2YUMVA+a#?LFd@<0GV4C3\E2:AdQ,JeD:\JX^c;@A^0
^[DY<F?g]gA6T0eX(?.97^W=KI=UPDIK]4a^&4Cb&>e]b6EKbd\eC=JOb&5,PD#Y
=JT;-@db0NS+VO-8P>_6ROB6;&I2<OHFBBL[S9BWX.)W<RHUKU:V]O]7=0dC#-KN
&IV_\\Q>HDTC5e[1C>QTUB+(36U:B6W<CP/16TVV[X[:MRW5((HAPL]GX74eGb]P
02[[/(aN_La.\P?-M9&CL:c#@R[.fKe##3a?0=UPQY8[.;_WOMO3F&).96VPWJL=
)Qa6Q:D#Qb8FT[B:9Q6JSY\WLG52>)6f^=e^\JJY/[5e1R.VVUNORN(Ba06fFV0V
gSJ#+Kfc>RPR>@&T7SI[O9)+7g)-6@>9Q4:#+>ZF<,D^.G=W8gYKPc^Y\Mb4CEKc
L2d4IPQ.eMLQV2F2P>_gaIF9S]IN:/3<.2H8-]UH2,\QEg.X^cJ4QFXEL\FR+>(/
4<DG&]Oa43EC-<F.1g6c.Me3A[FER1SJ>HbE_:0A-3eD=09VB,GNHG;A5gP9F\#P
N9+g]E>QRcFH-\_c8VH?2[&B?)Dgg155#abPV70b=EN2>V,P4GfF-Je?b31-?P5Z
V470MQ&BL9,916W2QJ@T.#80:I:GH(f#UJJ7cU\8\9JdQA+cX,eH7@[1UdZHZbX@
74X2AKPL@N4A@7\N>V4S[9\S.[(HYLbKGY)QZ)=8KbY[B9[5YO-eZHQa[+.[^YRg
\6g#]2e.a<+?&S+?VB<U=+I<.]VR^E-2>05VRKX>22KU8I0W1CY;V#L0d^N@UOU^
MC-#c.YefNLMO/db00WY@FN@]V6#dS2RPbEd&gT9aE8G^eVZDNc=TET50?\G)@A)
bg<W#V;9]O9Oe>S^5N9L(I>ba/[4DQLgNJZ/>>a_[KF[9SYeAXX#\Vf-7FJbFHN?
DOO6<G,PNE,^ILU-9A(TQM@Z8,H)U:&KK[YDRI&B^Z1JG;DXW,dLSP-,-5bYdfE,
@AO64-D^5b]RKY8PBPWR6HLH)FJ_8>/<f(<ba>aR_FK;1UX/[<UW>X>e@a^6QaHe
)&(0A#&Y/bAIYH>@3:efaC9CP41<B=.CO?gJ1V9ccc1540-+>>WK5R\(dN+1E6ZD
3:N2RPUN4dV+NBELD4U2fT^X/f@bS3U4+I-NCUdO]^c2HOOdX3<__Jb-.B<R<M6)
eK,gU_^E?G7([.PB]<Gf__,4;&Q,&-8^[^S85YE#W_BMeF+TAd(,+?MTY;KAR+#>
NN/.96U>S^B?;;QME(7S=@=NDZ,c0=+,?#8Ib3:@g2-?7NcJX[&:NW6]<b1g>#Yg
<_61fFQNQgfZdb5.gU_QC,3G1UHD)&SfX(>Z5,P8Hc.L&Bd:]H#YU9RD]Z]YO01Y
9W-2JAbJZ?/;]RNd&12/=C9B8ZD8Q4M=gP&Bg6>:T@-6MZW>V1FTbGX6RJa9aS8G
UOUFZ&ZC]C#K#K0PCD=&:/&\(c(1P5&CT?ba5^];61/WQ)=#SOMM4VRR1_=OaQ_-
UCA].-9[d/N],Q\FQWb8^QT#I:dD/_Jf,<R=]7Le>0;0R>HD1G;;L?U=:_CUcbae
dWJOGG[MAE4[ZKAW\BDaZ-.GKTZ?0e8?36?FS?bI0bYccC)U_5];2:9<ZNO2QHH+
d\0VNLG;]W5XX6NQcC@\3XG;7aTM->;R?Q43.>LQeaO-2^99=;c1RM#g<.[CfgM6
..O,(fZ^VOVWFK6]dHeR,G6T2M0.EJ<]4OWRfc.L3CQ8IX@>bb8?g=GA0ceK3>:I
E5;cM(3)FM=1T+E06/\=OY7N]1DgR-:52B;(7a0740?H=Ef,E\#N]Hc?;>9aIO9N
XB5@>>Pg8bXHQU>?G1W.aK@?8A-38O),S7=#J=<JHKO&3<)N;B\N,H-?d]PB7+;2
-6D7Z39#fITXK0e(F>Bbf[fg2TO-B98V>B=MM1?X#+,2]60NOb\OK=aK@U,I0I;8
.I?THe^D#OM.2@X9/<5,d[E<S=(Y]JD?AVW=a1_ZF7=c6C6\JU;-4L3?)1=L17S4
#D-W^NOH^J;c/^ae\)1@1K(CHD/g+9>_,,Q>X=&8KcR5K\G7P]5YIBPdZ=VXcZS^
<I:a1?4Q)dV&bL2=-8WL=^U;?C:0##b^?Wc&=90#IdZ+E.B2I&A:#(^L#>QGd.#_
<^a=eN9,USTDg[&daEP+630F6(f&JG-+G1[&Y_-5_6(P^11E0RBGY?LP.9+#DK1[
USSN5LZJJ@]YIW8V4O>b&#UVHa4cLI-)/f62B=0d2<(1b#d],9b>gSP/(#L.GS&c
V)R^9P+,,[]P=G#N[+gd;)^dY+E\K2J):ZXW^48U^4EeJbg,:TbVXaR&2NJ87<&N
77&K1/IQ^\LISd2PZ[46X7D6^@E\IG\LIc,@b/[_f4WJ8Q+DX9[OY.DAg[c#10QI
XKbDL;NS&/-^/_WV_;XfI[>EWfGE?1YMfH2g<gD0O?A@S/[-e)[L>8E;M=MKR)?Y
8<7/;2/a3\g/Z/C,\SFRD^gNN>6^7bHN[@(7&78+?GeO.0dR/ARABF(4?-N#0VCU
Wb2McN9e/0IB<K2&QK]GXL&bYN(aV5B.AS]X(DZ?T0)]ZaD@5C\Tb-/J2+QUgaK-
8+]+CJ+;2dP<R6@)R#e\B8A;/85HFc.G@d]2f?W;FES=Y]Sg6=(]MQ29eD7)Sa.e
bG:M4O0DW@)Y/#/Ie.W/\YOd=GU=P2R=dSN,cQX#<4[O53SfC9_E)=Z@&,GR=+95
N>f5d7[gaBMD?<]b>&T]d^I,;V[#5OF)5@O6]6aE5CdX<5Y2Ja9dYU9;1_K??@]d
/c8GZa.6PUUVY47#O^S6QVfKBY#9G,f^ObC\IR@f_G;=879#G>>\]>:e4[WBc\e-
&Te)LB71,\aC+U_4P)3PKF6VGG9TW^R+((T3NYW&(+2g5ES-LNe,E-;R4E\Aa22_
/BW=8EV<0+\&^(?J1M;af+.)F)KJR@TGC+c,NFEdR4QLBB#F]DX7SZe#5AD[ETD1
8R8Hg4IBJFcE<bK>4<e36,E1291M7_DU<]MPD4S]Cf5;R8V]#U4POHTF-EE^)UEc
IAR]54#-cK@4V::7+X4HUEK?(],.Z2,dA@3SJ0CT:&Y2(T?UBE?>MCPgXeE)S^^3
)Z<c+8/L>4FL,2(3_C4I3d.A<;JA:9a+XeXJQ@T0NP34A.\O.#7+_G2)HPGM4c)N
U0+7eCb/I]D,Ef>JSY6D\(V6VUe@3&GUO?)ZSP:3W.fL=2+#cS0Ic+Me=BKIbb#>
T?[;XG[KYd<CZ2G&eL)0<<,3?M\4H)5KK=[_-1_#E.EFeNT[WG:@?f)4R9<2fCXH
JK],)9?JMUd9))H=:5M3N5./DF-.#RHeWV^]<DX4CGc,@ePY@_V&@<)A\9U-2,BD
YF6TPH2aE\\\093C?.0/ZFdJ5<A.f=6S96M^XG]&:@^XQO1H=X+CW0#9(Bd^/E?&
S^L9K\\0a.?<0e(DOP)X:eH^F8cC4DW314(B<B_5(C5I^CX>Pa@O^Q9NN@XOTCI9
[MC(Wa?+AW&R3dJF:gPCY#0<MDHKggTa3<XeP[-NV?a=+&)gcddg^;BGgb;G_:T5
?9ZFDd#O9S^Q<^9VH<2TQ&Gb<P:X7bbW/P=LAX=7TT.]R3#UE4:(MI<3B(84E,_L
@.][0A_<F;b+UQWBU[JT16,6)M7.SVEfJfc=fVZ#Q-eKN<f;dZ6J>;JC]6G=@e>[
A:MWW16;b+R-cGZW>=0Bg;L],XZ9T#W#)UW(QbRUQ:7OR&VD>VUQ7YAWL+6UVJW(
=Z5#aEM=B[4IB&SYCRPP>_5ZDK18fD_\e]9;LFa54@FUM#0Y84V_G[X;E/D]#>TX
]>]gb9#\;V2\\WAGGYJ<eQ&[KQE44(e;I58AYS)Kf84bAAVfD#P[D].6#-#8FXTJ
7L&REF44Oe[S2;@[9O.;f+f\#1L[+CT5G6Jd60DM9,H+LYbMBc1Y56H\+:.8c.W5
9Ib02d4:[)@T(Z4KPCF-V6R4bB1V=W&U-U,e-eZQKQgg55&;KX?)d]f+FB]S^FB6
2f1LK.FJb@P[TB2_PD(SS>,B25-WQBSPFWU/JT,HaPS>WeA:b<PY6HL6.LS?98H(
WF:9?2>g>#P29LZgXZe?c288AUQI:YMJG9;BDE7B=aE.b(<=LVPAY#=>]H>T,SC&
7)D@8/J_3b=c_F9(5L>I2VeC:S^F.@==Q(;>>3X=d\+e:Q/E[c18B4?)K_Tg7eR+
18,MS,^2IQ6+bREU[H5deIP=0^^&;6+)eU4gP6Y,f0Vfa9RHc9.8(T^S7UG_^<#N
#=e:.CJbe8@EUPR]?>9&P4;]RTX6UX,R2R:fCdA49.-H+Nfd=DVUT0eP00^<UB=f
QH8G1<PT#X8\5C4^(,H?\RZ4Q=ZHC9>#9;cEWIF5;XDD?X4/SgHS>6A:A2\70L])
UTIJ.&M;^^NN6<S=W:_aOXI@NKTJ.J26>ZAQ8))g)Q_,&W>5X^1\JcHV<W2QaWB(
3VF52;ca648SN4+7ZA(>c/JVHcf1X2g+CVUV5FeQPKd,B)I#(-.;1KbHFg-QG<ZG
NTJBd-1]ZdcC>V5SIW.KIAOK68R#Jb0R&9M&KEGFg5M\9BJZCL4:<MQ<NBWg7gH<
YHdK;UQ6Ac=8UT^3CbBb/O>CEUKHP7XO</090c^&X:U=GCR?^_0;T\;G05PR:dff
X\R6.=4W:QY8W\3c-929K46RQdZV1<CNJP\f[&Q(E&/FM.Xa<R<Y;C_D9/)G2J+K
3PH4@@3^4Ge<Y>^.]4SX66g5&]XEYfbBZ]=eL4J\=\&6/LKWc^#S>=Zee?O:b4EW
K[DZgLK5(f-+SREXACL)(S06=[B-K5?B;ZV=H:J[MHc:ACDg1;C)?;G[2C)@/7C6
L[Cd)[_c<<.RXWG]AF+R_W]eF+#a6J+K4JM=O40L&gA.#+b?fOM\5g<CAe34LL)]
JFC&Jb9-UEHAUUDc5ee7DAb8_HR.XG(_7ZXE&GPf^BO^#V_3MZ=Zf1AV=;3O&:6c
M7JS#-Q^1LJEX9)O;9<&4,=<<&)(P4V#gEAX:W3?KYFc@G8ZQga)fIC@0SC1^/_d
^(1M5>TZLWULe#1=WR:MRT:c.1W+G[fK)1ac2<E,XdDL<F0BI_/aaQeF,dAWgE5-
<&<<7e90Dba67G@F#)V/>R512cbFVA^@\ESN15cY#\>N#&ed;6Ce-OFSCa^_ASN3
-0L:4D?9L?PJUOSMQA2Xf&HZZ:_#LEAG+DbR;/U9[5(a)97cACP\MWBXW65?H4NB
AWCFLA9KbZW+-)W([0[BD8gTbFEMPg#-ca;ceJPfC)9g4[>LV1PEWOPF8XeH#RK#
d4\W/JO(eVU>VSa<NW/+M@K8G^9+-6=5/O0b?ECO+]I:fVC-MOR,D+^+>>IC,/Dg
>e/R9]N4YB\(\TD+3Y;-&&AZ.+\a,E9VE=T=)HdN6Ma\<MV/I[CPLc</<+4@bR7O
a(a,#>fKc_cC3,L+&KEVK_2S4=5JE=HC>=ZZ^\1G[-ZXTXQZ)7\?P#\4_R(T(\?4
#9c@Z^EU2FM:6WB,TXR:.E/g/_956R_)3I#a)\)Tg8W_>F&gZcb/JWeK:F0CJ3]g
eE0[[cf\CW0D@9#eAUd<4UJII#P:6OWEW[TZ_f-W\/\TaTX_<+=,cST/8/VL/DTc
,X<QgX2OGe>:Ef7g\:9MRO1YD#\dcNaQQea((Zd#E0;16KE.7I61CUP==Q=?;X<I
3XQ?T/[7SYHY.7_3IU5gRb6b_55I6LZXA)g?XTTIf-Qa-8Jge9/QJWCXIUJ4a,<8
__DQcG>]/W;TQL0?W.G4@FSJY4^g(]gZ+P=99X@DX+fH8.E\B)R?W)-VT;aZ,YfU
TSY#+Z=f7Gb7@M++J/G=@TW^)RZUS2:&A9SaU/EWS@KWeDZ:^^6W&L+1N4R<&X^S
;HOa,^)A>#M,G]HYUY43,>SXY[5/4gU>F,(;AW8<=A.G(890VL@EKEPYC=(AP\6I
4CUe]58VF.\]6E83@Ia?69,+)>&)4Pcd@6eF6;=DC]+(T0FY_#_CbAObW<YJ[,cZ
G]_N#5aAbf#e<;NDQG>MUFHBDGDQb_FRb+]N6QG^>>T_C3VP3S422:\PJXWeJT>+
,.+S<EfDK?J,GR0=gaW9PZ^DWBAS<)-H7<0cJ:=G@d9W94bMM.#GRYK0C)97S4LI
EJ/#<@&-aJ<f##S1f7U-YPX3M/;Z9DW;++C/+d8F4eS0)#&8cW;9cTA)T4;gO8.R
GLbWfR85f>a_]&E+bd8(PI?8aLO?@4-+N>N]L&cYJN=&Y(90YUMMEJ><aK2RO&bR
QO_#_^_G8(_[S?ga^TEW#@gJN0YIbX)2&af;U=:U&9Z0gSED;7+Z9(>&\.<fA;=I
JJ(<])bH?R?XgT8&,)O6&b^_.Kd@,T[DbeE:-Q.O]RG/&GQ&[BI)(:.8Kc-JV[T9
TKIHXFDH9L;E=8;<,Q.WA6d9@,&#KBf7BG-GW-4/UI&>bgA>9?f\4N93Le39c0]R
ICO8Y6PP5K:3fH0<<)a9]ST1P+[,DedF7A;1,3=b]U??OeJ-0UUe(d?G)f^[35<Z
])-X\\.fV#60.9,d[CF;gd&(Z74SfZ4+5.96&UYbA9OV.)5W5]cO/b@O2.4HG4@P
OJW#FX&3HT.GNFI>O9:4=]2d.+7&:H^Q]2F6&a+E_&dLU\AY=,FaJR>:de5(B8O]
0RN>:X&B>E]?R&bF=dEcf<9Q0AVJeG\/a92TJ/LS[>O3Q8;&H&Y7H]^U76Ic]^1S
Z2P(cO0aVW?,a6e#Z?W;(W=?E7b)&eV4@OLA^:)DK/-6#-YWRU:+2YXQ2UHgfB80
7dfJ5?;_M4+Dg)CPgdc[]:_g\-9_NX=+8^5gX7P=[KG\Mc8Ag2=XEZc>6MNS>LfN
0&H^FZL\X,4EfMKY0MSFQ]C9b;6@UIEYUJ(fUC6=N8Db;:EVK2)_WDJFUN493^SE
f=#-W@@E,XE&RV-+K6GL#K1(<Na8-=SLW^<703Y;I4U:)S_Z+L>F^L>WRg?MdU.M
aGPC/W<TY&W3Z/B(#6896\H3QgA=NUK=Q@6a&8.OPFF_a2dfE6Lc]g(&?FA.23cZ
9)0>BU9]\>+32F&fd_ZX8aKF[[^C9/R/e:>EOEcd=&F6CY2f^E+V/X[-BCO/>^D9
(DbKO3D_dGFK9^:_2Y1)^IFWQ@aDdRH@_b@)d^LYM\S0.\M:_gWUgACfe1<UGLVF
M/2T&DZ(#a8<TIf5^d3^W.D(4F6<\cXA4]VJ0(E3CM5I-I@eS.CL8)]26BYD[[-P
C)SSQKM>Kb:aAGbc5I[-TGDd3.1baESF9A2J;NT0,@V&:=cXH2JTLGaG,Id&PCJV
_]ObCGO(:dKbR?JXV>BTeG2CHNZ<eEPF&+2D[+X?JD=^<C&:5]>Kg(UCJ_61FN(1
HE[CA/a23F(Jd]6GQg.GVR-(3+NU2ZA8d(bgEd_g)QED:,=RYe48OJ2A1U0FfA]^
7VPEC1@+B56EO\X06OcW9),-/3YW?HJ.Wd[XEUXP#6Ke[Je44Ce^5FD^-Qc?R=\;
<[B+8R_E@EVF<Q?OK+HM?SQYcW<-CD=#-8;/\@5H#H^bdH_(cD\.b],/LR-.J^V5
aA)Q^b?gSLaEf[MT6E(DH>DC9TW6/&aGMI:WXJfM0HOa6:N4R^?.fB4VCd@&R7-/
faGM;>D[f0R.1N(Qb&N+JZB\K^P3gdKHLMAV?6cS^.EKB2Rcb8+HC(IX9]BQY-KK
N?6@9;@0_\T+_ZN6<0X9KSH845CLL@3LKD:(;RSX;IbX[C&&>EKR>W3?a^d-^O1d
)_UUVMXBg(H5)N-:4=:Md1PLCQ]2EV<fB_OP/6X1E(JFNDZMZ]EE=[,2ZAH<LP.)
d3;[@9&RG[E1)N(B2P4N0Z_1gNQ+8G=[ZeR_BW&2e>,Y4Z5@d8CU<FC.3_D;TN?Y
8;DdEM72&VE[B2If0E5=<c;^2\N\2eIOQ/)^7_3C)RYS)>c:YM.:RU\/J(3ZEWEU
BcHdNQPPW1Y+../OMd0L^7&Yf,CXeFNU3WW)F+2/53e4L0-cG::1.SB&W)Q_dXD:
gY^O=URb=LBV\]10X=V@&=X276_fOg+J->A_,)9-ZDN-YaODbN2,[@J)a6V1QN&b
N]L^WT^5deH&(?NNW3<5f&IL;9Ca7gCcAf/PAVc1-\H(L6._C85_N?Ngb:<0gBV,
O0]L3^(M;e2#ed^b3Ugf@R,H(B,RW,XU@3.f9MH5>eU0+;836OdU1f1PQWcH.]g[
TA)J/?/Je0DJg.a^SPP)F]06]EC1<GCRPf@MK8\XL:1YL[X3Ya8],2;D1QGK\Kgg
9e9#(MUXZ0&&WUV#S3C5(8d#H&Y(4RF:6V(LO+G+V)N:7UF-(9L#K4XM@@BD&PX1
4DOK_&3-7VN(K/&OZcVce1P2MKZgX;^@DK2LO-Td\4:HAV2FK5Q2<T46?;NP7;P&
LAP:]?+QR,/YFI1NC&8:-2/?8O7#f[f6/cQ;e>39-3.SVFN:JNKC4PJ\UG)E./1K
PXVQ/;\,_89VFJdPa&5V8\U-e)T9(,(VR39P28:.DaTC:WfE7:(FG&WcC_87C;b>
#?:TA56,=\&g,RIPU7)T_d@@YC056\d^6G9c]L6?KNV1K3T3a/W6H\@a.d^8)K4E
-5c<@>W.+58dJM_#R\+7ZWE.e-;IKF.3.VXL7dVLM#^;7D->N2K7@B=d(Je&+NH=
26@]TC2+XWcFa/30<RF7.dH8T[2:L[]I5LBO9fNREC.3;+g.g69aV&+g5a=0f4W+
c,V1+&&1TH(#aFG8cAX-;(+;PMHI=Z?Yg<GMA9Uf14Aa<d+3,K:gb>g^U4e[U]Td
GQeU&RMB-Z[5R_4LJ:U=V--a^MZ>4)FA[4=Y0:f3DNT.;Ig6(EK9X6G/I(/IKVfD
#Ke6+)AKF;I;=&7[Z=BST=,E.c(8#BO<M9dI8+.#8H:O^FX&Z/\RZ7GL@b-VZ;R7
2)++;)7T4CbIQ_f/U1dT7L3@?Y7\[IcQ9#84(;ed6b9.OeY2Y:[?Db)98&TAG_5>
NVFDLIZZ,3f7;#aF:ISBEE/9-]XY=PP,^@VVeFK>e85cJ3EO1Z/2_GD>DV]T2LQT
;Qf^SB:;(JCAX/3I+b4(d)f@?3=SR&HF>1[H=b\8@M[EP,HY>g1-c0=VBF_ceQ,K
XKf]T#5fU#Y,.c5>6c+Xb9RNVU&8XKGdX=7&+#Z>c]P\.<(WJb04>9QF/L<bZ5LY
XQNB4JW3c&.92L/\>_a.A0,R0.e2RW#/bBG7#I;^4A[QY^^F1)H@GI=+O<<&9#KD
=\[^X+T+d,Ya;VEdbA8L>TDAAC4]IO]L>D]TV#]NO^&3c<4[PAY#1(,@9:A@)Z8/
V30N&UTCHgT:MI\5U1=5#<SJ\;)f3.:JWdC:<=NB,)CC-OA+R5J\M5?P>+N3@@4#
/66\07b]FOL:---QDX&efXYVAWNR?8:@IQa>5PV0_^g/U;3g@fWG.\27O3W>_4&?
]c^T32c0=Z+#Tf[Q\RI(LcSG).3E))DVT(X(0WC^9HFJK5])Z=0d(:DP+E-,H=NY
WYO_cQ8bLXZ0K;/WF/S^fJ3Q.)E-fM,afT(QDJ2\F@/LDFO;;5Wg77:2SfITZ8Kb
3B-2J+Z?)DXgb1D?UgVT6E=)0)>cA[Ld)P[9Ue4a\]4/R+c^^7b]J6d7[5<e_a]0
C60KWCPQId&4:NBP8#?]=bMJ?F\V1Bf+g8A^V2-GQBL)SDRDBe-;C/A4NN=9_/g7
RW6O[57WFTM6G>D,.-W,?4_F3dODcRg[X/K&:+/(H\=/8fT=ZR\AQY4KR(2-RTaI
.Y&Y&^cN(X(a0+H2=2:1W\V)_S9QOLXYV#1gSc9^)1HXFbBJ3B6Z#_ZIEUY:)WJ6
O>K-&-VPf._CWV+H8-<9J<D3)3[4a921fAI;199;(QJ8HP8V>,8@YXC_Q,;?[M_S
J4-bUOOW?R7OW&8f#Uebgc[CV?\F+#K3PZ[5N](RW+.=a]^Q.L521e1WQd\#CKAO
>Kf-?6bMFIBdg;_+GB]Y82HIaI^HcMB++MEO=Z\X]:L;PMMHWgg6X#@Z#>e1+/9W
FXFC7C8(]8.AXI=>E82GfgeBT^10>4dLJBc9WX37ZGNaLPYUH9?\39G<Qa_Mf[)I
8#>Q;C8/A5_e(b83^\>B)<c,4V5.PM+Pg&T?a@NIQ_,X+_[EP=_TZY16cE\Q)Nff
P8/XI:Yc\=A)@bL)d1D>7a8(,0BV_&PYb7T#(NZG9]:HH#&4#O9-cfc&[YEY99T,
#&Y-DWGI<dX1_e9[W;>A=)&I^;9g2b_J7.(=YRWHA\V:SI\Z+^BfCP+]@7F/Oc0Z
JEag]TW\:914,T2J=P<3+J?>KWWBdA((5IXK0CJa0#JSUL)&4.Yd#.:<^LfHBH#2
-=X7A/Z6gQ#CCX2=<]8V8<+CX+:0^5Y7<NVWaH4)Q#[]98E)(N4R)dL4SGgL1;0^
.gJ@EERXY1Z_E(FNB.<D;.b6W)A6X]/Y0)Lb@EPT@=<3JECD(C..JgJNY^(V;7f\
ddg8AV-H]bKFF9FcaL0.LfKB6[1HIRf^[\1KY96?cVdVb_4I]d;8f^,dX)QI3I]Q
630,KTIH_1HP[/ff3G8^fP=V;?-X.\L:=Fd1<7@HB5<?T5)V,:>C/;T<0@(6Z?@@
Y<3UA[]8O[+^#VJ_D1+]C4D2\+<H=d0c^(.(/1]YQ&&XAA:ZR\:egGOF].N+F\+g
]@DgB/bb+HdBUKSX/XFHQgY?)8.G)/LY++g=1-e9a]-f.]R]>MdGWBDT,&(C&1?2
[-L81YO)XbE0a1a&dQG_>\89O_X;1OQ7Z5#IQH#B#,dPZ69W<GEeU+,cRYHLe;,&
K>5V6&<eBE:NFGJ(F67VOWAO?,@:NaT(@;MAQ,3:H:P9e/EI#Ac4?M/E.G6)W-<f
]0PK1.8\B&3.R7Q3\Z6\7OHfXVf@e+EWKB0V04HH2L(J4]387=MDVS]gH;763a6e
RfR7RJQPAC4,77G:a(3C;&]dg[a0,]S:?\NO,YW0fd.FLQ3MKCZ[3c3Z9dF6T..F
SX17)C&_cfaF0e\,7:O-7E=X8U#>#3ZbM3D;1;<:O/WDdc&(_UI45eeUb=_M[@Ud
81?MM?F,c]1X,Z.X?FJ_-b7gE&Q,FaOECa9AM1b07KUS5G.]_?W\&G+(2/>WT&:X
>21d<:7HMGG:a5=R9+SW933MC4=G[)=-:RJCE[AUX52>S5Y2-0O]VTT)RCg9^K0+
;OW?KH#J?@OPfEB8KU487KTM]=H61eMSf._NUaM&8=UU-f_N[78eSFgEG<-9WLVS
Q:P:ZQ40<e7M;D3T,BA1PKPXK=AP;P>/c#F7#FT@=/F:<b?Sg<2c<T2PM-T\@Y_+
c53]@^T:FV/D329H.4A^(QfJ<U.?6KW#RN,[29]c75X3Z+H47^CC-^BQV)=IL>L@
ef^b2gZE&d-(.Z.T30LL4ec)GVZM2deA84S0/d2DYaFgOd.>E.K\G#WL(5YIcV//
=[NTf^Fd_gW@5&)QCHb84PYQ#/5?,50JNQJ3M<T)E8X+IM1Q:AY-/g#,CA>JW1_F
.,\ZWR3(1FH^+LDA00ZB:2H&G4P&H>?XH,KDeDf5)FK+E$
`endprotected


`endif // GUARD_SVT_SPI_XSPI_SPANSION_TOP_REGISTER_SV

