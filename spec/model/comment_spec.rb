require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_counter' do
    let(:user) { User.create(name: 'Gary', email: 'Gary@mail.com', password: 'password') }
    let(:post) { user.posts.create(title: 'Post', comments_counter: 0, likes_counter: 0) }

    it 'updates the post counter' do
      post.comments.create(user: user)
      expect(post.comments_counter).to eq 1
    end
  end
end
