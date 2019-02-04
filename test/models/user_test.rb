require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should be invalid without an email' do
    prompts(:one).email = nil
    assert_nil prompts(:one).email
    assert_equal false, prompts(:one).valid?
  end
end
