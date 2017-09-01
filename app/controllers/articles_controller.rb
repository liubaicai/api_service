class ArticlesController < ApplicationController

  def index

    if params[:page].nil?
      params[:page] = 1
    end
    if params[:per_page].nil?
      params[:per_page] = 10
    end

    articles = Article.order('id DESC').paginate(:page => params[:page],:per_page => params[:per_page])

    articles.each do |article|
      article.text = str_truncate(article.text,120)
    end

    total = Article.count
    model = Model.create(200,'success',articles,params[:page],params[:per_page],total)

    render :json =>model
  end

  def show
    article = Article.find(params[:id])
    article.views = article.views+1;
    article.save
    model = Model.new(200,'success',article)
    render :json => model
  end

  def search

    if params[:page].nil?
      params[:page] = 1
    end
    if params[:per_page].nil?
      params[:per_page] = 10
    end

    tmp = Article.where('title like ? or text like ?','%'+params[:s]+'%','%'+params[:s]+'%')
    articles = tmp.order('id DESC').paginate(:page => params[:page],:per_page => params[:per_page])

    articles.each do |article|
      article.text = str_truncate(article.text,120)
    end

    total = tmp.count
    model = Model.create(200,'success',articles,params[:page],params[:per_page],total)

    render :json =>model
  end

  private
  def str_truncate str,count
    return Truncato.truncate(str,
                             max_length: count,
                             count_tags: false,
                             filtered_tags: %w(h1 h2 h3 h4 h5 video iframe button br),
                             filtered_attributes: %w(style)).gsub('<p></p>','')
  end

end
