class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if @comment.nil?
      @post.comments.create(comment_params)
      flash[:notice] = "コメントが投稿できました"
    else
      flash[:alert] = "名前またはコメントが入っていません"
    end
    redirect_to posts_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :content, :created_at)
  end

end
