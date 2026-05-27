
`ifndef GUARD_SVT_SPI_CATALOG_SV
`define GUARD_SVT_SPI_CATALOG_SV

/**
 * Catalog class SPI Catalogs. 
 */
class svt_spi_dwhome;
  static function string get();
//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
zvS2gbo47GT8TecUeWwp+UKYmH+D2X5YZq6hjonb5AvQ+3C9batv5+S8l3BfY7cB
xa37w+zLrsFhcV1Mu+AZWLoTxxKBvVi5ZqQc1meV9vEXZm+NzYl6sIiMHG6o/abE
iTlySQvMx4B8mOWfvGp39zfkDX8v89fvhiFPW4oP/mQ75gi9D8rjDA==
//pragma protect end_key_block
//pragma protect digest_block
Tp5N6kXOawDTII+B+fm2opgTKOE=
//pragma protect end_digest_block
//pragma protect data_block
R5lq0CbuKKEStXQ8rn5u7Qb05yAceDnxJi5njUwjTQGIhGVFVfF45q1gUZBhlym1
bMZrYJbDfRZIMxEq7jSP/jla6cDF7lxPMoVfiljHo33JcGclLKQXey8c70+7Xk3A
aKTJMGUDRWbecMQEvpioq4U1tQ4MxAVyY1wWo+yzQAO3GJMCSPuf8okuzaOmAPnM
HVkPYbQSljx1YJ7CXEUWlhDSZ2sPK6TgX8Tt5uuQF+J0gPLxqR8m0rMhZM2s469K
bHSHs48N+HzmIJgSZ24u3nzygzaFOGwmMjjj12FOE9IH9vYtYZuy0fe1Tl417MMJ
uxLlDEsMrajXxQcOgMTE3dgOUWyGZ1skFqRQjZrpxtK0QUi+AGF7vk/s+bxBOW7T
P3tD1Vau1kstEBB5/p7M5IxpnbUk3ITARzE+lLhrDDs=
//pragma protect end_data_block
//pragma protect digest_block
V7LRPiShQD2IY05OC8i2PV9iKjg=
//pragma protect end_digest_block
//pragma protect end_protected
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
