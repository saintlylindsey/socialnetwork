class CommentsController < ApplicationController

	before_action :set_post

	def index
		@comments=Comment.all
	end 

	def create
		@comment=@post.comments.build(comment_params)
		if @comment.save
			@post.comment_time=@comment.created_at
			@post.save
			redirect_to post_path(@post)
		else 
			render :action => "new"
		end
	end

	def set_post
	 	@post = Post.find(params[:post_id])
	end

	protected 

	def comment_params
		params.require(:comment).permit(:body)
	end

end
