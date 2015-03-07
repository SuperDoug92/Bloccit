class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    if favorite.save
      flash[:notice] = "Favorite saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error. Please try again."
      render 'posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite
    if favorite.destroy
      flash[:notice] = "Unfavorited."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error. Please try again."
      render 'posts/show'
    end
  end
end
