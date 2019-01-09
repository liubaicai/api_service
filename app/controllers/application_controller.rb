class ApplicationController < ActionController::API
    before_action :check_blog_auth

    def check_blog_auth
        token = params[:token]
        if token != Digest::MD5.hexdigest("#{Blog::Config.getValue('pwd')}#{Time.now.month}")
          model = Model.new(301,'用户验证失败。','')
          render :json =>model
        end
    end

end
