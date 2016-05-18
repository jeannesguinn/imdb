class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def edit
  end

  def update
    if @movie.update_attributes(movie_params)
     redirect_to @movie
   else
     render :edit
   end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
   if @movie.save
     redirect_to @movie
   else
     render :new
   end
  end

  def destroy
    @movie.destroy
    redirect_to movie_path
  end



  def set_movie
      @movie = Movie.find(params[:id])
    end

  def movie_params
      params.require(:movie).permit(:title, :summary, :youtube_embedded_link, :thumbnail)
    end

end
