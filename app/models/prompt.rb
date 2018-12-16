class Prompt < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :word

  def term
    word.word
  end

  def word_count
    body.split.count
  end

end
