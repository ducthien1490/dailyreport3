class AnswersController < ApplicationController
	before_action :signed_in_user, only: [:index, :update,:edit, :update]
  	before_action :correct_user,   only: [:show,:edit, :update,:index]

	def index
	end

	
	def new
    	@catalogs = Catalog.where(group_id: current_user.group_id)
    	@answer =Answer.new
  	end

	def create
		catalog = Catalog.find(params[:catalog_id])
		@answer = catalog.answers.new(answer_params)
		if @answer.save
			flash[:success] = "Daily report saved"
			respond_to do |format|
      		format.html { redirect_to new_answer_path }
      		format.js
    		end
		else
			render 'new'
		end
	end

	def update
		catalog = Catalog.find(params[:catalog_id])
		@answer = answer(catalog)
		if @answer.update_atributes(answer_params)
			respond_to do |format|
      		format.html { redirect_to new_answer_path }
      		format.js
    		end
    	else 
    		render 'new'
    	end	

	end	



	def destroy
	end


	private
		def answer_params
			params.require(:answer).permit(:user_id,:content)
		end
end	



