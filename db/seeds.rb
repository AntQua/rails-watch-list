# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

response = URI.open('https://tmdb.lewagon.com/movie/top_rated').read
movies_data = JSON.parse(response)['results']

movies_data.each do |movie_data|
  title = movie_data['title']
  overview = movie_data['overview']
  poster_path = movie_data['poster_path']
  rating = movie_data['vote_average']

  Movie.create!(
    title: title,
    overview: overview,
    poster_url: "https://image.tmdb.org/t/p/w500/#{poster_path}",
    rating: rating
  )
end
