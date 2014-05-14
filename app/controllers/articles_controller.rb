class ArticlesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @article = Article.new(article_params)
    @article.topic = @topic
    if @article.save
      flash[:notice] = "Article was saved successfully."
      redirect_to topic_url(@topic)
    else
      flash[:error] = "Error creating article. Please try again."
      render :new
    end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Wiki was successfully updated.'
    else
      flash[:notice] = "Error saving wiki. Please try again"
      render :edit
    end
  end


  def destroy
    @article = Article.find(params[:id])
    title = @article.title
    redirect_to topics_path

    if @article.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
    else
      flash[:error] = "There was an error deleting the article."
      render :show
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @article = Article.find(params[:id])
  end


  def index
    @topic = Topic.find(params[:topic_id])
    @articles = Article.all
end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end




