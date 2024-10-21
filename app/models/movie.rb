class Movie < ApplicationRecord
  validates :title, presence: true
  validates :blurb, presence: true
  belongs_to :user

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships
  has_many :reviews
end
