require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:each) do
    @first_user = User.create(name: 'firstuser', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80',
                              bio: 'Teacher from Mexico.', posts_counter: 1)
    @second_user = User.create(name: 'seconduser', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80',
                               bio: 'Teacher from Poland', posts_counter: 2)
    @first_post = Post.create(title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0,
                              user: @first_user)
  end

  it 'show the profile picture of  the user' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_selector("img[src*='#{@first_user.photo}']")
  end

  it 'shows the username of the user' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content(@first_user.name)
  end

  it 'shows number of posts, post counter' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'shows post\'s title' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content(@first_post.title)
  end

  it 'shows post\'s body' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content(@first_post.text)
    expect(page).not_to have_content('michael')
  end

  it 'shows post\'s first comment' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content(@first_post.text)
  end

  it 'shows how many likes a post, likes_counter' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'shows pagination button' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Pagination')
  end

  it 'redirects me to that post\'s show page' do
    visit "/users/#{@first_user.id}/posts"
    click_on @first_post.title
    expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@first_post.id}")
  end
end
