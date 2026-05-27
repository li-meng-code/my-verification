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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hG6NAEy4HCoH5iIq8Ieoa2nUTie4Hwh/ACZ+SX4B3yAoF8bgfIrL2uO/Xb20ONSh
a26j67sUivfATarjUIdtA3jlDXb+N9L9Ta28OIsim1GE4V8xIAqrSripKnXQtai5
2QWvOEIuoLgxZfxjU8O6rpVDNfssqHHyb5dUBU1scYY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29853     )
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
EoOxrKwEKgB4JwXOiPphsNUyj8VOorJI1PaIxtU+QBvufC/zcQQtlMtdQG9Dapcj
0PbU/GA7dRCBbbBKAVbJpGjQ9EP2Necvl7DYVO/yux0wwWLYlqGDODLEKHoYFaD8
Rl9/EDWBv7w1HYRMeIhB9kA2YsyuH04SKMWg4S1MUq54pBE1bHmM/DfSrn9x0L7H
+JZTtjjYqk0hin+Gw6lDqgmppr3AM0K/28rnNRCoDcwLoX5NXpbe68CsQLuMKWqX
kDr4IdzZioFDz+EQy2FG65hgtsfEPccRECjyphURwcIis6/b3JJCoJv0k253dv4C
zDvCgxMVGLlUY5NlTKjYo0jH5id/Vhz0mBsum7LWhPlvMyxKwYADA2aEwIVPDTyb
deG833C/ox3b+pgO3kRPRez+vV3b6M/XR9F9tIsS4f0EUsMGAE1G3/gZd4f67soV
1KS/3mjRII0d6luOIYhsx+8arw6iVoYUPc0d2Cm1tGQMVsL/gszRpHlD4rFA5jP6
/SGSMZbC7nAy5cL33widhl0QtE40YCZk4dZME1Ecq8BRVDCho2Wk6/WoeEQT10LB
KiU4Ha978bQR64rTNL3YdOCfs0/ecf9lA9JGaMoU7+8XGVIxbHT8CrGeEdbybVrN
WNRe6X4pAwW9qJsIIgVJwkvqKYIqRaQSCcY+I+wP4nOui6YuZLaKpn8JUh0UG2Er
4e8WeFP4+tJPNgFipxozdQZEA21zGvmfulJk9SMr+IkCixoWX162lugwxlmWTooP
GFqttm9TWdVrsK03o7PWnn3AS78A0MVdverCnhJ3p2OOu5h7DK4on525PDgvIeot
TRnCP3xVSFe7bZKLlEwuOZtlfMfs6T4fWYnZzvznjhOXUsTPsvYVNgRlnoZdiZLu
fiuDdKtaUrIv7VV6W0+9Puwmq+O0qb6NDrUc5vk7xu8rNJxNKj31JsjXRW+8tav+
+AEvErxyHIENFKDoEUhF+/SS0rkPNj2nVKbTl6PsVZzXHIZhItQfaHaD3LKzrBYx
VR+hK9lQx84GQr7FiyeXt1NgRIb52rBeTTVdRj8EPa5sWqydisaU6OUGinbhqRaK
HHvLyVgHFKsCBs8zO/oADCgxvrvAXXIpsihRvYnnSFCeYh342YoKmnq/PfQj1jH6
Lq4gBW1Mj9liO4uqujzLItEwn1pbSEph6uHcuGJzCqrtNruKcSqBXJq3oiQkqOR3
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
qYP8kJrHk/SYrFovqHU7grud8L1dlpS5sFOgcbxD8m1KZIVA4RxVA7gSc4NDdSta
xHugaRf08vafFxG9pMt3dlaedR4NFVc1ik9GxUqDOkLEj4msz4qO9jjFcdBSlDcG
r/pU+zRwMxGaGpGu7grXLjCu/ZT0J4hyiMyuSKP8t2K1Iqd/AKQAiGA7SVE0Vz5X
ToRm0lubeHj8Te3Z4iOjvHQvO2LObjexFp8/Fgn0GuUMN61sAo++Tt0iXpS9cxXU
A5TuARwKshm+OMOPVm4loYO5uWO+EpqABScqNYddAuVcY7ewTfxdTyC8lxajAViy
I60n6c1hIojyFyZ9Es0Aw83aQsI/4ZLGnIFAMoJ9gR04fYUfGW8ngguNqTtVcSWL
Q7IoVgZ3a7vbqFvaVc1jc5+jXzNtcjaro7ZWzQ9TosF2adyp4bs3Sarm/YcUWR+f
b1jw/kOhW2ytP/K00GnicFIySPZhi4knM3lSxCf1brbMFujhOeeh7YAoSU1/GrXW
IbBS/+4MrG9sgYG7HGVQwcLKB1KKXXtkTw7qN4A7AfP9TOMmJ0Lketkn/A2LtKSP
OUsf6+7X9XaRnPcrtgNU17i+kgAIt/N+E+T06Ix6wKR2Wx7iDJRmIl3siJZh4jXf
GUAvBM9IRuoA7+ZD1Y2S49d/By+Z6dj/8sifcnCxxPWXOwmr/Bn7BLBmF9UkMQor
vH1n3BHpmR7zLHJE+4hjTahqVcuXgY3QICb4H3SCx32XAZASpnsYieNE+MvdxJ+z
Di5yvxyz0SsGo69Xlcsd10bKvhYdUewlHYiNY9I/ZrUWvupYPXEKU+YrSEY/3Vzo
Y0dcO4AVfdK5D14ktge/l8qDtk71J5twUsjF35SWfNm28y+5f6dTAbXQicy/o40v
RTKknbyBzugKOAg8uYubRxc6PrRpFJvLK6oLeeTMDplp1pg7JgEl43pA7kQF8AjW
8rsDxFbUIzCvOBeyv8Z3TN9+cuIUgcNx21JnMEZvNmCeT+J7KDWMzHt2O2f0fXSR
kJGWVQDqZlV7TkpG4cyInml472qk0MpL6UIaKT/xpgyl+zLOsUkzH37/MbeI1klj
QzGpSbEADyVrSO2n1cCfgzPRIAtzG85qP9Kell+4WqHrEh/q3OekwHW8QOLG9Zdm
pSQ2G4aipB1ot9lKEuXpX6mViLjreghVvor42UurO8voZHdejL8DIMKxQmJqXur0
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
`pragma protect end_protected

`endif // GUARD_SVT_EXCEPTION_LIST_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nfcPWpPBeXsqCIFQTpJu6fVCc7l2DVQhUuN0xst0uAHXOQWjH9iT85Vk62hOzzll
KawnnPslJuSMHfwI2WGDuzs8ZO0G6GZyvQkyhUNAlumNcvFQfqCGBDbearg7/G0u
FynjZW3kcIftKeOL+A5QKXxwAHdqGvVAu19lBDocYXk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29936     )
Cbm2BkxvizUki8gnWswK0pMZvm7oj3GsGWV7G5+0zLRG3h0Sm/9mMiUKIe+wxuIG
TNY/3zB1EUYc1VY/68cAQSmCg8YJrxfTF49mkxdzQMclEKiU3fS9X5Xg1a9fPnH4
`pragma protect end_protected
