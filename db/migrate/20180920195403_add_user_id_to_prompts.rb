class AddUserIdToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :user_id, :integer
  end
end
