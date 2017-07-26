class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      
      t.string :login
      t.string :password
      t.string :email
      t.date :birthdate
      t.string :first_name
      t.string :last_name
      t.datetime :confirmation_time
      t.integer :role_id
      t.integer :confirmation_by_admin_id
      t.integer :level
      t.datetime :end_time
      t.datetime :penalty_time

      t.timestamps
    end
  end
end
