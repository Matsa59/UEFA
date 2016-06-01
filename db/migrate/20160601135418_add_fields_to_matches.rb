class AddFieldsToMatches < ActiveRecord::Migration
  def change
    change_table :matches do |t|
      t.integer :local_country_score
      t.integer :guess_country_score
    end
  end
end
