class AddCategoryIdToTutorials < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :category_id, :integer
  end
end
