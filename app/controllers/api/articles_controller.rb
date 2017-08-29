class Api::ArticlesController < ApplicationController
  skip_before_action :check_auth, only: [:index, :show]

  def index
    articles = Article.order('id DESC').paginate(:page => params[:page],:per_page => params[:per_page])
    render :json => articles
  end

  def show
    article = Article.find(params[:id])
    article.views = article.views+1;
    article.save
    render :json => article
  end

end
