class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :word, null: false
      t.timestamps
    end
  end
end
