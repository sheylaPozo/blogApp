require 'rails_helper'

RSpec.feature 'User Posts Index Page', type: :feature do
  background do
    @user = create(:user, name: 'Other')
    @posts = create(:post_with_comments, no_of_comments: 5, user: @user)
    sign_in @user
    visit(user_posts_path(@user.id))
  end

  describe 'GET /index' do
    scenario "I should see a post's title" do
      title = @user.posts.first.title
      expect(page).to have_content capitalize(title)
    end

    scenario "I should see some of the post's body" do
      text = @user.posts.first.text
      expect(page).to have_content shorten_text(text)
    end

    scenario 'I should see the first comment on a post' do
      expect(page).to have_content @user.posts.first.most_recent_comments.first.text
    end

    scenario 'I should see how many comments a post has' do
      expect(page).to have_content "Comments: #{@user.posts.first.comments_counter}"
    end

    scenario 'I should see how many likes a post has' do
      expect(page).to have_content "Likes: #{@user.posts.first.likes_counter}"
    end

    scenario 'I should see a section for pagination' do
      expect(page).to have_content 'Pagination'
    end
  end
end
