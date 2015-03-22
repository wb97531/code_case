require 'rails_helper'

feature 'Making edits' do
  scenario "coder can add, edit or delete their own work" do
    coder_1 = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder_1.id)
    course = FactoryGirl.create(:course, coder_id: coder_1.id)
    snippet = FactoryGirl.create(:snippet, coder_id: coder_1.id, project_id: project.id)

    visit '/'

    fill_in 'Email', with: coder_1.email
    fill_in 'Password', with: coder_1.password

    click_button 'Login'

    visit "/projects/#{project.id}/edit"

    expect(page).to_not have_content('Password')
    expect(page).to have_content('Editing')

    visit "/courses/#{course.id}/edit"

    expect(page).to_not have_content('Password')
    expect(page).to have_content('Editing')

    visit "/snippets/#{snippet.id}/edit"

    expect(page).to_not have_content('Password')
    expect(page).to have_content('Editing')
  end

  scenario "coder is redirected to login when trying to add, edit or delete another coder's work" do
    coder_1 = FactoryGirl.create(:coder)
    coder_2 = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder_2.id)
    course = FactoryGirl.create(:course, coder_id: coder_2.id)
    snippet = FactoryGirl.create(:snippet, coder_id: coder_2.id)

    visit '/'

    fill_in 'Email', with: coder_1.email
    fill_in 'Password', with: coder_1.password

    click_button 'Login'

    visit "/projects/#{project.id}/edit"

    expect(page).to have_content('Password')
    expect(page).to_not have_content('Editing')

    visit "/courses/#{course.id}/edit"

    expect(page).to have_content('Password')
    expect(page).to_not have_content('Editing')

    visit "/snippets/#{snippet.id}/edit"

    expect(page).to have_content('Password')
    expect(page).to_not have_content('Editing')
  end

  scenario "guest is redirected to login when trying to add, edit or delete coder's work" do
    coder = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder.id)
    course = FactoryGirl.create(:course, coder_id: coder.id)
    snippet = FactoryGirl.create(:snippet, coder_id: coder.id, project_id: project.id)

    visit '/login'

    click_link 'Guest'

    fill_in "Enter the Coder's email", with: coder.email

    click_button "See what they're working on"

    visit "/projects/#{project.id}/edit"

    expect(page).to have_content('Password')
    expect(page).to_not have_content('Editing')

    visit "/courses/#{course.id}/edit"

    expect(page).to have_content('Password')
    expect(page).to_not have_content('Editing')

    visit "/snippets/#{snippet.id}/edit"

    expect(page).to have_content('Password')
    expect(page).to_not have_content('Editing')
  end
end
