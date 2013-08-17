class ManagersController < ApplicationController
	before_action :manager_user,   only: [:show,:edit, :update,:index, :sending_users_report]

	
		def index
			@group_users = User.where(group_id: current_user.group_id)
		end

		def show
			@time1=params[:time1]
			@time2=params[:time2]
			@answers = Answer.where(user_id: params[:id])
		end

		def sending_users_report
			@managers = User.where(manager_group: true)
			@managers.each do |manager|
				@users = User.where(group_id: manager.group_id)
				@users.each do |user|
					UserMailer.sending_dailyreport(manager,user).diliver
				end
			end
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

