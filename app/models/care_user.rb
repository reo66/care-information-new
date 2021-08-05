class CareUser < ApplicationRecord
  require 'date'

  has_many :intermediates, dependent: :destroy
  has_many :users, through: :intermediates
  

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

  def self.broad_push
    require 'net/http'
    require 'uri'
    require 'json' 

    token = ENV["LINE_CHANNEL_TOKEN"]
    # post先のurl
    uri = URI.parse('https://api.line.me/v2/bot/message/broadcast')
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = true

    # Header
    headers = {
        'Authorization'=>"Bearer #{token}",
        'Content-Type' =>'application/json',
        'Accept'=>'application/json'
    }
    send_message = "確認しました"
    # Body
    params = {"messages" => [{"type" => "text", "text" => send_message}]}
    response = http.post(uri.path, params.to_json, headers)
    puts "------------------------"
    puts response.code
    puts response.body
    puts "------------------------"
end
  

end

