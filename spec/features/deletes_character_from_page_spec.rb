require 'rails_helper'

feature 'user views details on show page', %Q{
As a site visitor
I want to view the details for a TV show
So I can learn more about it
} do


  scenario 'user views characters on show page' do
    show = TelevisionShow.create(title: 'Ironman', network: 'HBO' )
    actor = Actor.create(name: 'Robert Downey Jr.')
    character = Character.create(character: 'Tony Stark', actor: actor, television_show_id: show.id)

    visit "/television_shows/#{show.id}"
    click_link('Delete')
      expect(page).not_to have_content("Tony Stark")




  end
end
