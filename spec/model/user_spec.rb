require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'sheyla', photo: 'sheyla_photo', bio: 'I am sheyla', posts_counter: 5) }

  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  describe 'post_counter' do
    it 'should allow valid values' do
      user.posts_counter = 2.56
      expect(user).to_not be_valid
    end

    it 'should allow valid values' do
      user.posts_counter = 0
      expect(user).to_not be_valid
    end

    it 'should allow valid values' do
      user.posts_counter = -2
      expect(user).to_not be_valid
    end
  end

  describe '#recent_posts' do
    before do
      4.times { |i| Post.create(user: user, title: "post#{i}") }
    end

    it 'show the last 3 posts' do
      expect(user.recent_posts).to eq(user.posts.last(3))
    end
  end
end
