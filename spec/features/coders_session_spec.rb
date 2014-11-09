require 'rails_helper'

feature 'signing in and logging out of coder' do
  scenario 'allows a coder to signup and create session' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link 'Signup'

    fill_in 'Coder name', with: 'bob'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with: '123456789'
    fill_in 'Email', with: 'ted@smith.com'

    click_button 'Create Coder'
    expect(page).to have_text('Thank you for signing up. You are signed in as: bob')
    # expect(page).to have_text('Signed in as ted@smith.com')
  end

  scenario 'coder can sign in and logout with valid info' do
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

  scenario 'coder can not sign in with invalid login info' do
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

  scenario 'can edit a coder' do
    coder = Coder.create(coder_name: 'marie', password: '1234567', password_confirmation: '1234567', email: 'marie@example.com')

    visit "/coders/#{coder.id}/edit"

    fill_in 'Email', with: 'wendy@example.com'
    fill_in 'Password', with: '123456789'
    fill_in 'Coder name', with: 'wendy'

    click_button 'Update Coder'

    expect(page).to have_content("wendy was successfully updated.")
  end
end
