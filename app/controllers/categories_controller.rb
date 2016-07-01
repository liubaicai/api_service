class CategoriesController < ApplicationController
  before_action :check_auth, except: [:index, :show]
  
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
    if @category.save
      redirect_to '/manager/category'
    else
      render 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to '/manager/category'
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to :back
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
  
end
