class MypostsController < ApplicationController

	def show
		@posts=current_user.posts
		@comments=current_user.comments
	end

end
