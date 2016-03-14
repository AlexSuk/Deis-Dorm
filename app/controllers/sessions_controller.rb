class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    if user = User.find_by_user_name(params[:name])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to quads_url
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
