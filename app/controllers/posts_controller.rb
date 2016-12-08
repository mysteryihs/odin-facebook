class PostsController < ApplicationController
	before_action :signed_in?

	def new
		@post = Post.new
	end
	
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post successfully created"
			redirect_to "/posts"
		else
			render 'new'
		end
	end

	def index
		@posts = current_user.feed
	end

	def show
		@post = Post.find_by(id: params[:id])
	end

	private
		def signed_in?
      unless user_signed_in?
        redirect_to "/users/sign_in" unless request.fullpath == '/users/sign_in'
      end
    end

    def post_params
    	params.require(:post).permit(:content)
    end
end
