require 'rails_helper'

RSpec.feature 'User Posts', type: :feature do
  background do
    @user = create(:user, name: 'Other')
    sign_in @user
    visit(user_posts_path(@user.id))
  end

  describe 'GET /index' do
    scenario "I should see user's profile picture" do
      expect(find('img') { |img| img[:src] == 'https://tiny.one/ebcf4kc8' }).to be_truthy
    end

    scenario "I should see user's name" do
      expect(page).to have_content @user.name
    end

    scenario 'I should see number of posts of user has written' do
      expect(page).to have_content "Number of posts: #{@user.posts_counter}"
    end
  end
end
