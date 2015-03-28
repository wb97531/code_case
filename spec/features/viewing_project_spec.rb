require 'rails_helper'

feature 'viewing projects' do
  scenario "projects page should only show current user's projects" do
    coder_1 = FactoryGirl.create(:coder)
    coder_2 = FactoryGirl.create(:coder)
    project_1 = FactoryGirl.create(:project, coder_id: coder_1.id)
    project_2 = FactoryGirl.create(:project, coder_id: coder_2.id)

    visit 'login'

    fill_in 'Email', with: coder_1.email
    fill_in 'Password', with: coder_1.password

    click_button 'Login'

    visit '/projects'

    expect(page).to have_content(project_1.project_name)
    expect(page).to_not have_content(project_2.project_name)
  end
end
