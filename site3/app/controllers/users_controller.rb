class UsersController < ApplicationController

	def show
	end

	def edit 
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			flash[:notice]="Profile was successfully updated"
			redirect_to posts_path
		else 
			flash[:notice]="Updates were not saved. Please retry."
			render :action => :new
		end	
	end

	protected 

	def user_params
		params.require(:user).permit(:name, :aboutyou, :birthday)
	end 

end
