class Post < ApplicationRecord
	belongs_to :user, optional: true
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	default_scope -> { order(created_at: :desc) }

	def already_liked?(id)
		self.likes.each do |like|
			if like.user_id == id
				return true
			end
		end
		false
	end
end
