require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @first_user = User.create(name: 'firstuser', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80',
                              bio: 'Teacher from Mexico.', posts_counter: 1)
    @second_user = User.create(name: 'seconduser', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80',
                               bio: 'Teacher from Poland', posts_counter: 2)
  end

  it 'can see profile picture for each user' do
    visit "/users/#{@first_user.id}"
    expect(page).to have_selector("img[src*='#{@first_user.photo}']")
  end

  it 'shows correct username' do
    visit "/users/#{@first_user.id}"
    expect(page).to have_content(@first_user.name)
    expect(page).not_to have_content('Emmanuel')
  end

  it 'shows number of posts, post counter' do
    Post.create(title: 'Hello', text: 'This is my first post', user: @first_user)
    Post.create(title: 'Hello2', text: 'This is my second post', user: @first_user)
    visit "/users/#{@first_user.id}"
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end

  it 'shows user\'s bio ' do
    visit "/users/#{@first_user.id}"
    expect(page).to have_content(@first_user.bio)
  end

  it 'shows three recent posts' do
    first_post = Post.create(title: 'Mr', text: 'Hello there!', likes_counter: 0, comments_counter: 0,
                             user: @first_user)
    second_post = Post.create(title: 'Mr', text: 'Hey friend!', likes_counter: 1, comments_counter: 1,
                              user: @first_user)
    third_post = Post.create(title: 'Mr', text: 'So good to connect with you!', likes_counter: 2, comments_counter: 2,
                             user: @first_user)
    fourth_post = Post.create(title: 'Mr', text: 'Greetings!', likes_counter: 3, comments_counter: 3, user: @first_user)
    visit "/users/#{@first_user.id}"
    expect(page).to have_content(second_post.text)
    expect(page).to have_content(third_post.text)
    expect(page).to have_content(fourth_post.text)
    expect(page).not_to have_content(first_post.text)
  end

  it 'directs you the users profile page' do
    visit "/users/#{@first_user.id}"
    click_link 'See all posts'
    expect(page).to have_current_path("/users/#{@first_user.id}/posts")
  end

  it 'redirects me to that post\'s show page' do
    first_post = Post.create(title: 'Mr', text: 'Hello there!', likes_counter: 0, comments_counter: 0,
                             user: @first_user)
    visit "/users/#{@first_user.id}"
    click_on first_post.title
    expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{first_post.id}")
  end
end
