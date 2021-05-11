class CareUser < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  enum gender: {boy: 0, girl: 1}


# 利用者編集でupdateした時にストロングでカラムを配列にしているので、[""]となるのを防ぐ
# https://www.tom08.net/entry/2016/09/16/175901
# gsubメソッド⇨https://uxmilk.jp/23987 https://www.sejuku.net/blog/14685 https://www.sejuku.net/blog/60033
  before_save do
    self.use_day.gsub!(/[\[\]\"]/, "") if attribute_present?("use_day")
  end


end