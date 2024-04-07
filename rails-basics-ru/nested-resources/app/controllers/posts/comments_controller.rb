class Posts::CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]
  before_action :set_post, only: %i[create]

  def edit # rubocop:disable Style/EmptyMethod
  end

  def create
    @comment = PostComment.new(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post), notice: "Comment was successfully created."
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: "Post comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy!

    redirect_to post_path(@comment.post), notice: "Post comment was successfully destroyed."
  end

  private
    def set_comment
      @comment = PostComment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:post_comment).permit(:body)
    end
end
