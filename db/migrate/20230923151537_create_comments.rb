class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_detail
      t.text :details
      t.references :history_edit, foreign_key:true
      t.references :clan_details_edit, foreign_key:true
      t.references :family_edit, foreign_key:true
      t.references :partner_edit, foreign_key:true
      t.references :family_delete, foreign_key:true
      t.references :partner_delete, foreign_key:true
      t.references :clan_history_delete, foreign_key:true
      t.references :family_history_delete, foreign_key:true
      t.references :memory_delete, foreign_key:true

      t.timestamps
    end
  end
end
