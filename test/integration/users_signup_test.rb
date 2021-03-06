class UsersSignupTest < ActionDispatch::IntegrationTest


  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid"} }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end
  
  test "valid signup information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
  
  
end