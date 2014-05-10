require 'test_helper'

class ImportServiceTest < ActiveSupport::TestCase

PUBLISHER_NAME = 'Daily Planet'

TESTFILE = <<END
Merchant  Date  Ends  Deal  Price Value 
Burger King 10/2/2011 10/4/2011 Your way  25  50
McDonalds 10/5/2011   Not really food 22  44
Arbys 10/8/2011 10/10/2011  More burgers  7 14
END

PUBLISHER_NAME_2 = 'Daily Planet II'

TESTFILE_2 = <<END
Publisher,Start,finish,Name,cost,margin
Burger King,10-2-2011,10-4-2011,Your way,25.91,50.92
McDonalds,10-5-2011,Not really food,22.00,44.98
Arbys,10-8-2011,10-10-2011,More burgers,7.01,14.99
END

  def setup
    
  end

  test "publisher has correct name" do
    Importer.import(PUBLISHER_NAME, TESTFILE, TestImportMap)
    publisher = Publisher.first
    assert_equal PUBLISHER_NAME, publisher.name
  end

  test "import process imports all records" do
    Importer.import(PUBLISHER_NAME, TESTFILE, TestImportMap)
    assert_equal 1, Publisher.all.count
    assert_equal 2, Advertiser.all.count
    assert_equal 2, Deal.all.count
    assert_equal 10, Deal.all.first.start_at.month 
    assert_equal 2, Deal.all.first.start_at.day
    assert_equal 2011, Deal.all.first.start_at.year
  end
  
  
  test "publisher 2 has correct name" do
    Importer.import(PUBLISHER_NAME_2, TESTFILE_2, PmImportMap)
    publisher = Publisher.first
    assert_equal PUBLISHER_NAME_2, publisher.name
  end

  test "import process imports all records for different import map" do
    Importer.import(PUBLISHER_NAME_2, TESTFILE_2, PmImportMap)
    assert_equal 1, Publisher.all.count
    assert_equal 2, Advertiser.all.count
    assert_equal 2, Deal.all.count
    assert_equal 10, Deal.all.first.start_at.month 
    assert_equal 2, Deal.all.first.start_at.day 
    assert_equal 2011, Deal.all.first.start_at.year
  end
  

  #test "end_date should be 2 days after start_date if end_date is nil" do
  #  advertiser = Advertiser.where(name: 'McDonalds').first
  #  deal = advertiser.deals.first
  #  assert_equal deal.end_at.to_date - deal.start_at.to_date, 2
  #end

end