class AddUserIdToFreeWrites < ActiveRecord::Migration[5.2]
  def change
    add_column :freewrites, :user_id, :integer
  end
end
