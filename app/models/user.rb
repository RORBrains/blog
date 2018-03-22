class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true

  has_many :posts # posts user_id
  has_many :comments # comments user_id
  has_many :commented_posts, through: :comments, source: :post
end
