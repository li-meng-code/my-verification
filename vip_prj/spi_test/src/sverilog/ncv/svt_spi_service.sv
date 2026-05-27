
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Q+pQBtFLHnKk+2IVMAtnG+UirHuCV0KmBq2MJTfsJsHxjXc+BcsfyR1cyxn/jVZq
bzbqD1HzyLoykwaq54cZ5WN0HP5E3RBXv/Ah4wqt/ABx4jUxZF2C10G4JsCqa1wK
tn7N9j4OIyuvUD8NHW38lfA6cBi4YjFoOFFLcA2zyyrIWfv47seoNQ==
//pragma protect end_key_block
//pragma protect digest_block
VwGm90zFtKZBGSkq+uHmQYbD0X8=
//pragma protect end_digest_block
//pragma protect data_block
z+sHREzNsJELywISJDpKlg/bkd0xv/sQWJ5JDEG5WutANxI9woTXyQaCIhbp/2WU
kOzGX6i2169W5Jx5+i8FNKF1r/7slntHglkmJBvh1/z5CAbzc3RtpTlFbbO1rICx
vB2Me0Z+meP/ndezHvHdGjhux1Udw8usqh5hduI3tn9WRumxIKXnWOrTpF8qPYGa
hD7yUGFtlLU4ZxP9IQw4pKUv5ZZyNI+dNcBT5ucRVgdAPfjAMdi8dZGCHUVny7hq
Y1fvAapzHNysa9l8ocMUT1jHAYoR4Jsd0BskAdk8C+8c1M/nCs+TOGQGCBicKf6y
FArQ8vOgu0ayz3wm6Fe0WoD1Z1pggWDiyuawglzGfK8Rlgbhz39W/0j7IzcMqinY
ztcHSOOkZm9M5KDa+NHh7bMOa9JMeeq1MtfQx6j6I3tC6u5H5Y7xvYGKNL3ePQVh
jG6mzz3kl/415oul4XoEXR1OaCYbRkl8HgOhW+r2KCvBWUKzD0xH3H0s0Z1u+6Jb
UmbYkJ1XHo8C0InJRqGU9HK8k0QZZ4siFAtrMOEKtpCtGa2MGdQVXrSXRmC/Qa4q
55sv8HgrdC4upMTbNG8i1WE1/I5h/wW7oO3RqwJ5TKrJcYSXgvH6lg7gvyxXq4KV
LPQhdF/21mMG4CPsZZ7mNLzTzN+RHaYTFw9oSD4a1eVMyZ74Lexg/9D+q7FGpDQR
kTgGCl1Z9Gn9lQjRkyjIo1Ue87R5A9+xiQAh+X/Klr7rsE/TYIBPQELQH6qHc+GB
ldh0gerFcJBTObQ5v1d62O7zo4uMYJptE8RAV9CtRANggXlU1tszFJ3QTHzYPYmc
Ks6ie0drevDPmYofO0fEd0/qgFuQ/gbAsKtqLNTGmOyi/nqYYko643tH5ltVR0s7
xCwiTICPFhI6FP5ap3jKsOWJBAFgHyzRfkyrWDen7orRZhN/e/FBJTwUsY1kGFBq
6iT14EMH+hwGtB29Xwb0LsXbKwYxLGzJczUe7NnxDIQxthshUnIH+Da2FdXHZkNB
Ji/fac/XMVmiaOJwVsM/brKBR3QfijKHMfE+bsG/3ZuUfAbHVvB5MP1d4Wh7IjS1
GTZ5w8O6z4WXyn8w8vOFyfaNx1w46VV2+rH+rW8CAeWiDqWLgcTRneUbgYdmgTeH
j+WhalySQ8uQaiKhzLEMxeky9/OfaBBgeJ9KsH+5ofdndy35unKh1A5oMKlH29F1
FVnW4yTzNsFhG/xlfmrsvhJnIkqsWuI+EXlg4B1YhbNT+xsYOXvJ+cnnSwex4Rfz
4wsopJdYLIHyBCpEFzQbcDFHhkWrMEj2mymwM9ocnX+PW+iFou6sCb8gpNY3bSxC
+jlNhXINTv1rRdngsl1j0Op4cFIdm7r30pSGZ4w+xuMXIt5RZAQfnPTpuqJHoiBl
0z+05HHuIkmiqtTsmkBMkuX88GamzK3tvvClQshnISKgVq6DWJ9WvP/KWjKnv77Q
PcViOsefW+5/Zfhx5OMusBsiX0Dvdye1i7a/I/kfzQvwJrUn+abhKf9XDFZIDKZb
MAFZq41Mc/aYONKKlRYKYBUed8deFlJNw/AW5wvb6lAdgy8roGa0yKLRDRA+4gfX
hq4dskpP0WLhaJ9gUQ8RijpsX89uMEn428nOukEZo4ZZdIHsdeRfjUU7RJ5I4vjT
ZIxS2ojwdNYzIGjaL98Frc5J4Ov5DYM1ha8RJz6ggns4NtK2B/KZDWoNhQHZX31t
tkYWGFi5HLkCtpSjjC9v8A3Zvp4RDb+YFjFb8y31EWG7h/nSHYRh/AvwBPzKVueu
a8AB7fa8yaAiIhUOnDuREIoYVbRjDC6xVvfkb9M+HPc4eQb4/YCBv3QJDpN4MKbw

//pragma protect end_data_block
//pragma protect digest_block
8fi4YOBP7qCdtY/OWYBu9T2+vtA=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
NlN3o6eTI8ApjD0QrC7RbWqzjHICHWebWp9LVa1hFPXZ2GRDTRNX/w24V1v6m/JL
8n7hr9N6gR8XRM+cU1nH57ZBwfQ5EXcmBFsvEb5RA0PQBi/Nvj+++KzTMZn8toT1
kGfbVH5gbtaxodloz6j7mva60Wc5FBh6TlNpFiw/OLZwOvLQF7uGkA==
//pragma protect end_key_block
//pragma protect digest_block
gh5yLraYfKskH1XPHx5HM1DvV5g=
//pragma protect end_digest_block
//pragma protect data_block
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
Phy+BMK4UBwVNe5M1Bp+aQ==
//pragma protect end_data_block
//pragma protect digest_block
pdHv6IgKXk6SJZ5JLwBIdnAM7AA=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_SERVICE_SV

