# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Matteo",
             email: "matteo@gmail.com",
             password:              "matteo",
             password_confirmation: "matteo",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  name = Faker::Lorem.sentence(5)
  users.each { |user| user.items.create!(name: name) }
end

Owner.create!(name:  "Example Owner",
             email: "owners@gmail.com",
             website: "owner.it",
             description: "owners di prova",
             password:              "owners",
             password_confirmation: "owners",
             activated: true,
             activated_at: Time.zone.now)


99.times do |n|
  name  = Faker::Name.name
  email = "exampleee-#{n+1}@railstutorial.org"
  website = name
  description = name
  password = "password"
  Owner.create!(name:  name,
               email: email,
               website: website,
               description: description,  
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)

end
