class Prompt < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :word

  def term
    word.word
  end
end
