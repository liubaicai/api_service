class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token
  before_action :check_auth

  def check_auth
    token = params[:token]
    if token != Digest::MD5.hexdigest("#{Config.getValue('pwd')}#{Time.now.month}")
      model = Model.new(301,'用户验证失败。','')
      render :json =>model
    end
  end
end
