class AddVerbCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :verb_count, :integer
  end
end
