class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_comments_counter

  private

  #   A method that updates the comments counter for a user.

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
