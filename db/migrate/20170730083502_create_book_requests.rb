class CreateBookRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :book_requests do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :complete_time
      t.boolean :approved_flg
      t.integer :admin_user_id, null: true

      t.timestamps
    end
  end
end
