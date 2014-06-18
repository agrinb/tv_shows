class CharactersController < ApplicationController
  before_action :set_television_show, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all

    binding.pry
  end

  def show
    @television_show = TelevisionShow.find(params[:id])
    @character = Character.find(params[:id])
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      flash[:notice] = "Success!"
      redirect_to '/characters'
    else
      flash.now[:notice] = "Your character couldn't be added."
      render :new
    end
  end


private
  def set_television_show
    @television_show = TelevisionShow.find(params[:id]) rescue nil
  end

  def character_params
    params.require(:character).permit(:character, :actor)
  end
end
