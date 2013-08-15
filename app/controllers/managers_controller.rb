class ManagersController < ApplicationController

	def index
		@group_users = User.where(group_id: current_user.group_id)
	end

	def show
		@answers = Answer.where(user_id: params[:id])	
	end

	def new
	end

	def report
	end

	def create
	end

	def destroy
	end
end
