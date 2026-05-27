
`ifndef GUARD_SVT_SPI_STATUS_REGISTER_SV
`define GUARD_SVT_SPI_STATUS_REGISTER_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is the SPI VIP SPISR (SPI Status Register) class.
 */
class svt_spi_status_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Mode fault flag, this bit is set if SS pin becomes low, when SPI is master and MODFEN is set. */
  bit modf = 0;

  /** This bit indicates that transmit data register is empty. */
  bit sptef = 0;

  /** This bit is set after received data byte is transferred into data register. */
  bit spif = 0;

  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_status_register)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the status.
   */
  extern function new(string name = "svt_spi_status_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_status_register)
  `svt_data_member_end(svt_spi_status_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_status_register.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this status object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);


`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the exception contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val A <i>ref</i> argument used to return the current value of the property,
   * expressed as a 1024 bit quantity. When returning a string value each character
   * requires 8 bits so returned strings must be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The component will then store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * construction is taken care of automatically by the command interface. If the <b>prop_name</b>
   * argument does not match a property of the class, or it matches a sub-object of the class,
   * or if the <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val The value to assign to the property, expressed as a 1024 bit quantity.
   * When assigning a string value each character requires 8 bits so assigned strings must
   * be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  //----------------------------------------------------------------------------
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
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_status_register)
  `vmm_class_factory(svt_spi_status_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JYS/tPG21b4y2Ea+FDduXIk2jZXwbccMNoNUQD5mhbazOfWH87d8MDAJq8lvgJCm
eDrL9+3xoR4M9zniSPRUvpfTqtyoQrGgQK8N6K3lwaVGfQzjqS1Sa95efaOqFDuO
04Mu0WbAzmjhtl9JGiNLGUh8Br3GDJE40wAgMUXVec4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 587       )
M5fwHhOUpFYOUZMbm5E8/lM8UcIu3HtYooOaBbI3mIWrhDb8iZTG2qvQcOgv13bm
sUUd4JEKQp/nlOxyq/9j02OzmlOUVcdvmIwUc03pwIt0urnAJxPjDfLGXz+AIiKQ
KK3vmdfumqcj7d1Z2BbNztpx+dM5SjdLTtxgk8Zw48dPnPmmqT2WGYfM9ZTAYusE
A7JPkdDbdgN0rHcMnrZSluIpkkmdqURJ2uRCFl/BlQaibA/0i6dpNjVbzsuyAxeO
1FYRjwPW8zp6LTOe0naLcxS2vn3RM5g+o3RwDUHUyQxf2AANB8xn95bkPEd1HbLr
AMC+/BQAFuByr5vNq6cckbBTl8zqo1K+bzmCwy3EJEQ909CXMVce1BK6a7fIG3yX
G6X4fyfJvJYIcC8chnMVFzZUBEdDMaaTaGAyPn44c4aV7+UAv+x2AeBPcplqlZ8G
5e2n80vSZ2JS6i7LI5bxLj0okNS6h5FYhcN8bnxnhtv3+k7OFo4298RFz4dEI+Qr
wLMYuPETilPlBIpAAvvYK3ScZdBYnzJSUz0tf4sq94ZlwEtK7OaRxkyOL46TXGa6
DeJDGx1TCc5u++zViKR1CeJje9Q2+sWzWnTlEvKujrpBirAFTPKh576mfNZXmlEz
6xB6mzvDBu/vQC6z3aLXMU25LswmqfA8WyW0nrtFN1cGwjORsa3DrAgnXQtBTHIM
cboqtOmhaDvMS0k175AmZERBnU2Gc2nXF/rxrBmVtHRnY5qossfSyhPhiTx3HmHA
fNeliuREqMYwfY3Xe/5zpQ==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UTy3MvGkNhwkcHvd81PUUt5oRwJLAIdymwVqyBY5ZC5F4L6A3q7aA+2bd3tDlEs/
yl3PHPE7sAgTAMKnwnEP9mpmsKxJoSw5Q0tZGW0CYh6DMkeTQDC6J68Wnc1Yuc3d
dj37c1m0I38WcVzpEgujrtvBjxbGccpiQP9DDpOOPNk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7688      )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_STATUS_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CyL3RGkRyXaloPdSEirslSleIsnrzLzQ6glnwm2SpabqvqjoHQLuzoVtaGJiGwSO
Zg0lKHCoP5QmQ85KX+At6Q9zYHahGKxZZA+P3L05o28XdqnFd1UpfG6HdyJ20yDq
0jAtzvz7IjpEN3GH0jRARTiqFy7b0f6lkgKPIbXf8uE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7771      )
qHADGIxli1CwGudG8EWD7uyDCDHeWtvpk4YIjUn/Xlmb730+63PDYzwFW9F0axwH
qJndTLm3EosKTqqvsFSMZZDoesMgdZ6q5+pzZhiMFoS9B3UEa3kMdSL1zxLDQ8Lm
`pragma protect end_protected
