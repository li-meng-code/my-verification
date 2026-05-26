/*
------------------------------------------------------------------------
--
--
// ------------------------------------------------------------------------------
// 
// Copyright 2016 - 2020 Synopsys, INC.
// 
// This Synopsys IP and all associated documentation are proprietary to
// Synopsys, Inc. and may only be used pursuant to the terms and conditions of a
// written license agreement with Synopsys, Inc. All other use, reproduction,
// modification, or distribution of the Synopsys IP or the associated
// documentation is strictly prohibited.
// 
// Component Name   : DWC_ssi
// Component Version: 1.03a
// Release Type     : GA
// ------------------------------------------------------------------------------

//
// Release version :  1.03a
// File Version     :        $Revision: #25 $
// Revision: $Id: //dwh/DW_ocb/DWC_ssi/ssic_ga_dev_br/src/DWC_ssi_cc_constants.vh#25 $
--
//
//
-- File :                       DWC_ssi_cc_constants.vh
-- Abstract     :               parameter file for the SSI.
--
-- =====================================================================
*/

// ---------------------------------------------------------------------
// Start Guard: prevent re-compilation of includes
// ---------------------------------------------------------------------
`ifndef __GUARD__DWC_SSI_CC_CONSTANTS__VH__
`define __GUARD__DWC_SSI_CC_CONSTANTS__VH__



// Name:         SSIC_ID
// Default:      0xffffffff
// Values:       0x0, ..., 0xffffffff
// 
// Specifies the individual peripheral Identification code.
`define SSIC_ID 32'h30204


// Name:         SSIC_SPI_BRIDGE
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      <DWC-SSI-SPI-SLV-BRIDGE feature authorize> == 1
// 
// Configures whether the core works as a Bridge between SPI and AHB interfaces with SPI being a primary interface. 
// In this configuration, all the SPI transfers will be directly converted in AHB transfers on secondary interface of AHB 
// Master.
`define SSIC_SPI_BRIDGE 0


// Name:         SSIC_IS_MASTER
// Default:      Serial Master ((SSIC_SPI_BRIDGE == 1) ? 0: 1)
// Values:       Serial Slave (0), Serial Master (1), Programmable (2)
// Enabled:      SSIC_SPI_BRIDGE==0
// 
// Configures the device as a master or a slave serial peripheral.
`define SSIC_IS_MASTER 1


// Name:         SSIC_SLVIF_TYPE
// Default:      AHB
// Values:       APB (0), AHB (1)
// Enabled:      SSIC_SPI_BRIDGE==1
// 
// Slave (programming) Interface Type for DWC_ssi.
`define SSIC_SLVIF_TYPE 1


// Name:         APB_DATA_WIDTH
// Default:      32
// Values:       8 16 32
// Enabled:      SSIC_SLVIF_TYPE==0
// 
// Width of APB data bus
`define APB_DATA_WIDTH 32


// Name:         SSIC_AHB_ADDR_OFFSET
// Default:      0x0
// Values:       0x0, ..., 0xffffffff
// Enabled:      SSIC_SPI_BRIDGE==1
// 
// Address offset for the for SPI bridge operations. The lower bits of the address will be picked from SPI address sent by 
// SPI master.
`define SSIC_AHB_ADDR_OFFSET 32'h0


// Name:         SSIC_ENH_CLK_RATIO
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_IS_MASTER!=1
// 
// Configures the device to include new architecture for Transmit and Receive FIFO. This enables the device to work on 
// clock ratios of 4 and 6 between ssi_clk and sclk_in signals.
`define SSIC_ENH_CLK_RATIO 0


// Name:         SSIC_HAS_EXT_RAM
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_BRIDGE==0 && SSIC_HAS_DMA!=2
// 
// When this parameter is selected. Internal FIFOs will be replaced by external Dual Port RAM. DWC_ssi will provide 
// separate interface to communicate with external RAM.
`define SSIC_HAS_EXT_RAM 0


// Name:         SSIC_HAS_TX_RX_EN
// Default:      Yes
// Values:       No (0), Yes (1)
// Enabled:      SSIC_HAS_EXT_RAM == 1
// 
// Selects if DWC_ssi support two external Dual Port RAM to store both TX and RX data at same time. Enable this parameter 
// if you want to perform one of the following transfer types: 
// 1.  For SPI/SSP transfers where TMOD is set to 0 (Receive and transmit). 
// 2.  For Microwire non-sequential transfer.
`define SSIC_HAS_TX_RX_EN 1


// Name:         SSIC_RAM_DEPTH
// Default:      32
// Values:       8 16 32 64 128 256
// Enabled:      SSIC_HAS_TX_RX_EN == 0
// 
// External RAM Depth. 
// Applicable only when SSIC_HAS_TX_RX_EN is set to 0.
`define SSIC_RAM_DEPTH 32


// Name:         SSIC_XIP_RX_FIFO_DEPTH
// Default:      32
// Values:       4 8 16 32 64 128
// Enabled:      SSIC_CONCURRENT_XIP_EN==1
// 
// Configures the depth of the XIP receive FIFO buffer. 
// This FIFO is used to store only intermediate data for XIP transfers. 
//  
// The data is stored in the FIFO when AHB slave interface gets WAIT/BUSY cycles in-between. If you do not expect any 
// wait/busy states between the transfers, then configure this to a minimum value. 
// The same FIFO is used for data storage and synchronization purpose in transfers where RXDS signalling is enabled. In 
// case when RXDS signalling is used 16 FIFO locations are required for synchronization, rest of the locations will be used as 
// data storage. User should consider this while deciding the FIFO depth in case if SSIC_HAS_RXDS is set to 1.
`define SSIC_XIP_RX_FIFO_DEPTH 32


// Name:         SSIC_NUM_SLAVES
// Default:      1
// Values:       1, ..., 16
// Enabled:      SSIC_IS_MASTER!=0
// 
// Configures the number of slave select lines from the DWC_ssi master.
`define SSIC_NUM_SLAVES 2


// Name:         SSIC_HAS_RX_SAMPLE_DELAY
// Default:      No
// Values:       No (0), Positive Edge Sampling (1), Use Both Positive and Negative 
//               Edges (2)
// Enabled:      SSIC_IS_MASTER!=0
// 
// Includes the logic to allow a programmable delay on the sample time of the rxd input. When this logic is included, the 
// default sample time of the rxd input can be delayed by a programmable number of ssi_clk cycles. There are two configuration 
// options: 
//  
// - 1 Use Positive edge of ssi_clk for RXD sampling 
//  
// - 2 Use both positive and negative edge of ssi_clk for RXD sampling. 
//  
// Positive and negative edge sampling increases number of sampling points within single sclk_out clock. Depending on the 
// frequency requirement customer can choose type of sampling.
`define SSIC_HAS_RX_SAMPLE_DELAY 1


// Name:         SSIC_RX_DLY_SR_DEPTH
// Default:      4
// Values:       4, ..., 255
// Enabled:      SSIC_HAS_RX_SAMPLE_DELAY!=0
// 
// Defines the maximum number of ssi_clk cycles that can be used to delay the sampling of the rxd input. For each value, 
// two registers are added to the design logic.
`define SSIC_RX_DLY_SR_DEPTH 4


// Name:         SSIC_HAS_DMA
// Default:      No DMA
// Values:       No DMA (0), External DMA (1), Internal DMA (2)
// Enabled:      SSIC_SPI_BRIDGE==0
// 
// Configures if DWC_ssi has DMA interface. 
// 1-  DMA interface will be configured to have external handshaking signals to interface with DMA controller. 
// 2-  Internal DMA will be configured which will be perform the transfers using AXI master interface.
`define SSIC_HAS_DMA 1


// Name:         SSIC_TX_FIFO_DEPTH
// Default:      32 ((SSIC_HAS_TX_RX_EN == 1) ? 32: SSIC_RAM_DEPTH)
// Values:       8 16 32 64 128 256
// Enabled:      SSIC_HAS_TX_RX_EN == 1
// 
// Configures the depth of the transmit FIFO buffer.
`define SSIC_TX_FIFO_DEPTH 32


// Name:         SSIC_RX_FIFO_DEPTH
// Default:      32 ( (SSIC_HAS_DMA == 2) ? SSIC_TX_FIFO_DEPTH : (SSIC_HAS_TX_RX_EN 
//               == 1) ? 32: SSIC_RAM_DEPTH)
// Values:       8 16 32 64 128 256
// Enabled:      SSIC_HAS_TX_RX_EN == 1 && SSIC_HAS_DMA != 2
// 
// Configures the depth of the receive FIFO buffer.
`define SSIC_RX_FIFO_DEPTH 32


// Name:         SSIC_CLK_EN_MODE
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SYNC_CLK==1
// 
// Enables the ssi_clk_en signal to enable data propagation through ssi_clk flip-flops. When disabled, the ssi_clk 
// flip-flops are always enabled.
`define SSIC_CLK_EN_MODE 0


// Name:         SSIC_SYNC_CLK
// Default:      Yes
// Values:       No (0), Yes (1)
// 
// Defines if the Slave interface clock is synchronous to the DWC_ssi core clock. If they are synchronous then one of them 
// need not re-time signals across the clock domains.
`define SSIC_SYNC_CLK 1


// Name:         SSIC_AHBM_SYNC_CLK
// Default:      Yes
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_BRIDGE==1
// 
// Defines if the mhclk (AHB Master interface clock) is synchronous to the DWC_ssi core clock.
`define SSIC_AHBM_SYNC_CLK 1


// Name:         SSIC_AXIM_SYNC_CLK
// Default:      Yes
// Values:       No (0), Yes (1)
// Enabled:      SSIC_HAS_DMA==2
// 
// Defines if the AXI Master Clock is synchronous to the DWC_ssi core clock.
`define SSIC_AXIM_SYNC_CLK 1

//Creating define for ASYNC clock

`define SSIC_HAS_AXIM_SYNC_CLK


// Name:         SSIC_AXIM_SLVIF_SYNC_CLK
// Default:      Yes (((SSIC_AXIM_SYNC_CLK == 1 && SSIC_SYNC_CLK == 1) || 
//               (SSIC_HAS_DMA!=2)) ? 1 : 0)
// Values:       No (0), Yes (1)
// Enabled:      SSIC_AXIM_SYNC_CLK==0 && SSIC_SYNC_CLK==0
// 
// Defines if the AXI Master Clock is synchronous to the AHB Slave Interface core clock.
`define SSIC_AXIM_SLVIF_SYNC_CLK 1

//Creating define for ASYNC clock

`define SSIC_HAS_AXIM_SLVIF_SYNC_CLK


// Name:         SSIC_HC_FRF
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_BRIDGE==0
// 
// Enables the frame format (serial protocol) to be fixed so that it cannot be changed. This restricts the use of DWC_ssi 
// to be only a single-frame format peripheral.
`define SSIC_HC_FRF 0


// Name:         SSIC_BOOT_MODE_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// 
// Specifies whether the boot mode is enabled for DWC_ssi. In this mode, the default value of the SSI_EN register is 1, 
// which means that DWC_ssi is enabled on reset. You can use use the SSI_DFLT_* parameters to set the default value of the 
// control registers on reset.
`define SSIC_BOOT_MODE_EN 1'h1


// Name:         SSIC_SCPH0_SSTOGGLE
// Default:      Yes
// Values:       No (0), Yes (1)
// Enabled:      0
// 
// When operating in SPI mode with clock phase (SCPH) set to 0, this parameter controls the behavior of the slave select 
// line (ss_*_n) between data frame. 
//  - If this parameter is set to "Yes" and CTRLR0.SSTE is set to 1, the ss_*_n line toggles between consecutive data 
//  frames, with the serial clock (sclk) being held to its default value while ss_*_n is high. 
//  - If this parameter is set to 0, the ss_*_n stays low and sclk runs continuously for the duration of the transfer.
`define SSIC_SCPH0_SSTOGGLE 1


// Name:         SSIC_SPI_MODE
// Default:      Standard SPI Mode
// Values:       Standard SPI Mode (0), SPI Dual Mode (1), SPI Quad Mode (2), SPI 
//               Octal Mode (3)
// Enabled:      ((SSIC_DFLT_FRF==0) || (SSIC_HC_FRF==0)) && (SSIC_IS_MASTER!=0)
// 
// Configures whether DWC_ssi works in the Standard, Dual, Quad or Octal SPI Mode. 
//  - Dual Mode: Width of txd and rxd signals are 2 bits. 
//  - Quad Mode: Width of txd and rxd signals are 4 bits. 
//  - Octal Mode: Width of txd and rxd signals are 8 bits.
`define SSIC_SPI_MODE 2


// Name:         SSIC_SPI_DYN_WS_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_MODE!=0 && SSIC_HAS_EXT_RAM==0
// 
// Configures Dynamic Wait State feature for SPI transfers.
`define SSIC_SPI_DYN_WS_EN 1


// Name:         SSIC_SLV_SPI_MODE
// Default:      Standard SPI Mode ((SSIC_SPI_BRIDGE == 1) ? 2: 0)
// Values:       Standard SPI Mode (0), SPI Dual Mode (1), SPI Quad Mode (2), SPI 
//               Octal Mode (3)
// Enabled:      ((SSIC_DFLT_FRF==0) || (SSIC_HC_FRF==0)) && (SSIC_IS_MASTER!=1)
// 
// Configures whether DWC_ssi works in the Standard, Dual, Quad or Octal SPI Mode in Slave configuration. 
//  - Dual Mode: Width of txd and rxd signals are 2 bits. 
//  - Quad Mode: Width of txd and rxd signals are 4 bits. 
//  - Octal Mode: Width of txd and rxd signals are 8 bits.
`define SSIC_SLV_SPI_MODE 0


// Name:         SSIC_INTR_POL
// Default:      Active Low
// Values:       Active Low (0), Active High (1)
// 
// Configures the active level of the output interrupt lines.
`define SSIC_INTR_POL 1


// Name:         SSIC_INTR_IO
// Default:      Individual Interrupts
// Values:       Individual Interrupts (0), Combined Interrupt (1)
// 
// Selects interrupt-related signals that must appear as output of the design. This parameter enables you to select a 
// single combined interrupt (the logical OR of all DWC_ssi interrupt outputs) or an individual interrupt to appear as a separate 
// output pin on the macrocell. When configured as a master, there are six individual interrupts. When configured as a slave, 
// there are five individual interrupts.
`define SSIC_INTR_IO 1


// Name:         SSIC_IO_MAP_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_MODE!=0 || SSIC_SLV_SPI_MODE!=0
// 
// Configures whether the I/O Mapping can be hardcoded within DWC_ssi. When this parameter is configured, the RXD[1] signal 
// is used to sample the incoming data during an SPI standard mode of operation in Master configuration and txd[1] is is 
// used to transmit data in SPI standard mode of operation in Slave configuration.
`define SSIC_IO_MAP_EN 1


// Name:         SSIC_CLK_STRETCH_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_MODE!=0
// 
// Configures DWC_ssi to support clock stretching in enhanced SPI transfers.
`define SSIC_CLK_STRETCH_EN 1


// Name:         SSIC_HAS_DDR
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_MODE != 0 && SSIC_IS_MASTER!=0
// 
// Includes the logic to support DDR operations in SPI mode.
`define SSIC_HAS_DDR 0


// Name:         SSIC_HAS_RXDS
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_HAS_DDR ==1
// 
// Specifies whether to include the logic to sample read data using the read data strobe signal.
`define SSIC_HAS_RXDS 0


// Name:         SSIC_XIP_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_MODE != 0 && SSIC_SPI_DYN_WS_EN == 0
// 
// Configures whether DWC_ssi supports XIP operations in the SPI mode. When this parameter is set to 1, an extra side-band 
// signal, xip_en, is included on the AHB interface and this signal decides if the operation is a register read-write or an 
// XIP transfer.
`define SSIC_XIP_EN 0


// Name:         SSIC_XIP_WRITE_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_XIP_EN == 1 && SSIC_HAS_EXT_RAM == 0
// 
// Configures DWC_ssi to include XIP Write Feature. When this parameter is set to 1, XIP write transfer is supported in SPI 
// interface.
`define SSIC_XIP_WRITE_EN 0


// Name:         SSIC_XIP_EXT_SSEL_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_XIP_EN == 1
// 
// EXternal Slave Select Signal for XIP transfers. When this parameter is set to 1 an external slave select signal 
// slave_sel will be added on interface which will be used to select slave for the XIP transfers.
`define SSIC_XIP_EXT_SSEL_EN 0


// Name:         SSIC_CONCURRENT_XIP_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_XIP_EN == 1 && SSIC_HAS_DMA != 2
// 
// Configures whether the core supports concurrent XIP and non-XIP operations in SPI Mode. 
// If this parameter is set to 1, DWC_ssi performs concurrent XIP and non-XIP transfers.
`define SSIC_CONCURRENT_XIP_EN 0


// Name:         SSIC_XIP_WRITE_REG_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_XIP_WRITE_EN==1 && SSIC_CONCURRENT_XIP_EN==1
// 
// Configures DWC_ssi to include separeate register sets for XIP Read and Write. When this parameter is set to 1, separate 
// registers need to be programmed for XIP Write.
`define SSIC_XIP_WRITE_REG_EN 0


// Name:         SSIC_XIP_TX_FIFO_DEPTH
// Default:      4 ((SSIC_XIP_WRITE_EN == 1) ? 32: 4)
// Values:       4 8 16 32 64 128
// Enabled:      SSIC_CONCURRENT_XIP_EN==1 && SSIC_XIP_WRITE_EN==1
// 
// Configures the depth of the XIP transmit FIFO buffer.
`define SSIC_XIP_TX_FIFO_DEPTH 4


// Name:         SSIC_XIP_CONT_XFER_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_XIP_EN == 1
// 
// Configures whether DWC_ssi supports continuous XIP transfers. In continuous XIP transfer mode DWC_ssi keeps the SPI 
// slave selected and waits for next AHB request. Once AHB request arrives it resumes the transfer. For more information please 
// refer to section "Continuous transfer mode in XIP".
`define SSIC_XIP_CONT_XFER_EN 0


// Name:         SSIC_XIP_PREFETCH_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      (SSIC_XIP_EN == 1 && (SSIC_CONCURRENT_XIP_EN == 1 || 
//               SSIC_HAS_TX_RX_EN == 1) && (SSIC_HAS_DMA != 2))
// 
// Configures whether DWC_ssi supports XIP pre-fetch feature. If this parameter is set to 1, then DWC_ssi pre-fetches a 
// fixed amount of data from the device and keep it in the FIFO for the next XIP request. If XIP commands are staggered, then 
// this feature helps in fetching the data faster from the device and improves the overall throughput of the system.
`define SSIC_XIP_PREFETCH_EN 0


// Name:         SSIC_CONT_XFER_TIMEOUT_CNT_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_XIP_CONT_XFER_EN == 1
// 
// Configures the time-out counter during continuous transfer. The counter value will be used to end the continuous 
// transfers if no XIP transfer is detected on AHB interface once the last continuous transfer has ended.
`define SSIC_CONT_XFER_TIMEOUT_CNT_EN 0


// Name:         SSIC_HYPERBUS_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SPI_MODE == 3 && SSIC_HAS_RXDS == 1
// 
// Configures whether DWC_ssi supports Hyperbus transfers. For more information about the Hyperbus transfer feature, see 
// the "Hyperbus Protocol Support" section in the DWC_ssi Databook.
`define SSIC_HYPERBUS_EN 0


// Name:         SSIC_SPI_DM_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_HAS_DDR ==1
// 
// Indicates whether the data mask signal must be included on the SPI interface. When active, the data mask signal (txd_dm) 
// and the data mask output enable signal (txd_dm_oe_n) are added to the SPI interface. The data mask signal is used to mask 
// the write data on an SPI interface.
`define SSIC_SPI_DM_EN 0


// Name:         SSIC_AXI_INTF_TYPE
// Default:      AXI3
// Values:       AXI3 (0), AXI4 (1)
// Enabled:      SSIC_HAS_DMA==2
// 
// The parameter selects the type of AXI interface
`define SSIC_AXI_INTF_TYPE 0


// Name:         SSIC_AXI_DW
// Default:      32
// Values:       32 64
// Enabled:      SSIC_HAS_DMA==2
// 
// Data width for AXI Interface
`define SSIC_AXI_DW 32


// Name:         SSIC_AXI_AW
// Default:      32
// Values:       32, ..., 64
// Enabled:      SSIC_HAS_DMA==2
// 
// Address width for AXI Interface
`define SSIC_AXI_AW 32


// Name:         SSIC_AXI_BLW
// Default:      4
// Values:       4 5 6 7 8
// Enabled:      SSIC_HAS_DMA==2
// 
// AXI Burst length width
`define SSIC_AXI_BLW 4


// Name:         SSIC_AXI_IDW
// Default:      6
// Values:       1, ..., 12
// Enabled:      SSIC_HAS_DMA==2
// 
// AXI ID width
`define SSIC_AXI_IDW 6


// Name:         SSIC_SAFETY_PKG_EN
// Default:      Disable
// Values:       Disable (0), Enable (1)
// Enabled:      0
// 
// Configures if DWC_ssi implements safety features targeted for automotive applications. Enabling this bit will include 
// following features: 
//  - FSM Parity checking feature 
//  - FSM time out feature 
//  - Internal Data path parity 
//  - Configuration register duplication 
//  - Parity signals for AXI read and write address channels and data channels 
//  - Parity signals for AHB Read data signal
`define SSIC_SAFETY_PKG_EN 0


// Name:         SSIC_SLVIF_PAR_EN
// Default:      No
// Values:       No (0), Data Parity (1), Address and Data Parity (2)
// Enabled:      SSIC_SAFETY_PKG_EN==1 && SSIC_SLVIF_TYPE==1
// 
// Configures DWC_ssi to include the Slave interface Parity checking and generation mechanism. 
//  - 0 - No Parity checker 
//  - 1 - Check parity of data 
//  - 2 - Check parity for both address and data
`define SSIC_SLVIF_PAR_EN 0


// Name:         SSIC_AXI_SAFETY_EN
// Default:      No AXI Safety
// Values:       No AXI Safety (0), Parity Protection (1), ECC on data signals & 
//               Parity on rest (2)
// Enabled:      SSIC_SAFETY_PKG_EN==1 && SSIC_HAS_DMA==2
// 
// This parameter allows user to Enable the Safety feature on the AXI Master Interface.  
//  - 0: No AXI Safety Features 
//  - 1: Parity Protection for Data and Control Signals 
//  - 2: ECC - for AXI Read and Write Data signals; Parity Protection for rest of the control signals.
`define SSIC_AXI_SAFETY_EN 0


// Name:         SSIC_READY_VALID_PAR_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_AXI_SAFETY_EN!=0
// 
// AXI Interface Ready and Valid Parity feature Enable/Disable.
// `define SSIC_READY_VALID_PAR_EN


// Name:         SSIC_PAR_TYPE
// Default:      Even
// Values:       Even (0), Odd (1)
// Enabled:      SSIC_SAFETY_PKG_EN==1
// 
// AHB Interface, AXI Interface and Data Path Parity type selection - Even or Odd Parity.
`define SSIC_PAR_TYPE 0


// Name:         SSIC_PAR_MODE
// Default:      8-bit Parity
// Values:       8-bit Parity (0), ARC Complaint Parity (1)
// Enabled:      SSIC_AXI_SAFETY_EN!=0
// 
// AXI Interface Parity Mode Selection: 
// - 0: Per 8-bit Parity Computation 
// - 1: ARC Mode Parity Computation
`define SSIC_PAR_MODE 0


// Name:         SSIC_AXI_PAR_EN
// Default:      No AXI Parity (SSIC_PAR_MODE==0 && SSIC_AXI_SAFETY_EN!=0)
// Values:       No AXI Parity (0), AXI Parity (1)
// Enabled:      SSIC_HAS_DMA==2 && SSIC_AXI_SAFETY_EN!=0
// 
// Configures DWC_ssi to include the AXI Parity checking and generation mechanism.
// `define SSIC_AXI_PAR_EN


// Name:         SSIC_ECC_GRAN_TYPE
// Default:      32-Bit ECC
// Values:       32-Bit ECC (1), 64-Bit ECC (2)
// Enabled:      SSIC_AXI_SAFETY_EN == 2
// 
// AXI Interface ECC Resolution Type. Which is used selects the  
//  Granularity of ECC Checkbits generation. 
//   - 1: 32 bit Granularity ECC Computation 
//   - 2: 64 bit Granularity ECC Computation
`define SSIC_ECC_GRAN_TYPE 1


// Name:         SSIC_AR_REGSLICE_EN
// Default:      No (SSIC_AXI_SAFETY_EN==2)
// Values:       No (0), Yes (1)
// Enabled:      SSIC_AXI_SAFETY_EN==2
// 
// This parameter allows user to enable/disable the Register Slice to ease the timing on the AR Channel.
`define SSIC_AR_REGSLICE_EN 0


// Name:         SSIC_AW_REGSLICE_EN
// Default:      No (SSIC_AXI_SAFETY_EN==2)
// Values:       No (0), Yes (1)
// Enabled:      SSIC_AXI_SAFETY_EN==2
// 
// This parameter allows user to enable/disable the Register Slice to ease the timing on the AW Channel.
`define SSIC_AW_REGSLICE_EN 0


// Name:         SSIC_W_REGSLICE_EN
// Default:      No (SSIC_AXI_SAFETY_EN==2)
// Values:       No (0), Yes (1)
// Enabled:      SSIC_AXI_SAFETY_EN==2
// 
// This parameter allows user to enable/disable the Register Slice to ease the timing on the W Channel.
`define SSIC_W_REGSLICE_EN 0


// Name:         SSIC_R_REGSLICE_EN
// Default:      No (SSIC_AXI_SAFETY_EN==2)
// Values:       No (0), Yes (1)
// Enabled:      SSIC_AXI_SAFETY_EN==2
// 
// This parameter allows user to enable/disable the Register Slice to ease the timing on the R Channel.
`define SSIC_R_REGSLICE_EN 0


// Name:         SSIC_B_REGSLICE_EN
// Default:      No (SSIC_AXI_SAFETY_EN==2)
// Values:       No (0), Yes (1)
// Enabled:      SSIC_AXI_SAFETY_EN==2
// 
// This parameter allows user to enable/disable the Register Slice to ease the timing on the B Channel.
`define SSIC_B_REGSLICE_EN 0

//*************************************************************************************************************
// Register default value parameters
//*************************************************************************************************************

// Name:         SSIC_DFLT_SCPOL
// Default:      Inactive level of the SPI serial clock 0
// Values:       Inactive level of the SPI serial clock 0 (0x0), Inactive level of 
//               the SPI serial clock 1 (0x1)
// Enabled:      SSIC_DFLT_FRF==0
// 
// The default value of register field CTRLR0.SCPOL which defines the SPI serial clock polarity available directly after 
// reset
`define SSIC_DFLT_SCPOL 1'h0


// Name:         SSIC_IS_DFLT_MST
// Default:      Default mode - Master
// Values:       Default mode - Slave (0x0), Default mode - Master (0x1)
// Enabled:      SSIC_IS_MASTER==2
// 
// The default value of register field CTRLR0.SSI_IS_MST which controls if SSI will work as serial master or serial slave.
`define SSIC_IS_DFLT_MST 1'h1


// Name:         SSIC_DFLT_BAUDR
// Default:      0x2 ((SSIC_BOOT_MODE_EN == 1) ? 2: 0)
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_IS_MASTER != 0
// 
// Specifies the default value of BAUDR register.
`define SSIC_DFLT_BAUDR 16'h10


// Name:         SSIC_IS_DFLT_MWMOD
// Default:      Non-Sequential ((SSIC_HAS_TX_RX_EN == 1) ? 0: 1)
// Values:       Non-Sequential (0x0), Sequential (0x1)
// Enabled:      SSIC_HAS_TX_RX_EN==1 && SSIC_SPI_BRIDGE == 0
// 
// Specifies the default value of MWMOD register bit.
`define SSIC_IS_DFLT_MWMOD 1'h0


// Name:         SSIC_IS_DFLT_MDD
// Default:      Receive (SSIC_HAS_TX_RX_EN == 1) ? 0: (SSIC_IS_MASTER != 0)
// Values:       Receive (0x0), Transmit (0x1)
// Enabled:      (SSIC_HAS_TX_RX_EN==1 || SSIC_IS_MASTER == 2) && (SSIC_SPI_BRIDGE 
//               == 0)
// 
// Specifies the default value of MDD register bit.
`define SSIC_IS_DFLT_MDD 1'h0


// Name:         SSIC_IS_DFLT_MHS
// Default:      Disabled
// Values:       Disabled (0x0), Enabled (0x1)
// Enabled:      SSIC_IS_MASTER != 0 && SSIC_IS_DFLT_MDD == 1
// 
// Specifies the default value of MHS register bit.
`define SSIC_IS_DFLT_MHS 1'h0


// Name:         SSIC_IS_DFLT_TXEIM
// Default:      Unmasked ((SSIC_SPI_BRIDGE == 1) ? 0: 1)
// Values:       Masked (0x0), Unmasked (0x1)
// 
// Specifies the default value IMR.TXEIM register field
`define SSIC_IS_DFLT_TXEIM 1'h1


// Name:         SSIC_DFLT_TXFTHR
// Default:      0
// Values:       -2147483648, ..., 2147483647
// Enabled:      SSIC_IS_MASTER != 0
// 
// Default value TXFTLR.TXFTHR register field
`define SSIC_DFLT_TXFTHR 16


// Name:         SSIC_DFLT_SLV
// Default:      Slave 1 ((SSIC_BOOT_MODE_EN == 1) ? 1: 0)
// Values:       None (0x0), Slave 1 (0x1), Slave 2 (0x2), Slave 3 (0x4), Slave 4 
//               (0x8), Slave 5 (0x10), Slave 6 (0x20), Slave 7 (0x40), Slave 8 (0x80), 
//               Slave 9 (0x100), Slave 10 (0x200), Slave 11 (0x400), Slave 12 
//               (0x800), Slave 13 (0x1000), Slave 14 (0x2000), Slave 15 (0x4000), Slave 16 
//               (0x8000)
// Enabled:      SSIC_IS_MASTER != 0
// 
// Specifies the default value of SER register.
`define SSIC_DFLT_SLV 16'h1


// Name:         SSIC_DFLT_FRF
// Default:      Motorola SPI
// Values:       Motorola SPI (0x0), TI SSP (0x1), NatSemi Microwire (0x2)
// Enabled:      SSIC_SPI_BRIDGE == 0
// 
// Selects the frame format that is available directly after reset. You can configure any frame format to be the default. 
// If the frame format is hardcoded, the default frame format is this hardcoded frame format.
`define SSIC_DFLT_FRF 2'h0


// Name:         SSIC_DFLT_SPI_DWS_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_SPI_DYN_WS_EN == 1 && SSIC_DFLT_FRF == 0
// 
// Default value of CTRLR0.SPI_DWS_EN register bit.
`define SSIC_DFLT_SPI_DWS_EN 1'h0


// Name:         SSIC_DFLT_MAX_WS
// Default:      0x0
// Values:       0x0, ..., 0xf
// Enabled:      SSIC_SPI_DYN_WS_EN == 1 && SSIC_DFLT_FRF == 0
// 
// Default value of SPI_CTRLR1.MAX_WS register bit.
`define SSIC_DFLT_MAX_WS 4'h0


// Name:         SSIC_DFLT_DYN_WS
// Default:      0x0
// Values:       0x0, ..., 0x7
// Enabled:      SSIC_SPI_DYN_WS_EN == 1 && SSIC_DFLT_FRF == 0
// 
// Default value of SPI_CTRLR1.DYN_WS register bit.
`define SSIC_DFLT_DYN_WS 3'h0


// Name:         SSIC_DFLT_HYPERBUS_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_HYPERBUS_EN == 1 && SSIC_DFLT_FRF == 0 && SSIC_DFLT_SCPH == 0 
//               && SSIC_DFLT_SCPOL == 0
// 
// Selects if DWC_ssi will act as Hyperbus master on reset.
`define SSIC_DFLT_HYPERBUS_EN 1'h0


// Name:         SSIC_DFLT_SPI_FRF
// Default:      Standard SPI format ((SSIC_DFLT_HYPERBUS_EN == 1) ? 3: 0)
// Values:       Standard SPI format (0x0), Dual SPI format (0x1), Quad SPI format 
//               (0x2), Octal SPI format (0x3)
// Enabled:      ((SSIC_SPI_MODE != 0 || SSIC_SLV_SPI_MODE !=0) && SSIC_DFLT_FRF == 
//               0 && SSIC_DFLT_HYPERBUS_EN == 0 && SSIC_SPI_BRIDGE==0)
// 
// Specifies the default value of the CTRLR0.SPI_FRF register field.
`define SSIC_DFLT_SPI_FRF 2'h0


// Name:         SSIC_DFLT_TMOD
// Default:      Transmit and Receive (((SSIC_DFLT_SPI_FRF != 0 && SSIC_DFLT_FRF == 
//               0) || (SSIC_HAS_TX_RX_EN == 0)) ? 1: 0)
// Values:       Transmit and Receive (0x0), Transmit Only/Write (0x1), Receive 
//               Only/Read (0x2), EEPROM Read (0x3)
// Enabled:      SSIC_SPI_BRIDGE==0
// 
// Specifies the default value for the CTRLR0.TMOD register field.
`define SSIC_DFLT_TMOD 2'h0


// Name:         SSIC_DFLT_CFS
// Default:      0x0
// Values:       0x0, ..., 0xf
// Enabled:      SSIC_SPI_BRIDGE==0
// 
// Specifies the default value for the CTRLR0.CFS register field.
`define SSIC_DFLT_CFS 4'h0


// Name:         SSIC_DFLT_DFS
// Default:      0x7
// Values:       0x3, ..., 0x1f
// Enabled:      SSIC_SPI_BRIDGE==0
// 
// CTRLR0.DFS register field default value
`define SSIC_DFLT_DFS 5'h7


// Name:         SSIC_DFLT_SCPH
// Default:      SPI serial data captured on the first edge of the serial clock
// Values:       SPI serial data captured on the first edge of the serial clock 
//               (0x0), SPI serial data captured on the second edge of the serial clock 
//               (0x1)
// Enabled:      SSIC_DFLT_FRF==0
// 
// The default value of register field CTRLR0.SCPH which defines the SPI serial clock phase available directly after reset.
`define SSIC_DFLT_SCPH 1'h0


// Name:         SSIC_DFLT_NDF
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_IS_MASTER != 0
// 
// Specifies the default value of the CTRLR1.NDF register.
`define SSIC_DFLT_NDF 16'h0


// Name:         SSIC_DFLT_TRANS_TYPE
// Default:      0x0 ((SSIC_DFLT_HYPERBUS_EN == 1) ? 2: 0)
// Values:       0x0, 0x1, 0x2
// Enabled:      SSIC_SPI_MODE != 0 && SSIC_DFLT_HYPERBUS_EN ==0 && 
//               SSIC_DFLT_SPI_FRF != 0
// 
// Specifies the default value of the SPI_CTRLR0.TRANS_TYPE register field. For information on the field decode value, see 
// the respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_TRANS_TYPE 2'h0


// Name:         SSIC_DFLT_ADDR_L
// Default:      0x0 ((SSIC_DFLT_HYPERBUS_EN == 1) ? 12: 0)
// Values:       0x0, ..., 0xf
// Enabled:      SSIC_SPI_MODE != 0 && SSIC_DFLT_HYPERBUS_EN ==0
// 
// Specifies the default value of the SPI_CTRLR0.ADDR_L register field. For information on the field decode value, see the 
// respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_ADDR_L 4'h0


// Name:         SSIC_DFLT_INST_L
// Default:      0x2 ((SSIC_DFLT_HYPERBUS_EN == 1) ? 0: 2)
// Values:       0x0, ..., 0x3
// Enabled:      SSIC_SPI_MODE != 0 && SSIC_DFLT_HYPERBUS_EN ==0
// 
// Specifies the default value for the SPI_CTRLR0.INST_L register field. For information on the field decode value, see the 
// respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_INST_L 2'h2


// Name:         SSIC_DFLT_WAIT_CYCLES
// Default:      0x0
// Values:       0x0, ..., 0x1f
// Enabled:      SSIC_SPI_MODE != 0
// 
// Specifies the default value for the SPI_CTRLR0.WAIT_CYCLES register field. For information on the field decode value, 
// see the respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_WAIT_CYCLES 5'h0


// Name:         SSIC_DFLT_DDR_EN
// Default:      No ((SSIC_DFLT_HYPERBUS_EN == 1) ? 1: 0)
// Values:       No (0x0), Yes (0x1)
// Enabled:      ((SSIC_HAS_DDR != 0) && (SSIC_DFLT_SPI_FRF != 0) && (SSIC_DFLT_SCPH 
//               == SSIC_DFLT_SCPOL) && SSIC_DFLT_HYPERBUS_EN == 0)
// 
// Specifies the default value for the SPI_CTRLR0.SPI_DDR_EN register field.
`define SSIC_DFLT_DDR_EN 1'h0


// Name:         SSIC_DFLT_INST_DDR_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_DFLT_DDR_EN == 1
// 
// Specifies the default value for the SPI_CTRLR0.INST_DDR_EN register field.
`define SSIC_DFLT_INST_DDR_EN 1'h0


// Name:         SSIC_DFLT_RXDS_EN
// Default:      No ((SSIC_DFLT_HYPERBUS_EN == 1) ? 1: 0)
// Values:       No (0x0), Yes (0x1)
// Enabled:      (SSIC_HAS_RXDS != 0) && (SSIC_DFLT_DDR_EN == 1) && SSIC_DFLT_SCPH 
//               ==0 && SSIC_DFLT_SCPOL ==0 && SSIC_DFLT_HYPERBUS_EN == 0
// 
// Specifies the default value for the SPI_CTRLR0.SPI_RXDS_EN register field.
`define SSIC_DFLT_RXDS_EN 1'h0


// Name:         SSIC_DFLT_DFS_HC
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      (SSIC_XIP_EN == 1 && (SSIC_DFLT_SPI_FRF != 0))
// 
// Specifies the default value for the SPI_CTRLR0.XIP_DFS_HC (when SSIC_CONCURRENT_XIP_EN = 0) or XIP_CTRL.DFS_HC (when 
// SSIC_CONCURRENT_XIP_EN = 1) register field.
`define SSIC_DFLT_DFS_HC 1'h0


// Name:         SSIC_DFLT_XIP_INST_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_XIP_EN != 0
// 
// Specifies the default value for the SPI_CTRLR0.XIP_INST_EN (when SSIC_CONCURRENT_XIP_EN = 0) or XIP_CTRL.INST_EN (when 
// SSIC_CONCURRENT_XIP_EN = 1) register field.
`define SSIC_DFLT_XIP_INST_EN 1'h0


// Name:         SSIC_DFLT_XIP_CONT_XFER_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      (SSIC_XIP_CONT_XFER_EN != 0 && SSIC_DFLT_DFS_HC == 0 
//               &&((SSIC_DFLT_SCPH ==0 && SSIC_DFLT_SCPOL ==0) || SSIC_DFLT_DDR_EN == 0))
// 
// Specifies the default value for the SPI_CTRLRo.SSIC_XIP_CONT_XFER_EN (when SSIC_CONCURRENT_XIP_EN = 0) or 
// XIP_CTRL.CONT_XFER_EN (when SSIC_CONCURRENT_XIP_EN = 1) register field.
`define SSIC_DFLT_XIP_CONT_XFER_EN 1'h0


// Name:         SSIC_DFLT_DM_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_SPI_DM_EN == 1 & SSIC_DFLT_TMOD == 1 & SSIC_DFLT_DDR_EN == 1
// 
// Specifies the default value for the SPI_CTRLR0.SPI_DM_EN register field.
`define SSIC_DFLT_DM_EN 1'h0


// Name:         SSIC_DFLT_RXDS_SIG_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_DFLT_HYPERBUS_EN == 1
// 
// Specifies the default value for the SPI_CTRLR0.SPI_RXDS_SIG_EN register field.
`define SSIC_DFLT_RXDS_SIG_EN 1'h0


// Name:         SSIC_DFLT_MD_BITS
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_XIP_EN == 1
// 
// Specifies the default value of the XIP_MODE_BITS register.
`define SSIC_DFLT_MD_BITS 16'h0


// Name:         SSIC_DFLT_INCR_INST
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_XIP_EN == 1
// 
// Specifies the default value of XIP_INCR_INST register.
`define SSIC_DFLT_INCR_INST 16'h0


// Name:         SSIC_DFLT_WRAP_INST
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_XIP_EN == 1
// 
// Specifies the default value of XIP_WRAP_INST register.
`define SSIC_DFLT_WRAP_INST 16'h0


// Name:         SSIC_XIPWR_DFLT_INCR_INST
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_XIP_WRITE_REG_EN == 1
// 
// Specifies the default value of XIP_WRITE_INCR_INST register.
`define SSIC_XIPWR_DFLT_INCR_INST 16'h0


// Name:         SSIC_XIPWR_DFLT_WRAP_INST
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_XIP_WRITE_REG_EN == 1
// 
// Specifies the default value of XIP_WRITE_WRAP_INST register.
`define SSIC_XIPWR_DFLT_WRAP_INST 16'h0


// Name:         SSIC_DFLT_XIP_HYPERBUS_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_HYPERBUS_EN==1 && SSIC_DFLT_FRF==0 && 
//               SSIC_CONCURRENT_XIP_EN==1 && SSIC_DFLT_SCPH==0 & SSIC_DFLT_SCPOL==0
// 
// Selects if DWC_ssi will act as Hyperbus master on reset for XIP transfers.
`define SSIC_DFLT_XIP_HYPERBUS_EN 1'h0


// Name:         SSIC_DFLT_XIP_RXDS_SIG_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_DFLT_HYPERBUS_EN == 1 && SSIC_CONCURRENT_XIP_EN == 1
// 
// Specifies the default value for the XIP_CTRL.RXDS_SIG_EN register field.
`define SSIC_DFLT_XIP_RXDS_SIG_EN 1'h0


// Name:         SSIC_DFLT_XIP_SPI_FRF
// Default:      Dual SPI format ((SSIC_DFLT_XIP_HYPERBUS_EN == 1) ? 3: 1)
// Values:       Dual SPI format (0x1), Quad SPI format (0x2), Octal SPI format 
//               (0x3)
// Enabled:      SSIC_CONCURRENT_XIP_EN == 1 && SSIC_DFLT_FRF == 0 && 
//               SSIC_DFLT_XIP_HYPERBUS_EN == 0
// 
// Specifies the default value of the XIP_CTRL.FRF register field.
`define SSIC_DFLT_XIP_SPI_FRF 2'h1


// Name:         SSIC_DFLT_XIP_TRANS_TYPE
// Default:      0x0 ((SSIC_DFLT_XIP_HYPERBUS_EN == 1) ? 2: 0)
// Values:       0x0, 0x1, 0x2
// Enabled:      SSIC_CONCURRENT_XIP_EN == 1 && SSIC_DFLT_XIP_HYPERBUS_EN ==0
// 
// Specifies the default value of the XIP_CTRL.TRANS_TYPE register field. For information on the field decode value, see 
// the respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_XIP_TRANS_TYPE 2'h0


// Name:         SSIC_DFLT_XIP_ADDR_L
// Default:      0x0 ((SSIC_DFLT_XIP_HYPERBUS_EN == 1) ? 12: 0)
// Values:       0x0, ..., 0xf
// Enabled:      SSIC_CONCURRENT_XIP_EN == 1 && SSIC_DFLT_XIP_HYPERBUS_EN ==0
// 
// Specifies the default value of the XIP_CTRL.ADDR_L register field. For information on the field decode value, see the 
// respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_XIP_ADDR_L 4'h0


// Name:         SSIC_DFLT_XIP_INST_L
// Default:      0x2 ((SSIC_DFLT_XIP_HYPERBUS_EN == 1) ? 0: 2)
// Values:       0x0, ..., 0x3
// Enabled:      SSIC_CONCURRENT_XIP_EN == 1 && SSIC_DFLT_XIP_HYPERBUS_EN ==0
// 
// Specifies the default value for the XIP_CTRL.INST_L register field. For information on the field decode value, see the 
// respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_XIP_INST_L 2'h2


// Name:         SSIC_DFLT_XIP_WAIT_CYCLES
// Default:      0x0
// Values:       0x0, ..., 0x1f
// Enabled:      SSIC_CONCURRENT_XIP_EN == 1
// 
// Specifies the default value for the XIP_CTRL.WAIT_CYCLES register field. For information on the field decode value, see 
// the respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_DFLT_XIP_WAIT_CYCLES 5'h0


// Name:         SSIC_DFLT_XIP_DDR_EN
// Default:      No ((SSIC_DFLT_XIP_HYPERBUS_EN == 1) ? 1: 0)
// Values:       No (0x0), Yes (0x1)
// Enabled:      ((SSIC_HAS_DDR == 1) && (SSIC_CONCURRENT_XIP_EN == 1) && 
//               (SSIC_DFLT_SCPH == SSIC_DFLT_SCPOL) && SSIC_DFLT_XIP_HYPERBUS_EN == 0)
// 
// Specifies the default value for the XIP_CTRL.DDR_EN register field.
`define SSIC_DFLT_XIP_DDR_EN 1'h0


// Name:         SSIC_DFLT_XIP_INST_DDR_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_DFLT_XIP_DDR_EN == 1
// 
// Specifies the default value for the XIP_CTRL.INST_DDR_EN register field.
`define SSIC_DFLT_XIP_INST_DDR_EN 1'h0


// Name:         SSIC_DFLT_XIP_RXDS_EN
// Default:      No ((SSIC_DFLT_XIP_HYPERBUS_EN == 1) ? 1: 0)
// Values:       No (0x0), Yes (0x1)
// Enabled:      (SSIC_HAS_RXDS != 0) && (SSIC_DFLT_XIP_DDR_EN == 1) && 
//               SSIC_DFLT_SCPH ==0 && SSIC_DFLT_SCPOL ==0 && SSIC_DFLT_XIP_HYPERBUS_EN == 0
// 
// Specifies the default value for the XIP_CTRL.RXDS_EN register field.
`define SSIC_DFLT_XIP_RXDS_EN 1'h0


// Name:         SSIC_DFLT_MD_BITS_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_XIP_EN == 1
// 
// Specifies the default value for the SPI_CTRLR0.XIP_MD_BITS_EN (When SSIC_CONCURRENT_XIP_EN = 0) or XIP_CTRL.MD_BITS_EN 
// (when SSIC_CONCURRENT_XIP_EN = 1) register field.
`define SSIC_DFLT_MD_BITS_EN 1'h0


// Name:         SSIC_DFLT_XIP_MBL
// Default:      Eight
// Values:       Two (0x0), Four (0x1), Eight (0x2), Sixteen (0x3)
// Enabled:      SSIC_XIP_EN == 1
// 
// Specifies the default value for the SPI_CTRLR0.XIP_MBL (when SSIC_CONCURRENT_XIP_EN = 0) or XIP_CTRL.XIP_MBL (when 
// SSIC_CONCURRENT_XIP_EN = 1) register field.
`define SSIC_DFLT_XIP_MBL 2'h2


// Name:         SSIC_DFLT_XIP_PREFETCH
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      (SSIC_XIP_PREFETCH_EN == 1 && SSIC_DFLT_DFS_HC == 0 && 
//               ((SSIC_DFLT_SCPH ==0 && SSIC_DFLT_SCPOL ==0) || SSIC_DFLT_DDR_EN == 0))
// 
// Specifies the default value for the XIP_PREFETCH_EN register field.
`define SSIC_DFLT_XIP_PREFETCH 1'h0


// Name:         SSIC_DFLT_CLK_STRETCH
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_CLK_STRETCH_EN == 1
// 
// Specifies the default value for the CLK_STRETCH_EN register field.
`define SSIC_DFLT_CLK_STRETCH 1'h0


// Name:         SSIC_DFLT_XIP_SLV
// Default:      None
// Values:       None (0x0), Slave 1 (0x1), Slave 2 (0x2), Slave 3 (0x4), Slave 4 
//               (0x8), Slave 5 (0x10), Slave 6 (0x20), Slave 7 (0x40), Slave 8 (0x80), 
//               Slave 9 (0x100), Slave 10 (0x200), Slave 11 (0x400), Slave 12 
//               (0x800), Slave 13 (0x1000), Slave 14 (0x2000), Slave 15 (0x4000), Slave 16 
//               (0x8000)
// Enabled:      SSIC_CONCURRENT_XIP_EN == 1
// 
// Specifies the default value of XIP_SER register.
`define SSIC_DFLT_XIP_SLV 16'h0


// Name:         SSIC_DFLT_XIP_TOCNT
// Default:      0x0
// Values:       0x0, ..., 0xff
// Enabled:      SSIC_CONT_XFER_TIMEOUT_CNT_EN == 1
// 
// Specifies the default count down value for slave de-select in continuous XIP mode.
`define SSIC_DFLT_XIP_TOCNT 8'h0


// Name:         SSIC_DFLT_RXFBTL
// Default:      0
// Values:       0, ..., 255
// Enabled:      SSIC_SPI_BRIDGE == 1
// 
// Specifies the default value of RXFBTL field in RXFBTR register.
`define SSIC_DFLT_RXFBTL 0


// Name:         SSIC_DFLT_IDMAE
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_HAS_DMA == 2 & SSIC_DFLT_TMOD!=3 &  SSIC_DFLT_TMOD!=0 & 
//               SSIC_DFLT_SPI_FRF !=0
// 
// Specifies the default value of IDMAE field of DMACR register.
`define SSIC_DFLT_IDMAE 0


// Name:         SSIC_DFLT_ATW
// Default:      1 byte
// Values:       1 byte (0), 2 bytes (1), 4 bytes (2), 8 bytes (3)
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default AXI transfer width for DMA transfers
`define SSIC_DFLT_ATW 0


// Name:         SSIC_DFLT_AINC
// Default:      0
// Values:       0 1
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of AINC field of DMACR register.
`define SSIC_DFLT_AINC 0


// Name:         SSIC_DFLT_ACACHE
// Default:      0x0
// Values:       0x0, ..., 0xf
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of ACACHE field of DMACR register.
`define SSIC_DFLT_ACACHE 4'h0


// Name:         SSIC_DFLT_APROT
// Default:      0x0
// Values:       0x0, ..., 0x7
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of APROT field of DMACR register.
`define SSIC_DFLT_APROT 3'h0


// Name:         SSIC_DFLT_AID
// Default:      0x0
// Values:       0x0, ..., 0xfff
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of AID field of DMACR register.
`define SSIC_DFLT_AID 12'h0


// Name:         SSIC_DFLT_ARLEN
// Default:      0x7
// Values:       0x0, ..., 0xff
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of ARLEN register.
`define SSIC_DFLT_ARLEN 8'h7


// Name:         SSIC_DFLT_AWLEN
// Default:      0x7
// Values:       0x0, ..., 0xff
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of AWLEN register.
`define SSIC_DFLT_AWLEN 8'h7


// Name:         SSIC_DFLT_AXIAR0
// Default:      0x0
// Values:       0x0, ..., 0xffffffff
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of AXIAR0 register.
`define SSIC_DFLT_AXIAR0 32'h0


// Name:         SSIC_DFLT_AXIAR1
// Default:      0x0
// Values:       0x0, ..., 0xffffffff
// Enabled:      SSIC_HAS_DMA == 2 && SSIC_AXI_AW > 32
// 
// Specifies the default value of AXIAR1 register.
`define SSIC_DFLT_AXIAR1 32'h0


// Name:         SSIC_DFLT_SPIAR
// Default:      0x0
// Values:       0x0, ..., 0xffffffff
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of SPIAR register.
`define SSIC_DFLT_SPIAR 32'h0


// Name:         SSIC_DFLT_SPI_INST
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of SPI_INST field if SPIDR register.
`define SSIC_DFLT_SPI_INST 16'h0

//Specifies the default value of PAR_EN field of SAFETYCR register.

`define SSIC_DFLT_PAR_EN 0

//Specifies the default value of PAR_MODE field of SAFETYCR register.

`define SSIC_DFLT_PAR_MODE 0


// Name:         SSIC_DFLT_FSM_PAR_EN
// Default:      No
// Values:       No (0), Yes (1)
// Enabled:      SSIC_SAFETY_PKG_EN == 1
// 
// Specifies the default value of FSM_PAR_EN field of SAFETYCR register.
`define SSIC_DFLT_FSM_PAR_EN 0


// Name:         SSIC_DFLT_SLVIFFSMTOV
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_SAFETY_PKG_EN == 1
// 
// Specifies the default value of SLVIFFSMTOCR register.
`define SSIC_DFLT_SLVIFFSMTOV 16'h0


// Name:         SSIC_DFLT_SSI_TOS
// Default:      0x0
// Values:       0x0, 0x1, 0x2, 0x3
// Enabled:      SSIC_HAS_DMA == 2
// 
// Specifies the default value of TOS field of SLVIFFSMTOCR register.
`define SSIC_DFLT_SSI_TOS 2'h0


// Name:         SSIC_DFLT_SSIFSMTOV
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_SAFETY_PKG_EN == 1
// 
// Specifies the default value of SSIFSMTOCR register.
`define SSIC_DFLT_SSIFSMTOV 16'h0


// Name:         SSIC_DFLT_AXIFSMTOV
// Default:      0x0
// Values:       0x0, ..., 0xffff
// Enabled:      SSIC_SAFETY_PKG_EN == 1 && SSIC_HAS_DMA == 2
// 
// Specifies the default value of AXIFSMTOCR register.
`define SSIC_DFLT_AXIFSMTOV 16'h0


// Name:         SSIC_XIPWR_DFLT_FRF
// Default:      SPI Quad Mode
// Values:       SPI Dual Mode (0x1), SPI Quad Mode (0x2), SPI Octal Mode (0x3)
// Enabled:      SSIC_XIP_WRITE_REG_EN == 1
// 
// Selects the SPI frame format that is available directly after reset. You can configure any frame format to be the 
// default.
`define SSIC_XIPWR_DFLT_FRF 2'h2


// Name:         SSIC_XIPWR_DFLT_TRANS_TYPE
// Default:      0x0
// Values:       0x0, 0x1, 0x2
// Enabled:      SSIC_XIP_WRITE_REG_EN == 1
// 
// Specifies the default value of the XIP_WRITE_CTRL.WR_TRANS_TYPE register field. For information on the field decode 
// value, see the respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_XIPWR_DFLT_TRANS_TYPE 2'h0


// Name:         SSIC_XIPWR_DFLT_ADDR_L
// Default:      0x7
// Values:       0x0, ..., 0xf
// Enabled:      SSIC_XIP_WRITE_REG_EN == 1
// 
// Specifies the default value of the XIP_WRITE_CTRL.WR_ADDR_L register field. For information on the field decode value, 
// see the respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_XIPWR_DFLT_ADDR_L 4'h7


// Name:         SSIC_XIPWR_DFLT_INST_L
// Default:      0x0
// Values:       0x0, ..., 0x3
// Enabled:      SSIC_XIP_WRITE_REG_EN == 1
// 
// Specifies the default value for the XIP_WRITE_CTRL.WR_INST_L register field. For information on the field decode value, 
// see the respective register field description in the "Register Descriptions" chapter in the DWC_ssi Databook.
`define SSIC_XIPWR_DFLT_INST_L 2'h0


// Name:         SSIC_XIPWR_DFLT_DDR_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_HAS_DDR == 1
// 
// Specifies the default value for the XIP_WRITE_CTRL.WR_SPI_DDR_EN register field.
`define SSIC_XIPWR_DFLT_DDR_EN 1'h0


// Name:         SSIC_XIPWR_DFLT_INST_DDR_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_XIPWR_DFLT_DDR_EN == 1
// 
// Specifies the default value for the XIP_WRITE_CTRL.WR_INST_DDR_EN register field.
`define SSIC_XIPWR_DFLT_INST_DDR_EN 1'h0


// Name:         SSIC_XIPWR_DFLT_HYPERBUS_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_HYPERBUS_EN==1 && SSIC_DFLT_FRF==0 && 
//               SSIC_CONCURRENT_XIP_EN==1 && SSIC_DFLT_SCPH==0 & SSIC_DFLT_SCPOL==0 && SSIC_XIP_WRITE_REG_EN 
//               == 1
// 
// Selects if DWC_ssi will act as Hyperbus master on reset for XIP Write transfers.
`define SSIC_XIPWR_DFLT_HYPERBUS_EN 1'h0


// Name:         SSIC_XIPWR_DFLT_RXDS_SIG_EN
// Default:      No
// Values:       No (0x0), Yes (0x1)
// Enabled:      SSIC_XIPWR_DFLT_HYPERBUS_EN == 1
// 
// Specifies the default value for the XIP_WRITE_CTRL.XIPWR_RXDS_SIG_EN register field.
`define SSIC_XIPWR_DFLT_RXDS_SIG_EN 1'h0



// Name:         SSIC_XIPWR_DFLT_XIP_WAIT_CYCLES
// Default:      0x0
// Values:       0x0, ..., 0x1f
// Enabled:      SSIC_XIPWR_DFLT_HYPERBUS_EN == 1
// 
// Specifies the default value for the XIP_WRITE_CTRL.XIPWR_WAIT_CYCLES register field.
`define SSIC_XIPWR_DFLT_XIP_WAIT_CYCLES 5'h0

//*************************************************************************************************************
// Synchronization depth parameters
//*************************************************************************************************************

// Name:         SSIC_H_2_S_SYNC_DEPTH
// Default:      2
// Values:       2 3 4
// Enabled:      SSIC_SYNC_CLK == 0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi Slave clock domain to DWC_ssi 
// Core Clock domain (ssi_clk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_H_2_S_SYNC_DEPTH 2


// Name:         SSIC_S_2_H_SYNC_DEPTH
// Default:      2
// Values:       2 3 4
// Enabled:      SSIC_SYNC_CLK == 0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi Core Clock doman (ssi_clk) to 
// DWC_ssi Slave clock domain. 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_S_2_H_SYNC_DEPTH 2


// Name:         SSIC_MH_2_S_SYNC_DEPTH
// Default:      2
// Values:       2 3 4
// Enabled:      SSIC_AHBM_SYNC_CLK == 0
// 
// Defines the number of synchronization register stages for signals passing from the AHB Master clock domain (mhclk) to 
// DWC_ssi Core Clock domain (ssi_clk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_MH_2_S_SYNC_DEPTH 2


// Name:         SSIC_S_2_MH_SYNC_DEPTH
// Default:      2
// Values:       2 3 4
// Enabled:      SSIC_AHBM_SYNC_CLK == 0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi Core Clock doman (ssi_clk) to 
// AHB Master clock domain (mhclk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_S_2_MH_SYNC_DEPTH 2


// Name:         SSIC_MH_2_H_SYNC_DEPTH
// Default:      2 ((SSIC_AHBM_SYNC_CLK == 0 && SSIC_SYNC_CLK == 1) ? 
//               SSIC_MH_2_S_SYNC_DEPTH : ((SSIC_AHBM_SYNC_CLK == 1 && SSIC_SYNC_CLK == 0) ? 
//               SSIC_H_2_S_SYNC_DEPTH : 2))
// Values:       2 3 4
// Enabled:      SSIC_AHBM_SYNC_CLK == 0 && SSIC_SYNC_CLK == 0
// 
// Defines the number of synchronization register stages for signals passing from the AHB Master clock domain (mhclk) to 
// DWC_ssi slave interface clock domain. 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_MH_2_H_SYNC_DEPTH 2


// Name:         SSIC_H_2_MH_SYNC_DEPTH
// Default:      2 ((SSIC_AHBM_SYNC_CLK == 0 && SSIC_SYNC_CLK == 1) ? 
//               SSIC_S_2_MH_SYNC_DEPTH : ((SSIC_AHBM_SYNC_CLK == 1 && SSIC_SYNC_CLK == 0) ? 
//               SSIC_S_2_H_SYNC_DEPTH : 2))
// Values:       2 3 4
// Enabled:      SSIC_AHBM_SYNC_CLK == 0 && SSIC_SYNC_CLK == 0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi slave interface clock domain 
// to AHB Master clock domain (mhclk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_H_2_MH_SYNC_DEPTH 2


// Name:         SSIC_A_2_S_SYNC_DEPTH
// Default:      2
// Values:       2 3 4
// Enabled:      SSIC_AXIM_SYNC_CLK==0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi AXI clock domain (aclk) to 
// DWC_ssi Core Clock domain (ssi_clk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_A_2_S_SYNC_DEPTH 2


// Name:         SSIC_S_2_A_SYNC_DEPTH
// Default:      2
// Values:       2 3 4
// Enabled:      SSIC_AXIM_SYNC_CLK==0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi Core Clock domain (ssi_clk) 
// to DWC_ssi AXI clock domain (aclk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_S_2_A_SYNC_DEPTH 2


// Name:         SSIC_A_2_H_SYNC_DEPTH
// Default:      2 (SSIC_A_2_S_SYNC_DEPTH)
// Values:       2 3 4
// Enabled:      SSIC_AXIM_SLVIF_SYNC_CLK==0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi AXI clock domain (aclk) to 
// DWC_ssi AHB slave clock domain (hclk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_A_2_H_SYNC_DEPTH 2


// Name:         SSIC_H_2_A_SYNC_DEPTH
// Default:      2 (SSIC_S_2_A_SYNC_DEPTH)
// Values:       2 3 4
// Enabled:      SSIC_AXIM_SLVIF_SYNC_CLK==0
// 
// Defines the number of synchronization register stages for signals passing from the DWC_ssi AHB slave clock domain (hclk) 
// to DWC_ssi AXI clock domain (aclk). 
//  - 2: Two-stage synchronization, both stages positive edge. 
//  - 3: Three-stage synchronization, all stages positive edge. 
//  - 4: Four-stage synchronization, all stages positive edge.
`define SSIC_H_2_A_SYNC_DEPTH 2

//*************************************************************************************************************
// Internal Defines
//*************************************************************************************************************

// Name:         SSIC_XIP_INST_EN
// Default:      No (SSIC_XIP_EN == 1)
// Values:       No (0), Yes (1)
// Enabled:      0
// 
// Configures whether DWC_ssi supports Instruction phase in the XIP mode of operation. When this parameter is set to 1, two 
// registers are included in the register map of DWC_ssi. These registers store instruction opcodes for INCR and WRAP 
// transfers. If the SSIC_XIP_INST_EN bit is set to 1, XIP transfers have an instruction phase before the address phase, and the 
// instruction opcode is selected from the XIP_INCR_INST or XIP_WRAP_INST register based on the type of transfer.
`define SSIC_XIP_INST_EN 0


// Name:         SSIC_ERR_RESP_EN
// Default:      Yes (SSIC_SPI_BRIDGE==0)
// Values:       No (0), Yes (1)
// Enabled:      0
// 
// Specifies whether an AHB interface must provide error response for invalid read and write accesses. If this parameter is 
// set to 0, then hresp is always hardcoded to 0.
`define SSIC_ERR_RESP_EN 1


//Each corekit has a version number.
//This is relected in the ascii version number which needs to get translated.
// 0 => 48 -> 30
// 1 => 49 -> 31
// 2 => 50 -> 32
// A => 65 -> 41
// B => 66 -> 42
// C => 67 -> 43
//
//Current Version is 1.03* => 31_30_33_2A
//

`define SSIC_VERSION_ID 32'h3130332a

//Random seed used in the testbench

`define SSIC_RAND_SEED 32'h0


//Used to insert internal tests

//Maximum Transfer Size

`define SSIC_MAX_XFER_SIZE 32


`define SSIC_ENCRYPT

//Setting up a clock period for the SSI.

`define SSIC_CLK_PERIOD 8

//Setting up a clock period for AHB Master

`define HCLK_PERIOD 8

//Setting up a clock period for AHB Master

`define MHCLK_PERIOD 8

//Setting up a clock period for AHB Master

`define ACLK_PERIOD 8

//Include SVA assertions

//Width of AHB data bus

`define AHB_DATA_WIDTH 32

//Width of AHB Address bus

`define AHB_ADDR_WIDTH 32

//Width of TX FIFO

`define TX_FIFO_WIDTH 32

//Width of RX FIFO

`define RX_FIFO_WIDTH 32

//Set SSIC_INDIVIDUAL

`define SSIC_INDIVIDUAL 0

//set SSIC_COMBINED

`define SSIC_COMBINED 1


`define SSIC_HAS_RX_SAMPLE_LOGIC


// `define SSIC_HAS_ADV_RX_SAMPLE_LOGIC


`define RX_SAMPLE_DUP_RS 8


// `define SSIC_HAS_RXDS_LOGIC

//Internal Define for 32 bit mode

`define SSIC_HAS_32_BIT_XFER_SIZE

//XTX FIFO read and write address width

`define XTX_ABW 2


`define DM_FIFO_W 4

//Internal Define for Data Frame Size (DFS) width

`define DFS_W 5

//Internal Define for dual/quad mode

`define SSIC_HAS_EXTD_SPI

//Internal Define for dual/quad mode

// `define SSIC_HAS_EXTD_SPI_SLV

//CTRLR0 Register width

`define CTRLR0_RS 20

//CTRLR0 Register check width

`define CTRLR0_REG_RES 20

//XIP CTRL Register width

`define XIP_CTRL_RS 19

//XIP CTRL Register width

`define XIP_WRITE_CTRL_RS 10

//Width of MWCR register

`define MWCR_RS 3

//Width of Safety Interrupt register

`define SAFETYINT_RS 13

//Width of Safety Control register

`define SAFETYCR_RS 13


// `define SSIC_HAS_TXUIS

// TX FIFO Underflow interrupt Index

`define TXUIS_INT_INDX 5

// AXI Error interrupt Index

`define AXIE_INT_INDX 5

// SPI Transmit Error interrupt Index

`define SPITE_INT_INDX 6

// SSI Done interrupt Index

`define SSIDONE_INT_INDX 8


// AXI FSM parity interrupt Index

`define AXIFSMP_INT_INDX 0

// AXI FSM timeout interrupt Index

`define AXIFSMT_INT_INDX 1

// AXI interface parity interrupt Index

`define AXIP_INT_INDX 5

//External RAM Address width, applicable only when SSIC_HAS_TX_RX_EN is set to 0.

`define SSIC_RAM_AW 5

//Receive data width of FIFO

`define RX_ABW 5


`define XRX_ABW 5

//Write data width of FIFO

`define TX_ABW 5

// Maximum AXI burst length value  

`define SSIC_AXI_BLW_VAL 16

//Log2 of maximum SSIC_NUM_SLAVES

`define LOG2_SSIC_NUM_SLAVES 1

//Address Slice LHS

`define SSIC_ADDR_SLICE_LHS 7

//Default Value of SCLK OUT.

`define SSIC_DFLT_SCLK_OUT 1'h0

//Default Value of SSIC_DFLT_SS_N

`define SSIC_DFLT_SS_N 1'h1

// Interrupt Defines

// `define SSIC_INDIVIDUAL_INTR

//Creates a define for enabling low power interface

`define SSIC_SCPH0_SSTOGGLE_IS_ONE

//Creates a define for enabling low power interface

`define SSIC_DFLT_TGL_EN 1'h1

//Internal define for SPI IO maping

`define SSIC_SPI_HAS_ENH_IO_MAP

//SPI Slave I/O width

`define SIOW 1

//SPI Master I/O width

`define MIOW 4

//SPI Interface I/O width

`define SERIOW 4

//SSI Has Quad Mode Enabled
`define SSIC_SPI_HAS_QUAD

//SSI Has Octal Mode Enabled

//SSI Slave Has Quad Mode Enabled

//SSI Slave Has Octal Mode Enabled

//SSI Slave Has Bridge Mode Enabled


`define SSIC_HAS_AHB_SLVIF

//Internal Define for APB Data Width 8

// `define APB_DATA_WIDTH_8

//Internal Define for APB Data Width 16

// `define APB_DATA_WIDTH_16

//Internal Define for APB Data Width 32

`define APB_DATA_WIDTH_32

//Creates a define for Master config

`define SSIC_MASTER_EN

//Creates a define for Master config

// `define SSIC_SLAVE_EN

//Creates a define for Master config

// `define SSIC_IS_MST_SLV

//Creates a define for DMA config

`define SSIC_DMA_EN

//Creates a define for Slave config

// `define INC_ENH_CLK_RATIO

//Creates a define synchronization type

`define BCM_SYNC_TYPE 2

//Creating define for ASYNC clock

`define SSIC_HAS_SYNC_CLK

//Creating define for ASYNC clock

`define SSIC_HAS_MHSYNC_CLK

//Creating define for ASYNC clock

// `define SSIC_HAS_ASYNC_CLK


`define SSIC_HAS_ASYNC_CLK_NDEF


// `define SSIC_INC_DTR


// `define SSIC_INC_RXDS


// `define SSIC_INC_SYNC_RX_RST


// `define SSIC_INC_RX_SYNC_RST


// `define SSIC_HAS_SPI_DM


`define SSIC_ERR_RESP_OR_XIP


`define SSIC_HAS_ERR_RESP


// `define SSIC_HAS_XIP


// `define SSIC_HAS_XIP_INST


// `define SSIC_HAS_XIP_WRITE


// `define SSIC_HAS_EXT_SSEL


// `define SSIC_HAS_XIP_WRITEREG


// `define SSIC_XIP_CONT_XFER


// `define SSIC_XIP_CONT_TO


// `define SSIC_INC_CONCURRENT_XIP


// `define SSIC_INC_XIP_PREFETCH


`define SSIC_INC_CLK_STRETCH


`define SSIC_INC_ALMOST_EMPTY_LOGIC


// `define SSIC_HAS_HYPERBUS


// `define SSIC_INC_BURST_INFO


// `define SSIC_INC_RXDS_OR_CONT_XFER


// `define SSIC_INC_EXT_RAM


// `define SSIC_INC_EXT_RAM_XIP


// `define SSIC_INC_SER_MUX


// `define SSIC_INC_EARLY_LOGIC


`define SSIC_INC_TX_RX_RAM


`define SSIC_INC_DYN_WS

//SPI_CTRLR0 Register width

`define SPI_CTRLR0_RS 15


`define XIP_DFS_HC_OFFSET 14


`define XIP_INST_EN_OFFSET 14


`define XIP_CONT_XFER_EN_OFFSET 14


`define SPI_DM_EN_OFFSET 14


`define SPI_RXDS_SIG_EN_OFFSET 14


`define SPI_MBL_OFFSET 14


`define SPI_XPRE_OFFSET 14


`define SPI_CLK_OFFSET 14


`define XIP_MBL_OFFSET 17

//32 bit Base Address for AHB Slave

`define AHB_SLV_BASE_ADDR 32'h0

`define SSIC_REG_DATA_WIDTH `AHB_DATA_WIDTH
`define PSTRB_WIDTH 3

// BCM Constants
`define DWC_NO_TST_MODE
`define DWC_NO_CDC_INIT
`define DWC_BCM06_NO_DIAG_N


// Name:         DWC_SYNCHRONIZER_TECH_MAP
// Default:      0
// Values:       0 1
// 
// If user have your own metastability hardened synchronizer registers, user can use them to replace the bcm21 synchronizer 
// registers by defining the DWC_SYNCHRONIZER_TECH_MAP. When DWC_SYNCHRONIZER_TECH_MAP is defined, the synchronizer 
// registers inside bcm21 are instantiations of: 
// -- DWbb_bcm98 (positive-edge triggered, one-stage register) 
// -- DWbb_bcm99 (two-stage register; both stages are positive-edge triggered) 
// -- DWbb_bcm99_n (two-stage register with negative-edge triggered first stage, positive-edge triggered second stage) 
// If DWC_SYNCHRONIZER_TECH_MAP is defined, you can replace these register BCMs with your own metastability hardened 
// registers by doing the following: 
// -- Modify the DWbb_bcm98, DWbb_bcm99, and DWbb_bcm99_n BCMs and drop instantiations of your registers inside them  
// For help with this, see the commented section "NOTE ABOUT TECHNOLOGY CELL MAPPING" in the DWbb_bcm98, DWbb_bcm99, and 
// DWbb_bcm99_n source files.
// `define DWC_SYNCHRONIZER_TECH_MAP

//Verification specific parameters


`define SSIC_S_2_H_VERIF_EN 1


`define SSIC_H_2_S_VERIF_EN 1


`define SSIC_S_2_MH_VERIF_EN 1


`define SSIC_MH_2_S_VERIF_EN 1


`define SSIC_H_2_MH_VERIF_EN 1


`define SSIC_MH_2_H_VERIF_EN 1


`define SSIC_H_2_A_VERIF_EN 1


`define SSIC_A_2_H_VERIF_EN 1


`define SSIC_S_2_A_VERIF_EN 1


// `define SSIC_HAS_AXI_DMA

//Width of Interrupt register

`define INT_RS 7

// TXFTHR Width 

`define TXFTHR_W 5


`define SSIC_AXI_INTF_AXI3


// `define SSIC_AXI_INTF_AXI4


// `define SSIC_AXI_DW64

// AXI Write strobe width

`define SSIC_AXI_WSW 4

// AXI lock width

`define SSIC_AXI_LTW 2


// Name:         SSIC_AXI_AW_IS_32
// Default:      1 ((SSIC_AXI_AW == 32) ? 1 : 0)
// Values:       0, 1
// 
// Address width for AXI Interface is equal to 32
`define SSIC_AXI_AW_IS_32


`define SSIC_AXI_ECC_MODE 1


// `define SSIC_HAS_SAFETY_PKG


// `define SSIC_HAS_ECC_ARC_PARITY


// `define SSIC_HAS_AXI_ECC

// ECC counter include

// `define DWC_HAS_ECC_DIAG_EN


// `define SSIC_HAS_ODD_PAR

// Parity generation for AXI Master interface

// `define SSIC_AXI_PAR_GENERATION

// AXI PYLD0_USER_WIDTH for ECC/Parity Module

`define AR_PYLD0_USER_WIDTH 4


`define AW_PYLD0_USER_WIDTH 4


`define W_PYLD0_USER_WIDTH 4


`define R_PYLD0_USER_WIDTH 4


`define B_PYLD0_USER_WIDTH 2

// AXI PYLD1_USER_WIDTH for ECC/Parity Module


`define AR_PYLD1_USER_WIDTH 4


`define AW_PYLD1_USER_WIDTH 4


`define W_PYLD1_USER_WIDTH 3


`define R_PYLD1_USER_WIDTH 2


// `define SSIC_AXI_IDW_IS_ONE

//  AXI Parity Read Data Width

`define SSIC_AXI_PAR_RW 48

//  AXI Read Data User Width

`define SSIC_AXI_RUW 6

//Number os zeros in AXI Parity Read Data MSB

`define SSIC_AXI_PAR_R0S 7


// `define SSIC_AXI_PAR_R0S_IS_ZERO

//  AXI Parity Write Response Width

`define SSIC_AXI_PAR_BW 8

// AXI Write Response User Width

`define SSIC_AXI_BUW 2

//  Number os zeros in AXI Parity Write Response MSB

`define SSIC_AXI_PAR_B0S 0


`define AXIDMACR_RS 17


`define SSIC_AXI_PAR_B0S_IS_ZERO

//   AXI Parity Write Address Width

`define SSIC_AXI_PAR_AWW 56

// AXI Write Address User Width

`define SSIC_AXI_AWUW 8

//  Number os zeros in AXI Parity Write Address MSB

`define SSIC_AXI_PAR_AW0S 0


`define SSIC_AXI_PAR_AW0S_IS_ZERO

//  AXI Parity Read Address Width

`define SSIC_AXI_PAR_ARW 56

//  AXI Read Address User Width

`define SSIC_AXI_ARUW 8

//  Number os zeros in AXI Parity Read Address MSB

`define SSIC_AXI_PAR_AR0S 0


`define SSIC_AXI_PAR_AR0S_IS_ZERO

//  AXI Parity Write Data Width

`define SSIC_AXI_PAR_WW 48

// AXI Write Data User Width

`define SSIC_AXI_WUW 7

//  Number os zeros in AXI Parity Write Data MSB

`define SSIC_AXI_PAR_W0S 5


// `define SSIC_AXI_PAR_W0S_IS_ZERO


// `define SSIC_FIFO_HAS_SCAN_MODE




//Control switch to enable ALT_SSI instantiation

`define USE_BACK2BACK_DUT 0

// This parameter is set if Alternate DUT mode is used

//Creates a define for SSI Clock Enable

// `define SSIC_CLK_EN

//Creates a define for Interrupt Polarity

`define SSIC_INTR_ACTIVE_HIGH

//Creates a define for Interrupt IO Mode

`define SSIC_INTR_COMB_EN

//Creates Define for the Slave 1

`define SSIC_SLAVE1

//Creates Define for the Slave 2

`define SSIC_SLAVE2

//Creates Define for the Slave 3

// `define SSIC_SLAVE3

//Creates Define for the Slave 4

// `define SSIC_SLAVE4

//Creates Define for the Slave 5

// `define SSIC_SLAVE5

//Creates Define for the Slave 6

// `define SSIC_SLAVE6

//Creates Define for the Slave 7

// `define SSIC_SLAVE7

//Creates Define for the Slave 8

// `define SSIC_SLAVE8

//Creates Define for the Slave 9

// `define SSIC_SLAVE9

//Creates Define for the Slave 10

// `define SSIC_SLAVE10

//Creates Define for the Slave 11

// `define SSIC_SLAVE11

//Creates Define for the Slave 12

// `define SSIC_SLAVE12

//Creates Define for the Slave 13

// `define SSIC_SLAVE13

//Creates Define for the Slave 14

// `define SSIC_SLAVE14

//Creates Define for the Slave 15

// `define SSIC_SLAVE15

//Creates Define for the Slave 16

// `define SSIC_SLAVE16


`define IFX_RULE_SETUP 0

//Random seed used in the testbench

`define SSIC_UVM_RAND_SEED 1


//Creates Define TX FIFO Underflow interrupt 

// ---------------------------------------------------------------------
// End Guard
// ---------------------------------------------------------------------
`endif
