class LinksController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"

  def new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
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
      redirect_to '/manager/link'
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to :back
  end
  
  private
  def link_params
    params.require(:link).permit(:title,:url,:sort)
  end
end
