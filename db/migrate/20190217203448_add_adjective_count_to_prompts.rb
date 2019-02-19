class AddAdjectiveCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :adjective_count, :integer
  end
end
