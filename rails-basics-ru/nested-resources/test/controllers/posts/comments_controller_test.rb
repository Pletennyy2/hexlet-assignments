require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = post_comments(:one)
  end

  test "should get index" do
    get post_post_comments_url(post_id: @post.id)
    assert_response :success
  end

  test "should get new" do
    get new_post_post_comment_url(post_id: @post.id)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('PostComment.count') do
      post post_post_comments_url(post_id: @post.id), params: { post_comment: { content: @comment.content } }
    end

    assert_redirected_to post_url(@post)
  end

  test "should get edit" do
    get edit_post_post_comment_url(post_id: @post.id, id: @comment.id)
    assert_response :success
  end

  test "should update comment" do
    patch post_post_comment_url(post_id: @post.id, id: @comment.id), params: { post_comment: { content: @comment.content } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy comment" do
    assert_difference('PostComment.count', -1) do
      delete post_post_comment_url(post_id: @post.id, id: @comment.id)
    end

    assert_redirected_to post_url(@post)
  end
end
