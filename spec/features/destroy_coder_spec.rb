feature 'Destroying a coder' do
  scenario 'coder1 can destroy their account' do
    coder = FactoryGirl.create(:coder, id: 2000)
    project = FactoryGirl.create(:project, coder_id: coder.id, id: 2000)
    FactoryGirl.create(:course, coder_id: coder.id, id: 2000)
    FactoryGirl.create(:snippet, coder_id: coder.id, project_id: project.id, id: 2000)

    visit '/login'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: coder.password

    click_button 'Login'

    click_link coder.coder_name

    click_link 'Delete Account'

    expect(page).to have_content("#{coder.coder_name}'s account was successfully destroyed.")
    expect { Coder.find(2000) }.to raise_error ActiveRecord::RecordNotFound

    # testing if the associated objects were also destroyed
    expect { Course.find(2000) }.to raise_error ActiveRecord::RecordNotFound
    expect { Snippet.find(2000) }.to raise_error ActiveRecord::RecordNotFound
    expect { Project.find(2000) }.to raise_error ActiveRecord::RecordNotFound
  end

  scenario "coder2 can't destroy coders1's account" do
    coder1 = FactoryGirl.create(:coder, id: 1001)
    coder2 = FactoryGirl.create(:coder)

    visit '/login'

    fill_in 'Email', with: coder2.email
    fill_in 'Password', with: coder2.password

    click_button 'Login'

    visit "/coders/#{coder1.id}"

    expect(page).to have_content(coder2.coder_name)
    expect(page).to_not have_content(coder1.coder_name)
  end
end
