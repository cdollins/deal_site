class Importer
  
  def self.import(publisher_name, import_data, mapper)
    # Crate or Get a Publisher
    publisher = Publisher.where(name: publisher_name).first_or_create
    mapper = mapper.new
    eat_header = true
    headers = ""
    import_data.each_line do |row|
      begin
        if eat_header
          headers = mapper.header_row_parser(row)
          eat_header = false
        else
          options = mapper.data_row_parser(row, headers)
          advertiser = Advertiser.where(name: options[:name]).first_or_create(name: options.delete(:name), publisher: publisher)
          Deal.create(options.merge(advertiser: advertiser))
        end
      rescue => e
        #Todo create errors
        p "Errror Importing row: #{row} " + e.to_s
      end
    end
  end
end