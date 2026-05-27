
`ifndef GUARD_SVT_SPI_SYSTEM_CONFIGURATION_SV
`define GUARD_SVT_SPI_SYSTEM_CONFIGURATION_SV

/**
 * System configuration class contains configuration information about the 
 * entire SPI system.
 * This class is used to configure number of masters and slaves in the
 * SPI system and provide configurations to every master/slave agent.
 */
class svt_spi_system_configuration extends svt_configuration;

  // ***************************************************************************
  // TYPE DEFINITIONS FOR THIS CLASS
  // ***************************************************************************

  /** Custom type definition for virtual SPI System interface */
`ifndef __SVDOC__
  typedef virtual svt_spi_sys_if svt_spi_sys_vif; 
`endif // __SVDOC__


  /**
   * @grouphdr spi_master_slave_config Master and slave configuration
   * This group contains attributes which are used to configure masters and 
   * slaves within the system
   */

  // ****************************************************************************
  // Public Data
  // ****************************************************************************
`ifndef __SVDOC__
  /** Modport providing the system view of the bus */
  svt_spi_sys_vif sys_vif;
`endif

  //----------------------------------------------------------------------------
  /** Randomizable variables */
  // ---------------------------------------------------------------------------

  /** 
   * @groupname spi_master_slave_config
   * Number of DUT masters in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_MASTERS
   * - Configuration type: Static 
   * .
   */
  rand int num_dut_masters;

  /** 
   * @groupname spi_master_slave_config
   * Number of DUT slaves in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_SLAVES
   * - Configuration type: Static
   * .
   */
  rand int num_dut_slaves;

  /** 
   * @groupname spi_master_slave_config
   * Number of masters vip in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_MASTERS
   * - Configuration type: Static 
   * .
   */
  rand int num_vip_masters;

  /** 
   * @groupname spi_master_slave_config
   * Number of slaves vip in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_SLAVES
   * - Configuration type: Static
   * .
   */
  rand int num_vip_slaves;

  /**
   * In SPI_STD Mode, by default Dynamic data array in Transaction object holds the Data <br/>
   * bits for Tx/Rx. But few applications require storing large memory blocks <br/>
   * for operation. For such cases optimized Memory Core is used internally and this mode is enabled <br/>
   * through this configuration bit.  <br/>
   * When enabled, data array in Transaction object is not utilized for holding Data bits and instead Data is <br/>
   * stored in mem_core for Tx/Rx.  <br/>
   * Memory core Peek/Poke routines can be utilized for initilaizing and reading Data bits <br/>
   * Memory core buffer space size is determined by spi_mem_cfg.data_mem_addr_width field and is divided equally between Tx and Rx. <br/>
   * Tx Buffer space lies in lower half (from address '0' to Total space/2 -1).  <br/>
   * Rx Buffer space lies in upper half (from address 'Total space/2' till end of buffer space).  <br/>
   * This is currently supported only for Motorola SPI, #spi_feature set as SPI.
   * Default : 0 
   */
  rand bit enable_mem_core;

  /** 
   * @groupname spi_master_slave_config
   * Array holding the configuration of all the masters in the system.
   * Size of the array is equal to svt_spi_system_configuration::num_vip_masters.
   * @size_control svt_spi_system_configuration::num_vip_masters
   */
  rand svt_spi_agent_configuration master_cfg[];

  /** 
   * @groupname spi_master_slave_config
   * Array holding the configuration of all the slaves in the system.
   * Size of the array is equal to svt_spi_system_configuration::num_vip_slaves.
   * @size_control svt_spi_system_configuration::num_vip_slaves
   */
  rand svt_spi_agent_configuration slave_cfg[];

  // ***************************************************************************
  // Constraints
  // ***************************************************************************

  constraint system_configuration_valid_ranges {
    num_dut_masters inside {[0:`SVT_SPI_MAX_NUM_MASTERS]};
    num_dut_slaves  inside {[0:`SVT_SPI_MAX_NUM_SLAVES]};
    num_vip_masters inside {[0:`SVT_SPI_MAX_NUM_MASTERS]};
    num_vip_slaves  inside {[0:`SVT_SPI_MAX_NUM_SLAVES]};
    num_dut_masters + num_vip_masters <= `SVT_SPI_MAX_NUM_MASTERS;
    num_dut_slaves + num_vip_slaves   <= `SVT_SPI_MAX_NUM_SLAVES ;

    master_cfg.size() == num_vip_masters;
    slave_cfg.size()  == num_vip_slaves ;
  }

  constraint solve_order {
`ifndef SVT_MULTI_SIM_SOLVE_BEFORE_ARRAY
    solve num_vip_masters before master_cfg.size();
    solve num_vip_slaves before slave_cfg.size();
`endif
  }

  constraint reasonable_frame_format {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].frame_format == master_cfg[i].frame_format;
      }
    }
  }

  constraint reasonable_spi_feature {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].spi_feature == master_cfg[i].spi_feature;
      }
    }
  }

  constraint reasonable_baud_parameters {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].sppr == master_cfg[i].sppr;
        slave_cfg[j].spr == master_cfg[i].spr;
      }
    }
  }

  constraint reasonable_endianness {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].bit_endianness == master_cfg[i].bit_endianness;
        slave_cfg[j].byte_endianness == master_cfg[i].byte_endianness;
      }
    }
  }
  constraint reasonable_operation_mode {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].operation_mode == master_cfg[i].operation_mode;
      }
    }
  }

  constraint reasonable_payload_word_size {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].payload_word_size == master_cfg[i].payload_word_size;
      }
    }
  }
  constraint reasonable_spi_safe_frame_mode {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].spi_safe_frame_mode == master_cfg[i].spi_safe_frame_mode;
      }
    }
  }

  constraint reasonable_default_slave {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].default_slave == master_cfg[i].default_slave;
        slave_cfg[j].default_slave inside {[0:(`SVT_SPI_MAX_NUM_SLAVES -1)]};
      }
    }
  }

  constraint reasonable_default_master {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].default_master == master_cfg[i].default_master;
        slave_cfg[j].default_master inside {[0:(`SVT_SPI_MAX_NUM_MASTERS -1)]};
      }
    }
  }


  // ***************************************************************************
  //   SVT shorthand macros 
  // ***************************************************************************
  `svt_data_member_begin(svt_spi_system_configuration)
    `svt_field_array_object(master_cfg, `SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOPACK|`SVT_DEEP,`SVT_HOW_DEEP|`SVT_NOCOMPARE)
    `svt_field_array_object(slave_cfg, `SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOPACK|`SVT_DEEP,`SVT_HOW_DEEP|`SVT_NOCOMPARE)
  `svt_data_member_end(svt_spi_system_configuration)

  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   */
  extern function new (string name = "svt_spi_system_configuration");
     
  /**
   * pre_randomize does the following:
   * 1) Allocate master and slave configuration object arrays
   */
  extern function void pre_randomize ();

  /**
   * Override post_randomize 
   */
  extern function void post_randomize();

  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode (bit on_off);
   
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name ();
   
  /** Extend the VMM copy routine to copy the virtual interface */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
   
`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(`SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  /**                         
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size (int kind = -1);
  
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
  extern virtual function int unsigned do_byte_pack (ref bit [7:0]      bytes[]    , 
                                                     input int unsigned offset = 0 , 
                                                     input int          kind = -1) ;
  
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
  extern virtual function int unsigned do_byte_unpack (const ref bit [7:0] bytes[]    , 
                                                       input int unsigned  offset = 0 , 
                                                       input int           len = -1   , 
                                                       input int           kind = -1) ;
  
`endif //  `ifndef SVT_VMM_TECHNOLOGY

  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data ( `SVT_DATA_BASE_TYPE to);
  
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data ( `SVT_DATA_BASE_TYPE to );
    
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   * In that case, the <b>prop_val</b> argument is meaningless. The component will then
   * store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
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
  extern virtual function bit get_prop_val (string             prop_name , 
                                            ref bit [1023:0]   prop_val  , 
                                            input int          array_ix  , 
                                            ref `SVT_DATA_TYPE data_obj) ;

  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * consruction is taken care of automatically by the command interface. If the <b>prop_name</b>
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
  extern virtual function bit set_prop_val (string      prop_name  , 
                                            bit [1023:0] prop_val  , 
                                            int          array_ix) ;
   
   
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern ();
  
  /**
   * Method to turn static config param randomization on/off as a block.
   */
  extern virtual function int static_rand_mode(bit on_off);
  
  /** Does a basic validation of this transaction object */
  extern virtual function bit do_is_valid (bit silent = 1, int kind = RELEVANT);
  
  /**
   * Assigns a system interface to this configuration.
   *
   * @param sys_vif Interface for the SPI system
   */
  extern function void set_if(svt_spi_sys_vif sys_vif);

  /**
   * Allocates the master and slave configurations before a user sets the
   * parameters.  This function is to be called if (and before) the user sets
   * the configuration parameters by setting each parameter individually and
   * not by randomizing the system configuration. 
   */
  extern function void create_sub_cfgs(int num_vip_masters = 1, int num_vip_slaves = 1);

  /**
   * Allocates Mem configuration object for each VIP agent. 
   */ 
  extern function void create_sub_mem_cfgs();

  /**
   * Set the Master ID at given Master Configuration object array index
   */ 
  extern function void set_master_id(int index = 0, int id = 0);

  /**
   * Set the Slave ID at given Slave Configuration object array index
   */ 
  extern function void set_slave_id(int index = 0, int id = 0);

  /** Return the number of masters in system */   
  extern function int get_num_dut_masters();
  extern function int get_num_vip_masters();

  /** Return the number of slaves in system */   
  extern function int get_num_dut_slaves();
  extern function int get_num_vip_slaves();

  // ========================================================================================
  // The following method must not be called by users even if they are public
  // ========================================================================================
  /** @cond PRIVATE */
  extern virtual function void set_num_dut_masters (int num_dut_masters, int kind = -1);
  extern virtual function void set_num_dut_slaves (int num_dut_slaves, int kind = -1);
  extern virtual function void set_num_vip_masters (int num_vip_masters, int kind = -1);
  extern virtual function void set_num_vip_slaves (int num_vip_slaves, int kind = -1);
  /** @endcond */
  extern virtual function void set_default_master (int default_master_id = 0);
  extern virtual function void set_default_slave (int default_slave_id = 0);

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_system_configuration)
  `vmm_class_factory(svt_spi_system_configuration)
`endif   
endclass : svt_spi_system_configuration

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
a05tMcqs6zDHf45AZCZywPFI3yDjhwnJMf7oqRAMpcHsGyIGCjwgqoZLudl0OpzX
OkncTjCKuTTzuwZvQ7nqaHzJ9CE+YKG2PxjYGY19G4TO7il7lohvrw8dvzrKqYE5
GPGvGAVrSNKZ9r9AirTwyBUc365+c0IlEtjIPK0CZQM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 771       )
5+nwuAhCx84lA4NJOFkAoLKv4WdUatPi/SUU2sxIH+chxEmoO8nGioKYQVyG+Jy1
1uWSPE6PnRxGvcWJUf0kXKfVCBf6LMi4vMDsim81RJkSSllI/l2BTpioLiwURXZG
N1GnNO8zmFztjYk5PQ78p/W543U/uc6+pOGkXcYgWDDAPb2A+cZOaLhS/6NSXlKP
0sAM1V5g3RpEoo87P0a7N3LaqA0yInZzYnxnyyZwi+lKlWN3zlcGyPCtKM88KxC+
5u4WrZggkSSQNoRXC2W7r5B0M0zZguX40iOj+JlxsO9ZmcjwOjgc2By4tVpxYoUe
2eUNI8k/qhJBUrNikmnb6gP5MOdYj6zW5/9t9Of62YaiJXhPGEIkP33YInBhfz8X
lvIlu26P14btNFhZpZnKZqqHZr0LMfj587lURN2vllcNKLfXfR+I6ShKvpaiDoFS
O0We9nry5QeOCzaD1zapKeOv/Y7ZIM3H75wCtFn5H9pH9iJJ0vssXBh5l0tfKxGb
3wmXsZVzsN/hqmuJRKpaXV8qOAiY/+UhEWN5P/LdFtw2wxLe1xBiwgypnRcjULXc
CieF6q81gBazuvh+D59mLLhUbBvmL/4z3MC+1xDit+7B+I4vjk3Zv8V7e0JmR1AK
C/GXO5z4LY30cbGXCWkiORN6eMKiQT6AWRXmFK1PP/jDlCLB0O4hk6WH00qBNa7q
lQXvg2Knw/jjdTLzGgNyeEWSgLydBLqQiZ0+xxxsERZwqOo/9HlZ5hLNS1jlvpHc
UTu5GBPKktc7mcFC5fHABeCIGGJ/Mpd76R9LeAmCOGSUaMm1lqttWZjmBWTPLBy8
0XPMWXLSXjw3gLBJHeatyd3RCOTSuKuPseYEy1Dspa6QqDWgcO/65qrpBuEdKS9v
Z6HjjSAo0Jb2jPh1c8pNBiINtiEz7+Md9wYMTYhFR23qZBcDoaiEIIj0fBzkLXbj
+qKXbwxBA8iB0MUjTKjl+Y6bssZVsjDaFYhKHhl4cpSLcqgIzor4IjwQmL+0qMGM
zO1rrNEfhjPdKV3tLRqg7w==
`pragma protect end_protected

//vcs_vip_protect 
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OgWkhPTWLsht3cH1ZIgqMoSnvN1MKds5WG1HXTHD3SRpWnAKGUWK/cWHawoJgBdR
ltDq8Uud9H6VVr4L+XvPVWFcxuAb5/TM/31na11UM6fSX8tNZBwoJy7lFKL8hR0F
Vf74ggg8kkdGnFq8q4xNLqErnqKxDospc+M8QgZgHYo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27085     )
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
3AnWymKOYIlgPVIdT5YtmQ==
`pragma protect end_protected  
function void svt_spi_system_configuration::pre_randomize ();
//vcs_vip_protect 
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
foQJaaBay6zXjZghaQamGygPMmGgCuizxRGi+CQvTkv/wjhiAxmlxr4ETjCL+kVu
qn6nZ+xpg3JEHH7dtav4776Xoay6S3p2KFCyRbK1eoLokNUyRu7NkleKfpG9m9H5
ya/0WcSBnpSMkxcwwV1KfdIQ7ogtNtrxAxfiS26hJrQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27238     )
+4CYympjfBd2eUVffGlMcqWCentDPDZhoMI6mQqO5KwNoZzVyMIa8DZl2FNYke6T
Wm8EIi63AmSnkmtqTtIrIsKxqUL+FPS/aDAsutz37Lt2HseTNW9+fn4wt6abaC1G
AfAjadBAUSKcRjfGGgcnSu1XgPEbCFg5lN1+rLptRiadAuyVJ+u9gDNNV66R9VTi
k0qHYFgEQT8qGhBA6iyOsw==
`pragma protect end_protected
endfunction: pre_randomize

// -----------------------------------------------------------------------------
function void svt_spi_system_configuration::post_randomize();
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
P7IGWfIeDNodNaGILyrj6oz7+7lgWrXK6lkEmCx+gIngrE9mgQgIZ+fmYjpxqZYa
QXCdqvffSjDE8S6npFxZ8fkgDtmeeHo6IAmHwxlr3uBYHkePLQBlb8WCrGKloBj+
sru8Im7Jy5VtWCWmcnzx1ZK/wpSvXIoO52GTKBz9K5c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27555     )
RvU9jukNInUfjvo8pzbtjL58GqEQvCN4dBQF5ReOfRSm2epW145E4QtGcctuwaBe
NDKlvhcdbyjfJcFWQCol90wjshhTl1/vQ6aJ4jZais8z/f625tcF9ClbUCzxhJUM
WH2gV9LE1XkR/5D+a+WAHvzbNRtZXX6J45uELxPu+CHXCLlCvAIPdFecwLBx1nDi
9zOeHOf85YfnAhDrc91Kp84X89QSkq4OphTWZcsfrgz4BIUZDLDVqoK5j3Uzb/a5
G/wqqY+3KDDJ8mKm6tfLFcSjSUZuwTmemh1c8JuDyxelPKa62AamKj2NofBLmsco
WaelXHkp1ahHosZuqhupa5Yp1DSCAo1w5dMrxg96Lp2bLsbVrjEmM4/v9kMTX0FN
q3LzR7j6PbYaArDA5yy76oquJutOVSXmEVMyGIYWpsg=
`pragma protect end_protected
endfunction

// -----------------------------------------------------------------------------
function void svt_spi_system_configuration::set_default_master (int default_master_id = 0);
    foreach (this.master_cfg[i]) begin
      this.master_cfg[i].default_master = default_master_id;
    end 
    foreach (this.slave_cfg[i]) begin
      this.slave_cfg[i].default_master = default_master_id;
    end 
endfunction

// -----------------------------------------------------------------------------
function void svt_spi_system_configuration::set_default_slave (int default_slave_id = 0);
    foreach (this.master_cfg[i]) begin
      this.master_cfg[i].default_slave = default_slave_id;
    end 
    foreach (this.slave_cfg[i]) begin
      this.slave_cfg[i].default_slave = default_slave_id;
    end 
endfunction

`endif //  `ifndef GUARD_SVT_SPI_SYSTEM_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cCrs9Op+8WdMMeUwV+ZxYsNr2SlKMfIeY6ugzWuzDYT9dC+mKqL1rDiXcQIiaw2v
B+nsVDsq9joEDn9qZd90yCqbut1pZQ0vQjilYsHoq+DECR9Uz8hgrBIcUJFGDgfd
KLEwjBkWfFfHEziOjkm0ZfI0H1NmAxqgu/LHHSdNmRs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27638     )
qQL2CKN5WX+bGD4eDVopsW4PURGzBBHbagPDSOK1lH7CaAPa0qxs0LEXB9OrfDnf
ZiLgIWQbpiyrkA+QVSYMvfaa82+Qmts2Y4uWxhqJLKoDDqa+66fURkbNChBfEa3+
`pragma protect end_protected
