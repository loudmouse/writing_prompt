class Prompt < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :word

  def term
    word.word
  end

  def word_count
    body = self.body
    words = body.split(" ")
    word_count = words.count
    return word_count
  end

end
