class PmImportMap < ImportMap
  
  protected
  
  def header_transforms
    {
      "Publisher" => :name,
      "Start" => :start_at,
      "finish" => :end_at,
      "Name" => :description,
      "cost" => :price,
      "margin" => :value
    }
  end
    
  def header_parse_regex
    /,/
  end
  
  def field_parse_regex
    /(.+),(.+),(.+),(.+),(.+),(.+)/
  end

end