class UsersController < ApplicationController

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
    @users = User.all
  end


  def show
    @movie = Movie.new
    @user = User.find(params[:id])
    @movies = @user.movies
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end