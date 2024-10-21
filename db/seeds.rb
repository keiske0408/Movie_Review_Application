require 'faker'
# Movie.destroy_all
# User.destroy_all
# Genre.destroy_all
# genres = ['Action', 'Comedy', 'Drama', 'Horror', 'Sci-Fi', 'Romance', 'Documentary', 'Thriller']
# genres.each do |genre_name|
#   Genre.create!(name: genre_name)
# end
# Creating users and associated movies
8.times do
  # Fetch existing users
  users = User.all

  # Ensure there are users to associate movies with
  if users.any?
    users.each do |user|
      # Create a movie for each user
      movie = user.movies.create!(
        title: Faker::Movie.title,
        blurb: Faker::Lorem.sentence(word_count: 10),
        date_released: Faker::Date.between(from: '2000-01-01', to: Date.today),
        country_of_origin: Faker::Address.country,
        showing_start: Faker::Date.between(from: DateTime.now, to: DateTime.now + 1.year),
        showing_end: Faker::Date.between(from: DateTime.now + 1.year, to: DateTime.now + 2.years)
      )

      # Assign 3 random genres to the movie
      random_genres = Genre.order('RAND()').limit(3) # Use RANDOM() for PostgreSQL or adjust as needed for MySQL
      movie.genres << random_genres
    end

    puts "Seed data created successfully!"
  else
    puts "No users found. Please create users before seeding movies."
  end
  end




#   # user = User.create!(email: Faker::Internet.email, password: 'qwer4321', password_confirmation: "qwer4321")
#   # puts "Created user id: #{user.id}, email: #{user.email}"
#
#   # Create a movie for each user
#   movie = user.movies.create!(
#     title: Faker::Movie.title,
#     blurb: Faker::Lorem.sentence(word_count: 10),
#     date_released: Faker::Date.between(from: '2000-01-01', to: Date.today),
#     country_of_origin: Faker::Address.country,
#     showing_start: Faker::Date.between(from: DateTime.now, to: DateTime.now + 1.year),
#     showing_end: Faker::Date.between(from: DateTime.now + 1.year, to: DateTime.now + 2.years),
#     user: User.all.sample
#   )
#
#   # Assign 3 random genres to the movie using RAND() for MySQL
#   random_genres = Genre.order('RAND()').limit(3) # Use RAND() for MySQL
#   movie.genres = random_genres
# end
#
# puts "Seed data created successfully!"


