class PostsController < ApplicationController

	before_action :authenticate_user!

	def index

		if params[:cat]
			@category = Cat.find_by_name(params[:cat])
			@posts = @category.posts
		else
			@posts = Post.all
		end

		if params[:order]
			sort_by = "#{params[:order]}"
		else
			sort_by = "created_at"	
		end

		@posts=@posts.order("#{sort_by} DESC")

		@posts=@posts.page(params[:page]).per(5)

	end

	def show
		@post=Post.find(params[:id])
		@comment=Comment.new
		@comments=@post.comments
		@cat=Cat.new
		@cats=Cat.all
	end 

	def new
		@post=Post.new
	end

	def create
		@post=Post.new(post_params)
		@post.save
		redirect_to posts_path
	end

	def edit 
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		@post.update(post_params)
		redirect_to(posts_path)
	end

	def dashboard
	end 

	protected 

	def post_params
		params.require(:post).permit(:title, :body, :comment_id, :cat_ids => [])
	end 

end