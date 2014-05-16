module Features
  module SessionHelpers
    def sign_up_with(email, password, name='Some Name')
      visit new_user_registration_path
      fill_in 'Name', with: name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

    def sign_in(user = :user)
      user = create(user) if user.is_a? Symbol
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      user
    end
  end
end
