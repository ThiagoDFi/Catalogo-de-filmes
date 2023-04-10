class MovieGenresController < ApplicationController

  def index
    @movie_genre = MovieGenre.all
  end

  def show
    @movie_genre = MovieGenre.find(params[:id])
    
  end

  def new
    @movie_genre = MovieGenre.new
  end

def create
    @movie_genre = MovieGenre.new(genre: params[:movie_genre][:genre])

    if @movie_genre.save
      flash[:notice] = 'informações foram salvadas com sucesso!'
      return redirect_to(new_movie_genre_path)
    end

    render :new
  end

  def edit
    @movie_genre = MovieGenre.find(params[:id])
  end

  def update
    @movie_genre = MovieGenre.find(params[:id])
    if @movie_genre.update(genre: params[:movie_genre][:genre])
      return redirect_to movie_genre_path(@movie_genre.id)
    end
    render :edit
  end

  def movies 
    @movie_genre = MovieGenre.find(params[:id])
    @movies = Movie.where(movie_genre_id: @movie_genre.id)
  end
end