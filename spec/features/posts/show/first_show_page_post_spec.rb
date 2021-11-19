require 'rails_helper'

RSpec.feature 'User Posts', type: :feature do
  background do
    @user = create(:user, name: 'Other')
    @post = create(:post_with_comments, no_of_comments: 5, user: @user)
    sign_in @user
    visit(user_post_path(@user.id, @post.id))
  end

  describe 'GET /show' do
    scenario "I should see a post's title" do
      expect(page).to have_content capitalize(@post.title)
    end

    scenario 'I should see who wrote the post' do
      expect(page).to have_content("by #{@post.user.name}")
    end

    scenario 'I should see how many comments it has' do
      expect(page).to have_content "Comments: #{@post.comments_counter}"
    end

    scenario 'I should see how many likes it has' do
      expect(page).to have_content "Likes: #{@post.likes_counter}"
    end

    scenario "I should see the post's body" do
      expect(page).to have_content(@post.text)
    end
  end
end
