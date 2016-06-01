class AddAttachmentImageToPrizes < ActiveRecord::Migration
  def self.up
    change_table :prizes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :prizes, :image
  end
end
