class TestImportMap < ImportMap
  
  protected
  
  def header_transforms
    {
      "Merchant" => :name,
      "Date" => :start_at,
      "Ends" => :end_at,
      "Deal" => :description,
      "Price" => :price,
      "Value" => :value
    }
  end
    
  def header_parse_regex
    /\s+/
  end
  
  def field_parse_regex
    /(.+)\s(\d+\/\d+\/\d+)\s+(\d+\/\d+\/\d+)\s+(.+)\s+(\d+)\s+(\d+)/
  end

end