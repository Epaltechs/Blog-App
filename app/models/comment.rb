class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #   A method that updates the comments counter for a user.

  def update_comments_counter
    posts.increment(:comments_counter)
  end
end