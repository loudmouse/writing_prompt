class AddRandomWordToPrompt < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :random_word, :string
  end
end
