class AddPublishDateToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :publish_date, :date
  end
end
