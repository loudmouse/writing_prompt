module PromptsHelper
  def link_to_prompt(prompt)
    link_to "#{prompt.random_word}", prompt
  end
end
