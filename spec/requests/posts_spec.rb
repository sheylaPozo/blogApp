require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Gary', email: 'Gary@mail.com', password: 'password') }
  let(:post) { user.posts.create(title: 'Post', comments_counter: 2, likes_counter: 4) }

  describe 'GET #index' do
    before do
      sign_in user
      get user_posts_path(user_id: post.user_id)
    end

    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Pagination')
    end
  end

  describe 'GET #show' do
    before do
      sign_in user
      get user_post_path(user_id: user.id, id: post.id)
    end

    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end
