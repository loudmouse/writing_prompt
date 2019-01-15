class RemoveRandomWordFromPrompts < ActiveRecord::Migration[5.2]
  def change
    remove_column :prompts, :random_word
  end
end
