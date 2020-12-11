class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.integer :age
      t.text :bio
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode

      t.timestamps
    end
  end
end
