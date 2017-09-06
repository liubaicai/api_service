class CategoriesController < ApplicationController
  skip_before_action :check_auth, only: [:index]

  def index
    categories = Category.all
    model = Model.new(200,'success',categories)
    render :json =>model
  end

end
