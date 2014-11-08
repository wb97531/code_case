require 'rails_helper'

feature 'session of coder' do
  scenario 'coder can sign in and logout' do
    coder = Coder.create(coder_name: 'marie', password: '1234567', password_confirmation: '1234567', email: 'marie@example.com')
    visit '/'

    fill_in 'Email', with: 'marie@example.com'
    fill_in 'Password', with: '1234567'

    click_button 'Login'

    expect(current_path).to match('/dashboard')
    expect(page).to have_content("Welcome back #{coder.coder_name}")
    expect(page).to_not have_content("Oops, something went wrong. Try again.")


    click_link 'Logout'

    expect(current_path).to match('/login')
    expect(page).to have_button('Login')
    expect(page).to have_content("#{coder.email} has been logged out.")
  end

  scenario 'coder enters invalid login info' do
    coder = Coder.create(coder_name: 'marie', password: '1234567', password_confirmation: '1234567', email: 'marie@example.com')
    visit '/'

    fill_in 'Email', with: 'marie@example.com'
    fill_in 'Password', with: '1234'

    click_button 'Login'

    expect(current_path).to match('/login')
    expect(page).to_not have_content("Welcome back #{coder.coder_name}")
    expect(page).to have_content("Oops, something went wrong. Try again.")

    fill_in 'Email', with: ''
    fill_in 'Password', with: '1234567'

    click_button 'Login'

    expect(current_path).to match('/login')
    expect(page).to_not have_content("Welcome back #{coder.coder_name}")
    expect(page).to have_content("Oops, something went wrong. Try again.")
  end
end
