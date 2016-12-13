class User < ApplicationRecord
	has_many :friend_requests, dependent: :destroy
	has_many :pending_friends, through: :friend_requests, source: :friend
	has_many :friendships, dependent: :destroy
	has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  def remove_friend(friend)
  	current_user.friends.destroy(friend)
  end

  def feed
    Post.where("user_id IN (?) OR user_id = ?", friend_ids, id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
