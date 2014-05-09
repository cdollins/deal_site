class PmImportMap < ImportMap
  
  protected
  
  def header_transforms
    #Publisher  Start  finish  Name  cost margin
    @header_transform = {
      "Publisher" => :name,
      "Start" => :start_at,
      "finish" => :end_at,
      "Name" => :description,
      "cost" => :price,
      "margin" => :value
    }
  end
  
  def publisher_name_from_file_path_regex
    /^\d_(.+)/
  end
    
  def header_parse_regex
    /(.+),(.+),(.+),(.+),(.+),(.+)/
  end
  
  def field_parse_regex
    /(.+),(.+),(.+),(.+),(.+),(.+)/
  end

end