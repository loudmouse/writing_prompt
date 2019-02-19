class AddPronounCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :pronoun_count, :integer
  end
end
