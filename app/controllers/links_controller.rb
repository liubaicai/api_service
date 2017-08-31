class LinksController < ApplicationController

  def index
    links = Link.all.order('sort DESC')
    model = Model.new(200,'success',links)
    render :json =>model
  end

end
