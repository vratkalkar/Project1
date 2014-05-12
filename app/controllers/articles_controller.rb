class ArticlesController < ApplicationController

  def create
    @article= Article.new(params[:article])

    if @article.save
      flash[:notice] = "Article was saved successfully."
      redirect_to @article
    else
      flash[:error] = "Error creating article. Please try again."
      render :new
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Topic was successfully updated.'
    else
      flash[:error] = "Error saving article. Please try again"
      render :edit
  end

  def destroy
    @article = Article.find(params[:id])
    name = @article.name

    if @article.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to topics_articles_path
    else
      flash[:error] = "There was an error deleting the article."
      render :show
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.all
  end

end
end
end
end
