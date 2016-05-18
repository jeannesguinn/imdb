class ActorsController < ApplicationController
before_action :set_actor, only: [:show, :edit, :update, :destroy]

  def index
    @actors = Actor.all
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
   if @actor.save
     redirect_to @actor
   else
     render :new
   end
  end

  def edit
  end

  def update
    if @actor.update_attributes(actor_params)
     redirect_to @actor
   else
     render :edit
   end
  end

  def destroy
    @actor.destroy
    redirect_to actor_path
  end


  def set_actor
      @actor = Actor.find(params[:id])
  end

  def actor_params
      params.require(:actor).permit(:name, :year_of_birth, :thumbnail)
  end

end
