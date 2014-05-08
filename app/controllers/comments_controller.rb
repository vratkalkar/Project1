class CommentsController < ApplicationController

  def create
    @topic = Topic.find( params [:topic_id])
    @article = @topic.posts.find( params[:article_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params)
    @comment.article = @article
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @article = @topic.articles.find(params[:post_id])

    @comment = @article.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment was deleted."
    else
      flash[:error] = "Comment couldn't be deleted. Please try again."
  end
end

private 

def comment_params
  params.require(:comment).permit(
    :body
    :article_id
    )
 end

end
