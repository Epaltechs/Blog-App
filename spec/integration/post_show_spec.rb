require 'rails_helper'

RSpec.describe 'Users/posts/id page', type: :system do
  before do
    @first_user = User.create(name: 'firstuser', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80',
                              bio: 'Teacher from Mexico.', posts_counter: 1)
    @second_user = User.create(name: 'seconduser', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80',
                               bio: 'Teacher from Poland', posts_counter: 2)
    @first_post = Post.create(title: 'Mr', text: 'Hello there!', likes_counter: 0, comments_counter: 2,
                              user: @first_user)
    @second_post = Post.create(title: 'Mr', text: 'Hey friend!', likes_counter: 1, comments_counter: 1,
                               user: @first_user)
    @first_comment = Comment.create(post: @first_post, user: @first_user, text: 'Hi Otto')
    @second_comment = Comment.create(post: @first_post, user: @first_user, text: 'Greetings Lily')
  end
  it 'shows post\'s title' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.title)
  end

  it 'shows who wrote the post' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.user.name)
  end

  it 'shows how many comments made on a post, comments_counter' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Comments: 2')
  end

  it 'shows how many likes made on a post, likes_counter' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Likes: 0')
  end

  it 'shows post\'s body' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text)
    expect(page).not_to have_content('michael schumaer')
  end

  it 'shows commentator\s name' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_comment.user.name)
    expect(page).not_to have_content('Michael')
  end

  it 'shows each commentator\s each comment' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_comment.text)
    expect(page).to have_content(@second_comment.text)
    expect(page).not_to have_content('Michael')
  end
end
