require 'rails_helper'

feature 'user views details on show page', %Q{
As a site visitor
I want to view the details for a TV show
So I can learn more about it
} do


  scenario 'user views characters on show page' do

  show = TelevisionShow.create(title: 'Ironman', network: 'HBO' )


  character = Character.create(character: 'Tony Stark', actor: 'Rober Downey', television_show_id: show.id)



    visit "/television_shows/#{show.id}"
      expect(page).to have_content("Tony Stark")
  end
end


# Acceptance Criteria:
# * I can see a the show's title, network, the years it ran, and a synopsis
# * For each character, I can see the character's name, actor's name, and the character's description
