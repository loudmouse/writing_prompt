module PromptsHelper
  def link_to_prompt(prompt)
    link_to "#{prompt.random_word}", prompt
  end

  def time_display(datetime)
    datetime.strftime("Created on %A, %m/%d/%Y")
  end

end
