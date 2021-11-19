require 'rails_helper'

RSpec.feature 'Users show page', type: :feature do
  background do
    @user = create(:user_with_posts)
    sign_in @user
    visit(user_path(@user.id))
  end

  describe 'GET /show' do
    scenario "I should see user's profile picture" do
      expect(find('img') { |img| img[:src] == 'https://tiny.one/ebcf4kc8' }).to be_truthy
    end

    scenario "I should see user's name" do
      expect(page).to have_content @user.name
    end

    scenario 'I should see number of posts user has written' do
      expect(page).to have_content "Number of posts: #{@user.posts_counter}"
    end

    scenario "I should see user's bio" do
      expect(page).to have_content @user.bio
    end

    scenario 'I should see the first 3 posts of user' do
      expect(all('.post__item').length).to eq 3
    end

    scenario "I can see a button that lets me view all of a user's posts" do
      expect(find_link('See all posts').visible?).to be true
    end
  end
end
