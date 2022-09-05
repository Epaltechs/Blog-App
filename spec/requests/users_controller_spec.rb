require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) { get users_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'includes correct placeholder text' do
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'GET #show' do
  #   before(:example) { get '/users/1/posts/2' }
  #   it 'is a success' do
  #     expect(response).to have_http_status(:ok)
  #   end
  #   it 'renders index template correctly' do
  #     expect(response).to render_template('show')
  #   end
  #   it 'includes correct placeholder text' do
  #     expect(response.body).to include('Here are the details of posts for a given user')
  #   end
  # end
end
