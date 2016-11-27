class Post < ApplicationRecord
	belongs_to :users, optional: true
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	default_scope -> { order(created_at: :desc) }
end
