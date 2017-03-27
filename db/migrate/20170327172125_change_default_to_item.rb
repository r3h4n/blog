class ChangeDefaultToItem < ActiveRecord::Migration[5.0]
  def change
    change_column_default :items, :is_done, false
  end
end
