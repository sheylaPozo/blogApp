RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before { get user_posts_path(1) }

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
    before { get user_post_path(1, 1) }

    it 'should have response status correct(ok)' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Username: Comment 1')
    end
  end
end
