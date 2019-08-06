class SessionsController < ApplicationController
  
  def create
  	@user = User.find_or_create_from_auth_hash(request.env["omniauth.auth"])
	session[:user_id] = @user.id
	session[:email] = @user.email
	session[:picture] = @user.picture
  	redirect_to :comments
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

end