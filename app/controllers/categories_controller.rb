class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def show
    @articles = Article.where(:category_id=>params[:id]).order('created_at DESC').page(params[:page])
    render "articles/index"
  end

  def new
  end
  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to '/'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
