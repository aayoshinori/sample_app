class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }	#小文字に変換して一意性を保証
  #before_save {email.downcase!}
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, length: { minimum: 6 }
end
