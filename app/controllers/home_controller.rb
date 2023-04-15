class HomeController < ApplicationController

  def index
    @movie_genre = MovieGenre.new
    @director = Director.new
    @movies = Movie.published
  end
end