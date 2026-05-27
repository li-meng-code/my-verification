//=======================================================================
// COPYRIGHT (C) 2015-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MEM_ADDRESS_MAPPER_SV
`define GUARD_SVT_MEM_ADDRESS_MAPPER_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * This is a container class used by the System Memory Manager for storing source and
 * destination address range information and providing access to methods converting
 * between the two address ranges.
 */
class svt_mem_address_mapper;

  // ****************************************************************************
  // Type Definitions
  // ****************************************************************************

  /**
   * Size type definition which is large enough to facilitate calculations involving
   * maximum sized memory ranges.
   */
  typedef bit [`SVT_MEM_MAX_ADDR_WIDTH:0] size_t;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Log instance Used to report messages. */
  vmm_log log;
`else
  /** Reporter instance Used to report messages. */
  `SVT_XVM(report_object) reporter;
`endif

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  /** Name given to the mapper. Used to identify the mapper in any reported messages. */
  protected string name = "";

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  /** Low address in the source address range. */
  local svt_mem_addr_t src_addr_lo = 0;

  /** High address in the source address range. */
  local svt_mem_addr_t src_addr_hi = 0;

  /** Low address in the destination address range. */
  local svt_mem_addr_t dest_addr_lo = 0;

  /** High address in the destination address range. */
  local svt_mem_addr_t dest_addr_hi = 0;

  /** The size of the ranges defined in terms of addressable locations within the range. */
  local size_t size = 0;

  /** Delta between the source and destination address ranges, used to convert between the two. */
  local svt_mem_addr_t src_dest_delta = 0;

  /**
   * Bit indicating whether the address range defined for this mapper can overlap the address
   * range defined for other mappers. Defaults to '0' to indicate no overlaps allowed.
   */
  local bit allow_addr_range_overlap = 0;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_mem_address_mapper class. Uses 'src_addr_lo',
   * 'dest_addr_lo', and  'size' (i.e., number of addressable locations) to calculate the
   * src_addr_hi (=src_addr_lo + size - 1) and dest_addr_hi (=dest_addr_lo + size - 1) values.
   *
   * @param src_addr_lo Low address in the source address range.
   *
   * @param dest_addr_lo Low address in the destination address range.
   *
   * @param size The size of the ranges defined in terms of addressable locations within the range.
   * Used in combination with the src_addr_lo and dest_addr_lo arguments to identify the src_addr_hi
   * and dest_addr_hi values.  The mimimum value accepted is 1, and the maximum value accepted must
   * not result in src_addr_hi or dest_addr_hi to be larger than the maximum addressable location.
   *
   * @param log||reporter Used to report messages.
   *
   * @param name (optional) Used to identify the mapper in any reported messages.
   */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(
    svt_mem_addr_t src_addr_lo, svt_mem_addr_t dest_addr_lo,
    size_t size, vmm_log log, string name = "");
`else
  extern function new(
    svt_mem_addr_t src_addr_lo, svt_mem_addr_t dest_addr_lo,
    size_t size, `SVT_XVM(report_object) reporter, string name = "");
`endif

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Generates short description of the address mapping represented by this object.
   *
   * @return The generated description.
   */
  extern virtual function string psdisplay(string prefix = "");
  
  // ---------------------------------------------------------------------------
  /**
   * Used to convert a source address into a destination address.
   *
   * @param src_addr The original source address to be converted.
   *
   * @return The destination address based on conversion of the source address.
   */
  extern virtual function svt_mem_addr_t get_dest_addr(svt_mem_addr_t src_addr);
  
  // ---------------------------------------------------------------------------
  /**
   * Used to convert a destination address into a source address.
   *
   * @param dest_addr The original destination address to be converted.
   *
   * @return The source address based on conversion of the destination address.
   */
  extern virtual function svt_mem_addr_t get_src_addr(svt_mem_addr_t dest_addr);
  
  // ---------------------------------------------------------------------------
  /**
   * Used to check whether 'src_addr' is included in the source address range
   * covered by this address map.
   *
   * @param src_addr The source address for inclusion in the source address range.
   *
   * @return Indicates if the src_addr is within the source address range (1) or not (0).
   */
  extern virtual function bit contains_src_addr(svt_mem_addr_t src_addr);
  
  // ---------------------------------------------------------------------------
  /**
   * Used to check whether 'dest_addr' is included in the destination address range
   * covered by this address map.
   *
   * @param dest_addr The destination address for inclusion in the destination address range.
   *
   * @return Indicates if the dest_addr is within the destination address range (1) or not (0).
   */
  extern virtual function bit contains_dest_addr(svt_mem_addr_t dest_addr);
  
  // ---------------------------------------------------------------------------
  /**
   * Used to check to see if there is an overlap between the provided source address range and
   * the source address range defined for the svt_mem_address_mapper instance. Returns an
   * indication of the overlap while also providing the range of the overlap.
   *
   * @param src_addr_lo The low end of the address range to be checked for a source range overlap.
   * @param src_addr_hi The high end of the address range to be checked for a source range overlap.
   * @param src_addr_overlap_lo The low end of the address overlap if one exists.
   * @param src_addr_overlap_hi The high end of the address overlap if one exists.
   *
   * @return Indicates if there is an overlap (1) or not (0).
   */
  extern virtual function bit get_src_overlap(
                       svt_mem_addr_t src_addr_lo, svt_mem_addr_t src_addr_hi,
                       output svt_mem_addr_t src_addr_overlap_lo, output svt_mem_addr_t src_addr_overlap_hi);
  
  // ---------------------------------------------------------------------------
  /**
   * Used to check to see if there is an overlap between the provided destination address range and
   * the destination address range defined for the svt_mem_address_mapper instance. Returns an
   * indication of the overlap while also providing the range of the overlap.
   *
   * @param dest_addr_lo The low end of the address range to be checked for a destination range overlap.
   * @param dest_addr_hi The high end of the address range to be checked for a destination range overlap.
   * @param dest_addr_overlap_lo The low end of the address overlap if one exists.
   * @param dest_addr_overlap_hi The high end of the address overlap if one exists.
   *
   * @return Indicates if there is an overlap (1) or not (0).
   */
  extern virtual function bit get_dest_overlap(
                       svt_mem_addr_t dest_addr_lo, svt_mem_addr_t dest_addr_hi,
                       output svt_mem_addr_t dest_addr_overlap_lo, output svt_mem_addr_t dest_addr_overlap_hi);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility function for getting the low address in the source address range.
   *
   * @return Low address value.
   */
  extern virtual function svt_mem_addr_t get_src_addr_lo();

  // ---------------------------------------------------------------------------
  /**
   * Utility function for getting the high address in the source address range.
   *
   * @return High address value.
   */
  extern virtual function svt_mem_addr_t get_src_addr_hi();

  // ---------------------------------------------------------------------------
  /**
   * Utility function for getting the low address in the destination address range.
   *
   * @return Low address value.
   */
  extern virtual function svt_mem_addr_t get_dest_addr_lo();

  // ---------------------------------------------------------------------------
  /**
   * Utility function for getting the high address in the destination address range.
   *
   * @return High address value.
   */
  extern virtual function svt_mem_addr_t get_dest_addr_hi();

  // ---------------------------------------------------------------------------
  /**
   * Used to get the mapper name.
   *
   * @return Name assigned to this mapper.
   */
  extern virtual function string get_name();

  // ---------------------------------------------------------------------------
  /**
   * Used to set the mapper name.
   *
   * @param name New name to be assigned to this mapper
   */
  extern virtual function void set_name(string name);

  // ---------------------------------------------------------------------------
  /**
   * Used to get the mapper name in a form that can easily be added to a message.
   *
   * @return Name assigned to this mapper formatted for inclusion in a message.
   */
  extern virtual function string get_formatted_name();
  
  // ---------------------------------------------------------------------------
  /**
   * Used to get the allow_addr_range_overlap value.
   *
   * @return Current setting of the allow_addr_range_overlap field.
   */
  extern virtual function bit get_allow_addr_range_overlap();

  // ---------------------------------------------------------------------------
  /**
   * Used to set the allow_addr_range_overlap value.
   *
   * @param allow_addr_range_overlap New setting for the allow_addr_range_overlap field.
   */
  extern virtual function void set_allow_addr_range_overlap(bit allow_addr_range_overlap);

  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
cnVx7omrNHcdiLBviF64oqpXbnWD9mx//iP2QLxt0hgeVcSjqXugrgUw8eDgAiHh
ISqBa0o4ato/Gi7/YXNVVsJhyP/EL7YkOfErDoyuXzCiB6FOKZpqEubL6sW0xER0
Gwoe+yoT7t1ckwKI9JWOtS99nssC7pyNFUDaykGr2/8Rysuc3vQlpg==
//pragma protect end_key_block
//pragma protect digest_block
xW9/HTNdEC0fAuFYqVQWTvdzJ/4=
//pragma protect end_digest_block
//pragma protect data_block
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
0mrEHj9QBKD9NFbUeLxoxw==
//pragma protect end_data_block
//pragma protect digest_block
zJF5OMnJz33CEva84gnw9+D60cY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_ADDRESS_MAPPER_SV
