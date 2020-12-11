class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.integer :location_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.text :note

      t.timestamps
    end
  end
end
