require File.expand_path('../basemodel', __FILE__)

class Api::LinksController < ApplicationController
  skip_before_action :check_auth,only: [:index]

  def index
    links = Link.all.order('sort DESC')
    model = Model.new(200,'success',links)
    render :json =>model
  end

end
