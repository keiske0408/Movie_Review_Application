class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :content, presence: true
  validates :movie_id, presence: true
  validates :user_id, presence: true
end
