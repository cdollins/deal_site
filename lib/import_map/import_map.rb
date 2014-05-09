class ImportMap
  
  def initialize
    header_transforms
  end
  
  def publisher_name_from_file_path_parser(import_path)
    import_file = Pathname.new(import_path)
    import_file.basename.to_s =~ publisher_name_from_file_path_regex
    $1.split("_").map(&:capitalize).join(" ")
  end
  
  def header_row_parser(header_string)
    @headers = header_string.chomp.match(header_parse_regex).captures
  end
  
  def data_row_parser(row_string)
    row = row_string.match(field_parse_regex).captures
        p @headers
    hsh = Hash[@headers.zip(row)]
    Hash[hsh.map {|k, v| [@header_transform[k], v.strip] }]
  end
  
  protected
  
  def header_transforms
    raise NotImplementedError
  end
  
  def header_parse_regex
    raise NotImplementedError
  end
  
  def field_parse_regex
    raise NotImplementedError
  end
  
  def publisher_name_from_file_path_regex
    raise NotImplementedError
  end
  
end