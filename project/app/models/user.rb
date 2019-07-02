class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable , :trackable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :comment
  has_many :follow
  has_many :innapropiate
  has_many :post
  has_many :vote
  has_one :profile



  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  def self.searchUser(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("name LIKE ?", "%#{search}%")
  end


  # validates :name, presence: true , format: { with: /\A[a-zA-Z]+\z/}
  # validates :password, presence: true
  # validates :email, presence: true , format: { with: URI::MailTo::EMAIL_REGEXP }
end
