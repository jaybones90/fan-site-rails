class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @pop_movies = Movie.popular
    if (params[:filter] === "alpha")
      @movies = Movie.alpha
    elsif (params[:filter] === "date")
      @movies = Movie.date
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

private
  def movie_params
    params.require(:movie).permit(:title)
  end


end
