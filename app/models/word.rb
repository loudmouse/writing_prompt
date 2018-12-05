class Word < ApplicationRecord
  has_many :prompts
  
  def seed!
    Word.create!(word: random_word)
  end

  def random_word
    @random_word ||= word_or_random_word
  end

  def word_or_random_word
    self.word ||= get_random_word
  end

  def definition
    definition = Wordnik.word.get_definitions(word_or_random_word)
    [definition[0]["text"], definition[0]["partOfSpeech"]]
  end

  def get_random_word
    Wordnik.words.get_random_word["word"]
  end
end
