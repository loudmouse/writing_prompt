class CreateTwilioClients < ActiveRecord::Migration[5.2]
  def change
    create_table :twilio_clients do |t|

      t.timestamps
    end
  end
end
