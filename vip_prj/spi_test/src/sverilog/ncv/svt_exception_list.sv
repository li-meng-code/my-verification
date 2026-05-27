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

`ifndef GUARD_SVT_EXCEPTION_LIST_SV
`define GUARD_SVT_EXCEPTION_LIST_SV

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_data_util)

/** 
 Does the appropriate logical compares to determine if 2 exception lists are
 NOT allowed to be merged/combined.  Expected 'general' usage is shown below.
 
 - excep_list1 is <obj>.exception_list
 - excep_list2 is the randomized_*_exception_list factory
 .
<br> if (excep2_list == null)
<br>   `svt_verbose("randomize_*_exception_list", "is null, no exceptions will be generated.");
<br> else if `SVT_EXCEPTION_LIST_COMBINE_NOT_OK(excep_list1,except_list2) begin
<br>   `svt_verbose("randomize_*_exception_list", "cannot be combined with <obj>.exception_list.");
<br> end else begin
<br>  // Logic to do the randomization of the exceptions to be added 
<br>  // and then combine the two lists.
<br>  // 
<br>  // If one list has (enable_combine == 1) then the final exception_list
<br>  // is to have (enable_combine == 1) also.
<br> end
 */
`define SVT_EXCEPTION_LIST_COMBINE_NOT_OK(excep_list1,except_list2) \
  ((excep_list1 != null) && \
   (excep_list1.num_exceptions != 0) && \
   (!excep_list1.enable_combine) && \
   (except_list2 != null) && \
   (!except_list2.enable_combine))
  
/**
 * The EA and 1.0 version of UVM include an array 'copy' issue that we need
 * to workaround. Set a flag to indicate whether this workaround is needed
 */
`ifdef SVT_UVM_TECHNOLOGY
`ifdef UVM_MAJOR_VERSION_1_0
`ifndef SVT_EXCEPTION_LIST_UNSAFE_ARRAY_DO_COPY
`define SVT_EXCEPTION_LIST_UNSAFE_ARRAY_DO_COPY
`endif
`endif
`elsif SVT_OVM_TECHNOLOGY
`ifndef SVT_EXCEPTION_LIST_UNSAFE_ARRAY_DO_COPY
`define SVT_EXCEPTION_LIST_UNSAFE_ARRAY_DO_COPY
`endif
`endif

                   
// =============================================================================
/**
 * Base class for all SVT model exception list objects. As functionality commonly
 * needed for exception lists for SVT models is defined, it will be implemented
 * (or at least prototyped) in this class.
 */
class svt_exception_list#(type T = svt_exception) extends `SVT_DATA_TYPE;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** Used to create (i.e., via allocate) new exceptions during exception list randomization. */
  T randomized_exception = null;

  /** Variable to control the maximum number of exceptions which can be generated for a single transaction. */
  int max_num_exceptions = 1;

  /** Flag indicating whether the exceptions have been injected into the transaction */
  bit data_injected = 0;

  /**
   * Flag which indicates whether these exceptions should be used "as is", or if
   * the component is allowed to combine them with other exceptions that are being
   * introduced from another source. For example this flag can be used to indicate
   * that exceptions coming in with a transaction via the input channel can be
   * combined with randomly generated exceptions produced by an exception factory
   * residing with the component.
   *
   * Components supporting the use of this field should recognize the ability to
   * combine whether the flag is set on the exception coming in with the transaction
   * or with the exception factory. The combining of exceptions should only be
   * disallowed if BOTH flags are set to 0.
   *
   * These flags should be reflected in the resulting exception list based on
   * the outcome of AND'ing the values from the combining transactions. As such
   * enable_combine should be set to 1 in the combined exception list if and only
   * if it is set to 1 in both of the exception lists being combined.
   *
   * When the exception list at one level of the component stack is used to
   * produce exceptions at a lower level of the component stack, this value
   * should be passed down to the lower level exceptions. 
   */
  bit enable_combine = 0;

  /**
   * Flag which is used by num_exceptions_first_randomize() to control whether the
   * exceptions are being randomized in the current phase.
   */
  protected bit enable_exception_randomize = 1;

  // ****************************************************************************
  // Random Data
  // ****************************************************************************

  /** Random variable defining actual number of exceptions. */
  rand int num_exceptions = 0;

  /** Dynamic array of exceptions. */
  rand T exceptions[];

  // ****************************************************************************
  // Weights used by the constraints
  // ****************************************************************************

  /** Relative (distribution) weight for generating <i>empty</i> exception list. */
  int EXCEPTION_LIST_EMPTY_wt  = 10;
  /** Relative (distribution) weight for generating <i>singleton</i> exception list. */
  int EXCEPTION_LIST_SINGLE_wt = 1;
  /** Relative (distribution) weight for generating <i>short</i> (i.e., less than or equal to num_exceptions/2) exception list. */
  int EXCEPTION_LIST_SHORT_wt  = 0;
  /** Relative (distribution) weight for generating <i>long</i> (i.e. greater than num_exceptions/2) exception list. */
  int EXCEPTION_LIST_LONG_wt   = 0;

  // ****************************************************************************
  // Constraints
  // ****************************************************************************

  /** Keeps the randomized number of exceptions from exceeding the limit defined by max_num_exceptions. */
  constraint valid_ranges
  {
    num_exceptions inside { [0:max_num_exceptions] };

    if (enable_exception_randomize) {
      // Keep the size at the max -- post_randomize will insure consistency with num_exceptions
      exceptions.size() == max_num_exceptions;
    } else {
`ifdef SVT_MULTI_SIM_ARRAY_OR_QUEUE_EMPTY_CONSTRAINT
      exceptions.size() == 1;
`else
      exceptions.size() == 0;
`endif
    }
  }

  /** Defines a distribution for randomly generated exception list lengths. */
  constraint reasonable_num_exceptions
  {
    if (max_num_exceptions > 3) {
      num_exceptions dist 
      {
        0 := EXCEPTION_LIST_EMPTY_wt,
        1 := EXCEPTION_LIST_SINGLE_wt,                                      
        [2:(max_num_exceptions/2)] := EXCEPTION_LIST_SHORT_wt,                                      
        [((max_num_exceptions/2)+1):max_num_exceptions] := EXCEPTION_LIST_LONG_wt                                      
      };
    } else if (max_num_exceptions > 1) {
      num_exceptions dist 
      {
        0 := EXCEPTION_LIST_EMPTY_wt,
        1 := EXCEPTION_LIST_SINGLE_wt,                                      
        [2:max_num_exceptions] := EXCEPTION_LIST_SHORT_wt+EXCEPTION_LIST_LONG_wt                                      
      };
    } else {
      num_exceptions dist 
      {
        0 := EXCEPTION_LIST_EMPTY_wt,
        1 := EXCEPTION_LIST_SINGLE_wt                                      
      };
    }
  }

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_exception_list)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception list instance, passing the appropriate
   * argument values to the <b>svt_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   * 
   * @param suite_name Identifies the product suite to which the data object
   * belongs.
   * 
   * @param randomized_exception Sets the exception factory used to generate
   * exceptions during randomization.
   * 
   * @param max_num_exceptions Sets the maximum number of exceptions generated
   * during randomization.
   */
  extern function new(vmm_log log = null, string suite_name = "", T randomized_exception = null, int max_num_exceptions = 1);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception list instance, passing the appropriate
   * argument values to the <b>svt_sequence_item_base</b> parent class.
   *
   * @param name Intance name for this object
   * 
   * @param suite_name Identifies the product suite to which the data object
   * belongs.
   * 
   * @param randomized_exception Sets the exception factory used to generate
   * exceptions during randomization.
   * 
   * @param max_num_exceptions Sets the maximum number of exceptions generated
   * during randomization.
   */
  extern function new(string name = "svt_exception_list_inst", string suite_name = "", T randomized_exception = null, int max_num_exceptions = 1);
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_param_member_begin(svt_exception_list#(T))
    `svt_field_object       (randomized_exception, `SVT_ALL_ON|`SVT_NOCOMPARE|`SVT_NOPACK|`SVT_DEEP, `SVT_HOW_DEEP)
    `svt_field_array_object (exceptions,           `SVT_ALL_ON|`SVT_NOCOMPARE|`SVT_NOPACK|`SVT_DEEP, `SVT_HOW_DEEP)
  `svt_data_member_end(svt_exception_list#(T))

  //----------------------------------------------------------------------------
  /**
   * Method which randomizes num_exceptions first, before randomizing exceptions.
   * This is done by doing the randomization once to isolate num_exceptions,
   * then again to isolate exceptions.
   *
   * @return Indicates success of the individual randomization phases.
   */
  extern virtual function bit num_exceptions_first_randomize();
  //----------------------------------------------------------------------------
  /**
   * Populate the exceptions array to allow for the randomization.
   */
  extern function void pre_randomize();
  //----------------------------------------------------------------------------
  /**
   * Cleanup #exceptions by getting rid of no-op exceptions and sizing to match num_exceptions.
   */
  extern function void post_randomize();
  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode ( bit on_off );
  //----------------------------------------------------------------------------
  /**
   * Method to change the exception weights as a block.
   */
  extern virtual function void set_constraint_weights ( int new_weight );
  //----------------------------------------------------------------------------
  /**
   * Method used to remove any empty exception slots from the exception list.
   */
  extern virtual function void remove_empty_exceptions();
  //----------------------------------------------------------------------------
  /**
   * Method to remove any collisions (i.e., exception vs. exception) present in
   * the list.
   */
  extern virtual function void remove_collisions();
  //----------------------------------------------------------------------------
  /**
   * Method to inject the exceptions into the transaction. Note that if
   * 'data_injected == 1' then the exceptions are NOT injected.
   */
  extern virtual function void inject_exceptions();
  //----------------------------------------------------------------------------
  /**
   * Method to get the specified exception from our exception list.
   * returns 'null' if the specified index is out of range.
   * @param idx The index of the exception to get
   */
  function T get_exception(int unsigned idx);
    if (idx >= exceptions.size()) return null;
    return exceptions[idx];
  endfunction
  //----------------------------------------------------------------------------
  /**
   * Get the transaction exception factory object.
   */
  function T get_randomized_exception();
    return randomized_exception;
  endfunction
  //----------------------------------------------------------------------------
  /**
   * Method to add a single exception into our exception list. Insures that
   * 'num_exceptions' is updated properly.
   * @param exception The exception to be added.
   */
  extern virtual function void add_exception(T exception);
  //----------------------------------------------------------------------------
  /**
   * Method to add the exceptions in the provided exception list into our exception
   * list.
   * 
   * @param list_to_add Uses list_to_add.num_exceptions to see how many exceptions
   * are to be added and uses list_to_add.exceptions to get the actual exceptions.
   */
  extern virtual function void add_exceptions(svt_exception_list#(T) list_to_add);

  // ****************************************************************************
  // Base Class Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the exception_list base class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);
`else
  // ---------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the exception_list base class fields.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in <i>diff</i>.
   *
   * @param to vmm_data object to be compared against.
   * 
   * @param diff String indicating the differences between this and to.
   * 
   * @param kind This int indicates the type of compare to be attempted.
   * Supports both RELEVANT and COMPLETE compares.
   */
  extern virtual function bit do_compare (vmm_data to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /** Override the 'do_compare' method to compare fields directly. */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default `SVT_XVM(packer)
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  //----------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default `SVT_XVM(packer)
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only
   * supported kind value is `SVT_DATA_TYPE::COMPLETE, which results in a size calculation
   * based on the non-static fields. All other kind values result in a return value
   * of 0.
   * 
   * @return Indicates how many bytes are required to pack this object.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the
   * operation.
   * 
   * @param offset Offset into bytes where the packing is to begin.
   * 
   * @param kind This int indicates the type of byte_pack being requested. Only
   * supported kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the
   * number of packed bytes. All other kind values result in no change to the
   * buffer contents, and a return value of 0.
   * 
   * @return Indicates how many bytes were actually packed.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * 
   * @param offset Offset into bytes where the unpacking is to begin.
   * 
   * @param len Number of bytes to be unpacked.
   * 
   * @param kind This int indicates the type of byte_unpack being requested. Only
   * supported kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the
   * number of unpacked bytes. All other kind values result in no change to the
   * exception contents, and a return value of 0.
   * 
   * @return Indicates how many bytes were actually unpacked.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Checks to see that the data field values are valid.
   *
   * @param silent bit indicating whether failures should result in warning
   * messages.
   * 
   * @param kind This int indicates the type of is_avalid check to attempt. Only
   * supported kind value is `SVT_DATA_TYPE::COMPLETE, which results in verification that
   * the data members are all valid. All other kind values result in a return value
   * of 1.
   * 
   * @return Indicates function success (1) or failure (0).
   */
  extern virtual function bit do_is_valid(bit silent = 1, int kind = -1);


  // ****************************************************************************
  // Command Support Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived
   * from this class. If the <b>prop_name</b> argument does not match a property of
   * the class, or if the <b>array_ix</b> argument is not zero and does not point
   * to a valid array element, this function returns '0'. Otherwise it returns '1',
   * with the value of the <b>prop_val</b> argument assigned to the value of the
   * specified property. However, If the property is a sub-object, a reference to
   * it is assigned to the <b>data_obj</b> (ref) argument. In that case, the
   * <b>prop_val</b> argument is meaningless. The component will then store the
   * data object reference in its temporary data object array, and return a handle
   * to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of its component. The command testbench code must then use <i>that</i> handle
   * to access the properties of the sub-object.
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
   * @param data_obj If the property is not a sub-object, this argument is assigned
   * to <i>null</i>. If the property is a sub-object, a reference to it is assigned
   * to this (ref) argument. In that case, the <b>prop_val</b> argument is
   * meaningless. The component will then store the data object reference in its
   * temporary data object array, and return a handle to its location as the
   * <b>prop_val</b> argument of the <b>get_data_prop</b> task of its component.
   * The command testbench code must then use <i>that</i> handle to access the
   * properties of the sub-object.
   * 
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command code to
   * set the value of a single named property of a data class derived from this class.
   * This method cannot be used to set the value of a sub-object, since sub-object
   * consruction is taken care of automatically by the command interface. If the
   * <b>prop_name</b> argument does not match a property of the class, or it matches
   * a sub-object of the class, or if the <b>array_ix</b> argument is not zero and
   * does not point to a valid array element, this function returns '0'. Otherwise it
   * returns '1'.
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
  /**
   * This method is used to safely get the current number of exceptions. It basically
   * chooses the smaller of 'num_exceptions' and 'exceptions.size'. Note that this does
   * NOT check that the elements in the exceptions array are non-null.
   *
   * @return Number of exceptions
   */
  extern virtual function int safe_num_exceptions();

  //----------------------------------------------------------------------------
  /**
   * Populate the exceptions array to insure it is ready for randomization.
   */
  extern function void populate_exceptions();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
oQuX65rOZS8+aDNxizsIBYtsMg3Zm96d+nYLaY1dV1pUwkBifzvsMZPh96VbqqSd
Hri2ESYD2s2gs+Ndt6gmMo+uGuxsg6LWvrlMuRYzUBKsii3Tn2UCXQkZalMml6Bf
LsKJ7V/OIY2vvM0oSXtHmkyqGh7KqAhsBLXOvOMOxWw+D3YbihsY+A==
//pragma protect end_key_block
//pragma protect digest_block
l9jsJjD96kJSFqoER3vsDR4dRB8=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
w1iy5EUlQPOJn28qWpIOiVnJuLY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_EXCEPTION_LIST_SV
