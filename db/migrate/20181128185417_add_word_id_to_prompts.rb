class AddWordIdToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :word_id, :integer
  end
end
