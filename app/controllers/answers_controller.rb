class AnswersController < ApplicationController

	def index
	end

	def new
		@answer = Answer.new
	end

	def create
		@answer = current_user.answer.build(answer_params)
		if @answer.save
			#somthing to do
		else
			render 'new'
		end

	end

	def destroy
	end
end
