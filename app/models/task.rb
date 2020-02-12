class Task < ApplicationRecord
  
  #バリデーション(ステータスとコンテント)
  validates :status, presence: true, length: {maximum: 10}
  #validates :content, presence: true, length: {maximum: 255}

  #user との関係
  belongs_to :user

end
