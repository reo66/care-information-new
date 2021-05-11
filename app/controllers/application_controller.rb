class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  $days_of_the_week = %w{月 火 水 木 金 土 日 祝 長期休み }
end
