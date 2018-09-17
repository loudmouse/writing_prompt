require 'test_helper'

class PromptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prompts_url
    assert_response :success
  end

  test "should get new" do
    get "/prompts/new"
    assert_response :success
  end

  test "should get show" do
   assert_generates "prompts/1", { controller: "prompts", action: "show", id: "1" }
  end
end
