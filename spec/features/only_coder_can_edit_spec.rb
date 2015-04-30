require 'rails_helper'

feature 'Making edits' do
  scenario 'coder can edit their work' do
    coder = FactoryGirl.create(:coder)
    visit '/'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: coder.password

    click_button 'Login'

    visit "/coders/#{coder.id}/edit"

    fill_in 'Email', with: 'wendy@example.com'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with: '123456789'
    fill_in 'Coder name', with: 'marie'

    click_button 'Update Coder'

    expect(page).to have_content('marie')
  end

  scenario "coder can visit their projects, courses and snippets edit pages" do
    coder = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder.id)
    course = FactoryGirl.create(:course, coder_id: coder.id)
    snippet = FactoryGirl.create(:snippet, coder_id: coder.id, project_id: project.id)

    visit '/'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: coder.password

    click_button 'Login'

    visit "/projects/#{project.id}/edit"

    expect(page).to_not have_content('Password')
    expect(page).to have_content('Editing')
    expect(page).to_not have_link('Switch Coder')

    visit "/courses/#{course.id}/edit"

    expect(page).to_not have_content('Password')
    expect(page).to have_content('Editing')
    expect(page).to_not have_link('Switch Coder')

    visit "/snippets/#{snippet.id}/edit"

    expect(page).to_not have_content('Password')
    expect(page).to have_content('Editing')
    expect(page).to_not have_link('Switch Coder')

    visit "/coders/#{coder.id}/edit"

    expect(page).to have_content('Password')
    expect(page).to have_content('Editing')
    expect(page).to_not have_link('Switch Coder')
  end

  scenario "coder is redirected to login or their edit page when trying to visit another coder's edit pages" do
    coder_1 = FactoryGirl.create(:coder)
    coder_2 = FactoryGirl.create(:coder, coder_name: 'Lisa')
    project = FactoryGirl.create(:project, coder_id: coder_2.id)
    course = FactoryGirl.create(:course, coder_id: coder_2.id)
    snippet = FactoryGirl.create(:snippet, coder_id: coder_2.id)

    visit '/'

    fill_in 'Email', with: coder_1.email
    fill_in 'Password', with: coder_1.password

    click_button 'Login'

    visit "/projects/#{project.id}/edit"

    expect(page).to have_link('Switch Coder')
    expect(page).to_not have_content('Editing')

    visit "/courses/#{course.id}/edit"

    expect(page).to have_link('Switch Coder')
    expect(page).to_not have_content('Editing')

    visit "/snippets/#{snippet.id}/edit"

    expect(page).to have_link('Switch Coder')
    expect(page).to_not have_content('Editing')

    visit "/coders/#{coder_2.id}/edit"

    # coder is redirected to their editing page
    expect(page).to_not have_content(coder_1.email)
  end

  scenario "guest is redirected to login when trying to add, edit or delete coder's work" do
    coder = FactoryGirl.create(:coder)
    project = FactoryGirl.create(:project, coder_id: coder.id)
    course = FactoryGirl.create(:course, coder_id: coder.id)
    snippet = FactoryGirl.create(:snippet, coder_id: coder.id, project_id: project.id)

    visit '/login'

    click_link 'Guest'

    fill_in "Enter coder's email", with: coder.email

    click_button "See what they're working on"

    visit "/projects/#{project.id}/edit"

    expect(page).to have_link('Switch Coder')
    expect(page).to_not have_content('Editing')

    visit "/courses/#{course.id}/edit"

    expect(page).to have_link('Switch Coder')
    expect(page).to_not have_content('Editing')

    visit "/snippets/#{snippet.id}/edit"

    expect(page).to have_link('Switch Coder')
    expect(page).to_not have_content('Editing')
  end
end
