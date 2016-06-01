class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name, :limit => 150
      t.string :description, :limit => 255
      t.integer :quantity
      t.string :ref, :limit => 80
    end
  end
end
