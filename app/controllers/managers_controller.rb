class ManagersController < ApplicationController
	before_action :manager_user,   only: [:show,:edit, :update,:index, :export]

	
		def index
			@group_users = User.where(group_id: current_user.group_id)
		end

		def show
			@time1=params[:time1]
			@time2=params[:time2]
			@answers = Answer.where(user_id: params[:id])
			ManagerMailer.sending_users_report

		end
		def export
			@user_id = params[:user_id]
			@answers = Answer.where(user_id: @user_id)
			@time1=params[:time1]
			@time2=params[:time2]
			#binding.pry
			filename = ["[",@time1,"]","[",@time2,"]",User.find_by(id: @user_id).name,".xls"].join(" ")
			respond_to do |format|
				format.html
				format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" }
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

