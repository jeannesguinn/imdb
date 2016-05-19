module API
  class ActorsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      render json: Actor.all
    end

    def show
      render json: Actor.find(params[:id])
    end

  end
end
