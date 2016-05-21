class CreateStades < ActiveRecord::Migration
  def change
    create_table :stades do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    change_table :matches do |t|
      t.references :stade, foreign_keys: true, index: true, null: false
    end
  end
end
