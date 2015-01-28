class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }
                    # uniqueness: {case_sensitive: false}       
  has_many :questions 
  has_many :answers
  #before_save { self.email = email.downcase }
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: VALID_EMAIL_REGEX },
  #                   uniqueness: { case_sensitive: false }
  # # has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/ }
end
