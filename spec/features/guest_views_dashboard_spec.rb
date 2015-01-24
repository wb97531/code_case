require 'rails_helper'

feature 'guest viewing coder dashboard' do
  scenario 'guest can view a coder dashboard by email' do
    coder = FactoryGirl.create(:coder, email: 'wendy@gmail.com', id: 1000)
    FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    click_link 'View Dashboard'

    fill_in 'email', with: 'wendy@gmail.com'

    click_button 'See what they\'re working on'

    expect(page).to have_content('silly project')
  end

  scenario 'Guest can view a coder dashboard by email' do
    coder = FactoryGirl.create(:coder, email: 'wendy@gmail.com', id: 1000)
    FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    click_link 'View Dashboard'

    fill_in 'email', with: 'w@gmail.com'

    click_button 'See what they\'re working on'

    expect(page).to have_content('We can\'t locate a coder with that email address.')
  end

  scenario 'guest can go back to dashboard with navbar link' do
    coder = FactoryGirl.create(:coder, email: 'wendy@gmail.com', id: 1000, coder_name: 'Tracy')
    project = FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    expect(page).to_not have_link('Coder Dashboard')

    click_link 'View Dashboard'

    fill_in 'email', with: 'wendy@gmail.com'

    click_button 'See what they\'re working on'

    within("#project_#{project.id}") do
      click_link 'silly project'
    end

    expect(page).to have_content('Tracy')
    expect(page).to have_link('Coder Dashboard')

  end
end
