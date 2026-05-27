
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
pQKxGpBv+1cNEEtTX6mHC8vt+EjV0bfKegWt8MnSGQpPhl7+n7J0VEZnQ3o90M9P
EcZUJUDlv60AseBC3VKq709+1Zas1vtluWIzY91H60TI+Sdltd4HlH2Iek9PVA0O
Gk3dBcVO3cbCnYKlOGfA2jqdh8f/1pHYZwZ3wUMcWkBzu3AC0itjbA==
//pragma protect end_key_block
//pragma protect digest_block
J7Ym5qXS8Fq0LktjetUCyopiChg=
//pragma protect end_digest_block
//pragma protect data_block
o37YkZrLFxDvKFoDdmX5H6UkK51BbOSzxQ8X+d/vDBh6Cr+5eLIV3LcWHQAkgVP+
GeG1EH/nbAiyzDSNP6mP7MTc+UwIYWQ08TwB5bm3uujndCn9xzvL5/qHv7854gE3
GHXPQo8JcqnblapHeqCkD2uMAqtmhafa0zH0/FWHbtnfPPYbEkjZX79i5teYGPdq
BYnDohEuxetHvVlbVblQO4ssEJVpM/Y+TjQO6dVPWBOz3Djh8da8C2b6UVMyvqVi
1l3wtLefrooV++nF/1n/pG4Ncd3lwgUAtE5LTKil+Uz7KgDZOySQLIDUr9+IIlZs
E9xmPQArtyPI5jvofSZnRNVzIQO0APsxtwR7kjkTMS77jQhrDX/u5K4dBnPObPgV
RjogdZYffwx+hQ6T/fMlbIr1vLeq9vIcGJXTiU+zfuE8n6CvtMd7/JqV9B4m8QJQ
xfg71xJr6jsDjE2sPJqjod/7kWCUrMH5snFUrhbdBuo/+0Ja1U4R5U4YmTtbszDd
Ih/t51U/1lKmvlgsJuS0b7o+QX0u6DygBH9nPrNTt4LF6teU8WWakh64Ai0MBTC/
4BLNp+8Uau6+iLWOzkBPr/dAjDhS+fSaAWcoE6r89eN4q7WnYdw2sf3AwMrx6WDG
NIJ4jFMi1lrEr9CVm0+tQl+DEcqddE+2qkDJI6hNTUe8Rge/rMLFrB9KdhVPp3Hu
Ba6JxQ81ElJiwVF0DTwmUw==
//pragma protect end_data_block
//pragma protect digest_block
dWhnXYOzTDFaVVW5DJyOnGM4VKY=
//pragma protect end_digest_block
//pragma protect end_protected

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

