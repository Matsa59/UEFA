class AddAddressToStades < ActiveRecord::Migration
  def change
    change_table :stades do |t|
      t.string :address, null: false, :after => :name
    end
  end
end
