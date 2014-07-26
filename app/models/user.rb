class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :authentications
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end
  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'],:uid => omniauth['uid'],
                          :oauth_token => omniauth['credentials']['token'],
                          :oauth_secret => omniauth['credentials']['secret'])
    self.name = omniauth.info.name
    self.username = omniauth.info.nickname if omniauth['provider'] == 'twitter'
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
