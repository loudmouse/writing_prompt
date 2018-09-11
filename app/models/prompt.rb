class Prompt < ApplicationRecord
  validates :body, :random_word, presence: true
end
