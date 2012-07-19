require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

#includes application controller test

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
    assert_not_nil assigns(:current_controller)
    assert_not_nil assigns(:current_action)    
  end

#rails-built tests

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { 
        approved: @comment.approved, 
        comment: @comment.comment, 
        contact: @comment.contact, 
        name: @comment.name 
      }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    put :update, id: @comment, comment: { approved: @comment.approved, comment: @comment.comment, contact: @comment.contact, name: @comment.name }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to comments_path
  end

# 

  test "admin sees all comments" do
  end
  test "others don't see hire or join posts" do
  end
  test "join, hire show appropriate labels in comments form" do
  end
  test "create redirects with appropriate notices" do
  end
  test "create sends appropriate email" do
  end
  test "update sends appropriate email" do
  end

end
