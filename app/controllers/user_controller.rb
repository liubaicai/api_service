require 'digest/md5'

class UserController < ApplicationController

  def login
  end

  def logout
    cookies.delete :user_cookie
    redirect_to '/'
  end

  def postlogin
    password = params[:password]
    if Digest::MD5.hexdigest(password) == Digest::MD5.hexdigest(Config.getValue('pwd'))
      cookies[:user_cookie] = { :value => Digest::MD5.hexdigest(password) , :expires => 1.month.from_now }
      redirect_to '/'
    else
      @error_msg = '密码错误'
      cookies.delete :user_cookie
      render "login"
    end
  end

end
