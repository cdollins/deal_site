FactoryGirl.define do
  factory :advertiser do
    sequence(:name) { |n| "Advertiser #{n}" }
    publisher
  end

  factory :publisher do
    sequence(:name) { |n| "Publisher #{n}" }
  end
end
