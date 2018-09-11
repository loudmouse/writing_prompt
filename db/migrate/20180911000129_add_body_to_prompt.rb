class AddBodyToPrompt < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :body, :text
  end
end
