class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :questions 
  has_many :answers
  # has_secure_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable

  validates :email, 
            presence: true, 
            uniqueness: {case_sensitive: false},
            length: {maximum: 255}, 
            format: { with: VALID_EMAIL_REGEX }
            
  validates :password, 
            presence: true, 
            format: { with: /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/ }
     
  before_save { self.email = email.downcase }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
end
