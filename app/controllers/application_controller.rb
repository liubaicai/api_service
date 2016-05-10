class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :log_req
  
  def log_req
    ReqLog.insert(request.remote_ip,request.url,request.method,request.user_agent)
  end
end
