# coding: utf-8

User.create!(name: "加藤",
  department: "本店",
  password: "password",
  password_confirmation: "password",
  admin:true
  )

5.times do |n|
User.create!(name: "松田",
department: "本店",
password: "password",
password_confirmation: "password",)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "本店",
grade: "未就学"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "本店",
grade: "年少"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "本店",
grade: "年中"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "本店",
grade: "年長"

)
end


2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "本店",
grade: "小１"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "本店",
grade: "小2"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "本店",
grade: "小3"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "小4"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "小5"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "小6"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "中１"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "中2"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "中3"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "高１"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "高２"

)
end

2.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
department: "上高畑",
grade: "高3"

)
end