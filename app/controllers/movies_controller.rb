class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(title: params[:movie][:title],
                      release_year: params[:movie][:release_year],
                      country: params[:movie][:country],
                      synopsis: params[:movie][:synopsis],
                      duration: params[:movie][:duration],
                      director_id: params[:movie][:director_id],
                      movie_genre_id: params[:movie][:movie_genre_id],
                      poster: params[:movie][:poster])

    if params[:movie][:poster].present?
      poster = params[:movie][:poster]
      File.open(Rails.root.join('public', 'uploads', poster.original_filename), 'wb') do |file|
        file.write(poster.read)
      end
      @movie.poster = poster.original_filename
    end

    if @movie.save
      return redirect_to movie_path(@movie.id)
    end
    render :new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(title: params[:movie][:title],
                    release_year: params[:movie][:release_year],
                    country: params[:movie][:country],
                    synopsis: params[:movie][:synopsis],
                    duration: params[:movie][:duration],
                    director_id: params[:movie][:director_id],
                    movie_genre_id: params[:movie][:movie_genre_id],
                    poster: params[:movie][:poster])

      return redirect_to movie_path(@movie.id)                 
    end
    render :edit
  end
end