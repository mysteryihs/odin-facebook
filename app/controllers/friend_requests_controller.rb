class FriendRequestsController < ApplicationController
	before_action :signed_in?
	before_action :set_friend_request, except: [:index, :create]

	def create
		friend = User.find(params[:id])
		@friend_request = current_user.friend_requests.new(friend: friend)

		if @friend_request.save
			flash[:notice] = 'Added friend successfully.'
			redirect_to '/'
		else
			render json: @friend_request.errors, status: :unprocessable_entity
		end
	end

	def index
		@incoming = FriendRequest.where(friend: current_user)
		@outgoing = current_user.friend_requests
	end

	def destroy
		if params[:commit] == 'Accept'
			@friend_request.accept
		elsif params[:commit] == 'Deny'
			@friend_request.destroy
		end
		redirect_to "/friend_requests"
	end

	def update
		if params[:commit] == 'Accept'
			@friend_request.accept
		elsif params[:commit] == 'Deny'
			@friend_request.destroy
		end
		redirect_to "/friend_requests"
	end

	private

    def signed_in?
      unless user_signed_in?
        redirect_to "/users/sign_in" unless request.fullpath == '/users/sign_in'
      end
    end

		def set_friend_request
			@friend_request = FriendRequest.find(params[:id].to_i)
		end
end
