json.extract! movie, :id, :Title, :Blurb, :date_released, :country_of_origin, :showing_start, :showing_end, :created_at, :updated_at
json.url movie_url(movie, format: :json)
