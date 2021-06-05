require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test("should get user") do
    post '/api/v1/users', params: ( { name: 'Sasha' })
    assert_response :success
  end
end
