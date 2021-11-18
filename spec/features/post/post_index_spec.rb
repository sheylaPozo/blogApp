require 'rails_helper'

RSpec.describe 'Post view', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'Post index' do
    let(:user) { User.create(name: 'sheyla', email: 'sheyla@example.com', password: 'password') }

    describe 'display post information' do
      before do
        Post.create(title: 'Post title one', text: 'My first post', user: user)
        Post.create(title: 'Post title two', text: 'My second post', user: user)
        Post.create(title: 'Post title three', text: 'My third post', user: user)
        sign_in user
        visit user_posts_path(user)
      end

      it 'displays the author`s username.' do
        expect(page).to have_content('sheyla')
      end

      it 'displays the number of posts the user has written.' do
        expect(page).to have_content('Number of posts:3')
      end

      it "displays the post's title." do
        expect(page).to have_content('Post title one')
      end

      it "displays some of the post's body." do
        expect(page).to have_content('My second post')
      end
    end

    describe 'On posts with comments' do
      let(:post) { Post.create(title: 'Post title test', text: 'My test post', user: user) }
      before do
        Comment.create(text: 'Comment one', user: user, post: post)
        Comment.create(text: 'Comment two', user: user, post: post)
        Comment.create(text: 'Comment three', user: user, post: post)
        Comment.create(text: 'Comment four', user: user, post: post)
        Like.create(post: post)

        sign_in user
        visit user_posts_path(user)
      end

      it 'display the first three comments on the post.' do
        expect(page).not_to have_content('Comment one')
        expect(page).to have_content('Comment two')
        expect(page).to have_content('Comment three')
        expect(page).to have_content('Comment four')
      end

      it 'display how many comments a post has.' do
        expect(page).to have_content("Comments: #{post.comments_counter}")
      end

      it 'display how many likes a post has.' do
        expect(page).to have_content("Likes: #{post.likes_counter}")
      end

      it 'display pagination button.' do
        expect(page).to have_selector 'button', text: 'Pagination'
      end

      it "should redirected to that user's show page, when click on a user" do
        find_link("redirect_post_#{post.id}").click
        expect(current_path).to eq(user_post_path(user.id, post.id))
      end
    end
  end
end
