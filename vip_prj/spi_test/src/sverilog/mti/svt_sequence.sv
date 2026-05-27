//=======================================================================
// COPYRIGHT (C) 2011-2022 SYNOPSYS INC.
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

`ifndef GUARD_SVT_SEQUENCE_SV
`define GUARD_SVT_SEQUENCE_SV

typedef class svt_sequence;

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT sequences.
 */
virtual class svt_sequence #(type REQ=`SVT_XVM(sequence_item),
                             type RSP=REQ) extends `SVT_XVM(sequence)#(REQ,RSP);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * A flag that enables automatic objection management.  If this is set to 1 in
   * an extended sequence class then an objection will be raised when the
   * pre_body() is called and dropped when the post_body() method is called.
   * Can be set explicitley or via a bit-type configuration entry named
   * "<seq-type-name>.manage_objection" or implicitly by setting the sequencer
   * manage_objection value to something other than the sequencer default value
   * of 1.
   *
   * For backwards compatibility reasons the sequence default value is '0' while
   * the sequencer default value is '1'. So by default the sequencer will manage
   * objections, but the sequence will not.
   *
   * This does not, however, reflect what happens if any client VIP or testbench
   * sets the manage_objection value on the sequence or the sequencer.
   *
   * If the manage_objection value is set locally, then it replaces the default.
   * It can, however, be overridden by configuration settings.
   *
   * If a manage_objection value is provided for the sequence in the configuration
   * then it will replace the locally specified value.
   *
   * If a manage_objection value is provided for the sequencer in the configuration
   * and there was not a manage_objection value provided for the sequence in the
   * configuration then the sequencer setting will replace the locally specified
   * value. 
   *
   * If a non-default value (i.e., 0) is set on the sequencer, it will be propagated
   * into the configuration to be accessed by the sequence. This will force the
   * manage_objection value of '0' for all svt_sequence sequences on the sequencer.
   * This will have no impact on sequences which have a manage_objection value
   * provided for them in the configuration, but should override the manage_objection
   * value in all other situations.
   */
  bit manage_objection = 0;

  /** All messages originating from data objects are routed through this reporter  */
  static `SVT_XVM(report_object) reporter = `SVT_XVM(root)::get();

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  /**
   * Identifies the product suite with which a derivative class is associated. Can be
   * accessed through 'get_suite_name()', but cannot be altered after object creation.
   */
/** @cond SV_ONLY */
  protected string  suite_name = "";
/** @endcond */

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Ygt7Rxk4BF2i000QBxcyarjOcDm/xMwVPLGUam6yx69+UFJI3+qxAcXhiZmLVgNV
UkosvqmnE4d30I8cq3k0q+krkwVIEZ9zCxBjumrwExU079vOzG4akNA5C+Cx/mz6
4Emkj92Ph2giws4tJl9cSOYToAhpn/+n5mQM06fInFU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 296       )
tmvm9s1fvf+dZCJ31P+WuIA8czbakGSqTjDWtBnIzY2jdk8sj9aeoI47YugYWi+J
gVzl3p1B81Inud9eURrTuF16wYTvoZESkwObbYA6/kPbJlMrXC9X+otnXwZ0yjr+
lMQuZNQKHmhl2RmfMWOQr+oJi3QuLshm9XlS+AXPAkpp6p7H+fIrkiSBwJEFem09
RL4CdK/lsQ9cAuhuhotHFF1lPK1E3uHiz7P6SkRy0MZTsi7M0AYBOiNGjwzqUYAG
7eB0CmbYmu+CSxHwldRMGoQo9sDmha+N2fSkCtEiqiA3oCLK9XaPpPjKyAEENkor
r9vfeZH5Xa6IzkVihqfzIuAPeYdTgSEvNNq5Ejnts5SELSPrBDPXLuxrciMnF/eS
x7UQHdZqfTu25X75L0bPFQ==
`pragma protect end_protected

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new SVT sequence object */
  extern function new (string name = "svt_sequence", string suite_name="");

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FwZcqdaWFAu9yvNqgiXMIWEVZmkAeau1lvZuhPDMSRMd/wnytPukKq/t0kyYyvkN
m2QPfXGLTyB4Rh8DI1wjKqSOdY5LXR481+9LzZhxQESeoAzvpjnBWELJOK5IgiD9
6G2u4VV5oKG+nSBwvuFRgV1OxafAEpb55mAj9UbGtPU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 699       )
62Mk19xAAy6KDtQGMiIur/BQQKugRYw+ucWBpqwgHF+fYP5pBQzkqwQ+OZ6b2+UR
rJzQoyZAW3XNxxz+X2WyC/C4pLWiBJg+lQPk41cqFPkSL5W9lnjhruHhU3CZwugn
0zL2eY5BpwSQ+jAOD2r9KsRG3HScgSVufB4ntUIO4MlU+ku3oSuJ29bZy4Pr7XkD
OLKJUc0yBYbmjbgyEPA8up1EngLNXs+yIfu9hz3VjWCV31Q/+S4Lm81ZNoF7I3S6
rECddSRP7uoYPCq6Io8thKAzMmWavKyGXKsnlAnQ+LeVh6hG0jg7mwLt7G0eiWSb
OIeAHfedjnusl3PhxFFxaTukEpuva6Twtt6MpOxFKKCHBZzNf55mHAk3JPWUUzPD
zYZjvzGD6EVGr9pO4S4uY5dhw+kCODcp5+2gE54kBBaEpCfXU6Xm/kKjuzaCi4AB
opZ8D0wkqHgDHDqzudnrM7zQbO10RrSxKFKRyEdS6pq7m4UbjV+W5FPQJBQ3Bpwt
3yjRSp7GxmMzIIfW3sLt7pFrE8Alj2xp2HSMLAIhPqE=
`pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
P4Tam7x+6SxQRPONURLB8PLmk4hXoAT5FG5hM3YEjVOI6+tsfpBLViO7PC6A6PUa
PUAk9gt8wTCnlum9zXWDNL9/vQZxVaEt93dfZP3YfOq2kuY6qMe1huWGlJX0qtyc
+H/t3H2W+XeWYx1jQTZLhBQe0aomUKlcBhfd4QUpmM8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1067      )
ODvS/RRC074+AmIaZSCFotRWxJ0f40WdtYSIYQAWwNNrAB1vDuVFN9DqtPA83fWe
KVgl1HqjFTHfCpp5QmFtO5MGoxxvqDWc96jntYfVg99xfeGICkumyXqA85NyVA9b
VNfLIBMucnZTAgh0YItNBU1vIIzoRUyVtmxm3ZXxZ3b/0yHz/t7elYsAQDCJUa4r
Pxwz27lw0qrm3d11idMgLnnC8Py2zDRuewtTBTLrsTYmriGbhGVjvkyMobM86ooN
/Zep/W7op3VtkfxamZbkwZ448OOlcLMiE6PrOWnj9kYfMtmK1f6nGNBM6jDzult7
bNu/O/ZpN7evxhrJnFI0AQQGF/F7nzPmmXuFbDGJ0hiLZKr9V7E7edZqVwez/D96
pQXe0LXeLELQoH5qOeUI22u86C/BI0+Bu5eBr/ifAMC/zdaYX9HL/UPwZMDPpAmT
VBCk5b+svG9EGE30s1V10JrQC7lF4/DNukFyrIbjofAbQv66DNo4DBUtgRAWR4A3
`pragma protect end_protected
  
  // ---------------------------------------------------------------------------
  /**
   * Returns the phase name that this sequence is executing in. If the sequence
   * is not configured as the default sequence for a phase then this method
   * returns a null string.  This can be used to retrieve information from the
   * configuration database like this:
   * 
   * void'(`SVT_XVM(config_db) #(int unsigned)::get(m_sequencer, 
   *                                          get_phase_name(),
   *                                          "default_sequence.sequence_length",
   *                                          sequence_length));
   * 
   */
  extern function string get_phase_name();

  // ---------------------------------------------------------------------------
  /**
   * Raise the objection for the current run-time phase
   */
  extern function void raise_phase_objection();

  // ---------------------------------------------------------------------------
  /**
   * Drop the previously-raised objection for the run-time phase
   */
  extern function void drop_phase_objection();

  // ---------------------------------------------------------------------------
  /** callback implementation to raise an objection */
  extern virtual task pre_body();

  // ---------------------------------------------------------------------------
  /** callback implementation to drop an objection */
  extern virtual task post_body();

//svt_vipdk_exclude
/** @cond PRIVATE */
  // ---------------------------------------------------------------------------
  /**
   * DEPRECATED METHOD - Clients should implement/utilize 'is_supported'.
   * Determines if this sequence can reasonably be expected to function correctly
   * on the supplied cfg object.
   * 
   * @param cfg The svt_configuration to examine for applicability.
   * @return Returns '1' if sequence is applicable, '0' otherwise.
   */
  extern virtual function bit is_applicable(svt_configuration cfg);
/** @endcond */
//svt_vipdk_end_exclude

`ifdef SVT_UVM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Obtains the starting_phase property from the uvm_sequence_base class.
   */
  extern function uvm_phase svt_get_starting_phase();
`endif
    
  // ---------------------------------------------------------------------------
  /**
   * Determines if this sequence can reasonably be expected to function correctly
   * on the supplied cfg object.
   * 
   * @param cfg The svt_configuration to examine for supportability.
   * @param silent Indicates whether issues with the configuration should be reported.
   *
   * @return Returns '1' if sequence is supported by the configuration, '0' otherwise.
   */
  extern virtual function bit is_supported(svt_configuration cfg, bit silent = 0);

`ifdef SVT_UVM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Utility method to get the do_not_randomize value for the sequence.
   *
   * @return The current do_not_randomize setting.
   */
  extern virtual function bit get_do_not_randomize();
`endif

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Utility method used to start a sequence based on the provided priority.
   *
   * @param parent_sequence Containing sequence which is executing this sequence.
   * @param set_priority The priority provided to the sequencer for this sequence.
   */
  extern virtual task priority_start(`SVT_XVM(sequence_base) parent_sequence = null, int set_priority = -1);

  // ---------------------------------------------------------------------------
  /**
   * Utility method used to finish a sequence based on the provided priority.
   *
   * @param parent_sequence Containing sequence which is executing this sequence.
   * @param set_priority The priority provided to the sequencer for this sequence.
   */
  extern virtual task priority_finish(`SVT_XVM(sequence_base) parent_sequence = null, int set_priority = -1);
`endif

  // =============================================================================

`ifdef SVT_OVM_TECHNOLOGY
  local ovm_objection m_raised;
`endif
endclass


`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dBQhjiDXF+8sU+ajpTmd0ukWYflSHxiLedRjdZh6Vf6EXugQ8DBzwMPkVeeYtmPk
gObmm18db4Q8gGasschfWb3xHbOVnlyT496142AqDzKBK0SgPjcwSo9TnrovLAd6
w6pKexHq6I8QjfZkTr2uPS+wtWEvREweIGGjU0m1/G4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2194      )
1T9q3q6zUmGDNY9jr5Z+2TMSLYdrdx4kxQ58SUp8o+q/Jqi09TzpqIE8oe/s0vmP
wllEXOvqzQ+16lfmQlqEUpuhSXUfMT+JguHYiJ5tDtB2KX+42ly3auiU4X28Mrod
hMWN/awYA1pERnNGaZS7PRjybCyJEFdCc7/uU3DXn76SuZ5AWWfhLQiqoGrKroo1
1OdW5NrcVYEMdIZHXEcaTqlA1WR/9QWMcXAZYHSYKFkoAU+mwYhocJuLe0E95KlU
PrESTWmQ1F7MsX4Zkxo6fY2YEd6CpNzHarABHC1ToGf5kwGDY5bnUX0Mer+Xuyh/
+rGD2a7BetOoIJ2e2mQ69ze4qbQOTMfsngz7zk3BZurJXt2BVbFvP+Bj9HJG1LnX
IgbN0lUhvy9pKmihwljK7MUZ6m9RZSQ6RmQZZIZdoeFtZp+xq3SBsn4XkyXrzCmR
OazmnPB8tK3Kw8OQW/lx+42CIXBEPIESLE8LRM+itfoOXwZ6L9/0U576tfY5OGjX
qDEAL5WImYIL2/rlygdsd0ORqnYdhDBJ6ZA7XmyIx9x/eJURFYcnAJwO7I2mTNh3
hugmQPSKs0Olcbqc+84HdNJYJCn/NAi8Jqk2/a4STd85luMmBLH5B+wfr2hpg8ii
72vk6T7Reo63Jg32GWiD/8ZNlPzqhuw1N1E5ZyPRcHVcfyH0ovHDBqvaaLiip54t
VdRRepc4v11m9Xi9tt4tzqEhbJLAaGZ1rXGEbqux6jzqySMa3EcQVgUdyCIMa6kB
5sQPmk1I+XonYEYAiehFZCE1lrp6lHqucIeJ3Cq1tw+PExkWDWl7SvCSlOVDSibJ
HvD4cjhUh838HZQLn9+i0/2q65OXO9nkD/Io10g623eVZycEsm1vFw22VvHQynVb
BZNos3NhhReewLnBGNLTPSHnQCECqUTf9UK8mBdakvcxMO4KG9GYrAZ9bCaccFPy
VQ63BJX5jRSMxOtGvGXZPcgvvkyIPAVkCLnT/mXVVpXyj+FJ23DxPOziJZYWkD0Z
0sYrMllKoCgbTzjVJjngGCBj6UErOix460qdKh/QbX5iclij9Jk1+BKZOcidnU+c
/CdgWA0D2kVnqvkUXMR7sJjIBes7mqMeFNJUM9KFCi8TbRWxFymBLMiYYZXyAezf
OnDWqWXdK+q1wtqS4DZ6PzhLnHXAKx8GE71YvRMwcGFJZLlnx8FdR8SOTYcJgSl6
KDCJRYd6JRyvDOty5/Pm7vSYQVhWkMLM8Oz9GAzmds0rR0eKXuu3OqQFRQH+px73
3RhwRIwYtqL8TwJVQsc+x++VhAD0lBhjD3pXxZKdtJmozz0YASsrNqw+6I8OciRo
cNtduEX+40H2ZI3Y1rUjFWkrKyStfMAGBVBvADvUMg64amuf0m+a3WRdDRKJ01qT
J0kc4IMsstoqHeRQ83j1GF/WMGTcjZhmoN05OFH60FC3A6lqg5iRXvi0QQ7Nq9Jp
ladkDyxFtipKWGWX2c2/AKOcSRwaBVBvUol6Cxxiqn0=
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
jtP7k+VS+HVBrPV0W9m80lylOlsTXIJnSuGRVUu5K8lDmaUgNwrbDkNNTH+C0FIY
uHaP/6T5t7EeV3fF325glGGQXWjI6vUQPasQkv9YBNZASi1PLYaL0zcs0TsTWrd3
JA61A2tjNDNsizbvs5zq8bafhlIURLgEh1XhegobWhY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7241      )
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
t7FOFlp2lFXbQ4UxYNJrMA==
`pragma protect end_protected

`endif // GUARD_SVT_SEQUENCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
K99UKb6GW16FG2V2bMxS9EuhS+x3mJbtx7AAuMDT4f9+xwYNLmrkoNWGMxyn9qMy
DChz0BLpTurPFtt2K1GIf4EcXuFVhDpEsM2bFbHclzme2y/+Rq5OzkABbKffdos/
DYWp/Pw6MMBPZ9fwmwCcIxFpxQrsCWSBTLyq0t4t+VA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7324      )
u1PnFmaz7JyXMqcxHmDNv3HI1Ig3z/mm0OXPExOp124bGT48ggd0vRWjdE7ZfxLO
QttVzMJqiMQN1ueMqrMLY7DZiFeMWiMIdeVl78uUpIlpiBMHfaqAvyNb0lCZ7pY/
`pragma protect end_protected
