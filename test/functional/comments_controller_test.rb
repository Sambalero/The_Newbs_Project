require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment1 = comments(:one)
    @comment2 = comments(:two)

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
        approved: @comment1.approved, 
        comment: @comment1.comment, 
        contact: @comment1.contact, 
        name: @comment1.name, 
        source: "comment"
      }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, id: @comment1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment1
    assert_response :success
  end

  test "should update comment" do
    put :update, id: @comment1, comment: { approved: @comment1.approved, comment: @comment1.comment, contact: @comment1.contact, name: @comment1.name }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment1
    end

    assert_redirected_to comments_path
  end

# 

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "admin sees all comments" do
    get :admin
    assert_response :success
    assert(assigns(:comments).include?(@comment1))
  end

  test "others don't see hire or join posts" do
    @comment1[:source] = "hire"
    @comment2[:source] = "join"
    assert_response :success
    assert_nil(assigns(:comments))
  end

  test "hire shows appropriate labels in comments form" do
 
    get :hire
    assert_equal(assigns(:button_label), "Send Job Request")   
  end

  test "create redirects with appropriate notices" do
    post :create, comment: { 
      approved: false, 
      comment: "here's a job", 
      contact: @comment1.contact, 
      name: @comment1.name, 
      source: "hire"
    }
    assert_redirected_to comment_path(assigns(:comment))
    assert_equal(flash[:notice], "hire was successfully created.")  

    post :create, comment: { 
      approved: false, 
      comment: "hire me", 
      contact: @comment1.contact, 
      name: @comment1.name, 
      source: "join"
    }
    assert_redirected_to comment_path(assigns(:comment))
    assert_equal(flash[:notice], "join was successfully created.")  

    post :create, comment: { 
      approved: @comment1.approved, 
      comment: @comment1.comment, 
      contact: @comment1.contact, 
      name: @comment1.name, 
      source: "comment"
    }
    assert_equal(flash[:notice], "comment was successfully created.")  

  end

  test "create sends email" do
    pending
  end

  test "create sends appropriate email" do
  end
  
  test "update sends appropriate email" do
  end
  test "destroy sends appropriate email" do
  end

end
