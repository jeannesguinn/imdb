module API
  class MoviesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      render json: Movie.all
    end

    def show
      render json: Movie.find(params[:id])
    end

    def create
      movie = Movie.new(movie_params)
      if movie.save
        #status 201 is created. We have to do the location: [:api, movie], so that
        #it's the equivalent to a redirect to show because we can't redirect an api.
        render json: movie, status: 201, location: [:api, movie]
      else
        render json: movie.errors, status: 422
      end
    end


  private

  def movie_params
      params.require(:movie).permit(:title, :summary, :youtube_embedded_link, :thumbnail)
  end

  end
end
