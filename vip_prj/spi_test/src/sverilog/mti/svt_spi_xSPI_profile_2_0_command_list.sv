`ifndef GUARD_SVT_SPI_xSPI_PROFILE_2_0_COMMAND_LIST_SV
`define GUARD_SVT_SPI_xSPI_PROFILE_2_0_COMMAND_LIST_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specify the valid commands for selected Part number based upon xSPI <br/>
 * profile 2.0 specification. Each Flash Command is stored in a separate class. <br/>
 * It contains required configurations per command basis.
 */
class svt_spi_xSPI_profile_2_0_command_list extends svt_configuration;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************
`ifdef SVT_SVDOC_CC
  /** Workaround for SVDOC CC circular references */
  int cfg;
`else
  /** This is a handler to the SPI memory config object */
  svt_spi_mem_configuration cfg;
`endif

  /** This field specifies the Flash Command Name.  */ 
  svt_spi_types::flash_command_enum flash_command = svt_spi_types::NULL_OPCODE;

  /** This field specifies the Flash command category */
  svt_spi_types::flash_command_type_enum flash_command_type;

  /** This field specifies the Flash Command opcode  */ 
  bit [`SVT_SPI_MAX_INST_FRAME_WIDTH-1:0] instruction_byte = `SVT_SPI_MAX_INST_FRAME_WIDTH'h0;

  /** This field specifies the Address frame in Additional command modifier */
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] address_frame = `SVT_SPI_MAX_ADDR_FRAME_WIDTH'h0;

  /** This field specifies the data_frame for xSPI profile 2.0 command function.  */
  bit[`SVT_SPI_DATA_WIDTH-1:0] data_frame;

  /** 
   * Used to select the mode of transfer for serial communications. This field does not affect the transfer’s duplex. 
   * There are only two valid combinations: <br/> 
   * 01 - Write <br/> 
   * 10 - Read  <br/> 
   * In Write Mode, Master transmits in all the Phases. Supported phases are Instruction phase, Address phase and Data phase. <br/>
   * In Read Mode, Master transmits till Wait Phase and Slave tranmits the Data Phase. 
   */ 
  bit [1:0] transfer_mode = 2'b01;

  /** 
   * This field specifies the Flash protocol mode supported for #flash_command. <br/>
   * OCTAL_IO_DTR : Instruction, Address and Data on eight lanes in DTR Mode.
   * Currently xSPI profile 2.0 supports only OCTAL_IO_DTR
   */ 
  svt_spi_types::flash_protocol_mode_enum flash_protocol_mode [];

  /** This field specifies the number of bits in the instruction phase for each supported #flash_protocol_mode. */ 
  int instruction_frame_size [];

  /** This field specifies the minimum number of bits in the address phase for each supported #flash_protocol_mode. */ 
  int min_address_frame_size [];

  /** This field specifies the maximum number of bits in the address phase for each supported #flash_protocol_mode. */ 
  int max_address_frame_size [];

  /** This field specifies the minimum number of bits in the data phase for each supported #flash_protocol_mode. */ 
  int min_data_frame_size [];

  /** This field specifies the maximum number of bits in the data phase for each supported #flash_protocol_mode. */ 
  int max_data_frame_size [];

  /** 
   * This field specifies default Wait cycles in between Address Phase and Data Phase for each supported #flash_protocol_mode. <br/>
   * Specified as number of SPI clock cycles. For some commands, wait_cycle_count default value is determined based on command type, <br/>
   * protocol mode as per datasheet of selected device. User configurable value is obtained from cfg register.  <br/>
   * Wait phase starts from the next posedge after address phase.  
   */ 
  int wait_cycle_count [];

  /** 
   * This field specifies the number of lanes over which Instruction phase bits are to be transmitted for each supported #flash_protocol_mode. <br/>
   * This can take values 1,2,4,8.... <br/>
   * It should be integral multiple of #instruction_frame_size <br/>
   */ 
  int instruction_lane_count [];

  /**   
   * This field specifies the number of lanes over which Address phase bits are to be transmitted for each supported #flash_protocol_mode. <br/>
   * This can take values 1,2,4,8.... <br/>
   * It should be integral multiple of #address_frame_size <br/>
   */  
  int address_lane_count [];

  /** This field specifies the number of lanes over which bits are valid during Wait/dummy cycle phase for each supported #flash_protocol_mode. */ 
  int wait_cycle_lane_count [];

  /**   
   * This field specifies the number of lanes over which Data phase bits are to be transmitted for each supported #flash_protocol_mode.. <br/>
   * This can take values 1,2,4,8.... <br/>
   */ 
  int data_lane_count [];

  /** 
   * This field specifies whether the command's address frame is configurable or fixed.
   * When it is set to 0, the address frame is fixed and available in #address_frame. <br/>
   * When it is set to 1, the address frame is configurable in svt_spi_transaction class. <br/>
   */ 
  bit is_valid_configurable_address_frame = 1'b0;

  /** 
   * This field specifies whether the command's data frame is configurable or fixed. 
   * when it is set to 0, the data frame is fixed and available in #data_frame. <br/>
   * When it is set to 1, the data frame is configurable in svt_spi_transaction class. <br/>
   */ 
  bit is_valid_configurable_data_frame = 1'b0;

  /** 
   * This field specifies whether configurable Wait cycles is applicable for each supported #flash_protocol_mode. <br/>
   * This is to be initialized to 1 if supported. The dummy cycle values are available in <br/>
   * svt_spi_mem_mode_register_configuration::xSPI_prfl_2_0_wait_cycle_code_list and svt_spi_mem_mode_register_configuration::xSPI_prfl_2_0_wait_cycle_count_list .
   */ 
  bit is_valid_configurable_wait_cycle_count[];

  //----------------------------------------------------------------------------
  // Type Definitions
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  //-------------------------------------------------------------------------------------------------------------------------------
  /** This method calculates and sets the transaction object fields based on selected flash_command and protcol mode.   */
  extern virtual function void set_command_parameters();

  //-------------------------------------------------------------------------------------------------------------------------------
  /** This method return the bit size of instruction code  */ 
  extern virtual function int get_xSPI_profile_2_0_instruction_frame_size(svt_spi_types::flash_command_enum flash_command,svt_spi_types::flash_protocol_mode_enum flash_protocol_mode = svt_spi_types::OCTAL_IO_DTR);

  //-------------------------------------------------------------------------------------------------------------------------------
  /** This method return the minimum address frame size  */ 
  extern virtual function int get_xSPI_profile_2_0_min_address_frame_size(svt_spi_types::flash_command_enum flash_command,svt_spi_types::flash_protocol_mode_enum flash_protocol_mode = svt_spi_types::OCTAL_IO_DTR);

  //-------------------------------------------------------------------------------------------------------------------------------
  /** This method return the maximum address frame size  */ 
  extern virtual function int get_xSPI_profile_2_0_max_address_frame_size(svt_spi_types::flash_command_enum flash_command,svt_spi_types::flash_protocol_mode_enum flash_protocol_mode = svt_spi_types::OCTAL_IO_DTR);

  //-------------------------------------------------------------------------------------------------------------------------------
  /** This method return the minimum data frame size  */ 
  extern virtual function int get_xSPI_profile_2_0_min_data_frame_size(svt_spi_types::flash_command_enum flash_command,svt_spi_types::flash_protocol_mode_enum flash_protocol_mode = svt_spi_types::OCTAL_IO_DTR);

  //----------------------------------------------------------------------------
  /**
   * This method return the valid upper limit of Data byte count for mentioned flash command. 
   * The upper limit is controlled by macro SVT_SPI_MAX_DATA_TRANSFER/SVT_SPI_MAX_PROGRAM_BYTES_TRANSFER etc.
   */ 
  extern virtual function int get_xSPI_profile_2_0_max_data_frame_size(svt_spi_types::flash_command_enum flash_command,svt_spi_types::flash_protocol_mode_enum flash_protocol_mode = svt_spi_types::OCTAL_IO_DTR);

  //------------------------------------------------------------------------------------------------------------------------------------
  /** This method returns the valid instruction lane count for the mentioned flash command opcode & flash protocol mode.   */ 
  extern virtual function int get_xSPI_profile_2_0_instruction_lane_count(svt_spi_types::flash_protocol_mode_enum flash_protocol_mode);

  //------------------------------------------------------------------------------------------------------------------------------------
  /** This method returns the valid address lane count for the mentioned flash command opcode & flash protocol mode.  */ 
  extern virtual function int get_xSPI_profile_2_0_address_lane_count(svt_spi_types::flash_command_enum flash_command,svt_spi_types::flash_protocol_mode_enum flash_protocol_mode);

  //------------------------------------------------------------------------------------------------------------------------------------
  /** This method returns the valid wait phase lane count for the mentioned flash command opcode & flash protocol mode. */ 
  extern virtual function int get_xSPI_profile_2_0_wait_cycle_lane_count(svt_spi_types::flash_command_enum flash_command);

  //------------------------------------------------------------------------------------------------------------------------------------
  /** This method returns the valid data lane count for the mentioned flash command opcode & flash protocol mode. */ 
  extern virtual function int get_xSPI_profile_2_0_data_lane_count(svt_spi_types::flash_command_enum flash_command,svt_spi_types::flash_protocol_mode_enum flash_protocol_mode);

  //------------------------------------------------------------------------------------------------------------------------------------
  /** This method returns the valid Flash Command Type for the mentioned flash command opcode. */ 
  extern virtual function svt_spi_types::flash_command_type_enum get_xSPI_profile_2_0_flash_command_type(svt_spi_types::flash_command_enum flash_command);

  //------------------------------------------------------------------------------------------------------------------------------------
  /** This method returns the valid Transfer Mode for the mentioned flash command opcode. */ 
  extern virtual function bit[1:0] get_xSPI_profile_2_0_transfer_mode(svt_spi_types::flash_command_enum flash_command);

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
  `svt_vmm_data_new(svt_spi_xSPI_profile_2_0_command_list)
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
  extern function new(string name = "svt_spi_xSPI_profile_2_0_command_list");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_profile_2_0_command_list)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_xSPI_profile_2_0_command_list)
 
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
   * Allocates a new object of type svt_spi_xSPI_profile_2_0_command_list.
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
  //extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_xSPI_profile_2_0_command_list)
  `vmm_class_factory(svt_spi_xSPI_profile_2_0_command_list)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LvQ2vC0rf0aR0/x91VodF1ZGzJh1wDNmfrl0qbuXwFy0T60F5ifs9X2C7x3ni0Vf
BgrcZWJLCyQUQKfoFag4RvMd4T7bMhaMtO76LWlqXOVsxsFL01PsXEAFWvOJc45A
8NywAU35p8a1ivP0vW+WSrK2CYgslhIqUIlTNc82HLc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 642       )
rxF6t44p1Go1l1ximBHYgzF+VuvdC0ORZ0mjtRx7LS8DdDKvFJMdmsPFb/JFwl24
NDLmNXUq6hkpj0mTr+ucLU/IihJqzO0bk/dugKL0Xhfren07cyWFBvfRpI+9WmSW
98L/nsBysExA/y8kdw1cajlKxnJPBjzQrGXcqKLNdWJxk0qEFGmKmNHV2FtKqdJU
qbwRndMl+igr2y1J84cZGAUh8vhS0PJH2Kgi3WfVe+deCnaYpQE40kNmidJi52P5
+6RYN5K1vWlpraNGesMU6njqBjp0HWsOpvXs2KavFmIIeegKpRfNQgEWCd5wKrob
tsLGdwc7lAmWHbhzO7efazFJ/96DS35ojjOJ2B2ogJ60pbWqHdCsRCqJw0m2U2Km
xLeT4eWq1pwBytM9tWkYEFUErwvpLf1M/puItWanXkBFsQOwjOtFdW7ligTBR25q
faI8lW60QQwYBTBpBkev+9GsEATh026gtti2xr/t9OtML2zKy/36bLfp99N9BK8/
MX+H5KpzN8hRWlW9nRSntbehChjxynLldnL1ZNQ+v30xI48CIb4S9NnSoLVeoy3C
A02TZ7d9fAcmaDtH40cXRURTtemtyh0s8PawG30EyVcUeQ83EM/rB0HGyz5BZ+ME
BxBTdFGzFZ/OIzNKejs4+jPi1vIJrN6/WdfNcNdHRl2mDn8/dTlT3KHX8fPC4YfL
/DablU2jpmQIEGZ7AZPw7B/Cckne/cnrTY7M3JDOXUmSEiZoBhcM5zu6/cTdLFvh
XVz+CO52Dg9PAZcx8KlrLqp2AU4xW3rYyXCRk+CNisz/Bb5dYHfuS11NF65Sn7tQ
OiSMhT+sEvqUkEh+1ebCknfZhoRnf+3jOjJPaowOh0c=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aSAtuGmmCLO1jTEdKZtS8m1vc6mi9AWDGIDPQp2nJCegwXP28w+8U0+MUHU+QXoF
Gvgxfo89er00z2M00HFtOPA4GkichbLMUkjKWcehrEq4lrD++0qiUFf0WRtkFjf8
OOc/dzKJtO7u4UvwQp+w9+ydg+9Z+2mJjyvMfpS/7Wk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 55414     )
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
8f/gZldh7DjAM5OJefPArg==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_PROFILE_2_0_COMMAND_LIST_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nPxcXvD/t2HO9RZntwpKn3PfGpwDDxbaabFxKf7LrdLUyx09Y1T1chpk6xeFg9iD
6V4J5RNgUhRmsLlQpf1PFhJeoGH3H0HAhOW6bDK+O3TfCmP/W6X3oU66MEdu0snF
vUHVMRC7U1HWRljvkI3DgRD2ghTj70N5eTFd0t+UVhU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 55497     )
lyyN6j8rRR3a7AGde9lrd2YpNsk/pK6ZVjozc+1uolg7Gzgm+QCLJtpumhPaya6e
9A0Sjo2J2llcZ812b4N6gCbSPJhGj98WcVxu10JgAehTNL/tZtygzRXjR1CF+Ilg
`pragma protect end_protected
