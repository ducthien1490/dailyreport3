class AnswersController < ApplicationController
	before_action :signed_in_user, only: [:index, :create,:edit,:update, :new]
  	before_action :correct_user,   only: [:show,:edit,:update,:index, :create]
 
	def index
	end

	
	def new
    	@catalogs = Catalog.where(group_id: current_user.group_id)
    	@answer =Answer.new
  	end

	def create
		 
		catalog = Catalog.find(params[:catalog_id])
		if answer?(catalog)
			@answer = answer(catalog)
			if @answer.update_attributes(answer_params)
				render :nothing => true
    		end	
    	else	
			@answer = catalog.answers.new(answer_params)
			if @answer.save
				render :nothing => true
			end
		end
	end



	def destroy
	end


	private
		def answer_params
			params.permit(:user_id,:content)
		end

		def signed_in_user
      		redirect_to signin_url, notice: "Please sign in." unless signed_in?
    	end

		def correct_user 
   		   @user = User.find(params[:user_id])
      		if !current_user?(@user) && !current_user.admin?
        	redirect_to(root_url)  
      		end
      		#users hien tai khong duoc edit profile cua user khac
    	end
end		



