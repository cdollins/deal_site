namespace :publisher do

  namespace :import do
  end
  
  desc "Perform data import (options: IMPORT=/path/to/import_file, MAPPING=/path/to/mapping_file)"
  task :import => :environment do
    Publisher.import(ENV['IMPORT'], ENV['MAPPING'])
  end
  
end