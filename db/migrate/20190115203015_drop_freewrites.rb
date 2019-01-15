class DropFreewrites < ActiveRecord::Migration[5.2]
  def change
    drop_table :freewrites
  end
end
