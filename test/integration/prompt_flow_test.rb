require 'test_helper'

class PromptFlowTest < ActionDispatch::IntegrationTest
  test "can see the prompt#index as home page" do
    get "/"
    assert_select "h1", "Prompt/Index"
  end
end
