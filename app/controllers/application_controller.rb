class ApplicationController < ActionController::API
    before_action :check_token

    def check_token
        unless request.headers.key?('HTTP_TOKEN') && !User.find_by(token: request.headers['HTTP_TOKEN']).nil?
            model = Model.new(301,'用户验证失败。','')
            render :json =>model
        end
    end

end
