class SessionsController < ApplicationController

def new
end

def create
	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      	# Sign the user in and redirect to the user's page.
      if user.active?
      	sign_in user
      	redirect_to root_url
      else
        flash[:error] = 'You are not actived' 
        render 'new'
      end

    else
    	flash[:error] = 'Invalid email/password combination' 
    	render 'new'
    end
end

def destroy
    sign_out
    redirect_to root_url
end

end
