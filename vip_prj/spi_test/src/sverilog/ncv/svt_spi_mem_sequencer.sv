
`ifndef GUARD_SVT_SPI_MEM_SEQUENCER_SV
`define GUARD_SVT_SPI_MEM_SEQUENCER_SV

// =============================================================================
/**
 * This class drives the memory sequences in to driver.
 * This is extended from svt_mem_sequencer
 */
class svt_spi_mem_sequencer extends svt_mem_sequencer;

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

/** @cond PRIVATE */
  
  
  
  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************


/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
  `svt_xvm_component_utils(svt_spi_mem_sequencer)

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this instance.  Used to construct
   * the hierarchy.
   */
  extern function new(string name = "svt_spi_mem_sequencer", `SVT_XVM(component) parent = null);
  
  //----------------------------------------------------------------------------
  /** Build Phase to build and configure sub-components */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void build();
`endif

endclass

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
74A+kp4b2ZmVDc+risKKnXkkxZMOBBRTY9wgStfAZVnIbiEl3F8hHs1thoiRgB54
3W9b8OVzclJxqxfHgCT0RFNJYP6ls1VzrgDSutLxvpUDJw0nnPS2g96H8FVeLERi
NBBq+Cjie5ECTh9FZWl1QyguB1z62+QvyUcGX5fFJUMbbFAMMthtUw==
//pragma protect end_key_block
//pragma protect digest_block
g73yVtsYPm7grnnTfGVebdXe/Uc=
//pragma protect end_digest_block
//pragma protect data_block
8hh3nD44Y34wuM0X/f+WWCkv+iI9WUojBgnZmw7PqeduL75m4P9zlk1t0rrrXWun
aXVi/8dmifxBbCsNfmVT+kdm5SYpv96NRSrQ8M5YIdgchKTa+uhjM2eov5XvhsJn
YQPRZVKDPYZHcF0asUx2qauf3sGs0ylaYZi9xZtN2VEVmtHI3ph2fZqzGN8TbprU
1OV1OgYEdCWoyvu42KNvu8ejyO9JhoV1YuT0Z906zBBFZIdKpaCKatSRWgSjp1Pd
qDBJ1Lfe4TMj1Q6Nx5oGBZg/sht/Kn5LK4HAd5hdSbzkkCZblxlEnl5+aWpj3kJ8
Mwen6RGuiCD9N9mVsXol/ojJkVg29eMz+LRysWgugG7XA0+VL0OenXvJWoQwRucd
kDg0U8k1LJXJvmRDdOvJ2uWdE0B2+nVMKRprFIa9Lp5BBMNpjrHHFJ1ByBMZDPnP
0zXrkXFSl6ybG+8n8k+8uDhFaPwINRWrQRKPcGOVui1ObVsnfRJbKoHkU3Yj6ynl
uNDPw1EI9WlGU4cCK4XqZIVuo8aOR8dNty8xrClxOLfLvIU6H91mtqul/cGGKI4t
V8XvMwcXd3XUyHm9MQlDi0n83l2bnL4FHmBT3hsRJa/XA0hSaCR/NPg6NTxXmgD9
MD9T41+GTAKJET/Hdzga7E3/iuwyl2mMfxsEzledOZ8jYEFpnTj92UCEm6xP4kXj

//pragma protect end_data_block
//pragma protect digest_block
rdRSYxF+IV5UHAjwenYIPtfMAYs=
//pragma protect end_digest_block
//pragma protect end_protected

// -----------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
function void svt_spi_mem_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
`elsif SVT_OVM_TECHNOLOGY
function void svt_spi_mem_sequencer::build();
  super.build();
`endif

endfunction

`endif // GUARD_SVT_SPI_MEM_SEQUENCER_SV

