class AddConjunctionCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :conjunction_count, :integer
  end
end
