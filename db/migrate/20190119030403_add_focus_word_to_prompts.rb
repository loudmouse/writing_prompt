class AddFocusWordToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :focus_word, :string
  end
end
