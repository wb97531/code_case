feature 'Verifying email' do
  scenario 'a coder is sent an email after sign up' do
    visit new_coder_path

    fill_in 'Coder name', with: 'wendy'
    fill_in 'Email', with: 'wb9753@hotmail.com'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with: '123456789'

    click_button 'Create Coder'

    expect(page).to have_content('You have been sent an email for verification.')
    # expect count to go up by 1
  end
end
