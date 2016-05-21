class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    change_table :matches do |t|
      t.references :pool, foreign_keys: true, index: true, :null => false
    end
  end
end
