class Api::V1::ArticlesController < ApplicationController
  def index
    render json: Article.all
  end
end
