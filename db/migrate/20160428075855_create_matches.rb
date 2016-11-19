class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :begin_at

      t.references :local_country, references: :country, index: true
      t.references :guess_country, references: :country, index: true

      t.timestamps null: false
    end
  end
end
