class User < ApplicationRecord
 # attr_accessor :remember_token, :activation_token



  before_save :email_downcase

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false, scope: :provider }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :mobile, presence: true, length: { minimum: 10 }, uniqueness: true
  validates :uid, presence: true, uniqueness: true
  has_many :properties, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def authenticated?(attribute, token)
      digest = send("#{attribute}_digest")
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
    end


  def self.sign_in_from_omniauth(auth)
  		User.find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  	end

  	def self.create_user_from_omniauth(auth)
     u = User.new
     u.provider = auth['provider']
     u.uid = auth['uid']
     u.name = auth['info']['name']
     u.email = auth['info']['email']
      u.save(validate: false)
      return u
  end

  def email_downcase
    if email
   self.email = email.downcase
 end
 end

end
