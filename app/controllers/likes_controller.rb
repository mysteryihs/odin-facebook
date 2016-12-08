class LikesController < ApplicationController
	before_action :signed_in?

	def create
		@like = Like.new(user_id: params[:user_id], post_id: params[:post_id])
		if @like.save
			flash[:success] = "Liked successfully"
			redirect_to "/posts"
		else
			raise
		end
	end

	private
		def signed_in?
      unless user_signed_in?
        redirect_to "/users/sign_in" unless request.fullpath == '/users/sign_in'
      end
    end

    def like_params
    	params.require(:like).permit(:post_id, :user_id)
    end
end
