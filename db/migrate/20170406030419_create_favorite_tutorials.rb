class CreateFavoriteTutorials < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_tutorials do |t|
      t.integer :tutorial_id
      t.integer :user_id

      t.timestamps
    end
  end
end
