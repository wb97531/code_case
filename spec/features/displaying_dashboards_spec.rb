require 'rails_helper'

feature 'displaying dashboard' do
  scenario 'displays link to project show page' do
  @coder_1 = FactoryGirl.create(:coder)
  @coder_2 = FactoryGirl.create(:coder)
  @project_1 = FactoryGirl.create(:project, coder_id: @coder_1.id, project_name: 'This is the first project')
  @project_2 = FactoryGirl.create(:project, coder_id: @coder_1.id, project_name: 'This is the second project')
  @project_3 = FactoryGirl.create(:project, coder_id: @coder_2.id, project_name: 'This is the third project')

  visit '/'

  fill_in 'Email', with: @coder_1.email
  fill_in 'Password', with: '987654321'

  click_button 'Login'

  visit "/dashboard/#{@coder_1.id}"

  expect(page).to have_link(@project_2.project_name)
  expect(page).to_not have_link(@project_3.project_name)

  click_link @project_1.project_name

  expect(page).to have_content(@project_1.project_name)
  expect(page).to_not have_content(@project_2.project_name)
  end

  scenario 'displays coder links to all code snippet show pages' do
    @coder_1 = FactoryGirl.create(:coder)
    @coder_2 = FactoryGirl.create(:coder)
    @project_1 = FactoryGirl.create(:project, coder_id: @coder_1.id, project_name: 'This is the first project')
    @code_snippet_1 = FactoryGirl.create(:snippet, coder_id: @coder_1.id, project_id: @coder_1.id, objective: 'This is the first snippet')
    @code_snippet_2 = FactoryGirl.create(:snippet, coder_id: @coder_1.id, project_id: @coder_1.id, objective: 'This is the second snippet')
    @code_snippet_3 = FactoryGirl.create(:snippet, coder_id: @coder_2.id, project_id: @coder_1.id, objective: 'This is the third snippet')


    visit '/'

    fill_in 'Email', with: @coder_1.email
    fill_in 'Password', with: '987654321'

    click_button 'Login'

    visit "/dashboard/#{@coder_1.id}"

    expect(page).to have_link(@code_snippet_2.objective)
    expect(page).to_not have_link(@code_snippet_3.objective)

    click_link @code_snippet_1.objective

    expect(page).to have_content(@code_snippet_1.objective)
    expect(page).to_not have_content(@code_snippet_2.objective)
  end

  scenario 'displays coder links to all courses show pages' do
    @coder_1 = FactoryGirl.create(:coder)
    @coder_2 = FactoryGirl.create(:coder)
    @course_1 = FactoryGirl.create(:course, coder_id: @coder_1.id, title: 'This is the first course')
    @course_2 = FactoryGirl.create(:course, coder_id: @coder_1.id, title: 'This is the second course')
    @course_3 = FactoryGirl.create(:course, coder_id: @coder_2.id, title: 'This is the third course')

    visit '/'

    fill_in 'Email', with: @coder_1.email
    fill_in 'Password', with: '987654321'

    click_button 'Login'

    visit "/dashboard/#{@coder_1.id}"

    expect(page).to have_link(@course_2.title)
    expect(page).to_not have_link(@course_3.title)

    click_link @course_1.title

    expect(page).to have_content(@course_1.title)
    expect(page).to_not have_content(@course_2.title)
  end

end
