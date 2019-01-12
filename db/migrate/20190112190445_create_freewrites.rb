class CreateFreewrites < ActiveRecord::Migration[5.2]
  def change
    create_table :freewrites do |t|
      t.text :body

      t.timestamps
    end
  end
end
