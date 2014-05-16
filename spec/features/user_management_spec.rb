require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with Faker::Internet.email, Faker::Internet.password(8)

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign up')
  end
end


feature 'Visitor signs in', js: true do
  scenario 'with valid email and password' do
    sign_in

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Logout')
  end

  scenario 'with invalid password' do
    user = create :user
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'

    expect(page).to have_content('Login')
  end

  scenario 'with invalid password' do
    user = create :user
    visit new_user_session_path

    fill_in 'Email', with: 'wrong@example.com'
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content('Login')
  end
end
