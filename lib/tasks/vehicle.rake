namespace :vehicle do
  desc "Depreciate car price"
  task depreciate_price: :environment do
    Vehicle.all.each do |vehicle|
      vehicle.depreciate
    end
  end
end
