//=======================================================================
// COPYRIGHT (C) 2012-2023 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MEM_CATALOG_SV
`define GUARD_SVT_MEM_CATALOG_SV

/**
 * Default values for specifying memory part depths
 */
typedef enum {
              SVT_MEM_2Kb    = `SVT_MEM_DEPTH_2KB,
              SVT_MEM_4Kb    = `SVT_MEM_DEPTH_4KB,
              SVT_MEM_8Kb    = `SVT_MEM_DEPTH_8KB,
              SVT_MEM_16Kb   = `SVT_MEM_DEPTH_16KB,
              SVT_MEM_32Kb   = `SVT_MEM_DEPTH_32KB,
              SVT_MEM_64Kb   = `SVT_MEM_DEPTH_64KB,
              SVT_MEM_128Kb  = `SVT_MEM_DEPTH_128KB,
              SVT_MEM_256Kb  = `SVT_MEM_DEPTH_256KB,
              SVT_MEM_512Kb  = `SVT_MEM_DEPTH_512KB,
              SVT_MEM_1Mb    = `SVT_MEM_DEPTH_1MB,
              SVT_MEM_2Mb    = `SVT_MEM_DEPTH_2MB,
              SVT_MEM_4Mb    = `SVT_MEM_DEPTH_4MB,
              SVT_MEM_8Mb    = `SVT_MEM_DEPTH_8MB,
              SVT_MEM_16Mb   = `SVT_MEM_DEPTH_16MB,
              SVT_MEM_24Mb   = `SVT_MEM_DEPTH_24MB,
              SVT_MEM_32Mb   = `SVT_MEM_DEPTH_32MB,
              SVT_MEM_48Mb   = `SVT_MEM_DEPTH_48MB,
              SVT_MEM_64Mb   = `SVT_MEM_DEPTH_64MB,
              SVT_MEM_128Mb  = `SVT_MEM_DEPTH_128MB,
              SVT_MEM_192Mb  = `SVT_MEM_DEPTH_192MB,
              SVT_MEM_256Mb  = `SVT_MEM_DEPTH_256MB,
              SVT_MEM_384Mb  = `SVT_MEM_DEPTH_384MB,
              SVT_MEM_512Mb  = `SVT_MEM_DEPTH_512MB,
              SVT_MEM_768Mb  = `SVT_MEM_DEPTH_768MB,
              SVT_MEM_1536Mb = `SVT_MEM_DEPTH_1536MB,
              SVT_MEM_1Gb    = `SVT_MEM_DEPTH_1GB,
              SVT_MEM_1_5Gb  = `SVT_MEM_DEPTH_1_5GB,
              SVT_MEM_2Gb    = `SVT_MEM_DEPTH_2GB,
              SVT_MEM_3Gb    = `SVT_MEM_DEPTH_3GB,
              SVT_MEM_4Gb    = `SVT_MEM_DEPTH_4GB,
              SVT_MEM_6Gb    = `SVT_MEM_DEPTH_6GB,
              SVT_MEM_8Gb    = `SVT_MEM_DEPTH_8GB,
              SVT_MEM_9Gb    = `SVT_MEM_DEPTH_9GB,
              SVT_MEM_12Gb   = `SVT_MEM_DEPTH_12GB,
              SVT_MEM_16Gb   = `SVT_MEM_DEPTH_16GB,
              SVT_MEM_24Gb   = `SVT_MEM_DEPTH_24GB,
              SVT_MEM_32Gb   = `SVT_MEM_DEPTH_32GB,
              SVT_MEM_48Gb   = `SVT_MEM_DEPTH_48GB,
              SVT_MEM_64Gb   = `SVT_MEM_DEPTH_64GB,
              SVT_MEM_96Gb   = `SVT_MEM_DEPTH_96GB,
              SVT_MEM_128Gb  = `SVT_MEM_DEPTH_128GB,
              SVT_MEM_192Gb  = `SVT_MEM_DEPTH_192GB,
              SVT_MEM_256Gb  = `SVT_MEM_DEPTH_256GB } svt_mem_depth_t;

/**
 * Default values for specifying memory part widths
 */
typedef enum {SVT_MEM_x1   = 1,
              SVT_MEM_x2   = 2,
              SVT_MEM_x4   = 4,
              SVT_MEM_x8   = 8,
              SVT_MEM_x16  = 16,
              SVT_MEM_x32  = 32,
              SVT_MEM_x64  = 64,
              SVT_MEM_x128 = 128,
              SVT_MEM_x256 = 256,
              SVT_MEM_x512 = 512,
              SVT_MEM_x1k  = 1024} svt_mem_width_t;

/**
 * Default values for specifying a part clock rate
 */
typedef enum {
              SVT_MEM_20MHz   = 20,
              SVT_MEM_25MHz   = 25,
              SVT_MEM_30MHz   = 30,
              SVT_MEM_33MHz   = 33,
              SVT_MEM_40MHz   = 40,
              SVT_MEM_50MHz   = 50,
              SVT_MEM_66MHz   = 66,
              SVT_MEM_67MHz   = 67,
              SVT_MEM_75MHz   = 75,
              SVT_MEM_80MHz   = 80,
              SVT_MEM_84MHz   = 84,
              SVT_MEM_85MHz   = 85,
              SVT_MEM_86MHz   = 86,
              SVT_MEM_100MHz  = 100,
              SVT_MEM_104MHz  = 104,
              SVT_MEM_108MHz  = 108,
              SVT_MEM_133MHz  = 133,
              SVT_MEM_144MHz  = 144,
              SVT_MEM_150MHz  = 150,
              SVT_MEM_166MHz  = 166,
              SVT_MEM_200MHz  = 200,
              SVT_MEM_266MHz  = 266,
              SVT_MEM_267MHz  = 267,
              SVT_MEM_300MHz  = 300,
              SVT_MEM_350MHz  = 350,
              SVT_MEM_333MHz  = 333,
              SVT_MEM_344MHz  = 344,
              SVT_MEM_400MHz  = 400,
              SVT_MEM_466MHz  = 466,
              SVT_MEM_467MHz  = 467,
              SVT_MEM_500MHz  = 500,
              SVT_MEM_533MHz  = 533,
              SVT_MEM_600MHz  = 600,
              SVT_MEM_667MHz  = 667,
              SVT_MEM_688MHz  = 688,
              SVT_MEM_700MHz  = 700,
              SVT_MEM_733MHz  = 733,
              SVT_MEM_750MHz  = 750,
              SVT_MEM_800MHz  = 800,
              SVT_MEM_900MHz  = 900,
              SVT_MEM_933MHz  = 933,
              SVT_MEM_938MHz  = 938,
              SVT_MEM_1000MHz = 1000,
              SVT_MEM_1066MHz = 1066,
              SVT_MEM_1100MHz = 1100,
              SVT_MEM_1200MHz = 1200,
              SVT_MEM_1250MHz = 1250,
              SVT_MEM_1300MHz = 1300,
              SVT_MEM_1333MHz = 1333,
              SVT_MEM_1350MHz = 1350,
              SVT_MEM_1375MHz = 1375,
              SVT_MEM_1400MHz = 1400,
              SVT_MEM_1450MHz = 1450,
              SVT_MEM_1466MHz = 1466,
              SVT_MEM_1500MHz = 1500,
              SVT_MEM_1550MHz = 1550,
              SVT_MEM_1600MHz = 1600,
              SVT_MEM_1650MHz = 1650,
              SVT_MEM_1700MHz = 1700,
              SVT_MEM_1750MHz = 1750,
              SVT_MEM_1800MHz = 1800,
              SVT_MEM_1850MHz = 1850,
              SVT_MEM_1866MHz = 1866,
              SVT_MEM_1900MHz = 1900,
              SVT_MEM_1950MHz = 1950,
              SVT_MEM_2000MHz = 2000,
              SVT_MEM_2133MHz = 2133,
              SVT_MEM_2200MHz = 2200,
              SVT_MEM_2250MHz = 2250,
              SVT_MEM_2350MHz = 2350,
              SVT_MEM_2300MHz = 2300,
              SVT_MEM_2400MHz = 2400,
              SVT_MEM_2500MHz = 2500,
              SVT_MEM_2600MHz = 2600,
              SVT_MEM_2667MHz = 2667,
              SVT_MEM_2800MHz = 2800,
              SVT_MEM_2900MHz = 2900,
              SVT_MEM_3000MHz = 3000,
              SVT_MEM_3200MHz = 3200 } svt_mem_clkrate_t;

typedef class svt_mem_vendor_catalog_base;

           
/**
 * Base class for the default part catalog entry.
 */
virtual class svt_mem_vendor_part_base;

  local string            m_number;
  local string            m_descr;
  local svt_mem_depth_t   m_depth;
  local svt_mem_width_t   m_width;
  local svt_mem_clkrate_t m_clkrate;
  local string            m_cfgfile;

  local svt_mem_vendor_catalog_base m_catalog;

`ifdef SVT_VMM_TECHNOLOGY
  /** Shared log used if no log is provided to class constructor. */
  protected static vmm_log log = new("svt_mem_vendor_part_base", "class");
`else
  /** Shared reporter used if no reporter is provided to class constructor. */
  protected static `SVT_XVM(report_object) reporter = svt_non_abstract_report_object::create_non_abstract_report_object("svt_mem_vendor_part_base:class");
`endif

  function new(svt_mem_vendor_catalog_base catalog,
               string                      number,
               string                      descr,
               svt_mem_depth_t             depth,
               svt_mem_width_t             width,
               svt_mem_clkrate_t           clkrate,
               string                      cfgfile);
    m_number  = number;
    m_descr   = descr;
    m_depth   = depth;
    m_width   = width;
    m_clkrate = clkrate;
    m_cfgfile = cfgfile;
  endfunction

  
  pure virtual function string get_dwhome();

  virtual function void write();
    $write("%s %s (%s) : %sx%0d, %0dMHz (%s)", get_vendor_name(), m_number,
           m_descr, get_depth_desc(), m_width, m_clkrate, m_cfgfile);
  endfunction

  /** Set the vendor catalog this part is in */
  function void set_catalog(svt_mem_vendor_catalog_base catalog);
    if (m_catalog != null) m_catalog.remove_part(this);
    m_catalog = catalog;
    if (catalog != null) void'(catalog.add_part(this));
  endfunction

  /** Return the vendor catalog this part is in */
  function svt_mem_vendor_catalog_base get_catalog();
    return m_catalog;
  endfunction

  /** Return the name of the vendor for the part */
  virtual function string get_vendor_name();
    if (m_catalog == null) return "<Unknown>";
    return m_catalog.get_vendor_name();
  endfunction


  /** Return the name/number for the part */
  function string get_part_number();
    return m_number;
  endfunction

  /** Return the description of the part */
  function string get_descr();
    return m_descr;
  endfunction

  /** Return the depth of the part */
  function svt_mem_depth_t get_depth();
    return m_depth;
  endfunction

  /** Return the depth in string format */
  function string get_depth_desc();
    string depth;
    depth = m_depth.name;
    get_depth_desc = depth.substr(8, depth.len()-1);
  endfunction

  /** Return the width of the part */
  function svt_mem_width_t get_width();
    return m_width;
  endfunction

  /** Return the clock rate of the part */
  function svt_mem_clkrate_t get_clkrate();
    return m_clkrate;
  endfunction

  /** Return the cfgfile value provided for this part at construction */
  function string get_cfgfile_path();
    return m_cfgfile;
  endfunction

  /** Return '1' if substring found in cfgfile_path, else 0 */
  function bit match_cfgfile_path(string regex);
     
`ifdef SVT_UVM_TECHNOLOGY
    match_cfgfile_path = !uvm_re_match(regex, m_cfgfile);
`elsif SVT_OVM_TECHNOLOGY
    match_cfgfile_path = ovm_is_match(regex, m_cfgfile);
`else
    match_cfgfile_path = `vmm_str_match(m_cfgfile, regex);
`endif

  endfunction

  /** Find the CFG file for this part
   *  First look into VIP installation directory
   *  then in the colon-separated search path list specified
   *  using the +SVT_MEM_USER_CFG_PATH= command-line argument.
   */
  function string get_cfgfile();
    string paths;
    string cfgfile_full_name = "";

    `svt_debug("get_cfgfile", $sformatf("Entered, m_cfgfile = '%0s'.", m_cfgfile));

    if (m_catalog == null) return "";
    
    // Look in the VIP installation first
    paths = {get_dwhome(), "/catalog"};
    begin
      string arg;
      if ($value$plusargs("SVT_MEM_USER_CFG_PATH=%s", arg)) begin
        // The user catalog should take precedence
        paths = {arg, ":", paths};
      end
    end

    `svt_debug("get_cfgfile", $sformatf("Searching for cfgfile using m_cfgfile = '%0s', paths = '%0s'.", m_cfgfile, paths));
    cfgfile_full_name = svt_mem_find_file(m_cfgfile, paths);

    if (cfgfile_full_name.len() == 0) begin
      `svt_fatal("get_cfgfile", $sformatf("Failed attempting to find 'cfgfile_full_name' in catalog based on m_cfgfile = '%0s', paths = '%s'.", m_cfgfile, paths));
    end

    return cfgfile_full_name;
  endfunction
endclass


/**
 * Default part catalog entry.
 * If additional or different part selection criteria are required
 * for a specific suite, they should be added in a derived class.
 * It must be specialized with a policy class the contains
 * a static "\#get()" method returning the
 * full path to the installation directory of the suite.
 */
class svt_mem_vendor_part#(type DWHOME=int) extends svt_mem_vendor_part_base;

  typedef svt_mem_vendor_part#(DWHOME) this_type;
  
  function new(svt_mem_vendor_catalog_base catalog,
               string                      number,
               string                      descr,
               svt_mem_depth_t             depth,
               svt_mem_width_t             width,
               svt_mem_clkrate_t           clkrate,
               string                      cfgfile);
    super.new(catalog, number, descr, depth, width, clkrate, cfgfile);
    set_catalog(catalog);
  endfunction

  virtual function string get_dwhome();
    return DWHOME::get();
  endfunction

  /**
   * Parse a line to see if it is a metadata line
   *  and, if so, return the contained tag and value.
   */
  static local function bit is_metadata_line(input  string line,
                                             output string tag,
                                             output string value);
    int i, j, k;

    // Skip leading blanks
    i = 0;
    while (i < line.len() && (line[i] == " " || line[i] == "\t")) i++;
    if (i >= line.len()) return 0;
    
    // Must be a "//" or "#" comment line
    if (line[i] == "/" && line[i+1] == "/") i = i + 2;
    else if (line[i] == "#" ) i = i + 1;
    else return 0;

    // Skip blanks again
    while (i < line.len() && (line[i] == " " || line[i] == "\t")) i++;
    if (i >= line.len()) return 0;

    // Tag ends with a ':'
    j = i+1;
    while (j < line.len() && line[j] != ":") j++;
    if (j >= line.len()) return 0;
    k = j+1;

    // Strip trailing blanks from tag
    j--;
    while (j >= i && (line[j] == " " || line[j] == "\t")) j--;
    if (j < i) return 0;

    tag = line.substr(i, j);
    
    // Skip blanks again
    while (k < line.len() && (line[k] == " " || line[k] == "\t")) k++;
    if (k >= line.len()) return 0;

    // Strip trailing blanks from value
    j = line.len() - 1;
    while (j >= k && (line[j] == " " || line[j] == "\t" || line[j] == "\n")) j--;
    if (j < k) return 0;

    value = line.substr(k, j);

    return 1;
  endfunction

  /** Parse the specified file and add the part it describes in the
   *  specified catalog.
   *  Returns TRUE if the operation was succesful.
   *  Returns FALSE if the format was invalid or incomplete.
   */
  static function this_type create_from_file(string                      fname,
                                             string                      partnum,
                                             svt_mem_vendor_catalog_base catalog);
    this_type part;
    int fp;
    string line, tag, value, descr;
    svt_mem_depth_t depth;
    svt_mem_width_t width;
    svt_mem_clkrate_t speed;
    bit has_descr, has_density, has_speed;

    fp = $fopen(fname, "r");
    if (fp == 0) begin
      void'($ferror(fp, line));
      `svt_error("create_from_file", $sformatf("Cannot open \"%s\" for reading: %s\n", fname, line));
      return null;
    end

    while ($fgets(line, fp)) begin
      if (!is_metadata_line(line, tag, value)) continue;

      case (tag)
       "Description":
         begin
           if (has_descr) begin
             `svt_error("create_from_file", $sformatf("Multiple \"Description\" metadata value \"%s\" in \"%s\".", value, fname));
             return null;
           end
           has_descr = 1;

           descr = value;
         end

       "Speed":
         begin
           // Speed is encoded as nnnMHz
           int i;
           
           if (has_speed) begin
             `svt_error("create_from_file", $sformatf("Multiple \"Speed\" metadata value \"%s\" in \"%s\".", value, fname));
             return null;
           end
           has_speed = 1;

           i = value.len()-1;
           if (i < 3 || value.substr(i-2, i) != "MHz") begin
             `svt_error("create_from_file", $sformatf("Invalid speed metadata value \"%s\" in \"%s\".", value, fname));
             return null;
           end
           value = value.substr(0, i-3);
           if (!$cast(speed, value.atoi())) begin
             `svt_error("create_from_file", $sformatf("Invalid speed metadata value \"%s\" in \"%s\".", value, fname));
             return null;
           end
         end

       "Density": // Density is encoded as nnnMbxWWW or nnnGbxWWW
         begin
           int i, x = 0;
           string w;
           
           if (has_density) begin
             `svt_error("create_from_file", $sformatf("Multiple \"Density\" metadata value \"%s\" in \"%s\".", value, fname));
             return null;
           end
           has_density = 1;

           while (x < value.len() && value[x] != "x") x++;
           if (value[x] != "x") begin
             `svt_error("create_from_file", $sformatf("Invalid density metadata value \"%s\" in \"%s\".", value, fname));
             return null;
           end

           w = value.substr(x+1, value.len()-1);
           i = w.atoi();
           if (w.substr(w.len()-1, w.len()-1) == "k") i = i*1024;
           if (!$cast(width, i)) begin
             `svt_error("create_from_file", $sformatf("Invalid width (%0d) in density metadata value \"%s\" in \"%s\".",
                                                      i, value, fname));
             return null;
           end

           w = value.substr(0, x-1);
           w = {"SVT_MEM_", w};
           depth = set_depth_via_string(w);
         end
      endcase
    end

    if (!has_density) begin
      `svt_error("create_from_file", $sformatf("No \"Density\" metadata value in \"%s\".", fname));
      return null;
    end
    if (!has_speed) begin
      `svt_error("create_from_file", $sformatf("No \"Speed\" metadata value in \"%s\".", fname));
      return null;
    end
    if (!has_descr) begin
      `svt_error("create_from_file", $sformatf("No \"Description\" metadata value in \"%s\".", fname));
      return null;
    end
    
    part = new(catalog, partnum, descr, depth, width, speed, fname);

    $fclose(fp);
    
    return part;
  endfunction
  
  static function svt_mem_depth_t set_depth_via_string( string depth_str );
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
gY/zI2AovkaxEnzkNbUkcKL+A7wy86q21wBqJcYN1NCqxxW6vrCCC+3F3EoC/ntm
0UIubXuU6UDOgF1jM6/K5BPkHfPyuwN4Kyd/6yXzt8WHzEJtEUfuEuITBMRvx1Nm
tKjEKCyndOlTIYuknL5Y8BDRRzKELf+kYB3C/rLDCpxSeHtUlU5jZw==
//pragma protect end_key_block
//pragma protect digest_block
Xob8qBryAiFoJ9RR2oc8y0zkPGY=
//pragma protect end_digest_block
//pragma protect data_block
BUThksfrERW6Y8EF8xxFeBHQ2foo/1VIGViTuBLO07iXfeYgJp09rEwY3roIDslm
nqAcpGIya3pAU1a5GgZ0PbcqMtamhq8Y6tqwx3CCQwYU2tBi10+CPU+bjri38zmO
M3MkCkyGytgBSD4QxyUVJljDsoAxAIjByYxR/tqKzE1ENDqtvd5nbmU/OesMN9nU
8Mskva19oKy1ejSelJyoE0hhs41+YYsIHhKVRlPUdXi3FsEkNjZ8M57JHtlg9Lc2
9LXSXFuMj5jrZrD/MJOy+53CQmtKxqu1m0aEUSvU3/PVXLnXNhJLwVqFF4Qww5wd
Voq5ciN2Se2Irx08xKDRAgzL3edPj8kepf4MgpQFHFD2bwmZ/hN0F/MTRs+AFuq2
dsiNqCmNAcf3Ml464L9zwgP5EbcnJAzilKdUso9KsPrVkf9IsggLjWKgn98xJbgv
6keMptQGQEhMzOnWvAaKkuy/ZgKHMHYeCRdIP0ZRjZ+PdiqZt430rvVGSTg/4anb
JogoCMadvvRXVGbjiguSZpX15KzXxSr/Jgcp3K/gc7yYuTZPmskQEIB+oUD9aJ5L
9TooTE6PpHk+wg14dB/s38hyCquogm0P50cXJVCf0gkgbioHt30GpIpGK7gCG2u2
ZMeK0KiZnp5n8nrDm6Nu41+pTLlAxvL3qzWi2U8j98c=
//pragma protect end_data_block
//pragma protect digest_block
ddPx+j9Ci9TmPeEEXKycuFDh+ck=
//pragma protect end_digest_block
//pragma protect end_protected
  endfunction

endclass

/**
 * Part-independent base class for the vendor part catalog.
 */
virtual class svt_mem_vendor_catalog_base;

/** @cond PRIVATE */
  local string m_name;
/** @endcond */

  function new(string name);
    m_name = name;
  endfunction

  /** Return the name of the vendor for this catalog */
  virtual function string get_vendor_name();
    return m_name;
  endfunction

/** @cond PRIVATE */

  /** Add a vendor part to this catalog.
   *  If a part with the same number already exists in the catalog,
   *  it is repaced with the new one.
   *  Returns TRUE if the part is compatible with the catalog.
   */
  virtual function bit add_part(svt_mem_vendor_part_base part);
    return 0;
  endfunction

  /** Remove the specified part from the catalog */
  virtual function void remove_part(svt_mem_vendor_part_base part);
  endfunction

  /** Get the base class for the ith vendor catalog in the suite-specific shelf
   *  and increment i. The first catalog is at index 0.
   *  returns NULL if there is not such catalog.
   */
  virtual function svt_mem_vendor_catalog_base get_ith_base_vendor(inout int unsigned i);
    return null;
  endfunction

  /** Return the base class for the ith part in this catalog and increment i.
   *  The first part is at index 0.
   *  Returns NULL if there is no such part.
   * */
  virtual function svt_mem_vendor_part_base get_ith_base_part(inout int unsigned i);
    return null;
  endfunction

/** @endcond */

endclass

/**
 * Base class for the vendor part catalog.
 * Must first be specialized with the suite-specific vendor part catalog entry type
 * (itself extended/specialized from svt_mem_vendor_part class).
 */
class svt_mem_vendor_catalog#(type PART=int) extends svt_mem_vendor_catalog_base;

/** @cond PRIVATE */

  typedef svt_mem_vendor_catalog#(PART) this_type;
  
  local static this_type m_vendors[string];
  local static string    m_names[$];
  local        PART      m_parts[string];
  local        string    m_numbers[$];

`ifndef SVT_VMM_TECHNOLOGY
  /** Shared reporter used if no reporter is provided to class constructor. */
  local static `SVT_XVM(report_object) reporter = svt_non_abstract_report_object::create_non_abstract_report_object("svt_mem_vendor_catalog:class");
`else
  /** Shared log used if no log is provided to class constructor. */
  local static vmm_log log = new("svt_mem_vendor_catalog", "class");
`endif

/** @endcond */

  function new(string name);
    super.new(name);
  endfunction

  /** Write all vendor catalogs for the corresponding suite */
  static function void write_shelf();
    foreach (m_vendors[i]) begin
      m_vendors[i].write();
    end
  endfunction

  /** Write the content of the vendor catalog */
  function void write();
    $write("%s Catalog:\n", get_vendor_name());
    foreach (m_parts[i]) begin
      $write("   ");
      m_parts[i].write();
      $write("\n");
    end
  endfunction

  /** Get a catalog from the shelf for the corresponding suite for the named vendor.
   *  If it does not exists, it is created.
   */
  static function this_type get_vendor(string name);
    if (!m_vendors.exists(name)) begin
      m_vendors[name] = new(name);
      m_names.push_back(name);
    end
    return m_vendors[name];
  endfunction

/** @cond PRIVATE */
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QOvoYRrgnrjME6xUZz2kd+FoGc68mvpsIFY6aR7apbw8dnZB/JCOqLWl7Ez43vxc
urjxk7cIjNu4AjKu9CfhYo+UrvDfcaKsvb4J7/M354Xq5xtl9CTLkja4gYMBntWo
G9qCsjcIE3uKZtqqfmq3ysEmTuYSBCsV1rT20WUhu8BSJEeia6DPhQ==
//pragma protect end_key_block
//pragma protect digest_block
8PZFUBDkAAn7xA2Oq/bjmTBcMpw=
//pragma protect end_digest_block
//pragma protect data_block
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
xwTdllyG/Skyv3g6g0mG0Q==
//pragma protect end_data_block
//pragma protect digest_block
SpEWdMQD5eMJRXdLk4LWUNkeSa0=
//pragma protect end_digest_block
//pragma protect end_protected
/** @endcond */

endclass

/**
 * Default policy class to select all parts in all catalogs on a shelf
 * with an equal distribution value of 1.
 */
class svt_mem_all_parts#(type PART=int);
  /** Simply returns 1 */
  static function int weight(PART part);
    return 1;
  endfunction
endclass


/**
 * Class to pick a suitable vendor part at random amongst all
 * vendor parts in all catalogs on a shelf.
 * 
 * The PART parameter defines the suite-specific shelf.
 * 
 * Suitability is determined by the static POLICY:: weight(PART) function.
 * This method is called by this class
 * for each part in each catalg on the shelf.
 * If it returns a zero or negative value, the specified part is not suitable.
 * If it returns a positive value, the part is suitable and the value
 * is the random-distribution weight assigned to that part.
 * 
 * By default, all parts are suitable and have an equal distribution weight value of 1.
 * 
 * User may specify different part selection policies by implementing
 * different static weight(PART) functions. For example:
 * <pre>
 * class only_x16_parts#(type PART=int);
 *   static function int weight(PART part);
 *     if (part.\#get_width() != SVT_MEM_x16) return 0;
 *     return 1;
 *   endfunction
 * endclass
 * </pre>
 */
class svt_mem_part_mgr#(type PART=int, type POLICY=svt_mem_all_parts#(PART));

`ifndef SVT_VMM_TECHNOLOGY
  /** Shared reporter used if no reporter is provided to class constructor. */
  local static `SVT_XVM(report_object) reporter = svt_non_abstract_report_object::create_non_abstract_report_object("svt_mem_part_mgr:class");
`else
  /** Shared log used if no log is provided to class constructor. */
  local static vmm_log log = new("svt_mem_part_mgr", "class");
`endif

  /** Pick and return a suitable part from the catalogs on a shelf */
  static function PART pick();
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Pyay0rsclEfrGw2dDSMx41eUVqjOGBV1Y5j/HEhVBJhLrTmrDevFCihf+PdF1bxR
ACVHLjxcUIaWFqtlZ2Lo9qfMX7FnWLsp/Y1X52HBFjrUJzYUuhYnfg6ZQqnL1/+l
bfQD/7357rQ3KGaYu+A/vLpOKEK6z8mz+lYawe8YrAX0lj7iS+5q8Q==
//pragma protect end_key_block
//pragma protect digest_block
grQ/3U90w+zD6470/q89rFfl38c=
//pragma protect end_digest_block
//pragma protect data_block
e45usKTOJiY0rBluwz59HkslMJexx7pfVKMaNdnwF7xCsNv4RmiwzO+nuaQFvz4J
jmW1nqDDhNsH1r6F/dxXOvdzNq1P64vxvLoOlwAtKTcUEEYELsZ8/4elBMzCOuE9
JNi+SkUGQ1zBI0muZroLUUaWSiEqJwYdOnEPJRRCp/Gf1UjPKT2sPd62C7uL8uMv
CrREXLH/YUSyj67p8bDRqr7cVnzDvLxImaUw762V6zZQyprdWmIeckaKMvPdlmNN
m0LQrmD4MUV1MO1FFPlok1vq3AycdxFKTyPlpm8zAz9j81oddP2XUOJCI1jYEKe5
GDFULMgJ0FmicEbr2O6PTMLaeJtiYfks70hYEnL/0IujsjRcMim+drLtM3GYKfLj
uuv02MMQBtl8tIODHPk1UM9Lxi4UmcfW1JXg8rDgS7ROR7IynS9doNt+iHJOcpej
2gNC61SQcQxSwocB90pQ/KxVz6GjXyE7loalZjTC6vFGlrmDhuNv66LGZExMOQbi
nRjMXnShgwaOxlT+jNUVd7JiyNgourGZHz2vt1CXEHqP5rulVBDKhKZp0loDA+hS
/wDQCCutBIfmYfnDVuEWzJBv0lTBcKx77+/YFf4VvOdlkYFSZetSNVgvws9PyHke
FAvTPEMzwMqg3h5Vytkxn0RifrlGI22BM8VZ0CojWMkGxDkhjfH5NzZF9gbRkQ/Z
NYLTmCuw9AEjP8NIWwMPtzYjXmBxco6uYlYI5gq+tLVFZfR/7fRo3Wz1f7VpJxdt
NWf4uf/SU8Za7pUPOj3UO6wqCHptGffeSnxo3I5KjGMgf0DfeDmnAS/zShLgEaXt
VPT3bIKV7/jHb9hviNDdmyIx1dS2aj3ho7gHuvjmNRwBxYtxYm8F4vjl6qDEKbna
WqZiCstNmyyj+VofoQo2LVQujjHhviV1ucFM1WOUkyRky2+iMfQOGEa6S/SylaUC
QvDAX5OyVvq+rD9FuC6hSSNYvcDcg+1sTuTjBkKt2lb8gqEe2zYIbikSSM38UYBr
9cBEzg+S40y5AUIFlSgR6i4iI3Ty0SjJ05KeroPD4V38CQRnyv8TUbEbD+WBeIO2
AFTsC+td1D6WgddK6vOcSlSUHiHHafv/mRUCOBjS6SK/eQJSM1UBi8URHEUhXP/K
xukuKBpGjTwVrMJFxS0vf6B/nq9r5+mHrN0qPq73a31LQQvFU++v9SpK21sLf+Ix
8fc7ZF2Z2F8Bm3399qwlqufPP2ii2qczV3KfCzFPcF/3bwJdH4ZceVNgkR8oZfsW
5WvUYAAXu18vbghiKcTXSkZuLfAbg6RdtYSA2GH6N4k3YLTkYjwC8NL1/rb5VE13

//pragma protect end_data_block
//pragma protect digest_block
HPPaJLmZT9KY/Zcf0nPcbuqt9Ik=
//pragma protect end_digest_block
//pragma protect end_protected
  endfunction

endclass

`endif
