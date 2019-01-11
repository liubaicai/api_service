class UsersController < ApplicationController
    skip_before_action :check_token, only: [:login]

    def login
        usr = params[:username]
        pwd = params[:password]
        if !usr.nil? && !pwd.nil?
            user = User.find_by(username: usr)
            if !user.nil? && user.password.downcase == pwd.downcase
                user.token = Digest::MD5.hexdigest("#{user.username}#{Time.now}")
                user.save
                model = Model.new(200,'success',Hash[:token => user.token])
                render :json =>model
            else
                model = Model.new(300,'密码有误。','')
                render :json =>model
            end
        else
            model = Model.new(310,'用户名或密码为空。','')
            render :json =>model
        end
    end

    def changePassword
        oldpwd = params[:oldpassword]
        pwd = params[:password]
        user = User.find_by(token: request.headers['HTTP_TOKEN'])
        if user.password.downcase == oldpwd.downcase
            user.password = pwd
            user.token = Digest::MD5.hexdigest("#{user.username}#{Time.now}")
            user.save
            model = Model.new(200,'success',Hash[:token => user.token])
            render :json =>model
        else
            model = Model.new(300,'密码有误。','')
            render :json =>model
        end
    end

end