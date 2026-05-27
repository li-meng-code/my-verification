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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZVCwH+RoVzi0aMJNRr5q9/Wo7QqfPUjL9PGwf2TUb0aBULw1LP5XmLZiSATEYGn6
T7135OljRdN8mdn3jqFPA5jwLzj2PMKP4x0+f2bHfP1ut3JpiXpwSHsG9uGxNzh0
mk5c/wEVefOrnkqXUHUbICKzwlaER8uSAkf871z/ONA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 344       )
rqft1ksQikUMk+6ftBBbrGzMJMoKkadBpNeRHwa6P68PxNq3J8OSUGu5V4zn6TC6
nuEKO57YFmAIRSE3zDcz0uZFZ4XcyGvDQAJHNKB/RTzqphFI0eEZaeysQnAmiqEj
CMPofbtyCez+8bLGH9w5gT647gOghVYGHSF6otVMlxqDDCCPYwQ86hN7Hj48R23X
JblK1ih5bNs7oCkdaPrpWMcbUPjETfkGcjcu6743jBn2nOgrJvFldsVgGHQULDZD
NkzKkYMg4yzGBC0xZxGur2uonjkNOekYOC3R6hw+PCSDCotWF/c1yoKT6AuCtshN
n0G62JXMpa4kmVLKvlQkYvoZq8u7nOucKG5ZzkHB4JBQJ5j8/4jde+BUQVcWlP3M
Go4qn1tG6UhzPXkLde4pupGAJH5ztA5k7K2V36Z/adJNl1tlkJSVFhvtQW0GPmud
jkkDYj93iQJYwfUcD8rBPg==
`pragma protect end_protected
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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
avE1s9Gp/i+COB5Y4vwzB8FhAhAXLQif6BxHULJO+iSwJQfsiKTORQrhJ+eCzGyo
Dj1sJpNWfYX0HVlqrHIffleY4+3jULXsFew2VpmAG5WY44jQYYW01tpo7QgvHojm
kylwqpwr4GmKjAgYp4oSlEb2L9SXUSZXVvOGvsTPQaA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3828      )
dNdLrRvO74VSgpcnj0I4EU+bxu12Ba6YlDKcNypotEouF/3Ph7N+IF2HxwSq7YFB
dbKFac9mfXlzmXUE7CenitYoh9QTlGsT7jvmOWjCClErdnGKAXV6pVnO27CMIP1x
N+5vRWutYy7bv9z60vy0AeD7hlVNxmVDGDKK097qQilYtAuYpmqvLfiNS/3pAq5i
BFCtptrR72ZoKncjdUPGlrUkdQIWsVmdCd5Ow62xv0N7zPwA9xXGOaYnmvadXnDS
W3boCbC2o2d9dAZ5Q3KAEUZQUD7dCcaJwOCiRj3g2Jw7SNn1s+kEcCAawu3EJblf
jYhHjDKCzpoHhLCSSb86nDgJxW+IpJ+JcFDr9GJ4Vv3+2Oz14CZj6YlI69EbtSNi
HjYR8662c3X2ZOM648u+bCbA8nXikbCBagbEEbR2uyaGgOZyl+5ImhLQlAJ8YzV+
6czS3u/aVghkl1IvlUcC9xCVRGhyjb7WKzQeQ63HnUsHlvDqa8i3C4t3hEYaPF4s
nntpdmmCzReDeDqm5xF0FM+jBx/KrvQWvfmbqYFuhThsN3psdwrbavp3nFQczoRZ
hXSdaMNLzE68xAI+gPQvO5A9TVbYkGzG7BI+TIfl6CCWsCEXdzbNWDsw9IKcIlWE
2KgA5sHL/9oPwWUZM9tSJK3WKrGP7zJWSQKO9awbNQBstGxKS3QEKcrq3pipX/da
Tx5/i0X3BstrWo5RZdMhjlZnoW1IuWujZT+cswYHz4Koq15TrS7Omc+Zblt4cqsP
8dp6LtY2/D0Kcoz+zcL4O46r1F2NjE2wDSootoNr+3AvrJ++pksUgDXzNvk56dC9
EIcfobgZzdvANYuD7Jw1/TrDlyx/97WaqeQAeEI5lqmTZyRURPP5R+Wk3BiUxFT6
6Y5uK9rwcSQ8jdYqfJA8/vA7l5OCd3cJ/Ja6/qX+ZvFtt3fLQvWvN9oWGN4avUc/
MGjrjCVV+VX93yLDs+MpOViFfybi3naMQn733upNbR7mbQ5UmBINYuu8NT6McrCi
9+qbCgCmfIZQaSTGTVdYQ6KvKYUGKZ10vvbOz1g3/fLU8WzehLOLC9kY+VUKu7eN
wOMRwQb83YZ3bBv5tegn0FsBqhsJ6rIRHzACEpYUSB74yZBIgUVOoJbox8y9Y1zs
JiaKW68tPcQQo5OcAUrLNysHufTrwoyVRMpDA3Z0jb58jbwUAVvqQXiHL1ZDLTLe
TGKG8/MFzbDEn4Ggn5OXpo5n1s5WpBB1REhlFaPp/1M4w0pSY3NcGjSrOAhHEG5n
zX32dEiAr3ruE3c63cYYVX7ZxTgmZ/dO36M6ZQ80zXJHolrMV7fUcm52vvyxoppc
D2LC/DBNFlSvCWHgf/SF3wV3aAYplYkaYA8j38EU8+Ji013vQ/eLtP8j8gPWHR1S
gWlaUq/O9EZ2fBrnTsxjw1M1X689cBMSAmKenI9n0FPt8jFIoDjMntIzD2/4fpng
r7ipblV/HA/PcqJ/aHo0xfThHhR+5ZMhz250RmoW6wllJFUU5ydYIIRc/00ltqjm
39qRvaT/qF6XOkf+x6hXGhF+iYLqfKW/ZnQ7GXakKumigLIm1+G14Bt9jRZp3gl+
7DJJ4F8I2nxlpNmwKLPAwR9p1RgOgi9dE0NSqyCgzSeQs+Y1tP31sEEAZDiu1Lvf
F4eWv7j+wl95jF2sml0kRyLn4jSiw9yr0fjcpvqsC6kZWkTQjQIO2kv0g7EI/h2B
sFGhPqtocWCD7swp2s5rS50UZYmtFzNfPt+fGfh8yAgsI6odzbPtIVeETIfM1KX4
F0NdrOLMYRQCtJDqqyUQivKVJ+nietoPdvIIM43H7iMx9xVaSrAYKKYpoJ1sEzUo
elgaL3yQ5cVGVGd7zL8CyWyKu0rul4GoBy1FkenM38y0I1j7/+qytC6nGZNFjK6q
CFhBMEUIYc0PJyFADyGvNeVG7UNQ2jZBcn0hyhkf7oft9Bjf483vXut1/yeM4ciU
00NyTnmV7MlHxPPilsvJMXKb/fWrf+jchBXc/4c0Oxy6JfSiq7hJkZc9/FQktCBN
k2ugaonuAsiDf/QGZvbR7yg22rnaGaWmwPEbJ44lVwaFYBFh9V8alss9WDCojyF6
XIKb+qEqcF7vBReKCMNBZJRxD0wdUd75sXxWsuENYvDKHob24aTLdtF18Jylj8Of
ClcrEOX+0BHuWBzM3s4TIo96QLOgol1fT9w/NMYmzx/zT7/mFSh7FvsdCz0z+qyh
egfvdYMftFTiMjBtJ7tbMWcb1YBq88+C0I101iwuRwN+vIcjuKNvYUfmfHsdgCsn
1yynJdRCKjVELFEikOQJjWO82pBw1ngkRbTD7t03iIE0jtq9p2w+jR8Tz8O0IqiT
FcCb8I+DSOKde+j+CaObidPldHF3b8XPq+1pDEqfywiw5gJeiP7dxtJI6zoXxCZI
KiRPZAD2DdZ7BOBZ7vxDf9XTdVM+v8nSqct9HzpwxVoQPvuyM6ulzRgovLNCRYA3
JZ8RNitnuropHWyuNaUFFX/0GPUHtqVWL6yvJt9hKK5GgN98mT8yt4uxfl6Uf1+c
WUrCRd4iTjmpdQscxacvbk5VYB+Ez3U2Okwj1OIKNTdmMmRzOLQXErSU4GHtN01K
ZFrMQG+09d3lH+BD0ZD0AYxYPiMtdKTRi2Cl8plsqTwQSUTnRWDqFXP/1iC8VFBT
B0D3s8Lx0w8aq8eT7vg5BHSzVdhNRuL6DG+efJBNw5qGiYhDUFFbmBX7X48dNpRL
ibOaFxZThbMZZ7sTc1c6rC0X2OPejXdRIJKIKsiOYC3OAnmjcL3v9nwlot7DCSfJ
spbe/FHS/P7t7RsVPAlQhHdxZy5BZ/c0+8iEH5XUYwUx2LiBqexUtI5jOppQK/Kj
TUHO77PfclOuc6ayt3ATheJcZT8msm9TZt+8upSbXB6IRcB7ogLdaUA7dDnJCFpA
RRm/TdI5XJqat5iW8Mmi+2zDjml6wq/JFJ5g3NFB9AaR8P/0u78oluDpjbnc0suI
oMFOP8na7UWZsnZ5P29cjwI03kJvt92l3v7JsvJt2jXJCMk8KNeDL9wNvoi1MBUj
emrSAwWm2XdSd64JoRWdzytJEeUT/j+NNgArWUdiBJ6EXnsiM0PA2hfg6eVNHDD5
q1DGEgINkKlzeaUuSGCcOyHT5rQTU7+qeGUpOx57hg78zc7yikH/vTaU+lsUccg5
rqTjEI5WOZawjSY2XfqtJLuINVB6MyGr+G8L7Q5vpfyrwoN5FmDCF/C8V/67MGkY
0gfzKY51xFxADuxsAfUZtqVzi1wLfkxY/uU4Xa/ZoSdjhc0AVnok9j2OW2ZMyw36
pdiiNELVF3YxTpXCNvdkkdfxcwOxX9Y1xTI9WdiGYvTkMQDNtqkHpqzMz3Wxi23b
4vXdybgMVNto1JtZJbF9PdKLn9wmvw9QylUDLK3yeWMd35JM54/UT07SpyAdDRtI
yJYHqd0qPKtmjkotjSzjob7kk3wwUh7L/7FQcMyvrCUqUhaUs3aT/WuI/EmptK3y
69sNOQBKcLHGP7GxJqx+0XULFREBH594iDJ5na1txErwjYWYG9eEwUZZEm+gpq1s
9XQTy2PG7M96fZVb9pjGU3ftVaSN1jntgWxmEVrB7x+RaOF3wpbWqoL0o7ap6w5/
hiFBqapFB8IOrp2nBPqtzDDHTaVhId8nGmOp041K9MjTgXf3IXdsO7GNp44yK3wQ
PN/2gqTRiPBzf98BteJgHW1VZNlg1OYbqUR15WiQZpiYhsL5B2kqPDrkDMn/Z9LO
rUNoeSFst6iLT/lQjYcNFgxul98Gq0Dcui2ZABVa+GYhURSkBIyM7M80WWVJJttp
tfA6v9EHw/IjUG2+CzCBo5nTylsS3jujPgCRO0+3N6pzGa40WgES/cxO/UL3iA9P
hjz/jfui/4aD93gT+XycD+JftYXB6ijkmVhX1eizo9ztbLV5i9mH832aycF3zIg2
bjV902anw0X+doJ1cCQoZCFV8dWZwSqSyM2zclnpFSzNtBgW0hd3IXKgoZ9Noc/U
sYL0uiVDZmlkVsi8/RZwZ1SisEJ/CMyvm8vjdY6l/1crPvOC+6IR+kERnV64Q9qa
w5HHRUAMlvovsy/P2xCedZLZfYmzwXNGbrwtBwWpSzeIr+lR7Fxxa4Vp4E6s6cGP
7FoCxWiffTGuno01lgs8sc2JwCCmvOykLEsMt76qCpzIWVNXxe8LWKs/GcwNdiyi
y3N2L/LzMYzYVMeMWhBVivB5iaXXRBbo7AMpLXyBjIctuWdvmHzE9eklU0xhRyfh
v9YTIroUNmMDOSzzqksBUKaZXOg0C5CJKb/VAAG4eG/uV5ejll7jZ6HYqXQV/s3v
0ZLUnWIQvryzs7UdtMTRkvfA1HVWQoaB2H9kowZ66c6xMJEjJzV1hPGXWY6zqeUl
6Vkdr8JpKN4luBPUK3eXzVMzJPlBCnCZPJxoOCQu7H/HGSCmBpbXnw0JzWtcq+2G
Ss487YZNNqpsW151Ezu0FHErZf6HdA47VcfpjnAB67pzpBaKADYoqCmH2V1ThiWU
TSZyxcVQw7101F6W927NVJ8Jzbx7nfFAtgpkQWZJQUC73yPiSrGEZNasqAYC3bl4
V24ZZiEAI/bbY0tyLGe2/5gY5jvF8/MGFb9vvECdw2c=
`pragma protect end_protected
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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
EyXYSUnBUeYqUQsXlskeDj2QRe+g2ltGxorzK3syBgvbvlblA1FYtTt4X5dUH1Ko
JvmCD6ftOOBEydgO2Z+zBLsiVwlh6slwSRaQMNAvIsT2O7AVGl5WjqAxOdzN4XLc
fR50Drk1agCnolerxW8Z/sBYZu2nnef4ztRUVs+pftQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4663      )
3kls72ZJu5iRO3VMdAjQ4KcfD4/iFvYSkN3vvVrHpXFj5NddRUJQssAx/7W9Kww3
++Ix6lLgBVszjba9wWpFOXSJxgi/arfBd5ZKrp1V/XUQYNm0yhz66tRhMsxA15rF
RooOngaWWDDYHhpczVdRrsBIT2CN9LlHut+l9lQjiqYkWULnXDxfWXGiF8fq0Sfp
rD5RviQneC7JYDc9aENIcTV8t0Ft4YSvO3A73oaxBc7qyNfuSYzPSiQv4gIctfip
mS7IdsO/bxj9JQ0KqpGc9XxX3SibI2GOeOreT62bnuLbBvOf6ZmwqsTU1HmzSRWh
IniCnrq5VYKds3u9n5QC9B98Cs6fO3N56o4NDZIMHkKp+Ngq7PF5CJRATJC86PgZ
8aAsSQ97b2M18y3eZGWAjaL7005dpWh6/BkTfcskjlXF0vB8cLoHrPrW/wZgaL2N
76IFCRtx+qZGJXJIaNyjBCW4+gY0ewyY+itPupY4zhFk+xaVN+eWI0B1XWW0RMA/
vjDVr5ozWctZ/WuuiDeBv7Fpcn7n/710rfXeF9ld9h629ihM1KjQv/INHzwaWpHB
gYAImiz+E4/Ip/zX8wzLpQBK7EmjKSFZcvf5/LWXjZKjXVp8MwxQKb31HKPlNedP
NwZHJrwLxoD0CIg25pmyTNon9jVURM+PjEqNVrey2NW6F23drTZQO4R/kPUznTca
8ZusBlstea7p01fe+ItcrX4KXUOyK4kHA84nptORIScLHpdo2+9vFprH6DW2PLLv
5FlucDVRQWpKr/k2PpWqNJg2u1vl31QXCh5hyp1ebKhwulKopbo80w6ltNl3KxO9
lvKyPrwuht7FpOWgNWH3YMVeG+Pm1pol7p3/09dTXn6uEajq2VlVwHjSXwVESqxj
q27tpOQ0gtYtDMvOQKO2MchodVQ6CT5yCUDFozrYK/3Tmwf4nLPDr93z5FcmZQ7+
TRsmEHLV4RMZSNEahCTqK1j6yFiMFvADEQMRdM1f9gJp01QnorAhogEiB86qSflP
JNK+cf98xg/CDQ3Z9F0L9p0ayVU09X/JPBG5TPasM2nEYCHR2jGXxUNtf6f7va6a
d47Ck+l7V+uz11n9g2+WHeCTZOs37TsGFLLslrB6TwY=
`pragma protect end_protected
  endfunction

endclass

`endif
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
e/9OrJ3jBQUA8mXbfJgsQtXrOyxzSWpErwb3zmkExBUhXVijQKAtywHQJgz7y7Nx
D2oJOnH38mFAIAfFvLaa9q34aUjKaIpojwa1LKlddCNVZ0JYSLRb6Wq1zPGwBFUT
r61ocvLc5Ve52KRmyaJ/7oHcrOSfCAKa6Lr4mk3jas0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 4746      )
5oUsplZYMoWJk8YhjwCusda7WCRRK6dcAFv8OuQlX5ZvBsQPR/R3diXoMzb6VUrv
bRamiDTVLAqHQ2Z+wHPgQ9V71tXDEnRIAGc/8+mSs1EVdFJIYZ+USvuB7wYpDeoY
`pragma protect end_protected
