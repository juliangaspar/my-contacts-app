require 'faker'

puts 'Cleaning the db 🧹'
User.destroy_all

puts 'Seeding db 🌱'

5.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    user_picture: Faker::Avatar.image,
    password: "123456"
  )
  9.times do
    Contact.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      contact_email: Faker::Internet.unique.email,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.full_address,
      profile_picture: Faker::Avatar.image,
      user_id: user.id
  )
  end
  puts "User with id: #{user.id} has been created with 5 contacts 🤓"
end

puts 'Finished ✅'
