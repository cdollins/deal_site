class Import < ActiveRecord::Base
  belongs_to :publisher
  has_many :import_errors
  
  def import(import_data)
    mapper = import_map.new
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
        ImportError.create(data: row, error: e.to_s, import: self)
        p "Errror Importing row: #{row} " + e.to_s
      end
    end
  end
  
  def self.import(publisher_name, import_data, mapper)
    # Crate or Get a Publisher
    publisher = Publisher.where(name: publisher_name).first_or_create
    importer = Import.create(import_map: mapper, publisher: publisher)
    importer.import(import_data)
  end
end