class ArticlesController < ApplicationController
  skip_before_action :check_auth, only: [:index, :show, :search]
  
  def index
    @articles = Article.order('id DESC').page(params[:page])
  end
  
  def show
    @article = Article.find(params[:id])
    @article.views = @article.views+1;
    @article.save
  end

  def new
    @isShowSummerNote = true
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
    @isShowSummerNote = true
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

  def search
    @articles = Article.where('title like ? or text like ?','%'+params[:keyword]+'%','%'+params[:keyword]+'%').order('created_at DESC').page(params[:page])
    render 'index'
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end
  
end
