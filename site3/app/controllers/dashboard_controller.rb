class DashboardController < ApplicationController

	def index
		@usercount=User.count
		@postcount=Post.count
	end

end
