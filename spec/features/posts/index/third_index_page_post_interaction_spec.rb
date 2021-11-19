require 'rails_helper'

RSpec.feature 'User Posts Index Page', type: :feature do
  background do
    @user = create(:user, name: 'Other')
    @posts = create(:post_with_comments, no_of_comments: 5, user: @user)
    sign_in @user
    visit(user_posts_path(@user.id))
  end

  describe 'GET /index' do
    scenario "I should be redirected to post's show page when i click on a post" do
      first_post = @user.top_most_recent_posts[0]
      click_link("user_post#{first_post.id}")
      expect(current_path).to eq user_post_path(@user.id, first_post.id)
    end
  end
end
