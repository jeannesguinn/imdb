module API
  class MoviesController < ApplicationController

    def index
      render json: Movie.all
    end

  end
end
