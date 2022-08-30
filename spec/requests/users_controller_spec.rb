require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template correctly' do
      expect(response).to render_template('show')
    end
    it 'includes correct placeholder text' do
      expect(response.body).to include('Here is details of Users')
    end
  end
end
