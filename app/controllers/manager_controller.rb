class ManagerController < ApplicationController
  before_action :check_auth
  
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
  
  def settings
    @configs = Config.all
  end
  def editsettings
    @configs = params[:configs]
    @configs.each do |config|
      Config.setValue(config[0],config[1])
    end
    redirect_to :back
  end
  
end
