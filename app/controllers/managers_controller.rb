class ManagersController < ApplicationController

	def index
		@group_users = User.where(group_id: current_user.group_id)	
	end

	def show
		@group_users = User.find_by(group_id: group_id)
	end

	def new
	end

	def create
	end

	def destroy
	end
end
