//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_EXCEPTION_SV
`define GUARD_SVT_EXCEPTION_SV

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_data_util)

// =============================================================================
/**
 * Base class for all SVT model exception objects. As functionality commonly needed
 * for exceptions for SVT models is defined, it will be implemented (or at least
 * prototyped) in this class.
 */
class svt_exception extends `SVT_DATA_TYPE;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /**
   * If set to something other than -1, indicates the (first) time at which the error
   * was driven on the physical interface. At the time at which the error is driven,
   * the STARTED notification (an ON/OFF notification) is indicated (i.e. turned ON).
   */
`else
  /**
   * If set to something other than -1, indicates the (first) time at which the error
   * was driven on the physical interface. At the time at which the error is driven,
   * the "begin" event is triggered.
   */
`endif
  real start_time                               = -1;

  /**
   * Indicates if the exception is an exception to be injected, or an exception
   * which has been recognized by the VIP. This is used for deciding if protocol
   * errors should be flagged for this exception. recognized == 0 indicates
   * the exception is to be injected, recognized = 1 indicates the exception
   * has been recognized.
   *
   * The default for this should be setup in the exception constructor. The
   * setting should be based on whether or not the exception CAN be recognized.
   * If it can, then recognized should default to 1 in order to make it
   * less likely that protocol errors could be disabled accidentally. If the
   * exception cannot be recognized, then recognized should default to 0.
   *
   * Since not all suites support exception recognition, the base class assumes
   * that exception recognition is NOT supported and leaves this value initialized
   * to 0.
   */
  bit recognized = 0;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_exception)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new instance of the svt_exception class, passing the
   * appropriate argument values to the <b>svt_data</b> parent class.
   *
   * @param log An vmm_log object reference used to replace the default internal
   * logger. The class extension that calls super.new() should pass a reference
   * to its own <i>static</i> log instance.
   * @param suite_name A String that identifies the product suite to which the
   * exception object belongs.
   */
  extern function new( vmm_log log = null, string suite_name = "");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new instance of the svt_exception class, passing the
   * appropriate argument values to the <b>svt_sequence_item_base</b> parent class.
   *
   * @param name Intance name for this object
   * 
   * @param suite_name A String that identifies the product suite to which the
   * exception object belongs.
   */
  extern function new(string name = "svt_exception_inst", string suite_name = "");
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_exception)
  `svt_data_member_end(svt_exception)

  // ****************************************************************************
  // Base Class Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the exception base class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);
  //----------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted.
   * Supports both RELEVANT and COMPLETE compares.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size (int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1 );

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the exception contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1 );

`else
  // ---------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the exception base class fields.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
  // ---------------------------------------------------------------------------
  /** Override the 'do_compare' method to compare fields directly. */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
  //----------------------------------------------------------------------------
  /**
   * Pack the fields in the exception base class.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);
  //----------------------------------------------------------------------------
  /**
   * Unpack the fields in the exception base class.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Checks to see that the data field values are valid.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in verification that the data
   * members are all valid. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_is_valid(bit silent = 1, int kind = -1);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Method to change the exception weights as a block.
   */
  extern virtual function void set_constraint_weights(int new_weight);

  //----------------------------------------------------------------------------
  /**
   * Method used to identify whether an exception is a no-op. In situations where
   * its may be impossible to satisfy the exception constraints (e.g., if the weights
   * for the exception types conflict with the current transaction) the extended
   * exception class should provide a no-op exception type and implement this method
   * to return 1 if and only if the type of the chosen exception corresponds to the
   * no-op exception.
   *
   * @return Indicates whether the exception is a valid (0) or no-op (1) exception.
   */
  virtual function bit no_op();
    no_op = 0;
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Injects the error into the transaction associated with the exception.
   * This method is <b>not implemented</b>.
   */
  virtual function void inject_error_into_xact();
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Checks whether this exception collides with another exception, test_exception.
   * This method must be implemented by extended classes.
   *
   * @param test_exception Exception to be checked as a possible collision.
   */
  virtual function int collision(svt_exception test_exception);
    collision = 0;
  endfunction

  //----------------------------------------------------------------------------
  /** Returns a the start_time for the exception. */
  extern virtual function real get_start_time();

  //----------------------------------------------------------------------------
  /**
   * Sets the start_time for the exception.
   *
   * @param start_time Time to be registered as the start_time for the exception.
   */
  extern virtual function void set_start_time(real start_time);

  // ---------------------------------------------------------------------------
  /**
   * Updates the start time to indicate the exception has been driven and generates
   * the STARTED notification.
   */
  extern virtual function void error_driven();

  // ---------------------------------------------------------------------------
  /** Returns a string which provides a description of the exception. */
  virtual function string get_description();
    get_description = "";
  endfunction

  // ****************************************************************************
  // Command Support Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived
   * from this class. If the <b>prop_name</b> argument does not match a property of
   * the class, or if the <b>array_ix</b> argument is not zero and does not point to
   * a valid array element, this function returns '0'. Otherwise it returns '1', with
   * the value of the <b>prop_val</b> argument assigned to the value of the specified
   * property. However, If the property is a sub-object, a reference to it is
   * assigned to the <b>data_obj</b> (ref) argument. In that case, the <b>prop_val</b>
   * argument is meaningless. The component will then store the data object reference
   * in its temporary data object array, and return a handle to its location as the
   * <b>prop_val</b> argument of the <b>get_data_prop</b> task of its component.
   * The command testbench code must then use <i>that</i> handle to access the
   * properties of the sub-object.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * 
   * @param prop_val A <i>ref</i> argument used to return the current value of the
   * property, expressed as a 1024 bit quantity. When returning a string value each
   * character requires 8 bits so returned strings must be 128 characters or less.
   * 
   * @param array_ix If the property is an array, this argument specifies the index
   * being accessed. If the property is not an array, it should be set to 0.
   * 
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The component will then store the data object reference in its temporary data
   * object array, and return a handle to its location as the <b>prop_val</b> argument
   * of the <b>get_data_prop</b> task of its component. The command testbench code
   * must then use <i>that</i> handle to access the properties of the sub-object.
   * 
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command code
   * to set the value of a single named property of a data class derived from this
   * class. This method cannot be used to set the value of a sub-object, since
   * sub-object consruction is taken care of automatically by the command interface.
   * If the <b>prop_name</b> argument does not match a property of the class, or it
   * matches a sub-object of the class, or if the <b>array_ix</b> argument is not
   * zero and does not point to a valid array element, this function returns '0'.
   * Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * 
   * @param prop_val The value to assign to the property, expressed as a 1024 bit
   * quantity. When assigning a string value each character requires 8 bits so
   * assigned strings must be 128 characters or less.
   * 
   * @param array_ix If the property is an array, this argument specifies the index
   * being accessed. If the property is not an array, it should be set to 0.
   * 
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
smsD0A3+A5ac8sOB/zwiPEY/Rkefn1l1ZwjiJUynJY45t7d5vMssFjwxPqvhmeG3
hSw5FJwV/OXjXZI/4mz9WUkJSwiWsDAmPhi9kRI9+h1G7TG6y0uASOfU4g+hJdtR
vdcTPGrGDCgmjxYNc0oEzsqcGOwMp3wLjGPsfMUa1ZSxX5JH1fWwKg==
//pragma protect end_key_block
//pragma protect digest_block
56w115SPFVmgYH7Ghs7/RfRpO1Q=
//pragma protect end_digest_block
//pragma protect data_block
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
rIT3eyvj6kobgDKRuSScLw==
//pragma protect end_data_block
//pragma protect digest_block
akfbLB30dNHQsuLNRoGMYhnsqPg=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_EXCEPTION_SV
