class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'user_id'
  has_many :comments, dependent: :destroy, foreign_key: 'user_id'
  has_many :likes, dependent: :destroy, foreign_key: 'user_id'
  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    post.order(created_at: :desc).limit(3)
  end
end