class LikesController < ApplicationController
  def index
  end

  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark Liked"
      redirect_to bookmark.topic
    else
      flash[:error] = "There was an error liking your bookmark. Please try again."
      redirect_to bookmark.topic
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark was unliked"
      redirect_to bookmark.topic
    else
      flash[:error] = "There was an error unliking the bookmark. Please try again"
      redirect_to bookmark.topic
    end
  end
end
