class TopicsController < ApplicationController

  def create
    @topic= Topic.new

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update
      redirect_to @topic, notice: 'Topic was successfully updated.'
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    name = @topic.name

    if @topic.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def index
  end
  
end
