class GroupsController < ApplicationController
	before_action :signed_in_user, only: [:index, :update,:edit, :update]
  	before_action :admin_user,   only: [:index,:show,:edit, :update]
	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			flash[:success] = "A new group have just added"
			redirect_to groups_path
		else
			render 'new'
		end
	end

	def index
		@groups = Group.all
	end

	def edit
		@group = Group.find_by(id: params[:id])
	end

	def update
		#binding.pry
		@group = Group.find(params[:id])
		if @group.update_attributes(group_params)
 			#Handle a successfill update
 			flash[:success] = "Group updated"
 			redirect_to groups_path
 		else
 			render 'edit'
 		end
	end

	def destroy
		@group = Group.find(params[:id])
  		@group.destroy
  		redirect_to groups_path
	end

	private
	def admin_user
       redirect_to(root_url)unless current_user.admin?
    	end
		def group_params
			#binding.pry
			params.fetch(:group, {}).permit(:name)
		end

		def admin_user
       		redirect_to(root_url)unless current_user.admin?
    	end
end

