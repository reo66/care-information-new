class Intermediate < ApplicationRecord
  belongs_to :user
  belongs_to :care_user

  validates :user_id, presence: true
  validates :care_user_id, presence: true

end
