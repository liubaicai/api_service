require 'digest/md5'

class ConfigsController < ApplicationController
  skip_before_action :check_auth, only: [:login]

  def login
    password = params[:password]
    if password == Digest::MD5.hexdigest(Config.getValue('pwd'))
      model = Model.new(200,'success',Hash[:token => Digest::MD5.hexdigest("#{Config.getValue('pwd')}#{Time.now.month}")])
      render :json =>model
    else
      model = Model.new(300,'密码有误。','')
      render :json =>model
    end
  end

  def uptoken
    filename = params[:filename]
    Qiniu.establish_connection!(
        :access_key => Config.getValue('qn_ak'),
        :secret_key => Config.getValue('qn_sk'))

    bucket = 'www-liubaicai-net'
    put_policy = Qiniu::Auth::PutPolicy.new(bucket)
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)

    render :json => {:uptoken => uptoken}
  end

  def index
    configs = Config.all
    configs.each do |config|
      if config.sc_key=='pwd'
        config.sc_value = '******'
      end
    end
    model = Model.new(200,'success',configs)
    render :json =>model
  end

  def update
    config = Config.find(params[:id])
    config_value = params[:config_value]
    config.sc_value = config_value
    if config.save
      model = Model.new(200,'success',config)
      render :json => model
    else
      model = Model.new(401,'更新失败。','')
      render :json =>model
    end
  end

end
