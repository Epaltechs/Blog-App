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

  describe 'GET #show' do
    before do
      @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                bio: 'Teacher from Mexico.', posts_counter: 1)
      @second_user = User.create(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                 bio: 'Teacher from Poland', posts_counter: 2)
    end
    it 'is a success' do
      get "/users/#{@first_user.id}"
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template correctly' do
      get "/users/#{@first_user.id}"

      expect(response).to render_template('show')
    end
    it 'includes correct placeholder text' do
      get "/users/#{@first_user.id}"

      expect(response.body).to include(@first_user.bio)
    end
  end
end
