class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create], raise: false
  http_basic_authenticate_with name: "admin", password: "admin"
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,        
    :password))
    
    session[:user_id] = @user.id
    
    redirect_to '/welcome'
  end

end
