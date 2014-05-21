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
    @article = Article.friendly.find(params[:id])
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
    @article = Article.friendly.find(params[:id])
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
    @article = Article.friendly.find(params[:id])

     respond_to do |format|
      format.html
      format.pdf do 
        if current_user.already_bought?(@article)
          doc_raptor_send
        else
          redirect_to topic_article_url(@topic, @article, format: "html"), error: "You need to buy that first"
        end
      end
    end
  end


def doc_raptor_send(options = { })
      default_options = {
         :name => controller_name,
         :document_type => request.format.to_sym,
         :test => ! Rails.env.production?,
  }

     options = default_options.merge(options)
     options[:document_content] ||= render_to_string
     ext = options[:document_type].to_sym

    response = DocRaptor.create(options)
    if response.code == 200
        send_data response, :filename => "#{options[:name]}.#{ext}", :type => ext
    else
      render :inline => response.body, :status => response.code
  end
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




