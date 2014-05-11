require 'test_helper'

class PublishersControllerTest < ActionController::TestCase
  test "index" do
    FactoryGirl.create_list(:publisher, 3)
    get :index
    assert_response :success
    assert_equal 3, assigns(:publishers).size, "@publishers"    
  end

  test "edit" do
    publisher = FactoryGirl.create(:publisher)
    get :edit, :id => publisher
    assert_response :success
  end

  test "update" do
    publisher = FactoryGirl.create(:publisher)
    put :update, :id => publisher, :publisher => { :name => "New Times" }
    assert_redirected_to edit_publisher_path(publisher)
    assert_equal "New Times", publisher.reload.name, "Should update name"
  end
  
  test "test for issue count" do
    FactoryGirl.create(:issue)
    get :index
    assert_select "tr", count: 2
    assert_select "tr td:nth-child(5)", text: "Issues (1)"
  end
end
