require 'rails_helper'

feature 'user adds a new TV show', %Q{
  As a site visitor
  I want to add my favorite TV show characters
So that other people can enjoy their crazy antics
} do

# Acceptance criteria
# I can access a form to add a character on a TV show's page
# I must specify the character's name and the actor's name

  scenario 'user adds a new character to TV show' do
    # attrs_char = {
    #   character: 'Tony Stark',
    #   actor: 'Rober Downey Jr.',
    # }

    attrs_show = {
      title: 'Ironman',
      network: 'ABC',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

  show = TelevisionShow.create(attrs_show)

  character = Character.new

    visit "/television_shows/#{show.id}"
    save_and_open_page
    fill_in 'Character', with: 'Tony Stark'
    fill_in 'Name', with: 'Rober Downey Jr.'
    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content 'Rober Downey Jr.'
  end
end



# I can optionally provide a description
# If I do not provide the required information, I receive an error message
# If the character already exists in the database, I receive an error message
