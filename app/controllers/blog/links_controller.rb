class Blog::LinksController < ApplicationController
  skip_before_action :check_token, only: [:index]

  def index
    links = Blog::Link.all.order('sort DESC')
    model = Model.new(200,'success',links)
    render :json =>model
  end

  def create
    link = Blog::Link.new(link_params)
    if link.save
      model = Model.new(200,'success',link)
      render :json => model
    else
      model = Model.new(400,'更新失败。','')
      render :json =>model
    end
  end

  def update
    link = Blog::Link.find(params[:id])
    if link.update(link_params)
      model = Model.new(200,'success',link)
      render :json => model
    else
      model = Model.new(401,'更新失败。','')
      render :json =>model
    end
  end

  def destroy
    link = Blog::Link.find(params[:id])
    if link.destroy
      model = Model.new(200,'success','')
      render :json => model
    else
      model = Model.new(402,'删除失败。','')
      render :json =>model
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :sort)
  end
end
