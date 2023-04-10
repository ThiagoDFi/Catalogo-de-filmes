class DirectorsController < ApplicationController

  def index
    @directors = Director.all
  end

  def new
    @director = Director.new
  end

  def show
    @director = Director.find(params[:id])
  end

  def create
    @director = Director.new(name: params[:director][:name],
                            nationality: params[:director][:nationality],
                            date_of_birth: params[:director][:date_of_birth],
                            movie_genre_id: params[:director][:movie_genre_id])
                            

    if @director.save
      redirect_to director_path(@director.id)
    else
      render :new
    end
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    if @movie.update(name: params[:director][:name],
                    nationality: params[:director][:nationality],
                    date_of_birth: params[:director][:date_of_birth],
                    movie_genre_id: params[:director][:movie_genre_id])

      return redirect_to director_path(@movie.id) 
    end
    render :edit
  end

  def movies
    @director = Director.find(params[:id])
    @movies = Movie.where(director_id: @director.id)
  end
end