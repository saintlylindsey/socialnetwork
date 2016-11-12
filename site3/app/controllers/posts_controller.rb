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
		@post.user=current_user
		if @post.save
			flash[:notice]="Post was successfully created"
			redirect_to posts_path
		else 
			flash[:notice]="Post was not saved. Please retry."
			render :action => :new
		end
	end

	def edit 
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice]="Post was successfully updated"
			redirect_to posts_path
		else 
			flash[:notice]="Post was not saved. Please retry."
			render :action => :new	
		end
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to(posts_path)
	end

	protected 

	def post_params
		params.require(:post).permit(:title, :body, :comment_id, :cat_ids, :user_id => [])
	end 

end
