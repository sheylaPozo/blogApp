require 'rails_helper'

RSpec.feature 'User Posts', type: :feature do
  background do
    @user = create(:user, name: 'Other')
    @post = create(:post_with_comments, no_of_comments: 5, user: @user)
    sign_in @user
    visit(user_post_path(@user.id, @post.id))
  end

  describe 'GET /show' do
    scenario 'I should see the username of each commentor' do
      @post.comments.each do |comment|
        expect(page).to have_content(comment.user.name.to_s)
      end
    end

    scenario 'I should see the comment of each commentor' do
      @post.comments.each do |comment|
        expect(page).to have_content(comment.text.to_s)
      end
    end
  end
end
