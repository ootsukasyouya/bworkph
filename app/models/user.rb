class User < ApplicationRecord
  has_many :send_messages,foreign_key: "sender_id",class_name:'Conversation', dependent: :destroy
  has_many :recipient_messages,foreign_key: 'recipient_id',class_name:'Conversation', dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_many :favorite_stores, through: :favorites, source: :store
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
     format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :status, presence: true
  before_validation { email.downcase! }
  has_secure_password
  enum status:{店舗:0, 求職者:1}

  def check_admin_user_exist
    if User.where(admin: true).count <= 1 && self.admin == true
      throw(:abort)
    end
  end

  def check_admin_update_exist
    if User.where(admin: true).count == 1 && self.admin == false
      throw(:abort)
    end
  end
end
