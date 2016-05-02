class ManagerController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"
  
  def index
  end
  
  def article
    @articles = Article.all.order('created_at DESC')
  end
  
  def category
    @categories = Category.all
  end
  
  def link
    @links = Link.all
  end
  
  # def settings
  #   @configs = SiteConfig.all
  # end
  # def editsettings
  #   @configs = params[:configs]
  #   @configs.each do |config|
  #     SiteConfig.setValue(config[0],config[1])
  #   end
  #   redirect_to :back
  # end
  
end
