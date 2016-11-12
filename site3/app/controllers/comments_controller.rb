class CommentsController < ApplicationController

	before_action :set_post

	def index
		@comments=Comment.all
	end 

	def create
		@comment=@post.comments.build(comment_params)
		@comment.user=current_user
		if @comment.save
			@post.comment_time=@comment.created_at
			@post.save
			redirect_to post_path(@post)
		else 
			redirect_to post_path(@post)
		end
	end

	def destroy
		@comment=@post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	protected 

	def set_post
	 	@post = Post.find(params[:post_id])
	end


	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end

end
