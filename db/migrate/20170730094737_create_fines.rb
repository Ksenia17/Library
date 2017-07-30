class CreateFines < ActiveRecord::Migration[5.1]
  def change
    create_table :fines do |t|
      t.integer :user_id
      t.datetime :end_time
      t.integer :book_history_id
      t.integer :admin_user_id, null: true

      t.timestamps
    end
  end
end
