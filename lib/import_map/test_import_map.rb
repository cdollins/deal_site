class TestImportMap < ImportMap
  
  protected
  
  def header_transforms:
    {
      "Merchant" => :name,
      "Date" => :start_at,
      "Ends" => :end_at,
      "Deal" => :description,
      "Price" => :price,
      "Value" => :value
    }
  end
  
  def field_transforms:
    '{
      name: ->(x) {x},
      start_at: ->(x) { Date.strptime(x, "%m/%d/%Y") },
      end_at: ->(x) { Date.strptime(x, "%m/%d/%Y") },
      description: ->(x) {x},
      price: ->(x) {x},
      value: ->(x) {x}
    }'
  end
      
  def header_parse_regex
    /\s+/
  end
  
  def field_parse_regex
    /(.+)\s(\d+\/\d+\/\d+)\s+(\d+\/\d+\/\d+)\s+(.+)\s+(\d+)\s+(\d+)/
  end

end