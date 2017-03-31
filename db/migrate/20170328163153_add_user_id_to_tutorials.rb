class AddUserIdToTutorials < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :user_id, :integer
  end
end
