class AddAdverbCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :adverb_count, :integer
  end
end
