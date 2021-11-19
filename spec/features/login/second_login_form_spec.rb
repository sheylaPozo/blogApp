# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login Page', type: :feature do
  background { visit(new_user_session_path) }

  describe 'Submit button' do
    given(:user) { create(:user) }

    scenario 'without email and password' do
      click_button 'Log in'
      expect(page.has_content?('Invalid Email or password.')).to be_truthy
    end
    scenario 'with invalid email and password' do
      within 'form' do
        fill_in 'user[email]', with: 'email@email.com'
        fill_in 'user[password]', with: 'password'
      end
      click_button 'Log in'
      expect(page.has_content?('Invalid Email or password.')).to be_truthy
    end

    scenario 'with valid email and password' do
      within 'form' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
      end
      click_button 'Log in'
      expect(current_path).to eq root_path
      expect(page.has_content?('Signed in successfully.')).to be_truthy
    end
  end
end
