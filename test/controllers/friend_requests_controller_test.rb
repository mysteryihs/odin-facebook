require 'test_helper'

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
	def setup
		@user = User.create(email: 'user1@user.com', password: 'abc123')
		@other_user = User.create(email: 'user2@user.com', password: 'abc123')
	end

	test "should send friend request" do
	end

	test "should accept friend request" do
	end

	test "should deny friend request" do
	end
end
