class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: SiteConfig.getValue('pwd'), except: [:index, :show]
  
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
    if @article.save
      redirect_to action: :index
    else
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :back
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end
  
end
