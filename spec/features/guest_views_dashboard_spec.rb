require 'rails_helper'

feature 'Guest Viewing Coder Dashboard' do
  scenario 'Guest can view a coder dashboard by email' do
    coder = FactoryGirl.create(:coder, email: 'wendy@gmail.com', id: 1000)
    FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    click_link 'View Coder Dashboard'

    fill_in 'email', with: 'wendy@gmail.com'

    click_button 'See what they\'re working on'

    expect(page).to have_content('silly project')
  end

  scenario 'Guest can view a coder dashboard by email' do
    coder = FactoryGirl.create(:coder, email: 'wendy@gmail.com', id: 1000)
    FactoryGirl.create(:project, coder_id: 1000, project_name: 'silly project')

    visit '/'

    click_link 'View Coder Dashboard'

    fill_in 'email', with: 'w@gmail.com'

    click_button 'See what they\'re working on'

    expect(page).to have_content('We can\'t locate a coder with that email address.')
  end

end
