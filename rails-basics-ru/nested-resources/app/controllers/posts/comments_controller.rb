class Posts::CommentsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @comments = @post.post_comments
  end
  def new
    @comment = @post.post_comments.new
  end

  def create
    @comment = @post.post_comments.new(comment_params)

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def edit
    @comment = @post.post_comments.find(params[:id])
  end

  def update
    @comment = @post.post_comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment = @post.post_comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: 'Comment was successfully deleted.'
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content)
  end
end
