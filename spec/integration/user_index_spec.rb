require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', posts_counter: 1)
    @second_user = User.create(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland',
                               posts_counter: 2)
  end
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      sleep(5)
      expect(page).to have_content(@first_user.name)
      expect(page).not_to have_content('Emmanuel')
    end

    # it 'shows the number of posts each user has written' do
    #   expect(page).to have_content(Post.all.count)
    # end
    # it 'when user is clicked, it should be redirected to user show page' do
    #   User.all.each do |i|
    #     click_link i.name
    #     expect(page).to have_current_path("/users/#{i.id}")
    #   end
    # end
    # it 'can see profile picture for each user' do
    #   User.all.each do |_i|
    #     expect(page.find('#profile-avatar')['alt']).to eq('random image')
    #   end
  end
end
