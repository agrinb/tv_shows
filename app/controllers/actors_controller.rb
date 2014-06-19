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
  end

  def
    binding.pry
    @actor = Actor.create(name: params[:actor])
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
    params.require(:actor).permit(:actor, :name, :id)
  end
end
