
`ifndef GUARD_SVT_SPI_CATALOG_SV
`define GUARD_SVT_SPI_CATALOG_SV

/**
 * Catalog class SPI Catalogs. 
 */
class svt_spi_dwhome;
  static function string get();
//vcs_lic_vip_protect
`protected
A)M7/.@e_HGR#]G/M_^B.H3:>MbM;Z).[P,[V.2ZZ@H3BL:;(_18.(GVH]?LS7^V
?@R_IbB0;RJ\@ac.FURHZHcJ1,I08WOd/E6&&&53Ud/gS/@<&6#[M\[&PEeS#\MO
#b\dD9&WB2+_-cFXO<K#:#cJ6$
`endprotected

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
