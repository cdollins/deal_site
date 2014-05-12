namespace :publisher do
  
  desc "Perform data import (options: PUBLISHER=name IMPORT=/path/to/data_directory)"
  task :import => :environment do
		raise ArgumentError, 'You must specify a valid file path to the import data.' unless File.exists?(ENV['IMPORT'])
		raise ArgumentError, 'Please specify the publisher name.' unless ENV['PUBLISHER']
    
    Import.import(ENV['PUBLISHER'], File.new(ENV['IMPORT']))
  end
  
end