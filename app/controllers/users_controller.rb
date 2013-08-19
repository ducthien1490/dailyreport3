class UsersController < ApplicationController
	before_action :signed_in_user, only: [:show,:index, :update,:edit, :update]
  before_action :correct_user,   only: [:show,:edit, :update, :new_report,:destroy]
  #before_action :admin_user,   only: [:index,:show ,:edit, :update]
  def new
  	@user = User.new
  end

  def excel
     #@users = User.all
    
     @users=User.find_by(id: current_user.id)
     @answers = Answer.where(user_id: current_user.id)
     @time=params[:time] 
     filename =["[",@users.name, "]","Daily Report at",@time,".xls"].join(" ")
     respond_to do |format|
     format.html # index.html.erb
     format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" }
    end
  end

  def index
    if(current_user.admin?)
  	@users = User.paginate(page: params[:page], per_page: "20")
    else
      redirect_to root_url
    end
  end

  def show

  @user = User.find_by_id(params[:id])
  if @user.nil?
    @user = User.find_by_md5_id(params[:id])
  end
  
  if(current_user.admin&&@user.active!=true&&current_user!=@user)
        @user.toggle!(:active)
        flash[:success] = "User #{@user.email} Actived!"
        redirect_to root_url
  else     
      redirect_to root_url
  end
end

  def create
	   @user= User.new(save_params)
    #binding.pry
  	if @user.save 
      UserMailer.registration_confirmation(@user).deliver  
      User.all.each do |u_a|
        if(u_a.admin)
          UserMailer.active_by_admin(@user,u_a).deliver #GUI MAIL CHO ADMIN
          #binding.pry
        end
     end

      

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
    if(current_user.admin? && !current_user?(@user))  # neu  la admin va khong phai tu update cho minh
      	if @user.update_attributes!(user_params)
      		flash[:success]= "Manager and Group changed"
      		#sign_in @user
      		redirect_to users_path
      	else
      		render 'edit'
      	end
    else
       if @user.update_attributes!(user_params_for_profiles)
          flash[:success]= "Profile updated"
          #sign_in @user
          redirect_to users_path
        else
          render 'edit'
        end
    end 

  end
  

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    redirect_to users_path
  end
   #///////////////////////////////report User
   def report_user
      @time=params[:time] 
      @answers = Answer.where(user_id: current_user.id)
   end

   def xuly
      @time=params[:time] 
      @answer=Answer.where(user_id: current_user.id )      
   end

  private
  	def user_params
  		params.require(:user).permit(:group_id ,:manager_group)
  	end

    def user_params_for_profiles
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end

  	def save_params
  		params.require(:user).permit(:name, :email, :password,:password_confirmation,:md5_id )
  	end

  	def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    
    def admin_user
       redirect_to(root_url)unless current_user.admin?
    end
    
    def correct_user
     # binding.pry
      #@user = User.find_by_id_or_md5_id(params[:id])
      @user = User.find(params[:id])
      if @user.nil?
        @user = User.find_by_md5_id(params[:id])
      end
      if !current_user?(@user) && !current_user.admin?
        redirect_to(root_url)  
      end
      #users hien tai khong duoc edit profile cua user khac
    end

  
 
end