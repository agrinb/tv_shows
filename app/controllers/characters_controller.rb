class CharactersController < ApplicationController
  before_action :set_television_show, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    @actors = Actor.all
  end

  def show
    @television_show = TelevisionShow.find(params[:id])
    @character = Character.find(params[:id])
    @actors = select("post", "person_id", Person.all.collect {|p| [ p.name, p.id ] }, {include_blank: 'None'})
  end


  def create
    @television_show = TelevisionShow.find(params[:television_show_id])
    @actor = Actor.find_or_create_by(name: params[:character][:actor][:name])
    @character = Character.new(character_params)
    @character.actor = @actor
    @character.television_show = @television_show
    if @character.save
      flash[:notice] = "Success!"
      redirect_to @television_show
    else
      flash.now[:notice] = "Your character couldn't be added."
      render 'television_shows/show'
    end
  end

  def destroy
    Character.destroy(params[:id])
    redirect_to "/television_shows/#{params[:television_show_id]}"
  end


private
  def set_television_show
    @television_show = TelevisionShow.find(params[:id]) rescue nil
  end

  def character_params
    params.require(:character).permit(:character, :actor)
  end
end
