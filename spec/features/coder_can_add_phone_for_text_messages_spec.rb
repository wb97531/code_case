feature 'Adding and updating coder phone number' do
  ## pending because only have trial account
  # pending scenario 'Coder can add or update phone for text messaging' do
  #   coder = FactoryGirl.create(:coder)
  #   visit '/login'
  #
  #   fill_in 'Email', with: coder.email
  #   fill_in 'Password', with: coder.password
  #
  #   click_button 'Login'
  #
  #   visit "/coders/#{coder.id}"
  #
  #   click_link 'Enter Number'

  ## need real phone for test (twilio trial account)
  #   fill_in 'Phone number receiving text', with: '(555) 555-5555'
  #
  #   click_button 'Add or Update Phone'
  #
  #   expect(Coder.find(coder.id).phone).to eq('5555555555')
  #   expect(page).to have_content("#{coder.coder_name}'s phone number was successfully updated.")
  # end

  scenario 'Coder sends a text back which changes #verified to true' do
    coder = FactoryGirl.create(:coder, phone: '5555555555')

    expect(coder.phone_verified).to eq(false)

    verifications_path

    expect(current_path).to be(nil)

    # not a complete test, could not stub params[:From], tested in development
    coder.update_attribute(:phone_verified, true)

    expect(Coder.find(coder.id).phone_verified).to eq(true)
  end
end
