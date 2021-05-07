class CareUser < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  enum gender: {boy: 0, girl: 1}

  
  


end