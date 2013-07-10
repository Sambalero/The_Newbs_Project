require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment1 = comments(:one)
    @comment2 = comments(:two)
    @user = User.new(name: "Bill",
                    email: "Bill@Home",
                    role: "member",
                    approval: true,
                    password: "password",
                    password_confirmation: "password")
    @user.save
    @user2 = User.new(name: "Bob",
                    email: "Bob@Home",
                    role: "admin",
                    approval: true,
                    password: "password",
                    password_confirmation: "password")
    @user2.save
  end

#includes application controller test

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
    assert_not_nil assigns(:current_controller)
    assert_not_nil assigns(:current_action)    
  end


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

 



  test "create redirects with appropriate notice" do
    post :create, comment: { 
      approved: false, 
      comment: "here's a job", 
      contact: @comment1.contact, 
      name: @comment1.name, 
    }
    assert_redirected_to comment_path(assigns(:comment))
    assert_equal(flash[:notice], "Comment logged." )  
  end

  test "create sends appropriate email" do
    email_count = ActionMailer::Base.deliveries.length
    post :create, comment: { 
      approved: @comment1.approved, 
      comment: @comment1.comment, 
      contact: @comment1.contact, 
      name: @comment1.name, 
    }

    assert ActionMailer::Base.deliveries.length == email_count + 1

    email = ActionMailer::Base.deliveries[email_count]
    assert_equal "MyName1 Noobs Comment Posted", email.subject
    assert_match(/MyText1/, email.encoded)
  end



end
