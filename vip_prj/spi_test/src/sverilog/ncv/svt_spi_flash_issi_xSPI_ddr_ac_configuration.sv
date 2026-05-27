
`ifndef GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * ISSI xSPI_IS66_67_WVO_M8D device family in DDR mode.
 */
class svt_spi_flash_issi_xSPI_ddr_ac_configuration extends svt_configuration;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************
`ifdef SVT_SVDOC_CC
  /** Workaround for SVDOC CC circular references */
  int cfg;
`else
  /** This is a handler to the SPI memory config object */
  svt_spi_mem_configuration cfg;
  /** This is a handler to the SPI mode reg config object */
  svt_spi_mem_mode_register_configuration mode_register_cfg;
`endif

  /**
   * Initial value for all the timings which indicates that parameter was not
   * loaded from the catalog
   */
  real initial_time = -5000; // must be smallest then all timing

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

  //----------------------------------------------------------------------------
  // Type Definitions
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  `ifndef SVT_SVDOC_CC
    /**
     * A helper class that can generate random values for non-integral properties
     * 
     * @verification_attr
     */
    svt_randomize_assistant rand_assist;
  `endif

  ///** Assign refernce of spi_mem_configuration object */
  extern virtual function void set_timing_cfg(svt_spi_mem_configuration cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Randomize tW timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

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
   * Valid ranges constraints insure that the configuration settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the configuration.
   */
  extern function new(string name = "svt_spi_flash_issi_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
 
  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   *
   * @param on_off Indicates whether rand_mode for static fields should be enabled (1)
   * or disabled (0).
   */
  extern virtual function int static_rand_mode(bit on_off);

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
   * Allocates a new object of type svt_spi_flash_issi_xSPI_ddr_ac_configuration.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

  // ---------------------------------------------------------------------------
  /**
   * Hook called after the automated display routine finishes.  This is extended by
   * this class to print only protocol kind relevant fields
   */
`ifndef SVT_VMM_TECHNOLOGY
  extern function void do_print(`SVT_XVM(printer) printer);
`else  
  /**
   * User extendable hook which is called immediately after svt_shorthand_psdisplay().
   * This is extended by this class to print only protocol kind relevant fields
   */
  extern virtual function string svt_shorthand_psdisplay_hook(string prefix);
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
`endif 

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this configuration object.
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
  `vmm_typename(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_issi_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
amLjbzvzZpHqLBc2qLPtJn1HHIY/tcUNviNXU0o1aIeuR2I0EyUjQ6fzvoX9JnEo
tIZ0mC+3jvhHOK6pz8wiY+xYxz2ejp9fdgWF38QTKou799Agno7SOoPc1JR0IYxh
yQCPQVE0l06Rv+XI83uVXlsZFM/0L2zYWX8PUDV18tczxfkn9LlbxQ==
//pragma protect end_key_block
//pragma protect digest_block
lDH8fi2az/kYa7AWJ3fCQwYop98=
//pragma protect end_digest_block
//pragma protect data_block
wlojWFfDLzEsro+2mZrpTJlSmq7ROlcXyAApNQebbwcdqeK4pyKWbiAU/QsRd/wo
QORppL2O1jSQBjLoFabNLdNHBacQPjcRgnH7gBuNzUzlJANDNsXDzEWbfCd2ns4L
nr9/gArFdLUvI/jBA6JUEsAUJZbhdKj44+QjYZS9Ce1/oUm4YOF6fc2GbNdwr5JD
Qag1IOH2MF8w96AFQxjR1IFu1BXAsQlm+v7i3Ug5AzbvKsDx+BqO7wfvXfhgsmqU
pi9q5rS4LOZb/XyXwuidK/uh7v9y8z3w373DMJZMA/iar5JclaotTfecbMIgb7Au
eCFBi3dn8kr572DvcRThlUb1/EukvxUkyrO3ruQ6Ed7aos4pqz1yBcGFaDnYKRNt
Mu6aQgOfa5DVwNOzTbciZkAs5FoEQaTo9CVuT3eVRiBqLbKpdos97jcwDu6Gz3b/
rD1gwGt16PJQKTdEWm85VsdmXx2NTHmsr3mLS+DvQGzgovw5DHd+a2RjWf4iAat/
aEWyHijaZzIuwJbUHb6RK4Af/KA9IgLgZS0wyLxMmZW+kH/G+o9LAQ0ggKLMPjIt
c27Jt+PnFm1YJOSnNFnYMTOqsD6GINr2MZ/rd1vZEjLCSNsPZRcj+TVcbFT0kclC
kv7VbLYW46KdsUEJLe7G7ueebZ9z4fI4Lo6r1qYY/yviwlBT66nMzTVqKRlyEdLi
JWZGPHPAPwhwrW5+gaTx9nXy1vW7sJ2m8ECnMvZ4hpMx2u37atJWOIa+68GBn826
WfwDZLElxsqvGMtdCfKHbOf8ED5MmXDf8Z8yK3JtDvNfdZPeiTu9FV2yuHBaeJSL
u4PadrFL/qfI+OFRJ0id8uxZpUrgfnLKC7G26736gIHfz8icmwwyy1XtMW6HUDN5
yHHHPn4SBixNUJkMQXzIH7L7zNaS7Xz5gjiScN4vQlGpZW2Y8BotaYyM1tPxRKa2
CglllSkGRQ9kc5LsYnH/UZTMzOxA5QtQ4fd7egVlGIsjyasGDyuH95y06vctVkrZ
AzdbnDUXOZw0Wr7iGy5A0Qgf7dnLuP6VxHLTkAWvmx+1m0AyfwAbPSGKSilNKCin
qLuF4R8peacUJ0HK8zJ/vkX0qy7yk4QbrJMbLDQ0K8vnlbX587OJmSItED9TDSOY
xBMyMe4eusFFmTOKXrwYm6dZN7zSvB8rt2BW26A2RBcWzduAhVLgujcLiBuHSZR4
cBPnmWZYz2/rjR8yUtyKM53pJZtASbW2MXPLoy5wUWeVtb61KMzoapDs+bhIx8lo

//pragma protect end_data_block
//pragma protect digest_block
WmVmB3XjLJk/oUgXwiptVYZQOUU=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
zrcAKRXrNUUwC+BImpVOW3emG0ncIP2SN2TPANcyQVRckpdFH4OM/g7D2q3iAxbX
xOfCPdoD23B0QTqLBR+vOXY/zXsZTRO/3nK8sh+WHrvsRpMY8KvoYUmGRwEIHWrj
WNsrEdAqAQPPXYYJDdq0qq043QnQgXJIdEHMXaLydWXHQGaAlCfBCg==
//pragma protect end_key_block
//pragma protect digest_block
e8bbg70UaRvtFXFo4uFCNnYSZnI=
//pragma protect end_digest_block
//pragma protect data_block
+9NqwQXY0gW2IHi1cafq0xrrql+5rCn40/c4MK/4fWy85mN32nY235nKSpCtKWPz
fJISNtYWvUV25nIDL0WKMMmEsYLxbLTk/IGnnDgikEmTEz0aNfQn+tQtsVgl9lNS
2+u19yGJP4zDKnvv0RgE9DlZvmrKZjXR5aqAMIVrar6V184pLTF8UDlDgueF8tbi
x1xJU9CO2y+8N7x70S8MUR2BpoNtPokySGF599MNEfE9eH63BZoFq+ZtjeucTkkL
34P/ZTO6SJ3JTX/HnZkavgwIW/rKwwiTc6zIAF/AKnDHqgSgxQGk+lQ+SFycNvaf
y22A6dKn2S38xsSYbxQVeDDkmY+6NdDadeqcVN+D8rWom/w/SXpWhccd0e4n41Ku
vEeghoRlraNzoiw5/DLfWS7yJlbOnpq3sAxw9Vk2LCknagcd5GCSmtzFwKFebwQn
tENZoMNOCTI4s8/5Locuy4HyxL13T7pH3g4ynedw/Gmr4Y0HBsIxBacm0grJ1upj
4THQ2I3y7u6zSKeYVFIwsodjAs7Z9vziJnOYW1AM4uprz7k8HXhOjZuxKpmXtqo6
Pjmcu5ExkApngcUjLaUXyiJWEjsprTlgt9YjrtB6J6ti0ZzZ+MQ1oJv8dhL/pjox
7aLlK8ei3rSTl4LcPQfg2D1Yek9Ax2q6kBIKht6+vdF1GpukHqb4NKbBbKaDc9FX
FHtXSn6zmno234xrJ91ql8v1+9nFxtdGRcJ33ldYtYU3f0S2+3a/ynSAdOs7JGuX
dfsd24Xg5nriDhiPC7qz2MzqA9Hz2r0n/ht1UJ5IjWeE+6I/whzpiWhxuyL4i6T4
zJtLLhIJKzIpYsbzpfCyAzaT5LnSP4+jpnFz5NZ9r05Eqe0RdkdtVPhySDBywraH
ne7KoHvSUw3lBLCzdI5Myh1V5T1PVT5e85OmATn8/eOkGwcfQ/KvJka+/ZJxWWvP
UxkIzbcSc+hySYh/CagWxPXag3k6RSiW8sRfG6e530SMc5x6m1lRYU5n4LyYmxdy
Rkih+rHqLpzPILk5KI9WWNNrO2frQNecTOvN8vxBPHU/ptuwKBbmD64MRksUnJPa
+DVj+8YgCGvSVIH9xsv9fvbDFOs/A6A9CWQxTdjitYbWoGSgzcU5uPgmW8K2hgOx
QaX3Z5xmhxI0biut3mTQwwWBBZ1TB3cEcmwZ9E/qlN4wT7As2ZDaeqZTMSq0KKgY
B5k9Ijzt4nvKHMZOrb0d10DnEpqq2S9Vo6bdCxloZykkBVDSeSf0XpaqjWxkBnFj
BAyRqevP37spFu8l6wKXDEfzG88Y9i03qrTfsOSNe+bUj5U06niAtDFJfJiuDqoB
jgndPGEmt4Obl1tFheKy7vyjeJP46tC55R0VJVQpYrl0ukzCaKmxI734DknGkliC
9Ny/WyFYsyHPb4kDBfh+U8/BVlZWP+YI05BzKaGCgvCLtDf6QpKw4PSYf0XdFXiu
7RRqmanZNuBiHL1UJOxX/iRf575FGWhCdtkz3PwO6U5TkO7P+Hrt3woJBdP/gtmO
t+gyVjnUaqSpsdFNLHWPQOpnRJsrAU8doHTF/a5PeLwtk3+q6SaeLhkyLRDpq70u
g7LxmPMOM/E9Wmr73jkd8NVcWiLdYG+AjgpESDEuIeohiDuoXbP5TJA8L7gWyMFI
wKErb9rS811cTd4FC4kfGauYwOzxHZg6e7iR40/a87JVsIh8BRARCPXr8TQituHW
mf95hrvsRR80yBXtlefj9VfcxtoSEM3YozcYNNLB+KL5h8zcDMLUW8fIe/UDHIus
534Qf9iVfjMYml6tillbJcK873Ai4Thb2rfnPJlqYELdgIN1dsw6QUmicK1OCxtL
SBXaby5xK4/jblTT7E49rkxaZZs5k4TbqgBH39RDxJ9g4fGLBVa9dtBxgl2/GDIX
49l5ZYMcovd39XBL1uvbOVd5gFfUX6zDqzvIU2D7cWPtulsLiTsYLOOqBLX+DAT8
yQJYV2c81ga5+HrGXpMsmeGQmt86mqNUFkiYRKgtLlIg0Bhpo23Ktq671pyeIEnt
Te0AVoFp+IHy2wJz2ZFAQpVnxtU+jCEzn9J7AMjonom9lCOR7TS3RRynmsKqx7iU
dKZFZ8c26Nx9eFRhVjTCCSy7M95IxUXwUi+9ZjXBS3Xf/Nc3jW1dnuf/EsER4enH
3x5Snrac1M9ik2WZ/7WGkUqo55w78RX/kYNUQjVP/+xeZRDV8cxlrhhE+hlouiut
SWm2AIww7nZW+55K5dasmq5GUHCFE4mRb+sV5P/uL0+dDnHENmbvrIDljxKsPhbO
Z4NeNMbiIsJlGTqLn9qoto+8Y7rCaRC4vXo43e8mCloJ9DYlgmC7WMcD1QOS8BZ/
r7L7goYYmmYwggbBzZ0j5TQZg7zLHXoCU2GwZC9w0Elnlg1vFNgc6j2JPk8hnB3a
D6QMhh89OrHZa/a3ey5U9O17BowDL16AobO23GOjGQyn8txgTFmEaTNkpRz9rxZG
OcfEeYvVjoNcFUDw078Nh0jJ4sSozXPhO4zfdvbbtL7ZvIueV092/EedeWolDt08
urITdncuyEGeddH8BIKhTl+OgJ78BjMKeVmNsmYkCnpw1vlz+yUhtNOWioZg9xBd
o5/ZHZRJoXsVrrr6YSm9Kf0P4bWmYOGWb0cDFieTlpfvuo+l1liztzFZmxceYxLo
+Qsj9eCPybPkthisV60bwbCnPwd4R+QBAP5BTOmYaHzcmv4lGu8bG8QNaBaLLbYW
Rx0v5mS0pzb4zubTcFZ59n9ATkphwAS+w7PN8L8oZWmkU9i46Jrkr/qDCCRVqDwV
TEnbLafpaAYTlqPkXAEfNEmyn/jlHj8h6EWK9O77xKWUKEbolOAnEYGSomaAnbBR
K8iBC1teuW1bnlbMtaK0pTT0Ny7r7SCjc9+LM9+f4a+WmxOo32p1pQEvpfiK0gYJ
K2h2Df2VYG8CjGZ4C1V+Nqi15JU/SC1qYYtoj1wFdWX8fij51HDi0sXNrQW+HRaX
8mV5b3IZdsTLJ5URCrLJB8v88GCCUeXQsTu0F5B/0u1TGsPqe693vAF5pdngK9KG
q1JaHxWvTdCSl+GiFbZ7yJ49EL2f0rc3ggt/36/P7mWL0mEsJF8q5SnhzXdGmeKu
c/LAfS6YoFypcT2tnMYhEJoIFohthK9zhROYu1MURLQOy/ac7WoxZeuWmsYWU+yb
UGIvjhqYtlQPOa6p5iVK0H2ryt/I8/Rnx5j/07KDsLNRpJ/4Q17c2b2IAxzid/hq
gyp6iRcM05suGGKlkaG8wcdgu0b7/GLzXKV4CDXG6zyzxUr70GdqhdC9qsTJkKvk
SoqfkU4IeimQDFdw1IqIiOYfML5M9kzluVKezk2cTx/tYVv9SCO/qpNuu/uJb19H
EL7B0x4+vq4KRoAcL77lFYilXPJ/CqZttY4CnGhpQRkwJN5YZLDB6Es0DkDE4tKt
h4K1vIbGUuVps3qeGS+jaNVxiqxPhkr1cjDW7oZ/FzZsPQPfOiyDcyx1UO9ZkdgU
JANwvhPHkT865EJNJBWjtUsgJKO5mXNB0rrPy8rzSWzutaRivLX40aEYNAf+pjkH
62GUQIxj/hS+8C5H7LP2qDnkOLRUPiEpp8hE6MK2AKklx8tXpKNso/cSkRowqZsb
ZM4Jqc4ccKdr7ZqsH+L6l6Wpe0Va7Ow6EN7dUBr7bX9+zFFjzYHVf591nmmq7siX
o5LJD0IGBHbEhPoX6P2qdF8BdHHnm1kN+01dmO1fm98z0QzxmkvRNB4K4EWOUyaW
utGlSw6rrZFn58TmYW2VxGj2N2baVBH8QJM8jDJNRae7wEDuSarqWH4fGdfIbym3
aEonv58wrg715En3poatqGQnbbjB9uu3OM0YHFzgplGZJeQfT5PoA4cqLIj5hWki
soSs/+OOMJD/QaPV9BlCaYOKYdt7/MucFloYCK9A6rbKMDq0/sDtDk5bMFHixAYa
2eDvGGUpYfFOMlnTxiW7aQkQitfIzGsQdrebNvD/fAsnKW6ODn4n17YT+5XdG7a0
Um5RNuoSLwINfyeo8SIMmCpXJ3GR3lCZOVhRWn861HB+HWn7T3apaVagKzW9CusQ
Wp9YYMkhyYQ/dac1bbAW+7FWFoNrrKejVKfqpVEVovUk/GbchUL38H1sJOqquTEF
vqnYnZ773/0ESjx0k+9+xc9YvJZGDeDtbztqWVSVcED6IULO1TzHqXkX6yHN94Q9
8yhKE+5r6UxElJAEELkr908oy9Fb3IcmLhD2KvYTlEt2NkqYckMx9TuZxSz2ucdm
3TRhLgKD9ICmTUH4APMnZEcrhOdGKtVRN72SE78BZMX+k4E1wkGkQ18YEa0CmlXV
zm/WHoqP4XA+EhmXicNiMBJeEqgd/vlWpeByfqiNLdbvH2IUcNj0OPClAXOPSz50
ozkJaxqp9ZcGTcmyMqDhevJDjELZQB4Hj91Qdoeul8ptlwBqHDuPWirjVwc9YlG/
x8sVQTlmtr2cOKo7KfbrSXCHdTsa1xo2q+maPagX8sKki+xALiiOJdZCvikgiZd9
LFT5AW/0kluy+Mcla2BYH5JwUoSyTO2fqIRguO0TH1+Uik2QmdLtbdZGPKSiUt7t
AhTEvGyGIyPEhk2492YLxu/tDFDosylNI5Lp8ROF2Vt/yub2H326BpfnbpNPxZcD
StZ5OcTvkdowwEzWuvp54Kc5JWBtbJsf5pmYrSmBj5fXqfVGBaRbYI5IXkTeQxTO
fEDvt46bbXxkz/fqqZhQ4Ziv57B2u6POpxxzYJvS1mRafaIC6ss6QzIYc1mhkM6P
D0GJbIPd+6TzQ4l2X0EgeF9V7LqZv5cUbZ0WHdBKv6WsjkDsFmu265qzglH7NHEn
8HWuQiVyGdy+eqVinuO4QhW4AogRum+GZFxdODQeuZHDezI2BQmKh2FWW0dHmH1i
sMRqecJSlDc8p6pZnBP72vGpMjw6nqn0nXTLSZ2P8VK8GhDH+cu4sV9OQj5W1vjW
QuGH6K8jsYB6+UYXwBwvJZ0aJlczHmiTpeoLiWeavcaUwqeEBjDJAI0dpsRqUF/N
LuK/UIXyKREylTnkUyHtffcPs4DAqUUBPb6QpeKA25LCch1dwAEHQi6Slf3nmYpA
Bom+acyc3PO0Q7C3vaBFtkmb1+pBo7JSLk1WlX9YJQi1AFRaqcuRT8+iH+YuXEt5
LrrV8ExXh+p+PxyMZNDJVBBgPTYtGpY4LzleB+0E89gXfb1x/8RUQOvnct85acJi
8iipaVIc0VVLeQpMkgbNEU9sOffNLCesncHbETz+jeYlZfaWTcOy6Okw8QJ99zCw
cnusqrt8mRwP1HFK55cNtcbh4GmwJ8X7rS+ZVU5Xo5BzIbfLcLLVRLfBEhGN5IBx
ciIZ77Iybl8PPwsS3y/piKE2+bEtMqKb5YccfFQBoUlSct9oStU8A4+WeWdvmWqj
nEGMw27xIHJtm4xxHWKNvr9mlAjE8Et2/VnnIpUArS0mo+MZrX3+uF9Qk3ODYKkp
gbRm0/NMaUq1dkwwlKslbXKkLg7f/297ZV3CuxAWoAy63DSahqeh/dRObeaq0MJm
wbxzrkSYxhKqP2/AzNIK9PB0yZ3Qk/XbqSNXyEmdUUBj3swWhRlmxjC+Eeu0pdZq
Af+1JoqAsBcwBfRuhxDPZ/qzLyAIAg5NfM0RBVO0tjnVb0E0c3yncBnKofsfpqCi
rir2DLdwMde36lodGQDFidh04Q/z0Q+kiZRSilzL3l3Mc413shM57XB715VE3BFF
MRqJKnMsOoWdELY/Xh+4c97pnJmomj+YPdG+bj/gDlNgvatTsmcx+tcrayueeDic
j/96gEVw3vzR6II/UyPeqPSYXMcQOPTVzvyM5Z0en2eGoFIsPqBY+BG2ls/nQ3Td
AvrO2bREjbeQvjdRIFDmAnyJYMqQDFqjOCZgfSubXCozfYNE8FZVmMhYSSa6JI33
EXQrD78qsf+//qFDAVcEn0U22qgKXjJ9Fb3ABwLWC8/4Nw4Drsp5s421JcbCMIRU
HUf+3bBz1kRcqWr3bI+jelA/l98+/8yhoZTkIA6PwJx0IGLCI4gXKbWAmWZ12shg
r53T3TKsz36rSHWwq/feEzZBbzg5hoT+CsOd2kazvJ8aX9VILQRemFsDjwYJr8/6
5mMhTw5J9v/4Md6SrFkbxY9dqJUqFhrM05raVRHrA3BQT/N9zdsa/iVNNrcey809
5g1WJ/rBwYcS3UGxgQ2xIY7jtbUalWo7Tfwy21nHyP6Da+/8MEDY7b4oT8t76tnb
EZ/3Vu2i1ArTJjbVj9CPFRb63cbLncCO9T8Kej/IheTVkGHzvBaM256DY6dKIqWp
IPw3lm3goL4FS+DaRT9LJuqiO+zKapVYlQTObrJP/6TGNWmJs90Ws4XdkC77lTj2
8YJm4WxwpQOU8Okpf3/gmHuRIgf30KdEFLfvFeNvzChpd6v9FXEGmZTABcpKOAdI
IPlxNfctDKTyvlDBBol4nzJfH80nAPgM03BCvZTTMC1LvQs0sGKvPlh7dnGTsL9g
1wAlAH+KnYqvJ/KDFN5x4jeIs/p/XkxOy/A2YhYf+suLUKtaL2DR6BdZ53g7X+xr
m5W15wZHoDqI1vXNEaWxhpcXffyLJ6YKCTQvSmRwGTy23YWN1nz+9MiuXyUZB6sZ
dXaUGhV1yYfedE8h939OX162OxI7vzrHEWdwfx6UhDeRR6l5NG1tvBRDPNseJzHZ
MkeXEP8tN2OfTY1Hz4Rh/9jCM3/vYo8CuGuUoBJF3kAi7kxk2duxf44C0oBVnLPt
J5B/glGICEuiAe/3Y9WhSPnZ5zh+W5iP/2OzxUXsb+J7nTMVXe6Y8qaTUu1n+VhB
qToIZ+qBFxb8+WIgo02h2uEaj+DDik1o9bMMgEWA2TrRfcPHUCKI+6Fhq0YtprHU
3N88+tcAr9iG8DGsdwD4xUUKNJQonYg3STmpr9qWkq4jt/XgiC9wERxbGrXBBT5P
XqMe8P4Ai3pQYPGwuNKm+akd+VOizA0r2OLVFhNXQ/IGk3YiOfVx8/DiBiQv0gVc
irQF+MDPTEi6m9SyX5DzMLJZCNehg57HhvI1IFSvJIQCbhNrQ5XHxp8wtSoHltJA
Tb4iHBdx0uXBXX9Xh7eSBzveXM4SeMBva233h8fBtvrmmbYIapMapdMOiA9XnZhS
GJMZt3LrvW+wntEbvPMFeU7LwakSyGF/MHWbeefTwQ0gHqIZ26f5AqA2cFN8srhu
pCLn2yf7ZHoPrbwolNN/8MduX/NIYXuV+yx8yNh2NIpNlBK5qrEkaRjQC51Lsgrw
3rWErrUaS/9D5NuXbV2IMtSbs4SMNF1DUClxFhGZ/2ylyR28nukRZd2OIBziqJwF
KNNNT2P0c0i1RmwtTnlF1SC+779zqvf6cHvSOkbZMv6ZX9xzQB3dSs9Ek9bkHWMP
ECYl7L6jN4kEgjgN8Amii41GnDsGSBl4j7sazvq09EmsvZ5etZWJ6qRIhEFPg5yL
h972cwk1Zlj5q/Wtbc8VnXNDhx56SgIoTUYSDsSA9vHg1v3ov+KumMoD3oJoHKIB
Etq2BH+zD0y/cTJIhXuaoz62gZFVWt0tE5NhZOZXBZoXJFIVH+zP8QCFeE9LqTMf
6xx5bzGcRCOXGm+MfGSFFEXAE5ezo4oGCvIEScYlpQqd/wMaBkXx+1xwfekSqfu4
8QqyyE8PBh4yEIqGHwgkBRdOl73z16bKDphYWlar2e0u0x7bmwbAjAVxdWnbUjKO
OCRnIGe0CGaaUjM8yh20eoto++yrLK3R9NJCmH8nsDrQRY1eRQHTxTB2kWeWIE3C
fi9T2N3Kl2+H4Tya6uSwcOx7SQUI1Ai6+5Ug78B77hz7rgMjStyo+L66J24pFjNZ
NZkcfU6+nsMRaLePzvPm+aU41g2jLVSZNTl4/7I+GHd1kLlqsDI3ajsGUxPB0bBk
7t7ESXm0vkWTJWUhRAj8rXApVPVRL2724gIPsrRBqo0WHXb4DEfb6ZNS2ImCQVPh
2mq04fuLBy5Hwarm8tk4qvKghcmvHY3V9eUg4vtuiJv0VOpPRigHKELR6yooEvGm
2pOGPGJqbUtNAIZPs0KIr4c/Ig6rRQxhiM+k/wSXZEXreSmHfUB+tZG3USnpzVY2
uz8xLxmKLn7s/exj0QPwPadFYWbeVp4oVgmKBv7uU/OQ0GozOOA9kCAHmwzdHgp0
Bf8ILuPge/FpPaZMYSkOfebjWicvn20OrMwvLiagaPnMt/sn3TepNz8fzc0B5vDP
KvH5PwYabzNx2hE/YoanmW6CzE3swMXlHnYipE5yT72v/PiIV4a6eQagYDYM0E2B
bibufmI9ofiuk5yNuECGnaQHG2eGtl2OnjkyK4BtTY53J35U61CgfrKCDlgIn8dC
yx27nw+/L1x22gV/ODw8bSBGggKmVcH14W0iEKir/WkyUdYHLRQjJMiPEKigLP41
s0g2RJUaZxuaJV/i/apYKmpt8LKO/X+ELKYpNbL+ukqq7djZew/bvhAlDz1mQDO0
mvqeNmfNS5PvTbVKVYcpIP4FMEgcXH9bvIzlccdUZ5bgXjeBFzVFkAqooemYtZcH
q8JvUyAI9XgssZ9dScL3ZtlgcRCBPxl/+x51a1zx/AgR0Y0WKE5KX4kN2CwGzyeQ
3M6GS3ixWf9gP/xz7Ut2Ps1zqZzdM7OGFXj/9TPkCA5ALnXiVM7lRPQj8Unr8NoN
PgXmtqCwBapAfcCfpiUKoh1GeJwkphNXVM6mv+wAQqDJcixRA9E+HfhVssiCHYOq
gsfDWYfnpesY+YPT/SA3M7bxBwPQclAboOAqS7ly1Oqw8tw6w+vCSzN2fInQdEpk
MFtz8OCHF0FtIOxrRDTuuzs4ynqyxi4F2dsJB9JlFdq3z3kFs2g2Wi4qsdiOMgx4
D8Hcu3dpzc7o20XUOhC856p49PubLMt4Xz2yPsn7WxkZGDFyqx8ZyeMjihWHDeGZ
G7vEOUppahZ7Yd+l9S3+PvQ5arbTkS8y+447cnoKsmUY8VGtyFCOxwDzfZS3IRic
OzP3DbEflgidndnUibYOtkLJ1tLVFk4OV6TuqgQonb7pYih86XTEEZSQGJI80fvb
cRUXzLkrm/M6Ott5zd7jSu6iB869FvfDW1Fl8TpL5Q71cY4bzyJOkEHvt8PGVxCe
2Qm8/ZogZIibCaQUAPvyPmbjdEQ8wFcHWt/JOUIx+r7mkwIoYuZsF52y0gMm1sSQ
TF7lGUp3NKOy78vluxpnZ9GaYb7JeIy2ILEVMuTCVkEHGDBj+5k0l91xuUjdaNtP
TbJOdit8Nt2hc3M7JYHNQamz+jY5oowENRL/BIoQeA8yE1wX92dDiUYFwFTXw3BO
JGIgreImcntzAiAb1SjuKfo4XexwHM2SDTy0J80DfZ2T0fOZZiy2QlE0tozP/sL5
IMZ1Ope6a1eGeUyDFHAoZrVC3LOw4dX38SY3CLtoKQqikysqTGqwXowdUUqxmuE+
uTmgXkuYe8idwPtV4eCuW1hXaRfEwgpSajxY24mnwHiHpzp+9lcQWBv1gSVafiGu
NLEkmCgmdCFHwDj6W+HZd3YZiAXm2f/hLZB2wr+NvpOxfz2D3WlRixGJDT01Op9F
IECUt8wfDZsZXSFc5rtx7yjeOPS6dn4WxT1dFdgZiRAxjRooQ/1w7nk8HXGOqu4h
Ql2aDxtU/rJ6IaVqLoYQ20aNWXSZFcsIg1c4+hNAk0tsrQsqD6b0Chtst+vqArBE
lmtRYK/m6E9meEluflt8PKOVX7D6O2lsk0inNp1ctcDihaGFbsb23VUpYmTosK8Q
ypiscYY/h7EO1qTOkfyv0VDlzZfrbiNklWMDH+Ow60/XCTLDolfoo2+dQ2BQNLt6
ecEurrdrL0G3MnTfc1NJehpicoZeRZg1BZnNbZkpYPZw13VvmBNAxLHhCmbstTUX
r48R2UCtgrZCRkiJgINPOAnElWHLOoYVbVeNUk62bUppa6i8kJ4DjbgV+ifeMYN8
qBV74iQHB4bdPSbqavo6IZCAca7gElkhIgRUo5XZ+t56VJ5EY43WadO/TZ2gdLQl
SOyVr4/xOYVpCUbmIYnI3V5a/hRmyJjYVVr9zwVgZLRwRyHe9+P4W4nmkftYuTJw
JBLXOeLjULtr2fsqFn6E8A7zemaorvPjWi8dLjVfSXY+31aeIHA3wQIcI9B+mUyv
++MevzHvsxZDUCKUxqqPL8zKiW/1ywhnutzq7T4xHOzEC6oabL/cjgAPK8XYmvvt
J/jHozsW25Pl02bf8AXz8OzNMJUY22xi4qlkq3igj1A6eR0w66fVAsPDiHSCt+TG
uApxsrCydQWZdEe81/TUy8dEWfkK+gQaz7m0NuQWPFwZaRk15ZGqrjJ6BcHi24Or
5ZTef5BvFvSh91ABUWXLAwcDUU7gh88bcV61YKJ1Nj8hSt8pDM7SIhRDPR51iNvM
L3uynhEwkHrgjpHf3xhFLzvmBhPU26+zHqIzs7fM2LzZiW3jkbSChnpkj5OphOg9
bY8h0U2qC6DS3oiJdjYF6bGTh3Vxk/8nI50Cvp9pfd2Q1GLwiYqV3XDmwt4cpiuI
GsUASEsc9NUSAqT19GDma6kM39R3ebH/dLqVryl7AZTEmyZSwcihMSUdyj1Q78GE
YxVZO0LtnNaVbMzn4s9iL9wEcYt4xrrJq+67LEqH8gs00UnOed/HBKvRTcluDETF
UCTANKDReoKILxcKvdy2PV7LenyEnPJGhY64VXPmLG70Lm/j7mAw7Dc0KZZ5KVdE
iGLzBeCWufPeKDOCngiPJI+XZ+9JuhC3tXtkgIwIgg5NW646yz/E2bYQ8DHaD29/
y98tvhGHpOK6bakTFQtNxaGtVEngmqYvzzDDNCtUKW2zugb0/zBrTftwvvWlz5rv
nBY81YUCEeeTFQvFvjGv8icCWO8n8WkWP5uS9NOOIVlkn46l0OpTPrj7bNBmkyeh
tdsUs9Yzs1JM3WmZ4DBNpdbbF/eP5D+F6kC1QIQHh5AG5j46lv8f9N/8yNCLWFMS
18jwiJg2dm3FmfdOUM4HpAaDadIdhZq619A1ELb2LrUotq/8Kqr7PzFhrX03QlQu
vraaVNOubHZPWUaMvcoobsRP5BVuoasMUNJt8kbk1IEBH96mJooy8XQ23O4r5nyE
IzWoLyUTf/WF/GOd6HGf/E8JbGYgTx++9G1XUswTv9bw9BKbgfV+sP8d9jOtDYfS
8thmgyaivAToC9MMRBlGSe10ZNWXcrxg0K/1d+nlANi6sKp4/PiyJ/I9cfzD2rpF
zud9QRvO0w+w4n218v0GEc7BgpGr5U4QS7a8Ru86W3FbsgeoLkIel8v+tVG3tv/b
qjKYvXDfT/ZQ6WmPkr5yn6tBMk2CNaI4nbHr6iQvnVFQIh+FSdHih2b2pDOrJCfM
SKK171tEbsNWe9fvS4xO3+iB1NysmMz8+GC5Ivb57nubU529M0ubtMoHtNX/ecsw
FixxGRmNWrXXIu3jvxib3kfuk3vojJEueEApgAw0RQl/vp/EAWat5z4yPSkcpU8U
bi3y+9Tn5OurSu3AIP2FYgYFDBDC3gJ+MmGNlDp7GRE/AAAEsRKwuXAZmT8QkJ0l
uE0/gmEYyQ0x67UIWLXfPhR54PILACC22s/E+iabUETfi7r5xeMR7ET+FJZTFgYM
YOQMwwP2V2ez1rZQ7klCLvP4eyGE8YNjlR/tksYdCwAGMZACta5hxFDLq7b0zITO
bQHG+VBf7M2ce/bIX+cJm7sW3f6ZsHVPDTjVxK4BrEyQnMBiGyo7W9SeDVWyWgaE
zI09SRdN8S6ztWv+kfjF8YXRUEo6t5SoCDn2VVNNLQ4vLQOph3yPiZd7qdcdzRQa
CXqCLiuxK4wXaEy+aui3pE7+orHZILRpIA9djxNFp2Xpfp/pAqiUupzVusUMmPIc
LqUdrzGwoMpKQ3e+SHKFRPOwXwlG8FIO0owTnAjbcdelFQSG1DxP6sXabPuZO3QI
grX+FtapyfQlINfgu2xofMYCYa1BZu7ZJDyOrrZroXOYic3TmfDKYbbpBNhAcSDP
IXpOA60OTY5jiNZlgFxAGxVbCRxCBMiGszzCnmT6bURn6qdWecsdstBEHgRKcjHf
cODfyNDrVAv9PdUfYmMwGt8//NQU+KjXFyqW6HQtUkDDpCTSpRkV73CaFdWHxjuR
mEbI0bWcq/17x0OFT9HOmiQ8+ucwZb35eprlXSTYCnESGXVEXWNd78al/dYhKZdZ
TGyGj58LS/hhfHXimVfNXD/A3x2uBgUSQnCXZ7sRIO8lmmUCcTh0+Yn7mn3Dghbj
pC2GJAgPKLpFFs7LS9oVDxSIKRWXN+Q/79qHhOj+LZdL+XfpCo7t7SO2qyXJL1s4
ZnEJboHFEdQTud1rU+J7LGPCsvAXmp1RCJCRWwldHDsGRs28OUGaA0Uk6TIH0Z6f
6OnLB7F4wFrcQN6HX2GuYK0iTEGYqB2LDet1sNr8PuCPvjxAuJXcnXucVkF5T89T
ku1GdkBupJ3KApK5wM2yTR8dG30ZeQYTykQGFx7PR0gMWuEEZnfxGFHKIxmgD2hc
F5JPaYloc4d0KGUOg0A9TdBE9U05OREoD+1m1xTiOy3zHxqcvdGkq1ZkhVuwBryY
JnrqjvyQlDP+y/tQiqxdujjxnBJRLXhkBl5rgeLF1vyfK2fjS/JkVlehSTUjLggA
ivF0fW+9VZBrP7IY7lKbLLc6vsbWN8aNolHeP5qNnZ13UDIX2R8ln4ZtPVLalSqK
0vStb91wzaxE5qk72s+PxDHEUyrHbeZ/mdNV7X4qBn83P6Kh11iTgV0ISxZNfGRK
wD2LACoq69hJ7QEAlLWpTGK3LL7iCyQgYhseL+LMJxwSpbgV9D5b6a/d+PrOTLN8
fWiolnRbP73bmwVcS8urjo8grljdOvPhYHTrKUtvskWgMhqJ7y1bWgpnSGpQukEP
klsHgDuSJAKdGTWgT2EhGURAMOp+dXk7RH2kOXuxFwyX4u+14d4LO1ykayMrXX35
RgnN7e6eGSOEGRs7WGmcni6NPQZlVDbLjumZUUIeW3CJy/0b7qoLT4uHnTW34mqz
OamR3Anpq6SKwra1pSQFX/hfUgNE0AWkOBllNZ/oq+6qZFTXtVA6cR4AaTV4kFgF
LL4z3/fPhUk2l+PZOTsXC0H68LZfJYj9T2mFCaoLhMHxulJgmNt186hQwnsBw/Nh
keHhkg1fRMoFmVEYZ8hrEnbQSUfcQhpyIaHn9sCSiJEVgQeJ08WG9E/3FZdkwKvz
mqcisF79GmRk1yyJFCexRVFAHfoWXmeCRyBKCirAirtZWnQ9nhuOKj5W1QChhL0C
WXgaaIkb1zzvD5+hRi+YXQYYBa2yAqJk1NV27Ln4GwToivSfKFMqQGQqgRFqyF5i
YXzclkjAxeiFvx4aGev0aFl0B521i4Zrp+qUL3ZybJtIR++ZLCBL9wdaUKjci5vF
B6MW/pHsWCZmVHffynj2KRYP4TrMKD9GibS+dZNXFcN8DrsdRBROBPlsMRKrIUPf
I9pZq5vNSd/8kjcTwCd3HDdgmteS+M6ZCR94xAn4RD9NyeIUmLE5/1dg0pKoSEOK
4LdMpz2Xyd4Ki8r5r8LtrI/1XumZQDSTyil3NZCzak9avR2+PMZk8XtxYBbEQkTS
BHA/Ivz28l+YWEMkQ4nIa/GIZAm6nZQ5pyjJ/j6wxh9/9iI78PQHZ3QfURGIzkXt
tSdGC1zmVQLKw+PTH5sY9nIPq6yJ6jq2N7AD2YULMqwyZlS9X6FTw8j3Uj7uRq/e
vXENRoBSxBxE5hQ+MbFPyXJ75KkmKa16zuro8k4PKzMHwtpzx40ghVw4W1N49XQI
K7ti+fB4kDkA38jK5n3lhM1N4nVD9jBrRCIjulH4pyUPgNOBoSLoLyhzs6EVPchd
XO9/ddxvXdMyTOo80kcdskZpsmQ3KxHotV7aXdU7+MuR4dOBJQrEhvrrwyrVjD3a
GYx0gpqcbQqAU5PqgoxF3slBB3O+tO+Ichk250mihB/7/qdhu7ahdAeiy0/Ucmxu
7ktTAEm0gaZKo3Hd1nkKbPmUuOG2H5Fkl7W36G+Fw5zJzdBn/8j2EYiJnEdwqM2b
l4Ez7RCBvRJNJkmSVLvdr3QRPnDnR2ObWGUCy0O10r9kVPGDjKam5yY/bS25KKug
LAxh8mCmLIwtG0Hly01UGArBLP9OYVPfPMAaUMJ7+1X58Ma80l/Fky30irvXfMve
HUl3SNix1359iEKKDAhbUXnDARvgeze8Ch7aBOJ74Kyyp3wSqqmy2wyomYdzVtiN
46O/ns5hiapYWbwskLlirzZGzd/W8J1x8UiKWF8ByzAGLBRHTK3ckNPE0n9yU2Sc
1/1JipsAv3ze3Ro2DYrZwYxp1Xpaj7SMwj1L56bLn0pJ/jJToarOG4Dnw8wDe7nf
obR3b+jj5ifewFxUbe0E8IzOZp5r8DKyDcdB+sTv6AyB6LLpPYemIC1sh4gJixp3
VHfi9JQDdK+hS/PbEvDCo2Y7x4qg+0fIpiNm3kbSOcq7amM9MpfBkIfnCfBQcPoR
oXFHlMHNYW4BzN1wrI3VaKpBBLJQnXtS9HGeooEVLgq1K2QPsYbbjbCvTwE1hovy
dEKDVRhgxu78g9zgKVl431bOLfb/Tt+GHywW9wEmdGVmLcEALNqRnF5YrjKRGotq
Kv//lR9WVfrldsUqMfYfxci5PRMYbIKOlslVsFaIS4RNmZVENkc3DECcoSQFKqIM
FE2QpzNm5I6aHYQzAkk8hBUYsjnzWl5LC/j7ahs0c6hGvc+MzTK6bHp3uVlDfcaD
4m3uTKnATarTlyrwd70knLqe54CWGsSHUsrawhbezXNk/b9Zt2ES1z24wKF4ikcU
vB1BWTNsFNCPz2MAWwbK09+KGrPbWZL10A/AjcG1a+UdS/QqdrzQf6wRxWbO4633
Wgxk9tOZpXCKQyTSUIwiy0nYfEXRo+hJyXlT+3st/JRZC+fEdSKIZUBVSZH9zMNd
wTU4oCh3JgbxSIjOBAXe54uzOnPf+NiLkYXdiPbpAIhaaiKKCWIHbLlHgiPF3dY7
gErSYWVN7TrdjO5H5YhH4XiWYNlcEzk9GHfFK19QIrNZR2DvCnEgWivq7Xjv4z7C
HN/m4up6ibw7CK7dr/RxCv5usjFw6iNooVWWw0GXOkYIsC/00ooM001e0O0yt0Hy
OMVxpKYBA9nzVxooQK09TCTgZQ72I9bY8f5X/QwA0cMxqMk9HnoIid15KMSPFGyU
fQ3vwMiLyFar2sI5HQyONR8DvO0nFuYmf7F87GeFR9cNXHXmJILeYekwWbAPGAQI
/U43Y8iqoLh5B0FTCWh3l5c2xbDNQ8IW8P2RgNp54kYBpRbxv2caS1YrXnvjLJq3
v6hJ2Pq2cn7ZYHeQ7q1aLlsGuxK+hzRkub1Zyze6LjqKntXLcx0uKrkhgg9IGIRq
k31YLJT53DcQHTjb9tsvDsy4aCigcE7d/mrl1X2C9hmBuFHdGHeq68uYHxno5xRV
OFu9eQ5kdzYm3z/MDi6zEu+Pznn29QSgYalF6WnIEaU0wsPquUBxy20mvkPp0LZt
IcTh1zW2l6Yp8t1plJbp/j8PUZfKzyPSAdcYY3ERz/9V8htPKfHxOID1BbyAGbM1
Yph1O85ntbo3wptzz2Tv3zwQEr9nvtP5bLct6hMcw4mNfRvwNcgmzFuqglHWb9Mu
r8naVhJeqiJcqXHn5ZEXAEsHVICODWi/GO5YBh7IMLWO6AwisYrDNd+dlslps3C2
OvJL+t7IIR7LK5mYFXMG4bUwo6szvDoy+IZgO089tV9p8PPkoKSnsGtbw798j/Nn
n9KSs8Mko88X9eULAK4NweidnCVdPdibwsOYQ6Ol8tYPuPjGHTphP0Debn0z8AN7
ppzarI9xfkLYPW88p15S8XCU3+xSOUacUjxIoWcZlIy6RrG5n3afAFev0MERSYKA
Bey+I2R4KxDIy42/rBhTCCHUki9cZwVNxx4Cy29jMpnZNOHUC+I6L9l1gtaNlig2
lRQ2GszzXOs3CJ2zlKqHsI15B2FTPHblEWYyvgf8Y2n3kBahfIt10pScCk7g08zp
rypbGJCVQYHVZJ3HrLPEwF+yuDqYvB+0YzXr5LnqBXA2zTvAg/e7fK6TPSvvygI2
MBVfcNkDVxMZYXazNBZiMQxzHi99u6hwB+P2AXLcmYDZ78BzBn5mJ4gIvaB6pYtp
HSBSryE556tRE1L+hEDiC2epLI8TJevvUIez4YhIW5i7N397omkODrV26rhAigHV
fKIA0bN4VEOYW8WHL5NYR+BnnSESx3WoHss8MrwPzki0TDfjwArf0a3HMSGWCaQ7
cuCDjKfJJx4UoTFzvxA+GKYdecxADGedb63MnI4HCczN9Off97q9hoY8arUtf5jC
YTe8FYgPr2ooC1FS7r0ayrJJkGeUmPw9/X/log8TSL4txN5QUt22NMuo75q+v4Eo
mHGmPN0afwAY2ujDFGpKcp6FjRcOPdtQ1z/tHOUb/d2S6zI/SvvrgdY7gLNXTBJC
C0PuhuCa3nVLc5l2bKCP6q18Occ8UZ4hJodBKJhSDGuFfSkk/TlC5VXXkmGFroNs
fo+m1incJPHmtwkAkvZbWte7Jd3QJkhTQ3z3fLsg/cBwsHwju3qA5W1PCY5Ye73n
FPTGa8IGCcglTmHUAqSxBM5Ti+S4im9/OIdOlyTTmJOqCYAK90k8HZeynKKCSJD1
E+XyeD7HJkHy8Qe7Q77LwTybA0daz1cLOdEkdlERa+7yScJkEI3chfg5APv0wnwk
I+ThL+NH/dtAhzUssP8v1O17YFR5MMZlhUtvdmxQMjtXMuBgTgBU9v9zypFhCMzp
21QED38SnyjLrq7//iX74XrzJG6QRJodflhop2fNZDFyhF+nPS6nUKg0uKjB1aoj
4/TNFMx3Ir0HcWig3YlbAFJYZ4wC9VI4B4xvxc4TE4AhPOhSF1rTUoOZUjR4a/bf
I4t2xaq/eFKcXwmlg9MD1q1Ft+OiFkIuJ+PRksUvIdftUMyemzeZoSEKs7ZbHP2G
v2Goi22Qs44gAIMrKrEJYVRQWMACVvUTE2qPjbZb+MFo4wF8p7U43cRSj1JNHXVm
jjvJpI3cmnUrBpfwNsnsJWjffmFBNJuYKr/xwdw7YgikKasQtH/mXZdkI0j203DA
N3ytzK4yzXP3jjSyadGhKQbU49S1lHTtyLjz/Mb6z0qWnonEeVbe3Fon07OrmcsD
WRF5nFINWhAnKbh+PD4bba75zc/hcuXoiAxNyzcZjWWlJAXlF/rUAv8hWmBe5LcC
0XisealXYZGGtGoY0AaKKauQFH6LxxaGgRJTiIeoP9DLbR/0tckKW5Z6OA0WG5g8
YcGA0saTeECAb1dtUNh0Fp/tNDcYlsFN3+xdNpIvQ+jhUyK+iZNx8iTxD7HwIgiU
wQQHaeeDXdyLwHu4JNnDCN/82S4EvrXSE6wuZIuMcha2aKJZEywT0cIwLeCaCvfE
iRAaqmKq2hLRK8HMiKf5c7yMHCYfbBt/V8ArNtfE1RicBJmy83pkpk0DztBJqju8
n5i7K6OzjQ/ZYP+Lco4Z2D67MeHfqNRvWkICkYxrBa8xQGWpHiDy0R8uszTSnVG1
BZc8EaE4BSnE3KnaDV3645NJtYqmv4584kh2W3elXojMOaEziu7SG1KMja6jQTXA
pBGJMe8oJA87ZNsXjtELMlU0Tihx4WfbU41k1phmhF8OxzNVADOFOm7JnEsGq8pb
n2jsm+0qvBggESQeN2/gZDbsSwkelW0AdTO6C0BsxTeTFQNikYA4Y5aAblargy7H
X+IEwgVUB+YMX/5aFUYE+0nHiMsUKl9o7VCMYNXOQELmA5mZqRp169bacNAR+nOk
Hr2g0/fLi13Nb66L6DYuMA2BltnnmwkQZTshSPKPdBORj5PXSz6NFyG7kILbu7A0
kN/ylOMMzIVFbXbPc4k6pjOAxuzHi3/7grYil72dU+u9LuD6r6UYCmV6uwLaw6GU
set1hhfeLpjondj903mV9j2FSLXSG0c/MSGrJdSp+W92Cw/19HM00ZbqUYqVecKL
NgwiuUfUXml1lSMZILp3rJppKnASFkFbTABTGFcYDbkYmZR5f+FFnHBq44xxjKAq
9IKDZ+BxpLSsaegP/RSCZo3KjDJIO+ws+8WLCtCMLKAddDuWeMOPMC/i+0Zfs/B1
l3NYJD/vryUIcLzMwbT0ZYXdHSXecrVGo6JSvE3A2ZxSu0hGQmHyhi974oxIcr+h
BJ7lG8IJGHDh7yaiK3Xx7tbg0SaHXR75ghGrELY/N3OqLlCHNlIqdHvwuc9ZQLlB
9zBRsYgqlvj9WhIWJlTgxxeQHB4bG25ywsyoJ8w2fy0hIUU1N+pIyQ2NybXR6JLD
fgPdbKOkXhlezAETu02bMkGslSW6KVdS+BByS9WiY92+DbTWn9KBt4huXkgTP1Xe
56Pizu+c/Uj0J+EclPo2301E0hN15oNEA9IF5vC8DVjbi+KLyIK/3dKqQsu5/i8L
YwqpcHNMG15+SJHNrf8AXgZWpmpjPaLNCrN2aMEKFkmMqoip5/qivcZid93FrG5d
OdAXWNgv2Ro+/XE0BAUHHTDhD6Zsd7WBX6zMIMCIRrE4QUA9jdZZnqyykBkAOTt+
aaHfRnfUmbirM+NfemQNzJW2WRvGYA3I4P+Llu0tz1R740weXdfRi3ybFwfSLcPz
q0cdh1Cvxb/pn0MUWtqmSM4BzAUaGdklEOlNOW3uCB4HpfafenajyF7l6xeO2qLp
2cKaXCZNFfmmH0x+HBmYcFGU24VGnb9RkUy2+i/idJRMUpTMs4Sii200h8uHt/FR
BEhO9JdSGS8evLSRW/ZO89ohMNCf3pzJyXiHagcH122NCeyAxYxOx+HJrofu9dm0
XuYU4IVkJ1eP9RErfzqnbOjuLTTAhjNFZ8a757JlxgrLKyUu9WruFd33WQ7thFpG
wsiYgjKRNtP1MEFhDugXjPipudn3/uzvvvWxIYGEcUR6zUyJjiXpK7ZM4sJpZx4B
D8hU3WyAGl949uwD3XfzGvgpTx+OvfdOQ/ip5K61qHKFIuXA8yTDvqanMrUu3E0v
CAiO1YhPumLFcn5ztYOM2ELr6xTm561hC5DFX5Mlxq+1ZAxSrqFeX3jaL2qZfThA
CdAHRi30bwC3nkzE/W1Lk1vEkdDJZPXIhWLqi2ddGF6NguFCuEUy+hJ8LWZCCKHU
VvsvCTQAhyMQWnuyv5fZ7pUZg9sJMi29PxegS5CYpZkEqa17R8Ci64DPyVswLfb5
ROC6TXke0IanClntZyqEQUXBwSvXOy9jK685CodEKzUFjh64N6Uxcass5TbCNZ0o
dMC4h/IiYFovBFmUKU+ECqIYHk1BrmCorsqxF+QAEMJaf6ufmYlCwC+DFPOyPFti
B/dTdlDvpMO/6Fl+//R7aftDEbAGLihWzCk+Vq4Xly8nKJ7VrOs5Q7NWHpuezQQs
wz/gQOGj0tTwh9VOS4mUKTbJSWwC4S2txc6R5aT/4pEcB9KCXnWRAw3VyHB9SwG7
wOIQBss24M9V1JLOGGOa8okjIkP9yoWwl/ZatmVvEhtyYUcHBLZXREPxpgtYPHPW
MurOwbZ3uxIf8KXVFtxk0opilgJFBw9scIrtU+hbw5eCDusqLzDKzGU3Sd5tT0Jd
jSU0kmOW+au5slX/S2lISv+IZBf44rj93ZDPQyu9pbInG2ilRaVOl7P/Ua3AjjJF
wJy489w7FWqykAtcu7Bl0Mjdb1gCaqnqEYT8glOcyZNWOD+F6Eg560rEdPpZIY8P
xnS4qcteIfoXetP0qAfYx7fzjwBKgun6WNM730AH8K4EEl1guu7lShLVMSs0FiHM
RPzcG4i0V2l82CFl7kVhugL5+s1+AGOISRQDMn8Gzemuuw7IE9ZethPHLSQBbIML
Jo3TTxhXSrafciEb4iTn0JhHLcMxRgwvyutV49gHo2maDntTiqPkYimW2PIweb2X
7Vz04f3DsDuckIV/muFOkYoJFXhgwv3oXSjrEzLEfyC+HuHvKelxwuW6PDqSYrUt
Jbxalmuyly6tmkl118dm5ZptRygcRPRoaL91ZM5geV58GfKHdCSlKZKUKyjK5ENQ
PXJVy8wbRHdhNRK7c6bfVkMj3t2kPwODLOjnbvKjVxNOsUlc4eOvkenM1aynPkWq
0UR/2vN+Y4dCp9/r4co1xfHhCDU0qKqJJBSO9gTtxeMU+50BGmmgl92/niiAkbG/
gh8x8o1GpGcdRZ/s8dGkAFLzSqKPu7UpBVSWw6MuARws/ksQRW+goG+Dnyl3AlNx
pnbZUN8IZLRTw2Fd2/bavrzb3/Xl9S6KnwQgzZau1en5JXi8ODfEtLVy7QlhiOFe
ah/3tvBx6EFobdj/NspEo7PZa1st8+JZDJn2+K4czXzkXtINYUc/ne43jjjMd81G
KTRrerwCiPakg2xrusU2EgVt0Nyg5VfeWM/GgL8rZNDmyn5gKBpar9lkE5JdrHnh
0b3v7nF494JcvkYyp4gpf+31WgGCl62hqM2IJDKNHRfEdraGVt4eIBU6g4Y6LZdy
1D4gK3PUw4BeggDWMsYXuUql+A3IbwoatN3EEWFI2UF8xzw3/57z2ae/KD1wAsMZ
hclsSJirNo3PhQyciUFpQ/Pmg2MxLkktP5s+bh1jBrVIVomiVKKflRnbin/piEWt
x896H6JKKl17kTgbPUvvQHOKkcU8Aguot9twY9dFM4ho8wkoexMiT295UfG5Yh0J
VTXBPKrjhss40DsXTxS8dhiaLWTuCY5HiabmjJJ/0CdX3rpZP/mRRaq+XpCJyyoT
pzvjsNi2Ada6BWQJjKRyfJMoojF+tFlEFJQDtAYBeRZKVT8Vl10pH59Xsfw67LjJ
RMO8A4uC0noCW0LvLj33YSUf5YuW49Bzz3rlMLnRCizJIbENrWpZDkRObdVjI51T
ivUBi5eVipfxlJxrWiVpc4kfWu3rgMI+Qek4Ou91W5ebnFiL1uDDOcohU1AslQ9H
22ogSqpSF19eQ1VaXLMiwT1K1idpfSprSMkAheefIg03+cyPQjn1pT+uClskmtHS
ZYRUzsEEHewOIuVcExHkxu1SqAjfOec0TiADgiYV7+9cc0PVtfmHygBvCBl2f5K+
U1cY72LsSOW5CM07BT+pFOjWWpNkYUkUFzxe7TIedr4kDhm7u9YyB6aFFwSviY65
wLT5mWuFkLRkvmmk8fjcjhl9BLYdNETafg6ZSYXVpi3fl44vc6FBAPhvUzkqw8gg
ouOECzxINOZRvsG1utt3ZSELmg26MD/pBTjspV5DUOmUx612XqPc2+gKYMVW58zy
GtRFK3M/uONHxZAlxrDZkVKFEcRtvQ0+yKDS6M0X+2Vs3H/CNuaSYjPtnmWk2C4u
WI9vSqymAEjxSBPfDLBwQnoaGrSY88cu33d/0vYCACVNyTHgMvG2zqMJO92/c7Q3
ruuo/GYyUnQZ1unYVEMiyGpD8XXoYQi5e48Ejb+dV8G1jlUKsWtXBUdmoHAubsbO
WyeeB13mIvT/AMvdQU/yjWpfvbxBxm2sBxgeDnkS92Ms0guUw/VwThgMLFxESQKc
/Jb5ovz1k3EQV/lHvZrqQiLI1f9RJ46QH+8cD20kqZc6e0yO611M8r+r6HoMLT1z
490mUpjAajMEYVnBilCvgjAfwQ5DmlbB88bUyZ7cec7ggf1UzGP5KUZhx3+bdRgs
sI9atAASHg159uICujK6KI1VsKVbvvqFbfVtzDfYrjeJD6indCQFkpvkSIr2CAiN
wxWh4pTQP34bcF57M5B4/8NWwEeDuYEIjI5+idFRhrlj1cm3lvvuVjHz3foC1YAg
Sj9AFqNyOtNTNn/CDfW4Ux0OkAD3zRcsOPIJiOTaovXLpXxECAHrqKLD6jwhqpyj
RZT2W/Po2OG3tAaYvW4P1Ewz68OBsgC12HFNQw5df8KioYakx6Y48zXB9ZxkOQm6
6dMAAySRSIGzXGjk4JXP9asJ6zaW5svnIWKzEheKaUwVBvHt6ekQmJo7Ndj9AS80
pa+HpinmE7NlIrzXuBsGkI5g5XRFiXCd2G9Uwd6Ztppg4hyHOnWReRd/OrM/P+Tn
LpjGN9nwVQDmQxZgrCu9mBKOoesiqss3QhXPxX8+SyP/Ur/EwH/n38DEVGDs1nms
9WmnDSZqayRVWkxySqhZ8gBb7mito6noUFwtWY67jntKTuw0w4TWAVPMSdUKuBVS
ZvZjpg35hWEJ2Bjeo2PF28GzXXqEJQXkhSe+eistRRKFj9nCnlEYgJ/jI8WL/wCY
3ND2r6/xzQJPSobCFVjcZAHxtl0PJ48GouPVZC5c94OKAooVwVJDqy4U54P6+sfY
/FV+wqwa5pNYKgngF34/UFm9pNrU/ncyUr1RB+0XERyHe6b4h4mNMIegp2d392R4
Gec7xmll0x0HQ459soRJij5bTWupdM7O5wZfy9PKNwQUPkXRds9gOy9h5+vwmLH0
wUkeSxKhs/XIsXlMm8Z5XvKT7n9avotfcAJisorzMc83rYv/bIikVJm8LVXz7HOX
1w/QLbLfeEKYtNFlxW29CSIhn4GwGLHM0UrOL11b4dLuZHxVua4zSS2C2KEk8Ws+
HgKZEfnrvhWf2SghNrL64hbaetBwDnCOb+yZJtCDZE5AKN2NhYrYmFDcrncz1diD
98LDJKfka0pBKmv2jqROQXiN9fwLUrIsoC89iZ9igriuaXCzUM3w/+Ub0bvyvF+0
1eXA6pwpeK5xCRrzBNjfnzFltuVzue/HlRtOlVqoXlp1EE9PutamcDDXDSfxgWDM
CEhqfTRXFsol0SU7C11vdoy7mrBPl1P2+ToAu5PsZ7FVJrzpe12wC3RtD1bSFckS
MdWzfq+J62p2RwlA29CKRh3nZrLBMILHN9QFBhVUtVv+fsbqMfUs3YCsMTZzL6Fp
yA4ReV2Du3sQ6r/xSKvrqY9OUUmfd0fx6bowIHRDLS6o99Zu3oVUn/snRdVB/NLt
CJh86KQ67GcmbnHb53EcLe4yDEjtacsfXOo5RPc/XWiErfO8vUWsfcw03OmbrX7I
6aR1f4zSwx6iim1ylzcYfM8bB74xKZe8S4fOwpRn/mav3xCXVm6FNlnXo9RlHZWD
mDYhgYjTzopaW+gZCdV942nmq3d6nVRUGAgiFrmoRE5ngxwFsGdg3J2BxOYgxi0+
f5M5uHPDP20jjAP7lm1S6YZkJGH4Kd4vodZk7K6qE9h9FwRk60kXvHfrL6/6e/iJ
IBR25vNJ8cVJX0kO/okDm1ddqUXybQOtvJcIdJkbM3Xur3W/L0P14lFFn3xRRsKh
zsRfiElPpkmm4xI0c5LqWYh02Lq+M/HSpYgatdaX61iP4qIXlgFujexIVQbEZDny
T4zX8hHze9VW17HkKtWcRbMLx6Ph7tVHhYDTkx5Xs2NDjJS5Oygj1b9Ge4dqsHsW
De1HDqIuj8HemVwwibs99W8KX1v9b2oIQB17s5PyWNyruEu384ghKBAXei561iYs
6jNDGGrDGB7A79BBLXosMOksUiOB8btOXzaHuM67fNoKOcxO+FIUKcU8AK7wYxsG
ov44jiWqsrOZanOCLYTitjNCCh9hMcDXsWoHMEXYMgxFO71x3oUk7Q01KTSB8Dy+
RfHTJgclmp5E5Q0CFwKVE3ngnuagmahe5dMdaTn7w/VLdDCZJ0ab1Npo8K4CkJtF
CQ4Lu4onQNwsxrcld/3/Hb9cSxg+/XOvV3DHGyaO40g8deofiO4MeLRfKraBnZ5Z
TzcFfEC1tdsMSx2flA0KvsxZS3Mw96vnwWBaBtiiBAtHI+bxcfyGpAIytujBe4+v
u0nO1tZxttUpyk4IjUQUTv3Uy4fX/t0R7JQevoRHU1nbxJfSb1BkDiiDLctUxbdo
ZpCOOgqGH7m+KIs1jQDYcpO+7YFC/0W4JJyYEC3vco5P5xKAsRQsgfKOUL2V/zDE
Hiln9Z3jTfkzDfh8xQ25Y2y9jmlvh60mAAbhmyNRQrXW+eEjyC5yBNf1y/UD1/5U
x5RqflvX5eWRy93IWBB+4MTaoiy9lT9MwKaFwQ4Z6KKSrISeztmhosn48aE/XaT9
csW4O5V95sfvCcbpTEJSWUvrvtskw4KdlvHYtGngLvTJzKo8H2SuErinaElYT3v9
/0HqPbC+wlz++xufxJOAEQzx7VDxcXiFP5WYvHgvuXZICLGg6ElFpiRfEOG+z7gQ
QJcq93ow2FMb2Qb/fdQjdtl5xQuThe6OngqNKkfhQ4Hk7VzWJmAMcz7UVe1JTTmd
Yt7UOwYpgGfEOxPeaoBU0XHverQfUP/LV8tX7HnOEm6wWjLYHU0o7taoptapiwuV
28aghGRl5poP8z5bwHSEjZ0qxbPO/A0kJL3ISTjcd6Op9xk1vV3qffb6HOIDa8Ra
UyE2qC2NBixgNQTx/JiYnkHZVOVHFQR+4OX3Mple5ClY9nzjMNBosX7TlhHhpB3d
7sdXACSfeliu0yXMMp8WdZflq5Bi9tTB7W7sx5Ba34v8OBUw4h6I4YBXqDu+j7fz
Jire6wDJL2yZfUyQ7zA78H0oKA5Cbf4q1xL1Q0Occ7aHpbHF/ip/+DX8VbjRY395
Rj1GaNYgmtLvV9it81/8RuNiMD196hOiLSS9vXrK6XpNEv8nbrN/h80W4MSGhZSW
EiwaHpxGcuDepb9VYAJNzMaVLtLtkogLwjs9VsqtN3h4agT93/n0xeyIu30oH400
N0fv0gY6toudHF7r7P6PnJ96/PAxCHUQTbxKDQwXf32p832Nda3YjY9+wntrKvTZ
n7EjWp7+05KUz/AG4nBZB+n4DVxO976mRQ9OhCLtIUQ6MSMaFErAQAtIKNcWdhR5
Qu2HASFpi53Mf4VPb3kjh62ch8K5ikP87MYv2AItZ02DgGYIOa2caq+Ul+htayjK
D2vZkb2UFZCARZ08vDqtVcNhm/B0Nve7MQJhtqjS4pjD1K69CgY/WWSrtkOG7Dz8
CT8dK5JI1TMZgfm2og4Zll68sqWtjxxOPrbqMjfCoGHUJCcwYVemUwUXOLfx3d2C
ycc7v38WcoRbspNaeyWf2lv9DvNQDWmpSRY7tPIHdL53efc8KG8mmdPlvKkSBQB7
ikyCD1PNSs5L29+g9bLgyYjiw5y7wtjpqlgIiIGp1kJkToLcRBSm1yn5btHwOYub
6qdbrgr0M5zKkQNu6KvUowYEPCj1f9O1OhA64c4N0PLpKRoawsQsa2P6GSMTlCjL
dkb1qUfWdTjHMIb4/GYR5d/0pzFWihKkit4x12MHrFdCEV6ZBynX2OqVVDaVyu5V
C161tbxxiCPc0OrlcHhC0wqhBjLl+7yyEw6vbde00Lbj9PZr1mLS4VTY4xdv+snb
0zfUgxSLJhltqRwCtkCArAo0amM5iOCWpy7tYe9h/fAmL9m53Uq9g013NJOHza0A
drsr4cQtCSa1pIbJgK18DF4C/Qw8bbPLGatGubGcPt5MMSzn0RqQKL6/J7YEPf9s
HcwjfJo+CAbVCt7z8OYspaCIdPs7ivj98JIz0zhkRIiJyC+6ZXrsFMDDZ2VNtVZr
NPzGTgzBY75m9nYlxOdBnrNwPevJVfwGpE0BjP3mQlxRLezMpPvZ3H+rP1kMSbSP
d9jT60rwOQ+KEaDbNVIbTHY72oNYLdWQZGmMZ8gMtb2y2BUqjGxUs68eP27ogHen
OJDvIBOkj3XyKzOBsGnpJflxW3uhp0kJa7Wd2iAWRLIKUujpVcDcY/1cK0stRPVD
QLqdvVJz1bKvHKoJtw2hxLWdQrZ373ZluV92DzCHBNIscV/6E8Mjx3eazW+y0qUb
mY2DNPs6+6xV3RVdGbCxTod2Xb39uWDLZXzzM2go5DVzwMurHVaYhCsYi2zO2gyI
dh19xb88DdAGI49Ql8JqYmUZQXyyPnvx3Sxuo2sfEdbg3oXSLDW4mSKydo6jbj7E
kGP2hup3l5msujHL8TXD2cT+WQtfIZAnIi7jQ90o2+3iq7jk7QW79iRRAuxmfauV
MEyRQ8hLUBMcBYTfNNo3G4ne7w/ICVfrKEBIoek8GnC88WZoT7MfMCPIO+g7qKYa
p+L7k1ApvT2+wvLAg3VFi2qeZ7zz3F+cFjsUmUGP55gpsSLlKH9X8gUjguGEeqmp
Z0RdABcUI/E9cKtGC10Fik8uj7OB5MVR0SkgoKFfxlh/DA6ETw6x2wnJFUoKVNhd
5vSn0GUcen11dAxxBTRvJWNdx5tWqkxdB/N1jb28aeIu1WlfAvn/byKsnJLevUSc
aSxlHMpz1c2Z+x84RsS7G++pssBx8/HeXOr1FnhwbAAE7bh1GXeNsw33dSCksFjg
+PIoxz0p+s9JOLNyQc1WRkd12nvLyT4TYzRQROEKYZoQx5KJYZHJGGGMWBlNx+HK
RmC1CECrjjiR/iXh5JCdNkbvwz5ug7AL3LCPDKsG4oaP7z5r2VHniRNwBX54Tbnn
CKmxO9fFH/WC14D27lmaKV3S3gOnyHCSvgIO4yG6lSCOztNpOeEynJantwH+VyNp
ps1EFgmonfT68xIambDBAaWa6FLAt9Hg7E9le61KHJMFIv0R6n5YzmNAzWo/ak7I
t80jOayPQmOLjjjIP/ltDz5gxdnMRVzkQ0ZSMnkJh2PoAinfj/cruOOGp9/rHsFl
xDWB5pxNMV3k11l5E4yt3fge8tSuH/I+XtvXatFwkJItoPbWaU+ko2zTclqpdZ3d
iU2XboRAtWysE/cwD787J0r2ZFe1q2fXMa9SDVridz5Nh/nLFauHbwfPbNCEejWZ
NZF0Xn0k0tXpyvxn0iqDKw04m/CpfKG91l3a2FJnt6q+0V45C3gXMj21rA+gwJhs
Tjmg27eq3p9K8Swopro5y57miGh4Nire6qlXcK1NfBLy0hT4Hy60S/Uv7MIsdNWb
aPbsGsPk3aVU3cL1YdM+TGnFb/ovGDPQKQciS/qpTa5JjWWA0C6Pc2tamOcXQ/6H
g3dGMlvaGyBggyp5skHJpYv/viW9HGzQSxqjErNwERYzCZvv5ZmXVzEQlewaVX1v
aEn/2mX1DM7t3Tf6KMJgP8iIdt2Lc4Gp/6sQw+9oRNCnBDmjpKACKPRf7RQRI+m5
iyfLqL9ARTfAhtC6hoidqN3pGIJuqm0a5qCF4mDo933Kg1wevVd8i6/AUYqUVCOy
u5zSw2ATW867AfhrI01ohJdon9DBbKmdBgtDhjOiIiuBnfbgkZ9YH58pTYB+wujK
X3kGvFQwn8yHGal2+UMZXXUeMzmMJryKM4xiWAO9Tpfuxmpdf7Kj8eDzXp31EQXe
ER6QnK/Iuo8PEmmT0Ak4jzZ5NSojOFOTEEyfKdPSCnvsoC5yWmDPpTQOghazgREX
o/4jaZyqb5shZI+BnMYJDys7M8j1Gse891yvBrqzoWDQCPKQG3nLw315o1YIkeiA
QaNfnygNWzBjuod5pQc04qEIzAgJ1knlAPFNP3AckgTZcLgS2v/h69GkmD1j90un
amipDJVXaYmFmYnf60aetuDMfy0w3wEwTTVJpHmDwMHYGQCjfI99eyHVwBb0qXjk
1+y+d7hTphfbmeH60RV3ke92b/B64T6lPf1qQm5xQUbA9w37EuytsezzvAhfvDrB
Ntp8vKCOTNZEdcle2hu+SouPGbJEdsOumVWlS9aA2snqtzG4PNq8SVsw7YFA/Qmy
bAw7d2szRgtU/z9OWz2yHpF5YhBdM2mJ0kKcMM2fBNzIbdi+uXHoF7YYMPstRHHY
j/XkDQaIqsaoPb9DzR2soBx8v6n/8Khg4kuMwvIo1DPAsyocToDRhTypGdnMfWGF
rFo7JFN/ye2vsNH8tak4yg/2adOaW60EG+cgt0KeY8sJVtaDxTkA2pVC0KPQwQv1
8nkEyAkcD1dd/Of+N3nAvuVjWY1sEIa2uOyN0gKdDqHmJMDLvYJ8+xFwDo3iEN/f
4qCH7/z1/n4t+LmdsdYB6PX5hNk0o+8uXKoH6z4ds3MBJigqt5vwP51BmK9lGJFa
JFmHXcbgejMAljfYy3XhA0PAr09kFaXpdg8m/lSOw8vhAWPxHGBXVRxpwEiymPB8
jL+i9+ZoyNtoI2QGd8Ye8LLLAaUZMCv+Mhgv1qZ+3JB+i7+OYh2YEzGuo/BtalZy
pneZPyBJx0HLMbzpNk1gXiNkOiGDN+TEiVlBOcYtDt1D/2c5518GclIndFoAmlrb
XLNhWYKUb9+JyfMc/a/AmeeAdmT+tA1U4IaY6wvnFPYmLM0ir7Kj2refJcH5r5Ad
7YCOeer08smTRCt7C6w4G0IHUpuerSlWlkMJk82PCEsjvbnvUoHG6nxkdQZOi9Bf
aTBPMND92yd2ftw1AB4+192XfawDS6zLB8phC+b3qqdCINVelNWeVh4VrV+iMKO0
DPT9evmk4NRRsBDdn4wzDDy5ho1ZQ6ycbfCjNqILFxis/Bf2QqI6WfUS+uRT4dyW
sQZsaOTpierzhw9vPnjwTMhBM7gepJWNpTyRaDltbHdXuGpzCpBVGPs3IYFIv1dk
Jlwab3xrvtBunpBkkuPbidyGEZV84tktO/xaqWMfT4mUqC+ylsp+T7fO80F44PLM
ftgbl9J8LyF+CC+xnyOliLOGSEViWafrdm0vfkOd/Z/VYtk3Bw2aJ/4W0754nWBT
xuxEoLVOMuFUOiYUZXatN+7R1nwJ1i4E7DOBMGISeO/U2TWBkRPboD7gJPqBqj+b
l9ERmhGemvCAxp5PTJvlGiO2QP0PIrAEGYNnPJyuaUGv1O9bc+N6g7NASJUD6EXr
NYLEfpMWa9KNs3qDJWXiIWPOQtsaCmrv3L4o7/woIGaP0MwTN+jDtwuJB70V18Ye
u1Ig+A5p1UEPnEyK4iVT31miTI97Pjq7qbC9cYI4qY0gCdws5dQbYHE3BrVaUSTv
P2NIRz/84O8KTa+2cE/vMiy57DzavUxGSLDCvMCphymz4DpSxyyD0RM62KvUD7Is
vse318Xf5AT6BAhTaFq1nn+pdsN4wuLZgklSn5dVqXcqdZn5c/+qUAS0flFbXt2K
oX+ppFk5ucVhiejYHkLtfYBI97Hwaf8aWsLgInoehHVlKR5DmQB6z84PR4c/JStC
01fqRE1EOV/UUUTrrnpyh153qzlivLTsvkMOL18uueONIStckU7iV562BZMThLS0
ljkGrfNaDcJr7b1QY7pBbRVHp664G8RSnDI2irKmQ+6BzttwqGqFUzYB9mxJCEe4
R6V5WLKVrCpIsr310JicCHrqH+cmjjioU0opMF9xS+BxHvB6Y73q41nk9i/ngv4L
vRo0R5mU9CFX+aFa9gjSADhLaaKx9+r/VUmvGoVmBs+6ydH6RB/HR8XtM3769d+1
s9baTCoTAlmNsuB8kwpQVBpL8Trg3CK+wHbN1RsC70Qh9qkJqfOTSiX1cQtlhLJS
lkRuOc5vuY4qI+dTN+wfa7nUoD4VER1Eje0qzCvg0c88214Vq/D5Kth6w8eY0x2L
VRYhANnMWxUJoIC6ROIp54609xYDnvD5Izm/x583w6TMT5qrZcQOGolaOHtUINhY
6dciXABSKNFmEOHHdAMqFyS0UKpERoX/Q8J5bsbgQ3qN2yShqCaSPf4e4GrckpFb
HYm4dQub1uoXTcxdLG5rd1Su/7RiQcsV4DJu/6jKytXJ+QQ2xgFnw74PgaLFkK+R
zuXHNYkndkDSMTrnSm2kky4dl5FbKN8UHGR2081FLmTpIf0imF3hAEv5IN6lPv7s
bO1S1vO7PS68bMeCGIHzQPLwVfZG2xDpxvH6n3IYtco5s8z2hLdoRaOf4B505n2d
IMyxaeHWgAUxgYVdr82XRDDCd1NXv/at3eQsoRn5pA+8HncpURZBrMIhPL7zMEeP
or+I5hKlvv226flbl7PcZwOqSu0etGn/v0LxHcK46lO8zRHeYBqhZV7+0MH6yb79
w1+SzEIa89RE2V+m7chcLtG9GE1f9SDIbY1XKCuAqrHhRqh/XcPePIkY1E5LVWzj
zLIlZ6XZq7/fmdx0d7UCVoDeQOzA5Ph1Aiqr24gG4wsqcaCQ0/Ar21PI+YdQ+dca
gqQ0e8H5ePBdZS6um0TIiMqimhehgUzBvQhJ1g58d7T9LJ/9gr9NloffiMXY1E4T
GGgKGpwEqtpTQ29bANMmcE58TjktnqrtJGF+L1tVx/8NoZzyhptbRD5bh/wTZG5P
aztYiFgd3PkZkTsuReh602M7XQj2aNLozvC24RpTvhX9AplPX235R1Y4SYa/erh0
aS+LqcdIAj5cVHhTaR/HkejmQZ1VA6H8eGIEZDk7YzPlMT5M0253wm5boJNeiYMt
FNYDH3lhCm3/x0Kl5oTs0GSsg0yZhWR/GEfm8FmlDSWlCbUXZcIxqov8/7FUQpyt
a5LSIWVh8emHlXTcPCqN2C1hIXw6XJo0oIgGGLG0nKlWR01zzeZi1qarti9IO3Cz
vhTeSpWDIw3/jIKwbgzWeQIYzIuJIpZS7VBP1QZp2NgetI53/Y99qeBE7JkSJGVo
Yq9ndfy0sQnWSQMqkKrm7Ywjxl21YbklkZbttFlXH+4rA5b6fLxgIxbqOE3PIkIU
B9TjXe/sNCd0dqIiBrNtVqR+ubY5bG3Rt1mNLn6POwr295dr+Y46LFwvmEs8V2bX
7wWpiq4+oRX0g5nRqEeunpp+rImA0DRkmsDJe+sCw+ZcOrMfjPDwSiK/ldaR8yzx
QzJy9oCgAUmfUPa+cRFdvcGXxLTONDgbNFpZboFd2+v3vH1Ihx5pBIOYDYau3ZvN
6NFuZ4LbsIvQUCkngzcRVhVwG3YOqqE7K1+uh6Rx+1fMIcmNKSG9rx38s+7VTXvf
fbRIIGkTu7OCIAhar4/ZHisavAqLjec+R18/mR3MU1Amye1MKy50Ldds+UchiXip
vfTqOY9d4uXz4OAW8MKUnR6pixeL3SmvpHlv7TtFso1FZdA+20lGclV6655TB2aD
bmgRZ9rGnnR81gvosUS3laaFeUfly4OOzSQ7w5ASxgsBvL7Ca6KVwU8ErNfKlg7r
teo1xfI4ZSndZurXFwqDeTLKEHZu0RIM39wSjZEr+9YxhUDv0aHJRR71lCF7R51h
ZhUam5pPmy6MFt+Cg2WhBsr1hCDFxr44dXZg1ZcU0KGt2pFMyuhypkRn7VMdXMqa
CBodEa73v0PiRO3BHvrOK1iF4cFKxQ2osADAuFKT48792iQogRvmlAAYwIy7qqCl
KVbLK9sQPCknW78oTdtsCqDe2ussWjgXPcs+R7VJgdKTOY6U7eGj8M73HsiurcQr
Zg67z2nkWo2kHQaonbSTZnc7Zi0OrRsCrZpHZO+4pDX4g0m/+g0wzPCcZY8zenS2
Xci1E0eUWHL69MJ/iz67DHCRZxvYq9f8KlQpkj8Muz62uxQZHDztDTL5voBN4SUl
hoCcqUdcrjNDBixctdpYxP1eEtX7Ji/OOyKIwaaUr8knMvVQKR5shx9f3S5xO8sB
NrEmmUDTLWsAx1cMIvlCtbKdnmk1+kWQTcuJB/VJ2CfE8qaabjGMvKtay0fQTk8o
3NttH66IGuxWygh/UEw6/cukBvv/qClOTxRlMmpADBl4QJhNrwY5p7LDxKuk13zi
kHW8ttIon5VaNb9ABMLkjSAML7KgMLjvBuK+rxcEU779jvKZHYhkq5knFgwpfaXK
q7l5JhYKiYv/fc7RAzZU+wn4hWGgO8BweJZOEqJvUIrlfEoAbWvjve2fm/284NXT
PjU8OnHAdUzZltVsiKe/Pl6K3xP6eoyyoiXljl/vzlfT489koPa7rDsbyrQBEn6X
utDLoTzAx7xvClRHt1R/So8y71A08SGnbHz4X3KqJovNAAmqnoqXQwWSiuwBMUG4
BFgNsR2sluIoGM5Jdjy3XqvAK3kIYN4grYXAspv5qr4bOXZWw7yp8jblNeoZ6ot8
05XNlV4997s/E/2aBsBFW6t2DJl55V4Er4rvjsIZtWsdFvy3w9IGQ2Dwvn9m80NZ
jbwJRmXsMmbWrH9QOqa/jffgFYmo6c/pOEQFRaHUmLjEPcon0dw60RHKZtR3ZZCy
rLZugoZu5ca0rtMOiFzvgasTJPsXeczzQjsn4HphXP8e6pJYiJ/tgBmRCR62uiz9
giDPwjjWlAZWNA778eyqXEqEPiRxSE0k78Z188bIjJX1Fc4mmnFVJMcKM8EzbD4v
c7OL+xZhDYZSR1YRtp9GKe2zH6Kc5tVNLQ/CFcOfDkNj42qlEGf2eUlnnir8lS5e
Ewu9FJN4hYrXJNwGZBA606wEE1mxahtB6u/mIkBEERE/wGAKU8eKOLIsNEXnWsiz
23SFVMv/lQyoHwPQ5OGcpXpKE5BcgOL+u8GS9qVD5iYcZseO7YBkK/7k3D3dC8qi
LW3qHRqnUMhSglR/gX4pUVNsh6Zp1HKGoVjt90BMC8+U6eejld7PGM+woa9z2HIt
2iF+4rJMTSJlf9qc9yj4eQwniM9EpcKdFi9v08EG7CiUibFtTV6mYJOCrNG6vdvS
uTjsnS4PP/dYjQLlxNgmUHC7r8ghC1CR9Ni+J5GV0O6Yjq2cUxN5Bm0lLQPeAbdP
b1TL0nNoPa9I6lxN22GfxoIeXIiOBlSCK2kyuzxUqhb7E+FoIIPzatP/zk4qBw1q
G9PHO83TsL1o1vTsmo/aRBTwqbqqswdSk6/r/99fUbTuhhvk3fL2rkxenl8FC0rL
SutgUJaNBqCPEUmtWr1mjXr/MGva+cChTO8RziAvHNa2kfG+5oQS40cuAa+1Amjh
9Sfd52YZ+TrtygLl1do8NSQBdM7i1qk7IZNEfqobJQgL3wW+S3Sds7t1L1sSQQFr
jGvRlBB3Bho6C9+lkIdjLspORdA+wp151KXHDYyQtZ/Z537xs3K3FL8ZIcYmRHdp
Y/pgAE0pB1GU/1BB7fsyLEqX3yqxZumGjho+VXku3MN+4IOSl2phCXf1i0aa87df
XNNqFhjJfYZgoxzaZUBup67WTUwYb0Oe1nF9tw3PIakNrP7fH6xpNWvqVvsHof3I
4MrIotZJaBlS64vMFVesl3AChXFoUNE0NE8P5tbICUd+c4QTsiCCachQ+SQtWbFL
h2hCLNORluH+Vf252ri3oF53TLwnP5ylIGXVsDKovW5Y2qZP/Z9R7J6ntw84VjM3
WDj1KwI2s/1aB5HE20oSgi12NNGsaEQ8YbLMto/ot3aqYGVoL7768VmFmpKE9qLW
Sih57+a47lDI+Fi1IhtY5OLIOuL08XNClPPO06wgdIBo3GjBw5XTYS1sZt7Zm71f
3bQ5d51p1sn4m2TUjajMNKNbirM+54wzn3JMWayIpx8hcNnATy9kEz5fZtR6iZaR
CRznF30mGVkxmTUGuy81rxAC6M6cWZAdM/pWI9HP+N+mOLQ2/gMBH7U9bJa01/hB
neRFJMcGauT5c09Hp2DNyJCOCi4mcz4YCKso5kiDjRahk36BFMHkB1eD3gKBTMU5
gPeso/T4WMrHrasmO6DwkScVF7Dnnxb6LDfKOVAc/zvoAXIGQ0rtg7rv0Gt4WTXj
a6ryM2Frz72LBZp2K9uQOyPKL5xyUrsW7VM5jR656GFx625xFGktKIUrYyDq02Il
DXBI6lbUX2GZ3T9pO2QAc7IG/Swwt+j4j1TnLuHqXooFuqAMItjfMj7uZVObGqNr
WK+ySO1U/Ixnn/ESV6kEcwIEa3naDuzC7DsbmAI9YjMVR+xptaip8+BFMjqyYoEO
UMCb0x5DcRtdIUUM6Q4TcVkSgjKTmwEkZ63eP7olwtG2RTW2tj5pS5fZas0lrVAN
uer7RdZUvnFNjRrBtqB2FiwVQ8qbsvbLhR8slwOaVGWK5Jr+pEi66XtxhmndIWIo
qi3mt0LkwGEQbnGK9/+68Mh8dLUrTVKbQ7KDBCv+VKV+W/zULh08ducMu5wpdiqD
KT1ZWYBkZMLMzben/8+0S//AVXXRMawTqNZCW3un/S+GXH7OuTEqaPbt9709D9NC
6kkflAe7ru8S9QzUIbBJ9aZnwMOISSrSTI1pjlj7X0MR6F1opU/WE+ReKPjvtJfX
LgjibYHrxCQdwPVFXjNy/5BAVEmEkkc5h8Zeo8xpfse7P6kPH0tpuJphZvVV8t4t
1RDVmn4OJaAB1co7csPJCnsKteV1EEzcyMrwXf3aFR6NlAgr2HfZxJmvSkQNhyyj
NgFhwFm5AksS+okQjEkvqetLxCg0RjhEmYN4ZzwkLVjaq7nwchkFeGywuVkt5IPg
Ge5kDxWyhdZDnj6JeWd3U5kCkB/henNRnKvMcCiOfHWaFw1kJANacJcGU4ktkxq+
dVaTXt8/952LWVO5U0A5hG110lybJwwzjmiFohZnNmurALcuAF7CYMhHKxIxDFUM
/0t+10kQv9j1/uHRsa4knebFCgZs/Qgz8fB/DDoAF5I/0Yy3s7M8ENqAEg33AV7c
FcpjQOkDxQmNRW2P/tLSvMULsWI0PMcRCdxgvF50gG6lCXkqXSlV+YaB13BV7ti0
WIS86CQ6lm4C+HJTr3OdtpEFNepFgWN0Qq1IpxHA3tnxUuwahPxE130Ejg1y04UZ
gzwXHwWbBEiSMEu27oHxcPy5qlmDT8WRf9LBBDaFHdypV9CIneC3CHdPomNSY0oW
mEs8xri7DqF7226gvi8n/7hTK7jLca56hRQdMIvaMTZXCQRBWSHeCJoqQmjje/ms
oAnsQV5tlF2NUt1NeyHdOPZIZcD7KciHrvFavjhhyRiMxsRpGx+/6Mms10ehL/aR
tKO7oxpVCrxTXAjDYZySlVukuv/ArWnCAb/dxB0Jg+JglWNEBeG/ZZy73IOmVSfz
jWeY9vs2BZmGVUd6n3TduOCKQx6eVFIQLNCOA06dNxPVQOca+rVUz68Ywzih5Jq7
29xg6X/x4WWJjwpbc1swOVBBxEHJFqxx6EuPjjoaCz5Sz1zCEOIcJ2ebSuEIzPYu
NkDqmyOMLuhNJa13LWs80o1qZ0g4V1C5cgMHcK6PIKPQ1hdMFR4UC5k1Tkt6EkRy
wA6gmpquj5U2Kw7iA0bYjPgC5z/ecb+xks7tHFCImmEAswHeK8QlhpeWVqIEqJaD
/UjnRr1wdBOnbBWUSXrtIbatqrul0tGTLvRCctlroNnPsoN8NIGGtvnpEtqB/QhE
tIN+pocWxFWC6X/tC2UKzk52ay1byb+Cfi+Hpu/ShGnZS6iOlnKYYtZH5mCVNkQR
2HtrDt2e3IgTUz+KwSPnpALeveDGIkdvxhLOcm+2aBiDrS+a19VCsCUpI8XlggX9
3VaZz2m16HYYZNy1wDuot+IaPltBYCop2qqToM0WEUkqO4D08AjCMWpoOREyf52G
NvEpPmhIa0RVqZxsXiZjsHdH5ioqAo2wyvMZyDpSKsp5/OD/RG9sLK7fygshcGSg
8doXPVjDBkV7pxOFPbQ034qRnukVqrvJB4rOt9vABvnK8ogN97VY99ovrXmLmjGd
7biPv1/bgyaZoqm4CGunmFreWfMtVQDOwS4SNbVT5m0qk3S3Y5OiZqi2Xy5WqQDn
yHLvRwrgQEpIXx2HN27vYgIINh3+vVSlrByk5sBQSZwKI+Ox0TK51XVdnV0A2jDu
yF172kaHH602hm2GiQuwDy+7Ii4r+TCT9Ch6mNnw2CE1tIhsxXKrlqHgCSYlGsL4
EKACKhKNVqnNxnaT1fRNN08SzCQFdUzJvinMlrW0Em1uixqpwNCehiYGT0gAEOMd
8qnDp9g6PXwqt8mmwpZHcNYjQNPXjK7yqfMQ1QMQuByx3wrD790wgbX2D+omGEYq
Yw1QSGH9ALSFdJACGd6+9DBN2h/oquWUKwhbvxh1m1t0GPS58xSx8tnKZn3eRWxm
rtvabEREy7K8H2ACZVh1Yq6lFcsFWQOrP3H23UFpY1Zt1Y78DfBuobQxcidmnyfs
vrtw+qlFWcLt41I6Rak/mzqWkhyDA36PWCDzd0duhlYTQtVGoBC6KGywbYGuP9ZG
N58Dps0PCyBXvUsW2mKOMzML/tqpmiWlWAUZbnmk9ZTBlXLXCPuZc75t0mhrI82V
tJ8b9t+7qR4DNBhdwOgtUuiyepk//oj9312JqDJnRkyYFWyylQiD1tHpQN0AlAla
J9dnXYzORTfReWA7ndqvIZhI4hvB/eokiG15x456678b8qpspe2MuMR8qS8cBY7d
7mAl0X2aoZfveVOSyjEUQH4/Iu67JezYg/v93qfawc5JNEVsKd+/5cAdFB+jZLix
22DwmwHZqpde4O9qNf+6asX6wBiqKaC1PUMrKHkkh8tV9rM0iw0Aig5j8Fgbhmr7
n193xhRU3DpO0Qay9SKcySH1F+Lh4MaNiqFRfyaWXh2dud9RXWEd88B0TC0MrcHD
5IlpdoZxk0iyUgSO04DVEwsNcL33aHbDxdOhRvFZjWhI5f4zzbo8Mkyco4ENyb36
AiTi3xh/wj+K55eDjsGT3g==
//pragma protect end_data_block
//pragma protect digest_block
lhJ3/pdDl9PV4eS/9jPrL3MVLzI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ISSI_XSPI_DDR_AC_CONFIGURATION_SV
