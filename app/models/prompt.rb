class Prompt < ApplicationRecord
  validates :body, presence: true
end
