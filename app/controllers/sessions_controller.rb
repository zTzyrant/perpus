class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome], raise: false
  
  def new
  end

  def create
       @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to root_path
          flash[:success] = "Login Successfully... Welcome"
        else 
          redirect_to '/login'
          flash[:error] = "Something Error"
        end
  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end

  def destroy     
    session[:user_id] = nil         
    redirect_to root_path 
  end
  
end
