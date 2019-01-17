class AddSmsAlertsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sms_alerts, :boolean
  end
end
