namespace :publisher do
  
  desc "Perform data import (options: PUBLISHER=name IMPORT=/path/to/data_directory), MAPPER=MapperClassName"
  task :import => :environment do
		raise ArgumentError, 'You must specify a valid file path to the import data.' unless File.exists?(ENV['IMPORT'])
		raise ArgumentError, 'Please specify the publisher name.' unless ENV['PUBLISHER']

    if ENV['MAPPER'].nil?
      mapper = TestImportMap.name
    else
      mapper = ENV['MAPPER']
    end
    
    Import.import(ENV['PUBLISHER'], File.new(ENV['IMPORT']), mapper)
  end
  
end