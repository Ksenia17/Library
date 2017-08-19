class CreateBookItems < ActiveRecord::Migration[5.1]
  def change
    create_table :book_items do |t|
      t.integer :book_id
      t.integer :user_id
      t.datetime :archived_at, null: true

      t.references :user, index: true
      t.references :book, index: true  
      t.timestamps
    end
  end
end
