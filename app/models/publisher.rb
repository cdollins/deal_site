require Rails.root + "lib" + "import_map"
class Publisher < ActiveRecord::Base
  
  has_many   :advertisers
  belongs_to :parent, class_name: "Publisher"
  has_many   :publishers, foreign_key: :parent_id
  validates  :name, :uniqueness => true

  validate :parent_is_another_publisher

  def parent_is_another_publisher
    if parent && parent == self
      errors.add :parent, " cannot be self"
    end
    true
  end
  
  def import(import, mapping)
    
    # Create an Import
    ssv = File.new(import)
    
    headers = mapping.header_row_parser(ssv.readline)
    ssv.each do |row|
      begin
        options = mapping.data_row_parser(row)
        advertiser = Advertiser.where(name: options[:name]).first_or_create(name: options.delete(:name), publisher: self)
        Deal.create(options.merge(advertiser: advertiser))
      rescue => e
        #Todo create errors
        p "Errror Importing row: #{row} " + e.to_s
      end
    end
    
  end
  
  def self.import(import, mapper="TestImportMap")
    mapping = mapper.constantize.new
    
    # Crate or Get a Publisher by File name
    publisher_name = mapping.publisher_name_from_file_path_parser(import)
    publisher = Publisher.where(name: publisher_name).first_or_create
    publisher.import(import, mapping)
  end
end
