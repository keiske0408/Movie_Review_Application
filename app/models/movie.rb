class Movie < ApplicationRecord
  validates :title, presence: true
  validates :blurb, presence: true
  belongs_to :user

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships
  has_many :reviews

  def average_rating
    return 0 if reviews.empty? # Avoid division by zero
    reviews.average(:rating).round(2) # Round to 2 decimal places
  end
end
