require 'test_helper'

class PromptsHelperTest < ActionView::TestCase

  test "link_to_prompt helper should get correct path" do
    prompt = prompts(:one)
    asser_dom_equal %{<a href="/prompts/#{prompt.id}">RandomWordString</a>}, link_to_prompt(prompt)
  end

end
