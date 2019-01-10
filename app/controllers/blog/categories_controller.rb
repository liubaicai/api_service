class Blog::CategoriesController < ApplicationController
  skip_before_action :check_token, only: [:index]

  def index
    categories = Blog::Category.all
    model = Model.new(200,'success',categories)
    render :json =>model
  end

  def create
    category = Blog::Category.new(category_params)
    if category.save
      model = Model.new(200,'success',category)
      render :json => model
    else
      model = Model.new(400,'新建失败。','')
      render :json =>model
    end
  end

  def update
    category = Blog::Category.find(params[:id])
    if category.update(category_params)
      model = Model.new(200,'success',category)
      render :json => model
    else
      model = Model.new(401,'更新失败。','')
      render :json =>model
    end
  end

  def destroy
    category = Blog::Category.find(params[:id])
    if category.destroy
      model = Model.new(200,'success','')
      render :json => model
    else
      model = Model.new(402,'删除失败。','')
      render :json =>model
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
