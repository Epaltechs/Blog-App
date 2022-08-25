class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  
  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end