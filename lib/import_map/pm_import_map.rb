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
    
    
  def field_transforms
    {
      name: ->(x) {x},
      start_at: ->(x) { Date.strptime(x, "%m-%d-%Y") },
      end_at: ->(x) { Date.strptime(x, "%m-%d-%Y") },
      description: ->(x) {x},
      price: ->(x) {x},
      value: ->(x) {x}
    }
  end
    
  def header_parse_regex
    /,/
  end
  
  def field_parse_regex
    /(.+),(.+),(.+),(.+),(.+),(.+)/
  end

end