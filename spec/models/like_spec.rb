require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'update_post_likes_counter' do
    describe 'when a user likes' do
      let(:like) { create(:like) }
      it 'should update likes counter for a post' do
        expect(like.post.likes_counter).to eq(1)
      end
    end
    describe 'when admin likes' do
      let(:like) { create(:like, user: create(:is_admin)) }
      it 'should update likes counter for a post' do
        expect(like.post.likes_counter).to eq(1)
      end
    end
    describe 'when more than one user likes a post' do
      let(:post) { create(:post_with_likes, no_of_users: 5) }
      it 'should update likes counter for a post' do
        expect(post.likes_counter).to eq(5)
      end
    end
  end
end
