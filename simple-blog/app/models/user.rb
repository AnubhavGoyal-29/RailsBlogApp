class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: %i[github google_oauth2]

  has_many :post , dependent:  :delete_all
  has_many :comment , dependent: :delete_all
  has_one_attached :avatar


  def self.from_omniauth(auth)
    puts "from user model"
    user = User.find_by(email: auth.info.email)
    if user
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.save
      puts auth
    else
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = "from_google_auth"
        user.name = auth.info.name
        puts auth
      end
    end

    user
  end
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    params.delete(:email)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
