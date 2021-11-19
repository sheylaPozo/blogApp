require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:is_admin) }
    it 'name should be present' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'posts_counter should be present' do
      user.posts_counter = nil
      expect(user).to_not be_valid
    end
  end

  describe 'top_most_recent_posts' do
    let(:user) { build(:user_with_posts, posts_counter: 10) }
    it 'when total posts is less than 3 limit post to 3' do
      expect(user.top_most_recent_posts.size).to be <= 3
    end
  end
end
