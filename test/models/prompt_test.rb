require 'test_helper'

class PromptTest < ActiveSupport::TestCase
  test "should be invalid without a body" do
    prompts(:one).body = nil
    assert_nil prompts(:one).body
    assert_equal false, prompts(:one).valid?
  end
end
