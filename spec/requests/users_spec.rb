require 'rails_helper'

RSpec.describe 'Users', type: :request do
  signin_user
  describe 'GET /index' do
    before(:each) do
      get users_path
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should list all users in the correct view' do
      expect(response).to render_template(:index)
      expect(response).to_not render_template(:show)
      assert_template 'users/index'
    end

    it 'should include Wale in the body' do
      expect(response.body).to match(/User/)
    end
  end

  describe 'GET /show' do
    before(:each) do
      post = Post.create(title: 'Post 1', text: 'Post 1 content')
      @user.posts << post
      get user_path(@user.id)
    end

    it 'should return http status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should render information and all posts of user in the correct view' do
      expect(response).to render_template(:show)
      expect(response).to_not render_template(:index)
      assert_template 'users/show'
    end

    it 'should include Post 1 short bio and Number of posts:1 in the body' do
      expect(response.body).to include('Post 1')
      expect(response.body).to include('Number of posts: 1')
    end
  end
end
