class AddSentenceCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :sentence_count, :integer
  end
end
