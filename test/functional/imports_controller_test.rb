require 'test_helper'

class ImportsControllerTest < ActionController::TestCase
  test "should get index" do
    publisher = FactoryGirl.create(:publisher)
    import = FactoryGirl.create(:import, publisher: publisher)

    # another publisher's advertisers
    FactoryGirl.create(:import)

    get :index, :publisher_id => publisher.to_param
    assert_response :success
    assert_equal [ import ], assigns(:imports), "Should show only current publisher's imports"
  end
  
  
  test "Update import should update value" do
    import = FactoryGirl.create(:import)
    put :update, id: import, import: { field_transforms: "" }
    assert_redirected_to edit_import_path(import)
  end
end
