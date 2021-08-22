class Intermediate < ApplicationRecord
  belongs_to :user
  belongs_to :care_user

  validates :user_id, presence: true
  validates :care_user_id, presence: true

  enum indication: { "確認済": 0, "未確認": 1, "更新後未確認": 2 }

end
