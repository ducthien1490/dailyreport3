class ManagersController < ApplicationController
	before_action :manager_user,   only: [:show,:edit, :update,:index]

	
		def index
			@group_users = User.where(group_id: current_user.group_id)
		end

		def show
			@time1=params[:time1]
			@time2=params[:time2]
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
	private
		def manager_user
       		redirect_to(root_url)unless current_user.manager_group?
    	end

end

