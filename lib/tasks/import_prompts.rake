require 'csv'



desc "Import prompts from old system with csv"
task import_prompts: :environment do

  prompt_count = 0
  CSV.foreach("prompts.csv", headers: true) do |row|
    prompt = Prompt.create(row.to_hash)
    prompt_count += 1 if prompt.persisted?
  end

  puts "You've added #{prompt_count} prompts to the database."


end
