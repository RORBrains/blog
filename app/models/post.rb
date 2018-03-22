class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :commentators, through: :comments, source: :user
end
