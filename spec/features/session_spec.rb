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
    expect(ActionMailer::Base.deliveries).to have(1).email
  end

  scenario 'coder can sign in and logout with valid info' do
    coder = FactoryGirl.create(:coder)
    visit '/'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: coder.password

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
    coder = FactoryGirl.create(:coder)
    visit '/'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: '1234'

    click_button 'Login'

    expect(current_path).to match('/login')
    expect(page).to_not have_content("Welcome back #{coder.coder_name}")
    expect(page).to have_content("Oops, something went wrong. Try again.")

    fill_in 'Email', with: ''
    fill_in 'Password', with: coder.email

    click_button 'Login'

    expect(current_path).to match('/login')
    expect(page).to_not have_content("Welcome back #{coder.coder_name}")
    expect(page).to have_content("Oops, something went wrong. Try again.")
  end

  # scenario 'coder can not sign in without verification' do
  #   coder = FactoryGirl.create(:coder, verified_email: false)
  #   visit '/'
  #
  #   fill_in 'Email', with: coder.email
  #   fill_in 'Password', with: coder.verified
  #
  #   click_button 'Login'
  #
  #   expect(current_path).to match('/login')
  #   expect(page).to_not have_content("Welcome back #{coder.coder_name}")
  #   expect(page).to have_content("Oops, something went wrong. Try again.")
  # end

  scenario 'if current coders exists, switch coder link replaces root page content' do
    coder = FactoryGirl.create(:coder)
    visit '/'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: coder.password

    click_button 'Login'

    visit '/'

    expect(page).to_not have_button("Login")

    click_link 'Switch Coder'

    expect(page).to have_button("Login")
  end

  scenario 'if current coders exists, switch coder link replaces root page content' do
    coder = FactoryGirl.create(:coder)
    visit '/'

    click_link 'Guest'

    fill_in "Enter coder's email", with: coder.email

    click_button "See what they're working on"

    visit '/'

    expect(page).to_not have_link('Guest')

    click_link 'Switch Coder'

    expect(page).to have_link('Guest')
    expect(page).to_not have_link('Done')
    expect(page).to_not have_link('Display')
  end

  scenario 'can not edit coder if password doesn\'t match' do
    coder = FactoryGirl.create(:coder)
    visit '/'

    fill_in 'Email', with: coder.email
    fill_in 'Password', with: coder.password

    click_button 'Login'

    visit "/coders/#{coder.id}/edit"

    fill_in 'Email', with: 'wendy@example.com'
    fill_in 'Password', with: '123456789'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Coder name', with: 'wendy'

    click_button 'Update Coder'

    expect(page).to_not have_content("wendy was successfully updated.")
    expect(coder.email).to_not eq('wendy@example.com')
  end
end
