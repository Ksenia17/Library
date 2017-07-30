class CreateBookHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :book_histories do |t|
      t.integer :request_id
      t.integer :book_item_id
      t.integer :user_id
      t.datetime :owned_from
      t.datetime :owned_to, null: true
     
    end
  end
end
