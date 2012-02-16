entertainment = Publisher.create!(name: "Entertainment", label: "entertainment")
entertainment.publishers.create!(name: "Boston", label: "entertainment-boston")
entertainment.publishers.create!(name: "New York", label: "entertainment-new-york")
entertainment.publishers.create!(name: "Chicago", label: "entertainment-chicago")

Publisher.create!(name: "OC Register", label: "oc-register")
Publisher.create!(name: "WCAX", label: "wcax")
