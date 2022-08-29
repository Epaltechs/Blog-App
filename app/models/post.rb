class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250, too_long: 'Name must not exceed 250 characters' }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  #   A method that updates the posts counter for a user.

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def recent_five_comments()
    comments.order(created_at: :desc).limit(5)
  end
end
