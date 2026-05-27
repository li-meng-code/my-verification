//=======================================================================
// COPYRIGHT (C) 2016-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_GPIO_SEQUENCER_SV
`define GUARD_SVT_GPIO_SEQUENCER_SV

// =============================================================================
class svt_gpio_sequencer extends svt_sequencer#(svt_gpio_transaction);

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
  `svt_xvm_component_utils(svt_gpio_sequencer)

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
zaPYo1EqtnXdxIS02NYCBftDvT8zUxo8FAWuUnu7tVVqKxEePWu8HjiPTOKoxeVA
hXqkeIpRlYQXKjDllK0pOCGib9Yen8VKq0GA5Xi9IUYL7zYU63llud3omzpWL2jk
z4sEoj1BZZgRbu+y02NSIfnKgppkhdbkPHgvHAAeINTex/9HM1c4zg==
//pragma protect end_key_block
//pragma protect digest_block
fULGWho5Pfb9FED1YNI5MK899hc=
//pragma protect end_digest_block
//pragma protect data_block
kRXRalY7lLRloTx3zh9e006vbCfIHx5vFNF6lbHHc0MvtlDfJYwrH4bHedsUKMVN
ha0VWqTIi3sdvkOomymds7mkVxZyx/NgY73yAiIjIi2YkiM5HJKIGBjoiD/M2rix
9jfn4wsKChOzqovc9opBJHOswBTvnI/39MHAO/owYVEzVwm41vdPez7/G9MwfXcV
Lo7cpRkdAivDqi9OYS8k3vZhZC375eBsFz6aAA4ULXEVXmAzRYo4CBeoG1xM6rz3
Ed17bkCGar/Sv3DiSopkdgqt61qkBw95PB7qBWyDUBPWL7C762Ul0kFyMYxaHiWc
WRuaWPwQWn0I1j/PD3H9qBj0ncDl3VScbQqfmM1VdFn5RHtS5secan1QtqDh7N05
EiyBxeSB3OCXqpyx9ey9U4j8N5cwzO8EYNjWPe/unWnQgdMtNaMt7sxJCgdXQ42T
u8Nd+QM+B7H7MNym5US3G0aAvRgrRui8yW49dZPjNNVFKQZgo4sUawGTp2gee6LG
N2J7eAm8hzrX6x08V+PlvoNpww6uF73pKZd0A/ldXyZVvGaPTuP83YOxlVzfjNY2
cDAYQJHRJh6/g2kbcmWuaOG+dtmZWlj0DFETJfrNwf4+DTrP78LZhjbLXx2AxzdG
DocMPYtQPjWqKiG+cx+M2kgNOpUHpIMdcQhVaW032sJgB4S2EvQOpOss1LaoHU9X
M/auzqdMORWOM3h49FL7wOAbyOzmdzQCrkLmMpWReZxfpAP1UAgHm2xuEQ4vJUI7
SZtsKWezgy69k2ZXLm9yAWfIJqGcL1fNlRIbC/u7AhEtRAvigoUvEdKuBMJsuPzp
WqYLSmLcXZgZwPgXpJ9leB6RE71FPyVCIi6NrkuG+dg93iIIR1c79ydXQURJIzsI
TSV1c5KRiiW6aGYCyf/pNsiyWh2Fu76Ty65o/iyHDz3Hi1Cqt4D1EukRzeUouj1m
n+gMXu0uqTBkiXJavpSylwnrok20OUXTCjg7hJQeuKVkebVKxLB/TpqOZ0cdXfCd

//pragma protect end_data_block
//pragma protect digest_block
8k7YBU6j89qLiXUu8A2VYhc7hRg=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance
   * 
   * @param name The name of this instance.  Used to construct the hierarchy.
   * 
   * @param parent The component that contains this instance.  Used to construct
   * the hierarchy.
   */
  extern function new(string name = "svt_gpio_sequencer", `SVT_XVM(component) parent = null);

endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
kx4NaDHmZv/5H6uRgvqsfsKx6MKe9JCuE9R2URparCTupd/WEd5yOrK6RnUGa3OW
8AsUBJB2MHEXIuqwXNfN0iG02c7Kjlrjk48t1/WTw2scNMI0zrvUjsazZF976atP
28v6/PmzPcFk/ZT6GEsibRTVWlKIAWmfPFiJSFhYD4gYvTuOc/DGOg==
//pragma protect end_key_block
//pragma protect digest_block
XyK+xiPxAbx3Nyu7bjXtJKaankY=
//pragma protect end_digest_block
//pragma protect data_block
QScfQqmCFNNNSB3mCgqDQfD6xKiDUXAxpQP6Wq1fTHLgKgYByfwzqlOWml5dNWlH
qbKig/XVdu2+/6q2WmzANs+qx31Jwp+UymV49cqkqtiJSY8OwM/SxOaFot+XwO0X
j1O+Fl09f4LJ7xLe+v60JRFZ5/qoeDm1xhgvkvH90V7Mq2vYP1UUhGGA5nRKCj3M
YheUuGATvF0wEn+eUfA3MKLuqgeC6Kf5xQEdNCyxtB+aaTcIepCI7ERPN2bPlFd4
xMjDmMb0QC2FeBw6LRaLBSXBZdPMQj3RByE5eMK0VH+Gk4aiQsfexEa6dQdCkt1S
yLrDz0w0xfYzekhmnhtnoryDW5ZhAxIJd2sxYqJSaz+pChPleiq1mrkD46Vbsfe6
ewpvXE5rdNTVdkdV4eYYlLnDX2XN7gaNsxxf+0hKrq7CmUIe6uybo4T+FfKnmUdr
dYrAcDWJP/NreBk84SqjSwTU+CFaJycHLoanQnfLVLqnv+XuEmWqcOkAi7TNTVkc
sxpnDT8JbtI71PfGou4KFLIZe0994g4fOJr/mmTlZzC1WBQLtc+VCA/AhFctzepW
g9HOXR8/hIaU/qhrRWtkvnB7iG62QVhLLeQP0JdSFeX7UK0929kb9MToHdHxJtPT
08oDeCfgUlLM30HTmqtrEDwuNK+70rneks0g3KEaiud+1qOe0kgFhsQtwZra+LXq
V3MwSmd3ZQkX75qRZMJtGg3W+EewXaBssdbz/7IT2XMUMeqWiZZZsm4OkRpfiTKT
X16OD4v6Oj2jgoHIdIFapS/aqQlz6StZjCXnmZofWSvFSBr+XTPSHIsmFEKo2xOD
INBXDdfVjcaI/MVjdXz/cLdRY4FD43IxIeiAHT2zCPymqVOs+DwF2AqViKeBiu+G
raIbYMvMQax+s1G1494czfWipB0nVpmAGXdNerk6gKtByU1s/N2vEyRgZn5zF6jV
v4JQO8QkrbStB/8t2glC8W6EJEW9ybq3nlZAqhNpNeIpsT2N7OP3mSFu1ZQ8YuKJ
96lfPtraVvwcNWkuxBsqGWI+aj0EwPLqpxID9HfpFeZbpxjInMuPgN6HJQTEUI4t
eebn1WK+oDbtnkFAIZCsODZxpj/1FDS2ILUn3xdJl84ZzQQvIo0vJ1AMLJ3rozyh
mnnzERvn5aLLE4LtTNNJEsL3Z+PBaFyFcLvPO8uAVa9s5LFu87eGeneMcOqyMcw1
M20LfRXjQTcFxHXVv89vtw==
//pragma protect end_data_block
//pragma protect digest_block
CwQOwSF87WTy92DDsYdJmuY/cvk=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_SEQUENCER_SV

