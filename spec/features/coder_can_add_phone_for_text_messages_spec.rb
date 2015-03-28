feature 'Adding and updating coder phone number' do
  scenario 'Coder can add or update phone for text messaging' do
    coder = FactoryGirl.create(:coder)
    visit '/login'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: coder.password

    click_button 'Login'

    visit "/coders/#{coder.id}"

    click_link 'Enter Number'

    fill_in 'Phone number receiving text', with: '3035555555'

    click_button 'Add or Update Phone'

    expect(Coder.find(coder.id).phone).to eq('3035555555')
    expect(page).to have_content("#{coder.coder_name}'s phone number was successfully updated.")
  end
end
