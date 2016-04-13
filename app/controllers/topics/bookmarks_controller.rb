class Topics::BookmarksController < ApplicationController
  def show
  end

  def new
    #@topic = Topic.find(params[:id])
    @bookmark = Bookmark.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the bookmark. Please try again."
      render :show
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
       flash[:notice] = "Bookmark was successfully updated."
       redirect_to [@topic]
    else
       flash[:error] = "There was an error saving the bookmark. Please make another attempt."
       render :edit
    end
  end

  def create
    #@topic = Topic.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url))
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was successfully saved!"
      redirect_to @topic
    else
      flash[:error] = "There was an error creating bookmark. Please try again."
      render :new
    end
  end
end
