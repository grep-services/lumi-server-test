class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
        t.integer :user_id
        t.string :timestamp_on
        t.string :timestamp_off
      # t.timestamps null: false
    end
  end
end
