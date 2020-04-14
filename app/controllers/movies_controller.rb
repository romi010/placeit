class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movies = Movie.new
  end

  def show
  end

  def create
    @movies = Movie.new(movie_params)

    if @movies.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movies = Movie.find(params[:id])  
  end
  
  def update
    @movies = Movie.find(params[:id])

    if @movies.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :description, :url)
    end
end
