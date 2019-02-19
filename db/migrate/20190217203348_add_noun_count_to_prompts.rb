class AddNounCountToPrompts < ActiveRecord::Migration[5.2]
  def change
    add_column :prompts, :nount_count, :integer
  end
end
