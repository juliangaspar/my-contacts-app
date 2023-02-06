# Models factories using FactoryBot

# Factory for User
FactoryBot.define do
  factory :user do
    first_name { "User" }
    last_name { "Test" }
    sequence(:email) { |n| "user-#{n.to_s.rjust(3, '0')}@test.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end

# Factory for Contact
FactoryBot.define do
  factory :contact do
    first_name { "Contact" }
    last_name { "Test" }
    sequence(:contact_email) { |n| "contact-#{n.to_s.rjust(3, '0')}@test.com" }
    phone_number { "123456789" }
  end
end
