class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :partner
      t.string :status
      t.text :children
      t.boolean :has_children
 
      t.references :person, foreign_key:true
      t.references :partner_edit, foreign_key:true
      t.references :partner_delete, foreign_key:true

      t.timestamps
    end
  end
end
