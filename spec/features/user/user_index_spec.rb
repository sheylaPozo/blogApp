require 'rails_helper'

RSpec.describe 'User view', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'User index view' do
    let(:user) { User.create(name: 'sheyla', email: 'sheyla@example.com', password: 'password') }

    before do
      @user_one = User.create(name: 'Anna', email: 'Anna@example.com', password: 'password', posts_counter: 3)
      @user_two = User.create(name: 'Yve', email: 'Yve@example.com', password: 'password')

      sign_in user
      visit users_path
    end

    it 'should be able see the username of all other users.' do
      expect(page).to have_content('Yve')
      expect(page).to have_content('Anna')
    end

    it 'should be able see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts:3')
    end

    it "should redirected to that user's show page, when click on a user" do
      find_link("user_#{@user_one.id}").click
      expect(current_path).to eq(user_path(@user_one.id))
    end
  end
end
