//=======================================================================
// COPYRIGHT (C) 2015-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_BASE_MEM_SUITE_CONFIGURATION_SV
`define GUARD_SVT_BASE_MEM_SUITE_CONFIGURATION_SV

// =============================================================================
/**
 * This memory configuration class encapsulates the base configuration 
 * information required by memory VIPs. This class includes the common 
 * attributes required by top level configuration class of all memory VIPs 
 * (both DRAM & FLASH). </br>
 * 
 * For DRAM based memory VIPs class #svt_mem_suite_configuration is available 
 * which is extended from this class and can be used as base class by VIP suite
 * configuration class. </br>
 * 
 * For FLASH based memory VIPs this class can be used as base class by VIP suite 
 * configuration class. </br>
 * 
 * The current version of this class includes : </br>
 * - configurations required to add catalog support
 * - configurations required for xml generation 
 * .
 */
class svt_base_mem_suite_configuration extends svt_mem_configuration;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * This property reflects the memory class which is a property of the catalog
   * infrastructure.
   */
  string catalog_class = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * This property reflects the memory package which is a property of the catalog
   * infrastructure.
   */
  string catalog_package = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * This property reflects the memory vendor which is a property of the catalog
   * infrastructure.
   */
  string catalog_vendor = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * This property reflects the memory part number which is a property of the catalog
   * infrastructure.
   */
  string catalog_part_number = `SVT_DATA_UTIL_UNSPECIFIED;

  /**
   * Indicates whether XML generation is included for memory transactions. The resulting
   * file can be loaded in Protocol Analyzer to obtain a graphical presenation of the
   * transactions on the bus. Set the value to 1 to enable the transaction XML generation.
   * Set the value to 0 to disable the transaction XML generation.
   * 
   * @verification_attr
   */
  bit enable_xact_xml_gen = 0;

  /**
   * Indicates whether XML generation is included for state transitions. The resulting
   * file can be loaded in Protocol Analyzer to obtain a graphical presenation of the
   * component FSM activity. Set the value to 1 to enable the FSM XML generation.
   * Set the value to 0 to disable the FSM XML generation.
   * 
   * @verification_attr
   */
  bit enable_fsm_xml_gen = 0;

  /**
   * Indicates whether the configuration information is included in the generated XML.
   * The resulting file can be loaded in Protocol Analyzer to view the configuration
   * contents along with any other recorded information. Set the value to 1 to enable
   * the configuration XML generation. Set the value to 0 to disable the configuration
   * XML generation.
   * 
   * @verification_attr
   */
  bit enable_cfg_xml_gen = 0;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_base_mem_suite_configuration)
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(vmm_log log = null, string suite_name="");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(string name = "svt_base_mem_suite_configuration", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef __SVDOC__
  `svt_data_member_begin(svt_base_mem_suite_configuration)
  `svt_data_member_end(svt_base_mem_suite_configuration)
`endif

  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   */
  extern virtual function int static_rand_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. Both values result
   * in a COMPLETE compare.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`else // !`ifdef SVT_VMM_TECHNOLOGY
   // ---------------------------------------------------------------------------
   /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);

`endif //  `ifdef SVT_VMM_TECHNOLOGY

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. Only supports
   * COMPLETE pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

`endif //  `ifdef SVT_VMM_TECHNOLOGY
   
  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: This method allocates a pattern containing svt_pattern_data
   * instances for all of the primitive data fields in the object. The
   * svt_pattern_data::name is set to the corresponding field name, the
   * svt_pattern_data::value is set to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  /** Constructs the sub-configuration classes. */
  extern virtual function void create_sub_configurations();

  // ---------------------------------------------------------------------------
endclass:svt_base_mem_suite_configuration


//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aTNn3x/muC3q46Gb1hwoIeqhe1UBNa5ggR+bRoqVM0ebkbDCbAOVpgSAPvDYSYW/
A2CyNM+BciJ+fZfEgzY3rvbVqSVas5+ZbeLsrbJD0kesxbphSNt93TkDxcOSwIk3
VwbSURHwDHZnpSeHVE11h4Eeg6Ei5PvWpFQ8xFgLwV4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11606     )
cMFd5jT5/0PUujBrow6aQQqX36BhAa71/dlxQW2EeosXHk8mEGOiW5md1uK87ULU
UsIREYRRxlOnM68iEnHsSH+1Mw5a/IYE8r58qsgZAiByi62FSY+dn9Z9wwBmgneN
GrceVx6UqPPcDrKtVvbQsb2pJBxmJHBF3K4/bHuApwLeF//ybndeoD+IdTvIBiHB
PoiFdT74Fw5rwLRSPpORQwtZcCC+a0piiLgyVA82L1jMgedsnKt4O2jAx7AMAzTm
m+SbnS8nnbAVbUYZmx9J66tpsgQblxh/5asDx6RnzRAWhtn/9p0b1+LE8Vcllehh
LILbIaUK6E3BNitBv+UBe+2G3F2EtBnB9+X5GY5Jv0fERRPUmVLe4Kl2+D2nUqAo
i6dyeiBpDHRK4RvDmM6kh3aA5PDHqYMHpSQfoRIXV2DGuJsmOxvbYaiMxBvGtI6H
P4XNPqwn4vgeBQt3GvViScfLtx6MfkC2HX4UhjIbcEGOTud/RqKIRU1tUMq8NxAU
mpsHWIudvz5krZJBNKJ205z7l/gBiE8XRQDmezs9Wuv6oKO3e9JpfS4Ek9rtuPUS
4eLVbA0N0VuOmXwVhNXJWioZCIjvTvAaK+wU2eUP6CDb4F3MP69kR+bSUAiaadcR
F8CkAZExa3jTI3pvasCOXlaI4A1mYQryB2TugkkoyA/2g6bcaJj8IhhVH/TWlsls
sz8omXjkAZsVBYZDjLWZVk9U2EmyOIEXSAKZrh+Cqe10EgK1fSG/ePL6iOTNbuxu
NJFnBQb9P3pxpERaw04s+s8XIuaX8qx7p+jmxHio4rhrLEMwx6uXWJ8wKwX6mFqB
zSZj5t7aktPFwU5iqrLtgxgsMsZbS6YhOC9LAIV4Gbh2CEImEcL6STkZpMF19aZy
/UEJQ8OaSDCOTIHrzjbYmxAZbKX/UwOZokJdx2+TY2rwzn8m1k2SYmoyNGRCsogm
t7O13vQnY6kjJbHFI8kesY6jUUAJTkNLz6a/ww3SXwFkLNYF90TqOcbEn9pzrlP2
uWFC+0aIO8zVh9ULNc4SdvbIbP+W8l95B5/tJ8ixR185LJlE+e4Qvbf8b6JER+2K
w5A2S724ZKL/squBSDt3kKs5CvyuYkwppMUj/ocEpglPqg8EWS8vZAfUo4MEm+B3
jh2Y85cxzh+F5E/LBUXhT123H5Y3VjQtZZorKT8EXvWu0atnrmvcaJfDZwtaxdBr
dHqMyHwnC87OLuIJOpZvQjSDEbM8dWedz0V6KZ9++X7/7YoqndPsHHffWgO4UN0E
5Pb1bX/y5NlXlVHxfSXKCizwce4zr87IZUsioc7PnFHNnNjGQL6VJAedD2ekSkg/
6FkvSo8O+8RMOa7CY1PqZyeu70HChzw031O7LxL4V45OcN7c8VG81q/FMyZa/gHu
ET64FzDkkS5WCB2v0qxYp63jGxabcqLsIeODHvLlRE8Upi0ra2fGYHqgEFkIfaBZ
yJnBXu1eM+1fVWxd28AbIJMg4yJvZdkHDSoJ6ARgTKWkMYdab7qJ9OrMASlrtZUf
L68Q2WGCysr3z/UcUw3EKPMkdqvKmfr0K6nsem6KzNoNDgylvUmwrrttOZTy1h2p
4DuuZTcuWu4z5N730thOYrUsQB8E/ryEeQ/sVWhXAp/B+lf2Kmy6GiijM9hJ2ad/
hFlVbqMo67KcIG2JTan/JNduFuSH7+On1REpvgRsn0n7t6VXWwmOXH5hTsnSYDUN
n/IAiNrzVOpBy/7WHPXIxytJMThv2HpHrZytvYwswF2GgSdGD1Xwf1UeK2PEFo7O
vDB6k7h+2bp3+vtGQpnl5xh4DMaZ/ynTraF+o+GS+OR/btSKfsizWo0m7AW6qgD3
ZEMooDpbMeRwuW0hYuSCv7ZDOHFAy8H3gjkHyeTfN+ltP9kmUj/k/WCbkcGxzpn9
3sMJEoA/f/rivt9W0Zck98kRI13nLCpufUFoN4dgOkcMU0F+tjo6UPE/igYGRbVC
RDoFUqVkHG/3ovzqFd68fRq0PMNCs+IQqXLv0byICIIuuZ1BO14KHQVnCP2izNyo
ieI/KtgTuCPLftFuWrOHCJR+z72qTd2qOxFCnEYFCsPFdtFfoDAzwgQiWu98zAX3
tFRe4ZAMph+CQ2C68psjWPp1tgnMI8JFobmhH3tnT/K9UzBTD2m7o/8CVBOxrRQK
b23N0G9JEkUTkhf7MmuKG+UvOAVQCo9YyMWv0ZFuxkPSoktUifO+RHOkJtwPaCOo
DHDH19271PEDlJ4L73HhLBrcKCwZj3BOZ5arSG8NcGWBy79qGKth9XATNwUGmOE7
6ds3y0K1CubMGSgemmWhYFRgTm87Jc5d0vSzzVW+KeKyXSqJcxUwoh2Dbzt1ABas
HGm/TEFHfZt74Q1Q+FqRZDGHwwZRFXJtJ4fWKmvqQZB1/1G7m5UXLnyufZE01nab
yKmWuuYoBLTy+u6kjzG852lD0jHycpg3eOTGTafmhEXaDFm7QVCoaFuw8PlWQlvr
KkWCdwmdKuvTF1DZX+6qq1mvD5NqnNQsG3TkjvGdMpR4qGxh0hRtMDWB01+1JJkz
1TQAh+NCI8Pb0PstqkX5rc0ki0Z0LIp0dcAkunwghR5R7i1yVivyQm7CVGYgxqYg
cFxQ1zNC5GT4v/GIaAmbGb8n7+vsoJRpvXdZjE5xeZxjQTs+RQWQiNtzD31durF4
110nZxAEsJ8a0jNFLjxLDiOIPO7pL9KtvGydw7xZzd0p1b52WuMB41xeRVZT8Xvh
/JmS4vP068s9+16n/EXehJc+wS+YAi2l9ZvK6oSL3aO+SSPSnEaFGhtmrHyOX9Df
Omkhc08xfiPT9ZAL7ZN7va8FPP5LDu4Wl63IaPkz/J6jJYOBp1pv5g/P8FwPobnX
X7hlZCyKB1T+HDKC3CXIY595FyyLWtNz4tl/FoX/s+UeCUe/pA2VXzupcJJAdaiN
ZVyn+5k0nZ7r0wMEEpg9qHopLjR959NGstzZuULXxUBWn30RrxLMfbbhtFNzOCOc
qjznu4rfjOXHYzjUoU56tDDAeYRQTIREEgjf10GJkZKfl6/nsF+P3cjUT5ZQttEb
a0oepe5vFd2rr3Fzx7dDgrtOfQwRoG1SHn6jJ6jtmEkEpCIXf0wqY6zBiXkgyoTq
baxSHyUhugMty/UnNt4L6+2GTfWvXGV+bqjXghtuQsffrAa0jyQJsrryGgj/mnDb
GywPYh1IsEh8TDuyoFrBIkKcaYfCH/NFYJ+RT6Csef02vuwuqjJ5nNCQEKLeGiyi
mXqKAmcwzTAC+dqiZbXMC3tE8p0i29l9NNeDxR4//SUDiy5lN1PZ5dNx7CkTXpGR
QanN/1Itoe3XAeZZILSFAqH9eD3P57EaVYZVBOOus5qWzKa1Ezhz4e5W03iZNvVI
Z7Ixi+wwftDhXPtzDOKiKyQBZf7ouyinAXtb8VPgpd0TjWIvI0GKa6Bpj/w9rGRM
0C4tB7xoScsFQEf3/QXgov3ST+nWKv08YrEgB7MoZE8FovYgvuw//2aW0kV/aDyf
NFyJUc6P54SDbSWwzxqzn8uNrXdb+yCi30bnArEdR1QElgWGoX1sJHyU+DUNugaN
7J24wNXvm0ru2nxAB3kkHgYztGeYCuLp9pbewQCzjLYl+Jax4OAjYGJytOAn07FF
P6f4teSElce4fXvfo8evHXUu/cg689/EFrVmMa3aT+VQBPKqLeEYai9zuO6vh3UU
3BAOuD449KyDQLwgv9KrHblZMhQPZ1gdfJ5raT729qKA/hVjL0JHaK1qQvgIYwDO
XNU20koKfwgbZXamK5Ij21aeibEJ78XDzAPPuMLjUBmkU6lyz9QFLp7eHk0rdEGf
nRTf85/KMNs8jWDPLucDND9ohNtUKQyRcdvLPTwTYL60ANjcTQH/5CUwgosYQchO
t2y6nqLkUnfoFPDxk3anKJVxZZq0nky7wA5LUega2zS6ZmPlkz0uT46s87SmCMJm
aKHfvPYfaL6mlSc+6wH46w915JHsepLkDhnMBPVOH2PIPtBWp9pqfUklcb982dGZ
414/W7KTkAC0SNe30Wil74RqqvGAGl2t3t9oDlTNH/ymYbkWQdCk5LOx8lSmgHpA
Z+OjGIN816WU6C/Cn3tAcs3naosqO49ENuJtbJjI2dqpsJ8wpTWtD8O5qASLlHSC
AuO3rMCy3r8HpRwsr3qXVZGdRCXqTNhYniUoktej2fmxRsOgZQo2jAYT/ZYHRzKQ
G8BZSys3CpZW+1ohqbjS/vtctftt3/6VMSvy+qmZ9jSniG/IJ5BxKZ0glqbcFVWj
Vjn5eOacdOEMQ1pAH1m/xEJwL93hwbJLldd1fbgS1R8sIROpOxEnBrkiBRu5nPPD
/Km3CitSa13emInDNLEUnxAWupYvxZEqFkMEsgPB4jn5Cn1gJDFGnq3bvvqhuSug
OAKaT6pH0v11EcqYDJj4s9BskmyO3wAT5bsXoBgMXmsTziWuXsUGqar+3jFaH/bp
XCSVGOxLugHqX8UU667nK+58AiMUXjveHXPE4MVxfvyhhDugBZPcMNxZ/rq5zNOP
Eh6monJnzoBEc5x7wMfS/y0SDiWur7WECwp69/5fbkSYcWtGZKzq6ScCz/3xm1gV
3BX48+dbT2DiG1vA2b/BDcv0Cq+taaxXlYWsocQ1rNd2+ggLl714Esfg+GiryfLB
RUeoy8Ui08sTIucXAOFMYnbvL0DOJxe551VpUVISm9K0+HadW89fXmGWJzkXWP1D
fBr7MVRzvuXfz0HY1/PP7yim+wzOoiXdyxQ0LUYQwXYVcnQDRDbnCOfh1z8aTgyA
ApWnvm1L8neqNTGZSLi/0NnqTO1kXjMIygjMNodkcyU6YDIdf0eM6jOK9jmOgJT2
rHssAhQn70nN9tYZhal0tTpt/QxUKXo+AlakSWVNvXLJ5prexz9xFe3VN4GP7xMZ
XCuZDp8yWVkKsHIx4cUREeglWoWW5+3QfEm7HaZnjpgPjT6NfR2lKk3/fpuVxzKt
885JyjBSBU7hMphJzYmGAsDLCiKVypQOqqZUew4m7wScu7tNP+rs9NxqDIQ9dzNT
pqjJOS+qYNag4FpB1JhVZ71185lzSjhWCVPKNtmbcKyp+rIyYEtNA495YSIy39wa
8lv0Ur2kk3Q/KNAh6hVMP6CZOD7iG6jq/sMSDHm+JXAeRckfMvVpTkqMUp/0cVNk
BTGkTWjKpfom0HLDk1Bjvw7KSRI4o1EJwkfQuqAve3BkxGxKOlVCyhuJq4Y4YABt
jKlF9SVZvdq6OcfMAJYzqnXe7XPUUA1hsFOaN6c0XJ8jzeMQjEstWgpozhYmwbPU
g9AUVBt+wVhzk4OwLHVjuqL4cJX7Ge+TMV6e3rGpMkVBV806Lx8Wgp/rMW/f/MDh
PNxx54+c/wxfMqXBAKjR2LNFzu+FzlP0337u+lqGJiwspB11sVS3UIGD//zFOkKz
HuETnfAGza6MDglmkDp8L0dQS7Kr+Y2nbBuEFfxTEag0pWN6R/xzJ/Ghbo/Q0kWF
XYV+3QZxDgx6rZeeTJGDQw7prLdCoDygItMZQjWyVPdCjR9IpoRSCEAGZhUIO55d
5okbNmLeHZki1f8x7P/eDL9iLFlKlUYDF3ufeDCxLhqYNQ1rgpfkNY1fZHvdWxCd
UOak53XeqT62NWZ+Q05rhh0IxUOqg/aXdnayarA95QlFoXi0TjI/E4MLAMUvbM8x
skAVMJG8rGZFWY67nP8c7pnirNAQnsGLU08z0CBm9rSgR6tabGywef//oCxv2Zva
HMCDcEGts3IERo5ztbChFBzO8y+ed6ZuxYnj24iP6kw46wt9ZCS+luqOp68cpCjI
Fe4cDpFZ6tUZk5wOPMJZbVKPNVNEr/vxcE3xv50pkqs9XddQXw2uVY2I+vMhC28U
y5YXGIFSU8RlHvhYXcd3ABW68xbntTpmZBCQHqIve5fnfKA5bTGTxjTMZeOt99Us
IGdeOKsVGjLz7ZFRcNRMQm4C/I0ltaVtbmhhn7fgGbbSh5U5g0J2O4pC4Y78vd6A
7WM84+MgYOuLdOeqT+5lOU219HYlC9WoqUcpk6pfBErvKecFpBazNQU7Fyui+912
Y1wTaY30aRUfTD/TLZBK2rasuZa7E89jpaSibyLMoTHx78VSbAnmJ4Uhr4+yKup2
AXz+JHR1GaZCJ6LhJoLacU4On/9Zd/shTRjefoWMX8+LkVVfdeNDXPZEhzdAu/Mx
VZcL+ZSMz1ZU2/56ysoG2pQTfoCHwT0JzFou6XYvbhRMAwWaydTjsMpl6JByJbtl
N1XssEyFVcxi2S3h3ccbNTS8I5UWh64NXw5xwCW0xyKfgo7Moc+oc3OYkWQkC+/S
/JanOzGj42lNGOg3gL3UZ3ulF4+l2Dal3VnhK57ufYAZogSIXER6ogGMfp2dhYHA
Id704lPAYgO+vD5fRvMClLwl4LerAux8BfQf1coSF3w2LiCC1tfFIJQpWXq5vBtH
h0FN1Q9HWMBDzdOxZ0FwZaUDuyDtdW+WX4Vw+zx7BnYbqU4/SN0YLCJ9hUTEuSf2
FELAMvvCg4eSURqD0w8U5CUoMiAXENZZQfkhbtLDI1iAilRTGwMM41P+o8HBqAVu
aPlPxU8ATNvObcaqM+0YqbYeoDr10OoYpWOwCDn+Kngj1z2MIF8zoRFZ8cR55h4D
s9wewM9fRXoTy1RwPcDogiCtgzVGLw5PCoqZbDHhnadI4EA61aI+jswFfz6/J3nx
jm0SllwJKlM8bK9xt+ZHBkxwo7OLz+7iFGVnpk1uYPYjOSw+PSUrl0LY3eaEXNiS
xJ1WvXWP6H0/KmvwqMZDYxqaih11ssO0idGiqJWvDYfjSMcs12wbsqpRKGVdHf8a
OKt96tEcKIOuoZClqWnKTqphRH/DWL/IhWqVAxNScFoarXNB4s/k7jEWhGsvG/9b
Jlm46TaikwYqW1wm5+OJKHSJNmqAvN5Q7HSrDwnugtmc8ISyDMUGS68YbmGYh5r7
HH2WthJgNqY8VXIdw6TC5Zib92s/9SGJko3wi6ysES8Tkj9Ous/DNilYMMkhM3Iy
q3eSY+XaCOR3m8Q7+1Ho+EjQZh6/6EgUKElfO/sYXov4TvvP4h6eD+7hdHPapgPc
rXt6ahmDNXksop9qIG7jlzwNy6yItmIaO1wuzgpjRA/IJdBo6n5vAISCL7Q+vkp+
mUBB9BRfh8vZHDgFMgjVfXHa+s1THRbHC8r81lJAmItp+P6jjLdetgb7AGL47RQ1
MZJS+oWbUJDffvwGqAV4OAE37OSdL9hWo1UsqC5j4EhLDczs9OLp84AkW16DjeHZ
zUKs5+5/e1f68iy34F1lY0l7X1sY+ecJqSUQUoJSCu1c2eL+QEaj25Gf3EZP66qO
LTP3oT23ndPcHrrgz9H6x2vo15vZbzw0ETzvGdbG3bJsEUVDjPHCUikXKX0EjhBd
BGf/X0pL6y3Ua659RE8b5aVr/+1vBIe7isV9aTuaRKdGq/X+Ezq7VVzzs2z91LjL
m9p+fozT1dt3QHe6yig/fbgu9zYasiJnmPgkQNDrstJTX+IeUEPG7sNMbDAvY1pv
MF56uQK/S6tlGaVL76AmKhKuRpfCultUUK1MUq+SFz2rox4s9dao+LTPj3RCZLLg
BsIodGu4tKPqFftyx8SRYuijXdIvPG+ioi3vxS0jlDHRdiGjmMuhxrVGZvCVtevG
ahtM7sXxMei4QGfpaFMBJgrIUA5/8DN5/PxmCkvW9KV6ucPoLsLqcd+j7/G+fXax
cIBfcwbUkCSEJFPHqSg5GA2AsETQoQeHrEG7GVheUa8Y5QYnTmCDpnukt0g1bQQW
/yTMuS6JUY25O+erCSgdHd9v3Votc6gmBNAC0Dpv1dl5YTHvDKUYn5TuWql+uSJA
Fyh+PSAN50vbiSgJMcnS8z+3DY2fLrvusRXvNJKQECpkVoKi8eNx0SRjymOfbc7D
+BL46DZVuWbfeUHkHysg60Wqol8KIS2swEXDQg/Dfnjw99TIwtMN4eXnz5A2Dc1q
5lONyvj2EO1ixxDvlbyFq7Ymeh8TYPSay6tBjOgOv78AdSUxrCDjUt7i/bMpWhMU
bk/llUdoL/9rVfXxKSIyriOVFkTFofJfVqAKo4WdVMVd+5PnRJf9mhKLkVEiPLhf
HfbOJjN3gFPHOZQpLFi9uRZ9fI+OolZSqlK+iWsoI5QAMtnNPx4Z+V8/ZfO2jBvp
bKv5aPUqW14HO8ao0fuLuUpYPeVH9f5o3eYfWXJNOFxgM1hU6LT10o0l6irYhGzK
4lMm6hhCMSzt53bRkiMFPD78glIG5y41PokRWtUWmYh/ll0WCrYH3I1FQztfUXKZ
bx1UEegqBEW/v3w71KHIQ/eBBx1+lmX9RLY1sRfXX14nIOxqptnVIaQAZd96zXqy
LaGaEMOBFy+DomLM+w9QKVbqNK3hWQvH7R+7FW+wBfN+r/vCy96/2pIKTxNus3Ul
jtsc0kZJxdIO9BoIXmk6tAAoAEA3YvB/NbGN5W9DPyFQjyUQItx827CssPRhChdW
LjUYNOeOlvOJiqh/dcvBRpuutsZg2t0YNtQezZUCGHp82aq4HOay9mxNNVuR7IkP
o8UrAhDND8EbpLoLnsRKHV6wH6ljiuXuW3TP/kPJHUJyfZ4Wzxsvtjfrtgsiti0y
q8IzN9Zl3PtlufnzADoawh58CtxrP04/VUenq9jnpouVnH4aQKg6RmYrT1wv4wiD
ePQvhJ/5KBnyXvKl2JvPl/Gz5Y6KXBHGGsZhDObdDOKp8iBPvoTLorw1JZpQqoY6
+qAHEMkMh/JafEJPlLICTGS+lFy6mMUEwSY35s0g+4ZjmFTIgM/tm4EYH9xz8BEF
Wfb4ECrFut5LsZjKciJ/eAXuL6oCp08Q8dcXnHsWTOx8Ks+fdTnmCrN4OLfvP2NK
xupHzH/kv81zde1ewFu+S4gu8FBgCmvkk/bJXsWC1ZfSU3PwOHHw9BOXxg/m+bTc
MCXxDBqpQsFfAe0+VGOodWdJvzNSTwyIsrqElEfpS6IVM8C2kxmh+adI+Ge6EngL
Cyy7jxVP0+Uzx4QYQeESsgkHTQbI5/FVITVVlYuiZk9vh3VJT8WrwerafRyZY7Rd
9dgzT8PzHlWIIvB51jBi2MKJENMKFjjSgad3X/3dxfdQWGEgoH3z0Y93DMnqRlpw
rHuOQkCKU9tFDYxY60W72e5mfSDusGbfgr78GtfxqMF9jL3VscvuwVEHd9WWWNWy
sJ6IfUNwqg+Hbuf9TXrL0VAgWTkemLlA/L8Ss8M+6vkobwUnyeb5X1MO2gmbUYGY
k+kjkLlLlD32aNyscwz+G6MvM88uu1LRflmJCAXfnI7ZUiPlh/jDwn9RgEdyADx9
NFEobo9h2sePRhEjMfIPRkLyr6fg5MEKlGCTzxFoGqIDPPOfxU7AYBeiNMKLSbes
9ADaVip/EqfeZSdWFeRxd3+dG6pGo4HbKZMFLmE20QSQBOsyBajs13RaG6vW0MBT
SdQaLQW6NQOw3PBsC+aS1/YXvkNkmh7vFqwTlMAvnuMztGaa5z3g2Ux9R5HQKtYP
PhOc8kKp+zamhBtUVz/15v590aPTUVICqeTle01nT7OtlTwOeJ9NTEsejK42bPSk
bA+T+ebCL93fNm1s3HCYemzZSv0TPTrKkDAq+jt23MLUkVXjyQZw0GiUQMI4+ysm
FPqkb4gbqbgJI0G5MKihJ5+xUJ9iAWkWDR5NZn6hTsQjlNfw1Z1wWw2jG6a1QY5e
DLU+l+uxzn9s1xUNRa9gSdliN8VnPV00eIzoYrN9HmsObzy4YQF5FtmRLSKa62bf
cp53MNDJ9WEliwZzNXIYh9dTHV7F71AYfOh7rwSWCS3bJrLR+F6nfriAjKxNQEmc
9R+xtHFCrAwNK9UK+Pm/jn/9v0wrqBRCMNxks3zKYGKlQjMuBB/2UEhf7dbInz9A
FzO8h7bWEHijx0jE0gNirRF1eWLpjkO5CABuw/y4zTfBhmIR+4rrPwKoj4VQt/Eu
ENSj/eMw2woW7UGcbXU2UGTb6tsyejRX8ZVGsrBoye8gpBUO07clzN0DZErJdzwu
IrZ0aEnU1AaSBFJbW4f6IHHrqW2YnrcXWbnLr3ZdrSw2G1/NFyPOBsHhdIpn++XX
dxXlOL21z6yiryFKSBAvEE+6i3MCVXI3KGlF1bq/u0LiMkgQJYfH8jQ+m71CwWgO
ga3yF8cUA2v7TLEDrO2EhPUfJzTn5r9eUGUIsC9jZuOxx4pPjT7R3Iv+yTgruw98
5HE/EK21qKtxwIrXFOXJzfxOfueH0AnJwWaBwI0C/EudkSLBIdGqU4GggNhXyAaa
0D8Y3nVw4y1ix+qbHAt/37f8wUBcnjoyfhxhtj4I0Og9b17lfxAnzEwqbWgRJHgq
wYJEtkcNI0GdHWLuW8XDcpnrjpNamUlO2jHrMh/X52zoXA9vAJe8+cl86jZX0fKb
6LQXUIbgoC8pg6pfELXdIecq8LlgE15kXbh/iUQTnDYlAYZilkZIGVCWj/S/+sRJ
WH74HEh7v+m1Hx04Tc8bknzDAypFOFCdbLSbWfOGpJ+88q5U6s1+/79QW3ynra+c
XamWsphNyOvui1OMjLmBGvjO9tEAh8oTZImXblmn9eFC3huQj5WwjTXzAUiu8uw4
T/VThiM6GfQ1hUd7X/kCYzBFdSbW5uOHWtLSi18XVWI4YkNPoSsf+qicu4yQ7LzS
4AXa7sKaexrqbVhf/mKElff1tWhABc/Rr92MupxDo3/V7RAL510Zyp+IeAJsTQKB
j367y7LihYtV0cMS3FU+8akLNLkMq9HynvAh6oIe9r91MxYFjcMplWsNrofZVToc
jidgSTg4cWhNqgkMFwsR3ts4tRwKjw2JfpUaYOt0VFQh2x/BeDEOpJow0T+2SkxG
/oZExXhet6B5rNk/uj83XtaqYblDJw1lqRjWJYNO/EZCJomsCZhCLOR5CqG3wO/8
zgMKadkTOP89dmArIA1kmrAAXsSgoKs5vlcuYh6fDOGkV5c9xbljx17QixRKQU2g
b3IEkTOGz1r0EN5M3Kn05F7l8xGthsOnWOzuTsQSzpW284DrSdyzfpTTdSbityWg
10BgkdkvsjX0Wd7f+fpjJ3gxgOJNTcpmTwZKW2wc4nRcnEgTtUtxNyaiNf3Kwa2u
QHu0+U4ujboIDdLCaF86G+qUmHfiu546tseYrupVzLHAHWYyS8ZGyHVBkm+Srhvy
QxBC+3Arfkotc2i4FvN9ULshZ5QDCW+uak3n/BrTEsPwEV1NjCIYaN+0d/ELEC+o
mMn03PqpPS1xMVa7mrTl1U64bhm1bmuF9//ie7r0UAZF8CxWk7/QppE78bXRU7+6
1H3QMxwjY+sjbHSWmQQ+IhvuTGCW8/kTZx+XPqQMJjR0AZo9/wdbkxDuvaajbe+M
R88YOsq8BKpFJs//sR//B6bvZWaYw6DJoOLbsUsfoK7EHGXDSVIqJ3FK40J5RSkv
lcj/96AaJNTGwvNqE0YCldt7M0JJ1MiV49cm2nH9m+vI0GBEnTW989gUXdHTVXIl
ovQprrNNLSCHw6UCdgGeg7C8mc1RGaYchd1nx2S/3UhUhjoTRqc2rExfWrg9g09u
ajaEcJoY6vF8/fixdACvISl3fRnWSP3a7CXRhLPRVTgMd40zg07fGbUG9XrgFjzE
9sndZYEfMUtBja4YN+HBHE72kHb+oBgTyUIrjaT7UYVrizMIjj7m7enxDFi+2tg0
mbpZdnnpKysV3vloRn0er85vQmIWd0YhcX41fybgi/IlZxGFdW0dfUR5eY0VlAc4
rajjMCNM/c2fKCyr0o6AgCNEWHBtHTiNCWkJkJ8dMZs3aFrDtS+O5RRKdlPYjogx
XsJAzh9xS/4gYpAksFKd4wXIj5zRTEtXBQlXv90gOk7D3no+hsC6c9PCaL45tFAT
W0ZgWqBXE+3e6F2R9BTbtqg9zjTel1hP0E8KDr1vV+DQb3FKpSMIw4Nf5a70dPly
+KiU0GRNecDZCkXsVMgiW3uaPydwgEeRUugEGIW3vGS2t7sYo5bRlozJOEOOVQXF
kmFymH+jKEDYaTKr9OJZ2GWbtckOtTSQrBY6YTRGtCPW+37vH5h4MYoV58hMGjEX
fyg0hVFhpYEHgZpE7qD4aoIYgHk3+yMsQNik1Wmf9sFER3pm7i+hm3wImNAIt47L
9XVAWh9fgOLDb4DcIXOkcQZ1PHUsevqF0YOO8ws1HthAJn7nACqD6FOxPvWEt4HL
LjssnaHQmP99MFuMVTzI0Rw+eDapIYRHpEEPqRv+Viysv18lHAabyTIbGxdzjVcw
5H7sp3X9HTK67T1P5XamBlkW7yfggsQs+6m8dml8YXB7Aw4D2LahXkE/sWlqea2k
j/iJUvHocF10A/D6GEvWo4Gy5iciv2B1HsaDHgzwqWJwPbZAYxB5sX2wwd27YAbg
fCemjOyI6u8eMk9mUo49SCb7x+14hXg0CbE1u4z3Dtu8KIsubh/CV2dl35wM+j+y
d1WSCshFYSdJ/Uyb7MxrVnBjFP+0Z6aZHPk43OzK9Rw2P4i99H8cPIFQ+mbBgu3V
f+WyKCJLybYXeE9gl2JT3Q7SM1VVOj4l2/YTohgkIUcUj4dG6a4+ThdZW9sgRuJU
kL5bWBAW9FA7ZKBlwtmcZRvcT+ugeMzFlI/723M2T3wUHYBp+beJR3ElesZEMpTI
eZiU41nHWSt70rVpE3m2qEcdWhjHDkWHaZ5zDaLpdT3ULhIagRILNo5FvFKTNG+c
PBIf6kcJf1Njduf3xeJNld/9t58PDDM22WTC+qzzeKFNKLvSjtkFkFir5wszUqQb
OE6KAvmn1deAWbuoFd+eqmselCd9DqCXKSTQHjeoh/tHSGmMV/Dy8gzv/QDzd8Rf
DlZtrQtAbYYe5INELaIGhmOPfDPXF3nCgqk17FI/h8rzxlTvzZ2vITHzeE4zmLnQ
iFfLrAvVfMwP+czaNHXXqIciQrXuqn6uZysI3R2Iqk96mhvp82LrQDz3H35ZtyI9
RwItaEUXjhEjLdQZA8SHKgnAu3C82Y4PP2C+I5PVbBOsOD4Hu5Xghn2yd2DHz7je
Ay7+ARzVoI5cVK/VPiYTumuI0qcc8LKQkAAMy7PiIKfJoyvFV2Dctndv1dvcpKTn
/G4lDC2zFc8zC6jq4GdQwSbMhgLIRa4glMM89M5jpSd7yzIA4FFPYG6m+cugf+hE
NoSR7NTBg56cITFIw3Z1Wi+aBSoTHRylvhQOB1jz8w5FpLPA9YpqeRiFxsg3ju7O
EnW9+6HEzm0jCKeYLoqFOyHfDdWe8Rt65jVleTjykpPvr/7mnR+15sF0aHqq/tm8
wYCRvOE/VXXMHqrNqZD4wNXunV97SdrROnWH3m5l89E+kdHfOSNpTyy1jFeTAcIW
WwTJX8mQXwydisJ/bk4KrV0+VApL38Af7WR+/aHr1/nmH0y5Tuio+v+iCKfxI/ls
TrtNv3MuAFUfdR8DVfcCXG/TMzg8Z24hI/MZrq3LijeKORCd4ejzEyUFhD4QKjPk
gbLU2UFTquUnRisE5YeUGc8EhNkEe5vjgBUoIU8tbGS4sw17NnqA3PBN0E4/9KMm
HfC+cRgCRPFt/RPJwvpPvDdt30wtIqIWONRa+WVjgrEhM+sbstZPpxqMZT+OcJUc
RQtbe5gLH2g3VKOPH2zkg1i+nN/HzryRS/6Emi2QT88sWnPRwzUF2GNt71zy+71W
dYY2ckqIxNTXyHz+5bJDjWSSSZ13M6xNrmNziasBWvuIfLVqZ1s+ACN0jVS0vgDe
K6PzMexS217v9omVoapEExq+SiGJV1Is/UJ+kKYzrhJPXrR0kUDZ4xLNFLKeNJZ7
JTxLWCLYQSzFQwDH2sfyDmk2iO6QkXb/vEA7ZQZzgz5p1A1cugPhdRnycBi7EaBr
q676fL+e1ffWvjDJFuruoPmcKKNGjNeQSgSvvbqyWDdkDfvZmsYAP//P7NCk5xtq
oljbd2+M9k9gUNqivtU2qP8dw/vqecEcscMLgJR8gm47twGaJY+VwDPXs6mroBpk
AS304YXN5rzS7FV5KbwSpLoKB/Onanrc5nwpSh+IYMZNeb3WmyzkIY9SYeFSuUUc
Coqomlzsg9f5AsAgjK1IMdaLY4QKn/GlPZIn2TbwRAF7iMK2R2id1uAc9/jYYUc4
cUARqRGrj3mgHdy6L07VlSZRM5GagmNT4GpyGmkQTdn6v5m+wz54VnFfat5bV7W0
MJoJqfx8b2emhcYOCOZJgocBzcOrrrzQasAxbnzFbQHkdSaxKa2QGKUPWJQSyWkS
/A9NDuFuegHjcmGgIGlqRM9IVFVEScvYIh+ljXuDcwTCrxoH/WM5L0uGdMLZDAsT
kbMdNQIWgYp61mC2Mf8YRaGsR4rz9wmIOVlgB/aKx2e5y/iT8M2LrAJ9vKL7BEX8
IGlTPybpT6b5qJD5XQroS4ctAeAG3jID35wbdQrEDT4sE/6LiWm2DDH/mxDD7kMq
o64ADfadA/Bnm7dRL/qtKzAaBRB9xRg6uO0nO2hBU8Bq/YyT+fLypVpf7c0f9QVo
8OnYuBkLSCaS1//IhOeTALTy6kvN242yfYtngySj9/e39X27zy4mnu5OCaOyeuqy
FMbKL00mX/h/0D56/C/QjXgUWkHuUIA+rx9SWaiTORTny1B4gOFoOF4ntlgHQkUO
3sZcy5sM2pk9xDSUcfOW7TDa8KJ46ua7qrtATobGTC/gsv/0RpV9cCVu3F01MUgq
W/455NKHI8ERjalk4JyxRJWaaLSoM11/wJaFx2V2yGqUt4CtPESxHHYfx+DasPjb
POK+Trd6VDW/iKW3mq+GieBYinSJ13NU7sxUQIc0U7+deF7tWqMTGkbSHR6GjiUz
jsxV1zGxlvBqsRYuvpbnPLSeiBOUPpqrtiK3brTz6+oNpaItvhyCdv9vFw99DO3B
u9CoUUDRCTR7FhV693pWgZR/XWqF0Ak1iqrF9n+q9gFd3Bxe10IEvPpqLQi7iK39
CxTy91p897AEV59afpU6tetTJgyyJaN7YfTFXFWBMdX9OVA6i2MJaTTHtu5cC++n
Oqagh+m8CdWs9ztkP8Uo3LwkuFJL+gyPnygir0XVEUU67WkI2mfy2Aldrsj3snXU
iTgWGT74Wg3VfL+hKKJJVxM6NkkiSBiQYXEfl/+yR6pmN6W1w60vHKIRoCGDr5rl
bzRk/+flpqh8W9G9hGi+7BLVeubLTQqVhFs+8u5+ly4/GfFgNGlKW3mmCjge40k6
RdqYT1wWHTTLSRxoRqx2tGbHbOqBxRB968qjhDyEOa0vkJn10dXC3QMlK4Mpha/6
B3UYPj3lwFobAQ6rAJTSzY0ySGkHwh/hZE4NnaS+nWTeZlNt8Wo6xa+Ocn3PAPZs
ch3wl7WljruBQ9oLBLxjQY5Hk0VeNUhq93rR4IVDq2Get2shw1WX3v9Whf/xh17S
yFcqqbe/rar8/V/062da0L9EBL0sf2XIl1a1e15bLu6y19cXvAlJOJWV3HYHGRMI
`pragma protect end_protected
   

`endif //  `ifndef GUARD_SVT_BASE_MEM_SUITE_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Og0ewZk3OO8M5kDIF3rgVqyJ3I6ldIt5deA8HsWU6ohCUQ9RSu+IqYfV1Sb/uxfL
9QDQEj3yPdMsmgF1e1rstxtroVac+2ATcmo6HOs263v/ZH/6+6vF+98p05aReOnF
3x5skDlax+GHMP5XfpICQ1Lr4fbkZmqMW2EW8T53Blg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11689     )
yTqqltYQJ+Fu5nALDCD+AQMjRz8GaAN8A+NMbBus/hJQdcMerASgBrZoeepSKUxz
vGzqarZVjY97QxYdrOtEC/exVBIf3+srf37Jfq9bkP4tHfnd32f0G7NId7NcuTi6
`pragma protect end_protected
