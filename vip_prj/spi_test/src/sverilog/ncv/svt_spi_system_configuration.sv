
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
+0iD6qgpYBoi0N2dySKUe89xpdERcH9jXyQdymSSooJrAV9khu0Wf4EfVqHzHsv2
uf2PvM/s0k+uWpa6yvrZi6Oe5q0Fzmf+Txvtjj2+ht6yevjuHr1/XgpaGXUgPalk
P7YKEppllaP8FE1tdUzz8HcDHmuPSvtGs7v0A9sDDLcR4XHUog4IEA==
//pragma protect end_key_block
//pragma protect digest_block
vFq8xo8I4m0gNFXLAAmp1M3TUc4=
//pragma protect end_digest_block
//pragma protect data_block
Br3CuuFIADTn45AiADIv9hfuCbA1WSe3EulJbw5fFtSdxZjF9j09LuSwh4DibsFz
GChNap6jhtzijSg0UtfTIKx9SO37Kw76oyUrbOWK04tzAAfzLHGluu4rJQ1vRIwe
8ulHIMcSf7qTPJaMoEnCXBMjDtYQUu4/0GrzmVsVCmSDlv9I2GsGvLLjxs5F9pPd
n1DLGVcdxwJUjM6aHFtSwAJ+riLEBjKwaZn6dRGJKa2sHMP2S8MqHQKMlwZI3YD2
jt3laT4+i1cLkWK4+k9zCYeP6n0BgWIv5GXBeBkLQkDsTnHp/+DH90UjrHPGnA0I
pb9WffCsnxF75pAr8vR9wKdZbjteUdQqidrsDeVVy4Gu4CzRQ+aBi/UEgwhNPE2r
KQ+SEvKoO8y2TI8mnPwV4039j8ubmNvhzT9hQENTu7tJSCW8wcFgA8NR94cwGds1
OySrPogOyU6JVuzB7qp+l7pRD/FAgHGBtbQcBKdoFtl5GvoYcBWHQxb4JNOXqWkF
D5oVHzt5B73Zbcm4tQQfEmPJWaTHCoEeWKxPJ2UjTks7z7QQFuGzm9gTDt9wjOaZ
xesw5K48lN7kNbqOJ/HGPeZhL7abTCpnhFHiVG6niLGswfJ/0AKwx2PHMsJh0z5o
WjAzSuIBgTR9joXOMlNRswAxRKEcA37C557x7b2C5Xmo//uw/7w3DKeDiFV/VQC5
uuyT3j8e+qbojO3juWwXEHhenMWhaK8qKEQEcLlz9x/kVc36FBT6O80xMT0kh93V
8qZqI+xZDKMIHBOgCbbyMpq5W9LszXILXZ6ef/TgiUHYsKlfd0zBWLKCsmWFJ63l
CnyY/w8N9w5lezQIfmbgYXf0xtDbUNQgCxTZKJdHSbWmDiI5SV0SK2GNLhrAyNhm
gUBZ6Xxahj+FaCJ0leYTb4I6W/rewInw2uQjmLMHvCiA6z3jw/DeXdy/q/Rg5OaL
nNqdK7sj0b/lGVAbG3ZcNgXZof7SjrTlawcsWqZhhK+DWbgplSQugpVWknRy3Hay
ancNJ8y/8NDXTDunGbE3dQfulzorOi5NvdnOGBoPwtAubsTY4yRsnQXbGRLNH9HC
RjHvXYvwN2QKka1oln+4dnqhrJwRnwIn7eSiqZg8eMqjbLSbbFe3RakMGX27Xvah
vRKkpDm/t3J3Ri5C20tXmRVqmGtmynVButfzoN8Q/l7Sgza3vxkO/Y+Wyw4lSMek
+oUaaisgkBqId2mbMZZEVeSEScM1ndoo2AVPDyQ5RMo=
//pragma protect end_data_block
//pragma protect digest_block
gsQPPrO7KfMnUItxU4ZzMS6fwZw=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect 
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
mbRSboCTnCWHBF6gyGGW3g6kLnBAPIrl1M4z3jALoxPoY15i71sc8HZpAOJzfoZl
oxjBe02aDeZngK77WCFg08ff5kZu8AFSiOz60/dS+P3mQcn3lSYolEBAp7wS42XR
3liQ1q7dtH++Mk4Fw0g2j8xuTpKEQh/VJfwBRw/llIlLYwk1V/esdg==
//pragma protect end_key_block
//pragma protect digest_block
OYv8wSI13pbwioZQw0XZte55mkg=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
86zxxyUgzbNo3TPTAr1f9jbjsKI=
//pragma protect end_digest_block
//pragma protect end_protected
function void svt_spi_system_configuration::pre_randomize ();
//vcs_vip_protect 
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RW8cSShBbfdm7rnAyimf70brLGlMYu/r4ToTKqN7/nTnpyw1zMDxfcWiV6UqqIb5
vN923FoPKi/+u7vtJpfBAxsFQF5wkUoPDI4nPaCYKPU9Fw4jpO+9qf2X57hAdaoY
Zvh3atdy9QhS0HdR4VOioP+7+Yn25XX3hEVpgi6OHbpaz7iousCVyQ==
//pragma protect end_key_block
//pragma protect digest_block
F/yucnxUBi87V5LuVIIVb33CVJk=
//pragma protect end_digest_block
//pragma protect data_block
Gu48jlJibVgXrSAhuQwPTERM/mu2nOwwuRfB2WxhSK9qSo8Ni90M/9aK/Jxt2jvt
G5eSfnCWtu+hnDpaoKjOg7qHls7P5/3uD2VELWL9FNOAYoALlczq1opqAF5MFzLI
gP46UYCUzgUbN8t31JY+ZlzvgBm8d9Q11lXlJQoYYg5IKUOqtLC8GsXh9vaAH7N5
nrhDVSGcboZ89p6YHymbUKZFL7+tMGaoMoQnQWpGs3uIuEBEx+FsH/UFPHbC2vRc
VPAsIneo/I0WIGaoEOQdpD91vnneIC8oLDHmywkEjurefJn8uNM/EGOl/ieBWrco
ZxK2nVYoBvnhcOkdVbp6At5FVojRdnohkfKiTz5Vw0OARc1QsmCZIMq/OzYMmT+4
OXojLWuNqSKUq7lZvWXEEqtRx5BmmRCU7QDFnjk/hDY=
//pragma protect end_data_block
//pragma protect digest_block
SQ0VGuwiDW+DJu7SlsvHsG7BT2Y=
//pragma protect end_digest_block
//pragma protect end_protected
endfunction: pre_randomize

// -----------------------------------------------------------------------------
function void svt_spi_system_configuration::post_randomize();
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
PbWiehLyus9k2/lt7TJWNkDX8nWt7w0e+3s95mVjQ29qLoxMAoU+uLQ2g1xr+hu/
GhpPwh9GBEPb41m/scqNILmauf5TtGE6eaMhpfJbVDy1cOzC6obuDqMnoXQrloX9
iUtgLXaSeWWdFlH69IkoGLklEsecJIwIGiEMlqdbG5DqiWXWjt9QFg==
//pragma protect end_key_block
//pragma protect digest_block
kne2qlnurYHbH5o7Wm7yIKLtwUc=
//pragma protect end_digest_block
//pragma protect data_block
Kk/UiCQq6HaKSltpwdjt+EzdBflaIrorU+Z6ZBbjOiiCxvXMs83sLoVTV6dFEmHj
+WJyAa5ObROJuPSZCBvuKP/cEDRlKu+DPxhKDhfqPwljBudezQEN4prwZhCdvXUj
0MfL7DdUxe1w1FD40+Y27t+8tlH4uyGs8+00KdxtY1m3GuBtNXBFcnEwPWWtAb0g
bAdwcI8P/cXCNuLBbkOthCaOR6V6r1NmahoIW2uQYY/epxjdrCFjh7kXNTdPKWae
v0gZfkts166p+EkcaWNT33Y0uh7d97MqRYSMkU1oWr8zQD3IDNa8UcmNY7TU9Q6e
Pkao7/JoTmSgvxZ2ItzDbjaTRJfu/00JNB1QK+RdkNddfSm7dzGCOsWscOCId9r2
0WvtPXAWvS2/ZUEFbn18L2pi22C4KN5o+2ny8j/CRvMbEtH58rAmGwCZE0LEXUg/
0O7ZWxN03B9wOc89tMe4K+FOixWwSv00x18okNBLsIMBbMWV8RfYB0GJ9upCmltg
KI8jcddB+d3bMTilTipqrzg13gCeB2EXIWG++sQqFE6Gctx0tc10FUGYjnBWx/ZK
caxt9EN1i7Kfc0TUeT05Fjy9OEDZcNNASfVmd7rSzQwQqp0Czet/gRMa6/rEphn9
Lbk2Yhg6VzMcG1deDAucIw==
//pragma protect end_data_block
//pragma protect digest_block
NTeYWHudSy/YKX2ePaQhfuGu0ic=
//pragma protect end_digest_block
//pragma protect end_protected
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
