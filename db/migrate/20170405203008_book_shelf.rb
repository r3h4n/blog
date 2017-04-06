class BookShelf < ActiveRecord::Migration[5.0]
  def change
    create_table :bookshelf do |t|
      t.integer :tutorial_id
      t.integer :user_id
      t.boolean :completed, :default => false
      t.timestamps
  end
  end
end