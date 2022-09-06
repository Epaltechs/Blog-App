# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#create user data
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 1 )
second_user = User.create(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland', posts_counter: 2 )

# create posts data
Post.create(title: 'Mr', text: 'Hello there!', likes_counter: 0, comments_counter: 0, user_id:1 )
Post.create(title: 'Mr', text: 'Hey friend!', likes_counter: 1, comments_counter: 1, user_id:1 )
Post.create(title: 'Mr', text: 'So good to connect with you!', likes_counter: 2, comments_counter: 2, user_id:1 )
Post.create(title: 'Mr', text: 'Greetings!', likes_counter: 3, comments_counter: 3, user_id:1 )

# Code for fixing the N+1 query problem
Post.includes(:user).each do |post|
puts "#{post.title} was written by #{post.user.id}"
end

# create comments data
Comment.create(post_id: 1, user_id: 1, text: 'Hi Otto')
Comment.create(post_id: 2, user_id: 1, text: 'Greetings Lily')
Comment.create(post_id: 3, user_id: 1, text: 'How are you doing Pearl?')
Comment.create(post_id: 3, user_id: 1, text: 'I trust you guys are good.')
Comment.create(post_id: 4, user_id: 1, text: 'My regards to Virtue')
Comment.create(post_id: 4, user_id: 1, text: 'I hope to see you guys soon')

puts 'Seed data loaded successfully'
