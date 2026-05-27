
`ifndef GUARD_SVT_SPI_CONFIGURATION_SV
`define GUARD_SVT_SPI_CONFIGURATION_SV 

`include "svt_spi_defines.svi"

`protected
8TM&0N=LeJHCReV6RaMGTQ)_2_b@FeG#X6K:_,3G>Q0^d,f-/aTd7)JYHWC??7+?
fW8-+eIgP/^\cDWTA0SWfXU)36,Z7+EWB3VJ<[cb23=I;Y+L(4e6XPOW&B3BUe[B
Je0F]A+2QecM#DS&3VD;I3gW.#:b>2:HQ>eBM)^[H(&Cg=3M8>W.7;F8:<ZUFC9a
\&P,3^9LWY=ZMA).=FM5a.H^@WU82Af>8^,4.e>W^@^ZM,C]^-P1-8>>B91J85DO
@)dUNACZ+-7#32N^PE;E&?M59T<:&MRcOKCQ1#XDEK;=Ge(SHH:X]9-;SUeFN:TP
b:P?SgTYc0_FT><c-PU0+-bI?bMT,H99C\7V4aDdIW9MeeT9+<7@O@1W4VV_,.^G
>28bGPXOIYc_-DUOH2(C-3DU@Z,LH8ZYd;fM3SYJRH?H&\65^SX>,B(>e)NAdH^d
6?+J2]bWU\c&2IDZ\N)(f\&7U7aS1XcCJgG_CbVEI_:[-)Y&-cf8W<K.B1_L=,X1
bac[LUM-;84N,17[)V2HXQbW4gNZY>O8D]##9b9>029).FJ-)cQRG+=X+UQXRHNA
8N]WKY)YZO0X=Z.F+Wgf]]E,0;U03<WcM(QM[?U7<T,b5edT3-\6[_11;G#,b5=R
SE#WGXJQCP>.C]Ga>KJ\QV#(WQ1P_)X690GA/2RG3aET:KWd=YZ_JPR(7S\I@gC(
cI;3HPIZ@3])dXAGM48D><KMRD>40FD1\1@a-/)6bQ0g\98?5MQ++CdK5UAI9Of^
6YeY=\eR:4PG(?@>SS]82/a\I[5^)K6IX85&N+,Y.35?_P7<I&0B2PC8K_PM-?TC
2R.fIM=60YS[YLab4b21f?J&/c<1MIR4((84<6CH&55E<G.F?-+;c)0g?2SD[A4=
8,S5.6cHZ>5FX,9f&;G).K<#S8761R867]cb.U1<<OKe0;L>ZLLDg8&>6JFfV4=[
#C6IKZTD8F)UGE=0XK6=a,8GK<N:)307F+SN^NR[K.Z[.#.&Sc-#7Z:DY4@INZ4:
aFU5I\d#1H34((^0=K0+XFHMXbR2d7;9WM\Q#O=dCA^</SJddY)f(fO)((VCEX?Q
UVFPe9f7V(NT/+RcbG_d?LJB:\L+-8K.8&[Y4K6FN\Y49a:)3f;,H0O)M$
`endprotected


typedef class svt_spi_mem_configuration;

// =============================================================================
/**
 * SPI Configuration Class.
 */
class svt_spi_configuration extends svt_configuration;

  /**
    @grouphdr spi_cfg_std Standard SPI and Multilane SPI  attributes
    This group contains attributes which are relevant to STD SPI and Multilane SPI.
    This also contains common parameters between SPI Modes.
    */

  /**
    @grouphdr spi_cfg_flash SPI Flash attributes
    This group contains attributes which are relevant to SPI Flash
    */

  /**
    @grouphdr spi_cfg_empspi EMPSPI attributes
    This group contains attributes which are relevant to EMPSPI.
    EMPSPI is custom feature.
    */

  /**
    @grouphdr spi_cfg_safespi SAFE SPI attributes
    This group contains attributes which are relevant to SAFE SPI.
    */
  //----------------------------------------------------------------------------
  // Type Definitions
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
`ifndef __SVDOC__
  /** Standard SPI Interface. */
  svt_spi_vif spi_if;

`protected
HC)0&:(U:4J;aN/E]-WS\FV;R&\_f-=A0^-[E4<]3KT6\@@f0d=<2)ZST<_Cdf=0
O&);(DfGJF7Y-f.&^/#dSAd>^2US=K2&UKC+(9#.Nbe6IaF=Z@XALN4\Kf,[2T,gU$
`endprotected

`endif // __SVDOC__

  /**
   * It selects the serial specification from mentioned below supported specifications. <br/>
   * SPI   : Indicates SPI feature from Motorola  <br/>
   * SSP   : Indicates SSP feature from Texas Instrument <br/>
   * UWIRE : Indicates MicroWire feature from National Semiconductors <br/>
  */ 
  rand svt_spi_types::spi_feature_enum spi_feature = svt_spi_types::SPI;

  /**
   * @groupname spi_cfg_std
   * SPI Interrupt Enable Bit <br/> 
   * This bit enables SPI interrupt requests, if SPIF or MODF status flag is set. <br/>
   * 1'b1 : SPI interrupts enabled. <br/>
   * 1'b0 : SPI interrupts disabled.  <br/>
   */
  bit spi_interrupt_enable = 0;

  /**
   * @groupname spi_cfg_std
   * SPI System Enable Bit <br/> 
   * This bit enables the SPI system and dedicates the SPI port pins to SPI system functions. If SPE is <br/>
   * cleared, SPI is disabled and forced into idle state, status bits in SPISR register are reseted <br/>
   * 1'b1 : SPI enabled, port pins are dedicated to SPI functions. <br/>
   * 1'b0 : SPI disabled (lower power consumption).  <br/>
   */
  bit spi_system_enable = 1;

  /**
   * @groupname spi_cfg_std
   * SPI Transmit Interrupt Enable <br/> 
   * This bit enables SPI interrupt requests, if SPTEF flag is set. <br/>
   * 1'b1 : SPTEF interrupt enabled. <br/>
   * 1'b0 : SPTEF interrupt disabled.  <br/>
   */
  bit spi_transmit_interrupt_enable = 0;

/** @cond PRIVATE */
  /**
   * @groupname spi_cfg_empspi
   * This bit will allow to skip the Negotiation Request/Response between Master and Slave 
   */
  bit disable_empspi_negotiation = 0;
/** @endcond */

  /** 
   * @groupname spi_cfg_std
   * SPPR2-SPPR0  SPI Baud Rate Preselection Bits  
   */
  rand bit [2:0] sppr = 0;

  /** 
   * @groupname spi_cfg_std
   * SPR2-SPR0  SPI Baud Rate Selection Bits  
   */
  rand bit [2:0] spr = 0;

  /** 
   * @groupname spi_cfg_std
   * This field specifies whether the data is transmitted in little/big bit endian mode  <br/> 
   * LITTLE_ENDIAN : Indicates SPI LITTLE ENDIAN Format <br/>
   * BIG_ENDIAN    : Indicates SPI BIG ENDIAN Format <br/>
   */
  rand svt_spi_types::endianness_enum bit_endianness = svt_spi_types::LITTLE_ENDIAN;

  /**
   * @groupname spi_cfg_std
   * This field specifies whether the data is transmitted in little/big byte endian mode  <br/> 
   * LITTLE_ENDIAN : Indicates SPI LITTLE ENDIAN Format <br/>
   * BIG_ENDIAN    : Indicates SPI BIG ENDIAN Format <br/>
   */
  rand svt_spi_types::endianness_enum byte_endianness = svt_spi_types::LITTLE_ENDIAN;

  /** 
   * @groupname spi_cfg_std
   * This field specifies the number of bytes selected together on which byte endianness is applied. After successful Tx/Rx of byte count  <br/>
   * specified in Payload word size, Next set of bytes are picked from the data array. If number of bytes in data array do not match  <br/>
   * the payload word size then padding with zeros is done. <br/>
   * SPI_8B  : Indicates SPI 8 BIT WORD Format  <br/> 
   * SPI_16B : Indicates SPI 16 Bit WORD Format <br/>
   * SPI_32B : Indicates SPI 32 Bit WORD Format <br/>
   * In SPI_16B and SPI_32B alignments, the bit/byte endianness can be little or big endian. <br/>
          <table border="1" CELLPADDING="0" CELLSPACING="0">
     Thus total of ten combination with payload word size and endianness summarized below <br/>
          <tr>
            <th WIDTH="0.7%">Payload_Word_Size:</th>
            <th WIDTH="0.7%">Byte_Endianness:</th>
            <th WIDTH="0.7%">Bit_Endianness:</th>
            <th WIDTH="0.2%">Example:</th>
          </tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>8-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>NA</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B0 B1 B2 B3 B4 B5 B6 B7...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b0 b1 b2 b3 b4 b5 b6 b7</td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: None</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>8-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>NA</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B0 B1 B2 B3 B4 B5 B6 B7...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order:  b7 b6 b5 b4 b3 b2 b1 b0</td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: None</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>16-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B0 B1 B2 B3 B4 B5 B6 B7 ...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b0 b1 b2 b3 b4 b5 b6 b7 </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 16-bit aligned</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>16-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B0 B1 B2 B3 B4 B5 B6 B7 ...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b7 b6 b5 b4 b3 b2 b1 b0 </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 16-bit aligned</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>16-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B1 B0 B3 B2 B5 B4 B7 B6 ...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b0 b1 b2 b3 b4 b5 b6 b7 </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 16-bit aligned</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>16-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B1 B0 B3 B2 B5 B4 B7 B6 ...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b7 b6 b5 b4 b3 b2 b1 b0 </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 16-bit aligned</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>32-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B0 B1 B2 B3 B4 B5 B6 B7...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b0 b1 b2 b3 b4 b5 b6 b7  </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 32-bit aligned</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>32-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B0 B1 B2 B3 B4 B5 B6 B7...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b7 b6 b5 b4 b3 b2 b1 b0  </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 32-bit aligned</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>32-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Little</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B3 B2 B1 B0 B7 B6 B5 B4...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b0 b1 b2 b3 b4 b5 b6 b7  </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 32-bit aligned</td> </tr>
          </tr>
          <tr>
          <tr>
          <td ALIGN=CENTER ROWSPAN=5 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>32-bit</B></td>
          <tr>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER ROWSPAN=3 VALIGN=MIDDLE BGCOLOR="CCCCCC"><B>Big</B></td>
           <td ALIGN=CENTER BGCOLOR="CCCCCC">#Byte Order: B3 B2 B1 B0 B7 B6 B5 B4...</td>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Bit Order: b7 b6 b5 b4 b3 b2 b1 b0 </td> </tr>
           <tr> <td ALIGN=CENTER BGCOLOR="CCCCCC">#Padding: 32-bit aligned</td> </tr>
          </tr>
        </table>
    */  
  rand svt_spi_types::payload_word_size_enum payload_word_size = svt_spi_types::SPI_8B;

  /** 
   * @groupname spi_cfg_flash
   * It specifies the scale down factor to be used while using the specifies timer values in SPI_FLASH mode.  
   */
  rand int flash_timer_scale_down_factor = 1000;

  /**
   * @groupname spi_cfg_flash
   * This control bit disable the baud divisor generation logic and sclk frequency becomes same as bus_clk.
   */ 
  bit disable_baud_rate_divisor = 0;


  /**
   * @groupname spi_cfg_std
   * SPI Master/Slave Mode Select Bit   <br/> 
   * This bit selects, if the SPI operates in master or slave mode. Switching the SPI from master to slave or vice versa forces the SPI system into idle state. <br/> <br/>
   * 1'b1 = SPI is in Master mode <br/>
   * 1'b0 = SPI is in Slave mode  <br/>
   */
  rand bit is_master = 0;

  /**
   * @groupname spi_cfg_std
   * Mode Fault Enable Bit  <br/> 
   * This bit allows the MODF failure being detected. <br/>
   * In Multi-Master mode, with MODFEN asserted and SSOE de-asserted for connected Master <br/>
   * detects SS_N being driven by another Master on SPI System <br/>
   */
  bit modfen = 0;

  /**
   * @groupname spi_cfg_std 
   * Slave Select Output Enable  <br/> 
   * This Slave Select Output Enable along with MODFEN determines slave select (SS_n/SS_in_n) port behaviour in Master Configuration. For Master Configuration, <br/>
   * if SSOE is disabled, Slave select (SS_n/SS_in_n) is not used by Master Agent. <br/>
   * when MODFEN is enabled and SSOE is disabled, SS_n port is not used and instead SS_in_n port is sampled and used with MODF feature. <br/>
   * when MODFEN is enabled and SSOE is enabled, SS_n port is driven by Master Agent to select the slave   <br/>
   * In Multi-Master mode, only one Master should assert SSOE for initiating transaction on SPI Bus and all other connected Master shall de-assert SSOE <br/>
   * Insert delay between SSOE assert and next transfer(SS_N assert) to make sure Active Master SCLK is initialized before initiating transfer  <br/>
   */
  bit ssoe = 1;
  
  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------

  /** Slave ID. Only applicable when device is Slave. */
  rand int unsigned slave_id = 0;
  
  /** Master ID. Only applicable when device is Master. */
  rand int unsigned master_id = 0;
  
  /** Default Slave active on SPI Bus. Only applicable when device is Slave. */
  rand int unsigned default_slave = -1;
  
  /** 
   * @groupname spi_cfg_std
   * Default Master active on SPI Bus. <br/>
   * This denotes the Master ID which is active on SPI Bus. <br/>
   * This variable is now obselete in SPI STD Mode. <br/>
   */
  rand int unsigned default_master = -1;

  /** 
   * It selects from Standard SPI specification or Vendor specific extended version of SPI Specification mentioned below. <br/>
   * SPI_STD       : Indicates SPI Standard mode feature <br/>
   * SPI_MULTILANE : Indicates SPI dual/quad/octal mode. <br/>
   * SPI_FLASH     : Indicates SPI FLASH mode. <br/>
   * SPI_SAFE      : indicates SAFE SPI Mode <br/>
   * To select SPI_MULTILANE, the define (SVT_SPI_IO_WIDTH) value should be also set to MAX number of lanes. <br/>
   * Ex: If SPI_MULTILANE is selected and value of SVT_SPI_IO_WIDTH is 2, Single and DUAL I/O can be configured using transaction class parameters:
   * instruction_lane_count, address_lane_count, data_lane_count <br/>
   * Ex: If SPI_MULTILANE is selected and value of SVT_SPI_IO_WIDTH is 4, Single, DUAL and QUAD I/O can be configured using transaction class parameters:
   * instruction_lane_count, address_lane_count, data_lane_count <br/>
   */ 
  rand svt_spi_types::frame_format_enum frame_format = svt_spi_types::SPI_STD;

  /**
   * @groupname spi_cfg_std, spi_cfg_flash
   * This field selects one of four possible clock configuration mode for SPI Interface. <br/>
   * (CPOL, CPHA) tuple represents the Mode of operation; e.g., the value '(0, 1)' would indicate CPOL=0 and CPHA=1.  <br/>
   * CPOL represents the base value of clock in Idle state. <br/>
   * For CPHA=0, odd numbered edges on the SCK input cause the data at the serial data input pin to be latched. <br/>
   * If the CPHA bit is set, even numbered edges on the SCK input cause the data at the serial data input pin to be latched.  <br/>
   * SPI_MODE_0 : Indicates SPI CPOL = 0 , CPHA = 0<br/> 
   * SPI_MODE_1 : Indicates SPI CPOL = 0 , CPHA = 1<br/> 
   * SPI_MODE_2 : Indicates SPI CPOL = 1 , CPHA = 0<br/> 
   * SPI_MODE_3 : Indicates SPI CPOL = 1 , CPHA = 1<br/> 
   */ 
  rand svt_spi_types::operation_mode_enum operation_mode = svt_spi_types::SPI_MODE_0;

  /**
   * @groupname spi_cfg_std, spi_cfg_flash
   * This field specifies whether Chip select (ss_n/cs_n) to be asserted as Active High or Low. <br/>
   * Default : svt_spi_types::ACTIVE_LOW <br/> 
   * Texas Instrument SSP mode: 
   *   For default SSP behaviour(IDLE state of slave select port is logic LOW), this parameter must be set as ACTIVE_HIGH <br/> 
   *   explicitly while creating the configuration object.<br/> 
   *   If we require IDLE state of slave select port to be logic HIGH and frame indicator pulse is<br/>  
   *   indicated by ss_n toggling to logic low for one sclk period and then toggle back to logic HIGH,<br/> 
   *   this parameter should be set to ACTIVE_LOW<br/> 
   * For all Modes except SSP :
   *   ACTIVE_LOW  : Asserted when ss_n is 0 and De-asserted when ss_n is 1. <br/>
   *   ACTIVE_HIGH : Asserted when ss_n is 1 and De-asserted when ss_n is 0. <br/>
   */ 
  svt_spi_types::active_mode_enum cs_polarity = svt_spi_types::ACTIVE_LOW;

  /**
   * @groupname spi_cfg_std, spi_cfg_flash
   * This field specifies whether RESET Pin to be asserted as Active High or Low. <br/>
   * Default : svt_spi_types::ACTIVE_HIGH <br/> 
   */ 
  svt_spi_types::active_mode_enum reset_polarity = svt_spi_types::ACTIVE_HIGH;

  /**
   * @groupname spi_cfg_std, spi_cfg_flash
   * This field is used to select the phase(s) in which Double Transfer Rate(DTR) mode is applicable to in VIP. Also known as DDR mode. <br/>
   * ADDRESS_DATA_PHASE      : DTR mode applicable in Address and Data Phase <br/>
   * DATA_PHASE_ONLY         : DTR mode applicable in Data Phase <br/>
   * INST_ADDRESS_DATA_PHASE : DTR mode applicable in Instruction, Address and Data Phase <br/>
   * This field is applicable when svt_spi_transaction::double_transfer_rate_mode is set to 1. <br/>
   * This is valid only when either #frame_format is set to SPI_MULTILANE/SPI_FLASH or <br/>
   * #frame_format is set to SPI_STD with svt_spi_transaction::transfer_mode is set to 2'b11 (EEPROM_READ). <br/>
   * Default : svt_spi_types::ADDRESS_DATA_PHASE
   */
  svt_spi_types::dtr_mode_select_enum dtr_mode_select = svt_spi_types::ADDRESS_DATA_PHASE;

  /**
   * @groupname spi_cfg_std
   * This field is used to enable Wait Cycle Phase in Write Mode when #frame_format is set to SPI_MULTILANE. <br/>
   * The value of wait cycles is selected by svt_spi_transaction::wait_cycle_count. <br/>
   * Please note this does not affect Wait Cycle Phase in Read Mode.
   * Default : 0
   */
  bit enable_wait_cycle_phase_in_write_mode = 1'b0;

  /**
   * @groupname spi_cfg_std
   * Few applications requires to transmit only subset of data frame width (Macro SVT_SPI_DATA_WIDTH) <br/>
   * This field specifies whether subset of data_frame is allowed in current device. <br/>
   * Default : 1'b0 (Disabled), all bits specified by macro SVT_SPI_DATA_WIDTH are sampled and transmitted. <br/>
   * #byte_endianness is ignored and only #bit_endianness determine order of Tx/Rx <br/>
   * After Driving/Sampling #data_frame_width bits, Next data_frame entry is <br/>
   * selected for Driving/Sampling. <br/>
   * Default : Disabled
   */ 
  bit enable_configurable_data_frame_width = 1'b0;

  /**
   * @groupname spi_cfg_std
   * This field specifies Maximum bit position up to which Tx/Rx is performed. <br/>
   * Default : `SVT_SPI_DATA_WIDTH
   * 
   */ 
  int data_frame_width = `SVT_SPI_DATA_WIDTH;
  
  /**
   * @groupname spi_cfg_std
   * This field is valid only for SPI Feature set to Microwire(UWIRE). <br/>
   * This field specifies the length of Control Word that can be transmitted by Master. <br/>
   * Default : `SVT_SPI_UWIRE_MAX_CONTROL_WORD_WIDTH
   * 
   */ 
  int uwire_control_word_width = `SVT_SPI_UWIRE_MAX_CONTROL_WORD_WIDTH;

  /**
   * @groupname spi_cfg_std
   * This field is valid only for SPI Feature set to Microwire(UWIRE). <br/>
   * This field is used to enable/disable the busy/ready handshaking mode for Microwire Protocol. <br/>
   * When Enabled, Master checks for ready status from slave from second transfer(busy/ready handshake is not required for first transfer) <br/>
   * onwards till completion of transfer. Completion of Transfer is Indicated <br/>
   * by Master by transmitting Start bit with Value = 1'b1.<br/>
   * In Slave mode, Slave drives the busy until it is ready to accept the<br/>
   * Incoming Data from Master. Duration of busy is controlled by parameter #uwire_busy_timer.<br/>
   * 
   */
  bit uwire_enable_handshaking_mode = 1'b0;

  /**
   * @groupname spi_cfg_std
   * This field is valid only for SPI Feature is set to Microwire(UWIRE) in Slave mode. <br/>
   * This field determines the duration for which Slave drives Busy to Master before accepting the Incoming Data from Master <br/>
   * Is specified in multiple of #bus_clk cycle.  <br/>
   */
  rand int uwire_busy_timer = 1;

  /**
   * @groupname spi_cfg_std
   * This field is valid only for SPI Feature is set to SSP in Master mode. <br/>
   * This field determines the number of SCLK cycles for which the Frame Indicator(slave select) will be asserted before the start of data transfer.  <br/>
   * Is specified in multiple of #sclk cycle.  <br/>
   */
  int ssp_assert_frame_indicator_sclk_period = 1;

  /**
   * @groupname spi_cfg_std
   * This field is valid only for SPI Feature is set to SSP in Master mode. <br/>
   * This field determines the duration for which Master ignores to check tristate(Z) on Slave Output Pin.  <br/>
   * Is specified in multiple of #bus_clk cycle.  <br/>
   */
  int ssp_max_output_disable_time = 3;

  /**
   * @groupname spi_cfg_flash
   * This field specifies whether Master needs to generate one clock before SS_N asserts. <br/>
   * This is currently supported in SPI FLASH mode only.
   */
  bit enable_sclk_toggle_before_ssn_assert = 0;

  /**
   * @groupname spi_cfg_flash
   * This field specifies whether Master needs to generate one clock after SS_N deasserts. <br/>
   * This is currently supported in SPI FLASH mode only.
   */
  bit enable_sclk_toggle_after_ssn_deassert = 0;

  /**
   * @groupname spi_cfg_flash
   * This field specifies the number of clock cycles Master needs to generate before SS_N assert or after SS_N deassert. <br/>
   * This will insert #idle_phase_sclk_cycle_count number of clock cycles before SS_N assert when #enable_sclk_toggle_before_ssn_assert is set <br/>
   * OR <br/>
   * This will insert #idle_phase_sclk_cycle_count number of clock cycles after SS_N deassert when #enable_sclk_toggle_after_ssn_deassert is set <br/>
   * This is currently supported in SPI FLASH mode only.
   */
  int idle_phase_sclk_cycle_count = 1;

  /**
   * @groupname spi_cfg_safespi
   * This field specifies the number of bits in Programmable Slave Address . <br/>
   * This is valid only when frame_format is set to SPI_SAFE. <br/>
   * For reasonable constraint please refer to #reasonable_spi_safe_slave_select_size <br/>
   * Default Value: 0
   */
  rand int spi_safe_slave_select_size = 0;

  /**
   * @groupname spi_cfg_safespi
   * This field specifies the number of bits in Slave Sensor Address . <br/>
   * This is valid only when frame_format is set to SPI_SAFE. <br/>
   * For reasonable constraint please refer to #reasonable_spi_safe_sensor_address_size <br/>
   * Default Value: 0
   */
  rand int spi_safe_sensor_address_size = 0;

  /**
   * @groupname spi_cfg_safespi
   * This field specifies the total number of bits denoting Source or Target Address in a frame. <br/>
   * This is valid only when frame_format is set to SPI_SAFE. <br/>
   * For reasonable constraint please refer to #reasonable_spi_safe_address_size <br/>
   * Default Value: 0
   */
  rand int spi_safe_address_size = 0;

  /**
   * @groupname spi_cfg_safespi
   * This field specifies the number of bits denoting CRC size in a frame. <br/>
   * This is valid only when frame_format is set to SPI_SAFE. <br/>
   * For reasonable constraint please refer to #reasonable_spi_safe_crc_size <br/>
   * Default Value: 0
   */
  rand int spi_safe_crc_size = 0;

  /**
   * @groupname spi_cfg_safespi
   * The programmable slave address is the address uniquely identifying the content of the response data.
   * This is valid only when frame_format is set to SPI_SAFE
   */
  rand bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] spi_safe_slave_select_address;

  /**
   * @groupname spi_cfg_safespi
   * This field contains the sensor data addresses for a Slave Device
   * This is valid only when frame_format is set to SPI_SAFE
   */
  rand bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] spi_safe_sensor_address_list[];

  /**
   * @groupname spi_cfg_safespi
   * This field specifies the general frame format of SAFE SPI Feature. <br/>
   * IN_FRAME     : slave responses within the same time slot as the master's request <br/>
   * OUT_OF_FRAME : slave responses within the next frame of the master <br/>
   * Default : IN_FRAME
   */
  rand svt_spi_types::spi_safe_frame_mode_enum spi_safe_frame_mode = svt_spi_types::IN_FRAME;

  /**
   * @groupname spi_cfg_safespi
   * This field specifies whether Slave is configured with Unique Chip Select or not. <br/>
   * DEDICATED_CS : Slave contains a Unique SS_N. <br/>
   * COMMON_CS    : Slave shares SS_N with other Slave devices. <br/>
   * Default : DEDICATED_CS
   */
  rand svt_spi_types::cs_type_enum cs_type = svt_spi_types::DEDICATED_CS;

  /**
   * @groupname spi_cfg_std
   * In SPI_STD Mode, by default Dynamic data array in Transaction object holds the Data <br/>
   * bits for Tx/Rx. But few applications require storing large memory blocks <br/>
   * for operation. For such cases optimized Memory Core is used internally and this mode is enabled <br/>
   * through this configuration bit.  <br/>
   * When enabled, data array in Transaction object is not utilized for holding Data bits and instead Data is <br/>
   * stored in mem_core for Tx/Rx.  <br/>
   * Memory core Peek/Poke routines can be utilized for initilaizing and reading Data bits <br/>
   * Memory core buffer space size is determined by spi_mem_cfg.data_mem_addr_width field and is divided equally between Tx and Rx. <br/>
   * Tx Buffer space lies in lower half (from address '0' to Total space/2 -1).  <br/>
   * Rx Buffer space lies in upper half (from address 'Total space/2' till end of buffer space).  <br/>
   * This is currently supported only for Motorola SPI, #spi_feature set as SPI.
   * Default : 0 
   */
  bit enable_mem_core = 0;

  /**
   * @groupname spi_cfg_std, spi_cfg_flash
   * This field specifies whether SCLK pause feature is enabled or not. <br/>
   * If enabled, this feature allows Master to pause SCLK after transaction class parameter #sclk_pause_after_sclk_count <br/>
   * number of clock edges for a duration of transaction class parameter #sclk_pause_duration. <br/>
   * The value for #sclk_pause_duration should be greater than the baud rate divisor. <br/>
   * This feature is applicable for frame formats SPI_STD/SPI_MULTILANE/SPI_SAFE/SPI_FLASH <br/>
   * Default : 0 
   */
  bit enable_sclk_pause_feature = 0;

/** @cond PRIVATE */
  /**
   * @groupname spi_cfg_empspi
   * This field specifies whether EMPSPI signal SPI_INT to be aserted as Active High or Low. <br/>
   * ACTIVE_LOW  : Asserted when SPI_INT is 0 and De-asserted when SPI_INT is 1. <br/>
   * ACTIVE_HIGH : Asserted when SPI_INT is 1 and De-asserted when SPI_INT is 0. <br/>
   */ 
  rand svt_spi_types::active_mode_enum empspi_spi_int_polarity = svt_spi_types::ACTIVE_LOW;

  /** 
   * @groupname spi_cfg_empspi
   * Time Master will hold SPI_CSN high until it sees SPI_INT continuously high for #timer_empspi_slave_hold_spi_int . 
   */
  rand bit[3:0] timer_empspi_master_hold_spi_csn = 3;

  /** 
   * @groupname spi_cfg_empspi
   * Time Slave will hold SPI_INT high until it sees SPI_CSN continuously high for #timer_empspi_master_hold_spi_csn . 
   */
  rand bit[3:0] timer_empspi_slave_hold_spi_int = 4;

  /** 
   * @groupname spi_cfg_empspi
   * Time after which Master asserts SPI_SSN after reset is applied  <br/>
   * It is in multiple of interface signal <a href="interfaces.html\#item_svt_spi_if_bus_clk"> bus_clk </a> . <br/>
   */
  rand bit[3:0] timer_empspi_master_assert_spi_ssn_after_reset = 1;

  /** 
   * @groupname spi_cfg_empspi
   * Time after which Slave asserts CLK_REQ after reset is applied  <br/>
   * It is in multiple of interface signal <a href="interfaces.html\#item_svt_spi_if_bus_clk"> bus_clk </a> . <br/>
   */
  rand bit[3:0] timer_empspi_slave_assert_clk_req_after_reset = 2;

  /** 
   * @groupname spi_cfg_empspi
   * Time after which Slave asserts SPI_INT after CLK_REQ is asserted  <br/>
   * It is in multiple of interface signal <a href="interfaces.html\#item_svt_spi_if_bus_clk"> bus_clk </a> . <br/>
   */
  rand bit[3:0] timer_empspi_slave_assert_spi_int_after_clk_req = 1;
/** @endcond */

  /**
   * @groupname spi_cfg_flash
   * Memory Configuration. This field is valid only when SPI is configured in
   * SPI_FLASH mode
   */
  svt_spi_mem_configuration spi_mem_cfg = null;

  /**
   * @groupname spi_cfg_std
   * Specifies the pattern value that must be driven continuously on Inactive <br/>
   * lane. Possible values supported are LINESTATE_0,LINESTATE_1 & LINESTATE_Z. <br/>
   * When LINESTATE_Z(High impedance) is selected oe_n port is de-asserted and for logical <br/>
   * values (LINESTATE_0,LINESTATE_1) oe_n port is asserted. <br/>
   * Default : LINESTATE_Z
   */
  svt_spi_types::linestate_value_enum pattern_during_electrical_idle = svt_spi_types::LINESTATE_Z;

  /**
   * @groupname spi_cfg_flash
   * Specifies the pattern value that must be driven on Slave IO Lane when the Data Window is Inactive. <br/>
   * Possible values supported are LINESTATE_0,LINESTATE_1,LINESTATE_Z and LINESTATE_UNKNOWN. <br/>
   * Default : LINESTATE_UNKNOWN
   */
  svt_spi_types::linestate_value_enum pattern_during_data_invalid_window = svt_spi_types::LINESTATE_UNKNOWN;

  /**
   * @groupname spi_cfg_flash
   * Enables 'Data Valid Window' while driving Slave ports. This drives High
   * Impedence when Data is in transition state to mimic actual delays. <br/>
   * Currently suported for SPI Flash Mode Only. <br/>
   * This is applicable when #enable_gate_delay_modeling is enabled. <br/>
   * Default : 0 (Disabled) <br/> 
   */ 
  bit enable_data_valid_window = 0;

  /**
   * @groupname spi_cfg_flash
   * Enables Set up and Hold time delay while driving ports. Currently suported for SPI Flash Mode Only. <br/>
   * It also enables checking timing parameters for violations. Error check <br/>
   * triggers when timing checks fail at Receiver. <br/> 
   * Default : 0 (Disabled) <br/> 
   */ 
  bit enable_gate_delay_modeling = 0;

  /**
   * @groupname spi_cfg_flash
   * Enables Modeling Board IO Propagation delay. <br/>
   * When enabled, Each Output port is driven with appropriate value after <br/>
   * delay specified using  delay parameter  t<port_name>_fly_by_delay_ns. <br/>
   * Since SPI Mostly works at MHz range, The delays are specified in ns <br/>
   * parameter. <br/>
   * Default : 0 (Disabled) <br/> 
   */ 
  bit enable_io_delay_modeling = 0;

  /**
   * Board output Propagation delay for SCLK Port in ns for Master mode.<br/> 
   * Default : 0 ns 
   */ 
  real tSCLK_fly_by_delay_ns = 0;

  /**
   * Board output Propagation delay for each MISO Port in ns for Slave mode.<br/> 
   * Default : 0 ns 
   */ 
  real tMISO_fly_by_delay_ns[`SVT_SPI_IO_WIDTH] = '{`SVT_SPI_IO_WIDTH{0}};

  /**
   * Board output Propagation delay for each MOSI Port in ns for Master mode.<br/> 
   * Default : 0 ns 
   */ 
  real tMOSI_fly_by_delay_ns[`SVT_SPI_IO_WIDTH] = '{`SVT_SPI_IO_WIDTH{0}};

  /**
   * Board output Propagation delay for SS_N Port in ns for Master mode.<br/> 
   * Default : 0 ns 
   */ 
  real tSS_N_fly_by_delay_ns = 0;

/** @cond PRIVATE */
  /**
   * Board output Propagation delay for Slave_Rdy Port in ns for Slave mode.<br/> 
   * Default : 0 ns 
   */ 
  real tSLAVE_RDY_fly_by_delay_ns = 0;
/** @endcond */

  /**
   * Board output Propagation delay for SPI Interrupt Port in ns.<br/> 
   * Default : 0 ns 
   */ 
  real tSPI_INTERRUPT_fly_by_delay_ns = 0;

  /**
   * Board output Propagation delay for hsb_n Port in ns for flash mode.<br/> 
   * Default : 0 ns 
   */ 
  real tHSB_N_fly_by_delay_ns = 0;

  /**
   * Board output Propagation delay for DQS Port in ns.<br/>
   * This is applicable only for Part Numbers where there is single DQS pin. <br/>
   * Default : 0 ns 
   */ 
  real tDQS_fly_by_delay_ns = 0;

  /**
   * Board output Propagation delay for DQS Port in ns.<br/> 
   * This is used for DQS multi port per device <br/>
   * Default : 0 ns 
   */ 
  real tDQS_arr_fly_by_delay_ns[`SVT_SPI_MAX_DQS_WIDTH] ='{`SVT_SPI_MAX_DQS_WIDTH{0}};

  /**
   * Board output Propagation delay for ECS Port in ns for Slave flash mode.<br/> 
   * Default : 0 ns 
   */ 
  real tECS_N_fly_by_delay_ns = 0;

  /**
   * Board output Propagation delay for dedicated Vpp Port in ns for Master flash mode.<br/> 
   * Default : 0 ns 
   */ 
  real tVPP_fly_by_delay_ns = 0; 

  /**
   * Board output Propagation delay for dedicated Hold_n Port in ns for Master flash mode.<br/> 
   * Default : 0 ns 
   */ 
  real tHOLD_N_fly_by_delay_ns = 0; 

  /**
   * Board output Propagation delay for dedicated write_protect_n Port in ns for Master flash mode.<br/> 
   * Default : 0 ns 
   */ 
  real tWRITE_PROTECT_N_fly_by_delay_ns = 0; 

  /**
   * Board output Propagation delay for Parallel I/O Port in ns.<br/> 
   * Default : 0 ns 
   */ 
  real tPARALLEL_IO_fly_by_delay_ns[`SVT_SPI_PIO_WIDTH] = '{`SVT_SPI_PIO_WIDTH{0}};

  /**
   * Controls how many data array elements are displayed in trace.
   * Defaults to '10', indicating display the first 10 elements. The supported values are:
   *  -  0  -- display all data array elements
   *  -  n  -- display the first n data array elements
   *  - -n  -- display the last  n data array elements
   *  .
   */
  int psdisplay_data_size = 10;

  /**
   * Controls how many control word array elements are displayed in trace.
   * Defaults to '10', indicating display the first 10 elements. The supported values are:
   *  -  0  -- display all control word array elements
   *  -  n  -- display the first n control word array elements
   *  - -n  -- display the last  n control word array elements
   *  .
   */
  int psdisplay_control_word_size = 10;

/** @cond PRIVATE */
  /** 
   * Enables/Disables the Baud Rate Checks for selected device configuration. <br/>
   * 0 : Baud Rate check is disabled <br/>
   * 1 : Baud Rate check is enabled
   */
  bit enable_baud_rate_check = 1;
/** @endcond */

  /**
   * @groupname spi_cfg_flash
   * Enables/Disables the unsed bytes reporting to analysis port. <br/>
   * 0 : Reports all bytes detected over data lanes <br/>
   * 1 : Reports only meaningful bytes <br/>
   * Ex: In APMEMORY when WRITE_MODE_REGISTER is decoded, only first byte is meaningful and rest are dont care. <br/>
   * Default Value: 0
   */
  bit disable_invalid_bytes_report = 0;
  
  /**
   * @groupname spi_cfg_std
   * Specifies the Minimum SPI Bus SCLK Period (Max Frequency in Mhz) in ns unit. <br/>
   * This parameter is compared against the observed sclk period at SPI Interface. <br/>
   * Default : 20 ns (50Mhz)
   */ 
  real min_spi_bus_sclk_period_ns = 20;

  /**
   * @groupname spi_cfg_std
   * Enables/Disables comparison of selected SPI Bus Maximum frequency against the sclk <br/>
   * period observed at SPI Interface. <br/>
   * Default Value: 1
   */ 
  bit enable_spi_bus_sclk_period_check = 1;

  /**
   * @groupname spi_cfg_std
   * Specifies the Minimum number of SPI half SCLK cycle delay between ss_n <br/>
   * assert and first sclk toggle. This parameter is compared against the observed<br/>
   * leading time at SPI Interface. <br/>
   * Default Value: 1
   */ 
  int min_leading_time = 1;

  /**
   * @groupname spi_cfg_std
   * Specifies the Minimum number of SPI half SCLK cycle delay between ss_n <br/>
   * assert and ss_n de-assert. This parameter is compared against the observed <br/>
   * idle time at SPI Interface. <br/>
   * Default Value: 2
   */ 
  int min_idle_time = 2;

  /**
   * @groupname spi_cfg_std
   * Enables/Disables comparison of leading time and idle time observed at SPI <br/>
   * Interface against min leading time and min idle time respectively expressed <br/>
   * in half sclk.  <br/>
   * When this bit is set to 0,  Checks logic evaluates on the basis of absolute <br/>
   * time observed at SPI interface. Absolute time ensures that asynchronous ss_n  <br/>
   * assertion w.r.t. first sclk meets timing requirements as per the SP specification <br/>
   * Default Value: 0
   */ 
  bit enable_event_based_timing_check = 0;

  /** 
   * @groupname spi_cfg_std
   * Disable Clock duration Checks when Clock is paused by greater than #min_spi_bus_sclk_pause_multiple_factor. <br/>
   * When Clock is paused by less than #min_spi_bus_sclk_pause_multiple_factor, even if #disable_spi_bus_sclk_pulse_check_upon_sclk_pause = 1 or 0, 
   * clock duration checks/baud rate check will not be disabled. Checks will be disabled only if: <br/>
   * a) Clock is paused by greater than #min_spi_bus_sclk_pause_multiple_factor, and b) #disable_spi_bus_sclk_pulse_check_upon_sclk_pause = 1 <br/>
   * Default Value: 0
   */
  bit disable_spi_bus_sclk_pulse_check_upon_sclk_pause = 0;

  /** 
   * @groupname spi_cfg_std
   * It specifies the #factor of bus clock period by which when the SCLK is paused, the checks shouldn't get triggered if: ( #factor*(bus_clk_time_period) < SCLK_pause_period ) . <br/>  
   * This is applicable when configuration parameter #disable_spi_bus_sclk_pulse_check_upon_sclk_pause is set to 1. <br/>
   * Default Value: 4. <br/>
   * So, by default if SLCK pause time exceeds 4 bus clock cycles, clock duration/baud rate checks will not get triggered if #disable_spi_bus_sclk_pulse_check_upon_sclk_pause = 1. <br/>
   * But if SCLK pause time is less than 4 bus clock cycles, the checks will get triggered  <br/>
   * Default Value: 4
   */
  int min_spi_bus_sclk_pause_multiple_factor = 4;

  /**
   * Minimum JEDEC Hardware Reset Assert CS Low Time
   */ 
  int jedec_hw_reset_cs_low_time_min_ns = 50;

  /**
   * Maximum JEDEC Hardware Reset Assert CS Low Time
   */ 
  int jedec_hw_reset_cs_low_time_max_ns = 200;

  /** Specifies the delay for sampling asynchronous signals during idle state. */
  int sample_async_signal_delay_during_idle_state = 1;

  /**
   * @groupname spi_cfg_std
   * Controls the level of entries (or above) at which the receive FIFO is assumed full and <br/>
   * Slave device communicates its inability to receive further Data by de-asserting <a href="interfaces.html\#item_svt_spi_if_slave_rdy"> slave_rdy </a>. <br/>
   * Slave's Flush service needs to be called upon to empty the receive buffer * <br/>
   * and asserts the slave_rdy to continue the data transfer.
   */
  int rx_buffer_threshold = 10;

  /**
   * @groupname spi_cfg_std
   * This field specifies whether slave_rdy Pin to be asserted as Active High or Low. <br/>
   * Default : svt_spi_types::ACTIVE_LOW <br/> 
   */ 
  svt_spi_types::active_mode_enum slave_rdy_polarity = svt_spi_types::ACTIVE_LOW;

  /**
   * @groupname spi_cfg_std
   * Enables/Disables Slave Ready Feature in the Master or Slave Mode. <br/>
   * Default Value: 0
   */
  bit enable_slave_rdy_feature = 0;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE SCLK Leading Time in ns unit. <br/>
   * This parameter is compared against the observed Enable Lead at SPI Interface. <br/>
   * Default : 40 ns
   */ 
  real spi_safe_sclk_enable_lead_time_ns = 40;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE SCLK Leading Time when SS_N is in de-asserted State in ns unit. <br/>
   * This parameter is compared against the observed Disable Lead at SPI Interface. <br/>
   * Default : 10 ns
   */ 
  real spi_safe_sclk_disable_lead_time_ns = 10;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE SCLK Lagging/Trailing Time in ns unit. <br/>
   * This parameter is compared against the observed Enable Lag at SPI Interface. <br/>
   * Default : 20 ns
   */ 
  real spi_safe_sclk_enable_lag_time_ns = 20;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE SCLK Lagging/Trailing Time when SS_N is in de-asserted State in ns unit. <br/>
   * This parameter is compared against the observed Disable Lag at SPI Interface. <br/>
   * Default : 10 ns
   */ 
  real spi_safe_sclk_disable_lag_time_ns = 10;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE SCLK High Time in ns unit. <br/>
   * This parameter is compared against the observed sclk high time at SPI Interface. <br/>
   * Default : 40 ns 
   */ 
  real spi_safe_sclk_high_time_ns = 40;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE SCLK Low Time in ns unit. <br/>
   * This parameter is compared against the observed sclk low time at SPI Interface. <br/>
   * Default : 40 ns 
   */ 
  real spi_safe_sclk_low_time_ns = 40;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum Duration in ns for which Slave Select must be deasserted in between Two sequences. <br/>
   * This parameter is applicable for svt_spi_types::OUT_OF_FRAME only <br/
   * This parameter is compared against the observed Sequential Transfer Delay at SPI Interface. <br/>
   */ 
  real spi_safe_OutOfFrame_sequential_transfer_delay_time_ns = 700;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum Duration in ns for which Slave Select must be deasserted in between Two sequences. <br/>
   * This parameter is applicable for svt_spi_types::IN_FRAME only <br/
   * This parameter is compared against the observed Sequential Transfer Delay at SPI Interface. <br/>
   */ 
  real spi_safe_InFrame_sequential_transfer_delay_time_ns = 200;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE MOSI Data Setup Duration with respect to SCLK in ns <br/>
   */ 
  real spi_safe_mosi_data_setup_min_time_ns = 10;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Maximum SPI SAFE MOSI Data Setup Duration with respect to SCLK in ns <br/>
   */ 
  real spi_safe_mosi_data_setup_max_time_ns = 20;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE MOSI Data Hold Duration with respect to SCLK in ns <br/>
   */ 
  real spi_safe_mosi_data_hold_min_time_ns = 20;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Maximum SPI SAFE MOSI Data Hold Duration with respect to SCLK in ns <br/>
   */ 
  real spi_safe_mosi_data_hold_max_time_ns = 30;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE SCLK transmit edge to MISO Data Valid Time in ns <br/>
   */ 
  real spi_safe_min_sclk_tx_edge_to_miso_data_valid_time_ns = 20;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Maximum SPI SAFE SCLK transmit edge to MISO Data Valid Time in ns <br/>
   */ 
  real spi_safe_max_sclk_tx_edge_to_miso_data_valid_time_ns = 30;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Maximum SPI SAFE SS_N assert to MISO Data Valid Time in ns <br/>
   * This is applicable when svt_spi_configuration::spi_safe_frame_mode is set to svt_spi_types::OUT_OF_FRAME.
   */ 
  real spi_safe_max_ss_n_assert_to_miso_data_valid_time_ns = 40;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Minimum SPI SAFE MISO Disable Lag time after SS_N de-assert in ns <br/>
   */ 
  real spi_safe_miso_data_disable_lag_min_time_ns = 50;

  /**
   * @groupname spi_cfg_safespi
   * Specifies the Maximum SPI SAFE MISO Disable Lag time after SS_N de-assert in ns <br/>
   */ 
  real spi_safe_miso_data_disable_lag_max_time_ns = 50;

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
    slave_id < `SVT_SPI_MAX_NUM_SLAVES;
    master_id < `SVT_SPI_MAX_NUM_MASTERS;
    default_slave < `SVT_SPI_MAX_NUM_SLAVES;
    default_master < `SVT_SPI_MAX_NUM_MASTERS;
    if(frame_format == svt_spi_types::SPI_EMPSPI)
      spi_feature == svt_spi_types::SPI;
  }
  
  constraint valid_bit_endianness {
    if (frame_format == svt_spi_types::SPI_FLASH || frame_format == svt_spi_types::SPI_SAFE)
      bit_endianness == svt_spi_types::BIG_ENDIAN;
  }
  
  constraint valid_byte_endianness {
    if (frame_format == svt_spi_types::SPI_FLASH || frame_format == svt_spi_types::SPI_SAFE)
      byte_endianness == svt_spi_types::BIG_ENDIAN;
  }
  
  constraint valid_payload_word_size {
    if (frame_format == svt_spi_types::SPI_FLASH || frame_format == svt_spi_types::SPI_SAFE)
      payload_word_size == svt_spi_types::SPI_8B;
    else if (frame_format == svt_spi_types::SPI_STD && spi_feature == svt_spi_types::UWIRE)
      payload_word_size == svt_spi_types::SPI_8B;
  }
  
  constraint reasonable_flash_timer_scale_down_factor {
    if (frame_format == svt_spi_types::SPI_FLASH)
      flash_timer_scale_down_factor == 1000;
    else 
      flash_timer_scale_down_factor == 1;
  }

  constraint reasonable_operation_mode {
    if (frame_format == svt_spi_types::SPI_FLASH)
      operation_mode inside {svt_spi_types::SPI_MODE_0,svt_spi_types::SPI_MODE_3};
    else if (frame_format == svt_spi_types::SPI_STD && spi_feature == svt_spi_types::UWIRE)
      operation_mode == svt_spi_types::SPI_MODE_0;
    else if (frame_format == svt_spi_types::SPI_STD && spi_feature == svt_spi_types::SSP)
      operation_mode == svt_spi_types::SPI_MODE_1;
    else if (frame_format == svt_spi_types::SPI_SAFE && spi_safe_frame_mode == svt_spi_types::IN_FRAME)
      operation_mode == svt_spi_types::SPI_MODE_1;
    else if (frame_format == svt_spi_types::SPI_SAFE && spi_safe_frame_mode == svt_spi_types::OUT_OF_FRAME)
      operation_mode == svt_spi_types::SPI_MODE_0;
`ifdef SPI_FLASH_FORCE_SPI_MODE_0
    operation_mode == svt_spi_types::SPI_MODE_0;
`endif
  }

  constraint valid_uwire_busy_timer {
    if (frame_format == svt_spi_types::SPI_STD && spi_feature == svt_spi_types::UWIRE)
      uwire_busy_timer inside {[1:`SVT_SPI_UWIRE_MAX_BUSY_TIMER]};
    else
      uwire_busy_timer == 0;
  }

  constraint reasonable_spi_safe_slave_select_size {
    if(frame_format == svt_spi_types::SPI_SAFE) 
      spi_safe_slave_select_size == 2;
    else
      spi_safe_slave_select_size == 0;
  }

  constraint reasonable_spi_safe_sensor_address_size {
    if(frame_format == svt_spi_types::SPI_SAFE) 
      spi_safe_sensor_address_size == 3;
    else
      spi_safe_sensor_address_size == 0;
  }

  constraint reasonable_spi_safe_address_size {
    if(frame_format == svt_spi_types::SPI_SAFE) {
      if(spi_safe_frame_mode == svt_spi_types::IN_FRAME)
        spi_safe_address_size == 5;
      else
        spi_safe_address_size == 10;
    }
    else
      spi_safe_address_size == 0;
  }

  constraint reasonable_spi_safe_crc_size {
    if(frame_format == svt_spi_types::SPI_SAFE)
      spi_safe_crc_size == 3;
    else
      spi_safe_crc_size == 0;
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_configuration)
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
  extern function new(string name = "svt_spi_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_configuration)
    `svt_field_object(spi_mem_cfg,`SVT_ALL_ON|`SVT_DEEP|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_UVM_NOPACK, `SVT_HOW_DEEP)
  `svt_data_member_end(svt_spi_configuration)
 
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
   * Allocates a new object of type svt_spi_configuration.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

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
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs.
   *
   * @param rhs Object to be compared against.
   * @param comparer `SVT_XVM(comparer) instance used to accomplish the compare.
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
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
`else
  // ----------------------------------------------------------------------------
  /**
   * Packs object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_pack (`SVT_XVM(packer) packer);

  // ----------------------------------------------------------------------------
  /**
   * Unpacks object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_unpack (`SVT_XVM(packer) packer);
`endif

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /** 
   * This function defines the print task for svt_spi_configuration class.
   */
  extern function void do_print(`SVT_XVM(printer) printer);
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
  `vmm_typename(svt_spi_configuration)
  `vmm_class_factory(svt_spi_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
KKUBS79Z#Z6?I;FR/0)+F^\b:@@.dd6#.PJVF&G,B2P<(=:bD,YY1)QO0?YP#BND
YY__=JN+;#\#]K=5Rd:ab,IgVWI;LdL5][VHP]S[\].MQ@bDHB&J[#+[@,(^Hf?Y
eS\Tc5S.&JKE.4_89/#35B-GQZ[G\4+#SbP:+94M7C]+V^CIaHc?bMZg\f(A&<\2
V,bg-a1K]3B#[P@3]8O5Nb_D,g)^1=;5-A;4GW1+9N\1d?VWMUa/Q;U^AIR2UVeY
A,/_[=T0RP03W2CTM_4Y<BY?;H]\JS.B.Tg[^(Q\gBe@ZAY>H+DWUe=5QX1MSGEU
&c:VV-QRD15MW01ON;B240dX[7?WE)gS8d(=fa/IB=4QE]JBMHcZ.98d0:&THLfB
(_I,2SA//.).e6&RJ@fM#L850KM/CS[gZ7M+H6Z9A1RH36>,14L(P/;CQV>3C_@4
dUR=bBVUJYLGa4Vc,OV7A2;>?6_YU_ZGYQaVT?8X-GEMDR._P7g1EBdb_??c^bVN
He?dSF@+bYRWa^60A&X;C/U5T(eOZHL_W-UM;UN^#cDa^;231BKZL@f[WJKCL(54
L1fZ@SdF./&[#0<I6e]P@DH?860CGRDL/^b8MXPIJ[6S+K&24C04?8HUUQb_Eac8
;ZdYBVAgdD,d,=ZJO5Q/UO<YA9.b;/e/Y\]5H<Hf/,2.YZM-[WT0TdK6,:AR:(QZ
(8O.CHC0.XXd=EX?(Pd)[=2\OBVe(:gZgb/8;U8D12[[4DeAbgf.T(K6L$
`endprotected


//vcs_vip_protect
`protected
C5XWMF9#/2XI?gK)P&TX;DZM?;2cTD^L)+6<7SOaa.2g+#]@\H\,/(L[,DMHG3)9
[QQNE0Y)LC=>[+Q?,f^P295P+a?b0E<eE@.eSbA/^P<@3Q:DY>4.=+IZ&dN736f6
H.?eg,^ZfUA3SKF;<2Sb;6W[ee5OVE1E1<@.,:>+,JQ?0<02aW&&,6>Agg0G\\&^
-KX[:RLaKOMXcJcZ9K]K;;YIX(QFZFDA3JT.e13gUg/]MW@4Z:LHF^S?eNHK8YNe
4=/R.DMFUW>JF/a>/D=Q5<3XKXd#+Q(2]Ve)8[\_85F>C76JSE;g6]6^_e\U+XZ[
P7aNS;SQK)OaMad:&AP@Dd)Z6Sf<&0MQLK_aF7^17PZ#T?O95HX]7)4VHQ^80PKS
;/3LG.I5Pe<NU\TJ;JLUL^fdBe<H_aFMQNUd:H7N,4d&S8YSFR.gDM>^S[V(F8fZ
Y>B=4(C1aO?bDQ<1SP4#(eBcd/B[MbZ0bT+?1=,A<fLU;0BP+46-&22=,/SQadHQ
dK1[f\0H,/OM9S7#(/@U-bCYW21^#\6J/f7cI&84&)]B3cHR9-]94b.GVJVWf<<5
@IYKgAf/<8<@SJ2C=Z\ZP>FJW@EF?cb59IT.<3ZZ4)2PZGE?](eA+_M+S_T/@C1;
HMbV^L>F2IAA=(UUY4bC/UT^7O@=N#8daU/UVH6?Fe\gE>OPQ,eF2OY2L[&gVFOa
Z[^4\;2M-,.DG#1Rc,DKMHU^4+F1d-1Y(]+GCHVc=f<AAAIISc@/\Q;;LHb=/X#0
_B/SCG64bR7L6a:;@D.<1R&0CY.8KW7G8(CWY<R+6.L]1e#.B#5O\RAWL\@32.?f
LE,^56IP<)/f\2QZ&=3RNDS,/^-E@I3P.Hc(97-+f7]?U[O^;8UG9cKE-X;XBD)G
gP>KMcNb<Q.5dO4f5cc82ac:QB9[#.c29W&6?f62_eYReXACAK+GPOR)KMFD6.L]
_>>IZ4^X6Q?V\[5H?GUB:)RbScMP8>[[@;\IU4RJfe4,]fE@=U05(I/F>ZgdcU-R
?_07@EMaK1-W:_72ae3+R-6I)d88fBd,-2AXKI:eW\)&(^FN->3;^;<B]YKTX]OR
6/5PHUAf1RUS56&bD_7@#MF6L;U^8cT1Y&47V/9UT4^,fUOI_;BOdc#;)Yf5:^S9
TdfRBg)OFV9,?C^dT5b,3;)PLHG?^-)RTF#<C<>.QB6O\D6g5&31Ra)If)9H/\;N
<7[^+U8,7K)da5J:X^TBUGY>#XV^5V5(]_/H=1T8ae/]WL,>#-AI<4T^XM:F_V/S
_DS,\)/_)BFSIK+A++R(0fB5gI0)?I,PQIR@Ma/>Z-NFaCQ@F/X=ce_H:RCYS0H>
e+E6a6Y[YO6UT)e,[LEL^[)M.7;4eLRLOD\Z\XXNTHNK7>2eDD:-];;,+,FEY6;@
,RJ8PKcB4.<0E[);<<RO_TE,>E?[MA5+9Uf<OUY<F\[U#P3RL]:^R&Cf<+5fX+V.
0PGC-,3=Q8FC1<MR]6LFGRMYTe=Nb0d_B5MC1PGN25WK0>FTHU8d\ES<bb3XIS)P
cSG<_RH-ZRPI].YE=8V\3Cd?V2G(CfFM>Ya\<&bA@,;^bR,1EVRae,MFU+B+>B[9
39&UeT3C<EJ,;<FbFf,.(&MO,0V.TaS=2SHDW2#PCVLF1cJNR2g^N\<5N6KG<N,,
<KE2JQ+\UH7>DgKGR+518J_H6_/f.0R-HY@@(dUOLaQ@EQPC#MNW)8<Dg&I58O/C
@5QWR&LHfZM:XQX;Ra?_e&H6-AXfA0Q6199g^X^3aC)ED]_=GCd9_M])Q7574\?X
+a1=CaXTf/:OY5/>?B[(;(G;4FYc-P^KVU<G1b)B)OO\;WA0ZL3eM0#SeM?.\4\3
@5?5A3-Q<MWQaLWK]V\PU]/4Y8S_@[ag?RXB1T-4(OZ^]X.J/=]_/YBa_J\&0[[^
11FMaJ#W4NO7eR3b#PH<[MA12;<@e0f80=F;7YTLdHQb<YBKT-BVTKM8H:7MU)Fc
-/U<5+PWSD?=CgQ-B]XGPW5a++F:RR><MARVD9K=1UR9P63-gce7Ya,@;5d39&>5
V/EW5=7]ce.FV+a@<]RRS)5RJI>4?<SYC+H6>aGVQ(;R0g2C5;8G5VQO.=\<5:YG
)MJIIVC&=,UUI83?/\1Y\5eed+Kf+fW/9:ON;+Z@B-e@9(W_[J.J<-C#d.5bg-]2
&SN-1Sg2.g_;+U3QY9#AfI0<OOgER5?RS\1S0?N9eXadIQc=TQ8Y>AVGKVdL0/@.
JgG,W,IC8ABAb^BLFUEBTU4?.?X0A<aP(VJHAG4F7F&8_X]\V(eMGYEG5(XHEcQP
?6E+6bQE/MJD:/a/@OS4B)#7)6fJ[gZML0K[U.=7dQ^.dV(dCVT16&W-TMYD&VE<
O^P93NM=EK+D;U2O[NOIa7NUdeceBIF<bJ@cK]VYBM[Ta,J1?KgVD6@B2Y+[bOSG
,14G17\:R<aO>PXYI[,dg4XL/47X94H?5>a#Ng2[fN>ffJPM6M=0TL7O.JgPF-9P
/FA1I3P1K73+.:fJ=/Zb@L.\RGEJeBb<;SWF0YA?+CTdJU-1NG?:B3EYZb8NV9&)
[5HO]gTZX+>+KS-gU]0(?H0E#/eRU_GFgUcRFN_PC?@W\U5\5.)+2L/[dS/29Z1^
,)NYM]5@3ZUgO4D)Y:,aOTHKYW/S[d_XIKVU>O\\?KBNH2Z)R=#W,K6bbWXT>baN
>HV1FO77ORCcT2Vc7M\I/^XYY)GXW01KZDHO9b89FF)MY5VH@OS0;&T[eC6#Kca,
3UW)/)2BfIVZ?)CZ-d<E\X)@@QI_T.E,#L7YV#K-;Q?N57DU]Vc8C<f/G?#;57<T
_6Xf,/fDNEgU7@?f1b8bAXF6_0Zd>4]GUNE:1J0Z[Nfb-(\c1[NT69[@A;5ACcMX
H^;K:?\CN^B6U/@U;/N0Lc/2#,6aZG/(]VZ\./_3&aOR<RF+@X_K8-HKX<MFRd3X
,6@T.0J&ce]=S.d+-O^&#\dZ)gEDAg(IO7fG_?+#L7LdXVUG/?B#dMgUUc]:Wb91
]VZ_0=?P7YJecfaE\@=^\;?]\0?EXaE)_@/UC57.4249RX5^?O5[MR/>Z1]W2B&J
B4Gc^-fHJW2-E7<HcVY+<;)STJ)?@2+Xa<b80HG#WO.GQGM96=^KX^]F<LRG2H?P
Cb_\?VCEC.KJ]L4Ub7S=1J5]B<-Z@+?_W\G_\XR;GOI;]?fT5(a8M32[DLHE1+5N
4U&a1@,NYcEB[U+TR095EE4T,6f5#/U/_:75N=EbGfQ(?aP3N8^AA7S&F.>PG,H4
B]0+;SYK:SBIBBcaM]W#0J;PcB2M9:A<G]9)W<POSJT7fVM_aV[6?2K@[+<5<cN@
a-3EY5T2A+B[(dT^BHG#2^\3G?f_TY+SY=]eYQM?ScJ5PQ7/]+c(>HSf@(TIK/TV
5:UFQJZSMY5=Z#I+g,dWb#3,)#=S>ab-?08W[1cE<MaT]ISO116CF40HF_@aJ4B&
BfPIbO5+=/-]1WT71TGBNaI9Dd#?HLa0O/A?GN+9<^L-+CcOC#\a35VA@SaC\=;N
A699FPPa^\X_1MP<GNP&YfS)U?D5&dUHH9/[UON<Q56B@OD&);X4IU-=f#);2gf9
VH>>#Ig7T3PW62M7H2F/6(DXOd]e44:R1.(7JHTP#PA>=Kc,1.E[1SJNOYCFCWGG
ZV-O1.b.)_>E^5ZDR7=[4c;(e,AB4TR4&16HH@2^Sc<+X-5dABP,KZ2IZ<C0Q6\F
C2U00JN>^&<gW1BT8FcU@GDa<4eGMR2W:PgS:/M99eI68\4>1/\#:OEO0=FTMKd)
[]@dMS.7cE#]8>.Nb(:4C9#))@8^>0Q-ZY[a-A+U=ZO[_IA^bD#7MFg52)];92_.
)__dNOOd.XP5T_]41_?#X4fUGP34_^T(H(J;3)=>70BRJD5aOe<?O)4HbLB<2].E
.JfZ0JYE((1=abYSfP_^aE=;O9B7Fc(C&8CA[QCcX7^XLT1>J>44f@M@OC5eHO[U
(==Tga9Gdd,Ie4SQ4bID89e7U8M-3cI&WcWQ2[0\_\dNVd(UM8?J_K:D0E0QdG/Y
e3[D.PN<N=>Z7,5S2Y=2Ug6FZ7BaY\>A-GE7_c=G5?3Y4ZGP#POQf/L,Z7NQ+Cg>
FK&?3<)E0#:A/6Z\J01R<X9@5gBKDM,Le&<V8/cB](S<YOYE6Z=^84)?@5?bS<2/
E,&;c&PQ)cT@Q\MLIb[7EfSO+Lc0\I&9JTX?]&XQ#_98=@UP7+UI2J+7YIZVROb@
/ad/b8).80#<e&Y4b/6F8D6,.J8>R\)^AG(=dA,K:>Z=aZMd,<Nb].Nbg(d^-f&B
6BU<M=fSQA=-#P2SI=B]G\U78fVXY#VaRg1[G8Y7?4-X]7VZ1gE9T1(0KTM1#\6P
?XA)HHHC7TXHO(fHda9KbIU=J,dYI)),JHg;^Y@U?J/4.EMTSSD+6D1.YEB[<eF@
GYOEY)]_PXAg7FBV//bd-QeZ</\.TP_Ogd\(6XaPG]>Jf3.,7C?ATP<YUdM=4Y8@
WNK,7MU)IJX4SGcQb(.===Y)eI@[GLB;^c\RadHCMM6d&Z()PIJ.50D^CD0bWcPZ
1,/HGAD[8Xa6Z-Q.Rc?bQ3KP<gEB@:A?1D_.BA/2NB=@KAR/S#89(R+QP67^-Pf-
#;WGB-g>6]5LR+/H(&Y>-7N6L^^6,4PNQJ/CafOIc]#bV_(<Kc+G\P,)/WcEU^A9
_@9],7<2T.V(Jg#T2,7c5NG_9NfLV-_YKMYD2[:eT:YMTDN?04OL+b(<Q8F)YG9E
T42RR0Z\6FfS6CAaKR\\LS@O;>)>\<e,HFH8JP6>4(36ZPHZS1>XTRd;>Q_Gd8NW
^D3SGC8_BOGM..@D?f#G:Z;\>,?4]_UJ>3(8LRLd2X_2M3PVe:2#8TLc9^(2GCNE
@XI5KH;f^JVY8ZJX5#S8cHB)U8R3P=c;].4BV\HV7N:gHF&ATD^:OSZ]<e8AJ/9H
8Y@U?cT&aT9@YRN+?STHdFW^KM\),Q0UV_(6YVLb]c-5)CW2H\&/#dcOHaUCc.CS
b=[Y#PR@?Q#@[6af<C\8YR.)b/@3577NSZ16?6NgbDe9ff0g.?a33^^(,U@Cgc.+
_>)D0ND;[gLe?fdcP-dMMMVOA4L:#.[+=S;>=]6I;HPa)X>3ZR+WVKIDIP2F#OWG
Y(@TfLZKBdaNFKV)d21_3Z9VQ[P+1Wg6O[WAI9C>5JD>_BGW#]E/D4Q9=DR;A04.
@2aH=(]X&8IZY-WK&Aa\3MUc&\GHHOa,QUL4\O1L&(\TOZYA.gXLKZ^Z)NJ@QU<@
&_O.#\@YWB.T+H]O)1J>.E<QcXPZ16;,P4Q#=bON5,_X9e&7WE=L,\42[]G_N[D7
7=eLZ90f)SM=4U25I\E450f#(;YD4F9JVbM6V8?04ON<1S@Z:#2Z4.DRC8ESYR=K
3ZC9RBA\4CT:gHf;(BYP6]2K](0+5J3H5SQg)dW3+;<>B3?J4e/I43g7FbPb#&f-
G[^;Xb=?MP^Ng-1_AGJ/);L+Rf876S>e0I9Wd5BfAS-Q_[A^f4==MXQ6J.8A,]a0
3D^Ib_0;Z5KFM(R9G4XN/c)&^)#SS=42eKU.XJ^Y7S66G&/ER?BY0bZ9>4fAA^3M
SO(A&aXZ)d>FYa/bH/5?/R/9/-^d-)&4?R=31O?cg>d].#@:_L8/](XVcKP1aA>P
FA@Z,1>L)_\0G?]EN9DNce0(KZ1beZ^0eWWF8g9\f]P)8?VW6YJbBL)I<PePWge>
.87TO4O=b)d=fFU@7HK6#2G&9W>==O;5^EF:62YRY-#OQKJ;SZZN]eHK))?OE)@.
>FL8Ba56D,L3K]3\W?.B0YKLAe2DZW,7C.?[EaA.g-92H&I(T,=:&B=:\^HBCWI[
LF2N)9FbHN]8Hc>)4NgA9N09_6&3&@=D[0<=--^WHK63E/>[gI^0GZ]T.aY<Bd/Y
;S5?D\44;BYa]]a/9^W,O3VC>F-G]J]-C]Hf&)W4Z7[\GA7)D0gf<f-d+c7YQK>D
@Ob_gDB4VTPH_6P7+U4LG[6&)Ye)=gE17]/QVeM6\Rc&7+[gS[9d^T@V2BG)<[J>
LdR_-4:1>,L4:Oc1/-aZ?:Y;.G_39fE7WJaD:SA(^\S\T1W8g&_>ZO>6L<IGPBK:
e/(a0gO)/6M^2dT@9+f.2<0(WdDLc5dZ2/GgCANa>2B:K=e;S]Hc.@\USQN_2ORZ
dKGA3KaJIF.V9G][A3F:aH+.Md+YTc.+R4.T0YU<@)E/:NL\e^[CaI=.U;+,)(J[
GC@PN.E-W<a=e.KNJ/GJ/W:g(.9Ie,KaI8ZC70DDX.[Z;_^G#,1^GYOKZ0E1=8W0
D]L/2J[48H-@_QWDZB_@-eJD[Jd.KW<OCU)6MT+UfEA1S7UT3I)KKSVD.>71&-gW
:KYRRG=c77BB(Ve\&a;(_;8-ICY)b-8R4GWg>HED5+RLMa;fJ-B.ga=OeM^R15gF
\+Z58T4Ne8]2==Ifd\B+^I[S)4N4GAge?#W+4)]4A.\M6=E1WV/;+e;V/ECCNUI<
8B[0Gg@[72?\LT(#9We3-9cE]>b:@-<b]3,K4NPeWb0FY=ME.2b(A:0I.9WCC<6O
H/D62F>9JET^10GfF.5)F(N]P27>DNeJLF0L/e2KfB;Q\;6Hg2?0I3L[SC&C1cMb
=K/U4[)^OT;1QBHF9:3S0W>OFCc[1S>b9=9-d@O,Q/TO_?Y[V#IM7=_@ZdeE_L3Z
=X7_Me_TRY^@T/JdY=-T_AR^4>>_&?La2]cE<-[DO)SDEMV7c?0/V]\7;<LMGN.?
d(+TG=eW0bV[E]@dIg^@Eb;I+#a-,_XY^-)^g[eE5bR/O9FbHdV410cRge2AN2F5
SY6&5OO@dM2dLAefZHIBa<B1RL8a^A2BBTY;\I<gWb&d3@I7cMfY32TE87Q2LIMQ
aR;XcI(ANPI0+[&J874GXe>U;C0]SOQV2>gc&BcMZZ3HJ:C[fX5f\7_<:8/LEDc:
<8.>f4@E2:=e=6XNf9cV1fI90=)15YCdKA7SJ;eAgNbUXbK1[A7?VQa7<gNFLT[R
CaT7\=.L5[[.&45^0d&VF?gQ&f\T[8XP/R^KYgN7g4BE;]-1Nb=-SK-+(JYZS=5R
]L0D=4#d544<JYS>GB&]Wa\U1ZO&94/^ELE9db:dDX>].[X:YdF75>_GS?K>0IbT
MNbMbbB-/68T6-6bVU-^S;8R9S(?N1H_<HIT52\XHLWD2,edfB@P9>>#(Y::9JVK
DF<..8?#M0gX04YMU[FV>&TY)W1ZE0+.:c;6gC0[DR0(-8e>;K3X4EW/9eNZ,(Ed
7ce+WgA9A&EH-K=S[gJ:bU#]UERM+eDb7@VX-?b7R>JJJ51Ne?BD\^>VW0KceS&J
eXD,7M@(NcR42Z]XR/;1+FPe4cfB_[S_W_HD#e.()I,Q;AaTE1IFaQ\BQ9AOM&)Q
XBGf)J@&SO#R4:Y8PSdSRS]BHI-,]NH6G)(],e1N_D(^\GV@=\R4+?BQP.YH-RIe
=<(02MCdRc0TVZPK0FB-T]&62YV_)DFKO3[B2]XH2MZA4b6?a9.IT[<Q5YRRP&4b
UU);T-c-S[&-e+e=KLTYWKb>b4a8D4_A-a1TF:,YdG^(]+SLC0856X&HVT9/_W]5
_BLIF3M#C<_f5AFMB@aWH,7QF7=IfUNFfKPNg.b^EI;?ASW.b\-+EN+V)D-_&f<X
DQR+g6ScV:BJ;Kf6>_CA9dJSY7#_Sf5+\T]LM4>c\<L+)JB4Q=fMWBgN2S>Z/DaG
Z2M;[NO&7&N?[RgNGZ6AV=;@QX]VgOa]YGTMe:;278V8f9efdITOR[d,c?Oc?YO>
a/=YU@=C<(RU&O?8T_S>U[@D&f5_e-Q7?;4OD5Ab@d>?Y8>.5T6O7N[fBL/A+QWN
cRY@eB3<H6ea0YRd@DO>aA7QD@D[RR/8J[5E6OZ=0Y4]4)..W:YTH5,ZL2<+97,S
(HGWDSgAgJ,G+N&:KJ2^?]&M)ZDG-(8E2.8>=K(+4:UO=SEa-4_g@bD#>]LVJ+M,
1K+MN,<<=0&(=B?83+<OP9]NaZF<S+Tb1/0YN[LWC_V9^[:B@&=8I_gc)FD2NPHQ
IJfP5Sa16FY.];C;d/K8_)CXTcJLVCW4O3B&BP^;dI(-94-/_GR7F7=7C1eQeU^Z
M@LM67?K\G/dKSQf=<K[gB+gIG5L7CRB2YL^0W<V^.4+;D6QSG6<^J10\G9,IOKC
-Q>+4D#>Y>V9AGNa+bJZZJ1:@1Z]ZU22R<[<+gacBb]6_9PaM2V.509@U,d3I)-I
LS[@FF6K[Geg&&aW0Tg-F#/2\c9-eeD1>G<Leeb.(W=:5D=U+1^=X8:;<A,Z]RFe
Lb;\E7DXR4>LSRGRE<O-8V;-&L^=1WNVG4F5-MIc-PHE2DZ/06-[0CeYQc(gVa>f
JPES(KD6F\6CH@BV>/dWF(P/Q[Oc2<+U[+-6SaA:@O1I\K>4WL.-,J)85c=Cd,Hg
^Z.P?Gea(3HH&Vf,:<f],dg=0W_1#cD2>MP]4@8G>X.XA3955cfV]C^[F9..0bUa
[Dd>e3cAO.-IcMKKNI@8Q2e^E]J-PZ<:.5/]+c[UU&K]\6C_1+Zb.H]SXS3e]?3e
dJ+XU<3;I[Z<>4:8g(HF7)@D0R=((:FdT,7LTbT;O+[S5bKZ@SVE&[HY@+QD,45G
G2AO0[&R)CKBfHFYM+K.C.6cGMD70@A2b#2T=g:=Z4&IgAT9YF:A/,N-5T#e4J=Y
;278\()PE5X\T<&EXaBg^Ea)#7Z#g6^\fQAdPT5<41I0E3PVe1AE5eL4@4)H==)7
5/&,bca\HL8)YcG@W3RH,IEFHJ=0Ne^d/B^Ea=,KZf:#1]@SJHZV0@=M8b8e/;3g
D9=@@KfVER@f@LB<0,F^TP<U>L<T@g:R7A#QX(5OE[SJJV9[^cQ7L:]:-afB[RF<
#Q33FIOTO^_7[,KVR^80N.MTHL9-Lc\37B/B&BDE;.egFQK:]K-b=PP.E9BJ/&4b
[-^Z6HV3eGCW30=af#LUf&92b8F[+4a\;gVP[^ZYN_\Nd?a^7IOOFPH[C,(1\+J0
+G_4,ZZK0BTNb.aTH:<2[6B>L5?cD3SdeF?<3D/\/@([_XaV+LS;AfM;^Hd=+F_,
KIfV#F4,5AY2>)I93?),6(,8b7R+f)GZ1Q?)S<LYQ\_L+4CfB8&T:SGd&55/Ke+3
+B]0IKS&IWd;eSHgG0)Y;eJ1CRCb5V1XUMOCE9PcR>@4D23_ZVNZ7\[XAaALC:M1
]>Fc:Z&Bc.aL(0?UWDX-JPDNUB&I>51YMDVN?LYZbAKQA7ICW&][BTC1LFBd2LJD
.W1>LMeK[c7ed72[6bU@U;IIU,_?4IEIZ.>@S4PIBHWB1W4LVc)3W6VQY/B73O:1
5Y2Wag1UaT4[2R_@PEe72:3AVNKc),>g=e2I3g(@;=NB/Q03B\Sb3D8HM=7H#9BK
e.7DEL[Hf8QU\OT82fK5]+WL@=]#+SN&@#+(H6EAEddW^9b@JRA3H,PaZ8Z>02WR
#XacbV^6GLc;Y2(M)/8NS,>&gCOVY@7Q[@>9DEXG]5N<Q<K]]H:@];E_8(OUF#PW
#C>\847&D.?1(^Z&:=\E<83S0^P_3VLV78cOMRSUO)1VF&0?/L-a9/7_b/L6MD0Y
,;L06Tf5^>0.g>4fdZ<>e?^,aKQ/B_U:N6_0d^<0JRS_/>BF.g8fU)G8/DE(0&A-
T2R>?PJd=dA(:[=/<22,9<gB=-G;f_CCPWA;3,^gS/.OQWK?6]GT?gAbHJb#+0VL
(d-J^#.gPY?OJ&<g2e@Df;_N)[fDCe(>b.5C<&d+:M-7Z<Oa<).gHDa_aS-=BAF?
:C7-BMZBFRRV2[:,aDf]5VO[:9L:PRD<F)LV1C4^g&^ZUHOREZ^3Ze)=Z;^UU,VH
A62]Te6K^<]2]aW-R(f\^c^4<3RL[II:O9I+L[6bVEeNd/bg9-D8\DZQ2IG@J84D
D5V)LO_gLZ(.AQPf(_93BS+NX1FR75IQ=A>/=XO1:^aJd?EGIgc,S(N3G^6\b?af
gQ>:+(6>ULcYV=cC.TG]\9C4fQ2#U#</4Rb<^QRHSP@,Z\D3==bV9;I2[9dcRKNV
2P1JR:C89c8P,KXgE-?dH:BQEbY0EC3eH50:3]9+=CJ9)(?[T6XSL-Ad0Q^_cF5D
1)IIP66f)?K=6BXV^DS,IHXW43c8GBK5g_K)#=_8+>/g/-+DFH5Odf1=_../HVNG
[#S50S,#9;g].<RKM74a/&=[aBJ.J-3^Q?ET:#ffA(IcO&Y9?2<&,--:J0[=+H_5
gg6NELe<@<NWf0LfRQd0Q@g9W:Q:b2=YG9BE,,e&_C/E@,MM0?&[&4Df4O83>,gL
F(H6>K24,QIZ<TJ>I),f]9JJ]g#Z7]Dc]\30P.>7egSGEOgBLWg_R\OgZLASRFGd
IM)S/W.RYa[RDR(@>ZN(,e<XUYc;XAH7_d^L1Z[\8gEd+_L7=20]#I4P^Z:L_R7d
CA0:UM+@X_[99L^8_\S>-eW([c-K2?,AYO7O)YC:MEYC2Sg&KM>Ud)X3:dAB/#cY
AGDC;J_>,EfMYRcOV<c8?W.&BZ)B32BO9YKSA/TP?+]D8CFYXg=&E-XdPK/[C9KF
C:0\AVCLQe/,S:aL9@a<J1JDKZfAY0>73>2=BOZ,>-VHbJ:a5D44^eEMI/TZIPYH
\c(>1HLS;,Je1P608\XA;5:9=dOT8W5+bg.8LJA;-f92dZP[[MK<D_ZX,#W=?H83
)7gXCP,8J=;?FF9aQSA8FCR/Yb0Ga>KR8H2a8^ASe[dC?WJ@N6R/5]FD>Q^@<<VR
(QKaBeV[><]dYeUcgc?-MabbDVK0K/P<9CI:8a>:7U-A.KQJ^^gSF.K1EMYY5(2;
GVX@\V)T:9LdKK&_>U\e6a-7b^gd,A:N0&eP\#=0I:J=Rgd]I#?W^bIFQ0RT0XSN
=L6JW2BVU5:],?,aEd(U.NY2e)dJJ^4?1JgFdS:e\EQ[4C)YHb=732+)5.[]KK<W
/3c\FCf?BESZ6dIaKLTf@3FA89Y62L@FDV0b7R]]/OW#AaP501BB:1-=3G47HFAb
UN4\Bc20&09&BLA+bRLLQR)cHcNSU=>@D#C#NE2NH]KP7;d_Q2d&Pe#4&7?Bd;B\
R@cNOF=7_N(P>\Y0cLdIY)N..(+R;5)D-]KaG[Cg>=QF10cI&>+OO6IDfJ^&I</G
G\C]D+#PFgP:=R?Xe2Y0RP;_NKQF#G]Q?L.L&ICEX^4c4Ie]3?g&(S#6;SA0QYfC
C4-LHQTS74bKG]CE>KgV2H^Wd@d:MQJWBV=S_(KU,.,LC-(3</-XAa9_)[7(0Z9B
H1Y&Zf8?//Cb&@JD73U3+OXJ7@b,7E6(Q4YbAS5BfPL907EdGQV,A?B9O0YR5fDR
@9I_5_=dEF06I<20L6\N:@J^V<J)1V7+WRb7EWbaI;_RE+W_Vbb6B@](6J9ZM?HV
1S,_,L>[I?bF?cPSRg:g6eNAKe,,H1:Gg<RMDdGfV:)VR#KbSe^G[:7..2UT(d<V
ee2a@+?C];I5/(FaAE_[&(87Wcc5Zc04d;4B8P#UVIHNUL4X.34^5YN)5Wb\ZI(J
3[(A.aLN]\UgK1;Ya=1<C:JTS@JJ4Bdd=_M0/@SY@\9(?+PUIRNTdaJ[QX6(-IAR
TJZ8)(1aRZ<PRfcga-YC^N@]E5aE=b1g+g^d+APU?]1N5+U_b1b)KVX12Z\Z#&F1
Ac_&UT[=AK-55./JNM(^HO/<<#:;F@CKA63B18@T49QAD^5;85Lb?dF(e/&TNJ-:
QVTS0NJ7+HL<ASGBVIAbR)SXa1-:a?I<U,g;c;&MT+KUQ/>SODJTC-cOe9][2?OG
Q6ZDQ+<@aS^g08]GOg^1g]+f\0O9=[^V^7(ZUI7QZ6La(4<U9LXLB[c0g=E;==U)
M74d#e9P3C4L(;dUR#A>4Yf1H.G67DCV56FXd,We.^J?LfKIKV48N<OKb>2@fBJ,
:12M]M>DgHJR4VOLH3,O/2SCQIBFQd8&>?9:NEMVQ3C@d-8@6/MRcbFG.@.8ITQ;
U^RBV]G;J>Q9BDeIJ>AT@R_^)d,M.Z4#X:88.7[e8@Bc\(7\,/Q?#(B&Z<E5<PZ=
RWD4+>BaX]-=AQ4_&N6IaCEdOH/9TR6=5<YC//<8b1bO&g(&9R-OP-YU=[dO[H(3
7:g;IRN.X-;Z(9Vg#FN-#a)a.HTX4f@ce<ZbJML<5cd\(b=?cW:S9LYV#?K1\\R=
6UX?LJe(.X4UQ:L;>PW4^M,]^S)fea:5HZEe/G#^T(#d_:FQ>63-fD)Lg31OG>FL
YXRGb/8>:gPeBCRIC+)a[N]#CC(Z72/AU:>T>H5>=LT4c[CeNe7J8&6M(I,6SNKY
L)fZX28A^1QRHQCRGbV]^)41?fXTTadJIFf]/b_a6-R)4K>&(_NA[I-A09T^eQTX
9Eca,#KQ:;U7K06+<=9E^1:gU9?,Q&.C5W69UT>@Q&eEN?4TP2JY7E;4]db@O3C#
Z8/U[GN[MN6JB><&Z=BKGUJb(8c.Y=]?b&1Tc>#^UB)[#\MdU>>&6_OLP^K&a=H[
<5R44F326HRGY[42)(G,QL?cB)D#7VU6B#:e+a:-FD1.QSQF:)c]-XE/._EB66/L
I/:Mf@]>_54PG0>EKJ1[;LKFbI2YdNGR)A,7gO@IB?=NO7VV==TKN:93V1>E7>N<
=/0VB&=><&1J=aUF_5F?WA>-1&C[E8H<.dN?/L>A+FOQ1^[A>V.8[^X#:/3ZE[09
BOJR58D<dL\CBcR(cHP<F)9],&YHZI_SbMe^CF.+B3f@5.+T,@gU13a6#DM&_J(-
KQE+\^^&_g(Y_[/&d7.SXIRL^bMR<K96DMK2GVGAXN@_=cPd<U]MQ5;03T.._3GM
H\XUM6_b0ZbNL4N1-bP,-5)VdWW#+UJZbGa/D]OC6.(QG2M=<.G-fc?Nb]\B1B7D
18_H0cT:+d&QNAZ))7agU\gC=CW,8L#B:?HcQ<VM+X:We#L,NKe1:LT]4QRVZBdP
2-[^@S,X+74#PIWYDPTP8:FW/N<.QAU&bfP;K0U6NCPa4L3R9aXP0I9FSg9:dL0V
Vce1\8e/SVaH50(#1:P=^J)(0#g5UQ?[[?D;d0^9]S=_.Y(bVS.,c\Y2:I\bf9?a
J;),UKTN2.=8cZKF4)2)^e;_OJ&Q;a6O,-TDR5GE6HRe>1dV^E7QG/bL2.e->&L#
DI3;O#2TKgR[]Zd1C7E[I+CKIIP]03-OX+,M:^US+>L[V.aI>Y)aILQ]TaJODIKD
P[9cZae)\T:O5MPU1aY?Jb._BETR&Ia5C\ABKFg+PEb)\&(SN)?Y_dG-2R;HKJ#R
bG^bN0PN1Fg+gTPL1Wd\[@<0c32VZ6HXRTEbGCEQH<,HgH6caM?AYHCACc)5E>E\
B2UT;XfJ6T.>FO0]P,WRT,bf](-31KYA+\#0GF:^?BaOA:C1GdY).DA<_d)QJ[7f
FBMa+,D^)2eNSK7RJ]e6+Q]TeMM+]BQNDNO2:/^HgHBBQ]1QOSWSO/d?_-TE;\;U
I2UKB>TX1YOELR,7_D0BU)H)JK#4?8/&Fa+D[3=Z,9D[TY#JSMHZEY0M_7#2C9<R
10e(1#:7GH#[=/^))/Q#X3.J#2B(dgO>P1MJ@)U(PNIWZ=aQ_MO9?H>9QK>;3RE?
+>4<IC+LA?c;?J?KSP/gAO[>]U4Pb8L6Qa.\)ef:&bT3&AaY40.98MgegA8cJ@TJ
#CYG)JfQ<LdFdM:BN)Z]Q47/4930g1Y#P>/0_S\IYI&:Q0SHWOc.U/d/=?VN0,1b
DXY-KTa1a<PQ3dM##BBL,T0F<RM.e5c4bNeeaBYZ;CJ&V9_W/Q#CIM-?8Z;Y+B@2
,1(;(.3S7ME0Lf@7OE/fb#=84UJ,29NFa./:VHQ8STO7=H82SALUf&O>G]4LP;cU
[2RfG-)E1&P)M_WK)I3T3Q\;C4LKIM&F6[/bFBS5<;^-e;E#Yb&^LdH;)+(/OFWH
7;dHcKT:K?Vg):J19>_9:(2_P64?K<#_CXWHAEQdF,[-bE&0>_Q9X<<FU\aJMJI?
;UH^PM212Y+B?(0:84I]7[Y&->R@bg^MLNUIa?e/fG9=IX:?B4e:>ZF0:]0-6c+^
2VI@]J)_HXU)-@#4MBT(PHTf[(>)@f+(9bQZY;Sd)<ZIdWXG=&9c_C^2YYX1^0J]
#ePOb-6TcLH=e3DC,PeZ4G6\Q5VX8R3NGb6/e[KQ@+;[adC_g7E]MWUIcFMGZ=>\
de&DO@A45X-d46W.)B)cZc,8PW-Ia8#bN(J8;H?1V903WcdZ<SSP;U\+0(B->DMF
3O90?M3Agc,MAWfR(_6LF_CQ<I<VA)>a4D1SS,0?a[Sa8b,@JYZ[C@<<@9O&3be9
H?TQ=Pf9>+GcI;S#G4gZ8@JGWZ8Yg14cebA)713OBFP\]E88:#gU^aL[5Qg.:7TQ
ffN3^d9ZY(<M(c,7&@g8(HA3\Q-J:##:_DD\#6e&e6a77KH\?>2^K0VKYa&S[7QF
c0fSbCS,S3aEcWT/1aPTQfF3Z(@DK<YZIYO1CMY;V>@dKMFcfWQUfMVW97a5:B)O
(WdF8G6K?@&0e?FVJ:D<4+],egY6K>51O0c+1/VXcC]3R\;\SbgQg^;1K3L<:a#\
f>Aa;LDf/SSBZGEN\1V(0[ge.WcP@NBKG[Z_d)HL(UedLOdH5B)DV^6TPDO:Z^53
Xde;0Y/0Hf;_dQ)S^bMYCR8a)(_fgF#6;W.C\/ZJ>?ITb[47I_?=DgVBBHZ4=ICb
Z2F@WNW&8(:03->e>^)WTH;B7?JRBeRR1Q2Me<.&=@LbC]cd&=cSJ27<D3d.-/_7
Y865EN[J@IfgWJ(H1B=,G@;[+&::BYJO7M<ZR5H7)+TQ)f<g8N-L;-a0fMU=0S./
03C(Q./f#d,;7gd3X-1OFV=7Uc>\dL:c]W5gMS[NOfRVQYBEUS?3/B3#X^aZR/-9
.RXd8E=;:YN,>D0_Sa4T(I<5[:NVg>CH(K-OBbTMgMR\^\:MHXe2e+_d6O14+NA-
5PV=X/-ddTS,e]Xeed@7G35Ga;QUS5:9#bL8YWIeRN([7X_2K)-VZ=YWS0g8XMf#
g1c-2U/1a3AB84<X=&g<C:5cTUYW/+;9Ub\Wg067?(-\bT=TRJOSPQ.FLbJPDRb>
]R8A)NN[(0MgbA,d1^/K>M;=Q\g3#0V?L-D73H46Ce;)_9R1B/O2XEdDfEeC6NI2
KD,+KbGD5H4IT@=UL-U&\P#:Z[gdMNKKEbUSfc\07146Ab\??:J2XY7.>TTKBF@#
-10-H\/P_RgcDTQ@UYe(9_\GKY./dWOgA,;)_]-:J,5,&N[[_P6P5LQ=5ZDc]6,;
b&JIgRHA;0f#A\9R2L[#eeZT[6c((4WJ(O18)Qd/R76d=RDIa-:^L0ca#4?]If8M
X(K>9711@2I.]>2gVVYX5&F/C)(XeP&GOCLe=R]>8VB)_S8>WUV=@,^6C1g4W3;P
YBbb3:;HJ^X->J54&J0[7e]C^3NRPBF+E0^c/A>895Q@-]U0??9,J@7XTSQ?2B+;
+6:A.)e77LcVK/EG3/aPd=PZL8-P<LAG)00aaH\UdZ3>EX#8c_PSPFM@EYIB35dg
Z/Rb9^]B#VQ>;#])]eXJHX49NIZM1)/Cg_:9/&0=b:[KHReb6\LPU59-6^N)E=MF
]7+RWIcE^MN6/EGf+Z>&:d@)A4XG-[[15_MBM053a>WfJ@T0O)HI+-)P6XSN)Ocd
6IZ8D<SQGBf[De9Q@IcIE#Uf#B96a#2/,e0]FT^V1e+cT4@&8BYNe2YTO.K32.EP
-:b^JXTH28S8f0#5J?T/[-V,e<&YH9&_Pb/Q49E0,,6O(@11eU/O>2dL6X=XdX.A
<H]KZRG\HRJU[9(H20XcB_(;JV,.5LEPN9V>f?[3F(K2?T21,H[L9Lb>A[d3IdX^
>,6Sa3Zf@JDDD+1Z:fV7GSN;P.2TB0UQMKWJZ25JD19M9d37Vaf8T/]=3Fg0-C99
OH[1VM_9_3NV^C/f^c:AVFN]5<.<NIF51b=M\@3ZPM:4@8]@9g0&Q/8?QPITIS9,
G4UM.BgRa]2S\FcUB/PHH_]8[\[-a07-<PYKU,2<B272RDZ(F;&T?<X,JPH4/#DR
]C=_dT,3-9-.)#@G;0+?&c,)d@;D.SJX^/X:@15BFcD?6;+[@ADWE<#[dTTCP_FV
.UORS^+Eb#C&A;^b,AVG4H4#14&V^F)edP)fd0SCFgN\)?YO1Q7D6+EU91Rc?e/g
fPe(=#3YN2_HQe)JTB.K<YF0]:e+^BeO;FRGL@V#(a70-LS7gdH3I2Q-W:63CD4;
DN7\F\_e2=08GN@;VCDVbM&9QFg^MBZAC48T]LKCY4&ESV@cdD]N0,VLU4,gV=14
KHT@>-Ma(/YID-3_93ZSVZSIC-Sc^;2IIfC0dF&aa(cJ^@HFRMDR5)7=33RA(WFO
Q9XPc^A)/?CC.HVBeZIVeMgg1d.8F,D6&XFaMZ;-XQc9R\OI@V_;PLU@U/=87CLc
<?S5^A6RIbUFF#3ZZ-M,3W(5<HK6J[+0bYdP,6Mg(;F75AbYfZa/U2gc64A9HeP7
^F].=YFYLNFJd#N;7a_6C7Yc[W8R)=_E;9WJR_CD]:gJg=ZK.<33L856M_XL3WfH
?SZ^,PI[8/=650(cORU,(CYfg<ZIA-F0Z07Z?aX6+&LG1EEVQ3NW&>89+KdA)V?<
3>b(DJWfU+cY5D;6^QX519L6b:O]d>&Xe2>?3.Q>OgLN@RO?0H52.\-fV0]6+Wa3
5BDUKf]D]\Lb;,4D3TR>^(&90#&+4:V9+NC.a=dP=85^8\/NW3DG_?:.7)_0U>72
PX9c)9ZA7L-aBFU85Y[2IA60@/&:\f>P09a<@7H4cC9L)7H&LUa-I2c,5P^J]D2H
:#(>05P9[Yg[Z9J#.[&S7Rb1^]AZMG2^6K9(E?>V5\:,HZP>P:A&f()_W\BfW:a9
\S.^2TABa:0J4;X810#MH#5a^IPKJXD@^HF]MYaMD4E0PM/)]<-)bF6RZ;RV&H=R
MR5?&FTH7J;+Xa\JcD4]3?^R8#RgI&7A28<84NV?]g]=Y4e8C><JYEDV:KU,5?^f
cF)gHMZ,,U^1Ae3+XBE9IPe3^c@d&HR<5LFG^W@G8OC1O8=9?Ed9NTJL&1845:PV
9-^QZ?Q>OU77^B-cEDS\/gDXS=D1fI6,+V;OTP;Dg4P)?&FCPY[D25\/J9J=QXS9
Z800_]VfIGR:FC1?Z7Ad(Kd\dNVd=KMT-R)RZfFSM3<MCJIg2?,WJee6[A0.=Ia\
AB\;P(EAc&GePFbbEQQVdKbV]S#8eU0b(S7aIB]X8=EWQNab2MLVdI4Hc((V8ZO7
&TM==)/IA=OMe+f,^T[]^\/(0DEVV>HFGPf]^ZT;J<OJcQb2cV/<CdH<f_[F:R/&
Hb=Y+73OM@>,7b4<84.S^TAGaFT\O\+FAU.b:T[QT3[2\=Nc5SR)H=^C)eHa1)V]
eF]#0)R-DPNM(&4]WY]Ib;7YSE#R,]\3T(SODD?ZQbMI0c(f:]A&F]-Rae#cHgVG
QaXD01#PLJ?1e[OS5g_LZeSLV#b;ObQ\RCb.Y=WW1UBBMV\/Xg^UBK_aA8/P0X7M
=9<</@d\;S(:5gbHDEQMad4>(TU9LS.LP3f4,H1SP\34<EdU]^7g,IGPEB8A(J&U
4g<[B#_LQ^5Q.)F601@BAZ4gRON3db)CV/P?D[S<cZ>>7[U]H+M<9+_JT@##VRM&
PS,g)DSN@)g8]b6dJV53PR#&c7STdY=-,>N?[?cAdTLCQU?I:<CQJ#Z+E=O;KG;)
NXa:3A+\e;H9TAQ\;Z#D73Z)@5WF1d9KV(7JH^gWZM4Z]c?LOH(9>P6Jg[(AQ3+:
+1#Se6]^LD2/3gMI?&;XJfA;KZ]2:Qe<0__\BQB4d=5>XXVHe:A<QKVL:>KOTXF6
]=HENK4<DU8?>9Ce5aJ,UX)?BPXW(&RK2KUQS?Q4<;.V)5@#FSXY3=;NXOb8^-_O
fAMQYc5g[Y^6_1AD4Z)0OAYC[Y9=Jebg;?;>S[X>E#a7A8+/,b4@\,FVO<;T5/2e
0f=fK1#/?P#=1H49a@NeEaX@7G]+ZF-e3\?K+CB+@LJf\QJW@#OE_<fHCH?XPb[S
@9Y3<fL)fL>S@I(QRa^Vg^]\#EZF=;T.S.<1QI(5A8&]+NIZ/QH[(;TS0.:?e5C9
HYdG]3Pg_:Y#7L9,G]PI71bc;V.c(+ZT3EH9=,/B-\bH1TSH2cdT7UFcT1J&7UA1
^@dC6fe&efWM=:F.+Gbfg22FF)IV?ENXUY/3+T3LQ6ZP8__22VUgcc/[DH0R\FU@
BH&+GAg,V(H#,NUI-GSeTdc<&2TBD8\F6e\(,7O8+G5VK8[^#@D\e_XA_2LBB8D.
]CA(F^]Vc46WAeKBGHUOY0W2IH98>C9EI,;0=LV5c[G.27@;E+.F)LVAeXbg(ZNJ
>+M4b.GG;:7))?D7QZf@Y@0FVFQ4Yd<Vf)X62Q0#579/4B^XeYAR#Qd.#377>3;S
BIL0gcVGT-SCd?d\><6X+?K9=GFf-LK/Lc9+M:_WP+?-AJ\V[R_MS\X9QILId6^3
=;5OZdT)RR2]]N,7YfF2GI1]#UceKdM).&J2],V<OdAPG/9T/^KH,:)[\aQ9fg>,
/.Mc&1G[&,E#Z3DL]4:/@_2/+58,;V3#+^bI2WU:d+>.@TbC6^#eOL+/6&Q\H9^O
efgbgT(T):8/2T+R6D<;bbYJUT:4Sg:MFg.[=.J1gSZf^?9ZdY6MNC5B?L0QM@KC
CX81A87/.-/U:YgOTY2a/+]9WD6U^,=J]N=6?=4X=@PVOGeaCAUHN^A-RdXD/f]2
dNX2>6g8#)=)Wd1\T2CK5A;WUF@V1fO?EZBW7^+OP;4bXBK5;C9-O8.8-f=IJdc=
)<)3:X4gRE7=5R)c@\ZYG2A+EU;9=5C><Q[R9Z;&DNWgW<YU#I^FS3G:Dc0F)dGQ
a.YKC^^SL.de\VQ@Q]29&Z+PP5@b<^fVDf/VIb3FAPKE;L@+V+],?9XH@JW#9._I
?/O.+NZ\9/T7a85[IdbG][&PfN<GR:^c)>f?I8,TbCUG;)e&gGY?KHgIPIFTRF^Y
_KHb^@f7Xd\Z#K1BG#,,c_T5[GDB+AB<W5<N4eTA-)2H+-OL^C^,5-gK]3b\5gO6
<Jg==M&AVLO1<G2F^U[PKZ5PCDD&.,+V6WN,?(Vg4Q8=.@Q@\^6VV9X-QN__MA&G
X(9+^_RdMV7.=CcF^_]>gILB&Y3E_0USbdZ^Wg=G)=5X/2[5VHdP92;(&UKIO2LR
U;\Bce7UW0U/4@T5D;ERIc4N>D:U=6Te\@NN::^(O?;Z7V0Q=K,Rg;E<MYX-Gf).
_[)]S7EXOaGRA]64bLW@<Cb)4CG?U(,2P1R=46e-d;FeQ+[VJ06+CE\=RC,?Y]H<
3Nee1:R4?adbAf=/^f#>ZPeTbeD==D2H.VBR3M4T?[M\F=5,JM<,+KH&Sdda<ZdM
8TgePP?/=F.Qged=_09fCSdT\c6A;4dC?Yd>7D_QEFH-2>K7\(0,KLYfM51ce/?F
e]b=0CAXd4@IQ8(F++YMUd3dCcI+-g0D>5,T>P5MJ,]073d-,(_DbD0-2>+_M?)#
/aMFC75#G8TYCG1FPY:,N.:_PTL34+<J11-^.+;T246[>O&ffD4bX\+9,_1dCOKY
-[&BbC^O@G@LVC3E-NN7+JX(H#g]OV^XcCC/(4?2ACDCaIW4G4PW0KD+2HJT6QRE
O&>G2<NTN)3^?-\W9<D07.J6D?Tc>C);gHLMKL/&WMBT6>eEOa<_C(:+d\]fYN^4
9<Ca>Y3JK=DK6.[(]f#I@U./VFE?))Z=H<B2=LYX-0;5Pg;C;0P\,BI-^P]F]IHa
W_3(_T-E&XWgPX#Ne524US/X0YYBbA?3GIbg@b^GDEd-+38e-YAdRNcY?_N#NQLA
CEZIfN\)]Z&KXAG77BdV+>K?A#-5.>Td_0YD_MUP3V3G+[/0X\U,#BBc3XY2QBA[
O=BA>gX79XT7AJER7ZH)<=D,[c5]/D,KV44.BadYR_dc3LMXP8:HH;Ag9D=IM/#?
a2W6dZb2C1H/J-0e_I.OPN&8.8Vb23DD46-d09f1M5QXeOBRV(Xe/EK&/1CALceQ
6J4Ld54LWeC5OGgLGIZc-;ceTFU&UCc.ERA\=@W@HLAN,dgeG,67J88bWYYa_8aK
76?SH,JRf<eb]-QH/G)@e4;=g[+YDH.>;PRDHIIfW>g@7LZaAY[;.5FYcDdSE2dU
T7ac>ER/L_>G)=)RZCJ6AH<_\?MZ.Z&.BL=7NYe6X4@c:fL(<?,-F(C#1@F_DG]R
0[g\II,]4:PV;=b4Pc0S<)U[&845[TND+3R=:;bUG)TGdO-/(.]&3&L]GU_>-K:K
WAD6KTOVX_?,-g3fZ@HK2QN1f7&R,,&V94QJaW>3bJVc\6XF4_09-C+WV;,?cBW8
-9S&<YMOD^ACKfA-K:Z[R+8d-P9\YR61M6Id5U;TFVHS26;Yd9?Q(.H>.=[Y2=/I
\?<B2Se1:ZSF7J(8cg/5^?V6bcfXJI>C.5J1V_5X(;8L4GeLaJI(GRXBN7W0+[0g
-egS0TM/MHgA#a<V@PA=B3#V3a.e2dLZKMQHL_-DD_D37&1RaPUJ:879X<GR?gRB
#fI>L)cDX0@C\H9:(KHSJCW\X(/1.9?AVJ1B\GNWK&>0W24gT?\0I_OWWEP&9gF9
Z;^U]@GJfXHB(;04W5Gd13^YXdRJM,NR?7WO2PJRaD\\C?0bLLMIXb]7,QbfN0C3
4G628-.<KN0<85WC&RG/S?#0BH[YZ,B9\7,L2I]#?cX)&.D499@<+,N<Y<00P2^B
9C@K5UZU9S;D#;Zd-O-aS,a:LB@0XYCZc@TOB#PUgKF8;ba(JF\d^M8]R,9)@D@.
;I]VTW:R\/5\K-^=5X0a<P)W_Rbd6G@9A+9T4)978/PY@fI:\dT+CeVFg_/8?ecH
1AG:]]+A^.F,)X[0NAB?4a7JIT.J;<CA>9\77Qa0YA5_\I.XD5,_BA-]U4H97^N#
6b6U]+VY<@E21]RV]-0=./:7=E6?H+C<YP4RP1M;@Hc#[c.5?@;?O[V?/@.JJ=KZ
ZN+b+e#9PR)DZ7OZaS0R]TI[UbTN?7-<e^C42=8HB6=R5HE@]NRP/a@be5)K8_XD
[=DdZ?9Wc^5>aO(V&<WUc5^ZQ\K]?geAU9_8P)Ifga@M;GeJgGB(TgQa<HS^E(,J
8OQ[-7I\.&N\S,F,4S]S/Q,141P7)?:W(6>LIc[>NQU>;d[IN[G.64P0)WOXePK/
f;)U1KXVbB>cN:#<RK#Z[T?e<]@(3Va6eT-:0>cT\97#S=b[a^>N4#CG72W=/6QF
(2R0+c]9,L+ITg-&Q#VbW<?,U/V3XMb=a=bQIS+EaF6L+9-EEIG\Q&Y8C#62[^P7
MA\GE?L9R^M<M/H7+:,H1XZaPQ#33:.M#X+4R_B?b+35QV7>FV]=Hf=]^^9TR)8]
LSM:JV?#4GJ/62I:QAV.4eT-OCNIOP))&#T.BZ<)/+V<c4)3PS<&^7/0LQ2^D96N
;9):g<+T;Na95_B>IB8TNU178X^FPE<5f6RT5?34TVD=Fb_Sg3&1#U35&YQ:F2FC
5Tb6<a41H1/00\)9O.R9e@MBH;Cc/PA8HAZ8,&AI\8\ZeEO,Ya?3G]-MQ6?-T1Uc
-?.gS4fIdJY&>BZ<MW2;D2)P<++53+M]bc-?82Zf\:>TPO6T+?;-#9bT6GLc86cR
Ic-]K6)[TdNIJYg-OB+C>eIS?]TX-#NLa^AKYB[aX\YP[9W44=TLS5QM]P2,,Ug0
NC_/Cc=>a2-+=VB>;c3+U7X2<06<BYdTUB]SM29<EQNZ6YTcf^EbPT>J?7+B?U(O
&bP+W1A_V&S2_#L:bI8>??XHgaO69Z@1YZ>FBRgP\J[7O+^Ne_FOW</2IKGAL=Sc
[W@FM5C5>2+5/SA/Y#7O_I@,FPYLFWYB/AI#IP:-AV7YI;H))JVe+2W7)gIW;YA.
FYc^3_C.b34W4&LQLGfJMeB/E)84[,D+HMDUDID<\Y(^D,6T,e2V,:4]DZE&>:]O
A9Aa9;/5>0&XHAT8L]GX1dYe/>c^4IWNLM(QRL8I>MLc5-PgW2+),CF:fST@-D:]
DWTAN2ME\>_CZ(;)eN6YDZcLF.1=,Qg7R24?gCR)beUU>JHPI?3479IdHRW@O/AH
D].3c[Xbd;QE\WcX\+L;K6;UE2]ILSaC,8S#+3T#-).(1X;6&(+;c(Y3H:THaO^J
0VIEfLBgSB4DE>;(1]VgbMKXF@+B?[=BH;=U85B@cO]JfA];8Q]O:/K^Qf:7\&.6
/E1HcP+1VHCcSPN_d^BbcE:IF^?V+RE73SC=H(AYH8(LHZ^d(19B<fgfIB-T.#AL
Feg]Q1H(U[[>#2ZZ#R>\I#I:S4E<:)WKg8UKE,c,1P<L_Ab26bfec2c)P4^.JfF;
K55^?,.XYSWUT6>If90JH-=gR/A=SC@V#I,C/8UN0c14S88_\A@6UBUdggZ(IW>5
D\P-XXTQ]ET4HZaO9XX[cV^5IaIG3:Q71R5UY^(RDDDge&<GKZ>8-17&UHM@ZF\O
1a[^#b6N<X8F3J^c8Y;Reb=-[01(=K,\R#HA8Md-0fQ?VB>XO2a=?MfV\H)T6a2Z
&U9P9ETYF7FLdIGBc.V+cb7>=4?fN[ZT9ET3:eWf>Q_G-_d?[ae@.CYF-N9cY04c
_>0&fZdR@>.UISCAN3W6(A//;<&MKQ^0NCL9]aZ]E@NO>6_2=1]IfSRC3O[ICZ6.
\,B]@c-^.Z]HKbgWQ;^dE=-_KQ>[\CCHZ5GeWCU?2?4NPY\,KH_6.OK\,U-Q&ZcU
5J)];(3ePLZEF[1;QP)\2,X##aS^dBeJ[NL<US6YO7]W.64_;V3(bZI;&3a?+XZP
Gb^\GCJ=a4SJ:Yg-?g+IM8^6SC7:P;S(R^F2g2MF@d0<A20gT^,;7-J4K48F+1G@
Gf\SfR#12RN33f(C^B8IJ?bA=DD+<g^/[DJQ69gXR3^)OP(RRN=_LL46I)DVDW]>
NKGG27]=Na(XWDJN1<+;I4AH73AAKF)4df?33SDSU0B^ZCUdeLKc=?5ZdF0===+\
>8R?fZL&+&DQ-Y3-+gCUI9fYB/E4bH,IR/+T/@R^/2;JVHUIIJa^WaTYf_I2f>VN
_U20N5/HG0C?aKPO&?KT\@=IZ#gKZ.[)(9T;&gIPV,aY7(+SE+ME?)fSA]7SC+d?
bQGLA+(JJ(=-+N2TSa6N:YF_Tff#+fI&G()XSX0O+\eg7(@/66]5M#IEAKMROYY9
-W8BRdK]E6dHc0)c@#H#JS;\T9NfUK1VA]?^ZB-(&</+RA.1@L&8b-[03S7.U&0)
?f,T7FAQLZX;2)CeTN6).=?2^-W)M#D8J#G\2GNC]E1F5F\-97_7SZ@W43ETE8#U
NPfX.7^YFE=,#f;72aN1.58DdHD+W(FKXI+PGV\HVQf?[/\P5YR&OSZ5C^OKO\B<
8g_X#9Q<G)C2M#_#M8R1eVP^=6MQfSH1R&GG_H>TM/\O1f^.Y]QXe0_Y<XA.^+cH
1RGM<<Tba^c)AEXH_7_G7]^QL^NHH]VOL<7[,.WXb@d1AU]B767IU2.=7aXTZXVQ
cD/JN]LFF4TCH&:Id=B]EVL8(_9?L[518\e/)Wa\a+.+I8(\_I6BB]R+7,J#[H^]
/KgWB?PNT?bB2P4VAV9\M4=2FZ6=I:X[E&#M7e^HUI8LW=X,I;4L[(:H=fY^I_+T
Y4CG?3-&?7QOMORaWLQ-M<3.&/#N7aAK3KG.MA+:-Y;UU9[P?>3\75JL_^21U,XE
d_K0M1O;3JBQWYL/DQ.N]ZF;^CG0SD)b2/0(E\XUZ569\3f[FMcN/RF&C+8#5VbK
d=fPd)AFE-<0/-U2LVMAJ&2gB0gP;0J81W^QENL=?3^OV8DLb5/UaF2EZ?cA(B?f
;SW<XK&5FQ:f)L[E8@#5dC5[S?ME7-dDb]P7X3DKU@JK&@cW=[[3_LDD9cG/-Y[M
7=DJg0XGZe1?^P-[3a.I<RD58M5YMFC,N6#\GHUMXc8W#,.:36>>3[==JgGHKUVN
^\d-]bU<aPNc.a_K-a<3P7+X_:ebT+2;E]e.FB8(-d&Y7^[VdXG],[4g1aJ9RZDM
QF/ZKWS+NU5MV/5#G=O,G\MQ7??Y+FY?HSW3QOT8N2+=2V0J0;NCT=NOMI_O,Ica
@f5X/L+=3#[Ad_?#O39E7(e4@MO[-55Y-9^\4fRM3A.g7QEeReWT7g?b2//3Jd77
RXS1#9\.7N8LJ98D-8&)\[K:c6dbQ/G.UO3FPdPd,IGU,(#0OaX\g7-(ecNM4PF5
bLOYL3(4P;Ld/PT.=E-5Y?g2\Z&NGW3^:>#+3K]<-89<<5UUF,VA2E0e08UOWH.#
&Ca41Q1V9@6/b_.E75]NS@@Y@P&/9;K4^RC00GSOE76?HeI</e<>4W([+b[/?EV8
[]Fb)@H29_X^cM)[,d\HZ)[FIKPRFgPJ@B\ac#(c#fB5e+QIdFCWQRa8A<bIaFEf
#)IH@&/IaBQZ8MBNR1@SaN=MP7\1BW8C[bW3X=A5FQCBde7eQN]bGb3/>c9TEQMM
]Gc:=+TAQ\bCI:?1477f)(_YP7)NIYL:+GZ6HODcIdX;8V)FF@^>],0BMg2dS:aF
FaF07T+&SAL@,Vb]1f;,f8&Q-VP#\-^1RR)E/)I(0/[--#=)F,HH0Y1;Tf]?g#2^
ZF7P+Z4XeX.WZ#J>)>,2^_EIU+398.I4VRc2YOMKY2,7g(.?SN_eVB6W\((1CNd_
2U)9:O<Z3ED\LG75G=XI_;&S2A6FXX>fF4^^9EPXGL;QOX\2fb6J5RKGWVV_F?#.
e[+g>N&EQFW4TFZdP+#N.+GZ\d7cU(.6CTWc]A6;J2/SOL&-(.9:TfBb#HEX]TAU
]TI)W,X(Xae?+g<093eF:CWW<O0/6H)HT9eECX&I#,E:R(=&>7UL&&bG6N6SV93Q
?=gUbW:e37X0O:&Zc[?L7B)M.]TIRGCYRDaeLCCTR]276cGV8GCVO(e2B1<eM;a4
_](c[-PG6b-cK^[L\C<Z)(7=SYY(:gbELFV-XB<&6NV]BS<2ePZ)X7f)@^b&AN8:
?K.fa0a+G+@+B15M8&0>P=V0YI6b??T7BQ?1b2P\[9&SB.2N;OA)5fLEcW8M9SM5
RgRLL(Lb1HJB/[OX1\>T?TM;Xa1N.@4K[N[;XcRBF@EZ3?)]&[WF^B=,O\THJ/.[
974PB#^VdJ:bM-L5S9__E#HL8R+[Y?Q2OZ/<PaAY@+2LK#c1DM\XW:eNGL#2_fBb
X2S+4W??G[D)SKQ+U9(607Wff83YJVB7(G.]330gSQ8#MXe\,A=Y5(@4;B&R+HN3
bIB05bI<be+EEZfW+_#,gb-M>9ddX?J(QgI=]_K@bY:Y<FFb2S2W.3FDAfRCb.#)
WXW_dIEa;KaB<GGWQW;BD)b6W_T0T><(+7C-4gI(MDZ53;R=XPCWR0Y6RMdR,.]C
M/JEPcRLdF+UfN7M],;a<R89@^UK5Kf9\R.&R_#AB@+:S/>;[3IW#+e_(K^aDB=4
&=.Z3N.C.XCg4/,SALQ\2]8-1+,c,:Q2H&L27,fbaP&?\[ccd^Ab8Z(V:7)7JQ_D
UD(fYF@fc;-@/=L;_W=@64P\WCR:5]1dQM7fLU?f/[eW?AU5=gV,,[gLT.YNT=Y6
U:JP4dWe8PWW]fbS=O2SU>QEQS9SK(?MVK#,a737+SQa1L.UMHVfb;),,G59LV11
2K)cPK1dS6AaT/\7S#H4PO#_d;X2#?>F?TES^OeY#Q\9./GO(LdAA/)I5QDY5&G#
B4=@?FDDbIB6H_ZY)(aWeOg\86I9KP2KY.LJ_Z]ECV?_&0^0VbMBedM^3;)521PV
TI,626@SU?bH-L-f:-g(e^T8(6d]d_WE.fQO84b#LH&dEV=cU<VC+[WS[,RI//=a
##&BRVJ0ffOE#>B4</7J>aIMLF5<B43d^IIWJA_g97_cS-A;P.8T3fb[[ZREg5a+
<\2>OWW6,3MPb\]If>Sa-bVRe/N]g1#FfA;0d3g20U<fD3F[58gY^)L1>C+fCZ3G
CBC5T=85F,gRN2=@MIM^E978Wf;(eP,L)Y+#+YI.:0\2-K2\<8eI@_U05NQA7X1T
Q2K4@I,P^F5&(IY@cA_?AAYF<EV/O-&^EX]aGbNd/[WH#EN-OCOV/Q&9eQ[-;@HL
21GaDQND:FgSQLSXg_d-]4,;?5f7D0MMbGYAAZe](K>?ff?JHG0Ga3M74YbgW;JG
C;B]0A:>(T5X&[b>Qd;@Z]cO(\C+JDBg=62<J-eVc[/K>_P\]\=1JAZZTE(/F_G=
I&C\JX28MI=2T+1#PFW>EP2E9d:gff;2^>&aVSCXV(P;NO?H+VK:MSX<]aM?:HbN
cY6^KME]F+]B0&=Y=)]4NS(Z[\Q.f3NX6AS3[7<KgQGE^dTFXSKZ@-S+^1)WeA-6
>IfW0OK?AN7X[)+Tf#QPQeZBBN(f+Y/gQ+E6a64)JM1WS=@&+K\gAMMbY<R?5)Y.
4<HL&_]F(9D7dF]2T.PXc8G&c1ee]^P)\BIN0g17@&gQ#JdGWaER#MV9@:W/3b#/
31-[(9NL+-E7CE06fSZL@bKYT<VD6[=e6b3e>@eVFA[Ef4dRJe9_1LPE)W52bg1O
-Q=C@Sb[)2SMZZFgI)\.GfMbDb2Va4G(@FceR(+>:?K8TZ0e9M?ZNCgA-D[aQ]fY
AQbd]bQ7dPdXV_b)(3T-;4M_&H7X^NBEeQS&/E<[Y@NMP;I\J?e<Z+2CO[Z2B,@?
<>,X6d/6)eR;8/40^@=bQH:N@\]4X)[VSYa57YUVWSdf1ZANe(.3gK3XAN,V\=fW
3[-R+^<)P2.e;H(2DPKcG.-C488BKb<&:a8MHaJ:3U.;_>3E#V[-BfC:P<aWPU7M
RV#ER2V.c;0()7#<K1;[Q.daJ77I)aQ.5G@Le_3XL1L@YDUR.#Oc8>&[>e(bN(;X
f7D^B?A<+A6;/d;6/#dY9@b76Sc+B^FFE;(a(Q0N7d#7//I_.=XE?>Ja@bTN&>^7
d4=WRUg7AS;MgUB85)B3\a2[QA?WRSMYDMNUNL=9OZ+&PDO8U6Q:34;AX,4JNGJR
GV>HV/Z:9(:;2<^78Be#TP]aK/+c0FbYJe&dD[H3.OM(PT=<^K6=f-c3db049dTE
O?K5fbS19T@^BZ>>#<&5@W@,#8,)D>(]L5A_4;NNA2IX-]-?.3(aOT>@1c84C-_1
\&5:5VENDR;0b8/UfX(>^_FTPQS.f-NZF?g5ZKRUG0R,(\]5[O7_PPLDAbO)W-:[
>[cbcTc0S>[>N?1>_5B,5THU/,4EW^2U\6.Z3UE_4M5)1W)6O).UHdVeaCgGSEM/
H+);8Z4IJVUCLB-P9T?<2]CUe]Z,e@6,(->YMa.N#=]+H98IXG]0=)JKQ^61G4f;
(Vd87fXX&Q//QL8_;2:b#c=<54WXN7Bc.O9)Y8A#)TVGH0<-da-f)0;9a4IH8Z<O
N<P-5W]Q<\[TU1CeUd1X+d;VWX+N0_c-W5[4B0@I.<Q^1JHMVJB&4&=:M@6)FJLa
M3gCB1bN>Y/IX1WXLC#9.AP6@_@Q4c^/(LQ7L[G1?>#OaKW4f3-7B7;^E>JB5FPN
9EW?0CQgIF7?F>O+<a]a20f+-ZM/7c)=?)XO=@12SFX+AVBW;(V,V0=\_M;56Y0V
=:9ZO?=ZcM0VCO0.CA?Wg&RQ3/FEc&QBfaULRcZ>(-LH>,H=D)V9T/BDM-__O\OU
9e0MggD1U);TY3-+O)W+ZV^[aeR;B.,SU]ZW3+]\=?gE2eQ+]//c2B2.b)P]WDR>
b4>)AbFSTc7,BDF5GLZ<^[NX(?S57;(KZ4?Ic>QB\&@e+cNIO<JWNCJIQ\?X?26>
T+=+^Fa&W[ag9a60ZF-K[f&\d_g,C^KL-F3O.#D2T2A=Lb@ae6E__]P,Y43X1>R0
/N(_4Zd3X_2-Zd16F??3K:f(:KDP#cBD5:fNA@19OE8@_2,N8;ad8Ue4\Tc_fHI)
eUE,UJX0+J08:I>TJQFaNN5WC3APPUSW#PML/2PFdE=XX;IN>Ca^B?7S<@<-<OQ&
NT\947I9J;Z]WLN4>^;@UF?W8;+T\Zg-R@/M#@03>80IT=/S(\dA3,[[2a4&P4eY
XCK@&]^/+M0>fOcfe-=[8<c^#7K9=00,(IZ]>1FRSBcbLCA9@5/+^(#[C;/_9OHP
9VFNU,/>LT^#=:GL([bO:H,UTYWH,T9)g[ZYg[ZP_KVCU2/#O:[d&HFLR2bA#18\
da=bFSEfNPCbOW\K3LQ)F]TA^TJZR>P:AWb;SJe5?[bc54N/7I1g(\f7<@@)D@3&
dPZWD:c?7VVa&G3eM3K__Q6F)VVLHbdXL4\<2aXCIY;-B#PU4_U]4=dgG9FIDPbQ
Cf#MJ]XE@//8cWE;IU<RQH@^<gDE@MI>MffT?LZdKA=?_?>6JgW\:Ug.+UL^2F@>
(?b_R1cA-\6fWaS.a.6b82a^aFJDc9S8]F0O=^PTcD+RX_2e#)0\,fMaD9X4EeCW
2f/3?_/QH5+0JB#X.Nc=e>R\R7.GgA5[Y&9;&L.^PW[dON2M,cYWM4fYe^F?N.f6
M,0f&M,geB5A-5H2+X^4=4A.#/RIODa<DaLe811fb-g&-6Y3fd7<13[_J.R5H.?d
KZ_B_3&2C)9M-RS1Z&IBER^4LNUd5PQ,IQCe-2e]+,W[gH;6,;G&^bf.3Zg-d]J<
AD\7cI>AdP,>)WJTL0(YQOV2[c:)UNbJ>a-#,Z1=GU[,4KXfT<EYH,Q0De<Y^&e3
147OHA^IaBYE6>W2W@1;LJ;I.@Y+DEATR<C=0LceA<MZeK5Q4IT3;?Qdbe0AS4DR
E>bFK&c@M8U:=,EYVLS.a-ZKL]#gY+Ng>b>(N(+U1(c^fJWN^&Ff_H9J7]:.THWU
/8,>,8M5K[898G>R;3/M?\@1aac\)^]IW9+S4XKE>Z=?LZ07[224:#BX,/B:USAf
HKEJ(X@DVX3BE/;M+5++OI7VD6@?a\MPb]Rb_IR-Z[^:_O+4I]3/5E6[WESR&1@7
2F;8Pd9@]TSf^0JG?4#g01[;^AJB299U_=O#BQ6@f^<OQ/B91:@G2O@N#R<WD27S
^F3)f[3@XR52[_AX99/c]G10W2\?RMHePE-)9Q]B+/01[RX-#LV[\6aKEbP;7UPX
?K3;eM+:M8LaDV(H4Q=AOL2>]DRFaG6T].RR+)WWQcZ/U?33JKC1IRD-SJ@SX.4f
(:9O-=6H:d,-MFA72c5Y7[DCbPE/A>XL@D1B_3W:PU&6_:]8f<^#&LaWf2BQKG50
1T)Q]7,2S@,?b4HKMMc#\g-M]2IDBKW388b78(7?+,b@J;6#YJ&g^II?1W0DdAV>
8GDT9<I+CgTIO.7#-;dT/6;VfebGA]_YW&FcVH#g_JZ:DJE8KQeFgSI[<>0/<>fU
(&P](1e30@FgK.?\91H.ZM=a6ZZA/?W_;Wa9b[Lc?R)JIc]F/XB)7)e9;V>b:/Qf
KU-A;;2A#eOGAJBYZPQdJFC@NK0(TN7+6\L9R>5]B?O1QB5?a_7\[&c1<bc2:3e]
)47GH,2-.M:W6f;RAYYM/bO>.f<Y?@0B\T?^LG>dHga:g8D+3.UUQ(aHW:9,\E#-
@d_Y[g&5K:()X>V6X;WCf?)I+aX9;[/0\]&/9W169?G5HcY78Ud[e.B/4M8]BE;1
6M/Y.d:0IZd#5&_50-QKR>0;<::V.UP)+=(YY/0,60\eNbV5?S;eHAEa7gPZRCc^
QPJ&3V1a?PFg&)Eb2>d&<WX278?M,=\c;Y4[,>Z,LKSdJ-,&<GY6/:IEaGLEU5<H
H-@@Re6e<.a5M.ZXUSM)=MHTPP)L3]f4<-7;-CRgaAfQ^#c7gKQDR:aRWbNT5O<+
3ANC1-M,\5f/7<=,4GK)_4@V&(9V\9QeUDZ#MNA7c#B+Qg.+QYX(e^+3E33=7K?Y
STWHPFPBb^eWf43?ER-SV&-I7E8d53df_)P3gBF]<3.F9)>0V]JRE\K.+<57OH>V
f@AG&bBGCNeW]A\]0[)RC>,IH8V4:P6aUbgB5Cb>@BZ56U<U)Q6aQeSS<gO\]bUW
B;=,LDR@],[5TV>WeNY[7BNXF191PR(a^7GQgDIU0IC+Tc5d(FNYY=FJ6G?PZH1-
N\)@Y(IUNGO,2>c]+3.NDNgB#PM8dd?@ceR/4.O7ZT\A.@UH,OXbOPa-,OU.\/]W
HYQ>A3>,HbF?JS-fL:8.7=RX+I)Aa[=C-TF#YZ?HX_f.N57f:):ea8f?02O>&b]<
AYQIH]BL?O:Z(3T,SY0Z-d5EKdV:gTB\9\ce860E8/=3F4(20>O2[,++L7/^W+07
:>TYU8>IFPCZRXg-A]NabL9+H=+FD(Y+OA(bX&U]N8N2QPORc;N0/MQa2_,78-Y;
eC?2c6C49eA\0JD_7S^^KID-204)B&5(,SA?[>c3>QK\UM8ZaQZV_Of7<^@Hd<TY
]Hg-&b(,I^A#3V#,JOF)a9#eFBe50ZK+L?1d3<CGH>TF/T3S;]+0dW?L6U^R+1E?
XS_Qa6X)Z/aH<)dTTQMg1Q<)Sfd]AB&UJZ3dH7Eg?=662-+^c\V3BHJCe\8DY6/E
ML)\7UMNeJ:/Ne4XQHVW=X>1#AFG<_bTT&>4L@)D70UELIR[g@)d18.8TX2TN[.d
3C_T8)75JMF.[IB2V)>TY8SXN4L431d64f9Mf22(7@-\9105U=JB,F.1&9//SOLB
Sb4:Db>M1+Ab=ADB[8T]M(JA=482W\:#73g&]18V5Od&><S+GSeg68gCKAJW0F5]
(TZ\G66ZRFUAbNEA+]N1G-BMfDHe9ZJA8HM_(;]?C@+Z0M#fPJ<94d?\CQL5PTT-
9?D0JHe#3aN>DRIJID-2e-&I5^MY;TO2(FH0aJNQC21Y.RL1AOY?GT8DaR2:SQH+
9b_:X16:=Bdc.8F)Y3&G79f#bU4@.JQ(P0CK\_IIdEW5KUcK==\7)=R@:9V]T,^]
/?YI(L0=#G+&^b<S@)HR?.@+XE@G]1aOGSUg#030_\3L[Y<YDV^>X_E9/0#[>D6G
>37?0[?C)]3L;#Eb(+HbbYHIZNSO[R8?BVGDH0<NMHd=BB]L3NVf5[6@W^Oe/P)?
VRU?B+7AV&._KG9?FD6LDBAQ7Ha#Q.@G_f9>cD7.::XL048VaYOa27c4M7_OR;0K
.A24)@5/+cQ\E9@)&HEV(dD-DaT=R+)QM&LBe7/<O-AB.YC+[O2_9cRK^L8)=,4g
SZU3b_.6aUcg\+E^fC;A;YBKJ4:HV_CN^T\EVf8&G5/a82[@G64FLV=/\BE/b)+Z
aGW8SRWXW=:_4>^EeQGE70J@1FFe:dTIJe+DV6B,/JE@GO[[J[U@^M]ICV6IR>@T
HDK7b,TNQS@:=cB,aZf[=MPE^N-#XB?01(T;,fPf7dbK_OO3^3#a,3@Zd;&=R2Y+
SPMQTL@;8dQW8c8@4T@+e#]AN(Bagb]6L2/WC@8:6TZG\WB]H0\)8,)Y@OJ54VMa
DUW9>\YB:M+YdfK&OEJN@>0M[7Mc0]C>d^fBKf>,:]Wd<YAAG_[09.RaP2@1a7II
6fc?UNF&=3O/^5N#<44R1-;:N;37fBFWCLX-A#5/.S=UG=Q2KYE5Kc2>A>^&gc3U
H/c/P9DSQ3/B^VY&-\[YM(+:12>A[^?fTS1H<2]\@CY.=\9V&:M/]D1UYESg=EV/
#>_OJQ(W7),PYJPJFXZW:&a4@X4Q_?IMG/Nc&HM;9@\\0=6+)7gZOab^:#T5,8[Y
TDd],Xa6&[??4:@_g254X-/)/fT]4E/LLE.&3D/c@dCbF<<7X:>30::43:^2[^E&
8c+]3Y5/J^G<]<Y-]IGb@PYR2LYF2/:CZ#\#2<K0RD(@&<fDO(AdAPG=;=cG8-2I
0\<=JT.b)&c8cC7VV7EBXEP;cJYF2/ZfD9)Sa\[43U8:efPT)cQM,&cg+@DgQU#1
#)T.,KWRCLY:]((@1#D16F3Z8QaSJedfe.^T3HN\,Q9_,:<dWJFIWa27&FF,5]0@
.LP&Ba2;N>_fW_Vb\_8Zg3WdO-4cZ,)+1=#?c5\:\,ZR447]LA&(cO2gI&Y46K/<
[8?gC=+NT43FLbS9S;1HLMPRIXID55Q2SA_d[VdA/JVGRZ^WQF&>4X<ad@VY#a(\
NL3UU\TY]+159,VN2E,5e2KU=),<-Td9#6YX:OWARd<1e,.@fcFVcdKVKb8c5W/c
DZ]f2EQ#O9IZ.VcYA&H3XKN9W^1>NeF_=b/]5FeQ.#a5M]Q:H_/S8UHS=;,RM6.f
?.9+dg5;Ff?^1M?KS2@f^X<cKb8dA)JFf-8<9\Pg5Oa@=dE=^:E(C^U&N#AYW0?4
PMQ=a4dS:I5FKb4<KdgO;>5V<M>;2bHdA<::3EG.-5A]bZ&OI8d3Q:gI6OFH15Z>
H,-eAR+G@^0#?[-09M_SA@]D@N0a;9<L_b^<VZ3<FfAa]SNbDc.)Z@:1^e7V_3M7
e9D,13@S;CY>8E@8A&Q)VY[C_&/:AFC_3fBGP)ATcXE2//1Z[WEg6QBK>C\.]R=?
BO+=ec:SJOQG61S021S;QRca_eB-:FBV\BLZ+\YB[?P\-4+HT4fV-OF=(9BcH0Gg
?4dR1G5K:Fd1)baI9\X,^F(TW03_^OHIDZQ+7#3;H&#Z]-J@PSfE;3256>5(Q/QQ
5b<^fTg8dNaO@UB.;5<I=GDK;(P8G:^G86HC[cZ.Q<_VfH1K[W:YYQcSY6T.EJH(
0#X7J;T.^H6YM_T#BZ()S&^WTb?>LgRWQ=)?Q]QFWdYKRPI9-I#I.4;O#KGCEdZ<
N0,VcC\-2VB]/;[L+O6XXgE6.]MZ.X7>b[&^BaZVbY]^bG9RWSVTD\e(B?XENc@_
]7SAdE2?#<96L4=M.+U,:\NV63MA7N1KSCfTH[6b(,\V6NG(a7PcH81<^JTO;+7;
5RED0K#Z.2:C]\[V+B)\cZ:S8IB^&c(^SD5RdJJ-GU7]7@@\\RYKg0W;F&=9]SY+
X(SObTK,d-b52e/H,-E8>LK>MG2YR,2.Y:Bb@)&@?B1Tdg^>C;U\/:4T)3L&8FC=
aS??5c=848EgV[L^.P#gCRO>^ROZLV8IAWO:ff&)?\C,d-2(+90E#@Yff&?B.:L-
6(0IJ7LW3(^aWNIBVN=?BfX.M866B/Za\bVCbb6>/[0+Uf-\)C22a=F7bf)M]3W]
)J+OY97Rd,X=8,G<OC@-031[E+fP<;OK[YR^+T>gBV\QF)[<g,b69RNcbA#T<beX
aFa,6gH=Z-N]fTSW^=LD2A/7fE&>a4ODAd>K-5e@8J<^+IJeNC3\[YHe.^XJQXN5
,5SNJ:cT>O6_49;#]HOW./X#&DZ5RC(d7>Yed4JMH<5&S]NWDYb9)c\O.[bE8YZ_
GR\b?a/;=K0gIHULd7E>I9dR\EbM:=#S#cT(^4ed0JL3G3AL#?.E<NS._(PdJA-N
:BAYP]R23T1fQM6C>bBP><X2c[X>?@#)>Q#=]2fX(P8\[<LG,GcAeaB>S^dTQ)UY
B&6e#(U=>1@N[^9OgLEfUfgZdB3I;OH&Adg.9X8ECAGeVEWa4a;A?N.J^PCZ7=S\
f_^_<>^2c\ge)@1J&AdQP2X.I/S5EeE9_#0;Y4aZdgEV+;3<XK<=A;L?^J^^S2?/
Y_b.I1>OEGMB.X6.L7e,^fLWU:?YSBTIc7f8U86?/f=;b=OC,UcGT[J<dRf)>7DN
AJ.Tb8=YH9+[e04=Q#W)5^3@^]>6]/DJK8)e?Z53Q1dA:-1HFII;91[X5A2HX6A2
ZSQ=@d,B08.(3T#eZ&-6+M4@P;/-I]b8G(##(\_^ACB,SI:I.K7Z;OJ-XF(1OAY>
Bd>(eYK3O>)/O^<g,T,.Q,b;[IRbJAb<\W.(7EgBc#Q9#Mf;=;2eCcGN/2Ge6H];
ZX_17YL2NKc(U2@c8Z93?.>Wa@J^NW>=E2>PGe)-aWF:,B,3?-7_G8\F^(YK?>QG
^E,OP=aMc9AN]Y-9f#A1Oe7JN(g&QFHU;5?1>bM6U4Kf0X&1PWeE-9S4UU<EX>P1
&2b6/WH3M5b.:+a&\YCC2bXEc#4/2#S^B(Z6b:X;g[+:5R_;KS#SVP@,V2/1,Za[
X<OXLYVHEF]6FE,R=@S_8<K9LBR5V:a+Y./80:g9S[J_I@QT4H2L)Q.HUNH>cO5O
-J=^XTLcDe1EY-LN,]^D]UbXd91W>81\_?O#E0]]^9/aXQUYBXQ6MU@4fb1E,2TW
bdfdIEBZ91.\bcCc^La;,5Lf76CF#.9T0PV(H/7ORF,0F70VBXZ5+,J\]&3_1VT,
SPbFEVLQ3>bQS)Q5]e@JE_bH2?OgMf]Ib/AFNK6[OO;=gLI]4OSLf(=:+R03X;HY
:E7XfTUSD8F4@>]>.Y,P7@(8<#(=J<]IR_e\P6?0gXR2A-U=K3Q@Je#1P/1+?8VD
.LBWSa);/8[)c8_S@UZaJ?dd5QR-1[U>55fY/+6W+a=cL./#9b)_NZdG][7fFO1:
]#2FQIa/_>Hg.B30Y\F@8e.J,\(#J(Zd<XL8&\dI.RN4@<WgOTJ;\L?O=dD2_H/L
&WR^_.^.HBWfc<8ZICCOK7\Q^-+<(C/;c79DY>feFUMEYcY53Tga/aPF-gc42C=b
^+bOf3aSU@MX#Abf/ecM<\P\9WPZ95=I)gIVF51R,=.G>\@<]6;.cb8U-M[QWZgQ
1bfRT@Pcd8U3]9^KO(d3[H24#6-T8@F,HC](H+[TeBcW-@HIM1Zfb31L)bfZJV[U
.2OWT3Y.gQ,JU.)<@&ZGb][b?-SR#]FD]XPe0D29PN_W?^8Yg-TfU#C,@T?O^^+7
IJKPDdZc)V15>&/-db&&_IS8gL3B(YB>Ga6GGNU=O>T8g48G6c8@YdOZJHY+c[e<
/6-Ha37MN[^Y]?:.-FD,P>1S2bLK,e8#_NLN7R9P97&SDK&;:J<@A,79&YIF^KPX
).Z1fB_SKQT>dcQgcb)fGbQ1]]Ag;=a]U/6TKD.J&8VX-BZ7M2S-<+gJMR#f8e>7
X;:7=J:3JZc]&L][2MQH\1CcTDZ@S08<Pe&,AC=Q^T6=X]#]V_gJUA^)>2E,Uf;@
1220M/,1TA>2XM+f3(F3LdE.L_aFeT.KY2fagU]EL//Xcdg1@8>XVCX1aE8Ub3bb
aO[\-[MC/;RF\8E+V;gTQ:^5Pa=8:#=#1E8(a(b<JNH,,>G]gdT26D98Zg8a]4W@
STC][\H&,EOLQN3)bJ5&5+7e3IGR,./@.KMPbGfS[O+>D;fT.YVQI+3F3+LO>5);
665SGKK347^/I,c<1f-gOKI\f/B<A@FNBS:bDgX#;9X3f^5W)&V(IF=g(g,:=8EK
+W(4\-<2dUae9d56EXU94e+.OU&MI?KcIT4(\A(GMbdW-\Q6FOe7B;(PJ7]83aAd
6&+9aP:YFd.#F;_HROHD,Fc&NPD(3ITEAB621Q@8_WK#+\Na:8R483)H5AX\Q<1C
Q?UW324Z?f^e5(D6?Y]G(c]fP6BKD[EW:=A>BI3V-3NR/_7U#VYf]G]^?Ufd[8,c
00a)bFd-\1Q3\7V,S?)HK^@1aM2S.R:-YQS:UfUT2cBW-HdH@I77CC[PAZb3,e-?
WIVf3V&3IU)PM0S(0I#P:f]8C_T8gG8X<HYdL8+.@PEX,gTP3H5#2&_SRGd@69TF
b(&5@2cW1NW;Be8-6Q;G7W8:LBMEU+da;f]<ILST2^9QIe/EJ-BgN^_^:<V0JH(_
UIQJ4I\>.F7O/7311WZdGeN76/_R&]@\D2A3=@H-J,Ke^Sc>;8(08TK)5TKeSGd;
3Db;#e^&(f44G&+^7@^?PHZ1=;NL<9Y_c:/g>7e3e,VAR7;6O]&?RWA)M(4Bd=Mg
&DcO=@PGAe5/A2Z#OYT3^BNEa0W)@62Z_.@=aB58_A#5PJJ\:,HfeF;d<7LK&G(^
OC80U_554?;=)W>/PC#K][6770=H7WVPESZ,TAT5IRd/Q8?M\deU4<F;M/3^Q>K/
DF2H2]^IcHT@6^bf>#IU6[bG8+8d\R_Y,BD\T^JdD/+UZTF=YHXe>^V9IU:+E?0O
/3[^E?gdg@^7J&5\6TGB+BT@4BA0SZ?63[>RGTJ>)T:&eJ;8V/PV\f/-eQ@7g2JZ
K\7XXJTNO99@]^[..\CDD21LeRf2I/E?^=Le+9^?_46GJ8)VX>7;gY+P#?P5eVD>
:YLZcAM.40)4MZ?f^N]+U[Gb_fAe](bJ?N?[LT-CB78[E<THEO[2S3A)DC<;f0H=
470AJd)D[5+YGBW)0L(C3RK[D0782GH<Y(MF7YP\/)0,U&eZbESI9cb,[08XQcRT
We-A<aQWe4I[8dJD3GY&5gH-=\G:93H;8#_3(Y5QTEeS1CNV6:bPYfI,0,6-JQ/)
RBFf#)GU2#AR<JS4?9TN_K^=_USK1A)D&1PEQa>/VbZ&3.=<Pd<cMK7-g>LZ]Yc1
:895&I(]d7C<I9X[-_Y300P,=(7+=>XZS/7_=X,0BfGb/L42\GM,)c127GP(H.Uc
TEWPBI)VbSTWA:-?TY(bb/)X4=fT/]]^[9F[f1M[#7[7-4[B_6b88UCUT?YXER+\
86[41((:.4LEDZ6<5YE6,7(LA6[+Xb1Ie0b]eFXPKS3K?S,dd76U/:P2W8G]b5[\
DS#4^#B1_>2Ddf-;^/I&cgR^ECUg1;N.PNODI\D&+RRcB>)XOD[5-E(S+<7J-P,8
#MX([5N3(K:Qa5Lb7bdXRWEe>eDR0X@6M.Z/=^Qb<XDg=#eMZ\7P)a\5CV9Z+-PH
=b34_EYBXf=a^,DgH1dg&P:2[eNFDQM\Y.GIUPR[.\c-gfO\+M1M3aG#UWN@MH4+
OJ@V)OEYTS:<ZS^W37:&2SHGMW(\R:]-+2SbLJ/6d[Ve\g1ST65(?c+Z&AC+15[C
[Z2&CZI;=#D_QNA[NKf8<<TV4>Kc1GQ9>K,GEVVXX_<?#>C\=e_YA[YTfc6cR/X3
?ZHL\&PN?LZ3?E_,d@aQQ>#XO=K>U9I:=(GY.GNY?/OV(WZN7Dg1.?+=#/F(_J=T
.?cNKM3Y8aP?+8a^,b:3L?Oa#@_FX>#5VdH_1BaJ99C>=+M;EDc-\I:AAMMG&T6R
1:CUU0&Ec6aH0KbZ#ce4@U9BN3U?WMQ:f:+=^DDA>Z2;a1=TI0D2W7KRNFFC@e<_
7BB6Y5bA2#1;F[FSYJ^4eBY)=5U?/Q5((OHdM,&?R]KMg/S)&>8ZcU=(O5\g;B1)
Za9IW=WW9VN#.80_\NccH,:&.8&U:bUIZ.?VJBN1V1&]@[QSALU>H#Xgf44HDcbg
d18W4<;_2ddB^<PLOWM(<P8C:MT<SY-V=TS90UC9K#=JJ3:YK^dgH2OE35QZNS?I
4EE,TK^Z+c9W6;:Xfc?N>ebZLaFX&fe&;L09RD&\Fb#(8U3L?DB=O^XWE/0X#0eK
X6b8OI3C(MAdgUM.>.:\GEg12)MB#e35=a6;Cb&CL5J;cD^_#54]>42.C(&2O<^/
->W>=c9/5P[AaS5D&L;B5fEBS=8WJ.:f=EZ9N(6IW.-@#IeMB\BO./1f68>[FHJ\
N9dP@aC@<cb]6KNE:;O_[96_-0I_:gd;L(YcCT6+d,Od]QBL@2>#38<Yf]V6QBH7
fJ#C@6:.N4XC;)/WK7c^fG@Ed6SPWY+_O>R8FDXO?TYB?MVN+9#Z-&0J,)=gg-Eg
20<[cC&<29,>cYd&M,6>T>9#ZQBJ_769e\L_R;:=cDJB8\84EM)<:#[/5IW9T@aH
2J)L_>ZTW=f7g,a+01A.5Rd6-Q#9bQC1U/EGd^:X([Y7GX&b88RTA,5/9Q2,,>#]
N_88V-Q+<0G:^FJUKK#^H#WU8?:gP&B_HaA?@R1N1d66aHff,VHdI2)G6X>+G1Q_
&gT=dFc,V0aQ0TS@B60bXP</,)^CD-D0X.MN6fc^1Q[.F.[V[A(6e/L[TCO>Yf1N
\P.6#d:\KNQA+_MJ9+SET&J2-EI)<\-J,SQb[1gRKa:TfNYOX53?QE[#UV1,5F+:
9@&2)4)a/I;F:QK20/:1gf+D&9.:.VP_GJ2M=fX0)IDN-#F^/H+8M1VVGHd&g9RS
dbA@1KZSLBfIQ,N+_E&+KK^4).,Xg5Z]ZC1(0Rb6f_QC9NZ+H)=N00AZM^L\fPDT
P;=\)bPG7V#4N7f)2];NF7JH6>A3[6UaUNd>@O\OQR#<>@/V)@V#?f/^KLeI58_a
Z+fg331?SOXL>.]-gA4S==;E]Wb)8fGN7KG(-0I0#e,(>HSX4\S(,^4J2//93@e2
:>1WfW:&V_;Z#9&];Q\0f?DF?;ANXOYB4ZUd_LY_1P,d]&B<;&/?=\M@bKA3SMSQ
)\bJ>YE09>R<((Q(AegQEF^HU=F^W[O6)2-4CKS._.[FM@fMJ],LS:SE/O9]L-T.
=/C@,>A^JM<?EP@09+B0C-JI5\bgd?C8U83T:NQ5M+YJM1+1W)[WZN9Y\B1F+gXf
<]H<I3dMLR@=gL]b_2;=7\aH28DI#.I)4X;1M#+#DdcKb0aBe.Tg.O+CNfN#EVM=
0c;F\^MdGWHWaYXab089QP8gH.3GCe>KJ8KY+DLAa(K(\+;C?3#HM?K6H1>&eD4N
6MZ_GR7P[S^N1NLI730A51^<Ec_-96IGG5]PB^e&BU5.I^98(]63a,+6df9SDgW(
&dgZTUBFY>12U&fST(3gI8G:;X2J;?dc18;G@+?OTG=HC?Gad_O:f1KHM+IZ4@HP
?dENNaE9#F7?NH_&PGc_@&Eg^\IGYJ_#Q+gB+5J9]d)]IJCEXI3C+9.Lec3R5GBC
Hb3Vg9.f6\&[+g+5B\:Y6]eNF0^P1>8A1Q(]Nb,B:EJ&\RKEE^F+-=96KbQU8&U8
?C1]\18eSI+F2Ra98EGa)35R:FbNWU9VDO>6gB4dUB+]a,DCC0SFbZ_;JER3/X_G
&98-Y@?b(M4#E6M>#a34[?&];PRE-1#UA2)cAW[E<YGL6;9L-^#bW>(TL=8&c/)d
eVg;a[9bgS2f@6^DJF_DFT97HL>0/^;+S07/OEf,@JfgVNaN;0QE;)3V;SP^?Y\]
B^.G^<XLLA0Ud>M4S@#0\TKbKD#8DVeaF2&cY>MP2@0,ODWVUOWfaLFX9KH0N;QO
e04dT=H274\\DQ:HCDX=1#fY.CTOcR0+IMP..L8C?e9D]MFH7775]Z?&-g.(E[da
;W4fZ,L9>b4&:N+e7ZH4DPd/8:gJc>>WT)f,6Y(Y3>?aHX@,:5//[+Va5bY9W6<,
S:f,E>@A]ag9/^<UI8M=dc=T[ZW(:N)cEcIbMgUR[a.3adO<UdB.>GDP/7Yb>921
HdG\2W0M7OCCAG,\Oa=fF=-e=7CP2AB^+=8.d?#SIW&F0fb152AB#]3-d=<H,GcQ
dHa^;[>@CH:_;cSU-0#1_#:MZcWHVG)6C,C[CDN3W8A=aba@8+8]6#1T=8E/S+<e
K&9L&OMb@+Q)NSOa+GTYZ@)[eX72-CC;:DIZP\aE)I3.[La8=W<N.D0&EFR,<J:6
5d.9M)d@A^Zg,,QHWHe^<N?C,Q#ZdS(<E>R;YVJ@:[USf.;E8&&77TJ;4RZbRA-(
27UH.Q4KFF+GXB?ENA6TK1O4LA3=[-WQ@aG[6\CcORQ8KX?;IN?-FfP@F#N2H2\_
NG#)6E64XSO2S&gCYU7#DKP_R)I41fU+c?e?ecWE6=PC=LfZM+G=K1>Rb,51R]Zd
.L:dfD:/]+Z4P=<3c3W5L,5P\5DPX6#-6>W(<->7^#Ab2d.&H)HJK?I\3SID/TbI
&,8gE]DEaI,,4C40,-NV#KUKS5:Qd/ZHKZGffE?LX<bI&-]C+QEJ#35=L1dW,dG3
DP[-#9#\)[UWXcKACf;MM\a7,:cGWX<Ng-5&L[5TEQM7EEE8?RBE#ZZ,6<65Ef,J
O/PT8c.8LO:=-<)\&2N/811_cf0e&&2+>X5\LJGO14>E(@M#?-7e(07F]5(=#bD:
#&QFG(a<1KR#PVBV,5/7SP1\JRIS+g)c^/L<,H9584O=EN=^1f&-_R,8>0O](K,5
7^72Z?91a8&aE2)+2;-)S#U?fWO\,H8MX=+DL>2MRP64#f4R2[K8H@QH0MO:P;LQ
LN??M=MUHAcR3<Jc&][^;f,Mf:Z<:A^@PMIR5eVf_7)[+>Ib9Z/4>]R4OFAQAcJD
Z.Kd.8E85cIU0Y:)TI&f<GX1T=fL\JfY9JDR]R]-V4#I]HU<e7_UV?<UC_;CHS3L
@f5\S8DD2T?[?+c92P.L57)Q]G3097GVJEWRIPQKG^U]VP\(9T/746(1XTLD3CBL
^W5cBg[^A_eVbA@@+ZH?ZgUCCCJUV;J<0BLTKXc,=CA#8LWOV3W-9YYZC?BR#FJ;
AdO1WfN@@INZ0A9TYV,OSg,L6TJWcLMYQ/[WAO<)M@FK^@DZS:dI_=>b5cYU6VDb
>C-P-7a:7ZcBW@Y20:DB?fL_,E=N9IeO>X3YLX3U)QLXLMVXda8Ud=a2WZDgPdZ5
G8Z\_VX(Dg5TM9b]5KA:^2)>L_&VC<c;3DC3UKVYffW_<T.SI=^9d8^Ze(6-,AO>
98DU]9B>;7BDZM(2+=2O1?EL@XSM0f9DYII?))K7+&:e;WX[OVBAY/U5L7NR3.;Q
9D5b(<#<SfK6,BC]c=ZCLeg.G/0Xd/5aRDecBQN;#Lb?(2@5\R[J&^Nd>K?^K80[
SQ>61.[ee<E^fK6eKgV[DL/)g<V.4Be7?ScY6KPVcQ2+>E?NJ>(GCBHW::\a&#U8
fWbcYRE,^4S:+,ESeE9e;C/HG5O1G?H.HOf<:c&V1,#X(3[5<PfRTUN?UY1O3&/8
3/;a\-CJ0(@SDH1a\P049:81>BK9Q6,LL?6I@1GK57fFZGD_FS976N^gc2A>C\Fc
_&W6,-_#FZ5\08MRR2R/5H>Z#V(d-1FRV<@]?Mg+fEO8QT/6SGY[<7Bf<0=#4a#;
f@8b0^Q_OBbFbZU#=,]SJ1Mf7c&>EHU]fMg9AJGUB0dO_fHK1WaMOD;BF9^(#9>J
_C-J2>g;J]B,T/#ZDH0<@CBP7eDgg2IH&P3Ccg4CM65OSNbbB45Q322_f^bJ)+C]
AaD\3ZY-7Y05[;c;4&+FD6#a-,8&K?)K>NU#;Zb=K4Cc4V(8eS#g(/QC=c?Z_0#6
C0PC:e_J-^-6LXO\>ULLM_P@@62c12Y2G;\G2OBGB+J-ScdJC^WKf+9WFdYcON<3
f.B9M<Z@e)Ad+<97_f6g3W<=6&UU&&IKKA.dI,A-O+J_W?7e.?Q.89?9M#+/N#>0
A\\C);_CS+eX:C>g)+bM1:8@Z_^3IS>B(_/JDIW(OP,?>R9e+e)T=59;+KZX.2NF
CQ,6=B:N6E:E^].Sa^gZ6b:9RbBBae83L7NZA3a^@,V4dSD@-F?A1G32H+5X/)fO
/\f3R.)aS@,B04NPaJ4PC_,=\fA3ggSPWP=aHdY)6V&aW\6R#@;Q^E2GL)LI>NI4
^AV81-=75LSY-6>Z1WH/D29/&+:?[0I7T95a7RQZ9dbMR:f:@CZC/]#^FZTN@O2>
Ya<P<f.f+CE4M\H52->EUDLC@\@#b@JVZ=7aJFZ5GIGg)e]SeYC82@Z4CW27,@D-
E4HK>e,Y:8P2?QTBFDN&??6&b/C&^IB>+Z_BW.aW>0B@AMfAPN0J^,+c\CaWf9[5
AfE;&Zc]B>7EbV6BFGB1T-8_e37+e?XCLI52AFM4bF8Z:)/6=73&U9F;#07CeD[-
)+J)=\;d/eZFL4X<EQO_OO>N[@U&?H7<#:Gd+H+]N0H9@1=baXZ9@IQXS#5GC0?3
bF>@3\L)1^1d<2IUG+_g7:\F^O9Y?,\PY5HK.#PEc:b6gW\:NB_WZ<,5A]5aUV(Z
LgO<9\3MFV88(I5,EbD,+Jcg#g^O;])(@NZ+e>FYY2M)NJd3\^@9:6b8)7_C;+Ha
=B&Ga#7DHH2AFM-b]]]4G(f3XAQ?UM1#>C9-[1&5DS4cZRbS][J>?3^D/YJ8G@T-
d3NPHI++?P)eH5P1_)5a[GFWGAB@OQJ^0P[J?Cg3?G<a_H#:JQ;\35__/gMNRMa3
Q&.GBBJgWGXaVL6Y[W>(NF0KP3PSgW<K[Gd6[&-O#eegGL-aVQD&G?EZW/?3Pd4S
BE2I)7-[)HdMAcAabDDV+9P)#POA?1aVgGY?a1e@GBbV#fI2]D\WDW-VIF6)FUdZ
:OC4[6c6(F9dB+)H1?SQ(#F[4DL\PDc#gNRZ@QO1@P?3D_9=Ta\9O:;8D0Kb3b/5
6\S.C;3?QUIbP?YJYVC0.\D[W[2KDLWgYEY18&9:Zc^/ML,I\NF-8.N#=I47[A9b
\/B(<U@1F2-5#PE=[(K6Q_#GX^0PMRa?/@5#2O]N4H_?]NUGKeJ6Cf:gGG8JbAW2
M/L-+0JaVKW5]GTI2#G-&,#?:5RaX/1TZU0V6IT:Qf<LC^<g?b@7NCI8Q1c+&=M)
+N#9@(8H8Q#6^=:-7Q+OSHeQ70D/J]f6,[@,/ID[NME>EUZ=;[THG9)eP1ZfU8Z(
aY:^ZP3#cV(dL8<R0L->NCC8S]D.XD+P=+3,.GWK46].9-+3XPa+dY#^eG<dX3+,
DaM#V@6Y?ZDYY(17W(IA<9febYCe2Ld9O(^d],d#fL9=HIPBgdY4gD7E[LT85:-A
/TI:a<YVQ0>c.Q5S[@.[I^a6_1e_@01AK/MbTIBaPXa-859;50cD+CM6HfV[S@S;
F22IU4fWd5Z/A#?F?EGN(g]T[8Q+aKT.YP92(O>N.\-&R4P7(4\K_WMfD/0)_bY1
MU[+Y57]8[U#dgC#L=OdMb3IK2_3g4Y\J3:Ad8BSFMg_/aYbENXda_:-QYXK]EO_
\><=MMAM>d]C&V2+G/PcDL[S1ZP^I]e5+?:I03#P5S]cUO<1PDQRI[8FTWYd1:\V
3[]I9\(MYgLLeBb<Y5K:VD?F)G:GS.C.EQc)[6,=WaBYR?]X?B\RXagJY9>&/]3O
+g3U)QROLQ+>?DOAWLeaeEZGGc.\.(-6(YbBO)HPV:5.Ze>0P:\TGMaSC[EHYa:@
Y<eUKF1gVcZJ\4=XD-dcbM2U[Q=5D@:aX7RfUW8?0=F4&&A4X#?dJ73T0RORf)\;
)d\0ET:>(ba)TD_A8<e3YTfQA\P/MUWAU(Q[&5(aMH>,-C\BO@71NR)O54f3b051
=UA>[5T=R8>CPR[P/,Z7Za,\I3QLU^A^L]BNR)9Sa?3B[c>PfF_+/b1IF-O,A?,W
6R@THRNT.-9CC2W5cbdVK2Tf2)O)Yb2f;2a6gB(dTI>O.&=HB+D:A&D8T;A&@GgT
Q<LCEJJdc(Q0#F&\?=UPbX)NKR(eb4L(UCQX[CRE;-bHadVaLG2GNX583Oe<a.&+
^7=/AGWX2ZV=B,5M42+3.-W92+LN;T,^R^ZSX#C-15C2M@>]#V+3+gQ>0ASJ0dYL
eQ<>5/@BV+L1HA^C.^YY_bC.b>@XOA]>R#>BZE7-@@.QD5DXA\.cWF[DMBDfI=<_
>9+f:QDW_OO=8LFENFZ/H:0RfEUK?)(?O_C)=[1F(=#);>@IBT4XQCZ&B&\G;b_U
AQ,8\f.5AXI1Y[N[U4G6#AP,Q)F5/I=A@WHNM?,D9bDD3b/5VP#^@gX85@X<^>L9
f.<NV<R#=HM4YD3R0ZH?cgf/>gOZF<G5UNYZeN5OQ?46X)H@-.f@O,(R+f/K,U<X
<TM90,T?J2(/0HND?gL.(\V]<:#^^UP48cU1<a+S6-aCVH1Ob7S(U\.3.I&^Z@F[
[EA.#B@:I188F##b[D^9LYWS(7AGXcBVF<H#./]X0L+6490\>9ZBZN6PP?T\@7.P
_Gf0/ZR=g^Ld9#c7(E4QaR5;NX\>JbOZa[(1\@P.9HS8K;:\5=SLd&+.L-:,X@[g
)<#fb(R3Fc/LP5dSO]c1E/<[833J5T7QJ3\b;,&K?Oe7,RO/c+P9-Q(CJ-&IWC_E
@4TcBGU?0KHEQ=.+TfS<GfgbV6_?@d\fBI#)X3N)VB2E),N6G^e)8^PNK^9MT45A
b]/Od#M:.8fURC8ZI29KFW2@TfWN0a&NaB6Y]dL=aH?YD)#Z8.#^4.Vfe@R,T8\8
FZ?1#IH6B7]#DI#6N,bI_O_@f\;)7]e4UJW#QcV#7TTS+1\-ZHYYZ_gE5OR\?eL6
,_+;&(:C_),4_5c?Ng&P^?M\a_RPR355Z#PG37?XDS?E]8QHKRELSPMH(fb8\D6N
](YbS+ePZ(B33eV6+>UL83R=8L42[F]L8\SC8-.cBUZ<]1P&->)]48B[R]GVYYE#
-70RC&+6:?B?SLNP[OT(?;W)]^AeBRfc&/@[P@0@^[@;A9#cJ3AT<CE2:[?/7V\+
@QGZM\0.R0cJ#7c35eY>]JD659NGQZ&E&0<0+VR)LS5@IH8fAK>)d+MH[ZVW3JAM
#V&HNMX&J<U.Z>d:TDTFPE]GBZYQb_RL2C-.I]1RHKN\AWY=/;[6>d>Y4-WVEM[4
4_UB14U2W+9<>+;IRX7K69e@XBXbO.;;T3Uc9A1a1[DT/S@NfWURLfH.K<.SU\gX
.9_/G686CO6;/Xa#I8@V<NBSVK7a;E)ZG(3[PKa<HdJbH&4)K:GY@K/30a2+^908
gK]A8X9=4VR[eF@.)F_=6Jc6UPX,1P;[7;71(?#T<(1&B?OCBMQN/+PfQ#;THYXW
ZeKEOF+(,X+IX+VdIGf\eZRc:)LUY#cAUVMdG)0dA[EVLcIbbO8&?U8e&[C?_\AH
8D#T06;Y.EVU+S]c/g&U(WbW#V8\:Y#de0dG7cS0_&_?LcTWgEW&K?-QM6V;cN4P
9A&O?;V(HY/MG05O>?:2K,e?SUbU&>@]0OVP=bed1[Sg,=BfZ+ac]<ZQ3J6E?)<V
F2>+A^>9N]H4(Md,M/?-a:+e\<A10aS;L05M<XaVFaY&\7\W9M(#48O1PEGaG4X>
3JU<UZa[P1>9\;?=28d8P@N57&TL&&VXEG[HX>&_HB<<0;&;QaN,ORa?>Xb>cW3R
3_gIgb>(E#(UTO].\9PV39T:9L44X2/[&XfS/WA60(-4HZMU-T[B,X;YMb)^4bEL
=aG;^G@U9[LJg3EGD(6M@1WK8fJ=PbIdWPE/BPW521\6#I6=T_N[B]G:+OXVV4NV
X126AYd<6S.21E\?aT:XG9/C#WO,5.S#2d2#_e<<DfI?EI/TNUdYOAf<QHC=[g+?
X/,1d)KZ/NJ:_aY5:5)ebYC90:0cIQZgaUE(<B<9>b(a(D_f-a#PE]<)C;H2#9#U
#?b7g<J@9P82^>K&BW@#QDc0g=B7O<+F#WMMNU_Xf=1(aY+XfX2c\EET6[V;7b_I
N/DU(f^)6C0/3.7G8:C)eE@1+HQ^S+^>>9,0IB[(a:XGTF8g#X,2</f/>:D??gTU
9&bfIZfI>\>YCY55[MT1UA5&Ug#FSULe?;)a6TZ#/Z?OPR@;HcI<:5/>-=(([CG0
M96fR3FXL6e?LS[M0R]7f(NZS\9X]YS)cU?KN/<U461cCfGf#]HU]7gJ/KbS22VC
>?E^3-[b)9[:R8;Z+&?(3W<^\d+#6@:;/J;R/59>+AH]RR-<8L8A6@DCLWaF=^L>
LX<Ce1^eC=MI=<,_P0QXSA/0Y-2(=0N0-b7CNMaa;S^,0_^a3EgPOC#c0YI3bDP=
Q>WY;C=TdARA=<=>ZCg9Fe.B^5UVO.cSD<5Og^,G.X+f_FJ9E.Y+-6\cI<-]P#;,
]dU9I:Bb23FJ:.c<dAG>.MV+7Y1@28Q,K52MYBJ<A402f8aSERGXCJQE/EcYWS<A
6PUd>:3S(3)ef]Ma94F^g]WM^7TFEX0dF_4fUU==eU\CRLWC9XGT_KONUe^BGBSO
@,[1Z#J]g2><>b.SG&,NcO]g..:8B#?84<+]Pb6/_JFP]@6Nb9,a@L#<-a><.,3L
13\);^IX.X09D7c01P,dbQB/;QP52CSb2GT1RFN:BZ0S\62&c>?Za<N]McaP>3ZZ
72<4B0CC-J4095OeF0(d=X5IMX1N#WNc4<c:6+D+bd8f0C:<.9(G4:W7\BEL>M^V
.eP;D.F\^)PUMPZPN[-BBERgXLfHK6C:L^FG(I?JKIS(:2]66YU6NeN@If8,^4Dc
Z^:RLVW3L9bB_+=VS9/cdFKb/0g@NM^H0BObf)3QNF&a(/f75DeKF4c\UQR-I)ad
L<YZ8FF6Bd?#5/?RE;.5e[[ZM6(73FV<NU#S<5U=4,3RG43gNaL#3Z_]93B2Jd)]
E4B,bH+V8gR(0^ICZ:@PCHa3g[c0&]gI5;4?RRE[g;S&<?X1(<3(<W5T5#<Z5e^c
@_JSc,A&GTGeG@,NLZI3;F\IHTg=c.TU;B_[,+e>\MAT8LVKJF;7RC0(A,fZNV&9
<\1#42[d9D//+a6GZC,cH&ebK+@ZZ#NA8GXI-7fT74b#EdA,6-2CVB,U&a/C(J]Y
?Icb&:(6)/URAV+BS&D#?P0N<Wb0>aP(P(&:\UZS9\H1TEXH;9)]W^Z^]6gPfSb?
;=4Y@PFU:P0IbGH1^[AY?&VNV_c^9N1>\KBe)JMdQ(1/O]OOXB<ZQc/G6M9RMd4H
K23QO,e+(W/c,_T=P1LX_@,7b1<79R-b7)XdFc1bW_N;P[9,E@#7TN^#RW.;V99S
)BU,Y\cKZc5eZ^#a>9]1&f(U#0\\,GGMDJLQ/S_N7=,eAZN4&QfCL+D:FXQ9[.<C
T>e[4&UWX?#?Z-)ZK/JAN7(20E_1MMAbSH5RR<@35f\=P^cUVG8BNYS&^EcBgM8W
G6L3HdA-Ec)W_9&2I+cDG9Mg&WgX576[M@dSKDXSS.23=J1g5Ue;BKLTAK9Q7?>D
,BL_DE#^\Sb6&JRN8SQ4eb79e<BKXVJd4O^]N/<313XgY;(de:6:0==9M7R.6?(9
5-:4Ge<>>@2GKf6ISEG/@ACaX2<5,F3M2/5.:T>-A<Q[e0#[V_A25O2)+#,7F0+4
B#?VP;fYgM3e-L>/DA=)4LW3<E^:\YdP>(>(J;LX;Jb>UgNCUXgB>[-Xc;b,,)XN
9#4gF;4>2fgCZcJ\BBCLRfML=/M4:-(1+?4D,gQR-U/]_J(3[@J)S93R^9<TLfX)
RD_AG&T,e.(Ac7-Yc&9&8+U/)-SJ2TJXL4::+aG+X/?a+H;AcDc>WbMIU5d:FRNQ
3]Y^R<YQY2.\Gf8b.?cHPE8&,3gZ[02UVL6I,E+=AL,95c_-H[:aEZ:HG#Z10O7@
4/fVRCW3G.RK#V1?U5\dE[^S3<>2LY3U3WYbd/KG#QDPUEZC<XOP:QK<T/-3&&fA
_)bKbEF[dM@KbWCX#GTIX65ZM(ZZMLeeHSWJA:Z6f/a#GNBQe[&(,MMCF?97DfXa
NM1[)Y&5@_P<99Sb@40GNY^30A>ZBE_N(+2+D=6?4?)^VV6LE<+9+^]+D7?c5JdK
9-Q(1#@\9VGRBKFe&#^P>:a/d&Y@;g4/]K4/_4W(OE3)QK5,gL_16bY==/;F>6BP
c,488<33Kg2[0,RCP5DU_X7W@3d-dd6DA<)RP],.[VN=K0eSfL+D36M#U-MOASX:
<ZR\GXVU#?@]^@TRgd]Q,FFfUUU32?C5,9U-EU^/8Lb=eHH+0&ZP_06b&8a#[?YB
M.3B)f>)A,RDNDf&-2[d?38f+E;4;Y5U;,S>;W\_103MKHUC]7QQ.fedP@[g#F/Y
2L@d=ON<^D>TcHQEO](?GeRR:^3T>9&,XG_P.IUK\XZcN5W[2fX+g1f6bX2#)56W
bggDeH4GUA<D0=N_.G./NPC<OH=_CGb>4-)F\S4IOR:?_,RFU>d9KGA29H6DTbQP
9R[KG5)+JDcdTD1:g7,eBgS_S]9TfcSZRF3@d+RI;M3>f&/P1TVOIb#f^NAM[OOd
27+PbJ:NR#Oe-F&Bb2LLV6(0U[+W#fa/YfIQ5d0d0R7Z,Q()8?H))<@N31&\d;#W
C,/QR8EFNWL+C_4#TdV]7+IUEFf17g&fCI4==3_@I5-.Z)&MG>:g35P>DI+#5)bF
b8I[CT<D>O2MEf94)gZ0\O8ScK8)2=Eb@SfM,=5KY1P@eOW,dZC3bN)bEcdN<.ZC
+B=Z9Y&D37-aaa-PeQWJMb]?P>LR(0=#FLb:Cf8@)ZWVcfM&)HdW=9Z#A-7B5+_#
<cKRM3429eV>eC9Y4>E(K&@bMAW]WIQccM;SHO,;5J)3M[#O?56B&W7@O36f;-#,
BXV9T58IQ[XgO8ebCBM3YZ2c\W0NL6HB1S4^JUHD4^A.660CL)W,O=2S8+J(dA]c
UF&B6?@<7Y,RA^-4:9BUOIME9GRZRF2ND:]bb;c6Od/)HF&CPJ^3<@3YCFUN/@,B
AW\:W5?),aC@OcK:M=UYLXCJA7)L^C2DHBOU8@a<T&6B^g+<91JMD.c]=^FXSV8>
f-WfgKOPG(74]d512Z/faTTF&0KK^)gg+U-M\;#OZ/.Oa<13W^4gObD3MZF8J9T.
-bGN]&F[<:@U+@OIRb?G8Nc[.0YbO^:M_?ZbY^5M[aQB<,6J(E]][W(_YM<XS]\T
99.LQGQS-cZU69T5&8=UGd77_J2)F98_C,837O5F8JF>8>?VP.a0G6a)+O4TO6G&
7e4?^JX<>2H7G>P@c=c//HD_3bMG1B,6ZPc(NJ4DCEg+]I<RPJPMZF2YW]CM:5U6
OF[NZJe&X,H;(T9U;LI6U9P&J2ORHS&PQNQK6V9MgQb(d1^@Y2YB=^0BIYVBH1^f
^?10UZ#,I<NaN+eG]/\H4(3-B3B812daeeT/=8EeVa0\#5(-P[W9Ga0[ZV.ZWPNX
64B(Ka3U&Xg9X1ff;3)D)K\F87b5_&eNKJ_PM@TaIcgDH:-)G^2W#-YeOI#142Wb
C2DdFD39I,P\./+?bg=YeGVfYZDaV@\U0gK>WAfMMaa?SfYL4@GYXWR;VcLYa#K[
;US<@G3BQ\.1\:R]EReDUc>NJK-gXaA0LZ0?>e?40&S..#D]B0Z>^MZN?da^O#H/
?#=[YT64;U3IG(1L>OB#fNR9D&g9Q-NE1XSY>U(a\+[LO,;[N5#/)QIY(B3[W:.N
FbG:gdMGF7&^OV&cdNSH\L5QdYA&Q.-eag3P3-)FbX0I/aUT5fO:1\dD31_eQ>bS
1g.ENARLOP(DdVg@X5HJD5II=2KP(HTb_OPCAe6A<[H(#RHLH:\&P<3NUKKVUKcX
&>>IDGR.ba0aC])X97+CF-92F(2:K)#BFR:&04.@KRId:0<DaI8P(UXg5bOfKa4P
BX)T92^C206GeKQSMX9K(OFCNWMA+N98U,VAE1ade)Q;D430RU0Q7+::YA-43@5g
@YdP^N@HIC=4L2;RAf07@ZQeB^&^(e-H.3B01F][-K\_.@L=C>R:P+CXY:9cMc?G
Qa->]B54Mg5CK((80/^_XaK?RU/<=JPHZ0eBKZ&@gR6LCeIV]9eJ-McDWFG#;W-)
)/_YfH-dS/J_?PaH>C_PCW3E28>+8Y3bWF3g?;1H9fRR(K7Q,[b1EYYf8+NP_AP[
fKS&=_&VN6c;#/2F=aa3CC,-@]eIbT-VbZa.g2AC:#>-cGH).<E&+dR&1XU:IJPN
]M8_gE7?N88CG3>W6T:UQ6<;5f8F9=K_[^#LTLDX[<D/AG7WBc8_)I<OcUUDB4eQ
0.62aeDc6]@PMH+(IHRCZeR@OZVPHLe1O15fG3QD9JEB?/aYb0b#R>d]CKQO0IB7
.RK=HA#[R\\D8=1O0O.7eQdeNOL[gPS[N;<:?AQ?XT>U)>2I:D/2(.#8_O0WD:/U
.85KLfK<7=S<6\<MG//+NeVW#.8RB89P>1_N1_G^-]_@M+dcE\3[WR6/N]X>c&_g
c(NIZdVWZ5<IgAKT8-U&G:fS5;]0V\)9P82NbQfACLfO#cEfP+T]S7e_+E[2R7:g
>5;(>7D-EYI1CRD+A02K/9e\7G.;b<Zc.985_Q?H>)KTS&C[E.35BFAQN8gB?DB#
K1Fg.fQa(8=Q4I>D7ab-M9]HN8G+U.Y\UE_;I]0TYZIQ]KX5<V5e?L^J=3(d-&#5
e]&1S]=S]OB^+7eaOFbBQ@#6OgHU4VAAGZDWKDJ+4VTg6X6MGR\8E]O2]a[F[):)
CF+gQ:NC1LDZ,(P.1W>>TfgZ[b@FBF+YG&&I+P^J)/ME(e-[/eG#&_Q\9\e3[^Vc
TTFJb4]Q_TJL:V@J2WaWAK47bU\A@Q)[f;D9QC7JR:RIV_LTQ=S/CQ>.4LAB>P:V
b+UW[e&Y5D(.B=>[_TU=C4c5a#UfFR(/eg37Y4&?@(K]8.:8M(c.=3S1.A6@H,c#
I+JA7-##EM>2gF^BI?[.FHfYHMX#D?&T<.AK;dA^afe0ggcHfNCY/^#)XMTf2@1&
V>#?6_#1^ON@L.==_e,S6\KDWS<620IKG#F,bZ)cBgZ3Z=NE<DS>X+dM-1A?fI#M
L50B:8&Z5K/^),?H/e7<#_HHcPG3CQ+YFCE^),A42R6;6[RUb?Y4D?6?YV?f/LC1
0VdRZIGWa>\.QZKJ@5E)=-4I79ZUK=MW4S1>dIR<[d+?#\367F2Z5-7B1(1+J6?]
b[-UFVUW[=Wg/UTP_-8^BB4(DV:+;4D,0,;3TB)Rb@R<b7(VWM;3:>XXed@RM?^W
:KB10Fg_B34=07S#K(N[,S<S)(82\dW-K4@G;]W[X0\RaaS&RWY\bb@55R)gMK1M
+)X=@CFY2fVS90F7,eTEQ2/UeM]Z6^c)1Q>FMc18O]#OCJFC/X>(WX+KAVXNCWK)
TOcIWd)9H0DH00PM,X-c<,Ua,gV>bLV,Q>2/gVL(TKJ13=feMGa&BV+#S2Z=^b07
;]>3aF5Q+4f:455[[9+Y5U.((M\5JY?E+]-.);Q@2R.,LAA1dHQ[8EK[T:T[MIH@
[X)8bSK>#0(]-:(0C1PFcfa56EfOMK(I:(g?O577\bWJ)@^R39.OV0?WJ/5Q&e9f
AG&JDLP(UDfGT2F+Y,<O7&#c.d=Ie3G?]&.FMY)&QY8X7Kf@9)\\ILON+Q3cO0\/
?]M_4V&I3W<Ge6:cJE1fY,4^@)fJT=&C>4G1/Q-FYM.XeRAS>Q\2=13eK.g#?LVS
(.IG2VU]NA(HTMA]a+A@QIV.=_A=1Y2QKWC/RG;aV-KX_,:#R<E(P4KeFb#a3E(f
QBKCY3DO6fReE26;AEQfS>-;]M<,@+W97Lg92>)0gD)99.YO@gOcFGa01_H1Nf&.
3CA;T5Cd\;3,@b6_SgHY83KebI=N^14YF#-(ZBKY7Q7d&9,GJ?=J;,3SI@ZR;eEM
L\0_c)U-61b4856XU3>B\JO+V,c1g6cHY8;(gBEf70;]H7SZ)W8L;(^Ka;6ddXNE
E[3^g7M1RDA]5NX:I-G:\a(gNJE9]g<EL,#Ld_G[>J6C<J.+g9d0#gBZa=+a,?Vg
_Sg>V#B@XZ07W;da7YV>e8:AJeL_]2Wg_MKfeF=1:M5=@QAL?+,(a6QF/Ca9@5;7
Q+L^T,+,U6U:IB#)<84_2.RX@W#?]5/WMCN1-8(3d0+UX31R\,VU?M#1LDJR5OP(
0:7_V=Ja&\\7&HVeZ_0E?)XL,XXZ:_G8Oadd7Z2.>YgEcSLOf/N<gQ5G;EL9Q?&>
=@D6a\UWcK?Q=)S=3VUQ_9WRF4W&T4CdK(Xe>JNH(IEF[?aWW?P2+2JR\WeR?T,-
Ob\a9_]a96D+V?6B8KMK:P:Y_8Z\-1+&bB-X\SQgF(#b@52OT)YL>?7-XH)7:LX;
9M=;>B]9,&:+b]N;4Y7&_\E?7#QR3_1\a@>Y3X@@#(eU.Hdgc5V/,FTcU23b<86X
J:,OL9/Mc7.V;4A8#+-CR6_61Lc\UNZ+6/-OcAV+&gdcC]X+=:G5VAeJOABf;(#Y
?BZ[c.EF1YU4UX2)PQ7;J_W0^&EH#<AKg0W:I-,0Q]4Q&=TT&Tf=fUBQ/-^Q:>#G
fLFXaNFA1^2QI/WNJ^#a7:]-+;X1N:FLPOM\e@&a>:#E3C/RD&W6Nb>&8e8Ce9O+
B#ae@6..@E#,X,VSCI^.E(,O^Ge/0KLIc@#AF4(9QGU8C5B?_XYU>VSRLA7Z0G_\
aX-bgSGg7_a]Z2)[e^Y;@2=[IWc)C+7YX.fEU6E&@S)4;-9J/aG[Q(17&EUE4[.g
PGbF/D<7e=H7OC9]WI4,M6dP.OfSABCgKC+,OaXUF[_:@[<I4g<S&,DX#S42W3@\
P#2Zb1ILXO=P(:TVPSQgZN?a#SfZReUV>e>Dg27JW/HVVZ9N4XbC,e=a&U)U.7\7
fHKJe#C-TW1@,(<LdOV0<J4HY5Z-bBP[^:gIP^I<S[1bTeR_Qg-3H<&_@2Q_C5E/
AKB\dBICa883da<U2Fg=-PN8YHUBYS+[bd::Bd51e-C,Ma@ODg5MN4]#4(Y3@#M5
c8W7f>E;D,da&E06()Vf@;:1^YK+RE;d7CBaU1ad8?CLADee&MUF.>bQL/HJ_SYg
W;ZCDSY(^_78UGPKW-@0SKV+;Fd\DgLT-3dWPbU>UPX?J#O\LYVW&/?+\Q^O_e[N
b3L0;__^<8X+<^\WZOQNOR78aA,9<JBHG_\ReHOBNTQDN8dXYXGI&A);g(T6d:PV
^+W_MAYU\8V[+L879K.J&[b5M1Vf+&OcB5DFfOF6NHIaI\,d12Z4XcXba/g28<P3
,f=cb7,QD9f?-FIZ3aLWaHf.ZM3,GXYB&P&R1.P+_KCe)S,AAG=/3L_[JW4WCC:3
_O9(,:]Uf__Fb(WOLA8EXQ1456I.D--2QfA(RTZG&S-S(7K77<d(I71,988L5Q)+
]:PPDI?OIZN)WZDLY:WfRTd109+fUY58@03SHPBM5&0Q<TO[V5#Q_3J..Uc3g2([
+D#UT8U&UCSeRgTW:fcG)ddPRY#4)EG)^0a&e]BH@_Z[&8ULSgg1AFFH,XRQ8P6;
eCU&@Ae:dAg32-3^bSO_S@8C&E7&?R,PDZ1W^GTH>ffN\WGc[8LY9@4MU6Wb9RM,
5g?5U6T]-a)><>V@OdYe/&\.=f&aL9^UZ1?bcG>;24K5/K/SV]a[\BRb\7+\6Ub1
g)CCSOM[T0WT6H])EcMfA3#+--YV3+PZF)[LC.MFe.1]H4IAa\eT+RCM=R1R]O\<
X>E\67IW_O[PRW5fNSE&H;d.1Z:[Z\,>P-Q9I0PMAWWSd/.Af?S9<P4NLVV^3Rd6
H;.eKYJfaM>gDG4TSG9dc66A[4[EL&F.^H;B:0[;A>GFa-KI)22WJA=f2(UYFV6[
/5CH&Rf;NBO,KFa@,P(6M,,=\U]O8^@S[<XQO>Zg8&7BRVad6VW4.DBIWM:?K-8B
ed98<7b7Y=K>7DB]DR>#=cZ:W(Dd:/+1G>b<YKUA,db=FA]31cQ[gE)f6\eaT[BB
=I8WZO6F7OI8BQX2<S^VIPNTa4P8MKT[3c^H4XJWR)QLV_/B-@E\67\e6+9]2e#e
VH6ST;T70=UI./77A;C?V_3.B@CI7+WbR1)K:8:D:_&4fHQ8db.6:.L&_7JU;(35
>LBW[R-X91MJ7DP?/P8UH6)bU?CA/.7#AcK7U_g7KT8A6^P5,V#EH2.;:a<,Y5B<
_K1+KPPALWd3?HQI7P+0Q>0+G4ee0F5aZM61JK4(BZ#-GL:Y947b?.R0,1fC2bb?
\AFARHR6b&;_:NS?I;M@c(.9@^e9^TfL]</;;P55U47.KETQTJ]\V]Ma+9Z[XgC9
^DRH=;KP1V/>e#f)_cP7RBFDa\SQQT9K<^4N4g=,C;PZdaAM>NM[S+SZENb(:+C#
3L/GA60/)J:Q#D1BG]&(O_7:].[UQYSZ;_G]RP@4C)Y[T>cI,;f7X8T<<A&N,V>&
6;4G+e4Y.OD?-)N4EC-dK,aP#XPf6(O;FC<fIV&>QBI3;^[SXH?KG]&bHdWPH9=,
+0CM_;<TV+,fL2?OOV?M8#A_U>G-;)AM9WJQPQc;J_,bW8XU;NJY(TRUKPNG&1O0
M^=Q2]X>:fd?4Z3OOfH5HI^LVJ>J\90A\LdUBIQF,_:WEcZ?E_\R8Da]P#D;4MW8
^fK>+SgE?8=D;?b[92_KRZ#GN&T85(QYBe@VG5;@((O)Q@7c7OaGXO_Y^a@#AJ&H
[G?TDc5PDH)S?7^?6864f6EN-J)KQF0JL&XE1:BSUP7TJb,HHe,,>V<<HRM:8>;e
JaIeT[+ZH[K_644-f6,BKN7F\EG>-N]3FPI,MV>__7#Qf\\0-Q)L5@5)1&EWW\VY
V>dSG-EJE=>J-6:G\5Y2UCRO-&W67D-F]FZOX4>d&1.I>DG9Ib5+A<RZ\&Q#F_Z1
ODYAe7O4_9CWXW_?Q_YbId35F.S?:TTC4@FCKeYDE(>Vc#:C,WJL@@L5f-Q1(3+)
]K(-Wab#P9#00=:.dOC?&G,;>RX9X.c]AfO=W63L,,0&3Qe;G4b:Y+)g]WIaJV.9
A^J#0>N^Fa[P4VP,=(_0--K(6HH?+L+4/<+<=bUU)Q\]aS:^IIMJ?N2Ie_C.5>:K
#Q<57(=fLT1Y_?aHG>_<O_ffg@dTTJ=0M^N=Y+&Z/0OEX\&V7FGe72b()P;P]:@^
D0]g7,5+g^FW._E-9:G-RID\:B9E2@NHR2Q#b/<c,.U_eL#]\+-AH45)P831.+<;
__/+1GO4G68X1Bc=D5dSWBJ>C0WVLgX+9ZgT-b6AG,<b@ff)[-_;WR3XM(;G7c7?
[NMQg=_UV&D[H#KNY\(?K0\H\Be@1.A1TRH9-\0G3Ig8>OX+SGX=ULGXba\,@97Q
5MW4G;7W76=HO37RDdVJ=)2FSVF=4SJB/^Ca+gFZ_6;8=/-[F;2]P;c)C::L,\)<
INONL9.f82[@M;L,B6J:G-8EI9)4b1G4fW)B(G5P-cO856V_L>>>2V<c>CNM]+VL
/SN0bD)D=6]#g^\3V6c#W3RY-+;JW/4B7fDZ[HQBdgK<&0K-(Yg@W.Ba/]EA,077
34IZEEOHcC3CDeA31d<3>&bZ/9>QUF:0_9ccXJ?SD/8C,YTJUND@29XdDI]M\C4I
d07(OMP+.99e?)fEFF)+OC_EX_@K+-M)W]>)1E/M>XV/W9E+1&?XeA]\cCXa01(b
5#ReF2?JY:/8/(_UaEIXE06^BRJ\:KfgC7gVKB\X/]fNQ#3>4^[c9BNT]E4&BJC2
0L];[N(ZQ(8FLW5\X]WETaJa[f[e3\ee<c.D_+PIN>5[>e5-d-?Za@XFTcgNJ:9O
BT601D64cd[f^N:=F+1XCdNfLUBCcc;>@6e2-Z08#5F@f-@MCD9KCe6ULd_WdgPb
6UHS.SG4fC\<0XV4YYg.8]J6(TP4eFCRYdK##,:4-I_KJ1_7,<O9WCXa3;d.R9+A
&XA^?]<#KJM5Ke@X[/+N7&YN,/ZDZF#c=2^+9;:,U=Wf5#-19:27O^[HCN02F2B8
D,#[;1]/^3a1.82Te>AY/d>&Kf9FEHP@&P60\^?8CXbOU/C\[TO<H>)K0#8b.O4g
g9KAZ6@UX..@RCUe(]LM/#/[GG95;^Ga30ggCA,IUfIbJ/a_QU-bQQ0E8PG+U+8P
P[1V\4dRKg_30&,8L\O,SZ)H]V>fdJ-2+Ed@K.;V#_KSP:P7>>\3CM4H,SDT=6dR
.5-)g,T#K,L.5DGUILXM2J)fD7]8Y>62@(,82]QJQH#C;1?W^HX1:1QA?3@?,QP3
VH2MN\eFed#WdD__c0)Ee<V?[+gf98:&PGMbK8.,,>RR.FZJ<[/#UOH+GNeXFJ;9
1]YN,.TUHY=WF2>5C@5/3KS_JSGIJWCZRM>RH_a[_:49_IQBC2(BdY\,K;/K93,=
3a1>PbO<QS>Yb)3QXI8^\4(RggOggW]M4aVI<M<8<VdFG)_JX<-g>]GLb,gX)BH#
aS0^2U=-WK9EfGH;>LaS<IW\[:,fd(ba3<7-TfbEXe_bI35TAK@1E2J69B+@LKKc
.cJeSf(\c[e[,DZN)H_5=7;RJ=a.[EcHe?ZHMd[N=Y#P6S<W__bADSeGN^X_>&+d
Yb2d_G0C=fM:A#-6:OP4SA3WL/?K<T)D@5_RULKT?\+Z^>U+VR>B.Pc4E^5Za+L7
YXE5)2b3S3)W\/@]YcfU2^dW_b[D>7Lbe?)-f>;1b4e(dPa]6]77ODFS9XG+,[SF
aMYgbgU>RS06;a</=.,@563UdJY=-gC0UZE9eScb>=cEA]W+JdE,^=TP6.U7X(+e
HXETEf/fO<2/ee(S3\T2:Z00LM.DOT5YPS<ZQ\VH7b-SE(^.L<-)@FaP4bQ>f)7?
^Z,@1<L<..K6AV\1YU0\_8?SNYFUd+T_0-A\d:3I<@[J^dW3d.+L6d(IG=.3GTUe
43.JL-LPVa8R[I.[\=JUT9D:XaF5FK5P?QCD05d\11<a[b4:7.bT8D&\gKS^A6HJ
HbH9KPTL1+X26S-FD>/-ZR)>EPPeCF5(0+HL/S4[,=L>6]OFb+(OTe\SE0U,Qd_B
^GDLIM9gO#^1FF\5fgeD9+?c<X2IdbcY]UYQTPc;4Q2;cH9Ub26f]-?c1WD?\G=G
MOBKQc6;&O]_4E]-c7[Q)5VJKQ8K&JT63_0?,764JfJ/>X=.\C4LF=XPR9GCQJZ&
X.E8\N5VPW1G=f0>;0:S\8)MW0.a9-?AIZ^<<U(LC;1-[<_/WTaXN5NAML,,Ue&S
/8Z[U5e():O=gQ?BLB@4G,VN&X]SJ7Jd8&?2Y)ID70Y/PWNXfR@&&9V>])7)J(I:
P5SWF_9c&7:ac:dWYV^-Y:7<[Ve>]\<Bc4],(UH4fR2N6V)3R[S1R.=\B2d((N^b
>g_S90#G1XQ.&9<GK_Ae;Ug_YfaY0K\2cSCF[29WZ;R]\3^K8O1Y:&KR]4@4If<O
<4X@W_L2de#2R#<d@]:&)0+)DP21&E4VfN&(c]C&b+VdDD,6fPF->fg<@REb0>_W
X;6L(ML+/SR#/&HS/F437Oc_M0X,O,W6.\d7>;5+/b@M+TC?CF:F+g#EeH519\=W
dLA?Da^W_L?eTF/c,Y7M0@7/gFJYT^L,EZP\7274:(#cJLV=PQDTPYRRLA_ZV#9>
CD2?,7DDKL_@)GFg>JB>[N\gKN)9ZZ](4U.MMHO>_F7J@<UfgR-.-5>AE701YZ(?
QK6(<N7JZQ[>K;LYUZ/9SK?S?\?fUbC9K_c_S_]f\bP6(SYSfA)-6c=Q@>aE_/MT
3)^WHa^]O=VZP&9+b<^SC4P?,9>C5ONXgY\U6]1(PACH-1cYC^O>5V_CEBbNLMRA
(ZR]^93Y6[92Z/NC)FB;GaZ_b\\Pc.S@HZ<(&/Z]B@CG5M(V/I,K(JgR,MDSJ4:.
?[:QJBGf:7\865]aSa-D_NEV6,(c#1ZE=XHY@CgUSFe#]L@_?T]74<8L@;EQ\=\b
1M^VKDTV\<Mf-TF;b8K1Z;\<WBC1INP4:C#W98LHdG7WI57P9dTI<54PL[AKM0/E
.eW;dG(?;O<T-+TZ.L1GEMMg_=#L;S/cI@G@=X]<7(6&L5QL[]fZUA)T[9IbBT3D
]C9RA0J<_2I6fYC,M?B4QG:1[7]ETHS742JMI0[1^dL0D_8.?d/b3J[aVN9R;Cg+
\TKWIB8.dS0^6/LHN(&G1O.L\-d6(#.^I\9E.CWFY#W=-f7YH\PAb9dc_[L;IKga
LF#&?@U<]bQO\:dF^L0.E>^[ZCBd7GYBP=FV(:6K8XHfQTDXfOGTVR6J,eM)FS]-
6cc2S1E32X23>.b=6ER>0gRb:eO6e,)FUR9XB>_-&CFKQ]:F9]OJ0dO_LI5[:,8a
RPaMM9V&gINGE1UDB5P^)N/#eX&)UIV+76K93bY?P.7&7MYRXB7,U9eYTSBP.-O/
:Q3]M0:aUb,V7,L;M.9@N<[T8/[Fd=7AY=T)W5OT]X(KHC;0D];>25B2E6O)L:/V
B]9THB3TDR@,&:>FGW?6(71\P7BPd,?U._g6-BgS<HdOXQTa95YMZMA#>f;..B\G
U\:UdZ)f@RaL:8R@8AP.#NM1?G>-aLa;eUKcAL,K.-GQ?[M79NY8WS2bA?81-VD4
cRKW&X=dNg19XdJf_/XD)YS(.]:3P:KW-]eAPY[DWHNBVa2@X(P184VDQ<\SJBNV
b3;@KY7gDJ;G&ZS(9=)^UA@RN6\QHC3)[[<7W1gSVC7-e\JO+=DfO^1=&T_PcNCd
XaINbD\FWVFU&]g=6@/FZ;4]8IPIQ?9JFJ^(3>G]Wa64Z6X/)(ZfW6IL1W&[TQcg
M16KeER_C?#,81I#R^b3P^L5U:-,SU/a2NPbabc,J3U].MgS(J_c2Zd][LgGcMc8
]aYNC+EM)=X5>KP+2Ve;b02TLP,[g7O&2KLMc<,:SWMJK+IOM-^\ZB]_g6I;d2?=
U.F_[f0eR0AW0X):\N:FW<>FWgDX/b@[1ULd&LYU3dPD_/(NfJTILQ1J9L=./#Le
3Z,95<F?GgUH41WcLe]-Fg4_W,1V).Y:5]3#DYYFD<EE?R-@SD&/2d218^JHg-aA
KU33H+G#?:Kg1c[^,PKP_;(HY_+7cTgOAC3H.bgT,E0B?=I2D@Z^8F9UES2&@2EY
5\Mb>G\5^88.58GXX&<P1>ZW8b.4Q<MF#^,N.:GJ2CedTM2OV?.^><09H8eWTcX:
K=MR#We:(SCA\H7R1MBD#RC8/cc^c9G88(UcHJLdOEAO7@W(P-Je0U&&J(M<.ZTH
N/MY2YaeC91:BHM>]f17B.YAO&;Y/T76)_Xe&F].BDSUD<\XaYM.e6<A=&6NR):O
eZA3fE:_6(\e+YY8:S56[a:C8YG]&cWf]b<CLc.GJY,Rd>3f2OGE)<QQ-Bf:]ZU)
E&3AdNf&;.P-a=AZ:S)@(C9,.+&]\K=<XV]K?cVJ4>V<Cg6/O3+gA,I&(H/HEYTH
PFJ_e]#d5aJ_L>d:F-ZM:d66.)H_2S&XTODLCP+4\g^=eF/W4A8O-=\H>c&Z-YH[
Eg@(Se#+VGcgaTfM+g@=gTGGYKE8U(,W^0Fc49GNCD<YbZ5Jf]N?BY@412Nb6;f^
;X\S#F<Q#<bUbaE=#-Z37G2V:H>0fJ>a0d(3DE>N(Q#+OIG+=SG54KEIJe1W08,U
PC\&9WYD2TWcW+:^N=e+_KWeH^Yeg>8?MQ2K[OF#FAQ;@1R8<4PdHW+2gN-8^O>D
)),e&SBWF)VE8/X/[4E[cR3B;1,e2;L).dUGDH_^=PP#=G&3#]e@ZY:]2.eeS0Z^
T46Ffa6Y+NB_G7N2DID<2f[d+O_H?/aeIGdGHW)7]7#DdA[U@HME24UI723H]AIS
[c3JQ_&BSQXYb?MTP)V8K7#dNKP8Fc-B64UbZQSQS2U(Q)c]&Z?GUZQ_eXPQ-c;V
UA#V23CVIPU3K:_/859Z1#,d8Y8&;DG20I\/92(2ec76A,/6>B@#PaL3EaadfUgT
.Z4<)1?Q[bT13^X8NHRa6b=\g/QMZ;X7:(cV4-5@9Q:YCKI\TUS0_KKO4089/+=6
CZa@]L.,e#cfN/3?7Z)8@c8AV(F4D6dE05V5Z@C5&V@/K(F8gG9Q?@BT37IT/U1b
U#^NO9H12Oc7KZJRY]@?>f-Q;)QGXJ6XB0TC6TSP.ALbP7S92T>2Y,1^)L1+OVQ2
)0^CLBeXK[60&d/C>eK5GUdX@0N-_gd)5#[M7ZOD,L]CaecB]9aR:Xe7YUR24fcK
DaQP^^bF?c(VQMIF)3XCI=S8+8_BJV]P@bR+FDYRJ+6-I_E,d?26UF04<OMR0Y0J
2c:E]9@g/4bG3YY?]H=Y2\];#2O(a7cZ7RS0)?81g5:]RO&928[Vd8<9/.S?X.fZ
E/[T)DF5Q)JE_.0c:2LG;b.-?=cdLgJMf)]]]C8J5#3YgLV\ZgDGH-PJ(gbK15YH
,YK0W9/bRVIJ.DH5NW+JA2Q(CEP;VLAUAX>ER:gMcF,N>1f:4VIX>Ce=dNHWa-VL
M,\CcT370.^8G4bLab1@+#&1V(UX([<Z9S\@F=CX5BgO9Q+AON,SL,RS:WLT=Q;L
AL;AT8cQdSW73dHFRQ]KdS^V+>OT883PZaeFF)Z=K<1@2GVdO(MRZbJaPg+XY<4O
eB6[f,(?RNR:c>2dDe@3ABcY<SXT&d6[dL&Z73=AR30(]e[OM;,15:J@2:/1;b>D
SgFE/?YfJH2#DAX12T@;D[<:4>cAI7dc^V,g+1?0(@6&#Q;;</0N>U9IRa71O99.
LL9KC9,)a,MV0MW_8M;/=:9-6S0;fTM:NAKfN5;MDO@Rf:bW83VO[:?@_2.WJ)>g
=TdA_G,c#D<eM]GSc6-gFH+64CIcb.AXP#8L0U14>eN#YC,9dbFd_UFOg^Pd[(:T
AGN7ad2a#NF#BPd^0fKd5e\?(dC#1gCSGL4./c(c,JaYEE@@7Xdc#>C@>H6\eL]C
5>RG&c[ObF1)81aQ=3#(>__L0PZ+#4D5T-0A>GC.]T0TXS;<KVV6ODM(S^2;TKGb
gdd;IaUGJfGU-b:aF5gXd0)bF07@cE81PCN(O[Y6^gPH&@eS?54P6IJ8H.:&-?B_
K.58HCWe>6<K^3;39H/1F562NaQe.Y1HY>gE7K27LR,b]WA-T,U1S,A\?JUK.K+;
PR@=G<+dPV0&@CRVDU?gE(SJQ6&HR^I[]1f1[2g=S?5;C/FM15M8^E/M9bBH:,=H
bd_47[8.43N1QE_C8[K0ODIW7bfDO6e3[.cFUF^BTB/cN-@.Q:;H<_9RAb?SL(=T
e8C,N]VQSVOMd9IbN5-GSVg]^SKJCB/TQCME#RR9WE[@,IRE.Z,J,NJT>D2d4//[
>A61cVf84]VGX_T//4d=Fg6Q+C804N\YO6I9+(8FAOeIJ\&0\GZ6_9,&eC:TBNQ)
;=Ia61)IY-&bS>?X[-3P(f.-#\N9A^11&@2deV5Y]INJ=X:DU,L&>E55?QATCP3.
XL4RAJH.&6WBW3dDPN?SQ_/5=#@4M1>G-(f>aJa@^,c3.eAA<5Q^dRf-HC\DK0BM
V/bcSHX0,2Re26/ZI2\GJgGNE=@g];:gL#31LKf:[-]SUQSJIF,)1-6(f/F\/[B0
+EH?HCg^5=OA/Ye9c,3MDQ5-A,;Mf_+efQHB#TO[5F/0J(G1=V5V1U2H&<Ke-1N/
4<BRPe_:D@)Vc\<@Z&KNDS/QKH5U]b^?3HdSD.+fKI3/JWfELYgX893J5d-V6S7f
X&)(V?a\<P53MHQ_5Y;AN\,AX-Y[dAZG\+UH\Y^Gg_8-VC=4)3^[>5XR65[)898K
aNA[,+@OEW(]C:/;Rf>=Q\VQ:VSaG7Nb^S)3=.6#S<R.2ID8Q=1R[+N@g)H#GT?R
PK0DH;PGR1>bACOCK[<L/f?&[&->/T8?#&(:6+6+_fY]UKF&;MBUSJce+=K78)@G
Z<,.99Yb47c#^?WPOA4ZDEGAa=K19EW=G5GEe0AL:6/G-bSU;LXb^U4<?MG?BcO_
7BKW\C5]<#.MVfUH-<F/[NDaJC543RKV#O<DMNVf.#;,[Z?@XM)S+;\^YV^GDOEZ
J)6a2D75HPJ7^SXY[U>fA+A>9FW3X^#Qf?>Ba6fAcG&.H3WL^S.6GA.Y0_ZD4DgJ
cFZG\+T,g2ODW>11K@=3ebK@FILZB_>S@1/6++BR]2)dQ7.(F(YH?aT5.;8#C9]>
b[E:HPS;^T3g=KSS=5+WbEgT;_Z4dE.Qa^RQ-R?f#7CK:ANeeI:Uc+1U5:6DX.)_
.;5O#R9-_P[49#&FZ_F)308Fa;7>PNe<.4(HW=<:GDJW;+]5W07R\F@DC:;f(-_4
T].DC0A#G7N9,J/gF,Y<S?aC&D_9I):#ZP_BDCaNIF_TeT[]MbCRT2#2E#M_dYSf
8F6\fM;J6Z<eKNRP7./e#W9S:4.^[e+@@,&/:K&Q.K9V-N#TH9R5K<HY8J[79D5A
/5V#^XB2MR6+XNf:;Q8K5-84;1:=dX6PEV7PJ]/JF<XJ8]/B7MWfPU8&Nb<GANMb
LN]\N(?T9T-,N?K[1IeIag4]De0PRF[K_2>&95/OEMI0+4<OfSQX-3XJI[V@\@89
(D>^THQ#0,I7:N[]MDC/A>FYe95TQ,HU.0b7:B4ae\Z)#OE>#=XQSO].++Q@R79_
b7://PAa0-E54[O+MP3&S/9EQG6R&e^&MTId&aG2N+(aFc3?eK/,DCgIP65f:cTe
eMTG1_+^+Z@07Y9c^EKOg5K)&;C1(P6?]g6f-?=>)2MTYCV2Y1dJ.\N^R/-ZH:g<
42E-;H)([=:@4H@(B?4T8W2W(HM<@]S\^YB?)gVQ0^1L[QK#g,.M,0c&YX8QCEL=
(0<B.E[[X>fR=_3YNN7)A8UF9?,QN+e=P4RVZYd(E4#Xa,=aJa3H5@/OEV/;VaH:
J87B:/J6?JS#HQ]FYAgB?9S^_SdbLG.4U@=R0<KA\fA6aA<.+e[\\MJ4+[/P&4Q\
7aD9\@cQ^b37N7,^Q20IFaTf+Ga2GB:]#H8T,LXUAT3HLS,:,Y>]Fa@/]?(+<.de
0f+4B>LS0(FcDB?=c>5V^J0dP8be#3d(YZS2U4+?-A\D[aCfE_<O@<B_C=fFD00(
C19W4YMV-f.)6XF)R2/#MY7OF=fbH1&^A[78QO-H]ZF?A+PG<:.NC=e6)/&C#PT0
[EYbHab?US3B3CT.X\[6)a,G(-G:5A2;CRT[XfS69^0>+aQDX7&G/c_1+5ReBfFa
+G2OK=/JY;J-I0:&4G:64+8F)92_WB[4ORVJf<5)T]N5dP]J#7S[60YJ8b?&eYcc
d2/S79<C4\\D9R^<;#Hf[&O5L[)H)/LKF&Y56VMHa^_)(=F9W)25T-+D00(J0O5@
4/RR=b@JLU)HW[STQ+UL_<@a]4(b<:15SOJdEM>2]V#(V1GL\(]</a<.YH5c]eO3
691;PgI3&D#=NL+0?<=V1O\9;XfD[8-+;S#R3>T:+S,e2QeY^1(P\_YaB:6VRH_B
)V(D:g3#TbPI32d_LK76#6HaADUI+_)(c22/,CGbN:R&U2d3E17:F/EG30Z]==AJ
R+KIF(Yc80>9A\cE]de7<<Gd;a2R^g-M@egdX>CQTP#+[,B&fAXId+2P5]PC&dA.
@IP6g^0.R6R].c_[<)bb#TRP(TI&FU(2GXCe8c+DS8]7b+:Q>Y;-2M\F5[X#;bCA
\\JcW6[\c/ZUR?W&Y)R,POL+J:QS0,MW^XMTbENL[?TeHJ>3&J@K;8I:_9&WH>J9
/MDQDY=---,(W,Fe>\1YM?TR-^?67H&K/AXSFf\R2)XS<^5M=@?AB[W._0FL;.8e
Q0e\G0)TET#gZ+#R-16#U6EN&D:WN9g\B_(_^XY+W<\7P-Z\UHL)GSFH@MW[O>NP
8D_+7R/9IZEC(5/dEgbTg>ON;7-aILQ)M9\(GS#g85MH3?C.f>M/TPXC4(6SS;@@
0e.QER2Vf?4a0(b<DdY-R+aS1LQAK1(Cg<Rf#R49^RBE1?5-fI))CN_5^W97?Y=_
Z1IbR>Pf_fbUg=ML.I9&D(K1bO(8W9]\195)-]2H-Od-A?B<<M#3]AM5d^bJB>O=
bc=>S(M[C(^bR7JOVWKY59+[@=XV[CC3BcL@&JcJ1E1J[8P2[X>R]D[A;(EJ]9aP
\e5SNCScHL-faa;HHS7>SIKHJ9AI]&H]F@D;e55SZ,_Ydd@RP(D.,_V<S:(dIeER
D1aLNOI<35\1Z1Z=E6aa0cM)(4BCK/1EcfO)TGV8WXaYIH3F(F-/[N/c2c,42M8<
DZXdS.=R6=2F7KG<Mg5INc,NEfJ#+&E>_>0W+S4Q75V(QHRPd_D>0_S:LHBIWSdG
b<)e)73X6+&0=9aJW\>WMYe378=I]eT8UK7O\fdCY=XEDe[M:Qg6c8b-FTdfd-gA
.eFRCCPBI8Q8M&3T:I(@&),SbZEQ^&WLd)fE#&a3(P\@@bgf/S16MHQGCZZT87)J
.F:@2:Z_(#K618/>=LPc\16K/U>8H?I@I5bUbb8HMX9R.7JFVJ0F4/V5EMP6S2eA
b&JLfLEJX9dY.Q(5XcIPPO.3MCAcQ\9]3@509CF,5=X:)1L2T&ZdfE-U)+FfLW-(
6ZYaJ:3MBc2R=?]A<aeJ8GYe12)c4@1Ec1GO=a+QG.eEZV?[/<0E2.<]8bHK+_ZW
M6a?7\d@)8E6e\(T]&.IIRG]>-g].WQ/,HAMJQB7QW\/FJ?M@Z]@S.dL]aJK32SB
KM;f0U@\RJ;JO_2AAW),fNe6:N5GW,:gV/)IR0-UaGHM70CY4TGeTNZ;8d?_=a[(
3^-)0aHSF:VU?YVQYT2)GA5_PHEB1_I3B=X8,Ya;_<9G0U.HdRc0;P3QSHZUaSdI
X/UW(6=3@_DQ5)2K)MXEMW@,@^P+f)KHGU3VH@L#=CWC<^IF6f9H.45J:Q#IOc+2
TV6&1TVd1fKBe95R@XAgNe5:QfS:/b+=5@U[J@V>/;Jf)HHNDM.M,ZYU62Q.X-1>
46M?OMH400G,LYYY0Le<F4B5GLgHV8??fcDO,e3aOVb+XG:BGML47bK9WKGHZQ?4
\R8de:?(gP:DJL1a297YP6]]JLES4,SED5^XBQ_29Yc=C[Vcd1E97<-ZDX;=,NE?
\X^@C\bB,<KJB\NX\Z:SQ\&Ae;SdP7X]NFT69OFcgc>COe;VTAWOB3,DQ,fg^Z>O
[&Z#O5a=Fac@G-(Qe\a+fSCQG9dDF?Vf]e#4BNYeZB=#CCRR98>8=fG]O)F]116]
M+d#<3ZE(@-a@71+N59S4Q^=\3NN;_Q6[e0L#VX-]#YMIZPU^)T[^]f_5c9[DN(?
8\,gV]G_7fcLR@Z?f>V0N2WaPECH\1DLRQ^95,e1;YX^Q+3#+Z-I@A^5DGI,bUeC
<dC^A<I.B5_g[ACPd26+QKTJ2dQ](W]S^Xb7(?+T[0^SANC]Nf<V7:)W>f9;6=<8
#UIEIYTeU/N+S3J]76U>NOJH^O/:ZeK.eQf1UYJ+.5_W+@gd-TZ1,,8D.Nf3@;)/
30?0CS4Xf(V<A:(F^IE21eUXefQ@[<+[C]4RdF:MWPbfaYG76b+#:^4cWA<9MTDJ
J_b=_)S;4K+5MAW;1&FUgaCfY#[7OM3__]N4^J\cf13X\X<YML_LdP,@0(KQba72
:)c2eE)bC98adcE2Q+J387+\dGE/d>_dHR5=ITbSR2YL1[e9W[9UY(_P6]P6V40a
7@M74(63;2QTBAQV^8IK.GQN2/]VM5^eWB]dI5SPQ)X4#;;Me)177F2;H[5ZV(_S
:5:1[b,?&I8c6R1_G/1?+.(_)PgVQb9A-54,VaTKcagKea>:4:9N]<U(^GI:SGW=
c7M:C&_2a6&fF]3gW]+^^IA^.Mb.6_\M5M,>TK\&UU?GTAUVLQYM[gT:W.6>)SAU
H7X[6V(:#CN&^92#R#N;KSFJ#@38SMe8[(8gPS<a8Vc/(FL1OSZ:>f-.-c&HO#-Q
Z&?U8DHKKH[aG,FEB.fO0DOG<YL8IR>cQa.[2-I,@5>(LTL68^BaJ0L9Za21P:L[
1b095-/ZDX.O3GGLd:(TC3LGM9CA<(E[G[T5Q=Sg0?>48d/gA=RbV^M[JcX;03UQ
C0G\IRJR.8ZR3@8?:B>_LR(D5TRCMdRZ=Gf3:A83^a2.4^eTFPS=R0KJgP^;2eI<
EAU81BG7B5CWe)RaZ0>0=f4gBQC,W^fMb(gCb[0.P#2ecH<G?<221/@31KF:95ZH
N_=?DZ3H)(?=FbUR[d]BIJB,P=\@ZJ&<D?323)Uf>YV-UCJAPAKLSG_WY=V;f+(P
F?1REX?<UUKcAPcS3f8^N\.:+9GbT)K-DA,D&3=\UfL0e0^R=(fCE;OB+HN973@b
)W.[/b02OdDGaKVM@YVAPEIcQb3D/]=D1SRg<4S.DUE^a@7/XFB]8(M<RScUC@^^
bW<PfV1PSK9?YB@-MF8NMU##Ja_<6\G[X6)C1\#KJWT4Z:U&d\Jg0>)aI&0;-eA[
P:I^,[O;e0D@H[QfQ>8V2GANaU>Vc&,5e=Qd5KRU71Je?]bCIAfI:(FdAMNK]&:<
OKR?A4S1@QcLHN50GVGW<,3M9O^,4e&&EE5^E(+?5XC5LU#R4G,<>[66]U.QLbd]
-K:F@]D3IT9(<?S72XZJ2]65gK_I(<04<P[<@G#g^_0V8YBOT3X8B,a-NF/NdYB7
-fJ\_IHSPcW2IBEGIT\X[O_,O?;L4f-)\CN&c=1d-+-<QTcX,4G(]5J72G9-_AK7
=VB^2dE<)=L_Z.=IDEIXO<C?#X&8Q+d:KQ2--a-QfBYfg#V6dPLXCGdK794e(V./
:CN:eX&P^VMDBH9EFH4C:#,Y:TUKZV0YT<84[<72U:<8aDXJe#PDRQXFQBD3+c=Y
HHL;JU8SIT^A4E@gXf9D--O[\^&:O]H[9#H<GXON<=7O?9O+;,)A@VB;^W@^-,CO
JEWfXeK26dM>Z\MG1WI9Y4fbgcM\.HV</#4Ja<>1f92bH:\=XO+(QaZ.)62aQ#N.
?]ZG)c=U[Qa8f2JTf-070g6GI.XAAS?SU,Y5bEed-2&P;<Q+GUZAGee/Tc4-K0C7
#^MaA<9:=Ia+I)TF9=bBgf1V\\7=4P-A0VZ32I]N[18+4Fb82+DR=I+^BZ-2OGTA
4)V:Vc+PJ)MBF<S5L2aE:dOUUN:2b]e,2E[-&EUPCE_T\8.OYdF9]@0=>G.^g96e
UK(37E?b<Fe,65?S@VPN8g988<_BdR)@7F&U-UZfKN/6GSZ3Wg^B[P[cBQgA>9EL
;<>JL[,;TB8>]LNI,Z[,fP(,M+T1#TBU2F:AgG\3^_G,G9IWc1,0&e&SMfBA7/3W
8GG=>B_aVZWf8ZO25V#g&JL?PK?+)CTKVY/=+YXF#2]YUWI6&X(NJ(0JaF5L3SEd
9,HMI(2GO>eA;C<3)ZVfbBBaHg.B:HfY?,fK19M=Q8gBM?eTLB>#<EBFf,ecJeJ6
56G(GK.2(gK4;ZM^N#.2,ADGQY_#4TV,&.Q40ZcODP-aa6]9@&3J1H\C>)OVQbS3
GKI)8Df?P,R/J[[daC[O5J#F8/L2b4NQZ6gQUOF^6G;K+AW,(>@0L(8NT\.1HKHL
dc?LFCY:J:H6,DQK_:21AOI,<^f[FII=?:NN.S;SGMF+OR3LdJ-F)B18d(OL:G]O
9>aHX@C-dUS1R82^M\KKG90;C7(1e.@b)+;VX?2G/R3A?(g=KRe&.LISeS(NB,TW
0\PMK649PSQ077LRU11,0RI^Z)9UBDUG6[?=[Ud-a,:CHa;FDdD(3c>W@gOY#=dS
E]6=23#E=,VIFfea_G98>?:e/W5PQPG^eY6^UCV+\,OCJRb.<gBW23\CB(ZE<7f)
ZX/=gH#EVOA&5@KY]MBHgLLfU;Z7,B0B5Rd0LH:23L=^T[-b11AY2_=Zg.=PSdSI
)4OF]d?/Fd]6/L;[&a:68#9Z^NCG>5(9[8OB3G+B/VCUN30VI2>4gMBYWV7;L=<5
#e_J,BJNgO1MIAJI?S,Aa9)\-&7#gE5.#D&]e08^:-YG,,aM>a2P?741[g7\\fY<
F<VaIC0C#X;\c-5+)>@&W&D3aOM2-cHBWD(3cMATf35JEg)a^bfaN1V7/K.,I>8(
fY&R65_L7P?aI#)<acL#DWUX=+&GR(#RRS.J>@gUX_#gWEPIT>bG,C(,FFU.T\bA
K&Ja[<^EN5S7XN)/.:534Z0<R(W4)/e_I?_\[P_CJad)KU</FS.FPF.]G+Q2b3@,
J1.4A8/DA+9;OV44AT7^5gL=)TA.I,afT[VCe5eS2-T0/cYQee.N[cH+L_2C3/E[
&U01Ob,Vc?^eN@^,aU0b.3\@VA#,LF=_/eQG@8O#O\4=@-?gg4efXI8YAQ.)J<NM
PUMN@_Y_g?:\ZQ&N4^?e._9/5E,CHd]g^\^W]6HGRT=/IMFC/9M=a6P1:CfFg(^5
C#(E,13W^NBH+9+9g0C=E,QQ+,IOG\=)O@7)[16:>ga@YeDH5Qb9gbX?B4d9[Xb6
<4R>O0DZMN,3K/CY?/=CWAL<BXL.e6D3ABP_6eMY=A>AB6VQQT&69[8TdB#Ug>3K
;0<?b3]Y+.T;,?1+\?)&X.^1=0]a@>f]+<@R5ZGd0I[<g3UNVMa^bM;Y01/L?)?Q
6BU+THV3ad^@;A.acWNVaK&_>:\,F5,e3ASacSf/XbJ#Sc3EM&^VTY5,K4FEB?=7
>;eTKQeLJLXe-IL_P?0_A]QA/dL>5fbdHSM_Ef72)X>O3cG(O?@2.MOS-H_,\7&d
4[YLW:+91H_D_Nb<0?+<BK?^J@:B[SbQ]]fJ-C^7a//X)D6C?4C_e6H1]X9;,H2W
CH>>aHSEMGS-5R5PfDdK45?b@@&R.3LYXa^OZ94/M8#6;#f^g,TFO=(a6[eQ)CZ1
?g[UbV<>-3aK=(OH_HcL/YIN,QTIBO2(DE_H^R=Z^5CF:1VU&FT6c(^CMK_?8g0W
0I3]Hf,6@Yg6WQ.X=)4H\(AQ^bS:eY_SPd>4E/<0bR\7M?7NXI1\\cC+T5V@0DO#
9L8fKd,UK=Pf,gFU.Nb^57Q\^)AY4DPIX0</=<MYBUVS2VL,]QgMLFW]>K2/3G\g
[=IUN4XH6.EDT&3VD)GRUH5=3a2USc(@dQ-E1_,NKa.+CW^8eb<KJR(RLF?g^DIT
d,MdF5N#)&K#c,TG<;K-U?I:1Q_5V@=aT4Wb;<O8&0Fd;EY/c[PW)940LA33YKX&
)W9:4EU=UdA+C22#KP6WPJ.CAe58_VR@_@PQPIXW;YI0IDU)\S[>_aU(SbL<?;\7
a_L,2AB3JNGD+G.X-0LW?-BW5,T0S,TW/#CgRR,<fUTAfRAf..;V[^M_g6BS_J=L
-\0CMP/;^1Pa,b=D]38e[=J1LO251O3(O<-bD,>L;ISHV+7PY=8-0,G4CRCA1d[B
=(F?VBDD<3>@.FRB-O@(BYLgO6+/C3SFdZaQ9TN67gAC)S;ge&@LL9DURae?FBNO
-N<>f^/WY+3P9E>&71JceDS1@FU7++GAHVSE0-Ib:M>#+1TMXJ_,Cc1)4UU8>PAR
:4J.][M1UD@P7S[JK[a1HX_AH/cbb]KU#ZNEI0&)])YM4MBRE++X:1TX7)I\8-^d
Y3bW]YQ-IL^a6>DY3(X+A]X(Q7faT&ML5N-a2S\;G/I28MA6)]L4GYSd4CV)4@\f
EN>55>P3_4F)XZHd@,=]fXH\6O;K/0Q[>Og/\MLd;P2^=3M7[J9;gN-LX=UNQ@(F
.LDM+KBaB/K^.a7c/_CTT?X67AM44#4T:WeMQ8(/REeKN33)^+XW#@e)5?9,g367
/c\.,gD3ROJQ\_4RH[fR<CG:)2;VDc^<Fg<O80(gO2B(6OS1_Z@>63g@eNKV9&:H
d)>XM9LARE0UY\]Og\<9TDZFe-Z/(E7B5<e_4^LGG/GHg?6_e#@Df;fC6SI6P^3Y
7]&MfKU3]?UT0GeN(SN.=[,Q601_W1[][U3eDZ+F^Z.6P^&c\7J&J6(-D3Y_EE/+
;Tc;aJ?f+J0^<OMVHLZ0MV(La4OJ69]gJIA?FZN<g9<b^]eg(f=B2ISL6E_5:)35
fA(-cMa#76+H/<-SdcD4SRg.d#R)ITN@8.)cHaa+Qc1>4P5Y0?&S#FCO]8(FKW1a
:TOY0M&F/30,K@C(F^d5Aa-EL0H[e)LU7[.c7]cE<BbE:g>U[H,3[T8?-QV-O5PY
aUJI_XMAMDIaY@9,<T931,&F3Pe#=SLIO:3,:7_aXKD.(8W8MI<Gf:=)gGDQVB:a
+&fV\dP5F&-IPFf5,(76:dPdR^\dWC8Q1O07?8()R(c[gd5G<F^Y6eg\Y<9.<&>E
2FVTY(3=EP<T-c]cMcHU15Y@#fX897:0RPGa+f;GH_::Vg1U_]FT.QgQD1X.G_:]
X]9[T&6XP=Pg;<5?/WA=WW8-(gQ=0(A::?8e3L\F@eZGd,MR\8fHHW3g_dBZg.c.
QY<F@+/PY&@HM2/fF+R^N:aOL9/UbIB>U=,22bXBJMJ2NdY(\._E01C7VN]dJ\W[
Y^bcRYde6.2TWE9))PLFIYaa0.UOF3bDTC1SA,+_FI/VE5A0,,EI=ad\TOZ#YS.V
,a,TU<b@TAG=4Ea^.#b2g0^BG.E(;T[d;aFM3dDNRf/(#,=Ef?/O/XNP+V4b.,:[
cW=X>[KKe7DG6eIg>FM65Z+BYJ\aB?;2c)P2D&OM+6+(IBGc[#eE>]aCQeYI8B\<
BMc\Q9YZDO.:0QOS/W@T#8Ob)@&4T:S&Dc#8-)f8b2a0X5(DY]VQNaEN9FVeQ]QJ
)XCc._\Ea([S(AaZ<X<bbVR/dMF9W8&fK+5e3Z?A@b#TEB#GQ#eR.6Zf=5ObO,GI
)b)Za:1RHLTPMcMe<QK(H].B+MC\LXYLa1NED5d:84&22#@W#IPb@PL<3^N-WU&M
QMOY_BOYEW:IV\\/V+;a&,(:.dXJ&C7&DRKHb5J3TVM7:I2P97-Z#fQf.ab;]PF^
N\P?1/=>IC<_E\K1_]F7VNc3\B]TU(c#@34/d@FW]Q.DXNeB5DDZL];=PD+HD+Ba
80SK[@Q<6[MH77H_3dg885U^?=Y&Z[I5R,L;_<b#Z(WR;#/B_bD4@D=084O5=RKD
VUJc3]C+23Be]AC.8,ZE47\&ae&O,TEg36=WOLQKH]b)>U\JX\g&AJBWMF_gW(C\
^(D>]a^c5Z5U-X<,8O.@VFa5^&:Y?e2N(^c^..]9VTJN&&[G9I+I;T]GF0I<f\Y/
SXM^Td7.4[e2/:GNSE<B]PE,UMED60?^I[?]05WfPN2AaFAF-9G/9N6LC<ZMCb(E
2cGYIBfO&cA=gRcacK#O:0BV+PQR4F?DQG<(//+Te(,G8S8U9EeQ78KbPAfbWS?U
I+6#9g^#\>FWg8ON.7^c,#2^]f^dXW-a:3[O-():=-N=5=H4QC/BJ7c.aIIXB;bC
TGV(e#A1S.egP1bXg8;><KZ75?[X-#1A6<@PVSGEK^FEZ#4#eVMNXZ?CH#I]SHE)
X#-dHed\9#@fEQaPB\gReD05XeIY-Z=fTXN?4Na^YNBQ9GEQJC/0^7bD#HeGId-P
Z?FW&D41KPMV(]aIXE_ZYceU=3YHR.RVR[Ng5(;YCeGU@f])&-7EQ8MT;7OI#eB?
W=.[<23)U?PWePJ>;<O1I&2-A5(H3Z\W[AU^@eJ-CE^))fVX@Y2@;1)M,>SE;FG_
_;T1W6Uc0.DaAPCZ(gX;R+QEV[ET_[Og6L\U/Xee2ZO3c=<NJ/VOELda.4X^_6<F
;3@2Q\A,gY_ODC+0.E+IPPF4X<\WDG(3C)31IA\TX&Td\bPPL>KX&A;ITXNLT.#+
DSZ.^N3Y8M&)I=H++d2@CO7R#?R>DQ3MeKU]9<)T3H4]dbVcJ<FB]?^>5X[F&UD5
04d@I;SMW>E1LR>_ePC+/^T+#]C0GB(1f,(>9cACMMg@?b9/B-UM3C/D7^]CZL9B
1GaAN+;&XV6/bU&=7A8P9U7fTC5f:#[22gVb6EWMR]^1?ZV9ZMdQd3[5+F;.+Q9:
(:P8(38PPWA2Wc,#CReKf=&MUb2.)PFDY?W&:(+Y-U4?=\I_VTG&R?e0#\dTV#LI
;IJU]TL4IQTF>VH0&E?OL[f,@&bV&SW&AA]]ZW1eQ2ZAfC)^):D>Ic1dYO=\JIYQ
;0B<CTE+[<deB>-cYO=L+R-GRNSbRO2OR8OE6=.3.Q<_;^SK^9K:-?N[M\)=dL/U
K+,fFN+;OM6.@-U&,b;UKBGLNg;\B6SV]F9C2_g;KG\2O[LaHJE^5^2b_8.02#Y?
T:@)A<G((5Q[)[:Lf/9NUT.N6TW)7@8bG?MBIZ:P]B,U3g1.4>(,aD^eDfbM,+G0
6?JDL#H5^1G1>-AI@]9\bg[>8&ALNO;=&?7M-U@-9a?HG/5^R2@=TORC]e+,PW;2
,#DN6=24_(2MIH3bHFbB1>7:2TD0D,MH=KCK2<DL.QIO@/L4b1N;]NQ8>Q54g8J3
A\W@d^<.7.UaY,#?fcO;\,(H1CZ8N8H[EQ3N(&4+Ic)RO44beC9SUJ7YIBf-/@ac
;A&Y_IOfgAbeZ\YF&6<YM]?REW0e#UY+P2H00KCF8X-7V?\-:FZc731,6=gKAe.E
QRDY7MgDROLH\J0S\5M];He]f000,[F84XI,5=353)[#:-44L@(:HU6gVKH@beBd
WFZ-d)F2SeRZeY2,]\_>,KZJDSYc1L(94a(\@1X;ZEK7^0BXCTQ<Kc>]1<BHA+VH
BA>]7^d(g8XWG5Q8[G)2<,:JE1JKU+-b8JK)&/SG^1G885e=U5b-ac6BLVNF&7eM
/ScAMOI4Yc]O6PU>#,8Rb/Ha,f@d\P26:63/BeN0bdB4DQ&A6]&Pg+K#C@bAdbCU
:&0X0,KE[.GG(K02,CBG:_+CQc709::[6(MQ/EPEE/66)\WTJ?eOOP?^)EeX89:9
T6(,cY[2W3BN@f[_4/65Fd9]F6(G+bJ?:RZ5RGL,UZ5\?E0(UA#2dg.IE_WV,ZW^
R^cd</V/aI?1J^TE0.7Q&V9CQD&S[g1C&+=AAACQaAP#K=SXVBHWY@QC:UZ+TgWM
_#+ADS?E4f@bAO\T@V1H)B[NBR0+afR4VR0-efC.fYF8W,B1V7V:X8S9/7M)^fJ\
@028?gY_J[JBB[EHE<M[gA<aS@96>B<+7/65YLIZ,87XY&UQA]Yd@.4-H[<2#EL-
LeR58I+:R5<<&FT]L7d<ESJ2]:a?0S2TXZAC)6-aQ0VD+40XQ^8NI<?NgVVKc-I?
;B11YDXA2-W:\@YH5BP<<PR+Q1;;b^(bMHL>IHU/0&HV10)b(:4ID/=GDH,TXPPH
]]M89?6;A3-a4C36>.[db7R#+^1K7[cRP(^W/]78[QLcLA?M<OD6LH;E)4H=S(<U
]YG5;PgQPc/MB^M_B&)QN/]J.)8dW7W_MK?VF/\>BY]H1O.J[5S4]2EQ<)LW<_J=
c]ea3@2BJQH]8C\KGGSMBM3F\1I?:VM=^XWQGPBHOb3g7WJR=^-86W4D(>c>^7PT
<>+3Z9dg_@PTL4g4L-^aUH:_cR05c&-.7SgeU^L;BYT666,:NG\@8(-ORA(]B17Y
?L[/3Q#T\5ZIIN,<R#NI]c8H94_X7V1[/?W>Sgf&Rd_<e.R@bW[d<#D8-?QBPLZ3
W1>c0Ae14IVceK/>K/d/[F4=)c>(a1geYG;=,GQU<XFWb/M2GI=]edA6[7PS;NZ7
:QA>X)B5bS7(Y8=f.DL++F0Q,W7c^/M#6L^baOaWB&N5E=QE.LB+1fbWc0)ae=1#
6F=:[:aYK#X?\T5R/O]1#,TISbEI(J=XCNb\4Q.4e]>YGV=2I+,KA=HO8;DQ,#Z#
DQENL[GO<Ma9)0JC\<)?MC4&:-#)]+Z8?YLC,-7DJJ4#HNH(MHFfQOH]fYPV<Q^3
YLID&Y5>._MKHd_ENH]Y+cA=X:bf2/eUC)Q,W4>94[96VLY+JO(bOLOe6OTeLJIT
bF5@GWb&cR+))5F4EY1HZae4TDZKOC\TKNb]7Q;MY_#VV0\WHFO6OR/BK.717K>L
Mf)d_(4K5JPf.VfBXc8[1^?[IX:0O4eV,3da;9fWAFLKK()08c[eW_Z8&fFBQ,D^
R@e-(QOPfN+VL:DYRQVa1Pff@^bRSO3QRe2CcN7,-\Z,0<V2R5-./-UeMeN3PDWG
(d:d9,,c08W3,1-=\:A=]PD6CE[^UBLXP>(1eD,G[MCPXHS5P3;^K=3RXO=(#M<&
ac6KM.>9^4Z3GD]OCO@B#(:EQC8?ee1/YWKAgD66M#0Y.;3V[;>8DF,:IZ?PBB;(
<1<eXaMOURe\&?;K9S&eTM(+W0,4F:U?ecPPc_?QBC)\[>>WV45#:EH.?KOKFb<7
Ub)egb:DBE&+U.gWVaRLd\]Z-J\01H]fT7A.41#4_E1C)2Q:\SZN?)_G8RBJMAFE
2NV\>4R,;)8;B3L3R9C4-)BB@7&6DH[L5PM;?EFM?H5F+=,ab=>QWCGff_D0ZGd/
NCZ1V6B.JT,BC]\QX/GIZTCBC>,&7eH#=RO1N?R68IG-X/E(0gf&A#(89D_4TUM6
AfMMPS646+/BBTV#0Q^&H/SfRM6]X1a6e7-M^1=C<M?#;7/7K_O3&7ZYUb]EMb>.
]e.@cE/M?Og#?QA_0XP-G41>#c-5?R2L7I&LgBQ?+QaYS.HWbIUSH(SDP\J:-,3c
?KTQ8ER190?5B;Y-IM_)LMYg;W]\;^,]/GA2Z(AS,:>BGEH3gN(JFc,90dZG_96,
+F#7S7[3.12,#Y-DI[4ICJ)bEMf\bC^MNIECL5TDA<=GY2+WT9L2@Z2?5:Y;\WQ[
1?(2adf2ZdWgHFbA6+eMUDJ_;4#C_Ne<M?/7&K;GH+DL5Zb)QdZBP,c1&LYX3ZH-
ZK#MU;M.A-:@M8YZdAPAg>^[CdgBcIGC@;D70D?g-FGc@=[2HZb+:D)NG2-UNB0/
WVDN-OaYJ7D\B00Wg@V6<]Y2Y/2.0W9MA[\ZJYbO-Y(:Z3KQ?Te5WN<3/#23KN7-
:MQUFO&c:LcIVGKd_&6Y:_69QA;[c<J7_,9W1UT3aK3O&&B^EYdb(,G&:fU2-)eD
?VWC^>K2\/J\Ug<\Kbf\:eLU4[-I6+Me3dLY7TYF.F;]YG0dDLP]:S,(RVgH9SA7
7GfT>CQ;dTd=YCR:a@V:REa)Jb)3DOKJG^9Z#P3>=O7-\O[_J0LE@HefC\_XE_M6
R?6H+\PSV3e5c/#(ILgD;3f(&d>,=0<&3^#Jb+C):,G^^:bLL3RK?&1Q;YZadfBW
(@,?=E]4:Y__7.SbbI&+cR#:#cSgc8,T#WZJ@.>L[QP6@PJ2DQZ0T/BQX99#P63-
<O1_YMU@bD=bB9N=89Qg]A+NH&c?PY[9JeHN@4A4JDV./bg&/<cg66_:<5DU[cI.
X)g+.dRSBOaGM-+5V;g7C<.Z_Qb?SE.GOAY,da(BEgg3-g-0EJ-W_SCOfB8KG@I>
G=TI6=YYD_RXd1(ONA>23fDC:ReZeY>,^Kg,YQNO,20#\6;7/L-OWO:Vd7ETg&YD
JC[egO,R:TK/E3b..>4Ge93\Pc:.2=;FK[/gEaVgCCU+c,^.;dOZ+1.HXaC,-(5E
c2BMD(BA/&NLK]Q@b/K[3EA,075UGDX9#TL>P4T;Vd]0e2FPZ)4RO[QP+A(@dUSW
:G/S(J<F@<HT2gSZ#ME<Cf/70/U-TVUN2MI4,E6LeP2_NWeV+:=a=A&b,S.WZ2>@
Y_<\a9(K?Rc,).9,eG=1)e+^2]XDE0=G2a::Q1MP?Y3M?]7^,_5,TQFB6Fee&X+P
^XXCSAAV+QCKa:5a#GfIO7([(JLF=).VO+X9W7e+U+U(-(J6>bTX6a0=]3e>/I>C
,AONR>AXW/NI)gC0.0DfG_Q-^]3(?]5MA@T+H+1GCFZAQIS>M1c?M7CNgXN_4K-E
eK68[L@Ia)ObI9&VeV:(P<>G8);XDfVKRFCPJR&F_=)(=aQ:4S@@M=HeCP;ULfUA
=2S-6V:M[MH,D=MK,51P^+N/[EaIDYS719)/+aXf,D1N/1>5.A>/PTg>Y3Zd_HS+
6/O@1KfS@4.gU<7[JW?#]8afc9<X#C77>\PK4GeJQ,(?7TB=4g/-0Sb4B[#T62FM
B>Jb\Ma/5;LccaPWYOPg1?e<g_[66YYT>0BbB@^EZQHM&88+Fc2Z[eO)^DJ?d71G
F(N)Y.+M<?HDC^K(>QBDed7](A4Bc8^8f[DBf(Q9R[T?6OY-QMK9W?YI55.WgO.9
+f.>-W[,V3.MMR(HMD:>+(=6D7XZE)FYKX.DI,ZQI\Og(XL>QR_GX.,D(-8YU94#
MYfDHH?R@B0^7(J<)HT;KdO]gTfG&F,fY.9CN:J+)+-?af0B248c^MKL2RZeMTdF
g-U+cDR,EdgLdc6:;[+Ca<KM<&HG-7c0?(NT[S\94AF/<;ZCL:ERaWYag-\EE3[g
c<HcbK^HDKT-E,01XRb((Y>]-Ld)U_@@-SO_GN6\T4ZU<?f^AK/,38:F-#@964gd
ZIYH?;Mc_fAW]Q9SQ<g-6BCP2>LXSK]GKf\?EV5A\G91g[DZL=&TR[2c5H@SD.g\
e7FFT>UB;8cE((LUJM#WO_\1OW?H4<+(5P9eCKKIcc?e3dTGEQLG.?GU_PbcG/8c
A[U:.A=3P=O=RN=egNFA7>V._]9V?d]SS0c0-Rfe;T6#I7K^.IbS1A8VO[aC@M.<
LE:JE[RH3.C(cUZL)?J1L[cPDDaKQbd6M^LWQOG.?)1S3/BMBJ(U312AWJ1Y0<\2
0XLQ(fQ^RDg&\7F^AK+)65MB3:MOT-.@CT06D_PYG/g[K=4G>QJV4FGPb=Q>a2b-
9/R@4F+QIV9GDC>9bJLOC^0S7[?X6OIK<W2J]=K\32#.^33DBUb;;#]U<5.,WA[U
/P79[_/aK=XO+B1Z-D]/P2W,GOJP@]c01_b&,e.W)M^c?QF#D,,a(\TM0O#/GW60
W?IR_:(aE07^41U;(CFV56f#_PS:X7V8#DQ\1@:PTDS\_GfH5d7I:>>g9NIYT@TX
ZY)X\R@-T^STgG5>HL\9\ON3VfW>2,EG:MP1<9]:L;.bR.W#D0,]V.X4J255RO_&
]0KL\TK^RKfRec)F4O60a-BF[/39M9GLDTP&3;--GCdX,NT-eEcJ@4V+;03D7>(M
.;7f.(Z??OT\A;(SEJ7C[\2NEFUXM9=UZ.#[&APg(K5OUX:f36TJb6]\caGF6:-_
e]#<9G4I;5.A3EEgfV#KQTH/,]VU=+R&4I<S4\ea(B-/<;gHN(]fF=f9e^c8GGK/
6>3K(\94EcJb@OS.D3Q,/./Q:Sb??dWDCaaO-<7XV/<)36_Xg=&[>KBVWec7R3>>
PM@c[8:ZaEU2I1(YN86A46A;\O0KW,_N1[:H&>9&S<X=<=HX.M4<RFQTHF7(@Ne?
:M2ZSDT)06:af2#[GM,c>Wb(GD=W]^bY.7cRWM-4IQ#ZO@b:;]eL@UcQdAO27fA#
&?KU<TW]O&N5M;,VUeYDaG-V@K2G8P6T6=([4]_V#^R;/QS;7((X/JcP0::eF3[D
EcLLLc&cE8@RVf&WRVb)S4T.]7f&<MT^\,aT[L0]O:MNKeAde=f<W>BP<D&fZ\Da
RKTC:NX(VU3ceM&<f\f>:1S+KYM?PA\cJ/^=6B<?a6(8ca,FA>?<.W>.]eYV&I8Z
#Hf[(H2@RVDKWP2&]H[)DIabLEQeS5:,F)TP7JU?=2Q66AeEKe4K>\SZ?H5dB-TH
T-]Q;7VA3^JT/O+VY@?3:Za/&#<K_<1?a@L>_)GfIXMQgJf^dY<@J,BQ,DDWPJR0
.25]^H2Mf798IS+,O]QeJ/MKY&Yg[JcH)WQQgW:J,]^gPIZb1d()1dB\EEZ5H2TX
Wa(fD:U3.KX8\J[cHI23cL>Kd]FQ:=Q:VSYBe4F@U-],d+gCbX7/;(,c>DXDY(GA
@?-M:.0.:4bJbS&7A53K-A1aK3&R58#FKf?EIR:L)/_<1<S.VL&:a.LHOEXYe0&M
gXcRRR;V7Wg3)8c1X?1+<GB.;\89FP#U6Vb0VU?Sf.D&F?84eY,[a,a<f+QRY1WT
<c(ABI:U\egF^AE6Y/\#CfC&O/7R,b:(#>?XYZ?[7WSSP.)L.?@G>&&WHX:\8JA<
/ANC[ODB4B#Q>9dFVLR2)eAI>[60,S8)K0HKIdNa+fSg<dOFS^6SC_#?UDb:&1<V
<3a^(\gd8]([1ffNTKTG2fSSE?edaGQY,;gH/-S26DeD,W16A;=2OT;;.)gTEP1c
;+CGYW?2^MQ&M9BF77dV(7TJ6;-IGJ3&S7-R>\&^A/8eUJO@UP2VG9.,.EWB5+\E
a8a8-5\HWb5?S&af3\3ZG^,];MK-,7BS4=:(Y_W\51T#[>;\fK(\B:?M3@:[1=W,
@I2I5R^<+BF4cOZ,OM-@QT8JX.d0-YZSUEOU]B(<c.B98U,X&0[g>=J9I+M#7:L?
.ML]D\<Cc3MVC=aIVQ2=9EJ/,>fVO&ZW_D8=Qa:.:M;TMM.dLd:Z&V+2Y#PR^+gA
Q<27OJ8?dAT20#2OHffZ->(Y1)97JIcHO(f1=>TY/Ag5+(((E@DdFbIA/9?6N)T_
K9=HD>,DU8U;PecG+D2)f1)0ef-@2[8Ma=KBFHK7bQKdUI8gJOeWB/Ded,e\PKV>
aGR+LBg9+OMDB\,<NVZKg2GcTM^E]G\44]cK#W9HGf,L+QdB42D3MNYT3>_O=P;R
3^RO?VRH\a3O,R74[bY[#>(?9G.=DDR:#5gX0[A_[O_3I&FPIaB.RJP1+VXdcZaK
C4OQDQYWAXIb3L_Z<W?G\M0:&@^e;O>WaA>O-#D0eeTg#I^<Va[&SY2\]PN]STQB
P/VI(A5d?>Q@X@,fB&+26Q?48<fIQBF\W+4Dd#<>K@a/aLW&.V9d[&F7O(G.L1JB
HPHH^S(18f@d;#g7:aN5+BeZ(82A=IO;U8I6D3A\S:(H3#ZX^^I6[^d5W&BK;-J?
fI:NW[E[>L)C+DY,GgeS8(XIROJS/9Z7g2W7,-AeB0E/^U<S^HV+0RD/D^_ZX7P[
]c.R8_0M(#.DbI\33Q?VO@#)b.c51HFYd)DFSY-Q]01.\B-BBT1#NEGW&C(\?ZD7
FXJHGea1S4LV168Z?O\QS8(^EC:?CO^AX&e2A;#+5KKFM5DYMGM.QXW)ca<KNXIN
fR?#8ALcJ4J_)cGBYIbN0]0R#[4dOFd5&]8(BKNI=b6QS5.&fY1JZ/1FC=DL?4GE
>0&a-?X:6KZ?a4X@ec3TTgeGT@L1@eD,B5EK8UY>b0M&3,#Q5.ID5EPJU[<4&C86
&@9g.7RBT-CdNW(CG>6#K,;5;FZ)/FC7MKE0DK=9c++ZX3#=/K36,.eM)6G8?48S
-B3&+?GfJUTMH:cEaaED)=U^J0VAe&AOST89)ZS;e>;.\a+IIT2+&>;XWYQB0A<?
DMYg.^U6B28THbVU)b,__A:N:F\22=ODeNJe]ESHa2c&R/1J+?Fce;=5&,f;Ta.c
O&L_;EDK?5H6dCPc1g7Seg\fF=O4I#8,Ld+^U]1VF0@._W+a3TY2=1Vb2J;)\WY-
8(RX;J+9PQ7/D3ScP>;3CObR_-[Ie?\N7^c.+V&/XF204,+&+3,ZEK4,2R\_U\NZ
0YU?OfQ,bT@F6Y):;=;/8-4+]:>CA9FA?^b0D<cF]OEL+NeMe2N@K&1>Y&LHe4-Z
-[50R;e(D#8L]d6HB,Ef5dA2?P06?//0U2R]1Rd[Ng5.^IDf+WRLTJ10Q(<3NC&8
HB;;GU;&aGR8D^[8+THaAI(.=+SXYWN8OJ=[\e4Y\(>;L@34KYXLQaSZ@bS^\<#a
aJBdaLU.Yc+T/FaYSae^I0?g2O&2cafL=D?PWca0379,gP]cX,8^C8O+e)D_BH>X
&K&3Ua;[+e899;,MOM63R+XH-@cGZX6EHI^T@EeL1J,I,HGVTX]=VUL6;#7Z>#:#
5RbfB.TeJR-_=LdEO_WB;OB0=0X@Z8-8>g-9e-a8=D4BBB]#WBgd#L+9D/AV;W0X
K<SU^I&8H:VZE8M(FN0M7V4YG8L86BEOA&NJLX#HN31XH+:,:Da]=P->dA1f<9aU
cO>UTYbC,)=;W4)NQWGd?K]_YMU][0(5f68JS6a\RQ:I#c5?16;8Y6DH&UGCd8MT
F23974Tb][+CV8a8):g79^>,=dfQ)&-ceEC>PT5]RPL7@-f,=F=7)TQcPSQK-2V/
W)\JO,3HJ>C^ZXIdW(;d5]G]H9.-YF]4FX9?@.O^7D)]BG;5g]CL\+_abOcP5+D&
]D587P16BLBaB=\VWZ[J0EK(f^]Va>I@dgAVc&YfSOURa@0;RP&,+G]D9D3HI<Y>
5Z\G?[@[I+5@Mg1#;gEeWa,J46d[PUW@XE@>MN[<V8,M@TO[-QX_V#U57,2beg._
95;=J[[>#2_:WgS^J2W-HfR[9^)M,<40GKU?24VY;W<,N[a>BWdcF.F^B@(GFJg4
F04#KG-O4S)cV;:JALZLcT)&GR6>A<7PLc1+B69;H9eT+TM?_VQ3E=H,/f0_,2==
=SE5,Q+Rc)?cH:_@?@Q4X+?PA5LN-#@VO=G=6@cd63&8NE6Qg]B:VDf=QH/9CDgf
ORdB1Pbb_\aE6/S.3H51+)+<I\(;Y;ENGDK?cLC85-8]]bDGVYRdB:@UZ=ROD^PT
\d5>L/5]CS:V#AF_RTAW5K_9FGIS<>B4_<-._4=(^6ZZY-N\W^:g^_>10.-R#^?8
c;X-O-97HS)AQ=F#MT(XAZ<,U12N88HISC>B@W\FZKMIeaCcPYH3(IeJ:<YUZ1RX
,,81R.\2eb+e_W>S4HC@_HCVP(2OB&aE3IV/<7+Xfc<=(&)N>P:P@MML\gb(c@L\
b,RO;N.+5G7faQ:->[M)O7WX;+ZC:,<Wd7?A]@2<5&TYHMfRG>TD>HLOP=?J6:#,
N)b^TJ]I,729.eB6)UL]NU47P9R4c<fNaOD[^gIG0/U2e,5-[SLGNR[C57:PBU(#
4PbD,T@f#?BH=e/>WY1C29gP&1+#\NFTBHW@^fZ3HX?C71dWT@G:5@@8;<(=d/_A
Mf\I5S/XL4A:AE(5[REaGV_B1VNS:X)H#YUTR+L7ONHE:[/TA>9:1dLTHa\^#,77
R\[O1KD9@QK/DcI\0M,LRMGQXPW@633R>U2ZCNJ.da=e7^#2?KX>FeE?EK#/\H#3
<4OKHTc:Q\0_;A^ZF3I7J3LT_>V+,&Meb;>,)WAH/R-T)GZSb&U0(958.X.J2WeZ
HD=<:[R:b0g&EU7bT#,A3[bC1VDM8&a9#c/#S[^JVDGb+eE[a^:W?46c[..QU_R9
2S9&g^IF]DA-GQHWSJ6C6OSgRI[?&2FM5P+@2>VCJKMQX6>./2Y[@fW@M>;,VRDQ
9V)N7F+ENEPaG;FR3<XXBOFI>U2^_6604L-RXOR^7Z^;ZJS9RJ+c8eQTe:O(<\G=
8QAM.3g)0([)^gOW5?Oa@Q4c.7F2D]/U\D@MNb=fD@dM.F1SLDM;2;&9\G<7Ga+_
Gd/d_VM8,KWcH58cc8>(cTTE:^e16FDWEdSWe?-61a.RPU=O,>E?8(E<.[-VaZbG
H\EITP<WJG0ALUYR;[3G\/9T&/#e^M&CGP(;7@C;<M/R<QGHSL&][/bM]O/68RIY
].^B=gU.<X<J0b^>R&_NTB1CC_K.,/DEb)2/0=T\gWNQH\eE+gQV;3U+9,N1<4XK
^ggZ:gBQP1:,3?V#Yd4WC_].5cPe_#/cBIPV-+<_3LNEG4_+B&VFLV,B_#4R(#E5
Z9J9L[_JF2W_S1-T[VaU#>P]<d[fH3#(e7B@,0Df0)L#ce5KBU)T:B=PHX(;_-XH
d.]^4:3J/]R>8cU+W=F&IfWf?\/fOL5WI0]5;8]E:[6KL=@RZ1.CC6?@UcW/3L.1
C^3RaYb0gPfR7M[8EY[1>Gg[deH?STF#eAA^YaENYZYFbP<3O;C.;[>8AD9YULgF
LbX.2&#Q>EG=<DaReF8NQ/Dd<0@f/3#C=&7^+T+O_#Z)2CE.fOc,UL,-aU();3ef
Z:N/Z=(>.<QJYV&HRW:CRgaU4^X9\)4.Xg)NS76fVGaG<?G>P_aaSP9/bL30>YLB
@b5;N>OSKQ/6ZIX6S8&I#WM;KAU\1?9DJC&RGa],B)_gY)gU:2XLRffPFNLBBLK3
g8/YGV-;_96I(L[F^IBD<Z(I+?2F)gJS&XDF\^(a_P&9&;J^[MBR#3C]6(D=,K?L
=7_3?Y9/,&+g@F<V=.@5.4:HG58af6^KA^8?#4g/L0RYT170WTLP/\aYNZGS,P/S
6/JZG8T/XRBCf#S1PRNb>cKXdb[]EUM5X6Se/,aPR.QZXBENe@VLc?65e;BWI:SY
V7f[Nf7CRF5;_ZXN-\1Z[N#BfOeV<@1MdQ6QBQ6a\e<M1:>)Na/IRF^JC#/970LI
g\_UYCZYNf2,-5_LgKD3cTQ[QD&&fC&g/7E8=:CE)]<PF5?W;PXSO756MZO3\3Yg
9b@ZDXO#(R(\\4LJI)W)KGT/_08GfMWI\ae^ZCO@Y#E;K]<-[/:0AUYJ0GcgTD96
e3XZ5])>9WGAO&X&((3K6@eV;:?2Ig_#D](;K/A.L]AW01#3?:BW]a&b=X+b,AA]
e&g3?XC]^gXBWF;YfF&b),.ZN7;G>?cUX4DTAM_HZZ3f/(#_O0W#37_/a.bEC0d5
1\63T6UMN_6eJR)B.2F[7:,5PTP@;YBe,#IfG..<O<M;30[IE6)S-2L)A=CZ<AK0
)?5C]C).&>Z]]P+CZeM:B_ZdaSE<1=]gG4NOE\P676=FX&NPPdDMdSF;4)U/NNM-
B@8(aGFS+DPNGaa/e7SR_+V22d4I.RSQ>BWCKgUf-3,Z3][4b?DJS[AM6[]?UeKC
KD0.VWUL<#3VF0SY5:28c8RQD4;M+,[6K,/Of>RaH\\T\R<5[1L/4UE\,f->TCZZ
Z7>b9?-RWE@KCB)(R)LH<XJQWN?cY<>BT-T=([3[Y#>TbM\Q,1^F5-g&_,8M<b[?
I5T/XPU95gF+IS27#P=c<?EW@<HX9HaC[:,2Sf&5/cJ;S9[-f+EJ#MG;9,UT71Q?
FAb(I+B,-\0RQ2fJXSVU?2JH;OaN.OC:cS1#Z4)H18+MNX-:5HJTb^/f>MFAH1+8
RNW>J9JS-:-GJBXB>(=fBSeeNW-4-[dWK6ZN^c1AfA+6&aD7UJ[GWMZRI=fc1KM9
>c5B4_SR?MQf.TO-SYVM5XGJE=b:?_Ce)<2fEJ[S2b5a2fdCaMZ\cR+YI4db84XL
^1#L7+<&.S:4OIK32c-FXTbRP&;ZL)[L=+WO;@=ZUb6@M3^.8ZETPZOC1e?GfMW<
JeYK=dHV>6;>::/AH13LFC[CJPNK5.3Y)]gUG]C^6G.WWL0X7O;\c6.eA^?+bg,D
SCR72A6K(;D7O\@]O.W)bY^P5RfHMg@\AeI,]EW[a/gdK,c^4MfZ[c,O#>,.H;1]
N8@(IeGa\LA>Rc_JbVSVNVX#1I/IEe46KD]677=N9K8[D\EORM,+]M892LfK?M,?
=5.OG<.#\L#K;0AXJUKN4CYd_7O2UP3UZK,0>eBe3N._gQe@F2>3#K:\bVPM&^B(
)MDcdBYC8XR[&)287H7d<g=QFS6CRC_ZVdW30KO)4OMP.V)=6GKU2?_VZ/cC)\MB
\g4_?)Ec<\3WK,RR#Z[6@df&TgE<PYY<B6JN4U0D[:A\eNQfdg/:[C@,B_c=.#6C
=&IaA@)11S.5XT@2?f:X1UO[3LN7eYBI+6XKT14GL0Bbg:2#?]dB9f9U/e,e/VNf
D4fdK:AIZK47&))6f@Y.LaP@)U]/ESTM7W:7M0WX:MJcGLQTIH6H+L&BOQ@#c)KT
9g@P[X1e;]SY#@/g1g4>9^DIXEK0JF.5d[ZV=,bc_ZEG.;-\X:^e^eC>fK6&Va\e
,XFf,>)T?5(YL+@fC;JL0?b3+Of>gK>3WTZ]<1_g80UgT<gbGF^/4#AW[g<P0?g6
+(C[H(#XR+]B&W1_FRO.T@b_7>G?<9M.(fM+O]S,N+b:QeY>=;]GR,PWe,KQH,YD
SNdUUTUNGVX<UcXgQH.;&8RfbHGATQ:DI&O1N51VGIBNGF.dCJ4<Z,026VAM,L.;
TdOeDLAC?(-AE?B;I_d^(/0_E=\=EJ7aUR?K^(8gNPC5^e](8U>-CHW2LD)/aT<;
TLUE@SXW#];6=@#Mb<?HUC785b=VS#Y)WQA2<14=,cb92+WHb?(5[(bSJE4@FP.?
Z(:LA6.7>=Y1T;0a/4]=[-/<LE=<9?W3)C)4C/dRTB^[<_W1#/04BO;3V+H(G=1&
TO>G3@B,(ZQ#N7Q5_EQK\fXUVEKR:,VPT)WdIW&b;3>4Q;/Z>Y7J?dQ48Y\D+d1=
DBPQ>68dXEX9VeB#J,ATbM4XS;^^R+UEfOTQ4)(eK8KG.9^b0eS>Z,RfNOJ40YgI
@4V8GD8GfF+=&2U7]E(9HM#Y]9QTH)0[MGd]M3U&F@^0504fM<;,O84S#;2UW?.I
A#OZN64)?KXeLE63AJ.6gYDU@3QX+9W,IYEOWS&<>f2I</X\Kd3](.[&J2..2b:_
92-TEEC@,f2P)dU<(=<b,T5cU0aIF33])dg.F)XUVNFZ.]/9-W6:#UeS0G+U9c(;
f:KC<_B_+2+g&<0Y8=O2K5(BUaLVS+ZRYO3XOb,4GS^DQ3W>TGac4EF#,.VY[P]f
gDfH4-U2]>TZU[A>RfCF,)C4?>e_GL7VR1J)+KESS<P>QVP@V<DVZ+9&SeF/>0Fa
b/:-68FHV&VJ7E[R(1B8aCH\/GY,L46\K;<f=Daa?QG?:^dDg6PfWKX)<3\FB1(\
S@[Xf3OTZcPg_L?B0(6@-WJ++G,eN@g&VA1f5CRIE0^7+@?44\Cb3b[80:/:.A\E
KZ:CZ#OK=2&Uc0@/NK#9e.+)^0P-^HBR==F)[@[Nb_9-L2eAN6Ue-fLV[+OOZ8//
c&dB7egKTI;[9NfZWYORGWQVf]#\<R2C7bR+[<5A,9DS0Ka)BQ&M5A5b#;:Ree/0
1/QU@/Hf@AgS(=_JfAc]9a3Ba[72:U[/ccB+BHN1I#(QcHQ<<;B28\+]f@X.KO+O
Q6>7A_WdO0:8dfXR7=b.@9:V:G5SPA?VD@bLaO]2Jb,]7N4a7f5,MCFPS]NQZE#K
?B0]KIP.2#g?WWCGUH2RF:5;?K24MF\4W&+f]PYcVYe0<P,-RZW_7<)<389R/77b
^C,dB5>8IP.e#9<1?8XB>,T4g?YJZ9B47+9:>XgJU/VUcGH\b<7UFWcf+S?5)-]0
GN;=TB3,31PK;DAL_S5e302&K7C/,^Y>\W@b<1Ba>Oe<W1N?L0OaG>1H8+9<E?,<
&dg]TB>JN#:55OLEN_)JCNgX>+W:/#232L14_;_\_V9P_bOM.G=PTd>XLMH:Q.TN
eK_XA>3ID27?LPeZXQB]ca:6eD.d6[V4(gT?>a[E9J0PBW,Y8Q\(Z_&(Y(<);SaE
UX5.1#,N7NMAN:WeFJ^Q@O:Y8LFOT?dFc5.,Z&(7,Sb7K)+4MV#E2(F_S_G^^F2W
YJH8e8/NK=F<eP<P)J>CQQ5T>3PC2F\VF.E\D]YPG1<1-0[Wa+LAGc-&]?O(?+dd
[C(Z5K#0WMg#0Ab54_[M6\[Y/RTPSA)M-#T^YP,SfH<C^F@9=J,3YNb]K9ZIY.a>
a2Ke;23C9bb?QNa5J9FAfgZ7DZ:cT87HQ[RBIc8J0B^][36KNO>>@b42D,?.,B&;
c;Ff9UIdF)b[d=g8A#&_1[7,1#+)=f5fQ^\b2eTeaWV57eS15(8AA+3OgYV/I)68
gdQcYU->>R.=2@S@OL01>\==ZeGfFbJ8IGd\R4\&=>KRP/\P@U^XHKTJ9Y(3Q>(K
L\)WGT>H8^H.dFAb3G8=ODf4LL89^M\+Xc.RgL(N16g\c<WR#<S]26eVMI^1WA]=
He9aK5:[TMZ6a[+7=466Q=0OF,30Y_2H:bF3SdgK-)De8TIL-Pd^bDHI4d8;WMdU
C4S:H&>1WP>Fg_b,12^/W?84<;Oe25H/#&EFb)F:f3e.bPF::=V4?f[8@:Z74b;^
O,OaI3><100CEN>SSfd)VJ#T>HRM7?1LPER,ScK2Xd#VP4Q[.-EYJ]?^WQH_W:>?
UdEFK41#Zf2,cd=d3&M,\]&^V1A@5&M\<C._.3bM,eK7=1.RQc(XZ7-@JU(YEZ1W
<ND)15gOI2@eQ1C^]^?bM@.CGcQe)M-d+UG+P=EagY<#@/F+OUU[:XTa4efA8D1G
VY^^,CAB9ELM1SRMEOH]bWB=LH0P(+CDY3g-ZCG>J9M8fA10DD3SJ))))6N546eS
EBK3XZ0Z-11Y490-6eeE1,C?YDVe-,@3\4[Hg]5UfgILP95?fZ^E.;3bNIO\5J.R
;#M_P<F+>YU;U#JTZ9>WJ96DbR(O_>762.=gG5SC2OWZ)g-WZ80V#caHY-ONJZ9e
]O>\2RfeK;PgbAbHH/PX8I07G/(OQ:^[\.7=R?<M3V@E<&=EV4T:\=\+JX2WK1aM
9/cW).S8W].L^e3COP)IO:9.Z9N[VA3DW0R2QSEgRJ-FT<IE.(2LC6+-6MD_J)Ja
2ObbQ5c)EHf90HO]1XVbfY3e6TNUG5?T5(g][-5]9e)+aYB(C6_H#<L#6?@S&eJO
e^VJ)gAUgX1QFT4G/[ANP[PJZ88]@B^UO\_Z??,2;^1[UFAI1:8/2WEVe9EgEQ,E
_AMgeZcg-Q46QCJRVe;3M7&XC,1<WC7f&/YPb?5IMC)UD_DHB;WR&2]VaM#<4+EI
Zb^8GL;9\4Q2=TSf1^H\SMT;\@=XVL,0#<BaLCR,=.8>d9g_Q+fZZ1AeMN3OaMce
58K:0QJ1_,JX76e_YO=[V&D\E3O6Aa;fO^V8>P?T0N_-6cA8cS1Tb89-V]Wc6Y(D
bT\B1DTP+a/Tg-\T<[&M;OMXU_WVQe5_]XLAM\_-6JY@,NH0N#>]5D;,,4M>T]9W
.3E=2/Ne@&BaNYDCZV<3,<a+)G^]B4?J]-QeDX0.XT3+e=LK7/)cP)c<P@TJCd)?
\)3)7Q#(WG;5aBH0NeNd9-3>CP;5ZRRR(4QU[Yag&LX4O63X(CN1589F^->2MS@&
[AW#6RQ69eg2)H__4(Cd&9J435[=.e>YbT/A_NS<V<MSL1gE&Y^D\PWO>a@->5W_
B)X@.cI9\[Y-FKEe?X7RJDgb:5R:F3K.CUD=F)-@K)>d(LK=EM?X.GbU(SN?c6NG
E[:)4S2J9H.Y\-C;Pf2E\SKWS4:R0HAOMY]CA[F;>R9[P419IH4(Td1D83a+#]b.
M[[3UX@JXG4T0(+4+(+I3g9@:>W]<K=16ZPO+Hbe9K?cQTE\1bg#4N-.3TPGY9HF
\/,K)04U=_e^M]c&3V1(357?0Y&fXZ1aAGR.ZOM)>2a/E;YB(OT/@VeV6:7W^X9#
&4;FA-SRYQ5aeU@DIJ1O2WAQVAD75Z9X6U77;)]Hg?VX\.c&=?#E+RW,C:<6V626
BaK;/C(2cG:fA4IBd+I1Xf)M.J1AS:bV/1WUANYZ=#g2eE@c2S=-;a.7>-,02RZ.
&I+eH?G<QA3S1-Q#2P1Y?M&D@G>4+c8N1J9Yd>8MDAag6b22P1ZJ4dSGD:6JZ,eM
;b[NCdQ5Ma@5e^0)gB3-D@f,00J3Mb,+d<b7H3a15-eaM7O@<AQ,b+eD0^3cQKcd
YY0e?@\UWfQe8/NQ8Qfg89LC]+cd;V?_10Md>c<001f:#[5(;5)_@J#3K5H,_SH)
L7)NY/[g.8ZZ6I?OKR?#Y,-9P>^&CdT4E4C@\3FOD2_gU#S:I93f18?aQ1;]4\]&
P,3XBVF5fc?/8J]=1^D0M8=(454F,>LGcJGcgW_8XdA8aD7EI99c2NOD@]f(dW5[
A?g:VUF[ZL@\e+)OaCGU8N/@RBTAHIDV73.=0=[V[7N-2W,R5@UNeBTCS#<L3+a[
D-,=+]#O/=8/O9J+9ZJTG.5;/@W3:NWbW_[fc5EH5OJ5AaH(U7CMfE(gIZ0_@4)5
2UcV=9Ja4\.GH:M#TWOLCWNR=SQZSb#_C\f;bWG+<dJg+ZO\3<BW.00A4[WeISQE
=&b+P]BOYXdU[=c,.8R1,d>S1E?E[H2+4#I0YB+E_A;=^8SU5&DFgf1+:(5c]aTG
aL+b5:VNb,8#8+&_O9fVVT(3:DfODd]^2/<+,W),a3W:)DKS#(WMQLb+YA<]#f@)
1[b_#b3C_]=FG5&IAV.]H37R<.FYcJ[_L88adZX:U5>RW_cUP4OL:0]<5GdVdMS(
;EX0&d<77/gJe[=V4V(cOM+D>LBW6Y)/OMWVP0EHJBJ02UX6KO]&[NF.]^EZ;R9d
G^C7\O[K)Nc^E_QQ--Q].N@S&bcaUO_UWZTJ3W;D^)K:<Y(BP,TVE[\;23AJ8fY^
V43+Bd)8f<39Gd4Fe>JbD7&=+L1?IQT<I1\-7+L3cf<8U1:#T4PMYAS:Hg))B14<
LI6M#D:4H>:1MV/+I/4CR\4]&?]\Aa)(:G^1U>eY;aQKOb7DI;WbXZ[;A6-4,:A&
::NTaBK91)5_E-K4B-QW/BPe>==1=S2]gZ]SXFKQ\_HX4:D35TW4GTEQ,FL[T:Fc
dAN28A@76TgC4CA&Z(=E9R8bVg-g-OA.G-TGN&=_\^N+2;J66_ZPAa8]E9:DA6?Z
-cP5X/8?>+4F^&:<aI)-V;6I#\4C4Y),3E7G[fWEdS3V5]e\ObX\N&:^^HL[=Sc7
cg\IW[;2_):-Wc#(3b_K=2+Q/B,M2A=_#-a9H4a=/]DKL@gQVc+C3NY+f?Bd,V2B
JTN&Tf1a#8(,-6?KE4@V^KE5:9HLN:/B1X=A.PV-:?:+D;&6c02@f?KaPOJVH+Yc
g:6eE5HJ9f>K18A>7?T/MaZe.,RIJ+:4d=agHQCUJ<^9(;)b&HG8A7D18T]2/cIH
L7L=9^=LVF._Y.[U;db@H(E7UFUE2GZH6GZ<14HMH;L]f#4De7#,,]0RV9(88cR0
fQ]>Ye[=O=LUHU@+F:_-8PY+dG7F(BA?A+WYPAFWXZ[H]g2QU6M7\-1D9;SEPR0G
2bO_Af.DHbIIFU#GfSFTUD)^F,GWCc[M6_+OLX+2<3#?BJPOW2,\P+V95_9-A_Ua
,4T@b8EF;])dZHT:1-4FJ+WHbA3GLfY+gXP/X0b1&87+6)C6O4V?G)NTMZ<DX]Ka
B5GQA)=G4dTY]d.@L>e:+>MX0AFMV&=JZ;Ldf+-LZCaPYe(Jg[e3]E>/H2[^NP>K
Wa_=GQOPU[723C4UEIdAeP/3YL.HGJ]\/;W;H-7[\Yf-P&b@<Dd3Q91OBI+U2M6b
]_]@Q7db#F5C[bDXe5=CGb=.8P4_R3,(.8,\BF7.Y>LJ_<-L8b#R54+7WB)BQ\g#
S&&]UP(L]2]_:C.2@>(R&:?cXMI)OeUSJNAS7Q8M8V+3Y6J)K#[6cb),F#+TaG8V
7^/D.Z4_2I>&E;;c\)OAFeX&GRZeR+MY1)80,&PX<8[Q<VFV0SOK&?04?NgJNUD4
;]TYOOUX0#R.Cc^Kfb^g#8O0\ILXQ^IJW.VEHf8N<2EDV.Z:/Ed-HP)g?fWP\d-<
?AZ;Uce>[>/LP1g4V((GY7_I;J&d?-]A+QgZXb;b?<-@592YH6YXY5E(4828NYAX
[DZ(+>7+YTU2W\fTBIE_LGSb.(U.9H(EP+Q61g-><ReK2B@4fR7K(WZ26PS=V&L0
(c,[\E^<D<b+1=X1I;)4UOVeFF]P?aIB6)[18=&/4W&ND9&;b>&6RN,eKB#Zb^)G
^G(O3SOI?V<G2Z2ARV6U]WN\WB_6@_S7a_+I[G#9L0;#2(,;a4YN/^E_:MR6DRR/
^]+P08?c7@>VW^Tg+W<?K&(b7#J^)PH=TO,#L9AQCWKGFHc><Jbg2I6_2d_]a9+g
/5b4b;7FWC9g]1&)_BI:c4.=gCQ^DJ4_O,:f,)ESYS7V<-[1[eM+K,&?aacg8bKX
08-5G_1+aDIK_2HNY&ObaFSK7&8GbQ]&+dF>a:LgD3eYW[P?#HXPQ>fcb7-#J6@Y
90^LCP[/f-5LMI,H42g?#7S\>A3IefC]M3gaI&;S/\MKZ,49E/J4=SMLI(a78+)K
3c-G8(\:TA&R.M_c<0_@:BSSYfWDfZHId;JGB64eX68]Y-]Qb#B)PF[Dg?fO1P&9
RGeH8SR6PV58XI?.#)/ZJ]E,=;af#N0B34(A52K&N3?[E[(,S-C31XDBJMM;>f61
[BB<49+K9e0PTA,@G)MKL.G?dN9L0#gNBECb&d[MW]S]#KeA2?AU8)dM<CC?;<BQ
c.1WF6CH9]O0AYW4LcS=ZK-:Y+U[HIF?GAZ]1U9aOL6G2B/SWAaMbP16:g1EJ.A2
?)E,2T]ABdO&#3feE&=P:A;W;IR0_8D].5G;ANK&Lc35RH=dE=^7Ub?M0;^ONQUR
:BDaPC.f82YULJG6&^+1J@NE5;d0ScX3LHZ(@PgTUH7>^-/NLg_K6/TH]J,/3NCB
153W^SYAJa/>Tf_Y5;cX,V]X,cAKYdZT),&a\E-9LTG9/4N2C+;g](1]MfB0NId/
;UV5(O+4J/AGHSda6V#?S[EOV>Nc_2QHYNLg);a&.3P=/O\1fLd-@D(N^L,?H3.&
A#d#Ddc6DgS+8Fe(E,a8C-M.LYf@eH6#6cN(I4/?-YF\OQQXC)LeR(.=1\FWT0[L
G2.>OdT^]a,HCZ^PKR&bSGU<Sc=5F+4bV\e<99de.6ZUWfA)c>ZDcbIQe4Q-I)e,
@aY4C2E^Z.)-e?JV5_(XKTOR12.3V+8f/F;_EKW:K]I;5dI()2@He+-<4D1VFXcB
e/0RL<[M\[<X0-(1NEg#UU?-LQCc\?R5][/IJ-bSVTP;SNQ?SO6?A1SW@?d7?\#_
dA6BG1]XAAFCJB\PMU7JA;:D_;GD8)CDG>0^6=/8NX>f^Ee[5>=^UE(K>(]MN\Wc
-T^V?Hd-e)UW@GbPZ=CX=H_?D;HgZ)[AH59O#DB&-1V+76RDC>7-2==fJX/AU98@
HTKDVV::Nd:UCO[#Z3B20M<5:3QHQISTg?bSLXWb@G:bbWb1D.]BB:0G2-?F2Q:2
PW+(\/&6M(,a=9(1VbZVc^7OGU,V=X]HMKB0;:)aNV;fM4[QUY2U\46I5cOLV(W0
Mf]?4NNaVa&97C7ILTgKf#Kf#bOZ@a\-KKDeI>SA<.Y27@62@[_A5gIb7NY6T6]4
aGO0F4L9_@X5O.2fHJ5Q9)Z8,]S];JB>[\;<5&;5BTU#+/O7D=\[NZS)YQO)-eW?
ORAGL&E;eCeJYfYS?JK(eERWN9[#4@e9+>AcaIfVYI;Q436RN6F_d?_4^g;Df/Wa
2W4de4U9/@5HcF=05&?W6K]@[<Ob(c+7[-2\U?TIaOA)]2ILF,+@HDH<@:--aBLG
9?AO)U-_L09Hg(<f<2Jd</0LFYR=<CO1:-b3=]HJ4c?7KIBXV4J#[YH>IZg^@6HV
QC]AYI2e4C9^N-V4;K50bRYT4\1[N\QQY/B\U>9b<_5Se\YKd1-0=&XICUPK;:\Q
:LAN-61c\ggdcUOcbeE/A\+DZD6HA]_XB/WLY./d,0IO9S&&N4;X/58.gc8&=XcG
OMeT:X3Yc^+4]Y8O-2J@.+?_^,;@L)IQ;_AE=5,WU+0784FeAV&eQe/@FR4645b)
^.TeKf<&)<;Mc^a-A_f0#2K:1(\/?ZV;:P]@]K(M_CXa=0.:?3U_RT9QA8E,?BDg
X,=[=KOLB@&bC4@/He\UO8VLPbA5]4S\0<bHD5?7R0>=9YMcG;c(D?\EQS]3G5OJ
,D.,K55Z#0)L,+(V?A87E_2U>=ZNJA+B(#<Z4cYOc5C)/CDU1aW6b<OZ;+GeW-+D
O&GMM9QXE5J/07:8(7I_BfB.&7FPNe(^1\7aSX.W+Td.OUJAY2]SDX4TN,/8(CNS
C6.LfC.6+&BB+0Q_OZ[O/4BU;7>LO_#G9QSU?eT:92A,De^&7<AF2:I?2M<#:90d
AZ)F61XG8C]U^9R/.,L<D0(]N[I):4_^Z5DJ,N7FN0Q(7cXP7<,MW-W2U^JWdeCZ
&YI8FZUY[VR\PDYZU#.]2>/UC_g\&-H_cT<C45R+<TK46D1>fS]<]eU0N);+>Q=&
ZQFESOEQCg[RP5[@Q]SK/Xe/LW/[=[F>cP(M2eV2]O_&gLZDBPK,^MMNa?RG^@P+
e&R+e2+K606W-VBV_6U26B)WZA0)8GB(UN5_K/ZF@[RHF_eY]+X_/(F6Je8/+0dB
],20C/6>BBCEM>N5aT/7d[Y.>.^dAX\fU;-Z^QF_Yf,)[:gfIM.A^@&C3^QNL(^c
M:cffZ2-^/a]020+I@NJcM(5EQb#?ZV<d:ZY4&eZ?:SMaP2@8FeA&OeG11<Vd5C:
-+I=UfZ&PGUE@1g/>7LV)8dCB=7-XM2NfZ02AM?0gg&BVcEG+SKB<9L4FIH,P;SE
#XRJ2\T>>Y,5\M]e2Ibdd);(RQG=Z]+/-,EO,X[Y_edS)E)U54)=)5M2,.CU&LY_
F:VN.dOY94c/eGaG>NZ0;=AH#G?N?FX2MT;SVP.0T,D=E2QBIF-UYJ@;TDB=[=[.
_PFL:6AC.M4eW\/bM],TN)08)6CgT;+BW^\gK_aQdJ]041cXN;-,9:NZd^O?6aO9
f///Ed&2@-)4B083K25_eE.R]D;1/H;=Kab5@.S_H&2A]/EWPW4W4SRYRF#0DOW^
QfV4RLT#]=5&I@ZdWK>gB(4<L#C,84)B]A0IO=g3ZBJV(Y.<U@KP6TfGZKg[3IVC
2@PXX&5ZK_W9GZ<OE48E(f0d9VK&A9BL.F_)8fWKGP.S[0RgH_21cX#FSZ#c9/MN
/c5+FB+DZOT8^#IQe^YI4K3Fa34[73TO5^4Xf5DD;KH__)N\U.=BL,G:g3#PGMJ1
C;>+^ObPAgFY)U7NYSPQQ-@G;SPHQ62=eg39I8:7,SL=P---0c2a:0D-IVRd:S_+
\9?&aF=RY=+,52cK1O&2M#I&\?7eSN-1-/9?b=VfIbDgL)U7)5>JdMWFf_3Ng?;V
J_+Yb:)J[5H/L1X2S_Y1AZ,8;<E)T<I,014JQLaM[fS:1U:eX^6LI2QIa,;N#_L?
L>,dTCNSaFZ+H94Ae,g#;TSXP0XTgQWaeP/bWE?&bN^KRMAQ0&Efd7YI,E6V8G(a
5CdY3HM=I(e,^]4\;TG;I6f2=3QJ2+2S;bZK#X_Q\R<]1=-,/?VV-La#A?aeZ.[1
1>@ag-V^2f(L=4;MLC4/aK]?749H.cEBENY]PJV]4P/_9O5JXEDYM3XPB0==PXNX
XDS:J9,R15]+ECN87U.[>eY.+5VC=#bF:L2G6@gP,9]&P[)9SQ82GbafV8,8>cVY
7YL&deFLR?e^:(-RaGU6M=K.P/K3QOMTK)EMF3NeQJYI2=(fEZcCL>^NMK]1]HO>
TdN=X6ZXZc0:S,#G.aUT]aaW6:+d;A3VC7K,<?+38RC,L[bXR<P1+L&af/1NddXR
W.T7d<70QN@F:GG_WbT5P\^:JaSM<fN=05bET]F^&fRFTCF@I#9<#SN<U?aW=?U1
1AcC@?S_gV@N>95LL[(&eL_QH)90Qa]:/V1>&XIK2gcIW_La\,d/76X-[V02QV/-
Lc033F]SV0#W?.Ob-]7VaF>CV;2.5RN=DNYP=WcBS?.T.,=e/9a=+^JHO<)dDM#Z
O\2+.S78PK01_fdaYc#^MEUHb-0eKc,>c-;5;_1ED&^3A[E?/DR7bW8B0E[XF0KU
7.).fOCTDWEaU]gAg74+2Q2/D7[8L-&]=#Rc&VcC+UP2)2gV](2F#VO@R_/T>R=b
;c#&YFPDd/S4H>cDV)G6c&J__<L\B@WEPdCaWDbNFAR1VASU1MOG3Y=Oc2bN@POJ
Z+.PHY?TOR1PEg(ZPFJCVF4R:<Y<Q<\ZXJO]=WKVZL?Y28HRS-\-5dd7D0.)IMT2
^a0WZHJc^5K4/b8.OJ:7;Q>9+CCID^K#e];Z-AaQ=U64Y5JZT(>2CX?/1ICQ14G9
EB5-Q2VMeg\0,M_.3QB>b?gV;7PYNN,KTH?G)]D\/RGdBDe]?P16\&<M8F,.8Z=P
L(VH?[AVR<7c?XHgJR^?,b[KP)#-)0aA^H6S;.#Kb1TK&&.LIb(Q]&<#_RRF067.
]IM=DG?AC;?<CT[;#bFZ2D9O?aO+Gf(?YdAJ0&[X[b:XNa\)=+ENbA=/d06#6C>Y
F&X)N3F7J^85fbeGA0:E6P[D\2NVfBZ^-.HcK5MG7fMGT:b1&(PEHIU3VeO=.?>9
>L1^FCeIAC[+gKHY3LV(c?3;BCf?T=T&[\8(=OY)#E1_&(J[bX#d7#07Q_?g+B^I
JP-ZNT0BPD>D;=P1R63D<MU?/)_Y,70UX2(MOW^A;eEBCXBeaIGN3B]d0KJPA]cR
g_add66-4PaA02Y6d.g@10;M;[T(]-&?<S,@,>43@^61<cg]M]cU<VEV+54X_/aD
/N_P=bg\3#;U2Y]^?Z@+P>6S<d6?I<&(8d4/[-+;3dNPZ/D?dSX.7/<4bRDC3f\Z
CRJ6@2BG1<#aVFEXb79-W@1\e2/-O85[1-4KGg7&#FN.E8;0NPUa=IH0bSUUT]NU
-c\4,&A=FId?f.5aO;]I&YM;&.0a\]27Kb@663Y75g(V?BeFJW)1+G+<&YN;DK=G
Y&(NYXHMKF)7_MN94GScVF=TX07J>9JE7?7C48EQUeJ_L2>>@Eg?_B\5DEZFT]^+
d&gf1N(J4HF)RYDWPB?WK24cWESWSWFUg-=1YTKND0Y19\1,2fRY+,0G9f\Nebae
W,2R.14<QC06_cdLC/;4M_-IX9+T8Feba:8/BSYQG)7/c8L?<EOL.CcL7Oc,U.DI
\&^FZfZf)V6gI;:V_ZIN4VI)a;Udc+Z1WH/=eQ7?D.&\\bga(R+;4Y43d/SdM=?<
W8^b;H-G)He\YXT>\E\?/>Ea>SfK+&0ec0KfY6BJ]Dd0>3Ya9F2a;M31DEc7J;B4
3+MCWYM1>7;F+2A\1Nc#]27QEb1JFc8SgE&9UMab(P89e?FB&#_BWg]WD,;Z?_BH
gH-2UDGFA^Fe0gBe)6Aec2c^OL42J0I:.@IT;eM#+a3a(J002(6@V6J7cZY4V0Q&
3?UFGQNT\UIGQS(#G.HLAH=T2FO,1cWTDA(7]XI;2A_3<gdBR7H[7B]1DYf7O>O6
61-P0ZNTf>N-L6W,;V0P6cD28e.].T>_7^^e\]R\W9Z/Q#@]>+E[0N,g?]D[\MCC
d58F/:RaBGAEeJX&Q@1YT7+H(\H[L^I[AUb;TKSdQX>YII;bS76NdM6T^[F0KQN[
3FWE?>H-I(bK>3YQGaf8G].P:PC6,CZ<58[E/_.F.4YCAEJ_QOC&dP1??\H5(J<=
<;JGXb&;?4[ZaC?(S7G20W5Pe70U^C5(R35(:Z-R)[3\KNS.[QdJI5KJ+.R:=d9a
L+=:R(P9cdJRMJK,cQJN3H)\Oa#TT^Bc/7=S0aER^&;&&U\XUVAfU[EI+ZgCea<d
M9#fBA14BBO4=/aT(7<K-]5_Nf6OT[P.?=I(I<?TX;=L/b8IO?RYB5,CC,7b?4H2
\)Yd#=7#8]O&VV,\(E:JHEOf0+N]7]AJTc:B\8.\0N_5.=]03aFB0&+/#-K;Y^#H
G5QLg\JF,C3B]<RQfU.RcY;^3EQIY7O;CXaMdbM?4A/)@\[4T_?913)4bMbOQ;X7
=[Ug/W0>FM)(c=&a@<P9KNN,IEHCfKPQROA;]+?T(H98NA09RO;TR1.<CA-_a(K.
,//B(3eaO&GPSV;,Hge6JIO4@-GY,a@AQKX]_RX-L;fIO0CbGB_5N4CV9FFb?@R8
Zd:RH+P?Ge]#H)K=eA((gGX=L+ADRL0SVCaKJWX\Nc.;9gQ9G@5Y]]1R;11>6\,3
R.<IJbB5+;_eAN33(\4Q\,L\CUF[S1,QO_EZKF3;B,JKRE=EagO8NW?bg<+]3<Zg
K:]3)\8G/Tf4EQ\]5XMd(CI7EcQ4<S@+KC@[XJC9&^fC_\^>U:J6.N1VLgUNM_@=
+D.O?/Nd#d@<(2.E<3X..4H&Q\8_?8CdRf^2fSG9:Q[(=^;;6/JB5g.a&VI1e\OG
f6_a:<4(GS]Z9JbK7AGU.bSQ5<B#4^)8<VQ_=L)WBNC[0S?&ME_?DJfS_Y:O3=2;
.=F3TKeZ+_P-\T5b88Ng#)=8ABeL+D?=4[SJ)N3=3?D.M]4:7MXVAE[PgCE527:T
=g9<2TK(FacS\_-g,bDLR(D[/C/Y4>2bB<RZ)0X2YZbIR7\b10OUca:WFVO6bUVR
#4GLKT.IT6HC-BB:H(FZbB#P1e)V)K7#@0:47?K0H8R9U[LOXZ@)eU2H#ZJF8Z#d
5RF#VHPP3cOK@[Rb\08WEF](WId<e3]_](ILH[HDb,G#WLRe#dXNN8IWETXWU@ZE
7Ag1I16DGc=@#c,7>PgQ=FWL1D]g61)2+AM3dMQ^]aUcR(9YYW^H-H7c242dBYf]
9AgOa1B;F8G&;Rg=JJ=APCgWeZTcT)F-?4eLa/I0;LDD+8R4?Db44U>.QOFRGN>[
2<Id.(J^EIEc,97a@QML0;ISbBMQJ-TESRM7=W0[A=EDA/FGL]((7C1LUH)8(,VS
YP^gWQK1ARP#PAb8,0A6V>+N-NeF[gWQEY=#Ogd4N3BcTa3;ET8TLB1,QdE6-KAZ
@<.M;VJK,S&UdQ[@.4<OMa[#)&>:P\+?QbMMK^OdO@&J:[cTRV87ME;^_cZ]-6d[
d(9..-R9WeC>GYOI-1E0J:X3@UG,)2^4A]XE[FaI.&4\9Q86((O133QC/_68/V1O
f7LG74@6>a8aHN1:^]Y+dg4)&Abb<Ye4WOZA/Pd]#9KU8cQg)07=>BS;W[8Y-7EY
(dOYZPI&&.?(U2IgR3S7ca89.Q,-b+YFT+)NE6,21SZ)6[-7XRgUKUa>g&&Ug/\/
4RNIT]AL02Y/TUEGc,:cSSQ3F=;P5[]eeNNB-GPDSg)e<4OS>D0aeB0bT5^4^=>(
/S#:ZO6TXGBd<B&Q[Cg9G.g#;A;]daPH\SI@K(J07?,2H995eaB6B>>(0/NFD7].
[SS46RLcWd0:NG8&(e6J[_bJ8bg?<;)B1G@)7\U.+LMN.D2V@(9a):.N\4MOgMLW
&;JAb.Q<OcJ/].P^ZeSM0[L58[S-JgeTD5?BQLQQ1B.<C?VLb^;He2^:DQ,-&Q&;
Cd0Z;>g7JR;]VD<c+QVeg9Y)^PA12H?)&8gI,&g1LR,(,_7@fOe6R/d\,ZfOP/ZO
EH+-Sa-BOSK[47+fgb^E4.6G/\(1XJVee51YgL+IH_^0>ER8V],7H>IdQ)N1LaB5
319&5afSUO6;V93HgZQ.U5#K>3G49H15XS?XQO+&NQ.a3O7:fCbdQ\,Y5.J=K7S#
#MTVEF9f(\1c\;E5<ZOMc?/fYZ1U^^J:O4871M)ZQY)2K\9U?Re0Rb7ON;40GU._
?U\C622_\&0Q,0ASWN?J\5ND^cOVDX;ab=X@cM?(MP.1Y_6ad-+K>.gXBL2,a@D<
Y)D,UW#RFgL4Yfcd3g=B#?>A7dWXc3(B]GIa=MbOUG<:W9Ja6b0-062.U.^>]ZH3
]CI)GZ4c3M+c=:/(AZ:dbH29N9,BSC.eQFU1#Q^B^3-^Z?P&6cWJ_-ggD&/dMBea
>^5PE?CF/E>XOg6/F^YI7)<]I:4-;?AfOM,VV_Y;SOJ]S=F0J\cdN]VI4TJ_:(^Y
20gR1^7,&NK-gMK^a3>aNeCCM[=f1.MJO:=c+[?EE6:>&_DQ(UMNR_WM:><DB;Yc
;MVEQb,La;(abP.UM9X6P1&@3C/a8&B#L[;#=5A.BW#1DZOL?1VCI&UB<Ye=N[B(
-LU^R3UPLMgb5);4,fKeXFQ#]F2F[J._b@a0JO_aV+@R-9fVd2&Egb]c9W(.RO;-
?OI\MH<803:KF6:bRZV;#6,AYV.Y&=][4Sa&0,Sc<XSc^3A#f5bJ[E^5Qg3]R2RZ
79d#_LMS@MD;;7>KdSQK;.\,c5@]Qgc72#Geb,ee\[(<@FHFG2\YF7AEQEJ(DIbA
6SY]?e)UOSGSb<]=@(LZ9Lc-5A8XD;(Z@@>S5=Yec,[M,/I6N(CTa;+C5<ZD[ZUe
R5I4a.Dc+9a@HQ=#+ed\S)ZDPU>U_<\CYeP>?YN]\JdEacY?We.75R@TW.-5;N[9
W^PGd3?=WH:D5N<RGb8&R4d?T7&f4>W9f8D\\](U1G\DFA76gYI)ggD3,cBd6PT)
_=fS<RdW9=UQ3bUAT@H_N3YX.,IPK3ITQO5XeW=#J9#gT-aHPAb7(^EMbAbQ+TFE
Ub5Mc)Z2)Z&c:MdT^KdGR(1=&LP[A<)BAIVN4LgRAQOc=P:6?7L)E-S,G(T9Qee.
>4WM1,Y9^F/L.NW/IG]XHQ?NB8M;[3^d;/;aTY=F;HK_TYN03<IQGA#f#;Og=dA:
Ub,9W1>=W0U32@G/LA;LdNTaT>g,b(192HUgSP<eUY2MBed?-U;V4Y]YR]FT,1:,
#@2&+cSf18N1/,fR.-F+0<Ag.JVB:?B;gK<fW[.PYC;c9-?Kf1MV>3C)\]BTa=G\
;7V1CMF.f13ZBXJEDf=<\3:DO36H<@EWcMFb97g>DX]cg?,?QJEWL4b.DYE2J9US
dVYD&b;-e^..VEURR_C))UTb;H39KQdR@[<[XDDIfbYIATK_94M:(67D?7aM,T+#
:fC8BM,Tcg@DFFc2V2SUXe[cS-^6NZ5.U:f[YHZO+b+B?I03,#3M<CSKO?E+dY4X
Fa:cWC2GU#(-f(@WLgE&EO9RJPUTdVRVaUeZ7M/HL]S/L>(16D0-[_XMFJIH]O2I
>c78T:-[Y:68:C(@+GeI3a@T=3bW.GB?_T#B0RA>\BDAOJ_9Q?F\5<S3[gBgS2?+
D3]Ag)#U&6HN8P8/3=7)YC##4?OS?S#N@YIOU2W534GTL4@8,^PH?RC+<:b8#X;S
_[=TM[EGZaePfIDTfLI0DYQQ;70]MI^YdV5Hfd_YUOae&/f.GU&0N7F&8d66eM9[
\OSA;DM7R)dYZS2S<[=(H8&51F&E_-CW]VZ20&^>_0(X_A[<?=PAL[MJ=.@PV0UO
5.N:Ma/A1f]fU;RCa=A6<:,UEH?KXcaNOIP?8d_(3C(fYc@b\;LDB/DQg3,6-b8B
RF]\=,UKDSe^e2:Cc##3b=/cF9KA)\H@3Tfb#.#b&VFG=3<<DNUQ@R:.U@-JL^Xc
K6\4K+R0F]?9FW][1YA/O#b/:f/Sc;(e+?<aY+<<bC\CGQWdV66aU.M7Mc_TDW=W
:QYfZIILf_>/1=NL+A3NCYOPTgT6d2,8N:](+LJH-U<a0e\4U:C=#Uc;c8K91RKY
L\92SCNS8K:[b8G#7T71g<;BKcNdM[-DbM)2;Ce;4gaGRfG:XMgHS#1Eb62(7I-B
LN54?BP/^JS?N,bO:/ed)+N^cK-3LAPFI(#:T.(R2[aS54X>C?HHXF[WP/dXdP2M
7BM=cY3(->07:KTd/SK1&UT)JY_XeF0aFe]0L+H6_X]ZfB?;UZ(OdbSeIgcNA\&X
e7A[^#,6BH@<L]G<;G=6U.B7\7)dP]?8-@1=(I8HA<.-^)6BS:<6.8>I96^X3gdM
PLRbM+R8>Q\<bE=?QRJ>0K^WM(1RY&1BbQ;3RT;1BBFN/OJJM1--Be6F6f29AAP.
54GK<CDJ-cS(CGE(8#(>R3.TO;c7@V+9&]]ZL>H]cd5D.X]VM0M3C@PLPH9OZPIS
#_]>_3\HY.e_TgSdK&NR>aa357;eODH>P.EB+13)H&dHP-1G@Wd)b4(A)K&c3<DI
8W#a/3c\FF>1e8G^PZ)^)GI(+W@a<-6X95bTONJ[B/^c2;/6A;PC\A2D.+0Ab\d\
+\]aPed58FM+5GdB&Ib,Yc@OSQ\&2LNYOU3-RdIF).,?K9JT?0VH?HP-P)PUeKd4
B?11A;Y_JfS^8X]1699^d]HQS@NC_R&E9P9YYDYEK+C7H=S7a6&dV_)b8K_Y,#29
,0O/[M3NVH/EgZD,1H;.6e\c?XNg>Z=?Ia?[33;3RXOOW)(+eGcZR+KLP_H-5?.4
O2B<SZT](DL4@TX\Wf/EW993NNYI-AVeP^EMVTeY5@XJ&940+Ac/.W(<_L#:Y,OO
B/aAg8/Gc?-f[U[8(XYa=<@50]LVaNd)MZ4dAeJCMZcJ,=G/2V_,#]7.E\,8d8D(
_?U0aaCPH(8P3VNA6N97F#((MH;-c=T&GTT;9MKCQXT&X<J))FSFYQQGH9RJJgGT
E.P#.MVa.4PJ111X,RQX&LNINNJ,V#AIB4NL.)-M-Q(=@3c-NF\LTc6;^F,3Jc),
dX(:AD>gB;T\fL(9VUbgRfJV[0e>9U(HI?9Be9;cO5.-=\GZ^,9>A]X/)BTHX,?(
ZG^C]b^\2,AR;6E.Z5ZaPAL0aAF,W>.CJK,\_QLgVAW.&W97H+\QF<6UY,0_2>D6
RbV=\6,IMVb]0C\D<]XA:AR9;a]>XZ(D2[[RTcc3_RLOU4)6740T[0PDffKRQ\-I
B)OS)d^Q7Q=0BUW+e3AGZ2>:Fdb/->5;DQdK5@g\XT\;a?9c/4MZ>NZ/7JCPdJT<
:-U9f.5D8CfHYP[R7cWdU@[.QS(/2[(]2.OA7&:O0B-KF;@+@OJQG,^/U].\L3cJ
S,U0;)>,dQP^[a0dEVQXGED&@fA[PV.[A_;IB1XcA<bVI1fZQ3Z0,(J.X&ZZ@\3&
f+Y#]W>QUYL)]fN1P7c^EWQ7UPT2NW\DAW@NXf:-bB#&1(N014.dJTHa(.=P^KE8
AG@LSEDRH4H,N2c++YIJ-O(:3DF:E+X2Wa+5]RBS6=WgB.PTaQ],CC&>,/KeG[E:
Q+VO)]K9<d2FCbdc#;2@0QTHI96)(fF\DTIM]D\A00\acGT=UA;0Kd0:#VCMRAI;
gf=N40TPN>BH6c4B(De\V7&;U3g0.J7+NN8C^3g<Yf1\0cZGBf<?8<GWLQ8G0?:C
?ba,aN^2?3@;e@&ZCfSM:FE>H>6O1EYN40LTO<&7A,U/380&KP[RSMK.2M?aJL1Q
TYY?5aaF4d6Odd8IR)Y0X:TH?AaP=IfgT.)XEOE/bM_]90HX63F_9HHb:>]VS-0]
\=,LPeMcI_,G5(LK=AXB(ZIU12]LA\AKe[ZN@YO^)b_H+Xg+R.eHN6^/A_^U#e])
_/13BL0+BPII39:5#A1-,1+BaIg\VPFa[+d/IfOP>=ad@95DLGfd[&GP;FQ96TMC
RaA,[5XUC<Y9Z(&1)3D5(@RYEAX]FYFCM.a<Z0HS]f#ARQ#/:9HT_,W9;KMXYDcM
,)FT<4Q=Z(][VMT?+))6bNO1,BX]GH[4@;+T>7L:bZ2]081?.G357[cCH8J7]TWU
NaWBM2J03ND7FHbKe>[I^5;W:(,Vc\fGY7Q\CVR6>M9@-7Z:TY=8S11KUD/YFO2/
5KLW9);g^O_9.+F_)7gf^RH?OX_\Mg+]ET^a\g9^>):CZKPcKUG1b724YEWAI_[\
TbNV0C<#T2N,_W[@c7CBedN^&E4G,5)YNKOTaXX9KNY[aCD\I[,I4&+gJ&M\fKJ[
L#_PRX:59ZY0_FFZ4_L2U7F:gG=X98^_);J?g>Q9L,8WJ\4@?93+>X4CS[19;:8V
^UEDH6DP)G:]?@\V9#X@1Y9Y_:-7b7#.]KSL(/X9Vda:CecH/WZ>8bSW5D,#?F)O
ceYZ;f;AI&UD36d.J+eJdV,<P;;KCLV#Z_g9]<FG<gc1MOH#Qd/=;NZX9g?ULR;E
2ML5#^E&E:1gV0WC?^1d_0#3O[N]<^65_6UJZ-M&H@6F8X7DGL[N66[W/(X/-gQZ
N[(L:F5CQGUMO#-W/X+>PQI?P=+;Y1+@R5V/VVU.P2<7R?E0W1=Wb4Ge1f]D+?,&
>9K;gR[\?JG)O)VET[<O1Tef=5F:A+c<3R8N5P42[;DZG7-3Z#E6DAKX4I8;7+OR
L7?/&[eSC7EX;?M-0E1bFg,8Wc#CY2c?D/KPT1S.;[K0/C^HGDV7TE@W5SG6Zg7X
MKf6W[R)X9&^LL^A])UVMH&CHU#1=_+C2GX@/@74&=KP=G=8:1&?.c2FbTSbY+>+
4XXg6]DJE.3T^QN/-E;bLFdA2IW,D)a4B\;A0eSEF=fC\;K>/RMG9Uc?Z<@8TO-M
dFH-&(Re+-:^XKg0+GY297e+-2Z=GecY/-WO[V?7(R,O<_#+9c+,cCHN8d2c7E<<
Z7YA-QX&WX9#G+^#cZ(K3:KXNIgC@I,-\5C\aN8SA\CF;NBQ]Sb\/2KFM_dU9Vec
EVU@PaZ67BSI2KYbB2U^<H-KLKM58_SCX-6^H:D2#XT^d^Xgf<5VL,&#IPSP@2aa
/W:5\ccQ.,42S]2A[BUT7d@T?4C<O21aNJf8K51:T@YE69c5;:L;Q\J@VA2&e5OT
[>EA,S9G2WSI^+(48XCV+5aSING[M7R+-@6b#GXfW[\UZMRA;bX#Zd)-<<S3?O>M
MHT;6fWW]g_I;fXdL.>6RK1O5]+[a-NETZ#^fdB3>7Ef86V:D[e-N.dT6AC75&R^
NV0a^Z8[T;(2dTCfX]AAB[_/_=XbC@+IR&L6Z6#?_1LO3T<5X^&OH)X23LQE.@(6
Y]3GP\85g;+[\312TXC/<M8]?JRD.NT7NAb?[PC_b:@9\VNb=?fcZZ/SFW&4L8>I
2R-3ERcg+WKSCEH+DIUd,YF@57RBdB#+AW@9_0_=./U-=OAfZ/;,9BRG>DVU4[]8
b/A;e.3Wg_##[R_>V+:f-7#>RPEK3=WQ+Q>/M<79E78GN48\\2c_^G9O;J5C<1;T
4=WV#aYIU9.))&^MD^a,XK#>KNb3VbMaI]Lc.d=GcUe2fZ;G:EgFKK[(WBX13J5&
B>.5cR+(QMe.IH+BK629XO2?(MK<b5<OZ[,LY]dP+(NS60aI>EJ-O>IX@)6g^5\W
Z#;g#V1BK3C5J^XdLTD(W8,KT:6KS-LL\T=&f+9>Mfe0-@0&ZJWAE[IKLFDHYeB\
2c5LWge6<=,N5&e.B-4CI?:e0?)A?ffTVQ^26[bdJ;A^A2gb05Z+6HB\eKI&HMQ<
M(V]>[VS5Bf.FgDJe)g^I:S=+=PNgdXS:0\U:(GD;#f,;OWZM738II]^/IX(?S25
TVeE^Q:;EJ/cA^Ka(8NYeM\HSOfBW.T>?+-=U\RP/AJ5R3MX4EAG5PD4U&<[EB;,
;-&b=5:Pa\3.&GSG[W5M2S+AEEXIS4&NFea_5E.<0SZ7+R[OHfgSWCf@eL-1ZK4^
LF5;D8+/@Q<09B&Q5aaO(WLUbUc2LF;S^F^<VAMD]^GW&EE4fM0V9<^:_5=P\KaM
0ca-:F;bIAG_S6(?R9NEfR+0DMD84gC0(6dbX&&M^;,JXFB;/bH?(fSE6Q/E>)>.
Z[Ta]B;<68UcPZ39T1ITF&eN)EG@^^EI>@LRgV2^HSQ\GQ_>(X,D/Y#]FS];fF^L
GXM1V8:\V:V)R:I4IYM^<&&9_2L5PHM56-0.dBI9STJbVMc9J;CXP(,I[RCZ4\aA
[KFCGQ(:5LDa.CObFWRRU_&R71IF/8Ee@17TcXZEMZKEFWK])HE+U3Ya^:H/K4aF
g.?(R;?:2:1E2C2_HN<d[c(=CB2g:8Egb?=^7XKT&QZ#65;06N7f4,2(SPI/gS78
,U:0B#>KM2e;-0;I8&<_+EGF_[E_,0@-@\_c9?0CL-5/1c<7=b>&]I0&F>E/Eb.f
QJe2.K9AK]73^@-XaGOS=)Ag0DPFWfE?1^c5cg#W=_,-]N0.61N7Ad,f3YUTGa?8
c2Zg[Y;-A=)1KX.YU4_c+<X96GbU@,d;&76+ObW7Kad+(:3-HFg4]+&GcZ^\5f/P
P7+J#YN5eD@@]@0&Fa2.D4X50(eYZbC]E?EaPREW[_IL.6\3V-d.I^(0EN)10.^(
S[4V)fL\7AKY/(\0CM#JOL3IY=IFM^<@9/1Lg=DDN6,3f;:6bG#;.g,PMED+FDBN
4?K+ZDEN/(P^NPa?<NMWVC?JF;833S3NW@B3MPe,JO90#?3<EJ>dE[T)@V]e)DTU
TM+P[PLEH(Q^?:(?ZCYgH2WVI]C:G@JeJR2T2F;MZJ]_Y;SGKJQQeIZ^W,BG/-B-
RgF8b@XJ3,MV@Y5N-@-HLV-Z-a]>36N8]I;fXW_^Z0Ef\QKAL+1?HeF.WW(]_EcK
11Sfa^:YL=SH+U24;VfO:V^Bg.AN9b;X040R=6S3TUJ78Y<HAEL[&T8-cGY;:A3[
/]aI:L]e09/d9U6dC(Q:NTQcZGM<FL)&VW_=EaM=I:d7\.g]28I=1\DVI8>(A\L,
/K@<.#4aL2LC5+E@gR34>P&(PIC3T1Z^1DCfU&L&-eeV[Q,d4WV)2bGT&e(E#//2
eNFJcM<U&aI6(3)E/aPKX&#.Z_/N\+C(Ha\CQW:?/3DI.1&.e1KO:VG(AI&;-7_5
_3\M&MOd+2S5+;KTKa+]db1gJ7?&),48EYAGe0Y8<U,W_?D2SIf#UMQB7N5^[Xe^
KLIR9:7(@/[b/3@F(R6Y-2V>/P\8\B]ScDb^egeW=-=F+Jd6#TJQefQ,Ve0>b_3R
bTW.)NeT(IZIC@A1&<X)7G0D6.U7?#cM3aY@b)aL_485P/=O>D1G:0KMeaG_bYKE
8^?#MX_@@PG3):d2bWR\XbDL4A0Z./e[?<D#X\DV.U^Y=JgQ+B=V?/Waf@#2UG]>
YQZ#>EELQE>bAN,dag#358\@2MNCT(>=TWT\.IOURZ/dM]PDKcV70+efN2DN[DDS
XI.^AJT#<;X1+>Xg)6#)a.Aa?d[8a]Y_1N@#KS>0fEbW#CS>geZ48QQ@V_WDKH3&
eP-:cJK?bP].<V5=0,dVJfQN0#;@O>1D^,+SU=-=UYWdD)d(T8,=^@>/GHT]J6OT
OO9;4LR.H@N.3&]dL-PbMLdVSa9;07PJ:8.X#6\D1R7U-DLgcY(4H&M&=UBH;&),
IE.gY[;SJ,DTPZK#eJ7#J&XV)e?N4&BcK@V-2E:Oe+JQbKA/Z0eU6PcR#RF.+YH.
L?MA6e5V&2bRDc^8b#Na<DCYF\Z(AR?0_YZJRNVRRMVbC45J1dH(->L,OfL:+a9Y
(F#^T[^I\g::+?6?g5:@+4@-2APLGK_;252Md8\OGQ2&.;,1gXbP>_ZY2,Q:>/D=
B(:a\P@;eI^F38V020HHJ-WK69=+b+8HI31Z86/E6>+XT;0?OgG(>1<Uf^,/A=2,
:GE+V5[UQf=(Wb)_E#efPb#MP=C;4?&]+DR0ZY[U3\4Za1Ze=2UBW2SM[C#c3YCG
&P5<X4\g=6?D.ZbT_B[<RJb.&1Qg/a0(D3BRN9+>-gL<POIPXbW3)gB(\TfCgZ@B
U&8Lb8E3<YJUc+\THd7;ZY>/gKU3Ga_8VaDSOI0RAS92Z)HGA-fEab(CD\WKHa\U
>9GWICO:,Y;18B0\CA<aYQ4]C=+I6ZV-==a@XMcF@XU@Y0Sa(C1TNQ3Z^/\<3O]#
<Cb3/Kf(,Z4([\11F-(gLXDd^(^<&N?U>]4MT^1AX;>d&.P9[5^A4VYVNR9QTVN>
S1T>/R#+J19[7+9ca?)eI<1B]K^C=D[;3)VUS.37<OTN1)&BY\_@Ta31EJd9B#N4
KF0.8SAZ/d#_a0GfSGULbO.1.8P(9eW0gQ#HU_C@-aB3W7)F9OGUXKCg&a6);QF2
g;S[1ES.T_OWe#P/:FgMBDSVDPF@?54QdG?>TGb[[?AaFd52_Uc4W<^,4B]D.5HF
HDcV)C22aHT9QCEP/Sg9J9X-HdR1X0,0XgVQG6[6?F<]b2-VY<8>E\?/#=e,?CV#
NQ#NTTTO^4-b3QfE-)=-K?A0JP:(OVP/#]cJ3d?)RMKXSU:dfOE29bX1JPdC\aYW
ZM5e&(?LeS##Xaf@cV;NPG[/BN,JCZ+1cO7WaCf^:fJ&W:d<gBc)#GTXJIJ8SK.B
/GYI3AP\HCR@[c#AG0]aHVED->7;CP;&TB+77:>MW^?J)(<SR0,]WgJeZf_.0UO0
^W5Y)g:cJc/\][RB.D0)P.IEH>CF,+9J[Z/T4_&=,OATAN4X@.^aS)e7?>W[QEPP
ab:a(gRR9TLL6J^SVSM9eEEI]Ke#__G)gOaU4:ME=U]>N(3U5Ud-Ccb:b8TT?E9e
SB^R>.W3<BJ27dB&PK,@7K0QL_XOQ]2B]EFReHQ;:e=(WcIFP&F#L\_aA[>@:aST
PQ\4<N1UWV8#>_K1RdQF]c8(3?UB_:B[@@5,HRXTeROe0?((R&_2aYPSb/CLc?C+
d<+cbAZL_91Ac:YgGGAO>8L,)Z<dE^=EJb-QV;=TPWEXKQfKO0REIc<:>(>S&@ac
6I2AP)Y?dPY?W(N_Lg3:?,2LLMg/#H?YBDUYLV8C&GXbPUFSR_:DR?PJE18WbN)C
ZHa.CEYfXA[D551NeB]bUN;-Y+))-AePGK&6U3C72dZJ\3NXJSF=9^QVTO&3bN)P
>)E2<L8Ic19IC_c3f<2<fU]b5YA&O=-:Nf4I-S+BO:M799,fD7ZKI)[&fUEKO2;N
>ZM1]3PE1#<VVaVFBW^Q/K117TEYWN&;C1d3QdV8/T]G+R3SJ>F9#T/VH2CZ,?\K
fLNNg_Dc+UI+-F_fRE.Id&3Ga>W0&W8=3a^,?+,D0C2&&P&DXcU/O>IA/9]f():U
1K2IC8^>]?7(O4YH#(eJYY-Y_KYQI7-fC:8bWaHRGEGUOZ]Lg0RKNDUHf62HTeEW
Kc4:7W<=E+E+S+IGM1aED@0JLBK#P@DQ.&H6(HW^5LcC#AG/fG?FE>gZD5RZaOX&
:dLQLJT?g\gXVFFV>-7g[1T/TBY@R.dRXP^W5S#OR?CfcdWb\:/[:e6<Z18;b5>]
K&-9+:5XSW3fF&9VfWG=&/gXG)U@QDQP2U#9A+eg6-5ZYS<E=B[#OcGAfa]XR]K?
@^=FY+5OXB>3580S?_+B=Pg:4.F,?Wg[,fRI-6,(:/28R2(UN<7BL]#<>H>Dg3+e
DD;PXJSFE,F[4[a@9>M5cc.)4\@?^&[bP@=_68,@/RS7RY&5g9D+KZ\=7Oa15D.1
&A814@0NF3Z84K2CB\c_6OES?]5\g&+?SV9OZ_(P32WGI=9T^W;#G>#R.&.R8VC8
gVODEBLEb@6.VA&fJbN:R_K@+F\/Y3;LL&(7?7=>DeD_R&bX;V>267.>PBF)&>5b
BOQ)7>S<2O^7e.B-=04U/CP^<fZ&CKJ.X+YQb=_RKU+NZg>:L=>X=P6gAgQZ<+0W
77ZM_DM,:8>7]SWO\CU;;2>54,2#^94=+NFQZ]\-X]0cN[1db;TWD,1ZS1eWOO#>
gP+&,^[#9+_+WK&f390#aXLQ9,?VZT@aR(]7NXRMJfW2V;d?MY1?-.X?Sg9C>F/N
FM5XX:XONP>;VSY2PRbTeS,L+;Ge_cX[TX3KHFO8f=9I?4/Y_62(B2&e8TVE,Zg?
F5S\.A(\[G6bK^-6182a;bL2&8_IVf0#;2(0SNG3W8G5F#G-3D6LZ>=URL?.X)2\
F,cH5NIN+.6)5dTG2d;EMCR)0;DGUK;8H\CN.T(c+.?5^f.Qe9,A)(]dJ493DB?R
?e+6.]#>LHNT.gf-gC3IG=ZX\<1I]>0BdfM?;AMC^)@J6]<aZe.7X5Y1\OS8dQCW
IO_):aH9H61^9OZ<.I).]GAaX,5L_#\I4#G^T+fY,agS0(WaD02<Z]Ef[KNGLa9X
98F[D2?1dBF+YNe-ScT(0GV_)=T:bf#F.YTU/JUY9HCdY#6I<fXT<1=VPb7DQ/JX
d_SgJU[]eBW(E1O>d2aQ78<3f^U(IQ7:+^U1WL9CTBDEFXWE;[f.fef,C[@YHdeF
OOHgS_5XO8eO3^>f?2+CI:ZDL#)X(d9Bd(c=Y-X:F2\b/]6<][>)f:^bUJ98Q[?&
BFgd4R,LX5^ESUS4(7NgT=AMgI&&ddXR=H)1@g<H;YYN+_HJ<:_P:6@NVOUe#H9H
90YF@.#55V2K:+XV_/EMeg#ZB5cEK/<A#N\M3ILZQd0DMR85f17A=UZ9_]]HL_@d
Re19]N(+H<)[R8[.IVZ4g3N7>YSU5e1UACa\:DQKHYT-?OWBT3a4fWY@(/8^.dZ=
fCBHK2fZMN6c3(2DM3+GX,,@7P;_@J_NST^6H:R)ZGTa94C-/aeDNb-AY3;K+ePT
bdS[HORg2GEaRQMfH.OgWBY2[7F\FR(2S=M[#b]WQ[@9T#1LHHV0Y[ZZER5HK^JY
PERX5.IfA8.<4YR5I^(7YGU?OL1\0fIaA^_UTb7S+56C)J]IJE.7O&65R^:ecVOd
V=@9>5FX]9[AGfV[YTVLGc,_HAc;Ze(G6[,QJbMP0b=1Ea@+Ff&J4>(:aD1HbD8V
NY^:Y6bQ&F-D<cfZ&V94RYb2,_\39.D?S4(,/2M(L2G)+-O=TQMd-M&f80fAW8I:
PL/__0+#a]\JD]T@GIc8AY3=ADBa#e#a6<2@;=;I=ND_a+25]ZTdZJ?OTe(,@P&S
9N,3ed(9b+3AQR]+^G1\&a:-.g^2P_@7_T(),WTNb5J:-#..b#Sa4M@&RN>#^UXA
NU<0^5ZeR-@AfY?&APdD2<E<b[U,IgZ1W<JPVCFV51KXURGE+PCd9ea-ZQ1JG&b<
?A\=:5FI(eFGM5L]M#?V[M</I#>82GV;21UEJI=\YfF)cP:#V1@R4<:/]:E[>cB\
XI\CKR5GE=_<aT&;SgPY]L3d..),7PU<g;5)?Z@MFXD>-aYP30\9\=8@6D50,25L
\1T@QFHZc=b@AC_Qc#3#&+_@@fA5Y.5C1#KUV\Q<\IVI<(K;OdFKCQ-5_U[]\-RG
GGJ4PI>e6U.Q,EOJ7K(\U/#YE?UJggO0/T@JYTHHS\5K^,U[MLR#-bee-b]#U@NS
O,HJ@/]^H238.#J/W@\Rc&Y=3BCLde=Wegdce.KMD?[6+EUa\B@4;(DMJ_bP:^>(
=P\.,UU5]Wa7QJf7]?XXJ69L\\+fY(dd]D77eZ<@Y5T_b#S-55><M-)].DX\-+(T
+KM@8Q2?;M)Ye49P8CP.993HgT2NSV+I1Q3BL5)YggId442PaGFXYA;EA<DR,8,\
OPb,8dSgN2S^7F-(-R<a9)gB,_e,R?.TJ[LFU>4H3]Q8H-I+^&V\@K23&;8H/.I8
J5HSMTR+bFf:_g8SGFBJDW\A3Y,?46A3.,OMBGQ5(4GdP@+WG2X6I(T>&3)TJ6&,
?3H)=8EDOXV5MBXaTK>5K;.9-23a;daa?-U#5\EB,&AY0=@L]H)UOJ_68Fd=->aT
>V)URA<(98Ib,3DQG?dSBc204J8#fcC?CP#E2cWSHK:OICg59UN8bX-=U68D^]M/
ag.;,AUT1CJ5CVXa2Pa46+f>3++9<)aaF^RI(48c=4-CQH=CMe^9:#>HJ]QMOD[Z
W)Nfd.c4BY18.#S>DEFe0WVWQW6J,K,\L)H5/5g/XFIQ/WRVW.e-YI2+HEKgab=c
A1a<d8&5bYC7L?Kbd]GOAEE9S8ZM:9U8Ya7@.D@(G/bcD5W])_]\[/5gWb4V<0V>
(<MYOSVbB?-<T(e[;9GE;8,+(R?cCP<.1T9Db7U3@(=ZW?J(+dEEJ?);K^PF_NB_
c=5\S>f7+W584YPcb3(a3AKc,Ng&15[0SEIfZQ.fX]8/daK<]X2IJCObUOF^]XW/
]&L2/-7&G[-b)2XF&a;AaO0TFQL:78M96da>H/W7Z#AL[:TAW?WgTHB-MROX8c/I
H-KOH9ZS)Df3&.W)b>==;\=P]_9bK^1gc?YIPX4bG&>-N\R,Y70<81Q@<6&_P:7b
9C,:TQ1TfTZ?NB+8b6+Rc^DJeF:_ZPIb0@UR8/2A+89B8-YZD[.T@I9YGBX/)0PJ
QX60S9H4gO7-e??;XNY3;)SA>/A#)IXNg<P<;IL@KaG[>UfEWBMZ8C&e:PM0QTG5
/8@-#(@3bG?]].\)ZaX<]d\K+QdD4QU)XZgB1OTY_#:b][D=A+Te5>S993;WI:#F
a7UNL#2.1&]cM]I1&D:RO65dc=&ZK#-8;DT=ZW70J,G\#fLR;0GcTOXI[^^2E@/R
8VCL=6=J2AIAZdWV>C99[(#X9_K;W/PJNS62@3N/bdDSRGc\;T)ffG;,FZS5)L<L
X5I;:[FcKc^RROd^:c#:]=XT5U^a6GJ]16L4>=SEf=1?Z)RI#eZ+OS56L[2B./:4
@BGKO#@_0C?_M3DQQ0F=N=ecf5<^EZAg#_>8dQ]T&7T2#;]XN1V1.a#^-C&,ZC.I
;RM.SD(R?>RO-\^FNb4bG8^AX=;/0CAcX=Y<W#YAJM8f(EG#P<a&==>2--8_cHWJ
6AR/?0bP8SaY:?bZ.S@#1_)M0X\4Efg2d)+7@CQLKdcEd4,Y4S<CJ6>I&Y+X^A;)
J8>H?e)I_UFN0.1H7D^YVL0189B[C+Qd8)<3Y9<b+/9GQ?\?G@1KXJPE5V:fdB(@
MBWIS5[[<I0)?ZD6&<A127f?NNQUKGUL/&1>(VY>-@-e4HDGOd=V(89.VM(E7K]^
MJ,:YcaaLQaF-DD,NI@M=8(>Z6.MP=0<=J:<fS_Y=?^GQI4[R@6;+)O/3\@\1VL[
,;bHF?bA4T02M8,=3ag[)Q<_Lde_UMO&A1CY@Y/0XOf9#5(DH9UKg]eZ8_6cEeK<
D]XWGJVYF3K(I48=E:NHe3AW@#BR,.5NJ>Af?[E.?[CS7&GRY[c6AY(WcN?.IO##
KT)NB[O8ac2_QZR@QNL42E?QCUdI))K6YeW06Z=g/.3M0THD)LcG_2UU3DX@GI<H
gAEFe)gD2O)@9TG87G)c:ZPA2_^/^9]X]97d/^#&/fO/5XD34ZB[+7K9E8PU.EUF
bGXTR72-U(-:B]C;bgbF7d7WNBDXU7gJ55ILL7E@-/Ed]afYU&IG.FO+Y3c1B\Rg
+e#?I;dLUW&H^]2RS)-II#Q_e]7W:?W)W4IE.&GX43#[<ANEHVd3E339J-U)<:F)
8N7+c=:82WHNe6#=N5O+(9-H\5eCB=D0FeULRI<F=6[YS]1I-3N,Q33Zgd/L;=WB
-\)HS0&=H;-)((aeM/H91VPeQ0+:Q/&Z&?6+&+eb.:>+FEP&DRKML,]BLN03VTd1
_,U1dO_/e>XWYTb>PV7J]cb.8Q:G4((B6O_COUe9Y/Y/4ce><F^>W&59Z8DF[,Jb
eV[b?b@>K9,O4RYWTLQ3;C5;/d1U,9KZ)/b&0.JXa1HaF>^=dCd,<L;ag>)PD?#N
6)J3J4<f5e?8]SgIcO9f:BMCHYC?/Y6\SeC(dQ+?]9V<UeJ_H7\cELW?-7L<4M>V
::,?]H7O9eg&WFfH8+6[@_+EV=V0V=1^^eM@51N1BDa;dA[S[7aGF?Q[D6U)SQZE
.7^T?XWV@(1<=P4b=^EfSW&D+P4WaW<WJ82a2Nd]F,1Z/CJBR0K7R&S39AF),Y#?
YN/Re)M8?5UF(8fE[-DQGT;JYCY>^C\<]VLQa.EL9M1Z7Q\26=ONId,#U1XE.]5+
XZ:(#HBJ\#;D,0H[8Yc0(8E+8->)\X5J6G=KY/>Pbe=NSe2B,H=8bF=a91cS:g@[
A+>R=@_=c_8>TJ2H2\?=KY+?Q7&ee-6N,UUS@9O^2K-)IbfgE/RWWU+=K3]]c]]-
0FKUT2PH:..^MV#Z+gJGaKHa6<W#392HX?,CSbJ>HQ\ff(\S]c>0OAO5/:#&@P-U
b-JN>7_aBcPOdM2CIDUeJ[],aQ4YOU9Z^62,?SE_].1/AO-(()Z()EZ_I)GLQ-JA
10I-b02EE5AR:\>#cdf/P<^VBb3Qa_<)XST]PBC=2H@U\3@78,E4W(;582NGRcO@
bd>(V\,+_WQ\0ZGUb+(4bN<5;&dGAcXF4W]H_(OMR3N?5,2>dNL#eGf2^[2O.@.K
-Y<+Q+cX<e&GeT_b^;/d/-CBX)+>OSd:#-<b);]4J7XFbSK/R,60<MT_8S@AMKQP
Q/)Z^\YcR5IUQ@JHcEg=MVafVN/;H#2Y^,6]J(:,/JRD4:I0>gL#E<fS21[0Sb4L
d4DH5]JS=E=_.WbZY?/NcT?EPLQ#)9?48C4_X<Va0ICHXHdR??FCRL;A1_ag@W3Z
/QUH6Ic2\_^[&;f?>6DWf.OK3E))FFQVNUQ&fUf<(g<g1(63L8IQ@#](>G;^N29_
\SSH[1;OA2<^1?VOH9]CW=4SB:25gJPYY_;ZgZ-IK12X2,+2Q;&DN:0ZVFJAL0RX
;BE[4B_Ca=,^\1?&J5@KWL6_e)M+f4SL#M9\/@>U1MQ)O+]R^M3M:V9R/Y)Y1LWc
4E;>F+7&S\R6:ecT1d0=Oc>H=&&T2[b859;cOQ]F?<6R4PX3](#QbE-TO=O6VXGN
8)+H=9g]L)END^AX.?=S3N067]QO]I+Ke_Cd#ZX-&TO#RgK,7LdCO(^1dCL8-X0g
R<33UW&<=bEegD9gF\L?0:K=3X7,9S9(:W&-FZ_E^R+-_S2aHJ_&HN[cPP]O_\+2
FY(^?9Ac.D:/6B,.03c1LF-80E:Oc)/##-4/4F/fM7IQ6M?(]E[7TWWP80F;CH)\
U]?_SV,CYGfR4S0.;U)Z2<U?X-LUP\(6XVFK^a:\bHU4JLZeJ)V;([M/O?dbbAe\
3BU]c6(Q03BOT>,ga78?3<V_+G;3;aWEYaUce\TWfA3;UQIRVWQKEB]LOG:FRC38
e[?1(95646RZ[-ZeRfIG:V;^PR35-I;CZAOaBfN[UeWCQ7R?Lg4dJ;5[CW7/V78@
?S0IPN\+-bLD4f_KR-;7f.KZafN3X-b?8=(&(8dD0Q1K0)H;R-))IJ\/IQ^(J-B[
HK^_CDL.C[3+#RHe[R-/@4JC^J0^::#Y_OgPJ..2Z32;.RV1/IYI5;A7dA5bWC+b
SKa4Q:C;GKO[VRPL&<V\=DOG8]=.:9]GF>>_@NTMG=98gLN0V_7N-]U@/W0B65:e
a>,BQ>M#eCIOc6A=]16DJPPI:.@BEX_<>SJ&CUIO&6=AZ]@EWeQ8HR<e/LW/gVZe
K63ZBQ/#.SbS&?2GM04./&ADTQgIO_cM9(bfeVf7?>,Sf?;/^TfeQ+C/Zd]N[Z<)
B3C4/^b0c#K8a&M&H5RBgZ-Ree\HI(T2X>-]9d=VfYL\7BbfN@I[P7B5:TZJS:X=
U/36GN9G6a7H+CNde<ZSA3VLaR2;O\=&)dd+.eP-1H)e60<MbZHVP+/e6a2b7]:a
)Gg0YQV[NHc<ZM=NPb#5d#[EV5J)]C&&7Sg\UY/PN-#;7JYN:Q[[PV7-H+B0bXQ5
d>H>W23IF5HJT:=c?5H[ZF-G3&^@/AS<-EVO-V]KWH]->F?0IGG:6T?JRFE?fH/=
AcDEe\:FE.^&40^f]\f3UBEA\&1#^A[aU&[J0>:S-c,@PLF&-LAJ0W@[DS+Nb(?d
Yc40e+_Qb&d.^50R,#g1HIY(H&^=([1JOKJHYP^JbaZcX,#STC/B;[6N#M0SM&?R
FTOIgff(e?98(^Y\#USQ?OVD)D\NRA8dbN-<EX[>PW<5/4B7/SM-Qf0U4=LYJ^;=
\W)G1:TKaFQ=N+bD609\DU&C;/34EBOgZMREKd?R-H.9f1^eXN]D9.cD&VI=1+_e
7\F?6GKcVT@I-3,<V:4D6/B0?CX[3A>MBRWLUTEb0_:J8\ZZ5-+X#P\L]eYGT8#;
0GC&\bca5#Q9>55BZCRCZ>dC^ID=HW,-_X#dcRc_agSc\.+KCKSR-I.#QDa^1@J)
2-5@1+D_908VPMHeJ@&(S&H6RC#HH9<GU,5M+R&RVY/-BF?>;1J[NDb>KKdI>BBG
:,C>L:[JXb/?^[=F<\P^J451[^P54f>M+5C6T(6@T<18Q+aA6I>_8M:2[;cMc_@5
A23,aEIWVZ&FCc^^Ba2=a7N#E>VMED6HZOWZHUE\Dd1#=Q9EC@PIP<#Y-O7+>BaP
#3[C5bW1[EH:\MPDVIVM,50LfM;F(5A)-[>GSb//EVJ^46=@O:JS3&.c,LTDb1LA
Q(VJ\/a4eIdTd^LG(D6/T-97Oa70./0d8^(RUVMPcR)?Z2Cd7Ma-/2Z(NAFC.#.e
,S\I=C]L,YB+_IJ2[W+KNRC1_Ld8]_I#]8\f/7]95bA0_5=EUDSZ^BMY>KWP7</;
)P4&YRM6;2,=;)2aS2FL[3DT?SN,5D.QI#e]KXe;8Xga^YgI<NJ.bNgeUTHS9D>R
0eC&ZZ[@Y1L(;H:L2K-;cE;3-(Y[g/^0&XP:_#TQ)aMcB09ZW+b#PXe6=HT?X:,D
K#LXb<1.9\_g_.Z\4Z?]R6?OIOX97aV780f=/9+<I=gIVGSY^2G+AR9F:-X,3>NX
\0dMS\;M@1^&N:-B9:&]^6U/YSKADTB_5[0;;g&1,M&XIHU>KKc3fJ/@_X1,e?]F
5MDS>Sc@IDa6^FVW7VM-MY633#\]9P^0\Q&3f/eQdeKBD>MA8=]K18D)GQb6\R:G
FO.)ALW2XGBXPL93@R(;95C#Pf1C=V0f2bV?^a@+Y=121A<070=Y@g:X(+Wd<PF8
)g&C)L#g-/1eUI6<>UUG(H<FY4C>K_?MQfa,1H>KU=AW&,LDXaX7YS?fH&@G:D0K
d;[5X2PKNZc-)ZQH5ANGE2R(^(.O=I;K@[ZR?9:GFA>f<.XAZO#YZg.0[R-1bHPX
FA?NXI,@OEfT]a^Y>?b0:>R.^bJERB[M5FRf([6@,:3a-8C,a/9L:_HK58#R+@bC
I)33+NH&>NAbc/)\Q&FD]?Ae1?P:ZZKLP[#/2/49D#V29>TL^MdU3gD+4)f,?SeL
K1;JJXNT3Z\HVQ&+NeQ-QV(SIIN\^aD0.WPWD5X7##7>/M>5/Q.&K<PG,.;A:dRF
\IR&27b?JO=757)H7Xb1W#a.>=2N@^C-1bP=930d(;e0He2CAKbAEO@QWF>MI)T8
6]\D1dUgCGg=afB(&/-I+A,>MbY5^07NKECD;T?b4_PeYcI2;A3_C5DIMDGJ#S##
#N0bE,&?<a.@>J=5G>E18de+KXJCIa2&Y>aF^5L/HTR#&@Da9c?bEY&P=/cBa>)#
L4gcBPd&J8?g:X#>NeD/R2Y,1W\8O6^T9UC#/PH_c5F>HQ-_9cY9W\Jg8(+-S&C3
09Y1I8GWQ+9LdHa,2W5SABG#8SdTR_aCSOU[CFWJ=eOdGTee[72,O2KM&ZPS1M4W
S_9#+2<P^:J4(/Q=LPN#QYW<TO\f--_CaMQS/DR8Za2Z[Ed7OMI2^6\.T?D<)IgY
W(+IZM_@,F+PHd:e4Y-^:A;0,V+7Y6@05Z=#JR[\J#I^EIOWN9TbFYI:7Z[+e];G
X4<0/;R^\gIP<8@RbLXfXfITHR;U,b.XRe8,3NT9C<cM(M6W].JH(ZCa](4Ea-;7
EAJPIT;O1KL#&&4Y;5ZL=Md:ZU)2/H1H54?eNDB9:\C1_-+FD.#?.6^R=NR<\5Q+
<KLFLbb\EVSR08H_9([:4BC<=;A-Q>ae6-[=]O76,e,@N6UH,E6909RSEC654)\a
SU(?]c?W7Rdb/;FYW/AL0>ddB5CD+6Y?EX:#S69b&(D#E3:Hf:2/;\1Da:]L1?1,
3RO+]=J4e/PCbD3U4(,NQ4-C::AU74F8:^)Xg3JR_(2FJCc+0V-F?Z1,cXWbW@7d
TR<5J)b+1Z[QbZE1Kf57MaA8B)4Q6S6NNbWDS\7:P>][FP1_F(^;5Oc2/.TUa?Ja
RS_fc2bI/E,O>.\F7bSd2GM52(LCQG?S)P\f?a_YSL0)GdRWA7&a;8F):8=<;d7B
P4^agYDF+-2RUN,[VS,IV]-I\+.\)DP]L?SFXU5#f+K9-+FYg-<FJb@;C5cR<N?\
7B:W(=];(OAJe0/1a0f>9b(JAb?^#eYC[d24]=>&g.C?9?+E^M_L)0GGH-C8AYQe
BY;-E;AMZ1;?gIJa06<56^/3Q@e,Qb?/cg.9F>Ma36[HT86<97TL#V[6@)efCW-,
T2La7F+FT41ZAT]]d[X)g=DS9_7QX4^6YC;G>V3+J/+XMZX[I+HOW^K(NS><#,3a
F0Adcbc4FL&>E<^GP&d7PU0D3d,S8E3(J4+dg.53_bdJd+3RB<:A?R2ZHHG3d,&\
Y)DDYN()X)5cOL+UG3Nfc#3AMM+>T^?e1S\[MI<UMAWeb;7WAfaOG5P]M]J2<G/4
d;UY3B:5@-:0Qc,d/H#Gg:KA(32L3H;#&MSH,#B_(LJ8Ha:a^RIK#,Z=-7Rf5V\=
=#NGGY@XST)^H,>GB9Q/X79=1b6E<LO5LJYLH:(.BERg5CaB=2?Y;dE&LQ?QQ[TQ
I.=MZ^PG;g2Jfb_RMYc6Q<cPN2SM.SI1c2[?E\E-<Z0_bH3[d[H2F2VLCfD:_eP5
TR7>NZ.8L6^VBS97^<C\S4Ucd2&MbXg5?Y(4Q+WC4JdGVe&a,MOSVS,A42QEdH1N
2e:ZY7a.L84&S-P05],[9\7f&^=P?)MR54eebLEB<E?VHHQ5d2FGc?=f3:30S/LJ
LbV>T6;.cIO^(:WJg?9N9da?fQ_Q61OG=H8_Z3<e<P6cEe@)c/E[PU@C,]P2=EA-
]++2)FTMSQ2fD@EAO=bV53=^]ZROgVXc3[0+,_E2.23+GO\d^?JZGc@2Mc8V@8bK
,NZ>c&OW.[;X(2(?QMRagXDb[Q,L,aT]Q@\_dfN0Fb53FP5f,@EH:/QBD#fGEH7-
8W[]5J[&4I)<9[(&Z;+B_KBH=(]=VY3@F/5<:F\CRO@=]abK8Z^MGLASH<H&f,)]
V=SXe;#eG6(MfDV_?K8DH-K.cFP@0S)TX]_RZMC]D9Ld+a=G[K=_aeF.-b2W?ZHf
7d/U2K)#RC3c4]/E.O+@W2+<B+=(/5HM3KS]UV7VI#]Ac.X6?S[,bV_2AA^BA[5Y
\8@&31BJe/fV4Q8?2+ELdRRd_A+I;A15<b2KV2DeRb>F^U)M&\Ee3]C:NSKEgZ.>
B]6V8-JVbZa.4&J>.G0)GM3SfBRGXI2dEdW.FGB^#/b8,/A6SK.UPc[BB:_].#\+
8+J(Y8aIT73&EcbR@S9/P=GQFA^dfB+Q9JX(Lbe)6@4XfB4_J3&H8LLFbQJ.WWSE
9(RF(-JZD;N<fS@96,Q3?)5:fKc5XO3eM&W&;23C/a6,,=6&O:_B2Q3^6L60V^WI
#<YIR)94]6)>S7,],@N-a5g/6EM^>28^PLf8\U:RE)Rc65NGgO^09S;9T(Ag;#WQ
UI^@O#<a,/4VC/72(;18JPQbe>Z@+I7g<3dY3WU-HSag8@bQ;d4)BA[>gdRYf]df
>J?ddFQC\FYUb2FMAI\?9N+P07bADJ(0LBOG:TUQbVbLZ(X^+S3d5(K/Z.f71,bB
dTOB/NfK(M0.E;\46;O:(FSfaB?KYPZ8ffAE4<&^^L;P=-(aaCD1FI5[MQ6FJNK?
6U+?,->5<>4(YDG&6@DJ);UUD[D.d4,R>GEVHFdEO5d?a^P)?]g)HKA:/c#(;UR1
Sd7a5A<-BS_]5,O+MNf]^M_Of66^-Za3NW=/=<+TT-6[_>@Kf_7C7aa/[FM:DK&R
;gD.gV\4C;0gFFa/>FY\H4Q4_^^D+dc4,.\ZcJ\fJ^>)+g[F2[b1[B_&>,1cOE?9
]M1&g=XENI:^:ANc.OB]N(Q@0H\aQ>faW]<31c&(Xdfg&26Z)L79>/JTbC5XPW,H
NY0L&1^Ee4Pa(UU+C.PLC#(^)86EE^()C6V0P,U0?QfdN,<OUD?GNVcLCY\>[-f7
/1<X^b\6+eFW)GTf&R+cR2_ELHJ)c\a]DL/)CX7&A]_YNM1SX55MENO\+^WZD8+C
J?)TJLK4cQGfG)B/[N;2[5;CE/:Z5NI40Tf/J90edXEW82^#O6DgI;:RFKWM:_>4
CcF<)J,#XbdcA]A=^GTdG@7U=U(NMGQd#AOM9,61+BbA?IOSdA1:9&F4H=T,RR)J
aHG<a-V45(G2cF8[A\_X0KSaHPC48,GR:9&a;@5,2[.gU\<e/ET79(a_Jad?5OVB
UA(O:b/fE7LU:N2&Y(b4PCMX(E741ZX0JEXa:+>XF2UI6^XC#R6BR\MceNZM;.?X
\>a1#JVg/@5/<M#f?C^?U=F-F41J\]W,5(T5=IEf,ReBBGA-TaZ7?T6c77-HKSTJ
Q;YaY6V,R)a7B0-g)ab1X24c4];);f[\aGeF^S.K,2A(D1@[FRX4__0]57;-P3MH
/XF:PD-Xf^#KRST4J/aG0.1?)>.X4TX]?],_[T.7[g#F8XKALPJeU=_;CSWB;F85
,W[VTW/2__9:F.9>7M#gcH<T+;5:R#:KW2IV0?Za<PP?X45aU7,?+JR-T53CRJ?g
)]1Z;QEX3[dULAPgI5C31VOga-+RX-@,/;a6[J.L0(ddNPW[bVC/-99<V8)a3ES4
>30gQR.+-gUP0dQYM:)4_?PO1^BZUc#YW+\8VgC0?:dS:N-:I5VeS7GR?)I,ON3N
9^/TIdWR#G)f+/_5-LRU>DP/;(S[V@K++;Ce094[,>?D=L).<S]/,^4DV^4:^LUc
=?C)T:NK4M?eg9M62OC8P36:ad\LU0DgH^f[5b6,2LSUe6EKWBDI&4Gaa4DKE+HN
R+(+06/eR,#;\#4O+ObWXF__;bV\ILF@a\((^J9X&/I:.B+Y+YM#Fg(d4DQS9>]D
RX#YUJ)WSb:OR_a#(e64[c/BfL8\YX,2/.b[GZSGdb5,1^SVUVaE(Q/K]IL4cX-B
D+FW25@-GD@40b[+1>/+J@LQ]c_@7Yg#(>E)E.4G.MEYg2)FDZ(@K5f-<5&I#-,e
?d=(dY<>IeZYXKcA\)?)=7)b#c,W#?FM&JKcOg,X@+H+Y<<4>_d/aYI=(c3K4#E.
^P997NCfG1]T@ed./TPK/:I@89I/RYZTYG?0a:fAVL.?3deTHEAU=g(9#5d6?>e:
O/F#4T0#\SNaF2#65E)V_H;dX;?D:/8\N^QEA)dV>:-M_bSJDZB5G7V]7EW#&Lb>
K8Fb0:e6>\A#4;DUT6.H8?.Fa9&SPD.b5BI+V,D=15H?)<&&QCHCQHBVXdX_QPRd
D=,_([=)PU5NY#.FGdPF+NIBbA(H?=c8.EgR]e,B6N9QACW3&+.A>BWb+Xg0I=bB
03eE]0&FO+VdBL[]XS/S)0OIA<b\26)TTgJN+\ZP:cC.KAWVECS0/4,TD)+.\-AT
+e)f/:9,Zg93DEC@^JFAAJVOX[-61PHJHLE5<fPV&[ZGPfRf;&+aYda&Z(8K@267
[B=GCMMP>:H(E8P>e\/L?SS,fg:2AFc)WeUfJK7<SMV-52I)#:02]EWK29^;EQEX
W+P/W[Y2[EPVE/[;F?3ZBRXO+.Z-Q>[V4?ZaG3Cb1dJIAU5fKE7CY(HEI6[aWf7W
&)FVB1AP).?Rg91::]EUA9M,N#a5ZBNO4^6Yb4&LK)c/SSP&0/Q&/DJ8BaN3.<ea
07fVIK(<g2R:Rc(YZ@Qg-RHJQEe,<dd4\FM;I7@USARMU)E=VM5O+N]=)((cE3[@
/f&AU]9:F.LaAO1=+KHP0^&3CSHB+#[a2J45H>?U1>KFL>GCL.UNM04LB52/Fc(#
;M2X.FIc^UBA#>&L-6Ag3Od@@.WQM3e3#Z>7HJ:E^4^Cca-I?^&P;D2:L5e3(Ma_
ecVAS9JG@U]6.6)cBZ4FaPE.;]8UFcWf:Q-8<>8YR]QBOT>I<:KL]Pf>FX3SSQ)Y
@_MC;,;Q.&3^=7KAMD0H]PLgZ0Q8/UfF9IN,,c81JQ+;d)VC7a3=,HU_2:1K&aYU
NS25E>aM\GX0WRH02BSSg-BI56&e4(ST,K\K3eXXXF01-&]+:[&=\4O\1\)d?<6(
f+S)QeP_&@;D#75F>cN98e1-N&3D)Cb1K0CS\V9O_I[KaVg;Ic@7ZXJP+,/6/BcC
4,P0)CG(_g7dJ(#C2\7>AHLC]UAFXL;fD^bSb&B##[OEL7ER;X,,GVeH?-B6QF#D
QE.YR<B_R/WAQ7QUcAb6TK1/MKI=b0:)#_;2PNX@Z_VR>V\,I0[&GL0aTNT(]-[X
8#.]\REc4,Q#93d]SRcA>XB@F=dMMG5>ILGOUY=_5BZT4S\6ESKg2P;a#8P3:;G>
D>C45M\LJ&NTWBA;#;00TW[&dPS,FF1-WL9PU]<B./RLC+4X/O.;,cM7W##GJOX8
H]O#db2SUI220QX:ZXe+I)SK=:2D3RWAgNg>=FcJ-]ZH8fU4dB>_[KE3I\7[A)/(
I5>4Y8Q\WWOLMHMX8?Kb4b#=4H&15WT[>0/9?55g<aS/6:3c,R/ZN/=C2;2dTfM.
1f)\K.&d.MZ<=I:2>=L7#&]PU?5A\8)16>a0P7;O.Q+\O&Z7b2)RBB49]e&&DA-2
/J=-8Mg(F<SWE82e-R4L6K/G@P84;99W&gIeMc=XRNG^ePbYQUN5P._FfD4OKQO9
[G\@)3KYK/-P:+-K7MY9g8]DY)cPD8-^H16\.YVL3OP5W[ccgQ_.3f7L:;]c[ca3
a<b0I<T>6?M-JFRB:M@HJOfdN31(AfR@1_YFDI#6RZ6aL::>G@)F0.NKM>;GQ^(T
#RR=Y_5@V)KQZ9g]gG.bbY2&(/-?8&F^<T\-7GP3/_748P,5)_W;L]7de\b6eI_X
<1J\_JgeB8+]c,(\-3W.c;N<?+=DNa@N03L1bD>08_;RAH=]E8N;eBdXW;LB^=1<
L<[C<0DZa\@M0=,f+9g,bSW&PL19,f#QR?g9b,?;(=9;PX;]O]5O7CIB9)R(3UVC
CE&W=(BZ8fRV5>BOL09ddO0-3)e;PC4d.G1OdIbDT(SR5ZG[a<:XaJT)Fc[]X2b7
)O0ZKeP1TPT9Hbg\S4NVI1>@I:=4:5>:dC@FI:a4HC2F=MCVC<,[aPD7WcL:9aSH
<SQ)I)I3PA=4A0.<R\+)(AMH8XZ]I_=_Pg56W3c0e,f2YGT;J)UcFU]3K9/>,@T;
5D&5J8XK:CD2G4IBAHe)-VTcU)R28:JP?R3A)@Nd<,e>ZQ4BHC7.@[9GX-)3V#+c
bddUM:J?_WS^2:5GF^?LB;\GdeZ^B+,D()+EP)/Q,SQ0-?9UPB&C\7XFQHKg^//6
:AX0-LO:W#V[=+<4]W_\;;LBb@Z]U5gO9XP_S6ce5UYDTGZ=RgN+g&44d_[adJeF
Ea3-EV9ReC1BUXg]d^C=#[J@/-88eK-Ag1dG)YI6a_,G90MJRKP59b?&g;:X65[4
;+:d=Gee=(=fW(DW(YUE^GVKaG/T[N3+NQ^/;]JTXR=F#+ASX+?A&UbP:SB8/[N0
YJ9;V(N8BfS>+L0c<K[83/3]3W-F&:IP.ST3d.4FK<;1Xc5M/dC3@J=Me9gc#2Ce
>K_[.e-?<;ZRK9JEfJL)MYZ&R-&ZaV./MHBgLMKOOIEdBE0:dc+0-/SgF57.R1&G
8X#Zc_:7<DWGVaA9.8UD5ILcV7#K+cMU?ZZCCP)OMe..#M^F^<3/;992A^I>c>J@
C/aW+2@5=,2KQP1IAa4RX1K8@YF\<^(]_?_1XTT,FU(c+a28,PK_dNU3-b0>)2;4
NEN8eR2V-5S[Lb,LK8[AM959IaWGB#G,85]4)CV6FF>f9TV21TEDRbe\\5<3Q1_4
f-P-W,33b.f1[.Z3T0D9-S.Qf&eWD2/0U\\bF^<)N0TOeJe\>.,0FZ6Y>cWe]e7.
&YK\#WOTN<9VJ/X7SN>e7+L)1]^MIH0a;HOTG>O4O+e6]eM3NG=N@8GZS.)29]cB
?1B&JfSa[MINg=S_XgP(BXA1f8(14&,_L2]fUPQeW(K\,8()FQDd[.O(F@a]N59P
9USe+0;UKc\fG[.:d([;NX)+@5_HB.3I.XKdd1Rg9WHc<+,fJf]GcK<>I-T8:OID
3S&I;4d_+LUQ]Zb6P<G-VfKG4WIJT(:4NdW7bIEC=,1#/S4b6WX0ZI:bVOOYWd?/
9V.7Y:]7J,ZXGP+X&IJM]E51U<#@P0/(WQMC6S^cUbV&&cLI?#:1eeL>=dJga_?W
I=2I&<1d;1+,C]-SO5:AC)(Pc_8]#9NN@Sg8+0=,I:91GSM(e0K,X_&D[9Hgd6K\
T97eAa?f4D=5CKM_,8EH+^E=B;,1a[=0Xc4a>QR6N9Y#-aSIB)5E@FEUf;)S<bNW
8\Q0X&BbcGE]X,S2WGA9,Z3PGX3eJLbYJ(:#99MZ&B01XKJM27Nc51,2Bf6d@Acg
RfRGV/=I#][YC3;L(.\_X36]?)0KAE/Wd87.eJ:<)\0P/(8AE\RZ>_cW1P&H[GS)
Y,VEIScfIeG#KWEccSC;EA5NN)N,UN=7Y1A2^A7ef17GQ7GHX[(LY28ALRgYO@FK
\EBag1F.(bH5?COb\9<88.beU]M\=?[(>\eJ;cf3f=:0cc+?PC^EEFR;O7R?S\I?
4J_I-_E#e3Aa5Q8A7W7[:+IP(91GU7a9FG,.OF[5R^.?+XQ;N+Z._U3+HW_^3cV&
Ea5GMQ=@)K_527N&D?0aH9b5Q[DMc?dPZFeK-Y^ZS#d<A07]_V0U6&DY46[UE>61
90<[F5Y<4UcI9+2DK<QUV4MZaFE[\f)+K5Y&N=Y^<^/<]J[:eK\/UTB71[NRVC4[
P,T&]5[c-_X-9@S:JLJ15eN=\;L-_V1<aK;_2^e>P[6@BUbDfJcFEP8#Te+>2TSY
PccQW5HR0N2?R1FJ_K.3X9&PS-_P<CH_+2SL(CMRLD+bPFa]_:fg.ZbH].&>Bbd4
XA3)V,PIadQ/;KPc.5,9UEYgJ3CZ>PN)M3dcX9,Kf/.F3NE\&c+U(:dXdbVT8<Y=
16;&X3B>EZ9Z<<Le/HXA5cV4d17^C2KDOF]#Q+.4F8)LL8d5[VGB6SKJ-S-MDB(/
PcdDJPEJFV;9#?A#?D#BfJ#DT?7:@Y(+bcX)C,4S;cXJ=ZN8VD-Zg6#S9WJN;Mg/
SU<E+),cbRPHdVEN#Y>6G60FOe26D2YM03BfNDW1[050C:S(FOg2B0U3[T\>FJ]:
U44Z@5.N6b[Z&A(/VLHOD8bfaBCMFfGKG\Q+6HaHT^WMfa3T[MW-c)JLP[LBbD_V
eCRW+2dE4cPOf:ZbZ^](+[f.[CR#\5T9.c@)IaMC0dF?eHH/=#BBZ:7VYJS0[.1D
7SNQ9/g8OCa#:MfDRC:KPH/I_E3R-+:AS(?G,2,Db6(0,H/+b:TLRH1YfHbd[96)
7<d:?CPWE=[B1?RK.W[^eU1-,7fQ.8P7a-G_DAY(aV)NW<A+V9:PYL86B(K)gHI0
8U(D0e2N6#_>.HC5)AaN510[#6N.4bMU]JN7:=U(-fPREY@Fb0&-WQ.KCAK84.\S
0ND8-E:EQL/I<1.+[^e1@3RB=]Z]_NUaF:[9O_#9gXCWR:gJPS@AY6EG&FD(_OAL
&cVZA[cR#YO@#3IF,@5g8NKf[WO3753&]0+Y[_-HeaE0,?ZE3g<^&CJIM\JXHDO\
LO-VFaZ\c]]P@aPa?6[?0:9D;5#-[80=\Nb-NUQ9+KX@B27_LDL@XUSRd\,0dYb[R$
`endprotected


`endif // GUARD_SVT_SPI_CONFIGURATION_SV

