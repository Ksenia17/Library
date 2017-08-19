class CreateBookHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :book_histories do |t|
      t.integer :request_id
      t.integer :book_item_id
      t.integer :user_id
      t.datetime :owned_from
      t.datetime :owned_to, null: true
     
      t.references :user, index: true
      t.references :book_item, index: true  
      t.references :book_request, index: true  
    end
  end
end
