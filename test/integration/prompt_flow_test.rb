require 'test_helper'

class PromptFlowTest < ActionDispatch::IntegrationTest
  test "can see the prompt#index as home page" do
    get "/"
    assert_select "h1", "Daily Writing Prompts"
  end

  test "can create a prompt" do
    get "/prompts/new"
    assert_response :success

    post "/prompts",
      params: { prompt: { random_word: "road trip", body: "On the road again..."}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h2", "road trip"
  end

  test "can see form on prompt#new" do
    get "/prompts/new"
    assert_select "form" do |elements|
      elements.each do |element|
        assert_select element, "input", 4
      end
    end
  end
end
