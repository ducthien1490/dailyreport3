class ManagersController < ApplicationController

	def index
		@group_users = User.where(group_id: current_user.group_id)
	end

	def show
		@time1=params[:time1]
		@time2=params[:time2]
		#@date1=DateTime.parse(@time1).strftime('%a %b %d %H:%M:%S %Z %Y')
		#@date2=DateTime.parse(@time2).strftime('%a %b %d %H:%M:%S %Z %Y')
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
