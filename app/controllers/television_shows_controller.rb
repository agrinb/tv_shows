class TelevisionShowsController < ApplicationController
  def index
    @television_shows = TelevisionShow.all
  end

  def show
    @television_show = TelevisionShow.find(params[:id])
    @characters = Character.where(television_show_id: @television_show.id)
    binding.pry
    @actors = Actor.find(@characters.actor_id)
    binding.pry
  end


  #   @characters = Character.find_each do |character|
  #     character.television_show_id == @television_show.id
  #     end
  #   @actors = []
  #   @characters.each do |character|
  #     @actors.find_each
  #     if character.actor_id ==


  #   User.find_each do |user|
  #   NewsLetter.weekly_deliver(user)

  #   @character = Character.new
  #   @actor = Actor.new
  #   @television_show = TelevisionShow.find(params[:id])

  # end

  def new
    @television_show = TelevisionShow.new
  end

  def create
    @television_show = TelevisionShow.new(television_show_params)

    if @television_show.save
      flash[:notice] = "Success!"
      redirect_to '/television_shows'
    else
      flash.now[:notice] = "Your movie couldn't be saved."
      render :new
    end
  end

  private

  def television_show_params
    params.require(:television_show).permit(:title, :network, :years, :synopsis)
  end
end
