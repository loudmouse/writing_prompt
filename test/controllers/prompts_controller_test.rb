require 'test_helper'

class PromptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prompts_url
    assert_response :success
  end
end
