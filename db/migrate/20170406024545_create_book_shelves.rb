class CreateBookShelves < ActiveRecord::Migration[5.0]
  def change
    create_table :book_shelves do |t|
      t.integer :tutorial_id
      t.integer :user_id
      t.boolean :completed, :default => false
    end
  end
end
