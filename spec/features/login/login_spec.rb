require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  describe 'Login session' do
    let(:input_type) { %w[email password submit] }
    let(:user) { User.create(name: 'Polina', email: 'user@example.com', password: 'password') }

    before { visit new_user_session_path }

    it 'should display username and password inputs and submit button' do
      input_type.each do |type|
        expect(page).to have_selector("input[type=#{type}]")
      end
    end

    describe 'after submit ' do
      context 'with wrong data' do
        it 'should get detailed error' do
          click_button 'Log in'
          expect(page).to have_content('Invalid Email or password')
        end

        it 'should get detailed error' do
          fill_in 'user_email', with: 'example@mail.com'
          fill_in 'user_password', with: 'password'
          click_button 'Log in'
          expect(page).to have_content('Invalid Email or password')
        end
      end
      context 'with correct data' do
        before do
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: user.password
          click_button 'Log in'
        end

        it { expect(page).to have_content('Signed in successfully') }
      end
    end
  end
end
