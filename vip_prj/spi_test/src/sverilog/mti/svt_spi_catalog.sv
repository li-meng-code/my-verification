
`ifndef GUARD_SVT_SPI_CATALOG_SV
`define GUARD_SVT_SPI_CATALOG_SV

/**
 * Catalog class SPI Catalogs. 
 */
class svt_spi_dwhome;
  static function string get();
//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IDVKA0Uxf/vLCjAbfodJhwSf9IQnxbC5U1lAp4YkiSuWE6iSvmjz5XOJDoKQyWMw
r7TxYKVO2W8yx6zNiBAU8VRie51XYtsrmrK3KF/gJLZ6ud17c7upFCh+WPqNB8xE
kZRF1Co8uYu7iDOejUUN0Ht0hlATqTYKg/KBEFdcAkg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 144       )
jfla3J0XXWF6+tyeXcQi6hTOOsgO7qYs0TRuU2iJc1/4hQv3cTkdIDFa5M4D24ob
QAmELDrMJKIrU+nRIQc2Sj229/aWteKo2GjPnESgH9YFq/rHxVKpeh9s4gl7Z+gf
pGssl5vVJeQwOI2rcQ7Nmyu5cEpHcqh//MLSPd4iV3T+tYXlNb9devwQHpeJRX14
pjwP0qh8Hi7Q9AciKuIKzA==
`pragma protect end_protected
  endfunction
endclass

typedef svt_mem_vendor_part#(svt_spi_dwhome) svt_spi_vendor_part;
typedef svt_mem_vendor_catalog#(svt_spi_vendor_part) svt_spi_vendor_catalog;

// Include the installed catalog pages
`include "svt_spi_catalog.snps.svi"
`include "svt_spi_catalog.user.svi"

// Optionally include user-defined pages
`ifdef SVT_SPI_USER_CATALOG
 `include `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_SPI_USER_CATALOG)
`endif

`ifndef __SVDOC__
// This includes spi NOR/NAND flash catalog.
`include "svt_spi_catalog.svi"
`endif

`endif
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OCkpcGY/OLL6fJgyLIgAMQXBstHpwYzOezhYT2aBQBqe4bh1luHB9CUc5Hq9Ubb2
wdStIhGQB/pVG8lFvg9cP7VjHOvaJFqPzo3D1Fruk30SiYVfIVHAb59FUZ4tlXPC
sdiGnc8ZuBRPKX2m56BZbhCUZNlcAt5kBBY/v9/FCVo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 227       )
q9y/Yglx2KZRDUqg04FFO/iO7vgBHQ/28KwTu6YQSqRKuJOELArCpE1c+v1rzhIo
NyADsFDHMGe/t2Lc+TWzRNJZgTOtyOMkWKImzTkkkS71z34Xj/XvuwzO4+niV0kp
`pragma protect end_protected
