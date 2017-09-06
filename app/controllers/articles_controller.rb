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

  def create
    token = params[:token]
    if token == Digest::MD5.hexdigest("#{Config.getValue('pwd')}#{Time.now.month}")

      article = Article.new(article_params)
      if article.save
        model = Model.new(200,'success',article)
        render :json => model
      else
        model = Model.new(400,'更新失败。','')
        render :json =>model
      end

    else
      model = Model.new(301,'用户验证失败。','')
      render :json =>model
    end
  end

  def update
    token = params[:token]
    if token == Digest::MD5.hexdigest("#{Config.getValue('pwd')}#{Time.now.month}")

      article = Article.find(params[:id])
      if article.update(article_params)
        model = Model.new(200,'success',article)
        render :json => model
      else
        model = Model.new(401,'更新失败。','')
        render :json =>model
      end

    else
      model = Model.new(301,'用户验证失败。','')
      render :json =>model
    end
  end

  def destroy
    token = params[:token]
    if token == Digest::MD5.hexdigest("#{Config.getValue('pwd')}#{Time.now.month}")

      article = Article.find(params[:id])
      if article.destroy
        model = Model.new(200,'success','')
        render :json => model
      else
        model = Model.new(402,'删除失败。','')
        render :json =>model
      end

    else
      model = Model.new(301,'用户验证失败。','')
      render :json =>model
    end
  end

  private
  def str_truncate str,count
    return Truncato.truncate(str,
                             max_length: count,
                             count_tags: false,
                             filtered_tags: %w(h1 h2 h3 h4 h5 video iframe button br),
                             filtered_attributes: %w(style)).gsub('<p></p>','')
  end
  def article_params
    params.require(:article).permit(:title, :text, :category_id)
  end

end
