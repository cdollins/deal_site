namespace :database do

  namespace :performance do
    desc "Create data for performance testing"
    task :create => :environment do
      stuff = %w{Burgers Pizza Bananas Trip Car Apartment Clothes}

      publisher = Publisher.create(name: "Time Magazine")
 
      advertisers = (1..10).map do |x|
        Advertiser.create(name: "test#{x}", publisher: publisher)
      end

      10000.times do |x|
       Deal.create(advertiser: advertisers[rand(advertisers.size)], value: (rand 100)/100.0 + rand(100), price: (rand 100)/100.0 + rand(100), description: stuff[rand(stuff.size)], start_at: Time.now, end_at: Time.now + rand(14).days)
      end
    end
    
    desc "Cleanup data in a performance database"
    task :cleanup => :environment do
      ActiveRecord::Base.connection.execute("TRUNCATE deals")
      ActiveRecord::Base.connection.execute("TRUNCATE advertisers")
      ActiveRecord::Base.connection.execute("TRUNCATE publishers")
    end
    
  end  
end