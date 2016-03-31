class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user
  before_action :authorise, :except => [:new, :create]
  after_action "save_previous_url"

 def save_previous_url
   # session[:previous_url] is a Rails built-in variable to save last url.
   flash[:previous_url] = URI(request.referer || home_path).path
 end


  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def authorise
    redirect_to root_path unless (@current_user.present?)
  end

end
