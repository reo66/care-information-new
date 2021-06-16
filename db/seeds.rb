# coding: utf-8

User.create!(name: "加藤玲央",
  department: "本店",
  password: "password",
  password_confirmation: "password",
  admin:true
  )

  5.times do |n|
    User.create!(name: "松田侑季",
      department: "本店",
      password: "password",
      password_confirmation: "password",)
    end
    

  

5.times do |n|
name  = Faker::Name.name
CareUser.create!(name: name,
  department: "本店",
 
  )
end

5.times do |n|
  name  = Faker::Name.name
  CareUser.create!(name: name,
    department: "上高畑",
    
    )
  end