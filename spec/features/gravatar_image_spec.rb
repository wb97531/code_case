require 'rails_helper'

feature 'displaying gravatar image' do
  scenario 'coder sees gravatar image on the dashboard' do
    FactoryGirl.create(:coder, id: 1000, email: 'wb9753@gmail.com')

    visit dashboard_path(1000)

    expect(page).to have_content('Projects')
    expect(page).to have_selector('img')
  end

  scenario 'guest sees gravatar image on the dashboard' do
    coder = FactoryGirl.create(:coder, id: 1000)

    visit guest_path

    fill_in 'email', with: coder.email

    click_button 'See what they\'re working on'

    expect(page).to have_content('Projects')
    expect(page).to have_selector('img')
  end
end
