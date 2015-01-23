require 'rails_helper'

feature 'adding projects and courses' do

  scenario 'coder can add a project and course' do
    @coder = Coder.create(coder_name: 'marie', password: '1234567', password_confirmation: '1234567', email: 'marie@example.com')
    visit '/'

    fill_in 'Email', with: 'marie@example.com'
    fill_in 'Password', with: '1234567'

    click_button 'Login'

    click_link 'Dashboard'

    # click_link 'Add Project'
    #
    # fill_in 'Project Name', with: 'New Rails App'
    #
    # click_button 'Submit'
    #
    # expect(page).to have_content('New Rails App')
    #
    # click_link 'Dashboard'
    #
    # click_link 'Add Course'
    #
    # fill_in 'Title', with: 'My first course'
    #
    # expect(page).to have_content('My first course')
  end
end
