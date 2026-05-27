
`ifndef GUARD_SVT_SPI_TRANSACTION_SEQUENCE_COLLECTION_SV
`define GUARD_SVT_SPI_TRANSACTION_SEQUENCE_COLLECTION_SV

// =============================================================================
/** 
 * svt_spi_transaction_base_sequence: This is the base class for svt_spi_transaction
 * sequences. All other svt_spi_transaction sequences are extended from this sequence.
 *
 * The base sequence takes care of managing objections if extended classes or sequence clients
 * set the #manage_objection bit to 1.
 */
class svt_spi_transaction_base_sequence extends svt_sequence#(svt_spi_transaction);

  /** 
   * Factory Registration. 
   */
  `svt_xvm_object_utils(svt_spi_transaction_base_sequence) 
 
  /** 
   * Parent Sequencer Declaration. 
   */
  `svt_xvm_declare_p_sequencer(svt_spi_transaction_sequencer) 

  /** 
   * Constructs a new svt_spi_transaction_base_sequence instance.
   * 
   * @param name Sequence instance name.
   */
  extern function new(string name="svt_spi_transaction_base_sequence");

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
h9pZBI5GM/fH50hGz49Ogci24rzYCAH8bRrmsSIECIC8SFDyYHYuw6aTS8iimzcP
PBn2QmXmlUhj2/Ope0a566DLTEqdr8U3ZBYJmN2XEfWR66N2qV/IKqEva5u1Uh34
50ZH+JvslmA2oTlffe/RSOpK6F84k0OqBgdXHr6YjjY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 367       )
WCVLDXV8JT0lDwAyqPb4PoMAv+o0m9oVZLTEI4fZEV/L18D7dRG3Q26CDXHnZ/Vl
+dGIMzCpf6XvI1dvHKZZe/30lyn3ypieA418kt+OZRWMbCraMmm77WstQEUCkhkW
aHUCecBFZPAp2gKonyy60mxrwb/A+VR8cUCc7vCOSqdpvbqwKVtqVp1tVcRz9/aN
OIhnzE7o4rpPCFYWQYr+unLtIvyWWQq/c7WyhBjVxViW4x87tLHD6+xpRkKgmsLf
nrUaDFwPR2JZ/ktbp9bToUR3gHRlM39U/BnWBnvK2fRUPm7HFi3S0Y8k9R3ekUWV
a0Zg9ZB9X7sXxvI4f7J2hqe7b7OFuujvVk2GDltfdnkZFTQVNwfrPxahObtl/hTz
YFaBlgu37cDkg3Rn9C7mkziz2R845I1PL/topqNYj19rWiX3zf/cd6c6uy65W4At
nQ4iuV7H6imTbzBOnHpazXPgmWhpZtvhh9pKUh6EU6A=
`pragma protect end_protected

// =============================================================================
/** 
 * svt_spi_transaction_random_sequence
 *
 * This sequence creates a random svt_spi_transaction request.
 */
class svt_spi_transaction_random_sequence extends svt_spi_transaction_base_sequence; 
  
  /** 
   * Factory Registration. 
   */
  `svt_xvm_object_utils(svt_spi_transaction_random_sequence) 
  
  /** Parameter that controls the number of svt_spi_transaction requests that will be generated */
  rand int unsigned sequence_length = 5;

  /** Constrain the sequence length to a reasonable value */
  constraint reasonable_sequence_length {
    sequence_length <= 10;
  }

  /**
   * Constructs the svt_spi_transaction_random_sequence sequence
   * @param name Sequence instance name.
   */
  extern function new(string name = "svt_spi_transaction_random_sequence");
  
  /** 
   * Executes the svt_spi_transaction_random_sequence sequence. 
   */
  extern virtual task body();

endclass

//------------------------------------------------------------------------------
function svt_spi_transaction_random_sequence::new(string name="svt_spi_transaction_random_sequence");
  super.new(name);
endfunction

//------------------------------------------------------------------------------
task svt_spi_transaction_random_sequence::body();
  svt_spi_transaction req;

  /** Get the user sequence_length. */
`ifdef SVT_UVM_TECHNOLOGY
  int status = uvm_config_db#(int unsigned)::get(m_sequencer, get_type_name(), "sequence_length", sequence_length);
`else
  int status = m_sequencer.get_config_int({get_type_name(), ".sequence_length"}, sequence_length);
`endif
  `svt_xvm_debug("body", $sformatf("sequence_length is %0d as a result of %0s.", sequence_length, status ? "the config DB" : "randomization"));

  repeat(sequence_length) begin
    `svt_xvm_create(req);
    `svt_xvm_rand_send(req)
  end
endtask

// =============================================================================
/** 
 * svt_spi_transaction_null_sequence
 *
 * This class creates a null sequence which can be associated with a sequencer but generates no traffic.
 */
class svt_spi_transaction_null_sequence extends svt_spi_transaction_base_sequence;

  /** 
   * Factory Registration. 
   */
  `svt_xvm_object_utils(svt_spi_transaction_null_sequence) 
  
  /**
   * Constructs the svt_spi_transaction_null_sequence sequence
   * @param name Sequence instance name.
   */
  extern function new(string name = "svt_spi_transaction_null_sequence");

  /** 
   * Executes svt_spi_transaction_null_sequence sequence. 
   */
  extern virtual task body();

endclass

// =============================================================================

//------------------------------------------------------------------------------
function svt_spi_transaction_null_sequence::new(string name="svt_spi_transaction_null_sequence");
  super.new(name);
endfunction

//------------------------------------------------------------------------------
task svt_spi_transaction_null_sequence:: body();
endtask

// =============================================================================

`endif // GUARD_SVT_SPI_TRANSACTION_SEQUENCE_COLLECTION_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZAROV4ScnEivBM6GWfwW3laWgYM8m48js/K0/rByeTq7BaneYCbcMpMDBxXIQgvd
zrlk8HqwdoYyb4+cVjEnUvfNOmgSfgIHfRrmzV8reaqy59I841VQfOP740b4JlyS
kLGOtFevy0wfdknKq6m1zVM9lRE36AyNiengpu6/8O8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 450       )
WE4+0/aVHdVMmDDt4noTgHtqu11BcY0ynNLtlw3YqSa9DdkF/qYTSVNrkzRZBezJ
nmyT55a4OJS7YUQYz0AE4r56WxMUZAYpN0gKdb04jcubgRg1IVKxdHQIe69aV2kz
`pragma protect end_protected
