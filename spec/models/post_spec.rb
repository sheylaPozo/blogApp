require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    let(:post) { build(:post) }

    it 'title should be present' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'title length should be less than 250' do
      post.title = 'title ' * 300
      expect(post).to_not be_valid
    end

    it 'comments_counter should be present' do
      post.comments_counter = nil
      expect(post).to_not be_valid
    end

    it 'likes_counter should be present' do
      post.likes_counter = nil
      expect(post).to_not be_valid
    end
  end

  describe 'update_post_counter' do
    describe 'when user writes' do
      let(:post) { create(:post) }
      it 'should update post counter for the user' do
        expect(post.user.posts_counter).to eq(1)
      end
    end
    describe 'when admin writes' do
      let(:post) { create(:post, user: create(:is_admin)) }
      it 'should update post counter for the user admin' do
        expect(post.user.posts_counter).to eq(1)
      end
    end
  end

  describe 'most_recent_comments' do
    describe 'for a post created by a user' do
      let(:post_with_comments) { create(:post_with_comments, no_of_comments: 10) }
      it 'should be total of 5 comments' do
        expect(post_with_comments.most_recent_comments.size).to eq(5)
      end
    end
    describe 'for a post created by admin' do
      let(:post_with_comments) { create(:post_with_comments, no_of_comments: 10, user: create(:is_admin)) }
      it 'should be total of 5 comments' do
        expect(post_with_comments.most_recent_comments.size).to eq(5)
      end
    end
  end
end
