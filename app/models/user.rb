class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 50}

  def self.find_for_oauth(auth)
   user = User.where(uid: auth.uid, provider: auth.provider).first

   unless user
     user = User.create(
       fullname: auth.info.name,
       provider:  auth.provider,
       uid:      auth.uid,
       provider: auth.provider,
       image:    auth.info.image,
       email:    auth.info.email,
       password: Devise.friendly_token[0, 20]
     )
   end

   user
 end


end
