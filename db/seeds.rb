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
  18.times do
    Contact.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      contact_email: Faker::Internet.unique.email,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.street_address,
      job_title: Faker::Job.title,
      company: "FactorialHR",
      profile_picture: "https://media.licdn.com/dms/image/C4E0BAQGufA924UNBfQ/company-logo_200_200/0/1634495502289?e=1683158400&v=beta&t=51Me7YH_wU8sQOyYQO7zXh-t0aOFZ0RSkYG7AVsLnPY",
      user_id: user.id
    )
  end
  puts "User with id: #{user.id} has been created with 18 contacts 🤓"
end

puts 'Finished ✅'
