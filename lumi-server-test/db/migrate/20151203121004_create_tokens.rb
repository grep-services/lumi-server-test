class CreateToken < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
        t.string            :access_token
        t.datetime       :expires_at
        t.integer          :user_id

        t.timestamps null: false
    end
  end
end