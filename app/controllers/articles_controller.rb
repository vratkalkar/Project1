class ArticlesController < ApplicationController

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was saved successfully."
      redirect_to @article
    else
      flash[:error] = "Error creating article. Please try again."
      render :new
    end
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
      redirect_to @article, notice: 'Wiki was successfully updated.'
    else
      flash[:notice] = "Error saving wiki. Please try again"
      render :edit
    end
  end


  def destroy
    @article = Article.find(params[:id])
    name = @article.name

    if @article.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to @article
    else
      flash[:error] = "There was an error deleting the article."
      render :show
    end
  end

  def show
    @articles = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
