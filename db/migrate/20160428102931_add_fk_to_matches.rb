class AddFkToMatches < ActiveRecord::Migration
  def change
    add_foreign_key :matches, :countries, column: :local_country_id
    add_foreign_key :matches, :countries, column: :guess_country_id

  end
end
