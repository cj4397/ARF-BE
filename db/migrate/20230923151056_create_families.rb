class CreateFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :families do |t|
      t.text :person
      t.text :family_history
      t.references :clan, foreign_key:true

      t.timestamps
    end
  end
end
