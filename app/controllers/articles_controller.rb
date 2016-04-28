class ArticlesController < ApplicationController

  def index
    @articles = Article.order('created_at DESC').page(params[:page])
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
    params.require(:article).permit(:title, :text)
  end
  
end
