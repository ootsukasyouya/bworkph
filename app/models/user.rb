class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :addres, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { maximum: 20 }
  validates :status, presence: true
  validates :age, presence: true, length: { maximum: 5 }
  before_validation { email.downcase! }
  has_secure_password
  enum status:{会社員:0, 主婦:1, フリーター:2, 高校生:3, 無職:4, 大学生:5, 外国人:6, 店舗:7}
end
