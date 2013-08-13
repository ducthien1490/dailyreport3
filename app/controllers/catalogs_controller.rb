class CatalogsController < ApplicationController
	def new
		@catalog = Catalog.new
	end

	def create
		@catalog = Catalog.new(catalog_params)
		if @catalog.save
			flash[:success] = "A new questions created successfull"
			redirect_to catalogs_path
		else 
			render 'new'
		end

	end

	def index
		@catalogs = Catalog.all
	end

	def edit
	end

	def destroy
	  	@catalog = Catalog.find(params[:id])
  		@catalog.destroy
  		flash[:success] = "Question deleted!"
  		redirect_to catalogs_url
	end

	private
		def catalog_params
			params.require(:catalog).permit(:content,:group_id)
		end



end

