require 'rails_helper'

RSpec.feature 'Users show page', type: :feature do
  background do
    @user = create(:user_with_posts)
    sign_in @user
    visit(user_path(@user.id))
  end

  describe 'GET /show' do
    scenario "I should be redirected to post's show page when i click a post" do
      first_post = @user.top_most_recent_posts[0]
      click_link("user_post#{first_post.id}")
      expect(current_path).to eq user_post_path(@user.id, first_post.id)
    end

    scenario "I should be redirected to user's posts index page when i click see all posts button" do
      click_link('See all posts')
      expect(current_path).to eq user_posts_path(@user.id)
    end
  end
end
