require 'rails_helper'

feature 'user adds a character', %Q{
  As a site visitor
  I want to add my favorite TV show actors
  So that other people can enjoy their acting
} do


  scenario 'user views characters on show page' do

    attrs_show = {
      title: 'Ironman',
      network: 'ABC',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

  show = TelevisionShow.create(attrs_show)

  visit "/television_shows/#{show.id}"
  fill_in 'Character', with: 'Tony Stark'
  fill_in 'Name', with: 'Rober Downey'
  click_on 'Submit'


    visit "/television_shows/#{show.id}"
    expect(page).to have_content 'Rober Downey'
  end
end

