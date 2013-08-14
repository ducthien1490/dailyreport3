class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :update,:edit, :update]
  before_action :no_correct_user,   only: [:show,:edit, :update]
  before_action :admin_user,   only: [:index,:show ,:edit, :update]

  def new
  	#@password = SecureRandom.hex(10)
    @password = 'foobar'
  	@user = User.new
  end
  
  def excel
     @users = User.all
     filename = "data_users.xls"
     respond_to do |format|
     format.html # index.html.erb
     format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" }
    end
  end
  def index
  	@users = User.paginate(page: params[:page], per_page: "20")
  end


  def show
    @user = User.find(params[:id])

  end

  def create
	   @user= User.new(save_params)

  	if @user.save 
      UserMailer.registration_confirmation(@user).deliver  
  		flash[:success] = "Acount created.Wait for adminstration aproval!"
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end



  def update   #for admin 
     
  	@user =User.find(params[:id])
  	if @user.update_attributes!(user_params)
  		flash[:success]= "Profile updated"
  		#sign_in @user
  		redirect_to root_url
  	else
  		render 'edit'
  	end
  end


  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    redirect_to users_path
  end



  private
  	def user_params
  		params.require(:user).permit(:group_id ,:manager_group)
  	end

  	def save_params
  		params.require(:user).permit(:name, :email, :password,:password_confirmation )
  	end

  	def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    
    def admin_user
       redirect_to(root_url)unless current_user.admin?
    end
    def no_correct_user
     # binding.pry
      @user = User.find(params[:id])
      redirect_to(root_url) if current_user?(@user) # neu khong fai la admin thy quay ve root_url .
      # neu la admin thy vao trang dang nhap
    end
 
end