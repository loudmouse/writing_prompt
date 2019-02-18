class FixNountCountName < ActiveRecord::Migration[5.2]
  def change
    rename_column :prompts, :nount_count, :noun_count
  end
end
