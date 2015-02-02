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
            presence: {message: "cannot be blank"}, 
            uniqueness: {case_sensitive: false, message: "already in use"},
            length: {maximum: 255, message: "must be less than 255 characters"}, 
            format: { with: VALID_EMAIL_REGEX, message: "requires valid alphanumerics" }
            
  validates :password, 
            presence: {message: "cannot be blank"}, 
            format: { with: /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/, message: "must contain letters and numbers" }
     
  before_save { self.email = email.downcase }
  # validates :email, presence: true, length: { maximum: 255 },
  #                  format: { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }
  
end
