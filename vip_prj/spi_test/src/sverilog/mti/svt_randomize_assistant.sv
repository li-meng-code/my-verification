//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_RANDOMIZE_ASSISTANT_SV
`define GUARD_SVT_RANDOMIZE_ASSISTANT_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

// =============================================================================
/**
 * This class provides randomization capabilities for properties that the
 * SystemVerilog language does not currently support.
 * 
 * This class currently supports the following properties:
 * 
 * - real values distributed within a provided range.  The value returned
 *   from the call to get_rand_range_real() is controlled by the 
 * .
 */
class svt_randomize_assistant;

  /** Singleton instance */
  local static svt_randomize_assistant singleton;

`ifdef SVT_VMM_TECHNOLOGY
  /** VMM log instance */
  static vmm_log log = new("svt_randomize_assistant", "VMM Log Object");
`else
  /** UVM Reporter instance */
  static `SVT_XVM(report_object) reporter = `SVT_XVM(root)::get();
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HRJPSTZjkxGc9OidTn1ht6rARuag6/mElw8kzwA09D8ur+rWfUkU0+SrrwG8BUo2
zcCkkWrR8G7HJ+bOgSfFKUQGtAHu0KTh9O8UR/xFnwQGmCE5/u8BFjp3qrbQVj6b
N9xJydAgHVDBOMqV3adv8izFpW23HsdgIPpd+M7QXgA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 751       )
9zPLlnnWtyhjWwkOLHucJ8GNWD1c0FF0Ixpw5+Ykq2CTrSG/CmO2wND/P2AyixaV
eTMQHIzeQnoeLMaPips3/Gv8j9Da0HxxPz3TIeI3O7CvOgjzpziupEWmvMJAdHi6
2ZpR1POFzXTUoXI8iTQiodT/fUpb90DZDSjhPdUF7L3REBtnTzBb34lJHwKu0sIc
ju4OCEBoAp1rqq/sCPUbIzn+yHyhgOeODzoMT9+iU6uuboTy7vH/3qeCmaW0VteU
v09akXEcW1pC+XKMNWnvB8EmGoarrtlcHYOmkas8zz140ZhMLiC/FxB+tYmurKz/
CMqnXNoHmO1azbCwLR2Hie2jmpMF9KfN1PHxvyYcbxN8UI7cBkwLc1OsgtuaYesV
3pxDi43xQ22C209O0Yk8rvL/JSIzwYRvFLIppZ9F1f+7UXxlTXCVchCuy5kV/Wio
KJYvWEYwzmR+3Mi03MiSuKFh20l689SLnumTqeMrTkDep7rcnmwkOwlRNgdHHFgR
S5kKfLhmcWj938lFnWd1U09F3s+7DS9urUlCWULM7Oul1QjwvDNR/3FeU1KdBoec
sd8ZfSWv4lomfNBPQFyWu5Rl6tJEu8nArvo/RcEQHbQeq6peb4Artj7UHFndz+5/
E6YGYBfd1wp1TwB2NQIEhRAOoh5sSIdlmPehGjhknsYCnyA2ObPckSa9yje4fTOr
IONsfuajpt0E7WcK1gBZONTd72oazlF5Wz8h31sWVyKW4AR04dIEx+j7u55Pi8vh
oXHqRMhsW0m/DNo/m6tZ+y1saz32YDMR4O7D+/LSshullJkT5YsNbSo91GrmYteP
dLrSa/wl8KtLi1y8CvOKVAY/BRJSEFX88oyM09tQ5LM4l2c8VbnmZLg/QfXDP8W0
wv5zQOBaEmbI7bjrXdwAUjNFBZPYPZMYWzQSHfQ500SBGZZ6EZXwotTenHXAmKH3
vX+Bbjum76q08KVzNiJmdRMQhsEqwBRe3FmU473QAi4=
`pragma protect end_protected

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** Constructor */
  extern /** local **/ function new();

  /** Singleton accessor method */
  extern static function svt_randomize_assistant get();

  //----------------------------------------------------------------------------
  /**
   * Sets the distribution control for this class.  These values are used by the
   * get_rand_range_real() method.
   * 
   * @param max Percent chance that the returned value will result in the maximum value
   * 
   * @param min Percent chance that the returned value will result in the minimum value
   * 
   * @param mid Percent chance that the returned value will result in a value that is
   * in the approximate midpoint between the min and max value.
   */
  extern function void set_range_weight(int unsigned max = 33, int unsigned min = 33, int unsigned mid = 25);

  //----------------------------------------------------------------------------
  /**
   * Returns a 'real' value that falls between the provided values.  The weightings
   * applied to the returned value can be set using set_range_weight().
   * 
   * @param min_value Lower bound for the range
   * 
   * @param max_value Upper bound for the range
   */
  extern function real get_rand_range_real(real min_value, real max_value);

endclass: svt_randomize_assistant

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
B1p152sl/BqHFpDqoEL2o+pf4VFQkptuBlOUbMt87MW5jgeAjHCfd9J9QpusLhhk
Ne5Db8DRHfgZuFFFcyXovXPdMLFUpK15QeDyTyCOjmgPyOHXGl0w1tkrMBFviscs
Jz8158zxmAIzlmT6rD8prsIyHnsHiCUyIgR6Fu9HRb4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2253      )
I5kbj/e25M3d8q3l0liQ72zMt7MoPchYCfPZvE2mB2XOOvGicYdl5W1DtXYZCm/w
6jZYl0xNr2iE+WNRtjEWPPf06urL/IZ3ovoElfc/Yel4n4MKEBDqIh1a4fJc1bo2
xA8xacoKRx1PzAdx63VLhAHmQ8rB48D4AnN/ozGWrQ8/COA+WGuGHDGDEzFmLX+t
jtTygR59G1T8xDkRczY+mjXStGWirXmf0bxXjmqCwhP5F8XTbUXzcHWAHLzCavJp
U1rx5XVAttIHI7Fw3nHyLA/p78KdpoViZiDKf+wPbI3ikQ0q02aCMMKf8JGGQS2h
X5D3im5F1LZjU5rS8rdhOignmYnIIxma3wJgXnXZ+iCzEMDkRHpej46FD4cPa/Kc
dQiGFDZ2j30fNHalUuKTSoD0awM/vP589VPJyt6SGnZP4GGp8blzvYVMCdKrwSWU
cgyjejb1oUVMuTEQviMpChhAeLWu54CFs5I9PFfwTChyAl+5JgDq83XOP1/MukhF
9OwUeVIass7BleB6sQ9M/a+i/apkgWpr3HpfGqfjsdv854E8kkFRmI9T2VD6U40X
250pRPGSmZIjYmBlJigfkJij9D0xwOvVpP72KdJmJEmk8pgEfinA0rEt33fGUDrM
rVBRP9/x6+kkUYeXZom0SX1lym0DHxFnxSI0Aw43EQCyXyQy5MLBHwpYCN90kdqa
SmwheOch4XlYmbhiGgZC5dCznqRr8eJZzIic6bywpwexZQ1/9I7BJYxpeCnBoov5
FINLChOEMjusFCaxJv+g8SVRRwVmZ/RpM2ZAHBHbJgk7sTi0PgBaCYIB5crg/Cje
PMrspftsnTObe3GR0eyFbck0T0sD12YZ1BKi8ctmBwlvS1gcZZMZ9KrOgEzcuwbh
AzXVXP8JXfWqBfkO5LRgn+ddg2g5dWUHxJV2ynyvURmnVAMEQ4mMVVnQLvnLAweJ
Wa5CyjPUYpu7pYN7Hixr2t7uyw+zRy8mp/FymnuNoV/FPzqhF7SdTOVSBti2y0lq
pyeZLgQNrn93tRFpkaG7Yi2Bx8lJ2GzZYg5fADP+ulQGPqLrWEBY9dsJTftGWoUI
wiZEXahepTj97wnVH1fJbr1duXnCzXSAD7/wz+2cG9siD4jZaUvavBsc1UXgTRW0
i87k3dc7krMIbQLyWjgpo91q+ZkpkOLeHHltnahO3iCUEvFgYDCLJikfAxWDDtlj
L9QLv4i7IooX5rynvsrU0Af2agj9j/Y0BdZkBSebBufdY0HkI5elG3sBNBEjSLIy
CpjQABJga3/fVh03h3QtbIe060YuIcdvI91Of0yVvzq4x7EamHMAdw/K6Of5P5b1
22aIzVyZ8/EuQREmenjoRiNfKUbVxxmCnIzJbphhDRi8Wajzo3OGTTBEDxa4YoxH
QxPFc7EU9RhjPdZ/ai+ZmWUJhTE0UVuzJGq9qnHEVbwltvXAW5WXYPgTKpSiGF6k
p+TcGA6BGfGLkoRyMhY/c3+bJz8lGl1UVvShXDVt4NBSH1k6rz6k7RZREMxYQURq
Phhp+ER+RD7hITQ61x+r31cvhbXdh2C3F8Fl6lfAFCWMC45lv0C1Hzk+qzIVJy4G
k0WNaHobxdX86xkqXy5YGzRLYwSNpzy5A9GALuwJ8eqydU3VEIN6omvnY9nbIIod
PQ6ZHX3xHT2AGkCDCJ0k23W/uYEixlDnEifaLqEfo+5A7bYJ6DNHjp5Y7c9W1MjV
e26Ykcebcc9cABXvt+l+gjLn1ezwS6gr8TFULdClRo+9G7nPZYS+rMxTl/CGUw7d
AAQqpuZ/XWwXQ/VnFifm69FJNCDSk0EagjtTrIxIi4Ewd7esFnYLxIm8Pt3g9RAg
dPqYrznjcu7+AmBEH5BfFS+ApU7vMOsF1dlokXRcFSANE+h2pT5qbDR4o8uADhKO
p3CbaD23cStGOVqHY03ro5yAZ69AMOg5ytOmZ3cWJd93h5+ZUkyz6uo6CVw+2mX/
UuUu90BsPSCyPykFpglSeA==
`pragma protect end_protected

`endif // GUARD_SVT_RANDOMIZE_ASSISTANT_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Us/RDyVwo0DO+dwrtnaYNaI58HpGDfGEPt6OAEYoSXyWRsUi3LbZ8xkyosirGtMH
5bMI01iOuEs3xgkPH5Ph0kvm3bUk/IaYg9rYKFNnOPkUT2xA0vBghyhcNeGYS/Il
Rz1k3ZCg4C3fj1z462Sd8zjfWwAYDjU1pFgXCWj9Gm8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2336      )
ooBMZbzGYhWpRAMm360FG81C28FrE8OEtclZofXl2ArA+0pBpUsMN606SArP8W7T
6GjLV3ul5/3L24iR626shqCw/ltMyutfx2aY47GcJVOsLWkIKX/6UEFQaonPjlfv
`pragma protect end_protected
