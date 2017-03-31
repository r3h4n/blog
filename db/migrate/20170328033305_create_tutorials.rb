class CreateTutorials < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :description
      t.string :text
      t.string :author

      t.timestamps
    end
  end
end
