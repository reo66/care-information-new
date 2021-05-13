class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  $days_of_the_week = %w{月 火 水 木 金 土 日 祝 長期休み }

  # before_action :set_search
  # #中省略
  #   def set_search
  # #以下は検索に使うときの記述（変数やモデル名は変更してもいいですが
  # #".ransack(params[:q])"はそのままで使用します。）
  #     @search = CareUser.ransack(params[:q])
  
  # #以下は検索したものを表示する時に使う記述(一番シンプルで基本の形です)
  # @results = @c.result
  #   end
end
