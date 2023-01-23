class FavoritesController < ApplicationController

  def create
    #post_image = PostImage.find(params[:post_image_id])
    #favorite = current_user.favorites.new(post_image_id: post_image.id)
    #favorite.save
    #redirect_to post_image_path(post_image)
    @movie = Movie.find(params[:movie_id])
    favorite = Favorite.new(user_id: current_user.id, movie_id: @movie.id)
    favorite.save!

    redirect_to request.referer
  end

  def destroy
    #post_image = PostImage.find(params[:post_image_id])
    #favorite = current_user.favorites.find_by(post_image_id: post_image_id)
    #favorite.destroy
    #redirect_to post_image_path(post_image)
    @movie = Movie.find(params[:movie_id])
    favorite = Favorite.find_by(user_id: current_user.id, movie_id: @movie.id)
    favorite.destroy!

    redirect_to request.referer
  end

end
