class Import < ActiveRecord::Base
  belongs_to :publisher
  has_many :import_errors
  has_many :issues
  
  after_initialize :init

  def import(import_data)
    eat_header = true
    headers = ""
    import_data.each_line do |row|
      begin
        if eat_header
          headers = header_row_parser(row)
          eat_header = false
        else
          options = data_row_parser(row, headers)
          advertiser = Advertiser.where(name: options[:name]).first_or_create(name: options.delete(:name), publisher: publisher)
          deal = Deal.new(options.merge(advertiser: advertiser))
          deal.save(validate: false)
          if !deal.valid?
            Issue.create(deal: deal, publisher: publisher, import: self, message: deal.errors.full_messages.join(", "))
          end
        end
      rescue => e
        ImportError.create(data: row, error: e.to_s, import: self)
        logger.error "Errror Importing row: #{row} " + e.to_s
      end
    end
  end
  
  def self.import(publisher_name, import_data)
    # Crate or Get a Publisher
    publisher = Publisher.where(name: publisher_name).first_or_create
    importer = Import.create(publisher: publisher)
    importer.import(import_data)
  end
  
  def init
    self.field_transforms =
    "{
      name: ->(x) {x},
      start_at: ->(x) {x},
      end_at: ->(x) {x},
      description: ->(x) {x},
      price: ->(x) {x},
      value: ->(x) {x}
    }"
  
    self.header_transforms = 
    {
      "Merchant" => :name,
      "Date" => :start_at,
      "Ends" => :end_at,
      "Deal" => :description,
      "Price" => :price,
      "Value" => :value
    }
    self.header_parse_regex = /\s+/
    self.field_parse_regex = /(.+)\s(\d+\/\d+\/\d+)\s+(\d+\/\d+\/\d+)\s+(.+)\s+(\d+)\s+(\d+)/
  end
  
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
    e_field_transforms = eval field_transforms
    e_field_transforms[header_transforms[key]]
  end
  
end