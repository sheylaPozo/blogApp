require 'rails_helper'

RSpec.describe 'Post view', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'Post show' do
    let(:user) { User.create(name: 'sheyla', email: 'sheyla@example.com', password: 'password') }
    let(:user_two) { User.create(name: 'Yve', email: 'Yve@example.com', password: 'password') }
    let(:comment) { Comment.create(text: 'Comment one', user: user, post: post) }

    describe 'display post information' do
      let(:post) { Post.create(title: 'Post title test', text: 'My test post', user: user) }
      before do
        Comment.create(text: 'Comment from Yve', user: user_two, post: post)
        Comment.create(text: 'Comment from sheyla', user: user, post: post)

        Like.create(post: post)

        sign_in user
        visit user_posts_path(user, post)
      end

      it "displays the post's title." do
        expect(page).to have_content('Post title test')
      end

      it 'displays who wrote the post.' do
        expect(page).to have_content(post.user.name.to_s)
      end

      it 'display how many comments the post has.' do
        expect(page).to have_content("Comments: #{post.comments_counter}")
      end

      it 'display how many likes the post has.' do
        expect(page).to have_content("Likes: #{post.likes_counter}")
      end

      it 'display post`s body.' do
        expect(page).to have_content('My test post')
      end

      it 'display the username of each commentor.' do
        expect(page).to have_content(comment.user.name.to_s)
      end

      it 'display the comment each commentor left.' do
        expect(page).to have_content('Comment from sheyla')
        expect(page).to have_content('Comment from Yve')
      end
    end
  end
end
