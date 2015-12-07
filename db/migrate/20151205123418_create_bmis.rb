class CreateBmis < ActiveRecord::Migration
  def change
    create_table :bmis do |t|
        t.integer :user_id
        t.decimal :value, precision: 4, scale: 2
        t.datetime :datetime

        # t.timestamps null: false
    end
  end
end
