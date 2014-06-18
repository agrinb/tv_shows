require 'rails_helper'

feature 'user adds a character', %Q{
  As a site visitor
  I want to add my favorite TV show actors
  So that other people can enjoy their acting
} do


  scenario 'user views characters on show page' do

  show = TelevisionShow.create(title: 'Ironman', network: 'HBO' )

  character = Character.new
  actor = Actor.new
  visit "/television_shows/#{show.id}"
  fill_in 'Character', with: 'Tony Stark'
  fill_in 'Actor', with: 'Rober Downey'
  actor = Actor.new()
  character = Character.create(character.character = 'Tony Stark',  )
  click_on 'Submit'


    visit "/actors"
    expect(page).to have_content 'Rober Downey'
  end
end

