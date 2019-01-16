class DropTwilioClients < ActiveRecord::Migration[5.2]
  def change
    drop_table :twilio_clients
  end
end
