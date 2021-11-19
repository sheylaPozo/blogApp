require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(name: 'Cork', photo: 'www.google.com') }
  describe 'GET #index' do
    before { get users_path }

    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before { get user_path(user) }

    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('See all posts')
    end
  end
end
