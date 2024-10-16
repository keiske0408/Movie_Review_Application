# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Define a list of genres
genres = ['Action', 'Comedy', 'Drama', 'Fantasy', 'Horror', 'Sci-Fi', 'Thriller', 'Romance']

# Create 10 movies with random titles, blurbs, and genres
10.times do
  Movie.create(
    Title: Faker::Movie.title,
    Blurb: Faker::Lorem.sentence(word_count: 10),
    date_released: Faker::Date.between(from: '2000-01-01', to: Date.today),
    country_of_origin: Faker::Address.country,
    showing_start: Faker::Date.between(from: DateTime.now, to: DateTime.now + 1.year),
    showing_end: Faker::Date.between(from: DateTime.now + 1.year, to: DateTime.now + 2.years),
    genre: genres.sample # Randomly select a genre from the list
  )
end

puts "Created #{Movie.count} movies."
