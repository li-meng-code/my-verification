
`ifndef GUARD_SVT_SPI_SERVICE_SV
`define GUARD_SVT_SPI_SERVICE_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 * This class defines the service request transaction items that can be
 * triggered from SPI Master in SPI_FLASH mode. 
 */
class svt_spi_service extends `SVT_TRANSACTION_TYPE;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Handle to configuration, available for use by constraints. */ 
  svt_spi_configuration cfg = null;

  /** Processing status for the transaction. */ 
  status_enum status = INITIAL;

  /** This variable defines the type of service command to the Link. */
  rand svt_spi_types::service_type_enum service_type = svt_spi_types::POWER_UP;

  /** 
   * This is the weight controlling variable which determines how often <br/>
   * the RANDOM value for DQS initialize as ACTIVE HIGH is chosen. <br/>
   * This is applicable in Slave Devices Only. <br/>
   * This is currently supported in JEDEC Profile 2.0 Generic Part Numbers <br/>
   * when svt_spi_mem_mode_register_configuration::enable_multi_factor_wait_cycle_latency is enabled. <br/>
   * The Max supported value is 100 and value should be multiple of 10.
   */
  rand int multi_factor_wait_cycle_latency_wt = 50;

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Constraints
  //----------------------------------------------------------------------------

  /**
   * Valid ranges constraints insure that the transaction settings are supported
   * by the spi_svt components.
   */
  constraint valid_ranges {
    if(service_type == svt_spi_types::MULTI_FACTOR_WAIT_CYCLE_LATENCY_WT) {
      multi_factor_wait_cycle_latency_wt inside {[0:100]} ;
      multi_factor_wait_cycle_latency_wt%10 == 0;
    }
    else
      multi_factor_wait_cycle_latency_wt == 0;  
  }

  constraint reasonable_behavior_type
  {
   
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_service)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the transaction.
   */
  extern function new(string name = "svt_spi_service");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_service)
    `svt_field_object(cfg, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_service)

  //----------------------------------------------------------------------------
  /**
   * Performs setup actions required before randomization of the class.
   */
  extern function void pre_randomize();

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   *
   * @param on_off Indicates whether constraint_mode for reasonable constraints
   * should be enabled (1) or disabled (0).
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_service.
   */
  extern virtual function vmm_data do_allocate();
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind.
   * Differences are placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs.
   *
   * @param rhs Object to be compared against.
   * @param comparer `SVT_XVM(comparer) instance used to accomplish the compare.
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this transaction object.
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

`else
  // ----------------------------------------------------------------------------
  /**
   * Packs object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_pack (`SVT_XVM(packer) packer);

  // ----------------------------------------------------------------------------
  /**
   * Unpacks object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_unpack (`SVT_XVM(packer) packer);
  
`endif
  
  //----------------------------------------------------------------------------
  /**
   * Returns a string (with no line feeds) that reports the essential contents
   * of the transaction generally necessary to uniquely identify that transaction.
   *
   * @param prefix (Optional: default = "") The string given in this argument
   * becomes the first item listed in the value returned. It is intended to be
   * used to identify the component (or other source) that requested this string.
   * This argument should be limited to 32 characters or less (to accommodate the
   * fixed column widths in the returned string). If more than 32 characters are
   * supplied, only the first 32 characters are used.
   * @param hdr_only (Optional: default = 0) If this argument is supplied, and
   * is '1', the function returns a 3-line table header string, which indicates
   * which transaction data appears in the subsequent columns. If this argument is
   * '1', the <b>prefix</b> argument becomes the column label for the first header
   * column (still subject to the 32 character limit).
   */
  extern virtual function string psdisplay_short(string prefix = "", bit hdr_only = 0);

  //----------------------------------------------------------------------------
  /**
   * Returns a concise string (32 characters or less) that gives a concise
   * description of the data transaction. Can be used to represent the currently
   * processed data transaction via a signal.
   */
  extern virtual function string psdisplay_concise();

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
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  //----------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

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
  `vmm_typename(svt_spi_service)
  `vmm_class_factory(svt_spi_service)
`endif

  // ---------------------------------------------------------------------------
endclass

//------------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
`vmm_channel(svt_spi_service)
`vmm_atomic_gen(svt_spi_service, "VMM (Atomic) Generator for svt_spi_service data objects")
`vmm_scenario_gen(svt_spi_service, "VMM (Scenario) Generator for svt_spi_service data objects")
`SVT_TRANSACTION_MS_SCENARIO(svt_spi_service)   
`else

// Declare a sequencer for this transaction
`SVT_SEQUENCER_DECL(svt_spi_service, svt_spi_configuration)

`endif

// =============================================================================
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dB+Q69+pDaBF+JbX1sE1NTMbkSJLuk62Lf1f8Q+N9fjTtA6Z2Zz1Qac/FRi2w9qD
hZqvhDsAEkD7UcnT8ZcyPb33hU5pHQtkqStb5tcwf7gM6kJF6jNqxZG6S7ujYX06
aJZeCsTxku0oVJWQ/fPEJNeHdyj8E7ddxXfNiMRPEw8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1227      )
r2SrPFXqXp6ux3sF9qCoKhaD2TLusykywEOudTDXzErP93GIxYvEaKBix2mRMZWu
DwsGe8NmTqYECsDiJRq1SDFtsn31WvA2I8fC+/SUqxkGbhWzuiVayMZbW3jg0MeJ
lrT5TVD7chjmR3mMk4xQ9szNrCoi2TR3u5yjqQpefCaTzCC93YhkecwwhQHVJESi
TFedSiAUf+53ZEPvRnbkVtRvLgGwgNTx/ruj/FYfZAjqgfo77EroXJ+zcFAgjmhs
qS/DDxwmEA4pgHEgGghq768hX62YfEFmcb6RzetyG0palpNiyEbtCPFs37fIAsGq
Kb6As5om7XWN3BQwscg+1RywI0L6FtoNKzIeOICX/0imPBIk6oYHJf1eBp06YgjF
wihTdJYLm8UeDhPeMzuLGmjpH1lUczp550dZbPtV3RqFQOBTo0LoJ6dppIU/PlYV
NZSA63pxl5Vxc6SbI/yWWySoIBK0XhZRvRYwcWnd9RoBDBoZD8ym4SaZa/vLpq7q
vdvkE0FoAkYu4VK6d47L/1QIQOnqMOhoebEOE3Oq0XDB2LmogOl4CGJNUM+9+4r6
X09y00wGF3dEV6pR9uHXLg8U6VUKfI49Waw5f2RlXhepC6IR0uaNoS58dsUudIwz
7bfubJSsHCPrhowUw6WICwJ2ZNrccPsmYPsVU7MSuZ8BfB65ntlZN6O8gIgFjXTc
NYMGerr9QeSa9gpabqcU8CWDFt6lEwUhCeN64B5kjWE0e8jpCrLWK4aQZOWwrKiA
R5kvS3VnXY+EWbfOSk9/iQNVg8hGnqz3tXXqaO/1/K6bWR+39c+T0GLXZlcSmSrV
rjvKaoeCQit51t066My/X6BQuuc53YcrMaUAfNSOlHWu0CVFuNszoN1vuOQ/Xsdb
FsemFxAYxU/q3beE90Mea8EhmPAF0V76LzMErjoD3PnBRZyxvd5panwBFFaj6GjJ
Yb8F9uzG6OteiP+coNWEecUAygji4j7VVaY+bQbXs0GSiht1JuB+sBZprlW5KUyY
xs3XiZKw98s/ML73BEndZCgRttW3le0RT9ZcZ/vdkLmFHIddhZeDrDkKSP0AJfjY
lcazlwoq9q1R/RVEvysD7d1lwTnsddd3Mwu65FT30nzj8rUbb7nTXSd1Cxw3hO7s
otJIukML79CFwqaNKd41JaFM7MKNK67h77yHUIKdu/1GrME0H5jBfVhTK04+JIOz
Iub1Boc2vt8dyLo9RUroILHx5QI5DmKamRnXR1Liandqw7lF3ASZF3xp+pJyAhGh
Ebq/+p03RG5Pxhrl7BskuE6B7OxO1n2/aLsaViiO93g8DGej6E4Ithhg2OB4KpCo
+QhuzSvLDn+409XmfeEfCgcm+EKppsCUjgGOgjU7iSFtVlLjVp0xZxRjs3qRbPfs
lIGU8e+YcmeWV+3Ao/CDRiVm3c0OdjkFn3sKOWIZRDteiqzWnkUBpKK/U8Zx9k6l
cCj9Ir9SPUQ7nVFvp+10obTZ6YdhNtyp0xit1fmtkRvnO3qk1r9o7S93wwL4V1bs
dVXfhgWRJLH5ZA8j1J52STSUEpRru0N37BZNUzmrGJPC8YKHlctq2WLQCaeQKtpA
UNQcb7cQsuDt3f4LpLM3NRG+5TiqIi+pmRXNAnZdMZE=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ViEsWw5ZNeMd2OKmjAMeDqZYis5mCa930G1AGXatuPhafmOCKNCel2OtcLPlik90
6rcyooM3pZ6VGjTowOEKCSRvmQOPv5D3Zh4zWLQGwk7yCxkWeWhy6SPnjymvvW4o
M0HVAh/GRYvPc/nlxJfPbpKF0pSdhKdiIsLx1gMZLxI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 15325     )
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
HkDgP8A047dv3iqIjG0eq1duCqvHV4R+gFUpdZZjN+6ynFElWR1gCTQ2TgKBtG4I
iQN0P9RBekZH2yVs+09RCo61l5qjIX6Sc6y++4t7Tb4tPklG7QVu1SDAUZl6SAE3
zhi/1ica5OnWWUy49Z5iibEn/Evv5i35yBS47lHKLHzMtSxK4yYPKOXVamALvrZo
ufIgGHUk7T6OfJ/+jIs5UijdJfQ4dfptv9Lc8/x1PUvfy6ZlDc+d6FY+4qIlPBDU
zRewNBL7ILN41JAbWh09hu0slxUTDEjNhaw+Zkk/2YH6vExNSIBnSXkgUAGpBBex
X0HeGrJ/mz0ICIZrGga/QegN2fphW1z0Iq85tCTV7sYSpQjHIbe081jXPnPQQjzB
gBJU78PRgH2A9Wm6Fc6Hd273nCgMXRN0RcWaXijoKC1N4lRArc8jVSVxK98i6FRh
0Um+OPKQ3YP9JdmyHjH8Rq7te+prMDbtYnilZFZQu+zDsWaXyQ0hLN8MOv17cjeM
yse9FFEPP6w0/kjUfzFbeptltLo4mz0W80FsVnkQFUKlEVl+m3uZ0kiDlC6DGwXq
jRg0hqt4246UsCxq0kwDDYg2Ia3PDzbW3BdDcvVBd4V9PVbUT1iEFBSfauZiYmiO
EXu/bj3l2etiZxeH8mS0hrZNuLMwSjWT13Z6gRLeWfOaZM03jpXyra5ERSpskqHF
7LZmt4R31i61LFRp5GD6vQ0iHMDOK+OU72am73yi8hcMCB07aSzkon2lIpcOaFU6
56fHuo0ZOEi0sJ1CQqODDH7398hlHk5LW0ld5sZYRRSVsvb/l6mc5ghJypvpXwQU
norq4csUkdpwRij7imZcA6eA8Sys6vvgq++2HBjf/hsSh1DYFZciuFXP74h621uI
w0oJO3id+kxZ7RsDh5zdV4kdABFlnI56oWy1e5yVZzCX2xP/pmp/wHbchb+F2vQk
Z3raXhKZlQDuqC52Sr3WlfvU3z3NlP0EmaicWYcF4C487vbIR6nLUERAYJ64QGAZ
9ZUpN3qF3R+aTeG0gUEL6fwVvpCWd9n+mgVGu5aqWoiFOf7hEx+FS/jFTSLl4dpt
FOTe5JM5g1fMU5pnMNUf7p0sp0VB53+gn4+4K+ySFnN/4P91gRf3lc4IH3yuLp0b
MSfZZZJfMPIuxVPYys3pnfifU49cuFr6FfysXCfWTbh0riaZkvNQs8AaVxvqI9uL
HjvA0MYMJCis3FTUk2zTDLF4vT2UdX+NQ3k+LjCAUfY7HY1NgoKW4Wc83HYAiN33
QQBy+raW4CcATlMsJmvUhXwcdJKB8UZ541HCsu1UGOV09uOOGbIeH6BDX3mhk08Z
dB1c8VuylKxfXvLSZ87941Y/37rzA9SsmpGh2a34zrgEccz92lTCZrWkL2/ar9Bz
rHZRPSLEfdq2NcFScpCraO42Jcy4xKMA2p/FZq69XJiDrL7sWF1+lXYn08rQiZli
9N7hkST/QtEmmVDAHkTmM8XsKWBdmtFUTqee+4a0YhRWc8jTC8McnaCwSjrqstar
C10/bXc91czp01sCQkh9m4WY16EGyUgPU9wuVVy4IcDCyPbM/1PLTAQGNcoLmpW0
cs2QlOKE0RaqKaPsnMJXmgfSD323EozoQD5NL6yCWqCKPrySI06hOkIZL5gnSQ4l
zRVoFnbRtVe17lfikpAtcI9p9/Rqjgyi3SXv8rsbpBXzgADK3Nx8ql/Z4U45RapL
9L/tpwHtxfQGsQHfvnmff2gmJ/ctjOHspJERGIRUcf/UMeHKMX8kRet/YcpFCdHc
eImxhGbylMuCeQ6yIqaH6EnyZQGjYo2lo+ZQQ6iBSHKyAiVZKB5u97PN7sZgNgHu
rSWKcBqFXW0Y/hp6Um7v2vz34yJJCsYY1dz+GRNHUSuNZ+yEtc3HGaiSloF/j/9I
YvftV2KmX3+mUBtX4lG1j6JzL0SkxdHw4lJxgy7q4wrpZ2q/BSlWbIHPj455PcRv
zrQ7Un/5jMVMFIuSUBbTvF6gAoCyPVBYLlFMm5oJKvOkwOt/NEM7bwaEY0JTkr+j
WmnFIQhi5ZiNqictyklPr1/IRo6Qfdd776Hmoxrz6KyOVdCx78sVVvhOJiJwc2us
+0LaS6Hv9tEepuw57chYLpm1C3EJP3emewaejwmQBSZfTdNsCtMf5XrTtnOmmTTS
jfjYBSrbek9qbnmpViG+nSjAaHDIklUkMm0tSBBmlxgNEBqd3AJiOQiM1UTea8IN
T5PvmWwRBnN4HvrL3zRUwYDz53OwchNLcEnN3DGZLZyI1PAfv1IjOzyOv0BJzJzV
bzYE6IDL4I8XsgG336CBX7D0gB1iTRPAnd5Sn5Vl31SDiRvLld0DqD38zrd/LylB
jNhZTv7wnRV8ljM0KyZ2P/3yTobufbwmq6xHA66VluNFqTg0oMu+161VuYqRZJhP
YQiGs1XcwSrE+6oCW3DRWoBWx1+yf5feHfRk2elNowcjGKklAF95ye5bvTHbJaZP
tOZrJVKLcPS9Bw8XL2dietldF1eHgBqm2rHbkEYyc7OEHhIgkUmMrkR6IBA+8FlK
mFQsMc49vUMtQfhODNFV6mS81k/z4/quVpF0EryftJOrOUPi287vifdB3Hwoq1zp
ixyGONy7JJ+fmTJYQ5ROGVDsCdr+O1ZPk5D/qKEsSoJNVbD+W5mNLeiYpTkwWf55
lGrV44XjFDXys9wsGokWWQOmTNCpIquT7hXs+GmT/vUabsRZ2vipTf24E/FZYBlm
kiPmbcfwysSGKxE9RYvGDWiCApIW9WL43eLd81AW1CMgcRic9Wtvh9BbFKlNsBnQ
MR8S5VLeKm2w1v6gpO8Ck4SEpp2Alx9kWAHtHNrVbte6+KeZNvXqupQ2HfjK8SQY
+cXjoYMXPJR3o8cL1F3SFe1N+bKDc3gHz65gdSDJYzfdDQ/A0KPGLX1ybpiNz4+2
Obow7NpdmlSZCQQdyTlnycM40me4DaNRChj/imvnaabjCaPM9j1Tefpz0GGHAvKV
awvi5Ua8XPxYvEydOxSXoQXIX5HpTsKsw1B4RTO2+YE8fTMhpHmxZtywRA0T5a7g
3HOBL5xJcEHALuLGGX4vbLK8L42HHQONOogciwhOt3Nu4XNWwqxk++GYtNi7AN5s
q8/EwdJ7wSpHjtEmWHOzZr3PLMSTZK6ARwTNffi2p/oGxS4Q6JQ32kZ/TuMznhLW
2sLaUPM9R++3iH6d42qXzTbg8OK0dPgp9yJBQ+BTP3GThavHXzh6R0gG2DUz+S67
T960vAewa+SVH7+ZF73EN8UyCPCLyDHPfVgJ0+3W+gq+lLs5QO2VkMAdDEnxkGdT
SvdBc+PG7rTdqHPMkN5TPxOqCxt6ty7vgHhrfrWsMCNoUQR8mb9/7nwbsdubkWa/
vWVysJ3Z/ufHNMaCfdqynlqNh8vj37QqYjKuT0kMfB/04fKeDA3s2XzNtZStW952
W070YZNM0WjiaySzyP/JOnnp1QPW85G+7/RFVSdDxMPMD0v+HyvQ4hmw3GXpxwnd
QOQ1PJ/oKDhLuA2x/rnFiLw9Qt2cPqb0HWfyvbJc73DHEFPKW4fAwrP/MugY5463
/jnOeOzhL8wzergd/iBorgeKTaIIhuo/m9Bj1IAn1M1vXuIXkYKGgNtQ0jwQjWJl
Vh92i+GKHNZwe2vKhIiOc0VtCCBpJwEPl2slg/5MeMGj+LaRjzaNGKn+wIZvi7CO
0yn4a6hxln2kT2WCXaeMdKnX6c1z0eL7QIxQKgpSn1oyvHwur9AyJHe32Vyq+pCm
uIsxei13/DWodK5qI/5HsTUj7YTcwitm3TMa+kTLz8+LaHYEj3F6euYxnjqGyqtO
HeY78ICOoiNkQrVAocchjWPMJ/Efb8e/88iezDyD5ebfDfxkVINiMK3Vsyu3JCsX
uWXAuKpSdn0j8r94gz0dYnEDLZoV0sHOFOy0WElkaQrpejo3w1HptRevQNPUlpJ0
84hTb5YmzHtNZzrOsmWldxDDzF8PTsoDmc+aArolyiNHuDSrW/zbhPkZAdo6brge
dgtFzGbtniWb+bFYNpuaw5yexbZ6a/FIirBN5/SSbRv6naWEfFdPCaxAO8tewyQA
p0VGvo0jh/ZW48PEG0T5lqc5ZJCQZUJxSKPB4jcUrUuMt7hP3MYfBh9EpBAPYxsq
zy7KEYY23HfUa5Y8NwxtLsaS45x3po/NPoBS/Anp1ykixnwMOyB/rj8/JBKwUAY1
S4wQRT7fS4K6cTknL++BR5YokBll+Z/t5dVbC8uazwPAci00Ymp9rATyN1H/c+3t
fBnL6/+2nSFCWhXVFwPv+aY7+JCTjABUMzAKbXNc+m8aehEUrbFSK9479WPXQVPJ
YC1jtDH24vMJCQy86Ocqz99Dj97pkSu63lddqOKEvMm6wDTT+ynhkO/OVQfwZtDO
cYtKjOO5BLFCeW4zqS0KL6LJyiAhiFtFXmZ522LArCsmAP6cfn8rbpfy1ihX4Pr6
EdOV5fRNkxSf6U4rTe091CeID+IeyZ5S1ZoYSlUH4nqE/0EqgI66mKC6Qc5gZWog
1yRPehmi/xfXUzzrCRdL1JUCeZ67rpcdHcPRU8Ax6yfrWQywA3ndWj9v4eix+KFx
fw5ofnOaZt+GFPh4jLq4dLbAN2mWVgRJkAMpbpqW7BgWsr7iMLS62iQFMNpdqim3
VQikF6zhvCmQzr9NaQC3wX4cS+o0KmBbPo4oYOXt7KdzKPF7gg8hUl5mDKv9lhvV
TDUB1nvKWK3YWUPVa1rI9JcKI787V76X3uL0dJ5pJaaG5BXdu7aYN2ygyat/gSnE
kvm+UanneGox1P5d3C87AbWa13pbeziHFUlWbRQRbupaX9bgaZMFVGl7XG3mEOhF
OL6MKxpeRMWlxiT38kr3OGBrNJOP1J6t0sNokg1UNhRdrMWagAN6SAeuf8dVr0GK
YGQrXvV0iKDY0cd1Q7FbrkV+fu6/p3QMfEPaGLfMJbnE86R6kAsPK9dktyN3Eo3G
ExxMVpOYGJa/2yj5Vnck8SUMnLSYnSo7Pq9qePLtl4TUN/GwVuSEr3EqXNG0YJnI
awQa7Aeraht8YGBAwLdaP3r66Ionb7aiBpFw+DyllSn97FXaz7F54aGSBVlYhjel
EO7S7We3GdsyE4bEP/6HFLV5hVnx/1srRiFs344wlGfZwvzsYnKIxKR3QObo729O
fCzFJoK0EHPEQYYxsyHV9ZoYyMghLvtbfiSYy4vGHM8q6bCUaRQf5AAwQlPhn5PR
ytTPpZbgcqR5T4/IzvwxxfoYdbADm5xeBdzXMwigHCPSWOHZ5aA0wwwPI0m22wOh
XLNiasci2LIgeIHJIfhGd2TF0V/pBITdYIzP7tdB8YKBu5ZyWF16gAAdoNr9fABb
MeQv8Wba9rEnGGDV7ti7y7horyxfDj+qvCrrb5SDWofv0Hjp1DaAk1FsxanxC3Z7
uUgwO8zZWygPnq6GfylujCTLfdj/QHkM/Os2xVn2IPozbdKomKw5P3qrsuWokeSj
i/scYVGEAxQaYNRE7FdheHy36dDSgelKgfBu+7+f8invjBIyMJWqhmYJ2JY44dbP
9CjZvsTGEHveuwcCB7t3Fp+LHzDj28c061StMZ6gXLZmf2uC4tcCXa62xKcP+y9p
CIqTR8b1d4pabqUVvohkIn4rAt88ceOd/Zzz11Ix/IFnW4HdpsEIIvGDrXVcP0n7
apoW9nShN9HSQc9hjoQE8jdd+oQnrfyecqDeT/fRreV3HP8HTrBKaCR3Om8PDMK3
31ea/zcdhBADDv9Rnbq7pHvf3ge7GuhIUmXOk2meUarPiB7nT14yimnGUmNza7mH
C4SjcdDlVKYr2d/taV/xeTq/Dn5tEipbfI/5/UpsUfEpDeDHsa8TfuicYXa81Kpf
oYZ/zfWbjOpMuw/ZikQ4vwwFNpG6n0DeaLKDfSfYt9d615z2QFm2UEy7vs/evcN/
Vh3nS68tP4LGEkN1did49SAAmFXWEV7Z/BRVyPHIys2uUptHTJmXHHdI/uYKkZk1
MHGJWIRmOd8bIav0lp2XUyxsNYHzknrGhEldydYixuTB8XhRZ3AY9wVNg1Tn+i9C
ZOiJ9hiKLJqwod1fzRRwQcUndNtQlzpXz0nMuzIQOFVv/cLZ/k4M/geQ8zvnOW9J
Oa1OZwPvm+ewuxxyVu7khqdyS2L6IxPLK7TKExkCvJuWGOBLFa4xcXnIwhf84HyG
raT7E24lfdxkwLAqyRbJJqNGj6tNrlP520n8dqzSqrEuON/fJwS1MHTo9PTsheJJ
IyFtJm1vCeiuHIjmK79LHBHKjB0Ny6sy+sT9VJj4mX/XX07dmDG6cUyVx+1iinhU
4IWRG/Io1KPp/Bg6O4t7D4FxCESX8yTI0PRp8R8sfwymLtAsY/KxvIOGqI95E+h+
wk4wo5RHP7La+RThIxNDzG7H0Nrq10dKAds95QnKYHKwD+x//SRnXJDPQnxTg53L
JamObYeHxxtUGFTbta+7wFDwzMXmyTYDFmMZtclExawCEw1qyd8udD/RBmfy0Lft
ofq1PBZBy9RXpJy15WnJ7ZEJ9a/YOBZksPsF35RzCKI+vO+eZ8JYOH0YUfvHaapb
/dQJv2Dnx9LXF4YTCdVoffX2zj3yyjKwToTtR6jtizDDugBCPplzl74ASnZJD7gs
P7Kw8CWwzHbpHugPk7pIV7oIoc44ZvgbitaZypmehqsBSt3qUlR3Tk7VjauJiw1Q
pYWrFjQ44o19HRJDbgkfwIWtEuczU9wLa2uPzB51tXq+orPmR8C3+DkQE8sMVGi9
ndDj7TN7FKvqPRkA+f27rgPSTwi3SvSODxgjH6AFFHxsImKnEdU0kY3DwC10Ke0r
JOiioCDyutcuiwyLtVyjkb4wBkWMuOzBZM0KY/nHC9px1I9JTtfoZmfjFI08D4sr
d3OoJGC99SDcE8ZYYH2OvvX2a7WH7nx7VnVZZK4Xud16k5NySBqnTNGhaMQIZnQN
4cZT87PWcvvvfBizIZvivRj7dFTHG0YzNHFFFLw+rmfy97PwWDQnifyTmhMA4S6M
nfUidm3XX+RQ0LFUu0Jn1VA+h4xLsHxX+MLpPutrxmJX3GFZRAy3fxDzzR8/On0c
7r8pzYunJ5ndY/MoujuLh37f+NOCWr6+6Tm5ArfO19BKR4SLXbo2yVUQFpCTSLWC
sBc5BF9l5AtNkjQRRbJ8Y8r234H79khZ62UVwtU6IX33WOkT1vvG1kAJkZQvutDn
2ZLlkBkkAsLFn+eKstib/S6+euNhSWQ2ATqUB3QhiVCPQlW2EZCcPteezv6V9+V+
H1nrR7jeJbmMDXS2CJPUHu6mTMtARSanMtW7VLkDnu8aoWPopXnG/nvrLYn4JSj8
hSBgcgrs8iIiV+bpp5A9AWEE0a//pSWf7o5FP2IFDrJk1bHwytYM87nkxouKI3xU
rtaAuKsRwngdWXTLZ81W0/EkE/1FoGW6TjkHQa+DIe6Sws9XdjUWkHaJ0ynJDjA4
6NN+bqPOCJKlvK6FYqH6ECLPNm6Y4UGWmfKtyZhejZH4q7Gjaw39jmocM+fJ/Vfe
9uyCzfUjVcjz6tgrpryACm2WlpVBfSsMrz8Bnv/ulH/lLXX+aALKXBssG1u6XUWU
NvhJaOsjlq078r4KlZCwVXk1Y9mfmBT+qQMmm1cp1bit86e9TMMkKNt10shNp+71
VEudbwYoIGar7LtYcXYaQPMaWY8kssgtcpIAOKEGlOdpxdKZIIFzJe+HmlvwEm3R
PEE4Gw5xAtGv9lBLHsIG+Y4DjtUuDHKOsdDbdwqnxJ4camFA9LVj2xs9z6nfL2OQ
JnxbZb569lddIIC+IlTfPBc4vVRaig+jonhPCOUn4NxspXVPL/id+fo/0JcKL+NJ
tlPaE+smHO/dgNWpuQmKMX8oIBnA48gS/iKOIkj8eJMKXrnSUTJRCHTWXp3ETSLy
DfTnc1ZrgHucdrHmhBjvYcCGH6/LNZihHlEtMkcyvZuDzJt40U2cp8NO15Rhvqg6
A8i/QkcfSCIyqA9Gs8dAZt3NMzEu4xBy6aZOwdC+cBtWdAGqpuidQM8ARdIPsttC
g3kvCvCZZ4ngYHb5KediRSenFLyFS/8yJ3mHjsJKg62kSLgP+HdrnDaruSfguLTT
6DmSuNYCo8r50UYXhwEc3cmgGbzCM/xuY2+HIgbK+vb+EV6LYQjPfHp0Q1Z1FUea
ccd1OkvP6pLuqFpAMf3GaEccbHFkHPu8bSvcYks03AYfXui9HUS+AvcBT9L7SjvK
0zF2Txb5LrOpPsFoO6RCqpv8x36AKsU30wiPFe55oDq4VBHgUn7bWnFyXzEnAWfR
7gDzNlBeA2Dy3izloQrNUC4yJE+koyjDPIIExzIybpYMvBRf7E9xeSCefYktJDS1
BGxxwGqGpBD5JL3Y3dndDTgY8+KHyF/SYCa5oH8cE/GmRfhKj9a0j6RjhPdbSnaN
2DhPNNTd9Af5nchTXcRakPhXLK77s3wgrSbRG+0chZ7ylx/99tkE/hSkb1RaheWj
tsuK9FTEzOgIXaNcoV1gKZiA+0srAWBSpLnBBaUNmWOZ7ZlVFyI/7N8MYHAmSe+r
NZTkHQ+SV7JJM3zbHPqxUPRA2oR5F714oNThBzixBorK1tqHfw80Z6R2IEG18wLP
TG6r/Nbefq3aNhftQgggVLsyC4h3wE1eJw4khRaiIlUK+ru73FjCmdQj8rfiIrpP
FSxXOWGlxGMe1dfc6XtZH5uVQ/szzh4lCYT0R/EThEX9bdeXj8RNbN15x/Xzp9l+
LbKIpl7isF6NDxUbGrRgc76dB6zFt2oGNQN2NpaPn077Iqpni4xgJneC7cyfmwcD
X4EXWmOiuwmAZsaO4Mb022ju+rSVn5vDVS1jNCc0n31vIfOz37HZtKctOO8Jlhmg
yQ5bXtRO4Inl22u0J23C9pjaAxz6y+JddaykRwwzcBN4Vg05qM40gojBpRSqWFkw
Hg4SZIp5NuMlfWCcTWcTiVh3ew2Li33m29PRRAdeGey+e6CX+LobcAXn9yP8r35+
m78aTaYxjyNsY6FyUBArdxaVIW7yHhMtBN6lHluEQEsXm9NofhLaBkeS4KqAxsBT
G8MoNgQEAuQ/Rnd3PwyvWk9DiTx7MNfm7NmvTH5bcPQfJlRtXcyJsVcvgGKmtC4N
jCoE2N+lBeInNLQY5xyV80XdyyqvP1djTd2Ps49xGay8/xMqjjP0Navvx/Nsy7Z+
v56Xa1+PMjLtS/TIW3iKpqUJkmVR66MXaaX1sTbPdErmGT+60CA1JpTS9fdm1jjF
aL4EUadlJhGaRd7P+lIRK5dJqD4uSGwMytktvk85ddrEshvFfocC/LiSu0zKnqRg
9KPUxbCSN4ucKFgqxu7KdVDeOSmrEoNs9LYHeziw7vYKKWW50N+x05aN/1VR0+Na
N5OQ40fAN/nJpqkAzNS3TieahXTVGeeU3jhSnz0jlfEBOGlA8JBnlmSWmbe7RkfU
WBHWxQs/TuIwPObV/gdldWolw4M7/cLt9yhFpMWjr3ot4P6g/NTgVnlgdFd//UFZ
B3WlxpipT8bMJocsCHcnUzriJp/7WTUBvQ9koQUtJXZrr9xLOHpX5pxpO67TXB6M
VIiEr0OgOP7iqglm5/V3t9b/6T7E28v0wVNNh9wkvTBh39mPdHR9TA2Hkp+g0Awp
HUpDXiAdwhHj7mkBEy2IvHtAEvA5yRoPbDe/vPAOfWFE1crJQBpb9WZ//fQrmDV3
bJ40lT7KNwz271CHVmVUzgCnrCCHlDUBQatSuTcl+f9TEhkJwRrXa3uuMTvE33j/
09x7vRJ3FCP02yIl/7IiOX4TGwwhi7goAlGar5ErgXgXAnXtvURfFUuQVH88VC7l
20Dy00P3b8uJ6vGBts7t9/m63h9O2O+/c8g5y1NpY5HJ5JsqjqqwyMy3SAScDG91
DOL/QvQkb0lcKjPxho0crxVS+AZw7jQ/n4zMD+VJBxABdqRdXSLiq5k/y3rGL+XH
v68l4bv4OCR2vWPmBACJjqzqmFZAwnzHzkQWbgvIm4aBJhGk7lfZuh0/HAZErROJ
KF9YTBogPEZINXwdg1wKC8Ds68xmwCAEzb1L6kwq9o0a/h7eJ1A4vzsl4IMvuRND
fWw0z0SjaCjKh5H+nzuYKdNCpyo2Ry0DBkzPPef2Q9cD+lzZhYd6MVLBSjzr53Hk
9soRVdkWBMP7s/k0wcGMYHdirUYzOJFkHB/WPEtYVLQcGG/wxT7yFRCwUG32RIl2
OoCSSICk1MD2v4BsS/3vpS/B4OafZPoL8/fCqNX5Qo0XAivmePPPU8B6JCfz7jfB
RgcScedTQm1Yawgoe1dL/2J/j9aXLH6nlXR/xz3Iz8Efq0GukM4+Lk9FJLVn4pUh
ZnsAAcb6qBw9xX82wQf9dvypKUflpnhYe6rePh1u86tltMW66uR41b71iktbsIBV
GIcOrHTFRqlIlZ0ayA1WyNJHCIPcYzOzlOxe2WaU6KDjbkzgz/XQ05qhlBGvy1Q1
pa5XVEntBwbx1+VuXNFQ0EptBdIpWNin79ngHMCKQym6tugYmA4wVhelloERCB/f
jSHhMQGZmPURqE9JHUpHaby+aCTAxUdlpgycccIko+MCDsH+EXSWKWJu54MIo57f
Ikvg9pDy2DQIthuazEL1gl5xAzCXBBvCWJdxIx8Hn061q31F9a0BnrFllMCsLPDg
DYK9EQr2Wp1QGLSOi2ZjOWuBTjO6szrc13U6Y4I2hlBtkxFk3ZmEtd0aizBSdSFG
5kOdudymdd8kDyUFaizii3Fs8jeK3kMhhjIiQuncTw1cnbWog+cOpb5DSwI2QIVo
WQgy+ihPoSLiRTEF95ZvBbEL6rE/alhk4HHQUND9B0e43kZAkjPmMiWwuSZhJQT6
2SSSRCTog1vCf2ydG5YJziR6oAlmvMqF04qviPUEvYUmXc0YwHw8DkDRQTd4OQgr
byXPQ4EvYARuFxEAeu0MNyUOlBBmvYyEQCGdxpzzULFGcFAqoiRuWNVgxox7esxE
BzzbNpyEnpGWBCuKZ9madClgDQDCOo736WigWFhEjmub+WIy7DlEE6SGL5o1AXhD
PNOfQjh5V+fxI39nr767fdMd9X8kgdZcbyWmdUHaf7B9/UJkL+e0LZfS8JlHYkOo
f8ozBa4MbEgkTlA6Kmo+E9ZPVnnsw1H7U8iEkyv8jjYhD3jO27Y//IDA0VAsqrWW
J/WKXMiTNsdchU+/gav08Ezh0ufU4byFVjGr+H6Zi9RD6Lyy+CVx/h1l+kvJkWfT
oPqxEsE0iZ0LHTl5dUB+2A4+Wb2wA7mq38Dtj5xnL6xjuKivIW99yUc59PrB2WQl
9FHRxBIBDJkJzoxFhvcQU+omglCG92TIDCecRW4jLQzH/3/QvuUvH7SuwcDjv/T0
yDjcq2k+DS4+LOeAhviAzVvElzFebejD2ATxTm0WHOcB1sHJ/PusGemLS+UPVjAK
Hkd6b3CewM8IZQ+zFwha6JzHdL49wa2zF3mAwnvrsnIV22Mx4BWHcElMEOYQHl/V
nGCCA25qrS1Pc2G+7ycK03eLLEGttAPvUCNhymz9iDHpVJi4qlyjPcpPM9md6iq1
k5AasVb/5TVGGxD/2LSM97Glw/jnoVTbELKDVwNYy5kZXzu045IrXkRIfQl7MWWF
9APoBUI5mQY29jTqXHjecyEUnTjMfVfZlxusr3PDDRzBAz1OpRRZ/3p3TmOTtZKW
tLbrzDEej6jw8rRQAdvHkT2AATC8GB/Th/yym7bRGxyBOZh0YZ4rIdcGyPFoKjNj
4J4EGqc2OcfgFjH54L96LbKB+D3Qt+kY0BAEHSWBbwgOAdmRKo6Yprxa6lie2Ki/
Aj5Khc2z4kBQS0qBiTllRTY5f6iCe1ba86msDuXUOYtg9tcJCJckYIMLkw28vUg7
sjHFXJeKGtJCevPunr49tJG+PKZvtaA9xgNOa1PrJ1qbPTcLqQHfWXVYyTo/G6Jz
JO5XUujUD++DmqsJy2NO1NOh2EuVOYBU6vGN+yCC+s+qt2rnOnodI/3zAeWYR2p/
pMedbRv3xXt0VofXcjWVXbzg76S0BfKQgRZZvm/h11gA5RqD1erCOHbsZz4lVT1g
ef8BXQp5arBdlZRJdQxmWYdJwNBGitErwRgtapfJuymx4c/8n7M6cwmatPOy9wwH
mcWHKmH164awS2QI6qvpnpatc8ymL7Dk0agxV5bbvC9/77DbynUsdM1S4kGAj9QO
2WHfyUE6caN3C53wSfiUBSSiYxnDR9uD+nTq45TKOI7yhKXXZur2SbQh5etP2uHg
HYzxp7SJwRGZGGcRmCFtNQslPm4nTCLP/4P/r1ScRwShMWgnGQ5+n9Woq02olRTt
Rei8BmXn0meObmdgXXP8SPNK3E6FVGTk3mDh0KxZiJVnje0k1rtg+jRESfE61a+w
YVaIahhJbPUKkZfDxL7iXb5gevEkhYYsdN6f8LlHoeHVH6HmtEBa/Vpj5W+NIMi3
twGEMkQC2Js0SwW+ykcR/lXGJMdIiHgbWgO4JG+RfmUeITmpAhVRuJQQ2LCvNiZc
/Y2+iD6J5q9/USagf8cZBNPh3P1CDElUyzAKsjAlvHGlWcmoZwO5Os3S7QLYv4Pt
cZ4+cf0hAnrshRJbfNEe/oK+5bSBAdmVFLrwbI02o4uDTT8C0hC9cxuuDf0ZlzQL
ahg6XhGSvmXjX5xzJM8vsYpNbsmccrSydoy7wL+YvVrdae4NEJgyLadfnHEUHiy6
6DuSAFtPaP6a+UTyhYE5unKth37rRa8gkie3bg6khrKMJ0zN6YA7Uhu9y/pFl65W
OQGKenX5hkmuZtig1OfVL//4t2hnbPtSTCqD4uSrJTshLHa9P8UgrvBOtuDo2lFl
z/iLMFcGlw+AqcOQPhcNuEdFOCx+YLriSXNVzNEQ6zqCREXfx0PYNW0Qn4f6/L5+
umN1kbMbRr8rn6C3atJkLiAbObDCDdJGvuVVGVxJ+wtbMAOKYulGITGJ0lRjfnlR
ohcNwRtLygAtYRmBsVi5OYFF4v84lX8nV0r9QPrLcLpTzsrxsE1hSZomYfcKzP67
Y+An1nuPzPr4SF28yDVdnh0pvd75VLe5+n84ZzNejzOI1nZzdOlksFaBELhPZ9Qc
W6FJ8BqTFrRvw160NbR4SnbMyg5kwEeNOZQtXE+2ACU/lgUStfjom7UJYSajyoP4
TjVN5oapEGuJp6hFBeGZqwo1Pv9qfBgQWkq50wipafWK94yUf5mhP8rI9YTN1ZcS
Dn5QBE0NDhPgXBvg3wkQ8vnpex0vzlyCAHrdWmlU/qufpsquRN3bLOye3RiGKyFz
hoRCeJCfwq9pviB/b19ikSrPH68+jUxwAqkSUkGZrJ8Y5g3OL0kB7U3BT9IjDjub
OKCrkU5acnb9A7uTMJQwC8bzLOGzcuEFqPebVjzy3n7aAza2OIoEg4PRhwcJEY/I
lhUtzqwgkrocnrAphCdhYUmN9IfgJQTNqushhjjdjO2ueqCs6rkEyFR3qY24nbJR
nV66OOnnF9tTfSe3vY09o2+LTPvesusZus9IDnhgUjKMI6PteIU9ccD7KQ+lAj8/
2UUYMU3OmYIm2GQxkVgpx9AvcVcmaP808zt97uRGCDv1GY7POnXolJlC1Dxyb9ZR
shFuFUDHGeJsOpXVWwKq5W4/r/eKOAr7xKzkZnVXGqR2xUCG+lVUeu04+u9xccpr
+tCvlKhB/74LjkD9qHziuYdww1Dww0/YnBBH6JNq2ufBPG6hJd6DxCJw0ZLL2D3y
cEc0J9SGmpAtqxJDSHWRqVo2eCV6OlpX53i2TnxgDlOMkG5cRYFk9tHV4IR0Bsz+
72xDHno2gmxcEB/0/pk/QvfozA4AJ09GWlpq9uxg/YGD5Gw96c8L+p9e1N0azj+2
+fdzLPad2pF8KBsBQEtsu05aLk+3LUnKzN2RChSh61hLinbFl9OuuUVnAlfqMUlv
IQZxoIhNW095e73gL+yN3Kf3xI0sMekvUiDIeugMHOonMLCWQikQ7Rtl1CjqNMHi
O3/BsKPYVZFPxMczsxzJcsb2tfPJN/SvFxZH56kgegw4rCQRYb7Cxzg3oFhIVRhl
XZHpoxx4419ya+8GqaJs24Wr/9DI1dJA8yN59cM9rv25ENF0lukt1SMc4HQo4E1n
y2KZTzY/dMtQVdeu3iSXQqX0YhQ8lkojcxh8sgaYicKzU0m/mwkNfBQTVbhN52S/
saFwoE3mNy9RhQ+sbdbvn5Bh63j6OSXQae0g12bu0Qaq35IyIystqVsvk1mEZHWs
88wX3/Bn6tvQ+IM0CEZtrG0X/UiyyZcu+d3ZHdo4VcNmQyCxCNlfd6y0iYg91knw
D+5IMvkE18sF2kbw5KzcxFUtCyDciOFa4DKeCMJdZJLC4CS8qpWwT1K5g+S9vlYu
oV/o3XEX0hWhnvI7PrBfIUeoioKR1ipw9UW6WHABAuL/LQLtc/jeCIz4LuQHiMEO
uCWkM9YRi2HdgQXRPBuNm5kJopyczQLuqN0xMnsMi5STsDDj/0D90VJ0P0mDzcwa
MPhckgT3Qp5qTlFXIb6c5Y0gfOYtk01q+uO7e7g+Bhe+u8FWC9RMj6bq0WKgTY+8
He94Gu5n5J5HA2AC2Do5+JAUoxCXlXH+/SH+1qsTaBdd+DqTlyU+y0jXWOzL6Hu/
UKJTAiSYaDI/x5WIiZyoy3k5ecX2bAtUbEBKJz5ChEqCmAINB3aNgSzeC0pNNTAs
ka6Ua1SrZjw0C/y26/xGZWyPq/AyCyxRA3bAM3eEZH7xSjeIGd0/m23L4XbiS//F
rsZHLHqMPddtjxPbeWGLe4L6smyHh8fInySYrTF/JoeLuMzFKMU7DqQ+95ks5GJn
P7d9vWdHcjwjMkauFDFn6nOJqtp+hCwsUw1JASd+9DNXHczrU0JjxYeq8H/rfxeI
Ev9RvmIVjn70xp1Qb4fSzgbWJg3k0baGk8rxQhwqdrvlgakwoGlgNxzhkPYmdqDK
9huC+bTO9InVZ1ClXn701KqehXDyj/s/8X9+Xwy7s+MVPQMhk/WGwBVZA0m9DEeq
GrvZGlbcANQrVtJ+kHvygB0eTPlFL1rH/LEgpsETHDW25DtVoCfPm76/y1cTgR+v
3qU+zkDep6CF4OUTBrnQebQ4/E0kiAWUepCdo1I7KN8f7hTqDgwLiRbD8/400ffK
`pragma protect end_protected

`endif // GUARD_SVT_SPI_SERVICE_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
S25flZfpXB/RMskJ8sL7MhSruj5vHj+VD1U66n6rdm4wTJMmN9Wrf0bNesVurpWQ
bVAhZRoI6AdKnWxYOHMvm2H7qJxzsJDA8Nt0DQ8fu67rRksI1yvidtLJp2PRj5MM
Dv0gG88KQWDMM/+up3t8FHllwGEoDJrw8xNmndWWiaU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 15408     )
lnfliKU7VHmT+cWt8PBBBS+oazrCvdZyD8hmiJgeuvRF2y3zLGavhONBX5A6zbht
ErhULI3aaCiZaJ2EdVQIqzS26ofVXz5VjG/pI2XShm9dDju7tf2C+spmN+kxPGLN
`pragma protect end_protected
