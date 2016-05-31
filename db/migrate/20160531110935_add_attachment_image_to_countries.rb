class AddAttachmentImageToCountries < ActiveRecord::Migration
  def self.up
    change_table :countries do |t|
      t.attachment :image, :after => :description
    end
  end

  def self.down
    remove_attachment :countries, :image
  end
end
