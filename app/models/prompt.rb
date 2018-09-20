class Prompt < ApplicationRecord
  validates :body, :random_word, presence: true

  belongs_to :user
end
