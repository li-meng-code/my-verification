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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BwIsqZSbpc49UTdeHtW1t3Tqy15VAmgGaYoCcbD2SFXBcnnmqg6nyvv/gnCMSyB3
GExahyHhIKp73kv9/4k+7/YYVcglhFQptlXCzWbpaOkLP0pd/iAWO+/ILXHgvZCR
zfmCKPm5vnza9oxLJVX1h+AEdZywUo3ULQ2+ca88SII=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7865      )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_ADDRESS_MAPPER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
e/SxHnPDJTmPkqI7byqXGUXrZvidqKTYa5FGQ31WD5zWRu3DIdKxdcTGfZpILfgG
ERGpQhOCbhWDDP9tMMQZNeSQOGOebLodxO+2s6yrbvCXisU1R1UR/9uWYEaLscGn
vV+5FyE5Fblc74WfFL2D5kVhX1jL5rSFIhjPek/TJt8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7948      )
JI1nqwmUExZgo6bYcDLy1mvlFt1ikN8MdpeYLKhg6wXwx9ELI9uqx33KILcS0heQ
IHoTKLXIs7gePUa+oEPZsCF9TTrkCSNET8QVyE5rGvWre6npMPwBEmm7b4njspci
`pragma protect end_protected
