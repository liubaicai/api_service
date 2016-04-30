class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  
  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == 'admin'
    end
  end
  
  def index
    @articles = Article.order('created_at DESC').page(params[:page])
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
  end
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to action: :index
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end
  
end
