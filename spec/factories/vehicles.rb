FactoryBot.define do
  factory :vehicle do
    make { 'Jeep' }
    model { 'Grand Cherokee' }
    year { '2020' }
    location { 'Los Angeles' }
    condition { 'Used' }
    mileage { 12890 }
    initial_price { 29999 }
  end
end