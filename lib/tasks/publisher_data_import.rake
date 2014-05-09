namespace :publisher do

  namespace :import do
  end
  
  desc "Perform data import (options: IMPORT=/path/to/data_directory), MAPPER=MapperClassName"
  task :import => :environment do
    if ENV['IMPORT'].nil?
      p "IMPORT option required"
      exit 1
    end
    if ENV['MAPPER'].nil?
      Publisher.import(ENV['IMPORT'], "TestImportMap")
    else
      Publisher.import(ENV['IMPORT'], ENV['MAPPER'])
    end
  end
  
end