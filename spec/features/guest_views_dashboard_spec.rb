require 'rails_helper'

feature 'guest viewing coder display' do
  scenario 'guest can view a coder display by email' do
    coder = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder.id)

    visit '/'

    click_link 'Guest'

    fill_in 'email', with: coder.email

    click_button "See what they're working on"

    expect(page).to have_content(project.project_name)
  end

  scenario 'Guest can view a coder display by email' do
    coder = FactoryGirl.create(:coder)
    FactoryGirl.create(:project, coder_id: coder.id)

    visit '/'

    click_link 'Guest'

    fill_in 'email', with: 'w@gmail.com'

    click_button "See what they're working on"

    expect(page).to have_content("We can't locate a coder with that email address.")
  end

  scenario 'guest can go back to display with navbar link' do
    coder = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder.id)

    visit '/'

    expect(page).to_not have_link('Display')

    click_link 'Guest'

    fill_in 'email', with: coder.email

    click_button "See what they're working on"

    within("#project_#{project.id}") do
      click_link project.project_name
    end

    expect(page).to have_content(project.project_name)
    expect(page).to have_link('Display')
  end

  scenario 'user that goes directly to dashboard can go back to dashboard with display link' do
    coder = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder.id)
    snippet = FactoryGirl.create(:snippet, coder_id: coder.id, project_id: project.id)

    visit "dashboard/#{coder.id}"

    within("#project_#{project.id}") do
      click_link project.project_name
    end

    expect(page).to have_content(project.project_name)

    click_link 'Display'

    expect(page).to have_content(snippet.objective)
  end
end
