class AddAttachmentTutorialImgToTutorials < ActiveRecord::Migration
  def self.up
    change_table :tutorials do |t|
      t.attachment :tutorial_img
    end
  end

  def self.down
    remove_attachment :tutorials, :tutorial_img
  end
end
