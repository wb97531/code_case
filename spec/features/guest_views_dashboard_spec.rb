require 'rails_helper'

feature 'guest viewing coder display' do
  scenario 'guest can view a coder display by email' do
    coder = FactoryGirl.create(:coder, email: 'wendy@gmail.com', id: 1000)
    FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    click_link 'Guest'

    fill_in 'email', with: 'wendy@gmail.com'

    click_button 'See what they\'re working on'

    expect(page).to have_content('silly project')
  end

  scenario 'Guest can view a coder display by email' do
    coder = FactoryGirl.create(:coder, email: 'wendy@gmail.com', id: 1000)
    FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    click_link 'Guest'

    fill_in 'email', with: 'w@gmail.com'

    click_button 'See what they\'re working on'

    expect(page).to have_content('We can\'t locate a coder with that email address.')
  end

  scenario 'guest can go back to display with navbar link' do
    coder = FactoryGirl.create(:coder, email: 'example@gmail.com', id: 1000, coder_name: 'Tracy')
    project = FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    expect(page).to_not have_link('Display')

    click_link 'Guest'

    fill_in 'email', with: 'example@gmail.com'

    click_button 'See what they\'re working on'

    within("#project_#{project.id}") do
      click_link 'silly project'
    end

    expect(page).to have_content('silly project')
    expect(page).to have_link('Display')
  end
end
