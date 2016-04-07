class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
    @topic.save!
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Your topic was saved successfully!"
      redirect_to @topic
    else
      flash[:error] = "There was an error creating your topic. Please make another attempt."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "Oops. There was error deleting your topic. Please try again. "
      render :show
    end
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(params.require(:topic).permit(:title))
      flash[:notice] = "Topic saved!"
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

end
