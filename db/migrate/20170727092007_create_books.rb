class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.oid :picture
      t.integer :book_type_id
      t.integer :user_id
      t.date :year_book

      t.references :user, index: true
      t.references :book_type, index: true  
      t.timestamps
    end
  end
end
