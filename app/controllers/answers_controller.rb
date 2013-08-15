class AnswersController < ApplicationController

	def index
	end

	def new
		@answer = Answer.new
	end
	def create
		binding.pry
		@answer = Answer.new(answer_params)
		if@answer.save
			flash[:success]= "Daily report saved!"
			redirect_to root_url
		else
			render 'new'
		end

	end

	def destroy
	end


	private
		def answer_params
			params.require(:answer).permit(:content)
		end
end	



