class AddCustomFieldsUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.integer :zip_code, null: false
      t.string :phone_number, null: false
    end
  end
end
