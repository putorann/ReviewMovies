class MoviesController < ApplicationController

   def create
    @movie = Movie.new(movie_params)
    @movies = Movie.all
    @movie.user_id = current_user.id
    @user = current_user
   if @movie.save
    flash[:notice] = "You have created book successfully."
    redirect_to movie_path(@movie.id)
   else
    render :index
   end
   end

  def index
    @movie = Movie.new
    @movies = Movie.all
    @user = current_user
  end


  def show
    @new_movie = Movie.new
    @movie = Movie.find(params[:id])
    @user = @movie.user
  end

  def edit
    @movie = Movie.find(params[:id])
    if @movie.user == current_user
      render "edit"
    else
      redirect_to movies_path
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to movie_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @movies = Movie.find(params[:id])
    @movies.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :body)
  end
end