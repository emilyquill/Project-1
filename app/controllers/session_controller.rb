class SessionController < ApplicationController
  def new
    if session[:user_id].present?
      redirect_to home_path
    end
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      # log them in - server 'remembers' who they are dealing with
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end



end
