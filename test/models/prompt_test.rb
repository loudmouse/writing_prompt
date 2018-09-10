require 'test_helper'

class PromptTest < ActiveSupport::TestCase
  test "should be invalid without a body" do
    prompt(:one).body = nil
    assert_nil prompt(:one).title
    assert_equal false, prompts(:one).valid?
  end
end
