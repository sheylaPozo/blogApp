require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'update_post_comments_counter' do
    describe 'when an admin comment' do
      let(:comment) { create(:comment, user: create(:is_admin)) }
      it 'should update comments counter for a post' do
        expect(comment.post.comments_counter).to eq(1)
      end
    end
    describe 'when a user comment' do
      let(:comment) { create(:comment) }
      it 'should update comments counter for a post' do
        expect(comment.post.comments_counter).to eq(1)
      end
    end
  end
end
