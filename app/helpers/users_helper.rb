module UsersHelper


  def total_words_for_prompts_and_freewrites
    @user.prompts_and_freewrite_word_count
  end

  def total_words_written_by_user
    @user.total_word_count
  end

  def prompts
    @user.prompts
  end

  def total_prompts_written_by_user
    @user.prompts.count
  end

  def average_words_per_prompt_by_user
    @user.total_word_count /   @user.prompts.count
  end

end
