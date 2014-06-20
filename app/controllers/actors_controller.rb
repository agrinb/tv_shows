class ActorsController < ApplicationController
  before_action :set_actor, only: [:index, :new, :create, :destroy]

  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
    @character = Character.new(character: params[:character], actor_id: @actor.id, television_show: @television_show.id)
  end

  def create
    @actor = Actor.create(name: actor_params[:actor_name])
    @character = Character.create(character: params[:character], actor_id: @actor.id, television_show: @television_show.id)
    binding.pry
    if @actor.save
      flash[:notice] = "Success!"
    else
      flash.now[:notice] = "Your character couldn't be added."
    end
  end

private
  def set_actor
    @actor = Actor.find(params[:id]) rescue nil
  end

  def character_params
    params.require(:actor).permit(:actor_name, :character)
  end
end
