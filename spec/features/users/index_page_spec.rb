# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users Index Page', type: :feature do
  signin_user
  background do
    @user1 = create(:user, name: 'user1')
    @user2 = create(:user, name: 'user2')
    visit(root_path)
  end

  describe 'GET /index' do
    scenario 'I should see usernames of other users' do
      expect(page).to have_content @user.name
      expect(page).to have_content @user1.name
      expect(page).to have_content @user2.name
      expect(all(:css, '.profile').size).to eq(3)
    end

    scenario 'I should see profile pictures of each user' do
      expect(all('img').size).to eq(3)
      all('img').each do |img|
        expect(img[:src]).to eq('https://tiny.one/ebcf4kc8')
      end
    end

    scenario 'I should see number of posts of each user' do
      expect(all(:css, '.posts_counter').size).to eq(3)
      all(:css, '.posts_counter').each do |div|
        expect(div).to have_content 'Number of posts: 0'
      end
    end

    scenario "I should be redirected to user's show page when I click on a user" do
      find_link("user_#{@user1.id}").click
      expect(current_path).to eq user_path(@user1.id)
    end
  end
end
