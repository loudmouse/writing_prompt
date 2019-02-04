# Determines if prompt uses a word of the day or is a free write.
class Prompt < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :word, optional: true

  def free?
    !word.present?
  end

  def term
    word.word
  end

  def word_count
    body.split.count
  end

end
