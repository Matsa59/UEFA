class AddDescToCountries < ActiveRecord::Migration
  def change
    change_table :countries do |t|
      t.string :description, null: false, :after => :name
    end
  end
end
