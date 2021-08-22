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



# 10.times do|n|
#   name  = Faker::Name.name
# CareUser.create!(
# name: name,
# department: "本店",
# grade: "未就学",
# intermediate_attributes: [

#   user_id: User.all,
#   care_user_id: care_user.id,
#   indication: 0
#     ] 
#   )
end

