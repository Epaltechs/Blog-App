require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'is a success' do
      get user_posts_path(1)
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template correctly' do
      get user_posts_path(1)
      expect(response).to render_template('index')
    end
    it 'includes correct placeholder text' do
      get user_posts_path(1)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  describe 'GET #show' do
    before(:example) { get '/users/1/posts/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template correctly' do
      expect(response).to render_template('show')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('Here is details of posts for a given user')
    end
  end
end
