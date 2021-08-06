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



20.times do
  gimei = Gimei.new

CareUser.create!(
name: gimei.name.kanji,
department: "本店",
grade: "未就学"

)
end