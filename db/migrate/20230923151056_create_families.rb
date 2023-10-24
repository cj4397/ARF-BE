class CreateFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :families do |t|
      t.text :person
      t.text :partner
      t.text :children
      t.integer :parentId
      t.text :family_history
      t.references :clan, foreign_key:true
      t.references :child, foreign_key:true
      t.references :family_edit, foreign_key:true
      t.references :family_delete, foreign_key:true

      t.timestamps
    end
  end
end
