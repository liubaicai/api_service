class LinksController < ApplicationController

  def new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      links = Link.all.order('sort DESC')
      $cache_cache.write('get_links',links)
      redirect_to '/manager/link'
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      links = Link.all.order('sort DESC')
      $cache_cache.write('get_links',links)
      redirect_to '/manager/link'
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    links = Link.all.order('sort DESC')
    $cache_cache.write('get_links',links)
    redirect_to :back
  end
  
  private
  def link_params
    params.require(:link).permit(:title,:url,:sort)
  end
end
