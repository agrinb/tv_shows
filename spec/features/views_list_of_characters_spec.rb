require 'rails_helper'

feature 'user views list of TV shows', %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
} do

# Acceptance Criteria:
# * I can see a list of all the characters
# * The character's name and the TV show it is associated with are listed

  scenario 'user views characters' do

    show = TelevisionShow.create(title: 'Ironman', network: 'HBO' )


    # character_attrs = [
    #   { character: 'Tony Stark', actor: 'Rober Downey', television_show_id: show.id }
    # ]

    character = Character.create(character: 'Tony Stark', actor: 'Rober Downey', television_show_id: show.id)

     #character= Character.create(character_attrs)




    visit '/characters'
      expect(page).to have_content("Tony Stark")
  end
end
