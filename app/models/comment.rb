class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #   A method that updates the comments counter for a user.

  def update_comment_counter
    post.increment(:comments_counter)
  end
end
