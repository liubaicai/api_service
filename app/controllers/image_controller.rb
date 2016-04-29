class ImageController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def upload
    render plain: "http://www.liubaicai.net/wp-content/uploads/2015/12/logo.png"
  end
end
