class CareUser < ApplicationRecord
  require 'date'

  has_many :intermediates, dependent: :destroy
  has_many :users, through: :intermediates

  # accepts_nested_attributes_for :intermediates
  

  mount_uploader :image, ImageUploader
  include JpPrefecture
  
  enum gender: {boy: 0, girl: 1}

  enum grade:  {"未就学" => 0, "年少" => 1, "年中" => 2, "年長" => 3,  "小1" => 4, "小2" => 5, "小3" => 6, "小4" => 7, "小5" => 8, "小6" => 9, 
                "中1" => 10, "中2" => 11, "中3" => 12,"高1" => 13, "高2" => 14, "高3" => 15}


# 利用者編集でupdateした時にストロングでカラムを配列にしているので、[""]となるのを防ぐ
# https://www.tom08.net/entry/2016/09/16/175901
# gsubメソッド⇨https://uxmilk.jp/23987 https://www.sejuku.net/blog/14685 https://www.sejuku.net/blog/60033
  before_save do
    self.use_day.gsub!(/[\[\]\"]/, "") if attribute_present?("use_day")
  end
  validates :name, presence: true, length: { maximum: 50 }
  validates :department, presence: true

  def self.broad_push(send_message)
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
    
    

    # Body
    params = {"messages" => [{"type" => "text", "text" => send_message}]}
    response = http.post(uri.path, params.to_json, headers)
    puts "------------------------"
    puts response.code
    puts response.body
    puts "------------------------"
end
  

end

