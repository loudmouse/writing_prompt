module PromptsHelper

  def prompt
    @prompt
  end

  def time_display(datetime)
    datetime.strftime('on %A, %m/%d/%Y.')
  end

  def word_of_the_day
    @prompt.term
  end

  def body
    @prompt.body
  end

  def word_count
    @prompt.word_count
  end

  def definition
    @prompt.word.definition[0]
  end

  def this_user
    @prompt.user
  end

end
