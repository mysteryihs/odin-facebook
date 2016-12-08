class CommentsController < ApplicationController
	before_action :signed_in?

	def new
		@post = Post.find_by(id: params[:post_id])
		@comment = Comment.new
	end

	def create
		@post = Post.find_by(id: params[:post_id])
		@comment = Comment.new(comment_params)
		if @comment.save
			current_user.comments << @comment
			@post.comments << @comment
			flash[:success] = "Post created successfully"
			redirect_to @post
		else
			render 'new'
		end
	end


	private
		def signed_in?
      unless user_signed_in?
        redirect_to "/users/sign_in" unless request.fullpath == '/users/sign_in'
      end
    end

    def comment_params
    	params.require(:comment).permit(:content)
    end
end
