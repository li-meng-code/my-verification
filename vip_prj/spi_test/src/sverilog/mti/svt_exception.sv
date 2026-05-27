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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZgqcrkCUDSDBmyRroov07JjgsbBOgCCOkBl/JAD2P4HSMUtxfgblc9vfsax6RDRv
eOucw86bPEsLbfYrSNN7w+5pi8B0Us/Y5lmMbPzDxbqA3WtVuoh6ocCw/owDIVHG
DdfROpwVDBT28BMnIBUAerKHn278B+aDQwxGkrfyxf8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10983     )
qApCEDLe8tQun1awKZkr/whZa8M9q9vAVa9CdozGZbksBc5nM6yVhTxK8+wdjgit
FctJm73Fgpe8YXXykYgdZk70UoGNM7F1hvxLOUzPFJC9iGMOBxzRBH+Zr121PwVR
NdiKt5tmlODOaizMnKa1UbZOVk3TrJtfbJJxi/uqn3j77jlQOKhQcdlvJpcJni0d
2q3Xvw80HLBAxxsWU9iggx2/Q2Vljg6+nn3yrScBfH+zOtixNzgmpN4wxOyoyiKP
fTF68/AuRMiVDzwrcO2iuuzo4YVvWWAPytyJ2MLCoEYvRQC7kL1EhoKFtNGR1OhJ
GMdNv7EOzubqcmmkujZFHiEdpd3mHjy9RSoss28y/fZe3y75kjH/PA4R9gLhR/lR
nKioFQ3vvXQVg/SQ84gcPhLjiykGKXwmmy++rIKj3ZLZRajRXizI4eZ/dx0bVhrc
mBlR3+yYCq8lPgXBDOWI1g5nt3nFqNzMK8FOeyRlg8d8Ta0fK3w5CBokCerIiJq+
BdJCtTLAM0XwxHi/71SsVKq1s2n7hh5ApKYGIgqZKeVvjmkuik53XbgukgtJ3Kha
H4AN1TQyqLr0c2FvDs1ioQcuYvDexD6HICFo5qu2GLmjZlIcE+emETFNAWHUEx1O
RqqXc0V3dCF0/48UOYbJJL6hFEV9lLwgWx9rDKa0OpjWV2im9ozTvcGuoVHz9uwL
hC6WB5/Jxyo5dHgCaULB2C7vZYOjRAlW9EHbaH5bUVXv3FdbtOOunqfDc8Bp6A9H
w+t+zVwoCTYd/n6Oy6akmTVNhSMP0y7vJqCsTTSLN2695X+S++L1dzldjaiX0DSH
cmkModhFrQ6kQ1zgYc27R9QIlo7L7zWWPn5X/XAvhk2BANeKNWWNGmxC/KZuIcvE
kSH5+Xrqa2FFyi520ljUxeiMZXLsr85pTXtw2kEreRrzjMIbj/xDhADLYy4O+Yi+
jtK/8kj2pV6f1BvwGZDYDH9IxLjQ6EThvY9ZGu8QEw70TjUn31fRJgY8ZYjul4aN
PDIU5EQRlbNzMnlUpw6XQly6Wq7IasKjJv82l90BlhzH/1eEHhhn97l+gDV6QLjV
9G5s8/Wp/weopEmwtnwkSZGak75CgoEzO24+5tdDAQdwqBhenfizrz2cJT4kI4Sz
0UE9GxlHpks1sr3Ra2kGqiYabUqKy3ZRnDjZHvC6f/zwyBtdsKlLpgar77DfCLho
/9/K1tXmH36Ki6SSUVAXfPqassE+Qrr5N4H+asU7E+zKgTXdQ7uUjSRWSkt0Se9x
bgEGTwEV8ghzMuy51LFvmgs/Ehu6qakFw0fok2Nk8vQtN6LpcicJ1KANSZOlzkVZ
CJ42Uz/uUpyEGzMk6lyrVISRRG/QRSM5SmfF1uAOjneAVQI6xGR1cbt3ujVkJabm
1g1GhcPykq+n3kHwzevt5kJOzSMMFEkDrIaCXw0NQmms3MnQDu5Ddvz7VNGLsuyT
dZqJbLd82ASTIyG2hRLDYmYn6fXmkDdMZicUMe/TBS8vSIX1ake47By+f8NgPq+c
UEqrZ1VkrER81j1WUdACHmF1SRRM2hLDk/9QJbY2oMji9mNJAEArFDYUD3UdZwtg
QONu/mLXz5APQNRNLNFn8V9mE+KeGAu2dn4rX1SZ/LcWtR+AxwUyjCKl7g3U507U
k/SJybSzKuV1aI1QMXK9mebOCySPttACBAcp3F6ln4waNNfoBZqTGhO+VvdnKp4A
CRkN6sWquoVlbrAukIu0/LcQ3KnjDNBHNmulegyQik+K2kW+0Ivut8xRo9KdXLY6
xYpx5kQW04Hc3n/SKOrUMq5d5PuwIwPxjrFgPEfC/2rgfMJe99jrJUCgNlGZTXz/
ZI3ivE5NA6NtjxqS3IBQBVeY9k4QRu4wFRXGVo4E78B6krctcAHzSZ93Q8DrX3qT
HAaLmadFD0dI9ARPb2HmH0S0s6d1nH7a7kbzQBtReIAEJih6kWcY1szWwXzjzHu+
Kg/3EEmlxn8tg4UPhy4oGYJf3knnJnE+mnT+HAFLqKcC+w3imA67t9912R8p8pWA
J7gFvsFNl9eKvsczSdhnoJOLISiw8NMsg+Sh6zTpT+lpsWm1BQjDVkBjiKxcZ8jK
CcqyJ0FPehf8/2pgGPr3T+MNlHH4TAh56/jBv0BuIh0HozRjqIqE7SMWb8bFPu2M
gwwlKfs4UzDXqX98xb6dIHLGlvHtzjAST1BcEj8FreJr12MWCtdlDnLetgrxFbtC
qy52iMkzEtqO7nQO8Bsl22lT9pGXsAIf2SKVPMSAT4Y8qaEfFhBxzJpNc/iTGg79
qLjHq+4j6SuBKhLLyiq0prCPuM/FbNtceMRMgFWXqBnTtGBTxQLyANdqqkIYoizG
Q/BzYv8zrY3jtVVGX4Q+WhON6jW9ogQftSUgvAdjeXvpnzEilpdbcmleq/aLBe6I
gvoBKsXrBU5XcDKZNsHdRI5CSP9gzYHiw0DJF9c6usw1qf/gGxljmncV5+1JAU2b
D4udJRKVHn+4B/OPpQ9Fn1BkKqaO0FGWEZgQiwtrxtP0c3aLl+XJ4VsEGxMDF9/0
2htipS7jgPXsjD6jVWUdPSYV9kOb0gepKUIej1S8un/4/pRxKWzlg6Cf1ZJ/gLVy
3DqUkHb++V7cjfNrCPrGF4+kgfEmwEfyrpg3QPDBXo7lnZ4aJ+7xdqIZSZNWogIu
AmeTXSqLKcVFaNcFW8HTLisZlyNohU/+bel73bmKgj3Z9sFQl+QA6y5OtBlj+Drh
aFdDDQWilTuxyqrLrlUrbzlPgxjGYYd9Pt8EY8ERxowzF8qbBqV91EMBRO0+yhhk
Qwr7eOREW1SZEJyyIzyeQnmbSfALIWGhipwo64rgoFEVfbIeyFHlxp7+qkXaKcao
TgKZ8Upi1Kyw7GFt3LTcvhHRabYlIT8qfQgaTh/TqluCh6t6wphLv1EVLHbGiVW3
eTR4eHuwIhGJKhiZP+Xl6xPOPgm1Zx18yBeAFVBxYQ1toidNuCYrovFFSUqIoSNY
OE4H3u2Qhg90/szC9moRY9vHY0mH95eB3ydjQwW84zLgpp3Hia8DjBjZohv8iUQm
NlyHnBF7SDuiYk5+jv404o/n56GbW3P4vxAVKAUbxnuhWEi5FJD8fyNbyoi352+A
Uosmnus9gzqsJ4BoSy8llWKDuQ7/5FkYX6EI61eu0tSVgzOnexoaGgodV5cjv7n+
zlF4CuI39Z/r42Ho6mwESFzqt3SrXehnHm9gx0NnO99sh0IZEINKD/tGnayF4mIY
DIifSgxpO6LQ2oSQhPxqsRmiXQfY5fTH6hhwtEJahONdxB9JrCUg6nfzTRuPZw49
zUQHOQeD68FopQYA5W/ALXX2iO+zvLPQM4A/bd0QCndFNhAF7FtKSKMR4sNk2Ryd
v0bQyibDzZugcR63rDoVkB+uzr6uJOzVJLvKkqleUzlJz1QGcmufSQpKUSJJDWjG
4mBZzY2jAoQnKjJBh4uYNNptALwNTt41xNFX9xjPMQGBlnZu72UYk4P/m8jXV/Zy
fIvacN0a7dttvNGrkaCCublcennCOONWzmkkYHEaxxOkFiOTI6FNAp4YqQLvG7QS
NeuOgN3WltLjIahAEcVVOmnkuu3JhxWrNjse6jedBJ0Xo529hdK6Rebqrz/tYJkx
nY8FqOW885+J7PT9cFg1vBrxDjA8CrrzxvFyQPoq6W1ypL/1XyrHEbxr0I7D0cCW
xgRYC5ikdAqAi92pgxEGOIrLmE+KDpM471r7VHrQbbUAA9fcelZ+5s+kgJdPEC4U
CwTIRMPa/YxdVi9QlkwxIJ11RnKptEWoEltutuyOlcJKnBvli3UF4Y6jXXzqggIl
xDH6TziC+iQfYimw/0EASrHVOCDMHMhSVc4SIOWpZM6M31ipNpbyRD2vzyPK/0Dn
DccFep0laO83cscN9+guSd/+22N4qDYmpaoBY+thwX/GUJNCUXfydzwM13uzReN1
3yju85zWx+3nExoix8DUSe28YEpIopiyXF2uVMEK3CbiEnU1lpRe7MLreqOfKXfs
j7nEhuyoGFtF7zBJHAn9fT+yzmMHarXRSBzU9HUyn1+0jdeizQxBHlm8TWAMIids
G8JIInj04MNDQBT03M/MsIucx6GLI/O9yk+ZHDPdFt2DHkoo6SU0m4AbWBekQa8D
+MNrSWUMvW85mMnCfQFJh0NEnPpIkOolv43lbkxYTocKKG8EP+D2NHmaXhEJuH5i
YR+mkRq51rTegFLs2f7hJF/8nfhiHGs/JUaL3JwLPgDB2FXsVIoeQiy7UicK01id
nC3gi96S3x+JZtCuk2FKtIID3yYYz1sAHewz8KL4A3YXJN/BtJtmnyHjbejj64JU
9BPlY55igZzveDGL5tBxX0TrN+B+qciYffDWewnwIMfp6dgZuPhzAFZRQVwQkOCR
SJ0WjqQQ0JgCMCBKf6IFKuNTwij0tYBL5lZ0DT3bU2tNC323XTVtPUCVt8f3Hg+Y
Ov1UZcIfT5T7hQa0Wpw5Fu6b8CbMBUTsGfAezHIf0z+LJeXrE8P5XbiXlEAhqgma
yGWFuvnJ0iSQ9K7X8mhWVrKuvEsUT3oPOUoUCz4uLMyQFKQzXXakvJY/0WqkkMDv
+6Wyy9z/ZG+L65g/3T5ZEFuKENBq8w7UbGf2vT05h2QbcpTJVYOxajpmQJAfPTRk
vrQoJlGdZO/3FfN+QKxEzdmlmRgjnJVm2vXMMcWwqjODTdhZvruhrI8QmIQQZgCB
EdNoR4c+dzr86EyesE5VAxNJH6gGXlNHGn/o6bwYfQFVIp2NyIh1RJUXF9HX4g2v
UkgicykCio0jEfBgsQ7+jv8i0kMv8sdsvzrgTPx9YoThoGOiVi0gcxd1nmEz23m7
bTk842cnhpEtVSA6erpdH0C/zkl9OASx+4FqRS4CjMFPWNPz+VdhocwnzRiZAzqW
gm9zIVmEkptV+gwT5owLL2WePsbK7hw/X+VkddpB1Gq5EErssLw5zQ/Qr9DebF4S
ag7n0XJGLL+kWKnZwTSqYPTioy28BSebpk2shaEvn7AFCnaHE8DF5JyEhjwKuPZf
ErjqfsVOPqXhfN7qQHar/vbYEEZgOxU81cuU0Connj06WZae8dvrNysDcaSO9urs
pliF1vn8fQPds5qfZpDDzlVti1l5X27tdVQWDMkCkw7tFfv5keKfcJO5m7K02pI4
rbVd9HDF0NAOodeA3afqK8pVza4eUGkAAbNBwpEE4l/kDZPTvmq4RYdJbcXwsnYM
SPSuHFXFfIK9foqL5Y1wIH3Wk5p7nUO88eFGRswTZ+dF50RD6p01xeFL2Bb4LCmA
lvnHARfWVrePCcawZkeRdRTnwNf+LnEG069FUlLYgLeU1oCqIPwGKtbKaHvRR4ja
WqkkIHHK9xPRY8aWoep48lBtGI3c0A5W/g53N40BrdOJm0R0xOKwMicKMBZX7xyo
fCEVvS/a22NQPNOAwjvNOvH7MUR50RCr83KIrP55YI6gxhRa1YhADBjxSheKA4k/
LVItdU1uNcNKKNzJ0sJXkhOzElmQzUhVPePN8LyVHmu0vcYjl0Si8OFGQgs+2SAl
pIIx6DiWtF/mTKemkoX9iJ0atWpG7wmCLddHwj2RkcnGw3HXyA0gQv3zg5xr407B
NwIpzXs159H7u0lMyiFEOKRhTvqh4HgQuRyKY0h5I4odjC/2j+1TbJyrARdhPWL0
ulNkZtckx8HYMDWaoaYcPGh81yq0WwgO+/64pEWifUiXDm7WcsIOMJHcGt531TSQ
aWCvn3Lv8/IUXR2icAeJn7fxf6WpKKHOVfiFq6QdMkhu6iG8thABibgcBSMZTOGg
/0xihdWvIQ/npQvKBEvrVmR+d+2gOrDMp2qUCNVfKnJMAn9obuWtgzO5p64aJDPS
t2pDHXa8T0DZcaJZhyGPY2xsS0NOx79QFsapgrSX/eSnunlhJ7e60GfDKCxq7kvb
E26y3ijoDfgBEzQcBIfjov4VW7UA/M1A6GASJKk0e9g+VKqq2uAfkAZ5MRvAz7NU
v9URVNAhUKfacOE2FD0vfviN+GAvSEUTMHTPLz5k1AaeCkldbGCsyL3dxrvkkfBn
QZnFG31/mdguZvnk9rizbhWWd3R57D6xecHqol3MvPuRnuLMUqVb3AWTs90RtsN7
0q67FVwB+nFhL5fRxSkCDzW0vaHRXaBsi+gYMxQ2BsuoWVtyRVbZiGvNVKiL0DfY
oQ1wBzyd/uilqhoQs8zr0S1lYJqbi6Y6YIsXojdVglZ2Pna5Gnq/v6C43eG9uQra
I+G8uUhfx/V167kITafRTA5MW1VTc+yRCnh+hbjmYCzx4s3kDgVYto0bS+Rp8o/H
tHpPKRWZBQcPrwpo5ic7D8CFeCjdDJRjRglf5Kzp5GHLSBD7gS0hNyr3vCu59YPA
ZJNs6DBSy6A8YnscBos8nfelolwe0AvBYOSxmOBolB1jGpydEHYWSxR1QMziV9OF
cDxHzwwLfQtU6GmGKxiReSdTOBVXJQ9Vd+2pwY4J7vgCUiIy6hY4QvMfJYpoM7JN
HhtGPac+/ry1VWK5ZKof2+UjOJmzMMbwjDdDTnn5RKuwwmUlSZGs2nom+ZQf2KkM
f0emSNsaCrcFscnyZVJ+q/lHxoPUyx3PCI51YovZbd/xsSUlJVtYEWtaFZ75g+ln
3GBlNV5e6D0ZnTA62AFT+TkKaxobLdrRxNnQYBsJ+g7CVdSmOAIZC+iw9c/dtQ3k
BE0xE0cxidmvq+19xRSPNMTiAK1e0Rv0tClEP8w5H2lV4Jbe1Zw0/fzIN/noh233
scDxz5fAIG3xKsPlh2v5j55WY3b5ht11RQoz4xgB/xEJT72Ar/PMOFgOHgIp5B/a
vz48F5f1Mrc7AcKyCTP8kJcUF6tVLsycrivAjikSxHEK/vob3Bst4Vm1k9sPwu3z
PeErcC5ON7AkkOyaPiFnxaQVsy9dWTFI/zazx1WVy/pNEv0tvKn7VQfkWRGmskz+
7SrA36aZ29rYYYkPiirF8TSaVxS+JxYh72QFLD/vAbP5OYd1UZtTT5CjwJA+Q48a
JlBZ0imk4tjRzL2eS4wyHhIlZ/qnK+H//nrKpMkggMc5E4ARSgBl/+JJ+NBbOme3
0bHBnRfa0/s6EyvfzEa2CJi8ImsTm1GTV5LWkq6DRr4DG7WzT+hoFKvgI9+owLxF
yn11oOwTnXKYwVZb08NpKFcAD1yOnix0ovBjYJ11t+rDvOiQgL+Bgf91zkU5zsTu
Po82vvbaEgAiO4b8cBUxDdwr6eVbcitOrnXegqyE4LVdSXoyc0mBPBk4D3vx4exC
aBprOkOE2TUja73/tp1dMgncVsfUi3Hb8tlZNfDGoCJBsZBQgul2mEpJwy7H6ixe
Nk0pgAniLB0wCbT8TMZDkzN1UKwWCmJOSK8QXGjEZ9jJtDsKhVFOPyuWjDnx+Z88
NQCAKxzSSZZNUXTyEEvCxm/792Ksl7WapMVVaHgdKjhV/Ck9wA0o/gexHSZus8yI
Ku0kzbMck3UqYUGcuHpzkrM4Xk3YCeoemdeLtMBrY5jwo0Cvk1meJaLNKtLsf+9w
O/ngwsDZMWxL/ZYTe/YHFEoNoBnsF+Vvte383ZUfJ0RR5lB2mvS/GEzWqM+RTcJZ
a5q7wt2rduKeFnSlrhlk7rO9RZf2ahvK+ytPcJEcZNxdTRd0NDe5yb+9CU6xoV3q
89hgsMTWnoRHumDp/xldJbuo1LULWBqRRe5ZdZtsrIQuHSS2KWJjfLAm93Z7AcUl
MHamB4j3ORTT1OPjIh/IBN0ctNS4C28IOs3qwWsVFnkQWGxtX5GI2c8K/ujBYIQN
SL11wn7XBiZQ/zzewUk9Gqxd21O4pZblulLYaRrHHL8GiPP4NGUcrstsX5qPoKvd
rsGXs3XvZHbMYdL6HIc46gIofw638LAl5p60jixZaUfiN3fN18JVPMY+1gWXPWmM
YspXPnVdYI2n8H2q79TjBzhnoJpWB8cPOeR6+XZSUkBAFjYFhYBVLidbAMR3PvyA
9ot/cbE2wOkySyNI6g06pd2tLLngn2Z2qtiRsXhJjCyc+rmi4NdDBcw+GtPkHA+I
odeT2AJ3qFsrZk/SyEJhOfOE2mS9W/RqfCIRGhaUPwvssrgbYIZuxA8r3ouIjuaQ
msTAXf9r6BZiMQsNHQBUS48iwbu7mmztmUJ64VbN8XPHbMF77R4gTtlLomG3sOcZ
xTfX//T3+X7LWVbPkCu9xrIVaZCu4RqErxuYp8hG9zumgMI0+UfWZlbyBz4j4xbc
4DCUBMtlRhtaNF1AVpPUGl4MHZIcBD8xJBHL7Pqn5qKkzJGEFRFQ3+GYVZ2vazUu
Va5ik42Xa7wu9uiZPY0M/cOtskPOhXpB40bVP7a2Rj1OLYdL3FlkwVmIl4sZXAaS
lm8GxYLN3+t0qrDU4fhd5Hujcp+Qjc/mqWTznhvHI0N9MNoj1tbuxeBBLNIjAems
JYdzKOlVVLBosNmr/71uxxQLbiHyoaYmIVXw43m0rjzJ3W/2Zh1N4U7pOBF3xg7q
z0FIBO2w5yq40c4q6IdJ3pxqW/gTLHUZkm/knIGffm6H+ZVRA+Pml9wNuMKvO3QA
sDItqp/P6SHxVEOT3TNjZew4wl9digcGlcDytQ3ZJxJLZv+qmXRObGIcEYXzM673
XKT8oh+BKEP8ow4WO7An4tLtL6WKLKeakDtbNRjHt8fb7PVjUQtWh807Vs3jrI9o
qzXUS06N1oAkvs0YljpOlZ/FSYDJoDu9jzhgi0vtIZGAQiLDa7zxRTLEobnHpcHH
kykeZMbB91DkiY98mCWeb8Pu2w9C51IZv0L8kmBbBGLOpSUuwqt0pCgcFzxjR7IF
lj4LU4LjMVFw7Mwx7YE2rcFku+OBPbRJxDcLX5n5Loedh20IE/YggnMDroc1zl3x
IzFMqcXH6hCdGjVSaQeD4EKRxYnaL0EIERg7VnzQEpYx86pD38qmg2pmcuiy4d7M
OdLsTu2nQHn+OuRqs0Il7nvq2lu0k5ApvBX2o4dQ3vrX1EZzHPAlEtsO9bVcB51I
qJxxYgQwynqlMrqVQ6zTsz7uz09cXE77U5yKaLlAkmW5exidddsEg0p1z93wkOnc
1SOoLADTGB5+OI5vvE2OE7UtN6+uDi6qtMXO8vH6lFDZMq9yMFvdlc39yCFbcfD3
y34mJndRRc4z7jTdcwyS7//wrLaWBki4BSARxadrqjEjRNUADYY8iKZ0fQQdo+oH
GyAgNExeobqZv/GV1e6ACVmyDoldhCiOCesUiRwKQhbBy9EDDjsx9o6DKdGGgYJ5
lm+sGOGQMEx5Ra/wItYhYqn2IQSx6g9al7QI2Lu3pL0r0vIcIqIoA/fmWN4C6CwN
fz/sBpAKyVRzrhtcP3GJX+pSVB1Hfs68KoUUZEA/kVgg14diUtO7+zeslttU3unR
bCMRs5TGHakFDacEqKPtSz6Fw93dytRseuehRn9j7litqwl43TaoxpfDevOL+One
S4JrxHpFq3tDlzxCy7ZeXNK4w/QXSltiNj+Qn9l+Uo9zOiFIUnyAgYve5xSKYlTo
X4UxTk4hGeH/ddWfg8doyolFcmPNJydI8sgtspdGdxc6ea4p8KN+y5x6hVLovYls
1eYmfW2Y+KMNKNkTeblg3w1+T3d+JdGvUKbWcIVPmIaXzvzgQFzzuMqE8640RG+Z
R10wiUadovsSqz9m4FKQCjJNi+nBGnm6nel8jZSB4Fsb4S5PtGZQD++MAc8EntHr
hkbEtb/S8l0qMdZ0G3WaLEP6+HgOdV2Ztkg1H7w+XFwBHNgnSTVaHFbCBJ7CTBKH
nAJtJeqStiKS1svYJ8O6HE/gki/414OslC+EIT8x+6rm05KtDP+s1G0HPwEkLWx9
+NPjMYkfKBrtPgBwC+4+Lje6EqbuygZU6WpYMNDlzEEV3ldJSYwAUpNvBcAeaufD
6NLbTfMCT48epKAfgVOiUrcPYo/Q4WvI7PCZFOxs6Nn+K5FbTvseJvNzlPUUq0Bw
vbP8QNFpmdZXyt03oaM3c6SbggD0lA8+SJQMhhh5kTfWStYxDq3jBXrpkV6DjCDn
UxDL4ak8KB8k2w4goYEPAm6xiT75SPIbTrVi0zsOVGrLBFXvFipD95Mv7BxCQwlg
5SOD9ABadujJXDn8xC0fQKLdop/sbtw92hpBsmfRK5ZZVeRiKW1mQc/Mgpqaz94e
nDTv9UrTnwcWKpax04olgEr2LOsBB94MkejcDaj0SjSlT/0bbDGR4hZ06gDngj0r
W66IFRyEJIyG6kD/a59lAssVVlzbxfYUn1MT4dZ8YdTjLX43xTSoZ3uxmuTlIlZw
hHrqm8aV8J8ZEE97gp05CBXObmYwF9oirFdBf16BbI0viAvcunISOIkelCwASINX
xhT0Cs9q9XguPnB6fwA43FVDblnxKMRG87Wo+BywuVf4fwC33SdCJ7yNIBIy5LPF
TKNl3EG7Mkamo0ty80WPXLup+X6btCskD/bPs3qgiJBRD14Cfhp+BB1zHoNir7z+
Rwb0KOi6hEYy3oQyF0kZr7v354Uj16rC7jeQNxjEVQMSLP7jlhPeIBxipxRJ9rX6
iaA6IgeLpvDFIAuG40dJi5KEn4nr4+6BZpnTJzl/UubHD1mejYBwDilwOG7UXbSr
h0OGvRDabAnTa2i/6Bu0WxBJYTZJY2r3BhzckPbM7udfZx9LnphnVEKn1b9NK1vO
cnXbfnuGqhbIXmyHDxawjQ/NOIn5hfZrzQEbCo9TwRd/CbkGqkIzUvf1BIoGFhVk
s127o0woXf7Pz+NBZEar01Aq10kMlWsoSyDm8tF/4ntRIqw1LQa/wAOc532rN7lw
28ePHOMCiG/ExyGSubpPmVa0Np1I7G/jmzHyDG3ivgPNbzLhWGVpB/BrIHn1C/Yo
7czxm8yvY4tNSZJCTWzsiOeT2s5py0d3lU2bW8yXtGCOq2AeYvKix8x77TbEqdLF
mIAdfgqtvEE/jzx+kbDHzdld5DaxXoK3qplDZqtFO8UhGaVqON2ANRWln17XiUHz
YODXCfkqs7Xpjo1e7b9W7md1GK21ojwodjHnRJJhnuXNY7Hf3IWfAfHUdgZkyNQY
uukSYvl5cgAf5gQ/FgRPgm7pwaHtkxZGwG1zKwxkMM65tYU088lFB4Y8dXQsLVYu
YSa/Df1DurzipsTEv9rn26D6Yl1lE8hFbeZQTYc54kZQZ1CTI3CvHEUj95K04FBh
6yq9wmEJxR3DA4UmWNCNS6iRygtIMqthZKPEePmImVuFSrF0g6TlHUarBMNrD+DM
iomjGxjSng/3RBb/Y+Sm8qwXwBIFTVAJqh//xPVwTVYSI2FcGka4Teplo29Qr2hc
zNaQ85+Awa+8EuDoxfoh+E1ge9axmpaMNng1tGhwNcY/qNZupLQ42TmJJDoYO3Ib
V3O+wEUOva1KYTkibJSVGHo6IXAFsU4TxNDvQJzz8BVa3YMk6nNd0KCBd7epAf83
hyO8YHVLAez5hf6e4ZBMz8dbyH2p3xh+IMGzHdKf3mH+ccYptHrUR2AiGDxst9vk
Z29qiXBt1Ez23kuEvSZ7f1miOdFw6NYKqs0RXYxRDAG8s1JS+UZl1RzYr6c4DV+2
l+fW5f/1CXvNeHWx2rACCqJiwbIBjENbt+32AzQH8x4IHatollYSTgcfPSxChqu6
jhnrgrhplz0BaFGhQVo9SPx6i/2os6S9JZUSZ8hFtoiSNn/tDn84BF/1iPh4HP5v
FLkiyju/ijAVqWyPahNTxljiqB4wyyOqe+/a7Se6GKorpl3F/nBWKV4dHAumyLlG
Ta9736aDI+kXXnJU+H1c+GXvBOXlgu+JfU7fYMiZzz66pALRpMJT9bjiZUsL1kD4
iVSb8ArtM2j7YL8tAHp24Bvx+hvgw6VvkuCh2iOnDrMo9CAhUmM2ydyDo4pG9wtW
80V+gxG386b6RVU8Egujkol4sWgKY0PU4XDMkwiHJV+IFlFFIALvRShFDvUXSMJV
5Hbk0nuE4yXHUYRI33WJu6WflJ+NjMF50D45LTHx6X6McizlZMcss4/nWWgY+fkG
5uUdRwQZaJtaGy+uSxK4CoRjJK25kqjsFPtp0X86lUbIO2K1sL74Fz4GHRJTZ2OJ
GkW5m6uoNyYY3Q+w792utsHkcz+ppFhh+C0BORRW/unbMPAByaxsRVH8GIzE5D+M
MIoXRO9wCsMGMlLH0k/u49btR+fO/sAdHkH9yoXSmKyAaa/MRTGt3QBJTDgVFZ0K
YDqP3wt2g9pnCcacGVy2fH3d5RQNclkRu2JJOuB22HElGoZxu+Gv9piHBEbY9T0T
Gum0tKizw0YKPcrrzVNC63KSZjo85JAijg8xWo6/SXAgvXvCpPGQxyB3w/bJ5HR+
anUfGdHfy53ifAO44zx9SkQXpbDCzG43Sb6Z6qxx7ddj5r6uMd0zAMzllL3cbIUA
vRZzlQu7rvliWM+siyLWeVoSodxVQewkpzXXXi6KGylxRHq1UNdV3delObvVsguO
k2f9y05zZQjW6h5FspqD7zujRAxGcVldwyFLRRVU8qbebqz640/W/n6w8UgJX6uW
mA4yX/Wp7TSfcwLL4WgPx0Q9PFffekG4ruv9/RAsi1UqQR2HgGh2ID0qE3KDOROl
ewB3SV+9UpNoh+VNjljEBlHaleKs/MLy0rJwXnL45llNdpyFhqJJhs1F5qEef2Yj
4wlVBairtOxUUOwYBw2D5VhvKECVaZsPxH2uZwd06+EK+Sv2sdwOo0UvHgZoHpLS
qXarH2BOiReN219CE+6+WbmqOuMLof+y9Muy6T15xk9F9bzsY9vgT4VLc5uGtVhk
udBwB3ktKGg2Brzj7dYCAo+ByufCvlR/SQFkZbn90e41PdCpAtszBs1kgxsiLdko
IG5VFazb16tKMsZEyebPejkKpfZG3yEC18/k8TtodxNbZJeD+Bll6A0XMqRNMZef
Xo9wPlLjClvU3hyGjlM5bPGN3MgjEguhdLbooAevncEy+qNPzGcU5cMSb2AgRxgC
BCsgwqHb9dBX+mBHGhvrmcfIy/RX2p7HMLBinOhIe0U9lkhfsoLPpFflckmLHu4a
0LX9UgTsnSvthOyfIqeNdvA4a6x8KCM178Yrr8nhxOlIUFVJs266zciDEIxAeRZj
64THmAWKABuRHkjAZQjmZ8Z8TLv4y5UmuUfngifJB3xxwOP+dbY+elbS7xtaPErI
/6kAzsN3xku6zs1lBFzGPg+VH6uncOLKuXleW5NVNKWBn7gt4tJpO9lvjNBanFaB
7HVValaLYfhxvdUyrd40HxKZ4YYebZZwemp6WPIGVUsGj852OF8/dLlNy1YGcTzz
onzv0J8GH/wsf+thY96OsUfT7Mr265gmxSFYTrLFYNcEH1pIRPGaYXzxyirhUo48
fXuFFd07eX5ahpKxdlbhSyBAt9qtgW0HIG57S0L+k/h7bpQTajZxUe/BqG7OBU/+
pp8hHZDDRonNiqFaEr2G9QkZHHZCGmw9vSEtYypDhtgEpucCvWIsR2qzu6i8yrSL
dsle6dZlKCWLKZATOdPJ2pYcMaEX6Uj2Ry96sOi1WH6hiKHfb63uF9B347rqBtZ7
O2xVcIxleC0Qqbtw1LuGTkEO9GRWvmZUQHKWWc5eyoSmLv3soixHFqD6Hsu3l6lk
S4lXgu6McmWyfqpVi2CFVnklOA7sOFCgXSBRbv+KSMkxX3WsMllKOVjvfO1P5xSh
62F4EEtemUQ1/nBStZrSmmzQkCi8JZZvA3Dcq2gZJws78EsSaltJUJ3t4lUuIQyT
Nj6fKSlfZRCy8p8f4jJBk8yIK7RkRpgWZX0Nt3aw3sTwIBzZm43XFvF6H8HIFKp1
mx/yqzblZPcNUW8CjQJ3xNHUrDYNGGaPd1HTx1XagKJzqGlAnQ7/UL7ZA/ZzkytA
HhvRNjHGCPOdGG6TMIactx0sENa4NP0AyANLo1a5UmdPZlev13IerjPXrTNAdqEW
7P9PKl8LMxim5QNvzfVH/XHn1AjSzXCJb62/+Fcurw4dVIGoPP/eGqBUefM9XLVM
x1EIy/j4fbXO4PtI+IAjDfUu8Y3NjOrGnbIlBp/f2zpaeHc8g4nRjYVn2BbJ2QPf
yU7UA8z7BQYQEcp/riDfMvrbTjRQs8snkLzfuP//kUdErAaPEtHxMjyVXXybazxt
AEdPVp929Lo/J2K5rDwLdhD0cz/LV3pCcOsikDdWMqM/h5jdbEHKvQuS5yc6Yrm4
02dSHb1gSKmhn4QgbgsYlrUr3kiuwi2xPehtJALegFx/KaTN1rmMQThF5BzH6veC
4JkFZcQOlniyKawxGLgM2nTI/NcE1EYAnVpTVjP3G/8iWH2ijPtdStsLyHDdld49
mRkzo484UUM347Xd4/h01TNbNZd8EviLKdZNC/DFkcPVkmATUdpJvdJsKqFFyBJ0
Fo4W5juZZ375ySfPKyEPfCjsSjhrfc3LaJ2YGZ9ulsc+W+vU2z0OkMqIQa2YJp6Y
2ygf85aGZIYz5EdELdqApSg+1b1qlRjcqXSO5SAdY8c3agdXMolS3AmQGlOvOQsL
Oqr3Oz2dinmkZUFmSCAFIykS+vppR8aGPFtXPFeSzzeRjJLAySXRPh2E6TKwzoRN
lB8nHlGCX7YhCH3CnlbZ5oPWN4vZqzQID9BeFSn7Y3R1aXV6SwLkRGoUNAIX0zjA
`pragma protect end_protected

`endif // GUARD_SVT_EXCEPTION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mon1B0TOZ/9z8Kmmuwm738DIqYXNYTAZPNgr/sM4ips6OjcyrLR5KtAOkM7qotVs
UxBCj9Nz/8sUltAiahbSZCt7guJr6emNhAIdoBkDt6B740SBkcZvfQHt2ncBqbky
8BGEQ5lzpTRR5tG3M7fOifJvLsxsg5OpTrzKeTXYXr0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11066     )
lgJ+GVQjHj9eA4cOSFTxkDh1Mpu4P14EJXyGjVY0vMG/+5I4eEGf04wC5XHSpUF6
3afRPPGvHKfB5xbzdswJi/1dzJaKpVtMSpO/5YlYMVDA3VcSh48bKutGbot44cSh
`pragma protect end_protected
