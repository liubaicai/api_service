class Blog::ArticlesController < ApplicationController
  skip_before_action :check_token, only: [:index, :show, :search]

  def index

    if params[:page].nil?
      params[:page] = 1
    end
    if params[:per_page].nil?
      params[:per_page] = 10
    end

    articles = Blog::Article.order('id DESC').paginate(:page => params[:page],:per_page => params[:per_page])

    articles.each do |article|
      article.text = str_truncate(article.text,240)
    end

    total = Blog::Article.count
    model = Model.create(200,'success',articles,params[:page],params[:per_page],total)

    render :json =>model
  end

  def show
    article = Blog::Article.find(params[:id])
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

    tmp = Blog::Article.where('title like ? or text like ?','%'+params[:s]+'%','%'+params[:s]+'%')
    articles = tmp.order('id DESC').paginate(:page => params[:page],:per_page => params[:per_page])

    articles.each do |article|
      article.text = str_truncate(article.text,240)
    end

    total = tmp.count
    model = Model.create(200,'success',articles,params[:page],params[:per_page],total)

    render :json =>model
  end

  def create
    article = Blog::Article.new(article_params)
    if article.save
      model = Model.new(200,'success',article)
      render :json => model
    else
      model = Model.new(400,'新建失败。','')
      render :json =>model
    end
  end

  def update
    article = Blog::Article.find(params[:id])
    if article.update(article_params)
      model = Model.new(200,'success',article)
      render :json => model
    else
      model = Model.new(401,'更新失败。','')
      render :json =>model
    end
  end

  def destroy
    article = Blog::Article.find(params[:id])
    if article.destroy
      model = Model.new(200,'success','')
      render :json => model
    else
      model = Model.new(402,'删除失败。','')
      render :json =>model
    end
  end

  private
  def str_truncate str,count
    return Truncato.truncate(str,
                             max_length: count,
                             count_tags: false,
                             filtered_tags: %w(h1 h2 h3 h4 h5 video iframe button br img),
                             filtered_attributes: %w(style)).gsub('<p></p>','')
  end
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end

end
