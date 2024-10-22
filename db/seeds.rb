# #--------------------> Destroy data ----------------------
# # Movie.destroy_all
# # User.destroy_all
# # Genre.destroy_all
# # Review.destroy_all  # Add this to delete existing reviews if you want to reset them
#
# #--------------------> Generate genre ----------------------
# # genres = ['Action', 'Comedy', 'Drama', 'Horror', 'Sci-Fi', 'Romance', 'Documentary', 'Thriller']
# # genres.each do |genre_name|
# #   Genre.create!(name: genre_name)
# #   puts "#{genre_name} genre created"
# # end
#
# #--------------------> Create user ----------------------
# 8.times do
#   # user = User.create!(email: Faker::Internet.email, password: 'qwer4321', password_confirmation: "qwer4321")
#   # puts "Created user id: #{user.id}, email: #{user.email}"
#
#   #-------------------> Attach user and create movie ----------------------
#   # Fetch existing users
#   users = User.all
#   # Ensure there are users to associate movies with
#   if users.any?
#     users.each do |user|
#       movie = user.movies.create!(
#         title: Faker::Movie.title,
#         blurb: Faker::Lorem.sentence(word_count: 10),
#         date_released: Faker::Date.between(from: '2000-01-01', to: Date.today),
#         country_of_origin: Faker::Address.country,
#         showing_start: Faker::Date.between(from: DateTime.now, to: DateTime.now + 1.year),
#         showing_end: Faker::Date.between(from: DateTime.now + 1.year, to: DateTime.now + 2.years)
#       )
#
#       #-------------------> Attach user and create movie genres ----------------------
#       random_genres = Genre.order('RAND()').limit(3) # Use RANDOM() for PostgreSQL or adjust as needed for MySQL
#       movie.genres << random_genres
#
#       # Generate random ratings for this movie (5 random reviews)
#       5.times do
#         rating = rand(1..5) # Random rating between 1 and 5
#         comment = Faker::Lorem.sentence(word_count: 10)
#         review = Review.create!(
#           user: users.sample, # Pick a random user
#           movie: movie,
#           rating: rating,
#           comment: comment
#         )
#         puts "Created review for movie #{movie.title}: Rating #{rating}, Comment: #{comment}"
#       end
#     end
#     puts "Seed data created successfully!"
#   else
#     puts "No users found. Please create users before seeding movies."
#   end
# end

#--------------------> Destroy data ----------------------
# Review.destroy_all  # Uncomment this to delete existing reviews if you want to reset them

# Fetch existing movies and users
#--------------------> Destroy data ----------------------
# Review.destroy_all  # Uncomment this to delete existing reviews if you want to reset them

# Fetch existing movies and users
Review.destroy_all
movies = Movie.all
users = User.all

# Ensure there are movies and users to associate ratings with
if movies.any? && users.any?
  movies.each do |movie|
    # Generate random reviews for each movie
    5.times do
      rating = rand(1..5) # Random rating between 1 and 5
      content = Faker::Lorem.sentence(word_count: 10)  # Use 'content' instead of 'comment'

      # Create review for the movie and associate it with a random user
      review = Review.create!(
        user_id: users.sample.id,  # Use user_id (not user)
        movie_id: movie.id,        # Use movie_id (not movie)
        rating: rating,
        content: content  # Use 'content' instead of 'comment'
      )
      puts "Created review for movie #{movie.title}: Rating #{rating}, Content: #{content}"
    end
  end
  puts "Seed data (ratings and reviews) created successfully!"
else
  puts "No movies or users found. Please ensure that movies and users exist before running the seed."
end

