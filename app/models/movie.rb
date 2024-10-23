class Movie < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  before_save :generate_slug
  validates :title, presence: true
  validates :blurb, presence: true
  belongs_to :user

  has_many :movie_genre_ships
  has_many :genres, through: :movie_genre_ships
  has_many :reviews

  def destroy
    update(deleted_at: Time.now)
  end

  def average_rating
    return 0 if reviews.empty? # Avoid division by zero
    reviews.average(:rating).round(2) # Round to 2 decimal places
  end

  def to_param
    slug
  end

  private

  def generate_slug
    begin
      self.slug = SecureRandom.urlsafe_base64(5)
    end while Movie.exists?(slug: slug)
  end
end



