entertainment = Publisher.create!(name: "Entertainment", label: "entertainment")
entertainment.publishers.create!(name: "Boston", label: "entertainment-boston")
entertainment.publishers.create!(name: "New York", label: "entertainment-new-york")
entertainment.publishers.create!(name: "Chicago", label: "entertainment-chicago")
entertainment_pdx = entertainment.publishers.create!(name: "Portland", label: "entertainment-pdx")

Publisher.create!(name: "OC Register", label: "oc-register")
wcax = Publisher.create!(name: "WCAX", label: "wcax")

advertiser = entertainment_pdx.advertisers.create!(name: "Hot Lips Pizza")
advertiser.deals.create!(
  proposition: "Free drinks and garlic bread with large pizza",
  value: 4,
  price: 2,
  description: "Buy one of our large cheese, peperoni or sausage pizzas and add drinks and garlic bread!",
  start_at: 1.day.ago,
  end_at: 1.week.from_now
)
advertiser.deals.create!(
  proposition: "3 large pizzas",
  value: 45,
  price: 20,
  description: "Hosting a party for the big game? Everyone loves Hot Lips Pizza!",
  start_at: 2.months.from_now,
  end_at: 3.months.from_now
)
entertainment_pdx.advertisers.create!(name: "Stumptown Coffee")
entertainment_pdx.advertisers.create!(name: "Bunk Sandwiches")
entertainment_pdx.advertisers.create!(name: "Vanilla Bicycles")

# National
entertainment.advertisers.create!(name: "Disney")

advertiser = wcax.advertisers.create!(name: "South Burlington Organics")
advertiser.deals.create!(
  proposition: "Bulk food Tuesday!",
  value: 30,
  price: 10,
  description: "Buy $30 of food form the bulk bins for only $10. Tuesdays only.",
  start_at: 1.day.ago,
  end_at: 1.week.from_now
)

index = 0
100.times do
  advertiser = wcax.advertisers.create!(name: "Vermont Business #{index}")
  advertiser.deals.create!(
    proposition: "Great Deal",
    value: 20,
    price: 5,
    description: "Buy now",
    start_at: 1.day.ago,
    end_at: 1.week.from_now
  )
  advertiser.deals.create!(
    proposition: "Great Deal",
    value: 20,
    price: 5,
    description: "Buy now",
    start_at: 2.weeks.from_now,
    end_at: 3.week.from_now
  )
  advertiser.deals.create!(
    proposition: "Great Deal",
    value: 20,
    price: 5,
    description: "Buy now",
    start_at: 4.weeks.from_now,
    end_at: 5.week.from_now
  )
  index = index + 1
end
