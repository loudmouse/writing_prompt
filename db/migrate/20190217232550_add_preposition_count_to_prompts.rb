class AddPrepositionCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :preposition_count, :integer
  end
end
