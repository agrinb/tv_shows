class CharactersController < ApplicationController
  before_action :set_television_show, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    @television_show = TelevisionShow.find(params[:id])
    @actor = Actor.new
  end

  def show
    @television_show = TelevisionShow.find(params[:id])
    @character = Character.find(params[:id])
  end


  def create
    @actor = Actor.create(name: character_params[:actor_name])
        binding.pry
    @character = Character.new(character: params[:character], actor_id: @actor.id, television_show: @television_show.id)

    @character = Character.create(character: params[:character], actor_id: @actor.id, television_show: @television_show.id)
    binding.pry
    if @character.save
      flash[:notice] = "Success!"
      redirect_to 'television_shows/show'
    else
      flash.now[:notice] = "Your character couldn't be added."
      redirect_to 'television_shows/show'
    end
  end


private
  def set_television_show
    @television_show = TelevisionShow.find(params[:id]) rescue nil
  end

  def character_params
    params.require(:character).permit(:character, :actor_name)
  end
end