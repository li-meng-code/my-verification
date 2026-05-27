//=======================================================================
// COPYRIGHT (C) 2010-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MEM_WORD_SV
`define GUARD_SVT_MEM_WORD_SV

// ======================================================================
/**
 * This class is used to represent a single word of data stored in memory.
 * It is intended to be used to create a sparse array of stored memory data,
 * with each element of the array representing a full data word in memory.
 * The object is initilized with, and stores the information about
 * the location (address space, and byte address) of the location
 * represented. It supports read and write (with byte enables)
 * operations, as well as lock/unlock operations.
 */
class svt_mem_word;

  /** Identifies the address space in which this data word resides. */
  local bit [`SVT_MEM_MAX_ADDR_REGION_WIDTH-1:0] addrspace;

  /** Identifies the byte-level address at which this data word resides. */
  local bit [`SVT_MEM_MAX_ADDR_WIDTH - 1:0] addr;

  /** The data word stored in this memory location. */
  local bit [`SVT_MEM_MAX_DATA_WIDTH - 1:0] data;

  /** When '1', indicates that this word is not writeable. */
  local bit locked = 0;

  // --------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new instance of this class. This does not initialize
   * any data within this class. It simply constructs the data word object,
   * thereby preparing it for read/write operations.
   * 
   * @param addrspace Identifies the address space within which this data word
   * resides.
   * 
   * @param addr Identifies the byte address (within the address space) at which
   * this data word resides.
   * 
   * @param init_data (Optional) Sets the stored data to a default initial value.
   */
  extern function new(bit [`SVT_MEM_MAX_ADDR_REGION_WIDTH-1:0] addrspace,
                      bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] addr,
                      bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] init_data = 'bx);

  // --------------------------------------------------------------------
  /**
   * Returns the value of the data word stored by this object.
   * 
   * @param set_lock (Optional) If supplied as 1 (or any positive int),
   * locks this memory location (preventing writes).
   * If supplied as 0, unlocks this memory location (to allow writes).
   * If not supplied (or supplied as any negative int) the locked/unlocked
   * state of this memory location is not changed.
   */
  extern virtual function bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] read(int set_lock = -1);

  // --------------------------------------------------------------------
  /**
   * Stores a data word into this object, with optional byte-enables.
   * 
   * @param data The data word to be stored. If the memory location is currently
   * locked, the attempted write will not change the stored data, and the
   * function will return 0.
   * 
   * @param byteen (Optional) The byte-enables to be applied to this write. A 1
   * in a given bit position enables the byte in the data word corresponding to
   * that bit position.
   * 
   * @param set_lock (Optional) If supplied as 1 (or any positive int), locks
   * this memory location (preventing writes).
   * If supplied as 0, unlocks this memory location (to allow writes).
   * If not supplied (or supplied as any negative int) the locked/unlocked state
   * of this memory location is not changed.
   * 
   * @return 1 if the write was successful, or 0 if it was not successful (because
   * the memory location was locked).
   */
  extern virtual function bit write(bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] data,
                                    bit [`SVT_MEM_MAX_DATA_WIDTH/8-1:0] byteen = ~0,
                                    int set_lock = -1);

  // --------------------------------------------------------------------
  /**
   * Returns the locked/unlocked state of this memory location.
   * 
   * @return 1 if this memorly location is currently locked, or 0 if it is not.
   */
  extern virtual function bit is_locked();

  // --------------------------------------------------------------------
  /**
   * Returns the byte-level address of this memory location.
   * 
   * @return The byte-level address of this data word.
   */
  extern virtual function bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] get_addr();

  // --------------------------------------------------------------------
  /**
   * Returns the address space of this memory location.
   * 
   * @return The address space of this data word.
   */
  extern virtual function bit [`SVT_MEM_MAX_ADDR_REGION_WIDTH-1:0] get_addrspace();

  // --------------------------------------------------------------------
  /**
   * Dumps the contents of this memory word object to a string which reports the
   * Address Space, Address, Locked/Unlocked Status, and Data.
   * 
   * @param prefix A user-defined string that precedes the object content string
   * 
   * @return A string representing the content of this memory word object.
   */
  extern virtual function string get_word_content_str(string prefix = "");

  // --------------------------------------------------------------------
  /**
   * Returns the value of this memory location without the key prefixed (used
   * by the UVM print routine).
   */
  extern function string get_word_value_str(string prefix = "");

// =============================================================================
endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gcgC/vZTwn3+C6KF1rHnvpcE8xkv81RXdxAzXIVfNfU0VaXuwt7MHdKArshNcoQM
X1y50jZXo4SRXMT2Vp+dwfim4InCfgjTgGQo1EA9KMl2GpzlDmX/UtSWHbXKssWi
xl82EzbwWsX1MKYkZJMedWrlUoo8BapRvLNEROWDI5Q=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2723      )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_WORD_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Xup4YVyRQkraMD7FwuEiMfLsbQ6EPdNtLfkuhcopfkFaoJtKAMYbOyZJ8VE09Apj
MYfh+yURQrlM5LzHlKVMpnd8As+oQeapYJYiZhmMGsGzAUTbk8zOu2R5xEwIW9t+
EnvvY5u+RevZxcBjP2wca6xxrGQOR/dy5nF9+zLzmzE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2806      )
dhnIoCbVKbgnGAiNZpM69GFvi7IvxWjAvc1rUNA5riQlNE5T7CoVPGZtBB4oHREa
glTEOBP4+0fmWK2xJEmeYMA8b9yqkNu4FLzLSVXogHC5to6xi2V6E6KtHaMrS9vS
`pragma protect end_protected
