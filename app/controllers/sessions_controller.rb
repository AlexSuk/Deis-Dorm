class SessionsController < ApplicationController
    skip_before_action :authorize
  def new
  end

  def create
    if User.exists?(user_name: "#{params[:name]}")
      user = User.find_by_user_name("#{params[:name]}")
      if user.password == params[:password]
        session[:user_id] = user.id
        redirect_to admin_url
      else
        redirect_to login_url, :alert => "Invalid password combination. Try again."
      end
    else
      redirect_to login_url, :alert => "User doesn't exist."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out"
  end
end
