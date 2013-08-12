class UsersController < ApplicationController
	

  def new
  	@password = SecureRandom.hex(10)
  	@user = User.new
  end

  def show
  	@users = User.paginate(page: params[:page])
  end

  def create
	@user= User.new(save_params)
  	if @user.save
  		flash[:success] = "Acount created.Wait for adminstration aproval!"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find_by(id: params[:id])
  end

  def update   #for admin 
  	@user =User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:success]= "Profile updated"
  		sign_in @user
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end


  def destroy
  	@user = User.find(params[:id])
  	@user.destroy

  end



  private
  	def user_params
  		params.require(:user).permit(:name, :email, :group_id , :manager_group, :active)
  	end

  	def save_params
  		@password = SecureRandom.hex(10)
  		params.require(:user).permit(:name, :email, :password,:password_confirmation )
  	end
  	def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end