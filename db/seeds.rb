# coding: utf-8

User.create!(name: "加藤玲央",
  password: "password",
  password_confirmation: "password",
  admin: true)

20.times do |n|
name  = Faker::Name.name
password = "password"
User.create!(name: name,
    password: password,
    password_confirmation: password)
end