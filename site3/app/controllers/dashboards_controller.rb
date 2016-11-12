class DashboardsController < ApplicationController

	def show
		@usercount=User.count(:all)
		@postcount=Post.count(:all)
		@commentcount=Comment.count(:all)
	end

end
