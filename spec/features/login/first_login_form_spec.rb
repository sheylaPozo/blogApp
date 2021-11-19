require 'rails_helper'

RSpec.feature 'Login Page', type: :feature do
  background { visit(new_user_session_path) }

  describe 'Login Form' do
    it 'I should see username and password inputs and the "Submit" button' do
      expect(page.has_field?('user[email]')).to be_truthy
      expect(page.has_field?('user[password]')).to be_truthy
      expect(page.has_button?('Log in')).to be_truthy
      expect(page.has_field?('user[remember_me]')).to be_truthy
    end
  end
end
