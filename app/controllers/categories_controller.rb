class CategoriesController < ApplicationController

  def index
    categories = Category.all
    model = Model.new(200,'success',categories)
    render :json =>model
  end

end
