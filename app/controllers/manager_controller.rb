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
end
