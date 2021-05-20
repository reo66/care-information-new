class CareUser < ApplicationRecord

  has_many :users, through: :Intermediates
  has_many :Intermediates
  
  mount_uploader :image, ImageUploader
  include JpPrefecture
  
  enum gender: {boy: 0, girl: 1}


# 利用者編集でupdateした時にストロングでカラムを配列にしているので、[""]となるのを防ぐ
# https://www.tom08.net/entry/2016/09/16/175901
# gsubメソッド⇨https://uxmilk.jp/23987 https://www.sejuku.net/blog/14685 https://www.sejuku.net/blog/60033
  before_save do
    self.use_day.gsub!(/[\[\]\"]/, "") if attribute_present?("use_day")
  end
  validates :name, presence: true, length: { maximum: 50 }
  validates :department, presence: true
end

