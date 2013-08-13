class CatalogsController < ApplicationController
	def new
		@catalog = Catalog.new
	end

	def create
		@catalog = Catalog.new(catalog_params)
		if @catalog.save
			flash[:success] = "A new questions created successfull"
			redirect_to catalogs_path
		end

	end

	def index
		@catalogs = Catalog.all
	end



	def edit
		 @catalog = Catalog.find(params[:id])
		 if @catalog.update_attributes(catalog_params)
 			#Handle a successfill update
 			flash[:success] = "questions updated"
 			redirect_to catalogs_path	
 		else
 			render 'edit'
 		end
	end

	def destroy
	  	@catalog = Catalog.find(params[:id])
  		@catalog.destroy
  		redirect_to catalogs_path
	end

	private
		def catalog_params
			params.require(:catalog).permit(:content,:group_id)
		end



end

