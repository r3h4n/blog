class AddAttachmentUserImgToUsers < ActiveRecord::Migration[5.0]
  def change
      def self.up
    change_table :users do |t|
      t.attachment :user_img
    end
  end

  def self.down
    remove_attachment :users, :user_img
  end
  end
end
