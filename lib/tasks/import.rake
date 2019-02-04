require 'csv'

namespace :import do
  desc 'Import words from csv'
  task words: :environment do
    word_count = 0
    CSV.foreach('words.csv', headers: true) do |row|
      word = Word.create(row.to_hash)
      word_count += 1 if word.persisted?
    end
    puts "You've added #{word_count} words to the database."
  end
end
