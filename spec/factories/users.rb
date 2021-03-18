FactoryBot.define do
  factory :user do
    email { 'manager@test.com' }
    password { 'password' }
    admin { false }

    factory :admin do
      admin { true }
      email { 'admin@admin.com' }
    end
  end
end
