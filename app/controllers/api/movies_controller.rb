module API
  class MoviesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      render json: Movie.all
    end

    def show
      render json: Movie.find(params[:id])
    end

  end
end
