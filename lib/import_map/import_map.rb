class ImportMap
  
  def header_row_parser(header_string)
    header_string.strip.split(header_parse_regex)
  end
  
  def data_row_parser(row_string, headers)
    row = row_string.match(field_parse_regex).captures
    hsh = Hash[headers.zip(row)]
    Hash[hsh.map {|k, v| [header_transforms[k], get_transform(k).call(v.strip)] }]
  end
  
  protected
  
  def get_transform(key)
    field_transforms[header_transforms[key]]
  end
  
  #default noop transforms  
  def field_transforms
    {
      name: ->(x) {x},
      start_at: ->(x) {x},
      end_at: ->(x) {x},
      description: ->(x) {x},
      price: ->(x) {x},
      value: ->(x) {x}
    }
  end
  
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